Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2076.outbound.protection.outlook.com [40.107.255.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57F4A28
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743386767; cv=fail; b=SbQiJKQ6Z9cE8Sedjwsa4LaPj+3Es7cL7NRPFz+Xv+W5VD+1IO/MrLf3L17ejMXShfYGTDAcWJEbP27Msh9ViuN82OQI3tFQBAPTCDMlPnWWrLQy95wTVQ13JCmw52ICycJWXoI7WH07gGeevYpdK6oSDO5Js+LiBaZm8DsCbZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743386767; c=relaxed/simple;
	bh=OiW66WsB7uzDstxoOIrMuqxnotk4WL7jZ4m7hJqjTmE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Oku1ReieN+uosXRsqSwqH1v4Q3O6vjgB9X6siMWjIV6VB7xkHpY22cqqGXihNRazsK01jAWAo9VwTjV2GBXNWA6pxWzZfmCBgyUSXLVnBiH40isSfn8rhPNGczZgf10GMo0QfUmrRDHHN0eIXZzzDeBFohu3nYDoy1c47T2+rqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=NcQrbKoM; arc=fail smtp.client-ip=40.107.255.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="NcQrbKoM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIGGoKiv4WWIKyIjWW1dvL8cPlnAxC/6/PRHFo/IJCewEDre1RA9ZoNGRghTJ75aeGoWZ+GcIPqH8RbqVniqVczcSiWRnR0+AWaPRas4LZBTJwRYVKrIKqfO5CIEq1KhrlgvrL+aGQxnyksWXIBOfc8nICsvnH0/JctLzWh5XGXsdnWA9osrLJn2OyoQOEFMMBrrQpLJ+kCaqQD4JDyGnunAV+cBKnqtoYNeRpXjnXfbTJBW2p3HytXTvVDYD52RbEFXB0mPGAQDsWSMgxFOI5W/Ra/F/FjlSUbFpBwLqHaJ3DyVsQPdi+E6QsszsiuGwB48oDhu1Md7lvTLGDkUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lsnrPayu3ygkvW/jhrNctT5KtfmL1QoHc729rOtlP0=;
 b=bmVC/ymVKLfp/83oHF6hQ2DzNOPmqArud2cEdCXruxtaD6jmaCVMajdvJQZCnAhpajqezD2C+MZIhOZxMUYVqOpGF8Nvz6TbtZKuDo8aDt4GGpoFeNXSMDpCYUTahG7orqV1qBGn5Qd84ZO8NcNBLBVFyeY0ahTl6C5ZYZitgMrVr355jV7Vigf4P501EESo3I6cYyHer93Y2GilI5rNMpXm4B9fCaKyudvtDGbFzRY4LfWz+IGThECq0mtnt7bvg2f1/a+/PLpG+DzTtEuINhJqye7IcD9HOdIHsQofm9Zj6OnaXnWUBEilBy8ZmgUNQxtQZ9T0+qEEyS/0fHU+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lsnrPayu3ygkvW/jhrNctT5KtfmL1QoHc729rOtlP0=;
 b=NcQrbKoMoi+S3abKkj+N1Gss1UwDWfyAtZrVdbvWJY7bd6+RQa3ec3/2HSrCwJHtiVIdEK4HggK7Faxk/7O8d7wD0qp1QvqJKWjvyCenRk+Hz9tg/m3LUmZ/fJjJA7SDRBGLZpbUa8e34lu+X5bmF2oGs1sLemrzM/ZIBjc1ptNafjsaICuxF+Cf+K04xIPEdb/DZ7iO6WAFBlB01+VpygRMx3YU9wACK4EUx2Go+8c+Fn0FZiBaEo3pMOb1VfMm9jouqrti6P+INVOYkecgqpUrEmR4TuM+FJMIe9pb3C+TTobe4F88enrGkPxVMj11Bh39kk7fOudK8KvIAtn1zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR06MB6393.apcprd06.prod.outlook.com (2603:1096:820:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 02:05:58 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 02:05:57 +0000
Message-ID: <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com>
Date: Mon, 31 Mar 2025 10:05:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/1] Introduce vmap_file()
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, linux-kernel@vger.kernel.org
References: <20250328211349.845857-1-vishal.moola@gmail.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <20250328211349.845857-1-vishal.moola@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR06MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ec2d51-fa5e-48e8-56ed-08dd6ff89398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDBoV3h1Q1U5bnZuZlV6Mko0dGRsbGxjWmFOT09GMXlrZFpLYUtZd1FITldI?=
 =?utf-8?B?SVk2bzJzalk0UzZzSGNTZ1V4eHhGOWMvbjlibm04ejVwUm5yMlJJaThVR2sy?=
 =?utf-8?B?R3NpZVA1TEd2OW1EVjVUTi93SlJBaWNheGR0QjVMVnNOUDkzVk5NcEhQRy9l?=
 =?utf-8?B?dHFqMWNzN1pXUW92M2dpcDBNc3BqaTVtbUlSaVlFdXBiUVcwMk1LaUIvU20y?=
 =?utf-8?B?Q09ub3NJMWhlNXEvdmJ0dUc5OE1vSjFydy8zbUdWanJ3TlB6Y1hYSnZKNndw?=
 =?utf-8?B?VWFTbXNVR2FJc1VuVTVlWFUzTnhEb1lkcU4xTlQ5TXVRSmdUUEg3UCtjYjdw?=
 =?utf-8?B?QlBRdlk4eDVITXZVcWpucWNJc1VPb3ZENk9RK0tKQUo0OXBoSHRTRkt1YUdy?=
 =?utf-8?B?ZFlmYm41aVNUTmtiQTlPQ0traFZwQk9pN3JadHNKYVVSOTZTWmcrZXFOMjRw?=
 =?utf-8?B?NVVHQkVyenVqT0p0c0w5QlQrcGxOYkFwaHZ2cWp2MUlpQzZXQk1LWGZIU2RJ?=
 =?utf-8?B?YWI5MSsxUzRFZENqa1pHalFRajRwYWpndnhOcXVDczVsWGErVFZjMTZMNkw3?=
 =?utf-8?B?ZHNGNy9FTHhqZTd3bVBtVjdaWXd0bnpra1hQUXJUbG9NK3N5M1pucjZIVFUx?=
 =?utf-8?B?NVgrRUhHVUlpN0EwZ1E5TU5KaGlxQzZVbWlEMm5mMXVsNzd6YWZSaktOUlNn?=
 =?utf-8?B?Zk9YNTRvV0t4QWhwM2FnYkhIQ2wweVpJUk4wWVpHWFN4TUtkT1krWHdrQ0V1?=
 =?utf-8?B?c3U2dVJqYyt2SXowbFZIVzVwMnJtSlVFTVZZdGdYd2tqaWJobElHWnB3REE3?=
 =?utf-8?B?OUIzOU5hRVNYb0g5QXJiRFprUVowcEFFaTV3M0gxY0dTOFBaa0VsNUU3YTJl?=
 =?utf-8?B?MFkxdjdQRUdKYm1lZFdtNjEwbm1uNTh4NUJDakxHa2VudU4rQWJ3b1BhTjJz?=
 =?utf-8?B?MVRwcmU1RWRSMTk5S0tvQ2JuTGJMdUlzSnRyck5wZlIrLzQ1eUw5bVozWEEy?=
 =?utf-8?B?ZTYxZlkwcDliNnhVbmVKTys3d1R6OExaOWxOSDNiYjNoUXpOWDlZck1EVWpX?=
 =?utf-8?B?WStUb1RjNDAybnh2MDMxNzR1QzlLSU1MTis0eG96bjg3OUJVbXdDcEVqUWlq?=
 =?utf-8?B?ODlOMVZncWRwQlN3RU5Fdm5vYkRmT0hoYnVIN0dtbkZQN0VwMEs2aUVkNlpw?=
 =?utf-8?B?RjBNSk1LbmFyZDdGTEg1TUlzRjNWSlBnWTdvQmxnZXBjZ3duNGFuWUgwaDUx?=
 =?utf-8?B?SUYwK2pCdldzdlQzQWhGR3ZQbEVzWUdCM2VZNVNnNDN0K2NVVHFiMG14dnZ1?=
 =?utf-8?B?b3J0U2JCNTdoUERjZzVmandTdTJYVm55Undjckl5aytwSml1TVIyUEVJdUVx?=
 =?utf-8?B?YlRvK1V4N2EwdmJDTnZqTi9TQitlME9Uc0VCSnZoZVU4eGdOYlMrTEJYaTV0?=
 =?utf-8?B?MFE1VTc3UFhEYXpvQWtOZmhEQ2VRVXJYWlMyaEh6K0VjMUt3czArSDVFdlFx?=
 =?utf-8?B?ZjlCUUZZcGN1a3ZPbVZQbE9GYWRtZ0xkREJ3TGt4VFhnWjVLZXluRmFhb2pa?=
 =?utf-8?B?REZnNXhRaVd0ek0rS1ZyMjc5djREa3R4allsMEZGWStac1FIR25NUEQ3RnZw?=
 =?utf-8?B?eTlNRTJWS1hnaTNxVXZRdU5YNVAxKzhscmFQOHFxZFVEUXF6b0R1bEU0WkZn?=
 =?utf-8?B?Um80MFJ0TUJpRGJqZnUyQUVucmZ5RUJ5RE9GZnJZNk92eEpLUUpBR2V5a1pC?=
 =?utf-8?B?dHdmbkpLbkxYb0wwd2VKV3BlNU5ZY0lTVHlnclNmMnRlbjJnSGo1RGpNVlJS?=
 =?utf-8?B?MVloNUh6b29QZzNWRVNHeHZNWldINWFuVnoycTFYMkg5ZS9LYk5OaCtqbnlY?=
 =?utf-8?B?eWRjTEs2U3k4N2Z2ejdzVGhBWmtjYUNFZnJ4bnFmMk1xRVFRNjlzQlhZeito?=
 =?utf-8?Q?RzakST6BAdOwzHhMc/6Ze9I4s2WqtGhN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTd2NnNIemYxRHAzTlFEVFh6bFNDeTltQkxTUFE5NndVNVRrY0NEbU5mS0hs?=
 =?utf-8?B?MUdMaFlTUTFFU2NESER3Q09TUGpGRnBUcmVBKzVrODlSTzZmQmVSWnduQUt3?=
 =?utf-8?B?TndOYkl0aEliOTMxOFNkaVB2QUpDTnVCOU5wbFliOGFxT0FjMyt6Z2tSZnlh?=
 =?utf-8?B?WlVybU5SM21uQjVsSXF6OU1ldXNmZlV3Z0xlR3g4REJIQW1LTmxuMjBnUy80?=
 =?utf-8?B?WjRPMjdDRXJjd3ZjOTdEaEk4R2U3L0o4QkRlOW9VREwxcTBxU1UvbXBQOTI5?=
 =?utf-8?B?TVFKTkVJdXVyUkZLQmFwMmNYaFQybjI0QXQyOExnWHFMMWI0VmVDeHhjaFV2?=
 =?utf-8?B?bjhRdWNVWEd5UUw5WXh6dTdnTkdyY2JHc1dLcnpiS3NHdWFTSmVrNUJlSU50?=
 =?utf-8?B?cUkyZEhqTWc2eEpobjVxMy9OMndXZUJzKzhnM0phanZ5NkxZdFhXZkNJVW9V?=
 =?utf-8?B?S2c1K2VFYzFWQmlwa202N2F6eUVKWmJUaDY4UFIra3g5Tm1YMFI5YlNhc2lo?=
 =?utf-8?B?cEpGdi9pZEc3Z1FBMk9GNUZCWjBFeFh2ZWRBRkVvNm01U1BueTJpVzJSbFE3?=
 =?utf-8?B?L0lSdFVVNWNmZnRqME8wYkQ4VFRta3dXaFRva1NvN0Q1aTFxZmFYdk9DR0Z6?=
 =?utf-8?B?ekdtdmdmeDE5UDBqc3d3Q0pmTVFGc2JxQjRwaFNYdlhqTzVSRU5IN25qQ0Ra?=
 =?utf-8?B?Y0J3NTdDTVA0NEcyQVBpQzNQTHY3NTZBTWdMbytIdk5ua0p3L3MxRUJXWmdJ?=
 =?utf-8?B?NHVLUUpDTlZKQ3V3Nyt3WWNTaXdaMVAvK2wvaGVLWkVxSllqcC96V255R1dD?=
 =?utf-8?B?VHVsMXBocWMwT2E2Y1RVN0wxWWh4V0EydkhxMW5ndVY5MklXdUxmeG1jKytq?=
 =?utf-8?B?cEo5ZGNTMFlBVmVVb2M1L3FpT1BkMUUrWS9QcC9TZWlTa0Z2dU5uUURidTZu?=
 =?utf-8?B?dWtCWHl0cTcyYUZReTBzVS96V09iYXdlSHFXYUh3OE4rd1FHbGw2dEswNlpJ?=
 =?utf-8?B?aEVrT25iRUdlc2lIZmw5ZW13a0JHeGNwTUU2WE1zNDJUa2M5WkxaTEE4cFV3?=
 =?utf-8?B?dDdWMko4QXpkV3BTMkFRNWVZVG52YTJaR05KRDJhRUs5aXpoQThBTElWa2o5?=
 =?utf-8?B?S29peGpxL2I0RjEwUm5oeGdPMWZybHJQMlhLUDBxbVNObUZvQ3RENldpN1F0?=
 =?utf-8?B?V1dBSktuQmk3SkpwQ3RxYXNTVkJHS1VIOXpvRThOczZaSXFISGFTK21lUkMx?=
 =?utf-8?B?d0FDTGJpcUY0Nk5Hbmw0Y0locU5GK2VHcHBWZDg2YUlvZEhKOU45VHloMysv?=
 =?utf-8?B?R3FMRVBZM2llVWREUzIvQ0dGYmdYUDlaYjhKNk9YQUZnOEU1bWJGOGxPRzBp?=
 =?utf-8?B?bG5Rb3Jwc0lPL3ZCOUNkR2N6bHVySWJnM2lnb0tWZ2M1TWFCS0FRSlZWdzhE?=
 =?utf-8?B?aDRUTkdYOUZMSnZTQWpKMmd1T3IwY1dEcTAyVWFYaGhVbklSY3l2TVllb2F1?=
 =?utf-8?B?Zk1rK3R5empwVFFlK3hMZ3owNE1xcmZrY1lsWlFkRTUraE9RSUxyOWZDeG1Y?=
 =?utf-8?B?eHlhdEkvNDhWNW56L1RBTWw4UlA4cUFuMkc0TCthN3QyVzlZalRydkQ4dk83?=
 =?utf-8?B?NE1WZnhqTlVtTXpmNDV1SEQreG16KzJ0bGZwRmEvM1cvVVFSdlZTUjNHTE5m?=
 =?utf-8?B?UUtYeTAyYm0yRUJGYnhsdHZDYmFVYU1nYllNNjREaWZMTjM4TlBrVmVDY2pL?=
 =?utf-8?B?M0FnVXR4eDhWdjdUNC9NYkJVbzhKTjZvbHJaSlVrYXNYRVpoM01EMFA3VTdE?=
 =?utf-8?B?WFU1eXRGbWIySkdSeWRWbFI2TFN5WllvV0p4cEVCaU5oYUdSOTg1bjJsN1cy?=
 =?utf-8?B?VkNMSEVmNGEzYlpJS0NyRzJpT2RzMEtydDNUOVpPNmZ3QkNCRTdobHZZazlL?=
 =?utf-8?B?djhqOHhvS3RMN0U5aU8ySXZLTGU3UHFjRlBGeWxZb2krVmN2b0FoOVFpQmo5?=
 =?utf-8?B?L2JtZTY1RlRFTFppdEl0aU5YaUhiSUJYZGFpRmtPdkg2UEk2OEhTVndjalFC?=
 =?utf-8?B?eU1xdjZ1cE1JbGJkOCtHNnhGRFJETEVLUmZRT0lURTdBZElZb2o4YUREc1hG?=
 =?utf-8?Q?cnltS8nxN5ZZqSkhp4tNO3J/B?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ec2d51-fa5e-48e8-56ed-08dd6ff89398
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 02:05:57.7670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NgD4rv1MmPzXGsVitebjlYnbk63+BaUkZrj47Hr3wCivcwwyAHa+9dJfuS8POl/Npj5mlI3j9dAZDwwVORrYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6393

HI Vishal,

在 2025/3/29 05:13, Vishal Moola (Oracle) 写道:
> Currently, users have to call vmap() or vmap_pfn() to map pages to
> kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
> without struct page). vmap() handles normal pages.
>
> With large folios, we may want to map ranges that only span
> part of a folio (i.e. mapping half of a 2Mb folio).
> vmap_file() will allow us to do so.

You mention vmap_file can support range folio vmap, but when I look code, I can't figure out

how to use, maybe I missed something? :)

And this API still aim to file vmap, Maybe not suitable for the problem I mentioned in:

https://lore.kernel.org/lkml/20250312061513.1126496-1-link@vivo.com/

Thanks,
Huan Yang

>   
> Create a function, vmap_file(), to map a specified range of a given
> file to kernel virtual space. vmap_file() is an in-kernel equivalent
> to mmap(), and can be useful for filesystems.
>
> ---
> v2:
>    - Reword cover letter to provide a clearer overview of the current
>    vmalloc APIs, and usefulness of vmap_file()
>    - EXPORT_SYMBOL_GPL() instead of EXPORT_SYMBOL()
>    - Provide support to partially map file folios
>    - Demote this to RFC while we look for users
> --
> I don't have a user for this function right now, but it will be
> useful as users start converting to using large folios. I'm just
> putting it out here for anyone that may find a use for it.
>
> This seems like the sensible way to implement it, but I'm open
> to tweaking the functions semantics.
>
> I've Cc-ed a couple people that mentioned they might be interested
> in using it.
>
> Vishal Moola (Oracle) (1):
>    mm/vmalloc: Introduce vmap_file()
>
>   include/linux/vmalloc.h |   2 +
>   mm/vmalloc.c            | 113 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 115 insertions(+)
>
