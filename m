Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFB6E56F;
	Fri,  4 Apr 2025 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777046; cv=fail; b=L7l7rphzm/8Nh7574U2KATIUM18m3LXosdE5IFbaaS/Do5faO3KbeRwmXAA0xR1VcNE3TkCSR/+niav4FVtvXcQZBa2rzGoatMSre1y1TyiyIt1QDu8jVHWtKZ7golbE6SU5Q1bT2DeDqm3cV8xk/P5/EI7FRrnup/t9OfRg8Fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777046; c=relaxed/simple;
	bh=nksDuJutPlRb91fbix/sgzpjyL5qmp6u6jTz7zRiQDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JBC3MHHkbj2LLGk/m2Co2T0sgk758duavEj7l0TJb57nWTiif4SUTAXqrugKewpLyYj0jd+XK9cYkY9ybhfXxrAunFKAgZ8W42qnNLkwV8ftBfDFiGoYxYJgO3fG54lVGHIxN7+xH1BbyF2j7y4OOtfjj8E9FmH9uuxvDDvB19Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=If+b0/L/; arc=fail smtp.client-ip=40.107.244.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="If+b0/L/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaicWWKIESvF/7ANDHPN4Xk24ccuAL23WpysxPqwMHAWoRDVBPGZFa95k9mXWqwyQN97wgoeBkNKk4zmRLdbib/2ukyS52t3we4fVhUnxx75kdBTvWoiTTOnvfm4o9IhtFbdcobMmw3FLAvQhvPEy76K6lMRqpt4tOeBls75d0o17Potao3YuLU0yOoYsH8O9GkZHN0udYL55Y4pXlwusp8GaGvEf7T/4twUkENP0duZAodMndzLFzE88qtP4SasaCI0tWZtobQmWE3CzSL8t84ciaJvyr/RdKJNVz0sqCenaeAkWNWuESZ8lOHj7F0QXrt9W8DPUorMsfocy6uqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReUSZ3oMQXTPnsGquL18rE47VGqTogpE0z1Ep4dGYqE=;
 b=suWGyFDAvmNUVT2A3AQRXKcXcJXLZSARL+iafDYTzici2lfWV+IXWQSUYdaHKEf8Y6TZwmgxPQYUat71YKdSkRNXh187/7ke+yrt+BHS8oColyQ9QXxE3CswDUkjPjgocjH2S94IJhV7L1Nlb/odG8VNzXph0tFbd7mfwcKhxQ+zbNvguV2liwKsdjGrW2USBD/FbxSLZ4ScNswiJ8owIFNJpYwdhpXwr2aZk0ObBoMLugSLahiJPR/lP3gmDc/f7VPohjCkOI/ccZgcfeZjUAgpBD9bl+e+0dZKrzQgaE2BTRyz3TMa6utT+LSPPQmYjrAoy6+X/z2TxwiqNea1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReUSZ3oMQXTPnsGquL18rE47VGqTogpE0z1Ep4dGYqE=;
 b=If+b0/L/8nZHLfTgRmd4JhfGqMpN4pYoquj+cctX6KKao6DRlPEzyFzAq+p2aPADHyPph/y78HZwcwUMaCM0kG/jr/mNMtvgdkFyKOjmprpcTSsYZ+K2VlZRebjCYdw1hk+zB8M6a5LQjf//QUYqLi3TRH8CmQR08XAWpoPlte4b8r3AzaTzThYF4JUVPZsnyjzTM33BrlS/9xLrdvCJHGvHc+ngrSdU/dbFvRHvhSNpUZTZN6xjte6Ib8WDuFoqXv6KsijrPvVwQlLIWn7oAwA0kSZffuubkw1KM8vCrrPXRgcUaY16B7+GpuqFZrl5BPx9mE/vUf19zoqEspRckQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB8406.namprd12.prod.outlook.com (2603:10b6:208:3da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 14:30:33 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 14:30:33 +0000
Date: Fri, 4 Apr 2025 11:30:31 -0300
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
Message-ID: <20250404143031.GB1336818@nvidia.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_kSXrHWU5Bf3sV@kernel.org>
X-ClientProxiedBy: BN9PR03CA0843.namprd03.prod.outlook.com
 (2603:10b6:408:13d::8) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fb5910-b2da-41b4-4fed-08dd738541c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DfCwXe61WKhxPSKAP7Xj4i6VqMV33wuxydV+87HCEh02IIj/iZ3qc+ABsTyB?=
 =?us-ascii?Q?dj12ueKE5YsJINLbI+b38La0HtplWWA3QMphisu86UPDwuLq+pZ2+ygspi1w?=
 =?us-ascii?Q?Rm07K/L9nh6O2cSuvEKjX0hvUwZ/rzxGE4mhh4jq1ckp8xvhsA2NyL8rsDOO?=
 =?us-ascii?Q?1wNrYEcyPj6FCg4F2CWZfYCfGTz8u/05dc6caYB835zKvYMRG72BHuuZBN7S?=
 =?us-ascii?Q?FCHnHm5DRyDf/+6jHccZ4CE02902C8EzxiBBRCgvK5PHf+I9HVDDQvU4BFHH?=
 =?us-ascii?Q?oCJWquDdFXxLCazpoBm37q9TYeo9fyn8tmMkoavGB7A2A0LSmw+CODb5md6v?=
 =?us-ascii?Q?jNc9Bgo8iqq6r+cmm8wd3ziYmU4ErTmFf0M/UVCfaST9DUMm6MJIpn5ul6DP?=
 =?us-ascii?Q?IbIEKD6MOM8H5ntMU3HJwoAA07R2oBhpURxRclAp7W5UXUyK9gWHCVwYB41X?=
 =?us-ascii?Q?ouOBPxhc2DhLvavEwFZRojOkT/OBTNn3PskKY1nuGdaFlB9IuYCWVaOO1a4U?=
 =?us-ascii?Q?JBxUdFt6zTRGcnogDPEmins6dJwhnQzdcV6aIcd0X83vWMk1YQFICjCV3ihG?=
 =?us-ascii?Q?ezcOmIq0EL7TRGRZwtOd0hGo4+l1/DFjm4VlUToZZWJZvkbYZYvtGXYbe5mG?=
 =?us-ascii?Q?JIdxAbYa1mRvkmdXvMKZIAPZjXlyrvkA8Mc9881g9ddAyQ7uC6HdPFWGdLQx?=
 =?us-ascii?Q?uhzHCoQOedzzQLW/aeNws7gn1FgiLOKXgTYjYqYJiZPV6hvA8I0RyKjKYCwL?=
 =?us-ascii?Q?7qn+pJdHJrG9JUTKYhYYk1CHyKrsbPiyYGQ2dwiPXUHsZ6wcNTAlyGmFUYYf?=
 =?us-ascii?Q?14cbbLp+b2djhDZZ5Taw5rM1sLTnW75XEXvwY785mLsyCM/xv+jwoEoRYdlQ?=
 =?us-ascii?Q?u3Cd0O4kFQD+ybxQYa7BatQW1Ts/jKaH+V5yr2U18iipq1nqKn25gThQSAvz?=
 =?us-ascii?Q?3of29O3QeP7oa1Ws2GlluQMLkf/ArCvaEgbWVFkS9je80inWAhGpsMOChlHp?=
 =?us-ascii?Q?V7JU62yediSh7fB9M1F6ctEa9aStCVDXT7XJrlx8fpfgfoTbxEhjh7aWyFJg?=
 =?us-ascii?Q?rk50kLCNotGkOUL6bMELQeCysKtvB13JzOcRbL9GbNYgy1w+CdzJ/s78QP56?=
 =?us-ascii?Q?avL8RjvrTNcmTBPZavGUcu6EjbkXyZmm8TE9z0Qcuj2BaEQmVHT9bd+AxUjE?=
 =?us-ascii?Q?KtqUacNO+cll13STyPlIR/XvyxBxjZgs4PBFO8bXUoYwmmCDXqhelMu3l2JN?=
 =?us-ascii?Q?CxaNo9XhwvajGMC8JEna4zCKuMcLsjdja9XoNtzyx3ExEp4FGs3VGQzDIDbR?=
 =?us-ascii?Q?3TkLHmRc3aBKi3kGsfh+tBifvCjcaIua1ZbKW0HFGuwbUUn/OlSQHaPsODfu?=
 =?us-ascii?Q?/Vg2gakyQCC+q5sqeci7c0e28hTF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IEyrknkHbyneGKE06wzAqjlORHk4kYY/tIdJ5XwNg5rQZ8AVDEYhxje7oPQU?=
 =?us-ascii?Q?ByGtRKyXaRfGx5QcslqTCggjiHR3vKbU7CeyDnDKiXqvzgdiLwNtm+jXeTcl?=
 =?us-ascii?Q?IX07NS0xreefH0Uti6+1GGpcV3NvmC6jd0+mU9nfSpP4ibPGz6DyfX212tUj?=
 =?us-ascii?Q?ZQH334xfLCIhEKPoEpyif9h2mjkV3C6ojVyKsq+7pRRuuA5SsWVlqHhhyLRe?=
 =?us-ascii?Q?BkgJIBSYshqglHM72kOX6JQs0UVDI5sy8vGsURzHlUtoAO34XYi//8aHA2Ei?=
 =?us-ascii?Q?JFXdZTEC8sRdUPgmu4UHKZdvshsxspsExCstZPKZXCzjnnFUK8z7/I6OYx1d?=
 =?us-ascii?Q?pnCHFKoz1TrIq+4+gTTufsyE2PL7NoL+jYKIeqhpMBkfdMUAX+oM3erhCFJG?=
 =?us-ascii?Q?0ubf21wzhZP8e6HvxWadVYbw0QLs/mggPhuzEN3qqnIrRc1rvo03rEMR8A3t?=
 =?us-ascii?Q?RsgCIPPBgUfX5VDJUNT0WtnankDm1X3Rip+lDkhnqMdtO/O74W4YcYaKCkx1?=
 =?us-ascii?Q?rpidIatQ0l3/T8jLWo+zjecakM5CCSLMPWbi9VaUVX4TYyOQl706E56VPRAV?=
 =?us-ascii?Q?ugqhZba0p+jAdNZudGAGD2topaHaStdQ0lRU/gIJNV1QUhQ3OJGS8oJLQFpQ?=
 =?us-ascii?Q?lGpi3lwnuGTn3GNG1yzEWRc8Wv45ueiRDYigTmFn1OEplxneCCqug2fabC3b?=
 =?us-ascii?Q?FAGPf3xO5sjmXelb/J0crJHGL6+eWA1tBK5P/2iBYw3xHAbi18+3haNRaCEq?=
 =?us-ascii?Q?dEt7uHgBCvSt1alZ5z7KxonmuS2Gyn88WHP9PHMz9Kn4tyTyTdkQ+Hzq7O/I?=
 =?us-ascii?Q?11ily2+dtVHuj7Twb4Pe+nRYg9Zkdpyoq19oIRNU87oyXmjr7wrGuQ2vVX/w?=
 =?us-ascii?Q?0K7UeQe3E4eNM3cq6BCwL97I4fdWndl5xvZ0lXJdEMIXK5owd4kCtT9pnWpg?=
 =?us-ascii?Q?/Sg0qd38q3PjXh9VW8DofndvxmHzyoXWIYB8CgA+jPVovoG3TV8zFl+n8cK7?=
 =?us-ascii?Q?q1fkTDg2wOnS0nkLHZqq4cXy1ZIk33oWMjLT0pQ4ylVQ1y2977KI0CexoyS8?=
 =?us-ascii?Q?mg5YqcJyvGYolKfhXrQX0x6YJ9wx44ToXIA/fd1CdPSzUB7CCDRDvCbd0gmz?=
 =?us-ascii?Q?WnSIddscim2pkuJYK51f/6woc+vnrfr6GDCtqlUcSQ4Tlc86qr7U3v7cOgb3?=
 =?us-ascii?Q?VfMN5ggNbihcZFjsfuYX3D6A+TB7S5OqPACPCYGCsmSlIbVWcAkUXqwZLNmi?=
 =?us-ascii?Q?bqSUeZixeruJD9gV9DaBPYm1tLY8JDLFmeeXyI8jEetPq/FJA1Ve2SBP3YBb?=
 =?us-ascii?Q?vMy4pMfAA7LcyN1qa0xY/TPuxWmuETzvWSia1VV8nGF8gZ1lSUpGTYdJImu1?=
 =?us-ascii?Q?7fDZ7fXJJdegXOFO/zT0+u4AHsjv+ErohzJG1n1X3to6SVOMz9Xh4N+pqstI?=
 =?us-ascii?Q?2aI7PR9QLJi5rhPMjJas3OpiqIGDjopHJbqzYW+SPiSaPyyaWN+qe697fQbH?=
 =?us-ascii?Q?OophrdbbfCPr4OkN2E1sT94lA3Baq+N8QJjjGMB02JjRC1ViE9r6z1iKamwv?=
 =?us-ascii?Q?b18GhISvqgykOQrBwEf5ysi8z1rJY5sFdUQOSiVz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fb5910-b2da-41b4-4fed-08dd738541c2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 14:30:33.1630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzXagn8iRWdCGDAf6ndPE4cu6i4k9JCzENzxV1o6MtU3Fo3eU3J5ewT5NANde2RN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8406

On Fri, Apr 04, 2025 at 04:53:13PM +0300, Mike Rapoport wrote:
> > Maybe change the reserved regions code to put the region list in a
> > folio and preserve the folio instead of using FDT as a "demo" for the
> > functionality.
> 
> Folios are not available when we restore reserved regions, this just won't
> work.

You don't need the folio at that point, you just need the data in the
page.

The folio would be freed after starting up the buddy allocator.

> > We know what the future use case is for the folio preservation, all
> > the drivers and the iommu are going to rely on this.
> 
> We don't know how much of the preservation will be based on folios.

I think almost all of it. Where else does memory come from for drivers?

> Most drivers do not use folios

Yes they do, either through kmalloc or through alloc_page/etc. "folio"
here is just some generic word meaning memory from the buddy allocator.

The big question on my mind is if we need a way to preserve slab
objects as well..

> and for preserving memfd* and hugetlb we'd need to have some dance
> around that memory anyway.

memfd is all folios - what do you mean?

hugetlb is moving toward folios.. eg guestmemfd is supposed to be
taking the hugetlb special stuff and turning it into folios.

> So I think kho_preserve_folio() would be a part of the fdbox or
> whatever that functionality will be called.

It is part of KHO. Preserving the folios has to be sequenced with
starting the buddy allocator, and that is KHO's entire responsibility.

I could see something like preserving slab being in a different layer,
built on preserving folios.

> Are they? 
> The purpose of basic KHO is to make sure the memory we want to preserve is
> not trampled over. Preserving folios with their orders means we need to
> make sure memory range of the folio is preserved and we carry additional
> information to actually recreate the folio object, in case it is needed and
> in case it is possible. Hughetlb, for instance has its own way initializing
> folios and just keeping the order won't be enough for that.

I expect many things will need a side-car datastructure to record that
additional meta-data. hugetlb can start with folios, then switch them
over to its non-folio stuff based on its metadata.

The point is the basic low level KHO mechanism is simple folios -
memory from the buddy allocator with an neutral struct folio that the
caller can then customize to its own memory descriptor type on restore.

Eventually restore would allocate a caller specific memdesc and it
wouldn't be "folios" at all. We just don't have the right words yet to
describe this.

> As for the optimizations of memblock reserve path, currently it what hurts
> the most in my and Pratyush experiments. They are not very representative,
> but still, preserving lots of pages/folios spread all over would have it's
> toll on the mm initialization.

> And I don't think invasive changes to how
> buddy and memory map initialization are the best way to move forward and
> optimize that.

I'm pretty sure this is going to be the best performance path, but I
have no idea how invasive it would be to the buddy alloactor to make
it work.

> Quite possibly we'd want to be able to minimize amount of *ranges*
> that we preserve.

I'm not sure, that seems backwards to me, we really don't want to have
KHO mem zones! So I think optimizing for, and thinking about ranges
doesn't make sense.

The big ranges will arise naturally beacuse things like hugetlb
reservations should all be contiguous and the resulting folios should
all be allocated for the VM and also all be contigous. So vast, vast
amounts of memory will be high order and contiguous.

> Preserving folio orders with it is really straighforward and until we see
> some real data of how the entire KHO machinery is used, I'd prefer simple
> over anything else.

mapletree may not even work as it has a very high bound on memory
usage if the preservation workload is small and fragmented. This is
why I didn't want to use list of ranges in the first place.

It also doesn't work so well if you need to preserve the order too :\

Until we know the workload(s) and cost how much memory the maple tree
version will use I don't think it is a good general starting point.

Jason
