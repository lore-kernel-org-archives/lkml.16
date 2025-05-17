Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D568A79CF
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488338; cv=none; b=nnraFKUBp4dhy5DnlxXaaYPfuaExEDmvBChueBMcPxmHcw3ul3dyzxTBYpvO+jE1cTG+kliquImNv/gju+BoS9gyHiprt+yPrWb+Yy6KX5CGIyhrygV35z7mz5m7ohRmZ95d2tE4FE+IzdAw4COwsjQ89wVEEpOFjSR/4Re0UQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488338; c=relaxed/simple;
	bh=4RfhA56n5F4xKoJcb11+5kKwLzF6pe294uCBc3dwcnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xs8oAHm9C5wTRww6WAE6PaOt53yGYPCdA3vHL9ZEodwIL5P8P0Lv7KjAZXQcX1/fqu35iIKmKkeJwewqnC4uALEsVLgy7dt2eoDxqSpgs3eqOEJCmAOydxUA+UqJ/lyPkh+jnKRJ8B4VBUHY/o/Wh00Q6DuKgUOug7qaIVvl+Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GqQPH3Vf; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GqQPH3Vf"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3C74640E01ED;
	Sat, 17 May 2025 13:25:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6-o-vDeqMcEW; Sat, 17 May 2025 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747488329; bh=mKO6WXGyEq30nbxfZaMJf2rlQoW4FEBWrUT4Y6GXVS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqQPH3VfGE4RQPdUWqi/EQEreDL+19+3d9S08N8UdGN6oPPECS9qCyJJ87KjO5sCG
	 caQZV7uNUeZQ2rjwTqE4QebeIDTj/S6qL20ldvdQGQVMPYPaPMmJMp8Z1BIaDfcduT
	 Q+qaHA6v5K/NFb4I+urDq3+1a2d0ra6OmODhsINtXz/259vShvXUKd/++FAqLp2v+U
	 RhNXeAmh2D+6nGAmYI7juqmn06WiwkKsN9xrLRa47AdOlOSzWxTDs6lV2HC8831IXx
	 E5O1royumH+BfvcLgNs1tiH7Wpugoe0eF/bORyclUVH4+rL7K0Zap6LJEcFU7MBeOg
	 WfraPE2c0ojTZMyeD9xmIjTNY4ERteMCFg83uI98eDWxycxbDAOXYZAtWflk63hzzv
	 AcNeSA5d5Jr2ak2QuUdDk253DsiuC5B1IIDZ7qnPGJxPOn2YqTFJ6I51Qs6Y7mF6bI
	 yAQIjM9jGKNg6woYlOKYj2sVekMomWzKftJGcJOMKM5yXlkjgMTbHoZGLDISPNPTUO
	 yv5rBey0iIyx55lC3GtSJh8gzGLBaAjAJ5vfHggwlZwkQs2zevQ0z7KFOeXhM68Se4
	 YiLDW/KLAezWMUf5S7rTe3/JglC8Jxh0tTPvcdux/uSp28IC/HDDUghmgEvIgc/2Q4
	 HpnGbl2lvU6sle0j206FgaE8=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 37E2740E0196;
	Sat, 17 May 2025 13:25:18 +0000 (UTC)
Date: Sat, 17 May 2025 15:25:12 +0200
From: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@intel.com>
Cc: David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/bugs: Restructure ITS mitigation
Message-ID: <20250517132512.GBaCiOOF_JuL0V_j38@fat_crate.local>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250516193212.128782-1-david.kaplan@amd.com>
 <ba2239fb-6740-42c6-b6aa-e1c7a575b83d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ba2239fb-6740-42c6-b6aa-e1c7a575b83d@intel.com>

On Fri, May 16, 2025 at 03:47:26PM -0700, Dave Hansen wrote:
> This seems to be explaining what is going on, but there isn't a clear
> problem that this is fixing.
> 
> Why does this need restructuring?

Yeah, we're splitting how the whole mitigations gunk gets determined and we're
adding the capability to mitigate whole attack vectors instead of controlling
single mitigations:

/*
 * Speculation Vulnerability Handling
 *
 * Each vulnerability is handled with the following functions:
 *   <vuln>_select_mitigation() -- Selects a mitigation to use.  This should
 *                                 take into account all relevant command line
 *                                 options.
 *   <vuln>_update_mitigation() -- This is called after all vulnerabilities have
 *                                 selected a mitigation, in case the selection
 *                                 may want to change based on other choices
 *                                 made.  This function is optional.
 *   <vuln>_apply_mitigation() -- Enable the selected mitigation.
 *
 * The compile-time mitigation in all cases should be AUTO.  An explicit
 * command-line option can override AUTO.  If no such option is
 * provided, <vuln>_select_mitigation() will override AUTO to the best
 * mitigation option.
 */

Full details here:

https://lore.kernel.org/r/20250509162839.3057217-2-david.kaplan@amd.com

> There seems to be a mix of command-line parsing functions that have a
> separate 'foo_cmd' from 'foo_mitigation'. What's the reasoning behind
> converting this one?

We've been doing them with cmds first and then based on the cmd, we select the
mitigation. But we don't really need the cmds - we can simply mitigation
variable.

I'm thinking as a future cleanup we'll get rid of all cmds.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
