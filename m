Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C231AF0C1;
	Fri,  4 Jul 2025 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751658648; cv=none; b=kqnXf9+ofIlIY6CG7hGK+nu7J2fWUDbZ1OAby9zt3bNmyrW6kxKxXJcbjApNKnGZmXmtWidse1imTf5LE4aSnaTmH/oajhSYX8ly3BNo3HsgMl8opQx4r9LR4M5CMsa1jSVlJU2xo/XJ7GCBpvrj59utGlTfYUXiRCvgmvYy+3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751658648; c=relaxed/simple;
	bh=qKgo02B17DodnhaibVPdaDlTdyhSAoUeT/A9aoa3X7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bk3RY6ZiWpwBouYj/ckoFxffV2oxUqthcrJGHi88IbsGlRRviRWKDWzY4HURjTx1PxYrNXmiFX5lJbbtqXG5BXMF5mQDM0cw8barWw168+8yHIqDA3tJl2A3b11NTVR6VJKUqZEkw/WR56eBs62lKeeYuntM6+6I9GJ+ZWAEY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWjlyHtP; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWjlyHtP"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a442a3a2bfso21796411cf.1;
        Fri, 04 Jul 2025 12:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751658646; x=1752263446; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PuVHoEnE9nwV2qIez2+av51S6d8Rz9QyuW19Fhxnfw=;
        b=NWjlyHtPzgq13ZNlqtLeKW02okFhLCCLhbpwQ1dAgkpIPU0gp2+hkJD+WErsTY2zyk
         nUzXg/IhdoasSa5F/BFkphdb3v8VdllsjgBZP7FKrs+6GNX1mofOr21UPdg9Y4cLWP37
         fKcPV34XQhXn5XbnqBel1wUl92e8sLZ2g4l9AwmGp+fRtYWM4G+55zkDVcHsR7QpLFT1
         hUaM1q8QVqdEIfbu2s3OHI5bvA+2tpwFknkYn0OGG0S6uSLrmIUfbZjP8YHH+ubmDF9W
         dqJD9ohyt0livyIwk1XaTPU1AOlzUfw5kN83qj5ESuPy6eeDpNUKOzm5BEUwwPXeO1SA
         IMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751658646; x=1752263446;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PuVHoEnE9nwV2qIez2+av51S6d8Rz9QyuW19Fhxnfw=;
        b=klN6wqcNbR3mIpHHyJm4IoP/IKpjPHKcl3mDUjJww8oOpbrcyqRAIZxuktRjx9JOza
         P+M+72+lbZEmsqu588iX2md5SmqKTcUnZtwLMR+R4Hwcae/nM1uEPOcCNtKxIhAzrfWV
         rxula8/LuagvLATskAJR/3aOPg5ISpDlpK/r42gt0gRtXKoSrllyHw1WJl04wlCqRWDI
         QQsiSqYXbAPnPowJugBO4H3pNkGxBq7E5mYMuZOI+7mASB0yyCqaxSypbtL7vTgAKhv6
         n9l+Z6ib7NOHybqQXY4BewYUMWEapnR5VsZxqT34OmEHMUvESX2hayJZqGFEQQdrCgze
         xZxA==
X-Forwarded-Encrypted: i=1; AJvYcCXhH82LipRY2EIrV9LHoOuK+VMHFaNQ+qWriiXOpDZKTyj0OxAxM582B3Kd3cKg6LnyXJq8o46n4QKPiIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvj1C1YoD8xszkjeAeHSFj/uFkQyYr2pwKzruMxOk57OxMR7mt
	SFWPEgGTcdnEWOq3qHO6w5U0gD379GdeoEplAwiY7BmDXDXSPI19SWZd
X-Gm-Gg: ASbGncvJqCQejozzGGjpsSfqFWfPhENsDtnOLUzv4pwZ6EAKoZfKh8g2qNHCwqoE8Yg
	LXPT51eqiQmgdXxprilqpk6xS580cf4Unp3avy+eAUy3ssDizWg8jrqXgpyvV0JszjzPW8MZKi4
	7726l3uxIlzHPxDI1yIFbIsvo9a/LLIRfEsKy1KL6EYRNYjE7vIoiXPiAPa/JladXxlnrJKTBB6
	kCEbGaz5OcT2sy74bB38zkbhoY/CUr4gOkUKBzldoFHq27Q5rk7VWtroUD7gLOJ7WEfMoL9UH/0
	5KIrmwInPZzhpftBVKKMxw+H2MV7h4qtEV3jzuAzIJkbD3H4QYv1YKAxLwD6EDJTqzNOF7IenuV
	aKGpwfSkTJYi1MT8XRw==
X-Google-Smtp-Source: AGHT+IFvplrbfx5eIIEM7v2xo7xdx+f8EnlLoYHF/n7XRXsSIX9Mq7yEa6hYb2Zp5xdQ7JlW21zyUw==
X-Received: by 2002:a05:622a:142:b0:47a:e1b1:c6c9 with SMTP id d75a77b69052e-4a99689f4f1mr58363971cf.42.1751658646273;
        Fri, 04 Jul 2025 12:50:46 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994a8e083sm19401281cf.65.2025.07.04.12.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 12:50:45 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 15:50:44 -0400
Subject: [PATCH] rust: auxiliary: remove unnecessary import
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-cstr-include-aux-v1-1-e1a404ae92ac@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJMwaGgC/x3MQQqAIBBA0avErBswqdSuEi3EphoIi7EiiO6et
 HyL/x9IJEwJuuIBoYsTbzGjKgsIi48zIY/ZoJVulFE1hnQIcgzrORL680Zja+NaZ1rtLeRsF5r
 4/pf98L4f3UJHjWIAAAA=
X-Change-ID: 20250704-cstr-include-aux-7847969762a8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751658645; l=1353;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=qKgo02B17DodnhaibVPdaDlTdyhSAoUeT/A9aoa3X7Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QChOkqPD1zqIfkWPNOY022Cb7O7nhFhCdmEdMBKm8ipc2WcJz+bO0uCOGrvyMTUFb1ptkfRh01x
 Ppbs96AWcuAg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

`kernel::str::CStr` is included in the prelude.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/auxiliary.rs              | 1 -
 samples/rust/rust_driver_auxiliary.rs | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index d2cfe1eeefb6..4fe62bbf8b3a 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -10,7 +10,6 @@
     driver,
     error::{to_result, Result},
     prelude::*,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
     ThisModule,
 };
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index abf3d55ed249..f2a820683fc3 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -5,8 +5,7 @@
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
 use kernel::{
-    auxiliary, bindings, c_str, device::Core, driver, error::Error, pci, prelude::*, str::CStr,
-    InPlaceModule,
+    auxiliary, bindings, c_str, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
 };
 
 use pin_init::PinInit;

---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250704-cstr-include-aux-7847969762a8

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

