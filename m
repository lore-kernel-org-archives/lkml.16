Received: from SJ2PR03CU002.outbound.protection.outlook.com (mail-westusazon11023075.outbound.protection.outlook.com [52.101.44.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660442B9BB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 21:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.44.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738706051; cv=fail; b=ICmZRzGP7505k7Efn7yNOipiG8AieEeF4dwTtpL0US5XAHVRmnPRZdFVlLWa9i6wtrg2itA+p+dWgXidmm+E72mizbRiCg8ndnul8KMfQxTdds1j2vAhStX+NvO6nvrW36qB6pSHdmysRUhBYKRWMFymsHXTgyYlPbHNKrFJI/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738706051; c=relaxed/simple;
	bh=aeTho5yIMgY5UB5irls/mLS0dkavZYQJ8fO/iWr7jWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QCXgxNYjlY0KJrnV7Mawk7LsZGfXa5IJMv4enXN/REJPIwoxVQW9N2H/YS2pJbrpBleb+KWwkAOZNEeMUpW3JFF2xbqRk/8jnXcSpB3gEiIumrX3pKzUvQiaGG0XAGtcO5Pdm+ozTI9Wu7zRNLnKnzWrTrQYVt0cc9Gf5oO1nUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=PYmZrTk4; arc=fail smtp.client-ip=52.101.44.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="PYmZrTk4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDmYbTz35SuvA5JYpC04PpLYJ2SGLKTaYZ0/zziKGskh9lwUHWNGpGZqB16pCzU7R6PoYTx644leoXdQX59jBGvZJTpRDcwXqZ0WWodAGWqwCus7us8IVZgXjrftLWf68P4bPsB5zW3ZLNRU+Ecr5ZA22rR9jVEHgynvT4J84KPsLSX2enUWxHqN7M0riKEiIv0BIcW+NQ7pSZKG+cYBecwxmRSdNc58A0jCpHeNfn7NKRYFP+1GTZkdR0VRJ29dIGa1szo7B2w+Z5OJyEQOGe/Tm+ygT1qR/kVtO59kUsy3k+UcukSuQnhl/BiWsJfbM7tNYrDarNPZ+8Xu8WyYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFUWQEJeXbEgj2GN01h8+/ze4Nm5kqoWRTBlxAIF7Aw=;
 b=uSGCpGff8qZEklrfi6+aThlaIdL72EzssBDnEgyZFiad76IdyS/IPPVFad/IXJyqzC9E8r4Uz4fGlEco8Zu1HNVPUpTnkHCNc5V+Wbsjs7myXHXPOidkTfzg88B7pVJfPGar80UTX6+OuSmapC0AhuGHLrKru2CDxw71m/Hs4YXbvF6WGxQocBegS9jDZPHsa0TTTsf3yd35xU2t8x7Non+SyRlpQoNOYIsoMJN383Bj121YfxJauZzqnCSLJwuCpT7/Uqb5Pzt4SovGidwehitgtxpA6KgfB7K6BX5jr/A05J9u4WaP2SBoQ/999D5OzqIcJQYCMxoEYa/0oDzezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFUWQEJeXbEgj2GN01h8+/ze4Nm5kqoWRTBlxAIF7Aw=;
 b=PYmZrTk4xwz7C9xO7VnT7bue87muwcX4j1/Y/No1mfVJ9g4b4QRPa4UK1Zz1wEbkDW2hC0D6qhmY+t/AHwk6MHvHjNasacN0fijkqGAF8+BxXKG/STLl2TdD28gcNCcUA6hJVKbC+FUbW1UbBfANFUHVHOD5fMtSPaYEi5CjDNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN7PR01MB7903.prod.exchangelabs.com (2603:10b6:806:34f::17) by
 SJ0PR01MB8084.prod.exchangelabs.com (2603:10b6:a03:4e7::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.9; Tue, 4 Feb 2025 21:54:06 +0000
Received: from SN7PR01MB7903.prod.exchangelabs.com
 ([fe80::cf45:9855:a64e:382f]) by SN7PR01MB7903.prod.exchangelabs.com
 ([fe80::cf45:9855:a64e:382f%4]) with mapi id 15.20.8422.008; Tue, 4 Feb 2025
 21:54:06 +0000
Date: Tue, 4 Feb 2025 13:54:04 -0800
From: Zaid Alali <zaidal@os.amperecomputing.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com, will@kernel.org,
	puranjay@kernel.org, broonie@kernel.org, mbenes@suse.cz,
	mark.rutland@arm.com, ruanjinjie@huawei.com, robh@kernel.org,
	anshuman.khandual@arm.com, james.morse@arm.com,
	shiqiliu@hust.edu.cn, eahariha@linux.microsoft.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com, ardb@kernel.org,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: errata: Add Ampere erratum AC04_CPU_50 workaround
 alternative
Message-ID: <Z6KMfJVsazO8fHib@zaid-VirtualBox>
References: <20250127201829.209258-1-zaidal@os.amperecomputing.com>
 <87msfbtjyw.wl-maz@kernel.org>
 <Z5lD8HwyQF7IQrEv@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5lD8HwyQF7IQrEv@linux.dev>
X-ClientProxiedBy: MW2PR16CA0058.namprd16.prod.outlook.com
 (2603:10b6:907:1::35) To SN7PR01MB7903.prod.exchangelabs.com
 (2603:10b6:806:34f::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR01MB7903:EE_|SJ0PR01MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 923bb212-b40a-4d3c-9765-08dd45667246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rg+5u+W2aqoNEjBp3ALZPL5xy3e2x8IKq2m+5UuDHZ+CSla9zpkdTb9+nOsY?=
 =?us-ascii?Q?O8GdTGDHUa0jiTbB7d8g1lXUyh2JrJO+h40uj9jb/V9NJeoBAMNvRlcLTjRy?=
 =?us-ascii?Q?W5ubC2c+TL4/obRQN5JGdcvcx47ml/uKLQHQjAnKHdSDywp0GX+UesHsWGTL?=
 =?us-ascii?Q?WQOr8WT1p8zsGjq76sb+dLQzZooo3QZOt8Ts1j1ofeTEJRDBS98MErdCwEle?=
 =?us-ascii?Q?CTJ63chJEX1/b4pxrIhqxjDmE72tcJV4sFJQTtwNcXmrlM0Qb/hsLGer+luE?=
 =?us-ascii?Q?upiVB5aSWvWiBv66LcPQkA5XXLh/DDjnzT0l4xdAkOb/iEJ3hanZj1OFPJ88?=
 =?us-ascii?Q?xXTidGL8XG/j3S0P7abeh7QgigMftHWBV3furJ21zsHf1Ktrx49DcaEVT5Qx?=
 =?us-ascii?Q?50mzexoPxUWHz3hOsurtEa9ZLxVn0V6fPunYY8AnUkIDC+bOVXMNT2B5Ez9r?=
 =?us-ascii?Q?zAprdn01mFs5iiEFpIdhdPfdOH8HmmoCDRxhiJhMpPCMB4A54NAE2SvtDpTr?=
 =?us-ascii?Q?B5R1QyFlXTpsc04YAxLFox651woBMFHNrN+lRYu/J52C6nRSsvWKSc5yjIRf?=
 =?us-ascii?Q?zfijepvebmcFtiBoJuPFOz1BDFIwA4vH84ruAxyxHG4kWEZ2+bJ1ZiTd//YE?=
 =?us-ascii?Q?9/XKRYa91Ev4G+n5D2mRgk4geYn/Xmog4+G3f2x1LruC8wzCyHG/w+0EViwb?=
 =?us-ascii?Q?xug8GoLEHu2fySXaevB/K+zaDpVWWnShdJD4Tng9qL4a+tPdyLrkCnexsdbd?=
 =?us-ascii?Q?awu/LJRtzhhj22unwxivFQCimKCah4SOwkd273EeMsyr4n7b4bBssvqv43nD?=
 =?us-ascii?Q?orIzPr5Et6Qyp7A6MCXRlimFpPogWUOvVK/yPkl6NeDKjrpG92yGMTEijZkM?=
 =?us-ascii?Q?204XIkLj1cnb3JPBprlpLGz5nKZHLSKs1AwF/MHgeUoNL0HUEdZ//wkdfQZw?=
 =?us-ascii?Q?BkfVH7DB1tSdVMa03r2O2pEjligR9gbBQEKFYTclNiu/A1cnRqKdGUgYF5X8?=
 =?us-ascii?Q?XBEACXeP8faNPzxMSE9pyyxTAPHt9OfM9C8kUI0hqIIsPAV0s+//HpMFeWg1?=
 =?us-ascii?Q?ALKJ1kfMVhfqx/FijngmI+6oWOkNvRf3QvePgk0NOg77XDesH96fS4N5F+Ju?=
 =?us-ascii?Q?H7ST5mDkiCz6M66pfTJZHhGHJtpw28gLeUIqR45oMWj1ZoEIwwzk2A1LEL0D?=
 =?us-ascii?Q?T7EFMjGguNbr0vttvstKWwlmuK3KSm2RefPamWjdYEARGP1e11hWpoZ8eiDN?=
 =?us-ascii?Q?Q9feRk3FXnR0y0h93iXs3acT/9l8sCJYGAphnDu0yHcY/chSSh09jp2o9YhA?=
 =?us-ascii?Q?fYzGOJKvY3zWCCDmL2AUbtSDVM/RA2xmLwRtxGSSU8q26Si+9ZGkRDKkhO0j?=
 =?us-ascii?Q?OAC9sRvGRegnFjktJgmCNDyyapD4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR01MB7903.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PgYBXkz6kLaBtTmykv+eBeEbTgCUo3JiNJZU8jeItJEmbT/Ua6j1PNsqlC9n?=
 =?us-ascii?Q?kWi1wRDpoyG3Lm/NS+rIyjBFZpKfdOE+gbpyHb5zK/teP9hpn1DDNVw7B59h?=
 =?us-ascii?Q?zXZn1jvUZHTyNTZ37jOyaRC/6pq6zF5+qaZ/pPkbJFgf1azAzU4a0ptAT1Hv?=
 =?us-ascii?Q?KPY7hVeMmJH2+NLDRIAEkjLFHKdHtnvx5Ewm+toXWnfJOJkAO9vtgcdfW7nr?=
 =?us-ascii?Q?FVB48wJDuVWlLOM0/qrof6AOuO0lOF58c3KLGICYSyXyLse73MfgyZrjM0R8?=
 =?us-ascii?Q?G/a4SI6Oa7/v/QFC+hCyQnLVuDsNeltrDcHLM5FXML1wI4k/rosTUSudbKHw?=
 =?us-ascii?Q?ojOpdqU1yKD2hc7br/bQ8A7tYJsqlF4hqZDDPDvr7iiJ+hqPx4okAvY/KKDY?=
 =?us-ascii?Q?PI2AP3qzxNq4uG0x/Rs2ehwQ9Jjb4KB5xuzmAkJMbMGb8XRGvBtssoL5vzBt?=
 =?us-ascii?Q?0t/EqVLeVzXpmCAapgZUgAY/Aw1dymCrxrPZ2MV6BCcRPHHv9huwADGJI9aA?=
 =?us-ascii?Q?NSjWdTdr1YnRGWwGOvLP5TEzdaHZld8SGQkKg1lAc/xmJxDDbzhfmuF1wY0K?=
 =?us-ascii?Q?wMGReKy2JwwhpmIqLHYolAhgmOlatWkT5eu8x3dAmZyMPQcGG9PNvBbZjo4L?=
 =?us-ascii?Q?IsG4rcAEtTd1CJGTB9uggkQoCCUa8xPfyfJY591uXmS0Sn2d9Ice9QJPKw1j?=
 =?us-ascii?Q?F6bGRVaNUwj0wxO87rH6D+fzE2/z7rNxYy9Y1xWKEzKmYtu9tTOoudxn8/Pg?=
 =?us-ascii?Q?Vaeq11HrZXCa0xgQcIYYxM3mW8TnMehV+nO3zF5qpbObvhn9gZh+MaJ28mII?=
 =?us-ascii?Q?RdhYH7FI3a8XKy4AO1Ch//EqMVxmIOCSkvTyTUygngDHZs3ru8BfZCw7GDG/?=
 =?us-ascii?Q?hRX+ADORIqGJliU23d7P1U/OR3iDssHQTiGdax/lFZ04i6VwHJQSzH+zUiPK?=
 =?us-ascii?Q?6qsE2nH6asJQPHrJwoIEwLI6t8UshO/IXoqPKDGCRGbloRoNS1HjxmsxuJvM?=
 =?us-ascii?Q?ccD0AJy/bSXzxy15D9BWO6W03TrQ9OpYr3u9j1vrsW5DHn6tZJLHomtJ2tx7?=
 =?us-ascii?Q?RuzAjaRoKI9UeE3cpI75BlmMuEvbp05Z2O5EDosdYRrwTnrzb/mb5XeqKj7+?=
 =?us-ascii?Q?MRMf//O7EomMnMm6O2Xw9yQNhNskilQ31X2AowvdpKbjnQgSmWxUYYjl7gjb?=
 =?us-ascii?Q?aZTgDAvO30ZwleWvWtXe2e1iSVrChnd2VxeoT64f/z4tH7XRZ7wQLpU7WyDk?=
 =?us-ascii?Q?Di2/uqAZuGUFBjWlPFWFVqhZC8+GZNnh2nCpnDgE3tbjwZg3LHjF95vYR6Og?=
 =?us-ascii?Q?y7YV0kn6WP5EZnwHVcLvpEkKJaaBwKdYFOuhpg3Y1UKsyEF8Zfrk9BVPv3k7?=
 =?us-ascii?Q?ew5yz9EZa7tjAohpO12nxpcfhcc7y4gU7dAYiCHuz3CKppRWMVccOfzhYu3g?=
 =?us-ascii?Q?M4wDc7hWyjPamwxzJjEhQZJbx9jrruMK8QLB9Y01Os+I5DtjQzTs34kvvsmP?=
 =?us-ascii?Q?vrBpXqvSdJ56ezpEFa0WibzSb+ElzZj/vSzxrgyBQCbrR57e9hSOHgL7/Nfd?=
 =?us-ascii?Q?InXJ4xJYVRKNoNu5fvP4PVjy0Fn719ZMFj6YdpheiO0MN7rMwviHUvZTWwJl?=
 =?us-ascii?Q?F9C7zJlaLA9tf/8wY/GZPGw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923bb212-b40a-4d3c-9765-08dd45667246
X-MS-Exchange-CrossTenant-AuthSource: SN7PR01MB7903.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 21:54:06.4095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+adKQO3tDYLAtw+Sgs58lfA/09t4/hNylUTYtIE+ot21ZeL+JSZKXxXJ8LUn+fUtxJ6TY8JWIWIbyY7mBCYSHQqkc7op6Z9shRep2NCXaLrg2Xv1CmFdgQppHnV/7pu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB8084

On Tue, Jan 28, 2025 at 12:54:26PM -0800, Oliver Upton wrote:
> On Tue, Jan 28, 2025 at 08:34:47AM +0000, Marc Zyngier wrote:
> > > +config AMPERE_ERRATUM_AC03_CPU_50
> > > +	bool "AmpereOne: AC03_CPU_50: Certain checks for ICC_PMR_EL1 that expects the value 0xf0 may read 0xf8 instead"
> > > +	default y
> > > +	help
> > > +	  This option adds an alternative code sequence to work around Ampere
> > > +	  erratum AC03_CPU_50 on AmpereOne and Ampere1A.
> > > +
> > > +	  Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
> > > +	  direct read of the register will return a value of 0xf8. An incorrect
> > > +	  value from a direct read can only happen with the value 0xf0.
> > > +
> > > +	  The workaround for the erratum will do logical AND 0xf0 to the
> > > +	  value read from ICC_PMR_EL1 register before returning the value.
> > > +
> > > +	  If unsure, say Y.
> > > +
> > 
> > An alternative for this would simply to prevent the enabling of pNMI
> > on this platform.
> 
> There's also AC03_CPU_36, where the CPU goes into the weeds if you take
> an asynchronous exception while fiddling with HCR_EL2. We don't have a
> mitigation for it, and it can be pretty easily reproduced by using pNMIs
> while running VMs.
> 
> So I agree, disabling pNMIs might be the easier way out.
> 
> [*] https://amperecomputing.com/assets/AmpereOne_Developer_ER_v0_80_20240823_28945022f4.pdf
>

We prefer to keep pNMIs enabled if possible since it is useful, and we will send another
patch for AC03_CPU_36 to fix that. If this is not feasible we can send another patch
to disable it in both AC03_CPU_36 and AC03_CPU_50. 
> -- 
> Thanks,
> Oliver
