Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D6D2628D;
	Thu, 27 Mar 2025 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743082276; cv=fail; b=EXK8giwfqKpJxwgKndgpVpbgtcgzauC/c6TdWj0eULd/yM1SxMGCeDzbOKIGRWAF2NKnOg5PjnVYYsMUgX/TKgvDpbghxu6AKk6PjtMGh14MwO8MNmOEg0eFdYjXH04UlASOIsXWT4VdJmAztjXFmNCaXSVd2za40PoG+mpmVKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743082276; c=relaxed/simple;
	bh=S/5SQq/xjhzkHH9hfiyRiKpnvfrnQTAW4c+eZ1ETT9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fJK6QLAgwyWm0brE9JIPBAxMfsSfJH+PRdK8EMo8USYS9+5DccwyoMKxRKf0hMsay1V4wyzrI9bJhq9mkhQ52ffejijFdPxZq/LbWD24WYVCJUQTgRsgmfa/7kA0TPotFg3VYiLAi37J7sSxTCBnYUp7srxbzUt9zbPY/JFlyUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m9fqeJPR; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m9fqeJPR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYuewtkl8nDGtQRQlmrJK0nKbqHiTq+5x6Klt83j3J/u+aoLgM5lGxUTimJ6AtU2Nh0lL073qR9XTb0WMq64zJWRsg/VA1dRts7zB+0/HfOdYMvoWCW0/gcRZoAiW+1LdGbyc00hbiQLBDqGCdZZ/FwdsxQsiIxC2s3NjW38w+YMcFzbnQ3rCtZ6UJXo3Opv2oTtoUEhe0dt25sBq8uE2IDTT/5jgskEotEfYu+YkgJJIPSvOvS0ObV8sKLHupaJMspnvqSBw3E8veRlTQQujBi22V7u7acxKqCKPOQocpOzL8LZRrElpymDjKzGjC0zCY7ryZEw8zYi80+qNUy39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/5SQq/xjhzkHH9hfiyRiKpnvfrnQTAW4c+eZ1ETT9w=;
 b=Bz3NUZaU182oworoiY5ml5+PEY0uf+53wNj5nOK2ivV1M1LikMCy9s6ocsm8Xi/7UQbWfmkmwh9RD+jeWDgbbsLX01tb7bRpj2D9c92TM6p+CIWVLMJgJeWyeAEZ1u/9FutXzhEQ0jdK5AxNdZ2h1TO8BaZurqLdRqzPjSlOL/3qQepy6oDJVHCGkIhyaiMER5mNHuPYxFApIcYBQCurbx8AA6Tg3A/a+fUTiQjzcMR26n6swAIqBD2xpi0mJTBjiW6nA5q8YP8zoA1M90dgYgAgTJQg5qp5aRMtkIAhl3Ac3tj0PCq/wbS9hZyFQjhkBYZtPBTADdoeiE6LcgBVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/5SQq/xjhzkHH9hfiyRiKpnvfrnQTAW4c+eZ1ETT9w=;
 b=m9fqeJPRO0C3zXAwd89fRlfHZ/A3hsBODr3Qy9HIV7oevyhrtKXq/VpTvNHpfea23oJg2MVEkuhjjoAzutYX4rAjU3xC1mZ17TwmY4q9j34wSll2itTl5tvMicsMt2KRGvm1lMXtL2ldOxmIleG/LmC4xttFXqNzGu4JpTiQ8+cdFiSu5/eNFcUhe/w2ZjRmEzxGrE2GlucxbG1hifPgmgaHRk4wovXSiAWLh9jOmLqAZFHD8LeJkJ3Tl1jQrV7ceDdJwD1dCZaqHTPYgW/7/xa07sNbowA6q/F6vhp++IqZpe549obv1iC9zWbxtuN1pi/UOa42U2sJNakYVwj8Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB8695.namprd12.prod.outlook.com (2603:10b6:208:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 13:31:12 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.042; Thu, 27 Mar 2025
 13:31:12 +0000
Date: Thu, 27 Mar 2025 10:31:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, rppt@kernel.org,
	mark.rutland@arm.com, pbonzini@redhat.com,
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org,
	robh+dt@kernel.org, robh@kernel.org, saravanak@google.com,
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org,
	tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z+VTHs0lp4TSA9L9@nvidia.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs0y0wqrdsq.fsf@amazon.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0y0wqrdsq.fsf@amazon.de>
X-ClientProxiedBy: BL1PR13CA0309.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: a2db3c6a-5ca7-4235-a489-08dd6d33a3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EqQ6pBvxvwsUCpQYD0zp6OrFYTwneIG2dMdJeVj8yJcXvylyojGVOfWO6Gcq?=
 =?us-ascii?Q?PujtfjK4BwVv80ybVX5HliJ+YMiIp59DC9NkUY/1UPOzd0E9lA01SbLhA/mU?=
 =?us-ascii?Q?+9s5WPdkJGFRpzSLm19O7TXpFQaPuI3ySOU+u5vf0QgGl6eL5ljKEI7cSSrt?=
 =?us-ascii?Q?9pRj8cd99dQn4zwZHgaiHcWLflLL48Km2XWL2rd4ZkX3SSBq/f7MIJRX5Wnw?=
 =?us-ascii?Q?ZJGp11Ggwvtoj0bp3Ywad33jADD+dDa0MC7pGlsJyI2DfMoM43tNp5YwtJGY?=
 =?us-ascii?Q?dqYAiT38xXq2jItGUmhIPTY3T8PlB8N3c7Bf+jWrsyHwqvM4gqPPYUpgLnmi?=
 =?us-ascii?Q?MsTERM715/zk0r3L4LDlu5IFBnW+EwE0hqm2bOv7ODPOc1V2M55bMUwMiYZU?=
 =?us-ascii?Q?7IAfbbVRTYz4O4ugmcmi5UZL9v8BfIeTbrsY89dpYf92x8uLQRJJ4RWu+onR?=
 =?us-ascii?Q?TJCHBl129QnrN54PcNvrDaWqhaRUW8yHzuZ1OFgq55ltzjeAMEn0yYui/49v?=
 =?us-ascii?Q?bi76fpFYB6Fq4CY1H6jaDnLJVkb1nFaWl7c5cW3dlBwUWZzhUpl3O08dH2hC?=
 =?us-ascii?Q?WJG0r5IN8qJ5LN2sJo5OwGRdLATu20xGDCNWDEf1Sw6zBayTEiQg+6VQGwXd?=
 =?us-ascii?Q?Mgt8kPeawWYCu/ENIxosBW2r+Dr+2xmBMLVFhYkuqVWtvYGfqATnlgYHPxy/?=
 =?us-ascii?Q?ThmNHb75O8EuRLSsaGaTekfZrbQsCjeR8IvD0mJdcieiSap2IwlNd5QHjhx2?=
 =?us-ascii?Q?7ZvxF+t7p6Fqf2zIAvp/olcfsU4pi7nh38ha+IEohPleXcoKVyZzpV2VPxCZ?=
 =?us-ascii?Q?f1+s6dGjrAW21zAstNQe2xSAorkfaCV5vuXgs/B5XmHAF06jmHVA+hrOok/m?=
 =?us-ascii?Q?Y1pXnGDoRSkfGzZgJ09G+OH2t2CTZNMgetAeSD7r4TwBDyUYgt0lYI8dLHoP?=
 =?us-ascii?Q?zbgpwfCuNb4FBYUaW5/t2rmjp7IeZU8BXJhJIrqA9YzfWgabONACfVp6xwGd?=
 =?us-ascii?Q?VgQIzfsot/S8OcDA5SzKgLDgMT6C3cIZU6mvhln9IAjD6Pmi3CTN+YRdVMfp?=
 =?us-ascii?Q?xH6Jzc5Yg+6xOKvatjaN0WWUkd/sOhYkWTTqDm5F6juHKkLeF/Nt8weSll3T?=
 =?us-ascii?Q?v9WJ3+nvSlDoKze7PSz946FvrpnWknX9r5e06VGwapqLmuQ1IrkLMSu1BiOL?=
 =?us-ascii?Q?yRRFu6zk//CT49Fp++i+Mu6Ngfh0XoTMK6xtWRwiG6CAyXVvxvqbDv5IV1vi?=
 =?us-ascii?Q?XbSTruIWD2SsQqvXxE/A5usRwFZ+QcpNvAo3vOfyq8KLxjRNlGpOQPa+Ceat?=
 =?us-ascii?Q?0v5Nah0473nMcIWcGJn+POAI38p+Q8MiT96JjiB96lqAkegb1tZRmeII9wGf?=
 =?us-ascii?Q?uwGNN0q+MMiLzpaspkuflV3s58YN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IAySl2/9+iJNtVeRnQI0khuS7jpV8Nctew82mEn77I+FZxlznyrhY3FW9nLj?=
 =?us-ascii?Q?VsZBEM2/aHZvNJIIb5TyZMzVBjr/bsyJAeQR556Ie6OAjKrpx+FYXeQ4eQrB?=
 =?us-ascii?Q?zrhJDOVAacB3RYG2VcLlhM8PR25JFnCSC4mINoAPbCSVp8VjH09+7AEwMl3L?=
 =?us-ascii?Q?14rLpBsxDPoJV+DahguxNxdIP83IyrggJ15bE836Vn5XJLbZL0BSh5dwo0gt?=
 =?us-ascii?Q?DQoRWAC9hs1B5Ynv3oItfo8X9iLvtgwa9B4q2bRxRWjFAEc9Rwz+ORbkYh02?=
 =?us-ascii?Q?Gzlw54YefxcupCX67VgnNcpxh5Zzis1s4kRztwY0vPF/LC+qY6eDRQjdi+oe?=
 =?us-ascii?Q?dLiZ8By6AQO/Jm8ihBMKzVxuiN9XWYdJfZ8620RjbbFO5BbC+RcGbsd0O9E6?=
 =?us-ascii?Q?3XbpGfK9WWgBqUXdlAXRa4MG/GSYITRDwv5nb+rT5kGJrSJCVU0Py16A3074?=
 =?us-ascii?Q?mYj8hrpEdAYf1gOx3cyOxh/GGTnLLFmNOPXfpStjjE6s2vD/1FQwrOiZRmC3?=
 =?us-ascii?Q?zEm0R5vISKIvhXYEiDCzpHYXPX2x0dJEnbV68RuvbdqNoZOJoIgu3ZnFW0F2?=
 =?us-ascii?Q?U6Rw8Jo/q2U3uHoDzuebWA5OjBS2W2Rre11BWbiCXrFcM25mfrP54/fVBGq5?=
 =?us-ascii?Q?H7eFBYr5ACU4E0DEtRqYuyvDPJHwk55qs1uDRYgzRnLIuQ+SUTyIY7p+lar5?=
 =?us-ascii?Q?qlxUbOYtnDyvB5qKvvuMmTXdoDz0sTSRYoWiQ7jw48EpIxPIn+UCpiVi7MnX?=
 =?us-ascii?Q?N6CDUs3lrCUv82xnhvcyu3gQzOZx6hPz7qEOQfJW/euafHI+/ue/Set8NcZx?=
 =?us-ascii?Q?HVYmmb17L8Nvttn6eSzLPeoIQxzZrqoEIi92J58SaUTx0snjNv7R49K3eUq/?=
 =?us-ascii?Q?QXN98rstwNvKuP477R8j3Yd0kdFpRyaGPBpK3UXSRbfFDtan/Ggrs8oIaFJk?=
 =?us-ascii?Q?iqaoqjtCsMYC4Etlhf3NC5MI1OPEKIQeja4StIGOCRHbJMaLDNwSasEq3Gqw?=
 =?us-ascii?Q?FYakNAjzdL2Go3Uxbkg8m94H1gCPxC0DD5roh6tyKIl5+3awys1oXAp21wjq?=
 =?us-ascii?Q?nukbluSwOwU7CQID5dryi/z6ePtNmBvNKyeaQd7Mjpnr0VLs0kKNrxd8GbYM?=
 =?us-ascii?Q?HGPgD0esseLwwZVMRN0kK0trgUssS/MdnZNBKTUxOtMylxv+NJERHHtvRcxY?=
 =?us-ascii?Q?1TWU5Ba9nMF6KRnDcQilm7euxdK3Xqmje0MyV1+4b8rLP2YFrSADOTgiVy7y?=
 =?us-ascii?Q?r780D4ZmGyl/Y0UQHjZRgXy1JbYxLB33RKYQHjgjbYYFeM0JBS2KIf/DampZ?=
 =?us-ascii?Q?IS6YceALqVvfJhNDXiql7pudgFJPLGsjHerXzDGrzbv/3qnmhds1+mJ6VS1x?=
 =?us-ascii?Q?2zSvIJnrR6wxgBXSEdzWWkSu6M+8EWPZTK0Qh0xTAhfy57Dgzp3Pa551uH8s?=
 =?us-ascii?Q?/MQegJ9sugDMgcvH8RaiA4wd6+UDZmb+fRbC/qOV8U+/eqycauBl7Orh1TJI?=
 =?us-ascii?Q?j9BCe0O4gTnXHy9JQ34g7gaqk2tREQg8f8xeAswyWUCrpKDPBfJSYloGpL6P?=
 =?us-ascii?Q?GkY2UU2wBi2cLRL/aOyxz1oqhuzdmUO7FfhfuM6X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2db3c6a-5ca7-4235-a489-08dd6d33a3e4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 13:31:11.9119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKpgEigjXdQV171c4EqRvHccGvjhnuNKBaXhk1whoT1+5vdtyqc25NO5YJFXEa6v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8695

On Thu, Mar 27, 2025 at 10:03:17AM +0000, Pratyush Yadav wrote:

> Of course, with the current linked list structure, this cannot work. But
> I don't see why we need to have it. I think having a page-table like
> structure would be better -- only instead of having PTEs at the lowest
> levels, you have the bitmap.

Yes, but there is a trade off here of what I could write in 30 mins
and what is maximally possible :) The xarray is providing a page table
implementation in a library form.

I think this whole thing can be optimized, especially the
memblock_reserve side, but the idea here is to get started and once we
have some data on what the actual preservation workload is then
someone can optimize this.

Otherwise we are going to be spending months just polishing this one
patch without any actual data on where the performance issues and hot
spots actually are.

Jason
