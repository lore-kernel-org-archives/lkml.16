Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAE5293C63
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042284; cv=none; b=QBYw2uAiJDrDf6cn9EJZxcVimPtgkrgWK4HucF3gEGORevr1YOqovD2DhDLa116kSedd2v09fvg/EZO+veQkl3z6lp/r5yQrWfTpuIYueQBsSKqFkd4SNyS8NigSf0GvVcRbB8+0AaqmCypHPmQTmQjhkj7dk5nUw9mfhBLHC94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042284; c=relaxed/simple;
	bh=6bVXfbauPon3jvhbH6VNjykGWMiSG8cMS2Q9MuQav90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n44rcV211iO4AJw2zbmWXre9UFuhl6rR5/nFS3drYrtCBMAvEszZ8n44ZE6hWoZxov3CqRgARKNsXvkyGEYWTn5eJYe7gDlVCxYgPPd/vtvjLo9LrS3CNMbrHDPLeiMwvUZJzjiiOZ6j6TEgyO1NGC0ka+KdP/0hjVPpat705V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=IFhi9UDW; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="IFhi9UDW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qcgYB/L+MAgbsVQxdELUqSoMZHigAhYi8l56ZYN8m0w=; b=IFhi9UDWUOFGZLudEihbLDNXay
	oOnEB0//BgIkQO++otWoplWLde5UYkspTeRucEjeQw7n8kz82FkDmn29be6Ot+40TrjDkXeMEPstP
	bsjum7SQRUBpTb1r+VozS5DqCX7ZYctN5JAORwOHpID2uOxT5q1oZgKMr/RjgqMWRyjLvlhr9Sj8q
	+0vog0qzCw7iU6hTmTAlpwdG7htvcdBuLj2t7wCa8mLRx99cm8AzNjAkgxQHELGBevU8V/HQHMc/f
	MwNtipglpgevco9BoCpwF0ZeAPKJQoJCO04RIvJbJnDJ7M2gGj1bb+VJa+U8x7BwvhRZEGwKXDpGR
	7ulSc01w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC5O-0000000AgRb-19db;
	Fri, 27 Jun 2025 16:37:58 +0000
Date: Fri, 27 Jun 2025 17:37:58 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: ritu pal <ritupal888@gmail.com>
Cc: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	NeilBrown <neil@brown.name>, Chen Ni <nichen@iscas.ac.cn>
Subject: Re: ipc/mqueue: release spinlock before freeing node_cache in
 mqueue_evict_inode()
Message-ID: <20250627163758.GV1880847@ZenIV>
References: <CAEy91+YpzU5tKEfsjt1_Hh0fsiCfVVK099EztXOPFGHFYyA1KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEy91+YpzU5tKEfsjt1_Hh0fsiCfVVK099EztXOPFGHFYyA1KQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Jun 27, 2025 at 06:11:14PM +0530, ritu pal wrote:
> Hi,
> 
> Currently, mqueue_evict_inode() holds info->lock while freeing
> info->node_cache
> with kfree(). Although kfree() does not sleep, it may take a non-trivial
> amount
> of time, increasing the duration the spinlock is held and potentially
> impacting
> concurrency.

That spinlock is inside the inode in question; what exactly is going to be
on the other side of contention?  Note that none of the file methods
are going to run concurrent with that...
