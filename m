Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95435261575
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749012218; cv=none; b=Yjr2qUPjoyDLFkfSqk1ZCX6np9lWtNiAFpiG543Uq2z9kFhyD4sBnBI3TXE+n+QsbgXzJSjzHrOB+jZnnLW4fedBahhPou6KrLu8paeDJyv1BgJAU07aRldRX96ojU32pi8eT7fNLb8WpCPlnurSVM8+5s6ztiSO3sco/s5CGFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749012218; c=relaxed/simple;
	bh=fqYLWp56ZjaljQVflD6EZiR64LHSxqZRiEXkA31t9o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngGfHPbF0SFa6eOq2aURH92umH9N5IgFAIR2e8HCUG3jc86jCtSFnQG1crm4wUr0czblcwMrezVowAAR+sEx5E60PzG4IhckBmRi1EqBx/1CCz+kjwyTKeaUEUng0K+/f1NZ6SITfDc1yRx0uBtyEcRdk5nsjB7IJq1T437zV8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=vJjCcqm8; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="vJjCcqm8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9yCSG9dCZxhjXtytnEcC+2OnyRrTmhcinCS2NQg1evQ=; b=vJjCcqm8o4qFstdheGQ933DAdF
	NLpBLMU+xCAgsfDvEJFR4YfF97VUU1Gu7GIEyh+/zPSAhuf1sb7Lse743/Rr6Nk5jMH5rTRBtd2LA
	VyTt01/yC9BVkZVWi6zVTSQOc36w4VNX8+2w0S4kDknub6N04A+80UlBIacQdROM/ZHHlRmPVLtBw
	6dxIeLPUqEBeQ08fOy49uiVyUcoyTdBHbAs1sTbhtcc2H67dHU9slVD0ZKptMBYxjEj5FLyxvuPWk
	ieXjnhPTyz/C3+Frq8Aexsvw696ENOc61wHZgiSErJTbwrlwOOFBWjiyb2/tI9GdPlOaQVv+EwdRl
	OFoECzqA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfyP-000000033x9-2XbX;
	Wed, 04 Jun 2025 04:43:33 +0000
Date: Wed, 4 Jun 2025 05:43:33 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Luka <luka.2016.cs@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] unable to handle kernel paging request in process_one_work
 in Linux 6.12
Message-ID: <20250604044333.GG299672@ZenIV>
References: <CALm_T+3=v=zMnYCMOjunYRU3anKrbOeWmsi=3jnS88gsH3qSPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALm_T+3=v=zMnYCMOjunYRU3anKrbOeWmsi=3jnS88gsH3qSPg@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Jun 04, 2025 at 12:06:56PM +0800, Luka wrote:
> Bug Report: https://hastebin.com/share/yacupoheje.css
> 
> Entire Log: https://hastebin.com/share/inasotiyuz.perl
> 
> 
> Thank you very much for your time and attention. I sincerely apologize
> that I am currently unable to provide a reproducer for this issue.
> However, I am actively working on reproducing the problem, and I will
> make sure to share any findings or reproducing steps with you as soon
> as they are available.
> 
> I greatly appreciate your efforts in maintaining the Linux kernel and
> your attention to this matter.

On the off-chance you are for real: anything that requires any kind
of javashit interpreter is a non-starter.  I'm not wasting my time
decoding that "language" and I'm sure as hell not going to trust anything
browser-like to run code from an unknown source without getting buggered.
Ain't happening.

If you want that stuff to be looked at, post in plain text.
