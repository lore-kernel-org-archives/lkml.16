Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EAA18027
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907565; cv=none; b=Q/QBdxdt+FxJ+kV4ebq76+f6kmihChO+NMA6gRU9QHHjTLGcAa4J77nelvK58LJpslv65y5mKqsKrtCry1vbwuDvv3Oa1tw910dlwQShHI7y/Cf3DuEAVT/Zof6RImvxPMDk3+P8ubV5YFP2JAwaU3tBqPlo9iJFi1dUZAK0FoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907565; c=relaxed/simple;
	bh=vrnIi33Uhbupzwn4fUSeBvcJw83c2GGrKaVsmo3+Uic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GM5Y5wCiRUW8G6HU4FBSoyzuUSK28fMjl+hlERfk78KOhMVWNYJD8s+SpbszoKhXEJ8Y+ot8KX+hMVfdCowCpcfAM6yIKysK9SVpq43y5G49jNiwT1+eC7/2rdP1HwfoE0SKjvrcsQ99MePuO+JCETeZdHfixeTI1OnA+DWoDh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sIKUuVoj; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sIKUuVoj"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747907560; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=eSAnloQcVa/uk9+ADt/Qeyay1jtAPm847cdU8CH03+8=;
	b=sIKUuVojj7dLvJIMaWRUnz4OuX0a2BMxxTxmbZbjw0s8xoUuDmig8Wmwmx6nuwEJGqv+XxjqRe1kuiBXA1jCywoj/yh/bdEbv9f1fJVnbdlltFRZwcvpv6sig0/rrltmwpm885gsvX+sqrMpdNs7d7AVGavSzSHhVhtbLIHetCE=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WbVPZFi_1747907554 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 May 2025 17:52:40 +0800
Message-ID: <2f0e05c0-fe6b-4e84-9ef5-c33ecc43d81c@linux.alibaba.com>
Date: Thu, 22 May 2025 17:52:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] erofs: support deflate decompress by using Intel QAT
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250522094931.28956-1-liubo03@inspur.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250522094931.28956-1-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/22 17:49, Bo Liu wrote:
> This patch introdueces the use of the Intel QAT to decompress compressed
> data in the EROFS filesystem, aiming to improve the decompression speed
> of compressed datea.
> 
> We created a 285MiB compressed file and then used the following command to
> create EROFS images with different cluster size.
>       # mkfs.erofs -zdeflate,level=9 -C16384
> 
> fio command was used to test random read and small random read(~5%) and
> sequential read performance.
>       # fio -filename=testfile  -bs=4k -rw=read -name=job1
>       # fio -filename=testfile  -bs=4k -rw=randread -name=job1
>       # fio -filename=testfile  -bs=4k -rw=randread --io_size=14m -name=job1
> 
> Here are some performance numbers for reference:
> 
> Processors: Intel(R) Xeon(R) 6766E(144 core)
> Memory:     521 GiB
> 
> |-----------------------------------------------------------------------------|
> |           | Cluster size | sequential read | randread  | small randread(5%) |
> |-----------|--------------|-----------------|-----------|--------------------|
> | Intel QAT |    4096      |    538  MiB/s   | 112 MiB/s |     20.76 MiB/s    |
> | Intel QAT |    16384     |    699  MiB/s   | 158 MiB/s |     21.02 MiB/s    |
> | Intel QAT |    65536     |    917  MiB/s   | 278 MiB/s |     20.90 MiB/s    |
> | Intel QAT |    131072    |    1056 MiB/s   | 351 MiB/s |     23.36 MiB/s    |
> | Intel QAT |    262144    |    1145 MiB/s   | 431 MiB/s |     26.66 MiB/s    |
> | deflate   |    4096      |    499  MiB/s   | 108 MiB/s |     21.50 MiB/s    |
> | deflate   |    16384     |    422  MiB/s   | 125 MiB/s |     18.94 MiB/s    |
> | deflate   |    65536     |    452  MiB/s   | 159 MiB/s |     13.02 MiB/s    |
> | deflate   |    131072    |    452  MiB/s   | 177 MiB/s |     11.44 MiB/s    |
> | deflate   |    262144    |    466  MiB/s   | 194 MiB/s |     10.60 MiB/s    |
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

