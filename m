Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB89211A35
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437890; cv=none; b=pXoT/jx6AnorW8diCqVkzNWaa2gD/8ZcdF0LeuUNk4rbiwgdzkFDunV8CEwNL5MHCKMyqv6KzeElPL3CM+DB+zMN8gbxExemu76L/IlC4f7MAxOq99kS3wDXObIXd5YOrNSs9XIkugb7dY8vCuCAPQfrXj8ivHPtqGbMTaOsEWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437890; c=relaxed/simple;
	bh=aTg6yYXpHoM2puFiQpgt/tSsBDbhEsa9a6e7au0koPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6nbOQ53HQ5amzx5eZO/00rkCcvPqioIRI+yKzWwHiYppiON3FWbCzzrbon2brJNXsiY7s923cm/tgewZtYjizYYbsBWam2nrQBQQdQ5UAJGtuHWiu1vdAph+ISVVPNNU6/t2KruG4pJxq4P0K5TkYz9JYiNnZyy6FKFIovAVu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=h9wtvXaO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IncMXsAx; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="h9wtvXaO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IncMXsAx"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 5F622138456A;
	Mon, 31 Mar 2025 12:18:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 31 Mar 2025 12:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743437887; x=1743524287; bh=0PKpSpAP/D
	7a8SfehCwf+MgvErJcuIyK4tm4G4WThW4=; b=h9wtvXaODk83Gta8YoZenzfwtQ
	V6U7B6gOVQSS6iC+beGokGSAydYp5rOP782rw/vOwtMdk9ITbQtJHyA2yBOUFshg
	MRxqa7DUDbLU1clvib7R8OTc80HEFnHIaFiW9IE05hx43U/C+ytt5CpnVW0AdWtA
	xTfBivAROm5JmQGaaIC8RjX7dmE8x3hmp4DTPM/pZAxCr22s2h4idTt2CR9OaXLP
	f7R0VYU6L2039E9CHrdtv6rx2PgVu5JirI3G6fbGgVeJWyVDMSlinBPAIyoIa6f/
	q5KpnlGKJH/vfxHNCrBYA3PUzckuXCb26KGlnDwSSyMOuOYfvy9MaquMDmOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743437887; x=1743524287; bh=0PKpSpAP/D7a8SfehCwf+MgvErJcuIyK4tm
	4G4WThW4=; b=IncMXsAxfrDJxq2YCcmDzFe1MpN2yllVRjRhm4EtyKoy9fWz3Nc
	IIVeMs7vhFQZWIdgYitIwHGu/MkpxouKlKnW/ZVVbomYzGIsnxzMG0+qylBa6veF
	250g/xqhkUc3Euw8s+RFEV36spxPo5Nu8RZNOzkHxxD25Ar9h4e6vi9z3JkfZtvm
	z1grYVPzLLF0nq0HOki6l3OfF34i3G60EWn7PEPM45qAMbRBGKHzp0c+2gPw60zB
	O5Ig7eq8X7rQyXfbiAdWHImLAItyaYe6O0Bz+oOQ7xcdOdKIt/N4BHfBS2Xuysu6
	YGrVeGlM+vndbBpRSaQpnDJzVx+in+k1mkw==
X-ME-Sender: <xms:P8DqZ7Rk9otQZRjcawkrYL-CFptxW2x8E06cUZdiZ0epwqi4tcq2QQ>
    <xme:P8DqZ8y0SCyqFBkh8fRp0ZRVT2XMP0XOsHsc6jNG_26Cf6CLMemOU3r-WxZ-9jIDT
    VtQuyjGAlDeqA>
X-ME-Received: <xmr:P8DqZw2b1Lg83EMnjYAVxv2wtBkvBQFrNmsUQdXTNupE9XZQ9IVvip8ka0SW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtfeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehjohhsvghphhgrnhhgvghlfhhrihgvnhguudesgh
    hmrghilhdrtghomhdprhgtphhtthhopeguphgvnhhklhgvrhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:P8DqZ7AeszAceFQg2zhRRqCUiUw0vWAybDikCML2dmwd5KtoGXOLwg>
    <xmx:P8DqZ0j1WdBDK_kt-a6SyC6a8MXmofIxJmLrX8MATHXACxbf_llr-A>
    <xmx:P8DqZ_q78pcAWtRPyKT6XHUjPdpf-7g0OyBziJtOY1lt-7Qor9lyeA>
    <xmx:P8DqZ_g2UlBBN6uM-9j7svOKX4EVwvXL0IhvsG0XwmchW6Z9WxyHoA>
    <xmx:P8DqZ9VgxPB0fi6Am3gScjdUlaulmetfjRIyLMdNoLbJXzV6Bnb-iSOg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 12:18:06 -0400 (EDT)
Date: Mon, 31 Mar 2025 18:16:36 +0200
From: Greg KH <greg@kroah.com>
To: Joseph Friend <josephangelfriend1@gmail.com>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Fixed comments and misaligned code
Message-ID: <2025033107-ice-docile-10cf@gregkh>
References: <20250331143941.758600-1-josephangelfriend1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331143941.758600-1-josephangelfriend1@gmail.com>

On Mon, Mar 31, 2025 at 07:39:41AM -0700, Joseph Friend wrote:
> Fixed style issues for gpib_bitbang.c on comments.
>   for usage of "//" instead of "/* */"
>   and for multi-line comments
> 
> Fixed misaligned macro backslashes and comments.
> 
> Signed-off-by: Joseph Friend <josephangelfriend1@gmail.com>
> ---
>  drivers/staging/gpib/gpio/gpib_bitbang.c | 142 ++++++++++++-----------
>  1 file changed, 72 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
