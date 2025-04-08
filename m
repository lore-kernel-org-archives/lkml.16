Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B0822577E;
	Tue,  8 Apr 2025 18:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744136120; cv=none; b=qtBZkpBjy3y9GR75nM8UDjCo0iL+o+6/H5jCfSWunIIjEpgOex6orJSMdQk7RCt/6fxeBViy850RTfUcPMUt4us5IpxjGcoeByDlHAnoV/xB93FERnfmZKvskKguYRzQUN8nSlMGye0TiWg3ZT+pviF0VxnZkBYGTYr1QPb6Llg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744136120; c=relaxed/simple;
	bh=QI0LuiJv1QGct6vF6T/kJ4ThegGdqEHlXTWUcLe8Ae8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=es+DclslyDIL3Oee22vjb0bnFIs6GvF0fwtBn+HqOmKpKs9ueLno47U4axKpMYLvvbELn/3bhklQEUKbBgP12YG/6wD3VW6ZhnjKyzWMCOXbzWtR0IPexSzuh6fxRzfCW4OsmpyYvWm/aAKN3DIn8UmsDrbsTlxYpcbEixQIajA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=V9J/P5yq; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="V9J/P5yq"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2089140E019F;
	Tue,  8 Apr 2025 18:15:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4ud9fw2qBZaA; Tue,  8 Apr 2025 18:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744136111; bh=c5pCLnMyOcxedFh7XU+XAOcb2LrvDEUAYiCWmCSsZXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9J/P5yqIu3ftRiOgoNB4OmjpT3Dem8qsH4AeBk2kfMDGzwDfcZ2/kqCHuMaGJN5l
	 9SGNUmDTIFxHci9LfkPzsC22122TXjkj1lQuqSjeDk4yw1kmVM/+ZRESASiqpOaF9F
	 ndMGXh8lBNgvFM9e3vHjAhIORcDbZqSsiMvtUlSQiSYLh9GwzDAdcV7Bytz33piv+R
	 yWN6l6OwAVUvQLJBxqD5GyHnpoPQjBM6H/B44Tk1qmsTt+zTE9jqldjVdXbBW5j8UO
	 H4av+eKbYpcbOug8Sv4vFnzzLwhKIO7DYLNDrrg4y4t2igkS9Vq1/fta2hJkz6K48A
	 HNbcG/0lPOPTHe9vjUlNg3yL5IwiljlkX1XYGhW3qTY6FPin6pAZcEjZo051VEAEcr
	 pWHgExohHS4ByqfVxtiHesB56584UFtD143m9fGaugTBf5XhfJX0lxfie0E+QLzN6e
	 Ck6R9AzCsHxLvDP12RjYZWMw0QolS61+m6ws4ncpRQCE5ylsgxjPGOiPsNhhzXXk09
	 F3qbznhT3gMj8LZw+k2aslmHrA5MsIe+0AbQ5Jr2qZLL1hTk2/EZpOR9LGDfsMnPXu
	 yEe6w2PgPIOw8MZNEDc4CM5ADvHnYONslmcmTi/PJvKGLYg68qMbxHfKt715w9GE+L
	 1HqKS/leFwV504aYM5OXKSBY=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7CD5640E015D;
	Tue,  8 Apr 2025 18:15:00 +0000 (UTC)
Date: Tue, 8 Apr 2025 20:14:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 2/2] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <20250408181451.GFZ_Vnm6JXaItfwVpK@fat_crate.local>
References: <20250408174726.3999817-1-superm1@kernel.org>
 <20250408174726.3999817-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408174726.3999817-2-superm1@kernel.org>

On Tue, Apr 08, 2025 at 12:47:26PM -0500, Mario Limonciello wrote:
> diff --git a/Documentation/admin-guide/amd/amd-reboot-reason.csv b/Documentation/admin-guide/amd/amd-reboot-reason.csv
> new file mode 100644
> index 0000000000000..c31c7a0464c38
> --- /dev/null
> +++ b/Documentation/admin-guide/amd/amd-reboot-reason.csv
> @@ -0,0 +1,21 @@
> +Bit, Type, Reason
> +0, Pin, Thermal trip (BP_THERMTRIP_L)
> +1, Pin, Power button
> +2, Pin, SHUTDOWN# pin
> +4, Remote, Remote ASF power off command
> +9, Internal, Thermal trip (internal)
> +16, Pin, User reset (BP_SYS_RST_L)
> +17, Software, PCI reset (PMIO 0xC4)
> +18, Software, CF9 reset (0x04)
> +19, Software, CF9 reset (0x06)
> +20, Software, CF9 reset (0x0E)
> +21, Sleep, Power state or ACPI state transition
> +22, Pin, Keyboard reset (KB_RST_L)
> +23, Internal, Internal CPU shutdown
> +24, Hardware, Failed boot timer
> +25, Hardware, Watchdog timer
> +26, Remote, Remote ASF reset command
> +27, Internal, Data fabric sync flood event due to uncorrected error
> +29, Internal, MP1 Watchdog timer timeout
> +30, Internal, Parity error
> +31, Internal, SW sync flood event
> \ No newline at end of file

Do we need that table now?

If so, why not integrate it into debugging.rst?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
