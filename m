Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F62724CEFD;
	Thu,  3 Apr 2025 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686505; cv=none; b=Jjv1jEuQFXVrN8eKtTVRyP6Ya9NdsYJ8jduOc06MMVY5BgNwo14tYAJq2+F/Zc4N6PPp1JG8UofeBlC3tKCU0vQhebkgoQ5ENPf85R4ayaTSkNKy2/nVfMtkb72YKkquMBBXIe8oFtTE6VgHOUq4F/qCrCzxImB1+1RjF/AqrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686505; c=relaxed/simple;
	bh=bdva1eKkEHYCorR7ulfPbi9oolVjpmQ+Jtp7DmNuC/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXJ95wNvTVEeo3GqhcO1Pdi90Zr0FXmBZryLkKKYCW4qYNcaF55tDlw2Xs/j5EaWO2o9jbHKHXEnbIpa5wVZsVeZ48+732J9iofR9ckyoAxZTijDRr64/PkQvruMx9G51SoNf8XFPIvgL55uhoGDAmldms0swgD1oKkpeakhouw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=TMWIkQyV; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="TMWIkQyV"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3B92C40E0232;
	Thu,  3 Apr 2025 13:21:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Q_9r98CBoEXL; Thu,  3 Apr 2025 13:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743686496; bh=FzxR9ohkc+N5z/HUMgG9KOQXyfn7dVLl5zq1TcWJwao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMWIkQyV18oYqykHeV+jvxxrFzmTxuhan1OJ22/kNtqUzgsZyYzY65NA9hyIVEl9Q
	 oZWb9bVzj3jqAxmg5EE/PFP/pTq0qzLxBZLlPvFH9Rz6+Ag8WFVtRJ1yul3JmzHPDK
	 GtKW+TcuABsEjhNrM1se+I2ZUFyPJ133BcJmLFAln0xbjMU89mrcDJ0nfB7TZ+TIqO
	 Hi3MOXmEx5gjF3797MtjTvtcvRBKCKmgOMFdXUIf6+t8ls4LjLVYDoV3XtRwdvElig
	 IY5ZIi1+s1FFobSjaUtpEioeZiO6ge52NUDmDn7Fcg4Iz0Er1BfgkEGsyRcgLGG043
	 YFbY7+2mGdBOWQcDkMuikmBrvlmx+AcNT9CeCG04SsBCdYKYH6xdy+T703QdtclIST
	 M1wvUjLwryam0C6U7Pc0CH/V2A+qm5e69Rc4wdaa0hPPgYq8qe6jl5eU9lyyjsHOzW
	 BUON65G9+VScntDiI/uyezxFwHyOth1r6sYCSvon35X7bDZ5we/Kd8fOZTcsA8zRYk
	 WsP3bqs+DAVko3G2NHdIIeODLgt6TpyuTbMWNo8QQ25FPoCCfR5M/xuLPhYkf9zp12
	 qaSErSlFabZOIOcVUGTFogw6L667Aab+tH+iYAdUdsFItYlQHT//zZqadk6Fg1VZjf
	 rcFshaC9lOnWRZssBPw3jYXk=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E1D1040E0214;
	Thu,  3 Apr 2025 13:21:27 +0000 (UTC)
Date: Thu, 3 Apr 2025 15:21:21 +0200
From: Borislav Petkov <bp@alien8.de>
To: Naveen N Rao <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org
Subject: Re: [PATCH] Documentation/x86: Clarify naming of CPU features for
 /proc/cpuinfo
Message-ID: <20250403132121.GJZ-6LUVmn5S2BMF-A@fat_crate.local>
References: <20250403094308.2297617-1-naveen@kernel.org>
 <20250403121727.GFZ-58VzYwaTBv4rbu@fat_crate.local>
 <4uxkf5riuv66kdxa7zteubdfsjy4vac6td5z6cckilyiqjceft@zk3mzmfv3lgk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4uxkf5riuv66kdxa7zteubdfsjy4vac6td5z6cckilyiqjceft@zk3mzmfv3lgk>

On Thu, Apr 03, 2025 at 06:40:00PM +0530, Naveen N Rao wrote:
> As far as I can tell, the script still processes cpufeatures.h but no 
> longer "generates" names. It simply picks names within double-quotes if 
> present. I don't think that is relevant for describing how the flags are 
> named anymore.

It is relevant in a documentation file which is called cpuinfo.rst. Because
this thing is somewhat of a magic - and Xen has even more magic there - so I'd
like that file to explain the *whole* story.

> Regardless, please take another look at this and let me know if you 
> think this still doesn't read right, or is missing anything (the script 
> part, in particular). For reference, here is how the flag naming section 
> looks like with this patch:

Tell you what: I'll take your text, put it in the file, edit it how I think it
should like and send you a patch for you to ack. This'll save us a lot of
time.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
