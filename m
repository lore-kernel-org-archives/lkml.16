Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3D22257D;
	Sat, 10 May 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746885760; cv=none; b=GqrJDBYInHNZarWEfQGnUSLjDSJ8AAlflz8qg6yczi89S50c8K7ZAtwGB63VXDat6XvbpfIWRwFl9GDKse/a3AYuxk4NA5sjbyc22dicKrBK9ZVm7tHBrLOi0DCKlBKu75yazVJy9f7WdyfOx2yZUW2ZHkBO4XbAbgwOfsBfvI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746885760; c=relaxed/simple;
	bh=2XWdywg6ZvZzXHbTOTG/a2iluWjXymhAIWpEo9FlkdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K59yXGX1n+2nj1c+qSRPrhAmwQQl06+dKisxDKh3GR1a+DF5i2/vYds4jV5xs/EGEbMzUbQo/G9YOc02DqwLF3uYHsVG7S6PTMGDvNrPmYQcgWF0X8nQNtdEHKKiRvEwQtBuxD60LRTV/is8buS/6oZwQejZGDOXUDNGLFAO+RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoYvyrK4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoYvyrK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB225C4CEE2;
	Sat, 10 May 2025 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746885759;
	bh=2XWdywg6ZvZzXHbTOTG/a2iluWjXymhAIWpEo9FlkdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MoYvyrK4Ad0pwDgpp8dx/CY0XK5+fQJzeFGnAWrS6/NvL8wHsvxbwHRRuK0vx9zBe
	 uboZvPmuQdBxwSZui2oG8AV5nEyBjS8/8+sO1F59P/75FjZcRjsSXJcVlIr50FGl7X
	 gEXmorsHtmtUAEOUmKhiAYaIgeCLt83yysgV5gL5pxYIrpb/Bmj4oxb8Kg2bG6Uwxz
	 xyWfUfUFOqpYcwCVokgmRrPaU+7aKxMtnO7pKqGPgqQZPfqCY56eFWoapTKueHU23K
	 32yanyaO3Oasiromc9XsxeiHgyWt+tIsPgiCrxQsD4292QozMquLgu6wH8q69CllE3
	 NC5X0l2dB2Nxw==
Date: Sat, 10 May 2025 16:02:33 +0200
From: Greg Kroah-Hartman <gregkh@kernel.org>
To: Wang Zhaolong <wangzhaolong1@huawei.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2025-37835: smb: client: Fix netns refcount imbalance
 causing leaks and use-after-free
Message-ID: <2025051017-finisher-smith-3f26@gregkh>
References: <2025050908-CVE-2025-37835-546f@gregkh>
 <d2ab4035-d893-44b6-a511-656b5177ba74@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2ab4035-d893-44b6-a511-656b5177ba74@huawei.com>

On Sat, May 10, 2025 at 05:33:40PM +0800, Wang Zhaolong wrote:
> 
> > 
> > Affected and fixed versions
> > ===========================
> > 
> > 	Issue introduced in 6.6.62 with commit e8c71494181153a134c96da28766a57bd1eac8cb and fixed in 6.6.87 with commit c6b6b8dcef4adf8ee4e439bb97e74106096c71b8
> > 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.12.23 with commit 7d8dfc27d90d41627c0d6ada97ed0ab57b3dae25
> > 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.13.11 with commit 961755d0055e0e96d1849cc0425da966c8a64e53
> > 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.14.2 with commit 476617a4ca0123f0df677d547a82a110c27c8c74
> > 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.15-rc1 with commit 4e7f1644f2ac6d01dc584f6301c3b1d5aac4eaef
> > 	Issue introduced in 6.11.9 with commit c7f9282fc27fc36dbaffc8527c723de264a132f8
> > 
> > Please see https://www.kernel.org for a full list of currently supported
> > kernel versions by the kernel community.
> > 
> > Unaffected versions might change over time as fixes are backported to
> > older supported kernel versions.  The official CVE entry at
> > 	https://cve.org/CVERecord/?id=CVE-2025-37835
> > will be updated if fixes are backported, please check that for the most
> > up to date information about this issue.
> 
> Hello,
> 
> This CVE has already been submitted previously, under the identifier
> CVE-2025-22077.
> 
> The relevant discussion can be found in the following link:
> 
> https://lore.kernel.org/all/b7822cca-5ef5-4e09-bca1-2857aada4741@huawei.com/
> 
> Is this a redundant submission?

Yes, sorry about that, this will now be rejected.  I need to go and
sweep the ids for any reverts like this one, thanks for reminding me.

greg k-h
