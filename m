Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696C021ADB2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820978; cv=none; b=Is+6TOIeCdUZg3VXATWzfWSGsFNJxGOgh5OhuAqtSO4EqWreWJhXHiEcwmS/igj5OcQDQTsubG1KkfRDx6Gmmn9P/auo/ekanl/ixfEK2oMPgjjxS4sIftg/kTXj+cQmbuuSNVMnpb69IzS3R36V/T/ofmHDT0tJcxX94eCwJ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820978; c=relaxed/simple;
	bh=uSjj2prwgpxPK1WfhS5g0UP1RCfBJaD0kQ9KvFiBfBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLEd8UUVG/MdbkD0KHLA35s/k/kcBetbYdwv1PfuRiMfxEW/oGypgCvVV9x79edmpN7/E2vKLiuzm866TqxTpW602OfE4YOl026JooMxTplG+cu8XCkxclU1OxIMfLYsCjLLSry7uP50/oEcleaWLCVZJX49tYwJXT0qotjN7I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ObsJYWKq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Th8pQuwP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ObsJYWKq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Th8pQuwP"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yyaf1r00Tl/hAYybKNhDkdWLTny5vavj746pDaUGf7M=;
	b=ObsJYWKqE8VKH7icrwGBSTgPqw4Va2e6HP5CmdN/UKaGvEl3BEZ5gBCdGs79b8AGK4ESYb
	PfDMv/7ebOrLLmf7QMR0jlVuA+hrvJw9s1JrpArw6t9PtuPc06hoigtnPmsfzrM5gsrgsv
	fWD4K+1XFCHTDf+mIootvbdYVShSf3vrtE+20PCyESyOufL3NozeHvBLZf0KhNV3a7YigM
	A79xpLQkqhd1C6BD1LB2J8+/jjcKSn1qEhvRFowrlvCV1DsVtM9cxV5jpzuUhJOEpxqs2T
	NdZdSeEmZ9AmNO90G8f5pg4mSET3Y1GBTURgdsFx/UozCJbquUCSB54Ij53g+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yyaf1r00Tl/hAYybKNhDkdWLTny5vavj746pDaUGf7M=;
	b=Th8pQuwPHbBzB9CRNsoFRxyZqgTSo/xK1yazt/5P6ZEHUV+zzbEtYfjMTrfA62WO2sWEPg
	o44Ih8VaNdN3GZDg==
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
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v12 15/21] futex: Allow to make the private hash immutable
Date: Wed, 16 Apr 2025 18:29:15 +0200
Message-ID: <20250416162921.513656-16-bigeasy@linutronix.de>
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

My initial testing showed that
	perf bench futex hash

reported less operations/sec with private hash. After using the same
amount of buckets in the private hash as used by the global hash then
the operations/sec were about the same.

This changed once the private hash became resizable. This feature added
a RCU section and reference counting via atomic inc+dec operation into
the hot path.
The reference counting can be avoided if the private hash is made
immutable.
Extend PR_FUTEX_HASH_SET_SLOTS by a fourth argument which denotes if the
private should be made immutable. Once set (to true) the a further
resize is not allowed (same if set to global hash).
Add PR_FUTEX_HASH_GET_IMMUTABLE which returns true if the hash can not
be changed.
Update "perf bench" suite.

For comparison, results of "perf bench futex hash -s":
- Xeon CPU E5-2650, 2 NUMA nodes, total 32 CPUs:
  - Before the introducing task local hash
    shared  Averaged 1.487.148 operations/sec (+- 0,53%), total secs =3D 10
    private Averaged 2.192.405 operations/sec (+- 0,07%), total secs =3D 10

  - With the series
    shared  Averaged 1.326.342 operations/sec (+- 0,41%), total secs =3D 10
    -b128   Averaged   141.394 operations/sec (+- 1,15%), total secs =3D 10
    -Ib128  Averaged   851.490 operations/sec (+- 0,67%), total secs =3D 10
    -b8192  Averaged   131.321 operations/sec (+- 2,13%), total secs =3D 10
    -Ib8192 Averaged 1.923.077 operations/sec (+- 0,61%), total secs =3D 10
    128 is the default allocation of hash buckets.
    8192 was the previous amount of allocated hash buckets.

- Xeon(R) CPU E7-8890 v3, 4 NUMA nodes, total 144 CPUs:
  - Before the introducing task local hash
    shared   Averaged 1.810.936 operations/sec (+- 0,26%), total secs =3D 20
    private  Averaged 2.505.801 operations/sec (+- 0,05%), total secs =3D 20

  - With the series
    shared   Averaged 1.589.002 operations/sec (+- 0,25%), total secs =3D 20
    -b1024   Averaged    42.410 operations/sec (+- 0,20%), total secs =3D 20
    -Ib1024  Averaged   740.638 operations/sec (+- 1,51%), total secs =3D 20
    -b65536  Averaged    48.811 operations/sec (+- 1,35%), total secs =3D 20
    -Ib65536 Averaged 1.963.165 operations/sec (+- 0,18%), total secs =3D 20
    1024 is the default allocation of hash buckets.
    65536 was the previous amount of allocated hash buckets.

Acked-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/uapi/linux/prctl.h |  1 +
 kernel/futex/core.c        | 44 ++++++++++++++++++++++++++++++++------
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 3b93fb906e3c5..21f30b3ded74b 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -368,5 +368,6 @@ struct prctl_mm_map {
 #define PR_FUTEX_HASH			78
 # define PR_FUTEX_HASH_SET_SLOTS	1
 # define PR_FUTEX_HASH_GET_SLOTS	2
+# define PR_FUTEX_HASH_GET_IMMUTABLE	3
=20
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 9e7dad52abea8..81c5705b6af5e 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -63,6 +63,7 @@ struct futex_private_hash {
 	struct rcu_head	rcu;
 	void		*mm;
 	bool		custom;
+	bool		immutable;
 	struct futex_hash_bucket queues[];
 };
=20
@@ -132,12 +133,16 @@ static inline bool futex_key_is_private(union futex_k=
ey *key)
=20
 bool futex_private_hash_get(struct futex_private_hash *fph)
 {
+	if (fph->immutable)
+		return true;
 	return rcuref_get(&fph->users);
 }
=20
 void futex_private_hash_put(struct futex_private_hash *fph)
 {
 	/* Ignore return value, last put is verified via rcuref_is_dead() */
+	if (fph->immutable)
+		return;
 	if (rcuref_put(&fph->users))
 		wake_up_var(fph->mm);
 }
@@ -277,6 +282,8 @@ struct futex_private_hash *futex_private_hash(void)
 		if (!fph)
 			return NULL;
=20
+		if (fph->immutable)
+			return fph;
 		if (rcuref_get(&fph->users))
 			return fph;
 	}
@@ -1433,7 +1440,7 @@ static bool futex_hash_less(struct futex_private_hash=
 *a,
 	return false; /* equal */
 }
=20
-static int futex_hash_allocate(unsigned int hash_slots, bool custom)
+static int futex_hash_allocate(unsigned int hash_slots, unsigned int immut=
able, bool custom)
 {
 	struct mm_struct *mm =3D current->mm;
 	struct futex_private_hash *fph;
@@ -1441,13 +1448,15 @@ static int futex_hash_allocate(unsigned int hash_sl=
ots, bool custom)
=20
 	if (hash_slots && (hash_slots =3D=3D 1 || !is_power_of_2(hash_slots)))
 		return -EINVAL;
+	if (immutable > 2)
+		return -EINVAL;
=20
 	/*
 	 * Once we've disabled the global hash there is no way back.
 	 */
 	scoped_guard(rcu) {
 		fph =3D rcu_dereference(mm->futex_phash);
-		if (fph && !fph->hash_mask) {
+		if (fph && (!fph->hash_mask || fph->immutable)) {
 			if (custom)
 				return -EBUSY;
 			return 0;
@@ -1461,6 +1470,7 @@ static int futex_hash_allocate(unsigned int hash_slot=
s, bool custom)
 	rcuref_init(&fph->users, 1);
 	fph->hash_mask =3D hash_slots ? hash_slots - 1 : 0;
 	fph->custom =3D custom;
+	fph->immutable =3D !!immutable;
 	fph->mm =3D mm;
=20
 	for (i =3D 0; i < hash_slots; i++)
@@ -1553,7 +1563,7 @@ int futex_hash_allocate_default(void)
 	if (current_buckets >=3D buckets)
 		return 0;
=20
-	return futex_hash_allocate(buckets, false);
+	return futex_hash_allocate(buckets, 0, false);
 }
=20
 static int futex_hash_get_slots(void)
@@ -1567,9 +1577,22 @@ static int futex_hash_get_slots(void)
 	return 0;
 }
=20
+static int futex_hash_get_immutable(void)
+{
+	struct futex_private_hash *fph;
+
+	guard(rcu)();
+	fph =3D rcu_dereference(current->mm->futex_phash);
+	if (fph && fph->immutable)
+		return 1;
+	if (fph && !fph->hash_mask)
+		return 1;
+	return 0;
+}
+
 #else
=20
-static int futex_hash_allocate(unsigned int hash_slots, bool custom)
+static int futex_hash_allocate(unsigned int hash_slots, unsigned int immut=
able, bool custom)
 {
 	return -EINVAL;
 }
@@ -1578,6 +1601,11 @@ static int futex_hash_get_slots(void)
 {
 	return 0;
 }
+
+static int futex_hash_get_immutable(void)
+{
+	return 0;
+}
 #endif
=20
 int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long=
 arg4)
@@ -1586,15 +1614,17 @@ int futex_hash_prctl(unsigned long arg2, unsigned l=
ong arg3, unsigned long arg4)
=20
 	switch (arg2) {
 	case PR_FUTEX_HASH_SET_SLOTS:
-		if (arg4 !=3D 0)
-			return -EINVAL;
-		ret =3D futex_hash_allocate(arg3, true);
+		ret =3D futex_hash_allocate(arg3, arg4, true);
 		break;
=20
 	case PR_FUTEX_HASH_GET_SLOTS:
 		ret =3D futex_hash_get_slots();
 		break;
=20
+	case PR_FUTEX_HASH_GET_IMMUTABLE:
+		ret =3D futex_hash_get_immutable();
+		break;
+
 	default:
 		ret =3D -EINVAL;
 		break;
--=20
2.49.0

