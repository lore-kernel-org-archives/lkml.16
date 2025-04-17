Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA122A817;
	Thu, 17 Apr 2025 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884850; cv=none; b=Iathj7zhqJL2bz6TY53X8lfhAfvY7l1YaG8BiSZuptzNtJtfkm3/tXVNlDe/rSZ22VBqh48YcQ46Z1lRrCBI9fILNvZ1kIj1lqBJYq6GpphG20ZFNLYwvJOtJTUkFPBf7ST/HB4o4Nb87CAKvIFyPAH1DtSLRow0tQat+gZc0ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884850; c=relaxed/simple;
	bh=hrPSQeENU4uIDE2eHQ2o1WCsLDaulSSH1VdJmPvBaVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWGVvgpzvRCKOJ/5YLyj3Dw8+3Z2nD9qpobL/j9NJvwMGO7+x5ilM2FO2AqSLp/PGfySixmf6HcapHHaf9j6WLHc509YWkQv9WrioitRDvY9b2nhAy9Yc7yrmDl24DzuZWzrE23Ru54ZrsSSAgjq22fSdge3uGhbo3jfwzEjEwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGS8XwNd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGS8XwNd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EED28C4CEF3;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744884850;
	bh=hrPSQeENU4uIDE2eHQ2o1WCsLDaulSSH1VdJmPvBaVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rGS8XwNd9vPwIX674pUwFgxxR4dmj/iP9+VNa0yV3dqREB4uGM31dB7YIorqRkhWw
	 D9nS4ain/EcU7nKjXBmYLrt0JTCezdu4M2+M/fl/Yw5OU+3Hh7Gp5RWEblCqTAxmQM
	 kDqtiT8Dh63NivRXxojSIDYgtnhtKlw0V/0aEsAKouCptXOPPYnQWY4/OB+aRjAX4q
	 B0yx2FkvKuVF45pPt82m9OtKSNvPR9vR7tSSGkz+zwGoOgD/q01EYwlv1lepNTf+Pd
	 2bi20eGq0d2D/bYGXbirZis8zDb6Rl8u3OLBVf0qO7E6cYyEcVRqcVID1z+ckPuepH
	 y6IsJriiPOKzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2628C369B2;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 17 Apr 2025 12:14:05 +0200
Subject: [PATCH v6 4/8] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-initial_display-v6-4-3c6f6d24c7af@gocontroll.com>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
In-Reply-To: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744884848; l=777;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=U+cI301uttTYTg6gAR1QRerlXekISKPf4H+SFf8T4EI=;
 b=wwQo+EHWiwxiFPkQ9jV8EoqYOLl9ZEgbLzBriJ6o10ZAJ8Uo2ffsNX6kyHE8xk0qclxskTUsv
 0NDuOTCumGICFSFIu2JT6tmgc43TnW8AqQNL7JGl3YGXy8RPAE//3AF
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Add a maintainer for the GOcontroll Moduline series of controllers.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ca022081bcf564c8ec91fb6431570045495ec23..3c94e530d0784d90b50109d4f9e7e6ced40f08b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10060,6 +10060,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOCONTROLL MODULINE MODULE SLOT
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained

-- 
2.49.0


