Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068E32609EC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456879; cv=none; b=fZ4VvloJz4d6W//1cTh5DIayqT+lYdj8a1HcC2j2aPZpPvgVYz4bgZdOKXHLzUByFFIq1XFerZsG+/Z6uvjqXUCSTXGAwJU2BEjhqecsYMC3YksZ5QHWXEiR3PjWfT315B8aICErTPv5Qm7qebUH+ygXvHDLRWlcrFigwwxg1bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456879; c=relaxed/simple;
	bh=XXM/2+43v5B/yWZGaaE+2zqWNDPJnqN0DeA9m2z+i+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rN3zLBY46WnMZM13tUW43jg4lq5Qzd2htNRRztWIX04RyCvIMvNFAYDx0cOwVakTVfaNnJf8xxi0x8pfHnyFwbSyL3p8sB5dHtg78sNX2flmLaOZk/8bfM1e8a1lKWXBoU7TjnjGDQGCjIi0l9/wl8C4uSOqsnuPqa8Fg3fYl2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=myc68ZIn; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="myc68ZIn"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bXJ6x24QZz9ssC;
	Wed,  2 Jul 2025 13:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1751456873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TpdbB1QH8opy3+7xxkb6wmPQyj3GD7huniHgbKQg+Gs=;
	b=myc68ZInlcCoBUsgU4TYxckzoRMtTzP0Kkd1u+AK6JT/SbBf7UyXaAFGAXEAN1B3blENss
	sqIf889CLbTpld1UDwFZJPP62e7FcjUuL82uGW7IU83P/JkEL0NZJSvyAXTqi+IvX0WX1r
	TciOy8pMSY/kOHdIcv/MHYzze4Z2E6Zxa90IWrpEoqf6RebpzUzg0ShXg6bZzhV636eJaX
	wBw6V8CWIKlpQToeqcNhvhhy6da5a5EYhc/O6KDoE4dn2yUui/mMyhjNlfC0P4/Mj3vjnT
	HQL/El6gN6nu6RsCPwgdEkJnRrnGAYh8+6YbprrzPStdvijyWcF2fNoqGjiQvA==
Date: Wed, 2 Jul 2025 17:17:33 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, alexander.usyskin@intel.com, 
	tomas.winkler@intel.com
Subject: Re: [PATCH] samples: mei: Fix building on musl libc
Message-ID: <m3mqhfb2xeoje7hmwzlkdqih7d2pqiu3quyqsj5zyj77el6pb6@ik2ohi4spp4r>
References: <20250701160726.22406-1-listout@listout.xyz>
 <2025070224-unheard-viscous-58a5@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025070224-unheard-viscous-58a5@gregkh>
X-Rspamd-Queue-Id: 4bXJ6x24QZz9ssC

On 02.07.2025 07:45, Greg KH wrote:
> On Tue, Jul 01, 2025 at 09:37:26PM +0530, Brahmajit Das wrote:
... snip ...
> > 
> > Signed-off-by: Brahmajit Das <listout@listout.xyz>
> > ---
> >  samples/mei/mei-amt-version.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> What commit id does this fix?
> 
> thanks,
> 
> greg k-h

The (both) changes were introduced by commit c52827cc4ddf3 (staging/mei:
add mei user space example).
Shall I resend the patch with a Fixes tag?
-- 
Regards,
listout
