Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F57A23ABAD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849403; cv=none; b=cJVveuOaRZbaFXxGsukILK9deB4X0h40uBOfLOskryXz/wr8eQ8OjFQU5YS1hcHLuvz3jg/1iQxsU8MWKP9WBTSsbmFyXrAErLU6HjTP8nK9mIaDuSap8r608VzbQDVlvLowtf4XxPeNyeMmLCztyN4+zoTJ+o8W42YjHA1Q0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849403; c=relaxed/simple;
	bh=4g+L4G0tMIc145fGYqMbFN7XcyM9UxxEQBV+jLHsLmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJT5JBahtNL/F3WUBEao8BF1wGq5HxESkyJ5jnEDhUT0wbxcInKNu//EinR29Gsm/RRU8wz/LNa9Ik8rTS09a3sZPcUeiVU/NNNdlp9KF2oOCn4meIcQbAm6NThggGzIcGZDqD372ceU+D1TM0iHqKGnO0YkxgMz3/BsMzIuAHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYc5x0QS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYc5x0QS"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so9687766a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750849399; x=1751454199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FG1P8CHryUaXZf8mi+4YebSBxRIf/UHd7sOEoQ7RTdM=;
        b=cYc5x0QS2k1b0zNm8S7rw67rA07WFFgoqT+YhhcTp6kWP/dJ4XP2jbSQauG1lxP0vN
         fnCJc/BPvgEofDdNpx73pyn5JcahbtS3QN6z7YjtVL3ZbZzNYFbOU+0Pohtfern2o1gN
         i8G2JNdUr0HQMjI+NYU1gVxKu6bgD+F9aDknQRyhWlJ18MdualyrZWYjJdBZSG4IIFUg
         p4kp9YuDtetuoBm/BSQOQUo67R39ApQWAki/g+oUkQ8aqiB/RItk3/xUOCw1hlArJvgS
         DO+8WdIK1WDtJEJy0iVncTA6csCO1HP9RRKQQ8S6bi5bNA66h6G9249n71Q/Dfxju/S/
         uEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849399; x=1751454199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FG1P8CHryUaXZf8mi+4YebSBxRIf/UHd7sOEoQ7RTdM=;
        b=kY01n99aOv3iUl21dDyzvE5mp4Vp0YClfmusKlZg3+fJzj6RV43b6yAh8/fmLkytFF
         Ez4r222XfVMKLm0G31hpXeqoalO1CHG4k3tqgAtZJXH1+qHeId+AwKKOaW12p+JlJJA+
         +Pe1AE6fX7Acmfubud9CVCBq/+jTYTtkewH/zEtstJbl2suEzfW1zn+8Xi3S6xA4J0iO
         3t9DKJ7BYnlEE21qVF3chivV0dWZ3UlH0EtvlSwi6kknuCl/KuM33UvpNpVf0zR0fLmm
         SG39pL03o8mXgkf+CEDyo0GykpF6Va7qKtDbtmjkHX+iXmeeaFwdfzK1B0/083ZK22ql
         i/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAfbe35tBs+AMD0Vi/nRuxftohBbD6sd/FC7Kx6u5UM2wJz4pn82W7Cr8n+vwMQM4kpb+g+NJY/TkxiDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTZS3lYmU4ophgPA3wL+ysZDwG/yTwoGqRbspMH6cJJeRN4U4
	YBew03GS3pkqFVtn4dpgy99nZA06bJLrXc6FcVes0Ht+eyMads5bMHu6
X-Gm-Gg: ASbGnctE/Har+XmE5/dIQ21PrV0q+PxC6R6WkUdzXQ+Svm+Po66ldbJhj4GRhCayI8v
	cEcsyiPnaGRy5C3iDmEUeqaI/kK8na646d8SIoqN43ys1zDRNbAj/bP1RGKqKkU0IZpGuEWWNj7
	mKYOHDGIGIGMgEKjMSrz8RJpukk98lJUn1JDzGNgpwrjYzfE5y3A0GOtqkb3E0d+aKEPCkoZmCh
	UBsq1ZDV9q460jS+9k5F5DFXpQV8E2nyVuz5xY+z57caiywXZQ6WDaI17TpuWC1QSUDU0qYo/8B
	xxLaRVqBSU2DElCncHRfFyRds9fyg517MWVtiHGmUswoPwtfX+vnQdZSsWUbu5q+pezchorxttk
	iUr940XK0qzvrhG29N/gB0Tt77T7ZePNh
X-Google-Smtp-Source: AGHT+IGOtBi23jTRNgwJ5c1WUUVFrnDLfhHWfhKcHoNgqL6ZwQGOLzxtvPJyEH5F05dtdHi7LaEwcQ==
X-Received: by 2002:a05:6402:3514:b0:5fb:e868:8730 with SMTP id 4fb4d7f45d1cf-60c4dbb9d5bmr1849558a12.10.1750849398870;
        Wed, 25 Jun 2025 04:03:18 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:7e:645c:aa81:5180? ([2620:10d:c092:500::5:db74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196c6esm2320666a12.16.2025.06.25.04.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:03:18 -0700 (PDT)
Message-ID: <f366ce31-582c-4f90-bc32-05ddf3e71fa6@gmail.com>
Date: Wed, 25 Jun 2025 12:03:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Hugh Dickins <hughd@google.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/06/2025 08:34, David Hildenbrand wrote:
>>>
>>> We would all prefer a less messy world of THP tunables.  I certainly
>>> find plenty to dislike there too; and wish that a less assertive name
>>> than "never" had been chosen originally for the default off position.
>>>
>>> But please don't break the accepted and documented behaviour of
>>> MADV_COLLAPSE now.
>>
>> Again see above, I absolutely disagree this is documented _clearly_. And
>> that's the underlying issue here.
>> > I feel like if you polled 100 system administrators (assuming they knew
>> about THP) as to how you globally disable THP, probably all 100 would say
>> you do it via:
>>
>> # echo never > /sys/kernel/mm/transparent_hugepage/enabled
>>
> 
> Yes. One big problem is that the documentation was not updated.
> 
> Changing the meaning of "entirely disabled" to "entirely disabled automatically (page faults, khugepaged)"
> 
>> So shouldn't 'never break userspace' be based on practical reality rather
>> than a theorised interpretation of documents that sadly are not clear
>> enough?
> 
> I think the problem is that there might indeed be more users out there relying on "never+MADV_COLLPASE" to now place THPs than "never+MADV_COLLPASE" to no place THPs.
> 
> What is the harm when not placing THPs? Performance degradation for some apps?
> 

I think a bigger issue than performance degradation is someone upgrading the kernel and not
seeing MADV_COLLAPSE working as it has since the beginning and not knowing that its due
to a kernel change.

I feel transparent_hugepage/enabled is too messed up, and its difficult to fix it without
breaking it for someone? I still find it weird that we can set transparent_hugepage/enabled
to never and transparent_hugepage/hugepages-2048kB/enabled to madvise and still get hugepages.
(And we actually use this configuration in production for our ARM servers).

Introducing deny for global and page size I feel will over complicate it because of the issue in
the previous paragraph, page size setting overrides global setting. so even if
transparent_hugepage/enabled is deny, we might still get a THP if the page setting is not.
Someone needs to file to deny, which is the same as setting every file to never.

So I just wanted to throw another bad idea in the mix, what if we introduce another sysfs file
(I hate introducing sysfs :)), something like /sys/kernel/mm/thp_allowed (or some other alternate name)
which is default 1.
Once someone sets it to 0, no one can ever get a THP, no matter what future changes we make. Whether its
madv_collapse, bpf THPs, cgroup THPs, prctls, syscalls.. never will mean never.
Notice that its /sys/kernel/mm/thp_allowed and not /sys/kernel/mm/transparent_hugepage/thp_allowed.
Having it one directory above will make it look uglier, but it highlights that whatever you
set in /sys/kernel/mm/transparent_hugepage/ wont matter if /sys/kernel/mm/thp_allowed is set to 0.
Ideally this would be /sys/kernel/mm/transparent_hugepage/enabled=never if we were developing this
from scratch..
Not pushing for this idea, just throwing it out there.

Thanks,
Usama
 
