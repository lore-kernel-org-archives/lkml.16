Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07E0263C78
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626396; cv=none; b=Gve/iZquFU6K6bjUDTixFYcuhnh94xOgGsES2pGyx0dXhvalHqwF+zqK3IDkUMDF2W2KvCbecMd35EtDgjoADfv1WfbrF2QQVIJiC/DdzNGfKPsFRJauvMAaAYcI1zJ07qvVKlrzQFHj/I9dCgBVZzk/1yLDDjGhqthRqpmt8OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626396; c=relaxed/simple;
	bh=P4tVZMFQeTryqhZfLYxMqp9Mr4yDOpMpRVM0VYHA3no=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T62y7fUN2bqxEB3jEkENMWYbjsFD2M/tsEuGHXFpZ7SCjRkTUVhveW74oO13uscDkcTY36EfB/nTSmyWiXA6rNMbpuDh2IMqCxXOu95bZunlyrGmw55FOcoTOBZc30u2iQVG0dBXkCQ8iX2oLDvjnvFHDRwmBfFMzPg8gvot8zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=cFfCm3H+; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="cFfCm3H+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744626386; x=1744885586;
	bh=yRcvV9zzEHmLeGHD8PYUBkj05ZKHhUmdRnM9Ej07AqI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=cFfCm3H+ah/m7XpakvlzjZYDUWeHuo8MKHfjyXqHxQmqxpC4Fbc1wmLRRf57piRl3
	 wGxxxq92v0lYMoQBmzczq8p6xjv6WIxhWs3FzyZE9XLmRb8JG4GGAmselc6xhUk1Kz
	 fal6DQUoGgbqTXRMqE7/eEKdNelhc4kOvh/NJNN2yK2YU8BIVKlmPFef67HIUDP7VN
	 yQErnhclV7BQCTXW7LiRWYN5vVpxEk7X0u+fG5eEfnUqHHOhbI04/JtQFr07GiR9nO
	 j8RSqYOLMmxix4V+mhXUJldbg+ub7OoB8qScPcRcIDu+8G4c3Zg/1DvAl5fJ7zP/Mb
	 3imHQPMFZ7coQ==
Date: Mon, 14 Apr 2025 10:26:21 +0000
To: Danilo Krummrich <dakr@kernel.org>, bhelgaas@google.com, kwilczynski@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, abdiel.janulgue@gmail.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, daniel.almeida@collabora.com, robin.murphy@arm.com, linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] rust: device: implement impl_device_context_into_aref!
Message-ID: <D96AFO7XG0S5.9YOG2JPIWDIZ@proton.me>
In-Reply-To: <20250413173758.12068-3-dakr@kernel.org>
References: <20250413173758.12068-1-dakr@kernel.org> <20250413173758.12068-3-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 50dc295fd6a4f5a7030fc2aa9d171edef1070374
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Apr 13, 2025 at 7:36 PM CEST, Danilo Krummrich wrote:
> Implement a macro to implement all From conversions of a certain device
> to ARef<Device>.
>
> This avoids unnecessary boiler plate code for every device
> implementation.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

One nit below, with that fixed:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> ---
>  rust/kernel/device.rs   | 21 +++++++++++++++++++++
>  rust/kernel/pci.rs      |  7 +------
>  rust/kernel/platform.rs |  9 ++-------
>  3 files changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 7cb6f0fc005d..26e71224460b 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -279,6 +279,27 @@ macro_rules! impl_device_context_deref {
>      };
>  }
> =20
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! __impl_device_context_into_aref {
> +    ($src:ty, $device:tt) =3D> {
> +        impl core::convert::From<&$device<$src>> for $crate::types::ARef=
<$device> {

Missing `::` in front of `core`.

> +            fn from(dev: &$device<$src>) -> Self {
> +                (&**dev).into()
> +            }
> +        }
> +    };
> +}
> +
> +/// Implement [`core::convert::From`], such that all `&Device<Ctx>` can =
be converted to an
> +/// `ARef<Device>`.
> +#[macro_export]
> +macro_rules! impl_device_context_into_aref {
> +    ($device:tt) =3D> {
> +        kernel::__impl_device_context_into_aref!($crate::device::Core, $=
device);
> +    };
> +}
> +
>  #[doc(hidden)]
>  #[macro_export]
>  macro_rules! dev_printk {

