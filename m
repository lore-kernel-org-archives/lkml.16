Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FA256C9B;
	Tue, 11 Feb 2025 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291850; cv=fail; b=C3GICBAXcOS9UIgEU/+lpcKQDG/+F4MI/fvVOAgUsEBaN/NMqhyAj6MiIdxkMmaHVCstrmAaR7BL3/hbjLbmwyzWx9IYZ06mfPJISK9JZkVEkvCX39bHJZGWVvJASGJ6w7/4ubG3CwXHIS1Bk3JLtnL5TYk4W0QW74QsQLc9ckw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291850; c=relaxed/simple;
	bh=JiiDUaIJbH162bAbUnpcLlGrr2tWYi4KU7oQ/hQrlb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NMzWZIJ1ASZYHsb8dK47q9r87bI2oZFN80F1mlIJspgBwp7Q8xQVO0/+DdH4FlkDID/eWOvfo37tAOyaWIcgrwJDuBhoAj4/jZogCKbS9vQm+1WN/OQZeYkrCYOB1QB0mvD/oF+GZmO+WP5lMq1lQGZ5+RXW3K1poXw6KzWFNj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q9dXDPAc; arc=fail smtp.client-ip=40.107.101.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q9dXDPAc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNkgE0ErGjr6IgcZur3447OVMo1NzhQkFppfI6o2woPHJw3ZIaIXVU/w5vdRNkfKlKjcXp26gJ5oEFeKxxGtnRF3YwmPvZWLna0TfZaP/CaLnP3ZoIzlO7Dl1CM6ZdqRb2+PxMfsZV5tE2fBFz1x5LdE9e8XGLZztSFzDF+Rs2irCl5azNzSKv4nS/TQmxRWUCvccxKk/lYSNNAy1y6WN7pKgkjHaWVCCNRPQyrzKOVjJuC4Lwe0cnUqiGZKTOqmxO7B6RCG6fEGfXD2zrgLCsoC+llAM7jY2Si7pJUVUeeP71NjjRiHOKQvOyJQrYfkHv6JYRTuebBrV0xh6RatoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4ZAffZ9o+WX/fFe6IM8pD+RM8sf+0UDCjX7ldo7nL8=;
 b=vkHSaV18rSQDOYFLjX2iv7LIpc4+/rVCpqpvFdjd751Dtcl3/e1ScREUooCGCtQtxeRf7VfIriVzbmp42QWkCbv/yYlXfiIGUP6hFapfVrMRhOpmIZXsWCebh0clnjLn9N7IACh4kh56xL7cMOjydeYLaafoVshVm6LpvGWyUlJ8i60xhG6SL+cVfc2qhzL1QaEEj+OtdcLwgSEyD0yrvrmQbqKfUObKXZUKIVyGJbMBbj1w6hrddSxgEwtUpH2ruONkbjGk2ups68ZjeKMDoLlmdKXmgOTYIfHmCTEtA8ZkU3lJV5FHyxE9jx7hCGBomqhgekqmflB5GqzHVX2yhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4ZAffZ9o+WX/fFe6IM8pD+RM8sf+0UDCjX7ldo7nL8=;
 b=q9dXDPAcfOcTC1h8m2DmNXp8scpsgg6wRQ5HHePYo3LA8vw5JNhHGvp51tY+Q0aLROy2T2cyn/GpsgCA+MfSdrTircuWTaatJ7fEiMOgM7XG8g+TWfqMC3uBBo5yuZZU2Ri7Qvl0i3zrMSjdYNFu8dGts4eRAQRswkWA/+CvtCL+oB7z02r8Jacsii99TgkqNbVmxt/5nBDeZayBcciI6WKFJK+PcslWFM8fNaiTEZJFXyCXbgkGzYpcwCeI+YRAXaB3TZxJ2xouGdCekz6Tk2nnoIF8Ste7aiKIT4umbdOQDb+E7dqJ+Au9N82Ec04bZC3+tz80aztwyyRI5hVZuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB7595.namprd12.prod.outlook.com (2603:10b6:610:14c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Tue, 11 Feb
 2025 16:37:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 16:37:22 +0000
Date: Tue, 11 Feb 2025 12:37:20 -0400
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
Message-ID: <20250211163720.GH3754072@nvidia.com>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206132754.2596694-6-rppt@kernel.org>
 <20250210202220.GC3765641@nvidia.com>
 <CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com>
 <20250211124943.GC3754072@nvidia.com>
 <CA+CK2bAEnaPUJmd3LxFwCRa9xWrSJ478c4xisvD4pwvNMiTCgA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bAEnaPUJmd3LxFwCRa9xWrSJ478c4xisvD4pwvNMiTCgA@mail.gmail.com>
X-ClientProxiedBy: BN0PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:408:e5::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8ce82d-5a0c-4dab-e3aa-08dd4aba5baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MX5o2klHZUk7hWl+G/pyMgEiHhpvgcKvHh2WPr+wX4Nrq28alC/jUCShP6Ue?=
 =?us-ascii?Q?Lh36c9d9B5b3gsUT3QOrtP0gUXdfR1Gj69WgtHYHBEUv6yWdeeziI7tnhNFq?=
 =?us-ascii?Q?q3jftEoTyNeg+yWYh9QztxdQ8ATXBAKsHUBirrYvX6Asx7rqvC7Sd743CHqW?=
 =?us-ascii?Q?PW/icKM6Q0AeiwvTafscHCuVdeYqwogk45/zt76hKexCUBkC0kSye/7cdeqc?=
 =?us-ascii?Q?625ZL2F3E6qrctPG4YiKPgd2LtIN3OnZhgcKbBw5Cr8bdlMbbXJnShzL+0cA?=
 =?us-ascii?Q?fYFYYQInLuAxLlCwKFdfFy0ByKKVmCG0V7cZyf0woY9hpzxBjn5xcMHxu2MU?=
 =?us-ascii?Q?NbodZuARftUFWJu9B3xmbgSOXzJUQMkZV8SwwbS0uSsHDWxPr9HA2Qzy8uTn?=
 =?us-ascii?Q?40tF0zfLf9drOYrSDvNGLT0Cequjx24FX424iJgdcZkWuyTxecz7ggWX3nNM?=
 =?us-ascii?Q?O8axXVWbhVOtlKcBA7wqWFfwB/aw7Zj7w+jDetDKN5Q9V0maOnGGSxFXZgiA?=
 =?us-ascii?Q?VSoIQGSSufsz4P1ovsQiKswdR8C5hHFI+yyTJGJWXyB69ub/mmPYgJGE6pBs?=
 =?us-ascii?Q?PiQJ+gLsfNS3m7sG5WUneK0396LorRUkCRCqDwzvCKsmXEw0wy67ncJ7MyUe?=
 =?us-ascii?Q?MzVJ4XDTGJy4ILfxmkqdIBUxPFwq73kBuQiLr0LazOKdiM3SeEV5SMvDnb20?=
 =?us-ascii?Q?KOJETL1yKaWdlH011gk//hnqIe/EWL3DK+luuimbUKXVUDztGqaffQQ8OwS5?=
 =?us-ascii?Q?BdnHafYKn5sU0e0VmtLXpk5sqINUuH4HHZgd0/oMeiAS8A/9V8qp6AzxJfB+?=
 =?us-ascii?Q?A+jFEueu/ylugKl37POEe/in0PkeFx4UER4p+b5kLB4qKRYWIcHImSFKKVjg?=
 =?us-ascii?Q?+bQ8zsasSME82qL9Ide4VapLTf583HYgOpwChPq7TwZIMPwH3sEYxS4No30w?=
 =?us-ascii?Q?LZWy2KcT15q/66eGSUpLr9g6cHXeXMZNmweBmjx26YNYZeDjQCfbuobFReBl?=
 =?us-ascii?Q?RXNQO5p9NIYUwNXspCZyeg9vgvOMfrRDXMN7hzur5U4i0mlKrMp+fUTbgb66?=
 =?us-ascii?Q?AgC23VmDso/YAjo8X8MXhIpZUptr2MuBcKf7wrUJFa0hl1BBewVH5oFC77aI?=
 =?us-ascii?Q?kygJtnbOJ7G+zYPMc0/qRLYvQUmWBs5L/YxN3fkuceGBaY9BgqdedLReZcfy?=
 =?us-ascii?Q?t1kINb0VfMN+vkp7tyvxOmKTDjcDEFM60HXWWhhkPV6Z4MB1uReAkcsBKQGQ?=
 =?us-ascii?Q?byqAyNQ9CLjifSYC9s4RWFtP5An8pb4Yq7gkh9MblycbWbKIRVQUYuC36b+2?=
 =?us-ascii?Q?Wvx8jzjxF2m8Q7xWbF86No/32aCKsEA+qDcN2YD/BmyCuh1d/DeAbezH59wD?=
 =?us-ascii?Q?XUp7HP0widoip3ok5iNUYWafW4Ka?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VhYoX36gvLiXV1RImsQuaCQko77tEy6fIeMj8a9Y9OcDqbn/qTFjOzoMQ1oH?=
 =?us-ascii?Q?K4a/YUWOgp41HNh1uQpKTyqSXgYeCQFzTUC0tno5tx03D1v+pg7s60z8B7S0?=
 =?us-ascii?Q?YeFDEsbq8Ux3qksnnM0P5f1qfeI54DCOYc+3y1kD+sk2Aeel+YOofDSru7B/?=
 =?us-ascii?Q?zmj8TVNhU+56SktHlPqeYvqRmEovODIsxado7LAJrIFZqibIJ/QIImx0vMdy?=
 =?us-ascii?Q?De9MUh0pC+VjhbMPrKU+B3sTy/b2blZsMp1ePOkcF+1xO152M7NkkrB5mCdc?=
 =?us-ascii?Q?ms6qsg4MJS9ND8eatsuBCQTNSebpU7P+wkl/4PCaUSMWbBG4zr1Ken/vJClo?=
 =?us-ascii?Q?jENi4IymEVt1IJWlHcUnB6g0824lb79vzhvFkHr2/J3f6FkR7q0A6b6O09jA?=
 =?us-ascii?Q?UmXJ0Gg1nlxTVie5mOUlx0r3KGOtl+x2e+VGweA0OCMqMFQJmgjXc1aWwItj?=
 =?us-ascii?Q?XZilgxTn0Gg8+FrDnTDRBSgXxleq8g8rM4jTkUUGs4nODIokoovjc+dKP+k8?=
 =?us-ascii?Q?zOxZOGlsgCh4rYd8wKcw0k40pR+E+Vuz4UVOIHHtniArNYjYlIQYy99153S/?=
 =?us-ascii?Q?d0tXsVLe+CG3CCnIeyGoIyqlH+AjRABTr4ZDOho8AfB8Gv4zmLiA+sSJmgdj?=
 =?us-ascii?Q?iPrlCDLrSCNNXhzElBgyFAdgf64ua/ZGHulTIiVyscOziDQKMvmjpLSxPc01?=
 =?us-ascii?Q?cY3cw2z71SQ/1t4VRhO3BZQM19DUncYRlO0TWdrTu0dhEzhCxGTFKi8OGFt4?=
 =?us-ascii?Q?rGOUDHoHhKKGZqs8D53TOzppGKnq/yJELKcB+swdzRcBTwsRozgY4MTK+YlT?=
 =?us-ascii?Q?CeHI7HKRlstds/UiBo7HWFcmkK8I8aGZWvrRR9S4lsrYhOpomxRyMUpDZbPD?=
 =?us-ascii?Q?xI5CuqSTbcp8dz+n8r8Y2qAwX/NW1tVSqdP1NgLFsQIXFu7MPbevpajsHhe3?=
 =?us-ascii?Q?Xp8HwBnIewxbhR7o0kNFbd2wkg2N8kJtslcct3V32VAwWWdj+M0tEnrMKGHI?=
 =?us-ascii?Q?1QI0CwDIpYjrjZE+07H9jbH4Rl8tbOEDjGPDrV72uaf/CJd3Q6sQgqpHw5fq?=
 =?us-ascii?Q?pBLl+4FUHKr6Ma0iPiXRz3svxF3muM0V9SGvYJbn2JLs6T+WNOIXpKN4P/SU?=
 =?us-ascii?Q?fK+6cYMe7miAR9DwCdvqH97ac7pTz5cI/rHvZ+43GT9mFltk8aH0BLs4WLyo?=
 =?us-ascii?Q?Z6dCnFlFIn7mfHTVsB+7QRmtK6z8R6d79p+BDEIjmLhJm1R6uMXkYX7ENEPX?=
 =?us-ascii?Q?ZUS9/Yw5em/vTeEVCUGA92vCxdFSjEQxlKH8jc0cEvDw0r/nbktpZKUqxYAu?=
 =?us-ascii?Q?pbkY1F5UmKvsO1TFzhGjotfR7ERoAvM4PDI7RDc+nluECQiUGsdrPzqx3SUK?=
 =?us-ascii?Q?RL4NqDPHXZTWKOytKfzdkKnayKO0ORT29nTXjIW4JfgJAP1X6lCKANjYlW+Q?=
 =?us-ascii?Q?tCRl8YiUDIvP8csZETB9Bc8yB8HFxtdkw7iOG3DXnIJuM+2ZwBmv/+ueTGMl?=
 =?us-ascii?Q?q8BZWh5fS/piD7jJZxV2P45G/Yj1nG/1nHbosklsUdK79gY1z3c6XlPvlR8W?=
 =?us-ascii?Q?hl2BaT1mtBajHZ75f3WL2PUeHx/EHzM1gqdsbn3/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8ce82d-5a0c-4dab-e3aa-08dd4aba5baf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 16:37:22.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfNuhZNUjLSUmGJCm8C0DO1AH5CHVEbCxqDysD2pXl34T6k8rOLNUIXT8Nk6IO1u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7595

On Tue, Feb 11, 2025 at 11:14:06AM -0500, Pasha Tatashin wrote:
> > think you should not add this when there are enough ideas on how to
> > completely avoid it.
> 
> Thinking about it some more, I'm actually leaning towards keeping
> things as they are, instead of going with a sparse FDT. 

What is a sparse FDT? My suggestion each driver make its own FDT?

The reason for this was sequencing because we need a more more
flexable way to manage all this serialization than just a notifier
chain. The existing FDT construction process is too restrictive to
accommodate this, IMHO.

That it also resolves the weird dt_max stuff above is a nice side
effect.

> With a sparse KHO-tree, we'd be kinda trying to fix something that
> should be handled higher up. All userspace preservable memory (like
> emulated pmem with devdax/fsdax and also pstore for logging) can
> already survive cold reboots with modified firmware Google and
> Microsoft do this.

I was hoping the VM memory wouldn't be in DAX. If you want some DAX
stuff to interact with FW, OK, but I think the design here should be
driving toward preserving a memfd/guestmemfd/hugetlbfs FDs directly
and eliminate the DAX backed VMs. We won't get to CC guestmemfd with
DAX.

fdbox of a guestmemfd, for instance.

To do that you need to preserve folios as the basic primitive.

> Similarly, the firmware could give the kernel the KHO-tree (generated
> by firmware or from the previous kernel) to keep stuff like telemetry,
> oops messages, time stamps etc. 

This feels like a mistake to comingle things like this. KHO is complex
enough, it should stay focused on its thing..

Jason
