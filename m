Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579A32192E1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159327; cv=none; b=NRmW2KH2IvjtrJUF07WUTL9aWP/ky2TrXHgk33xUbs2cJUQ4Hn7fYNOUTBNm3jYJlWk1RToYRlQUxnFZhNmULpvM0r/fb0E4fjPRg0ffbFCBffCljkPn2PdNzI0ZqcQlChzubZjPx6lOb3s8J1OlEfiUvucAjtmlkChdH9MxTac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159327; c=relaxed/simple;
	bh=DXP3pS79yJALTkJG+u4bhLLZQG0D51CRvHOTuzkiMYM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVl3+kgBZYkipnbRIdQSnMiTAjEOvWjZhyxk8ZuWVeoIOhiEPwd+nKF7g0xdoh/80P8g8wXRCzy+wPo4Eh9rvuU0JcWkQzcDAaX4MBySSULpxv4EWimWuKMzGLUK0lQ/LXwi8h0SmhP9OvfS/bXKC8t4Bxobbtc90bRqt/a6s3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ALzKf/re; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ALzKf/re"
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 6111958B2C9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:51:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADF5F44547;
	Fri, 28 Mar 2025 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743151884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oFQ7PZL1h9qL+Irw3U4MMBjb7+8PcdHPToDJ/rFYo44=;
	b=ALzKf/reiAnA5HFYCdX+aY4L146ukU7V5XIj7uuuBOHPA0QweJBK86NKLOt299/rm+aGDg
	ywc54C/l9iD2Kowzc4+Z2/0OcOUGRiTMwVtiyize4AWMZGxnoVEWryO2ued7dQ5+ph2lGg
	+o0e2LyKXBm0m8EpXXanUwTScaIVGtNoHp8CdxImD9vdbgBrvcmHKvPTTFD6AP1jBmCyfn
	crizztmB8/387sBWrn6bZslvNRyZZ7fELqi7N9ROu6nvTre4U0CSvHab3uTMX7qk+e4u5e
	fkN61S0Y3W8UBZnykiW6eU8pkl8IcbTcHQeZohBg4l98AI+dnMMek4A7qDrMFw==
Date: Fri, 28 Mar 2025 09:51:21 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/panel: deprecate old-style panel allocation
Message-ID: <20250328095121.7a21e1f8@booty>
In-Reply-To: <20250327-b4-panel-refcounting-v2-3-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
	<20250327-b4-panel-refcounting-v2-3-b5f5ca551f95@redhat.com>
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

On Thu, 27 Mar 2025 10:55:41 -0400
Anusha Srivatsa <asrivats@redhat.com> wrote:

> Start moving to the new refcounted allocations using
> the new API devm_drm_panel_alloc(). Deprecate any other
> allocation.
> 
> v2: make the documentation changes in v1 more precise (Maxime)

Note that the changelog (list of changes since previous versions)
should be...

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---

...here, just after the '---' line. In such way it will not be applied
by 'git am' and similar tools and will not appear in the final commit
when your patch is applied. The patch history is not needed in the
final commit.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
