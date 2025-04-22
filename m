Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44C2777F2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332653; cv=none; b=dES0R1E5sG7lKvsWOmTgG4Ckp+HvRBVSKeZGxq+KPLnBs02h5BGBH1hePdvHE4D+K+t4eZJyXyxw88vCsiz+GRbV6iv07HrjoI/OeO2yeWfBs4FuC2vtJ3IG3N/d/B+61I69L+sbALzUyzXquvm+V71TnlcQTmXGlxWAnCJJs4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332653; c=relaxed/simple;
	bh=xyVYpWcYy4eY2ytnFXQfrPwNUP6Lc+R5QH9EO7GU6to=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p4ycMj8xVLedPY1dd3BaoCWwCbFIvSUKQHiOC3HBnrhWUR+zcHJmNxpagMv/CfTgE7zAIFUxneMuKa86gw6csLlEb5NG+KXTaTZizKE5wqzRDMcQGNBT4igYFyh/GUsjcmF7R8da7lrL4e61MZyncrVMKL/t6E3EDCi55/NC0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZhlCg2V79znfb2;
	Tue, 22 Apr 2025 22:35:59 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 84BD518046A;
	Tue, 22 Apr 2025 22:37:20 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Apr 2025 22:37:19 +0800
Message-ID: <406b4b4e-1a1e-4618-87b8-7b104838770f@huawei.com>
Date: Tue, 22 Apr 2025 22:37:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] erofs-utils: Add --meta_fix and --meta_only
 format options
To: Gao Xiang <hsiangkao@linux.alibaba.com>, <xiang@kernel.org>,
	<chao@kernel.org>, <huyue2@coolpad.com>, <jefflexu@linux.alibaba.com>
CC: <linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
References: <20250422123612.261764-1-lihongbo22@huawei.com>
 <2408568f-a9e6-4e32-83b2-e79aee83a55a@linux.alibaba.com>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <2408568f-a9e6-4e32-83b2-e79aee83a55a@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/4/22 21:50, Gao Xiang wrote:
> Hi Hongbo,
> 
> On 2025/4/22 20:36, Hongbo Li wrote:
>> In this patchset, we have added two formatting options --meta_fix and
>> --meta_only to extend the ability of EROFS. In the case of using OBS,
>> we can convert the directory tree structure from OBS into the erofs
>> image and implement on-demand loading logic based on this. Since OBS
>> objects are often large, we need to separate the metadata area from
>> the data area, which is the reason we introduce the --meta_fix option.
>> To accelerate the formatting process, we can skip the formatting of
>> the raw data by adding --meta_only option.
> 
> Thanks for the patches!
> 
> I wonder if it's possible to reuse blobchunk.c codebase for
> such usage in the short term.
> 
Our initial plan was to reuse the blobchunk.c logic, but we found that 
the chunk-based layout has some minor issues when handling contiguous 
blocks—it would result in multiple elements in the chunk index array 
(whereas blobraw expects only oversized chunks).

Thanks,
Hongbo

> Also I hope there could be some better option knobs for these
> new features.
> 
>>
>> A simple usage example is as follows:
>>    1. Build one xattr with OBS key in s3fs.
>>    2. mkfs.erofs --meta_fix --meta_only data.img /mnt/s3fs to format
>>    3. Implement the loading logic in kernel or userspace.
>>
>> Based on the above logic, we can easily expose the directory tree
>> from OBS to users in the form of the EROFS file system and implement
>> on-demand data loading for large OBS objects.
> 
> BTW, It's possible to upstream OBS implementation to erofs-utils
> if any chance?
> 
> Thanks,
> Gao Xiang
