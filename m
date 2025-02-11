Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71301FAC5F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273870; cv=none; b=QyKvJBeh5B4pBxvtsMFSVghbLqwQur5T29uI1HMhe+EQJ9wqY/ENe4POeodq97S3LUy6WxNA5qA5mP2yvlQ+++LDEk3qqmozMI5BEnULtt3sBzo4dJc/Q8CHpe7GO1NiGDCCahHbnsVWLAQjeYrW5msR5UN+DoDwqLNTISHmR3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273870; c=relaxed/simple;
	bh=aWV10uWkY4w+gAmHyX/AesKJcmHthKZlI+oIxpvDdZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riMJ31pguZTpqSanIdGbykdJBoUAeytqTkmTMyEAQxM9d5S/keJhgTjOAn78+IHsAnpEMFPGOhy7ZL82tfld5FG2SJ4+0SQ5f7jUIptNXAoitf26Fhigmt7o9kbL3mUdrE+BxAPRlp6uH+n0EFi9WD1sqWk39OXPZFVJ8rIzZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E3C11424;
	Tue, 11 Feb 2025 03:38:09 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23B183F5A1;
	Tue, 11 Feb 2025 03:37:47 -0800 (PST)
Date: Tue, 11 Feb 2025 11:37:44 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
 <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>

On Mon, Feb 10, 2025 at 07:14:58PM +0000, Mark Brown wrote:
> On Mon, Feb 10, 2025 at 06:41:09PM +0000, Mark Rutland wrote:
> > On Mon, Feb 10, 2025 at 05:49:33PM +0000, Mark Brown wrote:
> > > Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
> > > userspace") added definitions for HWCAP_F8MM8 and HWCAP_F8MM4 but did
> > > not include the crucial registration in arm64_elf_hwcaps.  Add it.
> 
> > Looking again, it looks like KERNEL_HWCAP_FPRCVT also isn't wired up?
> 
> Indeed.  I'll add that separately.

Given that KERNEL_HWCAP_FPRCVT was also added by commit 819935464cb2,
I assume you mean you'll send a v2 of this patch doing that.

Mark.
