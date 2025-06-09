Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB611FC3;
	Mon,  9 Jun 2025 01:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749431095; cv=none; b=dPBH2egrzIq0B819WOv2LZts1GZACopRjuhr5R0UfOoPFkJdpwlh1ZXF5jeR1kqq4iqvvZSwpc+RqHuE0xTnhLXCNMukJn+Flk8yFQX+i8DK36tHVkPxf1lftE6wgKtnFyFNy4RXrj3EYJ4+xAi6Mp2SrVl8wvTPsB+gmUjdJPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749431095; c=relaxed/simple;
	bh=PqFx+ehS4nlPd3jSAmPpzks9zf+GnwOrYtwQiEFaktA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6Y8MNuIbvcDrg++dUBx17IsaEWVLBsN08AA8lob3ruAT8WzDQo2gMlMy6vrCc+hKxLaxKaT3LuIgmj6Tlbh9h2UZXXNTgAB7Bpk18bQPULoTuSJ67acq9PN87jya3v8uPWOlZXFSbTCzWiXNasa6KB9FAsc/ApYkYR3W8eQn84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVFt0ZDl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVFt0ZDl"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235e1d710d8so46389375ad.1;
        Sun, 08 Jun 2025 18:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749431093; x=1750035893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvXnrkBGZ288qQ2hBdLfgL2bkdoVrtsdri+R3jNXWXk=;
        b=VVFt0ZDltxOQOqGLRJcJ3FyXTOkJ8YKfqiu+htxWuCRxR6+6Q/1ir7q2CehMLeqOUz
         w1fXS7pXpGyIHX8mZF0CYTWSK+7lOmUC5zEtyU91y7Jc29D0w6ReY2gjOSvSqJzx88vB
         UgkRp6pmTjcLqyvxV0/LaItaPF7ot+i9sEi3wDFg1OHqnnN8rvAvEmuYfN6wCgfanfeo
         PkoBZKGNDNhHzaXpdZkQOmCOs6xBP3l2ZleNDVedwwjYYZ+zsIbgI5Xt2SLe0ulFnok1
         n2/HR60Y3q8JqmxhbuMSam0cENwSSYKI/avxYvuabRkd1prHe409q9JPNJmybJwrTOWh
         gNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749431093; x=1750035893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvXnrkBGZ288qQ2hBdLfgL2bkdoVrtsdri+R3jNXWXk=;
        b=a24l/MDyskHJldPWTPkkOIkuQcdbR0q95ZAbUFN+Ssq7nUepiYp7GsIpdkSQ6xearA
         6Gtr+H0cc8dqmb5Ljldi3/A2agx5KMumfWis0+S/GBAOUSQ94S+L1m+N+Xm2CJpi2tZK
         lJrOcweRUVZcKhnrz/DxXCsmqcO5QPbceisHEVmpcA9BREWk+jcFZy2TkOSPtkH+Tf2S
         GMLFUO3A6jqRxqC1+bChkqJ97MYdvUZ5QPV9fR2RTCY/7KAN0CAqfkVQhrEF7IFiA05O
         YXsDwNtwQOZxHCaosbg4as9PW/8kZlh8+yy1kqCTu8jJS6Jo9wZQ60F19SueVqXbrEW4
         wMig==
X-Forwarded-Encrypted: i=1; AJvYcCVsaGt4+WRY+RR5XcTkw+5PCg5kWpTOfu+XZL9K2BN/P7jcQpCEsnj/J+rduLQLJV6PKcNQWkBkYMysrV52E1E=@vger.kernel.org, AJvYcCWk9Jw89D9u+qMI9c3bsFYNicqLTZV8APEtN03h3UP2ZtIM3UbKYqS5FbwIMKRqyyB219YT5pr4waETMK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzCbfJxrp+H/R/VtcKOvgvdMrppj7kg4AWCeRpBlZJyEg1cU/R
	Pp+SeI5IW8V04HsLiGFW8v4v7mOE3g7ye2zOYXJMRZVOGrW46F2aP5lu
X-Gm-Gg: ASbGncvb18RQvUpsIBY3/gViKvBJ+d3O68BnTpuRTURfqXOs7aCPqhb1/Twik9h4Plk
	m7iySucYCYRzvopFj99I1c8LCnrDwODET3ZFvyh84QxfcWw6TKzx8EEqrWzNIQwS/JP2cYPm/6Z
	qmAb/vHYcqnv1kzptz1eMGSIDNjxD2Y7nkCVc3M9GIhef0rU50sLei8AHzG+tmyDX9+AojU/LX0
	vf+wbB67QWmnhWfvt1hOTi92gmbzfSet8pih5ZHU7abNKvsOsZDc79at11t/wzeutJcLXz17izU
	j5l96wstLRm2n6kbgZDVQ3F1J8a9yuTQ6dJhz/+cy6Z2c4qKPGAkUelPO+Swfnd8aAAPRwsqVRg
	kYMT5zQGe9tIuviXQ1lhoKvYB/V5x
X-Google-Smtp-Source: AGHT+IFrSiK91aIxAJLr0HkuoM1VwNzpqPNyJSrhhGAewGmTM1Sdtl8tM2xs37aqyGerbzUiVpI/OA==
X-Received: by 2002:a17:902:ced0:b0:224:24d3:6103 with SMTP id d9443c01a7336-23601d7129bmr172249585ad.35.1749431092807;
        Sun, 08 Jun 2025 18:04:52 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f6683b1sm3652201a12.50.2025.06.08.18.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 18:04:52 -0700 (PDT)
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
Subject: [PATCH v3 0/3] rust: time: Introduce typed clock sources and generalize Instant
Date: Mon,  9 Jun 2025 10:04:10 +0900
Message-ID: <20250609010415.3302835-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a type-safe abstraction over clock
sources. The goal is to remove the need for runtime clock selection
(via ClockId) and instead leverage Rust's type system to statically
associate the Instant type with a specific clock.

This approach enables compile-time enforcement of clock correctness
across the APIs of Instant type.

v3:
- rebased on 6.16-rc1
v2: https://lore.kernel.org/rust-for-linux/20250504042436.237756-1-fujita.tomonori@gmail.com/
- removed most of changes to hrtimer code 
v1: https://lore.kernel.org/rust-for-linux/20250413105629.162349-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (3):
  rust: time: Replace ClockId enum with ClockSource trait
  rust: time: Make Instant generic over ClockSource
  rust: time: Add ktime_get() to ClockSource trait

 rust/helpers/helpers.c      |   1 +
 rust/helpers/time.c         |  18 ++++
 rust/kernel/time.rs         | 201 ++++++++++++++++++++++--------------
 rust/kernel/time/hrtimer.rs |   6 +-
 4 files changed, 148 insertions(+), 78 deletions(-)
 create mode 100644 rust/helpers/time.c


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.43.0

