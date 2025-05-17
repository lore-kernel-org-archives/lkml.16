Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA104B1E5F
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 03:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747452507; cv=none; b=OQSL7g/VLDYREN85zyEiqIiyEs+DMQaCOAWBdd3mZNir/nq1/wU8Mn4qPI6j4FxJKjVwZBjKGDV6GK3p7YDIdAgKS01Q69s3ABk0zMjZ0ND+IU+u2/Ud6huPnhdryaHoz04xMiOWKSRAs0gL39GJrcO6liPgG79yWHU86wn2v4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747452507; c=relaxed/simple;
	bh=Wczoy6q1yYj59ttK6m1I9qT28PX5vSLcy9rs5u7zB/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHPjPNab4ishHHk4U8dhjWnrABco52Or4WsHHsch61qsXnmSUtiDCwbjF34QGclb8JgB7Y2D1Lds5L7lZ+ik0E9l6DyO7BJKh25hs4B62LiFnJPYJ6r7wxuMbwPw7WvcdnJa954MphL3bKaGGYpUNLhc//n94qsGQzUkEnUvspY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=l/WRCLP9; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="l/WRCLP9"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747452495; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KZQjIna8AYdipvVJHml0zLyucTarm+OWKdxXSAdKhm4=;
	b=l/WRCLP9CkEmcaQ5gYTYtkjhVbfStKhb9H3Epo0don2BSoS9sYUHqkUBBo8Mk1rBhwTUajf6gZz4rMM7XQDaOva05xwvsDjeVh2det5qCMs0WlajLCwObU/EhJCwn65HJ6KFdbo88aRtZt1txa3apnHfgpJXskmV3fef1odx7Fo=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Waya2sm_1747452494 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 May 2025 11:28:14 +0800
Message-ID: <2e076b62-0b6a-4af3-a8c2-babade16fa6d@linux.alibaba.com>
Date: Sat, 17 May 2025 11:28:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: support deflate decompress by using Intel QAT
To: Eric Biggers <ebiggers@kernel.org>, Bo Liu <liubo03@inspur.com>
Cc: xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250516082634.3801-1-liubo03@inspur.com>
 <20250516163857.GA1241@sol>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250516163857.GA1241@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eric,

On 2025/5/17 00:38, Eric Biggers wrote:
> On Fri, May 16, 2025 at 04:26:34AM -0400, Bo Liu wrote:
>> +config EROFS_FS_ZIP_CRYPTO
>> +	bool "EROFS hardware decompression support (crypto interface)"
>> +	depends on EROFS_FS_ZIP
>> +	help
>> +	  Saying Y here includes support for reading EROFS file systems
>> +	  containing crypto compressed data.  It gives better decompression
>> +	  speed than the software-implemented compression, and it costs
>> +	  lower CPU overhead.
>> +
>> +	  Crypto support is an experimental feature for now and so most
>> +	  file systems will be readable without selecting this option.
>> +
>> +	  If unsure, say N.
> 
> I recommend not including the word "crypto" in any user facing part of this.
> 
> Compression algorithms are not cryptographic algorithms.  The fact that the
> interface to access hardware compression accelerators is currently the "Crypto
> API" is an implementation quirk.  It could be a different interface in the
> future.
> 
> Call it something clear like "hardware decompression".

Totally agreed on this since it's just an implementation detail,
and I will try to make some extra time to polish this commit myself
to fix some minor issues later.

Thanks,
Gao Xiang


> 
> - Eric

