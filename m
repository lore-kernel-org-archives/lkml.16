Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDC317996
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748771978; cv=none; b=Plc5KML1Dji0yLGhKishQAgKI96gkzkZpSy+ItRBexam9dWFXxgZccjYHN/fX/mRNj27ZX7uKJL7FX2tGuw9oV3X5ir38GmIL8KBvO4fNI1rLf2c6RFKyzrjJwQp6I+GJfRHdD9TxIgwZyE+khzSDjMb26vUCLuCGUdtdvF3R3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748771978; c=relaxed/simple;
	bh=Ot5nx4Dtvx9/n+2jODntlworf8CjWFwepPuGl8sJDz0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rEEUkI2n3Zq51sLLu1tuoU5tCshdGy/d6SlUbJZgR3Nsa5QbcneAwKM9b8Tnc3EY0Oh5lMu1actmmaiwEhTWAq7CjvdlnxAiDbb2neliSMegacOY1GjRdyYolYSU3/MPheTDZuyL03bQvqP0fWhUiwnE9CjTncbVODlVbkE8DAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UY+oJeXp; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UY+oJeXp"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b9CB65mx2z9smq;
	Sun,  1 Jun 2025 11:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748771966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EoQTHup2d+EyM8C1iJX6ayBPRlXmhbkkz5IGdIJDd/4=;
	b=UY+oJeXp7weMaKTAr54StxjxHYHzCn2UfTRAJJkITYxxKgV0aJAC7keV3njPcGu9SX//4M
	3yGH0NkvPcLJyWlom/sS1E3040yc/ktb8rZRUvjpTb5g88v4I73WelBxuF3k8lc3/iVcy9
	Qzu+EMiRvzhNxCDrF8pU7rOR4JJfWghfjro3NmSVErxKcGhk0RLSIFe3VLiankaKexMhyW
	mU8DT8o8AWAH/dSEADVy9dn9I0zrSXTiZsPVKPP4uZij2i2N5fAtEtzQwPuoNuFzcDCkTU
	lyK7hAjxI88jPIH2yXlcjM5ZPUZ+xiT2QxPJU/ZbJSqJcavu8sidfhWpDhGxfw==
Date: Sun, 1 Jun 2025 11:59:23 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: WARNING: CPU: 12 PID: 44394 at
 arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0 (v6.14.8, Talos II)
Message-ID: <20250601115923.713c9683@yea>
In-Reply-To: <aDfsemssEVATfP80@linux.ibm.com>
References: <20250526205537.2f1bccec@yea>
	<aDV8iWe2nWX9JuvV@linux.ibm.com>
	<20250527204728.63d538f8@yea>
	<aDfsemssEVATfP80@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 50cfc82d11ae51dfaa4
X-MBO-RS-META: 5r3erum6cuuiiid7su7azspoexbnz7ky

On Thu, 29 May 2025 10:41:22 +0530
Srikar Dronamraju <srikar@linux.ibm.com> wrote:

> * Erhard Furtner <erhard_f@mailbox.org> [2025-05-27 20:47:28]:
> 
> > On Tue, 27 May 2025 14:19:13 +0530
> > Srikar Dronamraju <srikar@linux.ibm.com> wrote:
> >   
> > > > Getting these from time to time when I run the machine for longer periods building:
> > > > 
> > > > [...]
> > > > ------------[ cut here ]------------
> > > > WARNING: CPU: 12 PID: 44394 at arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0    
> > > 
> > > Its a warning with says that the task's userspace MSR register has
> > > VSX set but not the VEC or FP.
> > > 
> > > Were you building the kernel or were you building something else.
> > > Can you paste the command you attempted?  
> > 
> > I was doing an 'emerge -e @world' in Gentoo Linux and probably building a kernel in another shell. Noticed it only in the logs on the next day so I can't tell exactly which command triggered the issue.
> > 
> > But I will pay closer attention from now on.
> >   
> > > If this is happening with only the recent kernel and working with a previous
> > > kernel, do you happen to know the previous kernel version.
> > > In which case, is there a possibility of doing a git bisect?  
> > 
> > I think I have not seen this in v6.13, certainly not in v6.12.
> >   
> 
> I did go through the git log from v6.12 till v6.15-rc7 and I dont see any
> direct changes that could affect VSX VEC or FP changes in kernel.
> 
> On a side note, Was there any significant userspace updates like library,
> compiler updates from when you saw it working to now?

Looks like these warnings easily happen when I build stuff with GCC 15, currently on my Gentoo Linux musl ppc partition. No kernel builds, just emerging regular Gentoo ebuilds.

I'll sort out whether I see this on GCC 14 too and/or glibc partitions too. I'll report back when I know a bit more and maybe found a good starting point for a bisect.

Regards,
Erhard
