Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337927E9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745367065; cv=none; b=EZZgttPeaFroZiaD6P2elVwpaRvsDrr5pGFnuIZGwga7TQQuuCqeLVJCO0TaoNyWDdOsA3+H4W70gryoPc0Kqg99N5x76EwM3NV54y4aHvouovUCVczxAYUw5X84Lvs74drYmoJIpmzFlVibnKDpnCzOGV7KwqGolwItP5IFbOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745367065; c=relaxed/simple;
	bh=bl3djlCh13/JgV2cS+vRgPMrELu/1OX8ds+lNWmeiz4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FHBF/3uBLUtA8doQMFZxoTbnUU+aGVEnxeakQ5mJRIIDgz6JrUMwwfmmJxHpjfGqmO9GgxRNfXVBfF6NJh/ON2kjYylRCDDUSpT1UOvT51GwMUPoH8t+8kqr5RDbV7llgVVCuUcccl3Y9KBkpanwMRx+NepgHCjmwHKHBos3KIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=R38/YUsh; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="R38/YUsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1745367058; x=1745626258;
	bh=UK+yaoHH+O3rgV/wGr+xWV4QxYCSeYcQk2YWtKSZ3hQ=;
	h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=R38/YUshE8K/HpaImMW50Lx1Th90DLMOxwCkWFmh6OfZwbeBzq3HFnwmv38PDlBQK
	 qQBX2at0llMUy/K396PnAjSU3hXk0juZluK5O5LumUJqi3jGJLfopsQKKnoRmr4xu2
	 I5UrAw1bgrH4hx4yLBTx9hnfp+WbHFEnJWRi6xYhwMKTP2jN5QINB8nSR7p3wTYy9r
	 J0URb+lGV8ahkNxRcuxqGnmbUZX2Etjd4lJxF7hj4aWmjB+/CjVfDfzMSa5SQroURH
	 26m89wWbjQfzgFoSLJqO70cTWyxJhjQWI1YAJyApxh9quP1e2gEgvnZBvJQTXIaZCf
	 JzuN8e6Hf/u1A==
Date: Wed, 23 Apr 2025 00:10:52 +0000
From: "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Cc: linux-kernel@vger.kernel.org, Dhaval Giani <dhaval.giani@amd.com>, Gautham Shenoy <gautham.shenoy@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Subject: [PATCH 0/3] sched/eevdf: Introduce functional invariants for EEVDF
Message-ID: <20250422-b4-eevdf-tests-v1-post-v1-0-d005d1c7cf61@gianis.ca>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: 2a23017f978162b8870f09117e25aedf8991044b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Introducing test cases for testing invariants for EEVDF. These are based
of the original tech report available at
https://citeseerx.ist.psu.edu/document?repid=3Drep1&type=3Dpdf&doi=3D805acf=
7726282721504c8f00575d91ebfd750564

There are two invariants being tested here

1. This is based of Lemma 1 in the paper, which states that if a task
has positive lag, it is eligible. We do not test exactly this. Instead
we test if a task is eligible (which it is, if it is being to run), that
it has a positive lag.

2. This test is based of Lemma 2, which states that the sum of the lags
of all the tasks in the system is zero.

The patch series introduce a debugfs directory with triggers to run
each test.

This is not meant to enabled in production. This is a development tool
for scheduler developers

Changes since v1
- Add a tunable to change number of tasks to check for Lemma 1
- Remove the recursion in Lemma 2
- Use functions to detect overflows in Lemma 2

Signed-off-by: Dhaval Giani (AMD) <dhaval@gianis.ca>
---
Dhaval Giani (AMD) (3):
      sched/fair: Introduce a new debugfs directory for EEVDF tests
      sched/fair: Add a test to test that a task selected to run has positi=
ve lag
      sched/fair: Test that the average lag across the system is zero

 include/linux/sched.h      |   7 ++
 kernel/Kconfig.preempt     |   9 ++
 kernel/sched/Makefile      |   1 +
 kernel/sched/debug.c       |   2 +
 kernel/sched/eevdf-tests.c | 242 +++++++++++++++++++++++++++++++++++++++++=
++++
 kernel/sched/fair.c        |   5 +
 kernel/sched/sched.h       |   9 ++
 7 files changed, 275 insertions(+)
---
base-commit: c70fc32f44431bb30f9025ce753ba8be25acbba3
change-id: 20250402-b4-eevdf-tests-v1-post-a7550c4a94cf

Best regards,
--=20
Dhaval Giani (AMD) <dhaval@gianis.ca>


