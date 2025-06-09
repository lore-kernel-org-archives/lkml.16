Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177B254AF0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466283; cv=none; b=NfOXcR47uWYotg2bIfCqcJEu4Sn9Cj8tgFfeO/M64g+5EBOn2Mzf1CrEQZp5ZUx5iBwW64OiV07MihEcBc6UhVmz7PBrPtMqkbURLU97xi5kbA4Ln6xILnUF/5tg+saZncFlYCoYw0DehRPRUBxKwGSsEj7T7r5GPJ1W48NWmkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466283; c=relaxed/simple;
	bh=XrghL7Anp61mSscRnEBfEyNV90p7S5EayNDGXNwRoKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dNvUM6/mwt0qoF8qj9UNu2e2UtzKwvuA7bFyxhw3V1H9Kb1TxFNDl6WUEdGOkweiPRmpquABt5gO/90hgCOWIy4+gEz+kmvCkaZBv7qvMPaWRend93giaHH6cv9z2GsFEHsUp9N5mUEvjuYXbVJf726MiVmbwiAbxQF3uCJPeAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWjUeL6j; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWjUeL6j"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3078951b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749466281; x=1750071081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc2uNagszMlJu32uWlAF6xHcdKDRl2wpqVFIK+wVb70=;
        b=sWjUeL6jfMPgbYey0A/YKhqDevz8E9ohG6GeId94nsgdmAGqeLu3XkxAMTl20HlPOD
         XTeYsCV6x5+sVBxJ7D2M1vNsZe/rYmBztnzHVqwfHuxvNgpSXC689ULP7HZJVEAMElNR
         3EgxUp0aYJ4lEzPDKVLVqTsOE8QxJHTbAVY1xpcF87p+7exYXiWhi0CLJfVea29fUVrB
         G0Y0Tnwh8LCMovW36DL8raEGjru/R0woGI+dle2Ux7a/FQNmEbav1dXTd1E5TLuLLAUL
         n9c54+M9AiaKlU6lfFN8TmjOOEGZFO2DRAsh4kOQ4i+Nr6uUP+bA2KjVnRqoYf+XJ/wd
         V9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466281; x=1750071081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mc2uNagszMlJu32uWlAF6xHcdKDRl2wpqVFIK+wVb70=;
        b=iUzjoGPjrg8QSPDx6TBnAC+i1c9QDjqxyePGBoQkR0IcZ216cgEqq5qazt4HFsOKvK
         eZ8Pku/THB4xWoWPQ/7wtOgE4lusmxSTzeEjbupgxmWkGY/zjFsYzKo46Jfh57bJ7AJq
         sgXBUbr0uMxjJl1PwhibLxgVCiNTSNkQl/RPFR0H4VZ4cNUzLQkwRmxJbb4w6vOCfBAR
         2qcYBbciTpvIhaEYqb4qilDFA0rzKSA/JE5pHZo3h2TTUsY3C6wBYq6mJMg6bLqHzp8H
         iyZrcFhcbr3fTMHWvUh9nXGq6i5G+anadg3kuRH+Eq39zJGQ8W5hMn0kooRz2dm/nqMP
         c17A==
X-Forwarded-Encrypted: i=1; AJvYcCVA+PpPTe898/RTiO+8bEaORuG5VWRhQwhShrq0BivG1r9/YMqjTsy3rBxXybQTTg9fF9d5CUU+qrmfB9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBi08uFLOxs3E7jaHI8ocYOy1eNZ9CnsiypTXyG8jcw5TfkhB
	JO1ZE/BotIKXh2syOA5OmamASsVocSPIvDOiF2ZD0441Ris0qnNj618WW7cJz/su7nQ=
X-Gm-Gg: ASbGnct+MQYDXRrCRqDaMUJ6yb3qP6LhOGjJpWX8jLl/cL5JbGqvlZ8dx9gMpe6Ek4s
	HkwD5C8pypym00u/kP88K8SC9tDXfR5kLCfs+Z4EPEwRnrYq9vOJk6VaY2g5Qbfe3NNePDMQ7gM
	WGMlUjRh/gWM2m03SK12On0U40X0HglErvDB2BEjqidSmEcB1uFx9f9suRaecJFVE++cC5uZz/w
	RqNmjOaLjNQ/YBGlhJ+/7IZ/Pc/ENenIjSyslIf3qf6rkekvSXiJwuYPqEEgwfrYJWnFRU/o7XT
	RTriHDlp5jIBxF8LPgeV8qVmdNFAopQHf53PSYrQWcSmLxdCGQCSTyR/WYGyZj4=
X-Google-Smtp-Source: AGHT+IG6kaISh+EtPBIg/Q3w1tVj/21ta5hFi8682AcPrVymf61ekN9kwGXxyVoMkvT4Ut7edFYNMQ==
X-Received: by 2002:a05:6a00:94a0:b0:746:2217:5863 with SMTP id d2e1a72fcca58-74839af6c88mr8878390b3a.6.1749466281380;
        Mon, 09 Jun 2025 03:51:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0bd815sm5625169b3a.109.2025.06.09.03.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:51:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Date: Mon,  9 Jun 2025 16:21:05 +0530
Message-Id: <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1749463570.git.viresh.kumar@linaro.org>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds abstraction for representing a CPU identifier.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/cpu.rs | 102 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index 10c5c3b25873..0b545dbf5c83 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -6,6 +6,108 @@
 
 use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
 
+/// Returns the maximum number of possible CPUs in the current system configuration.
+#[inline]
+pub fn nr_cpu_ids() -> u32 {
+    #[cfg(any(NR_CPUS_1, CONFIG_FORCE_NR_CPUS))]
+    {
+        bindings::NR_CPUS
+    }
+
+    #[cfg(not(any(NR_CPUS_1, CONFIG_FORCE_NR_CPUS)))]
+    // SAFETY: `nr_cpu_ids` is a valid global provided by the kernel.
+    unsafe {
+        bindings::nr_cpu_ids
+    }
+}
+
+/// The CPU ID.
+///
+/// Represents a CPU identifier as a wrapper around an `u32`.
+///
+/// # Invariants
+///
+/// The CPU ID must always lie within the range `[0, nr_cpu_ids())`.
+///
+/// ## Examples
+///
+/// ```
+/// use kernel::cpu::CpuId;
+///
+/// let cpu = 0;
+///
+/// // SAFETY: 0 is always a valid CPU number.
+/// let id = unsafe { CpuId::from_u32_unchecked(cpu) };
+///
+/// assert_eq!(id.as_u32(), cpu);
+/// assert!(CpuId::from_i32(0).is_some());
+/// assert!(CpuId::from_i32(-1).is_none());
+/// ```
+#[derive(Copy, Clone, PartialEq, Eq, Debug)]
+pub struct CpuId(u32);
+
+impl CpuId {
+    /// Creates a new [`CpuId`] from the given `id` without checking bounds.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `id` is a valid CPU ID (i.e., `0 <= id < nr_cpu_ids()`).
+    #[inline]
+    pub unsafe fn from_i32_unchecked(id: i32) -> Self {
+        // INVARIANT: The function safety guarantees `id` is a valid CPU id.
+        Self(id as u32)
+    }
+
+    /// Creates a new [`CpuId`] from the given `id`, checking that it is valid.
+    pub fn from_i32(id: i32) -> Option<Self> {
+        if id < 0 || id as u32 >= nr_cpu_ids() {
+            None
+        } else {
+            // SAFETY: `id` has just been checked as a valid CPU ID.
+            Some(unsafe { Self::from_i32_unchecked(id) })
+        }
+    }
+
+    /// Creates a new [`CpuId`] from the given `id` without checking bounds.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `id` is a valid CPU ID (i.e., `0 <= id < nr_cpu_ids()`).
+    #[inline]
+    pub unsafe fn from_u32_unchecked(id: u32) -> Self {
+        // INVARIANT: The function safety guarantees `id` is a valid CPU id.
+        Self(id)
+    }
+
+    /// Creates a new [`CpuId`] from the given `id`, checking that it is valid.
+    pub fn from_u32(id: u32) -> Option<Self> {
+        if id >= nr_cpu_ids() {
+            None
+        } else {
+            // SAFETY: `id` has just been checked as a valid CPU ID.
+            Some(unsafe { Self::from_u32_unchecked(id) })
+        }
+    }
+
+    /// Returns CPU number.
+    #[inline]
+    pub fn as_u32(&self) -> u32 {
+        self.0
+    }
+}
+
+impl From<CpuId> for u32 {
+    fn from(id: CpuId) -> Self {
+        id.as_u32()
+    }
+}
+
+impl From<CpuId> for i32 {
+    fn from(id: CpuId) -> Self {
+        id.as_u32() as i32
+    }
+}
+
 /// Creates a new instance of CPU's device.
 ///
 /// # Safety
-- 
2.31.1.272.g89b43f80a514

