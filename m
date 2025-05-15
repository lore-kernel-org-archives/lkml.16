Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D24282F1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292605; cv=fail; b=sN9cswlFZBRYkJDT17pldkagUIL0y/l9RyVhlXSEC0eiQ88V31SmoKrWaBU6fiXxMy1MJxViTdyoC3b+kL7VQJhmokrTOOtghk1FxGqMKGIX0MzFahKpKnGMrU+Yi7mBduO1qkp3SSJSJTE4I5M70jR6TOze3fUu7/rxfYEXg9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292605; c=relaxed/simple;
	bh=asw0uhSpj1VFoQXaF4oe0hXFTg4DXfBkfjUtmBr/daU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JtUwi0QwiS9jfpzMoDuSjc2AkUnKV6Xr0L8zzm1vSvLdFfs9hNc7NLzxDsYOgDPwgsgqrxhYuTEGXnt47IVfqH/hcYH6pUMUs9am+Ye/nmppvRiyIlkESA8mpGdU2ImPbCXElvGJf5Y5Hkgn1n59qGT0d3fdfioNss4uo6csXVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com; spf=pass smtp.mailfrom=kuka.com; dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b=Ur8iikrz; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuka.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b="Ur8iikrz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CL6SpyiWJnKd/9m5F8vtCCht2rtHeBWavHzQ+s5vEqsvCOkAP3hBXzqczoH7EzZGd6LMMJNQkGjXI3eO0RGbK3HzHQ1A3kX+M0NdlLBXvOxIqBDKmbyUi4eVpXSaAyiXOfrt7SL6HN3LzhndfuJNHz3rTiOy6knRjtLJ+H79t+alAfy/LQJtCs8TA00n6Isll4r9oTWYxAoDGLBt5gUkKzoMbjoJX1xTU+J82LnP8onkIb/SfdEesr/LYg7wK2gDQs+nEBWqBw6IRFPhLkgHDzhi+A35eZLMFh78LP62UTJkHofhtMZ2JJ0yHlTKXIDi7aFO1sNfyNv1Yo9el4M2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raK4Ufvw44Dsu6+QL3Iw3H01NfiJ7AdJU+JsTkrslsY=;
 b=VCeAB+JPsMU5N7aebPh4eNfZFR12kUiQyq6Ha21ZAIw6DiovCc+ZBoieEMzsowz0o3jA1yJWso/5KAT4g1j5kr0Df9hAU6kKgKeY44q7JsW8TtDvz9RaeeDecIeJVtlrfuc+nXxuQkVDtLqoN0UHjDJbBUQl1oH6kJ0puaSnDs1rgqmCDSjBvLR5yNEQg0Oie3g5fhD/f8URKJvw6mLJehxAYvqiMqDbuQumHmEdDqTyT6mirJ91h8vWdAGOY6vZ5CKk2lYLBmwhb5SNWbEviVRJ42J/6ioMlG0AL920Y9CLAP4HkDVjcV6joXe45KJRoHB4eNa5788Sg3Gpugkhag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kuka.com; dmarc=pass action=none header.from=kuka.com;
 dkim=pass header.d=kuka.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuka.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raK4Ufvw44Dsu6+QL3Iw3H01NfiJ7AdJU+JsTkrslsY=;
 b=Ur8iikrzJarrUzWuHoroS30QVYu9aSx0ddXYUBvxczVTbxS0Nmw02L+IDek+j2pqa7F8cwMW06MB6ErHUDupyyfZGtg+p/1KQTTjxCEYIUA6vXaGUkjjxICePZDxqkZDE5p88h1nDOGe6ejfZXaOIrQSM+/XlwgWXsbCBs/DgI8dK03MRce0z38iHvXtC2/wDXMfm26ktrfU0Ltm4pCj6IC7jgcQrbPlVVQyG1G+JjbSGlvFubJQnOMCQiS0fudH/hroO30nP8P8rKT/KKiAzf7MsmdA0qONcGPe/3bvdl1dYBhAqSOHBvBGM7jKec8F6cefAHIEgSiApL34DRO1yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kuka.com;
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12) by PR3PR01MB6843.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:78::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 07:03:20 +0000
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba]) by VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 07:03:20 +0000
Message-ID: <2044a883-d80d-4673-971d-d46f47532680@kuka.com>
Date: Thu, 15 May 2025 09:03:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, yang@os.amperecomputing.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <CADrL8HVja-8J1vcW0RLbsJVaLQENwo_LJ2mTj10uHeV06STxMQ@mail.gmail.com>
Content-Language: en-US
From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
In-Reply-To: <CADrL8HVja-8J1vcW0RLbsJVaLQENwo_LJ2mTj10uHeV06STxMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0271.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::20) To VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR01MB5696:EE_|PR3PR01MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: da248c26-b4f7-4a0b-2697-08dd937e9332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2NhcWVPUjRhTWkzRXBKVzd2eGI5ZXpkYkdxOVg2NVRvRkoyZHpTZXRXNjhO?=
 =?utf-8?B?WFBnZ01qajcwNlM4VVB3R0xHWWExU2ppL3BmRjV6WG9MRHE2OERnMkpaQm5x?=
 =?utf-8?B?bms3OHpCU3BMZ3QwWjV0VTFTTkI0aWYxSnFKWE9pT1NncFlJWStVNGNSWUpT?=
 =?utf-8?B?SGYrODkyWGpQbm1OZmg1RG5jZ0lvMEhoMlJMS3FicWRiTlMwMHhuVlFEaUJJ?=
 =?utf-8?B?Qnhac0lXMDllRTJ5ZFZqMWpiTzdaVW1tSGlDSDVFazNndXV6NUllY1pQeng1?=
 =?utf-8?B?b1hBMEhnWTNEQ2xlZkcrUHRJTERLZmNUbGlyUGxsMVkwdmFkSFZsTEM1TEZo?=
 =?utf-8?B?ek5NTzIxRFJZVkpGcE81Nkw4aldHSjJxaHJkaUpiMWRFU0lwNlFLektRTll0?=
 =?utf-8?B?aEJyNVlBM3pmTnQzYkZORURINHZwOHlCeW1ZMk80eGJSbm5ZVVBLdjJ2LzdB?=
 =?utf-8?B?OXoralU2ZjRnZWg1T0R5MkI3c25VQkpEK0JsVUhCbUM5S3R1YXZSc21HUVZO?=
 =?utf-8?B?N2d5anhpQzVLQWpKMHo4RDVOZnI5NXl4TXllTVg4ejFkUGF1NnRJNnJlUlRh?=
 =?utf-8?B?MTliWXFTWG1uKzF5R3krNnl3amtKRTdSOVV5YUx5a2ZYR09Ia0x3M2hoclBx?=
 =?utf-8?B?UUUveStSZFZYdlZsVkp3S3ErUFVCdVE1b2JPZ05wWTNJcnpPV255U2kxRHRQ?=
 =?utf-8?B?ZGJiSkdaN0lTbXYzNXdNRnlwUUdLNmg5RUc4R2owTWU3TWtxTmJCRktVcjF5?=
 =?utf-8?B?SzRneXFCTUZFNHZ5RnNRazJ2UFE3emtmRk82Q3lPT3FzMGhHR2xjZ2FSQThh?=
 =?utf-8?B?VVpKS3p0VFpFRWNqTzBJMUFId3FHL0FGY1RmTStCMU9tczMrVjVHN05PblpF?=
 =?utf-8?B?TVJtb2hpUk1aay90SXMyZTVJUmUrMExvbkZwUWt0dGZNMzFnU0oxbnNXTzlC?=
 =?utf-8?B?ZGRHUVJsQmhlN2xlZEEzdkNUYTA3eTY3UGpPM2FuZEpxd3pWU1N0eDUrQmVu?=
 =?utf-8?B?NlN5MEJhaW9YS2pDT2tHSE4vdG5wUWZ2dC9FL3AyT01QNExKNTVySE9kaGlF?=
 =?utf-8?B?cWNjV1AyS01Sd1Qrcm02Q1RuS0JVVE5IM29BK3laWE9qNlNGeXoyY3M0cWRh?=
 =?utf-8?B?UzdqbWFhTEZ2Zi9aeUpOeTFFMktXaGFDT2h1dnRwZjVIV09rdVNDcFhtL0hW?=
 =?utf-8?B?N3cyOVpsM25TNGM0ekZGVlpqWXN6WUJmbG1ZSHpnRHdWbmJCZVJwRVpWUTRs?=
 =?utf-8?B?S3B3blNHSmJ0TUtMaFNhMmZBOFlFV1JkTUFOeFlDUE1JK2VSRUM1cU5qY24v?=
 =?utf-8?B?RjlROXpTS1E4bTRIbUtlbVBwTzZvNXNpcDIrUzRGbktUYmhOU294dUNhOUp3?=
 =?utf-8?B?UVFuNG5rZGZvekNOeG90WlBEbE5ZNHZZNUxYZVBWNmJzWmJtZHloTnZVTlZS?=
 =?utf-8?B?eEcwNEI4aHNIaHk4aGRwRVZueFhtTERWMWpYU3pSejAwT2toQ01nOUx2Z2VK?=
 =?utf-8?B?S1NGYlc1b1NkRmptWFQ3ajQvdTllSzZiSmp6Z3dXZEhacGtzbTZjYnd3K3Fi?=
 =?utf-8?B?MnZqY2pLeEoxbDRLZjRjeXF1dlR5T1V3NUtidXRhZkdaMGc4YnVvNjRQbzNh?=
 =?utf-8?B?SjRQeVRWSlJWTTJoVDdqVnIzMTFCVmp5aW5iMk9IdjlXZ3cvK0hBNTdJb2hj?=
 =?utf-8?B?RzlvYnhXS2VlVEt5MUFESWxVM3ZMTGJmekN4ZlFIREE5NFR2Y3F6QXJhdFZi?=
 =?utf-8?B?ZmM2eG5rQkNyeEdHMFdCYWhnRUE4N3pubEJGalg5UU9pazYyWWU5L3NaZWpM?=
 =?utf-8?Q?UGnT3bQWYwfM+0q3VxxnOpDM445vPqZy6BDkU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5696.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVYybzE5Vm91Zk1LVFI1dW1FV1dsdmRSOWVMTzBkQVhCaC9mOWhnU0dZVDdq?=
 =?utf-8?B?MHZNanhRM1MweGszS2lUUmE3VWZtT2pzNy9uYnhlYjFPdS9HNTJiRm11cStt?=
 =?utf-8?B?Z3FCRHdQSVhDVS95WS9WcDBTTy83WjkzWVpudloyMmVRS0IrQnprbFB1ZDY5?=
 =?utf-8?B?WDRhWmtKK2twQjVPOVc3MzM4RWwxWTRNUUZVK3BkWFVEdEQ5TFd6WW13MlNG?=
 =?utf-8?B?MW1QcVRtRm0vZE9uallzUEo5QjI0b01td3ZjVFpQOFFleVFYbjRZSWN3K2xR?=
 =?utf-8?B?Ky9kdWdlTWd2OFFjVmRJRTlpVDlQVEZLdGhpRXpZV0UrbnFHUjVrZEZQeGkw?=
 =?utf-8?B?UExnb3I1TnpBaUxVZzdxeWNOMmpxcFVtb2g5aXMyd3pUeUo0cjIxdnRuSmZJ?=
 =?utf-8?B?c3pOdVVuYVdUSEp4NEkzTFYwWUozU3JZY0lGZ0JoTHRiUC8rNk1ndGdta0No?=
 =?utf-8?B?dkRtVHVnTWlDaDJnWU1vNmdzcTVjVUkzTmZFVnBVNWExOG44ZDhKSWpnbXZl?=
 =?utf-8?B?T3BxbXJpZnMzaUhtL29hVTJtOTh2U0VXVXh5ak9pcmJkMTI2eTFETnZjRUo5?=
 =?utf-8?B?WWtqeVM2MENzTFpEWmF4Uyt4Q09HVFNGUVN3T2MyQjFSRUE0YjQyL0t4YlVm?=
 =?utf-8?B?Z0luZkYvOENKUFZOeFdkTnFWbnBuZi9kSC9kTHFmSFFITFBSU0gzaTJpSjhJ?=
 =?utf-8?B?bDNOWHJuUzdnSCsyRW55TEpFU0s5UFVkTUZBZXZDbnoySDdTdXhiVHF1ajBn?=
 =?utf-8?B?Z21XZmx0MkZiWkJwZnRjUW8vU3hNV1V1TlJjSkk3ampSdi9QVEtTeFRnbGVM?=
 =?utf-8?B?V3dlQlZUZVRxazJpQ21HZDFhazRGODJreDV5QlpqR3Z2R0lnSEthaXNJcWhp?=
 =?utf-8?B?UHZhZFZQVk1yQzhIZXcycFF1S1NKQ0Z5R0hDWVpvMlh0bDliSlBncytGVXlU?=
 =?utf-8?B?aDhGZ2RvS0hYcExWeUczL2FWTmlZcHdYYWFUSmRqektTMW5JUEZEdWZJQUh5?=
 =?utf-8?B?bG1UaGhoc1NOZmxVbWJWMnFwSEVvUHkyV1VwM1RzQU8zVHRKeWNMTDJaSnVa?=
 =?utf-8?B?YTFsL1hHcGJOUjdaRXhucUtUNE9ITVNwRDI0cHppSnZaangrSkJWeVlYOHJM?=
 =?utf-8?B?cGRLMlczRzR6SnEyN0JDeWlrMnNqc3llZUp4TXFxUmtFV3dNTEtkUjFXU3hK?=
 =?utf-8?B?d24vSVNtL0Vyc1NBVXkwZFVEdjlWMFdJVlN3aG91d3hCTy9aTFpLVmhYTFQr?=
 =?utf-8?B?NjMxblEraDRWM3Q3dXRDWmVaU3VFdzhWOE43REdFeUZ5UUdDT0VDdHdQZGt5?=
 =?utf-8?B?U3oyN1JYWC80MklkcXNvLzJGMmpmQm5XSTg2UDkxTG5QMDc0QXpDa2dFNDhI?=
 =?utf-8?B?QkpQTlQyVE9yU1FOMS8zK0ZZaVM1Zi9lbEJSYTZUWWNZbk0xTVdpVk5xRUYz?=
 =?utf-8?B?RWtnMlhYWE9FRjVWL3NoRFJDT21oZjkrbVprOG5nWDhGNngwSGVURW42d1pm?=
 =?utf-8?B?OEgvdEp0MEgvdElGZVZzUkJSeFBuNDJuQVpYa3JYazRvYmt2WXBEemJ2L3k1?=
 =?utf-8?B?TFFUZ3RyOThPMmMvekdKKythbEVWL1ZZM3gvTlY0bTZtd05ZZkZRdE1QaWdp?=
 =?utf-8?B?RjZUSURxSllueEExQkI4Z25ldGYwUUNMR2dZVExDM3Bjci94c0VmQXJBTmZx?=
 =?utf-8?B?Yk5qY21nTHFHZjc5bG1jZkY5Z1M3MktYY0dmN2MzVCtnQ25wUWhyQzNmN1Ri?=
 =?utf-8?B?amxhYnkxMHc3WEt0MjlGK2VBK2lMckM4R09UWFJLR3JpRWVsajJzRDgxamFl?=
 =?utf-8?B?TU00V3dza2dVQmNYYUFWeHRJZk44Y2UvRXM3TldIYW9Fem5IdEpOZlk0MXNI?=
 =?utf-8?B?S25qMHMzMHFFQVNHYm1MQzdXSjdBSW82czF5d2FqWUd0NklWNmJET3NQRGFr?=
 =?utf-8?B?eTIxdzlZbTNEZCtTZDlZYlJRLzFRSEplQTh0ak1yNFlJeGc2bHVEQnNHdW9G?=
 =?utf-8?B?Z1l3NHZrZ0pWT1prS0hKVm8vcStUekhWeWNGamdWYys0dFBQWSszVGw4b3RL?=
 =?utf-8?B?enBsZmN3bGxjZW5UOXVuQkFpZytJVk10MnQvcGhnUjZtYWhRL0hnWFd6Tm1K?=
 =?utf-8?B?bUt2bE9DcUpLVU1QOEhIeWdrUUxkdGJ4b1dCK0VWS3dwSk5kZEFzUmdVeFVn?=
 =?utf-8?Q?uZ7JMINcgfl6nNrdNFv4vk8=3D?=
X-OriginatorOrg: kuka.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da248c26-b4f7-4a0b-2697-08dd937e9332
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5696.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 07:03:20.3158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5a5c4bcf-d285-44af-8f19-ca72d454f6f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y77hFoVo2DRgV+2Ab145+imwikMtP7ac9gDJSULcbXM9zymZKNcUJotV7dbHsoGOaSUuWipNbpY9LRvJp/i1gaFUTPuHIMzRi8496neFht8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6843

On 5/14/2025 10:15 PM, James Houghton wrote:
> On Thu, May 8, 2025 at 3:20 AM Ignacio Moreno Gonzalez via B4 Relay
> <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org> wrote:
>>
>> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>>
>> VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
>> it makes no sense to return an error when calling madvise() with
>> MADV_NOHUGEPAGE in that case.
>>
>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>> ---
>> https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com
>>
>> Here it is presented as a separate thread to avoid mixing stable and
>> non-stable patches.
>>
>> This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
>> kernels to return 0 instead of -EINVAL.
>> ---
>>  include/linux/huge_mm.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b07247707d16cc67 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>>
>>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>>
>> +#include <uapi/asm/mman.h>
>> +
>>  static inline bool folio_test_pmd_mappable(struct folio *folio)
>>  {
>>         return false;
>> @@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>>  static inline int hugepage_madvise(struct vm_area_struct *vma,
>>                                    unsigned long *vm_flags, int advice)
>>  {
>> +       /* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEPAGE is not supported */
> 
> Do you mean "but MADV_HUGEPAGE is not supported"? Just want to make
> sure; it seems like no one else has asked about this yet.
>

Yes, this is a typo. It should be MADV_HUGEPAGE. Thanks!

>> +       if (advice == MADV_NOHUGEPAGE)
>> +               return 0;
>>         return -EINVAL;
>>  }
> 

