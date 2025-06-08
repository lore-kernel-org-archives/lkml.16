Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D5749C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749374481; cv=none; b=AmqC00KcFryu8G/bjLkh5najjB8w83j0kpPR56/yBwDMuB7HsAmwEPQBw8XlBcX5Pjq4VUVPu+7FrRUb7YevnaucKfWwUqVo2a5EHPeIJsxrBo/8P1AVV1jGcWYRwvms7c6ay9Rja3fqlfBcB2aRQJvoZy+4IQTORLbYnKdn+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749374481; c=relaxed/simple;
	bh=mVfnbJht8rwIEf1+tkEzHADYwQp7BhR2ZNpvh4Mar1w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jfCM8JveBkgYUma5/uRKr6bbwSaVmGxSBdaVyIuXIeB1X1l9P95ws0fZnzLZw6HZTkPxpBevHbyljNkgTzohj39nmTYf083O/itAYOI3Xps7gSlftIk/HiMxlVg1xmOXjFl/CiSy97kHU7Ke7uLIDLa/przQExn2kvIunFTE1b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OdHEgMdf; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OdHEgMdf"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 2C4C111400C3;
	Sun,  8 Jun 2025 05:21:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 08 Jun 2025 05:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749374478; x=1749460878; bh=M28RBFdXpVoeGqBRyHqsq+T77yEEWMi+JRy
	I7xzcgVQ=; b=OdHEgMdf+YSChJ9rOe+OqIeLEFrlz6qmpdn56P1uavSglRhSYCt
	mxtSCsmN3eOJz58EyMI3LpulPOY53uPYhOAxolK0JDhXHBGWdnUlgOVbNlYpZr5Q
	gI4WcJqckvwZtqyAfcqma8nidF6O+mJvXB0OHsjJgrLrMXPbvxutV9K2SysXyZUP
	9tMapHEurwHTqIrYQtWVT2wi0w+83XRM5xAifxl5MA9HSgkrnFmvqmRYbMb8hz2n
	IPliAAA7LpcuEOnGjRDKWPZzkF0JS5WgEQn9kMnj5K+X5pDrhiT0JKfpQixaRlYN
	iEe4bGBnR2sv+JydKRuUmua2zS0eMNMPuxA==
X-ME-Sender: <xms:DVZFaJU3ZLkt4KJ2wJ-5MNf8xHtiGcuiuxYxAnoSS67J84JvCJ9dEw>
    <xme:DVZFaJmk7bRNoGhdcODwOSX8z5clPBnELcPnR_AcNogpdL-GR1vwueGYkZ2KdvyAb
    7xY72tV76JPa4x0Uhs>
X-ME-Received: <xmr:DVZFaFbjfO3IAz4H7jpp7D90I7QdTKx_7uO9bIF7Wks7G-melUktRYPo9-QiUhPHO5LdvRcY8l1PF_gHMlUGkmZQ43ZLyoNeOn0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdejieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvghrgheslh
    hinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtgho
    mhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DVZFaMV7l77JpbGO9E-3MojSdid32zZXnpx0XwLvZB-9EN1GHiTZDQ>
    <xmx:DVZFaDl1kmvv3SJre6FZS6b7TGeis06C3M_mZOHPYSZuUeD462F14A>
    <xmx:DVZFaJe7H2K-MZVrCvnNE7P_FubnUIElsbntZfAlbMpMyMcCjc0Izg>
    <xmx:DVZFaNEa3p2PHKAbYhis7kxVFIzvHS0ymU8rjKaAjjffXJec-dqkbA>
    <xmx:DlZFaE1ViggqMLb48W59WxnkupFlnUy6B0Dv_8e1pn0Ojw9FNKTQxvM6>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jun 2025 05:21:14 -0400 (EDT)
Date: Sun, 8 Jun 2025 19:22:02 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Greg Ungerer <gerg@linux-m68k.org>
cc: Daniel Palmer <daniel@0x0f.com>, geert@linux-m68k.org, 
    linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Enable dead code elimination
In-Reply-To: <5bc4ad99-3432-c7e1-32a7-e9f9db86f94a@linux-m68k.org>
Message-ID: <0b8aa376-7059-2939-ab37-68f8a69eb57d@linux-m68k.org>
References: <20250416114240.2929832-1-daniel@0x0f.com> <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org> <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com> <42674c5a-42fe-4846-bf90-340310393fea@linux-m68k.org>
 <5bc4ad99-3432-c7e1-32a7-e9f9db86f94a@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Sun, 8 Jun 2025, Finn Thain wrote:

> 
> Anyway, I think this patch should not cause any unpleasant surprises, 
> given that "make oldconfig" says dead code elimination is EXPERIMENTAL.
> 

(their emphasis).
