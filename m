Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA74199FC1;
	Fri,  4 Apr 2025 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774795; cv=none; b=fIoajhNRvELwS0g0Q7JQbIAC37RKHOhm5VzhbWIWOHpJtV3s78+YgI9BXqFOz60khbTc2h07GkGbVcoRUho1ufkeSsoWUaSxhME1INqR0vSa+DE6u235xpYFfFlb0hsBeyh6c35nD00puAaWMmaGToSDiHVgGx+x3Ed22Xm0suc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774795; c=relaxed/simple;
	bh=vR24AuULjA4+FsZtPLkXjrIG5WFlOIcKpNzCDaqBB8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=teTIvHZ97af5lF5IpIznl5O8bRg/FnGQ3OjBP2cSsVp8XvGfkjpU6KvQBBR9QuP3xs72bqrqZBX0iIHKE6+P3YRL70DnvW5zMxmQ3Rgp2EBtkyhpwnO2ehLA7NfHxpQo+BplBdqB40mdZ0vTM6NInR9gc+t6s4qR6jtyMOPMv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o8Eb81yc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o8Eb81yc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743774791;
	bh=vR24AuULjA4+FsZtPLkXjrIG5WFlOIcKpNzCDaqBB8I=;
	h=From:Subject:Date:To:Cc:From;
	b=o8Eb81yclHsonFXupkotQQ545cCg1bjrcg/KlF+sm4DtYaKpbAjYczvlI2rBtAN4H
	 nhuW6IAhFV89ORMHep6ac+fbEaMXoPTLIlI1QRLFhqCqPExaDxvL0uibg15dbY/hqr
	 Xy5RSFQn/EYF2cxGGnVC5mXf5i1GSeAV+yboQPxsZN6afxxc5s17g5M0Qv6/ueYy+t
	 SwdUWIcIQOYpNR1QXuxNG/RVQ3jP3V2UkEK1aTOsKnREXoOKPqy2ZeAZSEYfImhwUO
	 MrWVS6HjZX9YlR9O+xrOAvEouLA/64+7vfkuVZXtObUTP5a36PuW47uyCzYId2rtm0
	 yFV0p5z0m7OlQ==
Received: from apertis-1.home (2a01cb0892F2D600C8f85cF092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E7BC317E00AC;
	Fri,  4 Apr 2025 15:53:10 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/2] mt8395 evk/radxa-nio-12l Add scp firmware name
Date: Fri, 04 Apr 2025 15:53:08 +0200
Message-Id: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETk72cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwMT3dwSC2NLU93i5ALdtHJdQ2PTpBQDA9NES4skJaCegqLUtMwKsHn
 RsbW1ADuol6VfAAAA
X-Change-ID: 20250404-mt8395-scp-fw-135bd005a98b
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ben Lok <ben.lok@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Add missing firmware-name property for mt8395 genio-1200-evk and
radxa-nio-12l.

To: kernel@collabora.com
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
To: Ben Lok <ben.lok@mediatek.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: kernel@collabora.com

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (2):
      arm64: dts: mediatek: mt8395-nio-12l: Add scp firmware-name
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp firmware-name

 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts  | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250404-mt8395-scp-fw-135bd005a98b

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>

