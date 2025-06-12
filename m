Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17557223DD7
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720637; cv=fail; b=Hgrxwmwbk0QKNdAT2eQ/YI6Z6qS57a0clHjHmgYXSlpLAZROGcNLEgKQXCxqaCJxs7usVcOahcEsNVDPn3NWrdvBeKVMqN/OmadBfxw37BxvSkK0ZW8Z8jOKPa6qcbhTcgz9LWB1zyQHd/rununWkaQ+evQA2a8Mn6pPrveeTtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720637; c=relaxed/simple;
	bh=1jyTsW9PILmj0XBpV+McYcC86fTnK9UMEQBmV/WMgXU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jpgv5FT3HcWXsM72ciqfvtgoJ3hUT1RqNNxgjGQH26f1af578t8HU6JfLIo9Kpvg7jYLFQz+bdUSynhZLBhvsB4yfdFJhEwYUYw8hXnpiMjYLlyHE6fvZNcRkmc/Sav3HWGADYPHN2SaLg8gdw1u6kEGrHq717UF+wBet0U62ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D1Fmn3bb; arc=fail smtp.client-ip=40.107.237.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D1Fmn3bb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9pPvVj9o0alJNbvqyyVjV4AaNZ5ivQFvlnDOERTUzdVVQVG0bp9XC5sK+Uye7zc2J7nf1VDpk6J+77fTXPiAP2yLbGrK8e8Uq9XGt+VzBVFc0SW1xT9ZQVHh87LVb9ZSa1pg1dliWzvwKitZMahKfKX9eTuPFFkWaPw9jZU9YUvEd9B4D3Ywo+FbP2dHYZQhReRFYP3Dn89zmVbneW8N+fvw31nFxgdkWDBND+TqOT14QcnQKRZLwo2wCvNO2VBqyQbuNPwMVhnTuJMWg5FxUyD+MedskQRvV4eVmvuZUVsoFXyFKfkckQpapXvWpxTpesDjwY6JnaGyHBQ7sdOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuBIGm/9wuDLR1L549iooY2EW0XFzgmRxU3sS0hEMJ8=;
 b=OseCf3aD36yAJo5JRYl0e0xoMES7tnijFGCDSGv5iRZb5KTtmmfqMd/jsKyn+4oj3J+n8nqS7vuJ8qPAwBNBgq+CKjJmL2nt/lw4g9kRvhFc+lZxSwkfN1MXAosqcW7CVG+MXpx/1ex7/aUmbDxEyUhnjm6vPIVuaHdNaZsX7teWhmgpYzWjRXINySTAejMlyvmwA0fkRCXJ6F5VKfbUmRVIXT+sMkA4EVESJzrYNFcfNwFZDUH7Y8irKXXgwdNCaJKvEf874rWZdU65zS9mHcu78O8qN9cuvtlsdTZzAW8Wck2AEZceR3/luCpQx9E29f+pTABxecRt5RN8isACNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuBIGm/9wuDLR1L549iooY2EW0XFzgmRxU3sS0hEMJ8=;
 b=D1Fmn3bbrNx79ja1qiWNJrkQ5XH8fPzVQ5zO7FPwOTvIZrUiKtcOJlo0QLxn3UM5aBiGkadbgmhR4gVmQEva14SxQLw0LU3n3JMUWqv2ZaV0vdTDdKQ3w1BZJdnlXTtfXDKRNfGFfJ+raSnOwvlcM48qBxCcKxdPD+q36yEA2zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Thu, 12 Jun
 2025 09:30:33 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8792.040; Thu, 12 Jun 2025
 09:30:32 +0000
Message-ID: <5a673979-e96c-4dc2-b84b-849c6c8084ae@amd.com>
Date: Thu, 12 Jun 2025 15:00:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
To: Leon Romanovsky <leon@kernel.org>
Cc: Steve Wahl <steve.wahl@hpe.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org, Vishal Chourasia <vishalc@linux.ibm.com>,
 samir <samir@linux.ibm.com>, Naman Jain <namjain@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>, srivatsa@csail.mit.edu,
 Michael Kelley <mhklinux@outlook.com>, Russ Anderson <rja@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>
References: <20250304160844.75373-1-steve.wahl@hpe.com>
 <20250304160844.75373-2-steve.wahl@hpe.com> <20250610110701.GA256154@unreal>
 <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
 <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com> <20250611060607.GM10669@unreal>
 <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
 <20250612074157.GO10669@unreal>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250612074157.GO10669@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdecefe-035e-4f7d-5a37-08dda993c6d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2FjZlZuWUIzZEtvT1c5VDUxOFdTclRuRy9GU2JPNVpzczVMb2ZwVnJ1cFJq?=
 =?utf-8?B?bm1wWWhoVFpvbzE5a1dKUWhDczlDRDZISEE5UWVGdkpRTDZwTjdmRmsrVUVG?=
 =?utf-8?B?Sy9IQ21Ec012TGlzMGllWi90N2VWcmIvSnArZ04veUkwbXkzWmVZY0svOHd2?=
 =?utf-8?B?eEJuME5tRVlGcEpVeUplemsvcFU5dGEyQ2pmbDBVRU1jUGJLSE9pclZ5Q2p5?=
 =?utf-8?B?MzlVdUo2Y1pBdCthT3krRSsxbCtuQ1J2RHBBZUJNZTVmSWorNWl1M1djZ3lF?=
 =?utf-8?B?Sy9aSG10NG9GQnNDSkVtdkxKOVF4MUVSZnVHVFVUOThMWlA2R29JcDRYOVJw?=
 =?utf-8?B?ZXkvV0xJVWhVY1VDM3p6MlI4L3c3bkhxU1kwWjUzU1NvaTVKOXRKWStuYUdV?=
 =?utf-8?B?SkFmSFk0RG03c2hXeUhCckpKR0xJZHhEcFpXNnI3RWtSTFZ1Yld3NmRrcFZ1?=
 =?utf-8?B?Y3lDTmlBYlBaV2IxaXlPQUJ6S1hUdjN3WkZHS2s1ZTNQNFRLMDQ2MHYwZkM2?=
 =?utf-8?B?V0dGdGhDVDdESUZ0NGx4d1NKQXZPQnBDUXpLMHl3VjhZNHorUlBWb2tsWDVX?=
 =?utf-8?B?eHI3aEl1TkVRdFc0YU5MampwajUvWWxBRmpNZEI1NTRpMVZmcXVrdFl1dElw?=
 =?utf-8?B?SFFIZ2ZqNTFtNDJMZEpTSnowbzlFblc1ZXcvcUZ1eFJRMjk1U0lrUHE5Mk9o?=
 =?utf-8?B?TDRCU0w1WC81QmZheEF6U0FOM0o0U2EwakJhdW1pK256eTR4cEpVRXovSE5T?=
 =?utf-8?B?QitCcEEyeTRmQS9DcVZJSnhFWnkxM3ArWkJxTks5dUxkMWFVMmtUQWc1bng4?=
 =?utf-8?B?bFhDM0lEQXNKZkdPYmw2aEVwWnViLzRHMVAzZE9lY0JGWVI2NEg5RVc1OFY1?=
 =?utf-8?B?dnlYQ3RKMVBNRjJyRmlUYklOa2hoYzlXMUptYU1LRGFoVHpYdVZydklKVzdP?=
 =?utf-8?B?eUI2NXFNVW9oTkRiZGw3Qk0zYXRTbS9kQXp2MmpBeG91QWJSV3R2ZXpJWEtK?=
 =?utf-8?B?NUc5TE1lc3hKZGZuMDA0MzU3M0lDd3FNNDZOd0MwQkdpbC9MYVhIRkNvTTJI?=
 =?utf-8?B?OEc1di9FeDhNd0YrdFJjWU1PV1d3ZitZWnlKR0twUlZKMHV1dlBDdjkwV0NY?=
 =?utf-8?B?UDRRSFR4YTVMcVVTZmxWTVNpcjRXenppcjU4Rjh6V2NuQ290UEV0VUc2WmdN?=
 =?utf-8?B?UTB0azd3U3c3TXVRQlpCYU9VTWZzNmN1Z3VpVENMWEhFZVdRS09NdzRxdHNw?=
 =?utf-8?B?M294bCtQTTd3UklZbXpCcTNhK0pReTlZMlJuMHY4WC8wVjFhMXpkZFpjSVh2?=
 =?utf-8?B?OVVhV0ZPTlM5Nzh2Rm5NaUdHR0ZDOVM3cUVTYXRGM2F6L0Q3L09Ca0FZRUlr?=
 =?utf-8?B?b01iNVpVZ1VKUytRanQyM0JZR01JTjBmVmIrVmlJeS9wdWZFd24wUlVVVExQ?=
 =?utf-8?B?RXZzLzlMYlZtTEJudnN0b1JnRC9qbUQ1bE92TmFOTTdaMXFCSG5Tb1ZZeHVY?=
 =?utf-8?B?U0svQUxHVnoycXI4bEl0RzE5cjdiYmJzNGN1dlk3UkR1dFU0d3RuSDMrYXBD?=
 =?utf-8?B?TTl5MlJHSEo1S21Gck1aSDJKelkrbWsrTFFOMVNza21RLzZiVEJjajdab0lw?=
 =?utf-8?B?TDAwOGVwUzk1bWVUSW53aSttVVN6S2tjcEhHcUVaOENuQ0hsVzNjblNzNHdH?=
 =?utf-8?B?eitjTmNibzkyZGc3bUlBeWdJYXloclFUOFVCR3dJUDRwd2Z5ZVBSMDJaZ0c3?=
 =?utf-8?B?YWUrVGFRZi9wSVkvbUU2QzJHbnJGZE54bjVQTm9ybU5aVFA2U0llajZ2N1p4?=
 =?utf-8?B?ekE2cDNubzdjQncyc3BmSEd1Mm14VU83b29sNGltd0Myd0FuUEZUWG12eHl4?=
 =?utf-8?B?ZlYrY2VaMTZvcEpuUitmT1oyRVRPdkY0N2RtNWNUYXBxSkhLcnlQRmZLVVNi?=
 =?utf-8?Q?GEG3CZBEIjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVJ4U2NjcmNzd2lQWEtPdXZ2eFlxTkhVMERWbitvT3hJM1NXZm9heFQ1bkZu?=
 =?utf-8?B?bURjWmdqRzZGTzlqcUo3TUJkWXRwZnBiUGpSSFpEVzlZWnJJaUJlTFVLTndL?=
 =?utf-8?B?SXl4SnhDK1ZUbTEvY2dyYlRDMkMvMXZoTDRjWU9qQnJMcXMrRlQzVCtWWExK?=
 =?utf-8?B?WGRqZnRYb0JpL21EMGN1cUN0cWNEN1NYR1hka1YvbmRnTzZKNUtlZFViLzV6?=
 =?utf-8?B?ZHdNMnBtN1d5ak9uYWRXaWRzc1c3bC95MUFrZTZTeTZOc29FN2g2ME10eWlh?=
 =?utf-8?B?V1ovdUwrL3dFRzhUcVBQS0FuUzFsN2dlVCtmdmdDVEFIVFNCaHBuNGlWQURx?=
 =?utf-8?B?TUQ0VHBFUUtCUUY4NTEvSEFtK0F0U05DWi9WZFU5bGIzZlpxZnNHdFNsdTZq?=
 =?utf-8?B?ZUNRMnhUS2h6RlI5SHRJYURTMllSZEwybWVjM2loZnRiajdvSHpDR0pOMHlR?=
 =?utf-8?B?ZHoxcUpscEljMnhiaFlOdk5ZdVJseGNGcVdOMUhpRFcvQmVEVHUxWWpqa0xJ?=
 =?utf-8?B?bERWbktGNCthYjBLc2xjN2c5KzFBQm1yZDZ6TFF1amE1UDlyNVlZUVlpbVhG?=
 =?utf-8?B?TU1IVzVrS1IwMDRUMFJ0VGhXRjRibG84VlVBeWYzUWppanIrVTFLQ3VsVWMw?=
 =?utf-8?B?UkhjdmdiYVdKSEo0OHlScGVHT3pTVFcwUUhLOWFkNUhYNFA0VmZBNWxyNDho?=
 =?utf-8?B?Z2ppR3p2S0RsU2JmOEN6dy9qelFjRUpLN1o1d0ZnVWxRc3hPTnl6SzRncCs0?=
 =?utf-8?B?enIvRGFwSUZRWEpCK01xcmJycmVteFpqZjFIdmJMWGpZR1NFU3NSL285OE40?=
 =?utf-8?B?OVcyZWVjY2ZYdC9JZlRnSFdQci93dXkzdkFMQTU5eGVqcUtxMWtRcllIUnFX?=
 =?utf-8?B?NmNGLytUQWZUYSs0UGxQR2xsclFtdVY4UkMxcUhTVWpzN2YxTUYyUUhZRkZr?=
 =?utf-8?B?eTJIeEVnbHdSbWhwK2xldUI2ZmxaRXBTbHRFdnFiN1dxL2lMOGtBVGpEZUJ6?=
 =?utf-8?B?MTZ2Y1pDZWxxNll0YnV5Tk1KNGs1bFpxcXBEYTVNclE5N2hkK1hjbGZ0Sy9Y?=
 =?utf-8?B?eHNKcUlnV0lKYnAyQzBYTUwzOW43dWNJNmNWOUZtTDdsRHRRb0F2WVo3RFha?=
 =?utf-8?B?Tk9NVW1kUjNEUVY3RDBTMUhDai9EMFZ5MjhDc29UdmxESmpPNkVhc3NTREds?=
 =?utf-8?B?Yi95bVlhNFMzSEppb3NSQitIVENTUzZjbU1PQlovSW9MejRiNHRFamRjSno2?=
 =?utf-8?B?UlcwVEhDUGlYV01KVFFJWXFiRDYwSUQ3eUo3UXYxclNRLzJ0clIrVGtvSlA0?=
 =?utf-8?B?VE5FUzJ6eFpaU3BWZjdLN1Y2MGdkclE1S2F1bzFnWGhoMVdxaFU0c2xLUFIv?=
 =?utf-8?B?NzRQemhMMlBNNEF2VnNNQThWdDJLL01kZXRTQ3U3MjZ4ODd6NnVnMk9XN2ls?=
 =?utf-8?B?K3p4Sk1MZDlySW1ZMVVpNUcyclRoVWt4UzNJWXV5MGxMWm1KZlppb1FuT0oz?=
 =?utf-8?B?STQ3b1ErY05kalp2Tjg3YWIrNGJWeUtLU0JNZlgxZHQ2NlpadHNEUWVHTFNU?=
 =?utf-8?B?QnJGeTluRXQzVG1WZm8zYWxPeUt5UnBERjArc05HMVdEczNFVk9hM3dXUmtm?=
 =?utf-8?B?NzhLQURXdWFadmVDWTA2OE9YbGlrVzRxYmkwSVdKKzhFYS9uR1hjeEsxbUVY?=
 =?utf-8?B?ZUJrNFV5UmZNOTlEa0pzeHQwZC9WelNDOVhacmhWVlRmdFByK0hZVmJMQlBh?=
 =?utf-8?B?eCtRQy9YV0JHNld4TGhVZmo0SzZsSHMxYWVVdkwzTnRibC8vZnJZNWxGbnBp?=
 =?utf-8?B?dG1GZ0tDTG1oL1VPWUt2ZEpwejErWW9lZFZhRHZzSDNnV2Z2ZG5kZHMwYmMw?=
 =?utf-8?B?dzNWNGNBazFmRDN4aHNoaXFmNm9jUVZQdkhoTGROSHBNKzNISkI1d25QS0o0?=
 =?utf-8?B?NlVYK21yV2gyUmFWRmJUbnRNaHE0OS8zbVpYeVJxMTE2K3JSVitSYnR4MVU3?=
 =?utf-8?B?T2VIZUNJVXZTRDk5OTc5ZDRKdktWaDRGRiswN2lmMkZDc0RBMmdDQ1NuWGNZ?=
 =?utf-8?B?SFk4c2Q0bExQRkhHSVM4ZG9qM0RmbE45RU5wWVhXS3VuMCtMNUhKdXVlSUY2?=
 =?utf-8?Q?2Tqr1kHhH04A+Ebv761s66SG+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdecefe-035e-4f7d-5a37-08dda993c6d8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:30:32.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izP82vA5VeYBwd2vgmfir8U0YJOXi+Ue/bqUG1H1APGmIyAhDdN0flz1zRQ3jiEtUYxQ+bF7VweerUhbtYq/8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484

Hello Leon,

Thank you for more info!

On 6/12/2025 1:11 PM, Leon Romanovsky wrote:
>   [    0.032188] CPU topo: Max. logical packages:  10
>   [    0.032189] CPU topo: Max. logical dies:      10
>   [    0.032189] CPU topo: Max. dies per package:   1
>   [    0.032194] CPU topo: Max. threads per core:   1
>   [    0.032194] CPU topo: Num. cores per package:     1
>   [    0.032195] CPU topo: Num. threads per package:   1
>   [    0.032195] CPU topo: Allowing 10 present CPUs plus 0 hotplug CPUs

This indicates each CPU is a socket leading to 10 sockets ...

>   [    0.288498] smp: Bringing up secondary CPUs ...
>   [    0.289225] smpboot: x86: Booting SMP configuration:
>   [    0.289900] .... node  #0, CPUs:        #1
>   [    0.290511] .... node  #1, CPUs:    #2  #3
>   [    0.291559] .... node  #2, CPUs:    #4  #5
>   [    0.292557] .... node  #3, CPUs:    #6  #7
>   [    0.293593] .... node  #4, CPUs:    #8  #9
>   [    0.326310] smp: Brought up 5 nodes, 10 CPUs

... and this indicates two sockets are grouped as one NUMA node
leading to 5 nodes in total. I tried the following:

     qemu-system-x86_64 -enable-kvm \
     -cpu EPYC-Milan-v2 -m 20G -smp cpus=10,sockets=10 \
     -machine q35 \
     -object memory-backend-ram,size=4G,id=m0 \
     -object memory-backend-ram,size=4G,id=m1 \
     -object memory-backend-ram,size=4G,id=m2 \
     -object memory-backend-ram,size=4G,id=m3 \
     -object memory-backend-ram,size=4G,id=m4 \
     -numa node,cpus=0-1,memdev=m0,nodeid=0 \
     -numa node,cpus=2-3,memdev=m1,nodeid=1 \
     -numa node,cpus=4-5,memdev=m2,nodeid=2 \
     -numa node,cpus=6-7,memdev=m3,nodeid=3 \
     -numa node,cpus=8-9,memdev=m4,nodeid=4 \
     ...

but could not hit this issue with v6.16-rc1 kernel and QEMU emulator
version 10.0.50 (v10.0.0-1610-gd9ce74873a)

>   [    0.327532] smpboot: Total of 10 processors activated (51878.08 BogoMIPS)
>   [    0.329252] ------------[ cut here ]------------
>   [    0.329252] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2486 build_sched_domains+0xe67/0x13a0
>   [    0.330608] Modules linked in:
>   [    0.331050] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1_for_upstream_min_debug_2025_06_09_14_44 #1 NONE
>   [    0.332386] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
>   [    0.333767] RIP: 0010:build_sched_domains+0xe67/0x13a0
>   [    0.334298] Code: ff ff 8b 6c 24 08 48 8b 44 24 68 65 48 2b 05 60 24 d0 01 0f 85 03 05 00 00 48 83 c4 70 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 <0f> 0b e9 65 fe ff ff 48 c7 c7 28 fb 08 82 4c 89 44 24 28 c6 05 e4
>   [    0.336635] RSP: 0000:ffff8881002efe30 EFLAGS: 00010202
>   [    0.337326] RAX: 00000000ffffff01 RBX: 0000000000000002 RCX: 00000000ffffff01
>   [    0.338234] RDX: 00000000fffffff6 RSI: 0000000000000300 RDI: ffff888100047168
>   [    0.338523] RBP: 0000000000000000 R08: ffff888100047168 R09: 0000000000000000
>   [    0.339425] R10: ffffffff830dee80 R11: 0000000000000000 R12: ffff888100047168
>   [    0.340323] R13: 0000000000000002 R14: ffff888100193480 R15: ffff888380030f40
>   [    0.341221] FS:  0000000000000000(0000) GS:ffff8881b9b76000(0000) knlGS:0000000000000000
>   [    0.342298] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   [    0.343096] CR2: ffff88843ffff000 CR3: 000000000282c001 CR4: 0000000000370eb0
>   [    0.344042] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>   [    0.344927] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>   [    0.345811] Call Trace:
>   [    0.346191]  <TASK>
>   [    0.346429]  sched_init_smp+0x32/0xa0
>   [    0.346944]  ? stop_machine+0x2c/0x40
>   [    0.347460]  kernel_init_freeable+0xf5/0x260
>   [    0.348031]  ? rest_init+0xc0/0xc0
>   [    0.348513]  kernel_init+0x16/0x120
>   [    0.349008]  ret_from_fork+0x5e/0xd0
>   [    0.349510]  ? rest_init+0xc0/0xc0
>   [    0.349998]  ret_from_fork_asm+0x11/0x20
>   [    0.350464]  </TASK>
>   [    0.350812] ---[ end trace 0000000000000000 ]---

Ah! Since this happens so early topology isn't created yet for
the debug prints to hit! Is it possible to get a dmesg with
"ignore_loglevel" and "sched_verbose" on an older kernel that
did not throw this error on the same host?

> 
>>
>> Even the qemu cmdline for the guest can help! We can try reproducing
>> it at our end then. Thank you for all the help.
> 
> It is custom QEMU with limited access to hypervisor. This crash is
> inside VM.

Noted! Thank a ton for all the data provided.

-- 
Thanks and Regards,
Prateek

