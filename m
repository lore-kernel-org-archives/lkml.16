Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FC12907;
	Fri, 30 May 2025 01:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748567473; cv=fail; b=VhJS56sSxp/hbGetg5s77R+7gBCvhrZhrRuw6d1DUqaHUIFDAmQsXwFVfQQAVQwVD166is9YK9hgtKcC4cYu2yFpYFJd1C6uKSIGDoMBuz9/MFQNi+4mWNoMh3Lcrv8jxrxzIosRjywHgDh2uwjL9f0pk4t2m/aTuIzIOpJW5Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748567473; c=relaxed/simple;
	bh=8MJhLrbqVANU0bLGFK2+DY9SjOoM3wFE6rNg3he8FkE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m7aDOubuNNYohpWa3zLkDtyGNuoJNHpBqreVL5LOHIq7fRqdH6d3ZORgEBLZYz9IUGll84CHHbxfXCfoWJBNqqF/WReN9SFepiNzO+5l9g2xan9YkVX+s+Ufk07FLZd+X3SbnxsL42I48L0XaNdMPxgrQulcdnrcp2+c2kTMga8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TM0Trq017066;
	Thu, 29 May 2025 18:10:53 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d45wrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 18:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fB2uTHw8e/XuEW437TMBHAvVd/01J0ohee5TwTC0q9u6RP3lFcMTTEH93W3ykAH1TT6aA2BmtRxIPLysdmrRVfW/c03xSZf5pGy3POMvO0LG9ksPJ+Hy4CaScgkDUBtT28HmgYwkqoOYtj3bMPYm4ZxLBVhhEy0EHf5FmNwb2hnjUxdRabLnWUAhR3eWEmNJb1yhD3f726y97ryhT8/Gverf7n8SkmuNd0WvrqBD60mDGlUA6z8aSiuU3LBcHRL94WYH4HXYGdZq/jSC+sEBHKvJYHzmC/ZfVHApQGyUrxZQVZZHmg08MVdjbZm+8jvEm2f7YuNxsrVw21nuGDFlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tg4aBbJuRUnT+nqEts5oR+eaWUbBxXTbBE2qQDjCkkY=;
 b=pJmiJ1f25KwzGXVdAgmnBSrm6zWeE4jJBvt2ez3a1cIfe2Zj61SuH+lDoBRdSM2KFYlSBZrHSRXK0y3MrrXA2qqX/wJdXnhrhfVOLrn/T8u7Ids971qOlFtEulKhtrTB7ycj1kIZ4ZoREfLZvLp0CYYhGTOHFgCz+k52ufduoEVabOW40706M12a/Fe9wwCG/DLtyMKzwnnkBjuK5Mrk0BQNbQXY/0kUQeaFPbiFfHADc7jGbZE9M1Zv4sriaIkd+fBuRmED0N3UNz81ot4nF5q8/DZwwv93/5LCTpkJyXi3R2Qse3l9SbI+EARAMCP/eB3/HmbphSnlY3l5X5s/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 01:10:49 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 01:10:49 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: Frank Li <Frank.li@nxp.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Topic: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Index: AQHbz8I6xeJIfWjuYEeXZYWwyKzMCLPn+wEAgAEDLlCAAMkqAIAAl/zQ
Date: Fri, 30 May 2025 01:10:49 +0000
Message-ID:
 <CH3PR11MB87731683ED90D09412E4898AF161A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <174843567469.3636722.5654586098186872724.robh@kernel.org>
 <CH3PR11MB877336C35ECB8432FF57C821F166A@CH3PR11MB8773.namprd11.prod.outlook.com>
 <aDiFrp/firrNlFEY@lizhi-Precision-Tower-5810>
In-Reply-To: <aDiFrp/firrNlFEY@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|IA1PR11MB6393:EE_
x-ms-office365-filtering-correlation-id: ab8624a1-2c24-4fd1-771a-08dd9f16d0b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0pI715eoaORazgT+OxVskqOrjlkBlp89Ta9Xq6MMBeQWBZJabrSrNLyl2N3P?=
 =?us-ascii?Q?Y7DtH/pTuMp7ZG69vSXnC9yNoWAyY1bQTkarrPlCeEbw1TPAVWRxFuepeJ6q?=
 =?us-ascii?Q?fpXFr+1/VfaRg0NMqDoH7uBvda8Su8qo68Txky1jtSxZN0oPy/ZNbIo1bRDz?=
 =?us-ascii?Q?LMus7A0L/ZzzALaKZWuwTdnlgPEeO0lKUuathwyqfwbWMQ7GT54HMyndgUva?=
 =?us-ascii?Q?nm4Y/BVlAPxPQ7JuXvZXM1QtlwsxO5oe6c0AOk7gnf+cJpqNyYFOarTYJrkQ?=
 =?us-ascii?Q?T+SeUaJemyxvbR3iE2A4OYrFlMu6KHksP6T4Dzqs9gG0SUB35kqZbViI4Uog?=
 =?us-ascii?Q?+J35r3UVeHHhjnQuTeED/VoBdtzEOFZjVELsyvMrxeyJf/FvlDYLmeFFr2BT?=
 =?us-ascii?Q?dEMCUhwAnq2mzbsFnhUbGXv+IJlZsdsVY1LPGSl/N3uu2SHFOnIlOQuxuz3i?=
 =?us-ascii?Q?2nyXoIc0Y1xqfefrAEQCoBppAkr5obE9cackGXVsVHaK11CKQrqDPudhGDA/?=
 =?us-ascii?Q?LF/huEz6u7QoBN3dfRJcYHgtSuucx9DgG3w9pR3eyKjveRyaWfkGz30E97EL?=
 =?us-ascii?Q?ybsz5/CJTdDqMWDndpSyfZDHjV5XhsNFvMMbIJfH/a4Lnl3kpJvUbIPa/nxN?=
 =?us-ascii?Q?pjrD6aVckWECguRdl63muge7qlCrI7KOmBSwWpaFPSCfoM6Ek5KhghXcUB8s?=
 =?us-ascii?Q?z400NjiGYeK4ngkuI9zRNI+A4HbWDTvewoh7eqKdGv3tOrVmAqCJ/9pIb6sd?=
 =?us-ascii?Q?j9Tvm3aqrhs+egaQ+2lhE1jy1g/O7XUcsvx9EDYEvztpYbKDC6wT0MWPqgDg?=
 =?us-ascii?Q?Axd0SWHwxoRcJFIaNXLq9gJhxWfwzzcPs8kfctbMgD22CBqSmfxabHL538jQ?=
 =?us-ascii?Q?vlTeS8VvMTO8L1VlQ0bML0oEmTGLAEa/Vr4x406n6HEAgHJiSOfZ2KsSkQFs?=
 =?us-ascii?Q?NDq8nCyPCx5DQTKv9m9RDGv6CFm3f9TpV/ZyOtjl2Zjwvt1lh/5xfJfI5bAk?=
 =?us-ascii?Q?rzPnK1zh49IdfuDsYBIC+YvLFdZ34t+X5cTT8rWpZSKpryrczyI1UuOjLh6J?=
 =?us-ascii?Q?vYmLwyWJLSO4LH3jspb7UZFS+EZs7oIj0gipwIAKyi12IUpm+LEbDdk3uBfq?=
 =?us-ascii?Q?zbUDYSDQk0IMZe26kF4pn4MQOZaiIVNKCKI/ZpnC2n5xtaMKmM/PMz8cDyc6?=
 =?us-ascii?Q?Qhv2pA2sQbTahnAhWHcAFblCq3kh/oyAusaNLjFVoFlfz0qvW0BP6mhQ65l8?=
 =?us-ascii?Q?Ykj49TEOjGtB7ro8Q2rWRXmvoqsfbAJYxQYF3k1RmAiHduThDw2auZVhxAnI?=
 =?us-ascii?Q?dsdSk6KTkTL9W+5xUS+1Bxk/EC1NR/kbJML0M4j3p1tlH3tFn8o9SQ1uYW9n?=
 =?us-ascii?Q?/4yAbPwPwnOcBy8ZUTE0wOBRGnAxkEEmj+w6nWq4AwzkJwjbNiIPt1gI9SMM?=
 =?us-ascii?Q?/CVQgS6Har8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qJum1ptZcFEoiRzBPBd69a8eaGIfelK8N6CeU5FS7WcX/dHz9Qc5sLwqS4Ol?=
 =?us-ascii?Q?AECYl9YhV3iYRIX+vQYhyrzUoN9z4v2TtRmVi4F82O16g/zVPEepS6HaGfuu?=
 =?us-ascii?Q?Drig4xxWL3LiaRSHBPdQZYunxIRwYGOVThfE8aV5ydA374h/l9NJj/MYhQLi?=
 =?us-ascii?Q?SELPy5ULrSnZhlzV93ee8cmVAOfU+4A+X4L7RXCmDOtKN+OZQLA00TvpbLIB?=
 =?us-ascii?Q?vUdh4s62pUhiHwl6fOIxcCs08vOjUKZcinQMsbPTlwM0QK2WkgEcpEQe+vFn?=
 =?us-ascii?Q?kbms21OFg8MYQFoeY7yNdykh5tdXeTl7VNvQ+2rLMrbEnguGOlnGG4ubzXS+?=
 =?us-ascii?Q?b8fS1Y6+lQV2vCgBEIyJWazcaz/qDuRlx/knPpd5sWn1rEXrk8pHp3z1wLDc?=
 =?us-ascii?Q?HH3adZaM+B3IzEdYPghDbBrir/MuBchvPuwAIorpy+iUxDcC0WpQBWWiREzO?=
 =?us-ascii?Q?pR/4i29GFBmFAI1ZmnR6KRGAPsa0ZIF4irkC38YBySm2/otirMpwqUXibTLd?=
 =?us-ascii?Q?RmycmLCSztH29Dh0DTdWi4//N4u1vUnta0dhpPSh92k82hbt9mIF3gfSNRFZ?=
 =?us-ascii?Q?IvCBJ7VXRyLgZ4m/KUAcUZdJ79+mNacsyeSoxu99l//+GJXSHlYbbQk1cwAh?=
 =?us-ascii?Q?AzdkojD3/afeiVP062oh1tKFnS+AeOB4sDYdC3+vMLwPVFMwzI025p++0ic0?=
 =?us-ascii?Q?85UhD28aqGsr0HC6Hh0j7YOdnTMIJvFaMC8AWy79ipEiCL4nCdkynlyq/TwN?=
 =?us-ascii?Q?gN8aLFJNSgbkX9fevYGiqRl2y7STSigRlsRNhpfSUAU33+LDO1KQVGgaETob?=
 =?us-ascii?Q?yhp5qaDQQwT77ujicWB+rm01E+zh3iyEijI/fyZKZcoFvT6MmCT7NUcji14a?=
 =?us-ascii?Q?tGdhuX0aXmD05VmaoIOhyc7m/ri+S5kI51wQ1rHYeAZD+soTXDjO28wf2bPG?=
 =?us-ascii?Q?6MldtAZ2+ZWti/UDz/swivnIUqFzqe+qEZc7zpQPB5mGe9+mzV2A33P4NO3T?=
 =?us-ascii?Q?NWcIt4Iyd3xaNRc6RgY1dMT19RGUwUvT71ehQDiGqERzWqljqx20vXyQrloK?=
 =?us-ascii?Q?U94jYY4DZnJaBBMGiOZomEtzy3vFsVHOFRr99ju/8kqsmS0rPIMNLxDiZxGI?=
 =?us-ascii?Q?5YDBnbfB40DWK5Rq4m/Gb+iiVp2suca4BOIAhUeAz9EsMK6c8GDEes3sws3N?=
 =?us-ascii?Q?epqdsdK3fsiWpX49Lt5GXBQX5SI2w70KlHF7pTE+cEd+yq8Jti6feQjCpdZD?=
 =?us-ascii?Q?PWB0VJ1TQLeNrAwNvdwgYtFLbW57u0HHYjsyYXWJoxudPg+T2mK3MPsjHh5d?=
 =?us-ascii?Q?sEBz8jDFgMT8gmge4CWJfZuGA7LC1Ujpu+sSWrt8rSlBH7yZmD3gvOCosTQq?=
 =?us-ascii?Q?OMlxICxoZeM+D1gcLuuTiiqUwZIzie5/sLYSX3w2/OSFXeYXmMc9FB+JeJuz?=
 =?us-ascii?Q?ndzcQq7lWyn96EOceBsN/PhD/Z+TgYv96ybM5sJv7NQ+Xnu1+doqCnFsaCM3?=
 =?us-ascii?Q?D0AjzNA5RSttH4zan5Mt1CgLrqok21nD8+ZI+6pFNijDUevR1zaYg1mKank/?=
 =?us-ascii?Q?4jnzOaZBkIq/wBQHlrvQqYv1wJCRmaL7ejT5uEIR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8624a1-2c24-4fd1-771a-08dd9f16d0b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 01:10:49.5601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: elqmtFxLXQUIubFaFZMfBPdhPicW4BWtO/ANI3DMdhegI9qwsBu3uzCI/uvSM7oe+ZAYShsv6hIVqC32ig0U4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
X-Proofpoint-GUID: xXsc1bev2J9TAIA3adPB9NdiWaqRr45N
X-Proofpoint-ORIG-GUID: xXsc1bev2J9TAIA3adPB9NdiWaqRr45N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAwOCBTYWx0ZWRfX4SmwDFjJY5zx Y62TWKoXLwlkN0rS7hjBrNLhToceGC3tRXbXECpjshpv/gKhfQgZkr95bjd/fK2FCnq/tMnYs55 RherLeXC8UoR4JocPodECWdhmyOStOykciviODpFBZ9dzf6iwwEVtSOHy7wSauxwq8KLh7P6/cl
 3hQ8UDoK3ZWa5B0sSiGykhMZwwbhET1vshL5TSA5n+pS1hljhwq+reuJgjATOel22UAuimzMsXJ TErXGtplMF98OKJeFZ/dd2BWvrjkVwClxjtzmFD+hMRcyIAMrq+I2SGOEChpEnzrLL3eSK4123w 6pt1Yf+kMznxu3w2y8PHOKcF/arzuw+oIH/cU7JmneK40/k4Igo1/d2DwrWsty+9YB1XoKsdtT5
 RR82ndIbtWe2Z0N5JPyKVRmjiALijP8GnDgNAvVmUCp/PqXdWQIAx8DXNc/HMoNI7AOnqfU/
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=6839059d cx=c_pps a=voITv4/C+4a7SpyijLYRDA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=8AirrxEcAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=iAN9nYl-EJLqXHW7wiIA:9 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=ST-jHhOKWsTCqRlWije3:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_11,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300008



> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: Friday, May 30, 2025 12:05 AM
> To: Li, Meng <Meng.Li@windriver.com>
> Cc: Rob Herring (Arm) <robh@kernel.org>; devicetree@vger.kernel.org;
> shawnguo@kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; conor+dt@kernel.org
> Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
> watchdog node
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Thu, May 29, 2025 at 04:07:27AM +0000, Li, Meng wrote:
> > Hi Frank,
> >
> > Do you have any suggestions for this issue?
> > Could you please help check whether we need to fix this issue?
>=20
> Fix binding doc
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> index 0da953cb71272..8006efb69ec71 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> @@ -36,6 +36,7 @@ properties:
>                - fsl,imx8mq-wdt
>                - fsl,ls1012a-wdt
>                - fsl,ls1043a-wdt
> +              - fsl,ls1046a-wdt
>                - fsl,vf610-wdt
>            - const: fsl,imx21-wdt
>=20
> @@ -103,6 +104,7 @@ allOf:
>                enum:
>                  - fsl,ls1012a-wdt
>                  - fsl,ls1043a-wdt
> +                - fsl,ls1046a-wdt
>=20
> fix dtsi
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 0baf256b44003..096ed81a9bc4d 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -687,7 +687,7 @@ lpuart5: serial@29a0000 {
>                 };
>=20
>                 wdog0: watchdog@2ad0000 {
> -                       compatible =3D "fsl,imx21-wdt";
> +                       compatible =3D "fsl,ls1046a-wdt", "fsl,imx21-wdt"=
;
>=20
>=20

Thanks, I will verify watchdog feature with above fixing code.

Regards,
LImeng

> Frank
> >
> > Thanks,
> > LImeng
> >
> > > -----Original Message-----
> > > From: Rob Herring (Arm) <robh@kernel.org>
> > > Sent: Wednesday, May 28, 2025 8:37 PM
> > > To: Li, Meng <Meng.Li@windriver.com>
> > > Cc: devicetree@vger.kernel.org; shawnguo@kernel.org; linux-
> > > kernel@vger.kernel.org; Frank.Li@nxp.com; linux-arm-
> > > kernel@lists.infradead.org; conor+dt@kernel.org; Li, Meng
> > > <Meng.Li@windriver.com>
> > > Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back
> > > into watchdog node
> > >
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the
> > > sender and know the content is safe.
> > >
> > > On Wed, 28 May 2025 19:17:51 +0800, Meng Li wrote:
> > > > When verifying watchdog feature on NXP ls1046ardb board, it
> > > > doesn't work. Because the big-endian is deleted by accident, add it=
 back.
> > > >
> > > > Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian
> > > > for mmc nodes")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Meng Li <Meng.Li@windriver.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > >
> > >
> > > My bot found new DTB warnings on the .dts files added or changed in
> > > this series.
> > >
> > > Some warnings may be from an existing SoC .dtsi. Or perhaps the
> > > warnings are fixed by another series. Ultimately, it is up to the
> > > platform maintainer whether these warnings are acceptable or not. No
> > > need to reply unless the platform maintainer has comments.
> > >
> > > If you already ran DT checks and didn't see these error(s), then
> > > make sure dt- schema is up to date:
> > >
> > >   pip3 install dtschema --upgrade
> > >
> > >
> > > This patch series was applied (using b4) to base:
> > >  Base: attempting to guess base-commit...
> > >  Base: failed to guess base
> > >
> > > If this is not the correct base, please add 'base-commit' tag (or
> > > use b4 which does this automatically)
> > >
> > > New warnings running 'make CHECK_DTBS=3Dy for
> > > arch/arm64/boot/dts/freescale/' for 20250528111751.3505224-1-
> > > Meng.Li@windriver.com:
> > >
> > > arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000
> > > (fsl,imx21-wdt): big-endian: False schema does not allow True
> > >         from schema $id:
> > > http://devicetree.org/schemas/watchdog/fsl-imx-
> > > wdt.yaml#
> > > arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb:
> watchdog@2ad0000
> > > (fsl,imx21-wdt): big-endian: False schema does not allow True
> > >         from schema $id:
> > > http://devicetree.org/schemas/watchdog/fsl-imx-
> > > wdt.yaml#
> > > arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000
> > > (fsl,imx21-wdt): big-endian: False schema does not allow True
> > >         from schema $id:
> > > http://devicetree.org/schemas/watchdog/fsl-imx-
> > > wdt.yaml#
> > > arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb:
> > > watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not
> > > allow True
> > >         from schema $id:
> > > http://devicetree.org/schemas/watchdog/fsl-imx-
> > > wdt.yaml#
> > >
> > >
> > >
> > >
> >
