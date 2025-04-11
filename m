Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287E81F3BAD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380416; cv=none; b=uh9dwTjmFJV9sM0iVHrkRvf5QCD5Rfb+VdWPeCiia0F6vOJUCOpJomX2abKxMp+LsGawd1l0jNx5DDAPQRCQLny6USucPEyltA1UpdlmSXS+c8xrQbx8YyBi1JZbdhtg3GYyqi9Vo4EDCJ9dOHrl48jXQDT0td8q3YDD7lHvcS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380416; c=relaxed/simple;
	bh=FhZFvEkcpPO1RMBJeoPoPJ0a36fDZlWJwz+/53Jzw8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dbi0WWRgINVlorERfLvcPAHQOTg5nTMBucGnSKZpTmGj+THjqT5WlMgdTnXelE5Zohcx62u8XljCVcwB01EOl9TI7/N78C7FN4hlveDwj/V3LAsUk/BgedsIxbs8JpvwiwtM7quN7cjlbycyZt6xr3ki6TpwKsW25gx7TGHtdyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HjTfNss+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HjTfNss+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744380412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iWl/qqJnW4YKy7fD9Y1Bq2qyKwnzAfjOsHSpc/KwuOE=;
	b=HjTfNss+xyMtFh14FE+m7HBT1xMnJycIgEVp0l5a3kZP9KoEUm2wnCKffUt7L5/LaK1uWw
	y7aTnwTXRFquGCToP4qwiAFDJC1FW+VNnlCxaGaUIi85kMTkjzR5uxJyAFwLI5UYrO9b3t
	HDloSYDfGCeBQpvqBojf98Rhcl4UK6c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-411-Ov1DihxHMLSVa6UZohL51w-1; Fri,
 11 Apr 2025 10:06:46 -0400
X-MC-Unique: Ov1DihxHMLSVa6UZohL51w-1
X-Mimecast-MFC-AGG-ID: Ov1DihxHMLSVa6UZohL51w_1744380404
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D80F3195608D;
	Fri, 11 Apr 2025 14:06:43 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.222])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C4DCA180175D;
	Fri, 11 Apr 2025 14:06:38 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Apr 2025 16:06:08 +0200 (CEST)
Date: Fri, 11 Apr 2025 16:06:02 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	wsd_upstream@mediatek.com, bobule.chang@mediatek.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chenqiwu <chenqiwu@xiaomi.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Breno Leitao <leitao@debian.org>, Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [RFC PATCH] exit: Skip panic in do_exit() during poweroff
Message-ID: <20250411140601.GG5322@redhat.com>
References: <20250410143937.1829272-1-Tze-nan.Wu@mediatek.com>
 <20250410210507.GD15280@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410210507.GD15280@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add cc'es.

A similar problem was recently reported,
https://lore.kernel.org/all/20250403-exit-v1-1-8e9266bfc4b7@debian.org/
and I didn't realize this is another thread.

On 04/10, Oleg Nesterov wrote:
>
> Well...
>
> Let me repeat. I don't understand the kernel/reboot.c paths, you can
> safely ignore me.
>
> But I still think that you target the wrong goal. Quite possibly I am
> wrong.
>
> On 04/10, Tze-nan Wu wrote:
> >
> > If PID 1 exits due to the unreliable userspace after kernel_power_off()
> > invoked,
>
> Why. Why the global init does do_exit()? It should not, that is all.
> It doesn't matter if it is single threaded or not.
>
> As for sys_reboot(), I think that kernel_power_off() must be __noreturn,
> and sys_reboot() should use BUG() after LINUX_REBOOT_CMD_POWER_OFF/_HALT
> instead of do_exit().
>
> If nothing else. do_exit() also does debug_check_no_locks_held() and
> sys_reboot() calls do_exit() with system_transition_mutex held.
>
> IOW. IMO, it is not that do_exit() needs some changes. The very fact
> that the global init does do_exit() is wrong, this should be fixed.
>
> But again, again, I can't really comment.
>
> Oleg.
>
> > the panic follow by the last thread of global init exited in
> > do_exit() will stop the kernel_power_off() procedure, turn a shutdown
> > behavior into panic flow(reboot).
> >
> > Add a condition check to ensure that the panic triggered by the last
> > thread of the global init exiting, only occurs while:
> > ( system_state != SYSTEM_POWER_OFF and system_state != SYSTEM_RESTART).
> > Otherwise, WARN() instead.
> >
> > [On Android 16 with arm64 arch]
> > Here's a scenario where the global init exits during kernel_power_off:
> > If PID 1 encounters a page fault after kernel_power_off() has been
> > invoked, the kernel will fail to handle the page fault because the
> > disk(UFS) has already shut down.
> > Consequently, the kernel will send a SIGBUS to PID 1 to indicate the
> > page fault failure, and ultimately, the panic will occur after PID 1
> > exits due to receiving the SIGBUS.
> >
> >             cpu1                           cpu2
> >           ----------                     ----------
> >     kernel_power_off() start
> >         UFS shutdown
> >             ...                	       PID 1 page fault
> >             ...                    page fault handle failure
> >             ...			             PID 1 received SIGBUS
> >             ...                             panic
> >    kernel_power_off() not done
> >
> > Backtrace while PID 1 received signal 7:
> >    init-1 [007] d..1 41239.922385: \
> >       signal_generate: sig=7 errno=0 code=2 comm=init pid=1 grp=0 res=0
> >    init-1 [007] d..1 41239.922389: kernel_stack: <stack trace>
> >    => __send_signal_locked
> >    => send_signal_locked
> >    => force_sig_info_to_task
> >    => force_sig_fault
> >    => arm64_force_sig_fault
> >    => do_page_fault
> >    => do_translation_fault
> >    => do_mem_abort
> >    => el0_ia
> >    => el0t_64_sync_handler
> >
> > Simplified kernel log:
> > kernel_power_off() invoked by pt_notify_thread.
> > [41239.526109] pt_notify_threa: reboot set flag, old value 0x********,
> > *.
> > [41239.526114] pt_notify_threa: reboot set flag new value 0x********.
> > UFS reject I/O after kerenl_power_off.
> > [41239.686411]  scsi +scsi******** apexd: sd* ******** rejecting I/O to
> > offline device.
> > Lots of I/O error & erofs error happened after kernel_power_off().
> > [41239.690312] apexd: I/O error, dev sdc, sector ******* op ***:(READ)
> > flags 0x**** phys_seg ** prio class 0.
> > [41239.690465] apexd: I/O error, dev sdc, sector ******* op ***:(READ)
> > flags 0x**** phys_seg ** prio class 0.
> > ...
> > ...
> > [41239.922265] init: erofs: (device ****): z_erofs_read_folio: read
> > error * @ *** of nid ********.
> > [41239.922341] init: erofs: (device ****): z_erofs_read_folio: read
> > error * @ *** of nid ********.
> > Finally device panic due to PID 1 received SIGBUS.
> > [41239.923789] init: Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x00000007
> >
> > Fixes: 43cf75d96409 ("exit: panic before exit_mm() on global init exit")
> > Link: https://lore.kernel.org/all/20191219104223.xvk6ppfogoxrgmw6@wittgenstein/
> > Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
> > ---
> >
> > I am also wondering if this patch is reasonable?
> >
> > From my perspective, there are two reasons not to trigger such panic
> > during kernel_power_off() or kernel_restart():
> >   1. It is not worthwhile to interrupt kernel_power_off() by a panic
> >      resulted from userspace instability.
> >   2. The panic in do_exit() was originally designed to ensure a usable
> >      coredump if the last thread of the global init process exited.
> > 	 However, capture a coredump triggered by userspace crash after
> >      kernel_power_off() seems not particularly useful, in my opinion.
> >
> > In certain scenarios, a kernel module may need to directly power off
> > from kernel space to protect hardware (e.g., thermal protection).
> > In my opinion, rather than causing a panic during kernel_power_off(),
> > it sounds better to allow the device to complete its power-off process.
> >
> > Appreciate for any comment on this, if there's any better way to
> > handle this panic, please point me out.
> >
> > ---
> >  kernel/exit.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/kernel/exit.c b/kernel/exit.c
> > index 1dcddfe537ee..23cb6b42a1f1 100644
> > --- a/kernel/exit.c
> > +++ b/kernel/exit.c
> > @@ -901,11 +901,17 @@ void __noreturn do_exit(long code)
> >  	if (group_dead) {
> >  		/*
> >  		 * If the last thread of global init has exited, panic
> > -		 * immediately to get a useable coredump.
> > +		 * immediately to get a usable coredump, except when the
> > +		 * device is currently powering off or restarting.
> >  		 */
> > -		if (unlikely(is_global_init(tsk)))
> > -			panic("Attempted to kill init! exitcode=0x%08x\n",
> > -				tsk->signal->group_exit_code ?: (int)code);
> > +		if (unlikely(is_global_init(tsk))) {
> > +			if (system_state != SYSTEM_POWER_OFF &&
> > +			    system_state != SYSTEM_RESTART)
> > +				panic("Attempted to kill init! exitcode=0x%08x\n",
> > +				      tsk->signal->group_exit_code ?: (int)code);
> > +			WARN(1, "Attempted to kill init! exitcode=0x%08x\n",
> > +			     tsk->signal->group_exit_code ?: (int)code);
> > +		}
> >
> >  #ifdef CONFIG_POSIX_TIMERS
> >  		hrtimer_cancel(&tsk->signal->real_timer);
> > --
> > 2.45.2
> >

