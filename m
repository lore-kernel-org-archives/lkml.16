Received: from mailrelay2-3.pub.mailoutpod3-cph3.one.com (mailrelay2-3.pub.mailoutpod3-cph3.one.com [46.30.212.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E54204863
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955386; cv=none; b=duTy4L3nfIbTXxxckN1FvydGljC7Q4tNnHNncAJ8DwOIGYdZp7j0Ofugax+980nb2lT10l55lnAi82R+8/rD/Aiqilr2q8CA3Wh2lp2g0SerDpR7WuY7UzGZQyCBFayUrfCqd7I9tr137oCqzVaKvAy1ree7lanKF+1DYGU1qrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955386; c=relaxed/simple;
	bh=CT3Snx40eh6HnKjAwO9g6zUyVa/HGCyqQm/rD7HSOlk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sM0MXmyKFH1PCaNBCtV0ek4B7X194sB2ytBrpvXcR07/z+IyI4+do9w8THscjzvELHIuG/0WTYeA72QG4AJ+R7cKstc/L91Lz1Z6lQu+sHyJmb7miKKMFo9ZKeCzNO/7UiEWpSVdwOlh8RFYQlwWBVfgM0MSg8ziv0yEK1KKWBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=XfHWg0fJ; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=cKofyBaP; arc=none smtp.client-ip=46.30.212.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="XfHWg0fJ";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="cKofyBaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750955375; x=1751560175;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=Pe7xeslr3EnaI4eQ4G3Fal7OrGAZHQXi7GxA/Z6tTtk=;
	b=XfHWg0fJ2o4Qj61LVARguZS8GfMl6j4JhwJrJrh6JvTe4McQ+XVbFl0NEhyaFU3O3iSzOI9nhOTS2
	 d+ZiJ06ASlW1Wfa5su7ojDGVKLzdl+1RUaek0nN7uklAs3mKvdGfhJRmEKjw+XS5y7yo8n28+UHWD9
	 HQjj0Pu+9g8+wVMX/l9SdkDhGCfJWO4ovD1ej9Jnoar+NRG3OsITcIDLHNRijZJbRqaROCZ4+LSUdn
	 gSULaR3ic+5BdCKTJ+gsiNKbrI8kRrKs2kBArttjXwLWU2JjP/q/LeeOzRBmaZuh5u+U8x6xGix4Rk
	 qa8pcNLyl3M1eU3zvHJ1IYje6W57zpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750955375; x=1751560175;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=Pe7xeslr3EnaI4eQ4G3Fal7OrGAZHQXi7GxA/Z6tTtk=;
	b=cKofyBaPtXskP+rf2X2G0lhLuOIxo8k+IKnJCrRnZz3GEwGrqC6csA0L4RG8DslhJULU8M8M8q1lu
	 RrGRTz/Ag==
X-HalOne-ID: be6172b6-52aa-11f0-9c3a-b37c246f863f
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id be6172b6-52aa-11f0-9c3a-b37c246f863f;
	Thu, 26 Jun 2025 16:29:34 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v4 3/4] rust: support large alignments in allocations
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aF0-tYomGe7nB5vX@pollux>
Date: Thu, 26 Jun 2025 18:29:24 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <72365C10-D984-4BC5-A081-B058C1619D06@konsulko.se>
References: <20250626083516.3596197-1-vitaly.wool@konsulko.se>
 <20250626083642.3596388-1-vitaly.wool@konsulko.se> <aF0-tYomGe7nB5vX@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 26, 2025, at 2:36=E2=80=AFPM, Danilo Krummrich =
<dakr@kernel.org> wrote:
>=20
> On Thu, Jun 26, 2025 at 10:36:42AM +0200, Vitaly Wool wrote:
>> void * __must_check __realloc_size(2)
>> -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
>> +rust_helper_krealloc(const void *objp, size_t new_size, unsigned =
long align, gfp_t flags)
>> {
>> return krealloc(objp, new_size, flags);
>> }
>>=20
>> void * __must_check __realloc_size(2)
>> -rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
>> +rust_helper_kvrealloc(const void *p, size_t size, unsigned long =
align, gfp_t flags)
>> {
>> return kvrealloc(p, size, flags);
>> }
>=20
> I think you forgot to add comments explaining why we have the =
additional
> discarded align argument.
>=20
> Also please keep those helpers as they are. You can write an identical =
inline
> function in Rust that discards the align argument and calls =
bindings::krealloc,
> etc.
>=20
> For instance:
>=20
> unsafe extern "C" fn krealloc_align(
>    ptr: *const c_void,
>    size: usize,
>    _align: c_ulong
>    flags: u32,
> ) -> *mut c_void {
>    bindings::krealloc(ptr, size, flags)
> }
>=20

Ugh. This is indeed a mistake from my side but I don=E2=80=99t quite =
agree with your variant here too.
The thing is that the new patchset has a patch #2 which adds =
kvrealloc_node and realloc_node so this chunk IMO should have looked =
like

-rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
+rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, =
gfp_t flags)
 {
 -      return kvrealloc(p, size, flags);
 +      return kvrealloc_node(p, size, align, flags, NUMA_NO_NODE);

 }

=E2=80=A6exactly like for vmalloc, see also my comment below.

>> diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
>> index 80d34501bbc0..4618c0b79283 100644
>> --- a/rust/helpers/vmalloc.c
>> +++ b/rust/helpers/vmalloc.c
>> @@ -3,7 +3,7 @@
>> #include <linux/vmalloc.h>
>>=20
>> void * __must_check __realloc_size(2)
>> -rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
>> +rust_helper_vrealloc(const void *p, size_t size, unsigned long =
align, gfp_t flags)
>> {
>> - return vrealloc(p, size, flags);
>> + return vrealloc_node(p, size, align, flags, NUMA_NO_NODE);
>> }
>=20
> Same here, just make this a "real" helper for vrealloc_node() and =
create a Rust
> function vrealloc_align() like in the example above.

Wait, why? What=E2=80=99s the use of vrealloc() if it doesn=E2=80=99t =
provide the align functionality that we need?
>=20
>> diff --git a/rust/kernel/alloc/allocator.rs =
b/rust/kernel/alloc/allocator.rs
>> index aa2dfa9dca4c..a0d78c497974 100644
>> --- a/rust/kernel/alloc/allocator.rs
>> +++ b/rust/kernel/alloc/allocator.rs
>> @@ -58,7 +58,7 @@ fn aligned_size(new_layout: Layout) -> usize {
>> ///
>> /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
>> struct ReallocFunc(
>> -    unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> =
*mut crate::ffi::c_void,
>> +    unsafe extern "C" fn(*const crate::ffi::c_void, usize, usize, =
u32) -> *mut crate::ffi::c_void,
>=20
> Should be c_ulong instead of usize.
>=20

Noted.

>> );
>>=20
>> impl ReallocFunc {
>> @@ -110,7 +110,7 @@ unsafe fn call(
>>         // - Those functions provide the guarantees of this function.
>>         let raw_ptr =3D unsafe {
>>             // If `size =3D=3D 0` and `ptr !=3D NULL` the memory =
behind the pointer is freed.
>> -            self.0(ptr.cast(), size, flags.0).cast()
>> +            self.0(ptr.cast(), size, layout.align(), flags.0).cast()
>>         };
>>=20
>>         let ptr =3D if size =3D=3D 0 {
>> @@ -152,12 +152,6 @@ unsafe fn realloc(
>>         old_layout: Layout,
>>         flags: Flags,
>>     ) -> Result<NonNull<[u8]>, AllocError> {
>> -        // TODO: Support alignments larger than PAGE_SIZE.
>> -        if layout.align() > bindings::PAGE_SIZE {
>> -            pr_warn!("Vmalloc does not support alignments larger =
than PAGE_SIZE yet.\n");
>> -            return Err(AllocError);
>> -        }
>> -
>>         // SAFETY: If not `None`, `ptr` is guaranteed to point to =
valid memory, which was previously
>>         // allocated with this `Allocator`.
>>         unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, =
flags) }
>> @@ -176,12 +170,6 @@ unsafe fn realloc(
>>         old_layout: Layout,
>>         flags: Flags,
>>     ) -> Result<NonNull<[u8]>, AllocError> {
>> -        // TODO: Support alignments larger than PAGE_SIZE.
>> -        if layout.align() > bindings::PAGE_SIZE {
>> -            pr_warn!("KVmalloc does not support alignments larger =
than PAGE_SIZE yet.\n");
>> -            return Err(AllocError);
>> -        }
>=20
> Didn't you propose to use VREALLOC if layout.align() > =
bindings::PAGE_SIZE?
>=20

I did, and this is what happens on the C side now, please see the #2 =
patch in series.
I think it=E2=80=99s better this way because of uniformity but I don=E2=80=
=99t have a strong opinion on this.

>>         // SAFETY: If not `None`, `ptr` is guaranteed to point to =
valid memory, which was previously
>>         // allocated with this `Allocator`.
>>         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, =
flags) }
>=20

