Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8F1922FB
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411433; cv=none; b=s1GZJfXcTLfKW49cjMoaREB/P1GwIcj7kW4CeWUiSSkEkKMaNylqhABWzeUE9GCNVaXm6ZSTs+VzHGU8M3+FB2sLkU4y65YD+XCIjTtXh6Pi4nXLEbihapORtBq6AJOVVO58lv8gDAv3s/FLF12ekKpcosU/3Gl8TldEzFTJcPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411433; c=relaxed/simple;
	bh=j/BzPvwStte+u580GD3gncn95b2rBkz0AAqHpk6bJBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjpAoJRKNwVfWC62G6ugRS6fTW3bTFwWDTRcDzRGOPvpncPMjL3ijEuXafJHTseDFiISkMxczQA64xGqXnZAgUHiCulHTiuqmWD9ovj5Tdg9XF+Ulx84jNYrgQI960+YjAxPLsc+A3Pr3f341emOvyNlRBEFOIam4li8K06b3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gt0x0UDR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p1as1lxM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Gt0x0UDR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p1as1lxM"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747411429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuFsKmSU09nElHvJf8RpcCbmx97tu90mrN0WgRIDs1o=;
	b=Gt0x0UDRlqbzCMf3WZWXcjyIKDMEXF2DP1na5G5uRRliI6jM2oeJXvnpHZiWngwhuFHc4S
	VVh2BzxyCBi8sxUCqp9ZJxXBmZb+9H5lZJINSPdPtsW0LUfepedNTuuWtCAtzvGAsfzWIe
	W+Xu+RmTUnihdj47dr1AJo3k/0lEepXkA6B6h/p8WOrxidF3XlXGu3dalWY7GtuJDlcOZe
	h5UTH80Yow8jlzkZzYFfF/F4vUITnlK2yN9Ih8PenpLRCc8BWNyl5PB1kUD7GORLDcZksz
	W7vPncoNTEZMUkxeYFfGUy90QNpDvG9KZKK2aujLauhcnhsvo53cPLmLRD3Bzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747411429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuFsKmSU09nElHvJf8RpcCbmx97tu90mrN0WgRIDs1o=;
	b=p1as1lxMTu99FODwmIB+5sc+w3lSmVkSmv2G6f5dW0ZoDRhEhJEE2k9ve7XF0fOEb08fLv
	J5cv4EOeXCEizFBg==
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
Subject: [PATCH 3/5] futex: Use RCU_INIT_POINTER() in futex_mm_init().
Date: Fri, 16 May 2025 18:03:37 +0200
Message-ID: <20250516160339.1022507-4-bigeasy@linutronix.de>
In-Reply-To: <20250516160339.1022507-1-bigeasy@linutronix.de>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is no need for an explicit NULL pointer initialisation plus a
comment why it is okay. RCU_INIT_POINTER() can be used for NULL
initialisations and it is documented.

This has been build tested with gcc version 9.3.0 (Debian 9.3.0-22) on a
x86-64 defconfig.

Fixes: 094ac8cff7858 ("futex: Relax the rcu_assign_pointer() assignment of =
mm->futex_phash in futex_mm_init()")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/futex.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 168ffd5996b48..005b040c4791b 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -88,14 +88,7 @@ void futex_hash_free(struct mm_struct *mm);
=20
 static inline void futex_mm_init(struct mm_struct *mm)
 {
-	/*
-	 * No need for rcu_assign_pointer() here, as we can rely on
-	 * tasklist_lock write-ordering in copy_process(), before
-	 * the task's MM becomes visible and the ->futex_phash
-	 * becomes externally observable:
-	 */
-	mm->futex_phash =3D NULL;
-
+	RCU_INIT_POINTER(mm->futex_phash, NULL);
 	mutex_init(&mm->futex_hash_lock);
 }
=20
--=20
2.49.0

