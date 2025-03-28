Received: from smtp.cecloud.com (unknown [1.203.97.246])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAF51D63FD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.203.97.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151899; cv=none; b=OLX9oGmfi3TJ/hL0etn2yrVBLoL5XdhDyDfp7+A1F3RQMEKMWKyidh9A9FYxFkk3C9616I+RGicni92eWcj2nKgQ4NhTAnnr2ZGWYmWiyr2e9l1MbL8gB9w+PScM5eEz4yhCQVSssHiXFQawnrIaZhtSsf808uA73UsNEkKYzz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151899; c=relaxed/simple;
	bh=JODUdJq8p4C9uTfSwF+8bHy0HCxTPX9OUYOgaU6ceOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpX07NYE83wpvXWcfrkx1x02B0E10fv3fmOTcyahG3c+/SCL4LdzQBTi4utZlzhRnqiOwdHcYtPr4JIF7eRXu8xGDB8PXnBNTHMng+12SNHww3JBWElNJPb3Op5DB3+eRwTxL86a8TIqKrDNiSbp85XCIzfpbiWoMbC727s7/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cestc.cn; spf=pass smtp.mailfrom=cestc.cn; arc=none smtp.client-ip=1.203.97.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cestc.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cestc.cn
Received: from localhost (localhost [127.0.0.1])
	by smtp.cecloud.com (Postfix) with ESMTP id 2FF0D7C0112;
	Fri, 28 Mar 2025 16:51:27 +0800 (CST)
X-MAIL-GRAY:0
X-MAIL-DELIVERY:1
X-SKE-CHECKED:1
X-ABS-CHECKED:1
X-ANTISPAM-LEVEL:2
Received: from [10.32.170.7] (unknown [111.48.58.12])
	by smtp.cecloud.com (postfix) whith ESMTP id P1609374T281456915968368S1743151883941832_;
	Fri, 28 Mar 2025 16:51:26 +0800 (CST)
X-IP-DOMAINF:1
X-RL-SENDER:shaopeijie@cestc.cn
X-SENDER:shaopeijie@cestc.cn
X-LOGIN-NAME:shaopeijie@cestc.cn
X-FST-TO:david.laight.linux@gmail.com
X-RCPT-COUNT:10
X-LOCAL-RCPT-COUNT:2
X-MUTI-DOMAIN-COUNT:0
X-SENDER-IP:111.48.58.12
X-ATTACHMENT-NUM:0
X-UNIQUE-TAG:<0c713a00741ca5df5945f2cc684f6b26>
X-System-Flag:0
Message-ID: <1f55b71d-8e28-4eac-b14e-d32a7e704578@cestc.cn>
Date: Fri, 28 Mar 2025 16:51:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet: Replace sock_create with sock_create_kern
To: David Laight <david.laight.linux@gmail.com>,
 Keith Busch <kbusch@kernel.org>, Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhang.guanghui@cestc.cn, gechangzhong@cestc.cn
References: <20250324031708.1687164-1-shaopeijie@cestc.cn>
 <20250324210421.526c1729@pumpkin>
Content-Language: en-US
From: Peijie Shao <shaopeijie@cestc.cn>
In-Reply-To: <20250324210421.526c1729@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/2025 5:04 AM, David Laight wrote:
> On Mon, 24 Mar 2025 11:17:08 +0800
> shaopeijie@cestc.cn wrote:
> 
>> From: Peijie Shao <shaopeijie@cestc.cn>
>>
>> Replacing sock_create() with sock_create_kern()
>> changes the socket object's label to kernel_t,
>> thereby bypassing unnecessary SELinux permission
>> checks. It also helps to avoid copy and paste bugs.
> 
> Does sock_create_kern() hold a reference on the namespace?
> It hadn't used to and sock_create() will take one.
> 
> 	David
> 
>>
>> Signed-off-by: Peijie Shao <shaopeijie@cestc.cn>
>> ---
>>   drivers/nvme/target/tcp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
>> index 4f9cac8a5abe..216afacc8179 100644
>> --- a/drivers/nvme/target/tcp.c
>> +++ b/drivers/nvme/target/tcp.c
>> @@ -2049,7 +2049,8 @@ static int nvmet_tcp_add_port(struct nvmet_port *nport)
>>   	if (port->nport->inline_data_size < 0)
>>   		port->nport->inline_data_size = NVMET_TCP_DEF_INLINE_DATA_SIZE;
>>   
>> -	ret = sock_create(port->addr.ss_family, SOCK_STREAM,
>> +	ret = sock_create_kern(current->nsproxy->net_ns,
>> +				port->addr.ss_family, SOCK_STREAM,
>>   				IPPROTO_TCP, &port->sock);
>>   	if (ret) {
>>   		pr_err("failed to create a socket\n");
> 
> 
> 

Thanks for reviewing. Indeed, there is a netns UAF issue. The call path 
sock_create() -> __sock_create() -> inet_create() -> sk_alloc() takes a 
reference of the given netns, however sock_create_kern() doesn't perform 
this step.

Sorroy the patch for the host side '[PATCH] nvme-tcp: fix selinux denied 
when calling sock_sendmsg' has the same problem.

I will send a v2 patch to fix both host and target side soon, thanks.



