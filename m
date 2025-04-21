Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D70265CB6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243358; cv=none; b=ZikjTnI7kzywiwzzx3eiqlIQs0phT3voF4OTN6WMoZTFsi1eANjfSibnS4J/a3JAf7P2s+t5l0OQPzTr/fFVVARL93/5bs1R/CGtk3XbaUL42MUlqSoKf5DA2wQ4Tu3Whh8fVs8/RuIfZ4nVWswT0KKvU0j80S9qY5lKpH+VyHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243358; c=relaxed/simple;
	bh=GotjJeGKkEOwREHo9bQPd73fZruw0/J3ArTndWt5dLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWgT4GUO0rdZp90vcsqwxgozbz57WsHGHjdqSkJg6TPy0DbX0R6oH1W/0+WQpHKb1Zx2SeLl14giaSP7x3/B9CEzkv970PVamT6uLQGpkHXdmbeh5M1/IMLWPQwFHK9oQ/YL8RS408K73UuMbViZ3CIalMS1vxdnBwCpj1H0Vdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=ZGDlDS54; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="ZGDlDS54"
Date: Mon, 21 Apr 2025 09:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745243353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxq7QV0ZgaJ4831XpUaW+01t9SMpZWngP0J+YjsExiM=;
	b=ZGDlDS54HCtzkrZerO9wmpwIKOrKpmpaRp+XIJrUPBTyaVFZb5w2vjaoxppkRtpiewNlgZ
	L5Ay83EBra1SuXTIzayL0hLWgnn3MrRd5SFIhE4DNpuDz/+Jme3hpcxMTzvZIYPP0OTYNe
	c7+qIKUGWMeJYofWHAiFZ1lqKg7e/Mhu0XVRpWdwKFgnm7TXnJIOypL+3Tn0zwP1ZuIVwM
	AX7Ag+H+m/PdduluGgT0b+00UwDA1U/UmfoWe6LtZMdbgdDEYYfV0HfwNqb6TA3TDmjIcp
	3Bvr/KGpEcJA9INO2tDH+S5oUv3eGp3/eE3QxUP9NcxxgFc6E7ydKJz0EegzIw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Aditya Garg <gargaditya08@live.com>
Cc: Petr Mladek <pmladek@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>, tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-ID: <aAZM0svrO2MiNAdg@blossom>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAY0hRvNCi0y6rlt@blossom>
 <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAZDApE-Wm_NlbMx@blossom>
 <PN3PR01MB95977FDD2F4DF6D9E198C516B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB95976BAC455F10F6D75B9C84B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB95976BAC455F10F6D75B9C84B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT

I didn't realize this was so subtle with the backporting. I don't think
I can take this on, sorry.

Le Mon, Apr 21, 2025 at 06:40:23PM +0530, Aditya Garg a écrit :
> 
> 
> On 21-04-2025 06:38 pm, Aditya Garg wrote:
> > 
> > 
> > On 21-04-2025 06:37 pm, Alyssa Rosenzweig wrote:
> >>> On 21-04-2025 05:35 pm, Alyssa Rosenzweig wrote:
> >>>>> Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.
> >>>>
> >>>> DRM hides the merge window from committers so that's not super relevant.
> >>>>
> >>>> I am a DRM committer and can pick this up if necessary but it's not
> >>>> clear to me what's going thru with DRM vs elsewhere.
> >>>
> >>> All the three patches are intended to go through DRM. IIRC Petr, the vsprintf maintainers had requested for that to be done.
> >>>
> >>> The relevant patches have been Reviewed-by Petr as well.
> >>
> >> OK, will queue this today.
> > 
> > Thanks!
> > 
> > Also, Petr has requested them to be backported for 6.15
> 
> To be more clear, he does not have objection for backporting to 6.15. Although its your call. 
> 
