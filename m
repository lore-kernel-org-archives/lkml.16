Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3DE216E23;
	Wed, 30 Apr 2025 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001766; cv=none; b=aOHc0rD83R8kHuWMut+8d90MY/j83buNcDY5Yp8fPpOp8PW2AyOyi7jowoF1y3NyQ4/D3aAEfAKhgLJdK2Km9CICVPe8iyLIoJVSP4vUtsI8Dd6f1zndiZTP2tBLP8bf1UsxLhy1UbBZ9KBbr/ami0oryYU5cGNq+tZNUHn/1LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001766; c=relaxed/simple;
	bh=Y399pOk2PwFyXdUDdU2fl2otfNhae3MlGbg3fitUhBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKDu16NHX0gv4AYztvHxGU5hh3vJcqWmLOWDJmudEzJfOzRAO3BY3wCaFBKkvSh5g+LoU1lfI24/sZUcqqyrXBAD9JIpa3Y0EkquD5QX7SjdHFoi4+Bk0uhJNI8eBj5RP6YsRYVnfp9YJOSNC8hkgiYE/o2myiymFDScTo8g8wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1pPrsFN6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1pPrsFN6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=hQyzVgSeS1zqqoyGREtN+mz33pRSUXUrrYNi91vis3M=; b=1pPrsFN6Bx75iVbdytX4QUGAef
	SBhDdRSKKdJoVVMtn7Njgqt5S8xRJZUA1g5nlHezxIktzKi7mCO+n9QZWuhKqx34OjHdThxaztS5v
	lncGWqIQgAXDRcl1ucg6mlD9+VqyByfEJH6Lnd3m0NM703WKcrVVk4AcqPaflzZ3JuT2LCIh5DRhz
	vhtWcP45xbKyfRxkzNgVdHVEMSoIrDvbu+gs2Z6U9J6mBke+khQLi5bLPlqkOopVWlhx8OZATxKSe
	DksVca83S65gqyudQpD7Ca1oD7nW/a6NE1pgu28NskLsRjtGjyACSSwuacjNFti1lRB4z8ViO6E7l
	xmyQ6+Ow==;
Received: from i53875ba4.versanet.de ([83.135.91.164] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uA2oV-00032E-P0; Wed, 30 Apr 2025 10:29:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	heiko@sntech.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Allow port dt-property on two leadtek dsi displays
Date: Wed, 30 Apr 2025 10:28:48 +0200
Message-ID: <20250430082850.244199-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Working on an upcoming board dts, I noticed a dtc check warning
about the port node and at the same time the kernel-test-robot
noticed the same warning with a overlay I added recently.

So allow the port node in the binding of two leadtek displays
to fix that.


Heiko Stuebner (2):
  dt-bindings: display: ltk050h3146w: add port property
  dt-bindings: display: ltk500hd1829: add port property

 .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml  | 1 +
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml  | 1 +
 2 files changed, 2 insertions(+)

-- 
2.47.2

