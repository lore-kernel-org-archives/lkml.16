Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40972B9A8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745177530; cv=fail; b=GSgknAbZcCVxAJdKEJ9/dhIW5oXIZ+AnReJ5l5B9xSHWLuKx4iGUSETGob0PL1oua6Nl++h18zXGexEz9jymQIHZaLSdVecoEPQdClX4dfs6EcKYI4kOh2TBq1p7ueF81cWEBv+rSrCg9hBgdUKKPClzeHUjsQtryxX/LHH0g7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745177530; c=relaxed/simple;
	bh=6Ge9n+c51CGvNf7qopZUrFqrNrsBdozIQlyQwTnxQa0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=T2UZQelLKrQrduFyM8P07QR0gY5UCZ7rHy+Xm/Gkq7OnIsTawdCq4hn8x6SW84gg6+1ankYjC36E2fREyc2VkwtkxK7utfsSOgcPNsL20fH8sA7Wvny8NG/RPsQR4bc1hTcuankpDB/Ao1CmxGfUh4Hi/XLiPzsQUL8hJuOiZyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=keRdTc1U; arc=fail smtp.client-ip=40.107.244.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="keRdTc1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQylIPAb0oSlHUWaiIwn5OYZV4W3KUk4rsBWRA6D3LRaBhtSTF0SPjIs4k8MdBJfQePdXpsWBl9MRzhELLU2KQT5AIKkN35PDjCfU6flvEHXUzKwkWKqZKUhicnPBI1OG36iMTfQCQAG5/iO2z+0uAOL/b+yuPy+l9wzCue3++HlUUA5Ewhd5pH4EngnnszqbTXthWJMll5opypAoROQ208GaH2o1T4EhZs6go1Qaqc3FBzQfJaq2fDPGI6v7PjKvov6hc4slSO4NBc/YDodinWMA6u87KJuzP8AUPqttP/CCf//zztqkT+YnrIdU+B48GHzONcwcorUGv41I9nllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyiwbkJXvu62NjtCopBBFHvBIzERlfe1Diw2QzPrgl8=;
 b=cvUqUw8enlzXdHhxw/b9WKyp2dZQQT+N9vEHwwzVvL7Ay/3ZoaXYP7iBuLvfZKqqC8iF6FKCTcjViB6Grjg14a5T9hvkM1PBWU19L82yHWW4avgcLZxcqwO+BKnu0VwG5jpjEheMFzQxwV56K4mdP/jM4vyPxqbI60gmFngkcaVgzFJ5Qyr8bwXV0LUTZQeRObzbf6Zwc/znRgjSbW/iM4VTWD9qkuwzWJzSS/orlO9Ba/xcvsxJXzpsVXTWF7FFMVcDL5vxG+gAy6Ow4IQO2jLmeaEg3wb+8iNoUGozYBLF45iFSUiDMOjQEPzNy7umTxl3RSFEEHOJYWx1PLiV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyiwbkJXvu62NjtCopBBFHvBIzERlfe1Diw2QzPrgl8=;
 b=keRdTc1UHA63aBDZJMJOLEDzd9pKFPnp2dBdlCK/27dwFziUsPvQUutGtuJe0eutqA3Oc5jP0ZpDMniuE4gtGE6OUN7K/3JgZS7+gn98ZbjgQBoc9MQbCkmtre1L9doqL2FQmz8x9NE0I4hIeY5HcpH7QzMkhdajoGPjGcZTBXypS5n+yyOK20+1MrsH/N0qRcnTBLgMI8eJ58rayXeC6nd2C47hVUr9/GzC+td6Rpm9xfnfRH50RzKnY6Jdh3rVPFqC02JIVtgEuQwO11fAz7J/NjHHt5uSOe/OZenQh2AYYrTJoZ/GkoD5Swg3z5e76+pV/qccIcHlFyfKmpxR2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Sun, 20 Apr
 2025 19:32:06 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.033; Sun, 20 Apr 2025
 19:32:05 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] sched_ext: Introduce rq lock tracking
Date: Sun, 20 Apr 2025 21:30:20 +0200
Message-ID: <20250420193106.42533-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0154.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::9) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: e4331059-8714-455c-70f7-08dd80420878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HqMeveUSSluewj125a2N7wqwRFfP2x862wURZau20QTVs272LKBNAMoEpPHN?=
 =?us-ascii?Q?3wXu1Y2ZKBO5cxGib6BXM6y1JTAI4jHqccKBAF0y6rPhgtUpDvVNi9xfZcUm?=
 =?us-ascii?Q?Ze0rP+gzoSIo3lBT/YuG6eoq8iF0LgpU1c9u5PHhfcFk+A1CxkAlyvcrvOfO?=
 =?us-ascii?Q?8PsAznNP5HxkTfHchXaG8Q325Q+xGvDArJLeZWhFCXyeAXlfaU3S/QqYsmpS?=
 =?us-ascii?Q?X3kP6qJ+9KGUhH+yYdidKfIE3ZHUwwwXWNhJWMP4gC5Nz1q9DvqsUtJNFQzc?=
 =?us-ascii?Q?bK/h7ezRaIqHyHspsR4+X5lxVsCDn6Ac9pBX9qA/HZ+5ZRKID5muWT4PEpo2?=
 =?us-ascii?Q?mXCVV1aTcu+59bQZfKc/NlKbp8kCJOry7M3vZ5lt58cO+aUhvjlG/jXE5D/T?=
 =?us-ascii?Q?k17GC76cRbfYaPwiFaazNd2gidbNdKVM8kS6TslbJmnkzlbuXAmyAGm3ErTy?=
 =?us-ascii?Q?C7ajOs4aRMs97651H3oylwfUpmsSliwCgS0js/u3+kZOzr2SzkAIFXzlaDMN?=
 =?us-ascii?Q?5Bg9GsXxL6vIbEUJAzl9m8eCLKmgVVO54XSgdyOL79i0KtPq/I9at1oU4jZK?=
 =?us-ascii?Q?A9njb73D/ZH4/s/I53oZ/IzzN6aMb/GzB8FW5WT3ymDrYjkawcuroMQkB6WJ?=
 =?us-ascii?Q?lJaOsDkoJBl8lC9Z8cy5kGHjGu9ibPdNYVyJgAgaQbdP4qVAs4a4Z2ghYYOi?=
 =?us-ascii?Q?C8q9bkDvZ5MSf10KPuvFWhgAtdNXCL4hmbzxH8hMnD+eAywGknqTR2XFGf10?=
 =?us-ascii?Q?KbCPTdQ+LwReWyIGSMWw3+069VUFo+V1+/erElb8+jKZuzj/we9vGdhAvN+t?=
 =?us-ascii?Q?cDgVe4OuD3w8ZC14M2xiBAHuvkO1zZAj4YI/czbYbtMLwqZNld2/eSnOdsAA?=
 =?us-ascii?Q?epvAYQOzNsXJlrPnNNgbjKSqrTbV9k4Ra2PR4ghDXqjEWrG29tch+XEdO/ln?=
 =?us-ascii?Q?/pHxwvSj659ZIwfcY8t1zgu1jO28S7hH5I4VZ6HGL5QdUkAeQCedrLyHvyoi?=
 =?us-ascii?Q?trsky83MaoUphHLQFiO8mQjM8tVwPhCsWKG2j5ke0zdVocSIsbU0JuRhDWki?=
 =?us-ascii?Q?T8I4LSK/mgr9OC+Fp43ziDZVHRom4ubu+FGq6ohgOmhv2z3P3Bj2Tfh/VuiM?=
 =?us-ascii?Q?CFzTvZ5OOI5bZ8gDTStHqoCayN/GSIHfwasUt+GtcNl5nPXOEYhsaq3EvIBv?=
 =?us-ascii?Q?woQX/DCSJ5iyqbu/Deji5YO96EDhepdhdeFALcGuuX9EpDzhf3Y4iwd0aEvs?=
 =?us-ascii?Q?6YKnw90HzFV/cbtC9LUip8vu4xrUoS4xeWn9rqTI4eWhHleZYFxkcrKjN7Gr?=
 =?us-ascii?Q?uBtr+fbpHFJOnF4BwVPjKP1qgM6xvT3OHpx7TgUhS/t3MGXrI8DqSVfx9chs?=
 =?us-ascii?Q?jsZJTDndzSWHNYmVWzuwTmgIcFSJ/DgygctxVpGKcQ5i9Xnf0U6CMmqjRlE3?=
 =?us-ascii?Q?dJMN1/2KZtI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8oSsUCEIyyZnmGeL4UtLgRfomVqz1YR9TfJFEg9jViW0om10W03NrgsiWdbt?=
 =?us-ascii?Q?wptxMWlNSdbgbCcOQoaz5OCFcOrFGZqYgy3jYG4svYFWqlLTJttWctFf0SqL?=
 =?us-ascii?Q?QHIlLeEiAosw0gzj2IxZrbiH3uUwFO6YoJHfWkq9hDIbPoOgJzn2AuDmbZuV?=
 =?us-ascii?Q?Eu0uICSkMGH4P79xsMRa0BercPEm4pCem+R03h9+g1HmSu1Dccpny6ux0F9o?=
 =?us-ascii?Q?LjAz3yEMP2U0Q/ZiRT+p37D+aGntLM049K/fWgp3DSAzn9wIoCLnPNoIV4zo?=
 =?us-ascii?Q?jCWHt0FmyTa5VI0GUDzcb5zMDVO7/Hzr/qlwAt0fyLa4RppeBCkUNHl1vC8Y?=
 =?us-ascii?Q?N9SLg6y+42wBHfJc0OYnfd/vQqDJiMtpfa3E+gAihnV9HbTkIEPbqb7Tu8Mp?=
 =?us-ascii?Q?cHoqnby0xjvvCuF/SPdygaF4Q65c6GH2Nyid4dAoO2sQVXl5smwMYsR5yGcj?=
 =?us-ascii?Q?5yJbv/Mc5jeprjTQ07zfBZKJc6KA26V7iB/qSU4OOi5AYzxsqxMPuwqgcZFO?=
 =?us-ascii?Q?KH+TIW7YlcZIfQztTWFqmZG/HpH9b71MdvmSC06r35woiOJ6xBKUJ92gl9tF?=
 =?us-ascii?Q?U5Jwszd/MR5dBOJrpqeIADzSzyEteamcyT7+jLulO4WXViRAoStfwTUJBxug?=
 =?us-ascii?Q?IgcBcbiwC7UnUBnVZroytRtdAnZk58q5izRye3ARb8YG7oFVpJgEIy/R6XQP?=
 =?us-ascii?Q?zY4qzXaROwYVyJTFc1mQ3L3dw1qVXAj9pmChIDngBZrUqQTE0Vl2C4Q/XjU/?=
 =?us-ascii?Q?mWeCAiQ3EYzdTwTqutmlWVFcm/DqbxanKm4KfKeJVM3+mjAInt7t27AnsN/G?=
 =?us-ascii?Q?6q+bO4UGIx6/LgADe0/H6U2pjU+9eMbsm//+1mB52DlbMGG/4gX9YwJTFof4?=
 =?us-ascii?Q?e7XcFvxmpB5Q5uWmQJ5Sv1dVUknKGpz2bahoSg9a8DIMcKvBhdp/hRigPs4l?=
 =?us-ascii?Q?ynAsRvCb9I5QuQywuJtutsRSWYfTVY3MN9usdzfD44/SMV5nyKR6bjpWrhA7?=
 =?us-ascii?Q?4fhzLdfdCOaMqfWO0FF4M9/r/yBheUh+NOLcad1mkjYLTpOKRP10dTWBiVBo?=
 =?us-ascii?Q?7HXqEWrm5PNN+0QgwSlPrBM/HTeTlz5g2aiPzXFylJb4e4V5ko+o6uqKnHKF?=
 =?us-ascii?Q?rdMktJWbdCotAxNFteLS0ESibySu95KgEvpE6k2FNyM3hJ/nd7ZL8gHDG0dy?=
 =?us-ascii?Q?UcaFAgbLzzYQOqSPrmVj/gHNZxDsoHz8jKONUjY2DbZZJAMGlZlR5RvWpyZs?=
 =?us-ascii?Q?C9eOypNolBLO8U2UHeUBTYvjXHl9+E3hrYpNIblc8Naopf2x32XgrFI1GnlF?=
 =?us-ascii?Q?rjbcnCzIa17kpP+rgRf4qnVP/vfFmmO0y5ivCso9EfcGDizs8m0Z3hHR/0x0?=
 =?us-ascii?Q?VShBvtzv91n0GZNH/Gj68l4CEfyvIXiDGHRFQacXTBWNfgOPa/a+beWl3NuK?=
 =?us-ascii?Q?bHXRXYNS89yqh2RJ7OJ37RuyYWZCCzjWS7GNb1TX5bm0S+rWkrIHZUTXhmXG?=
 =?us-ascii?Q?W08hoF2BpR1q/UqQtv9irvFq9drFGk394+fhba9kf7Te8v4WUpzHQPyAtn72?=
 =?us-ascii?Q?YZAmpeZJJelNGCud81dSqzxlqQKQqKpnu/6fD7v/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4331059-8714-455c-70f7-08dd80420878
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 19:32:05.5824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnrIJnnu+kBr+QFRc7M0RlrT2IHRNmcglvevcys6cjntz7AmAVeR+VEVn5jCj6sxE8z8+wEz/rh2eSQ0qx4BMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926

Add rq lock tracking to sched_ext ops callbacks to enable scx_bpf_*()
kfuncs to detect whether a specific rq is currently locked and safely
operate with it.

If no rq is locked, the target rq lock can be acquired. If a different rq
is already locked, the operation can either fail (triggering an ops error),
deferred using IRQ work, or managed accordingly to avoid deadlocks.

This patchset is also available in the following git branch:

 git://git.kernel.org/pub/scm/linux/kernel/git/arighi/linux.git scx-rq-lock-tracking

Changes in v2:
 - store currently locked rq in a percpu variable
 - link to v1: https://lore.kernel.org/all/20250419123536.154469-1-arighi@nvidia.com

Andrea Righi (2):
      sched_ext: Track currently locked rq
      sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()

 kernel/sched/ext.c      | 163 ++++++++++++++++++++++++++++++++----------------
 kernel/sched/ext_idle.c |   2 +-
 2 files changed, 110 insertions(+), 55 deletions(-)
