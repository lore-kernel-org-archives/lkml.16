Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E1113E41A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744929226; cv=none; b=uMr7SaneiPtoKeUkbG0wtHK2D1hYI/tuOp5TO1CznV1fvUysGe5QppoLqDu50ohrA8qNYQga+CLYbNoWdrYQubazc8KwELc/p+ZnX8fgJnneKqgm8z8qXM+b5SnkDSc2/o76sy4yjrr2A0ePR1p+vr935D58tAcLFMMGW3Y9NoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744929226; c=relaxed/simple;
	bh=1+WGp7jt6wtHQuFVvTRgLK4SyIAYQphn2hiH4AWWyg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vbu26uK8vAXApffdSYsuj2IqSczG0CVG9HJa5eUllkCPQP0IxiukwhyqnndjWsUvvs9sIxiEdxVcm5QH+tcIv+OTvKbuaShAGc1USscJeNUIfKh0aqg9c5TOIVJOaaDnUpuPOWlzgWP0UWqUsMHgpxJgVNUkT10+XXkxMHznUBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7r9pEf7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7r9pEf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744929224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j0E8sryxarxOaUI72XzRcIS2gIQk2T23BxOojM0ba14=;
	b=N7r9pEf77Je3qreYoYeVz8xGFhjB1OKhuq1LddPGketV8PXYEPkukGmX+o7FmDBUhPrETT
	2l9cs/jm1AbcVJL4xDMzHLTxJHboYYTgC65ZPLdyXBqqy1Mpoia5Gu2WVmnnSr+iiqDVWy
	tJ8zZkP+utBB/IlOcKJLBZwTaVC8n+E=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-3aJDxUeHPgOEnFCSuMYx2Q-1; Thu, 17 Apr 2025 18:33:42 -0400
X-MC-Unique: 3aJDxUeHPgOEnFCSuMYx2Q-1
X-Mimecast-MFC-AGG-ID: 3aJDxUeHPgOEnFCSuMYx2Q_1744929222
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9450b19so26595446d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744929222; x=1745534022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0E8sryxarxOaUI72XzRcIS2gIQk2T23BxOojM0ba14=;
        b=Gndx5urTW7hLCqFYDegFCZrZCHdW1KfK7l45t0bUXe9aUK12a5L1NbWqM3oijzx2wy
         4PKTATdXgKgzne7F3mgijz33Rm6kj8R0p5oVlwmzodEBTk7Nb47zGbcK0vOPAQb2h4dW
         WnmGc+4feCDZaala03xP2oCtgFmRHT9Em/yg+nm1bflayKUOkVxXPktiHjaVPnF3UlEr
         lofy4D1J8JpF5kE7aRrnTiQKaS4hbG6X2lLgwec77KzsVjKVzUd4cWcbsMmIKhq6/PwL
         JQZshz6P1YXNQAmCj5qxEyVh819ENFpdJDKIy06ZIWnbMa2144YvUPCTkeGLLTmcQ5Gs
         r64A==
X-Forwarded-Encrypted: i=1; AJvYcCVEGZLqZxfCYZ4BLibYl3VgETH+XXZVD+SAuoAPhUwSqtOmcr9L/XC3/2tLvx8/tnefrWNspYow9cgnvAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbzAaC8gBbZPmu6UL5eGCFQm+pm/U84Gp/Gtab6jPd/O9jLGRq
	B6efjwGDP2EmPk6cDYbADqIzRb/k7EbWwKXZS3tiRUxKBFt6aedFAiidcEDHpKb02Rmdbz9q48b
	UT/RP5RjdkIatbtVu7tA/jksgozjeuyor/I1aT6qbZsJ8CmGw4R7xms89Pe+h8w==
X-Gm-Gg: ASbGncvjjkW7IcOTZEL7uA8ej46dYwKthv5CK/Xl8u7BEObnacK93/WOS46MxaIcvRA
	Gxy1bXtEwfMXLHWQAWmw2Xs2t5pUouBuz9rxpc/UBEM2QseEYz88Mxc39dpJISPyqFuDNA4ukKC
	cZuxgkU73jp1Jb+A39QM7cIRvzjWHuBy/6Hk9I6mg3ELahp+8JYZ/WvjRPJpbL+g0KKPMHbLLVU
	NhQw3xj0NEC/mZ+xvOqdxYYrFeEnYcj5CgKfdLa0RDfcrH+rI2AjytqmgN91F5xiXC4a03BA4gw
	t6yeC9+Fpp2/olFcMkhTLQ5/BLg0xPNJgXcTzSsYJ052Um3puNprJw4=
X-Received: by 2002:a05:6214:3211:b0:6ea:ee53:5751 with SMTP id 6a1803df08f44-6f2c27d0d1cmr26705036d6.21.1744929222089;
        Thu, 17 Apr 2025 15:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2X8RM8WNcfj1JuzIKkInd7jY3kT/mXsTfOYbF5XSkRoRiDdP3awWZ2DMEc1SpzdRf9SEd5w==
X-Received: by 2002:a05:6214:3211:b0:6ea:ee53:5751 with SMTP id 6a1803df08f44-6f2c27d0d1cmr26704806d6.21.1744929221787;
        Thu, 17 Apr 2025 15:33:41 -0700 (PDT)
Received: from localhost (pool-100-17-21-114.bstnma.fios.verizon.net. [100.17.21.114])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c3b8a0sm3853436d6.123.2025.04.17.15.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:33:41 -0700 (PDT)
Date: Thu, 17 Apr 2025 18:33:40 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Ian Kent <raven@themaw.net>, Mark Brown <broonie@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ian Kent <ikent@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Alexander Larsson <alexl@redhat.com>, Lucas Karpinski <lkarpins@redhat.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4] fs/namespace: defer RCU sync for MNT_DETACH umount
Message-ID: <3wy3sqvmun6ohamngwuxcquantwmk4ytcflm4jojbck4zjps45@jwsujs62sz2w>
References: <20250408210350.749901-12-echanude@redhat.com>
 <fbbafa84-f86c-4ea4-8f41-e5ebb51173ed@sirena.org.uk>
 <20250417-wolfsrudel-zubewegt-10514f07d837@brauner>
 <fb566638-a739-41dc-bafc-aa8c74496fa4@themaw.net>
 <20250417-abartig-abfuhr-40e558b85f97@brauner>
 <20250417-outen-dreihundert-7a772f78f685@brauner>
 <20250417-zappeln-angesagt-f172a71839d3@brauner>
 <20250417153126.QrVXSjt-@linutronix.de>
 <20250417-pyrotechnik-neigung-f4a727a5c76b@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-pyrotechnik-neigung-f4a727a5c76b@brauner>

On Thu, Apr 17, 2025 at 06:28:20PM +0200, Christian Brauner wrote:
> On Thu, Apr 17, 2025 at 05:31:26PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2025-04-17 17:28:20 [+0200], Christian Brauner wrote:
> > > > (1) The real issue is with the same process P1 doing stupid stuff that
> > > >     just happened to work. For example if there's code out there that
> > > >     does a MNT_DETACH on a filesystem that uses a loop device
> > > >     immediately followed by the desire to reuse the loop device:
> > > > 
> > > >     It doesn't matter whether such code must in theory already be
> > > >     prepared to handle the case of seeing EBUSY after the MNT_DETACH. If
> > > >     this currently just happens to work because we guarantee that the
> > > >     last mntput() and cleanup_mnt() will have been done when the caller
> > > >     returns to userspace it's a uapi break plain and simple.
> > > > 
> > > >     This implicit guarantee isn't there anymore after your patch because
> > > >     the final mntput() from is done from the system_unbound_wq which has
> > > >     the consequence that the cleanup_mnt() is done from the
> > > >     delayed_mntput_work workqeueue. And that leads to problem number
> > > >     (2).

The following script runs fine on mainline, but consistently fails with
the version of this patch after discussions upstream:
  #! /usr/bin/bash -eux

  mntpath="/mnt"
  umount -R "$mntpath" || true

  fspath="/root/fs.ext4"
  dd if=/dev/zero of="$fspath" bs=1M count=500
  mkfs.ext4 "$fspath"

  loopdev="$(losetup -f "$fspath" --show)"

  for i in $(seq 0 99); do
      mkfs.ext4 -Fq "$fspath"
      mount "$loopdev" "$mntpath"
      touch "$mntpath/f1"
      umount -l "$mntpath"
  done
  losetup -d "$loopdev"

Failure looks like:
+ for i in $(seq 0 99)
+ mkfs.ext4 -Fq /root/fs.ext4
/root/fs.ext4 contains a ext4 file system
    created on Thu Apr 17 20:42:04 2025
+ mount /dev/loop0 /mnt
+ touch /mnt/f1
+ umount -l /mnt
+ for i in $(seq 0 99)
+ mkfs.ext4 -Fq /root/fs.ext4
/root/fs.ext4 contains a ext4 file system
    created on Thu Apr 17 20:42:04 2025
+ mount /dev/loop0 /mnt
mount: /mnt: mount(2) system call failed: Structure needs cleaning.

[    9.352478] EXT4-fs (loop0): mounted filesystem 3c5c632e-24d1-4027-b378-f51e67972883 r/w with ordered data mode. Quota mode: none.
[    9.449121] EXT4-fs (loop0): unmounting filesystem 3c5c632e-24d1-4027-b378-f51e67972883.
[    9.462093] EXT4-fs (loop0): ext4_check_descriptors: Checksum for group 32 failed (10605!=64170)
[    9.462099] EXT4-fs (loop0): group descriptors corrupted!

Seems worse than EBUSY :(.

> However, what about using polled grace periods?
> 
> A first simple-minded thing to do would be to record the grace period
> after umount_tree() has finished and the check it in namespace_unlock():
> 
> diff --git a/fs/namespace.c b/fs/namespace.c
> index d9ca80dcc544..1e7ebcdd1ebc 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -77,6 +77,7 @@ static struct hlist_head *mount_hashtable __ro_after_init;
>  static struct hlist_head *mountpoint_hashtable __ro_after_init;
>  static struct kmem_cache *mnt_cache __ro_after_init;
>  static DECLARE_RWSEM(namespace_sem);
> +static unsigned long rcu_unmount_seq; /* protected by namespace_sem */
>  static HLIST_HEAD(unmounted);  /* protected by namespace_sem */
>  static LIST_HEAD(ex_mountpoints); /* protected by namespace_sem */
>  static DEFINE_SEQLOCK(mnt_ns_tree_lock);
> @@ -1794,6 +1795,7 @@ static void namespace_unlock(void)
>         struct hlist_head head;
>         struct hlist_node *p;
>         struct mount *m;
> +       unsigned long unmount_seq = rcu_unmount_seq;
>         LIST_HEAD(list);
> 
>         hlist_move_list(&unmounted, &head);
> @@ -1817,7 +1819,7 @@ static void namespace_unlock(void)
>         if (likely(hlist_empty(&head)))
>                 return;
> 
> -       synchronize_rcu_expedited();
> +       cond_synchronize_rcu_expedited(unmount_seq);
> 
>         hlist_for_each_entry_safe(m, p, &head, mnt_umount) {
>                 hlist_del(&m->mnt_umount);
> @@ -1939,6 +1941,8 @@ static void umount_tree(struct mount *mnt, enum umount_tree_flags how)
>                  */
>                 mnt_notify_add(p);
>         }
> +
> +       rcu_unmount_seq = get_state_synchronize_rcu();
>  }
> 
>  static void shrink_submounts(struct mount *mnt);
> 
> 
> I'm not sure how much that would buy us. If it doesn't then it should be
> possible to play with the following possibly strange idea:

Did not improve the lazy unmount, no corruption running the script.
QEMU x86_64, 8cpus, PREEMP_RT:
# perf stat -r 10 --null --pre 'mount -t tmpfs tmpfs /mnt' -- umount /mnt
          0.019498 +- 0.000944 seconds time elapsed  ( +-  4.84% )
# perf stat -r 10 --null --pre 'mount -t tmpfs tmpfs /mnt' -- umount -l /mnt
          0.020635 +- 0.000959 seconds time elapsed  ( +-  4.65% )

> diff --git a/fs/mount.h b/fs/mount.h
> index 7aecf2a60472..51b86300dc50 100644
> --- a/fs/mount.h
> +++ b/fs/mount.h
> @@ -61,6 +61,7 @@ struct mount {
>                 struct rb_node mnt_node; /* node in the ns->mounts rbtree */
>                 struct rcu_head mnt_rcu;
>                 struct llist_node mnt_llist;
> +               unsigned long mnt_rcu_unmount_seq;
>         };
>  #ifdef CONFIG_SMP
>         struct mnt_pcp __percpu *mnt_pcp;
> diff --git a/fs/namespace.c b/fs/namespace.c
> index d9ca80dcc544..aae9df75beed 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -1794,6 +1794,7 @@ static void namespace_unlock(void)
>         struct hlist_head head;
>         struct hlist_node *p;
>         struct mount *m;
> +       bool needs_synchronize_rcu = false;
>         LIST_HEAD(list);
> 
>         hlist_move_list(&unmounted, &head);
> @@ -1817,7 +1818,16 @@ static void namespace_unlock(void)
>         if (likely(hlist_empty(&head)))
>                 return;
> 
> -       synchronize_rcu_expedited();
> +       hlist_for_each_entry_safe(m, p, &head, mnt_umount) {
> +               if (!poll_state_synchronize_rcu(m->mnt_rcu_unmount_seq))
> +                       continue;
> +
> +               needs_synchronize_rcu = true;
> +               break;
> +       }
> +
> +       if (needs_synchronize_rcu)
> +               synchronize_rcu_expedited();
> 
>         hlist_for_each_entry_safe(m, p, &head, mnt_umount) {
>                 hlist_del(&m->mnt_umount);
> @@ -1923,8 +1933,10 @@ static void umount_tree(struct mount *mnt, enum umount_tree_flags how)
>                         }
>                 }
>                 change_mnt_propagation(p, MS_PRIVATE);
> -               if (disconnect)
> +               if (disconnect) {
> +                       p->mnt_rcu_unmount_seq = get_state_synchronize_rcu();
>                         hlist_add_head(&p->mnt_umount, &unmounted);
> +               }
> 
>                 /*
>                  * At this point p->mnt_ns is NULL, notification will be queued
> 
> This would allow to elide synchronize rcu calls if they elapsed in the
> meantime since we moved that mount to the unmounted list.

Faster umount, lazy or not, no corruption running the script.
QEMU x86_64, 8cpus, PREEMP_RT:
# perf stat -r 10 --null --pre 'mount -t tmpfs tmpfs mnt' -- umount  /mnt
          0.001482 +- 0.000121 seconds time elapsed  ( +-  8.17% )
# perf stat -r 10 --null --pre 'mount -t tmpfs tmpfs mnt' -- umount -l /mnt
          0.002248 +- 0.000845 seconds time elapsed  ( +- 37.58% )

The crun test from v1 without your patch:
# perf stat -r 10 --null -- crun run test
           0.08166 +- 0.00476 seconds time elapsed  ( +-  5.83% )
The crun test from v1 with your patch:
# perf stat -r 10 --null -- crun run test
           0.01449 +- 0.00457 seconds time elapsed  ( +- 31.55% )

I have not run the LTP fs tests with that last patch yet, but that looks
like quite an improvement.

Best,

-- 
Eric Chanudet

