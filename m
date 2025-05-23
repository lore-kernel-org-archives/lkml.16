Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16528294A11
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007650; cv=none; b=juCJeWC6IizrcQx2qKkKTEHjgzVIWBzPglNTmmB+mAEXSW0gej2fABo/8DlVqj7jwLWjZtDIu0GF6h/WCPxkilYgA3Y1b+xnHzVJwEP8utVRxBgXCNVd9YFnRKBmYcwJ8KWSaLM7Dl/xlnfmTwLPJFObxopNdF18ETuZEpRh21w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007650; c=relaxed/simple;
	bh=nIpXaKo7UoYnucf3GuIfuZxsHV/DZVUWbfnVOjaAP7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhOgHnTtFk7DXZ2rYfmw2hSvtOxwOrzwHmqC7f3bbLJYvVqKUhc9/5Gs4w/1ZQ0P/0PRZPH7VGIdovREvfhyN8P3U0BzEKiFfde12/rqmmXBmzzLoioZ/a4Dib74oFqnOofIfxfiaxmrEmlWyIH+qwH6BD4hSzSR0xz7Eu8xb3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pbzUhY/k; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pbzUhY/k"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549b116321aso11081553e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007647; x=1748612447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRfyxZvH5+TpkOAftwgj9mo3UBVnLXBhqh8LLeaEC0o=;
        b=pbzUhY/kYRwEbbmAU2uxDtfT3SxQlZ8CYpJ0LU2P4+6dV+AUAjCVBOlWb2ONZoBopf
         TEhUQtkm0QixzG/L73rwY7sWHnb2tiUY9SUCXiw54ek6A2ZzfD1vAK6kae0nVZnAZXFR
         kCJZfTDR5bdQHNBtt08HsDIESR4nHeAE37VKZ/WDvljFp3O1hCDWgxYSOzComsBakjhN
         vFOmXvRX7UQO2TCfnxyPIhIsTrjAUin+IzBVt1kBXGXknVqzD9xq/FBcyOQ3CV0rXec4
         KkO0GQsV8jSLCj8xZOJMXFWTUP9HvdasV4tM2PdVdeQPKaja4LLKOw0wfFethws15q1d
         7TYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007647; x=1748612447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRfyxZvH5+TpkOAftwgj9mo3UBVnLXBhqh8LLeaEC0o=;
        b=Ai3Khl2jiYUDbEjPyexRFqMk8WYrXU9GrzyUzHHK83NeseeirygFPHR1Kw/J3kpkE7
         ZwUp7kt7n64WD8IIKpOS1xhZyUwiuUo7IOzK+2AzuZp+zE8XzDTgWvV9B9FliOb2I4ga
         GP71Ap6dSYzVOxqd88qSDgTtCQYjwFKpFa6EJCCZ7LBvMCz/rOfvN4i5W2++fO+Pg1vi
         OljnNHYXzwn7pgA6JUcvm7OHY7o9Eod7pQVCtgEVIt13/cwvg9MaFSfDN3iQlx/AJBEM
         Odu6nXuQ7sh+45WBRRJxR6GX6LaLbSB/SBcjbPUY5Z5JoRKh1BVvangeNixxRnvirmiq
         fWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1gqZ5Zb+J/bSbhVvYhLDQtfxfVokfCAKmPmT57dAdzMKPMV8imiMxgS1k9gSYW7rcBig3XkkqjHpXINw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcf+XJizOBeri/Nu5yOfFYtOjSWNExuAUZS5jKE7HgCURdOSoC
	KjRW/fuTwoIN1jnm+HLiKkuZs/dI4yqR4X/T/KRrabDuR/YdFZ5kvVj84QW07My1vU4=
X-Gm-Gg: ASbGncs1ckoWOOErva2cqBpuvkhg6xjunfjSfgvWL/9NH6B9C32siK1WS+Rb5EP+5hP
	pu+NRrT9nnch3Sl1+/FRtLufk4VH9EbUxExFsB3anGHb/fIfjPVP2aDXHHN3CUEuoLe+gFIA3wB
	wqrcjoPGgmU+sRFl5GfcIjrM7ArB6Gn4+BNG0Pvvs2moCiuzwCED0IpOFZqi6Rug/06OBbQbWvT
	RcJiOfuatjRR7bydwD1YOdA6oPbp+HBaigQLUsIU+1Xa4WiX9s4JJiNJEovudDoZIjlqv3deHV/
	dhAiCO3PYXQ1+IKKSfwMwgyI2lboBWdrNg+YkXavV3rZ3htgjX1f2t/VAfU8xxgfAnhTf5jK8sS
	FfD5p3AX3hGxsPXJTARaVTT+4fQ==
X-Google-Smtp-Source: AGHT+IEQ3+x5BM2uDN34zUdzxKW6ya4/VolG4ReWBxvxjZOXbRaDh6MY+jvSlnL1g35O0Meqr3/ZCA==
X-Received: by 2002:a05:6512:22c4:b0:551:fd90:e4a9 with SMTP id 2adb3069b0e04-551fd90e544mr4364920e87.44.1748007647110;
        Fri, 23 May 2025 06:40:47 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:46 -0700 (PDT)
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
Subject: [PATCH v2 05/21] pmdomain: core: Prepare to add the common ->sync_state() support
Date: Fri, 23 May 2025 15:40:02 +0200
Message-ID: <20250523134025.75130-6-ulf.hansson@linaro.org>
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

Before we can implement the common ->sync_state() support in genpd, we need
to allow a few specific genpd providers to opt out from the new behaviour.

Let's introduce GENPD_FLAG_NO_SYNC_STATE as a new genpd config option, to
allow providers to opt out.

Suggested-by: Saravana Kannan <saravanak@google.com>
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

