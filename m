Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DCF280A2C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552260; cv=none; b=BjNRdjt2G23N9Nz6Xymt6SipkA2axT75sTlxXc1XGxgP4Ddcd1nffzaTYXYGy7/VYGaprz0rRaN1Ur+AhojuQMYLCbz7ih4lFxBKuSUHijN5ytI0YJesUVic+Svwv8Glp/J5iCqwazmlYqD75s8yf6Uy8kmJXxUqej32KkiTEDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552260; c=relaxed/simple;
	bh=KFMsaCdCvJb3q2FQocRMQdyM00taIuspYZSsHgfUdPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0MFqV5Oa6q0yLwf9o4ExHPMQSwa/8GjEv/nWtTlbLyKg3kHUZMsbT7872g5RCz+8WtFv7EfAcQfsiGZXu+9DX/AbUWiafbZ3wx03kFhPzCFCuFTCSrk2n+P0mJHpl/1Q6r0FYOLQRN3ROsCtsKuPn3zqOAKuaijh8TwrO0nIqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0+8mAkOX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c6vVbmaN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0+8mAkOX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c6vVbmaN"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749552251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bMlr6vHZDVDhBXQFB0RwxiPu4nhdh71Fe9TrcXNAn8w=;
	b=0+8mAkOXYgTnk3cu+78HLPUO9+UaoDSFMhOOFsTSNQ4xVqEUNiV7G5UxfjrOr5R45ceDbk
	s1ZEpfb/Nz8N3lDNccfI552+3OI0sMMCOWZTP5c2hYEn8mropHOOxiebE/4geyIi1ULQ3u
	peNttt6X05eV3rweFYTwDf0gEB4zq+rJyHJv9hUNSAgi1HtDxUiOt7wH8pmqhNACq0Wec1
	O508A9JbUiOigKSV3WuHScIgLywx+cH/tAHARhIw+zZ/eLZp/AFaL8U30wcG0+n/GI8WQH
	hEiqcJkFBiSHQsYDkjQmz/DDxNQ22+6F1EiOPx9yMX9K16ZTVKcS7iKyAQT7Qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749552251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bMlr6vHZDVDhBXQFB0RwxiPu4nhdh71Fe9TrcXNAn8w=;
	b=c6vVbmaNivWadEYQ6bQ6zv7K8CTK/EBpkBf3X/wNAFYeJzhbARLNgbW6co63kGWdx8xO8Y
	7OobeFybxApShZDA==
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
Subject: [PATCH v2 3/4] futex: Handle invalid node numbers supplied by user
Date: Tue, 10 Jun 2025 12:43:59 +0200
Message-ID: <20250610104400.1077266-4-bigeasy@linutronix.de>
In-Reply-To: <20250610104400.1077266-1-bigeasy@linutronix.de>
References: <20250610104400.1077266-1-bigeasy@linutronix.de>
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
index 565f9717c6caa..b652d2f60c409 100644
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

