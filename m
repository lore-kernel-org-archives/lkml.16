Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B29F28DB45;
	Wed,  4 Jun 2025 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036097; cv=fail; b=S/t7G4HlJbeTfRMtwMHLejNVP/PtjN/NzwwPWMtEZpDoRp6MH2JfQ5TzJ+oOmb/h2qE9lytDmkTx9NTKScpaOyE1CZJNzXFwcK42Jr/+rozuRstL22zI2VjCUcH2Osmgf/OOah6b6Rw7gblXJdgf+K9XRdHcFK9Lp66YYjd58MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036097; c=relaxed/simple;
	bh=kV7vjLU7GNyRsiBJK6HcySc7J/wdFZibeAVdkOqSfjs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mhljv3G+hXpO7A/mgKm6n6x46CMPI0oLjfQzYrc/bvriH6XX9zb+IjXAcB38QRg1fPX3lrcmUYITrk4VPgExd4/GFiT1stGpSQUBmfTZVCAYAxY90NlnfCuOhfgrP/nubjGdDiawe3aZIHuWi2VaVjUNIF4ktD5uN0T7lDpvzOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ZKXlHlC+; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ZKXlHlC+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nS+B34LfCDGwh6OLqEfK4fMnnf8phYh8ma+0VgJ7R44XhF0d9PSkOW+fiErKrsEoD+aX7GE1WGSlMHWZVz8lLPTPIScnei/rPJq+dhZ2w6XL7kWc7EBpdA6wo3XAKOQEM+wrrLgLzgysjqroeni2ROjvupkHV5msKdHuflzCiABWpSsCTHGkIWZVPiXWcUaylv7gBhYvcbuKrdxYzrS1pNaWDFnWi0b8DIHkT6JzkA7FG7Fqt6OVTMwCzBksDu4pcvIP9UEpUsKFE1yZvVs+1igZUep5Y2bQTGmTtSp98Ry8+32VtUg60l4MFn6SMsYwkE/b6mXgrhqupgajqSk79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtErCyEk1wBu9e9GqpNDqHjUXF/CvLbAkhT3wMGsoI0=;
 b=lMGCn++f13m1g4IfvqPaEWZvFLXgxuJRBPXNnBiBoYc7TAjwvSjifOjGN1zaBX8IrimR8UQ2z08n95NTDKDLUifyPN1KCBPkkkyoNw1WGzHQZ2bvvSv7OGrGEIz+lQXDPtijz6gwjc1d1nWmgOUkvKtjf3xZeroIOhdrTEH1h4aD7IYNp584ZIIFceuWPT0hXM/sSTelpMh+1MZWAhhxRY5ABM8cw097Umhs1kDKgXlBLukKTzKSw/ugNLFpq52ZhmN72LjiDecRDE2qH8wGvfJmuoQvN0z6GIx81j+Dn01mzMh63KAuJMaTgfreBvaLGEZ412Q2/cEY7EwU/mInzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtErCyEk1wBu9e9GqpNDqHjUXF/CvLbAkhT3wMGsoI0=;
 b=ZKXlHlC+qcONW0a2sR1fJbd027bOh8dJgOl9RS+DO6R3gHYI1udcui07RLZEsoYFGzbrku5BB9WyQlggJbBnQtbp0/SYQ1P3cjhWkpxcIcIkIznIUfizFhvQIXplssFMUSkF4KXHKuRxsCP+/WI1CqNpAZ/nAQmaCYzBXRd51Lp3ggClZKcD21xkVw5Di9cy71nm0obhbKa9yqxMAESD7fcJzSKiDo2TEctcscq3K5uF4iAPyaiRd30czkfmn5lkpVzMIPQ4jCbRmhb7dvjbqnXKs5uIKOvkFD/kkHKexPFx6LQy33XJwmUksJ86Q0f8euynpC9OYPPcjgeLlZE4OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by MW4PR03MB6554.namprd03.prod.outlook.com (2603:10b6:303:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 11:21:32 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 11:21:32 +0000
Message-ID: <ed37f7df-3d67-4da3-9189-07cb3e55f13c@altera.com>
Date: Wed, 4 Jun 2025 16:51:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] firmware: stratix10-svc: Add support for HWMON
 temperature and voltage read command.
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
 <20250526-sip_svc_upstream-v3-4-6a08a4502de3@altera.com>
 <4dab7429-9b4f-4e76-9076-aa3eff759730@kernel.org>
Content-Language: en-US
From: Mahesh Rao <mahesh.rao@altera.com>
In-Reply-To: <4dab7429-9b4f-4e76-9076-aa3eff759730@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To BN9PR03MB6201.namprd03.prod.outlook.com
 (2603:10b6:408:11e::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_|MW4PR03MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1ba60e-1356-4907-6c7d-08dda359f55e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzNqZTU0T2ZMWXBZUUE1STViNWVYRVVFRzdyU1NEVTZNQm1uQW5kM1phSmRx?=
 =?utf-8?B?NW5ydG1nSW8rYXFjM2NDdjZMRzA1QWZ6d0JnTlg3OTN6MEhOU24rSS9LWENx?=
 =?utf-8?B?WHRGSklyNXlLTG05ZnhOcTlsaEFlSllpVXdLNTFNbUN3UTg0d0hMTms1YmJk?=
 =?utf-8?B?WWtCakJidlZuOUpVOTRLQUZwN2xrSWRLdmFCeUZyeVpNTUxkbjdkUWhCbDQw?=
 =?utf-8?B?Njc1T2RocUpoeThhNXA4UnJCaDAwUWpUQllMR3doS3FYaHhsaER2VXJDTnNE?=
 =?utf-8?B?eFlhZS96WkNXdjlLK1lQT3BmOEMxcHVzUTlPUFUzNzJqNW92eHBtMVRkMitM?=
 =?utf-8?B?L2h2dGVhUGthME15OHJGYXlzTFU5YVg0ejlPWWl4MXdRV1RyZWxVNGd1V2g2?=
 =?utf-8?B?RTNsNDZCSnZJYTY4eThmaGdUeklyQkthclZqUGN1djU1cXJJTTM5eFFBQnBB?=
 =?utf-8?B?QU9ya3hWaDlpdWplcXBiQllEb2lSbW8rNkNCOUdKNU1teHFEelg0WTRtV0pV?=
 =?utf-8?B?YmdqOHQ5Wll5RkN4UG1Mc2FmUFErei9uOUhIZzdMMHc1OEpzcVV5RlZLZlg4?=
 =?utf-8?B?NStRYU0vUGQ1UTQ2ZC9Scm00ZVNvT21kY1daYVRlRUlnZXR0NTBGVVR0SjNV?=
 =?utf-8?B?aWdCcW1pVHVWL0ZrblJpRUpaaDJ1VHJDUkFYRUtnTHZlM2tVWGp4ZjdVUDZX?=
 =?utf-8?B?VDMvaDRUMlRMcWJMcnIzcUR5cnlGb2UraWRldTU4OWl4WGptZEI3dzhYRFNm?=
 =?utf-8?B?NnBQZkhmSUFQRHNwY2doSjM0cGtMVnBOMzVOOWFiS3JjamlISTBGZ281TDAz?=
 =?utf-8?B?b08vSTFCY3hNYlZlSlI2dWxFNEF6eHdoYy91bE9STytqL01CbEIwMlF5bXJE?=
 =?utf-8?B?TnJsay9hazVEQlVJY1JMT2JPQkFJTE5GSXVEeFZqbU00WmFURFhUNGp3UDY4?=
 =?utf-8?B?eTVEL3EveVN4REVOVEMyQ1VjY1Z5b3k0OXJWQWlyRTFHaFlhSHN0WStHemh1?=
 =?utf-8?B?T0hQeW0veXlhMVUwTWdwemk2ZXN0NEdHMzF0MXdVblNVYUFObzI5d1ZHSXRZ?=
 =?utf-8?B?UU80dkhKWU54d2dQS2FkWlRvQTAvUzVsZk9pbXVFRVFmSXU4aFBhMWNiZlFa?=
 =?utf-8?B?enBjTjQyR2E4SnU1RU01L0w3L3g0TnBuR2lLOVNiTjBpTmI3Y21BbE04bzdM?=
 =?utf-8?B?MEVBcS9ISHU4ZHd2Rnp6UzY1a1FkQTgyZ296dTVaY09IVVUxZmlDV1AwTmZQ?=
 =?utf-8?B?QmxDZWFZL21lZXNhSFEyb2NLV0RQSDhOaDlORmxKZWxkRkVMRW81MlpRV3BZ?=
 =?utf-8?B?MHUwenJCMVZ2WE14dzRvSXNrdG1GeWtBdmN5aC9hKzdFRGkxbGJuMmRlTDk1?=
 =?utf-8?B?RUtJRXR2U0FCUTJQUjVCdk1oLzBCMHdOeklPOTJNUG9YeDlpR2ZEL1BXWjhl?=
 =?utf-8?B?dHFMSWhGZFBZQmRsSmFjUjlEUzNBVHR3UElIc0E0a2dsazVuMlBlMjN4RU9m?=
 =?utf-8?B?VzdHSHNYSW1TVTBSMXl6ck9LV21UZnE1NGptQmlIcGc2ZDByakNDTFVEZjBP?=
 =?utf-8?B?dnFwdzdyRnRSZFRpNDVvUFJidEc4ZTkzZllqWDRjdzNvNTlyOHI2bWlRS0pJ?=
 =?utf-8?B?VUFpZXM4SHRNeVJrd1Rncm9aTFdlMjVEL256V2k2QVM5MG1iRnJ5bzNML3lC?=
 =?utf-8?B?blE2ZGtvb1ZpSUJMb1pybmE3ZkZrK2NUQXVmQU0zTE1hQ1ZOUm1GY2JxRzZX?=
 =?utf-8?B?aTBrVndRT29qZ2huMktvRklwWXMwaE1RM2pyR3FRcXZqMDZBYmQ0dFVGVGZY?=
 =?utf-8?B?cFhkeHlTNjBOVjk2dU1iM0RVY3l4RThUSUJrMjZWK29IQko3dWJ2dXAyK0ll?=
 =?utf-8?B?Z1ZVWTF2S05ubU5CK2tNWjdOTStKVTZtaTFuZXI3cG9JWHZUN1NPelNPVGxo?=
 =?utf-8?Q?Ns6aGCw36UI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEk0NFUxWkdwdGtJaHpHdXdrRDY2MXFkVUFhajRWYjVQT2loY2RyTHZLdm9u?=
 =?utf-8?B?ZXVyeHQ3Rm9pK3EvV0hsN1lSS21vNk1NNkM4RkM3VWdHc1JBMFRVYmhETm1K?=
 =?utf-8?B?c0kwRnZzQzJ2eTVBbGVFaE1idjRNbnpyajdYOUFlTXp5aHM0d0RCdHllV2Ru?=
 =?utf-8?B?VWdsYTNkUE16UUF2TWhXaFdDU1FJakdBWCtlcEZLQ0kwa21Ga3g5Znk4RGM0?=
 =?utf-8?B?dnhlRFpQd2dOZmJwaFlSVGY3K0VGcFB2Ty9nQnlwTHNDemJNcUM2QVQzaHJ5?=
 =?utf-8?B?aVdrYXg1bFVnZFBXaWV5U2hyU0FPK2s3dFVZU0QrUWkwYlJwUTlBVklXTFZT?=
 =?utf-8?B?S2JSZGVnejZVTjdiTTEvT2pXWHE5ZVZaSGlYUkNhZzJtNmZCZ01CaUhtU3Bi?=
 =?utf-8?B?MDBlSGNySmVpTGJUcGpXYVBuUzJBbElFa3NtemNtNkoybU9lVWRwbS95Y2I0?=
 =?utf-8?B?dFlEemlpeWNoQ2dhUy9OZWRxSDVSWE52Vi9HY2tkZDQvamxJUk5EOFJtdnh2?=
 =?utf-8?B?UVpESDR4TDVxLzNSRzQrcm85VlBxLzg3SDJzVC9YNzZjRW10ZjI2eC9DcHpN?=
 =?utf-8?B?U3NvQ2VWSjQxeUJrQ1dhVVJOWEYrSUltWmJFNWdYbFk0QnBzNUJ2L0Q4OUln?=
 =?utf-8?B?VmRlVCtMVUJ5ekluZWNIK3FOSmhTb2o2UFlsbWxWTjU5ZTFpZ0pKNlNVZEtl?=
 =?utf-8?B?Q2lEazMveHNiWnZQNTVhUktaYlJHdmcvTDQ5SW9pMmRiVWZRaHZJRW5kcWxY?=
 =?utf-8?B?b3NuMlUvamJnS3Y2eU9tMXN3L2xka3VMZFNKOUM5cVpFNFBiTElIZ2F2ZXQ0?=
 =?utf-8?B?b2FPYzg5MWpSUEEvazc3YWloVnhEdHdjd0JvNUR2RncyQllBbDVvcXpocHV4?=
 =?utf-8?B?K1NNa3ZBaUNwREt0TnNyeXdjVVhRL1ZJRkdiK3gzbXZ4dEMxcUpPTHdyRmt0?=
 =?utf-8?B?Z05KWGF0bHI3U1RDaCtseUN3YWorU3Z5Y3lJOW9DUUwyOTVwaVBXOENKbEJo?=
 =?utf-8?B?Y3JOTnRydEpkZ2VaekRyKzJhb25hdUpWS1Fjb2tiS1pWaHRiMmQ0OFlEeUEy?=
 =?utf-8?B?YXJ0cjhkdkZHejg2RXRpcWQ0djdFekR6N2JPcVhadWVabXZOSmJ3VVVhdSs4?=
 =?utf-8?B?Q1JqcDhKeFo5aHVqYzk3eXkzMzFXSURXKytZKzJZaEtXbWlNdGxtYjhoMjR2?=
 =?utf-8?B?cnVZZUk0U0ZHaWJSSDBBUEpaNGc3UWd5QUVySVFEZTd6OFlrRTAvdjdodjUy?=
 =?utf-8?B?STV5ZkpEK0RTMkFiS2FKSWFYVER5MlRER3dWZXJKRWJrN0VReFlDTjQwb2ls?=
 =?utf-8?B?NDZZcEswVktoMzlGcVVQaXZBa05kNmh6cU9GYktvMmVCa1pDZHpKNFdWaW12?=
 =?utf-8?B?M2FteHBEanFBWlgwY21hSmI3d0gzbk5ROFcxZmsxWWRsMWRnQkFac2l1ZFJu?=
 =?utf-8?B?MUd1THZ6Q3B2RjZNZXhyR1psMmVsb0ROcXlnc3hNanVxeVQ1YjFQQnJReHBj?=
 =?utf-8?B?TUkya01TM01pWDVvbW1xRWlNOGhEcEFMT1doMnllY2paeUQwRm9pTmRJQTNP?=
 =?utf-8?B?T1NmUklPRFN6S2x4OW1NdUdLdmVscVlJY2p3ajFkWnRONFdkVmhjRGYzMGJ5?=
 =?utf-8?B?eUM3UHNyZ3pNLzgwZHE1RWQ4RGJlQTM5UDFuaXZvMCtPdWQ4TkRLKzh6bHlQ?=
 =?utf-8?B?VTgzdjBsU1BDTHZTM2VPWkJsRUxhTFY1YWZqR2VJdFdiZmx1c1lDZEhVVGI0?=
 =?utf-8?B?OUZHdlFaSUduYzU3Y3JQOUZmZG5hQXY0S1VIQUEyMGJkQ2RVaG9pTldNMTNR?=
 =?utf-8?B?aWtHTnRuN2s3aHVpbzQ0a2U3TXlqSFQ0eTJ1ZytsVVF3TU5HZ2E3OWNOcFUw?=
 =?utf-8?B?TWI3NTkxN29rK01rbVh5NVRoL2lJd3ZzeW40anBaWnZjTjlWV1ZjSzErMGIw?=
 =?utf-8?B?eHRGdzl1VWJ0a0dQZm5WZWx5dkxJRlFjOWg3dVR2OWVmT015UXFNQnJkQXdX?=
 =?utf-8?B?bC9RZ3h6ck1ualF3cC95MFZFdjhuM3lOQlZjaGFhRTFCeFZ1TDFhLzFydno3?=
 =?utf-8?B?ZEkwTkg0aVBJL041NU1PWWhpNklqZVQ3K3R4OVoxVEwwZU9COE9qb0JKQm1V?=
 =?utf-8?B?TzhSSnMweE1IR0o5YXB4UVlzZzAwMHRjeEp3Q0Y2YjNRTmpRNTlyUVNqY05w?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1ba60e-1356-4907-6c7d-08dda359f55e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 11:21:32.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJEqxEFcQqHBoKOrfBLQ/aYSn0gJv8N8oIV84LkRL/dKYXaV9xH4OAS/qja4eF+E3X7nRViHBy/UGEvlC1+PoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6554


Hi Dinh,

On 04-06-2025 01:14 am, Dinh Nguyen wrote:
> On 5/26/25 01:25, Mahesh Rao via B4 Relay wrote:
>> From: Mahesh Rao <mahesh.rao@altera.com>
>>
>> Add support for HWMON commands in stratix10
>> Asynchronous communication
>>
> 
> Please add more details to your commit message. What kind of HWMON 
> commands, and why do you need it. If you ever have to debug using git 
> bisect, you'll find these commit message very useful.
> 
> Dinh
> 

OK, I will add more descriptive message in the next version.

Thanks
Mahesh
