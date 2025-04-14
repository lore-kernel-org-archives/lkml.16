Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F54C27FD79;
	Mon, 14 Apr 2025 19:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658938; cv=none; b=rbQOMsWiSu8Y8LMt2ByBaC/s0r6/kPaC1WSBFIYtvYeCAWbjiKFj115BIbiDMDxm30/LtbAlLkLRYbF4ffKkD4+ReEtQ+HYKkt9ZVfCS5VtD2EUo/FlDL+gEBW/gNcV22Bjof1aX7bLFC44zjjrxlWhMdDtOqxATllMfiHvarCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658938; c=relaxed/simple;
	bh=QxD8SEeNg4LzLLT38lSE+fXXb/oKKvXm8xZQuoGO484=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AWccqxsUioJOkwA2ba36c/LqHu26MjDBaYhFYDsUoS3fEZP/GH9nyX+iQTCeJESzellVvIB5g0DrHmdsNCiPZEGDgFQCnj03cpoYztusp9vtiSfh9uxewIdGg9igFvl4LRqjsn7Ob/onXt9F7KV4GERp7Qkt8mBUJcRJir+d54Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhF1rO/5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhF1rO/5"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so1364933b3a.1;
        Mon, 14 Apr 2025 12:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658936; x=1745263736; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFS3X/OrT8fO8A2ptqVzZaLjnbKEAJqbwwH6K2uGZ1s=;
        b=QhF1rO/5ZiP57DPRIhbJY+349G3d0hSJin/HBEYBWvsT0zgj7zQ4DjvwqCkmzpEqeQ
         td+DLsK3wU1pbkCgLovbKkGFZNDLL62cZnIGq6M4iT9ZjtL8E7xw5bJ4aDIpBhmdqqn+
         o0TT4iU8SOf4RyH+GoDlx9AHRmSc9SZAs7FhiMM9yGDi5YKN+K3WnCoqvSxAHBJL3gR9
         8fqPkwzoz7tPmf6iJuqC0uiPQ2F7hFWnKUrgwsiAwgx7DGc2CSZZaV/d90mdVXBfsJoU
         UJaCCMGiOaZlgVXnJeK7rAmTn82s0e0XwLhGEsQfTDIueXhXD7KzvEDB4VkMWC4TMQM/
         DPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658936; x=1745263736;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFS3X/OrT8fO8A2ptqVzZaLjnbKEAJqbwwH6K2uGZ1s=;
        b=gZcWpnEY547Lfsu6dunRTBX1WnLGmK9k+/39LK+l4ytHmMxFbAyZoY/kyq2DW6Y7Wp
         9afSAahTtn/NvkbmkhRFatMQs7Op4rMq0UHcKxYCjwwwH4W2oNKPL2lvK2UuN23/ljmU
         UmR/P9s7v/tzGwrhyfOyG68SJ73Y4EqthImv2iiKJjZ8WAfge+gVtZStjMJsUN+kMuPU
         6a37CtWKfbunfsB5O9nGf+bwHyB/NorFO3Igle1k67EVJwZsam1d6fokdEvIpxSFawAH
         my3I2x0EmnxAW0//AcT5BAIZitmAWjAGM/yF180x6aXZTESk4z/1UITWswjyjlFo+ge+
         Kg8A==
X-Forwarded-Encrypted: i=1; AJvYcCUfVkZGyMHFZxq8qUlXHeT3hN1cwDIh+ZZuZGVgn+I5kP63FlOgJrDur+ezD2h68D3UEb2EKMx9S9Oy+NjjwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhijsBgncLczuux+FIAHunZX7R3Zw8aF238/5v3Kn8sXDvJuVM
	3hwTRrPYVMYc1JjPDatGO2ffjZeNQHoNHo3FSdR2d9/L2XKZCMry
X-Gm-Gg: ASbGnculK2++/c/GAF48czx44WG10FgeRxhpyHLnD3FNuUtFcQ5IL2SfqTPGUT1HVTJ
	8HxLIBCv7duqf1M2qs6T/r5AG1vvVzUSa1ReKLTz3i95PswH/JgRDDkpXm39DHuvZsOta6fWnX3
	A0XAx8mCljyNcCiz6qusmkaTSxM0I8jiXzPmUPjk/fKgorNQ6PE3wfu+3rP+WnSFAZYmYMzvUeU
	i0tIw7LgVYzdA4uGkyFGHoWX22kQ577KO1CnFTFwCcjhgNaRTqI58vMQYvfSo/LE97nMYKlq8rh
	vOgP3tO9X9hL9UKyz5mFaGTf6X5Kh9IrGZoJfY5S3yRLuBIPytUSnZRDXZbFT3rZ
X-Google-Smtp-Source: AGHT+IGApKdaH7X+8I19ZcTXbxTvcBWcVLSNn10u07GXbXxjfm6pmm1OfmYmXFjGDk/53fTz6utHXQ==
X-Received: by 2002:a05:6a00:ace:b0:736:6ac4:d1ff with SMTP id d2e1a72fcca58-73bd119d019mr20472149b3a.3.1744658935521;
        Mon, 14 Apr 2025 12:28:55 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.174.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f9bsm7223159b3a.104.2025.04.14.12.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:28:55 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Subject: [PATCH RFC v2 0/3] rust: Add Per-CPU Variable API
Date: Mon, 14 Apr 2025 12:28:26 -0700
Message-Id: <20250414-rust-percpu-v2-0-5ea0d0de13a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANph/WcC/1WNwQqDMBBEf0X23JTsqlR7Egr9gF6Lh6irLlQNi
 UqL+O9NvfX4Zpg3G3h2wh6u0QaOV/EyjQHoFEHdm7FjJU1gIE2JzjBWbvGzsuxquyg21KZJlTY
 mjiEsrONW3oftCY/7DcoQ9uLnyX2OhxWP6idDwvxPtqLSinSOeOGMqMKiG4y8zvU0QLnv+xemK
 QzsqwAAAA==
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744658935; l=3782;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=QxD8SEeNg4LzLLT38lSE+fXXb/oKKvXm8xZQuoGO484=;
 b=PZxT2pwH1qG8y6oZkAkd9ckp5L98cjzxp3gKStsaCxKn0Ni1U3/97uqxINi7sOPZ1qv10WdPT
 m/JiRqme18TB8UWXfK1qiUoqfRNEFvJjLYew3nF80JxPAQaNQLuAxL9
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

This series adds an API for declaring an using per-CPU variables from
Rust, and it also adds support for Rust access to C per-CPU variables
(subject to some soundness requirements). It also adds a small test
module, lib/percpu_test_rust.rs, in the vein of lib/percpu_test.c.

---
This series builds on my earlier RFC by adding support for dynamically
allocated per-CPU variables. In the process of this work, I became
convinced that the API in the original RFC was untenable. In particular,
copying a PerCpuRef would need to be an unsafe operation whose safety
requirements would be very onerous to verify. Essentially, a PerCpuRef
would need to be entirely unique on each CPU core (except for the moment
the copy is created, immediately before it is sent off to another thread
--- technically the requirement is that the copy could not be Deref'd
before being sent). This is essentially impossible to satisfy if you
wish to use on_each_cpu, and it is certainly not ergonomic.

The key challenge was preventing the creation of aliasing &mut T's while
still allowing PerCpu<T>'s to be freely copied. Ultimately, Boqun
suggested a closure-based API in which the user asserts that the
contents of the closure don't "nest" with clones. That is, the user
asserts that they're *not* doing something like:
```
let mut my_pcpu: PerCpu<u32> = /* ... */;
let mut my_pcpu2: PerCpu<u32> = my_pcpu.clone();
unsafe { my_pcpu.get(CpuGuard::new()) }.with(|my_pcpu_val: &mut u32| {
    // UNSAFETY: This is bad
    unsafe { my_pcpu2.get(CpuGuard::new()) }
      .with(|aliasing_ref: &mut u32| { /* ... */ });
}
```
This safety condition is (in my opinion) much easier to verify because
we must only ensure the contents of the closure are well-behaved, rather
than try and trace all possible paths that a PerCpuRef may take.

This API is certainly different from the original RFC, which is why I've
sent another RFC. It's now much closer to the user-space thread-local
API, though still avoids requiring the use of Cell-like types.

A small number of simplifying choices are made here, namely that
allocations are always GFP_KERNEL. This was done with the intention of
keeping the patch small while the overall shape of the API is evaluated.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>

---
Changes from RFC:
- Renamed PerCpuVariable to StaticPerCpuSymbol to be more descriptive
- Support dynamically allocated per-CPU variables via the
  PerCpuAllocation type. Rework statically allocated variables to use
  this new type.
- Make use of a token/closure-based API via the PerCpu and PerCpuToken
  types, rather than an API based on PerCpuRef that automatically
  Deref(Mut)'s into a &(mut) T.
- Rebased
- Link to RFC: https://lore.kernel.org/r/20241219-rust-percpu-v1-0-209117e822b1@gmail.com

---
Mitchell Levy (3):
      rust: percpu: introduce a rust API for per-CPU variables
      rust: rust-analyzer: add lib to dirs searched for crates
      rust: percpu: add a rust per-CPU variable test

 lib/Kconfig.debug                 |   9 ++
 lib/Makefile                      |   1 +
 lib/percpu_test_rust.rs           | 119 +++++++++++++++++++
 rust/helpers/helpers.c            |   2 +
 rust/helpers/percpu.c             |  20 ++++
 rust/helpers/preempt.c            |  14 +++
 rust/kernel/lib.rs                |   3 +
 rust/kernel/percpu.rs             | 239 ++++++++++++++++++++++++++++++++++++++
 rust/kernel/percpu/cpu_guard.rs   |  29 +++++
 scripts/generate_rust_analyzer.py |   2 +-
 10 files changed, 437 insertions(+), 1 deletion(-)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20240813-rust-percpu-ea2f54b5da33

Best regards,
-- 
Mitchell Levy <levymitchell0@gmail.com>

