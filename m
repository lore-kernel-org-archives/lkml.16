Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FB5205E3E
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747494903; cv=none; b=U3YWqIkzHe78nr+FYYHiEQ3Q3uzn07AnwYqrREfXFs6IzGFUpsAQ/jS4INq/f1qG3dqUP5BeBHv8npRHD4wp8f6A1wCB49vQIqHyU1T33cx5AyEej/hjVTwLWnrgxA1s+1Iwzi8HZgtfnoqVWSxZtkvLiZvVZSfMwP2YuuqcYYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747494903; c=relaxed/simple;
	bh=bHFHhRSh8FnvfmjF+AvuUYAM9azKARUf++xNQATuapE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W+3G2KP+bPcbzKueM6w+zBDU0+nHlX2bvdr7LxlIOz0FSetqoUkWXrOyypwacexaygl5jRSbbXwXhLwmnRDyP8/2jU4KLu2Oa3y9+ilEMB83gEsXINjdXcwGvFvjy0/jhzz9TVGPGznZvX5JCjZHBDwb2XtW9Jun5ZXcMX8sKzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X3ty7+JK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nw4mggGU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X3ty7+JK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nw4mggGU"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747494899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NKSu+bXLu2mPgZOc4YcGewEn3I/B4EVXcc4u85tAMcQ=;
	b=X3ty7+JKO7JhIPV8l/XstWIZtl+5wXBni7Nq7Ukrv2jFzai0sM9UxqbBt1iK1QUWAES7V1
	gWJZvI0Nn8gnLPs4P8CuKMPpnzbcwq5aVdkNrF/9fhsyB6N5qZxREElVMzMNTYZhhmYWao
	DD1DoWdfSwLjnoJ2kuw/LDuYIBfLiaQov0QiQmGhL+EcCcSHUS5JQUL5GB07Cs4gQqEeab
	NGXHf/SIFY4oo8jrYIgKzp2BoI3/n+XAkGmUZgQMyCGk6KJrZfblf2HGCmJEtk/jTZk8n5
	gjxBuDijrNSC3YhePwJi29ePLuEbcPOtPOuDxZxzyDW35DRaKdWnSuMU57ccQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747494899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NKSu+bXLu2mPgZOc4YcGewEn3I/B4EVXcc4u85tAMcQ=;
	b=Nw4mggGUF5g6upL1O3y93H+vwwO73JhLpJrUNWdT8IkfwZLlAUqkwJ6rroJ0yEmnzBa5pe
	cwvSmJqbd1iZvCBw==
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
Subject: [PATCH v2 0/5] futex: Random fixes after the private-hash series.
Date: Sat, 17 May 2025 17:14:50 +0200
Message-ID: <20250517151455.1065363-1-bigeasy@linutronix.de>
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

v1=E2=80=A6v2: https://lore.kernel.org/all/20250516160339.1022507-1-bigeasy=
@linutronix.de/
   - Correct the introduce compile errors in while trying to use the
     FH_FLAG_IMMUTABLE in the selftest.
   - Use FH_FLAG_IMMUTABLE also in perf bench futex.

Sebastian Andrzej Siewior (5):
  selftests/futex: Use TAP output in futex_priv_hash
  selftests/futex: Use TAP output in futex_numa_mpol
  futex: Use RCU_INIT_POINTER() in futex_mm_init().
  tools headers: Synchronize prctl.h ABI header
  futex: Correct the kernedoc return value for futex_wait_setup().

 include/linux/futex.h                         |   9 +-
 kernel/futex/waitwake.c                       |   3 +-
 tools/include/uapi/linux/prctl.h              |   1 +
 tools/perf/bench/futex.c                      |   4 +-
 .../futex/functional/futex_numa_mpol.c        |  65 ++++---
 .../futex/functional/futex_priv_hash.c        | 169 ++++++++----------
 6 files changed, 112 insertions(+), 139 deletions(-)

--=20
2.49.0
