Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C14028640E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200680; cv=none; b=f5VxS0D1+Rp0KmckNH8tyJ311nH4mxW4S6Quw/KHOEgjGfdkboyZU35XliJRN6CmlrQt/rNrU55EvMKsMJJ5t2NQmEqEbkDYcWi0zkYkzt+uGn5uN90YrnPggJW1DpPdrdC8dsqeCqb601w1dRg4pdwTsINmHBCYyiT5lHPQX/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200680; c=relaxed/simple;
	bh=ITvBuxSeIAXDkBJEWGSGD5rlQvO64BrbWaK4vCuf/rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXibBjBGpPivZdARK3RnF8UYKH5jSN26VvUjW2wKnnSyfSyIxRGOGYyqGDGYFBGUWinpM5DWZbCG/9O3uCoTvKy2DF04gVavl6KAXXf+qLWO+cBnN4+1n7raUQlKcpNOkVJ3AVTCF+IyggRbYP6kB7Dh30IZs5hvR/RSvIW4BpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yr1l27W8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yr1l27W8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so15005185e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749200676; x=1749805476; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/emY2XS5cFVoX90o0NgZjiKA3eudgdKvmBzuNCnA9A=;
        b=yr1l27W8cUM/Ij7/AcbfDzBETTN6LucQXjVhHwYsqs+I0cjoajpSHJcGu49FF0LdNd
         UVDmZILBPMmJ/09mBBSgqLIC5ptsMLC691HSZYcXviFtfA5ZJ3rRDjQePX+vHwGci5m8
         qcAaH+8V82AggiqR4EaO4xiFEDfft/CrRxya9h/7I8pUA6T6bJDKZa5JDhBRuKVbxMnM
         VLra/shle7JRd/rtH1cCFkt41lPEIkY+dxoRT14Jp1wYyU3FFhofZ+WKXsR3k2PquYo6
         bYQZA7+2CdXYJjWqL+bx/QNnh3tb+1fGYGeY5BrqO3U9dYt5iDu8e2Tix7jkz4OFSsiF
         n2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200676; x=1749805476;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/emY2XS5cFVoX90o0NgZjiKA3eudgdKvmBzuNCnA9A=;
        b=aeRFvmE0UYxTbbdSlhTr+dpddPCUoo0ncQSZCnTz/Lh4K/HINN2AfC2NvzGf85F5Ug
         kvARSS7sjOseTiq4dmVtgufoX9jZfH9rGe/qWiLBgxGeKmeI9f/ptaO+09CJ4JhbH6NX
         NdHILfNHxLAoSLEeKJwd8p7p2NYZqxCcLUdQcThz54Kqg2c1asOSgC5U3vpfPVhBqsAb
         8fiQfFsJNw/DcvtKOXGJ+Kp47Exk0ovrF33XOhUM4KQJ+ayukQMYz/yyrv7+3a8OC70S
         KH6a1TiTurFvQ2qkMhtlG0wEiiaR8ISa2LeNZ3gFL6Mp31hErt9UN4qq87UOhMULIGo9
         0V1A==
X-Forwarded-Encrypted: i=1; AJvYcCVGhVDTi5mBVl4Or132Cz8B1PMj58Gci/JMzUdG1V1tVp4/tyobOrxaKig6+H3kgcCFVXHfwqxZv9pZiaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTKZVvgm2FVpTRn3jkugheWLGhTNz5KNoieAUSfqbE5GhTyGw5
	e2ESk8bPqI4ZSZU8cuMcIe5u1wuJxdud2dcJS7KQfBzhtY8Z8Qd6y/LQ6yWgHiYexwU=
X-Gm-Gg: ASbGncuJd1IcK11CeDfQuyH6Y291xiUHqY7sgUtT86Kt0Dvd1PULN2s+T+gNXqJE998
	FW61aWPhSZYMxniW6uWut8NbbTnUjBpBGbk2btRn21yTyGO4DjfkeNWchQ8ci2aOSrTYpOTscNq
	d+ZYmTR52sU98PoRC5tW/eHgCK94J6m0Wl+Xn1rVxriyEgFrLljfgIOiPthXTb1sCvjWPos8+wE
	o+TFucd3pOMl7ts0oSKV31sT9L8z6i1HTKYIULjW1AZMcvMXKUKDkrOVsIcqGy1c4MaSRjw8Muo
	dzqJEBwOPJ279gLHBRBnZjm0lnD8+sfx8rDcMyEVY/yaHFjVx1KaC6Us/p3lI4X5JKtakBR8vre
	Z/g==
X-Google-Smtp-Source: AGHT+IFhA2vqyp8xEAIPBvNHsWP+ZzsHRKW0V5DhFiNi2JLK+60alY4CgxuHf71qdKGE0Cj1Xq0Z3g==
X-Received: by 2002:a05:600c:6207:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-452013fd6b5mr27037065e9.4.1749200676516;
        Fri, 06 Jun 2025 02:04:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4526e155ce7sm14210735e9.10.2025.06.06.02.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:04:35 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:04:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86/intel: power-domains: Fix error code in
 tpmi_init()
Message-ID: <aEKvIGCt6d8Gcx4S@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM instead of success if kcalloc() fails.

Fixes: e37be5d85c60 ("platform/x86/intel: power-domains: Add interface to get Linux die ID")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/intel/tpmi_power_domains.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index 0c5c88eb7baf..9d8247bb9cfa 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -228,8 +228,10 @@ static int __init tpmi_init(void)
 
 	domain_die_map = kcalloc(size_mul(topology_max_packages(), MAX_POWER_DOMAINS),
 				 sizeof(*domain_die_map), GFP_KERNEL);
-	if (!domain_die_map)
+	if (!domain_die_map) {
+		ret = -ENOMEM;
 		goto free_domain_mask;
+	}
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/tpmi_power_domains:online",
-- 
2.47.2

