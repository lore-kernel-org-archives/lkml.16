Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94572191F92
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747164486; cv=pass; b=YXRi/T/phZKn371O3sI7inVRA3NRchuPIwz99htcq0muxrnO+a13u61Ykm6UYOv0trW9f+94K55R26bLYbBg1YwftxFPOpM1xe98Wwavdy6hWkHpMjh3bNXtMwEmoKZOe2mZvoOa3JLv3DhjAJ450kjGhsftdDwoGrJyUKjyZis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747164486; c=relaxed/simple;
	bh=Y/ZCM/H05SRHIka/ioMPxnPRHoczWNfftP5JTqSrtPU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=a2+Or2fqxBlheloAkzqBgPuBvoctAxXHZg5KbQnl0mQdSuwcM1QgswMNt2zN+oFgacPufTysFAupQEQiKagiXzn3EHWmiKV6CHWA3FPZf9fGGb3a1G9rtYSTTGQsYfL287RLLuEtyjNUA1/Y/Hfci4KhceodrQqqM/JHHFOAlqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=AZNnjI6J; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="AZNnjI6J"
ARC-Seal: i=1; a=rsa-sha256; t=1747164456; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IXrbKlgUDukRoxiVJSaQyCPki00XA62YdmkD5hxrWEHZ9oKazB0bS6yGCAiT18vo+9A+X/MbUWTX8Ab5lnPNLIZHgdG4/nE+AJeyZOrXoXLDbm+ldX3TMgBS+ZJq5bYiOsMJcNET6JYx/XkYSOyvt6OfF7CazTf3WBweliaEcLw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747164456; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9tbZcwB99l3bTSF7aDT1aqUbj7yf9LIKPKmFqRnHdI4=; 
	b=kYJctRJ1iJ6YXBAo+YOIvy7u/ekhcAWhiI2JvZLTv/izF3c+LkwvzX8JJrelZGue+IkQUF6v93lhETq9EKcdRq4kfGo5/Nl+CCs5bT09c/lup8k7W0rGzagyrk7g4Q2Gk6/dVojMh8y0Zzs3mnpXG4R6/uTYMoy0RMK+OReJhJg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747164456;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9tbZcwB99l3bTSF7aDT1aqUbj7yf9LIKPKmFqRnHdI4=;
	b=AZNnjI6JE1Xq8vT3hlHE9rVxer/rKK/fFHlIE547Enpv/3ZJgG3GBMcPEZd1mXmA
	v/jcbplbNXL+se3x9sMZDWm6WpcQPAGzPoDjq9xyIkoXh2ebKjM5j25VwPGkxxwRRPp
	ejNjuip4Lx1xFeV7aQDt/RGtywLu0e0uAbJ1XZxM=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 174716445573577.4013798745209; Tue, 13 May 2025 12:27:35 -0700 (PDT)
Date: Tue, 13 May 2025 16:27:35 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Luis Chamberlain" <mcgrof@kernel.org>
Cc: "Song Liu" <song@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kdevops" <kdevops@lists.linux.dev>,
	"Jim Zemlin" <jzemlin@linux-foundation.org>,
	"Konstantin Ryabitsev" <mricon@kernel.org>,
	=?UTF-8?Q?=22Javier_Gonz=C3=A1lez=22?= <javier.gonz@samsung.com>,
	"Greg Marsden" <greg.marsden@oracle.com>, "Tso Ted" <tytso@mit.edu>,
	"Alexei Starovoitov" <ast@kernel.org>,
	"Daniel Borkmann" <daniel@iogearbox.net>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"Greg KH" <gregkh@linuxfoundation.org>,
	"Jakub Kicinski" <kicinski@meta.com>, "sashal" <sashal@kernel.org>
Message-ID: <196cb1de31b.ef78ff442883955.7374847682594204868@collabora.com>
In-Reply-To: <Z_6bxZUiodrE45HJ@bombadil.infradead.org>
References: <Z_6bxZUiodrE45HJ@bombadil.infradead.org>
Subject: Re: The future of kernel-patches-daemon - folding under LF?
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello,

I missed this discussion, so sorrry for coming in late.


---- On Tue, 15 Apr 2025 14:47:49 -0300 Luis Chamberlain <mcgrof@kernel.org> wrote ---

 > Song, 
 >  
 > We're starting to rely on kernel-patches-deamon (kpd in short) [0] for quite a 
 > bit of  linux-kernel subsystems and have integrated it on kdevops for them [1] 
 > [2]. We already use it for the modules subsystem but even then that runs into 
 > hiccups every now and then and we just have to restart it. For smaller 
 > subsystems we've started to experiment with lei based patchwork solutions, we 
 > started with the firmware loader, and the hope was that if that works we could 
 > move on to memory management to leverage the automation of tests we have for 
 > xarray, maple tree, and vmas. The lei patchwork instance which kernel.org admins 
 > have helped us with works well, however kpd doesn't yet work with it [3], so we 
 > can't even get that off the ground yet. In the meantime, we've been instead 
 > relying on linux-next tags to test other subsystems like memory management so we 
 > avoid regressions that way, instead of testing patches while on the mailing 
 > list. But we do want to get to the point we can test things proactively for 
 > different subsystems. 
 >  
 > While we could look for alternatives I think we need to face the fact that we 
 > need more kpd love. I'm convinced that the only way to scale Linux kernel-ci 
 > work is by dividing and conquering and those can contribute to different 
 > components do so, and kpd fits well right in, but I think we need to start 
 > thinking about scaling it beyond just Meta. While we could just try to 
 > contribute to it to fix lingering bugs I've noted my first issue with it, 
 > requring CLA [4], and I don't think it makes sense to fork it from Meta. kpd the 
 > sort of specialized daemon that also can take time to learn and believe at this 
 > point it might make sense if kpd can be part of the LF covered toolbox we can 
 > get support for. Ie, make it an LF project and see if we can get more help with 
 > the sort of pipelines that fit both Meta and the kernel community. 

If we are talking about folding under the LF, then KernelCI[0] is really the place for that.
Part of the project mission is to be an umbrella for different project around testing
and validation for the Linux kernel community. Not only that, but support the ecosystem
by driving the creation of common stardands that can facilitate the communication
between different test/CI systems across the community.

We really need to move towards a more aligned testing story across the board, so all
systems can expand the value they add

I am happy to chat more about this.

Best,

- Gus

[0] https://kernelci.org/


 >  
 > Let me know your thoughts. 
 >  
 > [0] https://github.com/facebookincubator/kernel-patches-daemon 
 > [1] https://github.com/linux-kdevops/kdevops/blob/main/docs/kernel-ci/README.md 
 > [2] https://github.com/linux-kdevops/kdevops/blob/main/docs/kernel-ci/kernel-ci-kpd.md 
 > [3] https://lkml.kernel.org/r/CAB=NE6X5mJJmcXjEkHyE=2f1CCA5fDDEjMFH_aMArrhom2qO8Q@mail.gmail.com 
 > [4] https://github.com/facebookincubator/kernel-patches-daemon/issues/62 
 >  
 >   Luis 
 > 

