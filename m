Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5616B215057
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743095719; cv=fail; b=o7nXEZnncNTy8gk8P5Yq1xrp1pw+gh9bBROIwtYVIwy46PQ8Tn4Sxgc1TMKk6qU+RDZ3e80VLTI9l1N5jRVlrhrHx57BUDm2IWWKSCB1r+89aXWD+kOHNX/kuyJ9TB/vP0IfAtXl+AwZ4rzF7VxuelhSyABgapKqGDc9D3keQcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743095719; c=relaxed/simple;
	bh=+uW1B9rH17e6D/elGScePo3dZCQ30wFcxBG4hMFUS9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PzBijnN8H0Co+ftyNzj3tjFW+qacbqYJR4A/qFcx0hz+thz8gJ8NdXSkyIvJq+I2C2HGJmaKb4esHMshzfv06NSRpDjHYhdIvQBGtIr8AUu4NsUec+5iMt8jQBxRvddV3mhYXofCl0mPWSsiuJeQpIyX97WPcxVh2aNh1gLYCjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CNVa1wNz; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CNVa1wNz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxpBru6kEpjpdpwilUc4/ZxSvl1OrRpmAIOA4B9FEuvByv/KOxiRFbhnZmDvIGFsrRn5FAIXXAh5IuiSqCSHbYSxL4rLgN1pOtHn5y2Qu03M4e7i6U7yi03wbQvXl9nQsGYvaOVCvPX7hX/tpufTQkmoovxzcIUuW07ykEyrgc+FvWgcB7xVY3bxMP5YUeP9GbmdgUC9qntGASoTNaZyCbBEBmQL/hFM5mt0ZVXljklwauyWqUlIQQuLcp+Q5YqXqQbBNTiCfM0Uqbo+X8T2V1nl0B0jEFJlNxYXTQydRFtDF56h5iSD7Zt+ONt/ePXiqAKjFH1Na0vflIRrAHuhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/x9DkrIF6EluTF12rZksfbffhd05zBpbM1ThDNAdRQ=;
 b=Wl9hgJvg/UdXlAcyEJ67LL9K2R30OEP+aBsP/6dG5OXnE5uF9v87UF9lPu2h9Ly09bDDB0BY1nB8sEFybbfTPVw0iSXrqnTaGAxThxVIK/sdJW+dN9uIzEOPzU6fomW9WoKHiuwIDNwISmu3ZhW/6lzs6k27utsTIeoO3yAlmliRsSM8FTrsX1M7IpvaiPHKXz9NyxlJRTr8nq6I76RcCJN/Tb0vRg7ObqwJR7x/mlTSpivpB7z3UkJiR/f/pQNwf7JZ3mpjdJgOdDlT14jxaFx6en52Yr3hE4tg7oW0mNAnr3ZM9ckM85S/epZ6HJV/1HYh/uoJCaCbNorTybPpbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/x9DkrIF6EluTF12rZksfbffhd05zBpbM1ThDNAdRQ=;
 b=CNVa1wNzqg0jEhD3WjlRhj5VQVqkkqpmghsjAEENx8zCFDTty/bq1aycAF9CeefE+itL/Q7PD2O0YJczf3Gdiw4K8jDjGQROwaKu4ppSeRf/m5FWlEM38tUc7UGtRJdxyDAiBC8Y67EmDXLqZXUVS6sq9WKpKN8KzPADhAMXjWsPrPeOBM/u8o6gaBgyY4eoO3DPJlb5w+jb9rwV3JEeuolGT4FOshiJjsRznOgw4lCgYRFLHOstikXDoN2FfZBcLK5ZPp61eo626Tl1FUmd0FyXJxNLq5RBtm5CE9fFymyQ8QvKw6Xru1zi4I1jxMIGQgTeqwRMOF0l4FM27Lafdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) by
 IA1PR12MB7591.namprd12.prod.outlook.com (2603:10b6:208:429::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Thu, 27 Mar 2025 17:15:15 +0000
Received: from DM4PR12MB6424.namprd12.prod.outlook.com
 ([fe80::8133:5fd9:ff45:d793]) by DM4PR12MB6424.namprd12.prod.outlook.com
 ([fe80::8133:5fd9:ff45:d793%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 17:15:14 +0000
Date: Thu, 27 Mar 2025 18:15:09 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Message-ID: <Z-WHnYrNHHYx3lpa@gpd3>
References: <20250325140021.73570-1-arighi@nvidia.com>
 <Z-SasIwx5hINm1sf@slm.duckdns.org>
 <Z-UEkJfkkBBKqCyU@gpd3>
 <Z-UgI3dSwcLa-CRC@gpd3>
 <Z-WGRetAL9tSPEkv@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-WGRetAL9tSPEkv@slm.duckdns.org>
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6424:EE_|IA1PR12MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d2ff0b-65f4-4a1e-4e46-08dd6d52f057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NwqvLT/77SJnE8StjfiUOPGeICDId3DhhOXQ8DELoblsuRPdRRAw+anGItWw?=
 =?us-ascii?Q?nGZ1mMP7FuLTwGiss0Y+AqxOydIlR+VZWZdSIvo/AqEblu7OFK9XuqfufNV9?=
 =?us-ascii?Q?q9BxDSEKl3VMZKBubWZTFvUinr1BPmvZLpeO5NDUKM8vthPmfaPGty7koqmB?=
 =?us-ascii?Q?R7U1vZ8fYB57VTjTjKd4BeciaIiuPUpMwQpEOaMDHYcYERpbKGuU5491xnDo?=
 =?us-ascii?Q?weD6WsbqlrFCsi6aRsIf0vhjVJIT4NChNUSPkwIa6SpttR3ZEd8WMP2HKmay?=
 =?us-ascii?Q?ClVI5Nej4d+yrY5/V+GAultImeaP/iZuA75yCmucxv+pzruxepqs2h+8xToM?=
 =?us-ascii?Q?BD5dYUnH2Tg6YINGlNr1ydAXQFsf72aKbMWJ2P5rnCXrxKPNozWRV+Naxzo5?=
 =?us-ascii?Q?mtbqjc37E4NR0L4GHNqNrKXX9B+PJ0IMbhnYlBIAqV+//M6DnuP0xju0kHKY?=
 =?us-ascii?Q?Z+rBtnSUdurK4D0AAtpNviHqW0uUzRl+2RUNvrqBBV8P98FO0sT4MaH5YlSq?=
 =?us-ascii?Q?lV4Rx2mVv1Iptp9lLnfC1whU+13q2+bS6mywDa3vANpTDmNvlTv5y7fG8iC1?=
 =?us-ascii?Q?/nQUwQZAar+l48R1wBFjuBwWb7t+HYL9/5FpPr2BAjjGoCMd+ZAgGJ/xdH1a?=
 =?us-ascii?Q?Feje0b92Rfd1TXBGM/24HVi0NZHwKcXUzz/PP9FoWrNZIQKxb8IWGDZFVAri?=
 =?us-ascii?Q?GIbu1SYLzjlU9lp28YYj1H2BdWUdYPdVQJ3MNL5PrmuKJxwbIKOYj3cTEyBC?=
 =?us-ascii?Q?Ru2N2SZghXOfSsXbBXcOeamEAktWS+fhUCgNIYUnVzeeG6+Vz6ZFfvWrWWqS?=
 =?us-ascii?Q?dnkC96UB6h1gkQUGS3sVVE9X0jkAVyFbPx5zqjSKfx7+saCMvza7u61XAybd?=
 =?us-ascii?Q?SUa2rPLtzvDcW1W3Z88tGixDylyM6WfC6dQ6gK88LmnRxP/5YHRu6vPAql5g?=
 =?us-ascii?Q?yX2KqM+2Ygrau5c641vmwhVk5LoDUkJ3QSu7l2N3GFTzsAr5XkLMMHrBxrYZ?=
 =?us-ascii?Q?a5jBty5bRUTOGI53Hg/ySaL6uzRVZSpGZiOkutuXVjVq/x2RMkGp9aTy1KKQ?=
 =?us-ascii?Q?Xp7FqwT7lQ8LWq90rQUWK+DPND+hHtmzzjlpqboasA0i4oGrTqkqpS3RCTGI?=
 =?us-ascii?Q?YxnoRB8ZZ9cc+zk6ritE5OVs+ahu1DPzwcYCVCwkHba62mTjVDfsUe1RrYJB?=
 =?us-ascii?Q?cDO5eBP86Frk7Ahx6zA+JeHLySC3EsRyx+Kh+OCI3AM6GrPMU5hNofOUGnrx?=
 =?us-ascii?Q?P02ih+43yI7SZpWw+/a6E7J4AFab7uD6CpOhUzWKpy6B8dPhtvKuBzUmp1LP?=
 =?us-ascii?Q?gOxSFEAiIJbYk0aKx5OW1U9gfLGZvwdKkRb71JTnTldrId36SxQvhMcN7okU?=
 =?us-ascii?Q?hcsYK5GTGREX2lNg1hMpt35cLxZN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6424.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eaJAfddBNRwzbhZlvg3jtQhf1uSeI8RKYFbwyFmlOEBicZhKP5pLT+tDrBw0?=
 =?us-ascii?Q?a73FWVM0hKcQSVGnqzrXoutQ4hXzV6Jnnsmtrrewo6rftF8NYULUQU4btrZJ?=
 =?us-ascii?Q?myoxr07ebp878kd6no+/TGXOkKoLmsRKjLIeMw2YO/1Rbr+csgh108WjSEzz?=
 =?us-ascii?Q?TzqQ3gsQw/YH+qHH6sDrnD3AsZ/GfCsqRfbJPZ9P87ifmROp8Y2/jjGU5kjz?=
 =?us-ascii?Q?dKD8y/sVAbnLxaemd4nR+wg6Czdm9L1haAlOwoQ0yvAtU92PQQhzRhm6OBwo?=
 =?us-ascii?Q?jvUKqBAV4SnnNeilOsWmdOdO2YJD3KA7PnUV1D4SaJ9q12YXha/vTb8mLKRa?=
 =?us-ascii?Q?OBboegMzizjQqd0zQRfNsg2d9Gs/H4SFIg0knLNddECCz/gC59ewrYqqI4Km?=
 =?us-ascii?Q?yaU8/Qqd1ETx1pYNSoQzss//b5QQZIpqOJakSbA30nSaoCwN/pHkcvKaUZXd?=
 =?us-ascii?Q?0thuQwM1bXqaG95hpTOxVYg78l8caX1F5tCc1UIJYgyGowys0H5crqAwiVQk?=
 =?us-ascii?Q?FLWoKmtBxe1gA/Bz1e2Tsgm5kRw7xT6W/JGbczsY2yIYFmXct8h0qX3uAIK+?=
 =?us-ascii?Q?9bug3K06KXM///OGiXpPOakMUoOywN/17jMO0tL2UBUxX13rZzl4WhFnUIuL?=
 =?us-ascii?Q?BA1qQJwUe9G0/KAQadNAazBPShg3ceF39iLjCfPSOr3qrP+oqhUbL45h15Yj?=
 =?us-ascii?Q?0c1hXrxz9FFz0Oqmgz+oy4TU5jFy98clKa6uxKrHWd8DQh3dsIsqjawoCbWs?=
 =?us-ascii?Q?IT2w4mm0ujRI4oeSPPB6kTv7lOK3Xhv9ijMnQrIxSr8eOY95XLeFk8sdNXUa?=
 =?us-ascii?Q?+DaPhU1to9Ioc0j1hX1lv/btluiCT9FJHO1Y/5YK+xx3lLpJam5s9tOiPm1S?=
 =?us-ascii?Q?+UW5hkDGw2GXMi1USyqV7y1Jx/5tSXEsnuApv6Ykv/2j2tVhS1yS9r+8SYIO?=
 =?us-ascii?Q?SYWoS1pLupImBOpcIWtkeRdTAs3C+IElVKEPWJteYN0GEIWpk1KhWzowPS5m?=
 =?us-ascii?Q?ACtX54+VtbcFbfMdAEwCvbq8ueAO4dDMvxMZfS88ziz4SyQvzLIs2MkT+eQD?=
 =?us-ascii?Q?kzD6/uP15+ZlKZ6qAS4NROM8LPLUSYVUPk2wADdVYPZrdcuaLmO/WSVmvd5v?=
 =?us-ascii?Q?JhWmMChDKP9X2rIf8Mi8Qr2XMEzHBri/XZvJF0rxmMpjf453G1sQdguvmgbf?=
 =?us-ascii?Q?gAizUj2RR7vvDkx1NcZtf3hHktxWgKBEiqwIHU6mTNku9urTsWexMrJulODW?=
 =?us-ascii?Q?YIQhT/y+42J1WQblJQy1UOzxuuXdGEpw/Uq+EBrTzkPMEmMdKT65mR22lh7s?=
 =?us-ascii?Q?DTQV0RsKbWvXtHze8X9gHpRIVR9VZxiP2ZeigU6ziihpM5/Dqem1VIX5XdQX?=
 =?us-ascii?Q?WXc8xkAWmkGV27GC7+R/uVrsj3a/8GMLcxne3E3woHhnOmVnAQRupR0cweBL?=
 =?us-ascii?Q?da30JPZDmSYqSMZEqkIHz3ZUjwTaQH9CFjDanRKxcXGA/VLw7UT3EeRHlr24?=
 =?us-ascii?Q?nhfkK3gLWa2C2fBqqtftXnboX6LJtCt2bit9V/cimcEEsr1MDCcDaED9pJWl?=
 =?us-ascii?Q?/6dR3erBmXsnUZj718i5UbVla3RiKG64gzq88hAF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d2ff0b-65f4-4a1e-4e46-08dd6d52f057
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6424.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 17:15:14.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4b0xCUOdIkBXhXsEMpykqpaOOLmKfWqORzhO1CKahpZGfR5O1ie/SiPcJ4q+VpBDcplbNpPZtULKXsFHNFN7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7591

On Thu, Mar 27, 2025 at 07:09:25AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Thu, Mar 27, 2025 at 10:53:39AM +0100, Andrea Righi wrote:
> ...
> > > Hm... that's right, it looks like this requires a bit more work than
> > > expected, but saving the currently locked rq might be helpful also for
> > > other kfuncs, I'll take a look at this.
> > 
> > What if we lock the rq in the scx_kf_allowed_if_unlocked() case, and for
> > all the other cases we ignore locking if rq == this_rq(). If we need to
> > operate on a different rq than the current one we could either defer the
> > work or just trigger an ops error. Something like:
> > 
> > 	if (scx_kf_allowed_if_unlocked()) {
> > 		rq_lock_irqsave(rq, &rf);
> > 		update_rq_clock(rq);
> > 	} else if (rq != this_rq()) {
> > 		// defer work or ops error
> > 		return;
> > 	}
> > 
> > 	lockdep_assert_rq_held(rq);
> > 	rq->scx.cpuperf_target = perf;
> > 	cpufreq_update_util(rq, 0);
> > 
> > 	if (scx_kf_allowed_if_unlocked())
> > 		rq_unlock_irqrestore(rq, &rf);
> > 
> > AFAICS all the current scx schedulers call scx_bpf_cpuperf_set() from
> > ops.running(), ops.tick() or ops.init(), so even with the ops error we
> > should cover all the existent cases.
> > 
> > The only unsupported scenario is calling scx_bpf_cpuperf_set() from
> > ops.enqueue() / ops.select_cpu(), but maybe we could add the deferred work
> > later to handle that if needed.
> 
> balance_one() can be called from a sibling CPU when core sched is enabled,
> so ttwu isn't the only path where this_rq() test wouldn't work. Even if we
> plug all the existing holes and make it work, it feels a bit too fragile to
> me. It's something which can easily break inadvertently and cause subtle
> failures.
> 
> If we don't want to do locked rq tracking, we can always use
> schedule_deferred() when any rq is locked too. That's a bit more expensive
> tho.

Yeah, I'm a bit worried that locked rq tracking might introduce overhead to
all the scx callbacks, just to address this issue.

Perhaps schedule_deferred() is a reasonable compromise and we can limit the
overhead just to scx_bpf_cpuperf_set().

-Andrea
