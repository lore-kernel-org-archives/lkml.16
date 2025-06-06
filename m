Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4A523A6;
	Fri,  6 Jun 2025 03:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749180450; cv=none; b=W5KSJ8wA+OFShKDg0IHv7cqMsE4cSglQK0ntxlhkEkplNyMV6X/jAKTRIuzb7TI0Jyl0t4a2CvLYFOyMvQs2MrsS3IHaZwdeRkxwSK7dEaeQcf1jwLGNQBMs524apmqUiovWMuYSZzz00NU8IFFCUMIaZfyamLzw6tVMQtPjc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749180450; c=relaxed/simple;
	bh=j11qS+3iZ3c1Kqt5nLnoCEYCTM05m7hNK64pUTMgBXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KKrBw8dJcf0tXkYDk51U6lhUdBgu4UvZwwXD4qDijvCTTdKhl7vPikRQiBzEnsgwi+ZFvJrh0c6QOnc6Zum++uda4WlNWAMGeyWFV7P2/Xiv+wrwQuDXwhTOoNrqImaWqLV1lpfwQZ+siiNx+rbb2zENYl8m6MMJ1FEXx3PibG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 24be5cc4428611f0b29709d653e92f7d-20250606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:b5740708-e9d2-4d9f-87c8-2456abc1d479,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:bf5a24c28619cba9b3ca4c7f565fe913,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 24be5cc4428611f0b29709d653e92f7d-20250606
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 163200506; Fri, 06 Jun 2025 11:27:15 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 93A3416001A01;
	Fri,  6 Jun 2025 11:27:15 +0800 (CST)
X-ns-mid: postfix-68426013-513704641
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id 00CC516001CC7;
	Fri,  6 Jun 2025 03:27:13 +0000 (UTC)
Message-ID: <3f589ddf-e421-494f-85e5-1adebd19d03a@kylinos.cn>
Date: Fri, 6 Jun 2025 11:27:13 +0800
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
May I ask, could we use the=C2=A0dev_err_probe=C2=A0function instead?

return dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");


@@ -1441,28 +1441,22 @@ static int rockchip_sai_probe(struct platform_dev=
ice *pdev)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Faile=
d to get mclk\n");
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sai->hclk =3D devm_clk_get(&pdev->d=
ev, "hclk");
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sai->hclk =3D devm_clk_get_enabled(=
&pdev->dev, "hclk");
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(sai->hclk)) {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Faile=
d to get hclk\n");
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D clk_prepare_enable(sai->hcl=
k);
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk=
\n");
-
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_read(sai->regmap, SAI_V=
ERSION, &sai->version);
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D rockchip_sai_init_dai(=
sai, res, &dai);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dev_err(&pdev->dev, "Failed to initialize DAI: %d\n", ret);
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto err_disable_hclk;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return dev_err_probe(&pdev->dev, ret, "Failed to initialize =
DAI\n");
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D rockchip_sai_parse_pat=
hs(sai, node);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dev_err(&pdev->dev, "Failed to parse paths: %d\n", ret);
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto err_disable_hclk;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return dev_err_probe(&pdev->dev, ret, "Failed to parse paths=
\n");
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
@@ -1475,8 +1469,7 @@ static int rockchip_sai_probe(struct platform_devic=
e *pdev)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_get_noresume(&pdev-=
>dev);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D rockchip_sai_runtime_r=
esume(&pdev->dev);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dev_err(&pdev->dev, "Failed to resume device: %pe\n", ERR_PT=
R(ret));
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto err_disable_hclk;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return dev_err_probe(&pdev->dev, ret, "Failed to resume devi=
ce\n");
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D devm_snd_dmaengine_pcm=
_register(&pdev->dev, NULL, 0);
@@ -1504,8 +1497,6 @@ static int rockchip_sai_probe(struct platform_devic=
e *pdev)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If we're !CONFIG_PM, we get=
 -ENOSYS and disable manually */
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pm_runtime_put(&pdev->dev)=
)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 rockchip_sai_runtime_suspend(&pdev->dev);
-err_disable_hclk:
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(sai->hclk);
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
=C2=A0}

thanks!

Pei.

> Other than that, patch tested to be working fine.
>
> Kind regards,
> Nicolas Frattaroli
>
>
