Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD526146A68;
	Wed,  9 Apr 2025 15:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213042; cv=fail; b=k+hiP2+Nhb7YVe9yPjjmXk0DcoUy1kt5LJyxW5zKZ0bSFLKyBdzYsZuh0HCxr3pwT/Cf/4OHA3sWIliiXTF8ePPJWriSdMAEapc3NG+mJ/71OzJnnZ9r0Ua7/SFZ1v0T8fsnd9RYwq6CrgrLqJZUS4GS6Az2OsbP75Jx/5CzexU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213042; c=relaxed/simple;
	bh=q8MICgz97bakcnm1Yo3O5LRuqCznEZaUiRdeOEQa96U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q/Pgx5Q1ffR9/G/Mp8Qqi2ic5Rg9gXd8QhwECa+sGGeNSJF8HE0wPDO4e5Z/qAl2ZnjIkq6qUuza0f8SXoLXy05mxcu5qf0oeJq69Nn3366nu/5xzNvBA+fbj94TQrg1m9p3DyxgkgLI8gJTUKEuC//rP++cJigb1UHrKss6eaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RAnGKda7; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RAnGKda7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kgz1j6fJelysmNLj3y9AkacHOujExvqy8pzfw5M7QJUPI7BqVnZokK35lJGQosZb/JGvLsPYJGDHSFUc10Y5ZAeS1oTY2ikmYZRi6DS7o6XB5edG2LuBhz1r/4IS8rL6IoDXu0mQiYn7OJey30G0PGmq23gQ59AHxG/VtYYYt7C7gbuZ8XbJzevwFkgpu0xW4cl//yTJLEWWP4acPdeBbTa1ehgrBhR3B/fmV7un1CRGNF8ZYK5z1dYTbr/FDGS2jknOtA/JXVWN882AHa0/MgisEZPRJ6+Nlp3aXJh8wX1CrQc5QDuDFMOCk70gWmVXm2jrLvOtBQNnCGWLfujBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPdbCOdgykuzpMqTCQ7FrG/NlgAOT4sa09HycCvbaUE=;
 b=a2zlvO0/Dje0pgO+bkTswNWrgA97b3YOfZdBh8AOmUsF/dtR2rXHo4q4J/ZD4BZ9IwsdhOw55X1vueS2IiRRxcoNqPM+49ICS96AM4LQOgds/neJN463fXBt86AdvhVbSrqzy0cCVt4O+EzK9AxCmso2jZVWLzan5Mj8sg43o4M6MFwp2M1Jorq1OymB86WaUDiQoffwDakXLZbl0Jmraxcw/qfpiVDeFM15sQZVehBwNCoAQLnIGhpieEhT5M50aDX8M06axZpvdABHZe9RMjYmQ8r46L1clgtpuNgQi7VdBYbIq/qJlzq1VgsaBC+xtOfF9KCe7pivcLMP13PpQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPdbCOdgykuzpMqTCQ7FrG/NlgAOT4sa09HycCvbaUE=;
 b=RAnGKda720jhhjm6MF7betI2Y1Np5P6ex/Jy3OozsnTgCW3Vr4fRK1l0Hdh7+87oAMbzvOKBylfJ7bCggwtzHnxe7tfO3MbWBqk9sXqMt+PaglzG0FKl8SSFKHGdvKlqjPUuP5ljgl8j7q9Li7RzUDlccND6sDvq2MxQ76hoYhcDgCFn39IOllJjFX1CBQiKvgYCbEHCFPugq9zHIxsIIIUH67vJv0q9DhRNpz0rnAonIPgi1tdOl0ynT24LoIcyYIoLtQMgBAz6u2z0Y4unKwrvix1gcmu0DvlHMgaBDzDIJ2E40V6DoDkNpAdS6a0JAaQ8BFIOo6hktpQitmyatA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Wed, 9 Apr
 2025 15:37:16 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 15:37:16 +0000
Date: Wed, 9 Apr 2025 12:37:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <20250409153714.GK1778492@nvidia.com>
References: <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
 <Z_P92UCbNCV0TbiA@kernel.org>
 <20250407170305.GI1557073@nvidia.com>
 <Z_Y4k4rDO-BbMjqs@kernel.org>
 <20250409125630.GI1778492@nvidia.com>
 <Z_Z8-BLWMkiWpaDY@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Z8-BLWMkiWpaDY@kernel.org>
X-ClientProxiedBy: BN9PR03CA0605.namprd03.prod.outlook.com
 (2603:10b6:408:106::10) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd93e57-ff2f-48fe-6ddc-08dd777c67b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xJ5o1EOPzLLD87yYD8HvbK00tqVLOwn1NcM6ZYIKripV73i2nILgbGvddMJj?=
 =?us-ascii?Q?I3VJxrwAp0PiuIQSl9UkNaHxe70qkLkp3XJ8ThH8yVO+j2Kbo9dPlG7Uz64m?=
 =?us-ascii?Q?8uVG3m3pAu3ZIygxJI1XF8yfFN4tn12/Y6UIOSC1KNAYsvNV+gfWBqUztXKk?=
 =?us-ascii?Q?kIYdgH4oBTIdigu7XGQLQLdoNboK2EYgLjwFsHTiO7feoW39NCxlyOtG1llk?=
 =?us-ascii?Q?swc1Uep4CpEq70Y7jZGSCxm/aNOMxPkrjTiVjGojSpshjuVEXkyZjNHLcjN8?=
 =?us-ascii?Q?4wwvtEhehKviUk7VkBGsp2vN6oJxGIcx99OZqMdwdfEloBsvmmOQKVYRM81h?=
 =?us-ascii?Q?rhMnxSYCmT8Be1H6w81f75tYLqd+w3gQmgc4tp/SIr4GSbqUi09XpUqQdNhX?=
 =?us-ascii?Q?EQCYsS1aOvx/BOzvn5ULc6GQd+YOrRLTTBeLag6+i/gPE6b83X8VcXdl0MfO?=
 =?us-ascii?Q?5qgLXhvesU0cfhtbl7Mtbw7sstFTHQva8Q9YH5MBt3RcscuYjYzMMRPOgezs?=
 =?us-ascii?Q?/a/TIYo4Mq/qu0Bf3sr4rxzSEooNWa43K613+7KTm6j/0/7eEI1nMHnDfszD?=
 =?us-ascii?Q?mkJHHilfieRwUBT6bbKRwOg8du5Azw78wO+9ox+iGYCt+d4cesSG5yz64CAv?=
 =?us-ascii?Q?ryiv7eroCGV+CyCgxBzmJoxpBMnzhBLsMGf3bOARat3fSlqmJfqJvnm4LePM?=
 =?us-ascii?Q?ThA/mtjKPb721EJ5h4r75//Dy+4twDoath53/cPkYEQD3vSng/iM4W3FLo2m?=
 =?us-ascii?Q?m4s+5qfIkZL4UDxbzDPdc8OyNwkD+X6s6KnOwUFJT+1VnA1NvmCwuOTfLs80?=
 =?us-ascii?Q?VKUwiNpiebqPpZ3zI6xVEWpUb+lzRC/YCkAcwmb7vwun+S/tUifDJNFDfPKg?=
 =?us-ascii?Q?4R8D37YFxtUlsEuW/dqhgQokRhNNI3w3jk0huXQ2/bvsqwAFQjyVaMQwRKfe?=
 =?us-ascii?Q?t+EWFjGZZS7/v4KaA4iuKhY3Clbiy6b9eDNYoZaGk5+aISKYDF5QUMaPoAwY?=
 =?us-ascii?Q?ET5VZ7JtdL7w8z2A8W7ePOox0i23kD2htJIepJtxq3hHtPHv3C13yuY6y9Rz?=
 =?us-ascii?Q?Gn7Lc0PyPLNaiYhQJXh8QufCnFnk2o0BhPCkSf5IVTmYFJ4wQas6b/T0Tgkw?=
 =?us-ascii?Q?I41OEdSpSBv79j0pRCxWs/ZK0lTK3lHhWfoFFTnGTy4AF3TWB4wn/tnONEcK?=
 =?us-ascii?Q?WJp/B/WyBS9wnrbs7v6A0KbVxD+w54pbhWzUv14oVM8mdmHcDx9zjxhNz1Ri?=
 =?us-ascii?Q?2R/srDojZgqbBKwqDI62JYL9npXVN1Z6dy7UQAhTQdy4sT782/ulw9f8Yj4P?=
 =?us-ascii?Q?3xpWyB9uiSJt1Q2lXFckzkwWmbEMY9oW97QWM8ps7qFPXNegVzAwd0gj4cq5?=
 =?us-ascii?Q?OhpQg7HwnHBmd1YsvxJk+O6/aBAv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ne1NT0HUdsi4Vp8S2l8UWYKBtHXn63hDj77ZYlTPYQ2nQ78ENXKGGItW0ZYN?=
 =?us-ascii?Q?CI+wcr8QgYR72Pu77l1WCvjNGElN42CjRDM4xkasfTUpwnX+L0wN14aNMTK4?=
 =?us-ascii?Q?Gew4jOQFD+CsltGyPFJ8fsGphvnhROm3MvnIuZf8SGkkFJxB5wTXF/OEvpnS?=
 =?us-ascii?Q?qMD5jjMy3vSpToMavQZOhRQ43TpGUot9Zg4XvFCrAUOrD+w4aIEgWmTX//WU?=
 =?us-ascii?Q?Pl/KjHnmpt91PSesPdqNCXp9ghOjT29XSYF0u5UUbbYf0NsrALXeYcphvgcq?=
 =?us-ascii?Q?3mat36lr/ZiqWA46vYXJHnQ9RgvKMniSRyKqWTci4RrxFNcF+EBxI5WUJOTP?=
 =?us-ascii?Q?vzcUcmNLNFHtrXE+LBS3yyRN0ZSmrMCh/tghel3ghqabf2w7imPB40+zvAYe?=
 =?us-ascii?Q?y2SgA0Mp5b+RIIyMqd2ekV4JxZWFKBjSvO3coqX6dgLX6IAfArWVtVhvfRKN?=
 =?us-ascii?Q?3cRrtVnzq9SZXmLDGDHBixlim8NfZgCTzRUKR1zBqLGxkQvJVhQPppDa4KXx?=
 =?us-ascii?Q?VyFBo5rPG/1mrEDlwouQD7TsgbfJvLgdpCoh9Tu5uWoDESlCecyVD7yypTmM?=
 =?us-ascii?Q?P0wPt8P5jvjrUcoXfkWRCLFRcRVSNq+t6vxmycYs7P4m+hyNOl4pAq3zYRAr?=
 =?us-ascii?Q?A71l0w4E++sX7qIUnHUhkKRo2j1hY0jkT7o/KYHEGMOevTigsSw9Y7LMqTg1?=
 =?us-ascii?Q?hG9gFVAESJcDNU1vQP+8wWQlUpqL9T7joL9fc9MnNSgD2fcKHFNA+VDifZu3?=
 =?us-ascii?Q?b1CKPiXyr2IHNktZiK2a3WpftyxV1ppaeks/Xdb4/p8RY9AxcbYjYZmcf+Gb?=
 =?us-ascii?Q?uiYn06ATk2wJlhg61DdXWcridj/sNYYIqHfeemJ4oyune602Pd7UtgpaAnfa?=
 =?us-ascii?Q?e/lr2ZQK25RdN89ijD5Qkb5TtD/cExSQRnZi85pctIbGSMHALaM5EJDVK6Oa?=
 =?us-ascii?Q?xtY8rRsf53Zv8ZuATUZQc+Vq2mJR2H5VlTJ0KU9jWusmeeEIbX8RLf49SocE?=
 =?us-ascii?Q?w66/z6AzwYEHMTiiZCWzTsLOVme7KtYz4zTvFX5iof0q2kTYBfHgG0Lk2rNf?=
 =?us-ascii?Q?ANbBIkUjM0Wf9z02jojjwwSZdxj5DAUBM2wHi7nRMEdoYFjy/EjZFAUuRQPv?=
 =?us-ascii?Q?VBNP673DajkEJoWjz3/iZiasSiO1ClkCux8vcRIXeZc6TntugSAsuua4QVWH?=
 =?us-ascii?Q?gZRu69YvBEh70BuSBoGLQWNQhRL+Cclg/cAarXQ02ngD+F3Rl/XRilEIaEuq?=
 =?us-ascii?Q?q40XcyuLKjD9DCPlxDXRc4fHNKad+PTsbfaq+xWtSVmcUMDhkqrcjPCsXuMS?=
 =?us-ascii?Q?4l+TxmsLuss8hOZwqUNchEtkG0cY96iIrhd/Li67VDTPkSyaOd/fSSGqFFOk?=
 =?us-ascii?Q?wQgSMxR11UEL1E6jRapWgQLkJpWEQeKL+prdFuGqF8KY46wK/lBGNrfG1YUi?=
 =?us-ascii?Q?N87EIR4YDRGLVnDgWISJJOwp4GbNYMt3lg5Mxdmhcd6M7F7izjMLVl7CIeEY?=
 =?us-ascii?Q?HuE5jBs5Titc4IVKfpk64hZEq+NOriNUzZKgDPORHq2emN9l0d8BelCVXEpb?=
 =?us-ascii?Q?WNX/wPXDbT7W6w0C+OcvXAMaNRMFKCCK4mWssjNb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd93e57-ff2f-48fe-6ddc-08dd777c67b7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 15:37:15.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIKwJGG9QuA/nZyEi5MTvSP33U37RRBa/Vk1ep+bkMf8TttPGEyi+BDILLgSOx10
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443

On Wed, Apr 09, 2025 at 04:58:16PM +0300, Mike Rapoport wrote:
> > I'm not sure that is consistent with what Matthew is trying to build,
> > I think we are trying to remove 'struct page' usage, especially for
> > compound pages. Right now, though it is confusing, folio is the right
> > word to encompass both page cache memory and random memdescs from
> > other subsystems.
> 
> A disagree about random memdescs, just take a look at struct folio.

It is weird and confusing if you look too closely

> > I don't see we need two functions, folio should handle 0 order pages
> > just fine, and callers should generally be either not using struct
> > page at all or using their own memdesc/folio.
> 
> struct folio is 4 struct pages. I don't see it suitable for order-0 pages
> at all. 

It is used widely now for order 0 cases. There are lots of rules about
how the members of struct folio can be used, and one of them is you
can't exceed the 64 byte space for an order 0 allocation.

> > I think we still don't really know what will be needed, so I'd stick
> > with folio only as that allows building the memfd and a potential slab
> > preservation system.
> 
> void * seems to me much more reasonable than folio one as the starting
> point because it allows preserving folios with the right order but it's not
> limited to it. 

It would just call kho_preserve_folio() under the covers though.

> I don't mind having kho_preserve_folio() from day 1 and even stretching the
> use case we have right now to use it to preserve FDT memory.
> 
> But kho_preserve_folio() does not make sense for reserve_mem and it won't
> make sense for vmalloc.

It does for vmalloc too, just stop thinking about it as a
folio-for-pagecache and instead as an arbitary order handle to buddy
allocator memory that will someday be changed to a memdesc :|

> The weird games slab does with casting back and forth to folio also seem to
> me like transitional and there won't be that folios in slab later.

Yes transitional, but we are at the transitional point and KHO should
fit in.

The lowest allocator primitive returns folios, which can represent any
order, and the caller casts to their own memdesc.

Later the lowest primitive will be to setup a memdesc and folio/others
will become much more logically split.

Jason
