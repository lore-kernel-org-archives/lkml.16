Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100DE219301
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671141; cv=none; b=iUcF7hS3v2kPu0oAb3kw1zsT0GGzgsQdpVyPOzaMMuiOBCeWPL+UqJAAIISVcoexPzPMoJW33mlP81hAJIOxy+8X5CMZMXgF1arYXAKyHALFfBfGv4E++ZbJNhKE5UX3n5vXIMWDr7VZnlnGNA7tHnNPz/jw+EKshj07QoaHmMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671141; c=relaxed/simple;
	bh=kQE49nKTBmAndtAgPGVMUSkZiQQewT47xPmrNQkhHPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhLqIGi91UndJb49wsKLoSLFRYdTASArp8GcaItZijI6Nnmq8VgyyKK3d3OUPdmWViGCrp93nBfGIhkSjNA/SLBq1J3Mk6nhUftViFSGaxY/8MOr4HLYtNeVsN/LyndFgdHHy9KDwcE+jpr9PEoXWMecdYaX/wPbdOkw0/P+708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=TAQWskkO; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="TAQWskkO"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8DF5540E01A0;
	Mon, 23 Jun 2025 09:32:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id C30ZnCMKv58n; Mon, 23 Jun 2025 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750671130; bh=Jl+eyy2hyCCx7hrdSazEzNGaXxEOKxdTsYUm4kO5Cpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAQWskkOCjhNr83H7fuFRMw5FLBGAzGL0dr/oAslRzg1mraj6N1K6RP6bez7/z/cR
	 xyoML5QoPVHZ/JiTYzxHWk7HlHzgo0jMZWs/gCFgGMCFQ8U1Vvo6+XuLSYgKrcVtuT
	 gYKsjf0peR6sZ+YFrwb/04OeM2Et8sClxLyXxvtWYTLHiGIECihsSGdlmdb2i/TdNG
	 JsapLQKxA+2o3nZuKpZ4HUFjBw66JJfGg08tKkVoDZa4OoBgo12THw1Xx/212LqQDZ
	 jN91xaA4iOBSsFtceUy5fuZGzlmrNdaVOtBMF4xxxWDHHpBIGS8GA6R+2li6XFYrQi
	 4GpHszekW8AIj6B6XFk2at9kZPvfdgj7kOcy80J1GmwvoW3asC6SAwI/x4aRhW7Koy
	 zFhQIWkzOZ3pe04nrc3ESYnESr4UF8w3oMJ5sV7a1m2AEXI0J+iiJYUSWUUnDk+h/H
	 jxGQkWzX6jOrZ/iilZ/FiWNEwCa9gd3g17bAEiSUw3q47HfkZW8ZNVIb7JAEyd+4l7
	 VXFy+Aj9a/KIjYi3L3nObdlavAi2ak6anrjz/uSz/A7nd28xTCh0sY78hw242pQ5is
	 njQ/eL6SvN4qBi3+TUFtj4xZNfF9VFtc7aL0oVSU2XkfH6NFSgKx/ASiE9dVrdCfgp
	 V/3tm10WHJkXroPdkFHBfFzg=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0F36040E0200;
	Mon, 23 Jun 2025 09:32:02 +0000 (UTC)
Date: Mon, 23 Jun 2025 11:31:56 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Daniel =?utf-8?B?RMOtYXo=?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH v1 1/1] x86/defconfigs: Explicitly unset CONFIG_64BIT in
 i386_defconfig
Message-ID: <20250623093156.GBaFkfDAN3bgiyV_IL@fat_crate.local>
References: <20250623072536.3425344-1-andriy.shevchenko@linux.intel.com>
 <20250623090642.GAaFkZIq__HR0FJE-0@fat_crate.local>
 <aFkcf6it0bW36jdw@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFkcf6it0bW36jdw@smile.fi.intel.com>

On Mon, Jun 23, 2025 at 12:21:03PM +0300, Andy Shevchenko wrote:
> Ah, this is just a cherry-pick (with fixing conflicts, updated Fixes
> and removed the last paragraph) of 5y.o. 76366050eb1b ("x86/defconfigs:
> Explicitly unset CONFIG_64BIT in i386_defconfig"),

What?

A 5yo patch cherrypicked from somewhere has as a Fixes tag a patch from 10
days ago?!?!

> it should be standalone patch. I borrowed the commit message.  So, whatever
> you prefer: I can send it again as the original one, one of x86 maintainers
> can do themselves the cherry-picking / conflict resolution, or I can resend
> it as mine.

You should do a proper patch as it is done and not do a mish-mash of old and
new things, clarify with Daniel who's going to be the author and you should
write a commit message which explains the situation properly, not borrow one.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
