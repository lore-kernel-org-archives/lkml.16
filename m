Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD5202C3B
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112189; cv=none; b=foDvw5y4EeklvwRZB6dbYb1o4nDnlQFaKgIok2RKI5p1KCp+9Ktu9vNvlWJAulq455/WDF+/evNll4mLrEhrPuCxUVdz5R6pm1CSUM2+DWvyexpG/pN9ITNN2dbRCq2AUBdrozRNEjWBzu//Fr8Hl2Px0PrasvThBeXLmdLVOD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112189; c=relaxed/simple;
	bh=4OJUaVfhsWGYWCQcnU50+ivFurGc1fBl5lDiP8aAxxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFieGMWhd4autHIR6wjHSZBCELi5Oq4nTL2UAizc3lqSVBWYtwreCxtkipui0hjxMNVRjv3QcR3luTne/sH9AAp6IqFZYbalNIkU99kjQefr6JynpHg7vzC5eHMSfZAaAoG96mMJWq9xpif9acfICasNVZ7Y1PnKKOCDZ5YP8GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0z7m5h4; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0z7m5h4"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-479009c951cso2457961cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 08:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112186; x=1746716986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24aju4vckWNvxc0dYUsOm4ELFTjb4KOrvPEs4u1cqbQ=;
        b=F0z7m5h4o6QNAYBg/nkOckDFdcC+k+2Qf7xLMSnB/zpUrSLpbZDvFAg961gm/ADFWX
         BlP+W2nfLYtBUk0OL9w7E3665he0b1hgBXD1w/kEtP+OjLTpJFeOhYAlCsysY2K/cxrq
         HBv4jndKCPzx7Es3rZDBFJ0nFbrzU1CgS/8SS1JxKCMV4ineyFBo5R6eInuXhxdIZjM1
         hDPxH4KvFBqHjhIJPVMD5S56RezQ5mSQRto0JSmGQdOCUmDLPchuWkHRdWVGMWAf5zUK
         gjl4FkNYeLF6/sCXZf7h1e1MDIZWn4xwqj94Ejh4g+KVmOIXVH///iWVslj6T2EzxjlR
         ceHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112186; x=1746716986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24aju4vckWNvxc0dYUsOm4ELFTjb4KOrvPEs4u1cqbQ=;
        b=SolfhG6EaGGpYGK3k6S07sqG+qvI8E8kC/yjMlQTSDAl+/irmnp1Z/PsghC9xEgjVe
         42oJlsnA15VPAZOsqHQYD+75GhoOxCY9u5uAL1OaVNbxvZFQzHMuLT423++t5zXp3Ips
         LX8BLDHEodA87anCNYAH+RJ0Oj0h7ZWkedCupUI+6qoysVCojFy31a4aB9P6QXRL2zje
         hq0r4vkdcxNO5ZUcbTtweAvxR4fw0swPgSK3abO6aOzrFor2pRf583T4oe1299qIuSYD
         Y3AYkb5VuCNfKYBPg+/km+c9VvfzH8Zr+qXQd3qS2DOfF8mql+TlbPEyfmgFvOdqmC+r
         f1hw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9qVoexIM+ZU/2MX06uDx/sHmX6qBoHOAs7L2XmKRSfAthOxuCpDC/Ghl0LavtE2mKKtI6aDf6jftsbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwObk18Hm460ziKi/YoY0e8B8T/XzrXkXd//IbZiFH9qqXgK7M
	9duxsUtflwyCodqnxYRzsIX9/M20IjCHOZOr891XZgmAsSegHBpIUF9tluq6BPw=
X-Gm-Gg: ASbGncvEML/g67d3bZx/qvKJU/izmDb6IQcuwlPrqvjv6hUZwN0IVXWRQbY5l+nQDoH
	rHrjbA3f9Rha7OGWkcGUfj4A1wQUdwELHqSrdn1jF7M/Xvwm+E4fVdAOzw+DRi4X5lNn/KvyG+4
	9CQuPzOo3mYRHX6h90J+quD/Cvst5AUcBeLfLHBqsZa0CV+qi5++5HS6YNIHu1uTPsHM5Mxeu/1
	QvQcUKG55b68tSSYGo4sCtptEwEmJBHwbB0sWQT6w3tWpPBape70MKqCD0rbdqjesblIlZj+p/n
	EY3WEG46K82IYmrmwFbviK4brIiaJ2cuRGSfVCYFSVLROXC4Xw==
X-Google-Smtp-Source: AGHT+IHHOUjXMBtVL9o1d4OTnpFX0xqq+LhKzYmbKm6TpyXgRkIOT98m3NrxbiBzgdvab9P/+F639A==
X-Received: by 2002:a05:622a:550:b0:476:652f:4dbc with SMTP id d75a77b69052e-489e4d77485mr39271321cf.7.1746112186174;
        Thu, 01 May 2025 08:09:46 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b960cf655sm4823621cf.12.2025.05.01.08.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 08:09:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] psci: MAINTAINERS: Include DT binding in the entry
Date: Thu,  1 May 2025 17:09:36 +0200
Message-ID: <20250501150934.77317-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250501150934.77317-3-krzysztof.kozlowski@linaro.org>
References: <20250501150934.77317-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=812; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=4OJUaVfhsWGYWCQcnU50+ivFurGc1fBl5lDiP8aAxxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE46vBUr5ttc/yCgJJGS2600wMNVyFUim++QCD
 uA9WYamECiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOOrwAKCRDBN2bmhouD
 1+wSD/93N5avRTUg69zdXpT+8IkHJGPrYaH9nAMXBpLVmBTkwDBp+r/VxGN9WlGi0qHr5XIM4PT
 7uJMgbgmSgeSG0KMaVuckaMudzZfl74yrBzZ/gCBXuqoLhQaTohlgZdYQJ1TycVAOVZ6qIpJBiB
 8teuBgNktVmEARCxLMya3ukDqb4OdJSjYEVaNo1nYyCPyKfqd/wuXFqjrcAP2SoF3G/jgCTP1oT
 LoTbMfnnrcqqtAZdMC5S8PoboAj7Zr6mNggckzJfb5nXDhPGYJEhUsPRUfY2F84sofi4V3Xgj/z
 TQMoOw/7nhpbjtIqwb4Us6+ab5G0kKH0uNA7YesyHUbNzJX4YTq7ZEZRPYF0nsrk5ccx5RuRIQE
 /4qv8QFbokNHzZoQ63VqEZxx++L2OHLb+owDU0u6PHad5T7QEbtusy4k9vrHED+jiKeDUkG3OoO
 +COkQadi06wkMvT2LjzarUrvMRc0T1Yq4aC/XaRvUCv0nhk77mYAJMZpliYU4pXb1ypHPw1ydhD
 LUjr8N/pJs4AEXYjPljOrOCSbP+MEe37uVbid+df7eOxC6sHmHdTids1mUgaxMF66NTYGkhyO7f
 8xeedmU3CP3xEnygMNXTwvQb6h2jZDjIyVFFtx1nRxuI+SMFZGwaBIWuDYt5jXtAM63KQv1x33d Wi9S89lTfRcN7cg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Updates to PSCI Devicetree binding seems to be not picked up from the
mailing list, probably because actual maintainers are not CC-ed.  Add
the binding to the PCSI maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

v2: New patch
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131..193bf0895f7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19436,6 +19436,7 @@ M:	Mark Rutland <mark.rutland@arm.com>
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
-- 
2.45.2

