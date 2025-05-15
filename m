Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDA51E0DFE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320138; cv=fail; b=KQAzxRSUXODOvlH6xpsuWwo0e87+v/MqzbM/c3AVp0gPsTbA+G48nZpKSSGTsO1rHjoa5VKRyR0pEW5kPpM5PxcLkhwqx+imXQseV+w2jJ6HHKNDch5mIX7kthT7YrprCA4C8R9i/gRV8E9TJp5ilRy4DdQ1cP6HxK8U/cxkpzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320138; c=relaxed/simple;
	bh=klXsN093VYRh+89l3FdC2CYFU6zlH4dYxLIyXNEO2mo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=peSEPA0UhpR9xjJhChYnPU3I9HSprc0xvaI723NiVOFDALVMOBXV5rZPW8zoQzmm9yi7tDZIfXCCPnniRU/D5Dp0wyejZwnW00yd7lMXhd0H0vbTHB6/HWV0o1deRx60r8L/42Pt4K9lfqkqEw3xaREIbB9LI9s3v27IoFYlFL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com; spf=pass smtp.mailfrom=kuka.com; dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b=AO3gAuvF; arc=fail smtp.client-ip=40.107.130.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuka.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b="AO3gAuvF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oV+opyvWNUhZ21tAMu/kV0xVll8P3trMDvVxj05YvscezOCys2cueRcyj4AVjGNVQrN6jIdtXqDhlwVKv1Okum/dunBylYLlOjD21bmrZAI7XIzsNDzlCpMgfy9u+zTUG8TrgG1xjmzzZ6bH8mM24u0wjkg/CpRFYniRfg1trBcBTtQ0ntvTSwxUcPEbHVw3vJnfMQbrfwA4R95oqEhU87KAV93b3dk7wso1bfPYNf8fFG3gzBaiC1PySyo9nmpM7+kP9M5P1TD2njYnY8r6XPBuOyR7USbQCoMPOBhg823xCrwwtN08eZBEwKSMQPcvdXXL5/M5d3f+go1KEuC8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ax5CUbSsMlaYCgUX7w/x6n/ZaY9+J9wlT17WIg7xruQ=;
 b=Yzc5cZ1D7/3CpjlCOf8xMMiTs+DFQG3bF1X6JO8O0kS5do7CDslxmvTVFd4Y+lPAZWKOm/btjLHZ3HmD6/+klqeD4WeW6dK0JeJFY9yWyMwJ7ldMlTq7uHJyA7qqnLmth+Ab9Q8vUScenaOw/EwwTN9qEzTDQGvKfs7f6ld7LfiuSnB7qR077BSWBNXHRqTybhcEMm4SDFKV8uoHgKe01bUfwxDjNeAh+1lMpd2O2XgPRoXDdeskXHI/+0aha5uk95uxjKe2/QuCGei4qwbjO2eojQX+h5j37noNNJv6x5i4v3O3qbZC6gsUf0cz+f9QIFjrfq3EtP2ifGHVO1nefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kuka.com; dmarc=pass action=none header.from=kuka.com;
 dkim=pass header.d=kuka.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuka.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ax5CUbSsMlaYCgUX7w/x6n/ZaY9+J9wlT17WIg7xruQ=;
 b=AO3gAuvFWYSwu9yzYl5tHcPfZf5HtafhMyZSiICAr4PqJ1e3JEUx9R7C84mrk7h47WBclNRmNIMYCvOfippmXxbeV/sOROL4I4/OFwFKYcSPgjMe5KCBLL6LDQjroDcLh/M5Er07T9C3QEdxrAQslx8eMSQata6TIHdGejcycvJRjOF9iiHc7YRRmVfrQOn0pBgFagzXl2gvqlybWY4uAfUZ0XESQJs2Nh5SjFhi6kLOkBrTZSmG9Nk8JPWTZA2ut8lqsHXP2I9R105iLy7Ao1IvU5iVTJ9evYsmFQMb08AwP3VelMTfinUNz2EV2JSHPCANu9EN04k09Wfg0kLjlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kuka.com;
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12) by PA4PR01MB7453.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:d6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 14:42:13 +0000
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba]) by VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 14:42:13 +0000
Message-ID: <5bfcc692-3e71-4f3e-ad39-7ea77383f377@kuka.com>
Date: Thu, 15 May 2025 16:42:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: James Houghton <jthoughton@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, yang@os.amperecomputing.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <CADrL8HVja-8J1vcW0RLbsJVaLQENwo_LJ2mTj10uHeV06STxMQ@mail.gmail.com>
 <2044a883-d80d-4673-971d-d46f47532680@kuka.com>
 <59165861-b6b5-4b10-8b04-f33c51a2debe@lucifer.local>
Content-Language: en-US
From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
In-Reply-To: <59165861-b6b5-4b10-8b04-f33c51a2debe@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR01MB5696:EE_|PA4PR01MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: a295b6fa-fbfc-4336-6cab-08dd93beae4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnpwWmNYSkRSRmdwTkRIWTBiaXN2YXZRYzM3TkZ5YVNwNHlIOEZVdml1dXI2?=
 =?utf-8?B?WWRGTDBGOFRXa0QzUmhrNlUzaFZsMTlFNkpqbnB4VFRNSHMvbEhWVWxNaG1F?=
 =?utf-8?B?SHVKbDlRbUxlZ1BaUDlwcXdNWHpUdThXbnpSNVhKRG1PU1V6cFJ1R2s3NklC?=
 =?utf-8?B?WWtSN1RzWnRNRytGejB1djZBanlQaEJIbFNBOGxLcUNMZDhNMTUwckxqZnZw?=
 =?utf-8?B?bmZ4SGNGK3ZrNDQ3N2xuM1NZai9ORGR3UDQ4MnYzNWQ2NHZ5UnltTjRqcVBw?=
 =?utf-8?B?a0poQlVrK1M1QVQ0L0ZhbVlCcGhQNjdla0FyeDBkNGNHK2x2b2tNNGZkWm5B?=
 =?utf-8?B?ejdoeCtyOExJenZzZUc1M0Q5aWQ4V1dXSHViZVV0Wms3Vm9NblptdDNudzFZ?=
 =?utf-8?B?STB1cXNDcHc4QWsyZVArY0x3czZyVmRLQWtjOStjQ25FRlA2S0JvNVIzY3Ix?=
 =?utf-8?B?S0hUbVZha2E2UkhoVG90NHlZSWFhSDBONFBPWGdmQXJtYTVxNHdQMXlVc3Ny?=
 =?utf-8?B?Y25maUZUUXVvbzREMDdmaE5nNXZOMi83V09lcmtjQms4R2JvOGZ2cGpWdThQ?=
 =?utf-8?B?dGhYd1Nua21JdTlOVWRpd1JibzZYbnJUckk4dDJDUkdIaEJIRXBlcGI2WnVL?=
 =?utf-8?B?NVdLdWdadSt6TTJWWVRiRVZ0RkNPZERoMFhCc1YxaVlTb1RRV3V5bmJSeXRm?=
 =?utf-8?B?cEwyVlAzUjVpaTdwQUdEenNQYS9BTWdqeGFqWm5sM3BrSVdQa090SjFDaW45?=
 =?utf-8?B?QWZ5Y2l5VTFLS01SbDd3anpaSnpQUEZkZUVLSGhiYllzaGxJeVdaNHMxZXNX?=
 =?utf-8?B?bDZ1c2hjaUlvaE1EOWpKbk5UQmZYNnZlcnFzQXo2MjRoRVRWc1dKRVZrbXBv?=
 =?utf-8?B?aEorbmhSdUtKZWhjOUJrK05zQm5sVzNabCs0enJyU1N5K0Juclc0MnRka0Rk?=
 =?utf-8?B?V0doazNYTC96d2c1cFcyM3d2cmhpRFZlaFpXOFZtd3JtbWxua0tsZmhFa2xh?=
 =?utf-8?B?Y3lwYjZaeFJjVXhaQ0hObVpQaFlQZ2lKZmMxTWxhb24xajh4TEhMWHVoczRX?=
 =?utf-8?B?ejZaTzhkNXl3OTdRaDVNdno0ZnU0OWF3T1VieG9SeGNaU2tRU3VCc01MUzZz?=
 =?utf-8?B?OFQ2dXhHNlNYN1Fxc2g1dkZiTEpJQkNxMVFJekVBb1pzWUV5L2g1dldPeWZS?=
 =?utf-8?B?QVNmRmt1cHBwcHNjSVJhMWZUT1J0bXZ4Um1FT1NSU3ZaQ0RWVmthU3h2SnM1?=
 =?utf-8?B?bzk5bk1TaG9WSFhTTlUzdC9LTDR1UVVpQmtUUXFXbEVCZGZsM3QxcWhVWFlx?=
 =?utf-8?B?czZ0OW4wNU9Pa3ladVplYkFtQmtLQkpYbURmSHpDaUlhMlYwR3JVWGJ6ZlV6?=
 =?utf-8?B?YmFDWWRtUC9SbkFxejE3SVBwb1NuQ210ejJyUWx4d3JCZUwxbWdNVkxCRzVt?=
 =?utf-8?B?TlF1WTUvT0NGb0pMdlY4QnZ5WmlhUW93azBoVUZoeGZsTjU3cE9GS3RlTEJP?=
 =?utf-8?B?Uld4TG5VV0FQT1hZQ3crbGxHOUZ3bThMUmtqc1RaTFcvejhxSVlZVC9uRUNo?=
 =?utf-8?B?VEdHNmpZZUtoTUJPVlU1cm5MUVJ5by9uUE4vTndZYXluTlJSdkEvT1E5aGZI?=
 =?utf-8?B?Tk5LeFc0L0JkcG9XZFR0QlVuM1FiQk1oNnpObC9qeENPd0g3eWJmUmhDcnFq?=
 =?utf-8?B?VjlLV3RCU24zWUlXakdtRXJYNk9VbnNrbythQjVFeElnNnpRU2k2Q3hHeHgz?=
 =?utf-8?B?ZW5HelFHNHpzWTZrUk5RTExwZzN5bWgveVNKOGcxMFJheDFaY3ExeTRmVEdw?=
 =?utf-8?B?eGNZT3BYQTF1Qy9yNTJCNUR4TWZ1WXQ5MlNzZ3d2YlNNaVJOMTdoQ0FBdEZj?=
 =?utf-8?B?WnV0WThkNmRLaGwvdzJYUWk3SkhwSGJOdWp1U2NpNUJ4VklwQlRMbERMVmd6?=
 =?utf-8?Q?Bwmy+wXssA4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5696.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVgwdXF0RE1PU3NROExXZE4wK2ZYZVNQbzdlbWQ0ZWFXR3VVKzdBNExGKzVi?=
 =?utf-8?B?aTJKT2ZBRVlMb1crTEsvUVVES0RVY0NZSm9IUXArcGRXWVVVT3hzUVM2RHZa?=
 =?utf-8?B?dWhqa1ltaHFNWkd1blJQTm5Pa2NqdFBacVlaZFRuTmxaQXVBYmQzaU5hRE5w?=
 =?utf-8?B?YTVnRWo0WHNuOUhvUXdaZnJFeENNMGZweXpvMlhqaDhiWjYzTUtoazNOS1hY?=
 =?utf-8?B?U0tlUGJ5RXJpeDdtMWZvMlNINlhIcDJmSW10cEVGa2ErOVltbUw3OHFNRUdq?=
 =?utf-8?B?R0t6SU52a3ZVTWF4cXl4U2hhUVFBcjRLaEYzTi9aLytKSE8rQTQ0bHB2Sjds?=
 =?utf-8?B?bWU2VmdYcjNLbWVNNXNuTHpldGZwaDBkc2MxUno3MzM0cW41ZHBFWUZOelJy?=
 =?utf-8?B?cjJqZjA4SlBVUkxUaVJyT2dNeDErdndPb1doMXhvNVd5eitCMlhyY1AwVHpV?=
 =?utf-8?B?ZzVaQzErcFNSRk5sVUd5MlVoMmxUWmhiKzJFbVVlL3B4SFV1T2VHLzJwb2VL?=
 =?utf-8?B?SzBnSjVWNjBoTmpsYnc0ZXUyOHBQODJ3cVF4VGFOR0R0Mm4zbHFjekszSVRw?=
 =?utf-8?B?czNabUdMY0NGSWR6aXBjZElKdXZNOTNOcGtONFR4M2dQSEJTT2lKektmd1F4?=
 =?utf-8?B?OEY0eENac1QycGFOU1dxb3l0REpjUkYyNnZhaXp4b2RIYjhNMmtGUnBoMGlq?=
 =?utf-8?B?eVNYMEptdkNrTURFYlJ2dFFvQXBkbk1oTVBOR25RZkVhNTlvcTZ3SDZVcGdi?=
 =?utf-8?B?QjhlNFRJQmJZUEZMUjVsMEozbUtQS3pGWE5Vb1d1TmJSYVV1aEd3bHlGSGFh?=
 =?utf-8?B?UkNEVFJlYW9nL2wvTFE0NnVmNlZ3eTJiOTc0UFJzOGpzZ0xXMlV1aEV4WWVG?=
 =?utf-8?B?WFdJZEF6YXpQUnVKcU4xMGdTdUpUbFlxWHZ1dENhQS80cVN0YXY2d3pJNzY5?=
 =?utf-8?B?cExXcjlrSFpiM3UyeklIUkhGM1NVR20wajV0K000dGIza0gwR2lDbDB2akVT?=
 =?utf-8?B?SjdSS0txVnkveDFjVGl4aVh5UXNwTXFjT0dBZ25SRFZELzFYTVFEbmhnQjJO?=
 =?utf-8?B?SC9Zd1ZXVjVCMG5qdHF5L2d3NjRhZGN2aklHNVV2dDRGd3BDZFI3T3poRi9E?=
 =?utf-8?B?NWtYWllGQitjT0pTUTV6dXBSTCt2Q3JWNlBIc0o4a000R2xZWm9hajhOb1JH?=
 =?utf-8?B?dFc0azRnOFpNbzhlaTM0eGh5VmZDbUpBMTBQTnZFcDl6VHRYbG8yZ09OSmtG?=
 =?utf-8?B?djc4N1cyVDNocUo0NTF5NTBNL2NHSTkyL2lUTlg1Yi9YeHN5Umk3L2JTSG1w?=
 =?utf-8?B?elN6aGJOOHVScmVrNVViMlZ5TmhZMUVibE1JVy9qWG1reXQ0dUQ2LzFLTW5X?=
 =?utf-8?B?aGJIT2dFQXQyY3lTenJlbmRLbzAxOFJINkNFMjVvSnlsNlVxVmhtYkVYTFZG?=
 =?utf-8?B?U0lTVzcvVGxIMXRsOUZSUE9qR3NwTkhwUHBMclRkMDZVUHZKNTN5ci84VHhR?=
 =?utf-8?B?ZHlKWXdZdkREamxpcDNHQ3pNSXlwOXFET21IU0R4aUhESExteXU0b0EwZVVl?=
 =?utf-8?B?Y1YxT3krUGNVSWU0SnVDY09EdEorcjhDb1lQanExUDI1Zld1Smh1L2ZVVzdq?=
 =?utf-8?B?c3hlTlRMZUZ5cjNlNDNpMWpoazQyaUtkYUdyM0RFd2F5QittK25TemlrUjda?=
 =?utf-8?B?ZC9TU1J6WTVRY0dLUE91Z3lsdVZQV0JmekY3UFMzSVl6QUJpRDYyckVwK3Fa?=
 =?utf-8?B?SUsxbkpta044ckZsanBQdk5QdVpTVEsreGxiTjFOMzlrdUZIaWZabVZOalNz?=
 =?utf-8?B?M01CbndyZzRSSU9qN1M2aGJrWjJDTzkvYTJjSEdtaWMvVWU4Q29BTEhyU0ZZ?=
 =?utf-8?B?Y0pzRG9janpmdnhEdUpEekRnZndFL1Erbk5aRXl0bEFaQytvNDh0Z2FQRUlW?=
 =?utf-8?B?ajdOam1OMTd1d0JFT1Z5TjFjT3NiNkt1ZVJUbXRaaXNEQ05yQ1lkazRzVno3?=
 =?utf-8?B?MGM5elBCUUU3QU1JWE4zWjNIUDRTajNyYzN6Q0JhZmU0dTVYbWJGd1h3SVdv?=
 =?utf-8?B?TUVvVjh3VjhoRzFuNkpRSmd1RCtZeXhpMFJybkFEUU9YeFFCay9tVVRGVmN3?=
 =?utf-8?B?Y3FETkljK1VVTHRmTGZTVWVEZTErWmYvYnYxeWJCcDFpOGtYSHVqQ3BPSGhi?=
 =?utf-8?Q?22pExccuSJuBiM9pNExlBqE=3D?=
X-OriginatorOrg: kuka.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a295b6fa-fbfc-4336-6cab-08dd93beae4c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5696.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 14:42:13.5303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5a5c4bcf-d285-44af-8f19-ca72d454f6f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2+iMafwc8MYENhV+3D6cAx0Vu6+e0WGSZi7b97gBorJxTUmkH9mrYZwaPRHL+zfoEVe8uZ2OYanGXf6bAmLf+9/aHG770Hlrw/xJzIQYp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB7453

On 5/15/2025 3:03 PM, Lorenzo Stoakes wrote:
> Hi Igancio,
> 
> I can package this up in a series with the fix below and with the
> appropriate tags (signed-off by you) to enforce the correct ordering
> between the s390 patch and this one if that works for you?
> 
> Let me know if my sending this revised patch in series with these changes
> and your signed-off works for you?

Hi Lorenzo,

Yes, that's fine :) Thanks!

> Cheers, Lorenzo
> 
> On Thu, May 15, 2025 at 09:03:19AM +0200, Ignacio Moreno Gonzalez wrote:
>> On 5/14/2025 10:15 PM, James Houghton wrote:
>>> On Thu, May 8, 2025 at 3:20 AM Ignacio Moreno Gonzalez via B4 Relay
>>> <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org> wrote:
>>>>
>>>> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>>>>
>>>> VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
>>>> it makes no sense to return an error when calling madvise() with
>>>> MADV_NOHUGEPAGE in that case.
>>>>
>>>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>>>> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>>>> ---
>>>> https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com
>>>>
>>>> Here it is presented as a separate thread to avoid mixing stable and
>>>> non-stable patches.
>>>>
>>>> This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
>>>> kernels to return 0 instead of -EINVAL.
>>>> ---
>>>>  include/linux/huge_mm.h | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>> index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b07247707d16cc67 100644
>>>> --- a/include/linux/huge_mm.h
>>>> +++ b/include/linux/huge_mm.h
>>>> @@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>>>>
>>>>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>>>>
>>>> +#include <uapi/asm/mman.h>
>>>> +
>>>>  static inline bool folio_test_pmd_mappable(struct folio *folio)
>>>>  {
>>>>         return false;
>>>> @@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>>>>  static inline int hugepage_madvise(struct vm_area_struct *vma,
>>>>                                    unsigned long *vm_flags, int advice)
>>>>  {
>>>> +       /* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEPAGE is not supported */
>>>
>>> Do you mean "but MADV_HUGEPAGE is not supported"? Just want to make
>>> sure; it seems like no one else has asked about this yet.
>>>
>>
>> Yes, this is a typo. It should be MADV_HUGEPAGE. Thanks!
>>
>>>> +       if (advice == MADV_NOHUGEPAGE)
>>>> +               return 0;
>>>>         return -EINVAL;
>>>>  }
>>>
>>
> 

