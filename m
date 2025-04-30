Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04952609CA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038509; cv=none; b=E5c3vmPEZJpBwXtkyHOAkyHy920TxJd4oAKIbCOV3ObJZ4CaIhJaDbOcso1PzVvuyabc4b3cyJBbp82sXDrt/poe+tanAeKtzo+iSDWp++1nI+KfXHDrgETOwvyE54EfFUReiC45+SXz3iULAfQ0HlqFMqXMIM8sKbgxEyDmcgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038509; c=relaxed/simple;
	bh=VdScxxYwI0VoeKxBPwPGQrsVDAAxzP9pATm4OBb3UnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klzy+s8XWK8rBWBy0LdBDO4X7Ye5Jvbnu6PgiMkoQHIop9odckjyQdqZKBL6MRoK7dOCU+ydhS3QjdPweSte9Nqn9Z9G6vydv2g6fCtaLCBkuaVaUAjUwUMLpljPCzcwWvUmE1j0FjdLiPHwa5xboo6QK9hMo/Ou7twRhUSQzaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ms87Su6y; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ms87Su6y"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391295490c8so2402f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038506; x=1746643306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFu0tYebHc+au7S9kqolNvPBWjNBLFeGMoDZEf6/GeQ=;
        b=ms87Su6yheoZxEmGJUJPtjX2tDj6bIGufcC7e1Er6Q2Ppc8rRz46j63SxGH2JBH4XT
         UMbRGhgQewNALSqaLeHczKMs/5NG5fKGoMpBZKiEiOZE43Idmnz2r3IJPWI/b9I9Lgez
         OjokhQfViLLsYH0L3m+4J6xaDnqDlJBDR4T/l+UPVvlBtJWNfNcdkiKLh60UCJtYkEGM
         6vLXW1UN0jgSkHQOyEnPN2r6UmgR8xXwtk8govl4iN9uAuukCvhZ6SgacWJZMC45MPv6
         gO5jacU7fcctnRqAgBEq1ES+2WZI8RMpILsJ2YyV0MXL0YM+sdkN4LFLuhPfTc0gJizC
         KR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038506; x=1746643306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFu0tYebHc+au7S9kqolNvPBWjNBLFeGMoDZEf6/GeQ=;
        b=Q6WMU+temDQqQd6zIayrzK5yT7msi66LuPOoPUH5t591rRGuYXwV6XEXNhXkFlXkxw
         zrdjJIQvl3RzDxXU6J3qoAiKa78f8KGr2a1C33ZNYiYJe0HwtJ/OQkD1Zy6ajzO+/bZC
         LD9lmbWhOeCiLxjxUt5CyUtS1KcfCup09Tfpmc1T2k6xrv0jK57dfEGFdkeb919IXp+f
         fOmpFsMZTygr3WPRBnwFvItnqa3XKHNzystBUnfF+WbuaQH2hdAODoUq8Y9Le0beJFv9
         b7WpAQcI1nUJXkyQu9tctTilH57x3Y2ALiiIMhvllSXzEt2/HAcxWLc1uK/uKRX/M9+4
         SClA==
X-Gm-Message-State: AOJu0YxfovVDkKXRvlPCqy118ThzRiJ67y4BIkqZlFysGN0opfm264Yl
	JLGsLp/q+cDqUYyCcIaRcwix6VP22OYcef+tvR4s2GY2GjW1PjYzaGN5sfjs3exfjJ8qK1QQC05
	x
X-Gm-Gg: ASbGnct27zdSvKEeRv735kwYtlb9k4mHkXxOLu1YlinZMRrc5nVjNXo4oBlME+ApzcG
	xt4LIzK9duWpT8TaJLSNoDAWiK7akLKmik6PyGsUXp4MM6Yn+5mjPJFmFG+J7SuRIcBtBMKExQk
	DpHNoAQAVpCOYOh8xmmOd6duiPFwMwgdWxqEUFqPEXlP3AWZn2tXMxKIYx4NxCMqO/jf3f1YITQ
	KAnOPPGVFO8qD37x65IoYqPJKGIGsfX+6LE0W68FrOTiZePwlzEYS3I8PtAoCNdcyLHsgzQUc11
	TaVciaMq5HjlOIhTgNRMQtxbyUJL7mL37QoiqdsEPXSXumLQsANd/7gCHg0=
X-Google-Smtp-Source: AGHT+IG9Bkpd+/kScOVF5dFeiD3otJtNzV7g+3RXwicanWursFKZHiY50X4F/fbMCX07j/+H2U+zfQ==
X-Received: by 2002:adf:a11e:0:b0:39f:733:18fb with SMTP id ffacd0b85a97d-3a09007d82emr1016928f8f.11.1746038505850;
        Wed, 30 Apr 2025 11:41:45 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46257sm17728991f8f.77.2025.04.30.11.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:41:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 20:41:29 +0200
Subject: [PATCH v2 1/6] cdx: Enable compile testing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-cdx-clean-v2-1-7dbfda9364a9@linaro.org>
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
In-Reply-To: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VdScxxYwI0VoeKxBPwPGQrsVDAAxzP9pATm4OBb3UnM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEm7gl6xZOTMTHozha9YoWVRCc1LKIhfYN9Etx
 Y5oi3iHsl+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBJu4AAKCRDBN2bmhouD
 12XMD/95JkTwMcRRfR9KmUgdYnERT9ngt8Hn65qbYGRiOGR/Ewhj8Sk6oRJ6JjyroYNWGGKkCxC
 zARjCi0g5UcP4k47NSfk6633Ou7mMaaqYGSS4M+zCWTVcrlAbaLsOkIPrmlTxSk5aRxCWjqkz8Y
 bw6fQ9xX/ZQIm1bjNL3GHcc+0UcstRAd9y4L1KUz8KrGCoX/CBFQH/qHF/jiTrpPeVZTPD/QH8B
 oFPRdgA2iN5+yLxzBfEjLpOvZhc+yElCaH/2A+qO5i4OTkmgOdT8dlrgyrNErN0N7iaD0wrt5sA
 +W2BS5K8S4EEDpLOXPbS10eN2um0RiLmAwSChuxi8LPahyUx81zbf5uXHxBHcOYiuk9YjCCr15d
 Ju3BN15cbwnQmQDxj5mpsNjNib6B6oazcjKUDmTmgJxTaS0DMxo0jzqw06036ti4zyWp4xPbjza
 0t/tP/u6Jkz1W0VDtArPFtwXeehu5Opfj7M5xz2Y8fPPJdlbx/trm0OcrkcE7/BRMjGCFzdD9kx
 me+oaCRUCfvVqitfIQggl0RnWo7RTcH2NEeaEqTtrT27qATY5xK3ARtom0dNusH/hxkWwPyFjTw
 wCj5jRN+oIj969T7QXYfbFKV5JFz9aXwEo8ggd8ckG8ZpYkNKrqcXr6k0dEaHyJbTgF7eOHGQeX
 bpLHGg6vSQgCtxw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

There is no code limited to ARM64 or OF/Devicetree in the CDX bus
driver, so CDX_BUS can be compile tested on all platforms.
CDX_CONTROLLER on the other hand selects REMOTEPROC which depends on
HAS_DMA, so add that dependency for compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/Kconfig            | 2 +-
 drivers/cdx/controller/Kconfig | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

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
diff --git a/drivers/cdx/controller/Kconfig b/drivers/cdx/controller/Kconfig
index f8e729761aeed03302d6c625b74f5e54bfd1bcbf..0641a4c21e660833efd9ac05e9431b58aa10ec03 100644
--- a/drivers/cdx/controller/Kconfig
+++ b/drivers/cdx/controller/Kconfig
@@ -9,6 +9,7 @@ if CDX_BUS
 
 config CDX_CONTROLLER
 	tristate "CDX bus controller"
+	depends on HAS_DMA
 	select GENERIC_MSI_IRQ
 	select REMOTEPROC
 	select RPMSG

-- 
2.45.2

