Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C3922F76A;
	Fri, 25 Apr 2025 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566667; cv=none; b=MMfvHv4DatPF5fpiHCXtR8VSdulbNMRPPQbaG8CDCkbCOW5n2eAlyWTBVIUiMW6Q7Ke1uL+AWe22XxBiUNU4Q9UTBVyVWjAlppt4C0/MqzjnQsXoVMK/rHk/QDFv/8Lf5vam9DfRRTU6q6kiy61HGKEv6IjkT45dfOnBHoGlx5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566667; c=relaxed/simple;
	bh=XWuGO4SJLJGrF+nTghBBzNefxbhT1CZpxRKb9GjitCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqn2aZ045lufO2ULPxrA/nXKUdFwapbd/S3LnO5+V57AaTq/y5lSW8yeliTHWpwxcjItP7Y7xsJmAkADOBl7cAIc5I404msU/N/F2QGfxC4+3vgDA3XUiSyfXRMqJ9OuCsHZMFsHe2pQEVlof4uGFaAtdUvloI7V32Pg7GKxhWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUwGbhrr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUwGbhrr"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so1971387e87.1;
        Fri, 25 Apr 2025 00:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745566663; x=1746171463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3I7bm+ySgu/DQq5ttF0NDzcE8tALma2xJRSt3C9wY9w=;
        b=gUwGbhrrwPpuDCZdRn8Kn3QYxkQby6YNgqtqmPBOi1x5hJuMPj8WJsOTSEE9+ZWuFN
         LFaQUxRZoAMy9dr3pLIAn98mxxobp0n73xKjzreuTfvRejbvjtGqangXdUhzBJo8dQG0
         B2duldf0vkPrmljhELZvuAQJKsGjLE1r9VsmeoWNHiByE68AJ3rg/nnS7daJ0H4SaXof
         N4BSr+66HF9hByMGyBzzhBK8g9VPIDHm3kczNCm0sUek9evcl7SYfdIqzo9gj0IL8hju
         YrgodAvYt4OqeuAMAIhRgLWNyydkAXMRdSV4TR9OHannnYHRTB+7VFhkaX0uDHw+duRf
         4rFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745566663; x=1746171463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3I7bm+ySgu/DQq5ttF0NDzcE8tALma2xJRSt3C9wY9w=;
        b=m5kTbV17EWeJa56uzqYO8OaDzvF4WiSL61PEa82ewG2iYtr6KRzmVijLO/yF3nWjWq
         gyzCS6XY4ZCcDG/Qvlh8ZBENDEEQdIaTcbVk0ybtWCcHRT4u+qJre5LzUx69gNAUZwfi
         khpVjQFHWYIAbXKqC9Y+CxEb00QUqw3p7ZfjDfOz+9F/JNshRywL8WF+h+xx1GkeRwcc
         rZtmDpZwGhbsregtypfvs+kqCi2wxOEFpFF9yNZgslTBgPqeHi050ojXwtd6lDpWsLbX
         mB992TTf1yrcPPWSEt8XmInqW8HO808Js1hWEHeKZrK6wq6PTPxFnihQVQIqhiBUToFN
         M5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCV2vwyJntpa4SAHiV3VuHTiYKVLWi8RLzVJioXZjnqvWAINOt4knvqJeIckDFBma2sOy2++kxMtLypQU31HUU8=@vger.kernel.org, AJvYcCVBUFHnNoZgrr9Z+3DWVPNbpRGCkH4Odnp4ITsJJfEHC2IDfkvol+1FLqSqWZYrc1vgRsNGI8OPxNnNtnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iFcjWEI9vwx7vOnURQm/BUDnvnKmbLzKlb8S7NPQ2kGwDRud
	+5IKmqacMLiHqEB6WrrFz54rDvMwsvSdedmiSpYggiPbTTx01D84
X-Gm-Gg: ASbGncuSteeVqdltyvdDZ5ZxO4gbunNi1yYeSvCIuWWkxeXGWIH7UmaaCyn4DmV7iYR
	Nen4p05/AxoSml6p7Tl10vKjWUt6dFy/QAhRnqTUl5IzqY7OUWmlJUtjQzSBFpzX+rF5nfJ25lu
	iJFIjM8wv244AYmyOWxwpOWoaYPnzno32jpNwzHzxq9eaVnVjxvvbjjFC5TvPQzwIrIx3qyG53v
	tO6gM9lp2TrdEAJPo3qKy70K/5g75UshlXAPgPsc/GVawjE8SJDViu9wvg1rc7Jzgfxi3YiBtP5
	yr/iXUIbJmZahZYSL7yr36B4tjcZBHCRfnwazWuS0/qRzEgHpGwjWZdWuN49L6aZsspFhwPadvg
	+CRjYvgTIiC5zwg8WHGIFiiJo+/RV
X-Google-Smtp-Source: AGHT+IE/O7y+ibpJZn77AUv3aPfHPZbiY7wPyl4ijZldhKUFWJKAEQIowa051VjLOyzso8Bq8UG5fA==
X-Received: by 2002:a05:6512:318b:b0:545:6cf:6f3e with SMTP id 2adb3069b0e04-54e8cc0f2c2mr287610e87.49.1745566662719;
        Fri, 25 Apr 2025 00:37:42 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9e9a5sm504391e87.132.2025.04.25.00.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:37:42 -0700 (PDT)
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
Subject: [PATCH v3 3/3] rust: dma: add as_slice/write functions for CoherentAllocation
Date: Fri, 25 Apr 2025 10:35:42 +0300
Message-ID: <20250425073726.1027068-4-abdiel.janulgue@gmail.com>
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

Add unsafe accessors for the region for reading or writing large
blocks of data.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/kernel/dma.rs | 85 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index a61da5eeb017..e01bb7e7c440 100644
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
+        if end > self.count {
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
+        if end > self.count {
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
+        if end > self.count {
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

