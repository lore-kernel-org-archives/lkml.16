Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9F1D9A54
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751856355; cv=fail; b=TMPljOZRdj9FApTA9IIyeo1T3cFF0urA5WvDWTZz07P5ABhW1sSxKGKMSXgEGAOILbV/OThkp3dwlUzm9Ve2VuMw/OaXf/BXb2+mqBJK4bHweMvJjtGHerE956B7WU8w7cvqOSJFcouFXS0ZTy6lp0/z8HTfQyEDwEKY79gatdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751856355; c=relaxed/simple;
	bh=UvT0unSAEiupj/uPB+Dg8LNWJyJEDdtJ8mEbGUPDTq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QjAEw8YdXMo1UFA2o93/SW6/6vFrN+OYlpvq/upC0nkbgqBJtTqCdak7TIqDBhGBVEz8wEmbW5hNAlLoxBjBlrGPLCQkiPi07plio2S0e/yH/eWJNGEbg5thNszHBYj/loCq0u/LUmA0L/HKYwO+Q9klJGzkKTcuzbVjOdSzvWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HSnaBhHq; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HSnaBhHq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJ34XmnvzLlzskdCcseyVZncuBoQiVocn9kOhIBeIq+o0oLhJYy1L4uZJwNwMdu1ibR1t6t3z9ZlJ2yJAQBYqLfi6WWXvFMFaDiMSlhRvYRDxuGF9RGcLAQnbsnffqvGxYeQYkr4anYSCOCasBpy2zQyMWDo5xMkoYzf/GAmop6ZtsYr9lWhqXqmUPZvJtAGD2cwd0Wo9Of3ZpRCSOcQsWwnsKShqKsuSiBEvHw1WvsTduKLxC3c00wqVbZaZD8epVXugtn228RmW62X4c9PxdGtbkhe/AXPxSGwxxUBMk7554Rm+VDzI4sLn1tuQB75LZyFjQPuLzLiJQW0iPaE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XsAxz/GYtYkOSVo57V+JocrYvwZIXfmWCNpxOCf2yE=;
 b=PPPcL/Ba8t5KlRPhkRIcxoqFs0BBbkPrXcF5Z9jyTmmnTLEFWfItw007gEPu/DuTu/IZ5tu5iJIj61UevuIWgwakPfKS9UGwnjIz0aNR+vzOUwzIdAwsXFH/RB2YTAgpyLSP5nhNMQ52Jha7u1I6TJbq1NV2vaZQtVJ6u/thRshRlzu+uHaaQKIe2XMKDGqBxM7375vvQv7jUSBmbvbvvucNewbeU6YxN1f62/Aiqm7mf5xXvBSsK/judOtG7ML5pWReUwGKeOuw0rZxc3g794HVd+norWB8VQCNueJG2lJMulkbEOrv3uYVuRV+3eaQL5UYqLrDop9djYfn5MP0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XsAxz/GYtYkOSVo57V+JocrYvwZIXfmWCNpxOCf2yE=;
 b=HSnaBhHqzGsohXcSzcjc+a7+n77q2Wm6eHifX3hAkhnXm3ARBToY4bVZn71codXwpTGA5zB9/xA+2z0C8jDvTN4wy/neHsuvPeaWPZ8Yif9JqdzOLUgt0yjurhsV74oCZkE8173Z7iRu9BtGZam9wrWOWjo6WfmFX3BLbCizCMGVtGUpj58ghVH3mSRL+9w8AH60qgZoz+pKOwc8LbjXUjFtpT+hu9LjvoeZDNoREPo6e5IXFHUvdlxMlDBcQzUzCu3MOJIivXswHKJ3ooQoRWlN3i88EJjflwgutOQvnqcuLMnSH0k9p+gW+U9VWukqB3VEnpYd4UUtL+utg6wzAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB7342.namprd12.prod.outlook.com (2603:10b6:806:2b3::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.24; Mon, 7 Jul 2025 02:45:46 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 02:45:46 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
Date: Sun, 06 Jul 2025 22:45:43 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <660F3BCC-0360-458F-BFF5-92C797E165CC@nvidia.com>
In-Reply-To: <0d1e51f3-ccea-4255-9c5f-68e5a41da03c@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
 <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
 <007E2728-5BFC-40F9-8B8F-25504863D217@nvidia.com>
 <aa4f94a3-f601-4379-b6ca-4389421ccca4@nvidia.com>
 <906590D4-04E2-40CB-A853-25FE6212700C@nvidia.com>
 <eab52820-813f-4137-b664-c79ba8b453b7@nvidia.com>
 <2BC37A17-1005-4016-B4D8-85832F75C500@nvidia.com>
 <94D8C1A4-780C-4BEC-A336-7D3613B54845@nvidia.com>
 <0d1e51f3-ccea-4255-9c5f-68e5a41da03c@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR20CA0066.namprd20.prod.outlook.com
 (2603:10b6:208:235::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9d1e46-2810-42d5-73e1-08ddbd005fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5GFrTQSmUOVKab32MEm2qm6jQw5tT0LIQT6XNjbc1bFMp0ErAB0dOXqxTK88?=
 =?us-ascii?Q?21oOiUI0AhDpAuBtSRDO0xmpP2IDc2+fSx9QfyEcsQJN6XG8OhGX8mpt1itu?=
 =?us-ascii?Q?8j+is0yqtUl/HGwb4WetTc1uUXEN0bZ01A732xORZRLYRjMu7/+GEc/afs8m?=
 =?us-ascii?Q?/u4j242IQZ0dtR9FsaC1pdhFQIRxOpgAryel1T0Y6R9D0k2Mu2bFcIuLtWD9?=
 =?us-ascii?Q?oIPBJQ4MZny5x/ND8eN4COsdyqtTUoTdl0wROzFTNUICfTy8dxmoap5Z8Pes?=
 =?us-ascii?Q?ER+VZaLDDRVr8eXmYzaL1/VQGtLdTxfgbtDM4kwjTF4JUfua49P6FtptHK3B?=
 =?us-ascii?Q?97hr9zT7+xdGSZBJSDEShIDAuT/l1qwcRnTo3slBhfPjgZDIAbdFP9JRdy1j?=
 =?us-ascii?Q?Sjy7Etl8JsD0W+nJ5s3AWIjWys1pCmj/DgQKX2MABcJwgqcGlf/NRi7/zlRe?=
 =?us-ascii?Q?HPCWuuTcSF7Vak+S58IPzto7R+I+oTTgalW+JQSjjQgOZwtbBvGHDKmDS7Mn?=
 =?us-ascii?Q?4NrxDmT04gl0qODKKRUcK0hbJMbJeHPqb5ESn1f/n52yjGlP3apz+ETI9MXD?=
 =?us-ascii?Q?V5N7qq2OESZCFuX8eoMWXf92VBNZ5JmMEIsKAIsmETYaJ8f687UhuNzSIBkJ?=
 =?us-ascii?Q?1lAavtH/tn7DCk2stuMgRBF6FIq9mWznwvnjDlKnWpgk3lL1xkOqhkqXEayc?=
 =?us-ascii?Q?809vPQxaiy/H9nWVfQOIKapFU5FwVZ3ohKtIUbV96moe1kdGUYwE0sRzrVuy?=
 =?us-ascii?Q?svzMZn7JCLzqwR7N7iB1+spAViPgOzXsD1jlj7zngEPsMt2Im1My+TSUfXkt?=
 =?us-ascii?Q?cjabENkXTGuZ7/lBDfXePw+JquOScJixJgjNvcVGRuIbHNBmMa8F62RMdDQO?=
 =?us-ascii?Q?Qls9VcpNBXLByZUG6bzfdqt8Fd3vRt69gKocUIXf+6CrjoG9swR14afh7esl?=
 =?us-ascii?Q?Unr5GUMK2a8fjtZkbfRoMy6QB56EjTi+BYHlcHOIH4WiG152nSerM3yh2kxG?=
 =?us-ascii?Q?IlEPY7g+t3uZB3uVuMLHwOZUoYhyCPthW+zAUOZQ5lqQDEsWPSP6LcQFeSd6?=
 =?us-ascii?Q?musV7sO0FYKPoqdRoMH9kgbSkoGvNY7y/7haLaZwY0gBJmlrTGeymtOqwiig?=
 =?us-ascii?Q?8T+nsvqeudlnAkmhqv7SS6h05qBN628ZRpK7oEiezRw+A4ljAXYDNtrRFavV?=
 =?us-ascii?Q?qwXDym6eBVYRuGfjHHOV1JfZvPaYyTgEjLXHLhcQ4o/FD0Bj/yrhwMkxS/1j?=
 =?us-ascii?Q?I2XyjJZEhxTmmmhQ2annQA6YC/ilj9TO4LVvzC7GRBX3vzCwYl0mdGyqFU1f?=
 =?us-ascii?Q?ifRh6b9nR4DnSMotcPdhHXk/saTlD7wPkZVC/W03cDP5CDTOgP21BNC5VasZ?=
 =?us-ascii?Q?SESY/BmW8OflhkROIq8cDZnt+idEQjCC5nO0x7oNho/lw/xbwGUV97nCO+RP?=
 =?us-ascii?Q?aX1mxQQXAoE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JeEf3QyMEDc0UDcavDnngufWyLK9iR6AZLj3blsuACrxNO4+B8nYlHosIkG7?=
 =?us-ascii?Q?nKPqSHSMMlKsZS12ZxEdZACuGWDEzMQ8LP/6uWJeXG+bjmJZwnhkNCD3UBBC?=
 =?us-ascii?Q?Lt+khF1Ns8lOs1qNdIZyKeM5cgAeGaBrY4lmfsLmniDC6evpU5DN6XUvg7x8?=
 =?us-ascii?Q?BnlrhWa2Xpl3VzBhHbZ/OfZOD5kwfxRVd/SpBSwP8nLzovFU9kVXGE7bxOez?=
 =?us-ascii?Q?+O1ExRglPZRgCQNkeHYHgJ57OdqiGi5//74UyKBhiyGrZ+6ZBAjEMhq+GOtp?=
 =?us-ascii?Q?EFpUwF2fScIV6afhe1OQRUxzV6UqRwQKEsh7hL743nsch5RVSbHA65OhT5mD?=
 =?us-ascii?Q?Hb5HfaVcZfpMJ9qOhHSx8/15UCchc/2vTeuAv+RK1csLK0n43ZsCnUNyLPH2?=
 =?us-ascii?Q?raZW7DC1tEAO0QgqGISmCeLx7ZA4WsbQ0EuhMDSn3QrHHj4xbwfyIPF31Az/?=
 =?us-ascii?Q?UC39w5+jzf5eQBVwDz64F3KqAC1wec0UbYT103PQaicSqeiXRRo6/Royk6wc?=
 =?us-ascii?Q?ZhPJEmKdC6+hx7B6iTR7jCVJT4Lc09+k17eZ6vxKiOGtBxk66Qagdfylymls?=
 =?us-ascii?Q?/11eymVZYt6zyT6Era4tzfqCl5jZy5Xc0DaVAfruMptrBeMLrSu1O04NiZxS?=
 =?us-ascii?Q?enSoUj3wb8ei7X2Zzw4hCq7YC0Ak0BZhi4vuVRLn5BUWjUwRE/s5op0MXpua?=
 =?us-ascii?Q?MKsN35Tp/kv9oIktFTdlQT+wyeDcJPUZmVBJRDLbOAS+LC0FmVkJiRqDAeCe?=
 =?us-ascii?Q?bU5qhyHDDMdFin0zkFKmoNFw14zmcy0SyFyoJEKkjXNyRAAYK+OVr0141bze?=
 =?us-ascii?Q?z5WX/FaEIdzGTl3BeWFnau0E28sQG7Huiyi41TuamutQmS4VpbIotsWobljr?=
 =?us-ascii?Q?dfy3odDU3AXnNwwPKOe7uXsAgQb2aDb8D3dVpvEhRqtnd9D+ycTOmT9is8Dh?=
 =?us-ascii?Q?eW+/Qyt2ETteACg1K9Omh/1Vlq3Xhb3Lyj6XI5l0uv8+J1PeNyFFJZ325Z8W?=
 =?us-ascii?Q?RiuXuuQVHVZrAwU2dki9acVZJUsR4/jdpTV5+gTx5PgnC2BCeDuKpxUx/Mvq?=
 =?us-ascii?Q?XYBGiTSijgETazZ9GIi9G2sfUevA6IS5oV9vAp34SBLckqkvS7yvohTBesEv?=
 =?us-ascii?Q?e7bmrj93iKNUy9cT+Kcp5K5fB7iw5u3KHi34zcSsN5boVzY//RacnIs4H5sP?=
 =?us-ascii?Q?b0qYkM44bdlMXCNtIM61V68pVlKi9CXoqgdlb2tNFLWDi0isu/SfXdmMIIk3?=
 =?us-ascii?Q?zlgDYi45L1/SvxUG6nGO6MMHp78UL+Hb+o5OCtNAcUSkhXmtjzhHNODru8fm?=
 =?us-ascii?Q?Apfa+Q44SPmJ72Xd3Ura+kOP0WJPhTtuNQcAEMyHb/iDQwRq+bVrmhq2RawC?=
 =?us-ascii?Q?jdgELMsy1MY2wFOgqWf0Bz9kHi5RyRkOfI8yaamaCRoTFsSNoYVs2VCiJ9L1?=
 =?us-ascii?Q?mpqRlzn+Am7DpwZTHZae6RgJXLuTFXkV7Ht16WvYdfX+GnMoeA3riC1zPDl0?=
 =?us-ascii?Q?RdoOXw1BJCtEWQVouLEqmlbN885AfCITVRmi8fmxsgEgwZb8UzCmL5CXk5aR?=
 =?us-ascii?Q?pBv2LmhmKAPXySi0GU4l0V3svPzA0tlNmPXkbufA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9d1e46-2810-42d5-73e1-08ddbd005fa5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:45:46.0421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEuLN6iKYTS/I/m0TwN6ksEoJbUlrLySmwFVt/B5V44Q4j0ZvDYKRME+sAZ+q+SO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7342

On 6 Jul 2025, at 22:29, Balbir Singh wrote:

> On 7/6/25 13:03, Zi Yan wrote:
>> On 5 Jul 2025, at 22:34, Zi Yan wrote:
>>
>>> On 5 Jul 2025, at 21:47, Balbir Singh wrote:
>>>
>>>> On 7/6/25 11:34, Zi Yan wrote:
>>>>> On 5 Jul 2025, at 21:15, Balbir Singh wrote:
>>>>>
>>>>>> On 7/5/25 11:55, Zi Yan wrote:
>>>>>>> On 4 Jul 2025, at 20:58, Balbir Singh wrote:
>>>>>>>
>>>>>>>> On 7/4/25 21:24, Zi Yan wrote:
>>>>>>>>>
>>>>>>>>> s/pages/folio
>>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks, will make the changes
>>>>>>>>
>>>>>>>>> Why name it isolated if the folio is unmapped? Isolated folios =
often mean
>>>>>>>>> they are removed from LRU lists. isolated here causes confusion=
=2E
>>>>>>>>>
>>>>>>>>
>>>>>>>> Ack, will change the name
>>>>>>>>
>>>>>>>>
>>>>>>>>>>   *
>>>>>>>>>>   * It calls __split_unmapped_folio() to perform uniform and n=
on-uniform split.
>>>>>>>>>>   * It is in charge of checking whether the split is supported=
 or not and
>>>>>>>>>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct foli=
o *folio, unsigned int new_order,
>>>>>>>>>>   */
>>>>>>>>>>  static int __folio_split(struct folio *folio, unsigned int ne=
w_order,
>>>>>>>>>>  		struct page *split_at, struct page *lock_at,
>>>>>>>>>> -		struct list_head *list, bool uniform_split)
>>>>>>>>>> +		struct list_head *list, bool uniform_split, bool isolated)
>>>>>>>>>>  {
>>>>>>>>>>  	struct deferred_split *ds_queue =3D get_deferred_split_queue=
(folio);
>>>>>>>>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>>>>>>>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio =
*folio, unsigned int new_order,
>>>>>>>>>>  		 * is taken to serialise against parallel split or collapse=

>>>>>>>>>>  		 * operations.
>>>>>>>>>>  		 */
>>>>>>>>>> -		anon_vma =3D folio_get_anon_vma(folio);
>>>>>>>>>> -		if (!anon_vma) {
>>>>>>>>>> -			ret =3D -EBUSY;
>>>>>>>>>> -			goto out;
>>>>>>>>>> +		if (!isolated) {
>>>>>>>>>> +			anon_vma =3D folio_get_anon_vma(folio);
>>>>>>>>>> +			if (!anon_vma) {
>>>>>>>>>> +				ret =3D -EBUSY;
>>>>>>>>>> +				goto out;
>>>>>>>>>> +			}
>>>>>>>>>> +			anon_vma_lock_write(anon_vma);
>>>>>>>>>>  		}
>>>>>>>>>>  		end =3D -1;
>>>>>>>>>>  		mapping =3D NULL;
>>>>>>>>>> -		anon_vma_lock_write(anon_vma);
>>>>>>>>>>  	} else {
>>>>>>>>>>  		unsigned int min_order;
>>>>>>>>>>  		gfp_t gfp;
>>>>>>>>>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *f=
olio, unsigned int new_order,
>>>>>>>>>>  		goto out_unlock;
>>>>>>>>>>  	}
>>>>>>>>>>
>>>>>>>>>> -	unmap_folio(folio);
>>>>>>>>>> +	if (!isolated)
>>>>>>>>>> +		unmap_folio(folio);
>>>>>>>>>>
>>>>>>>>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>>>>>>>>  	local_irq_disable();
>>>>>>>>>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio =
*folio, unsigned int new_order,
>>>>>>>>>>
>>>>>>>>>>  		ret =3D __split_unmapped_folio(folio, new_order,
>>>>>>>>>>  				split_at, lock_at, list, end, &xas, mapping,
>>>>>>>>>> -				uniform_split);
>>>>>>>>>> +				uniform_split, isolated);
>>>>>>>>>>  	} else {
>>>>>>>>>>  		spin_unlock(&ds_queue->split_queue_lock);
>>>>>>>>>>  fail:
>>>>>>>>>>  		if (mapping)
>>>>>>>>>>  			xas_unlock(&xas);
>>>>>>>>>>  		local_irq_enable();
>>>>>>>>>> -		remap_page(folio, folio_nr_pages(folio), 0);
>>>>>>>>>> +		if (!isolated)
>>>>>>>>>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>>>>>>>>>  		ret =3D -EAGAIN;
>>>>>>>>>>  	}
>>>>>>>>>
>>>>>>>>> These "isolated" special handlings does not look good, I wonder=
 if there
>>>>>>>>> is a way of letting split code handle device private folios mor=
e gracefully.
>>>>>>>>> It also causes confusions, since why does "isolated/unmapped" f=
olios
>>>>>>>>> not need to unmap_page(), remap_page(), or unlock?
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>> There are two reasons for going down the current code path
>>>>>>>
>>>>>>> After thinking more, I think adding isolated/unmapped is not the =
right
>>>>>>> way, since unmapped folio is a very generic concept. If you add i=
t,
>>>>>>> one can easily misuse the folio split code by first unmapping a f=
olio
>>>>>>> and trying to split it with unmapped =3D true. I do not think tha=
t is
>>>>>>> supported and your patch does not prevent that from happening in =
the future.
>>>>>>>
>>>>>>
>>>>>> I don't understand the misuse case you mention, I assume you mean =
someone can
>>>>>> get the usage wrong? The responsibility is on the caller to do the=
 right thing
>>>>>> if calling the API with unmapped
>>>>>
>>>>> Before your patch, there is no use case of splitting unmapped folio=
s.
>>>>> Your patch only adds support for device private page split, not any=
 unmapped
>>>>> folio split. So using a generic isolated/unmapped parameter is not =
OK.
>>>>>
>>>>
>>>> There is a use for splitting unmapped folios (see below)
>>>>
>>>>>>
>>>>>>> You should teach different parts of folio split code path to hand=
le
>>>>>>> device private folios properly. Details are below.
>>>>>>>
>>>>>>>>
>>>>>>>> 1. if the isolated check is not present, folio_get_anon_vma will=
 fail and cause
>>>>>>>>    the split routine to return with -EBUSY
>>>>>>>
>>>>>>> You do something below instead.
>>>>>>>
>>>>>>> if (!anon_vma && !folio_is_device_private(folio)) {
>>>>>>> 	ret =3D -EBUSY;
>>>>>>> 	goto out;
>>>>>>> } else if (anon_vma) {
>>>>>>> 	anon_vma_lock_write(anon_vma);
>>>>>>> }
>>>>>>>
>>>>>>
>>>>>> folio_get_anon() cannot be called for unmapped folios. In our case=
 the page has
>>>>>> already been unmapped. Is there a reason why you mix anon_vma_lock=
_write with
>>>>>> the check for device private folios?
>>>>>
>>>>> Oh, I did not notice that anon_vma =3D folio_get_anon_vma(folio) is=
 also
>>>>> in if (!isolated) branch. In that case, just do
>>>>>
>>>>> if (folio_is_device_private(folio) {
>>>>> ...
>>>>> } else if (is_anon) {
>>>>> ...
>>>>> } else {
>>>>> ...
>>>>> }
>>>>>
>>>>>>
>>>>>>> People can know device private folio split needs a special handli=
ng.
>>>>>>>
>>>>>>> BTW, why a device private folio can also be anonymous? Does it me=
an
>>>>>>> if a page cache folio is migrated to device private, kernel also
>>>>>>> sees it as both device private and file-backed?
>>>>>>>
>>>>>>
>>>>>> FYI: device private folios only work with anonymous private pages,=
 hence
>>>>>> the name device private.
>>>>>
>>>>> OK.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> 2. Going through unmap_page(), remap_page() causes a full page t=
able walk, which
>>>>>>>>    the migrate_device API has already just done as a part of the=
 migration. The
>>>>>>>>    entries under consideration are already migration entries in =
this case.
>>>>>>>>    This is wasteful and in some case unexpected.
>>>>>>>
>>>>>>> unmap_folio() already adds TTU_SPLIT_HUGE_PMD to try to split
>>>>>>> PMD mapping, which you did in migrate_vma_split_pages(). You prob=
ably
>>>>>>> can teach either try_to_migrate() or try_to_unmap() to just split=

>>>>>>> device private PMD mapping. Or if that is not preferred,
>>>>>>> you can simply call split_huge_pmd_address() when unmap_folio()
>>>>>>> sees a device private folio.
>>>>>>>
>>>>>>> For remap_page(), you can simply return for device private folios=

>>>>>>> like it is currently doing for non anonymous folios.
>>>>>>>
>>>>>>
>>>>>> Doing a full rmap walk does not make sense with unmap_folio() and
>>>>>> remap_folio(), because
>>>>>>
>>>>>> 1. We need to do a page table walk/rmap walk again
>>>>>> 2. We'll need special handling of migration <-> migration entries
>>>>>>    in the rmap handling (set/remove migration ptes)
>>>>>> 3. In this context, the code is already in the middle of migration=
,
>>>>>>    so trying to do that again does not make sense.
>>>>>
>>>>> Why doing split in the middle of migration? Existing split code
>>>>> assumes to-be-split folios are mapped.
>>>>>
>>>>> What prevents doing split before migration?
>>>>>
>>>>
>>>> The code does do a split prior to migration if THP selection fails
>>>>
>>>> Please see https://lore.kernel.org/lkml/20250703233511.2028395-5-bal=
birs@nvidia.com/
>>>> and the fallback part which calls split_folio()
>>>
>>> So this split is done when the folio in system memory is mapped.
>>>
>>>>
>>>> But the case under consideration is special since the device needs t=
o allocate
>>>> corresponding pfn's as well. The changelog mentions it:
>>>>
>>>> "The common case that arises is that after setup, during migrate
>>>> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
>>>> pages."
>>>>
>>>> I can expand on it, because migrate_vma() is a multi-phase operation=

>>>>
>>>> 1. migrate_vma_setup()
>>>> 2. migrate_vma_pages()
>>>> 3. migrate_vma_finalize()
>>>>
>>>> It can so happen that when we get the destination pfn's allocated th=
e destination
>>>> might not be able to allocate a large page, so we do the split in mi=
grate_vma_pages().
>>>>
>>>> The pages have been unmapped and collected in migrate_vma_setup()
>>>
>>> So these unmapped folios are system memory folios? I thought they are=

>>> large device private folios.
>>>
>>> OK. It sounds like splitting unmapped folios is really needed. I thin=
k
>>> it is better to make a new split_unmapped_folio() function
>>> by reusing __split_unmapped_folio(), since __folio_split() assumes
>>> the input folio is mapped.
>>
>> And to make __split_unmapped_folio()'s functionality match its name,
>> I will later refactor it. At least move local_irq_enable(), remap_page=
(),
>> and folio_unlocks out of it. I will think about how to deal with
>> lru_add_split_folio(). The goal is to remove the to-be-added "unmapped=
"
>> parameter from __split_unmapped_folio().
>>
>
> That sounds like a plan, it seems like there needs to be a finish phase=
 of
> the split and it does not belong to __split_unmapped_folio(). I would p=
ropose
> that we rename "isolated" to "folio_is_migrating" and then your cleanup=
s can
> follow? Once your cleanups come in, we won't need to pass the parameter=
 to
> __split_unmapped_folio().

Sure.

The patch below should work. It only passed mm selftests and I am plannin=
g
to do more. If you are brave enough, you can give it a try and use
__split_unmapped_folio() from it.

=46rom e594924d689bef740c38d93c7c1653f31bd5ae83 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Sun, 6 Jul 2025 22:40:53 -0400
Subject: [PATCH] mm/huge_memory: move epilogue code out of
 __split_unmapped_folio()

The code is not related to splitting unmapped folio operations. Move
it out, so that __split_unmapped_folio() only do split works on unmapped
folios.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/huge_memory.c | 226 ++++++++++++++++++++++++-----------------------
 1 file changed, 116 insertions(+), 110 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 3eb1c34be601..6eead616583f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3396,9 +3396,6 @@ static void __split_folio_to_order(struct folio *fo=
lio, int old_order,
  *             order - 1 to new_order).
  * @split_at: in buddy allocator like split, the folio containing @split=
_at
  *            will be split until its order becomes @new_order.
- * @lock_at: the folio containing @lock_at is left locked for caller.
- * @list: the after split folios will be added to @list if it is not NUL=
L,
- *        otherwise to LRU lists.
  * @end: the end of the file @folio maps to. -1 if @folio is anonymous m=
emory.
  * @xas: xa_state pointing to folio->mapping->i_pages and locked by call=
er
  * @mapping: @folio->mapping
@@ -3436,40 +3433,20 @@ static void __split_folio_to_order(struct folio *=
folio, int old_order,
  * split. The caller needs to check the input folio.
  */
 static int __split_unmapped_folio(struct folio *folio, int new_order,
-		struct page *split_at, struct page *lock_at,
-		struct list_head *list, pgoff_t end,
-		struct xa_state *xas, struct address_space *mapping,
-		bool uniform_split)
+				  struct page *split_at, struct xa_state *xas,
+				  struct address_space *mapping,
+				  bool uniform_split)
 {
-	struct lruvec *lruvec;
-	struct address_space *swap_cache =3D NULL;
-	struct folio *origin_folio =3D folio;
-	struct folio *next_folio =3D folio_next(folio);
-	struct folio *new_folio;
 	struct folio *next;
 	int order =3D folio_order(folio);
 	int split_order;
 	int start_order =3D uniform_split ? new_order : order - 1;
-	int nr_dropped =3D 0;
 	int ret =3D 0;
 	bool stop_split =3D false;

-	if (folio_test_swapcache(folio)) {
-		VM_BUG_ON(mapping);
-
-		/* a swapcache folio can only be uniformly split to order-0 */
-		if (!uniform_split || new_order !=3D 0)
-			return -EINVAL;
-
-		swap_cache =3D swap_address_space(folio->swap);
-		xa_lock(&swap_cache->i_pages);
-	}
-
 	if (folio_test_anon(folio))
 		mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);

-	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
-	lruvec =3D folio_lruvec_lock(folio);

 	folio_clear_has_hwpoisoned(folio);

@@ -3541,89 +3518,10 @@ static int __split_unmapped_folio(struct folio *f=
olio, int new_order,
 						MTHP_STAT_NR_ANON, 1);
 			}

-			/*
-			 * origin_folio should be kept frozon until page cache
-			 * entries are updated with all the other after-split
-			 * folios to prevent others seeing stale page cache
-			 * entries.
-			 */
-			if (release =3D=3D origin_folio)
-				continue;
-
-			folio_ref_unfreeze(release, 1 +
-					((mapping || swap_cache) ?
-						folio_nr_pages(release) : 0));
-
-			lru_add_split_folio(origin_folio, release, lruvec,
-					list);
-
-			/* Some pages can be beyond EOF: drop them from cache */
-			if (release->index >=3D end) {
-				if (shmem_mapping(mapping))
-					nr_dropped +=3D folio_nr_pages(release);
-				else if (folio_test_clear_dirty(release))
-					folio_account_cleaned(release,
-						inode_to_wb(mapping->host));
-				__filemap_remove_folio(release, NULL);
-				folio_put_refs(release, folio_nr_pages(release));
-			} else if (mapping) {
-				__xa_store(&mapping->i_pages,
-						release->index, release, 0);
-			} else if (swap_cache) {
-				__xa_store(&swap_cache->i_pages,
-						swap_cache_index(release->swap),
-						release, 0);
-			}
 		}
 	}

-	/*
-	 * Unfreeze origin_folio only after all page cache entries, which used
-	 * to point to it, have been updated with new folios. Otherwise,
-	 * a parallel folio_try_get() can grab origin_folio and its caller can
-	 * see stale page cache entries.
-	 */
-	folio_ref_unfreeze(origin_folio, 1 +
-		((mapping || swap_cache) ? folio_nr_pages(origin_folio) : 0));
-
-	unlock_page_lruvec(lruvec);
-
-	if (swap_cache)
-		xa_unlock(&swap_cache->i_pages);
-	if (mapping)
-		xa_unlock(&mapping->i_pages);

-	/* Caller disabled irqs, so they are still disabled here */
-	local_irq_enable();
-
-	if (nr_dropped)
-		shmem_uncharge(mapping->host, nr_dropped);
-
-	remap_page(origin_folio, 1 << order,
-			folio_test_anon(origin_folio) ?
-				RMP_USE_SHARED_ZEROPAGE : 0);
-
-	/*
-	 * At this point, folio should contain the specified page.
-	 * For uniform split, it is left for caller to unlock.
-	 * For buddy allocator like split, the first after-split folio is left
-	 * for caller to unlock.
-	 */
-	for (new_folio =3D origin_folio; new_folio !=3D next_folio; new_folio =3D=
 next) {
-		next =3D folio_next(new_folio);
-		if (new_folio =3D=3D page_folio(lock_at))
-			continue;
-
-		folio_unlock(new_folio);
-		/*
-		 * Subpages may be freed if there wasn't any mapping
-		 * like if add_to_swap() is running on a lru page that
-		 * had its mapping zapped. And freeing these pages
-		 * requires taking the lru_lock so we do the put_page
-		 * of the tail pages after the split is complete.
-		 */
-		free_folio_and_swap_cache(new_folio);
-	}
 	return ret;
 }

@@ -3706,10 +3604,12 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
 {
 	struct deferred_split *ds_queue =3D get_deferred_split_queue(folio);
 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
+	struct folio *next_folio =3D folio_next(folio);
 	bool is_anon =3D folio_test_anon(folio);
 	struct address_space *mapping =3D NULL;
 	struct anon_vma *anon_vma =3D NULL;
 	int order =3D folio_order(folio);
+	struct folio *new_folio, *next;
 	int extra_pins, ret;
 	pgoff_t end;
 	bool is_hzp;
@@ -3840,6 +3740,10 @@ static int __folio_split(struct folio *folio, unsi=
gned int new_order,
 	/* Prevent deferred_split_scan() touching ->_refcount */
 	spin_lock(&ds_queue->split_queue_lock);
 	if (folio_ref_freeze(folio, 1 + extra_pins)) {
+		struct address_space *swap_cache =3D NULL;
+		struct lruvec *lruvec;
+		int nr_dropped =3D 0;
+
 		if (folio_order(folio) > 1 &&
 		    !list_empty(&folio->_deferred_list)) {
 			ds_queue->split_queue_len--;
@@ -3873,19 +3777,121 @@ static int __folio_split(struct folio *folio, un=
signed int new_order,
 			}
 		}

-		ret =3D __split_unmapped_folio(folio, new_order,
-				split_at, lock_at, list, end, &xas, mapping,
-				uniform_split);
+		if (folio_test_swapcache(folio)) {
+			VM_BUG_ON(mapping);
+
+			/* a swapcache folio can only be uniformly split to order-0 */
+			if (!uniform_split || new_order !=3D 0) {
+				ret =3D -EINVAL;
+				goto out_unlock;
+			}
+
+			swap_cache =3D swap_address_space(folio->swap);
+			xa_lock(&swap_cache->i_pages);
+		}
+
+		/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
+		lruvec =3D folio_lruvec_lock(folio);
+
+		ret =3D __split_unmapped_folio(folio, new_order, split_at, &xas,
+					     mapping, uniform_split);
+
+		/* Unfreeze after-split folios */
+		for (new_folio =3D folio; new_folio !=3D next_folio;
+		     new_folio =3D next) {
+			next =3D folio_next(new_folio);
+			/*
+			 * @folio should be kept frozon until page cache
+			 * entries are updated with all the other after-split
+			 * folios to prevent others seeing stale page cache
+			 * entries.
+			 */
+			if (new_folio =3D=3D folio)
+				continue;
+
+			folio_ref_unfreeze(
+				new_folio,
+				1 + ((mapping || swap_cache) ?
+					     folio_nr_pages(new_folio) :
+					     0));
+
+			lru_add_split_folio(folio, new_folio, lruvec, list);
+
+			/* Some pages can be beyond EOF: drop them from cache */
+			if (new_folio->index >=3D end) {
+				if (shmem_mapping(mapping))
+					nr_dropped +=3D folio_nr_pages(new_folio);
+				else if (folio_test_clear_dirty(new_folio))
+					folio_account_cleaned(
+						new_folio,
+						inode_to_wb(mapping->host));
+				__filemap_remove_folio(new_folio, NULL);
+				folio_put_refs(new_folio,
+					       folio_nr_pages(new_folio));
+			} else if (mapping) {
+				__xa_store(&mapping->i_pages, new_folio->index,
+					   new_folio, 0);
+			} else if (swap_cache) {
+				__xa_store(&swap_cache->i_pages,
+					   swap_cache_index(new_folio->swap),
+					   new_folio, 0);
+			}
+		}
+		/*
+		 * Unfreeze @folio only after all page cache entries, which
+		 * used to point to it, have been updated with new folios.
+		 * Otherwise, a parallel folio_try_get() can grab origin_folio
+		 * and its caller can see stale page cache entries.
+		 */
+		folio_ref_unfreeze(folio, 1 +
+			((mapping || swap_cache) ? folio_nr_pages(folio) : 0));
+
+		unlock_page_lruvec(lruvec);
+
+		if (swap_cache)
+			xa_unlock(&swap_cache->i_pages);
+		if (mapping)
+			xa_unlock(&mapping->i_pages);
+
+		if (nr_dropped)
+			shmem_uncharge(mapping->host, nr_dropped);
+
 	} else {
 		spin_unlock(&ds_queue->split_queue_lock);
 fail:
 		if (mapping)
 			xas_unlock(&xas);
-		local_irq_enable();
-		remap_page(folio, folio_nr_pages(folio), 0);
 		ret =3D -EAGAIN;
 	}

+	local_irq_enable();
+
+	remap_page(folio, 1 << order,
+		   !ret && folio_test_anon(folio) ? RMP_USE_SHARED_ZEROPAGE :
+						    0);
+
+	/*
+	 * At this point, folio should contain the specified page.
+	 * For uniform split, it is left for caller to unlock.
+	 * For buddy allocator like split, the first after-split folio is left
+	 * for caller to unlock.
+	 */
+	for (new_folio =3D folio; new_folio !=3D next_folio; new_folio =3D next=
) {
+		next =3D folio_next(new_folio);
+		if (new_folio =3D=3D page_folio(lock_at))
+			continue;
+
+		folio_unlock(new_folio);
+		/*
+		 * Subpages may be freed if there wasn't any mapping
+		 * like if add_to_swap() is running on a lru page that
+		 * had its mapping zapped. And freeing these pages
+		 * requires taking the lru_lock so we do the put_page
+		 * of the tail pages after the split is complete.
+		 */
+		free_folio_and_swap_cache(new_folio);
+	}
+
 out_unlock:
 	if (anon_vma) {
 		anon_vma_unlock_write(anon_vma);
-- =

2.47.2



--
Best Regards,
Yan, Zi
