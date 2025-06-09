Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE92F37;
	Mon,  9 Jun 2025 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464702; cv=none; b=BjQyJEKBeRh/Qz8v2RnkUUuM5H52jj1e48BCmbxBngZhJrPiMc1tcQQ6k7jFj7LW6YYcHtBA/iBlfh2cglf/lXCg/mBXTBjLBHg0o4G7eqH/rF/LmaKAGbx4ioG0WAR4rPOHULnBoWZm0lYwr7ySQN0edSqlnzxojE8nrVeEykU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464702; c=relaxed/simple;
	bh=yeA28Bwl5WEjqsFjSJFqithgSHcHZB9WfEfeSYMhKi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RqYkDznA+xuymiNfb76l3RkNlu+jAEF/dhYGocX6FeH/V2SZ1Sj+uP5G5ZFcUrAZrlbP7EAEo3fZTUGoM3+wGhBM8vSeG6/bFRXSuy/+l9roCdVyt2PIYL2Qcchwx+RoViAEixlCJq61b5MSlFCXIVC7rngdEnInLl24mNO6Oy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQJA/fKF; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQJA/fKF"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso3644959b3a.1;
        Mon, 09 Jun 2025 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749464699; x=1750069499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGTf08TSn6OdIZNU6pSMFSyYEHvyn/t1Bfv4TD4NLIc=;
        b=GQJA/fKFIklkGKKmi+2zE85Wuea1/Y6O6LFMZgicaIVFB+2XENn3O8OY6zjKcYBlds
         T0Xh5ZGDi1Edz6oVFvl6PERQwCewirsq2xpr7MExYyGWSu8grozHJm/SZfItGUiKXMgT
         1kCz/FokUE5BvNpzMhxQvFtDvbqca7OXr11znZNF8dBU4VKrEWvU7H796pAYp76QMu7E
         Ec5Hv1VsPfbIt/FkZRh6qLhQJa2CcM0WR5ndfKZfxpQ/AL9MeZVqRcUXtx8qOrFXb4W1
         EiwjvQQQ93CpcH97WHmSxQb7e3grFz7k7FB8IiNjEub5e6j4ZUYfSW9jLDNYdgPjD4vb
         IZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464699; x=1750069499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGTf08TSn6OdIZNU6pSMFSyYEHvyn/t1Bfv4TD4NLIc=;
        b=Vg7a1yi8RuLyiKizAVeSpRMGFnKT5BEzVTQV1YcTvsFpUQP0YxxjYbM9rnuFgyvY4p
         +rNvXUCquR4anXheBuqtZW3hCrVneNr/1XQc1TA+0JfplVgFrD3aerpc2rZKKZnUsL70
         wigGRshy2/EAwa9duCuVzf8DZ3Fn2mIlZfIrfzgh38ceFku5QEQh6r1j5lKu4jf8QLY7
         39g99n1HXcLKW3q+F8hXRoI/t3+q2nD6Sin0aIYCzQZNE+WKq+NovBX9NnbrvFPUp9yR
         S93hgIusRjfWrergEX4elMuRT2w6WqdqjoXQzZKyec3O7D54yizoqkApUzMEOz17dHXa
         NTTA==
X-Forwarded-Encrypted: i=1; AJvYcCUmqfO9k+0Ho1wWY7J9QksgJFLRyWB1JY30j+kAXCUK7RJMLkdW8TywBfVf1S7NnTKtrzT/ZEHck966x5ahIfI=@vger.kernel.org, AJvYcCV0R6xBwwEcUH4OMu7rTqRcjvj5SRbPTF/v7UrGoPWjoKKwk5706oYcGyPX0vUh+fisJzj31BgvH9gp9zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUgXbpYWrAswYQoVgvj7xzXLKe2jwlV1feO7UtOx3euZqqUA8o
	g5zHwuzeE/e1XnLrHwIkqQ6TIEt3k/Bn2D8JjRzYMOeGBw8rAw1jsQUU
X-Gm-Gg: ASbGncuwzbkq5drGBa+W0Wasv7WQMK1k3I/tfRacu/Vxb66gKnUBBq63E976U0RniMj
	/W7ut/qd+BnYwSdpdjF65w1epWegSRLGS8JvwKfnHXFfM8THDieFJ9p3rKX0IFRMtJtst4jrGci
	YQnRNOu7q+OwdU1T5agBZV3rdKn/V0HiWXoV7kjuTPPYHeV5GrsWLiyAaMXqj38JktIR0Kks2Py
	x5FI1h+sWFk3UKel7QO9n0tmGhntYUO6Q/bjT1V0uJRwkbLzKn9xBu+d65KOPbAqTBdBfIHkWJ/
	QeZ22jLHwv/1zInh7N/OBGL2EN6gsZSo6QyyeIfPRkRsIP6eqtBRlnSZ86xlwDLbYE40tmo9+l1
	NirxPsIqQ+/YDHK9Q94ikIdBiLpBuUrgYh1VUqwQ=
X-Google-Smtp-Source: AGHT+IGTcb3IKPjoJeyPsHW1pmpz8/hiOgWP+2htFpJOVxykYr0lUMvrgaKVyT5VZsFT8Kqo+t3ncw==
X-Received: by 2002:a05:6a20:9147:b0:215:d64d:412e with SMTP id adf61e73a8af0-21ee6854172mr19113855637.20.1749464698351;
        Mon, 09 Jun 2025 03:24:58 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c082csm5403262b3a.121.2025.06.09.03.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:24:57 -0700 (PDT)
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
Subject: [PATCH v2 0/5] rust: time: Convert hrtimer to use Instant and Delta
Date: Mon,  9 Jun 2025 19:24:13 +0900
Message-ID: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
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

This patchset can be applied on top of the typed clock sources patchset (v3):

https://lore.kernel.org/lkml/20250609010415.3302835-1-fujita.tomonori@gmail.com/

v2
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


base-commit: 93b83742d2f6c56030346b3dfe36974688233d31
-- 
2.43.0

