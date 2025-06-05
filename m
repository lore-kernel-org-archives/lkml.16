Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151AF3FB31;
	Thu,  5 Jun 2025 01:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088688; cv=none; b=DVvEXKgVHE6T2KDo3ZjO7/XR0cd0XSyxu1+cNkVoe+j4dn+euFzSRi4eqJ3u9eqsa8pk15TmB08oUD+IVdGBfV6kVglYRvNfrmpmOPtewS1MQhlyZtQbvErwkfouWN+7O1N0qJQB7FO+nubhwuslCtbb4OqRFBewr7Z8JM7Il8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088688; c=relaxed/simple;
	bh=czbs0CMUJecgt7puMJk/u5v90WUDmuXrW/b8pPHegAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SAeOeoJO3TG6hGdwnwon0xIOAolMJRfGmcFQtutVi6foXWkA+QqUXnYx564V89ImlV/dDK80pFvkZo9yO6CcJ6ozix1yKTT3DNgwOVgdRsffS0wzknVGdk/xRvkjUBFSe48bMTi0STwf7K4O9/WSrZv3gBDGdGmB32A3caGmXu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7f6d354041b011f0b29709d653e92f7d-20250605
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:fd0b5c91-f519-4ec9-892f-9d599c009841,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:fdcaecf91da6615da2a4ee37ccdfa291,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7f6d354041b011f0b29709d653e92f7d-20250605
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1383227863; Thu, 05 Jun 2025 09:57:55 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 729B216001A00;
	Thu,  5 Jun 2025 09:57:55 +0800 (CST)
X-ns-mid: postfix-6840F9A3-383599263
Received: from [10.42.13.56] (unknown [10.42.13.56])
	by node4.com.cn (NSMail) with ESMTPA id 08FBB16001CC7;
	Thu,  5 Jun 2025 01:57:54 +0000 (UTC)
Message-ID: <3f668462-ac5f-49fa-bd9d-140d32fc9627@kylinos.cn>
Date: Thu, 5 Jun 2025 09:57:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASOC: rochchip: Simplify the condition logic in
 rockchip_sai_xfer_stop
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1749006565.git.xiaopei01@kylinos.cn>
 <81c7955216f5cc7565a396e50e5474ec8f6e3017.1749006565.git.xiaopei01@kylinos.cn>
 <5104592.0VBMTVartN@workhorse>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <5104592.0VBMTVartN@workhorse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/6/5 01:23, Nicolas Frattaroli =E5=86=99=E9=81=93:
> On Wednesday, 4 June 2025 05:13:29 Central European Summer Time Pei Xia=
o wrote:
>> cocci warning:
>> ./sound/soc/rockchip/rockchip_sai.c:387:8-10:
>> 	WARNING: possible condition with no effect (if =3D=3D else)
>>
>> Simplify the condition logic in rockchip_sai_xfer_stop() by removing t=
he
>> redundant SNDRV_PCM_STREAM_PLAYBACK branch. The modified logic now:
>> 1. For stream < 0: handles both playback and capture
>> 2. For all other cases (both PLAYBACK and CAPTURE):
>>    sets playback =3D true and capture =3D false
>>
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>  sound/soc/rockchip/rockchip_sai.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/ro=
ckchip_sai.c
>> index 602f1ddfad00..79b04770da1c 100644
>> --- a/sound/soc/rockchip/rockchip_sai.c
>> +++ b/sound/soc/rockchip/rockchip_sai.c
>> @@ -384,9 +384,6 @@ static void rockchip_sai_xfer_stop(struct rk_sai_d=
ev *sai, int stream)
>>  	if (stream < 0) {
>>  		playback =3D true;
>>  		capture =3D true;
>> -	} else if (stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>> -		playback =3D true;
>> -		capture =3D false;
>>  	} else {
>>  		playback =3D true;
>>  		capture =3D false;
>>
> You can probably get rid of the locals playback and capture altogether:
>
>     static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stre=
am)
>     {
>         unsigned int msk, val, clr;
>
>         msk =3D SAI_XFER_TXS_MASK;
>         val =3D SAI_XFER_TXS_DIS;
>         clr =3D SAI_CLR_TXC;
>        =20
>         if (stream < 0) {
>             msk |=3D SAI_XFER_RXS_MASK;
>             val |=3D SAI_XFER_RXS_DIS;
>             clr |=3D SAI_CLR_RXC;
>         }
>
>         regmap_update_bits(sai->regmap, SAI_XFER, msk, val);
>         rockchip_sai_poll_stream_idle(sai, true, stream < 0);
>
>         rockchip_sai_clear(sai, clr);
>     }
>
> but this in general makes me suspicious of the intent of the code in
> the first place. Playback always being true and capture only being
> true if playback is also true seems odd. Checking the callsites of

Yes,it's very odd to me too.So I send this patch to ask for your advice.

> this function confirms my suspicions that while this fixes the cocci
> warning, it just means the code is now intentionally broken.
>
> This here may be closer to the original intent:
>
>     static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stre=
am)
>     {
>             unsigned int msk =3D 0, val =3D 0, clr =3D 0;
>             bool capture =3D stream =3D=3D SNDRV_PCM_STREAM_CAPTURE || =
stream < 0;
>             /* could be <=3D 0 but we don't want to depend on enum valu=
es */
>             bool playback =3D stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK |=
| stream < 0;


bool invalid =3D=C2=A0 stream < 0;=C2=A0

bool capture =3D=C2=A0 stream =3D=3D SNDRV_PCM_STREAM_CAPTURE || invalid;=
=C2=A0

bool playback =3D stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK || invalid;

Would this modification be acceptable?=C2=A0

It could shorten each line since the stream value only needs to be evalua=
ted once.

>             if (playback) {
>                     msk |=3D SAI_XFER_TXS_MASK;
>                     val |=3D SAI_XFER_TXS_DIS;
>                     clr |=3D SAI_CLR_TXC;
>             }
>
>             if (capture) {
>                     msk |=3D SAI_XFER_RXS_MASK;
>                     val |=3D SAI_XFER_RXS_DIS;
>                     clr |=3D SAI_CLR_RXC;
>             }
>
>             regmap_update_bits(sai->regmap, SAI_XFER, msk, val);
>             rockchip_sai_poll_stream_idle(sai, playback, capture);
>
>             rockchip_sai_clear(sai, clr);
>     }
>
>
> Please let me know whether this looks right to you.

thanks=EF=BC=81

Pei.

> Kind regards,
> Nicolas Frattaroli
>
>
