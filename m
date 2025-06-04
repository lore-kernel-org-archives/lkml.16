Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99528D83C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030043; cv=none; b=ApeU4vIfmUeppcHknaA6L0vezgT1yXD1OBpYK543BzOP9Jm2xf5ksty0iQnki2U29GNBB37d+P8DLqa9dkTRl3/HsJwZPyeRHto7ZUh1tHNVMXjGFaxHNExa/SrThKBknYRsmTD7xDNeYy0CAr3gr/3EkCAyTOW/cD4dDz7U3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030043; c=relaxed/simple;
	bh=2AruANEOT2TfaHViGN/mXT/ZeJRHo2KXBQ+B3XqP5g0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I2P3cMnvshAKvIDKvBypDxCt70Fqvkm6HMappXyJcmBlc55buU8LXcVgoIHiFdv8ATpobfDnEoeAVJEChilTFrlPLd22xaL3ZW55uLtOhIwaimOTnLXJSxrGGgLNZjNmTuqW0aB/9Qlefk7ZVnCZEtul/xlKzbUEphCdOauLE30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UFf6Wc6I; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UFf6Wc6I"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso3454092f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749030040; x=1749634840; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7WJDavWNIrVWIggT8ORRLc16fn6NWCVuLOAw9yDBto=;
        b=UFf6Wc6IrhVLIka4adYEGE79bXgEvAIZC1oO+cn6HiFr0X8kZYUxjC9KCoGah7WN6s
         3FtDCoR0wtsm0vvNaat+gxS0BfxeEK7bn5UDz4bFHpWXJ17bMY84UJ5l0tSMGhrbB+49
         hf/FLMeBhHMNBoApn2tnnZWHvr3bBwBYnPyt5gtizYUloL3j90x7ZDhCcAVO/0PVD8CE
         OvShFtS5RajqXI2ZbikYViEhvn5OxsIjBJvKZJp4u3ekXEf5oNUosFg0Kp/h7kpNcFVg
         u473UYKnuMjAQbPZA4iQDyB9bVGg5juZ/NjJ2jinXbozLkm8rp0dXJKrtiLeuK+30Evd
         oBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030040; x=1749634840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7WJDavWNIrVWIggT8ORRLc16fn6NWCVuLOAw9yDBto=;
        b=nEfZGWM7sWFAGa12Kp6Q97dQRrjaRgH0Ddg36E4Nz+C1HaOrk4TJDHJAN8jmK4iICL
         edkitdKVeKHk0siI1tJo2bi+R7JEbJqJ1JtZPg1dftM2d+5oVntdpo6DNBIHw1v7GhUA
         lDidTNvGL5rLmrMNDp8ELFNtg3KJ5aLRqjdROk7i+2ocCoxjI89bd4mf3DNUwF3+tAaM
         QBB7SnAr+zjpTnmV+sbwduc9Y0rhge3EfvLSG8g5FI/yZlsg/FoiGJwmDEOtOnm+T/Fj
         FUyzEEgVqQo9LmcyBOvpRRl75M2ttIthVyPKe9ZmFt8QvRfWQgfraQMun4m53GXhkIHN
         1HkA==
X-Forwarded-Encrypted: i=1; AJvYcCXIP+Ze/oF9FgoCPN9L/baC3DmlRrXXAcZ9vhdf77O7e6mdhRr2qemapKvFMQPTvhk0pizy88se3gVx4EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCT5yWSQ+odqLpb54QcYgU9FyvO+mg01XmjRbt0DXpSF6fGMnP
	rH43/2QhcbIIR3ojSqJHLjOxkPX4axUnMDTCgUTyJukvIs/HGQiRzQAk24nRQqTf0e3SiKOcimd
	SO0AaKD2+7VEmEyql2A==
X-Google-Smtp-Source: AGHT+IETm21fGX6EDVvCILpaGt3LhqUeqy+mLvIfJDOMBQXcjhqGiJe96JoM5T9wMnLNcUF5CHiClrXvuov77ts=
X-Received: from wmsd10.prod.google.com ([2002:a05:600c:3aca:b0:451:d70f:eb87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2209:b0:3a4:e56a:48c5 with SMTP id ffacd0b85a97d-3a51d8ffd92mr1637145f8f.16.1749030040535;
 Wed, 04 Jun 2025 02:40:40 -0700 (PDT)
Date: Wed, 4 Jun 2025 09:40:38 +0000
In-Reply-To: <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
Message-ID: <aEAUlvPbX9vFWhdI@google.com>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to MiscDeviceRegistration
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jun 02, 2025 at 11:16:33PM +0200, Christian Schrefl wrote:
> On 31.05.25 2:23 PM, Benno Lossin wrote:
> > On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
> >> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
> >>      }
> >>  }
> >>  
> >> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
> >>      /// What kind of pointer should `Self` be wrapped in.
> >>      type Ptr: ForeignOwnable + Send + Sync;
> >>  
> >> +    /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
> >> +    /// If no additional data is required than the unit type `()` should be used.
> >> +    ///
> >> +    /// This data can be accessed in [`MiscDevice::open()`] using
> >> +    /// [`MiscDeviceRegistration::data()`].
> >> +    type RegistrationData: Sync;
> > 
> > Why do we require `Sync` here?
> 
> Needed for `MiscDeviceRegistration` to be `Send`, see response above.

Even if `MiscDeviceRegistration` is non-Send, the registration data must
still be Sync. The f_ops->open callback can *always* be called from any
thread no matter what we do here, so the data it gives you access must
always be Sync no matter what.

Alice
