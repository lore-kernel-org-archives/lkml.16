Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A04C6E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685502; cv=none; b=I3zB3w7F+z05vYCyQPbH2iMMgQSN67ftlM0B+KDDL7ApCK+Di0yu12uXnIdu61d+4ain8XBauu0M+fpl+3OfeKvZw0p4lJcOhJmcUTDmONE81y0g/TW4XchYz110Nr+aDjcaaX6yqjme/eXylE+QFjlrmG37dIurM0AbHirhgDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685502; c=relaxed/simple;
	bh=IwhVpeZc7nFoMqL7SCaiATWhx7jFPX2Q1K2AtO4lryo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T91+SaN080bWGw3n5ZnuyX3Lc2e13pokuJXCHTUghid8Qd+JE68EF5t5H6N3RILtnzQfNSRMK7lKZHtsQvzKTPGCCT7Trta8oMQKlCPhd/Cg3XfellnZ3KYLED2g4CLHmaTUGymiCyXUOczK95aVtD+ysuwMZTWElgW2jeuX0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=k2QbrGaI; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="k2QbrGaI"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 475CA40E0200;
	Mon, 23 Jun 2025 13:31:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AKfbrb1WVA2s; Mon, 23 Jun 2025 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750685492; bh=wm5ALDjg5XOC6EPZ7T1yCaqH0j678oI0WJgX3QendNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2QbrGaIcPvczqLDCyR0H1an2pTR0DzABtnDoPA75P/1UpS/Uw9YSHAInG6It8d88
	 DEBX0F2DBOSJUOEilRFDIVxjB/ppm4ABXUJG4Jo2tBlfPu4RgSx/qiI4/OsnzPrD6C
	 7XnfWoHrW2tGL5E5jbXKHqMei9j7GFomfFDLjhlpc0Ka426fNAAVPxIE2YD3Mp9ujN
	 0APJYDozQDVSWA6rrme9MS6K/7caVQPp4n6PXCe0f2pH9/CCpnYfMluGUgbl+pTDee
	 WEC4VgEZ0GtxD++rXL6tXhAJ9kVZsPAV9Pw8bjp63g2uoOXbOag9loQqw6HYm/35ZR
	 rX3/eFBpjjKaatIsXBUyX1E7/kX53EQb3ik4LHAZ7CFMXA0DIP6Ex5iXC+k7E7OWwz
	 fWH3wbpM6isBciL1lOSLgoLoehXo9vKkhTsuG7oNI69qYKNJDsrAFifFE5pFw1J9OW
	 fSDceiLf8ZC74WV0HMc29G8A8bYHaSe/WneJGrJdQiIkfxh/AE9PAowi53yVD1M5QZ
	 FsPgkLuaVk6dlSOIvAWEk05DB1toNqb2ruJZGsy1EiYmuI98mjHJ9EHi9e9NzKwDxz
	 Z9tBuvKCs0iUaLvoX0035ClaDd1dv4GnjSFKNL2zNXTkdqNMAkPeskUhiszGG5AW8q
	 u+hVs3mz+OxPmwUzqQtiznv4=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8AC2240E00CE;
	Mon, 23 Jun 2025 13:31:23 +0000 (UTC)
Date: Mon, 23 Jun 2025 15:31:17 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tianxiang Peng <luminosity1999@gmail.com>
Cc: puwen@hygon.cn, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	Tianxiang Peng <txpeng@tencent.com>, Hui Li <caelli@tencent.com>
Subject: Re: [PATCH RESEND] x86/cpu/hygon: fix missing resctrl_cpu_detect()
 in bsp_init helper
Message-ID: <20250623133116.GDaFlXJMf0xA5fh5JH@fat_crate.local>
References: <20250623093153.3016937-1-txpeng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623093153.3016937-1-txpeng@tencent.com>

On Mon, Jun 23, 2025 at 05:31:53PM +0800, Tianxiang Peng wrote:
> Since upstream commit 923f3a2b48bdccb6a1d1f0dd48de03de7ad936d9
> ("x86/resctrl: Query LLC monitoring properties once during boot"),

This commit is in 5.7.

You notice the issue only now because you were on an old kernel before and
moved to 5-something, which is >= 5.7?

> resctrl_cpu_detect() has been moved from common cpu initialization
> code to vendor-specific bsp init helper, while hygon didn't put
> that call in their code.
> 
> This triggers div-zero fault during early booting stage on our
> machines with X86_FEATURE_CQM* supported, where
> get_rdt_mon_resources() tries to calculate mon_l3_config with
> uninitialized boot_cpu_data.x86_cache_occ_scale.
> 
> Fix the missing resctrl_cpu_detect() in hygon bsp init helper.
> 
> Signed-off-by: Tianxiang Peng <txpeng@tencent.com>

Your From: is Tianxiang Peng <luminosity1999@gmail.com> and that will appear
in git as author.

Do you want it to be the email address you have in the Signed-off-by instead?
I.e., your company.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
