Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B50B672;
	Mon,  7 Apr 2025 21:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062419; cv=none; b=GpHakEJEbQBBZjck2kiyfxZbOyi7cNZPoLQ0OgGp3YB3sXhuj4ZgtazlyvpNlOuzl2EsC4lxTYVuzoGNqwtZA64K9Y17A+eS9eBg4BpG8ur+wsVJi3iq1VjkEan3QBz2OmIDoPW5poZQ1rzhY6GjKsYspsC1UZZu/6NrMkse/VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062419; c=relaxed/simple;
	bh=HBF8mYImPvPD7MQncbzyPqGMMUEh30XVZxRyD34JT68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2HRIZ5j+3nFR9OHnzKIR8Sd8Rq5/RtJyzELlOP7aLt3zqA/bFwfmFUx9C8P21FVr8b8+Zim5p/xn+ewizKibKU17bLSE6QV9Un5ITlYudqiFHqtssPSoXDMNOasw0FGCDg88CvzDYRps5Qsw6qBXKuegqeVH9FGZp1nEy805jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=J5wjaaEa; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="J5wjaaEa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1ADBE40E015E;
	Mon,  7 Apr 2025 21:46:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id amHDjFV05che; Mon,  7 Apr 2025 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744062403; bh=yIJ3dg9I4y5LJUUaZcadGSRUwVKQEIu4ViDQbeRKPX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5wjaaEazhKN3FIFKiwG9DdTOA9Gfu+EXI/cgEQMJNRCv2ePFqtl9yB1/ZdNq2FHB
	 QKfvRsWeEFmO88jUosQ6ueWEI7nakdTLvQ6OmQvcwovUIJTxwZ8HXPmWblYM1ptZAP
	 tFo8oCqMv5A9OX4X6U47xAG3vkPOsZGooD4952N0bUWWcBraq5TLv/0jvuyaLFOA14
	 B/3z78FBZ/WIY4ctjWJ2+fmkKkByfYxSjoW/XjQYmHBT0Wxo/wPW0IKoS+aaJH5kOD
	 jKhWcPmN5CFJKyqW/23+2LHzQDDRsQBhefOKpHml1LjQ9OKyoDauQRaSHcF6GfcIEL
	 56BnoYHjWMLKdxbGq3aPCUcCAvXaUW4qbgEOVXXUw2J8rEEJFYpzo/+PIU3Sv3xJdN
	 jYl47+EwLVykfCDr3uzA/WW8Ea4ilWRtTT+5G/gelvDVe34g/bmcdu4Tl/C2oX5ywG
	 Q/HJ0SRU++ImjwFpJG/0UcTe18jztpVrhoI4UNiZiKvCkOBwmLVOjLdos02J+hhlmJ
	 CPFSJByk5xGJEarbkmWuEXrFxcLKAiVUkpOrut+Vg73ckX+5HOD/81g24mHnZOWacH
	 ioF2pFnkz2/G+HOJcPFGMv0Ac4A3uVeid203U4a/nEi4Dj/oCsTh0JtbbNpZT4DVCn
	 qcWLB3XeIam9LRxkZKEIO6Rs=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A88B940E019F;
	Mon,  7 Apr 2025 21:46:31 +0000 (UTC)
Date: Mon, 7 Apr 2025 23:46:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 2/2] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <20250407214624.GEZ_RHsCPSfyM4r56w@fat_crate.local>
References: <20250407162525.1357673-1-superm1@kernel.org>
 <20250407162525.1357673-2-superm1@kernel.org>
 <Z_Qdn_WYAalNAHOi@gmail.com>
 <ebfaae8d-7186-454f-ba06-b86fea357d03@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ebfaae8d-7186-454f-ba06-b86fea357d03@kernel.org>

On Mon, Apr 07, 2025 at 01:56:57PM -0500, Mario Limonciello wrote:
> Boris, your thoughts please?

Right, how hard would it be to decode those as much as possible without
having users go look somewhere first?

I mean, we can always go look somewhere for more info but for starters we
should display as much useful information as possible.
 
Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
