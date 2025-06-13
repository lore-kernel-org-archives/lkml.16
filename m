Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0A425393B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749792604; cv=none; b=ZO1JPcFCqmkJpS/Cj18nrtzFXtzeEnuhu7saym7T5aI1cDnmrNPzd9F9wuOqsTkFTM1Vzwv107tVxYtBioqM2pG/KEmwe2VECNlUVEtI7f4Jto6AUtmpvvcQAuIYSEkRbAd+N2p5doSbHWacDRCqh/rlq86XjP5nEH1R2v41vn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749792604; c=relaxed/simple;
	bh=r8KkCIzp3kZhD0+P5UH7KpYcldzXs6eKA4TYAOYpdXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YH+4oRi2bytR+EkDMGL60M05++xbwTygasiOsgUkt2ShAeqXLKhjGD/AJtCti4QlfXNX8oYAfYp6HmsNJrbIQhZ5OIWEdvjkhBJFWujJ+pxHqkVV4WwZsfvBA3rV8MoQgbBYhdP+gEogDvl1005nG5fpZsj4KldkPqvQkND4EVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuHksaBD; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuHksaBD"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234fcadde3eso22086675ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792602; x=1750397402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XqHKaLrCKRBJT6r7hR1Zy3ct+ewEN8z4Ys2ijGiySc=;
        b=HuHksaBDZLucQke2jlhu8x4WgCAnR3n1wIMduuk5qqgTvJXWdRGxOH8WLE7UAsQmnu
         APPTefZB6O7rep61FJ1RKjpJYQV1C9JPnm/FVas6dT3PBDCuxh/ffYYWYBjjCcPqXV0D
         oe3EsgZcT6ELWK0KkgVaaIGFuZqofnfQDczDwNP59mC3ckGWrhwT/IpGY9ZKhwhpc9va
         i9XpkIu45pWYgL18hOoWEheat/MaNIIyE3yYj+5WWzluX0mZHXt6MuOX15wS4uvHGfRL
         iMdZnZxDRFaFcrVNL+RHsWnKpov8ynJJu+W8z4LGlBaoMqhdPqm+M9VWsIxD22BH2/XT
         CJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792602; x=1750397402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XqHKaLrCKRBJT6r7hR1Zy3ct+ewEN8z4Ys2ijGiySc=;
        b=GnfjvzHoKD7A+M54IaQfTaLwS/GlvJ/VPDlsOxSRk5v4DmQ+lKxf2RaNlv2UbWiXhX
         X7CLYPQUQZoflmV2ALfThmurYQ2E6CwjEpdFuuHoJVsv85tkCb0hmORESwEXmMsS7APn
         V+d3L5a8SmdoAppmgEl6jU0t473FLWT+9ApjDi3viX+UapYhBOxKtGnrATEg9aXA0UxW
         /6DsDmdILoyfxLnFtFqn/nK9Cg3M7GxLu1hmMwp127vty9awBIneCQ/J9KghSP2sdA3Z
         i4MaM6haezzzGOov5QCC3NR6AslD/BniwYcBSwy0JefBQaErd5Sup2NYSazBb1OlXbDT
         4wUg==
X-Forwarded-Encrypted: i=1; AJvYcCUOc9RK+PbaYHeXrAueEC0mq/zJa/s/tn5uottmeMe8ctrvXTaha0Ipx5SBULJ/dq0aTPWDkL0XMhKJFRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73iQnDbObcqf13ZShLjuS3pCCHg4ITlxsPpMox2Wk8ywmcnGP
	q4bsypW8KVr7T/2Amxn7q0fqHTZ8/HvQgEtWDEr0qYyINx8+ls1103DsEFhsxqCa
X-Gm-Gg: ASbGncs6n/gGl1CZ/Yb3HrbTDqNoiC8ZT7m6oj40vcETvIjr9Mqxy5GIdXsZapg8O5r
	TwrdrmbN3lWapNGTcBI8tMrD/iPJ+Ptc5nMWShTFrl5vOe/3RLv74NqY4FsntmfHkhOEccL3M5k
	0q8NY/uno5vkqjd76aQysFZSZUFnbNAqM1t40jODsCoCBfrhF2k7v+TTnAu0RUPr7iY4IUhoO0v
	PVodOFYt47w+zSNP/vWD3qROuoiKz9pdzSK58xrCNRQGMWlSvQxe/pKKKrcTpuC6GLz6cEVDAxX
	V/45vK8YqO/9mi3qLwxuXVJk+EhMSUzlAaFgR6vIdLtSgAF17bNbZLoKtx30yEIaNoE4tbhxjGS
	71FM=
X-Google-Smtp-Source: AGHT+IFHOSSAJAZGuPgsa5iDt1Zmp2oipKJCsF5x1PgfeiiEARa0h75+2pn3EaISP8w0hQLTmsav1w==
X-Received: by 2002:a17:903:1aae:b0:235:e96b:191c with SMTP id d9443c01a7336-2365db04d2emr27032315ad.29.1749792589559;
        Thu, 12 Jun 2025 22:29:49 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea903dsm6299335ad.158.2025.06.12.22.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:29:48 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:29:45 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEu3SRt3l2zaV6A8@vaxr-BM6660-BM6360>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
 <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
 <aErzPhCYGLqOdlTe@yury>
 <aEuzgmClrimyc0RY@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEuzgmClrimyc0RY@yury>

On Fri, Jun 13, 2025 at 01:13:38AM -0400, Yury Norov wrote:
> > > > > I think Yury submitted the same change here recently:
> > > > >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > > > > 
> > > > > Though, I think he has another iteration needed as Thomas had feedback
> > > > > on the subject line.
> > > > > 
> > > > > The bloat-o-meter data is a nice inclusion here!
> > > > > 
> > > > > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > > > > yours and adding them as co-author via the Co-developed-by: tag?
> > > > > (Assuming I Hsin Cheng agrees - See
> > > > > Documentation/process/submitting-patches.rst for how to do this
> > > > > properly).
> > > > 
> > > > Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> > > > I Hsin, do you agree?
> > > 
> > > Sure thing, so do I need to apply the tag myself or we'll follow Yury's
> > > patch work?
> > 
> > I'll send v2 and include your results.
> 
> John, FYI.
> 
> I Hsing submitted another patch that duplicates this series. You're in
> CC, but just in case:
> 
> https://lore.kernel.org/all/20250613033447.3531709-1-richard120310@gmail.com/
> 
> I think it's pretty disgusting. I will not make him co-author, and
> will not give any credit for this work.
> 
> Thanks,
> Yury

I just realized your patch series already does that, I didn't check on
other patches, I'm sorry, I should've been more careful on that, not
just looking at the only patch in the link.

Hope you can forgive me, I really have no offense on that and didn't
mean to do it.

Best regards,
I Hsin Cheng

