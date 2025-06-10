Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F35E246BB8;
	Tue, 10 Jun 2025 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562116; cv=none; b=jC4PpoqM/C1FzOTYTirBPdaZUo+Ug4E2IWQNeQj3WldUNjqw1pteNJPGHx56XgePsUiG2KYI/Ix2sy8849BeBkBEaTYGrqU9E7CK4DzgDHtS9XDjHTcQbaMZqkD30vFAHjBECdoCKE4SXH83U1nBeFvv4Ik7XXGfOfAbA9gtx0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562116; c=relaxed/simple;
	bh=ZnvW/ur2cRumoOW+Z41lcoKXGfI7D1zXFJb7rEZC/dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kuIfQFfnfuQKcfZbj59erFpZDCbvM9FwypngZx50BCus6uBr6GlDovyWJBktXUJ34m3vQi+cRPZSjUNQrlT2g6FVVNu+I9Fv7ElVUewanSEmMScO2rL+tcFxV27nGg7gD8SNXaqDKWny97+qNrAoW9iFXt22GPe8wApL0qY2z8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKfo8rz6; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKfo8rz6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31329098ae8so4355882a91.1;
        Tue, 10 Jun 2025 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562114; x=1750166914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fpy0w6GneocGH76sUucfKrbNpBWjT4Y6KY3kCrIzHE0=;
        b=XKfo8rz6gXoUQmbRnMci8+HApnzm/tUnInaUAwcb8bTib99lygmH/QA1LUtz6NPYwI
         rh7NWSQg7IS7dQ53yRJ+Q8PCnQzqCJ5hItlmVghkEab0cLzeJ4fRpV9TaVkf9e/QZUMD
         +v1RmN5f/CGqs8GQD2RetPdSnHG1RV10rFweF22DvYMF/zeKuNmHsA+Qq7zfeWzGtqT+
         AvtA7OgLlnVH/qQdjUWTyRDMfOvOeSfYhHAmDW2voG5v6J2CUx/8SiDC5nS8PstSzTyF
         empa0e6QjEs/jf66IPtYmVlOgHGezS34kSFXPxBOEnQeQ1/3m4+8QvsCJT5tRo5Lcvbx
         In/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562114; x=1750166914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpy0w6GneocGH76sUucfKrbNpBWjT4Y6KY3kCrIzHE0=;
        b=OQy+xYh8zNAT3l78zKAOQ3My8pJYWs+0qmR2napIBSwzoGtTQOS/6NLU23d3jUc3PP
         KlIwkiXeienp5j+eoNnQdIa2BhBG0pDo2OJ8Z2UgSEwM7egQNoQO/+MJHw8TVkpM61QZ
         za+9ECEy7wkXiGIKeU2s0po+tprrt9RqKxuP9ysDLy+26GFG/cOcNy7Osva7Zo6l/PAN
         4jdszeCLT86IU5Y00UdXTH9TuaYiAtANNd3WDHFwrsaalBPkhFyQfVHEMnER9328J4FI
         +hFAaxQeQcnS92kcMg0s9Roj0luQfDWx1cNV/1H4qOvBEs0AG7Q/YfiBIve2ZfWdRKee
         ACMA==
X-Forwarded-Encrypted: i=1; AJvYcCV9Fhcbp4FQmogyzN6oLl9zGhGgyL3TJX6DCAv3L9sQptBT2Eu5HD9WXylrJn3MBGekZjV/ErP3MI5j3Qt8mV0=@vger.kernel.org, AJvYcCWlWbGFo6aeHJL5PVccN7dOmt/wi2cwU4jIWDEuyJFfIB74MGJJeFf2PvdTEHV7qiHu3Y1xgyBFbVD2vgE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa/G2IBNiKxW6LEAuIlrABlNE+DJh9htIfnfRE46jDYJ45gOI2
	lpdDDnb80JDsUFbs6vfvYfONR18VoBQ1+uGRtCanK0PrDseElnJIgldQ
X-Gm-Gg: ASbGncu2Y8Q/s2FxUR9MfIzzvp4hn8ZHH9gNfuwJkxKzH9HcAELcttQ6y594J8QWpxa
	YJWQ3kxgJnrmzbZM7SZuAaHdaGuePNs0A86CoZBTTo429gL2PqIazVEmcFQ3TvQHi24y837LFOJ
	B0hn1FV2zd2Do2raUMt6r1wz/q/UDwngVODfnZpkkL6ix7jbzDgij0MCDk1mdkoQFmqC1XD8rxD
	dMg3wZQkzRQg0qsSgAgd3Y9d6jKy5dARbnKcXd1IUTMaYp7ahhy1oB6cN3xNVmtYwt2cLl4tAR/
	kZLvXo5ma9Bualgw4/u2lni6eBO9PnX71FwXGA7mv2o864r9K05OqcUeB9OeI56DEB80peujhBW
	g1hetKSMS+cwkrIYLcviyiAZtRjuW5zf0FeEub1x6tkDJDw==
X-Google-Smtp-Source: AGHT+IG+2BvfQptVbBSlcvPomMbcjCUmgOLj297ddTY/Eofvew4SN9EdfAXX8CPExVbGOyLjJdPF+A==
X-Received: by 2002:a17:90b:2dc6:b0:310:8d73:bb27 with SMTP id 98e67ed59e1d1-3139e055dd9mr4939257a91.13.1749562114114;
        Tue, 10 Jun 2025 06:28:34 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b128050sm7969276a91.25.2025.06.10.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:28:33 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and Delta
Date: Tue, 10 Jun 2025 22:28:18 +0900
Message-ID: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert hrtimer to use `Instant` and `Delta`; remove the use of
`Ktime` from the hrtimer code, which was originally introduced as a
temporary workaround.

hrtimer uses either an `Instant` or a `Delta` as its expiration value,
depending on the mode specified at creation time. This patchset
replaces `HrTimerMode` enum with a trait-based abstraction and
associates each mode with either an `Instant` or a `Delta`. By
leveraging Rust's type system, this change enables `HrTimer` to be
statically associated with a specific `HrTimerMode`, the corresponding
`Instant` or `Delta`, and a `ClockSource`.

The `impl_has_hr_timer` macro is extended to allow specifying the
`HrTimerMode`. In the following example, it guarantees that the
`start()` method for `Foo` only accepts `Instant<Monotonic>`. Using a
`Delta` or an `Instant` with a different clock source will result in a
compile-time error:

struct Foo {
    #[pin]
    timer: HrTimer<Self>,
}

impl_has_hr_timer! {
    impl HasHrTimer<Self> for Foo {
        mode : AbsoluteMode<Monotonic>,
        field : self.timer
    }
}

This design eliminates runtime mismatches between expires types and
clock sources, and enables stronger type-level guarantees throughout
hrtimer.

This patchset can be applied on top of the typed clock sources patchset (v4):

https://lore.kernel.org/lkml/20250610093258.3435874-1-fujita.tomonori@gmail.com/

v3
- allow optional trailing comma for the field entry in impl_has_hr_timer! macro
v2: https://lore.kernel.org/lkml/20250609102418.3345792-1-fujita.tomonori@gmail.com/
- rebased on 6.16-rc1
- change impl_has_hr_timer! macro format
- remove define_hrtimer_mode! macro
- drop patch to change Delta's methods to take &self instead of self
- add patch to rename Delta's methods from as_* to into_*
v1: https://lore.kernel.org/lkml/20250504045959.238068-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (5):
  rust: time: Rename Delta's methods from as_* to into_*
  rust: time: Replace HrTimerMode enum with trait-based mode types
  rust: time: Add HrTimerExpires trait
  rust: time: Make HasHrTimer generic over HrTimerMode
  rust: time: Remove Ktime in hrtimer

 rust/kernel/time.rs                 |  19 +-
 rust/kernel/time/hrtimer.rs         | 281 ++++++++++++++++++----------
 rust/kernel/time/hrtimer/arc.rs     |   8 +-
 rust/kernel/time/hrtimer/pin.rs     |   8 +-
 rust/kernel/time/hrtimer/pin_mut.rs |   8 +-
 rust/kernel/time/hrtimer/tbox.rs    |   8 +-
 6 files changed, 218 insertions(+), 114 deletions(-)


base-commit: 8bffa361fb76742eb953ca024a9363c6e9357d65
-- 
2.43.0

