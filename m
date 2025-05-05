Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8063F9405
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746488632; cv=none; b=RJR4aQIjtBYIt8EGVvaWAxm1iDf/1WmRnSInZ5aXs2PtMotG1ekM+U6DhuLBCObXHVkK4HWPbhzwaN9/ODgAXqiw+29WWUh/RgQ96ifq4RNvSR3OiPiJVI7lazSt6BQWTgkoY3y3mxX3mP5pdBY7U3M613+zVKnmwu9lVekqREo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746488632; c=relaxed/simple;
	bh=aUhVoDizQmrqwpboJzlofEa8mF6Apf5d4XvKb0DXIDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnyKDFVTpdj6eKSN+q9A7QTGqA89to1E1GLgJacuUXtzutv4x31Hf9NjHobEIYSLFFrIOc2EGYsg0DaJcAgRvRkQm4aXWCqp3HQnHzloPhpKVLAKAUO89sMYKLcvdYvxIEDKcaCWYVaL9faI2hcH64ZZDMuWybsTx5ttJS6z/kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kw624uqs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kw624uqs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2EBC4CEE4;
	Mon,  5 May 2025 23:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746488631;
	bh=aUhVoDizQmrqwpboJzlofEa8mF6Apf5d4XvKb0DXIDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kw624uqsBmu9WdiI9HPijTxYvo402Txin4qO0kx++WqYVf8vfoLdiECyCmmpm0bxv
	 pMH1kwi1xXJbRv7/Zv0JA89bDeXAYi5Qy/6h9d7VcTq7pryvG3QmZ6ednjykuou+sU
	 swcTBE7QyHCj5pLE9TGzUz6FP2RvDhBoQBBqlpoUZKUFrvck4rSMGKQz58t83HbCFo
	 YKcBoFPaMFgLdkwrBnyOITabUBU5YTYfKTuicIYVOqyFIfXr+zexNvBhgX330tq8Ec
	 TseUVHYuOOEo/LweO4qQSuS93LFsSC+dFhQxeSwNRqHZJI21ECrhoh2sOvBR0YMlJ+
	 ixFCXAVf/nvSg==
Date: Mon, 5 May 2025 13:43:50 -1000
From: Tejun Heo <tj@kernel.org>
To: "Guan-Chun.Wu" <409411716@gms.tku.edu.tw>
Cc: jiangshanlai@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: fix typo in comment
Message-ID: <aBlNNuAnhhjlj6ha@slm.duckdns.org>
References: <20250503081203.38463-1-409411716@gms.tku.edu.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503081203.38463-1-409411716@gms.tku.edu.tw>

On Sat, May 03, 2025 at 04:12:03PM +0800, Guan-Chun.Wu wrote:
> From: "Guan-Chun Wu" <409411716@gms.tku.edu.tw>
> 
> Fix a duplicated word "that that" in the comment describing the
> @max_active behavior for unbound workqueues.
> 
> Signed-off-by: Guan-Chun Wu <409411716@gms.tku.edu.tw>

Applied to wq/for-6.16.

Thanks.

-- 
tejun
