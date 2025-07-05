Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDBF204F73
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731319; cv=none; b=u3ydIHF88vYYPOpi1pnWg5R86NPASYRxTsM+Hc1xhc+e+7hKxuX5ajTn45/DfIHsmjurWVl4UxfFZCUXe4OrtaYJf3zI2fj4vwPzk7AR0upADruAdlBr2bDvBgNEQ6o9B07AF2MpYGt/jS5OSBM97DZAudAOFQ4prVultQGRx4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731319; c=relaxed/simple;
	bh=9keoWX7Ov4S4jZCBKlo3e4QDO7a1HexE+yQpD8yvh+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PORzz3M+OeseMPn0chwPjmkog7v/PpprQ5t4byGV8blzqzHgeVkXhFgJbc9U3JPutO5gp1Dy6RBK5NLq/B2+/3JRwdQO/UMzIaviUON6KmkF7J5mBpxS20js4N0AAnctlaFvXDfEdEDOdIueywaUgRjHxhgcW0KY/KlIhL1jWxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7cS9QJQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7cS9QJQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d7b50815so13395385e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731315; x=1752336115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9//melEuj5cFEiBGjFrC0nTmBJWerTiWP5eoVRL8g8=;
        b=U7cS9QJQGg8PJ6lf0fQLqiqyDB8ZUFERarCbBi3y/bynfS2O9jXWR63bxYsCZJbq0z
         T6f0jd5JGVxUixhaiLszHGyl6VDTGCQlvWBCkFgQb/YFnfg+W8+j14iE1u4rpjPI+uGF
         eDIGgczJ9oMmq7UIFJz9hxzNyMgqWqauEPSLWLFkMLO5gG2Yd4CiXXKobNAlfwcxPBwj
         zFOgvl2OxUXZ7/NO9iJeXWUvvxptl/D/DO/uuhlOq9h5/3hpD6ulIRtyucg4XK6J0sib
         v0Lpcu/cPPcPfRujGZE5Y59VYealE0n7qGQny6oV3hNof7ZJc93FM383DCAt8ZaHLLXD
         185A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731315; x=1752336115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9//melEuj5cFEiBGjFrC0nTmBJWerTiWP5eoVRL8g8=;
        b=Qf2p3bq7GLXqB4QimUCTFri4W6GA3lnpc59N7BurUCAHfIXpJyiZtfnmI9NjKrccf2
         bxF36VriTHvLKYUQsDj1iDFmJ0J7Vb8taBAPOzVqvMubu9nI8yF41oBNQ4VMu3Vi57Lt
         Qg0mUGnXIoAoFFqu1U5r1OZcScIYG+EIz5VDZF91TQqX83VNYkgbec3MFnc6MP4++bmO
         gBetmf7J3dV2k08MEhFssxhnZBeGIxC03Mbi60ubQo/ZtW4DOFj+F9suQcPc5hq4jfWE
         bp5798O5aLRyFcgbOIbqUUcnWCtgwrjx8VUTCkEcx9CtrRKRJ0EOYbj/3WjQMOUQdXZv
         hfgw==
X-Forwarded-Encrypted: i=1; AJvYcCXJoqomzwZ8DejOAPzSycKJwU6dN9TClurysmZjYLxks6ZUCDoxIv1Srvm5FiTgMt/3UXU/TZnr2ZT0NQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy1W4kmt7G3YviZ5XY4H4Bt2zLmJ2NnNeBiD3KMwZ9T6UetdkJ
	AGWT8ABlUFKLT1s7nTqqjLbTjCabTfLa/r1SAksgWpP9vablrVqlK/yily5FKMo4LZA=
X-Gm-Gg: ASbGncvKKjFSL0stoRaGnfRzymfGdcoiNLb7jWjZ2BS7MoTXSNIvRmTiIYd2Hu8ePIQ
	ePlFQvUvLOo398BirY1Eaim2/5qmqFAk5qrLIrYNbTEYwdmSlYQ1yDR+DSd3NM1uSVWf/Z35D1a
	JkcqgiIjLYFh81yaaNu+1QnhpVeq/nojgs8FEKX5fl/e7zT/ylAerLCSy0JOiL9EYWIs5uUQ2fK
	eL1EImhJiAOIMX40Uj+CSRUvCl7hUSe2VFpG17qv/B/2t+EYMeBP+XOC/hKObjGynpsoynUnzRY
	0ZVGNP37tLHIu2mrNDp672wdqngJ7BVrm7scc+mudjmUCsCuaDf1g1QLiLG6LAcxzvScpAWWAjX
	WY/IEl3puDK4d
X-Google-Smtp-Source: AGHT+IEls66kg2lSaUzmGK9alwJq0YWTWxf30IEdr8JXptk2kZDaVI/JZp2NtEYHWQjyHTVPV/FUWw==
X-Received: by 2002:a05:600c:8112:b0:450:cd50:3c64 with SMTP id 5b1f17b1804b1-454b318d3e5mr67373515e9.31.1751731315450;
        Sat, 05 Jul 2025 09:01:55 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:55 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 20/20] dt: bindings: fsl,vf610-pit: Add compatible for s32g2 and s32g3
Date: Sat,  5 Jul 2025 18:01:26 +0200
Message-ID: <20250705160129.3688026-20-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../devicetree/bindings/timer/fsl,vf610-pit.yaml          | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
index bee2c35bd0e2..2aac63a58bfd 100644
--- a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
@@ -15,8 +15,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - fsl,vf610-pit
+    oneOf:
+      - const: fsl,vf610-pit
+      - const: nxp,s32g2-pit
+      - items:
+          - const: nxp,s32g3-pit
+          - const: nxp,s32g2-pit
 
   reg:
     maxItems: 1
-- 
2.43.0

