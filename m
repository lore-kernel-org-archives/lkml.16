Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3C5290DBC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047962; cv=fail; b=C2mvazsHd5+8tn5X3hH5dDyMa5EjSYVv838DR+EPLrW+7uMrunqTzr3upyR8YQTMEvw013iXzaP7JnA+YHnGHDhdnMnnC3enhll26afuxmlL1/yCYVVMb+CDAp/HWgrR2WSf2PIKNP1ncBIzrJK9+bB3cmxMtiYMenfIF/6hr2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047962; c=relaxed/simple;
	bh=E45XpgtRGUuY4NdO+aCTx8rw+4uCdSLwJNF6exGwVF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LplevSGlnBUUY0EGMBoW8x2nHOLony5dEGdN7/o0rbQpUnXlknMhjDig+IzeY3P921ibRMfP8AAC8srCXejuIhzPzZ/ZVZfLEv55OEyxonNF7rx5kA6sVj8PVIUBwNkVhdT3UR/jDnd/+bNVqDSCu8t7V++fDctQBa3PF6tAAWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VwYTQlqJ; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VwYTQlqJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuiAn0K5TegELqCLc2fhwdHeKhrJmMz1eN/fkzPzlrzlmvJ9cT56/cGtwOz2LzEnuIyZa+Wo4LnZmEhQQC/yaLrUWdd2CAn+Vn8NBan5s+k4oP+axLV8lpnIvlT+mRab6h9UeANukUGXy1iPtRi814C3iGd4PLvQ0UafwV7ZUlJqqY24qUzIyq4HT27Qhw6zOFCxNP/kuideNBZJhcfgi15SH9qwMmRfWtKsFu7HwNBVlgydVXeP7jiZy9vWLbY4xrjizPlqw+dISJgKO2SwkQOGlpTzfD/TjYp/vc9jWKwSJRccU+NOjktS/TOxDKnUIu9ZNe0Kx5htIf+qoOAZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhuTVeKtbtuHe8p/Sa8KgcbrDzupJGqWHCFTD4sH1sk=;
 b=DSn22uLWWHM24XnJhyCkQt4fkUYv5u+T1G5lFvxUQ4HGLq56PkSO0Cc6s+nMehT6UyGVZiIwgFZBdrO+JmdO5DlWP35lEbBQRTjgpEjf4+cLRfr41GP4iORduWaIXL4duR6Y0M9vPOuZN4rw/01GoLPYSl84eWY7NHugVgs02E2IZxTZGcko8iLEvbMj3dYPO+DNcrpJDfFd7l+nrmpgLY8eEXP8qgARyLRMF8y1sk+3PXSUdpLHQZERAfMTQXOzXYU8DjYbAGZHkra2AtaoDluq5YIubojsox90UsMdod7qI6+8/u/vjTijQlsVvfZc/dz5CaHES0wSWoFsZcfT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhuTVeKtbtuHe8p/Sa8KgcbrDzupJGqWHCFTD4sH1sk=;
 b=VwYTQlqJYl65QUDeFXZAeAOnXdKcmfQlwMvAAW4RS5qlLzq6fpTHIzELOXC3+7eCc8OyRlBTDncxh1AJDwepdCVdTrYTCuuWETE2XcLz2j1VVzAHVl0n8zrf2AozKTWpuxmd46kHyJtGjdOSQ0mDI5eH22Wn6PuQRiu/3l0UCCVzXU8ZMhVz3Nhgcm4FGY/ba/wKnwVDz/VArFdIX86ml/eFVFQOYDHh6O4MHs+1nWkwZ7Vf5j0Z2lx41KO28T6Qb+W3KN2G+8VM0x1XevYlH8jelr9sVdPbqEFlzdrZIkVWvawsjsdhOFG5APm5nMEQMOaAYqx8A5xqsmRtIqDJaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB6894.namprd12.prod.outlook.com (2603:10b6:806:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Wed, 4 Jun
 2025 14:39:17 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 14:39:16 +0000
Date: Wed, 4 Jun 2025 16:39:08 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/topology: Fix for_each_node_numadist() lockup with
 !CONFIG_NUMA
Message-ID: <aEBajJN-kvO7-pcS@gpd4>
References: <20250603080402.170601-1-arighi@nvidia.com>
 <aEBUgWdZtz8E_2d9@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEBUgWdZtz8E_2d9@yury>
X-ClientProxiedBy: MI2P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2cab96-807f-4343-833f-08dda375953a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3pCntnUZA/1LUKh01ag9Pt6ohuMalBzARoYVwQQLh6YsY3aYcMN+Xyn4JwDn?=
 =?us-ascii?Q?bZrVY0i88E3L7miSUb6L7yxxPKnX5Ns8p+ayixghRxIxUS4sQ66+dsm2j1ui?=
 =?us-ascii?Q?5wiyqc6cd0DPoGdwRctiiwG8Wc1GdnWTcSXW9U+phkN8j1TZjaKDbSy6+0o9?=
 =?us-ascii?Q?Wtml/r3ZdpTXvJTJETHHo8Su0R8Mq5Mg7+ccwFuVeYCoTYbvxe2oQPancCGb?=
 =?us-ascii?Q?DTj/9sO4okw6MKIhtQw02nMSDwb18Ekp/O4+2rH0hn9oeOs6L1ccITkrLHQb?=
 =?us-ascii?Q?qHGooASVq6k1V8eHls8flR3B7X9/hGASmX+7OvR5ox2u+fwDQLtCQUoUbc7i?=
 =?us-ascii?Q?Vs9LJ7yrmZFI/6PwT0uxwh/n8LUuzpk9p1KDlefP62VGSEIllKWjsi84SS6H?=
 =?us-ascii?Q?CMCPhroozv076DOlXFZL1zVlfPqmLWsu6bak7OfgC5LCdq6kdZCjy22P1XR4?=
 =?us-ascii?Q?hAZXXRjwH2JsNEU5Vg+HUPCmG1Puo6S5/IpJE3b2f6hEXq9tbirfvlKbfMWO?=
 =?us-ascii?Q?HPb4hbqaqNqz6z0TxBhEubU7ADa0uACfoaHPayVgDLSNnYjQ+f9OyGKU2nWG?=
 =?us-ascii?Q?3XBva9BEr6nzlP1DpVjfsY4GgUFxxf/SVgLYyVw4SE4bR5R8Waiy/Jp1jayt?=
 =?us-ascii?Q?nTVP48yElBqMkmuUW+LpJRMtjcIk8Fsvid6iJSBHdigTowJMZTqJ63zK3TSV?=
 =?us-ascii?Q?8+nTJeZ1IBtbMfhPtQ6eXzJLWVvGNk1xG20hhIepdHyoHvLW/ITWwezOITKS?=
 =?us-ascii?Q?RcOct2u8MxCkVLqOhpHLxniz/57z1J4vUahsAhrrBqwfoR7mtaTh/E7Vbfto?=
 =?us-ascii?Q?y62Uy3VA5Epor702RM6dlvVpnPTGAPPiRJq1NlixN5J2NABaCF6VbmPk4gCk?=
 =?us-ascii?Q?viRW2PCq7Asp9uEPtDDoo2HkayD4Z1j/PR2ylt/SCEmFboDlbj6mG6Ezn+aQ?=
 =?us-ascii?Q?DHo+stxXnpL95aelz0BRPDAiYQVAcvGtbO68QG58PqNTq3j6LOaaF5/gZrIQ?=
 =?us-ascii?Q?4cJVo5Hozapzw1iNEGaZwR3feYMeSIdvhCISIZ/cWdjF+vUz4kdfRe8mtcdV?=
 =?us-ascii?Q?BcQf2+dSrgDR00f2sqgbvIOCWvX6LXa9OuplR6Jf7mPrcSvJ11ckgCEuUi5X?=
 =?us-ascii?Q?i8wjPPNWmHiBzlxAUfhpCd6Az95XT2BT1Mr/CG0S8WQ8779+qxnsS0P0v9qL?=
 =?us-ascii?Q?IXKLU3I6AVcuSDVqht61oWduEoYEr+ufz2aTslNSplz8A9KGseX95X3NwL18?=
 =?us-ascii?Q?n/mPSzgY/Vv2OVnH7wOoFNRXXDGCXGB3yv4IRvvgkwWzqh4xAGi2wSSCJqdK?=
 =?us-ascii?Q?t3CZFNVWjuHJyDgNq9c7BN+QVnCeKw3XhMvafOM86S3kIV2wOvV1U6d8asPG?=
 =?us-ascii?Q?cYDOhJs/89oy+l77wTJH8rDiyMpKwin0eycBIdwGdPjFp8j9S1nStFczVET2?=
 =?us-ascii?Q?8jbr23t5rgk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CFWMWXa95+Ty9L7qo8L+LSnV5AnemsbRcLaxVHsf5OEjk7Rui2JWy8LHt/x6?=
 =?us-ascii?Q?J4Nc2A/v/xSw3ECM7wDDStIUJr8aUtg0aQGNssDO/sP4FFePqpST+/bWjbzk?=
 =?us-ascii?Q?Uvo7KevvqeRCsQu5HY5F+KNkNe+uchidubslToGNEkR//F9a0sv+nyT6cmVH?=
 =?us-ascii?Q?Y9V+KSpvJY1+vmSALC65bzbUAYO4uFql3SH6+SBxfZ2s4LL4LlWWa31cd44T?=
 =?us-ascii?Q?qp5uiX9WHHwWgTTbdqFGBBPuqpKcduzCQYubO0sJKptSr7jOqJO1I4tzKTcq?=
 =?us-ascii?Q?z6hsKfVXvV1v7HlX8iGkO9Z+hf9cl35jUUymC6W6bocVPIoHgGPWgqxgJOsR?=
 =?us-ascii?Q?xjCsJDEr8jt1dtfGLh/mrFZJ3m1kCXi0aWnhfMDIcBBpKTfaDrRNLT69ha7r?=
 =?us-ascii?Q?l62EF9iqBnItVeomEakzNr/h+92xgC7sID8LcHPkqtwO3GtM3i5iwLYxEhtw?=
 =?us-ascii?Q?dcOBnanmIYSi7WXfvNY8R0A/hWand+Shd2ZzoE+JoGe80d+QtcBneZQEwTuO?=
 =?us-ascii?Q?ot5/Kvu93M891pkrYyBxibkf1B+GCfIU4ICLzlW+xQ9nYDMnsJs1kg3nXw4s?=
 =?us-ascii?Q?zOMxCfUcsfy6oBKoQv0i5x6C2ixYPvmbO1ObRK/8nh6GntegC/5ngQnKAkIE?=
 =?us-ascii?Q?lSo9nHTM3FC/esEXnUJ2HH71C8tHedOf7HHXi0yfnWfBVweuFAdXHOHYGwp/?=
 =?us-ascii?Q?hkCkOnZ6uy6QI4F58HlUVE/bHFYn2bt/OMVxuquobCN/aY8RAwgFdypxniQn?=
 =?us-ascii?Q?q/RKPxJa6/rbx7HnWesv/jJzYOoTbMYQkhtbiiDZU5hrg0SQBhaFDFsC3GkE?=
 =?us-ascii?Q?C9E8FojD4pjaUd4quZfQ1PTjCjU6zcE+oK8s7Xv0bMvd02lX1hav2ah2NpAR?=
 =?us-ascii?Q?9/uv3WJZHcdF4vzRw22M+/AYBI7J3qO9qVm5DFp90g8NcRioM64S6w5oaIk9?=
 =?us-ascii?Q?JdiqT10kxOg1pbevajIfWUVPhQz66uHitqXPTFW2BzfRVtN6LdKj8zpzHxiO?=
 =?us-ascii?Q?TaLBG3pDtpTi4fIBnII3vR/8lTxPt1JlJWvPB11uIQI5WRH2Agy/7seO2qPO?=
 =?us-ascii?Q?RR+5nJlNnkv8a3ApELG5Bd6DJYFsV07mU3w7ZTMC7/dbSG8l/+PszsPGU8VR?=
 =?us-ascii?Q?F0fFgt02wt2CHEojvf+iMjjoOufswDcgO/40kl7i9nMd4UJYWAKjIl821iXj?=
 =?us-ascii?Q?ZlvTa2j/4hDSxyHMXXffxLG+Q1X/DHbHL/5Qg0K+eU/cCLyjkIF5rlV6V4MY?=
 =?us-ascii?Q?Y/F6GT++pEaUxUsj7XZRu0sEh9KrPq20QmMHCsIJTFs3WZO9890cS7oSeAFK?=
 =?us-ascii?Q?Kiu8HxnIVZo12/7+4W/tDu+NBz9wOx62kOzb3Crcp5k4E+Fh8TCk2cMgr4mh?=
 =?us-ascii?Q?cra5YqAvom6HAbyTkhIGZiH9SYJmFNbcDHhWDiD5sAQOqiSeax47JaGmaFO/?=
 =?us-ascii?Q?rciq8BnwCOqMIR4CRXoTSHtIMUHye4uojmrfWJFUD14HnlFzP9Dr2bSpB/3+?=
 =?us-ascii?Q?JDHDx9TTEpCPOvOrlC9lZjU7u1ctOj1n1wnxpymETNeVdWZNkA83fWInqqXg?=
 =?us-ascii?Q?bvHGwAxlycQ+6OR2augBQ5nElru5VYcOWkJO4J3E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2cab96-807f-4343-833f-08dda375953a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:39:16.7805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJVAV7Orl3pyVkX2BxryyCuKijB/t0DJn8HrspfrDMO69l0Urwmx9PUjel38mQAVnq3pQ5cAgsr8DZ+J9N4ePg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6894

Hi Yuri,

On Wed, Jun 04, 2025 at 10:13:21AM -0400, Yury Norov wrote:
> On Tue, Jun 03, 2025 at 10:04:02AM +0200, Andrea Righi wrote:
> > for_each_node_numadist() can lead to hard lockups on kernels built
> > without CONFIG_NUMA. For instance, the following was triggered by
> > sched_ext:
> > 
> >   watchdog: CPU5: Watchdog detected hard LOCKUP on cpu 5
> >   ...
> >   RIP: 0010:_find_first_and_bit+0x8/0x60
> >   ...
> >   Call Trace:
> >   <TASK>
> >    cpumask_any_and_distribute+0x49/0x80
> >    pick_idle_cpu_in_node+0xcf/0x140
> >    scx_bpf_pick_idle_cpu_node+0xaa/0x110
> >    bpf_prog_16ee5b1f077af006_pick_idle_cpu+0x57f/0x5de
> >    bpf_prog_df2ce5cfac58ce09_bpfland_select_cpu+0x37/0xf4
> >    bpf__sched_ext_ops_select_cpu+0x4b/0xb3
> > 
> > This happens because nearest_node_nodemask() always returns NUMA_NO_NODE
> > (-1) when CONFIG_NUMA is disabled, causing the loop to never terminate,
> > as the condition node >= MAX_NUMNODES is never satisfied.
> > 
> > Prevent this by handling NUMA_NO_NODE explicitly in the exit condition.
> > 
> > Fixes: f09177ca5f242 ("sched/topology: Introduce for_each_node_numadist() iterator")
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >  include/linux/topology.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/topology.h b/include/linux/topology.h
> > index cd6b4bdc9cfd3..095cda6dbf041 100644
> > --- a/include/linux/topology.h
> > +++ b/include/linux/topology.h
> > @@ -310,7 +310,7 @@ sched_numa_hop_mask(unsigned int node, unsigned int hops)
> >  #define for_each_node_numadist(node, unvisited)					\
> >  	for (int __start = (node),						\
> >  	     (node) = nearest_node_nodemask((__start), &(unvisited));		\
> > -	     (node) < MAX_NUMNODES;						\
> > +	     (node) < MAX_NUMNODES && (node) != NUMA_NO_NODE;			\
> >  	     node_clear((node), (unvisited)),					\
> >  	     (node) = nearest_node_nodemask((__start), &(unvisited)))
> 
> When NUMA is enabled, you add an extra conditional which is never the
> true.
> 
> When disabled, I think this macro should not be available, or more
> likely have a stub implementation, similar to for_each_node_mask()

Makes sense, I like the idea of having a stub implementation, I'll send a
v2 with that.

Thanks!
-Andrea
