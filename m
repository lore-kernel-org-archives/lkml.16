Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C69026AFB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770396; cv=none; b=SaL5DJX1vBnpvs/mkg6ga4gC4KBpnIojrRkrdPdLZ4/W2fKDU0lMxh+5ncU49WwULHzCiAkKqHpAyxrQEz57npyniAdkLqvFNJZbiwaoeofvaTuEpqr/lA6KMDUiNd47tqKgX733N8qIgc4vZ765smBgzMGbEGrTG7q2twMmEeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770396; c=relaxed/simple;
	bh=nBLz1kTJ8NH5i/Yn/ykHHxiMfT5KmmPCMp7p2LIR8Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kwHEelK3n1fdJ5VYGJeIgoomY4nsEYkUTyifcEXPZvANtyiu2Ae+vTMS1/+iQFy72RNCBeXed1y3IpeX/WyQnLfueEVnXbXeFOW8E62ObG7EVhrV2NxmUogvJ3qoUAdB243mYNOTMGUa1HNaoh72CdKnY9seQQ3sPqDeUlOvUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vqH252cl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vqH252cl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43935d1321aso2167355e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743770393; x=1744375193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTU9ncN4gaPvvWv2/kPgQ7Y0Lxm8sALtBZAAIO+VFQ8=;
        b=vqH252cltloAlxsvD26YYL2wfh0VRR8ytCvKX0opOaOxewYKgo/IwDLUjdY8sW1fmk
         A5Z4poZrEGG6uwOsH8yp44cjI6mgm9tJ/TNwAKYCaOfk6pwdAInMZ8MlpNSQx6pbOfy4
         Y0nJPksq8Sd9cDWie9/Em56ufAtMK46M5cpw1GwpwAV2m6seZVz5afZkWWiZia71+vYm
         uAfY5/qtAGGs9Kk0cKbl/QcSuYDtBzWt4wuRuCqwEizJL1eLIvYRDC4KgyrY7IrCg6HZ
         Rq7Xh2pDfGb/2LQ+bCyiE/ItFNlg0Ivl4JVGfgj5Ckg8bHG8UAsWMkyos8LjxbbKXYmc
         E0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743770393; x=1744375193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTU9ncN4gaPvvWv2/kPgQ7Y0Lxm8sALtBZAAIO+VFQ8=;
        b=EIXAszeMfhB8bzphgNEot2RotmBi68I27OoGWZdKwbIfschuh8zFx9/tgah+K0BHTu
         l2bGUfIT1q1+gu915169XpNpxxz4u9e68YSOOrapKA+nKCCJrG74Z+ATkbbTZI3JFjG9
         uH/Hlz7gQ1o0gq8Zsf7NUVS0kev++d1XAUHM6rZl5SHZyUp03R8XTqbbPVCxlwITrqzE
         Gj4XMPqnmMaIT4B0MSa5sI8/4GwN1ywYwPUl1TG83TCZGr9LjMJdOpBOUUttk9C8Z4+v
         84OumSUCj/ZGX0EAeBAknQPgQeH/1Cnx6j4YeUfq9CRgCcxVMcvjPVcGfw/oi5Bqe5Wp
         dr3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnlEcvSI3ibYGaS+7RpPq2mElYU8nKv/lMFRM/35GHOHolm3z5+O7ZB1xGGswgtN9ye9ybN6iQ3mxaIMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnfH5R8KzVpm10TpGg3Fzm7UgWxt7mtptjyL+9ZhizhZK9t/Ll
	iFRWO6YdB1jZ3G4VJUDZT5xmT0V0I9mZUtHnA4l60PNnT6h1ksmZS5JYf1VUJQY=
X-Gm-Gg: ASbGncuSN7m4YauUmw0B7DSBjotmkG55hpJZEKOFyBj1PN+d5kn60EYiJFX0Do0oQV+
	X5/wt6nCqVmKHR8m2oC9Zdt8a8Wgh8gTd68HkXqaXCwnOkxPpumA0SPkOoms9td18CpP3ubDzvv
	QwWkYlwWfMNHNM9f6joid4DCiZBkPVcdQ2gBSmVRTDvbkuIHIpOeKJE41PUnKnnlh5nXUXPptk+
	ZWIr2hzggdvtBDWEpadT6iM9QgbbFpy7XHWDhRwtab8jEyeFyKfHZayoHPEQk70Am4eCCUZFG/n
	2gIWH8LhN0IzPulOXSrm0pn9A6jqbNan5Mq23WeZzvBdKnLhNQyjnw==
X-Google-Smtp-Source: AGHT+IFE/BNeQcKRRWZIPVRmYBmQ1t5nK5Wr5F4lJXYDnVHNSidWI2olRFDyeW5mBZo+ZjR5fCLwxA==
X-Received: by 2002:a5d:5f44:0:b0:386:3a50:8c52 with SMTP id ffacd0b85a97d-39cb35a76e9mr962968f8f.7.1743770393235;
        Fri, 04 Apr 2025 05:39:53 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d98bsm4261898f8f.76.2025.04.04.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:39:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] firmware: meson: Do not enable MESON_SM by default during compile testing
Date: Fri,  4 Apr 2025 14:39:49 +0200
Message-ID: <20250404123949.362652-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
index f2fdd3756648..179f5d46d8dd 100644
--- a/drivers/firmware/meson/Kconfig
+++ b/drivers/firmware/meson/Kconfig
@@ -5,7 +5,7 @@
 config MESON_SM
 	tristate "Amlogic Secure Monitor driver"
 	depends on ARCH_MESON || COMPILE_TEST
-	default y
+	default ARCH_MESON
 	depends on ARM64_4K_PAGES
 	help
 	  Say y here to enable the Amlogic secure monitor driver
-- 
2.45.2

