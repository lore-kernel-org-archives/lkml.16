Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D1222FDE4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752936; cv=none; b=YEX+B1hmePm+j9bqL5mJMGGM7vKd4TsFOoTE9D0xUs13LMPi46eZuzRgskNfFalysmavhgom7wg98Zj4pgrpSJUoG6EMGIWo+agumWz2JVgNUdKHmrsCrzb8+MDHdaOedI/ScuAqV081+Tb4V5Vt5HMdXlxpgNUpjg9LoI4oUqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752936; c=relaxed/simple;
	bh=RjbpogFdLJcDSkanyWGj//f3T4IMG/BU7mqOSbY3vv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HbRIlurwuaiIz2BB41rkVxNIIx6AvSVqryWJF70ICRdSUOcNzyFP2H4ibFQ/5PBDZJs5dv0/C8x5kuEfveRSZphqR9RQYyPtdUeV/hDxdqVDOsr0yOWvWF3B1YvKp5bXgP39sVQqeBCGdjJOEBkF4DXkTKZZ3ttHzYrKMnrT7VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ey8B1fCY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=94XhC32K; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ey8B1fCY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="94XhC32K"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8hv9YQ69TGHywnjbhjpwX6eQKc6GKMw1j4P26Rj4nJE=;
	b=ey8B1fCY/ghNU9Z+JpeW9nw/H1dpo7ecz0oNFXGM5hiHrQU8rSEWMORSV1OK6te/WL7/fK
	EwLW2IRXAQ1aAANz9St8h1ItIC26jJ8Hs/X0tm+VS86i2Cq07xOLbh644RRweAyCOCRBNc
	vbaa7gRqcQsY6M+cYnTCabTpe/QooAF2JVAXEp284qiZww+xnhForh7p+wa6MmyglhEyQa
	9ML6/1DK7J4Wyc5yCVOTN1VNcObBkwHqOn6BIg7kotzLxp1q9YDkKyNVwwrBefmqMXVlxd
	2TqHI9oh45kNmIFpUo+/Ikvg5bkzBfp+bVMdrr46fRAR3TnFRiX6/ymMlcrYwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8hv9YQ69TGHywnjbhjpwX6eQKc6GKMw1j4P26Rj4nJE=;
	b=94XhC32KX5SRn+rLKpnzb2va8UoaThnoyg8P+gDq//4jmlueKZLObqbt4tFvkmsB1h0jJ4
	7OKQMeTBy7S4VMDg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH v2 06/12] wifi: rt2x00: Switch to use hrtimer_update_function()
Date: Wed,  5 Feb 2025 11:55:15 +0100
Message-Id: <82dcc0eae40bb84e6452f242751c0650e79bd87e.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The field 'function' of struct hrtimer should not be changed directly, as
the write is lockless and a concurrent timer expiry might end up using the
wrong function pointer.

Switch to use hrtimer_update_function() which also performs runtime checks
that it is safe to modify the callback.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Kalle Valo <kvalo@kernel.org>
---
 drivers/net/wireless/ralink/rt2x00/rt2800mmio.c | 2 +-
 drivers/net/wireless/ralink/rt2x00/rt2800usb.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800mmio.c b/drivers/net/=
wireless/ralink/rt2x00/rt2800mmio.c
index 5323acff962a..45775ecdf221 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800mmio.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800mmio.c
@@ -842,7 +842,7 @@ int rt2800mmio_probe_hw(struct rt2x00_dev *rt2x00dev)
 	/*
 	 * Set txstatus timer function.
 	 */
-	rt2x00dev->txstatus_timer.function =3D rt2800mmio_tx_sta_fifo_timeout;
+	hrtimer_update_function(&rt2x00dev->txstatus_timer, rt2800mmio_tx_sta_fif=
o_timeout);
=20
 	/*
 	 * Overwrite TX done handler
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c b/drivers/net/w=
ireless/ralink/rt2x00/rt2800usb.c
index 160bef79acdb..b51a23300ba2 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
@@ -618,7 +618,7 @@ static int rt2800usb_probe_hw(struct rt2x00_dev *rt2x00=
dev)
 	/*
 	 * Set txstatus timer function.
 	 */
-	rt2x00dev->txstatus_timer.function =3D rt2800usb_tx_sta_fifo_timeout;
+	hrtimer_update_function(&rt2x00dev->txstatus_timer, rt2800usb_tx_sta_fifo=
_timeout);
=20
 	/*
 	 * Overwrite TX done handler
--=20
2.39.5

