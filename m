Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6F322DFAC
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752426; cv=none; b=FJ6p7pkmrzKIyFH+MfuTrxrlganBw2A+NXAWyksQY1GwaiHugcF1Vkyu8zvl2uWKwA0DSOjnOD0ZpxprxHJ7zwrGBHEhrjOvSDksY6aa/OzEtGfCRpWDbvDHcozAESqB+icopacEvUt9jhoQnl1VfWkdXrySLI9gAutlT+W9BxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752426; c=relaxed/simple;
	bh=VGipMjUKC6rTV8hI0Lh1OzshUjwZTXhb0xki6X/HIEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DoZRY36I5cq9x1RdURqaN/n6kQzprFGd7M2bQA2UKo+XqzXHhSWm7p34jWeSCquMXCPGlUb1ogk3RxOo72dnFb2WZljpsPYHHxTvNYZxp23K4p6lO5kkiCgCxwp0Cv87e8eZDxtg5refRuGH86Nb8Q/fK5GfMHC0Z6DrvfYPJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QLcpkSf2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WSuUHkO2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QLcpkSf2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WSuUHkO2"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gaxUOSu6PPPmpExSaLxtjLPAjrrkX8vgXWaMr9AM/Iw=;
	b=QLcpkSf2SC5moEzK6b1IAU3RyZQGsM6aldfQP9hkpgwFVqRj6nayQjEiUnMpUzBkcxjEh9
	ztEJuzk1STGFUuKz3HlwAC1zWHKQ8Vj5PRbn7MG1ldWNhdtW6cMrEnyGSTKJWDFSrQR4Lw
	qsBDFkGm8fIEMmao+TSARmlGDO0Swd6ienxgoreRWiDwa+6/YWpRNTkWGHqLaxf9kSEptN
	XW2wFNTnkizjiv9aluMkbawsr5c26HIDoGSIfNXjw0p6Mb5x9eXAcdSsKQWuur0ZuCO2+S
	H7L1+WqPAmQ3dXovTKJQ8Ri9VKS+mbt8UkYWGE84Y9euzZRoB/f79AMEtm76cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gaxUOSu6PPPmpExSaLxtjLPAjrrkX8vgXWaMr9AM/Iw=;
	b=WSuUHkO2dQnbaQouJudLA00xVf8lQv3ZOyM96APZPTzpdH+DQssvaMI83oKLE4AzuABrZA
	1R/V6TnxVXPiYbDw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v2 30/45] drm/amdgpu: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:18 +0100
Message-Id: <2e3664eebb00d3a8c786ee7cc1fba8096bababc9.1738746904.git.namcao@linutronix.de>
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
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vkms.c
index 03308261f894..7507d9443028 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -188,8 +188,8 @@ static int amdgpu_vkms_crtc_init(struct drm_device *dev=
, struct drm_crtc *crtc,
 	amdgpu_crtc->connector =3D NULL;
 	amdgpu_crtc->vsync_timer_enabled =3D AMDGPU_IRQ_STATE_DISABLE;
=20
-	hrtimer_init(&amdgpu_crtc->vblank_timer, CLOCK_MONOTONIC, HRTIMER_MODE_RE=
L);
-	amdgpu_crtc->vblank_timer.function =3D &amdgpu_vkms_vblank_simulate;
+	hrtimer_setup(&amdgpu_crtc->vblank_timer, &amdgpu_vkms_vblank_simulate, C=
LOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
 	return ret;
 }
--=20
2.39.5

