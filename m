Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D995823ABA1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561730; cv=none; b=UFsXKTLVTf2AP5n2KLhoNA4OpUuGvFfeOvEsH1Xf5HSb8PdnbjR+HOpQnp4DhqK7YEMeOPaEHAgrGo7qzdUCszq4UHgSb/KNTQz7WHsARPrjXzxAtSqoYpVkBDMLfeXl6lFoLzXJTqukc+g2g9/V3q1BxEpBpG0GE+644jdv7uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561730; c=relaxed/simple;
	bh=R2pZaS4Inj+1kow0TGmJZeY+hDxhkzLhakpOlf2UzU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d+YVE46IH+gnu7jb3yEkxOvoAhLcfKFFT2mdICtoGJNVY6NqWWJdtnGJN9GMcnsKmCDzmAcxLzeC8YvhcadOfHm3c1rji7pWm+41owtIckQhi9Rn8Zt+sRRojU1gUO4wmNI3KrOOywQcBRNJ4/K8xDii2O+NYPMjcAX3sLCbE0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cq2BxIWT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cq2BxIWT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234d366e5f2so61536945ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561728; x=1750166528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVEmdQ83ragxEJ1AiZ1OnaThOc00e/tBKCQz7GkXCKw=;
        b=Cq2BxIWTwjISN9qrtEcs1Br3mK3OqE/I/zur9TMATUuEhDWhpbDZslVRezBJV9EAer
         Q/4xM4NXsJxqpIqCsFHz/tLozlhgf26paFnz+rXUXblt6qQG9TjWaXm39j6y6vSgyGH0
         gm2ZQY6wRXOvAOI27WGYhNWPvKLau0/jm27RHDGvaJniUo20PvkQEjlGRnP0oQ46Y1Vj
         K3lFxvGC+hxTUIquwigtFhKkHQyJSDePbJ/gn8ckW/nNWzD9SLrGnjHD7qqK0zOsifUa
         e+lD4ARw2bafxyvmMd0eAqaxyv/m58n+FlV4d6OiTzNpLRW7MeXNsNsGwtKa/ya5xj88
         W5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561728; x=1750166528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVEmdQ83ragxEJ1AiZ1OnaThOc00e/tBKCQz7GkXCKw=;
        b=VpsJlajDWS39ShMmpM6PGRA/ImtPoXpvmLw4K0tgLvsrUhgUd7CrsSIRyZrbG4zSCu
         9FxOlTlhL/S/vUdIO1cqH+eTNMqU2Qvx7rH7FktcY4GZknnRpqq/oK7zhjIXzHkJCQIX
         IpmBmsPIn2VWH7VunQ84qjkU9etTArEDVsgtjtM09rbUSlyLZ8rQqyusRkhu3g27zqnb
         2ncMWlFw1fGz4acYdCVr1U8cz3DamJfD94sLPeSuWluda3bhgqADu86d7ELKWNe5lhYt
         wRCSCDLuQyTM58trfOzMqZBSMDgGMnbfIYC5GNA3YrDPKJoE3mAHZFep0YViYh//Kdnp
         dwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK7DQMwSfq9DhW3Fvxe49O6MUQ6/srwvEq9oVLkLQvtUlmWqMggf7if5Pd2Y/dNS3QBGc7KML3PUZAH8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/62a0nSGWKqJ3t5fhOnkuliBvPaVbYLJPGFNLFxw92Efjy5t
	k2lS6fPr9zNYPRzck7oVQM+qxANeW9mNmd17wmYvbVFcULnULlmDPdSY2tWv8E/mdGs=
X-Gm-Gg: ASbGncu7KKCc2O4rbA2gXRdNfqruZgE7WJSZpCeyoawEOnuRrVPRCwOCVNAjBx18Qgu
	MMSw63wu+s1J6Oy5PMstRAosmd7jHMboZWQwDHZLLDyM+uNmFK5h33FfmKaSyyokiLQ83c3pJFN
	+WLQXaHW0pkOudns/8TRVS9E4T2WPTAlcKX9aVgitYxfJ9K5Y9f+bdzTjYFgMfJTPV5fRfZ9Nl9
	3Yo0BulRuCijZ9tr+wPKr5+/2XqJmojvLdp6kl413vhOh4vYIsecdf3VJ/XD9klWr3BWLHtuWcD
	M3TOVZklhg4+MUTfTRrcPNhpUeL61c4HAh5+VKVPcLuE2au4SVKUvxsKwxeT3jQ=
X-Google-Smtp-Source: AGHT+IGx5k83MsrhLinmP85CumO7M2Xp1AotBfN/2FVNNvRad0ckpgu3dDBIvaj43xzWCic7a/kotA==
X-Received: by 2002:a17:902:e741:b0:235:668:fb00 with SMTP id d9443c01a7336-23601de827dmr248498635ad.46.1749561728237;
        Tue, 10 Jun 2025 06:22:08 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059b3sm70224065ad.175.2025.06.10.06.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:22:07 -0700 (PDT)
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
Subject: [PATCH V3 1/3] rust: cpu: Introduce CpuId abstraction
Date: Tue, 10 Jun 2025 18:51:56 +0530
Message-Id: <cf3708ce1b8ebf75adc48d62f7ad72ad29241ec4.1749554685.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1749554685.git.viresh.kumar@linaro.org>
References: <cover.1749554685.git.viresh.kumar@linaro.org>
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
 rust/kernel/cpu.rs | 110 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index 10c5c3b25873..6a3aecb12468 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -6,6 +6,116 @@
 
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
+/// Represents a CPU identifier as a wrapper around an [`u32`].
+///
+/// # Invariants
+///
+/// The CPU ID lies within the range `[0, nr_cpu_ids())`.
+///
+/// # Examples
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
+        debug_assert!(id >= 0);
+        debug_assert!((id as u32) < nr_cpu_ids());
+
+        // INVARIANT: The function safety guarantees `id` is a valid CPU id.
+        Self(id as u32)
+    }
+
+    /// Creates a new [`CpuId`] from the given `id`, checking that it is valid.
+    pub fn from_i32(id: i32) -> Option<Self> {
+        if id < 0 || id as u32 >= nr_cpu_ids() {
+            None
+        } else {
+            // INVARIANT: `id` has just been checked as a valid CPU ID.
+            Some(Self(id as u32))
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
+        debug_assert!(id < nr_cpu_ids());
+
+        // Ensure the `id` fits in an [`i32`] as it's also representable that way.
+        debug_assert!(id <= i32::MAX as u32);
+
+        // INVARIANT: The function safety guarantees `id` is a valid CPU id.
+        Self(id)
+    }
+
+    /// Creates a new [`CpuId`] from the given `id`, checking that it is valid.
+    pub fn from_u32(id: u32) -> Option<Self> {
+        if id >= nr_cpu_ids() {
+            None
+        } else {
+            // INVARIANT: `id` has just been checked as a valid CPU ID.
+            Some(Self(id))
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

