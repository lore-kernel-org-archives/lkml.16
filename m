Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F05623A56B;
	Mon, 31 Mar 2025 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432947; cv=none; b=Agc65zgrIRtTlxQEmyr2GJVgkrfwQbKvV170UaLsUhChGu1JNLmXLCJTY5QoTwYl8PrrV7RRClb3erwONi4+v4wKb1dNjY8rUTNiU4V+x0FC2F13DqxJn9CU0eqV7JkrrJ3QQ5F/pqVLmcDQ32zmIkSQX4nxgdz6ZQGKaUZK5Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432947; c=relaxed/simple;
	bh=DofeCn7+p+C7HWB7rPQvFmfiOTP/DSvjSaOvKewTANA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OC5ewDYX5WluKbHCLnzPWAtZ2H9wECEFHenZ+UHixMU429D8l/pF8g85ZXPDZ8l9snvA5MUSf4oxTUiqdt4wpjC3QgFuyVdcCMBUwIgHjqkAwT7trRRtCmNZxUs6zdwy1I5fdVlZxtjaQnPX9iN+v7mxT19Sw/Jz5u0uUnPm93w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTSaXfKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTSaXfKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962BBC4CEE4;
	Mon, 31 Mar 2025 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432946;
	bh=DofeCn7+p+C7HWB7rPQvFmfiOTP/DSvjSaOvKewTANA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pTSaXfKUYpuCUm7PbKy4/cxkFnNm8+I9fi7JRURCogsTLtKDsxI2TVEM3fJg3lJoB
	 ESeflbbcS/+/yJ+oiV0vXEiRC25spyM7LKJ6tidkpzf9IIwRURMyr1jcGHkrqrsNtJ
	 WRIqJEdGSv6J1UuXF1wosxho7l0uxqRLEr69yFnqRCPZOwgYoMiL56fFQCJS++wEO6
	 mCGcHUD7EOtr2r6TN2vsHFEH+a8+WD36v1avuQ36J0uDc7Z+Hsn1s0wVDM5jDb6RPD
	 0WYmBUdDI4GDKm+DCmwqFsXhUEb7zI+StGhkAdRrMMy1DjVlbzMzWZZtka6SZWEi06
	 f1BthIORI49BQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.12 16/23] ASoC: fsl_audmix: register card device depends on 'dais' property
Date: Mon, 31 Mar 2025 10:55:02 -0400
Message-Id: <20250331145510.1705478-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145510.1705478-1-sashal@kernel.org>
References: <20250331145510.1705478-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
Content-Transfer-Encoding: 8bit

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit 294a60e5e9830045c161181286d44ce669f88833 ]

In order to make the audmix device linked by audio graph card, make
'dais' property to be optional.

If 'dais' property exists, then register the imx-audmix card driver.
otherwise, it should be linked by audio graph card.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://patch.msgid.link/20250226100508.2352568-5-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_audmix.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 3cd9a66b70a15..7981d598ba139 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -488,11 +488,17 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 		goto err_disable_pm;
 	}
 
-	priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
-	if (IS_ERR(priv->pdev)) {
-		ret = PTR_ERR(priv->pdev);
-		dev_err(dev, "failed to register platform: %d\n", ret);
-		goto err_disable_pm;
+	/*
+	 * If dais property exist, then register the imx-audmix card driver.
+	 * otherwise, it should be linked by audio graph card.
+	 */
+	if (of_find_property(pdev->dev.of_node, "dais", NULL)) {
+		priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
+		if (IS_ERR(priv->pdev)) {
+			ret = PTR_ERR(priv->pdev);
+			dev_err(dev, "failed to register platform: %d\n", ret);
+			goto err_disable_pm;
+		}
 	}
 
 	return 0;
-- 
2.39.5

