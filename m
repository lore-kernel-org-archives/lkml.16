Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC4381A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521004; cv=fail; b=A3tLVkuPSzKz14/nN14sWspp97/54/tD7SLaNwGrZLk9xEudRi1aX7t4nMB2UkZ9cnmEamvWJ9gP2Sd7dHBifbQo0JXNFJdKmKfv/D/El5gv0XwDW6gaTg1CLb2FHFEka677SF1xi+qU+a3SJEZkhAVzG2NsywxnEmgW51XdkvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521004; c=relaxed/simple;
	bh=LI4UzN5XLWKtRXyKNULT3mCjw6cnDUV8NhAX25ewj7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kmlG6HGZ9k4a6wv5SChhcvQyQWo/rE2a4GEq2jd0cREdm9TxWX4zkpbJTSJ3DJasSPCMjTBE2PtmUDpJDUE+pWWCD7BfdZBnyW5QwSIlCuQ9W6Zn+YAGNz7lvB6euMLciOvEJsuL9hHY5lSppLEP0sJ7C4BuX6QsqKgrfEMTu1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lJ045K5+; arc=fail smtp.client-ip=40.107.236.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lJ045K5+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exBm+OtUQhUiqmgkOPdER3UV98CrlTWHktnBdHjzm6J1OakYai4dHdl0Li/MFmNgb6wGNH0FbKdiowcG4MA6PJeYtlyATPdyhTqIMdFmEw2iSLFANfCMVJmCWgWCRefb1hRNStxxfD69mOhhqx6Uy4MrVgGeC94+Fo3g7xsZ0DDTlWTNnaGodsMzJU1MmPHcTnBTmIkW6tCbrrwxkaOF0viw16hkxleDB3GGYKODmoneuEyZyI4Ia7Ge3RwOzhzS+BNFmpfZX2ETsUNsGVZreMrAE3CMmQJRKc7pw1xBb+ChY173h2EmUL+AiEW1vhgZQ1gRnNVzaG+e9YJmKhtbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tQv6Dsz9xUo0tc7fh3/osIYlZyRXnC4iDEB98mPEs8=;
 b=YLM7+QPQwIQ7KrFV3mxIE8PX38kGJjk8TcuDhe4Q2D0dXV1G+mo2Omwybq+eZ9Ag9A2FLbwUvkPoSWt4h8jO1Bh4b27iYtARX7lkL/AzsEDswvODBd1q5IFMzI3PtFB5LwlAIUa2uOTM2gYONo1Jdh26CtV3v4fwIZNxGdKFL64Q1GgPnvetZcUpq291NQVmeos/otrdFu9MrVJaHJa+NnT+KG/ecIs0rvNegaIGhvbIKPjooHfg5O/pDYIYdnwkK8nBFyZjJPrNFWqXV8sn9BwSHp7XwN5daaImPgGCwHVf9NpAe6Kqhl5WPD9/zqwyr7jwsIeqxixDDzKaopv+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tQv6Dsz9xUo0tc7fh3/osIYlZyRXnC4iDEB98mPEs8=;
 b=lJ045K5+YWjVmb8CURI9RCsFPLLxJQspBnc/PkSlB8dy3FCuhai06sZy2/zAn8DrbW3O7iS3wA1Qx3C8Va92R+/bRMyTLooy8gGi41Bhc6efAfbgWV4za6Ovs9GEGT8W/2gzRVdhhvIifs+7F4m+o4IfcY6tPtbimMAgUjtkkNzfElIXRSmFzw5yVXpIFp8ullkRtGWS0EAW5XUGvtyTp60mwfczRIfk711SZZaHxpXOiutSkLsK830upjqixmbUm3sLn4onhYMGv/iVatQpimOuFjj9vvhUGRyvmnLzNnPIK4DV5OY2XZ0np3+MKqjEUWmQGWhd+1BDDVQdHQue1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL3PR12MB6450.namprd12.prod.outlook.com (2603:10b6:208:3b9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:23:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 15:23:19 +0000
From: Zi Yan <ziy@nvidia.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, muchun.song@linux.dev
Subject: Re: [PATCH] mm/compaction: Use folio in hugetlb pathway
Date: Tue, 01 Apr 2025 11:23:16 -0400
X-Mailer: MailMate (2.0r6233)
Message-ID: <D2548CA2-938E-4EF5-BE86-B63DEF6D40BC@nvidia.com>
In-Reply-To: <20250401021025.637333-2-vishal.moola@gmail.com>
References: <20250401021025.637333-1-vishal.moola@gmail.com>
 <20250401021025.637333-2-vishal.moola@gmail.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL3PR12MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: cd012632-a188-4b96-9f16-08dd713121e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0cxKy0uSFJI2TA0TJQnmoaQbXst6zHSuMxbkmtTjrNY0F+lnQR1TQLDb6fYK?=
 =?us-ascii?Q?Sx6idJhtnsBfKTJyYOzT6+/o/hWrNAy2dcqfVud/F+cQojIh7Nc7RblcGPKe?=
 =?us-ascii?Q?59BZ8+9bGNgyJWBhLzRIo0saLLGZoUJJdZQrteUyITRq4Mz3s2URNhWp10+C?=
 =?us-ascii?Q?KOImc/7pGxg7BN9lmPgRb+wz/3j/Xl0Bny0Xx11dTKJV0OpRW3BhKvsNML5J?=
 =?us-ascii?Q?slhNer9qhRI8kd1io0qdLCIDCmOaOMJ7EogwTI23ojj/VBcb01erXpoZ9HrE?=
 =?us-ascii?Q?Cc9b9aJAt4ktptPtzlDr9PJhusx4uez++wn56/SYfyB2FnYJthoT2OvlT+r/?=
 =?us-ascii?Q?I4AOnXT2NdcSFnLMPmeClSW+Ipo9Az1FCCkYjEGHtuselU9Acrhpm7EHKBwI?=
 =?us-ascii?Q?64ArFwGBIldO5V/c/6vDOY5ZJwXE9J0JoIjHcwj47QpzWgwdeFHzad9mVeFA?=
 =?us-ascii?Q?svgBQsFU5ag2+NozCOqn+uYHkl7W5qHINEjduYc8FmYS2hcno8brce+ABUdA?=
 =?us-ascii?Q?xwlteXHsfimEauifuB4/hvpT/ixR9nobhHA/KzoJF0DmZ6oqY0rBpm+yoQ39?=
 =?us-ascii?Q?z6miTTovAXPIps4dQCkKdhfDXffuFjZNrABu61dc0QseYKtCC+5zks7nMuZ4?=
 =?us-ascii?Q?b/GQ/jRVGuUnrmaJBReuj0u2PoxcD4ARLYyr+GG3HofLKyXDNd9jZnygxG+v?=
 =?us-ascii?Q?P/3Ld11kGR/uvhNcN1n1MFwFdxai8rgYPFCZmedLNH0cki4eiiCa4W0RVuo6?=
 =?us-ascii?Q?7M6iIssJgNwbFCY/Z9IwlPmRcELy24RW+kGL6j9ofmATMc722ieKX+keNMeD?=
 =?us-ascii?Q?ecgXzbkkp27n1HChn2c/d6OdxHKaT0eCiTSjG1Cns8GSj9xmnL0T2zsgGOm6?=
 =?us-ascii?Q?dCyKDi0ztx+95eV/kAjvxY9lOUYlv7x6IcPypEue1CRJEBJ1NLAjNjM0BpgE?=
 =?us-ascii?Q?CodUbPfK3kp1vHwfP8BYJXR+Htuaroe/3KnaKPkVYL4G979Ma39+cBlyt+5q?=
 =?us-ascii?Q?vb5kUHS8NjvmXJo49LrTjrkaIG8/vqU/GMpxYxsPqSL7XyBnTfo+VclxZiul?=
 =?us-ascii?Q?MBo4gKg/RLl7hkSWVF7eDNRIutyAiuLcKXKtpaLyvMfmcgBKex+HM4mGJ0qa?=
 =?us-ascii?Q?MFbhJ6t73AbqxKQKkMsPL4CIQfI+E5JKz60O1cuJcXqY0quhuYp2H20EW055?=
 =?us-ascii?Q?++ngCEozppIr+Q5u2q0V4U8otsUnsv8wsTZzawIZmoJiM6ZvAhTkG/1TlWlY?=
 =?us-ascii?Q?Ed6u31gr//4vIX1Xbmgs6UBcCjYRmEhTPbVS6+SufQMQKBlAqlKUX1ua5uIQ?=
 =?us-ascii?Q?TWMrlpuOGeWU1NY3VxER6S0MCMJD4AC591xr+WleVrTZS2ZXoGhQkGObLTH+?=
 =?us-ascii?Q?q6KDAujTWT9VrtHiPgN2Ro/gQ5tz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UNsWX3/EIMGK5mX8vtFffxvN8JXruA8FzaKvFP0oTnRoo83npZmpRlUnFtCk?=
 =?us-ascii?Q?c8Gh5L26hrjCVh2bw9SQdZMVmpRqL17gefkqoiLFMjFqjX2NPfmISSiSyoqY?=
 =?us-ascii?Q?nVODHti4wF1iNp+xnwF5yDJNqiitKc8BiFkTKbjVQ2kazILaEishPYltiO62?=
 =?us-ascii?Q?LcZeExZQvreeAnyXIRk5Idz2SkebLtcxgpNVvsMQyHcf90wrklXtGJAFKN/3?=
 =?us-ascii?Q?v/Wy5T5KDJdsB4ftRsT16yuClKBVRch/+lBRLkky58zxQd8rRHgBwTfTtiRz?=
 =?us-ascii?Q?hOdGdTJ0rPbfQLJZmbZ6CPEvB7YL3NPh7sImQavmcodJU+TGw/P07DBmsHP7?=
 =?us-ascii?Q?3suItxlUq0XJqB05Evl1xt+jrIizZLINvaxFxT8t3Drgwf0ddjTNZFGxykPa?=
 =?us-ascii?Q?6INnMCWvxiiSEIKPs23gGyfTXQjbintV7Z8M5dabcbPD57pOzyHVSmvlLrLJ?=
 =?us-ascii?Q?xye8daehioejNR60y/hekiGrjXRNTEbmbTBzaSEdtCgsojMLCr5vZJbzdL1Y?=
 =?us-ascii?Q?50Ty0VZQcybNcc0ClEbQcmk1L56I7KCj4NXp85EgrUZwmlELk9OPSjqBthwh?=
 =?us-ascii?Q?u7rcupAh3cMil8ZXVekDro6bmhdNHqVMeHD9giX/DZmpd9MZCzYsrCB7WftS?=
 =?us-ascii?Q?34e8M48Y+x11Qq9WtRj8kvJNhidUk/UznkvKiQ5cZ5RAbE0Z40RemIJgnYjo?=
 =?us-ascii?Q?dikQxQhCN+aqCPWjwKQeZ3d6ogXpdYhDg16I4iY5+A6LJFj7meNKkW2MyWlv?=
 =?us-ascii?Q?g3hwGZQpUD+0EBOZkmAKmex3Zth4yDdy/C4R19zTBAo4UH1XHAUDMWHQYmLF?=
 =?us-ascii?Q?ubpT/CFgMi6VmtJwHKcKh5JeIfNcFGKpPfjLghKNKrP1eqqMf0aHOMhzByXj?=
 =?us-ascii?Q?JFPHjb8pRp/7qkqa5O/hoD8mtLmMA7KISAj4C2iRBEQTBAntaS5bkxGIvDs3?=
 =?us-ascii?Q?2SlGEkIQ9vIwlaPQdWsZO5UYr+Nt6t4z0rrmfXAa4qXqq7gLy4exHAyg8bP8?=
 =?us-ascii?Q?/NjpXmpX68WB4KC9+o+zVJdPK1ihreHV4DKFA89BI87Zm0ZgFZkQtPbaDV3L?=
 =?us-ascii?Q?pBf8GyD+voOAmfYmJf9k/czo9hBY2j4JgR0Gw0XKpxnsZr1uQL/Z9JvOuSN6?=
 =?us-ascii?Q?x2n++Fxu9iiyonprXEw+8OLD7zJWuBc+rohqvIoqrCOTP54ATVKq7qkhXJq+?=
 =?us-ascii?Q?zfYiftdl/aVYr9k6BN/op3GWIq5yA2/Y0ZtOuWM/na92H33ptt7PmZep3LN8?=
 =?us-ascii?Q?Ro7qGpxWW7M/xQ82DSbxUSnKIkZKbAJdDZMCaeIDPAXme6EAQkQNxFShe4zl?=
 =?us-ascii?Q?mM4BPQ1xOnLboJ6bpnb8qk4Dv8OjIDlYW/iGZshIt2iA+PL5Pepo4V0ND5S1?=
 =?us-ascii?Q?ZAQA1znLGRLQxe1eBn39HFpsKi7KJrz6EZYIC+a+78qpsVQqEhMH/oeHdChj?=
 =?us-ascii?Q?rL1itHsRVgORF1Zo9b4pARJkHB8sEY7iwIA1GQTRVeQvJZ8mMDR49xXF3mHL?=
 =?us-ascii?Q?SQCKbvfTjPMxI61byRzMAHNQvtUrqeQ5ln3E/pLVhcxgoF2fCcuqlXXz+cKz?=
 =?us-ascii?Q?Aem/Zyu9x/H8GfaHeQ/BY3Ib9NTy9bQsfimY36PO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd012632-a188-4b96-9f16-08dd713121e9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:23:19.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoCnSVyHApCsZfvILGvv/aQft+iVlnCWBnCWONTfALlTEvVd75nfV5nDc0J6mmnK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6450

On 31 Mar 2025, at 22:10, Vishal Moola (Oracle) wrote:

> Use a folio in the hugetlb pathway during the compaction migrate-able
> pageblock scan.
>
> This removes a call to compound_head().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  include/linux/hugetlb.h | 4 ++--
>  mm/compaction.c         | 8 ++++----
>  mm/hugetlb.c            | 3 +--
>  3 files changed, 7 insertions(+), 8 deletions(-)
>
LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
