Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646FB1401C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589349; cv=none; b=ayi+svJT8eNvMnJ+EauvK5La4WL5sk0m3OClegY51CIepyrZxqP4JHBDNVpokYBaYuVfNEJqlpacTAiNureJ/7GceM3FbCOGnxswxpjtfi+dV7CHT3mYUAvni6is3fHHqbLJjd93AJMS9OaJLhgZRg4JqTZ4+4WNFlykbJe+Dh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589349; c=relaxed/simple;
	bh=SFD+fYAHtU3I4sS0Ymzv7d6kmgk+4nwQ6+vnWHETBBU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rwJk1I1+650Of5oFQqrmjiiDGnzgaokJ1CD+afsXTBZ7ceRq3lhblMR6cHnRELpdswODvo9fW8+rUv5wzQXRPURODPkz9b1S8sP56Ntbj3s0JTmwXg8u/q2SiwVvx8JSLgazqT/U0N2kwiak8NieLO6vUexfr/TOgh4x9n9QcwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=klbBWQRk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="klbBWQRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD6BC4CEED;
	Tue, 10 Jun 2025 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749589349;
	bh=SFD+fYAHtU3I4sS0Ymzv7d6kmgk+4nwQ6+vnWHETBBU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=klbBWQRkmK9TYPKbbsNeq0EH2IngBOVJqXiy0StmkIEyS4rXK6xUuJLUrPJxut1u4
	 OsgI+fYNfw8ZFtnirRPdmFLIWTA3Misacd8xG8DH3/YXbBIpSqfcNn999pI8MLySXX
	 KfoSiRocJUi6yPSHPjhwN6fJ9HCLriBqp0zEOuoY=
Date: Tue, 10 Jun 2025 14:02:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Ying Huang
 <huang.ying.caritas@gmail.com>, Balbir Singh <bsingharora@gmail.com>, Donet
 Tom <donettom@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm/memory-tier: Fix abstract distance calculation
 overflow
Message-Id: <20250610140228.7836d333cea973a8171686fb@linux-foundation.org>
In-Reply-To: <20250610062751.2365436-1-lizhijian@fujitsu.com>
References: <20250610062751.2365436-1-lizhijian@fujitsu.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Jun 2025 14:27:51 +0800 Li Zhijian <lizhijian@fujitsu.com> wrote:

> In mt_perf_to_adistance(), the calculation of abstract distance (adist)
> involves multiplying several int values including MEMTIER_ADISTANCE_DRAM.
> ```
> *adist = MEMTIER_ADISTANCE_DRAM *
> 		(perf->read_latency + perf->write_latency) /
> 		(default_dram_perf.read_latency + default_dram_perf.write_latency) *
> 		(default_dram_perf.read_bandwidth + default_dram_perf.write_bandwidth) /
> 		(perf->read_bandwidth + perf->write_bandwidth);
> ```
> Since these values can be large, the multiplication may exceed the maximum
> value of an int (INT_MAX) and overflow (Our platform did), leading to an
> incorrect adist.
> 
> Change MEMTIER_ADISTANCE_DRAM to be a long constant by writing it with the
> 'L' suffix. This prevents the overflow because the multiplication will then
> be done in the long type which has a larger range.

Thanks.  The changelog doesn't describe the userspace-visible effects
of this.  Please always include this info.

I'll assume "minor" and it's been this way for a while so I'll add a
cc:stable to this change and shall queue it for 6.17-rc1, so it will be
backported into 6.17.x and earlier kernels at a later time.
