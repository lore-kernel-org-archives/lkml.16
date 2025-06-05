Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD561F4C92
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105170; cv=none; b=CbnsK07NgoDnsrNt47u1L7Dmkt/eVmJQjaeGYmt2DO+Vpz57F9EJiDKCRA1ecyXfVaE9kStLAUvJ+M6ClYk7JhkYzjTbEmQjvAYc5q3QjBgyxbn4Fb+OxplORDhApb3znY71s4jRSSKlTFC1lUegV9+OspGGite4DPxXwCf8YfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105170; c=relaxed/simple;
	bh=1eNm4nmWAuJG/6zyOp6XMQPMZuWG7lF8of09bIGrDCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMotM3hlVVaZ/095mqoQpACQWPBfZk+KlEFg7zlwKbcXyqAm+HnSMzgfT+7DGRvBvyoYA7+D902XPsv/GJ+iljY/vUklnw2HgUrmWxDGU3lJpLoT3tpWrllvTObEzRiQQPvu1TttNOUI44MfG762RBlKj2+r1HeGqsOnzLWBwik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LCjCuYte; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LCjCuYte"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acae7e7587dso97329666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749105166; x=1749709966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lSOF0EtBbyqxKKcvWaFAuAauvCX/Qj9zdt2j6KevZM=;
        b=LCjCuYte/NhD7G7BD/8tagE3e5tu9t9+sZlFCp6w9rHZUnAjVi4kK2opGjMIj/UmUP
         GplLjUJ9DvGp88Kb0HtEZjRG1Oq9hoNSwo15fxB6GesGJKJieEHKjr1hX9dY69bOEiVp
         nFPqPvwOAJRprepqSiYWgY+XvoF8lKvvxP6jne21CKQP8NEOVf0Y8cWiVF+feD3li24/
         J31qlSHRIy0JtOEmWKSpSLeVJJXFwxyzJzoeaVVlkxAmNhz1M81xi2z7q8rt+TgyeZqF
         ouNFu8zRuYr9/pLrLlKgZjzkvHMfcg07wa2l/+1DMlooYQCcxXtDX5/UF3DiREyBb62O
         54gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105166; x=1749709966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lSOF0EtBbyqxKKcvWaFAuAauvCX/Qj9zdt2j6KevZM=;
        b=CvTP4sLAOJ/4n0ocsAe2ev2iKzTPubSN+4I5M6fYFW+E35ScIEb9AgIpA8gr58ScGp
         nOhIwn9M4FJXOZSb6cP/Zpp7sSzBn9UYHjL7gfINkvQ77Ct61v1sSlehkv4rqlYL+9kC
         bc3FsoS8skD4g3y1pNSESPsL35wndcCqijiGH175vFag/QfLH6/yorL1+p8nz7mPxjeu
         EQ3CVMjVZvu6F+REDi/ytwPJzR6Zty7lCDOKOEeuebU0Us9FLSQMVWDvQMdC1yVH+zWg
         MW13xNYeYBHUg57GWNpyx5t47I5NqrVgT8w9NRkIb90FeQ05cqdoH13BDmDEJVA+A2F1
         1p+A==
X-Forwarded-Encrypted: i=1; AJvYcCXlXWfsn5bPf1Xv+iYMWSprWCst89T5jbbteFjlYN7XbzCi0rLMYMNyi9lsgpD8BpBHHA2pOElHioBbpIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjaxNlJTNgymrX3jPi190m4Iu53ZMxhWJY4mYyaFj3cNmLbAck
	4DuLLTh3Xv8V3bN0KO4rB9qD32eRkzg4nkNJubkDBmYciMzmG17ykUiHLRm6pClmEUw=
X-Gm-Gg: ASbGncvsjmhNls/INvB4rY17BXm2FcwQmMXoZZWPKhVno/J61O0YDgHPb3Tk6VZUZ4t
	aI7eTDVWwmsY4c8cVLHu7K65jBrAFg/1lEDLlPgO1nPBqk1AG47/kbF3TjUl1jSRJtSSkK8GJtu
	LnTjyc7hToqP19UtWSfb0NEkrgE8upRtf/GubxwmHRLfSbh9Mi7bbR8ZnOUO1b+NssuUJbHtI1b
	6QuNgYp7RoU3G7L7TBUzVwVnjGlBccM4/lrEm8VSWoZJVr0quD2Z54YMSaUUMp5BqKC5h7JP+3a
	FK8ZqGYc+MnX83NV4omY5yJyNw0nr+ew6IQwfMupwvRsgX/InMygLH6E8hdSH4CS
X-Google-Smtp-Source: AGHT+IG6tFvgSjWU4ETeIFzDsF5SwAK4ctDL8+HRHWpaT2Wob1h8vxQM68Y5aUX0aVGhDQl+FZHLFA==
X-Received: by 2002:a17:907:3dab:b0:ad8:ae51:d16 with SMTP id a640c23a62f3a-addf8fc9887mr488019166b.55.1749105166500;
        Wed, 04 Jun 2025 23:32:46 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ada5e2bf029sm1198020466b.115.2025.06.04.23.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:32:46 -0700 (PDT)
Date: Thu, 5 Jun 2025 08:32:45 +0200
From: Michal Hocko <mhocko@suse.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, surenb@google.com, donettom@linux.ibm.com,
	aboorvad@linux.ibm.com, sj@kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: fix the inaccurate memory statistics issue for users
Message-ID: <aEE6DW-Gjv95eBTj@tiehlicka>
References: <ef2c9e13-cb38-4447-b595-f461f3f25432@linux.alibaba.com>
 <aD7OM5Mrg5jnEnBc@tiehlicka>
 <7307bb7a-7c45-43f7-b073-acd9e1389000@linux.alibaba.com>
 <aD8LKHfCca1wQ5pS@tiehlicka>
 <obfnlpvc4tmb6gbd4mw7h7jamp3kouyhnpl4cusetyctswznod@yr6dyrsbay6w>
 <250ec733-8b2d-4c56-858c-6aada9544a55@linux.alibaba.com>
 <1aa7c368-c37f-4b00-876c-dcf51a523c42@suse.cz>
 <d2b76402-7e1a-4b2d-892a-2e8ffe1a37a9@linux.alibaba.com>
 <nohu552nfqkfumrj3zc7akbdrq3bzwexle3i6weyta76dltppv@txizmvtg3swd>
 <985a92d4-e0d4-4164-88eb-dc7931e2c40c@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <985a92d4-e0d4-4164-88eb-dc7931e2c40c@linux.alibaba.com>

On Thu 05-06-25 08:48:07, Baolin Wang wrote:
> 
> 
> On 2025/6/5 00:54, Shakeel Butt wrote:
> > On Wed, Jun 04, 2025 at 10:16:18PM +0800, Baolin Wang wrote:
> > > 
> > > 
> > > On 2025/6/4 21:46, Vlastimil Babka wrote:
> > > > On 6/4/25 14:46, Baolin Wang wrote:
> > > > > > Baolin, please run stress-ng command that stresses minor anon page
> > > > > > faults in multiple threads and then run multiple bash scripts which cat
> > > > > > /proc/pidof(stress-ng)/status. That should be how much the stress-ng
> > > > > > process is impacted by the parallel status readers versus without them.
> > > > > 
> > > > > Sure. Thanks Shakeel. I run the stress-ng with the 'stress-ng --fault 32
> > > > > --perf -t 1m' command, while simultaneously running the following
> > > > > scripts to read the /proc/pidof(stress-ng)/status for each thread.
> > > > 
> > > > How many of those scripts?
> > > 
> > > 1 script, but will start 32 threads to read each stress-ng thread's status
> > > interface.
> > > 
> > > > >    From the following data, I did not observe any obvious impact of this
> > > > > patch on the stress-ng tests when repeatedly reading the
> > > > > /proc/pidof(stress-ng)/status.
> > > > > 
> > > > > w/o patch
> > > > > stress-ng: info:  [6891]          3,993,235,331,584 CPU Cycles
> > > > >             59.767 B/sec
> > > > > stress-ng: info:  [6891]          1,472,101,565,760 Instructions
> > > > >             22.033 B/sec (0.369 instr. per cycle)
> > > > > stress-ng: info:  [6891]                 36,287,456 Page Faults Total
> > > > >              0.543 M/sec
> > > > > stress-ng: info:  [6891]                 36,287,456 Page Faults Minor
> > > > >              0.543 M/sec
> > > > > 
> > > > > w/ patch
> > > > > stress-ng: info:  [6872]          4,018,592,975,968 CPU Cycles
> > > > >             60.177 B/sec
> > > > > stress-ng: info:  [6872]          1,484,856,150,976 Instructions
> > > > >             22.235 B/sec (0.369 instr. per cycle)
> > > > > stress-ng: info:  [6872]                 36,547,456 Page Faults Total
> > > > >              0.547 M/sec
> > > > > stress-ng: info:  [6872]                 36,547,456 Page Faults Minor
> > > > >              0.547 M/sec
> > > > > 
> > > > > =========================
> > > > > #!/bin/bash
> > > > > 
> > > > > # Get the PIDs of stress-ng processes
> > > > > PIDS=$(pgrep stress-ng)
> > > > > 
> > > > > # Loop through each PID and monitor /proc/[pid]/status
> > > > > for PID in $PIDS; do
> > > > >        while true; do
> > > > >            cat /proc/$PID/status
> > > > > 	usleep 100000
> > > > 
> > > > Hm but this limits the reading to 10 per second? If we want to simulate an
> > > > adversary process, it should be without the sleeps I think?
> > > 
> > > OK. I drop the usleep, and I still can not see obvious impact.
> > > 
> > > w/o patch:
> > > stress-ng: info:  [6848]          4,399,219,085,152 CPU Cycles
> > > 67.327 B/sec
> > > stress-ng: info:  [6848]          1,616,524,844,832 Instructions
> > > 24.740 B/sec (0.367 instr. per cycle)
> > > stress-ng: info:  [6848]                 39,529,792 Page Faults Total
> > > 0.605 M/sec
> > > stress-ng: info:  [6848]                 39,529,792 Page Faults Minor
> > > 0.605 M/sec
> > > 
> > > w/patch:
> > > stress-ng: info:  [2485]          4,462,440,381,856 CPU Cycles
> > > 68.382 B/sec
> > > stress-ng: info:  [2485]          1,615,101,503,296 Instructions
> > > 24.750 B/sec (0.362 instr. per cycle)
> > > stress-ng: info:  [2485]                 39,439,232 Page Faults Total
> > > 0.604 M/sec
> > > stress-ng: info:  [2485]                 39,439,232 Page Faults Minor
> > > 0.604 M/sec
> > 
> > Is the above with 32 non-sleeping parallel reader scripts?
> 
> Yes.

Thanks, this seems much more representative. Please update the changelog
with this. With that feel free to add
Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!

-- 
Michal Hocko
SUSE Labs
