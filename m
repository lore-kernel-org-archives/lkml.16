Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A1231852
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817551; cv=none; b=ksyOlybtUmSijuiGWX/Hu1pHRYatzuDPDHK8LZTxtWNKM8XgtqBKwGK2AYjrcKmPJtKG4h9aej/iLuGGcUDNLSml7P00a5xMmEVNLDtHedKnYzczjshUf1byBmBwr23Mmp2iiTsMwMHQYWwogd1jPGvPKw9AYglm100rkld9RA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817551; c=relaxed/simple;
	bh=9qbVefbWbV2zZGdirlqvoBU/l65faijkYV9zOWdF4rg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SRG4tPkOuUszcoVChsHiXBMjnI0eUeb+jk6yOY+qjpnAxkA81zK9N/TPhpnc0qn2UHZBpLnWRVWx3zmgwts8QeJtTcT6Hxne26jrD2mkEhr2x9vuY4PaFptq1uvqDzRspVgg08BcmxBpo72j/hGCTBydVDQU7d8uZ8k0cGBl8wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cs7us6L7; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cs7us6L7"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso3553695f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747817548; x=1748422348; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XC+W4o+p+6DbLw0tBU+P2qOTmCU3FTC9WwjkJm3x+AM=;
        b=Cs7us6L75XbgKcr7XkPCjyfgXMfzwosTE9ACN6roB/Qa5SsYvfxnropfp9zBd46HQv
         tqoVyiJLJBrawPB4BC98nwx6b4qI3cNsUCIuaUMYEbeEaWdtxF/UOBMLX50M/s7cjfKA
         lBP9OGjuF/LrWxLCG/qxHP2y7SO/7fAes2hkD4hDmTamidxtguseqOvYjnlIhvHS7eDf
         e70RPeDA9ae7E0IWWRbAYH0fc1fUJIGZ7s/RupfFeY4INer6vTDXCbDo8rbqIfCN5Nnd
         woaz+wE6flitJNXVq/DwbvVHm90FkYrH0z4U2pgJxBHRKbXOM9RY0+PwSUq3JzyrUTy+
         Db/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817548; x=1748422348;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XC+W4o+p+6DbLw0tBU+P2qOTmCU3FTC9WwjkJm3x+AM=;
        b=THWEhMpraCOg4AStv15iFHFo3UtfevCmSn7BSKOEx2ohQgZEgwxQbCM1c4A6PAkHfV
         bJV0BROaj+QFQx9aFF1tKiY4FCnXH466XJeHg0V4etdBpKKzefyfQ1yiOIGEeiby+M4O
         CV9hpie9FQ+GAxiO4GK01d1+SnbWnIy/Gae22LZb07q6o3Tqg7Y2e/nEXlV38+Y9AjSM
         A97NLcpxkoXgGlCxp4Mjkwo0NY/gJ+Diys/Qmb1rAuS9c2gHHCh3q+UyYyg41JTMyWmz
         XgvXskz+TyF1EGXRC3s0hsnqjPHzkBzLSLoPx8Tg/ORWLAcxshFP0Pnpmq/oCSnVmpcm
         j1gA==
X-Forwarded-Encrypted: i=1; AJvYcCVFQ9N0yR+TzELcsYmwelfy0PDoh8NWbIKfT5W8qxz/UodapWrZ8l99RZCXVHamh4ihLK01RpQmiKKuPUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSqtYPF0V3J3mYu0rRMtdLfM9ENGAg4CYgO5WTat/iWHOpVgI
	wayZe9SNv6s9WVa+jnt++nGoWD1nj4ZBWH7QDaWeu0U1qX6pOiY5Hab8ybwehwgTet666QHU8wK
	lWMS1o4vqhA==
X-Google-Smtp-Source: AGHT+IFbehhCRY7NvnpW3JUgzVeIQqUvAhfq6MFk4peA0cS7HBSe6ugWHEoRrwMIRmzNHPzwzV9VDpdy3xX8
X-Received: from wrbee18.prod.google.com ([2002:a05:6000:2112:b0:3a3:66c9:9231])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2004:b0:3a4:7382:d262
 with SMTP id ffacd0b85a97d-3a47382d2d7mr694886f8f.13.1747817547857; Wed, 21
 May 2025 01:52:27 -0700 (PDT)
Date: Wed, 21 May 2025 10:47:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <cover.1747817128.git.dvyukov@google.com>
Subject: [PATCH v7 0/4] rseq: Make rseq work with protection keys
From: Dmitry Vyukov <dvyukov@google.com>
To: mathieu.desnoyers@efficios.com, peterz@infradead.org, boqun.feng@gmail.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, aruna.ramakrishna@oracle.com, 
	elver@google.com
Cc: Dmitry Vyukov <dvyukov@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If an application registers rseq, and ever switches to another pkey
protection (such that the rseq becomes inaccessible), then any
context switch will cause failure in __rseq_handle_notify_resume()
attempting to read/write struct rseq and/or rseq_cs. Since context
switches are asynchronous and are outside of the application control
(not part of the restricted code scope), temporarily enable access
to 0 (default) PKEY to read/write rseq/rseq_cs.
0 is the only PKEY supported for rseq for now.
Theoretically other PKEYs can be supported, but it's unclear
how/if that can work. So for now we don't support that to simplify
code.

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org

Dmitry Vyukov (4):
  pkeys: add API to switch to permissive/zero pkey register
  x86/signal: Use write_permissive_pkey_val() helper
  rseq: Make rseq work with protection keys
  selftests/rseq: Add test for rseq+pkeys

 arch/x86/Kconfig                         |   1 +
 arch/x86/include/asm/pkeys.h             |  30 +++++++
 arch/x86/include/asm/pkru.h              |  10 ++-
 arch/x86/kernel/signal.c                 |   6 +-
 include/linux/pkeys.h                    |  31 +++++++
 include/uapi/linux/rseq.h                |   4 +
 kernel/rseq.c                            |  11 +++
 mm/Kconfig                               |   2 +
 tools/testing/selftests/rseq/Makefile    |   2 +-
 tools/testing/selftests/rseq/pkey_test.c | 101 +++++++++++++++++++++++
 tools/testing/selftests/rseq/rseq.h      |   1 +
 11 files changed, 191 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/rseq/pkey_test.c


base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
-- 
2.49.0.1143.g0be31eac6b-goog

