Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881DD28F5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279758; cv=none; b=bKRYyE3vlVOJEOLK2sC217g0AT4jYv276lB4/3rs1MyMmDrFkqEwd9rJWr8+hKeFKAK9LZ54+vc6ukAOkDXT7ddeIlyc+p0JRPJI/6GYNL/2d1/2kMznyI68Hf8U4JnnqExa/f+V6ZWXWEqjiUq6knDN/TF0774cCRJNek7K+vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279758; c=relaxed/simple;
	bh=UYHrtGkQr/4jiaOk2U59sAXeDCp/0l1oSnacoif9blY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6Kr8xzBBKP0hKpfFxdQ2t4lYwJ0mP+1u92x36Osk5NRR0jAWYNEahnSm4o05uO5HjXwebimU5BKkv3j9K+smMz1PayfFjC/QNYdGAU5klj9N54m0Xid2RFI45TPhw8CbfyzSpXdmOCZWXYyvJXIy0DBEorU8PrfMWKoj5/Dspg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5505A1424;
	Tue, 11 Feb 2025 05:16:17 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C92973F5A1;
	Tue, 11 Feb 2025 05:15:54 -0800 (PST)
Date: Tue, 11 Feb 2025 13:15:52 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <Z6tNiIMIhN5fPSJM@J2N7QTR9R3>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
 <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
 <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
 <bec2a37a-1797-41d2-a44a-a34a54a96f89@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bec2a37a-1797-41d2-a44a-a34a54a96f89@sirena.org.uk>

On Tue, Feb 11, 2025 at 12:58:10PM +0000, Mark Brown wrote:
> On Tue, Feb 11, 2025 at 11:37:44AM +0000, Mark Rutland wrote:
> > On Mon, Feb 10, 2025 at 07:14:58PM +0000, Mark Brown wrote:
> > > On Mon, Feb 10, 2025 at 06:41:09PM +0000, Mark Rutland wrote:
> 
> > > > Looking again, it looks like KERNEL_HWCAP_FPRCVT also isn't wired up?
> 
> > > Indeed.  I'll add that separately.
> 
> > Given that KERNEL_HWCAP_FPRCVT was also added by commit 819935464cb2,
> > I assume you mean you'll send a v2 of this patch doing that.
> 
> Well, I was actually intending to send a separate patch given that
> otherwise it ends up looking like two different changelogs in the same
> patch and the diffs shouldn't overlap.

It would be simpler for others if you sent a single patch that handled
the three hwcaps that we failed to wire up in commit 819935464cb2. That
way they only have one thing to track.

I don't understand what you mean by "two different changelogs"; surely the
commit message is a trivial variation of the one for this v1 patch:

| arm64: Add missing hwcap registrations
|
| Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
| userspace") added definitions for HWCAP_F8MM8, HWCAP_F8MM4, and
| HWCAP_FPRCVT, but did not include the crucial registration in
| arm64_elf_hwcaps. Add them.

... and the diff from v1 is "Handle HWCAP_FPRCVT".

Mark.
