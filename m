Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9241F94D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922278; cv=none; b=FkOebi6BnCVifq5radDhs2TCG2r2EPp5A+ejACEydKZGe2QQ9uCWGQsYhvr+x6T5r5R6F1iUJkg1qQD4R7yLFKEth1kCZMhxUuy5bWRR6dezZJ1zfbvACLOMLxOzU3Af2pJzOkfE3LX6pPxYwZga3lmx6XU/7dew/uJL8k1HEoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922278; c=relaxed/simple;
	bh=HooZtgA0GXfLrsEzQyuwTezmlNya06buDn/rvsVgz/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icVd2qEFAtQbszUtx74ElSONQnclRRcB22ZpVwYZ2FTZjD/ipKjV2IlPmAv7POiEysskEbmcBE/TYCTP8jq6f8T1rfdm6sioybp/fZHzzzFFxGOtrUaYPV4nWcKGQsdqbpDIiMXn7PAZmr33h3z8wA5evjDwQO6ZCQB7omEAhuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rIqE4FsP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rIqE4FsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CB5C4CEF1;
	Thu, 22 May 2025 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747922277;
	bh=HooZtgA0GXfLrsEzQyuwTezmlNya06buDn/rvsVgz/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIqE4FsPeocARzXZvFtzi55Zdxf89qXdNvy4cal5n/cYTfbQ8YiKb81N+XL45Se90
	 XTfSB58d2Qd3G3HJv/U+/N/g3iuRju+f25QwEyUA+aFgK4a1mn0qQ1QBrLQKa7xBan
	 uCKnhhUG1Ak3Q6gBrmO/HFD6xxi7UtNaZSOp+qJmd4TSpnQG0DCICtYs8kmTflfk0P
	 wF6IZwuzjJO2yWizHBArT35qhGjzC2t10iXQTm1QrpiKwKhn64/7bmtsVvW6U+FjQ2
	 kt7PpuQ+WsfD76VYvy7aLPss2s+fqcapJpcXdSWXPtBKQCu30UQiHyDaVIutCTwYu3
	 WPjjIaxlb/+6g==
Date: Thu, 22 May 2025 21:57:51 +0800
From: Gao Xiang <xiang@kernel.org>
To: Bo Liu <liubo03@inspur.com>
Cc: xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9] erofs: support deflate decompress by using Intel QAT
Message-ID: <aC8tX4u/EFe8XsVP@debian>
Mail-Followup-To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
References: <20250522094931.28956-1-liubo03@inspur.com>
 <2f0e05c0-fe6b-4e84-9ef5-c33ecc43d81c@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2f0e05c0-fe6b-4e84-9ef5-c33ecc43d81c@linux.alibaba.com>

On Thu, May 22, 2025 at 05:52:32PM +0800, Gao Xiang wrote:
> 
> 
> On 2025/5/22 17:49, Bo Liu wrote:
> > This patch introdueces the use of the Intel QAT to decompress compressed
> > data in the EROFS filesystem, aiming to improve the decompression speed
> > of compressed datea.
> > 
> > We created a 285MiB compressed file and then used the following command to
> > create EROFS images with different cluster size.
> >       # mkfs.erofs -zdeflate,level=9 -C16384
> > 
> > fio command was used to test random read and small random read(~5%) and
> > sequential read performance.
> >       # fio -filename=testfile  -bs=4k -rw=read -name=job1
> >       # fio -filename=testfile  -bs=4k -rw=randread -name=job1
> >       # fio -filename=testfile  -bs=4k -rw=randread --io_size=14m -name=job1
> > 
> > Here are some performance numbers for reference:
> > 
> > Processors: Intel(R) Xeon(R) 6766E(144 core)
> > Memory:     521 GiB
> > 
> > |-----------------------------------------------------------------------------|
> > |           | Cluster size | sequential read | randread  | small randread(5%) |
> > |-----------|--------------|-----------------|-----------|--------------------|
> > | Intel QAT |    4096      |    538  MiB/s   | 112 MiB/s |     20.76 MiB/s    |
> > | Intel QAT |    16384     |    699  MiB/s   | 158 MiB/s |     21.02 MiB/s    |
> > | Intel QAT |    65536     |    917  MiB/s   | 278 MiB/s |     20.90 MiB/s    |
> > | Intel QAT |    131072    |    1056 MiB/s   | 351 MiB/s |     23.36 MiB/s    |
> > | Intel QAT |    262144    |    1145 MiB/s   | 431 MiB/s |     26.66 MiB/s    |
> > | deflate   |    4096      |    499  MiB/s   | 108 MiB/s |     21.50 MiB/s    |
> > | deflate   |    16384     |    422  MiB/s   | 125 MiB/s |     18.94 MiB/s    |
> > | deflate   |    65536     |    452  MiB/s   | 159 MiB/s |     13.02 MiB/s    |
> > | deflate   |    131072    |    452  MiB/s   | 177 MiB/s |     11.44 MiB/s    |
> > | deflate   |    262144    |    466  MiB/s   | 194 MiB/s |     10.60 MiB/s    |
> > 
> > Signed-off-by: Bo Liu <liubo03@inspur.com>
> Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
> 

BTW, the commit message has been updated to v4 version to
fix some typos:

https://lore.kernel.org/r/20250521100326.2867828-1-hsiangkao@linux.alibaba.com

Thanks,
Gao Xiang
