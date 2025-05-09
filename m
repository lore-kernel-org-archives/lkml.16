Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12F2110
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800696; cv=none; b=AQYa1x7Zc1AINUZC26irp9n+XOt6Y7nKvALkFmoDgfW2jPh2+2llSQVy4X7JkvoD4rEO8s285eFih7+YdZbqz7rutJNr7FkDBWUawMQZhL8o5sW1UAXKeNURjDdjB2SL3ekOXYykXSDQIX3bslDtoJiLNf+lSmzBgS5nWfz6HIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800696; c=relaxed/simple;
	bh=Oios4K4gn809NlI8wxV94RhP18y7M2JRVZX43AU2iyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IKSKqmChNm+SQmo+LgeTxKGGlK6iQPI6N1O+XLSRuGwMvcq/qF0Fy4RQS+ZT6z/+AFJHCvGi2P1ZEumccykg13ed7FAl5/OVr1bJWzwhXCzVtpQ46RlPCRiKqcysIM0Tj4d2yrzNWlsrMCi31QNK+F+WTVUFUMzaumwR4ex83+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdtF+M49; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdtF+M49"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441c0d42233so1112085e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746800693; x=1747405493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxJU1Cz3jJVYeXW26eIBpTl1Qq+37BMl98n9vhGDjsw=;
        b=cdtF+M49XdGEHY32Z5NljDvcVh1m7kZnTaIigulCj6W+wmIRV9zw5NQHN1VdJSnEt7
         ypi6T+W9WL+8a3nFV0NpssZdst88KDPK0hadBt71tTbIoivMyHJpzEjP+k53/fTgvg2Y
         X03n/Lg/bmPog6kUZiRKsFTIT259qj5I3ns8ZKPHhXEnA3CMey35KCheYTeuMZhy6CD6
         IM8Itt378/eXKpPLHQESMO5T9MY8g1HPWzg4Rprd5jdK+3ac1i6S8p3Jsgq++wMvvvK0
         11nZVXBrFskgkARIhQ3LuKCLc8h6L4Wq4HdEdI6rIjOnVX36W7lwMLAjDAuPQp9ram+V
         dFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746800693; x=1747405493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxJU1Cz3jJVYeXW26eIBpTl1Qq+37BMl98n9vhGDjsw=;
        b=HpnycBkm/6FfAF4G5z05mISYCLYeuRIEQ9/d/2a7B+/d9mO86siUUjN+Jvc2oJZ9Ru
         Szau45FZWBzqwGwpBHNVUEuY2VLbM7XGfYHYD9nMKfvfI/z8gswvFKer7m/qffJjaklk
         pJhldL/US2PgJoKvLEU90cp4muH8iwUn3BD+4KGzzPU7vf4Jboj2vtyJyIpxkU2FHB0P
         DnkTFPTHRWZz+vHpsfK+Xk/63W2hnnIq6f0YKahV5zX0Zw9IIUH786tgnE1+MZvBcL2T
         SeHcbbeR2K0RbpTgrfbm/3rUgKoviuj5NrTJ7pbUUUq5SqqfaPbZIAd6Ne+8EP7Xe1sN
         asZA==
X-Forwarded-Encrypted: i=1; AJvYcCUX8E8Wou3e1SWqhCU8vN8RG/VjFTZQ2B5Bkzmg8YpVH6C3MYootJCHITry5z3KhfJcL9hUsl2CXhDQEnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCTJ2jYo6Bnxu5qBkNnebiZeayWdCoOgOjFGcoJPKSeSg1e96
	D7abqUVkWlAI+6xjVFWdjpF9eojFL7WED/+FFMM/zy09r5gGbumKLcMQ8FJ3F6Y=
X-Gm-Gg: ASbGnct0DNAH5auWNd3ao0U4R8JCfLgn/6tYLfDleh2G3804sY52FXLP79vhbAQcbUF
	gNyZEvTIa3xDRlOWiaDGUycObJVMpiG60+sGRRy+jbjWZTXKXXVws+MyEcgpPCIS6fDJwJQb3yD
	Qh3uccczD7P7QXXJDydJ9oeqkHV6ezgSTk/FGSNYxpxZolpZ7prVcZ0M/7o4KXRZbu++Aeke/9u
	MNCqZsQpWHyIu/sCCuaw9DVSXL6KkTRTZHDVlV61ksfVhyxfhlmWkhuYxFxfNBOTAwSeD1Uc3Oc
	i/Lc5YdK7VmOZvqu5Afi83Jd2qhE4ZggYaXhFEoOqFlqDS3Bzw==
X-Google-Smtp-Source: AGHT+IG7c4wdM2vbD17L5jUeBQiU33Y5mXd7I2kkiCNvbGtyv1bDv/skiWAFhOHUbbJg8GnFurL8iw==
X-Received: by 2002:a05:600c:4f43:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-442d6de7911mr10778575e9.8.1746800693094;
        Fri, 09 May 2025 07:24:53 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aecb0sm74894785e9.28.2025.05.09.07.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:24:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] regulator: da9121: Fix Wvoid-pointer-to-enum-cast warning
Date: Fri,  9 May 2025 16:24:49 +0200
Message-ID: <20250509142448.257199-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Oios4K4gn809NlI8wxV94RhP18y7M2JRVZX43AU2iyM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHhAwsAmE/bPqgx+3RlOMgUZ8+ObSNB9w/mrXD
 98+aEiOBfaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB4QMAAKCRDBN2bmhouD
 19ZCD/42gr58vW1snktFzhlt0zaukSJTmMi3XVPkvJxa+y9OWzm83YszRXXKPnz8WoV7vCuYegM
 6Ijq+/I+ApC0WSGBHuxNTrGJPHoRLDbmWBmTkZ/QWWxFrIHL5bR3MtCcEV4ehH02JaLzyZLJwsN
 l0bqsjsFay+tzD9bNyU+a3Kf4NxLw6w5myqqjHq4mVYDJSV140kLh0ZRJMyWoKO9+rASTK1zMrt
 iD1x+0D8RokVZbBOuKmkDbadizSRl8OoFH3SdVFKtLCosP7hrc+P0mmRZWRQJk6WmmJ4fYxUAma
 3TfuEzaiyL1Phj0tZWH1rr3pgMNgBEzZR2YhKbxF7JmagXkj3Vpo2/lGc2vlOTO974WDogsbNBT
 XbUxSrodoR0go3fxVtgsMS07cPKR+RSkRHBDNaEVY8FjDaXyAGkaz5u2YdKAzDzv8Od8CDXVuMx
 XdeAceR3euBHsCUZOL+ymiE0HRf9QyCsbGJAXh+Rq1PLe+ol1gROJpCrtNTJKkHJcTNaPN5KrQe
 lU/uZ7WF9AxnbmCve0LMkrpZXsjHANV8XkP82s1Uv5ntkHxkO6nC80MK4MzJKenB06ay1miVTAJ
 kZjcCZk1QKuv2chiBeWp4h1KtSjdjqRGr9xW5ZtS7ZORkguM0pddAABqnWV9nCsgwJMPqbTMKnV 65/V87JmmGH5fSQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

'subvariant_id' is an enum, thus cast of pointer on 64-bit compile test
with clang and W=1 causes:

  da9121-regulator.c:1132:24: error: cast to smaller integer type 'enum da9121_subvariant' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel, however other points were that we actually want these to be
fixed (IIUC):
  https://lore.kernel.org/all/20230814160457.GA2836@dev-arch.thelio-3990X/

Nothing changed in disabling the warning for more than a year, so assume
the warning will stay and we really want to have warnings-free builds.
---
 drivers/regulator/da9121-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9121-regulator.c
index 17527a3f53b4..ef161eb0ca27 100644
--- a/drivers/regulator/da9121-regulator.c
+++ b/drivers/regulator/da9121-regulator.c
@@ -1129,7 +1129,7 @@ static int da9121_i2c_probe(struct i2c_client *i2c)
 	}
 
 	chip->pdata = i2c->dev.platform_data;
-	chip->subvariant_id = (enum da9121_subvariant)i2c_get_match_data(i2c);
+	chip->subvariant_id = (kernel_ulong_t)i2c_get_match_data(i2c);
 
 	ret = da9121_assign_chip_model(i2c, chip);
 	if (ret < 0)
-- 
2.45.2

