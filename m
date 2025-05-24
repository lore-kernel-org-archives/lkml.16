Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353C4C98
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748078998; cv=none; b=duiadSOtGjwRJQ9pdoI9NNMx262ZnqIHJ2vEJK3z8qXHveKSSviu/wtsfUbROp1X/q1QHfQLUmJMtViFXJGkmPrP0R24pZRQLD5F6FzgO7T04QN9GbwEskK5zxbiRpFjxsZDjxDZzp7rJbo7N1574nkU3yLtqZ5uebFj0dJ+PNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748078998; c=relaxed/simple;
	bh=yqiizPXANFaNXL49xKo2MzOc8w7hMWMpUlF1HjK78eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POeRgY/wcYgsuiEuXEMldwEqDA1rnjIfLvbIpi5k4ttB6Egcf/jjtV8d8RDddu6UjWgEXOe5w3uMNhSa2bhEsoLcwTdTZ1kQjBQY9x1L5CQM7FpDdS0JqOOvLvZRjwF7Kto11OGwEOnjp5PRPYlqvdLjC47cvR4yWcYnVno/ZzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FheSrbry; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FheSrbry"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ED39940E0239;
	Sat, 24 May 2025 09:29:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LXb7hfH1lM7s; Sat, 24 May 2025 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748078982; bh=jp/7iaedpRwIWx3C1Iiul1/VhF/j8hCpI3GbkahmYRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FheSrbrylumLp4fQfAtOWsVr0YEaZIftkdsIYeoWpYi7FSNZGVCe+zWBPM2Ip9MaQ
	 /SgTkkUPy+nwaokrQJ3Gj1g09GcJWx3uZ1/Y0nXBofiZd16HFFLxdyux89g7dCh0ix
	 SadTMOpDNQj3gYTVPX2rLe6glIWlGWw/3kRFLUG5J5JSJtoB8duKNTBUtO+dChJ+sr
	 fHtHbZ/JRqIXm8rEiZt5hHg4oPEukbAbOL8qBKgZzduNShtzkfogkJ/bb5W7g4Jcd8
	 rWTDBc1Ka9lxFO/oLVvP+rtHBtJJSB/3+NUBvupiiOQ4d77XEir2hnR3zSSXLK3FQZ
	 7iQkuLq1IzLUgmtWyK+2PqaKqpg7BdyjwkV9NZUXb2ckwc8tApddxMikGZDKu6/o6w
	 2iuCvA9wi68lksIiHcGtk5l+9/z9GVB/tk/PJJE15uJ+XQiA6BGyFr1TeqRSJ/W0hy
	 /GosATxKpP7crQXePBbTFM1zzkJv0B0tjpwKIBaXxlsk4uxPgNyOC2arLX15xGy/HX
	 Oc4JdP2MmiotW22ql25Sndf32+LuwIbaO2rVYiVnQEDQQyBdlOvJwyZvOGRwtuHTku
	 1nWIHlnX8+QtV29IhV0Z2TWQ1Zpi07xYwkFta+uqRRUxmexO48QIGWaS/ItDpjyLg4
	 uh0dgN07/HjrqEAdjbbNPqCo=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1E78640E0238;
	Sat, 24 May 2025 09:29:36 +0000 (UTC)
Date: Sat, 24 May 2025 11:29:28 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v3 1/7] x86/retbleed: Avoid AUTO after the select step
Message-ID: <20250524092928.GHaDGReMdD4aFyCBq5@fat_crate.local>
References: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>
 <20250522-eibrs-fix-v3-1-12704e291e1e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522-eibrs-fix-v3-1-12704e291e1e@linux.intel.com>

On Thu, May 22, 2025 at 06:20:31PM -0700, Pawan Gupta wrote:
> Retbleed select function leaves the mitigation to AUTO in some cases.
> Moreover, the update function can also set the mitigation to AUTO. This is
> inconsistent with other mitigations and requires explicit handling of AUTO
> at the end of update step.
> 
> Make sure a mitigation gets selected in the select step, and do not change
> it to AUTO in the update step. When no mitigation can be selected leave it
> to NONE, which is what AUTO was getting changed to in the end.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Yap, much better.

Thx.

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
