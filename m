Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FA6149E17
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411432; cv=none; b=e4a2MfmxAdJbsO2//gFsJjZgkUhEW1f/S/ISmKQOYADhJhYeaokEFL60+jSgSnDS5LQD7wtPeNGVf9EktUJySSx1qnZcndSNDCNU2faMx86lg/1HaWb0vsruWy6R/y7LyqSuwRoUypKzvCLEtydOjMtU/ShE+9K42nkZU0YJsno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411432; c=relaxed/simple;
	bh=aDJKtBJc2olD3DQ9++T2sX3skqClVk5Dg68YE/5XlN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GkJd1SeWHansOkmOOeSbg3/UgU8AliT6Wa590aiqUBvBP0pUFQQ+w1VtVS2FVV8Nv7EQYcD/ANK+njwsed3GrYxhOkn0ZeumKQ0T8WL/IhDAfXRAK0emF1YkhWQcXmf4ien0Nwxi2DhwAaBuiNsNLenIMnB8PyiVWVHS5+dWm4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R1i+RHul; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I6QXiq//; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R1i+RHul";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I6QXiq//"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747411428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uHe59XcU4cGSTRD8v/6I5Z1xJNrJaboHuOjvcgCOWxM=;
	b=R1i+RHul2Qgb/uvveLHr7GVKEnYYi0ARzJOf6w1y2hGXtAPvc5q9YzlYZciBkW9S/eP6cI
	g2hqpGBOZ27Ji64IDcxJFkegApNtOm0uJQblN2797F1BdUfQt+OpU+vabNngRKjVeyGILj
	ETna9zU1sEnOknZohk6QUuiAUNm+J/mch5NhnX/I9raGJ+MDwalhmsS0p9/lbNlrPR55Jd
	M+KmJSZPG1AGtFbY886ovylWg4NhCJQ6s/RNnnghjZXvbulYkBWM0dfh5BviXhMwqRta7W
	ZPcwwP9Zl9slt/HGAMtJfE1h+X+Rqyw9xt0B93PT3IWsNSDO3NXk9ISBu1ZVVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747411428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uHe59XcU4cGSTRD8v/6I5Z1xJNrJaboHuOjvcgCOWxM=;
	b=I6QXiq//33iBFB3pflDL6zi/Az1+Z5vaVeIg+otp/dIoGiJKYGywC0bn9oNgtLXYdmpjLF
	jwxO0QvnfatxMGAA==
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
Subject: [PATCH 0/5] futex: Random fixes after the private-hash series.
Date: Fri, 16 May 2025 18:03:34 +0200
Message-ID: <20250516160339.1022507-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

A few things were raised after the private-hash series has been merged.
Here are the fixes for it. Nothing serious but should be merged before
it hits ht merge window.

Sebastian Andrzej Siewior (5):
  selftests/futex: Use TAP output in futex_priv_hash
  selftests/futex: Use TAP output in futex_numa_mpol
  futex: Use RCU_INIT_POINTER() in futex_mm_init().
  tools headers: Synchronize prctl.h ABI header
  futex: Correct the kernedoc return value for futex_wait_setup().

 include/linux/futex.h                         |   9 +-
 kernel/futex/waitwake.c                       |   3 +-
 tools/include/uapi/linux/prctl.h              |   1 +
 .../futex/functional/futex_numa_mpol.c        |  65 ++++---
 .../futex/functional/futex_priv_hash.c        | 168 ++++++++----------
 5 files changed, 108 insertions(+), 138 deletions(-)

Sebastian
