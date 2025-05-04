Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60D3C1F;
	Sun,  4 May 2025 04:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746332686; cv=none; b=Jpl8rgHXKDullSx5B3LE+i3X2nntaK0B+HPRigObezReA3DD/DbP3DYaxkPhBog6cz2kaCK3iOvvKsH/qU5/L7VpY+h9vX9sCAfWKwAjcZfMu86SHF3IOQ5N1naC5PsQ11V3JvK05M7qzX6jXGHtxBpf/S0e6zhywcn5GzNe2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746332686; c=relaxed/simple;
	bh=0y3breFb4vE1bxctwmXBiM8xh2KA7P7oCIfoDMCEn3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhVQ1DNGo3aGw8RMibDKW0zqUf49R311u/GLxH5IBTBuiRf8zotGsDdkHxkzjVOG7YZni2ZC+sFwZQere5X8z4RNFRle9aP9Eh4W1dD1VNfqR9EicYfw9c3ITwTJRfKIXv6GpNns0v/l7FZz9ZJuyCoxDA45U3Memzw80ilTPp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGLpRwQI; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGLpRwQI"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af52a624283so2931340a12.0;
        Sat, 03 May 2025 21:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746332684; x=1746937484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hE3MGps1Pn9q+pVBqv4IQq3bCdItrSB89VcIOdLpsHI=;
        b=AGLpRwQImcNXFbirq/arpUoi+qdRqKouuksvEsmRHJM000yKesDn/QQ0HS1PqRqXg2
         400BhmxeKBtCSzmNuXKgSYZG0Gte1NJDBMz76N71PP+Nlt4TicHuCXzcecu8dAGWLFSO
         dRAomqShU+nPuNhpcL/Wmi44bYn8i5HuUr05GXiZJoWlPVPc7HEozEGljD++9fSqR1FN
         2hoxaP1PZQRhALrsicepS3GA9yIf0s0Lv5nIS0do/Sy43feFy0+uXUudPvMfQaN6x2dE
         265UCrlfIYF1IIYgxSogShxIb3eV302I4vIE/P+SMyuw7+syGpj0+lRFLclsAmX7FYbO
         9QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746332684; x=1746937484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hE3MGps1Pn9q+pVBqv4IQq3bCdItrSB89VcIOdLpsHI=;
        b=UYzBKxcwnQBak7t6enQG58lCwn5JZBQHyQdMWhOuBydXP1iDekEhRrvbO1vZ+ei/bD
         TPds4djGqK5+1/lyi/wMuuxKvnJhOhzYN/C0ivBMpE8SvdhXzzr1BDk9rtRoWtdCeY3n
         CxbMS727HpLv0YC5AY2wFgtyJkkWug9GFUubGM0rHLiaQxSAhU5GgXWDduSNSfOcqeF4
         /02+e3aJXPSy5Mr1JQQ+QO/HKjFEmY8s8ndeIkbqtBG+jnQYrnTgejYsUeLQw0E20EkP
         abiRv8Aw21wzxeqZQOjMPfyCw7uAIHzsxlvVf09LaxujV4ExowH2zd/oawJsXP3WneEm
         N3rw==
X-Forwarded-Encrypted: i=1; AJvYcCXeMTav1BcMuZZHrMrPhGGBKQELsQ8BWnVYQWb5mMFTv2uS7eCFLgH2/MLgtqNvheQErbd+YPNkiJxDqWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEHEj+KllQ3T8I5iU16SVhsM5JdwbGCv4aJEAvYfEU+GYLnwkU
	3ijgTrISRWLxRYmDJzhwwotIxRy1T8gSNVe9nPrr93MQSpZTaZguCZ3jC4Kt
X-Gm-Gg: ASbGncv/k4j3umWAqmnCCGKOYsnRO0SqQWcPg9UTbqhu9oeBAsbZ4yE+KyJyCGTo4Ra
	BJz3PM8aeDmgzaBovZjzvmCN0Zm+t5ZybdMWURyJYTRdLYuQ/8UVSyF+/JhlUzmz3ENN+24yirI
	xABZE+qeI9j9K7VI1Zo3oKIYtp8ZM+FXg2r+82KJug35Xc0gU2autUjSVWZRs1LUyvARjbVi6AR
	nAQHc1kXjFdhYxSckIbym4G7C/K+WCdEBhAM5a9irwp5M6eVsC7/oqDzdQWap1D9MC+1UjQhEqV
	orALQtAtrcTwa0KQU8YeFYwuYZlxj3Y5FKiVdE7CpySvo8OavzTfuDGTkT/+DKy1EajtdH7BhVb
	5wbvNKJvAdRgeas+3BA==
X-Google-Smtp-Source: AGHT+IH6qPPbtdYxTPkL+pUNLjGn5YYfaPjngTMWB7/9YETcrxB1Dcycw9j9n1dAMv1f9dI9YLjScQ==
X-Received: by 2002:a17:902:db06:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22e100505d0mr129130625ad.8.1746332683931;
        Sat, 03 May 2025 21:24:43 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fbc8sm31482185ad.142.2025.05.03.21.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 21:24:43 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] rust: time: Introduce typed clock sources and generalize Instant
Date: Sun,  4 May 2025 13:24:32 +0900
Message-ID: <20250504042436.237756-1-fujita.tomonori@gmail.com>
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

This patchset can be applied on top of the division fix for 32-bit
architectures:

https://lore.kernel.org/lkml/20250502004524.230553-1-fujita.tomonori@gmail.com/

Most of the changes to the hrtimer code that were included in v1 have
been removed, as it does not use `Instant` yet. I plan to convert
hrtimer to use `Instant` and `Delta` in a separate patchset.

v2:
- removed most of changes to hrtimer code 
v1: https://lore.kernel.org/rust-for-linux/20250413105629.162349-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (3):
  rust: time: Replace ClockId enum with ClockSource trait
  rust: time: Make Instant generic over ClockSource
  rust: time: Add ktime_get() to ClockSource trait

 rust/helpers/time.c         |  16 +++
 rust/kernel/time.rs         | 201 ++++++++++++++++++++++--------------
 rust/kernel/time/hrtimer.rs |   6 +-
 3 files changed, 145 insertions(+), 78 deletions(-)


base-commit: adf04b7cc66574ec2a43b540046975dbe73e0382
-- 
2.43.0

