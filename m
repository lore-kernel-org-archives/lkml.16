Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C4F1DE3AA;
	Wed,  9 Apr 2025 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190323; cv=pass; b=CExwJDuw8EZGb6wFbs+yXLAEsne7YOK0W4vGu2b3UfZ31wCTSJJ3pUqyN0XZlJnOECIGA52pf2oSpxYerIRfn8dJWpkXezF2Dr/jtEu+yNYziRkUnENbv5Y5h4vztYLOLNlnUlIZoA0KE9rKAxogtWOPYyhnLaTv6IKtb/QBC/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190323; c=relaxed/simple;
	bh=/EWHlmYXaX+Bvh8b073v4/q3puALtJJtIUIUWp1XOsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fbwb3Fz48D1E3Y6vtTFFqnT602hvbTNo+C7BaJ1Ox4zA6wMBk79THKRvN1J6U8XkNHNWmLg+B1a/Ngun7g87sRXJirZ1TNg2C9BmH0r5WPhf0dMSQbSo1KsDf37k/CrFIhVT9360zD4tcRJ5/E1wpsXAb6T5EpRh3+i8EW+9GMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=Bhbga7i8; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Bhbga7i8"
ARC-Seal: i=1; a=rsa-sha256; t=1744190298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=noaV+5Df7rQy8pCXBcixf29FwbUky43S4/ZSdvz6tjX0An1kW0dbpUW+Hm4dzlD1T+MvD/NahFZZBeWQjlRMDF9fHVpDLRggTfuG5+XVK3QGXxBNcHnKIC7vjaNNA+6rgOhSWDCIqZ484SrUM9DItiVjJtTw52C3bvZVwIDxjnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744190298; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QBe9+uH6ODWa9iTcZwQDOb5iAmFt+z8pNalKVqBUYEk=; 
	b=YBqdjpsLfDAFVWjnL1A2GbS87D+d+HlmjHL0QGUIqDatEtQhonsJnwMe5AR5jLbeoI6HaJWC8mV1G+uuYWnMtgCqvBpoL7BIIp9nj3kuu4LGOWDL60O6TQ/MTJCQlgrKKej1NGfsGyAgku1ITW56WVg9dfuIDgMI4t/DYLZX9eQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744190298;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QBe9+uH6ODWa9iTcZwQDOb5iAmFt+z8pNalKVqBUYEk=;
	b=Bhbga7i8hGzD+nSQq80LKELsH1eX8cZ5OproLFqKtbjHp4knUmOwnnmoncWms+2/
	FEB3/GQvzHSxr26Y3Ps/P7KA/LMp0nLfs1QEwskVSYDuCrpJUVf5vKmErJv5Tzsca4U
	poDVoe6nRxR8BS/8WRnMh2R8E1K4shxwS4fUJwmNpc2bwQzTmW2s5caCAUqkzzYHaVs
	UXN5T7AVejbu9GEtK1FhVG0kvZYVyr/wZLrEesdskjXq5x14Gn/HYr7gUV7uDVf1ikj
	eqPQs82Bfcq6dfD0XOBa2qohgmK8bDgaROe/4nooV9Z1y/8IrrInncej/RwTXUVWgAc
	BXyIDJvj5g==
Received: by mx.zohomail.com with SMTPS id 1744190296788595.8894788219615;
	Wed, 9 Apr 2025 02:18:16 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/2] dt-bindings: riscv: starfive: add Orange Pi RV board compatible
Date: Wed,  9 Apr 2025 17:18:00 +0800
Message-ID: <20250409091801.855083-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Orange Pi RV is a newly released JH7110 board by Xunlong.

Add a compatible string to the starfive platform DT binding.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 7ef85174353de..dd5cd51e38797 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -31,6 +31,7 @@ properties:
               - pine64,star64
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
+              - xunlong,orangepi-rv
           - const: starfive,jh7110
 
 additionalProperties: true
-- 
2.49.0

