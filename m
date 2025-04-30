Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC09821D3F6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005746; cv=none; b=H+4s+iZjDZkGBVvelNwA5bnVWb4TvFiuPFIMMwZOsMPRi2lKuHHRxjka3uPwMnmaa2/UBslqUnVy/bi1OR8GCo0Uc2MaNhOO4mhq5ho5LQXfyyN71vWEfsYUuFHHKXLtXF9d/freLp3cPspScRwsxd8Ier8OM6zytRpwy0wOciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005746; c=relaxed/simple;
	bh=6gpp7oToAeQ5X4eJIx+QZRvT2EN4uWkVY8Kck1a0Aew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g91jQGbbBLrrhRsY5uj8J5zrhQ8pKrlaW7vQGBsb151hbvZgnozW2owVdEGLRRVUqlbP3ONGy+U7ftcGBWn2SeABHrMn81H1z9LW5SOPdUZF3TcAbmAllWOVRi8GzG1dqq3PUB2RXsVrcNtVmeatnSvnOhpVrlRtcs5haD2Wfvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IQt3Vi3E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i1mroEe0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IQt3Vi3E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i1mroEe0"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746005742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=waMLHkhT5CkSavbPZpLEx3xbFvU+FOnEgANqMtVffX8=;
	b=IQt3Vi3E0B+7b6q1PzMBMmODGcbWAnLio6HJ3pusEn8cU4s2FFc1XAq0IySe4rGs6WYSuo
	RSkSOfUlYlNqc2cQifeRcYfzDp14LeVLDcmEv9FFS/Uas3RtSqRbfT7ISNtrQpdSdRiBh8
	YhlKVJgPi/YS7iFo3kmUSRJ7u3UaN0TTpm2J8DEiYFwRUyiwQfyiIGnjKf9vKjbcYwpC4x
	K1spE9FhFSMAZTBpIHGS585p0N0nsp90UYzLd2cErZY4JMZKfbdPlqxvYZ/k6eNeNjGDTn
	vi84IGNGbNpNog46968+We4p1SyJHaJeWkrMOOJJWmrVMO3sI4tRI8l1xsxawQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746005742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=waMLHkhT5CkSavbPZpLEx3xbFvU+FOnEgANqMtVffX8=;
	b=i1mroEe0x3q5y4rfHaH+h/CWYDmprYf+Y/UvMMioIThdgsI78NaZCFmtzI2mxmxp+KaVYC
	tcZw9f9Ly2A9FrCw==
Subject: [PATCH 0/2] tools/nolibc: introduce poll.h
Date: Wed, 30 Apr 2025 11:35:31 +0200
Message-Id: <20250430-poll-v1-0-44b5ceabdeee@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOPuEWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE2MD3YL8nBxdc9OUZEOzVEtTM2NLJaDSgqLUtMwKsDHRsbW1ANtWy9F
 WAAAA
X-Change-ID: 20250430-poll-75dc16e95639
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746005742; l=928;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6gpp7oToAeQ5X4eJIx+QZRvT2EN4uWkVY8Kck1a0Aew=;
 b=wQROqHqX2tUkl6mQ1x66EOQSNrWZ6o2IaPjBBIGiYRdENem5w8/WNcLiMyAxrsE/j4DfQ2zN7
 V++cdv6inT6Cb65tP1wBkykEV+bnUi8xQz3L/WieuUpmbn1tr59PCW2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Move poll() to the standard poll.h and drop the custom related definitions.
This also allows to drop an iffy workaround from the nolibc next branch:
e1896bb9e079 ("selftests: harness: Guard includes on nolibc")

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (2):
      tools/nolibc: move poll() to poll.h
      tools/nolibc: use poll-related definitions from UAPI headers

 tools/include/nolibc/Makefile |  1 +
 tools/include/nolibc/nolibc.h |  1 +
 tools/include/nolibc/poll.h   | 55 +++++++++++++++++++++++++++++++++++++++++++
 tools/include/nolibc/sys.h    | 37 -----------------------------
 tools/include/nolibc/types.h  | 14 -----------
 5 files changed, 57 insertions(+), 51 deletions(-)
---
base-commit: e1896bb9e07948b4825883cbc3ca37cf59e17578
change-id: 20250430-poll-75dc16e95639

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

