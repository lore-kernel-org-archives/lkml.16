Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FB718871F;
	Thu, 26 Jun 2025 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957181; cv=none; b=E2yH96johIRphxXI8bBLn+x1aZvCVmjbu970lbt9J42136gHcTXkvS2flry+ERupekQveBn051Zwxpn8SY9UAwpf3gG/Bln8x3SNZ3ISqP+YJqdP8f2nz8Z340/u73yUVKMwOHfQiEHSjx0SKdoBwyLNRPoneOhNbatJFRxcpx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957181; c=relaxed/simple;
	bh=aIxIA6zQvTROLZ2rBk9oC7yeFzYwYAj55y3ZB/NadJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYwxcA0NqzmnHa+0Rf9B9UO3ceEu4VYK5yMZek5aZpVOlCytMJvzz9Zc8a40aKJmKY3Po1BkGOzegoOFcwlJV6oTzgISR9dFLm9qmZte/k0n6CGVlm8r9JpVX6DZ48hdGUNB9a1P9rHsZwv0dT3VwWC0teBK0P/Ys9P/Dkrhhck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pe2l0CXp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pe2l0CXp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2350b1b9129so9617265ad.0;
        Thu, 26 Jun 2025 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750957179; x=1751561979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhz1FOD9yNsNC2xPBOAJj+zX5MtGTzkAHI8nVF6cq9U=;
        b=Pe2l0CXp3brLVC11J96RgP7XOGSfxWnomH5xIdURn3c1bukRlS3cZgOwaxU8OYf0bZ
         12GOvcMhIfna5k7jsxIw5/vxmlIoIHOyy9Kvhu8a1dOC19X0W33H8n4D0B551xKZmS40
         DO6aEZKOYgsD7Ho+ruSfZEvLbCtdD2Dq7ktcssgSxmfwToCyX/En9o3u+uSicGVxO90P
         3erDd58KTpYlav+aDH82AmrPk15k5dJQFJASdtzxZPg/+g6aXPtSQgaQPsaiMG3pRujk
         ulaw7C84bRDM3Lxtpwqd5sHnpCy1cBPbeO0ehE2l4l+xAM6YeWn6KSXcZ/rLgqd+Ugtq
         CuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957179; x=1751561979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhz1FOD9yNsNC2xPBOAJj+zX5MtGTzkAHI8nVF6cq9U=;
        b=wUMlUc3ojeGTeAVqdS4y2/mZ5jrt+aiJzvobgeDzOuxvsy4ooll3XL++gGNpYkGbSr
         gCPRvVvousaVKcmigwSJhpI7jTer//9h6uamD7ZloN0zw8kg3IqtRI3pEls6EaLEYm6b
         03y85stmGq8BlRac6FFFvTUPlz2P8h30x1jamurX+q4SwNf9g/YqA+FHNnjEk9I96C5y
         y4TEmYOtdPl71ENzaRDezq2Ghk9Goofxv28hTk8ALepD1PBsTUBTfGrBYSUeRa3BY1Bs
         ExjAV+owaOu1GFs3/5n6/DFWyqqz1UZ/ee98hvxGENaMod+HjzB7mlH7xIrlTt83cmLx
         qOCA==
X-Gm-Message-State: AOJu0YwhsjYwVYfSuYK++TxblLUC4vV10CASn4Dq10MHUdJexF9Ijr7Q
	LdnX1J2jh+0soD+HnnAQQDVpkyAngpS6g1Qft7nVm95KvxE7AKGU96ZZvtC7XlNe
X-Gm-Gg: ASbGncvEUN015U3zsZnGlhe1dofJCULBpg0CCbgB3oJJQYt11a/KsRt+hjV9ES54lUJ
	HDJFhevd0N6amTPLwXdRyNB201AMZSsSzYhxjERKwA760XCLIocUyEeAtRbFzJ51gIrY6Bwg79T
	N9f7YWmGL8Q8QhmvwaZIEOROeNa/+wcEnXIQa5uLmKqNyQUq10wW3iPxXoBw2DxgEWB34MsVAog
	EZddP2n9NThMuw8k/3q1kzO9YnJX5esjLen285irvq6hmGTvXxWNKN3ZMApjtMBRWR53il017ys
	65co35mz4TX6NtcYbiaVuzxVrPLWgKAVpfj+GLFRk4OQltEK
X-Google-Smtp-Source: AGHT+IEydPZD5gf5bm0Z1et3oJc58NxqT032IKiYytwtIjpzcFTtkrxz13uS6GICiIbwAYIj1/h9+w==
X-Received: by 2002:a17:902:ebc4:b0:234:a139:1203 with SMTP id d9443c01a7336-23ac460552emr763695ad.32.1750957179451;
        Thu, 26 Jun 2025 09:59:39 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe329b72sm2615195ad.80.2025.06.26.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:59:39 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v5 0/2] rust: revocable: documentation and refactorings
Date: Thu, 26 Jun 2025 13:59:25 -0300
Message-ID: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series brings documentation and refactorings to the `Revocable` type.

Changes include:
- Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
- Splitting the internal `revoke_internal` function into two distinct, explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe, without RCU synchronization), now returning `bool` to indicate revocation status.

Marcelo Moreira (2):
  rust: revocable: Refactor revocation mechanism to remove generic
    revoke_internal
  rust: revocable: Clarify write invariant and update safety comments

Changelog
---------

Changes since v4:
- Rebased the series onto the latest `rfl/rust-next` to integrate recent changes, specifically the `bool` return for `revoke()` and `revoke_nosync()`.
- Dropped the "rust: revocable: simplify RevocableGuard for internal safety" patch, as the approach of using a direct reference (`&'a T`) for `RevocableGuard` was found to be unsound due to Rust's aliasing rules and LLVM's `dereferencable` attribute guarantees, which require references to remain valid for the entire function call duration, even if the internal RCU guard is dropped earlier.
- Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno Lossin's and Miguel Ojeda's feedback, adopting a more concise and standard Kernel-style bullet point format.
- Corrected a duplicated line in the commit message of the second patch.

Link to v4: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWTLC5@kernel.org/T/#u

Changes since v3:
- Refined the wording of the `Revocable<T>` invariants to be more precise about read and write validity conditions, specifically including RCU read-side lock acquisition timing for reads and RCU grace period for writes.
- Simplified the `try_access_with_guard` safety comment for better conciseness.
- Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, removing its internal invariants and `unsafe` blocks.
- Simplified `Revocable::try_access` to leverage `try_access_with_guard` and `map`.
- Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions, making synchronization behavior explicit.
- Link to v3: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWTLC5@kernel.org/T/#u

Changes in v2:
- Refined the wording of the invariants in `Revocable<T>` to be more direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard` to refer to the new invariant.
- Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

 rust/kernel/revocable.rs | 68 +++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

base-commit: 0303584766b7bdb6564c7e8f13e0b59b6ef44984

-- 
2.50.0
