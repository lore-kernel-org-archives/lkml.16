Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAEA1BEF77
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220168; cv=none; b=fWJkQSrCB2vXt7DYb0cxW3kWk+U1E2EOcIRlaLUiV79nRTCSgkjNrc420IckZUO1f00wSyoweBhDMvBwvYzfMiKzh5DV34NRcp/widTzFp1OGbtW6/46pynqDSrS6s2Es9836SXWM/2bItinq8GWVU65aTUG+gr2jot1JnLcCGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220168; c=relaxed/simple;
	bh=u130Nqv9yQVBBp5u5MXJKkv1c28steTVKMoPZ9gakPw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BpFtWnFJDewgOpYMKYzUqaNE9GC/WL8H3kTlMG46VGNqx7gq+UfLWNDvOxAr7pzWQXADWUIydCfOoJnUVAJNZggEdF66y2+AL17V90rFzG3241RiEm/X4Duf5b5QfXw8maXDszrbvTJawZF/ooGJxFfklP8p4Q4cDKzNTivCtr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=melGF3KR; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="melGF3KR"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b0da25f5216so2300199a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 00:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745220164; x=1745824964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLpgHNLudPUMEs+eRk9LcU0/SR8wkW/EVthqJwNyIs0=;
        b=melGF3KRtmeff3KFjJYxdkAs3hLpNgnIlUOa/a5muTspP7qG5n8ZNoLuoXLzVzB4SF
         CFFpm90kaLkqvJz5a2W3Ea9gbtZ9OclLvBgOQ67CMEHFNu8G+Qzi8nUKQ86+SISEMBtH
         Zeii7K/gmr0mnvfSozwTGfUI6EqmxZoDLnWA6pdzprG2BPaXhiUyoAM1j8BfIhncql0e
         9wJmIhcvp/Or7Qc4GoiFw8dSjkcFuWwADZ7dHDTVwlDWIso4HQmf2ks9sgOlmE8pQXEX
         5aFF9nFdZuKt3gSOKbccylUDAScwoFo9Sj3/CluEpdFVGi7+ySWz+4ouCB/yZnSYVR70
         K5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745220164; x=1745824964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLpgHNLudPUMEs+eRk9LcU0/SR8wkW/EVthqJwNyIs0=;
        b=ecXQmhiU1VNJcDvkFYimNJqiFMerOfq+aNjvYDXLyuh6rhrSCCK0FGBvYSTAaCRVLw
         1rRFOpD5Yk2u3b+aXL5MARcidZm4d7u5qQXZcifp1MKW8wxxL4l8BO72WpRa72doCXeW
         pPzJ/M7dL0IXT3jFOVN4Yd8jL5U5Phpxd8aXHwh3Zl3ohr1rgAm8OVRZVgF1tth0Il2a
         IQALOhpZGz1j1dd9onZ2TSlV3Rr6xOJUSYxZdSh3wySavxs04EIdZI4TMO7qWzDo8F0F
         XidxGfzFhLfVjxroerE0NW/Yd7Vubgwof+foeM6hqmQgRZ7bAS7SkkKrAjsxi4UVTFjK
         7iUA==
X-Forwarded-Encrypted: i=1; AJvYcCX/mTTe8TvJPqolB04vDvymn1fArJ0rBd0iVbiYiIvzF0+ID2C1zrMbmzlPV4UQiOrA1SKlMFMrVk9Xkuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdZZYioD//uh7yIo0Pzzop1Rbv6bqgevsbGLAJSmaltdTAKh17
	rBUg+3SuVaGzaLOtd8eTZsBv5KQWz02GguW0wRf1+LxWytfHwaEfiubJh0hPm5U=
X-Gm-Gg: ASbGncsCdOtbC9kXFexWlbUcANlmns+gOhrfkQJhqgygLb4i5eb7SfnuYvc/6SSZ+X8
	TEfDxVtYlxFOTgWIwg2PTb2qXKQ/KdxEH7CnACFOf7eh+xEwc0borHsVNeo2Ql3+2Sy6TA4fvCR
	ZNiP2mOw57oumXaKb/Kzof4vxX/yZwNc3Z8n0rvfUiwVzZjKdLIU8nWTMUNeOPKL1c2Nij2S1NO
	vbthAaMLnqmyLJ6R5sIt8vBTU4G+1fXX+jGjKbp2b3QyM0wqMCUYRnDlE7kh6lIZ8ALUdjchrX0
	rcRe3XTkGrsqfjtPDhDaKKIY4VW9TG4rvZZTKc4aYQ==
X-Google-Smtp-Source: AGHT+IGPuH/7u2VS6G97KWEqeHwz+7VAvOISPOAykdnAUstUup7zRyEZdl7Ea2PFTSecYm5rR1QE5A==
X-Received: by 2002:a05:6a20:3953:b0:1ee:dd60:194f with SMTP id adf61e73a8af0-203cbd17c21mr13816651637.26.1745220164031;
        Mon, 21 Apr 2025 00:22:44 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db157c739sm5083625a12.74.2025.04.21.00.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 00:22:43 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V11 00/15] Rust abstractions for clk, cpumask, cpufreq, OPP
Date: Mon, 21 Apr 2025 12:52:07 +0530
Message-Id: <cover.1745218975.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series introduces initial Rust abstractions for a few subsystems: clk,
cpumask, cpufreq and Operating Performance Points (OPP).

The abstractions cover most of the interfaces exposed by cpufreq and OPP
subsystems. It also includes minimal abstractions for the clk and cpumask
frameworks, which are required by the cpufreq / OPP abstractions.

Additionally, a sample `rcpufreq-dt` driver is included. This is a
duplicate of the existing `cpufreq-dt` driver, which is a
platform-agnostic, device-tree based cpufreq driver commonly used on ARM
platforms.

The implementation has been tested using QEMU, ensuring that frequency
transitions, various configurations, and driver binding/unbinding work as
expected. However, performance measurements have not been conducted yet.

For those interested in testing these patches, they can be found at:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git rust/cpufreq-dt

Based on 6.15-rc1.

V10->V11:
- cpufreq: Add TableIndex and make table methods safe.
- opp: Add freq module to keep all cfg stuff together.
- Use /// instead of // for documentation comments, even for private
  definitions.
- Switch back to heap allocation for `struct cpufreq_driver` as it needs to be a
  mutable object.
- Remove allow(dead_code)
- Improve few safety comments.
- Danilo: I haven't added your RBY tag to patch 13/15 as there were significant
  changes from the initial version.

V9->V10:
- Don't remove atomic cpumask bindings from rust/helpers/cpumask.c
- Rename from_raw/from_raw_mut to as_ref/as_mut_ref (cpumask).
- Improved comments for non-atomic methods (cpumask).
- s/new/new_zero/ and s/new_uninit/new/ (cpumask).
- Avoid using explicit casts `as *const` or `as *mut`.
- Renamed `cpumask_box` to `cpumask_var` and `cpus`.
- Add local types in Rust for cpufreq flags that use BIT().
- Add const initializer for cpufreq::Registration and simplify new().
- Improved few safety comments.

V8->V9:
- clk (changes since V4):
  - V4: https://lore.kernel.org/all/cover.1742276963.git.viresh.kumar@linaro.org/
  - Add more methods in Hertz (as_khz/mhz/ghz).
  - Reword a comment.

- cpumask (changes since V4):
  - V4: https://lore.kernel.org/all/cover.1743572195.git.viresh.kumar@linaro.org/
  - Add support for cpumask_{test_cpu|empty|full} and switch to using non-atomic
    helpers for set/clear.
  - s/CpumaskBox/CpumaskVar/
  - s/set_all/setall/
  - Improved examples, comments and commit logs.

- cpufreq/opp:
  - V8: https://lore.kernel.org/all/cover.1738832118.git.viresh.kumar@linaro.org/
  - Based on review comments received for clk/cpumask, a lot of changes were
    made to cpufreq/opp bindings in code, comments, examples, etc..
  - `attr` fields were dropped from cpufreq support, not required anymore
    because of latest changes in cpufreq core.
  - Use Hertz/MicroVolt/MicroWatt as units.
  - Lots of other cleanups.
  - Dropped Reviewed-by from Manos (there were too many changes).

V7->V8:
- Updated cpumask bindings to work with !CONFIG_CPUMASK_OFFSTACK case.
- Dropped few patches (property_present() and opp helpers), as they are already
  merged.
- from_cpu() is marked unsafe.
- Included a patch by Anisse Astier, to solve a long standing issue with this
  series.
- Dropped: "DO-NOT_MERGE: cpufreq: Rename cpufreq-dt platdev."
- Updated MAINTAINERS for new files.
- Other minor changes / cleanups.

V6->V7:
- from_cpu() is moved to cpu.rs and doesn't return ARef anymore, but just a
  reference.
- Dropped cpufreq_table_len() and related validation in cpufreq core.
- Solved the issue with BIT() macro differently, using an enum now.
- Few patches are broken into smaller / independent patches.
- Improved Commit logs and SAFETY comments at few places.
- Removed print message from cpufreq driver.
- Rebased over linux-next/master.
- Few other minor changes.

V5->V6:
- Rebase over latest rust/dev branch, which changed few interfaces that the
  patches were using.
- Included all other patches, which weren't included until now to focus only on
  core APIs.
- Other minor cleanups, additions.

V4->V5:
- Rename Registration::register() as new().
- Provide a new API: Registration::new_foreign_owned() and use it for
  rcpufreq_dt driver.
- Update MAINTAINERS file.

V3->V4:
- Fix bugs with freeing of OPP structure. Dropped the Drop routine and fixed
  reference counting.
- Registration object of the cpufreq core is modified a bit to remove the
  registered field, and few other cleanups.
- Use Devres for instead of platform data.
- Improve SAFETY comments.

V2->V3:
- Rebased on latest rust-device changes, which removed `Data` and so few changes
  were required to make it work.
- use srctree links (Alice Ryhl).
- Various changes the OPP creation APIs, new APIs: from_raw_opp() and
  from_raw_opp_owned() (Alice Ryhl).
- Inline as_raw() helpers (Alice Ryhl).
- Add new interface (`OPP::Token`) for dynamically created OPPs.
- Add Reviewed-by tag from Manos.
- Modified/simplified cpufreq registration structure / method a bit.

V1->V2:
- Create and use separate bindings for OF, clk, cpumask, etc (not included in
  this patchset but pushed to the above branch). This helped removing direct
  calls from the driver.
- Fix wrong usage of Pinning + Vec.
- Use Token for OPP Config.
- Use Opaque, transparent and Aref for few structures.
- Broken down into smaller patches to make it easy for reviewers.
- Based over staging/rust-device.

--
Viresh

Anisse Astier (1):
  rust: macros: enable use of hyphens in module names

Viresh Kumar (14):
  rust: cpumask: Add few more helpers
  rust: cpumask: Add initial abstractions
  MAINTAINERS: Add entry for Rust cpumask API
  rust: clk: Add helpers for Rust code
  rust: clk: Add initial abstractions
  rust: cpu: Add from_cpu()
  rust: opp: Add initial abstractions for OPP framework
  rust: opp: Add abstractions for the OPP table
  rust: opp: Add abstractions for the configuration options
  rust: cpufreq: Add initial abstractions for cpufreq framework
  rust: cpufreq: Extend abstractions for policy and driver ops
  rust: cpufreq: Extend abstractions for driver registration
  rust: opp: Extend OPP abstractions with cpufreq support
  cpufreq: Add Rust-based cpufreq-dt driver

 MAINTAINERS                     |   11 +
 drivers/cpufreq/Kconfig         |   12 +
 drivers/cpufreq/Makefile        |    1 +
 drivers/cpufreq/rcpufreq_dt.rs  |  229 ++++++
 rust/bindings/bindings_helper.h |    4 +
 rust/helpers/clk.c              |   66 ++
 rust/helpers/cpufreq.c          |   10 +
 rust/helpers/cpumask.c          |   25 +
 rust/helpers/helpers.c          |    2 +
 rust/kernel/clk.rs              |  318 ++++++++
 rust/kernel/cpu.rs              |   30 +
 rust/kernel/cpufreq.rs          | 1305 +++++++++++++++++++++++++++++++
 rust/kernel/cpumask.rs          |  330 ++++++++
 rust/kernel/lib.rs              |    8 +
 rust/kernel/opp.rs              | 1143 +++++++++++++++++++++++++++
 rust/macros/module.rs           |   20 +-
 16 files changed, 3506 insertions(+), 8 deletions(-)
 create mode 100644 drivers/cpufreq/rcpufreq_dt.rs
 create mode 100644 rust/helpers/clk.c
 create mode 100644 rust/helpers/cpufreq.c
 create mode 100644 rust/kernel/clk.rs
 create mode 100644 rust/kernel/cpu.rs
 create mode 100644 rust/kernel/cpufreq.rs
 create mode 100644 rust/kernel/cpumask.rs
 create mode 100644 rust/kernel/opp.rs

-- 
2.31.1.272.g89b43f80a514

