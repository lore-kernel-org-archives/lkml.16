Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2340613BC02;
	Mon, 12 May 2025 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747049483; cv=none; b=JZaFzphS/ryrbwtKrbHCV8kjl4JOAoRXyfGaBLQc3+D7PkRtCDXBZRXte3fFsgv8X7v2vp4Jcl3zFB3gGx0p762b9HUMnmAp5g+6EoGteqHms//xRffrOiBl5tbI+EANmLqNlCLSH5tHo9mU0qFaLEwB6t/d4DWTLGA3UvcndJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747049483; c=relaxed/simple;
	bh=hh8W8SFL2O5tLYPxqifp5xrBtBcma9ivlfB8ylnUYQM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ehhTosqXy5dFaNyHhIwdNzAJhqiuY4VGPGfZ6EHakvb8ZmKjVWZEKuteubAfkUCITFLxb5tc6GIChn9JiOEhSn2ez24BaJThlz/iUD2qQKtiereRqYim5PxD+bUG2h68ZlfkuPxOewgaxB40qne58X2nE3ZS6Tu071e50ZQr9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj4tFEEJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj4tFEEJ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e45088d6eso55274285ad.0;
        Mon, 12 May 2025 04:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747049478; x=1747654278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=;
        b=Bj4tFEEJ8Zj7C7VqcCHbNTCoelW3DKSl9XQoGc6oHTIl2KCxm4IpUYDD3/oRW6wxZm
         W3XQwT302irUsVaXtWf+utaN2cixjPI1Ki3methWar5rDv/3Uz77YiXGxsVf3C47Dqp9
         FPYoesm/W7xbqqCtEycjfDRSVnSvufmIWrKf22nXgV0wMk+0iM2c5wqrY4n1qqz8yMWH
         3po1IF0TDdcnL106mPfSxmAhhKOYxn/ORQkeQ3tBJzkUYXNJopg9zZQ7xeR2CMMcKMHh
         rgB+VrMHegITFzaKyaAqodNqoX7eyKswKiv4nIbt4mtgeHaz08d3b/FINkbW2TIppM1J
         fBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747049478; x=1747654278;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=;
        b=TbJC1KtX9/mzsr00a60wpBrOvCnpoE6gA+yAiQjfSqYn410ZFt43YaYOHugSQdV3/T
         X1wLlOncdwjZXCr0s88n24Bm+d+hnV4dQH9ioUb5T7Xj0Z6s4NzGkDqACNU/gNrhraS9
         UU3KfJjumRrb046081Tf9zB+2QYejVXheF9KkdxM15cmm9YGI1V7kuOmQfJSn+17AV9J
         hCtfUAPQvUvq2mf21KxbukuNMLSw37PtLnRJKLMVO1VuIdEMzpuxjrhVTuQkSh8fUThw
         GKQ9Y1eLz/Ny69GmgixBX1QdtOV5SrSYUfz8zfVLOUOtXQPx3Oohu7MMp05MDdmr9Uat
         J36w==
X-Forwarded-Encrypted: i=1; AJvYcCWeo1nBMz87zahBs7J6Nsubes3uqsPoKh5tc4mnxTVhFyg/FHHvp79HmsqI4ztjIU1ALrThvg6kbwyASnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51aXR0fZjm+VHz/MH+YBYadcsGtasCVmZlGdPpqMRbRrIBmv2
	WDtDmaujljrKBQtrfdQQ1v/obEwWWDwg/CjsSyG9Ao3KgSyy6+kdv73Fyw==
X-Gm-Gg: ASbGncvRWFhDSPnbnaDvCl+rZ7iBUOEuM+OebO2PuSSfimk23CnrCe392kkzOJqBTuA
	xroQDMJ9X8QOjGdEradOP+a0gHQ8xwld8s1r3/GGb//4ly/PMzidhbhQ48GeaNg0ypaoM36mLyx
	tQOKzHUuagmkKuna5akGg62t9Pk2srzkgHPBNBbvJ6zOm+R3JQJdGk5prlOG9lB0I2/Qdsbp8Nz
	ZyhF8zGrZXKl/RkcflpVTQP/izUM9kdAndksdc0K0SRT66lfLrGPkcq936DdNrOc4P6IIFvbzS9
	C4QdEI83Qjipn9UA9iVE2KWdZWhymWBLFqwF245RQrbcMUPK8epq8VgkxTrpLSoZZR+SHkBF
X-Google-Smtp-Source: AGHT+IExxyFiytciXzSdjgPQ7rTz097bkIWdvh5taz9amgHJiu7hfwWP19TIewHg/quu33Cj0p6pYg==
X-Received: by 2002:a17:902:e747:b0:22e:5e70:b2d3 with SMTP id d9443c01a7336-22fc8afeec8mr186571865ad.1.1747049467733;
        Mon, 12 May 2025 04:31:07 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742ce2sm61074145ad.80.2025.05.12.04.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 04:31:07 -0700 (PDT)
Message-ID: <6821dbfb.170a0220.3b15e.aba8@mx.google.com>
X-Google-Original-Message-ID: <20250512113026.264785-2-LeoWang>
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
	leo.jt.wang@fii-foxconn.com
Subject: [dt-bindings: arm: aspeed: add Meta Clemente board] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Mon, 12 May 2025 19:30:26 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512113026.264785-1-LeoWang>
References: <20250512113026.264785-1-LeoWang>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

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

