Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801FB22DF9F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751999; cv=none; b=rFNptuMWAKvZNqNBAYMBW7bJyG3Ls9CRkhKpt+WAi9ODJ5JTT8i1NcfsrejlERKQbmQKMKVVi9nfAriQgf1UTefRNduFkg5jm/6bISGwN0e904FPP/mQSUoBAe39XboGtrVtuyMYMRUxSYdfzCSz2LjR06dZKrMAhwxYUkxnIcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751999; c=relaxed/simple;
	bh=5yZXT3sOR+HWy0oC0w916Zn0isWJPDL29E6OWP6h8r4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DkzfxvegLk9QWAf9mYIvPAayxvE40dDXKiabCQ4ONgHSiYqdU6W1bwMJTVE9wtCjWRCsnBF+k56naG7/SlOfbYt6ZxDDcuMLqTHgKX/icWTA7mTt4msfO5BwwYoKLZIjC+hbyTfPbwe6FwXh3RZV8XFR21Wm7bJnJiE73T0tEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Esus7ogu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5W2lGiHq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Esus7ogu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5W2lGiHq"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iB4BM5gskl63TnlFkrADlbgRWdDC/wai5RBmxqiwi6k=;
	b=Esus7ogutJoihiAPlMZhfmsr8G+DG/vdopHfVJYfYAecSmTVHLTHG47p6XP74zPkNsdb0d
	qUlwXsvR6g6rxrobDCabxkPNDxR9QI2QdBKlbKGfszcY/UTZBsdmPWg66sG7y67F8UwNOK
	B1Eb9EYQ53AjP+C1qFaeVz0PpG5lEJjalqx6OStIq+EYOMGUNfyeWfj9y6mziR0QVK2Vwn
	xgmFOgoQttfIkzkuXIIDVA/Xk2PV4tvVABv1JpR2sIis1jd219FQx79ky7ZPTsbq0vF5vr
	sKqruiENI/K6YQvkq77cY4lLXjp/0izuK/9aF+IzL/jMZJJqvJCfcAvfq6KKOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iB4BM5gskl63TnlFkrADlbgRWdDC/wai5RBmxqiwi6k=;
	b=5W2lGiHqSM2OaegdHCZgiD0IbSf+4vpcWLOl7qKL7HZZ9s7nEru1P2Y9mzjOm0w/SxVhRQ
	1B9VApCIu8mH7JDw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [PATCH v2 21/31] bpf: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:05 +0100
Message-Id: <e4be2486f02a8e0ef5aa42624f1708d23e88ad57.1738746821.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Alexei Starovoitov <ast@kernel.org>
---
 kernel/bpf/helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index f27ce162427a..672abe111282 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -1284,8 +1284,7 @@ static int __bpf_async_init(struct bpf_async_kern *as=
ync, struct bpf_map *map, u
=20
 		atomic_set(&t->cancelling, 0);
 		INIT_WORK(&t->cb.delete_work, bpf_timer_delete_work);
-		hrtimer_init(&t->timer, clockid, HRTIMER_MODE_REL_SOFT);
-		t->timer.function =3D bpf_timer_cb;
+		hrtimer_setup(&t->timer, bpf_timer_cb, clockid, HRTIMER_MODE_REL_SOFT);
 		cb->value =3D (void *)async - map->record->timer_off;
 		break;
 	case BPF_ASYNC_TYPE_WQ:
--=20
2.39.5

