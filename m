Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2BA231840
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458764; cv=fail; b=YT3h4pQWJ14uAXU7lshEVvWjxTqhJZ8RtTTfcwroVWIb4OyC/48qqs1g/dNa3kxH5ljX2hHEQh5As1QCztALppoYZEGrmcsx4AUXhpo9b//eWK9KQU8+CUaHBkbx5lfksFtVQ84gcAg5JaSu7P7MbG91mRI80gR+s7SIgSpS/Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458764; c=relaxed/simple;
	bh=VXX+AF/wmhWCV+dY1tgIhBxM0aoek7jz3TL5NzuFtFI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L36IsHVRTx8nBj3ShhmxW5iE446s/B7W9HnSY3lVC36yVobEkNPbTRfC0puYhPw/wu7YZ33NoaZ3ZEPU8qygwF9U1iieKvEWuqbM+rs2wmet1fEEzOYCd3uW/IYAb1dKegueqJcSviYp9VTvKidwQXhU8TKeLIS6J0HBiR142ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xrXUETFd; arc=fail smtp.client-ip=40.107.236.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xrXUETFd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIXqSIL0b+tnQZchUSyTxXxFANfiQT2+LjCHqv3ww5NW3GDpXpipbeZm6mfnl1MvvCpcuTjfPTye0O7e3WdoN7vfL/7SLJnICzY4LdIPW9+tC/qnQ3cjw0ZcIK6QTVzYIBD+vQKNR7VlQs0DjnK4SKSq9E/vnCDVeEbtQkjH6orcFm9JefWEWQ3ms14x27zeQjU1RLtpDq188TrqqLrwghkIHacXtzrOBVMFK1n86EKmhDc4MH3jxRgF1ddzPEfFqJp7J3jq8KDigwTODolNxqvVspt4SdtQ8N8V8JS/6iWd/KeKGSlLbh7H1NsbaMoRnp0AlwPoJDEelaWpgliLBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvwLnhWt2CDmKFZt/bBW5nt8yQSO0cqKF3UP6yJNxZY=;
 b=P5Q16i+IMD/ixeIxinmFAwzA5ym8PymZZI4Rp0yyOfg/gXa661XXhXbmNfjMOgdyCsJuVNzvQ8Uy5RFfxmG4pjs3gw6cIt50VMpemb7FMzoaiu6iz0a7xLPHIC3iWx/9EB29mBuU3ICD7dLnKmaaaEO/t6cE1FgmsGF+b6PoSyHQR7C3vcNx16UUInq2PuE2R6McxYOvHYLo46w9GSscdLKR/M/7EGdgWpOZN8EjL2X4PPcWIK6rEVMYc6SGHNo5OvMKczmGLTETTSGF8G6i5nCbTw+a2M2/tsAaERx7TIKv+MD/+eIpIKzDYN5Oiww/gCSNGkx9XBiaZ7dd7nZbgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvwLnhWt2CDmKFZt/bBW5nt8yQSO0cqKF3UP6yJNxZY=;
 b=xrXUETFdRDPgSSzdfBFDKPzBiQFoNf61PryAop4+WrplDY5A5bA02xA++R/nVL/mxVrx+X0Q10yuHhdy66ITTCvo1Wbb4VT5RWJ5uNasE9UWQi/ikSdwETeSq+02PAV5AeRKTUw+Yp4CC7fpYqZdfOLPQSfje4oggoH4O1WUm9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by BL3PR12MB6377.namprd12.prod.outlook.com (2603:10b6:208:3b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.28; Wed, 2 Jul
 2025 12:19:19 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 12:19:18 +0000
Message-ID: <5bcb752d-813e-4ab4-8519-fae897472b5b@amd.com>
Date: Wed, 2 Jul 2025 17:49:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: Jirka Hladky <jhladky@redhat.com>, "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Abhigyan ghosh <zscript.team.zs@gmail.com>, linux-kernel@vger.kernel.org,
 Suneeth D <Suneeth.D@amd.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
 <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
 <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
 <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
 <e9666935-f7af-4419-bb85-e1f041c64ea9@amd.com>
 <8a919ef6-4105-44e0-a17c-e41c1c0abbe9@amd.com>
 <0ec290aa-0e9b-49cc-9dd7-2f58c51b6d22@intel.com>
 <CAE4VaGDgta2PrG2WhPQ6KndZd3pAf5Fh9oJEf9k1eZ4492Aw_g@mail.gmail.com>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <CAE4VaGDgta2PrG2WhPQ6KndZd3pAf5Fh9oJEf9k1eZ4492Aw_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::7) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|BL3PR12MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c45d42-f097-443b-955e-08ddb962ab19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmZhNitOck5GYWpCRXhpNEd5a0ZxTUdnVWh4N0RXcDVvb3RHemRVQUtNbVpW?=
 =?utf-8?B?eGZNRXZpRzBkT21kd0JtM0cvekFoeEo0QzJiRlA0U3ZDZUQ4OEZGOVZ0RUpJ?=
 =?utf-8?B?MEdoNC9KMkkxNjJ0a01RazlwN2QvMUZiMWhXMlJiZm41bmJpdGdLbkZVMUFQ?=
 =?utf-8?B?SkplNzlVaXI1L0luUVJRYzVRdVVabjREWjcwL1lYenl4M1g0VmJ2MnhGWEhR?=
 =?utf-8?B?NjRLbmNNcUZUSVg4ZTZaVWVzQi81bU5pbVJyTVZNb0pkZGp6c3RCcFIyNG5q?=
 =?utf-8?B?MDVJVjZVeFZnOHZMc1FSRFRQR3JGdVFLNC9maGhzeUdreHl3LzF6T3YzdGFJ?=
 =?utf-8?B?TFQ5Vk9WSHBQSnpRTXVaa24zQmluZTBwTkpQUzc2QStuL2VQSkhCL1R5U3Nw?=
 =?utf-8?B?c2VRbXFSMzdzTXowbDczTWEyVTNtZmpaRFIyNlJkVUpNL2IyMmVueFZDbFlo?=
 =?utf-8?B?elFCY3RFekFrV1U0VGJwRllJMi9TWWxMOUc3VmlOb2dEMGdRZ2pYOWpBcHFF?=
 =?utf-8?B?dmJqM0lOb1BBc2owWDlwWGhmSlF6TzhqekQyR3ZuNk1UcFhudHBnZFg2WmQw?=
 =?utf-8?B?WHJWZlFPN1JMU3RDU3ZvRjN2UVBZTXBuOUUvdzkzRFJDbkpmUm1wSm41eU5P?=
 =?utf-8?B?dEE5NFl6RjcyaTB3TTRYT253SG1hMndGalJjV0hVODQwUjdRWEh1ajJ5b3hL?=
 =?utf-8?B?TXFTa1M4VHZVbVUxTFhDWHBENlVLYm5vWld2c0dMK3Y5RlBiRFZwNWdZWUdi?=
 =?utf-8?B?azdhajdVcDVEempTRWNsbEdDNm54TVBQOEE3TWNDL0d2cklUNi95WkhrdWFi?=
 =?utf-8?B?WWVQUHVrWG1XOWtNYW1NTVpHRmIwN3ZMNnBjc3dEaURwTGJDYW94ZDJoeFNp?=
 =?utf-8?B?Rk9vbkJjQnBJVC9qRGZZd0dXUnlHbVlHYzF6V0FCc052TmR4RjhJK1pLNFlP?=
 =?utf-8?B?b1ZxRjUyTElrZ2FSZWF6ODBVTE5xQUp2bFFmZnJubC84MHJDa3U5cWFxZ3I2?=
 =?utf-8?B?bjRra3FDMXNteDZ2WThNaDBCRW44RmRudkFlaEgwTjJkY1JBNVVZL3NqK1Js?=
 =?utf-8?B?MCttV1VHaHZHQ00zKzhvYjQrZThWRVFKR3JoajR6N3BUMUx3eTlrQ0NSVkpw?=
 =?utf-8?B?am00eWY0aW4zZDIrSi9iMTd5Q3lYS0VhQUtQRmJKOU4rdWRBUjN4aGFsSGlt?=
 =?utf-8?B?Yk5QZWh2eUNlcXhkcTZ4TzNna0xtM1VCMlowRTdiNlhvOE1TNUtYQXFsbS9y?=
 =?utf-8?B?NVV6aDMzSVlsRWsrckdRczQyVFBvbUVnWE9CK29MSUNPN1JKNzNKb3ZwS3Zr?=
 =?utf-8?B?RzhNSWliUVl1QzgxRjgwY05uL2dUaGlCb1RDUjdxcDF2aTlkUWRMYm5KVkhT?=
 =?utf-8?B?U1pvZUJaOUR1TUcyQkdhaVMyNHduT3B3bkZXaHlYMkY2MFJkWHBVWnVHeENM?=
 =?utf-8?B?LzBFcEdKcWdGMzdOZmsza1R5aS9YVm9wall2cmtoN0IwU3podW54aE44ZitK?=
 =?utf-8?B?WVRub1VqbmVBOVlPcmFkdEFhZ1ZYV3o5bEhOREdRSXVqVTREcFpMNFBha0NZ?=
 =?utf-8?B?WGlKRjB5U280UDRjVHJLWHQxVUZFeDhXS2JsOUxtQlYzQUNxcytxTzZ4NzVI?=
 =?utf-8?B?bVpZd0p1ak1SN0sra0JPRksvcTh5bHpHcFQ2OUFSM2NNTFpWSzQ2dkZWTE85?=
 =?utf-8?B?RlpydDR2ZTZXNXFNY2Vma1JpM2N6cTE0SEl6dGdIazZ2aXJmdFBhSG1uUDdE?=
 =?utf-8?B?UVBVL1RYc0tybjNnbE5JUTJZNHhIREh4Uk9lNlRpUGc1dGVhLzFHWFcrbW5Z?=
 =?utf-8?B?cFhlOVpDWGQ4Ym9uYkZVM1dFd2RhRVIybzRFam1mNHdTTmZTR1gyYTl0Nmxs?=
 =?utf-8?B?bldLYXByWDBmQ0hGeHBwazhuNHhIa0NIMlpVQmo4bGdnQm5jd2RTdGtJVXFs?=
 =?utf-8?Q?WVHmXnMeUpOlFTR57GwWrhE53dTUJ9kP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFJkR01HN3AveEpZaTlrdkZ4emVNUks3YlprVGQ3VDVrM2lKK05aT3NTR2Vn?=
 =?utf-8?B?RmJHMWF1dHB6eUNVZFlRc2x5RlNBWVZCajUzbmorTEE5RGVrVWxrWFhhNFpC?=
 =?utf-8?B?ZVBSclQrcXNKMTdpMStSazJmZkQvQzF1Z1VmNHBDSVd6cFJ3dDIrY0FMS1U5?=
 =?utf-8?B?bDZXdXp1b1dMVUZiWVNRSVdrMEZBMkJpbndVb21JeUpvdjU5bnk1Q3hlbnRW?=
 =?utf-8?B?cGt1NFpyeUNDY1MwRlV6UTJOTXVmSXRxYlZoRGFWMWU2WU1ZSmNlNzFBRmdv?=
 =?utf-8?B?cTRzc1lVM2JBZWVBNDVTcnVieko4ZUN6dy9CSVpiN0dHMk4zd1RTV2o5RnpJ?=
 =?utf-8?B?V2Q3Mk5VRDBVd3Z2M0d0SXkxamRhYk1jdkdlNSs3NVZYNDcxSlh1UXpzbTNm?=
 =?utf-8?B?R0tISENwUDJwVnFxN1pCUmJ6a2RRY0U3Y0FxbzZGMGRDbTl5WHVJWVhpRkxy?=
 =?utf-8?B?Unc1dVJ0U1pnTm5sR3hGNlVRejF2YTJaVGdJdGtvbXRUT0VqWVRPblpyV2hm?=
 =?utf-8?B?WmJPcDBQb01rYkRhMDVYTjB6WlBxaGdickwwVU9PL1Y3Z2VXRER4L0lYdlNT?=
 =?utf-8?B?bTE3ckE3SnJhdENQOWVqR0VFV3loY2RUOEs1L0FMbkdjRTM3cWNMc1pJeGxZ?=
 =?utf-8?B?WFp2c0hvRnlJNmxFQ0VOd2xKeFlxVmpuUDN6VmVyUDBRcHQrN29PN0w5bE81?=
 =?utf-8?B?eis0Z2ZSM0trWVhmWHlFTkRSMGZ4RWNicWJKVUlHNzNGQkk3VEhsckc3U0U3?=
 =?utf-8?B?b0x5TG1pMEFjUHI3RFlUNW5oQnJqclN1SllaWXhzdWxKdzRZWklmSnlQUFJD?=
 =?utf-8?B?S0VFZ1BIWGVjRUZZWlVFY0dsdnh1UWErM2xZU0NkdDlnS0RkZFdNb2VJQ285?=
 =?utf-8?B?QS9TMUxuck9FSlJTQ0daaHVHYUZiVFkxcHhXMlkxMHdGR29UVkdqWkdCNko4?=
 =?utf-8?B?NzBZTE5jb1JPS01HazB0OGFUNzF2d2FQdjhTQ09TNUdlSHNrSmNFei9RZlA0?=
 =?utf-8?B?RkwrRXB2cjdJeXVDVHRRdExJUU1BS0EwWXNUNkVOcVlxUFJKakxldFpGUVBy?=
 =?utf-8?B?VzAzRTlKZnhIY0xpbTdGN3ZwRTE0L0VZeXQ4NFAxdXVHTlNVU2tzTW90ZXlG?=
 =?utf-8?B?anc5V24xWi9DV29nUWtteFd6K2tLZElWRXZES2ZhcmRSQis4STVmN3hGdXVi?=
 =?utf-8?B?Q3dteEhPdHNRT1Q3N2lSeVl4K0dwZTBCelB6NjVyZVVWZFpKa2lEanRWaUZ2?=
 =?utf-8?B?U3VhMjdVZzBnMGlETmQ1ZE9RNkxQWWFFRkx2Tkl1Ulltb0hINjVHL3ltSFhL?=
 =?utf-8?B?K2QvaTNqMXNNbHIrcFlKVi9NdUk1WWVYVjBLaGpTSUIyanpNNzM4WktrMVZT?=
 =?utf-8?B?dXkzQTRuOFdDR09TMDM3MUpMOWFubkpNWVBEY1g0dzJtbFFObGV6Y2VDYng3?=
 =?utf-8?B?SkdMVVlaUnFuanhyTmlBZWMyb3NEUVY2OHJ2Z3MwSUl4cGdrMGVaUEczakJ6?=
 =?utf-8?B?dWwxWlBUaHZQRVltc3pKb3Rwb21OK0dQSjd0cUhXYVV6anVPbElsb1pQb1hx?=
 =?utf-8?B?L2xMOWdwM2NwQ1ErSHJEUWNxNGRlZXd3ekZEdm8zN0dWQmUwS2FvMmFyb2hW?=
 =?utf-8?B?TU9DU3dWVy82TmM0bjRtNFVMUlFBRkYxTkYvZjBqMHB3Q0tHdnZLalp0OUtv?=
 =?utf-8?B?MVk0Q1RvVGFJRUhIa2NmVXg5Q1kxblI1Q0NaNzQ5SSsrdVpZZmwwQXdpV1h6?=
 =?utf-8?B?V0dSalRld3E5Qk9Wdm1ld3lVcDR4K0dwR3ZMcVdlTFdtVWZnUmhCTnFQYXBR?=
 =?utf-8?B?TCsvbXg3QmpEbjhvUGIrQWRidU1Zb1ROWHJYRmtNazFvU1RzL0xkaVZOK0pz?=
 =?utf-8?B?emJNM3p6WmRFOUVhNkM2eU5DTDNSd1pEemNVUWYzNDI4TGh1WmhQUVk1UVZL?=
 =?utf-8?B?KzlKUVdyUk82SE14SzNFdXdWamc5ZDlIOTRzUyt0Y1RmMUtMV0hpamtSaGow?=
 =?utf-8?B?b1RSZitVTGZUVTRzMEErUEJKRHpvYXFEVE8xSXdLRWRQLzkzWnVlUndDcUEx?=
 =?utf-8?B?N0dNNWx0bUlrZHdQZ0dvMFYyNGpnc1Y3L0kxU1JwdnVDZ25JcktGaG1wOHdT?=
 =?utf-8?Q?dc7RipRxUPCgKxl9lZR9fvdea?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c45d42-f097-443b-955e-08ddb962ab19
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 12:19:18.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCA8/Tg6DMtoX77kBfU2qkyyRA4rxm3QJlTWLAstkKQiy3grn0YkmEDcmhU4QdrNGiyiidvnqCDW2/Bl4pYTMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6377

On 7/2/2025 5:23 PM, Jirka Hladky wrote:
> Hi Aithal,
> 
> thank you for the reproducer.
> 
> With the patched kernel, after running a reproducer, please do
> 
> cat /sys/kernel/debug/tracing/trace
> 
> If the counter is nonzero like this:
> entries-in-buffer/entries-written: 1/1
> 
> please post the `cat /sys/kernel/debug/tracing/trace` here.
> 
> It would be helpful to check if there are any other race conditions
> besides the task exit.
> 
> Thank you!
> Jirka
> 


None of the four machines running our workload [with the debug patch] 
showed any entries.
Entries in Buffer/Entries Written: 0/0


> On Wed, Jul 2, 2025 at 1:17 PM Chen, Yu C <yu.c.chen@intel.com> wrote:
>>
>> On 7/2/2025 3:36 PM, Aithal, Srikanth wrote:
>>>
>>>
>>> On 7/2/2025 10:02 AM, Aithal, Srikanth wrote:
>>>> On 6/27/2025 1:03 PM, Chen, Yu C wrote:
>>>>> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
>>>>>> Hi Jirka,
>>>>>>
>>>>>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
>>>>>>> Hi Chen and all,
>>>>>>>
>>>>>>> we have now verified that the following commit causes a kernel panic
>>>>>>> discussed in this thread:
>>>>>>>
>>>>>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
>>>>>>>
>>>>>>> Reverting this commit fixes the issue.
>>>>>>>
>>>>>>> I'm happy to help debug this further or test a proposed fix.
>>>>>>>
>>>>>>
>>>>>> Thanks very much for your report, it seems that there is a
>>>>>> race condition that when the swap task candidate was chosen,
>>>>>> but its mm_struct get released due to task exit, then later
>>>>>> when doing the task swaping, the p->mm is NULL which caused
>>>>>> the problem:
>>>>>>
>>>>>> CPU0                                   CPU1
>>>>>> :
>>>>>> ...
>>>>>> task_numa_migrate
>>>>>>     task_numa_find_cpu
>>>>>>      task_numa_compare
>>>>>>        # a normal task p is chosen
>>>>>>        env->best_task = p
>>>>>>
>>>>>>                                          # p exit:
>>>>>>                                          exit_signals(p);
>>>>>>                                             p->flags |= PF_EXITING
>>>>>>                                          exit_mm
>>>>>>                                             p->mm = NULL;
>>>>>>
>>>>>>      migrate_swap_stop
>>>>>>        __migrate_swap_task((arg->src_task, arg->dst_cpu)
>>>>>>         count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>>>>>>
>>>>>> Could you please help check if the following debug patch works,
>>>>>
>>>>> Attached the patch:
>>>>>
>>>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>>>> index 8988d38d46a3..82fc966b390c 100644
>>>>> --- a/kernel/sched/core.c
>>>>> +++ b/kernel/sched/core.c
>>>>> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct
>>>>> task_struct *p, int cpu)
>>>>>    {
>>>>>        __schedstat_inc(p->stats.numa_task_swapped);
>>>>>        count_vm_numa_event(NUMA_TASK_SWAP);
>>>>> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>>>>> +    if (unlikely(!p->mm)) {
>>>>> +        trace_printk("!! (%d %s) flags=%lx\n", p->pid, p->comm,
>>>>> +                p->flags);
>>>>> +    } else {
>>>>> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>>>>> +    }
>>>>>
>>>>>        if (task_on_rq_queued(p)) {
>>>>>            struct rq *src_rq, *dst_rq;
>>>>
>>>> I was encountering the same issue as mentioned earlier in this thread,
>>>> which has been recurring in our daily linux-next CI builds within our
>>>> virtualization CI stream where we observed this BUG appearing randomly
>>>> during the runs.
>>>>
>>>> Additionally, we were able to reproduce this issue while running the
>>>> autonuma benchmark. As mentioned earlier, the BUG would occur randomly
>>>> across iterations, typically between the 5th and 10th iterations.
>>>>
>>>> We consistently encountered this issue up to the 6.16.0-rc4-
>>>> next-20250630 build [https://git.kernel.org/pub/scm/linux/kernel/git/
>>>> next/linux-next.git].
>>>>
>>>> After applying the aforementioned patch ontop of next-20250630 build,
>>>> I tested it in our virtualization CI and with the autonuma benchmark
>>>> reproducer described below, and the issue no longer occurred. The
>>>> patch appears to have resolved the reported problem.
>>>>
>>>>
>>>> git clone https://github.com/pholasek/autonuma-benchmark.git
>>>> cd autonuma-benchmark
>>>> for i in $(seq 1 80); do bash ./start_bench.sh -s -t; done
>>>> Note: The server running the autonuma-benchmark must have at least two
>>>> nodes.
>>>>
>>>> If the provided fix is final, please feel free to include the
>>>> following Tested-by tag:
>>>>
>>>> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
>>>> Tested-by: Suneeth D <Suneeth.D@amd.com>
>>>>
>>>
>>>
>>> I apologize for overlooking that this was a debug patch. With this debug
>>> patch applied on top of 6.16.0-rc4-next-20250630, I am unable to
>>> reproduce the issue. However, when I revert this debug patch, I
>>> encounter the issue again on 6.16.0-rc4-next-20250630.
>>>
>>>
>>
>> Thank you Aithal, this is a debug + fix patch. And Jirka has confirmed
>> that this helps somehow. I'll post a formal one and Cc you.
>>
>> Thanks,
>> Chenyu
>>
> 
> 

