Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2856A2111
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367204; cv=none; b=bMhG2fFg2Vbn7FXjf11B/pUHl0DJvvGfv25q7z+xjoCsiyVsDwXUM7lQXLSPbM3n30KzBmNgXni9vkxxohjGAaJd4I1xB0zazJYp0iiWFzcVz+iEnzJBlun1W5HL3Jf1S0hcPNR3jy722bkOLth1vnRBuix0yayhk6LYZwdIgw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367204; c=relaxed/simple;
	bh=aHuCE/uU7spSprHLf5V5HqSNXI02fPpj/JvVgJEM574=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGJXboCbCCZS6v1dJJD1sUKmThMEvaUaXx2QHzjU8O2cMBKMn0zkSgLnezr3jSpJi5sZF3IcStHYSR35phA6SMB0I9hE0hAV/7KBOuPr7IAeN2yczQHYuE8rFqk0Bd4RkwOaf3PE+dztuWXQ2i+30+Z/gXYDc9iMFzwk1l1OB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHdImQMY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHdImQMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744367202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JmMufGW94wEMZGWR6BkGZ+0dzdW798fPhJuI4K0fmUQ=;
	b=OHdImQMY/jBXZLxwIbg+8pjYDKW8wYP6QrvilvZMuotuKiHrprECg6lDAMQHNqMnk4ww56
	j4+2mLopMXKOpbQLvVzT1yDGgEc9y31fYlefnr3Tn5A/nk3jGk0icazs82wz5f7SwpvgZW
	QnHnH2RDZUMsI3ZzhyfNYTpK9lVGZi8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-3-uVoF_uO9y8ccWm1ixl5A-1; Fri,
 11 Apr 2025 06:26:38 -0400
X-MC-Unique: 3-uVoF_uO9y8ccWm1ixl5A-1
X-Mimecast-MFC-AGG-ID: 3-uVoF_uO9y8ccWm1ixl5A_1744367197
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0905B1955DC5;
	Fri, 11 Apr 2025 10:26:37 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.222])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id CEBE8180176C;
	Fri, 11 Apr 2025 10:26:32 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Apr 2025 12:26:01 +0200 (CEST)
Date: Fri, 11 Apr 2025 12:25:56 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Michal Hocko <mhocko@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Subject: Re: [PATCH 5/6] sched/isolation: Introduce isolated task work
Message-ID: <20250411102555.GA5322@redhat.com>
References: <20250410152327.24504-1-frederic@kernel.org>
 <20250410152327.24504-6-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410152327.24504-6-frederic@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

I know nothing about this code so I can't review, but let me
ask anyway...

On 04/10, Frederic Weisbecker wrote:
>
> +int __isolated_task_work_queue(void)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	if (current->flags & PF_KTHREAD)
> +		return -EINVAL;

What about PF_USER_WORKER's ? IIUC, these (in fact kernel) threads
never return to userspace and never call task_work_run().

Or PF_IO_WORKER's, they too run only in kernel mode... But iirc they
do call task_work_run().

> +	local_irq_save(flags);
> +	if (task_work_queued(&current->nohz_full_work)) {
> +		ret = 0;
> +		goto out;
> +	}
> +
> +	ret = task_work_add(current, &current->nohz_full_work, TWA_RESUME);
> +out:
> +	local_irq_restore(flags);
> +	return ret;

Hmm, why not

	local_irq_save(flags);
	if (task_work_queued(...))
		ret = 0;
	else
		ret = task_work_add(...);

?

Oleg.

