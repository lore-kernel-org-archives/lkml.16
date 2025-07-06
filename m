Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08BB1D5CE8;
	Sun,  6 Jul 2025 04:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775864; cv=none; b=mxam/t6ANKS1x18+vIdryJru8M3qiomhOQSYk1/mHWG1AvfrSF1FQ7fRRZeh8HUSjUJeullfW6vq3kv7JPvtzmdAOFBNCxPPuGvFsGcVb2u/gE8/I6+NrVm1S2vKg/zk1PdwEeQk8FV80yUKWNtjbwmX8W0IqvZAJ+S77QpKIMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775864; c=relaxed/simple;
	bh=v8HslP/PD75kqB+s4BFSNtIbfK0J1VmtBmM5TDl6vyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1NI7ts7VfTiTBHb+0WmcNUWoRnlDjiuYQ7/u4wLyVnYPX0etp0CzTlp+gV64lFoIfB36/KXQsenap/VNb0/SBDq/JSoJRzYyP+Ke4Zjy0stmina+z4xWJctqSltJORcQeHURQsjw24PQ+LzT+DRgq4GXHGckEN6Aqln8J34sgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+jSbHG9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+jSbHG9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748f5a4a423so1149601b3a.1;
        Sat, 05 Jul 2025 21:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775862; x=1752380662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+TNVR+2IFzAtjBiWC0iEjjaf81G6DZHJX+L9O53iPU=;
        b=L+jSbHG9/Q2w3k1Peq7kMoi51kXRYvdGkU6/cJVMdnou8+cQLh6XS3F0lEzMcPTyk2
         tHmsMZu7uMCi2TDXKDNk0SinqPbsSf4u856C5B3e13370tHGsOqJ/yYWqZcwAx2bN5b5
         hhWRFasLA6b5euMt3vFAoQoOQHLdvSCXxQv8SNbhiZ8b99bxDaJfe1CabhjdJdkxs3WQ
         okig3YuszP0mzO3uCbwIijuOOoqcAFQH6V1/JWpff39BKrggsijxVy1/NrQXQqNnY2pw
         K77C9w884GRIcg28qKVUA/ohGu7wXKpAj5tpPKwFcNgmuNpbynymqYd8BwCMH9maL9MB
         d6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775862; x=1752380662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+TNVR+2IFzAtjBiWC0iEjjaf81G6DZHJX+L9O53iPU=;
        b=r8xxc7XpBOVXbTdR1oq1fjcIgJXPnl0rNpubVQ/cCtzwghSk77X0gQqm7LkVxgMaY0
         vIfct6Yfw3oXMhJIDvQvrZYvfmtOCArW5cXfuiunSYjAl03O8t4wtknSPEHx4bFq7BC+
         aiAVmn2euqRKaZIGgoa33cLLLNpm81UmKS24CcWeC1Xdq/zKR4n5I/yiKue0nO9JN8IL
         msIW8Nilm+fe/RuJo7CuYVsqg939DhUJKTRWvbChJomWpF42I6vTkTkF4U6/nOqEm0Tq
         478gPnEhEFI5za7DM6mmQ5WyNG8YGAoRvlhsOpAveEg7eSTPTiwktPlqcz64ykJgxtNK
         soHw==
X-Forwarded-Encrypted: i=1; AJvYcCUJVhYoAM67OtqResjaYK3bK0YYCVXDwEb2dzjiw6WVFQFwmOEJN7HVg1o4Pb4z2ywdHrqk0SgXmQGY@vger.kernel.org, AJvYcCXtB2kMl54PCrJDNqOmwQ4smee4JAdc28K9tdlzxabCP2CjkHQrl78lDBa24nJ0hITh2avkrCeZfZWc9MR1@vger.kernel.org
X-Gm-Message-State: AOJu0YwH2jiQwg386x4jsdE1aVfuDJ8utCTf/uSrC0QRos0hNqzmR6oh
	KW5Wf7VH3r6nDfHdtK9lTUE2GR7W+S2CoFR3uoorBpKtPoWskW+0TwDrIcV9cZcE
X-Gm-Gg: ASbGncs+cwgw1VvJsuexcc3Msb1z23m0+OMbBmNIJLazBJ/akmk7k/nrs369Of4RQlP
	eQEQAbiW1ryyV7T0ha5x0ZjHlNrx9N14Ym0QzmcE+N59VqErHWHjjAAo347DQyv5J/KumMOqK23
	XNU35IYQxxiravVnu7FOdKecynezgyBcseqEVz6SQ9+D+3+7j9MXzib8DvQI8v6Kd2p7oaY9Wd4
	2JXqzVzC+bxpdvD/Og1sAVWP1JsN1VCb9YdoNIOsOWuuz9PaNvxP1ATfl2UX6ceOLo/1pqde8O0
	T2ZfjdRTLhsmHKQahZLVkfpFLav4hLv8GhZzTla99SJb/fKkFTy0XlU7Rg3SC1YIPXtVH3lDsBC
	EdFkC91oB3p7dzPVhEtXTiNYNS/D7Mls7FeCf/rw=
X-Google-Smtp-Source: AGHT+IFzXt71OuScjjUFMjwAfrt7v/tObafbS0wRGH2aMUUWpXXz1uiF0tdrfgd10hdbuTwWyxGqEA==
X-Received: by 2002:a05:6a00:6ca1:b0:74c:efae:ffae with SMTP id d2e1a72fcca58-74cefaf0042mr7755377b3a.5.1751775862296;
        Sat, 05 Jul 2025 21:24:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:21 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 8/9] dt-bindings: arm: aspeed: add Facebook Darwin board
Date: Sat,  5 Jul 2025 21:23:58 -0700
Message-ID: <20250706042404.138128-9-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Document the new compatibles used on Meta/Facebook Darwin board.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..dba3d07cba84 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -82,6 +82,7 @@ properties:
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,cloudripper-bmc
+              - facebook,darwin-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
-- 
2.47.1

