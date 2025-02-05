Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFDA239798
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752429; cv=none; b=hIcUTWsL0ntXBbsv/hWPboJZTPJK5TyHQp+DlrDRb+vDrt9gdsm4H/fPMLQ+ZcgwaQwv7W2/nJMMDuecxD2YoCMdt33EtreqsvB8c6aqPTSe/kvhG/49nCNW9GV40in5dbgINEhzo7QLESpvEoIKq8qazltDkEvdiR/d0qXFRoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752429; c=relaxed/simple;
	bh=9zM2C6xZPGSLiSw2QFSJSphWHeaGXfpPgNKEDtSDzjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QO2FqdMv+Yxj2UgkmFeJFMQoy1Ws8lED5Mzirg6kCBQqz3jqx7J48svdMEjKwAgsRfCk0fF8kERwl439G/L/dG5HOlGt6cgzwpqjGMF/XCw2+DBKYzdxaA+1+AkoG/DydLZjxXPP5/bSjFDjCRZKUXQQ59hhXaTlbh+iW3xZkCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yC555jeT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m+e7F/54; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yC555jeT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m+e7F/54"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45xl/SuxcoeLf1NcYGJifWlrlihb7uGWBnfBuBMK0/0=;
	b=yC555jeTOFqhzRw1MkuIg44+IZ1OU2nnphWbReD/RjltKTN+mT/zQHIucifGCvvtqagVMp
	yqi620kcUJ5obNKoRAwArRMqq3GcvaML7cnfS6SKMw4/U85J8tSQWnjEaa/ND/OtFVh04o
	Y92q+bdFMaRQGlg1sx/1KgV7o1EdX3RauDXvD90xh7HIyVwMySvguv5LdmKgmdrPB5conT
	xpLf8JECiy+U/SzddS4+0s1aS+y5z5JNX3DzhkEpJ9lgWWoyiPi5VU4LtFJdY5ga5EFceG
	iuzq5YbEgrrHDesFAeqyWKYZSbQN/RcIliZGXj4dRc5ACcoWR0hF6reEY9t38A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45xl/SuxcoeLf1NcYGJifWlrlihb7uGWBnfBuBMK0/0=;
	b=m+e7F/54WWPZ04kVNDDtHoJ/icd0SGf1XMlyIyUUnWV2L7KW2xae71ljX3rmUA0oF20OUk
	mFNtdMRMsJ0uzCAg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH v2 38/45] drm/vkms: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:26 +0100
Message-Id: <866841803c850c38819f98fdf6bd992ee4a4d012.1738746904.git.namcao@linutronix.de>
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_c=
rtc.c
index 28a57ae109fc..ae4e36bc337c 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -64,8 +64,8 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
 	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
 	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
=20
-	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	out->vblank_hrtimer.function =3D &vkms_vblank_simulate;
+	hrtimer_setup(&out->vblank_hrtimer, &vkms_vblank_simulate, CLOCK_MONOTONI=
C,
+		      HRTIMER_MODE_REL);
 	out->period_ns =3D ktime_set(0, vblank->framedur_ns);
 	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
=20
--=20
2.39.5

