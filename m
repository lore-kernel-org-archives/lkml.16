Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504B293C73
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881831; cv=none; b=k0Khrixl53tXf33ZwLXJCMtLzvqQWbTVLX7ihYjw2vxTqdAoQYp5WM4XxgGHfiX7HA6eKDx0oDE00XCTpDhn5Kn5oedJvtb1epb5vegJQirgoOO6HFRhMg5mpm+LbL7lVOgpeOH3bIIvqlGXGODdo1fkKwQ3OHycoOz34JjAve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881831; c=relaxed/simple;
	bh=h2ZIZDOmSWkPXzkMjkMSgjmXpqxnrsGTZEplK/nvG0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqkfjApCSW6DARelxC0X/hhSpPzTiU1O0z2EahQpRH/zb5ScH5qi0mtuFgqOuH1IDt0dEGe74VopYRl3CXJTdT1OoMdILY8VXnUOjaAAkiwHE6zmKL0zWAg1piSPtBEtBjCltrePPEoor+GuMHy95px/pxGlcsQTV6C/YC4FIsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VjL1RmTW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VjL1RmTW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so176328f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751881828; x=1752486628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpSUYxl6ubYjUBFlM9XBHuV0jlV8ad5Q8dYgbXUNW2M=;
        b=VjL1RmTW3a2lMrtwygZ98kHGV/IDSry15T7ft2tgf9Ql277O7arZEFQO5ZuPExhEJc
         HwC1lH3V0iWKQdnPlJqmBYrOId94BFIJHeeVZFk/tQ8L/bJ9bsXSM2awdhEoJLkTegPO
         OJ2DF+FxNvB7nkKD6G3DZlKRmmKhA0SqZ9RkcSDi6MLoYp1s6miDY2IUtqhH3dGu9zRZ
         +KgJvse0ay+f9cUtw0+BGRxVBzsa9jKwatf8LlduIGOOf9Kqd5nAGgfNfC7NjqZSrbIx
         EMGntZR1l3w3pVhi8pl3fcQVHqymONFXCQnfaDPOtwpp8TRC4tEbYoHMZnWtwc7e+//4
         flQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881828; x=1752486628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpSUYxl6ubYjUBFlM9XBHuV0jlV8ad5Q8dYgbXUNW2M=;
        b=CABDx0hHPbxQAnJaGkntbiycgOjFEVaE56cYOr1lwy2w3ztDs3bccXDlOdYj8vMZjk
         Q63cApVelbZT/MLj/UjemeNabB9bSbuoTDmnMYhR49O3KruVu29M8bTegtoNNUXZQXSD
         +B3mtlZfityX/Skuk9+3PT4sAkPvl3FWsQXY1u+ths6p1d1mKzgi4TDhQ7xD9fryhCTP
         kpwe6Wyyi1xYjUlMwxM82pfZovIU2R1zKT8NL0t0fif+17vH5XnDQG3RH6cIzmAuL2U9
         JBDC4D6APtylaj/RJclSCMFc0FtWHeh5TfylxvDb54LnPP4eKibGydU0Az/0UkDlJaFd
         HHTA==
X-Forwarded-Encrypted: i=1; AJvYcCXP9B5173rnpXQ4XJDP5UrGRd0C5tMHA7ZN+Zc6AdDA9klVd6EHXjdsoe6Hp9fjquAry0ZIz3+n44NMLgw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqwk0sKSDNxEI9HMl0WeOl55Bz/13VaJt/FYV7CVn+8gW95f0F
	de0GtexzI1SQnpnxLvq6S9yPzblbGZb4qXpAjVJl1pMlOeCeBKq/vORgAOegYrvIY/k=
X-Gm-Gg: ASbGncv5vD4yrktSYYwe1zxwrloBMwwkdOUdm4RDufR7ZmyhUd/9c2S5yPYUMBGk752
	XBTh+BSXpZXIqd+s9mMdo2JoqomQqCvl0UmsGJ6MBwtZ9Z0MQYl5KWyuMiOfghbMgSQyExJJvDB
	3XUZ1D/P8Fk4V7n5ssSRAkHJb3wgZYY5JrVhLoP/xEcDUaIzSLxeWN6JQYo0Efub5t326OkGtLh
	PZsQ8q5mCMwlZVzIidBhP8diLHrIK8TPuP1ORwvLHYJHlPEKMmB7ni8R8eAMH2CJv1atSh/I1Pp
	AZ2J84ItxGaVzDvW9/oheeGmEjIgTEw3EAxBTl3NE4Oe8S0NEbRDE/Fnda8YMW3aGWzEmQkpvpM
	=
X-Google-Smtp-Source: AGHT+IH5jviufluOUPPKRbE63CdCx0wEwQCTvNiUZOgM5EUP3cSI+Al/GBvGateFWAHyzWBf4aW//Q==
X-Received: by 2002:a05:6000:401f:b0:3a5:324a:89b5 with SMTP id ffacd0b85a97d-3b4964ff530mr3048366f8f.8.1751881828398;
        Mon, 07 Jul 2025 02:50:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b49cb46c61sm5670871f8f.63.2025.07.07.02.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:50:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] docs: dt: writing-bindings: Consistently use single-whitespace
Date: Mon,  7 Jul 2025 11:50:22 +0200
Message-ID: <20250707095019.66792-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707095019.66792-4-krzysztof.kozlowski@linaro.org>
References: <20250707095019.66792-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=h2ZIZDOmSWkPXzkMjkMSgjmXpqxnrsGTZEplK/nvG0E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoa5hd937sY/GoGLu3zRiQDUklTJYJrMS/Ds3NW
 IVzB6HZgPyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGuYXQAKCRDBN2bmhouD
 141dD/9tIslxgesPvVa8Wqzot6e6vai312Jlxmi7jxJEHnDR5O/7mz/Chsvh0sG50AKInGZ9/Id
 0x1hjCpC2F9HVVJCw519l0SbS/I8isBUIGND8EjGZt4jUc9Wiz2VzxbgLsmQ2etidAKqJpKkNOk
 0Oa/oja0cEi9w2Tw3rcIr8fZfghKKbJousOkZe97ALdfn5lU3tqnPbJVFFUj2P8E9/lO3+2BIIR
 FNbe111rmm74p0Rdyu13cx28ghRNLT8o2bNbhy/tjbKeBn9fmPrp9rGqYkeZH82GmKYAk0Q6W0u
 4ZSNVnqt9VwZo0MJLukP0tg5cmhSZuwgtOJduorMXi/UARMHN+HXUWHwWIhOTUvqop+gXzvtxjL
 Zk0HIwPV40SxQXTOpfkpkPW5i3fVY+fKYsXfJ8bCVmBai8OM2hKEF2gzlrbTN9f5AkYJW8PzxSE
 +O3Y6VNir5OV0fHXle8+38hrtWg2X7Im8qWnm/YLoJwT3gjOrEucJUJQB9V96nrC9ZEpc4siCG4
 TYL3Ts5A6VfS7iwG76fJGO/bOGsVWQobk8CPEU2Sz1BjglLJPar/zY9l14MDcjYDAX661qXBGrf
 lN+WDpJDbl6gpfXRhpf4SvMPdaXMmzDcsajeb3kU6YcqNPZXovg7p8T2RggFhkA+jf25HbEUe+3 ZHlS5iegKtwJE5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Document uses only single whitespace after full stop, so fix
inconsistency.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 Documentation/devicetree/bindings/writing-bindings.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Documentation/devicetree/bindings/writing-bindings.rst
index 962e38a1751a..a2d2afd099c0 100644
--- a/Documentation/devicetree/bindings/writing-bindings.rst
+++ b/Documentation/devicetree/bindings/writing-bindings.rst
@@ -81,7 +81,7 @@ Typical cases and caveats
 - Phandle entries, like clocks/dmas/interrupts/resets, should always be
   explicitly ordered. Include the {clock,dma,interrupt,reset}-names if there is
   more than one phandle. When used, both of these fields need the same
-  constraints (e.g.  list of items).
+  constraints (e.g. list of items).
 
 - For names used in {clock,dma,interrupt,reset}-names, do not add any suffix,
   e.g.: "tx" instead of "txirq" (for interrupt).
-- 
2.43.0

