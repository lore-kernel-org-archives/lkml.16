Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DCE4502A;
	Fri, 31 Jan 2025 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336102; cv=none; b=H54jqKCYknWSzUlBCFgKQQF464M83ZWCAKe8nNw9u3OOWZnxOWVf0GXjrlGTcILG5jywcM5p5xNs1A4w7iXtk57lOgcH4xjzZqJcmXfEmfcaucYqTVeLU+uYQCXfF4OHN+6nuCKDfeE3FC2XGGe8toQDfGVL+8YW9dQjNMmV1Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336102; c=relaxed/simple;
	bh=KJ+CiHgwUafd4KzGoNlRG2FAHrOd7VJR4F1HEd9QoRU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FDDkkJaj+oTtslI9ZsUT9WsDbvMknzSjkDwu7L22X1cxkEIc4Z7NR7DL2WV1i4ejgNKSn56RaGlw0vZp19PYztVVjK+Kaqnc8IDPuQhSVRDDKbLeJq5ZMdABa0BtwSsWTYI7wGY0o9QtTesnEVtbhu7JtqdWHRtCXJQtENJ6UxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOzRcVBu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOzRcVBu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-438a39e659cso15111715e9.2;
        Fri, 31 Jan 2025 07:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738336099; x=1738940899; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3rr2xO+w54aWpj9bJ06Zmm641bLBvli7Sm/aQUuSzE=;
        b=kOzRcVBu/Wdwj54IJYoXm+0xd5I9Oe4dRL7dU5WWpe0yPj3QIaE/fbbHJaNMVZ1uT5
         0SlAoPm7P3KyRPJCgiRNUW4m805lo+7/3AJlAI/fxEyME2deW9z4y+YUBhhSDu/KkcuT
         Ap7yj+4O1PNj4KPt/cS3P0gshsJe8ljC5+gPEM6AAsiBqlfeEFdP2f5EvNOIl7Gu0pPw
         yyEH6w8PGpFBHZRYQJHbcDazTIVuzfbALZnD1dIAGQlhuXKg1nd+ZlGaR0SjC3nR7Fy9
         rfFLl5aKI9jyAHrQ9GhTM+iFSfggl1O2jkblAVN+PKZqXcEjT3y1JfH9nj7pAfX6hr0m
         iFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336099; x=1738940899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3rr2xO+w54aWpj9bJ06Zmm641bLBvli7Sm/aQUuSzE=;
        b=nr4+uZzHuL6vWbnnwtmLMxCbQxFP6kyw1VlZadwKKrS/KbfOdn+Wm/7HFXuBAyM9Ys
         Y5QWOJq8PCpMET94ViQjt2PGejbNmXHe80iqzRiBN81uvNmOIozzrMq12Vd+iwZK8dTJ
         SXqf9LCekv9prNzdJV2snc0daRX8l94OeCe7/lIkCbyjXK/WKarUgUoa9R0kc8oj6bzh
         b8eEI2Tbw7/L6mxgFk2wQmCkE6cl+wS2Dx+TfTJyUXr2TBIBqpClsMLEWlT2csWOOrW3
         4/Vw+9ag+k356r1p6lGPa4+qjygnI2a53NzUsQ9TzDdJl/U7amNvDIVg3A7jpLCNOPJO
         qL7A==
X-Forwarded-Encrypted: i=1; AJvYcCW5rHnv2aQKeWNI/E0qZB7Q4iFL8OIxYsYigcRhIyYkFgfej8LMQ6UpI6yI09ImfnZ+1lf0LLPUWkfnUz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0yAavqOVgr+pKf7ip0Z5IWCPH6FyHJzgbpi7Etmuxj2AHVGk
	mRGEXpvoxXjL8q1IPQfXZKEMgiLG/dkmSE9Pk9DYltAiVh0rPaiW
X-Gm-Gg: ASbGncuEKHgW+BDoTT6X62y2rRM9VXlWpAk6qI8iO9BcH5cQaV8JEi+AiLOqcoF6hgA
	Lwn4Ll8O/m/NV3pCpjZDK8+gpE1kLDjoYnxeaiw0IWJ+WspkVhuDBWEfJ15n0La8nU6AK3ugWi9
	gGQkHFOStAqyk97sTpfGzLMU0AZE9Ncw57yTHd/pO+K6HG1NZ34qcXOFiD8AUwsh9IIHEt8dbD1
	XmPw522QkvYB5oaiR4ZSIbmAedS46cLyrcI7ME3wcHvcZso0R57p76a9XK/39E+QBf20rGNCF83
	zOA=
X-Google-Smtp-Source: AGHT+IEuzAoqtk/k8yZgB0SUCEor0C7GiNaXLrX/yLwrnOg/z25rffd8dnK7/57mjp9SpyolqtvLPQ==
X-Received: by 2002:a5d:47c5:0:b0:385:f092:e00 with SMTP id ffacd0b85a97d-38c520975b7mr10077729f8f.50.1738336098445;
        Fri, 31 Jan 2025 07:08:18 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c102f7dsm4961479f8f.30.2025.01.31.07.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:08:18 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v2 0/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
Date: Fri, 31 Jan 2025 16:08:13 +0100
Message-Id: <20250131-b4-rust_miscdevice_registrationdata-v2-0-588f1e6cfabe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF7nnGcC/5WNUQqDMBBEryL73RQ3KKT96j2KSMyuulC1JKm0i
 Hfv1hv08w3zZjZIHIUTXIsNIq+SZJkV7KmAMPp5YCOkDLa0dYl4MV1l4ivldpIUSIXAbeRBUo4
 +q0s+e+MRyTkKnXUV6NIzci/v4+XeKI9aX+LnOF3xl/63v6IpDVPXoyPiug+3YfLyOIdlgmbf9
 y+q19nu1gAAAA==
X-Change-ID: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738336097; l=2263;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=KJ+CiHgwUafd4KzGoNlRG2FAHrOd7VJR4F1HEd9QoRU=;
 b=kKp6FFZVK2pjcMavDoLxnuuCop4ENYtH6Z5ZyN7pUqGY+S779CBBenRph21CGF+Sx9tnGcBtg
 00X1ObvSpzdDG6ZsnmmnR5kgzDeV3O69jb12eku6ECuJ0j5jUwM670R
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Currently there is no good way to pass arbitrary data from the driver to
a miscdevice or to share data between individual handles to a miscdevice in rust.

This series adds additional (generic) data to the MiscDeviceRegistration
for this purpose.

The first patch adds the UnsafePinned (Previously Aliased) type.

The second patch implements the changes and fixes the build of the sample.

The third patch changes the `rust_misc_device` sample to use this to 
share the same data between multiple handles to the miscdevice.
I have tested the sample with qemu and the C userspace example
from the doc comments.

Some discussion on Zulip about the motivation and approach
(Thanks a lot to everyone helping me out with this):
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Passing.20a.20DevRes.20to.20a.20miscdev/near/494553814

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
Changes in v2:
- Don't use associated_type_bounds since the MSRV does not support
    that on stable yet (Kernel test robot)
- Doc changes and add intra-doc links (Miguel)
- Use container_of macro instead of pointer cast in `fops_open` (Greg)
- Rename `Aliased` to `UnsafePinned` (Boqun)
- Make sure Data is initialized befofre `misc_register` is called
- Rework the example to use an additional shared value instead of 
    replacing the unique one
- Expanded the c code for the example to use the new ioctls
- Link to v1: https://lore.kernel.org/r/20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com

---
Christian Schrefl (3):
      rust: add UnsafePinned type
      rust: miscdevice: Add additional data to MiscDeviceRegistration
      rust: miscdevice: adjust the rust_misc_device sample to use RegistrationData.

 rust/kernel/miscdevice.rs        |  75 ++++++++++++++++++-------
 rust/kernel/types.rs             |  57 +++++++++++++++++++
 samples/rust/rust_misc_device.rs | 117 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 221 insertions(+), 28 deletions(-)
---
base-commit: b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
change-id: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

