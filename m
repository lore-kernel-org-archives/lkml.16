Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1FC2417EF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931447; cv=none; b=CanJqdcOvs79A4fV8DgmUw4gLupEhkFZLbsd9O4Qfh2cLE8K6qxKrNWjeb4P6kzGAU92UgxmwZa8oPxwdlRIzKGFH3bJG4K9nVPfLGUVstMe83jYjAu08Lg5cHCdv5e2senU/wFrPs/Ur4AG0WS5O3gaZOeZ9ycuuyE2Rwvd0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931447; c=relaxed/simple;
	bh=jYlfBbDJsAc5w5J0+1fMOLp8nO8K5+iaVrHcbx13aqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fH2eadjoEJHQHQuLTVqvKo5aBC8fUM1bYnP0RxT1Actabt+wFFeHkGub5hy2SpbzSjBg1MwfAm5QpC85pMBgU3J6PIz4h5emN2cQXqZQe4qZKeaUDrgGLIIRBQ+GUGNs5/EVCj4spvszXPCxRYUfS3BpYDtoiu5gTd32oN/Cay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pb1Dskyp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pb1Dskyp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jYlfBbDJsAc5w5J0+1fMOLp8nO8K5+iaVrHcbx13aqE=; b=pb1Dskypva83a5E9QnjuO6dTHg
	+TzhvGnAqBJNKC6UGSY3YgTZA+4c6Aw66TNhL5hXHAgtYkk+kHj1Y/JvidyIhSFyHB4G1iLLWAF3o
	XfDAVyIFiiekBKtcV9sKNHwmaBsLUK1Tr8Dz1czeEfbEayVDt+qQoMFtszNChG3IPwMX6jeekX/J3
	C0Nfaw0K+Y0Zfv+zlmP+pVnBO/y9FVH+pJbePC9eR1hcZi3w8hf6YumZ9x+5qnRdXQebbib9YWcw7
	fn67Z/Jhv3mOrAN22hzW6gpxMPDEa43h6DF62IYohyPDcQ7sB4g6Msq9E61iTxYCEanXTA78idnY6
	ZOb6T7ew==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNUz-0000000HAhK-1KUo;
	Fri, 07 Feb 2025 12:30:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DE50B300310; Fri,  7 Feb 2025 13:30:20 +0100 (CET)
Date: Fri, 7 Feb 2025 13:30:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Breno Leitao <leitao@debian.org>
Cc: mingo@kernel.org, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, corbet@lwn.net,
	qyousef@layalina.io, chris.hyser@oracle.com,
	patrick.bellasi@matbug.net, pjt@google.com, pavel@ucw.cz,
	qperret@google.com, tim.c.chen@linux.intel.com, joshdon@google.com,
	timj@gnu.org, kprateek.nayak@amd.com, yu.c.chen@intel.com,
	youssefesmat@chromium.org, joel@joelfernandes.org, efault@gmx.de,
	tglx@linutronix.de, kernel-team@meta.com
Subject: Re: [PATCH 03/15] sched/fair: Add lag based placement
Message-ID: <20250207123020.GJ14028@noisy.programming.kicks-ass.net>
References: <20230531115839.089944915@infradead.org>
 <20230531124603.794929315@infradead.org>
 <20250207-petite-eminent-husky-7d1704@leitao>
 <20250207111141.GD7145@noisy.programming.kicks-ass.net>
 <20250207-tunneling-tested-koel-c59d33@leitao>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-tunneling-tested-koel-c59d33@leitao>

On Fri, Feb 07, 2025 at 04:25:02AM -0800, Breno Leitao wrote:

> I haven't seen this patch in stable. Is it queue up for the next
> submission for stable?

It's not yet queued, up. I meant to do that this week, but 'stuff' kept
getting in between. I'll try and get it pushed into tip/sched/urgent
this seekend somewhere -- but it is unlikely to make -rc2 at this pace.
