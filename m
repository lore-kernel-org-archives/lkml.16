Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CAB1B4223
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969035; cv=none; b=nSpTrTNts1hyFzelVuQvPbFVa5J4sjXsiwNlaFYasmkCpXkh01Plct86bxNHyXzvQPcm/mIlIGzI4vTTXfzPnaeCfd6kCz/shO0gVgGxddImxCAeQD3wTX/d70XKOo6gXKHwgIkComTgiFyFLI1QPQN9kg5pLHih775+JO94BHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969035; c=relaxed/simple;
	bh=a9qheLkJ9G/a0gSpyASbiRRdDdncTZ0T8HcY8kFp15I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6V756yFtK9P8d210l3p/2sv50/s13eBj3sgkuo8fMJmBoo0hZLITzWKqNZgncP1HZfO0NEPu7XlJKuF1/0Ot+PE3j1HAou2jH+Zy/3UYb8SOv8b0Pyb/WQq4BhWJwaCasR1qugLaOea6aZfdeZKGq4ztclpsI0mtQRb/ESnQ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXwX43MG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXwX43MG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so498308f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969031; x=1744573831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDkiZVmg4AIfX8pESt1JXnk8CGq+bjZDxSINRLpNjsQ=;
        b=GXwX43MGn+irBKyMc0jT5DBkrgmAjgNtlRXt8b73D0BjzzJI7793qLLuIqoy9Qp7lC
         LbZ6qvBgCg0fleuN/x6KGA492igoT//xaJ+G1wKCruEZoWVncBb1F2js/G61gFXXHjmJ
         G4m7ZYNNsmgWtK4a2g95ARRjRm+DDy0J/+N/gdbExgBaGmdPhqbK0iUXlLN2yOD6Np1G
         ZFAkvDdC4Bt3BeBDhn7OS7drhQ3tkGcD2vWQLmyBuW5fw+Lm2KOxHg26ExcIKwx4F5ud
         kj6PpQtQLopBGRDDS3cVo0+hWf2fmKx3NrlHzxHEUkruyNBzh95oRlUNzVM6/Q0kBaY6
         bQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969031; x=1744573831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDkiZVmg4AIfX8pESt1JXnk8CGq+bjZDxSINRLpNjsQ=;
        b=ZnfQnw+OZXTQ3GfauJNkdPK0oPGWHyRyjkWq58gFQ2o+M4j4PCvAceLLaDL8G0+DkJ
         UhF5i2j76LKSXHQlewIelLJoDb3PdEHjtItU/pTco79LAXF7ki14knJmCUJ6lfnhPvAY
         H2V2kwxrm7iqPd12gjLf43u/7rETEcxK1gJGAnASkQS8/sj2icZE7oN72jH+UKVeu3ia
         2RHecGdKU/nL/izM0Y4s4rwBIXo/r7lnH0Xqx17Ni45qL9L/85qzOgeydHa25Pts54ac
         KqkGQAdx8CxkOfJfhAS6EmkV/QK4c9eOt49pvCeXRt+43pDyVhrN9INKB8y79BJyxYXO
         MSLg==
X-Gm-Message-State: AOJu0YwwZnzwfs4ihwZ/X88d64d3ZC0FsRzREFrygtIUCxuZmJNL4vQa
	yAtNu7lqyNEZZupyfqJJVVMsrRKC69xs1XRXK/itDLXaRvTRKsqxFtG5nCpTgmQ=
X-Gm-Gg: ASbGncv4WoIhaoVlIzokd0BWsdDxuIOWnkOoIPxFezgT0wTuSXlVnVDaxxp2ZWtrEg1
	onHkG3+1b2WQHRM+oBZhObO+W2zkHOGkk9NjQTSRzwJaem/2x5HrI8QKmC1IeowyYWg9EPF7aQD
	7SkpCVBfWhSVwl/WeCMVGaY3kCAzrF4ATHmmHSaxispTPiQumPUwR6AnNxSskzYEoGlm8+FT0pU
	aIoK0iRidvmZMeOzCnu/8X7bah6+EgkC8F7tw6nzJllfF1SQufhQES7Kb+6gAC8YT3tqi6Sx6AA
	+gMLgod76G2By5ErZDasvRG9cACdjBnbfl4dCRFEGhB/rtT+pAxa1yEKYy6/V1U=
X-Google-Smtp-Source: AGHT+IHLrtMclK8VcZgIu5o7LMvtyM3oVnyeACZFIOpwCRqYoq9QiN4CsiiISvWSu47uMhHgmdiXmA==
X-Received: by 2002:a05:600c:35c2:b0:43b:c962:ad29 with SMTP id 5b1f17b1804b1-43ecf81e058mr30045245e9.1.1743969031565;
        Sun, 06 Apr 2025 12:50:31 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm10053842f8f.43.2025.04.06.12.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:50:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 21:50:12 +0200
Subject: [PATCH 4/8] mfd: max77541: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-mfd-device-wakekup-leak-v1-4-318e14bdba0a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=a9qheLkJ9G/a0gSpyASbiRRdDdncTZ0T8HcY8kFp15I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8tr4AV7Y4qG43E9u6J2PWTGEE8to4nntaI6ya
 qZwORfWCa6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/La+AAKCRDBN2bmhouD
 1wxND/9qo7JsMiyvaVPUtWqdVDMzJMgEyq9td+m7R0bAAg+rPqBziSVJyoxvfPavvBlhMh5iLxP
 3OAD+AKBqJKONv15meWcd8JAuoIOrdMK2XNAWXRe9DubIpaSHi+HhA0yTgrlN59FWZEbKyOY7va
 cE/xYgiVIii/ojRkSubeakK6A1bhzBL3FruTCCFyy08Hw4szbsbJytcDClDYHaIPch0ZKsBQbIr
 XGvpIR7oaeyr3C1WGi78Cc9pM+eV8N8NEij5c0Sgw2/GbWxkua+kfP1uDxpLGbql9XSLxwTGdXK
 2xquKOg2y4tSwFXd1sf2JogrpGJoPpSnzOoPd5SGBw0d0rv59LbzMDK/6ZV0F3PtHml5tqxbRKj
 4+/PDN50j7o5vDxY8o5kj98fi3DRjLO8CH8E6lnALMqeW4TxXVFXbwzawNmn9u3xf12mOcaKhZu
 5YQ4kBZLHgB0UCWi/6HSOAixoTKLNrZGSWwOdQpJzWtRf1jRW1wwSD9eH6R3JEAOkUPWwZL2mGe
 7d9lzPlClC1dHit7y6sjk6RsATVuvzqx279+owl0N3fg9+e9OxQKxeknPV7+/XMGAavzbK4qAzK
 ys5Nok0FktnYBhFf5OLe5EEkJNdBlx4xF6XaomkXyx/ybK60Z/nT6MNq91NVVH3CnRiFpJmB+X2
 aB2ny2dvLWgKBMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/max77541.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max77541.c b/drivers/mfd/max77541.c
index d77c31c86e4356f5c19eb0e1d958d1e2f360f4cb..f91b4f5373ce938ccdab2d473039540aeb408b1d 100644
--- a/drivers/mfd/max77541.c
+++ b/drivers/mfd/max77541.c
@@ -152,7 +152,7 @@ static int max77541_pmic_setup(struct device *dev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to initialize IRQ\n");
 
-	ret = device_init_wakeup(dev, true);
+	ret = devm_device_init_wakeup(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Unable to init wakeup\n");
 

-- 
2.45.2

