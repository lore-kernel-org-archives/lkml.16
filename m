Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7553F2673BD;
	Thu, 22 May 2025 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910251; cv=fail; b=scvSgjEsmTRlfLiJ+4nEpfR4dXu+MMS9WTXj5bza4mQpSa+huo3yUkme6zfhCg71p7SLfom9hsjaSemLamPfPP6KgE8SlE1MbzaUCaetj7kcjCALd4PM3vPCCmCKfyhC71hd8C5SqT/u1/0dEux1H9xKbftm7aSwbS2n2WmwxFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910251; c=relaxed/simple;
	bh=1jn8EAGQltzOHPqNlAdIWdS8xwzKOZs4HGxJLYRg5lI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ryH25CQyUXs9aOcVg1OIY50FQXR+Va8UihaRFrfbblrNriIUaZny6Q389y0U1EyQ4IcTzgTXOmxbI4+aphqQHcFIiCaQUiOgv5H+utWHontnHwupzRycBwe9R4K4IKxQ1joFoj38ooiXDb4ajpqbYKIceHEnkNO5hg2SiDuBCC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=LQcZVNQ+; arc=fail smtp.client-ip=52.101.62.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="LQcZVNQ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuKYLv+pXtxQObkWudeopEHrFvh3Jqfd/fHWAHbwtPHV8r3ZL1IOn9layIlKK2izcAAoXRB3M4C48mzIa62rS8vNsLRLiiff7BODeNobwgdV8lHz1dNlfPBVeFeCer9DNTCjL+CNj9p2HkXU6MBB+FkWsrNAK6lrMFB69sjcTxzGOzOkbmhSRsKX9gwbbz4keKg+DOfswwbWB/yPspKaM8M90CVRVRuIwu2GlwOoN9bGwvrglShPu4aHI2I6u9aXTf/rvPsEoBJvoRvWumAcKv+2JPMraXd/jjCPwVoMKetuiSbznzK2wLGwGrc/R1WT2+BOJBqWiXwT2d7T3WPWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ey5NE7M1roRV4WlJRaEU0dgjVppFUvvZKSqU6/Oapc=;
 b=hi0qRYQNKh39HwQa5REUOhcfWHAfgEUf7TJC+aJwa6a4AxYSjagWH0INGjmv7iCRFwmY6BXNkynq8kTstTc91+ZeQ2YwVJyBKVdE9BZzavk7R84aVPOn3JXJjsF3rC+Ymr+blabyIA+oihdc5BYRKvkV4ehL9W0tIU+78IsAu9vr8y1f3rCdpvvCHMqtzzgs7bPQQGFIxbh2w3csLoVS2NYq+Q99X/ZlFYJ3fhpyEYvzlgxdaVDVMIMQj0o+YoXEeOSiTycOt3cdpHC6mVW5E1E5qOMVsAOsY1vz3Dc1cFNP0MT8/3H0ZqoM/M0NmleR+NfwCAghEeilehVWY3WOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ey5NE7M1roRV4WlJRaEU0dgjVppFUvvZKSqU6/Oapc=;
 b=LQcZVNQ+EpEL46ET63oemrxNSQ/D6u2ioCb9jhRcWSX3puirDu/E0mdOf2H/9YC79tr+aFCApkgratUC1zbdveXrz4cIfD4a7GhqCENj71jWotbTdooNqJjFQ7he749h/teHL01cC0j8gaaXdfu6v7pUmU7yXR6a0XHhg0y+7zNHFOzYDn1HpXrDDqwVfC8rEu+lQvAxfa/VPC5mTTOeMQsxIs/Z3ORfCCQhsMxvK4TBnBZXDA8XsIaxqNjq/JWbZin14uA5bMvkJgScjkOAxZ33nL6m5yZlODDeHGbzem8XMsjel7pG5mlwcL30jM/aDrPzdRuivvni6D1ZkAQU3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by MW4PR03MB6457.namprd03.prod.outlook.com (2603:10b6:303:120::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 10:37:27 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 10:37:27 +0000
Message-ID: <ed29d4ed-4537-4fb1-ae18-1083e9ff5037@altera.com>
Date: Thu, 22 May 2025 16:07:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] dts: agilex: Add support for SDM mailbox interrupt
 for Intel Agilex SoC FPGA.
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
 <20250512-sip_svc_upstream-v2-5-fae5c45c059d@altera.com>
 <df8db66b-89a4-40d9-bd44-6705fdbb4517@kernel.org>
Content-Language: en-US
From: Mahesh Rao <mahesh.rao@altera.com>
In-Reply-To: <df8db66b-89a4-40d9-bd44-6705fdbb4517@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_|MW4PR03MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 4069654e-3ff4-4ec4-f39f-08dd991ca530
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emZJc29OSWNGQisvaDh6U2hKNndLcFI4WUxVMERBb0xQUlg3MVVUUG5hVFRY?=
 =?utf-8?B?dEdRQ3VJa2g5ZTJ2RjZTL2tsVEs5RUtmOG9ZM3hHZG5aRFJMelFSN2ZicWll?=
 =?utf-8?B?ajRHa1I5ZjFJNGV2aUo4UGM4RWlXdXA3UFFXN3VjdGcrWlZ3dVZBOXdlQW8w?=
 =?utf-8?B?Zy9zWXEvQmgxQlR6NkpPYmlETi9ENGU4bEFrZUVicWdLVEZmU0ZzOU9KbkRK?=
 =?utf-8?B?Rzk1aEFkWGx5c0drYW5pNjRLdXZiSHRqbTZBQWtsWXpQVk9mRzgzRXY3S2FG?=
 =?utf-8?B?bUcxL0tXR0VLbThiaW93T3FUa3VycHN5TXVDY0tNUkRJZkxQRFJDV050TlJF?=
 =?utf-8?B?Skh4bWx3aWRpUHlKU3VXVkZ5am13R2VuTnpqRHVoNTlDVkVNK2JSR0QwcEFx?=
 =?utf-8?B?bk1RekE3dEFtS0VvVjdDMnlRWmhSL2lzZ3B4Kzl0YkhUUGk1Uk9sQ0gxT3l3?=
 =?utf-8?B?QitFaGg1L0JETlk1cENFQmNUVUZ1RUtzVUo3U2Y5WDdjcFQwWDJDcjhJWElJ?=
 =?utf-8?B?dG9RZUtmQks0TVptbit4c2RFL0NINDFySTRrRHpvRHplQUVRQXlWMHBNWVhL?=
 =?utf-8?B?TVo0SXBaZTJoV0FOUXErMUVsUnMzMk11ek5VOVFqTC9YM3duU3Njeng2YWwr?=
 =?utf-8?B?RldEMmtkTzh3ajB5RTg2Qkw3amJnL20wR0RqWGtBcVhjZHIyWUlmTi95eTJl?=
 =?utf-8?B?M2h5aTBwMUtkR2ZPUzVYZjRZQkhPSzhjbVRXa1hWU0FFb0pMTmhSUkpGWUF6?=
 =?utf-8?B?NUgvaW5jcmpSWkhXVlI0Ulh2UC9JL0tEK3k5WWZveUlNQzNPeFI0L3grNlRD?=
 =?utf-8?B?RzE5TFR3aUNzY0t1cTRHNjd4eGRnY1Z1OEtlcjNKUlUxU1cxYXY5UTFMZnBB?=
 =?utf-8?B?eHFNd3RNOXRkcjVXRitHTzBSN1ErNlpWN0FMOFN3VWhFRDNjbEJ6OEF5SXJI?=
 =?utf-8?B?aytKWk1XRFpjUUdBRmRTQmxCejhxS0dYRkd3T1orQVIzZ1lBSWVkOTQxa2x4?=
 =?utf-8?B?UHdtRHVlWG9GRWJOYWUxYkZtbTVJQW5sWHlwNGNSOTNDbDl1Z2J6WnBhU2FG?=
 =?utf-8?B?UEpNbkxrdWlJbUllTi9tMng1MUhPblBkbkdpSDJNS1R0YTRMaTFGUGp4NVJL?=
 =?utf-8?B?K01pWEJQM1dzSFJRbDF4UEpWd3F5Y09MMUJDOXpjZld2Q2F5anBzMFRWUlUx?=
 =?utf-8?B?UGFMUStDdGVSTzFPUVdhL0dsQ0lJZ05hS0ZLU2t6VkVhVGNIZTErL09JSmc3?=
 =?utf-8?B?ZUZlalh0blBQK21aVFIxK3NRUTN5dzJRekhwc0lTYXRUbmhrd05zV2txbWlw?=
 =?utf-8?B?SElhQ2ZrZmVCQXA4bjJkY0lRMGJ0S3l2MHhweTNkRGNyM0VScUNCL0dxdVpy?=
 =?utf-8?B?aUtyYkpwTEhDZkdXYURyRm5xbVU3b2ZUSjc3ZTdmL1E4TXBSb0t0QjFWaGRS?=
 =?utf-8?B?cXFJNndTeEwxSk9QdFVNRnNZK29pK2NJMGRRWHZGZXB0VG91V3pORHh1MWhK?=
 =?utf-8?B?ZHYvcFZybVlOM01lVlpTYUpLdDA4dm14NThUbEgvelZpUGhZK2swV0hzWk1J?=
 =?utf-8?B?dHhyNzFORXEvVSsrbFREV1BoUGhpSnhDSFlvR3gvUzdTdmhWVURQY1JvTVRE?=
 =?utf-8?B?UDE4S2phYkIvQTFRVXliQUdSM3NXK0ZPa0t1cWFsdThMakRES3ZaaitDQ0FQ?=
 =?utf-8?B?ci9mbzJNWUJRNTZpMVZZNm5wcjVjWHJHeE5rRHhlQU9VTDI3a1gwa20vNGpx?=
 =?utf-8?B?WWkxcU5yT0tVUXVXcDJRTlUwenA5MWpqT0ZsQTVaZi9YcXo5eWIxcXJLOEgx?=
 =?utf-8?B?SlZYcGc1ZXo0blFlbmE5MkxUb2ZJdDNiblVBbnpEUk4zbTBiTzFRUUYxYnpZ?=
 =?utf-8?B?bzlkRjBldEExZVdYVExVcGdTQm5XYWZ3UXJoM2RDL0w5U0JPRmNld0tyMmRK?=
 =?utf-8?Q?eJDnHpi96EQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUFPaU5tZjlpaklRRkRqOVA5YzFTTDFVeEVZRWlrbG0vbThWNVI2YW1FaVc2?=
 =?utf-8?B?U2JGY0t2NnJjb0pZYnJ5VzFvUFptNm00NFRERmtYT0plR3RiNkIrbjB1R21w?=
 =?utf-8?B?dU9LdDJWdUd2L0V4YXpIejBKMVdHQmx3VlF5MlpQNjA3U1F4NGJXRklqQWZI?=
 =?utf-8?B?Z2d6UFNsYmZQWDlYM2Z5RFYyN2dOcHIyQzNHVVZXUEszQnVQaE1JcVpYeGhk?=
 =?utf-8?B?UmljSEdhSFBJS1FDeVY3T0RFck5rOXczSUd0TWg4aklSSGZKSm8zWHdpWFkr?=
 =?utf-8?B?azIzUmRQVll4TUhaa1AyZzFqVk1RcVJGMXRiYWpFd01DUEFGUWJYSmNkZ1Er?=
 =?utf-8?B?UUoxOEgrZFVsZzc1Tnp5Qm9vSDRlZjdvazdmWTNlN0cvMkwyLzRKeDc3Z2c1?=
 =?utf-8?B?U3V5aW1STmN5QXVIYVFwQWNyeUpPaUR1Rk5VMGo1aEJxOWdFcm5BZDBrYi9V?=
 =?utf-8?B?aTkxdGRyWk04RUp1MDc4clpycFlZMXhBcEU0VzgrNGl2eEIyNlBXa2dPKzBI?=
 =?utf-8?B?R0JTK1pVbGN6YlFqQzhtVjc2MUg1SDVBUG5TR3JtQjFEaHYzT3Z3dE9HSFdY?=
 =?utf-8?B?elhGS3kzT3pKSEVRRkExTm5lYkErZ082VUo0Vm9wK3VRZHIyN1krOEhwdVBE?=
 =?utf-8?B?MUZ6ZFYvWjl6czdobmsrUEF3Z2F1OGd2Z1IyT0Q3QXlSYmc5Vm9XeVg0WXBH?=
 =?utf-8?B?dTJ3bUZqZFdQazROcjRMdEVoVVY4YlI0dnhPVGZJaUhiZzJYODlkV0JuR1VS?=
 =?utf-8?B?RFNzc0RyVWlLb2FvTjV1R08vWVZNeGs3ajJEN3lIUjV3M0o0bkNNMVNRd2w0?=
 =?utf-8?B?UDhNQWRpRTVCakZaZ0xESm1nbHczMWFEREw2SVRON1p3RXZGNnYvVGxVV2dp?=
 =?utf-8?B?dWxWNEVsVlg5ZGxsaTFaYkhpZzBkcmFtUkhEMEszWWx1Ni81Z0JkWGxtbFRW?=
 =?utf-8?B?aUdPKzJGM1ZlVFFIWGYzSHhYVmM5c3Z1MzhqeG52UHhmdFR6SW9qOE8zTzdl?=
 =?utf-8?B?WUNURzNOWjJaYmk0cFJSNzlBN1ZodEMrdHJjMjBRaXpOdGpjYVFQV2JSMEE3?=
 =?utf-8?B?SFVISXNyUjZITytFeXkwakoyWG82SWZrajJ1V1Q3M00reTlMelYveXhOQ0cy?=
 =?utf-8?B?a3k2cXl1Sm4vcDBpRmtEd3JZV29yMjBaSDJNUGgvME04MXVVdjV0RUJzTDdl?=
 =?utf-8?B?R0ZVK1o3dmFTUXdVWnFRMmdCbWJ5LzVabnNCSzVTbHpFMEtOMVVSOVVpMkhJ?=
 =?utf-8?B?Ti9VNHF5Z0FvVHVucHdMUnpBaWkrakhGSVBuNlZmV1FZUkw5OGFlNzdlejc0?=
 =?utf-8?B?UU9uL1M2VzJBdUhkRG0vZ1B4MUJqRExBb1FzaGhQMDltU3p4M0o3eGdDekhB?=
 =?utf-8?B?ZWkyM3Niak55cmwzaFZ5NTI0QnZTL2dteFNVNW42d1kzWmZkS3Ntc2tWMGNv?=
 =?utf-8?B?QlgyZTQ4V3ZDVktub3BQOGFBRWdBVFFrR1pmemt0RkM3UkRRajdlOURZWXgx?=
 =?utf-8?B?N3hIT3FRSlY2bHRlYW41b24rb2RSLzVBNzA2ZnQ1NGpCUjd6NDdHeGFnZFM2?=
 =?utf-8?B?TmlPSnd5Z21SL0dYN3hTSVp5WkdIU25EZUJnRzZmajhCdzEzaDJIK1FsZzdh?=
 =?utf-8?B?Y3hjQTh2cHhXUXpUZGNzb2E4cE1UQy80dE9uNGlkdkdGMDNKVDVDMlRuZ3gr?=
 =?utf-8?B?eDZhRVRmQ3BpT1JVQ3cvKzhZUXhwQnJQWVNqczB0bzJSdExPeW15MlU5WWJv?=
 =?utf-8?B?VUd0cEpIWVRtMHNQTGowS05RVTZmbEQ4emZyY0l5Mi9mYld5VFpNSmt5cjd1?=
 =?utf-8?B?ZXZwREQyTGR6RGNjNnpzem96QjNaRWs0aGdxMThoVnFxbXI3ZGtmc3NCRCtG?=
 =?utf-8?B?WFd2Wjk2TTZPaEtYU3g1Ym5RRWp0aCtaMUNCVFU5VUR0YVJPZnIvR2djelBl?=
 =?utf-8?B?V0x1UzR6QU9BN2toS3BSdG5PNlFvL2RtQlZSdmpISjJpVi9mTGYyelBmTDN4?=
 =?utf-8?B?MXJkRk03Z280Q1p6MDBNODdrelIrK0FCZ01CZUN2Zk9PV0pLTEV0Y2R1UDcx?=
 =?utf-8?B?dStaQnZKV1lhSUduMWgxUTY5MjRpSHpVVlFTSVRublhaM1BDOUlUaVRTZnI1?=
 =?utf-8?Q?h0rau3khCcSpHqyEJdI+cKpiD?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4069654e-3ff4-4ec4-f39f-08dd991ca530
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:37:26.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNak7VDR1N2dqvamngdByAHIhhxnpryRag1bhq8OEvdInqIwGowP07TyTxFUt+c1hXfRP6JartFt813qlbKq9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6457



On 22-05-2025 01:52 am, Dinh Nguyen wrote:
> On 5/12/25 06:39, Mahesh Rao via B4 Relay wrote:
>> From: Mahesh Rao <mahesh.rao@altera.com>
>>
>> Add support for Secure Device Manager (SDM) mailbox
>> doorbell interrupt on Agilex SoC FPGA for supporting
>> asynchronous transactions.
>>
>> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
>> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
>> ---
>>   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 2 ++
> 
> I don't see how patch #4 and this patch will applies to this series? 
> Please send them separately. It helps with the confusion.
> 
> Thanks,
> Dinh
> 

OK, I will make patches 4,5 and 6 as a separate patch-set for adding 
interrupt capability to async framework.
