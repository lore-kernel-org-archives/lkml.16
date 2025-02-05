Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C422F38F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752249; cv=none; b=f/W0G41po5BV3Zr/1FJsUJPoIIgeXp8IQN2PfWwZYP0i4p01WhYoAqB9P1MQeTlhcDAfvr40ngE4AvTtdJZrc06H1tRfP+uEcL0TRwVFUMHQhz4WPwuHa1rXGk4r60LBhjCL8Iwv2GbEx4sE1mgksbQ6BO06FGgt8cn7ZDNtUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752249; c=relaxed/simple;
	bh=iR1UsIzOrIjG5jzbUQtXZAPUZ09YMDf89UESfQCHUqk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ramebVM+AVIWswpbAD2WO3slc0EXxbBGMJIe288lzazLIl5VckuqcM5D6573UE7IvTE4p92sfva+wpp4LP2m8Nkh4H19d3KLeKz5ZYc1HQxlczhqPmYv6QTegoxoE8PbDZWCJ4L6+S2pP4A3DeQlFmQamYnw0pgSjLmSK8Ykph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pfR4hQ6k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZYYBUc50; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pfR4hQ6k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZYYBUc50"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QF3/9S3+JV09Ieqr2eh2ZCr5yrVfRpW/vC8PTa3ZLqg=;
	b=pfR4hQ6kQkJAtanEFCgVZLDF8EPo0wgfcC4e7Fg8smVujpRij4yv6LyHd6gm3S6mVO+3RQ
	xs+nrnWcXuHyaiQi6n2ZXO8ip5HJzZEAgR264IKMFn0otJyZk2dm1etdc91bHA7MFDzW1Z
	Zl2PqKrwCdjKoMbaEK7hlhsYuJd56dRaSi3g/ymiTofjSVdDVvOXadw5dWm+cG+9EhtMMy
	CGdvTSx0sdL7nutJDA8XyLYYh2hPgZ9JB8cGdfg92ob9YjrkheIdYlQx0Ssv3S7/WGXWQH
	8sHOCbsasBhfo/Rfelf3AWAPMtByBzWhzm9aAXI85x/jWefxnvJZSXIB7z7W7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QF3/9S3+JV09Ieqr2eh2ZCr5yrVfRpW/vC8PTa3ZLqg=;
	b=ZYYBUc50xWJ2GcKsmKml8pR2/65EW+w7gFUuHEgomS1nbgbtsK3h6km8Kl46OUccilfAyc
	DISk+JuXARPSxECw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 23/24] octeontx2-pf: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:43 +0100
Message-Id: <a935bc6ca7933053f9e349578da4a8fb477b7c2d.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/ptp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/ptp.c b/drivers/net/=
ethernet/marvell/octeontx2/af/ptp.c
index bcc96eed2481..66749b3649c1 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/ptp.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/ptp.c
@@ -545,8 +545,7 @@ static int ptp_probe(struct pci_dev *pdev,
 	spin_lock_init(&ptp->ptp_lock);
 	if (cn10k_ptp_errata(ptp)) {
 		ptp->read_ptp_tstmp =3D &read_ptp_tstmp_sec_nsec;
-		hrtimer_init(&ptp->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		ptp->hrtimer.function =3D ptp_reset_thresh;
+		hrtimer_setup(&ptp->hrtimer, ptp_reset_thresh, CLOCK_MONOTONIC, HRTIMER_=
MODE_REL);
 	} else {
 		ptp->read_ptp_tstmp =3D &read_ptp_tstmp_nsec;
 	}
--=20
2.39.5

