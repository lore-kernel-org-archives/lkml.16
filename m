Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D625E471;
	Wed,  9 Apr 2025 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744199020; cv=none; b=InJNxuF75IMtgWQJ7BpteO30uoMXvmm9ZVmOnejR52aGpPEwNn9DXLp1sXEsRlvMI63NpaLPudjUyePj8vY9RnBPSLq2Ph4FCI/Wy7IGjaRIF9gR94929o0825GHhTszXA/dutZkmQoawUYTgxCcFMKruYVXncKGU4LesQ7GIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744199020; c=relaxed/simple;
	bh=/ExwSPSjB5A67WWvkavS/Xj8MeFFIKCvmUnKkrHdxss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAuP+eXcm0TtiE6MT5FJM3PAVulDA13t4Y1XeO+i4HIEkwEEmm08yRcbX9wraJ/pKGkiS3q2qSIm7xefmn+u/h62mc9Dkr6CDjtiKDx+qJ5D3Odgt8S+cMkNnSyxjsMiOq2xbCZt7fVnU9tFatuhT3vT8f+Nd3cOgJSISBrp1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ap8n6ozw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ap8n6ozw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F8AC4CEE3;
	Wed,  9 Apr 2025 11:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744199019;
	bh=/ExwSPSjB5A67WWvkavS/Xj8MeFFIKCvmUnKkrHdxss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ap8n6ozwg6WEWWceStLoX1sudClwRpVYjGvLV4c9TVajzEI6qG15P7fd/BmiZjju4
	 T8yhnxBTXMJhHs47hfLOlsIFtRWb1D+9Mi19mV7TjdAuI6S0Uu4udvH9HiawDQ4H8u
	 LmygXeaJrd8liyJ5GHiqypSNG0p0zzfDhkFBZerL3DFbbXOZDlFkrCt+jwUZDhOTBZ
	 rS/RFgHADeRuu+r2o7sGlD7ujxs1DuYCW9pbLLnWUb0X3eTWon1oqWD4DWXtA1HQEW
	 HB3kjtnhUFOxondC//AUg2EPGz4h4im93nuUckazZw4dR3xdk2vKjRDkdlIYbpX0QE
	 lTAyvOBIfLNLQ==
Date: Wed, 9 Apr 2025 13:43:34 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/2] x86/cacheinfo: Fixes for CPUID(0x80000005) and
 CPUID(0x80000006)
Message-ID: <Z_ZdZpJqgeZ16Fwj@gmail.com>
References: <20250409105429.1048199-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409105429.1048199-1-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> Hi,
> 
> While working on the x86-cpuid-db CPUID model on top of the CPUID(2) and
> CPUID(4) cleanups at tip/x86/cpu,[*] I've discovered some L1/2/3 cache
> associativity parsing issues for the AMD CPUID(4) emulation logic .
> 
> Here are the fixes on top of -rc1.

Could you please send these against tip:master?

tip:x86/cpu already has your previous series, and I don't see the need 
to create a version skew between v6.15 and the x86 tree for v6.16.

Thanks,

	Ingo
