Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEE7231A38
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752422; cv=none; b=N5EETOld1S1dPKRc8RGHB5FILqPlOEgtvFI0HtNlPULXe55RfAWEySZ3ps2xZ9A5I1T2PVCV2kOSGyu4dUkbRow5qQz2Ooscl92H2Gib3AVgKPZfhGUMzhp4jWGMnaU7xWLNrsm6Qb5Ie+I4UVcRIW/5/e6ALHSgrvn62TsiQhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752422; c=relaxed/simple;
	bh=Ai8PZyuGPgiQbLhdU7Z/qMB14AOJJrKXbH9GdHYkJxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MZOhmTvq6vDhYFGqFLRwh7DSXeRoLb7hPt3t1Ugwncg5jK0wIEO92GM9bF6VP1llyxIFS7RfUIRNL+wc03paJbYQvxiXja8KmAtvocwhTOVujPtNG47U5/xoUm7cXj1x52c6CcCEJR2Y3gHI4/OYatnOhIoi5mnYKvxSCJ2fe18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=glgUyYBF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ka/v10IX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="glgUyYBF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ka/v10IX"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UryDSTk/Jx5CqmMF2OX2pVFqILgCEUHxVNrRXznvA2I=;
	b=glgUyYBFSqrMudZ2pKCvBQBmTVGWwhHdpXV6dILiCtu6A7UCDs/9OhLOrJqHsQUh0F6XzV
	lOh7dd9mLdWCjYe4Q3WoVSAoubvsVXDePCyyV0SAit7ZsWV+L8lpHIAPlInzPCMFOFl1Sk
	ykmdV/EC+4r6fxKwrm64yNcyB3k6kL/fI3GzupAGhkzsOJPFBqjAndP+435E3MU9zaZAIL
	LlEvP0ExYS1CAH4FqDPgn+Ika7pN1EbnRajYDxaxqLGR0RkmvQYAxnSuVdenzqfYFBSw+o
	UtXBGFF2kCMtcm4XT6eyl3rvF+gKoaOd/rtQChmUCliRHp40H9MP9ozrbpxT6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UryDSTk/Jx5CqmMF2OX2pVFqILgCEUHxVNrRXznvA2I=;
	b=ka/v10IXxkAVCWK07TguFytCXDLIl2nx1FdbFvpxGaDGwtOtvOvxRnrHHki5wxo/D00IPU
	GS6OzT71kDhg/eDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 15/45] pps: generators: pps_gen_parport: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:03 +0100
Message-Id: <4bf3bb22e21f27c58bb28690d856df913431e693.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
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

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/pps/generators/pps_gen_parport.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pps/generators/pps_gen_parport.c b/drivers/pps/generat=
ors/pps_gen_parport.c
index d46eed159495..f5eeb4dd01ad 100644
--- a/drivers/pps/generators/pps_gen_parport.c
+++ b/drivers/pps/generators/pps_gen_parport.c
@@ -208,8 +208,7 @@ static void parport_attach(struct parport *port)
=20
 	calibrate_port(&device);
=20
-	hrtimer_init(&device.timer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
-	device.timer.function =3D hrtimer_event;
+	hrtimer_setup(&device.timer, hrtimer_event, CLOCK_REALTIME, HRTIMER_MODE_=
ABS);
 	hrtimer_start(&device.timer, next_intr_time(&device), HRTIMER_MODE_ABS);
=20
 	return;
--=20
2.39.5

