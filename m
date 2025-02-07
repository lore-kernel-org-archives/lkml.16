Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD4018FC7B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738964755; cv=fail; b=gMZGk2i6Ojy7EbjDDr5tOsXwgIJPyba9r1GY7fFcOxlYcSBoKrdu9eCra3lr4lbBa/Ym300FKoEB9AB+LeM6ECyhMCLk21fYbSkrxXO/0+nO2ZjmQEUUbNGjrR1tcBa4rB631Z/LsHPjiEwr4hYchLqQX4R+nP70tEDkeJSD/E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738964755; c=relaxed/simple;
	bh=mn5YiLcw7TOWJgaoS3+pSKgtwxhJFijQLSMrIab4y/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cX+o1vlVB+LfyLu0VvdLiWYrDyfIBsY4oOPEqwOZY7Zwj5J4ggWR67SYfIkOIz2XCWsizMZdWd+Zvi1ZGPhAvX1GTcqXwf3B3wwoz3iP7mRYze2rdjlO8M+GuQR2wMQwpqW8LCg1/cNWRQqRWw/nTJ+bjwMOW5iDLnWv8LpE/PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B/Ombx7S; arc=fail smtp.client-ip=40.107.237.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B/Ombx7S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvDUrc77QkOdCPqjZUYbkeSSsr9MOiPojGRIXDrY8w0APVmTKiyfl1vA4QWurTWAcn17zkt0ZH656nIwLOk0z2RrJduq6JQoHRsm5hGwuykHvQvgvXqojGlu8Zs3j7mrHc0ajydyPKm0a8uMx/m+TQeDsPD2mwbEyeBq5hUbIn9MelzdEqfMbfSvkRrbhOo0TFv1X1tVPQAInvJqxpFizEIaHVEC/VQhz7SMeC6KxOVqyk4Hgs1L0a9cKRfCKoyYn1YmmZ0/bzjBe53ujDWFVwA6lhdXH8oWUFD8PNvOcKOIA+tQ5owic5x0ecZMvnCXrG6dzbVw3Zm/fax0ihaRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIzNQAJfJNuUdUsDzgwf0KHCI09Zi7F/bFZhMtRIiFk=;
 b=r0ex8G/JGK95M0JweJg2oAw9EBh0BPs8Pk4iJlN8/r1rQv0nrOtLvJTrWY7saS68GT3qieU+PLdDezmTyzn3I31UD0oGyV0pdKsTXDvGQ92tTihU75PIdxm8ECn02QtINEc2q3jPl2anqBFOcl8weEjfUDGt/d8QPiRtOWCOg3M5wxDnmYDpJGRGAT4hzOPV/QrDpQRJavTjvVTdSuy32egBnxf8X/xesFRqDNxjl8fjJwrSh8JCp36zCWzflqTSN3eApvLqxaT9w6fIVppiwbDXAA5aImUDWI4yp5WgaG1ldRKERP6RkPMFFoGKdAXYhpilu7pg4a+QlcDb82Je8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIzNQAJfJNuUdUsDzgwf0KHCI09Zi7F/bFZhMtRIiFk=;
 b=B/Ombx7SUl1ynee6H0lSyPVTM4SbIs+QxTfo12SxLMGS2D1BcUZbGc8EO+b6BFoSsYe1bRYqzIl/rXbkLQUoOQpLXM68LuzaWtiidGpTddZCTXOB6WUrXIOU/l22yi+tV8Zc8oMo3PwmUw4bHbZlHQzA9SIXE0YJgldsPla3SNLmj+c4CaqBt6LElu3NbgpKubp7NXvAMxub/FCBZJx6vf+cd/9dnjnA/ubw4ieqZY61RGF6ucZ5bscHfcz4pt7x0XoOAV5Kt9X83VmK9txDYLYZcGvg0wUCg9haigOhVAyenOUulg/4v8ovjw02AdAc40EsRA1C5+kKmYr/FZj9Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH0PR12MB8126.namprd12.prod.outlook.com (2603:10b6:510:299::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 21:45:49 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%7]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 21:45:48 +0000
Date: Fri, 7 Feb 2025 22:45:44 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: Changwoo Min <changwoo@igalia.com>, void@manifault.com,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] sched_ext: Add a core event and update scx schedulers
Message-ID: <Z6Z_CNBMp5greLf4@gpd3>
References: <20250207031338.393045-1-changwoo@igalia.com>
 <Z6WnCHiwkvahtdgR@gpd3>
 <Z6Z9V7GgZxpFlp10@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Z9V7GgZxpFlp10@slm.duckdns.org>
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH0PR12MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 2009cb31-4253-4a87-24e6-08dd47c0c8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Llc39xleUnt8J1qsoZ2prT1vyJ4dVgriJdKx70vosceFZS9TIY3/a0WFrOP/?=
 =?us-ascii?Q?cv32Ci5nuhZ39EjC9iYW9iAeS1uRvDQcmvzV5/K0CCOlXHN2vOCBHUYg52cQ?=
 =?us-ascii?Q?FcA6up1Q1Sz9Zn7vixP9zbFHrrnEGNN7+D1dUhuMeLzEypFfih80rLH2M12o?=
 =?us-ascii?Q?ex34zcsihrlNoMKLE4+7warNRXHAcSD90XF6vfZDqY8H2pU+iqZwWvoatt9O?=
 =?us-ascii?Q?kOH+Wa4I1qTutHeJudSjwyCRnhExLuHGE1INBgt2LVkpWIvvZ+wrpXQXYi23?=
 =?us-ascii?Q?EW4YXivTvLfOOAVerrRX/oO8Fwpy8G6oKq81skYaJbGSvnSF0v2XLwoN+Kea?=
 =?us-ascii?Q?cnuu+NsScU2JX7Ku6FFzxV22qKeye3au2/ieTyJfF0rs6/0bNolqJgrud7Ci?=
 =?us-ascii?Q?4SdCV21lQrB9a5n1SEZAuDNVilNVkQKQ5De1jA8mMXpgf02vqwV+OtugGCai?=
 =?us-ascii?Q?XfG6FuX81zdp6UQWBJfwzkMARToCT/n4Gi7L1Q9YPwD1MfE/LyvAgxBECY0M?=
 =?us-ascii?Q?wNRZWMAd5tTIGY488ad9QyWqYudFLcHODG4PvG2qJmYDIuO8qTN1pmB4lOLF?=
 =?us-ascii?Q?Z9Ag5xU04yLNQ0g/RP7ljvqp57LPXv813cq3HeHM6V5ADrhNJGzP2yOlvdDq?=
 =?us-ascii?Q?6E7TKRtRNEW+8AmB8sSaZIrefHNL1Dp1Loes9t2lDHAhSCbM2V7/0bGy9Qie?=
 =?us-ascii?Q?j0Henk5rviwW1RhciU2OuirpHQHdO/yxtYf2vFizwsnATkPuWtiIxtLzGMc0?=
 =?us-ascii?Q?ucb1qfuvrbQwVgvXQIJdp5bJJjj4IB+8aJrGx/gnpvh94GbkwCXBtAt2+46d?=
 =?us-ascii?Q?WsKVZIg7/6DwRR+rk33bSrvgbyd3F6SUKwfQZC4E7Y9yYd2b/zgZQOAqJ5Lf?=
 =?us-ascii?Q?wNBrVPCvRAg/lzqMp0y45s+d+4qA4m8J0k1OXrycsO81vgln0TN1fNMost0t?=
 =?us-ascii?Q?WRtf0vKeicu+jnM4tFoa9fpbMK1eFlGgmokbs2va5831PwhTLL4z69Qq55jW?=
 =?us-ascii?Q?b3Q7bAnT+OWznKoFj3gBKgqG22pX9QU2YIXwA5NxPkljMcZPbtsgFrjewQV3?=
 =?us-ascii?Q?e+XDdY7wJt9ulAYSwdjr7xjDfYDrlY+4nhlexQqmKTPWSd2VfVd+5WLVcsqL?=
 =?us-ascii?Q?dwh/wHnVBMdWBGLmpl4ux8YrXSujFR0uH02LZ0xnh6TXkUyijo3Qv0GJw+wV?=
 =?us-ascii?Q?Sq3or/r7a7QBK5dnkw5xkO5iHDCWCKNVnVXpRGwoxG0ocPiHEI/FOPnZh7FI?=
 =?us-ascii?Q?m5b0t7PKavd64htgby7U3Ccz5iWdNcDRJziZiuIJ4kS4evZZcymLLKeHS4C1?=
 =?us-ascii?Q?OzxacJrPgguIPu96VsoQnZTDL4VmCKa57yhxsGuNF/E3/a/P5r4l4Qo3KOtA?=
 =?us-ascii?Q?0qO0OSDaInaJULeefEOsO+fINecD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J7WuOgqaCdI0DG7OzCOv02xL+5OU0S0YQ+yAugY+gVq0Ld7Iidd9fKWurZb8?=
 =?us-ascii?Q?xpeUXJGrelIgAxn0bj2mpctAQvgF+oqAtlJ85GNLjRYXTTcRyXKlmjq+lWc2?=
 =?us-ascii?Q?nKsVUev1YlnQErJTOieVWm3YW7eORkkie2s3fgXzdgt0KsvLTTFb9pnDT/jL?=
 =?us-ascii?Q?lvkhsvP+ADnD3fgbqcTqP4HjbJa6ONSnB04rqpf1S/q0PD3QrGncHCD7DQIU?=
 =?us-ascii?Q?86vfnj3vi7iuOFIpNrugg7N2QEjC3nC5/lNt+Ycp3LlkD3+I4GslFyNyTiiv?=
 =?us-ascii?Q?UDUh08lOr0wkqBcIV1sAQa70ncQaSdxtMOgLaZCRJFdyllkCWhnk9KRqY77c?=
 =?us-ascii?Q?flcEciUFVPEkPWPbUPVxpSWOXe2lRezL93fs8/rvQWwiyvWsyiiGUM9D8cXv?=
 =?us-ascii?Q?b4HnggJSnPLF7otP3zmMTtrJVdSBZy5iuPKLeEuruXl2SwhqDznh55g0qv0x?=
 =?us-ascii?Q?f9uda3M2ggGVjRorXiyMnbc5dq1oNyhTBNNwVYv1o+ABMRGIGgtALN7WUJ8m?=
 =?us-ascii?Q?cnh2/TLe8mc1UZta5db6KNzkr3xYVRgjvzxflJpC/3Jl+a7OjKztzjUeuJtZ?=
 =?us-ascii?Q?RCrPW0Jo+tj0Nskj1Lh+GmdFKlMDU8fgOtLd9UW8mDg511lqVANR35DFApB2?=
 =?us-ascii?Q?xyStd5o3e7fdR+3lh/v+uZNF8u9R0+Vqoyn8QBvSap1K0lG01mtyuaGJaCog?=
 =?us-ascii?Q?KRYl7RY9+jx8T/ZEoN0Xq69oSUFE0wTzVJI9ihYkYKOjCtDWMoWWHT6j181M?=
 =?us-ascii?Q?od1OoBzLHYILrTuCF8wNTPcOn+Z9Iq4cAwmO7GeOE0TWFVzefiX8PLXH/d3b?=
 =?us-ascii?Q?X18nzZdM21f//n1NywhXEBb/6EKhlDGhFAGZzu3Bho+FGBpyrJe0aKbvL8n+?=
 =?us-ascii?Q?sEwbqk7OpyAjko8Qyg6Q/FTDDWOUa3z8QS/qln62geLJgAvj23WLnpU/1oVC?=
 =?us-ascii?Q?ScuVSW8grm4AcsNFILw/gRbTPHljBq4IfWgJssPyqE5IqkAUgVh/JCEQg1Bq?=
 =?us-ascii?Q?djmJYbk84bDE8ETo+1D+J0ipGfVaKineK2VqWoSdSrQFcLrxCP/y17/UQqkI?=
 =?us-ascii?Q?A9qOKwUZE44Bxfb3iOx+4AfJhuH5rPLc7JSTXGVdpoCKqT7li1i2vEnh2wld?=
 =?us-ascii?Q?y64DdqFCuEbwGxE8S734GlmI1EVGDG4nrD8WylYSBmq1McORdS0rE12CpAb9?=
 =?us-ascii?Q?4aMfjtD7FDZEGn7uDP6MxxKCDixyT7a2HbpAFmLzGCRD5eunJiVVGbjweLes?=
 =?us-ascii?Q?rc/NjhUW5ToZxKMBo71vx9kg3H4DQOJwVE2m0zDIiNlm8IxwUD/cRfiQ9rBp?=
 =?us-ascii?Q?m3Pl7aXiIluPPUaxY/lOixQ/rz5Ze2+EFjw+U5AUz51KoPcTCQ7XJ7ZNgpQW?=
 =?us-ascii?Q?WHAzVt4IoQ4XZ+TLLTcAqZ9cNbiJmPKSgTk9+NtfddkbmZzZnbystjyVwRvm?=
 =?us-ascii?Q?7HBVdchu1Tc729k0gNxmAGQ8CrMxh/RKEi4lQEeWZnZfR+3qVog9nCDpmZTC?=
 =?us-ascii?Q?fLHOpvvX50sbJnsm/IqK9G7XAI7fFw4tMDS88GLtSbw5Kwz/K48KdjJml3/8?=
 =?us-ascii?Q?FDlA9xJce+QpPY22VxXYbB5ERW33WSGuBuREiCXU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2009cb31-4253-4a87-24e6-08dd47c0c8ee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 21:45:48.8000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CikyE1tJFIRTFNtGs+aB5UCIB4/kCIGSl5iWpWnJNY1YWkGdP6+dYzHQNYcNXvHG3xXRRnILjxgvwu6NfQlaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8126

On Fri, Feb 07, 2025 at 11:38:31AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Fri, Feb 07, 2025 at 07:24:08AM +0100, Andrea Righi wrote:
> > On Fri, Feb 07, 2025 at 12:13:36PM +0900, Changwoo Min wrote:
> > > This patchset introduces a new event, SCX_EV_ENQ_SLICE_DFL, and updates
> > > two scx schedulers -- scx_qmap and scx_central -- to print out the new
> > > event.
> > > 
> > > SCX_EV_ENQ_SLICE_DFL counts how many times the tasks' time slice is set
> > > to the default value (SCX_SLICE_DFL) by the sched_ext core in the enqueue
> > > and pick_next paths.
> > > 
> > > Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
> > > of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
> > > Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
> > > scheduler bugs, causing latency spikes.
> > 
> > Not directly related to this patch set, but as a general thought: would it
> > be useful to introduce ops->slice_ms (in sched_ext_ops) to override
> > SCX_SLICE_DFL?
> > 
> > With that, schedulers that care about latency could set a smaller default
> > time slice to prevent potential spikes caused by the implicit use of
> > SCX_SLICE_DFL.
> > 
> > Opinions?
> 
> I'm not sure. BPF schedulers should be able to avoid getting the default
> slice. Hopefully, with the added visibility, this should be easier now. I'm
> not sure how much overriding the default value in ops helps in terms of
> control. It's a very half-way measure. Instead, how about we add tracepoint
> to scx_add_event() so that folks who want to get backtrace of specific
> events can get them easily so that it's easier to debug where these counts
> are coming from? Let's just make it easier to avoid these events.

Yeah, that's a valid point, the implicit SCX_SLICE_DFL should be seen as a
countermeasure for unhandled situations. Instead of fixing the
countermeasure itself we should try to prevent it, if it proves to be
problematic. And I like the idea of having a way to backtrace specific
events.

-Andrea
