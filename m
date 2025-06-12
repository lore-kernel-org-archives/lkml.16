Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850A0259CA5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734376; cv=none; b=UWoTOHwCaN1j53XU6sSVd2g5tRMlJaWwZfRf9X12qMlcohbBISrWnHxwEe6LkU4qLwclbtUcmobp1CFna/8+/DLgJcWZsdSUqq/mtBMEH3LDLZF47iK5MagI4YgIUrKRPRNJ/0zQaEd9M5k9/wF9AH93uIbmPc0Sli1TQvmNP3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734376; c=relaxed/simple;
	bh=U+VHfjy9AJB6ILMQUQ0qFffqkwAiRTp3ztDbeO2f81M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eUvpRodu8C28BArdi5lUgfaef+NWvKvSPmrXogCYlT9qdD+fdx1N1DvE9QWeqcpG/3J0vudj4AqmkTZWC6OfmCLNd+jNst7DrPA+7Qth+dNZRsISXW0WIbNIOcjoOUrPtd9b6Np7yK7qFsnPf4ZZQb/jZAkSpSVGa52a1q+uhDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JPW3hsKa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JPW3hsKa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45024721cbdso8045075e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734373; x=1750339173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg827JIzcSmPeHCx1YI+1bzQDe4cHjKlcxHhkXHwZq8=;
        b=JPW3hsKadFbWK7cTyMnuLWPdrOFXoF0GA236rt5yDIGeznAF/VRKvd9cmt2f1NyVj/
         HTZdfaAU8c3QhTsNGQ44bele2vuYJYw22eoUczhq6/+rKLR1wyRpFTb99CE8pEi5o4x3
         b6CEgH8uSFPZiHxTbHLM9FdbIiI19c+sf6FSqQUElNqg6hT2AtfAQjYAOjrMBGI9oALY
         6rF2wdWV9oIewmKcrgNbylNZkBknvK7BdhbvQcdthSTwv1V6W8VzddNW/k6VqGuQJe7Z
         pIByU+0gV0tHGQ1Ci/vvPYkQQ9++J7sKHDFvgHJh2IfZV4kFQSfSCOrXZvNmY7GgDbyh
         nfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734373; x=1750339173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jg827JIzcSmPeHCx1YI+1bzQDe4cHjKlcxHhkXHwZq8=;
        b=bx53SITrhwRDJnC7zZ5PKl3XetVRSzINvuvVMG8B0VHz+h8YdPGq3/CGRHlZYTFw0s
         jBXCCkp3ie0+4OlQYyzL3IR9DxWtHUbfkeKB3KSP51GgMR6gQdwF29fvvfcdTEC3wfgX
         6FBsjZRWAV+ZBfo9K6LdvK7jvFMtL9DDNsnBE5jA4xPnDMymyOiEflJfmvpMC22c4v9o
         PUfNZa+HpjX60sFvzlUunosp2qOq7IgYzpYlJ1ceXs2mSxjdARPC9M/hiXWsylbEj/BJ
         p+tqY+kmstSPnBLPloFCcvZvyn1gpgMUs0O4GzPbuQ/fZvRrjHxcAR8eP/7QhBAuWLhK
         6Iug==
X-Gm-Message-State: AOJu0YwvTcL6WxZqZXlOKLoKhIY4blErIZLoNgiBoWaH8bZrUbi+8RNo
	BvaiwXV1bZk8LhY4WfRPmLcqBvqSkO2axkZiYSf/uEZeGEqIVM5bW152vyMsGje8l3M=
X-Gm-Gg: ASbGncvNHMnw5ANUGFUjZPw4lmpGH3gJddO6IAV6NJ4AyOr8pSsWiyBWuaKT137aFDb
	0aa7E05jMdxWOyWBezmvawRjIQwLMBZH+uVmS5jqjYf5VahFwPy65QBuJ0ieZoDf48s6eBOOFTc
	hW+DVQKDQZmPwW5/9pCasrwbdLtWHOTzhFIagWstIAjAa9HE3bZW0qHeOava8XdsdjnOkRnumgb
	u833ZOsNpDpDFEcr5xKNsdsfjWB9jyM9SxbMKANwogOzoqJ/ASUX1KLO4afzDv9vTKTtLIifNSm
	amThR0TTts7Ga1D3PXzb/dWui0FqWy+STeBcDaB+fD1IAYQls58+caQ1qKQ+Gxc=
X-Google-Smtp-Source: AGHT+IGFTV3lZUYrB1zFBF6NCNNzPF3gJy0rVp+ATtc+RLbDyBiUy9K0BI8UV1q/8aGjX+OjAmBsTg==
X-Received: by 2002:a05:600c:3b94:b0:442:f4d4:546 with SMTP id 5b1f17b1804b1-4532486c513mr66210685e9.1.1749734372905;
        Thu, 12 Jun 2025 06:19:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e172b03sm20682415e9.36.2025.06.12.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:19:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] MAINTAINERS: drop bouncing Lakshmi Sowjanya D
Date: Thu, 12 Jun 2025 15:19:27 +0200
Message-ID: <20250612131927.127733-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The address for Lakshmi Sowjanya D: lakshmi.sowjanya.d@intel.com is
bouncing. Drop it and mark the driver as orphaned.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..89a321768326a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19563,8 +19563,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git
 F:	drivers/pinctrl/intel/
 
 PIN CONTROLLER - KEEMBAY
-M:	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
-S:	Supported
+S:	Orphan
 F:	drivers/pinctrl/pinctrl-keembay*
 
 PIN CONTROLLER - MEDIATEK
-- 
2.48.1

