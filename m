Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B902BB13
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351630; cv=none; b=HKPdBmgjuk5kQFyArHVMvtTT7ySJoLpyTBlGc2KXySlaI6bbOS/FynX74sAQ++tSHnVcHKmsbYJ4JbxmPL3ELYPOfIF+ZYFSrWQlddgh4M4tk0EUTFYr2Vcw4GvUJI9lZez87Zc3ogkXvsuT2VPr8VWGQJBwGqOGDp6M4lWbZpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351630; c=relaxed/simple;
	bh=mgUI3KZhX/GLZrZ+n9B0MRmr/QJm+2Au8qoCGXjlnpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9zluCVoTqieZv2qq+nkxq79Sx5z++X/LVFuEjcCNRfmJNOU0iCL+tk5THO31lJRxYR5i0Od1EG+aja2NaTFdve7yAjXpQ4lXega/68X9dW+m44sT2rCHn0BPMZARA11SZsmXSbZtiuQO6EGRyLf0Ig9X/iiVj0SbVjqgqSdaXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fo26tHnM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fo26tHnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745351627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=guuXjMeQDHoW1XS3M894x+TmtOB1toyTlu9Qd/Rij4M=;
	b=fo26tHnMkwrfwr/Is5VUI7fMBPpA3GM7V6pRTnbTAfiltt4WvWKHV3qVr9Dd1h3vHXC1Nm
	T/c/66J/sUXR/RWYhBfltUElOhdHWbvxAtYm4YtehRpdMb53tjto8i3mvfUCVIOR6FmMsG
	e7W/w77T105svIkuZE2Z/pIsG0G3Rxc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-vF_hbSFgP5-ElLwwa6j6gA-1; Tue, 22 Apr 2025 15:53:46 -0400
X-MC-Unique: vF_hbSFgP5-ElLwwa6j6gA-1
X-Mimecast-MFC-AGG-ID: vF_hbSFgP5-ElLwwa6j6gA_1745351626
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so850124885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351625; x=1745956425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guuXjMeQDHoW1XS3M894x+TmtOB1toyTlu9Qd/Rij4M=;
        b=A2s8N1hl693/0b2BofMVtCDvDq/TFwFyQc4ImBi8LsfRrwRUaQ8dJs/XaWbljBW0B0
         lqgTXo2D2w9gZrpwtjJhVl1QGyaPSRRHMbZQ5FQkdEsCjAjSdZbVT99f2ZIxCBSwryKf
         FHVoxLMv/uApeTzCe7p+HD3Cc15JIZeYzc2Y1hTPD5wz9gZWWWaGJndBodjKP4GztZ1v
         NcRI0CQ7ur3Z26bNF28z953TNFVzRRKoZ75QVU2YjB+mSXOhLNpnWlEPZZ1dPQScRjRJ
         ie5KbUuwycyXoEJVPxZAJ3ajhcE5y5nK/tCu8m11/8eUWVZeIwPEB9YrkVErllne+Y4U
         t1HA==
X-Forwarded-Encrypted: i=1; AJvYcCVgW+MyArU0ZKeVtavze9C+4I+1l4FkfEjMerhCwwqhqqtsS5vSFFTKiZQJf6ykKrlihNq2gPGsF5Hxri4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJdASbCb6ZQwRDCrS52NneEi0IvM1UDzJFnV0V4IMRYNUouRWO
	Th2dLwwLMENSZirS30J+uKMlNk/YI+mA6YobyaMz8S/7nZUu+0jNa3PAw0AtT7HC4zC8rxho4G8
	bTG/CFGhQFOF8b6mAbiAvI69PoT39rv2ljV9CQqYxe2vEYC6q/KE6u/5yqXHgVbY8F2ma/Q==
X-Gm-Gg: ASbGncvOoO98TqROZPYetv4Y+eAnD5/BFkOxHlpn0mNP/Q4YLV9ZOldvOqrG9wJOrqd
	vXg4fIR0aiaW8WMeG60PGem8F5oy7z8o+LYXs1OXmTBg+FqTm+eWcUP7wGlnZd0J7UwYwX2EweO
	xZRUbM9RxAQZPlzg7k2zoOv0OR8Pw7fLVTc69iYdEvZFj4yWOGSk9EvLHqvgqvKTO2DrZJlg3g+
	W6M1B/IRQG90Dl/frb+zw6V05dq3B6v+DUNCDZ8bNLFjFRqKsDsuINQRGlU0aVPJ6bkqW32Dnuz
	wQLzUgpcN6JRoAqSy/6CiHlFTI5Xos3zL+RjJzvj+TO+Rl1cPD/Tiwc=
X-Received: by 2002:a05:620a:318f:b0:7c7:5a9f:7a90 with SMTP id af79cd13be357-7c927f6b66emr2706873385a.4.1745351625197;
        Tue, 22 Apr 2025 12:53:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX0sH43iwr9p6/LRXrPyohHGTeLO7bLREMgSdAMcE23hvDtCxv531dfovueZkEjPMtL6eeHw==
X-Received: by 2002:a05:620a:318f:b0:7c7:5a9f:7a90 with SMTP id af79cd13be357-7c927f6b66emr2706869685a.4.1745351624778;
        Tue, 22 Apr 2025 12:53:44 -0700 (PDT)
Received: from localhost (pool-100-17-21-114.bstnma.fios.verizon.net. [100.17.21.114])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8d2e0sm591969685a.36.2025.04.22.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:53:44 -0700 (PDT)
Date: Tue, 22 Apr 2025 15:53:43 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ian Kent <ikent@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Alexander Larsson <alexl@redhat.com>, Lucas Karpinski <lkarpins@redhat.com>
Subject: Re: [PATCH v4] fs/namespace: defer RCU sync for MNT_DETACH umount
Message-ID: <fzqxqmlhild55m7lfrcdjikkuapi3hzulyt66d6xqdfhz3gjft@cimjdcqdc62n>
References: <20250408210350.749901-12-echanude@redhat.com>
 <20250420055406.GS2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420055406.GS2023217@ZenIV>

On Sun, Apr 20, 2025 at 06:54:06AM +0100, Al Viro wrote:
> On Tue, Apr 08, 2025 at 04:58:34PM -0400, Eric Chanudet wrote:
> > Defer releasing the detached file-system when calling namespace_unlock()
> > during a lazy umount to return faster.
> > 
> > When requesting MNT_DETACH, the caller does not expect the file-system
> > to be shut down upon returning from the syscall.
> 
> Not quite.  Sure, there might be another process pinning a filesystem;
> in that case umount -l simply removes it from mount tree, drops the
> reference and goes away.  However, we need to worry about the following
> case:
> 	umount -l has succeeded
> 	<several minutes later>
> 	shutdown -r now
> 	<apparently clean shutdown, with all processes killed just fine>
> 	<reboot>
> 	WTF do we have a bunch of dirty local filesystems?  Where has the data gone?
> 
> Think what happens if you have e.g. a subtree with several local filesystems
> mounted in it, along with an NFS on a slow server.  Or a filesystem with
> shitloads of dirty data in cache, for that matter.
> 
> Your async helper is busy in the middle of shutting a filesystem down, with
> several more still in the list of mounts to drop.  With no indication for anyone
> and anything that something's going on.
> 

I'm not quite following. With umount -l, I thought there is no guaranty
that the file-system is shutdown. Doesn't "shutdown -r now" already
risks loses without any of these changes today? Or am I missing your
point entirely? It looks like the described use-case in umount(8)
manpage.

> umount -l MAY leave filesystem still active; you can't e.g. do it and pull
> a USB stick out as soon as it finishes, etc.  After all, somebody might've
> opened a file on it just as you called umount(2); that's expected behaviour.
> It's not fully async, though - having unobservable fs shutdown going on
> with no way to tell that it's not over yet is not a good thing.
> 
> Cost of synchronize_rcu_expedited() is an issue, all right, and it does
> feel like an excessively blunt tool, but that's a separate story.  Your
> test does not measure that, though - you have fs shutdown mixed with
> the cost of synchronize_rcu_expedited(), with no way to tell how much
> does each of those cost.
> 
> Could you do mount -t tmpfs tmpfs mnt; sleep 60 > mnt/foo &
> followed by umount -l mnt to see where the costs are?

I was under the impression the tests provided did not account for the
file-system shutdown, or that it was negligible.

The following, on mainline PREEMPT_RT, without any patch mentioned
before?

 # mount -t tmpfs tmpfs mnt; sleep 60 > mnt/foo &
     perf ftrace -G path_umount --graph-opts="depth=4" umount -l /mnt/
[Eliding most calls <100us]
 0)               |  path_umount() {
 [...]
 0)               |    namespace_unlock() {
 [...]
 0)               |      synchronize_rcu_expedited() {
 0)   0.108 us    |        rcu_gp_is_normal();
 0)               |        synchronize_rcu_normal() {
 0) * 15820.29 us |        }
 0) * 15829.52 us |      }
 [...]
 0) * 15852.90 us |    }
 [...]
 0) * 15918.07 us |  }

Thanks,

-- 
Eric Chanudet

