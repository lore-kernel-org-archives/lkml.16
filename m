Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37380204C04;
	Mon,  3 Feb 2025 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603486; cv=none; b=uo8WgWSScbmiAGZKPA1nQxi710T79WVne6s5RtbMoRpF6UNC9eMxJ8QhJzYftnahk8GuwzOy9qK2/7v4kpTKLPAEDklNbCJ5YVD14cohBEFKbZJZYph5ivlsAYs9nlcOzuxeCxcI2VpyTfSSwDQhghOsXWvZTenD11jGDjNrcSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603486; c=relaxed/simple;
	bh=u/UWiA2xTd0JvXqk5KEGYSTlLIVvqvrfwKQkvdfPZJo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ORNGgxh1vfdNztghKlehI4/Zra3dWuUTevMvF+MRhtSy78M5ZekAtAydjqorpAkJS0rPoD10QZuWsG05uS/d60GoBwP17uDZrjzhvqZWMQFKQnX2An8+mhVCfIyMfYLYygwhYigxi9H0HMGd4THr5bZQCpMk9IbOGbNRPemhA04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=bnAKoZW9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pasfyWAA; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="bnAKoZW9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pasfyWAA"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 3F8571380201;
	Mon,  3 Feb 2025 12:24:44 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 03 Feb 2025 12:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738603484;
	 x=1738689884; bh=u/UWiA2xTd0JvXqk5KEGYSTlLIVvqvrfwKQkvdfPZJo=; b=
	bnAKoZW9JEkzVs4OX8/cAUawAyprhdhmpTmGKE8P+lTczmVBBvI+MfiiAJcDRNTO
	aQnsKcfecLojSJjw+uyt7P+7aYZ3BrG2JIvPqXM79HVVEGJOCfjvPWbi5yTpvpPY
	c6rPDOQcLeQ1lwC/JLEl70z1G05y0J2qBGh3wcekTPHnNTntcqhZQRDkDVKj2lou
	+edoS4CxGlqzPPa1fU3ms/Vdto3nkXQi2JSAWbDb0w3YMMyPdFDgOAAjptQIuJYM
	5NRnB84CAtbNO+uzV88DUFidnqChBlnK2MksaKcsjfdLvbWhDvm9bXlEoNWg4Wu8
	YOiKIbJcA9Lm6YdyfToVww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738603484; x=
	1738689884; bh=u/UWiA2xTd0JvXqk5KEGYSTlLIVvqvrfwKQkvdfPZJo=; b=p
	asfyWAAAUdO6lCj7X6PzF0B5nJu4KFKhXhiGuaK8RU1GqP9ljVyZhOaJRLNJHyEj
	uJFjTjIlhZQCuGnUh7ua8UieRzKDJGozWqcLYP/M0ZHSiVnIPY0/X4ZZvZ+FeSDZ
	3hhXUgXxU8JvSIvCF9KH+TBj4yFti2Hw8DiDaLBoqWpa1fG4uhBGwo4OJavT+1GH
	soj9NeRsYGpnkbwSDt3aTKuq+xLmNoZTgC48Ct1alQyivLDKwbhpUwWJZ+dpTmCt
	w0l8q6AQwYJTb5kzIu6GQ7eXInTTPNiVHQ1NPE55DrRS3sFI0nIekgfsoaecZARF
	oT3pAjTwO1+g9WuFk2WPg==
X-ME-Sender: <xms:3PugZ4eCD9CbctXYhs6qIOcLxp5mCnPFWI_mtUN8FKyUWSknyiXXag>
    <xme:3PugZ6P5STReklQJCctI1gfih2pWRa3iOFU4LhJtDbvquuxG8fv6PFtrVWXPrO8QT
    _rS8TtHLXQm2g6-jX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilh
    drtghomhdprhgtphhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhope
    hrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthho
    pehjuhhlihgrnhesohhuthgvrhdqlhhimhhithhsrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqrghlphhhrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvih
    hrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhk
X-ME-Proxy: <xmx:3PugZ5gUbC2Cum04L0RxQMOaVsPZ1E-TWUZfilAT5f_D0qfp62fymw>
    <xmx:3PugZ9_AiIId3JYFWxTETzS1tXrK8F6SmyqE3mpQkeorJAgYyxa_0A>
    <xmx:3PugZ0s9Wt3ZlFART2hZgVwqmcQ2eCt7HkCbIsR_VQ8klkB27IS_3Q>
    <xmx:3PugZ0EXiF5RVHuG38hHESi1N9_D6A5ky8SqF94UH5GUTdsHLibYRg>
    <xmx:3PugZyBTKe12Lqbnyq3X40o0lRx-tlc-cjiOi4-jec_Cgf4iyjP4Rl7H>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F2A672220072; Mon,  3 Feb 2025 12:24:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 18:24:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <julian@outer-limits.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <3fa5f9d2-e40e-4360-80a7-6bdd96312503@app.fastmail.com>
In-Reply-To: <20250203154216.172040-2-julian@outer-limits.org>
References: <20250203154216.172040-1-julian@outer-limits.org>
 <20250203154216.172040-2-julian@outer-limits.org>
Subject: Re: [PATCH v2 2/2] alpha: Remove IO memcpy and memset
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 3, 2025, at 16:42, Julian Vetter wrote:
> Recently new IO memcpy were added in libs/iomem_copy.c. So, remove the
> alpha specific implementations and use the ones from the lib code.
>
> Signed-off-by: Julian Vetter <julian@outer-limits.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
