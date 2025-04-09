Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F29C250EC;
	Wed,  9 Apr 2025 01:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744162586; cv=fail; b=Au4hkFl+XQ+VHIbc9mg1EPvoIP6bhNeeZAVYQIds2pWo9Ealqkcwl0uDhEFCrg3pYk21GxaQ7ISXTwTv8w37AwD2f1bsELwZ9rp9JNCIcrxJIFSh/277xACiKMrKE9EsIXyEwH0BCzIw5SincW9XzNvhux3JzjC5rUCryiCo7jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744162586; c=relaxed/simple;
	bh=TixumwzpBRizC1lTMq9YfiQlbJ6sh45nUDSLLML7Z3Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MwRHg3NeCCA1AX4PCZgppazRDx6pFzR5X1mYiqMM8uTJiZRq5dedFP5Xazt3LCAxAHrFqHSlXccK4gljQin/PhJ/+tmXjWwRZ+K5aL0SMuQ5kAKeJuQmsD7WdYJhgplCT/oBW7s18WJPe+4UzXm47EBGoxQ4MM9zqKF2s+CYoK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NK5EtlLV; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NK5EtlLV"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539062Wf002723;
	Tue, 8 Apr 2025 21:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=hytRn
	BpEX/QRoSFuzf+6im2acOV7xj++u9XQIFZktnc=; b=NK5EtlLVusnGJjZL3julE
	hqhoJV/MBkbFhCW48/kLD4UaoQaXbj6PxwjrfHx8a+RT8Eo7O2sqEqp399/g0m6r
	JhRjJQqkXwr5QRI/PkCzIeN/eewl7KynSXM30SeO6AnNEHGPO70IpawRIq579zbA
	DwmtzsHjEpYYGU5mDM2XiQdY9dDxGDxK5IDzWYlrsDIGjYIHQWumD5dlQ1obY47d
	JFYhi+dmrjhHRRyuMJLWIFJhOtknurcAW+NL7Hl5P1r4M+8+2tYtgd9IUwIi7NrR
	nnxNrT/oQXn0vCfv0s55L15vO8Xd9uZBqmyqFUzmQfCvq/L7fxaQZ/J8eHXwhrt1
	Q==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45u1e6avgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 21:36:20 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIY/3Np0Hr5OfIdoCTJaoVp/tQuuCDI+JJuMGrFifvAIAlb+hdwybHgdbiRfhhMyckLgOXUHv2YAScq0c3nr7NK8mL4qwln40rRCLWHiSmVnEJYRZdvrkPci16ge7x1UZWQkzDpOfGepSk6/znZdh+7P5ntLqrCixjXI8L0afaOeg7zOPPJwf4WhiG1LrskkLMer6XvC+Wtf9WduLs8TiIf8Cscl7rVJoCVQ41XXoMuLkGAgQB+gpavbN4I6+uikcX0re3yvakDhW2G5gPLEEmR1yApJVJDlj03pSWJew5Z79mue/GWavtPGx9FdzFDIQGr1+9BNhrDjm6NYdMEzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hytRnBpEX/QRoSFuzf+6im2acOV7xj++u9XQIFZktnc=;
 b=S1Ok0ooFLy95U2ySDVVuOj8/648ApPMbzNABO69ZPTYCQaAnXyoJbywNkoZ1GXUrjY/KTS8lU0vOXLr/RXgVLy2+emoVKoc2HrGnpkbo8m9m1XmoGe5BNRGWiSG2n64mKH7nvmgU2WQlGNEjAiH7qJC5jAPyEI+AeoskQTdHatP/boJ93IdHLDUVldFeh871QSlbJcFxnoaFj6fbo3pOm9jZBYcxdcnu6a6IBrmTn8RXKTJYcMweKToy04gQRxnfV+HJOuh26Xygga9GnaKK3+Ajk6uoM/iGQbf+rWppFLRPXzoyshU0KPsejVxZBvJidRlS77bNWqw4g/PSNguNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by DS1PR03MB7967.namprd03.prod.outlook.com (2603:10b6:8:21a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 01:36:17 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354%5]) with mapi id 15.20.8583.043; Wed, 9 Apr 2025
 01:36:17 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v5 2/2] regulator: adp5055: Add driver for adp5055
Thread-Topic: [PATCH v5 2/2] regulator: adp5055: Add driver for adp5055
Thread-Index: AQHbqD5fZLQo0oB1vEa5j8/ciufTw7OZnL4AgADyJoA=
Date: Wed, 9 Apr 2025 01:36:17 +0000
Message-ID:
 <PH0PR03MB6351036DF0474029CAC68B05F1B42@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20250408-upstream-adp5055-v5-0-dc58d98a7a3d@analog.com>
 <20250408-upstream-adp5055-v5-2-dc58d98a7a3d@analog.com>
 <201f221c-1fc0-4a90-a2f3-7ae8dc31a7e5@sirena.org.uk>
In-Reply-To: <201f221c-1fc0-4a90-a2f3-7ae8dc31a7e5@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|DS1PR03MB7967:EE_
x-ms-office365-filtering-correlation-id: 3343119d-fac8-4d59-85e6-08dd7706ec22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wX0rqvwBhg1bq/j4MEKpduMuLt9idxQR4762Ngqu6TzjdRHmzlM7phAzze/O?=
 =?us-ascii?Q?rRpLC4jFfl+uSuDNwJM/RZeftqB5CxoVbNClFIhXzZsw5LAm0Os1HCr1HCVd?=
 =?us-ascii?Q?kGANQqWBs81YN8ja280kc8d6Gg6IKa4GPXFHhJHohkLk7vH9cFqSzxisZ/Ar?=
 =?us-ascii?Q?c4itJouegyabFMMpJx9HqzmgXv7+BwMi+ybRf7HpqNVy8JDh8v5Hb4s/LpEy?=
 =?us-ascii?Q?G8mfH7GPzHfDeN8+AuQs7r4AhUQWhiA7OKcKwJah7WBnnqRiaXFqJdox5pE4?=
 =?us-ascii?Q?2sdy9x8qSzxdWEs4xvGBQvgyCujahsmMY4U7ZP/rk+VdxOoX0dXjBMrqsSHo?=
 =?us-ascii?Q?/dr5ALVzCsPkiUq88W28Co3rAXSzaJBnjc6TIVr7tnC439uXXQ6UfZ4Ngk/5?=
 =?us-ascii?Q?4dHT4bLFq/NeyeDnbdEkKkzKQMf1+f0fsCbayZwhc9zCqy3UhjPlaDUowK0E?=
 =?us-ascii?Q?zH1rKKP7Nm8LQrhBWeRVUJiKAH73iNR8Y6Q0s1CPYeNaWhrB1T4u8j6qoUxr?=
 =?us-ascii?Q?/iAghQnu3sP57Vj3uLHpoks+Z7g8/Fo0OkE+mhfMMnusjieMONmWD83iZzhX?=
 =?us-ascii?Q?dixRISNrNDzFIqN5/BMXhGJQoNXOdm58V/bh5wmHi2zjrD8cso1CH+i7fViS?=
 =?us-ascii?Q?HTwH5QVAGXwiEnxgiuvs8+BU2dIXNaeg1F8Dc3v9o0gGY4W4IixI48xXJUpb?=
 =?us-ascii?Q?RsQEGBziaYA5t31QJf2lwxxdeQpJyfnKV6+6/J7loZu7KuY/dc3N6HWiNsnF?=
 =?us-ascii?Q?l5Q7FSlFKxgaSbQ24OcW5B9/W3e7m3dDqMV2ucaIvtJkAfpAfe1HMA7orWKj?=
 =?us-ascii?Q?bqkVhaKdaeYW+h6iwueLm8ZBWf/XHqYXpq/VcmmHlfqe56VSETix+cWrmlUr?=
 =?us-ascii?Q?GG8EmAVLYRnA01VIiUFyi+/FQsKyaokwlawerC5seYXWBFJkeyGc6eUY1pUh?=
 =?us-ascii?Q?ojrbCai2Fb0TCF1wWrCpqM83Xhhuhh+f28eDhWZ+Spr/78b8G4+ZAAS+EeyB?=
 =?us-ascii?Q?4q4iCdzSbTcng/WrZx9IVDWxxOh8OZ9saHI0Rpr8dBAVvpz/xRcn/nWTUopH?=
 =?us-ascii?Q?JZyK9QdFg8DWf2jILmb6Alsz3SzWeuzRI3Em32JT6/TRVTjok3VBnrfAgujh?=
 =?us-ascii?Q?mDTbEQ3NCFuzUVRGTeh2WjWVWRnQW7g04qOYDKPEDlzMEMHNkhDr6kuqRbIx?=
 =?us-ascii?Q?NcqpkVnxJdTQdReTVu3AK+5P8aKwIAfd9da89k8WJqUurkVE+EEo6STisCS9?=
 =?us-ascii?Q?KYLXRV4bR5rFUGIFqf9Hr/xEYWOw6xQR9UTd16KXKGGpvooy4ATankrqVT1s?=
 =?us-ascii?Q?iL6bWgG9bMkXT9urcBVq7RDqrRc4e6C0hLkRKVcvQ7T4AGmiRzuaooOq6jz+?=
 =?us-ascii?Q?v+3iJqwJhsCDYKXTPRotQLQiNFznAzeDQu3PaVPTjRo+6p6anqQJVJ3IJhtn?=
 =?us-ascii?Q?jy6bP5XbRDiD502ZRUCEj3rQWkYPiUA8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?u7T3bPYOlv+JTEN3kk7C1VMgk1hWnNsnOo/WFgQLiMUYjac4muOzkbIcyhrd?=
 =?us-ascii?Q?2DmTlL06DbyCDHROjzbU38wT3DEsU9CnJSppSvhjshSRKHdaaY053OMaC9rS?=
 =?us-ascii?Q?y50ZiciVwll0ZbQnquY4y1PPSowjHORFZPkXtLhauU5v7TxxF3bw1dqa8Lus?=
 =?us-ascii?Q?aLbJFitPoap4wJm6sMRxnjL9+WyDzhIFmQJ6HB5usVnPnu2pljW/Lx+mDLCh?=
 =?us-ascii?Q?mAT9bWX28wCzEFUVxl1F/eR7bfFiroI+jUoCGFlJDgS4syn4JHbT0JnQ7ZvJ?=
 =?us-ascii?Q?2sLq2Cw1PMzQ46ZmIBjjwpCiiFW8t3JLvZUUavWvGCdRSEX+aA3xM4YtGhNi?=
 =?us-ascii?Q?q7NuqMGQJLnBvYCBXL7bIZMpL4H21p0YexiJuy9qPVX9mXrOlE7ML9KeDv4P?=
 =?us-ascii?Q?63hRTeEweFCnH3MvIib6nwjsEtm7kW6GkxkAFd2FspXHwfy0dARNh3j7WjV0?=
 =?us-ascii?Q?aWBftGELtxYlFgU94eexqmSvto526RF4ytq380pZFa//iF8dEM/eJmLTmnXz?=
 =?us-ascii?Q?yyCdNsorjMyc+iFWSGrwTSNR0TZDotd4qVl7hToUNad/TAcBdIa+zIJhGwez?=
 =?us-ascii?Q?H/ZDKsxP6qrf3K09U86HRHPUo4TURS9ym/06IIIz/baolQhEc6gxsbFVp6Ne?=
 =?us-ascii?Q?ie5Jef4cAbC4orEJUNougbty0EPVwUK5+tClC819HLG91FzjTqodovIWCQop?=
 =?us-ascii?Q?I1lorB1Fzhe+qRb6OQE2hT1LlHmEyhK/y+/Tz9y3AkEEbSby8G5nZF6F3lB+?=
 =?us-ascii?Q?fcoTxgejzkSbw0pio2+e7ujkYriL6o5t8+byJRIZqPB3fn5UO7acAnaf3M7G?=
 =?us-ascii?Q?+vHyRywedyDu3DIuKU7WwM7tqzNHpi6d9u9nAwbozgkpFDni2HRgGXRdAcuX?=
 =?us-ascii?Q?EMZmsVt/CvcpEMaJ91fg1TnVarFNS0fBzAzYOWRgS7NINjAGDElfHS1WyY+4?=
 =?us-ascii?Q?fvs0JkmEDVUni/Sta4VVGNKD7LF6llitiRXl/+Q1+xHxAz8lacchyRmY7uf6?=
 =?us-ascii?Q?kkNNFecwKqgIK1zuPQLrQT3srdqR1h4utJGTgpbMa6BK2wz2szyoAQMdz8Hw?=
 =?us-ascii?Q?X18btGy1KdbHtBaOFFHOYlAvsv1aKPeg4C+ra7Ym423oLsgkAT3jiQ/oPEmB?=
 =?us-ascii?Q?HCpd9UDra9uhxXU/T7x0ZrzlU8n2NX0MZ8mF6N2bKIpq3IjCEtEioZYacsT8?=
 =?us-ascii?Q?pHQAK+0nQuWfwcxmU4BCUhCv33QM8hGhh+nMN1nqCvlA0+r697ep7rbANl77?=
 =?us-ascii?Q?jOpXly93uLVybz4zqyEvDI3N35Vij9IrFwnDtnx+a5rmlMSOUv8N6mnmCn9e?=
 =?us-ascii?Q?C+ofS5Odp+9nAJdSRkFOR+8hcb7IJmLa3ewbDhwPYsbQf9epj8qcPnJc0YLq?=
 =?us-ascii?Q?J8mMEJZQKnQItWuOccWWFXxn8TQK2Cg8cVGbDvnxi0dgmpirBj1pIl9hHR+v?=
 =?us-ascii?Q?cLw6UcabUKrwac8PUZI87hffDVPdYmUMu3LSgWkRjA1OsNlqMneIqhQrcU9p?=
 =?us-ascii?Q?4CzF11oxFkBhkPyUNKDcVO0WRxT2An/fFkrt2PON0rob6ZScC2z+rXK6aEia?=
 =?us-ascii?Q?BWMARGHRhFlPro+WRMs0mgRmqjmyr9F58/edhWO0XfqwaG1nTY2lxB+MH07e?=
 =?us-ascii?Q?IA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3343119d-fac8-4d59-85e6-08dd7706ec22
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 01:36:17.1461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65tzldLTtRqlWnNXsSOmzlkeU6g+CI1BiTZwe00hx6M1OACjISyDua3GSv7oQLbK+AGkiarnv4qNEpivbt4lCpeuSRDuAXakBGavwEzCJCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7967
X-Proofpoint-ORIG-GUID: oES2idt8aZNFGKalDsps5MiGMgFYEJ5d
X-Authority-Analysis: v=2.4 cv=cdjSrmDM c=1 sm=1 tr=0 ts=67f5cf14 cx=c_pps a=VzeH2YOhhDlPZ0WtbyP6yA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=pGLkceISAAAA:8 a=dOwKz_JuBimduIRG-_0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: oES2idt8aZNFGKalDsps5MiGMgFYEJ5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxscore=0 clxscore=1015 mlxlogscore=858
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090002



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, April 8, 2025 7:09 PM
> To: Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org
> Subject: Re: [PATCH v5 2/2] regulator: adp5055: Add driver for adp5055
>=20
> [External]
>=20
> On Tue, Apr 08, 2025 at 12:25:49PM +0800, Alexis Czezar Torreno wrote:
> > Add ADI ADP5055 driver support. The device consists of 3 buck
> > regulators able to connect to high input voltages of up to 18V with no
> > preregulators.
>=20
> This breaks an x86_64 allmodconfig build with clang-19:
>=20
> /build/stage/linux/drivers/regulator/adp5055-regulator.c:169:3: error: va=
riable
> 'i' is incremented both in the loop header and in the loop body [-Werror,=
-Wfor-
> loop-analysis]
>   169 |                 i++;
>       |                 ^
> /build/stage/linux/drivers/regulator/adp5055-regulator.c:160:34: note:
> incremented here
>   160 |         for (i =3D 0; i < ADP5055_NUM_CH; i++) {
>       |                                         ^

Noted on this, will send a quick fix
