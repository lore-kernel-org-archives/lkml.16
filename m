Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7FF13C918
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745472412; cv=fail; b=O8c2YMjGBeHxGNe5nlYJ9HKVaAeIVRStkVzd00QhOcPaiBnBvNFxAPYk62CDd+YEuLiHBm64qvEiwm0qVF3CzrTjTE6hGCsj9KpOXiznAfGqWMrPAdid3XW0BIkbWiY/WSoN4MZtZPGyjig2WKbGUjF1blLkv3AGu6xfMK4xK/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745472412; c=relaxed/simple;
	bh=uzUj+ssT9wzKvK/woQ0+sgft+UUk+6M+7UUhzrKiOx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dZTO9UGbpMJiDVCD72Hr/dKCGLt1LbjgJFOGR6X++u5O7xnxgrf9JAQAXZEYGBa+gu8b7jkaiwnKCq9DqspTSC5llTYL5CKpit9K4GztBZIbOzMLGFdD32z/0DqLpbKEhTSQzASp/gBD2LQugO2sU0uAPIy3NMf5jrudXAMQ/Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=havQWNvK; arc=fail smtp.client-ip=40.107.220.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="havQWNvK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNrBJxoo3ByDKp8Xi1ruDaf2a6zVtE8qs+ekD2oZrDyPy96n3DqY7ehTiOXe0bXGHo8ElLhblVPDWANYlxHJLAR6Y3ewqNRZjYiONlJiInNiryTKv4Zhxvi71n3xL9UgiEykbWc2Vshqcui7TIaY+LX2jPnHxcsRacGR5iWAfMakobSkP5V4XaZ8N7cUbJqaU60YXFr0uhYQ7D72TV64boKqDP5pDX6YWDAOWi2tCTLD7LDdFKqqv5FsTz60kJIfPaBZ9wMTwsdSYskW1Wwt4OZneZiLlsm1yCl0+ON0G1S+bKhpN2Xoj8hAHsaZgtb5ne2U/YQeMaqDQTsOiENdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5mvKPNrgeJKWB7KHjXhgubOC856ka6zeDONcqXpVIA=;
 b=ouZ3dVCpYRESwkFWSGBf4Ua+GxTIDZHix+CTMn8Tlfb5zP1D4Wty7DNdgoYCOEPggNqD2XSY08aQmrhc+pAjvoBoRuSrPBJngy1l/r3NE7dtu6+Fx9lxGF9vvyyhglWy4gjJpEvYFPHqFfN8UQGFkhz+A16PGAlbIKzNH4GHvE05rp1lHDiE1JPLTth3NUUAvvu3SddRZ1PLrUHl2aBpEIyBdaZgnGTuvgSsxPM30LuRsJpZPfKAClG3Zk+EuL031ygQ5kVC6VfzmwIZqOcHTbRKuVB7cL50Bw4mJ5PCU5Npu5Tv3sqlLj5CPjwx3cJEQPNJdX9WKhLCOMWh92fHeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5mvKPNrgeJKWB7KHjXhgubOC856ka6zeDONcqXpVIA=;
 b=havQWNvKa4Eg/NSh1bvLD8XN6Gm5yBM165HA9qRCuytnReVli17jxbSJ5s09eCP54vIPR1/oKZbWWS9abSAGmjAHf+8htiWvm82HqKuTwslNaUwSfzO1RIhpcbD9bEJTvc8M4oFvXw4bx0rjOUmi9pvTo89eWgzjhu7Nd+dbP7kKjadnOgorq+EIDk4id11PctlRdndRzRRMSdpbLJnbd15Ka2duUaDv59x7SVausPI/gEg5UTgtzbAaujobvhm1gMJmoMWfh9I1XrcNM+Yymywl/61krnE3ugJX4v6A2h/ATQHCfRZDhINP56CRdQcYIgk1NKPJ2AROljr040mIeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) by
 MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 05:26:47 +0000
Received: from DM4PR12MB6424.namprd12.prod.outlook.com
 ([fe80::8133:5fd9:ff45:d793]) by DM4PR12MB6424.namprd12.prod.outlook.com
 ([fe80::8133:5fd9:ff45:d793%4]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 05:26:47 +0000
Date: Thu, 24 Apr 2025 07:26:33 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Changwoo Min <changwoo@igalia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Jake Hillion <jake@hillion.co.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched_ext: Clarify CPU context for running/stopping
 callbacks
Message-ID: <aAnLiQ-B2-5ufJ-o@gpd3>
References: <20250423210205.281689-1-arighi@nvidia.com>
 <a7ea9c40-77d8-41dc-aed8-9df66dc8c110@igalia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7ea9c40-77d8-41dc-aed8-9df66dc8c110@igalia.com>
X-ClientProxiedBy: MI2P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::9) To DM4PR12MB6424.namprd12.prod.outlook.com
 (2603:10b6:8:be::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6424:EE_|MN2PR12MB4486:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f80cd85-7577-4256-37fd-08dd82f09b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H06iTfFlkML69hCrDpsUi8ry12OJ4JMIh8W6b4sBVVFDndjy+rM45oSzS/jc?=
 =?us-ascii?Q?0ezF/FXIi/3AKEF/XSo8392voArH2UiCjN2R5qQstKKEVeMdjilU8ULyKLHK?=
 =?us-ascii?Q?prrJRiKnNPatyBuheaspsw1V98HoDKFa7GK+T/7emEBU0moBlC/bn7Flm6+m?=
 =?us-ascii?Q?7UqM+x50fk0YGIc+SeYmkNczb/Vch3gJ2B1fxKlsoGU7LSTvCnxU7V9cKiKB?=
 =?us-ascii?Q?G+11QbCiKJwAOGJCSBenznebsRbEJ7X52CyI8zU+X9kyst1ntYFByVCx1vJ+?=
 =?us-ascii?Q?N2oDXYq+p95FLulLBRsnG75c147zFDqsmlIfqkj3bWO3/Np9c8lRQNBHOFFF?=
 =?us-ascii?Q?cYL19ZrCHg50s6l2G3eq6eDbA3X78fFD9jGgISvsM0qMvAdsCalpR2Ow51Pc?=
 =?us-ascii?Q?q4QesYPlHdoyAgpChQq7F6ZQ+gNEzeNn/srxKr/EMUIHpfA0w++o9ED2Fs6l?=
 =?us-ascii?Q?swEmcvGBvXSAwrrFGqSdSNTXNySQBXfcYHlPdAS9SgU7CDmHrOimOdl+kDOv?=
 =?us-ascii?Q?GXQ8B81Hn44t2716zf84Df8xMbTLo9MnF3hCnUEw0VBkpuMN8e5xCXXg8E1r?=
 =?us-ascii?Q?PQ4zRf68k1RYtURvO5UD6mCL5HrOcttUAG+vXWefipOn3DkySite93PFxBsF?=
 =?us-ascii?Q?laC6MY04d3kPTWTanYNMNAqxzUjPQQ3G2BtYVHTJ25iG9whXPPhqw1OQKi2x?=
 =?us-ascii?Q?+fjSaD87RrIQX1hVwRsOUijys8iOeo6DUDl/78RmKZpSSxlEwkQLWQ/SytjA?=
 =?us-ascii?Q?Yg/hzvXXC1PNzSRXKD1tNNp7NqNLhH/g6JseV9/fkeCRhU4mW4vn2KqnFaDx?=
 =?us-ascii?Q?vVIGynJbZF2waZrrfLbkjtGIrFXTmUaruD5BwxpXKN5tpkrAH4vIU0aUyHoc?=
 =?us-ascii?Q?f8JO2u0Jkl/dyrartn7A67ZoVeydz7is7WaPq4zRG6FwczAsJxr+Br7OZuXj?=
 =?us-ascii?Q?zCW9Toxtg4Jnae2dcaLi85WyMUNcWFxrIJQL7QGrsuo+egN9bHNCQEkDWrwO?=
 =?us-ascii?Q?MZiZVNDrulNkxwIXHWElNcor7efVw5/BxkHjrRU9MBcN91LbjPV7vM1K0ZEx?=
 =?us-ascii?Q?1+cfgH0B2+Ky9HlELxtA3fdpEOuT2S2U38gQ7+yADp14XVONrLvkU5gTCV0Q?=
 =?us-ascii?Q?1CJ0PfFX4xJd95lDCuUxHlhMoT+OLGscf3CzX3OfUlCCHdIdI0MTtWSiT/Tl?=
 =?us-ascii?Q?X3DGN2niHzX8KAcD+Z/zNcTRBi282pvyzg9v/e41eQIPH+LwJJgnPmwwBFmZ?=
 =?us-ascii?Q?ZXBgFR+zZnqd/fvoGCF5/0bN9BT2zgXkD6CZA5Bak2tuZx0koIKrhVTYmLaS?=
 =?us-ascii?Q?f40U9hnjUnzzSpugFMWSosByXiaTNzq4SMwiqXuFw9zHnJOrGnVsS+nh5bB6?=
 =?us-ascii?Q?VPym2TO0UmsSKgBfY4Jnj/4PAbpjg3NfArI0jkqVPN1yUjkeSIHPtbkZepxp?=
 =?us-ascii?Q?xi3KVVf+gE4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6424.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WVOooBaua4BBM5Wikr45DussgPDKLKiEvhOPqQfYf3EPrALge1mE/CsfgaUH?=
 =?us-ascii?Q?9IR2wMWbPTvkXgdWgYn7wZTUMD/GaIpn9TZDBl/WSIUZsqsP6c9vicEXG1as?=
 =?us-ascii?Q?BM3Ofrg7NTkO/LijcHKkVKF8a4OIWPybm16tTBQ4YMg294Ts6w2DmhQXT0bw?=
 =?us-ascii?Q?oRWRmzjFlF0Q0oNEDXRPJlo5RSKBBvTkOd/hSGEEkLwVscrQJSRF0N0srz7s?=
 =?us-ascii?Q?rWb9QbXMxTrLArKvLvtqOYUXkFeEgQqiQF0juJfshy5mO296qDiX9leHzjKH?=
 =?us-ascii?Q?kRwPsGvM0p55PXoUjFav94ZNXfRpRXbb3BxYaHTaIWz1YB9DNSnqyJYzd6MX?=
 =?us-ascii?Q?mngbQ9pb+Z2j2lVr9qTocoGKYbJ80txTjBi4jbs/RhcLX4xKZw09Pe5TD/1m?=
 =?us-ascii?Q?i6F4FloRM+Jx1sVx0ZtXF2ycCP0TsDWQtUgHzhcPKcjooq0ohvy8arIIJ8Kx?=
 =?us-ascii?Q?EcJJKVzVbk6Fnaf8vxANW8DxEzHely5S25BYJuAkfikqE+ngwzrcPpUGqO+9?=
 =?us-ascii?Q?drx9lQd2TaLyT5NF8iILu50jHZzZbhOYnlDxmynWJzzvB4PiEZhnqaOCtm8G?=
 =?us-ascii?Q?5PKJTaiP4CuRi2Czt5cIUxgMpsGQFv7UiXuOYJAIfvZKbfDk7AAXpZhFxx7N?=
 =?us-ascii?Q?hMFOdJcP1gJcfb/VisqxEATVNqepTCzWYQ4QqSdTrda/koYTze8Cm6aTLT9+?=
 =?us-ascii?Q?hx334y0fCMqmHjEcBjr77k1PwBnlfNRrRx1T+tU0oSJMESQiPwSq9N83/AiL?=
 =?us-ascii?Q?H7KLCRSDFLoFPdkUTkpl6gQn+dgZ9LpeYI4QQTKaV/3p/6W6+DKoKl9xO9Ov?=
 =?us-ascii?Q?AGg+YVaDIpJ+lPRpkkNR+NyLmHvnIZehIdFK4qZM82NF/RHgNRqdBvJAgZLv?=
 =?us-ascii?Q?OhMWUdpoOR4J7Knsl4unttcq+efa+kLyeckv1PnvXUQ4kjF0apRctVD4CFLe?=
 =?us-ascii?Q?nF1PdA9qv/T9YoAGItTGyLo1D1QMbvfOoluJWz7GonNHCb3/PNhUI8Pbsyvp?=
 =?us-ascii?Q?9TIb/ETScCqEs+YhaZ2OKXZrVgeSYPki8Lv5Uq7CA9Ws0csjiCSdpl0iq6oW?=
 =?us-ascii?Q?daOTztjJTWpMLiggJn/vvCXApkQaNea84fTuKMYcoKDadbW7FZHCM4Uff0t9?=
 =?us-ascii?Q?L4YqLlAnfm0BOp8Sp6mlcaI18DSewAxy0g7scXWy1kGwgll/im1DtmIqBxGt?=
 =?us-ascii?Q?LN+1NOd7cc8eSVwqF5LoCmfdGUa7NTHm0+H3PehEVONRwNmPlrR751wgLmaT?=
 =?us-ascii?Q?vboIx7hl/HxXrr/a9Ah4q/Igb4dz2m5ByvWDnAZTsFe5UeRdS4J95GupIQIU?=
 =?us-ascii?Q?1efh5d/mu2fWh6ZyrvFB9oNmocidZc1NUQV7Rayd1ga/LIuV6iSq6JXjnVxc?=
 =?us-ascii?Q?Jd+vd1hkKb2d7/tx1GOqx5ChBlLm2aW9mci5Vfsewio3JLllfxOnB1xpKfuY?=
 =?us-ascii?Q?mO1fp/Pw+QPAImYMqp2TrqqdVXEdpRwUVUoGzHZ8lPMaDRgWKEavyqlAB3/r?=
 =?us-ascii?Q?W4nslMh5bTs+NxdHQuURzQB0z37lqJR1bryU/+Rs639Xc0ib/GYoZr86QWJP?=
 =?us-ascii?Q?Kj/GkyQti8QUlBNDyTHGeOt8acZ736lKtHr+uTu0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f80cd85-7577-4256-37fd-08dd82f09b95
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6424.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 05:26:47.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5NYK/3E7ZXALRUXIN5exjNP4UnQVm7oKyeedL/hTlmKlzO7vZikWKSk3J262Eqq+DpI1XGiTHwMfZg19ss01w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4486

Hi Changwoo,

On Thu, Apr 24, 2025 at 08:06:47AM +0900, Changwoo Min wrote:
> Hi Andrea,
> 
> On 4/24/25 06:02, Andrea Righi wrote:
> > The ops.running() and ops.stopping() callbacks can be invoked from a CPU
> > other than the one the task is assigned to, particularly when a task
> > property is changed, as both scx_next_task_scx() and dequeue_task_scx() may
> > run on CPUs different from the task's target CPU.
> 
> The same goes to ops.quiescent() too since ops.quiescent() is also
> called from dequeue_task_scx().

Yeah, I was a bit conflicted about mentioning this for ops.runnable() and
ops.quiescent() as well, since it's more obvious in those cases that
they're executed outside the context of the "current CPU", since the task
isn't running on any CPU yet, or it's no longer running. In the end, I
decided to update only ops.running() and ops.stopping(), where it's less
clear that the task's CPU may not match the current CPU.

Thanks for taking a look!
-Andrea

> 
> Reviewed-by: Changwoo Min <changwoo@igalia.com>
> 
> Regards,
> Changwoo Min
> 
> > 
> > This behavior can lead to confusion or incorrect assumptions if not
> > properly clarified, potentially resulting in bugs (see [1]).
> > 
> > Therefore, update the documentation to clarify this aspect and advise
> > users to use scx_bpf_task_cpu() to determine the actual CPU the task
> > will run on or was running on.
> > 
> > [1] https://github.com/sched-ext/scx/pull/1728
> > 
> > Cc: Jake Hillion <jake@hillion.co.uk>
> > Cc: Changwoo Min <changwoo@igalia.com>
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >   kernel/sched/ext.c | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> > 
> > Changes in v2:
> >   - clarify the scenario a bit more in the code comments
> >   - link to v1: https://lore.kernel.org/all/20250423190059.270236-1-arighi@nvidia.com/
> > 
> > diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> > index ac79067dc87e6..a83232a032aa4 100644
> > --- a/kernel/sched/ext.c
> > +++ b/kernel/sched/ext.c
> > @@ -368,6 +368,15 @@ struct sched_ext_ops {
> >   	 * @running: A task is starting to run on its associated CPU
> >   	 * @p: task starting to run
> >   	 *
> > +	 * Note that this callback may be called from a CPU other than the
> > +	 * one the task is going to run on. This can happen when a task
> > +	 * property is changed (i.e., affinity), since scx_next_task_scx(),
> > +	 * which triggers this callback, may run on a CPU different from
> > +	 * the task's assigned CPU.
> > +	 *
> > +	 * Therefore, always use scx_bpf_task_cpu(@p) to determine the
> > +	 * target CPU the task is going to use.
> > +	 *
> >   	 * See ->runnable() for explanation on the task state notifiers.
> >   	 */
> >   	void (*running)(struct task_struct *p);
> > @@ -377,6 +386,15 @@ struct sched_ext_ops {
> >   	 * @p: task stopping to run
> >   	 * @runnable: is task @p still runnable?
> >   	 *
> > +	 * Note that this callback may be called from a CPU other than the
> > +	 * one the task was running on. This can happen when a task
> > +	 * property is changed (i.e., affinity), since dequeue_task_scx(),
> > +	 * which triggers this callback, may run on a CPU different from
> > +	 * the task's assigned CPU.
> > +	 *
> > +	 * Therefore, always use scx_bpf_task_cpu(@p) to retrieve the CPU
> > +	 * the task was running on.
> > +	 *
> >   	 * See ->runnable() for explanation on the task state notifiers. If
> >   	 * !@runnable, ->quiescent() will be invoked after this operation
> >   	 * returns.
> 
