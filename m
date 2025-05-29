Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B0F253956;
	Thu, 29 May 2025 05:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748497822; cv=fail; b=UKek1V53Idz4wLhwl1yu53ZL/qt42e/KbIMRYFpUg8OA4al3JhfQeW41Uhc6n8xXNeHUUm8+ZuhE+Th8zNEf4Ig2ZfxVjBM0IFXWAlFnJuOIndPElEPXQoVt9yvmdM67iExYBCQUy15vsZGKtpHMbBzvMFX6GmIaUtISGitzJ38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748497822; c=relaxed/simple;
	bh=Su3J60m2h8SsDY7dbIwhX3RpiurGUN7MQ1B41AFnSV8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eSPgcgmxS5Beq7+yanXMKQFA7/u1rx5TOUxVbG6qiSca8J/wNqtu4t8jymaoT/MabK8dN3BaisPwlhM3COuUw/m4pCL9E9OhIEJakNQu3rgkTq1D0c0+5ZBgwgCl+d8EUZNRYvQjdJ2JIMZl41xjMIblXpel/cv7GKhUStaaIG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T59kUF000703;
	Thu, 29 May 2025 05:50:06 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5394yh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 05:50:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+XbOLDy7zDPrZF4zJoREbIWA8BChOVAIThB/3WzaMw73yhRsqV4tuDkIfp06+0y95WHj+jSZdjlhwQtjspvsfeyDJZamKS4W551w+YnfNrURFIEeHS9kkfVv7qNUj2UJOWBgWnJ2wFDXCU7XjdsChZLOTUFyLnPBTC+q412pvoWRMVjcmR1JOMe5PXnlFSCquVMBLJ2y0qJ/2Nq8Me+HvmSG5XctpOYAATbWKNFF3X1U+VuKUthQ+c/aXsaa9G/aTm7kRweD3WAgFo4BNh2ILbmkeIRtDY8I/sfjk0EqsH6GWGd1r0CwMh9kegJvrwH7fdP1PLK5bl0Qnx2G3qoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdECx7u5MU7mL4aYamucyeElJuGY5DABSU3QcGYHYm4=;
 b=IjM4lySk8Z5DckYOMAKscartf+Ni7tJ1fEmPWd6o9UgjitS+YwZZ30XnQMV42JugJr7snUQ5flToXoCpLBoNEImThezTmnSj/4HvSGs4H3XRiX1YbBG8Y7o5msAKv7vTTLZbGHwDZCQ8t12W1v+M8U/oo9jnI298Ku1OPTgvO3D/yMXqnqlnf2Z0MQw6BtrdB4sPN5M4YHq1ke3nF+j26hcHD1usoYdCs63kwrxHHxN3D8YK3RzWdeGNhfn4hlg/fpdNOV/pf2LkbVcYzFHUdqvfsNL54FGGzI7oEQyIM4xXHkVKwstMhm+5sGzNF3A0navApOy62jsn74MJGnPfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 05:50:04 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 05:50:03 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: Frank Li <Frank.li@nxp.com>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Topic: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Index: AQHbz8I6xeJIfWjuYEeXZYWwyKzMCLPoNpoAgADjRmA=
Date: Thu, 29 May 2025 05:50:03 +0000
Message-ID:
 <CH3PR11MB8773AC992036FC042BFCB4EAF166A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <aDc1gobqagsYohO0@lizhi-Precision-Tower-5810>
In-Reply-To: <aDc1gobqagsYohO0@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|DM4PR11MB5279:EE_
x-ms-office365-filtering-correlation-id: 4f211468-d223-442d-c7d6-08dd9e74a8a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TRsLNxG+3/qzxRdWMrlANjcpZRguUyahIvGuKS1aMZPa+/VksIhZlLdFUVDF?=
 =?us-ascii?Q?RmlhnDHERYx4/WnPLqqoELkIV8ZF9d59jOxUSdYdM5Evl67lP4Biq8bgp0sn?=
 =?us-ascii?Q?TmfzCwXR80ofU22PQmwGP70I228gJEcEv8NYHqziRoRroXGITfhFjNkc1PML?=
 =?us-ascii?Q?ynty0FkGQf/uEWfhvZUrdwoMr6/RrSnbSgRPJpaJJ2rAqYFUBTTdmqgOVwK0?=
 =?us-ascii?Q?2bRHoOXu3ogWeaFWAdY+VpUMTz4hESjIh88KP56e8FU6h281Q2XyMlBVAXio?=
 =?us-ascii?Q?lelwzXn498uW0ds/eicNbS5LFW13DBX+9KTsRrJ14cBFdYy+8blEwJ+x/H3q?=
 =?us-ascii?Q?bexbnCc0Qkrq7Gr+5sm+xmFtFPdWHPOElfH+fyH12AN1PzWrE0+nGvo/I1fl?=
 =?us-ascii?Q?H7w93sM2PDV2O0LLO1F41oKfGFRUsZCF08eUIOdF/N8+SJxnV3gqGAaEcmky?=
 =?us-ascii?Q?MNO/pJYLQxIG9lmcLlrVfuuqjM9T/onu+1hh9B0p3aT8iSYu4eZmJE75LZoR?=
 =?us-ascii?Q?6lmRnZGxIEuJL53jzK7yuMAiaQrozzidMWrhUaPFjGotezDWqhu5Vw1JEAZG?=
 =?us-ascii?Q?OMapBPuDzyL34FYzDpYNRTKI+fxmpQK0kaQZPn49HzybVkaFA2il0ljvvvfE?=
 =?us-ascii?Q?MYFCYuHmutmrWj3fY8dNDnyLyYQiRsXis0UN9aaD9EpLYdPSyyLa35VzUpwz?=
 =?us-ascii?Q?axbw3CkxqecBTK0SFgEPz0X6Yx7UX4a75kVL19X7PGGrnGBWNM51masuP5XE?=
 =?us-ascii?Q?oZWJISlUDSbvkRTHwDDz2co+ywHuv3YfRXx8NgruxXxR8qQPuYzj+CeNC15m?=
 =?us-ascii?Q?c70JwGIJRXXQCebu1K21FDDnVWja0BMnlbHBPKrn9hk0dIH6em1tSpk8WL8F?=
 =?us-ascii?Q?np3/SOiCoxcQ5kZDmSusKOhOCQnEEe8arnlRGbwEfdd6aarbv1MPX9l+mDfH?=
 =?us-ascii?Q?r+1t16EjgOteQN/Tcj+AK9jMiSUg7bucsk4uFQIxCySq1+aR2WsZw5hbnJmm?=
 =?us-ascii?Q?tumtKK+oXuMBPCDPH5EoqWXx3Mql2xbJgmdnySppT8TbBYsjeLPNjR8risQU?=
 =?us-ascii?Q?eoTr63ZUfuVbyERiwqaHjSHxkJFkF0j5avv+bp6HtqD+vx1vehdeIygkQjM7?=
 =?us-ascii?Q?l4xrkHfYrwFgOsN5Fy/tFcOHQhqc6vG/7XaQgqYRkFThvq8hntE/I7Y5EZkU?=
 =?us-ascii?Q?IsGTitE8YTYO66aqM4lx0g9GjCIocMlE/2MEOKWgQxZ9IMPrZ2/5U2VOOrh6?=
 =?us-ascii?Q?z1Ne1mPGWTRIqy0+AtvrmNMGXnOTd/sw/iq45c10reUaovffDO/Thd+Ne6NG?=
 =?us-ascii?Q?8+oxNWJuNo5qg2Sktv+gTqxOpPd1lqKIhN18QE/mNdPtBcpLW3Ochy7prqKD?=
 =?us-ascii?Q?IpMHqP6yEFoB8jTLeq9sJrCLOwD8g8Orsy1BpJ1+aUqRLQ9ygS7QSLuJ0qhY?=
 =?us-ascii?Q?KckOSYNk64it3/eJLfLVCGvhjbXLWcMGS5qF/2I3vFjqoLGq0POQ0p2GzwJH?=
 =?us-ascii?Q?iwSRKYow8gW2Knc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?z58xfew10WqA9e3+q0hqHg6QnUzZ16CCk4DPFVuo9bKp2jkdL/sUkMPyEZrc?=
 =?us-ascii?Q?3zGFej2BfLX37roTXj4phjf4mwFKCZRjU9JbDtQcNl+ujCv9QCP6YLnBhUDv?=
 =?us-ascii?Q?xbl65UGarMbkTv8hyOVVGkeis9t/0vTzrg53BBH7PE2TTGPDOoFIEpqfcfCf?=
 =?us-ascii?Q?Sop/6oVRFM6Fx2mdJYEMxmPYTZgonGSdk0y6YO9kCbteliEAm7N2k7G+Jqjj?=
 =?us-ascii?Q?P74qb7DZnThfz3QTAi6nSCbgtjWwc1lHoc930mYeIh7kOmqsq4hg9BUd4CX6?=
 =?us-ascii?Q?amJHxD1LHMSroKnTVAQv8tDrqUKmSQnmL0uz8b/jHUelD+que7jBo+Fc4sOn?=
 =?us-ascii?Q?MS3ksJXsbbJjtCPVMeSyjBopeyb5z1oxidGgJQWHpG595I5qs4RlIKcDXB8A?=
 =?us-ascii?Q?UZICAe/sysy0iXOZ5e6OJVJz+ZfgtLccWvrV8cxeW6SEPek8Dh0w8fRx1vr+?=
 =?us-ascii?Q?i3wHEeEb8zTQ5XFzw7yA+wxvp+vvQehUPwXBgKEbeBx9qA+/rwR4v+TxGdEf?=
 =?us-ascii?Q?/jEwHPSXCv1Hv+ieszX3OIYuCVEp1mMl43N2TJLKvsjvLvbE3BHgRlHS7629?=
 =?us-ascii?Q?XXuSd9Pt2q30rWwEXn/aIU/zw1pEM+/AymvG3/rfSDjXYI4AAnj2aK7GZtV8?=
 =?us-ascii?Q?nGmp6kDC/nl3bQM0t1/Oen7ZayimlukBh5mjyEP3cNwWAsiAUV+uqLnVi4Gv?=
 =?us-ascii?Q?zCgIHrHMGVsFPR++bvVTwTz2h5gt7jo3UQwqe8Bmf8ly3itSafYH2XiokC1X?=
 =?us-ascii?Q?qCW/czXEL9s3OfLqDjfdKIq8UEmJnSiMpaIPU9m6AwF7wsRRp1Urd3GBO72s?=
 =?us-ascii?Q?Tt/nOOm7BDs669iH5pCjA1tzilvETWujjjvO3P6rC3G/C7+UAXyUtI/WJWtP?=
 =?us-ascii?Q?g3wHWBVFYrMCK9aSAYRGA7yJRKIJbUYLwtB07yzCdfAoDt0sBhXqGO8OHw1W?=
 =?us-ascii?Q?AREk+EmPVi6JB+DvcvtI8fw34wewSU4fdD25qFzsQi8cVEC4d8szZXen57hm?=
 =?us-ascii?Q?XUjLi5ggaYZMmaBmwo6jVn1QUd1LW5bMVfgfbffT9hXYRzizB0n0IIygRT2e?=
 =?us-ascii?Q?r6yBza9BTxVRKrQACOxvEzsieUu2HO95ajR618oBv3Vctyuz04tcZ3VrM6wL?=
 =?us-ascii?Q?gZX7xDuuorARHv4BpR9RjnOFsyKhvFsIHaEbZT5ti4Uj/tSeatx7atMzFgDy?=
 =?us-ascii?Q?n8eK0+8l4Rl0tCMdmXSFNZuuBW/QtyufkiRThqi9AFtOnsvLJCA1J6vUPpOk?=
 =?us-ascii?Q?D6YjQ8GnfjLyDotUyqR3JBUIh7DZXE5eJqFw++ZPsG6TDawiMw5qbPGF2ufg?=
 =?us-ascii?Q?g7olw3pGt8mOOs7Z9I0PvS+ZkQyIO7HASNuOsrABi9dKscPQK+f7oPTzDLl8?=
 =?us-ascii?Q?gNV0S/LT+WJjiYdTC4zNP6FyvUxUk0JOXEI4v0790TUTCn3GtuSkNX9vWWFY?=
 =?us-ascii?Q?BhB0BerBmIUWI2M7kv5aZLeUawzrfDk00YdzM0WHPglgL/KN41BZK35xwEJN?=
 =?us-ascii?Q?WCGaeWx9IdsqpD9D+H98sQqWi4LxdxOfH2E6T8rD6XhvJ14zaqs4LsigJPlD?=
 =?us-ascii?Q?/92TkU3a6CVf80dXHZPG8AVVZC2WvsHbl7aYXUpz?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f211468-d223-442d-c7d6-08dd9e74a8a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 05:50:03.8900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/F3NiIRA24Itd3GHyyMxp8g3TEq+IpuQZPPY2sZoUUeNgmsDsG8GpZ4gZhxzRxjrJ2/YwcgpgGjvXe87BcrNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA1NSBTYWx0ZWRfX2wwRiRvmjIJ1 9Hkfak47AUtGLK9AfsdfT1lCqvtYPuZRtW9za+vvxu0LPcTjTPNYT1X7/iwZWr4EkhPhSqfUwyu r5uvrx2hzOXznCWCri2cOeGwAQUXLpvgWlG5X6je7JMFhCyxiyriCriycbLvRCN0bIb0gqdWYI2
 gEthTEu8jyhwFiz6e/6rfylDvN/Gd25EWgkydOejRnJ1vkLoU8/FHjBZvYpL9jOMayaYE6PsEE/ A1EQKKOn5wRmKUswczhk+KFihwc5+B3X2UjJVBR4IPm60+DMQjbv4eFW3RXYuZAlyyvPgE7JuGh 7sZaLoqgnabiPTLs2Tpa4PKDnPGUPRb91LHzByS2C/s7oUTyFiada3miXfr/DIcBGZAmrMPm1gG
 fKfXMFNEafcamVOmA1E1GeFwXyeyuFiKIVGcSD9qw2O/STeSiaY1KY4S2nWJoXUz1OPxrPdI
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6837f58d cx=c_pps a=zGATrNSX/tQ3ThVYaNLL7w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=8AirrxEcAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=uIceyLU7dsuyyLLNaGEA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: TRQyoFB96xKSVNp8CMKVJsTvTasvIkIR
X-Proofpoint-GUID: TRQyoFB96xKSVNp8CMKVJsTvTasvIkIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505290055



> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: Thursday, May 29, 2025 12:11 AM
> To: Li, Meng <Meng.Li@windriver.com>
> Cc: shawnguo@kernel.org; robh@kernel.org; conor+dt@kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
> watchdog node
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Wed, May 28, 2025 at 07:17:51PM +0800, Meng Li wrote:
> > When verifying watchdog feature on NXP ls1046ardb board, it doesn't
> > work. Because the big-endian is deleted by accident, add it back.
> >
> > Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for
> > mmc nodes")
>=20
> fix tags should be wrong.
>=20
> I remember I tested without big-endian. If it is wrong, please revert ori=
ginal
> patch and provide enough reason.
>=20

Although you said you understand my patch in your next email, do you think =
I still need to improve my commit log more clearly, and send a v2 patch?
For example, describe that only the big-endian of watchdog node is remove b=
y accident, and the mmc works fine. Only add the big-endian for watchdog fe=
ature.

Thanks,
Limeng

> Frank
>=20
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Meng Li <Meng.Li@windriver.com>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > index 4d75bff0d548..e15ec2e1cb04 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > @@ -753,6 +753,7 @@ wdog0: watchdog@2ad0000 {
> >                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> >                       clocks =3D <&clockgen QORIQ_CLK_PLATFORM_PLL
> >                                           QORIQ_CLK_PLL_DIV(2)>;
> > +                     big-endian;
> >               };
> >
> >               edma0: dma-controller@2c00000 {
> > --
> > 2.34.1
> >
