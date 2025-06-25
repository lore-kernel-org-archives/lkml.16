Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8EC1F2C45
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836062; cv=none; b=alvbY2kNxaZNhNycUqYZOdNjkHzOheTCJQ5knTAZezcUEannTO2NnrhmKuqgsabThu6I1s+3b7LLy2A5/HT8xHb2rWh0rQznzQiuDogTREP6S7A6MVc5Zen0Xa89INAFbHk2fd3nNwBW7QxUf1KIBEtoQVP7RrlHfG9bHOLtTJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836062; c=relaxed/simple;
	bh=z0LiYL303CW1pVOH3+bc2IMxHCuRe5GIW3t75i7MXNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2HJB0VdSTEfyNazPAokTRXGE+f7RN11S5Ve3LqFVww+NDb5i+Irk2z8qFeymyG1ywUvW91JgMEAc6dRnMdADHl/OGC9DaAMOTz0IvLJTCQh5fG06tPaWq+qRtb+6Y/6T7aBMLTfm3bOJ+2L0RWzWipj/Reb/zHGtohtIDe7//4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JaoWRkVr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JaoWRkVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gjqM
	H2zNkL3dLw35KgCJ0ZyWLCd5EPM3hQGLl0YMnvE=; b=JaoWRkVrsF1lJfJk+V2F
	daVzqOQXy97TpNJQnAdvNr55sk9SBbUFxLAhVjVYLWB6STOBDGC126KQ+79p81nY
	TCIhUgBO6ZqkmAoeP8kGMTf1kMgaliJMLqaTTlLNTxuzi6jHaeF5WBa+1y7yjnXL
	RxWCwQ0GIwyvjq3vyOJOEcUdkKHYOjrpU2MGo1BgHr91x0dEq30JEb3X0OlY9el5
	1kHDtdpHsKBUU3LBs1yatO9GcSNkqG7t0RoSQzdWZlO+s/Ovw1o/7T5JlvbtS1K5
	gvGG7GQSTgfNmNoU+dkluV9ymeDNh5AgngdqARv+BeE+QbQGmuvCbycTk7oYfeKs
	5A==
Received: (qmail 546082 invoked from network); 25 Jun 2025 09:20:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:20:51 +0200
X-UD-Smtp-Session: l3s3148p1@fmzlSGA4lsttKLNf
Date: Wed, 25 Jun 2025 09:20:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFujUtrDB_XVr11n@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
 <aFrpra9j69OkkMbL@lizhi-Precision-Tower-5810>
 <aFsK8sDj7WvIBZvW@shikoro>
 <aFsU3YjzjxzR2drQ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFsU3YjzjxzR2drQ@lizhi-Precision-Tower-5810>


> > Is there a reason we don't put this in 'include/linux/i3c/master.h'?
> 
> master.h can be accessed in whole kernel tree. The scope is too big for these
> helper functions, which should only limited to i3c drivers.

Yet, who is going to include 'linux/i3c/master.h' outside of an I3C
controller driver?

> 
> > 'internals.h' is used for the core only so far, and '#include
> > <../something.h>' also looks a bit like a layering violation.
> 
> Not yet, you can look driver/pci/controller/*,  which include ../pci.h.

I never denied that it already exists in the kernel. But it still looks
fragile to me.

Whatever, it's not worth a big discussion. We can move this code if
there ever comes a reason to do so.

