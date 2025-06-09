Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF04C22541D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 23:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510330; cv=none; b=H/Sbit2cslORjMagMOsPj5UzesHgfKC7Jl6hTz7NGY0Sxz4RiqPeYHn9WdwIqBqNJlT0IT6W+FZXdP4nSAZJW5qA6JPIjLU3iGSopHwV7Rffdf0MCXttezH65W3Qgyra2uITtldOXWIIY5cvWYKPBVNlYSGCid5HTW4ly7PKteY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510330; c=relaxed/simple;
	bh=C85FF5K5t5O+VDhHz1pwTjXUZnnV6ohubT9KI+v+PYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCDZDu+zpFllYpggceuqUrcdWesAnrKxW6cSSyJuouYvMpP1GGJOtn1VMHKH2L8goMQ4v6/DDpBsqisqJ4QeXXaarNONK6mlMuJyREZN/Q3RtBCzclQWma1lHXM86kpTVaSEXrqhmgNrniBc3xAt1P4KRyOyHPUo/LW5lyNlKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=EPzP9P6A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VTIKN2iq; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="EPzP9P6A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VTIKN2iq"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 583D925402F9;
	Mon,  9 Jun 2025 19:05:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 09 Jun 2025 19:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1749510327; x=
	1749596727; bh=kd7/xrhnupFFRWoRHA1mjKrfic0CJAI5T8R3UpSyHk4=; b=E
	PzP9P6AcDacA2RlIihH1wna4At70+6sLnKbgeLuo89f+JVZWwE3A11wDnZ/9PDqW
	M+neTnmSwG2PxqLFCtNUej2vFZjkyxsfuTEZ2H9y6+W1SZ2bIyS+LsYRWDR6MYHN
	/EdmYaSwviGZ5clRNJ8Wqft7cxAblFLHdKks+f53iSreF9EKEHEfKX4cwSwE7MrF
	V0gvsi4OcbwU1YjuvxJPETR5IWNcndWFkVUDvXydvC15NoN5zSA+/Lv6yaY6ALke
	yP9U3QmVpOET31e/icseCi/jA11b1mZ4V19dzh5+YazQ4k0Ei+8AcCS9vMlV7twz
	hGG5RDWW+VB8Vc+sSq0Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749510327; x=1749596727; bh=kd7/xrhnupFFRWoRHA1mjKrfic0CJAI5T8R
	3UpSyHk4=; b=VTIKN2iqDLlk6gXMh78bz1nXFaGywMsGaRlWy+ABQTlmNE7XZh6
	Ij/hi9F2gs9+b3c96TCurdCh4n6EDNb7K0qpSwC5Ihxz9VdqS+UCOggpmX61FaKP
	fxG/xm4/mG1lpeyUDGMzxurkSc/bV+L0lTA1Qs/cpRqACDA51I0gg1eih3xui96r
	qvnJjtXn1jMXBWVhS9jd6xc84nLEcR+ZKMmGE7lv8nrbwZgj35LkvrAyVoBc/M2e
	o3URUqsqL1OUw4UhN5NgY0k9RFZTTuHje9eNLU/qwqju3t2HzVHOyC4EciZv1QAX
	ymEXrTHL4kjjZCSnsJXKkD1meDpBBqqt9xQ==
X-ME-Sender: <xms:t2hHaELFefKGpmGZu8Z7LdgzxdbUs0rHtaqha87_zfCjFnw7KnyhvQ>
    <xme:t2hHaEJl4AHu2XpkR981kp3hTqJX0BI8n_F5rHujpbu20MgYCNRnzI-ttIy9XwwGb
    5kBHR-g4ljzjVvg2H4>
X-ME-Received: <xmr:t2hHaEvBvPMr7NKnjvmtpGG5xoadRqDqQ1yF6AeBw3RcL5YEbe9M1AFDcAx2KkBO4Dk8Kzx9ZDfAfcajkdzDE3FK3AeMGqOI4ko0>
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
X-ME-Proxy: <xmx:t2hHaBYbD93C6UTA22Hf8hrKVZgjnopLQ6YknkG5cFmRe5Wbjtnxpw>
    <xmx:t2hHaLYQUPo6tra3hWyO386VuczLJ_bG6aeDYmf8SGFWG8v4Dg9L2w>
    <xmx:t2hHaNA9yT9BLq8xUq54vnfdPc7mNXzXMS43YMGHheKGWCKGMzGCww>
    <xmx:t2hHaBbDlcRDx0HsfD_3bego6bwlS48AKUYikXF8ORttQ9fXiCPHlg>
    <xmx:t2hHaDKcW-woqUW8cfgRDSuf8m1tHY5Vl0FCsAyqeJI6CkTJ_Nsnqw7_>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 19:05:26 -0400 (EDT)
Date: Tue, 10 Jun 2025 08:05:24 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: use from_work() macro to expand parent
 structure of work_struct
Message-ID: <20250609230524.GC229165@workstation.local>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20250608233808.202355-3-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608233808.202355-3-o-takashi@sakamocchi.jp>

Hi,

On Mon, Jun 09, 2025 at 08:38:08AM +0900, Takashi Sakamoto wrote:
> A commit 60b2ebf48526 ("workqueue: Introduce from_work() helper for cleaner
> callback declarations") introduces a new macro to retrieve a poiner for the
> parent structure of the work item. It is convenient to reduce input text.
> 
> This commit uses the macro in core functionalities.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-card.c   |  4 ++--
>  drivers/firewire/core-cdev.c   |  3 +--
>  drivers/firewire/core-device.c | 15 +++++----------
>  3 files changed, 8 insertions(+), 14 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
