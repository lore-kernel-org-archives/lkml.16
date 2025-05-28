Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203DE274650
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422529; cv=none; b=pLAoFG/kayRJfi6st3t5M0Dx6HGl4Qm5N+b9uxqQfasO9s8Wgnkv423SXo+EokKdiX+godqw2LlBFvLIdSObhPVgyuJvRryCAJZLhvguSvpyxASy5i3Yy4AO3P+5V+OlH/h6O71DWWgZzKZna8Xo6+X+sME3kx6Bd19F2fBsjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422529; c=relaxed/simple;
	bh=gG92xEH34NEWfZ8s9BqsyAZsrJjNEhovX+4zgItkEco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdGuS9eINHoJlZqjS8Dm4zToKsejN++XRDIpX/NFQHjNPNQgsLWcub5i5mLurMZmEQhkRgiw/u5KyCwSrGyx0kuQaQvy6CIPyYNesChJdb9QFA/lKkPS8ASfIXq51QE/m+In7sPuiGu6Ub6P7tk1DBDBnxVpyClgfSZ8Xqsh0IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XmuaOal6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VmKWr++m; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XmuaOal6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VmKWr++m"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748422526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KP9HvpgVHgWnTIXnNHgTJzo+gF4B7NnJsWc70Z9S1Pc=;
	b=XmuaOal6nFti4ocGc4QJbLpdSuuQkmCKbLmyT1+lIYs2D0VC/VTP7oDnZFCg9EJzfT4Go6
	0mU1628otu8MNHmi4r3Z+7TW+vOj1k4wVQ6Xuob+QlKycUk1GimAUcY9imn3IKupMfBo6u
	piogVWRNTU7f1dH/JWh3qN7+t/SMZi79BXwRkb2S2+3xo91gbwXPE2qyFOxnIBCoQlwctl
	5XH84JL2j6HuIFIa/N3QbkLrgJaQGfqDGCh0n/VobOo8sAXFqENoIbgyMc1PgZcJqsGR4K
	dTsFrhVyOcdU6BhSZ6Jgt19RMYvp6wnt6urUkhGs2wGW5RQZX1oUKyHBkCR6kA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748422526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KP9HvpgVHgWnTIXnNHgTJzo+gF4B7NnJsWc70Z9S1Pc=;
	b=VmKWr++mLJ84NxOefqHyQSXBxmTzn7gUnWGglZfxR1seI0rDmBj/y3kBCXbU1YY7Aplt5b
	BEAhhHlqLQGd3dCQ==
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
	syzbot+9afaf6749e3a7aa1bdf3@syzkaller.appspotmail.com,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 3/3] futex: Handle invalid node numbers supplied by user
Date: Wed, 28 May 2025 10:55:21 +0200
Message-ID: <20250528085521.1938355-4-bigeasy@linutronix.de>
In-Reply-To: <20250528085521.1938355-1-bigeasy@linutronix.de>
References: <20250528085521.1938355-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Zijlstra <peterz@infradead.org>

syzbot used a negative node number which was not rejected early and led
to invalid memory access in node_possible().

Reject negative node numbers except for FUTEX_NO_NODE.

[bigeasy: Keep the FUTEX_NO_NODE check]

Reported-by: syzbot+9afaf6749e3a7aa1bdf3@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6835bfe3.a70a0220.253bc2.00b5.GAE@googl=
e.com/
Fixes: cec199c5e39bd ("futex: Implement FUTEX2_NUMA")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 19a2c65f3d373..1cd3a646c91fd 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -583,8 +583,8 @@ int get_futex_key(u32 __user *uaddr, unsigned int flags=
, union futex_key *key,
 		if (futex_get_value(&node, naddr))
 			return -EFAULT;
=20
-		if (node !=3D FUTEX_NO_NODE &&
-		    (node >=3D MAX_NUMNODES || !node_possible(node)))
+		if ((node !=3D FUTEX_NO_NODE) &&
+		    ((unsigned int)node >=3D MAX_NUMNODES || !node_possible(node)))
 			return -EINVAL;
 	}
=20
--=20
2.49.0

