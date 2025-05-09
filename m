Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425E21ADAB;
	Fri,  9 May 2025 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827343; cv=pass; b=L7zRzMtIj9BWzKAt2aw47vfjqOhFjv/vctbiy4iB6err+zXQbM3tUQP7fCxPuyFglH/oz7WZGedTR0Zuyn47AIacL6l3b/BQcBf2XiLty6dH4h6GsMjCijsb7wAaut/5+ledNlYCKjyRj2AormRwrZ2AgYGNa6cDQoRCD+ko8LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827343; c=relaxed/simple;
	bh=abXm0HE6er68zVYgwFTA1GAphj23JnOBQ9gx5P+1GEo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JXphyOvWzEh4x5qQhDk2w/E4otwAY/s0PFqDQXTZBtn04LJa9bMgkg6wmrN0O2d0Fu6G0GuXcjJVSpyZ6xCFc3GPrIEWeAP6P0XCPWOYUIm+SJ1oUEfFPVMGlt1VxW1PBmCDgdavn/G2Ru5ZeH+GkZTCChcYD3pgjAgOFPu/mjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=G4ko6ZRc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="G4ko6ZRc"
ARC-Seal: i=1; a=rsa-sha256; t=1746827286; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X+ouvPLprLZlDjtU+xaaGX8yzdSw8jQtK38tEW9MWcU2o2blWfZrHoW87C23lA8Px0DMAtquinNVe2nNFXMSjzB+jboi3AdKw5zPTwgaIsrrl/8AfM15FAK38fvb9c+84FqsH30Zhhfn4NhoFxFBwEOT510X0bO/Gp0dkSYzzaM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746827286; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X6cgvJS2QbWqSUKHmAdDovEvM2ZYY2qcB/moWbYd/XE=; 
	b=Y3kOhpyuCCyMYr6aqqr11zidXflcatTMIrwGcIM4myD641kpYgS8gqOL/Fso1ij4QaMJKMZp8mDrqS0UglPTj8M4eDUXRXtMdgaUwpwWIjywx+Ecbjir6o3O2I/ECNDosTVduxURjviCUrWyBXL9xlyIgO1tKejzAAhG+5iqX6M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746827286;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=X6cgvJS2QbWqSUKHmAdDovEvM2ZYY2qcB/moWbYd/XE=;
	b=G4ko6ZRcGZe2Rbx4oMFderu5UzXTUmDUWpl85brNcnSMyv3N8XFRqyPiBC+qttJ2
	OvP4aUbTRL0AfvUf0Jo1CjmYKvwuohw1s0eP7bX6mMqi13RZAuEG6eAbKMaEHMQDJFj
	wp927vVWxQrtgckbIWyQnDbmDwW6/DP0e0Quo97U=
Received: by mx.zohomail.com with SMTPS id 1746827283614312.2088686696102;
	Fri, 9 May 2025 14:48:03 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH 4/4] rust: drm: gem: Implement AlwaysRefCounted for all
 gem objects automatically
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250501183717.2058109-5-lyude@redhat.com>
Date: Fri, 9 May 2025 18:47:46 -0300
Cc: dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Asahi Lina <lina@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <53D76D55-81EA-46F5-B125-B85BB9AFE269@collabora.com>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-5-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Lyude,

> On 1 May 2025, at 15:33, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Currently we are requiring AlwaysRefCounted in most trait bounds for =
gem
> objects, and implementing it by hand for our only current type of gem
> object. However, all gem objects use the same functions for reference
> counting - and all gem objects support reference counting.
>=20
> We're planning on adding support for shmem gem objects, let's move =
this
> around a bit by instead making IntoGEMObject require AlwaysRefCounted =
as a
> trait bound, and then provide a blanket AlwaysRefCounted =
implementation for
> any object that implements IntoGEMObject so all gem object types can =
use
> the same AlwaysRefCounted implementation. This also makes things less
> verbose by making the AlwaysRefCounted trait bound implicit for any
> IntoGEMObject bound.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/gem/mod.rs | 47 +++++++++++++++++++-------------------
> 1 file changed, 24 insertions(+), 23 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 55b2f1d056c39..929f6c9718362 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -10,7 +10,7 @@
>     drm::driver::{AllocImpl, AllocOps},
>     error::{to_result, Result},
>     prelude::*,
> -    types::{ARef, Opaque},
> +    types::{ARef, AlwaysRefCounted, Opaque},
> };
> use core::{mem, ops::Deref, ptr, ptr::NonNull};
>=20
> @@ -36,7 +36,7 @@ fn close(
> }
>=20
> /// Trait that represents a GEM object subtype
> -pub trait IntoGEMObject: Sized + super::private::Sealed {
> +pub trait IntoGEMObject: Sized + super::private::Sealed + =
AlwaysRefCounted {
>     /// Owning driver for this type
>     type Driver: drm::Driver;
>=20
> @@ -52,6 +52,26 @@ pub trait IntoGEMObject: Sized + =
super::private::Sealed {
>     unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> =
&'a Self;
> }
>=20
> +// SAFETY: All gem objects are refcounted.
> +unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees =
that the refcount is non-zero.
> +        unsafe { bindings::drm_gem_object_get(self.as_gem_obj()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: We either hold the only refcount on `obj`, or one =
of many - meaning that no one
> +        // else could possibly hold a mutable reference to `obj` and =
thus this immutable reference
> +        // is safe.
> +        let obj =3D unsafe { obj.as_ref() }.as_gem_obj();
> +
> +        // SAFETY:
> +        // - The safety requirements guarantee that the refcount is =
non-zero.
> +        // - We hold no references to `obj` now, making it safe for =
us to potentially deallocate it.
> +        unsafe { bindings::drm_gem_object_put(obj) };
> +    }
> +}
> +
> /// Trait which must be implemented by drivers using base GEM objects.
> pub trait DriverObject: BaseDriverObject<Object<Self>> {
>     /// Parent `Driver` for this object.
> @@ -110,10 +130,7 @@ unsafe fn as_ref<'a>(self_ptr: *mut =
bindings::drm_gem_object) -> &'a Self {
> }
>=20
> /// Base operations shared by all GEM object classes
> -pub trait BaseObject
> -where
> -    Self: crate::types::AlwaysRefCounted + IntoGEMObject,
> -{
> +pub trait BaseObject: IntoGEMObject {
>     /// Returns the size of the object in bytes.
>     fn size(&self) -> usize {
>         // SAFETY: `self.into_gem_obj()` is guaranteed to be a pointer =
to a valid `struct
> @@ -175,7 +192,7 @@ fn create_mmap_offset(&self) -> Result<u64> {
>     }
> }
>=20
> -impl<T> BaseObject for T where Self: crate::types::AlwaysRefCounted + =
IntoGEMObject {}
> +impl<T: IntoGEMObject> BaseObject for T {}
>=20
> /// A base GEM object.
> ///
> @@ -269,22 +286,6 @@ extern "C" fn free_callback(obj: *mut =
bindings::drm_gem_object) {
>     }
> }
>=20
> -// SAFETY: Instances of `Object<T>` are always reference-counted.
> -unsafe impl<T: DriverObject> crate::types::AlwaysRefCounted for =
Object<T> {
> -    fn inc_ref(&self) {
> -        // SAFETY: The existence of a shared reference guarantees =
that the refcount is non-zero.
> -        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
> -    }
> -
> -    unsafe fn dec_ref(obj: NonNull<Self>) {
> -        // SAFETY: `obj` is a valid pointer to an `Object<T>`.
> -        let obj =3D unsafe { obj.as_ref() };
> -
> -        // SAFETY: The safety requirements guarantee that the =
refcount is non-zero.
> -        unsafe { bindings::drm_gem_object_put(obj.as_raw()) }
> -    }
> -}
> -
> impl<T: DriverObject> super::private::Sealed for Object<T> {}
>=20
> impl<T: DriverObject> Deref for Object<T> {
> --=20
> 2.48.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

