Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD8322688B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746654843; cv=none; b=P147Qgx0WTCx+iIUpFtE3QUV49dEhbmKwa/BG7ybYzle2mfsR4pFZree3qMOHympzcalRHF8jdp0Abg+JUYavhGKmew8pk2HELiJaVD6bXzSqsG0pd2G6NGR/AjkMxQ6GdE3e6klzyroNDauKHQNIFrEdQUn4m6uSFyZEiJlykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746654843; c=relaxed/simple;
	bh=F0NOw/HhhdXcai5+04nG+KmxK5Y1lHdd27d4W5YPT0A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kw6xDz9WbTDp5EYaf3fIWtXWOIsZGrAcEB7wQakUCRyXoTyNqVjusHVNS0L9dc/GYorwOuRLGzowFkVhB45B+oItyYl1KX53CzOOwFJJjX61kTzJWnaQctOOtb42TJcMYzyQnXqv0sje60kSsXl52rnmijHyV8Nqzovqrp9KfLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bqIZIXJd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bqIZIXJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B96C4CEE7;
	Wed,  7 May 2025 21:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746654843;
	bh=F0NOw/HhhdXcai5+04nG+KmxK5Y1lHdd27d4W5YPT0A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bqIZIXJdo1vgb4dJgvLtTgj1mBU5YPAQ2rZJDKygUJMuEwOxOdUigrAwjHoR5DIxk
	 sa43vkpKRRl1zIBPdWhEGtIGoKIU/2My9OJ254/pMQpThUqd52zCUV//0Ddr3kR1NE
	 1URG4Tbp4OEPwicJVM8iMnaBwSpDPkwK/fYu6qbU=
Date: Wed, 7 May 2025 14:54:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pantelis Antoniou <p.antoniou@partner.samsung.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Artem Krupotkin
 <artem.k@samsung.com>, Charles Briere <c.briere@samsung.com>, Wade
 Farnsworth <wade.farnsworth@siemens.com>
Subject: Re: [PATCH 0/1] Fix zero copy I/O on __get_user_pages allocated
 pages
Message-Id: <20250507145402.d162d92fa29130d690461a0b@linux-foundation.org>
In-Reply-To: <20250507154105.763088-1-p.antoniou@partner.samsung.com>
References: <CGME20250507154119uscas1p2a4055d14ab111fdb94a6378789c38d9d@uscas1p2.samsung.com>
	<20250507154105.763088-1-p.antoniou@partner.samsung.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 May 2025 10:41:04 -0500 Pantelis Antoniou <p.antoniou@partner.samsung.com> wrote:

> One example of that is the 9p filesystem which is commonly used in qemu
> based setups for sharing files with the host.
> 
> In our emulation environment we have noticed failing writes when performing
> I/O from a userspace mapped DRM GEM buffer object.
> The platform does not use VRAM, all graphics memory is regular DRAM memory,
> allocated via __get_free_pages
> 
> The same write was successful from a heap allocated bounce buffer.
> 
> The sequence of events is as follows.
>
> ..
>

There's a lot of good stuff in this [0/N], but a single patch "series"
is cumbersome.  Can you please redo this as a standalone patch in which
the changelog is the union of [0/1] and [1/1]?
