Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8537C8BE8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478712; cv=none; b=NqY0+K3m5jXv0vtGYDCnY/tt4KG46UeCb+KEOg5Qt20flQBOWknFqBNgA/ZFyxwKrhNPwjB+nIqWQ8NgzRH/+jDYqtwN5S99fGxJ59oq0q7knLonu8VverWD+055fl9X/NKsUykxloNFNexpy3pGtm5QBR/CKw8ZpB6/+rNTB1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478712; c=relaxed/simple;
	bh=ELnWAAwy11jE8ZnzkqC405qgjyNG6RzhfzEZehEIh1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVG1904lmdhnX+MEkvOChfaUISz7TopHD7oj9eFA1OJuwXGKmMBZ/BFCMtoZXzZmQmoF6JQ+Fo45pgaiGjmIrbbBuyOONFZ3ojLpRV/Gelo+7Kcmy+MTbPGz79zRJGtZd4ywlBfjRH0/TvDOAtHTHwO9UWiWOakTh8fSkto5nlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cyJYDaK9; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cyJYDaK9"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af51596da56so415240a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745478711; x=1746083511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhVSGwrY4UGgX/xUA4xUKHWZLDX+i5rGUGqwbp9t1mo=;
        b=cyJYDaK9YG3xrxKRpotVUPP+1Asek9wnwZvIhEJgrqlVrsHLfsbEN6lzx0bacALz5e
         bfFeqC/09bvqdAEb2gLdo8nBpvhh3gQyMdjMfGdS/4bNluRanLOfEwv4ASG0/w/S/7G3
         ZImygMpnsxoGl7/kwPqGEGO1PupmvX9xpiuG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478711; x=1746083511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhVSGwrY4UGgX/xUA4xUKHWZLDX+i5rGUGqwbp9t1mo=;
        b=GJxZZfAqYILDeQ0cweWjRkEVDblfqqDEOZkjEr2GSebrA1LdsThO6mllgaBMrNCSxQ
         gytQPSG2iHMa8MfC0N9Ag2KPg9eh/wHkE0CUeS3dchKGJ2MRMjUZ1vOMRKxRIPcZd2Uz
         h7r0eG5VUD7/wRba+1rq0XHfhEDbEThVRQ75ogdJfMrLLdwnlbXlRWD141EUJtKHCSwT
         ftHiwecb4qYnAVfeeI6LZdR23cgPsrAA0LSoLSn4ucUcBVFXBNfmjEcsBMHjPpXrKRJg
         0Rq8LoDYa2URs3p1AGo7bm7hpD6Xs1ZqCrG4+Us7NHvS49HUWc6uulJjKZhI2nL4x0ei
         qIKg==
X-Forwarded-Encrypted: i=1; AJvYcCUg4JZ9nFl9SxGOUMwGUuUKxh6VQC9nQwstlCoKGqfyonVovzY/0WkZeFexCswB0aQkZIF4yPve8OU81Js=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiVOknxMa/Gqx6+BxoVLFIauxgV1Yym8UJguQn3W71VT+hzdUE
	1n6T6I7/gtGGeTLECh5JhFlnlMwv3ggkNagOKryg7gUuCt7q/hEWzyvNop8pOw==
X-Gm-Gg: ASbGncvYMB+5F/ZD9ub711LUp4J4oJv0fx7llOHTpb2GOMnpfNo7M2sX838NMNMdHmX
	fH7IHizPzEUjjTZAn+bqmIqWKVReXlVFHIY4/r4KXwvU8rnoSZRhXVFkTsyoOMprPT8+XCURyiZ
	DIOLpchUFOZBerVUChn9/nD3aQ3tx5+zpwazhIvx45n/bHyMrK1/OpQUVH5CJKBKdMNRDMZhPJH
	65j4A5Pnjz9BbK0B7PJAtdBYSeVKwpKdy2MGX2JOi5UJ0gtzgDNPtwxBo0huaT0KCL0938QRtxR
	jQt352M8W5wybeGolgbpUO9oCsFyktEeme2pkPzpDLpu
X-Google-Smtp-Source: AGHT+IEMawr2WqzSq4Nh72R9XrA0V8XpQWHisF1IuwxsJBzLTffeW5m/UWTzJMWbsn4RSmK8zQDANA==
X-Received: by 2002:a17:90b:3a05:b0:2fe:dd2c:f8e7 with SMTP id 98e67ed59e1d1-309ed2703c9mr2572217a91.10.1745478710640;
        Thu, 24 Apr 2025 00:11:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:63eb:6b38:399c:5ad7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309eef7c59fsm582420a91.0.2025.04.24.00.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:11:50 -0700 (PDT)
Date: Thu, 24 Apr 2025 16:11:44 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC] sched: add sched_show_task() variant that accepts log level
Message-ID: <xkd6ztswqkzbg5d2crhcg72gzmuuwiq36y2gyhxjnfmfkk6sli@awptl5aiukl6>
References: <miliiyxmqko6hx66yhdv4nkkopbm73wbz6kxxlzpts53mscqzy@dpfa6y3wnspv>
 <CAAFQd5AYA=7rQjdQ4AS1vjb0Z3zHec6bdbhrA2cW706DHZyhKg@mail.gmail.com>
 <CAAFQd5DgDHLhQUv=Bw0Thd41Di740A_yv+7wxDErE_YpN4CqBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DgDHLhQUv=Bw0Thd41Di740A_yv+7wxDErE_YpN4CqBQ@mail.gmail.com>

On (25/04/24 13:34), Tomasz Figa wrote:
> > > Is there any reason why hung-task watchdog prints error header
> > > with KERN_ERR log level while task's backtrace is printed with
> > > KERN_INFO?  Will it make sense to unify log levels and introduce
> > > sched_show_task() variant that accept log level param so that
> > > everything that hung-task watchdog prints becomes KERN_ERR?
> >
> > Thanks a lot for looking into this.
> >
> > Let me just add that I've been looking into ways to automatically
> > analyze kernel crash reports and I noticed that when I filter out
> > KERN_INFO and higher log levels, I end up losing useful information
> > for hung-task watchdog-kind of problems. This change would greatly
> > help in filtering out unnecessary noise from the logs.
> >
> > By the way, if having it as KERN_INFO by default would still be
> > desirable, I suppose we could add a KConfig option to set the desired
> > log level?
> 
> Gentle ping on this patch.

Yeah, sorry.
Gentle `git send-email $1` on this.

$1 https://lore.kernel.org/linux-kernel/20250424070436.2380215-1-senozhatsky@chromium.org
