Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C317404E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190946; cv=none; b=ISmFlBu4hqRsQWd0ploMjhlgdo9LfVDwce8lAeX3JshsSghhUbn+qXEpsrIG4iimZH0muVXq1Fq+EuLUVhGdIIIn2iDLgTv1/zUMjnOGXFJUnqk3zOpXMf50y2LrGV2ku1uJEUkFAZGZ5M5oxm69+xmSUB3qb8MfdfOapz3iRyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190946; c=relaxed/simple;
	bh=TIbxN8c6UGZ/5yzJEIFAR/xG+vFEg25KVq8uNJI1dlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0svYgY1L/vC4fJVZluTH/C07TFnlJti3W8liRa2kk20FGdQcK5o/LTdZzeIbJrZgSFLSy+edpD1Jp2wesX2J/G1TqxvlJlqj2qIRS4LQj48w2cYUbAoQM0qDxuLcMCGSHOS4UFGera8aYw2aVip5u2DsHL5/403yo2eCOWgK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RuP1oGUj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RuP1oGUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746190942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=odfVdM8YPnyNrSpkrWxxjrSq/dURDuUZftAxCKPBm0k=;
	b=RuP1oGUj0SmblDpWC2BupW4oCaozOCHCi9V87MqwCkA76xpE6KWcVF3V+YgabMvlrCynIP
	19nh5c1XlEWYlEEpYEM8HAMhOWB7MFPaEFbANCQzNZEmKWmx/bitmMVbEQiWSO9l6dzNKp
	0669qjGv4iTNdOX/uWSCrQ1npSrSMdY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-qgih-ungPJiKEnVDBXeJVQ-1; Fri, 02 May 2025 09:02:21 -0400
X-MC-Unique: qgih-ungPJiKEnVDBXeJVQ-1
X-Mimecast-MFC-AGG-ID: qgih-ungPJiKEnVDBXeJVQ_1746190940
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912b54611dso899362f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190940; x=1746795740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odfVdM8YPnyNrSpkrWxxjrSq/dURDuUZftAxCKPBm0k=;
        b=wa/bCwfYrGXOm/BMWF3wAuzm+oPAj83LGywMr7+bgJEa8TsEQ4qxpAEW//7q9Q3G9/
         TU9UbNi/l5Ux5+xXcXEYSKWM+Y/a0gkXWdj4o7YeVHt6QfmNtR3ph4wPx4BdUK4O34d+
         3+/tZvH7Rjd80kKD93sBQJKU6WmJqXQQ5GXYGhhycjcrbwBqujaUFfug2GMZE/pGJU7c
         D71hzzx+62iI7FiWYZXKKhbdvPqM9rPKPJgj6RGSGogXC2RV0xoKmtUYerXNEpkZYtwI
         U40eBrhwE5fBzOoZUT2QT/AYAPKHkZoCyVJfFZR9Weo0kwQUNwZWo3pozo1dVQGRGnWr
         oRNA==
X-Forwarded-Encrypted: i=1; AJvYcCXqdmwgnimXwvgOVs8MA/Cx/XjYUH3NVfaCaZRN2q0NGSGOtvdOcaJrEg1Gi0hr/I7u3kScnkybzGIE17U=@vger.kernel.org
X-Gm-Message-State: AOJu0YywuGwrgUqI2GJInySl1CjERpGYTKgTMBI+PRtTQ6AiEr4AuMa7
	nDtWxaS5k9Jz1Zj2HP6IYXv907uFgt7WjiRlHHxCvFpd7H1p0s9djhr/Irq8oCh4uVsctR4M1KY
	ReHJI9LWgxnQ7PEdiB8G7AkXG5JjWF0KtTi0AbfhToaeKBUvkXRSQ2XRsqvC0uA==
X-Gm-Gg: ASbGncsYZ86vY/2JwziF8u6dzByLIpGxvUlCxWKfe9gv0+eNMlOGRbeBZJgkvzP4aMq
	r6kuSFkKeWjGmtYHD5okLWyd5mUm4SoUuGVEJ8WV12yjcREOhwHhNZuANJ1R5bidOijrBodE6yG
	JMiwJpIh2TTFC8UTeVYmfMMRN0hnpG+o0cpkYKI6Cy+FP/54oX7CamoLZIwcGg/LAvzJq+9mON9
	fHgo3pGwNPdXK1I/kt/dVzYUOGNj0Sf9GoeovFE8jUbKIC62B1h/lmVQcwy8F/9nfdi5/Ea5XGa
	j562KNwFpoIixV5uxGwGyciHZPqS8l2TD+xRcXBLzw==
X-Received: by 2002:a5d:5849:0:b0:39d:724f:a8ae with SMTP id ffacd0b85a97d-3a099addfdemr1602146f8f.33.1746190940013;
        Fri, 02 May 2025 06:02:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOK5ZDN888Pg/A2eXXlLYfRzxbhnr0Nb3MEmG+0cje3ji4+2S15fFApo4p1SIFb+sNeFO6TQ==
X-Received: by 2002:a5d:5849:0:b0:39d:724f:a8ae with SMTP id ffacd0b85a97d-3a099addfdemr1602084f8f.33.1746190939227;
        Fri, 02 May 2025 06:02:19 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.10.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b171b2sm2062594f8f.87.2025.05.02.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:02:18 -0700 (PDT)
Date: Fri, 2 May 2025 15:02:16 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Doug Berger <opendmb@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/topology: clear freecpu bit on detach
Message-ID: <aBTCWPSXgu9cId6D@jlelli-thinkpadt14gen4.remote.csb>
References: <20250422194853.1636334-1-opendmb@gmail.com>
 <609e6fe5-2893-4c13-8e52-e9df05146ffb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <609e6fe5-2893-4c13-8e52-e9df05146ffb@gmail.com>

Hi,

On 29/04/25 10:15, Florian Fainelli wrote:
> 
> 
> On 4/22/2025 9:48 PM, Doug Berger wrote:
> > There is a hazard in the deadline scheduler where an offlined CPU
> > can have its free_cpus bit left set in the def_root_domain when
> > the schedutil cpufreq governor is used. This can allow a deadline
> > thread to be pushed to the runqueue of a powered down CPU which
> > breaks scheduling. The details can be found here:
> > https://lore.kernel.org/lkml/20250110233010.2339521-1-opendmb@gmail.com
> > 
> > The free_cpus mask is expected to be cleared by set_rq_offline();
> > however, the hazard occurs before the root domain is made online
> > during CPU hotplug so that function is not invoked for the CPU
> > that is being made active.
> > 
> > This commit works around the issue by ensuring the free_cpus bit
> > for a CPU is always cleared when the CPU is removed from a
> > root_domain. This likely makes the call of cpudl_clear_freecpu()
> > in rq_offline_dl() fully redundant, but I have not removed it
> > here because I am not certain of all flows.
> > 
> > It seems likely that a better solution is possible from someone
> > more familiar with the scheduler implementation, but this
> > approach is minimally invasive from someone who is not.
> > 
> > Signed-off-by: Doug Berger <opendmb@gmail.com>
> > ---
> 
> FWIW, we were able to reproduce this with the attached hotplug.sh script
> which would just randomly hot plug/unplug CPUs (./hotplug.sh 4). Within a
> few hundred of iterations you could see the lock up occur, it's unclear why
> this has not been seen by more people.
> 
> Since this is not the first posting or attempt at fixing this bug [1] and we
> consider it to be a serious one, can this be reviewed/commented on/applied?
> Thanks!
> 
> [1]: https://lkml.org/lkml/2025/1/14/1687

So, going back to the initial report, the thing that makes me a bit
uncomfortable with the suggested change is the worry that it might be
plastering over a more fundamental issue. Not against it, though, and I
really appreciate Doug's analysis and proposed fixes!

Doug wrote:

"Initially, CPU0 and CPU1 are active and CPU2 and CPU3 have been
previously offlined so their runqueues are attached to the
def_root_domain.
1) A hot plug is initiated on CPU2.
2) The cpuhp/2 thread invokes the cpufreq governor driver during
   the CPUHP_AP_ONLINE_DYN step.
3) The sched util cpufreq governor creates the "sugov:2" thread to
   execute on CPU2 with the deadline scheduler.
4) The deadline scheduler clears the free_cpus mask for CPU2 within
   the def_root_domain when "sugov:2" is scheduled."

I wonder if it's OK to schedule sugov:2 on a CPU that didn't reach yet
complete online state. Peter, others, what do you think?

Thanks,
Juri

