abstract class Mapper<A, B> {
  B map(A data);

  Iterable<B> mapIterable(Iterable<A> iterable) => iterable.map(map);
}
