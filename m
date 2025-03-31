Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2803136352
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743392611; cv=none; b=Frtsa1DkYvg0OQ7lTd2B3x0ANulgwEc6YOfS+LCcqpHHgAiihI0nA+ejExNIUIbco78aX8yf3stMAQtYz1P3/WBbkiR8ydwqoUV6Rn8QHUaSUhraO4qZjTZjy/KqiH/YWxVchCvKJcl9gudEbDIlYBJeWdWKCaq4Y+aCyPDjBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743392611; c=relaxed/simple;
	bh=5drt4LDcreC6eYFo2jy59Tu6vHmXQWJ9K7QNANTC9og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4QmMf/4MY0PZFSVyGG4JVa6uEMXpUcqsmPoyOrsdy3rkCiidY6PVm+5f28iekKWhKswMexwO0lQVOfOJyjzOBZWwaatsXRoMTxUIIk+R/BupH6lNkqhmrsIn8teAPMc/cNwBcAfw7NdIJ15nWbXt0e07KX6t9lwngLEpk3mSIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uSu1F0Cm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uSu1F0Cm"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3b12e8518so772999366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 20:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743392608; x=1743997408; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VIgce8rYt4aTtV7PAuyGh5tPMio2I0JJh7iujL/QKs0=;
        b=uSu1F0CmwU/LvdU6NgDNgYsF+E0lnV6fQFFUI/0te+sI9+6gdC6aFdTQgbqrGNl59b
         BdBdbaIfc2Rm0RfKRjl+xfEIp8cBUGwRXE/8XHXaIiduQILJqSX9830UnPQ9bo2K4qct
         oGdey9kGm4JrDv7C8YAZB8q4BvPiEiLNKu9fhj4jwmOP7EVxjCS5n8y5tAYGu6WYrFHU
         ZvJyHsNnLmuA6//GCwSSaiZVHrairb4xiACKtr29Q7FFZ4mc122e9Oxz+QIVm/TBCrlb
         Rk8Nl4iXeKGO2F/j5eKfPHaS0P72y6qZfl5F+N3/sfRoPIYYReG1Q2sPX6bhc7lZ5TjR
         Y8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743392608; x=1743997408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIgce8rYt4aTtV7PAuyGh5tPMio2I0JJh7iujL/QKs0=;
        b=FDA7+8d6AXib8/o5LpZepTkNhjpXx5YHkzKCTBQd74nOEmVZspHMCX5x3b7LKeYY83
         oZCRShpIW2kvMKSRl6nLMu8LsgIIUUVK1Bnm4Xgtj6OFiP5/HNW/osGbu4WGauzEerHU
         4fmz9UFMwUM2EwBEwuUF3c26wmuCWqRytyKTTab63i3GIYNEE62OW99NaY6ykYnJARV6
         ahu72L9xwTagQ5xUuzlm5+gJ/tv8gFWwStX0TWWnqtGAH5JY5liJ6ocSGzAcERWWlBON
         MIAVQIAeq09BWu/9WBeIZu8vuFPbdVb44LHJcBpNMHn4dA4e7ayud1atA7ujnGTImo1A
         5x+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVn55snBu+lz7LRYtKo8Y/ED+bsGv87x1n+65H9L+yBr3X4ypeO9AKBrxS5+/Lj+/CBuIwrLDU5wQ9Nq8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoMmvY+U2pTqKNAXt2C9UV2mvQsw7UYMAGu+agqgHf+DEiEIoM
	0+dKg5pHfDpXAunChSbUTvFE+mODKpkIx4R4amxP1mtUXXP9b0ROIpIiXjWRCE8TLZt5zXbvP1c
	ie3oK0VdVbkAVcn0rJpsgHA4vX8H7J3DK3Ir8
X-Gm-Gg: ASbGncvjgcQW98eLxXs3qPnis3EhokZUe0BDapddkzH5nwJHxNIsXS8ueIS0j76IYvE
	ZwWKeCghTgJon1a9BSOFGo9FpCCW3kBrU0VeHoNKDPdTMh3tpXqxsnwyDYqpXVWIkzcujIDr1BY
	cPJFwZroCLLQmLIntSizB1Aw==
X-Google-Smtp-Source: AGHT+IESsld6VWFECGofP9BceQ8i/cdTOJdsfLxIy+vnI7DUGPMG0XrgDjfQez9ovs+KkU9eIO4UhtoV2gr60umX7eA=
X-Received: by 2002:a17:907:97c9:b0:ac4:3d0:8bc6 with SMTP id
 a640c23a62f3a-ac7389e1864mr648782866b.13.1743392607844; Sun, 30 Mar 2025
 20:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331022011.645533-1-dhavale@google.com> <20250331022011.645533-2-dhavale@google.com>
 <45548d9e-4cfa-476d-9eaa-b338f994478c@linux.alibaba.com> <CAB=BE-S6Brg0e277mdY-d3ZwrGeUe3idz37_FJVaTesAFTGfnQ@mail.gmail.com>
 <330276be-f9cb-4263-85f5-20fe2e10cf72@linux.alibaba.com>
In-Reply-To: <330276be-f9cb-4263-85f5-20fe2e10cf72@linux.alibaba.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Sun, 30 Mar 2025 20:43:16 -0700
X-Gm-Features: AQ5f1Jqr6eSN6rYZq4yyqWPR_jex1f2WbOqmzkzHp3p9RSlj0nqOhUgFQiq1T-g
Message-ID: <CAB=BE-T_W_EFndyKN-61b9eup52YZw0M_OuTL=sOsZH3QFkrRw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-erofs mailing list <linux-erofs@lists.ozlabs.org>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

>
> Is there a real use case in Android like this?  It
> would be really useful to write down something in the
> commit message.
>
No, not that I am aware of.
I was just trying to cover all the possibilities.
> >
> > Can you please expand a little bit more on your concern
> >> it could cause many unnecessary init/uninit cycles.
> > Did you mean on the cases where only one erofs fs
> > is mounted at time? Just trying to see if there is a better
> > way to address your concern.
>
> My concern is that it could slow down the mount time (on
> the single mount/unmount) if there are too many CPUs
> (especially on the server side.. 96 CPUs or more...)
>
Yeah, that would be slower.
> Or I guess if kworker CPU hotplug is not used at all
> for Android if "suspend and resume" latency is really
> important, could we just add a mode to always initialize
> pcpu kworkers for all possible CPUs.
>
In Android CPU hotplug is used and has been working for
couple of years without issues for devices. This was brought up
to me for the devices which are not using erofs yet.

I will take your suggestion and work on V2.

Thanks for the feedback!

Regards,
Sandeep.
