Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864B221276
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370586; cv=none; b=hkd6YpeEpPbjQ4mbvOo306e/gHWBKFRMXj8KJufx7sE+7IURVZLvekF/k5asLbeSrOlALMjAtXod9PpL+KDlB1MnmqkZjwUpQSPvasdWl4lz9oxBdpdccInX9cwzxfco7hVgOrIJaia8Jcp1tNwLKgWXyyO/elY40FdJeGr5uSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370586; c=relaxed/simple;
	bh=4g9wUdzBEHF2DXwrsn4sDVm7Nmec/oEeQKsxWFnBuaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RMeXR1KivF6NvnDz/GjZ3fXTVo9Q0n32FO+nUClW7nVBu7W7cZIL7wP/W9DCxjtyCw8/InmulVJWcf0jhbGmJyKN+rusShq0Q1erdI8nbgTQVhig6h3LZwiACXi/HuRGTuAGKPXUG87Pua7gjL0G9/66mnDkNsnPts6oZ5H+YEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sAq3qu2z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sAq3qu2z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ede096d73so13661465e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370583; x=1744975383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoVQYZpiH0Di4cmCzPcvMx2OkQBw+j3GHZ8ITdSC16E=;
        b=sAq3qu2z2r2PcecK8p0+fozqQ4w5sStTU/fldeF7eriJn7G9OcQblQ9LB+saawL4yL
         bGGvQuFaiqf3pZipvtsdzJmRhQAoyePlygCCpmUI2qVv+WYDAIbXCK8/dqF7eGSaPpTc
         U6RW0OSUJkEWHGWsBeXJaBOyrUEX7pbbaITtK+mUBAH5TecaKsGXgu7HvLkLbg4St5Sk
         w3qEA/JPADNqWr3afd9C8YfwNpVz1rkplvettLyfLupeuVSTtfa7z6BPHORhzBmMGvjT
         Sk0lcHD/C01PSdWI+txt9W7IMSRoiiNajAL+VYRD0ziZqr5eAEzEnUJdoBmQUemR9zGZ
         mpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370583; x=1744975383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoVQYZpiH0Di4cmCzPcvMx2OkQBw+j3GHZ8ITdSC16E=;
        b=a0/jW01QzLRO4sg+cFJfJmHcRYDLoeSYfkFEwPrO4nKcRoJS5gVGqYC4VXYigVhlmb
         I3F+2OK52qpz8sj1HO+DG0T+G7XOFTDQR+qKaaYvVjvhDlQJAyEvZOYjpG77eJRSOgTn
         fhUEjHkuHqtQpD9yz1EvAtwtZ5vmNN/8zqRw23J25WLVNEGXsiV8XejwV5SiRTYvSusA
         G8J+xnA356whiXoV6drx6yBMQXHtrzfRdZ9v40TlgEa2iyD3X/67tEqA6y4GTS1KJfhy
         b6BEcIBagubqlhqszGeWrp4aSxypw2v5zwqdPC4twvPHPKpwom8mVdba5agjcBSY0XrP
         gQQQ==
X-Gm-Message-State: AOJu0Yzhg4xYwRhn/PO+6yGZHGQHYfIGjrItsJzfvC9OU5WvUK4g8Kri
	WIkjIG4szYEuJSu7cMe2RhmqQz9RXbQszrg/Ba9MDmttg8XN5Aob9+hIVD2XsGt5L+oWVrA8mE1
	TCsw=
X-Gm-Gg: ASbGncu4sbEvkvqy+WCaWi4NvgHIN2XkTe/v+W7w/UWHoX52Ed1YDompVCCZG+rqBNX
	9Tt+lLEynQwu9FQpVUcb4bIepjgj2X3vHBpUoAKOR8D6HwjRevPobG2N78zmsCwmkSyFSCc0vbV
	eowQCwH/jXYsMnc3sF1XpVF0tpUUC2IRuLcvD5NZvHOZNCj45eVPMfYrq7FRkp/C2LZxfpaHjtm
	vXlysEL4Cg4xqQbW+L2CX5opDRRTh10PfTw6ZsygZSxKYFUGrjVu+BxP122Tlz2rvGg7Nf3+h80
	2jDHCzJzWg1i8rdFSFj4OOmUkYju0Cs520v65i2gD6ROeyGXM3U49VI3NadGEPqgZg==
X-Google-Smtp-Source: AGHT+IEyXfnt+nOd5Mq9WQW9OpzzkaH9z/w8Ll8JeLH+8FIwjVtVOut2RQKLAFQT1ODgvHnfZK8zUw==
X-Received: by 2002:a05:600c:4695:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-43f3a926d29mr19300015e9.3.1744370583245;
        Fri, 11 Apr 2025 04:23:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:01 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 02/13] dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
Date: Fri, 11 Apr 2025 12:22:40 +0100
Message-Id: <20250411112251.68002-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko@sntech.de>

The clocks property correctly declares minItems and maxItems for its
variants, but clock-names does not. Both properties are always used
together, so should declare the same limits.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..3201ff8f9334 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -62,6 +62,8 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+        clock-names:
+          maxItems: 3
         resets:
           maxItems: 1
         reset-names:
@@ -78,6 +80,8 @@ allOf:
       properties:
         clocks:
           minItems: 4
+        clock-names:
+          minItems: 4
         resets:
           minItems: 3
         reset-names:
-- 
2.25.1

