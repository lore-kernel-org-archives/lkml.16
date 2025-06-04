Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9212D25F968
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 03:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749008655; cv=none; b=I5RgUkhndHnYj63SOl71ywtcshvdfjHpiTuMGn32fwL7jPnylBfPv/YJWTU9X8mFNmEcTMolgOBw5J6MIpeaF2ZgeHPour/zChptjzDv0SzxA3yshi0iUihluXDejXxO0Y6/oyP/sdGVWlVZvV3iinsYgWn3qyQ/JnH6NgMiT1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749008655; c=relaxed/simple;
	bh=BbZ9Q/nSUbSTJzvV4QKRTDB8TX7GZOe3HXqU9MTNjPk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=b6IZ8DRz2Fzk6KkG+3xpBvSlfcPJuRv1JwEcvOiYUww97TsCFV8jY2xx38AGNDJjtyhQVHiu7o4sSYlaCyXae8eodHdvx2qNK+15uLs7WlotjFRDWPWymjapHUB92uACFUEZw3vwtRARKhvf2cDlhUhSPwXOVwMETRREQBaWEZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cJi1R5/a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cJi1R5/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F27C4CEE7;
	Wed,  4 Jun 2025 03:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749008654;
	bh=BbZ9Q/nSUbSTJzvV4QKRTDB8TX7GZOe3HXqU9MTNjPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cJi1R5/aIPln+w9qGzHl/DWn683Q6nxxiPcT/3R/fCYrk0kzHS7vHZnSaS2fAul42
	 rf4jBfuCevApSLpY+BJLYo1N6p6upSXY7zWSVPYYlBoMmxUywR+92+eVct5jlDPhxm
	 5QE2YUH/2Iw0a5E8vfFTTCMvkDVOulUDWx5KEex4=
Date: Tue, 3 Jun 2025 20:44:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: lizhe.67@bytedance.com
Cc: david@redhat.com, jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, dev.jain@arm.com,
 muchun.song@linux.dev
Subject: Re: [PATCH v2] gup: optimize longterm pin_user_pages() for large
 folio
Message-Id: <20250603204414.f2963e4a094e360cad7f966e@linux-foundation.org>
In-Reply-To: <20250604031536.9053-1-lizhe.67@bytedance.com>
References: <20250604031536.9053-1-lizhe.67@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Jun 2025 11:15:36 +0800 lizhe.67@bytedance.com wrote:

> From: Li Zhe <lizhe.67@bytedance.com>
> 
> In the current implementation of the longterm pin_user_pages() function,
> we invoke the collect_longterm_unpinnable_folios() function. This function
> iterates through the list to check whether each folio belongs to the
> "longterm_unpinnabled" category. The folios in this list essentially
> correspond to a contiguous region of user-space addresses, with each folio
> representing a physical address in increments of PAGESIZE. If this
> user-space address range is mapped with large folio, we can optimize the
> performance of function pin_user_pages() by reducing the frequency of
> memory accesses using READ_ONCE. This patch leverages this approach to
> achieve performance improvements.
> 
> The performance test results obtained through the gup_test tool from the
> kernel source tree are as follows. We achieve an improvement of over 70%
> for large folio with pagesize=2M. For normal page, we have only observed
> a very slight degradation in performance.
> 
> Without this patch:
> 
>     [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>     TAP version 13
>     1..1
>     # PIN_LONGTERM_BENCHMARK: Time: get:13623 put:10799 us#
>     ok 1 ioctl status 0
>     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>     [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>     TAP version 13
>     1..1
>     # PIN_LONGTERM_BENCHMARK: Time: get:129733 put:31753 us#
>     ok 1 ioctl status 0
>     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> With this patch:
> 
>     [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>     TAP version 13
>     1..1
>     # PIN_LONGTERM_BENCHMARK: Time: get:4075 put:10792 us#
>     ok 1 ioctl status 0
>     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>     [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>     TAP version 13
>     1..1
>     # PIN_LONGTERM_BENCHMARK: Time: get:130727 put:31763 us#
>     ok 1 ioctl status 0
>     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

I see no READ_ONCE()s in the patch and I had to go off and read the v1
review to discover that the READ_ONCE is invoked in
page_folio()->_compound_head().  Please help us out by including such
details in the changelogs.

Is it credible that a humble READ_ONCE could yield a 3x improvement in
one case?  Why would this happen?

