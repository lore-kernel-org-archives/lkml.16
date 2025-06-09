Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D72253F1E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749468757; cv=fail; b=rfvORZ2aF6TnQL9t8D0jA9rkCYb5Oe66+nQJGbANJHSjtO7hkmvNqT1BKjK2KbVY7smWfZi2MdeGdBgcZujdBHYaU4LApO0b6At8t5vPlfwPkQkho8nxNPzeHb7QJ9vsGfUDrJeAi6Ay7XNYXJiCnKaqIIcR/e23i3tdK6BTA7o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749468757; c=relaxed/simple;
	bh=Bx2CPxcRnMfbzhsURCeG7FrWBeGhX6RjdeSYRHm/GUo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VFDMIR9UrVC0+eoIZNEWCL0/+t2DZKlWYHNUhoXxhH1BBVyy3GadndCBd4Z+JK7FnC3RTx4XFDiQI3U2JF3Ty/Mt8Fse7LlkNmesYdPc90LjYcreIkyXFI2BX4VyDTUcGuA33X7IwdtIDxXNMGz3zmWf+Pvd8LrboknrJDKQo1o=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cS+YZCz7; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cS+YZCz7; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cS+YZCz7";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cS+YZCz7"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jFBHy/Lu5gL0OdMvqW02h50vQIR0ap1q78aQoLBuv8ONsexiltS86oPZCEeT1o3g3zflA93Tu01qx3N+XvykH440mqwpEiCOBi0Oc1FDyWnA3mRkzsKyqso2OWKYOnk09jdAoIjdY3kE4mq6iDRnYfSfB6Hr/RPeTsvgfeJFOFnC6j1wm/EZLG94J1gxFxoF4pDdYTFjJH3kZlMpfdbIbJA50o1XHMpKB0MAa61bjjwPHGo8wwmSi9bzSVeUGUAbrqZMs6KqCqQxsZmvIDT4FKFKlPImhJvRXMrUiIcexg5WNpS+4P7b3IuwDp2A3NItjjb68isJW/6t+Sq2dHwE7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfSNiV8Uws0OkA6WeqYD0l3QatwidjpGSGvgL06beFs=;
 b=MyKPYjsCeIuZ54MKRUlkBLwqha6jKdtqmkJMuzweNCMpT6wErjesssmx0mynLbCSebWTEDp8JRDXFDhFTJT2iy4cLz07YA+7ESjUsk40ir1p1wDtry7yQoMG34sTwJqYxOByk1if/QYL0klJMYSektIesJx6vMtUu9QbaIzU1WmJRnDQTJQpUfXfYLpBH/AE9CatEIHtPauHdov8u0Z7k7EkyHcv9jKHWvEM2F6rNwgLbcmXddOEtk7JzzLU8rnyszaCHfdVtikjlIvllISfSxcpIjkG9U7k0By7/zjlgnjx8vGS0Smvq1MC/dasd/kN6rTJiaTOAi39QiGrDoMRpQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfSNiV8Uws0OkA6WeqYD0l3QatwidjpGSGvgL06beFs=;
 b=cS+YZCz79vSz2KeekpL2Dix3TT50CO32a6Hw0CtmUT6lmM4SD1i3nWgNyHqRPlUHoDK9ElT7Cv96k6ps6C5yqAuXgvk/FEyQ+x9+WfanPAKYoCpA0yVpqGf5AEy/eCHdQdpoiJPojXQ2b5gOxd+QmIUB4Dxv9Dqfz2K+9BJaDrA=
Received: from DU2PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:10:234::15)
 by DBBPR08MB5882.eurprd08.prod.outlook.com (2603:10a6:10:200::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Mon, 9 Jun
 2025 11:32:31 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::d9) by DU2PR04CA0040.outlook.office365.com
 (2603:10a6:10:234::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 11:32:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 11:32:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvWosvNNPHGPw2g26NXGm0eM1ado7dTEO4ze5qHsDSvRpZ4pb8Jv6RFgqJviP8jAuTZSlVzfrXFFUGK5F60mN3Dix5+lBAYbZlOVNlzGRV9pjPdP+jqIDDnvvQI0XYvj8BghDc+D0SRobX3eYMWuJIFXEdZrDiDvBkvFzZJBBcWRFPJPSiRDgbG2WjSLh+f4CrupNQ679owiMUykWNSnM5VEnxcrIEFcdyCJgcu7nLnD7xaESmmif60ntITz/kd2Ur6fRkTi8Ilq87Wzv3aHVHSZNb9f8A0Nv9jiZhCuNlj7098PMmttvE5gqnD6UqHcWs/5OQx+2ejhkJrqlq6Sag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfSNiV8Uws0OkA6WeqYD0l3QatwidjpGSGvgL06beFs=;
 b=B/NXKEg6JbGS/xcgGHBEoZOs7Bi573ycauewwtvbjIpxeS1WO8bYFp5vRZi7By4/F4LrtUwCFJoiLckLxrh40jCkeUhJ+XhRwXVHtP6swxkQQyOpsPqh9CubcrScETtQ1FsCgwhHFuoFElrA2buF+LEHZTFY0CyaeALMYYyCf/yX5fTNgyOxkJ2Q/+qPdVAuvIb/rDR0T+I6CznFYZML2tmmFb8TPgprwqpD4T2FdxMXKq/AZqrPPY1Aoml+jS3xIAPxvOR2umg2Z++TxsbzoYOpQ23Ri28YGLC3x97d/70zTNinj7L+/y+uPuXtz0qSHe2k6B/b5HWFeim2KmzWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfSNiV8Uws0OkA6WeqYD0l3QatwidjpGSGvgL06beFs=;
 b=cS+YZCz79vSz2KeekpL2Dix3TT50CO32a6Hw0CtmUT6lmM4SD1i3nWgNyHqRPlUHoDK9ElT7Cv96k6ps6C5yqAuXgvk/FEyQ+x9+WfanPAKYoCpA0yVpqGf5AEy/eCHdQdpoiJPojXQ2b5gOxd+QmIUB4Dxv9Dqfz2K+9BJaDrA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB8298.eurprd08.prod.outlook.com (2603:10a6:20b:536::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Mon, 9 Jun
 2025 11:31:59 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 11:31:58 +0000
Message-ID: <6f4c2e70-0702-49d9-acdb-f87adab196ac@arm.com>
Date: Mon, 9 Jun 2025 17:01:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-3-dev.jain@arm.com>
 <f528506e-b04d-4c80-93c3-93ba4ca385bd@lucifer.local>
 <58d53c0a-1b61-4276-bdd5-9eb2e583f865@arm.com>
 <eb0b075a-e6f8-4561-ba3c-3019710847d7@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <eb0b075a-e6f8-4561-ba3c-3019710847d7@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB8298:EE_|DU2PEPF00028D0E:EE_|DBBPR08MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 734d3f42-33c4-4a07-f3b0-08dda7495237
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WUlSaW9KME9ialhQbHhZU3dVVUgxbThxbis3NFZvTzNkS2NNYnBWTmhGZG16?=
 =?utf-8?B?OFRudE1XOWZWNVJGa3pOdWt6OXkyYnliUDQ2ZWNwbDZYbFdDaEV6YWpZZGxC?=
 =?utf-8?B?VUdsdHF6amx0T2pyb08wa0tZNEIyb01zZC9mK1dqR2xyUkRpblFTUytPUno2?=
 =?utf-8?B?VC9xckR2OHZhMUJhMjBZZnpibEZhUXpGajRya0ZJc3cvclRwOWRwVWUrOXJr?=
 =?utf-8?B?S1FaYnNFdkpjbW9JeXRTSVNBNnhGam8xV1pWNnMvMDcyT3dNZER4YVJCQ2Fj?=
 =?utf-8?B?ajN0d2R5MDkxdFRxQkhLMHBWeW5UcjJZZnhkMFp1OW5idFJVMm1wNkJTSkRp?=
 =?utf-8?B?bEhaWXRpWk16VHBCRHVpcmd4WWtlUzhlaGlwd3F3dnJCdEloUjJuN2lSeXJU?=
 =?utf-8?B?aHJua2lXekpldEZaQXZvR3RPenovZEV1QzQvWWlWT2dXYWJGYjJiejRhNGVO?=
 =?utf-8?B?M0FzeTgvakV3dzJQZXFyRWYwWjFnZTU5TU9DZlJMOVlQRUtzQW9qak1UREsw?=
 =?utf-8?B?T1lrODVFVkRlY09vSHNSUVhaeW1xeVZGaVB0UHZGNFV6L0JoTkpmRGxYWjB1?=
 =?utf-8?B?S2xhTmU5UW8xMHlNNVB5TTBNeWRYOFo3QzU5Ti9NRjhyZy84MzI2bVJkTXlM?=
 =?utf-8?B?bnNhQVIrVUNHUFVmckc1OGNwcFgxTTlkQ3pHanZMejMydFJZN0ZseWp2WTVV?=
 =?utf-8?B?NW9sditOTTM3VytBbTdob1NjOHE2Ni9EQ0hNa1I2RFFMQnR0M01adnVBM0Fu?=
 =?utf-8?B?SlhsUXFJcnVLWkJqc0Fiai9QMXhUNGNvNzhJY3MyZUt3UG1FTnNrczczZWdv?=
 =?utf-8?B?MWlaZ0xidHdEajhNdEFIdHFwbDI5WVF6UW44Zy9RdGtSSDB5TmlLUG43Zkk1?=
 =?utf-8?B?TlE3eHNSRmJrMFpHYUNvcnM4QVRlcWtqUmlEUHVqc0JkVmdiWlltdTN0OHcv?=
 =?utf-8?B?R25Kbi9jTXIrNkxEODZPZ0dXU0lRTXhQMitpRi9lYjl1RUVvb0Y1cFYxTlRR?=
 =?utf-8?B?bnFudStSMXBVcUdvRHloSTIxWThVYU9xSFN0ZXRQZDRGSzIxeVprUWlZSDBB?=
 =?utf-8?B?bUpDTHJOZ2JocjZYaWRqN0cvNWtRaHJibGhjc2ZJeGx2MS8wY1oraTk3eElQ?=
 =?utf-8?B?MmdrYXp4NEJldWY5ZFpSUFBBalgxZTZYN3RRMHFBVWo0UjZFT2pWTVRFclV1?=
 =?utf-8?B?NVY0OHFKTHVHbW9XaytJTFBCWFlYYXd1VjJQeU9nditHb1BhR2p1bERDVUZ0?=
 =?utf-8?B?aGp2QjdoWm1acXZCVnZ3b3hVRFVad0prdCs2SmN2VHlDTmlKTk1GQkp6Z0NW?=
 =?utf-8?B?aCt5ZFNHR2NmL1BBbXJ1ZEVMRWcrU2JLWkwxT29sQi8xV3FqTzhuZjdTWE83?=
 =?utf-8?B?bzNadFoxWXk3bGNhRWZzMGQ3aEFJTFM0bi9PQ2hEOTdZeEtmQmVtbVArNjhN?=
 =?utf-8?B?UWg1alJvYUgyaUF3QnNPdTRoQ2ZacE5BQk1vYUI1UVdZNFNxQk56KzRaVng4?=
 =?utf-8?B?cjA1RHBvN1lydURBN1BKQjlyMm44V1FWMHJLT2ZsTDF5SVZKcTl2NWtoOGpF?=
 =?utf-8?B?WXpMaENUQThCV3VWalQ2QldWSFBRVG9TODY0UkVZTDJlKy9ZWC9DMkw2MVAr?=
 =?utf-8?B?Sk1FcnBkSWRCYTJVZ3AvNStoNXNkaGE2N2xKaVNyQ0FuTDc5RVFVTjM3bFVJ?=
 =?utf-8?B?NVJOcnlMZFJnVklRZmloVXhVS2wvTWlyTTNkOU1OblZ2N0NxU3BiR21pbzRU?=
 =?utf-8?B?SjJqR2M5Y3ZrRkpiQzJiZUVZZ2VkM3liMzV5bStMWUJtNlRPN1VoajVzRHFs?=
 =?utf-8?B?WmxLbUNoWDZwSXVXSjRyVCthUVh4R09relcwWUp4djIxM05sSUpKWlljdlN2?=
 =?utf-8?B?WVkvK0lEcncrZHZNSHVDcDl4OFEzM1FPUGZZQjlSb2tXSDdrZ0YyWW4vdDZt?=
 =?utf-8?Q?Ku2cBz5FLYw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8298
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81bb163c-a672-4fb9-b2df-08dda7493ebc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|14060799003|82310400026|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0NTYmJtRmRDcjBzU0ZlZVY5Uis1VGdDckdwK3NTTmVSdzdubkVudXNCWThJ?=
 =?utf-8?B?MEhyZjVXem5jVEJhL0J4NDl4YStCK3lhcjFlVHFxUmxNVHJKU2phRmI5bDZL?=
 =?utf-8?B?TEs4ejd0dDZRaW9BU0Jnb0U2K1V6MHYzaWdQMzduQTZHVTkvczZRQiswb241?=
 =?utf-8?B?TVBORDZEdDFnTFlTSnZKbDZ4TENWcTdjNk44MTM2VG1mQTNvNm9MYklMRXQy?=
 =?utf-8?B?dHJUdEkzZ0w2UHUwdnZaVGh3RkFlZWNaQVY5UERROTkwSXc2MVNYUEdpcTNU?=
 =?utf-8?B?WlJoQ1o5cGI5OVNzQWN2NXMzUzk2ajlhUjhoTHY3YVNrM2RReElWN0hrNzMz?=
 =?utf-8?B?SWlLVThZdDJmK0xQbVpGV1VReVYwRmRmS2RjbXhSNmJKYXNlNkdzR2p5ME1p?=
 =?utf-8?B?UGgwNXdpOHJkUEY0Ui9wRW1mZVNVU0tXU0pnVXVFdTJ5RzRhb3QyZENzVXhY?=
 =?utf-8?B?NVU1MWliSHBsbkEvVnpUbkRvQmg4M0dqQzNGMHlqcXVDTndEL0pVOWlLY0Rq?=
 =?utf-8?B?WWFqSzJhZ2QzVWJTUHczcVRxUkVoejFZNDQzdlBLcDNXaW5obHRNL1ArWkhH?=
 =?utf-8?B?eUtOWGJwKzRiQnNpMm15Q2kyZ2FwU2RmWFB3aHpBbFpvcGNEUFgxMFVOeG56?=
 =?utf-8?B?RjU5S1oyM2cvV2x1K05Sb2VxeU5RcVA2OHduKzZ6QlZRMk8vU0hRemk3VnZm?=
 =?utf-8?B?WTVhRkM2RStUWGhUSkVJczlwWTU4anREcDREZm9IT1VQeW5rZ3JVQU5HS1Ro?=
 =?utf-8?B?SEtYMkFBR3c2ZitNVldRQTZKdGdPMmdHdnJNUE9pREgzSWFZRnJFMEZQcEpq?=
 =?utf-8?B?VTAvRmFSQ2dLK2x0YldCdDloN2R3cUhuSW9DYmpoZzNIUHNYK2JORnZ5bjdj?=
 =?utf-8?B?UlhTdUlCdnFiZlN2ZXdSdGd4M2JjNm9XSER0V2VlaFZwd1liNi81M08xSU0y?=
 =?utf-8?B?eWRJYWt2UFZCejZoT3B3R21makJXQVJKVDJrcDRXZkNNQnRMQ3RNcWFwZ2Vq?=
 =?utf-8?B?NGNvQVFoRlJNK0NSalkvUXBvdHp5WWh5NStTbVdyZVZFY3VQSlYwbVNuVmZR?=
 =?utf-8?B?SjhqSkdxdmpucW9qMVNWSzg1d29qdDBzZnpyQkNXQ1ZGei91bmNwOTdqUnAx?=
 =?utf-8?B?Y2pFM2c1MGFsL1hPZUsxSmV3N2V3TlBjd05NVDQzdXJick5ZQ004YVc2Q1h6?=
 =?utf-8?B?VmZTMlBtK0pZbms1V2FSQ0I3STh0ZU1qRmdHNktpRzNqYnhNSW5SWDlFWGMy?=
 =?utf-8?B?WkRtMk5sMjJ0aUwrcWU4dlRUblRrVTlVUndPaWRMRnJKcjZRdjVma0RRaFgx?=
 =?utf-8?B?TlVHbXBGOWc3cUlrK0xRZ2ZETXNZYUZPNE8wN01ubk9DZUxnVjFoNVhmQVlZ?=
 =?utf-8?B?NWtKVHFHZmQ0cGJxNmlQTkRIQjJSRFNCeE9lNXpienRTZlZVbDJzVEdMTFRG?=
 =?utf-8?B?VXlUQnV5WmUxTm9tckd3cXUvVGh5aG1oakRzNDdHREJnTEorVU1nenI0THZV?=
 =?utf-8?B?amxpb09kTGxSQ0c1SGl0b0xVdFV1ckpqdEJuRUU3blJJTlZaMHg3UXpWRk5R?=
 =?utf-8?B?aTlWaTkyUTlibERpQ0lBVlRoZzg0MlZYc2dhR1ZINzRNZmpWOVlmU1lUalU5?=
 =?utf-8?B?MjhYVEl1dlV2WXFXZVlvSiszdjVhNVd1VmRVN1VKZzQzWkVlaEIzeVVNZWhO?=
 =?utf-8?B?Mi9jcEl6ZDkvM21nWGphR3ZUZm40bEh1Mk4xNTNXciszL2E1UXJtSElvcW1R?=
 =?utf-8?B?TitWSythY0QwSXFsbGZESGN5Ty80ZGtzQlZ2K3ZWejB4NzNhYUJjQndscnBz?=
 =?utf-8?B?QXNOL0NoWGhWWDY2OHdFbnRnaVcvMHl2SE13SStyK3VVeHNTM0RXMHJITC8r?=
 =?utf-8?B?MFdOZ3MzWldSU3I1ZnlweU9Sbi83ZHJhYktNZDFoaTFaWVlZOFdGaVhwQ2ZS?=
 =?utf-8?B?U1FldWJGLzB2d0YzS3BhR2N2cFUwcTZ0YXFrdzBSYUdoN3JUbUlJekx1QjZ5?=
 =?utf-8?B?S3lYbGxkMnY2TExtaDM4Vkp6akk1U0JSaTRNVDZFUVRkamZDVEdvai9uQ1Y0?=
 =?utf-8?Q?KXN/V1?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(14060799003)(82310400026)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 11:32:30.9353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 734d3f42-33c4-4a07-f3b0-08dda7495237
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5882


On 09/06/25 4:30 pm, Lorenzo Stoakes wrote:
> On Mon, Jun 09, 2025 at 03:11:59PM +0530, Dev Jain wrote:
>> On 06/06/25 3:19 pm, Lorenzo Stoakes wrote:
>>> On Fri, May 30, 2025 at 02:34:06PM +0530, Dev Jain wrote:
>>>> Move away from apply_to_page_range(), which does not honour leaf mappings,
>>>> to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
>>>> if a partial range is detected.
>>> Hm a follow up question here - why not just improve apply_to_page_range() to
>>> honour leaf mappings?
>>>
>>> What does honouring leaf mappings actually mean? You mean handling huge pages?
>>>
>>> Would it be all that difficult to implement?
>>>
>>> It seems like you're pushing a bunch of the 'applying' logic over from there to
>>> a walker that isn't maybe best suited to it and having to introduce an iffy new
>>> form of locking...
>>>
>>> Can we go vice-versa? :)
>>>
>>> Also obviously walk_page_range_novma() doesn't exist any more :P
>>> walk_kernel_page_table_range() is the preferred solution.
>> I cannot see this function in mm-unstable. Also, mm-unstable is broken - I get
>> some RCU message in dmesg, and after some 20-30 second delay the kernel boots.
>> So on which branch do I base my work on...
> mm-unstable shouldn't be broken as that's what should be in -next, concerning!
> Worth investigating... But rebase! :)
>
> Sorry maybe isn't clear as we changed this recently - you should base all
> changes intended for the next release on mm-new.
>
> As I understand it:
>
> - mm-new is the _rawest_ form of the state of mm, Andrew described it as
>    the 'crazy' branch that basiclaly has everything.
>
> - mm-unstable is when things have been percolating for a while and are
>    considered reasonably stable-ish kinda, but most importantly - ready for
>    -next testing. And is what goes to -next.
>
> - mm-stable is gathered shortly before the merge window starts and is all
>    the stuff Andrew will send to Linus.
>
> To pick up on the most recent changes therefore use mm-new. Using anything
> else risks issues like this where your patch will conflict, etc.
>
> Another point to note is, during the merge window, mm-new is where changes
> due for the release after the one being currently merged are kept
> (e.g. over the past 2 weeks of 6.16 merge window, this would be changes for
> 6.17).
>
> Not all subsystems even take patches at all during the merge window, but mm
> does.
>
> So especially during merge window it's important to base you changes on
> mm-new.

Thanks. I will base my changes on mm-new.

>
> Cheers, Lorenzo
>
