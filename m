Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3248B1EF0AB;
	Tue, 11 Feb 2025 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278190; cv=fail; b=gHedNYndP0/LEQXEJimd1MgcHM9GBxugosbu1x/2y54+BeOMYXTQR/U+FDhg5kGbPXezZBZhwpkcmhiR/42uRH2zTSpnUN9RB0UCT/6cuFPqd+1RgCo9pc4+vz/4fAZTLrQp5z7RoQE0PfwXvJehLOtBD4F1f6AOgS/B8xVXQhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278190; c=relaxed/simple;
	bh=riKEEFLYsnEZw3AS2yZx4Te1Rv+Fg1PQ8qBMjjc1TPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QPZIMF56Jop1Fi5qdyIuUSyOVqW9TpQbcUvBZot1y1VdkOmQ/TrGtZIO0n/AyOe60cGTOcgaA9Qcs9ICqb4XxgI30mAQg+9J8CnChioBDVrV48EGkYw6knWOOYM1MCIdGH1iOABgdLlEGRvkycQYq/4GHBFZdE+h5VnPps8veyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DmuDnjNN; arc=fail smtp.client-ip=40.107.236.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DmuDnjNN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3bsMgkjU3Zzg2b+JDFpjE5ChSq0cdzDgpL/xW0OLnc24zvZSlKZixmckKZn1D/qagNtKNZAZqr4Sdy06MPgxVA78/yEDN8u2yRXhfcU5B7T/4KGsT970iJipZXMZuOimcnxZHsUuWumyUFTzsyrwhbVnk5s8/uEZW9r2CmJkd1MuO3SMoGGskf7DuSJ9WKi+k3e2QysgrPeTnwjqb9jHEqgrrInkmpIuoz+RPZgmRQ85mFz5vrFcdcSeKLGSlds2cpiBUIWpMwge//sEPYHD6c/+DrOSz2AeY1IbuTyD5qR8ahgkwfSCg95TNUrgJ8ixjtHv1jMiAOQLMuD+6vVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiE7tFytNMTRF5FkajuOGS/ZwVKyDN9xCyjv2QzI3r8=;
 b=Yr8Io4UK30j/JgUQba27g72L8oBDLo1jbGy+jKJzvEVWizTb8BUNIU1nEf2Uy9EqFE7WMkoB5x/GSCPYXid35GXWS/j+v5q6k0WB5JFSWmnDcTB3sqWZWiloj5E/wCwHLtmZQsun6jBaQp0aiU7CRBhplfoeF14sOa4rsX9oylNC7BofS8Z2vVwDl+RECzBWi4KztqEft5wSwu5aASYOPpv8Ds5bmVuM36oHnboeJiRh8+1QB71+MDN73Ai9Dg/Ea6fNWjICcXjTeTKLulwZRAUhcsyBh3ZQMUyJohBxX/ifSDhKhUuAuixJXUjfaAuDR03eWs9a11lNHPvss9aXVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiE7tFytNMTRF5FkajuOGS/ZwVKyDN9xCyjv2QzI3r8=;
 b=DmuDnjNNxqWNpKAFLPLKiYRlQKl9Z9lfj83Ll0I2RaRP1YlIiDnYsqE3DLKqmWefEPU3IHOS4pNXBO6GxOfwubE4NyECK+CLgEfhxFAnvI6aQuxX5WNkKpBzoP+TlDKuw5X1YMwAO0fqijnE5ijd41M7g8tGE/0i/+Eky1kxS8CKGKK1Js17X2s/bF1Q5yMHlnDuePNZtJL2dA9q+PAPLTEA+hqtIrzaOgaT79YB/7xJWK9yH2RcX68Sk8ooY1pMoBKOF/+xMnS3kyrl+ak6QhJ1VgdaPRQlDuHPHD2vZU/9xX9vYlYgK50kkuahsyMYMqelqrb4MHfz00+c3EHK1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4406.namprd12.prod.outlook.com (2603:10b6:208:268::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 12:49:46 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 12:49:45 +0000
Date: Tue, 11 Feb 2025 08:49:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 05/14] kexec: Add Kexec HandOver (KHO) generation
 helpers
Message-ID: <20250211124943.GC3754072@nvidia.com>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206132754.2596694-6-rppt@kernel.org>
 <20250210202220.GC3765641@nvidia.com>
 <CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com>
X-ClientProxiedBy: MN2PR14CA0001.namprd14.prod.outlook.com
 (2603:10b6:208:23e::6) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: 0559a28d-3438-4190-0a1e-08dd4a9a8f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xsdUIpbID8BlgSNxTKfJzue6RyYjZOjOaXSNLZGxNP72tTeMKulM3TGuMkti?=
 =?us-ascii?Q?/zQw/D6U4fM0kDP+i+JgIurYOt+BEgCZm4Co53EwfUKfyO0RK9udj/E6oEi/?=
 =?us-ascii?Q?u+f9CtWtbGPg/LSgKxWp9zE/VTTCAnoUCTOnNC4t0Z4f8Ob1WaOhWVP48lzl?=
 =?us-ascii?Q?VVpFMDE3kX0FyoeQblnvjdzdL6WxNcFjyilb98kl9TF4rWV1D3MSW+7lOElz?=
 =?us-ascii?Q?pmY9NT2bQhsCWCZcElLr9enmdLVweILnZ8iZnofaWv6g61lBtGtcr/3Pl6+T?=
 =?us-ascii?Q?8DV39krAcu6FDhco3ro3HDbRE3qzhjeBd49x8eHSXgTBQWhVB6KWjqDSa/0O?=
 =?us-ascii?Q?OZ9oW+WWGf6a03ac4sLT6etRyEa0PbJrXeK/Tz4+X/nR9oN5VgqUDoav05tL?=
 =?us-ascii?Q?5R/rcip/LGe4r9kXiMi+WnEvof5HaAHKyW6LdX7j3IGQcpYMBHeHGSnSGoRU?=
 =?us-ascii?Q?/9lqEXng9N/Nvceepby9l/5ZC+JVtb64ew3Z8xL0/09D63L3r786pjv/n266?=
 =?us-ascii?Q?+2NfHuPOhH0BzGo+HEDFGQIevRGQPCG4O49HOiiiiNFrxDJ0cly21vxKlAiT?=
 =?us-ascii?Q?ICsq17M2oqf2NS9vPWvxvWco2qvytETdAVj8wd5sW4mgYcejb2VRBPeXmo83?=
 =?us-ascii?Q?DX/ICOKSY5zqdi1BuJJTkfH3dC+ssiv7EvyfstssgHbwnFQ+p0ETDxI/32LU?=
 =?us-ascii?Q?XRTveuKxwvQPovtBIrl8pDPCi8pgSdxbGWf3vPpAx0BClv/ZEJchDzT5yrFd?=
 =?us-ascii?Q?bLRqoNdGKLA6ZCpcFvsvFLGXObkh9Eas76/N4w+fFWKssn1WZ5lWadLSQ8/H?=
 =?us-ascii?Q?6GI6reh+2fBWISt3eFylYcw0CgxppKhPs18PD0KTy9c8WbPg5zx88eybP7oh?=
 =?us-ascii?Q?BiKOylXRj6q/gA1jWSTF1tA6TM2vRjXugABXgTFY/DXKUCZpaXe1NcCaDe0F?=
 =?us-ascii?Q?tI2rY3yRj6l1+gS+8AVcQ4EsS9PgCJBRNupzE3oMX76bCAcSlwHeOIg+8KWU?=
 =?us-ascii?Q?SGHkHd7o/gqfLmlUzHwe/OEHmKi6wOJIyEUBck957zjos0kUVcLht+pYjNaZ?=
 =?us-ascii?Q?bYeXO2PimrqW6h95ngeb/s3FcqvVWLHckYJSritqJeoiGAA/DwP7LD7aNm0+?=
 =?us-ascii?Q?mBfZGALOrwZalNtUcDv79ksmc+SIVDvP5dHO7uxYKxyvzG8VifZ3Up8NWnkU?=
 =?us-ascii?Q?D9k7DTtVJk4N0nBU6RWGuKxb1xs29HMHQwsiJ97i5EIKyGwTmO7t+0eNCSKS?=
 =?us-ascii?Q?mrQqwCK0YtkUuzL1zYSZ+sZLsf1Oe+pgt0L8Un/DwMHjHOzOX1fzkLCobS0Z?=
 =?us-ascii?Q?Da+z7UCPgD9o+sqWm8OCuytMCBwF9b6Ix76nmAEM1WioztI3Rg0o0NRMDXTN?=
 =?us-ascii?Q?1/ofhZzCsXi4Ivwo6V8/yt4zpXnH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9eF1N7i5lat33Kfl63Wai8IbYglp1WCfA3dCGzw4gALPHhPieuG5lPxnoRK4?=
 =?us-ascii?Q?eb/3zAu5iauGEbkxtfI9K6RWSr/+Ma7uk8dffrWZTiUqhNI3reExWaFWxG94?=
 =?us-ascii?Q?SUFSOwl2HUo5Wdge4wghBFA4cQMX2rENmocjYw59I1b260obwgNNzI8h6U59?=
 =?us-ascii?Q?dmKn9MO1l+z7ax2KjzgyP96cLF4jLqpA3rgZqJMaUe3wDy3oVbVVnCKXXNze?=
 =?us-ascii?Q?bVQpoRAO3aXlRyGxBft28smNvUMYr/xCigB4KrlRuIHcUrYKA44wn/R+iQ5B?=
 =?us-ascii?Q?BNWAOcp7TWWiKrhPWVa+f8faMh3N9EBdsWSywiyE1m9HiBi9AGJs3MnnjEwE?=
 =?us-ascii?Q?BSZ05Gc6zyWyCQqkK58Ugp9A7+4KxLS5EVoWTFQnV30d4TkHtp5zH1c+vVKN?=
 =?us-ascii?Q?c7O7mdDTFwO/KiF6GazNyNw0070LJOTDQtaF1NzROU6/huz7axbaJd4uu23P?=
 =?us-ascii?Q?60XKhWOrFEYS5lGmYfhYbuoYAdL0O5ScB02xTvl5/mZgjvfyHxe59ixi1gxA?=
 =?us-ascii?Q?T6C1KuUi5WO3a2mBjg2DtyaqHP8X2IxhV930QWhuVwyGJ0MQP++x02cgEtJj?=
 =?us-ascii?Q?cyHWBJCy9JR5FCTM/fCxRfAvvH+P4nYixfvHF91ehxdlkvjif67hqXUZSwoM?=
 =?us-ascii?Q?kq9MYjnryV6iCTEuuBLTL3zTeHqYpMa5r6ivIPH4qcdjgkA0DI7QdAzjNOKB?=
 =?us-ascii?Q?+BKf+gXzEyNdNOaAd1JCfuZ/+twJ6Vfyy/s/LH/RnrEvMehVhD2Ik9BEsrIF?=
 =?us-ascii?Q?p6Dy/FhpYzp9fBkO8M6Tx5a8arLG96n3QodUax1pp4TISKEV0VlvwWX7NRX7?=
 =?us-ascii?Q?As6VcKg1T8gzOa9pG4R72qCCtp2hTRzxzQ5J7WaSo0w8CwZNP+tDsS2Fe/O3?=
 =?us-ascii?Q?pFqhxVbnZVi9MGNeKFchl16i9FYl6PuqAu41g0qW69hsu9UaoRMeY8qaK7YJ?=
 =?us-ascii?Q?vKuR4FYbUKQqOrAcz7kUxCwCe+Iv/ilNmsHXAD+Nbau4J1Ndne6Fd2Gc7l+r?=
 =?us-ascii?Q?MQmaazPZdhO5Uk4VmcY+90J1rHOjK3i3bB9AXovcsKuCVy3sbSa+ozUlGEIT?=
 =?us-ascii?Q?ru+y6eF2KutqgMVMRnTXYHu51JXht/+ocMp4slvLpWGAJcsSTm8jRmhxUmIi?=
 =?us-ascii?Q?Rf+/Y920K/TMvK/G8T/ni9fPmhxdMG8UDJQXRFcg9q9Z6lNKHqg1IuCVk23Y?=
 =?us-ascii?Q?y2FlDGHNY9yTfTXgMyR/yly6yTo7UH1H3NuegW9ak74w+Ym67JcppiVTIPFC?=
 =?us-ascii?Q?hPeUz9MjbYWwsuaCjY7+Zg2Cbqa7btPtkvtTIiUhuet3ACSkRTAcrvEcZuEJ?=
 =?us-ascii?Q?18n5sqtNw0mjgl7oRIurxrBMKfloYibvBFVoTbhLm/WLZOimsvk0vh3N7YXe?=
 =?us-ascii?Q?4iQs6UfNUHJWFW0/gotq0uEKi3+w0hAPF/6ghtpUNZ5CFGbDteqNczrH5DjI?=
 =?us-ascii?Q?3/ihsvxjblGGLmCtZjNVhN4jcWJu9RwQmJnUShqjAuTr9DfAulDlb0zKNLz8?=
 =?us-ascii?Q?rZliyp4gNbVWQO/ogtTHhLQVwmTx7kp4n+cqrBkWxUmuVUJvClryMmrZdx1M?=
 =?us-ascii?Q?PGFdBz+JO9l0pvha90s=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0559a28d-3438-4190-0a1e-08dd4a9a8f92
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 12:49:45.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlF6Dk2FW340ATLr37zsXxqFelZRuCYi+bFQ2dOoGmvoFxLB/0onn7Ut7ZiS9AjE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406

On Mon, Feb 10, 2025 at 03:58:00PM -0500, Pasha Tatashin wrote:
> >
> > > +What:                /sys/kernel/kho/dt_max
> > > +Date:                December 2023
> > > +Contact:     Alexander Graf <graf@amazon.com>
> > > +Description:
> > > +             KHO needs to allocate a buffer for the DT that gets
> > > +             generated before it knows the final size. By default, it
> > > +             will allocate 10 MiB for it. You can write to this file
> > > +             to modify the size of that allocation.
> >
> > Seems gross, why can't it use a non-contiguous page list to generate
> > the FDT? :\
> 
> We will consider some of these ideas in the future version. I like the
> idea of using preserved memory to carry sparse KHO tree: i.e FDT over
> sparse memory, maybe use the anchor page to describe how it should be
> vmapped into a virtually contiguous tree in the next kernel?

Yeah, but this is now permanent uAPI that has to be kept forever. I
think you should not add this when there are enough ideas on how to
completely avoid it.

Jason
