Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6F022F14C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564101; cv=none; b=EDxo6Rb9o8nhKjVVz/DrfLPUtrNYOECBYigAcCdgCScgPbe+Eb9kH6WYkTGNV3zIhwZrv6Pru4yiMCiEknZUSDyswdOEHeUEK+BRuU56KziLGrgPkLsJ8XsaYK6btXgKAG5uAtG9oBeZ+DwWRW3iViEN28SA8tsB9FUPkOAH4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564101; c=relaxed/simple;
	bh=Jc+rFucwagITVejvWsdUcXv0ICsgBsOW0bOeBjyNcZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFysi4MA8lVXifn+UjD4h0H+j7f5M5Q1RN7VIv2u4oXUMs2cb4HmsCDgYfO9ZaT128seUOwf0yaEZTTEc9UopJCOeMIf+5fjZVdPN5qqpeKG8H4H73xMj0E0KId+q3/mF2PNLn1bUdo6RnnA9omeUMqavmcw9YGC+yTah5m+RQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VN9RGo4R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VN9RGo4R"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso2388205e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564098; x=1746168898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoOrc5kvqzdvNTiarbnictWUOEWhAWEFCVfxauerpPw=;
        b=VN9RGo4RIRCxfLLl2ncB2oePZ+bgwsD1wya6xkokZsGVxBfDzRhmR6TuQPkwmb0EP0
         7y8f03xyUwjHorD/XDw0rGG/T58LOnBvvadV6Or/6vkTGAH98y7eIwR83S9lTzfv3veA
         bj1fxZ/4pNbQEH2UWbQxZPbIpIdH/D0gxXIKtp18B+jSsp2uqQSPfYp0A/fQF3buSJ/m
         c9zqAspGOfhanptjINQkXqSe4IWAJTdWRwmizQ2Ob1wLl7+oZPi6Ny7E7RkdoWy7x6NY
         vSBms57f0wrMlLuTQURVhiSkCXCBSHNUIMEr2sBhbnmLlpZ6BSY2MAjLiKZm8F5EFa64
         UD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564098; x=1746168898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoOrc5kvqzdvNTiarbnictWUOEWhAWEFCVfxauerpPw=;
        b=O4q1vLesMPZpVnq7XKTw8ZmW1wqTwDSzBzy/yJRQTENu+L6t5v6PJ8O88uvOAAPpwo
         veJ8iUnydp5b5aL7h9lzrkAZ6DGwYNkhY9i5V/2h586rlXFJOBR9UTaVonx/vwZ2didM
         mMJhyZtiwjknkqVxIQJznF0gCV1GoeWrQqLIlo9AlWdtTg+A02+cYCoYntHtXoVz6kHQ
         TloW/YkYGqQTihhJb9qIqI1S4DRKF+fdFo/eT4v+bTZHxB/YSrOLZ1fas3wLLN5b2str
         uvfp3diV7f6gZhtu5G8B8Zxd0i8iNfsfKl890+ISd1vLcZpY5gQAOOx5nkNL2F4BXE8I
         lQ8Q==
X-Gm-Message-State: AOJu0YzoWFEJ6QJw93K8922G9i+Ieu8pKuvqq7po6s8g1gGqiYgIHVqI
	0ZxZvBCZYEMhf3d/tc6bnAE4B8GW8+aMncEMaN3Rv7JzDZKNphYVXZiGOtVjOOc=
X-Gm-Gg: ASbGncvSDlETM5rjsKsSImogH6SZj1UaIfiZDTUUCVT2DgDkhorfU7AvlmLVSjQWkKu
	FP4CqHDLlt7COvetA8rmZn+pbVQplFWEOfJ8Rxw8A8w7mjCM1AhBzS4FEO+x7QbqHZnnV9W5EGg
	V9qGXWBmDpd3GedMZs/0SBe1JzkcCOoyB47QskrSgXYEV2wtfuObm3Vz0D6EmwqBTBvgf+SLErN
	lV9tUBO7CmOimZBUpSmM5w2tCPQ0DlrTZxdHrlIISQ0pZ0P8TdWEBGUdzSs4qXUnpBbd8U0FOhQ
	yzPOvvSsJC47SGnGTQga+1IrcvSfkcB8Ub2Nf2jeCLwau//h48dmrJdGw5E=
X-Google-Smtp-Source: AGHT+IFBASAPywZCcw6T8M6R5Pv2fLcqgM76hanbhv2j8hHrX0q/y4u4aqnd0sC3iK80VJ49mQretA==
X-Received: by 2002:a05:600c:4f05:b0:43b:c0fa:f9bf with SMTP id 5b1f17b1804b1-440a65e8ed7mr3120685e9.3.1745564097816;
        Thu, 24 Apr 2025 23:54:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm14369405e9.7.2025.04.24.23.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:54:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 08:54:41 +0200
Subject: [PATCH 5/5] cdx: MAINTAINERS: Explicitly mention Greg who handles
 patches
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-cdx-clean-v1-5-ea2002dd400d@linaro.org>
References: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
In-Reply-To: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Jc+rFucwagITVejvWsdUcXv0ICsgBsOW0bOeBjyNcZs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCzG5cDvxLPcIgZBwjvKwki584i3yHuN8VWmLs
 PQHkiwPOVOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAsxuQAKCRDBN2bmhouD
 16m4D/9eLuS+B7JY9KIJ4D8r4CbhWt2H6GGsfrufoOJ9bxx5xv+r2MEvhN2LKwnaySxI2zu162E
 MEpwOXVm/LQOMNFjGJQNfk/WYYPdGWrQmfg775pYeXAxjyzFkZ7ga6YC8EiYeN/FPKsMFKs9Zee
 dIp4l/qWvyDXnCF4SeZkYGy4FbWfiCkO2vjXLM5mx71sspvjUUtNPKFNJ38amSAmTkBPA0+qrit
 Qis94j+GK6o5SQDm1FraTJaB7Y2Lm9YvALl1dQqCXGJp686zkmmgNfxc4juN+9UQfC9QDq9MwsB
 mk6xCW0gyYAXNxr4ERBfiYTcHLawgjprfDqauEyIG4b6/CWf8JwdAsmK5+wJImCBomy3j7/ajYl
 ntALIp0xv6H6N8/H6YkEjmKKc+GxgYO0mDzpi+5RA6K0rvmve/VuQhF8zVoUSGfpn3B7gjHBAYY
 BRdW0l6DesxhhataARLar6N654IrMJHig9cHBQ35PHHObwYSy64cLnfO/Ap9PMMXzQe+0mVctA6
 HYoC7Omi2CTil53DTtEp00+Bh5KMNsVQ/NYR+hqgFKsVZBgKLlnkW/HPFtiM4dXyZ0EtJBfVjpB
 HobgjaIWFdtOTmD4kF+BZSjGyzaxo5WIKQEGa4Cc7pY5DQ29NDM7hiPHZ2A01A0HamHxnwZ/kby
 TZmNjvsczlW5Vrg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Patches for CDX bus drivers are applied by Greg Kroah-Hartman, so list
him in the maintainers entry because otherwise contributors would be
surprised their patches got lost.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..505d7d45ad7d1c007e89a555264ff8cbeaf6e1f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1008,6 +1008,7 @@ F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
 F:	drivers/w1/masters/amd_axi_w1.c
 
 AMD CDX BUS DRIVER
+M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	Nipun Gupta <nipun.gupta@amd.com>
 M:	Nikhil Agarwal <nikhil.agarwal@amd.com>
 S:	Maintained

-- 
2.45.2

