Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1860F38F9C
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748187285; cv=none; b=q2hy9RndNm42AFHDFCYUq+/Dgny794ybvlV3j0tJ/gaRHQfdk2DDCPEZBOTkQWb05PawtR7oZn2r1dTf4uBakyldstILn1DZT6/J8VQf57BckEhJiD0nHfqL+8swzt2Y7Qu5eikzrJvCFQDseaOqzYyHq+JPSKGsBrtuv8SVAMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748187285; c=relaxed/simple;
	bh=UVeTvHf4awWYWBY3tUM9u7Gkp3M3Z5RILV+VPYjvt3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kauWrtcHj2NbSbz6o3q/sUzfqw64pxyul1W2oH2DeHjJ1ODZEIRE5CZ8zR0whzhliVVDoH1o+CHENexGtOGyY+JlIHw4Eb2xdRsW1PA55ZvS92JWTgLyJZ6EjXBaR0fv+u1Qp4AiI7+k1NgukmnHBe02el1li7O5j80ksy2U+ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxIb5TnE; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxIb5TnE"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7098af6fdso29545466b.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748187282; x=1748792082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y1MzmaZcOluxhpB6h5urGwFBQcqAS7XdeX983IdJtqU=;
        b=rxIb5TnEPxLIPdnlX0s9f/nKjDEhNy7g8RnwGd3i3w8unto26l2+mwXvlyVZclcP8m
         jAy5WY8zBdn9ysDJOcGUYvgUMIC95ZEiI+8EnHC2BoCxMnfBsea2B7itMu9WoD/iqXLo
         BUR9c64vT7pRhSXlLLkYmlRQhe+jun/cV+B9qd1RPf66j3V7Z/SvFcpH3vvsjZNoZr8s
         Gd+YLSN/12WSVH74mQN4y7sfBpo8MpEcISN1hkqs6pZjgHZvT1EN0QoPb5C7DnXE7/S1
         a0M/X0nmHSb80dH7uKB8C1yu04Gjj9JyexufoXGU7JCqZD2TNSogVwYXCJIdgIhe/d4U
         6SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748187282; x=1748792082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1MzmaZcOluxhpB6h5urGwFBQcqAS7XdeX983IdJtqU=;
        b=deMx7CmSo0wLcrUIpglUG06DbFZhrDxJBxVeWdS4vOMQgU/3Y8VCcsdFqeU497vRZ9
         sRotWlOoTsytEZET5Bptl9dBRwEzawlbc7WrTrn6zhXT6zks6mhoeHFx8qpAf+m0WUk0
         gZ8xqTf+FIXqNNzxDUJmEqirazevdIrSy2TnmSLdVqusSD2yfQfOhwd0yBV4a7Ex8Sgb
         B1YZ/zhEKgwDgScnZQ9cgQGnd7SWLDANtAkwAmvedGPy2yjrpGsnMrXy1zjiGMAADV49
         jD21+Avc0C+w/l3rgUNMQmoMdcoKeXtlMFeJymArzANRCA2rRrUax3zxVt6ObTP5/2gx
         rBOw==
X-Forwarded-Encrypted: i=1; AJvYcCWTG3cblUgdFosUe28BpfVCBPvoKUIyFqAsrXWPI/30Z8GkF5tCBMOS5/UCeKDF723Er2z8EoWKzK0+PDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOVc+rpMrJI3MfZKMHSoO4ym2wL6Qw2q/+ODRFYWNj1PU12nxo
	cm3PErVS7euGdLCAcr7knmsOYgzift9EEhk410mzMD3sBF2fHb87Ow99Wz3TZU1DTXo=
X-Gm-Gg: ASbGncsN6ld4CVuVxre2l9Fmkf2s4NCiVp9ebbixXuuboAUt35xSPFmXwGFrFmd17P+
	m1iRhsADSH5YrMEQCxDBuDAZfT/j4hGWHZ146J+rsMa2jQEZRL78FmmlZIwmiTnVkQ/pHp0p//I
	reRHXJn20dELRFiNDUXsG9hBuZKtm8VKCnvJE4348Gn0wCxIU9Ww/tVgtpC3JyALfJ7rvoEn5/Y
	2N3WlcdMm5w1SjGQoGSF/1qvtAVCs2uEcy+AAzWs+f/npmi9nHmNosVPAPS1Q85UOKI9W7OgX2Y
	gEZNbQnuVDecurXHfiI6P0xSasJt5G/EIiCGxKC3U1aqVYkxLrPGA7pgUWFJEA==
X-Google-Smtp-Source: AGHT+IHQtJsu7ag/8/E9Xuc2PnM0ej8PGts9k5HKZOK0DpGbV5XII6/i06yaVAqzxH4iARKLQUUasw==
X-Received: by 2002:a17:906:cc4a:b0:ad5:588d:6fcb with SMTP id a640c23a62f3a-ad85b2134camr159503666b.13.1748187282161;
        Sun, 25 May 2025 08:34:42 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4e8afdsm1556762366b.176.2025.05.25.08.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 08:34:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] memory: emif: Add missing kerneldoc for lpmode
Date: Sun, 25 May 2025 17:34:36 +0200
Message-ID: <20250525153435.15768-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=760; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=UVeTvHf4awWYWBY3tUM9u7Gkp3M3Z5RILV+VPYjvt3E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoMziL1E1nfeMRLA8Dfg1L9Sc4uJUzTgc5GtjXB
 7adfGWQT9WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDM4iwAKCRDBN2bmhouD
 1wU9D/4yC6hbajiPX8eQR3qdWrc68PH9t+PRRk2DhMYEEg1cNd0Cr0b7v1Su7UvUhFh59IAK+u4
 6jJ275XnIOLM3i9GK6A2FfXIKY8KM+wp3kMkMKNDUVk+eKBeFTNSVytIAeyMt8AwbYClF9DePA6
 TK17M9I4jA+mSG7N9wmDaSd/6nWB3mrO4y7uf117lzO7s5Og0/44PZ09kHoXcFp5j3O4c8VOhd7
 /zcZfGdktE98vcAhw3mF78gunccZVyv59reeftU0rQV3bS8dr8JslyAYJLYULlLfUyG6z6OjhWC
 iTq7Dm8Rg2QNIxL73JJxjPTgtIOvo06OKbZnOSUjQZyd8oZNbS7K92xsrS6lHYKJD5ZWlMAAWmd
 keJ2F6ggsHcMwcdTrKRGSE3/dvEKJpfJxnB9EP7ioBIKkm6VzXhIl4He3C5diQITH813Lan6bEs
 tr+3JYnNfTTOoFwEdaeNx7kxxqjW4ZH2u3xH07qDQQgfXhiMqdAWZNXxWxbVi/F3AkSWubuBU8D
 NGJjDXAU9ELMHCM5X6NGrQ83eQXUQ+vIUBwBi+fHIqY3Xu4cJoQhubrrf0p2TggJqyKoVCxcmdg
 A7t1rk5QFvVC0WMgUNqrvIpc9ykOFzezB0q0e/1eKgafR/NpS2gEWXj1skGvPNzSod5/NHH4gWt 8Wo7skmlawKxZvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add kerneldoc for 'lpmode' struct member to fix W=1 warnings:

  drivers/memory/emif.c:67 struct member 'lpmode' not described in 'emif_data'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/emif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 2e1ecae9e959..2fadad0666b1 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -39,6 +39,7 @@
  *				are two devices attached to this EMIF, this
  *				value is the maximum of the two temperature
  *				levels.
+ * @lpmode:			Chosen low power mode
  * @node:			node in the device list
  * @base:			base address of memory-mapped IO registers.
  * @dev:			device pointer.
-- 
2.45.2

