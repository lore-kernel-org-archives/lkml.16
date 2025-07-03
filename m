Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66F017C208
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 01:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751507440; cv=none; b=devZrXpN/B5R8VxdEwA/RrCpYE0OpLIQMiGTP44cNWmb/wKG+LGGq009JCuSI0IgFAQ6jOeH4Uno+0S6eYgmgB7D+ANrRz5HnQorqrRHfpsT6nQbPR4G4wHmVYpPDVgLNisVGxh0zuq4DWfq/MndP9GcQJBjhvSC6WYmcL4Wnng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751507440; c=relaxed/simple;
	bh=uU5CNAmJ7OpvToYcOnn9d4jA3wBsGzcqaarRtjLrDTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Out08Z1JxZH6mQXF7WZdtd1vDXaV9ZPTpVuImkw1TkezgW+RIUHUPYg5UXTp/EKkJqJWgdFcjkfZczp1taxzSSeE4QY0VzCKfpTbM4rQKWZRTXOFV1BS3wUoav//D1BWgTc/runSbsFEeHHOCOqsiJ2h7PADFOunQvLZp8CAG5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=CJHJ+GJm; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="CJHJ+GJm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qF1BJOkB08ifdMBhZHOeavutsh91VXITQ7EETILhaDc=; b=CJHJ+GJmnO5kkJ9a3BKgnPbOPH
	42I7Z99Jk9Y7ZXsBoxzRhrPKi3Gm2Y6fmMmJkVto9iGUc5QENd5V0+P4jVEfw6oYsPLpec+cqpx5Q
	T5Zl1SPjfz/VPWL1DOxZ5D2RqSXk067MoAlTPDBSxpyzr+RSUBIu9vPcMKpwaS34xzDnOLQrqNONw
	JovLJkyU6G+PVqcrFiR5g7W70y6dILhwwlemPP8Zyzw//sthEpsHvw80gTi1ctr3eh4iwwoOssZbI
	ktUU7h/6BrNyKy1z3+K7U75DYcYmSbK8obX75mH56EK7SG7umMohkza4xppCPZxOsYxzyeQqpxFEv
	BvhywnvQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX95t-0000000GExH-19bq;
	Thu, 03 Jul 2025 01:50:33 +0000
Date: Thu, 3 Jul 2025 02:50:33 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com
Subject: Re: [syzbot] Re: [syzbot] [nfs?] [net?] possible deadlock in
 rpc_close_pipes
Message-ID: <20250703015033.GH1880847@ZenIV>
References: <68656f4c.a70a0220.2b31f5.0000.GAE@google.com>
 <6865da26.a70a0220.2b31f5.0009.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6865da26.a70a0220.2b31f5.0009.GAE@google.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Jul 02, 2025 at 06:17:26PM -0700, syzbot wrote:
> For archival purposes, forwarding an incoming command email to
> linux-kernel@vger.kernel.org.
> 
> ***
> 
> Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
> Author: lizhi.xu@windriver.com
> 
> #syz test
> 
> diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
> index 0bd1df2ebb47..ae5643e0bc43 100644
> --- a/net/sunrpc/rpc_pipe.c
> +++ b/net/sunrpc/rpc_pipe.c
> @@ -693,7 +693,7 @@ void
>  rpc_unlink(struct rpc_pipe *pipe)
>  {
>  	if (pipe->dentry) {
> -		simple_recursive_removal(pipe->dentry, rpc_close_pipes);
> +		locked_recursive_removal(pipe->dentry, rpc_close_pipes);
>  		pipe->dentry = NULL;
>  	}
>  }

Excuse me, but... which caller of rpc_unlink() is holding any directories locked?
IOW, this patch is an LLM-grade nonsense.  If it really *is* chatbot-generated,
that's a lovely demonstration of the reasons why generative AI have no business
sending patches of any kind.

Note that report clearly refers to rpc_close_pipes() as one of the locations
involved in a possible deadlock.  The difference between simple_recursive_removal()
and locked_recursive_removal() is that the latter is to be called when the caller
is already holding ->i_rwsem on the victim's parent.  *IF* that was the case,
the deadlock report would point to that caller vs. simple_recursive_removal().

rpc_close_pipes() is a *callback* passed to simple_recursive_removal(); if it
turned around and called rpc_unlink() we would have a serious problem indeed,
and it's very easy to see that nothing of that sort is happening.

The worst part is, that patch is likely to make lockdep STFU - by failing to
lock the parent.  You really need to reason; "throw random shit at the bot
until the warning goes away" is an actively harmful strategy.

As for the warning, it is a false positive caused by lockdep annotations, as
the original report suggested.  Replace inode_lock(inode) in rpc_close_pipes()
with inode_lock_nested(inode, I_MUTEX_CHILD) and try to reproduce that.

For syzbot maintainers - git blame is useful.  I would really appreciate the
original report...
