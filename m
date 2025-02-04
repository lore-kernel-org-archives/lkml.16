Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020077.outbound.protection.outlook.com [52.101.193.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89135142E83
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738705575; cv=fail; b=HnY0ZrQnYmLqiOf2lFr4RsONE3IfOavRro6WfMb0xw5qQs8q0LkQZttEcWX1hTIuDoZ9rI0X4t3upP3vK0Zsln1TerCrkbqQqFKIsOYCkYU3pssz94cw/bk0jMo281mz/CREvLCk1j8QXVU1JEFGxxxCGgi12tcsSkUnRvZo1Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738705575; c=relaxed/simple;
	bh=cjLUnZukNFK67v552cYnXoUp8EfWrVNPeiDqDqWC2Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bTfxLIlDtpQixAzjnSTV+EDkhv9QydP6yN11kL6bYssqJN6P2vopps0ohyx8obJKXFyp+MMGOGbbUtUdD/aDQaVBKh5aDqQ48Wqz80x6CzNQ6xjEHGBqoSQ6JFyhfkAuK23ETYkvid8XX3gOySNsfQg4tis6N8moSczIXNvAJ48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=ViIrnagb; arc=fail smtp.client-ip=52.101.193.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="ViIrnagb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzHIDcdYrJYqwm2IcTvKJfmprfc8CzqHxfE3LOG9Ou2VXdKY3PWplririR+CyegPLdlLKC2P/gjeVF4//5PLuP0cTGkDEG6l1ncmmEAetqr+VEbqaYC+2G9BvqlOVU9uhwIbRDIakNMsVovTHhMxN0sr34DjFOrYc4Cwf3uXq4E7t0el5ThdQsdWI5nQ/seK2BBqxuSrp3k9rX+W7yyA/Tz5eU0o8njA18yArQRxw2nmJ/GX7+s43v2xgFX1Q7TwQjMOrRJ2Sw0M8myKs/qP4DToA0o0ho3qLQmzBT9iMOI8TTtlP8jWBMHwg3uZrAX8zweSCwROnEicxI2aKUB9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QYi4v468Z+DeRIrtZEB56m7jQUUIs8XQkTPH+PRdCA=;
 b=xgEPPJTnReW06PQRRorU4b7/fiQ/3ZQ67AwuJn0XqGkN10TmW90Ww3pvJZZSi00OsBg8bIq4egkX6xa5R6siTZJac5G8wdY4GA8A3R2ZA94IobZRSl7CAlN48hjFyj0S/fuMaO+squPKotFgND1DB8Ml9e57KpvvYw/+H61yDUP/+LeyqrrhYBPlXqTX7uOHQHChjGB9BFTxFpKMGaQ+8vnG0IQKuU2LSBXGIcXrni0EpJfwCNAES0VRceXHDfQqCyrm1F6R5u9mBxRmx2n8G60axhB3RVlXtC5p/dNmvFJYvm2Dkoy3Vz69ALzrSJaDMYS2UfkWqo6bAg9XuWi+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QYi4v468Z+DeRIrtZEB56m7jQUUIs8XQkTPH+PRdCA=;
 b=ViIrnagb+PF3CjNiSwMWXQ2PZXpUUK+yLYPUa+OIoQNPeIGTfr2D1WLnYYsQAheNwATuf0s7qMG2mfZcCVJxW7XfnAk3ylc2aK+xaBtToQPQtHBrpjXKN6GRj/f0mPiIjxJx/BQgKsMtoyViFtggntKTgvTjzpDA2kV2y2BmPVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN7PR01MB7903.prod.exchangelabs.com (2603:10b6:806:34f::17) by
 MW6PR01MB8381.prod.exchangelabs.com (2603:10b6:303:23a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.11; Tue, 4 Feb 2025 21:46:10 +0000
Received: from SN7PR01MB7903.prod.exchangelabs.com
 ([fe80::cf45:9855:a64e:382f]) by SN7PR01MB7903.prod.exchangelabs.com
 ([fe80::cf45:9855:a64e:382f%4]) with mapi id 15.20.8422.008; Tue, 4 Feb 2025
 21:46:09 +0000
Date: Tue, 4 Feb 2025 13:46:06 -0800
From: Zaid Alali <zaidal@os.amperecomputing.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, puranjay@kernel.org,
	broonie@kernel.org, mbenes@suse.cz, mark.rutland@arm.com,
	ruanjinjie@huawei.com, oliver.upton@linux.dev, robh@kernel.org,
	anshuman.khandual@arm.com, james.morse@arm.com,
	shiqiliu@hust.edu.cn, eahariha@linux.microsoft.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com, ardb@kernel.org,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: errata: Add Ampere erratum AC04_CPU_50 workaround
 alternative
Message-ID: <Z6KKnpB2IwO9GAYA@zaid-VirtualBox>
References: <20250127201829.209258-1-zaidal@os.amperecomputing.com>
 <87msfbtjyw.wl-maz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msfbtjyw.wl-maz@kernel.org>
X-ClientProxiedBy: MW4PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:303:8c::13) To SN7PR01MB7903.prod.exchangelabs.com
 (2603:10b6:806:34f::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR01MB7903:EE_|MW6PR01MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 68baad39-4410-43b1-2a76-08dd4565562e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8AjAt8zzHsNsDheaAYwONUY/QVSNEQbfj2bFPfqskDZ10Javw0wvYoVn2yBj?=
 =?us-ascii?Q?txaf/qT3Ks/wdF6jKYC2/6TFP5WWzcQudxjyAThGy3UYdamUYfalOKI126iW?=
 =?us-ascii?Q?5XA2quxP9tKf1czpfvF0V6DyV5C0Ip/DOJGp9cHkrhksD+3fqcP21Ex0c1cE?=
 =?us-ascii?Q?TLleAonKqCWpxFmSyFMTralDoZWFpmlUbYipzxvo+V+rve9RTHjQHcaXIN/w?=
 =?us-ascii?Q?B6u3u9G3VAJSrB5Eqc5uhTM9cX48OuyS1nDJICN+ZVkLHXdpSg9jYu4C9bfl?=
 =?us-ascii?Q?tPNFa50Wt0KUdB4afkVMyMy/BSW01pVQDHk+QqA5XyXGiFRONy/hCX70+kL3?=
 =?us-ascii?Q?gfqpoJLwDK3E8hXbcqgvHPBQWOlycYGHpVj2/ifXT1u6y3WbvkgAugBJu/a9?=
 =?us-ascii?Q?Q+c0caapVID31WKR8ms/r6OPngMOJaZVvouyWaiO9uY6nod81DrC6Yxcz4P9?=
 =?us-ascii?Q?ZtoZg7W+3rFPlh+2E6Ayh3C3Edsxr7oc/onYO0xbjkAuBNuedFWRQaZQy0VE?=
 =?us-ascii?Q?WvOksJ2DL1G5MjVeV6WAo2uTG9Mn2zNwYT0/VgmmWfvDpb3b3waa2thLNToJ?=
 =?us-ascii?Q?zQ+C7/h4JHm55gfuzvpvSYQ9xipqAUHu1Dw3KWjMPIycHIo6TVP5HxyYgYp3?=
 =?us-ascii?Q?9pZv2eMKwqo1SvdUG761dj6B5SSxc87EUMflPBY77ag2oRtHsN3WU9jFAEgh?=
 =?us-ascii?Q?Yb+ff1KGbu+dGcMxdUqm+i+mu78r+39Igi6vU1GtySxUc2MNdCG49xWomf0u?=
 =?us-ascii?Q?OeoIu0boYuppJjAp434ejvPNAHKSIi5wuc8Yzr7tZh0LRsfVwg9uJi4LI1iS?=
 =?us-ascii?Q?tl64cjpAOMHSxkwo0AUflAKSQHErxu/gmkyi/IRlN1Nz87zt8FVNEIlUVfmS?=
 =?us-ascii?Q?dLdegeYhg+Qe6FSo3Wz2jEUlRaelj2O6DCpdzfjFT1Q0TdhArCyCTj3ozsXy?=
 =?us-ascii?Q?sVd2OYIsI+LALUUY+miLnH22xuY4+PczajFlsXZEaFsswNscUuelwOZ+wDXt?=
 =?us-ascii?Q?QXoMd3Oq3sGHSKMdaqvp1iBbnulj7bCqip5jboex2XI/i9e3g7eBQos7CSfJ?=
 =?us-ascii?Q?kDHtQM1/wCftXVhDh3mr1sxC6Q6stT+WrZUos3CVPiYU95SAomAOyR0387vI?=
 =?us-ascii?Q?9jjHqr77hTnZ0DZ9uHlvKu6X0gFGf7k88nqqHYEkz7oBOMghqB/Hi676TxP4?=
 =?us-ascii?Q?VPKueOdXboyWzg81ITacZtOw0neNHUMutPgD2kGUc26tgNyTYw24JHOOFMgR?=
 =?us-ascii?Q?IFzoHskRZUdsLr+M4EvJv/583EqA8JcDEXBsTUxq9yHn7u/9Hc26I0gkMDpS?=
 =?us-ascii?Q?jjySsiK5+vFxapdwwStuVKImfkKtf10czjQrGbJixxnhfII1MiPoCVSOI0pJ?=
 =?us-ascii?Q?uKxf9TMhycY7hb2Gq9aQKyD21aLvwb21oCPUHV/HEu85VzbF0nVkfFFMYKPz?=
 =?us-ascii?Q?b7ipyMHuOQJxAWeP82qKm+ngOAYZSzTo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR01MB7903.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iwQWSASXRBM1k2g5pFDVQrCvKtZioAqMi4YtaOD3m5Cr3+6bVWy5AtQnPRRL?=
 =?us-ascii?Q?qPp5SueAo12H40bABYebXoC6InDNqFA5OlV1ReGR4GzrSWiQu+6Q+0xC/n5T?=
 =?us-ascii?Q?W1nNOxOPeo/2aTq1tMSQKnH/rOMToZEs9gG+IRUMgPF5Gzn73doGspNJrOn7?=
 =?us-ascii?Q?cnFtESzw3sconhgSqS3g7IlBQL7h2kDi9TarOx74B8loH+7JqUWy4d5lxj3g?=
 =?us-ascii?Q?v7hXksJONuOB66QTAG7hYQ7rq9z+1lYrHRNIopgO6vG2vN2Pr202Yn3IllOf?=
 =?us-ascii?Q?luYKrLEgo8DsRwcShF6koUSBqopRJBtF4Qug1Yo+JpdSBh/4iDkqPPZ3RtR8?=
 =?us-ascii?Q?ZavEFibFQ8R7pgvfoOI6K3P3CHscIWZzXh18zP5ywY086A/hyLtJG5D1/5iC?=
 =?us-ascii?Q?OB43Oh0C0Kca3qAUf8tjN5u9Xo3d8vkDA4iwnqXM2Uqv5nBD10hDbHyUSAn3?=
 =?us-ascii?Q?fQaHkyGFsEPI1HQPXxGvnsRiX4d42AD8H+V9oapnoIqKpXlKx8EZ6H1EoOz7?=
 =?us-ascii?Q?UsLqkwiLNmtvPkVbyThG4t4LVFuOj/lZqqUfJR1qSEVSC0YHBlE7f12cU1UT?=
 =?us-ascii?Q?mXe10mGGXeS8/SjMoEIXC/CGACusvrcKKtX8t51ixEs+86v4mWSomo7UVDlJ?=
 =?us-ascii?Q?BfKKlubBXREAkPX+y7DnAcetiQaXMVdrOJ7/H62BtZFzUcBFlFuQoKoh7GPX?=
 =?us-ascii?Q?nmTl3g/w3Jp8ZuLuI7W39UH+QBx9lP+ptq5TIo1mN5D8yp0g8dFYYXrN0Wja?=
 =?us-ascii?Q?RPvPFoQo2TMoGYd41+2LG89j6xWWFg/wXt4mtj70aA8qTqBgBwH26NzOdW8+?=
 =?us-ascii?Q?bW55VPDrg0bwmloIAoTlBDQUVcGS4G3oOjuWknszu1F+RXSDA7IezQcJm05+?=
 =?us-ascii?Q?Ek2ijjApW8bjG/g7vK5hw0ZuFkbtWP8rQlRQJs4993+EhLOLTtBGkNOW9QWY?=
 =?us-ascii?Q?o8Zo04KtTYUm1cRPEzzc8P9jXQi2+QoiNRllZmpoXaZTVZuHDTFkPymS4Qt+?=
 =?us-ascii?Q?k7cMLxAbpHGpajE5g/VdsUCRpfxWfyNAju1gBc1f5f0pDdEHmdF5Its5GaRx?=
 =?us-ascii?Q?ykz8T1QGBLzLLH5rhEDWHPxVqp80DXJ/Q0gELEVuOegp2vMQte0+w848Rxn1?=
 =?us-ascii?Q?6LOCTTvkleyuffXQ7DXicYX4cZgcqoIE6W32iRb4vtjZa5xRqogprJcy+tZD?=
 =?us-ascii?Q?9lW0ZmJ2ANxGxjUB7P/uLLCKDY6N+nb7iqMWDaVOIUJMNWxanaLR5vmVVvr1?=
 =?us-ascii?Q?FWPPhdaoL3j2xqxwZu6GyGlB/mFkPn2GHV04uEDlUEOQ/oavygcgadx4o9cL?=
 =?us-ascii?Q?/t55kb5WcQbRlcd1yBPRGX0ahElqR3Y+QD5WJvhPTl6GUfXhsEEjsQtbmdAq?=
 =?us-ascii?Q?awIk25EKq2SZIJCfRnMJawNNDajy4jjsp4PMB0Q9ZK2DgSrxzUSXhmKN4FQ3?=
 =?us-ascii?Q?bLKQ5KEs4iBgJUE3CwqUjnLq3zzLD3vE0+ZoIuix59E7W5vH8gA8WjA6BqIt?=
 =?us-ascii?Q?GvlzIWQFSs9ClbSllqvxJEmWfcp/vg4vd/TVkF769Pa6JanaIHdfbZrlUatN?=
 =?us-ascii?Q?mav+wRwlzQbsC99h0JFH4pnLEImfeRMI31/nN2DsTn0WjKB9V+6KifL4iKkW?=
 =?us-ascii?Q?kaJ4fFpnl2F5m3aPW1TDLww=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68baad39-4410-43b1-2a76-08dd4565562e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR01MB7903.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 21:46:09.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3v5xsnmNxim2X+aU9Jd26eHZ/JXBwtfbpJ+PWp+L56tMKL1qyyVyU+ySDFsgPcgK3keqF/r343vAhVKUXm1hvPZDd++bfePY5lY3JmQTPc1vLw/gIiW3UexT4T3OZABp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR01MB8381

On Tue, Jan 28, 2025 at 08:34:47AM +0000, Marc Zyngier wrote:
> On Mon, 27 Jan 2025 20:18:29 +0000,
> Zaid Alali <zaidal@os.amperecomputing.com> wrote:
> > 
> > Add an alternative code sequence to work around Ampere erratum
> > AC03_CPU_50 on AmpereOne and Ampere1A.
> > 
> > Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
> > direct read of the register will return a value of 0xf8. An incorrect
> > value from a direct read can only happen with the value 0xf0.
> 
> Under which precise conditions? Does it equally apply to virtual
> interrupts or SCR_EL3.FIQ==0, for which there is no non-secure shift
> (which I can only assume is the source of the erratum)? Does it
> equally affect G0 and G1 interrupts?
>

Hi Marc,

This only occurs when:
When SCR_EL3.FIQ==1 and PE is NOT in EL3/Secure State,
and ICC_PMR_EL1.Priority==LowestPriorityImplemented==0xf8 (highest priority is 0x00).
 
Does it equally apply to virtual interrupts or SCR_EL3.FIQ==0?
 
Based on this Defect (AArch-21735) and our implementation, it only 
affected ICC_PMR_EL1, therefore does not apply to virtual interrupts.
It also does not apply when SCR_EL3.FIQ==0, as no modification of 
ICC_PMR_EL1 is required. Automatically sends the unshifted version.
 
For which there is no non-secure shift, does it equally affect G0 and G1 interrupts?
 
When SCR_EL3.FIQ==1 and PE is NOT in EL3/Secure State, 
and ICC_PMR_EL1.Priority==LowestPriorityImplemented==0xf8 (highest priority is 0x00):
The ICC_PMR_EL1.Priority read returns an unshifted version (0xf8).
It should have returned 0xf0. HW shifts the priority and inserts a 1b1 ensure
the priority is a Grp1 priority. Should only be visible in HW.
 
When SCR_EL3.FIQ==1 and PE is NOT in EL3/Secure State, and ICC_PMR_EL1.Priority==Grp0:
This issue would not occur. Returned value would be the highest priority, 0x00.
The returned value is correct as per ARM.
 
When SCR_EL3.FIQ==1 and PE is NOT in EL3/Secure State, and 
ICC_PMR_EL1.Priority==Grp1 (but not the lowest priority):
This issue would not occur. Returned value would be the shifted version.
The returned value is correct as per ARM.
 
> > 
> > Note: Currently there are no checks against a value of 0xf0, and that
> > save restore of 0xf8 -> 0xf0 is fine, so this is all future proofing.
> > 
> > Signed-off-by: Zaid Alali <zaidal@os.amperecomputing.com>
> > ---
> >  arch/arm64/Kconfig                  | 16 ++++++++++++++++
> >  arch/arm64/include/asm/arch_gicv3.h |  2 +-
> >  arch/arm64/include/asm/daifflags.h  |  4 ++--
> >  arch/arm64/include/asm/irqflags.h   |  6 +++---
> >  arch/arm64/include/asm/sysreg.h     |  9 +++++++++
> >  arch/arm64/kernel/cpu_errata.c      | 15 +++++++++++++++
> >  arch/arm64/kernel/entry.S           |  4 ++++
> >  arch/arm64/tools/cpucaps            |  1 +
> 
> Please add an entry to Documentation/arch/arm64/silicon-errata.txt.
> 
> >  8 files changed, 51 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index fcdd0ed3eca8..8d6e263d66c7 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -461,6 +461,22 @@ config AMPERE_ERRATUM_AC03_CPU_38
> >  
> >  	  If unsure, say Y.
> >  
> > +config AMPERE_ERRATUM_AC03_CPU_50
> > +	bool "AmpereOne: AC03_CPU_50: Certain checks for ICC_PMR_EL1 that expects the value 0xf0 may read 0xf8 instead"
> > +	default y
> > +	help
> > +	  This option adds an alternative code sequence to work around Ampere
> > +	  erratum AC03_CPU_50 on AmpereOne and Ampere1A.
> > +
> > +	  Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
> > +	  direct read of the register will return a value of 0xf8. An incorrect
> > +	  value from a direct read can only happen with the value 0xf0.
> > +
> > +	  The workaround for the erratum will do logical AND 0xf0 to the
> > +	  value read from ICC_PMR_EL1 register before returning the value.
> > +
> > +	  If unsure, say Y.
> > +
> 
> An alternative for this would simply to prevent the enabling of pNMI
> on this platform.
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
