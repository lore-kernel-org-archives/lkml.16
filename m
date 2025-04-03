Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4F71519A7;
	Thu,  3 Apr 2025 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682667; cv=none; b=uf0+YzxG03hrSUJ2ZA6UItEAParZ3dL77vZtW01ZPq4uTqot52hV67x5mm9YRSabL+5N57F051Fr5uqLiCP7pqRKQjfraFZ15gQA0VYZkXCA8Ums6oi+RNj0z64av4Fx49zGdhAcUcFI6xawImWYlCfJ11UHmLSd3t4FTZu7xrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682667; c=relaxed/simple;
	bh=Myuw01x7b+E9VsDxG9J88fADalEZTbnnV+9jRrHGi6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnQDtmiRZ95EAGrsjhvr2Zve0MsykLI2bZIlWjbG5N7UEPmdclPr1kQNXg+/saTIY2rFlDTbNVXbWObcbp2JYxxs++v037bbVfNj81ByRbGfyNUuS548u1gOk80BP8ScUJjs+e6RI6JtNoPF2We4AnLEZwFF8P0Ra7GGdVvDnmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Jsa9NJOf; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Jsa9NJOf"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E92D940E023D;
	Thu,  3 Apr 2025 12:17:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FDffeTNCz9gO; Thu,  3 Apr 2025 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743682660; bh=e5GtJ/9eus26vLFrAZRW9Bzu+GJAIIAcETSkvtjJncY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jsa9NJOfiwlOPxINyXnLQFaZNZi1DkZvjVcvMKZlGgyW0agoTKMVaImQjduhImTU5
	 CTxwK5o1cXpH+EGllbgZdSlDUUCw7adR/qg58lTRzZFwmwWtlKNi3bh9wcgeqvsrWC
	 pkgPZ+tz1XM+Ad7vkWnhh6Q53k5EFNgR5F0rvIvFOYxTItrbg30Rq2rcjdPJzDxtx+
	 6ZKbYxlMN3e7cwFJ2EyB2FqsNZFTC1TGmrpf+JwVPiqvidKd9mixOzN+ahhHXXzImX
	 3ea0E+LOGhkfOmurvFPS1EJyMJKWCkCv0xLK3WT3UBBhBMqIc1WoXUh8V9CVjDUb/L
	 gKTUVgnT5Y3ocIlLcJAozzkXLYcpsvwx5fQaU+rqXfs/rZqJu/VCWYRGhrCJSDh7qT
	 3nJmNH1+Ceb4AUr6AdkkrTGL1YRp1+1yBznZm0fhCFtlqXjmqc8uMwz5zhcbg8koSj
	 nveQawIbvS383uvHoRwsdCz+ACkRMQefs9P24fe5GHAonJLAOemT3gJAgpMqyeYDWJ
	 Ty/iduZtJdm9a42KHqKOaBBJYXLf6wEYgQaXdqimZNkrQKg/94d43xEz3T16NzwIKM
	 rMB6Mn3uo8taP3Vaq+/tQvPtUoQ34+0ZLc3igrCRBw3cOp1J1t+s7l/4CIRDUQjrUH
	 SDDogHqVQTWZe6OsGZGfSwAg=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B1EC640E023C;
	Thu,  3 Apr 2025 12:17:32 +0000 (UTC)
Date: Thu, 3 Apr 2025 14:17:27 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org
Subject: Re: [PATCH] Documentation/x86: Clarify naming of CPU features for
 /proc/cpuinfo
Message-ID: <20250403121727.GFZ-58VzYwaTBv4rbu@fat_crate.local>
References: <20250403094308.2297617-1-naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403094308.2297617-1-naveen@kernel.org>

On Thu, Apr 03, 2025 at 03:13:08PM +0530, Naveen N Rao (AMD) wrote:
> Commit 78ce84b9e0a5 ("x86/cpufeatures: Flip the /proc/cpuinfo appearance
> logic") changed how CPU feature names should be specified. Update
> document to reflect the same.
> 
> Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> ---
>  Documentation/arch/x86/cpuinfo.rst | 42 +++++++++---------------------
>  1 file changed, 13 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/arch/x86/cpuinfo.rst b/Documentation/arch/x86/cpuinfo.rst
> index 6ef426a52cdc..fecdc36e02a1 100644
> --- a/Documentation/arch/x86/cpuinfo.rst
> +++ b/Documentation/arch/x86/cpuinfo.rst
> @@ -124,37 +124,21 @@ also defined in cpufeatures.h.
>  Naming of Flags
>  ===============
>  
> -The script arch/x86/kernel/cpu/mkcapflags.sh processes the
> -#define X86_FEATURE_<name> from cpufeatures.h and generates the
> -x86_cap/bug_flags[] arrays in kernel/cpu/capflags.c. The names in the

This is not the patch I saw in internal review. The script still processes
cpufeatures.h

Please go through all the text you're changing and verify you're *actually*
doing the right thing.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
