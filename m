Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5720FAAB
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681103; cv=none; b=OqeQKgszSCfR2EBRPOFQ+elHqEtNYdatf8Cs0IlGoq4ZOL0vXmZB+5W0yrG2IlL5fZNJlzdlYrLi+f1Pqie+C0T+AVkLK7Vc2bkiEJbGVSL4D81ydEE0v3rGgq/kHfL7/PcLRMOc+t8mGxNpKQYbW/vvvqP9dmXSV3wkCmSTlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681103; c=relaxed/simple;
	bh=w2+W2tZnQfiMOlFUaZpvMdhzpNLFFWuvCuO5WujfTCQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nzpkuqt+CNIfZ4nR51LF5pVe4EY+1bQniWJdJj2OWKhwidk7gkTxx0acq4anQi/UUBNq8JSl3CGPG0sBymKeTXDrxU8lqV9CiFvtClhNdY4Q5OeQnvOPHivXpssLwiTOEOXVrm85qIm/6jZoPKlJ40a0AD+1eBTCxWRJ7j5DXPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dw/YUKVY; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dw/YUKVY"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b115383fcecso346758a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 22:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746681102; x=1747285902; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+xYDH8ZA1ujcqXzLdWECgpqE3X7iFSqlkU9E1XnNX4=;
        b=dw/YUKVYDpruNYegrlaMRUFUwjnSp/HPq5RS49bssBaA5iFMMLAAE2OXtwxuUAc6+x
         pOMqjsigEmSVTN4mkUkHnmide0ZyS6k09YZ2gltkUMvqgTVGy8sSsoNXbUFjes+XZ7Hx
         K/c+RFcvX2wGyKlOZAIgN/Lg6PNAx+mi9MaZLbks9byydhtEm2hko3JZutv5EKzIf2lO
         BdJhZFxl7EzcB5s+PCgr+7YwYtEKDwENtP3ri1L/kHeoeGjgZwWycZ0UD2deLvV8Ic0V
         3ITl0LT3HchQzmb1DeUZSlNuA2qoNPotrRYy10MqfEa65hvTN5Gs2Cj5rOC8X/MqmpEk
         lAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746681102; x=1747285902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+xYDH8ZA1ujcqXzLdWECgpqE3X7iFSqlkU9E1XnNX4=;
        b=S0rHyGOFBCgO65g504V8V5Yrjj47ziLGDdoGRQMekXpx27NtBgdq8Per5nOhLB0PHC
         WTBIlNSEBfxsOpO+bTI+PFa7dHUI2ZyvO4MnCXs/UP3827JHWd2MI4jYPasbm1RFcza/
         Fg2Nxp/Jg1u40IhsIqe8/PYDbyrQK3wjfXZ8XgQ67VISGAYuyJcnaXfMrjvPn3zUYP8a
         BNmuDuzHCTESh51Ov1sONyBVhVbGVV11lf58QAvr4JhblRHXqacXBD4JzIPir9wJCySm
         nBjZIc5Md+dAM3rezRo82FbBEh6oWsrecC2pnnI8FLJxIsiczUaLh/G8RXHDrg6IdMy3
         ZmjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE5SVmmg2CQFaOH+iEEVNdR9EX/KV+nyYBYAHhlky9A6SBdOJQSbCt/FSJHE387AWJ9AlIRBoTW0UsAgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJ93943q0mnmjg70XWrE0BYSp4UX5zXO3GiAU8aWiF/0MZwdZ
	NCm8Mg3+u0T1/F/JnC67eSyAogpHDMaYiS2dthQnm5G59mDa8bTZGGCRT99kndU1+3V/aAIfblf
	Gtg==
X-Google-Smtp-Source: AGHT+IERIVcMryduPU+3ecKegN+A1vCg/pfEbS6Jj0XrVd99pcxtEPjMwKwdWRUuqmNGdI0hOKLRwX5lI5w=
X-Received: from pgac18.prod.google.com ([2002:a05:6a02:2952:b0:b1f:ddf9:da49])
 (user=amitsd job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:158d:b0:1f5:7c6f:6c8a
 with SMTP id adf61e73a8af0-2148d332422mr10163138637.35.1746681101676; Wed, 07
 May 2025 22:11:41 -0700 (PDT)
Date: Wed,  7 May 2025 22:08:51 -0700
In-Reply-To: <20250508050856.674782-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508050856.674782-1-amitsd@google.com>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508050856.674782-2-amitsd@google.com>
Subject: [PATCH v1 1/2] dt-bindings: power: supply: max17201: add port property
From: Amit Sunil Dhamne <amitsd@google.com>
To: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.griffin@linaro.org
Cc: andre.draszik@linaro.org, badhri@google.com, tudor.ambarus@linaro.org, 
	alim.akhtar@samsung.com, dima.fedrau@gmail.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

Add port binding to represent an endpoint that connects the power line
from the battery to the Type-C port connector

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 .../devicetree/bindings/power/supply/maxim,max17201.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
index 4823021ff16b..50c2d672cabf 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17201.yaml
@@ -32,6 +32,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: OF graph endpoint representing power line (VBUS) connecting
+      with the Type-C port connector.
+
 required:
   - compatible
   - reg
-- 
2.49.0.987.g0cc8ee98dc-goog

