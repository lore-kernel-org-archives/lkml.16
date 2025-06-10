Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5352327932B;
	Tue, 10 Jun 2025 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548004; cv=none; b=ZlK6VIwIm3HgAlx55jyLBNtXfIfRDJwtYD2+ifvpmJtLVh26ByaISX8wbWmjHWCag0NlrFvAjri7p4ofkVV7G71F+VpP9FJivoFkWvRfKPjxHUgea6hpGFHyn63yDbN6sGATeLtWIySfSDr5XbHZaKomSI3g6DJzJFNi2vTAnmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548004; c=relaxed/simple;
	bh=zNN0eejY+X+7qAhM6CbxXgiYLfuOJd8ve4l7TZYflQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RsFhA5qQoy6jLxvA5gtwg8YtlBZoW3HJ5s7eEO8uzw/n48xWc/sRpAzB1JoXohGdFVrZAEHKYuph/ZqvMb3p8N0DHuVA5813I9JqcAeJWAfSZJCdC/QwWn2TH4OHbzxaDvMzx23QwlOlqmgAELKbFbbDEC9iLZwh7G9a/StZVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fG5GlWI6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fG5GlWI6"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3915237b3a.1;
        Tue, 10 Jun 2025 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548002; x=1750152802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNSudlG3ysxSQUKi9DeeYCziT/mmBj7TTed2wWkCGzU=;
        b=fG5GlWI6lGYw3t9wlX5A9j8Vj8QOl9oXd0o9YBOQaA6T8vTwKN/+3lYQ/Sqc7E+UTL
         PaKasSt9PxbWykfXhiKCxv2G32m4Ru+A4cg+/rD2RFC/aoGPbH/HiYchrRnnAqgFclgy
         tQf1kAzXxSOdSrXQssSpjz2pvc5r3JKxuNZlRwcpKFLFOGfAAac/duMAVAqcEzkovVPc
         4DGVbIbBFNXEYI+igoapmHGR8srtghNPxrWpEd+zJ/UgoNWezhoE0WWlH+doPmllQyyy
         +S9uFKhipP72tiEieBSVy9YrL/RvTZArXmKJd29DAltfFJ3SM3vqCLQyy6d4c0qlRogk
         3MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548002; x=1750152802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNSudlG3ysxSQUKi9DeeYCziT/mmBj7TTed2wWkCGzU=;
        b=Gild7iFbapYvzQ7selw53Dq3N1n1xmDx0YvndPmw8g6Zv2Jp8YBpirhR687l6TkB0Y
         nDBFXCFUMrbQpntI6/KTgzR7iC+L97XVj9Nx6d3HMbBNKa2jnUpph7Wb78e7SC0gSIBo
         6sgxIEpbiJuk81Rlza6ya5pSgaDO0bTL8ACl1AQ6aW6iFLFsCu1d/kfZ9OcA15loB4L/
         +53qLY/73clx/TY92YnYkl97jzCT4ZKCbBeib2VZ+dUNwkqxa2gm64Z/mjeosdrdCBeE
         4P34vlOAFiK62AIUxhUPqY8/q6fZPMiwiluew6f9HZWUy7wEnMZW+/Bi1acoFe3KooHv
         oHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6cnMRBCSsjJpb+0ueDKlNQ7HgOFVaHn57iyiwobENDnvmfc0oO84HyuzQKyRtY5Us0JH7Nbhdf4VEttc=@vger.kernel.org, AJvYcCXa7ydtdrObgVmWsomDDffLdQXB8AS08ZmiCnadrAcyEIE3Z4zmXcx5CT4P6EsOMmG5Q5u0Xv/CejrerNHZG2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuieEQVBvUuabM+d3L6+NTBVIzaFspG/Les3iYa7YJuToX0b4
	wD1p5yEWYWSl122fe0juKi1voJOZiAgKLiZKQJ5i7gJMIMjvzV8X9MBc/xptUQAk
X-Gm-Gg: ASbGncvSdOpXz3xtg57YAKdlxszVUtZ+wxuE01DRb0Nzd9VJfZ93tCc6rEulY1eaMXJ
	pM8LcQqX+SUoaDDKWngaeOFUhQiVH747dDTooMyyeS3CUYpbKQNhCY/EP0+OriETK06D1hYKuBp
	IBt7zPGbE5IEV+R84G5XPIZWm6i2Bh2shBZWbtx+pe5MtP72MMxE6wAUlaBSE1LnDIKTFL7OfV7
	SO6ycWmM3B7br6PMqTkqnlNziCDpJUJG3vnuX21nLQ4Fa/5BlCap1becOh/aaaHO5aAcfCRisQv
	S2KljKwcFjyNK0gwtVndoJgsV6vsKO+4mUQuPC25UvwtEIqjhfhSRYZAKulOql8aa92jfN7Hpof
	u2NEUuTytidkeBsmF8NrwJYfVerxwNo2Uoyg=
X-Google-Smtp-Source: AGHT+IG1bZlm4T8Afh30fG2yXwbVPeNW6YXs7IeGaHbunHkpddYKs7K3GbYuF/PP+6pB74HtRqI4BQ==
X-Received: by 2002:a05:6a00:4647:b0:73d:f9d2:9c64 with SMTP id d2e1a72fcca58-7485ea7eff9mr4106404b3a.10.1749548002442;
        Tue, 10 Jun 2025 02:33:22 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0847e9sm7037684b3a.87.2025.06.10.02.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:33:22 -0700 (PDT)
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
Subject: [PATCH v4 0/3] rust: time: Introduce typed clock sources and generalize Instant
Date: Tue, 10 Jun 2025 18:32:53 +0900
Message-ID: <20250610093258.3435874-1-fujita.tomonori@gmail.com>
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

v4:
- make a one-to-one mapping between Rust helper functions and their C counterparts
v3: https://lore.kernel.org/rust-for-linux/20250609010415.3302835-1-fujita.tomonori@gmail.com/
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

