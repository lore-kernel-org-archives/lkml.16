Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C2526AEC
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517807; cv=none; b=Ele38rTDt3nilnX621Qj/UHmpaIfbZuhWJllpeZcHNJ3HjuG5lTF3GkCCWLN/zk7XNOvmcIxWpO4v4cmJxBDItZnQoYF2Bv6MuzKk+W695xxkXw2Ktw9NAQfqXiCMgcOR79QyW0Dhe5/vEiOrAeL2j5wQ1nyJ3mHce2OO6WDCQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517807; c=relaxed/simple;
	bh=Tsv8HLmROnKwY1//B4jmslP8r2buTeYlf1eAWRUOm+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCDGvCatlPoAE8JSHKqEj/in0barG60BsnNdXE0d/LZVUyxP+0nzcH1riQHv2SRk9uedbJSkzGmuDAd1aOc1/NMWfiEWnEJchvcBULwI3yZBsClJ+dsb8e2ubGjBHfJLJv34QSpp12KOcJlyU5euCUQm9fNrbeFY/eG2JOu0xlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b5578d002a4e11f0b29709d653e92f7d-20250506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:cb29c965-2077-4190-aee9-9240cac32254,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:ea5e65c498a5b89f7f91986f7daa7aa2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b5578d002a4e11f0b29709d653e92f7d-20250506
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
	(envelope-from <huangbing@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 521657902; Tue, 06 May 2025 15:49:58 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
	by node2.com.cn (NSMail) with SMTP id 71D19B804EBD;
	Tue,  6 May 2025 15:49:58 +0800 (CST)
X-ns-mid: postfix-6819BF26-379280122
Received: from [10.42.12.196] (unknown [10.42.12.196])
	by node2.com.cn (NSMail) with ESMTPA id DA6B4B80758A;
	Tue,  6 May 2025 07:49:57 +0000 (UTC)
Message-ID: <20cf7a95-68c0-4e18-ab24-9112b07a2697@kylinos.cn>
Date: Tue, 6 May 2025 15:49:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/sched_ext: Fix errors when running make mrproper
To: Andrea Righi <arighi@nvidia.com>
Cc: tj@kernel.org, void@manifault.com, changwoo@igalia.com,
 joshdon@google.com, brho@google.com, haoluo@google.com,
 linux-kernel@vger.kernel.org
References: <20250506073432.2291120-1-huangbing@kylinos.cn>
 <aBm8ksy5IQAbhga1@gpd3>
Content-Language: en-US
From: Bing Huang <huangbing@kylinos.cn>
In-Reply-To: <aBm8ksy5IQAbhga1@gpd3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/6/25 15:38, Andrea Righi wrote:
> On Tue, May 06, 2025 at 03:34:32PM +0800, Bing Huang wrote:
>> If the system environment used to compile the kernel code does not
>> have the BTF feature enabled, running make mrproper will result in
>> errors similar to the following:
>>
>> Makefile:84: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-4.4.131-20190505.kylin.server-generic".  Stop.
>> make[2]: *** [Makefile:192: sched_ext_clean] Error 2
>> make[1]: *** [/home/huangbing/klinux/Makefile:1374: sched_ext] Error 2
>> make: *** [Makefile:236: __sub-make] Error 2
>>
>> Signed-off-by: Bing Huang <huangbing@kylinos.cn>
>> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> You can just add Suggested-by here, no need to add my SoB line. Apart than
> that, looks good to me.
>
> Reviewed-by: Andrea Righi <arighi@nvidia.com>
>
> Thanks,
> -Andrea
>
OK. Thanks! v3 will sent.
>> ---
>>
>> v1->v2: Sort MAKECMDGOALS and check for clean target
>>
>>   tools/sched_ext/Makefile | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tools/sched_ext/Makefile b/tools/sched_ext/Makefile
>> index ca3815e572d8..212717aa78af 100644
>> --- a/tools/sched_ext/Makefile
>> +++ b/tools/sched_ext/Makefile
>> @@ -79,9 +79,11 @@ VMLINUX_BTF_PATHS ?= $(if $(O),$(O)/vmlinux)					\
>>   		     /sys/kernel/btf/vmlinux					\
>>   		     /boot/vmlinux-$(shell uname -r)
>>   VMLINUX_BTF ?= $(abspath $(firstword $(wildcard $(VMLINUX_BTF_PATHS))))
>> +ifneq ($(sort $(MAKECMDGOALS)),clean)
>>   ifeq ($(VMLINUX_BTF),)
>>   $(error Cannot find a vmlinux for VMLINUX_BTF at any of "$(VMLINUX_BTF_PATHS)")
>>   endif
>> +endif
>>   
>>   BPFTOOL ?= $(DEFAULT_BPFTOOL)
>>   
>> -- 
>> 2.25.1
>>
