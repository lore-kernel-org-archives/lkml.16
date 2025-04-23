Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0679D268FC2;
	Wed, 23 Apr 2025 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405372; cv=none; b=q6z7XaaYLMcIxRSL4i+s6/TZ2Yj31/ppQww+UBnTKdb+RuJn37Ds/bf0SMIcXo1T6Umvexe0WRcVztnplx7QERSGTwQDGWK5XLf8kE4ihRcvZSxHSDi2Onk/4fGahG0FKmiudo48kakqvn51SMTdgcWrvN3St+cPvUDTe88wNFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405372; c=relaxed/simple;
	bh=GZW5rZ92n5nSfDahO/HbWsl9vTtzX0nsXwTMgd7hG4E=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mmJ4nnOiCJkjDhwAkWSgxAZQrj6PVMWw1nt2t4cuRNeJhrQz7pA17AbXJyfPV8qyz/uGhsRRXiOSIoroqBKZ0nJXzlDO5v26BcgMB+v9FZ6+H7/RHiic48Y2uXj5lzy6XsNf+pEuMfKan20qetMfQRR8Ej/d1oRbE4wRH02uN9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ws6+6zNd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J8Z6rLJA; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ws6+6zNd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J8Z6rLJA"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C08482540234;
	Wed, 23 Apr 2025 06:49:27 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Wed, 23 Apr 2025 06:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745405367;
	 x=1745491767; bh=dgGNq7d0G1/PWhPlhLSXNkc2S9AqH2jVe/cjv1rl06o=; b=
	ws6+6zNdJ1sSDTMpM2qvSx8JvAre2XkqW59mo8j9MhmwGoYH8a9Nt27t6DF6keyL
	n3Qr1LgPgCOj6vhMfHyWM/FkbnqpUjTYpscQWq/d6leawaHRxnE1gnrG5MT8XQfx
	xlzwahI+kqPPV3BTQo/f5FiezF6b1ODzuZ/x4hP1npE8cEmu9Ym7BVYaMX0XVzJA
	IOFe3Ck1+N3HnNLA4IwafA0o9lvb0erI1Y+x2cxDPXLNc7kjEw107F9pER+fkif4
	waUrcR/XTxFAJHFrO0pKVCdfmjMfmvOeema524nsPirzOpCcCj8CU4ncnLg2zIBG
	0Z5sq3CkA40IS90cJYXfvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745405367; x=
	1745491767; bh=dgGNq7d0G1/PWhPlhLSXNkc2S9AqH2jVe/cjv1rl06o=; b=J
	8Z6rLJA3e8JcXS20AItgtZiqhot7R3nmOtCK9Wp2fd4fB9LijU7bUmuzcVZgIAp/
	QttPgRoSA7a2sM14TEFWIBcPxwl3oIkuCKT/porVnaWZYKikP4Z6+uGLweozs3mz
	P7dBcdnSTMQieWq0J5Mqao2Md0CZTpvzYVv1lRbYn7j0N1vIWXt1N3TbMCDPOkAg
	Ugl9C/+N84UtVYK8RY1kpg3j4VKs8DdiBRNyTNrXZrPotcAPuupZk/MONkOG25pD
	1co8ye87Nf01d+u5Ob2Hn5jicVHgp1D4jIvaIHPrfv438C89nngj1C9xC6jySosP
	uVFPqtsnRQ3cCkvfx9hsw==
X-ME-Sender: <xms:tsUIaIQYu7QRxOgkwWGNRF-5e2DOim6wkFYAVELHFlpHC3bzaihDOg>
    <xme:tsUIaFwkVmUn92Fett6rnEr5IrYP93TuhpYhpGtLEaVAyYf3fFiznZhOYqfIPjg55
    HrHk6qeeT9kxnUJAPI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeigedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    kedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoih
    hssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughirdhshhihthhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghroh
    drohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhr
    ghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
    dprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhn
    ghdrtghomhdprhgtphhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhssehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:tsUIaF17iM6FlVDB1UVi6Qr5JrTu-R1HTnQe3XIGGuCI2BN3DJLfPA>
    <xmx:t8UIaMCAkTPHlbIt2jbfwE5qOidtp8i43a1EU9SyVdVD1G_kcPtmEg>
    <xmx:t8UIaBgW5Bv4-go_IzC4TqU5T7d_O7JO_xU-oH900KaI1MLAiY0xjg>
    <xmx:t8UIaIqU_XoetQemU-l1YfVhyjt4SbWsmEAyp60-8xrfgzV42Twmnw>
    <xmx:t8UIaDfOfXyPES32LeAJf0bmfXbKaBngnEur1D6l2jAtlwGzbRvK8s6l>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DDFB42220073; Wed, 23 Apr 2025 06:49:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T775286d0781a9516
Date: Wed, 23 Apr 2025 12:49:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Romain Gantois" <romain.gantois@bootlin.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Andi Shyti" <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-Id: <48972165-8cda-4db4-a5d9-299854afb112@app.fastmail.com>
In-Reply-To: <aAijRtGLzKLdwP0-@stanley.mountain>
References: <aAijRtGLzKLdwP0-@stanley.mountain>
Subject: Re: [PATCH next] misc: ti_fpc202: Fix off by one in probe()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 23, 2025, at 10:22, Dan Carpenter wrote:
> The "port_id" is used as an array index into the struct fpc202_priv
> priv->addr_caches[] array in fpc202_write_dev_addr().  It's a 2 by 2
> array so if "port_id" is FPC202_NUM_PORTS (2) then it's one element
> out of bounds.  Change the > to >= to fix this bug.
>
> Fixes: 1e5c9b1efa1c ("misc: add FPC202 dual port controller driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>
