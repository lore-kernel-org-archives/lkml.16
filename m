Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219D129291E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716366; cv=none; b=XBuPDKciyNLd5I4ohbJ7dArfQnbsAtUVWv89S6kpweK7TjmphcZ3M6VeCaoJxP2OkbBjzwlQ9pIexQoqxF6dvkvhqYsVdjzsP5HCpo/M2c6p+hDYTMuQrM9sETmV9VTfkHJ+zaAcb1JvKjRd1m3AjYTypZzwQLcn239Iq5jFVts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716366; c=relaxed/simple;
	bh=UOdPJNFlTSHIsLD7NvR53QPYI9lJcC8Csp9X91Wft4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmX/l3bREjN/5DhZ1sdhYFJmmzXgWdbuKHiq5OaplOq4ShGlcZbYWO71l3gYZfSAYP1d2yhL/oezmhOng1jEhQu4+uMVrwZJ6aUS5d6Cxv3fiIKgAT54PZN5Z0Y3jpzqB/XWbqLqChXYuRShqt5HcPRQggoaUPoSgxYH8q3qkHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Con6nxF7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Con6nxF7"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2068989b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744716363; x=1745321163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dDGddYZobnwhQQelFpeW5tjd+TZ/wL7MS9x8C4dzRNo=;
        b=Con6nxF7M+lkF/IgTglDaZ5cPQbixH0jqAA8F686dymXki+YrqjhzRxRwalMi6jqdL
         nqiIivyvPA0wSBAAAix7xVdMm5FE5bHDwIUI99uNiR3eACuVsYpdpm65755aEqrZL9lo
         vjWDkHDCSK1VtFEWkTpPOmw4Ch5f14HoCZa/dAMEq2IuTQXu/AtbqizjW6a3PnuLRS0E
         eAqRr2J3dmyB+k6iff5a8HyMqJSoqK5W6vz6yXh79g5IDUd993VIC0aRDi0q79echvVE
         u1WrTo8vnBvLZi2lte2CSzafh6I2AXEbCQoNcp6b8+JY96sO+8czNRlMEn0VeNfErWp8
         gE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716363; x=1745321163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDGddYZobnwhQQelFpeW5tjd+TZ/wL7MS9x8C4dzRNo=;
        b=kEmHt/CiOS6sHD6nhwgc7J1s3ZCF3ruqWC5/e+x++KqxldoKiFpauaF90yx5b3t9ZI
         NNWdujTUkP5c4HS5yPYdEAAHRdYr2+WRKgWfj9F0IoSXJaTPavyPFUIH84Gvpi90ptpZ
         iIWADxnUsshBeFrRhI91L9Wp6p9YdGJj+luYH2F7lSZqViP/i0wZNWN69mAKJMvKCjP9
         3+xaUSHA2h87dUYjWb2BB+guV4dwgW/8wAfGBRfMi1NaWmMPPR0Av1ZvwVzHMaWN1BmU
         d1QUw6nYN4k8yhNz4YB3hAfE5f6oY0q+j7GQcc5SVXqEFu1b/HgKyaR7ytpmXk2Vl5AN
         bKgA==
X-Forwarded-Encrypted: i=1; AJvYcCW3dEpd/PqPwqhCbt9WK64RsAYTD2rMoNbCUtj+n+qC09YjM/jZBJHYxBkzs3uvufRlTCBtcl6Yy90zMWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIFCBs0wfObjkbSMvCr01k5MTEbehmQvDvOv9RtWrh7Giak4Nl
	755AfA7VAJly6U2nxrIq9GqmNbdQQRIZOJwQKuUR5xwzxlFmS6cv3cc7smB5/A==
X-Gm-Gg: ASbGncuKfN5gA8WcQOYlKlVerH8u4vce4rGQB+f4a3redPsRoD/sXvR6WsVNmBvwHH1
	G4Oi1CTvBRh975trXbgW3MSTGAaohKRMv/8qUCXb9Ipx+t+NntXfOJxQcnbLT3c9EgDBoapUa4r
	hGXjHFHcH7PENYQRxR9N9hpGd2Ftel2B90gwkRMGQ6d/Lvo5/5HfE96vigizvqd79F/gsCw0TJZ
	KP4Q+2WvZBgSxFHkX2dywc7OXCmdrgpBN6SuP9vlPwHpjwIVv9ayheCWW0b7i6Q7wq6qEu/WUfM
	T11/N8m08X5NNeSfTNkTcHzjlzma0aQZurGWTo4v
X-Google-Smtp-Source: AGHT+IFTpyciPbcjN/7nPRD6z7xpo/9MA1o5brEkHNIB0vLU2Kl0oz5lXnIoMIOn/RP2arqm8wlB5w==
X-Received: by 2002:aa7:88cc:0:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-73bd12a1840mr21271776b3a.23.1744716363030;
        Tue, 15 Apr 2025 04:26:03 -0700 (PDT)
Received: from bytedance ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e56dsm8447649b3a.135.2025.04.15.04.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:26:02 -0700 (PDT)
Date: Tue, 15 Apr 2025 19:25:55 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
Message-ID: <20250415112555.GB4008038@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <ded06050-83c1-49f3-8eb2-bb086930e226@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded06050-83c1-49f3-8eb2-bb086930e226@amd.com>

Hi Prateek,

On Mon, Apr 14, 2025 at 10:04:02PM +0530, K Prateek Nayak wrote:
> Hello Aaron,
> 
> On 4/9/2025 5:37 PM, Aaron Lu wrote:
> > This is a continuous work based on Valentin Schneider's posting here:
> > Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to user entry
> > https://lore.kernel.org/lkml/20240711130004.2157737-1-vschneid@redhat.com/
> > 
> > Valentin has described the problem very well in the above link. We also
> > have task hung problem from time to time in our environment due to cfs quota.
> > It is mostly visible with rwsem: when a reader is throttled, writer comes in
> > and has to wait, the writer also makes all subsequent readers wait,
> > causing problems of priority inversion or even whole system hung.
> > 
> > To improve this situation, change the throttle model to task based, i.e.
> > when a cfs_rq is throttled, mark its throttled status but do not
> > remove it from cpu's rq. Instead, for tasks that belong to this cfs_rq,
> > when they get picked, add a task work to them so that when they return
> > to user, they can be dequeued. In this way, tasks throttled will not
> > hold any kernel resources. When cfs_rq gets unthrottled, enqueue back
> > those throttled tasks.
> 
> I tried to reproduce the scenario that Valentin describes in the
> parallel thread [1] and I haven't run into a stall yet with this
> series applied on top of v6.15-rc1 [2].

Great to hear this.

> So for Patch 1-6, feel free to add:
> 
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

Thanks!

> I'm slowly crawling through the series and haven't gotten to the Patch 7
> yet but so far I haven't seen anything unexpected in my initial testing
> and it seems to solve possible circular dependency on PREEMPT_RT with
> bandwidth replenishment (Sebastian has some doubts if my reproducer is
> correct but that discussion is for the other thread)
> 
> Thank you for working on this and a big thanks to Valentin for the solid
> groundwork.

Thank you a ton for your review and test.

> [1] https://lore.kernel.org/linux-rt-users/f2e2c74c-b15d-4185-a6ea-4a19eee02417@amd.com/
> [2] https://lore.kernel.org/linux-rt-users/534df953-3cfb-4b3d-8953-5ed9ef24eabc@amd.com/

Best regards,
Aaron
