Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42659186E2D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516154; cv=none; b=MNFT5xOikBfm4iMt+SxJIKxs84KIIk0mN2OOhdVhcatxUDzcnA1e103/B1ptiGJ752K377LbnpI01xAcBu/GhodDxx/naE9dTY0rJf0VG8VBnK4Ai7sig7x/fKtoVGyJV7poQDEJNk6/q1y87yBozPON4S+i6i/zUtaUgx+EpUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516154; c=relaxed/simple;
	bh=tGFUH3YeK3Y5i8K69TenmrnevUszGvcMrvO8JetVV/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQR4U3TZbxhbm3iouALW3apV+XsSc4OdWxP/+hUxHCfupXFWDbNmCGTYoPobHPxZaixVZ/tMesXrtifZj2mwxmquRNH+wrOF0FyTw/l8tJAuZjfLMV2ISwkbmEdztJ6Npau4XwAHoCh5hSQL4KRXirB3D2xECwaozVcUb+gv/h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 258b01242a4a11f0b29709d653e92f7d-20250506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:1c183963-0b42-40c9-81a1-3975bf9f7f1c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:e5fe85b7276047bc350b5965cf236439,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 258b01242a4a11f0b29709d653e92f7d-20250506
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
	(envelope-from <huangbing@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 711961296; Tue, 06 May 2025 15:17:19 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
	by node2.com.cn (NSMail) with SMTP id 3C8C4B804EBD;
	Tue,  6 May 2025 15:17:19 +0800 (CST)
X-ns-mid: postfix-6819B77F-15719446
Received: from [10.42.12.196] (unknown [10.42.12.196])
	by node2.com.cn (NSMail) with ESMTPA id 5FD29B804EBC;
	Tue,  6 May 2025 07:17:17 +0000 (UTC)
Message-ID: <94253114-dcd1-4f65-9771-7534926c66f2@kylinos.cn>
Date: Tue, 6 May 2025 15:17:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/sched_ext: Fix errors when running make mrproper
To: Andrea Righi <arighi@nvidia.com>
Cc: tj@kernel.org, void@manifault.com, changwoo@igalia.com,
 joshdon@google.com, brho@google.com, haoluo@google.com,
 linux-kernel@vger.kernel.org
References: <20250430024833.196192-1-huangbing@kylinos.cn>
 <aBhnMUJJzBATtS2_@gpd3>
Content-Language: en-US
From: Bing Huang <huangbing@kylinos.cn>
In-Reply-To: <aBhnMUJJzBATtS2_@gpd3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/5/25 15:22, Andrea Righi wrote:
> Hi Bing,
>
> On Wed, Apr 30, 2025 at 10:48:33AM +0800, Bing Huang wrote:
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
>> ---
>>   tools/sched_ext/Makefile | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tools/sched_ext/Makefile b/tools/sched_ext/Makefile
>> index ca3815e572d8..5329cae284c6 100644
>> --- a/tools/sched_ext/Makefile
>> +++ b/tools/sched_ext/Makefile
>> @@ -79,9 +79,11 @@ VMLINUX_BTF_PATHS ?= $(if $(O),$(O)/vmlinux)					\
>>   		     /sys/kernel/btf/vmlinux					\
>>   		     /boot/vmlinux-$(shell uname -r)
>>   VMLINUX_BTF ?= $(abspath $(firstword $(wildcard $(VMLINUX_BTF_PATHS))))
>> +ifeq ($(findstring $(MAKECMDGOALS),clean),)
> Looks good, just a minor nit, can we do something like this instead?
>
> ifneq ($(sort $(MAKECMDGOALS)),clean)
>
> Since we only support "clean", we can simply check if "clean" is the only
> target specified.
>
> This also handles odd cases like `make clean clean`, where we still skip
> the check as expected. WDYT?
>
> Thanks,
> -Andrea

Thank you very much for your feedback. I have tested the changes you

suggested, and it work perfectly! I will send v2 shortly.

>
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
