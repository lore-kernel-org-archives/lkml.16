Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD071DB34B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233093; cv=none; b=dTvLh+ZDfytNmzh67//c1eI5AM5M6vvo2J4yehwqSGqryzaFKW6C39QALShBoBqZuBDXI1nB78BxqSAr9hk+rk5/IizLpQ6bQPv6fPFcjLxWSPFIcnQFPMOsiThhDbndECRXgs5/anFHq/S5QTG5AH1rvGDA6gok+nTZy7l3Jmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233093; c=relaxed/simple;
	bh=wkDkk7Z7cHX0G/3db/Y8x874CyZ7qgRMDvsW3aX43Mw=;
	h=Date:From:To:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Efn6Z9SFCcvYt477oK4GsHGyM2hmEc8YtsWsS/pcRvGjwMb9uYjxnT58r7w65fePSHKyjaj+ilZjPzzezt41BvrSF1ISO3kCwXAWRBcRMwyvHrlz0sntCtz0Snb1gTd8k6z0VTWLk1xM6WfjPz6/e92XTpnWJhk++M7XIwuJzjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EkpCov4T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EkpCov4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6031BC4CEE2;
	Wed,  9 Apr 2025 21:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744233092;
	bh=wkDkk7Z7cHX0G/3db/Y8x874CyZ7qgRMDvsW3aX43Mw=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=EkpCov4TlqvKEMnRMX1IEGR3zgILgKvQFRsBgMWR54sJJEx66O/dYPxv0Xulirzrs
	 vz6lff52oiMZjAnl6I9LDUCXOWCxOuNJ2rE+3w6WYAwW2dXV0fbn6JtSzENLvM7dKF
	 wQs+1uZT0bs9HXm+1RBEc41UzwO2r+Sa9251Pc0I=
Date: Wed, 9 Apr 2025 14:11:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "T.J. Mercier" <tjmercier@google.com>, Suren Baghdasaryan
 <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, Janghyuck
 Kim <janghyuck.kim@samsung.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: Handle incomplete bulk allocations in
 vm_module_tags_populate
Message-Id: <20250409141131.bd67f6b19ea7e770dce40ac7@linux-foundation.org>
In-Reply-To: <20250409140848.da67768ac1f5e79d7296de4d@linux-foundation.org>
References: <20250409195448.3697351-1-tjmercier@google.com>
	<20250409140848.da67768ac1f5e79d7296de4d@linux-foundation.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 14:08:48 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed,  9 Apr 2025 19:54:47 +0000 "T.J. Mercier" <tjmercier@google.com> wrote:
> 
> > alloc_pages_bulk_node may partially succeed and allocate fewer than the
> > requested nr_pages. There are several conditions under which this can
> > occur, but we have encountered the case where CONFIG_PAGE_OWNER is
> > enabled causing all bulk allocations to always fallback to single page
> > allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
> > allocator recursion with pagesets.lock held").
> > 
> > Currently vm_module_tags_populate immediately fails when
> > alloc_pages_bulk_node returns fewer than the requested number of pages.
> > This patch causes vm_module_tags_populate to retry bulk allocations for
> > the remaining memory instead.
> 
> Please describe the userspace-visible runtime effects of this change.  In a way
> which permits a user who is experiencing some problem can recognize that this
> patch will address that problem.
>
> ...
>
> Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>

A Closes: link will presumably help with the above info.  checkpatch
now warns about the absence of a Closes:

