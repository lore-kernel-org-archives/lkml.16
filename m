Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E22263C8F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 12:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471901; cv=none; b=WhzCCEto41eVdBc/4xQDuFjKlGY+A6LvOI+dQpZ/y5ni1HZf/gyG6bAose2cpPtPT6y9OpFtLDM+331dTmG77qETS6jjjU8OF1kiMzVFH/tIAzkle0FcCFpJkrKRJXzeuufD/3/TcuRyH2/umYqKTC9HOyHW6JvxBKNHJ3iJQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471901; c=relaxed/simple;
	bh=eksIelLw5t+E1FpqLZamAqzDKsCM5SrUfrB2AptJFZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qe//o7WFyS+RM+9i+s2+GM91w+JNA4mbQX5Ter2PnIsmbwFrlo7eHBwKIREiPq/wXtdjz5IFUtcBEEQEoobrXVHE1VdgoKctTDIKyXUKk1Z4Ne/rWq30pcEWCOnrWKHJwOXCW+fdCZ0AIy2Ts6pfHpIEEThvyXpeOxACePotx7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=V5cLRIk1; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="V5cLRIk1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=PRs8wlybJcPuh1a0Mj96EqtdKYAqzvngsmkwDOEMFaQ=; b=V5cLRIk1J1jTVQQc
	1DSfpubgbtaa4YxEOeHhpvV5q/vdhPbrGgc6I+jIBHDP47ZCKj5/wojYci1SO01jK8/iQJLUrlmJX
	Az1n79jmZnSqt8URb2yIoTT9UAEMxVyN7Y2BWo2roLFpWDX2KxtrR+DmEztdrtUoiThjVS3yIhdRB
	sc9BzxSmeCG1ZyrAQ/d1Ap+G/6Jl8I5Q5ixxKKbrhA5yL8avtwjRrPlwwJXLYR1VvmyLGfYEB1rJP
	sd7FQ+4sSk3zlfm/qBZObCX/JNjiq4ZtZxWrXuJvRV+MV6hNTT5pTNgmWGqnoUTTlLpQG5EzWtUB0
	ZxVI8UwTh9OJyieeWA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uObYa-008Nmb-2c;
	Mon, 09 Jun 2025 12:24:52 +0000
Date: Mon, 9 Jun 2025 12:24:52 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, rafael@kernel.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reboot: Remove unused unregister_platform_power_off
Message-ID: <aEbSlN7BYT5qVlyb@gallifrey>
References: <20250608174235.116424-1-linux@treblig.org>
 <582f86fb-bcf1-4b58-ad54-acacf4326dd1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <582f86fb-bcf1-4b58-ad54-acacf4326dd1@collabora.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 12:21:56 up 42 days, 20:35,  1 user,  load average: 0.08, 0.06, 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Dmitry Osipenko (dmitry.osipenko@collabora.com) wrote:
> Hi,
> 
> On 6/8/25 20:42, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > unregister_platform_power_off() was added as part of 2022's
> > commit fb61375ecfba ("kernel/reboot: Add register_platform_power_off()")
> > but has remained unused.
> > 
> > Remove it.
> > 
> > Note it's a pair with register_platform_power_off() so
> > seems symmetric; however, I think platforms are chosen
> > and then stay that way for the boot - so don't
> > get unregistered.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  include/linux/reboot.h |  1 -
> >  kernel/reboot.c        | 16 ----------------
> >  2 files changed, 17 deletions(-)
> 
> The patches converting those platform drivers to use
> register[un]_platform_power_off() haven't been sent to ML. This is the
> reason this func is unused.

Ah

> There were apm_32 [1], platform/iris [2], mcu_mpc8349emitx [3],
> olpc-xo1-pm [4] and sgy_cts1000 [5] drivers that I had patches prepared
> to convert them to new power-off API. They weren't sent out back then in
> 2022 because of a nontrivial dependencies between drivers. At least some
> of those deps has been resolved by now and potentially the API
> conversion may continue. Currently other things keep me busy and don't
> have immediate plans to continue the conversion work, maybe sometime later.

Yeh that's life!
Of course if you could upstream one to get it rolling that would
be great, but I understand.
Most of those seem pretty old platforms, what makes those
different?

> Leaving it up to Rafael to decide whether to keep this func unused or
> re-add later, once it actually will become needed.

I've copied Rafael into the thread.

Dave
> [1]
> https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/e42f1264161085f01fed16986a23592519d9f49e
> [2]
> https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/24cd048ad801aab6221f2b0bb4576dfc2fe25faa
> [3]
> https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/486b69b43c47d85a0f292dca127f0b9063443a54
> [4]
> https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/fe5344b3f8a8e1c52e1cd7108aa7e615123be4b2
> [5]
> https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/0d761d6139c9dacbbda9f2e095577b084685603f
> 
> -- 
> Best regards,
> Dmitry
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
