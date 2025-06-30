Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC08254846
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278873; cv=none; b=FbgcECDU/B+1YQMgJgrqza0rbOKUW5MGSh1nsET/vCorMCg72+NtZurjmtamk+SH3ovX1FvGk1fMo8AONkZReqWTgPEIIW8FNHc9pT3C7G2O4LWegFcFiBlTZQ2OGMA6aGE1HDcrdnX87X9w+4vw9qTWuRDHP29rrY+AdjxEEus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278873; c=relaxed/simple;
	bh=A3jX6vGySplYc/SKN1zwy4Nbcd84Vn9Kb8exgTD0siU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSewhs60LYl54/BmcAxRst0YCUUpofKqEC2JmJyY3NxYZ0cHIHKeJTHQSpZPyzcH0NrtE0e+6qlTLrblarlLmkn9738U5lIhTBa5CLFv3TGOYT+HBfLU49mJwn5Knxs8oaNxUeg7WDdxUazCuMyPIm1D2W2UY4xwKyIWbHscq4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GNiEenUn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GNiEenUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751278870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpBsl8uhWd2G6mgt/MkVSxvALzS9VDabZhZIEH6uoj8=;
	b=GNiEenUnzk5TSUv+Z8Lr7C7BIoQ9FMBP0ZxdEFixhP+qvmkU9tvWAnjU1epPQTJAB+ypkJ
	s5TlD80HiL7exPaxrUcFBNVJlxNX3ymnpaSoFPXTlSTs2JM8jkvyjnDUGvVYffqSHww8Wa
	gcG7MOH/aeAQwFTDxMng8N9Yjl/gLM0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-VqhX1WKzPdSKzgpbJr0-3Q-1; Mon, 30 Jun 2025 06:21:06 -0400
X-MC-Unique: VqhX1WKzPdSKzgpbJr0-3Q-1
X-Mimecast-MFC-AGG-ID: VqhX1WKzPdSKzgpbJr0-3Q_1751278866
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd75e60875so34493226d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751278866; x=1751883666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpBsl8uhWd2G6mgt/MkVSxvALzS9VDabZhZIEH6uoj8=;
        b=fHQiyHntx9bGfcTF5l9WphJoSeb68zcUarOPl5uO5iilCmoJEG2TQ9ULoYRn31EpM2
         thgdFtj6pip8Azr4QzuBxDAXilkoYEVJ1StytZ+M+J8cTfGizzWc1/MKtXDxOjcLF7x2
         0wG8KSeo3yzCT0CgAFugh3gkzIj8cgpgjwHf3p7yORKERQIDNTeig2OMKr+fwcKd9Vku
         etUBCEmBdr8+9ejOAVmfyWiqoPVYwywwJ149LMXWPumphTdhcupELU3WKooRX4Kq/nN4
         lW+ajQkdkj5hlwVa7d5arKzjatYUN0r2W2vFQK051o0+oy5ywFYeVuUYwkQdY0xcyW7M
         Rb4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWexkc23e4gEHDElGny7BR2lI1xScO6/h9gCO9fnjrG3/lJ7J7I57hQhbPuThk2cdHADaNK4sCgLbWxs8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdD4cUJvLxzlZFrXziyIEbSAt+teHRHGkTZvOM/RFsCs5Zaxv0
	7lTnWT7MfxmQcZU6RkhKzbyBjkO2rj+U9vlH5x4ZDhdiFF7nx38fy/uCS+Q1+8aw+Mmt4IR7EX+
	pb+aDMIsIoUctG5KT7CLzbxejI1p8jtF28TWab7LcqbBWqwNLTVy0eSPX1YtvwBJPYg==
X-Gm-Gg: ASbGnctNC6ytfTdFmz2mb5pnLjHjn44+M3c+ypWHnOEILZtnmpyR2gyzuqx3oUmc/lS
	EVr/Hg4lx3WcytjZHosYdJ0wtTZ/DBhHLmJinVlWtLaTQEt1XwZnXZ1JuFOOZwKAR1TLH/6bXJg
	Ep84VfYpL7WmMdrbody1UMEWZaedMOh4lcSZKZxv0fGuvUmCYrPMu1seBolsioM01hAiWQToWX8
	lDjVqLuMNohQfO8RY2yp5hw5jddBy6ol3KUkchQD2nYeaxv2Mow97WIhQ76R5SumFGP0oAzCbMB
	kuHsGvVa6nQWYwbw/LB+iutkT7yKWDiPIzyqVh8CYvRJ0Bw84Q8NC9dRHBnexBaKXo3KtxA/NfL
	kJP1IGA==
X-Received: by 2002:a05:6214:5a02:b0:6fa:bb26:1459 with SMTP id 6a1803df08f44-7000174dc81mr218507766d6.7.1751278866099;
        Mon, 30 Jun 2025 03:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5tK1cVN8wuxM1sOx4IF79vtBA4DRmfYqyvBbGZ8rB/9o19O6MhFR+FffQ+u0NJyzjzuvLxw==
X-Received: by 2002:a05:6214:5a02:b0:6fa:bb26:1459 with SMTP id 6a1803df08f44-7000174dc81mr218507546d6.7.1751278865800;
        Mon, 30 Jun 2025 03:21:05 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-2-102-80-182.as13285.net. [2.102.80.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771ce2basm65276236d6.44.2025.06.30.03.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:21:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 11:21:00 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Waiman Long <llong@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	Luca Abeni <luca.abeni@santannapisa.it>
Subject: Re: [PATCH 1/5] sched/deadline: Initialize dl_servers after SMP
Message-ID: <aGJlDGR1Wud0LOG5@jlelli-thinkpadt14gen4.remote.csb>
References: <20250627115118.438797-1-juri.lelli@redhat.com>
 <20250627115118.438797-2-juri.lelli@redhat.com>
 <1e39c473-d161-4ad0-bfdc-8a306f57135f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e39c473-d161-4ad0-bfdc-8a306f57135f@redhat.com>

On 29/06/25 18:48, Waiman Long wrote:
> On 6/27/25 7:51 AM, Juri Lelli wrote:

...

> > @@ -1652,6 +1664,8 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
> >   	int retval = 0;
> >   	int cpus;
> > +	guard(rcu)();
> > +
> 
> Your patch doesn't explain why a RCU guard is needed here?
> sched_init_dl_servers() is the changed caller, but it is called with
> rq_lock_irq held which should implies a RCU read critical section as IRQ is
> disabled.

Yeah, looks like it's not required. Will remove. Thanks for spotting it!

Best,
Juri

