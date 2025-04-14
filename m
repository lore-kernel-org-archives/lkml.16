Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8925C6E6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744650569; cv=none; b=pTY4q/qLzB5y12bYxYGrm3gDrxUNuX/UslLyKJHmhRP6i8mDGlcPH/Mw09CsDE/w+wttN6fjuzzUvn44ffUFqrFpJpvvVLGrpVg0+rS48XyGq1DlWgGRF87LkfpZSj7BEwcKN/A0nRrOakf0fvKBtw4dS4SfbGRFTYS+r2zhQ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744650569; c=relaxed/simple;
	bh=5y6HZjYLejh938VG8ac/V4EKG/OP75vgBvyn1zdnL3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcNjRkohQ4HSFLgCY/8/ycL2N9qAsWMCSU61xV/gJOTkakkEifbCuiZOS/zLv3IMqL+CtKz7prRtmT0Pwd/TT/sJDGiyuyWaq0JYTHAf9T3VKDW/j4bseSjjHQx3cUJDNbjCInjBONJ6IzaBOwE4DfMNb9y3pt9giHDlELH0j8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIkj1mqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIkj1mqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E950C4CEE2;
	Mon, 14 Apr 2025 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744650569;
	bh=5y6HZjYLejh938VG8ac/V4EKG/OP75vgBvyn1zdnL3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIkj1mqxxLgToFBMdChEBIkAjls4BmnBREf8WgPDb7c6R8T3xFCScZAsihK6Y/V4L
	 9DKYcTY8CIu+3b8yLcsm2YG+3DobTmkkM+zz+PzFe1wzzjTdU4tWlGnic0uAKqOhRY
	 Apggis1OiatOTyMoG96c+0YON78Up/yYnrXWvBryfs0L5NnxteefgsCBM/LSHfxXfw
	 ZyW7Y4lOjy0qxKYe7Q3ZYbE7U1tGyfaoxJ2NHEDLxPrwPvfVdyIvnDqc1BlwZ2j7S3
	 2sQ//U8o+qXN6dvKcmcO6bZxyvi5/G8g0R+KAt1tuRkmYdJWMBJtjRSpmLgjbzG/E7
	 2Kx1por2LH1xQ==
Date: Mon, 14 Apr 2025 07:09:28 -1000
From: Tejun Heo <tj@kernel.org>
To: alexjlzheng@gmail.com
Cc: gregkh@linuxfoundation.org, alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernfs 1/3] kernfs: switch global kernfs_idr_lock to
 per-fs lock
Message-ID: <Z_1BSLbvq4zCYEu-@slm.duckdns.org>
References: <20250411183109.6334-1-alexjlzheng@tencent.com>
 <20250411183109.6334-2-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411183109.6334-2-alexjlzheng@tencent.com>

On Sat, Apr 12, 2025 at 02:31:07AM +0800, alexjlzheng@gmail.com wrote:
> From: Jinliang Zheng <alexjlzheng@tencent.com>
> 
> The kernfs implementation has big lock granularity(kernfs_idr_lock) so
> every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> 
> This patch switches the global kernfs_idr_lock to per-fs lock, which
> put the spinlock into kernfs_root.
> 
> Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>

Given that it doesn't really make things any more complicated, I think this
makes more sense than the existing code even without any direct evidence
that this improves performance.

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
