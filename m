Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4BE2080C1;
	Tue,  4 Feb 2025 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663983; cv=fail; b=HZRw/cMQGaYx3Nn+z6wraLOIibyI1DRiFuSKB8ruBpelZFs08qzt581NzhMLWotwiHTYQzrtPd1uzA8GVeUuyVTvHH5hW0kKwq4k8ypBu1kISyq5OuZOsSFTY9gvEE/YI6Ps0H8c1NoVfdlixAjC3tEmxhhz+tw7H+MminhptdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663983; c=relaxed/simple;
	bh=3UWtOc4D/L5rjSBC4ynkzNvbtn0zyrrzvovDYZzTops=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lfkBU4pzRWnQK80qqTmFD9n5sjcXjz3UuZLNb5skOvMsLr2cgP3sm8BYepQj/wWBZqQV/Ea+JTuX5LPbH26KNZNKrJLKZ8J3d+a47qUNberkN7uGO3z/awE+ujnBA1SRc6sz6wr4rflQf0KewSlIuisAKhjqie0k0aei+Q2jZUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cWNcOrC7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=utKu8Jkj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cWNcOrC7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="utKu8Jkj"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5148tw2L026543;
	Tue, 4 Feb 2025 10:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=i6QymVxxQKFQoumaEQ
	w6shIbfv41c6vb6uxmCcx081Y=; b=cWNcOrC7KOAjjLWVn+rSK1vlq9ocW0n0vm
	4HPodQX6dUAxHeWl2DTHr6mb0tun5SEn2hWiFhAu7kqVJ0yn+Oz9LxJVBS/lyMC7
	Z+8Sxk614WZbErvYCd/msRo9gCieJDZu4tVCaXiO2jUZ58IEB5lReF+TkM635B3T
	LE03JsKnryDe1nyBYbE5s+oYeJqoNzTdQZOr70+PU0I3+53+sHr21LRPBay9W/vQ
	aYRhB752Mh1eDM3iVzLntQLdvuSIbzHCFVxPunkqwS/ApJtH+7EDbCaQJfeXVgUX
	CqGxGMVX5ZFSRqGSQssZTkb2vmdb5JPl/Qu4ZT3Anu92/qLMH55w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hj7v4bmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 10:12:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5148CB2k005831;
	Tue, 4 Feb 2025 10:12:46 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fnt26a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 10:12:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rn1ZbEewSKRlJ/QWk1C5++fPTx5UQtP1NcGcsBvrW5QQH16u6ylQBiASskkY3sZFjgdmL7Bmc97SB9M8lL0zJGS9MxdzcH1KfYEleg3e1CnuGKqo6zKxFCAZy0aKBAwczKleUWLqi5k29k10P/TjDZeJnFibsLKD6HeL6gZdjgKPur5Q6eNymHILvvWoDVDNtmG/pgf4i/O0RaClQKT81GtQRPk9+G0DrDoDq8OvbxtbSZWhaL3x64hZ5AGAW7/HjE4JMbr60faaa9VEYf/8p5FCa2HAl9MDg7QTFPAHgali/T/W5bW9tsnXR2mM0r6Wpop6Qk1TR2GKRpSzY/DhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6QymVxxQKFQoumaEQw6shIbfv41c6vb6uxmCcx081Y=;
 b=XURfNFjLQC9mgP4nTbCKkEnC9z/mwWV1ZmjwR2n8L/SMtB3KppG9x9t5ERLP1VK+KBuAMO2T6jW/kfIDj+fnpPariQcNkH+2RYglQiTTQ8k9s8Lh+O919Vb2rnih5wvk8hj6G1F3VB4ThsDTIGWL+bjy7NizWqGp+BSKugQ6x0wdAe8FobEJ+JulUFXQhYGbCwuSaYr1eSDAGAfz7W2ghA4xhInIjm1V2XAavotLdn9LKYRALTZ/L7MmfwgVj8P9yhcK/rRK4MJZo/Kc43DOGe6+fQBLegGAWvFuumo3x2XoYQWXXcfSdVMB+eV7KpxAjdl+BV2HXmKE9SbPXAeS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6QymVxxQKFQoumaEQw6shIbfv41c6vb6uxmCcx081Y=;
 b=utKu8JkjSXzaM9gMpYfPgIjeHDj1kmE40L8bDMGU6P+s/+BrQy4pZ0i5dxKSPgWrk4CwNZEt6uMlIj/tsFWxzjrPjDFn+11Uc096C1WAgtB6cIt0Ga4m/id60Sy8I/xpnP8IulUPFyarreVttxq8C9mB1Ym8bGXPuLCkP7Z51eI=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SN7PR10MB7046.namprd10.prod.outlook.com (2603:10b6:806:346::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 10:12:43 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 10:12:43 +0000
Date: Tue, 4 Feb 2025 10:12:39 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
        workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] get_maintainer: report subsystem status
 separately from maintainer role
Message-ID: <f7c4d355-3a3d-4757-8f76-94f4303925be@lucifer.local>
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
X-ClientProxiedBy: LO4P123CA0175.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::18) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SN7PR10MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 23fcffce-9bbd-4f51-6ded-08dd450476a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wQLsWXWBrSTeUjwwTCq4+qE4E91i3J5qGYgdsm/lCafw7NFwyIW9Q7U4Vse+?=
 =?us-ascii?Q?5vct26HbPbV3i2ci+9w+VA1I5TLcKWymrumxIb6ZM/t8gaLlRsygMJT5NHhx?=
 =?us-ascii?Q?WgwNgEdvRii0H6qvroGE83T2mM8xSxSCGy0EiZ3M/0/rlRO9ScFjJ28/hSBo?=
 =?us-ascii?Q?aaCUDmxeI/E09GipXGZXLcOev/zMJw8kikdQuLtov++jJxoEqRbCj0Yi7hA6?=
 =?us-ascii?Q?DjJFpcD5XcgDb4yTirC+gWYHzluM2GGWFqwaSHANl9OqZXJaR97VdCWji1WZ?=
 =?us-ascii?Q?6uLDVF+Xh0+zCmF5NqTMejLztxAqWx1l9yWioVmbh8pf7uPuJnWQ86iqweC7?=
 =?us-ascii?Q?0A435ftR86BhBvPAFa8n1dVwv4Kc61GftKPDvn7q1F08oJEoDyiXd9WpOngo?=
 =?us-ascii?Q?4BVLiMN5AwPlg9DbLKPybNVbFfYPcysSW9/5F2+ITN/lM5SRqF9yMe062QN5?=
 =?us-ascii?Q?Jh3mkZyKHE76bLZ3yTxRZHkEABoJ8D9LSONroY2wVgRAJ+Z0b607a2WUR3PE?=
 =?us-ascii?Q?raAKeFnBtd3Orw6vZSu6cdtI32MoGjcr2EhGD7PxLqrUmzVXuSGEbiasgGNK?=
 =?us-ascii?Q?wLRgBGnJkMpl8k9zj4JL8w2yQkSFW6ugu4guqiOaOIOSQ0W9bxljCwzDVE56?=
 =?us-ascii?Q?bJ5xgHwNgJoOh23RT5tr3BBwwoOl4eg9DmHnfDJpWAOy4uK4R45YR6/IsYG7?=
 =?us-ascii?Q?FoiMtJ41i4rKRpfkgGKCQ4pe8nYp9vhyh9kQIhnZVhKLitSm+SiAMU5GoTMa?=
 =?us-ascii?Q?OeskXKtYIgBbgUM0i42nIt9dkdpF6PUM6Ue0+LAlU0XsYLoc4y82N2GNKIYj?=
 =?us-ascii?Q?vG2xFAz+ak6iJ1XWsIwI49gr/Wmx4e81J26aMp9f3PXPMBHz/I0YSLjGOglL?=
 =?us-ascii?Q?PEt38h/23SrPoNfcTXeBRDGj4o0BUiBzsiFMowvoRSRLBQhKAFJoJkOqSlo+?=
 =?us-ascii?Q?emNIG44j04teZu3uWv2N8TD8WFd+oPDzZnVMiCVSyZnP6T61lj894IT3o5s8?=
 =?us-ascii?Q?jazHUnM6A+7R2ZO6HWA/t25TrE29wDN/krJdHzB3zka3Hm/QH6VxdkubJaAd?=
 =?us-ascii?Q?Mdk/hoEPimbUAAtkoLGpfoR8HzKDrAANFJKM+7sXFH5hfCMnwYTEjBEcr2iE?=
 =?us-ascii?Q?rDjeqtSc5x6cpKTesqIlzgvTiIS+zXzWPDZcInP/AUxuvzsIl6ETZv0NHzv3?=
 =?us-ascii?Q?ZS02xZuEB/JkRr8JryixtE5c90z64GSBOl5OtFby1nIkDlOI5C5Kn+p9A8mD?=
 =?us-ascii?Q?l5b79SY+TaKYu5ZQadna22ekhbXd43GjZk4FcR0e3xp1yL4OBmyvKcVnmZij?=
 =?us-ascii?Q?5AjNBZFrtAFAbva+MPpYueXtbjy0F+JIRcuQjFXz8xpaxOu1vYH6J3PDzpKT?=
 =?us-ascii?Q?+BE/HVGdPaK2LKLS0QVSwG3aBCK8p543gVYfkP78h+A4mFBxESmH4PEV3ENU?=
 =?us-ascii?Q?Tr+Bz00j+wOTJ4JQPDSzKMDCWhS+zJRF832ZVdC5rmY9yhZ5b99VCkwbcurI?=
 =?us-ascii?Q?1YimqDJ5ETuVTy2lP62dSpIYova8lrwGfEB1x/lCw2oHST69SdAD+67F7KCJ?=
 =?us-ascii?Q?uzJDdHS9Of3xS7NdwuKbVFwERhr9qwH82JOifnkTS5NlA78cwAWDywmJw/TY?=
 =?us-ascii?Q?pxnMXqY0H4/Pvzta9DMw6TPLIcI6WBfKP+X388X5pXs12Lknu/ZlZlUrdA9K?=
 =?us-ascii?Q?M62l+3Bq5/fkd0xbS/LGpb38a4m/4JOyhGzAZs64MOOCTbFrdqAE/OBdyMei?=
 =?us-ascii?Q?2pJk+NW27nknskP3PvMcfmWoquaAAF304kHQJ+qQuecmztnfes4j2J6lXyN5?=
 =?us-ascii?Q?RtaPWYsexQ+uPGWc47y8Tq/WaOwGwCG4UTG4CheUR/NntoXMd9HSXGRcjxaQ?=
 =?us-ascii?Q?rj/ydovaJVb+2amEOtdDoYU0QQL7hTub1xzFA75M++jgM9K2E1UfrylR4F3P?=
 =?us-ascii?Q?m5frnZ8F8TYLUV9Anc4d6BlHGC7Xi3nQeueYKXKdJw5O0PoK11aHpEdB0JTx?=
 =?us-ascii?Q?acJU/0f2VyiyMrPu6+0wgYzN/wsbEF4XOWEa77kjiMJVUdA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nEra/fHGCzaP5pn9mZepQQIyyeiBTnW46E2Nh0h+DMKpTZlVIA9Ob/vY6qky?=
 =?us-ascii?Q?Vl4Jhpo9UDt2eEvGsAmVN+E4+8x4DKf6zhc0dlhT82qmNAMq65EnRHVpg+wL?=
 =?us-ascii?Q?c7VrzaNchQlzAQJv3aBlQlI8pYCWZodyVko41hX8lAcObAb4bBw5oNVfVYDL?=
 =?us-ascii?Q?co6wJOX5AezbIJ0ysx4BUPkZyasTtNVaPRkh3aNlKAlebo5ThyPpVSy9bYF8?=
 =?us-ascii?Q?cviS0A2PDrUHtwoihJO5st+8WOBnQDxG4HYYpHRoen0GlvGQbP0WKdrB0lfu?=
 =?us-ascii?Q?y0K10l80Xt0CTKofg16UXVmObBVZQEdMZbS4L5bMeNxuHG1E5F/i539QeQpP?=
 =?us-ascii?Q?GyzRFdp/J7IrODnRss+DUWLiPGEqJthyng+tlfdAuylLjxlfYpmcCKywLSwE?=
 =?us-ascii?Q?qK83zAsCSs4jR5TXF+KYEPS+QppYRovwjZrqHwyFbvtU4QjkR8z8JmYfEJ1n?=
 =?us-ascii?Q?uVP7QBG9sKuOMdn4oM79D/4BO30eKx/BPkpxT3YfZJE3gBdp5c0d++rmCy3H?=
 =?us-ascii?Q?6iMzPxPVHp/yzYvXoIU42SFCoy77kYdOPoecSRPPjGq0UpFpYMuJCiGwWeGu?=
 =?us-ascii?Q?aLb0tKn6gyvKuDGLuGhf4lXM1QRvfQ5NNYwXO99DN5rxplgMU3CRVSQyuOnF?=
 =?us-ascii?Q?78+ZBJ6V05ThUiDLXQGQVw3MEbUXOB43nC+4RoKaw6J5tMZz54lCPNQMd+AM?=
 =?us-ascii?Q?bF/hGoDn9izT6qe+dRbhmx1ZQdd8kirMJRHPB3smH3bQUOyM92Rb/VVLICnc?=
 =?us-ascii?Q?/cd81iFn+yMcLPMRhtS7BRsKS+b69LSAk+3Nhpemwv8B5spEwavEJieXiHaI?=
 =?us-ascii?Q?GuMzxUGrA3kr0eGNqFLzMc9P/UOLYB6F53xOoYK4mu15RXiA0D2rviuI3WNh?=
 =?us-ascii?Q?CJbY7hGzJg1+bcEXrSgcO9IGpCGDjlq2PhS2rEQce+NmDlswWZYGsf7i0qfo?=
 =?us-ascii?Q?3MN44GNJIa/e5n4OrK/fHS4mfOiATts73zVltuNvumZXsQEER3in+PHd8sqh?=
 =?us-ascii?Q?W7rOmU5dDh4d5tf9iP8YMLACy45sW8kYdpjiEX5TdiiyRkcZpwF1sRaWJD93?=
 =?us-ascii?Q?ygf9D6xhFyfK7O0rPMpZOuomX3CvPA5jKQSsUJysn2eDdrxaMYk2VDKlaxi+?=
 =?us-ascii?Q?Nfs08WxK6WG4jYzygMH1p31XC3Mwd9ZcskIE9BYjLeEcpPgvKtzbR2JWJ/Ud?=
 =?us-ascii?Q?hPgtZlGGrp1Oko8xjVDoQW/UWWByCoU/Nq7vWm6RVKo+A9r0Mxx5M5UIiHGd?=
 =?us-ascii?Q?mZ8qaKcmd04CRzIcXrlVMuQ3sKQu95l4YUh060eO3mmrowVkY/t5yTv6qK+b?=
 =?us-ascii?Q?o/DrnSbOWuEjcI2Lras+cL1kmHThRp5tmDolNNap6IozwEu5vVs+R254HfnJ?=
 =?us-ascii?Q?PkonL9gYYyQBRRihr2zC2zb+POQtsP86JEAlIIfwuxf2WpkPOTbf78GHvYWa?=
 =?us-ascii?Q?OhE4ueh9z1ZQxot4/qhZU25cPqW51+Pw/vOlu3qN+l/uYqGlSW+sgmSn+Y9W?=
 =?us-ascii?Q?jfADcTaH7GLS45uIvfHpbPzemPOnMwW5XBoAAra8lAhl6ekyJpCP1aaRIOKZ?=
 =?us-ascii?Q?czbqviRCZbyw43eabzt8Dtp+a0X0AsK4dAMQdFwA+lAXXS80rOHYVV8cA+gc?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q4qtox1L/JJl3dk5qt3LLNzza79am0y9sxCIB60c4kJ3RzfHQ5zk9pT4isHGlwjAFqxQgyrJalz9vqJSNA6Sno3VFckuJdGZ43Px2nQQixZhJTtBNYWkyvGjTOyMSmbe8oxZAmzGCeBTX95z5A+LgTCF2dV/KCvApSMyGX5+5uULvk+Z/2y1oxscG0zA0NTDzZ0yEsbqSIzBO9k8e1Qzefq8x/tHB8KuoS8Zw8ZCBcMetZ1Kg/CcmPTgSh9IXxaSDEZjiwYDau6f72sNvv6xSZnpl0sq/KcRFlk5XoJVJpZpqZcGOzDD+4L8RlIcNjliHqYpgF21KDDKZMRUKZ0Yw8rw4wkb0ZhetzddWk+2T7HFPSVRGKW4RyI/1niFclegltRPmtYr3kEL2sJPKINiyVMo7y2CH7WNChUw6uMvM9lw1b4o4GFgITAm8yVnfBx1z7ZtzlEj0AibQLpqNnbbVm1SMw5Smkx0JZDQCz6TwjzUE4xhz+QWNNTrFN5DMsBO7O6ARIXB4vNOX1RM8+5Q1IkE72M+wCAJRe+e9pnU90U9L9D3I+BNoG6D3MpqpK4GuuJz1ZnFK+C3Zbh3k/EHjVmSJbPF7zzWvKB3a9bI7Nc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fcffce-9bbd-4f51-6ded-08dd450476a5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 10:12:43.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XurBE2tHl4zAsw+s0YOYSj7aWCY4B81xlmO7RpKpyWsRL4l5qHYNt98J9mfPZwY5GQhhs5LEu8Ks+c++KZsn4fwn0NFx/67l9VSCnJiapXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040081
X-Proofpoint-ORIG-GUID: 32c1WpKYFiamv4jOqcudYc5JMQVYfbq9
X-Proofpoint-GUID: 32c1WpKYFiamv4jOqcudYc5JMQVYfbq9

On Mon, Feb 03, 2025 at 12:13:15PM +0100, Vlastimil Babka wrote:
> The subsystem status (S: field) can inform a patch submitter if the
> subsystem is well maintained or e.g. maintainers are missing. In
> get_maintainer, it is currently reported with --role(stats) by adjusting
> the maintainer role for any status different from Maintained.  This has
> two downsides:
>
> - if a subsystem has only reviewers or mailing lists and no maintainers,
>   the status is not reported. For example Orphan subsystems typically
>   have no maintainers so there's nobody to report as orphan minder.
>
> - the Supported status means that someone is paid for maintaining, but
>   it is reported as "supporter" for all the maintainers, which can be
>   incorrect (only some of them may be paid). People (including myself)
>   have been also confused about what "supporter" means.

Myself included! Thanks for this.

I don't think it's a distinction that is really meaningful from a practical
perspective, but even if one feels this is useful, as you say, it can't deal
with a mix of paid and non-paid maintainers.

>
> The second point has been brought up in 2022 and the discussion in the
> end resulted in adjusting documentation only [1]. I however agree with
> Ted's points that it's misleading to take the subsystem status and apply
> it to all maintainers [2].
>
> The attempt to modify get_maintainer output was retracted after Joe
> objected that the status becomes not reported at all [3]. This series
> addresses that concern by reporting the status (unless it's the most
> common Maintained one) on separate lines that follow the reported
> emails, using a new --substatus parameter. Care is taken to reduce the
> noise to minimum by not reporting the most common Maintained status, by
> detault require no opt-in that would need the users to discover the new
> parameter, and at the same time not to break existing git --cc-cmd
> usage.
>
> The advantage of these changes is that subsystem status is now reported
> also for subsystems with no maintainers, and maintainers are reported as
> maintainers.
>
> Changes since v1 [4]
> - Change the approach to report subsystem status on separate lines via
>   the new (effectively enabled by default) --substatus option. The
>   "SUBSYSTEM [status]" output felt more and more clumsy.
> - Drop R-b from Kees due to the major change of approach.
>
> [1] https://lore.kernel.org/all/20221006162413.858527-1-bryan.odonoghue@linaro.org/
> [2] https://lore.kernel.org/all/Yzen4X1Na0MKXHs9@mit.edu/
> [3] https://lore.kernel.org/all/30776fe75061951777da8fa6618ae89bea7a8ce4.camel@perches.com/
> [4] https://lore.kernel.org/r/20250114-b4-get_maintainer-v1-0-ecf40f0d032d@suse.cz
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
> Vlastimil Babka (2):
>       get_maintainer: add --substatus for reporting subsystem status
>       get_maintainer: stop reporting subsystem status as maintainer role
>
>  scripts/get_maintainer.pl | 49 ++++++++++++++++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 18 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250114-b4-get_maintainer-cc3358be81c0
>
> Best regards,
> --
> Vlastimil Babka <vbabka@suse.cz>
>
