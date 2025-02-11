Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 135F51D63FC;
	Tue, 11 Feb 2025 01:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739238310; cv=none; b=dkOaKaFDutC16bY4q3DsaO8/I910nsFBbTLZ4boiZtcSKxQtKGpo5egXYZpQTlVb/cQVwmjB8eoAp9oArhEbHEzCCOujIRG+stK+uiwm6rZ2nu16j7C4Su+Y3cf+hzT6vo+rqoToi2eZ6cnW9xYCzjZiZBoiEeTzXS9nLrwNle8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739238310; c=relaxed/simple;
	bh=pUI1YZOKUr94bO9aS3sQdXKZsCWEZPq757t6+bTTyFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=INXWVbjF3YOkE8fTacnE/uCvUFsXs2fQmHgXk7AIdvdEMyRBcYAn9B4ogNkXTeHFXTAZ4Itd9u1XfX+OU+DPTg1KFGtY1NYlGLc6xDlnHfuDtMcEaZF94VkO2tG1AMiifwhzxujs3o/xv9XZV7ARRaD6r52R8xP1mMdQY5iNTN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id BFB24602A71E9;
	Tue, 11 Feb 2025 09:44:58 +0800 (CST)
Message-ID: <23763bba-5524-fe6d-4b6c-53ed2af12e82@nfschina.com>
Date: Tue, 11 Feb 2025 09:44:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] accel/amdxdna: Add missing include linux/slab.h
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, min.ma@amd.com,
 lizhi.hou@amd.com, ogabbay@kernel.org
Cc: quic_jhugo@quicinc.com, George.Yang@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <43eb87f7-0d47-43a7-b34a-9180f50de3b2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/2/10 17:43, Jacek Lawrynowicz wrote:

> Hi,
>
> please move the header to the include block above an keep it sorted:
> #include <linux/iopoll.h>
> -->#include <linux/slab.h><--
> #include <linux/xarray.h>

Ok, I will send a v2 patch for this.

Su Hui

> On 2/8/2025 9:05 AM, Su Hui wrote:
>> When compiling without CONFIG_IA32_EMULATION, there are some errors:
>>
>> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
>> drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
>> of function ‘kfree’.
>>    197 |  kfree(mb_msg);
>>        |  ^~~~~
>> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
>> drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
>> of function ‘kzalloc’.
>>    418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
>>        |           ^~~~~~~
>>
>> Add the missing include.
>>
>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> index 814b16bb1953..80b4b20addd6 100644
>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> @@ -12,6 +12,7 @@
>>   
>>   #define CREATE_TRACE_POINTS
>>   #include <trace/events/amdxdna.h>
>> +#include <linux/slab.h>
>>   
>>   #include "amdxdna_mailbox.h"
>>   
