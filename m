Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61681C75E2;
	Wed, 11 Jun 2025 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643605; cv=none; b=JlLV0f0sTQ0CMab7gxKXNNQ3szLLyk4O9kX8Ol0hDv/tyR/YmM5N6XcJcsS+T6AGahmJ4G0OlNS1GW2ZAdM6d2ztQAId7gkvkIEsyHgzNPvC4GqQ3HHF4m7DN8jC7TswQx9QKHK4Y4m89ieC7BFpHZY3Rg7iN90nxfieqK4QPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643605; c=relaxed/simple;
	bh=Cils+t4tXpM9xsQTP0M+vh+Agy+XAdhQsIrmg6+CAAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUCOkOImHe/9koFQHnfad/vRoqal1BrAW8YRQQEgCjbHMUxH2KUwSJ6jKKQjIE0HXXEquGoBuCMkUwZ1qZaLKKuY3AYAwDKHIG7k+W0M/ru1wD84yFIfXfbsDAUebN1QG+o0jlUrSYiwk5Bf8yuaOKKy9A6e9jup1kA1ZkO/YGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u74OHqHV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u74OHqHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86ADC4CEEE;
	Wed, 11 Jun 2025 12:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749643604;
	bh=Cils+t4tXpM9xsQTP0M+vh+Agy+XAdhQsIrmg6+CAAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u74OHqHVgY+/94y/MwlQuEekVYdz2s+flrZwF8Sr06l5Aq2qkJ3S4ejOfMWdb4rgW
	 4B2mI6AV5rbybxQn2EhEjv9FOSm71dwYUVCm/JPyEDuZzN7s4xpHZFaXa9LSgo1BZK
	 ugirqbR3rP/RoMIC4Y2CrtqrAN+01jCPp2nQHnX+3hMJEq8MdQfVXkEfM8QrEM4nnI
	 31LNCJx5MTKqSC5FMFWU4UgJFnG4CGBhGe3sDvBhaVQgnWB2H6DBpWDb9NxNYqWc+2
	 w5v4DOYRiyicshZWNFojA1q4gsIpt3okUWhQV9iLeJd/uSXffMu5R3cNYsFGAWfWUY
	 KhWQpmqErUXrQ==
Date: Wed, 11 Jun 2025 14:06:38 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 0/9] More Rust bindings for device property reads
Message-ID: <aElxTuk4Nz1qGNpX@cassiopeiae>
References: <20250611102908.212514-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611102908.212514-1-remo@buenzli.dev>

Hi Remo,

On Wed, Jun 11, 2025 at 12:28:59PM +0200, Remo Senekowitsch wrote:

I went through the single patches and found the following issues.

> Remo Senekowitsch (9):
>   rust: device: Create FwNode abstraction for accessing device
>     properties

This patch creates a warning for FwNode::from_raw() to be unused, and needs this
fix:

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 03850b7bb808..82ef54b54f18 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -37,6 +37,7 @@ impl FwNode {
     /// - They relinquish that increment. That is, if there is only one
     ///   increment, callers must not use the underlying object anymore -- it is
     ///   only safe to do so via the newly created `ARef<FwNode>`.
+    #[expect(dead_code)]
     unsafe fn from_raw(raw: *mut bindings::fwnode_handle) -> ARef<Self> {
         // SAFETY: As per the safety requirements of this function:
         // - `NonNull::new_unchecked`:

>   rust: device: Enable accessing the FwNode of a Device
>   rust: device: Move property_present() to FwNode
>   rust: device: Enable printing fwnode name and path

This patch starts using FwNode::from_raw() and hence needs:

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index a5ebadd878d6..4cac335bad78 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -38,7 +38,6 @@ impl FwNode {
     /// - They relinquish that increment. That is, if there is only one
     ///   increment, callers must not use the underlying object anymore -- it is
     ///   only safe to do so via the newly created `ARef<FwNode>`.
-    #[expect(dead_code)]
     unsafe fn from_raw(raw: *mut bindings::fwnode_handle) -> ARef<Self> {
         // SAFETY: As per the safety requirements of this function:
         // - `NonNull::new_unchecked`:

>   rust: device: Introduce PropertyGuard

This patch fails to compile (print macros are not included) and needs the
following change.

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index a10033d310e6..1286669a9a40 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -8,6 +8,7 @@
 
 use crate::{
     bindings,
+    prelude::*,
     str::CStr,
     types::{ARef, Opaque},
 };

>   rust: device: Implement accessors for firmware properties

This patch also fails to compile, throws a warning about transmute() and hence
needs the following change.

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 75621abe8117..fe0c5469a278 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -6,12 +6,12 @@

 use core::{mem::MaybeUninit, ptr};

+use super::private::Sealed;
 use crate::{
     alloc::KVec,
     bindings,
     error::{to_result, Result},
     prelude::*,
-    private::Sealed,
     str::{CStr, CString},
     types::{ARef, Opaque},
 };
@@ -303,7 +303,7 @@ fn read_array_from_fwnode_property<'a>(
                 // `&'a mut [Self]` is sound, because the previous call to a
                 // `fwnode_property_read_*_array` function (which didn't fail)
                 // fully initialized the slice.
-                Ok(unsafe { core::mem::transmute(out) })
+                Ok(unsafe { core::mem::transmute::<&mut [MaybeUninit<Self>], &mut [Self]>(out) })
             }

             fn read_array_len_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<usize> {

>   rust: device: Add child accessor and iterator
>   rust: device: Add property_get_reference_args
>   samples: rust: platform: Add property read examples

In general, please make sure to compile test every patch of a series
individually, not only the entire series.

Otherwise the series looks good. Given that the required fixes are minor, there
is no need for you to send a new version, I can apply those changes why I apply
the patch series.

- Danilo
