Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A37251799
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899938; cv=none; b=BRkK+4U1shqiM2pbehorRvixfV2L4WAhD0Xk87SIMISkT4S5x+SDgAZYTNOnnOXMPsXXBp2tzUIOXxerhLmoLVXlZb5h4O68NmC15O9g1tXHxBj4xWlSssetfobQmhDDZBqAAF00za+ktnwrCo4xXUXRbRF+VuYnLp/HmRTk9tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899938; c=relaxed/simple;
	bh=XlSonSv9LviP5yU3Iu5BfSf+jtHN/4GkokQYgxmFxEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJ/NJqKlJVhCN3KD7GzKQWjQcb33+T+l5yRdo3/cngkLgZSWuUC9WtdMevAZZT+UETbibinksMnS2ZUqbbrwVDtIkTs5Hj2nIQlyGktuLrdK4GghAGgrZZJo3wIX/sQc5/9ks/Bhe14vZ0MQaiFWhW8GOhWiho1YmzejzrqjhLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DLnqK4P4; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DLnqK4P4"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499d2134e8so1015023e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899934; x=1745504734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAv5QpD/3W+QIUIAEsxCNkQa5aZqJu5jR8/2XBRcQ9U=;
        b=DLnqK4P4iIAM2ihwg+U77jmEfycxjz1IL8tCwfuLx7HzSb6RPN0HBG93fz6urzaFjx
         hKDex43/Ng2fUEWpo6t4Dg7PPWSxiSRtRl2LSTlZ4IbQc7GgY4AVsBGcUh3aVQ7zd2KR
         g89k6P7XhW38H7CAYymtMj0Ggkk3ghuKt94qE/LlHP73/Km5ksSH7VRDuY5bDN4EuDFS
         rn7dC+mAm8Mr9NI6tj9BXmfmux2Wg2ExniQrDRY04A3XhgiS8Kak6I5mDx8X9Iknu3WK
         CKfBDO5+1qGf1594i/bJwlmiO6uQMsoKNwkVYs9vaQCTIdL3bdyR8Xflmt692pRWMHcu
         rLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899934; x=1745504734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAv5QpD/3W+QIUIAEsxCNkQa5aZqJu5jR8/2XBRcQ9U=;
        b=Bt0eKRWesA0kVf68avTCEn8iQ860UtFfKufy3X4vEihNDhUHeXaADTjLrBgkIZzHXU
         OEGF3TrSd8jJDTSJXUB9oq8u/ES4A9UznDf59YQ12/fzxdPz+rV4BAq8y/9ziBHWUIW6
         /79bFn36/Tp+4x82N3zEDxRaE7t7NFnDjq3K2r87J6WJgwMSaqwY4Zy/gGe1LbjazvSv
         TbcS7kvMXaXT5lQYJ3drJQLmDgx4U6/SujKbu9MthyG+kgRAyVgZSbtYztZXxVZWUuxn
         BigEwtYjBNTD2ziIXW3HvDBruWjHfpN78DCQijiT0xkTSlo1HCzVVhlgFpbHLcViLqov
         dukg==
X-Forwarded-Encrypted: i=1; AJvYcCXPiiXG68c6A1mltnpr7V2XlnfAHWUpEl5igZArNgncqkVW6PiMwlG/HU5NodA/nUnvwU+QW5q5aboOPCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzKYh8UbgC6GteA+Egih+DE6VoESsTlqcX3E/7irQMiWNask/d
	zVtF3a5PU8PZFSShwLreeRXTPKOy2zVpaRXSMh6g7mxsMeOkx4UkAyFok1SQqWs=
X-Gm-Gg: ASbGncsnfLkAfopGzaoeCsiLWx++GS8b59Kpxo70A876sbjikmy4pMHDbJHYh21V6ic
	ilXjOl9CRtEhlvJLhgbPJfBs59Uhk5/qoAtqUxht3QKu6amtpRRPzYHXLSCo0tgV1wh3OeLCk0W
	pslEZRvZdewKVWFoRkkKCM+rJy6lS+UevEEztnHrppR65e5pBsTMme4kaVAy2ScjpYNGFdQWhDi
	KLDmOYlJF6EZxIiC+35wd26PS0362CTFTjSlxvrb3hyA0fYCF3lvUYnRnjr1kqMAbDCSYqb9VZ0
	TE1dJQslimvstYICqDGBI/VzMIEVx8wWkuMuUXI0WY1HgBF6Du5zqdxwKYtVodhdnyybgzRrA9G
	Cy0v59zNgPdLTjb0=
X-Google-Smtp-Source: AGHT+IEdRb+byxDtsaF938ihBQexYxdm23PnPrnwFBeiHnuU4i+1SkPOaDcL0cyZpoToJUlNYAezMQ==
X-Received: by 2002:a05:6512:334c:b0:54d:68b7:86da with SMTP id 2adb3069b0e04-54d68b78b62mr1388539e87.42.1744899934579;
        Thu, 17 Apr 2025 07:25:34 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:33 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] pmdomain: core: Simplify return statement in genpd_power_off()
Date: Thu, 17 Apr 2025 16:25:00 +0200
Message-ID: <20250417142513.312939-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than using two if-clauses immediately after each to check for
similar reasons to prevent the power-off, let's combine them into one
if-clause to simplify the code.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 574a0de1696a..34a85bf347ad 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -917,20 +917,14 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 
 	/*
 	 * Do not try to power off the domain in the following situations:
-	 * (1) The domain is already in the "power off" state.
-	 * (2) System suspend is in progress.
+	 * The domain is already in the "power off" state.
+	 * System suspend is in progress.
+	 * The domain is configured as always on.
+	 * The domain has a subdomain being powered on.
 	 */
-	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
-		return;
-
-	/*
-	 * Abort power off for the PM domain in the following situations:
-	 * (1) The domain is configured as always on.
-	 * (2) When the domain has a subdomain being powered on.
-	 */
-	if (genpd_is_always_on(genpd) ||
-			genpd_is_rpm_always_on(genpd) ||
-			atomic_read(&genpd->sd_count) > 0)
+	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
+	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
+	    atomic_read(&genpd->sd_count) > 0)
 		return;
 
 	/*
-- 
2.43.0

