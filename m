Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2121.outbound.protection.outlook.com [40.107.223.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098CB647
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748548335; cv=fail; b=rEr2DbWnKbjmr1GC8goOGAlAWI1gA2QjmQKqQmGqQCUCzV9iG6y6d3hlJC8kMg73q+OJ35Duc9NIJ7vcTe/jAeeey3qDKcLreCXCBy9wK7DuA7EInEp1jokG46VlR32J1MuXRWYAPnZ4igM/nnKYN0ln8ThhfHKYhhqm1w5oPjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748548335; c=relaxed/simple;
	bh=twn/eKjpJ9bjB3V/AjsMV4eR6AB/efQQsFHq1G3gruk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kru94rRLhFIK4XkE7P73qmKP65XB86bX9T3MIAu6lLRBgLSPRFz9B9UEpNCckTQH1JiXs8FmmXFP5ES4BA0psg4NlDmIw05dUsziPIgX/1XCiB+xxJZkq9KSLjRYYqjsUSzwDBqWGB51LgpcNbH10qmTfgzNpvBZPxXOtdGcYe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=KN2IcHEJ; arc=fail smtp.client-ip=40.107.223.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="KN2IcHEJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6cXgixYuXyZqbGu7xARwZQr8A0dKZtaIufLawEF9oQatQD0pSQudRX/RGLs5eZYDg4ClBB/JTNZ5Z3L9NUdIT1rBlABYYr5GPL/ADIoWkE6yK+Da7G2ijZQcN/neAxa0rGUbdZxCj2CRx0zsisauCUzWHwQgy4DP6S74k3zPkTzz0Uch1YpbWJ3HvkQVyAcuKeDHlpv2rGBUKAf1FOzE431ejqnDhqtQ/KT9qXY0iFNWdgeHMrjHb58GUNfGHpH/GlpZbNA4fzQqU7UPzKlVxkiQSPN4xKJjwg1OofMsYW3sqLMRZ4NWSc1bh0YfzE/j3RPrx/h2BgWDCT1YVic+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/0u2vcIpA86p9roF8eOtQKMwnO7/KT7ia9ELsZzBrA=;
 b=bjjy2z03EY6iYSeGotuJDNdS+l8i2ZEO8jPReYVhMqQmOP0ni7tjPg2R299QNBSrvgSkTzx+Ko62MJH/sK3TVIUZfSGBu0SmuSOhP+Gxvq38Fs/Jleei+8eHJ12d3QGpTXAruz0auIPMAa/9n8rfLv/HDy9aatpnLBo44eun//DBJ78OAlhpYrV9hIQV49gz99QY47eJHmEd8tO29grIJBkqB7KiH1q4ij55mS0FdrZxpMSJdR3nlFOyeGdu9BZ/YC6WUB53Abnyc+qZIUikWuRTbeGqhQwJxN/l2uC8mRZaN0Fs75BzSgJ6VgDCSZK/9ZrpJFRlc7IT02RzDznVhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/0u2vcIpA86p9roF8eOtQKMwnO7/KT7ia9ELsZzBrA=;
 b=KN2IcHEJ5gTKYqErcI+48zdSxjClOU9o391NKBizm+Ef7nPKN9upLCIbdtNDrDSJjlQiE9gaDM1mpy8EN/IS/5XH3Dr+3ouUVy+krTvxDYEtER/d4d6IJXUhTNeeyaDWXJ8bxfWbsmIY2RXgqlKk14lGC80Py9OYIj7hlaqISck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DM8PR01MB6838.prod.exchangelabs.com (2603:10b6:8:23::11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Thu, 29 May 2025 19:52:10 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 19:52:10 +0000
Message-ID: <c2625558-a63e-4a63-a893-d2a31b3cc559@os.amperecomputing.com>
Date: Thu, 29 May 2025 12:52:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
 <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
 <e8d74579-2e32-424f-bfed-5d3eb33b0a07@os.amperecomputing.com>
 <c44cb356-112d-4dd8-854b-82212ee4815f@arm.com>
 <936cc91a-b345-4e52-9cb5-922c9810c469@arm.com>
 <a1ff2646-f429-4626-8541-19c7f301fc23@os.amperecomputing.com>
 <d1226612-7ad8-4405-93a7-28148699ce45@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <d1226612-7ad8-4405-93a7-28148699ce45@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:610:e4::10) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DM8PR01MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c3b4c2-72eb-4768-4ec4-08dd9eea4cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1ZsUmFXN1JHNWZZNzlZYWxkbEY1Z2VGZVZrcDdOcGhLc3pmWjJPTUJRNHBB?=
 =?utf-8?B?U1pkaUYvUWpYekFBaGIyQUZnSjJ4dkduU1JUUkhncTU3OUtKTDRnRGtKTUVJ?=
 =?utf-8?B?ME5MMHgvemd6Vm5MSTNxbnVoWFZOVFI5Mkd3bGFrdDNOaGhaOGVGQnZFNWZS?=
 =?utf-8?B?QWYzK3ZXcWppNjM3VXdxamQ4am94cHNzTms1N0tHaG8wMkJleHlCYjkvdFB6?=
 =?utf-8?B?TUpZWFhQZHprQTRjcWRoQmpUbjVEaTBZNGsrQjNERlNVczBqak5EMGRidFZH?=
 =?utf-8?B?VisyNkJGNHNENlU3MVN4a2x2amdIckN0SDNTSVBia3EydytGMHF2TWdaV1dp?=
 =?utf-8?B?V3dBeVBidUVaUEpobjFzWlNYeEtvbHZNZys5MGNnVFlQcnFTUXBuOFBlV1h3?=
 =?utf-8?B?UE54VHZHR3ExTjIyd1ZnM1lsRCtTTkZ1R0FFL3JpdmJMLyt3Y2NIOGVabDRk?=
 =?utf-8?B?c2RTMnNiT294Rjg2ZEJMK2NaOEdpanQzMmxzelNpbVVoMDlqaVQ5dTFka0Rh?=
 =?utf-8?B?U1Judi9raTdjcW5NUzFjM0RyRVVTSllsZ3Q0WThnbGtVa2ZFZ0VhZHh3VmNl?=
 =?utf-8?B?SVFSNERnMkUxR3k3OVlINTBzQjRmOENmZlMrVjJ4OVBXOUgzTTN5MjFzbTdp?=
 =?utf-8?B?TFpTeTdDWE42SGN0clRzSGltK2R2WURLVnFOODhLR0RRckhXRVhUVjFPREow?=
 =?utf-8?B?dXRmYXRROGF6bS83RXZwek16bURnb0M2Q2ExL2hIbEk0VnZHM0JVWjN1YWE4?=
 =?utf-8?B?b09BYU50c1NyNEpNZUt2cXFDeDJ6R1lIQlU3MUhzMzk4QzR4YUk1L1NLQTln?=
 =?utf-8?B?eGN6cGtSeFQ5WXBkajJoSHBzd1Q5ak1ST3hDeks0M1BUZVlVL0tCaVhuZWov?=
 =?utf-8?B?M0ZvZ0dMc1U3ZXFTLzM0VjlHa01Mck9WOEEyOVA3Z2F0dGhneUdzRDloRTlD?=
 =?utf-8?B?Ulk2TU5rQ3dIOHVHUFA2cEJqKzZDY2xFZit5V2d3aGl6Z1llZWM1MVMvTjRM?=
 =?utf-8?B?ZVVla0dSZFV1Nm1jazRUZC90RkpYTXdXMkdBSXNZYzY4SXdPdDVpZlJ3NTF0?=
 =?utf-8?B?MkRxcXl2VjNEUGJqTWJKRVhUY3pEQ1dLL201QnhYMHI4SmdvYmVTNWZqM2pU?=
 =?utf-8?B?OSsrd2dQZndvbHVlSkpSUU5RUE9nTVpmMVRNSS9TVEtlQVprMnQzV0I5bEg0?=
 =?utf-8?B?M3RWS2xJZUN0YmV6dGd4RVpDeFRVdGIwYmR1WnR3YlJBSHdaS3pjaTJHWlU5?=
 =?utf-8?B?bnYwV0tsRXlrT09VeFZFaHJNNXp0THA0dVpGQTdub0t2clYyOWlsaDk0NE8z?=
 =?utf-8?B?SzNFQlZMUHlsOGNtTDJ1VlBWaGd5M3NUa0xnanRoTE10R2ppWTFGbUxpcml5?=
 =?utf-8?B?bFQwUmZia0gvRzJRNU1OWXpacHBmT2FOZTVGeE5vRDllWVU2STZIRHFINllT?=
 =?utf-8?B?YlVtOXlac2twdk80MkE0TVBTNjlQM0NqS2EzOTJBalBud2QyelovcHFkR092?=
 =?utf-8?B?RFBhWTdtTXJTNnBJTVFDcHJYYXlMYjgzZTIxTS9Jay9QbUpoeGkwU1k1cmVS?=
 =?utf-8?B?VS9mVzJ6ajRUdVFNa2h0YkdMOXcvM3AwbWpKRjdjK3dSK2lSaDBieGRZMjFZ?=
 =?utf-8?B?SEdHR2NhUVJLb2dWNzNDcWhxNitBWkV5RWZRMU9IWDZ6aTBieW9TQVJ3V0pw?=
 =?utf-8?B?WHhKK29aS3VKZ0dBYnQ3M2JzSEhqYnVCUmhhUFk2L00vVzlGYlBoSnY1cUdG?=
 =?utf-8?B?ZTdMUFhlMFA0dTRmTFdVZGJ3dy9rMnhXaG1rd041Qk85NTBxTnFybHNzbmFu?=
 =?utf-8?B?MzlSdGFCa0t5eTNSNldUcDQ3U0FXZ1gxZGplTmhkZGtUUG9CR2RlWXo2ZGlv?=
 =?utf-8?B?d3VFZ1lXeHpFYWNBR0YrYzR2aElPTDJONkVxQldObEdHbGV3bWd1Vm9uWXhv?=
 =?utf-8?Q?YmiPjqmZ5l8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3Qxd1czS1FoYXZKWDZvQ0JDeC92SlFWVjZ1MUNCNForazkwb3g0UkhHcWI4?=
 =?utf-8?B?aEkvWnBlRTdsL1IxcDVBb0dTZFVvWVp0WEJ2MW5GSXh4cDREeFgzRmNpZ3Y2?=
 =?utf-8?B?VW1hR0Rscy9KR2NnQlRMQkh4bS9vSUVmQUZXWHZCQ0xCZWgrOXZKNU8xcGlK?=
 =?utf-8?B?L3BzclRGMlRBUmdjeWw1bHVwRlRtNmthNXYxZnU2MnFoYTI5bEZSanVnZEV6?=
 =?utf-8?B?YW9TZVl4NUtUekZIcTZDQ2F3U05pUnRWMndSWWFMbFZFbFRKUDMyajNrY2d6?=
 =?utf-8?B?TTZQblprNEZUUUhxaDlxdUV1U1RWenlzOWFQbGNLUXg3bUdGVjIzVWs4Q0Fs?=
 =?utf-8?B?c2ZmeWQyNTBWeWEzdzdlVUtNZXJ1dGYzc29sdHlFMy85RkRkTnlSeWVGb3dy?=
 =?utf-8?B?bThPNXhnM2trNHBnclNzbG9kL0VPaWVzVFJ0c001ck94SE1kL3pVTWd4dTZC?=
 =?utf-8?B?L0sxdnFEbWVYL3lINVgzK05OL1JtRWt0SlNZSGw2Qm42YlQzL25VeVpkNW5S?=
 =?utf-8?B?bzdnWU5vR2dWcko1ZnU2Mjk5VlZlSWxINmNvZ1AyejdEb3pwd3R2alBqSXYz?=
 =?utf-8?B?OWJ0U2orT1hFVmszWkZxenE3OFhoclBJcGtoQ1c5Slk1SHRxRVJHa1UvN1Qv?=
 =?utf-8?B?VS9RKzJSeVpINmRkVzg4Wmx3SzM5SjhSTmVSa2wwdTJQUUw1YTNGeWlKQ0lw?=
 =?utf-8?B?Y0xLL3B1dHkvNVlqVGNaTTh2UlpLZmxZa2FZRGxUQitiRVJDdXI3N05XSUVJ?=
 =?utf-8?B?WVh4dTV4dlFodGxpb1luZUc5UTZ1UTVwTVo5QU1xRWc1dmFHb1MwMWgwRnEx?=
 =?utf-8?B?MVB4RUxiR3Z3YTk5UnE2bng1dEhmY1FHZGRoZEVnUG5ZaHg2MDV6VmpDdjVD?=
 =?utf-8?B?SFY0cFZIblVnMDRXbC9tZE5yc1JlUURpdDNhWCtDVzdLY1duLzNkY0YyRlRu?=
 =?utf-8?B?MVREbmlnc3VlbCtkVXlDanRmN2ExMjQrSGVySmNRY2dwOUxKclJaZHJHQUNF?=
 =?utf-8?B?SFEzanVEZnJXTTFDK0Q2SENYQlhUaldIVGtpY3ljQnpRcE5ESnJrMHo1U0R6?=
 =?utf-8?B?MXQ4cWtvQms3Q3p4cm9LQUVDU0RVR3MyNEhNSzF4VDBqTk8raUZ3ZkJqT0k4?=
 =?utf-8?B?cThMQzdaMWJkUFhweDA2cnp5WUFUZE1kT3AvanltdXB5Y050enZqeHBLYjFw?=
 =?utf-8?B?eXRNT0hweUFiSnY0R0h5Y2krVTdYclI2b1AzRGU4ODJEc01yR3pCTDg4QmlX?=
 =?utf-8?B?c0FYSXQ2MVZ2MlRjVUpFWnAyWUJCMlhFSDR1ZVVYb3RaN3I1QkZZTklMMW1i?=
 =?utf-8?B?TlRLemdBd1JMKzFOVXQvVHUya0hZK05JditnR0gvaUMrTkMvUDlWdzA4NWh2?=
 =?utf-8?B?cG90RG8rNmZYckluT1hBeFExQTFaMTF4Y2EyYjZjcnNYRnZ6V3lsYWxHeFVo?=
 =?utf-8?B?RFpFeHlDS0pKMmN5WnNvNjFiTmU1R1B3VnIxVGxZVzF0c0hSdWkwZ2tLMjJJ?=
 =?utf-8?B?Nk1JZXVXL2pRaGJhS3JaR0w0MjByZVAvV1NGQitMWWxBY2FEbHZVeUJGcnlp?=
 =?utf-8?B?Y0xjdVRTQVlmblBMMnptbDhlUERMUEdDakUya3gwNFFvMWRkWGVQMGFQMUFG?=
 =?utf-8?B?YmJvbEpUcVQwa2hBdW9EUUkxanJMK01wMzJIMEtaUForWUtPVXZVSUwzU0E3?=
 =?utf-8?B?bk5LSUJvb2xFKzZOMTk5MWtTVStoVjF1cUhhRzN6NGJ6MjVWYkJCc2pldXA3?=
 =?utf-8?B?SjBKVmVOVWtxdW1EVFRLUkFTaHN4SnBJRmVERko2MWVXak5PT0VJMnYrVWlZ?=
 =?utf-8?B?TDNNeXBDNitvQ3YxS2ZjUDhOVERZWmVEQWN5Zm14ZkdrYjQvUVhYaFVQRFF1?=
 =?utf-8?B?d3VlNVoySDJkQitwcnNUU0JLVDZURzRuaVpRMWl3Y09EWXFEeXowSllBVmcx?=
 =?utf-8?B?c0xXUmtpUlhMU0ZuMHc4alMxSFJSOFhFd2FEVGU2TnMyd2szc1p4ejE0SmpJ?=
 =?utf-8?B?K05mOGk3aVJVU3BFdHNwZi9WbU54NE44Nk9zT1ZEdWdvTkpTZUdVcTJWSHpF?=
 =?utf-8?B?T3NHeUFtS3JvaWZBTDFNcDNFU1VBREdWL2JhMXIwQTJlMEJtZDMyVmRLVy96?=
 =?utf-8?B?K3diM284K1hXWm51S3F1VjRYcGNieGJkaURXbzFPeFpNdmVXWE44azdvZWZZ?=
 =?utf-8?Q?yBohAT2smY5xHa/oKsVcabQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c3b4c2-72eb-4768-4ec4-08dd9eea4cb9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 19:52:10.4779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6484lzyqhI71sDGQ/6IKVBA3ceX4zl/6VLdeKa4YyyKDZzmVsB8AkvoAGfQV4F8rvNojxlNXRn3iyzHxCti30ezN6ujCtMN7RVB24XAIPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB6838

>>> I just had another conversation about this internally, and there is another
>>> concern; we obviously don't want to modify the pgtables while other CPUs that
>>> don't support BBML2 could be accessing them. Even in stop_machine() this may be
>>> possible if the CPU stacks and task structure (for example) are allocated out of
>>> the linear map.
>>>
>>> So we need to be careful to follow the pattern used by kpti; all secondary CPUs
>>> need to switch to the idmap (which is installed in TTBR0) then install the
>>> reserved map in TTBR1, then wait for CPU 0 to repaint the linear map, then have
>>> the secondary CPUs switch TTBR1 back to swapper then switch back out of idmap.
>> So the below code should be ok?
>>
>> cpu_install_idmap()
>> Busy loop to wait for cpu 0 done
>> cpu_uninstall_idmap()
> Once you have installed the idmap, you'll need to call a function by its PA so
> you are actually executing out of the idmap. And you will need to be in assembly
> so you don't need the stack, and you'll need to switch TTBR1 to the reserved
> pgtable, so that the CPU has no access to the swapper pgtable (which CPU 0 is
> able to modify).
>
> You may well be able to reuse __idmap_kpti_secondary in proc.S, or lightly
> refactor it to work for both the existing idmap_kpti_install_ng_mappings case,
> and your case.

I'm wondering whether we really need idmap for repainting. I think 
repainting is different from kpti. We just split linear map which is 
*not* used by kernel itself, the mappings for kernel itself is intact, 
we don't touch it at all. So as long as CPU 0 will not repaint the 
linear map until all other CPUs busy looping in stop_machine fn, then we 
are fine.

We can have two flags to control it. The first one should be a cpu mask, 
all secondary CPUs set its own mask bit to tell CPU 0 it is in stop 
machine fn (ready for repainting). The other flag is used by CPU 0 to 
tell all secondary CPUs repainting is done, please resume. We need have 
the two flags in kernel data section instead of stack.

The code of fn is in kernel text section, the flags are in kernel data 
section. I don't see how come fn (just doing simple busy loop) on 
secondary CPUs need to access linear map while repainting the linear 
map. After repainting the TLB will be flushed before letting secondary 
CPUs resume, so any access to linear map address after that point should 
be safe too.

Does it sound reasonable to you? Did I miss something?

Thanks,
Yang

>
> Thanks,
> Ryan
>
>>> Given CPU 0 supports BBML2, I think it can just update the linear map live,
>>> without needing to do the idmap dance?
>> Yes, I think so too.
>>
>> Thanks,
>> Yang
>>
>>> Thanks,
>>> Ryan
>>>
>>>
>>>> Thanks,
>>>> Ryan
>>>>

