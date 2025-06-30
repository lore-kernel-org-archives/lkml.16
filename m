Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1573928C5BC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293825; cv=fail; b=sWk1OH9LSkIW5CMqd2U0AxS/YoNqqL9J2i4aU2SkzDXetmemhxIwEHl0A4BRXGE9HOQA34dKzEvu6KBHJRq+0+gYaWklYSE7mNSdTcRfpYaEAOY6k+U/Oy4/xlksdU2TguWSundaneV0CthDsYK1QR3EcPbmCfKqic7smjL7jQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293825; c=relaxed/simple;
	bh=Ce36oV4b0qWk7wSjO5ShEY7WPUPxwle2+SMbdlp8KX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UnmcMJxovAEap1QArVNMr+IBphnb6YDMni1gwwslP87CY5w94UpCezoFfu6Usa3fV2GgowBOFdxbM9W+Qzx3XlayTOFBJq0A7vY4CBroeNg/fdqoMJ3X98gF40BbH2Ak0lU8nr9DTPTq4vK3sLLNY9rECozdjoKm28cf3szZdXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NjJ8fpRz; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NjJ8fpRz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXSJRlo03txE0Rxzx71msImMu7TSDGF9swKRezh3t+9ch1UhQcx89uGUHRVgxYYhgI2YhloDLMq+k8K6clfWGjhythqclzdUcC4HrzmO37/l8v3yY/kLKlKqAXl6KwiVXcICATXpMmyWzxYSetNCeXVHnjxrbSzgcN1cYrxFUCAkMGe+G9N4wEOvXvnN231Eimxfh7i8r9rHAC2ikIVLhh+r2oADAs0Hs2DXHmAMRd9JH4H6cW+9uKOSuRC9Yqm0ulRcWHpGqE/8rA1C6+m8svV+M3isXlhwELGHc2QYrNuGWSgd9mw6Zfqx0fttUgX+HzsGwhCoCGVOjubA70sgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37fYPHHjb9N5BYwlKy6qenGEsYj9G3EzchjKNZvmEe0=;
 b=PJ2uD+sWcnmu0VVighUdetG95aB+sR3TjlVO5SjL/GFuWqT4jV7DVFJm0hyI3VVQEtO8YxmfUlG8w9CyCUVo64TMo6dQjNmGOlAekj+HSqU7VRtWLoD1Y/Dy7ws2Vh6LtfiZkk4k53pRXg97z/wWgu+a56pVJdBSHxmlZC5z7w4OdaJ6O1Q5mqzM7hXG2jijUBAsf4ahKWBzSxrmRMbkZRclO+35USPEhzufSfIU5HxJY/WwSjC4D8+EG6ctkhdcODlCzgxPiN2Iw7STFpZzAamdKGdCczBqlQWy3g63NmPRfHBUJvUJR+i65lE9gz1HmZWXuZ5vxrcNfufKgAS1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37fYPHHjb9N5BYwlKy6qenGEsYj9G3EzchjKNZvmEe0=;
 b=NjJ8fpRzX6tO9yQ6ShbytIwEuVIxvjYD15JqXIWIujczlj+taoign/m8bprESLLKN7/Lopsd9yhLOoNfrdbrV77+HzbWJhzREmpTzJTkyrvy79/0P9bJ25HzqhHMHumm00BjmQTQCWFeHBfs8dhSMYRDAS9RNbFAKz4Sdtw0VIqdypSBnYILqkPfx9YCkRt3hZMgCxm5e/lCFBLZLz483GCUTt443ptEmuIrXtX3BC35WerUUDzhIwfda8FTYM+L+borxpa3vTVywlaTA7q7anPULu2vqYwKXznPrPhHRW0f2xJS3ZryRiLfNw9Hus+WC3CZNTOqrXIy61vhbi1ffA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 30 Jun
 2025 14:30:21 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Mon, 30 Jun 2025
 14:30:21 +0000
Date: Mon, 30 Jun 2025 10:30:13 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v5 03/14] sched/deadline: Clear the defer params
Message-ID: <20250630143013.GA2436432@joelnvbox>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
 <20250620203234.3349930-4-joelagnelf@nvidia.com>
 <aFm2XaQurEXOGfCp@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFm2XaQurEXOGfCp@slm.duckdns.org>
X-ClientProxiedBy: BL1PR13CA0339.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::14) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e268e8-818c-460e-c79a-08ddb7e2a44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sq1lnx4Ui+1YxN00Y+iROE2tVHPHvXgL4MdiNBszUSC8HmPriNZnmqCxtamw?=
 =?us-ascii?Q?KcDGBUz3ckhXBi+2IpliYwDBnrDWr3s521Wsk72yyQSPtM68nPifSPIMyBeZ?=
 =?us-ascii?Q?HLKxp2bQ5GZ2Ue77M/OVQl8FEiqqLHIQCKgbGuaI7fp3vNZ0ZiVO7qznQW8q?=
 =?us-ascii?Q?Ao75/09W2KX8g37bBkOFUdgs0OElp9p4Un+q7lhyo19jJzk7TBxCUdnBwOzn?=
 =?us-ascii?Q?MUOZmaS4VbU4hpbvt9ki4WS1lCCQ8Da7MQf/+dFajEkFd45BCKzmnAYg9IYk?=
 =?us-ascii?Q?1Qds+XNbq+3OvTpPEeBq1MK6yeimSRmfpH1H3zxWAfEyp4VJ3nzdFTtOxivw?=
 =?us-ascii?Q?wuFLEGb8nhXHNriWENERBYlpyxXIvl1n1GV+gOPdoNo7eZmZ22DTK59zaXY1?=
 =?us-ascii?Q?7NxKn8uIz2F2oyp2pKxfBxwU7Bvm+GUcaZBJCfvZAaojEE/sEpkBOt9zc27T?=
 =?us-ascii?Q?uNKdWLq/FY/Wc/QxRdKURCXBQtKixZw+xo6ryydzkFsIDWY9d2SBiQ6RSHNG?=
 =?us-ascii?Q?2vvGdPiT55anau0XHXl31aGJNrE7tny81egf2U5S4wDEDmmhzfnAN9piQ/Zh?=
 =?us-ascii?Q?SI1XrGasPPnInvPP0ViYc1CMI4hX7Z2h9dB87vKBuKW9qFVPS1FHMj9imfhG?=
 =?us-ascii?Q?x/bLujjqDoEdmqEfMOOGTRw8ljyAuiWpyZVgB01Aj/GnbocOUfynaJsRgvEy?=
 =?us-ascii?Q?KWzUd4hvzFEu442u4QNXItomn/AQ18uBn0+JRI4Vf/whpFsbYIVgRWfO+XnT?=
 =?us-ascii?Q?PMvE9A3+Vec/zwXUUEJMptnZ/k5C9JdAjfzaLFB++/WpwDn2PY8FAgRde7ef?=
 =?us-ascii?Q?RPQJQ+4bv6cSVJC0AseqF3bj7YXOpA9YdfXDmB9uY4nQ7SA2KsN8+LotKl+a?=
 =?us-ascii?Q?TqGMx2y/+PjGXZod+gZJycQ6ToMlrxdNYsr4t/LE64dsP+jIsHB5Opl6b8RB?=
 =?us-ascii?Q?6lT5/GAidzg+3UYhlDKBZfI34wf1bINSAaTOh25kPrRgYdIA2fQmb0Mv19wx?=
 =?us-ascii?Q?nffwaxiKgNZreADJ7JvG/RKn4d+I9liIHSboHMX1n50Mp9HxXKyXtRAoahII?=
 =?us-ascii?Q?hjp8qixdd6+ymtpXgfczTX8uiYdcvkNhsjTNdVNFlVKGiS6+vw8xY7vDOugr?=
 =?us-ascii?Q?nhjvJQi7gcJjxhfJmPIFr+TpO//u5wyqNka38E+9sDFSKN/J8iei3I/GjK1q?=
 =?us-ascii?Q?nNgQt4DCc9pljt0KQTiLRRSbKCwJGk88buGZ0vjx1on4sy9bpXD/E6BzQmTP?=
 =?us-ascii?Q?kj631sZD+rtxILdCzz6ZfbviYuOU9ROP7IChozY7KHilHjA8CVx/F4cPg72L?=
 =?us-ascii?Q?DZc++Vuty2r08repbTd2TVTx1GGsCbG4I4Xg+hLRAkPutJmfJNl8LBWJ0W82?=
 =?us-ascii?Q?qsY6V5r6RtCdjNA9iINVjdUF+JlYFgQbPaPs7TrBjZIV8PeupgBh9eje1V3/?=
 =?us-ascii?Q?5BS+4MUsK0g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H+iLPtzp31Hwn7ZnZt7ouGAtT5V0t1Ibp+8O+ixpNHecn6LvH9JSDsYgkoN8?=
 =?us-ascii?Q?bcH/P8Vy5wQuoAbtGjivdpALAbkY9FVIxxwKRipoP9tb4LWgG6HPB2mpvjNV?=
 =?us-ascii?Q?uVtVAsXZZaP+ETy0Roy1Qo95PdPHeprxn32kdOYvUndUD724s+iLhDiFKHf/?=
 =?us-ascii?Q?fMf7YlfPS4Cu6YEb46vz32A7+XyUdbHUrlJ4YTS1SvVuadEd6b3l0w4Dk5ni?=
 =?us-ascii?Q?9bdZ/ZA4I+lzKQyq9G2M0MuLMZLqWiNHvmqCrYTgxt6+mPcq1Wu86xfwCl+R?=
 =?us-ascii?Q?znvKfascOyMuAQyel/vNVXLWPlbWFw0BIS4jbX1gGyQLi0OJ5ZsqGxMCu9gH?=
 =?us-ascii?Q?B3wFRyw9MlbPT9+drwXoYYky7v2Lxh/o44Uuzonaj+mriMZnpvBfsxHmv1q4?=
 =?us-ascii?Q?gVh/zEY4crEbQMx5agVXjIUc8EVuLmz85+Sz2rB0NTxuAR1hztwnUZj41kmH?=
 =?us-ascii?Q?ErFXzplfKArA7SVAz2wqM+z+wIItzcZXN5iBqXKX1uupjLiTlGopNbsc4+Oo?=
 =?us-ascii?Q?aX3fth7tAIQDn4DzDLJwZRYtTelVVrFoDLKQ4+np5J8UqGRacnDU97zNHPVN?=
 =?us-ascii?Q?A3KcobUmKG5NDPhq+yCQdsU1bP/Lgcor+Hx2vmoMOsnffxGNn0K6pR8YTKvO?=
 =?us-ascii?Q?lZ0ltemkHD+AVjpDvCa5MLu1JG67mP3/wgfIo0ktZ0e+ZVfkvorXyaZfZOae?=
 =?us-ascii?Q?wq37MfB4Ra8CJMG62NSjIHlpHiPdRNzG0WINkFLjGpOHazlk3nhkykuhWYVs?=
 =?us-ascii?Q?oR377u2Vng0dxaSKQClEL4mAY7WDD7PjiJ1SZOvBhyaydKjrAg26s8x0NuUl?=
 =?us-ascii?Q?Q7loU57dW04TvGEioYwnWlfwE+DTNFrnEEgB276AijnmVY9+LtELgEM/vmeJ?=
 =?us-ascii?Q?Bfy2nlvo/g3YV5Rrgu0QZO93qp+LnzCRYqMAzb1JV58SW43Cq7E8srUq5RWF?=
 =?us-ascii?Q?8lI7BUqoYp67vT1jcIRR9nARwGXwmjEWLIj3X+j2jY9ZMH+lUtjAZyae/93T?=
 =?us-ascii?Q?AmvjqJpNhV+HRmcbb/qJrMPznif7CutxRnbEkD/sF+NGuSPRX8ombooISNp+?=
 =?us-ascii?Q?SgV/RK/uF7g9d+ypn50f32sSf3jmWoyW3aZlLe8QZrioQReJN0Oyy2GKIhEB?=
 =?us-ascii?Q?dfgxNLFpMiuPIcV4mmd5SJ/R9nA/JOY4ODECJZL6oTuylTPcMmC5TL+eeEU1?=
 =?us-ascii?Q?NTEjDBDT308DXIF/lOpl7Npnk3/WikG6KndXPw+9SzwAnTHUIfVGb+5WJ2y0?=
 =?us-ascii?Q?oGF8uCxeof9z4lEcD0oWtVv/0BQLaTtZegWO/fG21ZbihW3JkOZ4yV6Ror3L?=
 =?us-ascii?Q?XtJ/+l5oA2g+z4mjgchnwlQnZX2YVSDv6OJvZVL/SVdfob9YPV1GtAf9pCvO?=
 =?us-ascii?Q?7tidiVPMM7jaUX0XNHBbk/nN0HXNKGsNNPlBc/mVil+vpGhorbrZhhvMXb5j?=
 =?us-ascii?Q?zj3t1scPLUQhdj+bxNBxe4CyJbdCJfieJr/fWtas1m6hYQBH/RA+h51KrVWy?=
 =?us-ascii?Q?gaemUEk4vchzuH0MOcX7T9/8AMyISvCaH3mF8aQLP5vKKvOKacbrOIVZmRmy?=
 =?us-ascii?Q?PC45Bi7wRYHMWoAuThIZMzVumKLDDNNO8gLDAYzL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e268e8-818c-460e-c79a-08ddb7e2a44e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:30:21.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DIKSO5YEBo4GWWHT6iZ3RemO9fKWmnKwxPeq12YFNN8aueHYLQM6+uZb8OuYJTYaoQJoCw8VXRY3pyJ0pLlwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194

On Mon, Jun 23, 2025 at 10:17:33AM -1000, Tejun Heo wrote:
> On Fri, Jun 20, 2025 at 04:32:18PM -0400, Joel Fernandes wrote:
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..ae15ec6294cf 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -3431,6 +3431,9 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se)
> >  	dl_se->dl_non_contending	= 0;
> >  	dl_se->dl_overrun		= 0;
> >  	dl_se->dl_server		= 0;
> > +	dl_se->dl_defer			= 0;
> > +	dl_se->dl_defer_running	= 0;
> > +	dl_se->dl_defer_armed	= 0;
> 
> Match indentations?

Sure, will do. Thanks.

thanks,

 - Joel

