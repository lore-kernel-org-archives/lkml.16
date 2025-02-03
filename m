Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BA0200127
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576441; cv=none; b=PQ4mvIfv2jCuuHHp2n0CZPswcbSMJm6MhQqk9C/2WUgCQueokUj7FSYmRZLg9hFYWGSGpE+f5MwLrt7zHhl5voKWPLk+v5wz6mN9lZmTwT7bCkfbUOtkMACg5DhKtJLzeFyhX6P1t9DgrwUrTstcUMKnfk7dXtLDjeHjr4JBSdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576441; c=relaxed/simple;
	bh=ozCbctTngO50lZWfr7m8Wu4UXC9YqYbG/0hWz6Iy5mA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F39m1E5JbRbYCC8g5p8+zggCSUc4GImBUtNEiL4tIf5UMGcuCrbrBauIH9onfzVI8tUjIEvd+F6xLvBhiiookFY7uvUbKvPDw+Ze+FxDa/43laeYo2rIx2u2NcH92UJiiy0A5bf4nk6trL1AvAAux3E4S+9BxFhGx7B0B2F1pq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5gJzon+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5gJzon+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-219f8263ae0so74290915ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738576439; x=1739181239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGm/bq6SKySYHYDc9Teum4UAC1vMAmPVFWHcwcmi784=;
        b=g5gJzon+dFqn8XdsSQRGi5Wacr6DHanGZ2jgs0PrqnA55ckVn3A2/46tTdey4p4KG/
         de3q+UkL51exKTHa7TXILHcF2N8732o8iQd3abFt6LmOC9wYrtfEk7qfdY1B1Fm3NBNw
         o0zVt7AVpyzXEooCq36NcBTRlPXHkqJAKbzr9bdov0s7aNddi6ybzv/Ht2siPxZhYKJd
         GdvEhXnuGsMWaAh/Ohg3sfXmQ/BOoH4J7NA+0hwK2k8zmksCi/AQg4G53/jNDgPQRNB6
         e3IFkoovfjfIDxdvLN78y87xMEfS+8sm2w3VdUmkdet6GkWdH+OCNXOyep7XUhODIxct
         munw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738576439; x=1739181239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGm/bq6SKySYHYDc9Teum4UAC1vMAmPVFWHcwcmi784=;
        b=qqOQWu4dyW2ktZoecWbgQQcBrl2JsPH2GzCWTjzYM38THRvjdG3X4F+0gd7cQgp3+c
         UBGhOekDYtc/sIKVzwc76oOdCZvo10OFLU0oPsh8RlHdRZ8iwX2lXxp2rIIJoZW6UXfM
         ZLDlE0wK8WplPpEmx/UMk4Vn/POaU7n75X67ozfVG0Cjzg3PqlF/r6lkB9Z2/e/BFvf+
         gtd+quTGfYCsJ/6vL4NyrijIODfdaosP0zp11RbuQ8LRSF/GEX681x08GuF4AQdXcWvd
         /ZvOh4NgdO7zG9ZukJBxM38shFhox/Xnju7spXoa3zxF95BFh7sWdXp908VzBY1hbMgw
         guig==
X-Forwarded-Encrypted: i=1; AJvYcCXbIugdOv0h+I/DRkqVttjK/kf9gD18stJdTbnS0BuxZq/evD7M2t/HzsilmRSqkXhLeiv55Wcmh83wmMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZOisM64yKBVXC9Dee3x93dpSk9mxtzq/qy4lQAXnUl8AYhB3S
	agNSleBfturtprRacpuQ25h5uuOPoIW7TvO8XJTsp3g7gZV/aQmEwc692aUDtac=
X-Gm-Gg: ASbGncvnwxWZjMGh33kQQqrc2RybFFCLtCS63pQa6PeOyXMFVB2HuDXrAveNpjsU+E/
	LzGgcsK0UWfRuDHc30x8bLoMIBrW0X5BnUgDmM1F1GJtm9SpVsz3qc3GqmaLC6HtjbjPP7HrfK0
	sfycgu/KTSCN/3JvRgh8vOztN9NVabuczriZFiKUPiLnmHEKQylOCgCxGlcmRY2PV1QRctzFpIt
	KV7DPhmjesnHlRM7xeT9RSBT0Ji4mUi9xbtoWbKTzroMpMjnXMJQB9ucXKSSd77lJgNcz5wfEQz
	nUCMRAKu9tY4LPXnVg==
X-Google-Smtp-Source: AGHT+IFwo05BiIt05ICb4MDKGKrGGWOHvgZo0+KY9Q0VF4jPxeMFSPJcZ0MPvxF/KghXhf5T9qIi1A==
X-Received: by 2002:a17:903:947:b0:212:4c82:e3d4 with SMTP id d9443c01a7336-21dd7df2d2cmr345490545ad.46.1738576438710;
        Mon, 03 Feb 2025 01:53:58 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33206besm71659285ad.241.2025.02.03.01.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:53:58 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V1.1 20/33] cpufreq: powernv: Stop setting common freq attributes
Date: Mon,  3 Feb 2025 15:23:32 +0530
Message-Id: <fa304da30d5f10e7ff069d72fb3aff2741630ca4.1738576306.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <1f5393d54b2c04206afefd521ebdf3fc03004a11.1737631669.git.viresh.kumar@linaro.org>
References: <1f5393d54b2c04206afefd521ebdf3fc03004a11.1737631669.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq core handles this now, the driver can skip setting it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
V1.1:
- Drop runtime updates to freq attr.

 drivers/cpufreq/powernv-cpufreq.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index ae79d909943b..0631284c4cfb 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -386,12 +386,8 @@ static ssize_t cpuinfo_nominal_freq_show(struct cpufreq_policy *policy,
 static struct freq_attr cpufreq_freq_attr_cpuinfo_nominal_freq =
 	__ATTR_RO(cpuinfo_nominal_freq);
 
-#define SCALING_BOOST_FREQS_ATTR_INDEX		2
-
 static struct freq_attr *powernv_cpu_freq_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
 	&cpufreq_freq_attr_cpuinfo_nominal_freq,
-	&cpufreq_freq_attr_scaling_boost_freqs,
 	NULL,
 };
 
@@ -1129,8 +1125,6 @@ static int __init powernv_cpufreq_init(void)
 
 	if (powernv_pstate_info.wof_enabled)
 		powernv_cpufreq_driver.boost_enabled = true;
-	else
-		powernv_cpu_freq_attr[SCALING_BOOST_FREQS_ATTR_INDEX] = NULL;
 
 	rc = cpufreq_register_driver(&powernv_cpufreq_driver);
 	if (rc) {
-- 
2.31.1.272.g89b43f80a514

