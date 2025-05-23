Received: from CY4PR02CU008.outbound.protection.outlook.com (mail-westcentralusazon11011007.outbound.protection.outlook.com [40.93.199.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DB918DF8D;
	Fri, 23 May 2025 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.199.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747992019; cv=fail; b=NY+Dx6ftmDo/ZtTAXBgBkRYaLbuoxPBO9Hlapm2aDQAUh4ZOx5vqR19YjlGz3adoij6PqjlqPtwWaZITzKgZIktZ15havui+M5cVtvGbp6YrdQOiYWLZO0RpupZ0/3xMxr5pdN+ivUyCMXZwwRXKXd3vsuk+D4NAYTQ5Iuiur80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747992019; c=relaxed/simple;
	bh=KmNZxnjCCV2jWPpjNN6QOtXFtglBdc+nM5U+jC2LZzE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CwgqBRSosL8s/kh6rtVMVNqJt49+0Eueq2R8SAKteQcwpuKhXg+vVADbGPcLHGUN/tz7oVkK+SBSK7YSnpEYxW8a5HNbOV+p34eJtpaML+zpMd8sqK+QksbEnxybIhCoRloKdLT1up1bSfeVxNFnajyfo+vq9SQ695ZVBsPw2LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=eQufEoYZ; arc=fail smtp.client-ip=40.93.199.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="eQufEoYZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8HAmgvfoXhldbAaK/TS5Qt9qygoQ1GAl8pW4H+JFRUkKIcidTMGAorOBamceP4Ksdq8N8zKtMyL+Yb5GJBeZ+JwiG2ux7Nj37uMwPZ7lootsM77dJ/16einGy195uhmqg0If4QCzF+b170P+8ZBDWUa8CTWcH9bmUH0oyPg9qIujXOJEP8EA6IVYc+fq7TD/AWTF2KzofNWdxDU/o++ktjz1oObzAvP5bxxMuvUya6SoMM2JXr1k6F6pcaqvTc4Ik1MM0wTW+zacpGjoEvExDMFxLlLveRz/vsUQAFzf0DCSREAEnLBjs1QYKWBF0UgpZzikYm7/SV/ywYFlzCoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gb8wluQNUXyAGRHO+61f6wGCONAv12Q/w732PV2GZo4=;
 b=gOHOov5LNbWCTLWmxIm0O2ZqBOBL2zo5GE1ZtAabKtEdVb1m3lSVTLLGFtLfO1O79Wwv0ZMfoA5M8OIOm2hhqoEGlZsY1mbK/uNPp0cmkk4eUs1Rw5xw9iXPA8/oBcamwIOs/YKsqrOfiNljZLHQ42/OkEKVo7ZpoBUsf3g+NTt2Hu/zrBT0Y6Rk3bCeDdcAg5ZCEfXywW8zUu2cVxrxdROIEI+gJbPOHsBuWhSJnV3D/zhugwXYP5Steu70JALe4aVxDTV0hy0khxEEdbk5JafaROH9j1EAFNemEJy3devFgqYlmmRES7iNJiuX5E/cNofwkoLf1mF1+YHQ0OIWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb8wluQNUXyAGRHO+61f6wGCONAv12Q/w732PV2GZo4=;
 b=eQufEoYZEolPdL6inC/4HQt0vBqkcyOomH4SEOtV9R0TWgahVYxE899jh4qKnXDgU4LEyPdF3x403J56M7SnJx9wUS2Ff8c6XRK4d1REoo4j7/t7MTlrGfJ4Ea/4ZCMKI6A2AHBqVwPM/pL17Ey2pB4uMwMaM92DMRTpPcUiTL0dqaGVbi3jpDRKsmCy+5zKklQK0lKhme2AaEVO2XQGbho8vVafw/8LUSs6nBa/OFsjfm5/9mOxYhLNtVWzU4kpAemw0rg4daf3D1NFcaYEnknOC3IOb2HwkkuVdsH7JgUL6yBkT8G8N6qy+zruwNTdh5tHBHAgP4cN4olpO+LIDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6207.namprd03.prod.outlook.com (2603:10b6:5:39b::22)
 by PH8PR03MB7305.namprd03.prod.outlook.com (2603:10b6:510:251::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Fri, 23 May
 2025 09:20:14 +0000
Received: from DM4PR03MB6207.namprd03.prod.outlook.com
 ([fe80::4202:9082:1ce7:f945]) by DM4PR03MB6207.namprd03.prod.outlook.com
 ([fe80::4202:9082:1ce7:f945%7]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 09:20:14 +0000
Message-ID: <8ece6a84-b235-4881-ad25-c0f4a9e732a6@altera.com>
Date: Fri, 23 May 2025 14:50:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix 10 service channel
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
 <20250512-sip_svc_upstream-v2-3-fae5c45c059d@altera.com>
 <b92f2ad2-7cca-455d-af45-cfd418bf54bc@kernel.org>
 <0eab3179-645c-41e8-8d21-111b11ba5c6d@altera.com>
 <40b939d6-9339-444f-a2e4-3e4cd4bcb317@kernel.org>
 <ea381d6e-3554-429b-87ae-74451c72d4a2@altera.com>
 <111ba367-8e26-4b45-9206-d7a28038abf2@kernel.org>
Content-Language: en-US
From: Mahesh Rao <mahesh.rao@altera.com>
In-Reply-To: <111ba367-8e26-4b45-9206-d7a28038abf2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To DM4PR03MB6207.namprd03.prod.outlook.com
 (2603:10b6:5:39b::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6207:EE_|PH8PR03MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: ee46db91-9a62-4147-6f25-08dd99db065e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amU1b2w3alg5ZmRhWG1CVE9nQ25SR1JRZEJSUkZyRk9zU1l1cHlvMktobFVM?=
 =?utf-8?B?L29aSUxGN3lYSFlHd2FTTFdQWEo3SWhyRFd1bW9lV2RiSTdqbmlhYWFIWjYv?=
 =?utf-8?B?L050QzhIZUhlbzErVElrTjl4eDJid3ZJdWNtQ01HdHlqOEZ6K0Z3ei9lQ293?=
 =?utf-8?B?SXVEbWtwT2ZmaDhCQW4wNnVCd1F0QzRsZmRmaUk5eGdDOS9pcU1QKzZoODI1?=
 =?utf-8?B?YlNoMzd4V2VYTjNrMU50Y1BFOGtScXFhRGZ3M3VKZkgrbXVtNWFSdlJsdlZ2?=
 =?utf-8?B?OWdiR0pLQ2VXYWZkUGZUVW9WUnR5SUZKRG5ER1pMaFpKV3c4WS9sTW1XY3B0?=
 =?utf-8?B?STNPa2xDWlFwSVhHVi9aVW9wOVpPSGlURWYvVUw4MWhWZGdNcHY2VTc2Z0VC?=
 =?utf-8?B?UVBlZnppNHhaT01sYjdxZ0xCdThJdDJseUJkT0ovVWxQaXpWTGgwOHF2NGNC?=
 =?utf-8?B?amNqMzlUWVZKalBuYjhRNzhlemUvbFppaDNtb0k5VFJKbGR6MHkxZFd2Q3VM?=
 =?utf-8?B?czRZZUJKY0FDUUhoMWxlaFVRaHl1anlUY1IzVDlNN1NoMlNydllOWlNMdGFY?=
 =?utf-8?B?TTlFcmdlRTlpOC80NStLMXluemZRRnhvSmYvWDRKODZLUzVTZGc5WmVMMHdW?=
 =?utf-8?B?aE15QVFVYmR6U2hRMEwzaUsvcnZOelJYQnFNTFNmZ2VpSURIY3Z2V3FPcHda?=
 =?utf-8?B?UEZmaFBySGJBbHJhOHh5NHpwTXg3UFRpK2dVOHhzSFBhVGJuU29ScnFibGdH?=
 =?utf-8?B?eTJDREE3eGVvVm41V3NUV3kyOU1KRzg3YzVlbWpkQXZuZ0kyTGZBU3FWUXVM?=
 =?utf-8?B?Q3p2YWFsSldLczVhVmRWSG94MytocXhMSGRJeFE5V3d5d2lHcktua0pZVmZF?=
 =?utf-8?B?QzUxYjhOSytUUXljUnB0cDloNTVYcGFuMjNvRkFWY01xSGtaYjIxWnh2dGZ2?=
 =?utf-8?B?Sk5hS0ZWWHlLRU0xTEMwbDVUSDMzbFJta2FnK1BZWXUzSUJ0MEp6QjAwNWNX?=
 =?utf-8?B?RXpIL0NOQk0xWjZEeU1UMFdNY0wzVVVwWjNBWlRNYzRQWExWTzl6NS93SEgy?=
 =?utf-8?B?a1Nkb0VNYXNKN3NMdG9IL0FjcFRFQllhWUlVeXM4VGYydHN0cWxpdlJ6TzlI?=
 =?utf-8?B?VXZiQnh0akozT1RUbDYvbHFwa0JtaUJzWGxPWTVmckpXQUFUeTZpNS9LYW1l?=
 =?utf-8?B?WmRsRUE0TWI3YTVQMGtLTEtCZUd5SVVwSE5rbGsycng5ckJKM3JUczFRN3Nq?=
 =?utf-8?B?Q1Npb292VXhzWVZHYmF3dEREc2hNdmZ5U0xJRlBXY1B3Tnh6VmZRbjdvWDJF?=
 =?utf-8?B?L0d3RWxXR3lGMHhnNTRSc2x3VEFYcHFqaXMrK3RGaTFYR2ZZdkFRUm52TnVy?=
 =?utf-8?B?ampKVFBLdWRiYk5pTzVZTEtwdlFDQitqeUU0TlpUY3RwWjhSRTFyQk5wOTlE?=
 =?utf-8?B?MGlCZjU5bC9RNjBzV2VuU3ZwL1IxeDdWRnhWRGZoS0ppTkg4UzdvL1hqRDBw?=
 =?utf-8?B?dkhab2l6NFZ2dzJaK2czbW5uTlFjRWtVRDRQQUo5RXJmNGJRK2huazJYZU9n?=
 =?utf-8?B?bnU0MFg1N1JGdEUzUEZ0a2U4OWNwT2taS1d2QzQ2QTB5aU5HZ3drNnBuOWFi?=
 =?utf-8?B?YnNva05LTWg2bUVYVU1NbGZTd1ZVZUNlb1U4NUpWczVMVUdHU0VMenhNRDJ6?=
 =?utf-8?B?bFpSMnZZUzN1RURDWHljKzRkWVd2MndVTEMrY2xrUHlpeW5xY3pSa0gvWUhv?=
 =?utf-8?B?VFpTanNHMXZDaGs0QmVhUFJxTjcxQVBQZ1ZHL1ozU0pxaE9Ub3B0L0c3RXFY?=
 =?utf-8?B?QTFxZnF6NUZ6UlpUVDdqc2d1dFI1TmFybU5YTytTclJ4Nk9wY1NRUFVENlJQ?=
 =?utf-8?B?b2NzS0JwQmtZMUJtZjhYVUxXMkN3aXo2S3pXZjhnd3RtY2JNSEtBbnVnMkdT?=
 =?utf-8?Q?Fd40PE9CbhM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6207.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFBJUytwZkZmTDdWQnNuVkVkQ0NVeCtmMVliL2M1dW1Xc3RjM0xsRk95bVFB?=
 =?utf-8?B?YWNMVVZsaHozb0dYcDNidGJYcTVMYWtCZTN6TFk3R1kxMy9oMGxRS0Yxb2RH?=
 =?utf-8?B?dVd0NjBGQnJseWw0dzZWb0VmT3NFZDFqWHRUUkpzUG1kcVNCTWcxMmlKS1hF?=
 =?utf-8?B?WDZuQ3g0TmRHYkRVNGdKVFNEeDBqaDRWbjRWbERnbzBTR3k0dXpsRE5CU2hi?=
 =?utf-8?B?cUV6Um90VTFnc1IzbDN4czZjcG51MnFtVFl4M2lWWTNwb2wyWnBKb1IvMWJN?=
 =?utf-8?B?c20zdVVITURLTkxvV2xhbmsvRnZ1RUYyQmxIM0RFZWJQV3QrZzhnL2tVUjVK?=
 =?utf-8?B?aml0L0tEaXBTUnNkKzd1V0pKYlRmZDFhM2NXenJIRlZuY1NGampwWXZZRVNC?=
 =?utf-8?B?UCtqSjJsOWV2RlFmMGQyWkpSbnVlRCs2bSt0amNnSjErUHBFWEplK2xoSVIx?=
 =?utf-8?B?QjBZczZ4Mk9jQWx5WmZuYWZaWW9pYnFmTnBkVFZNSm4zUFVDbVFVeTlmZzZk?=
 =?utf-8?B?NGt3OE1BQkxVbEJweGFqc0xKVGFYTWkvbThsK3VZL2k1TTVsZlV4UzNiTmg1?=
 =?utf-8?B?SXlmeEMyUEZZbXl0VEYvTTZqTkRERGRCZjE3bXZHWFUwUVZmNzZtVkxGTWFQ?=
 =?utf-8?B?SFZwN3FrUHllUUVmbXJJdUMwcHN6UkVLamMvRWIxRHdiOXBVQ3Biemk2Q1Ba?=
 =?utf-8?B?SmhJK0w2cDkzbG44b2htL2EvdmkxdjdBWlptQWZYZVVxQ3RxdkdYdWtNQWFN?=
 =?utf-8?B?OWV6Z01CYXFycmNJQ0VRT21aSmgyVk5iVUFkUXY1SmFvaGhaRVNBZCt2bDVN?=
 =?utf-8?B?bmFid1FRWUtCOFgyMHl3elZFczhZOUlHRDJXTWU3SkRZdGdqWENxZSt2ZzUr?=
 =?utf-8?B?ZWZmbzh1VEZTMWJUbzdjWUl3ZzhqNThUUVZYQVlHM1ZnQXZmS0RFS3dSQTVY?=
 =?utf-8?B?anJPMGdjVDlTSDJWVi9vM3AwS0ppWG5UV296R25WajhOdkp6ZlFXZ2NnazQ0?=
 =?utf-8?B?a0c5OTRmYXRXYWVlOTFSV0pWcUpCSFZWMk5JQktiNjdQQWxoYmZOVmFCMytn?=
 =?utf-8?B?cWxrSGNQeEZkSXNpQlFGSGFXc0V2ZTUwNWZMWlpBYkVXLzMycWdVSnRXcm84?=
 =?utf-8?B?NElMcU50Q2E4Zit3aVI0aVNuUVB5d0VkdmxGZmtZS2FMU3dKUlRhQmxXYlNV?=
 =?utf-8?B?cVlwSGtkWWRBMDJZNXZTSmMzakFFSmhqclZReHk1d2l0VlN2VEd0Tm5CRnBF?=
 =?utf-8?B?Tjh0YjlPcE9Fd3Z0ZkJiZlZybFV3UkIwMnlHejJ6bVN1TlloT1lCdG40UzB4?=
 =?utf-8?B?dDlrWHE0WDBoaDZBKzl5NHI2MlUvRnpobHNjS3pCUGk2QSs2VUtLVEQ3NzB5?=
 =?utf-8?B?YXR3N2grb1hzUURReVFyQUdHSW5XL0hLQnRBNnIweS9GVUQxNGphQzN0SGZk?=
 =?utf-8?B?ZFF6Q0RnVkRscmZwTDluaWFtNFdqS0xCeWRlU3YwcmtPbzl3R0RZMUR4Y0NT?=
 =?utf-8?B?cU1BTkROSEgvZ1pPbDhuR1V4MGZWOVNvVFVON0orNDJxRVZtaDdib241Ymoy?=
 =?utf-8?B?aGI1ay9UcWhtamNlc01qU3NMVGh6UThhR2cydmFIeTBmRVpHdzc1dXh4S1ps?=
 =?utf-8?B?MGZKQk15b0o1RnlwQ2tMMHlVUWZXek45OTRpYlZrMk1oRy80Y2U3ZFVDVTgx?=
 =?utf-8?B?UWpKcUp0NG9xR0YyVTU3YXdlN3l2K0Z0NzZpVWpaUkRrYTNkWjBkaGhMN3Yz?=
 =?utf-8?B?eDZFOHA2L3l4VXdtbUlrM3dFM01QVDBvR3BGQWIxTUdvM1RuTUI0U3BpMnQ1?=
 =?utf-8?B?MHhFSlFsRmRHeUxKMlBMbFAwTVpCOHZJSW9INlpMZTFHR0Y1Q29laXhybUJt?=
 =?utf-8?B?NW5yQ3ZLTmlqWnlLQ1MzU3FVK3NmNklrM3VOYlJQOHBzSmpsblM5dkI5NUh5?=
 =?utf-8?B?ZGYwekJrRmxteDlzcWJjRWJQRzdqRjcwZGc3Z1BCMStUVWFXUVFSRmhJQldU?=
 =?utf-8?B?UUcyZzRxMEhNaEx5dC9kak5zY3o1QXVIODdTV2FRVDMrd1dUY3dkcXBheXNt?=
 =?utf-8?B?ZkNHRTJ1NzFKVGdnRjV2aWQ4eE5Pc3E2TFVCR0xUM3owdFE5dFgxOWVsMGxu?=
 =?utf-8?B?MU9HQWV4cHUwZWlqTEdqYjJxYkhNT1hkRlV4Q2R4dmlxVWVSZmM3VjFuaTFr?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee46db91-9a62-4147-6f25-08dd99db065e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6207.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 09:20:14.4106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvD20n715t5QYXyDlmZ8UvX83vzVFVBG6WsIkPxS1r5d32BymRsDpJGgRgDgGAzRWJOXLGcH6jbgqOn4W1j49w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7305



On 23-05-2025 12:17 am, Dinh Nguyen wrote:
> On 5/22/25 05:33, Mahesh Rao wrote:
>>
>>
>> On 22-05-2025 01:48 am, Dinh Nguyen wrote:
>>> On 5/21/25 03:42, Mahesh Rao wrote:
>>>>
>>>>
>>>> On 19-05-2025 05:28 pm, Dinh Nguyen wrote:
>>>>> On 5/12/25 06:39, Mahesh Rao via B4 Relay wrote:
>>>>>> From: Mahesh Rao <mahesh.rao@altera.com>
>>>>>>
>>>
>>> <snip>
>>>
>>>>>> +
>>>>>> +/**
>>>>>> + * stratix10_svc_async_prepare_response - Prepare the response 
>>>>>> data for an asynchronous transaction.
>>>>>> + * @chan: Pointer to the service channel structure.
>>>>>> + * @handle: Pointer to the asynchronous handler structure.
>>>>>> + * @data: Pointer to the callback data structure.
>>>>>> + *
>>>>>> + * This function prepares the response data for an asynchronous 
>>>>>> transaction. It
>>>>>> + * extracts the response data from the SMC response structure and 
>>>>>> stores it in
>>>>>> + * the callback data structure. The function also logs the 
>>>>>> completion of the
>>>>>> + * asynchronous transaction.
>>>>>> + *
>>>>>> + * Return: 0 on success, -ENOENT if the command is invalid
>>>>>> + */
>>>>>> +static int stratix10_svc_async_prepare_response(struct 
>>>>>> stratix10_svc_chan *chan,
>>>>>> +                        struct stratix10_svc_async_handler *handle,
>>>>>> +                        struct stratix10_svc_cb_data *data)
>>>>>> +{
>>>>>> +    struct stratix10_svc_client_msg *p_msg =
>>>>>> +        (struct stratix10_svc_client_msg *)handle->msg;
>>>>>> +    struct stratix10_svc_controller *ctrl = chan->ctrl;
>>>>>> +
>>>>>> +    data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
>>>>>> +
>>>>>> +    switch (p_msg->command) {
>>>>>> +    default:
>>>>>> +        dev_alert(ctrl->dev, "Invalid command\n ,%d", p_msg- 
>>>>>> >command);
>>>>>> +        return -ENOENT;
>>>>>> +    }
>>>>>
>>>>> What is the above code doing?
>>>>
>>>> This function prepares the response  for clients after retriving the 
>>>> response from the Arm Trusted Firmware using the polling call. 
>>>> Currently only the negative scenario is shown for incvalid command, 
>>>> the last patch in series adds command for hwmon for the positive 
>>>> scenario.
>>>>
>>>
>>> Okay, but this is confusing. Please just add this to the last patch 
>>> then.
>>>
>>
>> Shall I combine the last patch for adding hwmon commands here so that 
>> the framework has some command usage?.
>>
> 
> I like the idea of splitting up the patches to be small, but I don't 
> think combining them is the right thing to do either. Each patch should 
> be able to stand on it's own as well. The HWMON commands are fine in 
> their own patch. You don't need to put the switch statements in this 
> patch, because nothing is being done.
> 

ok sure will make the change
