Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8684121E0AA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510305; cv=none; b=ilgjLed8F2KPUlNG2sG/dg3Fp75rfPofYg1AcMJBxjksVMgm+aFRuYA8t24Ia6heXxYE9yMvAIlbx87bklMjuEl86t/Mk7Gyin/x7XnsFFgGIKX5YHaFzopnIHCOdvMUhGzYMeXGvj/Jc65Pffe+pTLdgbu2wwBVcXxpJ7j+L/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510305; c=relaxed/simple;
	bh=8E2BPIVvpW9yVjU68vHNvQWjmASzlOqaT/xVFY/HXlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKHdkl8/aUkc1vsStGifq5C/5wpamX8HGzKfktcrdhI/c9li8ZRgZUfPwBlS6x0ZOqHnpB2sAh+Yl2npZIWbYOxUKGwnj/nkBw+a0NLRMTteqn1T1mVe5JmyMTK0L/pjOqHKSIHD2g7CydxugOVLvSaaOVRgxA8nlxBG0Pehlos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Fmerm7uG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Fn2/dvXJ; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Fmerm7uG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fn2/dvXJ"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 98A2D114035F;
	Mon,  9 Jun 2025 19:05:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 09 Jun 2025 19:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1749510302; x=
	1749596702; bh=YNKkdPKEddyvw9xmqNRPXyL57rmfsoKQytYhEJngUbE=; b=F
	merm7uG77jz0IkaP1Djkbiw/5sBTe/68hV8kQwFYSyxIcIPPzaKhCzslCAWAnX7j
	U8ZVgACSBR2mcN1wjG6QQcit+lYEWKxXvsr1I//E98B7IFFh2EU6N0nyiat/5OHJ
	L4lspCX2NiExxibbzRLuArZHTSsyuvyHIu8BA0ehKYPeffAWK/VvWm8dei/M9pG8
	3A4KNYOH44H004/Bo2b84/eHWRd1sRHhpWflEWirdAd8ko/Tom1745CUbL8HXEOd
	FQL+ir9XI6JaHt50GaeWOB4cMaZyIyE3X4LPw7hBktUSQeLgsS7x8tlPuMYhKZ2P
	/nMWmu4/O2gdrezS6EeiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749510302; x=1749596702; bh=YNKkdPKEddyvw9xmqNRPXyL57rmfsoKQytY
	hEJngUbE=; b=Fn2/dvXJEKHLhN5bakk4BIRCBLtF4+w4LxUEvpXx/+RSUla8fiS
	HqK1XnC+GTF8jNk4PVQmoLxNsJUxeGfwAYmAiReZNjAFZuBS8RZ9L+5C36JLj36r
	x4EfE+st3WshCEVbRRstIcVrq5jyjLDtEwGf1jUfWu88wHwPKyGGNxXVAiqNlGjA
	q67/QYfRs4uKOVYKKVQOpqlaASw+OjDb2jeJGIp/fqXAMthNQcvtcLXgyJ8G/jeF
	q4z/Zef+i+6uKD2/OrnxMxebnJtkdjnQCu3rb5qAL+5EAP+nu506GAgwmDQU8ODe
	/+z2iziwwja04uJOrBK5rpJRF/9GQiac8TQ==
X-ME-Sender: <xms:nmhHaE_e8k0l_vponOJ8pQVPmrvw4S9rFlGrXxbPX2GKDFlA5Wu-mQ>
    <xme:nmhHaMu97R7EWkc6U-XzyNQbONUAA7s34F9426rYPPkAVpLq6-obd6uMXrSk_o72g
    eLb4eYaiipCgZfbUhM>
X-ME-Received: <xmr:nmhHaKCJQrzq0j62tF3kgc54dW0qb3CZmZg-2EQCkrjkOO1294x9rozDnZjYvVUigSqOIWaBOXprNiXETunSSDY1Gm_7WNKRDbAZ>
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
X-ME-Proxy: <xmx:nmhHaEfFXdQgu1wjlCToJi2ptac8CU89Mr6tc4t4UvbIjwbbEUGWbA>
    <xmx:nmhHaJON4laSsj9DdNeuM1UDwEV9cM2Zbn46qQdNKuhi1Ox-d1-61A>
    <xmx:nmhHaOn1EgjRpuIhBXONK33yWHmIYAWLjT3FKVkKqaUEf9ZRtgzGcA>
    <xmx:nmhHaLuba6yFw3vrpM8s0O3yi4W5kaNXqqIt1djuyuGeTtLHMva5MQ>
    <xmx:nmhHaGeht_X4UqoaHSlmVk_uSTpakfufewrJQCjiJa-Gcl5tm1coV1Dh>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 19:05:01 -0400 (EDT)
Date: Tue, 10 Jun 2025 08:04:59 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: ohci: use from_work() macro to expand parent
 structure of work_struct
Message-ID: <20250609230459.GB229165@workstation.local>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20250608233808.202355-2-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608233808.202355-2-o-takashi@sakamocchi.jp>

Hi,

On Mon, Jun 09, 2025 at 08:38:07AM +0900, Takashi Sakamoto wrote:
> A commit 60b2ebf48526 ("workqueue: Introduce from_work() helper for cleaner
> callback declarations") introduces a new macro to retrieve a poiner for the
> parent structure of the work item. It is convenient to reduce input text.
> 
> This commit uses the macro in PCI driver for 1394 OHCI.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/ohci.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)


Applied to for-next branch.


Regards

Takashi Sakamoto
