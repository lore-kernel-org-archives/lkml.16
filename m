Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7215C227EA1;
	Tue,  6 May 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519051; cv=none; b=cFra0PTF5egFWPS8zgZr/GlGgiAM2gtFUl9dF96rRH+pYzNP7mXEeUYSeqyej4Oe6PPR1evKhcrHgNuyVNn3kAXNcQWOYcnyvHQr4EtPVM1QWDMR6sGL2Vr34BCTmPqD/r/5VfPWPaxPNTXyvNgXxqtJeklINxj/gr8yalkhu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519051; c=relaxed/simple;
	bh=sE7co3/dVAvEaKILs88LONOZNr76UNHWgjyT3LLlIwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdUvshiU77naeeDd9BUC06iIth3uTtkIX5djMFPD9uLeYfTrcA2bkQm4Q7Dzmt1cIwBsdZ76cH4yOmbt7FYBsVWMsAYBvZvyy+HtnvAi998VjHxPPxAVZ5W9RT9VQkexWPiZQ0FmOwqVTo0tS46AeyY2tRDXeSXFAmmmCR8+UVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMs6fh9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMs6fh9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A3CC4CEED;
	Tue,  6 May 2025 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746519050;
	bh=sE7co3/dVAvEaKILs88LONOZNr76UNHWgjyT3LLlIwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMs6fh9+MmfIMv6FK0J48BpgGbMprtaUL1hDaezBcmBOgTd8/TL9l3K/TVd/9A1NZ
	 5qiI7RNPMBiSaRftCQcO2vTEmeF13wPJ/uUDop8qtnGbQUXg3ms9PlkjtJppvO4rXo
	 kErREivFmfN+aZJtq+oCntl2K7spWwuaWh4rywqlYktOQlkbptocH8EsbkXm3jdo3E
	 oc6CNae/taHr0iJLq1bJhB+sOhbw4GVaqqlP8b4SdJ68bN4yT/iSup67TfXY9fiZop
	 0E91XsHZyaB8sa1yHdP2FkyQBAICvkNOKrFNL3jVtu19w/nHB08FM4n1/6eQYscuv5
	 w8u92RQ71QR8g==
Date: Tue, 6 May 2025 10:10:45 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 19/26] x86/cacheinfo: Use scanned CPUID(0x4)
Message-ID: <aBnEBbDATdE2LTGU@gmail.com>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-20-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506050437.10264-20-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> Refactor the Intel CPUID(0x4) cacheinfo logic to use scanned CPUID access
> instead of issuing direct CPUID queries.
> 
> Since scanned CPUID access requires a cpuinfo_x86 reference, propagate it
> down from <linux/cacheinfo.h>'s populate_cache_leaves() to all the
> relevant functions.

Could you please split this patch into two parts, first one does the 
mechanical propagation of the cpuinfo_x86 pointer down the function, 
the second one does functional changes?

Thanks,

	Ingo
