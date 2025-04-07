Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD4205ADF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041472; cv=none; b=Te9ZoMIrxNQNu9BZUlleTh1h/2yzfauMQRMCHyw7W8ATMwjG5J4GVSI57ESrYeAworATK3JG8Fb1wUK0iQ2UfFUd2iXLK4c0cmwL2NRkea9MekomWNhytRW7ey4EyY60OX2wmHSahkw1b/CaXuamGx0x9Es+MhxVg0r7rhKeXvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041472; c=relaxed/simple;
	bh=gZDykHfMqby7gxGce8x+ayT1Qdrm+fVyGpKvFiZf75A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2v9ffjd1ClS0wJru6DXTcTYwZxQD1SfkQWIw+RENiLYcQzqXtJFL4oETyLa606ssktJ68LoiCoaMv0dmAa8XxH5xELNzuUsYHcu1uKHf6j1rcm4+XGVhJf5j0t5yQsJOFfSkhPk8m8Q5Y0kBV7a633ts8SxWeZRXnhneF3iI9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wiozWBzS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RyRDWJaa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wiozWBzS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RyRDWJaa"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jgr1wk+mD/xSNbvenCkg/mlo+/bFFKzD/3SVlMGOxc=;
	b=wiozWBzSy80XtK2Zlfshi43kqNDjncmuHrGHoIkgC68994dlZxKhFoV+Iaczmr6iBabi2c
	EQ7LAHj5Uu6OXWVd8JihOedsZj0vlwdIHlnOuozSFk0ZkrrWL1tdDLYMsk7Ee7qfmIR454
	ErLM2BybyFaGte/Ji/G2K+Ph5Cb2Ao/00T7FtGhHRFR7dK0auGaozRcSgg4h+uk0cRji4h
	Xvxrf+qkByApvxrK8FbelKJFU6pmBPFztPbyuuGPAiwnIQuENj00dLHJ4xor6wK9Kt7/NA
	2eW/Ny2ZI9IMFviGCzYRUYeVEK4CveKlNERykLigHIvopdcqvR17qHp14JqHPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jgr1wk+mD/xSNbvenCkg/mlo+/bFFKzD/3SVlMGOxc=;
	b=RyRDWJaaEgqbOFUhCwagl0EuZtF+E+f2+9eiwLGRbOJr4zNxASd7qjNDhVoFRLlqRKN3qm
	yx07313THyMfeDDA==
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
Subject: [PATCH v11 01/19] rcuref: Provide rcuref_is_dead().
Date: Mon,  7 Apr 2025 17:57:24 +0200
Message-ID: <20250407155742.968816-2-bigeasy@linutronix.de>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

rcuref_read() returns the number of references that are currently held.
If 0 is returned then it is not safe to assume that the object ca be
scheduled for deconstruction because it is marked DEAD. This happens if
the return value of rcuref_put() is ignored and assumptions are made.

If 0 is returned then the counter transitioned from 0 to RCUREF_NOREF.
If rcuref_put() did not return to the caller then the counter did not
yet transition from RCUREF_NOREF to RCUREF_DEAD. This means that there
is still a chance that the counter will transition from RCUREF_NOREF to
0 meaning it is still valid and must not be deconstructed. In this brief
window rcuref_read() will return 0.

Provide rcuref_is_dead() to determine if the counter is marked as
RCUREF_DEAD.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/rcuref.h | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/rcuref.h b/include/linux/rcuref.h
index 6322d8c1c6b42..2fb2af6d98249 100644
--- a/include/linux/rcuref.h
+++ b/include/linux/rcuref.h
@@ -30,7 +30,11 @@ static inline void rcuref_init(rcuref_t *ref, unsigned i=
nt cnt)
  * rcuref_read - Read the number of held reference counts of a rcuref
  * @ref:	Pointer to the reference count
  *
- * Return: The number of held references (0 ... N)
+ * Return: The number of held references (0 ... N). The value 0 does not
+ * indicate that it is safe to schedule the object, protected by this refe=
rence
+ * counter, for deconstruction.
+ * If you want to know if the reference counter has been marked DEAD (as
+ * signaled by rcuref_put()) please use rcuread_is_dead().
  */
 static inline unsigned int rcuref_read(rcuref_t *ref)
 {
@@ -40,6 +44,22 @@ static inline unsigned int rcuref_read(rcuref_t *ref)
 	return c >=3D RCUREF_RELEASED ? 0 : c + 1;
 }
=20
+/**
+ * rcuref_is_dead -	Check if the rcuref has been already marked dead
+ * @ref:		Pointer to the reference count
+ *
+ * Return: True if the object has been marked DEAD. This signals that a pr=
evious
+ * invocation of rcuref_put() returned true on this reference counter mean=
ing
+ * the protected object can safely be scheduled for deconstruction.
+ * Otherwise, returns false.
+ */
+static inline bool rcuref_is_dead(rcuref_t *ref)
+{
+	unsigned int c =3D atomic_read(&ref->refcnt);
+
+	return (c >=3D RCUREF_RELEASED) && (c < RCUREF_NOREF);
+}
+
 extern __must_check bool rcuref_get_slowpath(rcuref_t *ref);
=20
 /**
--=20
2.49.0

