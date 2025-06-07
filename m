Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540A91FE461;
	Sat,  7 Jun 2025 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298075; cv=none; b=XVJf828hRJMGwJMsoojd0VkBZXKTx/tL/WF3aPLFcX7TAvp7UbQilqAVCmisKnOIlJve3EMxUQqetkXFlSZ7S5SVDgoG+quwALxVc+ByZt2iDlTublqN9NL0fhzBHtpmo1R7WQUAAhyxIUT9swamFQrOuiXpadCHqbPqCXrDZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298075; c=relaxed/simple;
	bh=yb4yhBW9WEAozpsncuUIxzIkRcWxfD4JdsOUCD9+4zc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HbhNHxyo3LqhWc7HJglBm90vR0PG8uH/kBOGkGHvJlONhZsEgehdZCy8WnXJPq2kZnn+Jl5edqh44tHB9ZdZ/8eV/k+3+cocmdtQtBIwWVkycmCYmMqSOD/PMlBgdNhKxaPHdvQ4ls0pzQ25zEo+1HbXpRfdtyg+IH9VAq2HohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7O0G+eS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7O0G+eS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0ac853894so2591355f8f.3;
        Sat, 07 Jun 2025 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749298071; x=1749902871; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RhLpaRYXY4ElFhL5x1K6LOysBGjp9l7wLChKic8wPSc=;
        b=P7O0G+eSaVEzUIM5ciZWvqtB9sqMDjmK4+SC3AgMsZEikyAU8XICYYajkPlqZ+vNry
         /M/XrEJmFv8bZjOHKaserbIs7mMF1LuplkwGK4hCC/h6PvH4NXot2TObnP+YFZUAeaIb
         fGarju7OZTax/z27p7muGrHaxF2OOPQ8cVna5+dj3nENPHohS9keFjAZArVCoQvS46BP
         S9c7H2rZ70zex4X5053U4hw6KOZT0/QUriswEZjBcSh+O7Mk/vbN854TMy8A2EaOMidH
         rc/LfkOqhZrTJozXH/ZqJBLd+4QNH4jwcMicdox2f7wm9orkLB7+VvVmBhXjuJo1EUzH
         j/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749298071; x=1749902871;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhLpaRYXY4ElFhL5x1K6LOysBGjp9l7wLChKic8wPSc=;
        b=NvFwV8l541N4WZdclt/2kt1snjZaJb+cCFAFUxIHG3aba4d7xFj4fozX1iXietjad1
         qTs1eynhBloeLSXhQlF3IqzjpVgJM7ZGVfEWS1WAmwA9vUFnPeYV4zTAQH7N3waRKVJU
         ElBCrW3Efv2nKpT6LuH7s//9p0snxCWmjgFPRpfR2NTzG0c1eUlSR6jrchkfuYJMLYSn
         HLgAVtdLV+LBnUU2+CyCpW6QR0CQaZdLRDYtIWsBWQYuyh/gf5HrzRR+8yzUvpq3tbzG
         pdDPJvsiqHQnA34iH/JocNysgU9Fi4j079Ji3uIVd5xk+c5hlf+tpkL2uXXOozpSZKs4
         AdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZyaj+GPTMnWLoLAWAmWdqVfntxzkvLcGHHDdqpW5SectgZ4Kbv36xfYSvvppMKKra5uxp0tkHP6Yh5iU=@vger.kernel.org, AJvYcCXzCaXMNvZMQjhPTVmt6uvuIAQMjjfA2i+TivTHOLTNa5TFRZZ8FpsImy3xMXQZPInX0jxYd8dO0AN0tIf5vsk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ebaeENdFyo8PtE92ml4kXX6jERnmu2di0e6ZzeAmhKG/0XGM
	voWLj9rrmmbVsydnJgKbKqiXdvuj8Uhw7S4GJ2gAe0CL3+Eiv+r4hnNMOJFv2A==
X-Gm-Gg: ASbGncueyCoNv+P2yFhreaCp9Dub+Q2rWylLrZK/cV45ZC+vOFQohATzBkOccTTWcfa
	V+uMpcRz/ztE9qBuPSNU556GoF7j0kJ/exp3aEc3FO4ddjRc1iNwWI1wnCnhwkj4ENNTu4W2jVx
	AbpozZctQwfreHcDehFv/WOmXM2fQqvSdsG8EK7u8tgnQ6hPD3islWhJeTvmKwLiqylQoBO+Npd
	WTswQ8hzdUxXrVSn8cARqzvTkQN/0wFHu2ZS5oD5Oo/RiqFLPbWXRvLsnbifZmY+L8lHC/9wWUo
	3V4TMB/nqK76GJex0bDepKRUbin1yPPZDoKDMS1e
X-Google-Smtp-Source: AGHT+IHuFK40yf+DZdXNU3VPg6U4MzgmXL0nMCRaLaWuU9sJ1bj3dJnJrh1L+bw9sjKtpEIaYPxr4Q==
X-Received: by 2002:a05:6000:220d:b0:3a5:1471:d885 with SMTP id ffacd0b85a97d-3a531cec3e7mr6659340f8f.56.1749298071112;
        Sat, 07 Jun 2025 05:07:51 -0700 (PDT)
Received: from [10.0.1.160] ([2001:871:22a:3372::171c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm4538965f8f.91.2025.06.07.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 05:07:50 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v5 0/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Date: Sat, 07 Jun 2025 14:07:29 +0200
Message-Id: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIErRGgC/5XRwWrDMAwG4FcpPs8jsuPF7anvUUaxLTk1LM1mu
 2Gj5N2ndoOFnrLjL6RPIF1FoZyoiN3mKjJNqaTxzME8bUQ4uXNPMiFnoRplGoCt9K3Ml1KPQyo
 BeSDQMVOfSs2u8iy66qQDQGsxeGVbwdJ7ppg+71sOr5xP3D7mr/vSCW7V//kTyEYS+ggWkUwM+
 35w6e05jIO4+ZNamBrWmYpNY20EegnReXo09Z9poFtnajYDeq1JKYu6ezTbhambdWbLJmrQzkX
 syGyX5vxz7EwfF/5k/b34PH8DsEU8uOcBAAA=
X-Change-ID: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Benno Lossin <lossin@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749298070; l=3596;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=yb4yhBW9WEAozpsncuUIxzIkRcWxfD4JdsOUCD9+4zc=;
 b=WuMSGzS51hCBIzIqJIQzyCP1b+qY0KThZ8j5TjtIe70JgtV4ZIsauQ9Ie3xrNRd6zUlLNVBRO
 bCVsGT8716/AW/LtvHOFEkgMg4eiZyP7zQKf3XU0BESLlUox0nk2Vi3
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Currently there is no good way to pass arbitrary data from the driver to
a `miscdevice` or to share data between individual handles to a 
`miscdevice` in rust.

This series adds additional (generic) data to the MiscDeviceRegistration
for this purpose.

The first patch originally comes from my `UnsafePinned` patch series [0].

The second patch implements the changes and fixes the build of the sample
without changing any functionality (this is currently the only in tree 
user).

The third patch changes the `rust_misc_device` sample to use this to 
share the same data between multiple handles to the `miscdevice`.
I have tested the sample with qemu and the C userspace example
from the doc comments.

Some discussion on Zulip about the motivation and approach [1].
Thanks a lot to everyone helping me out with this.

This patch series is based on the rust-next branch.

Link: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-2-a86c32e47e3d@gmail.com/  [0]
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Passing.20a.20DevRes.20to.20a.20miscdev/near/494553814 [1]

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
Changes in v5:
- Remove repr(C) and PhantomData (Benno)
- Rename `RegistrationData` to just `Data` (Benno)
- Add bound `Data: Send` bound to `impl Send for
    MiscDeviceRegistration` (Benno)
- Add safety comment about `MiscDeviceRegistration: Send` requirement
- Add Invariants to `MiscDeviceRegistration` (Benno)
- Slightly reword safety comment in drop.
- Removed spurious newline changes in sample (Benno)
- Removed spurious typo fix (Miguel)
- Add Alice's Reviewed-by from v3.
- Link to v4: https://lore.kernel.org/r/20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com

Changes in v4:
- Rework to use Opaque instead of `UnsafePinned`.
- Include `impl Wrapper for Opaque` patch.
- Link to v3: https://lore.kernel.org/r/20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com

Changes in v3:
- Rebased on top of my `UnsafePinned` series.
- Link to v2: https://lore.kernel.org/r/20250131-b4-rust_miscdevice_registrationdata-v2-0-588f1e6cfabe@gmail.com

Changes in v2:
- Don't use associated_type_bounds since the MSRV does not support
    that on stable yet (Kernel test robot)
- Doc changes and add intra-doc links (Miguel)
- Use container_of macro instead of pointer cast in `fops_open` (Greg)
- Rename `Aliased` to `UnsafePinned` (Boqun)
- Make sure Data is initialized before `misc_register` is called
- Rework the example to use an additional shared value instead of 
    replacing the unique one
- Expanded the c code for the example to use the new ioctls
- Link to v1: https://lore.kernel.org/r/20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com

---
Christian Schrefl (3):
      rust: implement `Wrapper<T>` for `Opaque<T>`
      rust: miscdevice: add additional data to `MiscDeviceRegistration`
      rust: miscdevice: adjust the `rust_misc_device` sample to use `Data`.

 rust/kernel/miscdevice.rs        |  93 +++++++++++++++++++++++--------
 rust/kernel/revocable.rs         |   2 +
 rust/kernel/types.rs             |  25 +++++----
 samples/rust/rust_misc_device.rs | 116 +++++++++++++++++++++++++++++++++++++--
 4 files changed, 195 insertions(+), 41 deletions(-)
---
base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72
change-id: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

