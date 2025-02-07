Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A216E23ED56
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738938437; cv=none; b=iZHv0rTPD+kEdXFZmtX1T+AijVliAiZXpnIaW0fMwhRcdoxLeRulpKFiurOwbEj4ccWqjQdVl2C9hwOFvWB/G14n6jK+2kDm8TccOqdhAXmlkFEU7AOgc4mYE70Soq/53EANEjNKVJO/Dlnoq2+X+jaUmvf3BALckvfZalvpOPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738938437; c=relaxed/simple;
	bh=o6BN+jhB83FXgQx0sjPW6xCk7t4A/VHNdAvjUSUvNlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axf/K1onQfmY2NetLrf0n8ILN+I1KbU90guJ66kXfGpxiZdGnl0mxgq9P9ioXuTDOLEtsr/NL6J4p/H8c6mpabYFViCqyGwplYWXtgfx1tZ0GcIuZbic8s2qWGArRvizrOiGty4iz4i2T9icycwgk2fQzG3R+RimLDLLPOyTTjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I8jeOTYq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I8jeOTYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738938434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SH1o+QthuKm+KhFtIEw5lEPiGz/yk5zmirl7sfBR7Ls=;
	b=I8jeOTYqFz4B6XTEH/NcLvGolEqhNFy230a5xLLhteUJ9BB3TW0j/mcDxSisCB74WNVMZW
	XwXoufrZC6PRIoPA6NhBJMzCywZ9MUSFUPnpvdKWQwGL/9sA3kp9bYUrUj4dqgBOw+Ayk1
	/65DZMv398j9qtLu/fkGXjC3cB5UJWM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-pWbZ_m0vM2GuL3P5uCkvLg-1; Fri, 07 Feb 2025 09:27:12 -0500
X-MC-Unique: pWbZ_m0vM2GuL3P5uCkvLg-1
X-Mimecast-MFC-AGG-ID: pWbZ_m0vM2GuL3P5uCkvLg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dcd8ddc5eso409374f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938431; x=1739543231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SH1o+QthuKm+KhFtIEw5lEPiGz/yk5zmirl7sfBR7Ls=;
        b=OcEukX2AuwItZek+VomgCzhlHHJcKwdW3LWzsXaZErWRhSO3l7G/KF+gdmMUoVyfP/
         Ul3x3jd8a0GF4v4O0bYNOM5iOWvJ4EPR8bbPZTZQ3OJPz1PtALMgaO1M66JXQjQpaXdA
         iVWfpJ3sWhI5qOw5GmLOpdTQZ8WuKOgQMbqS1KEzGWj+0Um5uP/3MyF7GvYguVas4DjY
         A0e6eNPsi3f4mB864jrGTy4HY2AvF9W+rd87Eld4mqtB1MiUw/03oYYw1yTjzKjzLLES
         amiw4pqfPjxtg2iTnhfrvAkwvbvfW6r+vrElbJh6+QVd7v7BJLb1wGUwF28gMsn48KZd
         g6dQ==
X-Gm-Message-State: AOJu0YzFnyWwy8rOj+f8ymwzh8TfFdgHnkXgdkj1Qduwt6Fp7x7o+T5/
	8jGqrxB2DKJpY3KC2F/idPOm8ATiLjv+rDWP/SZr6QfW+xOXXtzJTE9WRKHam3EdpX6pURqJWJc
	/RKPQw1dRoR/jPhknSes4VBAMoTvQWJvSNqlwo1YRSOTCy6k2caOn/4ATj/myKA==
X-Gm-Gg: ASbGncsF1n4itz0YRjQox/j9xvdZwsGGzWo5unuv2yhbd2QyiPhCPbXE6DhYhaKM7Wt
	Y+VhjYrWgH04TPMJdkkKEgGVcMRq9ijr8CL0FWupvTeAwDlHCrwdsSgZ6b2CKJFbsT7ap47hxPy
	Bp59Pkezxq8AymknYJCNkUPSj9ZOKhgkWRdIWriP7nFT90PS8ciRbUZbER3LxPrQe3VrhTPU8Kg
	O6qX0AJ1qcS7Ez2Ba2ur8hYO7n720+ruwfG8S6oFDmspLXVwzSoF0W9PYpc2dxyMa5bekPYrocG
	WFM57dz2didNd3ZZo6ihCrghlVaBUe9ssmue
X-Received: by 2002:a05:6000:1865:b0:38d:c779:4d75 with SMTP id ffacd0b85a97d-38dc935bd55mr2516127f8f.45.1738938431345;
        Fri, 07 Feb 2025 06:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFamBmDU9sldtKn3KhsqrmHnnObiks3DUVer0lNyyYTJiTdK6lOwaF2zwuT8fULoQeZ1rmkaA==
X-Received: by 2002:a05:6000:1865:b0:38d:c779:4d75 with SMTP id ffacd0b85a97d-38dc935bd55mr2516105f8f.45.1738938430935;
        Fri, 07 Feb 2025 06:27:10 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.128.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da965a6sm56685805e9.6.2025.02.07.06.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:27:10 -0800 (PST)
Date: Fri, 7 Feb 2025 15:27:08 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-trace-kernel@vger.kernel.org, John Kacur <jkacur@redhat.com>,
	Clark Williams <williams@redhat.com>
Subject: Re: [RFC PATCH 00/11] rv: Add scheduler specification monitors
Message-ID: <Z6YYPAiM0itlIVAH@jlelli-thinkpadt14gen4.remote.csb>
References: <20250206080952.98478-1-gmonaco@redhat.com>
 <czykavxpz46nwnelml6yorg3tvmyjvczqogeuqzji6qrfd2peu@qxr6wucv6mrj>
 <847c962745ef5bce757b9ae257ae279913ac711c.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <847c962745ef5bce757b9ae257ae279913ac711c.camel@redhat.com>

On 07/02/25 12:36, Gabriele Monaco wrote:
> 
> 
> On Fri, 2025-02-07 at 11:55 +0100, Juri Lelli wrote:
> > Hi Gabriele,
> > 
> > On 06/02/25 09:09, Gabriele Monaco wrote:
> > > This patchset starts including adapted scheduler specifications
> > > from
> > > Daniel's task model [1].
> > 
> > Thanks a lot for working on this. Apart from being cool stuff per-se,
> > it
> > means a lot personally to see Daniel's work continuing to be
> > developed.
> > 
> > > As the model is fairly complicated, it is split in several
> > > generators
> > > and specifications. The tool used to create the model can output a
> > > unified model, but that would be hardly readable (9k states).
> > > 
> > > RV allows monitors to run and react concurrently. Running the
> > > cumulative
> > > model is equivalent to running single components using the same
> > > reactors, with the advantage that it's easier to point out which
> > > specification failed in case of error.
> > > 
> > > We allow this by introducing nested monitors, in short, the sysfs
> > > monitor folder will contain a monitor named sched, which is nothing
> > > but
> > > an empty container for other monitors. Controlling the sched
> > > monitor
> > > (enable, disable, set reactors) controls all nested monitors.
> > > 
> > > The task model proposed by Daniel includes 12 generators and 33
> > > specifications. The generators are good for documentation but are
> > > usually implied in some specifications.
> > > Not all monitors work out of the box, mainly because of those
> > > reasons:
> > > * need to distinguish if preempt disable leads to schedule
> > > * need to distinguish if irq disable comes from an actual irq
> > > * assumptions not always true on SMP
> > > 
> > > The original task model was designed for PREEMPT_RT and this
> > > patchset is
> > > only tested on an upstream kernel with full preemption enabled.
> > 
> > I played with your additions a bit and I was able to enable/disable
> > monitors, switch reactors, etc., w/o noticing any issue.
> > 
> 
> Thanks for trying it out!
> 
> > I wonder if you also had ways to test that the monitors actually
> > react
> > properly in case of erroneous conditions (so that we can see a
> > reactor
> > actually react :).
> > 
> 
> Well, in my understanding, reactors should fire if there is a problem
> either in the kernel or in the model logic.

Right. I guess I wonder if we can find a way to inject kernel problems
somehow, so that model(s) can be further tested explicitly thus making
us confident that they will be able to identify real problems when they
occur.

