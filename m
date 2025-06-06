Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ACADF5C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 01:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749172364; cv=none; b=SZjyMbYrHSy+xAQNFKpdOBN9X064ZSlA6xUknWZxrARCjvFjjsZs9FcgYXY4da7mSBS3cty3Khjb0UJzcqciUlNGpmlcRUTXJIq5+sByJnFlkB0/H18C5O3EBQb2oYcDuojSsTTr/c8Rhbnsmfl3QtRYzQkb0+nB41CkuEIjy/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749172364; c=relaxed/simple;
	bh=iMf7UDSsX3Mm/LHtC2bTXzYk4dQFJ9eq211Scrc0O8o=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pcQu37os40ceFRdbL0Q+6F0D5REpO2cq09Wr57CeoZ1KYXqyAA8iqOuw9ITZPSXpDJAeszH4817jz3iPTI8qV1GrTBxv2HMHMo2J3ZSnPDCTkjN4/AahI4Fkn3PrIq9NJeSz3ByC8RrCUJZBJ1FyNX2VJLwp4PBTc/+bFm2LSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=omfbEecq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="omfbEecq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4042BC4CEE7;
	Fri,  6 Jun 2025 01:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749172364;
	bh=iMf7UDSsX3Mm/LHtC2bTXzYk4dQFJ9eq211Scrc0O8o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=omfbEecqCNV0u4fSV0wkn2rFqgPiiBk4KaDv4YrQCn79QKoxIhov9oFY3gDdb+fWl
	 wJyWcOOO2ZGtH8MurIhycraTkt6JqcRGiO7RiPdYH2j0Co7cyUD0mtRaaN8+KEQbzE
	 D0TL+xc7riC060HBhXRj/FulcXdfJqkFBWlA98IQ=
Date: Thu, 5 Jun 2025 18:12:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ge Yang <yangge1116@126.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 david@redhat.com, baolin.wang@linux.alibaba.com, muchun.song@linux.dev,
 osalvador@suse.de, liuzixing@hygon.cn
Subject: Re: [PATCH V2] mm/hugetlb: remove unnecessary holding of
 hugetlb_lock
Message-Id: <20250605181242.54767f38223f9ebd4c379ccb@linux-foundation.org>
In-Reply-To: <c15bfa20-2113-4299-98bf-1865b6b535ef@126.com>
References: <1748317010-16272-1-git-send-email-yangge1116@126.com>
	<20250604154754.a30e327c3f1640173c8b9cb8@linux-foundation.org>
	<c15bfa20-2113-4299-98bf-1865b6b535ef@126.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 5 Jun 2025 08:44:09 +0800 Ge Yang <yangge1116@126.com> wrote:

> > This change addresses a possible performance issue which was introduced
> > by 113ed54ad276 ("mm/hugetlb: fix kernel NULL pointer dereference when
> > replacing free hugetlb folios").  113ed54ad276 was added recently and
> > was cc:stable.
> > 
> > David said:
> > https://lkml.kernel.org/r/87521d93-cc03-480d-a2ef-3ef8c84481c9@redhat.com
> > 
> > 
> > Question is, will that bugfix's performance impact be sufficiently
> > serious for us to also backport this new patch?
> 
> In some low-probability scenarios, there could be severe impacts. For 
> example, when multiple CPUs execute the replace_free_hugepage_folios() 
> function simultaneously. It seems that we need to backport this new 
> patch. Thank you.

OK, thanks.  I added

Fixes: 113ed54ad276 ("mm/hugetlb: fix kernel NULL pointer dereference when replacing free hugetlb folios")
Cc: <stable@vger.kernel.org>

and moved this to the mm-hotfixes pile.  I'll keep it there for a week
or two for review/test.  Once it goes upstream, this should propagate
into 6.15.x.
