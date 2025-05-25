Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FC11C4A0A
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748215380; cv=none; b=W+AloJ3H2qAkcjccHvegCGcfnpMLh3AjGplBa+TQqsE9GLq33nN2erftmEL5eTthvkdm21+KsORk8XQoIpsCiPQsvSLRQWT4wn3ZBgMXN/zVdbkymXgHqVPZjNxDpOuSc7N8M4tXH9I0qgnGAj5AJ8FrhhSUssT+JOxjCyji76w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748215380; c=relaxed/simple;
	bh=BTXq5ppOYZwKsuxC7izezGj/gziHOVpG26gPsd1eN7k=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=n0zQ6QKeiZefoWCqJT31DmZ8CRRqVsrplIctQfa3BBJEpaDTXX3nU9zshuNxcIv6UOoL3+aXB2VgcwS6i7egeJRaUcBhH0QqNorPzAhMv5ov6BWKptYDjZ0gVfXyXfBNOgxcubegQGGESjNiMe0+lTonsVzxFuyuh/Mc9BZ2doo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=RLeFDKFe; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="RLeFDKFe"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id EA0FF240106
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:22:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1748215370; bh=BTXq5ppOYZwKsuxC7izezGj/gziHOVpG26gPsd1eN7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=RLeFDKFeaQlAxMGTXgCCCrieoJsSsVSksBmg8YRNoaroZFUovBYHeQeOi1zfr+YdT
	 WV3cD1rcGL1v8CLQt6nYK7YxTDglBJH0VO9pd3ZB48yx9NPdkwOITiUDm973MJzMvw
	 mK2+vVFYCPZLdoz2S4suIGFytcO6B/hUUQtME9icvwBiVL9ZzmuqMCZAYKOdPSVmTt
	 2nns5Ygd/hzf+ujTFDTVv2T7l92N6pj+t0bTu6Zb96pQAYjWKx3jHeUojk1DNLyU+z
	 yPCUwAVwpp9EKbZrfEEXl9nu02ojkHFBCUUp45V+K/ipqMgZo5pTHN6vCJq0yrVsWf
	 cRWW801l6zqjw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4b5FLH3Wksz6tvh;
	Mon, 26 May 2025 01:22:47 +0200 (CEST)
References: <20250524192232.705860-1-remo@buenzli.dev>
 <20250524192232.705860-4-remo@buenzli.dev>
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Dirk Behme
 <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 3/9] rust: device: Add property_present() to FwNode
Date: Sun, 25 May 2025 23:19:54 +0000
In-reply-to: <20250524192232.705860-4-remo@buenzli.dev>
Message-ID: <874ix8num4.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Remo Senekowitsch <remo@buenzli.dev> writes:

> The new FwNode abstraction will be used for accessing all device
> properties, so it must have the property_present method.
>
> It's possible to duplicate the methods on the device itself, but since
> some of the methods on Device would have different type sigatures as
> the ones on FwNode, this would only lead to inconsistency and confusion.
> So, in the future, property_perent will be removed from Device. However,

Hi Remo!

Spotted a typo, property_present.

--
C. Mitrodimas

> there's a user about to be merged, so the method is left to make merging
> easier.
>
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/property.rs | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> index ca525ed0e8e8f..71a0605b8ecad 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -6,7 +6,7 @@
>  
>  use core::ptr;
>  
> -use crate::{bindings, types::Opaque};
> +use crate::{bindings, str::CStr, types::Opaque};
>  
>  /// A reference-counted fwnode_handle.
>  ///
> @@ -31,6 +31,12 @@ impl FwNode {
>      pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
>          self.0.get()
>      }
> +
> +    /// Checks if property is present or not.
> +    pub fn property_present(&self, name: &CStr) -> bool {
> +        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
> +        unsafe { bindings::fwnode_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
> +    }
>  }
>  
>  // SAFETY: Instances of `FwNode` are always reference-counted.

