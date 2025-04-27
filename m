Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08028460
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745781417; cv=none; b=MOxIay2cI0feahAHMF/6QJL+0+1sze8fzy/WfFTLRTKzoLQF6qBe4gTxrDVkwz6B4guEFFbdLSaS12MbWiYarRylKSi1Yd8GpgaW/Gqea+zKm/HjedJyOdPhbG7m0R0S/CeU7JclSC5szo99jKlGTcDfdpkTWElVcbM4DKA4Kwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745781417; c=relaxed/simple;
	bh=Q9hDQlBY2ru3OSyBfmAuDPX3ucicM0D/IFe6QD2dTDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fm0lwg5WOn5bdw+3GzLwiwDtkain5+wf+BhdnZYu4wCSY3c/M1WinrGDp8Qdvb5oPHV/cGwwKwonayZLEm5IrU25B62Ta7cT8pYOU7aeDwF9fGzkKCYeWLf6CrqFcrUETbGNlSElY/QbUFdvY7Q+j3ubYR3ZatqTY1snBynUX08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xyj4dZOx; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xyj4dZOx"
Date: Sun, 27 Apr 2025 15:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745781402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5P22Ywl5AriGsG3fTQB5ESdlx+heQ85/MdeEjJrcpaY=;
	b=Xyj4dZOxpsob9qaDX1J8jK1gCuPkhxlTUKpcnJCOid5P5LfajJLOR6uVVFy9ydPykt+XuJ
	u7u5uEhrBQO3dAJoW23Z9KIBL05NB9rQ3FGJwHnpyOVFoKhWBXItXVh7qx+FhMVgZ1JznC
	egATZ9X9G/QYLNTY85p843iOUM62ArQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: syzbot <syzbot+f57d864a5d6eff90da3b@syzkaller.appspotmail.com>
Cc: bfoster@redhat.com, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_stripe_validate
Message-ID: <5eckzshpqknmjqjakakru6npjxwj74xkimiiueebeg3aufovzf@zdwkxn4eblun>
References: <6772228e.050a0220.2f3838.04b8.GAE@google.com>
 <680e48cb.a70a0220.23e4d2.0024.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <680e48cb.a70a0220.23e4d2.0024.GAE@google.com>
X-Migadu-Flow: FLOW_OUT

On Sun, Apr 27, 2025 at 08:10:03AM -0700, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit 71f8e806a5e4edada72456ee3b2e2d7eab6fadee
> Author: Kent Overstreet <kent.overstreet@linux.dev>
> Date:   Fri Apr 18 16:49:00 2025 +0000
> 
>     bcachefs: Stricter checks on "key allowed in this btree"
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16b9e270580000
> start commit:   ccb98ccef0e5 Merge tag 'platform-drivers-x86-v6.13-4' of g..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7cde9482d6bb6
> dashboard link: https://syzkaller.appspot.com/bug?extid=f57d864a5d6eff90da3b
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131666df980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10556ac4580000
> 
> If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bcachefs: Stricter checks on "key allowed in this btree"

We had a similar one where syzbot manager to come up with a reflink
pointer in the inodes btree - triggers and validation get very confused
at that sort of thing, in particular because whether or not k->size
should be zero is btree specific
