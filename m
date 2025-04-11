Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB455213230
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386270; cv=none; b=ryiyok+ICjFAr4RJ/SNTdmydJZDj38SB3yvG3MKBYgPCYbtqYm6Qf7+YhvbpPFjCQPI/hLcYaiAU2O1rNtXeK3yHL27VLB560U/RY+4MlDZX8kzVjNLPbjULq9hcIfPgkUQTdvJs1t7+hPldIXeXjYJNpnqS1x/AdLlJsmosBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386270; c=relaxed/simple;
	bh=YTCOV5qFH6rsTE5f1V8QRlk7DYXjTy4SSao1Noq3mc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PewcPR6Gqzholf3kyaNnSM4v3QofT46e3QFt3BMeK9PY0OBJumm8XR9MlvfFJj/vZiBZeCinUC9YMcYZDelfvKX/YHBNrvXgamZBhmUagQBt0OzEO9I5cJuXRWeKd1Zln3eMjjYl/KgEh32WJmnTvJrX55nAz5EikhZQ1V3PN+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WLJFZxg1; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WLJFZxg1"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso70021239f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744386268; x=1744991068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIR6+1UCymjCvWnHm+vRVxN4kx6Kunaak/TDrneY48s=;
        b=WLJFZxg1QCCV0kk3mFo2+q7h+KNKBsioJ2xaTCj2vdLR0j3oZKGIlc2MUudSE58LM7
         c1IYKHrD4iwv5/OT9YZzKrwnTZ4W1FgjhXaHcshWlUAzg08NHNE/EoKYW2woOxyIF3D1
         CiEV4Bc8OIfla7LUFeHOkd+g83pDscilKcVoKR0j+4PJ90Ko4fx85QxzxA48mSN3GYlc
         JDYbeJ2G0a1bEzlwPwrI3WRVcet6mkDykoBEMkJgszxem8MQp3uHE61SOT2oS7vPVmQb
         9EkMSnANAp7FHvXbm6tDbxMiEZF7DusrAktoeFvjDtyxN0dGwNpnfGIbvUL88C0EHCB5
         F4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386268; x=1744991068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIR6+1UCymjCvWnHm+vRVxN4kx6Kunaak/TDrneY48s=;
        b=kVvqXt1yuFXc+7G7EkyhDMx0LZrk3aWDMSB+F9d3ly1YsrRvzCBJ3d1nx+C2BAtI1k
         jpLVM5JjF8xNJzMAsJAnKXYd2QRWSgeqNtZruwlqeZc72nefxdUZs5gwi9jPbkNo5q3u
         OY8zG1nm9ewRuhl9Q/CUFjP3rSsxMlDThNSXUTWu2ZUxM0nXI0ocOyYCGFTBYjYIftEl
         e27eTdygIZC/93LVwkH2XwqHSQ/eDNt0pXYoaV9CHiLJ1jID0HJmMTvGNbJYvbAzNvaN
         c1Jc/BSDW4itZDydP2Ods/Z/J5mnLsHFTMlkdVN66I9I/+OvVkQmOWnYGI8vV/l/72to
         oJYg==
X-Forwarded-Encrypted: i=1; AJvYcCXJHDbWqZsGTJunXxKrqVrskWe7VerXVJ5VvtaaNHX8xitaasJ/zZKgwFRQn/cLvqf5Jwn9wDWsmdVWuBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzja+PhTmBJLEbqkx3+sGTYUv7EmAYMSB3fLp/1WIAq3Ve+uFZE
	O8x6WKjGP9s8USjI7bw9TI0IrRfdwa5CeZZPdv4gi4H0TOZ0flDhBB3VkEYsmd0=
X-Gm-Gg: ASbGncu37Zys4EY7vh8F45aWyQmsRBoPW6F2+wDkfvus3GiygdEeO++3CTN/hxCBBFi
	OyNKFEVdyiRSpxq51Dt8h06DBNcnW0C5v+bgE1Zynt6A4XvvL8DOuGcXAfkEmNSvrz6qMThgytF
	tXGWQJUAYCfARaA/pX4uSIHsqxS/LavXFfo0Wqr1GpLTua1OQjOh5v+uKKftYc0i5zknglOX0kL
	EWev6Clb3AhOvoV555Qp+HXBhtargTkAGzoeJl5gyeTR0vd+f1lhw6qpeVFyzthemyiYDB5Bf3W
	xbDqq1qmxASDEQmmHj4sJR2lY91yDH8tq81tQSNYgTutpjDlyOw+q1FD1fsnHqlSkcXbt6/yX0X
	ZlqdOt7gR6CYh5Q==
X-Google-Smtp-Source: AGHT+IGFDCID2V9OQ58DdGxUCrdRPix2Sm9SOyZ970XE5klNUQUYc7yCAtoOB8Vh9getD8RZI/2TFA==
X-Received: by 2002:a05:6e02:3601:b0:3d4:3d8c:d5b4 with SMTP id e9e14a558f8ab-3d7ec207fdbmr28814495ab.11.1744386268085;
        Fri, 11 Apr 2025 08:44:28 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf812dsm1276326173.18.2025.04.11.08.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:44:27 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] serial: 8250_of: manage bus clock in suspend/resume
Date: Fri, 11 Apr 2025 10:44:18 -0500
Message-ID: <20250411154419.1379529-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411154419.1379529-1-elder@riscstar.com>
References: <20250411154419.1379529-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Save the bus clock pointer in the of_serial_info structure, and use
that to disable the bus clock on suspend and re-enable it on resume.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: New patch, managing the bus clock during suspend and resume

 drivers/tty/serial/8250/8250_of.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index a90a5462aa72a..8f2529f699e0a 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -24,6 +24,7 @@
 
 struct of_serial_info {
 	struct clk *clk;
+	struct clk *bus_clk;
 	struct reset_control *rst;
 	int type;
 	int line;
@@ -123,16 +124,15 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 
 	/* Get clk rate through clk driver if present */
 	if (!port->uartclk) {
-		struct clk *bus_clk;
-
-		bus_clk = devm_clk_get_optional_enabled(dev, "bus");
-		if (IS_ERR(bus_clk)) {
-			ret = dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
+		info->bus_clk = devm_clk_get_optional_enabled(dev, "bus");
+		if (IS_ERR(info->bus_clk)) {
+			ret = dev_err_probe(dev, PTR_ERR(info->bus_clk),
+					    "failed to get bus clock\n");
 			goto err_pmruntime;
 		}
 
 		/* If the bus clock is required, core clock must be named */
-		info->clk = devm_clk_get_enabled(dev, bus_clk ? "core" : NULL);
+		info->clk = devm_clk_get_enabled(dev, info->bus_clk ? "core" : NULL);
 		if (IS_ERR(info->clk)) {
 			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
 			goto err_pmruntime;
@@ -299,6 +299,7 @@ static int of_serial_suspend(struct device *dev)
 	if (!uart_console(port) || console_suspend_enabled) {
 		pm_runtime_put_sync(dev);
 		clk_disable_unprepare(info->clk);
+		clk_disable_unprepare(info->bus_clk);
 	}
 	return 0;
 }
@@ -311,6 +312,7 @@ static int of_serial_resume(struct device *dev)
 
 	if (!uart_console(port) || console_suspend_enabled) {
 		pm_runtime_get_sync(dev);
+		clk_prepare_enable(info->bus_clk);
 		clk_prepare_enable(info->clk);
 	}
 
-- 
2.45.2

