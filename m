Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537DE18A922
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766764; cv=none; b=l/Yase2Tqzxmpvn+g9aEMdVCIfozhOt476r6lO2yTKQWKcOEVp3i/UEKzCz8inmcQOS0LItmyp03WrPQysXVwwG1+GsfOA43kJrEXPjqnQXlC+2fMhDScJq9Z/MnglZyssMhY3LPn7FOZnBrWvWyyP0+WtnKhRsrVmxR1+YGI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766764; c=relaxed/simple;
	bh=cYVfl1VGgJW9gUm2tKGMqV8C8M9hinkKniTKacZulPM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AUG/WTEbI+ZhJIru77796h6d2EmK8a0mxjccPusSD2mPOTYeHGXC/fI6x7P7aBJzlX0NlVG7XE4wh45pxVJQnt5TjJxKXop0tedYcZCngIGDHwq3Kqynz4U9rNs5IYXJF1+Ejjdx8w/3USbu1WXTwB7eK2SxvDdQ7tGRQOlvb9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jPO0D1ex; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jPO0D1ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738766761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nmBO7ogs0bpMbXvpbk16thYXFHe6l3/FVRdtmy/4QEI=;
	b=jPO0D1exx+l0XzeZJto6zIz1aqnk6zAVaIJH1qOet0osG5QDRI9vhUdvbwbdM1RjxLewdS
	jyxkNunvEe3HN6EZsl5JQAKjF2NT8+yIAiqRKGtKaIlzBrkeN8nnXZ1UFTh8+42sP1fbKF
	RRelUqi4nrkwXHT5vdweGQKDSQSCdPs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-IfcmoY8sMMy4w0OcZXHxIA-1; Wed, 05 Feb 2025 09:45:59 -0500
X-MC-Unique: IfcmoY8sMMy4w0OcZXHxIA-1
X-Mimecast-MFC-AGG-ID: IfcmoY8sMMy4w0OcZXHxIA
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38db560edc3so404569f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 06:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766757; x=1739371557;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmBO7ogs0bpMbXvpbk16thYXFHe6l3/FVRdtmy/4QEI=;
        b=rAWyHEcLlgg9SgxbFd1nFto92N2y0FuPnq1pH2o90Mg1N4Z5CTDNStiu2HrMMd4J+6
         1EssJ0cLE8WDZNuykCrHEXMHbOxdnEqqdWDKIUx7JvGT5lBRVfBQAATkpB+YOaTybYZj
         3TSR8chAsCv2HTBp5mPgy/AWYxM+ydfJzFax31V7fuy6/81+nS12s1YQI2/7pk3jQeJN
         D6eC3S5cLLmpuykIwMG2KyKi+jutYmAtnV8GuXK1lWmdzTUz+5rBHNtItq0kRiV16Ddc
         IIudUV0s/AX5stxDWQvisFBq0NtdUdRkvEg2VYpPRGNOdC31/EJlkXequkDIO1x8FBlb
         Pm1w==
X-Gm-Message-State: AOJu0YxSUBaqXBN56ZmBhWQD5OkVWlEA7aOLshvTTsibRqhWHup6sqja
	lytinQa62XbRn6Y1AwOZkdJq6ZR/NvWEaQOoi9/LWkGS0hWMb2h/nEUtsyVaaF4EPV+NieW++vb
	cx9RPN28wfORLI//zn18JAy8oqNYD7bG0+jdBjjPChLv+q34dKNGQJHvF26iIYJiCP2vm9w==
X-Gm-Gg: ASbGncuJ4MbqgPfYVAOjRIzh0Z1Lg1EFCjAZ8eHXeb+gFc3TDASPH8K70JouEbPnXws
	j71ZBUddLh1JK4ZrCkNhcPnudXixJFQgpxLTcwEw/Wvy7z/27WQuwFORwg5f8EJkrSATCNsyzrq
	CWc18uc6to9xZJvR1td7xI3v40z0qI/4B5Ua24UItc5hUZ7YWsC8o1GEhe1rY4Gp1Cn5nTf0S85
	035Ga3O8oBrV14oNC3tvqy83mHPetMaBPV3c6aAS2aDvpcBc9JQ/qQpOToFudm0q3rruOL0wNFH
	T1cKPhmtohyL4qyxjaUJE9v8WG6THxA+h9Kt1LN2yq4xnLfXv8ENmrOz1UOlS2tLqg==
X-Received: by 2002:a05:6000:1786:b0:385:f0dc:c9f4 with SMTP id ffacd0b85a97d-38db48bdaecmr2448749f8f.20.1738766756898;
        Wed, 05 Feb 2025 06:45:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG04Vlw0Hli7WUFU0PA/5NHv33t/SaSKlzJ5k+gRLi1GoiHuI2BxE4p+uWLN/tBgOKY2CI15g==
X-Received: by 2002:a05:6000:1786:b0:385:f0dc:c9f4 with SMTP id ffacd0b85a97d-38db48bdaecmr2448701f8f.20.1738766756098;
        Wed, 05 Feb 2025 06:45:56 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d933789sm23728485e9.4.2025.02.05.06.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:45:55 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: paulmck@kernel.org
Cc: linux-kernel@vger.kernel.org, frederic@kernel.org, leitao@debian.org
Subject: Re: [PATCH RFC context_tracking] Make RCU watch
 ct_kernel_exit_state() warning
In-Reply-To: <b0a4a163-c372-4506-bd12-43f5b4f70e09@paulmck-laptop>
References: <19bebbeb-db36-4801-bc3d-2c39989b6152@paulmck-laptop>
 <xhsmhjza4k5e5.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b0a4a163-c372-4506-bd12-43f5b4f70e09@paulmck-laptop>
Date: Wed, 05 Feb 2025 15:45:55 +0100
Message-ID: <xhsmhh658jvq4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 05/02/25 04:16, Paul E. McKenney wrote:
> On Wed, Feb 05, 2025 at 12:17:06PM +0100, Valentin Schneider wrote:
>> On 01/02/25 10:44, Paul E. McKenney wrote:
>> > The WARN_ON_ONCE() in ct_kernel_exit_state() follows the call to
>> > ct_state_inc(), which means that RCU is not watching this WARN_ON_ONCE().
>> > This can (and does) result in extraneous lockdep warnings when this
>> > WARN_ON_ONCE() triggers.  These extraneous warnings are the opposite
>> > of helpful.
>> >
>> > Therefore, invert the WARN_ON_ONCE() condition and move it before the
>> > call to ct_state_inc().  This does mean that the ct_state_inc() return
>> > value can no longer be used in the WARN_ON_ONCE() condition, so discard
>> > this return value and instead use a call to rcu_is_watching_curr_cpu().
>> > This call is executed only in CONFIG_RCU_EQS_DEBUG=y kernels, so there
>> > is no added overhead in production use.
>> >
>> > Reported-by: Breno Leitao <leitao@debian.org>
>> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>> > Cc: Frederic Weisbecker <frederic@kernel.org>
>> > Cc: Valentin Schneider <vschneid@redhat.com>
>> >
>> > diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
>> > index 938c48952d26..fb5be6e9b423 100644
>> > --- a/kernel/context_tracking.c
>> > +++ b/kernel/context_tracking.c
>> > @@ -80,17 +80,16 @@ static __always_inline void rcu_task_trace_heavyweight_exit(void)
>> >   */
>> >  static noinstr void ct_kernel_exit_state(int offset)
>> >  {
>> > -	int seq;
>> > -
>> >       /*
>> >        * CPUs seeing atomic_add_return() must see prior RCU read-side
>> >        * critical sections, and we also must force ordering with the
>> >        * next idle sojourn.
>> >        */
>> >       rcu_task_trace_heavyweight_enter();  // Before CT state update!
>> > -	seq = ct_state_inc(offset);
>> > -	// RCU is no longer watching.  Better be in extended quiescent state!
>> > -	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && (seq & CT_RCU_WATCHING));
>> > +	// RCU is still watching.  Better not be in extended quiescent state!
>> > +	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !rcu_is_watching_curr_cpu());
>>
>> Isn't this equivalent to the check done in ct_kernel_enter_state()? That
>> is, it operates on the same context_tracking.state value that the
>> ct_kernel_enter_state() WARN_ON_ONCE() sees, so if the warning is to fire
>> it will fire there first.
>
> In theory, yes.  In practice, the bug we are trying to complain about
> might well be due to that call to ct_kernel_enter_state() having been
> left out completely.  Or, more likely, the call to one of its callers
> having been left out completely.  So we cannot rely on its WARN_ON_ONCE()
> to detect this sort of omitted-call bug.
>
> And these omitted-call bugs do happen when bringing up new hardware or
> implementing new exception paths for existing hardware.
>

Ah, quite so, it evens says so on the tin for ct_nmi_enter() & co.

>> I don't have any better idea than something like the ugly:
>>
>>      if (IS_ENABLED(CONFIG_RCU_EQS_DEBUG)) {
>>              unsigned int new_state, state = atomic_read(&ct->state);
>>              bool ret;
>>
>>              do {
>>                      new_state = state + offset;
>>                      // RCU will no longer be watching. Better be in extended quiescent state!
>>                      WARN_ON_ONCE(new_state & CT_RCU_WATCHING);
>>
>>                      ret = atomic_try_cmpxchg(&ct->state, &state, new_state);
>>              } while (!ret);
>>      } else {
>>              (void)ct_state_inc(offset);
>>      }
>
> This would make sense if we need to detect a bug in ct_state_inc() itself.
> But that function is a one-liner invoking raw_atomic_add_return(),
> and we have other tests to find bugs in atomics, correct?
>
> Or am I missing a trick here?
>

Not at all; consider my suggestion revoked and my questioning answered :-)

Reviewed-by: Valentin Schneider <vschneid@redhat.com>

