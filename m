Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2103.outbound.protection.outlook.com [40.107.244.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1F502BE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751247680; cv=fail; b=F47w0mSrLQ9p/h3Wu1jGT3yraFRt+ZR0P+0Rv7zP4V0cEWImWMnEeRzTWBYKPy2zGin74WUQmzUwXIs9tEhA6YLt8BpfqlI8u1mzncFwyEwU3KS362JrgqYUp0nla5zLl325+y1DIn60JNjiXrqq0uyity+TrkUExbVT/1KoXEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751247680; c=relaxed/simple;
	bh=r6NZNwnpooiT15FSGlJ/Be+QVavt5aULxn3p60/nP/8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HQz+WwgMHIhaOqondDMKuoLf6SOx7eckrN98zV4Rq4eBlC9Ekgx8qb8VyR0hUvLuyrWzjdKSd4uw1WoYRYgZlk7IoZRQuqJdSq8dmKe8eR5LEs7bQayb3G9RSls4/DAtf5r5Ybf3x1VydvzdZKkYZ2UgmH9+3ZFrioUC4+qzisI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=bOY6uR2Y reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.244.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="bOY6uR2Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUe1IjVNSdaQtFqTDr39iLzIX0JFrlmadIdUEJ05tDffn19C/TSwzIcBU7JGtfVRieTgX3OYC/prPzkaJmEFazJm8XH4Rg3Yfd/8T7YI/7KQh7+W8/yyLbWDycnSEr5w7MAzDzinrn49qUh6PkDmqoc3RuxIUi1LG9ZXn9uBxZvscd29LJ5pwvLCnOf/JgnV381gD0bw/Goh9+dbgveLcT7SlzsP23z+JaejsozU3m73T6AE3FpSs/fQhcXEi4/3G3M/IoXqStA4aUqY1sZeLkX1m/fRn549u5x0cBEnkSf2P8ASHqtIQTt2fLdakPx/oWEkM6Ais5AG0ZKzQXM8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xmqakc7Pbrc1Gs/mFcbKXs8+vpOeJIEzfBzGSuOJHQ4=;
 b=t01iPFJYZ82voqRPhqhoNEOATSm0rZAKHNn/x4Ki6yMjpudx7xJyjWGKk6W5BTtyyCBE8aXWZ77QeElPfBCYNOWN0vubnb4mN7CE+OL1lMgsr2eTexgJVzDOwAARXrqyfrDPNAoFHzSX5PJBCGvDDInJ7gdy3ekUJC/T3cTNRaTzaS748OdYdjfcsObT1D4UK/U2Y/uv99XTD1UDB/mHj+Zkoqgl4fecUXwIOzkefJ9KO872PKjcHFXEBmdG1wY2Gf3c+8DOuZzwXxVtnxttyQ6afjxo5gqvCH4miyDpG1hFXJhJDEXkWjRaFkA1gmygUk8LqPQDXzx2GH0IRkacag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xmqakc7Pbrc1Gs/mFcbKXs8+vpOeJIEzfBzGSuOJHQ4=;
 b=bOY6uR2YiRGsm7WP16qhiojO5waKRtIhKXrPy89px5iRF0L5q6ssW+VaH+JGqlsXlCoSBaw+fy3AGIEp2Meqig56b5ZJ8HCyyYtlpyU4G4tnL9PZ6nNVGrmHcxZ+QXS+GPGUDOkQFsAZ/Ipdv2HKx07YGYvNAkNOkTSJ075gEmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SA0PR01MB6219.prod.exchangelabs.com (2603:10b6:806:e6::5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.27; Mon, 30 Jun 2025 01:41:15 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 01:41:15 +0000
Message-ID: <61f6b895-2632-4d9e-9002-a30655962fb0@amperemail.onmicrosoft.com>
Date: Mon, 30 Jun 2025 09:40:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2 fix-v2 ] arm64: refactor the rodata=xxx
To: Will Deacon <will@kernel.org>,
 Huang Shijie <shijie@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com, corbet@lwn.net,
 patches@amperecomputing.com, cl@linux.com, akpm@linux-foundation.org,
 thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com,
 ardb@kernel.org, inux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241212082426.4110-2-shijie@os.amperecomputing.com>
 <20241217071715.24797-1-shijie@os.amperecomputing.com>
 <aF68Y5aQFBqShtjD@willie-the-truck>
Content-Language: en-GB
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <aF68Y5aQFBqShtjD@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0033.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::14) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SA0PR01MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: e197d652-f090-4f22-a5ab-08ddb77733b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHk3MzdYdFVRbE1qVDBzd3p3VllqTzlvM1YvcWRsTlFwbWh5K0VvTUFiWUtv?=
 =?utf-8?B?Z095VDFpVW9pcmpqVFFlVElrYVdUcjFxTjhTdTVld29DZGN6bWZmcEN2Yk9I?=
 =?utf-8?B?OUlwbHRNcFRiRjVvdkFCSmYzVCtFNmVNMmNVY29wV0o1aTdqenl3Rnh6aFVM?=
 =?utf-8?B?MU5nNGZEMGx3Z1hNcS9rZUppbmpkWmlXdGRTc0xKdVBrV3lIOFdRN1kwRHVI?=
 =?utf-8?B?N3pmMzF3OWZMY1NwZm5pcTNUSjRVUVcrcGxrKzFJUmxTN3FlQ3pHN0ZwK2hs?=
 =?utf-8?B?bGZ2eFBQVXo5YkVMRlNvbEVuRnArRzh6Ri9QaGdVYkJ6a0tZbjk0azdacUU2?=
 =?utf-8?B?eTBwVVdWYThxeE5PY0d3N2dxMjFaY0pjcW1VZXpJUGYyTzlkbDRtMUxZc3Js?=
 =?utf-8?B?VWdZYTVMM1BSaWlnVWt5eHE5SXdiZ3prSzFZcURubS9yNjdpVWdVTnY5Z21p?=
 =?utf-8?B?TWpnUEt2ZEZVV2o1amNzMU1keVFQaHBlVXM3V1pzSWppME5hd2RzWkNoWHB4?=
 =?utf-8?B?aU9lK3VnellPb1gyTUJFa0lIUTJBZjhVYjJjMUhHdDB1OFZqWE5KNU96QzhP?=
 =?utf-8?B?ZlcvTFZxQVBnSFBHRFRuTkNtMlZ5U3FabmlyMEVadGw1cC9PVVZKYVVyeXg5?=
 =?utf-8?B?TUVwWXI0aHJXS2R3QXdOMlhwc2k1Y1RaOU9iM1g0eDBndWMzbFBMWG1mNTZO?=
 =?utf-8?B?Sy9WdlFEcUdXN25uVXZqNlNUcWxIK3BLOVlZMkZGckdwOFlxem1vZ2lEbStL?=
 =?utf-8?B?ZFc2dmgra1dPMkhyanpVaUJSNGFremJ6aW9nVEFtNDd4cTlSdktleW5MVlFQ?=
 =?utf-8?B?a0gxMFFsbDhQc29VeVJCYzlCcWVVVjhuTk1nK1pOTG5Ub2tqU01rNUduU3pw?=
 =?utf-8?B?Yk5tWEVVWWlybTJOQ2gzNFc0NFpFM3NKY2dHSml1Rm40amJTRitTT0FaY05J?=
 =?utf-8?B?S3VReURmVFUvSENwVHQxOHhlVjNNamdFcFBsNjM2dUthOUFqTDdUT3FuSlFS?=
 =?utf-8?B?V0RwWE1JL3d4RTNXaWJXOGR1TFRaaW0xQjA5QytYWmlhamd4ZEQwR0xwWVFu?=
 =?utf-8?B?U08yL3BZOERDTDVndjN3U3RaWjhBUlZXeUZMRHR6bGdYRUNpWWFwbER1aVFJ?=
 =?utf-8?B?d0dYeDNCN3NWOENmV1pYODNqOWwrSDAvSW5PaG9QTFl6ZCtmeG1ZekdKbFVU?=
 =?utf-8?B?b0xqUmt0THpDRFVxcUJpeHZiTHZDY0FYd2ZVNnJ5Wm9ITEtlZkJlZVlySUt5?=
 =?utf-8?B?ZWxVWkR4UW8zZUVFR3dQdzdJYXIrdkRXWU1EMnkrenN1Z2MzMXFaNVNoZlZE?=
 =?utf-8?B?cUd6NXBUQnpOZzFNWmc1RENTWE80VEEzbXJ1eFY5UklwTkxzMUNKY3FBNDJk?=
 =?utf-8?B?Q2VpWVVNTVlYc3lMWWh4b2lWd1pianRDWjVUREQ3T0MvZHREUjVlZ0svTmZL?=
 =?utf-8?B?aGFsL0dhak41NGllYlFLV09nWVIvYUZRNnVIdzZITUQvL1lzaUN3dkNQUThF?=
 =?utf-8?B?VnNvZ0FMV1VzZjR5TXpLTEhNT1JxWnVKVVJienFzak9BWlFIaHQxTTNGNjlN?=
 =?utf-8?B?eVBJeW0xYk1pRXUxUHY1all5aHlkQUhaWStTSVczMjVROVZEdmljMHN0cHVZ?=
 =?utf-8?B?YUo4US8rbGJmYzdJYU9FUTVhU0ZJcnZOVWFGZm1zaTVNbWN3bWljTUVwdmkz?=
 =?utf-8?B?Y2VGK3lxeW1wU3NJSis1WHoyenFUMVZGczdubzZhdDIwTzBYaDZLOEhwQlpD?=
 =?utf-8?B?VmJmc2JtUS80RTFvZG85MWVLQUZXdFF2YW5TVDJOZ1A1REpZM1hEM3VXeDF2?=
 =?utf-8?B?MTdCNWdKNUkwY0lnU1o3RXlycGlRSW9jb21oeUJnb2x5dm1JYkF1WHB3S2h1?=
 =?utf-8?B?bDJUVkZSZytZRUVuZjMyc3lMMmdkb1BNQW12V1VBcnVuK1FFYVkrZ0xDemhP?=
 =?utf-8?Q?r6CY7Iu3V1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUp6V2VoV0l2RWszdzVjOHA5VEJUSlFUTWF4NkxMMTl3TXNxcEloNGY0czcr?=
 =?utf-8?B?YU0vbkNldm9XcUYyRFc5TjZscGY5dFdZbUlOY2ZLb29hU2tVMzJ0ZlJrdDA3?=
 =?utf-8?B?Zi9qRUtLNTdDNkF3VzIrRFpXZG8rNEVqaUxkd21kblpQMEpwOWhQYWR3cnAv?=
 =?utf-8?B?T0dtaG41ZGhtV084aUV6ZUhwekh3VjlHLzJTT0g3S2NvZVhGNVJ5UHZiMm9E?=
 =?utf-8?B?czFOa0VocW1WMlhDSVpxV1BXVTFoaGF3eEZTWGZCSGlrQm90aUxSdmFEZnhF?=
 =?utf-8?B?WlIybnlBaG5pZEJHUjdHeERwRUpWaHlDSWNhK1F5Y1E2cmliOUpJeWRudlZQ?=
 =?utf-8?B?S3RoTVNqNW92eWdmaDg5U3U2TjB5cTZxV0V0alc5RWRFU21WMVhIZkxUKzF6?=
 =?utf-8?B?eG9sSXlyS29WS3pUMmhCL1pkOUk1aHN4Y2VJVGlwN0ZMNnhWQ2dEa25PeDZZ?=
 =?utf-8?B?cUNVK3NXTXA5UnZvSllYRnNnZmw5eTlCOGM5elNIaGJkUlBKL1JYZkNLNE00?=
 =?utf-8?B?eGxQeGZYQmg5RDByZ09VdnAyMDNhdzlNV1NxbUxTU1FRKzFPa3VPU0N5MnAv?=
 =?utf-8?B?d2pLOVdVWWI1WXpETWsxdktaM3J5RXFqOXdKSGVoSW56RzNqanhaYjZRVTVG?=
 =?utf-8?B?ZUQrSEVqZ3I3b3cxYjFyaWZLU28yREk2ZnFZeVI2NzAyZ2oxTXF2NXhhTDRC?=
 =?utf-8?B?VFduWHBXQ2x3ZmVQM3Jla3cyUHVmZFlQbU91cXBQVTFwZUs3dGcwczUyRy8x?=
 =?utf-8?B?cHVxUDMzeG12SklRaCtpTlhGZDFwcGw3M0J3WjNGSHQyYUF5Ky91TjdGM3Jh?=
 =?utf-8?B?MzY2TjlhT0ljemNHNklRZC9QQjJqbEFsemtyNzZ1VWh3MXYxcnRIR0JmTlBI?=
 =?utf-8?B?UDlGNThWOHlvbHpPMUMyWjdpYmxVQXI4QldhUDhtd3pkTHFWTVN0QndWWU9C?=
 =?utf-8?B?RnNIeDlzNzhoZHY3Q2o1WGVaVjdDRFA0T2YwVjZ4a0hwempYTzRoVlN3dGY3?=
 =?utf-8?B?b1dOSU1XU3lvNTlvODRDWEo4bzRUR2I5aGhRc0lPQmpvWGIzU01Td3BXaVVT?=
 =?utf-8?B?OHREZ3JOYTJzdEhuUmxHd3NWM1FTbGxDOTFVOUVVbytOZzM1eUhmSFRyNXdT?=
 =?utf-8?B?YlpiQjY0UjVNazgweFFqZEJqOURaZ1FXR01DRmxNRWw1VW8yUG01MTcwRGdt?=
 =?utf-8?B?ZHdPQldCb3RsTXZ1Z2FWcUpGaHB3VmNUalRHMDNKaGt3dFo5T1hjdndWL2ti?=
 =?utf-8?B?Q1JDbUZYOEpQb1RBa0lhSlVVN3EyVXYxUGNVbzZ4SGZlZVhJNXRRQWpQL3FH?=
 =?utf-8?B?L0h4Yk5QMWFPY0FBbkVpUHFYb2ttUFZ6OGNqT09lYUhRRlZHaHNPOUZjRkxq?=
 =?utf-8?B?azVYM3djcmZ5OG9pUEpwWEpvQVlQL05QbXpwMG1mQzM3N28rbXFGbjBpS2ZR?=
 =?utf-8?B?dTBMeDNUNWNFeGd2U0VVZnlqWUlyeDg1d1JqRTZZRXE1bEZSeGpBNm1yM2Rs?=
 =?utf-8?B?NHRhSFk5ajg2QVBoOVNrOFBkcGlSdHFVZDI5YVNKcnpxUGNPYjZPNmt6d2Zk?=
 =?utf-8?B?THNveVFEUlZFeFF6SWIzdkZEaXRDL2ZjQlo3OUdsenNUYVhEd2dlREYwNjZL?=
 =?utf-8?B?RWJtNXNaRnB3amN3VVh2Vy9UZUpQanJCNVhzZ3U5ZW9CamFJWlgya1huNE5o?=
 =?utf-8?B?ODNuOURBZ1BNTEFQOVU2eVVCQWt3cHIzL2l4dUpWU2N1VDR1OUwydFExNnUv?=
 =?utf-8?B?M3RZeU1WaGJPbXRyTVZwU1NyMzBWMFhXZHorTUZyY1VjMHhpYUJ2WTRBZVlz?=
 =?utf-8?B?QmJRaFhMWElmWmw5NjB0WUx1bmxsaGd0d3NpZG9lKzhpL3JURVhhTFJFa3hq?=
 =?utf-8?B?emhWMm43Wm51SjFzS3BTR1ZoR0dqblVzZ1Q0RFNOQ2Y2YW9qU0tPeWh3dnlF?=
 =?utf-8?B?V0xMTEdTV2dNWnZEb0tMTW5EUHdwMytyYWtYWGRKdk1jLzF3RThtaFdDUG40?=
 =?utf-8?B?NngrSXdhMDJqTEY0MDg3SjhLVUswU1F0R1RvZ0ZFV0JNazlPbUtud244ak8z?=
 =?utf-8?B?U21yaFdCNU5ObUUwR1NnVXYvb21hbkJ4Yko3RUdNRzVFeWZqTlJYMkROVG1V?=
 =?utf-8?B?dkx1M3NBSWJqZktqa0l0bStrdzhRZmtBODRhQTdtQ1pLYjhPUDBNTm1DNXYw?=
 =?utf-8?Q?asLeUK5FN7Rb+Cb7MRxEyC0=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e197d652-f090-4f22-a5ab-08ddb77733b6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 01:41:15.7051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+khuDexNFTJSwLAwueJ8p6K4lyROVQoVFw/+XgcLp9vHfZg9ZM7ulGTowsGI9/DbXOwiaqP4e/vy3Qy3QxBMOSk2zUvqzeOTZO+dh9eZa8CVTq6yFl86rvflPBkBw2X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6219


On 2025/6/27 23:44, Will Deacon wrote:
> Digging up an old thread...
>
> On Tue, Dec 17, 2024 at 03:17:15PM +0800, Huang Shijie wrote:
>> As per admin guide documentation, "rodata=on" should be the default on
>> platforms. Documentation/admin-guide/kernel-parameters.txt describes
>> these options as
>>
>>     rodata=         [KNL,EARLY]
>>             on      Mark read-only kernel memory as read-only (default).
>>             off     Leave read-only kernel memory writable for debugging.
>>             full    Mark read-only kernel memory and aliases as read-only
>>                     [arm64]
>>
>> But on arm64 platform, "rodata=full" is the default instead. This patch
>> implements the following changes.
>>
>>   - Make "rodata=on" behaviour same as the original "rodata=full"
>>   - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
>>   - Drop the original "rodata=full"
>>   - Add comment for arch_parse_debug_rodata()
>>   - Update kernel-parameters.txt as required
>>
>> After this patch, the "rodata=on" will be the default on arm64 platform
>> as well.
>>
>> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
>> ---
>> Add more comment for "rodata=noalias" in arch_parse_debug_rodata() from Ard.
>> ---
>>   .../admin-guide/kernel-parameters.txt         |  2 +-
>>   arch/arm64/include/asm/setup.h                | 28 +++++++++++++++++--
>>   2 files changed, 27 insertions(+), 3 deletions(-)
> Sorry, but I'd missed this as you'd sent it as a reply to an existing
> series. When you send a new version of a patch, please can you post it
> as a new thread with an updated version?

Okay, I will rebase this patch set and send out it later..


Thanks

Huang Shijie

