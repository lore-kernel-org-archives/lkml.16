Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB51AAA05
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866227; cv=none; b=mNHgK30WGD8xw1KEwwNFDnC62AZb8kfzeTdVemmqH6ssFloxEon5vAJgMGgvPEIdC3eiaZEVsb1LzlAukboYjX0vtq4ggaCQFK+oiIHjbjIFL/aSV6/QbQGbxfwHMjQpg6h0o6ggHTcw/POZ/FbmbqfEwm5o/cySFiSwIAsYELQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866227; c=relaxed/simple;
	bh=Jl16tNEPM6BDreyI7YdYngMWZcCbd/CzMR1YX33ZIyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Js2nnGSxj1sgma69fs5mcLw0d+xo+Ctowz0yzcZEhW0z7p4L37FLD2jbmtX9Jq+2st+dJoqNz+9epI56rVO1ehrRc9E0HTcKCpoC7Db49EYLLUHyCsBBhSKj+fPn+7AAR+YMI0rBJEhK4TVDIdQvYnZWKKSz3eiydQKZmX09ctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0DKAFqxe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0DKAFqxe"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so435558f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738866223; x=1739471023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29W+xGQBf5MD/J2VvsVKDtGV401fRAN/4XA8662w0b0=;
        b=0DKAFqxeX0VFHfH1fl/v4ayd1+YGqusx3ItTblWyhMWFeRdZTbFeBrhgrVtuGcsrtm
         3WFy5teY4i+IFeTgZZoccvEC722mY7iRy7Vc2dqVQ7MvM7BxBV+j755b1PKr7Mtw/KIX
         SYhElgmgPCIsAxoDiPbrklAM5BYPpVy36B1iU5RCr5McaJklKplTUbjKt/FmbaQifCTy
         84iqsNPQkViIdjVx9TA4RS9sS1Y8vjNd+gWNci97/rr7AyDjbm0pW5mf71acVGQPEmwL
         kSFCMEw341lLmlNvhKdfEV2+5lKCsOOY3CSu/rDDkgqIJonq8IyOHWfuCng8u+/LyyUy
         74VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866223; x=1739471023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29W+xGQBf5MD/J2VvsVKDtGV401fRAN/4XA8662w0b0=;
        b=myzvHAU6akvRldwrxEQEWegQZQShmxHa+ixhZ2XNIU1tRaXXiGf7+FBZaMyKS+EY69
         /SU+t5nH+7/wfJsWAx8c3RS7io/BBNQjcbKwqAZbZtjKw7r+LoQDYmPYIo2w2bT3xBbX
         4tLJ9bV+z7De8D0pYA8Zqr9BNe3CXllJjJr7dOgUIVGXevd4LTkXiAPw17QeKRrC5RsE
         aMWqK1z755FqOlySHqhDjlQoueNHmsCOEPWRbyJqHD1Ho+1EBH5Pc18m0v0IBqOvkNtN
         eC9fh7ap+YAxigRlUSwriuTlD40d5UsPYykhHqxiRABhf6ZnFGbYTyV2gm9iTYB7zi/G
         LiHA==
X-Forwarded-Encrypted: i=1; AJvYcCWUYqQjR/bFS2fmLz4OS/YB0xPDoOSBhjZBKIMqNHTLVYXhqv1OWLKYgzHzjfIWeOvUIChWtnOW4IVl3Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxK4hXuWBw68L82YAgi5kaCLoTVhTzRZD1TpyXZv11n7cHoivL
	i8V7UjzB6MornEYLYHp5eWkHqaHoN5Q6qzjxk+3yEeqOxy+fpXpTvlltts8VhCM=
X-Gm-Gg: ASbGncvhYATOMKvqA+fyhOcPgNTnNt+7kYlLtRlT6jnhzrMQKWR6zFwIeG66GLKRERU
	TYzkpsALPoF/ix5CP2y3l81ZTq0iVw+GhfPLfUjJuNFeGAxmZeCf0tXrTQy5YMFYJoDYJlVz/9b
	87PMKUfNZfJgcclyd+16eO+WwaOvoZIjhRW08OIwl8wr5hJ835BBfZJmdgEklerI5a0AKp5XGhE
	GJVmbIGRLeEBQO2ZUjQzxBbfNOqrLeFcK/Z76mDuZ3cyRX8tneBnAGXSZlwZnttgjs9V94oQkmp
	M/0vQk7Bj3lj72UT9w==
X-Google-Smtp-Source: AGHT+IHlUue1eKBzSa9ofHwkc+r/gZvS74Iyd57Rrk4ER92H+cffyUvvKLxWs3c1qxFz5pMlm9SmgQ==
X-Received: by 2002:a05:6000:1a8b:b0:38b:ed7b:f78c with SMTP id ffacd0b85a97d-38dc90e6460mr28801f8f.6.1738866221944;
        Thu, 06 Feb 2025 10:23:41 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:a0d6:294f:5246:28d4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm66111445e9.12.2025.02.06.10.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:23:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] clk: eyeq: use the auxiliary device creation helper
Date: Thu,  6 Feb 2025 19:23:15 +0100
Message-ID: <20250206-aux-device-create-helper-v2-5-fa6a0f326527@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
References: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Jl16tNEPM6BDreyI7YdYngMWZcCbd/CzMR1YX33ZIyU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnpPrNGoBW0SbiTYayeUTxC2RlUHuB19r1iaZoa
 ZNxRO4lfHuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6T6zQAKCRDm/A8cN/La
 hSoKD/49wqMtccrlfOJtnw1L5ApXvUBtcnDHmJnLwwi2Fhq035exPNS/nnY+msS7KL7cOrmMHF6
 mxHmFt3q/tmaeLR5FBMosAyN5Bz8j2S1df1OmkMgsStHcg8n4fdwNhged6hc+l4zwy2FHp34utQ
 B7G2PSL52y20bVzuaeiJ579jzgoh2Q03v7rS8wRWoCqLoE+2RdaM4wbHriDXVeT9bSouhtvjH+2
 YiA5CjkYKZ5/GkM23UuIqOaFfCH02DOV3Uz3Tn6kV6KICvDeWcsucRoUPqsWsGusMbGV3/D8zo/
 +VWt7FwxB14RxMLM/4y0Si5Tty2E7Z6ZCxntN7LybKyJEc2QMGcn7/WDoPPFXHOK+fsdCHApCXG
 ImvJc7Si0yIzsCnfytpWEHD4cft3N+6MvcNt1H+s/bH7vpbLv4SGR3Vk84uQrtKBjcbC+fkDeyp
 JOPxKOonOl0OxI17b44ufEDIjKS7poUolsYBxYmOI3Z9kn9KeYvlbh2s1lZleI6NdSox2TSMKRD
 cOQ5Ti/EGj0hNyEBOxKrzOx+zA+YaF9JPsbb09AoCNxH8/uatDrkZSg0hHTHN7iYwhPHQXeuLn2
 afLhmaYY0x+JgmyUm7+KvINkUZ1+oHQsQEKV1Am4uPDUlRj9PJ4r3RtxrsuND90qUtgoHOaaBMj UwL1FsEkOHajzpQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-eyeq.c | 57 +++++++++++---------------------------------------
 1 file changed, 12 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 640c25788487f8cf6fb4431ed6fb612cf099f114..e5d030abd61f05813d4df35189f046dbd4f4b185 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -322,38 +322,18 @@ static void eqc_probe_init_fixed_factors(struct device *dev,
 	}
 }
 
-static void eqc_auxdev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int eqc_auxdev_create(struct device *dev, void __iomem *base,
-			     const char *name, u32 id)
+static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
+				       const char *name)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->dev.parent = dev;
-	adev->dev.platform_data = (void __force *)base;
-	adev->dev.release = eqc_auxdev_release;
-	adev->id = id;
 
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret)
-		auxiliary_device_uninit(adev);
-
-	return ret;
+	if (name) {
+		adev = devm_auxiliary_device_create(dev, KBUILD_MODNAME,
+						    name, (void __force *)base, 0);
+		if (IS_ERR(adev))
+			dev_warn(dev, "failed creating auxiliary device %s.%s: %ld\n",
+				 KBUILD_MODNAME, name, PTR_ERR(adev));
+	}
 }
 
 static int eqc_probe(struct platform_device *pdev)
@@ -365,7 +345,6 @@ static int eqc_probe(struct platform_device *pdev)
 	unsigned int i, clk_count;
 	struct resource *res;
 	void __iomem *base;
-	int ret;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -379,21 +358,9 @@ static int eqc_probe(struct platform_device *pdev)
 	if (!base)
 		return -ENOMEM;
 
-	/* Init optional reset auxiliary device. */
-	if (data->reset_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->reset_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->reset_auxdev_name, ret);
-	}
-
-	/* Init optional pinctrl auxiliary device. */
-	if (data->pinctrl_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->pinctrl_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
-	}
+	/* Init optional auxiliary devices. */
+	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */

-- 
2.45.2

