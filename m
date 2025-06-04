Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3FB1547C9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 22:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749077275; cv=none; b=DrERTMRAIoA93pBJq8oY9VmLSZnOqjcVtJRdtroprwV31/HHPjIn+Ut492/p35Id9EoSR2nXc4sPCDZa1S4WQOY8CdPCXfzAm9IkG0nYc1N/H053TwPONTJrZMjDMUyIGT2h5jVbi0buaBsBZldv7R3CTI1VQQhijiodBHF/X4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749077275; c=relaxed/simple;
	bh=lTyIl3tFEZAFEhIjI5VOgHghdPUqVQ2X+80AE0ergFE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=P/Q2bfrxjVPWngYUGiJyBwZ3uu5xDOldidqLuUKhtiUATbxtftJMrfqtX08y/iKnEDmjwI2w/IKT8UcKVlcAFwDa/l716J2msW6xpyAYKlpxIsCTUIBcpOMQw1WREpyRJQ0K0Hw+BSaGzOW89bxwg/7AEWJNVwbeYpa/6QXxMxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zsYONRVJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zsYONRVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E8AC4CEE4;
	Wed,  4 Jun 2025 22:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749077275;
	bh=lTyIl3tFEZAFEhIjI5VOgHghdPUqVQ2X+80AE0ergFE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zsYONRVJWIbFLTEWTOey1C+KZduSzpXfe9px2qj9Z47nLJjO9uITUTfcOFg7N0CSc
	 Y0osN/dCiKZR954vBcc5lcKwNXCgKbZkyOQ/TdInhViPXF9s/ANuyNLs9zFEB8X0WO
	 wUWOSJgOfEVR1Ujh18EPzbc7USrYQGIGts1qYk4o=
Date: Wed, 4 Jun 2025 15:47:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: yangge1116@126.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 david@redhat.com, baolin.wang@linux.alibaba.com, muchun.song@linux.dev,
 osalvador@suse.de, liuzixing@hygon.cn
Subject: Re: [PATCH V2] mm/hugetlb: remove unnecessary holding of
 hugetlb_lock
Message-Id: <20250604154754.a30e327c3f1640173c8b9cb8@linux-foundation.org>
In-Reply-To: <1748317010-16272-1-git-send-email-yangge1116@126.com>
References: <1748317010-16272-1-git-send-email-yangge1116@126.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 May 2025 11:36:50 +0800 yangge1116@126.com wrote:

> From: Ge Yang <yangge1116@126.com>
> 
> In the isolate_or_dissolve_huge_folio() function, after acquiring the
> hugetlb_lock, it is only for the purpose of obtaining the correct hstate,
> which is then passed to the alloc_and_dissolve_hugetlb_folio() function.
> 
> The alloc_and_dissolve_hugetlb_folio() function itself also acquires the
> hugetlb_lock. We can have the alloc_and_dissolve_hugetlb_folio() function
> obtain the hstate by itself, so that the isolate_or_dissolve_huge_folio()
> function no longer needs to acquire the hugetlb_lock. In addition, we keep
> the folio_test_hugetlb() check within the isolate_or_dissolve_huge_folio()
> function. By doing so, we can avoid disrupting the normal path by vainly
> holding the hugetlb_lock.
> 
> The replace_free_hugepage_folios() function has the same issue, and we
> should address it as well.
> 

This change addresses a possible performance issue which was introduced
by 113ed54ad276 ("mm/hugetlb: fix kernel NULL pointer dereference when
replacing free hugetlb folios").  113ed54ad276 was added recently and
was cc:stable.

David said:
https://lkml.kernel.org/r/87521d93-cc03-480d-a2ef-3ef8c84481c9@redhat.com


Question is, will that bugfix's performance impact be sufficiently
serious for us to also backport this new patch?
