Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B622E41D;
	Fri, 25 Apr 2025 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566665; cv=none; b=h0FbD/lGn0vFsftNqRnHdf3QDB5H9IR9u7fnwqTXYbCOLztoAK3bdiNCJYvekXqy0it4KO7KeIn4nc5rWPsmEokqrBIWQspK3nTGL5Ype/MHE0OiG2a1TSB7ungFtj0cEy+ogaI4oPPH2MkMw99IlN9z+RwF718jFiauaTN4xAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566665; c=relaxed/simple;
	bh=p9KuyczkRk04gYMkFGGJnxWv0QoLL1+yqvWdiiBeT3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htrBeVrsJu63qjoXB+rWUfzUHbW50LTPjmi/rxAvGYLPk+9dPmIENv/YOHumt+pfjBNPfdo4tJhB7utHphadCrCDa/ssoK41FKcL1Fuq23ySPCO+sbSrreSN08b5hpYxdru3yYY3n8aE2qBAS31xKuq3R2sk2Gl3FRj5oEFzcHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmNxgeEp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmNxgeEp"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1914037e87.1;
        Fri, 25 Apr 2025 00:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745566662; x=1746171462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1kYjA5v2ZxXF+57lF/W+Zxp4CYc0PDu1KuPLGZgYLw=;
        b=XmNxgeEpkZfthsc7n4Adk7jD1xHQWiOig/LY8esW1Z5LnGpwz5YAiUIKv5T3ionm+T
         2wUCMZQVDLFVFVP+VacXa39C/t5QqqwMMbzyTQmgut18qYuLqRsqJhF66KuR13qJ+hQ+
         pPx9V8m+qyEbjLiVbY+Mnj0KC6G0XamHHXWTMZn6QGAIsUyaeDMGMfOb9zlNcrMDIt0z
         FWwMLcFgPT8kssJAaB0w3caefnJEMfcxe0FhAfobgMhbvj+z3gNvJu7nGdiZRy/K303e
         GE+C+gw6CU0Gen3Nh2AH06dSksZGI4RNhLp3az8dD39eto91uFXEHBjcteJDlEr4QebI
         ryhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745566662; x=1746171462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1kYjA5v2ZxXF+57lF/W+Zxp4CYc0PDu1KuPLGZgYLw=;
        b=pVah+QhC4Nz1WGq7IuWz+vTiW0T9dqG1mV2gMQtGqwhtxvSmVMl1t2yQZuodMuGlbD
         cUxlF7ObyMoexm0y8F9tPpb92P7dtIUDAzh74JLGNooZb+PgNmfDbyM7tJgwIEOH7bMy
         vh8tW49ATk75l0W47xL4SWPSdi668n5y50P6NpzpTIMPx8oVpqsimoFmluG3JdOtvFD4
         q37fMUj/4fOeXz92JJP/wPSSpe262vMXKPG48EkHlH7nAAgZmIS5rfOyPkS2rBwXt0AN
         mali+f0Rr1qp3RY/CwuQy/HAOfr6dLZlsVV9IFG8us7PwLteAlWK1ssWz446DrvaUtq8
         IeYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR5XjMjmoNYCv8NFmFltbdjQFRsYOtZYlk9qeqSzptqOdWZ1lUJpsgrJKZjwhsoRrDXruzunpa9XJuSWE=@vger.kernel.org, AJvYcCXkiCHGCf/1tZvJuDhoJXfeSBT7xOEbTbNWS4e+qxo5y1f7M+lTh/6p4SlEE5k4h8PfAxgvMvDg4Z002XU/YkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGVfTUlwDA/YsoK1ZzaGpIwxSiUv3b7vkIWY0zGSyrXrz7uIV
	ejKjKdgVWcFp3wKusZiIDsz4bx9qTqlfmyXXn9Bo7vfolK2L2BjO
X-Gm-Gg: ASbGncuvw8OfYRoWPuzi3RS2goEGFBzlnX16Cg2fHwUjQOt2I770OfRogtVSHcJH7OJ
	cblXpoz/ehPmZUpz6oI3P/9ar5En1Csdx+zU/7NHusu3mqauvWXmjyZcdWYFfI0Y2D3aCpj3Kc+
	bfbUrGVBFj8cEiExeUnA+W9Z9oFlEIISYx4rCa4sDbnUfRci0XAqxcthbP1xI9JLaS3HVOfOzdF
	kpt6F9FfffcZ0Va1aYMfjTclOrjXop79SVs4X38BJMYq7S3Jy/YjEdHcITMAMo3AI/1ju4Nfqo4
	fOySP0q3B0CIKgVMsbUSCyidrHsjK/heJqWNs3sqIF/0NI2OnaKUysISswAIvtxvM8BYh46qioR
	W7DlaQ1yebN3ECcmIVqo5rJJbAoWc
X-Google-Smtp-Source: AGHT+IG0vJEK9kerNJ+x87uQuMGI3i+Ng+kKkkJ+CqAjbAHJkHQPScomcHYgoQzdCHw9f91km5IT7Q==
X-Received: by 2002:a05:6512:2399:b0:549:2ae5:99db with SMTP id 2adb3069b0e04-54e8cc0e6bcmr383224e87.45.1745566661791;
        Fri, 25 Apr 2025 00:37:41 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9e9a5sm504391e87.132.2025.04.25.00.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:37:41 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: dakr@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v3 2/3] rust: dma: convert the read/write macros to return Result
Date: Fri, 25 Apr 2025 10:35:41 +0300
Message-ID: <20250425073726.1027068-3-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425073726.1027068-1-abdiel.janulgue@gmail.com>
References: <20250425073726.1027068-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We could do better here by having the macros return `Result`,
so that we don't have to wrap these calls in a closure for
validation which is confusing.

Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/87h63qhz4q.fsf@kernel.org/
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/kernel/dma.rs       | 54 +++++++++++++++++++++++-----------------
 samples/rust/rust_dma.rs | 28 +++++++++++----------
 2 files changed, 46 insertions(+), 36 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index d3f448868457..a61da5eeb017 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -328,20 +328,22 @@ unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 #[macro_export]
 macro_rules! dma_read {
     ($dma:expr, $idx: expr, $($field:tt)*) => {{
-        let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-        // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
-        // dereferenced. The compiler also further validates the expression on whether `field`
-        // is a member of `item` when expanded by the macro.
-        unsafe {
-            let ptr_field = ::core::ptr::addr_of!((*item) $($field)*);
-            $crate::dma::CoherentAllocation::field_read(&$dma, ptr_field)
-        }
+        (|| -> ::core::result::Result<_, $crate::error::Error> {
+            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
+            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
+            // dereferenced. The compiler also further validates the expression on whether `field`
+            // is a member of `item` when expanded by the macro.
+            unsafe {
+                let ptr_field = ::core::ptr::addr_of!((*item) $($field)*);
+                ::core::result::Result::Ok($crate::dma::CoherentAllocation::field_read(&$dma, ptr_field))
+            }
+        })()
     }};
     ($dma:ident [ $idx:expr ] $($field:tt)* ) => {
-        $crate::dma_read!($dma, $idx, $($field)*);
+        $crate::dma_read!($dma, $idx, $($field)*)
     };
     ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {
-        $crate::dma_read!($($dma).*, $idx, $($field)*);
+        $crate::dma_read!($($dma).*, $idx, $($field)*)
     };
 }
 
@@ -368,24 +370,30 @@ macro_rules! dma_read {
 #[macro_export]
 macro_rules! dma_write {
     ($dma:ident [ $idx:expr ] $($field:tt)*) => {{
-        $crate::dma_write!($dma, $idx, $($field)*);
+        $crate::dma_write!($dma, $idx, $($field)*)
     }};
     ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {{
-        $crate::dma_write!($($dma).*, $idx, $($field)*);
+        $crate::dma_write!($($dma).*, $idx, $($field)*)
     }};
     ($dma:expr, $idx: expr, = $val:expr) => {
-        let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-        // SAFETY: `item_from_index` ensures that `item` is always a valid item.
-        unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, item, $val) }
+        (|| -> ::core::result::Result<_, $crate::error::Error> {
+            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
+            // SAFETY: `item_from_index` ensures that `item` is always a valid item.
+            unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, item, $val) }
+            ::core::result::Result::Ok(())
+        })()
     };
     ($dma:expr, $idx: expr, $(.$field:ident)* = $val:expr) => {
-        let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-        // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
-        // dereferenced. The compiler also further validates the expression on whether `field`
-        // is a member of `item` when expanded by the macro.
-        unsafe {
-            let ptr_field = ::core::ptr::addr_of_mut!((*item) $(.$field)*);
-            $crate::dma::CoherentAllocation::field_write(&$dma, ptr_field, $val)
-        }
+        (|| -> ::core::result::Result<_, $crate::error::Error> {
+            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
+            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
+            // dereferenced. The compiler also further validates the expression on whether `field`
+            // is a member of `item` when expanded by the macro.
+            unsafe {
+                let ptr_field = ::core::ptr::addr_of_mut!((*item) $(.$field)*);
+                $crate::dma::CoherentAllocation::field_write(&$dma, ptr_field, $val)
+            }
+            ::core::result::Result::Ok(())
+        })()
     };
 }
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 874c2c964afa..9e05d5c0cdae 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -54,13 +54,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         let ca: CoherentAllocation<MyStruct> =
             CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
-        || -> Result {
-            for (i, value) in TEST_VALUES.into_iter().enumerate() {
-                kernel::dma_write!(ca[i] = MyStruct::new(value.0, value.1));
-            }
-
-            Ok(())
-        }()?;
+        for (i, value) in TEST_VALUES.into_iter().enumerate() {
+            kernel::dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;
+        }
 
         let drvdata = KBox::new(
             Self {
@@ -78,13 +74,19 @@ impl Drop for DmaSampleDriver {
     fn drop(&mut self) {
         dev_info!(self.pdev.as_ref(), "Unload DMA test driver.\n");
 
-        let _ = || -> Result {
-            for (i, value) in TEST_VALUES.into_iter().enumerate() {
-                assert_eq!(kernel::dma_read!(self.ca[i].h), value.0);
-                assert_eq!(kernel::dma_read!(self.ca[i].b), value.1);
+        for (i, value) in TEST_VALUES.into_iter().enumerate() {
+            let val0 = kernel::dma_read!(self.ca[i].h);
+            let val1 = kernel::dma_read!(self.ca[i].b);
+            assert!(val0.is_ok());
+            assert!(val1.is_ok());
+
+            if let Ok(val0) = val0 {
+                assert_eq!(val0, value.0);
+            }
+            if let Ok(val1) = val1 {
+                assert_eq!(val1, value.1);
             }
-            Ok(())
-        }();
+        }
     }
 }
 
-- 
2.43.0

