Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6424123F262
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939660; cv=none; b=TRcAoPfi/wvjztDGh30mkLyz+I6PkeS454uJsjooXGxhJkV3jxAZsGNg6RSRWKSUNAlEVrEfiWV8SfHIBWZ3fsVZ9jyzcHBbpOsukPQuPq5FFy1gwZHHY5bk/XzvAPX2wjmKNGNl0sVA/3OdYe1cIotQM+FjfPMcq8udtluMu/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939660; c=relaxed/simple;
	bh=4RzRWhPUAVTh44sBQz5oaGdRaEsluRgEDlbi7AL24bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1kER59r/aHMx7Trtvo0q0Bf99pwqN9TXHQyTONYCBiVlKwzLotyByWovW9DmhmDEVYt5xl4pZTBGpb8ujIcBBqzw8tYyfnohEeihGvz0lebYLec5soB0CRY5wi88SekuRutmf8CcVqdP9tec6OEi5wwlnT8MT5rfRU5SyFhvWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D6aKlY6C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D6aKlY6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738939657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8bv6etYsyi7Sbut9bO5Una9NY4dIImLZ4Vx56C3VC9k=;
	b=D6aKlY6C/DVlq5zbYERR2noMCD1vL1yTl0wLogDfM3HcqA6G0wb8p2WjQaBtI/44WVX22H
	XZNyAnF9LC/ez+TF9+N4FE1Z8klMmVxpdoy/dfCojm9Orxh2urHbKG7mVkc/riiqhqECYS
	gBSUsgWnlIrOT2BaaqE5BjWeIsNvgxc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-LMv5HxPcNsS1atmef1M9Jw-1; Fri, 07 Feb 2025 09:47:35 -0500
X-MC-Unique: LMv5HxPcNsS1atmef1M9Jw-1
X-Mimecast-MFC-AGG-ID: LMv5HxPcNsS1atmef1M9Jw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361b090d23so12327705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738939655; x=1739544455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bv6etYsyi7Sbut9bO5Una9NY4dIImLZ4Vx56C3VC9k=;
        b=mjt1V7nypGHVJ7ehwCFhYltXGbSBkS0AkHjLog3OtmTdXbS4TxeOeCyE5BvmLcFmIU
         9lbRVP+d5JwW1wi+M+OpkmeXBoarSZHa0uZ+BoBVkS7ud8cImrQe1ko4PsXRbLwtBxkL
         jJokMSiVDLA8KeOYjtjkv6OeK3chFDrzwmN01YhE3g9gKPbp6rg36wakxo81JWnyYRo7
         LJZODe0hLkuHBie13Etr5atSBnLiTogHv4sWg28bqMjxYqSdSdkzAjmC5+Rb165iDrDP
         MZOQpmV1SEyaiXxnA15+F5aXBdmY+YzSrN0yK1x8XVQ+zs+9mvvQlMvEiTJ2cS5RKsnU
         ucHw==
X-Forwarded-Encrypted: i=1; AJvYcCUJMHCDJa0hQel9suQI7bIMnkHEdXOQYliZxWZylrkStkgGfVROItPHkENFnv93DYBI/9CpeM6fvBpsjbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIo8M5f5q73pZnIFgiuvJNUjXkCr9fcsgzlNeWYpaHX4jCTL5h
	eBRHNmADs0762EPqv9qAI32j4lne+xUhoRzz5OeAQN/rzvmUEWreM0xBAyreanNAlpsueYIjThX
	Y7mpOVh8Pizd23GH2V6uP9jwdlZk8M0fF0Q/NVhxm7tyN6Qo9VEdZDYLOcec9hg==
X-Gm-Gg: ASbGncv42odGM6QGnmxzLKIctFp/lWj+1BrMo4ZTOhYDa+OM99I5Im63hL9onG3yjI6
	CdzpCx7AFH2ioRTB2Dn0dJDnl1w570n9nvaiPtVQgkwRO01HX6DXVZiQHUMxqknS1q9k7zFzfEA
	bv53hBG32Z3yDjPzQ5WsL1CGlqt4IredIVnaCMgyared68EsNBO7CcDQulubtv4FuEXk9bsdcyS
	NBSbDdf3IZBEqtdRK++oWqxK+OAz/UEY/Lbx7L5O79pfgl7f4KnfQKb1V4S9l/KbCW32aWtsaWU
	qvx4NzosGaLFV+b1NeBJTv3aAJmt2uGcGaB9
X-Received: by 2002:a05:600c:19d4:b0:431:44fe:fd9f with SMTP id 5b1f17b1804b1-439249b04e3mr29202005e9.23.1738939654677;
        Fri, 07 Feb 2025 06:47:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWSVFSye6dX0ZwjCow7MoC4gB4PaOUH9jwh4iqCn3EXYOKdOj/sEqkc/gAHwhMy+CsaAV0Xg==
X-Received: by 2002:a05:600c:19d4:b0:431:44fe:fd9f with SMTP id 5b1f17b1804b1-439249b04e3mr29201855e9.23.1738939654304;
        Fri, 07 Feb 2025 06:47:34 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.128.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd4df6bsm4766122f8f.39.2025.02.07.06.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:47:33 -0800 (PST)
Date: Fri, 7 Feb 2025 15:47:31 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <Z6YdAxNRRbynfqEo@jlelli-thinkpadt14gen4.remote.csb>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203142743.GI7145@noisy.programming.kicks-ass.net>
 <20250203155114.YVGnCHUT@linutronix.de>
 <20250204103447.GU7145@noisy.programming.kicks-ass.net>
 <20250205083926.etxnZAoP@linutronix.de>
 <Z6XVLqexaKZr0cy1@jlelli-thinkpadt14gen4.remote.csb>
 <20250207110050.stt_l7KT@linutronix.de>
 <20250207110634.GC7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207110634.GC7145@noisy.programming.kicks-ass.net>

On 07/02/25 12:06, Peter Zijlstra wrote:
> On Fri, Feb 07, 2025 at 12:00:50PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2025-02-07 10:41:02 [+0100], Juri Lelli wrote:
> > > Hi,
> > > 
> > > On 05/02/25 09:39, Sebastian Andrzej Siewior wrote:
> > > > On 2025-02-04 11:34:47 [+0100], Peter Zijlstra wrote:
> > > 
> > > ...
> > > 
> > > > > Anyway, none of this solves anything when a process has both an active
> > > > > RT part and an active !RT part (which isn't uncommon AFAICT).
> > > > > 
> > > > > Then the RT bits will still get interference from the !RT bits. Do we
> > > > > want to complicate things and consider that?
> > > > 
> > > > I don't think so. The active and inactive are common but it is still the
> > > > same process so you can expect it. The ugly part is when it is an
> > > > entirely different task and it is random which one it is.
> > > 
> > > Not entirely sure we are thinking about the same situation, but it looks
> > > like we have cases of RT tasks that are affected by the underlying issue
> > > this set is about because they make use of libraries. So, in this case
> > > we have a cross-process (RT/!RT) situation that I am not sure we can
> > > address sanely. What do you think?
> > 
> > I wouldn't advice to use "unknown" code in a RT application and even
> > threads. Audit libs before using them and not just collect them.

Indeed, that is the message. But, you know, existing/legacy applications
or applications "repurposed" for RT. :/

> > A lock without PI in your RT thread is not good. A lot of locks, not
> > knowing the "locked" time, also not good. Things that work most of the
> > time due to the fastpath and only break from time to time.
> > Also, a thread does fork() once during start up and things may continue
> > to be good but may catch up eventually.
> 
> Anyway, supposing people want to tinker, it should be possible to split
> the local hash based on if the address is mlocked or not.

So, fully agree that we don't want to implement changes just to target
current broken usages, but wondered if there are saner situations (Peter's
point above?) where the current idea might be further extended to.

> This gives some obvious issues where people do futex_wait(), mlock() and
> then expect futex_wake() to still work, but that should be rare. You
> typically mlock before you start using the memory.
> 
> As always, mlockall is bad, do not use, like ever. But especially in
> mixed mode RT programs.
> 

