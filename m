Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA02F9EC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214696; cv=none; b=LvFvyrMiprKeEv4DFZPbASdYpaWW2C3WRbCbibqdg9BBZqo4X00FffRxJ1YyDKb226oUMD93lgbUTjAj9myYNeqGvO3fwlDBHR/YNJG+C6YPgvNDTZSYXWc5BDJAjLYFDzUi59/xwzalqsp96/JaajIQWM6cl7SUMcBTHXRvdJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214696; c=relaxed/simple;
	bh=Pt7QQPoWmy8Bekvkn4vjd/fGg5NotBVDBt9/9nKQ0Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWWZpvv2chYx9qRUhI6oCT1/SnAsvmybmBqw0I93A0lV9paHV61+4bkND3tYFIffbGUM7zayFzWl/FOvX+2Sk4hxnCFXAxWnFk0T4qMj0lvzMdHLOG1AONPAOCUVyWEkiO8qS4mg8y/QDIvVht9/qyq8SNXaGANdPQTrXenCuu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Bw4gDrkF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Bw4gDrkF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 38FA140E015F;
	Fri,  6 Jun 2025 12:58:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQgywUR7yMxF; Fri,  6 Jun 2025 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1749214678; bh=Pt7QQPoWmy8Bekvkn4vjd/fGg5NotBVDBt9/9nKQ0Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bw4gDrkFIxIW1OLoqyU8dBiO6qqvrYtOfgM4eXPqiY1415vfmLs+wF7+HHeR2N59V
	 v7kXQTSlZgi+g8WCjhMNggjLxv0DsGQSgggcF0h9YoOBlXSpnI8SdwQOy8cPp+kk6T
	 Ql0lzCYEK47QeiUteQJ8H41J7SAYE3+2nljaOm5b3Nl3rX/f10WpQSwFflu1gxnffp
	 m95X0HJLkc+Gwy2EwZU9tMDFaLfB8ND0KiH+c/Ufo9vAq61QtMJMF2xtlGYXFIQ+Cg
	 BBdk/nmeZ+mT7NQAElCnDRVbSeoeTbBGYPG8+MU8oE48e2WHs8xVf0HUi9vsuWtIl9
	 hrTNCPzXroORgm6GIOh7K8FkPWfbrNsYepgRZoCjrkuJqjbSRLxKqgrw8bIGfL1qKk
	 BAA2NqqL9imB7Qq//iHIaS+5tB7CnZzSbEguvVgv0j2U5P/5rZEFOf1xavdLUpusja
	 u6Sa6VfHgoo7aIr+/7+5NxLIqyLHV64Sr1PTZepyd8Oyh/til509gfNKvIXeVN479g
	 M+7QejcopM0t62eRoOdsT55QV6CMe8ZTowBicUm+LBd1wdFfTRSVJPUUw+5HiFxEBr
	 55WWb9kEPoKus/jcZgUL88HMNtlonCgcLvpXYytNQrWrtjt19f/TLRTFvQWJs/a4Mh
	 puOkM+lU+cq/oLA8/3Cy2ojE=
Received: by mail.alien8.de (SuperMail on ZX Spectrum 128k, from userid 1005)
	id 0268D40E0169; Fri,  6 Jun 2025 12:57:57 +0000 (UTC)
Date: Fri, 6 Jun 2025 12:57:57 +0000
From: Borislav Petkov <bp@alien8.de>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org
Subject: Re: [PATCH 0/4] x86/sev: Rework SNP Guest Request
Message-ID: <20250606125757.GAaELl1eQ64YLesdrd@fat_crate.local>
References: <20250505141238.4179623-1-aik@amd.com>
 <fae08232-51ed-cc88-3de0-1cd9b014603b@amd.com>
 <33e24f7a-427d-43ef-ac48-ff665e1c1914@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33e24f7a-427d-43ef-ac48-ff665e1c1914@amd.com>

On Thu, Jun 05, 2025 at 12:40:15PM +1000, Alexey Kardashevskiy wrote:
> Ping?

Yes, please send a new version collecting all feedback and rebased on
6.16-rc1 after it releases next week.

Thx.
