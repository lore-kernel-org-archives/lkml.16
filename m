Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F67F1C6BE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151728; cv=none; b=cPC2qOgAD0wAjsQXoygh46Jlroub3QoGwTtZwwGA4WEhRqvpayoB0SfAuvp8Sr2L7kLPJxnCW/Ag8LMxkxWM6/n4BqvP3uRsD4LsDLXHIdrCmha0TNCMeoWvLYlElChZ1iCoqzx6p6sVp0quaYJdzzGeDNB1KnlrEZtLrP0439Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151728; c=relaxed/simple;
	bh=l4HM3OpPPRVvVJUg2IZvdk6y5LYk9jJISD9py4JeTHs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=up5nyJogMofLPyvEcsqYUHd6lvDOtpurUTIbs7qhCMXngZkQXtK9uoRkJYMYnvTbL9JSm99ZVz18yJ3PcJujp3kw+VtoWjUg9nKVB4Ok8JY8x9FjrTI6pBLYU1qoHYjCwoekfx2WVocRZe3YB5ZkifzM24ndIGhb2NSdg/NW9BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aNROWXAD; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aNROWXAD"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D3B12047F;
	Fri, 28 Mar 2025 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743151718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFT7SMTIg6YlG+MnRcstSp1n0mAZWbvlA88+Ka5wf1E=;
	b=aNROWXADk37lK71/z15aMTrLXqCW7kKCQZzoI3D1GSqXGeddsOxZr1Q+1s0ZLibHN3vdEr
	14bj8Vz/+AQVnM0O2gzXkoqjyMhh1Wt9G/fneYKrKxnWYwtxyL8oagkGeYaqDOx/+yetfU
	+TU2xgeBESO2lE+uANYbFI3edxBLkqiplFGtx4k0ZDytQ8UPzB14FDk5Rd6oiCF3axNZxV
	q0TPb55fq3DylYRGQJ+KVUT7sQt/p0As+dmjnXqXhD9f+pQtruAUPEs9LlwHfWW3AcDIb9
	Dmw5xjDIl6Bc6vf/cJ750zq8tSmh+x+i+DS0/unqfis2Ef3yfgEtwmD87HaHDA==
Date: Fri, 28 Mar 2025 09:48:35 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/panel: Add refcount support
Message-ID: <20250328094835.502b3b4d@booty>
In-Reply-To: <20250327-b4-panel-refcounting-v2-2-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
	<20250327-b4-panel-refcounting-v2-2-b5f5ca551f95@redhat.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhui
 hgtihhntgdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-GND-Sasl: luca.ceresoli@bootlin.com

On Thu, 27 Mar 2025 10:55:40 -0400
Anusha Srivatsa <asrivats@redhat.com> wrote:

> Allocate panel via reference counting. Add _get() and _put() helper
> functions to ensure panel allocations are refcounted. Avoid use after
> free by ensuring panel pointer is valid and can be usable till the last
> reference is put.
> 
> v2: Export drm_panel_put/get() (Maxime)
> - Change commit log with better workding (Luca, Maxime)
> - Change drm_panel_put() to return void (Luca)
> - Code Cleanups - add return in documentation, replace bridge to
> panel (Luca)
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

With the added #include as per my comment on patch 1, you can add:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
