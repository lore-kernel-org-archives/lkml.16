Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087791A725A;
	Thu, 24 Apr 2025 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507317; cv=none; b=mde2j/tPMrn9jJkHu6q+2yGzXmIfjjXM+S09zYq3TxBLmP8kOPxo/4FuGULpXLwwK2kHIFaWS1tfKgNcRHHg0MWjOZa9kD+F0HPzEgBFnNd59ZDPJC+8TBUbBAF7GEiw/4tra0xDdhi7mz433uqqezbtcjFwdGScYJReTH1WOxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507317; c=relaxed/simple;
	bh=7QolAV99FY+QjXTev3oTcOSVHP6mNSigRrtYEoCPsy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDhbdsJF+MqpBby+F717CCRmisrml2hY9ANgI4FSNJkjEP7ipHvR0PBcufzi0nJSCPlh9eU0W1Gj+RI3cx/zi69EuvmuNb/W775CqIXBWC0WUqXULQsuTWv8sNXb7vvfc/7E6DLxTCo750ibKsFHLs+8dSwp5BaHtiFb8pxbAK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=knrFdceF; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="knrFdceF"
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD7DE43B36;
	Thu, 24 Apr 2025 15:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745507307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CT0uhP/bD3mmWh94Vsk3jAq3+/uKPxqbo7WOZFqDn4A=;
	b=knrFdceFsZK9lIjVUroYIaQSyXY4Kez9+sIzznkPq6HXbvGMP1QP4U+DSd9OuM1NMTQyC9
	j91xRop5FkFjjJnIyAVhfXqFwI1BO+Jo5r6Hg0OtOs2YDjl53Zi2mOkDm9Ki574XD2K8Z1
	t+0ZrPqImMIBh0QJAGUDxSTl9zugWnW/F6aLIy41BWCt8u0gS/MU+L5g18TncZJFDrPa9T
	pPDkIeeVfRz27oH2g4abq9Z8Ie34D7DS84jre1pF9T4nmi11lOx1hLGBAMu4Ca2Se5SncY
	R+yDW6lP6Rc03NTSYZ5O6ccJtpoSlw+K5pRbiuAhAnj+CgQnI+DrnQgapSxJgA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 24 Apr 2025 17:07:42 +0200
Subject: [PATCH RFC v2 4/5] dt-bindings: ili9881c: Add Saef SFTO340XC
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-feature_sfto340xc-v2-4-ff7da6192df2@bootlin.com>
References: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
In-Reply-To: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeljeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvr
 hdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Document the compatible value for Saef SFTO340XC panels.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index 3a897e464178dfc8a7c70e0fafb51184c50a520b..1e6845454e23bb37f1f7adffd99cd17a5effe68e 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -19,6 +19,7 @@ properties:
           - ampire,am8001280g
           - bananapi,lhr050h41
           - feixin,k101-im2byl02
+          - saef,sfto340xc
           - startek,kd050hdfia020
           - tdo,tl050hdv35
           - wanchanglong,w552946aba

-- 
2.34.1

