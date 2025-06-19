Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012024.outbound.protection.outlook.com [52.101.71.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939821C9E4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750306277; cv=fail; b=K29+rSdyd61s5rIehGwtTI2lRq+h6EvKwAdvWCAZZ6nI/Y7UYfBRo3v3ZXIPN/XYFhJrn9Sx6y2lrGjUiu7GZ9qYZKWlu0uq46KnJ63prBF1G1JrjNPnhHuCzmko/Qxf21q6s4hAARNebjiIWLSvHGzJQLXDW/+0cnXYbjUd52k=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750306277; c=relaxed/simple;
	bh=EukSt77JosX+tBVBcqjcVXVziX+qCyRCdTXNGkrPIVk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V/7qMgKuzyDZLebMYmcL4serUm1b5mV+7MODAcRuoE5jLsUeVQ5Vlr8kx0ili0FZiuNVV/GWcMlKEc2iWAWryELxb6SXx73hLh0hSBicnSvek4uTGN7YKAN1xuNSAbo1v1NvFZN6u198QbP4xOEYWVzOiYJZkvfh8pgo1+T74fU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kRtxelq2; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kRtxelq2; arc=fail smtp.client-ip=52.101.71.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kRtxelq2";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kRtxelq2"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VHAS0alN6ph7443YRbtOa48mFk7KJ5E0f3wUN9iMeW6UnhRJUvsfjm7mk/1iLImuvEezVaC6dX2I4bmd6i41uVe6TAcp+Dn3GbI5UGHDYthRY0aRmckuL6uqviQsUC+oi9V+gSDe2Pu5da2CX6+x4tHasEOvFUOEAgfMxOT+70x3lYKOO1MNx08mJvw6QKG3dWlotj38yIakCTnnTdIJRU1nuYTHtGxRXdGz9jpFjCOFAxiMLK9I7GF/me47jHxj9w+D38CVNyn18dSilgs41F7BCyL5SdEgoj5UjVfiafnqBh5AKi+UwKQSLU+baklNZ93ox+AG5U2JgCo9DSEE+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2MiGU3h0ktgucxqqdJLLGVY2HTtW1RPdzIb+b/OrI8=;
 b=MGE/xX1FH0tZaXVFdZnCih3DPYatTl8kgk/2rAoJBZa05JpBKUwaxSq0N0pBRr7DV/CnTUjS8tB/Ajm2UlgWHTiVuDHkuwo6jI84X5joel35+rGdMcDmiROyggCfB8CnDBOSyFTn1zynIZbR1XxzvBZwYQA8epk7hzD5W4maEo7yjsbzS8Yaj4xTR6xVdT48v7h/pfmbtw/4/5QO7OIXYsLdAAtWBUsSquubvurPSke0UnV2RDll3jhH7jN3bonXX6raCgPvCuIxfdw24dWxWUtrke6pILzZP8+1lCmE05CXp3jf7g9VOaoacxbyqP0ZeysFGqeh0fqGPicVVAQBDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2MiGU3h0ktgucxqqdJLLGVY2HTtW1RPdzIb+b/OrI8=;
 b=kRtxelq2PvrHbmdij6Zvv/RnIXnOGxMC+5uuIwGKgvg9VWXQdElyIyJ2A7BJJ8zwdUDxAmuoMMtU4bME11lMQP1148xH/4deV1cakJC3LEDOpYco3aESzz/1TcJYhObM6i+tKn3nuCGNBpuVMsdOx94yR/aiY7roTSdfe1es40g=
Received: from AS4P192CA0034.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::13)
 by DU0PR08MB8834.eurprd08.prod.outlook.com (2603:10a6:10:47b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.36; Thu, 19 Jun
 2025 04:11:08 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::c0) by AS4P192CA0034.outlook.office365.com
 (2603:10a6:20b:658::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 04:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 19 Jun 2025 04:11:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joqZ3VGhR+pR06bdkgBALFYVEOJ/YCBVdSFciv5uaqQbtQCnpC/bP9q8h+dACoh985slyGicGi7wAZbGL4EiuOv9/TBCgxsJaJ1fd8lDi/wyIOHXvMk5HEwq7kQmKkuy/GXzm/i7bkpDLMCR/Js0i6Zt5qxsr/x5TfUQIcEohOT3z+fp4xoB621qCT6xaU9HwDp2dSt4eYl+l8MZepv9ZPsvOMGIPd8hApHITJLLvAGlLkB04afXWOkatVx43YBabtl/V1erBlcSQSxBgqPpbOlu3JLIGfy2EJCsEc8BIwRBr1Fes7W4o0sp4DbJNQU9V/3HcarjQQlyBbvRUJMYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2MiGU3h0ktgucxqqdJLLGVY2HTtW1RPdzIb+b/OrI8=;
 b=TNcfiM5LSmsio2ZVsX7xkDTFU2VMYd0QS3twk8K+87fpIPGyalqE4IEcWzJ2DcnIexZwg140NYwL8MDsAlDLaPmCO3L4c3ZSrklS8Mr9v6uMNB3ZUdlpcm0WBIuA4TPX2JuXERQW0yDACGdXu2Hp31mKEK/AvvYhLrjpF9qZcMOzZCAwflODToeZOJ7jWjfvzoQf98c42cgjM61S7oQsQxOxqiou+DkvdptUgKB7DJmok7sEemI7mkAATi++mhwOvqYsnmgeWl/41dzqVCllbecnI4N7v1exX6trXGM6Nq/hzSRzpgHT/IJaJZvSBxyEDz5Ljj/tft8lUzkAUYeeEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2MiGU3h0ktgucxqqdJLLGVY2HTtW1RPdzIb+b/OrI8=;
 b=kRtxelq2PvrHbmdij6Zvv/RnIXnOGxMC+5uuIwGKgvg9VWXQdElyIyJ2A7BJJ8zwdUDxAmuoMMtU4bME11lMQP1148xH/4deV1cakJC3LEDOpYco3aESzz/1TcJYhObM6i+tKn3nuCGNBpuVMsdOx94yR/aiY7roTSdfe1es40g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB9836.eurprd08.prod.outlook.com (2603:10a6:20b:603::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Thu, 19 Jun
 2025 04:10:34 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 04:10:34 +0000
Message-ID: <fb5086b6-8041-402a-b1c7-7197ca188147@arm.com>
Date: Thu, 19 Jun 2025 09:40:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com> <aE53Jp7ZGgTxtxwG@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aE53Jp7ZGgTxtxwG@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB9836:EE_|AM4PEPF00027A6C:EE_|DU0PR08MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0ed990-8e79-47ff-5904-08ddaee750a9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OGZqSHNFaXA0RndJbHJON1hMOXQwblVzRm0zbnBabld0NGNiTnFJdmpsR2Rv?=
 =?utf-8?B?N1VROEUzRmRuL2R0ck94aHlRS0E3ZElJaVozZEhJSWh1TWU5Z3poeTNYbVpH?=
 =?utf-8?B?emxIVkVPSko1eGJpWEhweGh0V3B3VEtGeWpwMDRTMmNYWTkxZlExZTZERU82?=
 =?utf-8?B?bFUvY3VLV3k5N0FkUVlDeEJzNXgralpvS3kyTVl0ZENXWjN1aFdFT1Z2Y0l4?=
 =?utf-8?B?VHFWbUVvUEZVaS9oREhJRXRVTnArVkNBUVo0RXF5cDRUVjErWmpZaFhVUlN3?=
 =?utf-8?B?cnFpb1IzMk9xYXE3cjFydC83NzRSSHErNUN4V1NCeFVla1NObXdGY2Z4cjdJ?=
 =?utf-8?B?d3hIN0E1WDA4SURHMzlYbkgwbDhuS0Q2cjNON3RrdHlPK0JlQlNQNDFPeHRS?=
 =?utf-8?B?Y3pCVWFmSzNNcUwyQjc0OXdvOUVlSWxqYmxKL3dtU2hjSTd2U2dLMW9nZ3Y5?=
 =?utf-8?B?eWxFVTVrTmVCNDVZcGFxQlcrZmJyR3BkcTBjYXBHRkt3UUNMaGZjRzJ2MUNE?=
 =?utf-8?B?ODJ6c1NWd0dqY0FHQnpEY1Fsd3pEVWRzSWhnZHl5clE5ay8xekxtaHZ1S2pZ?=
 =?utf-8?B?aGs4Ty9zNmNhbitPaEF3OHJGbklaQ3AzN0grdDBBOG45UGllTUhYN0ZoTE1P?=
 =?utf-8?B?a2didzJXZDFUMjI4b05CbE9tQjExSzFxbTVydlFkOFFNOWpzSkp3ZU1YZ1pj?=
 =?utf-8?B?RXU1U3l1cnh3QnNKZ0JPVWcxOGhjc2JSU1dTVTU1S0JOdFljUTB1ZC84UzdZ?=
 =?utf-8?B?NXcxUmwvUGp2bjliR0JqWWk4aHVVUFBqUlhZM2k2QmJNcWk5WnJVQnZpUU5U?=
 =?utf-8?B?VzlxOTRTOUJSNkFRdG16cVlXdUNobmI0MVUyQ08zL1pzb2k4amFzblpaMFJl?=
 =?utf-8?B?eHNORnd5b1NIUFJGVC8zTjZlTzlxR1BjL1FQa2E5V0ppTHFDaDViOExTMm9R?=
 =?utf-8?B?WVdScXBsN3VIM0VqRVoxV0FJRXp6dmlTWjA4UGRLaXk5RUgySjI4UVhTRytR?=
 =?utf-8?B?WUs2UWZ0QjdQNGdlei9UQmkzMzhVQ0h1VzUybTd3TjJuUUx6d2tRZVRES1FR?=
 =?utf-8?B?SnFvbEE4U2ExVXBMaHNzWnhuK3o1YW91U2ZtQnREaTJac2NlamJPaXR1UVhE?=
 =?utf-8?B?VjNOUkl4OUVMWHQ2S1JqeTc2YUF2SktJekwwVzBuMHFTZkhPWlU5YVQzTGVC?=
 =?utf-8?B?L0ppeXlWaUQrb3p1MUpoM3J2VVdwVlh5Lyt2ZVB2QTZ0TzFpVlRMZ0Z0ZFB2?=
 =?utf-8?B?TUpoSW00dmkzdWxQeTZmcHhLWmhZejRWb003aWJFWnNmNnlHODBFeEdOQnB3?=
 =?utf-8?B?bWxXMUpYVVI3VW81Z1ZpSVFZd1haNVBaQnJOd2pjNWVsY0MzUkEyTDJIRy9h?=
 =?utf-8?B?dG1rRG84V0x1cStPQmI0aENGcjhJYW91VzZSdHU4ZGpIV1JBUnUvWmNYZnJt?=
 =?utf-8?B?VzBpL2M4Q0tNYzNOSnJzR0tiblI3YXlvQmlqZjVUYVNjV2dMZExDdkl4SDBP?=
 =?utf-8?B?RnVMcDlGZnNxaytscE5hdzJNUFo1ZlFjK0t6cXBZdFY0Z2tacTlrUHJmVjFJ?=
 =?utf-8?B?Z1M5QS82K0hNSHVkVGhBWGVjQmt1b3BmUGxWSDY3a3pjZFA0TlUraUVGRm8y?=
 =?utf-8?B?SG9yMzZLNjZmQ0NMTCtRckhyVFVKTkcwc0RPNVVuZDIveXVoY0hNMmhvakxI?=
 =?utf-8?B?MmNoTEZoS0hYUlp1T3hYdXZRdDR2K1VGdmhmMTJUQXZYREdGc2k2TFJUdEFC?=
 =?utf-8?B?bktrVmpzOEVtNXQxc296K3UyWnRuVi9BYzlOQ0F4Wm41MkVsV3NwdTBJZm10?=
 =?utf-8?B?NG53aTdoRE5NNWxkU2dhSHBBdmZWWnlXUmMyemZ5cHUreVZrKzRXMHY0b2Fo?=
 =?utf-8?B?OVFRQzZOdWFZQkNPeXkrOGdZZk9jRzRSNW5ocVFJT2x1RkF4djFPWTdHSkNn?=
 =?utf-8?Q?y2E0uz6Y6Rs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9836
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	541cd2ce-b758-4fd1-dc1f-08ddaee73cdd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|376014|7416014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUpsMG9uMVpwQVNZSVRVb2NQbHdlRkwrSi9aZXRuRCtoRlJMVlVTQmI4MHg0?=
 =?utf-8?B?dzdNakRJNUVzMUVwR2p4V2x3WjZHTTNNcXZhVG15cUxwVzZZQlR5UCttYlVx?=
 =?utf-8?B?OUc5SmlaZTlHWU5jeEZOTnFraXhUYkx0Y1REQmprT1ZtcGdHQndJbnZPUlBl?=
 =?utf-8?B?SFhyeURBVlUxYWEvck9ySXpaeGcxSXk5SDRORTJhUVhDMWtVaGg1dEFZRFZP?=
 =?utf-8?B?cDlZZjlHSTl4ZDhReG5VaWRDdHVLWit5dHhWNTh2R1gvM1RwSzZpckRabUJ2?=
 =?utf-8?B?bW5nT1FkWDZzOCtHeHNYYlo5c2RkZXN0ZnNaZUg0ZFpEaWEvSGRsQUYzWEZX?=
 =?utf-8?B?WkxGTml4cXFJbUdaVmRVVGxmdXRYVDJiOUpZSHJIbjJVRTYxbWxsUkJNNE5R?=
 =?utf-8?B?d2NsWEpnMC9xYzdDelJjb0hPTnlOMkNwNVFwLzBtQzdFOHBCbmpGNDV6NVA2?=
 =?utf-8?B?Tit4clZBeXhhdFdTV2NZa3hremdQOXVoSlgxT1poZGdRSk91c20rYlltVmR1?=
 =?utf-8?B?cVRsb1dLZjM0dS9lZitrSDkwQ29pMTlQSVVyY1RZS0RFZjc5cWU2Z01BRW02?=
 =?utf-8?B?VTg1Nm1ZQUQxVE9vemdNbWhXbFBwMjY4US9vRTFNaHo0Y1I5OENjQ012QU4y?=
 =?utf-8?B?TEQ5QU4xM3FFVTNpVFd2TFVzbkM3cHMwcS9LbTFSbjZ2WURocTVIWFMwSXND?=
 =?utf-8?B?bTkySkRRUkhZeXRTd0pzY2puVWVBbmlORTRJaVdpdm5RMnBpejBmdW1xVVFI?=
 =?utf-8?B?SnA2VXJXbUtsUnZDZEsrcmhUS2lLQUZWcVB0R0NFenc3bjNIcHQyV3dqaUIz?=
 =?utf-8?B?RUU4QVVzTEVJbkVmcVdKcG40Q2JxMlF0NklEM3JsQTRhTWdGQVVsa3AyTGg0?=
 =?utf-8?B?MjQ2UHIxY0NST1JNalJHbENrQnRnUC9NVWhoZDI0c01JV216L3BqSE1tZS80?=
 =?utf-8?B?RGhDVU5xQnROb1ZWSTRZQjZDUkkrR3hNanMvYjFscFhUMGtNOC9IZzBoR1NJ?=
 =?utf-8?B?ZEtsa3hhRWwzNmppbHAxWDFJOE5sbzI3aXZMMnV6Ky91WnlVMUV4OEJNMk53?=
 =?utf-8?B?NElyMGQ0V0Jnc3RLSkFRcmlSdGl5NEZrcmZ3L2M5akFQVEdidUhmc25PaXhu?=
 =?utf-8?B?VjlwQ3dYSC9PTGlxMEFMQmp4bWc3bDMxTlFRY3JZa0VEcHF4R3RTT2RodXlO?=
 =?utf-8?B?Q292OUJaV1F1UXJ3bTlQaHdWT1JhcnlWdHd3bGJsbnhLdlcycEhCQTh1TERz?=
 =?utf-8?B?ZnQ5VGFKQjB4a1dWRGk3OGcxZTgwNm5PMXNpdG03azdEVDd5d1FCYXg4ZWNZ?=
 =?utf-8?B?eGJ5dkVYNUdiRTZ5UWpqZE5VQWxONFdWQ0ZMSE1la2pFK2VVYzJRYkcyREpR?=
 =?utf-8?B?YTd3NUxIQTNnSlorM1QzQkt5SGFwOTlVNzZUd0FlZXErdTBCaitZclh2MnNi?=
 =?utf-8?B?MzFJMkhmMXpoWVEreVZSODF1eDdwbXZKaWR0R2U3aGx0S2psNnVqZ294L24y?=
 =?utf-8?B?UWRubkhoMm0wK1QyTlIvQXNuaEJSNjJSU2xsK29wS09YOFVhTUxVR212dlpG?=
 =?utf-8?B?NWtHeXRtQTN3dmlHZXJqcTJXZStqR1M3cERaNmMvTEkxc0YwY2pjNUpScVZK?=
 =?utf-8?B?RnQ0RDJVdWN0WE5GM1JnUVBhK1BDMXNFbC9XdjNwM2g3L0FsZUNMczBFbUhI?=
 =?utf-8?B?WHV2b3ZtUS9NQmRMd29oUENPOVVWWGU2OUdhZ1VXNGhQM29TRFFjdDJPcFdp?=
 =?utf-8?B?eWtmQWh0SDJRc1kzSUFQaWkvWjI5dHdyR0FMWDlvTldEZkpVRE84UCt1bEoy?=
 =?utf-8?B?MWdzSXRBcnBIVERtUXlCZGRmdVgrd3E1S01GK3diU1JKaHlUZjV0T2dsOWpD?=
 =?utf-8?B?Q1ltemVCVTZpK09qdlJtWlk1NVRWbzNialhKOVZZOFcvNDBYak9YVGQ3VFFC?=
 =?utf-8?B?b0tOSnlteVQzTHBTV21Ub0RWQlZRSzlLQmFzeDBCSVpPTHI4RXJkUVhTRDFt?=
 =?utf-8?B?Q0hKdy9LZlJtcUZJVG9YdVZyZzBlanFwblVESzh0VnlJdzhxeTc5RGJ1Risy?=
 =?utf-8?Q?5+bn+n?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(376014)(7416014)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 04:11:06.9577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0ed990-8e79-47ff-5904-08ddaee750a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8834


On 15/06/25 1:02 pm, Mike Rapoport wrote:
> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>> -/*
>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>> - */
>> -static int __change_memory_common(unsigned long start, unsigned long size,
>> +static int ___change_memory_common(unsigned long start, unsigned long size,
>>   				pgprot_t set_mask, pgprot_t clear_mask)
>>   {
>>   	struct page_change_data data;
>> @@ -61,9 +140,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>   	data.set_mask = set_mask;
>>   	data.clear_mask = clear_mask;
>>   
>> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>> -					&data);
>> +	arch_enter_lazy_mmu_mode();
>> +
>> +	/*
>> +	 * The caller must ensure that the range we are operating on does not
>> +	 * partially overlap a block mapping. Any such case should either not
>> +	 * exist, or must be eliminated by splitting the mapping - which for
>> +	 * kernel mappings can be done only on BBML2 systems.
>> +	 *
>> +	 */
>> +	ret = walk_kernel_page_table_range_lockless(start, start + size,
>> +						    &pageattr_ops, NULL, &data);
> x86 has a cpa_lock for set_memory/set_direct_map to ensure that there's on
> concurrency in kernel page table updates. I think arm64 has to have such
> lock as well.

My understanding is that it is guaranteed that the set_memory_* caller has
exclusive access to the range it is changing permissions for.
The x86 comment is

Serialize cpa() (for !DEBUG_PAGEALLOC which uses large identity mappings) using cpa_lock.
So that we don't allow any other cpu, with stale large tlb entries change the page attribute in
parallel to some other cpu splitting a large page entry along with changing the attribute.

On arm64 we are doing flush_tlb_kernel_range in __change_memory_common; and also, the caller
of __change_memory_common is required to first split the start and end before changing permissions,
so the splitting and permission change won't happen in parallel as described by the comment.

>
>> +	arch_leave_lazy_mmu_mode();
>> +
>> +	return ret;
>> +}
