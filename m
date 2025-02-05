Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697682397A5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752430; cv=none; b=CC6jd8A5ytn0QssMr8huaKh2mZyz0jjZrT6IBsiPgdZ7j138jI6B7QCk/xHo9NGUH3EpIwuTz9FAuekRiUvvacMlGSHGNg4i0MgeXzF80CrlwhKD+ZTjhE/pqt26DakmHylBsMn8Jo7yYP554qgB46O5YMNDV2yfa2+rbgwuuE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752430; c=relaxed/simple;
	bh=r97tosg9u90oORKl9Tzrp6Y+JgVJUkwvoycZ9acHAkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rQIw2iFo7Nl5LjzpbBXav/rdLTtjPxxpRDmKSt53wF9kk01xVsHNh4xlYYQrPd5Q/naLNHYEw85aDv0U3qrgA0hdUiPYj34BMipBndyVCgXzXLYm0rNFU0lOBlIEUMcIJatvBZQUHK5e/hlD0CID8Ak/Ox4z5wG6uZzP/960AvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A+nm/tw7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EeTCp9kr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A+nm/tw7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EeTCp9kr"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5TiNN54uhShOX0jDzC7+dFqA7KuVghX9BMG++H5/rWo=;
	b=A+nm/tw7PbQauOFjqOqmVLslHoYSPO++0+ZUyTg32Z8IIxPW91AI4KrYviaWuOfcfzR4Sn
	tYyK/0M9T/qihuYUtg9guEiFaxYXQBmKze8iRcLigFODLX6TxPrY1jh9irkbhV/gH52EY/
	wAOe90mtJpn909H+Eh5/NZHPGNPiORHuOoxo2W/uCcMS/u5N2w7hUZdKfUAg5cXfLK2jcX
	2t++zQIKEdvs3/QF7IFXiGj5i8Hr08/mI1/v/v8RvukKc3rt8itfGnXVtt/WdvT39t4Sfw
	0CyeYhreh/v9woftowzAHZej4U4zvAM48Sb2eXbNNMp6ZcJtT3uuW+V7I6SgAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5TiNN54uhShOX0jDzC7+dFqA7KuVghX9BMG++H5/rWo=;
	b=EeTCp9krMFQLSnvOY7vQ5IgTEUhKAYdTe9RYY/0Xg4nLDAovfYSkJyDh5PYpqAcl3W0nyr
	JlSEBsNz1/JTlzCQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 40/45] drm/vmwgfx: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:28 +0100
Message-Id: <6f6664cf2fea2f782e37f64a77fc9f8699794f58.1738746904.git.namcao@linutronix.de>
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

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_vkms.c
index 8651b788e98b..aec774fa4d7b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -290,8 +290,8 @@ vmw_vkms_enable_vblank(struct drm_crtc *crtc)
=20
 	drm_calc_timestamping_constants(crtc, &crtc->mode);
=20
-	hrtimer_init(&du->vkms.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	du->vkms.timer.function =3D &vmw_vkms_vblank_simulate;
+	hrtimer_setup(&du->vkms.timer, &vmw_vkms_vblank_simulate, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 	du->vkms.period_ns =3D ktime_set(0, vblank->framedur_ns);
 	hrtimer_start(&du->vkms.timer, du->vkms.period_ns, HRTIMER_MODE_REL);
=20
--=20
2.39.5

