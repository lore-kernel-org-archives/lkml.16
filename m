Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3301723DE
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747489110; cv=none; b=SgyraShACQDeF9yifZxZheZpRkqY3BtDh4WYxRJXtsY0jOOAJ2pk2EZ8mFueam/1dcKWDod+HJGZjyUd/hx3Xifd1l87YUJdFXErGBUvtrrZLqtiInlaICX5eE0fb5kKtzwmiVqeYC/zDSajKohrfrcWZ4k6upHBL5WjBndnSFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747489110; c=relaxed/simple;
	bh=pUvOofXDkPposa94RMhDdI/Ptt/GjorZ8vH901xrDfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iN/4C7SwXNl+PPNktmIReAbNKO28ZJ6RpA3TCrJ0+pRIlR/FCFeYwQPG8CHuNwqBQpkYkURjlag3AA13uK9qb8kZs7OaKAOJ6h2fde4yJA85bk7VlPh77QWMw4aEJfdtwfNBOUd+P2hthYypkiPT/dWxyv+BG2TOsW8Wru4H9mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=BFOArMBr; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="BFOArMBr"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747489097; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/2y3CHuCm+oK+QhgXbMXa3N87TqXV+DMGRTukA22Eto=;
	b=BFOArMBr0yU4DB/W8ja8Om+HfxhkKUXWC/BA0cE5/uUhknykzciY26bGsDOGxvTeFG0x2ou7YqbmybIK+MrwDJGX+FUv9aTjHSyYWPNAWvQAMDZAkCUaSD3OWPSuSdbzYKEe/ktXdcGhzoQL7Pt3LgSA3f/LhaUH9K3kD+hFf78=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wb-FQtU_1747489084 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 May 2025 21:38:16 +0800
Message-ID: <60a7cad0-a415-41aa-b270-5b218d45d720@linux.alibaba.com>
Date: Sat, 17 May 2025 21:38:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] erofs: add 'fsoffset' mount option to specify
 filesystem offset
To: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
 lihongbo22@huawei.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>, Wang Shuai <wangshuai12@xiaomi.com>
References: <20250517090544.2687651-1-shengyong1@xiaomi.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250517090544.2687651-1-shengyong1@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/17 17:05, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> When attempting to use an archive file, such as APEX on android,
> as a file-backed mount source, it fails because EROFS image within
> the archive file does not start at offset 0. As a result, a loop
> or a dm device is still needed to attach the image file at an
> appropriate offset first. Similarly, if an EROFS image within a
> block device does not start at offset 0, it cannot be mounted
> directly either.
> 
> To address this issue, this patch adds a new mount option `fsoffset=x'
> to accept a start offset for the primary device. The offset should be
> aligned to the block size. EROFS will add this offset before performing
> read requests.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Wang Shuai <wangshuai12@xiaomi.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang
