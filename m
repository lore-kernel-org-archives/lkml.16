Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BE28821
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368761; cv=none; b=fqSVahQJxI1LCSl+yV2gYQ0ArGSw83Q2yvXtJBbgYtkymmYjhGIk8lpcGKslqK7BHPQ5nH3TzHgKgAqiur8WeOCG4FrI/BPAwY8YwVszOin7qllXkCWTkAge7ZknX2l/AnlvKga6FEJFjNIUYNS8ukX7KR2i+Zx73gpqnAlQ+TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368761; c=relaxed/simple;
	bh=Wi3qTUOqLTwu6EydYZdUzDHX2+YaRYTHjrIsTbVXha8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rdRrdAYI+br+Fnq8I4fC4kA/KtXJpMuboGigH7PUxf9OzbxEWmChZO5MbGNzmIt3R0zXrChBSMHIXDKbggJZ/ekCir0oQdGFIltL13e1gnoO4OmgAIbPF9LTGOKqYfDCOoca10u/kGBxeoRqwV0F9hcPFMTKZcVDdVuI5Y7ASyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=DnPyqWNv; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=IMDbMUQ7; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="DnPyqWNv";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="IMDbMUQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751368756; x=1751973556;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=DHXuxV40u1ZYjDXLBVQbXs11RHOmrGLB2bnqKxDAyss=;
	b=DnPyqWNviCmpJZ2Hfth/ae8KzTc8bC9btMPr1I8VVD/4t0UE+fWAzDmTpnpribFRkeG6dMqpB7JWX
	 dwyZf3PS8aWEGKU2C5sIVsSLGX8+xpPAfnrf1Sf//Ca8AGbqgJXJ0PLMRD7etZhKTr5tGWgdom9219
	 0AbgSZHChHYuFqn04J1SX4IpA6r4hfpr3Mq9KFCmlroV5wJhhEaBattoEIQQ/swKgW2vbKrCH8YNgh
	 T/SIW7bykAwD16e+KP6UADGr28leGRSjPPx4iWEcC9G1FXuGn1uQ0CVR5P502IT3jlJUUqRZ+z78al
	 Pvpb0LtmPdW1WzkiOQpTFsMzeNcs81Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751368756; x=1751973556;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=DHXuxV40u1ZYjDXLBVQbXs11RHOmrGLB2bnqKxDAyss=;
	b=IMDbMUQ7RkW5LhtaMJhpYbNC1TMzZWvyW51Z3IMABcj6SDyJ7yUS5UO2ltw2SrY9SaFjYYBm8VAwY
	 Frwzcq7DA==
X-HalOne-ID: 393bfb6b-566d-11f0-ab17-85eb291bc831
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 393bfb6b-566d-11f0-ab17-85eb291bc831;
	Tue, 01 Jul 2025 11:19:16 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v9 3/4] rust: add support for NUMA ids in allocations
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aGO5qadROziFuO35@google.com>
Date: Tue, 1 Jul 2025 13:19:06 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D58CB40-CB1C-47A2-BB71-5C32B3609AE0@konsulko.se>
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
 <20250630221640.3325306-1-vitaly.wool@konsulko.se>
 <aGO5qadROziFuO35@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jul 1, 2025, at 12:34=E2=80=AFPM, Alice Ryhl <aliceryhl@google.com> =
wrote:
>=20
> On Tue, Jul 01, 2025 at 12:16:40AM +0200, Vitaly Wool wrote:
>> Add a new type to support specifying NUMA identifiers in Rust
>> allocators and extend the allocators to have NUMA id as a
>> parameter. Thus, modify ReallocFunc to use the new extended realloc
>> primitives from the C side of the kernel (i. e.
>> k[v]realloc_node_align/vrealloc_node_align) and add the new function
>> alloc_node to the Allocator trait while keeping the existing one
>> (alloc) for backward compatibility.
>>=20
>> This will allow to specify node to use for allocation of e. g.
>> {KV}Box, as well as for future NUMA aware users of the API.
>>=20
>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>=20
> My main feedback is that we should consider introducing a new trait
> instead of modifying Allocator. What we could do is have a =
NodeAllocator
> trait that is a super-trait of Allocator and has additional methods =
with
> a node parameter.
>=20
> A sketch:
>=20
> pub unsafe trait NodeAllocator: Allocator {
>    fn alloc_node(layout: Layout, flags: Flags, nid: NumaNode)
>                -> Result<NonNull<[u8]>, AllocError>;
>=20
>    unsafe fn realloc_node(
>        ptr: Option<NonNull<u8>>,
>        layout: Layout,
>        old_layout: Layout,
>        flags: Flags,
>        nid: NumaNode,
>    ) -> Result<NonNull<[u8]>, AllocError>;
> }
>=20
> By doing this, it's possible to have allocators that do not support
> specifying the numa node which only implement Allocator, and to have
> other allocators that implement both Allocator and NumaAllocator where
> you are able to specify the node.
>=20
> If all allocators in the kernel support numa nodes, then you can =
ignore
> this.

This is an elegant solution indeed but I think that keeping the existing =
approach goes better with the overall kernel trend of having better NUMA =
support. My point is, if we add NodeAllocator as a super-trait and in a =
foreseeable future all the Rust allocators will want/be required to =
support NUMA (which is likely to happen), we=E2=80=99ll have to =
=E2=80=9Cflatten=E2=80=9D the traits and effectively go back to the =
approach expressed in this patch.

>> +/// Non Uniform Memory Access (NUMA) node identifier
>> +#[derive(Clone, Copy, PartialEq)]
>> +pub struct NumaNode(i32);
>> +
>> +impl NumaNode {
>> +    /// create a new NUMA node identifer (non-negative integer)
>> +    /// returns EINVAL if a negative id or an id exceeding =
MAX_NUMNODES is specified
>> +    pub fn new(node: i32) -> Result<Self> {
>> +        // SAFETY: MAX_NUMNODES never exceeds 2**10 because =
NODES_SHIFT is 0..10
>> +        if node < 0 || node >=3D bindings::MAX_NUMNODES as i32 {
>> +            return Err(EINVAL);
>> +        }
>> +        Ok(Self(node))
>> +    }
>> +}
>> +
>> +/// Specify necessary constant to pass the information to Allocator =
that the caller doesn't care
>> +/// about the NUMA node to allocate memory from.
>> +pub mod numa {
>> +    use super::NumaNode;
>> +
>> +    /// No preference for NUMA node
>> +    pub const NUMA_NO_NODE: NumaNode =3D =
NumaNode(bindings::NUMA_NO_NODE);
>> +}
>=20
> Instead of using a module, you can make it an associated constant of =
the
> struct.
>=20
> impl NumaNode {
>    pub const NO_NODE: NumaNode =3D NumaNode(bindings::NUMA_NO_NODE);
> }
>=20
> This way you can access the constant as NumaNode::NO_NODE.

Thanks, noted.

>=20
>> /// The kernel's [`Allocator`] trait.
>> ///
>> /// An implementation of [`Allocator`] can allocate, re-allocate and =
free memory buffers described
>> @@ -148,7 +175,7 @@ pub unsafe trait Allocator {
>>     ///
>>     /// When the return value is `Ok(ptr)`, then `ptr` is
>>     /// - valid for reads and writes for `layout.size()` bytes, until =
it is passed to
>> -    ///   [`Allocator::free`] or [`Allocator::realloc`],
>> +    ///   [`Allocator::free`], [`Allocator::realloc`] or =
[`Allocator::realloc_node`],
>>     /// - aligned to `layout.align()`,
>>     ///
>>     /// Additionally, `Flags` are honored as documented in
>> @@ -159,7 +186,38 @@ fn alloc(layout: Layout, flags: Flags) -> =
Result<NonNull<[u8]>, AllocError> {
>>         unsafe { Self::realloc(None, layout, Layout::new::<()>(), =
flags) }
>>     }
>>=20
>> -    /// Re-allocate an existing memory allocation to satisfy the =
requested `layout`.
>> +    /// Allocate memory based on `layout`, `flags` and `nid`.
>> +    ///
>> +    /// On success, returns a buffer represented as `NonNull<[u8]>` =
that satisfies the layout
>> +    /// constraints (i.e. minimum size and alignment as specified by =
`layout`).
>> +    ///
>> +    /// This function is equivalent to `realloc_node` when called =
with `None`.
>> +    ///
>> +    /// # Guarantees
>> +    ///
>> +    /// When the return value is `Ok(ptr)`, then `ptr` is
>> +    /// - valid for reads and writes for `layout.size()` bytes, =
until it is passed to
>> +    ///   [`Allocator::free`], [`Allocator::realloc`] or =
[`Allocator::realloc_node`],
>> +    /// - aligned to `layout.align()`,
>> +    ///
>> +    /// Additionally, `Flags` are honored as documented in
>> +    /// =
<https://docs.kernel.org/core-api/mm-api.html#mm-api-gfp-flags>.
>> +    fn alloc_node(layout: Layout, flags: Flags, nid: NumaNode)
>> +                -> Result<NonNull<[u8]>, AllocError> {
>=20
> I don't think this is how rustfmt would format this. Can you run =
rustfmt
> on your patch?
>=20
>=20
Will do, thanks.

~Vitaly

