Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D1A1DE2D8;
	Thu,  5 Jun 2025 02:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088824; cv=none; b=U087xIRbRrJLfF1qDJLx4ftFBnhpYCmcZVKVP9Y5TNQgzyHaUWOIMZx8X8Zi7BrCCU4PwmVi5FT2pY5a2NQSzmDVojIJaonySE8emflC2x/9DR562k/FmL6Ph4hExeG/0zNtckL5i4UQ/FQcLUdXs3rdnXRzJVr6foQKuQGaDXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088824; c=relaxed/simple;
	bh=SsY4V+0EqON5Mu5iyCTybFqUbNp8xhclaSWdRVbv5jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UgsgeSobg77U2thDjIeX+hk6a50E5Fs6xTi/BL23EDFcQklTeT1EFS7GampMUkgFk2FqRbmYkYe3jTJCcS/wjLpzjYqJaoA3vbadNlmdF/1NrMAQddkXlqi3Zyb8Fjuc6HZyBD5Q64o+9k0Ip69ilaWPHHipFV4iUz+CsXI3rCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cdf716fe41b011f0b29709d653e92f7d-20250605
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:42cce35d-b191-4d52-8bd2-d3791e58895d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:40a90521bca85b4a2152347b6db4d582,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cdf716fe41b011f0b29709d653e92f7d-20250605
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 2077564834; Thu, 05 Jun 2025 10:00:07 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 2D31716001A00;
	Thu,  5 Jun 2025 10:00:07 +0800 (CST)
X-ns-mid: postfix-6840FA26-862248265
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id 8FE2816001CC7;
	Thu,  5 Jun 2025 02:00:05 +0000 (UTC)
Message-ID: <6399b093-f8ce-4dff-9cf8-f483d221d034@kylinos.cn>
Date: Thu, 5 Jun 2025 10:00:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASOC: rockchip: Use helper function
 devm_clk_get_enabled()
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1749006565.git.xiaopei01@kylinos.cn>
 <3b3d8f60e553af09a51b501b8ff5406fa5e898dd.1749006565.git.xiaopei01@kylinos.cn>
 <24654754.ouqheUzb2q@workhorse>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <24654754.ouqheUzb2q@workhorse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/6/5 01:42, Nicolas Frattaroli =E5=86=99=E9=81=93:
> On Wednesday, 4 June 2025 05:13:30 Central European Summer Time Pei Xia=
o wrote:
>> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prep=
ared
>> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now =
be
>> replaced by devm_clk_get_enabled() when driver enables the clocks for =
the
>> whole lifetime of the device. Moreover, it is no longer necessary to
>> unprepare and disable the clocks explicitly.
>>
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>  sound/soc/rockchip/rockchip_sai.c | 8 +-------
>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/ro=
ckchip_sai.c
>> index 79b04770da1c..2ec675708681 100644
>> --- a/sound/soc/rockchip/rockchip_sai.c
>> +++ b/sound/soc/rockchip/rockchip_sai.c
>> @@ -1448,16 +1448,12 @@ static int rockchip_sai_probe(struct platform_=
device *pdev)
>>  				     "Failed to get mclk\n");
>>  	}
>> =20
>> -	sai->hclk =3D devm_clk_get(&pdev->dev, "hclk");
>> +	sai->hclk =3D devm_clk_get_enabled(&pdev->dev, "hclk");
>>  	if (IS_ERR(sai->hclk)) {
>>  		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
>>  				     "Failed to get hclk\n");
>>  	}
>> =20
>> -	ret =3D clk_prepare_enable(sai->hclk);
>> -	if (ret)
>> -		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
>> -
>>  	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
>> =20
>>  	ret =3D rockchip_sai_init_dai(sai, res, &dai);
>> @@ -1512,8 +1508,6 @@ static int rockchip_sai_probe(struct platform_de=
vice *pdev)
>>  	if (pm_runtime_put(&pdev->dev))
>>  		rockchip_sai_runtime_suspend(&pdev->dev);
>>  err_disable_hclk:
>> -	clk_disable_unprepare(sai->hclk);
>> -
>>  	return ret;
>>  }
>> =20
>>
> Please get rid of the err_disable_hclk label, and change the
>
>     goto err_disable_hclk;
>
> in the resume failure condition to a=20
>
>     return ret;

ok,thanks!

> Other than that, patch tested to be working fine.
>
> Kind regards,
> Nicolas Frattaroli
>
>
