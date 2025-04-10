Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD820C470;
	Thu, 10 Apr 2025 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325841; cv=none; b=BtRictZSfTazSaLPej8vDX1B9tyZ+hpWxcQMS6R9MNpCFKp8kVaHjN0Hxl9Y+y5jZOg0W43deD7b2COG0P/6OpFpKNsfSIUkE61r/4oJIWdSnGGLpS7Unlw69RW7ZH652wcU4/PwpuR6X7vDiC8yxunp9Sr+KIGHnR2G+VQ6y7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325841; c=relaxed/simple;
	bh=fVG/ZCCtMdkebkfeV7Ag76Fh56IwNGhk6a61jPghErM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rSfJsXjVBgP2QHvsQVekl6oP1Bnh5CgC/+dQ/vc2CkCgwnKMzgHrtWq2PiuBcAzRn3WK9ptI+PNpCtw5hA79zTSAsstDHnM7jDdzrx07TB9uyOxOm9dmh0b054NgMpdwGhJNTeFQlJ3wPeG+P5t+DixmznY9UiR3CGzPPxyJrio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9uwp9nu; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9uwp9nu"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-739525d4e12so1287270b3a.3;
        Thu, 10 Apr 2025 15:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744325838; x=1744930638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NdiNz2ETjLMDRaxG4YYpquRQHWA81DiTaDkqO6t96S8=;
        b=V9uwp9nuOCuID3ShrmyDM5lQ1aY1URUCkYWMWSz7rLOCRpfSYnTjEtCN0DSoST/0OG
         50JOx90KD8V+IJStqTF9B115ERmGflAG68C0oPoDC/emYGIzNF0QOBN+eurhUEMU1Vkt
         YZgcqyOmAC+h/ALcsR53NAtM9RsMklO+xSs7GXltkASb5UjSfcw4m8dRS+nRF5cDEb+3
         JcosaDNVgRtjhqPlt9mOkuWyXrFruHVWegbh7H/zvne887YM9C0jyl7bzSd7cMSHmvGO
         ynIZAD7DgysYMsDNwWU3GJAShxNiH3O2O98FCrJuaOQk7K0qUHThQxnwXmDhSbbWA3oG
         VG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744325838; x=1744930638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdiNz2ETjLMDRaxG4YYpquRQHWA81DiTaDkqO6t96S8=;
        b=cXH6CkqxNMhBxdoSO4nG2FiMIIt7VJrBuJzZb0U5p0Aceyd1ZdNO5uoTzb6BdMOZsN
         zPUPNAh61QZJCKLeruoCUe7vbDvOzD95ufGNDBFhRuBq9QtAmqqqQks9NgQZQApkEj6U
         OmjbXXP+4wQ9YT2MjO6fkjQb1Kx57Pn8j1dWkHvrXVs2aE5wS3xV/rGeKX3dt7HMLZ21
         3iNxmj0aVNyOk6DOl/iZYUo2zzNdjbRjR7fzeLZbWK7PIYjN7LfbU88FgPjwUjH6xNfb
         xOYajQuUe0G2EMefT+8YDxr+ww+FIjbI/g73Zanfd9bFxQ5rEq2SsJhEA9l0qpNFjVVz
         cbKw==
X-Forwarded-Encrypted: i=1; AJvYcCXNkSE7740L2QBWKc0Uh5teY7h1ZptW08BGpya/+CQx52AYtntV8hU2UBF1damAwJDOFKWdqzbzkLbBMJk25Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBsxh/tpfP/Fge9/U20TME7U3TOf6erdRJXURm7Se1D3GwhgBs
	cGxNWS8/Nk7RvbE7/HoHVO0p/xMxb0p/LyppoCmnnE9EaFg2yf/PdX+tpQKi
X-Gm-Gg: ASbGnctC6a7mOC0mB3lqePnn9KJi5lehigA6OORDoZ2I/lr9JqfK93qRBMskazQF8JS
	0P1z9E9h0ky633RzKmdSBxYC+8qEOviBuJsL72/ZHW8iSX2erHBjAcUNnj+pwmAzaZe9AE+2zNu
	g0InnXkrGzs6SzMs/2S+qvFz14UIukyLue/xPdxACC2e+IxYETTF8QsPKyEytkAHWr8h29j9ahM
	R3/cQpZONFwEPixfqwpMGjjYwudC7gR9NTUl+Hep//tI7gSdxshrZZQho8GTZbDTR6NINhrkujD
	lF3ClMpY9DVZLVUj04XkU6ymKHvcPeAG/XsOti8JMPgw/DWGhCuuKYcfxtQoMcRvUCztU8Dmjzc
	yFiHKN6PG307ePE2vRg==
X-Google-Smtp-Source: AGHT+IGyPFv10qBvicuGfSuBLqhBgYgXT05H9WUcgXQm8CIxUwH+NrgHWCeIsg7gKAijjdGT0Y6JWA==
X-Received: by 2002:a05:6a21:1084:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-2017999056amr1211622637.36.1744325838179;
        Thu, 10 Apr 2025 15:57:18 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a5e5sm3583310a12.54.2025.04.10.15.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 15:57:17 -0700 (PDT)
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
Subject: [PATCH v2 0/2] add Rust version of might_sleep()
Date: Fri, 11 Apr 2025 07:56:21 +0900
Message-ID: <20250410225623.152616-1-fujita.tomonori@gmail.com>
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

v2:
- improve SAFETY comment
v1: https://lore.kernel.org/lkml/20250406110718.126146-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (2):
  sched/core: Add __might_sleep_precision()
  rust: task: add Rust version of might_sleep()

 include/linux/kernel.h |  2 ++
 kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
 rust/helpers/task.c    |  6 ++++
 rust/kernel/task.rs    | 28 +++++++++++++++++++
 4 files changed, 77 insertions(+), 21 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.43.0

