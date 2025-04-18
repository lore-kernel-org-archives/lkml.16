Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C42144B1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940563; cv=none; b=d67As+ZnXsz9y7cpY81iymT+MgwB98lqzWrveo+sgdHkLIFmM1RQ502eqJmLwVIEtV+8m+Ozer8nD0cV6ZevyuMNhcOADauHKQnT4lD9FfIp8d8nRAK3SsnJC6BL+BlBXUNquBoTtyQP4KNefn4F4QEWjlLx9Pc5rHChpfLVr5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940563; c=relaxed/simple;
	bh=mxkonQb4LEedhuMKi5Pw7VG6wYzo4QhHEDDHw/ahhNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X85AIlUcU5TL5jl/rWjliyIvSPROCqIO4U3/e5IijdMWNGuGXqYpnFIqmvPL9NPcJdOl2a50L+96Kj6c9tv8D7UtfV/E6eq9BtC9Cr3oeOqT2Xx2yEN6qiP2vTMpoPYIRwkgftXvXOKFO6zdJ9H4BYPCjTbQI3yIQX94ybeN4lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=Dh2uUTPe; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="Dh2uUTPe"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7054f0e933cso12540697b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940561; x=1745545361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvrUONsdYqifW3LOJLRHijkTAOBVJ3SwPF5uqNxQa5I=;
        b=Dh2uUTPeR4b+Ip3vV//ROyObxAQndf0SN4auWgQ2vKL+56HdFtr0eUUjmPMrQKaM8P
         ahXwDWAPQ49NOmfg08xGVHl3vI8pgBzCkselgESvuL2EMH3QUCZFC4og9FF8Po8nDW9c
         byZFlyjDxHe2sgGnHnc4FFwesBopyt1+/gZ3vDoNorJziPh4oyOCb6iwAIWOeKqPB6CE
         +boYdE0CDOegH4BnI+GoU9kE9a7PvNx0mvUhGD+JA77vGtT2nUO136BbswE0yUNU2pP5
         5Chzu0u0zwWn7cG0MunTi+Q6UadhAIuSXf/7OSIQY5T+2n/Bq6UNphPCrzn7mVILO5U+
         wjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940561; x=1745545361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvrUONsdYqifW3LOJLRHijkTAOBVJ3SwPF5uqNxQa5I=;
        b=tUMgvnGUZZUDqtuH1kiL7cXfuxg3tKe6wm1Q9vET1NAZh5qstB++ahvfj8qKqmhqnR
         pg/lvp6PKVNd2krcVJYo4QFXAu0spKr2haPm2fmCw9eEQYhTbkLLPa63/eBMYdNFP8Iv
         jcbGsurU411OUek3FORZ0iG+exPp3JT1ylC3eAUt6p1yiqSytObBRrXf3hZQfyNmX+i2
         I3pTEDZn0iNukNkXiMEK0jY+9NsLj9pSCjXMOpg367Jfe5etrKyKDXReeOKydXT3xg7W
         TSAufnlWsk08wyXX8C80WSi5RcueoRPb69a94wjkWozSFh+1t4k1+nBZxhd5XO6alxcH
         kx1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAbrB5LgSr9gYcLsCDRDsAD9YGQb9vfUZ5m6JxUN79d032Kdr32H+Nathx07FiKpccu1EUyE4l0KIINWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdtRUXVDEVfNYZLtSwl7l85fQBjLL0IxrDTOpZPBaPFAy6reU
	E0XwqhcqQ09dDxVn92aUv//VKJWuPLz/vgwoW9/4+otGr7xYpLJtQyvercq72qE=
X-Gm-Gg: ASbGnctFy3ett4c5LL8DKf95cG0KU7sWHch1Ir5H5ilFWcxoTgVy6WwEgh9pJwChVCO
	DpZ7HQLvzDJpVCQHEdzggKX8ghqxGUmgU13UxCPXzyJGpJfKwj+GAn8vo8yrIfe6FCtUwjcA/pG
	V+p8rj3Cjm2Usmz4STobpMPRzAi8++/y4TaUrra6j7GKi/BZovmvO+D3o275pQd0HlU3pQ7T8nP
	acAblLdWwyVsJYXe8+vaAIX1pu6XxXou2LjPLZpnGhOYQLoB7Fa+zYP7P6ivD02H+Bs4ERAi6Dv
	1nwnPY+MsFIJxejNWilhmdi6s1UtNnBKCZ+6JG0ZByMY/+Q4jKJbO3r288wc6vayoMER2ARqlE6
	hLjZoEX5y00JoyxyTZAG5wPHOjBCR0UrEeH3X
X-Google-Smtp-Source: AGHT+IFkKZHhFoZlAnFPe99KVOPEEaQXKoe8aM2D5jFVeHQd5CUKhcAsOgQI6LgtRf0mamiE3y+N3g==
X-Received: by 2002:a05:690c:6c03:b0:6f7:55a2:4cd8 with SMTP id 00721157ae682-706ccc88282mr14975767b3.5.1744940560942;
        Thu, 17 Apr 2025 18:42:40 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:40 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/18] rust: platform: refactor to use `&raw mut`
Date: Thu, 17 Apr 2025 21:41:36 -0400
Message-ID: <20250418014143.888022-16-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of_mut!(place)`
with `&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/platform.rs | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 4917cb34e2fe..f0f316b639e8 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -14,11 +14,7 @@
     ThisModule,
 };
 
-use core::{
-    marker::PhantomData,
-    ops::Deref,
-    ptr::{addr_of_mut, NonNull},
-};
+use core::{marker::PhantomData, ops::Deref, ptr::NonNull};
 
 /// An adapter for the registration of platform drivers.
 pub struct Adapter<T: Driver>(T);
@@ -227,7 +223,7 @@ impl AsRef<device::Device> for Device {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
         // `struct platform_device`.
-        let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
+        let dev = unsafe { &raw mut (*self.as_raw()).dev };
 
         // SAFETY: `dev` points to a valid `struct device`.
         unsafe { device::Device::as_ref(dev) }
-- 
2.48.1

