Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206E2040B6
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196132; cv=none; b=nWiB/+exn3r+fXvn5mQAAtQJkfHmK62fYs7k8NyO2PvBP5Ik4yP7uMgZxOe+POgOCavhQ+xFWpai+fUKXOXTT+211MdpD5GBWxBM5juD9YCZxvNQ4oPyy5FTsOF8NqE/u0SaYZZdjYthycl5IZFml1TIdAIdC97PmuCPMEtEaOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196132; c=relaxed/simple;
	bh=8q26/glFOBbpUdxjzBxtSG2OyXJBICPfGnRvk66Q0Oc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZystfZj5YDD0NB4SkFwUSvh6+c9ZTeCqg0/5zoLRri5pk4uSGO7OkFyYN3N/ZdoyFT5a7KjTSoe85IFOy43XLVJtFnNzb1NG+GMbAjeH4aoGbI/QdyZk8KK+3pFYWAz55lpYX3iHxNI49XAaqJ79g30T34oRl9DWJsJmf6sRb88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ONtGxrET; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M7J+s3+G; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ONtGxrET";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M7J+s3+G"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 68CAD114011B;
	Fri,  6 Jun 2025 03:48:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 06 Jun 2025 03:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749196129;
	 x=1749282529; bh=ORduSM2ls50JCHwc3E4N4qhtQH7zpQ/bd8vQQEXnBw0=; b=
	ONtGxrETZSizLqfwLsxXEataNte2WlX6gAz2bIWroDI6zdU4gT46Tq2yZrSpni7M
	yXcMxxCPjrZRJUtAZwtje5PK5B+v46siRnKVBBtLTSkz8qd+FVuPJlKxaHRzUpA/
	Cn4DNoJdCK96rdszaPcXWaw2bq8wV3RbKLy8qUGTfNoHvZKXE4POVAVDzmkqn0i6
	L80Fb/3PZR7QETPfY8ojcZtkNfl50UoN6bGgOMpdw3jeLeT0nb5Nw2Jr7J6GUGjN
	2XBmfAiB31/6VC09Ax/YD7bCKoP4f3KOg3c2QgNF/qS4oiEh0lorRURVCH5qsdMh
	kI6BGQZ5GlKN4oBIPd00+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749196129; x=
	1749282529; bh=ORduSM2ls50JCHwc3E4N4qhtQH7zpQ/bd8vQQEXnBw0=; b=M
	7J+s3+GdkWT1RAHVesXI81ne8f2Y6dwYznNRn5ER/fpw7t6UryErOa3vAX8ECkfH
	5rbZASRFXpIiG9no+vo96XqTuNgW78KlXczZQir07hY+lgWFD04VAhzUzMzcnH/M
	XkdQFXcpi4aIFTGECw9AzieEdCWK1oppEooQoPDM65Gv3yVKr1kEfso6pa6FmnGc
	Bg9wy8ilnJBTX61TDjkpG9DiTG0FHrXVQASLEirQ08srKd7KQni9o/JmLQSSGCFZ
	H9b1GriEDKKS5O/UW5klT4Ml0MCnkn+EihAQ+m1kAa5Kd/o7KPfbpoatzlD9Ug6l
	GXg7NIAqmKCQ1x+T1MJKQ==
X-ME-Sender: <xms:YZ1CaEP5_ym8Rky5C7k0XrAWSBRtZU49U8Kr7Sge7Ln-2b8RXUiTIQ>
    <xme:YZ1CaK9vqQcmHuQy3Cm7JM38A4qyUn6O9A2_DBpOmVxqJdFmEgrLHp4e0HayhzhTZ
    3rvlGPbI98AXvKXnPY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehjohhhrghnnhgvshdrsggvrhhgsehinhhtvghlrdgtohhmpdhrtghpthhtohep
    lhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfoh
    hunhgurghtihhonhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhsohhl
    uhhtihhonhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:YZ1CaLQfMCzKwtvKFZ8_DM1zpQF1fHVB-trwIDzVwTzdOu79fwfZ9w>
    <xmx:YZ1CaMujzKMLHZrlsdWSSfj4lCQ5dwdwfrxcDx649MGzvFIBV78UPw>
    <xmx:YZ1CaMfjsd5WPx2QSyaBR4Ncg6PSwKzV4bUBCg-7PlwloWzGK9_U6A>
    <xmx:YZ1CaA1ivbIXD_WVFu0Wm6zW4n_CREhXMCMNMKpkFqOKgCF2dhx7nQ>
    <xmx:YZ1CaEptCSooxqH1vsVWJW0NRtD9-McJWZIk-QU-6aIGraGLGTexFdQ8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 24C08700061; Fri,  6 Jun 2025 03:48:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7fff804e54d23c0e
Date: Fri, 06 Jun 2025 09:48:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Johannes Berg" <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Johannes Berg" <johannes.berg@intel.com>,
 "kernel test robot" <lkp@intel.com>
Message-Id: <df18c88e-00d9-4d41-bb34-b2ae72ee631f@app.fastmail.com>
In-Reply-To: <20250606071255.7722-2-johannes@sipsolutions.net>
References: <20250606071255.7722-2-johannes@sipsolutions.net>
Subject: Re: [PATCH] drivers: char: SONYPI depends on HAS_IOPORT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 6, 2025, at 09:12, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
>
> It already depends on X86_32, but that's also set for ARCH=um.
> Recent changes made UML no longer have IO port access since
> it's not needed, but this driver uses it. Build it only for
> HAS_IOPORT. This is pretty much the same as depending on X86,
> but on the off-chance that HAS_IOPORT will ever be optional
> on x86 HAS_IOPORT is the real prerequisite.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: 
> https://lore.kernel.org/oe-kbuild-all/202506060742.XR3HcxWA-lkp@intel.com/
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

You beat me to this one, I was about to send the same thing.

    Arnd
