Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA168273D70
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370478; cv=none; b=mmLS4kjxywOkR7yNHZl9nY5gnSNHI9lEzhkAoZPM2Af1PYqRZpMlABAlZ7oo9jC8TsAFW2ItxufB3S3P6+HPZhMc5wJb5Y0Bty1kuX3WxkSiBKhihhjpLswlCmXp1OvJM8EmZqYbhuiZyURDczaRWHn6K0mkkXygolWu7LAd6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370478; c=relaxed/simple;
	bh=dJ8EsJdalLFjFwUQ3vvaJretZ0FF7C0LZXGbOwfHU6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=od44JCH1765cyPxfoBAAB0C3rY50gFCsPD8eOKUpRSGOIH/LBUq7dLGfFRzAOMhb/eawb82L5+aER7HC4LwSD1Y6+8GT3y9oKmgnYerrdr8aXctvCoGnmgbIFB00CU0gA6Ypg7eGxS8Zc8EvRkrlmw0GYzuRQ4XG+hItmEL9RXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HX5ihn36; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HX5ihn36"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553dceb345eso3764739e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370475; x=1751975275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79lLQOvWjPgr3ms40rqLbg+1wi6d2CJf/NthKCtHiEc=;
        b=HX5ihn364HYe4waWW194HK5vnXDLyAFYXEdt1VLExN1TGEockwn2tWBJAm4j5sytVY
         knEl9reJOywq5pp8rlB0aEAeOaPPyM6u/mOro1LYBfpi1oZJptGtJpfmQMu7TqxElSco
         ExnHtl8lJQV5hYE9uB0hcu7MCLtMfLHT+6hJa520Q9tqbYGHP/F8XkMAt/uYRpZnYYtN
         CshTgLyuRBuvIkkEay3czqP3bbEFLJF4gNoEHaXxj19N2WoiagbYL8MmnCVj0/s1uYdM
         eR98afQODJdtrxJLMpj/XM+nIUzPXt9fFzcCONRXuQ1bZ0o/q883Kg8yp4otcz+WrRXB
         aUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370475; x=1751975275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79lLQOvWjPgr3ms40rqLbg+1wi6d2CJf/NthKCtHiEc=;
        b=lE/CPPV2TsTo43iJwXIlRCTfW42u8NkOm5nSwDUJrhVl1mFjn5mBAtij7QOMbAYlvE
         Bfke4lJqdkHQc9olKlTRUMX3hN9lFc8/JI5Ql7sbRIacHPbczBVus/Okjhtt2+Ydccgf
         ZiTEFGrRSV6JdOaKnRMmLOKgVAlH4tjfwSeeBYKoy3EhOlowXB3k5zPw3SyDwkdkbtzW
         c7ouhMcVYrKKg+ilo6Gm3NRwM8toYo8rBIcotm+EUrmVY+yaakvaCQE1Su99Z+iJ+2rX
         OGHg1tOMXM7HeSGNZXb9ESORzA1i7Sg+Skv3aUc1DvjBdENaZmDsKpCaPEjcFlfrmWk1
         gLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWoBU7ltFn19kbABisxRV/SAmSNnN50DsMmRtKpEj3aEbsLsRusslgvo1nO9/q4vcdU0ZahKaAvFb9Lcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznx4/sx1jLF0Yz2RhbvBM1F8nxnJ4+kPy1XPxjVvdTDhE2aExs
	E+t2JTpLj38NkM8Pz58ZH0P533VwuBXAVzykJXcz6PWwFq6SKLVwmnIgEzjgzAzjoZY=
X-Gm-Gg: ASbGnctnbaDCSOWjNq0wmzfLvBCsXWIALxIIfz6uPn5vj5ak7DowaUuSawJyhIBuvhZ
	bVKO8zCPTeipOy6lA8IihPmmA1bFoBDWm+Me7iDn0mFH6X1Soi9yEWd5/HdaD3I4+eWcNTxrMKJ
	needDxKA6Z8iAxBa/NQniYP2ilMxSSvbyvvKpQJ+k2AV/da1ePTpNP7ss2UyR8W2O3KcM2T6sBM
	Z2sww4aLIF+r+11tR3cG+Hx2MqXWg6E2lYEdA6s73Ei571UCAnhVxdt+y2KJeTgcDauxIiVp+7r
	1fbM0bl+gZBu0FB8a2BkPRVMABapIKlGJfUr/ma3pHN8bKaqmoMPdqw8uCIXZCWGMCkPqQLeyEL
	1QZt5t8G18xzCBnxV9lKerLr3oZD7iBwpmtMd
X-Google-Smtp-Source: AGHT+IH4G62NAIzkTDdd4Bnq5FbST4e5sFqlJvIjwn56lcRCHhQ1EM+lmASjybjZreaBKv2h5BjCKA==
X-Received: by 2002:a05:6512:3501:b0:553:296b:a62 with SMTP id 2adb3069b0e04-5550b7e761dmr5493897e87.12.1751370474952;
        Tue, 01 Jul 2025 04:47:54 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:54 -0700 (PDT)
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
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/24] pmdomain: core: Prepare to add the common ->sync_state() support
Date: Tue,  1 Jul 2025 13:47:10 +0200
Message-ID: <20250701114733.636510-9-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before we can implement the common ->sync_state() support in genpd, we need
to allow a few specific genpd providers to opt out from the new behaviour.

Let's introduce GENPD_FLAG_NO_SYNC_STATE as a new genpd config option, to
allow providers to opt out.

Suggested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 include/linux/pm_domain.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 3578196e6626..9329554b9c4a 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -104,6 +104,11 @@ struct dev_pm_domain_list {
  * GENPD_FLAG_DEV_NAME_FW:	Instructs genpd to generate an unique device name
  *				using ida. It is used by genpd providers which
  *				get their genpd-names directly from FW.
+ *
+ * GENPD_FLAG_NO_SYNC_STATE:	The ->sync_state() support is implemented in a
+ *				genpd provider specific way, likely through a
+ *				parent device node. This flag makes genpd to
+ *				skip its internal support for this.
  */
 #define GENPD_FLAG_PM_CLK	 (1U << 0)
 #define GENPD_FLAG_IRQ_SAFE	 (1U << 1)
@@ -114,6 +119,7 @@ struct dev_pm_domain_list {
 #define GENPD_FLAG_MIN_RESIDENCY (1U << 6)
 #define GENPD_FLAG_OPP_TABLE_FW	 (1U << 7)
 #define GENPD_FLAG_DEV_NAME_FW	 (1U << 8)
+#define GENPD_FLAG_NO_SYNC_STATE (1U << 9)
 
 enum gpd_status {
 	GENPD_STATE_ON = 0,	/* PM domain is on */
-- 
2.43.0

