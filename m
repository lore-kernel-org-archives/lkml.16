Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC840275853
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874439; cv=none; b=UicFjSAoozFbo8aNj0CFdtCSeKXrbXJSauvphDy4g8+XokXoElbgC1bh2/KWkBj5jWNQGNA/UwalPA2VvzWb8hFWrIio7v3eQDZpbpeFhJ5o4nvzhK/7v8IquOgQAjUcWlgdr9CdSRebZZPuiup7LHFnTsPVdKmFTA3V/H/CjAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874439; c=relaxed/simple;
	bh=ze+IDbxGIYOAgtLI4CFP4fNt2QSwRvDTe2wvrdTzCJo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pJUOUMunJNyZNSY3jeYi63/XeWx0LuKA5XTrGTv+/Hgcr3CvcVxXx542e6A+UUmtXGQ5aPaRwYbHAlCanibh6Ne8SBwDdEfqGQ3NlWummvqtA2VPvKOYqLEj2hXIfllj5lvS9fpMITe3N7TRE+0G1j4R/GZrK8MLuWp9Nx6VDeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net; spf=pass smtp.mailfrom=star-ark.net; dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b=eBTHjZNr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X6is8RTV; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=star-ark.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b="eBTHjZNr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X6is8RTV"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DCCED7A01A0;
	Mon,  7 Jul 2025 03:47:14 -0400 (EDT)
Received: from phl-imap-16 ([10.202.2.88])
  by phl-compute-01.internal (MEProxy); Mon, 07 Jul 2025 03:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=star-ark.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1751874434;
	 x=1751960834; bh=knSaq5gt9Snf9nZAytZJgFXPSvM/0KJ3wC6imxZA8zI=; b=
	eBTHjZNr1e+bHkFscYxH95l1a0aZ2oE633nU+9vcPUh8lgQAPNbKzrqwWN10fSro
	eqT7GVWjd91FJlc8onepxJOvX1uF6DHwP+gQqboRhP5utz2BtiPI1stbxsxY7jzk
	UgwpsrKjPzlbCOrlqkuQCgLxO7PQuTPQwCPc9e4ibD/TFXqhTSN35Vi+6lvjscsu
	aOZauM0n5HyIg81V9yqQFpNK9zOjiIgmRvHbQCCSJInyEu8NsjzSI1XVu0ddasBB
	4OpALih5598E/Op2X7lAEj4sNYN7tp9f8OMwi7FshTWqtmPB8Bp5wcb8aIYrfgmP
	CSdUbsY2wYJzS2G9+eYtjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751874434; x=
	1751960834; bh=knSaq5gt9Snf9nZAytZJgFXPSvM/0KJ3wC6imxZA8zI=; b=X
	6is8RTVHTAVbiCrSP97u8QyrNFKpu7FC2W/z6oPq9oAyTKKKEP3P4gzisPrgYuEY
	D0AkofNxwqo/LqHWZubddiLkZZSyZ2zIKb6e5C+0aesg188sXXBqppGFx8kSWvUL
	9UArGk1dFdjgxadHCwPyy/x95mrPZ01gEBQbtpWJGyOW8oV6B/EwEQ34qBzPjlWf
	LJBFyLZhRFSN7CMHzHYIR7gwbK5yqSGtTxd9kpO/4PXSgimqfbOnzCXNrOPIZQ6N
	ebnq9yATOpHNLmDEGEl8F36R3qwL+gvLsZkt6ViR5RB5Czu7n+NfF+nldHemqWHr
	yz1GhIIuGI7XILUE9gVUQ==
X-ME-Sender: <xms:gntraPazxHFlSxEh196Bs8ufW3bz78szL0AvJIqUwxtGoQPbjeT27Q>
    <xme:gntraOa_La3BsrtIebPYUt18tuZdQBxrf2HEx32AbLRm2aeomInvzpy1k_mexrm-h
    8IFm7BVCgVm6he23xA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefuddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnihhllhhi
    rghnuceuvghrrhihfdcuoehlihhllhhirghnsehsthgrrhdqrghrkhdrnhgvtheqnecugg
    ftrfgrthhtvghrnhepgfdtgeegtdehfeefkefgfeffieekfedvtdeiudffvdevudekvdfh
    heekfefhfffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheplhhilhhlihgrnhesshhtrghrqdgrrhhkrdhnvghtpdhnsggprhgtphhtthhopeef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouh
    hnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhirhhoseiivghnihhvrdhlihhnuh
    igrdhorhhgrdhukh
X-ME-Proxy: <xmx:gntraIZvA_w11ytCEiYSLzi_ga-37XuTCdMjZn5rwDaCvSLdBg_53Q>
    <xmx:gntraN_tGtUMugiic30RBv2KnNavu_pNoalerYb_ppFzHThNJN0tNw>
    <xmx:gntraPiv4XK6AB4oIljIC6DUSqzodqkDpdVM45pQovNKvpohdgtlwg>
    <xmx:gntraFfyEaTh1tZS1jnM0ELxBaRWFStWsTPGwo4M-CWwCs3IRkuSig>
    <xmx:gntraP7T18UIrnhIJ1Tdp8yAtq_3AWBALJ3l45Mdagfd0BIl1mR-vNAZ>
Feedback-ID: i8db94900:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 51E652CC0083; Mon,  7 Jul 2025 03:47:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T22376b854952dfb7
Date: Mon, 07 Jul 2025 03:47:14 -0400
From: "Lillian Berry" <lillian@star-ark.net>
To: "Andrew Morton" <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, "Al Viro" <viro@zeniv.linux.org.uk>
Message-Id: <9b5b233a-762d-4961-9c9a-8bbf4b67d3d5@app.fastmail.com>
In-Reply-To: <20250706153239.3be93aee4b0c8d43e025bd85@linux-foundation.org>
References: <20250706205738.1312194-1-lillian@star-ark.net>
 <20250706153239.3be93aee4b0c8d43e025bd85@linux-foundation.org>
Subject: Re: [PATCH v2] init/main.c: add warning when file specified in rdinit is
 inaccessible
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Jul 6, 2025, at 6:32 PM, Andrew Morton wrote:
>> +	if (ramdisk_command_access != 0) {
>> +		pr_warn("rdinit=%s is inaccessible or does not exist (errno %i), ignoring\n",
>> +			ramdisk_execute_command, ramdisk_command_access);
>
> Again, I don't think we should assume (or say) "inaccessible or does not
> exist".  After all, init_eaccess() could have returned -ENOMEM. 
> Something like "access(%s) failed: %d", maybe.

Sorry, I must've misunderstood your previous mail. I'll change the
message to be more generic.

Kindly,
Lillian
