Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012059.outbound.protection.outlook.com [52.103.2.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA351FECD2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095615; cv=fail; b=LJgUZI3Zp8aUVWBeYf73G8bNFpu16jK3sLeZ+Q+YoBDwsfEdIYPv+y/40YmgrmP0P1PH+Jm6r8AsNHi5tQrfb5R+3QBDbkdfymqMjHB3srMXIt7frBuhacPaTPsU1D0exgyiSgKnv5iRLpix+D44iniXrmeE07t4amkhkP0SxPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095615; c=relaxed/simple;
	bh=jhl4EUoQZtZJDjoLJaGWvvaRCWMVHDo6aLXpxJ0uGwA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cfd94Jas9q1F+DHP78Kz4indisNoDj0lHn3C70harEiXAL6lX2ZVc2fnP93ak9soesKgXFlqY2+0Hr+Vs7ekMXOOEdvNgyBYtA4oW1+IOhJG4om55y5cvfCdn/RryJtQci8luO8Zx1ecMKCwc4tBaTfTiar1IVWVn2E1mrZzDO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DndQEzch; arc=fail smtp.client-ip=52.103.2.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="DndQEzch"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seBU+wqzmRuCRhjJDihlJDJN/H+Snt7y1ZormlaKPL3bwA/SX8vVMo5P/eMSWO0uNypiSHrwRISzBxIR9i1X6XZiXSNYEU/5qGw985k3w1O4P3c5cjnLAW2jsnIiFjaQky9qNKnRttS7o1yz1AnJsyCRt4UOW9ODhe8LZ4jHJLyG6F34QiH+xvxStWYMcbvkrhwSEfHsJ/o0YxligbcyqOfwHnjAisaITQ3sj0nA2/FobsTrHKJr+L1DhXf6STkBxFqsgPeMk/jpYTZCu5c5HPBIDU0ojIKMqJ2sgxz4y+gg6zcwYH2olFjwX7FdCG7VBGcW59kqLekH1DO+Rwqhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhl4EUoQZtZJDjoLJaGWvvaRCWMVHDo6aLXpxJ0uGwA=;
 b=VRjPAwZmsxIvkip0OIc9Eh43GpGfCLIclWA++idoEJHa+gL1OFmSqXQsRd+HwQ6S07VvplWtuQQDfE2jii7AmkfodL8DI/EJsFee+0YLcq+yGLRwk8yIJ71nHmnRXKdvb3Z6kwrhv4s6ojDyrIywkzK5WfJq5RjbI7AzSl7JJLM84/vxqrL5Ls4MHhtYbP525xzoItS7vh8A+uiGwXAGrnSqB0sLyJnAq3WBtkxpfuCBNNCE7w+wHp7ldLKzS7yhs0CF0zl2oTFzIyga8Ki/qc/4RjEzyYv6LhVE88VpMycPQvs7HtitQKIgkEV229Pl3R3YWd/OTs/O5nOOoBiRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhl4EUoQZtZJDjoLJaGWvvaRCWMVHDo6aLXpxJ0uGwA=;
 b=DndQEzchfTRqIjallRvMi396sdniOe1WNQUF4Copj5DkZ2/RN1zWGF6vRjwMV7Ns9XMfPB3vc2hHusvNsY1AeWW7yFRa967Ia+tRMfs78EdhV8saOpacD5mvt8uul8YJsq7yfBM7krZ65QZJXhOrn1BrLY3jh2GjlqSPhRf7cONQNCNLRDwJ5LXI1rdaehQ/J6jKl6P7vRkreUEhD3EW62DejutfkJ1/Ll5D8V8DJf+ugGIUMFn1S+HefEbZh8Ea2dquEx8XBTQIiMU/p1o3XypJvLme5bsS2OOo9/5cj5mnkmOpWHpR2Rv9CZz4JWX6jftyWDGDw+klXEDwL6eNGQ==
Received: from BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 by MW4PR12MB7189.namprd12.prod.outlook.com (2603:10b6:303:224::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Tue, 8 Apr
 2025 07:00:11 +0000
Received: from BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991]) by BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 07:00:11 +0000
From: Stephen Eta Zhou <stephen.eta.zhou@outlook.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clocksource: timer-sp804: Fix read_current_timer()
 issue when  clock source is not registered
Thread-Topic: [PATCH v2] clocksource: timer-sp804: Fix read_current_timer()
 issue when  clock source is not registered
Thread-Index: AQHbkClqcnxwzclP6UmD+SrywxDJLrOZgO9/
Date: Tue, 8 Apr 2025 07:00:11 +0000
Message-ID:
 <BYAPR12MB320552F9F18EBC4F51E7213CD5B52@BYAPR12MB3205.namprd12.prod.outlook.com>
References:
 <BYAPR12MB3205D7A2BAA2712C89E03C4FD5D42@BYAPR12MB3205.namprd12.prod.outlook.com>
In-Reply-To:
 <BYAPR12MB3205D7A2BAA2712C89E03C4FD5D42@BYAPR12MB3205.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3205:EE_|MW4PR12MB7189:EE_
x-ms-office365-filtering-correlation-id: 8a0f2f3f-79ea-4b9c-95f8-08dd766b015d
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799006|8062599003|15080799006|19110799003|15030799003|102099032|3412199025|440099028|12091999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VaSoYgfqIh3XCz5UUmzHcWgrbyrXl+0YX9E8Fjadf9vSBGzXY199D3yFNj?=
 =?iso-8859-1?Q?wzTc4DxgJm7M0UIyWOjukl8hpiqYXRRPcyrCFtUdfikIBxQRHTdR0s/8QW?=
 =?iso-8859-1?Q?Al1sgxA2zlcd7I2qDArN06Ariq+/2PNonBXqCxpn2NxXgjXx9TXYtQ9i5E?=
 =?iso-8859-1?Q?ASivF9B1cVtmKGzEa/JQhcdG9WoIIvqsuVeaA/qeYwrAp9B+g52VqBk+ks?=
 =?iso-8859-1?Q?bMvEWlosHooQWqBa3q3rxrHD8qtMivGnnPlLM3FFKfkMPb3emyV3F0MONy?=
 =?iso-8859-1?Q?0LHL5NVKCWuZDBpuKev3ucYgbCqYZfGg7ve1eWLggEIn+XPFC1oty6zMKa?=
 =?iso-8859-1?Q?DHsI7XznCDTjHGX/rbx5aNcy362gsl8YRsHEAEkRHlftpKiy3vaSc3OKte?=
 =?iso-8859-1?Q?wrLVdPImIjOCPKa3+Npd8zIj++0jJfwlauBjgh7qCFuLKy8LH+aqUD30kP?=
 =?iso-8859-1?Q?1/NOCFyRzIRWO/xUAMRbe0GM1MCuQDLl6Bk/BeztiCAWx4iJ/7FA67dWUv?=
 =?iso-8859-1?Q?BNL+YKnGiSUDd8jfDTdfptq/T50GV26Pm+0wC+WkxYyYEif9dtjm9zRRXg?=
 =?iso-8859-1?Q?JmZevlaBbRy+Z98XLJ53SY+HXAUcFNAYlIIXkbJdqmCTo84wLkNntduuBR?=
 =?iso-8859-1?Q?a59CsQQUKSPKIMbuG1MkZuwMpmjB/JPwHigirWHNDMlbz/Jr567CLIapwu?=
 =?iso-8859-1?Q?FgzlluV/E3OQQin6b2uRBZHMPArz0uHcVXSUlbSTl4J5g/wRLredBWhtMT?=
 =?iso-8859-1?Q?pui8NrZhbpwvTM6lw4cmhvHCkRSKngyHVs1WZhV1+HQjLbJ1HoiRRnHLby?=
 =?iso-8859-1?Q?6PKN/VvYbrffGVbdSZ5/p/obN2/oJ3MyuNgWfhxt5vWR17627jvvRMb+zO?=
 =?iso-8859-1?Q?pzZ2W/NgsiJkyCZzpoQnq9QJQzsG8vxqL0xIgoC2AkUprD1lz7kR46v6AN?=
 =?iso-8859-1?Q?NNMhdMFB+WPCxrYUjb5T0KDYjMQ6kJA9oh+yDumVzR+oCba1no0leR27ur?=
 =?iso-8859-1?Q?Hzl8xQ1SN18i3ZKF7WzddDJXbhnThaEPll+2tIOr9HSsPGYmokDhpz+poD?=
 =?iso-8859-1?Q?LLQ8IWTFXYeORn05G1PERfT0aNtiMTRjzka6PKyWkPgP/Q3q8cQ+t5TnJP?=
 =?iso-8859-1?Q?6X2FzzIbQvjaCLdRpvxfeX1SIoqP8pX/kahbrYFN5ULChq0RQx1AFZV1YL?=
 =?iso-8859-1?Q?pEOijE1KxCw5/g=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QW6p4YuMbmrNixEMQsW4JNVoLCsIeYzdLuyMmhNqEo+MrEk3ocZ2x+zavy?=
 =?iso-8859-1?Q?EfmUHLMsELI5VKAhgH0pUvT3A0EJ5W9uiU3r8XLER9d6lpMyTfyVJLjWkq?=
 =?iso-8859-1?Q?CQt6ooPiWiakqDsARA9vg9eUCOkDDslsAp4Z72RYNAr6Jv/lMS1nUr1zwQ?=
 =?iso-8859-1?Q?TkFktw8+Osaby56I0KnbgnCtMQQncYvy8C0J4/M+fqiYWOFr4b0FNpn4Zb?=
 =?iso-8859-1?Q?pjaLLZZg7opmOBgFGwsOe9vLRg+UVWBqEfVUDC20f/1X4rudEAl6mmZu7w?=
 =?iso-8859-1?Q?4ztVTUdzSi1NqgeeuonEL3AqSHLaECfViOuQLkXRROtXxjxKTr12k0rRGy?=
 =?iso-8859-1?Q?LUEqsgtp21TX1R7MQxuQ4wtAT+4e6LH5TzF5bI0cmsH6pFXVyEJnRix11E?=
 =?iso-8859-1?Q?tpvsJ2Od7+wezFzY7P+R6qcE17gNBGmPHS/LVQQSQ6FVu5mGp3+ARMqkt/?=
 =?iso-8859-1?Q?JTCMEc/6WNUfzFQuuNA0Xy7PL3BdeS0KQr60blM0nX62Cy5Q7loz2mdvVj?=
 =?iso-8859-1?Q?6qF7eojHJVMy02RsSJ/9daJ9k/PkahN61kIy/UMjn6UbhJapIlrK0h23cD?=
 =?iso-8859-1?Q?oVBV/BTGrBUxzIVxANeASMn/Xn4C9IRP/Ugsy9Brymlsy6TQ2PYHRD/DzH?=
 =?iso-8859-1?Q?4DONIavOdZcFMBJ51TuBuOrzUL7ONUR9y2foNrKhQ6sbDEl5m0qNoZB69e?=
 =?iso-8859-1?Q?JNDu/+wCNcDOWxBwf1P4eb4WjBXrxHRkOzYlMRdaPfSJyrkqS8LRMPQuAm?=
 =?iso-8859-1?Q?AQZH6Z6iaGFLuRaMs1TOOfJ9IW7EnNaw8VxYl/ZeH049qo2jHtR1G6zXGk?=
 =?iso-8859-1?Q?Z6Pi/dZnqr31LyTTaKip1lJXzxP36ypgfBn/s/td+VU6tvhMIEJ/pH6G1B?=
 =?iso-8859-1?Q?2rQXGJXliBLznStL/639N/S2ucBIpV9OmE2FagE5giPLzBvg5hiQMV5175?=
 =?iso-8859-1?Q?9epFXa6lFIPMWR1k0lFQnANSJn3iw9mZArK1UrO8JwsK8Fmc4slIL1egtf?=
 =?iso-8859-1?Q?bP7LOMP9ULPkDka2hG6UAnxR3IIZbirnrV+Hd20LqlXJCMfUF6q0TcdPt6?=
 =?iso-8859-1?Q?7sak6t4r0NErQgYIisZTBHqoCAVgc0IQ/mnnjgnCwvaa3TwZnRlSDb2mEB?=
 =?iso-8859-1?Q?ojiZnc5BR7ZX321/I5U2hEEL83FaGelBJXoPzvHBvF3NAuhgt8OsswolZB?=
 =?iso-8859-1?Q?ybSW9WyY9/m6vlj//5nnrJpNOXVjvkhQd7KRbdUAqRYvAaQ49Kff4YCN0b?=
 =?iso-8859-1?Q?XoX2K+fmUSdxMzjcIeKyl9uvyPyjhTcJHuDULs4ns=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0f2f3f-79ea-4b9c-95f8-08dd766b015d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 07:00:11.2481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7189

Hi all,=0A=
=0A=
Just pinging this patch, it's been about a month since I sent out v2,=0A=
but I haven't received any feedback yet.=0A=
=0A=
If there are any issues with this patch, feel free to let me know. Thanks!=
=0A=
=0A=
Best regards,=0A=
Stephen=
