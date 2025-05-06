Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332CD142E86
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558591; cv=none; b=PMkqIsUTmC5ruFerCgtyqWL+NEBB4gfaVFdPAymxB5XB63KYxmxCmmK550FmLZHXoBpR7SWGnDdWsYhpI7aFAGsbs9Qw9pp4kaKQRtKn/WMimf0jELSvAMlqjlQkyenM4TWQA+L0axc0N+txQBEdpoU0lPb/vpclt9Fz9iVmtJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558591; c=relaxed/simple;
	bh=oV8ggCP65igJYRgUaYqei7WOxkp+hAjecNa0WNiomWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owePMjLCC6JlO7bnk/85jCD/2M77rt/uaA4hb1zfz9pnJcFAw42Sj3bvqK7M2KaAhOLWPhCReQnKMRCNvGkMqEzeRxk1dN4AP1aYiEwB02zueH2T82F0E4pxuXohTlQy0Gn6QZbLoFAdRDWW7F+P81ZQ06DgN48Hu9N9+DnK01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FooJy39G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FooJy39G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BE8C4CEE4;
	Tue,  6 May 2025 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746558590;
	bh=oV8ggCP65igJYRgUaYqei7WOxkp+hAjecNa0WNiomWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FooJy39GjQyA+I0kYX3R99gO5bMDgiBQeXgi4Y1cVZqh1sl4BIKAoGwjjZqFEVpgW
	 u/SVLiT2g6YWSKPc4Eoq3K0jgTLE0Iow7bOc6tMLKtmZlyfJgg30waCNUoniD/9yY0
	 eLV4///PY9Jj881bHkPPT1zHoVcHHEu4AV1m/Ln4s1RePgDG1jv5q9f3fWSUP51c+5
	 D5wZ+vzM0u22EO32q2sEnpkaLZDDOUG6IySkkAXY2s02lth4dKy/s6GlvrB0ixsNQH
	 CcqhsmeocQ7MoRUR91Et2L2TW7IQvkB48XNqUiGrljQNGjCyiBlNVJ14ZLqeic1/jI
	 NAn6RX16q8ftA==
Date: Tue, 6 May 2025 13:09:47 -0600
From: Keith Busch <kbusch@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Kanchan Joshi <joshi.k@samsung.com>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: fix write_stream_granularity initialization
Message-ID: <aBpee6L-UXEDcH_h@kbusch-mbp.dhcp.thefacebook.com>
References: <20250506175413.1936110-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506175413.1936110-1-csander@purestorage.com>

On Tue, May 06, 2025 at 11:54:12AM -0600, Caleb Sander Mateos wrote:
> write_stream_granularity is set to max(info->runs, U32_MAX), which means
> that any RUNS value less than 2 ** 32 becomes U32_MAX, and any larger
> value is silently truncated to an unsigned int.
> 
> Use min() instead to provide the correct semantics, capping RUNS values
> at U32_MAX.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> Fixes: 30b5f20bb2dd ("nvme: register fdp parameters with the block layer")

Looks good

Reviewed-by: Keith Busch <kbusch@kernel.org>
