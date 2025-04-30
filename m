Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6B82FB2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001547; cv=none; b=WRQurUAAbGOb9RVwoMEc5uTBsihQe73s7XAAEZ0jSA8R1lwvC/77o3aIQZEwVlaV+J3/nz5JANq3azZnCoEEzUN27IqB6bDbRkZ2/FMaDRbagrYWsl7QPzVVXz41lDVScnisE9hW0mzkWpnkaJ3wVNMO3VFpab5Xu7vo/FP2SMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001547; c=relaxed/simple;
	bh=3/Fpi8D8Eu+AQh4PoiDJ53uvF6phLy9L+PU6/sQgXQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NClO7Jv7oAj62jPJIU8on2WZCgKoiZSB99I6cDKIM0MsNLiQkdr/IBQVF85ntRNrjmr/x7D28kfurw5sDDgSzr9YJNC9KjLyg0u0GNIm9MEJQN6hps7P+wN1L9RubvbnBYCqAYokFDu8eUkYqBs1J89/oz3SID2T8MiWZ63bAD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bOCZ3BA7; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bOCZ3BA7"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 475BC40E021A;
	Wed, 30 Apr 2025 08:25:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9AXnRWtiRPIR; Wed, 30 Apr 2025 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746001532; bh=nFKuHbMF/6Tei7ssI7FcV65eFP30e4K57vmFspEjxCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bOCZ3BA7dRkb9Kv4pYRo+WEWypp3/l6Tyww1o/Jm6DVhRGzWdpLNCmQVea16NkfvP
	 b29gxu0PphRf7qPf0ce1f8XVfqWbST3ZYrgwOkGkbUu61O8C10nFfEuW8xNoaBsYbC
	 cldpz9z8G9Ch94X51rv0eA60IdZTjATHBEJXxdeXxnLdmEf7bhyC/qyIZlCCTDHZ3v
	 +PRBE1tB1YhU2oEdELXbqLKLm5dNUn2sonuYr5ItpBKF/Xk2iw0uT0xSc5rdKLVrA4
	 VDGzmJZMntgvwA2bq3rWSAfxhvaVssda937Hz6JOmhdA8lmLZALMsKcdEW4aX3lUHG
	 Aqa0C7YXCWgcH4x35hn6pMKifnybM0mePEyhJWenVAFhVYneAOTnGr/cUlsqkmr7NY
	 tt4h6fNIx1Dxtm5LY24j0Z8zhC4bi5S5bsLuwKp6krsIRzqTjskhffdRgUCqoHutMn
	 3jlAQrl+L1GI3ytIBwMy1PZg/4DX5Q7etJ2dcDLIfI2du/d8I5IxQKDK/HoJ/coI5k
	 GGIhgMZNmSx0BG9+Djc0qzhNtxs9iRpNN2tOS5PKDHhlifIVY0t6fvn/rGHH7YSCWM
	 w4lFQgdhCbYhVRcW0oDCQoHSnaBqkPChfEL15ny8poeFZVkDq0hAxCJqLg3TxMwjxu
	 GzxMpdU0YL1BzBFYthA+I8tE=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A3FC340E0219;
	Wed, 30 Apr 2025 08:25:22 +0000 (UTC)
Date: Wed, 30 Apr 2025 10:25:17 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 16/16] x86/bugs: Restructure SRSO mitigation
Message-ID: <20250430082517.GBaBHebXphwVNGqbsQ@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-17-david.kaplan@amd.com>
 <20250429165032.GHaBEDWM8qeeE6nfxI@fat_crate.local>
 <LV3PR12MB926560C299979A7606A7417494802@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB926560C299979A7606A7417494802@LV3PR12MB9265.namprd12.prod.outlook.com>

On Tue, Apr 29, 2025 at 05:18:27PM +0000, Kaplan, David wrote:
> The comment doesn't make any sense in the new structure.  In the old code,
> SBPB gets enabled at the start of the function, before we check if you're on
> a Zen1/2 with SMT off.  The comment arguably made some sense in the old code
> because you're disabling SRSO mitigations but after you had done the SBPB
> check...but the comment is pointing out this is ok because these CPUs never
> support SBPB anyway.  Normally, if SRSO is off, you try to use SBPB.

Ok, lemme add a note about that in the commit message.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
