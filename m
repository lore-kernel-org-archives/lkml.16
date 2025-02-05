Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD6223237B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752428; cv=none; b=u7qVGee9pqphCNtshwQBa6GGpQrZzq4P5f3WxIhkY29GMeYXtuJJ1gwFPUnqBaDQDYnwoq2G3aoGnqaK09DHa1V2MC9PuKcn2ghZdX7zt49+qlKvWwqnF9EDV8Tk7QzmC48enQr58+OlGq6x2BhXb/deL15jht3f3z/AhPClXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752428; c=relaxed/simple;
	bh=wB4KZZhxcAGUFl8hG1aAQBp00DCCTwAtv3/hip2nNdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q4/D/AdT1F5ii2pL7r9k//QbpOS/76paYEWpN2NrEBho+KHs2sV2HLaiV1/l1xyUa8FW6Dw+v2oI6qF9LPyFL6/tnIr/L3am1d9bgeM7TDZGS32LdJDWPk1huU85zGilJVV2Ie8gyQ5/+uwuMqrZ4Q6ky65q8zIrtDEYcopCu3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Fj6/aebK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4my0yOh9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Fj6/aebK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4my0yOh9"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajmbXs69PsDZhtlzwk7dXfl62K8OxjcLUr12Ed9DLtg=;
	b=Fj6/aebKFCAEHWBW4D9VSqC15xAK5Bcaj1eHbAnelUJilh4c8aBrSlFhchuGs53Ucx87tx
	oQjn8hdO/N0pjYw+fqr2u0YncxCUVUA6ZFZfWJZR36a8A+pLEcYe6Yz2LpoqGjujb43e/4
	5F3Z/52ouO+SHsYQd7OPLGRFWj+QgaE87XlYyz6c1R6D++2MJTRiN0p0AecOQ2058VGEkq
	uziwZk5I4bAusr3HB2/XFLu7zaG/FTtCTT9YdNKY0D8/auEj1Tx0lnV+Y7KWUPscASCQyQ
	tagJgIADI7LL2ubOT9v086UTUFjdW6ULhCXkwqqF/G8Fu7M8PXA81u78Z+fcbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajmbXs69PsDZhtlzwk7dXfl62K8OxjcLUr12Ed9DLtg=;
	b=4my0yOh9Yn4l9AJW7618/hPvuf8juNPMWtYY/wL2e9QgFubgjNBx6egKUMUlWu/OwPp0q8
	xiydbKqY8s9IdnBA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 35/45] drm/i915/uncore: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:23 +0100
Message-Id: <1d0ad9ab31040d9c3478b77626cdb0a04c0a7bad.1738746904.git.namcao@linutronix.de>
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
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/gpu/drm/i915/intel_uncore.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/int=
el_uncore.c
index eed4937c3ff3..bdcfcae83b52 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2103,8 +2103,7 @@ static int __fw_domain_init(struct intel_uncore *unco=
re,
=20
 	d->mask =3D BIT(domain_id);
=20
-	hrtimer_init(&d->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	d->timer.function =3D intel_uncore_fw_release_timer;
+	hrtimer_setup(&d->timer, intel_uncore_fw_release_timer, CLOCK_MONOTONIC, =
HRTIMER_MODE_REL);
=20
 	uncore->fw_domains |=3D BIT(domain_id);
=20
--=20
2.39.5

