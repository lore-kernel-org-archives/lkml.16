Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C167E1991CD
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743362915; cv=none; b=SjOUP8x3LPKF+cy4CPjxYUhfX8a/oM+FGjL4o6X2GKYiTjJf0v1GAULcpzQNSCvIrxJ6VXm6F+annDCqxdS8DJPGwByGWCTLKp36b/qMkA0KIYxSqM0MraOfyBfBGrKSZPs4m6QX9kiGX8vLpv+bvg1VdE6q1P31keDU1lVd3Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743362915; c=relaxed/simple;
	bh=oQ6tDnrzI0Gr+iIsTCpw2Rsmp5ujG/ASFsYqXQTe+VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5egmvZvYVjf7cju7CmNeColSNl67Z8aiEO7nd4vPDw+a3ipbXiZmP9wEF7L+S8SD+Zy5MQ/7AwsXTo9/Hohy5Vklld2o/WRGJG/G4SzJhGMvfiJH5FJSPrdk6jhabEMcxaLmM82UZHtr+0eS/8GCHLe52ytQHIekCMCg2HsAlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=c5CBWENj; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="c5CBWENj"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6F37A40E021C;
	Sun, 30 Mar 2025 19:28:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BLYi_yRK7l-5; Sun, 30 Mar 2025 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743362907; bh=1xcoUUfbyxZ1ZXPtdJxFFHfiV61C0zHs+b0Vxar86UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5CBWENjnbXfTYKfiPrQXXsHpjNhUJ3r+9M2PnnsL98ClPdRB42MQtZQIgIEsqhCJ
	 yUdgVHe+LCZ5p15oXrfYmXMCYc4jMS7WY7+uD9u7e8Xygii1sSJ3+dfrBuk3s7zjEL
	 mWV+OTPGiQkkYrYSkYWI461gHmT8EM5U5UDJd5ZGFTSJRCj+6vhfJP1D0wLhW47B8X
	 IvD/ezXLwbQfP4S2eyDdnOxQzVW1gP7wV5bCgFxWQgCQ80lZge65U7yJ5ypUgCadtC
	 VuL24/112Yxvd6OHEQ3QTUWT3/778aOnsnv/l+OA8nN8Kot8HMBkJfyhQ1b+WYej24
	 kKL2ew/a5iPXF3cIiFBrBQGri5qi0Sc59EXMxbrdIQnseFEpWQZL6aDAE8tnT3xkpm
	 toPr4yP8ntDD2RCgntdSXMz3TN1f0jHYg3S+SFr6yteFCiAcFM2Tyn7/W20uGKX7/4
	 uYAr5HTElHffK8TNwo6lwzm/2/USvH35i08j+OzYbj+HyvuXKlQJkVXTAx782B1rGO
	 VK/5wy2QORT4ZRmd5KS4d3zk++tFKOEl/MIaG+4I/CbtyZDiwUUYUWgD8YnpktSr9u
	 xh5vqYnEMB1BE7qU1KgmGU9x0Y1oxKO0JrZyh/MHhxF/Xhjgwbg0Ga9ZKEXciY8a7z
	 39WOXCFR+gJKpq1PFUZZQjGU=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1B3DC40E0213;
	Sun, 30 Mar 2025 19:28:20 +0000 (UTC)
Date: Sun, 30 Mar 2025 21:28:13 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <20250330192813.GEZ-mbTd6ZIHWr52gO@fat_crate.local>
References: <20250325164854.199420-1-ubizjak@gmail.com>
 <20250325164854.199420-2-ubizjak@gmail.com>
 <20250325171141.GDZ-LjzaPbAG1MwjZi@fat_crate.local>
 <CAFULd4ZT5mjjEXW3SnGQVMo18fO8CapFS-ikLQvYFw5EKtEfmA@mail.gmail.com>
 <20250330173140.GCZ-l__PVdSx6mj-zL@fat_crate.local>
 <Z-mRwxb3r1yrH332@gmail.com>
 <20250330190651.GDZ-mWS5RRwsN8Q3g4@fat_crate.local>
 <Z-mZfCvep7iMrqoU@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-mZfCvep7iMrqoU@gmail.com>

On Sun, Mar 30, 2025 at 09:20:28PM +0200, Ingo Molnar wrote:
> Tangible code size reduction, if it can be realized, is definitely 
> 'something', so your claim is simply false.

I don't think you're reading my mails.

What "tangible code size reduction"?

9K vmlinux size?

For sections which are getting jettisoned after boot?

So now the rule is what: make the asm an unreadable mess just to save 9K disk
space?

I call that bullshit. A total and stinking one.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
