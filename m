Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E8028CF48
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552260; cv=none; b=q+QvjlnPaPAJGumRPpdRmYMF9GxJmYt47zigSSN/DEc8aPgUEkjSQGseIZ6AkE6t+qdaez/fT2/XqPdcuVHZpCl9eC2TMip/zf19Qj1cP7dB8BPB0LsVvX6bBWeKEA1T0PNMGj/iy07Np/r7uoLPEibUKL+d4zm35q7/zI6xgs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552260; c=relaxed/simple;
	bh=pzojnBlpuCAv1jCqzuN/yAm8U0WeR51Pvxgmr+qAb5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzoa4t5dmgPqBSF4jrowGqbWGXo2MZy7Xmot8Wfd0DVTmWAzCymWHlZrJfwg7SHc+r07/saH3Wv89B6n0iBJhvTGRbMJKyVen3a+vdcdqRvRaaPxPCBAEJ+eAxSd33i5QPc0wREr9F0gBDcNl1k2ypKnvM4m1jyxmahpmKBwWEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R+RLNRRR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v/RTPmpn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R+RLNRRR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v/RTPmpn"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749552252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5UkjuLkdZjeNAuyxuby1t0CBGzkSiipELf6PxaIWyQI=;
	b=R+RLNRRRtcLzCdfQ500nm5UDwD2zrLAC39DgCBVmQUgYazxzFXCpPYv4uk0mu8Nx1dcgwG
	MH9mulJTH8gNPixFsuDH1L/r2xZoU4z7FQdZjCwInTcR3c7AQdrEPGo9tOfh+Hw7Kf2bEX
	oAaZ0e2NMLxK0AB3HFqjWaxf/YdHN5r0rXJi2KMAlI6tFJg9auYAm5QiBzc9xlQ3Ck1C8U
	ap0Krg6WtkXBw2pifWmyzFMMyU/91bhvcgDWEbeQ1AORMUlPf8X2ywoeEVwbIpbsZcAtw4
	RTKuI0VTyr3qrIGLcSFeBmafIYBfjFossY/YfVQs+DP2EJMLYM82L50qczEAow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749552252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5UkjuLkdZjeNAuyxuby1t0CBGzkSiipELf6PxaIWyQI=;
	b=v/RTPmpnYAb4iwwBjsdoZYYsUHaeUlIkuU8L+ssrmhkAXxOUit29jO/jERZLlMKhmess+X
	NhpXs1hokX/ZgnBQ==
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
	"Lai, Yi" <yi1.lai@linux.intel.com>
Subject: [PATCH v2 4/4] futex: Verify under the lock if hash can be replaced
Date: Tue, 10 Jun 2025 12:44:00 +0200
Message-ID: <20250610104400.1077266-5-bigeasy@linutronix.de>
In-Reply-To: <20250610104400.1077266-1-bigeasy@linutronix.de>
References: <20250610104400.1077266-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Once the global hash is requested there is no way back to switch back to
the per-task private hash. This is checked at the begin of the function.

It is possible that two threads simultaneously request the global hash
and both pass the initial check and block later on the
mm::futex_hash_lock. In this case the first thread performs the switch
to the global hash. The second thread will also attempt to switch to the
global hash and while doing so, accessing the nonexisting slot 1 of the
struct futex_private_hash.
The same applies if the hash is made immutable: There is no reference
counting and the hash must not be replaced.

Verify under mm_struct::futex_phash that neither the global hash nor an
immutable hash in use.

Tested-by: "Lai, Yi" <yi1.lai@linux.intel.com>
Reported-by: "Lai, Yi" <yi1.lai@linux.intel.com>
Closes: https://lore.kernel.org/all/aDwDw9Aygqo6oAx+@ly-workstation/
Fixes: bd54df5ea7cad ("futex: Allow to resize the private local hash")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index b652d2f60c409..18804b2bf38e8 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1629,6 +1629,16 @@ static int futex_hash_allocate(unsigned int hash_slo=
ts, unsigned int flags)
 		mm->futex_phash_new =3D NULL;
=20
 		if (fph) {
+			if (cur && (!cur->hash_mask || cur->immutable)) {
+				/*
+				 * If two threads simultaneously request a hash which
+				 * can not be changed then the first one performs
+				 * the switch, the second one returns here.
+				 */
+				free =3D fph;
+				mm->futex_phash_new =3D new;
+				return -EBUSY;
+			}
 			if (cur && !new) {
 				/*
 				 * If we have an existing hash, but do not yet have
--=20
2.49.0

