Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D438521A457;
	Thu,  6 Feb 2025 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850520; cv=none; b=h10LUj93a+3wc6svNMw4YphEL8Ur3gTBud4GGMwPbqnKof96V9jb4ZZRAINRdy3mvCZIufqwGvmakuQSFSUXacek09tcYPD20QV0mGOedUfDjoA/uWWTYX6hs/gctaLZGnlxbECjluw79UQlNDwp5S9f6e4Tg07QP5DnShikyXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850520; c=relaxed/simple;
	bh=P/SzQu6y7u6xqUaNho59arHMiKdq98AWgwmXeu+7vz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3Kxc8SQAo+Gx7LRsBDNITl37m+Qpc5OhWSWtOQxN+o27iqwT6qY94QPzmqCPXBBfwzJW4qnP2ny/GrrEQHxB7baC31eaV0MXsymVM48Oq777xHsYK4IfBTuedwzlou24G9wUQskDNX416QKgRvy1wz2BBlgSMqoEBiq8VbAZ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwi3QvqE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwi3QvqE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64B64C4CEF2;
	Thu,  6 Feb 2025 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738850520;
	bh=P/SzQu6y7u6xqUaNho59arHMiKdq98AWgwmXeu+7vz0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dwi3QvqEq7jxSdsWTrDKf9itCxNZY436QN18swCyu80Mhp28CPn0Ep0iUhybqReiN
	 mpDVcF2e2mt2m+oFx4cwr0GHchBi++P60t7j1kncrwDL328R/7qw1oaohtxUE9Y9ZK
	 TgkSwFTK8ACS71cra/Dz4rsAFAwhGowEjBPJHls/LAcWW8BocZAb0+eT9bonmUkCZ8
	 +okUQTpdUk/h2X0SpW2KjEKbpzChxwm95xum7sav6L5atmBTNaon50bYwnlG1ZTmhX
	 U9zq9854A/n7yqKuSVrM/FBOL8EHWJ8Avzkj4tMg5cVU/QaMh/5a2spGFKa3z8VGd4
	 nd6d15V8LrdCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5064EC02196;
	Thu,  6 Feb 2025 14:02:00 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 06 Feb 2025 15:01:58 +0100
Subject: [PATCH v6 5/5] MAINTAINERS: Add entries for touchbar display
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
In-Reply-To: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738850518; l=1351;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=QZbXiYlIe2lkzDC1TDBQjKD2XWfozo+Zu2nizcpe9lI=;
 b=hj74DCc42VipOopXJGsCkSRizSll3yOyirOlf2oPMfapmTohJQUmlU4r3lofykfmq5AHwFP+F
 bbydgCBWvAqADwAMvKgHsfBuyv6Di5rePfJ34zTrCW5jOs99CKBslCR
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Acked-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..895d682bcf4e351971b04c6515ebf685fd39b662 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7746,6 +7746,22 @@ F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
 
+DRM DRIVERS FOR PRE-DCP APPLE DISPLAY OUTPUT
+M:	Sasha Finkelstein <fnkl.kernel@gmail.com>
+R:	Janne Grunau <j@jannau.net>
+L:	dri-devel@lists.freedesktop.org
+L:	asahi@lists.linux.dev
+S:	Maintained
+W:	https://asahilinux.org
+B:	https://github.com/AsahiLinux/linux/issues
+C:	irc://irc.oftc.net/asahi-dev
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
+F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
+F:	drivers/gpu/drm/adp/
+F:	drivers/gpu/drm/panel/panel-summit.c
+
 DRM DRIVERS FOR RENESAS R-CAR
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

-- 
2.48.1


