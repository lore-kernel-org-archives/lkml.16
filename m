Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFFC25B66D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751561111; cv=none; b=pxBkFj8X32DXzZuBZ5BFU49c4H158VDCjpIX96dL1Ib5Lj/3RgZGDXMUwqx1ElobBN2KMx2prbQ30YFqbY5mayN2rBASAHnCfM4WVCFvM7CzMSiZ3KpOv+XpDY/OC7r6ggof/pCJOOK+dr+rIgQNz1XeL35IRSGLplPMP5Ov4gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751561111; c=relaxed/simple;
	bh=D8oVn8XKzXs+W1065zJhOf/m6C7y6xHj5g1AmN6q69g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1PVO3S9rebpTN9wStDKV4VMcJWLBzHJl869Nj41FeeLL8KYsbblj/QDSm3ijm6SHghAmz3+31khL5ircU5lerHNvVymjWaGu4cKgVWzL2IXFEMUE+T+OLIdD0R4QIjYlr0I7EzoFFt7ZmrIConocn6qe62AaYTxeRachtDpnRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzfHFyfu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzfHFyfu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFBFC4CEE3;
	Thu,  3 Jul 2025 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751561110;
	bh=D8oVn8XKzXs+W1065zJhOf/m6C7y6xHj5g1AmN6q69g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GzfHFyfuJ91IIWaECoLpwmuawEvr64R0sIJ8BNmbE/XD6ezSi+1C6FHJMl5yn8OP1
	 tmGr/N6ah0MQT/xF62F5sUzb5d9eomIYrBC4GCpxEF8ngwtCiMjQP0Hu5bam6xHeQW
	 9n0FROXQYEVue+ClHiHsKl4X0Bxz5ZaAJZw4LgoaIDONhu/Y+gpIFBjhqe59/2T2L9
	 nSNB+S2HHRggM86lRH2X29FqL/VWI/vIkopTxv83KoUGSDedG6YdQq8la0GNKYwstq
	 VZWEmFUTPBgLDuX2biNogNdEkYoDKB+HCPD59HjiNM9hudE5o2VoyaqaoHOVbn5Y9r
	 4bsE155Q8JFMA==
Date: Thu, 3 Jul 2025 06:45:08 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/sched_ext: Fix exit selftest hang on UP
Message-ID: <aGazlC01Agx68E5_@slm.duckdns.org>
References: <20250701060845.134026-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701060845.134026-1-arighi@nvidia.com>

On Tue, Jul 01, 2025 at 08:08:45AM +0200, Andrea Righi wrote:
> On single-CPU systems, ops.select_cpu() is never called, causing the
> EXIT_SELECT_CPU test case to wait indefinitely.
> 
> Avoid the stall by skipping this specific sub-test when only one CPU is
> available.
> 
> Reported-by: Phil Auld <pauld@redhat.com>
> Fixes: a5db7817af780 ("sched_ext: Add selftests")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.16-fixes.

Thanks.

-- 
tejun
