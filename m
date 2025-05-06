Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4F4B1E79;
	Tue,  6 May 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519823; cv=none; b=h2rAyE0YdkGwECAOLxnFBieKYPF0BWNk8yAf1jToOFt4nrBZlFHP2eAQ4BcnM6T0hywqNmaB38hTV6MXZ9WeptKW4WV21mRAsUumfU6h4t2hjiTOmIAMgtHfRNRdvFbSVLkQMWwyb9/dq5GVcSzzvnNyCFC2tDFrfY3pH8y03SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519823; c=relaxed/simple;
	bh=5nK7BajdHwS9NuSso7bF4GMIkFqFDbBwB6yQ17hogaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpl6JQv2OcLbtomCKYQNLSOvlYVFQPrj3rZgOrojIqRjhvq8y4Shvs3Y+n5r7jQgS93ezzzKPZVLBAmSYUbdeTYxZsSLsTW7Gjn5LF7ggEyqUA40YBbEHNWX2VIVT8Lh3n6dSzYrW/HMrpaX/NXzwuc3W+BBoodKRLbaE0q8lC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzE977nM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzE977nM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C78DC4CEE4;
	Tue,  6 May 2025 08:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746519822;
	bh=5nK7BajdHwS9NuSso7bF4GMIkFqFDbBwB6yQ17hogaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzE977nMEDAoV/uyts0v4WkeFiybW1zz6ty1qpnXu62QiSnH3bgeILvv23p5UGHZG
	 K2AzyKMXvMoxRfG6aZKa25SzD3KrkvB9XfZ9rXa1vVYljyMrGWFSrvLchWMRuQuKvd
	 98Kokpbd4orrfr6vz0FYXP0AZqhgKV6DwmU4frdJg/Nbdu2E9sVp4STQfOvnLyWEYq
	 Zuoh+Oru/uq/d68qdJEbFd190RWM8gkid5QdyMIpFKQ7CbI2e+Z+7KrsNNamfZ6IPp
	 vSkU1oQHGtBVr6Pq/UmZy0nYvbMYCi1dZtA0be3LuOo9moWd8YM4bibToM05lccYTJ
	 9mT1hEccYFZ7Q==
Date: Tue, 6 May 2025 10:23:37 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 00/26] x86: Introduce centralized CPUID model
Message-ID: <aBnHCbo4OaWpM392@gmail.com>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> Ahmed S. Darwish (26):
>   tools/x86/kcpuid: Update bitfields to x86-cpuid-db v2.4
>   x86/cpu: Sanitize CPUID(0x80000000) output
>   x86/cpuid: Introduce <asm/cpuid/leaves.h>
>   x86/cpuid: Introduce centralized CPUID data
>   x86/cpuid: Introduce CPUID scanner
>   x86/cpuid: Scan CPUID(0x80000000)
>   x86/cpuid: Introduce debugfs 'x86/scanned_cpuid/[0-ncpus]'
>   x86/cpuid: Introduce external CPUID table accessors
>   x86/cpu: Use scanned CPUID(0x0)
>   x86/cpu: Use scanned CPUID(0x80000001)
>   x86/lib: Add CPUID(0x1) CPU family and model calculation
>   x86/cpu: Use scanned CPUID(0x1)
>   x86/cpuid: Scan CPUID(0x2)
>   x86/cpuid: Introduce scanned CPUID(0x2) API
>   x86/cpu: Use scanned CPUID(0x2)
>   x86/cacheinfo: Use scanned CPUID(0x2)
>   x86/cpuid: Remove direct CPUID(0x2) query API
>   x86/cpuid: Scan deterministic cache params CPUID leaves
>   x86/cacheinfo: Use scanned CPUID(0x4)
>   x86/cacheinfo: Use scanned CPUID(0x8000001d)
>   x86/cpuid: Scan CPUID(0x80000005) and CPUID(0x80000006)
>   x86/cacheinfo: Use auto-generated data types
>   x86/cacheinfo: Use scanned CPUID(0x80000005) and CPUID(0x80000006)
>   x86/cpuid: scanner: Add CPUID table rescan support
>   x86/cpu: Rescan CPUID table after PSN disable
>   x86/cpu: Rescan CPUID table after unlocking the full CPUID range

Overall namespace suggestion: could you please use 'parse_' verbiage, 
instead of 'scan_'? Even if a lot of the scan_ uses in this series are 
a temporary back and forth that goes away after the conversion, but 
still, some of it remains.

Today 'scan' is not really used in this context, in the kernel at 
least, and I don't think it's a particularly good fit. 'Scanning' 
suggests searching for something or looking for something, which we 
don't really do: we parse the entire CPUID tree in essence, during 
bootstrap, and re-parse it when something changes about it on the 
hardware side. We don't really scan for anything in particular.

Does this make sense?

Thanks,

	Ingo
