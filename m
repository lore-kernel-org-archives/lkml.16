Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9992741D5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422528; cv=none; b=RDoPwz7WJ5+/+IxU7ZBmBO8LEbNufS7T/RdP7kvnZnhYq2OMKQcCVEFsZsuAliL8daEqTNeE0bIYf1zqIjgFah83E55oQTQMi2hlkaT05mXpq4JvBYeVh6O+D35OMsNOuJe02F1Ayc/Wod7Qob5t7dztlo3wGMVGOVwLX/0BNbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422528; c=relaxed/simple;
	bh=HtELk90LA0L/aE4oz8Fm3MhpHiBMfmMzvrlqm3b+VVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HAqPwRzNzgeycc+g6ZlBJ75qt65hU4eiIu5n+cybN5mFrSesTp2x24Skn4Ee+ztUgmLNX4rQq0xfwcqpbXqu5UolaamKNUqHdoxmYc44129aGY5Yi/aOw7IMG3P4p6f6O0RRavUl9OEdKDSuCgUavbZb6DuDmrdf+klddnnhEyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cLiEK62g; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pQBcE1Ln; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cLiEK62g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pQBcE1Ln"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748422525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vesH8GfaJYBN1Vl/67VRjZcPODCDdnqQI3NREZ27DTc=;
	b=cLiEK62gpqattIJ5OH5DMo2/9+RciI5gs1hm/XE9tqJEbY25nHJReTzjI2eUhlpSHFfaKk
	a61aJP2KAaZDAQLFkyve4ph23JCYvxtQ9H0xKepdkbrEA5ua9KDNoPB93001EsK6vIJUTw
	kv4n0uBEtvXtUlmSB6C+57ufgiHf1nicsSfSRUsNn8yWyjk1ZEYBjj/+UMzyRcQJG+Knee
	1QpfKoStaA1fqaUc9qBV0iI3mASP37Qhb9ZDoz01VweWWagD8e0Q3a6jlcEDMgCHfhqTIR
	vHdzJjZgfwOUcQm8QmbFCJHxWV7yAgafwH7+vY7zgWLNhTNFBF7HOB0raeDulQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748422525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vesH8GfaJYBN1Vl/67VRjZcPODCDdnqQI3NREZ27DTc=;
	b=pQBcE1LnmLJJ/ZpO7EBqymrxGfINzsIhIzG7FevdSzyER9hA0573CrlTgpNWrS6StLmoTU
	Ik9DN18St7FUbDAQ==
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
Subject: [PATCH 0/3] futex: Fixups for the testsuite and FUTEX_NUMA
Date: Wed, 28 May 2025 10:55:18 +0200
Message-ID: <20250528085521.1938355-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is a collection of random fixes related to the recent private
futex/ NUMA addition:

 - Some of the test fail on ARM due bad command line parsing.

 - The MPOL test fails because the home node was never set.

 - The syzbot used a negative NODE number which was not tested for.

Peter Zijlstra (1):
  futex: Handle invalid node numbers supplied by user

Sebastian Andrzej Siewior (2):
  selftests/futex: getopt() requires int as return value.
  selftests/futex: Set the home_node in futex_numa_mpol

 kernel/futex/core.c                                    |  4 ++--
 .../selftests/futex/functional/futex_numa_mpol.c       | 10 +++++++---
 .../selftests/futex/functional/futex_priv_hash.c       |  2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

--=20
2.49.0

