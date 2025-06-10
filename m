Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A6228C2C9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552260; cv=none; b=Tw8cv4M2OfBfG3L1hxrzmbGF/K7LFGurNs1gCKOHfSDQXOOiVo81NzLwhYYNnXU1TdMM8MgwWzxjrbpYJ6d71KejhFHSqV9GagDAQw/+v6Rb/tPWD8SDo0MAP58FOEh9ASOP3FAaKjexNlBYcMv/gETTBZSCk+gGn8bFx4pLm1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552260; c=relaxed/simple;
	bh=WCNOFkSCi+QfJMr9pHCmkIwimRwMPe0uuCC3Is/ZUxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gi1TZXCGnZjdjHKsLMcbtj0OMWqh9ix7NUKTG43ofj+Gp3x/U1DWD4q3xWRybI8JLx1KiQMd1VZqalUNESv++8O7kYB71zQ9fxvUo6h4oK/TaGSKuYE8f15jZ7mQBsYMgJE1i/zRSYuEppPGLxRJ0DtD3gHOkr7tNOrn6FtPt9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KcfxtNsf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a8VDAS+1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KcfxtNsf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a8VDAS+1"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749552250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hSLcETLYoOswEOAhxg0YWMDULodEraRukc+RnihGo7Y=;
	b=KcfxtNsfiRU3bwdPIl8WdpehG7BYWQGfDgmaLnl9mVjPO4WlNfpa9KToI/gDrw/sxfmETT
	wm4EjgDIGAeEplcTHzcQM3g6AemSDTT7a0MMghKhFXXPVaW8iomTXQa7UsgVs4QWDAqUIY
	0DTuYDN5fzBXKDGErPf4RlIShD1Gkfk4ztoRpHI4T5gJX1HPMgRbmHdzB4hcb9iLn2RqWJ
	lX8rbAahCv/lDEK2cgPkhuIiZFer3wDGhkMzjCbifCWlCaLG3qlAYSjY+70w1/wuZ4T7cN
	huiFDPhudRR10fiJZI8CaHXi6IUkJ6OOISsVG+hgDjUjxiPlmYVWpK6Zt9KDOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749552250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hSLcETLYoOswEOAhxg0YWMDULodEraRukc+RnihGo7Y=;
	b=a8VDAS+1VBpfM8e79M1kdwA08k/0967Ww6WFR7ObiZsDdwGMLsp9BtTq5kFtPawhvpGNHL
	vTR0fE1Dk685d3DQ==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 0/4] futex: Fixups for the testsuite and FUTEX_NUMA
Date: Tue, 10 Jun 2025 12:43:56 +0200
Message-ID: <20250610104400.1077266-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is a collection of random fixes related to the recent private
futex/ NUMA addition:

 - Some of the test fail on ARM due bad command line parsing.

 - The MPOL test fails because the home node was never set.

 - The syzbot used a negative NODE number which was not tested for.

v1=E2=80=A6v2: https://lore.kernel.org/all/20250528085521.1938355-1-bigeasy=
@linutronix.de/
  - Extend 4/4 to also check for the immutable flag.

Peter Zijlstra (1):
  futex: Handle invalid node numbers supplied by user

Sebastian Andrzej Siewior (3):
  selftests/futex: getopt() requires int as return value.
  selftests/futex: Set the home_node in futex_numa_mpol
  futex: Verify under the lock if hash can be replaced

 kernel/futex/core.c                                | 14 ++++++++++++--
 .../selftests/futex/functional/futex_numa_mpol.c   | 10 +++++++---
 .../selftests/futex/functional/futex_priv_hash.c   |  2 +-
 3 files changed, 20 insertions(+), 6 deletions(-)

--=20
2.49.0

