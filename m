Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D8120CCCC;
	Thu, 10 Apr 2025 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275568; cv=none; b=j8txQl7LXlAqWtg6DqUBoFvBka4KxBdDpyunzzjLBENvPHgCI1Le7J7wdtG4Nh/ZjDg6D/ra1OZ9IIlQb8Y7u8ybOcfuJ9SklO8l5aVHu7VM5roJzb/kwXwXjFvZQU/DlH1KkUzzNIaNtBW7j1b4Fsjl6uuQezn1wqhDD7z12D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275568; c=relaxed/simple;
	bh=ym65ZHl+x7j2UBFJ7WrJbNmKqz9rKOx7DPKi9PWmqfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkCmGdCuMK229CJkj2Qcuo06q1g3OjaxpsDDG6BtAQVcPJwgbZiGz9tnbn8om/2yPBaUJW7OtMTYrZE9WCqMoJtLbqVnicnFpFrKt+bORBd6oyZpxt2qUMXNplf1R46ReK1+VfosSaldQRNM5LDmBaputnlE+jwiRjDi7SwZXlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFdJfWTD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFdJfWTD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so224689e87.0;
        Thu, 10 Apr 2025 01:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744275565; x=1744880365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quYlemSJI/IPbTuyW/ur+mjtFnxkDwGn/F831OhHW4A=;
        b=mFdJfWTD7Psr4k4JSgFq0c5k2tjuDHOzTiUZ69QBl8mUFZaxhniH+JX0Db0hapCkpc
         GAFuK4HJuiaBqnJ0teUdAhvYmbXpnVwzGzxkXtUZ0IlkGXqvJR+89axR4uxzj/3cy8aY
         6ehO6e4gJNafmRQgsF9k+sBiCWlnITWEnnf9lkbDa2vr8KhJCnOK4KlY03qLllGvR+lA
         xX8hKyoh0Dc0CC0VfM1IppsjIFOxEqBnjKLltEKSG2RfKApEnilQbr1PwIRBkCdufJXx
         VjQh68nNkv95yortpSwA8N04iBcT3+v7BzZ5v1Zqehsn2SXzeJI7i3q/dNdho2Yt4Tjf
         kS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275565; x=1744880365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quYlemSJI/IPbTuyW/ur+mjtFnxkDwGn/F831OhHW4A=;
        b=kGYoxh3migAUs6+7xZsFlp9iKFEIJDGje1KGIQF17oE5mNR0OlN8xeAr/hJJkukRqU
         msBL9xGZzkLvmgzcTHydlGBMlmAOs4jPNiaUDHAwESooOXA1ujKQ6xklfq4x9HDn6YCk
         uXbiJSyKCrcMHo+Q6eik71U2nIG5tcyH06mvcprld0gqN6AyzKVztP9tuCUEQ5aa4b+c
         M8EBqvKadsP06FjuJk3/2NJOidtfQg2B4xO5amI1ZnKxExwnqkqTEPbe3ASilpkZnVJV
         PnB9L+jMn3HZhTXa/03CB+aW/XneTkdaU64yEibq+02cLLkySoygterKjOzgyEmU1rgI
         Q3Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU1DFqafC5391S6N85KiBACZl2lQLRJK9gNdub5cXr2N+FbtZ7YMCNJJm3DAh4+M/+bMoGO85EQzMWD+VdxGpY=@vger.kernel.org, AJvYcCUjs1P5Xt7oPcD2IOnLIwc7vxCQwkpBsjLEkwgK6GWXiSQjvq64fr/6n6QiYGw6wBRmOMLZCwlda8zvv5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+nsXpkHBZ1pWar8iNc/lX6niqgXTwrG27ejxTdA0sZegJkj/
	iAWBmjodQ7wTBrKmSDYf6UCAqx0Ti+mhVO614AFJPlSEKFEt9KL5
X-Gm-Gg: ASbGnctS0YJD3Q/q41T0wMdU8XnXjqEZoyCYuZ3I31SLr8qDcLsIVQo1dgkkUDtkH7Z
	sTu6hY3X+Uc+8S8PiYRDYBKVBjizARVPAEP0wE4cjxLZX9ALih2D/ERfIIM8bj+dcCqVmjs0NL2
	SWk0u13X3JsDYQmbAvd6aCSKFUc58o2Hql9831WRKZqWiJGFfmk40IgOkF+Ps5G4Pct2xCkSRoj
	r69B8gPGMCoSUqFo1RB8A8W67azkIa1HCxE3hc8TfTpk+NfIVQR3NmdaZRjegZkz04D8TjRTSMt
	u16msydpPdzD02A/cVsQ8C3HNXsaoYdu6nARw4y58UxHMBIfdibSI+Wql7xV/rq7B0XG9h+F480
	1lr0as8AITNH7Bc+13w==
X-Google-Smtp-Source: AGHT+IH3LEFp5SZfJTn9mBfnEMdw55TG3aOnTZaiquCIur+BQEvlh3TkT50lZo8liyX9R/vIcNMUdg==
X-Received: by 2002:a05:6512:4010:b0:549:4ab7:7221 with SMTP id 2adb3069b0e04-54cb688ae13mr591027e87.50.1744275564501;
        Thu, 10 Apr 2025 01:59:24 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50285csm80875e87.110.2025.04.10.01.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:59:24 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: a.hindborg@kernel.org,
	benno.lossin@proton.me,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v2 2/3] rust: dma: convert the read/write macros to return Result
Date: Thu, 10 Apr 2025 11:58:17 +0300
Message-ID: <20250410085916.546511-3-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410085916.546511-1-abdiel.janulgue@gmail.com>
References: <20250410085916.546511-1-abdiel.janulgue@gmail.com>
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
Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/87h63qhz4q.fsf@kernel.org/
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/kernel/dma.rs       | 54 +++++++++++++++++++++++-----------------
 samples/rust/rust_dma.rs | 25 ++++++++-----------
 2 files changed, 42 insertions(+), 37 deletions(-)

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
index 874c2c964afa..1e610545e100 100644
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
@@ -78,13 +74,14 @@ impl Drop for DmaSampleDriver {
     fn drop(&mut self) {
         dev_info!(self.pdev.as_ref(), "Unload DMA test driver.\n");
 
-        let _ = || -> Result {
-            for (i, value) in TEST_VALUES.into_iter().enumerate() {
-                assert_eq!(kernel::dma_read!(self.ca[i].h), value.0);
-                assert_eq!(kernel::dma_read!(self.ca[i].b), value.1);
-            }
-            Ok(())
-        }();
+        for (i, value) in TEST_VALUES.into_iter().enumerate() {
+            let val0 = kernel::dma_read!(self.ca[i].h);
+            let val1 = kernel::dma_read!(self.ca[i].b);
+            assert!(val0.is_ok());
+            assert!(val1.is_ok());
+            assert_eq!(val0.unwrap(), value.0);
+            assert_eq!(val1.unwrap(), value.1);
+        }
     }
 }
 
-- 
2.43.0

