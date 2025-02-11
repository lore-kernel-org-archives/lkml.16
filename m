Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9405E1F130A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263649; cv=none; b=mQj4UXza1Ndwgh7bznqsRBM1giQWRpxbzZGxqykRvLnDOwJ8wU6SMOWZfcjCYfU/9glgo3DNXWVKqZV3gGTEIM6UvcOHVGw0I+ax8WOcN00OhTvxzqFN952U85Ha5IJ+zLh7ZuBti8jn8zI9nzx30ckOf0MzxrSAkcfTdngSfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263649; c=relaxed/simple;
	bh=lsQsxt3jC7eSYnAHErAb9c4bvY2EszddZcM7R8tGZL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rhP1G3f6/0uv5D0OKLtCdnIgiZt76ei7zVVkKuKQpoKSZy0kZJXx56VgeTTZT63cMtribWMtGDbu13t77Atsd72hOrB4DtxqxmFsFFon5jycSsLGsqcryezRnagO55NkOeMXwL6+nCQclSF0eia3Yenw9T2d/Y6RDmgMMPGbs1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9/W9nvM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9/W9nvM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dd006a4e1so2670785f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263646; x=1739868446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3tPhQCrqohb5pEP4atj6WNboBz6QHyb9ufOc2FgGgE=;
        b=J9/W9nvMBMZ3KglbCvHjZkbgUzqzc/gKQraZhcE5ovZSg9pS+Zx08pPKnMQxWZ2bUz
         LW7iGvlg3YJqVSEEGONYf354d/3I7T5PpgAXewUtOmWn5Cx9JoXIHOpr5FMI/83+0Uc1
         96H0EgCkOSVBFeEvD1GRyD4Sm6F2DPUsC7RI2Rl0qa/8AoEvO+efYsxtWQBcUu7lMB8S
         C/gykDTaPLbPkqHKthZ3ZACjeJNcIn6h/E/fsdAiKxGMlrq5e2//IWePSEw9BFiSbEjV
         8AZrRrHXaGfmd02mFADkS5OGQswr/oWGk/ZbvKiGsd3XX0vcAme8HptLFvfNsh1sZywC
         Cy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263646; x=1739868446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3tPhQCrqohb5pEP4atj6WNboBz6QHyb9ufOc2FgGgE=;
        b=l4aP/rc3V37bh9KL1m+yvajMmr8xakChCvXx3hLGWlApxa3w8WTKsULClEINp6vQn0
         IPvrKKOOitgtDld5OFy5PrcrpzyTtpkG6mrPrjruChenXMsJ7bXkQlMAqhG63+bo5HCt
         Sbb3ufmYTkSGqn0uh9sn1N95lAxB0mNpB2Bmgazl3Wjiz4/xdEg9f9MersmVD9tQcaEA
         C1wtiGRoHS0jhx0QwS2Bshh/4GywvWkVF5jrrb7nTl+nloIn5iOQmIu0YzgTjuE8Fjxv
         eenspbXEBq7mPHIWLnG9VodaUYwuCi6/5J33FsU1hMBwA+6EGwb2JXihSB9dv+9cnaCP
         Ru1w==
X-Forwarded-Encrypted: i=1; AJvYcCUhYB5cqmvaszspW2hyAUdEJAzt5ok5vSDy13X0de51XEbXNQEQoqnHtJ8OEQm2mIRW+cqj848N8N2kRM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5to5OUd/TjY+2QCAga0EvSUpq9y+QyYJj/0cGze6KPU5QUnrD
	SAM2lwscVKaRUH6Uzx6Z4fXJCD/depTd/Gc6M6ZnsdsEQQ0Mj8DcrldRQjpd6L4=
X-Gm-Gg: ASbGnctx3u5rrN5FAGMQ93Fz1jbrclkk/8xUGphdPnMDQWJFSrMHRvAkfG4pdG3XoVa
	XLeqJPeUKFEHKzh0zu1UoH3rx25VmMAiKKinzNAMywuyKIP4Rsr+/pHM/ut6U5/j83z33IKbC7U
	ri6yeFGg7ncXfkdv8/ZVVXF2AYuODbQ/K0RO203CgWgrtMehcLhg5iO020Z0seKLySq+IFp01tK
	iFHh0j9lSsw6gr2MklUp0yTehFsCOQdCrKw/Xya9szoimkGJx5WHWVBoXJc7vq0JwPRdJZzax9e
	J1B8X/HF2NsGHC4/SYIS7kNlypdaS5y+0TSYfyO6Zg==
X-Google-Smtp-Source: AGHT+IHzi4hXtgJoSboZKLN6rDPfc5Fnmu4EC3F+osoM8bpO9/QfCSsFAe4L/Q9uimeL0Q0hCKWSbQ==
X-Received: by 2002:a5d:5f83:0:b0:386:2d40:a192 with SMTP id ffacd0b85a97d-38dc9343f5bmr12570682f8f.34.1739263645843;
        Tue, 11 Feb 2025 00:47:25 -0800 (PST)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm14431779f8f.90.2025.02.11.00.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:47:25 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rjw@rjwysocki.net,
	daniel.lezcano@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH] thermal/cpufreq_cooling: Remove structure member documentation
Date: Tue, 11 Feb 2025 09:47:11 +0100
Message-ID: <20250211084712.2746705-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structure member documentation refers to a member which does no
longer exist. Remove it.

Link: https://lore.kernel.org/all/202501220046.h3PMBCti-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501220046.h3PMBCti-lkp@intel.com/
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/cpufreq_cooling.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 280071be30b1..6b7ab1814c12 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -57,8 +57,6 @@ struct time_in_idle {
  * @max_level: maximum cooling level. One less than total number of valid
  *	cpufreq frequencies.
  * @em: Reference on the Energy Model of the device
- * @cdev: thermal_cooling_device pointer to keep track of the
- *	registered cooling device.
  * @policy: cpufreq policy.
  * @cooling_ops: cpufreq callbacks to thermal cooling device ops
  * @idle_time: idle time stats
-- 
2.43.0

