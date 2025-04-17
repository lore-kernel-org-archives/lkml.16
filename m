Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BCD21B9FE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876824; cv=none; b=h9PW70G41rbvFADW7Gwi7zxvjxVXFGq7+CFAs+7iWkpXSCSdBwyA0vykj5hvg1fL2qRiCWVtK1Z+f3wgybslyP2djRMQi6N3KnTH2BFm430xlB/DkVPNJ8wwHFK+PxpM/FRFyg27jJgVHiJ79q7+vePZX58mBPZ1/f+OLjPlOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876824; c=relaxed/simple;
	bh=tIm/oaPlys8uFyXbcHNmNFBT2SeelwoE54kuk2o+4pI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EROuHWR6BHaFOxJzBtgfrjT4l6TpyfslufZlUygPYqB4JFdl1Xm78h6KST5Z6BDczBmDirL97l6KS6Smzn4c+b6dAaOsEy5f8vjxIy3T37LIXcUnMzoB4x2HY7NZGSbdkOQgitOyoDvWMlU01Bc3gXaVK/EXHvNRnyF9/z9tuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TxXiLSvO; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TxXiLSvO"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744876814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBdI9y5KWJCNNa9ktEQEOVoyDLr5ottCf+QYtSzhQuM=;
	b=TxXiLSvOakA3RBpXz5Tws6UFTVmACWnNM1nImqMDiNjXGjNSpuCtQ7cnEJq99pQT2uxr34
	gY6y8j34T+Kri1tHBvjuPkQXf9ovjL6QJVxhyHdaa4a732OyP97ukuqFYqmBDI+c4aVeRE
	i63x2upKHiqCjH6fQnYMO8RsTBttRk0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH] MIPS: Remove unnecessary zero-length struct member
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <alpine.DEB.2.21.2504160321210.23090@angie.orcam.me.uk>
Date: Thu, 17 Apr 2025 10:00:02 +0200
Cc: Oleg Nesterov <oleg@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <03F0731F-3C87-47D9-A739-01289873572B@linux.dev>
References: <20250411090032.7844-1-thorsten.blum@linux.dev>
 <alpine.DEB.2.21.2504160321210.23090@angie.orcam.me.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Migadu-Flow: FLOW_OUT

On 16. Apr 2025, at 04:33, Maciej W. Rozycki wrote:
> On Fri, 11 Apr 2025, Thorsten Blum wrote:
> 
>> Remove the zero-length struct member '__last' and use sizeof() to
>> calculate the value for MAX_REG_OFFSET.
>> 
>> No functional changes intended.
> 
> Have you verified that there's no change except for timestamp data in 
> (non-debug) `vmlinux' produced with and w/o the patch applied?
> 
> Also this is broken anyway: if you use MAX_REG_OFFSET for `offset' passed 
> to `regs_get_register', then data past the end of `regs' will be accessed.

Yes, true. It seems like

	if (unlikely(offset >= MAX_REG_OFFSET))
		return 0;

should do the trick.

The comment also says "If @offset is bigger than MAX_REG_OFFSET", rather
than "is bigger than or equal to".

Happy to add it to v2 or a separate patch, if this is actually correct?!

Thanks,
Thorsten

