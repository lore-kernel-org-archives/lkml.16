Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7571E14A4F0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738910769; cv=fail; b=AwKGokuQnEAt5woNDess5R4IpLTEd5HECy1q0vsSeQkGPS8LhtjE4VCDMmrcGrk+Em/aIkmVK5fD11q82B3Oy0aZ4Kna7IkCGWID/X4WhnNYUGngMjKWzKoAi3fYKjWgggGouTd2f5liCCEgwKLwQGzi2rYtME1F8jDc4dPSNC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738910769; c=relaxed/simple;
	bh=MwFp2arfz4D6dXXAJTGChHVUovYO1w47QNgXyGix8KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ms8voRrOciQ4mzctB0heHymFID48Lh0KLWSp/hLPDP762vHSNIQ0XbAMSl7VMdAFAn2bOzXgFrQWHbhOTsn/FDmma8QTn5NH/wjTe+5fCsCTZJ7pWwd9V2ZSUTh0xlvH/7eNuOFVgkatOEXYHnCVZCj4nbCgYGgHqg67NlhP+78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p7gnZIb4; arc=fail smtp.client-ip=40.107.94.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p7gnZIb4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygfV/5phNeHZRy9jwsIpKY25BLkGSfaDEzWv1sYZWyYQWMaejq5Yp6KzQ/+/hazSoImF1nuSHU+ngRejIRHod3kyAra7bMtYjLwAAXtv52IylcJKP/6aTBZTi7NgLrVhMhTpSnmQ8yZScR4PEgXDB3pgUwrKCzFsXhltSiLsTPdLLg7Y9Q3N8KT86Ly6WuE6GuZhmVuuhiFlqqkG9b1kQrlNcGPft+j9Y1HxhgocGK4jMc4A7okOZYibPFstsxj3Dd3Km5AO/b5yHtX97CmxPPki3BcAkvuLJZJDw3UQGx3g3cTLbncGm25y+mxsOjJvYe+RMg/T+MqrF+s2LNnidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZoc8D4lMsq9QviqRz4uR6tukqNNd0g2z6fa97VI43M=;
 b=AJH9mnMyZYDWfqI9aO2oCEfrpf9QYXph2uTne5tlEU++yi5zkhPLYe/wenTVcmysbeGuD1W3quexhTCcC0K22vwG0MKP8WhCahiITqc0GnNQA5l7tUJCl1q+WkrhMQ3tqjmwyrtF+tHeFZpKJpHv/RQqk4g54YqR+sE3Gqg4VKCwCRiCNPyAIykxDLBbqD7Xh57MpkwJ5ISe8cKLP04plDT6hnlKiwrGvS4c9tWNtrcrPDA+LYOkGkPvskB2jiAugZgFgFzo6BbzAzuGlZd9xtqRyFcNyB56sY6dZfdxdUT9TS6hljvqazRUizPsi4FtQukiPpMa8FuRSW3AGd7MaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZoc8D4lMsq9QviqRz4uR6tukqNNd0g2z6fa97VI43M=;
 b=p7gnZIb4mlknVElKjZg9+rC9Yaa1It6szxD2yNVGFpS08mk9KxJAiXdWbFRWebLIMGlwR5fBpqUOqm9HtNAfw7QZzG3kSbpSAlqpglguARCYcfu73o1EADz/Q2MUlcFnahF5J+aZ17WdhMUaTbGTWKi51w4zRAUleHacl7C9QW85TbOOd4XtwqjGSAFby+/1xBBEX9yeDhJBEZhMe1InYAN/K+NTWtsx+Ji4HFgSfb/sJrCDZlzcZqLxXqXVgAhMEn5+pzjKdZvprkE8ZixS0MULjQZf4+ArnDqky//VYNZoR140Y5WljSwGz87IH0GeftikKA3C1M/UrvT7z5ww3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH0PR12MB8529.namprd12.prod.outlook.com (2603:10b6:610:18d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 06:46:05 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%7]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 06:46:05 +0000
Date: Fri, 7 Feb 2025 07:46:01 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Changwoo Min <changwoo@igalia.com>
Cc: tj@kernel.org, void@manifault.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sched_ext: Add a core event and update scx
 schedulers
Message-ID: <Z6WsKaGx2zznLCmp@gpd3>
References: <20250207064052.399227-1-changwoo@igalia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207064052.399227-1-changwoo@igalia.com>
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH0PR12MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 805e3d8c-3338-4f6b-2d9c-08dd47431850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7BHQiMMun0z1PcYXhadirTmh36GSBKJrJSSjcwLaJLphs++yxJkqTvOvt3nf?=
 =?us-ascii?Q?qJTQM1a8qSZAQ73cDL/3F813ihYQ7fzZVOD/3t5O62xDNUMCN0jGZnHh6HLZ?=
 =?us-ascii?Q?pzbM99+bZhMyQePvaf3Ll1PZsY+hO5aHpAnSwKAECfKi7RUn6J029UzmEiOL?=
 =?us-ascii?Q?5F5Dakt6jBBrc8C68EILmGQs+LeMpkLiaBdrjdwekBGstd5LsMBQHiJIuWh6?=
 =?us-ascii?Q?imBmNPu56wa29TApeGjhRbthzHDQU2W42gElE/KJNzuowQ8GhQZbYgLPg49c?=
 =?us-ascii?Q?HDiL6/OtwV/MZwtD/ZCjSiHMI2/DSHjzeUpUn4x4UiCLk4wgbImYMtkaPK7w?=
 =?us-ascii?Q?NpzQj93r9oLnyiNf02fxvaG8iL7TYFhRWeKBS/KfzHGQdUm1zS0mnIjmpOwR?=
 =?us-ascii?Q?9wOU/pV54yfkAWAqD8voaxbPXDIF5HzyAO1gH8lbQkmjDMknxlUWoD+B7HKD?=
 =?us-ascii?Q?oWmFHYRnsMMf++t+WZGSJ8l/yo48Ljm1cFJQzxAEhSNGyxCNahn4W+MWuj6e?=
 =?us-ascii?Q?T0BB0Nb9kmhxqsUnEWXT08+uagwUaDPmh5P5elGocBWo6iWmHIDHb6+APRsn?=
 =?us-ascii?Q?IoFRpxTGjSwMF85gOkqBd70gc8Gw0DJvhynvwEZwl4DVfmO+XcmDfdzHgKZC?=
 =?us-ascii?Q?e93HmdaZJ21JIIzSGdFSUYBrZ27YUAG7LhcDT19Nl0UnFUCyZ6m7Y0CLkfX2?=
 =?us-ascii?Q?9JMu3dGDMMzMsjSJPOkWOoh8SHe4ShAlTvl8cuhxx5n/ECd21NL6j2mAZnj5?=
 =?us-ascii?Q?JNwvczK4SkQelQaz7vFJJEm62W9ePwC4c+WNaS/Z5awaJTar+j8lcfWhdAar?=
 =?us-ascii?Q?3giueGu6VuGm4JgSzdTzKyqB8PAWC7xxGFS+em2o8eVyXfK3hlqOhgNPSFb7?=
 =?us-ascii?Q?7hriUIo4zySK1n0kBdwm0K0EZdyYCeBPhy+Pyu9GffAB1KUPsSHRpAi/5VwX?=
 =?us-ascii?Q?ODJZwHaTfc+FrEk3nIXhsBsf7poz0P9371kX86RUnxhG2FHWcQyvEoV44Mzd?=
 =?us-ascii?Q?8JZ8DOY87enhKWsTddvTlb4VszD5focU2NtFKqODcgOCnBit1qv2Rx1+jDI3?=
 =?us-ascii?Q?1QfxEicdkN7LRLWE9Hu5FOxj3Q/bbYBUsCnBzmUtPfHhUibGXC4C+i5v5LKQ?=
 =?us-ascii?Q?jMCJu3vAKbPYdAyP9rpDmEEz9HHJzskc5H2OquuKM27pF69JpoEcvz8ggRGl?=
 =?us-ascii?Q?RvOOKC/fQeL+ttpbl5XSTtry01ZZg8Qs7dw0MwqIZt6DAlJnLLvqRQSEmLME?=
 =?us-ascii?Q?iSMvo5qaihnMOLM4+5zoXIVOaSPhCpkI3bPDRcwjRNijg+vUAFvpVz/WLi4G?=
 =?us-ascii?Q?i/Xc8+mw9dVlefilB7luDj616LvpZLoRcujBakbSGuYhZEnVIsumUCutTrhp?=
 =?us-ascii?Q?+lOjNPm32mu4OEU0Dd/Y/I7ZxmRG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KvJlEqnVYF1yfhpt9QXZ5ujHNPFRHe7b11TCMoJoTyOWEr9s3zbeRVdemshm?=
 =?us-ascii?Q?FA19gMO2/5gu4xzCS0LyLKNn01DWnkXxUWbu9HeY5YGFjW2RJgDLS3x+EgTZ?=
 =?us-ascii?Q?gFYeIZKIfqAWVr7S7FHFRL4Jupj2I+yu26I9VCR8vERkK2U9EW7toQd3U9a1?=
 =?us-ascii?Q?VLxllDDXLt+UqGM2E+iPktyI9jm1HsyZ5mrUIlqZ6FJ3wpUDwGHHKvNOHzkX?=
 =?us-ascii?Q?YvfgNbKw8Av3jn7Ri2X8q6c/ubTAZg41OE7y9zEpM3bNMQElDzhmmLH6uccB?=
 =?us-ascii?Q?/vgaSbN+2cH9jM3xTyrPuaiw+qfpit9wv/eu7CUCT9t3wbnIt/u23T5wlXRY?=
 =?us-ascii?Q?pcJsL34Xg/RF20XVg8YIC1J648nZ1J1SBvpU/Fnuz7QybjHeTwuflYlNke1N?=
 =?us-ascii?Q?tp5Ol57LdoTbv/LlI28ipMXCye9r62xp6Vrg7WOY/4M66assdZ6lfiX3RMNA?=
 =?us-ascii?Q?fmAxlMCo46ap3pIR3ufIGv86OzNFMObQUUQuf6uBtlRREcUYJ0J11Gc5DX36?=
 =?us-ascii?Q?BduPFRkBZUrAFq0B7K2ULs74xtBm/WvTkQpFbEbq89zGjkHJ9ji3/hD6wfjr?=
 =?us-ascii?Q?oQl1YRtwunDvcRZa+CPpuSCGwCZze9vV0bg0IQwBNMy5YXzm9bZliz5WyfzM?=
 =?us-ascii?Q?hawj3rXx6qiUkLeIdpHlkqj0tfOjvOgNndUNKB86xb4BiC/28mYll9q4aKYg?=
 =?us-ascii?Q?CSi1pYt1xd+oWd+Uql8QQrvEiLNBPGKfupjYnOJ2hfrvpxtmUWfWijOEu+87?=
 =?us-ascii?Q?eBAIs7WDDhaMhnAewEGERGt9euFTHY1bf4tUFcxrbaoQAkz67IETd1tjUfb4?=
 =?us-ascii?Q?EkawFdElCQ3qkFFRbOI316K6wUEZJjGyz6vlZ8SyZ31UXsqG+1qj5rnn0sxl?=
 =?us-ascii?Q?Dxi0JFHuWvB1T+nUa1xQt5DCblmWq0sn3Xr+ThaBRgCU7sD1ay9f54pYJalM?=
 =?us-ascii?Q?95u/T+Bk9dJ5Fdalt0Ts4nErKJukQxxS0KWG2ib1zwMJKIhGoSscOKGtOd52?=
 =?us-ascii?Q?HwffFN6lGmVGEBe3xLBd6XKNKo4cHV15Yom6yeUxJW46pzZX89aP5gu9Wmz/?=
 =?us-ascii?Q?z3IkG9JPEsTr2MbcDsyixNtrjtVs7PkWdlzJd+o5K64rT5HFkRd/qFWw1VMg?=
 =?us-ascii?Q?gDUr2F+L4Qwe/f3MtoA0mn6+LXZvPdi1sYnxJmny2yerY73ueLuZ1yKo5S4D?=
 =?us-ascii?Q?wjYrGaDErWMRiU/jSSQC3JS2A4Y2Jwh5tntoEh3X5+M2DxG6bo6gkpqnapmH?=
 =?us-ascii?Q?G44b8smHx4GK4FjVhsIRPnWSe5ZjoJvpGr6btxU2y2GbXgyNwnfcKRHA3ojq?=
 =?us-ascii?Q?OUAKS/Lk/3MtdHxct4q2xGlC4qyOuwdgQX9DG/43aPHOd5vp9sO5SAYXPs2s?=
 =?us-ascii?Q?N/8G9r90fHrvsDOdydNXsTdKWJJSj0qvUeuCYS6xFcnp87F7hBRJGpJzyLDc?=
 =?us-ascii?Q?ous7wLCsSVATYelldYlJc1TQOXL8aFkdva/eXlVqTL2sn3rScd/1F0o1wJ1b?=
 =?us-ascii?Q?O9c+BLlQQBgYSLp3FOd/e1lEXr4ngt0MyfnvVZbBGNbhNPf1DQoKaiAChupy?=
 =?us-ascii?Q?jXjpwkuAVbCbMd8hm/XQPvxg7qFVUerWqvLcoS1r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 805e3d8c-3338-4f6b-2d9c-08dd47431850
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:46:05.3559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDvX6TlXr4eDjSUbYKKO6KqfXYcXt6eSaCQ408uMeS0giRp847mqAH8eprc+0MFr3kDKJ6esLi8CAZ/0YzamxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8529

On Fri, Feb 07, 2025 at 03:40:50PM +0900, Changwoo Min wrote:
> This patchset introduces a new event, SCX_EV_ENQ_SLICE_DFL, and updates
> two scx schedulers -- scx_qmap and scx_central -- to print out the new
> event.
> 
> SCX_EV_ENQ_SLICE_DFL counts how many times the tasks' time slice is set
> to the default value (SCX_SLICE_DFL) by the sched_ext core in the enqueue
> and pick_next paths.
> 
> Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
> of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
> Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
> scheduler bugs, causing latency spikes.

Looks good to me, thanks!

Acked-by: Andrea Righi <arighi@nvidia.com>

> 
> ChangeLog v1 -> v2:
>   - Instrument the event at select_task_rq_scx() when ops.select_cpu()
>     is not provided.
> 
> Changwoo Min (2):
>   sched_ext: Add an event, SCX_EV_ENQ_SLICE_DFL
>   sched_ext: Print an event, SCX_EV_ENQ_SLICE_DFL, in scx_qmap/central
> 
>  kernel/sched/ext.c                | 16 +++++++++++++++-
>  tools/sched_ext/scx_central.bpf.c |  2 ++
>  tools/sched_ext/scx_qmap.bpf.c    |  2 ++
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> -- 
> 2.48.1
> 

-Andrea
