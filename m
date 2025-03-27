Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9DC19DF7D;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090759; cv=none; b=YcMYsFEokgfj5TEN3cVg461YuEA7bfvqqRE9CZvFRve00sDNKDszwhw+sC/jYSGedi9V3kUYoMj/5zcgOhkQ+UZqPyW1iwlh/iahOiTF+h3QQFuTH4wlPfg+y11muzyP3Qt0DxLXOHRlm1I3wY3WDRWl3UEkAljKYNK5WBYfdA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090759; c=relaxed/simple;
	bh=fruR+HANJtaCS7pv0tIznmn63cohTn5pkBrHDkeQ/js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sy6mZ0grWyvvQt9ZkzaeIUH0qWIjZAJPaKkOsHGNy6NaUaVL5svnD7OMi370ukugZI/FzFlvcDKV/cuAHwKSwhiv9LZiZYsZuQx0RM5VFztIjwlEpyLUYR4stnNfSGfb9fYX+QHgrbd67vHW/2BiHWT81nD4tWcV6hsTl9Ej8Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7hsl0AM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7hsl0AM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DD63C4CEF2;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743090759;
	bh=fruR+HANJtaCS7pv0tIznmn63cohTn5pkBrHDkeQ/js=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h7hsl0AM/22e/bEG6vm7tKzL9hKw5Ffc0SDldeO0CoRADC3nDBKm/BL01FZyWh8+2
	 YFtV/b5X8OGQuA8Dnx5848jxlcYndwHK6kWDY2i/MUW923jbp86pQe8/nZprdcgpbD
	 fHwwOIg31/FS+S+xwTaRrcNQd4Nw2wWFJjuobtkDK+sd8/H8xsF2VeAirZGf3W+pKH
	 58M8jQ+WJ3cBzLyhrmUU0tLwem//5qThOUfqjHMhBY+K8a2C5ptcphHiSwI3Ev4Spj
	 xO2JeITNEal+ZdtpA6c/qc8ig1ov5npo0CBjSgGPXQzckUaXHHYIeyZp2kE5lNZi3D
	 NOQVKAz5b9/Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E42C3600B;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 27 Mar 2025 16:52:39 +0100
Subject: [PATCH v3 4/8] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-initial_display-v3-4-4e89ea1676ab@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743090757; l=784;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=FLQCcTWqYBxzwTgGEyJvwN7uBqYk4J8ig3eGwMbzAQE=;
 b=wSQBKxI5wiMevTMoYJpi50Xz/fTuH2kMgJsTc630dXJtxeXk41frv+lEF4Skf497B5qsr9dNk
 Tz0JbNBB6KfBd8mK5U9i3xQfHobGNDwXJ7YW86eWDeeZ93MWRrgQ3sc
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
index f8ad2c1023016d7f72cccff880e3753d71d635b2..123f03d8f8bdeec6bc947044a0c46b84764863ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10043,6 +10043,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
 
+GOCONTROLL MODULINE CONTROLLERS
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
+
 GOCONTROLL MODULINE MODULE SLOT
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained

-- 
2.49.0


