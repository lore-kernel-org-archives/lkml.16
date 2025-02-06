Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE7E1547E9
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828340; cv=none; b=M2e4VfZn3Bfnsd983WYpEZigzZm93ujA/+SIC6zlsxsiZPUFGP0XgRSPkVZivLh2NEyH5RG89R9OSqTb36SeQGySVAIjjDaIjcIMqjPhaLwTYwhQ1hfQSbTOx0M1cHM1U90kmkghRdHwjl4eMrfYsKUIDaa0lZu/ASNTMGv3BiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828340; c=relaxed/simple;
	bh=88KiQixzKQj5rRXEekbKnJmhNWTZtXqiwpRxpjLPSJU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ChbtRQsxQf5aSZpEgejOwMMxrMHTuCYIvAcMU1vDyCc41keuBxjhg+OGxY8AyKArSHzvODELALJJctZqgTqmKfIsC6JtFm9b85tSpsUX7OStLkFU+n+Pk1HFQud3GovAKu76JwB3ZSCkJNSACRUwwCpiz7M/Wk6lg7W1G+bwPOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=s/04mWHL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="s/04mWHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C493C4CEDD;
	Thu,  6 Feb 2025 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738828340;
	bh=88KiQixzKQj5rRXEekbKnJmhNWTZtXqiwpRxpjLPSJU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s/04mWHLv/q0fTizs8GnPLLAN21F3yucrVtVGTFut5UMv/abPKUv6mx1R+nfI1F86
	 NYoh/PmmwupjFT8CL9zWItndkNSsA1RSpozAdPa+MRDLFXrkFaEQQgCR172XSZRqpa
	 YUqUWLrX2t36zIOACa4NI6+RI8Z4OUDjcNgySxeo=
Date: Wed, 5 Feb 2025 23:52:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Uladzislau Rezki <urezki@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Ard
 Biesheuvel <ardb@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Dev Jain <dev.jain@arm.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Steve Capper <steve.capper@linaro.org>, Kevin
 Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/16] hugetlb and vmalloc fixes and perf
 improvements
Message-Id: <20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org>
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  5 Feb 2025 15:09:40 +0000 Ryan Roberts <ryan.roberts@arm.com> wrote:

>  I'm guessing that going in
> through the arm64 tree is the right approach here?

Seems that way, just from the line counts.

I suggest two series - one for the four cc:stable patches and one for
the 6.14 material.  This depends on whether the ARM maintainers want to
get patches 1-4 into the -stable stream before the 6.14 release.
