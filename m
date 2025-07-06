Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D6B1419A9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751769253; cv=fail; b=WGhqb66f4c7xNuk0v/UScJgJtetEt8Hw5JOUHPNB48wKYCwi/mIqL73v0rV7+m+Se7+fMKgCQaH3IxO3RSeMYD3r9qLxE80eDgD7DE6mClOvp6jDoItE7GhIXfsWFmJwHTdtMNOyDbicM9otYJBy/TMAI5hLn9h2bv0K3P6YMuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751769253; c=relaxed/simple;
	bh=MJCM/j3jJyRpX/02dyqf4T19C50ryNrNVYa1JAdCCY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ms+B+lSHEZXQFSASYQKWgmh5TGosA7MW8nx6abpQJ/bqO4sdyG5AzsAUFeRK0ZbAhuWe3UR1IIOxVMSzLiPLGkzS9UQXX7qc5cVJ592kF95MOnLKEMe1S/jIdkIF2JtaNbpZIdGi1R7XyWC/V/PXzH/8SfSaImGDVy3OoOLH9Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uta5Gwe+; arc=fail smtp.client-ip=40.107.243.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uta5Gwe+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+pCMl5X1/mgGdu+1T3gjmhSSW/4607Jteo4Zn254zvUuThiQRNZ66IVIS1iQf3BC2OfTAfvi8HF3nW9JpXbubFnxOMTabUoMT33sNkX9u2ZukdL47NJOnI+qfYOJNNA8faEgRTEDruOREGEGRITHMCEE/xDZs1l69ozeS+72aH2RkWGoRN60uOpQk1jOwAmBUhFyLc3Abes4KA2ARL4WLl1xKhW9BXdpYyRKz09/XvSQLD7Jgfz2yNqh259S11Jb4Vpor0TFm4FOTK9EB3xLNHN1dg9pfns1fj0PJOvu9fTI1izD6pfqO5KMWzdmaKI0TXmo+tnBtxfKyz7E6aEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0151DWHRCeRQgKDlFIFfiqt2noYQIOXKxt3eA9c6ua0=;
 b=MvwNztVhjFvJ6GbW5zqSfnKwvZ9YTLlktL9ucwafh3IDdWf6s3Q4mqP5sWpJZ2In2UUD+yliLu3dzJSBrqQdUwY2iQcqjYhmsH+HMA2bZuFkcYzEzNnf0DRpmIQS79SatCEnmfiCXGFvla6J6Wi/fBEDN3qGw/BkZFUXDawW+gwekTFR6F61XUL28XHCc66Cn9U909PR0u8IbzNQ1yHhnd/xFBbzrG1MaIb6gLJZ+VeTEWSNyawvlonJSBlcpXNSop3/gYmV03qavVFcTuPn5gXVkc/qi0AevRICdThVxPslmXniytBJPXACuxbimL4WZomz0Ep7E9QUXuRs9opLgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0151DWHRCeRQgKDlFIFfiqt2noYQIOXKxt3eA9c6ua0=;
 b=Uta5Gwe+8cVYOIhy3+pe+pFARA/1yToY6XIVKMVIy5+kF9J5oHyrZzFkAzPOEMXgg9YwBzDXNVrPLb7H1hYQ1GC6iMVnQoieuJS2eUWKwqifZvrHdce/cpwvzFhSde+Gfx8xBQ2KLpZ+NRGRRf61ugf2vUvEXvdt4+L1xe6ianUy51/D38lTD3dDxZRA7LRgqJYYtEliSGSejDMwfLQXvMh1XvWWZh+k+56XLBi2kpRo2q8hAmzc1+HIKuI2CZC5yFj/8/2/zIEgWIE788eF+p7XVIKAjGP5pWf1aTAGS30s4fzbfrzCl763xmrYnDQNXjrAhwTFZwTh2Ny3Axxdzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.22; Sun, 6 Jul 2025 02:34:07 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 02:34:07 +0000
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
Date: Sat, 05 Jul 2025 22:34:02 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <2BC37A17-1005-4016-B4D8-85832F75C500@nvidia.com>
In-Reply-To: <eab52820-813f-4137-b664-c79ba8b453b7@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
 <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
 <007E2728-5BFC-40F9-8B8F-25504863D217@nvidia.com>
 <aa4f94a3-f601-4379-b6ca-4389421ccca4@nvidia.com>
 <906590D4-04E2-40CB-A853-25FE6212700C@nvidia.com>
 <eab52820-813f-4137-b664-c79ba8b453b7@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR01CA0043.prod.exchangelabs.com (2603:10b6:208:23f::12)
 To DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ce8d61-07dc-482b-ec3e-08ddbc359489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rJnqDgkOjAps6fs2anp/AyDXOREjbJ5paFRc97RmCrMXQtNwe1eQohaa6r/n?=
 =?us-ascii?Q?ainjCNbLgg1o9kFtCcZ3aqAwSODUkMHEPDZ9IFCpQbx5wiaFFoA5I2daOJNd?=
 =?us-ascii?Q?K1C/1XfX458vtS3Vw8QW/huXR3JmFFH9vwcFgmGcFmogNHigPSL9g2R81F7a?=
 =?us-ascii?Q?vf15jpSzK0xJHAcQqzkrM7toG1QxPKvXAIdp6bp3YJ8z665HdWGbTUegZjQs?=
 =?us-ascii?Q?X+lstBbEcTFr9jcLDFiqwh57zmPH/CfDazRg32MNa9MynOFdtLzKgNB5fQwC?=
 =?us-ascii?Q?yqtFdypWEYH4Pw3tgcWGxIe94J9lI6uYsynAgANq+V0Jcx2i+uxEXv8qTeLo?=
 =?us-ascii?Q?yz81d9nFSl7CC5BCjMGt5zvS/So5hJVKr5z/dSMmCvVPl666NomKnZUY9/Aa?=
 =?us-ascii?Q?j1gDA0GfdbMIlghGLzYEmYzm/nXVxN6ZiUj/RXNCU4zOndrih3TY5wevHi0X?=
 =?us-ascii?Q?f2iEwCI5Hf9wQO5IaVnkSZtFCVTwM9I/ETbHU+G2eQGZbqr8fsPx4Mmy5lPN?=
 =?us-ascii?Q?uRBKytQNL6CMmanl9H8h+SIkFnrw9YT1DbMM4YN8AOySCn/dlbj1O2do0cDp?=
 =?us-ascii?Q?0eEGZVft1YTm4KYnsoxgoQ139a4DjQQ5p96kKaXDheZ3bREiFz6aIf2r5WMJ?=
 =?us-ascii?Q?EZ66KohBmQRhai8fyvUJ/EAut/vKrf6og2Mw1oCLk+sEHHJTKrC2GSoU1Dwg?=
 =?us-ascii?Q?OIWOCMWKYrSa4fQEUjygZxZJBka1KEWe3lFFReUAxItBinoQa/jdOz+KZyje?=
 =?us-ascii?Q?obPWlEXTiGAJAk/QS0qZTyzkT0G8RacKebGagaWscPsJLV4HxEgOYLD2Yna/?=
 =?us-ascii?Q?0LHXpVkmnCAGhN429x89dcLGKQpCv+YpgbXuzjzqo0xnq4ZgpxIPpy3xFlf9?=
 =?us-ascii?Q?2J2/icH1cggKR/5ly4IMGcXGmYC3ISBNiod72GUKd8kegJy6ccQtxliENQQO?=
 =?us-ascii?Q?kiOA8FQTOsw88btlVSO/0gM2QipeViW6o1SQ24aeBWHHnfH80QJ2H1sR+sqn?=
 =?us-ascii?Q?10XXOso5XxLi5GKVDoK17inDt+nOa216g0qFPiKzrE1GbIpQsjKRsXryc4U8?=
 =?us-ascii?Q?mRC0CylmcLDvTftXZAUri675rAIctGIsidXvkd/7X/wEB05CcQLYNjIDcePz?=
 =?us-ascii?Q?Yuat33Xd5M+RBhcX0KVVG5lQsWKsbkPZFPd40zNgLiXqrO+PL0AiuZzf4hKw?=
 =?us-ascii?Q?tTzCXd07M8bn2RfW255IuXrzhsezqccdpbaIPeDId9pugdgFuLzwYbhZ7yW7?=
 =?us-ascii?Q?rY/6ASIcSKrl4D1Gvd8gzBAjrPcmYEiZhOgd3Wdl8yaO1inAMjHAa6+YCEra?=
 =?us-ascii?Q?reGi0wjJev6VrBrilQzJElEuiGtSrIfFDdSkudv7nir/PE61t2+OwHnRFs4c?=
 =?us-ascii?Q?75oKv/m+UGTrKVSwsvt/+qLRKQUYOfsfHUjeTmnerAm/ymxWXpscbqIhxhtd?=
 =?us-ascii?Q?FGxWM1TCqKU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gFu/ZRlIhLYaxdK3uJ1JBEhcfNcVzubju82Fj0fZwwOODwcjwlcF9VNRX1TW?=
 =?us-ascii?Q?mvnoLEn1vbuIZVVIVn4UbSgsGwmeFTloz0u+z8o+E0C76RaGZIPLV8B7ZboC?=
 =?us-ascii?Q?HDsNLR/Iga2ueNvwxCLp1XHXFG0EzMhn+vZz4DwpPvktbX8oY+ck/IH/qlr6?=
 =?us-ascii?Q?5kXePKx9nrvYPeMyMBQ5QknxsVFAiXwQG7zzlUPdu+wAB6NEk6AsK+Oghmzz?=
 =?us-ascii?Q?87WFwgQxN+vEjfKjlP2jHXreEAZ85bevAFZC84yjq7M+QyXVPWsoa48Ggewl?=
 =?us-ascii?Q?vcO9IEfQg8OrFwnG6ddQn7J7eMntM96JdILT3hJLUKqJx3/LG0Uwsy5RO4hQ?=
 =?us-ascii?Q?vs+UdTwGCqRytBjM+IIUeM/xoVYQBH2okBxIc8KifbLyL1yMh+9szRtmbKen?=
 =?us-ascii?Q?tIwip6eSLrUFsznD7XJK6AeOz3+DGReXCmxV9VJsqXOluj4toX6npVmvecKk?=
 =?us-ascii?Q?MEu3nUFemLm7kd4ui2xjShSPT132y2Aw8PgBIb56/f94Z/c/uoEmIxePM4IO?=
 =?us-ascii?Q?rt+fM7JFQUebSafxs30MUVdVdHkBMSOjxUWAgXJWraoU9A5i0c2w74dw25q0?=
 =?us-ascii?Q?yt0hMkjEThRlwdKyOyYmOtjZPp16BUCbyl1qqj9FyMjZw8hF4R38Y+8mFLpX?=
 =?us-ascii?Q?C6rGp97WN4m9/PclaZLT5PoR6evTqjhtykhigGqCV/5tg/fQq681kmClKZEy?=
 =?us-ascii?Q?okIFe7FcFfde6t6rRtcA9JKFri5TQuLR7hkGglVfyR6quG7oEIMxTLIiJtGl?=
 =?us-ascii?Q?6r8H131+g7noWzYJW87oRcAInXwN/TG5DuW175rFm/NLpnWrCiA2Ix+y9Nrk?=
 =?us-ascii?Q?PLVGRv+EZwBeafrTatAcMyV6V/Na7B8KZx9uPBNciQ7Y4yI/uVeF1Vs1MEzY?=
 =?us-ascii?Q?SYYi1excAfUWoVmklJ6vI47xc4qXPLcqee+kdK7a87Ipn2GJi6t74FzwWbKm?=
 =?us-ascii?Q?KTcYkBQUsFaR5ZVHayACfz+zzpYpeKrZeNOPE9/DOJDoyTtZ+7wHV4+RzlKY?=
 =?us-ascii?Q?v9DHn3rwzot+abYZTWi/XJYI2jKROe58ZWEbyD8CMJuyj2cvGsa5UKlTyN9s?=
 =?us-ascii?Q?tSkEUN8DZPj6f2yS7KtWh99cUdRbtgHd6KRqiEfp8jvnxlJOwWGCyErxfR2X?=
 =?us-ascii?Q?Ptx8OoL2cq5qIuPrjkNiGUIwyIiYPRPmUztAaOhErz8aQQpM5rzxjb/o5o1L?=
 =?us-ascii?Q?puZ5xFa/8FgXYsJsHOMREzc3qKVLCvogefKsHcTyx8geLA7USav611PHtbkK?=
 =?us-ascii?Q?/eJynzpAJyLkk6Eio3LJFDqW3gWQTQaiBSFBgjwOraJnkCX0xdF7ncbWsrFN?=
 =?us-ascii?Q?l+aAULU37j9tjsMoNqSnWW0mkSA0JgZ7FejsVaJJ/PF91yVXaDz41YJRd4U0?=
 =?us-ascii?Q?KkqbojiQlWG8L4EQGUEwAvG7JzwJGVjZtzWV8YBLFiQgDEXpCs2xzGJQ9Zau?=
 =?us-ascii?Q?NaDTWNvyMHOlOHZORNNkqFDQMPKmXiTycB7zSZ0tawOPoiYQKVbby3NwXFL8?=
 =?us-ascii?Q?zNFNMWUiHAzzFCPoCiSz8rdtNMfL0Dt0DRdX+naQU4jrUZBVE7RrujmllfZT?=
 =?us-ascii?Q?jtCPgzmbaABIDkJRqKGqlWXvyOKskzxtjqQ80lWB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ce8d61-07dc-482b-ec3e-08ddbc359489
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 02:34:06.9406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3/nFKft7z4VW0g+525g/M+roSmkpwMLM3qvimdZPU+TJFsLJ1ZmcwkYJjRAQCI4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610

On 5 Jul 2025, at 21:47, Balbir Singh wrote:

> On 7/6/25 11:34, Zi Yan wrote:
>> On 5 Jul 2025, at 21:15, Balbir Singh wrote:
>>
>>> On 7/5/25 11:55, Zi Yan wrote:
>>>> On 4 Jul 2025, at 20:58, Balbir Singh wrote:
>>>>
>>>>> On 7/4/25 21:24, Zi Yan wrote:
>>>>>>
>>>>>> s/pages/folio
>>>>>>
>>>>>
>>>>> Thanks, will make the changes
>>>>>
>>>>>> Why name it isolated if the folio is unmapped? Isolated folios oft=
en mean
>>>>>> they are removed from LRU lists. isolated here causes confusion.
>>>>>>
>>>>>
>>>>> Ack, will change the name
>>>>>
>>>>>
>>>>>>>   *
>>>>>>>   * It calls __split_unmapped_folio() to perform uniform and non-=
uniform split.
>>>>>>>   * It is in charge of checking whether the split is supported or=
 not and
>>>>>>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *=
folio, unsigned int new_order,
>>>>>>>   */
>>>>>>>  static int __folio_split(struct folio *folio, unsigned int new_o=
rder,
>>>>>>>  		struct page *split_at, struct page *lock_at,
>>>>>>> -		struct list_head *list, bool uniform_split)
>>>>>>> +		struct list_head *list, bool uniform_split, bool isolated)
>>>>>>>  {
>>>>>>>  	struct deferred_split *ds_queue =3D get_deferred_split_queue(fo=
lio);
>>>>>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>>>>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *fo=
lio, unsigned int new_order,
>>>>>>>  		 * is taken to serialise against parallel split or collapse
>>>>>>>  		 * operations.
>>>>>>>  		 */
>>>>>>> -		anon_vma =3D folio_get_anon_vma(folio);
>>>>>>> -		if (!anon_vma) {
>>>>>>> -			ret =3D -EBUSY;
>>>>>>> -			goto out;
>>>>>>> +		if (!isolated) {
>>>>>>> +			anon_vma =3D folio_get_anon_vma(folio);
>>>>>>> +			if (!anon_vma) {
>>>>>>> +				ret =3D -EBUSY;
>>>>>>> +				goto out;
>>>>>>> +			}
>>>>>>> +			anon_vma_lock_write(anon_vma);
>>>>>>>  		}
>>>>>>>  		end =3D -1;
>>>>>>>  		mapping =3D NULL;
>>>>>>> -		anon_vma_lock_write(anon_vma);
>>>>>>>  	} else {
>>>>>>>  		unsigned int min_order;
>>>>>>>  		gfp_t gfp;
>>>>>>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *foli=
o, unsigned int new_order,
>>>>>>>  		goto out_unlock;
>>>>>>>  	}
>>>>>>>
>>>>>>> -	unmap_folio(folio);
>>>>>>> +	if (!isolated)
>>>>>>> +		unmap_folio(folio);
>>>>>>>
>>>>>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>>>>>  	local_irq_disable();
>>>>>>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *fo=
lio, unsigned int new_order,
>>>>>>>
>>>>>>>  		ret =3D __split_unmapped_folio(folio, new_order,
>>>>>>>  				split_at, lock_at, list, end, &xas, mapping,
>>>>>>> -				uniform_split);
>>>>>>> +				uniform_split, isolated);
>>>>>>>  	} else {
>>>>>>>  		spin_unlock(&ds_queue->split_queue_lock);
>>>>>>>  fail:
>>>>>>>  		if (mapping)
>>>>>>>  			xas_unlock(&xas);
>>>>>>>  		local_irq_enable();
>>>>>>> -		remap_page(folio, folio_nr_pages(folio), 0);
>>>>>>> +		if (!isolated)
>>>>>>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>>>>>>  		ret =3D -EAGAIN;
>>>>>>>  	}
>>>>>>
>>>>>> These "isolated" special handlings does not look good, I wonder if=
 there
>>>>>> is a way of letting split code handle device private folios more g=
racefully.
>>>>>> It also causes confusions, since why does "isolated/unmapped" foli=
os
>>>>>> not need to unmap_page(), remap_page(), or unlock?
>>>>>>
>>>>>>
>>>>>
>>>>> There are two reasons for going down the current code path
>>>>
>>>> After thinking more, I think adding isolated/unmapped is not the rig=
ht
>>>> way, since unmapped folio is a very generic concept. If you add it,
>>>> one can easily misuse the folio split code by first unmapping a foli=
o
>>>> and trying to split it with unmapped =3D true. I do not think that i=
s
>>>> supported and your patch does not prevent that from happening in the=
 future.
>>>>
>>>
>>> I don't understand the misuse case you mention, I assume you mean som=
eone can
>>> get the usage wrong? The responsibility is on the caller to do the ri=
ght thing
>>> if calling the API with unmapped
>>
>> Before your patch, there is no use case of splitting unmapped folios.
>> Your patch only adds support for device private page split, not any un=
mapped
>> folio split. So using a generic isolated/unmapped parameter is not OK.=

>>
>
> There is a use for splitting unmapped folios (see below)
>
>>>
>>>> You should teach different parts of folio split code path to handle
>>>> device private folios properly. Details are below.
>>>>
>>>>>
>>>>> 1. if the isolated check is not present, folio_get_anon_vma will fa=
il and cause
>>>>>    the split routine to return with -EBUSY
>>>>
>>>> You do something below instead.
>>>>
>>>> if (!anon_vma && !folio_is_device_private(folio)) {
>>>> 	ret =3D -EBUSY;
>>>> 	goto out;
>>>> } else if (anon_vma) {
>>>> 	anon_vma_lock_write(anon_vma);
>>>> }
>>>>
>>>
>>> folio_get_anon() cannot be called for unmapped folios. In our case th=
e page has
>>> already been unmapped. Is there a reason why you mix anon_vma_lock_wr=
ite with
>>> the check for device private folios?
>>
>> Oh, I did not notice that anon_vma =3D folio_get_anon_vma(folio) is al=
so
>> in if (!isolated) branch. In that case, just do
>>
>> if (folio_is_device_private(folio) {
>> ...
>> } else if (is_anon) {
>> ...
>> } else {
>> ...
>> }
>>
>>>
>>>> People can know device private folio split needs a special handling.=

>>>>
>>>> BTW, why a device private folio can also be anonymous? Does it mean
>>>> if a page cache folio is migrated to device private, kernel also
>>>> sees it as both device private and file-backed?
>>>>
>>>
>>> FYI: device private folios only work with anonymous private pages, he=
nce
>>> the name device private.
>>
>> OK.
>>
>>>
>>>>
>>>>> 2. Going through unmap_page(), remap_page() causes a full page tabl=
e walk, which
>>>>>    the migrate_device API has already just done as a part of the mi=
gration. The
>>>>>    entries under consideration are already migration entries in thi=
s case.
>>>>>    This is wasteful and in some case unexpected.
>>>>
>>>> unmap_folio() already adds TTU_SPLIT_HUGE_PMD to try to split
>>>> PMD mapping, which you did in migrate_vma_split_pages(). You probabl=
y
>>>> can teach either try_to_migrate() or try_to_unmap() to just split
>>>> device private PMD mapping. Or if that is not preferred,
>>>> you can simply call split_huge_pmd_address() when unmap_folio()
>>>> sees a device private folio.
>>>>
>>>> For remap_page(), you can simply return for device private folios
>>>> like it is currently doing for non anonymous folios.
>>>>
>>>
>>> Doing a full rmap walk does not make sense with unmap_folio() and
>>> remap_folio(), because
>>>
>>> 1. We need to do a page table walk/rmap walk again
>>> 2. We'll need special handling of migration <-> migration entries
>>>    in the rmap handling (set/remove migration ptes)
>>> 3. In this context, the code is already in the middle of migration,
>>>    so trying to do that again does not make sense.
>>
>> Why doing split in the middle of migration? Existing split code
>> assumes to-be-split folios are mapped.
>>
>> What prevents doing split before migration?
>>
>
> The code does do a split prior to migration if THP selection fails
>
> Please see https://lore.kernel.org/lkml/20250703233511.2028395-5-balbir=
s@nvidia.com/
> and the fallback part which calls split_folio()

So this split is done when the folio in system memory is mapped.

>
> But the case under consideration is special since the device needs to a=
llocate
> corresponding pfn's as well. The changelog mentions it:
>
> "The common case that arises is that after setup, during migrate
> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
> pages."
>
> I can expand on it, because migrate_vma() is a multi-phase operation
>
> 1. migrate_vma_setup()
> 2. migrate_vma_pages()
> 3. migrate_vma_finalize()
>
> It can so happen that when we get the destination pfn's allocated the d=
estination
> might not be able to allocate a large page, so we do the split in migra=
te_vma_pages().
>
> The pages have been unmapped and collected in migrate_vma_setup()

So these unmapped folios are system memory folios? I thought they are
large device private folios.

OK. It sounds like splitting unmapped folios is really needed. I think
it is better to make a new split_unmapped_folio() function
by reusing __split_unmapped_folio(), since __folio_split() assumes
the input folio is mapped.

>
> The next patch in the series 9/12 (https://lore.kernel.org/lkml/2025070=
3233511.2028395-10-balbirs@nvidia.com/)
> tests the split and emulates a failure on the device side to allocate l=
arge pages
> and tests it in 10/12 (https://lore.kernel.org/lkml/20250703233511.2028=
395-11-balbirs@nvidia.com/)
>
>
>>>
>>>
>>>>
>>>> For lru_add_split_folio(), you can skip it if a device private
>>>> folio is seen.
>>>>
>>>> Last, for unlock part, why do you need to keep all after-split folio=
s
>>>> locked? It should be possible to just keep the to-be-migrated folio
>>>> locked and unlock the rest for a later retry. But I could miss somet=
hing
>>>> since I am not familiar with device private migration code.
>>>>
>>>
>>> Not sure I follow this comment
>>
>> Because the patch is doing split in the middle of migration and existi=
ng
>> split code never supports. My comment is based on the assumption that
>> the split is done when a folio is mapped.
>>
>
> Understood, hopefully I've explained the reason for the split in the mi=
ddle
> of migration


--
Best Regards,
Yan, Zi
