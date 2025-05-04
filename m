Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5BA71747
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746329041; cv=none; b=EqOFPufaU6Uj6jvECHyat636BiR4NMwNnpwZ/qfEVa2dfyC8+ndizg7CQVxfiqi4InOzpoZgzmaqaUF/GSTy3bB+4hdyCftlZpsLZQ9bx1KghP3VoPcf5cvVUCt0WDH57QOsCoCHYA5EG0mJ7LI9CBeGTj+v/0Few3w3KDGHrHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746329041; c=relaxed/simple;
	bh=V9q6PJ50dbn/d+DySx+ayr2VSaarAUWZTqEZ6GU6NbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYluCp+tMVwbk4uKy5KnzHbRzqKK/2bky5xLNXlZQGODRUaZwzDFf1LkZDsIvx+EOfAcfQHJKZMZrGh/jYr9FXcteAFrT3+t/hr2yB0C3HRmKXqaakXnxwz6dMeUaLaX4xZlnUETjOWiFMmkTzrx8J37B7NPKgbR/esGQbZ8+c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=RXE2Ozov; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="RXE2Ozov"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ofwx9mkdCeRM45QZNxr59MfepHE0DoCiTWaOZU1i/Gw=; b=RXE2OzovktibIo6uZtd+wb/Q1Z
	w1hBgZl/BfzkCO/DhQYdEBMh12/mOuzL/L4n5u7bHnLERN/LKLD+LldIuzCfCyTDKfpNblFXEz+9g
	GJ58UKxCYE1hACbLhNpHAzsR+6oWC92/4YTbnLe2gZDdGtwGPhOm6q6vQFslLGJhwdnprJkiIVbZ3
	G5Z97F74BCf7Z8caNGuhCg5g6QSWX+5oSm0RMlnh2L4ktLkqfVau9P3lhGyGknPgd7GmqWvCLKsw+
	FXLLfk95NtSjTPsDVND15RYjVHxv/UF+cKSzeplaANO5IgBwdQsqlZ9baA+P1LC1RPwb0AwYQpG0+
	X9kmETkQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBPxL-0000000BuVZ-454n;
	Sun, 04 May 2025 03:23:56 +0000
Date: Sun, 4 May 2025 04:23:55 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: yikangy2@illinois.edu
Cc: mikulas@artax.karlin.mff.cuni.cz, linux-kernel@vger.kernel.org,
	shaobol2@illinois.edu, yiruiz2@illinois.edu, jianh@illinois.edu
Subject: Re: [PATCH] fs/hpfs: Fix error code for new_inode() failure in
 mkdir/create/mknod/symlink
Message-ID: <20250504032355.GB2023217@ZenIV>
References: <20250504014433.120804-1-yikangy2@illinois.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504014433.120804-1-yikangy2@illinois.edu>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, May 03, 2025 at 08:44:34PM -0500, yikangy2@illinois.edu wrote:
> From: Yikang Yue <yikangy2@illinois.edu>
> 
> The function call new_inode() is a primitive for allocating an inode in memory,
> rather than planning disk space for it. Therefore, -ENOMEM should be returned
> as the error code rather than -ENOSPC.
> 
> To be specific, new_inode()'s call path looks like this:
> new_inode
>   new_inode_pseudo
>     alloc_inode
>       ops->alloc_inode (hpfs_alloc_inode)
>         alloc_inode_sb
>           kmem_cache_alloc_lru
> 
> Therefore, the failure of new_inode() indicates a memory presure issue (-ENOMEM),
> not a lack of disk space. However, the current implementation of
> hpfs_mkdir/create/mknod/symlink incorrectly returns -ENOSPC when new_inode() fails.
> This patch fix this by set err to -ENOMEM before the goto statement.
> 
> BTW, we also noticed that other nested calls within these four functions,
> like hpfs_alloc_f/dnode and hpfs_add_dirent, might also fail due to memory presure.
> But similarly, only -ENOSPC is returned. Addressing these will involve code
> modifications in other functions, and we plan to submit dedicated patches for these
> issues in the future. For this patch, we focus on new_inode().

Frankly, that amount of boilerplate is begging for a helper function...
