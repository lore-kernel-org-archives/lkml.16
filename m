Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D10823A9
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838022; cv=fail; b=HFKg3euH8TrVefiT+YgYhEPgTYZLJswjdR1jSG4iZ84MuCU8FGwGY6Dlv+OS/CSvG/z2cotoBTlqH8b46VWxAqd5lkbYRKREOVqEubkAZ8zQa51iX58xnqKT9xVTHO0pnsUsQs2kV2f0Dqch+7qvNk3PbhrAzlD+eDyaguxMxaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838022; c=relaxed/simple;
	bh=in1lMenz277p62IRqdfRKtF8p1QbMDS7wzxWfKjxl9c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NwC6EOvU85dID6gLMAI7nUkjarlTeA10CAMevCiZt6HQd6UlUJvBa2nZYQWktX32xsArJ5NWO7WW7WtasYLPk6WKpl3g94Tqb5torEuhNtWIkpmTs2UG21ksG/AOx1ic1oXTpIxm4hYLoa6RXT9HrgXHfwr8+stubMqWWXkToYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=M1hPnHdV; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="M1hPnHdV"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LDCnYt023649;
	Wed, 21 May 2025 07:32:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=D8f60seA369jC2dOs9nK8/w1bUWzBHrufK1JYAbWAjo=; b=M1hPnHdVf57a
	MWwjgt2AaeDbjlzOZurAiGhLw7/LK8lvaE72AvJYfeyoQPEWC4HP1I81imkfJDJy
	x7KRj9n80d04u7SUbdbXXntvICLHWOiCc8eAzq9AutvEoQaThEITRx/yRaLDiWb3
	8AI6tYWXy2tEeYKX7W+RPCddSsgMhrCt3T3VlGOlQ5yQYZg/KTdeocN6n/qmC1PD
	jeeXn7UxuCYXXiRBgZQ3HA0rdTdFGc0zkccyjJN3loqUfihQnWDQe5bCbESUyNBq
	Q0yAbx/mWiAG0KfEyZCKqYeHTZ0LV7hnc5aOAfNKhT9vDbFs2oXoBX4lvlKAA2CW
	1uLGvFz3pQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 46sddq9c75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 07:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHNtvJWppVTeOVdoaoUkRvbus7GL6iVIRxF60auxBsXDHOUryyR6un2LYi15qMG1EiUKlxzF6T3gy++UOER9tXON75Yncs8c7oQw41RQ2F+lW/CBc3NlsJP1QRBH3R5MizxLPvjXw0s2r3E2dK9kN1IbH1yeszi42j3egzyZLFHylq8g595JgvCOAWGyVyj0Mgl3QW3zBB0hs4kf0Eq3B7dxerQ8CwBoTxk34SiT4cuWmn2qeRmJr7X6sw0jvDg+JbpeB+S0Q1snmQ71Nv50ymrMgmzRy8zBv2LkWCkiUzwkPmC7E62UTsZteVlh2I7qPBq7glxXszO4cCoG+G74CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8f60seA369jC2dOs9nK8/w1bUWzBHrufK1JYAbWAjo=;
 b=IPfeGDF3x3hXW2FR2ZuEZuFw8/m3JlbKRuKyAZNk9/Y4V9yCOGsrh/GV/yRBM/w8fQfz9OLNzlLMuruE4qXkwoUQovH9SpwxC66GCC33WhEL9Ykw8sbN1E2t/KIgwR/ftHRcFJikQ+Fulh/yoU4X3r6phyksMnyIJYmdosQC8qAOczv7GqgMTGLNUzTFAOJAi5adtkjE6Z5h9tpMGmQOHN/TbdINZ+X0UJ9B2/CiBaIUe2Snp2o2uxkYYLDWcdx6yraH60a0yP7eJqWqxhVJ4lYal8fKFy8DTcqVuRe0P3py8g0Qm/Qn7pUMkSGTRbxMNGHTAmvpRtZToGC3k/eqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by CH0PR15MB6211.namprd15.prod.outlook.com (2603:10b6:610:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 14:32:54 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 14:32:54 +0000
Message-ID: <55913bff-d7ad-47a3-bbd7-2bf8bb63ac59@meta.com>
Date: Wed, 21 May 2025 10:32:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: scheduler performance regression since v6.11
To: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        vschneid@redhat.com, Juri Lelli <juri.lelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <23576497-af63-4074-8724-d75d0dca1817@meta.com>
 <d1002060-a1e4-4c47-aeb4-d8af0744267a@arm.com>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <d1002060-a1e4-4c47-aeb4-d8af0744267a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:208:236::12) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|CH0PR15MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 26fabd09-f2b3-481c-63fd-08dd98745f47
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnBpSms1bmhyanpOalZTdi9iczdQY2FkUzcvTU5GV3NEb2x1R2d5QlJLc2Fs?=
 =?utf-8?B?OGoxTW45L1E2WmNwYm5XNFJKSzl6cG5McTdKeXYxeFlkYXMyQUc4bmthcUo5?=
 =?utf-8?B?SW5SdWFoYzFHQXpZcUtSUncyRkVKejd0UVJnM2ppQzRpNE1pWkdRL1p0WFQr?=
 =?utf-8?B?cXVMU3N0SUVhVENGWUt0VkREWms4MGY3WGRVVDZIYmlzdDF4dkZMYXRjUGJl?=
 =?utf-8?B?YjMxc01JUmRucUZncFZCLy9JMjVTSHBYSjFISTN2Zld6QU9WTEhMdXZCQ0xH?=
 =?utf-8?B?UVdlazlOQTZWV2lZMjJFcFpZRVhIZzdQNE0xQk1WSlFyRDBTOTNTeDRvWFBi?=
 =?utf-8?B?bkFRNmhUOFRJNGo3eXM5NXhMbzdlcnZpcnlVeTAyYTEvY1BzeSszbjkyb1dD?=
 =?utf-8?B?N2kvNTZNWDJyTUhWWktLbitHTzlDM2dXTDdWZngxcXUrM1VDSzA2bVhkeE9x?=
 =?utf-8?B?OWVibU50MHh3ZEptY3JxRmVhdlB0dzZGOUxjbUkxUmJnV3VQTENtWTZ4UHJF?=
 =?utf-8?B?WFNVSFRjall3ZFdreVFybDZQL0d5SjZGS1FWc3pTVWZuVURZRjI1NFVYRWt0?=
 =?utf-8?B?UmxrclhRRTg1ejZnUlNyWEtlN2F4cU9ROUgxdlVPSGhjakVjYnJDTzNwSFBK?=
 =?utf-8?B?TE12NjRyZG4zL0R1eGxGNzNuNFR2MEtXd2RzeVdNQWxNSTNzT1Y5M2VJQ0pR?=
 =?utf-8?B?OTFJMGoyUEdUNUlTVDY1d1Y3bzIxeHN6NjFJZDR5NEovTHhOYVNwclZPWHRZ?=
 =?utf-8?B?LzFjSXJ2Nnp2a2I2cDE1NmZNVTFmZDNkWGpldEx2dW45ck5OTVk3dktSaWxE?=
 =?utf-8?B?cVhtTUpGTllpQTFpWTlWL1BhNkZubE5ReHR2b1k5UldmNWFhdGNsaVUwRmc2?=
 =?utf-8?B?L1JMQVFGV05IcXdUVXFWN1hjcmhxdHRHbzNTTXpLQmFFOStsV3RocUhzS0pz?=
 =?utf-8?B?S0xjNm1nOGM1TzAxeTVZOGRiVU5PbXdtRW4zMUlZUDVocHJGV2QreXMvVWJP?=
 =?utf-8?B?MXV3eVVUTW4veDZ3TGFPK1V0b3J5S0xhVGV3NmJqVHpEKzcrZW1KbGdaVU9Z?=
 =?utf-8?B?SnNSMlJCUkRHdjRxMURTQWdWUVF1cENEVWtxWERaZTdwNWVNeTJaamVHc1VM?=
 =?utf-8?B?MlZkQk9ibEdZcVFudnFYSGRmZnVhK05BS0JuNWEvUGdFN2hBa1BUNEphZ0l4?=
 =?utf-8?B?V2IrajlTQTU4T2JZcm96b28yWVNyTDd1b2tFY0NXVGp6SGtUdFBQU29QRkFp?=
 =?utf-8?B?ekh1WlF1MVRTdmNmSHVreW9Sdi9OWWFVZWdBWGQ4N0h5VkhzZytuQStGRHIv?=
 =?utf-8?B?QUloL21RSjVUb0xtZWNYZkhDcWhJaGFoWFcweW9BUG9CQ0R4N2VtdSsxY0hs?=
 =?utf-8?B?dDdFQkFoSXdjUFFiQ1lRMkVjcjBJeldUT3NRbHYzQ3NNcGVUems3WU56elN4?=
 =?utf-8?B?eCtFWnU5VU1HeDc1Y1lRRmJDb29CVXpTWnJOR0ZFOTE3KzIzSkY0T3g5VEhZ?=
 =?utf-8?B?KzVHK1piTUszaDY2MWtMOFQvenMzaitjWEJQT0NBeEZpNFJra3MwWEdVL1B6?=
 =?utf-8?B?WE1RWkZOejZqaTFOU09WUWVOVVVJNm1iTDNNZ05wb3lrSUFFQWxUN1pTeWNR?=
 =?utf-8?B?UGxRYlFvZjloVzVPSUtJdDM4QWJQQjQ3WHFYSmkwc2gzeFVoTHlueHpjNHQ5?=
 =?utf-8?B?L1NESXFVU0c1b0QyTWcvSnpaSGI0WDhxaURKWmpXaVErOFRoWFNFVUc5akFL?=
 =?utf-8?B?eVR3SzVMTUtpdXJQaE82cE44SjlzOUwreW9tYnpDdDJlejdIaldsM2tSbERL?=
 =?utf-8?B?aDF3WkkxeFZGczlaZVp4QlZUSElqU0lZV0ZkVS95eFZ2UWdkMDF2dy93ZE1M?=
 =?utf-8?B?eXU0MUVoUDJYbTlWb3FXK2VpeTI2WDQ4bFJ2UG1xd0YxMlJqbDF1clhUR3BU?=
 =?utf-8?Q?ShFYvFt0AFA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0QxdVdVbjExRUs4K2FSejZ1ZTlGK2s5ZnYvd1NUMzA0c21CK0QzK2pVM0lH?=
 =?utf-8?B?VWQzT2t1YmUyWXhFTmI0SlpBeUxzZG1ZYXgya1M2YjFiU0dFZGhtcHYzWUR4?=
 =?utf-8?B?TGkxZ2VJYTZFMlVPSmxVRWxxN29ERlNRSCt6US9IaDRjWmM0aDNsVnZJQzkv?=
 =?utf-8?B?eFJlNytMcTRsZkhrZExyTENpUVp2dW0xSTdaOWZzRmsyd0J6VDNSbnVRc2ox?=
 =?utf-8?B?OVFnWkhSMXh4cEU5bVdROWlJeDV3YUdML05yaFVTdDhvbUJNWFJlV3lzLzFR?=
 =?utf-8?B?dVBhdU9YeDRndmNZZEwvQzhKOGVPTXJlbnM2RkNGaEI5TTF4V3lieU9DQ0Z6?=
 =?utf-8?B?MDVRVzZWQU5ORzdrNndzZENHMS9wSExpQ2FudW9DN0F4bGR0Zk95L1FZbXVT?=
 =?utf-8?B?S0U0YS9BeCsrYzZ5R3RZZGR4aXN2MkdvdVRQNnliZHlNU0YyS1BBUk5Pemx0?=
 =?utf-8?B?UFgyNzJWREFvYzlvQWxQN2NWd2tVaDNBYlZPZG9XdW5haEpSUTkwbERLZUEw?=
 =?utf-8?B?N2kwazVHblYrcXVyNjl5S2NPVTBEV0VHUVYrRWFrbUFwTXl0c3BTZTdKMDlw?=
 =?utf-8?B?VG5ZQ0F4WTM0QUZGeUY3NEdNZ0wvVitYcUhPVHZTK2dJSmp1dmJYY2JxQy84?=
 =?utf-8?B?bkQ1eXRjcEpIcDhiM1FYWkJGbWVIN2pwRDRoQ3lEVnZxZXh4d2hyMUEraXR1?=
 =?utf-8?B?SjZCU05MRkJaU1J2RmxOdmdYYkQ0ODlRdXY5RHoyMUNXQnBSUGtJcERhNElv?=
 =?utf-8?B?dW5BUXBub2xZL3pJTW5DT3JyMXJQTmhTRitKaDdzK243d2RjWDMyMCtEQzJV?=
 =?utf-8?B?VU5tUGRLZDI3VlduUkRKcjRJWEJiN3JGOE12ZWxPNTJCMElaR1ZKakh0VEJD?=
 =?utf-8?B?MTk4T2NWaHJOdTh0Rm5zTkZ1U2QvTFAzV09JblR0cFg4eXZlbWg5N1czMzZG?=
 =?utf-8?B?bDFPTDlQbWNJMVRCdHhRVnBHeXp6NTZwbGhpcW1LdW1CUGV6NFlHcThURnVp?=
 =?utf-8?B?OWtRellBa0Fnd2hQdEhDYi9aRUlFRUFwYzd5ZmF0a2d4S01HYTJITzAzMkIz?=
 =?utf-8?B?NzRuVmt4aWpKV1UwN1R4eVR5S29kMnhaUG1rOG1idk5oMlp3amdUYjRaTmcx?=
 =?utf-8?B?c1UyUnAwNm1ieGtGSjgxa05LNWFDeDM2ZGdMM2E1U1p1NFZ6czRVREhIdkcz?=
 =?utf-8?B?dkx3MzhXL2NMTG4rVUNHQmx5c0FiZ2FkblFKQTYycTdrby9RWWxXeS9rRkRT?=
 =?utf-8?B?Z2MxTW41Z3lTNGoya1FUTGNBcE9RbFIzQ0ltejN1SWVvVkdldkY0KzNpNjlL?=
 =?utf-8?B?T1pZc01GYXVlV05UQXFsOTRRUzYwQmxpZHo3cEF4cTBXbW4yRnF6QlI5VWNv?=
 =?utf-8?B?WkFacDN4Q3NtS1U3T20vU0UrSVJHdTFSK2FuSWwvZjZFQldFZW9lREkySE1T?=
 =?utf-8?B?VzJKNjRiVC9DYXBIMlZxRWowSmxOUEFUaDNFNmNTMlJQZlNrQkVQM2dNamcz?=
 =?utf-8?B?RDYvN0oyd1Bya2g5bStXL0MvMWZUVkFFQTZyQVJGUEVMM2tWejFLTnp1OWwv?=
 =?utf-8?B?Y2VoV1hDU2hmK1NERnM1OHduK1BYelY2dWZhdXlJT2l5WUR3N0RRZXpjT21u?=
 =?utf-8?B?RTZHRXdQOWI3SWRMT0pxeTJQWVJsaEVQbWQ2ZDNxOXoxN2U5aFI4VzVYNU15?=
 =?utf-8?B?M2g3TDloVkxUazBUc05QZTJVc3kxTWFaUnJmcFRTNXdFWnhMSlR1SDBaR1cx?=
 =?utf-8?B?OGY2YlBNWVQ1cm4xT2RiYVBCVElBeEF0UkRBZHc0WldrYUtxLzRVeFRGR3Zn?=
 =?utf-8?B?L2g1cTFIWVJINEs4VW9FZUtOU3JIdEsyZTI4YTBTNGtMekh0VkVWUHVXYVdO?=
 =?utf-8?B?eDJqMVo1MHJBcUwvMWpzOXY5RXR1OWdJeHloek84TkVQRU5lSlRkL1pUUm1C?=
 =?utf-8?B?SkJOS0dvRXoyK05QNDMzazZGOVc0VFhwQ25XT3Bjalc3eEZZN3diVFVscEhH?=
 =?utf-8?B?bGZQdU5YTWNESUk0ZWhjMFJFTC9sbmpJZHZKd0xRNkM0Zkx6eHJXY0s0RWRv?=
 =?utf-8?B?dWlzZ1A5c0ZNUGVLMVhpZXlST2VuUHlNblk0VkdsNVRoVzNhOWU5Vzd2ekxl?=
 =?utf-8?Q?oD9E=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fabd09-f2b3-481c-63fd-08dd98745f47
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:32:54.0585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDwrfenmQLdUmyn2pSNMJOmaskGN06eJXutpcAModfinfaCMzarszXXY9XPHmeSk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR15MB6211
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0MSBTYWx0ZWRfX0v937nvmiMjU KSQcuRO1Uy41bxqt/zJVzhiMvYGs6OIJ1ca1dwT5OQ+MLPlecWpJkEohg+i+m+b2UUvb3/lk4Bz E465etJtvSOVRplAumrnTzaQzt6eny+zBlZYzz9A1jfBRoxmPXubCxsUneg8k4uwrjY30QqjHoR
 2+xrvyEY27GMtTDNV0fgQ/1EauEXOkEtlWNVXfrE+re58YMRS9pi8eaQyfDrwXKQiZqHg5SIDd7 mrIqR3IUSFGSw4b/RvY4k8zqyfnO157dII84bklkYEWlpqOQtYebUhx+bw3/2HAKaz/+PKfcYY/ gAM+uPm+NEF1+qbfKYxIZscC9RojzUFvERYs4gN4F9GIhkcPQlQC24Casjqd0M9vh2XacVKQBYK
 JBHo04yfDsQ3TYXTkAdy2kVcbBLs9nqVWu4VUf8sNzS1kNO2SQ1M9EbgGQjC/mfONqu1YKU+
X-Authority-Analysis: v=2.4 cv=dZaA3WXe c=1 sm=1 tr=0 ts=682de418 cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=z-wlt9mN4tIIyGvrWfwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: goincHpHv-0koXhSfX_dVocSRuRrQKke
X-Proofpoint-GUID: goincHpHv-0koXhSfX_dVocSRuRrQKke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01

On 5/21/25 9:59 AM, Dietmar Eggemann wrote:
> On 20/05/2025 16:53, Chris Mason wrote:
>> On 5/20/25 10:38 AM, Dietmar Eggemann wrote:
>>> On 16/05/2025 12:18, Peter Zijlstra wrote:
>>>> On Mon, May 12, 2025 at 06:35:24PM -0400, Chris Mason wrote:
> 
> [...]
> 
>>> I can't spot any v6.11 related changes (dl_server or TTWU_QUEUE) but a
>>> PSI related one for v6.12 results in a ~8% schbench regression.
>>>
>>> VM (m7gd.16xlarge, 16 logical CPUs) on Graviton3:
>>>
>>> schbench -L -m 4 -M auto -t 128 -n 0 -r 60
>>>
>>> 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
>>
>> I also saw a regression on this one, but it wasn't stable enough for me
>> to be sure.  I'll retest, but I'm guessing this is made worse by the VM
>> / graviton setup?
> 
> For me the 8% regression here is pretty stable. I have to add that I ran
> schbench in:
> 
>   /sys/fs/cgroup/user.slice/user-1000.slice/session-33.scope
> 
> So that explains IMHO the 4 calls to psi_group_change() from
> psi_task_switch() now doing all their own 'now = cpu_clock(cpu)' call.

Makes sense.  If you pull the latest schbench, you can add -s 0 to the
command line.   That removes the usleep done by the workers, which
focuses things even more on the CPU selection when message threads wake
up the workers.

On turin, I'm seeing ~35% lower RPS with later kernels than with 6.9
when I add -s 0.  I'm also seeing 35% higher wakeup latencies, so I'll
spend some time today measuring placement decisions between the two.

> 
> schbench-6509    [004] d....   689.050466: psi_task_switch: CPU4 [schbench 6509] -> [schbench 6514] ->
> schbench-6509    [004] d....   689.050466: psi_group_change: CPU4 now=689050466118
> schbench-6509    [004] d....   689.050467: psi_group_change: CPU4 now=689050466537
> schbench-6509    [004] d....   689.050467: psi_group_change: CPU4 now=689050466950
> schbench-6509    [004] d....   689.050468: psi_group_change: CPU4 now=689050467838
> schbench-6509    [004] d....   689.050468: psi_task_switch: CPU4 [schbench 6509] -> [schbench 6514] <-
>  
>> I've been testing Peter's changes, and they do help on my skylake box
>> but not as much on the big turin machines.  I'm trying to sort that out,
> 
> Turin vs. SKL,SPR ?

This started with a bad networking benchmark on turin, where later
kernels have regressed since 6.9.  I made some changes to schbench to
try and model that regression, but until I can claw back the performance
on turin, I won't really be sure schbench isn't just exposing other
unrelated problems.

I also pulled in SKL and copperlake because they are easiest for me to
test on, but the turin machines have a much bigger hit.  It's a single
socket machine, but the high thread count seems to be making this set of
regressions much worse.

-chris

