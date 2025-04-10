Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A93E22424C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282590; cv=none; b=pob6gZrFeevOQzPyCM51Z5Hn4rkmoW5tkpKyKkIKq5IQMl6BtIGL8dRyuI4s7xBcYL9LryLuPANCVyZkLN6R/UR3/DmqVFEdU60tgy36wTj2O67V+JT5vwuQK9OmwSrSh084Uxbud4kUCXUGYgwt8PEE/QZsViz4qBznNhsNtkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282590; c=relaxed/simple;
	bh=YadL3ZoWvwUG09v0iqOrCwkGYycpVWybtua4+AraQT0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pwijuFTwo7UwgHYkas4NG4ZwW6Ps2IZVtzyJmvgB86HqJAfo92AEP1v0iWoRfc25HwxhwJDr/+oMmgpn3Im3UVedU8+F1F0fRJABPKQCXVoj1OPxnbqntji8xxkqd7bDqssaKmtOEx1+SX00TI9fHYBJ0DNVJv/78jUszudtaV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fuRKgJvJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l67fIjCv; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fuRKgJvJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l67fIjCv"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 69469114013D;
	Thu, 10 Apr 2025 06:56:27 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 10 Apr 2025 06:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744282587;
	 x=1744368987; bh=oEKpksTSeAZ7w0HXIaMAnTCbQphqyRott0G/ftwAhwg=; b=
	fuRKgJvJdAuHKoVF//SDuf3SN8R1TsROyxOL/qB2vDzHfXVP2zAQz522d5FrhGfb
	aC6DiGwIUliTFVKrxiJZDmxSgD+dIgIMiQyC6fWD6YLqtujUKdaA11ANqJKomX4B
	qYKrisqvtbNmjJJAPBE37RHODYz4TESrZR2JJSJgLBh8W56Pwj9Ot0XxXluQCUgx
	Se3Y0onhu7E+MdoaU5XNcdBsoFergcNDfbvCsrmDJw9wAwV1fCkRXeUgj8WYFvVI
	z1Uuh/v9+SPG2QJ5aUTz2kWgcxGJ5GIAlXPjFcK8+zdsKM+zUH42zuOE8f7965ST
	NnMwptyYUy/sZT8Fm6HHYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744282587; x=
	1744368987; bh=oEKpksTSeAZ7w0HXIaMAnTCbQphqyRott0G/ftwAhwg=; b=l
	67fIjCvIoQ2DB/HHnG7nYVEHfwTiPwFQtwgELUccNJ3KX1pGxYk964qu8aNil0Dw
	okSKviSDqJ2ZqsvNwfLWCztjSQLsWcVk1gPKTeQV084bVsdx7u1Zu/I9COkySxBP
	Rs7nXwOSZfauNJ+ZijOngInNqH5zqtwO4A8T+UdipfhtWDAkIAkme05YGBOSjWR5
	YLb4NRvltZhVS5yxT85PyPNxGJnIc/8cM21ea7P9USbysLmVzpqMEoXiw9xv9b9r
	IbFK6D+qVNfrdlH8OTDd65HlDXmmBrlLm0PbWYmSgZoIyS3kFNzYRRd6PmXihRy4
	u0Tc+v6cL9kIpvx4RnZ0w==
X-ME-Sender: <xms:2qP3Z6SHWqfeI_c7HG6RTazqwTPZ9OSAwIUgbXCBcaJia5WG_vjaOQ>
    <xme:2qP3Z_w0jyIdTwjPOfmzDFFEGupaBTf3hpcSFanu6QF6nd2daxMQqss53EdQMRz_C
    z6kta7oJmBdp4ZibfY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhprghnihhssegsrgihlhhisg
    hrvgdrtghomhdprhgtphhtthhopehhrghntghhuhhntghhrghosehinhhsphhurhdrtgho
    mhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:2qP3Z31PRLjLXEdCJvlF_eJBcBPgWe15p8c6-wagsgWQFKOrpgzhdA>
    <xmx:26P3Z2CSn8YLX_GBzW_vmlOSOCIhqPV_Cr39AJKk_bgkDUOvnP_JIw>
    <xmx:26P3ZzhXN1xWhS_8WI_7kMn3hN6jLyOe3fh7G_5IK6XuaCgdS7gHOA>
    <xmx:26P3ZyoPc3R7Ct6eR8rECn9-QKdLVLOD1l1FYs5OMsaslySocxgzYQ>
    <xmx:26P3Z3vqvOPIki2gRtkux5Dsh87ojy1vv7ccGGWWLNbJBYEqSG3_ba5V>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DEDCB2220073; Thu, 10 Apr 2025 06:56:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5c1313e19ee2af77
Date: Thu, 10 Apr 2025 12:56:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charles Han" <hanchunchao@inspur.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Julien Panis" <jpanis@baylibre.com>
Cc: linux-kernel@vger.kernel.org
Message-Id: <b1632d8b-d5c2-44dd-bec1-78aa0a71eb03@app.fastmail.com>
In-Reply-To: <20250410105256.70310-1-hanchunchao@inspur.com>
References: <20250410105256.70310-1-hanchunchao@inspur.com>
Subject: Re: [PATCH] misc: tps6594-pfsm: Add NULL check in tps6594_pfsm_probe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 10, 2025, at 12:52, Charles Han wrote:
> +	if (!pfsm->miscdev.name) {
> +		devm_kfree(dev, pfsm);
> +		return -ENOMEM;
> +	}

Since this is the probe function, you don't need to call devm_kfree()
but just let devres take care of it.

     Arnd
