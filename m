Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1CF248883
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745751082; cv=none; b=BqaPQldZxGaCeTP/Di7yihcwwZqM7hoDBgMR/0pumMlSoqnQXXh5dxbkA4wbqdHpBo1IR7BUfHfCAVanPA+LdUpWEcSY6bqrRVWKmYM2vFROOabsouUSMzuDHtaNpzsq9Gho43KB3KHvO2WtVa08sZw+AGi61xTTAUTko4cFSfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745751082; c=relaxed/simple;
	bh=VBNyX+A/EB/Cj4qU0XgLHNxhJ97XrYmyCZDdhGUIJhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=peU5Gsek44jWrJWtmJDn6QS3NRX6wEdxvEGQQiYKDwrg+qR8LhvjY5qYLEwh4LP1NISv0b3ShlXRP514jAgtNTj7jtG/hqbU6qY5soFTj4qvvgkouMlVGTaT6NcqkEC9b6EfpgI6hmM29CUpBouY4xUEVeitXBu7J2xz8ji/ryE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCLo/6n7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCLo/6n7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac339f58631so45767966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745751079; x=1746355879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yljTxf0X+Iy2a+Dq+Yedd2V84jdSSx02dCrGHjuEXak=;
        b=mCLo/6n7YcacJpfy8sZkiCzpd5Yq/QVcgQOcktwXnQndQ4AN2/2WHDmER/KUXDMZB9
         McBmeP9g/lDHD2Q2U3BiyKwMKlKyc+AG3UWexEytt0BQ1EHGQORYehIu9z+XV30CWgG0
         3OrdfE3T7sKNqCPFoxJuKsAT+k3e+d4wCIycJiZcbj2+i0yTF66mI7sadcKHbUtqVIv1
         TL9Oq+m4Bzob8bRUwAdif0lSN6Fpcp+t+ev668rxCIrOyTZ27ax+sNvPEnWEp44Rd7u7
         Z4f2CQsvPmgO2RMfL83kbSFrNAxfKgvZoDzVxEbD+DwbiH2N844LYwjEY7Ukfk4AGHhW
         vqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745751079; x=1746355879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yljTxf0X+Iy2a+Dq+Yedd2V84jdSSx02dCrGHjuEXak=;
        b=uy5S4HTfU659tz4mJspuPO6LqECJEmmbuR36E9u7GlFZkf3sTjXW0gmEUg2hd+Hzeb
         9JCEdVjGgGX/X5H8p4A948+jVMHSCIbIZsiYS1RVh2E9fatiE8qRQF0bsw93Uhjbg4kj
         E0vkylGADTygzoUCby6YYPaEBASn8IifVDgHO9O89QXpwb1YsovczkzzJX6TeorGv48G
         l/P6WdfkH9T9+MR0L1LxmVYcVBuUeepeArWBWkuyWssDu94UKAkyYKLN3Hqk1LgRsEOc
         J73IK9Xy67MGdQ7c8w+EDJ1InfHGKR2qLtJKE6d/80ZATzxzyhqW7b5jO/peX4Ff+uqp
         vGmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW2Zmch3CHxXBj5AUgQ1bY70la0Ar59Dw/GNJ2VX1Chmvh744XgTlP0kaksQI2s1+X1nFmNOguqalCi3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUCiz+vfrrJHpT7hSQYb/cZCUioQJ1LUx20AIc8XjmhTklJULN
	Y444kpQJbdJ7pJXJNB3fh/ybzBYxYrjyydsvoNiG+ynDfbOavYp5dIhMR6+phos=
X-Gm-Gg: ASbGncscIROMgwVb1ibjDGlV4mUxME2wB5fO5E56q+c9lrP+LupE3G5mthc3HzCSZe/
	0N29DmaYLOxdXhGXxXaAYUD/i5QZTg7EopKKqMDHm8ZDnbDOrMZy60CU91fWdVSUwwWSt2652Nw
	P8Ym6+UPXaf4v7bQFrDua8VCMDLu2erU0r4sJB1C77OemTM+Fue6tWfMtR37J09kpRsMQbpBVpq
	hT17uiCq0X2JbRIs9a41R/F9JKCe3++68dWyY5rYLEMwu0PLOiuPuO/2hf7B5a9JnQwPGiqzwvm
	cOaV9V+moIBCS85bEmO5qA369vqHh/AXwMVggDjFyinKGuDcaA==
X-Google-Smtp-Source: AGHT+IGhMTLffqdEgqGOe3aQqJyYJ+B8VJatnZKsdwxT6z/hpa0miMBIbPX1H8NsL96ToaFl+7ia4A==
X-Received: by 2002:a17:907:70d:b0:acb:7dde:d88f with SMTP id a640c23a62f3a-ace710952cfmr213755866b.5.1745751078562;
        Sun, 27 Apr 2025 03:51:18 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm425679266b.73.2025.04.27.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 03:51:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 1/2] ASoC: codecs: wsa88xx/wcd938x: Drop kerneldoc marker from inner comment
Date: Sun, 27 Apr 2025 12:51:06 +0200
Message-ID: <20250427105105.18164-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2016; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=VBNyX+A/EB/Cj4qU0XgLHNxhJ97XrYmyCZDdhGUIJhA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoDgwZBz05ULqfGRWDmIA3VjNhzumOvxtTsbMlY
 dg+5GjAnS2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaA4MGQAKCRDBN2bmhouD
 15QJD/90D9EKpDVCJB3Q1L4eB3Pe5TU6dT1kGsAhZA+Pqf8oYw+k73PHzJOhdzxDcYw7Jh9APL1
 l0oPIwaq4Ss64RIt/2aX/hGXvBLrHLd0Pr3GtCvJxKa3G/Byx41Tjnu5L8IvKapft0iG9SeN2RR
 ZuH5GgxAf0H2j2r72Gq7SmxRm4T0B+fo3Tk9jcjx+2TExtvNy2/m9g+h1d3kSHGJkdC8yZILyZp
 /61MQ0I9T0hbCINYxg2LHvjmdmaVu4kdCSqTiFrltzPpFCFOfuB7uBNtZUd7u2hnN0Mb/cCCIio
 i/PftL0i2+SM3Qd63HLxjKKZL+28ztNL+e4rStAeAiWl+pUQngfGXKphkywZHjnVivsHmpKgGLL
 1R+N2W+dUj2TEAJnig7cEdtFqGF3EG+6brrpLNziAywA9oCF+V0dd0yka/51q4CKBWUBZ5hsQby
 8SwhWV6YnMnHr7WxQocZmHQNBSXZnT7dgkb9avwz2jg7J6YwhTJ+ZdTSlxhW7HIK9Jb4Z9RzEwX
 YDnrub4G93/Z4Ic4nEf3txXJKLJOdYwt+4QMhE8My4n4S/EVAuG2hWXQLjLqYyYfYx1ivv9fxzj
 tG9wxyJ7FtfBwbBS0kOyhp8H+BVPMPuWphQ1XRpxi6llC85FdFRrffSYg3Hmz79FRGP6w2l7JnC dbEzfqOuSPOcfLA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Drop the kerneldoc marker from a comment within a function:

  wsa883x.c:1402: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504261851.TJGZIvtl-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 2 +-
 sound/soc/codecs/wsa883x.c     | 2 +-
 sound/soc/codecs/wsa884x.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index cabddadc90ef..e822cc145250 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1225,7 +1225,7 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	if (!wcd)
 		return -ENOMEM;
 
-	/**
+	/*
 	 * Port map index starts with 0, however the data port for this codec
 	 * are from index 1
 	 */
diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 1c9df7c061bd..f04d99c66f33 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1584,7 +1584,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	wsa883x->sconfig.type = SDW_STREAM_PDM;
 	mutex_init(&wsa883x->sp_lock);
 
-	/**
+	/*
 	 * Port map index starts with 0, however the data port for this codec
 	 * are from index 1
 	 */
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index daada1a2a34c..fd6ebc25fe89 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -2085,7 +2085,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
 	wsa884x->sconfig.type = SDW_STREAM_PDM;
 
-	/**
+	/*
 	 * Port map index starts with 0, however the data port for this codec
 	 * are from index 1
 	 */
-- 
2.45.2

