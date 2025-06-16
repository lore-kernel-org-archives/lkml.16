Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B617207A26
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087909; cv=none; b=t04R2IQncNMjGGT/Rpnq1mn7+6D2GrvzEw6j8rB6zZaIZI1msjGlRkh0h/GW7MxxC391Ga2LFZ3Lm6voFvM0GIdCMjUGtBwt6Ixmo820GDQMjsemmXQCRFlatvNmEFF71FbVhGFZ9dLeJnXDa6hK+YJlSrnhmD0NtYN4PKVCXmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087909; c=relaxed/simple;
	bh=7CzTvyLE6DTblQzfw3RD6ogEwZk8s+fdfmjdEcIpXoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJMjs3gesdMgZ0gUaSeEJ5cvSDwiP+SS/1b2vBHvqfLSEGh6IIE5dbLPJEdaIDCivenkrKNF945a5wb6KYRA4nAWZ0U5s0knjLH45USFoSA/MW+ZBC0cHtVfXyWRSMYY2LHutaInB0CiDFyhb/Ba5SX+M8oGmNBf+wFkIp4YTEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=aiNhe1Z6; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="aiNhe1Z6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5FB0440E0184;
	Mon, 16 Jun 2025 15:31:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id feiBQzKPPwPP; Mon, 16 Jun 2025 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750087885; bh=Coru9JF9ixy58nWJOrrolucTaNma61psdrk8eIxWJqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aiNhe1Z6M5zmgNL1sN/371PvhAjXustsg00lnce50ukxmlUN8xmNcXdXIWjq2ovCw
	 Z7a3Jv+x/sUXreCluXbTo72cTuLb9mnohwDnAFnX7Wsx6rL2YFNR/eR/52lCLnjbQS
	 YBZHCNDcR3AIuUvVccx5MjEkKkYM7SA/KNMWAyYAo6AmIbZ2BsxZPvsKLtORuBj6Ks
	 01Mv+CFg0/+Jky2HlSMLYSY2U/T0XhTKs3Epbld9P3FRAQR2gpDakEV62yghMts6la
	 FWrJwwu91V7WC/YgDXBT+0mKU+27gOz2w7/xmheHb6v8+VB93x3R7trYLAQWso5VPy
	 E1mkohKmAVyb7D/tHr0wA17oCvUf3wNAb+IzXGGBOhMW7BMsrGTx+aP5I3gijJhECP
	 y/6yZy/PTz8K/gz6QnJfeM9WAXxRxBfvUK2iM+rVHAxL7dp3rG4El2WYh66IIa0QfY
	 FsUVWrOJpR+avjUk2qyZOK9Wf4gkHnZtRTc84qYvG1YbFV1rFJYR23+aERmXdDSzaO
	 IyiPPhjdLA0htozAjkX1pq+sMSdkb8wTsgQTBIHzRJBFzlhHbqOCLNpExYf/J5lAcu
	 hnq/AH0+DYE3tsHJTYG7pyEYO9EXn8lxVVBl2yCjCoVYvYLucOmsVznQ/q8l5rSxdk
	 LR1V9Cx1dE0Ru8Rj4gMF8CfA=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E6F1240E016A;
	Mon, 16 Jun 2025 15:31:17 +0000 (UTC)
Date: Mon, 16 Jun 2025 17:31:11 +0200
From: Borislav Petkov <bp@alien8.de>
To: Khalid Ali <khaliidcaliy@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/startup: Let the caller retrieve encryption mask
Message-ID: <20250616153111.GAaFA4v85VGWp9qIrY@fat_crate.local>
References: <20250616123605.927-1-khaliidcaliy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616123605.927-1-khaliidcaliy@gmail.com>

On Mon, Jun 16, 2025 at 12:34:13PM +0000, Khalid Ali wrote:
> From: Khalid Ali <khaliidcaliy@gmail.com>
> 
> Don't return encryption mask . This makes __startup_64() to handle
> doing the actual work including encrypting the kernel. The caller has
> already access to encryption mask and can directly retrieve it. On C
> code, the caller can call sme_get_me_mask() and include /arch/x86/include/asm/mem_encrypt.h
> directly while on assembly functions like startup_64 the "sme_me_mask"
> is directly accessible to them if CONFIG_AMD_MEM_ENCRYPT is set. This
> also makes consistent with the way secondary_startup_64_no_verify label
> is handled. On intel CPUs this is not even neccessary, so we should
> retrieve the mask only if CONFIG_AMD_MEM_ENCRYPT is set.

What Thomas told you about structuring commit messages:

https://lore.kernel.org/r/875xgziprs.ffs@tglx

Do it please and then send patches.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
