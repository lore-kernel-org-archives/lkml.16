Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F4C26770C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744219682; cv=fail; b=IwG65LjTT3Lvu4cF67XnQEQ729r4P506Nw+bcYxHHNCguu5NOMebKzDbc83/TWVK/u0hXoarhVNcl7VjIxZbDU/Tc4izK36r2409F5x6hUTrNuA3rAe4JeAGo40POIkH7j62VA6LzzRJOu16o/mbdpM27GJC9apQj/+g/BXEKyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744219682; c=relaxed/simple;
	bh=PemZa8dQ4jXEXP4WS0Qi0h4PHA1s6qzUHFyfDOXPms0=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=FdFMJY+lcW7CRk+OIBoCnys1BYVYeWQ/BCriSPt9l7KD9C7QPuoZU/f2Q5neBrV19XEj/07HCchz/kjpbdjoHms5pCEL2DYzohjRGaXUN9phENB8Enn5O9NraqV4Y2R9dIbLRSsCxae4QnDgIdXM+2Lgco+By4E1VThPEXdSC4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QiogAmzt; arc=fail smtp.client-ip=40.107.243.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QiogAmzt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLDfa93WJC+ypx9bPxJoxJql17dtSfwtr5MxA9F7s5Rfmi9jGEwyB8UljAo8zVWvkD66l6S32pqccRg3v3o3/2iV2+Os2KgwgGypeRR1oU5EtbK63RVXQI/pxy+ZP824tNUanHD5mQTOLZmvdeWQuJ8Goj7tQ++RxjVVNII1ooylMteGbt9WMA8DArvmlksZqw0Dtuqs4SQG8Ahx/1aIasG0irC1HivLtbf1d5uacFONU7mHM8RUz07n1nMd7l9GR76QZGBdQxLVaFRo1e63PDzPWIxl61rd54GwJ//4vbUoiaecoygyiccrx+/wGlW1+iXNOyXeoFb6Pxv+BW5ZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUjKfv7yUFzCCV7zb8lF5S6vYpKlpcPzKBpu2+4glU8=;
 b=uh9WzwP1Zslh1V7U0FPXB5k2Orec2jrnAKFziTTw0mKdyEA9fdt4c1K3kji8kuceHZFZdRm8bR2aRAqiTqyRJ9dY2awjpu9+kiEfgwMTj1sDDYxOgCGNwCZTX0F8dfJTy+BjjJankb6fHbnu8mR79BJdjvCFGCE2XSZGqKDg7i/toaYlGaDL6Hv0qDagx9BU5JNiiGMgGK4t9BkFrkXPG3yifv0EIZ8dr+npoOYiNIWJWmo4sCRZf6goRCfvPK5A89/MWN75LjX8acybutPn9+BRiOy/NtVxDO+gzc/atuYDCPUq2FqC7Q/oR4pmvASGntUhL3iHjRO3COfupCgswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUjKfv7yUFzCCV7zb8lF5S6vYpKlpcPzKBpu2+4glU8=;
 b=QiogAmztu278XllSghOyGAB/4zTs9BhK6hrk6MhS2g5j4eMM9MpgrLEy/+bjA/8mS/dWr3gXQUB4kflpWI65t2gE7c5I1Yp14LgfY9Pb5oUTJrBWKrE3ctrXINkarm58wlfqCH8fIcGWueXF6hkChD4uSPUlJ6eYCp9LfgNG+7Djff+uUFLcvPAwDuLFRH73FGxscCgDCvgmQ4hXxIXj3QKib0vFIfwd5PdjfPNUVgJtdUV7ye0/bep10cKVs6FweUI2Dvc2JsSWdRrXAR+uD1RNCjBuAdy1TzX8CkDUERikoO/aSnPbu3JZrUR9TNHUf159xHcqsykdCt4DphV20A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.32; Wed, 9 Apr 2025 17:27:57 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 17:27:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Apr 2025 13:27:55 -0400
Message-Id: <D92A9T1LIKBC.1V2UOQWI6BVY4@nvidia.com>
Cc: <muchun.song@linux.dev>, <mcgrof@kernel.org>,
 <a.manzanares@samsung.com>, <dave@stgolabs.net>,
 <akpm@linux-foundation.org>, <david@redhat.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, "Fan Ni" <fan.ni@samsung.com>
To: "Matthew Wilcox" <willy@infradead.org>, <nifan.cxl@gmail.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH] mm/hugetlb: Convert &folio->page to folio_page(folio,
 0)
X-Mailer: aerc 0.20.1-60-g87a3b42daac6-dirty
References: <20250409004937.634713-1-nifan.cxl@gmail.com>
 <Z_XmUrbxKtYmzmJ6@casper.infradead.org>
In-Reply-To: <Z_XmUrbxKtYmzmJ6@casper.infradead.org>
X-ClientProxiedBy: BLAPR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:208:329::7) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: b44d8c8b-1601-42e6-4e0a-08dd778bde14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWhSVS9XSE90bVdQelI2WWcvQzY1VEtxNXNaRXYwd21QdGpTaForSkZMcXYz?=
 =?utf-8?B?VFdVQ1dMbDhHMWdVVHVDUXpTM1p1ZEJpdkV5NGtFQTlFYlFoSjd2Y3lScUZy?=
 =?utf-8?B?eGpmWk1ZRkpXMDF3bUFKY3hSVFBDMmhjVWhMUXk5MzdXc1FaUXZYa1pldnRm?=
 =?utf-8?B?M1NjYitCeU9qbDBhbEZKRk5ZbTdYd0M4N1RVYnNzN2pnejdGMmZyZFhKbWxY?=
 =?utf-8?B?cFp4OFFZSTBVcCtmZ0NJN1lZYnBJb0VKbnlOWnNRYkh0WkxjRXQ3dUlZNzEx?=
 =?utf-8?B?ZnBjQUx0UTBHNUk2Y3lYR3UxMWR4OTZsNXE1SldiTGVaeC9SdzdtOWs1MExU?=
 =?utf-8?B?UHViaitvOWtaSDBtSFBkYUNrd2pBcnRrQk9aTG15MEFyWWxkMWY0TUwrZmxx?=
 =?utf-8?B?VXFTU0d5ZE02Qm40SXpzQ2tWRWxaZ2d4clFqK2xXc0dOSnE1dzVPV096ZGh6?=
 =?utf-8?B?YTV5eDNkUFpWY2xkYlJZaVc5Q1RqZ1UzcU8vV09QMXhPa3E1SHEzaG5Nc29v?=
 =?utf-8?B?YnNrZUlveXNWSWgzOFFuSzA3NHdaWlJoODU0UzdBZWlVdC9Xb1pxUUJuc1hJ?=
 =?utf-8?B?a3BHNFBkazFUYk9RbFVHS0Z3TWxtWHhBRDVOVjdYMENuMEplMWtPRTVEampi?=
 =?utf-8?B?NG43SkU1TlRqZTRSeVBiR28rK0xLOVNPa2RwOU5mSk9kdStxTkQ4ZS8rd1lG?=
 =?utf-8?B?VmZtK3JRdEJXV2tXNWJ0UmJHUXBGWUhuT1F5djkwZDR5WDB0ZDZxc3RJNnBH?=
 =?utf-8?B?bDFCeWtHTWRZbzdxV2M4ZVRFaTRQWUJGL0tWamVnSVduREtXaVdKSmZ4QjFD?=
 =?utf-8?B?bjhWTFFROGwwSjFCMW9YOEdsSnM0U2R1aktFZzZXMWlLM2syaDFla25QZUYr?=
 =?utf-8?B?QTExY0t3cnR2UzM4bGRwSE1pOXNiQzFXdTN1Ynp0SlV4ZW90bjZEd3QyaFg2?=
 =?utf-8?B?emJpV3VBYm8vclpkRTQ4YVBycmZEU05tNFJtZXYyQ3FYZ2Z6Ulcxb0R0U1RW?=
 =?utf-8?B?QkgwY09lSVlCOW9FdlNVMkx3WlRIeDMwdFlnYUVKWGxDN2dOT01FOUVtN3Vi?=
 =?utf-8?B?TkNSK3V6V0p5VUJmWnhuQkQvWjc0RXdqL3JzNG9OcHpZTU1CclVrUGhVZm5v?=
 =?utf-8?B?YjR2b28zL3k5ZXFHZzNNeGg2c3FPQWxnejVCSUduS0VXVHV5Z1VvOEM0ZTJT?=
 =?utf-8?B?ZkZzSTJMYUV5bEJ6Vk5CbEdJQWNTVU1LKzlrTGxOOTFuWnVZdzN6U3o1cVhz?=
 =?utf-8?B?ekJ6dWJta2JzeG4vRWw0ZmJFbWE5MVJBVlZ5VTk1Y3pyZXlnQjRoOFd2Nng1?=
 =?utf-8?B?amk3RHRaUWFGNElpRlkzbzJnSWh2NEJ4K1R5Rm9nMDRnZXo1MG9PVmNXcVNY?=
 =?utf-8?B?WmZBZlBLaW11Wll6cElnaWMxK015aVJUWlExZE9Ed1owQlNLaHNVN2l4NFdT?=
 =?utf-8?B?ajZIMWJNRmdwY0dYWGlJdTQvVS9QeWU3MXA0am5ubEhNbHlMWEJlYUh3cHE5?=
 =?utf-8?B?cE9Za3hPVm1UK0JJSjk4OFFyYzloWlZWKzBHMVNJaGtkUnRKakJkcUMwQnBW?=
 =?utf-8?B?TlJONytDQ0N1eEU4WVNtaW9LRlpscGNvVjUrTUQxN3JIbzNoVWJYdXZENnkv?=
 =?utf-8?B?bUthNFhCeXFadGhWZkVoWlB1SEptUVJ1VjhxM09wUzBHWFc3YXkwVWg1K1Jt?=
 =?utf-8?B?SC9rTitvNG4zdmtMYktpM3hYN0RvNVJCdnY4QlRTc3BmQUVYYW1MekJUVDB2?=
 =?utf-8?B?b2ZXUzJsSWFWNWs5RjZtS1I1anMraVpxb2o2QUUzVXVkU0ZiajQ4WWk4bW91?=
 =?utf-8?B?dWk5SUMxajc1UmMyQnFhSmZHZ2E4cTBGcWFjRTd6Q2MwVjJ5RnUySkJSNktw?=
 =?utf-8?Q?ufaa7prm6AH+r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXlvN0VtRWgvMGpVVHdwM0RPNXcyeUtMWWV0UTBIU2hkaXZIYjMrTVgwNkFQ?=
 =?utf-8?B?eEtwTFlnOHM3WU9rOHpOMTZBY3VPRjlpdkRhNjF2RTBYS1Y3YVIxMDEra094?=
 =?utf-8?B?MTZtRWdnampXb3N2Y0dKdFJkQXZwSE91OUxZanZFVU1lU3dDOURZNkQ1RkZ0?=
 =?utf-8?B?ZzRCWEx6YVdxR3lQU3NXWE53SnBkRm1nR3gzUXVla1E4OTNKRVkzZDRlMi82?=
 =?utf-8?B?UWpBdjl0SUF0a1NvcHovWU15ZFlCSWEzazR1SnRmOTVCOE1QR1ZYRWpZcXQ0?=
 =?utf-8?B?MVBQaitMOU8xT1BaNWlzUVNXSWtQZkx5VEEyTjRvQWNKbkhWcVk2elduWWtE?=
 =?utf-8?B?cXoyQW9aUzZZSldsQ3pPZU1Mdi8rWURGcFZkR29ER0pUZEtNamhoZjByelZR?=
 =?utf-8?B?SHR3ZnVNNlpnQXkzYzVmZ00wdlVlSzBKbEx4aCtiZUZRVEhCM2NnRitISmk2?=
 =?utf-8?B?QlVtY05sbjFNK1BiNjl0VDV1YXZlMmp5L0I0eVpmSXZXTmJPY1NJN3hGNng1?=
 =?utf-8?B?N3JjQlE4QlhPK05xd3dsTzAyZEs3emtTQkJMcGEwazF6VnNZWkFISUhKSjhv?=
 =?utf-8?B?NGprT0U5WVFaVG9PaDBiSlVxc1k4SDRhRDJYY2U1bUxMMS94TE1jSm1FWm53?=
 =?utf-8?B?cHNoU29aeW5EYTRBeXJEUVB1VlFRNzR6MHRUdDJBWnM4dVFlanZ5WWMyZksx?=
 =?utf-8?B?bkl1bmFpbzBJR2FJZHpNc0RxQmtNbnRNTEJOL3VQMnNhdngrc2VLTW9Fcm0z?=
 =?utf-8?B?K2FXcWdnSXFGNjFJcFAvYTc4VFk2Y1Jma0NJYVpJb2VuZyt4SUU5ZmdGNlhw?=
 =?utf-8?B?RzFoZ2YzWmxUYnZkNjR5VjZZR0UyM2ZTT1FXMzQwRWtsMXp1Y0ZjNTFOOHZO?=
 =?utf-8?B?c2kweDNkbGlieEs0SVpsSzhpQ1BFQUhzVlhRRlJDVE9qaHVpM2RkSmswV1NI?=
 =?utf-8?B?bS90NG9WTElJMXE2bGMrdklNYTZOUjhSUU4zY3Z1dUZTS1BHUnlKWHNiS2FB?=
 =?utf-8?B?MzVLbWlKWXhuY1FtaWhoSllWMFJRTU1WbVJFUzBRRTBGRCtwNVdkckNtd0VP?=
 =?utf-8?B?Rm9pNjhhSVNIMElhT1NLcWNkWlI3cmQyWEtrTzBoUjg4OVE2bHh1NUhrYzZB?=
 =?utf-8?B?WlpHdHV5N2FVNytMdzJnNFhnN2JrWFRjbXQ2RE0yNE9vV1FXWm1kVjNsNHBW?=
 =?utf-8?B?VlRTSFBNakd0Y25NUFRoaDNLRncyYlQ5ZFVsWWgxV3NpOHJHQ21NdkQ4QzI0?=
 =?utf-8?B?T3hUTUk2NlZrVzRnUHlzVmhEcUpKM2VvT2t5SmxyUW5mQWRrakc3KzNhR3Ur?=
 =?utf-8?B?a1lsbEU4TVJvcWRWcUxaaTIyK1h0UXZDWmIrT2R2U1E4ejdjdzJTcm5lUnlO?=
 =?utf-8?B?MmplaWdFaEtQTGdkVVUyY1U1SUJEZnZpR2FRYWtRREZLK2NJK2t2eTRCeWZo?=
 =?utf-8?B?bmo3VFI5dVQvQ1pGTVR5NHFNTDd4USswdUI3V2ZsUDlkQ2RzTmFUL3VQbTRS?=
 =?utf-8?B?ZzRPYk5IQUdWdG14TVpEbGtNMy9Vd3VXMTVYcDNlcFpicU5zSEIzK01xY09v?=
 =?utf-8?B?VmtQcy9PeDZQQjJySFRsTWxpYUlabXFQOHNEMGxLcXNmaGhBamU0QmNhaUZQ?=
 =?utf-8?B?UDdpdTJDdHg5cW53NWFtK0dZc1FSUG5HelNHeXhzWTJkTWlIU0R4WWlRYlB0?=
 =?utf-8?B?UmhCdzc5dTYwMk1GdFBkVkVKVThBaHluUDFuQ0xaTkZyWW1SaWRxdXdFK2J1?=
 =?utf-8?B?VFN3dGtWUysvTThkbnJOSlZ5SXVJWGJPK1NKQ0VIMjE2ekkrcjBwYVY3NDh3?=
 =?utf-8?B?WGJVUjRKZWV3U2dlVkNoek5URlJiZTFiNWpaRkhCc3I5SVpzOTE0RjQrSXBu?=
 =?utf-8?B?eGl1cFVWYUhOcmdnUlBwcy9lajk1T0tFZUtIbFM5TTNvNTViUUgvR0NaVTND?=
 =?utf-8?B?dXBnQ1N3UlgwWnoydmdLcjloMWNPb1VnbTIxK3pvYmdIbFNyMDVyV0E0dGEx?=
 =?utf-8?B?YmNBZVVQSCtHOFdGQmNIMWNibnR4QnpHMTdEUTZNUGI3NlVObk1IREVzdDVN?=
 =?utf-8?B?eFRENTZYZFpNdVlZKzBoUEE1dXhuV0p2R0kvcnRqejU4TGxaNFZ2NjB5NUNU?=
 =?utf-8?Q?HziSsamriMpFzp3Ky5h9GKyiD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44d8c8b-1601-42e6-4e0a-08dd778bde14
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 17:27:56.8998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxD0x1SP8fFG59kIweJCwGSa7R+2IpVPhSjWfKWYWZOYbSilGVpdPmp7f3pv+e2l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321

On Tue Apr 8, 2025 at 11:15 PM EDT, Matthew Wilcox wrote:
> On Tue, Apr 08, 2025 at 05:49:10PM -0700, nifan.cxl@gmail.com wrote:
>> From: Fan Ni <fan.ni@samsung.com>
>>=20
>> Convert the use of &folio->page to folio_page(folio, 0) where struct
>> filio fits in. This is part of the efforts to move some fields out of
>> struct page to reduce its size.
>
> Thanks for sending the patch.  You've mixed together quite a few things;
> I'd suggest focusing on one API at a time.
>
<snip>

>> @@ -3403,7 +3405,7 @@ static void __split_folio_to_order(struct folio *f=
olio, int old_order,
>>  	if (new_order)
>>  		folio_set_order(folio, new_order);
>>  	else
>> -		ClearPageCompound(&folio->page);
>> +		ClearPageCompound(folio_page(folio, 0));
>>  }
>
> I might be inclined to leave this one alone; this whole function needs
> to be rewritten as part of the folio split.

You mean __split_folio_to_order() needs a rewrite or
a folio version of ClearPageCompound()? Some thing like
__folio_clear_compound()?

>
>>  		folio_split_memcg_refs(folio, old_order, split_order);
>> -		split_page_owner(&folio->page, old_order, split_order);
>> +		split_page_owner(folio_page(folio, 0), old_order, split_order);
>>  		pgalloc_tag_split(folio, old_order, split_order);
>
> Not sure if split_folio_owner is something that should exist.  Haven't
> looked into it.

page owner info seems to be per page, but it should be OK to have
split_folio_owner() and do page level operations inside.

>
>>  		 */
>> -		free_page_and_swap_cache(&new_folio->page);
>> +		free_page_and_swap_cache(folio_page(new_folio, 0));
>>  	}
>
> free_page_and_swap_cache() should be converted to be
> free_folio_and_swap_cache().
>
>> =20
>> -	return __folio_split(folio, new_order, &folio->page, page, list, true)=
;
>> +	return __folio_split(folio, new_order, folio_page(folio, 0), page,
>> +			     list, true);
>>  }
>
> Probably right.

Yes, this is uniform split, using first page as split_at works.

>
>>  {
>> -	return __folio_split(folio, new_order, split_at, &folio->page, list,
>> -			false);
>> +	return __folio_split(folio, new_order, split_at, folio_page(folio, 0),
>> +			     list, false);
>>  }
>
> Ditto.

Right. For non-uniform split, caller holds the folio lock, so lock_at,
which tells the folio containing lock_at to keep locked when returning to c=
aller,
is the first page.

>
>> =20
>> -	return split_huge_page_to_list_to_order(&folio->page, list, ret);
>> +	return split_huge_page_to_list_to_order(folio_page(folio, 0), list,
>> +						ret);
>>  }
>
> Ditto.

Yes. And there are two additional instances in include/linux/huge_mm.h
(Yeah, the header file of mm/huge_memory.c is huge_mm.h).


--=20
Best Regards,
Yan, Zi

