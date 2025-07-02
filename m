Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD8217668
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438466; cv=fail; b=Ery9TMb7rmG0q6QP0Lu9HzdE/o+nszgHdZF5sV0tSBEpHgG2Zv5CQ2UU+PR6SBkQcMX5GCwAVJ+9sceGcx2O5/a4hwwnMUoqtGzkN5YW4Cpm/08jZBogMv1HAJMGZ3uhz0kKlNCTzZBIBvTBbU8WwBo3CmMas/gGUR2FPShC/Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438466; c=relaxed/simple;
	bh=3aXwIPFxY47PBr76vMUOA9/ipNX2FzNhWbn77FOL9tY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YC/ovpDuAGIh7WBYllMtJJeBX9SmD2eqdflgO/gI4o/B1IDAPmQAKTbMiSLmuruMKAHU+qVTbbam0WSn/I2sxG3vPzu5XccReSCg/4Uf6mpNx/MAnTRhaYGsxn/9/uD94ZxQjHP4aSp2fjMNeJ7TNgfqN+380VvzRSc5IT4IaJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OieSMB0P; arc=fail smtp.client-ip=40.107.92.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OieSMB0P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAgW/u68shOA6P1JDtxEGTNGFVd/YgsAz9yCjhEfH6k2vLR//wjMgTlIBqze6iAW1QK5g3z3HZEaw6RiOFW8G2fNwheVB0YWHs24F5AXXXLN/qZkLqtE7SUO4LG0BLgAyeBty7Olbrm4hMd5Dqul9G1QI11OtMVkeZA1eaQ655zI6LAFstOsg7NVdNPsDeeXpz472m/5Svhj8os2Bv9VUc8n0WkbEP0RZfh/BGwC/Iy/JOZ50BfKMEZTDByrO8YnUJC2FfEU0zHmyyzjk8BSYf52Ny2DGnE4csl9HT0peAAj7mBcjF1vTU8M03DknJRRXc0yBYZqfHMpcCkEf54bog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEVE/4h+FbcWS1DNffMUXk13vxElKf8fw4EcGPJ67cI=;
 b=eHxIztmFIYtfdBwOuUdYg317xEr+BxEHoEwrgrGvafDGFBLkhvAtluG1CJqajiHlRCfK5EW/r1uZGnUl/MEYNhXtQytvY0ACImb+tZltiwOvZ8Hv5ioJ5c74b8WjIjwh7RS8yu4ybKMommfXIDXdPwl67mWRftI6+VD5YYjxl7NFtTl7U66FvhCxm5qoifW1nzaRYviu15kvMkcMfMjvf7/2WAy8ElxBmf9BxyEY55gRJiw3eLB3VzNt83fZs5QxybWrOObxD/p7alnArITbBVf7g5kc7L+nfuHX3StAsDm2Vs8tczQDMfX8OOFndNpinSQ8S6OQFPyuk7Iq3t9VzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEVE/4h+FbcWS1DNffMUXk13vxElKf8fw4EcGPJ67cI=;
 b=OieSMB0PzEP/YbveworTNV61VtE+foS6vnFhsjFfudztBlVgv9BJou45wuGrNjGjQUYGU097zjuRWxiEGlk4PogvHu7eVFahEfWz+5FpqA9h/3OMN260Wo0isj2O/EP/pDZXyVQXoAqlZGkfNWD3VG5vyRMYzJUlyjoblFuehUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9aa) by CH3PR12MB8533.namprd12.prod.outlook.com
 (2603:10b6:610:159::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Wed, 2 Jul
 2025 06:41:00 +0000
Received: from SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 ([fe80::40bb:ae48:4c30:c3bf]) by SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 ([fe80::40bb:ae48:4c30:c3bf%8]) with mapi id 15.20.8722.031; Wed, 2 Jul 2025
 06:41:00 +0000
Message-ID: <2af92b56-d344-4b22-8eba-872418efbe3b@amd.com>
Date: Wed, 2 Jul 2025 12:10:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mm: introduce snapshot_page()
To: Luiz Capitulino <luizcap@redhat.com>, david@redhat.com,
 willy@infradead.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lcapitulino@gmail.com
References: <cover.1750961812.git.luizcap@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <cover.1750961812.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0082.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::12) To SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9aa)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPFF6E64BC2C:EE_|CH3PR12MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c22d62-9954-40ce-efde-08ddb9336881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZSsyMENCckFoemRhK3pDNS9QZ0phZTJmSTJkNFB6UkNRaW5BUU9WZmZ5U0gr?=
 =?utf-8?B?ZXA1ajRPenVLT1FkQ24vQzJldUIrWE1xNDUySEdFeVFLV0toei9ybDlTbi9Y?=
 =?utf-8?B?Z3hWcHJxVWxibTd6Ky85VmFmaE9jQkp3K0YxNThqVUhVVWJQejFSRHdsVVJN?=
 =?utf-8?B?ZzNEb2QwcnduTi9HZHQ4V3d5K1hBeFR3dk5ZRFUzRGViZ1ljYm1Ld3UvMW5J?=
 =?utf-8?B?cHJkMVBsUVZzT25sQ3BoSmRlWTJhMytHVWh2a3h0d0dXZHBTMU1IWVFoNSt3?=
 =?utf-8?B?UlU4WngyWDh6WDl2dnZUa2lld2NXSEs5YWNqOW9oS1lBTHFzTURtY3EvVjhT?=
 =?utf-8?B?Ky9DUEhiZE9VQkJOMWVtbG9TSVR1MkVFU0lIcVVKdC9JOUZlSktTcTY1Nms3?=
 =?utf-8?B?Vk1Nb2F1RktIalVySExHTEI1TCtqSVBEQTJMRG16YTdrR3MxNExUR0FnVE91?=
 =?utf-8?B?T1RpSXlDSFFFSXBqSW13dmdJYU9DcU9sREVST3dwZHBMeHRMN1h0OUc4MlBr?=
 =?utf-8?B?RG1oZ08ySHR6K21EQ29vdld3Tnk1V3FtNjFYbDFBc0tCc3RLWkVjR3dwQnE2?=
 =?utf-8?B?SDVHalRoNlhyVkxjREtVQjJJZmd0TlBiQ25kbWFDMmRkR0YyYjdoYVVxcGk1?=
 =?utf-8?B?V1hWRzdqckU1c2FtWmpwcWx3TCt6Sk5kSnp3QllsUFI1Y3FEZXQ2VGdHTExS?=
 =?utf-8?B?emhKWnhQUmpLLzBxdXNaTXJEVnpLTlV4ZkVnc1Q3alQvRVhkaGtZLys0STJ1?=
 =?utf-8?B?d1FmT1gxTUxoOWM3WEttRWk1NnBTUXB2dldlTmNka3QzQnJLK2k1U01nRExF?=
 =?utf-8?B?KzRKR3lOM0NHcW5kTUNtUXdvK3YwZ2NxZERFQ0Rob1gvQXBCcnpMTXRLbG5L?=
 =?utf-8?B?UUE3aGVOUnBBZU5CU0h3ZHRjUzhIU1JtWnRwV0g2OW9CTjRhdllMa2dBR1lK?=
 =?utf-8?B?OVVKU3dUUVlhMVFTTFc4Sk53YXNwMk1DWVg0TENac05aRW9ZT0I3ZnVjL1Jw?=
 =?utf-8?B?V3dmUWg4NWdJN2NEZlBuOXVpOWhabURCQWJxNG1GODNMQjRlRThmSnlLWGlU?=
 =?utf-8?B?aEpDWElzQUc5MTR0UmVXM0JvVmNPakYvKysxeTVROG9nZ3lRU3hFNG9GOEQ0?=
 =?utf-8?B?NGdsYy92K1RDMFJGUmxUT0tsdnBZK3poaHk3VUFBa2hNRHNDUDljZndQY3Ns?=
 =?utf-8?B?NDdYSmVMNkxiRGhqR2diam5lSEk1UFFldEx3SkRRWTFkOENyOWtKQlZ3L1FD?=
 =?utf-8?B?N3NNb0luNzdDZ2tGK3N6WHZiNmQxS2NVQzQ1SStEWmJhL2xZOEMxTDJRWkla?=
 =?utf-8?B?a0FDWW95TnMwYnNHcXdFQi9YOEtLSTVDT1hTN3J2dXZmNFNoMk1Kc1JGcmpo?=
 =?utf-8?B?UnJuMnZZd2ZORnc1N25wak5XaGlaMUplR3pITlRFdWh5bWhRSEkzbmd4TEkx?=
 =?utf-8?B?V2tzSk9zN0F1VmV2OWppYjl2clduVmZTc2ZzdmJGQUpuYW1pYmRURmtXZm9L?=
 =?utf-8?B?Rzh6aVF6T1ovODVkWVV5UVJETGVmTDAxZGJXVm1EbktsdFJqZ1NJRzYwdjNB?=
 =?utf-8?B?TlViUzZvMUd3N01GYTVTYk55dVlZclVNR2xBdjVlc0toeWt2L09KQXA1R0I4?=
 =?utf-8?B?cVZTVlJsbWx3OTdrUVYxWDVxbVF0eXFRSnRWZEE5K3BQT0h5THNNbjEyalNr?=
 =?utf-8?B?TUpNd2s0dEhSUHdPalBEeUlUeVJVQVNxT3B2blJJdWNaNk5jRnBFdnVVYWVJ?=
 =?utf-8?B?OU1WYm1QdlNZejZVU05ZUU5MelVSdWkyYldtR3NqblI2QVhLeXBjdUUzblhi?=
 =?utf-8?B?N3pPdDZYRXpMNFVUQVdtYjg4UVNBNmZpVFU1RUhoeGpycHpiUEd4RGM5Rnd2?=
 =?utf-8?B?ZmFRVWo5MTZBRWVVVWVsZUdYK3NrYkh0SjhLbWVianhNWUpzQW9GUkQwSW9r?=
 =?utf-8?Q?n2uwf14DyGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPFF6E64BC2C.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3hzczVXWklGYXpUelNNSWpsZVFUY0F0Y1FnaExWYm5XUkVROTdFc0V6WE1r?=
 =?utf-8?B?L2F6MTBzVVhKOFljZkpTUUFMTVVId0dKWHhDM3dPU0V5aWZkVFpSdmFVRi8v?=
 =?utf-8?B?QXJNeHRNK0VxWGdOaFR5K1FLcmNFaTRyYTdxSkZNb2ZwS1NXTzRkcnpaZmNX?=
 =?utf-8?B?bElnbTFpVk5nUjdXVjd1RU4rNkF0WGhybm80aGtpYjB4Yk9kNWpYaDk5aFQ1?=
 =?utf-8?B?MC93K3FKNVB6ajRRbkNiZnRiUlZYL1YyU3JKelBlY3FZMWRHZkZkU1FsWjVF?=
 =?utf-8?B?U2JKRXNmNEhUaHlZRWNSTGo2bzZLUVpUdkxTY0wrL09xcFJyYjJyekd6dHFy?=
 =?utf-8?B?YUwweFJkWG9GdDRHMFBnYTYzZzAxaFpObWFJRzF5enJNSkhzNzBpYzBWZWYw?=
 =?utf-8?B?R1lQL1ZsZmRPblVGMUo5UXZaclpSczduZHl3M29xTHE0eXk2MFRnOWQvaFFu?=
 =?utf-8?B?Sk5UY3dZTmZscy9uQ0swTjNFR2dQVVdaZ1JNZkVqVXN3azE2VTlicVpLTUNM?=
 =?utf-8?B?Nk8wWjVtSjNNQkxrRHRBd2hvamY5b3pWVXVFOGFUQkkranBCbjBub0xYWTAx?=
 =?utf-8?B?WWlSV3FGNENqZ0RKU2FGdTJTRU1aQjVIMGhlUElQZWlGL09jWXFKUElEMlR3?=
 =?utf-8?B?SDRpdHdLcnZIakcyTFhWYWVnWlJuRllRNjRzdVR0VU9WQ0JYU0xpa1VZSnBM?=
 =?utf-8?B?QTdWbUdCWHlXUnhENU1jaDZnaWFiQlE1cEtVcmhXenR4UHZIdmU4cUJVSXl1?=
 =?utf-8?B?dU1yUE5FM0VSanJCendIVDBWQ1h6N3dIUlUrNkpydE8wTXVtcTMyTlc0SndF?=
 =?utf-8?B?bnFySFpLMUJscllZOVArbnRIcmVNNHptcW9YZW12K09oK2JPVDhja3ppWVhY?=
 =?utf-8?B?a1hxSzhmWm4xZHJIRmpXSEZYRnV5RGMvNURMSXh1dkpUZlNRWXpQMHVOTk1W?=
 =?utf-8?B?aW90ZnVLQkgrOTA2TGtEaW9yc29Db0RBeUNiNUJlYkkzWnNXWEN2YzFRU1BF?=
 =?utf-8?B?dnVmUlpkeDN4bUlBYkRnRnpBUVZoWFBEcG5GSlpxV0orY2N0NzN1ZVFSQnFE?=
 =?utf-8?B?U2xCdDVwTzh5cm5nK0hQNWplVTRubFdDSjNYS0FmdUxMNmIxbFAwc1M5ODZI?=
 =?utf-8?B?dkFhUmZUaVl5OFlGVGhvWWxhUjc1dVRFbTFWYzVMc1lTaDFHVVB0L21weHVX?=
 =?utf-8?B?ZE1xS01kYUNlOWZWS05MT1lUcXM1eHVXdGxDYnRGNFhiNHk5U1RlZmhZMmkw?=
 =?utf-8?B?TEljT0ZnRWRhcVVER3ErajNZSzRHODIvenhucHhqMlE0SmZkSEhSN1VNcVo0?=
 =?utf-8?B?SkJ1SGJTQkZ6ZE96OFJ1SGFXR1V3bGdNVTVORFVlSm1oekJWVi9kaWtXQk16?=
 =?utf-8?B?VWJ5ZmExMkJBaS93b0dTQlAzekk1UVB0RWVZNjlRTXltMXBkUDhrWUZPNjdO?=
 =?utf-8?B?L3NPbkJjbGRNNC9KSk1UT3JRKzNHVUtnOXhIZkFFSHFyUlJHS2NWYkpFR2pq?=
 =?utf-8?B?bXVRNldZQUl1U1pqNExwOGRSdWM4aytYZmVSeW0yNlZObmhTdGt2TUEraWtZ?=
 =?utf-8?B?bkw2RjlmbUZnN1A5L2R4eDFZTU1LQWZqeU92QWMxRjJNQXExRHB6SVd0RGQ2?=
 =?utf-8?B?RFc2WWh6K0puMFprMVBnMkh2aXQrZm4ySHUreW1ZRkV6Z3graG9rMHQ5bW9O?=
 =?utf-8?B?TU9sOFh6NGFSc3FLQUhST2NqQlRCQ1QxRHFTRCtkY2NCYmllQjllTENGaGg1?=
 =?utf-8?B?eE5nSkNTSEFzYlJaK1h3MzFZTGtpK2pVSWR4U3Z4TXVaSnB2dlRrUWJOVmJF?=
 =?utf-8?B?UHlGQndpZjlDTk0xSi91N0Y0VWUzY1VSZkhIRklKV2N5NW5UN2FtL09oWE81?=
 =?utf-8?B?Uis5NG50VGcxdlVlVVptSVRGMzN1VWpDbHBKaVkrZHo3a3hXRG4vWWdsOEoz?=
 =?utf-8?B?OTViRmYyMHd5eWtmQ2d2T2pFMTZkWFZhQk5YMVJqNC9LNHhvbEluOXlQbmZi?=
 =?utf-8?B?Q2h2eUY1dVJwUWIyb2xkU1kzam0xam1GWGM1cGxhNEthSzZKai8ydmtWdFRS?=
 =?utf-8?B?TloxNnBxZUZyWm9nRTNJcnNYREhFeGVrUG5DbEZXWXRJU2JSMlhzWU04QUor?=
 =?utf-8?Q?KL/yZWrNm/sItPhpSoZ1riRaF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c22d62-9954-40ce-efde-08ddb9336881
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 06:41:00.8325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyGQH6jIVz1TpV2g8nedwKvvnxyy9YuBCSA4yAIuLMB9N87ZhANGHLnq6ZvYYp9NhRIZ9Ngddyd7Z5bVbo6BkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8533



On 6/26/2025 11:46 PM, Luiz Capitulino wrote:
> Hi,
> 
> This series introduces snapshot_page(), a helper function that can be used
> to create a snapshot of a struct page and its associated struct folio.
> 
> This function is intended to help callers with a consistent view of a
> a folio while reducing the chance of encountering partially updated or
> inconsistent state, such as during folio splitting which could lead to
> crashes and BUG_ON()s being triggered.

We could consider adding a Reported-by: tag and a link to the syzbot report.

I believe this is the relevant one:
https://lore.kernel.org/all/67812fbd.050a0220.d0267.0030.GAE@google.com
