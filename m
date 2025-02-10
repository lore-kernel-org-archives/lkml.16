Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4412325E46C;
	Mon, 10 Feb 2025 19:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214945; cv=fail; b=qhKS+1FWM2LRiJf/7ZWYwVxwJsb7lt33IxrDyOJPZfXAJgGy9zsDtbZ5mZTMCYye6S3w8YBPbbBUl0MrK2BIQp9LfdY/RA9+WNXZstQRfX2ysc4IbTXyVQeQBMHEd5mL5m/oFKmPWWVIYP9bQ8sxl836+Tgo06cDedxtHx1DSpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214945; c=relaxed/simple;
	bh=B0n2kTFI5x7/hI46r5a+ESwldAdXgHpbd7nLvX4xyC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cIqHT5NT0MGT+U+qGJ7ZFAjYecBPlkMPzfbP065qD8okt7pKn8ToJeCVOJrt+WDr9TCp5d1gE8nhKQdYDRiTie1vR6XHRnd3/EGnqR6X2hs2I5Q2/lEepAM3rA/kTsrfZQ1lS/I5C0sJD440IP8GjE0kpl+RykTKNjg3PdiTuC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pm9fmdlk; arc=fail smtp.client-ip=40.107.237.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pm9fmdlk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9SZgmo++jdpzjx4YdWycwWNwG/to1WwNzQKny7UrQMFizDoo5YyTfpBNTLx1akweTdNIOeeBjGMEueeBDu5Ad0QbDF3XroVlq7paNa22E0v/APYNHRcjBrtW+huspv858ZDPi/pZ6VQpoymSBL7i+ZDBzE2ceIDmxM0aqGNNzKIUt/maPNSDUW1szqij9/JxO/TrUN1qi4z5oviOKCBc4RKpp7zzW9gRiK0bRWSN9SPbnHAa5wwZkQpyJLo3mtQmCk9g/NXdm/alxKEM69p1aLuX3Qi4sjTNAnQzulih1vmCtySx/oHP3+DgZOZizwThoXiJIRU7noI8NRHV8wi4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMbwJQcncNRuCF5ruUNedHuUdsNoWdFxyhybKtyBlfI=;
 b=yVXsvoOB3Trh2WyYnd+NrrY8DSWEwgtjLBKs9RcgcjsxPQsHoo5z7fkuF2SPeyJpAyY6gYktKR88dWpUOQm8KyLWa2G6msf3U9FZz2z/bmtCZcD8W8MsljITx2EhUvKNU0cDK+WKlYVA6eUZkTyyMoCu51qe/4Hztm2jaSqwFRRbtg0S0eh5MvYQpiFzi0gDuacWCtuNiT2e3zXytifqn4t1QUSxrtIbzEH+mMals3ck0Eguf5CftC/9TCVbOc6QkOyrkfe73OHupgjqTf3X72itvj0xy/MXBqGc2gSOteR9GtznrKQ1519OKLnTDF9XHStIJfX0eBfNP6EUI8kAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMbwJQcncNRuCF5ruUNedHuUdsNoWdFxyhybKtyBlfI=;
 b=Pm9fmdlkUpaFAGey2B3Zd8GR2DOz1clEoFpMlDVABFqzJ5mVCgvSYX+fKgTyZDiuLJzxPfoDnXXtgk1FDrsuH4h9YP6rClCvp4BQdcV10bIVzsaFv8Eco3cXuL3mlPoLQi+8i37LHnvUyU684UdZ3CaUQpbM8snv6OHWbyvY4pn2mFutEDD98MyCgYCJHquz6rz41bLvY/qPMRJj7f79IdGs8jJry226YS5uuOXGhLFvrbacW0NIbkpfaJWydyBOqwj2X9iSflv5PbyTCsxkgfm4H5tKdSxxAY5CBJSH2N39WS7fUeQD3/6NUtMlXAlnSB1ykr4isTIA2yvlc+hylA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Mon, 10 Feb
 2025 19:15:40 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:15:40 +0000
Date: Mon, 10 Feb 2025 15:15:39 -0400
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
Message-ID: <20250210191539.GA3765641@nvidia.com>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206132754.2596694-15-rppt@kernel.org>
 <45df0d7a-622a-4268-9683-c5c6067483c3@kernel.org>
 <Z6jFZII5b-j7hzkj@kernel.org>
 <a3cca0ed-64ca-4921-bb4c-27c0e06b78c6@kernel.org>
 <Z6kTCvex3DGhB-3C@kernel.org>
 <18529b1f-dc79-4c85-a485-a0a2cdd48670@kernel.org>
 <aa4ec16a-b35f-41b0-92f7-40b3eb64124a@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa4ec16a-b35f-41b0-92f7-40b3eb64124a@kernel.org>
X-ClientProxiedBy: BLAPR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:208:32d::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 2263249e-fb3d-4cb3-1c48-08dd4a074eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hc+34+Ix4wh6GTli800yD7GbE70kCxVmrPj5AbE6VYIhEFEz6ZVJsupcE2wK?=
 =?us-ascii?Q?X03N/cZqspU2Zt1lXrqKgzJRZaXfA3OKptdD4auyRBge8PQGwFJ7PsDqKGxy?=
 =?us-ascii?Q?vo8Wj4KcrF5pTm35RfQc70wSJlaOO99BATOR8BVJDCyBBpuNsBaKPWG3Q3Fr?=
 =?us-ascii?Q?XNV++enbx/67PBzNw0fgKZJ4h4YNhjhxvNSBKd5bvxFgGlrIv6CnVFwlyp0b?=
 =?us-ascii?Q?gMyitaeYoyzw0w+CG6p7MDd2FShvNkFpXdm7jZxCCh/LnZ0uFwuZBXUwF3cf?=
 =?us-ascii?Q?YDE811kC7b8/8q4axLqIfcPSj1QfqVKatnqbww2xwXKKOHhWG8GNlPbe8OI0?=
 =?us-ascii?Q?ynWv61OLLPd2TR7DqfOLEu9eaLKlvR9tkCphS6L+THUxpblL+mhF/eGT9j1y?=
 =?us-ascii?Q?SsmmInxuSSkQ/UuLnEPMD2pdLvnvR6/5N7ZfgjdaNrR0k9eOwjZJPQWhcNIG?=
 =?us-ascii?Q?o+zLbjxsXgSX9IS877M/hPIWZ8kK/AzFgpbdQSIUY/2v2AE1i3bn2TV2HjA2?=
 =?us-ascii?Q?ZPOQVhNW9qVIIptx6WQL7natY//CLP0UoJFSuxWOg3nqFjIaage+Mt2hWT54?=
 =?us-ascii?Q?e2UzJYOktCbJ/poJFQyOZiGVhW6Wuk7NleiDQ89wwMmOVGoZeTbPmLtKzrBE?=
 =?us-ascii?Q?sTigDkD/aLclGKYJgXZdQcXefpU8f87+UBqfEe3v8oK5XwNkb9bvvtiShCi9?=
 =?us-ascii?Q?2T/sd4FVO/L3dKSZ+8jK94Zb8Hmu8sntUfGDiJ03IJsD5iMNamVDdAsqefoW?=
 =?us-ascii?Q?sLHgSwisScZjh5H0oz+gXeybWWpQbG4cLK/iQO04UcVHEYe83zl7VqkuvR7R?=
 =?us-ascii?Q?xcGQ1EuleXRtHSzdsl0lD7ljAJ9i5Qub2P7V7IPtEWN7NczjYzoBQ4Qw/Lus?=
 =?us-ascii?Q?zdoI1JL2AhDAw1sF6OoRA4QPTG7fpPwS4q58ywHC+l0F+38rgyDzN9LtdB7i?=
 =?us-ascii?Q?1LLg9fYsyM5RJMhL+FrkOe4JqmqNujK+Uh8KtQermNjyItOAf2vcH37GXqnk?=
 =?us-ascii?Q?wJ8iA0oQvnxKSZNolxDQEfR+gHgRVGVX6YH8jXQfiGqtjJ9dArdguZEBSCVW?=
 =?us-ascii?Q?hCEJG3MmZa65+EupGK/+wd6Td/NxEqRP9QsktRubfJgw5VAOfjMgT0DZaHz6?=
 =?us-ascii?Q?5ZmQS4zQGvTaGDyrZpbXHhQDY2DpR57NcYfYnggH8VrPXLhipVnCFQIrEJbb?=
 =?us-ascii?Q?1V/8fmFQAEtmEt2Z+Dhcrhv6GHU/8I/23polaYWCAzfkKarY3l5GIZoY6Xhc?=
 =?us-ascii?Q?XWKfeepfiy99Ey/zM+Vpb2TYej816+Gcb11HHjgHYR3OVWzr0h4YkBQUUlfe?=
 =?us-ascii?Q?UDzi65fin8iAjzTbb6xRRtEVCOK+9z44nmFp1wLEcTSCqTNmKH355xwZEdjN?=
 =?us-ascii?Q?htuqeFqhzkt1YIjZpmzuTWI/xjfy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GtrlpOGxZuWDAIUZrcqxcsxqfO9l/w+xUosIGRQ9CWZhEl4c+2aZc00XY+pr?=
 =?us-ascii?Q?Pc9oxWnvUpwstII1biX34AzSVXD8Q5eWllvDRr49ok9OM99v+G8KnaQWrpIi?=
 =?us-ascii?Q?iJyNwoB1+VJlbzd59PwG9lez0FCZRfsgo6jB7kxl1uHvQg1R9srCbny8w4+y?=
 =?us-ascii?Q?+eTs6GyK6ogDjTxxYu2SUcb8P4l5pZa/i8+EpalqS037hMc913cTa61p+6AV?=
 =?us-ascii?Q?AdLVm+Y9orLm8gfOvFDI5urPcJhO/2fpggkII5aZTUXgrOWTvCKFMQlKM53p?=
 =?us-ascii?Q?kMxjgxndZqec3A99ZVfnnJe4CTN+fV0jQ7n+TQ9/6NSsRcQYKk3Edp6ho0ke?=
 =?us-ascii?Q?C8I9eYar6FC7/Oh+W1UBrgh9BT816EGQF0CopmRMuY+0iyeOqHlEdWEOQ6Cu?=
 =?us-ascii?Q?SqPesbqWdR4Ijxnxpyd1XHwW9/ssi5OPudFaDPrGgET+U+5Sij9EZ3Nyzyev?=
 =?us-ascii?Q?b8MLtPc12Ai1uddjk+XbMrLRdoKTEMW4kxryBML8LDHhwT0xV7PR85+JyL6N?=
 =?us-ascii?Q?ja+EfU5BILKWuquRWw9m0KzcS4QDIFX5bSbHyXc0Abvu7kL52SJcvbYE0DI+?=
 =?us-ascii?Q?mQWsaNB0nw5I4I0FIo5qYmbjql53XdDqufMnuImPURW37ObBq/cbOtnPEHmx?=
 =?us-ascii?Q?MrP/2w9GYPW2CmNoNSa+YeNMzcBi77QilHtRSu2BVr8p513VF7OKIaiE+WYK?=
 =?us-ascii?Q?1fkR3esSJqml0SV81/bVLRpH0OR9sz0H+8yUvChHmlx3sGfKEOThzbO5Laa2?=
 =?us-ascii?Q?gcRePBtgZLNPf8qJ785Z4aWfvTmUPf2RkRisRn/8+ci6rjYJFwrZlGGw5kX7?=
 =?us-ascii?Q?gLZdP/EYUvbf1VjYJU8bu/rYA0R48H9fz8v3ydCM4963ZhKqcj62ALONbPjv?=
 =?us-ascii?Q?+HT9cKwyWIyq6Wo2z2TQFJPVysJ36Uld8kbvRd/NmogTy1ZIOBPALxOorco4?=
 =?us-ascii?Q?fEkOPMcDN5xpi/f8W02VPJe5YLTmA3GaGkbuOhopNeATTxAAEqR5t1esF3j3?=
 =?us-ascii?Q?JvEiVdKkbkqlCcKZ2lxpYEyqXL5m0IcrvJHt3miO3ZShXzNcJy+jcmrtQPhV?=
 =?us-ascii?Q?331shrsbnjpLivb9HCzB1rnWSngjsdaN1tt0hM+TMUxQB5U5Oxv8P8BrrQA5?=
 =?us-ascii?Q?QQ9jDr3KrwLArQOGYRO2sfyt5KSeN8S2x5ZZATZXIXP44S9H1L+6tPMkXshx?=
 =?us-ascii?Q?xVCwqo6hWVrfdJCv5LbwYdj+0G7/fksQre5vu1OxoWbj18TYQE95sb4iumJY?=
 =?us-ascii?Q?7gE0CT9sJAKa9+GGz15Ef9ccCVpoLwvbYjRPOHULoud/v94CfEjggPZndlWo?=
 =?us-ascii?Q?pwQRLcsn17I359wE7Ta3lHdiCsPxGaQ4QLVqzgoTyMVVq9HK52mhWSme6CZr?=
 =?us-ascii?Q?aqA0aor242T1yAph1w6BrhH0HTnnm7Piknu2gHXnxpDYaSVMhGAXd7IFelHN?=
 =?us-ascii?Q?ldtWwiJ/LNSh4cChLt3/pROBOZTkHlUePmtDZZOAwondDGpYaKj5swjDGrbu?=
 =?us-ascii?Q?w0SYLgomTN8Ma2w03QRugGJ1O2ih2CUp94PKgJhpV/tF2sq7FvB0+d4+r9wm?=
 =?us-ascii?Q?HSRJo8+/1jeSs9rrCcotX+1p050E2ixtpptXPAK7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2263249e-fb3d-4cb3-1c48-08dd4a074eba
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:15:40.6409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQm2K2IEk/rj7FZKjTVNOfNevkbckGDcsTPGKm/1aVrhpIURrRWOwDfGh8D2Ubb3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5596

On Sun, Feb 09, 2025 at 09:50:37PM +0100, Krzysztof Kozlowski wrote:
> > Ah, neat, that would almost solve the problem but you wrote:
> > 
> > +$id: http://devicetree.org/schemas/memblock/reserve_mem.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > 
> > so no, this does not work like that. You use devicetree here namespace
> > and ignore its rules.
> 
> ... and that obviously is barely parseable, so maybe one more try:
> "You use here devicetree namespace but ignore its rules."

It makes sense to me, there should be zero cross-over of the two
specs, KHO should be completely self defined and stand alone.

There is some documentation missing, I think. This yaml describes one
node type, but the entire overall structure of the fdt does not seem
to have documentation?

Jason
