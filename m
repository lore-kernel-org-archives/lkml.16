Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEDF946C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751836765; cv=none; b=uX3lD2zeW9KrWUyAIP/3qE4ahPoPa2IVznDidDkREJlZJM0tzA8ONBLleg8yOcYeqopsBkfNECeMvBAqD6L6MM/yK3aExAmsyaJxCsMmt6d3vYassYuS4thK/81l7JFC5lSues1b0TAVQFDfN7MEdKE1seZJFO75EyndWg8R0L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751836765; c=relaxed/simple;
	bh=9BKQrx9EZkndTLazOxDx8qbkrildIG3q0C28m2r9oUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmtNSFsCFtww4YX3DgHgIRECEzHI7nInxot8MuZxmdIj+2JeD6rhME0WqvUeqdtj6W8P3/ORZgcoIm19v8Eok0rLW4nV8OPJYRrbU2YNTohyueb7WF5jl96OSTwpGK0vCGH30AhKI2Y8fL3beI8br0TWh2cFtHcC5Zk15vp7Ld0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cu7T67GY; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cu7T67GY"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B2C7D40E01CF;
	Sun,  6 Jul 2025 21:19:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id O2OdS-AuqMZC; Sun,  6 Jul 2025 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751836756; bh=VkrzIxtnmvaEAvm97csEiimgd/PmE8bMZJLl0K/dgd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cu7T67GYKI7a5fAWAEFilYjEjQeUMNInBcAePnOMPHgl4xeR4otwB4u7jVQjxO8Hq
	 Pr5gqH5R/E/JYKq/6o++jMEEu2LMctIg/xqdzar1FWHkG21ekmVV1TTlm21JiB/G8i
	 d2XLH/OvGFS1wiQf7otSAmuNFqda/QbcBtqZ0uSJf9OD0lbHykRfvHOp0Y8Cd45pko
	 EA23Lfij+U0MyXrGRrDzYbiIQKCQ9YD/g+aWuY93DojpNVcgTkXLJTyMkAP7v1EGB2
	 n0ACEqvEHz554DmM2wMR4JozR4YPhi2pmDemsB3uvr0QmWpo9LbDi1nrtWoKv+4dv2
	 QJ85rK4fhjswGrK+cxRFndkbNZXnBrBpd4HL6mwzUFA6qUaMVPZPZ346EgR3B6EdGZ
	 +FtM7uC0WLlbJjQh/tq9nuGehgwDH1UfIhGNcb0v29XrMJIV5MLG8lohT90Tu3W0Y5
	 7fwCGQ88wq1KRpIra9rVXGvckTH0SK0CJKMGPm+c4ItdJs+tqmEsNQsOiUdOYAzDJq
	 x2xNkCn97MhY1m6QhgXZOubJ1mfMRfeE1XwE3XkYVkcVCZd/QnoJrZKYZyn4V/J4Ki
	 aJCtdrcFxXcl9+4P4akhdhBUR4KwwkfwVx7Dxv6Hy313xqX0CpMb4CZctV45ueFvpY
	 bwLV2d967NtQQRuMgP94OdaM=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 71AB340E019D;
	Sun,  6 Jul 2025 21:19:02 +0000 (UTC)
Date: Sun, 6 Jul 2025 23:18:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/sev: Replace memset(0) and kfree() with
 kfree_sensitive()
Message-ID: <20250706211855.GBaGroP2vqE-5_Ar86@fat_crate.local>
References: <20250706092859.412471-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706092859.412471-1-thorsten.blum@linux.dev>

On Sun, Jul 06, 2025 at 11:28:44AM +0200, Thorsten Blum wrote:
> Replace memset(0) followed by kfree() with kfree_sensitive() to improve
> snp_msg_free()

Improve how?

> and silence the following Coccinelle/coccicheck warning
> reported by kfree_sensitive.cocci:

We don't do patches just to silence tools.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
