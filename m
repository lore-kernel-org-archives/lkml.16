Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C17D24728E;
	Tue,  6 May 2025 10:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527953; cv=none; b=IYgkRpMgGadfekiIiMJZLqaCgXfSCtcxF3lmFkHIcPCDg9x5EmBU6XnpO7NI2ER1wkuD4FeemAUSqPFjWu6Cnez68N9TbrAGiAWyAQww7zGYTTl1nBZiQgjWvnr61AKOJBH0bZjzrrrgpE0vrf/q0o45haBheVIDI2DXqgVsKV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527953; c=relaxed/simple;
	bh=AGcugH0MZQoABaP4ndF6YTSPFWWsznGLgKe11JWoC38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MF9S97U5WB0ErhU9hXo3XRgYpokxoIcWt272QmCUPrBhtWCqb5pzA8d+q/O+K3SV3OZV/6F/AJAgjEv3ObeFS0aUPeLRuQPExoviRhJTyjS9+hZj2xEPOTXwwIb0QESn0Ao4AG0NlT1GrzF7BxXFV/UxrTGMOX0LANnDNqgY+lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bY51umrQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bY51umrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEF1C4CEE4;
	Tue,  6 May 2025 10:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746527953;
	bh=AGcugH0MZQoABaP4ndF6YTSPFWWsznGLgKe11JWoC38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bY51umrQSdfYfIvZxRv9a7fON/DWW6cigdT19HW9gTKiQu8cB3Zcg5332DJESysFX
	 bFvVgClwKpiZ0MANUEJ2MBieHD/igPF+72kVLIeLqhkKmx0Kq7JqLcaekheQSli0Vb
	 nqObLxJ0weTgLzz5DoL+3uJwoI5og9DPP4I4wb9TqwxG7bg+BMS0PQiSKYY9yCHPnc
	 4Bsos2+XvrWliPVmpiPxxFhtytwxV60a9SGmSGIsZl5kfjC/EqEaSQb5kQL+2pmVUn
	 /8OUlRpm1T0Q0L1UMgcwG54mz+R4KGHOnBU1JwrfJ2fuc5IfWmJrksKlApLc5Conpc
	 IsPXc/PBh4VuA==
Date: Tue, 6 May 2025 12:39:07 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 13/26] x86/cpuid: Scan CPUID(0x2)
Message-ID: <aBnmy_Bmf-H0wxqz@gmail.com>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-14-darwi@linutronix.de>
 <aBnFRrnZQ9HwwULK@gmail.com>
 <aBnMprnsFmPJDqaW@lx-t490>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBnMprnsFmPJDqaW@lx-t490>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> On Tue, 06 May 2025, Ingo Molnar wrote:
> >
> > Could we please emit a one-time syslog warning & diagnostic when we run
> > across invalid or otherwise weird looking CPUID data, instead of just
> > silently skipping and sanitizing it?
> >
> 
> Sure; will do.

Thanks! We haven't been doing this for any of the current code, right? 
So depending on how frequent these messages are in practice, we might 
have to tone it down a bit - but shining a bit of light on that dark 
corner would be informative I think.

Thanks,

	Ingo
