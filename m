Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D491A76D0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751833870; cv=none; b=BCbL6nNBvm3H2m8FWfaSXmJh8rlWg4zLQlWbUJGBfEfZUgHoh9JGOq5dXwLU4qenoWH/eLiw1u8BBtB94WlxmSq8V1kZcwyp/28+HM+GyHroJOUWPK3Ezm29S3vYQ12jA6RK+PBBeWcvd8EDCclI5Ch5CHUNxJk2vzbwqEEFm3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751833870; c=relaxed/simple;
	bh=gvkt1iq1VIgX+7yiZNz1mCKk+gey9NsbUrQWsmeuPyY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jOxl7Ik72A51Bh0/j35pQa0rZzOyej6HvIF286cJuLHBU1QSyzXDE15XVQdIby7OSM54n9YOSRxrN91UVVDpOO0aRk3bm5zFjIqBTLu5U7fS7qaqrb6lDQj7cJLCVSyRU8Db6znyiNK2RrnrV7g/HotEMRp77bhhhooixjoe8wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net; spf=pass smtp.mailfrom=star-ark.net; dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b=Uu9YAdmF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BplTOpbL; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=star-ark.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b="Uu9YAdmF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BplTOpbL"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id C0AD3EC07BC;
	Sun,  6 Jul 2025 16:31:06 -0400 (EDT)
Received: from phl-imap-16 ([10.202.2.88])
  by phl-compute-01.internal (MEProxy); Sun, 06 Jul 2025 16:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=star-ark.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1751833866;
	 x=1751920266; bh=yYcFfoXuFF5HUmksrlq6atyZzV+Wg33Jvb+63D+a7sQ=; b=
	Uu9YAdmFA8sLyvPI0gQOFRITjqSW7el0NdObXjNHN4TL+ODOYeLvFTLUh9OLKRIp
	FBNFXNsyn9pBJT2332SbpjaZonIKzyGvtStvamzKvqpAaHSmiBJZOafNHArvbHQm
	dczcQ1zW8LJ4E61hH4yumlvOTqyS2BFDBQ4SXR8UXveokwAwrITONR2kN6G8n3UM
	1Hs7UDHYRWCAALn4KF29AyptU7W3H3f2QfEIrmvk8a92/Fr/3tso2/+MmSz/lg9Q
	MMaA7NB0p0AP8J+CMAswuqb5MYpIotnztxn3dsHjR1kT7VAnA4YX56S/XX5ISVau
	l0WF+/UENpLq6FzFAu1XMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751833866; x=
	1751920266; bh=yYcFfoXuFF5HUmksrlq6atyZzV+Wg33Jvb+63D+a7sQ=; b=B
	plTOpbLdKLA+4UiYuc7rMWAOcUBxN6/XkvwTKQYx3Hs2G7PP2sXxOV8NLH3UAbjI
	HgAjasTwBj1f0zBmjWgrznWm62JOSSK3cyYjeddeI9KfykkDBxIaioa/Ww329qKY
	KY6iYE79kCl06g2H5lOW6gIpIozx4KF/gb44PZGui5kXxYp1m10xwSpMfaj9dA5V
	nlZoUyGPUEavEwmmw0YYIZ/6SvlvTOg5On1N0kJGB9aPH4Djx8FuIET2ESHROYby
	NISSSPEAER6i4KUIKqoutyZZnFq7NybtkPyKID5hs82o1/654c8aeyfawH4GqQGm
	GBmj/qPPn8N7OrAg0OXoA==
X-ME-Sender: <xms:Ct1qaEDaEYJazlyp_Obt8Q2QYK24eHiTMw6tKZbNtQ9k9T1LEpXipA>
    <xme:Ct1qaGiJpWZ7TQ6NlLEqZb1Vk8bH0nVQPhpk58uQh3_XHn8cKcwls3m1b4r3cbDCS
    kBTAx3DTgzU44W6TZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnihhllhhi
    rghnuceuvghrrhihfdcuoehlihhllhhirghnsehsthgrrhdqrghrkhdrnhgvtheqnecugg
    ftrfgrthhtvghrnhepgfdtgeegtdehfeefkefgfeffieekfedvtdeiudffvdevudekvdfh
    heekfefhfffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheplhhilhhlihgrnhesshhtrghrqdgrrhhkrdhnvghtpdhnsggprhgtphhtthhopeef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouh
    hnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhirhhoseiivghnihhvrdhlihhnuh
    igrdhorhhgrdhukh
X-ME-Proxy: <xmx:Ct1qaHlJL0GRmZlskkBIlPfLHtAqx5LFqMC1Af3B3wJp4TVPAPu71Q>
    <xmx:Ct1qaKxqlCu9wX-lf1imltdLomF6zawQAHKOk07O6979NzHihysoeA>
    <xmx:Ct1qaJS326CWqWGe0WJc1QoV-8x-D8aaaEW_NITF4UrGQZ-m7d07hg>
    <xmx:Ct1qaFa-0vksuz-OfsBkAj_ZcP4fWfDCJ-pZje2QQX_IPRzWn6d5wA>
    <xmx:Ct1qaD0zIBjjJUZfeqeOPS8Ipy38z8SIBrLkPrV9ERXBX3WN84n9qzWl>
Feedback-ID: i8db94900:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6E7CD2CC0081; Sun,  6 Jul 2025 16:31:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T04916d410c8c63fd
Date: Sun, 06 Jul 2025 22:29:02 +0200
From: "Lillian Berry" <lillian@star-ark.net>
To: "Andrew Morton" <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, "Al Viro" <viro@zeniv.linux.org.uk>
Message-Id: <6325572b-994d-42da-999a-6c98f240301f@app.fastmail.com>
In-Reply-To: <20250706131324.613340ff7e99231c383409f5@linux-foundation.org>
References: <20250706185142.1294007-1-lillian@star-ark.net>
 <20250706131324.613340ff7e99231c383409f5@linux-foundation.org>
Subject: Re: [PATCH] init/main.c: add warning when file specified in rdinit is
 inaccessible
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Jul 6, 2025, at 10:13 PM, Andrew Morton wrote:
> "is inaccessible or does not exist", please.
Will update.

> Is the "WARNING: " needed?  It's pr_warn(), which implies that it's a warning.
I saw this on L486 (warn_bootconfig), but can remove.

> It would be good to display the errno itself. 
Yep! I'll add that.

Kindly,
Lillian
