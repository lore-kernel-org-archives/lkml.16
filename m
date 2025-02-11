Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E575260A25
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293420; cv=none; b=F+8J1Ja4RyLk9jO03J7g7B/PcKM2RQy1rdRZFcuN1AaCjCF0DavfGGhqVw5jgx/PD/NrwfB9PmGIwwbpXfC3cMhSM+REin3btz8NPjrwF8rtKu1uBmp88OWjCHhVNTD5sMGzhQ1Qme7CqMZdJpZV2gVGo7yeZhI04U9WarLFBFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293420; c=relaxed/simple;
	bh=20iAX+oK5zOTElTaGI6RMYw3uZUt1ZdsXFGHI9G9w70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tiysa7nEv+sBqTJyZnxmKKfuiaHq4g4WbCOUpBwUDhk9FDo/AxDkTEtOP1phO5bJWZqmT5kvs33f6g3/aeugt6rvz5MkOB5FkNSiKy0lACKla6qKGYIiwJIVzcMBDDxcIL/aNKWTZEHyV9JkmXmiouUvBL1Tx7NZUyLJXdmli90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DkG7Xhqc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BLK20MEl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DkG7Xhqc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BLK20MEl"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739293416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBOvNIfCNxb8BmKTYF9MkGIXUcMqu1QM872SxkU9GMk=;
	b=DkG7XhqcM2Q7az6VbT31GcDbaE3C974r2WRGnvaQa8+W02H2xUVQPHGN46xRN5O5f8nN6y
	oGwOkjjoeh7TwHjJCEXKox9n2cKA5fdJaD+dlq2NYoWHiWudnriC/DGVdGCiab/M1ywafd
	XlpUWWBFvwazt/NRzJLItMZN39ayLHPzmgxakPF61wDgbAlJEOHivGQpkIPhIwGBaNTAsv
	qpZZV0eqno1QCJoEbgCSASw9X8nofIKIV0luqXLaBkf2MXKyS0QiVEZkDlR9tFtJDHYA0N
	ezQJvMIdnPejSQE+1JATbZRh1+viEeLotJ8zXvme1zncHyVzIXWjlm1UHrqpJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739293416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBOvNIfCNxb8BmKTYF9MkGIXUcMqu1QM872SxkU9GMk=;
	b=BLK20MElQ/xJe5iKyZm/fStIUJaly+Rq7oBjgebS30VXxgMoSmCN2QaN5phmoMiqsVjyF8
	i3S6S+i+IjiJgjCQ==
Date: Tue, 11 Feb 2025 18:03:28 +0100
Subject: [PATCH 1/2] firmware: cs_dsp: Remove usage of GFP_DMA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250211-cs_dsp-gfp_dma-v1-1-afc346363832@linutronix.de>
References: <20250211-cs_dsp-gfp_dma-v1-0-afc346363832@linutronix.de>
In-Reply-To: <20250211-cs_dsp-gfp_dma-v1-0-afc346363832@linutronix.de>
To: Simon Trimmer <simont@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739293413; l=1575;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=20iAX+oK5zOTElTaGI6RMYw3uZUt1ZdsXFGHI9G9w70=;
 b=H+pr8NIGppaDhIFTAu//FYEYXDWmc20jsuuykoILiC+D07/1elC+QOjk6S5h3eAslAD00qJNZ
 BGdCTd5dl2uBjzCcLeJ11gwbGhWyvz0NSfRa4PG22udQ25csQ8gnj9A
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Usage of GFP_DMA should be avoided in general.
The underlying regmap implementatinon should automatically use its own
bounce buffer if necessary.
On indication is that many other callers of regmap_raw_write() and
regmap_raw_read() in cs_dsp use stack allocated buffers which also do
not obey alignment or location restrictions.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/firmware/cirrus/cs_dsp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 5365e9a4300070c42e1bc998b848e62a4e4c9d53..2a85c1009f10273bee3656e5f7aebe31862036b2 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -763,7 +763,7 @@ static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
 	if (ret)
 		return ret;
 
-	scratch = kmemdup(buf, len, GFP_KERNEL | GFP_DMA);
+	scratch = kmemdup(buf, len, GFP_KERNEL);
 	if (!scratch)
 		return -ENOMEM;
 
@@ -868,7 +868,7 @@ static int cs_dsp_coeff_read_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
 	if (ret)
 		return ret;
 
-	scratch = kmalloc(len, GFP_KERNEL | GFP_DMA);
+	scratch = kmalloc(len, GFP_KERNEL);
 	if (!scratch)
 		return -ENOMEM;
 
@@ -1731,7 +1731,7 @@ static void *cs_dsp_read_algs(struct cs_dsp *dsp, size_t n_algs,
 	/* Convert length from DSP words to bytes */
 	len *= sizeof(u32);
 
-	alg = kzalloc(len, GFP_KERNEL | GFP_DMA);
+	alg = kzalloc(len, GFP_KERNEL);
 	if (!alg)
 		return ERR_PTR(-ENOMEM);
 

-- 
2.48.1

