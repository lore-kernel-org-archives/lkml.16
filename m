Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74B22E645;
	Tue, 10 Jun 2025 01:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749518540; cv=none; b=VrJLZMb5gML6orlA3W1CwCLHBo74z26et6uIjQpfH2pP1y7Ij4EeP7abCNM7AwW78r80Kn9YGmFQ7hnBNOuogBTMJyXALzYRYrljzHfExOW0V6kVOiZTaqfjd/pFLasyxrEjmbfeqDZRnhZked66CF8rYEmOiIsXZwFyCWmNepQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749518540; c=relaxed/simple;
	bh=PnA/2Oov9DYB983zVYfpn6Ca0tu8laMbPIBo7xQYGWY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tHT6jll0Hf6NFjrF/NkPNEdORtreJSpPLl+F92cffgDtcqgIpF5utUSFOaZs1HYkBWzz0ErJr8v8CHOno7IUxBuTukEStZBu1BjMOpLTvg7mBaAewcR32nlPbv08EFYvxp5tLOhdYjyNJWFi0EoyUlQQGYnPjtdmian6qDHHn/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=M7mHrUI3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gp8yhwcb; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="M7mHrUI3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gp8yhwcb"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id AAD45138058C;
	Mon,  9 Jun 2025 21:22:15 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Mon, 09 Jun 2025 21:22:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749518535;
	 x=1749604935; bh=5TQz7BXKwHR2EA9SqdvfYt7vFBlswGi7VoJzU49Pnrc=; b=
	M7mHrUI3tqnYrhis8pzK8AK50E02BulafbGaf4fRwXFPVVaTQr4qVTf8cXZH7BFy
	0HV5/8Se24DZwPUYODsdWM+Qliq3Vubr5fdos7/YZrUqw105N9oCJ4irPoYvKEvs
	4cV9rHzoEtozBpSo0mVrxDueoDS8yrV54dXYIi44abHQqEbJZl+fJQoKB2oxNEu7
	gULDleGTinW/nbWv+ax6/cqDDmP000EWQFivo6ch+vcoIzxv6ozvBqnkqZVB7Y1I
	LO9qRy/D+Dd0RsUdCaHHkI9bZXSf+l8A7Ylu4Rf8SdahXvQ0QDaWCB2oy62BFyGc
	piAb+/RLTKeaRX/niILUjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749518535; x=
	1749604935; bh=5TQz7BXKwHR2EA9SqdvfYt7vFBlswGi7VoJzU49Pnrc=; b=g
	p8yhwcbzC3KIiP9g+tHxr1HQQbC4mGrZJQbBS6j570g5ziDegiVBTu65Cddq4jCP
	iNpezMsgrcvYTG+50bIIfDDGdtKVc+LGsQ8OSqpErbSCHmZzpFcQA+xeMQV19KZB
	26icdFnaoXMi3MWrmgTP7xsCJTCmr+X9jYvR58cUjYFC3IgroGxvpMymCPCKTtps
	Zf8B0YgpP1dwDJeXM+Le0nRJ/zr0dv/FVN5/dm3uFOJwK53ZS31DEbvpgiHg9y/x
	akkizW90dpJCyupniodWPxbJNIA/qVeAbOgKnV8eJcxXhIsdNJeD8Nz7803WRJmq
	URkGiVaKEEFg9xEtB3jXQ==
X-ME-Sender: <xms:x4hHaE9lcji1E5WU5u8qP7jKJoYDC2o-3c3kolUtUu5fddJD536mBw>
    <xme:x4hHaMs4hP4_-byVH3pmJREu1e802N0R6MeJiaSvXFbRIbG2X02j-GBHdoHO4lP1s
    KFx-aVacQcr2wjEWOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehteeghedt
    hedtveehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehikhgvphgrnhhhtgesghhmrghilhdrtghomhdprhgtphhtthho
    peifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopehhmhhhsehhmhhhrdgvnhhgrd
    gsrhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhi
    nhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugi
    drihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghpihdquggvvhgvlheslhhi
    shhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopegtohhrsggvtheslh
    ifnhdrnhgvthdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhr
    tghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:x4hHaKDo1oUpp8jONRUlaHNTUdRrl7ZyPakz5gvZpSMdKme7TM2ylA>
    <xmx:x4hHaEc45InDVGbgzYE465TbGmXKUcMJPmrmsNSotlwaV1YaJQzdJQ>
    <xmx:x4hHaJOEc3AkcmCgy2mNC7ScDXnhXLpJV7jXIBEuBYOMPypJeUuJzA>
    <xmx:x4hHaOkgtty53GS2flw2EN88fe83mSFdh26A-ID5DA3xz94ycdZBUA>
    <xmx:x4hHaG5TpP9tv0JCOM3rWbSrvYhImR4axVcRbglL56w8gpkVdk-Hx3Km>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 22A352CE0063; Mon,  9 Jun 2025 21:22:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Mon, 09 Jun 2025 21:21:45 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 ikepanhc@gmail.com, "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <33d3ea0d-161d-4297-9a99-9e7e129b31b1@app.fastmail.com>
In-Reply-To: <aEdBWymLN7aYqkeB@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
 <aEdBWymLN7aYqkeB@smile.fi.intel.com>
Subject: Re: [PATCH v3 1/2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Andy,

On Mon, Jun 9, 2025, at 4:17 PM, Andy Shevchenko wrote:
> On Mon, Jun 09, 2025 at 08:27:24AM -0400, Mark Pearson wrote:
>> Create lenovo subdirectory for holding Lenovo specific drivers.
>
> ...
>
>>  LENOVO WMI HOTKEY UTILITIES DRIVER
>>  M:	Jackie Dong <xy-jackie@139.com>
>>  L:	platform-driver-x86@vger.kernel.org
>>  S:	Maintained
>> -F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
>> +F:	drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c
>
> Is this correct?
>
Jackie is on my team, he wrote this driver originally (with some help) for one of the thinkbook platforms.
If there are any changes he should review them as he has access to the HW, but I'll be helping too.
I think it's fine - let me know if otherwise.

Just as background: We can't use our Lenovo email addresses for kernel contributions. They're based on an awful Outlook server that is incapable of handling text only emails, and also won't play nice with any other tooling (including git send-email). Not ideal but it is what it is, and I gave up fighting with IT about it (there are some workarounds, but they're arguably worse).

> Otherwise LGTM.
>
Thanks for the review
Mark
