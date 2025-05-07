Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB61139E;
	Wed,  7 May 2025 05:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595856; cv=fail; b=tk9hpwf9+qMYAqObs+GmpvIdKidnj1KY+M+ASiecP4F0nFywBnGd3jYL0EX3aOjPg+Ywtm9Qt6UGo4uihpL9fbH0JZE0Q7OnZxzkQnGt3SulPnkjDPelebx7YeU3Btyn6wHLvAC9VImMr6tGev7Me1cwgUlz0It5ILQBIIdnQeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595856; c=relaxed/simple;
	bh=iu05f7cjI8AwJ1txrOvUF8PbHtB7tBbCwedAne1/BOU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TIYL/1g1LdWAYGynvgdTQ16Atiqycz6FY+5/82HzCMx9hWp4KGn4tzBzNAJ6cVW0IRbGJasmdV4GArHo8plKJnC1nYHcDnOqam/j/CrCMi4vAFa/l0z9xBsYLzkyjcS6j6ABEcaIKxjTQL3xfR4swWLg5J7OzJdcNJnTevsjVss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WmZ+ikxm; arc=fail smtp.client-ip=40.107.102.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WmZ+ikxm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3Ocl6+HieoarbBHzW/OGk75NcAIyI1IOFU/A3v7lP4CDfVJNhxAMa+3UtZWeyc6sF6ZHtD+Z0qttME3YEei5NqE0BdMfRjFAUIEHGrAbfj0lM/I52VN+XWgakWCGdDs0+yHYQVtCer0FJSAZuuAUa4OfWLBKrmmhPfuvO+2rBlRmvJc1Nq4FcvYNiMYZJuSP4c7kfS2imZs1qY9zoK/atAaMuF9arMmIpUPoRWY6YMMPG8LHzMcm7zoNldNJWJffhY9Sm68QQ1WKtkWTtsh2+JiC6uVZtiQ1RizHb0FViG1qXPfNddDPpF6pPROdKkwdVv37McIvECF4SAqLK8UDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIIoXi9R2EoOX7N+DihUe9gwwlsja070oYsK0gHnG08=;
 b=gAEqvQqUAXFKH6hUIwZZCjCHE2smllzcCvx3PKGcxl10JfD16HtEuHWROUdQlf5VSqQjFxmowiPiVkWW0R49wAei3tfvMotyDMJbulcKyduH3W0oGvLGU/YcW260obLo6Pv9sm7d7PHwWDxp9+X9oA7tpK+NjAbORa0BM+ypL3MjnYnfEJLaLEQRxQFxJEfVvTrDJc/EuklIbarweDyAk1jtlkvEiDFnhSbB00YMV3usMDHxiFg2cCgaXTjt71mGoTtwok9GdcNtH9rDW1rmwxN9raPycr8ZmsN70G/gzeYhBDQfrrmZqoqQZgWUMB2IXsv9WWbQLdTP9zJiBxcPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIIoXi9R2EoOX7N+DihUe9gwwlsja070oYsK0gHnG08=;
 b=WmZ+ikxmKT1k28/JhZ+xkkBXazNSW1gD0OTMJartTz8z+h/GAGvXaXReg4P24qTYABtczRubY6UpV4oiYJPsFDLsdVtNKqq+M3v3xVlQjgO9amd+WDl+dANTxHc+USvAGU91FsrYEXToeAHczFZHYD6imPq4T2AZLHMXVOGJesuy6vO1mbrFFvwTo6XT/VXuMUXgLxXb7n7Ok+Gc8MN9kXueMFYBMJNuxOm8hyhFLKH1Wrx7lLlO2xbRphSzWmp3/bnLwyJajJ+F2AbMygt2jYYnet4m//jk1e48QLDWSpDp/ZXcXWgYk4gk50oMXmFPWVwysbng+mBtkcatNEUdNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9025.namprd12.prod.outlook.com (2603:10b6:610:129::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 05:30:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 05:30:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 14:30:46 +0900
Message-Id: <D9POJZ60ZCYQ.1XBNZSXOQ9UJS@nvidia.com>
Cc: "Matthew Maurer" <mmaurer@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/7] rust: alloc: add Vec::remove
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-6-06d20ad9366f@google.com>
In-Reply-To: <20250502-vec-methods-v5-6-06d20ad9366f@google.com>
X-ClientProxiedBy: TY2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:404:a6::25) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9025:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbd3874-6724-404e-078d-08dd8d2853df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sk1ONCtwd0VKNmN1UHVEa1FUYzNrZGR4TU13S0pVT1RubGg1NDR5Y2xUeVpM?=
 =?utf-8?B?TitmVEprUlo3ZlI2cU1scTJja01vcFYxU24rNjEvbmg0QlY2elZMbC90UGtS?=
 =?utf-8?B?LzFWUGt2R0IwSksxQ3RZWThlZk5HRTV2ZU93WE8yalBoWVIwSEtMRWR2cjhG?=
 =?utf-8?B?NlpKdS85aFJrNmZFa21YdE5teGFOWUFCa0UyYWN2am1YRjJJVW9sTjByVDZU?=
 =?utf-8?B?U1ZTNUorNHVmVnBPMlpIL1hRUXpFNENrRndOVmhDZFBVdUR1a21jclgrOVdj?=
 =?utf-8?B?THNXSTZraWVHYVlPTGFOY01JbDVzSnFBYVRnUGl5VldnRFFOZllZaGNheDdY?=
 =?utf-8?B?YjNSY3JwcVlTRDZVSGVsLzNuT3RvL3dYeVBoOUR0MDN3U3NMdndkUnl4eDlt?=
 =?utf-8?B?VDhkbEw0eFVXQUlmUFhiVzA2VUhrUldLVVN4UGljdGNnVERKYnRFRWxvdlVi?=
 =?utf-8?B?aXNVSEYyaDFBRHFrKzIyZWRORVBuZWtCUTVtNVA0WEl6NW9zRmhFOHpyRnI4?=
 =?utf-8?B?cUhmbWhlemVXejlscXEvTENVaWltUUtQSENJWVR4Y1VoaW1vaHlNamtRcmJS?=
 =?utf-8?B?ZSszaVVuWWdWeGp6Z0V1TVJxK3AwT2ZXd1Z0M3h5RnBjUEc1MVQwMkZRNzh1?=
 =?utf-8?B?OGNuT3ltNTZqY20vV3dJSVRYcTRtYXpjalQ2a0JWK1FtRGp3RXBrT2JBYlNr?=
 =?utf-8?B?eWY2K2lMcFlYWTQyRURuWnQ1Q2REV0VQMnlYeTFRcE44dVN5M0xmN0hiN1Yr?=
 =?utf-8?B?UE9hcFE0dEQyN0JOejdUYnlrNzdaK3BEV2IrZ05MTmRSVTRJOGhVRGpab0pu?=
 =?utf-8?B?aFhTNXNKN1R6L0RWRjFxdlpTV1d4OHNNeEVwd3pGUkZBK2xjNzJBSWtRaC9B?=
 =?utf-8?B?NXRIbU9zaWUrc2VyQm13Rnl4dzZzZUZmMVBQdDJFVXdscnFsczZoS0RUWU45?=
 =?utf-8?B?a2ZucVdvZDk0THljM0VPREVOVm4rZ1VKSEhobGYrRHZVOVFNM1JGQUlzZFZM?=
 =?utf-8?B?YVNuaHdHR3NXS2xvWk9mSjBlV0taQ2NwQTBIYVp5ekxiWWcxMjhLVVJnakgy?=
 =?utf-8?B?OVZwemxlejIxWE1FdWxmc0Q1VDR5R0w3bW1EQi9OZ0NLbCtEN0lmSTFaWUl6?=
 =?utf-8?B?aksvVnF0Zzd2VmZlSWVsMHAzajljTlpKNlJRTjBDZUlBTHRYUHV3Q3hxdmc1?=
 =?utf-8?B?QU9XZEhhQWVCdmI2aUNyNVNqL1N3L04vUGZhb0RuaHFoUzFRem8rdTlnS1d4?=
 =?utf-8?B?d3d3VSs5OWh5bGppcGRpYUV4dUJxU3JvN2ZGNkRFbkt3OTJwN29IUG9YYnZN?=
 =?utf-8?B?T3YrUnhpbDdDUEhIUS8rOVlBTXFPUDIrNmVrSXh3bmhDeTFEOWdONklFb0E2?=
 =?utf-8?B?NjhlRW8zRGcxRUFOZy9vQWhQdWgvWmc4NUdlYm5CNExXQWc3ZlF1RTJEY2Yy?=
 =?utf-8?B?S0FnZ1VwSGozUEdrVVRTUWlpNHc1RnFqUnl4K0I5YnBpVGxlN00xTHk0QTRu?=
 =?utf-8?B?Q0Ztdmt2enBLcG93Y2F3ZUhRL29KY2xEQ0R2REhSalJYVnU3UkVvUVY4b1NJ?=
 =?utf-8?B?NFVaV3p2NG51RGFmTGMxYXBjNk92N2Rwc0R6T013RXVjYmFXRFVoWlgveklY?=
 =?utf-8?B?dmQ4MG5wODBVZW1tb1NSRUxBT3hiYTJzNktqcE4xZ1FyUzZNQnBjcm9QbWFp?=
 =?utf-8?B?MUJ6dG9CVVgxZmJsOU1tM1drbE1lUE5DWEdXYVVkd0o3VDkzT0dJVlljcHRj?=
 =?utf-8?B?U1NpS1N0RFpzbGZyVE1yK2o4RmMrUXcwWjFLMVdvNk5VZzcwTkJpNWg3K3hK?=
 =?utf-8?B?SEZFQktNbUlEMlhwOHA3aGk3akJiNmtIMnRYTWh2NVhzdDVqdXJreFc5QnB6?=
 =?utf-8?B?bWsvaVlDQ1lRMlBMbmQreEpidS8za1hKa0YzNXduTDJwakRmVXcwQjNwWXpM?=
 =?utf-8?Q?3SFCSXa0HHI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGVGTFBtOUg4cXU1Q2lzNENoeFVuUlVKY2hCRlc1SVVMVndzbnlyM1hiblFH?=
 =?utf-8?B?SGpDQ3A2MXJCOGhScXcxN3I3dThHMzJPclpKeGdUWlN5TWlSTWtRVVJaS3hS?=
 =?utf-8?B?YjdyRDRWVTY1SFNxc3lUaG9adXpQSGxnTFV3dUNyTGFRSUUrTitZRlpRUzVI?=
 =?utf-8?B?NXZkdzRLQmJMbVdqbnZVUktOZU9TTjFldFVNOVVCTlJNc1Bub1A4eUhCdDMx?=
 =?utf-8?B?dmhoV1hkajBPSktWMnI1YzhuajJ4SVVGMENXQVdnMk1CNDJCT0VYNkZkMkRR?=
 =?utf-8?B?YXF4K2FnT3c4T1RTdlBzcjhpT0haLzhyRThxcXU3eGZ3VktJVXJWZHAxVS8r?=
 =?utf-8?B?WXZjcHhUc2svaE5OMmpzbFN0UXdkREFabEtkYUViaUxmYmN2NFJ2aUxDOVQx?=
 =?utf-8?B?Y2owdVF5RWlESndCY2pBOVZ3b2dEQjRHYjJEMHJCMmtzY0hSdkNtaEF2cmxS?=
 =?utf-8?B?NGZGQUVtSFJhSFRXZ2J4aHE3U3FjSk9qdHNWanZraUV4c0VBYkFLd1NXc2ls?=
 =?utf-8?B?Qy91d2ZnTS9nY3U3ZXN6K1ZoWXM5VWtQSW9rZ1FpWFcvOS9KdGd5WmRrVTIw?=
 =?utf-8?B?Z0R2bGZkSS9MYUJWVGNYYmFScXJaYWhYWDBJSzBKbkhVV1ZINkcvNVV2WWZD?=
 =?utf-8?B?TWpENkhqM01CTkR3NlRqV1dqNFlDWHBiYTNhRUdUaFpHNDNUNnduWVJlS0h0?=
 =?utf-8?B?c2tCZEhCVk1ucUZ2YXpQMnl3TVczRU1xSENUeWdzNGtVRUZ2SFczSXZvdWdH?=
 =?utf-8?B?SzlHWTNZZ3dDMU1POGNHVWJZc2NJcHR6akljdll5UXVhcUdWbk9QdS9zdlVC?=
 =?utf-8?B?SGVZNUs5VGkvNDFEY1pnSVQxSzkyM2dWZm9FYXBKZHdGbnIxZGVqYThEbTdS?=
 =?utf-8?B?MXBMb1VnSHRYV0pzYitqYjB5S0paRTNQMTF2SzNJOTd0cGVJVkI3UVZ3ZUxC?=
 =?utf-8?B?NVpHTFl0QjRuTFQrUGQ1dDRkRVRHdWZjbFgzSC9zLyt3RCs3bEVzbHZhV2hJ?=
 =?utf-8?B?V0REQm8zNU05MHhEUjFVa2pka25wRWZmVFk4OFUvUHhWcTE3NlJFL2NNYThj?=
 =?utf-8?B?QmdFSEhGTkJwQjJLSHZkdWNreFlZRE9Gc0hkVVJJRGZveHlTMjNOR28zWmF3?=
 =?utf-8?B?L09tcndEcmRqR1R2VmZDc2ZUeVBKR1Vpd3FLbWtVMlFIRUVtd2F1cTV2dnU0?=
 =?utf-8?B?MElLdVF4RE1QcnhDM1d5UHlFYXU1OVp4UHRMelVPeE10SDFPMGZTSjVpamYw?=
 =?utf-8?B?RzIxbzdCdGhIejFSUSt0UFBOQ2tTVXFYQ0tvNkpIamZEak9IZzZ0MzkydTVI?=
 =?utf-8?B?K1FRWDI1MGxMV2FDMTBKU2twQ25laDhPTlp1RnJLU1NpakszTFJlMHUxend0?=
 =?utf-8?B?Mk5QdG1SVFhoU1gwRDJLZTdQaTlBamorM3VkWEVXZGdPcWpSeHFyWVA0YUJk?=
 =?utf-8?B?eExCZE5zLzlFVjBOQlZTU2I5MWprbFJReElWeElMUHpEWnY5Z1crdmNNeGZF?=
 =?utf-8?B?RE9zQkU2V1I4NWFNSFdUSHpVbmhuOFpsZ0VQL2VqOVJzeC9SdW9NUi9lbGQy?=
 =?utf-8?B?OFhxSzRPOTRRbS9GOEJINmJiVW9BSk83VWg5cWpqRVQ2a3BKaERaenVXRDNP?=
 =?utf-8?B?S0NSdDFlNEdPOHNQdGtkbXZsOURIMjZpaTVGV1QvdCt5VHhGSk9IWmE5NmV3?=
 =?utf-8?B?NWNKQWd5dVJJeHVUUFZ1aFFFL0JpemNFZWcxZGFVVmdZcElQQjl2Y3lROERQ?=
 =?utf-8?B?QTRRSG1lM1FxMHRDei9xK2Uyb1FWV0dERU1rd09Ma1ZxdDZMYVBjTmVtcW0w?=
 =?utf-8?B?ZGhENENmTkJRWDJzMDFObkkzWG1TNm5VRjViUnFOUEZQQ2FGM053QnJQcDJV?=
 =?utf-8?B?K2FEV25wRFlTYjhYdXdIQ1pVYzdzaHZDMFovdllHc1NvVDBFV2FQdjBoOUY5?=
 =?utf-8?B?Zjdieko1TXlqS2pUKytUQXJJMHFCZitOTDRHWHVSaVZoZk4yK09iYW9temxR?=
 =?utf-8?B?QXk4bjc2SFFjYkpXdGlkaWxocmJoeTRpSlVORHAxZjNZNFpiTUVqR2ZCWUZV?=
 =?utf-8?B?U0Z6QVlJYXJYa1lNVDhEdFpvTWp3RDk2bVdwSm5vY0FwREwxM3RKOWd5Yzl4?=
 =?utf-8?B?Mi93ZlBMYUU0dk95eHpKTGRHSlF3NCtuZ2dMQ2xDdjdVajcrMVhCak9KMmYv?=
 =?utf-8?Q?ApcqdABQshrkU3RN/oVvYtNn/SKXCSSnTVuKmsO3LX5U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbd3874-6724-404e-078d-08dd8d2853df
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:30:50.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxpG1W0cuu5x1jl48e3rvFVneJkJaV/kij1WTS2zN5tds3gUc8lOKVhfFEbJjY1NAHILh95qeIBLJkwbwZ0v0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9025

Hi Alice,

On Fri May 2, 2025 at 10:19 PM JST, Alice Ryhl wrote:
> This is needed by Rust Binder in the range allocator, and by upcoming
> GPU drivers during firmware initialization.
>
> Panics in the kernel are best avoided when possible, so an error is
> returned if the index is out of bounds. An error type is used rather
> than just returning Option<T> to let callers handle errors with ?.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/alloc/kvec.rs        | 42 ++++++++++++++++++++++++++++++++++=
+++++-
>  rust/kernel/alloc/kvec/errors.rs | 15 ++++++++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 3298b3b0f32c70f3fe517fcb7af6b9922fea926b..8845e7694334b672476ff9355=
80f3a9eb94d23fe 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -22,7 +22,7 @@
>  };
> =20
>  mod errors;
> -pub use self::errors::PushError;
> +pub use self::errors::{PushError, RemoveError};
> =20
>  /// Create a [`KVec`] containing the arguments.
>  ///
> @@ -389,6 +389,46 @@ pub fn pop(&mut self) -> Option<T> {
>          Some(unsafe { removed.read() })
>      }
> =20
> +    /// Removes the element at the given index.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if the index is out of bounds.

According to the commit log (and the code of the method) I think this
panic section is not valid anymore?

