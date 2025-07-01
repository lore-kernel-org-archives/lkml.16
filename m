Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22762701D0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366966; cv=none; b=TaRscq4HYVEdPVF8ssS3++9Sxps1O7xguGNqt1UZcwT20yHARRDAQkY0nhRkp5lWNq0EDSH1d6c3OLE+L/pKbvd0XJIkRO7l9x7R1xI2n1Hz7ILTcvLdfIu7AYux7NuX+Md+pIu2oxpHfppRtq1b3+sdhRQvDEF3ilKLjYwKWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366966; c=relaxed/simple;
	bh=Tb3cYvwu3jOtOSrHTY7zaAmDMPwUN6iuvDljCE3cZBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGyojE2TaE9R7VnfDQc+n+lifnIRdzk+eRWJgF2VMrG8+2M5nPQ6VQyM2I4YklnBgpdUVVWjrM+yIlShk6B3au9zPJAFiQTnQx98dg0MSaaXvGKD+a9Q+5xA1SY1xVDxeCLlAAHvorp2o6/kX+C+aBfp3psMe18mmLeHqb9cMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZbyP7B67; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZbyP7B67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751366963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddBFBPzbnf0YkGeiYFfOnISLgT7HwdwnXCPaNqmBGeE=;
	b=ZbyP7B67kIg2VxWy8A8jm1/ruLc3gUFy2r5huj/157foWRHmxJYaGNxmDIQY2/zPedqtV7
	0wmSjEI1STS/uIPyBgLN1lcxxpFqkOGPgr59RsPqy0Cs5z9IAxwGT937DWbgooNjQYOCGW
	lYAglPDkzL0zIYz+0P7me1iaeeSBqog=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-KTTgGyNoOVCyndHTI-qvOg-1; Tue, 01 Jul 2025 06:49:22 -0400
X-MC-Unique: KTTgGyNoOVCyndHTI-qvOg-1
X-Mimecast-MFC-AGG-ID: KTTgGyNoOVCyndHTI-qvOg_1751366962
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09ed509aaso822061585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366962; x=1751971762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddBFBPzbnf0YkGeiYFfOnISLgT7HwdwnXCPaNqmBGeE=;
        b=PvBIU6X0QmdUsBmhLa6cTu0zqltPcNLkzkrJkzUpNTUknzWeAbsoLqJlUXBxPmwuJ/
         9wSDnc0XWnrSdBsBRpCwj/1Etvn4mNAk8s3BzN9dZo5xo3RvhQC+oZbKhrKWUZfvDFBH
         Fps3ddQZIDzVNKu04AQiwMbO4N3Wj+qyt8fez5GITWaXKbPHP92ai6i5hfZlV87YESNl
         LnzgAZKYvX3mVVbdnEOUOgSrrNOUQ/HXeElQw0mNUfEn6VEW4Dh+fhRo96VeqkQ4nZrP
         SCq3fSCz+rRQYxms+t6B+MSI/qn6TiQJtPdH1Ay06YK9aI48foB5hTSq+/O5mbCj0TTZ
         +dkA==
X-Forwarded-Encrypted: i=1; AJvYcCUgamHQLdWvsvbu8yS7QYthOQ00Jm/IIW8ccWlKQx6jfY2MIL9xorvVfYRpsoXQPBuZLjHeCZS3BPSVgoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6rUc2yVaLw/U25FTTlhAr6dsvByi0MPMayNJJLGShrCukbeRG
	Z0rF9qHNMaC4cD4brpI60ehnvt8OgXIt4kYYQl+pVap1/O4UdfyZU5RcPtIdJDb1fZwh/mZI6lk
	YCHmELFwz72u5y5FZcQ5W301Lk05ICtQitfFQlTsrakKYqZBEwwVIHc3DWZLrtjC6fQ==
X-Gm-Gg: ASbGncunOefWDCcBUnSIJnqZT1g6d+UILq7Juic7aaOatf1GOirP/bMBEiTBZuDih0n
	QWTjq98R4tmp5uILD8CeVnTlQrwlbFkuOSYCiLC3lv6hOcgdItj+qPrnGo1KYwHRxgH0aYmSswk
	nXFZirQI7NYo9fH6+EeSrYrM/W+xp3vP3/+UpVXosa5crXzjSqhwzXxcYVIuxDbUKcnDOJdPahn
	VvNJIQSaZ8LHSjtRrhwqznlBGt8qoY8wkqwW9OYxonEemHsihjoxYUBD2GKnwOJDMBGYTxKdidq
	+G1rKagcBmdZCQ7MJf67Ip1MlybjUIGC0K7JLuNe6ZSz+fOJzSK8sgTk9k6utgOMd6zB4oEqX1G
	2oWZcog==
X-Received: by 2002:a05:620a:3946:b0:7d3:a66d:4f3c with SMTP id af79cd13be357-7d443920b10mr2626489785a.7.1751366962093;
        Tue, 01 Jul 2025 03:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnx1+CJslWQPujj9MUyy/pZg3IhJl9cLZ/bmEw7NJQYC0MyetSF73gR/8qFtva/Zgbza2a/g==
X-Received: by 2002:a05:620a:3946:b0:7d3:a66d:4f3c with SMTP id af79cd13be357-7d443920b10mr2626484485a.7.1751366961461;
        Tue, 01 Jul 2025 03:49:21 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-2-102-80-182.as13285.net. [2.102.80.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443167d48sm748686385a.32.2025.07.01.03.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:49:20 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:49:15 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V4 1/1] sched/deadline: Fix dl_server runtime calculation
 formula
Message-ID: <aGO9KyiJNAm7DLb0@jlelli-thinkpadt14gen4.remote.csb>
References: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
 <CANDhNCorm58L9CqHyNORgfk=++HkCttmyCkM23Pn8rXV7cF41Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCorm58L9CqHyNORgfk=++HkCttmyCkM23Pn8rXV7cF41Q@mail.gmail.com>

On 26/06/25 19:48, John Stultz wrote:
> On Thu, Jun 26, 2025 at 7:28 PM Kuyo Chang <kuyo.chang@mediatek.com> wrote:
> > In our testing with 6.12 based kernel on a big.LITTLE system, we were
> > seeing instances of RT tasks being blocked from running on the LITTLE
> > cpus for multiple seconds of time, apparently by the dl_server. This
> > far exceeds the default configured 50ms per second runtime.
> >
> > This is due to the fair dl_server runtime calculation being scaled
> > for frequency & capacity of the cpu.
> >
> > Consider the following case under a Big.LITTLE architecture:
> > Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> > scale-invariance defined as below:
> > Frequency scale-invariance: 100
> > Capacity scale-invariance: 50
> > First by Frequency scale-invariance,
> > the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> > Then by capacity scale-invariance,
> > it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> > So it will scaled to 238,418 ns.
> >
> > This smaller "accounted runtime" value is what ends up being
> > subtracted against the fair-server's runtime for the current period.
> > Thus after 50ms of real time, we've only accounted ~238us against the
> > fair servers runtime. This 209:1 ratio in this example means that on
> > the smaller cpu the fair server is allowed to continue running,
> > blocking RT tasks, for over 10 seconds before it exhausts its supposed
> > 50ms of runtime.  And on other hardware configurations it can be even
> > worse.
> >
> > For the fair deadline_server, to prevent realtime tasks from being
> > unexpectedly delayed, we really do want to use fixed time, and not
> > scaled time for smaller capacity/frequency cpus. So remove the scaling
> > from the fair server's accounting to fix this.
> >
> 
> Thanks again for revising the commit message, this version is easier
> (for me at least) to follow.
> 
> 
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..96a21f38fcc3 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
> >         if (delta_exec < 0)
> >                 return;
> >
> > -       scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
> > +       scaled_delta_exec = delta_exec;
> > +       if (!rq->fair_server.dl_server)
> > +               scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
> >
> >         rq->fair_server.runtime -= scaled_delta_exec;
> 
> As I mentioned earlier, I still don't see this conditional as making a
> lot of sense, as I don't believe there is time when this function
> would be called and (!rq->fair_server.dl_server) would be true.
> And even if there were, I'm not sure it makes sense to scale the time
> interval based on the fair_server.dl_server flag.
> 
> From a separate discussion, you highlighted that it might be useful
> once we have multiple dl_server types, which may want scaled
> accounting, but I think in that case we should use an explicit flag
> instead of the dl_server bit to denote if the accounting should be
> scaled or not.
> 
> So, since your patch is a fix for a pretty bad bug, I think it should
> be focused on fixing the issue in the simplest and clearest way for
> the existing code, and not be too worried about integrating with
> future changes that haven't landed.
> 
> Then, as those future changes land, we can see how best to generalize
> the decision to scale or not scale the accounting on a dl_server.
> 
> That said, the conditional is a bit of a moot point, since I don't
> think we'll actually hit it, and I'm motivated to get the bug you are
> fixing resolved, so I wouldn't object if this went in as-is, but it
> seems like it would be much cleaner to just drop that conditional as
> you did in the original version of this patch.

I agree. It would be better to drop the conditional.

Thanks!
Juri

