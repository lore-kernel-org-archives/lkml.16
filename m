Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1223D2AD16;
	Fri, 20 Jun 2025 21:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453560; cv=none; b=ftxoBu6+w6H73scgO+Y1gvgYvzdkhZUl7vz9EuK6QoJWQlNWI03IqSp8fEyDvnLxaZhN8D2NzwMYDnbpUgKbIcQxqy/PcTveiCzn1GmNfO+r9NLIGeTcGcXXJh2k0nIqW8SD+B9SvzjT1uqT8x4bYXfm0OPxBpAH91aoA1BXUsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453560; c=relaxed/simple;
	bh=YCDOwanVdSgN1lzvKjfliGSLNHhYEYiFIKqo06ezlV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjHjgj4c6wkQekyAU7CrfWaUkNYa0igVp/kmb8nlOuv38+2HROKHsA3QmZa0OAjdC+/3Yq32cif4vlSShSS6cuxS7pwvagkZcA3W1DRgxbzo6W6U7IdXIVmuq7/auB5KzbZYVPN9VdCpG1EC8SEMJ2Hn0rsZEtSpOl1r0xGvhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+UZfyXq; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+UZfyXq"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-60f24b478e3so1230455eaf.3;
        Fri, 20 Jun 2025 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750453558; x=1751058358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BZga7WiPAFo8RpaVIzRl+mWtDd+QCARoDdoxd3nuOI=;
        b=a+UZfyXq/iA8T0J9FdcEIreZIH5GKomgtT3Nc+I7//evMo0Fv+Uj/gbaiW86HKjEpl
         eh+upibX9zZ77OryUVSFE5Xxuk6gLkQ7JoP+u8tlejadrR3ogbF/CdWQ67abgiONMg62
         4Zkq53McC83INbfvoxFW0QYdf67ItVUoJ/JV5nU892ZqIREyZtRCDFnhBD+6a9aF0uRd
         M0/GLZKy/LBOnd39cYa2W3lAfHZLa5c6Lixth4k5f7i0J9ylJ5HAq9FoYNcMRKSpEw9S
         Xn1LEajXhymqyoGBAvAJocs5RmQRYrE39SAmlIMGrdN24Gmk8B5hdRXSQHWg8RudKWnm
         EH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750453558; x=1751058358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BZga7WiPAFo8RpaVIzRl+mWtDd+QCARoDdoxd3nuOI=;
        b=TlUAoVz5thXKlx5RwianiuBZTulbLFt1vVVrsdF18+vnfKFjfN9rx42Xl8+E8++fS8
         vZWog+FlFAgFc4jGhBAgOQH8epeopcFqKCOUMEiI1RBq91mgchoLgHikvXZRvtgR0Pm7
         CrMQa7Fs3kQDwLKiZlpeGuTaLvFzPD0whM/gXgJt6ywwdsPr5q9FvLLNznnEuXbKj7lK
         V9y9wJaRyaCHqPU1jz/t9PkS45UGfCiw20nh9dKdH81psmKUuGfvJX3LIzS+9wU6ux8v
         Sns4gGUOeugvYaX+SSI4y4xHW1l5yV/e7v8JutRHVZniqdGrdlCTF9ktWQ13swhmnxnb
         5rtg==
X-Forwarded-Encrypted: i=1; AJvYcCUW89czu2AoC5VeFOrvfC3zLS7R8M0AOzaOo/VbeLkEjBr8VM1klJV2urJRtq4qwEFdV87vzcOYLWGQqcc=@vger.kernel.org, AJvYcCVoJbm8QNyWn8NgxF1rEv8pa9T8IC+bj2T6JT15lhKLynQqsDB464psWGakWcilP27JH+ZQ5GyvGQGoch4oNP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3NH84K52gKsdBxYttI2r6XpMl1pi9Z3hqs/8THKrk92LRryLJ
	Ver5QrB5nFEJLN3bDftzq/hXJrZDjKXDtgLfeyNLdRUrN4HC/PpXxWEP0GQbciKd
X-Gm-Gg: ASbGncvulJJK5sYhmV0+Ulta/dOM7qd/kVEnTrrnutgfUPzyvKEfegWyy8w4Cl+xlth
	3VOZbhXR/O4vZbg0Lh//V3LxmKNJ1gBiCeYSR2Xa8jPNC7TfvESFfFL5hjgkxHH5/XqxOkTm9BV
	ylZ9tYCxz7ZdOXLWY4sdoDEbBxd8jAZoQ29BfzN8M/IAZr7GpOlg4MgUy+TymMTQRv4Z6R5ZlZa
	Fp9j+sGf2kGi9eqkOKuHSqTOFW1ErmfTU/ylqhSigEB8fWZiPVnh38PvziZbOPbq+R1aHye5aXj
	k963WMNO6fRwHbtS1X7yvLbCENL89xLKYN6N+7yT1e3xssG4mjGMOKsm9AsUfFuFR5NIDhOyUGh
	EDkSClpSQp8I50j5Y401Rf7ssK8MnRkzYRf5sLGk5Ndsp
X-Google-Smtp-Source: AGHT+IHolrI5TAkf8jC+feL37CqzPdcJpQcoasli9F/48fwZZEtLMyT2jUooj5A1exswxBUYDPx/YQ==
X-Received: by 2002:a05:6870:6e89:b0:29e:3c90:148b with SMTP id 586e51a60fabf-2eeee57780dmr2974028fac.26.1750453558140;
        Fri, 20 Jun 2025 14:05:58 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-73a90cb7875sm460596a34.56.2025.06.20.14.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:05:57 -0700 (PDT)
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
Subject: [RFC PATCH v2 1/4] rust: jump label: add support for nested arguments
Date: Fri, 20 Jun 2025 16:05:30 -0500
Message-ID: <20250620210533.400889-2-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620210533.400889-1-andrewjballance@gmail.com>
References: <20250620210533.400889-1-andrewjballance@gmail.com>
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
index 4e974c768dbd..002cc3bd73da 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -19,9 +19,9 @@
 /// The macro must be used with a real static key defined by C.
 #[macro_export]
 macro_rules! static_branch_unlikely {
-    ($key:path, $keytyp:ty, $field:ident) => {{
+    ($key:path, $keytyp:ty, $($field:ident).+ ) => {{
         let _key: *const $keytyp = ::core::ptr::addr_of!($key);
-        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
+        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key)$(.$field)+);
         let _key: *const $crate::bindings::static_key = _key.cast();
 
         #[cfg(not(CONFIG_JUMP_LABEL))]
@@ -30,7 +30,7 @@ macro_rules! static_branch_unlikely {
         }
 
         #[cfg(CONFIG_JUMP_LABEL)]
-        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
+        $crate::jump_label::arch_static_branch! { $key, $keytyp, $($field).+, false }
     }};
 }
 pub use static_branch_unlikely;
@@ -46,14 +46,14 @@ macro_rules! static_branch_unlikely {
 #[doc(hidden)]
 #[cfg(CONFIG_JUMP_LABEL)]
 macro_rules! arch_static_branch {
-    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+    ($key:path, $keytyp:ty, $($field:ident).+ , $branch:expr) => {'my_label: {
         $crate::asm!(
             include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_static_branch_asm.rs"));
             l_yes = label {
                 break 'my_label true;
             },
             symb = sym $key,
-            off = const ::core::mem::offset_of!($keytyp, $field),
+            off = const ::core::mem::offset_of!($keytyp, $($field).+),
             branch = const $crate::jump_label::bool_to_int($branch),
         );
 
-- 
2.49.0

