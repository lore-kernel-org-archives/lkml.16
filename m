Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87B5218AC8
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747969704; cv=none; b=MdS1uZMrqnB2MOK+qQVi/DZdHn0bb6JePmlapY9n5IRjMGukZl0uDierOcKpcf2HFw51R/iq387EBmEYDTrEI6DJYAdalcmPfIqrIQ24Aipjv88fnChhkb7jbtfBC8MNRE7AbneIDM5ILtXM0ZnCr9/FdaGb2R3HDCZ0e8K1cmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747969704; c=relaxed/simple;
	bh=Sqz/278FdnOoqHsMnL1osxPoy3F6FDVCvwvqgyuiMm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riRz22AnyYGLpzsRq5AXx2i9bF53v6kCFKHSa8hTL3qexTpIuDWRSQQGIMp5MNKlOHuC4ew5AOCBvTR8OUXChW4VJrt+EDDVXHTCHYo4d2qJwO2iWc5slueAl/M8bmyFNkrFTcVm6cXvlD2mzUbZddD/p99K4AS5UObJEoflYBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 28623cb4378311f0b29709d653e92f7d-20250523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:81d289c8-f117-40e5-9bad-d52e8f26d88c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:307a2bf67713fa1756139d6dab2a9bf5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 28623cb4378311f0b29709d653e92f7d-20250523
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1152663842; Fri, 23 May 2025 11:08:10 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 6DCFB16003842;
	Fri, 23 May 2025 11:08:10 +0800 (CST)
X-ns-mid: postfix-682FE69A-3583511376
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id 9446116003841;
	Fri, 23 May 2025 03:08:09 +0000 (UTC)
Message-ID: <3abc216a-1af5-4cc2-a70c-e406943be274@kylinos.cn>
Date: Fri, 23 May 2025 11:08:09 +0800
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
>
> ...
>
>> -int __must_check devm_device_add_group(struct device *dev,
>> -				       const struct attribute_group *grp);
> I'm not sure about this. The percpu seems standalone piece, but this ha=
s
> relations with the other group related definitions just above.
>
> ...
>
>> +#include <linux/sysfs.h>
>> +#include <asm/percpu.h>
> What for are these new inclusions, please?

I add these for build error:

In file included from drivers/gpio/gpiolib-devres.c:9:
./include/linux/device/devres.h:189:15: error: expected =E2=80=98=3D=E2=80=
=99, =E2=80=98,=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=
=80=98__attribute__=E2=80=99 before =E2=80=98*=E2=80=99 token
=C2=A0 189 | void __percpu *__devm_alloc_percpu(struct device *dev, size_=
t size,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
./include/linux/device/devres.h:191:57: error: expected =E2=80=98;=E2=80=99=
, =E2=80=98,=E2=80=99 or =E2=80=98)=E2=80=99 before =E2=80=98*=E2=80=99 t=
oken
=C2=A0 191 | void devm_free_percpu(struct device *dev, void __percpu *pda=
ta);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
./include/linux/device/devres.h:194:25: warning: =E2=80=98struct attribut=
e_group=E2=80=99 declared inside parameter list will not be visible outsi=
de of this definition or declaration
=C2=A0 194 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const struct attribute_group *grp);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~

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
ok,get it
>> + * Pointer to allocated memory on success, NULL on failure.
>> + */
>> +#define devm_alloc_percpu(dev, type)      \
>> +	((typeof(type) __percpu *)__devm_alloc_percpu((dev), sizeof(type), \
>> +						      __alignof__(type)))
> Just make it one line. it will be less than 100.
ok
>> +void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
>> +				   size_t align);
> Ditto.
ok.
>> +void devm_free_percpu(struct device *dev, void __percpu *pdata);
> Please, take your time to understand what is behind the __percpu and
> why the asm/percpu.h is redundant here.
>
