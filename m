Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5228FFEE;
	Tue, 22 Apr 2025 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339968; cv=fail; b=lRUXKab9Vs4GLLmNl6gu2cfppP7Q3M+qbFX+C/vQXxH2LfrfjDPyGV3OR3gIq2HOuL84wXcOGzgtyEN1g83WDsNcCA7WUfGs74j/QA4tZxOFLscrO6cxbUhSjYsN3cneR9BmU0EBFwyR0aEpBqXN/WwJsjFZAtOpd8ad0d4Wtpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339968; c=relaxed/simple;
	bh=CSS6qUMfyvq3VhMixJD6pBR4aksHoMo8fVRT7OvpJ0o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U8i4jYdnbKLGeYQ7VTYJZVyCSBxCH+GUtGyRJGvkrMuF9DPw6uDcYS9COyP/IJRXuoXlufEVOzrlAfkttc8ZSVyRht8ARSXgPc5hpz9Gq9hhK80Gpwn1Y/n/lRbMcwPLuRtbK7yGMk47fY3mifESDZBZuGG3pIwJcRVWo9zYnQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=hD6WU3H5; arc=fail smtp.client-ip=40.107.93.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="hD6WU3H5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyiN6fVOuJ+JSaoCSkDBxTYYibVqkoavZwI0T8NZS6Wp/dvyFc6Iq4LtAg7irgB1vrmaY61REFiqaK6MJ+ayA6E81SGncjx3xIaMFVQrpo03Iaqiry2KhkTyIhirIoFzaKDhaaTEKsLipq0b0pMnEMi7hPwrpXgM+UX+2DS0IJ52sdnT4iLEq1IWH5Qr71RPE74V5z7dsXd/dDQ7i9pqSetFA+4mGyhLEBDJWAhq8SYfK4xan96ILob8XEVYjVyRlOqqy249NI9DVQHb/0xd1KpLmiBxTE9tjX+B8fem10+TAV3lyO6ZaWDGujAc2CGVMhGS4TDR4OopbmFlSUTzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/g307YAmFBdPSbmsTQMKYATwCsMo/3I1UQup/eQRtQ=;
 b=Kktjgp49I38oKvcjKWkHbuN/ZwtUIQHGoq75AIcoeL2zmjPtVMBAqSfKN6uQOpQSfQOjgZeewKh+HEtu4Z0Z+dsI9XbrHNA0UqpimE8A8wegn525bCQQPclPIssYvBZGYHhk9Bcro/ifwadtJAhQAy11drh+EM67c7yeb//wzohqCMaEOPhDojbtKoYv4Rr7Se93omTVh0myS38BqWmMNr/jX75ruHuzgMv5PBpoV6asxVQ9Sjdz6GYj/NCucfcgxDbKdNWSL0sqqoyhn430VvSEo+z6td1kRsi0mwWKKGTkqzSLO3zvxJhOfnZY5is2Ayxh3pi9QGuTGQhD0W8cQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/g307YAmFBdPSbmsTQMKYATwCsMo/3I1UQup/eQRtQ=;
 b=hD6WU3H5aUrEnUEYVc858+T8dFeEPLhjr3XbUzOvulgmSEbIuRcOi4qtTRdY/yClAjXNr5/l/wSRegex20e2G3+x4hLTs8S3J7BR+IHV5u40xaTUT+VC5rJbnhQSaOYWDP+LDz1eYXmRJaluLh+ygFElL6yxkBJp/2lvijxR0g43atnjUwpst+vOmHF3Y/wrG2sZzrrgLNGNRXEIUMUGjXSW9ZCcNg5GlEaYOT2Opk0/F03lMXP/r+SfkgA6EJzeKJDKRXZnPQktJkHBlLMMhPOeDI/IvScR0GC89ltws8Y8AOcLmEzfplFvPajUyLpl8TZzIXK3y8WGqLZsLeVNMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by BY5PR03MB4920.namprd03.prod.outlook.com (2603:10b6:a03:1f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 16:39:23 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%2]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:39:23 +0000
Message-ID: <67503d24-c407-444d-8594-03054ead624f@altera.com>
Date: Tue, 22 Apr 2025 09:39:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: socfpga: convert to yaml
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 dinguyen@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250417160616.47558-1-matthew.gerlach@altera.com>
 <20250422132356.GA1020502-robh@kernel.org>
Content-Language: en-US
From: "Gerlach, Matthew" <matthew.gerlach@altera.com>
In-Reply-To: <20250422132356.GA1020502-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::15) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|BY5PR03MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: dd52a8c2-18a6-4478-2291-08dd81bc3cb0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEh2Tkk4TE9GbXdremJ3bjhHU2pMSVVITlpLdk5YV2N4TEJWM1dXN0RVZzM0?=
 =?utf-8?B?L3dycDRHS2NZOWh1dXhSaE9DdGpHTFNPdkJGRHRvV1AvMkdlbEgzejZUcTIx?=
 =?utf-8?B?TUpCMzFTSlRPR2xsSmY0UEdiNzdnTlRXSWhxbnJVYnlTNlV1MCtraXRLamNR?=
 =?utf-8?B?cDFzYzV6QUFqK0xHTXRqYTFvZnBUbElPVTJsenNBVnE5MVRqSU03UEUyTE1B?=
 =?utf-8?B?M2R5RUVIb1RmQ3hOZFpmcmUrK3dYbnp2Q0RMWG0xY2dVUjZoUTY1aWtkamxK?=
 =?utf-8?B?SjRmSXdtNmR2ZTdad1JsUDlLQk8rSzZNeENxMFpINS9qS2xPZFZSWE9TTU1i?=
 =?utf-8?B?bldubnByRDNrSHAxZTQ5WlNBMlRjdXdXdHFnVXFrOU81bjNqT0JmcHk4L0s0?=
 =?utf-8?B?aGo5cmhLdTVuelhnSzcxNkNSOENINjlKZGpUS25HUnNpNVNSU0hxeDJrbzdj?=
 =?utf-8?B?eVQ3c2NQbEdtVTZlY2xmZmNLcG5mUlhsWW9xUFpHWitOdUc0bFlWUWQ3WExT?=
 =?utf-8?B?UFYyMUUvb1RlVE5SK2J2allkTGdCOHJTUCt0QWZYaUR6d2tWTTlWcThyMWox?=
 =?utf-8?B?Yi9BOUIzSTUrNFZhbnA5ZGt3c0VWTTFGaFpjMmkraXoxd29EcDMxYVdLZ3Nw?=
 =?utf-8?B?b2dkVGZENEYvZ1pINWZRcStTK3RLdW00UW0vQ081Nnc1QnozS0VGSDlFZXlX?=
 =?utf-8?B?K01jd1RRR0xZQ2FtQWxwdkMxc0xnUFQzMTFLVkF0SitZQU1VdEpnd2FWam1l?=
 =?utf-8?B?MCsrMVBuV2pVWEk3bkFNM2xWdTJCdUR3OWovaC8zK0t0T0xYNFZLdE9zL0Vq?=
 =?utf-8?B?NDl0S01YUnhDTVVzdEpMTTd2RHRheG5YNG8rNU82aERMVDVBSzFwMDdGd3ZD?=
 =?utf-8?B?bDFlTE9DMDlyMzB3eGc5UEhaVkZGSC9ZeGJndnFpRmJKN3RtUWZPRVRQNm40?=
 =?utf-8?B?QVpUMmNEcWRtc2Y5YWZXK3VBWDJQQ0J1VG9NdHk1azFxdEVzdEVJNzA5cmZq?=
 =?utf-8?B?Y2ZkdVZXRUs3NHIrOEl4bnJpVVhXRnhzby9kYzFaZCs3WFYyZExIODdxUHhK?=
 =?utf-8?B?S1AzK1JyOC9wOVlWa1IvWCt2My9BVHVsOTZUVUxLUEFKZktVSTBOSjJBMHV2?=
 =?utf-8?B?NzVnRzFnMGxkNWRUQ1UzbzFnVjdHMzlJakRkbVVlREZwVG4yUFZJcVpUdjAx?=
 =?utf-8?B?c0VUdE9XMTg4Q0RxWERzb2ZNV0hzNTdFY1RLTzFKeUZ2enMzQUdIbzhMWlMv?=
 =?utf-8?B?RVVSMk1SSm5QUlU4SzB1Z2VxcHNoN3FOdGlLUVJaOWx2Y0NEMytQNG81d21S?=
 =?utf-8?B?RTlPWkxRVysvdS9zTWlTalU1aSt0ckgyVDdUTlp6WHhLeUo4dWpqZlF3WHRG?=
 =?utf-8?B?aVVTaDBIVkF6R2FIaG9IQlVOWFBYRGhPK0RweE0vVVlxb1I5T1BaRE1CblNU?=
 =?utf-8?B?eUV3L1d6ejhTbEF5RC9PRkJBUVFVQjJSeElYWVZrYVJscmtoMTFaK0NtVVc3?=
 =?utf-8?B?WTNZQ2poVnJFYlFDenRoY0VSRTE0QTlaVHdrd2pUVkNYemNJUDZVQ09zQVJC?=
 =?utf-8?B?NHBYOXExUEhRRlJpUUYyY21KOURtQi96SllqYXpjU1FjcEFmLytYQy9wcE9Z?=
 =?utf-8?B?cVNGMEhNbmVzckhZUWFqSVFMVDRIWmZ2ZFprWXRNOU5EeXB2NzRlbGhrclRn?=
 =?utf-8?B?S0QvMlVQSi8yQVNKVGVGYXBFbEx4bE1LSVJZUERvL2UrVk1tRUE1ZFlZUHJo?=
 =?utf-8?B?OTVPbjI4VUJnMHlBQTluRXQwRGJ1dndoZk9ZUWI4dE5NUURXczRLdVJDK0Jv?=
 =?utf-8?B?V0YycDRmaEJ6bWdhY1dTNVNoK09iOW42WnptMFRXc2pzb0g5bTNDLzBmbVA2?=
 =?utf-8?B?b0FISUV0YzM2Q0dPRjJuNGw3NmphMVo0ZmNkakFja3hQY013TlR1ai9HTGlX?=
 =?utf-8?Q?H3bMwiL2H1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3QxRWhSbUlTbWp4aGpldEwwaUwrQ2RBeTZhQ2x4WkQ5TWxlK3kxZHRwQVlY?=
 =?utf-8?B?U1NSTndmSVlZb3dEeldZNENMeEQwaDM2RG5iU3hHYUFxcTVmQ3dsR2RKVmUv?=
 =?utf-8?B?Ri9qdnVZcWFhNmxISU1NMm1URlFwcW14U1ozcW9iQ3lUdlM3bWZQYkpOcTdh?=
 =?utf-8?B?bkFXc0NlWGphaWovbm9aakRDSndkUmgyTnU5WmhrMmNQTzZlSGM1ZE5KMjZa?=
 =?utf-8?B?SkNoQzJrSXA4NjFkdmpBczV0eUNrN2hvTXFCQXJteGdRM1JZc1ZNQmVkQXJV?=
 =?utf-8?B?WHBFU2NzZWdxTFdlWXU4TGlSRlRrZ1RDVlBWUkpHVitmV083R2cwSWs0elZ4?=
 =?utf-8?B?dTBrNGYzUjRpQ0NtUm9OMmFoTUN4QnhGMGtmbFdJdWJJS0JCTEJzYUFWbHd5?=
 =?utf-8?B?U0swVUVxRTlkTURSL0ZxVnpQS0JZcDRXQlN1WGs0Z1g3RWZyWjE2RnBnejNK?=
 =?utf-8?B?TG1YNHBnNUJnOGRoOUwwRkJtSzNxUnpaU3l3Vm5neTdQMkE0UitpUm9uQWk5?=
 =?utf-8?B?MUNaK1IxZmZEUGsyT3V2enFSUVBOOS8wTjM0NXk5OVMyRDN6ZUg4Q3dXT0N0?=
 =?utf-8?B?bU4zTjgzazEvVCsxR3NUUDdJSDNWd0toSFBWMjdtc01GdjM3eW83aXdhTFZl?=
 =?utf-8?B?UkZ1djRVSnYzb1pocU1yNkxoSWt2TjNQQlg2dHNBbS9JVHZtTEtyT1BsSlMw?=
 =?utf-8?B?WWliUHVzZnNWNHR4WHAvNGJObWUzaVZ3QjY5cGE3RytyVVlSb2sxWU5HSHRr?=
 =?utf-8?B?Ti9keVlwVllOSnNEakhtTzNodE9TT2V0VmhwOW9iblhDbjZpZWordC93eC9v?=
 =?utf-8?B?R3l6amM2VWEzbmg1OSt6N1Npc3AyOVNyUi9wL3NRSG5VS0ROd0dhcWlpdWxj?=
 =?utf-8?B?V2pmNjlDQm43cWZ2R3NpQWgxTUUybVB1cXNOdjY3cUJsbUsydWNlMFA2eVBt?=
 =?utf-8?B?cHdpK1NRMVJXSkdTTzdGckZPOE50Rnd1SjhtVGdKQm5hdDdCK29rMFVMQmNF?=
 =?utf-8?B?ZGJhYXFZVXcvVGtQYkExVk00ZitYclp0RVFlVmdnMjNkdXVpcytxaVRrOVAz?=
 =?utf-8?B?QlRmeDU4eFpsRGJFMkM4ZWNjUUVoRjNLM2x1QVl5eWlYSlVxUzUxL3BiME1t?=
 =?utf-8?B?Vk1LeHdSQ0hYbnFxMXRHTGZqdmZTaDRJcVhHMGxvS0JydTZHQWwxbWYvQ0pH?=
 =?utf-8?B?MEJyQVo1ay9sdU9rc1R6L2kzZ3VHMmRtdjA5b0kvUEdmbVNHMjZFcmhJb2w1?=
 =?utf-8?B?ckpXU0FhMkl0NnRUWE9pYzI4YUtweVRUWWpKdVZwRDVtTVM2aFZaVERHOHlq?=
 =?utf-8?B?RnU0WmZWNStVdUNyOVk0Z3hCN2FQV2lDbUNudWIvOVdUc1FDREdtZGlaL0hK?=
 =?utf-8?B?cjhKMHRRNTdjU2hBS3V5L2RObm1QYzJoczdQM3hHRG5ka0ZuRG5oUVJwQSs3?=
 =?utf-8?B?VEw0bmQ4YXI3NisvSnBXNDhYMWp2V0JxVjFQd0M2ckRKODhPZXI4eDcxZ1pa?=
 =?utf-8?B?OXRjQnBWb0ltLzJLdldydFJKWGxndWlJUUN1V05EU0VDbC9KdUdGQWtUMEhr?=
 =?utf-8?B?N1lQazZjVFphSHB4NlgvWWVSRHUza0lCTXRtVmtWY3JWSlVSQ2RaTnZGWVJJ?=
 =?utf-8?B?K2JSRmZoUEt3VXdDRWx2cGRqTE9TOUd0MnFqeUFnMmhzZ3kwOURYOVBqNXo2?=
 =?utf-8?B?Z3NIQ1JjOG5rMEkrZUE1MTdHMDU5Z1JZV28vWHY5eXBhdXc1QmZJU1FOOVQy?=
 =?utf-8?B?ZHIwaExxTnBTaXFBRHVYTE4vT0NJc0pTSGxmM1RsdFFPTDBXamFybmFvemw0?=
 =?utf-8?B?dDNrUTZuQXRHV01QRzdWWVQwWHZpZUgvdDBOWjlmbitMdDhiNDViRENYUERz?=
 =?utf-8?B?UVY2Y05YV0l2ZjBvTEU1N09pbEJIVGZwTnFUT290NDRKRWxQdjdQVmphaksr?=
 =?utf-8?B?U1FYUEQzUzdSNFh6a1V3VnQxbU1tVGhQcWVxUURmZEpja1RCSERjaUJaY01V?=
 =?utf-8?B?bkxubHlBQzJiS2pDWHRKbW5Idlp6YTByUXpkRHNUK2NRM2JST240NzJMRHR6?=
 =?utf-8?B?Wmd2d1ZmSVdnM1dqWFZ4YzVLeVlrZEdnMEZsRG1PTjQ3VWdmc0dlSjgzdUpN?=
 =?utf-8?B?bzZFbXNVTjNYbEQraCtrQXc5MzVYTUdHK0xsUlJuNkhRR2tRaW1hYktVVElY?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd52a8c2-18a6-4478-2291-08dd81bc3cb0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:39:22.9667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUFqMY3Gr1jH7dnsEJoeUBz1rtSj/1hKPBYmugFDimfoDo1II/GfY8luUHQ14f+43nZ4rGikDCNDBnjwrEZeYwE4Um5Yf6yf+ZBiHCrtUJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4920



On 4/22/2025 6:23 AM, Rob Herring wrote:

> 
> On Thu, Apr 17, 2025 at 09:06:16AM -0700, Matthew Gerlach wrote:
>> Convert the clock device tree bindings to yaml for the Altera SoCFPGA
>> Cyclone5, Arria5, and Arria10 chip families. Since the clock nodes are
>> subnodes to Altera SOCFPGA Clock Manager, the yaml was added to
>> socfpga-clk-manager.yaml.
>>
>> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
>> ---
>>  .../arm/altera/socfpga-clk-manager.yaml       | 118 +++++++++++++++++-
>>  .../bindings/clock/altr_socfpga.txt           |  30 -----
>>  2 files changed, 117 insertions(+), 31 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
>> index 572381306681..4cda13259530 100644
>> --- a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
>> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
>> @@ -9,17 +9,133 @@ title: Altera SOCFPGA Clock Manager
>>  maintainers:
>>    - Dinh Nguyen <dinguyen@kernel.org>
>>
>> -description: test
>> +description:
>> +  This binding describes the Altera SOCFGPA Clock Manager and its associated
>> +  tree of clocks, pll's, and clock gates for the Cyclone5, Arria5 and Arria10
>> +  chip families.
>>
>>  properties:
>>    compatible:
>>      items:
>>        - const: altr,clk-mgr
>> +
>>    reg:
>>      maxItems: 1
>>
>> +  clocks:
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
>> +
>> +    patternProperties:
>> +      "^osc[0-9]$":
>> +        type: object
>> +
>> +      "^[a-z0-9,_]+[clk,pll,clk_gate,clk_divided](@[a-f0-9]+)?$":
> 
> This regex doesn't do what you think it does. You want:
> 
> "^[a-z0-9,_]+(clk|pll|clk_gate|clk_divided)(@[a-f0-9]+)?$"

Yes, the above is the correct regex.

> 
> However, I don't see clk_gate or clk_divided used anywhere, so I would
> simplify to:

ddr_dqs_clk_gate, ddr_2x_dqs_clk_gate, ddr_dq_clk_gate, and 
sdmmc_clk_divided are all names of nodes in 
arch/arm/boot/dts/intel/socfpga/socfpga.dtsi; so I don't think I can 
simplify as you suggest.

> 
> "(clk|pll)(@[a-f0-9]+)?$"
> 
> 
>> +        type: object
>> +        additionalProperties: false
>> +
>> +        properties:
>> +
>> +          compatible:
>> +            enum:
>> +              - altr,socfpga-pll-clock
>> +              - altr,socfpga-perip-clk
>> +              - altr,socfpga-gate-clk
>> +              - altr,socfpga-a10-pll-clock
>> +              - altr,socfpga-a10-perip-clk
>> +              - altr,socfpga-a10-gate-clk
>> +              - fixed-clock
>> +
>> +          clocks:
>> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> clocks already has a type.

I will remove redundant type.

> 
>> +            description: one or more phandles to input clock
> 
> I assume there is some max, so make this constraints:
> 
> minItems: 1
> maxItems: ?
Yes, adding min/maxItems is appropriate.

> 
>> +
>> +          "#address-cells":
>> +            const: 1
>> +
>> +          "#clock-cells":
>> +            const: 0
>> +
>> +          "#size-cells":
>> +            const: 0
>> +
>> +          clk-gate:
>> +            $ref: /schemas/types.yaml#/definitions/uint32-array
>> +            items:
>> +              - description: gating register offset
>> +              - description: bit index
>> +
>> +          div-reg:
>> +            $ref: /schemas/types.yaml#/definitions/uint32-array
>> +            items:
>> +              - description: divider register offset
>> +              - description: bit shift
>> +              - description: bit width
>> +
>> +          fixed-divider:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +          reg:
>> +            maxItems: 1
>> +
>> +        patternProperties:
>> +          "^[a-z0-9,_]+[clk,pll](@[a-f0-9]+)?$":
> 
> Similar issues here.

Yes, I will fix this regex too.

> 
>> +            type: object
>> +            additionalProperties: false
>> +
>> +            properties:
>> +              compatible:
>> +                enum:
>> +                  - altr,socfpga-perip-clk
>> +                  - altr,socfpga-gate-clk
>> +                  - altr,socfpga-a10-perip-clk
>> +                  - altr,socfpga-a10-gate-clk
>> +
>> +              "#clock-cells":
>> +                const: 0
>> +
>> +              clocks:
>> +                $ref: /schemas/types.yaml#/definitions/phandle-array
>> +                description: one or more phandles to input clock
>> +
>> +              clk-gate:
>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>> +                items:
>> +                  - description: gating register offset
>> +                  - description: bit index
>> +
>> +              div-reg:
>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>> +                items:
>> +                  - description: divider register offset
>> +                  - description: bit shift
>> +                  - description: bit width
>> +
>> +              fixed-divider:
>> +                $ref: /schemas/types.yaml#/definitions/uint32
> 
> As these properties are all just repeated, put them all under '$defs'
> and reference that in both places.

I will put the repeated properties under '$defs' and reference in both 
places.

> 
>> +
>> +              reg:
>> +                maxItems: 1
> 
> 'reg' goes after compatible.

Thanks for the reminder.

> 
>> +
>> +            required:
>> +              - compatible
>> +              - clocks
>> +              - "#clock-cells"
>> +
>> +        required:
>> +          - compatible
>> +          - "#clock-cells"
>> +
>>  required:
>>    - compatible
>> +  - reg
>>
>>  additionalProperties: false
>>
Thank you for the review,
Matthew Gerlach
