Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E930C1B6CFE;
	Thu, 29 May 2025 01:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748482803; cv=fail; b=YP+EChg1ESA8Bo//2oCakwkLFoNu6/Z++BylsudlPxygQ8q5wc39Q1q+J343/E0y/BjAe7nugJ7fQvjsvprhliX8aLDFZSyUVOv05W1WKZW9P92uNLtrfqt0VDyLuY/Ka8gf2Zwn73k3gIjo3zG+T1qeHevv31G+ZdBLLhoe9QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748482803; c=relaxed/simple;
	bh=/GSBoIhtCCo2oAFcn+gdztQXIoXaeDmwbykhN2DjozE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iERyW+PT9AKCjbYcBo0HAjoIFsDxQhCgv3Plcb3lhB/dFKtoQOTUL9YqVhNHoD7+WdaGUDX+Ncf5Quio5AaZEAP+IOvwSc+OfZC2HjXYdj+iU3AbAYczk7UVgx2DUZmalCOQu1Es5UzQNvox3gIQYcnUgB4xHtQv4fa+Qg3n3fI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T1WOKR005596;
	Thu, 29 May 2025 01:39:42 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5394tuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 01:39:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdyKc7YxsA3lo6MSMG68JfCBklTZGsFtdMexYIz/E3rbyu7ugMfjZd2iJiW/iZo57J3h1+9yITbxo/oCl20Pzf7G3ZAu3Wfm8UD0dhWjoc1OFE9+uz6aR+dL5za/PS3/wEx4zUbUZOQrBdCFphxh1uuaPz1aN03fujhFnDZhCV+D+EgYD5ZunPYvyK+LaC1QN3CB+SlkHJd/niaV8y7lv+F8mayfCNQy6XRgWWfB1nQInM2NkePmajPkkDS80Bi1tl0L8T0xBq0pb9M0Mr7wzDwCbdeEm8JC72jZBI8rVnSALvuxpsfEpQ1LSrWymVjj8MDW5owAiJVG5lYsFig/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1GYiGzhPgrczVCBgfkiZJWXTsrvI6eQCxEiCSksQAg=;
 b=AXdX+f71js8PXfHTyNOMBUSXZlxF0BC0fweHS4ZGIQljvElaIlur9YB4d9bCrfZF4D4q+x4fxCmtAENwAD4yCXt8hnbJkcDVUac9jZFgs6zVC//JvlYVMR7pxCrXpx9WvvNt6qABEKzHOg14m+v5ZDBWbdB/c+DjFLfhMsSRBKZffCclKN1U1A8nLQp028N62PGr02mdy5QDJBoHgV9fkD13Qb8lL5m5dym+EPRCrfbNgoYfbBcz5ZmXj/MysroNnVtoCZdBprmA3YZCk/bP8/n36tEmoOHgCR2ZOnoy/OfNXK9QC4026Vz8U2Y6TlyDnEew7G1RydSCbiedztic7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 01:39:36 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 01:39:36 +0000
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
Thread-Index: AQHbz8I6xeJIfWjuYEeXZYWwyKzMCLPoOC8AgACc7AA=
Date: Thu, 29 May 2025 01:39:36 +0000
Message-ID:
 <CH3PR11MB8773BE10C7B9C548D8161A92F166A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <aDc21jn9RfhOV2vS@lizhi-Precision-Tower-5810>
In-Reply-To: <aDc21jn9RfhOV2vS@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|MN0PR11MB6035:EE_
x-ms-office365-filtering-correlation-id: 3a2ecb66-397b-44d7-2464-08dd9e51ab75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NP4NMOQpW1akS5rULQNgTALVCqNHaz6nhReSf5wpeR6ISw8Y6rPKKjJJyl2n?=
 =?us-ascii?Q?UWKIllVMd6Dskh9xxC0k7EJtfhXGSgltxPoIlK3OAzDIKuPwogEumw05PjwH?=
 =?us-ascii?Q?L7WRlLNPCSQtGqLd9GJAO9tymUXhwR96343VLTpPJCHlEQv39zIIfdylmcEa?=
 =?us-ascii?Q?whY0BUJyUSy3e7rqu/IQ5tZ72MRaCC4ffzSVWlJJ9pBDHvNMY5gimoW6iurU?=
 =?us-ascii?Q?533gkJogm5xS5nt8k48Nca4DZPgk9RikRMVUCJkNvL4oaND7uWPp24U1G+6E?=
 =?us-ascii?Q?d25Sw2e7b3t0sCN+yjuLLn1jqE/7OctyA90rOj0AsXj/PjIWKrXxDvg+73e1?=
 =?us-ascii?Q?GHIXxQ4pSk8w/gUibmA0vMiG6kRjdUjrCb229lOYAqa6+PGa3hcx3k6e4QvX?=
 =?us-ascii?Q?8iqViWQnvoDS+8E36psG2mtYXbhUmcsgN4PJjBGhXMKJ2zXEPgOhHKmXswuk?=
 =?us-ascii?Q?AIVXuUN6aXLfd4VhMIB1niAjoStWoZnkKTekIwjPyPVIzpCBEWiyvphRrNui?=
 =?us-ascii?Q?quetXNIw2H4/TTM9kCGlRpBxthLsH+jGB+C1PX5HZVqjxyOtnXCWtk1n1hFR?=
 =?us-ascii?Q?wRUwSur9iQdLbt0r5vecLBTD4cn8uqaaynl7BBJIJ+DdgtyA/2C2GKEfkWoP?=
 =?us-ascii?Q?XEd2C53njk9wzVnjsR8O1M8Rxtu3PIb+VV43IbQNnz9CLmRNSQL+PFlxAyC0?=
 =?us-ascii?Q?RlIlKf4atb4kG+TorlPwjlC4Unf7OtooX1zENIAmwLx1JpkauRMWYm/GHIYT?=
 =?us-ascii?Q?1exG3IGu63mzrMypLybu9Wxb6Jzet1eeDcQUIb+A4dQj+4xRGMdxE4CpX0/A?=
 =?us-ascii?Q?Pdc9NQCWDOIwpOOf/zRgEo6temFMYX2taKHTpREDN+xy108YvgT4WN+952iR?=
 =?us-ascii?Q?huFrzi858W4BKkNk0LYFMEnnbSmmFNclTDLcRzJClsX9AsaNRQ0hpJyH1y+v?=
 =?us-ascii?Q?dhC2/aW8gtsNQvz84XnbJqBJBgLss2THch7jQ/UCrvU2Glug8+uCgZtrcLQj?=
 =?us-ascii?Q?q7n9/oY0L9N7azHRXieJUtRAp+vEWgxbga4lhCqDOd2Bq4rSmtfbDGOluXr1?=
 =?us-ascii?Q?uSoQxcXHCKbu65R6OQ5kocKp9vZYXrwvUNE4btDH6vrcKOAAiy47W2xNg7d6?=
 =?us-ascii?Q?4RHjh/X6AoilLZjMsqLtBd1grm2mgWCQCbnD8qA9OkAXg48WonMTWu3FEp3w?=
 =?us-ascii?Q?L0knFuFtKl3x4CWRqT+UVGPm0vSXf3A+2xrqU81kioef/7bSKSr9Mhokm033?=
 =?us-ascii?Q?QROtSZXo1T5CE7Ds7lybiAO/8jQqFBZiIz0cx8Fuk3KsFgf8fFQyUKxGxoS0?=
 =?us-ascii?Q?YgTn9GNpK2HNjtq27FmmQyb5kmD10ZKuUfKey21Esm9AGKVhcm5TuGXlyEnn?=
 =?us-ascii?Q?ptNZfEsjseY+xZpw915IInHQhM/9jPEnBP1Mg0GwEmZxEwv9U/oG4wE3N8f0?=
 =?us-ascii?Q?HbEoXe1WBsWnf5nsiRW1aSv7FqCg+BOhQNEqTdGxFGO5h5ej1OrMjvo/S7RV?=
 =?us-ascii?Q?T97d56zaeXmTDGo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YN/JdnFtKTT+PdytnpoGhQDHa0Pe245a392iT+FpWixJwWC4fnHG8u4oFKuA?=
 =?us-ascii?Q?hlaSouj6Kwv9uVQhnpLX2fXFSTIlxJew9VEOFD9ww2g/vaCJbRZ9yZYksj6t?=
 =?us-ascii?Q?hz/pemhipMpcbXB4V0QJPlUC3VAk/kbTbAFgniO266ThvKWi+RaiMT7Z6kub?=
 =?us-ascii?Q?rX6uIWuOAvDD9D2jEUBk+6W7+NVQLQ32paBc16jHWZrR2zaqwmd08lK4qwNw?=
 =?us-ascii?Q?BkMFt1iM97dJdF9sNeSjE3SdKwaR/T+T9gZ2iNiSS3/hLEocfJF3EBuRJVk1?=
 =?us-ascii?Q?HRO1mPHJ7v8uEfZPiO/z4udsZJKQf9n2ivabeMhlSW5NeO+RTKCRcMvU8VfO?=
 =?us-ascii?Q?Jg9NortpVtE1Yi2BxhELoA7h/XdEixz7p3Br1XpGQ5lb0nvyHujWof3orkJ7?=
 =?us-ascii?Q?l490UKwPEMVHz6v0fsrzPDekPzxn8NFk921EJa4v5eHuLhzyu1trAkdw/xv5?=
 =?us-ascii?Q?/F6qgU0kBLj0HGed9zfOBXQl9qs+NhmbPPaN6FCcaVkNFnoDp3WoAYr5dpiL?=
 =?us-ascii?Q?Ht8BnpHNECshIQJEKvU3/JY1CNtr+P6lTm2LbhpkpppcvWoujXMixeu9wx/2?=
 =?us-ascii?Q?FVNkGbS7dIvEHTj2CJ1e8S3gEMqjHM0/rKO/uK/wARYozznIYx2k8D2dDSC5?=
 =?us-ascii?Q?llLGQQK4WYEHIRm7HXe4yR9TVZ5YSfmDoLw2ktuNGFSGcjwuD5hdnfVW+lTk?=
 =?us-ascii?Q?5b3EqpMPrOxvPfkI3KVMp1OiBIKGYb3dRhNi0l+QFFSjhA+slwYzFDMCjrwy?=
 =?us-ascii?Q?73smYPuUYzQL0Hu06lFNOs5ga6q3iJ4xxN0XxmBAZMP6QUFx1GH2LwkL1dBE?=
 =?us-ascii?Q?PYeE22SYCbSUhYQ5whcbm2TwyrhRoAFatNP6N/qSnaxcvTGck4oGumX7evmA?=
 =?us-ascii?Q?61nPozYcZI+6W/UUuHqO27XtZ685uVWVInl1N5A/ECZ9PbW3FvLawNQ098cV?=
 =?us-ascii?Q?MSPNoS1Ix+RZKlX3ZLth4QsL8DoZbJLd0bgAb1p5mNNpbnNdIeA8+X5O6Iqi?=
 =?us-ascii?Q?2xVmZNIP5P0QNd8zC0FNFeeA/+oPqjhPDEEWe2trVR+TTtH+QkmPuUB3ECsp?=
 =?us-ascii?Q?MyRvP0FcKIHkNpoPSr/20UGacyuCnXKsxDG4qDOH1RQ43cOkBUDklHcpkr8E?=
 =?us-ascii?Q?hACtAZKIP2BX5iLH/h3NuFGFuCrX8zSk8VVygG2vrjzHw4nR6DLkIfAH96Kq?=
 =?us-ascii?Q?axA+dkS0vcLhr7p0AzBL6F0WcuE+vqS2XbCldP7lLCAQPj3QdbRfHBEGLmSW?=
 =?us-ascii?Q?AlxJYhOLXoMy4MCnxIoxXygTO92WdrVIM8ipfKhuc+iv9NfU9OjNEsLo5/zi?=
 =?us-ascii?Q?AoIYNqRd3vQiDg92Z4r8goDfEjuT5BeZqXXgtkQnEM8spB4E7kq3JZf1ysDB?=
 =?us-ascii?Q?BNwMekOCbQirDa9OhHmhauGHkDF8PZE0ok4hptAOUZSEXrsZ4g3LyNvyk2GE?=
 =?us-ascii?Q?AN27oTXB0sk6fzrGl0B1phoSs6e97f/bMnLbPGPXs/z1dOehMFjWRP+8PPo9?=
 =?us-ascii?Q?jMpOeBmEe+hjtHbNksFIrQGNJxd/zVLzWEX26jRYKZVuDpsbvBPv8vq6nL1q?=
 =?us-ascii?Q?bea6ILm2mx2Ew3MGNXHxLoP/ilmObOObZUyai17E?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2ecb66-397b-44d7-2464-08dd9e51ab75
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 01:39:36.2407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OytGUn5BKQKgGHOJTtIP2b1IFOb6/Lf5yvqCKcuUQhE5ec9xT3DiiXKaf80ZT8WGJJis4/Z1bJFUrqryIIH0Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAxNCBTYWx0ZWRfX6isyks3GLlbb EthQzzfAqTNcwkW1vgmTOX/ZqIwwlHlzJbdWqt+7Y3JIpPSWp2oxZuZtFRlvXOSpLTH6do5Iyq7 0nwh/QFowwZRDTyVoKKuEaBkHG8LtG6LyaAapaIokYXitvVIFl7pf+FeHUsCG08U5aEQ1kfthvg
 6Z6IrPiMj1SkptecAQyxaY4Ws2HFT+fqhjmhii4qkq62NdnMhJ7fxEO6CLnt88JkxURUVwP9EMs 3A1L9w9HgSFoRMBHcn8b0vNqP5vIPw5a57tp1kbv2ggbX9hycE0yPMu4Bqz+kbgVaZAvQa3G7PT qNpLF59cMODSD2flcSMApAdNQlIumbMdyFCQ5lzAx/EPqAiO2ME6CQ2l/hwVIMtpfQ62Ph7iI0/
 9jUJ1ViKq1DBMV3GIR1AmBTKSOb2v+HpDaOzk6jqSvnHlTlWtFys4K0jCsl92OfIOABBkKGK
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6837badd cx=c_pps a=RuymQIG3+YzwfY4kumoM/w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=8AirrxEcAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=uIceyLU7dsuyyLLNaGEA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 6aWoyLHtb1NGOfMCOauKlN3Cxu9PP8Ms
X-Proofpoint-GUID: 6aWoyLHtb1NGOfMCOauKlN3Cxu9PP8Ms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=966
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505290014



> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: Thursday, May 29, 2025 12:16 AM
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
> Sorry, forget previous comments. You are right. It is accident remove big=
-
> endian at watchdog@2ad0000.
>=20
> 7c8ffc5555cb should only remove big-endina for mmc nodes.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>=20

Very appreciate that you help to review my patch and make sure the fixing i=
s useful.

Thanks,
Limeng

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
