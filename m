Received: from cu-ua11p00im-quki07173001.ua.silu.net (cu-ua11p00im-quki07173001.ua.silu.net [123.126.78.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007A1CB9F0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.126.78.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902686; cv=none; b=MPNMo2FJmHg83DhDJXMBUljm0hiHS4NW7jgiWh+ezEiQy01fHmh2TyDz9tGRgweQm/Gp2nIha3iU1LwQj3iPYHIcfpqUrMtn9hUuKrXTvxlJ/AsUNCDU/IIgSuVHyW49/5BkLtTQI4zOiIXSk5lZ4fyk7vOAzC+5bIb3hD9oyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902686; c=relaxed/simple;
	bh=3gBks0IDv5+bQ7f9oySXgiMRXgK7dls0NUMSTEFmLW4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=EqK3AVN/X45FQwoF7XBON7ubGUQ5e9SNTBYXFYJ79PxgGl8/PTOBEec15Av/B2apaxVC87rag7y70Bg9cI+3uGSSPJ/VajfOCygmQECxO+ovtg7GaXO7UoJjuIHc+rT5M9jIOMMMI5GcIsPIgZnO8U11qzpD4GkPOy1PyXrHhpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=Ts9eJT5Y; arc=none smtp.client-ip=123.126.78.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Ts9eJT5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1ca1ba; t=1744902682;
	bh=tbzU7uQeRtoWWJcQEx8UqorAm9YLdvKxFVfT04Erd6A=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To;
	b=Ts9eJT5Y9yksFWLCRM2LNqqUoUaXXLs1Ys4JSc2+W8F2cSFDng9y0keiiqcn00IF4
	 j2b7BDJjIYQ6LUvPmmAVSZIRk9kKHcFusvgSDVC5JPvqOFqAWn3DKSuNTsW2mKMZzZ
	 QyVwm/A+C8qvd6SauJU3YnUugJpLZlg8oZxF48x3dvO5U3sb1/0EVPZIwqNNIfiFK4
	 LkqHbZHPjensMtlthMMFUE0Vn//+tTCsQR0mGswwCwKAU6i10Pif12aCqNYXP0d6PJ
	 fvFMwNT2G8NUr0WecDGo1mZjsVSDJh5ymP5YNOsjDmPiSvR4kHYf+qkgOoLTSKdjzO
	 yu2EHq/sjmzQA==
Received: from smtpclient.apple (ua11p00im-asmtpcmvip.ua.silu.net [112.19.242.76])
	by ua11p00im-quki07173001.ua.silu.net (Postfix) with ESMTPSA id 825B79A00D7;
	Thu, 17 Apr 2025 15:11:21 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: huzijun <zijun_hu@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 1/3] configfs: Delete semicolon from macro type_print() definition
Date: Thu, 17 Apr 2025 23:11:10 +0800
Message-Id: <CDCE55D6-2296-4B36-9A65-369EC13492DC@icloud.com>
References: <aAEXAL3ypUn4G/oe@gmail.com>
Cc: Joel Becker <jlbec@evilplan.org>,
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <aAEXAL3ypUn4G/oe@gmail.com>
To: Breno Leitao <leitao@debian.org>
X-Mailer: iPad Mail (22D72)
X-Proofpoint-ORIG-GUID: Wbdowg9GmiZn-x5PaAjozZtqabDaIoQF
X-Proofpoint-GUID: Wbdowg9GmiZn-x5PaAjozZtqabDaIoQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2504170089


> =E5=9C=A8 2025=E5=B9=B44=E6=9C=8817=E6=97=A5=EF=BC=8C22:58=EF=BC=8CBreno L=
eitao <leitao@debian.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> =EF=BB=BFOn Tue, Apr 15, 2025 at 08:34:25PM +0800, Zijun Hu wrote:
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>=20
>> Macro type_print() definition ends with semicolon, so will cause
>> the subsequent macro invocations end with two semicolons.
>>=20
>> Fix by deleting the semicolon from the macro definition.
>>=20
>> Reviewed-by: Joel Becker <jlbec@evilplan.org>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>> ---
>> fs/configfs/dir.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
>> index 7d10278db30d667d0ef7e1140e54961c5a440c41..0a011bdad98c492227859ff32=
8d61aeed2071e24 100644
>> --- a/fs/configfs/dir.c
>> +++ b/fs/configfs/dir.c
>> @@ -970,7 +970,7 @@ static void configfs_dump_one(struct configfs_dirent *=
sd, int level)
>> {
>>    pr_info("%*s\"%s\":\n", level, " ", configfs_get_name(sd));
>>=20
>> -#define type_print(_type) if (sd->s_type & _type) pr_info("%*s %s\n", le=
vel, " ", #_type);
>> +#define type_print(_type) if (sd->s_type & _type) pr_info("%*s %s\n", le=
vel, " ", #_type)
>>    type_print(CONFIGFS_ROOT);
>>    type_print(CONFIGFS_DIR);
>>    type_print(CONFIGFS_ITEM_ATTR);
>=20
> As I've asked in V1. Is this macro being used?
>=20
yes. it is being used by those 3 statements which follows the macro definiti=
on (^^)
> --breno
