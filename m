Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9139B2E628
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181572; cv=none; b=L60VHBQfi7LUYDHq/EICACip0PvPmKxk39xJqdwIEIID/wOlCL8dSo/JG6rOgLs4fpWB2ZOLL76B+fpKQKGKqEfj4ckdCVmlmsognV6U6BIEKfyGoB4iVNcqNDmCuDtqXFX19Na96LKLl7OS5MhGI9ooUQ/shIykb/cRBhXq1K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181572; c=relaxed/simple;
	bh=aTtvb1f4dMtTpn5Laz2mDNmKptpgk8JKwnk9yB+3Mqs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J5aLoFUy66BTSAnFXUukK7Ho8sXkJs5I47RunvD1GE/QwvrlXdrV5UPiFO3deoA/JJwfUDjCSPRf0icRbDInl2Z3PuiG1P5UVDKT1Dm4OAT0xwghJJdGphbrPcK+w7ejgaqTgQJNmvr60qv6C+uNlMImrxYoKaHrNXtIuqwRryA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HApETyr2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HApETyr2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C304C4CED1;
	Mon, 10 Feb 2025 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739181572;
	bh=aTtvb1f4dMtTpn5Laz2mDNmKptpgk8JKwnk9yB+3Mqs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=HApETyr27GOJHy51a/6b+lne7KRLt2svbWkGcav0KLhq5MNGmbLRllEjaYuspNYNT
	 h2JAHSNFBOpMDrYEFQgiWLSVuo9P7/fTlPGlEhFWEPW0mNLom5us9EJJ7COtvVvA0M
	 xefqD5rvHCbhlGAnlAGsslQD+0YH0gT/Oy3KDlnmaSdWgHlgky3v85b5oe6tUQo6wa
	 h5qZnSS4xZfTW1wb6rOcjaW7ayJOufzEzCuPJOO+ubFFINStO0WxvXS2ifRFrLqXNa
	 nQNdbH4wg/rZwWugf08QeGUlumaYZpSvwK+w1v+0tXiAGoBWya6zCdvXFFvYGlp4d8
	 UGjsSp6yFGZ8w==
Message-ID: <61e5cacc-907d-4b86-a26a-63a31cdadd61@kernel.org>
Date: Mon, 10 Feb 2025 17:59:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: add a sysfs entry to request
 donate file-backed pages
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250131222914.1634961-1-jaegeuk@kernel.org>
 <20250131222914.1634961-3-jaegeuk@kernel.org> <Z6Y0w1iALudX9GA7@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Z6Y0w1iALudX9GA7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/8/25 00:28, Jaegeuk Kim via Linux-f2fs-devel wrote:
> 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
> 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2});
> 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
> 4. echo 1024 > /sys/fs/f2fs/tuning/reclaim_caches_kb
> 
> This gives a way to reclaim file-backed pages by iterating all f2fs mounts until
> reclaiming 1MB page cache ranges, registered by #1, #2, and #3.
> 
> 5. cat /sys/fs/f2fs/tuning/reclaim_caches_kb
> -> gives total number of registered file ranges.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
