Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1E820C03E;
	Thu, 10 Apr 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275570; cv=none; b=j7KkEZziaoZ0Sst9DWHWyjlRQ8Y2bxs9guzPMnAP/kQ6qedQuquFO9FpAyqir1EwBs7HbA67qxSJPUlYQj3h9Bti5HrJ0dKF9vIoB2vJz21T/dQcHbgHf0YSZrUXh7bdnXO9dV7g0voDX7LLGd6FXW9daNYa2V5U+sbsb75Wi4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275570; c=relaxed/simple;
	bh=Dm0EuL/Hf72yUy+knejcLhK3TuBfjuxm/0quqsCP/xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ji8a9pBJavL29AudtlFG3gEAX8HdXu/jsqzNbT8b6xol6t+MA0OPHuJEFfpwVht+mBlhAADRHG4t3UWORuQFb55zMw4NebzofUM2QMiFUdqy26mXacpjhxPCTyQBpOT0mSpxPvhp9b7G8olgXtoaYU6wDiy3YhjucOYqo33xaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdKNBZ1F; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdKNBZ1F"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10956398so708603e87.0;
        Thu, 10 Apr 2025 01:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744275566; x=1744880366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY+y/t6CAx0RYTvL64DfJN6U/KJsLf4NXsmWUCaqj0c=;
        b=VdKNBZ1Fq6BQHSiIjBdWidvIVVEzDiXOh2gaCoHqLdYuwpszclbSZfRxA4CfzMmV2Q
         5S0A2/qL62g3m/LqvDyZ09ltPNwfGpFN734Rbcvm9G2tzyOuOMiXjHTZtOXRULR3BCmU
         /gQpHLHaNXlLfsJAPSRcxj2sbW1MkcUMPsHa84zH3pWdFU3QA5XaCcWQTHn7rfXDXs4B
         ibascD/Iqtv+nLU2hkcJHr5VYIvBbGPRWI7qO3Gy+N7NQyGeEwQ/HCtQMeraqvSodQDJ
         i8MgIN/Nh99A7FBQyW+mv+EBNIhs9eyH+VnC27+vGyJYdz7/ooQYJDGQDQsL7CN/n8ZI
         sIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275566; x=1744880366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AY+y/t6CAx0RYTvL64DfJN6U/KJsLf4NXsmWUCaqj0c=;
        b=FHgODhT/9FZSzXhdeAkAGZ3UdYQLwatrUEt4kFkTMWyp5u5wfdKADZ4nujEGh47Qf7
         I2jBn3qSBXhgEi5nCW/cXOJarPA4hjiI/wXABodFLOTnRKXfRuT7nJ3xdouUSqaQEekd
         t6dFjjX0eNQl9DEmi3Q+z2CL9+nF6v70syhEtj8fK57r8eRqodTDFxef5nbxBpEuR8l2
         +xjnIM3LqJrn7IhY6OAcYdZNQwJWqGCdSPvVn5bxA7L2xM6Bv6mbwpiZE41AyTVTGbNt
         OW7qL+oToYcfl1Zb8YKN6kcsJOtdq5Js1CpJQu+0fOQ9T1f0RCFk+naYrwsPWv/2K5pw
         xpxw==
X-Forwarded-Encrypted: i=1; AJvYcCVeJQ1e81iTm1WkdyABlDhGRviUCjL7PPt7LUSK5AFuA3GvvnGqyP7qrpQ/xLqMVfvyT7dzn7RuqVKTxOAsbOk=@vger.kernel.org, AJvYcCXZiC49JzpOx1qQZT+4pVWiIVcIVopQcvd75MnvNmCCMFEa88WGyoKdspsMDA9q+JEkGLUb4zdbZVESWHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdZ+W9i9qu89ROB16ZHsJiN+eP4I5gO5MBOBlj4XH01Lgw8w9P
	SiswAVTk+EybV+c6OdZCJEVstpOGqdfe0vfR3aamCPoac+7cbCXI
X-Gm-Gg: ASbGncsna/jsbJqnKNS9CFH+3HXWtrtwP9hjB8T/7YIADhpyzlQ1TdDp+Yu4Ts8UJWj
	DvfnU5JTQGg9ppZ/+bIgB6jwwD44KQ9gNhtXONI4E18fAG9MroyoR+LBU3+Qdf3awvm1CzlEiSJ
	XEbTbH97dx/GtAtwHRbRVcgUkJLRupG+Yexti03mEtvizcavnCJzVvLLPAH1EV6bo0fZZzCAMao
	J4DQaD6hgkYzZrXz8jQj0cjqx1/Iwv2f0kIYht3QrKQsMg24BoiZeA6FdR9E5vCPQqS+ZldHRPR
	ahPazm3HDUK43Eh3GTTTrHTZfU2yEJnr+8f1NTtFWekS7fjiBd7AtAzMODj+gZ6f+I4U1BY33+b
	iyiJO/s2udEydVmmPTA==
X-Google-Smtp-Source: AGHT+IGz1LYsDiprrFBJZFFqhs+1F1wEyvjL2TCIsFB9waYQMtth+506AVNqZHbMN3ejNCWqSKWKSA==
X-Received: by 2002:a05:6512:15a0:b0:549:7145:5d2d with SMTP id 2adb3069b0e04-54ce8a48130mr530657e87.16.1744275565490;
        Thu, 10 Apr 2025 01:59:25 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50285csm80875e87.110.2025.04.10.01.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:59:25 -0700 (PDT)
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
Subject: [PATCH v2 3/3] rust: dma: add as_slice/write functions for CoherentAllocation
Date: Thu, 10 Apr 2025 11:58:18 +0300
Message-ID: <20250410085916.546511-4-abdiel.janulgue@gmail.com>
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

Add unsafe accessors for the region for reading or writing large
blocks of data.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/kernel/dma.rs | 85 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index a61da5eeb017..880f6f04ba86 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -218,6 +218,91 @@ pub fn dma_handle(&self) -> bindings::dma_addr_t {
         self.dma_handle
     }
 
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
+    ///   while the returned slice is live.
+    pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
+        let end = offset.checked_add(count).ok_or(EOVERFLOW)?;
+        if end >= self.count {
+            return Err(EINVAL);
+        }
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`,
+        //   we've just checked that the range and index is within bounds. The immutability of the
+        //   of data is also guaranteed by the safety requirements of the function.
+        // - `offset` can't overflow since it is smaller than `self.count` and we've checked
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
+        let end = offset.checked_add(count).ok_or(EOVERFLOW)?;
+        if end >= self.count {
+            return Err(EINVAL);
+        }
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`,
+        //   we've just checked that the range and index is within bounds. The immutability of the
+        //   of data is also guaranteed by the safety requirements of the function.
+        // - `offset` can't overflow since it is smaller than `self.count` and we've checked
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
+        let end = offset.checked_add(src.len()).ok_or(EOVERFLOW)?;
+        if end >= self.count {
+            return Err(EINVAL);
+        }
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`
+        //   and we've just checked that the range and index is within bounds.
+        // - `offset` can't overflow since it is smaller than `self.count` and we've checked
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

