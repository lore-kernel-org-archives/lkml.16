Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86A22FDF0
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752938; cv=none; b=R9F+sUvo9oCo2IdMozmEtrVIujVLXoDHr8cO0WT/PNxSCSwUf/AJlBpDYgCd7CJqnY6izDOtBUWNS5xnQTqkOhvnwf5STYABCNs6vVNm5fm09ej+2NGwSErUtJiq6OCkUjwnPck0NE66QDGoL+OfDNO4ZIDy+zFGt/1uJpoMDxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752938; c=relaxed/simple;
	bh=y8M9/BZEn2q3Q3Jm44mRv5B/wgWP/X2uuSox1YmNweg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PNhPrxLuJs1Sn2ySebW4mZV44RrjXEiLUxfcuA+66jpwu6iMn9Wra+IZfiQZtf3O9f5X5j/+tl07XpSUT4qN/Osjjgh/pXJACnEvEY2O4es869CUG/zMzTMS5N+9Iy3wTrlEznGhMuov+H86LtIi1cTMRBB/wz/x0KTFYAEwrtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iUwNfdxj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IQtQL8qT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iUwNfdxj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IQtQL8qT"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lui8ebrqPuhrOmMORPYpepkiLJrIN9RVn8IiBGoIqeY=;
	b=iUwNfdxjW0PlMtVmTl5Bpa000apUh9SoX4ViirzQ+dpJluspikR7ol9TJgW1kyfGxD4tu5
	///86QKR4mBXWAs8Y1+uet9MGttxk/Ow3Z+zD2dmdFehwZ8zMpOlPOccQmX5MqcbiKq/5Q
	suEHVSJxSk9FxEzb4hxmvpramSqJ/RkHRV4hovA/CdUVMpPdkaQEy62WjUr7PPR2CEaQ17
	7Cqq/rDOdEgARUXUGnvzukGlzZigdwOzeTUjZCmH057ZxfNzcsb0His2kmK4MYQ9ZP7ciA
	CaJr+ArDrZ+Z6391c8ll/abo2OUFn37M4L89xP9mNim66EIzODf45lFqe/78Cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lui8ebrqPuhrOmMORPYpepkiLJrIN9RVn8IiBGoIqeY=;
	b=IQtQL8qTmHpxhusrpD8FJ4DG+IW3qKW9wdfdbQtso5/62NjOh6uwesJANo7MA41CBvgq2g
	p+ut9AlDfiV/HRBA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 08/12] hrtimers: Remove unnecessary NULL check in hrtimer_start_range_ns()
Date: Wed,  5 Feb 2025 11:55:17 +0100
Message-Id: <4661c571ee87980c340ccc318fc1a473c0c8f6bc.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The 'function' field of struct hrtimer can only be changed using
hrtimer_setup*() or hrtimer_update_function(), and both already null-check
'function'. Therefore, null-checking 'function' in hrtimer_start_range_ns()
is not necessary.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 kernel/time/hrtimer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 027a63344259..4878a2c7e4bd 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1326,8 +1326,6 @@ void hrtimer_start_range_ns(struct hrtimer *timer, kt=
ime_t tim,
 	struct hrtimer_clock_base *base;
 	unsigned long flags;
=20
-	if (WARN_ON_ONCE(!ACCESS_PRIVATE(timer, function)))
-		return;
 	/*
 	 * Check whether the HRTIMER_MODE_SOFT bit and hrtimer.is_soft
 	 * match on CONFIG_PREEMPT_RT =3D n. With PREEMPT_RT check the hard
--=20
2.39.5

