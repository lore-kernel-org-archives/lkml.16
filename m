Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB43C1F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007657; cv=none; b=XL91EbOuP0ZnSv5Tl6lTdrRE/X4+G8IISgt8/3XAjtGvf4VimjpEA8giVl+iO7AM7vmy7kIOSkEdzuhaa6+xBljOS8Ixqh/m40rkGOVejiPLQ8zb9vbzrDSOLKYAAjXC1uUq3D5w7xq5Q6Z88WTK02ak9w0wBbk6Tz41Z3Y5nKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007657; c=relaxed/simple;
	bh=eQFb13pt3SMV+zjHPOqe2QvR/SdOjsFXtEEtguGWM4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nN+Fns8JK6b2v8w8CtZx0TGbdRyunP2tS+KIbFSalHDCaUNxzEUuvsAxTzxwa1e+xHIPOnSr3dZg0bO2y5hWRVZImpy5gJUzkldpvmDLfPUNGtsDl8i38mfsu9LPc4fe5OD7CDefg64MYh+ORWCiDC25+TM/FLsvkGlOiU821MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vcySSXDa; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vcySSXDa"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so5353253e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007654; x=1748612454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFJTs6Oe3tZDiqGEPhPZQpV8g2gqNJNZcx49AsG9G/8=;
        b=vcySSXDaEmyKLQNROiOx3LAt3/1GNq2ZFNmXBzxpqKjIfgJsR5X6CwRNO9ihMLUYET
         5PnEyQz5vRKUgHUBSfPSCahbh5xDMRvnGziVVZaGisT3z6M3r7QUmvel7WMxBBp+eX2J
         LBZqTLawK4mv55uOu1JLiiKz1q8ri6MRaQQdgUkEzTQxdWQjzrO97SNRHRnpYdy2d8ZG
         h+TEXhZKOwYMTXUe+blLQ44RgaGqFL1o3G1wX6qjWsD2C89j+22O+gdZfvlsY6L1nR0b
         Y8bPTZYgdy4e4QXUEHK/K0XaFj+Ur5wh2qw+c2IzbMzdT3QMIwj+XiC30n30LxdJnNAn
         LozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007654; x=1748612454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFJTs6Oe3tZDiqGEPhPZQpV8g2gqNJNZcx49AsG9G/8=;
        b=W7gqSioPKIcM9odfsbKfzTB6vjvaPvonCT42eJtveNADGjhLxreD3zgCclx8dn6SCO
         z0ZGEPt+J8ckprOkF/DQt5Efbzo1T7J3/W5iiXLL97yvXr5zTSvQ/n4onCK56Eqi5SyK
         PylU+Xns4iFxhA2UEcjMGE0YvTOkITCoxkSgrSCXowSu/+RF4ExOXu9Elp4SI4t/k48U
         j/FJ8Xmd3yuYTg/YeRDJqBFF+VphKJSmFrmWAw9kphivpHVuwOVN9OYta/3wsClzFRPg
         aYdfMwwVOyTxm3v9WU+j4fV8WHXsUNI00fQxGrkhzFp8o9A1P3rEnWf+kwoPLDGLFQ12
         rUtg==
X-Forwarded-Encrypted: i=1; AJvYcCVmGyHTdqQRDcHjiZ+b/guyAYU0Zx8Kgux598+ZfveJ9fZUUdZ/jl1PKdrAhvjVL6GMDGwwQvAgLT9+ksM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ly71FY+4JPdfvNM2Y1RfwDFPmezPNxhr118gTWfXaJDsH5iO
	uhiDDi8ZuCAq3YBlieX8F1Y3L9uywiDLkRc0ow43d1wtzpo3PX9ivX1izM5bCfs7ioE=
X-Gm-Gg: ASbGncsdre08qD3Sg2lKGPgx3a+tg30Jb9MrdaTTZg5OIH7G5HCWveYmDT3OJm7Q0Q9
	P8o1vEL+zw/wOA/Yy+RjYOIz2MSvgEmQxPKrdgnd77tjAhIdNE9bGsnTO21Hh98N5sNT4RMzqeI
	uuL402Vc6D5occrHGRXSy4OxBoxVIh1Tm7fs/lH5ya56PZnR40YTBoOf+asbSY8I+Jqw52pT8Rr
	hu81ufI4ZRpYj40YKRBxgT3fWYIupV0YCW9kiYEQ04zriYHnIsqqUz5gnDzVe37tFvg/kkwpd2C
	NbtjnWnlkvOZnjtaQEy1e5msO7VpNSDBjNfGKBP/TpWu6tTAYphc6nb/ZS+B1OICmT3YQRilJu+
	4DhBrSbKm1YuPvp2VKG/gfIgY9g==
X-Google-Smtp-Source: AGHT+IG9T3c3b5OoxUcS87R1wLRRFL3PdXpvlFYoXNj4F4WD4Ace3E+S/nh+np/agz5oYIx0/z8iEg==
X-Received: by 2002:a05:6512:6802:b0:549:5850:f275 with SMTP id 2adb3069b0e04-550e990904dmr8181500e87.50.1748007653840;
        Fri, 23 May 2025 06:40:53 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:53 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/21] pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
Date: Fri, 23 May 2025 15:40:06 +0200
Message-ID: <20250523134025.75130-10-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make sure genpd tries to power off unused PM domains, let's call
of_genpd_sync_state() from our own ->sync_state() callback.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/qcom/rpmpd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 0be6b3026e3a..833c46944600 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -1144,6 +1144,8 @@ static void rpmpd_sync_state(struct device *dev)
 	unsigned int i;
 	int ret;
 
+	of_genpd_sync_state(dev->of_node);
+
 	mutex_lock(&rpmpd_lock);
 	for (i = 0; i < desc->num_pds; i++) {
 		pd = rpmpds[i];
-- 
2.43.0

