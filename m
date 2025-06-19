Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749904A1D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321985; cv=none; b=GElQpewPxo3eX42H96FaeE7t+bomAk0yhKzwyW6CzYnAG9zcRPlemgo7Hp4JQY4tKeNQUaWOwmGzkIPyGJEMksbKEDRA/zrHzjAaZf+8lrU3BtPnoukPbrb/1j9XC+gRcQrpnwkOsVKhLDDOTnNCKKDlnsnLLyhuV9OUQFq4AKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321985; c=relaxed/simple;
	bh=4e9uApeBGTe+hVXoTwKtpTGHWFErF+ScxOjaxtmNzX4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dieRpIZlf8TgE68etqrbP4n/0bv6/KFoNaFakRVGQWwCcLVHquO+PoS7OLuSlhl/X7C/4Q8VpOAUZqSXNgPGm77tgAUbzVPaywjRqc+RyAJL68GmKA/E5x+4d3LFuQ0sgBOXks3ZAdH3zJthaJ797AoBKnmEbgstVsnGVeXl4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nS/JsdnY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nS/JsdnY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so4219975e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750321982; x=1750926782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55zD2oJB/8SIgMiUulnWN2O6sPo2Uc1M5ax749iDxsw=;
        b=nS/JsdnYB6U9r3Uz5Qq5UnA7yXYIqH024wRVPG4mfTfyhTMO2ruebE0nHy7uCgV+t+
         r6FlG/fEo7aECBvr+JkfP1xASMmPyDJEt0138o80wfmsmFwdXl8ka5w2OM0ohei22+OQ
         4vY4YloTqu13Pd2HASSSBrsELlyl1cY+2VNvusECdYbxanSpgpkf1ukZhEEbRpO0QU5b
         FjK2AHKsbYRsDMOl2o17My+yskLfDO9sXz+k3neIxwSMQCVfqVub9sPRlSNyqf+7VYNm
         MLMML/PGaFC5g4BZw0HWXxiCxwtlMrz3HuZLJDAiMWueflYmAfcDN8Efdl1RrDOZfqKi
         aAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321982; x=1750926782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55zD2oJB/8SIgMiUulnWN2O6sPo2Uc1M5ax749iDxsw=;
        b=A2SooQz8pqGEbPghN9ifwxfnvanMDGmii7QjMKWN/Mgh+vO+EydFWmtYFS2BZfivbt
         8fRewLkt588vXVrcgVB4hBh4/JZ1hlEaeDmPZf1VpUlqy/2slpRnumWzyDTmiRku5Vhc
         TFyMhReHAv+fCmM6ETeE5DFW9iB9STlp9Zodv5kaZTcZbIjpf8OSeaVAj7PvbwT81SVr
         uAdP5Yd0MMQ52tVDFQjdwHZzdZ1KzIirXwwh9lSi7jlrTJQgmDX75aa30OF6J2PCjmxE
         Zm3ORnrD4/lC9Sqnl0C82WSARLvpQkEliK2CFGudKbCc4zhm9pi4y//jKZnjESMl/sV6
         WQyA==
X-Forwarded-Encrypted: i=1; AJvYcCU+CbppsZGozuNRasbUoWtqTinn2qpMYsOUoXPjtcO8gHPvYwX25ieADKUw6K70swfED3q/qRGCpAlft0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvpMsoWVVcFj3xaHUdJNHL56CljWjzPoU6ljBeKGf7TDaqf9b7
	AqQRIE5Zt9aqXGX0A4FMhf7+EpHRbNr6q8nKjHV+QvKepAekBohZbJvX
X-Gm-Gg: ASbGncuKplsV/iJ5y5GSPW6YvK+me7Z4fcuRnoOUpNg7g2VAgMwNOoO3GeIKRjW1rbC
	VMmpIb9TOHGqxjXNneEL+wVwLaFo2ciaUwEwczs4hP0w2x+uAg+ebANEC3u3OkXWXXzZtjmfApQ
	uLtg9xgYhKrAXt1yrNbbkVXkslDX6O3S+GvMVPBBdDRG8Vk8sUbiY4bmAI0t96XOqTiV0k73+cV
	QSt0aoVKqSVL7WWtXsqQ7W7tYQBx237YtCxaQBHo9iyiQUdyG7r2igDQNhMhYS89eQ5Jr0KYmCK
	hDIL4/uoqPgwgGrkUz2FcrtZyqXB5TpGHWDQK8OB606D3+/QsOTi3gaWm8rb4CTn96aJKrE4ky1
	E+bA4gj1BVM5CiPIx5Wxv+QBS
X-Google-Smtp-Source: AGHT+IEVWGNq0v2qAk/fWL70eZqACkM7FsMbEgcZBnSYzexGRniK4PGvjSOGsf2POO0Ty7Dempxjuw==
X-Received: by 2002:a05:6000:64b:b0:3a5:8d9d:27fa with SMTP id ffacd0b85a97d-3a58d9d2a7bmr5040220f8f.3.1750321981465;
        Thu, 19 Jun 2025 01:33:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b28240sm19024866f8f.72.2025.06.19.01.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:01 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:32:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
Message-ID: <20250619093259.5e82982c@pumpkin>
In-Reply-To: <008r6n2s-0985-2507-5o66-67qs6nn199r6@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
	<20250614095346.69130-10-david.laight.linux@gmail.com>
	<os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg>
	<7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg>
	<20250618101620.26533aca@pumpkin>
	<s919qno2-782s-ooqq-0p19-sr754osn8n02@syhkavp.arg>
	<20250618185432.5ce80e0d@pumpkin>
	<0143891q-ssp6-83on-4o61-nrp2qn3678o1@syhkavp.arg>
	<20250618232648.0f58a27f@pumpkin>
	<008r6n2s-0985-2507-5o66-67qs6nn199r6@syhkavp.arg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Jun 2025 22:43:47 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Wed, 18 Jun 2025, David Laight wrote:
> 
> > On Wed, 18 Jun 2025 16:12:49 -0400 (EDT)
> > Nicolas Pitre <nico@fluxnic.net> wrote:
> >   
> > > On Wed, 18 Jun 2025, David Laight wrote:
> > >   
> > > > On Wed, 18 Jun 2025 11:39:20 -0400 (EDT)
> > > > Nicolas Pitre <nico@fluxnic.net> wrote:
> > > >     
> > > > > > > +		q_digit = n_long / d_msig;      
> > > > > > 
> > > > > > I think you want to do the divide right at the top - maybe even if the
> > > > > > result isn't used!
> > > > > > All the shifts then happen while the divide instruction is in progress
> > > > > > (even without out-of-order execution).      
> > > 
> > > Well.... testing on my old Intel Core i7-4770R doesn't show a gain.
> > > 
> > > With your proposed patch as is: ~34ns per call
> > > 
> > > With my proposed changes: ~31ns per call
> > > 
> > > With my changes but leaving the divide at the top of the loop: ~32ns per call  
> > 
> > Wonders what makes the difference...
> > Is that random 64bit values (where you don't expect zero digits)
> > or values where there are likely to be small divisors and/or zero digits?  
> 
> Those are values from the test module. I just copied it into a user 
> space program.

Ah, those tests are heavily biased towards values with all bits set.
I added the 'pre-loop' check to speed up the few that have leading zeros
(and don't escape into the div_u64() path).
I've been timing the divisions separately.

I will look at whether it is worth just checking for the top 32bits
being zero on 32bit - where the conditional code is just register moves.

...
> My proposed changes shrink the code especially on 32-bit systems due to 
> the pre-loop special cases removal.
> 
> > That also means that branches are 50% likely to be mis-predicted.  
> 
> We can tag it as unlikely. In practice this isn't taken very often.

I suspect 'unlikely' is over-rated :-)
I had 'fun and games' a few years back trying to minimise the worst-case
path for some code running on a simple embedded cpu.
Firstly gcc seems to ignore 'unlikely' unless there is code in the 'likely'
path - an asm comment will do nicely.

The there is is cpu itself, the x86 prefetch logic is likely to assume
non-taken (probably actually not-branch), but the prediction logic itself
uses whatever is in the selected logic (effectively an array - assume hashed)
so if it isn't 'trained' on the code being execute is 50% taken.
(Only the P6 (late 90's) had prefix for unlikely/likely.)

> 
> > (Although working out what cpu actually do is hard.)
> >   
> > > 
> > > I could get cycle measurements on the RPi5 but that requires a kernel 
> > > recompile.  
> > 
> > Or a loadable module - shame there isn't a sysctl.  
> 
> Not sure. I've not investigated how the RPi kernel is configured yet.
> I suspect this is about granting user space direct access to PMU regs.

Something like that - you don't get the TSC by default.
Access is denied to (try to) stop timing attacks - but doesn't really
help. Just makes it all too hard for everyone else.

I'm not sure it also stops all the 'time' functions being implemented
in the vdso without a system call - and that hurts performance.

	David

> 
> 
> Nicolas

