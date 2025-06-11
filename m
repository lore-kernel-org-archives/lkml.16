Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD1426A1BE;
	Wed, 11 Jun 2025 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641344; cv=none; b=HzvQDcas7AdrFdzAXRJce2HjoAgaKrd6wV4Aqx4GGGjtE9JFb2h15YUrm2RKCjOZRTwA6t5DATUCfF+YHx7Vi/pSpyOUdnSxNXW1DKBkCwuEbpYAOvltjP6LJnz80c6QfleWqWIFOEVFKLz1pNd5UTxLsQZBoFF/UEjn4hsnYVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641344; c=relaxed/simple;
	bh=nUx04MmhuQ1OFH6zk6kP71kqDpmR82BfJEsV7z3US9c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rnhaE9wkwXksO5jStKDeEd7EIow6MGIGsMTaiDYsf7Aus8iXoZ2p95K4Rs/29aRnHRMEyj3eLIneI9cnRPYcEVTovXPZschV6aGEkWh6yl4vlSBrRGySP9tYCAgzYX5mKP0qAGDr1jUJXIpYFaY38QJlsAWG97E47MDpfuOp60k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FB7IXEkP; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FB7IXEkP"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso6907256a91.3;
        Wed, 11 Jun 2025 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641343; x=1750246143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi7qs6/0obufZNyEqVTYOnyqV5ylPNwI/dhWbrEmSr0=;
        b=FB7IXEkPWNptpPVut9r4NvsxGarAI1vJKD1K4sD0vN20n65IvtzPowaKuo+JL6FhrG
         UmSwpkM5ruZGZwasA6YDcfwp0k/rOBgcsRa3TDFgA8PnxLGypP+qEZ1aHREe5TPiN+ke
         siwPQziYyCI4wWbfvybnw0jM24fqi2KdbgExv7KD06Lt7Qr0goX9NIZk9pnh+Uanf/lC
         R/l8qtFG+UgrNmgx3EhmZWL5tHOnPkCq2k99V0qCNtI7ll7gJHAAVWJoGYwqJ/sqxHtH
         v4WksMyE6i4am6rpw84KNjQ3D2lqRx+fTFQB1vBrVgXpiE8OfAHiWv06ZkWt9AZXVumD
         3i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641343; x=1750246143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wi7qs6/0obufZNyEqVTYOnyqV5ylPNwI/dhWbrEmSr0=;
        b=PiOj06NusdkIpgdeChkmH1TJWcu4RzOYYQAEIHElLl0p/CybhSAoWqKfkU1Xb3TTZm
         WwTl7gcMnbTaf4o8txcgZuCiY8h29+DC7038gz1c8SDjjIA443uT0UkBGv0hiG/ui7wP
         xgiE2jqwFwpMHviWiR4Ui90x8vNWZI/+ZE9yoIa1CNBNZ9mahRWGECfyEgSsnCzYi+Ve
         P4WBE/gK3yisoVp23rG/UYU9xUS0qSRpBk9BNoN+3KfXrvBU3UUVU8mlbV3AvK1fiikh
         o7odidy3UIW7kXKGiuxKyD0oL41kp8yk9vsugmuVBGAdfajl2uB+/5AvQkNqcISsgNKE
         qw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUISzJzFbuyXrDTN2VODnki0GBAbtrg3fcLIXwEkI1GLeDNSz/DSzSryvScO+uyw4RdfDpO4qXzKi7f@vger.kernel.org, AJvYcCVeimd1JoEQOlcdE6rWEcfdh3TRzPR5Cv0Z2I9uoKT87sXAP+V+1+AP4WGTSI1nuG2Nu6o/xfCRpGPTLftw@vger.kernel.org
X-Gm-Message-State: AOJu0YxiziuMrl/J/iHpLVNn12/2jWSFu0pYYtX0lZu1AHEI5OBL+9ZY
	l6OnTB3BL/ZtAYPNGFTncJ5Laqj0l4A/q9fb258YTbJGHZ/KYh96ryec
X-Gm-Gg: ASbGncvFBafqooX+lISUmR/Mm4D9mYA8DtSNhjwyjptm00g3/YqBAdtHqq2r0T3VQ+s
	xx7qcQu/W1q3Pue4JVfMl7p26ZuBZL8JE8NlgxD0kDH2jYki2CxPq3d4weESkXwdZMVDhD1QlDH
	+UyU1f65ygqEdKdmN/hLtYisL/NTweTbcF2fxcwKZBkb1YJlrSAFJroZfr0ZfENlx9IhTCFStOH
	4qHxkiiMuMm3tsCht5TqTjYE1z5pvq5K6en5UNXcpoZR/bORntSJyjZKRpDHvD4ub/V/3VQQwud
	DIZnCwLVsvuBp6a/s/iOOx2KgEl1dN0qeHL0Bsj2bTUQN/nCci/7nIAFjY5XObVUNNY5D2vU2sY
	bjbEdsRj0PEJeZNNhIjfrg6sIT/QDgPslLORLn6DwzeJwsp3DOf4a4ktXAS59u9dC8jELIbp9FY
	E=
X-Google-Smtp-Source: AGHT+IHMjJzse7RRflhgsuTZl0mG2rLFTpa3QofIjn2JTX+BYAKzHeTEV28/i1Cf1ihDW7WbHff7Cg==
X-Received: by 2002:a17:90b:582b:b0:311:cc4e:516b with SMTP id 98e67ed59e1d1-313af28e377mr3594748a91.32.1749641342638;
        Wed, 11 Jun 2025 04:29:02 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b1fee63asm1082246a91.3.2025.06.11.04.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:29:02 -0700 (PDT)
From: Jason Hsu <jasonhell19@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason Hsu <jasonhell19@gmail.com>
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Wed, 11 Jun 2025 19:26:49 +0800
Message-Id: <20250611112650.595554-2-jasonhell19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611112650.595554-1-jasonhell19@gmail.com>
References: <20250611112650.595554-1-jasonhell19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on Meta Ventura.

Signed-off-by: Jason Hsu <jasonhell19@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a86b411df9a5 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -87,6 +87,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
--
2.34.1

