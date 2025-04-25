Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EED12C544
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597686; cv=none; b=W+IdoEz7pP0o3wXP2HpJjPSzeiDRJGmhbsDCafCdOMZTdZjI6w0pSGCQaSLzVMfT8TtRXqgvhBh0mxtQBnLEDF3pci1xFFD8aa8B264ejZnqdb143+ej/DNLFRsn3t0cEqSIK5E9EluTLghjEyuzq9lmCRkLiwjv6YL1gjGcCR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597686; c=relaxed/simple;
	bh=pB5EQvm4M998JD5gqBKF7UyBdVALJXllJZsqqL5U7kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBA/QkY8ZpgahPTbrBQms4aEELo+OEGM88YfmBP/BCxTpJYM1ZiRiDWP4EPTXJVahJr0NEqHgRtfHr74LQkm3Mbr9+f78lRo4pYbjoUL/M8uYiKuhgvsWMCUGUnRIqBU8gCup6BCArDQm1pBn6bPjh0iVVE6yAcxj/2Phwp3AXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HvHr0icL; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HvHr0icL"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476a304a8edso29959141cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745597684; x=1746202484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pB5EQvm4M998JD5gqBKF7UyBdVALJXllJZsqqL5U7kM=;
        b=HvHr0icLY1iKK01Sfw1TtMUHIFepp68JomjSluzHCAT5aXJfp6rpq7eZbQrvPr3yeB
         HcR6suMInpzT+gnGwyq4t/tLQGHsrYhuVVnvAauH1fqrWjv3RvJ2CJN9lzlnBzEcgADm
         Zo4pDI11q6/Xws6LdtmC+YOSdr4nI85XzkgpN+ToP0ftY4YkQHBjJgjzvhz6onak8ruL
         /9yXsTlnK21sS/KHwZN9E3cMeMk/KdMbhfq5GLEFlhmityxvpQE/wDHnSqFlEac/ktG3
         7fiKM0PBwd+85+Yklw0wi+JE/QmknXh1Tu2KN/EdA3Pp5ann1ivu+VPSDMF/PKRumSSd
         F7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597684; x=1746202484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB5EQvm4M998JD5gqBKF7UyBdVALJXllJZsqqL5U7kM=;
        b=lkPtJqxDwE2FQk9VYRe+T68iqZq1vnGuAi+Z+Nq0WMxN+1yjk9pJ54cmOipD7iUMes
         6WraLJsS96aYvobtVtpTTnog+YyhwsQLQsHkjNOqhSbt/bYIYR40ttDlORCnN+d0lk0m
         +ZpplYijEA+deEW+xMvx3LReEiVr2v2d0h3c4FLNy0RE1EwIl5zZoWZEmz2rqaocFg7T
         S2z653CcrGu7ervIFInWUqm25joLMAyOMO7atg2X+isiZCWFs+hyCwwR5ODOnvmWtG0G
         mV6eZ4fzesuDJ82JuEzUWDfkex8XjES5zePnFbAU/pfYsE3ae9mKQvx1NEQjkaAlDbmH
         6ZEQ==
X-Gm-Message-State: AOJu0Yxd+jwS3y/h4OAGalFkL/hizhLL/5jDI6AZC8tQ6oYrbIQoLcJv
	3bwpjtuoc3zXwjNWsnhs+2lWPV5tMq8LOHJM8t/S2uXb0V1WEgnc9uZryGM/wYFQm6PR/XHJnzJ
	bJG5B2s4UIxB3iVlYkfwNF20CClXq5PNRD78D
X-Gm-Gg: ASbGncuPb4YvLHIGpTXETN2fsFjQy+vriYoEmhQiDeTkmPKnaVjm3Te4R54VPsyEixB
	TlfgcF2E2yZCUvS+GVau6U77VnAxbCGT+lDpM9IaXFyja20QxSpnbJMErQFNojNQXpw1CPJXBMQ
	XvPmbwfZmfsnDSbjdmWMoBNhnZLBQCmRgz+RKYfbfag9eKcJSUMv5yqSQ=
X-Google-Smtp-Source: AGHT+IGkWHXll+GKqrBvN0wE83LWOl9+WBBl0lPjNcsQhvzSc6nWeRIVsYXCHFj5Oye/ZIV+mSExs3QJhoyG96v2SFQ=
X-Received: by 2002:a05:622a:148e:b0:477:6ef6:12f with SMTP id
 d75a77b69052e-4801c2c1051mr41589821cf.3.1745597683786; Fri, 25 Apr 2025
 09:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423174634.3009657-1-edumazet@google.com> <895d688d-64aa-4321-9978-8773e726aee2@linux.ibm.com>
In-Reply-To: <895d688d-64aa-4321-9978-8773e726aee2@linux.ibm.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 25 Apr 2025 09:14:31 -0700
X-Gm-Features: ATxdqUE1C9ZM_UZXHwH0YNfUDKCaPD-3_ZcGihlRCOx8hZrppUWQPQTprHoRcRM
Message-ID: <CANn89iLgMFeVz3nwpe1=tf6DbQGi+M9EaUcV=-5-iGQ6QtgxxQ@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: reduce false sharing on sched_balance_running
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>, 
	Yafang Shao <laoar.shao@gmail.com>, Sean Christopherson <seanjc@google.com>, Josh Don <joshdon@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 9:05=E2=80=AFAM Shrikanth Hegde <sshegde@linux.ibm.=
com> wrote:
>
>
>
> On 4/23/25 23:16, Eric Dumazet wrote:
> > rebalance_domains() can attempt to change sched_balance_running
> > more than 350,000 times per second on our servers.
> >
> > If sched_clock_irqtime and sched_balance_running share the
> > same cache line, we see a very high cost on hosts with 480 threads
> > dealing with many interrupts.
> >
> > This patch only acquires sched_balance_running when sd->last_balance
> > is old enough.
> >
> > It also moves sched_balance_running into a dedicated cache line on SMP.
> >
> > Signed-off-by: Eric Dumazet <edumazet@google.com>
> > Cc: Yafang Shao <laoar.shao@gmail.com>
> > Cc: Sean Christopherson <seanjc@google.com>
> > Cc: Josh Don <joshdon@google.com>
> > ---
>
> Hi Eric.
>
> Please check this thread which does the same thing AFAIU.
> https://lore.kernel.org/all/20250416035823.1846307-1-tim.c.chen@linux.int=
el.com/

Ah perfect, can we get this merged ?

>
> You could also try:
> https://lore.kernel.org/all/82baaf6c-f3d9-4c3e-be69-24389eadb18c@linux.ib=
m.com/
>
> Thanks
>
