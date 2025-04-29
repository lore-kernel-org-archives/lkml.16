Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12EA130A54
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932653; cv=none; b=hDTrXhejmu9mldvxnmuRn3yqO57ZzO1Odx+6FT3h6Shm9rXYh6xHM+pBsVqBwJKWDDYjL42FGrVV7/EIBo2xZ51M7dzUaCH82l9GnpxJ0B7DvNwZBa6Pt59fzbjXu2JDXcH0oGf0VIp6kbshE+dKetqUdMZ8vW7c9IV6w8TuzIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932653; c=relaxed/simple;
	bh=7Y5NTnCFDzXwCsD2wU9EAUF1uwpBd6usaQJu+svC4Sc=;
	h=Message-Id:Date:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=d/nKc2Pljrilano95Tw5jZiltjy7gf9+SInw+PNKHNJ8HyrlzeZXhgA3Yf/Wwy9DCEOVsJ/a/wR49HcFhLqk8cGBdsIuNVzUaOtAol9sO9apUfxORAGaxUKAs3QkGKlyJ34SHP5o1yLVSQfrDc+b4bcLZ8CFjTm+/6GoFEa9ZDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Zn17j42NMz5B1Jt;
	Tue, 29 Apr 2025 21:17:21 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 53TDHHjY085301;
	Tue, 29 Apr 2025 21:17:17 +0800 (+08)
	(envelope-from liu.song13@zte.com.cn)
Message-Id: <202504291317.53TDHHjY085301@mse-db.zte.com.cn>
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 53T9T3aU063440;
	Tue, 29 Apr 2025 17:29:03 +0800 (+08)
	(envelope-from liu.song13@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Tue, 29 Apr 2025 17:29:05 +0800 (CST)
Date: Tue, 29 Apr 2025 17:29:05 +0800 (CST)
X-Zmail-TransId: 2af968109be16a9-43a08
X-Mailer: Zmail v1.0
In-Reply-To: <0b1e1a00-2cb9-4793-a439-06fcec3e71ec@amd.com>
References: 202504270413.53R4DUco001600@mse-db.zte.com.cn,0b1e1a00-2cb9-4793-a439-06fcec3e71ec@amd.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <liu.song13@zte.com.cn>
To: <felix.kuehling@amd.com>
Cc: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
        <airlied@gmail.com>, <simona@ffwll.ch>,
        <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <liu.xuemei1@zte.com.cn>,
        <jiang.xuexin@zte.com.cn>, <xue.zhihong@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gZHJtL2FtZGtmZDogZW5hYmxlIGtmZCBvbiBSSVNDViBzeXN0ZW1z?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-db.zte.com.cn 53TDHHjY085301
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6810D161.000/4Zn17j42NMz5B1Jt

>> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
>>
>> KFD has been confirmed that can run on RISCV systems. It's necessary to
>> support CONFIG_HSA_AMD on RISCV.
> 
> Is there a public user mode branch with any changes needed to make ROCm 
> user mode work with RISCV?
> 
> One more question inline.
> 
> 
>> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
>> index d3c3d3ab7225..9d4a5f8ef43f 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
>> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
>> @@ -5,7 +5,7 @@
>>
>>   config HSA_AMD
>>    bool "HSA kernel driver for AMD GPU devices"
>> - depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
>> + depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || RISCV)
> 
> The KFD memory model only works on 64-bit architectures. Is there a way 
> to express that in the RISCV dependency?
> 
> Regards,
>   Felix

Dear Felix:

  Thanks for your feedback.
  Regarding the issues you've pointed out:
  1. The adaptation work of ROCm user mode work on RISCV was done by my collegue. He replied that he made no changes in ROCm code.
  2. I will send patch-v2 to satisfy KFD only work on 64-bit architectures.

Best regards,
  Xuemei
