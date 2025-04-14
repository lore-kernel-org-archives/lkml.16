Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023130.outbound.protection.outlook.com [40.93.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275ED1DE3B5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744665893; cv=fail; b=bjHk4oPUygHdAVCQAhop6lVycjinG9RHW7hOAl72GMxAgAHJbfLvvvrgKJehYmwyum+67ljLW/8mBYP9HiDZi4rFHABH8rZSUwWhVJbY3el57T8AK6bGENx4suVnMZ695NP/9dmfiRyFdv9bcGDxGRszPxQY/N3GwKeFBtx8XKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744665893; c=relaxed/simple;
	bh=eZn/cM+BXwpE0JwKfz8/jEED4W78ZUsJ4H5lXP1HpBc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SKVZ9E7ypAYohhu9Tg43zn7uF1rSbQFCocqVXe8w/i6YP2l8ryTJ5GJpyBMewNPJ6xhZ2YBFkdmsGKxKKVtclYmRf54LrGoi8cu4jutKgjZzCk5256pYcCYDUPMcUPUPAGQs1O/QdPrmjLFGfoga/We5FymQ6ooBG3CmyJcoPdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=Rw2qQYyl; arc=fail smtp.client-ip=40.93.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="Rw2qQYyl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMh95NThUVWgQL78k2FZ8MDTsUfHrVfXZW+7hdh784ZD+TpfdZ7oV/y9ZngMlmvdw633rkhwTlr2v1rps1PvGaeD3L3LVdngwY73MgF9DvbTZ7nzfYkrRzSa1Ra398sE04f6CKKoirPweG0W/NO6anU7IrJTCasys/Y/KYznhml46kNmau1WsmGnJpq5D+AGSSdZmiwd0FXnZkAyedE1NNYtXtS2vGhhJ24oilPqj/zGeIoJg7fEpkZx7wqsgPLOa/iSLuCzOs7AjQN7g3YRwGtbpDE/Yko41MCmRD0g8gCvYrYSjNgBdV+SLHCmHqxws3UAUlmEqXYuifXg/QwC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGXPxttzqv6A5ancFJU+4S/PNVTQHZC6YpEWKcmzl0k=;
 b=Ok+vHe7cya+kVMLEcrncOhbvbowEPAKQjCZE4fpEpg34XOd1qxDwA8VVyM6yPy61jlhz0GjvdVAlvBlY8SA79FBp29pm8DeuoGw84qod5xp3AoQi2y1e4/5vNk626Cowk9X+2ErudMoG49B1MgecSDU4OfaT0q0ekczjKw7gG++t7a8TB0KBc7+1h2uAchH4I2NvMD43vfSS0Rxx2vHwma5wJ7HkVSbzfldBQmvUXmVPtftTFk9CUOyKE2rLkg1s+n339EXM+tuylkT/W2zeQU8hAn+Q7hHz8nPqwkOYsCNTdBJIei0tSB0fwseENmjzb3W21sBQpE97itOXewElkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGXPxttzqv6A5ancFJU+4S/PNVTQHZC6YpEWKcmzl0k=;
 b=Rw2qQYylf842AtWgXMq930jDOeobX0zMuLFTS4XriHFSq8sRj/bF3jJRM3tPIZzYxsxwnOhAmEUicMeVlzpFKDqZCrVTKByd2o+ePs91cixukQgzbTULxpvsgZlCQARFVlqmMCjrpsg5ImwIRK6GXqOLTfQg1uQc+Ygq4NZfqQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB7287.prod.exchangelabs.com (2603:10b6:510:10a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.35; Mon, 14 Apr 2025 21:24:45 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8632.035; Mon, 14 Apr 2025
 21:24:45 +0000
Message-ID: <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
Date: Mon, 14 Apr 2025 14:24:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:47::12) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: 56641564-042a-4d6d-7154-08dd7b9ac6d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjlsVmFQdm5iZE0zTkpSSkFCOHVyTzRiNEhMKzQwNUR6blB0RkJCdWsyYjRo?=
 =?utf-8?B?VUhDWGZjS0gwTVBYc1pucjRGN21GZzVZanlKbGVFd3JYUlI5SThSUHROaUda?=
 =?utf-8?B?TVFEcSt2aDdqbUJ6MDNNbVpYbHFVZlZtTWZXMk8xS2NWeE41K2lzbFZRZXpn?=
 =?utf-8?B?d0hRdEh5enN5bXl5dmNNc3g2WUVIVDRnZFNQVTdpRzViSk1wZzJiOFhxWkR2?=
 =?utf-8?B?MUtYS1ZUazVoQjJmR0lMblhoSlR4NVQyVXJpNzA1N3pIeHc1aGlVYmNuTjUr?=
 =?utf-8?B?OFhJNmhyQTBzeElHcFBCcG9LYUt6a0tGRTZrR2piODRoMkkvWU10WGlBa3A3?=
 =?utf-8?B?OWtGUGNCMFNVc0xTVXp0R1Z4cEJCdHRhUFNFRmRsVVBhalhZWFhLVTVFajQ4?=
 =?utf-8?B?MVp2eklPQXc2cmRrZXNnWUZGcXlxNXZIM1o2Z1FQdUZ1aHMzbFVCQkNTbWla?=
 =?utf-8?B?Z3NHUXNzQ0czU05TT1VpY1FqQVRQeGROSUtXamxqREs2dUNYcFlYejRSL2Ex?=
 =?utf-8?B?TnFZWGZRQytway9kR3N6RVd4MldSeUl6aHV4QlJHcXlhWWdqcTQxK1Z4eXN4?=
 =?utf-8?B?K2N2eWpEVmovZGdRVzh6QkY4Q25idzdpak8vUUlNTzhuZDU2aUxKNUNRWCtL?=
 =?utf-8?B?QnZUUkJwMUp4VCtGdjJNdm5yN00wWWNheVZnWW15UXZXaGkwenVOWTNaazE5?=
 =?utf-8?B?c09ONVl4elNKekdQM0Vlb2NMZGtKcGJTYy9FK3VNenNCaFNNNE9rWmZiUlFN?=
 =?utf-8?B?Y1hwei9lSS91ZmJrWHJSV2tFS3g5M2dWdzdzRWh2TldpcUF4azdCTVYxL09V?=
 =?utf-8?B?ZzQ3NzNWcTRFeEJWRThMUGw0cTJ6V1JBdTFTaHRxN2dUQmVCVURRbjBNVHdr?=
 =?utf-8?B?OXVJVTFYZkJ5bll6VXFTMnNtOUVxYzA4SmM3NVI3NVBqbWN0bG54aStzalZ6?=
 =?utf-8?B?UWRlZFRrc1NibE5sK3V6UzJTaG9UdHNwYXJaenNCY25DaTZMditUWnhHbExy?=
 =?utf-8?B?bmZPdDNnK2l4Nm5GcWdJTDJ0MWcwaUFBYkFHL3hhWDFocmdxRDZBaGtkcjNF?=
 =?utf-8?B?dUdOem9PeTJ5VDltcVBRcDFuK1Q0UFg1SmUyVm9nTk55RzNyZG14WHhjTk5E?=
 =?utf-8?B?S1hZU25DR1JJRnhFU0E1eFJFYWpmWHVlbitPSndFTlY4bUJ6bUdZcDVTd1hH?=
 =?utf-8?B?N1kyOS9DMzFuQjlBUyt3T3AvVGRPaXE4WVczWEVObVp2cXdKZXk1UE9FaUFD?=
 =?utf-8?B?ZmxkZys3VCtadVR2U215d0YrOW5lS0Z3RXROMXIwQWQ2anhubnpXK3dXWU50?=
 =?utf-8?B?N3I4RmVaME9wYXg3WU9WWGs3ODFNdGI4N0RDcXM5cHc2ZjNQbWFhVG51bnNT?=
 =?utf-8?B?aEpacVBLejZVR0dYY2ZER3c2Tis0SHYzN002ZW5xZnh6QU5zaGpUZEF2SDVh?=
 =?utf-8?B?TmRLeVNBcVF5ZU9zTGZZWUNRZmFqWkpidTd6ZXJ6OWptVmZCR0Zid05USVRW?=
 =?utf-8?B?d1JyVFVva044TWZmSGw5YmZsL3ZkWmNOVDZZd2k2OXVvTisxQjJJZFdBOWM3?=
 =?utf-8?B?czJ3MDMyVzRac01pN2c2UGRuVFdBM1JnRGtWS1ZxUkV4RFA1cmtaTzBvS2w5?=
 =?utf-8?B?WFM0UnpVSE13KzZKTUs2ajJQZjAxTjVtY01ZdDFPOTdtcW83dG9FMHZlb25r?=
 =?utf-8?B?Z3JZVzhVZWowaTlrK3BDNWlTN1hQSG4reUZlazg0THNUblVjN0FBMHptdFpG?=
 =?utf-8?B?a0pKbVpHN09pU2ZydE4rOHJ0ejJycmRmOEpJYmRIUkJmVzduZDFiZnZ6bkg2?=
 =?utf-8?B?TzdYZ094K0UwYkxTUGx1TFVpbFltLzhKQ0RsS2lZWDRpTlliVFRNcnlib29z?=
 =?utf-8?B?TTV2bmxaUXVpUnFLSmd1U25PeXI0R2JnSjQwcnN4MWtHa0dTdUVmelROZjBx?=
 =?utf-8?Q?/fUlnRUTrHo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW1pL05NWEhhakF6ZVorcWlIazJ4aUFZb0ZRTjRSTVF3bFlTTGVxbXU0RHFB?=
 =?utf-8?B?aHcydVJGeW96WXJkUHRYOUhFY1FhL3oyNHVWZkhDeFk2YWVPY3VLUEhGdUdB?=
 =?utf-8?B?Z2d1MWV2NWxSNk5QR3ZLMjRhNVhvL2FCQU13cS9NZGZ2NG0vdHBIRnVLcmdP?=
 =?utf-8?B?NXp4WWZqU1ZzdXhLREZmcEJCMllGT2FOSnNIaDNzQkdscllwMWg0WXJ3eFFS?=
 =?utf-8?B?MGNWWnlET0dmTllGY25UeXFvZjVIOVBrc1RVaFFocDlSTFJpRjNoQWxkM0lB?=
 =?utf-8?B?VUNQRVl2cmg3V3F4cWp2ZmVmdDVBZXVZVm90V08wTWtxMWkyWG8rU09ZaXQ4?=
 =?utf-8?B?WEEwcXpSUndaZEhyODZ3YUN6Mm5kNHJZd3NsM21QUGd5RFZnOFYwaU9PVEJ1?=
 =?utf-8?B?dzJkdVZpcGx1RHRVWFhSR0Y0YXNpbjkydUh2ZExoRUw2THlzWlI0N3ZiS3Nq?=
 =?utf-8?B?ZGoyRVJtMmgxQkRYeEhCSlNRUjl5UTIvMktJVDUydFJWZUJIZ0s0VEtsS09Z?=
 =?utf-8?B?bDI3QWxYSjJ3blh4emNxbzVuenVrVFllOGJ4M2hvd3dudHBQSkNYc1pFZDJK?=
 =?utf-8?B?NndwOU1oMURiMEIwSm1YS3UvZTVyUmdnS3JHbjBNRmdnTXdTR3dzREVVZmd4?=
 =?utf-8?B?eWxiaFl3a216ejR1b0FuWDJpM3VJY2VldmVBMk1XTTdteHg1dmdGck1keGlz?=
 =?utf-8?B?eGxwTy9DZEhqeXBUS3dZdCtST0tUelZmbVNVaE9EdFE5em5QdHFaWVJrV2xF?=
 =?utf-8?B?Znd0bmlNcUg5YktLbTAxVjRvOGpUNXJVaVRVZjhOeFJ3Z0l5L0lnK09lNEZB?=
 =?utf-8?B?SmFYOWt3bmR5NEZOcmVMR3c0M2IrSEdpdG1QdkZsczU0NTNSSjhacER3c3VT?=
 =?utf-8?B?S2pjeitkdDVNZmltdGlsR1Jpell2b0lSc2VqU3h1aXg3Z2psd3UvVmVTNDlt?=
 =?utf-8?B?Q3hzOHJjYXZiUlljMkxNMmxISWx6V0FlMCt4dVdHREVqbjVEMWJta0llTnQ3?=
 =?utf-8?B?RCsyWS9GMkcvZTFvaUYvek9TeUdWR1EyeUM5SDRFdklCeGRjUmZydVZyZkxk?=
 =?utf-8?B?OGxxL0JJeU9nYkxCcTBlbnoyRmRyRk1ycjIvSzVNcU5XYXNWUXhZMFBoZkVZ?=
 =?utf-8?B?c2gyU0txMDNLZ0R1bmQ5RDZiblNtYXhQNGd4WUg3RTNUUG5HeExkcEdINDN6?=
 =?utf-8?B?OEd2TGV4b2pGbHFEQTVMU0Q0MGxwZWZTLzVZTGQzWWp0ckQxVzc3d2NtcTZ5?=
 =?utf-8?B?SW9sM09pRzZwbDN3amZhYWo0b2swSXBLQ3orKzdqRXFtbS9LTXRoS1A5dmJN?=
 =?utf-8?B?ZGdIMFAyNENmZnhPRS9ZRlFUNExSckVCL0xKdTJNQWhCcGpJUExaWVByMlNB?=
 =?utf-8?B?bEV5QVovSFAwRDc2akUvVkY4YTFIS0NyeUI1TUZDSVZ2eUxZTGVLc2tVZ2lk?=
 =?utf-8?B?SjRjMEFFQ2ZiNWRyOFNFTWV2QU9tc2hKMnZFOUFNaGt3MGZrUUZMUCtxaTM1?=
 =?utf-8?B?ajB3WUMyWE5ORVpGSHJPMUs0V1hmY29JcVVVNzdsUm00MDRkQjZxa2VFQTVG?=
 =?utf-8?B?cGFjbUVPbzQ3VkJjNXE0Sm12dlJlZXJWT0xhVUtJdHdDL2JHTXBVeks5cFRF?=
 =?utf-8?B?VkxKSDdZWlhpRWtYRjhnM2E0NnYwL2xFOWtwYlFORzNWQUdhSlhLZFZZMDBY?=
 =?utf-8?B?eU1heFJFV0tMUEtsbDZoRERuaDRMVTV0TXBtcmhTYzRtcjRmaEJoRjJOZkZu?=
 =?utf-8?B?SFY2T21YZC9kKzV5MG1vZWJVbjBZU29hTzJzTnpoMHJtaDlMbXFsdDBta0pi?=
 =?utf-8?B?WjZEdE9CZERsTmZMWVk2SFJPNkZtZktUVFFvakY5QytvNkZwOFRqU2dPMlBB?=
 =?utf-8?B?QVY1dWJWZ0drd1FTSUJHRm5zODdHekdoSmNmWWFuaUhqN3RVRDlXTjgrc2o1?=
 =?utf-8?B?NEJGcVR6c24vQnVpM0FGVVM4cHdsL3pEZ2RLQzlvOVdLMytOVnN1S0prN2dC?=
 =?utf-8?B?aU15Q283eTNEQmFFMysrWmNGdE5BSWdxcFRzTFF0NGVvN3NMZGJMeTVLUldJ?=
 =?utf-8?B?UU9wa2djOGtpWVJCL3hpQlRRWFBDS0VzUzhyUVB2RmFSMFJEeHdBcForalh2?=
 =?utf-8?B?NHRsY2NoWUVzbXRobjVvaXM2NXRCZGdaUU5CR295bEhsZU4zRVVhWnhFeUtx?=
 =?utf-8?Q?NrHrNoekWKaPZjvqGndj8R8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56641564-042a-4d6d-7154-08dd7b9ac6d7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 21:24:45.4187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7Yd1okQHokqzopE2fG7NEqUfli5PDMogZvNQCFphMdW773YziLrDT9trn8UdQ5u7IMXdhlifcygWq0Rsq3D/gQLctq3+Jm6720TPqhXzw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7287



On 4/14/25 6:03 AM, Ryan Roberts wrote:
> On 10/04/2025 23:00, Yang Shi wrote:
>> Hi Ryan,
>>
>> I know you may have a lot of things to follow up after LSF/MM. Just gently ping,
>> hopefully we can resume the review soon.
> Hi, I'm out on holiday at the moment, returning on the 22nd April. But I'm very
> keen to move this series forward so will come back to you next week. (although
> TBH, I thought I was waiting for you to respond to me... :-| )
>
> FWIW, having thought about it a bit more, I think some of the suggestions I
> previously made may not have been quite right, but I'll elaborate next week. I'm
> keen to build a pgtable splitting primitive here that we can reuse with vmalloc
> as well to enable huge mappings by default with vmalloc too.

Sounds good. I think the patches can support splitting vmalloc page 
table too. Anyway we can discuss more after you are back. Enjoy your 
holiday.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>> Thanks,
>> Yang
>>
>>
>> On 3/13/25 10:40 AM, Yang Shi wrote:
>>>
>>> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>>>> On 13/03/2025 17:28, Yang Shi wrote:
>>>>> Hi Ryan,
>>>>>
>>>>> I saw Miko posted a new spin of his patches. There are some slight changes that
>>>>> have impact to my patches (basically check the new boot parameter). Do you
>>>>> prefer I rebase my patches on top of his new spin right now then restart review
>>>>> from the new spin or review the current patches then solve the new review
>>>>> comments and rebase to Miko's new spin together?
>>>> Hi Yang,
>>>>
>>>> Sorry I haven't got to reviewing this version yet, it's in my queue!
>>>>
>>>> I'm happy to review against v3 as it is. I'm familiar with Miko's series and am
>>>> not too bothered about the integration with that; I think it's pretty straight
>>>> forward. I'm more interested in how you are handling the splitting, which I
>>>> think is the bulk of the effort.
>>> Yeah, sure, thank you.
>>>
>>>> I'm hoping to get to this next week before heading out to LSF/MM the following
>>>> week (might I see you there?)
>>> Unfortunately I can't make it this year. Have a fun!
>>>
>>> Thanks,
>>> Yang
>>>
>>>> Thanks,
>>>> Ryan
>>>>
>>>>
>>>>> Thanks,
>>>>> Yang
>>>>>
>>>>>
>>>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>>>> Changelog
>>>>>> =========
>>>>>> v3:
>>>>>>      * Rebased to v6.14-rc4.
>>>>>>      * Based on Miko's BBML2 cpufeature patch (https://lore.kernel.org/linux-
>>>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>>>        Also included in this series in order to have the complete patchset.
>>>>>>      * Enhanced __create_pgd_mapping() to handle split as well per Ryan.
>>>>>>      * Supported CONT mappings per Ryan.
>>>>>>      * Supported asymmetric system by splitting kernel linear mapping if such
>>>>>>        system is detected per Ryan. I don't have such system to test, so the
>>>>>>        testing is done by hacking kernel to call linear mapping repainting
>>>>>>        unconditionally. The linear mapping doesn't have any block and cont
>>>>>>        mappings after booting.
>>>>>>
>>>>>> RFC v2:
>>>>>>      * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
>>>>>>        conflict gracefully per Will Deacon
>>>>>>      * Rebased onto v6.13-rc5
>>>>>>      * https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-
>>>>>> yang@os.amperecomputing.com/
>>>>>>
>>>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>>>> yang@os.amperecomputing.com/
>>>>>>
>>>>>> Description
>>>>>> ===========
>>>>>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>>>>>> break-before-make rule.
>>>>>>
>>>>>> A number of performance issues arise when the kernel linear map is using
>>>>>> PTE entries due to arm's break-before-make rule:
>>>>>>      - performance degradation
>>>>>>      - more TLB pressure
>>>>>>      - memory waste for kernel page table
>>>>>>
>>>>>> These issues can be avoided by specifying rodata=on the kernel command
>>>>>> line but this disables the alias checks on page table permissions and
>>>>>> therefore compromises security somewhat.
>>>>>>
>>>>>> With FEAT_BBM level 2 support it is no longer necessary to invalidate the
>>>>>> page table entry when changing page sizes.  This allows the kernel to
>>>>>> split large mappings after boot is complete.
>>>>>>
>>>>>> This patch adds support for splitting large mappings when FEAT_BBM level 2
>>>>>> is available and rodata=full is used. This functionality will be used
>>>>>> when modifying page permissions for individual page frames.
>>>>>>
>>>>>> Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
>>>>>> only.
>>>>>>
>>>>>> If the system is asymmetric, the kernel linear mapping may be repainted once
>>>>>> the BBML2 capability is finalized on all CPUs.  See patch #6 for more details.
>>>>>>
>>>>>> We saw significant performance increases in some benchmarks with
>>>>>> rodata=full without compromising the security features of the kernel.
>>>>>>
>>>>>> Testing
>>>>>> =======
>>>>>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
>>>>>> 4K page size + 48 bit VA.
>>>>>>
>>>>>> Function test (4K/16K/64K page size)
>>>>>>      - Kernel boot.  Kernel needs change kernel linear mapping permission at
>>>>>>        boot stage, if the patch didn't work, kernel typically didn't boot.
>>>>>>      - Module stress from stress-ng. Kernel module load change permission for
>>>>>>        linear mapping.
>>>>>>      - A test kernel module which allocates 80% of total memory via vmalloc(),
>>>>>>        then change the vmalloc area permission to RO, this also change linear
>>>>>>        mapping permission to RO, then change it back before vfree(). Then
>>>>>> launch
>>>>>>        a VM which consumes almost all physical memory.
>>>>>>      - VM with the patchset applied in guest kernel too.
>>>>>>      - Kernel build in VM with guest kernel which has this series applied.
>>>>>>      - rodata=on. Make sure other rodata mode is not broken.
>>>>>>      - Boot on the machine which doesn't support BBML2.
>>>>>>
>>>>>> Performance
>>>>>> ===========
>>>>>> Memory consumption
>>>>>> Before:
>>>>>> MemTotal:       258988984 kB
>>>>>> MemFree:        254821700 kB
>>>>>>
>>>>>> After:
>>>>>> MemTotal:       259505132 kB
>>>>>> MemFree:        255410264 kB
>>>>>>
>>>>>> Around 500MB more memory are free to use.  The larger the machine, the
>>>>>> more memory saved.
>>>>>>
>>>>>> Performance benchmarking
>>>>>> * Memcached
>>>>>> We saw performance degradation when running Memcached benchmark with
>>>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
>>>>>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>>>>>> latency is reduced by around 9.6%.
>>>>>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>>>>>> MPKI is reduced by 28.5%.
>>>>>>
>>>>>> The benchmark data is now on par with rodata=on too.
>>>>>>
>>>>>> * Disk encryption (dm-crypt) benchmark
>>>>>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
>>>>>> encryption (by dm-crypt).
>>>>>> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>>>>>>        --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>>>>>>        --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
>>>>>>        --name=iops-test-job --eta-newline=1 --size 100G
>>>>>>
>>>>>> The IOPS is increased by 90% - 150% (the variance is high, but the worst
>>>>>> number of good case is around 90% more than the best number of bad case).
>>>>>> The bandwidth is increased and the avg clat is reduced proportionally.
>>>>>>
>>>>>> * Sequential file read
>>>>>> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
>>>>>> The bandwidth is increased by 150%.
>>>>>>
>>>>>>
>>>>>> Mikołaj Lenczewski (1):
>>>>>>          arm64: Add BBM Level 2 cpu feature
>>>>>>
>>>>>> Yang Shi (5):
>>>>>>          arm64: cpufeature: add AmpereOne to BBML2 allow list
>>>>>>          arm64: mm: make __create_pgd_mapping() and helpers non-void
>>>>>>          arm64: mm: support large block mapping when rodata=full
>>>>>>          arm64: mm: support split CONT mappings
>>>>>>          arm64: mm: split linear mapping if BBML2 is not supported on secondary
>>>>>> CPUs
>>>>>>
>>>>>>     arch/arm64/Kconfig                  |  11 +++++
>>>>>>     arch/arm64/include/asm/cpucaps.h    |   2 +
>>>>>>     arch/arm64/include/asm/cpufeature.h |  15 ++++++
>>>>>>     arch/arm64/include/asm/mmu.h        |   4 ++
>>>>>>     arch/arm64/include/asm/pgtable.h    |  12 ++++-
>>>>>>     arch/arm64/kernel/cpufeature.c      |  95 ++++++++++++++++++++++++++++++
>>>>>> +++++++
>>>>>>     arch/arm64/mm/mmu.c                 | 397 ++++++++++++++++++++++++++++++
>>>>>> ++++
>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>> ++++++++++++++++++++++-------------------
>>>>>>     arch/arm64/mm/pageattr.c            |  37 ++++++++++++---
>>>>>>     arch/arm64/tools/cpucaps            |   1 +
>>>>>>     9 files changed, 518 insertions(+), 56 deletions(-)
>>>>>>
>>>>>>

