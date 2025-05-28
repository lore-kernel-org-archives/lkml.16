Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DB638B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748401674; cv=none; b=aBF2d10hJU2mLZWOpLOVs0tDc7JnQeOCdz15lX7xyCyVEHLP5Tx7y/4eBKNPvBFxbgzojFuvRZJXoRPue3+2z+xmmiV6LXpRD5F2fcpDTl+J+CoABYB/fsyj2qpfDi3kAIknwR7of7EJfMXavmshfzS3ASX7WcJQl44m09Jsgq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748401674; c=relaxed/simple;
	bh=bYoHRv94+Uhdxo5N61QAXTbOOq0mvF1hZtdvceAEd/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfz656GkQYGXzss699ZLPqSbjxeNTStOhNOywPXWxxTA9Be0ULnEmcYWEiB+ruUX3a8bWQZopL9voCtidZtCEXd0MgxnsTZ4DjAM7uLVxqjc/2NAZqxTR0U3rJu5VupQlk9ePEYxTbZ183nWrJSNcb4/0J9b05rT09FFHf/u1u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: edb400603b7011f0b29709d653e92f7d-20250528
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:89388e7d-8e1f-4f14-a363-14ef45c0088f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:697afef8e70c061f84357a4c61fca64f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: edb400603b7011f0b29709d653e92f7d-20250528
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1708069242; Wed, 28 May 2025 11:07:45 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id A751116001A02;
	Wed, 28 May 2025 11:07:45 +0800 (CST)
X-ns-mid: postfix-68367E01-598433692
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id EC51B16001A01;
	Wed, 28 May 2025 03:07:43 +0000 (UTC)
Message-ID: <2154e254-3cbc-4dc4-8497-f168fee58598@kylinos.cn>
Date: Wed, 28 May 2025 11:07:43 +0800
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
 <b71a4ff3-8013-47e0-b2ac-2c5b3d8f8afc@kylinos.cn>
 <aDWdXT36Ucxk0O63@smile.fi.intel.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <aDWdXT36Ucxk0O63@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/5/27 19:09, Andy Shevchenko =E5=86=99=E9=81=93:
> On Tue, May 27, 2025 at 05:41:21PM +0800, Pei Xiao wrote:
>> =E5=9C=A8 2025/5/22 20:54, Andy Shevchenko =E5=86=99=E9=81=93:
>>> On Thu, May 22, 2025 at 05:01:26PM +0800, Pei Xiao wrote:
> ...
>
>>>> -void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
>>>> -				   size_t align);
>>>> -void devm_free_percpu(struct device *dev, void __percpu *pdata);
>>> Don't you need to cleanup the header inclusions as well?
>> no, I think we don't need to cleanup .
>>
>> #include <linux/lockdep.h> include #include <asm/percpu.h>
>>
>> only move #include <asm/percpu.h> to linux/device/devres.h for
>>
>> build error.
> It's not needed for the build error fixing as far as I understood it. _=
_percpu
> is defined in another header.

compiler_types.h or compiler.h=C2=A0

I tried before send patch, but it all resulted in compilation failures on=
 my arm64 machine.


> ...
>
>>>> -int __must_check devm_device_add_group(struct device *dev,
>>>> -				       const struct attribute_group *grp);
>>> I'm not sure about this. The percpu seems standalone piece, but this =
has
>>> relations with the other group related definitions just above.
>> I'm also not sure if this devm_device_add_group needs to be moved,=C2=A0
>>
>> which is why I haven't replied to you yet
> Fair enough.
>
> ...
>
>>>> +#include <linux/sysfs.h>
>> it's redundant.
>>>> +#include <asm/percpu.h>
>>> What for are these new inclusions, please?
>> for percpu.
> It does not define __percpu.
>
>>>> +void devm_free_percpu(struct device *dev, void __percpu *pdata);
>>> Please, take your time to understand what is behind the __percpu and
>>> why the asm/percpu.h is redundant here.
>> If this header file is missing, there will be a compilation error.=C2=A0
> Right. But this is wrong header for the purpose.
>
>> Which header file should I include?
> The one that defines it, hint:
> https://elixir.bootlin.com/linux/v6.15/A/ident/__percpu

compiler_types.h or compiler.h=C2=A0

I tried before send patch, but it all resulted in compilation failures on=
 my arm64 machine.

=C2=A0You can give it a try.

when i add a error in compiler_types.h

+++ b/include/linux/compiler_types.h
@@ -26,6 +26,7 @@
=C2=A0
=C2=A0/* sparse defines __CHECKER__; see Documentation/dev-tools/sparse.r=
st */
=C2=A0#ifdef __CHECKER__
+sasasas
=C2=A0/* address spaces */
=C2=A0# define __kernel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __attribute__((addr=
ess_space(0)))
=C2=A0# define __user=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __attribute__((noderef, address_spac=
e(__user)

it=C2=A0 still build success,have no build error.

#include <linux/lockdep.h> include <asm/percpu.h> ,so have no build error=
 before modidy,I think.

>> I've found that including=C2=A0<asm/percpu.h>=C2=A0does resolve my com=
pilation issue.
thanks!
