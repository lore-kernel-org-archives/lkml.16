Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB01C1F930;
	Tue,  1 Apr 2025 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513238; cv=none; b=cR6VZdRcdYV0ql8BaQJ/NBN7mH6/PypPlMGL3VgmR4Lwu3oSIVY/p/8ofinb2L0Jj9KlC9SLVbozh2CL3jLdjwLbYl/B2TkXx849d3zNSWNk+2ALbp6HQXCm7C5lUgjKyZ6lscRs+0KFdWLFCOlN46ITaXSR9Jgmf2IGWNg7wlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513238; c=relaxed/simple;
	bh=z8FvCNfBRSi0anI3Mk0VEDYYfjUntBKUZOpJN+SLQho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CDsXJJBOL6nsRZOAjfEP8HiUPoxhvGRKAjBIj6OihiGtUbmwtqtHbnXanb+xCFzzsYV18VyKidN5Yerz7bvWNtnexDaq36gN9pcimtI48OX8bB5w37psDDX2AvHI0U0CUn3hWbWh7cJMJWguBssiK6RI+f9Tr/4JrCIWrUbMC14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MceWsubF; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MceWsubF"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-301493f461eso7020770a91.3;
        Tue, 01 Apr 2025 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743513236; x=1744118036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hN43jU2cigGomptXVpZuFKdPSSqT2jJZ8QNbL+jK+SI=;
        b=MceWsubFvB5VpQb5aEaJ+v+gMvItr+ei8bBeE+dWtW9XcaZqrwa0HjnOUHwxeZRmCZ
         FbyPO+x2rwkWZsiHqh0eLRJbHamy7tKRd4kZnWQhBMoOdl9Q52sUStmhPhrzrJbzAxCW
         w82rJnKVMAO+viMuXsOKNxteWC7AIVld4PiECc0aLE7XjGP+JKpT52TebkPgRvY3FoZp
         gcpeRrBNUuRAqCtQMNqLLyeA+HrGNSY76eNS17eDqWHdtdxBFv3wNOoYnouqpkirM4YJ
         KjVkGXuNKhLCSEGLC3go0sBSmzqicbg5EV54kPOMzPUoIjDKsnOK/aCam2W24FoYWCtA
         O5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513236; x=1744118036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hN43jU2cigGomptXVpZuFKdPSSqT2jJZ8QNbL+jK+SI=;
        b=aOk7jo/7R2EF+lJnqadY2ySntPPnZcuCtGGwjPdT1n10PdouKXaiBKwSYphC8E/iES
         3qzglUUz2sLp9BokhqJeUjIBFYOGp0tS9B3xp7a0p0DwArrjC9oU6V9NCOmcTqT6csHE
         7sUCw9p68Qf2e2NzjXiEexixx2aDHFdN74T8S0xpHhknsmJLJNivkcI2DfcIncK0PcPT
         2MjpjQow+A5Kkc89xojFJ7FVHhHbXcqElT1fJmRHvZX5AeUmLcRJPk4skd9t/saSxXUz
         Kvq3NGjnc2EPIlBt1YLL5Yys9JdXVC2mWQDRjuUsKFg2MXON5IG6+he58tZ2yKpRSJuL
         hakA==
X-Forwarded-Encrypted: i=1; AJvYcCXFi2qadiZWfzm1s/eqw7uA9x0ss5WbvWRmjeJ96dCkrl8lZhzghk0lWbkvb+BdHCOP70aHH8SrQcuqsZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAjZuZja/RNeRiiluPCE9EArJPJryx2BeBIqgPlnMrPqwTIll
	SDOUTH7zsaLzF6rATmFBRH0zI1McEAVWsSkjRO/wyNIYjoabI6vu
X-Gm-Gg: ASbGncskdySUvtKD9/GaX4njTKbQDsnnd/CXtPnJIF0ZdYt0AT+MqHLNslOFIT/It0A
	c8YkzQC1dEQObRbqWJCJULsM0nrNDlVXoBS55oHjPBxXh7J9+exTLkqreVOUykXwh7ifBz7PbJq
	pC1zXHSTaEhUwXMCeCqwLv8gS4PXpkNMsA3PAgDidXrZ374laaHWVcFAy/nU28GygxZhPixpmVl
	8mRUn+XlMY3nGjN2cWNFJrxvCpW2/tNvsyRt76gDHdwDpsKCtLOdJUJCKwRirI7UgTSGhcTT2NT
	+s+LR9X+1jjjXay72ysbb558sT2Y/B+gedfUjcl3IIoCaz1q1UOlyjw5OPgKk1k1Qzbeko0=
X-Google-Smtp-Source: AGHT+IEGhMi+zmEw7LYCj3F1ntrapghvGc9FLMIpFKbXOLcAou3DMg6uG4K8U2MIoipBkajfy/0tGA==
X-Received: by 2002:a17:90b:51cb:b0:305:2d28:e435 with SMTP id 98e67ed59e1d1-30531f7c7dbmr23945370a91.7.1743513235968;
        Tue, 01 Apr 2025 06:13:55 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d3e049sm10190615a91.6.2025.04.01.06.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:13:55 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: david@lechnology.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] clk: davinci: Add NULL check in davinci_lpsc_clk_register()
Date: Tue,  1 Apr 2025 21:13:41 +0800
Message-Id: <20250401131341.26800-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
davinci_lpsc_clk_register() does not check for this case, which results
in a NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue and ensuring
no resources are left allocated.

Fixes: c6ed4d734bc7 ("clk: davinci: New driver for davinci PSC clocks")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/clk/davinci/psc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/davinci/psc.c b/drivers/clk/davinci/psc.c
index b48322176c21..f3ee9397bb0c 100644
--- a/drivers/clk/davinci/psc.c
+++ b/drivers/clk/davinci/psc.c
@@ -277,6 +277,11 @@ davinci_lpsc_clk_register(struct device *dev, const char *name,
 
 	lpsc->pm_domain.name = devm_kasprintf(dev, GFP_KERNEL, "%s: %s",
 					      best_dev_name(dev), name);
+	if (!lpsc->pm_domain.name) {
+		clk_hw_unregister(&lpsc->hw);
+		kfree(lpsc);
+		return ERR_PTR(-ENOMEM);
+	}
 	lpsc->pm_domain.attach_dev = davinci_psc_genpd_attach_dev;
 	lpsc->pm_domain.detach_dev = davinci_psc_genpd_detach_dev;
 	lpsc->pm_domain.flags = GENPD_FLAG_PM_CLK;
-- 
2.34.1

