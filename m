Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7010A1F;
	Fri,  4 Apr 2025 02:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743734015; cv=fail; b=BXPCVdWyILhQsTboaPWzsb0I/UN9jovApYV30TA2KAJ53f3JSOYm9kLcGh4vfI26FLuB/7VnyHzmAC0/yWrTeZ/+ajgdK44i3i0Uok9UahzAM7Vii6ePiZ1kgx1ctaP3RHycCEUhx2NG0Fiu8bnU1H4bX7NQfoNgIUtLdt+4L6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743734015; c=relaxed/simple;
	bh=FeKyVRpDZV6vX3juc7HGxwqQCoAZwDAKL3f6mVKOOzw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IasdbVZjMtt8pAMPc95uPnwwZdm1P1bc6yqBILHlVR65KqEpYNBOL+RqS7Uw/Xb2XQ5u3bQx/JCQfxNpzfEgm48s2Yk6MStUlZQJwFIdgPD8Dh0FpuDWfBHABt4dn9woBoRm91IIo90sz1IePQLbvADKqzYzskuweFwOIf7zjc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=h8DgGnUT; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="h8DgGnUT"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533Lg3bw015673;
	Thu, 3 Apr 2025 22:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uEBeI
	gj0oucI9uHsR0yN3hrwpHKqiIeVcmhjc/ucAAY=; b=h8DgGnUTakLNfZpujVgbo
	EViggs9NZdIY/IBdjPoeyfoQWOx0w2NRkqzeT3dptKV+YYw9KL+/PDjJWBiweaid
	oQvJeGozG18jpHabHqhiqraaiqXsZvRApSi0FUfO0Zv+DC1aTHoVUMpSlE+0wYzF
	JPankeCY29F6SK5gs5iApghxkHnM5EQXPu2olgIRCg1IpL+82LxjEDNlUIC8XUJO
	oIaZjN9rlVUQ3KR8TfM1+GY5m4anV6Gn3IdCyRO32kK+8rkX1rLQSrEPNmmit7Ex
	ZAy7LITCHRZijvzCiPxMo3yAoGBDrvFTnYpTH/kfa+cqJs+7SqtAgdlGw6wud5LU
	Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010005.outbound.protection.outlook.com [40.93.1.5])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45t2fh8y5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 22:33:29 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGj6zmTVODCIne3+1WpGuW8ew83LPiP8DOfaoFjHeLZdEB9bb0EqDzdA4g8KAIm7qbC1LJIcnrm2l0qOuNSetATU8TvOVoTLjl3jYK2bUr82huPDgTAcJ5DDN9O25i4kstqbxaAMJSkJDEgtvqaBQXwGg5OvOlshoO+cK7gF+11PzqU7sER4V995YREkxsrj8c7EFuQnVQVQcqbc8aMUjy2/G4UGnEXcMcjl0WTEZ3gpLYtF36yuCjL7IyKIx/GyKvig+7zv4T+lKr7IfiU6Au9oVFQF/DpoKHGvgoqr91dxULoHqeUfnhu5TpOZZ0DLdsXpBgvUedFB8qt40Jg7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEBeIgj0oucI9uHsR0yN3hrwpHKqiIeVcmhjc/ucAAY=;
 b=zApXf7shLwcAq1pQKEK3Vpw7Qf4Biq24viNufA/igmI/X45W8TGfLKuvKogIS6pCkIrpC1spz+S/rsYR7cIl52g5Ib5GkQV1r3YmB02d2bTLCv2Nq0iV+sHkJMwn9xEUgvNVsPK4Tu+3ZUz3pMLv7ViXC2kPsACMKjZhx0IVrd1E+b6PHgNAiCyyRGa2b0ctQXTFGZBuGZ7C9MroQteOAM5XcjZywVqTS3JAcrcGvzNXlVhPje6S8Hfd0UaIm1fzKfKDBXZvUBmyDOQLk4Be4BbSat7KkHdqktpAC31ObEt13xfi6TpoWALJBzZ1dMq6gFJzJzCbx/GH/2ZAYt/gqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SJ0PR03MB5488.namprd03.prod.outlook.com (2603:10b6:a03:287::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 02:33:27 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354%5]) with mapi id 15.20.8583.043; Fri, 4 Apr 2025
 02:33:27 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] regulator: adp5055: Add driver for adp5055
Thread-Topic: [PATCH v3 2/2] regulator: adp5055: Add driver for adp5055
Thread-Index: AQHbpEKmrftOQwEYJEyOn1gcrSONubORyQeAgADm2BA=
Date: Fri, 4 Apr 2025 02:33:27 +0000
Message-ID:
 <PH0PR03MB63517B73D2E5F9B46FAA6D41F1A92@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20250403-upstream-adp5055-v3-0-8eb170f4f94e@analog.com>
 <20250403-upstream-adp5055-v3-2-8eb170f4f94e@analog.com>
 <360c60a4-d1ba-47bf-b65d-c6889801703f@sirena.org.uk>
In-Reply-To: <360c60a4-d1ba-47bf-b65d-c6889801703f@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SJ0PR03MB5488:EE_
x-ms-office365-filtering-correlation-id: 69923cb2-d752-45c5-39b7-08dd73211489
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HJa7mJ93fx2dPHt8x0P/JRB1rJaD/PoQPkvZ8wfdK18gOO3eCcisFUcf8uOF?=
 =?us-ascii?Q?kHG5Y4kwpQol8uk4EFRBini6wZcshUaZX6FPGqlqvtaC4F1D8f2VnVT/NKto?=
 =?us-ascii?Q?FEGjJf7cm+GeiJDrsl3CWk9VxqFw2rh7sZrhmIGhdERRMHVE31d/PcFlnPYK?=
 =?us-ascii?Q?LUVvEaW0xdW7QN+pk2q8m6jtBS5Arb71qS+FNjBuuz5HZ7vAWiCNgxP8GdYw?=
 =?us-ascii?Q?p02vbvfdwrGchib8B1c0TEs8UFxDomXJze0D6+hJczXSbcbuAej7lekcNulK?=
 =?us-ascii?Q?NOAGFW+okpXEGsHQ7UL8DEriQK5FNUNlknL3oh1ZOn0dqYShCqaXsG53F0WJ?=
 =?us-ascii?Q?B6kpDNw0IlyeERZnogCddwvsMHBCo6yWIra+ppro7u4/cPMF+pCWlCVIzJ5G?=
 =?us-ascii?Q?mpc6um5Uo/xZTMFpThgs8vo9/t1Wg5njCCfYZacf+W5s6Sf13JvDthw9KTeL?=
 =?us-ascii?Q?WOtX+WVP7PQfmrWO2z18+pqq0xXK93izgrZEY+jyuqcMh0dn9tmiND5q+Gv0?=
 =?us-ascii?Q?KViHpIOIeSN/4s38AjBSzrrCmd3G68Y9D6yIt/4b67GcFpgTtbeD5Hb1GBhQ?=
 =?us-ascii?Q?x+/WHnPfOcJf9CzIp6JeM8kkfcKE/F4fcNCAJaVbLNlsy0qgv3HrcQ7SBtD2?=
 =?us-ascii?Q?XRZhRCSlb7dcIkBNuq9ecyyTbo13polY49kEZNntSphBNBCG9bHNR/9rx/9A?=
 =?us-ascii?Q?VuYYnxVKmV6Y/mO/qPIL9zxx5PaucZN7SEwJiyyo+WtYd+j1shDrDV5PMg9H?=
 =?us-ascii?Q?pDYBh8Igt3wQhhleWAHsccvOHUkmQmxXL/evriD3jGhQnQjM6YKr4bYuMWy+?=
 =?us-ascii?Q?46gRmRMp6wJR5FuiZ9ENREARWklqvyNzM4E3U19BeZQoLILz1d0l8G5cVSHO?=
 =?us-ascii?Q?tHfTZS3aHz1ZNFv4DdkuVN+6sMbfJMtAzjeuNbZUb5Uuov7PWBpEubwpITIm?=
 =?us-ascii?Q?BEm1J2r/XxTZUum1laTUg4JhQaKXBJcuGADeBT1N6/pocRVw3z3OhNcKGQDQ?=
 =?us-ascii?Q?vIdgSiIGitU2Ck4ZP0xhartwVb3cnpbZanFsIuHdbxkmn3RMd3i3B5TJa75I?=
 =?us-ascii?Q?Z8qLjFXwgIBt8o/2dt8YYcfkznX325lALyKrxFoJFTyeQq8RPj72vhbbQRzF?=
 =?us-ascii?Q?exbSX82tn0V5HdO3X/X+WQT6dYAbgTdlXa49NxKeqNqRdhGUDTlbftR0ai8g?=
 =?us-ascii?Q?TOvZPc5es0ysCcLSh6Dd4nxUR+fcOVNBcs1jlySeMnWh3U2Htaa6m8y/l8Wq?=
 =?us-ascii?Q?1nG3Q7SWt8UE1F6SMGMdOXPAHRnbXLOvn9CSiEJbz0f8yQTLxvDbNFn59KHv?=
 =?us-ascii?Q?YOei7B/uqlzT8K4hzO99GOMym7DqahxJieiE8uakUTxCtL7XsU5uZ2uAjthU?=
 =?us-ascii?Q?TnB3KVqjcDpw8mevWJ7V2wyZ55qYD/ZKxb+npd9ShshFVh3VxUh67p0DFihL?=
 =?us-ascii?Q?DSjZgiaQzumz2cd0ve0Q+IEtrWq5Q1AN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fv35RLrhbNbBxHKvhqwDDYguhNGQiCJ4FPl4Whggtd6IaN9dMdHME7o357YH?=
 =?us-ascii?Q?+0pEDQSmXWnlT/U9+EUv9bfnDDgiNoSk6aOFiImBhgACWKnkk0e3v1jKeSA0?=
 =?us-ascii?Q?3jcofjVWqFi5PfiuVU23VDV+EPpZP/69x6snWV5JpMxJ0yPTnEoWAZQxapMC?=
 =?us-ascii?Q?ncGcgd1FGon8TtlEko0WAvyb/4jQZbqw7hSYuBF4hqPmckp/pivlg/8PTxOA?=
 =?us-ascii?Q?3b7Q+w9k0MhIDLaMgfXLBIYWuEBIfiDryL4RU5FUwh96LlP1h9f9KcVtGC+O?=
 =?us-ascii?Q?0g38LEnabJE/6fK79nQMkvMaRewNpVuH27bX9Z43wuqOeYD1StDekJgx5wFQ?=
 =?us-ascii?Q?frz0z0GiVaWLgvKy5oNxbs8DnkOoeodg4l7km+ej5a3JoJCGzShYkdae51xg?=
 =?us-ascii?Q?toUl8IaoSDC8sPnMBRuAFGoV6cnjWIB0VzG67xX2MejKuhFRz/fw0UQFACS8?=
 =?us-ascii?Q?vYS12kzwEQoAuJKmdD2qYgI4630XDzM6omcC9k+Og5S+XhqnOdwryl1JAWdy?=
 =?us-ascii?Q?QwYlb+TTro4p9LUcnPDQIVoFRFeKDSSzq8o6X9p57Eg6RoRMEGKlgLsFPdea?=
 =?us-ascii?Q?ZSduZ1j3hHgzCeQWwQ2Fu1Khl3aZjfCmtPchwVe8Fk90eHSBwbYkqQ2VCBLb?=
 =?us-ascii?Q?pOE7OVFL2mdsYx5oJmtcVrXgHqMvCRe4mOsYF7Sd7wecSIIc6bE2Z+hIQ0Jf?=
 =?us-ascii?Q?JNPPhYp/ypaGIVqBCq8SeTyXPIjbUmG7wiseUpcsQ3MhdYBN96uzJy2A622r?=
 =?us-ascii?Q?sv9924wDovv21NMGwguMWxc3O718Dp4lExmbmQCEth6EVxO6IP7iYTU9RZKR?=
 =?us-ascii?Q?pzSaOX0vya1Xz5iAPd2mPqpJIFGmcH9B20GWKeVI3wRnvBsLLDW/cCAQHxX1?=
 =?us-ascii?Q?FDuTPV9cCb1X+pwCeHz7D5hJudJ3y3leooLnIDzPlVtYYoBWtNfmYK7UZnlS?=
 =?us-ascii?Q?sbresOOfR4tepTFaRZpIEYl7HHOUhjkYWVc1Tz2KUYMNYLkLASnlbusok9Yc?=
 =?us-ascii?Q?ltWRwoxYpGxpfZFKPX37vtJ1xiCp8wRpoHQ5WuBrGhO4Un/ps9MPKwD/bHBy?=
 =?us-ascii?Q?i8bgkvL2Wj54vhbqxAEsTOHekPY1CixxoHw52+blQV1QrM6ZWAZtzydi8tDd?=
 =?us-ascii?Q?zcqb77oY5XG0HW/Nd+4Mv3wl+kszLhFlviLJIt3RxyivGIig+qXgR6KtKlso?=
 =?us-ascii?Q?tKgIJWXvf7ehM/Ze3P+tXMmfng41WNIRCqGeYgYAW53MZyPN2s5JGT3ja1Mu?=
 =?us-ascii?Q?aQ6E/YTvFyhLYXF5GHUWTQSdpdGEVe1E/4N+Wob0/RdWgpUp5A7GYoyuYUzD?=
 =?us-ascii?Q?CF862H6IzrE9gRL22G0/eY5N19bgq+ipTlDgjc1HRw1CuXiqc2ujnWFN6raA?=
 =?us-ascii?Q?7Dxq6cTCdn44RCKt6GJLxxvDZboh+cGz4NbTSC9HAPV2JP8H4PVHNEawL93p?=
 =?us-ascii?Q?BhVGsMthicVRnurl1VnGZiMVuae+VO8hedbieYVQ3BP54bLn1baT/gLcgJmt?=
 =?us-ascii?Q?K9cTRxshzdFe9RjNvpSJG9eIm6K1Jm4PdkF0gSCUR30LwU9VfIw/24ooLCrn?=
 =?us-ascii?Q?kB09F1ZgbrxbY1y+JrFsry8neScPG8tUYdTzbK9VxwVhQwoCCTobIO7y86+I?=
 =?us-ascii?Q?tg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69923cb2-d752-45c5-39b7-08dd73211489
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 02:33:27.2017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMn4Ain0FHnFvHPlwHzRVCIz2w/ADNmPfxB1Ksb3ytdswAWz907PGn6owBmDogYP7M9PPTxKsSYgJPJB3O+An/pjCWVYmFSrIajRhCHWf1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5488
X-Authority-Analysis: v=2.4 cv=MOJgmNZl c=1 sm=1 tr=0 ts=67ef44f9 cx=c_pps a=94i1PXq8WVRBNmfdvHlv4w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=pGLkceISAAAA:8 a=ZQxAEoVRXZhn9j3pZNUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: UF3FOiTdw9KHMmbgUfsNtY5C8akLsgi9
X-Proofpoint-ORIG-GUID: UF3FOiTdw9KHMmbgUfsNtY5C8akLsgi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=927 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040016



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, April 3, 2025 7:09 PM
> To: Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org
> Subject: Re: [PATCH v3 2/2] regulator: adp5055: Add driver for adp5055
>=20
> [External]
>=20
> On Thu, Apr 03, 2025 at 10:43:11AM +0800, Alexis Czezar Torreno wrote:
>=20
> > +static int adp5055_is_enabled(struct regulator_dev *rdev) {
> > +	struct adp5055 *adp5055 =3D rdev_get_drvdata(rdev);
> > +	int id =3D rdev_get_id(rdev);
> > +	int val;
> > +
> > +	if (adp5055->en_mode_software)
> > +		return regulator_is_enabled_regmap(rdev);
> > +
> > +	val =3D gpiod_get_value_cansleep(adp5055->en_gpiod[id]);
> > +
> > +	return val;
> > +};
>=20
> This is absolutely standard enable GPIO support, just let the core handle
> everything.  Otherwise this looks fine.

May I ask which core function is the suggested to use here?

I assume I need to change the line in ops:
-> .is_enabled =3D adp5055_is_enabled,

Not sure which function handles both GPIO and registers since as far as I
understand 'regulator_is_enabled_regmap()' only handles software/registers =
and
'regulator_is_enabled()' only checks the gpio?

