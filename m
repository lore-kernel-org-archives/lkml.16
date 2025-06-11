Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EE0184E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654219; cv=fail; b=u06494/Ed5ogGc4fw9CcFEhW1/rOhCgchxnPXHWlDKBP19qXypbVO+ypC7KGTbPEAQyYrJgFNV1tg4GutRxSW35glfznVBgMKjkZDaInllVQF1LnwMFip4PVJaE5hW3CqkvTIMyUOIG7aNDPWRsy9ZefJpHsIeSfQYH5A9dNNh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654219; c=relaxed/simple;
	bh=DbqQ6WiaKOrUyN4Yy1IFERr7RSa12JA1ekTpGy6DAWA=;
	h=References:From:To:CC:Subject:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=XqymZM2zY1g6nG7oRXeUKKBag8+mVEPbui5arr93uI2oTWN9JDFvFPrK9wDs9rgsx9BRwB7W9ELlsQKZw98aQiiK8ECq3uVogc4JyL9AHIx6WHytI7r2MVvc5MRHb1b+t50wVERKbnVFbvQPgQuc/NmOPi9vKUGkOUq9ueG8N5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SCqtIp9y; arc=fail smtp.client-ip=40.107.96.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SCqtIp9y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCDl1UPMg6J0gUPDIaA94vWt0vVOfMDMKrJ/k/yaQdoxkRs3mBTAYbwg2JVNiWoOnfW9ujq/cMXihfIRT8MHHRbIGSnGQ4A7iFodqOuPCNgYL9OOnz4459lJ9Cyk/jWyR9v0VgPSVs+lnl3WWiD+kAQnndY654okSsjt9srzbttESDpvENjkq9kOozwW/MughES0GZcN0ubkNzOMYkS9JjcCM9OTinKmcnzE9qYgbxRMygwibF9OAufik4EMw+Wtq/xBqE5Ktt+hxHeNp6dR25LNwCuB50JWV/cYxePWrxi4kaiysTuu6rY4p65ZQBInLm6NQgitdbcek5Qdv0vOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHmCaVGCoq571e8f3CM8vxtHhX1KZ7D9sJR9AQsUS1o=;
 b=nOQ6FsQikJSygt5rAWURsvCf5Bdv0ZrYEELrv72YkC3NMaBQLAHWnCha9S3mfgkrjF9xbzkKdC6HVLh63FWa0gTn61aFtikak1rKWSuRvtpek+h4fH2HPh1/RJyWMkP+mNmHIkSPLXbw8DY1yeWA6jyUV8ThiKrNoR8cYogcj+Sc7ngPg1Chff7+Sj4ooerhxKhc819Afs0ADJkGMyr/usvd5u4NpVyPLRWuneCwA+HPkAdJaRPNi2OYAusVDCryxeHa2GKkf4MYM8U32uBxAuY1ckYl+Hr0G6iHmVUAOr4nkx9vmvQ25zlxRCREzdPC8O0HDQSLBt7/qBG+QMY3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHmCaVGCoq571e8f3CM8vxtHhX1KZ7D9sJR9AQsUS1o=;
 b=SCqtIp9yrGLWVvM39Ivt+54/e+ZWg8TZfkhy3QRnqXZU190QoT0GLBnaDU0EN35s1Hkdo9jm4taS00ui9jQtUBM+8QAp19JDdzPUK5VitEq3MXjC2c7hf8G4XDGr3I9me2pOFuZQQk6l3txMbsrU/SB10MynxpXBgZTTOYGUyGCnkodGA7nnOIAtPvwKtd5UF1JLuq2DBdJtNAxpjtOKNR2sgNjXDeSY9mpiw26QGKEMNwu8Dnr5LRlhMLOwLGZ32J370mXFSA43htFElRS06girYztPMd5hr/mQXzv6Ptin55fwbTLvbokr9uLIJc5pPtgzXWUMpte+f4Dn/hkgLA==
Received: from BY3PR10CA0009.namprd10.prod.outlook.com (2603:10b6:a03:255::14)
 by IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Wed, 11 Jun
 2025 15:03:32 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::5a) by BY3PR10CA0009.outlook.office365.com
 (2603:10b6:a03:255::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 15:03:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 15:03:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 08:03:18 -0700
Received: from fedora (10.126.230.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 08:03:13 -0700
References: <20250610163133.217957-1-petrm@nvidia.com>
 <4dfdbc14dd374772e6230d88b95d9c5392b1112d.camel@perches.com>
User-agent: mu4e 1.8.14; emacs 29.4
From: Petr Machata <petrm@nvidia.com>
To: Joe Perches <joe@perches.com>
CC: Petr Machata <petrm@nvidia.com>, Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	<lukas.bulwahn@gmail.com>, <linux-kernel@vger.kernel.org>, Andy Roulin
	<aroulin@nvidia.com>
Subject: Re: [PATCH v2] checkpatch: Tolerate upstream commit references
Date: Wed, 11 Jun 2025 14:08:57 +0200
In-Reply-To: <4dfdbc14dd374772e6230d88b95d9c5392b1112d.camel@perches.com>
Message-ID: <87sek6iamq.fsf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0a56af-2ae3-4b6f-2e5f-08dda8f921ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S3p3rqqm28BCDAkgVRUQ47Uh+tAXSyzfSNG0PVt9I8NaFdDCYLY7+XfDRa6m?=
 =?us-ascii?Q?hduKY5DQf6YpJdxQ1BnMaJTDb5IUh3e+tmRF40yig7zYFUie2dczY65gqJwv?=
 =?us-ascii?Q?hd+szz1vpk12jpP3XoCGjfZ0YdMGxi1vLErROKpMaAvvOujTF97XlFkERI6L?=
 =?us-ascii?Q?wkr2lbVnRYoWkDi3xSuxA+rTYiikkO+UxbQCbo3y7MxlknCAtpUSPV49ojqj?=
 =?us-ascii?Q?atnbfTRs+lGIAA26kmX5iWeASePfax/yuWz3VAW2Gk2p5rLMclJ9nX7elj/+?=
 =?us-ascii?Q?vXdWkeYpu+pBKL8K6H6c7RwmKPKcvcK2zZ7WEhXBUkJ3LBJm4IBF+TisovSY?=
 =?us-ascii?Q?imAToBxsiNxveiRwXbBX4Sp+1Q1e+oYE1sEMdC3ykdgH1pTuA6aQsLLxXOwZ?=
 =?us-ascii?Q?fYd1Fi/xVPWS6EAaRWBi1wVDT3PAHnKkbaVKwbYTKK+oBBN0SDesQkd+ZChr?=
 =?us-ascii?Q?ENE0X5+GiHYZEcjjA9ynz0Mx2p6J8zLZWmMRbS8eaV6qPcWEfCwYkJNYfD7B?=
 =?us-ascii?Q?efJ0vHw0kEhaEBrJKsGOvTds/srFOW6Z5Dvc+330EZug6OLUAJJf7rvyBaSo?=
 =?us-ascii?Q?yZ3FaVPSRJBNVOe9sXu+HUTGZtC/rR6+rxJFj7JJBsXFNgDYNNda4M58PuXa?=
 =?us-ascii?Q?oBN0SoHKAVRrJ5JPpJxPvOw1gqfqLKz8r2u5JPQ9NoVAqjaaMBbVfCzi98OM?=
 =?us-ascii?Q?XzJRBDp+Qc4DCV4BKPr1Ot7at38wB4iAYfw9ED6ND6htO99PV1KzoFJyUSOo?=
 =?us-ascii?Q?cAYPwerZVCyop2jiE1s5iF6xUWNkbyrYYhNTFANvblng69vsYQuTE8IAUtyw?=
 =?us-ascii?Q?vGcABNOwxOC9kp45aE+0wudYT8O+DKxvi+3CLtgJl+EqMg0j3IMNnmgKcP5d?=
 =?us-ascii?Q?DbB1VEUr0RwFAx7SxFSfi9ovtOz+e7LgMKq185jDT4N9Opdjtsj4wgFLVPAx?=
 =?us-ascii?Q?/sysQv54goG+XITkou/2MbpCKMoqH9jNfRrHXjjLfe8sU0qDCebXpGpddIWz?=
 =?us-ascii?Q?RrS9iYlstHDh3Mz7xyPYyt7upxS+9G2/TaIbPbyTWpQ89B1xJysVvPQQ3rJq?=
 =?us-ascii?Q?395voXMM/Us/eTmjUzUWVa6ZS82kt0ghCh050GVSViQRjPrYwSkOm06rGkeQ?=
 =?us-ascii?Q?2vGul8B2YqmtJYgyjAZCy00VZ0/wL66BGGh7BvwtdzZ199YV+Y7bsBqMK5xo?=
 =?us-ascii?Q?drgus20nWDzgTvK2Z7iCFUfk550/QpUGCCxGd6UW2yDM9ML6xNeOIo76FRnc?=
 =?us-ascii?Q?MjmOcu501rbBhz71VRtzkULXYe93LhHCmP0yNXNn0cl8MIO4Y1MSmzdlyVcn?=
 =?us-ascii?Q?8JFcWujaBVPCrwu7+S8XUmcqRKc5uN/D+KeVQu+m50ieibDOHhGSXG4oVNfN?=
 =?us-ascii?Q?tZIo1u9ajYotmi90dt6G7NIwZZzxArbsIn3331hxTEEIcYOXVcDhsJRsgzWO?=
 =?us-ascii?Q?yjdA7HfJAPinFityltSgx/UW8JBeo5v8V4lLqKde4RuqIFYfK5fjbSl5OhIF?=
 =?us-ascii?Q?hYcN6PphOCbyLYifMgJDbV3QjTM4mzpwdjP6?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 15:03:32.1579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0a56af-2ae3-4b6f-2e5f-08dda8f921ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305


Joe Perches <joe@perches.com> writes:

> On Tue, 2025-06-10 at 18:31 +0200, Petr Machata wrote:
>> Two forms of upstream commit references are used (and documented) for
>> stable kernels:
>> 
>> - [ Upstream commit <sha1> ]
>> - commit <sha1> upstream.
>
> Is the sha1 never abbreviated?

I mean, as per the spec it isn't. I want to make sure I don't let false
negatives in, that's the motivation for just going purely by the spec.

>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
>> @@ -3351,6 +3351,8 @@ sub process {
>>  		if ($perl_version_ok &&
>>  		    $in_commit_log && !$commit_log_possible_stack_dump &&
>>  		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
>> +		    $line !~ /^\s*\[ Upstream commit [0-9a-f]{40} ]/ &&
>> +		    $line !~ /^\s*commit [0-9a-f]{40}\s*upstream\./ &&
>
> always 40 chars?
>
>>  		    $line !~ /^This reverts commit [0-9a-f]{7,40}/ &&
>>  		    (($line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
>>  		      ($line =~ /\bcommit\s*$/i && defined($rawlines[$linenr]) && $rawlines[$linenr] =~ /^\s*[0-9a-f]{5,}\b/i)) ||
>
> In stable I see a few like:
>
> commit fef912bf860e upstream.
> commit 98af4d4df889 upstream.

There are a couple hits, but most come from 2018, one from 2021 and one
from 2022. My intuition is to ignore these because of the combination of
how old and how rare they are, but maybe it's better to assume a slip
like this will come up at some point again.

>
> and
>
> [ commit d3bd7413e0ca40b60cf60d4003246d067cafdeda upstream ]
> [ commit 979d63d50c0c0f7bc537bf821e056cc9fe5abd38 upstream ]

Yeah, there's a bunch of these in 2019.

> and some with an upper case Commit
>
> Commit d6951f582cc50ba0ad22ef46b599740966599b14 upstream.

OK, this one seems to be used on occasion. Even see hits from this year.
I think it might make sense to support this as well. Hmm, and then this
in brackets seems to be used a bunch, too.

So maybe I should generalize it a bit and ignore the hash check if
either of these hits?

(\[ )?[Uu]pstream commit [0-9a-f]{12,40}\.?( ])?
(\[ )?[Cc]ommit [0-9a-f]{12,40} upstream\.?( ])?
