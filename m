Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29791DE880;
	Sun,  9 Feb 2025 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104202; cv=none; b=Q+iMae1I6/aqh4MmKWaTBQNdDB6XASODihuD7ovD6ydfJFZRWMglnVX5efQrGWt+XF5zXXtyUQEBIVIFMpSPylfYr3vDlirk5sTcpqppuOb91Esu2D/44cs18yUNBrADtestNfAtEMorv6SRwpvHEbtiApt/eUJZCidi2G9BPlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104202; c=relaxed/simple;
	bh=vNnnhadqgpsr0WL9X+HMx4wZhUMwavUPGCQ9RYGqJXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G46vlhst6dYsWdrd5CL5uW4VtxbZN90os1qZP5ygrIQa5d2P8Q/OeuWww77T2ItD/LWnuzJ3U0Zt4BxvrCU3XhYcjF3V1XOb4prGs7ePUni+xHXyqA9SwC8LU3TM94IrnJDLHIHuoWSCqwsdmwAyy1KecJeu1juE7cpLffPsfvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5QtIXku; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5QtIXku"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c053a2118fso93496885a.2;
        Sun, 09 Feb 2025 04:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104199; x=1739708999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYbWxCYZA5WaHiuw8zocuQEfssF69DUt56KBjVWUWgU=;
        b=Q5QtIXkuRDkcySPLir7T0GPsenRJmOr8Xib/w8KEVkJtlH50T/KsN3+wrOELS2gQFv
         T0zgQc4YBYrbPlnefdLREJmiZs/6+lVsnT7rpm4ByBldnh6BeA7NdsK8XudC6LawhPft
         8Htz/VTwRN+nw8PNUFWxHXA2vaKB65zzzh59M2AXNZEAW7wTemba+cVxa7iObv40qTEu
         lwHKkj3QVcrBegp0IINRrQ0d7ySC2CDqGIgsGbQvtbqZQlyU1Xl9iE1K88hzqxJYNaCp
         rUetuWuGLx0651Q1TnIqEfmvTXaaG5jQRjf0/w/mlMiiMBVrlgGDh/QnCGyEWLm6I1f6
         ElnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104199; x=1739708999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYbWxCYZA5WaHiuw8zocuQEfssF69DUt56KBjVWUWgU=;
        b=aIUfZ3zrAOdAk/znsHM9NoCrRldjAi3SBWoguAYQShK2nRstlrSICxP5g5juxn6sFF
         m3X+t7SXsSdtQsFWpsODDVr7yzeCy3b+/RSFpxYS0F/pvyeLMnHkjMn8oNN1GCCILHyz
         CpsQ4MEWkntTKiotVqda7DSzZ7wOAoVp3im6fq0iC1n5eGjNGTYywzIKo3hR14SgD2sT
         BU/7cvMGVDnC4CNcpDQOZBbJD6oUHv0PoyEfg1hzpn/y7RB4KJopzTw+Nu5d8wEAYBmi
         CWjOK7cn5RPV0rFjqmmVK4iHkPYLXof53mkQB1W9EKgkuVuFp17H/9uIMMjcg7u5wON5
         Ug+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVacf6s+d9hyOJkl/x0LLFxS85ZNLQeUVYZlR8u9lBPLaVsEaXo13a/P9XLGhLiIlRuhFFt03+t8jRr@vger.kernel.org, AJvYcCVqf0+eiptyEjxI3KA1RkzuQ00N3df4CBXF5kkIqnEnhHXbDgjjPI3HkyASxm7Fj+RyDKwDw3xxWMHtACwl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8FgounW4yGZ91ZuOQGYBCViuQYk1JSyljS/F9Q/H3jq8fh2dS
	yqge6vhPiV9NmxgF/fMe64nKFFtTutxUgegcVlu7o6fINyefV8ds
X-Gm-Gg: ASbGncs4vaHbzukj7cK0ZYfAW3I5LcNaVl2+FRiyMtWqRqJ6dAsrSz+fON7WQgqU1vs
	cb+CPJ4Gtd/xFUrw0skD3iqQaof9DelqCJeSH0DZ338qLHxr0/u9UuxRjOmHiKrm8Vtj9Js6IPp
	bGp3tbfqfJt23RjKn4fJ9ZfILfkGPZLCqFUaO15e4LWdDEe1YtQVosM4iKUNZtXl4hezU2i/jNB
	5S1clNjWJAwI6JXVN3BRMBia3jO+WtUqDCc7vC3IqY0gQYGYXPxkyeCgluQDp/vQlg=
X-Google-Smtp-Source: AGHT+IF7/UiOHBHWEIdTmUIeNwhHQwhT5jPl13Wc38VigifCku77zNqoVMizXLccpIUuEFaQ6LNRYg==
X-Received: by 2002:a05:620a:4d98:b0:7c0:5c74:57b7 with SMTP id af79cd13be357-7c05c745a41mr99264185a.27.1739104199557;
        Sun, 09 Feb 2025 04:29:59 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e45df55744sm3134736d6.30.2025.02.09.04.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:29:59 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/4] reset: simple: add support for Sophgo CV1800B
Date: Sun,  9 Feb 2025 20:29:33 +0800
Message-ID: <20250209122936.2338821-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209122936.2338821-1-inochiama@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse reset-simple driver for the Sophgo CV1800B reset generator.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..79e94ecfe4f5 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,cv1800b-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.48.1

