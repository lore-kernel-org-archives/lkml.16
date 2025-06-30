Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A864D28B7F8
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301621; cv=none; b=i2Go+8wWWD2vIaUDDi62Bg6/RlxUpAw1WbBF6jM/VUHCtbatQ+h7VsyHZMQLiniTZjOEAWn5XsKnaKdvHe/3yrCZ51Jpmw/2ETTi93DmAvsZn/xrrKnk+2ldgIIWRp9EgiTJ0WzIvQfBMAtKNQWUHrc3L7bj7pehnoDYmuZBpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301621; c=relaxed/simple;
	bh=jki0h1NHGFVmZAwYmxh/cJW9V7O6ScYTAzRwB0qrDNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXKOCmafCy3+9q9IUgQc1H/fgPMRE5Ty8L6ULpQuvHxqMNCuhGQLtkybd3ScxvVxpoumpNt/awuScUeANM6JqgK8dxtak8C740HOi8HYtLt5XH/quwoz2gNZ3eIkW77PmVbGRi6eLtMhRG24cMqCfzawjk7kQzLOE5k07a/ls0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=TGfVspu7; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="TGfVspu7"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7004540E015E;
	Mon, 30 Jun 2025 16:40:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NZnHYx2rHRcH; Mon, 30 Jun 2025 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751301614; bh=HKAo1802d90Q9re1lgzauBIjiweHmu3Z9OgaTlEKLUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGfVspu7tSpY/Xfnr/Fdzb6Ogla5CjqslyMhki5WKTmeV12STNLBiedBC/Pu9dIaL
	 NGviMLDXYkZui2UCI7tiZ5+i/bIRf8hgkjlGrWdeara8hB2pW9jAyaGCzb2Pva0ZVX
	 8tHP6RsV63XcVfOi2Zk2ln5aoaB718G3ORdGh3oRXmo9adUzkOE+MCrkJ8KMp+ZBi6
	 ej0dpxuoDrZszCAuURs/OWxktBygerHBwMnq9etrURC77RdEuHSVJdrjVCR6xoD989
	 BCx44cfDwas1YgfhEGp5NGEz2f5jgpZkBYuAhxgWb4wg7D/jYBwC++hWZ9ZVr1p66d
	 9TxMPsFRX0rbZBGGSa4Mcj56MLl5xRRbnZMkF8AYbaX+nuUxrkNcqUBFGAI8zzjnpr
	 WneR9OIyygJA9tW7XY4r2iVShN2YjVpppjhccqhcINDycUzx5k9COpOsVGb/WsIitT
	 hRdvCrDsNxBeRKeLJx804JGQissBwEj9g13Tug59dCePaJ+njkBAmRRpYJ0CQ6yyKa
	 BABXoQynX+HjQtKtmIjRBWSyEq9XNnTElScPw8lsd7fnw6MuFPwGbrstqaRj+CDGdj
	 4Vq20jWDlGQOgPsg//y+gJ5V04Pjv7wTQ9XvgtMaENHHXx++AR4UzsZ9zPs/T0hO5K
	 YtJX8G0WsuB7CGI5Vp640gCU=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E7B9540E00CE;
	Mon, 30 Jun 2025 16:40:03 +0000 (UTC)
Date: Mon, 30 Jun 2025 18:40:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/20] Attack vector controls (part 2)
Message-ID: <20250630164003.GHaGK945bgZlMdRtq_@fat_crate.local>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509162839.3057217-1-david.kaplan@amd.com>

On Fri, May 09, 2025 at 11:28:19AM -0500, David Kaplan wrote:
>  .../hw-vuln/attack_vector_controls.rst        | 236 +++++++++++++++
>  Documentation/admin-guide/hw-vuln/index.rst   |   1 +
>  .../admin-guide/kernel-parameters.txt         |   4 +
>  arch/Kconfig                                  |   3 +
>  arch/x86/Kconfig                              |   1 +
>  arch/x86/kernel/cpu/bugs.c                    | 278 ++++++++++++++----
>  arch/x86/mm/pti.c                             |   4 +-
>  drivers/base/cpu.c                            |  67 +++++
>  include/linux/cpu.h                           |  21 ++
>  kernel/cpu.c                                  | 130 +++++++-
>  10 files changed, 672 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/admin-guide/hw-vuln/attack_vector_controls.rst

Ok, I replied to one message which is needs more discussing but the rest looks
ok to me. Feel free to send the next revision once we've resolved this so that
I can queue it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
