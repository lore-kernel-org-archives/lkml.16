Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AA63D6F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746209017; cv=none; b=LiJ3YCRo9mlzt3znI/S6XqUriaQpFQLcBWrXEjjYne7Wz+pdO2CC/jFAJWpsF6cezm2eYhsXXYOc0oti/Sm4nzdBbXHj+pBrGJxKv/hInseHqrFqTGI/AKvdnoCknJMoj5q99/rRyAbI+leM5LtGqPDK5mkGtXQAG6eIWaTTOs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746209017; c=relaxed/simple;
	bh=AJDNpzw3NdJGP69xXtuBevmL3yyHJPVj2D5j+/V5UUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2IaBMm3VdlpnL/wIufhRZtMWWIAU0J1JbB/HKsf0FlIaXjYav1SkLke6uxRUKH/8wzJgGOXCmgrj03SuGYsk5+f3zegaCiDaCUrY9h0tVI/tvhQXZkgNmQu4NXE9OdPvUKTiD5jJMM+oifkPegdzy55rby/5mWj8REFj4G1TNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j586PUgR; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j586PUgR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dZGoOCcIvLVxbGi5BQAlsaUxjo3U40CWkuJXwGWx0IY=; b=j586PUgRgF57d/bi0wYp+B1+Ai
	r11ReXh+AK2wBZRmui6MBGitwBzrR3b2KcOL2S1EGabC2LIzKp91vIFhCalNW8aB/RIUuXkvG6RM+
	IhQX5kuqIwLJZj3fNINGNTLShTGekMLkUzQfIJVuaFl26CU1MOBV2DhxTREeZOTQL3BoE0HaxlVfa
	l59/tca7BaqJ2IVnbSMV6F3zoVF1j3ouughJFWwPJtAEwVwxQTrXmf+urOKUASA2Fv9QevgxNkdtC
	pMzozXTc5A8jRrF3hgxVTZQ2/QlXBSPQeIirYgTW+30PVlZLoDBSleHSw+RDC7tM/I7uiPopX6luI
	WsliKOZQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAui7-00000008thY-1fB9;
	Fri, 02 May 2025 18:02:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8FE1F30057C; Fri,  2 May 2025 20:01:54 +0200 (CEST)
Date: Fri, 2 May 2025 20:01:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH v12 15/21] futex: Allow to make the private hash immutable
Message-ID: <20250502180154.GY4439@noisy.programming.kicks-ass.net>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-16-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416162921.513656-16-bigeasy@linutronix.de>

On Wed, Apr 16, 2025 at 06:29:15PM +0200, Sebastian Andrzej Siewior wrote:
> My initial testing showed that
> 	perf bench futex hash
> 
> reported less operations/sec with private hash. After using the same
> amount of buckets in the private hash as used by the global hash then
> the operations/sec were about the same.
> 
> This changed once the private hash became resizable. This feature added
> a RCU section and reference counting via atomic inc+dec operation into
> the hot path.
> The reference counting can be avoided if the private hash is made
> immutable.
> Extend PR_FUTEX_HASH_SET_SLOTS by a fourth argument which denotes if the
> private should be made immutable. Once set (to true) the a further
> resize is not allowed (same if set to global hash).
> Add PR_FUTEX_HASH_GET_IMMUTABLE which returns true if the hash can not
> be changed.
> Update "perf bench" suite.

Does the below make sense? This changes arg4 into a flags field and uses
bit0 for immutable.

(the point where I got upset is where arg4==2 was accepted :-)

--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -367,6 +367,7 @@ struct prctl_mm_map {
 /* FUTEX hash management */
 #define PR_FUTEX_HASH			78
 # define PR_FUTEX_HASH_SET_SLOTS	1
+# define FH_FLAG_IMMUTABLE		(1ULL << 0)
 # define PR_FUTEX_HASH_GET_SLOTS	2
 # define PR_FUTEX_HASH_GET_IMMUTABLE	3
 
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1440,7 +1440,10 @@ static bool futex_hash_less(struct futex
 	return false; /* equal */
 }
 
-static int futex_hash_allocate(unsigned int hash_slots, unsigned int immutable, bool custom)
+#define FH_CUSTOM	0x01
+#define FH_IMMUTABLE	0x02
+
+static int futex_hash_allocate(unsigned int hash_slots, unsigned int flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct futex_private_hash *fph;
@@ -1448,8 +1451,6 @@ static int futex_hash_allocate(unsigned
 
 	if (hash_slots && (hash_slots == 1 || !is_power_of_2(hash_slots)))
 		return -EINVAL;
-	if (immutable > 2)
-		return -EINVAL;
 
 	/*
 	 * Once we've disabled the global hash there is no way back.
@@ -1469,8 +1470,8 @@ static int futex_hash_allocate(unsigned
 
 	rcuref_init(&fph->users, 1);
 	fph->hash_mask = hash_slots ? hash_slots - 1 : 0;
-	fph->custom = custom;
-	fph->immutable = !!immutable;
+	fph->custom = !!(flags & FH_CUSTOM);
+	fph->immutable = !!(flags & FH_IMMUTABLE);
 	fph->mm = mm;
 
 	for (i = 0; i < hash_slots; i++)
@@ -1563,7 +1564,7 @@ int futex_hash_allocate_default(void)
 	if (current_buckets >= buckets)
 		return 0;
 
-	return futex_hash_allocate(buckets, 0, false);
+	return futex_hash_allocate(buckets, 0);
 }
 
 static int futex_hash_get_slots(void)
@@ -1592,7 +1593,7 @@ static int futex_hash_get_immutable(void
 
 #else
 
-static int futex_hash_allocate(unsigned int hash_slots, unsigned int immutable, bool custom)
+static int futex_hash_allocate(unsigned int hash_slots, unsigned int flags)
 {
 	return -EINVAL;
 }
@@ -1610,11 +1611,16 @@ static int futex_hash_get_immutable(void
 
 int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4)
 {
+	unsigned int flags = FH_CUSTOM;
 	int ret;
 
 	switch (arg2) {
 	case PR_FUTEX_HASH_SET_SLOTS:
-		ret = futex_hash_allocate(arg3, arg4, true);
+		if (arg4 & ~FH_FLAG_IMMUTABLE)
+			return -EINVAL;
+		if (arg4 & FH_FLAG_IMMUTABLE)
+			flags |= FH_IMMUTABLE;
+		ret = futex_hash_allocate(arg3, flags);
 		break;
 
 	case PR_FUTEX_HASH_GET_SLOTS:
