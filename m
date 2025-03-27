Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F719C56C;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090759; cv=none; b=Jr3Ul3wvmXUT0aXSyrIrN+AZnyVfn4+jXJYSKSYRuwPVVL/0/1qUSaBJdy1jZ/qwqbwzQO4zgiZ7aCpnkt6lDbYD0OudLcOHJNDJ+Ry7tzGc+0ghaZ0k+mdN8JhszMqTeHztNsLaM5mrUWbEYF5uSIGZlIhqE5QJztbKFwSaI0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090759; c=relaxed/simple;
	bh=92utogQMcwhyWlhaiUB3hy+r80GTGj6Hs9VRyEAjh0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ss7HQYLJ6yYyPfhwmux3RHLtS0fV3mQRQOCEO9JjlQxR0unEDQmIsvUkMg8nDTHUgPRA3RrZ56oMPxlRULa4sXD7nejqqlL01h7ENexa+uYi8xYNXED7LV3eRAQNAJXn3+MjlJnBlT/wC01qmEnkxS0anIGcbk9P7PRPp+RjCU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCpSSHb3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCpSSHb3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26219C4CEEE;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743090759;
	bh=92utogQMcwhyWlhaiUB3hy+r80GTGj6Hs9VRyEAjh0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XCpSSHb3NdcgaiFzTSYONFfwnr4wvcqNw2EgU5/lLW1d8sMWo8LFjHQq+j5mTklcT
	 eGqFy+02XgezExvtefCnk42WN5NS0XzAh9L3wOanBTgQRvXPM7s3BflyxHsuQ1Vj8P
	 V4C2ucDMbMfFjls4+AksTu/0loCn4MLlT6jJYK1eoIM24ZRRzvs9GB0pBPR3o2XjHz
	 fWAj02nz3Vrp7QPLBka3jIC4n/R7kjiFxYYXna+0YgoOCVk5lSJP+hl4hS6bCeoi2n
	 8ty5Jm29454FbypCwoeh1jv2632c/wSnKahd+DbZMOnWy2Nm2/dizAondPyjaqdPHH
	 6WapKyQZ4IBjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F32C36011;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 27 Mar 2025 16:52:38 +0100
Subject: [PATCH v3 3/8] MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81
 COM module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-initial_display-v3-3-4e89ea1676ab@gocontroll.com>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
In-Reply-To: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743090757; l=938;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=KWBmWJYZAEU0seHj0jSXyh4vIhNFeNg5DppjC874JB8=;
 b=q/UBBL+LYJA5pcGDSuTQs40AloieOXHbAumcVf25yCzVjg/H2s2t+1xoMynKT5f2gRuEDJ5Xy
 n1+YUlByj8yCbS1MwzsKrs77zpdgVDBOHmJgkbaqCwiUoY7+lAGBD7+
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
module bindings.

This support is not officially done by Ka-Ro electronics, if they at
some point will supporting mainline, this should be changed to them.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..f8ad2c1023016d7f72cccff880e3753d71d635b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12752,6 +12752,12 @@ S:	Maintained
 F:	Documentation/hwmon/k8temp.rst
 F:	drivers/hwmon/k8temp.c
 
+KA-RO TX8P COM MODULE
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+
 KASAN
 M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 R:	Alexander Potapenko <glider@google.com>

-- 
2.49.0


