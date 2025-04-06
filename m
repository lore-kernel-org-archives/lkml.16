Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C911A8418
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969031; cv=none; b=Rx0Byjv65NUXsof4rkEmdtkTaSAFIrpXgBYq5jkCQG68wwmRL7Ndkdhe/OtyBD4AoSOIFtWHKVmuLHIaMrugzMv2l1WFgIJz5WvryNhPxm0e8sWxWhC3xoSkbvcg2FCenTuehhpCC+R+SF26YP6UUXbyPDFbIWLQLAIyX73aTFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969031; c=relaxed/simple;
	bh=OZBR51ofCbjDiq/dkmja/3ZQr/zVoxD7dJJE48cM7ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOLV1p5cmkgG/eY0/fz0D77PAncs3McrKxYsnwrN+wT2AAMs5nV/cf2gZAEhQcItVHQvJtDvor+a8zz7FXEbMRKVHHa6THixUY583mCJ21+bJRLwH11FNU+n9Qk0EV+Ar/ahAAzWATSWUdxv06U+DAwvFNp+BG0ByKb9pG/FwjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rJW0Aovu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rJW0Aovu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3978ef9a778so502705f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969028; x=1744573828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InqHjFd6eIjileja4QJEXvFJJbSRcU7acJPNoaodKbI=;
        b=rJW0AovuaY0WPT/JzVnVUtbgJBcfXvSifBI05Tgxr/Qhnt3AtS0VjMpH2K6tfWGTi3
         6FPL9lzTk8/N3y/NiDAgbT0TVXEjeN+3KE5cBdRTRaR6JHpwk+r0sj1L84Mq8B9WFSyn
         yX2EWS2uHqVce1Tt/z7SdeV5bWM0PPvOTX5jZMf+BBzzMXCGmGKwHgnEwlhuyXh2m/8G
         0o5R8hFh+ToC4DKxp/lwMYrHavjGYRoYcKf3iYwCeBOgbV/O2iSGFf/gdDiN06zV1yH5
         YI5E02vr9nkAquFcaEUyfvg6yYBXe9mhcm7fVQIyn9fGt18MX3PnhFOWxI9qI/i60PoL
         2KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969028; x=1744573828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InqHjFd6eIjileja4QJEXvFJJbSRcU7acJPNoaodKbI=;
        b=sHJEkpf6rSBGfpFWWERsrsg5Zk+ejFVfFUtGfQsxcZ3FOJkSTjvzQkhQ2RxEwlJPxM
         plh59RlBlRHzJEtwujJfWwQg9bcRxM/QrzumuViBuWu//cxTtbHQOTo+jdAHOc0RFimD
         dIRG1JZb09D5Z8HnKCBLcdy7XZVNBpMXf6WP3JM9mJXyuFBEuGuYJLOLaLRS+Vm979UR
         YYpoC83TaXqITk8N2ImJdbkK5B1zZ86mHWmffZXdnWTY3WbiBaJRz/zrSwsv3l9UCx6H
         x7S0TaHisX8f/j97HrtkGxonvmyWdw81AQuQdwRym8eHm79QdfoEBVTDpdZv/1LYSWvg
         XYxw==
X-Gm-Message-State: AOJu0Yy1UoVF0vMnvvk+hMKySUfhfz8+Fdj034HY2NIH8UyoYiZ9Ebek
	goycepvgwX9UnbGClMu/mMLMDgzzr9NkQtD1ixFjOz8qE/toi+UbFxBviXeOjun2z5++bIx9t23
	z
X-Gm-Gg: ASbGncuUEeriDFw00nnlxWhF3lwOr4ukVBggaW7EMntc3YEKRUulDt9TBxRPOKUnib9
	Bqjt4WbxpWowtERwub+55EHw3LPf9KPmFziU04EwEQX1p6hMa5nOW9V956Ib/tmSY5cntCeZj7J
	7sWHOT3T2kHPpx4CdemLaarD/UP7uEPKVskvWiZD/erIHT1mx2JNy8ZoI4zrcFtvthlpVjzi5Er
	J30ZbCZr5NLXMpEJMN5UEBkJFpCypTmTpjtwbG8uO/4ycUyKdKum3p4jneupolVglTSUuOtkwCp
	tJKSTgem9IhPpiq7QDl3rIW9QSsBAKIpNrE5MKtzLjZ1bCf8ttyGe6ytaUM4TEU=
X-Google-Smtp-Source: AGHT+IGrb5pMPoxaLOXALLl/mUYk8Q/ETOdSbGVyu1Hq4xg7ltPIcwQoXNzMTZ+Th6fOifSH0KHjNA==
X-Received: by 2002:a5d:59ae:0:b0:391:2acc:aadf with SMTP id ffacd0b85a97d-39cb35bd538mr3357646f8f.6.1743969028106;
        Sun, 06 Apr 2025 12:50:28 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm10053842f8f.43.2025.04.06.12.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:50:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 21:50:10 +0200
Subject: [PATCH 2/8] mfd: as3722: Fix wakeup source leaks on device unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-mfd-device-wakekup-leak-v1-2-318e14bdba0a@linaro.org>
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
In-Reply-To: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=827;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OZBR51ofCbjDiq/dkmja/3ZQr/zVoxD7dJJE48cM7ps=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8tr30Eqe0yuwrzWkwQUn4o+4oAPoYgTtdOl1a
 honUSdswzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/La9wAKCRDBN2bmhouD
 11yTEACV+TSe/z68unVWWchtJRrUG1QZRBIN+GoI973XQ00Hb/CIVqeb+f9tUMxaAFe4P3ZmLTV
 MlF5WoB7hwSSd6sFWRcIMyLTr3ObeeGtWDg0wwasFC+o7KvcjFoVnCTnSLqdvDNktXBxqU+WAjQ
 QIwOhgpWqCevukyInCMIwopv4uHsCEkFzpwgoDlSDAP69FsOHUz7kUTnmaBU5gfboBOdYlM/jth
 yGOlGzEQeiZ5/9YP0SEcQSCyi+TSarAueh0sxYE896lGzInFY0/kWLCkfYwxu6W+7FBlYhIkaov
 Q3MUJ9zN7JQzf5mQV9j1An0eU5yF7XxvvEbge3Y/v3BRcBSmWop0o7LsMagIYBt8S20r+TMsZWP
 SNA6rFrlyMJcrUvyamoghnBV9Dt1UGG22lUnJhi5wBzl5E+LKcyoNGgztn7yDcZw9cPH4DEesRQ
 CpUCckj0tk9fuqIVv8g7lSVXl++E91k4pir2XW6OuoLQ0tW37bLw2BpeWFv1vz5HGRNRh0gOOSz
 pX+SquolIuYW6iz86cpsHsDZ53Zu1M9P0+ho/Yem6IGxDCXnBHX2JK824LJBOEnSqLVHxpMXpRD
 38oieaz+IHUNSGr33PNLxhBkTM7eXOdCd97gMx8VqlEREvvh63rVvLtdsjPEMWmpKr+4YQI9SVn
 JuaGvEQwW0Rq5Wg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/as3722.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
index 6c0d89b0c7e3faa2f82a265df245c6abc6617e48..7ab6fcc9c27c8f8284d5e2a7bf4291d582b9ca22 100644
--- a/drivers/mfd/as3722.c
+++ b/drivers/mfd/as3722.c
@@ -394,7 +394,9 @@ static int as3722_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	device_init_wakeup(as3722->dev, true);
+	ret = devm_device_init_wakeup(as3722->dev);
+	if (ret)
+		return dev_err_probe(as3722->dev, ret, "Failed to init wakeup\n");
 
 	dev_dbg(as3722->dev, "AS3722 core driver initialized successfully\n");
 	return 0;

-- 
2.45.2

