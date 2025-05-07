Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021101.outbound.protection.outlook.com [52.101.57.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3540319D092
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633440; cv=fail; b=L6y9ZInMVtPfJJ7MhVOvedDQZSi12trHvu6kYii3AjrUb/GRTH2iM/4I3EjOQP91kg4Fyl5kAKI51acpPjHD5ghBdfjG1CdEFqkpSMA64hZhoG1ZEdBq4L3eOKrGg3E/J+MpQ3nDl6tTNxj6ZiRvsjtGnyu6zFDp6soMEwx+8lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633440; c=relaxed/simple;
	bh=8imoQIJ9yQjD2HuE/f5W/0e5V1JlCqgvePObeW7Vx5Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KlKvvxttv+Rbdf6LFJ/kd1isTeuBT0M0IhOE8MLixH3SPFciXUfhHoYDrV5k4x7AM1dTF+TXhktWafwJ7yMF/EW4YO4Kqls6Xh7O+lAN5cBOYU+NzT+d6ZzfjcmZrYiu+1tpckpUPPTP45KDjSW8CGJvk1HfHGx1GBPgDPxjxq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=gtuTNTUL; arc=fail smtp.client-ip=52.101.57.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="gtuTNTUL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBep52ZrsEoxcUzGgzlQ3uzCumI5TT1//w/0oun6/HERq8rVX8NvgNugcddA0Kozwzmprdk0Y+NSx5/fRCZOSqx0Z8j+wolrwX59saYwlrEXs4puL/ofeGGr9J4MuRMZc2pQJz+2oQJFbWLSvHZQoIItOqGVrrLOe/ar9bso9gh3+E7fcaTyMFOArIG04oQACIpnzO4oiL3m7/XjAFz7BEGKP5clWZHnMykDeFeMGD7Ku+UqT14LsC0plS79l3MWSxugWieWf8TxG1YieWlZmYa3lBESPBS/SiX14wsEaL4kkFB3ka8b5vMqgNQJcra7W704w7nUF7wxkD3mVpBJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tt1vE3y/ugB5rTOZGohS4RXLmRRhCwCIJIE3kFm6aKY=;
 b=PCHZJoH9SRVFcPT8Ls1qye0KvtUL0XteUa87m7Y4/fRU4SEVBV8jFX7rcFG2v/LI0edkpqUFL6BPt7tL1VhlQ8MzoUXzA5VuLGpfQd+e3vyDK2u3Dgo30JNinKnLDl6k/yg/vA/1CLhOKVkhTVY09Pz4r0HyM4CtKORVVVMAndGkUhAvB3ZROo0tJDl4U/cUC2Oc+iQnE8W+kUAzEh1JJFkNsEjuBvnJyAgRWXoWwboEt2LMOnhFk8JxBxgDHLkru/aMiIvNqYviMorC/YTr1iyL25xRc4UWYBVJXwMS9ycZhftwvOvEt7VR1GTark5I3TPk9UeUo5pv/z7lWln9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt1vE3y/ugB5rTOZGohS4RXLmRRhCwCIJIE3kFm6aKY=;
 b=gtuTNTULn0AuJ7wNVYeH7GlagHDtqgJ0b6Yd28zQWuu4/xwDqjfd1uzdfSH7Iy98IIR/JKe44VweSewMtNd9id7wJ3dIee7CG1R+v8zQyV/0fkWSFDAVGO8ZKdhwqP854GRSA1GdJvLGBbrs+wpal1rmqKjc0uso8QXjibetKlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 MN0PR01MB7588.prod.exchangelabs.com (2603:10b6:208:373::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20; Wed, 7 May 2025 15:57:10 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 15:57:10 +0000
Message-ID: <0856412f-048e-4698-bd9d-83393fe93ec5@os.amperecomputing.com>
Date: Wed, 7 May 2025 08:57:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: madvise: no-op for MADV_NOHUGEPAGE if THP is
 disabled
To: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
References: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-0-f11f0c794872@kuka.com>
 <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-2-f11f0c794872@kuka.com>
 <20250506164004.e80e635a28dabb89b7257820@linux-foundation.org>
 <968a59cb-2d10-444a-bdcf-55525159f1ba@kuka.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <968a59cb-2d10-444a-bdcf-55525159f1ba@kuka.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:610:53::29) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|MN0PR01MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c09c6e4-9fd1-4ad4-a166-08dd8d7fd328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXYrakg5U1JwZkVHUmNOSjhjYnZlVTNGQ0xIWVlJUUo3Vml1andjMVdiaVdt?=
 =?utf-8?B?cWFvM2J4RnltZWZlY1NxaHl1L25jQTVsdEdHNVhKU3lFMzI0YWVMMDExN1lX?=
 =?utf-8?B?Rm8wczRTS2s5dGlBaFJhNVcxQktEbUwyeWZyam1OZ0FwKzh1bkVKaHNqOWJW?=
 =?utf-8?B?UksvMlhDMC91SnBiYkU4cFB5N2Q5U1FGVTdLSnlrVVptNHJ1czVqbkEyampZ?=
 =?utf-8?B?cit6QnErQWpkWGtyVFFKVlBEQ3JmcEsxMmFzb1phUENIMUdKanVnK3VHODM2?=
 =?utf-8?B?WTlHdllvN0RwN0piUUNrdDRJMnJiTzJjTDJuSzFhUHBpNGl3eU9nd0ZPbDdH?=
 =?utf-8?B?RUlZZk5xMXlLbTZGdVM0QWgvSGJaaCtjRzhvNGJOTkhjOFhsQlhCYjZ5VjhR?=
 =?utf-8?B?K1VPaUprTkRkV1ZUdFRZU0VwNk5nK2UvTDBGVlppUDhOd0hXVzFEc3N4c3VI?=
 =?utf-8?B?UWZUdS9veWVRb0tyeGFHSGhwZEhPMFVDTEUyNC9ZVW9hUlBYV0xEckgvWEFS?=
 =?utf-8?B?bzVQM25iN1lFUkIwa2c2R3RITkxMWkFhb29nbEo5cVQvTTFzUWluN3NXN0lI?=
 =?utf-8?B?aVF5MTdXMVBRVTlqM2d5RjlLNzU5Z0lLSHRuMFdvNGpWa1lPSW1zbVp0SWpL?=
 =?utf-8?B?d0QyN2hUcWp6Nk91bFpDVDhzUk1BNTlpNlNZL09CczVCZTZPSFJaVE9Vam9E?=
 =?utf-8?B?WVMyRmNKRHQ5bVl1bmFYY1JkUWxjUDJsQXZlcDMvbU5kbXUvR2l3S3I5Yms1?=
 =?utf-8?B?QXh4WmpPVkdrVVpSRld0Zm8rZVFGeTJPekNEVVFkOEN4NmErY3hCczZMU05T?=
 =?utf-8?B?a1RRZ3lkSDlYVXhuQUNDT2hNUnI4SFlhVEg0Wm1sdXJLNnNocGZKOEFjaURE?=
 =?utf-8?B?dVRScnhiWDIyL2xXWFBvQ20zYkFIdzJZUVM5TEFyano1ME9BZFdBclp6ZUdB?=
 =?utf-8?B?S21LOWw2QjN1S3ZyM1dCVFV5WjVqS3Q5RDMvbW1jenFYRkk4dzYzTlM4U3RR?=
 =?utf-8?B?M0lpcng5K0lvRnl3V1QvZWVMT2FlS05DNUVrTkxLUlVpbFRWeFNNZXhEUnRC?=
 =?utf-8?B?SnZ6WW1Xai9IR3V3NlNGQUtwWEZiNEpYSHplNUZuL2xlbklEd2JmMVdLeVB6?=
 =?utf-8?B?STJTOWZuNkVGcHgvM0t6bElweDNObnhrdk1ROTJ2bkovS0xIekx4WG51Q0tx?=
 =?utf-8?B?TGtrN2ovZHptaW9abE1VUjhMd0FiUEVjUzEzNkJZdkNCTmowZnF4RVFXMXhG?=
 =?utf-8?B?WVE4cEdCZUJtRVl1NDFuNFFqOWNmWEJqeVhjYVRSK0Fsc0JacXBNTXVKVGJY?=
 =?utf-8?B?YUtqOG1HZy9ydWdKRTU3djJKN3A2RlF6Q2VLZEk5SlFWS1g0NDQvdXJ5U3F4?=
 =?utf-8?B?cU9TSzlHWG16WkJjL1hzeXFiSEE5Y2ZLc1lFbDVGMTNabjBNZXJ3enFwNG9E?=
 =?utf-8?B?ak0ydGRMWDVxenJqcWsrUGpJUXcxYVBNR1I4bW96aTU5WDhaWVdnaEhBY3Zi?=
 =?utf-8?B?bTJ5VGFJUG5kVFNSQnJCVlJORzl0V0dNZFlRNDI1d1NkTnpuU280RUtad3J5?=
 =?utf-8?B?dzM0UTFTbFZYNTJHOGtTRXUwaHNpamhQOEZrYjg4MGNRNUd6SE8ySGlHR0VB?=
 =?utf-8?B?TEM5cVd0VXBvWVViY09reWtNdmJWdWVIdzJoaUZJN2pwMCtCWElKM0hvbWpk?=
 =?utf-8?B?UEttQXZJd2pBYVladTdpd2lsd2JtQzEwNDAxR0F1OVkyOERFRmpGME1YYldu?=
 =?utf-8?B?b1BtTnQyUk9xRC9IK3RvVEl6bmNqenlUbWp4NTdmeXpIeGhmd0pLdng0WU1S?=
 =?utf-8?B?djIvMWlMUVc0MzdIVnlXcGc2Y3BZU0FidE5DRXdUUHNXMnExZkFHRHFVMk5V?=
 =?utf-8?B?K3JXaHFTR1U0K0lKb1FOdGxRcG1mWThoZU1za2Fwdk1uc0lzLzVCN0pRVDhJ?=
 =?utf-8?Q?yn71xUU6nRA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWE4RjlYNjJLMlRrSlFJWGVlWDI3MThrM2ZHbmEvUzcrUGxrZXRTdTlvbXJM?=
 =?utf-8?B?aXBDZXExb0Z6d3h6Q0wxa2t2R2lkcGFkbENIOUNSbWM2MzREUDkxNnNicHFW?=
 =?utf-8?B?NnZ3SkxuOHJyOUpMNnVGZjJrK2thWndTYXBaTXlVUThnNis5UFpKL1hyR2lQ?=
 =?utf-8?B?RXhZNzZJTUR2YUpUZVF3dVk0MG1BRU45eTFYZ2I0VXM2MGJtbERJbnJud3or?=
 =?utf-8?B?Vnd5SmwxZ3NoTkMzd2xQYlltRFpVQ1RaU2t6VmtxWTFpQjgyektUWHBGRUgx?=
 =?utf-8?B?RlAvRG9Lb1BMRVh1ckhnbzVrbEplME1MTXAxUmlPLzNwWDQyTUswRkg3UnQz?=
 =?utf-8?B?aWd2Q1dPd3k2QlFidjNYblFSa2w4Z0lBVW5iSHJaL1R2Y0EzVGFGYnFFR3Za?=
 =?utf-8?B?NjRGbTNYd0tQNitKSmZ4QWJ6QitDZGVELzZUdGlQY0VMbHdDNFZJcG5zbzZE?=
 =?utf-8?B?ekpMMENBd3duS3k0cFRIYjZRT01pNENQa1NyRHMwaVZGa3NLUjhrU1VQTzY2?=
 =?utf-8?B?cGJ2a3RUdjhtdm0rSHNrNjd6UCtmR2ZWWTM5bTRicnRFclN4c2tCeXFqaTlt?=
 =?utf-8?B?UGtqQStzMEwvaklKZVpFamMxWk95MWhTeXRRZVVsU280eXFreHJ5dUthaytL?=
 =?utf-8?B?c0RrWFhXSTR6bWFURmN0TldoZWNFVE8rcnZjWmJxQUZYQncydk93bk5DdFFX?=
 =?utf-8?B?WUlUZWRNT1NRZ2ZOMEIyYjN6akVkVXc4ZGo0bENvQTF4cjFMOWZkN1JKREtH?=
 =?utf-8?B?NFd3RllnSTFGVWRpeDVjSElSVUR1cXRsd3hCWmJmdVJ1Q0pPS1ZENlo3czlM?=
 =?utf-8?B?NVBxUC9xaUhNdjdZdHA2N3ZUS2xZYzBVVEx2R3A3MkZsdDJpQVFKSjBxeVJ3?=
 =?utf-8?B?cnRTRVk1K2V2Ylg4T3lnbnI0SEpEYjM5elhtUEdJZzJQeHdFTkV2eU9yZTUz?=
 =?utf-8?B?UE1CMHFpdFFwZEJ6K3pzeEJqQXN5d1hRRkZ3WGdiL3pIZTFGK3VrMVJyMUtM?=
 =?utf-8?B?bVBVN2xGSE05ZzkzckE1NWZ2cUJkNnk4VVU0Qlp3ajJwVnVBd3gxcjRiTExk?=
 =?utf-8?B?bk1MTmRBU0RweldYZVlIK25DakVWOGFFOXh6RVM1WDRiSUpzdzgvWUdtc09U?=
 =?utf-8?B?T1pKdU5GNDB1ZlJINWUwOTE0VFNSdnRKY2pldFRjYmM3ZzdXaHptLzcveElO?=
 =?utf-8?B?Z3YvaXgzOUZ2dmZZWlpQWlU3TmhRRlFZYWtlQVFtdE15cjZySkpRT3h5RVRy?=
 =?utf-8?B?V2orWDJKYk1XaU13WjNPRXJTRVZXTjlSMVVURk02V2VQZXRCd2xYM1hiUStr?=
 =?utf-8?B?cGRwQUtONDVrQy9vZ0NrMXpjTXQwc3Z2a0hDcHNOSlhGVXl6TGltK3JUSFR1?=
 =?utf-8?B?ZVRjd1lEUEJSRjdJQnFiMlpESzJjdWhUMVZpSG42NmR1MnBVRi9qdXBMbDdF?=
 =?utf-8?B?TnYzczJ6Y1VXZnVPRWcvTlFKaGE4dmtwS3FmVXhKNUR0bElTUUJWa2YvTXVC?=
 =?utf-8?B?eEl6cjlnMW1EQmZuKzE0SnFHSEZmY2lNMVdxSWhqdG41R2ZvTE5ic0xOdWk5?=
 =?utf-8?B?Y2lwTlU3MjUydzJXSXhRVFltUjhLcEZ0b1UrUWM1UnFMRWV0M3A1R0VLZ1Bl?=
 =?utf-8?B?SUJlRGR3LzNnTlNCRm9Obk9XU0E3ZFFYMjZYVzZ5WjY0SExUL0ZKdklmNHhI?=
 =?utf-8?B?dnh1M1VNaUhPa3ArMWxYMFJHN2VHeXcvK0l1MDEvcWdieC9BRVZ6RTRJQW8y?=
 =?utf-8?B?WWRJb2lQd3ZJT0Q5bCtkaGJGcHZKakwvZjJpUmlIVCt6WExtZmFKaGFTRkRu?=
 =?utf-8?B?UWxIc0l0cklrczRVWXB5Um9tMjdrMEI2QTh2cG9MVGJZMVFYa2VNZG1Ha0pK?=
 =?utf-8?B?aTBzQ2V0bEpkb2UwL3BNbkFKZFlvT1pnMTYwMWVGNVI2aHFic1hZL3d2YUtJ?=
 =?utf-8?B?Ulg3RmFFbWtUbTMwZEN6eDhKcDVyamQzQUFtbUNxc1hqT2NkVnA5dWt2cGRK?=
 =?utf-8?B?c1U5NEFrMCtub0dJYm5mbGpmaTkvR05JMWxlbmpXZEN6VEx0UUxWQXM2dGRH?=
 =?utf-8?B?dXJidXl5L0VtbzJOcVU5b1BqTXBYNW9mWE9jUDB0aFNwWEFIZE5tWGZqdWpN?=
 =?utf-8?B?eEdCcXk3a3dVYkh2NjhIS2oydjl1TzBOeHI4bmlWYWJvSG1xSG9xem45VFdY?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c09c6e4-9fd1-4ad4-a166-08dd8d7fd328
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 15:57:10.0896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhmhERCOhKFGdLESeLU4mrIBImXpd45VWgi9yofxbe2bLyCTHtQGF4gHEwfRhy0Uts17kv8P45NltPpeaWCmV88iPbb+ySvHHd+1WyytiG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7588



On 5/7/25 4:44 AM, Ignacio Moreno Gonzalez wrote:
> This patch resulted from the discussion on [0]. The issue I described there consisted of two aspects:
>
>    - CRIU saw a memory mapping containing the "nh" flag on a !THP kernel. This was addressed by my submission.
>    - CRIU tried to set the "nh" flag with madvise(), which resulted on -EINVAL.
>
> The issue is actually solved with the patch I submitted. But it was also discussed that calling madvise() with VM_NOHUGEPAGE should be a no-op and should not fail. That's why this patch was created.
>
> On 5/7/2025 1:40 AM, Andrew Morton wrote:
>>> +#ifndef CONFIG_TRANSPARENT_HUGEPAGE
>>> +#include <uapi/asm-generic/mman-common.h>
>>> +#endif
>> Why is the #ifndef here?
> Because this is only included for the definition of VM_NOHUGEPAGE, which is only needed for the !THP case.

Can you just simply include <linux/mman.h> ?

Thanks,
Yang

>> This is the only file under include/linux which directly includes
>> something from uapi/asm-generic.  Indicates that we're doing something
>> wrong.
> If we want to differentiate the behavior of hugepage_madvise() depending on the advice, then we need the definitions for the different advices... Maybe this is not the correct place to do this? We could also do that differentiation in madvise.c.
>
>> If this hunk is truly the correct approach then I think we need a
>> comment here fully explaining what is going on.   Because it looks odd!
> To me, differentiating the behaviour of madvise() for MADV_HUGEPAGE and MADV_NOHUGEPAGE seems ok, and that was also the consensus on [0]. However, I lack the expertise to determine if this is the best place in the code to implement this change. Perhaps Lorenzo or Matthew can provide feedback here.
>
>
> [0]: https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com/

