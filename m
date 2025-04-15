Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2076.outbound.protection.outlook.com [40.107.241.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E686C190068
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744697413; cv=fail; b=bKLnnjAI8uPVuoAdOh1hRXdNx+xHu6+fRVhCBj8uBZTpF0r7r1RYEaNRaIYLQgV9c+qOGMoWdPP5CZZoO0yLZFQLWJ+srArT9yJJXU2Yk9N7M6KfvFs4K04MacJo0PabJqYV/fVod5x9GKorquxkynfHhNts0jQbU1xq4mk2zuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744697413; c=relaxed/simple;
	bh=AHfmBuuUnLRPN/6ZGfsGhLmwDWw7KNylcoPN2UvcpCg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u6F7UPliIhaEOsNFmiHNjX93Hr8mw+s46UZqez0Y5F9Z5BCKu7QY4AyCfs4wFNiet9G3zgNvt0i9jo+glYzJEjVHOmMipNi/nfHdjYb3hEI16skbt50LA87AMgcV2V7mL+pFUiKRLCfCeZrslv3vkMcCwtqKH8CkEbq5+/JxS7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=FNrq0aTG; arc=fail smtp.client-ip=40.107.241.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="FNrq0aTG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5I9SAcleaDxL2tX4M7B5h4HH9P/qy5/EQUk3nEqtcVNqA+FJvWXyN+aN4oJzvlqpryGuYRek+Jka+p8EoMuQXaBGscYQ80ouxWEHAyl5vIvkAJVlq862QZEK5rcVN7bIsA07a6+XM3jI3e5vIvBJ2XZQHkz4D5UUqRuwxDT8NoaHDzGlpvI+j10mP2KK4ViQympbMLFqXynlSEbzkUrRB5PWqW73J0PrvmWesVoNQBh5qly7c9C1UZrWMscBZJhxSRCk6//8PMlAOeGe9087bA8AxOPstjT9g7bigNknMPESQVFEExJxVxwK5XEHtJuXpWs96LM4f4CUo9z9l2Z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzZGxwY2ZLdKqn4SDtusm5g9lt9ifT6MCPeeUxIBEyI=;
 b=HsC2e8T0HCfK34wMVGxG8gMJQTaoRpP80OfpjYE/B3Mw02p1HGcuUWwhgkjar6HihEAIJ3LupWQNATlmlcZVaafanWNFOsJ1+9wFyB3KMByEUptrHQtDXlpZshQKW5VfxQYXjuLP9JWlqks/t+LXQh19LgDdKF+6Lx/CcprrUAtvMXXC/51X7gsNDy9ZsHRYTpCRf3DlmYHrAqtvOnbEiE+mHo6W2x71opSdhHurl8koghl3AznzwaYKluBsd3aETlafSjVtsTX7L50dRlvJmcxwNixUvk3HogDi93VNrPEAMPORCNjJZ0GMg31AXT5KfGNEoEkrlx4kjDWRbUo+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzZGxwY2ZLdKqn4SDtusm5g9lt9ifT6MCPeeUxIBEyI=;
 b=FNrq0aTGTHWZd2c0XmXywM016Rk+t4bwPIIK1oCVuv4sZw/SU6BJJ4TTm3H13aFJTM65voCaRxHMiNsq+A5ma+M6i2MI2sl9s9nXU6cNfx60UynisgKeWyfXIh5t+AQ3yBwEtScG3R3wRGKFeZDfCsR35TkkgCaTzM1Dn95xAXkyNcAoJt6euyBDrC+WHenV5Aaj+x4XTeqRkDSJq83FUaTOKuccN+N9Admn+XQMKIrZgAeSC3jP3lfbN4BPdJO7dBEqE3PxF7nHU3+ZqB8I7CqdFXHXrZJl+nUKdZVDEKGqsuUu6eo1BAvRF+PnwZBbaMiZqdkiIxmbZTE6ha8ORg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB4PR10MB7015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 06:10:06 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 06:09:59 +0000
Message-ID: <55687bb5-7e8a-4d7d-a597-6f97087cab32@siemens.com>
Date: Tue, 15 Apr 2025 08:09:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
To: K Prateek Nayak <kprateek.nayak@amd.com>,
 Aaron Lu <ziqianlu@bytedance.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Chuyi Zhou <zhouchuyi@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
 <20250414120407.GC3558904@bytedance>
 <7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com>
 <0a06f6c4-5d69-4fd1-badd-92fd55d8f38d@amd.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <0a06f6c4-5d69-4fd1-badd-92fd55d8f38d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB4PR10MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 679d9ada-5448-4791-a994-08dd7be426dd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnVjcUhWcUwxNEJTVDd0MW14OWtubGxtV0cvTHFodEo0WUNqcTRTU2l4UVNy?=
 =?utf-8?B?TVA4aFhXREk0UnQvb3ljWndGaVVYME1mcE1MdVFKU0JKWkNWbXVjbklndG1u?=
 =?utf-8?B?WHNiQkx0SmRHZGpvd2VzUHNLeVNGYnRndlZZT0l5RjN2Y3g1cFM1ME5mcGJ2?=
 =?utf-8?B?d3lFbkNNbUIzMlp1MmxMYm1xV0pCbjlUN2puVSs3TGlKcjV0RURnWVBvSHdZ?=
 =?utf-8?B?N1FBM2MvbzNJL25mSlVKM0w5UnRBY210ckdlbWxwdVdvV2NKQ2g1OWR1NU9L?=
 =?utf-8?B?UFIzSStWSTEwZjFwOVMwNmR1TUZyZi9TM1YzZlpNUUdvOHpMcHhiaWVPL1dv?=
 =?utf-8?B?dzF2SzFMNnJNNjQrZHduTlpnQ3FMdGdMcVFGa3NkWS92dmZnblUraXVZTkN1?=
 =?utf-8?B?NEpORXkxM2dKWWdzRzBIWXoydExPL1hXa0RVUUxhQUI5NlZzZXVjR0VJNTlS?=
 =?utf-8?B?YWo1bHYzd1JOUHFNU0M1SEhwZi9JaXdEQ0hKWE82anpncFJJUnhJN3JBNW4x?=
 =?utf-8?B?OW0rZ3p1K0pVR3FXbHBDV2J0RWFPQkI5L3ZUamlSRnVWeVJBV2l0bTllcUI1?=
 =?utf-8?B?QzhkRUpBV3I1Mzk5TFNudjRVYWtGNmdiMGd2MmpwSUhEMGZIUDZtd0RSMnRv?=
 =?utf-8?B?SjQ5OVFvclcyTTVYSzNDeDJDWXJHTFpManRCRVVtYWF6ZXY5WTZsTTc5L1A1?=
 =?utf-8?B?d0N0Y2g0eVdLNG4yU1dsWkx0dnlhNmY2dklQQyt2bnhGUWd0NDZ6VG1oMVNm?=
 =?utf-8?B?clpwK2hrT2dKR1FFMGEvY2hJUEk1cm93S05vckkwYlNSRTBIY20waHZzNENG?=
 =?utf-8?B?L2FHaUdlQ3pyYXhTRUhCeEluaitCQjJSa0s1Mmd2aVNzTC90blB0UjgyaEpN?=
 =?utf-8?B?L2xIdzhpNFlBR25nTEFPaFB0RzRNZkM2WnZVR29PU3EwNk5DemlvZGFiMkpv?=
 =?utf-8?B?S0lhRTkyb09YTjRpRGNzUCtoeTFoUTdzRHZkN1ZwTnl0MGc1SUx2bVRsdk0y?=
 =?utf-8?B?YmRVTUQ4QnJwNEp5aEl0MHRyRlJtalIvazZpWUE4NXZ5cnBqSmx6MlljZ25W?=
 =?utf-8?B?TlY2Mlh0SjBPdXRHNGJvdmJUOTdRUGNRUU5jMkNGOE1kYmpqTC90d05yQ083?=
 =?utf-8?B?TmtiVkRyR3dCMnd4T1p5UFR0SEdCVVYvcTlpSzlyUmJhUitKWWxIMGhvdThT?=
 =?utf-8?B?bEhUYTErcmJSclE2TzkvSXk4dktZY05STWk2ZkZrQnZBT1pyc05pTTllemhx?=
 =?utf-8?B?TjVPOXBoNFZWMWhjcWNlNDY2OHVrTW1LNjhOV1IzTzF1QS9TZGZUbU1YL3kr?=
 =?utf-8?B?bDlEd3RTazMrTFhnRWRpR05ibUttc3ZKWWdWOUZCLzVETGZxS1M1SThKSXY0?=
 =?utf-8?B?WHhiSmd1eE1PamRIRUwrb0pNU2ZTeFNoY1NXQmNFZ1Z1cEhjMzl3bW5YMXJ4?=
 =?utf-8?B?aEpBd1RBZFRJVElZUWNCd0hJSjEvQy9KVGtEaWQ0czRETUcwdnh3Yy93Rm5I?=
 =?utf-8?B?dEpsMWRXN1NDK1lMUGtoNnBzTkFWdFVJMmUzN3hBZktsZG9yT2dBQjRjQUQr?=
 =?utf-8?B?ZVRlV2RRbXZ0Q2g3VUdzMHdhT0E2SS9wVC9QZnNtcS9qRjB5eUIzazlBWkQx?=
 =?utf-8?B?MGlNRHlvYk1GaVVJZGJONWtMemhQSU9sQUZtM3B5MTVnMzZRcXZsbUE5UUt3?=
 =?utf-8?B?Nnl0ZFd6a3F1VmoyVTkwSTlianJWVGh3eGhtRmRlTTRQa1hiV0RldlQySXZQ?=
 =?utf-8?B?bVp4dUNGSGpYeTJzazlwV1JxRlZOcTAyZ0dVSWw0QlV2dit6cWN2dVl6ZmNZ?=
 =?utf-8?B?U2RxWWhuSnNJS2JZUWZ2b1FnSW5YQTlLQ0VXaGtxMXIyL0pTNjRIRStBVHRi?=
 =?utf-8?B?b1ZjMTRQWVFDclZQZVFEWGZsd1JLdHlpSVlqVkl1d3pBcW5lOE15cmlrYUVy?=
 =?utf-8?Q?LZg8hQtnf3E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFFKdFpMMjlnWDU5ZUZHZ01uSitjbWRhM2NMYktFaEN6ay8vYnpJRHZ3Rm91?=
 =?utf-8?B?Y3JPcFMrWkV0N0lRR1o1MTMvd3J1Mlc2QVRGczI0T1oyb3krcFBEdjlNQkFP?=
 =?utf-8?B?WkF1TUI3dlFtcmthQmQzWHhLcko0K3B3UFM2b2p0aHNYdkRmYWFqdVNUelJH?=
 =?utf-8?B?S2hkLzhqYnVneEpJOUpNL084MnBPSnVBaHU0QlY3NVQ2OVBncCttU1hUVlRw?=
 =?utf-8?B?a1VKa3A3S1RPMVQ4RG02UTZGdnFXM1FRN2xJODJIY0tWZDVmejZFcEVQT3Rx?=
 =?utf-8?B?ZG4zdXJlMTV4TGZPbnE3MStJOUlFMElzQ1hCeFZ1QWZGZnhwRHBzdHN6TEJ5?=
 =?utf-8?B?S1dIeFdDTXRaTXVDM0d6WlJQL2JyMG51c2N5eUdIR0FVNC94cXdMQnd0YmV0?=
 =?utf-8?B?K1FBV1I3M1UzaXBiQWpzRVllRGRQQTV5dlcxVGtZR2xjUzZkMUgvaTUyK0Y0?=
 =?utf-8?B?QnI4bVNsY0VWYTRNQUZnSnE2TW9sKzAzNDFLUFRjckRJT2t6YkFHUnNHaWRr?=
 =?utf-8?B?OEVTaTVTd2Q1MEdra3hrWS9rMmtDM1YxNks4YmJhNGRSU3QrclpNUmswY3My?=
 =?utf-8?B?dGNURFVqc0p3dkdNTUh4eFZmV2JsYlMyMGVvQ1pDZGdTUmc0NHU5aTFoaTdF?=
 =?utf-8?B?VWU4SE52L2RncnVYRVN3NWs5c0Z0Q0hJRitEZnhRSE44SWFCQXRPVmpNK05w?=
 =?utf-8?B?Rk9PZDB1eUQ1YllKZHZXV3JaVzNieWk0VXoxMEZWTm1USlB5U1JpT2Q4M3JT?=
 =?utf-8?B?QllMcUZnelowdExpa3owNm10SXorUEJHaGV6NHZoMTVIMHUycjlvMmxJeGpQ?=
 =?utf-8?B?MDRISWJKazI3dkxtei9aUzJYUGZQKzZQQnN0RGVISHE3VUozUTZFZkhTbVlr?=
 =?utf-8?B?dVgxSG5uYm83WHZUaXVEYmVSU0hJdG5qdkRBdXNOT3FRbkFUVVBveWgxUHF5?=
 =?utf-8?B?bjNXYk1paGpBNGU3cFV2QzdwY211TlJKSDJEYkptaEJCK1Y4Nzh3LzhNd1ZD?=
 =?utf-8?B?Wk4xMGE5YkYrZ2JqZDRNWVkvdlVHSlBwdVUxUXpGeXV3WlAxWnpHK29aSmgr?=
 =?utf-8?B?aXhYWnpkVFhEVW5EVFhoL0cvTVNaMlphZ3U2ZmtEcjlETlhuK29zYUpOZDN5?=
 =?utf-8?B?bnFZNFJEam9zU3hjd0JSUTdKbDBvZlQwMlNFNzJqekpubjBHa3RxdUhYbGJH?=
 =?utf-8?B?MjRtdXZFbEQrZ3ljUXZZM2VyY2lldFg2TEtVUmhmb0JhKzlJSVZHMFJCbDlT?=
 =?utf-8?B?YW9KZVBnQ1hXb2ZUR205UnBJd1ZqSXZmeTZlaUlIWXRaSEhDalUra05XRm1Y?=
 =?utf-8?B?bVZDbUJUd2NNdklIYk9laFJoOHhFaGFsMGdVM1ZaRFlQd1ZqZE5wRW5OWWor?=
 =?utf-8?B?OWdlaVlxT3AwdU1tR0M3N1psQzhRUHJEKzRxT09ueHd0ZnAzRHdEcHVaZFYw?=
 =?utf-8?B?Z0pkZ1kyQk5kQmhJV2JBYW5MZDN5NmY5WXNyeW45OUt1WG5XSFZxeTJheXQ5?=
 =?utf-8?B?ZGdoSklOa25pcTQzUUlXRDNKM1BrMHZYSE42U0k0emxibTNnelhka284YjdV?=
 =?utf-8?B?WUI2dkVQU1U4RkRoUHlPcjVTSVN0ZEZMY20xQURpeXp5ZGJ0R1VWM2hWYzZt?=
 =?utf-8?B?UDJkQm11Vm9HUHQ4K3ZZWmJPc205aW8zRkFWUjdVVzJRSVlWMUYrd2xpc1VU?=
 =?utf-8?B?TmF2MFNyS25zaHcza20wUWMyWkRqdDBDZklQYmdIS291V3ppM1RlMG5DRk92?=
 =?utf-8?B?ZnlyRFFjMmkzZnJOZi9XRFRvMng1M0VFR1JyQjM1cHplR2ZJQnRhY05lYjI5?=
 =?utf-8?B?L2JnNGFuNk8ybFpZbVkzd1daUlBvRTI2SUdLbU9QTnNrMTNBRHBzTFk5ZkNp?=
 =?utf-8?B?WTdhT3FzN2JTOHJyNms4M0RCVlBEazQ5OFpwdnVUTjFlK1JqVHo4cTRUVnBy?=
 =?utf-8?B?QzBmY1dqc0xpd1REc2dzcHI4cUF3a0VXWThxclVxU2hodVMvcURlWXY0dUs1?=
 =?utf-8?B?djJldkhJK1dFMmRUaGxGaXpWd3lEVFdwc1RMdThZWG9jOWxqVVA4Ui8xdDhr?=
 =?utf-8?B?VklJbDE4NjZKKzRYRElBY0YrNkpWdWR4SnpkckhpUktFU093WU1JRytiRnVH?=
 =?utf-8?Q?R1bGDsDCvPqYwC0gr8Jpq2r44?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679d9ada-5448-4791-a994-08dd7be426dd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 06:09:59.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1kxsTHalbh8bPsRQvXXOe9KP/mRJ0MuTV2bBTDJD9xDwKjL1S2rBy4YFdsO+ymEtw/hPqtd6PUsqOCPC8MG8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7015

On 15.04.25 08:05, K Prateek Nayak wrote:
> Hello Jan,
> 
> On 4/15/2025 10:59 AM, Jan Kiszka wrote:
>> On 14.04.25 14:04, Aaron Lu wrote:
>>> Hi Florian,
>>>
>>> On Mon, Apr 14, 2025 at 10:54:48AM +0200, Florian Bezdeka wrote:
>>>> Hi Aaron, Hi Valentin,
>>>>
>>>> On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
>>>>> This is a continuous work based on Valentin Schneider's posting here:
>>>>> Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to
>>>>> user entry
>>>>> https://lore.kernel.org/lkml/20240711130004.2157737-1-
>>>>> vschneid@redhat.com/
>>>>>
>>>>> Valentin has described the problem very well in the above link. We
>>>>> also
>>>>> have task hung problem from time to time in our environment due to
>>>>> cfs quota.
>>>>> It is mostly visible with rwsem: when a reader is throttled, writer
>>>>> comes in
>>>>> and has to wait, the writer also makes all subsequent readers wait,
>>>>> causing problems of priority inversion or even whole system hung.
>>>>
>>>> for testing purposes I backported this series to 6.14. We're currently
>>>> hunting for a sporadic bug with PREEMPT_RT enabled. We see RCU stalls
>>>> and complete system freezes after a couple of days with some container
>>>> workload deployed. See [1].
>>>
>>> I tried to make a setup last week to reproduce the RT/cfs throttle
>>> deadlock issue Valentin described but haven't succeeded yet...
>>>
>>
>> Attached the bits with which we succeeded, sometimes. Setup: Debian 12,
>> RT kernel, 2-4 cores VM, 1-5 instances of the test, 2 min - 2 h
>> patience. As we have to succeed with at least 3 race conditions in a
>> row, that is still not bad... But maybe someone has an idea how to
>> increase probabilities further.
> 
> Looking at run.sh, there are only fair tasks with one of them being run
> with cfs bandwidth constraints. Are you saying something goes wrong on
> PREEMPT_RT as a result of using bandwidth control on fair tasks?

Yes, exactly. Also our in-field workload that triggers (most likely)
this issue is not using RT tasks itself. Only kernel threads are RT here.

> 
> What exactly is the symptom you are observing? Does one of the assert()
> trip during the run? Do you see a stall logged on dmesg? Can you provide
> more information on what to expect in this 2min - 2hr window?

I've just lost my traces from yesterday ("you have 0 minutes to find a
power adapter"), but I got nice RCU stall warnings in the VM, including
backtraces from the involved tasks (minus the read-lock holder IIRC).
Maybe Florian can drop one of his dumps.

> 
> Additionally, do you have RT throttling enabled in your setup? Can long
> running RT tasks starve fair tasks on your setup?

RT throttling is enabled (default settings) but was not kicking in - why
should it in that scenario? The only RT thread, ktimers, ran into the
held lock and stopped.

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
