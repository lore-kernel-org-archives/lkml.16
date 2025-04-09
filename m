Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2057.outbound.protection.outlook.com [40.92.42.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38391624CC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744176889; cv=fail; b=Q9WckHvEoqOvLBdntpsFAj7IaEJMlqLdYiE66IqeQcEfTUC6TTdIA8lg/5RDzOG07BEaMIu7nD6Pv8ty6SNYqc0QExSVlJt/nw8RfzbDzd3S+f6hBCLzLb0Rr/yGtwZGy0BANTr2IDkJBZI85GZqhSfLDrB2cPFqHpGbKNAsyqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744176889; c=relaxed/simple;
	bh=1QFkqZQUYEbCFbPS/riNrwTPZF9DNf3dEvBztauYRMw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MKP9fcF2WDPUn1d1tX5lvvnkZjCWTGtIDyuiyumZta2OeG1ClfX6P7CatQB8geUBkem0Pd0jIh40DbOL96iC2pJDKIqTjjbZjcbAPnt4pCyrVhosmXXKnqKqDIXdOjqegIoVljfCUuEREJSoBkftfz4RIh5ixevF/Gjlz3orzmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=sEqNrV7E; arc=fail smtp.client-ip=40.92.42.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="sEqNrV7E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQyN0J1obPvoiUYooiINk0e0TigpJxYLoWdp/LgKzEOVZUBjWML46QbSMV2LOpRXAh23THMxCsVA/sKTws9EACkKe1rMfVqgEWCNeLvyaHxXt277xMlAEREd5DHA6dwex0e3XYnDf1TSGh+P2+VgwTIW8n4SJ145aVS1burG7DaBJSazBfVIgkpad/WOSH7pDwLD7NZcjHdvDCYfLbjVHoaHgxzbvfuScjXszT8hNpyVWRpyFPh18IJmLZH8eFFRN+9ePBK9dm2fxLS/XsxeNwgiQL11rYN0ZumhOiuOQTQfKTmPbGlx67itLHWuy06XwmL8JRuKiLKGg3yOxUmz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QFkqZQUYEbCFbPS/riNrwTPZF9DNf3dEvBztauYRMw=;
 b=S7R06+xMDzpW8fTwl6Bw+CScir2htBluTdljulnaOmlV/e5yYB48G0QVdw5UeUt2kr8FJMiz2NUsY3yuEdOREzQn3gz07HkWZJCsrUBKwz75ors2FQJI+UN5tIGnYjS8Ht4URXQURx1g9CGSjhQ/cHVtAfS/NB03pVHEh1SsDNLiOV9TGaR4lSdm8G63cqJVG0cSqloJbnKWTlRuvGDIxVNi9Olit8gWDzqw5Fuh1z+iw+d+8QKxiUGaPi+FLTEMrP2Rwdl0igrksT626WfEx7aaZ6YUivJtX2G06jVQxmBausBw5deiDm5Bk1pq00CLpDxPJRHeSBgl7GbBWCcIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QFkqZQUYEbCFbPS/riNrwTPZF9DNf3dEvBztauYRMw=;
 b=sEqNrV7EmnPghuqspLfIgd4Qr9q9z5p1ft5MokhdJwfW5kWGdjzeeoXT83Q2QL/Zm5O2B2apO7Spywans/01e6iB1Zxd2G40zRYHklY26Uxbvn0Ssf55vqOLapV0BjPI8DXHzRDSztWUSq5ahvOP4Ed9lBFZFKZHHMLs6PXoGdNLeLK098hs5jHVs756tfNy9HywNULRyiuhcotGoY7ArNXMYTAgZGKtwW4GROHPbNBpZvZp6+wat9M8CNvM8YBKIChga0p4efKakKZ8t302X7JEdONqRHDy+e9WBGOvbtHu0ml08CVTKtPkOHWx1UzmYqE7rwcFBBtf6qakukhGkg==
Received: from BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 by PH8PR12MB7159.namprd12.prod.outlook.com (2603:10b6:510:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 05:34:45 +0000
Received: from BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991]) by BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991%2]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 05:34:44 +0000
From: Stephen Eta Zhou <stephen.eta.zhou@outlook.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clocksource: timer-sp804: Fix read_current_timer()
 issue when clock source is not registered
Thread-Topic: [PATCH v2] clocksource: timer-sp804: Fix read_current_timer()
 issue when clock source is not registered
Thread-Index: AQHbqLderlCb5U/wyESgbrIohsfvhbOay5H9
Date: Wed, 9 Apr 2025 05:34:44 +0000
Message-ID:
 <BYAPR12MB3205003E2BD5B78ECBDD2CDFD5B42@BYAPR12MB3205.namprd12.prod.outlook.com>
References:
 <BYAPR12MB3205D7A2BAA2712C89E03C4FD5D42@BYAPR12MB3205.namprd12.prod.outlook.com>
 <BYAPR12MB320552F9F18EBC4F51E7213CD5B52@BYAPR12MB3205.namprd12.prod.outlook.com>
 <65bfb302-3e93-4d1f-a70c-66439cf5f122@kernel.org>
In-Reply-To: <65bfb302-3e93-4d1f-a70c-66439cf5f122@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3205:EE_|PH8PR12MB7159:EE_
x-ms-office365-filtering-correlation-id: 2a264c6e-3f1c-4fd5-ad5a-08dd77283bfd
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799003|8060799006|19110799003|8062599003|15080799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cpHdyRBaGRqBUKEV0fl61TooGY3HXm+ax6uyF5i92jxbQVUkyga+49m0L2?=
 =?iso-8859-1?Q?vgRahU/vnQpuvMkzYwtZ5ou2e4dhAnsIEFbBiLnu/XdPYQPCHv3IYSLJWg?=
 =?iso-8859-1?Q?BXo6MZ+iiJIsQgpDuudlaPVAMjMbnnaFB51CKCvZtutEfPrFReOdzZAUqo?=
 =?iso-8859-1?Q?TmM+dD0qyK50PXmUhwa9LHURpxBrBBJ1/PGOtuX7QfOM8zCsjsf0Y989O1?=
 =?iso-8859-1?Q?IctD/qbOEakZcnPGOm/yYkPLsPaSdKblwgotLvbU3o4GMzjJJnwaOhHZ6V?=
 =?iso-8859-1?Q?oIrkT1D5V/LcVyOjVBsZNeYNP+xKQY9t14QHhod9eGbfeIwJmw/RHHGxn+?=
 =?iso-8859-1?Q?L/IsMej+KE848MLI1couFtsZE4sMdsiO5xhVokPaKwXldQuYDxyDlGnJbF?=
 =?iso-8859-1?Q?UwoPy4ncpdYmsY67YqqDabVuVx2+pWJQaJnlrNEnNG5MbvprzZY2iZvhTR?=
 =?iso-8859-1?Q?L7AStjV9L7Q07spip1U8lWZYdllMfx9kjkgiOQQ9Kcg7yTNUVePJ7mwpBr?=
 =?iso-8859-1?Q?yGL59FtZnDmiE34vbcjDdALjE8Mnvw3P1/HayaIqZ8VCXiUdTiGHu5K3Pb?=
 =?iso-8859-1?Q?2utwJ3PEPQVCvqjagkT8mR5DVEf/syAGTLj+wfc9Yd17EaLC40BWLYehmb?=
 =?iso-8859-1?Q?Sn9smK4UR1BGOvk1OKTifSz3082Nh9LE3c9Vl2AaYzc4Y0sIf8d+Kge3Ki?=
 =?iso-8859-1?Q?8N6/Mx3iPXLJQSs7ND8Ne975aBVt980uOlm9xIEUEH8xfZqkmYwTetpPCy?=
 =?iso-8859-1?Q?lq1PxC8HwRYDF0Ra1dm41575T8b4nw8h1TgsoBJ1v9rQfwsotgoTSl9kWI?=
 =?iso-8859-1?Q?JCfWESEICmcZBNKOE3lz+SASlSGPscNfcr8mVYeF7PZGav1c+uoDnM/8LP?=
 =?iso-8859-1?Q?loZ341eyi8XKJjyI29/nT1hPpCbNE7OppBeYxREMcDcrpTo6jWFxSNjkv1?=
 =?iso-8859-1?Q?I+wPz51Cmk/U4TYYYNQoJvranSGRNTYDlx4xHd2wOb93gDc/ton3v/MBG9?=
 =?iso-8859-1?Q?Cg51KBjNI3BkEoxDzl7KuErlw3cKc1FWx5dPzBZxzXsQUi+g486fZW8XMQ?=
 =?iso-8859-1?Q?zv53Qwhy/KJwdhM7Q0BkGYCOnd4xEzmGYLjrYM/I9eob1B2LG926eAvmAj?=
 =?iso-8859-1?Q?ftNm4iuzxgUj1xHAymj82j3lZlmW4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VwtkpvewAGkoht2r9NAL16z90i1n6lAazOin2JBrTtPI7MOhklwUNo2232?=
 =?iso-8859-1?Q?3PR7ToiILOgLdQna/Szi36qnvvAZzkOUqbQA7qghmHgxXgAOeNj2FW3Gp9?=
 =?iso-8859-1?Q?ot/+YM5gDfnNJNRqYsvLvPbWXRnEVVh8v7fFez3uILGn0rxdyE2kHIMJ0q?=
 =?iso-8859-1?Q?0QA7DkLGjAffHVc/WYMT0iY52wGRkRZxA/fUc85r4KjK+HSvoS8Zz9TJ4w?=
 =?iso-8859-1?Q?yyuH4wmgOTcMlPUWQCzc+8TnRab7mn+KRB8ysEAzOawRT66Jia+TlQ1FTC?=
 =?iso-8859-1?Q?JU2J+ZhPhQ51Dlazq4+sgAUMOucRDXWIAJie7g91cgyRauhF24Oo2545h1?=
 =?iso-8859-1?Q?CdwAV7A9SPzXPCuwi3ijB79DJJEaMthIY7/seS+AscxNpy5vEt0I+yHcWn?=
 =?iso-8859-1?Q?mmIhP2n7nv66ZNgziBInr134NHL/pN1KdsDZ4MRiyTKC7wH05j02DCOkJd?=
 =?iso-8859-1?Q?S7ePPH2ay8gA2wfI28G3b/W7uig/sMbtEqPhM/X1eBNIi/ppqCLcBzXFDX?=
 =?iso-8859-1?Q?YF2oExRed//eNMeaVj4YxKjZJf2M9OVrqJb6mDi1lq99tKGa8T7Hq0zxfu?=
 =?iso-8859-1?Q?LWxgJC+0UtvH1jnclWUbEq5k/V7YGQzFG9SytuO8porncDZ0UBZvdyx21g?=
 =?iso-8859-1?Q?xFwLB46YsBl4mzqKvBQtamw+Lv7gJdcGxwivkfuzDQSc1ef7XDMDUl1AwU?=
 =?iso-8859-1?Q?92ZYD8sQSI0FKMUZpvGq7ad2+oTV8eajN+aHTim5KCPPHUldEfDUK/qPK3?=
 =?iso-8859-1?Q?0JgbjYsNreROEfXxdWj0Ij41VWfQjhNqQQrZ+XonmTIz7E+PC7ZTDeMq0C?=
 =?iso-8859-1?Q?4hQ6kqf2B2nat4cySg/th+fVt0y/H0KodlIuFlQDLfpEGP4QDKAoLtrHrm?=
 =?iso-8859-1?Q?dOJFbTre/wDzYWH1Ga0lXcsdtMMQYYrwSoUpgY+2/3P5xgI+tb4mQJ3u0X?=
 =?iso-8859-1?Q?2rqJjh77dsohxeGgeAM6rtpL0ydU+FxlbhVeWuS/PmW2wyAWE3jGr9eWUW?=
 =?iso-8859-1?Q?I/+WdEKtYYuwvsxIudm4Tj4InSbrYwG/KO06jk54VNfEbvRi5j+o7XwV4f?=
 =?iso-8859-1?Q?fsafWVmYVSlUGWTOzbH5Kc1s5PfBZ9+ePrcQhM8TRlE2Rrbl0xzh9jL9Sy?=
 =?iso-8859-1?Q?HtA6vbphlwAqCnYD3/h7QH1LLU5pkEyfdhqTgFY/mFTp14CZfseu9V4REl?=
 =?iso-8859-1?Q?JKDPijc5fR7p1YdjDzp48RPItkfS6OEQGJaynBExlznt9gvKwSem7CSb4J?=
 =?iso-8859-1?Q?tRI6VwPhKyI9j3AcZNmGk/o6z2qwdK5PzGlwpBYwQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3205.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a264c6e-3f1c-4fd5-ad5a-08dd77283bfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 05:34:44.4876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7159

On 08/04/2025 20:52, Krzysztof Kozlowski wrote:=0A=
> It does not look like patch at all - it has duplicated From and Subject.=
=0A=
> Please read submitting patches. The patch fails this in multiple places.=
=0A=
>=0A=
> What's more the actual patch is corrupted, so could not be even applied.=
=0A=
> You can try by yourself to apply it and see.=0A=
> =0A=
> Anyway, follow closely submitting patches.=0A=
> =0A=
> About the actual problem: I don't understand how commit msg is related=0A=
> to it.=0A=
=0A=
Hi Krzysztof,=0A=
=0A=
Thanks for the review.=0A=
=0A=
I will revise this patch and send an updated version.=0A=
=0A=
Best regards,=0A=
Stephen=
