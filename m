Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C325C71C;
	Mon, 10 Feb 2025 20:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739218845; cv=fail; b=qeUebeZWsGFrw++BztK/MAkEaU2WdzeWGqcWyhilq36zYf4JWtj1/Wthi9gIImfkBnz07iazrQuRqpzqNCY3qa4XkDWWebMFADHVHAThBqTIY6G56DQAG9t4oZGnmNlle0G38bYZ453XueNyuzSSPSWdvDYewZT5Ub6ouUJbK24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739218845; c=relaxed/simple;
	bh=Lk1B5fe67j5U+nDh0CNpP9i1yGwXKlB27NWVOzQ3zXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QG2QtewxkzfoFeBuG8AuP/fef7l+Dtzrczhwl71FDo88rCeHe1AwdQTWwVhDqUcfqe2syl6NLDMdb8vUjgwdlVRLGc00NZtoeDzqHIzMJbrjVo7FUiqQsUDE2buPPWZpNFo62+gj7AxdNzncxjOS6f1uptOi6MvnObqlkmITqmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YjSA00S/; arc=fail smtp.client-ip=40.107.237.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YjSA00S/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk2K8R206cbtQLGQfhNxmoeKzMxc2YOJjvCcObLh4iqafOs9gi5hmJDGPbeVeQZwWWL00GAPt8pIjM3q0mXAxPLBZ1ucW8w6/Ce4wkT6sYYJNJ0NV+8lhc+gqJsOZ4wpU1kEMGqFjBpj9tvjcq2WBPT7Vmn5kpkQUJrZ9UpiFTHDtVK4xFKGuNrBgGM79k+REr6GZt6292EqdfTJ1Y7kGlyeELjFnB/9r6cEkfZHGq0CgrB9AFjZfmOh9rW52ksbdxjap8taGytArNqvrBd8FP81lM6ZYD6N4S8W7OkfZtmC4GiJbj/kbBswhytzkXX3rkvaTe5BN5B8F3aD92w/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FSMv/AUmGjO7ZpqwKLvZ3IVZCAI77rVL9ViLIjDkgE=;
 b=CQdTz85WWqfmr4iNgiY5DXiP3AhIopKnDe+elWN4OGAaWX6qdMeO3gJb3xRTNO4rPnG+Qf6DipIM1H4wT4bqgMfgQ0UrMiWWrMW+FAFrhw1L59U6Bj3ILsbGeYpzcXbhduCUdBBDKeQzUDeka2Uwicpml+HrHY+LC9UsStjF0oY0N9hhqgxBaslnchedFLAon4cOTpEHV69LYLgOrfchG3pzMRp1kyuPI8e0MXTSdvaVKvTwasaFc4X2M19xYA5HP1okUfcvNHZW+gMuu8Z+n2/fubYAtOavuye4r1AXh/Y+cDCvZd8/Y2htgMVlgSNUedpxQu4dYBSy8ei1DudWyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FSMv/AUmGjO7ZpqwKLvZ3IVZCAI77rVL9ViLIjDkgE=;
 b=YjSA00S/+ahBgctjhVDeO/fmo7e9X6Rvl37q33XYLdL9fdhto1xj/fSBD7ISIn0d3+9LKFBjyu+wKtfN6sPlfeVWuMueVSma8/YXycfWEcy5j5CbbR2SfQYguiaiUMqKDjN9m+296VWnGTpYhyoSPFCW2vxYRmhZ3ZOusWFMY0wYBFK8lc2oq03teoxGRV5txFwc9RJbzQu0BVt+WKL2OmiRFG90y1FJFQD7Yx6Jxsznr24WUJe4Zlts6+1WyZRjl04JA5Zp7SdsqHJkCMnMjN4GM0Lri89X6sEPrbeCITWm7FoL8z8gB6PyIAs6w3aq8Y3lHuC0noREYB4wICiPQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9183.namprd12.prod.outlook.com (2603:10b6:408:193::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 20:20:41 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 20:20:41 +0000
Date: Mon, 10 Feb 2025 16:20:40 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
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
Subject: Re: [PATCH v4 14/14] Documentation: KHO: Add memblock bindings
Message-ID: <20250210202040.GB3754072@nvidia.com>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206132754.2596694-15-rppt@kernel.org>
 <45df0d7a-622a-4268-9683-c5c6067483c3@kernel.org>
 <Z6jFZII5b-j7hzkj@kernel.org>
 <a3cca0ed-64ca-4921-bb4c-27c0e06b78c6@kernel.org>
 <Z6kTCvex3DGhB-3C@kernel.org>
 <18529b1f-dc79-4c85-a485-a0a2cdd48670@kernel.org>
 <aa4ec16a-b35f-41b0-92f7-40b3eb64124a@kernel.org>
 <20250210191539.GA3765641@nvidia.com>
 <2fe7a404-be2c-4ac8-8980-2b3d07a74bca@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fe7a404-be2c-4ac8-8980-2b3d07a74bca@kernel.org>
X-ClientProxiedBy: BN9PR03CA0532.namprd03.prod.outlook.com
 (2603:10b6:408:131::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 94796401-89bd-4112-b838-08dd4a1063bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B9LGuDv3r0Ka+5qNGRZYcjQkoqvEOACsU2D7rJvUFtmsq8Klw89/A5QeduPM?=
 =?us-ascii?Q?UeMfz9pdTVRuUn+M4BQpXH4cziiMe9ogs4u/YCJDFALsG5JpQt0QZjZRArsy?=
 =?us-ascii?Q?FIK0CCPtEAzNw7x+069jMQEqYtlpfcxdRmbXM5ZiLGoRsUr4Aysjwd5h4BC0?=
 =?us-ascii?Q?y1AOaoZdQm8enCkbe3osTVcpO5Mnfy6d4EowbjBi3rLZ/SG8nua2p76kHXWP?=
 =?us-ascii?Q?d5Wdw0vtCWnSsNnn1Uk00vqMexVrdQHlWIPGivAIiXxcUEcH30PjQ20gUAVD?=
 =?us-ascii?Q?LvzHj3bZmt0YkCnNA0NRj0bp66NEWKnm+Rpo8VJRaYQmsUBeTcZpDKMBrcxJ?=
 =?us-ascii?Q?fdrHAW/DDUMLVd1CXWGZLWWmmQ33AupyDgjcAVrCm2sNwpymKxfGBWQv3Svl?=
 =?us-ascii?Q?UNTtRMaewCt87pduXIHrl9/HkzFIjlcIMHNZByTGxV5kvetaxBm4FBwXNYLb?=
 =?us-ascii?Q?Hc9ZYpcgw+MAkaieYTyfWzIiQmMQoB/fVqmpHd25TWNy9NNGh/aRr6ME6OWs?=
 =?us-ascii?Q?iyqV76oILAmqYqzoFbCVNLkn3xnCSaTJKv0cbQ+uZl+j/GaBeq9mSVcCVkJG?=
 =?us-ascii?Q?ZW47cDUYHFjkpYcUgAQ6e/OYYhvDxWrzHMG9XpKWxdUnh1YDXoralVxdnfUx?=
 =?us-ascii?Q?R4rlZ5Y3ODLv6lxVUwOpBeESSOGqqu8EchjC328KVM+TjezFB57o4IDX58DI?=
 =?us-ascii?Q?Es6QMvFYHFr44ixiYDnzahNtxCf9eafw1PtozomrEcFLu7qlaaV7XfDcPVLX?=
 =?us-ascii?Q?kSyHG49Npk8AdYH+J5qleuTZVQybmqGfB4/7xxnhWCz3EWvHTd8wJkeM1n4Z?=
 =?us-ascii?Q?QMBy/kHpmMogPVvknBUBAGiO9lRElKR9PSFtXBhHiAcBqY9a1kzSzzXxAFb8?=
 =?us-ascii?Q?VYA+AUeS7U0USH6eW69usLAy3wtgSbDXwQj/93wa0VKzoN7I8BZ/N0OY1jPT?=
 =?us-ascii?Q?COO24lHYzt6yxfHd7RXvOJ5/T6iugnizU+XWeVGIg6g/IIH3CxmDZk3rgCmw?=
 =?us-ascii?Q?JEzuVTKpq2GujO2sQgkgn8f/CsvS1JZqbJUJ2usmXwVdr2U2H6ns6iDpJRzx?=
 =?us-ascii?Q?ne8M1UHcly4cJFMhRd3jt2LfBnJr1AcC+tLKe5AJVQ8nDTah76c03OZihCAE?=
 =?us-ascii?Q?xGlfWA2+YylZELTP1QvlW0KnPhrrX1Ph5pqmy++1RPnDJYimNTyLLX+wUxKR?=
 =?us-ascii?Q?qko7JKeizXkkC5OSfr5v4LJZo8KDqtc9H7gh/vR2Dos2GNEP4LPnwQMYNTnC?=
 =?us-ascii?Q?Pd1vuYmUDbTdbKM6x+NzEcFqoFC+Fcn0UWTj8oqUsN2a61RyYUj4/BtBXyZe?=
 =?us-ascii?Q?skPCN9+bfkZMgXZS7liZlpfQnzDJw3mTALXxBe2wtlA070xtiyWeJ7FTDO5x?=
 =?us-ascii?Q?0xBNhsnGGGjrs3j3p7sk6L3dW4Zo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?16Mr7aqEo/5ScYcKvBTBEz0OHIvU9myhMBd+RveEETUb1JWmEJkRTaEc83Ub?=
 =?us-ascii?Q?KkKffb+UnLA3UopxOsxdDNU7ZbhE1HOpzA183PHQ8LjqhbTobQcpICUeC+Yn?=
 =?us-ascii?Q?ksqNYAg6L5sf5HeIBxJfbAVoXJ9VmCvRwt7k+tHwRNkMvYijhth5xssLtPJn?=
 =?us-ascii?Q?BjYDL+xmzy3vim2T1EtJS3kch5VHij7SBrmvLORLQawgJ809mcpY2wB5LWit?=
 =?us-ascii?Q?C8MtEqWBuNUYEsSogbR1Bw5Iw2Bcug/p4P5JgsF0gWrCuSnkueAGFKsqZEew?=
 =?us-ascii?Q?+HbHtfjAoCLq1ayynHV3JA/jJQsfLOoTSiFTFgeQkQEN4V8T92qFLIFuhdV/?=
 =?us-ascii?Q?Og/SokmqciArW6FxWwnGxh9HAzKawx7soTPNI+JeH1RdqTdm26L8+tPMouNI?=
 =?us-ascii?Q?HVyTMQphsKafCElyOMk/i8l5Uw4H2hN4N5txsrh3zmh5aulZphE9mH+6G1lf?=
 =?us-ascii?Q?W8ygKdtBzclQeQjiWUHQsnNToLl4BeHXzs4w0BE8ZYlhArZkz6GLgaqKeYjf?=
 =?us-ascii?Q?7/BzZH0iBo/2qlf1i/KB8K/72fiG3BbKIPSdd/pw4zWP2rvbo2zdXCYijO9h?=
 =?us-ascii?Q?9mPx+lWSfyfzQC6RU+v805d9gYXLVAXzyGfLylV0/DVI1LoASXKZvdKrh5n9?=
 =?us-ascii?Q?UUYaMnR8A125+Y3iWJajFw0TZF5DuMqqfOte5PHoHTCrriUZNa141diGIik0?=
 =?us-ascii?Q?3ji95rTYtzJU0QuueiORn31rX0D8MdQWDXOQnrlH94P2rLoZNFRUEe6rXsC+?=
 =?us-ascii?Q?NlVqvjKf2Wu+iPT4lFGxoYK7V8AWELMeW9S8gGcKBRTkJ4TOIV5dGtZWIl/o?=
 =?us-ascii?Q?JXYfSI9Um3/zf0VTl4AtH/4fQMWHxhr17nPAt2+az0LtSXApovL2N37Q4t5D?=
 =?us-ascii?Q?rQctQRzCQttMGlUQ5BwIhXeHoLTmz/+hgVWmrY4oj/hu691dpIYXflCsRHY5?=
 =?us-ascii?Q?VmgyogcjxzrGk0A1STQXW/FEyBcLAHEgSMiRKwKiIDusiu+4OcTkyWzMkr7t?=
 =?us-ascii?Q?qh4KmW18vbMf3kDNIiQEITcmGg2Clb+UYdAmcNFApF2jIgPlPy8Vhu16Iqog?=
 =?us-ascii?Q?VgXy2ND+8bi1NNTe+r+oHVsyPBPFlLOBtFz/pzCyibGyhJi99pdfTvQt4h9i?=
 =?us-ascii?Q?1ngjJy4x7i2h4giVF+Nl4NxBKzesNoat6jlMQ7Jg6u3A4be4W9kgJVLVhY3/?=
 =?us-ascii?Q?Mx5HySEIykDkQdTIlCIXmWi5Nf4oFSjsr98eKQ6M5+y8KCjQ7RQOaHPOuwJ9?=
 =?us-ascii?Q?oY4nOl2iy9Bby8GFkeUoagd41o2f9iqZCNdkaFfs6GiGKnJ2x1IWr5UIlOQP?=
 =?us-ascii?Q?mf3lrq6W7tUNC8Qwn3Ly7qL4DzG3ZV89GvBX/whFs4ljO9RNFBpuAWgtazk1?=
 =?us-ascii?Q?XyqtbfQKYbY11Lc18FRuK+QBaDvM8oVb7p0i19e1pTv5a5pAxVp4gUgAuxzX?=
 =?us-ascii?Q?rB1+fx5i1KzwmDTx/NVoFULrI3Iuoj+wZPPMJiutW4q2ENPy8P/r6wRfsgwb?=
 =?us-ascii?Q?XYzK8pFdy3j1kSDzotqsE0MZszcowvocdhtmmybxsOehuutNw+ZllkmgLWso?=
 =?us-ascii?Q?TVZxJ+ad/239fNCtF50=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94796401-89bd-4112-b838-08dd4a1063bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 20:20:41.1770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3W3EkXwi6WX3q+zrG0mlwKYDVbZUjYC8iIckGavzBGEyyEMW84CClgAHh/VqJIN9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9183

On Mon, Feb 10, 2025 at 08:27:34PM +0100, Krzysztof Kozlowski wrote:
> On 10/02/2025 20:15, Jason Gunthorpe wrote:
> > On Sun, Feb 09, 2025 at 09:50:37PM +0100, Krzysztof Kozlowski wrote:
> >>> Ah, neat, that would almost solve the problem but you wrote:
> >>>
> >>> +$id: http://devicetree.org/schemas/memblock/reserve_mem.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>
> >>> so no, this does not work like that. You use devicetree here namespace
> >>> and ignore its rules.
> >>
> >> ... and that obviously is barely parseable, so maybe one more try:
> >> "You use here devicetree namespace but ignore its rules."
> > 
> > It makes sense to me, there should be zero cross-over of the two
> > specs, KHO should be completely self defined and stand alone.
> > 
> > There is some documentation missing, I think. This yaml describes one
> > node type, but the entire overall structure of the fdt does not seem
> > to have documentation?
> 
> A lot of ABI is missing there and undocumented like: node name (which
> for every standard DT would be a NAK), few properties. This binding
> describes only subset while skipping all the rest and effectively
> introducing implied/undocumented ABI.

I agree, I think it can be easily adressed - the docs should have a
sample of the overal DT from the root node and yaml for each of the
blocks, laying out the purpose very much like the open dt spec..

Jason
