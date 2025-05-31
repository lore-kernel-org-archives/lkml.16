Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D1F239E69;
	Sat, 31 May 2025 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694478; cv=none; b=DpZZ6wQuW+7XqXAWr6cwzBoXbrgGfDL258RamJY6GfYEbbzhi580OxjAWHsAGjwnZd2u2oI3wDx9B58v6jnuXs3WD6nRdb+nShR3m2FCv+NxNbaKODNsPIXeMSogPtEgtPWlRIY4iDOHsnY9cU6WxWCSFWezMaiJrHiiGdqAczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694478; c=relaxed/simple;
	bh=IByZ6WlZPwSQbjO0sWO/Yd7IpGttC7CWHDcGNpgLAHQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=tgzXiL991xeQsXhFsPsZwHg1PKv3vXZmizjrgwpj9pHrgG2u0pLzzWQGXMAXLWxdrLhTnmQBCNeZG91joy6FryRNE2Zz3TYZQpdKosp2L1pjAg7ZoRSlfchZiMkSxrXpujnz04d1aGyc9xhLG+ITjS5R0zp1eCixtobZlECjhj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QY8XYYPo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QY8XYYPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA81C4CEE7;
	Sat, 31 May 2025 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694477;
	bh=IByZ6WlZPwSQbjO0sWO/Yd7IpGttC7CWHDcGNpgLAHQ=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=QY8XYYPoDuFzVv7+ImEgRXg/Iw4+7BLUQmjYZHVmLkoU+368yc1XiUb+/HRbja4l4
	 ln2HXMXxYAf+3YOyoaS/C9NnZ2yHZ7XyYNF09NsWBkcxZEIRmWTcn5NOdqN+YhfGs7
	 jHoAKeS2R6UrrS58KKgwg+Tcwhme5Re9hx2tuKx3JC6ryl1NHIOYaNQCwMBjlPJ6es
	 bD6r37B+amwm+5PGX+PDRs4eErkM9FHwgXogo17AzI2WCCF/8xjJcyEIMiD+C7K+Gy
	 IEsYJhafuMqZ01/JqnLcBneEM6DmhSQyxcIWZIm57mnBgrEY08MUu8uuc9r0vk6eO+
	 QledHNfwXlKHA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 14:27:52 +0200
Message-Id: <DAACGEDVW8D4.66KOF7PWD1I0@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Arnd Bergmann" <arnd@arndb.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Lee Jones" <lee@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] rust: miscdevice: adjust the rust_misc_device
 sample to use RegistrationData.
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com> <20250530-b4-rust_miscdevice_registrationdata-v4-3-d313aafd7e59@gmail.com>
In-Reply-To: <20250530-b4-rust_miscdevice_registrationdata-v4-3-d313aafd7e59@gmail.com>

On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
> Add a second mutex to the RustMiscDevice, which is shared between all
> instances of the device using an Arc and the RegistrationData of
> MiscDeviceRegistration.
>
> This is mostly to demonstrate the capability to share data in this way.
>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Two nits below, with those fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> @@ -94,7 +152,6 @@
>  //!   return 0;
>  //! }
>  //! ```
> -

Let's keep this newline.

>  use core::pin::Pin;
> =20
>  use kernel::{

> @@ -193,7 +263,6 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd:=
 u32, arg: usize) -> Result
>          Ok(0)
>      }
>  }
> -

This one too.

---
Cheers,
Benno

>  #[pinned_drop]
>  impl PinnedDrop for RustMiscDevice {
>      fn drop(self: Pin<&mut Self>) {
> @@ -204,7 +273,7 @@ fn drop(self: Pin<&mut Self>) {
>  impl RustMiscDevice {
>      fn set_value(&self, mut reader: UserSliceReader) -> Result<isize> {
>          let new_value =3D reader.read::<i32>()?;
> -        let mut guard =3D self.inner.lock();
> +        let mut guard =3D self.unique.lock();
> =20
>          dev_info!(
>              self.dev,
