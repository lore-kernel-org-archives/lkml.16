Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A34A1A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744777823; cv=fail; b=X8rUYkzA1VUsB26taoq/s8wMUz/dSwydbb53Ryxyt+8DZUszTjOnkAny+LtLafEAhRHjSq3owiLgCc0Pr5nwYoJEVY3Bn/W9ECdXvShvr57tVkMDC/auu2DkjAf/wGrDDhsB5SmA7/B6oKADKpXVn5KxwDN9xAv76YxFmjltInc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744777823; c=relaxed/simple;
	bh=8xKFIgdBQ6eRsnjha94yeLKIptWlbZfQJf9tOipWwto=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WsvTgkBqCfcUuTj0/exXgQv5bIUbT+f2UVP2Fsp3HZOmivqLU9moXcCAclf5U/lJ2hxlS6i7eyTIhndzFQkmSvT7fAW7g/qHlAvw0lG4tWB+By/6qXAzkwJ69WaNyeuI5OXLqooWj2tygHDdSMz1ps8A5ip+WGv9KWkUWUUaj6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CIlxygSo; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CIlxygSo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9BEHaW2ZZlart6xWwvZTTL0r4Oy1ybo1Ek3bNGpG5jkl8K6iJ+7Y3kdrB2rLkQ/9EYOWBpEWSLE1uiVCNtKS1fOQl749xA9vxtHFh+mG9uKmtmrOL44SxA+LHNn1kENC3yqNrZFx+EQ2XkIxLvrGmlfICdXZP1omVhD2fo3FAqAcMFcwq6S4vF3IeA0tkvxiDY8g4Ny9OjzNPZ7EvSEqGTEd9lqDN/3HSUSySEyBmv/sA/y3j/lqGkXs26lPdOsgp9dvMszGPQFwH1+tIEsIVYao/s5V/Ej3YXNtJDbjsBxIsn/icbVSFjKY5yvpcajZZQLbU8ykAoPQdGk7VnlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/xznftPiVqzsYDMvBVpymyIoz22LkWqJkV9WeGKRTs=;
 b=pwUu1Tnk2YP8o9g9ppJ4VLvsxhwFiJc3bHjCt4QxF4MhpAk/eNLkwiOIh/8rql37mWyHpLnGGK3+UimwHmylrb6j4wA0NdSakLX3Eqs3jy7Mn+obSt9Q2AkT4VFy/rzgiPNXgfDn+A705tVuweqacr09uZfjcs85JtTa6TeBnlVHdQ4hH44bxGBqLcWVchUUVBrBKAiEhVLpa0fo4ubSu8j9AKD0o1qs3ufX4oqShPGUoxa4JMWZDHoPbXiieCdBaMA00+XXybK4Csg1Xkm0iZNahYGjsLD9Y++ViInLYW5ueD0beEn6UZNRJjBPGo5l4+jIOk2dVnUwXEJgB4M+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/xznftPiVqzsYDMvBVpymyIoz22LkWqJkV9WeGKRTs=;
 b=CIlxygSoYPVesVLXOiCGQtHggaYPviIjVjvfZDvGpogP158DQLp0EumG5I70Csjn7vYV6BEp/SOTWgtVKXXCa7Q5lp8ZOElzCpmvu49MtaM1VLpuphc5sg6GlDVxZMhEOvbSPd/eZaOnvA5y52LfnRf8mYaIpa7gf/FF44O1D9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 04:30:18 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7%5]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 04:30:18 +0000
Message-ID: <51bea79a-31ac-4ee1-e646-2af138017ff4@amd.com>
Date: Wed, 16 Apr 2025 10:00:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] irqdomain: cdx: Switch to of_fwnode_handle()
Content-Language: en-US
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
 Nikhil Agarwal <nikhil.agarwal@amd.com>
References: <20250415104734.106849-1-jirislaby@kernel.org>
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <20250415104734.106849-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::16) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bdc44da-999c-4dbc-e9fa-08dd7c9f643a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzlVNEJNaXVRT1ExcDVsOG5tRnc1S1dhcUVob1Vrb0xRRzh5REtNSnQ5dVBz?=
 =?utf-8?B?a1FrR3FzZlA0WlE3bW92cktTVmRWV0s0c3c3L3g0Ry9ldUgvd0Zqb1pNWnl5?=
 =?utf-8?B?TmtsaDVrWVVoQi93Sk9IUVJnTllpS3c1UDRxOWJnM0pqNm1zMGhxRnR5cDcz?=
 =?utf-8?B?L0ZjZzJvMjVnYkEyRVZKTFBPelBiS2xvMWY3Z0UwSmkrcy9BMlhFS3pSc0Rx?=
 =?utf-8?B?d0ZYcDBlZlR4VTB0U0xsRkRUOUN0bDVNWWFEdm9ONWF5azZ6K1FJVGNWWUxi?=
 =?utf-8?B?RXJudHpWc1BzZ2Ezb3pYZGRJZ2xkY0VBRU5iYkhsZ1dBMGNuejRtVVkyVlpR?=
 =?utf-8?B?ZnZhck84NUZMVis0eUFXYlVyLzhnS21WUHRiLzRHZXpUU0ViTmF1MDFld1Rl?=
 =?utf-8?B?a1pZM1MyUEpGZ0FMN3VOOVNoRTZVVFVwWkQ2Ni84OUs2VWNVbUJOUHN4Y29Q?=
 =?utf-8?B?U3NpY1pQT0dNOUluV1REWGhCbDFtbmhyOU9jTzFtMm5aZmxDdWxpVTVZL3ZO?=
 =?utf-8?B?TXU1KzRQSFI0c1RVV2R5RFVqTUY3MmFGWm1Id3Y2blFKNTA0ck9SaXZaQmtR?=
 =?utf-8?B?UkhFQk13OGFLd04vVFExWDhLZG42Z2MwdkUxZUVFOXdjbjJNUllBU0h4UW0w?=
 =?utf-8?B?NjJ6bnJ6bmdIenlxUDhOdHJYUHREYjFScDlJSkxWWUVQaDlScUdGNnVwNTB1?=
 =?utf-8?B?dWdsdWtuK0Q3Y083c3hjNTYyWE9WeVVxU0hKa0YvV0YxamdSRGZFSzZMbzVo?=
 =?utf-8?B?WG03NkcxRG4ySmJNajZlditLcTdiV2g1UVFKWTVXNkRmYWQ3QnFLa1NYcWk3?=
 =?utf-8?B?cVBWaUpob2k2a1BxSTk4WHZQVkxUVGFtQk45aEpoTzJNVzlJeVdOc3lYWXVC?=
 =?utf-8?B?b29hc3ViZlVud2ZYODlWZ214MlBiZzc1dFVJMm56U28ydHp1dVFHWjFHSnRV?=
 =?utf-8?B?aHRNUiszdXU0THhoZHdQakpYN1Y1eHFRY2RIVUxUWDJBbXZzQmxHdlQ1elRi?=
 =?utf-8?B?Q3BJWDdadTY0OUtQN2psOU94dHNzTXhuQ2JPK0MxMjUvclBMajBuNlZad0Yv?=
 =?utf-8?B?VDAxWllYbTd5Zms4VElkSFFPQ05JOVphTEo4ZWxkMXZmODZSbTRVSUlYSlBS?=
 =?utf-8?B?MVNyTE9Ka1JMU0dTUlg0ajJkU2hjeEtSWThmV21ESlNZUkRoYUYzalJCRVR6?=
 =?utf-8?B?dDdDTlV6bjJ5emdkVWYzZXdLNW0vRmI5U1NsM0ZIaDVYZDVCOS9ibFVkRkkv?=
 =?utf-8?B?c1JoZkQvM2R2YVZlS2U5NGJWS01nbzhZZWRzN3dBRG40N1crYi9GRjdFNEdS?=
 =?utf-8?B?OXV3VnB6empaYmYvVFoxYnAvN0x4NGppN2NwYTh3ZmlwVEUxT2ZuQzNWVVlS?=
 =?utf-8?B?STV1b2xjcGNpNHhFbm5RWklhSEVVaGpsSG56T1Z6Q3lOaEI2MTdlSEpiSjlL?=
 =?utf-8?B?MncxdTFvWjNiTEN4ZXBZb08xNWptTmswMEhDREFnbzZBVEwxVldJTDc1aFNH?=
 =?utf-8?B?aThpdU5HdHYrRkIrWC8vMzF2ZEM1ZEdaMmhxWWV5MmRaOU80dWZNTkN6OVlE?=
 =?utf-8?B?NTRQUHJKbjNUYjNVZXdGWElwRzREQ0RXQXpvWGk4WVFHRndnY3RrZ1FQYms0?=
 =?utf-8?B?SFZWNG1SZ3JuL1dvOHZybkZPZER5OHBxdVRDSzVSUmdZNkhSSm1FdW1NSStW?=
 =?utf-8?B?NHZYNXlQTzhQdlFIRjI1QUxxSkkwY3NWTmp0THROMHZaU2doZzZwNFltVjZv?=
 =?utf-8?B?T0ZEa3lvOThLaUVwVFM4WjBDYzhHd3VqRGI2UEpKbHFPUW5uL0ovMGk5Z3I0?=
 =?utf-8?B?KzJwbEEyN2lpUUtQcDljUVZ5Vk5YdExoeHBpbk00YkpoQ1NRUWFzY2E4ZnhS?=
 =?utf-8?B?bnNFc0RvVHdaMFZGK2xzZnpVUG1JelQzWS9HYXFGVlRweUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9193.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0hRWVVTcERqWFBnbGROUnNacEF0bk1jZ2NpTHFGQ1RMUlE3UE5DT2pFZ3hz?=
 =?utf-8?B?d0VtNFM4T0VjZ0VxdGdrUzlwRXFseTg1Q3JQSk5CaU9Ic0hpbUNFcnpPR1l4?=
 =?utf-8?B?TDBaaVZGTXNTTkp1UzBNVzdsZUtnTHJEdTBQWWRJNHdhR3ZKRGg1TC9Nc1gx?=
 =?utf-8?B?SE53Zk90VEhodlY5TElsQjFoSk4za0I3S3pjaDBlcTBYZmdVM0c0SGRSZ2Fs?=
 =?utf-8?B?aTZIYjhXelUyTHVDamd1Q0JySGZ4ZHN2aG92NUhoUjBVeW9CSk5FYjZNNjFX?=
 =?utf-8?B?eWNqS2NWaGJDQzVTYTJNVUR6WXJVWklqbWRyR29YOHoxZkRDSThqdHpwU1I1?=
 =?utf-8?B?dE1UVTNXV3Zya2xhMzNVdi92VmtremZMMjF5ZUJTc1kvamNOUDJpS0JicWVt?=
 =?utf-8?B?MDN3em5uWFBRTDZBVXExSlZKZWxKM1hNMkVlYUJPRXNBMjJ6emxDd3pybGhx?=
 =?utf-8?B?SmFCQ1pQNlR0alppdmJONWFCc2pyckNoUnVhdHZ4K1hpY3hBbGoyT2lpMHM3?=
 =?utf-8?B?Qm1ZMEZsZ29HaHoreTB3OEtHVDhCazlMSGNoZ0lWN0xqU1dhTlVNZFArZEFK?=
 =?utf-8?B?Zk9UZHRnUFRvWE9uSHgyY2Z2aDdxNlpKd1FacDhKcTNSMkxyVmpRaWdMK1Zo?=
 =?utf-8?B?ZmpoQ3pwajZUN3M1LzU1TklqcU1iaVIzNEQ1WEpCNThyNGNxY1cvZkhUWHFT?=
 =?utf-8?B?UHlJWlpVL1JEb0dZVWFXRS9tTjVLRFRlTzdwTzNKRGJ2Z1ZFVm5JZWVTWGpx?=
 =?utf-8?B?WGppamRSVllkZ0JzNitmSWRGVXBHem1hM1hzdjVUblV2WmIzaVluekltenNy?=
 =?utf-8?B?R3ptYkcyNkZPc1ZvTzkzaGJ2QjZmM0lJZG1xN0tGUHJSY0xZbE5wNmVLQW5G?=
 =?utf-8?B?ODVQZ1VjUE5SMDNWb2wvRHBwbVREK21EM0lBOC9MQTlEWkR0Zm8yeVo1YjBv?=
 =?utf-8?B?Nlc1OCsvemYvTzZQbmJwdEo4OWpqVWFDT1JHOG4vWGF6dWUzQXpMMVRrVDNz?=
 =?utf-8?B?MmVFN3dQNTdtZXBEWlF2aExSS0tFeERpaURSSk9KWm1CWitjTVc4QU96K3ly?=
 =?utf-8?B?YmpQelZQWnZhNm5KbXk3TnNqdDgwVDlVc0YvTlczT3JBNGhkRmY0Q2xyc0V5?=
 =?utf-8?B?ZzU4K2orUXlZeC91REhEbHIwM2JSb01WYk93RUd0bXdiNEhnVDJwUUJuR1F4?=
 =?utf-8?B?N1dTZjQyRDcwdVZLRVpVN1VQRGFic0VMTytLc3VlNEVBaDdrU2czdWJ2QkYv?=
 =?utf-8?B?bjhCSlByenhUek5IWGZEUGdwKy9VcVVpQmZyZEZWUUJQYWNnTUtRU2pKSEpP?=
 =?utf-8?B?V2RYbnpQYmhoVWNzMW14TzNSZFFBRGdyOFNLNGxGdGhkZjVhS3NRUkN6aUZ0?=
 =?utf-8?B?akVvdGx6a21TclYwN3g3dTdJQWlzalVqZGMzZXFQcURwMGhuSFZ6bG51SFQr?=
 =?utf-8?B?QnZvWWd6ZXFQV2V3b0s0YkJZekM4OFQyelhDT044aDhvVWw0V09LRWFRd1Rv?=
 =?utf-8?B?bGlqcjhKUFBTd201S25aUWdBS041VjhISXJSZzV5VkZSemdZOGxPdElWcmJQ?=
 =?utf-8?B?anlEeFZUL2dhRTZMay9ZM1RkVExkSGhZL1RZMEI3K3k0WE1yUlhCQm52V21D?=
 =?utf-8?B?YitTdHFCWk1CeHAyL291QnRWZUhnRUwrTTlqaVdWb3lmL0twZS9LT2RpWlY0?=
 =?utf-8?B?TjZsbkYvMXYzWE5VMkpSR09tc05NY0ErOW5zQnVxdEpDeXJlWU1aZFVPTjFm?=
 =?utf-8?B?UlA0QTlLdXMxNjBSSGdYTWIxaEt4YnVTMHgvajVHRVhFUG1vL0N6SUpjazVD?=
 =?utf-8?B?ejRKMlduN0dDdXplbnhBM0tjNTJZdmYveUg0Q2hVQlZGbjZTd244YTJDSEdO?=
 =?utf-8?B?S1hvRXRNYXBad2FOeWFDQ1NZSUlrODJWaC8rMGhFd1dyaXkvYzJNOWMzUDEw?=
 =?utf-8?B?OFBDb0xlUkQwdlo3dVgxMWZ4SVgxV0dVaUxCL1VQL3E1WU9ZOUZQU1V1OW5M?=
 =?utf-8?B?bGJMSkZqUkIzaDFBdTlmVExOakEram5LU1gvZ2thOUZPeThpc2lXUC9oZFVW?=
 =?utf-8?B?MWVEZXgxTm5SWXFQd3NrUlo5czF0blQ5VGhPcVcrMFBwaXZnaVlMWmVVb1pB?=
 =?utf-8?Q?d1eKXwL+Wv5aTE654DX0N7NPl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdc44da-999c-4dbc-e9fa-08dd7c9f643a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 04:30:18.2905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ev8R4wwGJcsMhB3vb2I3JHZsuGiPuIj4+N/b3+/VrzRNFP0HeC9VDLDfWXzI12OW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958

This will go via Greg's char-misc tree.

On 15-04-2025 16:17, Jiri Slaby (SUSE) wrote:
> of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
> defined of_fwnode_handle(). The former is in the process of being
> removed, so use the latter instead.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Nipun Gupta <nipun.gupta@amd.com>
> Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>

Acked-by: Nipun Gupta <nipun.gupta@amd.com>
