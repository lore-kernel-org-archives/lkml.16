Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270517580
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256574; cv=none; b=ARrpTnOFwwhBh5s+Rd7GytbmZbiVtkaROhgR1EEONoYNGrdazraJ5SyRZGCBW1yxmqsNe1txcYKS48J085rdJfQSXwvdm82PIfEQeW+EWY7c0wYhmWWTs5HImpjUX+TsZhhiBr6ZCH5VHufNt9ToF1t3l/rup7T8w/u/ckyKpB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256574; c=relaxed/simple;
	bh=xYSZLRpXVyKiEX+YhLuLT0VdOOE448nvZgErlZAZU/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkhfuB3aIPWU94ImINJfgg93w3QK+zwYR0ocOiB4Nw6DIs2nJ6TfSJKPDs8g4V5AFsjGilizuKGIrN/eLY6yEw7fDdKuz4deYT3bIIZY2Kmaw40eMtxqgE4PbwBgcpPjtgYHyEuJuE+SyIYPJ5ZtlMlUt91pGPnvz6gbji10kt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OGpegcao; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OGpegcao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739256571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHQ4Oxg4BdZG0EqHeZ0mYCatOi4W3VJtAX19VjnUmVg=;
	b=OGpegcaop5ba4wtAdcdfZGmYETnNgK+C+Mu7tKm2F6YMHPNp2Ejz4kgrwn9DwSjpuBUcdu
	LYM868lUI9dSjniqzK14Rd/1Q56gEJFeQOZsDyooQPQ0wP/fAYckpWiGXIIvKKdHSmlrZB
	zMo+BNdEIVuups4fgDvAkrHBIcoRYjg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-6gu32TVqO6ykS18rt6NY7A-1; Tue,
 11 Feb 2025 01:49:26 -0500
X-MC-Unique: 6gu32TVqO6ykS18rt6NY7A-1
X-Mimecast-MFC-AGG-ID: 6gu32TVqO6ykS18rt6NY7A
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F832180087D;
	Tue, 11 Feb 2025 06:49:24 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 32B81180035E;
	Tue, 11 Feb 2025 06:49:22 +0000 (UTC)
Date: Tue, 11 Feb 2025 14:49:18 +0800
From: Baoquan He <bhe@redhat.com>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, rostedt@goodmis.org,
	amir73il@gmail.com, joel.granados@kernel.org,
	linux-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH] pid: Add a judgment for ns null in pid_nr_ns
Message-ID: <Z6ry7vfpNe5/mFnT@MiWiFi-R3L-srv>
References: <20250211061712.3234465-1-gxxa03070307@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211061712.3234465-1-gxxa03070307@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 02/11/25 at 02:17pm, Xiang Gao wrote:
> From: gaoxiang17 <gaoxiang17@xiaomi.com>
> 
> __task_pid_nr_ns
>         ns = task_active_pid_ns(current);
>         pid_nr_ns(rcu_dereference(*task_pid_ptr(task, type)), ns);
>                 if (pid && ns->level <= pid->level) {
> 
> Sometimes null is returned for task_active_pid_ns. Then it will trigger kernel panic in pid_nr_ns.
> 
> For example:
> 	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
> 	Mem abort info:
> 	ESR = 0x0000000096000007
> 	EC = 0x25: DABT (current EL), IL = 32 bits
> 	SET = 0, FnV = 0
> 	EA = 0, S1PTW = 0
> 	FSC = 0x07: level 3 translation fault
> 	Data abort info:
> 	ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> 	CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> 	GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> 	user pgtable: 4k pages, 39-bit VAs, pgdp=00000002175aa000
> 	[0000000000000058] pgd=08000002175ab003, p4d=08000002175ab003, pud=08000002175ab003, pmd=08000002175be003, pte=0000000000000000
> 	pstate: 834000c5 (Nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> 	pc : __task_pid_nr_ns+0x74/0xd0
> 	lr : __task_pid_nr_ns+0x24/0xd0
> 	sp : ffffffc08001bd10
> 	x29: ffffffc08001bd10 x28: ffffffd4422b2000 x27: 0000000000000001
> 	x26: ffffffd442821168 x25: ffffffd442821000 x24: 00000f89492eab31
> 	x23: 00000000000000c0 x22: ffffff806f5693c0 x21: ffffff806f5693c0
> 	x20: 0000000000000001 x19: 0000000000000000 x18: 0000000000000000
> 	x17: 00000000529c6ef0 x16: 00000000529c6ef0 x15: 00000000023a1adc
> 	x14: 0000000000000003 x13: 00000000007ef6d8 x12: 001167c391c78800
> 	x11: 00ffffffffffffff x10: 0000000000000000 x9 : 0000000000000001
> 	x8 : ffffff80816fa3c0 x7 : 0000000000000000 x6 : 49534d702d535449
> 	x5 : ffffffc080c4c2c0 x4 : ffffffd43ee128c8 x3 : ffffffd43ee124dc
> 	x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffffff806f5693c0
> 	Call trace:
> 	__task_pid_nr_ns+0x74/0xd0
> 	...
> 	__handle_irq_event_percpu+0xd4/0x284
> 	handle_irq_event+0x48/0xb0
> 	handle_fasteoi_irq+0x160/0x2d8
> 	generic_handle_domain_irq+0x44/0x60
> 	gic_handle_irq+0x4c/0x114
> 	call_on_irq_stack+0x3c/0x74
> 	do_interrupt_handler+0x4c/0x84
> 	el1_interrupt+0x34/0x58
> 	el1h_64_irq_handler+0x18/0x24
> 	el1h_64_irq+0x68/0x6c
> 	account_kernel_stack+0x60/0x144
> 	exit_task_stack_account+0x1c/0x80
> 	do_exit+0x7e4/0xaf8
> 	...
> 	get_signal+0x7bc/0x8d8
> 	do_notify_resume+0x128/0x828
> 	el0_svc+0x6c/0x70
> 	el0t_64_sync_handler+0x68/0xbc
> 	el0t_64_sync+0x1a8/0x1ac
> 	Code: 35fffe54 911a02a8 f9400108 b4000128 (b9405a69)
> 	---[ end trace 0000000000000000 ]---
> 	Kernel panic - not syncing: Oops: Fatal exception in interrupt
> 
> Signed-off-by: gaoxiang17 <gaoxiang17@xiaomi.com>
> ---
>  kernel/pid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I didn't contribute to this area, not sure why I am in CC. While, this
fix looks good to me. FWIW,

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 924084713be8..2f73f5d13164 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -487,7 +487,7 @@ pid_t pid_nr_ns(struct pid *pid, struct pid_namespace *ns)
>  	struct upid *upid;
>  	pid_t nr = 0;
>  
> -	if (pid && ns->level <= pid->level) {
> +	if (pid && ns && ns->level <= pid->level) {
>  		upid = &pid->numbers[ns->level];
>  		if (upid->ns == ns)
>  			nr = upid->nr;
> -- 
> 2.34.1
> 

