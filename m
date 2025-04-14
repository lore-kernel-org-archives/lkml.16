Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046C71CD2C;
	Mon, 14 Apr 2025 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621431; cv=none; b=gaJawdg4VIsYhtSzvEC293ZZqrTY05KN9zbDJ4Z5j9/5vzlhAB3t5CyjgyiFgn3tPOJyrcPnEyf1f1uFgv8voJbRhWva8i+zxDRTibsu8uwThscmWMmqY41/FzhAdHDGapBdyzPEaOtKFxw14N5ZKIsccot6tFuDJppqssKFuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621431; c=relaxed/simple;
	bh=TaJd3GfmIN1FF9Nfj5/3nKeIWUdNKoVByIZIbP92ZZs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RCIWI1VYIoBkCM93vQp/qjtl/s3Lzh5T/LBdzoN4amT6J3SGJA3JfcDuADEL+Di9paei3JuqgY8LnBC4F9/ay/xgcuWHWl4iNQuTovy0UFa6PlPYTeFO3KmKLNBQFBrkbdNN1ZJaw+IUH4tMj0bcZIwtW712+Pj5TPzw+j4JAuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h2ibYs9n; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h2ibYs9n"
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 025CF58392B;
	Mon, 14 Apr 2025 08:17:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 490B54314D;
	Mon, 14 Apr 2025 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744618651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TaJd3GfmIN1FF9Nfj5/3nKeIWUdNKoVByIZIbP92ZZs=;
	b=h2ibYs9nUqdmwXSfBkha5wwKX89e0Na2JsReubQd38M98wrSVDTX/1v18O9D0IcbkD7Iv2
	VifJvoIxVm7C7tmQF2yeF7Wgtwn/b3JU9zuvcf5G+uh6U2PSbw0AO3Iv0DcJeMzdIDGDk/
	5Z7ZiRu9YzVaDmeh/Z8+YQCFutv458m3+AuAb0xY+YX9vmG5cH43GwfyKIbt5s/jxfnAkv
	+OrMIlZTEvrEIP9y1m8wUyyWwZ2iAiZBs/ahOy2+3ujAaZ+znrW6SRtYyCRrv9zp+8lV79
	gxvpZn8Vueb7yhZIDxZ3lMMrjxkw4yP43zpdNcKf/bXgU2fUfUoHtM3x1aKDjg==
Date: Mon, 14 Apr 2025 10:17:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA
 addresses.
Message-ID: <20250414101729.598c1422@windsurf>
In-Reply-To: <45bbee88-0446-4773-a4b6-d19a1747c43f@amd.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
	<09a5beeb-bae3-4a00-9aff-66adf68064e6@amd.com>
	<20250410214307.361e373f@windsurf>
	<b596c9af-c0e3-4557-b45a-462a33179235@amd.com>
	<60e2d844-418a-4bde-b6ef-76d10448d5ec@bootlin.com>
	<45bbee88-0446-4773-a4b6-d19a1747c43f@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddttdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhrt
 ghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com

Hello Christian,

On Fri, 11 Apr 2025 14:41:56 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> But anyway please note that when you want to create new UAPI you need
> to provide an open source user of it. E.g. link to a repository or
> something similar in the covert letter should do it.

Could you clarify what is the "reference" user-space user of UIO that
exists today?

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
