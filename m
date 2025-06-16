Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9B1A3142
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083076; cv=none; b=OSECJgGGUram2IrIRVzCVrZ4VgIlBhX6JRW7KMQEoJOe9YYpYPVHnYJjh8GLTRJYfTD5k/kaMH3OqRzAd4FmTOqG0SMZVqipHdm0sRtwajkOskDqbm19LluMFEocuZM1x7DhOYpL6IWu8HNAjOyDCegfcRngkWWbTEO3ktTSlcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083076; c=relaxed/simple;
	bh=zoPlTkoZZmJtHvxgje6uQdW9GgwchQlmybNP8yjwaN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWYZZ83qmnWWnaYRdNy7dIVKAEbDj7a1dJNneCxYTtn3SWZ8SNgA2QDUSdCtPtRggZgmIjf9Tjr2F2S9INEs4J2Hq4YZpnUElGagThtdJqTmx8YKZffS6GUL1sFmZhocD4H7KGfeWwcOdps74qO/gfr1EoGrMnPVpifpwsYBiow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=i6yGYI5m; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="i6yGYI5m"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5675dec99so566178985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750083073; x=1750687873; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOggq/KPowkbkENDJnGOHpXXvgQx4F56FAixym3bp2M=;
        b=i6yGYI5mS8tlXa57baShPSH1cg7VlSZA/FnWjgWXRGRVWm1L2qVZxRNeMHEv9TafUr
         h6WqqYDQXfXcLvzvvScx3JA9m9yQlwDFa5rUdSR2eJxlFGV+mZmJ2nrZpUxcEFQa6WZ8
         P+MhRH3J4Di0h0uAwi4BZP4+ekovjxaHDEcSqLOUswi1rnJLWbadESAmUjYOz1HcI4ed
         JfnSzqDk+WmtX3iCcfk+rUtXTpJOMxpMarD53llGdlCaIJ54AtL/GjIQdBV3MLitglW5
         zGAwbNhf/U20Ca1ck/GrRJTzN5j4Stf3n+pasQT7ackjJYXk9mGzdOopT5sVLFT6CSDm
         H1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083073; x=1750687873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOggq/KPowkbkENDJnGOHpXXvgQx4F56FAixym3bp2M=;
        b=aD+KVbXakR7x1g5aARRfnnZvjZMpHIFIhxfuxr5JfWcHb1WlUwja3k2rl+O+P6bs4V
         CeXYyhw4ov6qkw2cUNMQANU3FIhnnihOTWfS7E9ibSPVv3oV5oIhLH9MOnqHsjAG1Xor
         mw3vo7/hxoi7bSMdaP50GjHlKoTJVU6ZbbL0NrZu95B8VIUS7jEUh+I5eWBXQ1reeGgo
         mc+GVNl8qknQv7PndOGMHQvQ5X7B3d2pnMWYF0NzrmxVm2V6aOs7mIRfRGuOD/Zx43xM
         8J0DrNf2FNuQsGmnw3SjrauzPlucnWuiZYaX9qvJSWAE3EW6Mep4OBG9WSL0bkWhlOxy
         t98g==
X-Forwarded-Encrypted: i=1; AJvYcCVvKWvfVWrxnrXa4pQ/XfGUBF4ELqLKzas10D5g7yiqDYKfNvSY63+f/kXz1mZdjpuidTFVT/wbSUzkZuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX2yfxnH8TWVkizciVnGmSUx8Fg0hN3n5UrhPWHBMRQXWIXTeu
	M/Sy/JgXRDtP2rmFqfVmXHR4JI+BUP+SYrZuSYoECfb4w61hd2xHAr/j3zxbC86rPg==
X-Gm-Gg: ASbGnctXsk8kTdad+Ua7A4C+KE/WprLEwwsScnhBbdgjzn1437zB0Wata+/ogQgkmeP
	hbtLs9zHkou2OMlKNt5rkipERAWRzOesgvDmErobxzEy8kLCEEnL7V5dLyiYCnSqHA1P26gZccL
	+yQH00yKsWDo1/ayQKLO0af+ubSc7TnAtU02Z77+V7H5bVmfSZAP6N/qsQ9VXF3QTAOfBlwue2z
	nO50eYulMeA2xdUL/IaDsR8/f6eps3+Jqf13E/Yr2r3hmSG3sCv1avmnogqCoCNl8iVuDIGqNeQ
	UuztFMLHGtC89kioZOy20JirMij3afm8TjsLJDpe2ujGx3lAC5ClkwJb9WGRKTCosdOp1AOaC99
	H8Iuz
X-Google-Smtp-Source: AGHT+IG/Q8oqK3NAs6JYHlzNOnNjSakbP4l5bRaZECFc8nTtdEfQzpzqsQ4tpcjcD5JM5xcRL5wrXQ==
X-Received: by 2002:a05:620a:390a:b0:7d2:2822:3f79 with SMTP id af79cd13be357-7d3c6c18fcdmr1653377685a.13.1750083073152;
        Mon, 16 Jun 2025 07:11:13 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dfe347sm530784885a.36.2025.06.16.07.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:11:12 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:11:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Thomas Haas <t.haas@tu-bs.de>, Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com,
	jonas.oberhauser@huaweicloud.com,
	"r.maseli@tu-bs.de" <r.maseli@tu-bs.de>
Subject: Re: [RFC] Potential problem in qspinlock due to mixed-size accesses
Message-ID: <357b3147-22e0-4081-a9ac-524b65251d62@rowland.harvard.edu>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <20250613075501.GI2273038@noisy.programming.kicks-ass.net>
 <aEwHufdehlQnBX7g@andrea>
 <9264df13-36db-4b25-b2c4-7a9701df2f4d@tu-bs.de>
 <aE-3_mJPjea62anv@andrea>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aE-3_mJPjea62anv@andrea>

On Mon, Jun 16, 2025 at 08:21:50AM +0200, Andrea Parri wrote:
> > Thanks for the praise. I expected more questioning/discussion and less
> > immediate acceptance :)
> 
> Well, the discussion isn't closed yet.  ;-)
> 
> 
> > Maybe one should also take into consideration a hypothetical extension of
> > LKMM to MSA.
> > I think LKMM (and also C11) do not preserve REL->ACQ ordering because this
> > would disallow their implementation as simple stores/loads on TSO.
> > That being said, maybe preserving  "rmw;[REL];po;[ACQ]" on the
> > language-level would be fine and sufficient for qspinlock.
> 
> On PPC say, the expression can translate to a sequence "lwsync ; lwarx ;
> stwcx. ; ... ; lwz ; lwsync", in which the order of the two loads is not
> necessarily preserved.
> 
> MSAs have been on the LKMM TODO list for quite some time.  I'm confident
> this thread will help to make some progress or at least to reinforce the
> interest in the topic.

Indeed.  I was surprised to learn that CPUs can sometimes change a 
32-bit load into two 16-bit loads.

My question is: Do we have enough general knowledge at this point about 
how the various types of hardware handle mixed-size accesses to come up 
with a memory model everyone can agree one?

Alan
