Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E32E2B9B9;
	Fri, 30 May 2025 00:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748566689; cv=fail; b=CCJhx9ZVY3DuuuFsHNoMc60v5+r5vCjeEezyaSKSOZm6gD6LOIF3vvwiYrCRN3Q1JZyCTGPHzk3HlMPO8CMLefXkDlj7z62MyMGkhJsJc+SNLAE0a9J9eopWkJVhqECSYrksqjM1+It1BIsvB7h/MCI4HzlGsLfbAqZvKmkIdIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748566689; c=relaxed/simple;
	bh=pI0SEOn6viIaGp7QFtUlzZiWMyeZRwqc2PIZlI0rsXg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WeMhQ/CPZ3gz5CK/0UGHDo32hIn4TOnB/1BuV16RLnldYoaSArloOfZoZ8EdgEDIfQnAtZ/m3aUmtqFLnGzPAoWCWlbWKXr13LRdmfc/8mq3dPPwy6MSdADkfWjdZNxFYnc9SMJos+Na9QY1e9VqQ7B1+7veOX00q3UrKCB3V4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TK3dNs030955;
	Fri, 30 May 2025 00:57:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5395yqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 00:57:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTH8Z6zbR5/7c4TdkHdF6kvbf2uQtV/J1o3Oc1j3LYEXAa2cT9nKAhubO3LM2giJWJpYX/xs7TJVx8sSGQepfaaPN7TY4fmbN73HhCTOuZLmGlwJNh8q9/lnc8wqrsNfpaT0FfpmDINi7WUl5ISXSzjJBVbJiV6GlVL5PQFAkITrqFxJTcqZ/YzI5t7d4oGfC9uN4JZX4dIZ15QBCQJwCjNHgzjicKwZWxoUhNI4hC8nuXaOB0wfc2UaXWtFw+YpDAeixKN4H64stpyvEHLTPyMrfmE/SIXVsor1bToXmQAqaKe0BBB4F+jGFsnrbM3xLYiT9x04PQQ7oVD5RJKvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2I8QE1VUBBbtlW4Esyvls4+mPoTsMx6eKNk8RmpTRY=;
 b=kNDnz0PiImcwiEXD/uQQHWg+LryYeV4/o+z/2QB1TKtyWoC5aMAbtrURIwB0RMySrNYw5Dgq374DjkPrx98SZmemQVqoB07lmPFb41Va/M5XgsUWWhuuZdhU2YJR48NkXvTHsUWQnpkkVNqYgS1Xui1132l/htpWvL5146hzgBaJBGcyAhwQWSdwbEpZZsZerWWZ1BLTKgpasjRoa8LBVK4k1ptxUyBletvbfbj8aroQQOlV2NT5LWUxQG8ZVdxZl489NvQDpyN3K0PcoSITnzJYU25BpPmTXjf6blD2QUsUgiRhSCRjO1EkhvYW/FxzS5yS8UyHvI+r6+MguxSwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by DS0PR11MB6351.namprd11.prod.outlook.com (2603:10b6:8:cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 00:57:40 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 00:57:39 +0000
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
Thread-Index: AQHbz8I6xeJIfWjuYEeXZYWwyKzMCLPoNpoAgADjRmCAAKw/AIAAlffQ
Date: Fri, 30 May 2025 00:57:39 +0000
Message-ID:
 <CH3PR11MB8773E3D325524005DA3A78B3F161A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <aDc1gobqagsYohO0@lizhi-Precision-Tower-5810>
 <CH3PR11MB8773AC992036FC042BFCB4EAF166A@CH3PR11MB8773.namprd11.prod.outlook.com>
 <aDiEpsIt0rJi1aRQ@lizhi-Precision-Tower-5810>
In-Reply-To: <aDiEpsIt0rJi1aRQ@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|DS0PR11MB6351:EE_
x-ms-office365-filtering-correlation-id: 90825cf8-6b7f-4532-95c6-08dd9f14f9f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?LvFdqEKn8DlPBnx+++s7aQqRUOuAUwGsQblBzDRnVb37glozksffcaBxujLO?=
 =?us-ascii?Q?XPV0NCtpshjHLWY8iGxZschtS4UETCGDjOgF4ZdbgScBElmDUQPtQYKEwKNL?=
 =?us-ascii?Q?uY2fiTyps4S7Orw2P7K6u73WxicjTBz46Lp52S2wt3IDTEwDGU30rAshc/u4?=
 =?us-ascii?Q?xvcYph9HNYeBcqfE1vsx2NXfqr6FcylWMhXEaAAjh8h7eFs+DoIpSJRsBuDC?=
 =?us-ascii?Q?HYKeqoLa/ZDqqGrS4x5m5ptzSbNSN8JtmFRuDWh1k6iwmxNycekRhUkO+QWo?=
 =?us-ascii?Q?RhGdKASS2quF+AV4z4j4rfvQhneBXsbPLzxLjO0XcpNgUQ+8lC/MAhjsW51f?=
 =?us-ascii?Q?LKXHC7cI2U0u+5n7MQM9G5v3T2gEFyWQW5rjZ6eAHeLnHN4AtHwskbyhdFmN?=
 =?us-ascii?Q?lwCQh4CvI8sw7HuoPgEPITykaB2yG87YHWE38vHH5LqrTPM0tWlGJoD4HsE8?=
 =?us-ascii?Q?JtasmB5fZq+t4M4p2LnKZMBvF8wWdXQVezc0OZ3OCCxWCm8uL/dxlauVGhFP?=
 =?us-ascii?Q?2VGmBY6hrnoUOWdOPcbfmnSOohPEWP/bl56wT18sfWFK8jWr9zjl/3NFZcmA?=
 =?us-ascii?Q?K+EVpJv2cPHGKuY/RG+2+gZmouS+6XC/cQjBiNfCNM2RF+eq0cLx0T1AgozI?=
 =?us-ascii?Q?HVTgyf0or8Q2GX1N/7fi8+rxHvehRQaA3B5yDUgM9RrbuisV+Tk6JNnTfoN9?=
 =?us-ascii?Q?bM57+yWUZT6n2mC3HR9t31AFCdwJ7uVok7ihTDm3UrHMJabeDx8J40WeRNEh?=
 =?us-ascii?Q?SNnNfobkwcTUIw3mpRI/rd3OBkdRBcNM//O1oI8aG2QT+tmn+XrnEzeST00y?=
 =?us-ascii?Q?gnGvtP57ULQhxZkKqV1NU6S/2uVJKqqDrXUhUd/3DrnZjOXhcXgSfKIm6r/c?=
 =?us-ascii?Q?4eAKrQMYl9reGNbHqYM6R9+FIUwm1as/6r1OIsd5ESuENoHO9a7KaFOJqhvO?=
 =?us-ascii?Q?LBD82aYHUGX5m13CPhAAZB9zHmbBp5BHegnh+dIqcvuhxsfVgwc5Cy3M/auC?=
 =?us-ascii?Q?1oLBrWPBsiHdWy9KdFsqioi4Honhy3B3e7UlMLYvhb7FesLebFYiiED4dqkJ?=
 =?us-ascii?Q?VTi/1udbhAW+1r45J9LKe4fa5lzWb/y+YswoRjHdTHNhcPZR4m5iaFGaNQ5Z?=
 =?us-ascii?Q?jbO6FOmAHn1HpA4Anr4tnpq4IAWT/a2nx3T6seytGmXb65ILcMAItqf+DZ1C?=
 =?us-ascii?Q?gMBzvHWshLsxlueSYi2nJTpPfJMD6uHUgOOZWTcfke0ovQIgOa1appENCYqm?=
 =?us-ascii?Q?1kXPI9wOG3qFR/5tTP9mnzkmWsvo560ov5CFNjUQzl/61l3XQ5rAj896mGTE?=
 =?us-ascii?Q?29l63HQdY2svfFgosL5webxQUl0sKb/1YofnwBaJ09fT6CgAwgVbB02tWVXy?=
 =?us-ascii?Q?sbLmPuABQcLOxPtDMIW32nCKMtIKBr3/HIpGqrHo/5PuEF5O1Xl+jAzMt2c+?=
 =?us-ascii?Q?Rg8ciTM/bxpw8JSWdE20WQSb8LNN4t0atHAUdvRvA4Ac7MFNdKuRTQxQLiFs?=
 =?us-ascii?Q?qa3zc+eWCg43SDU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1lXuakGOSbr6/e8ullM2Zy9EXm9t5rVb+P5mK6Dl1jpMmYRvQgig1qx7B+px?=
 =?us-ascii?Q?Z/tRa+vWXudv37/xwFzKCSDdjp8JkKry/Xy472Wc454lbT/ULVZq7LdpK/oQ?=
 =?us-ascii?Q?3y47ifBY1Qcn0+C2wbJomZhBrdOrJUwZ8QhJHPdmrUH9hHaqrSd3bkPFA5l5?=
 =?us-ascii?Q?D6pvn4SWiLqQCw2c8Lgn2IXC8wXOPsJZ3F44i2pAZQiTYH3vwSWCib5YuR6U?=
 =?us-ascii?Q?zRGyr+pEZ+m8P5kqwU77E3LUoJ+hdIMTZbqou1RLvk13B/vj03+ws3LkBy46?=
 =?us-ascii?Q?WjliFJIyqlcCaiJOu64Ifb4ri6RcvSy5QcsmFMh4myVcBjf+wj62f9/YtUwb?=
 =?us-ascii?Q?8ZHEiu4E8FWa4/Dof4OUZRnZIzhm19f2EWZsZ0jHs7e4E0eiwhSf78c7PTkG?=
 =?us-ascii?Q?OGNQX79JXf15xkVFxAVdIvQtB4CnyRUQJ5yqThmEWNmIfsASXsvHOsmBYFzM?=
 =?us-ascii?Q?4Xon+tBc8jjCZR5Q174LE04egAEU5SRW+xojZwTccCLre5Hy92A9t8YKAZXA?=
 =?us-ascii?Q?m8X/oj8xHCnfAYPHljFo38HCnJgxnmGFCNHTQBkKQwDgEcHouBZIT/WUYgvd?=
 =?us-ascii?Q?Xcdvoye6gzRNO4NUMv4FYfpCuqOQxLVqoF4ZtQqyEyivb7jXAayw/ub5y2v1?=
 =?us-ascii?Q?16MMM277wpTCj+rT3vWs/G4Rb3wta7xnX4Qjug/3rayXayycIq19E+dVAoXx?=
 =?us-ascii?Q?fmgeCCQ8/nh+zP2znBH3zO1BjbIn9bx3THYI+KBDa7OKpD5HQaE2/UCyjcCC?=
 =?us-ascii?Q?8ofXTQ/TfFSfJZbFBqFwda0Qn9X+jjCIClCUrj6B0a2TqpJkIQQfwk4lS2Qw?=
 =?us-ascii?Q?PpCbK539nJ7/WDsr/jZwRNcbJATLISaf5O2RcoxzGztd1n5mkP44l14Xnkj8?=
 =?us-ascii?Q?E486MWEhwpCj2oZqQJD6n6K/g9IFSzDq/wledwj6mReIxQJSP60Ed0vV2VqE?=
 =?us-ascii?Q?wxgeW10VS+8lBLk+szEcF5mnMYv921bCrg7zUSCK1QmiQPSRkjKEiDwUaQV9?=
 =?us-ascii?Q?fNA4poVE2pzS4jPrUaQtoM7mPzGeNoAlzgrLrpXZdjljeX9DuHIdsAijgwIY?=
 =?us-ascii?Q?sK5Uofu3nnyItNQTlzTlId3edvmlbLK044XkI+qk8rov66MEzv6adAixyeM6?=
 =?us-ascii?Q?nl3kDxnzw/1l9um54LMlRkvQuaeNqxWjsuERuF2bQtrOtcBXawNxD6Jg/jI3?=
 =?us-ascii?Q?TK5pijDBxtLb+dBYxs5AGl9aQcufsMg1Av13fM0YdbOxfVGdrX/Fu39fagAy?=
 =?us-ascii?Q?90SeDAm87G4zeY/6tTjfi7MWzK1UkdVSK9aLHtm2WipYwJ25vgOMdfBi9Uxy?=
 =?us-ascii?Q?RvSuJ1oZOYA7qFus7SxaerMRNOlAFRkh9grJV4X/GdQiH8UYdmJv2Im1dyZ3?=
 =?us-ascii?Q?GG0DuulnzuBS1LrP1+jkQBRWUIVFn5zd+S+2zl8vh/emOArJq4XEFj2KV1AY?=
 =?us-ascii?Q?N89XlL6hUjrjIR3mpU8DeIrJntUbC/XrXfb58e+6R46LpkOigBMSKhAWUF4B?=
 =?us-ascii?Q?dBIUMZ/xZCgirm4wqDL8tEjIBx64EfIU3X0gUlILkmsqT5f0qlc5xrm2s4Tz?=
 =?us-ascii?Q?mxVcn4UQlwcx8qX/7y7X+yYR9tigzYd3VaqbmysZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 90825cf8-6b7f-4532-95c6-08dd9f14f9f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 00:57:39.7393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: auLJ89v9Vgm2YAJAyPWhlcWg88Jbpl5mkdBrTPGNyCaO/497fXK8nVzubMKZFFOy/8PaeUXMi0szkZXfFLb3ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6351
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAwNiBTYWx0ZWRfX13c9p1BDK2Ks PrOVA0RqChsmeRqVlVXGCiOA/Cy3FnEVkfRvjBnRweWWBJwGLM24lt5jAHAJ4yfC0I/IULpROkj hPm6rYRIQSSbeZ7RlXBxQNSHygBQAQjcZ5ulbf7n1l+iBt9/NX4x+vTL3GTn6SMOVcGZbGLdmSe
 M6LoD8xIjCQh+VIiL0djqD4bVIb6/8XJiw0IBAqlfTm8XLHkrHTtgBG4PzDfgNIWg2BdQQ3Ujlu mt4PDNBVrbNE8y3d+w5HxseQUx6I78iibkHTfy5Sk2yiZ4soKck83dga1sKjzUJ7WKecrVlPlO8 nAj4/0J2UBw+z60TC+nq5iF3fDbxRG22PFPLwdzbVk8k6kE72FuP6fZ+c17ajn+yuA2apLWSfWt
 E71x8TfSbuvrtSrrTRasRh1zrijR1nDNNN4khwVLimZDjk3pSNo2+V4ki4Z5UUJTZlyjqxNq
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=68390287 cx=c_pps a=ZwOCfSBgJ6FT52HY8rp51w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=8AirrxEcAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=b2r8n5uiLBzfBjvzOGIA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 6uRWVW1kPX5nhxd66SIIkxy5169NrJkl
X-Proofpoint-GUID: 6uRWVW1kPX5nhxd66SIIkxy5169NrJkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_11,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300006



> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: Friday, May 30, 2025 12:01 AM
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
> On Thu, May 29, 2025 at 05:50:03AM +0000, Li, Meng wrote:
> >
> >
> > > -----Original Message-----
> > > From: Frank Li <Frank.li@nxp.com>
> > > Sent: Thursday, May 29, 2025 12:11 AM
> > > To: Li, Meng <Meng.Li@windriver.com>
> > > Cc: shawnguo@kernel.org; robh@kernel.org; conor+dt@kernel.org;
> > > linux-arm- kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > > linux- kernel@vger.kernel.org
> > > Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back
> > > into watchdog node
> > >
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the
> > > sender and know the content is safe.
> > >
> > > On Wed, May 28, 2025 at 07:17:51PM +0800, Meng Li wrote:
> > > > When verifying watchdog feature on NXP ls1046ardb board, it
> > > > doesn't work. Because the big-endian is deleted by accident, add it=
 back.
> > > >
> > > > Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian
> > > > for mmc nodes")
> > >
> > > fix tags should be wrong.
> > >
> > > I remember I tested without big-endian. If it is wrong, please
> > > revert original patch and provide enough reason.
> > >
> >
> > Although you said you understand my patch in your next email, do you th=
ink
> I still need to improve my commit log more clearly, and send a v2 patch?
> > For example, describe that only the big-endian of watchdog node is remo=
ve
> by accident, and the mmc works fine. Only add the big-endian for watchdog
> feature.
>=20
> Yes, you'd better descript why it is accident remove.
>=20

Ok! Got it.

Thanks,
LImeng

> Frank
> >
> > Thanks,
> > Limeng
> >
> > > Frank
> > >
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Meng Li <Meng.Li@windriver.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > > b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > > index 4d75bff0d548..e15ec2e1cb04 100644
> > > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > > @@ -753,6 +753,7 @@ wdog0: watchdog@2ad0000 {
> > > >                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIG=
H>;
> > > >                       clocks =3D <&clockgen QORIQ_CLK_PLATFORM_PLL
> > > >                                           QORIQ_CLK_PLL_DIV(2)>;
> > > > +                     big-endian;
> > > >               };
> > > >
> > > >               edma0: dma-controller@2c00000 {
> > > > --
> > > > 2.34.1
> > > >
