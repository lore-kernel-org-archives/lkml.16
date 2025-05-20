Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F43E242D70
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747883; cv=fail; b=AfMECV+Zk5g9oAqz510MEqiqD1O9WCwrQg204q+cjmkqj3NaKCIliGI5+skcYf4dwAiIQFp4cl35sGNVBXLnGFKQ8Sa5vOKykVBWuCL63Dl3yhWJUwpKbwzHCPh4Xi3Mwa83NPcquxc6wv/PUtVT2zmeYTaEdA/1rt8Uw2M50go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747883; c=relaxed/simple;
	bh=mtmkmdGwVVgANAIRi7PKlcA+9ldVpUWch210/aq9REM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lklVJCSHx7p+JoyqrZUwLQQGFs5FW4X+B4J6YnfbWdhUi+RVG21BToyVvXqA64R7yDS0QJC1Sv2OryfsFTatsxOrCEcOnX1fSsY3YL4z3vXWu5WVqZpfF8zRfBM8GQsI8QDNEE0BBgjAqndVTRloQqVFq9csRyu76xwIYmESwts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qMrSluFl; arc=fail smtp.client-ip=40.107.94.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qMrSluFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/xrWXUTtLXOQCY0dK5IdwYKaeQY4mY5gG8A+o6VVZWubs9CUs4yjNsNJ6oAXA+BNbO9faD14vjqlygeGy8bmpRb8qfGrruKe7vhCp74Q/Ao4piGIsbCMxmpelvNX6zzlXTidoP+KxfA8ND9PyGphVkbMfjHRTUmRe59zpi7bJOJfcqAs1i5yjmRd8ZjNafg4eTDGK0Ac25G2NnfU+/zgojIsKlIWdsQjYrch3W8wfkGQPAeuwn0qtFmX75BEdgbYD3s4atanLKZ9qGHeEFvq+DMCjE01xtVizDS6zHIQWTTIQDeQU0E03tKC46JH2vnh+fMuXt6fAjBo4x5lvd71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtmkmdGwVVgANAIRi7PKlcA+9ldVpUWch210/aq9REM=;
 b=GQ+bEmJc7DkI5jgB8KnFL8AJdCvLJl9wW77rv7pZ3YL1vUx2FBk05HOnh1FbamRinMwdjAv/9mCSLRpSanTXyd6q/e/n06D4E1E8j2jA00jZxPgoXMQabgf4CsEtXYj8evcQrjOzr0Yzj+/1cGvjaL5+KhNLVIjsCmaqqDLlmIojpvhafhmdjXKx7LOboWw8YXhFG8XQM3GpJCnTkiP2poFxrnS8jGunfpS06gTHyLbk9nPwZfwrqYDVLJCn3DLsNByMU5Bl0pNPQYF6pdadNlS6Jj3sjRDiLCWtwfPBUA8zCKJ5pOW33Mx1brSpzCThiK3zkq4vAQHLFfyxYwNR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtmkmdGwVVgANAIRi7PKlcA+9ldVpUWch210/aq9REM=;
 b=qMrSluFl7NrTrkJ5Xc3GYu/FcgyfLRMFhuevvBSJTnQVOBdsPjv4B9OraGeVuPego9hPBzlnM/Q+M1KvbY6WdxkNo7VX4i3SCLJFkweFgvDUfMFGTAA3xEyL49xjCoiMJnovBDYdjyGlF2lChTywJRcEoSJZsBNxFiIyAfoj375GIo/IaPy/i8XS9yBNX3Gf4gKUz+g7cgSt3aG0hgNxxk6VbOWj1hbHmaUt/NNpFe2QbeFywR9KhEqUDtyxT6B0U+9tSk9GRawAQhm16HjL6EZgEc5ki8ou5/TeCzFmBl8d8mO3//ao9vmH52RhNl5yuNpWMTZ0f1Ug9+hP3G5JJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA1PR12MB7496.namprd12.prod.outlook.com (2603:10b6:208:418::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 13:31:16 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 13:31:16 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
Date: Tue, 20 May 2025 09:31:14 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <7AE9C2E9-2EC8-42E3-A3A5-3E4458796A51@nvidia.com>
In-Reply-To: <f090ac45-6758-483b-b289-d6aaabf2dc98@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
 <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
 <794d741f-44ac-4cd8-97e8-091f12387f39@redhat.com>
 <0A1FA061-9E8E-4E86-A479-EFA9FF083D4F@nvidia.com>
 <43ab8a08-b577-4e6d-8920-1761ffbc01fc@redhat.com>
 <EDDFDB5C-2C2E-49E8-95CA-A1663C33EA7A@nvidia.com>
 <f090ac45-6758-483b-b289-d6aaabf2dc98@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:208:236::6) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA1PR12MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: 497a7128-2163-4efb-3127-08dd97a298c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NzJP9fG5trLy4XnZVBlFwtkQYMftUPxP1OD9qHPuyDeCm3WanOCVnaCcikbo?=
 =?us-ascii?Q?1heOs19C1VzrgCJ8zDV2kKZIQEwuOvIVvle/XPum637BV8w/OI4gDKGNBBBG?=
 =?us-ascii?Q?fAV8cNiNxu1vi+2Nz5W4oLzIuUISYADIjGXTYc1yfjbOK7DijsY4DtNhdZvx?=
 =?us-ascii?Q?1Y07C25/7KVw0mgnhZPGtqqQKdV1rhlkU61C4c+cs7NzIidPAu3AgIiBJ5/0?=
 =?us-ascii?Q?DSEVZZ1OXU6sM1lrPwR6JR7QkWGR2WkA/zCSPdj3tUJXFvrgiKltPxztFR6N?=
 =?us-ascii?Q?dctKvy+lPqtIwZnQS02jpMH8LNDeHqRjqD8eXxGaDvLw08LdhtLGkKi7Xzkq?=
 =?us-ascii?Q?4+M8mLQpmWvZABBTzCCFzGFrra9Hi73tD5l21U227pKyqvZUseWG+isAyhUs?=
 =?us-ascii?Q?lcPvfyEXgZPGYqsaLj9OPramxiE8DPZ+HJrwPXgdoIkgamohnwrxFlJrYppu?=
 =?us-ascii?Q?Bkf8xMYGs4SVnWuKjuhDzH3k3mvHgNtyg42eoXI2jG72aGYKHm6KgmxlZD5E?=
 =?us-ascii?Q?Cr1E96x+XlW4Bk6kRldKK6BYBSVOSYh1mqKYV3pUKdo5azUjTgZmuO8RMlRd?=
 =?us-ascii?Q?QZdUa6RB9EZGRxqNNjY33b2xUcY1lRZRQ2EHjEqy5Je0WQzEyaz1ozCLvl6E?=
 =?us-ascii?Q?thXZ4ML80kFMmGDShmBsMUntAPW9GTgh4OV+7YomAVGBKky5cfIv3+0LbUoV?=
 =?us-ascii?Q?3zispY/jTE/G5DQCg6avxqHhHrVjv+AAmc4ppimbGSBS1xpIRpLMoGaQ5K0r?=
 =?us-ascii?Q?HyItrN83DXZNEGnnHay+OUzfb4Wu0vlSHNubFNRJnWpYg/ulfbsu7Mulpo4f?=
 =?us-ascii?Q?n/n3eh9u4ja3RSEp8CD3SFQ2JYfeFIjt9MTx5PAg28HMCiI4ZmKmO0epkb6t?=
 =?us-ascii?Q?sXxcr8CnHFn5qbmUX2hh8mBGlyJUvyhN1ofdZVWxgVO+QSQSDAJKzyVCqsxi?=
 =?us-ascii?Q?XH6YtAA/OHgbrZ6AQeOkWJRm1yiTmihz7vEaEH+cPulyBFFwwF+dqNXRDU3L?=
 =?us-ascii?Q?wjmXwU0NUbCDAP7Yv7OjM1id379o3NTURjQ9k8jbYORkyZf1KuuUcBCX9K/w?=
 =?us-ascii?Q?Bj/IEf/BMZvZnnEvOIKzrsqnssUpWHkd3yfLtPxVUBCAde/trBC8pFRu+FmY?=
 =?us-ascii?Q?YzU5lMLcb2kOxPZVbTNR3b6TCAfZ84WFzlseUPG11M0RE0HLyp5DjeqPFGIw?=
 =?us-ascii?Q?/HJ6gNvU5MTvqpKueVkEzUXSxT9cTnak+fEh7XfjssX5+74sR7HQKwNcEXTe?=
 =?us-ascii?Q?xTYI+OKUKNLG55aTpiHYpDJqzUJ2xvs5C4v1aMzE8MBgRN4+vfdP2nB60EL0?=
 =?us-ascii?Q?p0qj8KeFDyfQ2jXAmEOCd0pz5x+92IOXMNPi1mZz9l618ScIm1bxXZNEwUjL?=
 =?us-ascii?Q?1Ww2LAURLgvvNquQhG91XcBGSOQbOadBniTVHwJTKWL/dOU0/UbjkmrmvcKI?=
 =?us-ascii?Q?X2jHkTcMojY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZFTnPemUCM0rJqF376p4H4wBhVbFfqvXD4cEGt3GDy5R56wEom+/C1j115bY?=
 =?us-ascii?Q?7G0kXNleiiPZtEtphh1sCjl2FRDgl1VN1+PmoF7nqAqxoMl/QsRoDEBbmdwI?=
 =?us-ascii?Q?maF283tzGd2HHWmYNJQDS1akSrINklrLd0IY/LEHk8558WRw3oPoJcei7mxL?=
 =?us-ascii?Q?aqymlIIYPtg19vWMa7mYOUXPimrZEA/EpIRuy5EYlAFCgLm/qb+0LC9x422I?=
 =?us-ascii?Q?VRTXj8hPZZaHaYD2f9PFX40fynUUO0BQBfKt9Q/my6WxSGmghNwn5qG8USIO?=
 =?us-ascii?Q?1ayOyEvGggSIJlyH5GfTaR1p+LNDKCnZtTkY7wljraRMWeUy0Q3C8sftTMKs?=
 =?us-ascii?Q?ZYymZtUAd5hbCxmuHk10pLES7e4/8gsgQrBobBIcHNaU31fxZ/4UQpRRlul5?=
 =?us-ascii?Q?iLWldr/GA72YpD4Ux8GFCtptdrA9qFQyqZAUpWHTSi9KMZ1ts4zaBeALCYEy?=
 =?us-ascii?Q?rMo/Px4hdNU5VKwkyVh4upOAex8nTE32zJ2q1hqBZbxEdM3ukKhv0jNXnJ/d?=
 =?us-ascii?Q?8g4xEwEgFiZM1xLOqtA/5RBB2YorVd4v308JHALgEHHFdugjGpsOw5YddiD+?=
 =?us-ascii?Q?zppHUkP+EosM/RbbYmDV3PaHE7cqmpbMVU+CiEx8I+7VC9ipRJewLVWHnuYm?=
 =?us-ascii?Q?mPSjzx/sThu2KrCJekj6lOlzptLGqheei86zgHYgSElT37/JWl3rnxKNbAus?=
 =?us-ascii?Q?K10rr7yq8rMBO5S5+cYjhrBSB8LZ1UlwKzVNtIxS8AboG5tRA5+VCMCMKfdF?=
 =?us-ascii?Q?HqUX2pXhuDboExfqXDoKleDwuKFfphdvz2982ay5SPk7Ntns2Cz7GWeyZ0QZ?=
 =?us-ascii?Q?A0PORVvhOE2/qPyK3tJsOKijP4Rb8S/htbv+kbtIBM5WeTB4A3hwpSC09wDv?=
 =?us-ascii?Q?iV7rZ80i+9q4IqGMbfh4Q5yC1koqkdrb3EpIviq0KUp+KTuHLeCneqEMCeZC?=
 =?us-ascii?Q?Do0dGsCNoeh0kMqhhO2IErf0h2QMxc/SvLxn3GaSczEhXAncKKSH5TXq9rTM?=
 =?us-ascii?Q?0Fu/XWl+vtKyjTh8rN07VSq7HEegRjoCa5TxgMtxv8qfeCPaLn1ihjrj+/ak?=
 =?us-ascii?Q?A324VBEjghG2rtS2T7yG7+GGmffNtnQwhiORzZEuwueDrMVXcTXBxg+SzSO3?=
 =?us-ascii?Q?qMxH0r0MIdQDxfPAobxH7KDGoHoZdDhygFxGTrIBKkY+iLKks6Cew0qhT7DJ?=
 =?us-ascii?Q?FEYkHLm6wUJ6Xla2322AXuVGAHPs/XelV93Bd/gHIf12RUntUuISvchdjWFF?=
 =?us-ascii?Q?gs394OSVAQkPMIM4fFAvS4fUJ6P5B/goxpnWke9FNFnV2r0r5SOk+gTfEiqA?=
 =?us-ascii?Q?P+0N0CM9R5eBiqajskA/Fbn6V9LfdR2TbKZ9bmH1SIsI2CiVwZR3ICWYrM/m?=
 =?us-ascii?Q?dOzQ6QKfivs/YBcMnHN3HfBDMfGSv5yAli4YCaz38Qbv0rNc58cRqWfsgFKY?=
 =?us-ascii?Q?wCyjg4GQ5J7Cpt85XgD4SaabjO1AgzZuJTeW/VjNRyYu0Mq918amD6Mq9gyn?=
 =?us-ascii?Q?6rK91oghValT0e71M9ZXuFLTEMWcNoXwU6BcPpQGHnTdTPb8tZj3h4Nxuz21?=
 =?us-ascii?Q?JLYmUSuZxHWHBot0Uym9301B8xbVC9pI5W5GyhHH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497a7128-2163-4efb-3127-08dd97a298c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 13:31:16.1059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqo8eA+SCI4GoWMlvVasHqIqY3QQkKKbLQhC8+T9qkEJenDiUxpkC9YWpLdWWwAv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7496

On 20 May 2025, at 9:20, David Hildenbrand wrote:

>>> if a page gets freed while the pageblock is isolated, it cannot get a=
dded to the list of an owner easily.
>>
>> Right. In theory, it is possible, since when a MIGRATED_ISOLATE page i=
s freed,
>> __free_one_page() can find its buddy and add the freed page to its bud=
dy's
>> buddy_list without performing a merge like current code. But it needs =
a new
>> code path in __add_to_free_list(), since it is not added to the head n=
or the
>> tail of a free list.
>
> But what if the whole pageblock gets freed in a single shot (IOW, there=
 is no buddy to lookup the list for?).

You are right. This means when MIGRATE_ISOLATE is removed, the global
MIGRATE_ISOLATE free list stays. BTW, looking at struct free_area,
its nr_free accounts for free pages in all migratetypes. Either struct fr=
ee_area
stays the same or more code changes are needed to have isolated free list=

+ !isolated free list. I will try to figure this out in the follow-up pat=
chset.

--
Best Regards,
Yan, Zi
