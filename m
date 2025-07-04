Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0541813EFF3;
	Fri,  4 Jul 2025 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645134; cv=none; b=RT6Zr41nLpfvqAYFaAVQvrRrH2Ygssl2ao9fJ3d4WHKDX196L4e469hmsm6XGuSARoxJ2ei32EB+aWqdhouR+ofgZaHOWKYf//W6wKWCvwhBQogt1yh1PiTWixEZKihOMoFSCLeNl6MjqYGEzb9Q+f/+RxBBYG4e5Q/4nDDKW9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645134; c=relaxed/simple;
	bh=+OYPHK1ZnPZMg6uKHuWwPmQ6Oe8JR3QO0E9b83zeALg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DQq9Gi79F86aAtVCANPYb9Ym5suBWLJlg3Gf/kDQrBaR0VVQK/OEg6iEu4OFyGk23Z7zLLXMbaNAhync695phxKsBRIdoCFKBtfa0XWHqJ1LxgP1Otaa6h5KtgfMg7smVKLsFjTCFyNrs/0d+uDrdWxWjBlFyU61zZ05+P8LxlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=R2pFAGxW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WUGIH107; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="R2pFAGxW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WUGIH107"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 299C914002E6;
	Fri,  4 Jul 2025 12:05:32 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 12:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751645132;
	 x=1751731532; bh=ye0B8joJLkUfI2iBIiVNnb3bZDrTy3icljur47MpVLc=; b=
	R2pFAGxWHB+CVPV9OZJnmRWsqG3nhKdEqOGTcKNRMkKnMoM036fON8GXn6uabcjy
	TBN/MHWftq9wyoMQxtXm+D7z8iS6tZJp7OAePZz65cKX3Dmwc7/Mci/JBTOHfDef
	re97vnNU8ifHfXqUppw5tlCxvlHTb3fFFqAnCKSpHMdxqLxpLRB26ISesWLhfqQ0
	VASKIisRksE+n4mJrs5bLSqkKHhD2UHI9UZFcgqNWJh+vvQ7BcnSzRjak1WdLIaZ
	4KO4fcOsaLhawjtOVPusUnnDNC916t8F3Z9Ft7COf25LGBStqJD7KjB3P3X2S+UF
	CjARKznyocSs+6uc87Gbcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751645132; x=
	1751731532; bh=ye0B8joJLkUfI2iBIiVNnb3bZDrTy3icljur47MpVLc=; b=W
	UGIH107UBjHOU4Bu0nQtmZ66iPfAwEoxdM+u52FoQopmi4D4DFvMvNK24G3evbaX
	R05WrXzLJtac4Yn/lDKzztEhZOZWWqNH8sVfmnoph6Xvuz3ul9jEt5dglUjXCykc
	N2ko18DEobA9rTfc9drWVA61ue8eVdRlkzsPAsclPvq4fbS/xREc5an8lIHn5Gmp
	C/wPnZwl7F9G5/7IL+q+SzE+O2AlgmE72MV8+FEBV/aM8hwcCoRKrJKXFxXw5lH0
	eDaVlCx5tag2iq1CvGshFjmbfe1kOzCi17BsQHLFFC7ux3zbm8tE0RNDGYyOL8MS
	CMZACfjnN4er0bux3Qaew==
X-ME-Sender: <xms:y_tnaERDHvuG2Tt-7fqQfifK0JhcCEezF0UBljXsNNa8D9hp3XOUVw>
    <xme:y_tnaBzY9177SZBSHTvIJ6boVZAEJgyjxVs7qpr2S2TzClIJxD_jN8Fa4_iB5GwxG
    UNM1U9Y5soUpEu3et4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopehkrghjvghtrghnrdhpuhgthhgrlhhskhhisegrrhhmrdgtohhmpdhrtghpthht
    ohepshhuuggvvghprdhhohhllhgrsegrrhhmrdgtohhmpdhrtghpthhtohepghhuohhmih
    hnrdgthhgvnhestghigihtvggthhdrtghomhdprhgtphhtthhopehlihhhuhgrrdhlihhu
    segtihigthgvtghhrdgtohhmpdhrtghpthhtoheptghigidqkhgvrhhnvghlqdhuphhsth
    hrvggrmhestghigihtvggthhdrtghomhdprhgtphhtthhopehgrghrhidrhigrnhhgsegt
    ihigthgvtghhrdgtohhmpdhrtghpthhtohepphgvthgvrhdrtghhvghnsegtihigthgvtg
    hhrdgtohhmpdhrtghpthhtohepjhgrshhsihhsihhnghhhsghrrghrsehgmhgrihhlrdgt
    ohhm
X-ME-Proxy: <xmx:y_tnaB2E4JRm2dhOmK9_0wW5WXjBI4yLf7QpziI9qi0xvshiu8hNKg>
    <xmx:y_tnaIC66U_TewYOKGz-dYeh1IxZg_asLWlxTdxpoO7-dercT0kXBQ>
    <xmx:y_tnaNgsVy7HSYzwPUJToU7TceJ5E5PbRavGZ9VmIqrTzOuc84HEhw>
    <xmx:y_tnaErEbjV5Xd0NP2kFGmHg-c7Xinn-wkuYf3DF2jz2G60BhPQx-w>
    <xmx:zPtnaBEBGz8iCLBuiXFxJ19OKmBWDn9wCeTbDHqPsvqTeXH1pfCeqoqT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 359A3700068; Fri,  4 Jul 2025 12:05:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7a47ae1d7bea40f2
Date: Fri, 04 Jul 2025 18:04:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@cixtech.com>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Jassi Brar" <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 "Marc Zyngier" <maz@kernel.org>, "Sudeep Holla" <sudeep.holla@arm.com>,
 "Kajetan Puchalski" <kajetan.puchalski@arm.com>,
 "Enric Balletbo" <eballetb@redhat.com>,
 "Guomin Chen" <Guomin.Chen@cixtech.com>, "Gary Yang" <gary.yang@cixtech.com>,
 "Lihua Liu" <Lihua.Liu@cixtech.com>
Message-Id: <64f39e94-7e88-49d0-8455-cd77d61d4fe2@app.fastmail.com>
In-Reply-To: <20250609031627.1605851-6-peter.chen@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-6-peter.chen@cixtech.com>
Subject: Re: [PATCH v9 5/9] mailbox: add CIX mailbox driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jun 9, 2025, at 05:16, Peter Chen wrote:
> From: Guomin Chen <Guomin.Chen@cixtech.com>
>
> The CIX mailbox controller, used in the Cix SoCs, like sky1.
> facilitates message transmission between multiple processors
> within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> and others.
>
> Reviewed-by: Peter Chen <peter.chen@cixtech.com>
> Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>

This is the only driver holding up the merge of the CIX
platform, so I had a closer look myself. The driver looks
well written overall, and I see a lot of details that have
come up in previous versions are addressed.

The one thing that stuck out to me is the design of
having multiple types of mailbox in one driver, which
feels out of scope for a simple mailbox.

> +static int cix_mbox_send_data_reg(struct mbox_chan *chan, void *data)
> +{
> +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +       union cix_mbox_msg_reg_fifo *msg = data;
> +       u32 len, i;
> +
> +       if (!data)
> +               return -EINVAL;
> +
> +       len = mbox_get_msg_size(data);
> +       for (i = 0; i < len; i++)
> +               cix_mbox_write(priv, msg->buf[i], REG_MSG(i));

In particular, this bit seems to do more than just what I think
of as a simple mailbox that should have fixed-length messages,
it feels more like a generic message passing interface between
device drivers and firmware or some microcontroller.

What is the purpose here?

> +static int cix_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
...
> +       switch (cp->type) {
> +       case CIX_MBOX_TYPE_DB:
> +               cix_mbox_send_data_db(chan, data);
> +               break;
> +       case CIX_MBOX_TYPE_REG:
> +               cix_mbox_send_data_reg(chan, data);
> +               break;
> +       case CIX_MBOX_TYPE_FIFO:
> +               cix_mbox_send_data_fifo(chan, data);
> +               break;
> +       case CIX_MBOX_TYPE_FAST:
> +               cix_mbox_send_data_fast(chan, data);
> +               break;

Similarly, this also exceeds the complexity I would expect
in a simple controller, it feels like there should either
be four separate drivers that implement one type of interface,
or a much higher-level abstraction.

Is there a document that details how the messages are
structured and what the users are? How does a user of
the mailbox know the size of a message to pass down?

     Arnd
