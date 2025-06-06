Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBED1BF58
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 00:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749171364; cv=fail; b=rJ1LA2Gb+orHMZIs6pMbvTwF/kENNEimcLtOxOhFplSyWSC0GjS/xObXe9Jrb7nzD6xBZI5EjkZQ2uXmT5/xaZIfMf1vcleXOWwbF3qOi84D3FwNKYwaLBRxHkBUN66mhHxxd5OBNC20igakqbhjDtXq1zNz9uMm2wM8bd4118k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749171364; c=relaxed/simple;
	bh=V7LoZgcm0QpcbqxfJmKNLBVwp4jnvjJ9Yx5sQGg84bo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J7YuzvLdnwFBs+7SlZnev6iwRZR9AQp5DosoFl3/7xS69A9lA1ZKDUr/0qZ/pdlGO9kNspSxRNIk7DkrB+saQ8xV3+9iEqNwVwnQJOUKrf3KEtDbPPi/TnoZBD8FKYdCN9NceMAJiJXm/z/n0P7OR3DM1pEpWKmUROtAEiN6LCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=WJrvzi4Z; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="WJrvzi4Z"
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555N35Dx011682;
	Thu, 5 Jun 2025 17:55:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=/78sMsxSTgr/same0S61Mote6LlAWhgfK0lINh0EVcg=; b=WJrvzi4ZbmNq
	WhxF3vFdItdYzumgC3GVHy4e1WDA8QqDNBzqw5/ss0oZv0FumQkCpB4cUkpN9tSw
	uis1UqL1J27nZGZXdNdOVtJeh1P04zboyM5RHcqsfLdAfQGfMo1ZZxej/gr4Gy3s
	kHEbV4g1/2wUrAGHN+uNl4ODgwbbXxmN0urs+a95wHQVhj/YTbvCFzPsjzxkBB94
	K3Nl4X7/v6bSn0LgQUYmabWLPvszvSAgcxSRCoA/noJkNMfnk21FCWoSdfYv98tk
	ONkKTr9nfEUsiUn6I+QkiKp2ZSueT1/Y7Dlw/bb5agd40YNBWuakW6rvHElbs0cG
	8qJNRAXhaw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 473gta264u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 17:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESwpYDIQvWlKo/weTpgMK4PV667QUA6AMImI2Oa6R8Lt+cYobWxzgwi7L3kPDtGRn7ZnR3j8y/Z9xdkfeFhtUj3QMrn5hfH5P52KRU7LrdWTTPiRMh+Y+h0yQFmcLdjYxgvTJdBWDvBYOgXQVSde73yYdzBU3zLnFth6IfwTBcPlIYA9t3enq+X9StM8SYyv6YefO2nENdxWS1xc6B5tisi6K3jdEl6n68zg4Y0Zd0DHPF1illcqNig/edALLNXM0kkHEb/lnx5aqhmuVF0xf2t3zWnht9Th+hFtVJKRwak10n2OnO3f21od3nc5OC3BqIvG643xLfGJ1JQ0SoUHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/78sMsxSTgr/same0S61Mote6LlAWhgfK0lINh0EVcg=;
 b=y62lWhJKxHYbhNNtQTNwWU3clJY5IGRbDculPoVPM4UkE7E6AmMelOo38bNAkZdb1L4RwS6XO0SHa5it+5DT5HI9kRDFW1r68Iiu5qpWfCtgj8OespQwUrtbWqrkYohJghXGijvVG5t/xOqX1TgVzIG3DEwFTRcJFX+CWju33k++T8dKu6QvlLkxEejViedYaS/ZPlv6awbhVFbRIC6avWVdzGlTnZhxp3sfBDB+72piHt1ADJgGqt/ovJ5Gr1eNFTcV4i+6zAZ4uzBwBmONoYoxk74XXJ+GAcsVVA0X667l9iDnL20VSGjKUwoJc96ZbGO4lppXKHIxdF+WNjMTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by DM3PPF9E2B88E93.namprd15.prod.outlook.com (2603:10b6:f:fc00::434) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 6 Jun
 2025 00:55:38 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 00:55:37 +0000
Message-ID: <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
Date: Thu, 5 Jun 2025 20:55:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <20250604200808.hqaWJdCo@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:208:23d::18) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|DM3PPF9E2B88E93:EE_
X-MS-Office365-Filtering-Correlation-Id: 701c6d28-c8c4-45a8-def2-08dda494d9ca
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzJ3UVpLMlJ0cDRIaUMwMy9VcDJsdjQ4ZXMzZUFjWENYRDcxZXZpRG5JdDJt?=
 =?utf-8?B?djRZQ2lkQnF3QXIrYlErZ0s4YkRZUXZSMGFMVUNHeFJ5NFNGSkJndFRvSHIz?=
 =?utf-8?B?VVRDK1pENDFLQkFwelRGTFkrQ0Rjd2cyNmZiVjk5K1NzVHdCeExJaUU1bWgr?=
 =?utf-8?B?WlB6d0owdDBUOURWazhNTXlnWFBoMmZlR3BlQ2Y4Z3N5NFRwTjRsV1ZlMzhY?=
 =?utf-8?B?eVlJWThDZzR5cjN1dnZXeUNsQ1VWVzNCZGFFZHYrUlNLVk50NUFjS1Y4OXdT?=
 =?utf-8?B?OFl1MU1qNk45ZFFWZlF6cDRSWngrVk94U3VzOHdIM214bWJRTUZHY2RxNjdQ?=
 =?utf-8?B?SVIrK1ZIbDRVZVpoZXZkNnRlUk9ncEg2NlJRQVdvVmJNL29qaktFcXdXT2Qz?=
 =?utf-8?B?VlhCMERrazlJeWVpaVdSMURFTzNFS2xwR3BCaEZWdWFaczlPSEZFOHFVVWVr?=
 =?utf-8?B?STQ4MFcvZWdWT09GT2l4MkVyalUzZVBoOVpSSzFuallzZ1duOXZ6Vm9mZVBq?=
 =?utf-8?B?OHJiNkJsSFpoeGU2ek5tYVFuRk15bU1jSnRwbGVPdm8zelRSUjRHNlc1bkVt?=
 =?utf-8?B?SU0yRHJUSHpuSEpSakdQU29nN3ZmNHh2Q1hOaXpEZVpKNjE1MlZtRFJid1Mr?=
 =?utf-8?B?YWJmMmdmdityODdvb1BVVkpqRloxNVdIZ3psNktTWnNKc2FHWEgyN01uR1hJ?=
 =?utf-8?B?Mjk4bDRDU0NhNGZXbjkyYUpDUVpudUpRcWt0a2k5VjM1eGlnMXZVNWRHREIy?=
 =?utf-8?B?dGdsOUpLdFBGelFLUndzWmVHL1JSZW1yRFlUSlNsU3JJSTRmczFHeVVOdTZx?=
 =?utf-8?B?cEx5UTMyYlBzcHpCTmtUc2ZtMW5KMjFLaytjc0toTHRxUDVRMThBWDhtQnNa?=
 =?utf-8?B?bTJVWXE0clBaaEhQMTNHYWl4c2dVQUhZazI2R1Z6Tit5NU5QQ3NJUVZIQ1Zr?=
 =?utf-8?B?dDVqUnhyVzh6Y2NkTVJPTmhlUDJZbTFmSFhFdEpQSERpaGhKMlh1SnFvSnBv?=
 =?utf-8?B?YnE3QS9yT2E0Z2s2ODV4bTNkbWxQZURlWEx2WG1BRDBsSWQ2MEVHWmh5LzVD?=
 =?utf-8?B?ZGl4Q2FaYWFsTjRpd0lKUkxtUmNHTWdzaFFoS1FhblZDWWhFN3hRRmhNQmNn?=
 =?utf-8?B?Z1JBcDV4bGp2c0c3ZGY2QUZTODR0WlhwbGRKS0hIaHhwYWllNml4Yjk1TjNI?=
 =?utf-8?B?TTF4dzR3UjhaQTVOMkJLSGFkQWE2WEtHTUY2Qnp5Qm1QL0FMN1AwYStid1hK?=
 =?utf-8?B?cWtPb0psSUp6MTk0bTlwRk9mT3FmMktmTlFUOFFaZzRTVGM4eFgvazdhTTVO?=
 =?utf-8?B?RHVhNjNuaWhpc1RTZWFQZVBNYldUeG40U0VvcUZ5dGVBSW9BTlRLUWNLNnFW?=
 =?utf-8?B?bEdLNHF4cGh0Qk5ud3lobHd4a1VMMFJPemhzUkE1TEhHenROeXg4bkwzTkZs?=
 =?utf-8?B?NFhnUjgyRjVENUI5dlpLcjFSQnBrZFVLNngxbXhWNlRzenZKaUZTQkJtZmJC?=
 =?utf-8?B?WFovN3dTZXl1dERzNm9lZDRJVlcrVkxVRHpTVlpxaHJtSDBPT0R2alZKd0Z0?=
 =?utf-8?B?VWlGdm4rdzFVaVNpTDg1bjNBVFQ1R29WYlZwdnB4VzlBRnlzZ1F5UlBUa0Jl?=
 =?utf-8?B?VmpIcFBHa0dNd2NQN011WW1BSGRBSnN3bFd5b3M0cG0yMnc2VHkweHFSMnhk?=
 =?utf-8?B?SHVvUFRwS1ROdmZaQjFROEtoVXQrLzVUSVk5cENOZDgveFU1T3pTcExjMStE?=
 =?utf-8?B?RElkODBlU0M4ekVqbk9VRHBVVldEUUNTd2xOTWw0eDRZbDZOenphQXNSM2x0?=
 =?utf-8?B?VG9LazkzUGFReWZMOGRLWml3eVlvbVN3SmlsckVuZ0xCSW5yN0lRS3FlMUFX?=
 =?utf-8?B?TlI2Wlp2SEVYM0ZteDc5YXI0cGJ1eXM4dkVGUFRPbUErNVVyb1paM2w1cXdM?=
 =?utf-8?Q?4d8zimZaJfo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2dsdkhSY3lQcGpnNU9ydG8xSnV3MjRjdmFxZ3RsZGtDT2ZzQUt5ZVhwWm8v?=
 =?utf-8?B?Zk1kV3dLRzFhVXNvdHlqQURZczNMRDl0ZUJUeEs3QmpWdWNFWTA3dkxFQ0c3?=
 =?utf-8?B?T2ZkZE9oMW9rTGNQSkhybDdTTTJjU2hRMmdEa3d6NytWMm9veVhYQXBBaWNZ?=
 =?utf-8?B?UlloVVNGclEwY2FZZlQxUDlHMFl1QzQxNWRITmFValo5YXljYlFsL3A3bjVT?=
 =?utf-8?B?dWo2UHZjd0lwdVdWV0lEeHhubUhDeUN6aSsvaE5HbXp4SGxXbytzVjlXcEFS?=
 =?utf-8?B?MDFqRXphZm8yWnZoWlhiT01Yc2ExZ2JuL2VPVmdEelBRcnFDY1AzdUxhcEta?=
 =?utf-8?B?eFZISmdZSkR6b2lDOHQ2b2pKVTA4MGkyRmh1LzBmanRDZVNVZDJhaEFkV0p4?=
 =?utf-8?B?bWlreW1ZNGl2ZVVzazkzeVZDcHF3TEJqQXNMWkw5RWdpK0NTQkcwU2RtcktL?=
 =?utf-8?B?NUJHcFhXdU1SSVZkQXJaQXJPUllkMlhGMUlUc2ZCelNGeWZYNWV0NTdERU85?=
 =?utf-8?B?ODVXSXN4SEtQMldKbjZXTWlCaUVxQi9EandKNENkZ2FNR0NuTWJjUzVkRHdZ?=
 =?utf-8?B?NjBxb3lVa05EUmV6WTh1aTlhWlFZemVaWkVUdHUxVFhZc2E2UEhnN0lCdEFE?=
 =?utf-8?B?aXQ0WS9QdFFWMXJ3bXFwaUFQRXRJNnppSmdXekN0bEdJeTRjUitFRzRZL0U1?=
 =?utf-8?B?WS9IYXhIQ0x5dE5VRzE4aG4yalY4TG9vY2lwbkpJcm1MZE9McjZuUHg4UkV4?=
 =?utf-8?B?ck52dXhyTW55ZzZLT2xSY1M4MjNXYnRRL3NuTHpuNFpzNkYvZXBUcFZJeXRl?=
 =?utf-8?B?TlNhSXJaaEE1aEVOYnZHTDRJakdEc0pOa3hMWlpYZmgwMnVjR1h4aFNXanZl?=
 =?utf-8?B?ZVAwVFJnZXlGcHhCRUhuM3I4RDA3QU9oaEFRZk9ib1UxV3pOZzc4dFlTQWxD?=
 =?utf-8?B?ZlVnUlh5YXYvR1B6SFZITHl4bkY1M01iYkpZanovWnBwVEVrRkJ0NkJtNXFF?=
 =?utf-8?B?VjI0S2duSmN3SnVLMngwdFlobE9vbjB1dzVIUmpwVG9hSysvaWUzd3l0N2pu?=
 =?utf-8?B?MlA5amFncXBjQ1V3ZkNqZk9PbS9aSnVxUUp0R0RVLzdGMVZLWjVVS0RnQUc5?=
 =?utf-8?B?U0w4dHJHN0JGeC94K1pEcUNtWlRDL3FjcGY2NDk3bjF6dHpOVWVvTlN4dGJK?=
 =?utf-8?B?Tnh1cFJPemlteGdXSEpDUFJYU1lCVzV0WHpxK0MwV1ZSUjFsSFFHZHh1cWNC?=
 =?utf-8?B?MmNvN2U0bW8ybW1oM2EwMFBrVWNseUVvZThSSHRaTDJGQm5hQ1FTZUNUZU1x?=
 =?utf-8?B?cS9SYkpqNTRpWUVzaC9Sc0tJOHUrMlFhY3FzbzBMQjRCWlVQVmZWZWJBQVNp?=
 =?utf-8?B?RDBIZDdSM2UvWFVzajVDSHhCWkhPYVBqZXg0aVZnajl6TlhiWEx5WWRVdEpm?=
 =?utf-8?B?NkJ1K0ZwWnJmSFlDR3FOZHJ2Q0FpT0s5RUhKWEpGeCtWdlBGejh5Rm5Wakpu?=
 =?utf-8?B?YWNtQTUwUko2NXhRU0NBc1ZKbytSUXVwd3R6eVFQUnM1QzJBT2RlWWNNN0tJ?=
 =?utf-8?B?amQ0M2RHN3BtbEUycmtEVmt5SExuZ0pobTMvajRGRHBTaUlYQU1VeHl6enkr?=
 =?utf-8?B?VC9XZDljSTE5WlprUmp3QWJiTldLemxEcE00dDc2NGNlOTV0SXZoeVVhbTdO?=
 =?utf-8?B?QjhsMnhOT0dsVlRnaVAwaVIwbHlXWmEzWWJFSnBkWmpoMTIwaEVDc3RXS2lS?=
 =?utf-8?B?WDh2aXE1ZlBnR1hqM3RyZHF3UXBJK3orY05KdXJ6LzRML0pScWpiYXpXSFhK?=
 =?utf-8?B?bFo5cHIvbnVPMUkvOHRjOE4rZUh5WHJvdEsyQUJQS1llQWJOYVhYdzNTQUJt?=
 =?utf-8?B?cjlQcm82SVdkbXdwTDY1dk45ZjgyMllQaWw0UDFvWEFqQ0hJTHpUc3ZaZGkr?=
 =?utf-8?B?YWRya2t6Y25hL05zS0dVdmh5Z2ZMeHcxNFZtbmhoRkdQaUwrTVY0aHdWMkRV?=
 =?utf-8?B?cllOZTNOM2FLNkhObExYTXFPWldmOG5OOGVXQUFGa0tRcEtRVnA5Q0RXcU5C?=
 =?utf-8?B?ZWFVdTlFREJXTlJyMDN5blM4VGlYVmh0QU44OEpZemVnUCs0em9mS1JmR2xr?=
 =?utf-8?B?dUNlNVhEK01RdU5wY3liT0p5ZmZjVzR3SENSRzJFT1ZjdFhsaTJETEZqOVU4?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701c6d28-c8c4-45a8-def2-08dda494d9ca
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 00:55:37.3958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +akJmQ5Uk0ll4aTg7K+KdunpD4hEnjBUFBHAL4nPkIycbyfhK8QRAEig7Bij2KsY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9E2B88E93
X-Proofpoint-GUID: b641wZG-FBTwDnKI0eX4o2w86VcVGmij
X-Authority-Analysis: v=2.4 cv=W8c4VQWk c=1 sm=1 tr=0 ts=68423c8c cx=c_pps a=WhUEUVamR7lPV9LkVsdNog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Usw6ks3wQ9e2hmVS8j0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAwNyBTYWx0ZWRfX3b7t9HiAeZMN JgTqBWhjzuhzXelwmoTP//aoOOq0fXJn8+UscPxQrrNj6ElKQ9NhXz1MQm026svDZmC4LRvmHk3 vYp86fzf1HTvHgOWH3U3XyHT3fu8EqoZErGdYt4nGA08wCMhdGjwdOnmxpYIwBxTlSLpoZD8MPj
 /Vck2xL9k/uCniTezO4tBsD/OwLXgwc2wTkc695sqCpQZrtQyflnWK5TYclgSAo22PvPWWK3WFl KMi6ThLBl6O27N291nxQNv5LI8RswDsify0a5PdYpXL/6bOtsfgBEbInc/jxS25U8TxUYxzZHkd dwyzC7eHTqTBp+6/0bs415fXsK2brZt42QSIvaUrHVM8MTlL4FS2GxgXbzZbCj+/Y2WGmHlqISM
 0osZgicddxA8LyuPsXmy6xhea0sTz90vC+/rAV5ZAAsW+EKJnpNZGMYvl8lTnuG1zBBirAvL
X-Proofpoint-ORIG-GUID: b641wZG-FBTwDnKI0eX4o2w86VcVGmij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01

On 6/4/25 4:08 PM, Sebastian Andrzej Siewior wrote:
> On 2025-06-04 11:48:05 [-0400], Chris Mason wrote:
>>> --- a/kernel/futex/core.c
>>> +++ b/kernel/futex/core.c
>>> @@ -1687,7 +1687,7 @@ int futex_hash_allocate_default(void)
>>>  	scoped_guard(rcu) {
>>>  		threads = min_t(unsigned int,
>>>  				get_nr_threads(current),
>>> -				num_online_cpus());
>>> +				num_online_cpus() * 2);
>>>  
>>>  		fph = rcu_dereference(current->mm->futex_phash);
>>>  		if (fph) {
>>>
>>> which would increase it to 2048 as Chris asks for.
>>
>> I haven't followed these changes, so asking some extra questions.  This
>> would bump to num_online_cpus() * 2, which probably isn't 2048 right?
> 
> Assuming you have 256 CPUs and -m 4 -t 256 creates 4 * 256 = 1024 then
> threads = 512 gets computed (= min(1024, 256 * 2)). Later we do 512 * 4
> (roundup_pow_of_two(4 * threads)). This makes 2048 hash buckets.
> 

Ah right, I missed the x4.

>> We've got large systems that are basically dedicated to single
>> workloads, and those will probably miss the larger global hash table,
>> regressing like schbench did.  Then we have large systems spread over
>> multiple big workloads that will love the private tables.
>>
>> In either case, I think growing the hash table as a multiple of thread
>> count instead of cpu count will probably better reflect the crazy things
>> multi-threaded applications do?  At any rate, I don't think we want
>> applications to need prctl to get back to the performance they had on
>> older kernels.
> 
> This is only an issue if all you CPUs spend their time in the kernel
> using the hash buckets at the same time.
> This was the case in every benchmark I've seen so far. Your thing might
> be closer to an actual workload.
> 

I didn't spend a ton of time looking at the perf profiles of the slower
kernel, was the bottleneck in the hash chain length or in contention for
the buckets?

>> For people that want to avoid that memory overhead, I'm assuming they
>> want the CONFIG_FUTEX_PRIVATE_HASH off, so the Kconfig help text should
>> make that more clear.
>>
>>> Then there the possibility of 
> …
>>> 256 cores, 2xNUMA:
>>> | average rps: 1 701 947.02 Futex HBs: 0 immutable: 1
>>> | average rps:   785 446.07 Futex HBs: 1024 immutable: 0
>>> | average rps: 1 586 755.62 Futex HBs: 1024 immutable: 1> | average
>> rps:   736 769.77 Futex HBs: 2048 immutable: 0
>>> | average rps: 1 555 182.52 Futex HBs: 2048 immutable: 1
>>
>>
>> How long are these runs?  That's a huge benefit from being immutable
>> (1.5M vs 736K?) but the hash table churn should be confined to early in
>> the schbench run right?
> 
> I think 30 secs or so. I used your command line. 

Ah ok, my command line is 60 seconds.  It feels like something is
strange for the immutable flag to make it that much faster?  schbench
starts all the threads up front, so it should hit steady state pretty
quickly.  More on NUMA below, but I'll benchmark with the immutable flag
on the turin box in the morning to see if it is the extra atomics.

> The 256 core box showed
> a higher improvement than the 144 one. I attached a patch against
> schbench in the previous mail, I did then
> 	./schbench -L -m 4 -M auto -t 256 -n 0 -r 60 -s 0 -H 1024 -I
> 
> …
>> This schbench hunk is just testing the performance impact of different
>> bucket sizes, but hopefully we don't need it long term unless we want to
>> play with even bigger hash tables?
> 
> If you do "-H 0" then you should get the "old" behaviour. However the hash
> bucket are spread now over the NUMA nodes:
> 
> | dmesg |grep -i futex
> | [    0.501736] futex hash table entries: 32768 (2097152 bytes on 2 NUMA nodes, total 4096 KiB, linear).
> 
> Now there are 32768 hash buckets on both NUMA nodes. Depending on the
> hash it computes, it uses the data structures on NUMA node 1 or 2. The
> old code allocated 65536 hash buckets via vmalloc().

So I wanted to mention this earlier and forgot, but schbench obviously
isn't numa aware at all.  This combination of command line options
basically just has the 4 message threads waking up the 256 worker
threads (per message thread) after scribbling a timestamp into shared
memory.  From a schbench pov at least, we'll get much more stable
numbers by sticking to a single socket.  <makes numa placement hand
gestures>

> 
> The bigger hash table isn't always the answer. Yes, you could play
> around figure out what works best for you. The problem is that the hash
> is based on the mm and the (user) memory address. So on each run you
> will get a different hash and therefore different collisions.
> If you end up having many hash collisions and then block on the same
> lock then yes, larger hash table will be the cure. If you have many
> threads doing the futex syscall simultaneously then making the hash
> immutable avoids two atomic ops on the same memory address.
> This would be my favorite.
> 
> Now that I think about it, it might be possible to move the atomic ops
> the hash bucket itself. Then it wouldn't bounce the cache line so much.
> Making the hash immutable is simpler.

Going back to your diff, if we have a process growing the total number
of threads, can we set FH_IMMUTABLE too early?  As the number of threads
increases, eventually we'll pick the 2x num_cpus, but that'll take a while?

I do see what you mean about immutable being simpler though, I'll get
some numbers on those atomics.

-chris

