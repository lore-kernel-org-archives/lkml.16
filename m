Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814EC1DC998
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745506120; cv=none; b=bXIttxP0fXN/KuwhNaI6Pwdj3iClByQgZj+iDgBVfuYDqV3S2D4b6XMoYP3Z5GeYe97S4gu9VgqL/Tza/1/KM3XjScFA/6O3OQUuDe2ACgTApwKM/Fh4EV39mQtrsieeM8NSRiwsPhAi3YB1Dv83wICqcm68TfXGi4N8KLF49A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745506120; c=relaxed/simple;
	bh=zY1Gdjhw0ryjedYYn9LeRExVUDWHzemdAiHMlcLrowI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP5ZrmzZn1z8HiMmQckBFnzgo1aBCnwBovKMKPIXmJkmID0PJ0OlawonbMDuOBZ3cTiuBRJcax/XmEogdhyd0SMhj17lJy99DIeJY+sYsIfKWjsnZ1ZXtilHQ3JbINuicRW2eQsBzcenjZzt80E0pI7vPQmsZVPruPb1b9QAwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqXJ/4Ou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqXJ/4Ou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A52C4CEE8;
	Thu, 24 Apr 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745506120;
	bh=zY1Gdjhw0ryjedYYn9LeRExVUDWHzemdAiHMlcLrowI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=AqXJ/4Ou0h/+yAZSurxU/RkCzdyUWwOF0Ar1roWbuYLoptgbN4k+4VsbSPQwdp1VQ
	 +GP1G/9vwrCxPHSole7j9VrKsZ1t2UusyT/PDXEj3N+eheWn2+6JrIrOSKeRYsYuRM
	 6U8ETz0i03uioYRqok9cRt6nrocLDwT2DQfG7dwjE+ro9MzEFppKMeWXM7eJjuOYNx
	 2Crgd+Y03xtD5XZyCi0O+W/FURM/Uua1PNmgKtwMADnVX7NWXhB9jlLTRdIW/B3M18
	 fb40ByKUYnb91fdhatMXw3FIGvpCZpER+AuvX3iif7s1jhiimjbmaSINFi5HK45h4D
	 XrQoKIYHXDaNw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9A50ECE191C; Thu, 24 Apr 2025 07:48:39 -0700 (PDT)
Date: Thu, 24 Apr 2025 07:48:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Aishwarya.TCV@arm.com, sraithal@amd.com
Subject: Re: [PATCH v2 ratelimit 11/14] ratelimit: Force re-initialization
 when rate-limiting re-enabled
Message-ID: <80784ae7-50c6-4894-94af-8dcbb3c43db0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <20250418171359.1187719-11-paulmck@kernel.org>
 <257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk>
 <559db775-f151-4694-86e6-72809b386097@paulmck-laptop>
 <98e5ab65-7601-452e-9ebc-bb3a7426313e@sirena.org.uk>
 <fbcffae4-8d88-4bc8-8791-12713f0dc8c1@paulmck-laptop>
 <e6e8abd1-6aa6-423c-98e5-4daa99c4edbb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6e8abd1-6aa6-423c-98e5-4daa99c4edbb@sirena.org.uk>

On Thu, Apr 24, 2025 at 01:11:04PM +0100, Mark Brown wrote:
> On Wed, Apr 23, 2025 at 12:54:39PM -0700, Paul E. McKenney wrote:
> 
> > Could you please try the patch shown below?  I might actually have
> > it right this time.  ;-)
> 
> This seems to also fix the boot on the affected platforms.

Thank you very much for bearing with me!

							Thanx, Paul
