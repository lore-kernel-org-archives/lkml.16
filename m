Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4031ACEAC;
	Thu, 15 May 2025 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318990; cv=fail; b=Ryb9RXlqYRfhkk6B+42+CnYseecjCo+pR092J88hwi1UZWnMmf6KWqrABhp28xBeKWJqopj51iO02CJSY/9rjxVbMpyEAOCycXLDHp9LoL9ZmPx2zOSXEKh7rlyVz0KORWEKMYnaF/PRwimg5CDjGdk/FKgFRxQcuh6E43Pv0xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318990; c=relaxed/simple;
	bh=w5Upz4ZJzEzZ9iBjNdo98WnGo50AO7rv/4WlexvIEWU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kkQeB45Q1HNQh3YSy+JOs6x7XOAtCdhtlQ0t5Gy3TACLxWmxSA7m4BD/MXJXfK603z8/vXDgcm+J9kKgan8CNkxuR6vCJ8smLOSbvK+cGVLwwfJZiNQOvuDdjYcNRo8oUmnZcBNwHkph1/ddWe+QoN+RPQwneDGdBup7hcoFgL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=THa+Dd98; arc=fail smtp.client-ip=40.107.92.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="THa+Dd98"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0wmeYtW3XNbtM1w+VDn6Z2761Hme0fpym0E8FlSka4j+5YQGt2Cl/8UO0fX/hNZihYE/BdzIab2QH3eGn06OzdtbuIFisE+i5HPOIPuhAqH9mhjIErPeKs/hMX+KeN/SRZaaE72froswY3z1UkpOLUk2RT/IoqOEOyT2tIrnL2e5JsUgXkGb3d2LpKQfx1SGTCOmRxNVX36Oc5CVjTZkBcSUNlzZDR7pope408MQIlzO5J/E22tukP2f18DnEHiF+H2Ctk0pu2PqZYrEgMKYqpy4Sv6oZ2olwZIhGIoPOEyZHOGu4x6JTJ7QBBpPttflRMz8djyqKJC95KaYd/Itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GhJARt5HPigAcZ3EufBtxYALCqeBmFLve+GSEgJLYo=;
 b=uMZJqed57uoqlUpfwIU8sXAGOFezNpFqaprasttuLuEIxqezv+PukW2MVwmDz+jpnOckHTAHEH7lhQdbOJ9hxDd8WNOisM+BagMWMGwap7m+vGDvwcl3moOKMbSM5MvnVykpWIgvNluANhv/WEO2URogYKW3Ul5OVRfxjuZ7WSzQjtCIW/9g+QMyXSDhKTAMWPRrhgI03OFcx1tBkedIeGqD2r9zGYJO1XAtmloMWqkBBiv3zTykwuqJSMhIdM9mc6paLUSn0H2/YoCaLqyv8pmNciEgpEiIOT8P/q80h/TOuWPSOhHXAd7D5my6XRPvaPg6TbnTJ0IFVzqU8esZag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GhJARt5HPigAcZ3EufBtxYALCqeBmFLve+GSEgJLYo=;
 b=THa+Dd98+dmKleLX6ZAm+P2DzcoCGYDONTuB41jGR8L0vEyuTXfsF2QacYSblsY7rlk+MqqdAex2VL+aaENvXNij3x7HfU8tStVwP2SuLhOraXWcyYYn2bthOy6NiCoPf85JpGKSSzHNNKM/xVOCivW1tT5ny5L6Jn3noWCCIaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 14:23:05 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 14:23:05 +0000
Message-ID: <6b20fa34-fd57-4862-835e-2c7e874d125a@amd.com>
Date: Thu, 15 May 2025 10:23:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15] platform/x86: Add AMD ISP platform config for OV05C10
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 alok.a.tiwari@oracle.com, hdegoede@redhat.com, W_Armin@gmx.de,
 mario.limonciello@amd.com, Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250514215623.522746-1-pratap.nirujogi@amd.com>
 <174730984157.2231.15808775923608626252.b4-ty@linux.intel.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <174730984157.2231.15808775923608626252.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0090.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::23) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e19c1d-d207-4d31-5a32-08dd93bc01c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHlBNkFQM0hhQm5aL2FmZHNBVzFHeGgxUUZTemNEWElJdnNxK3piVTBKL2xk?=
 =?utf-8?B?akprOTM0bW1GcjNDSVh6bEJ4RjI4U0Zoem0rOGdNbjJudzdtMVgxRHBreW9Z?=
 =?utf-8?B?S3h2TjdBVVB1NWJmTWVaaGZtQmc1bS8wLzZoOTAxQnkzMW1JT1k3cnJvQXB4?=
 =?utf-8?B?TytRNlBPb1RDR2pWSXFTaTBGRXhnRGlCSTcvNEVTa3RvRVVpTXBEU09hdDZo?=
 =?utf-8?B?MkJCVlEyK3pleThDdUl5bjRZOGNvazk3ZWdsWXluZEJ4Vk5PWXh1clhSVU9F?=
 =?utf-8?B?a3JqcTYvOEgrc29wdjczUVJLcG4rcE1HZmVUTEZUR3RwRlhGemdoSFQ3aGl5?=
 =?utf-8?B?QVJyQmwyZnh5U3BWaWxOVnk1NGVnMXFTL2hWcmZCZ3ovbHBtY0ZqMGxSRVg2?=
 =?utf-8?B?NUFlanRjRVRYY04vV1JYbVF4U1hWRSt4YjB2Y2lFTzlmOWt0UFRqdE85R21F?=
 =?utf-8?B?K3Uwcktjb1FYVFBQbmRVVTNHSDFJQ3h2d21HcVd4ekgxc2FRelRIOTZyTWxa?=
 =?utf-8?B?allYNUlYSU42QzhpV3k3alZGN2VKY1RyV01DMkZ5dlhQdlFCcTZOOTl0ZUxV?=
 =?utf-8?B?TjNQWUxWdkJhYjZiRjkzSmRwbld5SDRwVXpmc2hhcmxsV2hmOWtoM0V5UUZq?=
 =?utf-8?B?VU5lVnp4aEROR1BCVUlENTFWTGlmZGdabEVJUTB6OVhYblZsZjNVckxuRmE1?=
 =?utf-8?B?eGFrc3RJdUFvQkwvWjUrdmIyZW55anY0MVBKWDg5Uk16dzFVaXpNdkNVNjc5?=
 =?utf-8?B?a2RBT2ZKNFBrOTZDdE1ESjJpUnh4VWtOSlpieUdjZ3ZVM0R2TTJKUjdLckZw?=
 =?utf-8?B?UE5kSVArZjRPblFLVDdQbjV6SUVXMEoveFllcDVlOHRMUVBYZ1dXYWNlbUc4?=
 =?utf-8?B?TVcxaWo4dFQ1MzF3d3c4eDRpTUJPWTZTeTRMWmxFZDYzYWhsTmFWakwwVnp5?=
 =?utf-8?B?QmhZMHNKNXd0WXlzMk9CajdoK1hBMCtqQmZuTnlzcE1vdHk3Vy9hcG1BbDJZ?=
 =?utf-8?B?UWx3NkN3aUxCVlVCQ2NkdWZwV2VBOWR1V2Y2MHoyQk9iSmN3OTZtYXNEeTlU?=
 =?utf-8?B?S09tWUZ1U1Zta0FUUlltSVpnRGNLK2E2SkFWMm5kMW1HeE9janhoUHlNVUlJ?=
 =?utf-8?B?enQ2aXM4SEJETlVyZHhNQlNLUTJLYmIxaFQyUC9GSEV4QzBtRjZnb0F3ZjNO?=
 =?utf-8?B?RGQ5QmpNU2MrN2VtOFMrTlo5eVdrVk1JcU52VStBNWF1K0pkdDE5blNFMS9C?=
 =?utf-8?B?OExadWZURUU0MzJndTZMQkl3ZWNHNFNTdUlYdHdyYUlDZm5tNFdrUVB4bEdj?=
 =?utf-8?B?NmtGTkJVM1pHM0NTVXpRZjdjY2dOQ1pDYm5POWYwWTNwRkpVMVJBREhPS09E?=
 =?utf-8?B?MjdDeGM3VTdYQ0l0NWhDU0h2ZzcrSStEY25GbFRiV20rQ3k3ZXNPQjY1YzNY?=
 =?utf-8?B?dUE0T1BiVFpRR3lXVGhwOGdDOWo4QW81NThTTkdFd0UrWFF0anJSK2oxM2E1?=
 =?utf-8?B?TU5JOFNhdnZoeENDN3cwWTVDbldEY0Z4VDB3dHJQM3RpdUdMUmV0dmdjNXZv?=
 =?utf-8?B?QXRkR2xOMlRXVjN0Uk52ellIT09wU2tEUlFVd2N3OGdvNkd1SDlmRzBaMkw0?=
 =?utf-8?B?TVdwck9Td0VjRVhDc1dTaVMxMXNTUzlTdjJDYUZkZHNUZDVQdUxhVXBMbFQy?=
 =?utf-8?B?Wk1kbGJXbVpaaFY2alJNbE03WnlHbXd0OTZacUx4T2doemViQ1Btd2lKT3hF?=
 =?utf-8?B?dHFOUWJXSG1wVEJKeVZrckI2eUF2N0hXVWlaTnRZZ3UyRmdXMEJvT1VxVmNF?=
 =?utf-8?B?NXdnMFlTaXdJRU1kd2JsQ3RrcGJIc2FDZ1ZJdHh5YmpaR0FtcDB6MFdxN29u?=
 =?utf-8?B?QU9KVmFvZGZURHZGcWRRSWlHZExrWVNjUk1XdS82eXdEZzc0KzlIK1dyK093?=
 =?utf-8?Q?CCMDXOL3XwA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2JqZTJER1d2QVJxL2FkWmJpMzBQMDZqNENJcHprRUFheTljSmpZMVZjU2Fm?=
 =?utf-8?B?NVVJdWpkQmtNZlRtTGliTmhqZjUzL1lSR1ZJSWtyTU81Ylk1NWIwVzA4c1ZT?=
 =?utf-8?B?K2R5RnhBaWRUbk5PS0lzczQ1cTVMODZUeEpRcEdzTS80QWZSbjZzbk55YWYv?=
 =?utf-8?B?UTBnQVliU1F1b1NkSkJGOGxXNjQyTG9LR0F0Wnl1cmZLc2JFWUpxY0tOSFBl?=
 =?utf-8?B?UVdkNGI4S2VhSjdjV0NhRm9Ic0EyNEpsMTkrSEkwbVFLVEttR0JGbTBVRG9V?=
 =?utf-8?B?L3RCRkxBS1pLL0w0cUNGeG56NmFNRE95WDlOd3BrM2s0QVE3Zlk1ZjhtSTlJ?=
 =?utf-8?B?RXRmTnZBU2dhLzJQUkVOS2hpRXVzYXkwNFZFTVNMb213emtsMHpWb254RTFF?=
 =?utf-8?B?cCthemNCTkpNOUxBL1UwQnNrZ2FhQ09sMHBvSmpQU3JYSDJyc1Z1VEVhdFh6?=
 =?utf-8?B?dVBabFVrcHFOVTJSeG1oMHRHYkQzQU9IbXYzQzN1blZTREtQMVJVUEdRRVpv?=
 =?utf-8?B?aVFZTStkWFFyTTB0Vm9ObXRuc01uTnFtZFdMeTVxdGlrU0JJdkErcU1ac1k3?=
 =?utf-8?B?akd0SDVQRjRtc1M1d1d6aUhwV2txUkdkR3cwNDg1RWhKNlNtMng3RXlOQkpp?=
 =?utf-8?B?Nk1YY3paQlh1Q3pPRllySmI0VTdOWU05Ums2cVlkZWx1d1BDZkhueTEwNUhy?=
 =?utf-8?B?akk0Y2o0QjUyQ1VJWnIwOXRMQW52dXVGMlRQRkE0OHFKZit3U2RQdjhXeFQ2?=
 =?utf-8?B?TklRSzhNYWsreTNJT3lMYXhSNTJBYVlEL014RGRmWlFodWhDUkJqSWJ0b1NL?=
 =?utf-8?B?MGprMCtaUUFFQVFTUGdqNnY3UXYraURLQksvQ0pKWGZlTHQzR3VoSGgwY3J4?=
 =?utf-8?B?YmJFdHh3UXF3RTdINmExMm10TEhiWW1BY1JzNEs1Tm1DREFKLzJ0Ni8yenI3?=
 =?utf-8?B?aHEySDJPbGFIeUVtdmN2S3hmaUY2UEY3WSs2V0R2ckY1WUI0bU9xM01oVVdv?=
 =?utf-8?B?Nm9tSTMyWTRXSkdVV2tiUHYzTm9yRHBpM2ZpNXFjcnYwTmo3TzMvYzk1cWN5?=
 =?utf-8?B?Z1NIKzdrTXFiUnZNNS96dGE5NzBIK2I4c1plVDdKQlgvMzJBQ1Rta3dQaHV6?=
 =?utf-8?B?YkhNNWpjRE12Vlg5UWV3U2RqMkdCTGRKbnZpRkgwNmQvci8zUGo1S1praWg2?=
 =?utf-8?B?Tm9SUFZaZ3ZHNEd5Yk1JZXJSMC9HNlRjRXoxL2FPaUlmU293djZvMmczcCtj?=
 =?utf-8?B?bW41cVV6YXl1dTVEOGxTZFg5dnpHWk5iNWNtV1ZrckU5VStjMGxjUktpWVNp?=
 =?utf-8?B?T2ZBNFNFQ2VrVUdzRjJDRXY0MXFxQUtHemJuZkZSTTE3azNZQUNXUk5pUHFi?=
 =?utf-8?B?NnRLT3ZSajV4VFh2U3o0TUhKNTA1NmN0VENjK05oN0dSQTdnemtYVDRiWEV5?=
 =?utf-8?B?TjAzd244ejgvc25qK0lEQ244Z0dvTllVY3UxNzJOMkNxZERpMWNxem1XK0pD?=
 =?utf-8?B?elJSL1hDN0huM0VZSmJNVlN0M1dCZDFQZSt1RjRMQjJ2VEo4aGFqMG5HZDYr?=
 =?utf-8?B?OFpQaDNsWGphSzN2QTcxSVIrZzNMMmRNaTh5SzN5Nm94R1dJeGg5djc1cnNw?=
 =?utf-8?B?QmRHbmNhcUw4b0FtM1BORyt6dWJvYmlFY2V5Y0d5TXBhUngrTXBCUEJQZG9G?=
 =?utf-8?B?ZG9ESjJBdSs3S3NFQ0I5cVB6ZmVaR2F1bTJnQTl4dW43QjJFR1MyZ1llWUI1?=
 =?utf-8?B?Q2U1Sm9HSHRKUDVBV0RaUDdDcm5NRkMwenRITzBEdHlJeUNVSndHelZaaE5V?=
 =?utf-8?B?VlZpaGVsa2t5Y0ZLaFVNUkRuUDVnalpTa1hIanVrUm1YK2h3OW9zY1VRK0ZP?=
 =?utf-8?B?Q1VzV1pGcDByTzFsdzBGaExEdzBhamkvRzdiYzdvMVFBNjAvRjkvaERKTFRj?=
 =?utf-8?B?OUxSUXp4NlpST2Q0Slp1N2N4dlNIR3ZSMEY0cmtVN3JUQjhiSXZlUGNDVlZW?=
 =?utf-8?B?OG5oSGlqNUFSeXNSNXIxYUNEWnhBRzlENWNrS3VmQVBEb2NrS3ZvMUJ3M2wx?=
 =?utf-8?B?ZTRjRlVxRGZwN0VwQStYUS83WklMMjdGajlRRnV1RGM2Mk5yV1hqdHQrc3I4?=
 =?utf-8?Q?epglgMJ8o4ukC6sRu4HnYdnPc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e19c1d-d207-4d31-5a32-08dd93bc01c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 14:23:05.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWG6oCnRaVDF9K7ZE7UqsgPfdXTUTM5KG5OTekpVGToDJEbhc7m23w2enUfj2EiQUw8qz1PbacA0vQeudyIy/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333

Hi Ilpo,

Thanks for all your support and guidance, and happy to see the patch is 
accepted.

Thanks,
Pratap

On 5/15/2025 7:50 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, 14 May 2025 17:54:59 -0400, Pratap Nirujogi wrote:
> 
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> [...]
> 
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
> 
> The list of commits applied:
> [1/1] platform/x86: Add AMD ISP platform config for OV05C10
>        commit: 90b85567e45736b662d034be536a76ba0f4c7ca8
> 
> --
>   i.
> 

