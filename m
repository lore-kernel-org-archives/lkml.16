Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2373717B402;
	Tue,  8 Apr 2025 00:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744072650; cv=fail; b=tPcCBCYBFJ3F6PZFOC/f07Z5cVr3ccpNu8bx+dX6LihCxZkGljXVLVVRCooB074vlODPstj4KFHA7MYNA2JMM/M5h5SKUc8laSsYGJgzXAdTm21NbbP4kprw2uAkjmlAJ0wqH7IbrZlu0inEGjXavp0Ox7wd//xtspia/7b4tuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744072650; c=relaxed/simple;
	bh=8p2cuS9hCufPPO2EaX03PfgencaAbUK8vIhTMB9gZFQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s8WTl0r/P0VR+QBo7q5ItTvm5CLckiMn+/BILsaetga33swWxrJRrmLRkpOm18xxJu4eJTzNHDlfcgbjQ9BEZRGvUlno/26jZbPcoBzAszBLHYBV/NuP5P4n4/1rckLq0rBwS3fuvgoDhOclcw8M9pN2P2tciZt9EHKZtggHpcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=QsFHt90x; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="QsFHt90x"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5380Il0r011743;
	Mon, 7 Apr 2025 20:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=29oL7
	eUhOrrzGU5z1xHbZIZDokxQmZ3XnbRAPu6SoRI=; b=QsFHt90xItJGBoqXedbHT
	5om+5iWvsMEl82SOBz9q2IZ7C7uTWibQjCdqAdTfPZFIutLtScGykIHk5RFpHSDp
	VtcLUwmtVOFfuRnttOxDdFZBASNVvr2KzWKE/TmiT3A6f17nZR+l9oTCHGP6P4Pv
	8gHTwwpXDnXsJOWXhDrAdx9c7owICY3uIXBlG/ZaqVdcYWFGHgcPYwyucY4nlBUs
	pk+zgDkTmk710Xb5kaKw8eY9CoR+lgVtjFlkjzpKiWb4yzJ+ZzoSq1AT0xpUE7F+
	1sOZn9+/DjcLnoEqEXdh1Gww2STcQrG3l4WYvT9YPE9k4Q2qXce2T0+sPz3tWFWy
	g==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45upjhqfhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 20:37:20 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHJddtkSP1HvoOU+QI2Wrlrx2q58rHp6gs6+0xD64IQ9W1aR0I9vnLDRdjDQQgUK5RCsoQZTNd+/U1ySiuql9uqUSx5jjeJSLtXjTrTlV0fkvEeoCCYYRMuzkupU93Ou6fWf4/yco1CmCrTC3wRORAynzlOVSZ3WRV66zw6sb5pPlUHNSNy84BTVP06eOalYas0tqzxVK/hsWq0sl249qe9UfDfbWxHamxb43nAOEmvChcCeSwu3HkffskCHLDl7rTxo5r8QhIyyyPxHnKs3HhQ0NVjH3G0SceEjxJkDvdAyc3BmiS4NDF1P0V35Yz6Cb6uzCj0jLciJpxXowiBX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29oL7eUhOrrzGU5z1xHbZIZDokxQmZ3XnbRAPu6SoRI=;
 b=sK5jcmZYbnMWzVQk3nMLw/OzbFXd4i8HEzD7qyp1KzhQrJ/jf7NtcuBi4HvB7M06Zgyg3WBkY3B4O5MgIvI5l8xizGH4uHPpjkXMhcQf1wskqvWZKGLpxyCT5WeVl73BTKLNYtx2o2s2V1wo7lmXAv919AOZIDIzQhUny17NbeiTKElNpMiwm4N4L4iXhOJiANjxttMFoRWta1sBOApZ4t3a1tMxAJn8KogSfws4cgubuW5zOHKJy2ENZnOWSpF/VB0+WBLqf1gRxXl5IGDSnCNgrIZRdHKLHWL9rbplifxEE1fERSaeKyt8n71TWfxlPMrChSYqcfV/PJbB++aq7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by IA3PR03MB7571.namprd03.prod.outlook.com (2603:10b6:208:514::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 00:37:16 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354%5]) with mapi id 15.20.8583.043; Tue, 8 Apr 2025
 00:37:16 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v4 0/2] Add support for ADP5055 triple buck regulator.
Thread-Topic: [PATCH v4 0/2] Add support for ADP5055 triple buck regulator.
Thread-Index: AQHbp3TMg4w+mxVAvUuHZgqT4wMX0rOYPIyAgACwwPA=
Date: Tue, 8 Apr 2025 00:37:16 +0000
Message-ID:
 <PH0PR03MB6351F03B3AE6FC2739C55610F1B52@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20250407-upstream-adp5055-v4-0-61dd82369ff2@analog.com>
 <f970a0ae-18db-4506-9f92-d4484ac079f0@sirena.org.uk>
In-Reply-To: <f970a0ae-18db-4506-9f92-d4484ac079f0@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|IA3PR03MB7571:EE_
x-ms-office365-filtering-correlation-id: 60b0e73b-7425-4364-25e3-08dd7635836e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BqhvCxTa6HbJRB2JU8ZHJQKlBKruO6yXL8oCKFRnF1/F7A55JOsyoWOTsv3B?=
 =?us-ascii?Q?DqFaKCrWAEArYasV399jB1uz0rilYJPb+GdVWxnn17gyiHNLeqILkSiUe34R?=
 =?us-ascii?Q?tGtoE+ceokhPeOvZp2Y6xuWZof0EFgQc5VS6Q7+qzFVOkb1MaQsQcJneGiTh?=
 =?us-ascii?Q?b0mStXEMsCz3vtrYeHHsHaMG8ifzD6cmX6cp/UHRaC5OugO1YI7GMIpp+Kzu?=
 =?us-ascii?Q?vHU0MSJHrmbQQ4d4k5i+Bagp9PZUSueaI7wCj8W5F/lRqDhM5FBUxvD8xDZY?=
 =?us-ascii?Q?cIlWtKehKNST8knkmZ66CDY20loH6sWkiGShfYopwUbB1apv5ULKYggjiJn1?=
 =?us-ascii?Q?ENCnP3ytWt/5BxxeuL7QGVmP7+18hy+EPImi5MbWLmTtQhCZvjnpF0Jw4Y1o?=
 =?us-ascii?Q?Mn/nn6NM9L+/9Z5m6ZpLxsiWMeKh6mrEmCfVssznuJNhIKMEOOa4721KIlSD?=
 =?us-ascii?Q?oMbsDAfbOpY8+kotTYv+5G64K7fCRGDIM12erUFuL1gvas4YZwmtABFfQrYL?=
 =?us-ascii?Q?bgYoZ8psi7i0C//SmAot8WLJfY8T3nYsKObhePY8XwvQjjKS7aJ5Ds8aQFm1?=
 =?us-ascii?Q?aYV5WZNkwWu8y5VLLBply7ZlNT7i4Iu8OReo1yNkw5Isujue7JQ7aRFX2pJS?=
 =?us-ascii?Q?5oyCRw2W/JLqwkVX08XuiN1+DO1gKXAs4+NFFwNsP3+r6zGAKItwr/E1KbKy?=
 =?us-ascii?Q?PBx5kYI/II5DzY1Ut3STqPBGIOM+eR662RXsFJ4oGuRGZVeGTHgESRcuIyrS?=
 =?us-ascii?Q?Addb2V+E5i5eNONnMvfpxM+lbD9lUBZN1+GYex9aC/Xu92xkaCrc+ybTQrlX?=
 =?us-ascii?Q?Um3Y7CWsULwc43xMyHKPywSRTvASlBHG29wdFTan9ZD2livAiPvGeHPDWrvS?=
 =?us-ascii?Q?dl5pUm9ldiRW4w62xNhS8XW2wdDmp4+PYQG6RpKnmV99VIv/t6ihEtp17MN+?=
 =?us-ascii?Q?Q1IS8R7vySvIwT0ChnCjEmVtZh3KF7L7bpjY3aR9HdqF5/wtkkJSH6j7aChD?=
 =?us-ascii?Q?j+lTQo4QRPDumWfDFpa01MeDMUwPnuOikm60oPSsHQlXaNC+aOH7syjqZNkV?=
 =?us-ascii?Q?KcK6BtH/oJcw6PTY2C2l+4ob3H39q3u2ieFDkr9yRSFOTDXU4rif9kGyS4+p?=
 =?us-ascii?Q?FUwPDhSfp1i5Z2PN+j2YBQVreM9LRtcLKGlWKOZ9sAd374fIMXCSBkVKYf4g?=
 =?us-ascii?Q?FnNGf7NMdDd4jTcptG3DFx4abgpzqjbjp78UaV4Cw43WP3acO2F4vF+W5B/Z?=
 =?us-ascii?Q?0AcRfbpJSTXHA/bpR8C1jKAIyh33Q2/YDt3KHQZCdpNK+ugNVzT+irF/1OJD?=
 =?us-ascii?Q?JVmogZzI9YnI+jK6okHk5XdnBGRXZsSKcryIysYh7YfaX/axSWd2BT76dnbw?=
 =?us-ascii?Q?T7C6P5jB4o8qPh9QFkGYfzwMX9hjBZNb8TThZCtI7oEQZql0p5AGOP+VwQ2x?=
 =?us-ascii?Q?nl2rYQP6qiDu1jer8lN9Q9dRn+GECOPa7F9fAE5IQEne0SY0ZBo4tg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cYaNhi0CKBJXQxzjlvqqX3JsblCKpQKXiKy+RPiCetONveYhRV6bIxU1oqwz?=
 =?us-ascii?Q?PnAlmtB1tjrs357TYQd/8h2POMzNGrEn0+piil5apx3Cqf/Cf8uc4MnLzOnl?=
 =?us-ascii?Q?ZLD8N7tZBPRhbDA2tVjwrVeyRi28bpNnNqEtR8K35MWAoM+4YX2mLO6XrvqB?=
 =?us-ascii?Q?TZxeRnblM3o6V/ehDiqhKyTj1LZ6bPm63xyBFzZFsIt6WsS1/Ac5DbH1S61f?=
 =?us-ascii?Q?3gwdo/+JCgcwwFWKIfDMeqDckJAuuMFn4pJD3qa6Yyq96ULZgVnva6zjTeNh?=
 =?us-ascii?Q?wHUY9vgmY/ZEzw3ciJgbERQiiKOwY2vb/2SZSXLB0PsbmFrrnfOQUtv8JGWF?=
 =?us-ascii?Q?fgTt2+kmEgzcv+52aIpvnPbKUYK5E6lbTNGGlGnwMzk6DmGx0O0QRoVorMGJ?=
 =?us-ascii?Q?FBFZzBcnqGzSyFDSaL0k+PgsgAdCfiUvcBRo/O+Sf6Jy69PEyViTiu9bWTa8?=
 =?us-ascii?Q?Y4G7dXtPiKEgWb1xEPZ7i3PuxWd+vM6h1o2dTdAS7r+YJTNx8+9BQCCLjl1x?=
 =?us-ascii?Q?+0jhe01D5ac0jpJGc9NceeB4osREiAnQTLs/I0F0IBgYrryDSAKUZZUBHhKW?=
 =?us-ascii?Q?adefp0E55tWgjecEccuLbS6P1pIXolYoomxTlLVh/UF5jcUuLSQYwSdlyUdE?=
 =?us-ascii?Q?d7nLwR8kD/M4cIVeEcXeraOGax4JiUtyrWR1uZpCIbZr9YU1RNGiLZfVrXNt?=
 =?us-ascii?Q?qEqDzsyaEwB4TT2OdWOdh6yJnAWvWX984OC1Gxv7Pw8riPDla30znbHIYY4b?=
 =?us-ascii?Q?NaWPaxeQv6ira2f+IzC+sDS9wMgHmwV3uN9PEGt5ZXqhlRbeL1dT0xCiDfBa?=
 =?us-ascii?Q?o1VFf1txrlFMwohqFMkbej+u/cIF88VVhdWQM4ePb0cYnf91QbQ2H5JHGD51?=
 =?us-ascii?Q?T5YHAQKPeJN8T6UzG7jDM7IOF8DJ1fLAWX/E2A16esH/t+HjGxTG1MNZXmQL?=
 =?us-ascii?Q?/nSGAbKPvrX/JFgnFT/waz/5bWGHfNX/aaFsRWg/L8w8b8ofAT3D2itliTpj?=
 =?us-ascii?Q?oV5WnB1V7Vwu/q1L2KfMfwHZeQs2iK7aoent8tyZLijSd/S1EXoxfDSdbfyD?=
 =?us-ascii?Q?PyTg9bxesqDF0JPvlPhIAikp2z1hVr5rVf1ntB6thJXKm09osMXU0q9b3Aj5?=
 =?us-ascii?Q?E51cfpVOHz0NH4gz0nDIV2k7sLFGxCfhb9vmTo9YW0tTgFp10wKJGpn9xbPe?=
 =?us-ascii?Q?kDT+x70LWGnhXxvmP+6eTZ8tRduHHLa6XwD1rSEseSF+KG8ncCyqKuF2Uw4k?=
 =?us-ascii?Q?VdD0G7VfM/npms3rsefcQvsOerj97Xy0ZQSaN30Lf0fVid6UcfuAVXceu0ib?=
 =?us-ascii?Q?f9BuR9mnFoCxapNQVcxNVQWFZEbPyyUgUXPLQnBenHidrhI4PtEGucEfAqyd?=
 =?us-ascii?Q?JRS+SXHT59nGBKvjr2yR1ymXnAHxjwbnE2Tg6MhHWO/XkNwplbdNt21sDiSw?=
 =?us-ascii?Q?pVdeypOUNUN1nMh+3mBFfulYe+luKmvVWEQ5c0vTmjOfzayTSTsSyjLz9Nd9?=
 =?us-ascii?Q?yIsUmA4tcRHbMla3CdZMv9R8eD6lw0KSBlahsugULEhFwRdnXF8CLE5fN+Cq?=
 =?us-ascii?Q?zLsHpcYAbM4BOIYnh1g7QWaoJpsyjvIMmFlyAxkP+8hGh1KYT1+5JxzNfPhF?=
 =?us-ascii?Q?UA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b0e73b-7425-4364-25e3-08dd7635836e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 00:37:16.6491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U/LZzGkUK+kJNYpcGCuHIVLFXqwsr6hbvp60gC2h2W+s+2czpfxNPhxy/LWyZAy35hpXVwfdTOCJWqDCsoSSHPFH8uWoefyTsUabkg2O8B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7571
X-Proofpoint-GUID: aTSMdS9qv3ORf67C3-LVoPGWotgVgZ3q
X-Authority-Analysis: v=2.4 cv=T4+MT+KQ c=1 sm=1 tr=0 ts=67f46fc0 cx=c_pps a=SXeWyiAXBtEG6vW+ku2Kqw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=G1r8etE-J3gFMXNLc1wA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aTSMdS9qv3ORf67C3-LVoPGWotgVgZ3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=746
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080002



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, April 7, 2025 10:03 PM
> To: Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>
> Subject: Re: [PATCH v4 0/2] Add support for ADP5055 triple buck regulator=
.
>=20
> [External]
>=20
> On Mon, Apr 07, 2025 at 12:07:49PM +0800, Alexis Czezar Torreno wrote:
>=20
> > Changes in v4:
> > - adp5055-regulator.c
> >    - Removed custom adp5055_is_enabled function and let core handle it
>=20
> The custom enable and disable functions are still there?

Oh sorry, I thought it was only the is_enabled. Will remove the custom
dis/enable functions and send a v5.=20

Thanks,
