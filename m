Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0606F1AAE13
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407394; cv=none; b=hqb8ja9s4FJMbvYfY3H03TnFdTA1Zf2nVhx1dlSMUCUADq2tlHuX58GEwu1JyFSQOtNPm5TpcwPeN22bJwRjtH3c6JVrVyj1ZuePIVOms6ZYn5T7gV8dk2b3CcuwNlmiz1ojQkuZacXKrVfjvBWArRULa+hhp/P5JlQG+OMjPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407394; c=relaxed/simple;
	bh=5Vvd7zQOtBcVeoZIh3z7GQDSiXKnwjTmCZqac6Uywzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDskIU2buVh/rY3ytvAgN7tOTSf3/XgNcrnJbrmuSF3FjlU1KZDuVsbNS2v48pyB3tfGQBAm78YDluvvGEUq2PxENDlTK55iN1/uH0+FDc3GP5t9XUx5WqtvDdQgmi8a6dqn7BupivhrDJTV5708ZEH6x2emc7H/ichfiThvSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=f72yQSZf; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="f72yQSZf"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A237740E0239;
	Fri, 16 May 2025 14:56:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kBt0zxmgUwaA; Fri, 16 May 2025 14:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747407383; bh=dkG4Tj2c4D+ncCjxcAP/kcrKa4+KsqbdebOSlTMn0Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f72yQSZfFni8myLeFrNIFg84lgy8SiFhEZ/74khf4R0y22syCjyYNqlg4xHYpLOTw
	 +XAxeYOpUWGB1iEbG3FE1mtzQ1UgAERHpRDTpli1M4E6IuTi578JFr/FiQ65J8auIN
	 Y1JisYSpe+w+jB/xk0rjwZMX/B15worlwLTemdginFA/1KvAHCcvsbv2VQ8MikyIhu
	 1bfUXP7UI+yyWKjW/SlQy211z1Dkiy7DwGpqAbeKMsSLKwGAwmghi1zG30NF/Rlj3y
	 VocbJ+vEi8q6ktq41ABe91nkJYpGoSLsipyuC/nULoiWurqojbPty6RXSkRtrD4+PA
	 4ErKe0cU8Qg+2r5db6CocgEbjDe1AV9tmuCWgYLLscuGtqEM4F2WNCYbyirBv2mIWC
	 yHgBldZxsDTHxMJWWyyU05h5TC1CwOmsvcK5m0Gz+WShCHeNznrNEmXqDx3O1i/L24
	 tmUZLE2gScCWArooxZiGuCI9Gs1oNjA8rvIkU0gOe6d6sQ8nbIMCJD5yI4Fh5pQJBv
	 HvnqQRlGtI/x+PkSqT+YkJhYvnemazb9EHvSo9Ud9HeBzQ6xtdPn91P31v78J1kEcH
	 BwdJLfU/lx5F9phUoBbidU7GMchgwGAZJ/FYHeVsBTmyaplIgKH4R2Mz1nw8KYBAJY
	 RBeMRXKqKGH4KmoAnBKOXEJI=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B099040E016A;
	Fri, 16 May 2025 14:56:13 +0000 (UTC)
Date: Fri, 16 May 2025 16:56:07 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: "Kaplan, David" <David.Kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/bugs: Restructure ITS mitigation
Message-ID: <20250516145607.GDaCdSB-7i-YfaL5rR@fat_crate.local>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250515211159.njyxgxuxmyhqx46m@desk>
 <LV3PR12MB92655C23DF46F1F3B88139009490A@LV3PR12MB9265.namprd12.prod.outlook.com>
 <20250515220243.fk4z7rifcxdm2e7h@desk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515220243.fk4z7rifcxdm2e7h@desk>

On Thu, May 15, 2025 at 03:02:43PM -0700, Pawan Gupta wrote:
> No, I am able to apply now. Earlier my b4 based script failed because it
> couldn't find the base-commit. It works when I am apply manually, sorry to
> bother you.

Yah, tip/master changes very often and gets regenerated so the top-most commit
is gone. Just apply manually.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
