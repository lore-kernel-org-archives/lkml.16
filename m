Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2046.outbound.protection.outlook.com [40.107.212.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ECF19F40A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744779995; cv=fail; b=kDfVKSB6NKXOo87NN+jEXE7SLF+1FxWe+qF2ZbRoKPn/FzYZNa++kUf6HRRnztIXT4LZkefRL6zTxrwwgwyRLbL5jOLsAdNN0Nz0lDyKLz6op24Gu8E1RwvT5dckZjtEUF5ciQW66lUHXtucP5rwUF1AUbpeblWUJQynlksADPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744779995; c=relaxed/simple;
	bh=Hf5R7VUZoTihHXL6CCP7G5PDUIfOBq+M76IT9H354Gw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A0Eqdn5iLPBtMrEH0EI3k/sayjVm5viiXfAliL7D+mmhQu25bV4M8kZhN6QHRninTLlP2OVukU3s7FBM1RlmO+vmzSxqKsZUAQXTQj8RggXFk4oNEqU4aCyT9wIeMC2/2opf7N+A2xM9/SnT+RbY86EqHBbItuLBq3kUxNZKRpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oQscXq15; arc=fail smtp.client-ip=40.107.212.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oQscXq15"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyLrYXyM9O2IxA9N902DEP5suy9Xnj1BXRaciGGrTEEyYCIZcfggO1dVkk1JVVgEyQTXVlc/heeW2smreL9GLxfZLTSsCG75M0amvPCAwNcUDj57ffG28QeNwa3tPhMp0knKi8kcJc8VnpIVidunc1NkAB9VI95wXS+qTh0fxAOHl/G+iLGiNk42UgOI22cIpz3s+mjkEg7y39e1WOs7EpK5Pnq9rM5lQESb813EaP2Dbx86b8KrJNgp9XP73bV92vAon0D1xV28D6ao7cBbmcLyh4nFNG17B/whmsrz+YtpQFFGodh1FGo2uPnTEQUY7BRaQd4en4vXXIPQwW6MMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHOTz5aiUV34aa0kBEcJN6IXgUW2CpxT+GR5DO3Rotk=;
 b=YUSt6SWNJNLs6hh1AV5RoR301XmPLft889NMyiBbA+3ze7l37ud148G/j5DPRAkM7s45r5jZkYiSKn5pKxC6Z0fCxC7v86WqPNkQYdTwvT06lIdb/ZjKLS5/ZADHoZZmSN/YfH+Mpvz4HKWpV6dGs9Y3jXmNyVr4dLmShcZ0LEj7ZV0+6WzDyL+EEI7g4Ath05i4pp/Hir9LzLChwqknequzeuQ6FJfZzG5nr4yEU3pyopPhXs9mxQ9BshXgdEHHP9SPKzCbrBZHCVIc+q3gdybI7aInfiq6uvCgFf/YYXRqFW8MvNRPHewkxAk+NqK9IEo6qTgIjrgUF21tlxEUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHOTz5aiUV34aa0kBEcJN6IXgUW2CpxT+GR5DO3Rotk=;
 b=oQscXq15XuEadsq+Yqh4cYxzgmEV1TuVncl7W2PFFmjdjHfsbmbuwiSBPpAG2BQhxQfFI2QxoGgNz7AyFNG6hGGK4lLWb7DlD3qCZhOKWpb6BI1IsiSwhIAvoXIqFBR1CR+3v0zj0v37yeydIA8xgqCQvmIbAVMFFr0HGerPCHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 by SA1PR12MB8917.namprd12.prod.outlook.com (2603:10b6:806:386::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 05:06:30 +0000
Received: from CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7]) by CH3PR12MB9193.namprd12.prod.outlook.com
 ([fe80::7818:d337:2640:e6c7%5]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 05:06:30 +0000
Message-ID: <929198a2-6b3b-0f1b-3f36-cd8955ca6f19@amd.com>
Date: Wed, 16 Apr 2025 10:36:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] irqdomain: cdx: Switch to of_fwnode_handle()
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
 Nikhil Agarwal <nikhil.agarwal@amd.com>
References: <20250415104734.106849-1-jirislaby@kernel.org>
 <51bea79a-31ac-4ee1-e646-2af138017ff4@amd.com>
 <120b0320-b5d2-4fb0-bcd4-68a767a51a8b@kernel.org>
From: "Gupta, Nipun" <nipun.gupta@amd.com>
In-Reply-To: <120b0320-b5d2-4fb0-bcd4-68a767a51a8b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::7) To CH3PR12MB9193.namprd12.prod.outlook.com
 (2603:10b6:610:195::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9193:EE_|SA1PR12MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: fbcc7d4b-f0c7-4d8c-4b17-08dd7ca47295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHZGbFlWdHpUcWZ1T1JtZzZVUjJHOWlyV0pCYmwvcXFJRXNEdng3U0I4WFNI?=
 =?utf-8?B?MjJNSnEyTWlzU2oyMGVHL1JyQTgvcTVYbERONDN6d2k1MG5IMzBqQ2FxK2Rz?=
 =?utf-8?B?M0EvVGsybllVQUNaOXJNNHB2LytxRjROcDJiclNZdTMwYk9hZ0hDQWhvc0xZ?=
 =?utf-8?B?WEFzbzBIVDYxaVZOdnI3ckVidG1TUHFGK2ptVGh6M0dpc2VLZ3BVOXlmeU5x?=
 =?utf-8?B?S3haQ05OQ3hNZCtTZ0tBSGpQQnlzRTRlQTFNVE5RRFFOTkpEaURya3ZxRSt5?=
 =?utf-8?B?SFpudDEvNi9XOWF6VzByMEJHeGZYTmUzYVVteE9PZERUa2lUVko1WWtva0c5?=
 =?utf-8?B?dmZscTJwMDAvaUl6c0ZLdjYwMERuRjYvMm44YXIvWXpvYmdaa2dkK3o4N0pm?=
 =?utf-8?B?SVlHZG14d2NqVUQvWGh2TlMvTE80MUszV0FZaWNLVlZqSU9yUW12VzRsUHRm?=
 =?utf-8?B?VEJ5QnNUaytjSElWVWJxWHd4VXR6RUpKemM4UEZJZC9zSWNBRjRjL3dBbU9R?=
 =?utf-8?B?VmZXcWVRTStwOTMwL0pwMTA0Qk1WZDVrVldUVUpUQ1oxWTIxQ2t6K2g3eDJB?=
 =?utf-8?B?ZHlPR3I2VW5CK090cWphRTQ4Q1VrRjdxdlU3Rk0wbmNpeXQzRjR3bDl6UlJ1?=
 =?utf-8?B?bkp3NXl6YUUyRlVTYXdsaFY0WEJJaHQ0MDMyZUtxb0FGdDc2bzdwbTdrNGZo?=
 =?utf-8?B?ei9hMzF0dEpJM0IvV29jMHUwWko0MzRRZzZzTnVTbW1PaU0xUFBkam5XMGwr?=
 =?utf-8?B?cy9vLzJjUERXNkxnZ29GbVA4d1hTeU9GeVhDcm00eHhKZGQwSkY2NUhCWTR4?=
 =?utf-8?B?TXhWUnNWY3Z1SWdiTnFiRDkxUEROblBvNUd6S1Izc2dmYWRlazd4amVVbncz?=
 =?utf-8?B?aHpwT3dCTDRIcVlyUTRBbW5iaHpxdllRMFphc3JjeVdSYStBazNnNmZwcklS?=
 =?utf-8?B?UldsQUdkeWlZOUtKTkV2YldRSUhxNzVFOG1aMWJYdHprTXRLKzZRYndBbit3?=
 =?utf-8?B?WGhyeUVoRTBMZkhIT0VvYy9yMDBBeG9pSzFHSmN0elgzTXp2UWliZWtBVStP?=
 =?utf-8?B?TllqTm1DQ09HeEQ3QmhUcnJLSzVBQXh5cEgrMzM0SU05Y0dpb0hPODVFK3FL?=
 =?utf-8?B?bWl5NmpQZk01bHk3SVF0R0JjTCtOU0dERmVVRGQ4Qi9sZ25MNlZsVnA0RFha?=
 =?utf-8?B?K1ZkSTJvYjE2WUp2M2FWMk9QdE9jQlZGTllPQ00yY1BRcmtyNFBkem93M1k3?=
 =?utf-8?B?NmVEalNEQVM5bHZwbitRUmU4aTBZdno2V09tMXhNc3I2MHZoZS84cjdjcjls?=
 =?utf-8?B?Rlk2WE96VVhQanl5Q1NuaXh1TTYzWE5ValBRMm04TGlFSkhyWldsd2o0ZVpM?=
 =?utf-8?B?K3Q2SlgzOTZZRzN2cnZ1bHF6NXp3Q1FENFlkMlBLQ21sNlZXdmhwNjZzMms4?=
 =?utf-8?B?SUh2elN3TkxTUEg3SzM5UTJ3SnFENVEyUkhleGpmRXhKbDVvSER4N3Nmcy9P?=
 =?utf-8?B?UHVoTmJwNnJTWnFkb3lSQ0VWOU1tSTBsNG5NejJHVEJjZGpWOS9OWlBqYUYv?=
 =?utf-8?B?d0g4L2FDVFJJc0hsRWJSRkpuNm9TUkludWtTNEdTR3ZFRDlFdVBZTThpVFc4?=
 =?utf-8?B?TFBiTnFmbWVzWU5NcXBUVXdqY1hqRThHL3VwemJQa0NwaXB4OGtyQ2dqWUN1?=
 =?utf-8?B?RGFFdk8yRm5NcmoxVEEvWkZsM29aOWUxbW1yTmUycVVKcG5CZC85M0xQZXVz?=
 =?utf-8?B?WlhlUlhCYzlrK0tUbWw5aUhabUZiRkFOa1N4UGZLNDVaVmsrUFM2d2k5d2Qy?=
 =?utf-8?B?dlZVSUZ5dU9KSmtrQmtqVHRyMnpnYk1KU29MbHJjSjJvWFFaWGk0QmhJQzU0?=
 =?utf-8?B?OExiSEpzM0lLeks5bVB5U0hVdDNyeEtMK2JLTmtobnZZM3JSOVFBUmkxd0lZ?=
 =?utf-8?Q?gjuz6tJstAg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9193.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0pOYkxZRlhVSFRpeEhWNHpvM0xUcXM0REk4Tjl6UE9OcmppcS9yWUxCN2Vy?=
 =?utf-8?B?a2F6MThkY2dEemFDazBscVNBOEF3cWZudzdLZjBXOGRsQldvS1dNOFhuK2Q4?=
 =?utf-8?B?ZTU2c09EbDYvMUtvelVFQnR5M2xMOTYzbkxDaWlXa2JFU0IyZmhLRmVhaWZ1?=
 =?utf-8?B?dTludXVpNUF3aGJyYWwxc0RDMW1Gc0RTL002WUNscUJSUWJwQm9Kamc4VDRs?=
 =?utf-8?B?ZUZLTFJ1VE1TbDdvMU9yL2FhWW5Pa3U2YURkT01WbzV2bmhYdGljRUFJUVc4?=
 =?utf-8?B?eEZlTDAzK3pmSy9la1EzcUx4amt3bVFuV3RXY0QvSmZIbzZvK1RHQm1qcGk4?=
 =?utf-8?B?clhBWFJXaTZmZng5bFAvZktNalpraSs0aEM4cUl6bWFoeFU4YVNXOTZYUW1O?=
 =?utf-8?B?UDB3QzRoaDB5NnA1cExHQTN2SHZLZklYT0orUWl1ZWpQckV6Zks1aTlHS2ph?=
 =?utf-8?B?VXJwTDBhUE1jdzJrc1IrTEFCeWd2VjBZZVZqQllWT2pVWnhEYWRrR29rRjZT?=
 =?utf-8?B?eEhUd0NQWGJlMFZsckNiWjQyWEtUM2dIUU1NOHpub2V1bjQydi9YdWN6Nys2?=
 =?utf-8?B?UjNQUmhTSmZET0hDWkJNM1Q0WTFHdW5Uek9UNFd1K0ZsOTdhS0haQ1ZVR1dS?=
 =?utf-8?B?Tk93RjhOeCtyTy9uY3B0dDFUVEx4MmxvN3l2L2dnMjJ2U2hYNGRSUXQ0dmN2?=
 =?utf-8?B?ajU0VzZ3VnhENkVaOXhHMUNYVGNpWDJkVkZBYWJRZTFiK1Y4ckQ4Z29uSTlz?=
 =?utf-8?B?Ykh1bzlOemFvQVFKeDViR1RsWnl4amI0WXFwOHdSSjYzOWhTekZHWDZGblAr?=
 =?utf-8?B?Z2t4RVNPY3Nma3M1cWhVYzZhVC93akpTdFh2OGkzMWVFZWhrTnBpNWNYczQ0?=
 =?utf-8?B?QVFEYUJaS0VhUHV4U1RwdlVVeHM3WU53RmR4NDlyNXZuRlFjOW5hem9qVDV0?=
 =?utf-8?B?SHFXNUg1REVHM3duU0FsQ2tScytwNEhCQ2syOW1wVVNUUHdscXkvc1lWZEYx?=
 =?utf-8?B?aXBoTkkzckppRGwraDVXdlYyY1Y5UVhob1V0TnR1RnYvWU1veERIempMbEVh?=
 =?utf-8?B?c0pDYUFFMEFzUzZPd0hSNU1IZnc2NjFaSVlKbVNpdzhqVnRidlVmT1JMckZF?=
 =?utf-8?B?d1FMNURxRk9MY1hVSDBOeVhrd1RvK3VKUDUyWVIxVStqN1hFb3VVS2FBdTJr?=
 =?utf-8?B?dk9Ba3NpNlR3dGk5bXY1ZVk0Q3p0ZlhNUnFEdjFzbm1GOGR0YVFTWGN5eUNy?=
 =?utf-8?B?RmxpSUw5MTJldlU3bjJBalJFM0lVbmtyOElFT0dhS0VGSzVRVldlTVJDdWVC?=
 =?utf-8?B?SWxGSUZNTnIzT2tiaDZFaS9HNWY4OWtBY3NaMW9JU1RoL2xaanFYejhtektk?=
 =?utf-8?B?bFVuUU54R244dHZPUmxVZHFzYVFFQU9lSzZpU2MwQmIrSmZJOHhLVUp5cHZO?=
 =?utf-8?B?VFh5Q2ZwMitUVDlGTGNmY0ZSbi9BTGNFSlBoQ3BCelNrNGp2NjJ3c1BydExn?=
 =?utf-8?B?RUhiaklIOWpvblFob1QyMHRlWnFpQVdSRVNwTUpZdGM5cGVreFBXaVJhNlhY?=
 =?utf-8?B?c0d4MUJjSTN2S2U2cWZpNk02a21hdXBPSzNETTBlRGdwRG5pVWpIZEluWXMw?=
 =?utf-8?B?V2J6cGRBSE1oOEtCVG0reEZJSXBzKzc3M2pCQmtEd3R2TnE0YVhPRnlGbkN6?=
 =?utf-8?B?N0piSXBjOHlEZld6bEFRRHdVeGE2Q1VuaDUyNW9NRHFNaTZSMjhpRURjRUNT?=
 =?utf-8?B?bGdiTUF5WnpUUkRqYWRaQ3NDbDdJbmJLRDkrM0g4V3Zid21BeW1ubjNzRkFT?=
 =?utf-8?B?MG9sZ2ROdFErQkg4UFdjN3hNWGlUOTBtNHIxcDFDWG9kakNwV2ZzdjVPbmps?=
 =?utf-8?B?cVdDemZheW5hWi9QWjIrRy9xVGRyNHE3VlhoR0ZBQVkzaVAyS3Q5TzVPQ1Bj?=
 =?utf-8?B?Q0ZkWjB0VGlyMVh0UVI2QXJQRThlUW1uQ1A1SnJDYVVOcEt6QW4raXFyYnFh?=
 =?utf-8?B?bEZIcVNDUEwyWXZHa1VzM09KRUd6blBWbSs4V2NTdzIzNTdNeUVxa0lRQ0VM?=
 =?utf-8?B?YlFzbithREhMZ1BEenBkbS9oSEJXb0FzeVJTM01zcDdVTnlQVGpQVFFxT1dV?=
 =?utf-8?Q?Uo7R6ezh2RZeE91N3pq6KIG/8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcc7d4b-f0c7-4d8c-4b17-08dd7ca47295
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 05:06:30.0034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tqEXYhlCxk2fYm123o2skNw/i8PwCUsZFvnZZEZ1+nosnYhEPW/W1sXM6LYUMsX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8917



On 16-04-2025 10:28, Jiri Slaby wrote:
> On 16. 04. 25, 6:30, Gupta, Nipun wrote:
>> This will go via Greg's char-misc tree.
> 
> Ah, then I should've sent this to him in the first place :). Uhm, but 
> MAINTAINERS says:
> AMD CDX BUS DRIVER
> M:      Nipun Gupta <nipun.gupta@amd.com>
> M:      Nikhil Agarwal <nikhil.agarwal@amd.com>
> S:      Maintained
> F:      Documentation/devicetree/bindings/bus/xlnx,versal-net-cdx.yaml
> F:      drivers/cdx/*
> F:      include/linux/cdx/*

As a MAINTAINER, I/Nikhil need to review. We do not maintain a tree and 
patches go via Greg's tree.

Regards,
Nipun
