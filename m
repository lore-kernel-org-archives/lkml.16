Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AC8226545
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 23:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510284; cv=none; b=IdfNkr2dpokBFhQ2+cwhch2qYZqgoRXod3gwLaHrs5Ta5vLgBv3popIJTvghuMC4aIeYiJaupSZPMGa6SU1BKX3qCcAtvj7MTEkSiDJSMFCQ2UjPLt4jrdYy5PEjCXbDr3XE8inL/S5igZ08+ZaR9RFQ3VXY5FsYcxBb2w9nKHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510284; c=relaxed/simple;
	bh=mm9ObijEefmfg8v3eCEzUJlAljhd8U87/Nzt9GDpk3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTFHF92GU9xo/oWjTKK1aRuWCdQthJi5TdLHL6xgdzhkT6EV1jv8+GwEzK7udRyMFMa5YWsAC4EGZ+dv6df1RBlB+ZCs2oJ8gkEw+pUxCIh2dJ/TrI7R8Z81ijeIVqPZuzSiDGsEoxaxSvJzXETwlwyIgFIUDIhy60p4jQoYUuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=n5X+yCJ5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hO1X/2Hf; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="n5X+yCJ5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hO1X/2Hf"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id D1B781140344;
	Mon,  9 Jun 2025 19:04:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 09 Jun 2025 19:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1749510279; x=
	1749596679; bh=k0uJ+LCSai8jTgkwXDZp2XvJHcOSKF00RO3GVFcycTA=; b=n
	5X+yCJ52eeJtMf/hCgnWlXaoI7n5kKwg70aGZEagDIfhiP15Cj4uCZkOVQK42Lcb
	h8YuzfM+ktKtpntaz65jqMzMk/130Te558EBoxIDT3nkSJEtrDWohJ4fU0VzKi4T
	IJRh78UoVvmHxAsjGPD8wHmuLvMg6tMNabIjprdourxZmBplxrUFYiySZTDIAto+
	iDdlXir+dY6c4cyVgD45ocwUeokavtOQZ3kge9ECeOT8jsZ6/DLc9Z2mdQnsRpY2
	X/VX634FxVrJcrG3XluA9KnqFaj8Dc6S7tx5D48RC1MEvYlFJi7IK+svCcnW6atP
	Ha5FLoQeifOXwzOYUDDUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749510279; x=1749596679; bh=k0uJ+LCSai8jTgkwXDZp2XvJHcOSKF00RO3
	GVFcycTA=; b=hO1X/2HfUOL+PLc/2VnGN0SKAqTbgO9BYlKm8tpdear8J3wvkqv
	AP8rcUKK1ze+VbHi+sYdmSrWCJsIUTmWN/tmv6zPzy+pLI2qC8GO98KUoTcY3xhX
	saCL9oIv9JhHuggAH8lJfMSb19Orf7SHhmDQFNnbJfhoHWCuYTwviNhmWqGVWC9O
	BP7qrkveTuIeIEioxSgrGAFZhvSe4G2pK4oukGXgU8zUGyQOS2Mxr+QpH/cHjbrr
	KvQ81keg2t3R4dhARF/ILbyLFAliOukbMZY383Rqp8ns0R+99ZJB74o5hDMTIGm9
	hqmgiSjg3AyVnIkfu7HHPjWiwjGpzrqSY1w==
X-ME-Sender: <xms:h2hHaFYkXBpfNyYob6XZ94yxJh_9DY5a5nLxK2uIF7Nrk2PB5xnM2Q>
    <xme:h2hHaMbYHl1YXyCbWflM0NdAaKwS1lEEbtWHw3JvxDnn11tTMdpJGAKkR9yJk2pkL
    YFOUzx3xXg9iwFViw0>
X-ME-Received: <xmr:h2hHaH-IzN7-tPU5u2uiKs73eea2RF_15yC_enDT7aLBfIRnHF7YLImKkh6_F0h7SWxucUb1MN8rqEbIICr7pbEKWSwWEpnoSUOU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieeitedvleeftdfgfeeu
    udekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopedv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvg
    hlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:h2hHaDqkr9szpPxNztVJZN-9CdDodlr131oRbqQSO9G9d-RAcj35AA>
    <xmx:h2hHaArNEEWyf2v9kvVK0mQ2e_03Tl1c9zRCNJpVJnCj5m_xEp-c5A>
    <xmx:h2hHaJTlfLKzmvH5_jyDNWoRuXqn_S6_99WXKy2Acn3dJtvt6pC59g>
    <xmx:h2hHaIpJfqS6qNwNmPkIdPb2mj9CM7pWUh0dhT22iK4BEQ2hoyjj-A>
    <xmx:h2hHaOZqo1_LuTNQ_UrdAXbl6yNoTo5IRO128fUGw8kJ1Vvj1Zjzv3w3>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 19:04:38 -0400 (EDT)
Date: Tue, 10 Jun 2025 08:04:35 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: ohci: correct code comments about bus_reset
 tasklet
Message-ID: <20250609230435.GA229165@workstation.local>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20250608233808.202355-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608233808.202355-1-o-takashi@sakamocchi.jp>

Hi,

On Mon, Jun 09, 2025 at 08:38:06AM +0900, Takashi Sakamoto wrote:
> The tasklet for bus reset event has been replaced with work item, while
> some code comments still address to the tasklet.
> 
> This commit corrects them.
> 
> Fixes: 2d7a36e23300 ("firewire: ohci: Move code from the bus reset tasklet into a workqueue")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/ohci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
