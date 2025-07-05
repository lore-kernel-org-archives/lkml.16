Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C06D2FF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751680543; cv=fail; b=ZQTWeUGXaKSDYtcambbmihmB1WL04TJbXpbJk4oPMwaekuFIhdRUh2S6uUdbRoTQgg/yCH5E93dA2CvujKeoGCFPfSEOIYPtsIcFA06HJwlb+3PnEd9AJQt3whesHgaSFbLOn7+3cIuEN5kXAjqXGLBFVY5DL3Fqbl5voaAQtCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751680543; c=relaxed/simple;
	bh=rzelHQ4nFGYG71zZ6Ejz1OJaACwaviYKEkl9bTAYhiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SYq0BbwYU+eTLupYwJKMDcOPzdMpEOZ8KNg4WrfBz3rkD6/bOoWG3enCj9Td0JCz8+VGw6aQlTncymsOqUkY3bqyUY3L/tSiimUKVvEWJOt1pZmDQgludFbKu5DBcvWggpPp4dtFQsGS20Bc0ZZa3IdiIz9lSjCERzooWVUKBIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mSMZJX8g; arc=fail smtp.client-ip=40.107.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mSMZJX8g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejTRfnhdTCVB3XSAEu62Q7Nt1FK5q+bnwATDs9TdxfwGtt1YMetbD1A75DRB81CCsZD4kf7Gy/RqeU5Mm2RBXkzN9MDAr9y3DM6UoGbgRkdNs297zSyGM/X/mfuhWGE52Mw+GIK7xONVuQfp8qDq9S6zQyneeirHE6FMyZ4GXw/p9YHcBeOwIYOturcOGCUu2ZF0j/PMRHaYHLv1OIalS9SnBRMsnoKKyfv7hrsy+15W1VKKgMcX+7rEoynJj5ESwREWy38nu5aEaztdhfOeUXta9ExcAv50Bpp3Evn5wEz5AAWO8bl06QSP5S5QDiAESLQ/JNPbaGY3l3azzLZfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ffranww673O09SSDxy+SOiAxUAWebU3AznO3mT7CKE=;
 b=Skc5e5Bh213g42tMQmgzogQUyrAUyMgRqedni1TolDra09JYhOiLUIWKtAeL+VAKeUEtw7C9VAxavVNSNqaEgsloQE2+djcLaVAJjxWT67Brm5kL+B9kgr6f+0vcTC/7c1OluZb3JMjouS8ZlBwbV29SDvN7M5A5Gzo1zJ23GopKP75Q8LxqVw0h6wW7JwmhiLIhIsUsMRXGCo39wlvKxH1Mjv2YNWDM6gTOLpIt2n44fvaFsz6ZNcixCGD/LjbN00/uyWlTLG1dGtEt9vOT64d7R7AONe49uDQZl5aitKQwXSY2HevF27KujhS4QjkYmfTMeDtkyO5XYbVe4T+XOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ffranww673O09SSDxy+SOiAxUAWebU3AznO3mT7CKE=;
 b=mSMZJX8gB2fRvHL7uu9p+cBp/w4ZPIITH1LeSeaK4BBC8sBKS3HosyoDsWQeOfotbtQR1bKinLOp3EBYZbSUV2lhJv232/TGl1qmGZZjx91CR7uhAnvZae3st33QYPxL2Gh/tjGuOHwMPGskkf8nyJF0JER5s9Ypt7MeQIxXvHpjmD4k0uDDE8QfXFMQzX5yamW0JbAU2n8zQfL9WZzyIm4tok1vBvi0mCIqc3vbWy6sx2TahKs2aJSgU3e1o/IYAGehzPh01RoARCy5nFhtejhqnsls7gKyrcfl1d7dFsLdk9C/iLk2hBzJoQ2Ge60z/NmxVu5wyUBYpFwtjthTFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB9173.namprd12.prod.outlook.com (2603:10b6:510:2ee::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.23; Sat, 5 Jul 2025 01:55:33 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Sat, 5 Jul 2025
 01:55:33 +0000
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
Date: Fri, 04 Jul 2025 21:55:31 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <007E2728-5BFC-40F9-8B8F-25504863D217@nvidia.com>
In-Reply-To: <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
 <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB9173:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d65aa96-be53-4e2f-272d-08ddbb67073d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hLnDij0u3YTYdVcl2RfSrXUKnyCLlDArCu4hHBUU+TBJjpCXV3RkiPmv2VaM?=
 =?us-ascii?Q?CSTjMsVdnidKZorzn+uf8OM3+nXyb2lCla6mur98CaEl54yvATY1FGXJxfbB?=
 =?us-ascii?Q?/g6w/Or6GkERb5AGvDyaiszf3EOrsGtNitKK8+lxFgp3R5Jw6Vd9sXzylOHa?=
 =?us-ascii?Q?xvR7jklfRgIiy7FdNTVaHInxdM6rgwQWsQuUfmgVDNgmXAK7M6d0Aobwaa4Q?=
 =?us-ascii?Q?fqPQSc1IIJyBx63Cb9IF4TwTouvvaI6Az6PR72SYB7Tz7tR5MIWy3fOEXecr?=
 =?us-ascii?Q?5s/+fQv/i/ef0dJLXqKgcEJhmJ8VS1zISGick++9Ydsaik47fqoaP/N5V1FX?=
 =?us-ascii?Q?nw862xHxPsOWoWCgmBxtHxf5j8iOYW5tVHvYlml4RE+XLRZok2x+xxsJ4xFG?=
 =?us-ascii?Q?Cvp3SAKTHm9NxBzWh/5mwdFwUyc3grSK3YG4kOANInTn07JU3a+1NBEV7pyP?=
 =?us-ascii?Q?zy1TJ+N+68kJjVgwmFhMLrvZZec0rXE/xFeyRAyADGMnF6Vpit96hs8txWUH?=
 =?us-ascii?Q?26whTrZSWOEUU10fXedst+MvvKq908C4ZLHKz2TzALW37tmeqtI36NiNgq2t?=
 =?us-ascii?Q?RcRkucXYjYpbNIRaoWozsOIQRiI2tTc8JIOBDJp2CQzLW6+f6zlDFdYSUpxh?=
 =?us-ascii?Q?bYWuqsuWta4IPGvtN266gjKUltzoyjYLW8q8LffTPDAJWlnfLaamBOR2YAaQ?=
 =?us-ascii?Q?EWnupN25guG9rBA3x0FJ7EIG0Oo1Gd0UZFUw7OJhAOpef5LxpLNtDtAZuFSz?=
 =?us-ascii?Q?5mFRYgqqoyIeDWNTWwJi2wE37kZQBS+9zMbsj8X13GJJ8dJWwAswEYvMIO0d?=
 =?us-ascii?Q?mUHZj4Lr79vlRUHFt3C6zNgWAf12lKPkGxfaJX1doi4swB+ZAYsMJrbuaYNf?=
 =?us-ascii?Q?b4TY67ul5T9NZHQ3Qtj75KBlA9cJxio0ATG2bOv9RA/HFBha3Cfmxpk2BEod?=
 =?us-ascii?Q?w4wLIfs7DD4XbVMFVTE0NcI8rxk/HHU0PottABHRVLKW/wtk8KNykSTBuDUQ?=
 =?us-ascii?Q?ACDwQjSJTcu/D6zBmkHExjCiTrpyeiXFAch/OuM9zJb4PF9V00HiYClr471r?=
 =?us-ascii?Q?9ze/XTm6D/wb04uz6KgeQiRl+LEcDQaDUkior+v6Rwv2SlwUpt7NgR0x4ktE?=
 =?us-ascii?Q?mWU+dPGacslFZn4Zz9HF6W0vKVdTLoAjxGvdK+C/EihCOJHOsZn7Ud8OrLBa?=
 =?us-ascii?Q?G4fKb/0224YwIpF0A5JJkT17V8bL5U28GlTyrjLymFAHz6YnEVf+/cv2Owhs?=
 =?us-ascii?Q?QR2F5iBYdCB8MScZ/v3zFTl2m7DVQUp0sywH2LChmDijfE+gEP2jgkSb1Rd5?=
 =?us-ascii?Q?3utmN7sfCYiWOjoFbNGdIM084QQG8WI2UTEHg7a0zVH2zcBgX3fTgcavAhpE?=
 =?us-ascii?Q?+fBuYQfQhL22fH7rDT1H2FDWG37kJUkt68yjq14SKsZhzFCvBqUALSsOYKem?=
 =?us-ascii?Q?tCET5jlCAis=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFwfZgNU/Hf3UAbdxm6cvfA1u+KqrRSukRtw8IwAXiw22qCVE2KyuCbyeTOV?=
 =?us-ascii?Q?xX9zqXYopwgN3aoqSSVx+D7ZUTNlMZ+QVlmNm4Zl/kZTPzTzckXkzUEbk5bS?=
 =?us-ascii?Q?qKzTTWxmCKtkN9coPU2/gNUB3MGe4DHx1ASbwmu+KfhggRPaKbkG8v2fQhlD?=
 =?us-ascii?Q?hPg1x+gWiLZr80eD0rfUe96591GcNv6h4iexHyIJ+5JWkmNuZoV7sXxvVHfM?=
 =?us-ascii?Q?dkNAznyY9x2wtQT4+IT+j18kyn8bsybNn0/hsEmwyNPXcCekoY/o149PnXrF?=
 =?us-ascii?Q?dxMSZ+hdAVma/PAJrL1T7Xil4eISHOne1PtTs9JSEhv69Z1TdsKSA7MTpppF?=
 =?us-ascii?Q?cQuR2HMFNwN2MQiT48091BNh6cRM67Xl0pcX/2sXtjCBdBL8uJN1cWoO6SEP?=
 =?us-ascii?Q?YTjiSuD0PvVWSdutwMU6zHqbZuzyOv2DsKljdlPsnFpj0EH40qv9L2w/tyP0?=
 =?us-ascii?Q?Wbq5Rz0bvE3xgAMBFwOBJ6DJDkheDd3VR/71W0tgxY9eUpeEwQq4BFfOvb8J?=
 =?us-ascii?Q?E/p0Gjexpfprw3XfCIeufpO0jjExCtOb1GNaL4SWAWn/pf40hlxxJuCtsHZR?=
 =?us-ascii?Q?pT7YMJSjKIs6OuAWPTH+s8PnuHK9hkYIWUSzG3HG9EaTIpBOHQ53pQHcmzCY?=
 =?us-ascii?Q?fGho7MiRzIVCfziAKb/nWbUfIRcdf9mDpIP/CjIjtebaGzBFivg7FekZXUOx?=
 =?us-ascii?Q?CVBKzeCmt09V+Bykgc2AAiTSDIlpKUKVSSHhGPrB+smgOfystC26jQuhadws?=
 =?us-ascii?Q?cLOlSufNtFNayQDm+qTDefBaP2JLwigUBqk2xBR0emTZgvlUpgYCf0WP04Cd?=
 =?us-ascii?Q?FTQP5vlT0xqNqZNSop08vOFsmEc7YT0qXYimOoOr0faFtp9g13/i9C9XF6Y+?=
 =?us-ascii?Q?bX/YeYtpm8z9vZ1kh4sc7xwObL4Pk0RiyMLOTiz12hN7z46kpL1X2fWA/pL0?=
 =?us-ascii?Q?uXs+z3BE3GAyMkMxO072pmRuZ55HGwuHO+GYJW6WmYjaIx3I/QGHeIRNGCUM?=
 =?us-ascii?Q?J5EkL+0LvlOBu51Ao/CZFJNuqh+c0HOYP2PiETzOLbV9e9sDRvxRU/xsyQmM?=
 =?us-ascii?Q?90i9vEq280mJh8QhLNEQaFJA1eyiQZQET3XNolSroWwDCj34nBmfqRTHKuky?=
 =?us-ascii?Q?fvMY34TdrKJ0lOXeXoZt4wkpaRIWazDvMR6tQq3v8Fxv/eZSFrdvunzKyna2?=
 =?us-ascii?Q?t1HRBhwunXY6YOIhLi+/DVwkGMLd42Y8SXZBUdEcjI6wqATWA1D47EQzhhyd?=
 =?us-ascii?Q?Ljg6n4mVV0faX2f+/j3DX+0nhLLDP/ea0SMf88OIr3PyR2xlEQWbMbOft5D0?=
 =?us-ascii?Q?WvJD+6Nn4SrKLcXuDHw+sQ6DBLLTioD8NodXbX8vNzCWufSL+Nq0ciyqIjvt?=
 =?us-ascii?Q?VyHRy82JbsCLlXMyli8dTIa7NDzqXE61QlkZy5HqXvAoTLAQEw5yTi2Vq1cp?=
 =?us-ascii?Q?LH9zvdduJgMJItrnzzK3Vj964H3Qubpg1NRivrIq4L7z84g1VRy+pLyl22r0?=
 =?us-ascii?Q?QCjCH0AiokuQ4gH8Ifda5B4vlm1kMdBlX8tlEcXR+XCZ5Q6g1530sgbYO5F1?=
 =?us-ascii?Q?4lYmwJteCVsEEJVyGaxDdpqqwB09/lbsklau7fzl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d65aa96-be53-4e2f-272d-08ddbb67073d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 01:55:33.5058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ijmlw0vwc+LVjsIuWAxfN22vm5feVRmhrVUOTM75vHQUpyORUTSiq1S3iQCsVWX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9173

On 4 Jul 2025, at 20:58, Balbir Singh wrote:

> On 7/4/25 21:24, Zi Yan wrote:
>>
>> s/pages/folio
>>
>
> Thanks, will make the changes
>
>> Why name it isolated if the folio is unmapped? Isolated folios often m=
ean
>> they are removed from LRU lists. isolated here causes confusion.
>>
>
> Ack, will change the name
>
>
>>>   *
>>>   * It calls __split_unmapped_folio() to perform uniform and non-unif=
orm split.
>>>   * It is in charge of checking whether the split is supported or not=
 and
>>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *foli=
o, unsigned int new_order,
>>>   */
>>>  static int __folio_split(struct folio *folio, unsigned int new_order=
,
>>>  		struct page *split_at, struct page *lock_at,
>>> -		struct list_head *list, bool uniform_split)
>>> +		struct list_head *list, bool uniform_split, bool isolated)
>>>  {
>>>  	struct deferred_split *ds_queue =3D get_deferred_split_queue(folio)=
;
>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio,=
 unsigned int new_order,
>>>  		 * is taken to serialise against parallel split or collapse
>>>  		 * operations.
>>>  		 */
>>> -		anon_vma =3D folio_get_anon_vma(folio);
>>> -		if (!anon_vma) {
>>> -			ret =3D -EBUSY;
>>> -			goto out;
>>> +		if (!isolated) {
>>> +			anon_vma =3D folio_get_anon_vma(folio);
>>> +			if (!anon_vma) {
>>> +				ret =3D -EBUSY;
>>> +				goto out;
>>> +			}
>>> +			anon_vma_lock_write(anon_vma);
>>>  		}
>>>  		end =3D -1;
>>>  		mapping =3D NULL;
>>> -		anon_vma_lock_write(anon_vma);
>>>  	} else {
>>>  		unsigned int min_order;
>>>  		gfp_t gfp;
>>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>>  		goto out_unlock;
>>>  	}
>>>
>>> -	unmap_folio(folio);
>>> +	if (!isolated)
>>> +		unmap_folio(folio);
>>>
>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>  	local_irq_disable();
>>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio,=
 unsigned int new_order,
>>>
>>>  		ret =3D __split_unmapped_folio(folio, new_order,
>>>  				split_at, lock_at, list, end, &xas, mapping,
>>> -				uniform_split);
>>> +				uniform_split, isolated);
>>>  	} else {
>>>  		spin_unlock(&ds_queue->split_queue_lock);
>>>  fail:
>>>  		if (mapping)
>>>  			xas_unlock(&xas);
>>>  		local_irq_enable();
>>> -		remap_page(folio, folio_nr_pages(folio), 0);
>>> +		if (!isolated)
>>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>>  		ret =3D -EAGAIN;
>>>  	}
>>
>> These "isolated" special handlings does not look good, I wonder if the=
re
>> is a way of letting split code handle device private folios more grace=
fully.
>> It also causes confusions, since why does "isolated/unmapped" folios
>> not need to unmap_page(), remap_page(), or unlock?
>>
>>
>
> There are two reasons for going down the current code path

After thinking more, I think adding isolated/unmapped is not the right
way, since unmapped folio is a very generic concept. If you add it,
one can easily misuse the folio split code by first unmapping a folio
and trying to split it with unmapped =3D true. I do not think that is
supported and your patch does not prevent that from happening in the futu=
re.

You should teach different parts of folio split code path to handle
device private folios properly. Details are below.

>
> 1. if the isolated check is not present, folio_get_anon_vma will fail a=
nd cause
>    the split routine to return with -EBUSY

You do something below instead.

if (!anon_vma && !folio_is_device_private(folio)) {
	ret =3D -EBUSY;
	goto out;
} else if (anon_vma) {
	anon_vma_lock_write(anon_vma);
}

People can know device private folio split needs a special handling.

BTW, why a device private folio can also be anonymous? Does it mean
if a page cache folio is migrated to device private, kernel also
sees it as both device private and file-backed?


> 2. Going through unmap_page(), remap_page() causes a full page table wa=
lk, which
>    the migrate_device API has already just done as a part of the migrat=
ion. The
>    entries under consideration are already migration entries in this ca=
se.
>    This is wasteful and in some case unexpected.

unmap_folio() already adds TTU_SPLIT_HUGE_PMD to try to split
PMD mapping, which you did in migrate_vma_split_pages(). You probably
can teach either try_to_migrate() or try_to_unmap() to just split
device private PMD mapping. Or if that is not preferred,
you can simply call split_huge_pmd_address() when unmap_folio()
sees a device private folio.

For remap_page(), you can simply return for device private folios
like it is currently doing for non anonymous folios.


For lru_add_split_folio(), you can skip it if a device private
folio is seen.

Last, for unlock part, why do you need to keep all after-split folios
locked? It should be possible to just keep the to-be-migrated folio
locked and unlock the rest for a later retry. But I could miss something
since I am not familiar with device private migration code.

--
Best Regards,
Yan, Zi
