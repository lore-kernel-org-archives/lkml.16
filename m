Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C9278E40;
	Tue, 27 May 2025 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358625; cv=none; b=H2vVXeyz0GZ+SvATgV4QLWk6v6OynwnwpuR+kbZVWVGdX6hOxiVAemMcMO6WJuj+qhqpcTkgF9aTJ4vqsR4D50B+F4L/nTev8X6gyQGI9+k3vw02Z4XeTnz5DSCaDJXsqswp7eTGTRtzho5C62Ducfv3wwO3nn40y7LM2oUnTaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358625; c=relaxed/simple;
	bh=ijzwnnI/HGCOYp81pOseMCjlmDojsIOrtfsqtslA87M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=nDSPkVnCR4JYP6H5SpxFhjAn3YlJlof1qyysxXi2RS7uXeLQ96znaDZwfB5gVIzrWbX2NYFwchiwvtWSqGn8gTVut5kDHtr6q1BRDcVcLjS0qlX+CFuVcxiYGg0D5fFTIeITqLQIlvSBQ3C9vZc8EnkPYbx5gQXY7BFuucEqw0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXRSn9Ef; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXRSn9Ef"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74019695377so2194694b3a.3;
        Tue, 27 May 2025 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748358623; x=1748963423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=DXRSn9EfYvG0Afgq0IxovdHx+GIqHQ6QaK6lSr7ReHVntIltuVsHWjBry0jhdcqVt+
         Kxw51EKpZ+ZRC3MsJASOn6XUntU1nph/2tTLAHPRqRj1BaT3sf6V8FZhW6S5fiepomlP
         MSp4o0vR63yeCnaoXv0qq7pXTTw9+SCDluV+h8NYI1Z+gqTP+VFSBi5zWxNSIiwdl8su
         JkeEfxDZ+DpqwN67bw8+tkwrorrQx77YcRy7Qlr3k3IJ/vupYHvKu17rO0UlRQ3jVwyo
         NqLEzMnKDSgJkvcv8FI2JRb5qvcHt9K7qoO39NlYDTl7h+kXrit9BdnPD8Ss9R1rwNxL
         qNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358623; x=1748963423;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=HM0LOwL2KJ6ZrcQ28wPqJF6eS+50/FWrqpV/BypNk7fd6wqix/j1lxHOXwLv/XleGD
         OPvG67BvtHqA6WnOxdecJS4Er6nhC2RaaBL5DbgKIHbJvyzAZJthdje4j/cg4NmqSDYp
         gtdh1K3yuS4Uz9wfDDtAZmvV9wCBNJxsJs1W9GMLdfGQJa3hm5yQt1ezZGkir1xq74sD
         aQkasmK5J6JEPGXjZj//odrWRnBxnBLTvo28Sv75PUdk8VlFi10Q1y2PHQSt6r01U1Jy
         7gct+AZoO9o3aY1hNdTegOwPNJyR0SudkyRU1DZ6Y5w40u/eTsq1+81Lt/F3UOan9VNs
         FOuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2A7hTeCXVPSlzNpczRiQzXnUYhKpbI/CfZo3Z4A1Z3gZ5thSe/s9H8nZIPfJwbVxwlFE1pyQGEhND6dE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyECxPN+fUl8bmBxp/1Hy2kVZ75cCcXvPx5Nn7kZzwe44PF2giz
	0gp3gn0kGvzCXJCdHSPBNrxhCRR5AGObtkepBu9YB4pjUqWcPukUpqnP
X-Gm-Gg: ASbGncuLymGol0gL3s/IkcbtQu62U0hW3E+NQNh6eKQ/hGB5deu5QjoExXmFzjwBHy1
	6b1yUHXzSysFQgd5saFse58nDwuiirDYTDsj9eDs8AA8kkmTBVAvJrXNqlX/YUAFyI2V6jJSxoZ
	DPRgczDnDrJufO5il0CxM3Ebv58lu/zntErUIyl3qQhkjOkININaDAA8olfvGHP9Itiy2jCEH+L
	hrF6cwjJTGFw0K3x/Lz9BjsBh8qevB3LGegEPM3dyCL31ILacgmfdAzhS7R1+kNBNPzTIB5Ddv5
	cFf5IG+Wgql5Rzj0njGKLZVrMgeHMYPcMgaDzWFHF0IBZdv9vdS49LsnMkcNuz6IvqNfUNwv
X-Google-Smtp-Source: AGHT+IH0RFT0xP+3+dNVvU0bw/BAG60Nd9T6wKSR2SIUzdNr5GW2guXZ60yJdjSdkxe8OyWvVV66/Q==
X-Received: by 2002:aa7:888d:0:b0:736:4ebd:e5a with SMTP id d2e1a72fcca58-745fe0c7a55mr20646910b3a.20.1748358622652;
        Tue, 27 May 2025 08:10:22 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm18869987b3a.31.2025.05.27.08.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:10:22 -0700 (PDT)
Message-ID: <6835d5de.050a0220.14ffd7.0e18@mx.google.com>
X-Google-Original-Message-ID: <20250527150946.2815348-2-LeoWang>
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
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Tue, 27 May 2025 23:08:48 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527150946.2815348-1-LeoWang>
References: <f168126c-e0e2-40d3-9b9b-2a5002a75474@kernel.org>
 <20250527150946.2815348-1-LeoWang>
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

