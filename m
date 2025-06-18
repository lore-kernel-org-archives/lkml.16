Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CB727E7D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750290458; cv=none; b=h7IOde4tzgisZAZRhWIRpzabWoTwICKcpHXVdNWNRCIU4aewCm2nwKj0b9v7opFUXYy7AZXDi/V3UTx02ucMHvvKqF5FTPSj+0ll51ngIQUGwlk2tom+54Q9i/qUvJiQvjMXAYge9uYqg61507RsarUiHlEnA7lTgD8RXgmErOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750290458; c=relaxed/simple;
	bh=59RT9m8aGuJA0CfRNBeTlE7JaXLvBGkagM9K2IAlQrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1GQgRGtHlLcBr+4sYeLZkn3hNX+QbqgyKjPdUZewRjOSppFHdrPeYwiYZjjpy/ctnzCtdfG3jbeS9f6xxRIlqp+p6GP6EB0FuiE5hwxASB2HR8r+FLtfJToBChGSSKzvi2MYXAiiQy+kiIGQ6Vju6xEbI7hzZBGMgbYL7Kez5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=W5CokIEJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DoWTOEa+; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="W5CokIEJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DoWTOEa+"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AE76225400F5;
	Wed, 18 Jun 2025 19:47:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 18 Jun 2025 19:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1750290454; x=
	1750376854; bh=Qv5vhTgNOAaYk+9iCQx5vbswZbVkfMT4CfWtBDGSZ9s=; b=W
	5CokIEJS6mHwBsygSD66HRkvPqZrDD99uTp7GHSSJBAdfmPi+jPcJhtHIfR1XoFk
	Eq2YCOUzoc6EnCbZaIYSvuH2Hoqy9lJ8AjLsWxfmfC4NnMnl8kRtgl06hdcwBPmw
	nPBObEAz21LsTm0S2U0FOnyGbso+7hXmqu7JEAWyt9Kl98nZ9o6WEEtxH5PrAu/1
	4GMNR0jc0ISYfUFYhNd7CYyki036Lq6rt0oHADzv6YO+U14e6xrE2zEo8NB3+aKo
	xIkwH1NEd3QsyPGyXZww+YgYZ7ynqgx/xzJhnaFEFrvjgJykteFKkv+Yh6Tp7xK6
	DO1wW12BI/WRSqU+jxvsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750290454; x=1750376854; bh=Qv5vhTgNOAaYk+9iCQx5vbswZbVkfMT4CfW
	tBDGSZ9s=; b=DoWTOEa+IATnhce2ufWwIVf8zljXiALvXK2gfCKozBtQqc34rFA
	sJwgP0zLuIuGQa3SyJK2Vj0pPlwcOvtwPVGdpJO/UOxyBHWAvQFc0h3fFzXz8GiY
	qDGY3zh+hT05zARMeMGKqQ5OlgSkmN8pzYcCLXeK6la14y+bgm2/sMJlzV72eNzQ
	ny8srHpyC6vCk32ViE82uy2QZaC9PqfjZvdJuQGkWjEr8jmVNuodO224BKU92Vdv
	rTW18O0/VXTU3MOPJRlqR+2vlvcQ+ltOGRm8jL6UEvp6YxnUOa9YYcleGUCnorvm
	T0Pj1ERvUlSTl2XtcqJowVatVcZcUh+G/tw==
X-ME-Sender: <xms:FlBTaBFZMbkIakXB4R8mCft7PSZ6SEu3DToGisDD9xpFy4M0QV3Thw>
    <xme:FlBTaGVOqlFSgxLt4SMfQc-7hI6FPjn70cNW0IN2w_p5_dDX-8Dhvz0iOzfcBqW-n
    nNrDtswAYMz64yJXzA>
X-ME-Received: <xmr:FlBTaDJ3bprm4Xth3-djtm8vEHbDFOuQx-9eAPkv4Zwv_fIxWwFOh1a5R6-5J-ySupAs8Q4W7LIgyDEs5DyVRTqkEI7gui2SnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegtddtucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:FlBTaHEYG4MRBvva2Q7SpzWsCzzYT5crU8Dqs4qmHZj0RoCC75O0kw>
    <xmx:FlBTaHWy7uzfZQqsz8oj_k28YrGNBqfcsHlvcDm00UJv1MrUiH81tQ>
    <xmx:FlBTaCO2udDkuooFMsMBgu0V2sbJIU4smTUJ23XHwdOi2FrK5r5cSg>
    <xmx:FlBTaG2Ql20inm-7BZwQVhV99O-nhM48RsVoXTC7zSO4f-3zUgIElA>
    <xmx:FlBTaLkHIKB20lBszuree4_6Xsys31F0b8fbNJDRZYE_19AE-elvfEN0>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 19:47:33 -0400 (EDT)
Date: Thu, 19 Jun 2025 08:47:30 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: minor code refactoring to localize table
 of gap count
Message-ID: <20250618234730.GA518121@workstation.local>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20250617004320.477421-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617004320.477421-1-o-takashi@sakamocchi.jp>

On Tue, Jun 17, 2025 at 09:43:20AM +0900, Takashi Sakamoto wrote:
> The table for gap count is accessed by a single function. In this case,
> it can be localized to the function.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-card.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied to for-next branch.


Thanks

Takashi Sakamoto
