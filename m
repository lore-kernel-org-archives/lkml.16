Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752726B968
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776306; cv=none; b=pPXUxUxUj/TEUkPvjGq7bRK0KCE3o+TRIwhIQyBKTsCSEo3h4fx864V9I4xK4K+xBdSbL1MlnB9fB5OjJP0cXdsdJoGhihNm7dSrXyVBTFXJsDzVInCdLla75W/69quLtaz7RFby5nkBhg4Giq4S9AVk9kG1zLxrsluXlfKzdN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776306; c=relaxed/simple;
	bh=xaN9+QPF4X6/6VriohKe15XDkIv+lvZcnIZqFzu6+P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IukMhLqdKwn6S6ezAvOOQbUkfBjj94H3bkPOL6OaoB/rljf9GzffG0rbys3UkHz5xp+yxb/AtOV3GOFIqzDXPpdS+bGVHB1J6db2z7261/f1nNvBhY319YoOD/S3LiEvNfavclJGq3y8YDCpPTvvMLywcpAafZSc+WJDy767JPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CJj816Y5; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CJj816Y5"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746776294; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UjItfSwvxLmNsccSLgsOsMnD5rLojslGm5rEXbWfaAs=;
	b=CJj816Y5CA5GLkWpNLuCcNfsmSWGLco2P29obef6aU6XwLtaFCpxVRZ+lEcR6uNp7eAfplLNZb+ye9exisN2blhU3JVQjFO3dMjqb3AswbOyLubNCa/AD9GPct44+T0sT4XPE8tQ2kOZpkHa7jeE3NCRstEaBfDX8XSley47lpY=
Received: from 30.74.144.121(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wa2UmNr_1746776293 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 15:38:13 +0800
Message-ID: <653bd82d-6c61-4114-bbae-a5f79e811a43@linux.alibaba.com>
Date: Fri, 9 May 2025 15:38:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: mincore: use pte_batch_bint() to batch process
 large folios
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com
Cc: 21cnbao@gmail.com, ryan.roberts@arm.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
 <42ab3f69-82d3-475f-b38d-8e75b2819865@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <42ab3f69-82d3-475f-b38d-8e75b2819865@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/9 15:30, Dev Jain wrote:
> 
> 
> On 09/05/25 6:15 am, Baolin Wang wrote:
>> When I tested the mincore() syscall, I observed that it takes longer with
>> 64K mTHP enabled on my Arm64 server. The reason is the 
>> mincore_pte_range()
>> still checks each PTE individually, even when the PTEs are contiguous,
>> which is not efficient.
>>
>> Thus we can use pte_batch_hint() to get the batch number of the present
>> contiguous PTEs, which can improve the performance. I tested the 
>> mincore()
>> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
>> obvious performance improvement:
>>
>> w/o patch        w/ patch        changes
>> 6022us            549us            +91%
>>
>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>> see any obvious regression for base pages.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> Nit: The subject line - s/pte_batch_bint()/pte_batch_hint()

Ah, fat finger. Hope Andrew can help to fix it:)

> Otherwise LGTM
> 
> Reviewed-by: Dev Jain <dev.jain@arm.com>

Thanks.
