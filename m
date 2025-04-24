Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D7D221723
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491023; cv=none; b=FYgIvffBzyxQ6p3OTPHNcIzJQSUxLQdK926JexZ5lF5oZ6BgVpkH1DIlxmDknm3K1IYTqVKw8QtpMqMT7f2jn6890m/SBxQDmDmkGS7OteoC6BHPjMFblpAWloUSVEtFWz6jMTA27z1PbJQLRXOBw7/EkS++mnRxftFpjqNtLjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491023; c=relaxed/simple;
	bh=UechCo47qLLRuMf6wbn4WAas377Itb+KTz2qvfZpdFA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FZp2OH+Rr+8dH6PDw0PvrlVRRpz8nQ51ecUnwU4ZgRbsastxT4NMw4LrLPC0QqlJ1cOsjmQTA9CGUfhXoWWidFOwfgvWoPdcCwEbHhugaQEo3B1v5U2BD7m8/LdT7DfNt8XoN/oHIQE35+UmaAG6+xC6VszCZtfZqG95U+Xn5B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnBAyKc7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LnBAyKc7"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so669750a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745491021; x=1746095821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7dk2/C/FgTZtugG3sjnuQxIgyT1iGedayX4ysvVif0=;
        b=LnBAyKc7VIGaHQQm/xC1DVxAaEyheEzBHzq+2fB2q9InIrc8EKYh3S+Dci73JL4Pfb
         gLWy1txiKxDszOJYeDB+5xCmGwk/KpeJJRxqQ7/YAqnz8g1ey2wpilh4WaunnvIjy2Xy
         IelT80hYlluljFoNauv2aJZQ87/AKSiNOYj6DNljkkmLnNjun7n1wWijTzhdgGyn8GjF
         3hqWzXZNKYLwTMNY734oH06/bsLIgPLdt9lEQTrP5de7305g95lhXW/gw+oCELC2lvqp
         QZb6nS19uuc8hH5xj5xLkDgBtlKlJAE9b46hf9ymVaah8HaHVo8xbpPtSnllZclBJfXm
         hU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491021; x=1746095821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7dk2/C/FgTZtugG3sjnuQxIgyT1iGedayX4ysvVif0=;
        b=j88kuwLJG/gQH1E1PtJzS4vlu6MgkiPPUdR6ypY1OEeID2JZH3osMWW9id4r1OdN2M
         iDYQIBTUfeH2VXp8M32Mt9xvLuubX7VYjvwUWxfaMA6rGG2/6UJ8DGPYW+Cp9vCPWPM8
         O8xSAwRZEIT0Y58PN6avoK5axyAi75geEsqIOMo9dqfXgC0UYXgX4AQKS0ktgYIJLhO9
         5iVT42Gxwjxk5De2jQzgw32c/3V2nCECLW74F3Vmyn1adnSNBUCDYqSErgoipn56JrGy
         TDBh+JyT0lHdKvqHOy9mpEVPzrZWBRAq5654YOX+r32zA5I6ffOHuPKUMMQc6yNgxWn7
         yLgA==
X-Forwarded-Encrypted: i=1; AJvYcCXPqMb3gjmxaraXmKN/aCaEF6BWnTf0CRRmQ8ZeXkpg8nIAOV3aRZJ5KFw93oWo0doF3IEdsq0xJta4Hhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/3MkV49Uozw+iqXW1zdPWOICHzpvHrapmApzi7zAN89DcYop6
	5YiY8DCRc/CdTQL8WOlfTmxrA7EC/Ncj/qK3BQvLX8/LJvIl0T/8MjFg+j8yr6s=
X-Gm-Gg: ASbGncuugBhNsDPEyOiK2CbGivEAbaxNFuZepbXAPiWs+dYm+P4KEri8C9gGpfYJdp0
	JFjbkQ5Oi9gBYoCiJ9CrmadW1td+nh2PR6g/f/LEZTWNsEdk5YEa81wegz02umHZ+yVda+FRNPr
	fSWi3cFhCmenr24Ux48zhRb6+I0OcjsftQDt+y38I2q6cnbjxOW0Mwy9Ch1O3Ngyxrp5Um85Ogm
	3VNJPg2lkdwFzdqj8oh7Kcqr1WkOc6F80SqXEsFiXnYK9xiAfDCiHbEtH+uxhY3L4ZRnlG0xcw+
	rgPC9nKDZHAp9XwRhnNuet+byHUEV7fowGc9c8HttA==
X-Google-Smtp-Source: AGHT+IFT0RD46t/R0Zf1IErgjIpEGCMAsdYfxHsHNbtvlyC3cPEP2QPV193RVltNHaQVgcd61b8g1Q==
X-Received: by 2002:a17:90a:d007:b0:308:2b5b:d67f with SMTP id 98e67ed59e1d1-309ed279ec2mr3546910a91.9.1745491021404;
        Thu, 24 Apr 2025 03:37:01 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03b27asm1093013a91.6.2025.04.24.03.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:37:00 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] OPP: Scope based cleanup helpers and lock guards
Date: Thu, 24 Apr 2025 16:06:43 +0530
Message-Id: <cover.1745490980.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series performs various cleanups / optimizations for the OPP core.
- Introduce and use scope based cleanup headers
- Use mutex locking guards

No intentional functional impact.

--
Viresh

Viresh Kumar (6):
  OPP: Remove _get_opp_table_kref()
  OPP: Return opp from dev_pm_opp_get()
  OPP: Return opp_table from dev_pm_opp_get_opp_table_ref()
  OPP: Use scope-based OF cleanup helpers
  OPP: Define and use scope-based cleanup helpers
  OPP: Use mutex locking guards

 drivers/opp/core.c     | 426 ++++++++++++++---------------------------
 drivers/opp/cpu.c      |  30 +--
 drivers/opp/of.c       | 205 +++++++-------------
 drivers/opp/opp.h      |   1 -
 include/linux/pm_opp.h |  21 +-
 5 files changed, 249 insertions(+), 434 deletions(-)

-- 
2.31.1.272.g89b43f80a514

