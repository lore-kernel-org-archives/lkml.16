Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30FE28A1EB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651575; cv=none; b=Rw2pwgDJ7AI9zyJvuVunbZlTP1fJX8SUR66wtZ1Hu57MvKf3foQG7RfEsunoklfYYsgRn2cvGetbR0DsrflBDZilyLff+FONVl3/1yiggLVshYu5RQMtl6KMdUrRO4PvV8wnMz+6uL+oOOB2E4UIhUdTei+hKYInqimbTRbrHXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651575; c=relaxed/simple;
	bh=f/JZ811QzmvuNxn/IDucBkOa7MwFTcmF6O4qpanOFtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txjId6Yig2pu96h+ma0xrgyqFYKo/VbrxhRdFZA8SvXJbfY4YodedCNU2RK2Tj7d9VQ0bPs+84pyrf+pAoqO89zACid1RrzZpWRcrKllzn4Jry5K1EsM50SnozT+012w3b3clA2dCs92DW3rjyYDxQ/wo7gJndCvciV99BnLvLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuYVgsLe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuYVgsLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737A8C4CEE5;
	Mon, 14 Apr 2025 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744651575;
	bh=f/JZ811QzmvuNxn/IDucBkOa7MwFTcmF6O4qpanOFtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KuYVgsLeT9NCdmdAsFpYWaQiQGP+es3lkP9KUTfa0lw8BsGM9Huz1WNve8owmO49o
	 rudJb/V+I8lhgFC1HHN/fh+/A/qPATsUPtCCMzy9GbzHyREQ8ajH/eA1y7fgRTziY8
	 /3x5j3tD/7T//XMqD/M4gzfkq2BBtzP/1nGjyuB3e54EmrROaUdahgsygDS7hsb2wV
	 BeW+y1IBigQKRP94basipjeTGfnZ2rAZIC+kfw+jOMrjZWpzZ2JULb0VUX6kZF+Lnz
	 QoKcL5wEsUnM/6eqnL9YsnU0AkRqAlmu18f4BPlOSDtobmfjqyhfXNpN68VwwFREtI
	 v9F04fGczlRMw==
Date: Mon, 14 Apr 2025 07:26:14 -1000
From: Tejun Heo <tj@kernel.org>
To: alexjlzheng@gmail.com
Cc: gregkh@linuxfoundation.org, alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernfs 2/3] kernfs: switch global kernfs_rename_lock to
 per-fs lock
Message-ID: <Z_1FNguGF87GwfSD@slm.duckdns.org>
References: <20250411183109.6334-1-alexjlzheng@tencent.com>
 <20250411183109.6334-3-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411183109.6334-3-alexjlzheng@tencent.com>

On Sat, Apr 12, 2025 at 02:31:08AM +0800, alexjlzheng@gmail.com wrote:
> From: Jinliang Zheng <alexjlzheng@tencent.com>
> 
> The kernfs implementation has big lock granularity(kernfs_rename_lock) so
> every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> 
> This patch switches the global kernfs_rename_lock to per-fs lock, which
> put the rwlock into kernfs_root.
> 
> Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
