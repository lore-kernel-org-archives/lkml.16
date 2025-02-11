Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E509260A22
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293420; cv=none; b=hVofHh6t8SXnjwUsUHXARsUIISuycjs8s3ZzS9LCzUPq6OJ1efmojZCMFMMafrDJkDPvyto9DJVb0tpgPWKJviWagYL0qZVDZu4Zf+xKZcrFYlNhZuzp8Kql6jxliBLB49zhP9zzosfIDCDYQAdNAI+8yIqqZnoU+eydH0V4Em4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293420; c=relaxed/simple;
	bh=PGCkKNeGIORgtyX9X9WjCsPh1CaDdQIdKS2PcRl06Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgTEHf4w8XbBQs4aIIvU5ZMxPw0JoNwwbXf3QRuyBU+82fqXkg7ekDkcO1QRMz+q/rQsN0UK7xG0svzFkDphXHPe9wUMsQsgDoyoc0ulzm0Fv4Qf4I2CLkIB7aicU9oeD5/KcWQb4MXZFFIyXKCqNQjdAq5DJfnYEf6BThIxWac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pKVGN85j; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3P6FSE33; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pKVGN85j";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3P6FSE33"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739293416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcC0f2OiksAuELKDPpMcmO+IliTiKpiAd+lgXybW1ks=;
	b=pKVGN85jJHN2VzxW9ynxSztyYrLD7sbQoEnna+1SU59duf8U+bbvZOx+VrzdaAE/rN2FB4
	ROGuJ+ZmW4z2EPBNKL5BOvIh2nduPo8Cqa5DeLTbMdwOmffk3hle11GDlEF1B3lUWHZEdM
	BGtv3syTv+H+yf7c3JOKPWIJJlc/tPyn1ch8aR2W/WgK6vkpYOPQASYojXwebofs9yQIM4
	20lAdmSg+shrS8jJixlioVp3o+dnGdqOT6r+UdnlrfjyyLZnnHwU0O7+9LBdXa5SLuM2Ex
	RABa8R1qCG4GAnkUwhBKAvdPeoEsaS3Z81gVMIe/tKA7w7JwRB3Tq0spZnDnyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739293416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcC0f2OiksAuELKDPpMcmO+IliTiKpiAd+lgXybW1ks=;
	b=3P6FSE3342zx7wF5JQDdyKcIZr7dPSR5iaxkw3SnN/w6/rulUDft023pGZPd7LOk21MDBa
	ahi+WGakaZ75DhDg==
Date: Tue, 11 Feb 2025 18:03:29 +0100
Subject: [PATCH 2/2] firmware: cs_dsp: Remove bounce buffer in
 cs_dsp_coeff_write_ctrl_raw()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250211-cs_dsp-gfp_dma-v1-2-afc346363832@linutronix.de>
References: <20250211-cs_dsp-gfp_dma-v1-0-afc346363832@linutronix.de>
In-Reply-To: <20250211-cs_dsp-gfp_dma-v1-0-afc346363832@linutronix.de>
To: Simon Trimmer <simont@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739293413; l=1434;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PGCkKNeGIORgtyX9X9WjCsPh1CaDdQIdKS2PcRl06Vw=;
 b=dACEsSdRMMiKzZRWtltZ9ESCWjH0fm8R8V3oITbhczvAvoyXo9uGvsnMNvSBxrSoR7BTNhqqs
 4QEHOGHELVRBCQhuDHBpJYvS3J85gJXxsNb3XULlhv70hlEQz3qFvgG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

regmap_raw_write() is not allowed to modify the input data.
With the removal of GFP_DMA from the bounce buffer it does not serve any
purpose anymore, remove it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/firmware/cirrus/cs_dsp.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 2a85c1009f10273bee3656e5f7aebe31862036b2..5f1b3e3329bc80f80f66b3dbf7c8d6eb015ddb97 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -755,7 +755,6 @@ static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
 				       unsigned int off, const void *buf, size_t len)
 {
 	struct cs_dsp *dsp = ctl->dsp;
-	void *scratch;
 	int ret;
 	unsigned int reg;
 
@@ -763,22 +762,14 @@ static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
 	if (ret)
 		return ret;
 
-	scratch = kmemdup(buf, len, GFP_KERNEL);
-	if (!scratch)
-		return -ENOMEM;
-
-	ret = regmap_raw_write(dsp->regmap, reg, scratch,
-			       len);
+	ret = regmap_raw_write(dsp->regmap, reg, buf, len);
 	if (ret) {
 		cs_dsp_err(dsp, "Failed to write %zu bytes to %x: %d\n",
 			   len, reg, ret);
-		kfree(scratch);
 		return ret;
 	}
 	cs_dsp_dbg(dsp, "Wrote %zu bytes to %x\n", len, reg);
 
-	kfree(scratch);
-
 	return 0;
 }
 

-- 
2.48.1

