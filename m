Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8FD264FB8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745379375; cv=none; b=O4yNzDAzh/nlmeJjtyDbxZdQXH1+7LhjIOyN9G/kHuB6LEipuJ8KkqbcWcwaQnSp/GCTcDqZ+ueQDd6JSagSZFF5QsNeIndsxHSy7pKdfh2IM/rtIOK+5MOWIligdo5GYwtUvabaXlw394kWY4AthsVLbVyXyJP7qoGHUZ/3CeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745379375; c=relaxed/simple;
	bh=+mlvHyZzELvcNUk0O85lZshIIVWRXXG7/OBV34CvF0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlAv5cP8wJkACpnVpPX8QGN3Vx0GWwsI2ate4ajGSGnzBtdyDIkhXoT8nXTEz1SzRNUuipCuVVVjN9VqMeUh9tBLw5wYNnK0VepfGhHltTzWzBhMKDrM/gbwzv4GpYDSutBUFoBCTz7KzN6FXSOPgf4T9ex3uTwMvAm0Pv3vzw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1841b8881ff411f0a216b1d71e6e1362-20250423
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ee36ab88-0f71-4689-a0fe-deb3e33af5e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:ccea9e22d1b59026ae57a07fd7893c12,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1841b8881ff411f0a216b1d71e6e1362-20250423
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 163784823; Wed, 23 Apr 2025 11:36:08 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 9358316003841;
	Wed, 23 Apr 2025 11:36:08 +0800 (CST)
X-ns-mid: postfix-68086028-398736455
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id B7BFC16003840;
	Wed, 23 Apr 2025 03:36:07 +0000 (UTC)
Message-ID: <0c3b4a88-58b7-4088-a4fa-45f927ce0edd@kylinos.cn>
Date: Wed, 23 Apr 2025 11:36:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3 V1] lib: logic_pio: export function symbol in
 logic_pio
To: John Garry <john.g.garry@oracle.com>, xiaopeitux@foxmail.com
Cc: andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
 robh@kernel.org, xuwei5@hisilicon.com
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
 <tencent_2BC43E7712D51EA49597D8C9DE5CAE2B5906@qq.com>
 <0502a9cd-d13a-4de0-bc86-3ae0466695f5@oracle.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <0502a9cd-d13a-4de0-bc86-3ae0466695f5@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/4/23 00:05, John Garry =E5=86=99=E9=81=93:
> On 22/04/2025 12:31, xiaopeitux@foxmail.com wrote:
>> From: Pei Xiao<xiaopei01@kylinos.cn>
>>
>> export some function via EXPORT_SYMBOL, convenient to use in
>> kernel modules in the future if somebody went to use this lib.
>> This is one reason for this library exists.
>>
>> Signed-off-by: Pei Xiao<xiaopei01@kylinos.cn>
>
> No, we don't export just because someone might need this is future.
>
Now modify it=EF=BC=8CMight it be convenient for future people?

People in the future might be able to save some effort here.

> And, FWIW, EXPORT_SYMBOL_GPL is preferred.
