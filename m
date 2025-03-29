Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD7F70807
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 02:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743213737; cv=none; b=MpSKHYXJXtzlFAXn0N33FBCmaGHSHMmfRxjS7Cwm3g0cyhYiIAblnZt6aUDjAX0ErTg69TwGh2D3SeWH+z0UfGXYntUhbhVXexENz+kRgbzPcqHLD6zdv/muQLNql1OLd0KMcD4fVj/w7F3w4v8hFbFSnLsujxyRvFRhK/PC6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743213737; c=relaxed/simple;
	bh=v2c30sadIWipk3FysDyEmfuGcsK/HMbZQGVV1cylTiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0sJaECPrzT3qMSGjLj8KXTLRHXpRJ+EsKsNjiQJ5750SC3uwAS5duO3bByGrHQ29youKoVUSeJXZPAjwRiFQAYFcczYJE8FlGcm8T6wjMQZ6Tv+agOhd5HwQpruZNnKGwomDY7wlwV94oAEPFeV5GPrEXgNBRGCO9MXQ78rE0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TS67J8Jy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TS67J8Jy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743213734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lp5HZwu4GXqi05U5jcovZbfPajOCRt8G5Bk6kdpKgYc=;
	b=TS67J8JygRy/TDZ4c66gEGCdsZK1Qqp+ph3BehwWtS4yyALyx1wtnRNMRpok1TSyXccLcg
	CnGpuShgJqCeczZLutC8KxekbHhMmYm2+dNtl9f0JDPmp9c5fCxyokNUZq12VTKevducOp
	bCGFwchXgbPGkz8vNl0tzj1bKehQ0Qw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-36-EmtEcVvbOmO4OtRxKvBpaw-1; Fri,
 28 Mar 2025 22:02:11 -0400
X-MC-Unique: EmtEcVvbOmO4OtRxKvBpaw-1
X-Mimecast-MFC-AGG-ID: EmtEcVvbOmO4OtRxKvBpaw_1743213730
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0ECDC19560B0;
	Sat, 29 Mar 2025 02:02:10 +0000 (UTC)
Received: from fedora (unknown [10.72.120.4])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3879B195DF83;
	Sat, 29 Mar 2025 02:02:04 +0000 (UTC)
Date: Sat, 29 Mar 2025 10:01:59 +0800
From: Ming Lei <ming.lei@redhat.com>
To: syzbot <syzbot+4c7e0f9b94ad65811efb@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [block?] possible deadlock in elv_iosched_store
Message-ID: <Z-dUlymffoNwgHdb@fedora>
References: <67e6b425.050a0220.2f068f.007b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e6b425.050a0220.2f068f.007b.GAE@google.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Fri, Mar 28, 2025 at 07:37:25AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    1a9239bb4253 Merge tag 'net-next-6.15' of git://git.kernel..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1384b43f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c7163a109ac459a8
> dashboard link: https://syzkaller.appspot.com/bug?extid=4c7e0f9b94ad65811efb
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=178cfa4c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11a8ca4c580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/fc7dc9f0d9a7/disk-1a9239bb.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/f555a3ae03d3/vmlinux-1a9239bb.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/55f6ea74eaf2/bzImage-1a9239bb.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+4c7e0f9b94ad65811efb@syzkaller.appspotmail.com
> 

...

> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report

#syz dup: [syzbot] [block?] possible deadlock in elv_iosched_store

-- 
Ming

