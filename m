Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A623DE9B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752430; cv=none; b=b13EtldZ8LsegLZI48VNppkDLW+k3ORrALSTbv6RCMeSvgeDBDQsD8YqCpja9h81z83hBbPI7Ta3ZgYnMFEDUuu9BXntjULBXVMM9i/eEiP20GVr2KGWL5WhCQe4dvaZMxG4mdohrOTznNfT3Mkkc/a2S4ETrThoLyFSiEGdFTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752430; c=relaxed/simple;
	bh=iTUumdwedxLsfQz5hNa/CNRYa31SolETVCUMMjrgXwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dzMhhLkg1w2dVfo/D8gZH/ZmbRD25uo9ivD8KE7wlV56pOiTnxEh6LOiSXsExEFKWWikliCAX7BN05g1lTK3GN+CUHAhlAplAQsnd/ala+RxdohwgDmLMyj2zn79QZSx3jqCRpiJv9W/56fp8D46qGdfd7KIf1+FRc0QKrkGfMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a1dRzCpn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jg0XxbMN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a1dRzCpn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jg0XxbMN"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Dw/0AENZUqmx2lrhcOZJa2Q8uCxc6ZKmcFrmjSHguw=;
	b=a1dRzCpnEQ6+O+ztLcSrTQ9eDFf6qtzhYblrR9KMM/YasFbwWHYdMXdrGIjLVBEKMrCpHv
	BTxunqyedJg8wJ25bpbc6qGl0w4iUfggdgs8daalESji152qD1XKZegpDcVosWGrjmi65U
	8TUpfJi5eQSG0l8zB8Nswx+iCqc8U8/146nySD2vXC7NfHJWqGYIqxwbiRYXoaGS7MU2+i
	YELXW41u0GOvsW6IhqhdaeJW6mYWUNkR2O7ZmYkc5GQCeTBzx/pwrkOrKqm/9STSYceIyt
	YvkJx867P6M67SrCbV5TFQ2Q067YiIft1AI4hT/kJmXmpIHpiKeMGsV5VGSy0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Dw/0AENZUqmx2lrhcOZJa2Q8uCxc6ZKmcFrmjSHguw=;
	b=jg0XxbMNez7yWKUeBEfnhsGSF+ihEe/sspmjNYLcsv+pk/skrx3lYq/hKfyNH/PybzsoWu
	CL+d/Asx125zOkAQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 44/45] ASoC: fsl: imx-pcm-fiq: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:32 +0100
Message-Id: <ed4be9ec380a688291e3fc9b24f8c38a3f07a143.1738746904.git.namcao@linutronix.de>
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
Cc: Takashi Iwai <tiwai@suse.com>
---
 sound/soc/fsl/imx-pcm-fiq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
index 3391430e4253..83de3ae33691 100644
--- a/sound/soc/fsl/imx-pcm-fiq.c
+++ b/sound/soc/fsl/imx-pcm-fiq.c
@@ -185,8 +185,7 @@ static int snd_imx_open(struct snd_soc_component *compo=
nent,
=20
 	atomic_set(&iprtd->playing, 0);
 	atomic_set(&iprtd->capturing, 0);
-	hrtimer_init(&iprtd->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	iprtd->hrt.function =3D snd_hrtimer_callback;
+	hrtimer_setup(&iprtd->hrt, snd_hrtimer_callback, CLOCK_MONOTONIC, HRTIMER=
_MODE_REL);
=20
 	ret =3D snd_pcm_hw_constraint_integer(substream->runtime,
 			SNDRV_PCM_HW_PARAM_PERIODS);
--=20
2.39.5

