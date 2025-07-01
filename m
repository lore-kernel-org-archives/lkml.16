Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9796E235355
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367624; cv=fail; b=Eme2asUbBtl0mx6BOVhAEs536vZ68CjC08kxE6fsy3dn/Xr4AyuL6fgbg2+tgoTH4agMGdlzOrLaojO3JKIIK+F0MQzYHD10Tj+QfJVuPSjc5vBfuWjR0MV0aZ7zriXxaiU+qK6qbQ5eyaeGZDoLixOi3B2lY8bGDwTyyiuZqXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367624; c=relaxed/simple;
	bh=nvDW1WJm8YC6R4hN3yaHjr+PFTtKg7f3aOMtxpOXA1s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WJVDIQFmaE0iLAVpWDa6UjmNIZ8y5Kn4xauzZnsaztdKYu5f4byXVGxHPb3rVcfHKP6PJmA4Q+3FbEe1VLrVdNsJK2uA3DAZpSy1xzayunmFbHqQNIIg6Ow3CHpy+L5fwKkb+q8E2xwbrRNAKA+75kPR2ItdwgZlB1cI9rLfHEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g5SpfAl1; arc=fail smtp.client-ip=40.107.244.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g5SpfAl1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGVYzo6514Tvc7d7dbwRqTDPURDIgucsIMfiLeOvq53eSXObdmnSWfABV6r/yBzWzlWs14QEPiah7P90sPjT+OZk582TQgOskOHq+48/jnhC0+fKm3uG2pJHPjelqbMZTgfJ1iO+Mb4Xw2O0H1VT8BAi2fXwky7dJqJiYbmjf5boutFe1+sm6hIV8sNCgQ//bQ8Z64GLAWAoSiJJ35Z4132VB/YtcerY+8vwb+zJh6sp6sYeah1Y0/zs+qmEmLIdCs7JRx81rjX0kMX4Y+c0l96YYMC8zLfEr7f8YAc2BAkpqQ6HMikHtv+tKqtvmpoE9+21zssn4fnOZyih6oE2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMOENoLC+7vltr6CwhRteG5pCm8R4CtLIUSBxNF9I/A=;
 b=e5zjJiMWhs5r1dpTmfZqomIT6zhREfyu23/Dd1uM8pMYAugtBq58gVkjh+OTc2/PIS8vq5Y5InQIwUzXB77EYPmXKaAnZuiFRC2bMgihNmZCShxb4zs0+Oyr/lGbZtb+LXUwkQbm8xHnUI7HQdqDg6HOfUrwRMojPd/wcYNpzyC1cShQHuxK3+kEnJPYveLl5i6i0Odk+kZIn05IpzF5YCrTepCFYr391ZWtL4NsYHvN2W52XFcNhKc7pQHEiKQyGHm22yuhbNyvZJo71qpVcPO4t/Jp5HOmaS4ebl5E+n0G9QAejNv0iqPToq1X5Q/SuwH7ZTPUSEUwOu1fFFl5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMOENoLC+7vltr6CwhRteG5pCm8R4CtLIUSBxNF9I/A=;
 b=g5SpfAl1n6OxZYa/e91hOqo/yu+3PUh4kfr2LETR2VKsh84+tf+NkJPbBWz8wQDsr1mJazn7Pp91ElAE4NOteloXpGC+9yjiTNpknzb4lRttCD6KT5sPh6kbUgpZj+zF1BxQCmPyQ06/Cg00vMJRp4bNqeBI2Ak2Y/cy9saeAlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by SA3PR12MB8811.namprd12.prod.outlook.com (2603:10b6:806:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 11:00:16 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 11:00:16 +0000
Message-ID: <3882929e-d4a1-48b3-b518-1582e6e1c872@amd.com>
Date: Tue, 1 Jul 2025 16:30:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Skip uclamp_rq_dec() for non-final
 dequeue of delayed tasks
To: Zihuan Zhang <zhangzihuan@kylinos.cn>, xuewen.yan@unisoc.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kuyo.chang@mediatek.com, juju.sung@mediatek.com, qyousef@layalina.io
References: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::8) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|SA3PR12MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: f01e989c-7def-4304-4086-08ddb88e75d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDlOazJaaHlJcTU1bDZwRzR0a3htN1hKR0FLakh1MHZwcXVDVjdTVUYxS1V2?=
 =?utf-8?B?enJ1U1dFc01QeURhdkJYOWZoaXpIU0pSQ0liUEl1ZUdQeW5sTkRVZGp2cUNu?=
 =?utf-8?B?WkdZcmZGUTNFeWRQdVA0VnhNcXQrSE4xL0Q3Q3lUOENJeHk3RmtINm43Sm5E?=
 =?utf-8?B?bmlKVmNxTm1UYXpVNGl5WnNnc2U1L2lFNkhZc3ZmTmxkTTBRNEdEWU5YMzh4?=
 =?utf-8?B?SU51TE9DRERSbytXc1hCQkhYUjdmQTdCMzdPaHRRdDRQM2tIVXFhZy9LL0dn?=
 =?utf-8?B?aTNtODhwa2p1bjRYajZMejZxU0t0VmlqT251bHN0cm9sSkNMYmxIZVNISElW?=
 =?utf-8?B?MHh3ZDZ0Zk1LeUVKa2l2bFdTMm5zcGhRNXdYbnB2K21WRm9ueFZLODZRK1cy?=
 =?utf-8?B?ZC8veUZ0UERCZWNNMWRaQUs4TnFhTExEWmI4K0IvUHV0UnVpbVFwaFNwQ0ho?=
 =?utf-8?B?VkJUMm1FbVdMYjdlbXhkWDcyWHhIRVRHUEltbUMyTG8vaGtxZGM4SFc5Z1p0?=
 =?utf-8?B?a2dEMno3aGlqcWxYWXZxdG92N3RjSGY0ZjcyT2xGd0hvZHJ5MGhoTXFTdkVa?=
 =?utf-8?B?MkgrOWZUMkRXd3ZVOHhSeTY3WklOeGRRMnhQOGgyUmdrVk1ZS2d1QVAyL3E2?=
 =?utf-8?B?ZDJwZ2FkZzVYYjdINVpEUEFSeHJwVlpaNmJNTG9WNS9DTkxyekQwWjh3Yllm?=
 =?utf-8?B?QTRoUFJtTnB5YSsyTGtBRE1HeDhlVVZBeUpaczJJOFNKcGpVRk1HMHBYR1da?=
 =?utf-8?B?dG1DZk5xRnNjSUlRNUlZSWc1bmVUREtpcmlPZSt3alAwSmM3bnJ1SW9NWjRQ?=
 =?utf-8?B?R3lHc3IzR05vL2IwMUtQajBkTXdhTGdhRXZWbE5jYUdnMDVNTjRqa0tKeGVz?=
 =?utf-8?B?WVFvclNKMVFqclNyLzlxUVdzUUFscUlSbEtiSTdBYS9kMHZHL1BZN2dMVTdr?=
 =?utf-8?B?YkY1Sm5tQU5Bcm1GMndQZ2diL2tPb1hyNlVIZHpEQ2lFUDdRZzNVcHg2UzNz?=
 =?utf-8?B?VmxkeVl0S3U1dzZmdzRQbkZxYVVyemxaM3hTSGxuZmVtN01kbCtHbmc4UHVK?=
 =?utf-8?B?c3N1NUJEV3A0c2VDdTh0aytUZERvWStkVWk2VXdOSW1IcCtpUDV6R1B4K3p4?=
 =?utf-8?B?bWhmQ0dTVzJnN29mQjM3MCtmVVlnZ2xtWEMyL3cxK2RRRnFEalR4dFZwTmtO?=
 =?utf-8?B?ellza3Rua2JMSWlMTTJrdHNqT3BSNTFLdVAzdmtwOTJRN0RhRi8vL3gyU3RQ?=
 =?utf-8?B?YXA0WWJMRlpsM081NkpjdEJWTlREOHRwdEpJY0JMWGZ4WkFEbUhyRUJ4cFYx?=
 =?utf-8?B?VEFrTFI5U2tNY3VOcjdzRHprN25HalJnanRycXZwbldTeGdQVFR5TVBNYStl?=
 =?utf-8?B?MmRtUVFJQUxWVjUxTmsvbVdWUWg1WWNBZDE4ZmJPZUR4bjNTZXh0NXhycmE0?=
 =?utf-8?B?MnY3Z1J3cnRFbFROZFZ0eFFZTTMxR2xvRjNJaitsbkxKbDA0TWFLN29jRFk2?=
 =?utf-8?B?dXJHSllJcVlIZFZiVzhDaU5BWFJFMjdnRGRGemJYbmZndmNyM1d0YWwxeVAr?=
 =?utf-8?B?c3FxYVZCbm5sZEphV3BHaTBKVnZTQnpzOVFBZHdTK1M0MUpYTlBLemo1dWJw?=
 =?utf-8?B?VjJOYStTSE5KeUMyUlpLRC9JeWRwOXBpQjExNG5BUTlTcXl2TjRWVWhFUEl6?=
 =?utf-8?B?TXlONnFXdlVSQzVjd0h0eGpDdlNwZXlzSGFGcFFkWThtRXIyYldaVmRpTWZa?=
 =?utf-8?B?MEY4ZUNHdU91eC9zMTVveUduMEN2UjJWck1HN0JlbXZzODhxYkllc05GQUJR?=
 =?utf-8?B?S2tSbDNmSEZ1Y0ZsZUZyNG5JUHVoN0hyZ2pQR2s0VEgrc0FJSENWWFdsa3kz?=
 =?utf-8?B?NkRUQW9TZnJ4RjhKeXl5MklhOWZkRTdRWFVHQnplaURvd1d0TVg0djJ4UHFI?=
 =?utf-8?Q?5bcaka2W/20=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0hXeGk2czA3bU1qeGtiZ0xHbTlZcW9wSFFtSmQyay9vVkNZUURERFgvLzVn?=
 =?utf-8?B?bXVlRlRYYnJQOW0ydFB1Q2IvRWZHb29sZmtoZlVaQXRMVGNHb3RUWWU4YkNY?=
 =?utf-8?B?Nk9oNTFYUnVTWmFZQ0xJd2NnMW5QcUFmdHAzNUtpaEVEaVVpNERNMFJBUFFn?=
 =?utf-8?B?SEhBa0p3N3g4WFlDME1YY0VReXlxbDZkSU9xbWZNR013MS9McjlHT0l0WTRs?=
 =?utf-8?B?L1RrTXNZcmhrSjErSGc3M3hwbmlwK0pqWlB1R0dENnZIb1V6Uzd4OTFvNU5r?=
 =?utf-8?B?Y1kyQW90ODBjcWovQmZxbUFwSUpwOFRUSDcyeTVsV3d5ZDBOMHZxU05uZThZ?=
 =?utf-8?B?b1ZwRkgrMW1aREZpUi9YQVRUQk8xVnBzNGtkMk9hQkZ0UzFoaHZxeHNtSWNr?=
 =?utf-8?B?Z2pHUExKWHJKd2p6UDJyd2I3aEdhTGFGb1lLUVJueGc3T0xnT0pHcWdmVnJN?=
 =?utf-8?B?bllHY2o4ZWtoS3g0WEp0cUU1YWdDM0d1cGFTaUxyNEJFYmUxK3pwSXBLMEFK?=
 =?utf-8?B?YytIaEUvRWVKWTgxYWRJUUsrNXdmb0NCS3Znc1BwOXVUbnB1ckRTVDdjUVF0?=
 =?utf-8?B?eGs1MlNDVVA5MmkxN1U4NnZmem9aYmNwNkN4QVdDMUhmTGk4MVo2SFVwdUI2?=
 =?utf-8?B?MytETzJhbjRiMk9nd2tVc1pJaFBGdzNybFNML0J5MC9DSnBqcXpBazA0VVky?=
 =?utf-8?B?aFpySnk3cVprS1NWVlRDRWVsd0haQUFuRFlYN3M4dGh1YVJ6MGg0YmZ3bEZl?=
 =?utf-8?B?NEFxOWxXQWp3MjRoRXErY2pibFYyczR3WTVlQWhmclpBSE1lUDEzbTQxbXA5?=
 =?utf-8?B?QzlOTitvN1VaNEJWSjh6VnBZUWw2S2VKamRPdWFIYnErckllUXlhWk04SDhJ?=
 =?utf-8?B?d25XRUNEVDBmTHNJd1N5Q1Z5dTc3U0hFa3YrRFlJQW0wTEdYdC9CQ1hrYWRH?=
 =?utf-8?B?UjEvb1JrVWd0a3pFNnZMNk51YzJycElmZE1pMHAxaG43OVVNV01ZSnBxRUlE?=
 =?utf-8?B?YlEwU0hKVk9HdnU1WGhFZzBZcWljTnlMdW1EbnFpK3ZWZ1Ixc3JXQjhKcHIr?=
 =?utf-8?B?aUdrOE9SMG1vN1UyMTJGd3VFQWp6b2dINzNkNURRTngxU3lXQVRZSlRGd3d4?=
 =?utf-8?B?ZVhpTDdodDkreFpSeUsrcElubGxiMVRHK21DOVlNR2l0NDU3OHBodkZQM204?=
 =?utf-8?B?M3NEcUtHcG1hUVdoVFgrNnlQUWxCWkNacjlmaVo4SStsZTNwVUVWUC9wbVMy?=
 =?utf-8?B?WjV2UHROVUJrQXlCZEsydTRUMGw1T1BtMW1WaS9palhqV05pVU1yOWE4WTVK?=
 =?utf-8?B?NjJmdGNLMk9hQlc5cGhlU2JuWG9PeWxaa0ZqVzZyTGVoaUN3a3Z1QWlTNUpQ?=
 =?utf-8?B?c1hvd3hKMEI1TEtQYkN6c0x2czR0UEZDZitZNzZUSTBKaDJ5TVpBWCs3YitN?=
 =?utf-8?B?UHBmbGt6Q2hleC9oQjVoUE82b3Rka0F3elpYOVRpSFlNbFdldXJtN2wwQy9j?=
 =?utf-8?B?eUw2eDFNMWJYdkJuMHNQdlhxUnp3M1g1d3d3eXl3MnBBSmx6M2QwT1ZKMXla?=
 =?utf-8?B?eEl2akVNaEZoNjd0NzBwMm5VR1BVbmZxUkRwU0grRUhicGs5VHp5bDcwd3pG?=
 =?utf-8?B?cXU0enVXRGRZRkUwQ05lZXBOMGlsbHJrWWs5d1c2Vm9QOHZTUXVObGFhaDBo?=
 =?utf-8?B?NmdzcEVOclpnWHAyNXFFaW55b1V5MlArZG5DSVZnMk41amNtZ2tpVzF0bXlv?=
 =?utf-8?B?QnBicE8zSHZPVjU2WlVIMFdjNUhxclBCbWk2QkJreTV1cXZKRytiOTRWWU1n?=
 =?utf-8?B?RW8xUTN5NTFpbTZTSm1wYW1uMi8wcG9oUjZlQ0gwSHA4T09NSVFteHNvUXdl?=
 =?utf-8?B?eHI5bGprbnRmbDM1VnBsYkVQaHJlTjcxWkRFUEpXRTV1dzVzQ3ZicWtUZEF5?=
 =?utf-8?B?TDlzQUQzbUFFa3JYdkxXT3FoNUZtY25ucTU4UFpNZ1AyNndTTE5EbHRDY2Fn?=
 =?utf-8?B?Y3luMGd4eVRkUFRqczhmbnl1MFBkYjFDbzYraWVma1Q5SHJ0WkNtTFlielhG?=
 =?utf-8?B?K0tJdDlBcW9lUkh5YnJJZWkvdzNiYkNkLzdQbkdOSzBON0JVU0JLd09xbHpU?=
 =?utf-8?Q?ilo3vX6M/kErt1ouJJ3T6yQwV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01e989c-7def-4304-4086-08ddb88e75d9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 11:00:16.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5I1n14GfsoUfc2j2OIVsKKErVcDqGzehYuMEAVB88iO6pUiPc0ffSw5CrXagaRPuVkBkUYmCtqjviEYFgY8uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8811

Hello Zihuan Zhang,

On 7/1/2025 3:04 PM, Zihuan Zhang wrote:
> Currently, uclamp_rq_inc() skips updating the clamp aggregation for
> delayed tasks unless ENQUEUE_DELAYED is set, to ensure we only track the
> real enqueue of a task that was previously marked as sched_delayed.
> 
> However, the corresponding uclamp_rq_dec() path only checks
> sched_delayed, and misses the DEQUEUE_DELAYED flag. As a result, we may
> skip dec for a delayed task that is now being truly dequeued, leading to
> uclamp aggregation mismatch.
> 
> This patch makes uclamp_rq_dec() consistent with uclamp_rq_inc() by
> checking both sched_delayed and DEQUEUE_DELAYED, ensuring correct
> accounting symmetry.
> 
> Fixes: 90ca9410dab2 ("sched/uclamp: Align uclamp and util_est and call before freq update")
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>   kernel/sched/core.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 8988d38d46a3..99f1542cff7d 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1781,7 +1781,7 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
>   		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
>   }
>   
> -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p, int flags)
>   {
>   	enum uclamp_id clamp_id;
>   
> @@ -1797,7 +1797,8 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
>   	if (unlikely(!p->sched_class->uclamp_enabled))
>   		return;
>   
> -	if (p->se.sched_delayed)
> +	/* Skip dec if this is a delayed task not being truly dequeued */
> +	if (p->se.sched_delayed && !(flags & DEQUEUE_DELAYED))
>   		return;

Consider the following case:

- p is a fair task with uclamp constraints set.


- P blocks and dequeue_task() calls uclamp_rq_dec() and later
   p->sched_class->dequeue_task() sets "p->se.sched_delayed" to 1.

   uclamp_rq_dec() is called for the first time here and has already
   decremented the clamp_id from the hierarchy.


- Before P can be completely dequeued, P is moved to an RT class
   with p->se.sched_delayed still set to 1 which invokes the following
   call-chain:
   
   __sched_setscheduler() {
     dequeue_task(DEQUEUE_DELAYED) {
       uclamp_rq_dec() {
         if (p->se.sched_delayed && !(flags & DEQUEUE_DELAYED)) /* false */
           return;

         /* !! Decrements clamp_id again !! */
       }
       /* Dequeues from fair class */
     }
     /* Enqueues onto the RT class */
   }


 From my reading, the current code is correct and the special handling in
uclamp_rq_inc() is required because enqueue_task() does a
uclamp_rq_inc() first before calling p->sched_class->enqueue_task()
which will clear "p->se.sched_delayed" if ENQUEUE_DELAYED is set.

dequeue_task() already does a uclamp_rq_dec() before task is delayed and
any further dequeue of a delayed task should not decrement the
uclamp_id.

Please let me know if I've missed something.

>   
>   	for_each_clamp_id(clamp_id)
> @@ -2039,7 +2040,7 @@ static void __init init_uclamp(void)
>   
>   #else /* !CONFIG_UCLAMP_TASK */
>   static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags) { }
> -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p, int flags) { }
>   static inline void uclamp_fork(struct task_struct *p) { }
>   static inline void uclamp_post_fork(struct task_struct *p) { }
>   static inline void init_uclamp(void) { }
> @@ -2112,7 +2113,7 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>   	 * Must be before ->dequeue_task() because ->dequeue_task() can 'fail'
>   	 * and mark the task ->sched_delayed.
>   	 */
> -	uclamp_rq_dec(rq, p);
> +	uclamp_rq_dec(rq, p, flags);
>   	return p->sched_class->dequeue_task(rq, p, flags);
>   }
>   

-- 
Thanks and Regards,
Prateek

