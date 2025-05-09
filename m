Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BBF20E011
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802883; cv=none; b=k8vAW4GQ1HLQJbt9Mj0cm1EjBwLf1u75WSG9V5MbOyrCC0KTLhq0GYMEwQq/e2QVbHtPh5KM2gekh8tjiQJyqhWDaFaVlQBwV1ii/PS4RjSJzAXVo0jMXyIzNEGMvpCunTYJTswWbfGZED8/mnpuoHYDNiZlrcPRxb6vmSeqEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802883; c=relaxed/simple;
	bh=OrJwae8l2jh9g4trffYYEvr/eZCG11Gv7r3R6UTzxSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u4rRdjio0Q4abToBFFONHt02TWYKzxtOECgb5/cev3368WTUV4Aza7fJLfPR+tEjYgUgQ4YjaystbSsCWBJJudxiditsd+6JkWitCGWS8wAXIg52QyMf9PsOfI/A7LNdov9yTfGHpERvOJTRXZR/DUEvCv0pk5sPsQV8faSCn+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GEBrV2oQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEBrV2oQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43f106a3591so997925e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746802880; x=1747407680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTkbpvRCkCNDRgtaNpdtouZmnsaUStr5DjZh4PVUoxA=;
        b=GEBrV2oQywcbh5Kr7O5SzAEYxMKoB6NP5O+BY0GUowv6zxPIKcy35H2JHAJw34OsXp
         0Z3PtJo2tebiqkr3sQnVYvYHbggstlcKhpeNldFFvI02hN1ZWlxo0QO7crZoxBN6Iklv
         zvof2vR//CAVxbtRkQaz51cljiel7VQKRQQ2Ov65ZCQ9zm0JLVKGGXdpInhASJW1eA6k
         iN1YfSFuK7Cn7grX25/t1lGkGd1ML9WzzjRBr1zQQEFG2rNo7dCCAOSy2jvQuC2lbpMe
         LmvbzwIHYwyctg/QZpONCB1czS6+vsm240mRjBCLgRJ5djTlJwRToaHqTU/k4Bwsh9Mj
         eN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802880; x=1747407680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTkbpvRCkCNDRgtaNpdtouZmnsaUStr5DjZh4PVUoxA=;
        b=tvsd6pF9tqXOy/3+gz8WUFlfoR0ZZAk0wM5qDlrMfYltGozZszNydL3sax0y5hyLXy
         qzKig9oRTIyxb0Jvde3RWexyGxSDNne6N/0j/ecsdP3bTsWc2vTcbsYJGnJZksA02iut
         b0vH0RYLXhJPkpd2/gHpLsH4gQuQqaNsqvdSanZ9mID+FybbGonolWADKu+xu4N80WqB
         t/6JJHBsjwqn0Uc49mj24CXhgXgyJ/12IQ8z5o4TfK8+dxw4/zcI4UqswionZg0jz2K2
         0rB2qeUzju8Ys+xw0XNpgubWq7DA8joTtcFS94puGQuug91oxtaaK27ohqx0BgwEkmr6
         XveQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8W3EOucEZOdi3UM6jv/eirO00C+T5JENz0G2P9G6jHcP9cB6sf2WSIA1XbcR9waFaNi7ElafaGGqwdSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVAk5aRjnnroiAL3tIOv3FGrqBBKmFLw7sRpM2J6oJ7PnbLjAp
	h2IQzJs5WGb/EfNbLpOYXHMms647oE49uotuLXf2HPKQOYXcMACl5yOoaBVtX9w=
X-Gm-Gg: ASbGnctLwvmvNknLkXHbTj1YZVE7H5yRUQO9DJtxG8Gc8t9ZuqBQClLLSFDUJnAbN4w
	6YEw6C4nSu0jyOn2gAlswsmJQCFJYgODmD+vALD6mfUbXi3a/YR8nn0v5XZQK0O/aezdIrytmWC
	DJuth1Gt5r0lb25wsJyxnz+SpC5mvO2ZQmGlMxFj1a8prqreFjjlxSk5A0mAc/fnuKSIOwqeVd+
	I++nLKkDiAb0crUF2wqByQDsuMPLFeP7k997ynUB/0lAAU9w7mAwQXm4hidS5iHfOXyJxFtjfnE
	9XVH2nVigr+ZkuugiVZww/NxaIkQoKgUVifF5O+TtMYI6DVxyw==
X-Google-Smtp-Source: AGHT+IHkBCNBnWPS/LtBg9S6XT9b0O28ZZRzf7nzBT0Cq35AQorOtZe7qvsosSmWPjFrnfFCw+NYnA==
X-Received: by 2002:a05:600c:8207:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-442d6ddcedcmr10827805e9.6.1746802879590;
        Fri, 09 May 2025 08:01:19 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67e138asm32063275e9.10.2025.05.09.08.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:01:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
Date: Fri,  9 May 2025 17:01:15 +0200
Message-ID: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OrJwae8l2jh9g4trffYYEvr/eZCG11Gv7r3R6UTzxSY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHhi6pu+duuCQJsD1u7676gujslrvVm4Iw27Cv
 36hI4QfwzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB4YugAKCRDBN2bmhouD
 186yEACA393kMv+ucbdEL6lZb/ug65wE7C5fY0na+UddUEAqfbdRTMW/MQNb98gck2H4JelcSfd
 OqvvlLQeKFMdWfdUO18CHwvvC6jx66XVCegvI4JxuvyksOrbdym5bdkndEtsvJU65+czjW31aQC
 bHRORJ2LIBPhhHFt3ciNC419Qf2mqrIbuTdCqXzPCYIAG8lyODGPRBf0LOzsou2eHbNKoe/9Y+R
 23eU21dwJrXTGQTdhZ4qfRdprxXwba89LAlR8QDQCVmK16b1qGaazYtoO91pGXtUR8rzkk2i48H
 Wq9kS0QV3rawviyRjAMKi85wG92NalX7ZfaI2Q5QuOdw7JC0O+0Q0AgxcwAxwRboQ39ip4LqGDk
 tvjnS4C68OSHUa3PX6JTLE+UXdCZe30u4UYdsIcmTTT3FgpzrXkJbKTXqGkK6uF0+3HYoijtD9g
 s+SAVZIrOX7WT9EelETCp43Y3cuWalfUBl6VVgIGPY1QmUU0ATKC65qnVOvh4fXdUuH16PWtHXV
 7Al9PQ3UL07lYL8o45wc9N4eZf11k0Jrxz/Y47WdnpUfH7JQ7PjUOs2+s+zD0+/QCmae9q45mJP
 YO9URaV6sm2hA0MKrtqU5s740gHW4t8rdh2BT/QLHRUNFxURM2zBsHQbIpt/eXKgkE5r6+FATnw Lzhd+0AQCGwUKJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

aml_pctl_find_group_by_name() is not used anywhere, as reported by W=1
clang build:

  pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group_by_name' [-Werror,-Wunused-function]

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index a76f266b4b94..385cc619df13 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -596,20 +596,6 @@ static int aml_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static inline const struct aml_pctl_group *
-	aml_pctl_find_group_by_name(const struct aml_pinctrl *info,
-				    const char *name)
-{
-	int i;
-
-	for (i = 0; i < info->ngroups; i++) {
-		if (!strcmp(info->groups[i].name, name))
-			return &info->groups[i];
-	}
-
-	return NULL;
-}
-
 static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
 			     unsigned int offset)
 {
-- 
2.45.2

