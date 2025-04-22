Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD1D20102C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338321; cv=none; b=puNd5gqmiFgtyaI44ZK7XXz4bz8KnSs0YVjrTPjcEu6wYbN1VuTEnmNoQAB510gPy10r31zcuXePsTlS54xTyqqVx72cv673xP8/LP6crUHuC3KTDdhmckNW0Zj6qW0MU83fcYxUOrGpewxwcb1YYcEDDLnY/klcnAHcT7FxGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338321; c=relaxed/simple;
	bh=Qq2UopazRhFE6V8aJNyetvUiu+LehXxSz3r5aR2nYJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEgaLK29sYhZSrrHDf++eXUgHMQsqnflSizcCVtp2qGs6HA42ghxRof0u0YISexHHcz3VJY5Ak4whxSAitaIcqTI98gv3FtCkvzrx8RN4X8evDFLdNRxx6BhVE1ZL5CAR6dlqHd0JCXs8oIauFBgPQ8fHe7ykesu9A/Iu01u/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b1ZDmZwp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b1ZDmZwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745338318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3fnl5PKf3oIQEvu1rlAoFXUntWQCP3O2jHl/b0iF64=;
	b=b1ZDmZwp4RWaXSVH338HFAniQh/s1zuMmZCm501/0C8HKZ3NuQe95mCA/zMw62n75VAvlk
	kaYpKLU/lhx4hmR7hwBsShxMey4zbZCOfKLozoK8H0AOjuzPSAqo/wbie2r0g0M7+syLEq
	xmEd2wyQHUd2pRQnJlbadDne9a3JcrA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-V7FKQk43Nxu3MuZXku5I5g-1; Tue,
 22 Apr 2025 12:11:54 -0400
X-MC-Unique: V7FKQk43Nxu3MuZXku5I5g-1
X-Mimecast-MFC-AGG-ID: V7FKQk43Nxu3MuZXku5I5g_1745338312
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F30741800988;
	Tue, 22 Apr 2025 16:11:51 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D17A41956095;
	Tue, 22 Apr 2025 16:11:47 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 22 Apr 2025 18:11:14 +0200 (CEST)
Date: Tue, 22 Apr 2025 18:11:08 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH -v5 0/8] sched: Make task_struct::thread constant size,
 x86/fpu: Remove thread::fpu
Message-ID: <20250422161108.GA1676@redhat.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409211127.3544993-1-mingo@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Ingo, sorry for delay.

So just in case, the whole series looks good to me. I am going to send a
couple of minor cleanups on top of it, but let me ask first if I missed
something or not.

- x86_init_fpu is not really used after 4/8, it can be killed

- DEFINE_EVENT(x86_fpu, x86_fpu_copy_src) can be killed after 7/8

- arch_dup_task_struct() still does

	/* init_task is not dynamically sized (incomplete FPU state) */
	if (unlikely(src == &init_task))
		memcpy_and_pad(dst, arch_task_struct_size, src, sizeof(init_task), 0);
	else
		memcpy(dst, src, arch_task_struct_size);

  and I don't understand why do we need to check src == &init_task. It seems
  that we can always do

	memcpy_and_pad(dst, arch_task_struct_size, src, sizeof(struct task_struct), 0);

  or even just

	memcpy(dst, src, sizeof(struct task_struct));

  fpu_clone() will initialize the "dst_fpu" memory correctly.

- fpu__drop() does

	/* PF_KTHREAD tasks do not use the FPU context area: */
	if (tsk->flags & (PF_KTHREAD | PF_USER_WORKER))
		return;

  and this is correct. But perhaps

	if (test_tsk_thread_flag(tsk, TIF_NEED_FPU_LOAD))
		return;

  makes more sense? PF_KTHREAD's should never clear TIF_NEED_FPU_LOAD,
  and this way we can avoid the unnecessary "fwait" if, say, the exiting
  task does context_switch() at least once on its way to exit_thread().

- Finally, with or without these changes, it seems that the
  switch_fpu_prepare() + switch_fpu_finish() logic can be simplified,
  I'll write another email.

