Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A6F2BCF6F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843849; cv=none; b=juiRokvLijJHWhIgJ21qNgrGgsX4azyvwVYbj+PrMdSZ04DKdWn9WMzJm0rz7KIJo+PViHW2LMeGQP50qO03XqOccYu9Csupg1paD3+/ZyBKil6UXGjSWIgPYCFp/0jYh0tCpyiCL0bNNlZ/h4gGGRtQNxAdvrC59hia8wYb++E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843849; c=relaxed/simple;
	bh=2+XGf6Cxg5hloENHaEITubqoML7eO7xcLk2uJUmau/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgkuUXEri1VYLzGHEjmnQV1eS2qIxu72ZxEfgcVj8XZ9aypDHYe/8rZskhLi0N17CdEEQVtuF4JpGNPpCf+D0+yaX2mkIgXDls7cobCfVgxn0JQbSq/6bB7q/UaR1sCnMIeZHhzDXQktn5yYJ5GVRLo4RfAiK+RbzMrhcaGr9rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GgJbkoqe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GgJbkoqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750843845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pNEA9Uf9QGjXVJjXtmrD9ZcaLCodYTOhtloI9aDa9JY=;
	b=GgJbkoqersZ0BGyCGcOISe1RU4NeBMY4zP7hGcNIGEd10lFhBUTjNMmjmA8fiG2DB5RnTN
	HkOj5Uab2F0uK2C3vYlJElxmX3P8ht7ytbaLHHH6xAYL8DugrE35BQYbCOqrD7aDmotzNU
	OmffQpqVwamLrGU9KtOMxiyRjqgd8Xw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-RaRwfDzFMG254vjkCzY1rg-1; Wed, 25 Jun 2025 05:30:44 -0400
X-MC-Unique: RaRwfDzFMG254vjkCzY1rg-1
X-Mimecast-MFC-AGG-ID: RaRwfDzFMG254vjkCzY1rg_1750843843
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso714798f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843842; x=1751448642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNEA9Uf9QGjXVJjXtmrD9ZcaLCodYTOhtloI9aDa9JY=;
        b=t2JECbKEMUzhIvNKOlY6xKeRRiqE2MTcDTVeiGfWsX0OA0va4m7mmjKmngI6Cj54/l
         HoE81Vo1F7E+0AbyVOUzfKrQ1ojjdWCI+CSLv6EiLMR3YD6meif4AvBlAhFNblLhRarj
         HsopvtwopNhj7HBV/45q/gLqebAz6Y/nh5XIECjlOgOYJbb5LOH9Me5VNi7VK66Bxh1U
         kraDJsMpdjG8McHRqKLDQWvgHgm+HgY1DjzjSO0gebOhocp8QYWQSxTVGHhVRph2WCpY
         K+7xwK4qp+JWfsa7+MX03Kba/3ZAxli7feV5o/9lIEW9AKyYrxZoxCuCH20YgMNpuFYv
         sneg==
X-Forwarded-Encrypted: i=1; AJvYcCXWcPZ6KwJXSaloyLwyhC1ZeCuF61VY5FA36gH2skorWog6idE2pYlqLfpqp3G4lHcT45f83u582bNveDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4BexB1m/fRGxL/eO5GP+710xw/egj8g7qSnBq64LcV2/NOBOY
	f2QpwVbDFH1obgQVFBLKHUnsiClPlg0ij/m2Q9At9m4EKvOJLTLv2UeTJjLWsv2iU3R0V0LQ8M9
	nq4SLSuhFpDKCODBBK6BT+JrYt3aNXYWOYZZTFapIemZkK6YJnKWg43owjP/wPItg6w7HmFu52w
	==
X-Gm-Gg: ASbGncu5iBLXtWgSTp9OsauAXRvAyfQh0XJ7GwE62PvMusIHTc+Zco01lFYt8ohmE2R
	8dF4Ge4N5HDOBe2DBJq4BNWw4boXZODcw5FtSBs+dQF+pIs4pHY5fDtcbDNVxaZ6TnOQ028oOrX
	PYe8sh2IPpLKRuhsa3rfEui935I/6iEJ0KgCSqZxN/I28vMoxv67rj9dedGi4g94wJopjrmQ9tK
	4iB7AvWJP52xJsiB+P/5r8jbqHghRUMTNYS9lG7SQDCXRXW4HvJDiaFBilBh6876h3ej95RLXYH
	Bjg4tAlwwN+or50H59nUQ7/9BkaDL01n4SRz+tJrv9hoS5N+1N+z
X-Received: by 2002:a05:6000:200d:b0:3a6:d95c:5e8 with SMTP id ffacd0b85a97d-3a6ed66464dmr1938479f8f.35.1750843842203;
        Wed, 25 Jun 2025 02:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb2cqxRWxMVzZD3wSQn9CNVw1AhQjPa2VCyVYesNbvBZAkRI9QxiVEfR++/A8EoJO8r+AaCg==
X-Received: by 2002:a05:6000:200d:b0:3a6:d95c:5e8 with SMTP id ffacd0b85a97d-3a6ed66464dmr1938447f8f.35.1750843841738;
        Wed, 25 Jun 2025 02:30:41 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.11.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80fed75sm4179026f8f.66.2025.06.25.02.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:30:40 -0700 (PDT)
Date: Wed, 25 Jun 2025 11:30:39 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aFvBvxhw6ubpBefm@jlelli-thinkpadt14gen4.remote.csb>
References: <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
 <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
 <aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
 <20250620113745.6833bccb@luca64>
 <20250620161606.2ff81fb1@nowhere>
 <aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
 <20250620185248.634101cc@nowhere>
 <aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>
 <aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
 <20250624170030.4e5b440a@nowhere>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624170030.4e5b440a@nowhere>

On 24/06/25 17:00, luca abeni wrote:
> On Tue, 24 Jun 2025 14:59:13 +0200
> Juri Lelli <juri.lelli@redhat.com> wrote:
> 
> > Hello again,
> > 
> > On 24/06/25 09:49, Juri Lelli wrote:
> > 
> > ...
> > 
> > > The following seem to at least cure the problem after boot. Things
> > > are still broken after cpusets creation. Moving to look into that,
> > > but wanted to share where I am so that we don't duplicate work.  
> > 
> > I ended up with two additional patches that seem to make things a
> > little better at my end. You can find them at
> > 
> > https://github.com/jlelli/linux/tree/upstream/fix-grub
> > 
> > Marcel, Luca, can you please give them a quick try to check if they do
> > any good?
> 
> I applied your 3 patches to the master branch of linux.git, and they
> indeed seems to fix the issue!
> 
> Now, I need to understand how they relate to
> 5f6bd380c7bdbe10f7b4e8ddcceed60ce0714c6d :)
> 
> One small issue: after applying your patches, I get this WARN at boot
> time:
> [    0.384481] ------------[ cut here ]------------
> [    0.385384] WARNING: CPU: 0 PID: 1 at kernel/sched/deadline.c:265 task_non_contending+0x24d/0x3b0
> [    0.385384] Modules linked in:
> [    0.385384] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc2-00234-ge35a18896578 #42 PREEMPT(voluntary)
> [    0.385384] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [    0.385384] RIP: 0010:task_non_contending+0x24d/0x3b0
> [    0.385384] Code: 59 49 00 e9 7a fe ff ff 48 8b 53 30 f6 43 53 10 0f 85 4c ff ff ff 48 8b 85 c8 08 00 00 48 29 d0 48 89 85 c8 08 00 00 73 0f 90 <0f> 0b 90 48 c7 85 c8 08 00 00 00 00 00 00 48 63 95 28 0b 00 00 48
> [    0.385384] RSP: 0000:ffffb52300013c08 EFLAGS: 00010093
> [    0.385384] RAX: ffffffffffff3334 RBX: ffff979ffe8292b0 RCX: 0000000000000001
> [    0.385384] RDX: 000000000000cccc RSI: 0000000002faf080 RDI: ffff979ffe8292b0
> [    0.385384] RBP: ffff979ffe8289c0 R08: 0000000000000001 R09: 00000000000002a5
> [    0.385384] R10: 0000000000000000 R11: 0000000000000001 R12: ffffffffffe0ab69
> [    0.385384] R13: ffff979ffe828a40 R14: 0000000000000009 R15: ffff979ffe8289c0
> [    0.385384] FS:  0000000000000000(0000) GS:ffff97a05f709000(0000) knlGS:0000000000000000
> [    0.385384] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.385384] CR2: ffff979fdec01000 CR3: 000000001e030000 CR4: 00000000000006f0
> [    0.385384] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    0.385384] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    0.385384] Call Trace:
> [    0.385384]  <TASK>
> [    0.385384]  dl_server_stop+0x21/0x40
> [    0.385384]  dequeue_entities+0x604/0x900
> [    0.385384]  dequeue_task_fair+0x85/0x190
> [    0.385384]  ? update_rq_clock+0x6c/0x110
> [    0.385384]  __schedule+0x1f0/0xee0
> [    0.385384]  schedule+0x22/0xd0
> [    0.385384]  schedule_timeout+0xf4/0x100
> [    0.385384]  __wait_for_common+0x97/0x180
> [    0.385384]  ? __pfx_schedule_timeout+0x10/0x10
> [    0.385384]  ? __pfx_devtmpfsd+0x10/0x10
> [    0.385384]  wait_for_completion_killable+0x1f/0x40
> [    0.385384]  __kthread_create_on_node+0xe7/0x150
> [    0.385384]  kthread_create_on_node+0x4f/0x70
> [    0.385384]  ? register_filesystem+0x97/0xc0
> [    0.385384]  devtmpfs_init+0x115/0x200
> [    0.385384]  driver_init+0x15/0x50
> [    0.385384]  kernel_init_freeable+0xf4/0x2d0
> [    0.385384]  ? __pfx_kernel_init+0x10/0x10
> [    0.385384]  kernel_init+0x15/0x1c0
> [    0.385384]  ret_from_fork+0x80/0xd0
> [    0.385384]  ? __pfx_kernel_init+0x10/0x10
> [    0.385384]  ret_from_fork_asm+0x1a/0x30
> [    0.385384]  </TASK>
> [    0.385384] ---[ end trace 0000000000000000 ]---

I now see it as well, not sure how I missed it, maybe didn't pay enough
attention. :)

It looks like (at least at my end) it comes from

task_non_contending()
  sub_running_bw()
    __sub_running_bw()
      WARN_ON_ONCE(dl_rq->running_bw > old); /* underflow */

I would guess the later initialization of dl-server is not playing well
wrt running_bw. Will take a look.

BTW, I pushed an additional fixup commmit (forgot some needed locking
here and there, ops :).

