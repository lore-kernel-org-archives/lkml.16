Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B32C282F4
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909459; cv=fail; b=fyRLXMxxhgQGx73g1Nq23M5qO8zpRiU41tY+T5hproQ+r8srtd8S8L6uJ8k82KYAC1XDiAhXRZ7toQt4Qh84S/+9ldGheSwIr3jZAsWtbX6NmOEhT56AryyeSnDRHzY37j5tMM78aorHgoyrqugB82sqhRbB5tdxUWBLWAYTA6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909459; c=relaxed/simple;
	bh=k5+GysyjKD3Se+XAoTS6su+20FepdoC/Ls7ghko3Sng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gphGUJ2P37ssydcguZdGaZZC/4wV1OiU7saWjddFlzP7y/kxuJ3ySiIhN6B5yZniI63aVSyf9ZR6G//yUWn6C5hBiryrZtYD8jQvN9Hr3PfcjTyM0StIoPt/GQhDJLLfGGOg6sFWQb5E6f4rf9k83C9aj2F8g9cPHh46EAGNpn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D/zQim3z; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D/zQim3z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFqdLaM0EHzHXl9gWKSQ0yObIeMvYhWF8V1lEPvJfixfXyIqWsn3E+LFmqIZZXIZXAo0AmMG/yMzDAMmLCx+9gdG9hyflAVxcaQisKj3cjfX5/04S6Rl/lLfAHi6Y94b7V3Toe3atPY0GPn/jTfenJYN1LVMsdko22UTdom8rJUSbSz+BGFwUgWeYwo2ph8B8nFzNd4XQt/if7YCkIk6EaF9aTtYCVRPXYZmVnaButilPmh1ptJ6vR4VrXOZjj3UVYG/OSRKE8XnFPe0MKaEMmZFGy7ZZUwmZBAdtHF4zBD1JvTGjrEjP/P57i62whNn8LQw+5aksaO7ajIX26NVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWzmz7hAj7DA8oy2AiCQgGvJtAApGgMgoRZzecBV3PM=;
 b=j/wz0K8Qnij4ZDxCD5r9a0HKV3lDgsY5/Yq+wmbKCugyyF+jCOuRpMwJoe+cD8e3tQOXlyMjF4CbjgMXJ7ZpmorkQgWSthMmToI4d7Ro4b1MgAmKOyJR6jFOYG+5lUMaHCir3dM6T2aIj3SfTAPKqxbkC0la0fUJrap2jebsZb6uAksIFUfiO6xYIT2Xom72sYou0uOxw9KF74+wTRBu7SV6XvhI/FX4HqsarkBnff6PTOW45uufm9Ann83CqKYR0Bk6gA3qiVBLPeSXjj4FH6fEcFN4i9aMrcLpSa4Z7nAiCMP77hVyL9ymc01cbEc0DTlQ3M65eKLcfpqNrTkN2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWzmz7hAj7DA8oy2AiCQgGvJtAApGgMgoRZzecBV3PM=;
 b=D/zQim3zr60Vm+Ln9MAMCLuplcJa0rIVwr8m6+DWpAJSfQiOfii1umJYh2OMKW6CraRiOAuAZTMkimegLJRpxd7tkQClUaUx3G+PLfwjDT+NBQK+z1OT4jwo8F4fO4s0NE2SNQC0PzgsA2z/WEbegJVDez7lEEIRyqkIkzKzRjV7YRmDiJLlkT/x64D0jqMKSSVNmstcZlUuhybN38RNP+NIcy66xVf3UshUIZ7Uh1zG70Ynwmnnvc9atryI9K252ptDrajyjMuD0LCSP18+qKjiBk16zKdm0yTbLDX2N2eUxYWwA20nVVqYfZun8Y8svRx9UJZq/gkQy+m2R5kPeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH8PR12MB6892.namprd12.prod.outlook.com (2603:10b6:510:1bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:24:12 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%7]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 06:24:12 +0000
Date: Fri, 7 Feb 2025 07:24:08 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Changwoo Min <changwoo@igalia.com>
Cc: tj@kernel.org, void@manifault.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] sched_ext: Add a core event and update scx schedulers
Message-ID: <Z6WnCHiwkvahtdgR@gpd3>
References: <20250207031338.393045-1-changwoo@igalia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207031338.393045-1-changwoo@igalia.com>
X-ClientProxiedBy: FR0P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::8) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH8PR12MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 60324f8f-da94-47bc-14e8-08dd47400985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6/8X6vtBUB8L9IbAqD+Z2fNnPdlDw9SmyA6GpHco7744TESBYvLQK1vHsatz?=
 =?us-ascii?Q?TmzNooAmtDg8l0c/SqUcZHUZdcGlmFrXftC7kkrd7TJ22JPthaP73ejQIiy5?=
 =?us-ascii?Q?9xgwNHGtIA0SwsmNKFqQKkry0TTr6YmYze7rTBDi7WKy6uoif7PLfBapUAxq?=
 =?us-ascii?Q?8K8lXsfdO+U0ZX69prJnJrUfY1sfbqi+BqlGODnAcpc2TyBAalIWPsTJyVAO?=
 =?us-ascii?Q?TTakolT8+gmPE66iIos+asL4yRHJeUk7Vd7kTv4eFwTRtWnJ436057zthIRn?=
 =?us-ascii?Q?rne8Uvc4r3v0PV4T+MTGYYxG0YajuURd+aR/bVIzFJFoYAcvp9dsNzWf/Bvy?=
 =?us-ascii?Q?ZJwF4pKUiVjcNtCYKd8WPiseqGS+h6nGCqW2hKwWk2w2rzvveN7kzMOXGv2n?=
 =?us-ascii?Q?i/t3LE54yWy+4+X3KQ2at5AoQzXckI1dM7805kYtkEq1LTsn3StuISixqhUb?=
 =?us-ascii?Q?crj0cHbNmDeUKIj+1bnaHf82omwIqz+Y4ZOCR6mVFNeaphLQ1O5CXk1D5B+Y?=
 =?us-ascii?Q?GzKpcwypVAOpqmKNHkKt1+lUNHjUKz/TCCat4sNGfaItF00XE54WzL25sWhS?=
 =?us-ascii?Q?8uKOC/LfTfx6Pw+91J81GlWsRHQ+g2+L0UKKnlt49E5gkHUNYQHrbLYHB2SI?=
 =?us-ascii?Q?/q2/GEJFbn6taGOVLZ++wbyPUIUOZLPqiuYOkcsonZ9V7BSVGgsPp/5WcBK7?=
 =?us-ascii?Q?jgkmct9bpVAsFxppbDo1B6+1CMe4TJbGz79Q3wevPgsrTNqhcMOBBaIFy/0Z?=
 =?us-ascii?Q?1+0CB4jrec4EHAvc0JVpaRtNOnW20fTITYAPvsPvMUd+RSU5UXjrYoTrv5zx?=
 =?us-ascii?Q?8HWHqe/bIbPcfc1CfjvoEV9fATqNBKjcbobS+n7RE4uzLT+HBOjn3m127Qev?=
 =?us-ascii?Q?IBfh8seFyZXrAKVx/yWLOASCfP6T6hzE1RCL4v2pEPRdapfqmyyVDRS9kl7+?=
 =?us-ascii?Q?P2whN9SqxE/REA/p1VbiDS1oAF1mT6lpCahC/utJDJkdKiaxyRBkyh3T+eJL?=
 =?us-ascii?Q?ZUeLX89dinjvn2dCgCmzixokIuzomdLdjeTCjpZnFSFMbkoiNGF2fuA7Z8/I?=
 =?us-ascii?Q?JkwvX7fq1GM17aMRcGlPkqpW2P694ReuiW6BXMGKuwbRkq7KnSrxgr9IVeTm?=
 =?us-ascii?Q?TXwfCjx9eR1cjFPSDQ1EVkeqtEEyNjsfizMTXZ/iI+tyCCAwdnw9epdCwXCs?=
 =?us-ascii?Q?FrEctidlnAUo6XnWf8J7hJWQ7hWr9yfQ09rnxtI+5/coF1/22yL+vN6ReiEX?=
 =?us-ascii?Q?to6XJVv+5qfOYnqOpPXyaxcIuo7OsYsHHyvXVjfULhRUS8UmjBP5DM9KLp+G?=
 =?us-ascii?Q?8o+D8nn730ET6MPOq1iA/CYwKGD6jM3TvXwYN91ih+nDqF98eO38QKVUO4Jm?=
 =?us-ascii?Q?B7FuAK/v0/D0jNw9eRVkSTyj7GG4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hVDRLYyP+eIU0+1MPqqr1iagXg+MHekBvMkiLzBnT9DVxNPJPusEb8JJYkyn?=
 =?us-ascii?Q?4WvHMijPxcfhlGYTsQtdfJs80/Gy09adHsOK4O562B7dRv13SPLotQMnUUZu?=
 =?us-ascii?Q?Fvpe7ABeYJMh86LUEbKxXpjCnohLr0DMyeeGfVvpdt2zNVidUY+7bwZ4yQ9q?=
 =?us-ascii?Q?6jjQgziUiGXf47NwA8U2Hi7i74bG3cV9B2+rs8848usrzq/cwn8WU9Vc/xN1?=
 =?us-ascii?Q?MYyqe9tcrft25DucjlzuxKvYgx9djtiXwDUiQx8xiVLLIB1lle19l/DL5EY8?=
 =?us-ascii?Q?/6it7s7rHdvL32F4wvwRm8jeVOOzSHz7xlKZc4xKe6rPBNcgVFsD4sSpn12q?=
 =?us-ascii?Q?z7VH3qv1i+YUGJ/W66/JMZccIs/q0RM7D2148CglO0uaNvfW836XbC5bbTqL?=
 =?us-ascii?Q?vZ2K/+wqhq6gkQfscjrMNMLSc4nzRGeCG5D/hCN2y+QwJ6YFITm81mGtr3SH?=
 =?us-ascii?Q?o/dMtPU33zqrZjCaTPeRZf+xl12CxcAcYVYTCCFt3xHT72DEzeB4VTlzYwf1?=
 =?us-ascii?Q?oLst/oz7aNvR8peqFL3DlumTHsHUSvNsoJ4BQJVTNmBaLp5CkArbJNRveHnj?=
 =?us-ascii?Q?ECk+bkCC5txtf4BYW+H9amWoYO5elk2mAAUB5BLjEFmJmMzEu7MyR8CBsoTW?=
 =?us-ascii?Q?RZ89XeBI/f+mfj7xr9iYSaYnfN1vYVydtAgLck/lnYv1kCB15EQc/hQ93600?=
 =?us-ascii?Q?vnsn4VQoWyyBvFoZlSgYzQj7pknZJyTL/AR1gSdxEV0WRUdY2OkQc009LNVM?=
 =?us-ascii?Q?Od7k0yA54lx/ZPWW+gWq42QH5ftQl9KSHjhw7uk4Ak3rbloClomsEpXgLEON?=
 =?us-ascii?Q?rnkSjJhVgUi/JRzdUGRFRPb48keSpzXzZ0vXLLoN4AEXUiPYgbnABWS+iawB?=
 =?us-ascii?Q?zECnAPN/CioMHQJtj4mBzrPqT61mK3Vq8moB1gZn+VUFIxyWoPHGTix7vs3H?=
 =?us-ascii?Q?0FxCDzGg/JhaliPHb6raUbWCBrvfm1NBAqGOmxFCBCGZb4fsJG14T2HcBTfC?=
 =?us-ascii?Q?+DxZRDpL659+ec3SjeHqcrFXb94cozF3dwh+dCbYHQWklIqe3+Egwx+UWGxU?=
 =?us-ascii?Q?EpfzE1G0v+YP5KEcCLJLcyHWID0ETp+cMX61DGkrNAcvXQpKfQIIwPlMA78F?=
 =?us-ascii?Q?AWwDCSv0JnleECHe+JyFD/QtuLTmoOMS34lVddaiidsjuONQQ4TizJeXlocQ?=
 =?us-ascii?Q?Ibgls7YvSU5bJX70AiWbGF2M0A0yZG5y8gus4Ve+agIsBEu7RWZ4Kav2qLQK?=
 =?us-ascii?Q?78Nj99FVSfx5SVceeB0kqpgXkQHkhI3HgKk9cD04ciHEF05Y97XdwKPCDVqK?=
 =?us-ascii?Q?2WQjA7yx5oCTzpFn1aufYXa+WE6ZPjEda/yS3etlRiNTh1mwn7IJhHOtctE6?=
 =?us-ascii?Q?/QNwDfiHQfHx3OLHRWz4YzXh/Vw4sJlkBAwQjkKnp6rPYiULfUpZb2CadRxl?=
 =?us-ascii?Q?lkbvSYCzsGiKIkKaLUQ0LDK3znh0QBG69OezCASwGeIa3HhXEztn31rnx6AM?=
 =?us-ascii?Q?bNNtnvpWRNTZCgc3X/j1HzA47c1xq3HlQlXpdX2l/gKqLq1MpAnw/y+cF8OP?=
 =?us-ascii?Q?FuPNnxPXQpKQzm/Mh0kY5vwz4c95XjTKoFG8BoqO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60324f8f-da94-47bc-14e8-08dd47400985
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:24:12.0829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dI5WL3cC0Ka/qn656pSWb/kyavunDyE5eCGc+v5bTnWkvb7rM8t8/3DidLlJUdVF1CrZzSzcb+DcIRjsPubeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6892

Hi,

On Fri, Feb 07, 2025 at 12:13:36PM +0900, Changwoo Min wrote:
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

Not directly related to this patch set, but as a general thought: would it
be useful to introduce ops->slice_ms (in sched_ext_ops) to override
SCX_SLICE_DFL?

With that, schedulers that care about latency could set a smaller default
time slice to prevent potential spikes caused by the implicit use of
SCX_SLICE_DFL.

Opinions?

-Andrea

> 
> Changwoo Min (2):
>   sched_ext: Add an event, SCX_EV_ENQ_SLICE_DFL
>   sched_ext: Print an event, SCX_EV_ENQ_SLICE_DFL, in scx_qmap/central
> 
>  kernel/sched/ext.c                | 15 ++++++++++++++-
>  tools/sched_ext/scx_central.bpf.c |  2 ++
>  tools/sched_ext/scx_qmap.bpf.c    |  2 ++
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> -- 
> 2.48.1
> 
