Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F3127715
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747950085; cv=none; b=BS9NRK6QBAgIsQ7YHH9QBbnJDlmQdbBl0zSP1My+/UBUZxYHekujg8WdtXhtwmwZqeLLZ64pGqYpEmi95AD7gTxR2bLqLlFCid/WTA2phK2vf4MJH06I8s+QUSI4330H244q/53CiehpNFR888d6Xgv/PeuomkWfRK63Q6FMDqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747950085; c=relaxed/simple;
	bh=he+2sRVubcr00g84FwAU4s4wrWUr9PX03DT0mFf4m8Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HabyBeegRztu9LuN2NqMNNzbfg/bxPpE9ajUBad85QockyPSnt79fyqjAmJ8Qi7cDnvkW/lLJaIWoWRLJWf0yTlu5WAVABcwYEiFuVoFdW1sMIwrWN5LD+N1PaIk4g+tWT5GYcnaSMCpB5/qsmSi63FM5FIBFJ44j6O9x0WMonk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ty5fe1sq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ty5fe1sq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D4EC4CEE4;
	Thu, 22 May 2025 21:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747950085;
	bh=he+2sRVubcr00g84FwAU4s4wrWUr9PX03DT0mFf4m8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ty5fe1sqtdT/AbjwL+zXpZghKZeVBQlAzsMdfvks67ZBsSRpfSrTsDv7dPn2waP6/
	 llJZaYeXlBhzELTCixWIQTlTkiu9GQh8y2hckOGLjvQmxd9eILZnHGX81dY376invO
	 GHDhOrWlm3OEyY5e2wVG0HM7BfnnFZ1HYwdA+XSQ=
Date: Thu, 22 May 2025 14:41:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: kasong@tencent.com, bhe@redhat.com, hannes@cmpxchg.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Some randome fixes and cleanups to swapfile
Message-Id: <20250522144124.2a3328d6e23d9948bc5b25d0@linux-foundation.org>
In-Reply-To: <20250522122554.12209-1-shikemeng@huaweicloud.com>
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 May 2025 20:25:50 +0800 Kemeng Shi <shikemeng@huaweicloud.com> wrote:

> Patch 0-3 are some random fixes. Patch 4 is a cleanup. More details can
> be found in respective patches. Thanks.

Cool.  I'll add these to mm-new but I won't advance them to mm-unstable
until after the merge window, so we have 2+ weeks for review and test.

I added cc:stable to patches 1-3, so they'll eventually find their way
into earlier kernels.
