Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0ACA6F
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 18:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739125467; cv=fail; b=bBrEWRsPInXsXYQy/KvTzrlf3TqDgUEeRyP8ngbHwkrIM/SPO8T0Thv7VxwIUhzE9RItVvJnvFfpCPdk/szP5t8oPvZeM4o6dog+80fCMtfSxWC6RYfZ7LyzOn1F9k8D8yYb1zVlYuchdtv+ZmJzYzJBp+tDuvnU0VfZ+3D/8cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739125467; c=relaxed/simple;
	bh=g73nKpqDvYUSsc45jSr4LwtjzNR4oEYVlMF24+ZYgJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UkQkbRbPwAW/d0d+B5IdCmkSDoC6HktG7LmFiRpXToTAeUQJjUCvAlec75ikElY658kHZ5QDUV+NNb0mYC7AzwaGsAnhSpgUoZ3Yal+TenQyhEdcKJ0n5TXHfJbz+PqD9f2FLrr5eCkef0iqUyr8cXrbVt4QSzj+qRKxp9HhUB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YkcDifnU; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YkcDifnU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRVqGKkV+tipbW8dzH4CioUTgXAXPPdQbm22h/5IspUhwzqyjSg8Ngt8hR6PdJIOG8JWnlkqMriAokiVCHWuQPL7tuvIgjB3GHDa3i+zbqlaLcmdg40MBJDSmtulwo0npUyhp27ZW2r6R/PsJcKjMikrzy3A3MSsm8pjTGVegE+wuSwGWcdUHxl4NP3wrXNuLA6eStskYNqvDpvC2M3/d3CLOUyheAxHYhAWMmd9ybuVCTMiuGgCOk2F7d/7K0ITSrNr+NDG4pNFt6dEwjBdvxJEHEV5j3kD53KAI2fw5T9zaj/QYhT7VLLLwUJkVQVoLxElmCnlJ1Jyor2rvpa02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0NVzXQWTBHQbL1c/hB0fZP6M9Nb4zZTXeDSjaTCCvQ=;
 b=zGFrEd7UgTjmooI4301FoONqp2N8tiQ+kbzZjoQydxNIOu+Laksm0Vr7a+Qua9WYaFvkxF4GJKlEoEtFTEv46IzaAWWfmep/R1tuW1TEHffwDjgfzwEBhuqZ2v+vNBpgV6EgLqsurgl3jIv4kx3JCiDTkCd3wrEOZAtWjKsw1TYVZyCHG4awewppBZZiKwV6y3HMw4Wkf9IMisjMPfjln05oU0GbX7TgcIoU/pp1lPOcFYpbKxieY5yGyL/NvudtXrrJ0g/RTM+FmKZbGwNQSOkU9q6k1MAZEHTLtv/jCxoaZY09Uk3ViA7/ekCshOdcbJ7Kl82m0CGCvtyIp9XCqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0NVzXQWTBHQbL1c/hB0fZP6M9Nb4zZTXeDSjaTCCvQ=;
 b=YkcDifnUOnYuhsxc6K4DKr2pRNVE3ipZQxFjgjytH4athF4ZcttP62gLu+oXX5jyTK8vn6GGV+WBIHMoMdZMiHnGIZRoj1XDbWuzkdMVwA1Leh4l36kubZGlKSwbFxJBi+7g3iqbm16ghi0h7YlKP7slqEdOUsPAqy+fnsxmMla1mHASAVbBdVCPscJHQzlFisNhkAgiwVkOHqOmZD5VKtD4p4OeBH4rpczBpSXawog9Wj0iWsso3DfgbTxg0KoPe9vY9mlftpP2lqB7wxt2Hae3SzvMBEZ/vhj63JVVCX3l1OCf7wZCsotjdjBqwONSCcY31QG2LT7heDz7irpjWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Sun, 9 Feb
 2025 18:24:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 18:24:23 +0000
Date: Sun, 9 Feb 2025 14:24:22 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Jan Kara <jack@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/1] mm: Remove the access_ok() call from
 gup_fast_fallback().
Message-ID: <20250209182422.GK3660748@nvidia.com>
References: <20250209174711.60889-1-david.laight.linux@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209174711.60889-1-david.laight.linux@gmail.com>
X-ClientProxiedBy: BN9PR03CA0460.namprd03.prod.outlook.com
 (2603:10b6:408:139::15) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b51df9-a5b0-454c-7863-08dd4936fa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+rQaU2jXh+f4XroQ8bP+SCu6ZV6RCgRV3SycCYZ0IFXnR48PQR3ieTNOincx?=
 =?us-ascii?Q?m3I0FkX5U42QLk6j65RjnVuXLs61n+OrR2mR0bCeK4vNFc8g4RBQC/ts2t1b?=
 =?us-ascii?Q?U8U49JOSMa2V07DDcHgSxobYQgBKxJS4vsJAbgbyibIQ+YOomg/dO4+q3tJy?=
 =?us-ascii?Q?ATGWiLR0W0eykfnIQkduWLDylgv4g39gN53UGRS3GVn4T9Xrs6m6jQgQnNq/?=
 =?us-ascii?Q?9gWAbXydIbSyfqQCr2l6bypU5MzInobJwSfy8iza3sa4A3KWrv5IpjacayFH?=
 =?us-ascii?Q?pG71BYtPMwcdNKd1/W+MEDoHXk03FQu/d2+PFzxLH+DkewG/sPw4LQ5OR0hP?=
 =?us-ascii?Q?cvYpBlBmJOccYfcxaq8UtQ+C5oFJsBEPdQkilsrBjHO+shXxpsj8ld4Vpr27?=
 =?us-ascii?Q?KzqFhhfPeGsXZX1vBT8vvTA1Q5+BDUAn6/eU31mn7DRHM9VO7HRLrmQANB8j?=
 =?us-ascii?Q?nvbhm32cnv0oPKrMm+cNbcREKRP2O4X0DRGKWs8mWu3HZBXMyPhTaVt1VDHM?=
 =?us-ascii?Q?5Afj6HZ/thC5tVl7V3lFI1Iz9tVVywl7odvCpKaJdYUBeuLc2M1Ez/TbNOOO?=
 =?us-ascii?Q?vT6UIDG8XRFGCRDS7uk7aO+AHhiXEfcTvNnNNvNVV8hFxJ9+/OklhqzCwRVu?=
 =?us-ascii?Q?Br9G1HOfsehHyf4ZTV4ygMo/Mz5kROv2SUPSNDxw04q8Q2bpzP1D7a0Z7ULV?=
 =?us-ascii?Q?RETExAYtDZ1y7IRB/FmmyuUCbz3/i9KaP9oT6wsdEqlDsY0EOBwFTta1dU7E?=
 =?us-ascii?Q?T1ylzQyjJda+FiTLorMaXt4kUD8mrQuA/DOr9GCnd7VhtPHRkFM4znbUYTYW?=
 =?us-ascii?Q?Zx9Bdv9eauaXIZ1rYkndwJFMduc+IREnQDYo8C4ThxSK0oP4oKqlRWuNMjrq?=
 =?us-ascii?Q?jdJF9IcJkK4bJn7lV7xEE2Qbrm+yzkJLpWJ0x0VxnuhVuK4tLbvwgyoKJHSg?=
 =?us-ascii?Q?17OuI8P8FNHzQ0FSfQgjgbq1ojVIoo4Dbw58h1X3oQgLntG60RuiTImMHYwN?=
 =?us-ascii?Q?shNdwO5Wfnc3kMvWm1tCDiQ7NAStDTg77Mw4pvLPyHGO8aQZkLNct2rKFiQv?=
 =?us-ascii?Q?dUVFVU+f/Y4FSTOq8oenAeDqADnaxquEnvZpL4VRIEgpQ4amvXvAa/aIoAko?=
 =?us-ascii?Q?QnTvch8r6lEwAfqLmuwnOSAJdwxn6PY1mQX63P7AZSPDnw8+NT2E+FL6eIZt?=
 =?us-ascii?Q?fuM7nPegcLb0rkLBUscF+S9s/j+XQ9WepfIaV02nGRcF6kBEVHAOjNIoIypx?=
 =?us-ascii?Q?ODXaY8fWqrB4oKXDUBHLZTRGwcHhPTfqYMITE5K1J0wJT3PY6iJ1DS3Bk0jY?=
 =?us-ascii?Q?uS78eX62yJfYuyA+Y4bT2qaQaqOd8jX+gS3JPtez35K44kE1RC4ccHjiFBqY?=
 =?us-ascii?Q?8eczyaw4kUyQdNWEutHbWpW/pDl1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5grQUdbU5GB8g4k2Sv2IbKzxafl3OkMLQbigQQ5QvPvlR2Y4B/Xn0ev2JOR+?=
 =?us-ascii?Q?tbJydofFCSxGE7XgFLQiTMIpdG1qXzbI9Yw6IEKtCXQrAj31Vkuau20gDbMO?=
 =?us-ascii?Q?/jE+hqdGwzoiCHlElCn4qs/wTJ/9YdATZbKbnu2igrNm42MNDsNOVEnpYiNU?=
 =?us-ascii?Q?Bzpc64nM/5hi7Dgyhk+FJCIq/Z/MrTk7f+xiHl8QMoCFMTAUgT4o79ozCzbA?=
 =?us-ascii?Q?XviZn3WtZ5SwgGTPS3NzhDX0ksV4jJasejYnhdmV6xpbr8YnaOcdweGW9NKD?=
 =?us-ascii?Q?AQiITS5S/z1D6dcEqOFlmSwr9lKKvCBTWkbQyVhW+VFBe9uP6ffu0zHbkAFi?=
 =?us-ascii?Q?kMoCUev9yh38W6y1Kz48nUDbM4ZqHscl7AKazP0hvsCkSSFbLi86m6iDG4s5?=
 =?us-ascii?Q?W5yLTXGVhxSww+du4y4+LzKCE7XykuehIRSY3/4Cbfis9X18sKq2e6WNDe44?=
 =?us-ascii?Q?1J2A7yeeO2Lk2gPGo92XY3YcKnR8SS3hitQ2D4VElu7U2Q79LY5+G4aCXyKa?=
 =?us-ascii?Q?S92eD5YwDdKVYe4gAKmbvWWbIUpkOzascyMAFjij26Jdr6dEbqRAxFzVDBqJ?=
 =?us-ascii?Q?LygawoGw5be1OGP6o1wYqWTI7kiJJcBlE0nJe2+4RJX7bcmeptg1QX3Tj6Ef?=
 =?us-ascii?Q?hZKfV3MVuTDB/EfZeUGYBWaVioi3t3Sue3B0VNUQvupGkZK0IB/llj3Nb7Xh?=
 =?us-ascii?Q?6x9l2+YToLLryAFRQ28ELIuunwfadRVtUO2nqzYggxxzpYC/ij9oXtUPFh6l?=
 =?us-ascii?Q?YIPJZAVyu7NetIQpYn/9RbjIFBuVKZp/LQdmwUcyB4kFOwlffAflOe1vq2Oh?=
 =?us-ascii?Q?FBHJ9tP/+efFMofkROwDVlH52d+cXdhAlZuC1hu0bj4LEVd33cj4o6otR/P6?=
 =?us-ascii?Q?tc7DnzwpXkB/+GsMn2EHfMfw+SdlCrtVQD8SIIcBV1v6r9fxDB42OCia+8Y4?=
 =?us-ascii?Q?UAq6bWZb42YLSCk0rmszSD3/TtuZjw3UpJWCC9UV8pel4HLQLn0zsHqkAoeq?=
 =?us-ascii?Q?tkg0Bc7Iy8EDvhyagbiX/AEDtAtJvPy1DNUgDxaDYkWFV11ssxJLZXioBmry?=
 =?us-ascii?Q?P/iU6sbBeswTkgj+Vs+H6c2cDEBpCmuf6AvNf4B/ZU2PzO70fREP9RIY4e48?=
 =?us-ascii?Q?1r5Aw0LutofcueFoe07pRRDu4Wjm3sf6qLPJkJPP8FZx7tq08LkrPjrAl1GC?=
 =?us-ascii?Q?QSxIBxBh0366JYVIbLTHY30vzIFDDuKbsT4nC0JFUZmbAzDTofQquEWqujhf?=
 =?us-ascii?Q?oWBFuGZo5b8A937l8c1dJqeKor2YcUBoOnZdcG557xpUfRJQaHbZnqQJI5v3?=
 =?us-ascii?Q?f+OJD2zZLVk298wxqJCYqvEnMPp/b9L3Vk01TssmuNMLiawJrvBtsg9K5wBt?=
 =?us-ascii?Q?DQrTSiNRwENPdZ7KFv49SiEJmKcdDesHExjdysSqYeNv5tWdyya8nvKeJ63x?=
 =?us-ascii?Q?thf4BT9ogTQp1WNhlbw77z5n0wxHz/BBKXdnfhK4ZEdv/DFxP/TpIXjU/pv7?=
 =?us-ascii?Q?X2+zS9sYNXf5S77nfmDkNnaTsqteYSE7Sbzh2Kq0XwlHAh4C6OttyXvYQsto?=
 =?us-ascii?Q?PtZECsoukTjD7rN9puE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b51df9-a5b0-454c-7863-08dd4936fa63
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 18:24:23.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uELYNENpLyVxI7DkP44+UUXvV6x+laK4WYWlKMXMVdU1VEIAeEw8WFxakn8ylURf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9422

On Sun, Feb 09, 2025 at 05:47:11PM +0000, David Laight wrote:
> Historiaclly the code relied on access_ok() to validate the address range.
> Commit 26f4c328079d7 added an explicit wrap check before access_ok().
> Commit c28b1fc70390d then changed the wrap test to use check_add_overflow().
> Commit 6014bc27561f2 relaxed the checks in x86-64's access_ok() and added
>   an explicit check for TASK_SIZE here to make up for it.
> That left a pointless access_ok() call with its associated 'lfence' that
>   can never actually fail.
> So just delete the test.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>  mm/gup.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

I often wonder about about access_ok() calls, if they still do
anything..

Jason
