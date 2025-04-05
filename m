Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93542576
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863326; cv=none; b=tNS6BJN1Nni4i7f6KQhtFXprumUBvnMKOJA8xDS0/VM65Wny6NC5fEW9WHV8kHCbduYna1xkpMyeB7Qo2brory0YronNsNxYAGRnvkeKgauJb9+trOZiLBoI+3+et5RSkSvEsKwLat2yqVrPz3T14n0wWm9FRTexUWZ2yjHalJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863326; c=relaxed/simple;
	bh=s7/cJNmm+2NmqLkSz3SjmhLIehPf9JyMBVsRjXT+41U=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=jUwCjD0ASuJDTfVQfUs3famYXxx4fcsRfT5nJlmusjVtWXUFj/ecuuGnTe2FRgocIzANykvtIEd67VNbGqTQ+kY+WAtVCWKPKb7t5rPjI4TYMxhzZHngTE3WN1Grg4x8XAt07k6ijqOQIpfGVV2kay5QWvIOPPuhbIwfk1Nr+MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=XBMTTHWB; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="XBMTTHWB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=content-transfer-encoding:from:mime-version:subject:date:
   message-id:references:cc:in-reply-to:to;
  bh=rAnRKWYqjI/iF90KH/8ta6DJgK2orXELRXpPhPkXWYI=;
  b=XBMTTHWBVwZbRE97F/N02k83BRYGbVUK+WjOz3Q38Wp6pjON1aPFo29H
   9/X2r6epsGslx5WG0SwO5yVV/2PLTpKfqUwQp86vVUX7stRL2LWbsn6gV
   vQuhkj/7uZrhGioLWRCYvWy5kMEqCu7n/peCByZ/Apj0laTD2YKGY5xPX
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,191,1739833200"; 
   d="scan'208";a="113533554"
Received: from 193.164.185.81.rev.sfr.net (HELO smtpclient.apple) ([81.185.164.193])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 16:28:40 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable initialization in rtl8723b_hal_init.c
Date: Sat, 5 Apr 2025 10:28:27 -0400
Message-Id: <F6AA5BB6-46A1-457C-BB99-D26D3744738F@inria.fr>
References: <8ce041b2-087c-4d47-891f-28ecc0c91c76@stanley.mountain>
Cc: Erick Karanja <karanja99erick@gmail.com>, gregkh@linuxfoundation.org,
 outreachy@lists.linux.dev, philipp.g.hortmann@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <8ce041b2-087c-4d47-891f-28ecc0c91c76@stanley.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: iPhone Mail (22C152)


> On 5 Apr 2025, at 10:19, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>=20
> =EF=BB=BFOn Sat, Apr 05, 2025 at 06:14:48AM +0300, Erick Karanja wrote:
>> Optimize variable initialization by integrating the initialization
>> directly into the variable declaration in cases where the initialization
>> is simple and doesn't depend on other variables or complex expressions.
>> This makes the code more concise and readable.
>>=20
>> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
>> ---
>> .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++-------------
>> 1 file changed, 41 insertions(+), 114 deletions(-)
>>=20
>> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/=
staging/rtl8723bs/hal/rtl8723b_hal_init.c
>> index e15ec6452fd0..1e980b291e90 100644
>> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>> @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter *padapter, void *=
buffer, u32 size)
>> void _8051Reset8723(struct adapter *padapter)
>> {
>>    u8 cpu_rst;
>> -    u8 io_rst;
>> +    u8 io_rst =3D rtw_read8(padapter, REG_RSV_CTRL + 1);
>>=20
>>=20
>>    /*  Reset 8051(WLMCU) IO wrapper */
>>    /*  0x1c[8] =3D 0 */
>>    /*  Suggested by Isaac@SD1 and Gimmy@SD1, coding by Lucas@20130624 */
>> -    io_rst =3D rtw_read8(padapter, REG_RSV_CTRL+1);
>>    io_rst &=3D ~BIT(0);
>>    rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
>=20
> I hate this.  It's a bad idea to put "code" in the declaration block.

Erick, you can look around in the output of the semantic patch and see if al=
l of the ones with function calls are undesirable. If that=E2=80=99s the cas=
e you can post to the outreachy mailing list a revised semantic patch that d=
oesn=E2=80=99t report on that case.

Julia

>> @@ -501,8 +499,7 @@ void Hal_GetEfuseDefinition(
>>    switch (type) {
>>    case TYPE_EFUSE_MAX_SECTION:
>>        {
>> -            u8 *pMax_section;
>> -            pMax_section =3D pOut;
>> +            u8 *pMax_section =3D pOut;
>=20
> This is fine because "pOut" is a variable.  It doesn't have side effects
> and it's not "code" in that sense.
>=20
> regards,
> dan carpenter
>=20
>=20

