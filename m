Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4138C1DA53
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739239849; cv=none; b=obOu0ENGVQU7YyHVtJ8TAP7Zx9woeXZRxJkLkwj4ii6MIOlIE5QuPMtaw5G1widP+wWvz3vcWd9fpLqLwaNnmDKp254wW5jLxxrp82tyihD6qUj+EmG8TLrmC62bN/2gkWv8To0PthacZSBKhzZjdEYXrr5zHDUyHBzjrA98YIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739239849; c=relaxed/simple;
	bh=Fr0RebjifclQohEWpVEQQkCNJXvfA8rfMhCbBCL/xRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0r+Bs3bybwZen2AzXNccG65ibWWDL5P7DzLuoz2KPGLBpnO1BXlm5u8PlKxWys+JXdh471+IlQomwOSeoqfHKUkir1XdKHh7soGT9x3UYXqKmtehIK4Wcj4a1Znw474tdlvKY+OMz5ZW6Ab7flp/PSzcJAhPqZf9dvExCzCBlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 61b0610ee81d11efa216b1d71e6e1362-20250211
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0a6cd021-b74b-4636-8044-1296cd1d6001,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:6f300245bbb320185f45256b9d039828,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 61b0610ee81d11efa216b1d71e6e1362-20250211
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 789152770; Tue, 11 Feb 2025 10:10:36 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 170FB16001CC7;
	Tue, 11 Feb 2025 10:10:36 +0800 (CST)
X-ns-mid: postfix-67AAB19B-999081649
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id CB19216001CC7;
	Tue, 11 Feb 2025 02:10:35 +0000 (UTC)
Message-ID: <dc881f9a-37ab-466f-b6fd-2142f25eac4b@kylinos.cn>
Date: Tue, 11 Feb 2025 10:10:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5] phy: freescale: fsl-samsung-hdmi: fix build error in
 fsl_samsung_hdmi_phy_configure_pll_lock_det
To: Vinod Koul <vkoul@kernel.org>, vkoul@kernel.org
Cc: xiaopeitux@foxmail.com, linux-kernel@vger.kernel.org
References: <tencent_195F1119DC8F547C905D5ED127D173EFAE08@qq.com>
 <CAHCN7xL7eMV2f04nURp3jCCmNZ0GSTY=uaOwoiht38AC4Oz0EQ@mail.gmail.com>
 <476dace4-92fb-4d92-a342-cffd6f77b8f1@kylinos.cn> <Z6oxJEvABw780+DZ@vaman>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <Z6oxJEvABw780+DZ@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/2/11 01:02, Vinod Koul =E5=86=99=E9=81=93:
> On 17-01-25, 10:15, Pei Xiao wrote:
>> =E5=9C=A8 2025/1/17 09:59, Adam Ford =E5=86=99=E9=81=93:
>>> On Mon, Jan 13, 2025 at 2:41=E2=80=AFAM <xiaopeitux@foxmail.com> wrot=
e:
>>>> From: Pei Xiao <xiaopei01@kylinos.cn>
>>>>
>>>> FIELD_PREP() checks that a value fits into the available bitfield,
>>>> but the index div equals to 4,is out of range.
>>>>
>>>> which gcc complains about:
>>>> In function =E2=80=98fsl_samsung_hdmi_phy_configure_pll_lock_det=E2=80=
=99,
>>>> inlined from =E2=80=98fsl_samsung_hdmi_phy_configure=E2=80=99 at
>>>> drivers/phy/freescale/phy-fsl-samsung-hdmi.c :470:2:
>>>> ././include/linux/compiler_types.h:542:38: error: call to =E2=80=98_=
_compiletime_assert_538=E2=80=99
>>>> declared with attribute error: FIELD_PREP: value too large for the f=
ield
>>>>   542 |  _compiletime_assert(condition, msg, __compiletime_assert_,
>>>> __COUNTER__)
>>>>       |                                      ^
>>>> ././include/linux/compiler_types.h:523:4: note: in definition of
>>>> macro =E2=80=98__compiletime_assert=E2=80=99 523 |    prefix ## suff=
ix();
>>>>       |    ^~~~~~
>>>> ././include/linux/compiler_types.h:542:2: note: in expansion of macr=
o
>>>> =E2=80=98_compiletime_assert=E2=80=99
>>>>   542 |  _compiletime_assert(condition, msg, __compiletime_assert_,
>>>>  __COUNTER__)
>>>>
>>>> REG12_CK_DIV_MASK only two bit, limit div to range 0~3,
>>>> so build error will fix.
>>>>
>>> LGTM.
>>>
>>> Reviewed-by:  Adam Ford <aford173@gmail.com>
>> loop Vkoul for=C2=A0email address was written incorrectly.
> Thanks for looping in!
>
> Change looks good to me. Can you please revise the patch title. A patch
> title should describe the change we are making. Fix build error is not
> an apt title

there so many=C2=A0 "Fix build error" : https://git.kernel.org/pub/scm/li=
nux/kernel/git/next/linux-next.git/log/?qt=3Dgrep&q=3Dfix+build+error

what we should revise?

Like:*phy: freescale: fsl-samsung-hdmi: Limit PLL lock detection clock di=
vider to valid range*

if you approve,I will send V6 for the title,or any advice?

Pei,

Thanks!

