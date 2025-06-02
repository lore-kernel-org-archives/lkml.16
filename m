Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1211DEFDD;
	Mon,  2 Jun 2025 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854497; cv=none; b=rM/lnpqkEUlBDn5OOCv1u+JItC21k0zdf5FWZUrfFQEzmccyt7PWicdfZlKLBUQtrkZz5Tf8jjLxpXlvI0L5E2Uk4eNLziTvH1Y1wI6pxPbZIX6IabPIXcFQocOv6cmfqOdnHSriDWthYvSP0SLif1DTHgwCa4UohlSsz7KMQDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854497; c=relaxed/simple;
	bh=N7DR+bUmuN4+fswwjtPRhudtA1jd7yX7JIbNPakSJqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLThK+fybBsLNVvdzhYcMDGWi5wz/hyPQ+++waRWpk7iXTdu32QpdP1Vj3BndpwNzTKHSPNl91GyI2hcW7oBoG53UBf8dUZe+GwLHJwPTaYhyf5GA0vwKKnUJ8z/3H5LdHm6ojpkKoM/DOwCk8npD0JMIFy4lW9kGqS4BYcmf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2ZS50pW; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2ZS50pW"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5512300e87.1;
        Mon, 02 Jun 2025 01:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748854493; x=1749459293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNjzh0lCljAImtPQH0yiCxzp0Zoe2cG4gqiqoZ8GiaA=;
        b=Q2ZS50pWMZYAImdErYVKlTyH3V0y5f2v7hn5WcLgCtgM8fuuyLblNqxTyHSsN2e68O
         7qD8DAW932eFSFWf3LXMq3kTQW/zPzLhlb3TbqW01ltRyFuPUfZfQGy/Xgwj+t+5XfdV
         /aH1lYxfo0GSHBdgKKTeInLU2/1XDQ/iLwqzElJy0QqYymrwI0i7rFtbXEo0lXxQwg7t
         1XL6PIb1aDK4UkD6sh8pLIoZ+WzpvGJu7bj0Elhn+b0gArg9UzMPwMJOQ0iddZSo5hoN
         Xv1a4AR9e3N0kegyAnQZJcsr9dgEpdt9nfrgkwrjEBJOZJbOFtjWEHJ/vLzkLLtARRsu
         0fHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854493; x=1749459293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNjzh0lCljAImtPQH0yiCxzp0Zoe2cG4gqiqoZ8GiaA=;
        b=sBrvTdlyHtUNI1HoCySOQfYuIYjduz8sSvCJo/qtPBNLLYwtiaXZnrRU4GHZSLUwd6
         04ATbNb9SLrB0eUcGPJ+xeQae2HUmddYOhkw0gB0qb73GmQwQ0CBXuURLCUrGzJ9crMJ
         LmLjTUJFIdwlLZV6Bl+ncBWpSYn476NuwDQBzqGP2qYsMeBvtqkEBIlSYrmAbsdi/DcS
         Y77YKO5Q4s3wYEoA2OdzBXKU4qqad9eXfWn2SRXyiZb5YIf3dKFmRRbEHiJDDFa0MCFO
         fQzXPh/VMIrBSNEfsVecjqirWTxuF0zSZ8Pys2bPI3KKa6Okr5eKfeJ8qtr1kdsaefw7
         Zkqg==
X-Forwarded-Encrypted: i=1; AJvYcCVB20W/Y9vPCqBUILrg0m0Ji+uQwBVUVF3gbd5hUoyzKVliECM8BhLjdEkBo2iMLGKL67HpD0z66jcKlkmCgFI=@vger.kernel.org, AJvYcCVtDVRL+c+Qn3+6oXthOjE9EtmrsV2279ZQWPMZB4pgwz9qW8JJp8MLoyBtH3tqyQSjsGEpSLvPgjvxamw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypxLlKOCuC2sZYcu3piZmulLoPzJppscocmF1wEx2gkiCubFxA
	aitMTAdG2JEBesDZ/AhTHbZg2RF1QKR7IAWU3SHL7L1zvxHl+1vlVuE0
X-Gm-Gg: ASbGncuEOXDb2exJJSI47BOsqEbPeQbkxYvVFofREUsz8ojjdR9MQx0zsW4sIxd28JE
	vIzEFpqDcaAzJ+MWnt8mtRwrahNic4QYpydk7ct8Snvvh1I9OhjQTAT5xyXh5jgSjWI+wKswOEu
	ysT+XOj4kZqvuvu+EZxwdWiYZiEATXjH0ftZQf1JHzeszGYTtQ6RqsuCTmJ2v50Yi9+Efcq/jF8
	EV0dBl2NP+gkH6G9OBIg0wCXmykxRFOyIYQ0XG6G7PM03wRxepfsVMnJilM/F6rRxnUNuoGq7rr
	ak/69abZHa8pqis2O9duzbHy6lOP298s1jBhD7+F/DftRmwOdxL1Xwbsn2OqOSZ3gfrbZRJsPBQ
	3bWa/F9awBjmCsdZajL0bqMKgcmtm
X-Google-Smtp-Source: AGHT+IENRfJOf3u52FspEjXhewCzmDRxrviHPyUYBNoN+lgkyQ/r5Trmcti6p6EUjGTFWv55XZjmlQ==
X-Received: by 2002:a05:6512:23a6:b0:553:2f33:ac0e with SMTP id 2adb3069b0e04-55343190b94mr1983224e87.41.1748854493216;
        Mon, 02 Jun 2025 01:54:53 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a13basm1524325e87.81.2025.06.02.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 01:54:52 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
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
	rust-for-linux@vger.kernel.org,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v4 3/3] rust: dma: add as_slice/write functions for CoherentAllocation
Date: Mon,  2 Jun 2025 11:53:13 +0300
Message-ID: <20250602085444.1925053-4-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602085444.1925053-1-abdiel.janulgue@gmail.com>
References: <20250602085444.1925053-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add unsafe accessors for the region for reading or writing large
blocks of data.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/kernel/dma.rs | 86 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 5a690e5f1e66..b486f63c1d3a 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -218,6 +218,92 @@ pub fn dma_handle(&self) -> bindings::dma_addr_t {
         self.dma_handle
     }
 
+    /// Common helper to validate a range applied from the allocated region in the CPU's virtual
+    /// address space.
+    fn validate_range(&self, offset: usize, count: usize) -> Result
+    {
+        if offset.checked_add(count).ok_or(EOVERFLOW)? > self.count {
+            return Err(EINVAL);
+        }
+        Ok(())
+    }
+
+    /// Returns the data from the region starting from `offset` as a slice.
+    /// `offset` and `count` are in units of `T`, not the number of bytes.
+    ///
+    /// For ringbuffer type of r/w access or use-cases where the pointer to the live data is needed,
+    /// [`CoherentAllocation::start_ptr`] or [`CoherentAllocation::start_ptr_mut`] could be used instead.
+    ///
+    /// # Safety
+    ///
+    /// * Callers must ensure that the device does not read/write to/from memory while the returned
+    ///   slice is live.
+    /// * Callers must ensure that this call does not race with a write to the same region while
+    ///   the returned slice is live.
+    pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
+        self.validate_range(offset, count)?;
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`,
+        //   we've just checked that the range and index is within bounds. The immutability of the
+        //   data is also guaranteed by the safety requirements of the function.
+        // - `offset + count` can't overflow since it is smaller than `self.count` and we've checked
+        //   that `self.count` won't overflow early in the constructor.
+        Ok(unsafe { core::slice::from_raw_parts(self.cpu_addr.add(offset), count) })
+    }
+
+    /// Performs the same functionality as [`CoherentAllocation::as_slice`], except that a mutable
+    /// slice is returned.
+    ///
+    /// # Safety
+    ///
+    /// * Callers must ensure that the device does not read/write to/from memory while the returned
+    ///   slice is live.
+    /// * Callers must ensure that this call does not race with a read or write to the same region
+    ///   while the returned slice is live.
+    pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T]> {
+        self.validate_range(offset, count)?;
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`,
+        //   we've just checked that the range and index is within bounds. The immutability of the
+        //   data is also guaranteed by the safety requirements of the function.
+        // - `offset + count` can't overflow since it is smaller than `self.count` and we've checked
+        //   that `self.count` won't overflow early in the constructor.
+        Ok(unsafe { core::slice::from_raw_parts_mut(self.cpu_addr.add(offset), count) })
+    }
+
+    /// Writes data to the region starting from `offset`. `offset` is in units of `T`, not the
+    /// number of bytes.
+    ///
+    /// # Safety
+    ///
+    /// * Callers must ensure that the device does not read/write to/from memory while the returned
+    ///   slice is live.
+    /// * Callers must ensure that this call does not race with a read or write to the same region
+    ///   that overlaps with this write.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # fn test(alloc: &mut kernel::dma::CoherentAllocation<u8>) -> Result {
+    /// let somedata: [u8; 4] = [0xf; 4];
+    /// let buf: &[u8] = &somedata;
+    /// // SAFETY: No hw operation on the device and no other r/w access to the region at this point.
+    /// unsafe { alloc.write(buf, 0)?; }
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    pub unsafe fn write(&self, src: &[T], offset: usize) -> Result {
+        self.validate_range(offset, src.len())?;
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`
+        //   and we've just checked that the range and index is within bounds.
+        // - `offset + count` can't overflow since it is smaller than `self.count` and we've checked
+        //   that `self.count` won't overflow early in the constructor.
+        unsafe {
+            core::ptr::copy_nonoverlapping(src.as_ptr(), self.cpu_addr.add(offset), src.len())
+        };
+        Ok(())
+    }
+
     /// Returns a pointer to an element from the region with bounds checking. `offset` is in
     /// units of `T`, not the number of bytes.
     ///
-- 
2.43.0

