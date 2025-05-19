Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17831265CC2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638465; cv=none; b=s9X5gEnhNO8nTe3gwprFUlUK3BiibDQBI+f94nrP6+j6qZe7tDG4CBM7o1MoxlcPdSFnq6QMgY5pKJK2Go+Bshm2okRTz/lEOX2cC3Y3l/Bw7E8QS8P8B32bitK2PdBYOTZ7GCBDvG4nS9Y+OfGPHWalvrP7IO8pu0b0gPKcCLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638465; c=relaxed/simple;
	bh=z31AxjS3GwkDU10VqUv/ULLFeTzdKnh7ezBJkeFGcEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pGW3Sm1BF1s/jrYTwRwfnJCTFJLxx1Cx19UAj285HQlMzuWQhtrimYXZ/OBe9Pf5lTIhtmmi8bmW0evguGwYCFr6uc0W6yK/Dt3C4S+K3rqppeSrfSeAk4qm36jX/CLu6idFAdNfhn/VS7g0PxunREGVxy3Riz2rd5+JOr4P1yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b/RcyAsH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b/RcyAsH"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30e80f03760so2623246a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638463; x=1748243263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTGqWdqntOIlWG4saRJroxbFU2eFeEFW1g9fYv7q0C4=;
        b=b/RcyAsHRP8tpoyuKNSOCkaAWSctckhA74rBuuyI21Z3eX4AEhyqAoxsISwXEMr+vQ
         yva33dvotTOvX0Dla6ZQuNzy4AFSI1UoKIaBVCo1+4gzTTLLnlGeDtYVYxM72NjEOX+H
         zp6AauIfmwzA16uFL/b7oddpjAwyRvCrWkUuuvp/5NZdlWtYmMLnYiyGqC22GsmoIMeY
         8EY/tesDGJBR4v55wFGldXNVB4kNJHbNW4wscRW0ApWyKBQpvObc7E40/eKHtwRmGoVO
         w4AsgcMogCIG8KGHHIhPl27TdpNORuimPQ+J8RbMOqjopzGSqqqynntR1H/9HQqugzmN
         5nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638463; x=1748243263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTGqWdqntOIlWG4saRJroxbFU2eFeEFW1g9fYv7q0C4=;
        b=JAQTAcg9guL5esjRBUJWOz+o3oyWHOYCT1mijGAQ7ZlA0sJc9C1OjHfUp4B8/Gi92C
         ulJP1rrAiHmqFAsp1U0tc6i4MRNYx/j4Im+w+0hsO+yoVj3YXSNcbw2H7L3s8JE2A2H2
         Fvvg35ZBtrY1GiblHkSrsdmTKe+sf+P+g+8GRb4vLfbozRAsd5nYa8TsoOv7TLYa7bua
         7zg/rT/MninVuEYg1ej0QiQvQ6VDhNr8DMDX5frjbdYIqPZzmGMoPZxycrXkW+kV7W4h
         2QURogM+C15qrSI1yLBwD3QjH+eZ1InLfcSi1vXmaZL/cxo5PS+nZMmpHPmKdVoFXzLa
         MzMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdx1Tj4yjiFBOxlyR/sxeOOoLbzglO5xbFT5MOlyJHu3H8rFpUVWSSKs+IQOj/QUvwv71wub44D+TJ1EA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxlq4CJO5KwckMSNXAHQCF/9/y1G3UnubCn/UV5yY80pBakwWT
	vrG/Aqgl56WTt60ufw+uu/k0y4SG2rB8M/sqlDO6quEyys3JSKzG3swoPYj/V7hQMHM=
X-Gm-Gg: ASbGncv/9YZ5tJ7EWRwvCGIlo6nlCOehig/09b6vToGX14+7ROcmtk9C1RKbskIvUOA
	CZdZpTZs3kN4ZnQ8sFNvWHQLQOH2X7k5O6/vG5c4hVJW0tRyDOJfOv46ai/Hde0mQ8Cy6Jcowui
	30J14nhlixRIkJMGbEpwejtyEezZfLLBTW2W3AQKVkYbBtnqqrxEI69n0jq4PkxKgAO4PwvIGU3
	kNH2s0FMvjuSbRsTTLYt0Ojw0iq1xI6fjMl3bDRugoBxyoNwEoFCr2/7tgA86eycyI04Hm6hAj5
	rG2UGcDBllvvaS68z4mHcSsGuaIdPsANAReyLHpfIKTyGcOwr3Us
X-Google-Smtp-Source: AGHT+IHsdPPQUecWwtfTf5p+40mwLKH2BdpvRNRjCwO9dRewDFJcYbGPc8GglHRGbM3aMRil0g5sgA==
X-Received: by 2002:a17:90b:1dc2:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-30e8322593dmr17198116a91.27.1747638463065;
        Mon, 19 May 2025 00:07:43 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e3343a11csm9577670a91.20.2025.05.19.00.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:07:42 -0700 (PDT)
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
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 00/15] Rust abstractions for clk, cpumask, cpufreq, OPP
Date: Mon, 19 May 2025 12:37:05 +0530
Message-Id: <cover.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I have queued this up for v6.16-rc1, will merge it via the PM tree soon.
Thanks.

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

Based on 6.15-rc1 + rust/devres dependencies + PM/cpufreq dependencies.

V11->V12:
- Added tags from Yury.
- Use "'static" for CStr in cpufreq-dt driver.
- Move clk code in a new module "common_clk" to fix build errors in the absence
  of CONFIG_COMMON_CLK (x86 for example).
- Use #[cfg(CONFIG_COMMON_CLK)] at few more places for Clk usage.
- Use Device<Bound>.
- Update prototype of update_limits_callback() (sync with PM tree).

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
 rust/kernel/clk.rs              |  334 ++++++++
 rust/kernel/cpu.rs              |   30 +
 rust/kernel/cpufreq.rs          | 1310 +++++++++++++++++++++++++++++++
 rust/kernel/cpumask.rs          |  330 ++++++++
 rust/kernel/lib.rs              |    7 +
 rust/kernel/opp.rs              | 1145 +++++++++++++++++++++++++++
 rust/macros/module.rs           |   20 +-
 16 files changed, 3528 insertions(+), 8 deletions(-)
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

