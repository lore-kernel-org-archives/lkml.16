Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6954C237160;
	Thu,  6 Feb 2025 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859530; cv=none; b=nH4V1avQ94gGrlS7E01QPnXeaEmSM0fFw9YRmKDguWNE4ccZCTbQ7LHM+sFzGAYk5WGmAX5rHqE3TTDna1l50xhXPZEbDV7hcOn/8CLm8E02EtsBp8B8CXvAaIwomdxPp3c8+0mIEeqgPKuHKEEDFW4Nu6LEXgS7gD+M0yNv6G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859530; c=relaxed/simple;
	bh=lhQV2/JMW1AkbLks3umhznWpg1q4gVu6bOLnCLOQKi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VkyJI1HcnuGoJ9jgEPuwtyAJ8r9Ph59ThXn896XMB0tkZ0Su2Q7Mh77YTiLGda8sPwR0W1QLxrOZhb4iAB49sCWFHoC03B4tKmf0udywj1GAGSHTkrodmb4anDKoNodcDsIySDPPce4yh7R2AP8HebqcU4xeseOGt2EIg8Mf2Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=X1mhyIuL; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="X1mhyIuL"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 259791FA56;
	Thu,  6 Feb 2025 17:32:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1738859526;
	bh=L0b6acJdik/QAxiLmq+G12oEkv9eJnz396x6SD0cU64=; h=From:To:Subject;
	b=X1mhyIuLnpyn1Iw+GA1N2NebnBa6UFgFOittcnVn/SRCsmssfA89mG23C0INViSmC
	 GwGqoMDkoQRKu+b/nJi+vlq6dlz0PZSPbIXGfEFitSRB8SEZKz4euoZ9Pvvp6MDyEj
	 128IRoEcUD9IYYjWoUZWjdshIir0wYXAJLgnWwKHOLWr2BKJA78wbw4DnWjOkh5WMR
	 yBZkGkHyxRB+9tzEj2Wf7kugrTGXKv60BlPGq1B6E+DqQJ9iNKSmnbxrOIrcr+fFns
	 SrjqKbPcobgkB5n8mV296U+cl1wI0X6GpmJQkjXRMKQxykoAC5iVR0QzChg3y60pk9
	 GOxTlvm1xl9nQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 2/5] ASoC: wm8904: Don't touch GPIO configs set to 0xFFFF
Date: Thu,  6 Feb 2025 17:31:49 +0100
Message-Id: <20250206163152.423199-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206163152.423199-1-francesco@dolcini.it>
References: <20250206163152.423199-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

When updating the GPIO registers, do nothing for all fields of gpio_cfg
that are "0xFFFF".

This "do nothing" flag used to be 0 to easily check whether the gpio_cfg
field was actually set inside pdata or left empty (default).

However, 0 is a valid configuration for these registers, while 0xFFFF is
not.

With this change, users can explicitly set them to 0. Not setting
gpio_cfg in the platform data will now lead to setting all GPIO
registers to 0 instead of leaving them unset.

No one is using this platform data with this codec.

The change gets the driver ready to properly set gpio_cfg from the DT.

Datasheet: https://statics.cirrus.com/pubs/proDatasheet/WM8904_Rev4.1.pdf
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 sound/soc/codecs/wm8904.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index aef82532f8cf..2082ff12d336 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2270,7 +2270,8 @@ static int wm8904_i2c_probe(struct i2c_client *i2c)
 	/* Apply configuration from the platform data. */
 	if (wm8904->pdata) {
 		for (i = 0; i < WM8904_GPIO_REGS; i++) {
-			if (!wm8904->pdata->gpio_cfg[i])
+			/* 0xFFFF in this config means "don't touch" */
+			if (wm8904->pdata->gpio_cfg[i] == 0xffff)
 				continue;
 
 			regmap_update_bits(wm8904->regmap,
-- 
2.39.5

