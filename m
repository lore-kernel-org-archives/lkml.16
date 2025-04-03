Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244491A254E;
	Thu,  3 Apr 2025 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684849; cv=fail; b=rPyM1aRIAQAYqw4m9APcKYB6nMnceo1+9InEPTCuRXXfhJnG9YUr9s6/EBNprX9zihX6J4gu1R74rN83XRTUj1s3pkTtPVD652nDyFpPDt9DtwvliBhdysntC2tfUbbsyUgNkoakhZeoDI1iNDERJsxEqagH7ZicRUt6vd+eB6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684849; c=relaxed/simple;
	bh=9i4Xu4O4p+o87dyQDWnt7ghmtm9xFW0jo1yxvP3Lqz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M2kifkhOGcSqoazfxRRIntSATOZohvSB9muZPKNKsC7JHegJpTE6xY6K/xLOYj31DrcD+cj7HDpbBZ5seBYAReaK5zdnRXCYhvLN7Yu4WhwlxZiO727UpiyFdsaRc736uk01HqDo0iLd0Vgojr1RO3zLURWfiYpQEoPeSE8lDmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jr31Rxn6; arc=fail smtp.client-ip=40.107.93.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jr31Rxn6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFmVjobhY2kxYokksJ0ucY2P86Wa+e6ZVcFX8Ij1ri0oU0tfjGiOPQQvbKNkXqV7QxYVPe7oEi3ts+LQXOOX7EO0947moF9GurTKPCl/XkrH9a+wa9V0lYGnsNUX/cOgcqRsFzgi4nNfcRG5lxFvSFfy2fErj6AN+iqLvM3hmyAPAScubsxWBRgieKBzM+eB2NBfdXhOq6/FbjMmr+VScg9GbISeNduAvn/M4jKQRQjWuOFaUN14dwToPJznM7ttkpeY2HjNxsusKeOc81HOz1J/5rB5M2thr6fzlGmuWBvORw3kyKI4FWWOS/YrnUK+fUqPlOo9b3twTP7/Eu7rGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuYqdlGReajF5JkTxwZteY6JDEYRRB41BIgiW6cVvCY=;
 b=ZMvY8c0RX3QSlt2luao1U12q6r31eMLyt4KjVEg4v8XFa6OCCXEd5PWG6PNlfot7wBzzNF3afv9LFZlh6IJnnkYLSBVXYfYOAHVqex0Kddli/K0GUkbenY2p30jILK2yvA43TM8iaWf2NCwEXvNQTyXnLEKqV4uKF8j8XmvkbRKcmYTvugmv4w9gFlYR4rsnZjrIfY8x3g7s0xXHrylMujXXV+OrBTY7LKggv3HSVca3suTsX7QfK6DBqgPpdPlTTfWMWkELgxzWWqZLjVGC9QdF1sZ6Yz+guEt3LPmUHofUhhnpmYurG2vl0O1dJLKBnfSaKUXlaTmfH8mzd4Ghwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuYqdlGReajF5JkTxwZteY6JDEYRRB41BIgiW6cVvCY=;
 b=Jr31Rxn6JOl1/msczvrR9WD3xfzsCB2rW1WlHC5RUJksU7cS1ti9QH0viAHXfFb+ocXTDEWvakmMl6Gwl7PfG4fRbrVVayl9soi1vGo0W69BF4kxwFmh8oDnsAZH29HsmnSAvAEw02HIJfmnKhXpxU5k5JfTAL2Y4fVGQjmF7S2eh0hJkRWf8RZ+BM7hXAIraI7IxiMRB1xEuTL21RfIhnIwQX43ZPlSigXBKUTH3SwlgAPkAiR2gOrCUdsybKBLrwMz8f8rqmsJTFQu9NYOVchM9PaDacK+PP2ePh2LPDof35syzYSfnK4eXrTmicrHNiVIqA98DlGxIx719tmygA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Thu, 3 Apr
 2025 12:54:05 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 12:54:04 +0000
Date: Thu, 3 Apr 2025 08:42:09 -0300
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
Message-ID: <20250403114209.GE342109@nvidia.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs05xjmqsqc.fsf@amazon.de>
X-ClientProxiedBy: BN9PR03CA0571.namprd03.prod.outlook.com
 (2603:10b6:408:10d::6) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0046fc-1f1c-46f6-c319-08dd72ae9d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mRYJAI0D/O9Ti3PZG7xWTBDvv1vEb/cI0KiF0z51y+6BWR6alb/sRKFXEtGm?=
 =?us-ascii?Q?MGU5h+aXpryJVIgmPokW8eemW3VyE3Uo8/Q12NwpWYj40g2iUuTiDNHfVIMt?=
 =?us-ascii?Q?r03MtaODGl5ymKFKXMx7mIX2hxryzdLZZLZSSjbfR1fg7SMoQT6RX0ZvppOR?=
 =?us-ascii?Q?K1YWxhC+ZVoO8u0V4C6ogJfNI9rHMUGiJB9lUrSYuTGCqcbYRmzCUookA9gl?=
 =?us-ascii?Q?C7NwUBLk9oM+giejB/nEo3z3XUYkU7urqS2Yf7lLxVmbp1zd44DboggOwvJy?=
 =?us-ascii?Q?0Yy4CsAkjghtdw/DV89dXb9a37SeuazQv6Jf9Fc2xjSn3bMLOmwCccDmN3T6?=
 =?us-ascii?Q?e46YIWI0fbhPceQ06TZshCM3cJ3BUlOu1SVAXqa/3vAHI5LEzTxk0u5fr70i?=
 =?us-ascii?Q?Iz0KlU+x63ThAehJzK6N5d7shmNPa5w5MDrcGBLXQ9Q9kZdcErYrwm1DtWos?=
 =?us-ascii?Q?mzgawDB33zb8my2UtKVfLdq4szAm0AA9S/fSGB2hOMMogomD6Z3ddWRlJJx+?=
 =?us-ascii?Q?nR8j1gprdoGwareDeFhEiNsU/zlE1SxW7uk7sWYxhMFnUkwBiKvdnBx1BYPw?=
 =?us-ascii?Q?idpNzUWW+gUWiCYFI0le4/+goAOqcSM2fqRJbyJn7nxy2VFQR6xgV+Zhdz+n?=
 =?us-ascii?Q?V1KSk2Ysu8xuJrcXt21kPc6ctwXG9UhgfJ4jWCmOAwrNXAEHzWp9T8hvWO6I?=
 =?us-ascii?Q?XtMEYlMIjVP+rZ5qyCGuc4JBgdmsmFzOLuSnfWic580GqHcn1kiTC6ceT6Af?=
 =?us-ascii?Q?0QEVfdlF14b8QPmbNfRwV2vfcbXSRuIuNno+dCEvlRnkRDvpLzzBk1hgAlTV?=
 =?us-ascii?Q?DI2rNbDurs6NVZu6rpHXsilwGLuf5XWOiLKdVGU1juDhLZBVNE2DF0yHO+aW?=
 =?us-ascii?Q?YNdT5TuXrSneu8TMHImbVWCji7C2rwL9w9PFp3EeBMKays4+L3rHHDx0rlw7?=
 =?us-ascii?Q?RnYQamZOAEpdEETUEYAd3jcL8cU0i2cki8KJo8JfWbEhbAxYwJY+LmIQ4nsJ?=
 =?us-ascii?Q?HQV0NDudUtvYZE2etV0S/FDqhtJHgddry6QOx+5NtLHqxOz35MhOzWKBHGIr?=
 =?us-ascii?Q?eirxPJ0meKjPdHxc8z3yRkB/YuYGz0tJG/NcZLkobJFcHf5EUwZ4GDkB0O3W?=
 =?us-ascii?Q?9j6EgMmG3erwu+8IrUogeDWU1r8A6Qp6Zl31ujboQnmUcahcVXm1oM1baa4n?=
 =?us-ascii?Q?E/gq3Xl021AXMN6/CO+c4luNGxCsxDBZ3GMWK3RPH6ngHMUhM2f/ahK/BaNq?=
 =?us-ascii?Q?CNrYmV2JKjeLAOh7WhlmNctVUQWZBuoCR92WDMXO4HXDrjXu7WUETuqv6+4f?=
 =?us-ascii?Q?fCWIIHV6kbT8vZaA1W9Jw+bgGXTmSzNicPXRgRQqn681cT/FW1YR61gRrV0j?=
 =?us-ascii?Q?yqAshWQEUNh+7TFgKloBYJTgmN0D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qt4FcpwCgI4MlW8uktLxaZqdMSmuUpQQ00L9smsDNGsykc0VBzspu8HkgcX8?=
 =?us-ascii?Q?wvXYHOm1duOpCTFk8LgEEM+62QtqnXL48EP68DSMLYiP4fWQcJP90Rrd5xt2?=
 =?us-ascii?Q?ygdcMH5eWd7FcnvFSB7xAEdvmOXZ0iIhextMB7nVrIdUgFokjOb5upzpfGiT?=
 =?us-ascii?Q?9poAS+8Acj058n1HegwYjfXsjCJXxxD2Ax5Ugq0s03pLMWP6jXQbxQHOaAWH?=
 =?us-ascii?Q?l0LonwFXpBBb5tsxv2YNwIIjnOXa5XweS3+VpRXzHfxbjwqaVMGzUofQBFxw?=
 =?us-ascii?Q?AfTyGf1hkzJcJ7Z9cCQGQNl0XQ8V7WT9Z+KVm10SgypWn8JtD42XFZ6dsqVL?=
 =?us-ascii?Q?5C9CwDR+qM1oFdEzhlshChqAKcZ7Qp1TxaBI+Xlrwv8rsjlR5uVGUEDpR8RF?=
 =?us-ascii?Q?nxiD5alkKZlHUKNBEiNfU/HEJEc7/YF21Nxc2s1+39DDRkwvazQQb5cGE2ON?=
 =?us-ascii?Q?/nihA1S8y5vg6s0UFl2Dl1gP5yWZezLWI+nmZkZSmVEd9eCc51JkJWSriDfV?=
 =?us-ascii?Q?P8yMcPZHW3t90yj6vHFBeVS0RPBUzY+Ytdgh+D2/0614FyY42wJeldSz5+NN?=
 =?us-ascii?Q?MlFhnIPQyGOx/aYfk3/p2Roz+SiATlXDLyn8xEcSsGhVJMvOv9atr8XnDhQA?=
 =?us-ascii?Q?12xfQy7kHP+NYYBW/1mzJd53qSschx3SkSn3K22jDf4cgja03bf+7F8yYLw6?=
 =?us-ascii?Q?N6wvROJhB3n4JN8t4jg8NSjicntHsLe9/C+sc29Ca8wPX81ZOOx8ggRrSVen?=
 =?us-ascii?Q?BfQ7uY3MgeB8jMrL9Vp6gB4n1RQpWen5wXRXHm7ZrD09V3s+bMgErYazoL6b?=
 =?us-ascii?Q?XM22TPV1IuzAb+zpr0vAXWQHNS6a/h20TSQZmHhDsegxHBO9wFETZMcoRjsB?=
 =?us-ascii?Q?zFXFSSUcPQHjlrfH49kVat6rf2CsWN2qtMnpcybOiVroErpMM+w3J4xQgGDw?=
 =?us-ascii?Q?xciBzDvKgojWIV7CHGhMxnSnUuAEftQe0GtMGhAmtHNGi/87FNJgaCmiHXbB?=
 =?us-ascii?Q?rfKFz/PwhObzlihlUrnmYgz4tTgKpRA2S5WmtrHxOelNoc4mbRaVpWWDQ7Lk?=
 =?us-ascii?Q?2R4WackwduunGsH1KzIG5cpa7+WddgsmqBFifXIQRE2jZywQh+ysdIjYWNM+?=
 =?us-ascii?Q?mTljTR0HA3CSlrh7svjWtE+TR54/l4LkGIDeYs6tOoQ57q8gF+nfQ2Zc+yES?=
 =?us-ascii?Q?ZN1D9WEvnKrF2ROSk7To7I2297QB6YRQzQjQJTRpsSxZAbJtzsfc2wkPDL21?=
 =?us-ascii?Q?fx1OXhnyAW+9/9SC/ICau8QOGcE6O5HjatCaf9roQOBYMiwWsldGVp2bgTZB?=
 =?us-ascii?Q?90/tVDqGkTluqY5Yo6WhIJ+PnpQXv470UkygeG+G/MLMy99qkVNDh6IRwFXa?=
 =?us-ascii?Q?sHzUD/HmeDuD1t/CEywiaW0qFjGMqAeBb2TXyahkmV2vQ+tkubKgTpqGP2zb?=
 =?us-ascii?Q?RFTssulVopKuNMhinTd5/ZfUgtzX2paDWbxVz/QHidBvFLenlL9BI8Z/GLOV?=
 =?us-ascii?Q?F0GqaMpEntAuSh9rlvrzCNc8Teex8IYPudYD6Q/oeUP2gTIJgTi49QPSP0En?=
 =?us-ascii?Q?tzax/o6vIBEw11omS0ffgsT1zrgZkkwMGjyh7IiE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0046fc-1f1c-46f6-c319-08dd72ae9d55
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 12:54:04.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBofNxr5wkxJUmrZ8Jj9avhtRVwV/dHn5fAzNaUjM4KVWpWI3dGC8U+SlFmFxX9/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719

On Wed, Apr 02, 2025 at 07:16:27PM +0000, Pratyush Yadav wrote:
> > +int kho_preserve_phys(phys_addr_t phys, size_t size)
> > +{
> > +	unsigned long pfn = PHYS_PFN(phys), end_pfn = PHYS_PFN(phys + size);
> > +	unsigned int order = ilog2(end_pfn - pfn);
> 
> This caught my eye when playing around with the code. It does not put
> any limit on the order, so it can exceed NR_PAGE_ORDERS. Also, when
> initializing the page after KHO, we pass the order directly to
> prep_compound_page() without sanity checking it. The next kernel might
> not support all the orders the current one supports. Perhaps something
> to fix?

IMHO we should delete the phys functions until we get a user of them

Jason
