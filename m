Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188BA8F5B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750608106; cv=none; b=jZmZDv40q5zHCmJRolnClsBMXwxGadHVN82xzndvZqfCbnr181yG29mEmQlrS+l9C3ycada7SpDkG3ickaNogGLLIf6b6aOuwaOfbhL/E7c+yLV2qAJJ+pBOsqwN9p5JDnYkjIHrnyJTqeznIQDjLzSgtHBGApG7ce7BObcKfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750608106; c=relaxed/simple;
	bh=YUgjSlLHrJUWwJMenC27/5IrTMiMrJHmIgWw3A5CqNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7BTGQPeiqbu9vfOWjmln1Ism7QEJg9Ndd8okAgj2c2QgK+biy9OI1g3Ze8v2VKe3M1GSdz4heXPspR8o/mCf7MjQ5TpmlcpJdP533GiNuodVsFtUhRBakBmIAu+skT9P3l1W78Fz26jbLqHyZbA0UYcCD4tLwCVr4CV5HtKb4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gTNvZpdv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gTNvZpdv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 793AA40E016E;
	Sun, 22 Jun 2025 16:01:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l99tVGjY6oa4; Sun, 22 Jun 2025 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750608095; bh=mH44uo+saicsAJwgLJXjKrLnll6pCjuFieM/I9w7U2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTNvZpdvcZNIYB/62hfQHa5IClQ8akc0M6X/qhziE60OWbdqPMdutPg3gQB6olpZu
	 6I5vy4DV/DkFIU5BLOYXDcLYtU6KzFVxu9SvgsV0FXQiTWRib8TCrMSb1MmTyLdy63
	 YFovRVaRoeM0ExPhPQNT3/UdpcBF9IPmJpHxdQf5UWQpRXX6H3K3zPjnl5wFUmTpg5
	 Nzo4cjvGy40Q09oNldTq1sA1jfdqpM/BJF2sosm346o5ADBJ4kj4Pfr77CiGVkVzF0
	 su2jnu1u2bRiN8n5w93YbhxpxLcwBz3qIbmTwphDT44SoUWEg229+zuTJTmdTmZzoB
	 OrGvmTBJTBoroPu/w5z+I/4UOsvdGlO9BOYsP+VM1zlQI8Uwf9MEynCOFoPLNjmiGs
	 payzqg5jmkVL83P5U8HLczW0h/aPgjJ7JylODOrR597kBmCTwG1q9ow7e6jEifbrxB
	 +9ehgIOhXh5RlCz88kJ7dGatmJstCgOWESdskFPbITe7JJv7WDbmfb1DXABsCRPCBd
	 7ZXRjRCzRWEmG58t+iQqtl28k3zuSZKYw5hp7rOei0C0+TjrGa4q8+etthQ6qSAb49
	 sH5CfbN3AQ002xMqBver7FKqaHrcnY2uhoyhurb4l1UFWjssq17XwQjw0hmYtesuO2
	 6sjPqBOxf36VwVzUnIKVf2zo=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AF48840E015D;
	Sun, 22 Jun 2025 16:01:28 +0000 (UTC)
Date: Sun, 22 Jun 2025 18:01:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: Re: [PATCH v4 0/7] Retbleed fixes
Message-ID: <20250622160122.GDaFgo0tAwyUpIfiGS@fat_crate.local>
References: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>

On Wed, Jun 11, 2025 at 10:28:44AM -0700, Pawan Gupta wrote:
> Pawan Gupta (7):
>       x86/retbleed: Avoid AUTO after the select step
>       x86/retbleed: Simplify the =stuff checks
>       x86/bugs: Avoid warning when overriding return thunk
>       x86/its: Use switch/case to apply mitigation
>       x86/retbleed: Introduce cdt_possible()
>       x86/its: Remove =stuff dependency on retbleed
>       x86/its: Allow stuffing in eIBRS+retpoline mode also

Note that the subject prefixes are "x86/bugs:" not the mitigations themselves.

https://kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

I've fixed them up.

Otherwise looks ok to me, lemme put them through the test.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
