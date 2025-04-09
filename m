Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809762116F2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232929; cv=none; b=erFVqnOssrEUcx8WiTe9wAcGqlNFYAGFxZkrKwAS1IuTeTegQeqTwoM6WtwIDIUyPkRbS5rzbv/OZgqzclNajAXWxaStnoso7qMvNCv+hYm3U4px8pizxWcgQr59UVM+RFSfQj86p06+Rs6Mc2cy2MILsU6RmIUDbKDSJvUyfKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232929; c=relaxed/simple;
	bh=rd/pyIQ7u8TrCNP+10m5jCKLnMkOGoR9Cho52eNqy9s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mYIl1tDGilV7V2V/bAxKe6lQCPMU6W8rDqbnFMW2Ohyfdo3qfTpxyJZ1ivqu/qvknnEErg2xxy1FGI/4ATZFX5+6g1IW7/WYACbUNKJ4NSvJTkxtF9DcpguM5dorJDtQCTHDgmBmW3H/DwqpD1ECvwsOeCxn36ieqRPUvMVfwrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xkVPptkZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xkVPptkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4733C4CEE2;
	Wed,  9 Apr 2025 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744232928;
	bh=rd/pyIQ7u8TrCNP+10m5jCKLnMkOGoR9Cho52eNqy9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xkVPptkZxljj/Owe9fPrhIOngMTWjFrVGka8k3lVp1Rr3ESsv3gikQSgHbGB1yDsh
	 3Yzrbgp5CcTyYHqFOI78FvwE76aNnVjdZ8Yuka+/qoX+pWYBqwHXV9993Lrsh3JMwE
	 CAWetidRrtzsSJfI2QNNC9WY+gmmr+M8djx+mpos=
Date: Wed, 9 Apr 2025 14:08:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Janghyuck Kim <janghyuck.kim@samsung.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: Handle incomplete bulk allocations in
 vm_module_tags_populate
Message-Id: <20250409140848.da67768ac1f5e79d7296de4d@linux-foundation.org>
In-Reply-To: <20250409195448.3697351-1-tjmercier@google.com>
References: <20250409195448.3697351-1-tjmercier@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Apr 2025 19:54:47 +0000 "T.J. Mercier" <tjmercier@google.com> wrote:

> alloc_pages_bulk_node may partially succeed and allocate fewer than the
> requested nr_pages. There are several conditions under which this can
> occur, but we have encountered the case where CONFIG_PAGE_OWNER is
> enabled causing all bulk allocations to always fallback to single page
> allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
> allocator recursion with pagesets.lock held").
> 
> Currently vm_module_tags_populate immediately fails when
> alloc_pages_bulk_node returns fewer than the requested number of pages.
> This patch causes vm_module_tags_populate to retry bulk allocations for
> the remaining memory instead.

Please describe the userspace-visible runtime effects of this change.  In a way
which permits a user who is experiencing some problem can recognize that this
patch will address that problem.
