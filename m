Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E342A99
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748338893; cv=none; b=q7TADaHApezg4nLKQEHb0IyWQT7cU0hsRgmdolcFwrBLFSVJLvJ3zlbz87FbQ5tY3ShFuukTaUR6JBEHI1Bl2BcZvOIlp75304rGQgQZhBsr2CjM89crbFv4DXVB/nLId2w+4uUHr6EjNI7V7/nfs9ZpZUD5hItZAMyHuDyl67Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748338893; c=relaxed/simple;
	bh=BvfLCWLKtUc42lEyt2dP0lPcBtM8AqwZ8FVxhVV74Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n78Se3JyHG8qtLBh5+1EIvyqqOV2I0Vje75zAATeW5TlnnCQiw4QRhMC7xNokpm9LrgeNK1Zh7S0eGSSkwh1pkYs3ZMoe96FbednCS2WXaJCMxQZ+aikE3Fjgn7x7NRaKzfsWBh8wKMaatQxuBx9xf3/AYkAYv7e+f41Dr85Y9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c0847c9c3ade11f0b29709d653e92f7d-20250527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:a3a82dc2-b9ed-4292-8936-57660e22f4fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:143b49f66f96d30bb8fa05e212c91928,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c0847c9c3ade11f0b29709d653e92f7d-20250527
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1153599882; Tue, 27 May 2025 17:41:23 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 5C89916001F49;
	Tue, 27 May 2025 17:41:23 +0800 (CST)
X-ns-mid: postfix-683588C3-3076933288
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id 88E6016001F55;
	Tue, 27 May 2025 09:41:21 +0000 (UTC)
Message-ID: <b71a4ff3-8013-47e0-b2ac-2c5b3d8f8afc@kylinos.cn>
Date: Tue, 27 May 2025 17:41:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] devres: Move remaining devm_alloc_percpu and
 devm_device_add_group to devres.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org
References: <5ac1e2a127c9df7233ca8ba0696ebb08960d0fc3.1747903894.git.xiaopei01@kylinos.cn>
 <aC8en60QI0MwnXxM@smile.fi.intel.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <aC8en60QI0MwnXxM@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/5/22 20:54, Andy Shevchenko =E5=86=99=E9=81=93:
> On Thu, May 22, 2025 at 05:01:26PM +0800, Pei Xiao wrote:
>> Since commit f5e5631df596("devres: Move devm_*_action*() APIs to
>> devres.h"), But devm_alloc_percpu() and devm_device_add_group didn't b=
e
>> moved.
>>
>> so move it.The changes improve header organization by keeping all
>> resource-managed device APIs in the dedicated devres.h header,
>> reducing cross-header dependencies and making the interfaces
>> easier to locate.
> Thanks for the patch, my comments below.
>
> ...
>
>> -/**
>> - * devm_alloc_percpu - Resource-managed alloc_percpu
>> - * @dev: Device to allocate per-cpu memory for
>> - * @type: Type to allocate per-cpu memory for
>> - *
>> - * Managed alloc_percpu. Per-cpu memory allocated with this function =
is
>> - * automatically freed on driver detach.
>> - *
>> - * RETURNS:
>> - * Pointer to allocated memory on success, NULL on failure.
>> - */
>> -#define devm_alloc_percpu(dev, type)      \
>> -	((typeof(type) __percpu *)__devm_alloc_percpu((dev), sizeof(type), \
>> -						      __alignof__(type)))
>> -
>> -void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
>> -				   size_t align);
>> -void devm_free_percpu(struct device *dev, void __percpu *pdata);
> Don't you need to cleanup the header inclusions as well?

no, I think we don't need to cleanup .

#include <linux/lockdep.h> include #include <asm/percpu.h>

only move #include <asm/percpu.h> to linux/device/devres.h for

build error.

> ...
>
>> -int __must_check devm_device_add_group(struct device *dev,
>> -				       const struct attribute_group *grp);
> I'm not sure about this. The percpu seems standalone piece, but this ha=
s
> relations with the other group related definitions just above.

I'm also not sure if this devm_device_add_group needs to be moved,=C2=A0

which is why I haven't replied to you yet

> ...
>
>> +#include <linux/sysfs.h>
it's redundant.
>> +#include <asm/percpu.h>
> What for are these new inclusions, please?
for percpu.
> ...
>
>> +/**
>> + * devm_alloc_percpu - Resource-managed alloc_percpu
>> + * @dev: Device to allocate per-cpu memory for
>> + * @type: Type to allocate per-cpu memory for
>> + *
>> + * Managed alloc_percpu. Per-cpu memory allocated with this function =
is
>> + * automatically freed on driver detach.
>> + *
>> + * RETURNS:
> Please, check that all of the kernel-doc are in align (using same style=
).
ok.
>> + * Pointer to allocated memory on success, NULL on failure.
>> + */
>> +#define devm_alloc_percpu(dev, type)      \
>> +	((typeof(type) __percpu *)__devm_alloc_percpu((dev), sizeof(type), \
>> +						      __alignof__(type)))
> Just make it one line. it will be less than 100.
get it.
>> +void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
>> +				   size_t align);
> Ditto.
>
get it.
>> +void devm_free_percpu(struct device *dev, void __percpu *pdata);
> Please, take your time to understand what is behind the __percpu and
> why the asm/percpu.h is redundant here.

If this header file is missing, there will be a compilation error.=C2=A0

Which header file should I include?

I've found that including=C2=A0<asm/percpu.h>=C2=A0does resolve my compil=
ation issue.

Thanks for you help.

Pei.

