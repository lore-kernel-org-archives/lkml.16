Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867E14A4C7
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746661629; cv=fail; b=pcShu0hE+EY3bytmyhIWv/G3/s6zn5LQuyXjvWzhPSZmG3gew0bnF4JgHAxUaN7oGIZYamEjOp48/rHw6gGaI79JniH7425LPuYO4NfklfQBdH9x5o7RA/99meyO+M4jsW5LZhoLXBbeTQYPfm7BKlfoKz34pU++blQSpHvWBqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746661629; c=relaxed/simple;
	bh=BGfW+Ut4KYvMClLCOQdsINKC9sduv6pnzgoD1vTpGJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a4zLeCf7QTQYqVSz3nktHQWTMUTo4kVmPlDBVzqsy2E7vlRhcWNQK7d7I1jGNUT3wV22PrDd2HeiBoiswOpn9Y7T9bUPgj4bS3aD39/bkNSrk+5gEZWKgmGXD0wTJM4cfyDFUttQmpAf34E7DAnGrERUubZAs8h9ExPj9/m5kz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lcU94Nrj; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lcU94Nrj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFEv10CrTDo32Lx1SOBs5DI9YzFVUftQ5gb7Tj+xH6FebkUZphTz2ZvhoyaESlG4S/o1/EB07iFdalEeC5Jd71V18w7TlRzIwEX8lnbpy8vaaXk8CV3YnpV8dtXOgzQSQ/cMEXLr2uB2X5EtEXfnVXBZzOGEj84nuEHP2AjDMTyCaj5VpZWv3CUcMlVbwSElCzsq2LypPRUkljnRs26x7DXkcfoRoZqExxGILFR3O6UrM0iO/LfpSmQBBJgqsksNRftMWapngIj1EjVk/DYnN1tYZbBnMbA3gNmsLuvC57bz6kNEPlUpRNdCzhYvHlNRa+JqXoAiArROBNHd8BOnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ptXqzeCI68cJN2T43T+gtuaJGbixtx7Bz3hv9cY4dk=;
 b=posrLB+df4KuT8p7iLQYCO/PuKA1RIkA78FUUJNh9u7xNK1FNHSB+a6eax/IFAickO1Bwv8YOdR7hARbr6mlX3Xp3gui753R5HMrIJKsQKeH09FRSSqkEsNM8rR7l3R2LJ2OnG2p6wALX5gOtG0jZWrwj7CaLev/Q5kba0e9Dpecf2lBA5wwthy+QJt+oROecQnQeIT2tWzdLhn9TFtcUXz4m0Ba4LrCOF9EOC8A3MwjvsfpP7tZfo+cQVwtl+J6rWivx0lvh8/E/pB47/S7B9qEiAsffPMO9bAM2H1B6lXOjDAFzFeow0YqhMh8JeqbikmQKOXyd/to2lAHsWejew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ptXqzeCI68cJN2T43T+gtuaJGbixtx7Bz3hv9cY4dk=;
 b=lcU94NrjJmvppk4qhFZCRh9KjnlzwErzfB+Qh17aSvBDmnxgDA+SoFy4uq4fr9zlBy7OpquA0C+uP5sT0Y5Cfo+yXaNYhNteNH0NLlbvfninyR5PHaBmFe2cIgdkXcXEVzS4VhrOATsbsJPH1kiM1UOGoN2bXYO3tjlCcMJl7ByAKm1LEoTRQWV/KNbc/DwsRk51OtvuIg8qt9C/L3NOm4y7MHena/lBV8QcF7O1BBSafEJd5Ap44zE0/zCyvwIrTfVju9yYC8e+KLvDGLmgS/YvRhLEOZ4CPpgc3mRR++5J1U8KaEOZbHPgEGcfdAKfIWzAKxJP+igGG5tfd7vRdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL1PR12MB5900.namprd12.prod.outlook.com (2603:10b6:208:398::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Wed, 7 May
 2025 23:47:00 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 23:47:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hannes@cmpxchg.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: convert do_set_pmd() to take a folio
Date: Wed, 07 May 2025 19:46:58 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <A243EBEA-22E7-4F57-9293-177500463B38@nvidia.com>
In-Reply-To: <d2348cc3-c9c6-4df0-82b6-1105edd44a75@redhat.com>
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>
 <aBtNrQNlL7hjLrTZ@casper.infradead.org>
 <d2348cc3-c9c6-4df0-82b6-1105edd44a75@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::29) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL1PR12MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: efe05848-7670-41a8-05dd-08dd8dc175f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Hb8ZgjepVqIUUK39FeZQbCJ6ELrXVRMLUHQa7308tXfKRD+sow06dIGKe6H?=
 =?us-ascii?Q?lLWc8cf08M1UYsvCjztKRUREz2c+t3JuaQAI26Shb/miyrxdY8SdAOsMfBaQ?=
 =?us-ascii?Q?o23K0Sc9tTcu5HhLwkSLcSmnd2/mVmU5syXwJqWXzcfBCQjONHVJoUkblLa2?=
 =?us-ascii?Q?bMIEk2nuedTObBP4u+QbRPJ3ndYvXVKY7Chtz1W9Hc624+UFv/LkhRIBbAt+?=
 =?us-ascii?Q?tRtifpOUDuuHmBp+f1gVUitFjDe8mXnZOXrbJV97NbxW8fdiSx0/dIWJ23ad?=
 =?us-ascii?Q?2jLrFCXej4cL3nTipgDdrKpB46tuW3oLgYmrUTVYQ3WfQISPfp1npxFAPDpK?=
 =?us-ascii?Q?icpYiN6LIZYnVBq7TEvPPMs6Ab8vvY9BNp8ZjD/4LGuvErmT4gcTWy+bQbPc?=
 =?us-ascii?Q?yvkjoAJgJ74Kk2/WTleStDLN88MrU4v8WJL9mThGyhLOL+OoeMb2BoVgm+sF?=
 =?us-ascii?Q?GnqIkmomkflMJXS0kJVvMkgauCwTZxr5wwiGfacQ4vRNqQjxbPbPi3o+Tx2z?=
 =?us-ascii?Q?aMMPCgn6Woh0k2nj9aiMdBwsEBHLvWiU5cOs9/KrPmWkBhaSG0pbbeuQKGdI?=
 =?us-ascii?Q?OD5yypP6YhLC64u9l7saBzlv4LiN3sI4aMuU/fc7qhvtTrpRaKxsRYxd05RX?=
 =?us-ascii?Q?HLDrQwwFko8CXzHVnHLfILCn0IgNzILMNVQw40O/A1KX/o6jgRAFWnFCHpP2?=
 =?us-ascii?Q?E+7DtCTShW32pmfuK+IWlWeZZU8XCI117Vr5BCU1S774xqiKwuZng0V/AZ+Q?=
 =?us-ascii?Q?q/aM1nxmo59e7ECSu8sKJspOJtFRfR9YhIOwaISGg0u3GkxGsOKPOrD4u5tm?=
 =?us-ascii?Q?Y/cnpK0l3FiqfYoV4Hkga5zwDURj7GcdOCWb0RJFNd5tltoG2gbPCruiFqP+?=
 =?us-ascii?Q?hBEmegWPBZrbG4JDN6/cx/QR/Rydc8IKDSXmdC1iKnoAGAvtg+tegWxYRNmm?=
 =?us-ascii?Q?RCHc2U1oI3x8XTgh66mkDBQikeBELHKWouOy/HhgV7/W1ALPVD0FHOhHTEdX?=
 =?us-ascii?Q?sYolABlhcjW2u+bbLZC4aKUZo+D0BpJk9UB/wJyYSaUg263+MFuR42OiMuJE?=
 =?us-ascii?Q?SYbYQ9LzFFCQr1pkz5qcRndUF1oFXVOCVkVrOKtpxRB7cIYbIYfIhJCPw5SX?=
 =?us-ascii?Q?y36SYlWdsWh7tWutZf5JTaC6Ibff29yJ+QI94VqQyZQ/gGRds4R046E0Jh/o?=
 =?us-ascii?Q?hRBDECH+Q/IQpr4jQG7UKTLr0mxA9hFCvkfpDyrrimHETrTa8z2aOFJUK8FS?=
 =?us-ascii?Q?WPizemmo1ym8sFnvP9mYmJKddghfPEDxHTI1JaT3wGx++4vLe5tiqFaDIFjR?=
 =?us-ascii?Q?3B1BGIbvQF+PEGZWG3P3m1I4SN4iSm4HNQSQjfwSxnXog0MOEmhQqaAYLdeC?=
 =?us-ascii?Q?riQTxqJsUczPSIQXrIUizsClnVUpenlqlNfGUe9W238UN5s/+k728uqYWJr4?=
 =?us-ascii?Q?kWDM9L57DiU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3PzhlqalBzgDz7s7pXf316a+8cyFnZ0likaDbcxADNehM//BnNfLbW2HCSQK?=
 =?us-ascii?Q?nAWgKUOkNd44S9J/9nvxDKi30VutaAcpXz61GY2Pr4Oeqh0WZZPI1fzB8DqT?=
 =?us-ascii?Q?x8bAKvqSn1sFnlR10i7Ad7R8WOeieJ5SRZRCFcOBJsgqwyEh6Q2EEnoJiHFN?=
 =?us-ascii?Q?V9mhJlUykH4Em0c4wdQlShtFx0JYSsYtkEJswNdzg9VkUNlcsfSGykaPzyk0?=
 =?us-ascii?Q?DwsdfnSpAEjvoued7tmK4SnvpZgwfJAAWQ427RBHvIFrIEXWNsx22yQkRaob?=
 =?us-ascii?Q?i2Vrm1nYT2PCUT4tPqgNiUHVeMnqDcX0AibLx+e9fPe3n9bXgHfgDgCoZ7uo?=
 =?us-ascii?Q?0zImuQkS24T4OS7B0EfQx8tWnKSZFuzD6qtPCrcDZmktGqoxS2Ne3WzXIvXN?=
 =?us-ascii?Q?rqycGgunrvd5TQouNXIObHuMK/2+PkvA2RDWCDuqKqrwBDSC8p3xAbHDu0FK?=
 =?us-ascii?Q?fmvgezuTtcWn/OaoOBfwQPo5uASfdp5rzifG8c9gWGgQehri6zOCWA1+G3no?=
 =?us-ascii?Q?JVtadhHzJY52BMzFgaiGi+82oh+/8yiaVdEWsV0OHgwLJ2unmikR5eNjAl1W?=
 =?us-ascii?Q?KyWH4b73YDeprR/1cRvHkpgs/GtTjVntREKJ9CAWXvMDXBHwXMo4N93RTmvQ?=
 =?us-ascii?Q?nARV5OYjqalGqRTevmRr6ecbR+k7tS/jwKWhkqwalwNlLMuzClWCyV//3kN1?=
 =?us-ascii?Q?40/3Ux2l0FRgREPmv5n+htOM0qsGxrA+kEeDynNVcvV9uP2bRMNtpsgzG1zp?=
 =?us-ascii?Q?YyKl/Pbt8+ZXpOyqL1OP5BiJoO48pXgUygfOHMYUZ+bu6ToMTXx9nWOwOKes?=
 =?us-ascii?Q?5JNMkEg3SrKRaiYr02r94BoC2ncyAbe04fhcpcSsOY7v5siegdS1dL5TA2Fr?=
 =?us-ascii?Q?lAJ7IB2EgevxZgbLFGqvUz9WdMabYwaExiljZnF9OjYOX7Gx5CLgplyLd4cE?=
 =?us-ascii?Q?M+A0Fh4skhEiv5lkrzk5/iCThsfDTMp+uup/uj3dbliOT2HDJe/fGXUVc0Cd?=
 =?us-ascii?Q?ELbR5GlTz7GSXpECU+/LUyvXzFQ6p42knp7FMHAglWPDbqc4Z5EXMDl9bQe4?=
 =?us-ascii?Q?3au6W9q1rbOEOiBc2HdLTA3LSwKw/f3mP8pHXlfQKZEGKjM6zQwde0cKhTGg?=
 =?us-ascii?Q?wedFY7lZhbtJB7o/9nQVU+t0nGt8XS9jgY+/SdT3cmR79/ZdoF66VHmuvSOq?=
 =?us-ascii?Q?xOXS/Ewc82eNLp69tzfHwRqKtOjx2nEKSRmLEK2gJdcvpJqDsjjqMbfLjS5M?=
 =?us-ascii?Q?RXTHxFGEJ6qPl+miiS1n1Jmuuzdgtrz6yql4yGUDbMCXrtyPZhUSQ4GXXuYH?=
 =?us-ascii?Q?dub9bwjL6JexfePEEYKjo7s1qH0dty2BPVMXEeMFMZiXPEHpK4Im+yW0KXEW?=
 =?us-ascii?Q?RJ6WCCAm0FfAs5KswGSEy7OlMOMCx/PqjRPBHiZc1AB3C0X7wEUFTnxWxyZR?=
 =?us-ascii?Q?vnKYkNMCkQ1tGGXkjdI9RdRY7oLBfsG69+m7lpyF4rBe8/mEdaNM7SVzZ5Ja?=
 =?us-ascii?Q?XRxTmT1DZ/cb9EpTLpTXW7aM8ma6IQpUFccJiTPoH9g9mJ7n/NkmiklWazwK?=
 =?us-ascii?Q?cbfVI3iuBf2BZgsmQAFEe9l1/Niig7i8SLSG7PC4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe05848-7670-41a8-05dd-08dd8dc175f1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 23:47:00.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+iaK2cYKZHHmqIxWM6KxycszPClBQiH3V5ZWfZ1rJutb8WN0lo9Zew5aYswAJsr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5900

On 7 May 2025, at 17:24, David Hildenbrand wrote:

> On 07.05.25 14:10, Matthew Wilcox wrote:
>> On Wed, May 07, 2025 at 05:26:13PM +0800, Baolin Wang wrote:
>>> In do_set_pmd(), we always use the folio->page to build PMD mappings =
for
>>> the entire folio. Since all callers of do_set_pmd() already hold a st=
able
>>> folio, converting do_set_pmd() to take a folio is safe and more strai=
ghtforward.
>>
>> What testing did you do of this?
>>
>>> -vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
>>> +vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio)
>>>   {
>>> -	struct folio *folio =3D page_folio(page);
>>>   	struct vm_area_struct *vma =3D vmf->vma;
>>>   	bool write =3D vmf->flags & FAULT_FLAG_WRITE;
>>>   	unsigned long haddr =3D vmf->address & HPAGE_PMD_MASK;
>>>   	pmd_t entry;
>>>   	vm_fault_t ret =3D VM_FAULT_FALLBACK;
>>> +	struct page *page;
>>
>> Because I see nowhere in this patch that you initialise 'page'.
>>
>> And that's really the important part.  You seem to be assuming that a
>> folio will never be larger than PMD size, and I'm not comfortable with=

>> that assumption.  It's a limitation I put in place a few years ago so =
we
>> didn't have to find and fix all those assumptions immediately, but I
>> imagine that some day we'll want to have larger folios.
>>
>> So unless you can derive _which_ page in the folio we want to map from=

>> the vmf, NACK this patch.
>
> Agreed. Probably folio + idx is our best bet.
>
> Which raises an interesting question: I assume in the future, when we h=
ave a 4 MiB folio on x86-64 that is *misaligned* in VA space regarding PM=
Ds (e.g., aligned to 1 MiB but not 2 MiB), we could still allow to use a =
PMD for the middle part.

It might not be possible if the folio comes from buddy allocator due to h=
ow
buddy allocator merges a PFN with its buddy (see __find_buddy_pfn() in mm=
/internal.h).
A 4MB folio will always be two 2MB-aligned parts. In addition, VA and PA =
need
to have the same lower 9+12 bits for a PMD mapping. So PMD mappings for
a 4MB folio would always be two PMDs. Let me know if I miss anything.

Of course, if the folio comes from alloc_contig_range() or we add support=
 for
in-place folio promotion, the situation you are talking about would be po=
ssible.

>
> So idx must not necessarily be aligned to PMDs in the future.
>
> For now, we could sanity-check that idx is always 0.
>
> But the rmap sanity checks in folio_add_file_rmap_pmd() will already ca=
tch that for us.



--
Best Regards,
Yan, Zi
