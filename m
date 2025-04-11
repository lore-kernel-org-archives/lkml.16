Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E323E126C13
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377297; cv=none; b=Y2jwWkYHx0Y/qxgR0oycr/cKELTEhu7cy9frYVqxl9/3QbhMn48eIn/yGbsef4sqZdNPTsbYhHnf4SoVwWpkmngC5K7bg7LolWCA83PSTZrrzO6UwB1Wf/p9XF7FdGkpac6FIdUatmvqNU/ZdGdQAHsw44oQOM9K+dO/Y6YzIcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377297; c=relaxed/simple;
	bh=Fx2DSj48yYrVxbWj0sHoE5Kp8sSclZ5JpAzWIKIi5ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4YjDu7A0BioYbxwy4agQdy4QcChpLPvpLS4J6Q9Tz+q9Hw+KUGdQcnkJM4MRsdZGxpqkh3X7hiiDzUobbIv/kZ81uxFzssBIhgTyHXowIlSo8AsXZh3lOWxnS5A97qHqpnlvgzIgyKn0/yP1G5ZZvCJFZpdURqtAR/oBVtJe+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DeIvUonf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DeIvUonf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2264aefc45dso28214125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377295; x=1744982095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ9GjvnopZqWsxEaOWAw2bgVB4e74J1JbKJhf3MqmuA=;
        b=DeIvUonf4WOFwTRUtSgscVzmRexwjwdvj7KipEtftzXoz2j/0KWHrJzd7xPDJ0wVOy
         fU3hvAIqf4TbIqttARUES3YXrD1cWy5jrKBiVoVf/MVjtQXlGB2wrtHKhLlJNDzxJj0v
         fr/jSdTKZB/15/QPpOdn2t+7gLiOi3MmN0+P4hnaBXaQ8FflDVun0ZlnOfBL1UCrjCBr
         LysRRVSPmS6oPeE5X7RG/zewvT3FmBBkHGOwtvQtqSU5QKZCpCYEjqAh7tkUJxFZ+Osu
         eI8sUhPPmyyWAgaV/1Pl3KMgcCJ6SwR+TSUBH4y7nnNDwRrGSfxjekKyK/lZtBqLNWFD
         2/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377295; x=1744982095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ9GjvnopZqWsxEaOWAw2bgVB4e74J1JbKJhf3MqmuA=;
        b=Rb2xy8o26bW3bErFTipUE3MT+3wHuYr4Kw+mjWU/Y4ktVenWp62D3xZzZLxfteUGJx
         fsXhadARes9WogGwmIFQwu67J6eCPfiVM+Fk/lQr/kM88efS2elUQCkObgR/YSJ/qk1I
         yZxZJXKguGAOfPkHpP31nUD89YzG/dZsSVvpxVQmdHNrmsYQjatTC4V9/sbAQV8SCNfT
         NvBM3aFh9ubDsjlbHo/z0j8KHlusoM4/AqUQzUNIwMXyl3dWDHJIbQ+bOqroHvlyItU0
         2/P6v3osC0AJL7BmX5IOYdILwt8rU9gaici/nhvWd6aWxgzw3l68fC1snSalMe1Uf0WG
         t1AA==
X-Forwarded-Encrypted: i=1; AJvYcCW2H3pp4oerOo0jzz9OOIjU0nM+Hz4j6oAJ2EYqMnH4b5G3E2UnjlrkMw1Sr00bIspPC4VpczN1cNu3xoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSnYJmiODO8jqeUoP+PGCdqSNBLF4Wa2CX86bOIjqtEmPvq5DY
	c7WkIt4Zm1f2LkycGm1EBV5vRBKxXgF+4VsALAk6EDzE/EKfMf54DMy7c+7iAnU=
X-Gm-Gg: ASbGncvOdqcG1U38E4WvgwX3iRW0mouie7ToGi77b9lplV9mXzK5+/LMsVN+bhE1Ogf
	ioMTV6KyILUfcgNcCodAOTHVgcZfTIPZEQ82O2c2xRAk/3iQ3pEooysXan3wuzhr5v9ce1ApIf8
	uIZEPp1A6phqyDC7VQ8//zVhX/FUMt90+4cU6ISdXW1WZ9Eh2Ad3A7pKgPcfA5PnFBGXwk8Iv3d
	fuu98KfnXFv0Qc52hGEdl/s02qOrTBhp0JgjOLSCitMS1bv9MduhPtKVQyqtUzWpZLPJfLQr3nG
	8rJ9E8jv1NF1SU2+3ZE21xUnX2OqnU8=
X-Google-Smtp-Source: AGHT+IFvN5I4E6ZSZP8c6xGMaFyJHcwfDhA7M7Bi4ibh+3ktU+m85bf3AQiHdiDWUBpOoQFNec0A7g==
X-Received: by 2002:a17:902:ac90:b0:224:192a:9154 with SMTP id d9443c01a7336-22bea4bd78amr30197535ad.26.1744377295221;
        Fri, 11 Apr 2025 06:14:55 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:14:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property resets
Date: Fri, 11 Apr 2025 21:14:15 +0800
Message-ID: <20250411131423.3802611-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an optional resets property for the Marvell PWM PXA binding.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..9640d4b627c2 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -31,6 +31,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.43.0

