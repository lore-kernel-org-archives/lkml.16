Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1119615C0;
	Wed, 11 Jun 2025 20:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673824; cv=none; b=jWIMLZ95DmAp8cqZgW6MMq/GL7o/1lQ0mYan50ZKhwnKGk89kd9NZ7eQNNMwN5VZ6sadpRnfPPHDft73oaJCW2U8UVljNcoe61AdhQto5MjlIDnCr97IPoR6hP3c4tExiiPxx3+CyXuk4StK2BblqXVhtuvwuqNIMiWbLdDIDqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673824; c=relaxed/simple;
	bh=jmv1s8okU7fGVIgSZoVVYiYUYXdg54/SEyU1yXSHBmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfxsdYClv3k9ihJYCyCt6q5JqPl6nbzI1FwlliQR3XqM49oNUsMLjBp/wxg/MyOBSYbMuM2qL2ZwR6f8YDzjHlpyvlWGd4F/6eYTdAhGOdL8JmsI0TmiRXTNQQRcsMZdM7uiILtENUKnFD/zDNbWgtzKTCfmgIBjJho0h6LvFAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkL+aFQy; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkL+aFQy"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-610d86b3da9so115605eaf.0;
        Wed, 11 Jun 2025 13:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749673822; x=1750278622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFWeRrlFpOMM4iQ4a6IP8kikC8hDTgeRtbqFoG+aocs=;
        b=kkL+aFQyYw/Zt3YkzP+Yi3yaelfqwT6CNVH329DqW5yRHPbHJ9wVvzf1pZYxX95e/V
         qVkG8putPsuWCKt4GwOAhIKRhbJlnue618Gq3kXIVg8YUwojQt5/yHO0DBv/4/OGfjPS
         T39UPpcSj/aXy9RL/OIaJd6qsL6gbkHtLTWIB6Oqjn1LEohahhxfubQfGw2n5NUYjXFU
         rvTWHanUeICtLPKqjvvAF6aY8uYEMJVWU34UVUsYz0N6PozvecULvd3UpwigmLW00IT7
         RD/vhHdeYndlWsZFdjW4TtFcAmiFn2ev8G3aFlbyTcdDBq/RSDXlVYWmXvgD80xOH3M5
         37/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673822; x=1750278622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFWeRrlFpOMM4iQ4a6IP8kikC8hDTgeRtbqFoG+aocs=;
        b=dv0b9oAzRdJ/InAnwbbLw0MBJeVH7v7aLBGY4l/43yqzgdmh2dN8XYDes79shUkSP8
         8a/83kvhPa4Bf8kncSSOV5Twnp4DEVxh1UCSqF9L5g5Gc7Gp3WZnjZMHRXwEYpMAFHTA
         al+8J90rjeftcis0p2hwv1qj02c2uSybUGNgCbtyZ5RMk1lVwyJSkUbD+Qwk4lPcTMRO
         /Y4hVixs2MVztvgF+3lh5xMwiRPdDIZZwRfM0s3xbfhdv2Cio4ahnp+zJaQpcw6vMc7Y
         9dAftRG5Ej3mDr6vt3ybWTOehLtbm3CLbR1W32MC4IfXkDLVJR6Itn4qQxLm4Rb38aYK
         GoWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaci1xZka//qbhWIa61wg/a2E2v1TwpTLMMZUguQR4r5PxSsOUq4s5or3sukuS2WwuYDXFnW9jECZ46znHhws=@vger.kernel.org, AJvYcCVyiW/RDm1S43WoXJgpnD37tJXONXcBO9J5xU1LM9ZGznII8iF+lLU9GOKxJuiFjaKy0Q4jNYbvQ6rnUXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3zqYrxKFygAm8sknZLEAQB21ME2Cu43mz/wIRIrpepuISpsls
	ExPsXW2iPWxaKXzAcX9qmwO4O10Elxtst0kvVRK02YyusM0lkghUL5OD
X-Gm-Gg: ASbGncspU8c2HNfoyrkNCRiMch1t/jEiWYw3upoz5h1zx8Sl7mbshwaxinSVMwMZQqM
	A4r4c66dEUC3U1yF8f0hy2pE+bhRNDb2MNRpt7Se7p5pW5PcdYjwy4HX05POqj0okuqvwh5SqVR
	NHy4gFlbWr3ijc1i+mI3wNQUbib1LrpBy1FqI0CjkWMKpWlpVE8hVgSpyaDrmRH1v0c6fWGTcn4
	wqVfk2jddidYnbZGcaRIGLSnoVxq3ejGa+E9RJEBIy0kIk+6oz0xO/o3uPmEhcFopeRErxS2t3D
	8bE6AT2RJbZtz/MVOTRoZ9GTPP3+v2jxp8H4SUVInUm5N/1z4n2QJuKlET0d3gkuJS/R9XO1H1j
	zDGaw/fSpM1F+DXH1MbbSwOxPPPPVyx2hIqZaZ7vr3MbG
X-Google-Smtp-Source: AGHT+IHfExfMOVgwkoL3DIkAd/QDD7c9tb8K0wezR2X4uTYHBas9Vi7SeG9b3yryvsowf3ZTsm7+eA==
X-Received: by 2002:a05:6820:216:b0:610:fbf2:bd7d with SMTP id 006d021491bc7-610fbf2c05emr769570eaf.6.1749673822021;
        Wed, 11 Jun 2025 13:30:22 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-610fd44cc85sm19129eaf.16.2025.06.11.13.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:30:21 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: jbaron@akamai.com,
	jim.cromie@gmail.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	rostedt@goodmis.org,
	andrewjballance@gmail.com
Cc: viresh.kumar@linaro.org,
	lina+kernel@asahilina.net,
	tamird@gmail.com,
	jubalh@iodoru.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] rust: static jump: add support for nested arguments
Date: Wed, 11 Jun 2025 15:29:50 -0500
Message-ID: <20250611202952.1670168-2-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611202952.1670168-1-andrewjballance@gmail.com>
References: <20250611202952.1670168-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

allows for nested arguments to be used with the static_branch macro.
e.g. `outer.inner.key` can now be accessed by the macro

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/jump_label.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 4e974c768dbd..4ea3cbb340ff 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -19,9 +19,9 @@
 /// The macro must be used with a real static key defined by C.
 #[macro_export]
 macro_rules! static_branch_unlikely {
-    ($key:path, $keytyp:ty, $field:ident) => {{
+    ($key:path, $keytyp:ty, $field:ident $(.$field_cont:ident)*) => {{
         let _key: *const $keytyp = ::core::ptr::addr_of!($key);
-        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
+        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field$(.$field_cont)*);
         let _key: *const $crate::bindings::static_key = _key.cast();
 
         #[cfg(not(CONFIG_JUMP_LABEL))]
@@ -30,7 +30,7 @@ macro_rules! static_branch_unlikely {
         }
 
         #[cfg(CONFIG_JUMP_LABEL)]
-        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
+        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field$(.$field_cont)*, false }
     }};
 }
 pub use static_branch_unlikely;
@@ -46,14 +46,14 @@ macro_rules! static_branch_unlikely {
 #[doc(hidden)]
 #[cfg(CONFIG_JUMP_LABEL)]
 macro_rules! arch_static_branch {
-    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+    ($key:path, $keytyp:ty, $field:ident $(.$field_cont:ident)*, $branch:expr) => {'my_label: {
         $crate::asm!(
             include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_static_branch_asm.rs"));
             l_yes = label {
                 break 'my_label true;
             },
             symb = sym $key,
-            off = const ::core::mem::offset_of!($keytyp, $field),
+            off = const ::core::mem::offset_of!($keytyp, $field$(.$field_cont)*),
             branch = const $crate::jump_label::bool_to_int($branch),
         );
 
-- 
2.49.0

