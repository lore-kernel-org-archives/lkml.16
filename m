Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96011F5437
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 07:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751699852; cv=none; b=ukEbv3WtqZCvWWo260BSIjXknv7FYKH8NPINDMNHksPizwFWpDf0uzlD2pPKG9eODKZiCUUAzZapJmN/XeX93TUkdivSuFGSbQR3bbnICbaEllR8R14RS0HC5LMY8n41I29mKf4bvxJDjo5Bw+37ySnXJoi+LWsBJEcZyJiO7sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751699852; c=relaxed/simple;
	bh=Q/gP1ee5h4zuoHWtTz9IDaf9f/qI6rqm7Uef+xT279w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Kw4sUvG9HDs594jR8kqzhgvhxnahVuYywZgCAvDSsVwAuK+cvOitdUqeMGIVyFHcZk3O0auK7fVigZ8svIBdvGZ7QSySm/Oej16/jbAGVqlHtffx4m6jxFTy97lVt7FyU9jF4/e9ablccx4FVaFoQkUke1BGIvD2iv6dwet/qZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=IINvfj+C; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=A0EWOTTC; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="IINvfj+C";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="A0EWOTTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751699841; x=1752304641;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=0dF08nZ5AD94cqmTG2oD0kbPc0AyPxw2HHR1baJXYOw=;
	b=IINvfj+C2bWDaUPKaeQ1dp124mX5RlbM2RmbMnDyDotbJvcQNyb/bDNcgdB8yTEETYpj1kKAV/3QM
	 I29dOHvkouxSZI5kfF254SmD0bTUS3kN+91/2C1HyehRGePIBjZm6qJMR0xlrZVmvbbWiLN8c3QUXy
	 Ib66Zyg/eLvppeS70jCNdgtsH0UnNpaXhDX8Pdg/rAkhWJJVticB5XJUHhk9k5LsUwaAZWFkD5r2E0
	 x6d9XvEi9EN4E5W0cITxN80BplO6UkfVuC2BFdClu1ldQARZl9dMYkXrvQt/oU/g3fAqv3f4WvUzy0
	 4tVI7Kjs9kMYbqBwqLySjJgc6VX+yYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751699841; x=1752304641;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=0dF08nZ5AD94cqmTG2oD0kbPc0AyPxw2HHR1baJXYOw=;
	b=A0EWOTTCHcbh2Whz4NRwaAMrW8SmMbqKP0RmpN38wNQC1MDBxxPf59eA8ZD4nsnqLfeJvMVUcbTjQ
	 nm3e4qWCw==
X-HalOne-ID: 16b71226-5970-11f0-b992-f78b1f841584
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 16b71226-5970-11f0-b992-f78b1f841584;
	Sat, 05 Jul 2025 07:17:20 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v10 3/4] rust: add support for NUMA ids in allocations
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aGfx6c72FgHn3NNW@pollux>
Date: Sat, 5 Jul 2025 09:17:10 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5BDED328-4E79-4E39-95C3-21C3FB80593C@konsulko.se>
References: <20250702160758.3609992-1-vitaly.wool@konsulko.se>
 <20250702160910.3610134-1-vitaly.wool@konsulko.se> <aGfx6c72FgHn3NNW@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jul 4, 2025, at 5:23=E2=80=AFPM, Danilo Krummrich <dakr@kernel.org> =
wrote:
>=20
> On Wed, Jul 02, 2025 at 06:09:10PM +0200, Vitaly Wool wrote:
>> /// The kernel's [`Allocator`] trait.
>> ///
>> /// An implementation of [`Allocator`] can allocate, re-allocate and =
free memory buffers described
>> @@ -148,7 +172,7 @@ pub unsafe trait Allocator {
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
>> @@ -159,7 +183,41 @@ fn alloc(layout: Layout, flags: Flags) -> =
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
>> +    fn alloc_node(
>> +        layout: Layout,
>> +        flags: Flags,
>> +        nid: NumaNode,
>> +    ) -> Result<NonNull<[u8]>, AllocError> {
>> +        // SAFETY: Passing `None` to `realloc_node` is valid by its =
safety requirements and
>> +        // asks for a new memory allocation.
>> +        unsafe { Self::realloc_node(None, layout, =
Layout::new::<()>(), flags, nid) }
>> +    }
>> +
>> +    /// Re-allocate an existing memory allocation to satisfy the =
requested `layout` and
>> +    /// a specific NUMA node request to allocate the memory for.
>> +    ///
>> +    /// Systems employing a Non Uniform Memory Access (NUMA) =
architecture contain collections of
>> +    /// hardware resources including processors, memory, and I/O =
buses, that comprise what is
>> +    /// commonly known as a NUMA node.
>> +    ///
>> +    /// `nid` stands for NUMA id, i. e. NUMA node identifier, which =
is a non-negative
>> +    /// integer if a node needs to be specified, or NO_NODE if the =
caller doesn't care.
>>     ///
>>     /// If the requested size is zero, `realloc` behaves equivalent =
to `free`.
>>     ///
>> @@ -191,13 +249,27 @@ fn alloc(layout: Layout, flags: Flags) -> =
Result<NonNull<[u8]>, AllocError> {
>>     ///   and old size, i.e. `ret_ptr[0..min(layout.size(), =
old_layout.size())] =3D=3D
>>     ///   p[0..min(layout.size(), old_layout.size())]`.
>>     /// - when the return value is `Err(AllocError)`, then `ptr` is =
still valid.
>> -    unsafe fn realloc(
>> +    unsafe fn realloc_node(
>>         ptr: Option<NonNull<u8>>,
>>         layout: Layout,
>>         old_layout: Layout,
>>         flags: Flags,
>> +        nid: NumaNode,
>>     ) -> Result<NonNull<[u8]>, AllocError>;
>>=20
>> +    /// Re-allocate an existing memory allocation to satisfy the =
requested `layout`. This
>> +    /// function works exactly as realloc_node() but it doesn't give =
the ability to specify
>> +    /// the NUMA node in the call.
>> +    unsafe fn realloc(
>> +        ptr: Option<NonNull<u8>>,
>> +        layout: Layout,
>> +        old_layout: Layout,
>> +        flags: Flags,
>> +    ) -> Result<NonNull<[u8]>, AllocError> {
>> +        // SAFETY: guaranteed by realloc_node()
>> +        unsafe { Self::realloc_node(ptr, layout, old_layout, flags, =
NumaNode::NO_NODE) }
>> +    }
>=20
> I think Alice suggested to just drop alloc_node() and realloc_node() =
and make
> alloc() and realloc() always take a NumaNode argument.
>=20
> I don't have a strong preference, but keeping only alloc() and =
realloc() for
> seems indeed simpler, so let's remove the _node() variants.

I don=E2=80=99t have a strong preference either but if I modify alloc() =
and realloc(), I=E2=80=99ll have to change KVec and KBox in the same =
patch, would that be okay with you?

~Vitaly

<snip>
