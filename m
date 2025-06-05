Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4161DED66
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104260; cv=fail; b=Ea0CdUULVCZ4HfmkYtAzcVXdcdSqcMECnbglSg1jJ/ts0zW0Evaz05jdBHuzW4hsM+pzYjIfGgWHX9iG+LMM+qM8Uyr0W50E/Blwse4ymFm/OADdUzEDz+2k+FxgwBOMoPdMQUIk+UvssHnwPdAVWyNsOVVmxlGLbjx+iLB4dcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104260; c=relaxed/simple;
	bh=Ls1WolPYBuXqr818MgadhP8g1rcGwAD60yRyT47xDp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TQhYyurWLMjYGaqbW7eoibx/tKjguJo4NXtW+LP7XFNMzRtfbI/a/J9LRTE/rWMnZ1NYxQgdyWrXIRkPnNOpa21La1WshhvHvluLfP1Y9NG2+TxAPnLkU2VEPG7rdWLC9f3La1cUNPFKEtRm5uWmvwsHx+uAv+ZzeskyHIKTP60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gjRi6QWT; arc=fail smtp.client-ip=40.107.92.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gjRi6QWT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbGeqm+QnfBkYqb0sXlqeVJpbLkl3jT3GGO3bp9N+FcSvobmmM7HR4Ibizoy3h7FzwVXIjdfYIPuiouuYj4lhqyiFOlKPZ15JzvirUO3u4harLQ8RAXbRrSH5aHADWBetI/o7N6/R58gyVaXJJ0NdREMg8BAT7eXUsR6vDKQagErpmzbTJJYyl3SJPCnEwOGNGNkwkDzkFiwiQJxHKwQNJI3yTZx3a5zAebCgb6yCKdBsexFwbQCOrq9qGSvjzVf+ISXiS83nk41Er4zVIAfkx1A+aQ86KpWYWrmKtfkXnTi6+SxYTX/8MhxwjUuoKFKxCzzmOnJnuG7MobASOf27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvtGZMMuFEZZEDrIKT0iLvjDpDQNQ30A5VXJyWW5cbo=;
 b=yqTjfbeT68z/g2+lhZdaObnd1zbK+qEBi/wQDR4mPsievNSURzVkBA6zR6hPq8THLiZ0cGjGjUzGRTgEIH9+5QMDUJfslJx57UhoBSwZ7o/FgzKdlKWwZ6MKjeuNu4Sl5LE8t9vcwWK2Rx3hSj3srPkFsVCUaEDP0uJd8s/+n9P9nhVSYIH/gfkk8HedOaO2Xg7JVa/yGxl2CBHhJqGcJYGgdriEkyFYpQlPqvq39VvLDWA5dqlIfiN8kg0o5PRxp7UXy8PtiF84zR+QL6IDPxp7zP72/uPb8gBhC94dkW4NiZnK+Y5Senz21NCBxPUaYVFzp/G0FcLXr5jApJIgcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvtGZMMuFEZZEDrIKT0iLvjDpDQNQ30A5VXJyWW5cbo=;
 b=gjRi6QWT3UcJ5ge31zvqVAJlRZuKqrGwpHof0yb1l7KiPSxhGQeevfxWp3ZCCyVFhBrR/YXvTLZUniFK+xBrDs33m77WKJo7NQ8H0yEiZh6wOBcEbYY4DPD6F2Vq1Lb0p95ahjgQdAy8kdXKmOws3kdJ2zeSuC93R9M+6jSYlimqUdTAS2hj3Yb9jESEpa8y8QO9CtC6CYLKd5ljRDc6ejRWJT7ymHJDbo4vGrmXTz7xEmA7IEN5jvr/6zhuVCQaDa1/bRKD3d2dH6ve4wlTDVwDmHSKd1xTIIYJR7RzGDU4j1Y0xkvIrU+XWgBHJetPJzgNKUIJ5IhvMJCE1pY0rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 5 Jun
 2025 06:17:36 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 06:17:36 +0000
Date: Thu, 5 Jun 2025 08:17:26 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Changwoo Min <changwoo@igalia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] sched_ext: Make scx_locked_rq() shared
Message-ID: <aEE2dnJ8jdZ6wyid@gpd4>
References: <20250604143547.708202-1-arighi@nvidia.com>
 <20250604143547.708202-5-arighi@nvidia.com>
 <5b18b631-c570-43fa-ac76-a09f0fb4363e@igalia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b18b631-c570-43fa-ac76-a09f0fb4363e@igalia.com>
X-ClientProxiedBy: ZR0P278CA0163.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: ab03efb4-7cb5-41c5-3e3e-08dda3f8aa37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F1z5nsbcfv+zo8s+BMdrO2NV3XodReS4zzH36hx2qFCiLs1reXGXwHTMPiiS?=
 =?us-ascii?Q?uJhS0H5XMpZs2FrKfAaTYyPkoj5K3Z50ZlB3TNwlF5mxLEroY2O4eFM7BRST?=
 =?us-ascii?Q?gKjAuN4Ey0QUhDwT1KVyOk5hzAALwMUb1qr8AsfVQ6C38/zJk1lhZi12dmY4?=
 =?us-ascii?Q?Us5zWYzIlRlsOyM6N2gkaBn+CzfkrVlShczhlMKKdItLY4irn9+B5IIZALg0?=
 =?us-ascii?Q?AKPx9DoxL17d8x7huFj/2rxSmtJngUUHWfjDhwMTdDSDJ4sNdVcy/fyisT6J?=
 =?us-ascii?Q?F52A+ZzemlBarpRCp+jrZnmdvD3LfcbJCCBwuliKgMhNLVBniEUL8T5QoMOt?=
 =?us-ascii?Q?9UdF8ysdw5a0LrrD99qB1GA4CWNXt/73IgW8X3IDfOSGa4zB7qBn8SKhJNO9?=
 =?us-ascii?Q?koInT8EOhMW+tjUM5AILvxVvcAarKI1OspeA3ww9nu8xcmy05nv+JuT5Xvqp?=
 =?us-ascii?Q?mSww9JVRX9psI2k/duCi+KzJCOdm6DdRFhDenwXv0yMTZYXwPYa91hw61sEV?=
 =?us-ascii?Q?ptNXkPtdu7bO3UZNanRI6J1h60acreXmWa9/lRGxlVJ0+YBPj+TICbVq1jy1?=
 =?us-ascii?Q?X1VrKtQBFKiZndpaFkPOBHU+bvo2KYIVhlHc9FEdgvifUcB4+g8fC7ktP6cH?=
 =?us-ascii?Q?Hqyh/GLuOIRsCmQmTyQyJs3wR8JgBEHEICsCyuqDmpntZYCnW1a65YV5ZxFu?=
 =?us-ascii?Q?xRkdPImiJ2CbYhXYoITxdEmdk6mmLR2bRSFhn3d4bRCRBCkKI90hNBvxKbR7?=
 =?us-ascii?Q?eeSKglneyVHrlZYs0jQ1xrRVOBWggvW3ppyeKaR1s2dlnPeaEpaSoeHeBsNl?=
 =?us-ascii?Q?HAyeW9Lgle70YxW6watVtG6fapfVwNrlV6XPHJlCTFqqfHV1ySQc09mx/8qZ?=
 =?us-ascii?Q?w2PyHeNR+ZT/IEoZSuRok2tAKqs0zBHfi1qTP02bgg6rYg+pmBAvTLDUfACk?=
 =?us-ascii?Q?jSpsvK6deMbprVq6Lkk9GgqCdXKxyxZwMcIilkZD3vGPblGXkCICbgXVSg4V?=
 =?us-ascii?Q?0UDhTuH4IZBZzCQ59C9MZI+rI7vpXNM/HtOynSEdb1+wsjY3UFk1rq4J+S3L?=
 =?us-ascii?Q?TSY/EewUIyPb/pFo1uaFHZ7+VUsOSu+NIgazrEGSvLgjtMurZKN9YwF95/Jq?=
 =?us-ascii?Q?pvMeYUdkhOKFuJ8XePtjviG0Gi1+59hnn0NNmMrLBMoVIv+wfoS0XuY8EBeX?=
 =?us-ascii?Q?k1eKy3EYUysiZLwNaduzbtasjZI3bsWYR0jrZ6I7JdGb9kklDlNn7cAvORmH?=
 =?us-ascii?Q?dYYl1JXPmY6vtrauxhjVubGyx5GQED31QR4S+SZSdYkgA+2E+FVlPRhJHaoW?=
 =?us-ascii?Q?e0MUAdfTma/dAmqBZUAqkjXHTxeJpIESPgmgfSGBn6qwoUecvm65FNk+k/6W?=
 =?us-ascii?Q?V7km1CirxW8psI+cNx9Y5/u3Cj7n1jaBoAO2TQN4MsfmnW1g0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KiPjs3IeOQyBSeeczc1qdKW4bgSpsBdH4KMLxEtq9YjCTRJ0WYHF2B7vJV/j?=
 =?us-ascii?Q?/KJMuKD8GGax/zQGYjk7zFRUl8JNEQ9FJadjFa9zSSJ7azTXauvxk4gB4xPH?=
 =?us-ascii?Q?o7W8YnO4kTVhsUyeqmRuOQTq+LHCvThu1tgvV3Of0PTmRmpLGCuNyeUNi9Is?=
 =?us-ascii?Q?KxzExVpeOpBicFfou4QF0HfMAqpxcDmftxnZWmSNuCHaYk/JuozBDUwLyCBr?=
 =?us-ascii?Q?iiDmPWk/DHBIAAGSumgnpECY0WnoEB9XR0CIbcPYINlN1DtSxHoioN6V94DD?=
 =?us-ascii?Q?N1DQFRY2kv/aLgHHdTuOHaVBmdZAoXLE533cDd+rQ5CGdV+54fchxBKZ6XRF?=
 =?us-ascii?Q?ba4JMfEXW1VgBoX0bqi9PN5/Xo80AjvfeOPvlZALuZmYOI2kh4BJXnBW1PIo?=
 =?us-ascii?Q?uyv5/gCxqjDXZo5BBbIFfzW/0bY6fdHaKnEixcB6mRkSbmLGfdyLVoEmDtXv?=
 =?us-ascii?Q?RFLlKCtuzVLB502PSVJFCrDp6PV8W2pv4p9sf2gM6NePS8NJ+7j51s567zGs?=
 =?us-ascii?Q?RRPXaaxuohf5YOxmLSY8cwLJbwDkQxLDYuoLqwCpH6EPEhV2IoZ3ebMOTvDQ?=
 =?us-ascii?Q?1vAwH4MM5XP7WXZl8R7TQe7UTq+mNrevlHBgFofoQtgjdSvnYFjHAoA9328l?=
 =?us-ascii?Q?ixGJW36RMo0qCluT4obNvtMEYZ7D7papFtN22jlqTjVneiOJlRb1eD734ft6?=
 =?us-ascii?Q?DhH29PYtdUTCR1lJ+YFpRynK4+LWv6XUEhuzHrcQrf+nooKg+r25KwBauvGT?=
 =?us-ascii?Q?2F9QyUGOla74LkdG/E5lwj9LTbA2Y2WGkIXqz7XSaF7s+NPGSfnntx3t0wCu?=
 =?us-ascii?Q?EikmjQL803KpH/sLVet41la3i2loDxmBG9+6+9c+U+QAdGhtxevpqwi+fjnm?=
 =?us-ascii?Q?8RikPRWVR9pp5+Yd1yHRzEGDBKCHLjJPt5NQRFyhKZtjGHMvCMW9UQCIbab0?=
 =?us-ascii?Q?lcfde+hHfXKLkby6Vn129R+YScSDkEYJIzktjC6SmV656U0hDM6bvPshE7YG?=
 =?us-ascii?Q?nvexfU3LE+8OmrlORcbWyW3S2ReBvoyReczOoFIGCrEcfC/HGlN+pgSFoXL4?=
 =?us-ascii?Q?KGjfwxXKP+tkcDDQMfQ82fD82BxfW/kiTycCjxgDYkYwsgcpHF8zQ0zrK+fu?=
 =?us-ascii?Q?IcxrHX0Y6TmEXcKfscZzS8NFf17ES/KgsfruMyWm707gueBLgsMnZ7f3nMMb?=
 =?us-ascii?Q?Cufq6u+WaEvyKH6bGbBNygsduh5yWGgYCUCvbbu7t5pdQ+N466mHarpy3Rfp?=
 =?us-ascii?Q?7xMYnLDTcklG/R3F2GHX1B8mYJYlpnrEgP2PRueVML787rVdpL9pJx9X6k8O?=
 =?us-ascii?Q?KrZCxjeSN46Xw6VNp3N+ALoEaLcWQQ2GoQsV0aRuTknAJ6U/Ct5vrgqzNRwJ?=
 =?us-ascii?Q?A+BnoR2hiSskksll4H4ghv2bGV9sg4sQivipzhX4o/MgMd33tMrIhng7pi4v?=
 =?us-ascii?Q?URE6huR6eakTOFRBbmkN5Y2Md25JoUWezxOOMLQlKao16iy0vzZkGlniniTS?=
 =?us-ascii?Q?42EC6pVgaNpD13xwIpn0jvkMLYvDNj8ESyJZCiC89K2r1BfG//UgXJGG9GyK?=
 =?us-ascii?Q?E3gr2KB4kYqa0J7BR/qJk/LQfUbdJOkgeXiFekQX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab03efb4-7cb5-41c5-3e3e-08dda3f8aa37
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 06:17:36.0819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUgmfmcZYW9zTLaLYETxHvEydoO1sl7s9+YrI5sFBwJHQoKpOXAOpYyhy62UlGUnnq0FKMRR3+RqZMuKnI8npg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9473

Hi Changwoo,

On Thu, Jun 05, 2025 at 07:28:36AM +0200, Changwoo Min wrote:
> Hi Andrea,
> 
> On 6/4/25 23:33, Andrea Righi wrote:
> > scx_locked_rq() is used both from ext.c and ext_idle.c, so make it
> > public and declare its prototype in ext.h.
> 
> scx_rq_bypassing() is the same, but it is defined with "static inline".
> Would it be better to define with "static inline" for consistency? And,
> anyway scx_rq_bypassing() is used only within ext*.

Yep, I'll make scx_locked_rq() static inline as well as suggested by Tejun.
About scx_rq_bypassing(), it is currently used both in ext.c and
ext_idle.c, so we need to move that to ext.h.

Thanks,
-Andrea

> 
> Regards,
> Changwoo Min
> 
> > 
> > No functional changes.
> > 
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >   kernel/sched/ext.c | 2 +-
> >   kernel/sched/ext.h | 2 ++
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> > index 3e483138dff60..941603ec67e27 100644
> > --- a/kernel/sched/ext.c
> > +++ b/kernel/sched/ext.c
> > @@ -1265,7 +1265,7 @@ static inline void update_locked_rq(struct rq *rq)
> >    * Return the rq currently locked from an scx callback, or NULL if no rq is
> >    * locked.
> >    */
> > -static inline struct rq *scx_locked_rq(void)
> > +struct rq *scx_locked_rq(void)
> >   {
> >   	return __this_cpu_read(locked_rq);
> >   }
> > diff --git a/kernel/sched/ext.h b/kernel/sched/ext.h
> > index d30f2d1bc00d5..cda5dfa4dad09 100644
> > --- a/kernel/sched/ext.h
> > +++ b/kernel/sched/ext.h
> > @@ -18,6 +18,8 @@ static inline bool scx_rq_bypassing(struct rq *rq)
> >   	return unlikely(rq->scx.flags & SCX_RQ_BYPASSING);
> >   }
> > +struct rq *scx_locked_rq(void);
> > +
> >   DECLARE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
> >   void scx_tick(struct rq *rq);
> 
