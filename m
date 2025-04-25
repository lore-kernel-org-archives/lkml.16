Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761261B6D11
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571740; cv=none; b=oqjvKFF71XpdJvQliIE5ClQCNjvFVZXN7p1a0ra2Ocv9/UrMhSyRZbl6620ehJWvIRYfVb9nQbTWzj/drLRCFTr/VO2mId+vv411B+q2IdpgOGGQieALTT9IEz1FHigbdSy3RspnIE7g2AHmrDuR6afNFmvd6FrI/3xL1XP0WYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571740; c=relaxed/simple;
	bh=cigjLGVrA/i3iKo0ZUO3ckDz+7QoGQ7Izg/Jz2mNid8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ln+r/GB6at/c9AqlvmhC2xP91i9t3F7s9qlJ6bdMewRodG1EgmdORIn0kXQXLZAAVweWFJ1naGmnmlKSF5VfSg+S6hoKGGenl+NjHsvXJ5HaDqnM6/fY89fbLbGc0ZJCukc642ase31Pxl195hVAukqJVFqZxeD/+yI0rejagsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PJDrg37I; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PJDrg37I"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1112242f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745571734; x=1746176534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUtCax9Xz79pqocOKSO+PWNehk8nJoFSaWWNyZR+sqk=;
        b=PJDrg37ILkoHM0ANI0DtAkyi22HhLrHmRsQ1VyWmcUofSoVWr0ITZheUjp1G3rpFS2
         Cl8ieJIdiRaTgQCbkVDYym7kB9xoc+LOeJFK38uYr4j5tDWKNLcgK185TSV17ujU73rU
         z9Zv1UaE754RO2I9g33UsVZZ3WIk6rDGclbz7jt86Sruxq7uWj4H+qWPgv0XEG92frNz
         JvfIxmeglBUBchdhZ++45OSeL/iqdatSdIzjZBW/AxPSaANrbzRkJnPS9A2RUqReBMYg
         BCBMrm2PZw8en8NpXKlQM2eg8nBA57AWtdBGkOQ3Pk0j6qm/BKyrAW17bvn+9NUgxdfL
         KY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571734; x=1746176534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUtCax9Xz79pqocOKSO+PWNehk8nJoFSaWWNyZR+sqk=;
        b=cjvzqDulFu8uhRrCyhLnVAASysp9WRaoPc9CzdknAU5TGDUCqv946lvMr5lFsKN2nf
         g/G31aaLPQ52KlzxxQ6q2NZo0GG8P5l2vdmdWpGDG78G03o6BdYhiH/X3EFWXfNUVS6e
         oMF3XhrNEvU4IujPlsqHnGF920lQFbeFWPDWzOms/SoWyD6ytNXBQwJhF7In7n5nVZgO
         Ouc9eZ3Y8/qPB4P5A/r2wWeHGjfbrOnBl+Xr9Dmk+kRIwV5O1Q45ToOrUDkhFSWPH4X5
         aA+E0ysasWQSevdii/5WFjX7NsBXR2QweY0m5mSUhBsHyGfilD6/MusIE6g2cqgTW0Ce
         hQKw==
X-Forwarded-Encrypted: i=1; AJvYcCW1iJ/3uHeW6w5ZhQEnFCR2tNUakvhOf8S74t4YynM5oD/IcwnYjbA/GFk40C7Cxl8NXVjTeiTi8sTyi7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Y775YbA6/jInjNAe8xe1k6gIwlkMC5ptVHQn+h0jZZlEdjpz
	IQ/YQcAqcAuZfVP6oB26Kr5ijqlwj9V64E8yezgb9KvavuL7xyCiqPqKCF0rLjU=
X-Gm-Gg: ASbGncserNsJirO6n7H8/Q8XE0Gwnc4xImlsoIxYQPGlpO1WsijcD83TAOcmpodaJda
	vSGVCt4UsScwLTivEeLsETHTI8DPfbNO922DfK7qTQYFFUkjI0rWc2Qe64ES0+2N/zy4t6ruKOu
	aFTohphCIOPYBAYgp9QD7GhbUWQAJWK5owWSI9Bfj1WZwOd5oi5hCClu8vD6TktiKDbtvFWwYbf
	zlT8a4o/PzLIizxKQ3fEJ2mOxhCiiPcIbaz8bPu05uvc19e9/1WeIqO7uR1B8BrInoM5xA3xaCF
	LezWUDOTC9iIvlANn080N9Zksbgkb0IzRxHLapf8C4M=
X-Google-Smtp-Source: AGHT+IHcaRb5pcjKTG+Y5h3Ih/yrwWqsjNfb1VbBSCFlmYmzhEmDkPcseYoWUd0DAhovc+dqSuA5vA==
X-Received: by 2002:a05:6000:2505:b0:391:412b:e23f with SMTP id ffacd0b85a97d-3a074e1a1bfmr1145277f8f.15.1745571733688;
        Fri, 25 Apr 2025 02:02:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4f88sm1689934f8f.29.2025.04.25.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:02:13 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:02:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Ryo Takakura <ryotkkr98@gmail.com>,
	alex@ghiti.fr, aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, jirislaby@kernel.org,
	john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <aAtPk6vxmIBdp1NT@pathway.suse.cz>
References: <20250405043833.397020-1-ryotkkr98@gmail.com>
 <20250405044338.397237-1-ryotkkr98@gmail.com>
 <2025040553-video-declared-7d54@gregkh>
 <397723b7-9f04-4cb1-b718-2396ea9d1b91@suse.cz>
 <2025042202-compare-entrap-0089@gregkh>
 <a7cf9864-6810-43d8-a7f6-f71cc1ee081c@suse.cz>
 <2025042252-geology-causation-a455@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042252-geology-causation-a455@gregkh>

On Tue 2025-04-22 15:16:21, Greg KH wrote:
> On Tue, Apr 22, 2025 at 03:07:54PM +0200, Vlastimil Babka wrote:
> > On 4/22/25 12:50, Greg KH wrote:
> > > On Tue, Apr 22, 2025 at 12:20:42PM +0200, Vlastimil Babka wrote:
> > >> 
> > >> I admit it's surprising to see such a request as AFAIK it's normally done to
> > >> mix stable fixes and new features in the same series (especially when the
> > >> patches depend on each other), and ordering the fixes first and marking only
> > >> them as stable should be sufficient. We do that all the time in -mm. I
> > >> thought that stable works with stable marked commits primarily, not series?
> > > 
> > > Yes, but when picking which "branch" to apply a series to, what would
> > > you do if you have some "fix some bugs, then add some new features" in a
> > > single patch series?  The one to go to -final or the one for the next
> > > -rc1?
> > 
> > As a maintainer I could split it myself.
> 
> You must not have that many patches to review, remember, some of us get
> a few more than others ;)
> 
> > > I see a lot of bugfixes delayed until -rc1 because of this issue, and
> > > it's really not a good idea at all.
> > 
> > In my experience, most of the time these fixes are created because a dev:
> > 
> > - works on the code to implement the feature part
> > - while working at the code, spots an existing bug
> > - the bug can be old (Fixes: commit a number of releases ago)
> > - wants to be helpful so isolates the fix separately as an early patch of
> > the series and marks stable because the bug can be serious enough in theory
> > - at the same time there are no known reports of the bug being hit in the wild
> > 
> > In that case I don't see the urgency to fix it ASAP (unless it's e.g.
> > something obviously dangerously exploitable) so it might not be such a bad
> > idea just to put everything towards next rc1.
> 
> Yes, but then look at the huge number of "bugfixes" that land in -rc1.
> Is that ok or not?  I don't know...
>
> > This very thread seems to be a good example of the above. I see the later
> > version added a
> > Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
> > which is a v5.2 commit.
> 
> Agreed, but delaying a known-fix for weeks/months feels bad to me.

I personally push rc1 regression fixes ASAP. But it has a cost.
I do extra careful review, testing, and still I am nervous of causing
a regression which might leak to a stable release.

IMHO, it is perfectly fine to delay fixes for bugs which
were there for months or years. For example, this patch fixes
a bug which has been in the driver since the beginning (2019).

I think that the root of the problem is in the view of the stable release
process. I am pretty conservative. My experience is that some problems
are caught only in the -rc phase when the kernel gets more testing.
I am not sure if stable -rc kernels get the same amount of testing.

Best Regards,
Petr
