Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CC1917FB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144976; cv=none; b=AmCupu0UJt6Bmy+QYxN5ivSdR6Hh8RujBn+IalulaH7lE0eazpRMI28+y+Kl1PobSagX9P9qJOCpiTY+YtM2fhJBynxsxd4ZLddTkyH8EXn+CxKwtCfUQ1ckTn37xI6Mto+tIdk8+a/lanAl/406CAV8+GTUvmN4NIGclcoiR8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144976; c=relaxed/simple;
	bh=dl8Jg60ElVh4ZYg5JYQyBSog9Gk/qp3bgu5GdVsMqhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uh1uyucImRjajfj2kmNbGhUkt/Tt4FsOXGFuG/QxxZsHtFbN1ow6IT1klWVOs+y9rLO1GeQgdJCH70RtnGpmHwgdTTSk2+TG+x0pbIH/DEGX6Q+SBRREBiSZ3GG3pxReIVXRzpTNyyxFH/WqzZqjddJxh44ESfxLrNg681ntSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cSZ4LwQs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cSZ4LwQs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a52878d37aso181234f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749144973; x=1749749773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMvfcfOLF48v1uRyKZXu/RrHT1jhYeWqfpahQ2X1A5Y=;
        b=cSZ4LwQswzcelV49WU5/Qwx25g1a7IC8Gw358XJS7u2Lm+pu9QERuzPhqjvkXDbBgr
         6kY+PpifncATswB0oKVrtu+EeG1ZkjA71C5ZDkO1KOHZR1GNn9NGrtqSunQ4u9YPm+mh
         GiOdBxefpbsAGXAvLeibRd6kixMuYQk77yXokemsh3l6G52BlCRhdO3WkwUaYDD5xFMD
         XaWr50y480TMXDMD1cQU4Vnc1pYQOdSgEPGABfIxB1JnKPPZBf2Rbnmz9GYLUL4lqEd2
         W+sah79nxQBEeZ9Vqa6O2KfzJlxNZOLTocQy5cnGf7BLPazg1v3QFdCM9YSSNKLlBQCe
         ZH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749144973; x=1749749773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMvfcfOLF48v1uRyKZXu/RrHT1jhYeWqfpahQ2X1A5Y=;
        b=DxP4Q1PVVSO91oPVtxpkaXv9Ar15GNJh3b4b8xXn2T7mRT1ztCKz5j5AG56De0btVZ
         bDOom6hnDabPzUW+j52dZwN0802DDLtmk76BNY6Xj8m/nb2qnmnjLi1XlYB66L6CF6PI
         sSX6ZzviBm8UInZV1MfqSxkcbeeXiZpjlksF8TY4NB2O+IpKNz7AtQzFEdjLPXDmavv8
         2EHl/dvxxhCgbBKGxyyQTE19JhLSONZ+I+pBYTHx98olCZdPUGtN6LqJ8d8bZUjLAP6e
         FtmfzpU3Frju5vb0rCM5x41Y6ws9kbY2vUWfSxHepBN78Y2RUGi66DaI47kMdlAdDoLF
         ek9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmrZQMqmHH4m0chlldmddPtPRxIZGAhu9GaLwiW5HD5xdZ8+Whlw6yAGnp2YxWK+O7wBYXgYSu5x2Sccs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIV/ApgTY6g0zd8ut6tAS+Bsi8XEEs4td+XHdRfCftDdJXpBSn
	vq+ZnBQ2ycpa55FzucliGz3gNaq8KeKT71fNvSyQcM8teOlf2V/NTMrq35TkwGThkKQ=
X-Gm-Gg: ASbGncvGjNCXNT7aLnPtSDpZ0/tvTctkwKObyo1kgIRKISJvSBLt5UtwGhyQzavcuP4
	H3wBHwSvyjrC38QUDLwa+rKJwrifYrd4xa01Key0hJp43aXM5VpBexsf68LZQ5/AsMaksTpcGKJ
	3uLbrZdZsx37iPvA2t0DDsu9pWmEOFeYzmC+YN0nFNvB1VuxKCjEZGWdR28ixPwQMYZamA/t92R
	Poo7guHCU8WlLP6TpuRmqUWzx0gb1aulub/EHtk3OiczsiYtB7KOL6+ik5eJDTFM3xbSbItJbid
	bWL36GO5CdDrP1Yu/UbOzjoXa58VhPlNYllPB3zwV4Ag/0Lq3F3/deWWIQxdMxrY9EQd2NS1
X-Google-Smtp-Source: AGHT+IETnhCupdaOviaQHK4ozrpKn6IIjf0eM/B64EnImOiA/1lyExI1946ZBaKtrzPDwgK4NXiOYw==
X-Received: by 2002:a05:6000:18a4:b0:3a3:7049:f947 with SMTP id ffacd0b85a97d-3a51d952bf0mr2560096f8f.10.1749144973112;
        Thu, 05 Jun 2025 10:36:13 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451febed5d7sm9711795e9.3.2025.06.05.10.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:36:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+
Date: Thu,  5 Jun 2025 19:36:09 +0200
Message-ID: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=dl8Jg60ElVh4ZYg5JYQyBSog9Gk/qp3bgu5GdVsMqhQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoQdWIg0KFlLqP1FkVueD0UsRvJ00CqeHqO4uav
 Ac+lFcBHjWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEHViAAKCRDBN2bmhouD
 10vOD/0ZMt4+8X+Vjca4R+MkxyjOIH9VunlrWkdoS41xwOdrV2c4SMfXEGbYdA5fTDUKKOEVQee
 s4zBiNC9dWMQOqV4F8ybyJtA3ntvXGKZo3gjBVE1OVgG0yNT63xBE/R99O6eTF1DmB818Y5JEsZ
 G3xR7txsU9JJrqXxboShpg/QK3/lWD9bLIZ1FPaDqJ25GhMSTMaF2DyJTXkaVb/zBuL0siWMD7j
 ObtFLvnylLf22EseMJmBcRDBMHOnPjlVMrW84QcmoKZBfv1PZSXXQ5DgDhB5gnlEb5K+korOT08
 iQi6MEqmRppY9u0Gk0uQEPWgDMTfgoiGZUUFH3sI2UNTWcmcCnOfX2jzIwwzJdxz1DyLzvnAiw2
 NWkuYGP/xPDgN+IquvM/97zNSzcEqpPKwy3Lqitgc6uRDHZzOPbX2BxyONcs+d7PRwMDBhBFO00
 eSX+htPnWVKK8gRgf9vQWetqn0ZLfj5jEnIzZSL35JPB2OYzEadbjv1eFnJm6Q/uVl6eZqPHrO7
 fjsu0dDzeSGvuIKyLr7VNP62yJsy//S6eWxeeajQfU3Sd5Hsy/j5V3hQl04H4B1yuv+QJnDIafQ
 UqyZLZEK8y5w6cerptvRGjHofkFdBLsjsYSfmSGbRMtYVT4S/CJc8ISPpAg4GBsXRZsnNR2zKjI eXOyqfAD7b1dIuQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Enable the drivers for camera clock controllers on Qualcomm SM8550 and
SM8650 SoC (enabled in all DTS files like SM8550-HDK or SM8650-HDK) and
video clock controllers on Qualcomm SM8450 SoC (enabled in SM8450-HDK
DTS).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resend because I forgot to CC right people.
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1..2ffa590b962f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1404,6 +1404,8 @@ CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
 CONFIG_SDX_GCC_75=y
 CONFIG_SM_CAMCC_8250=m
+CONFIG_SM_CAMCC_8550=m
+CONFIG_SM_CAMCC_8650=m
 CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
@@ -1431,6 +1433,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
+CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_HWSPINLOCK=y
-- 
2.45.2

