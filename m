Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C112063E4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591191; cv=none; b=EQy++FE32alsT21iWjUMjWouhLxPS2wwXmoOXSAgW4xoG5KYcK/WaH3HGlbZau6UCBZrU2ZvJwTHKjV1eL2BHQ09k3Gbr/qSpFAW//QlM/HXxUbi7eUh+546DMqMVsWjr2htC3tBenA3tvtVEu8tChtz89O4DvcsGT2zTWHln+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591191; c=relaxed/simple;
	bh=kneljZUGZhSn7ACC62SOnRyod0ubWPJeTd+fbse+vOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DlKtoiQuqcZg/7KcgbScVt+eWRKgpL0yaCnoAC5lnm3JEoDiHLSajq0OdWkyXbZxYr7Ot4BEIOI5dORehE28XMH1fo838d0XMZjBf3QqJREZQlVRJbDNIuDUOOQVlmSVJhZ1MJb4owZfpR49PogVBSv4wSeptAeYwoZiF+oMFfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U/GjAUJC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sF5jW7kV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U/GjAUJC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sF5jW7kV"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VUcnGP0kVAVKvxfl1B22K4KhjbPPRJxpoPJxnoANCs=;
	b=U/GjAUJC7maOqG180AjoZM9Pg1p45x5RvINI4B2DDujN2wHAuGe5o4sRM657YtWgDYNmpv
	CizAr/n8/Rfj3KdtPzdBXTGpFP6/Qk6rncypm0rKtdw+KDV/OV9DsICzY+3wWhtBDsqfyA
	ZKZqnRizpbDGTpj+vBFz1rDar0USO2PTNzb0QXPsiqTUxBhCdqqki5nTsWhzlgALGiSai5
	sXFCFa+psFSdFUluN9LA2SqAZE7m7oP0zSFKgQiwbfi/8nF3A9c79co4q+cNwmfqVhSh3Y
	QhVANcgt1PP300CIhl4y4hxVJoGxBJ2tLX4Zq1Bp2NDVvAUigB6lF3SmTNlwSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VUcnGP0kVAVKvxfl1B22K4KhjbPPRJxpoPJxnoANCs=;
	b=sF5jW7kV0BdSYB/gNHknraMz/BPTrgLuwpM5NFmhpy3cKYspZY9AC9WVlj81AKf/QjX7Ee
	siQHyIRcuPDLTNBA==
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
Subject: [PATCH v8 06/15] futex: Move private hashing into its own function.
Date: Mon,  3 Feb 2025 14:59:26 +0100
Message-ID: <20250203135935.440018-7-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The hashing of the private is slightly different and will be needed
again while moving a futex_q entry to a different hash bucket after the
resize.

Move the private hashing into its own function.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index f608cd6ccc032..fdfc3402278a1 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -117,6 +117,18 @@ static inline bool futex_key_is_private(union futex_ke=
y *key)
 	return !(key->both.offset & (FUT_OFF_INODE | FUT_OFF_MMSHARED));
 }
=20
+static struct futex_hash_bucket *futex_hash_private(union futex_key *key,
+						    struct futex_hash_bucket *fhb,
+						    u32 hash_mask)
+{
+	u32 hash;
+
+	hash =3D jhash2((void *)&key->private.address,
+		      sizeof(key->private.address) / 4,
+		      key->both.offset);
+	return &fhb[hash & hash_mask];
+}
+
 /**
  * futex_hash - Return the hash bucket in the global or local hash
  * @key:	Pointer to the futex key for which the hash is calculated
@@ -131,14 +143,9 @@ struct futex_hash_bucket *futex_hash(union futex_key *=
key)
 	u32 hash;
=20
 	fhb =3D current->mm->futex_hash_bucket;
-	if (fhb && futex_key_is_private(key)) {
-		u32 hash_mask =3D current->mm->futex_hash_mask;
+	if (fhb && futex_key_is_private(key))
+		return futex_hash_private(key, fhb, current->mm->futex_hash_mask);
=20
-		hash =3D jhash2((void *)&key->private.address,
-			      sizeof(key->private.address) / 4,
-			      key->both.offset);
-		return &fhb[hash & hash_mask];
-	}
 	hash =3D jhash2((u32 *)key,
 		      offsetof(typeof(*key), both.offset) / 4,
 		      key->both.offset);
--=20
2.47.2

