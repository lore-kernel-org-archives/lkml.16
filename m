Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5086119D087
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 02:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746585757; cv=none; b=eoJo3mRgfM/r+nttKNkoPbSXns6MFX1CqnvNKIV7nNQUri1i8eAhjk9q+PE4hQ8c1DP5lX+j1SlULnoGT6tniRJwjjp8PbFVwJ9V9oGm7xZ5NSyVoSRoztVAV5JghULBhVvQtzI7gTNNhMc48Dn3h1eJ5a9n/mzAtCl/8t5sYa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746585757; c=relaxed/simple;
	bh=JwUlvQLq/WzAJMwnBJlrke4WRFbFdY38QGDWB9cO0p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meQ5z5xYhXr+NYBz6Iqhn6Ig8XImqjQBi0GFXrR6UKps68LJCwSssEtApmKRAv2dX8cVMFuxO5qJb+7/zywwce5rlz68osns7eyZV5jMsnYSPuKjlw6sS55Dvwzv9dQKcowneuWvb2Iw7Vk3fzsYzetd7TOpDWTNQ/ttdYp4u24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QGPlT5Vi; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QGPlT5Vi"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746585745; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=zJikcTQk9Z8vf+vv6wxs06aouJcHm5T6PfC75KHz4p8=;
	b=QGPlT5ViuRsXG6K1KsrcaBDt1i3xyhdVAN1/hbx/vXCUlyY0+/9RtZdJY8hA79ZG5RAskRLhVkPBFrD08Cob2A+4/qjktgnA57ffUZMlk9x91U/nuf75Oj1nBABtmgAp7Foy9VQPm+Nb0wjJHncPyM8LNDFd48uoS1K1BaY7Gk8=
Received: from 30.221.131.179(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WZkK2Sl_1746585744 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 10:42:24 +0800
Message-ID: <1151f059-fd08-4dba-9448-c8c535ea8700@linux.alibaba.com>
Date: Wed, 7 May 2025 10:42:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: fix file handle encoding for 64-bit NIDs
To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com
Cc: dhavale@google.com, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250429134257.690176-1-lihongbo22@huawei.com>
 <18d272ce-6a80-4fdc-b67b-ddc2ffa522d4@linux.alibaba.com>
 <3e068311-9223-4c1b-9091-15eb2d867ede@huawei.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <3e068311-9223-4c1b-9091-15eb2d867ede@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/7 09:53, Hongbo Li wrote:
> 
> 
> On 2025/5/6 23:10, Gao Xiang wrote:
>> Hi Hongbo,
>>
>> On 2025/4/29 21:42, Hongbo Li wrote:
>>> In erofs, the inode number has the location information of
>>> files. The default encode_fh uses the ino32, this will lack
>>> of some information when the file is too big. So we need
>>> the internal helpers to encode filehandle.
>>
>> EROFS uses NID to indicate the on-disk inode offset, which can
>> exceed 32 bits. However, the default encode_fh uses the ino32,
>> thus it doesn't work if the image is large than 128GiB.
>>
> Thanks for helping me correct my description.
> 
> Here, an image larger than 128GiB won't trigger NID reversal. It requires a 128GiB file inside, and the NID of the second file may exceed U32 during formatting. So here can we change it to "However, the default encode_fh uses the ino32, thus it may not work if there exist a file which is large than 128GiB." ?

Why? Currently EROFS doesn't arrange inode metadata
together, but close to its data (or its directory)
if possible for data locality.

So NIDs can exceed 32-bit for images larger than
128 GiB.

Thanks,
Gao Xiang

> 
> Thanks,
> Hongbo
> 

