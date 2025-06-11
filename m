Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F272BDC13
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651656; cv=none; b=ZDyhCJOQe3tZfEu7RyoG7bFE+whmyddoQcNMdxqNXNj+J9TEasSlnhB425H2MURXP/j0KV13rXqogwG9QuypBS9Wfu0b0yLLZl2sMdt1Q8Mv3LogZTfhfN9D+4zuSE/3+x963AY12GZ3KGyY5d164Nr2vYHWLDZZiDeIaaaNG3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651656; c=relaxed/simple;
	bh=VNLm1SsklXsQRCPUAhqQBnfv+wbj/KnXfx4AxV6OMO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxE7P/KkR/HnBHt5TPFwCJxOBdP1YvVPI5aQdMAUyS6XibS4qHcWYgCmbmsDyLonsIGPXet8BgbS6RroOPMcdMUOd3jpPWm4l6L5eB870KtwvEegr8rDrG6ei4wnKaXrze3MrOkO1N7rdZcN/bPTnrHI4uFErOOTJ5kcf8Z+a5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sfKZb4fZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sfKZb4fZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z7tlvIPQVVOIrSN+nkTXJowd4ISzLB9Yaz5HC7TJyFE=; b=sfKZb4fZc6T6uniPAVFaDiwptx
	3UyI6X1pkzV/vRw26MVVt4YKqz6USEJiZoMtcjYnLoRA28FrZJls+3Ibw/AgLQgtafKRJfySyFEFQ
	smMinDz/hOgd03ZbIGA+6AtoOtlLIH8UNtozWbDPuYaGm06jye2Grx1nztCf33g9XdurkkQ7tfoX4
	miQo9zdkIH4Qub/7zArpXFXnrMN9ZYeeuFhQObFwoXsdzXSFU9oic+y7WiK3puZzoXtxWQLNZ8YB2
	eZh5ktZT7s4mCo5loWlsCxUr0kDXXp6K0Nx8KjWSw+EYEEEbY+VnASJUmgbR1dXWgoXWCoQaKMRIl
	c2PBHeSw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMJv-0000000AjYj-3SlD;
	Wed, 11 Jun 2025 14:20:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8B977308641; Wed, 11 Jun 2025 16:20:50 +0200 (CEST)
Date: Wed, 11 Jun 2025 16:20:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
	mingo@kernel.org
Subject: Re: [RFC 00/13] objtool: Function validation tracing
Message-ID: <20250611142050.GB2278213@noisy.programming.kicks-ass.net>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <vx6cxar2ium7zsqqzf57lmn2nhwemi2kmeu2kal6s4mazj3tp3@zdymccnsispv>
 <d52b6b3a-dd18-4c8e-b7f6-5ac0879d959a@oracle.com>
 <c0153249-5643-492f-ab2f-70dcafcfdd0c@oracle.com>
 <iutvcrog7abyz2ski5fhcfzikc54b2gwodsds2gmovutahapg4@5rk4o4b7eajz>
 <7e803ed0-60ac-4d5e-a039-904c3fba8e80@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e803ed0-60ac-4d5e-a039-904c3fba8e80@oracle.com>

On Wed, Jun 11, 2025 at 08:00:32AM +0200, Alexandre Chartre wrote:

> > That would also mean disas_warned_funcs() would be disabled on missing
> > binutils-devel.  But I think that's probably fine.  In fact that will
> > now have less reason for existing now that we have this tracing.  Maybe
> > we won't need it at all.
> > 
> 
> We can also fall back to using objdump if binutils-devel is not there.

I don't think that is needed; normal builds will never use this code.
Just print "Rebuild with libopcodes for disasm support" or somesuch when
not present. Then developers will know what to do when they need it.
