Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BADC1A841B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599672; cv=none; b=fnosOYvyXIPfGwtIkE/CZKn2QxN4xZqfKYo0Od0CWO2lhNHG8MG35HlcGrlXxvdeleHg7JHs29cnAogso+zd1TI8bAaapBL18sUsYIv1WyAEU9MzU06Y7VIES4PkeLcnxk/emJc7M2cbpFRKQE2hivf5j22hLhar74n5z1o1Njs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599672; c=relaxed/simple;
	bh=g2T4JaX1PQVtaJym4rSRe7C5rjrjNOPBhBVkp6Ld+9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vm8goa9q+BN5N3vhzjIDIfBgFAcMPheOvG+xK+CTgrRmefNc80nOM8U+0g3WO98BAIgxx3ejAWFlGcN1bVXZgvDmMRhtCqvzpk1Y5L76GMQ0DFEWshLErBjC1JRQb1SGvOUfICvOjViHC+Dqkqn74unRMeqNQ/NWCPyAQuonXdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZslLV1kzgz1R7Yj;
	Wed,  7 May 2025 14:13:06 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 21A4F140113;
	Wed,  7 May 2025 14:15:12 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 7 May 2025 14:15:11 +0800
Message-ID: <40f2f891-bd09-4600-9540-b6e6fa977958@huawei.com>
Date: Wed, 7 May 2025 14:15:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: fix file handle encoding for 64-bit NIDs
To: Gao Xiang <hsiangkao@linux.alibaba.com>, <xiang@kernel.org>,
	<chao@kernel.org>, <zbestahu@gmail.com>, <jefflexu@linux.alibaba.com>
CC: <dhavale@google.com>, <linux-erofs@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
References: <20250429134257.690176-1-lihongbo22@huawei.com>
 <18d272ce-6a80-4fdc-b67b-ddc2ffa522d4@linux.alibaba.com>
 <3e068311-9223-4c1b-9091-15eb2d867ede@huawei.com>
 <1151f059-fd08-4dba-9448-c8c535ea8700@linux.alibaba.com>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <1151f059-fd08-4dba-9448-c8c535ea8700@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/5/7 10:42, Gao Xiang wrote:
> 
> 
> On 2025/5/7 09:53, Hongbo Li wrote:
>>
>>
>> On 2025/5/6 23:10, Gao Xiang wrote:
>>> Hi Hongbo,
>>>
>>> On 2025/4/29 21:42, Hongbo Li wrote:
>>>> In erofs, the inode number has the location information of
>>>> files. The default encode_fh uses the ino32, this will lack
>>>> of some information when the file is too big. So we need
>>>> the internal helpers to encode filehandle.
>>>
>>> EROFS uses NID to indicate the on-disk inode offset, which can
>>> exceed 32 bits. However, the default encode_fh uses the ino32,
>>> thus it doesn't work if the image is large than 128GiB.
>>>
>> Thanks for helping me correct my description.
>>
>> Here, an image larger than 128GiB won't trigger NID reversal. It 
>> requires a 128GiB file inside, and the NID of the second file may 
>> exceed U32 during formatting. So here can we change it to "However, 
>> the default encode_fh uses the ino32, thus it may not work if there 
>> exist a file which is large than 128GiB." ?
> 
> Why? Currently EROFS doesn't arrange inode metadata
> together, but close to its data (or its directory)
> if possible for data locality.
> 
> So NIDs can exceed 32-bit for images larger than
> 128 GiB.
> 

Ok, I see your point, and you are right. It doesn't have to be a 128GiB 
file, but it is easy to construct this kind of EROFS image by large 
file. Such as:

mkfs.erofs -d7 --tar=f --clean=data foo.erofs 128g-file.tar  # the nid 
of 128g-file is 39.
mkfs.erofs -d7 --tar=f --incremental=data 1b-file.tar  # the nid of 
1b-file is 4294967425.

Thank you again for your review, I will send the next version of the 
patch later.

Thanks,
Hongbo

> Thanks,
> Gao Xiang
> 
>>
>> Thanks,
>> Hongbo
>>
> 
