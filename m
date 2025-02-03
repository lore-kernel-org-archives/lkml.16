Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C9A2063E7
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591192; cv=none; b=OPaf/6y1PmgMoQ5WlVPDUnVPakSr6/P12VSteEd+jNdA32UAHEmlDyrw+FgtP2yAZ9S3WATy50R/9MDMWWJhEbQw2pGTk6oPFQGVTHnvpeH/WbENpenMFbl2RhGAFu+CzRXH5D62F0XEqD1eNoit2+Z+4oLaY0Q/wkIPr9dQHpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591192; c=relaxed/simple;
	bh=X5pzFQl3t9Id8Bg4N9Vu+xtYMPukwkaSLyljCfYdojQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YG84t3UK3xdmfgXmR/BA3RsfdKDW5lr+vaviBRMTfhsujSxSTLg/9v6mAPeqCXhb2Q4bp3KlWIPQyRxLzkiKqd3plku3LZjJpoBgj9gUG5HD703H2eGBlsYT1aBv31p2deJuejClLa2ns08JymziArn09AkVICunChTTf9rvjgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qTF8fUgb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=19w4cvjf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qTF8fUgb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="19w4cvjf"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Fblq5lzhRPvME3UqTEQiFKUL0jlzsGIai//ftQqLlw=;
	b=qTF8fUgbbogNRKtUjm6PiwG8FLHKBa0NMt4mUi66jfERsAGoYbVPibbQyMMWvhUBjZmnCI
	hjwVRb346ZA5v2kSz8X8M39SluyvekwvOCufRhmGA8q7rXl/MRWm+mA4BeTEaMpp0E/2Cg
	0ELtek18NqozhrB+CTBk58T2T+JRTtbwzo8UGmS47NBOnp9aqXSJIJUAzJRTCP95Mvi9Q2
	GFrH90yuxGb/eFPbUpXPPqGwcEv8O03Dkh8ycnBF3LPB+lW9xzQQjdRnfFPUrDX1k4I/F7
	Yr+j+TThohsl2F3pLlFe68OrYNK0ZLsvPZlNQFh6unL770CKJiVRj6PXT6cF0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Fblq5lzhRPvME3UqTEQiFKUL0jlzsGIai//ftQqLlw=;
	b=19w4cvjfd6yy0uf7CrSFn47Uu+Iu/R/9ZGUthPVkqVDrbveouATshVn/EMC0kKY4R+4l0u
	vl/eZ7GJLHxMEqAA==
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
Subject: [PATCH v8 05/15] futex: Hash only the address for private futexes.
Date: Mon,  3 Feb 2025 14:59:25 +0100
Message-ID: <20250203135935.440018-6-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

futex_hash() passes the whole futex_key to jhash2. The first two member
are passed as the first argument and the offset as the "initial value".

For private futexes, the mm-part is always the same and it is used only
within the process. By excluding the mm part from the hash, we reduce
the length passed to jhash2 from 4 (16 / 4) to 2 (8 / 2). This avoids
the __jhash_mix() part of jhash.

The resulting code is smaller and based on testing this variant performs
as good as the original or slightly better.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 26328d8072fee..f608cd6ccc032 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -134,8 +134,8 @@ struct futex_hash_bucket *futex_hash(union futex_key *k=
ey)
 	if (fhb && futex_key_is_private(key)) {
 		u32 hash_mask =3D current->mm->futex_hash_mask;
=20
-		hash =3D jhash2((u32 *)key,
-			      offsetof(typeof(*key), both.offset) / 4,
+		hash =3D jhash2((void *)&key->private.address,
+			      sizeof(key->private.address) / 4,
 			      key->both.offset);
 		return &fhb[hash & hash_mask];
 	}
--=20
2.47.2

