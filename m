Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1856925CC4B;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722894; cv=none; b=YJKzdy/aiU/Z106apyeF/AV+e/VL1654xR928yI9T4SKi//BkafhOFcBLoE3l5gpnvbjGIT925lZwyscVLrdIOwkCrHGEgrtfm0Qb7xQbC1ubSBj0YcP3DKEpwiyqYKYqkUs/MxXHhu6XreUVsYr/89KwF6AZSm5mL4ykHsiNF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722894; c=relaxed/simple;
	bh=gJf5CbBqH0C0nOOWFRC8Iyrhov631LfP4YHpR5pnMYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhJSDLWJ/BwWZT8fqtxaTrzFpfH9e2TJykk7iurE0jBshrMc3LXyZJg+WWthmHTugaIrFIKtMp0KVfLja02RwED8hLpXDF1xTTlqAvQq6bTfg8X2IajhgkjHJIaQivM/t6wu7sJ/LnwLN2qnlBuY0es0ZOyIDn6v23RBn562+ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkxY8uhP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkxY8uhP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3F40C4CEF6;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747722893;
	bh=gJf5CbBqH0C0nOOWFRC8Iyrhov631LfP4YHpR5pnMYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RkxY8uhPOQ8J1ybOy9dBN+MHzE8rX/A7vKvyvK29HB1X10MxVhvS/X8qvYYwRhe7v
	 RUhgyK3LGm2g4fxsYDHu3erbmUYXDmUK5tJPfMjTFHQETWkuK0KsgziImuf+C3Es2l
	 5cNQhzW7mBDiZvLusaFKVYtev5zPulSWH3gz41sh+gxQEbWIym5zzsYwCkIUxr1E7x
	 jJ60Vm/hksx+jRcP1L/wUGAmM4GSeXV3eyLoE4jiL2OT6EH8e8uP6vnFwQS+EtWXOj
	 ZWGKZEz4Bp38K7CRJNXc10Fgr9gYBbYykaCyjowogm+q7DWQ5b9JovdGcHaRYCjOtQ
	 8LkAt+TVF4hHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8985C54756;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 20 May 2025 08:34:52 +0200
Subject: [PATCH v7 3/8] MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81
 COM module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-initial_display-v7-3-a8f0195420aa@gocontroll.com>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
In-Reply-To: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747722892; l=931;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=45G3DurvF3CmLAxUTF3brxzwuPgV1THWsW5gIgc1doQ=;
 b=CQH12wu7IqT+OKtWWRDVwFeTbRfEnnoXottrYZk5jZy4PUIBsZMNrbe/XQMCICNMe358xVFaA
 vC9touukr82CtBc37Fo3d6fIqXnwgQxTkF/mSduGMTEgR46wxfYDt7a
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
index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91fb6431570045495ec23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12779,6 +12779,12 @@ S:	Maintained
 F:	Documentation/hwmon/k8temp.rst
 F:	drivers/hwmon/k8temp.c
 
+KA-RO TX8P COM MODULE
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+
 KASAN
 M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 R:	Alexander Potapenko <glider@google.com>

-- 
2.49.0


