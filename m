Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A0321D587
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278560; cv=none; b=dtAhRIDeTZlFmk6bTCyLpb3SYrORX8Yp5/4d9VmqKO/A3bDuNymr4eZrVtHtpJOGYcijR5XcJPQYgTaz3038WSbREIJSo/lVRfyxWXZTCYW1MFkfwSxLRsUqnlQakcBEZVPpKbymFu6mSFR40rWVjYEWzwn3YoABQt0pKuIS4XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278560; c=relaxed/simple;
	bh=DvDj/JstoxxxUNi+ef+ouQhvF1mKmL8Ez99rWYixCyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDzHQUahVJfBolNmR5Qob3H+ABQ2wnJBD4/JwW1eio+dN2JgBgS6amNQMiES/EVSlTnMpPolCwjV3N5gSVMBvNpmzrFCBg4XhvkUIXGWlrvssVox2hV6vz0Eim7S7mrJKkxwtcsDDc8bNBfXKOUKHoK9VfMpQmuuCtf1hsQ2qyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CPsPdNZD; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CPsPdNZD"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CA84140E0242;
	Thu, 10 Apr 2025 09:49:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8wo44ZIfANvj; Thu, 10 Apr 2025 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744278543; bh=+CEoqM5UxK2gsa7RoSFi814yQcDDwJYTR3gCRWdVrPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPsPdNZDGk6SPG0q2GiClvcJ64nWomMCN9Zo08GblxCAZH9xsReeA7O9Z02oGsmSu
	 Foz4f8gW5YLNfgSDYypvEJsnRNl5OiMLGSry3Mhkfbt/rZB3Ac0xdn6wCwCDe9OWpN
	 oqAekZj/G459bIofjTHHDE1AFwhFiqrdouVvs1kplAEXMR8e4OOuz8NSIaf4bIEXd0
	 4GpPwnQK2HElYq4i1qlw8zVQ6piZl5pH7dnQJ3YH+AyK+WleQp8gd9F2kgmTMxkfjj
	 dFQAQcR6NMHDQfomY5shGwo8gMu4AK9DAppW7NQ6YssKvvOxVhIszwJb86q6485sGE
	 WMmsVkCW0y02k1vrnPwvBTC9McRMdghgWwoDe8+g7jy4l5ynMcuOEJzcxK8tKSBE9U
	 Cga1tJVBvNVqedXZqpqWlpWGkJE+lSPDq2/LOyh+s/je+5M96UV0H/Zyf8T8LfBASt
	 nmZqOuy8onYjTmFokDk2laRArgGMefv5O9k7TiDtYZJbO64abI9eX1guBkAqui5Ylp
	 sx7NHKISan6yhfi9S5S369u4vKV3p7+zE8VONOzUqEV/j52RMRBXaYS9AiJ0LoG+mS
	 Nz1hvCHI1y09E0G/wKPm5hb5XzRHa5u03LdCOn6VJVB9NtnPXyjAoZTzghXxazYFFP
	 ruVMbuex2FrOypQCwEpogNHE=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CD7C140E0196;
	Thu, 10 Apr 2025 09:48:53 +0000 (UTC)
Date: Thu, 10 Apr 2025 11:48:47 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: fix multicall debug feature
Message-ID: <20250410094847.GAZ_eT__ab_VRmb8uk@fat_crate.local>
References: <20250327190602.26015-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327190602.26015-1-jgross@suse.com>

On Thu, Mar 27, 2025 at 08:06:02PM +0100, Juergen Gross wrote:
> Initializing a percpu variable with the address of a struct tagged as
> .initdata is breaking the build with CONFIG_SECTION_MISMATCH_WARN_ONLY
> not set to "y".
> 
> Fix that by using an access function instead returning the .initdata
> struct address if the percpu space of the struct hasn't been
> allocated yet.
> 
> Fixes: 368990a7fe30 ("xen: fix multicall debug data referencing")
> Reported-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/xen/multicalls.c | 26 ++++++++++++++------------
>  arch/x86/xen/smp_pv.c     |  1 -
>  arch/x86/xen/xen-ops.h    |  3 ---
>  3 files changed, 14 insertions(+), 16 deletions(-)

Looks good, doesn't fire here anymore.

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
Tested-by: Borislav Petkov (AMD) <bp@alien8.de>

Thx!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
