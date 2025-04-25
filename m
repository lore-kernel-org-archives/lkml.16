Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD822AE5E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564096; cv=none; b=Q29aruJZd/7k/EjqYnpVad1tWJPsDqKTllIcQRHNlZMegb8hFlzHF15txPVhy6nLQbaLVRNouWE1/qiNTpzQtLQr2JECtbztDxRvvb5+IJje/cXYBQgkpVyQKPCr2basDWPQjBuEIW13Hk0StWcwlY9ckKJDkdroPPAA5y87ciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564096; c=relaxed/simple;
	bh=ptl1exx1qQALj/Qb+YUVofmPdWiXB5L8zvrl3HVi5sI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncoxKeyyOLWReMZDHIGEJezbJYCXii1W3VR/PYkIM8lSg6zJMtcRHKQ/Ce/hm2IR6Y/LT/vZYCsoqDxHaUOn7Vp91Tglj92qSRBtMjsCIlt91+7TGFdUhaqyt9LfjFm72drdFNemsYfwnPMN7TqdLekPdiQ8ZEUhzzBr7ISuoeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I+jiypU5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I+jiypU5"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39127effa72so245254f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564093; x=1746168893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhhrDQ+Dyn2uxAcXFsQiFcA/LfHTAXeCWE9ESbIXjC4=;
        b=I+jiypU5AK/0MitV3SYItSWSnFmmnLB+gr7Ox0VvJ5nTal/CBzGJ7RRYG7Et+JLTYI
         b27nyvQzvB4cXqsDWlV4mwNQsIYi1seCaY3s2kryCKQTSlzS/8dXmHpjvanN7WCTc+gl
         mnyLAxjzcUura3CkBvRzLyXkYBGf1mXg64V/TkxO9tQUJXYkVy1K0TFJfZkl73nIc1ny
         l1xVmZbGm+4G8Jj71eGWWEQS8qaXMzuui5FhkSn7uAfWYuATfqsQIqUbl4xQoK/fts7J
         2m1sGHOZOl38ue2S6zm/IbR0E2eKntYrVckToJ3BEXRBXat/eFQWzc9/k5ewv/4vDb3N
         j/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564093; x=1746168893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhhrDQ+Dyn2uxAcXFsQiFcA/LfHTAXeCWE9ESbIXjC4=;
        b=pAV7ynON1RpJFOZFSaWFpefZ0TQKshuMf+lZ0RIp8uxLuCNk1VJEnA9y/FKuyDUMi0
         a/ZyZFOZV1fB/9pn9J7CvEbZ1fw7HBeoNRtnTMpSlyKGYWOLnziIWHJ5AjJjj9TQDqbQ
         jHQ8+Hy+mPgnWQlvJe5nm7RJE3ZFFbxH2t7w5dwK4hMUjs39vvDR1VVkHJKg5VToNY6w
         qnA6KDFK2Wy3291i/YZFwQBpohw2WxffLeqpx1S0Klo3dTT31j1YyOg4x2H+5jkWeCbU
         9gfuH0Ffn+tmysuItlECeMqOACFOfLixAbk2X0pOB1MMDENPedN953PBWVvEUaxugGDb
         IXcg==
X-Gm-Message-State: AOJu0Yx2wR8MCMT0KQGpeDNAsM0+wec1qgr21grKMpVLlUIMNFNvFuRU
	NrLWbUuSOj5obbUR4zmJOrlkFnifoSAgGEHtAjnbZoU7MSqbeBa7XBtlZ35MRwY=
X-Gm-Gg: ASbGncu/nRL1jQ3zIbHimn5birejjVyAc1MhPVWQpYvu8P6hJ2vSmpd9/sns3gaKrwu
	JOJ9OAP8wSCtBw11BnAWJejaYHchOYv4wGSqnJmziI8+UzVLvlOAsqAptRmo+RrS4P+6wbS85kv
	Z4d+JNFmQcYNIol51/sh3KqFnLEI9Mjm7hoL+gCankAqCk+QzD6e87mi+a7nmsjMRJjZxubvooW
	BRkOblZDMp/CDajCq/A5V4J8jLoUgIvYqyXpSU6NlrQMK7wXcMXyH85TbxpiPtCnZHpk2a2WF6j
	7a3EzetQPevgobK4Tqjqs/sdvmpLUacBcOknvaC5vV9K7iwtHGkI6isNNkQ=
X-Google-Smtp-Source: AGHT+IGo8T0rIc2SUOoZ7y7/Solx2CAn1XdBpfjoQTduj0YsnjkpKIf6MewEbtUT4I2lZHwr5LpoFQ==
X-Received: by 2002:a05:600c:4ecc:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-440a65dededmr3045445e9.3.1745564093410;
        Thu, 24 Apr 2025 23:54:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm14369405e9.7.2025.04.24.23.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:54:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 08:54:37 +0200
Subject: [PATCH 1/5] cdx: Enable compile testing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-cdx-clean-v1-1-ea2002dd400d@linaro.org>
References: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
In-Reply-To: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ptl1exx1qQALj/Qb+YUVofmPdWiXB5L8zvrl3HVi5sI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCzG10J1FmjbBiFf8ZIUQjZIOQsPuX5/RB5BzR
 WNK1uPIpcqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAsxtQAKCRDBN2bmhouD
 12GaD/4vK6r7hGaeFKUObDbNCqNwlpuguWLhYP+hdSraTEn6q4IlXi3KYb2bITE4/WUK6F2RqrC
 2FLJqZ0WfiZlUzEckf0TegMCeLiYwmJZDql7ULpEw1hCiZKFQGEAjxcmjRkpq7CDdCks67uHj9n
 89ZEPBkAayom+xfzNM/HvnuHjbblTEeXrYgk0OGcHaehSkRCVhri3HDpCNMuH//1YTnvvrwVmV7
 dreVmOlxJa+IgqagY04z7jtJnmqVz/4p3d/cj1mrzSZUHau88ljcU4IdDNl4utFPD69jSal5sxJ
 e7BHIs8E93YMJPe/lO4vZhCnVxVErCTDYV3SulkpF9l3UVBnCcMCj1y5vwWXOZqqmdnRvK2/uIJ
 ngYyCw1/ak1SxpwIWmVDPLs/5ZKIdZahdvmfhjtpuCMxh9nA47Mizka/CUP8YkknBjJ/jrvOFJD
 ERwIpU80wWnzC3HIcrvLULwaqV6T5KBTSyYMHlYSrZQiyufYgZxo3dWXCAW7CCvIhErrq/tSkh5
 7p1ThD7uFrQoysoj7tRogR8L6h/TXtvSZrpYL3OjW+vd/wuYQDZ+s+g94elIk3IRAilqquyJhTN
 /ia7wCJzf9biUPfPaB4OhSIpbVJ56HEyE+4lapAz1ql3KVVryAx1Z/XHrHCEyFB8mNaFjtuAA25
 uCNf2OelZAr6s0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

There is no code limmited to ARM64 or OF/Devicetree in the CDX bus
driver, so it can be compile tested on all platforms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cdx/Kconfig b/drivers/cdx/Kconfig
index a08958485e316a1a3e00390d90c7a9eaa518d0e8..1f1e360507d7d5c33671c601534e82f2d4de0424 100644
--- a/drivers/cdx/Kconfig
+++ b/drivers/cdx/Kconfig
@@ -7,7 +7,7 @@
 
 config CDX_BUS
 	bool "CDX Bus driver"
-	depends on OF && ARM64
+	depends on OF && ARM64 || COMPILE_TEST
 	help
 	  Driver to enable Composable DMA Transfer(CDX) Bus. CDX bus
 	  exposes Fabric devices which uses composable DMA IP to the

-- 
2.45.2

