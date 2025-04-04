Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35A3481B1;
	Fri,  4 Apr 2025 02:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743734018; cv=fail; b=psUBl36/CE7G13WRGZx7WwU6Y8dZBQWHIH49Uqy1GWUlTKwQe19zpN2a9zr/JkBul3Ux4UJcyBNaCFSz90PoVTs3zx3SmXAqhEf5bHslgMD16IlrfzsPQTcknUOK1pvOjh4ea0uUp/WqMtDaenYBt3vRfsUXaCP4+geyMWyUpHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743734018; c=relaxed/simple;
	bh=OXy96lt2f4FsfFXlYyeSRCTVy/I6oDtwsGyUfllVfCQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cWUILAE/aCJ8zzq5OTew6Q4Z+g2xXP6ioXVV0OUAvdO5Rk1NyKY2/dc67WOywGigEs08/2/l+afbJgfpcZti6AMvzzYRd9pWgOSeIcFiWo5lrIvFyo7cwoqaXJ1BeCj78Cv084LCkL3uRJ3aqbUonOBh+k775fuPiIh9WQLs4kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=p7GnNVdM; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="p7GnNVdM"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5341NHlN008748;
	Thu, 3 Apr 2025 22:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=sLPmo
	Vz8FxFpYzh7jFc4vJR3NcNrOCJoH3EE2FTOxrU=; b=p7GnNVdM9OuUeyEXcNPyL
	/uYt2MCfBsNC79Q+SOO/FO/TbSBej/v09ajLD83tnFO1WMgMGKwRMf/WhJOPagd6
	z0RV6i+r8v5HFGSvi4YRYH+ItWBiizTzOtdblpIw6lNUh+uHjZxxET8B3Va3vING
	93XHwh67iVaolstH8Up8+Fr6AumRvi1BpnfcgC4WB5/DMEgXX7S/DRG9qUuz7Xki
	yDhn1XrKwZNImL1AUp9rUyYcSt8V60DiKuqtOruwG/hlX+cVzfB6ttRqm84/KVQ0
	GgWvpUZNAty2m/BBV9JKZjz1abtRYFN/CCrj1fx1/LIVnGMTLyhP5ncuNe+g1YDH
	Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010002.outbound.protection.outlook.com [40.93.1.2])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45t5qeg7r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 22:33:32 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2yITlQcqyUJYIKF/Vn0XFUbb6k2GYm8ihfczPCO8eZb38XUUWbne/4+kMtva00l6T+E6Rl5RhGi+MlHvj9wONUNkOTb4DQvEh6fLj8QUVJwDkXlNz3Ot6MG+wMADdsWLf3s+JEyeI6dM4EAHUR2arBepb3Kl0Q2z6DH+Oz9pgtas6s1HbY21w1iA9yxQWtsZ16n5xN8fP5C8vkwAjv5INuoItkGWClnPcPt0aGdJ0cSP7X6wi2duJcfzBEwd4b9sGa06l9v5iNxJ9CFZ2VwXE0JedqZUs2EPntCMleMFjkHEmmsWFxmjMvzzMwJaszM0MFPKTtt6K8OC51O/E+2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLPmoVz8FxFpYzh7jFc4vJR3NcNrOCJoH3EE2FTOxrU=;
 b=RAtx5egSJjbJnoSVotiV4N4MdEdKIEF8RIQCCNC6BY+BpWp1vIa3ClXtvjwjQ4uAEJeZ64xhJII+dZoISwiFkWd3ao4H3TvmCt4O5o/BnUSlhcqLzpekSEaHtTO6rSa2IURY0R6GGxcJNe7cPSDP8ultP22TOwt3ORxQiqM0xd8MRKalaTER+z6M9TMG2VvcGgpTZ44YuAmUuAU0JcVnzO+VWPyKkH8hbOf72m4u1tcbBUbP+Q4sHjGvjz+Y7h1n3c2ffqiF9XP4Q0o5/Smt30x/EPQypJNQeDcPbHskTKnBTRycvK6aMZ+mqpuBAQs3LfDQ1r/l6+V2HjlizLwwlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SJ0PR03MB5488.namprd03.prod.outlook.com (2603:10b6:a03:287::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 02:33:30 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354%5]) with mapi id 15.20.8583.043; Fri, 4 Apr 2025
 02:33:30 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] regulator: dt-bindings: adi,adp5055-regulator: Add
 adp5055 support
Thread-Topic: [PATCH v3 1/2] regulator: dt-bindings: adi,adp5055-regulator:
 Add adp5055 support
Thread-Index: AQHbpEKj5B65eni/nEaUULWKiEDdAbORfg6AgAFCHyA=
Date: Fri, 4 Apr 2025 02:33:30 +0000
Message-ID:
 <PH0PR03MB635194B6CC9F95E418CE5638F1A92@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20250403-upstream-adp5055-v3-0-8eb170f4f94e@analog.com>
 <20250403-upstream-adp5055-v3-1-8eb170f4f94e@analog.com>
 <20250403-unselfish-thoughtful-wallaby-ccd38e@krzk-bin>
In-Reply-To: <20250403-unselfish-thoughtful-wallaby-ccd38e@krzk-bin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SJ0PR03MB5488:EE_
x-ms-office365-filtering-correlation-id: 47727ad8-10ee-4aa6-c7c3-08dd7321166a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?A4qAGdO4Ps679NKc2QFKxUavaXdZBtLzgnvIQHNd9H/StAT67+ZwRQ3W13K9?=
 =?us-ascii?Q?O3KxR1+zo2g8bduYz0YTuUrGslv7gBlq0eRmhOeiR1C6PK2gMtPq5+wEhUtM?=
 =?us-ascii?Q?vg0livARC4wK39CrdprnMwsw5h8dIA3UoxmEFvap+edfq9qIn/uCfTPthfvi?=
 =?us-ascii?Q?6ibAgM+HwnTJtWj9KPsvkR7OE4d777Bh5EeiSaH3cA/bOEFUfk2sMtSd3m9A?=
 =?us-ascii?Q?Hx/e8F7ATQ7ZXFmCY5+5JMBgLDyzrK1JHrZpTLm9W5Yl16e/1sRm6M0a1Mjc?=
 =?us-ascii?Q?peoRxG813GTGXiMwK90kKCEnofY/DnC7lDFdpZx/jnqVsqXVpoObGNACWJdR?=
 =?us-ascii?Q?Fy+Jja0Mnm132bcT3zpRlO+ioi05NEmEWpW8U+JA4tXUOG9xz1oWfZvYcWZT?=
 =?us-ascii?Q?movdyzOXoye4FZHDNqgrOqJHxZMnsev50XUMZYtrmgc9Ta5rjFj6dHf/9vnu?=
 =?us-ascii?Q?Z+UrhOsiCPAraxdkB2UNCVZv8xhF+4Ez8k7M6qgg/foXfMVztjofxnV5djAu?=
 =?us-ascii?Q?Ju9viPa9HFTmArou6R4y9xWSbBamFA+HF3KwU35xRx0Gp76LT+TUJx7iEed9?=
 =?us-ascii?Q?fJ01+RvgmrMKyUE+ZpQR0Tn4wjIE0lBT4mWlasvlaszlgtyzHCI16c1RWVC3?=
 =?us-ascii?Q?gwRJQWs/WLzQKRvOA5hBrEa4JM0i5vxm/dLZA/m9uuP1YkxzObIvNQNKBwDC?=
 =?us-ascii?Q?xHwlMz3Zon70N7eB9YpD1la5q5EJ7k6LmwN3JBEFiEaOadVhtnw8P1YF0NxY?=
 =?us-ascii?Q?wc2vseZ3YsQ5Obj+4m8H1mHWJxqDsdaIOabN9ojl6nolyBXI5lT2HE55e6vc?=
 =?us-ascii?Q?EBIPUd6JXGe6OSfqDW05NjATbI7H6Htz4tmmSN1vnUJ+hqS39frBdlX1anaG?=
 =?us-ascii?Q?W+tsHFsHsuJUTcz44HrcDtN/z0ZZtQ1lSGosIbhjgvMzw6+DEqewY0ogb4fj?=
 =?us-ascii?Q?Rc/d4pMjofplkyhvl4YuUxVdt6RsJVWoO/gXbeE6o5iWaera8ywBjsdApsZd?=
 =?us-ascii?Q?pj2FwhIYxM2PSxfWQd9f52hDOnC4b36O6190LLqNu5sAcyF8U/kZkadLhnCL?=
 =?us-ascii?Q?dIH+dDI7+v+qvaw0gwGAlDn/sxJcGWwzv0QieHeNeAE5MJ1o6ZLWmAqJ55W/?=
 =?us-ascii?Q?wf3VeihJxLXhGTUJB4U5HuPLsfSeZp0wFo0YhgajXJXltuEx0XA6aTVIrA5n?=
 =?us-ascii?Q?fRv+VAQMf33HH+0kqCV05Mq54HLn5KsMiVYFU9cFHtopVjFJ9JxT3WbX4Xwv?=
 =?us-ascii?Q?Wnf/qqlMCTpMbtVAQG4ZUGPF5ETrFJzLyLttrsEebRs4QDCDOFafkjpzKFFl?=
 =?us-ascii?Q?R8dk0V4P4oRSEpai5jrXvAcbOm/iDJK1D3JM4wncEH7R4KzprbZsa+kNqSlA?=
 =?us-ascii?Q?XvQY28VSZEZmwrkxsCXlCtSMtTqfV3i93TFiDKNb7T2Uol5vLgArMCnrD7yl?=
 =?us-ascii?Q?78CVDHG3Reo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gnE90tf3swIff+5uXZBhwVuK6vseEF6NszgwpxrmZTMz+4WXP7u/9fJrdl96?=
 =?us-ascii?Q?c/MIysi1892JQoGazW0QPBwsI1NvQUbpjsTPJZHGShv1lxa4GV8Y0v66ZoJM?=
 =?us-ascii?Q?SpqjUUY/yHgfPwosamubwldBZmSDwWgbrGlVASKI50ZpLUlHrBrNoxaYpIBF?=
 =?us-ascii?Q?/kgVC6x9Nq+vJ0R2hkd1vw5r5jI0FohY4OXcMGDclBeUBy8tvTi3jHa8wCN3?=
 =?us-ascii?Q?vci4E2Y9O5W9n9Z7i5XmoXGkmAAB3+7crmZ8WQblDO3EpCOYMXvqsbvGkEEb?=
 =?us-ascii?Q?8d5V3EnPF9JnvQi+tgbIun06FMX0WxVpe7jP+Y2JrCFmLviNIQVpzN5BLtyS?=
 =?us-ascii?Q?wF1Ri6NQfXbyPlgB4/OURYVcZQ4nEdgdLkfbSCiyIASzseX9xkpuvWeWm2WJ?=
 =?us-ascii?Q?UL8MThglXegzCBj27gA3kZn8/U4D9byyT6mL9KqM/mh9985Kvddjm+HlER0d?=
 =?us-ascii?Q?m+Do1Z/VIgskHKhRnSFUI7xdOPF+/xQ0nXgPsx1W2SbqTum/xpZv3fMMU3+k?=
 =?us-ascii?Q?1BzYiCsXh6uVmCb32LzRVNjl0/Lbtr4oXH/9O1IbjYezpk8LGaB9GYOvQFIZ?=
 =?us-ascii?Q?TRVOtBJTahn+A0Sp1moklGE4FVYxjzJ/v+vVQC/ryzQC5t7s0LG/9ZryfC9N?=
 =?us-ascii?Q?aqq8ZwYjCudCXHA8nxsKIaPQmn9Ey+gLV/sbXEx32m8nmdHicLq4CvGXsN7t?=
 =?us-ascii?Q?+vmZfhPySTi0xl/WTMDcKFgZUbYW17OwO7T1xVlhUbCmz7LO7pX+GAMr4Ehx?=
 =?us-ascii?Q?Kr7qpfO9Y7X3Xqq8IJRJew8hgCdXq31sbblHVIkqIO01msSzPiZ2HNys5LzN?=
 =?us-ascii?Q?pVe99SMH+r2XjtKDpx0OumhKCLNWJSYl8kDlq6XSZfzVwn5/c8NLJ4ATAN5V?=
 =?us-ascii?Q?Y5IbpO7Z29FFpLqJw4UGh73ITLOTSZvVgaYbTf4w0GjfZMNlphDSWrXQ/+he?=
 =?us-ascii?Q?qUc1iOjm1amYVuLme9ST7hyX29iL0eFTS02pxF21CYyLsEJZPBhkO21z3Fsk?=
 =?us-ascii?Q?XfWrKpN9NB9ezTcUwabRbsr1Gie4MruQLTmXdJHWomJ0pDvvusFaQXIgWStF?=
 =?us-ascii?Q?zYpxvm+iNpPcggpURDudtgSGAzXWXACRvQoEe612ApK0uCmrm0Ro1ZmEfs0+?=
 =?us-ascii?Q?nRrD08GbBHvVfi3m03sf0le6jJ4FT4EPWfJXH5Gx5JVx29ik7sJKvpuOux16?=
 =?us-ascii?Q?YF0UZ3UBw4VJ9R/cAlgrZ1x8yrgCQU+aSaR8j+nU4YG27wys9Npj06LU4/RT?=
 =?us-ascii?Q?yqy5HKzU1BohC1hRyVAup+/+Q6YIkXilpSeu5In8xdMlU/gDCWs1PMm81Qkd?=
 =?us-ascii?Q?uJvdr+pCsmG5hyhA6J9CKro1lCNp9yKRI2yIoB7m4CN+p/SJG2ajH9EA8Lnm?=
 =?us-ascii?Q?C9FYWUIHkQ7gVIMd5XV8ZyexaZ25cK7PX5hBqlXNa64OD0ppeLOJ2MJkC7kX?=
 =?us-ascii?Q?Gj39+JDME3AJPQT6cNVhtqDnB33Z+JCN5bag10louLmxUgDQRrYyFT7AfJ+h?=
 =?us-ascii?Q?ZbZnWHZfGvh/UP5zWdeLACyqJSPHYSL1eSAJaEVKK5rYCdObC/oHhWu7iZXy?=
 =?us-ascii?Q?oKRxW8eXXx9GeHHdflwc2E54IEDNY0zKhpmCRVonuq3yx2gyfWts/uvpAU8h?=
 =?us-ascii?Q?yg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 47727ad8-10ee-4aa6-c7c3-08dd7321166a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 02:33:30.3153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nD9sjXgKa/Qz4bjjwNf19DjoZz69dWKkWWUC+4Wkcj6cVFIdzLwi72chcPo+eNO9nmLPrW/NFwbMprkODtVV2ZB4+6QZLYWVNlqMbyJTVcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5488
X-Proofpoint-GUID: A1hcxm6qTQAizetBrUxBi_ko3jEhM4kv
X-Authority-Analysis: v=2.4 cv=GbMXnRXL c=1 sm=1 tr=0 ts=67ef44fc cx=c_pps a=Ku5Q1SXtyGRHaGBacwLxwg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=IAD2S347gZsQV-wPC48A:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: A1hcxm6qTQAizetBrUxBi_ko3jEhM4kv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040015



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, April 3, 2025 2:40 PM
> To: Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Mark Brown
> <broonie@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v3 1/2] regulator: dt-bindings: adi,adp5055-regulator=
: Add
> adp5055 support
>=20
> [External]
>=20
> On Thu, Apr 03, 2025 at 10:43:10AM +0800, Alexis Czezar Torreno wrote:
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^buck[0-2]$":
>=20
> If there is going to be new version, use consistent quotes, either " or '
>=20
> ...
>=20
> > +    type: object
> > +    $ref: regulator.yaml#
> > +    unevaluatedProperties: false
>=20
> > +      adi,fast-transient:
> > +        description:
> > +          Configures the fast transient sensitivity for each regulator=
.
> > +          "none"    - No fast transient.
> > +          "3G_1.5%" - 1.5% window with 3*350uA/V
> > +          "5G_1.5%" - 1.5% window with 5*350uA/V
> > +          "5G_2.5%" - 2.5% window with 5*350uA/V
> > +        enum: [none, 3G_1.5%, 5G_1.5%, 5G_2.5%]
> > +        default: 5G_2.5
>=20
> Missing percent:
> 5G_2.5%
>=20
> With this fixed:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Will fix the small edits.
Thanks!


