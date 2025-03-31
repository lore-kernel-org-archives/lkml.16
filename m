Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDF81D5CC6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408415; cv=none; b=X0JWxrwCxrXe2vSlUMtTkJb4a3uI1Z11aAl59k+CU7MJCi0dV4rs6aInE9kP5cPoCsX08tVWl1ScjX/Bf0pio+mfdNTt+7vxXB6Vs2Zu32N3OB4gdRqonOG2eFWKxr/g52Gr113dHudL5ALh4hSZ5oGzNpXUVKO1k8iMEsnfuR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408415; c=relaxed/simple;
	bh=3jBatRXDVualpNCQqPu9fTtm3RuHDjRzaBOaXCmxQSc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=hHdbOSlwewsXAYYyhLX1SwyUCOafCu/HJo4Cm5J6z2VCFXqC3xgvfhxdbArqkGzdBbSzVz79kJ/lfZ5ZVUj/ccAgaePDAlDVOLRndReW9awikbuYQ9HZFLknYhZ8CkSWgDT/Hf4wFSkLYMDtWaRfe4ABYyEjKzHL5Vhd5oJDMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d5a9e7dd5aso44955565ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743408412; x=1744013212;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1N2IlYmogkl1BCwYrDbBWJW9jRi8jD9aDkBGY1rBpjA=;
        b=gT996v/22UPF+vJO5DkO73yRstV+oyL8KXEXgYf3EDYUjzWooAFqBX6iQBDQAGoHi4
         C0RIuuBxo0Xj0fcPJkAKyUETUZ9Pr2pjWeXKvE9Ab7F7J+reqpF6VYX2Lq3MiOrJHuBE
         a9+wkmpQzLE2hPpAcbn1IU0DIsYK75qxJzJwBzhd+cMnCzl/d0RcvineSHUfQcQ6RK6h
         OnWNw0rdipRgHys8Oj41kdoozPsMCL/8JFHEOXjnBSeWYwGoB6+AxE/rxyXKUKB8yE1x
         dYBXkoq9L+fTK388ghpNZb1oczQoOXdIA8OHFhlePJDe3cYdClR7Xj8MX4QMuBK8lYnc
         IEoA==
X-Forwarded-Encrypted: i=1; AJvYcCUT2arbbXr342m14RiEWHtnFpDVLRLzzniXzVJgjuAnj+co1I9Q+Ukt84c9O5ATLPK6gtdfo6SwPc/20QM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOqUBkFecxBV+KsDWmNF2PncCFrw3E6pxwzIANE7NT1CJTm3wc
	4iny8avMnUTMtziwUekFXFfdBbhNFwJK7ttf9Tc0b0j2mxzYtskfvNkUUBKymgqgoQx5PEyAZNt
	BN5une58WmUbuA7rGVDCS3bdzdL04+i35nPzcqVssbdKIdB8uyeQBkDo=
X-Google-Smtp-Source: AGHT+IET23zu9tlwVBsyEgW7egXSSD3VInVvV6doXQWpbvjplVWicxmICEMhEa/SvpiyVoRAJQZ5hkfjuzTe2YIkQHSu183Qxz50
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cdae:0:b0:3d4:2306:6d0 with SMTP id
 e9e14a558f8ab-3d5e09c8ff7mr67421795ab.14.1743408412676; Mon, 31 Mar 2025
 01:06:52 -0700 (PDT)
Date: Mon, 31 Mar 2025 01:06:52 -0700
In-Reply-To: <164861.1743408402@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ea4d1c.050a0220.1547ec.0121.GAE@google.com>
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid
 context in __do_fault
From: syzbot <syzbot+8245611446194a52150d@syzkaller.appspotmail.com>
To: dhowells@redhat.com
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

This crash does not have a reproducer. I cannot test it.

>
> commit db7a516159869b19f237c73bd75599bbe0bfcc4d
> Author: David Howells <dhowells@redhat.com>
> Date:   Fri Mar 28 16:46:58 2025 +0000
>
>     afs: Fix afs_dynroot_readdir() to not use the RCU read lock
>     
>     afs_dynroot_readdir() uses the RCU read lock to walk the cell list whilst
>     emitting cell automount entries - but dir_emit() may write to a userspace
>     buffer, thereby causing a fault to occur and waits to happen.
>     
>     Fix afs_dynroot_readdir() to get a shared lock on net->cells_lock instead.
>     
>     Fixes: 1d0b929fc070 ("afs: Change dynroot to create contents on demand")
>     Reported-by: syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com
>     Signed-off-by: David Howells <dhowells@redhat.com>
>     cc: Marc Dionne <marc.dionne@auristor.com>
>     cc: linux-afs@lists.infradead.org
>     cc: linux-fsdevel@vger.kernel.org
>
> diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
> index 691e0ae607a1..8c6130789fde 100644
> --- a/fs/afs/dynroot.c
> +++ b/fs/afs/dynroot.c
> @@ -348,9 +348,9 @@ static int afs_dynroot_readdir(struct file *file, struct dir_context *ctx)
>  	}
>  
>  	if ((unsigned long long)ctx->pos <= AFS_MAX_DYNROOT_CELL_INO) {
> -		rcu_read_lock();
> +		down_read(&net->cells_lock);
>  		ret = afs_dynroot_readdir_cells(net, ctx);
> -		rcu_read_unlock();
> +		up_read(&net->cells_lock);
>  	}
>  	return ret;
>  }
>
