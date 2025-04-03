Received: from smtp.cecloud.com (unknown [1.203.97.240])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB33A24EAB6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.203.97.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688809; cv=none; b=KU1O3M/ZKk+nJ8dEKWw1CEG2JzDTFPvoxXC5Irpqkzfk71gJgxgjEYc/GeNUUkIST7Mo47vlCLkOCmUlcF35SmqYAbs5UZfNcZY5wS+nEWPAcGDrM3pml1xzpDOIdWhLPuIsq4YJHJcarSIhsE+aAF7Z2M07gSWc8iHCMhW4kzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688809; c=relaxed/simple;
	bh=xWHMU7atFYKRvt30SxeQKgp2s6O7JU6wBzJoUtaUrJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzAVmiYH44G4KJZOHUm+Xp8+c3Du8e90bW8TcDz9agGfADlP9Y4j/XTysxg8+xnDJ1gpB/X4+9wq+urNoCBRlS3udQ0RcN+y4D6uKhMO5vdWZ93DskXO98BApH+jWc2BqLtlNEQUD6aXRFAnURvNmYHw0PjT72TYtdq2xtbXp8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cestc.cn; spf=pass smtp.mailfrom=cestc.cn; arc=none smtp.client-ip=1.203.97.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cestc.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cestc.cn
Received: from localhost (localhost [127.0.0.1])
	by smtp.cecloud.com (Postfix) with ESMTP id EA3EE900115;
	Thu,  3 Apr 2025 21:59:54 +0800 (CST)
X-MAIL-GRAY:0
X-MAIL-DELIVERY:1
X-SKE-CHECKED:1
X-ABS-CHECKED:1
X-ANTISPAM-LEVEL:2
Received: from [10.32.170.7] (unknown [111.48.58.12])
	by smtp.cecloud.com (postfix) whith ESMTP id P3907747T281458165674352S1743688793004956_;
	Thu, 03 Apr 2025 21:59:53 +0800 (CST)
X-IP-DOMAINF:1
X-RL-SENDER:shaopeijie@cestc.cn
X-SENDER:shaopeijie@cestc.cn
X-LOGIN-NAME:shaopeijie@cestc.cn
X-FST-TO:hch@lst.de
X-RCPT-COUNT:8
X-LOCAL-RCPT-COUNT:2
X-MUTI-DOMAIN-COUNT:0
X-SENDER-IP:111.48.58.12
X-ATTACHMENT-NUM:0
X-UNIQUE-TAG:<b8a06d17501ce1179f14244e491592d0>
X-System-Flag:0
Message-ID: <bd5f2f8a-94f0-43b0-af02-565422d12032@cestc.cn>
Date: Thu, 3 Apr 2025 21:59:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix netns UAF introduced by commit 1be52169c348
To: Christoph Hellwig <hch@lst.de>
Cc: kbusch@kernel.org, sagi@grimberg.me, axboe@kernel.dk,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 gechangzhong@cestc.cn, zhang.guanghui@cestc.cn
References: <1f55b71d-8e28-4eac-b14e-d32a7e704578@cestc.cn>
 <20250401061934.2304210-1-shaopeijie@cestc.cn>
 <20250403043001.GA22526@lst.de> <20250403043034.GB22526@lst.de>
Content-Language: en-US
From: Peijie Shao <shaopeijie@cestc.cn>
In-Reply-To: <20250403043034.GB22526@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/2025 12:30 PM, Christoph Hellwig wrote:
> On Thu, Apr 03, 2025 at 06:30:01AM +0200, Christoph Hellwig wrote:
>>> +	ret = sock_create_kern(&init_net,
>>>   			ctrl->addr.ss_family, SOCK_STREAM,
>>>   			IPPROTO_TCP, &queue->sock);
>>
>> This can be realigned:
>>
>> 	ret = sock_create_kern(&init_net, ctrl->addr.ss_family, SOCK_STREAM,
>>   			IPPROTO_TCP, &queue->sock);
> 
> Also did the original patch get merged already?  If not please fold
> both into a single one.
> 
> 

Thanks!

Yes,the patch is merged into 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1be52169c3488ef98582ed553ab35cefa3978817

Style problems will be fixed in v2 version.





