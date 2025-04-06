Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470A5EACD;
	Sun,  6 Apr 2025 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743937702; cv=none; b=H89sHnUSIBxQ54oyTE1JZpgZGK4gGvZrkncDnSqL4Mr0rI5Fj4UF/etFm40U71Iy57HBt9OmKaVXxDF25jZEHl4+PoHz7+1sSMc9VVLmloL+bRRnwjKbPzIWQKdYfI0/7sedkk64XyKyr917j4IxVY0Zk2WvR9Gxd2J2NZN9Ako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743937702; c=relaxed/simple;
	bh=hWNh0A3W8u8N1g08xzyAM+5+gHdaPqHAGDJMaNk7T0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWxKv1a97AOq5dTGFxSm1v4iKoyGdrzF2V2QNo1uGqSkx3EhBwMn7UoBMboa+O7BtGhTMmRNOTUb3/+ycPuKpeHmLdVWc1a4lnk5Za6wt1vn2GfMH616YK/Si+xWlwYWxSqgzHVA4w/HiF2D3Tw3ONIw0EFInZBgIH3aK+glZ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/CCMi5s; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/CCMi5s"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2243803b776so47711105ad.0;
        Sun, 06 Apr 2025 04:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743937700; x=1744542500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9dnQwUYlFHrp/etLwYkyL8PEf5G7FcHtzONo+0MlGRs=;
        b=h/CCMi5sfvqI1fPE9fiK60CEaNsg6TzrRNEJEWnpZamMjujGAIPBY08EXPv/DFfOAx
         JZYwne0MuDI8quy+qb7f8j5uFajC0GOSg9wTRzVU+amBAMGl1O93CDLKBb1PZLpHbDK5
         ddDMMvIRpRMPDWqdiUTCUIMAF2adQAQlSbPtL/z634uY+kh4+UdRLYO4dVk2yUbfQ6Ht
         fqo5jzef43XiRk7r2wzs50nUjllvGSxOw4qdsgKsvzN4CizUUEpOPtvv7p+yEFyCN2fW
         4Bgnw1jwUer0ncs+FeSxN+bduss2FXSmuwHDdtU3kJ4tqLVH6HDlysG+thI1ZnqlIsEo
         HjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743937700; x=1744542500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dnQwUYlFHrp/etLwYkyL8PEf5G7FcHtzONo+0MlGRs=;
        b=fRx1gpN9kIrEqEl+VieBvGUzuK3vjRF2TAZrk9pagFxo6IJYiR+tJp7EtArlIxMOG2
         shbEr16QN5qdKEAA5HNTn/I/8c2XVkJwvkURosGut9fzxI10D7G+Iy7UYs7YkvXbmxn2
         fnibPvaKQVY3Oi28q+sfRUtuSPcQodgS++jAdfszmVNl1LBMriSdLiuvFDYt/WfObtI/
         6u4p/VSJ6Xf9Rnd7SOa/Iyf9LZyOxO5YfutIi4b/ixWQe7T/2VvCLc2VSijFQNmqEWlo
         Pm+49EjmoCkLItvS08Yb7QELQqaSSIOxbBnOIDun1/ZD4k41XH7PTOTXK4FEx0sW0ato
         Yjiw==
X-Forwarded-Encrypted: i=1; AJvYcCV/T7QXe9x5JfRxWmHhB0hV/jP7w3hSbKOVRTjfs0/rhltY1/u+g6Zx5Dqs2zUnuQ4UV//pjLlR3zbNzRIvnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEkKq/ANtOa6xPVaBPd3MnvYftYIdk4rZFsR6H0onOOR1XfANl
	rWxlkBdl4oNzIWfxY5Aw+XtF4BdQGFoRqt20+yHbN05IiYo8BvC81wAgwmlP
X-Gm-Gg: ASbGncu7vjKCP4a0OByMm5Lkf4lAF5m2DNnMf5DgDm3EMyy2NoWxJ7CIJwyZ31Z0j6C
	v8mWqWmrH/EaJ3CFLgimmAzMG9Wbfpzd0EmOuczmug5blBDzW4AeesEvw4To8uGW9x48JrF4Wbp
	M8M01xfuF1s0CPzOQ/tERQJ9Dljj9AqSsjlXyyMVemifI5AWQNZ2LPE8UCjIDV5c0VCK4iXFPln
	GJI5P8QhnxwNjs3SXZ8enZTuKZlPJHmyt4gPW2SIZqFhs5Fhibfr/mEQC/GDA0vEmJ8P8bZh1Qb
	nRBENtRs+MgeQUs6ozmUL+AO/NtWNtNr6niWRDG813SaRbNiqBWw4hWeamTJLdtLkgD+7VWubHe
	oFqAMPwZDumrgbbOf+Tng5w==
X-Google-Smtp-Source: AGHT+IGBkNHlZTkRBJ+cjT+zdbZJ0DTmQcTZki1gKDglGnid1ae8Jf8cHUn3Vis4oVu3IAcp/ojqmg==
X-Received: by 2002:a17:902:e805:b0:223:501c:7581 with SMTP id d9443c01a7336-22a95511e49mr76521815ad.16.1743937700025;
        Sun, 06 Apr 2025 04:08:20 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785adb04sm62080215ad.15.2025.04.06.04.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 04:08:19 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: boqun.feng@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	pmladek@suse.com
Subject: [PATCH v1 0/2] add Rust version of might_sleep()
Date: Sun,  6 Apr 2025 20:07:16 +0900
Message-ID: <20250406110718.126146-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds Rust version of might_sleep().

These patches were previously part of the IO polling patchset [1], but
they were split out to make upstreaming easier.

The first patch is for sched/core, which adds
__might_sleep_precision(), rust friendly version of __might_sleep(),
which takes a pointer to a string with the length instead of a
null-terminated string. Rust's core::panic::Location::file(), which
gives the file name of a caller, doesn't provide a null-terminated
string. __might_sleep_precision() uses a precision specifier in the
printk format, which specifies the length of a string; a string
doesn't need to be a null-terminated. Providing a null-terminated
string for better C interoperability is under discussion [2].

The second patch adds a Rust implementation of might_sleep(), on top
of the changes in the first patch.

[1]: https://lore.kernel.org/lkml/20250220070611.214262-1-fujita.tomonori@gmail.com/
[2]: https://github.com/rust-lang/libs-team/issues/466

FUJITA Tomonori (2):
  sched/core: Add __might_sleep_precision()
  rust: task: add Rust version of might_sleep()

 include/linux/kernel.h |  2 ++
 kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
 rust/helpers/task.c    |  6 ++++
 rust/kernel/task.rs    | 26 ++++++++++++++++++
 4 files changed, 75 insertions(+), 21 deletions(-)


base-commit: f4d2ef48250ad057e4f00087967b5ff366da9f39
-- 
2.43.0

