Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A497A1DC994;
	Mon, 26 May 2025 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253588; cv=none; b=DKSm6tOvLhUmH0jCWq1JE/p2Rk9wj1Wi9+ZLi04w+Cb7CE5N5/s6bqDgtl99VEHnsZ5o1PULdw98tx0AidTLhbejJ73oFrmsLgzx/BkUQX9r+hTeW6JBr7DyUPhpJG8bojMZF0/NkTL+LjJT6ccoK2yPs65yVNy7o8oa5k8CBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253588; c=relaxed/simple;
	bh=Qv+OqAJWdtMMcham5BK4fySPDa8hHXlGJ5kbusnC+2E=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=QcuRcU5de+sqmvpLn/lVo+CySjr5usJvuUMvOSyj8fLOWqRj1W6Yl3Rmwk/6UeGuRFs8TWYl2kwE+WNyUNYPPuBMQKsNfJKUKnZsnYjjmbXoZpHtrZED4DJ/xgvpIMjRbYQKvosyBzaRQgpvw5/nvuiWp4i5+UQ/VWPY1sgzJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdDuWDps; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdDuWDps"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7370a2d1981so1203965b3a.2;
        Mon, 26 May 2025 02:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748253586; x=1748858386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw+b30S7iFdzof7KyhoRmjmL7YOJsI0JrMdooAg75CY=;
        b=DdDuWDpsrq4piAp89z2U1aPhXhaKN3yedVbIjx3fGDXWOmmRKTHoMqWFohPvOJmjjV
         mH7mz0jpXemoJaH7iMMSE/IZ/UWOfHrZshh3vSRviQPxZxnO+C5ZJMB9pxzn/08Sm1OE
         WaP6/+UKmLD0lWQ6UMHsrWIFZila+CFyUhz6kxgDx4o4xpUKkLHAH06Nul7m28X0WYy3
         +3/sZtKwyuVuqpQKJmekLMm20NfmcRp3kteaJp1AM2STYy30MKW1Lnn3JtnUFHeI0IUs
         cYuT5h62ToVq1rtBplArrnwInUNqb3JafnEBjUF2mDSwKQE6gfopRQ9zs1ijpbnAgzsk
         V4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253586; x=1748858386;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hw+b30S7iFdzof7KyhoRmjmL7YOJsI0JrMdooAg75CY=;
        b=XlKfeegs7mzYFBTScL1d/tqHZ+q2qLOUADL+sznbG0DML7FwfTFkfNj/hvsSjiB1s7
         niQ7Uc3dQ7Kyc+xBJcqwL0GLiRVek/CbpWLtLoaseM1PV89BGQJd39tRQME6+vK5y9Sy
         8DVmwyZ+bzzi3D6xiTvJXnLDk8cfoZi0NuQi4Fqi8d7FkV/RXsDf7aUz+dNut7QrF1Ko
         D2GDijxfpsszat9WDNZoi300QVibqgwNj+IiT4euQ/N0vFA1Yy6pkuJuR5lvHIwljxve
         tsaRFWI2bhEp8/9cZ59IAxdS+h9piQXjNS8vD8ufrul1rdM49nu4F80JXmlPFikY8QZj
         /jFw==
X-Forwarded-Encrypted: i=1; AJvYcCXqjy/csHhsXKoW4O+0QbbzG87p5jeQ2U1BSFt6sfpcq3VDdwzf7PwcEgReJ1u6WWK2E30A0Ome99/u7aA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMt13qBWjrluhl4PtoDJgbB/V81+RsKxAmU3kc9oxUwU+Rzzi
	axPy7PVDzTKQiXKmH7/Yl07ptAdyaOZqJbwZS4vLC/cLBnKv1v0Nk9Hs
X-Gm-Gg: ASbGncuGQ2ZmAf5IYsl6BbHkyrFNboIfxqpR1ph7oo8ZYhYb7yo4dwDfHNCbmdwXNbx
	DUd+3v6m11yZGMXvQhNBrx+VvB335AAWdDRLp+eVTQxKraVrpB7IBYMTNJ8BZhIlP+0Dp+R91zx
	9s3ePDtltcJeiKB6zjWCBmlTUM/UCClKyQZflx0VZ04ZdxNQmJm2Aw5z8NK6c4Vl4FhYV1XJ1y9
	TGDt/BD/bOrFO3FrkSftLxbL55Yg9vGA6flcX7tCqpNELnGzZf4LAkPysG50E5vLy64M0khJUpZ
	yVCilWLff+70GWi0CmqmiBozjwljgX13X4ML6UO5NdGennSaYmH1jSjRPcr+TGxUXvxRhAocINh
	Xm/s8oQY=
X-Google-Smtp-Source: AGHT+IH9dqXJxz5O35iZ5QNfhu3qUkFE26No9xhBeqSmFEjU/+GGgVc1uQOTE9NbI8GJds6O8V8qsQ==
X-Received: by 2002:a05:6a00:8d6:b0:740:6f86:a0e6 with SMTP id d2e1a72fcca58-745fde9e5dcmr11477511b3a.6.1748253585822;
        Mon, 26 May 2025 02:59:45 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d64fsm17225525b3a.64.2025.05.26.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:59:45 -0700 (PDT)
Message-ID: <68343b91.a70a0220.2298c6.5b57@mx.google.com>
X-Google-Original-Message-ID: <20250526095924.2814310-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V3 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Mon, 26 May 2025 17:59:24 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6822b830.050a0220.27a24d.d064@mx.google.com>
References: <6822b830.050a0220.27a24d.d064@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.43.0

