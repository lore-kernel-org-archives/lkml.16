Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39AC14375D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152037; cv=none; b=I7asEd2+bnSo3EPdvmEBYiIsCS/9ee/hBPisKPGaAbGhJUMFIb8mTz7OTeFSdevB46CQAXvesRu+VkRcZLn1lhYBBYur1xO73SoGwK2KBTin333LGP4Ttb8Niwsa75nvjp7QnEKUh8WLPIk1UGF8lwldoC0slVDOx3kYMzPLv2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152037; c=relaxed/simple;
	bh=LAo80pcze5ABJ2O7FvKaYN+s7oSxqDJ5t2rV079bqoI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUKF+b+u/mP4rCVpH/HrgZxz7WKb4950aCUmqCUhS7Z196ATW3YH2YGtc4PxdPavzLNrzU3hgo9x5y5ObzblxtyGDjKjoCPfQb7FVvnceLuU09hEzZQl/oXuO9CRQbKvP7zcyjzr2UrIWx34Q3Ee4Sa3IxW4cyJHav4M56d2SoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UjsScPIM; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UjsScPIM"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FBE44444E;
	Fri, 28 Mar 2025 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743152033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fq28d+GTVbmTb7BFcdN0DAaSRJZdvQ95irksTrYkEpI=;
	b=UjsScPIMUY2hMDZZer1kl+ImeWQ/6N6jcfRwapbJBGEb4dpnwL3E/Lmv7K4tSvoEG5X1RF
	F5FvKMLLhvtWg/+R9jj0bw0Bood6uwfi3G5iqXD5zRgS+kQ4dB+o2IEe01ShTEjvai5lz9
	e0itmAqJslji7Yb00F7/oJbsdDpx56AZsJzv0AZgdgEctFZnHE4XJKckqiLiG9BYeKdu1U
	r0sWhIkbuB/DO5Akcbn+nU90+Avu/E6wCdi7xYVRGSKj3Kqhhj39s1FESNpODWe6Wg2Lhn
	54z8Irz712GoX+SP2bl9zfQL13nJoWBRm76FU1vbaP61UiOqBrbTbS88LjxD+A==
Date: Fri, 28 Mar 2025 09:53:51 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/panel/panel-simple: Use the new allocation
 in place of devm_kzalloc()
Message-ID: <20250328095351.7bac2d4d@booty>
In-Reply-To: <20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
	<20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhui
 hgtihhntgdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-GND-Sasl: luca.ceresoli@bootlin.com

On Thu, 27 Mar 2025 10:55:42 -0400
Anusha Srivatsa <asrivats@redhat.com> wrote:

> Start using the new helper that does the refcounted
> allocations.
> 
> v2: check error condition (Luca)

Here as well, when you resend, move the changelog after the '---' line.

> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
