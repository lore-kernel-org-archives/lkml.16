Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2853628B7E4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295028; cv=fail; b=KaEgs/iG8UEkMFZGbPDcGjN+r8YyRiTn3T1zvFQOn8PjLwdZh4FY8ivnR7lMxd2ICtDEKtYXhl9rMFRuOae9TPnkFGYwDCmXm29dIf9clVDUpt7TvzEr5ymbt7yjTAg3xsDDJ1fqgs8oB+vNUxLUcZzu+hTVYFrR3ioMoXgZhKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295028; c=relaxed/simple;
	bh=GqNeDa5mVsL4BFJP7YzS0KyFrBIFegOzoxyHWynAfi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MScUaqctElNWcivb/s0kND/Ww4cjSzJxV0KY8lcBJnng5sJkXA2OWmaZT7BFMEL9jISr+PzP18+Ez1dX9FMjGkkOMDSqGo9lHCEuBKTpy5L/v5+3h8JGmcx5S1lgcQNjHkvW2u7v7hj5Knoihu6Zz5f8rTWE4qPXVQ3VeUeJxxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n+JS81X7; arc=fail smtp.client-ip=40.107.223.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n+JS81X7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KT9zB00XWI4fvwqu+x+EQFvzxTvr9FGkdRH70yW4fag+PK0JM5MrkwCAzx3VamExE0OW6cpjLvllnQDdOa93uxGVe8Tva5tKJ/jVh6SXdjAe6wbtsJXscuIQ8GuGDJX6Km9tLctOFQHTxEK6POZBsTok/lZf2GshbxSx5Q63qJh1BmmhJtBgan+btJenpHGPln13d16DCxeR4vB15pyfoqK/GZOz0kp7gEFC8E8ml9ilUFEa7hDrnslT5UpOp4ajVfyYp7+7WyYiyWLxks73VhGjVCgAOiVSmdoGWax6Bk7Y6MLw7HFKkXzCG5k+Wfj80Q8vvr4rfFgMNh+YPjIX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ1R1oApZuBhFVfxs3bHrcWIQAEC0QlbsQEoc8IAG1E=;
 b=LggFgbqA3u6R+FHkQC/Pu9gxQloS7wpZdzchFON+xXN8HBm+EmXex1HMDgOqY2ORbbbk4MmmpIqrJocETEoyvYULdPqNSpH+FTH0okuCqx8jn7/A/iGg403YPXLFyDGmzFCH5AczlJvbjoWWoYI/FfpJVRkA1b9r8UdxAmifRY6OkitcwGeeHFBNxYIuAcfQ54hhU05NaYgqPrXlajlL7bKDPl5ZwbSr8mpA3546no7foFpqlMQkSVcLx8qesPR56frUznf8KaTuLQatMK6zdmmrFhAjE9xoGSm94aZ49Ro15YWLmZ4ahLmipG6VreZLDLBvLPmeG909+zEKga98JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ1R1oApZuBhFVfxs3bHrcWIQAEC0QlbsQEoc8IAG1E=;
 b=n+JS81X7qc7E18715tTQlHNCWeoM0VoH0Ul/GUuZNpklCeEC4LWPJXaNQIBkVBn4BpRHNoSNAenoqGCKe82DWblKDhDgbhjOF+80xnJ60zRPT2gW1voQJZDLuosKkFj58wz4SIQu4JzKIpnQ5uYSWs9QeXE5Cu1/JD/jMd+SX3B2Gc8cHdwhTGrAhLzfoTB2MTHWSNmfe0yJT/w5MdUt1+H8owU6+D6zJ1KTXls0vpryVqGNjO0nBtGeoEDWWgTaooUx8JMZXSw5buXdjgGTl9O2VJwoUg2TiQ7Jd2n2DByipb4ntPOmvZYW6JCaA0e2PUqDCUoKqdrkMvRQSeaqsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 14:50:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Mon, 30 Jun 2025
 14:50:24 +0000
Date: Mon, 30 Jun 2025 10:50:22 -0400
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
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v5 05/14] sched/deadline: Return EBUSY if dl_bw_cpus is
 zero
Message-ID: <20250630145022.GA2440438@joelnvbox>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
 <20250620203234.3349930-6-joelagnelf@nvidia.com>
 <aFm28aLvL0Lu7LuH@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFm28aLvL0Lu7LuH@slm.duckdns.org>
X-ClientProxiedBy: BLAPR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:208:32a::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: dc527e28-f16f-4415-f3aa-08ddb7e571bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?INmatxAUxgYsFML7ikrUlnup8FxndFV90tQ34opR6D7Mh58j099z7tp29rSy?=
 =?us-ascii?Q?OY6SGKV6RzZ+4Ywy26lgyRDPq0qpCbXcSk4W45RkLQumYQwWEOsarouqHPsT?=
 =?us-ascii?Q?Pqe4ZEKFz68cg8H9ztXoaao+aQdOcCJyt1oiifS7b/QtAXmpt3ViTtaHofZa?=
 =?us-ascii?Q?/MBsELUVk+ueKjTEK9ncBuFe9IiypETIPn41tfjYu7PYbznTiCaM+8CgHWYo?=
 =?us-ascii?Q?OjUrIUfM1K5EFF1Op+AG+o0ddL07FLHgVfYWcUwg8wkYaHf3lSbNWjEJKHpx?=
 =?us-ascii?Q?urO/xNb6SsVxFS2GkGLQfVczsTMY4Z++lptf5Tyil+T6zwJLqBXCs7oxuuJ0?=
 =?us-ascii?Q?CP8xcxEB7JRTE6PEeFCgTDkFitFcW/Mjc9QzCLAdLE7iXB0MaYdd4pVyo1XU?=
 =?us-ascii?Q?r/t5ne/oyq4tLlFprvOjOE0O6b4TMeDDwGPR8X1ZwPh/SYctMkxpCfuYg5Fv?=
 =?us-ascii?Q?vk/tvqxz+thqxieF1Lt/fyUs4J3CA8WZpTQI/CaJxpfaUJoSeltuVM2hmIQP?=
 =?us-ascii?Q?sW7UWMJMyJtRxbMiVyqiBOhVPphrS0l5s0R8VAr+EZTNvOvhIu6JY4Ig65V8?=
 =?us-ascii?Q?p1kieSMfXqhV+7K+q0nJUGRs+7pWFna38nUUbSgtNwbZwgbpUrPt1zZTGoY5?=
 =?us-ascii?Q?rje5gxKooaGt2/Qw3olgpxKHNXVHbUIGVri4vRhCkcCaZyqvdPZepSzhNdj1?=
 =?us-ascii?Q?ztwq0xgCUi1NfuRtnqegYR/iLkxFHJ2qBJoPhbRrBxOB2JAG0pTYgftPZprb?=
 =?us-ascii?Q?a1q3Sbclit8lJEu0U8Y4Yffp3evqWytr8aZEJbytN9hXZalaF5/as6a2Cwev?=
 =?us-ascii?Q?GLJ/ZQcxbd1nxQ54mpKLnjl2+TcxKrZstjOz7R/vU6zLCvEhUBkyqoYQplcU?=
 =?us-ascii?Q?N0guIlnOZ9TVKfBvJEruMQjsVPvr4U+J48tyBCsOM2pgQdmWzFWQGK6iKP/D?=
 =?us-ascii?Q?I9rYrx+74kWzL0Ubk11rOhtQWa0Wx8h0w2e7pJjJfYRzoACn904ELhYfjhcH?=
 =?us-ascii?Q?LKkEV5G10oBI/R5vOLrWV0MXNL1T/R6JQlY0D0ZWzcKIAEU7a59oIRAcG+80?=
 =?us-ascii?Q?PE8bktzi7dAE2VWHrv9AOuaersK0c3yExOMUYKE2GD7E++/oYZQPyyxjQ4Wf?=
 =?us-ascii?Q?y06FAN96Jiwsq8oHl0Z2kLJKIi3pt2OrU/vNokD0Pxfj07QYyiQWU2tXhMsE?=
 =?us-ascii?Q?gxv+rIxcbhNajFiLL2EcalJKBYkQLOlmuZs4ffFAxC0bTRvF9I+5r6S+R/kR?=
 =?us-ascii?Q?csVP90uzzPWnqvGi1rCYzEp2hiT8b0//LiJ3jdJR2Jqk9fjiGakg6fWlF7Oc?=
 =?us-ascii?Q?m1wv2S38sBBwoixq1+Y6U0dBEncp+8272zdIP1Jc8sfHOhTLBWpL6DwcIY8c?=
 =?us-ascii?Q?78PbMfORwD+7dwpGY8fGFWLBBUaz/jV/qcfkoxASJwMNGuPbIs6Rk3Dc179n?=
 =?us-ascii?Q?NemwYjzLys4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1EZuRNoGecmNOZliPtcLut/19jVuyNj88R/gRqPF4Ab893SyTZohpVP2hxyG?=
 =?us-ascii?Q?CNLLw0ofHKnmL+blYh/N/Mv3obcjiPeByOCSajyH+4jvI0WoP0mfYcQW47xK?=
 =?us-ascii?Q?g5xZ0v2ZMeBu4TiXw7cm0rflIaNnMpDiQiX14HtzpvSr3pgltNOYFpcWQvCX?=
 =?us-ascii?Q?PV2eSZbUL5eHExoGcGXGnFh6esxUvg2hKpFQp/3R2bijm6M6YNIPc/nTs/A+?=
 =?us-ascii?Q?OrrZvqD7I603jeAABUyAjx0dqKL6M4zFPyEw2QG53vjBOSVGQQFH7selGjX/?=
 =?us-ascii?Q?CzEkiT0I63Xh0MilvurtyDIH5/iU59F5SyQKldq8YxQ7mmU+ohbAL20pgItX?=
 =?us-ascii?Q?9znh6XYBo/xKFyAwENC3xSvDkYDy9zxd/6L+ykmTOIE2H7oCKKsKvhAv1ZW9?=
 =?us-ascii?Q?Va+HwTlpHoS89zhdw3Pt7mFZhzsokSLObMEy6en4wIFD07/VQWscdgnqKgNI?=
 =?us-ascii?Q?Z7z0gcQ5rNyMbxMDIXhmGImhG245APNlM0I0w8QUahivi/CCwd/ndcsfedHY?=
 =?us-ascii?Q?/gv7t2utclKHXCLWWwSJLZyCsFRcx/C5xCFmnns+3kf8OgMBMR9Y3Cp5aKJa?=
 =?us-ascii?Q?w18JlvuX72fxS7AW0xYkTGQBuJNONJA0m66RFfxvYuzLbtPqGI7Nw4/nQYbY?=
 =?us-ascii?Q?/jEiPYqpLpn5+wr+ZDIuLnGVQpYBvXhBAU83hT7G+BlCsEfQy8IfPI6g5azp?=
 =?us-ascii?Q?Oh/u+eLFhmQ+mNEDLWQjj3zN3Wefklg+c/NEYt3fMbGNuU2vUpkkG5e2ZVQX?=
 =?us-ascii?Q?KCyu1hVqktSTDZfTzOxzWcBhwu+FZWcNB1NmxENQzpPjudKyQ/JZMcUNywCY?=
 =?us-ascii?Q?SXUq+n2ICF/wqhGUoP3NtL1KX+HD/uf4R+1vpwPty0km+Odw8RYtFB/0SeiH?=
 =?us-ascii?Q?WwYInOyXG+9XjpL30B1KWBKaTrWSix/4gEvqTZ29HOQdzB+z8z0vXeoAq/Nm?=
 =?us-ascii?Q?0EIQMyC8Uby/4jTU+BkF/0rtwfHyOzd73K9X4HF7PscBBkS/n4cZsxqdc9rz?=
 =?us-ascii?Q?T6r4gTsOC9v0qIOlu9+6vzcB4Aa0BlUL/rzBJFbwqmW1W7xb38qsX4CCZaEa?=
 =?us-ascii?Q?FocTDA87yFEP0OAR8mjnUJ8x5W5kL0uCxR/IIuVqSQ4g5z4flwL2424ak+LD?=
 =?us-ascii?Q?bc+jLHDFpibztu3mtcTntg5Vm9LKMgJhanWB0HW2ZvxHLEpiOVsRjsIjeEco?=
 =?us-ascii?Q?xD+YmSzRhf+hEz5AsVxCgqF5gw6QNGRP8E6Ux3V55B9UPNAmiRummXBm2zB1?=
 =?us-ascii?Q?H5RzugB0T4aOqj1K/6z1WocSLBAjcjIisqPR/f16a6LeAFc8H6d3QWZuDtU2?=
 =?us-ascii?Q?ILl+HR0K2syvb+/pxHSjMCpzT1SIJOZIhMyKI7g6gSnbs9rMHKV93gxSqHpz?=
 =?us-ascii?Q?1AXyC+cWPx/GLaCgALdDzSG1PM+QhC3NLXWglbsq85cyc0V4aJbofNu6jZqs?=
 =?us-ascii?Q?E61fIX+lDPKaxVrTgke45R8OTtIs92GHtd1mGZuAHckvpdXem+Wd7+GetW8J?=
 =?us-ascii?Q?QTfJTa5TjOLmFFeHdd+gB3B8uwTOlJHQQYEDX1Y/pZTuUYFsc9B8Z2k9kIb0?=
 =?us-ascii?Q?e/6/Lwg5nwyJh8r9vsw3OIfZp3QJ+Jlx2Hr2qmWR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc527e28-f16f-4415-f3aa-08ddb7e571bb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:50:24.1530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkXUDsn40J2JEK6Umq4pBhnMzYy8spmfheN8gwAytUZ+BGpBo4XUUEugw1MBOlQ/BAdz6gZCgblC2GSd7uuIdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418

On Mon, Jun 23, 2025 at 10:20:01AM -1000, Tejun Heo wrote:
> On Fri, Jun 20, 2025 at 04:32:20PM -0400, Joel Fernandes wrote:
> > -	if (__dl_overflow(dl_b, cap, old_bw, new_bw))
> > +	// Hotplugged CPUs coming online do an enqueue but are not a part of any
> > +	// root domain containing cpu_active() CPUs. So in this case, don't mess
> > +	// with accounting and we can retry later.
> > +	if (!cpus || __dl_overflow(dl_b, cap, old_bw, new_bw))
> >  		return -EBUSY;
> 
> Maybe match the comment style in the file?
> 
> Thanks.
> 
> -- 
> tejun

Agreed, will fix. Thanks!

- Joel
