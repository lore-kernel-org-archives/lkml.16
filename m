Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F75B19FA92
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612586; cv=none; b=AZtYlHqfogeOQyR8v9mDsiFUUBTj8+hsv0WZ3GNzjumG5cMCi40iLA0DbzabAD9iomLRSqPS1Nn32+qhY+jPNEG27avd0Icv4wYcJA0IFF1l5GepoiuFQdJvC8dGfg4+xC6tRR+3JpQp0uecZpQs8TAQJa81a3rajDaIcdVnh3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612586; c=relaxed/simple;
	bh=cpn8A4zoLhDaSlyxrOD4O65Uuyt1YcZ9xpPGbOgNtig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbjwBkAW/nxiEH32qs+aREIfzpBZtEg+wnnvPEem8y1x/yORmI8sS99nwAwQ72R9gpXv7q9oMWtD0GYqU9XfQQlqlxG10Kc98HirIQHwWmTjT1PQDdiQaA9quhdyaaEkTmZMnAAm07Z9T20Y/WlAK81aIomB5JXYXf918JV0/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HskB4Nvw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HskB4Nvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED047C4CEE2;
	Mon, 14 Apr 2025 06:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744612585;
	bh=cpn8A4zoLhDaSlyxrOD4O65Uuyt1YcZ9xpPGbOgNtig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HskB4Nvwb9MHOEn52rvk8D0gahIPG9q/npHskyFWiY1D3I5DiPXd+f2C3OtqQn5K2
	 f1JIH6Npc+O8pgpLPKoPfn1OMqdr4iliZwIi1HGETT9WhwVGN4n0uP27QJATFhMeqc
	 bb+Or+okZRDYlRm2TqcGC3y9ZfDHxOcunsrkRqhwnDQ9nX1tPxe23fRqE2ljJtjwX3
	 deUxqv12He3nnbl6zBc0GCOHGBmfMC/4sonDMPsXa9OGLqwxOBZj77xzSnUblL33+C
	 0uHsRC3vy5qc8MQrA72uwd5tRF5EUSiQzeiJIoQbRvl3w7o3JwCZtrbdIc4rmC0o4x
	 qdSeslvtc1ymg==
Date: Mon, 14 Apr 2025 08:36:18 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
	paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
	willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
Message-ID: <Z_ys4jJ8MQ4-kW8P@gmail.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414034607.762653-1-ankur.a.arora@oracle.com>


* Ankur Arora <ankur.a.arora@oracle.com> wrote:

> We also see performance improvement for cases where this optimization is
> unavailable (pg-sz=2MB on AMD, and pg-sz=2MB|1GB on Intel) because
> REP; STOS is typically microcoded which can now be amortized over
> larger regions and the hint allows the hardware prefetcher to do a
> better job.
> 
> Milan (EPYC 7J13, boost=0, preempt=full|lazy):
> 
>                  mm/folio_zero_user    x86/folio_zero_user     change
>                   (GB/s  +- stddev)      (GB/s  +- stddev)
> 
>   pg-sz=1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.2%
>   pg-sz=2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.5%
> 
> Icelakex (Platinum 8358, no_turbo=1, preempt=full|lazy):
> 
>                  mm/folio_zero_user    x86/folio_zero_user     change
>                   (GB/s +- stddev)      (GB/s +- stddev)
> 
>   pg-sz=1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.57%
>   pg-sz=2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.10%

How was this measured? Could you integrate this measurement as a new 
tools/perf/bench/ subcommand so that people can try it on different 
systems, etc.? There's already a 'perf bench mem' subcommand space 
where this feature could be added to.

Thanks,

	Ingo
