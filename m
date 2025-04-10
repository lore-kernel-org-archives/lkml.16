Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628FB1E991C;
	Thu, 10 Apr 2025 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302528; cv=none; b=LyqMCSrQP9B1gwbyLtL5O5+P4VkCX82SCMc9o0PabisDDaR7RfaencjoXCaaoN8n49pC1xt748lF/Ygf2OCcoQf7ZDEkI36WHTvDErn2NHr24TkTYNHfoINDTAziACAY5PE6iZoSgJr09HW3PGDDaEFQavFq+0fEtv/PfdYnHPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302528; c=relaxed/simple;
	bh=QFVnxkDPScY5o5JjRBfi89ROeQcvbBjrMoM7Sifl43c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gvWbYLbwtLIcgrm7R6BBb7nd46BN985nUL9wN3BTLjKKxKioK9CkO9kv1l/GZJotR9pbVDv2oxx27S/tRX7xm8PeFonPk0ehSq+xn1sQfAKOSrC109RhnRMkQ6ABnNKrWbAW2rXRWOerf/7qQGBEc/KzB5WNeEPdmH9cpFAifgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kVdYyLTU; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kVdYyLTU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F2702047C;
	Thu, 10 Apr 2025 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744302518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iOKdgwDs5ciSws6/j91YCELuK7lTzKV3G/vRI8hyMQg=;
	b=kVdYyLTUo58RvbTcwCOGmFOSSqCp0v8+Lq4jq8JXYm96/IrYOZnneKbNMTJeZRzEScJa8m
	C7Li1l9HcoPoHzY8dBeX6hGyyVpBoVAwNDjgjAf+Dpq8DGcGiNiOWoOKnzBqJeLt9q7sE3
	ct+awerz7t/y2W4qR800zi1BAyBiJpNVbdtjkojw9ZmUdClrvJMpVDX+0eZctSBSPwQNFC
	1V5J0IiKJ3i31PaEDYTuOvRpnrlYo1mFcm4aUaD+agRC6UGGmMwq5htGzbgXfT1VGRucdR
	F+r753nO1UXzv2PwfYAFwfsBnyiY/XVMeRflamVcHpDkRTBgtaJjdCxtDt9qsg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250318-b4-add-nlt-nl13676bc25-03f-v1-0-67e0f8cf2e6f@bootlin.com>
References: <20250318-b4-add-nlt-nl13676bc25-03f-v1-0-67e0f8cf2e6f@bootlin.com>
Subject: Re: [PATCH 0/2] Add NLT NL13676BC25-03F panel support
Message-Id: <174430251636.3714911.2779384413530827919.b4-ty@bootlin.com>
Date: Thu, 10 Apr 2025 18:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejheeiledvkeeigeeluddtleejvdfhleefleffffeitdetvdeltddttddtgfelteenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrmhesrhgrvhhnsghorhhgrdhorhhgpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrn
 hesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com


On Tue, 18 Mar 2025 08:58:27 +0100, Antonin Godard wrote:
> The NLT NL13676BC25-03F panel is a 15.6" LCD-TFT LVDS panel. It is a
> single port display unlike the NLT NL192108AC18-02D. Add a binding and a
> panel entry under panel-simple.c.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display: simple: Add NLT NL13676BC25-03F panel
      commit: b82f66c76b8e3d9cabc06a68c8e0401e3f96fecf
[2/2] drm/panel: simple: Add NLT NL13676BC25-03F panel entry
      commit: c180b00366d99911f4573dca5ac97a8633f2e8f9

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

