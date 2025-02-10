Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFE624BD0B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208106; cv=none; b=sdeocRwqN05J2wkB8arCurD3bVAdTmh/uMtyTxu5RUkAsDlfRKvn1p0uYJQuSHQ+WPM2+ju/oYJj7Lkb17LSb6IuAHu0OiC5y8X9UWu9oz92gW5qu65HMLHAIY2JwPiU4znTm2Xv0xmRTji3jpfoK90z2RvkMLhkAi+1zgHQ5fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208106; c=relaxed/simple;
	bh=ieZOjE0fZpFHFGRiKCpDVw4dv2pHd39zEETT4Dg+IIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSZ4gtdg5fRt8zHmyvc6I23yPOBkz8ipdNL5CCj+FuMOg9XMMGPEmjGy2Ckpzqk2aqJUkW5rPQ5CrLDR4jEop9dB8621v1NTZghppZPq8Q4aFbaMJMXi27UTI+Mq9hmAi+GjCeciYjevLsUbSzWG3+w8fHbcM5w4ryNR+Rl6aBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnvZXlcP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnvZXlcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E341C4CED1;
	Mon, 10 Feb 2025 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208105;
	bh=ieZOjE0fZpFHFGRiKCpDVw4dv2pHd39zEETT4Dg+IIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qnvZXlcPdRi+2cJwFsejJg+oVn8rE14S6eWbPI3Z6MwHHTFTtWyTKFnIsnoVC+1Ek
	 ba4GLFtCPovj7nnt9riwRnl/i+b8gjqrAu5REzcMhrDOxpJcEdGAs/qjUWTLydG4x1
	 UTZwPxgkcK0RJC7XL6vJqNHAuwRDgj1Uucjz7+jg9bKR1jy2whOtVs8jEZPvFYSeto
	 xKENiXBroZuRcreirTTRxOk/L73LFrjLICzo8g6dOOZziyyYMAR5jmtVEBRuu/J99p
	 a+9QTBL0/dO7R4vY1pAhRwLLJzhM40fwHwkADP4bd3EAAs1jSaKdOfo/RqMTKNa4Rz
	 IjvJx2+M7TruA==
Date: Mon, 10 Feb 2025 07:21:44 -1000
From: Tejun Heo <tj@kernel.org>
To: lirongqing <lirongqing@baidu.com>
Cc: void@manifault.com, arighi@nvidia.com, changwoo@igalia.com,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Take NUMA node into account when allocating
 per-CPU cpumasks
Message-ID: <Z6o1qPn5v52gXtra@slm.duckdns.org>
References: <20250210085225.3272-1-lirongqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210085225.3272-1-lirongqing@baidu.com>

On Mon, Feb 10, 2025 at 04:52:25PM +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> per-CPU cpumasks are dominantly accessed from their own local CPUs,
> so allocate them node-local to improve performance.
> 
> Signed-off-by: Li RongQing <lirongqing@baidu.com>

Applied to sched_ext/for-6.15.

Thanks.

-- 
tejun
