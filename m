Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF8B212B31
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744821108; cv=none; b=SlcC+cXzoD+0XqwmYTBotvt5eb0LG4qPfxQj6gq44O47cu7z9sGOSk1K21S8FVrk2rzATyOWoRq9kbi5PBs2oy6ueJUjX2GhToWEiQYgsBCJ2rfxzdgOuUXuvehPCp/uJC4y+aQe2jhf5aynb0Zeg1cadFiC1IFBcwB+s+HgpJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744821108; c=relaxed/simple;
	bh=dtP0vCX55X1RjfE4fSlvS7Q942e3S8DWSoc0ik+PU/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XT4nV0EBUsHvTN80SGWXdYzJQuLiF1k4EXx8m9cq27vxPXdA9DScnpDdfz8WzNXpTH4nr4EUsMtBi37G9u9aY80EyakoKotSwEsyOWEtpUr17YRq0XzPSryz4bY+s/7xf+HmKd8cihBA+TZWwxfMHIpo+bCkkB46xbMB0K287aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=siANcMeG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tYXVDK60; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="siANcMeG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tYXVDK60"
Date: Wed, 16 Apr 2025 18:31:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744821103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amUP9xwF9Qm/GhhOepDMiXWZehFdfN1MDIRdAnlv0x8=;
	b=siANcMeGu6f+1UqDC6qyd6TbvtjBevxmpZC8zW8kV/ZqdbYUoCQdtWLAoAOUZtHUYMqO/A
	xb/yWCJjgGeCpuZFKJX0ur0HDcl0QYpBW4dB7l33vEftBktK2xsq1/fj7LfgvJMFa5F6XT
	3M76d3Key62KNl+hWl8dfEroi+PPa/tjvmJpE8i5FZ+ZUnkGMV3ERTAhO6tyB9Daf2cyTc
	J5xwiHrObJNoXZMyU7C7UW7x6hMiyDjm/mbbuJLb4qlNGCRQqihBfuBo3bJ6ZaDVYA0HPf
	ZunW08o/mcMW/vY5d2O7NeRlxxScXFFFnbFWQTlLQmy0my3D7YyJMWbUi7OIFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744821103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amUP9xwF9Qm/GhhOepDMiXWZehFdfN1MDIRdAnlv0x8=;
	b=tYXVDK602ga8W+EZVHCS0ThyQlMuqZkVtLf4tR+Uzts4JWwKeZgxNAZd/Wgl63ACSyNvzh
	Q5scGRq/BYFQjlAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 00/21] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
Message-ID: <20250416163142.aKBzQeqK@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>

On 2025-04-16 18:29:00 [+0200], To linux-kernel@vger.kernel.org wrote:
> v11=E2=80=A6v12: https://lore.kernel.org/all/20250407155742.968816-1-bige=
asy@linutronix.de

A diff excluding the tools/testing/ changes:

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 96c7229856d97..eccc99751bd94 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -109,7 +109,7 @@ static inline long do_futex(u32 __user *uaddr, int op, =
u32 val,
 {
 	return -EINVAL;
 }
-static inline int futex_hash_prctl(unsigned long arg2, unsigned long arg3)
+static inline int futex_hash_prctl(unsigned long arg2, unsigned long arg3,=
 unsigned long arg4)
 {
 	return -EINVAL;
 }
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 44bb9eeb0a9c1..ee1d7182ce0c0 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -551,6 +551,7 @@ int get_futex_key(u32 __user *uaddr, unsigned int flags=
, union futex_key *key,
 	struct folio *folio;
 	struct address_space *mapping;
 	int node, err, size, ro =3D 0;
+	bool node_updated =3D false;
 	bool fshared;
=20
 	fshared =3D flags & FLAGS_SHARED;
@@ -575,24 +576,29 @@ int get_futex_key(u32 __user *uaddr, unsigned int fla=
gs, union futex_key *key,
 	node =3D FUTEX_NO_NODE;
=20
 	if (flags & FLAGS_NUMA) {
-		u32 __user *naddr =3D uaddr + size / 2;
+		u32 __user *naddr =3D (void *)uaddr + size / 2;
=20
 		if (futex_get_value(&node, naddr))
 			return -EFAULT;
=20
-		if (node >=3D MAX_NUMNODES || !node_possible(node))
+		if (node !=3D FUTEX_NO_NODE &&
+		    (node >=3D MAX_NUMNODES || !node_possible(node)))
 			return -EINVAL;
 	}
=20
-	if (node =3D=3D FUTEX_NO_NODE && (flags & FLAGS_MPOL))
+	if (node =3D=3D FUTEX_NO_NODE && (flags & FLAGS_MPOL)) {
 		node =3D futex_mpol(mm, address);
+		node_updated =3D true;
+	}
=20
 	if (flags & FLAGS_NUMA) {
-		u32 __user *naddr =3D uaddr + size / 2;
+		u32 __user *naddr =3D (void *)uaddr + size / 2;
=20
-		if (node =3D=3D FUTEX_NO_NODE)
+		if (node =3D=3D FUTEX_NO_NODE) {
 			node =3D numa_node_id();
-		if (futex_put_value(node, naddr))
+			node_updated =3D true;
+		}
+		if (node_updated && futex_put_value(node, naddr))
 			return -EFAULT;
 	}
=20
@@ -1573,6 +1579,8 @@ static int futex_hash_allocate(unsigned int hash_slot=
s, unsigned int immutable,
=20
 	if (hash_slots && (hash_slots =3D=3D 1 || !is_power_of_2(hash_slots)))
 		return -EINVAL;
+	if (immutable > 2)
+		return -EINVAL;
=20
 	/*
 	 * Once we've disabled the global hash there is no way back.
@@ -1586,7 +1594,7 @@ static int futex_hash_allocate(unsigned int hash_slot=
s, unsigned int immutable,
 		}
 	}
=20
-	fph =3D kvzalloc(struct_size(fph, queues, hash_slots), GFP_KERNEL_ACCOUNT=
);
+	fph =3D kvzalloc(struct_size(fph, queues, hash_slots), GFP_KERNEL_ACCOUNT=
 | __GFP_NOWARN);
 	if (!fph)
 		return -ENOMEM;
=20
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 004e4dbee4f93..069fc2a83080d 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -55,7 +55,7 @@ static inline unsigned int futex_to_flags(unsigned int op)
 	return flags;
 }
=20
-#define FUTEX2_VALID_MASK (FUTEX2_SIZE_MASK | FUTEX2_NUMA | FUTEX2_PRIVATE)
+#define FUTEX2_VALID_MASK (FUTEX2_SIZE_MASK | FUTEX2_NUMA | FUTEX2_MPOL | =
FUTEX2_PRIVATE)
=20
 /* FUTEX2_ to FLAGS_ */
 static inline unsigned int futex2_to_flags(unsigned int flags2)
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index 356e52c17d3c5..dacb2330f1fbc 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -993,6 +993,16 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flag=
s, ktime_t *time, int tryl
 			goto no_block;
 		}
=20
+		/*
+		 * Caution; releasing @hb in-scope. The hb->lock is still locked
+		 * while the reference is dropped. The reference can not be dropped
+		 * after the unlock because if a user initiated resize is in progress
+		 * then we might need to wake him. This can not be done after the
+		 * rt_mutex_pre_schedule() invocation. The hb will remain valid because
+		 * the thread, performing resize, will block on hb->lock during
+		 * the requeue.
+		 */
+		futex_hash_put(no_free_ptr(hb));
 		/*
 		 * Must be done before we enqueue the waiter, here is unfortunately
 		 * under the hb lock, but that *should* work because it does nothing.
@@ -1016,10 +1026,6 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int fl=
ags, ktime_t *time, int tryl
 		 */
 		raw_spin_lock_irq(&q.pi_state->pi_mutex.wait_lock);
 		spin_unlock(q.lock_ptr);
-		/*
-		 * Caution; releasing @hb in-scope.
-		 */
-		futex_hash_put(no_free_ptr(hb));
 		/*
 		 * __rt_mutex_start_proxy_lock() unconditionally enqueues the @rt_waiter
 		 * such that futex_unlock_pi() is guaranteed to observe the waiter when
diff --git a/tools/perf/bench/futex.c b/tools/perf/bench/futex.c
index bed3b6e46d109..02ae6c52ba881 100644
--- a/tools/perf/bench/futex.c
+++ b/tools/perf/bench/futex.c
@@ -31,20 +31,25 @@ void futex_print_nbuckets(struct bench_futex_parameters=
 *params)
 	if (params->nbuckets >=3D 0) {
 		if (ret !=3D params->nbuckets) {
 			if (ret < 0) {
-				printf("Can't query number of buckets: %d/%m\n", ret);
+				printf("Can't query number of buckets: %m\n");
 				err(EXIT_FAILURE, "prctl(PR_FUTEX_HASH)");
 			}
 			printf("Requested number of hash buckets does not currently used.\n");
 			printf("Requested: %d in usage: %d\n", params->nbuckets, ret);
 			err(EXIT_FAILURE, "prctl(PR_FUTEX_HASH)");
 		}
-		ret =3D prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_IMMUTABLE);
-		if (params->nbuckets =3D=3D 0)
+		if (params->nbuckets =3D=3D 0) {
 			ret =3D asprintf(&futex_hash_mode, "Futex hashing: global hash");
-		else
+		} else {
+			ret =3D prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_IMMUTABLE);
+			if (ret < 0) {
+				printf("Can't check if the hash is immutable: %m\n");
+				err(EXIT_FAILURE, "prctl(PR_FUTEX_HASH)");
+			}
 			ret =3D asprintf(&futex_hash_mode, "Futex hashing: %d hash buckets %s",
 				       params->nbuckets,
 				       ret =3D=3D 1 ? "(immutable)" : "");
+		}
 	} else {
 		if (ret <=3D 0) {
 			ret =3D asprintf(&futex_hash_mode, "Futex hashing: global hash");


Sebastian
