Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB03A13B284
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232822; cv=fail; b=Ox/5oXKZWk6kprROAFn+mH2kbQuRQGA+F63mijlMUdTts6llWHXw7vL8sjRoFVc+M8bX2vXqOKXD1clv0A8XrEPpBvp+0Lo7sfaDX0LxZkW66Z5j6MJoFqRdiZ4rhDtsEMCFfMyq22Vo25ObkjTvqWvi9nNu32AhGiio1FeCPds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232822; c=relaxed/simple;
	bh=I9URlmLeBu1yFdFgmXKI8497yvSjqrtmM65/waJaXWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MEK2JkXVADBSzfOnTCp3OQR+AUukHJJTqh8/4LK4VpM0u6GnTyRjyhzAnsJLwGJ6PtQJ9OEWjCOV2U+R7L8OePphJ0dLNUGgC2nKs9t2zJ+8WqjeCBRiU/ir4BLA4LnQ/vQkPhsYIzmI5BCU9rySm8g2yRSK5WHf0cujA7zIHbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qLENtuOl; arc=fail smtp.client-ip=40.107.93.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qLENtuOl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UK68a1JiVTgFgp8olTsGy9/LW4iOT/URPVUdOVsMwD8xoOnIJV7GWtsdWCnrLjee5wkSmtExkkdS5LEX2UjN2rlGWAYLgNjoI35a3y38fTORhI9CpqNm7ZELkjlMUOMc8H5ND9NVlsDXZk4xuoZLIze9sY0cXpl3WO4FDw9XtMRjdT0i11T7K8y/UECVJmIUoLrnZulkYpH2uOrvya6Y/SOv1O2v6SLyZCGVDm04bk9O6pFygXfIMUXJoixQlnwxub7a2HScnNIZlNj7R6XRcuEnKakPCLfu3ZHnbMuEvNcTItgPLyXVOXW3hOS5SSDR02oNXjhS479JNLYgWomtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMAOKRs4Cje+myShZ9VAQz9FPZjqkIoyrK3jmqOmqj8=;
 b=AMaMYXS+fYvliS9wEa0SAIAwjS0p3zNooU9vHo7PdQyHGWCfdHvmoQyeMQWJ+Gh17mPFeBuYVYvj0/gUk3AXWSrzwXZX8wcgzebIKMwMN7uommNZ2Xn4VTLEQkcC2Ua0qJUJ+TzvUdnFo4T2qKOGWF9KTLfla9Y6orVeKuf6c0tYTnb1Cp2nhjphU/3fX0jZOLqFx1M/eDZyncmLJTXGGWzZWc+VSWjn53Fg7Nze/OWABD9XHdBphsLMeVmLb1SwcmEnCeSvoWyO10VdEv1/Uu9ya4EcWsEHRE4f31VC/3lD14gULnv6KVyipXQJ0o8dn/9bX7HNoFAdK8GK2lTjMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMAOKRs4Cje+myShZ9VAQz9FPZjqkIoyrK3jmqOmqj8=;
 b=qLENtuOlSB95oihGKTPZkWOYyPPpv6Isn21s4S2+bDgHAb6xga6hZfV17Nj674s1Q8wrNPAHKJJdnWSZhr7L3g2OX/iRzQ67V/bN7SSTQGq4xdIX8K2BF40h43OdQ+KrSDtrAXeKWbv6/rv2GJ4Lha12sPo7I5+wXalVOX2UrKFXdeZWXYJ95MT+Oti7VHpMMUkhGiMZBgKhrQclLKApVLIxDtio20z+qgXH9JaB3SvKz7Ryn2L0DtJZmjFzF1T4ppSGb5a55ZqDNjdk2EsHHk1j8E39AmH33KQ5aZ+xIzu4Nb+fiJLCBS+TB2LwL8lpRvcE1x9VT6v9kClyR3Np8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CYYPR12MB9015.namprd12.prod.outlook.com (2603:10b6:930:c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Wed, 14 May
 2025 14:26:58 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 14:26:58 +0000
Date: Wed, 14 May 2025 16:26:48 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4 sched_ext/for-6.16] sched_ext: Clean up scx_root
 usages
Message-ID: <aCSoKBu0l-vTlScT@gpd3>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
 <aCRjUQJ_97-B0Rpo@gpd3>
 <aCSlvpiraPTKUqOf@mtj.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCSlvpiraPTKUqOf@mtj.duckdns.org>
X-ClientProxiedBy: MI2P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CYYPR12MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 24712268-a4a6-4af1-c03b-08dd92f36242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EZA6qH8a/ZFYUtyiPDNm5w5p7BlwhJw1neXlqO+8BhT6r10B7pYCkOc0GWuX?=
 =?us-ascii?Q?Jpf+oEHwH7mE3meKWit2DsuKcn60e9NKSRb40hwLvMrGFtAVXUJPKxqdPOnU?=
 =?us-ascii?Q?GG7dQ2/N6mMjPufYx8ez1DhKXovAQOXhx99qijAGlgZjXaHBXVVswMKvJtD5?=
 =?us-ascii?Q?xnrhzQp5XbQNFDSmitXwAXlloea1epyGqAu8hR/18S47Mizgv2FgSGuAbxms?=
 =?us-ascii?Q?yTBTiMTFVv9el0QdUN6VXShkcnze4wYMdpWf3GcmHFfFA3dn63QwBduPSDJy?=
 =?us-ascii?Q?b4GxRjZwk/PPQQYxP8rhlpXhEXsoaStkeqz5tITIgjs0DxfSs8n9/nRGz58F?=
 =?us-ascii?Q?oKlz7u46tvCaDtYCblMZfS/9hghx2JD/6YMlFRVpdsgvePUVTfjYAk98zbh2?=
 =?us-ascii?Q?j4qIpoLB03o1tfFZxR7WgpmVKKXCRaP3dj9XoaBhCI35rkj1lmtWw/l7BMKW?=
 =?us-ascii?Q?3RugfVv55qsrXdo9KcsrVwfOWqhGHc7efZhqHfE24Asxk5dodCGCZuPWEsp4?=
 =?us-ascii?Q?I4bfoQ3JhIXt0iwnis/nNxIyJIkxqd0HS8sWzItxnKXsvJDZtYHNY2758XXt?=
 =?us-ascii?Q?Nj/mwLQfoC65gb4yvY9LpMivTMCy/IOJxdVkoSSnefDPXAkHoLPwAlchvp2e?=
 =?us-ascii?Q?GaR7QG86e3QYRMsLic+YXP2hN4x5RPhgr3SwLTNKhwBNKUi+ESTpiAdLu+bz?=
 =?us-ascii?Q?nyJLLdzs6eJ2Aj5nVxFzSF7Y2ZiDESXsRS7aco0MIWsuV1F2DJRCDEg6D7D9?=
 =?us-ascii?Q?uAeEBk5PSy6WlxFYTwk8mRLKzlrWLvN+W5MyTvwM4OKlPrbU1TRJF4USTtXD?=
 =?us-ascii?Q?mDF9fRMaicYljMLCeOs8IUDrn3Mc45oSl/ef8JKSKpOl9ofk8rpz+mGupVCD?=
 =?us-ascii?Q?FydmuXjG7uJrJI/zbqhsYD9sMRKsqo5Exd7K9KrEFEy+2em9Os/EVp3GI7rU?=
 =?us-ascii?Q?bVUhpiJqBItzDOO4O1a+YRk76g6n/8cM1o6vDWlhJT9xocmBhMpJyXHmMp9n?=
 =?us-ascii?Q?MnArxXyLqBe6wxlCyZnhVzKGJwQ171O35FfOile0ZLJm4a6zGwsYoxldXEd/?=
 =?us-ascii?Q?uqSwe+eLoiHD2G3FNYu97uoFx36xd7jDYtGYIq2+ojGk7p4kdA6iIaJHx/45?=
 =?us-ascii?Q?gJY/zXjcacDh2uMBB8rfo53IOwjtWDjmWCq3ZrrJCymc3X9hSP9mJc9pWa+d?=
 =?us-ascii?Q?JDCHPUtLnV25sxEmrLg6v5aA0LISGTVm8pVKTjGauv1phrTDKTbW+ZZMorrp?=
 =?us-ascii?Q?xnJtArSE4qGHUO9JSfwe+yMRAzh7D0qZCVQfDNXSjQib+hU0S3v7w767V6sn?=
 =?us-ascii?Q?+nOw5or4HuE3bPsN3Li2QFnGzSiDlyER0K/Vl86HK5eTzPhkJg8g939Mm7vD?=
 =?us-ascii?Q?VWZLy/UgNf8ZmvErIjqSVGTt5hLl+pbqPB3GKlJXWSBtbG2QzA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aDzFOOsJHlO0D6A0+f2vqrmfCh9/cmoWVWy6ei8Zj6A/SabWINFlOkHZvtQc?=
 =?us-ascii?Q?tPd1iTbVDGNOKA+/NOC6UkGOUNUB/G+6uEyS9U9s5f6UKieYl9m6a8BrwQev?=
 =?us-ascii?Q?AlZJhxWLly5GhZJpwj1eVrYt0tBlfDqrHyGNQnr/6jlmF3qePcIq8qGyv+vX?=
 =?us-ascii?Q?lqfSxVdR57yG9LM3jOCwv3QdRLi9YK84x7suzke4IF4LZAoc9jYGibKiPsqJ?=
 =?us-ascii?Q?lkL8sso7YD28OhrbjWFul4wWbZCgY8WvERn4o6pPyd4fg/ljJF4aX+bo0M3D?=
 =?us-ascii?Q?GkPYyqoJDXRwmK4hvm7CGTnq++AjMa6yo/4zMTNTy6BWS6tfoo9z7zi5DdhN?=
 =?us-ascii?Q?fqbyvI/AayKPddC7XLzqzuin9b/KCxbN+CFwIB5AjT3fAvU+N4HzBnFhcFTx?=
 =?us-ascii?Q?J76S7yd7MXm40T7ReFsRsdcA0s/ucAy1YK2aLbbpOtwGK9sN1VxTivh0HoJj?=
 =?us-ascii?Q?ooSLrdc+g3YSfjOVL1buYKl3OH/pLj5PRdMmBkryzoEP2Svi7TmLNEiv4bSu?=
 =?us-ascii?Q?xD2fptZi/kUDsGgoQ6Xzp5GBo3PY5Ptss/BBhLl2raljF0HtQVELmHv/xcUI?=
 =?us-ascii?Q?Z8X2c+pzsKNpqMOEov6Xb5uPJX3jxbbxsfkXeMI8JeJKAyYhJx54dopJRfIA?=
 =?us-ascii?Q?IZ2jRXsApcJdnMMNF380ejeN+8jqzCKnHtOHetnP9aCxL48WGyxT0y7MTIOL?=
 =?us-ascii?Q?a2zSWTC4jzh2j7pdNmv5kTTWr5D/t06pnLRp0Xqh9cta0B9K4WyxfLONw3Yl?=
 =?us-ascii?Q?HmIEpmx4LngasGCMSiAQEKjAN9cgOUx9DP5zYnauBJTE5++yraRrmL2hasiT?=
 =?us-ascii?Q?EDcCf+P/T0D3MMm1PUvdqp7dlE6smzTT7Ayv1toknFv7Y6fbQ0NqnIyTq824?=
 =?us-ascii?Q?2E2QciAyt4JUb76nRkrfCGsgK4FOr0rpj+pFQipQalSmcv4bNad8u5nJQCJe?=
 =?us-ascii?Q?vJFg2gkMXZdGq1uQ4OvdlxPmuEpbjwGR4yO4IJmYlSbn+Jl4JiuyruyRyv3F?=
 =?us-ascii?Q?pySRePjF7pMOt3HUsXba9ez2Yj4n5RJQ4aXjn80CawDyujIChXZBJR12Hvfh?=
 =?us-ascii?Q?EsV7ibB7sSIPagANzkruTGuMZYGUPVC5Kc4ogwcwkggwX+uQpjHeBZ2HltNj?=
 =?us-ascii?Q?ACpBEjeaKpLAUWyZzk9IwBEEvIKXklPSmC7yUguFUYom89k2qHecH9SAL7Wq?=
 =?us-ascii?Q?yYsg6NUypP7MW/aTCJO9A9uPn7SV7zWMtEgysYnWztCpLPqvQAz2K+G3WHGx?=
 =?us-ascii?Q?7qe51HCRPDJhPr/mmFTxHpFpdWsYqbBcL9AlRRq2XbQ2KIw9eocFvRA+7zwc?=
 =?us-ascii?Q?QUATbGwljyaPg0P37hPZ/zh3ExJvNm1prK+wCM/0aca0H905mOThS2m6b5tP?=
 =?us-ascii?Q?qzh5NQkJ9AEhtmuI4lKrZoa0Je4R+5heiH1JdNl8yKdv4IezKTwLk345W3Hb?=
 =?us-ascii?Q?6n6fT1IEk7yxThrfbesURhRXUx9DhbhL6YDks5UYNYsQmDhnJbGh1HVyWD7q?=
 =?us-ascii?Q?2sW/TPtZxU2EwSk+5WvDTR6b7lxddDsVyeDekzCSc16Iewn819mWbneo0DRK?=
 =?us-ascii?Q?uqiveanV6IoYlqYIQpHyD/wDVn5HoCz9z4YitFRn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24712268-a4a6-4af1-c03b-08dd92f36242
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 14:26:58.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yk7eokMrC6ovdMN6KFfzIC4omUvF+YbOZ0bX7iR+8496Si4e6fdi6JiOeWV7Jrpp1MAkeRTeqEYoEhSTmH1JVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9015

On Wed, May 14, 2025 at 10:16:30AM -0400, Tejun Heo wrote:
> Hello, Andrea.
> 
> On Wed, May 14, 2025 at 11:33:05AM +0200, Andrea Righi wrote:
> ...
> > >  static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags)
> > >  {
> > > +	struct scx_sched *sch = scx_root;
> > 
> > Do we need to use rcu_dereference(scx_root) here, as well as in all the
> > occurrences above where scx_root is dereferenced?
> 
> So, if a task knows that it's attached to a scheduler instance, it knows
> that the scheduler pointer can be dereferenced safely. In case of the root
> scheduler, as long as any task is on SCX, naked derferences of scx_root are
> safe. Also, if there are multiple scheduler instances, we wouldn't want to
> use the root scheduler but rather the scheudler that's serving this task.
> 
> So, currently, the code base is in a transitional state and I'm using naked
> scx_root dereferences basically as markers for necessary future
> substitutions. All naked references should be safe but they aren't great in
> that they'd trigger e.g. sparse warnings and generally don't look right.
> I'll add a comment on top of scx_root to clarify what's going on.

Makes sense, thanks for clarifying this. With a comment on top scx_root:

Reviewed-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea
