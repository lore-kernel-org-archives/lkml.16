Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9581D6AA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916854; cv=none; b=t5v3uvGaN257c6TcPLMPWPDRXW/y9Aybb3OvkJhm2AADRR19QcW9GOH0CogQjXYaTmjLW7tGINblPleFnWW6u9fWg17RqzRA58g7rsLxQWz0auzYEulEWwTCuWn0BlFhe5ohdOEIg5s2vxD42CgRr3WuNUDZ7Q8lgtLzvEWygt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916854; c=relaxed/simple;
	bh=l89CVAgrf6NbjXmZn493UzIPoQWHNO4/bSGwMhKuVLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JU/eyqUMq/bixQL6DDHY4hJNH3Pi2ZZP1mcV72gbKTWVoW30xB1lXX5pN3xfiy6ifGCPKd0gHniOhLDQQUiHKUxuYnhlqokzGN5Gav7cZlCCltlVy4ASrQOgJUWuyn60CElRlxB8+iFHxXqpIxtJdLyPClnyGoJNeQxKb1FN1+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K/+Fjgqw; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K/+Fjgqw"
Date: Thu, 17 Apr 2025 15:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744916839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8GprfIetrM71UV4LpfxlA9bNdKUkj0bUgUS9fchsWN8=;
	b=K/+FjgqwT7RApRch1+XZLA1LElSsAzzbevpFTvvz9dnhgU45n3x98DigF6Uk8GcdbJzlAm
	63ocMb/YbwSVXQWeHhslSVi9qNhc9nGsCcIn7unIUvNnPfGOc8kOFb9VLP681o9RAL3v8a
	5m2qWH89HSGu4/DswQiGjTqH2MUucLY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: syzbot <syzbot+7b8a2c442d5a4859b680@syzkaller.appspotmail.com>
Cc: brauner@kernel.org, jack@suse.cz, linux-bcachefs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mmpgouride@gmail.com, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_btree_node_iter_init
Message-ID: <5ak2ca4mmahamjzapplnuwffuxp256dlfamn237vu5qrjq3uyf@qe62gpj5ffvb>
References: <679ff200.050a0220.163cdc.0032.GAE@google.com>
 <680150de.050a0220.297747.0000.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <680150de.050a0220.297747.0000.GAE@google.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 17, 2025 at 12:05:02PM -0700, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit 3a04334d6282d08fbdd6201e374db17d31927ba3
> Author: Alan Huang <mmpgouride@gmail.com>
> Date:   Fri Mar 7 16:58:27 2025 +0000
> 
>     bcachefs: Fix b->written overflow
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=125aba3f980000
> start commit:   6537cfb395f3 Merge tag 'sound-6.14-rc4' of git://git.kerne..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6cc40dfe827ffb85
> dashboard link: https://syzkaller.appspot.com/bug?extid=7b8a2c442d5a4859b680
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1055c7f8580000
> 
> If the result looks correct, please mark the issue as fixed by replying with:
 
#syz fix: bcachefs: Fix b->written overflow
