Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE48F14A82
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751868598; cv=fail; b=DIY8/vlIHgA4ZDFLEn5j1omqoQCBSlaqRhyBm9wIGG+LZWSQHn6jG8y4aa7v9Gz4NrzyI4N9hufn7scvuhmL7DAFo0EvdmnJhUqQZ0ONPiodhJ5iiKZv/G9OIRa5yMAEc5U8xT6TIVwQR6Yeap/xQvO3RW3e5EVmIpwRW7HYoCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751868598; c=relaxed/simple;
	bh=qr/SM6k4tV2xKgrJQbKExwRwWIu62MdXKttQponkmvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HsKXf3vF7QZ17DH4aJHMWsiZZLYvudDmcbI8SV8S9oicCwS6w/GmziUn2xIJTdfrqisolAzox5LPFJZRIdvOeVPvhP9ctZF1zAashYf4a/n+MdlNVGhrwCBxzUj6ejDnxzyydV5tVZnTukpi3ObBduXKE3N2pWk5Gm/cOPUuwwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RF3/Vrhj reason="signature verification failed"; arc=fail smtp.client-ip=40.107.237.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RF3/Vrhj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1x/qge0rJEZVEiC8i5nOwZlI3unt9ol4Iw9b6IDdZu+UnzuLn80qKKFJdQltYfLigKaLgLK+IEL5d4X+hMQXWrbCk+FsLSnSRbKH3Yduy8UT80PIceZHXZATbDIlOd0FEmYIyZw6XI2ows/tDGA6zLFtAuCnJ5irnR1bI5oe7giSXYnBpsg6CUqBZht4PSiXNyawwgQ49VJTZKPjSss/vdRpfVHxtkk7lDQguvafvEs7bGUam9vuubE54LkPdGR2kqAXrJzVihP/+2Vz8+FlxUEyc2x8NoLZ5idc84uZaursz3/r6vnW6NQt6QVntVBDnL8ctx5SuUj5A7kD5cWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZdw5Uj8fw9OZ6Sa4hNWiTZi//yhg2qTSI7SyO9xLpA=;
 b=KBpYIFh1SLxoQKv5yHw8a7MM/ukLU4LMCmytOQPr1hEfvYi5Of8XdPtKSDoIQobPA4AffhichNDaaGUd6Pwzw7qN4stskljvaO3/Uto7TbSum6MlparlLZvm/bzMP6YZOxZWiy7Ioup/qdyItwUqno+/23KeGpTRTow2CYjTJ4NqvPmXAWh5lC9/YUkJZuf6Bhh2cve1AnGxiru5sU/9p4YpTipfH5tK0MPs+elTgSAKGzBNFz6HRdRMQKpzZ/hPPmt0sSTDWOCDIE4KR7NAvpOu7MUk4WdWrl2cX2YPNo60n+r1W/Spm4LTd8HtXOjb16Fo7VShRQuMBfFBx74bDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZdw5Uj8fw9OZ6Sa4hNWiTZi//yhg2qTSI7SyO9xLpA=;
 b=RF3/Vrhj55xOhysHjPvBYeIj4emoDGS4kff2kj5uvGL1YTbdoyDjdBMhBB2crH0qKB+ANGBP0/bq/2fn6KXVAy0JslsFeZu8CRm6yPfngV9yW9L+VCpL1HIQOaXIFF5kLSNBxhwSnuq6ZY5xViq2EODMGa1kLE+OV51nwv6d055cllywG/N+pAaaraVy0JwvPv4CdGYVKAnWSpZ2zpQwgWGnTPqorR5XsGYmh2n9y5qsAABb6wc947jiqbmVtrWEQe04hw00V/N817RsleYolLa89UeI0yHvcGxhiugNP8/iMwp1OK+caX4SENYz++cNSrBGzL6Uzwevex43WgroKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Mon, 7 Jul 2025 06:09:54 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 06:09:54 +0000
Date: Mon, 7 Jul 2025 16:09:48 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>, 
	linux-mm@kvack.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>, 
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 resend 03/12] mm/thp: zone_device awareness in THP handling
 code
Message-ID: <xbsn2gqp54bmb5qtxp5hr3fmtnm4elxw4wmnezwq6qs4ewdvsz@e46t5tcnpms2>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-4-balbirs@nvidia.com>
 <4c274ac4-17d7-4d37-aeff-9517731d0c9c@redhat.com>
 <5ba8cf21-60ca-465e-a524-5dd43b9bbc97@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ba8cf21-60ca-465e-a524-5dd43b9bbc97@nvidia.com>
X-ClientProxiedBy: SY5PR01CA0116.ausprd01.prod.outlook.com
 (2603:10c6:10:246::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: 2628e87c-6e02-4179-280d-08ddbd1ce40c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?U0/ezNUXDqgJcilW6fbc4DBKdkXynAc2gc/TnMcXD0/2eHshA6nWBVDAbj?=
 =?iso-8859-1?Q?ByIfOFX9zqXVj27QqPTbCsPqQh2oD0ewX5+YWDmNoyZv+SiwFHxiJ+XZ0L?=
 =?iso-8859-1?Q?KN0QymPSyHN2UAcmHI0ixCxa+WwqP2Y98/mKYeTC6FqY+ZCYrfk9CjzAvJ?=
 =?iso-8859-1?Q?8cEWCLZpoD+Hqg/9GfGxwh00SEMhYMGeoHP1/v1ok7SUqRk5Vymc7UY2fs?=
 =?iso-8859-1?Q?gnACEXZclFCKu63dzULIqOm/yyGr0CJdNFfgtqnxk2s8Me6YQB0Xg9LQ9m?=
 =?iso-8859-1?Q?8p/56WFJbS7nhHIkqqd0tksnXswKqHW4awMxIc6iXfR0LDZBpUaEB9QW5v?=
 =?iso-8859-1?Q?Qim2xrDKkSIDHxCuxHne8HFH6qyCdYxxhuouRC1KZyrvF4lEkHjZmIXVmW?=
 =?iso-8859-1?Q?NqkR/sAkdJH6DvVocpl0yqPfGu3IV/XeTaxo98CbPsMyeHQ623LSQ/qsCc?=
 =?iso-8859-1?Q?UDg3ewLO9GZrPCD48fgGf0Lqp2jIBw5yo8YC45k+bjQ0RZhjAEk2BW4+B5?=
 =?iso-8859-1?Q?shUAuaKN1Gxr9Uf04GJal31MQIsOo6gG5qEvEWECW0IGj8Hn3TjAG1Yne0?=
 =?iso-8859-1?Q?QDdcWMczgYFU6lPG1BBUScV0ZC4uvw1kWdamVr+k+5ryYv7drUwP71mEoh?=
 =?iso-8859-1?Q?HSFDVv0aIzZvITlWPlMdms4YeCA3UqVWduKPSNRjfrCzp9ykTt50No/geB?=
 =?iso-8859-1?Q?K6nQf05Zu5Y14k3DT1sZPh8cpXHdr1ojmclfjzcSrf410qXmCKd18WVQFQ?=
 =?iso-8859-1?Q?AxZUbLc43fI/5Kfrh1mUPGEaLno1NQ1VsxF5PJjKnUzFKxrEBcTfaST5cn?=
 =?iso-8859-1?Q?Q7QROcM8rw2G2L5CUA/E/u4T5oV466K6v+9cxfkTZ+ohL6fNaHKeJr7kJ8?=
 =?iso-8859-1?Q?AmVxj6h4xNreTIhlA9ESIDExWYsvgMU1usrn1O8IHpabKfHNxfNCJL/zEb?=
 =?iso-8859-1?Q?aySfF/vc1+Gz7KvLDmErWLV1EekgSaeqHxbbCmGBY6oFiwGbgYrdOLzBvI?=
 =?iso-8859-1?Q?8f+6BFwcjcxZsF7neMGTMeg8ayqC6bJ1+qXlqkrMRrj+7Q9rHS9jZ5yu8Y?=
 =?iso-8859-1?Q?6Q7g+ZR06yNPKgk8HK9v/Foh2Lk/a5hJjIt2Z2z7sYPuSHXZrXMgg68FVs?=
 =?iso-8859-1?Q?Z8yZcN+E22StgW8gBhoLVUHkmKxwzXhymIhpPoNBMu119Ot81k5f0T+5oB?=
 =?iso-8859-1?Q?75b8XjZtW/aaaK84hxA4BDycBxkP4tSj0QNdARi8s/Uhai6qxEEAEdqxb7?=
 =?iso-8859-1?Q?Pf2jgyB/+WPi9lvn2/fsPh4bfRtvUPOuYxaAT+h+5b1JSTl0r0vPE2zxM0?=
 =?iso-8859-1?Q?cTaiDgKxAMMP2OZ/dMUGszwc8L3/E3gjUu82RGNQX59PzDX7Xrm/6NNwvv?=
 =?iso-8859-1?Q?zo2zEXBzknyAMenFnBCK9GVjU/36QU6630OGBLyohiR7NwzLuvsYw3Br49?=
 =?iso-8859-1?Q?/4d6nwAFWdfavQgxTETUB3nIGvVLHmAaGjDuRBDCOvco9Ayilz8psUe1hb?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Rx7J6NfBJwXJACeU1ZkwuIn/UDTesZu+Cz8w0gQ11hgGwtTzo8+z4+FGxL?=
 =?iso-8859-1?Q?Tm6/W30hD95Mg6Sm5HY1Z5yk4fAp7VMSndxZSIAFwW9QSu8KS6lJypTI+4?=
 =?iso-8859-1?Q?gf9K1uXJDG46OjDiWur7PI8AGrc6ZkDMDeOoP+rZGenftDQuGyTlsm+uXI?=
 =?iso-8859-1?Q?HquhYwan96M7kcJp+t/Ji16VL32B7pEBc5OeQ93e/Nl14DgumBHnlYVt93?=
 =?iso-8859-1?Q?oEIeHWKQQW0SyXGxSLvvF64zjzWujeefk2gMVgSJ9iOTym1LDJZEmN/qqT?=
 =?iso-8859-1?Q?zZRnxbeBbrvcmpgImX9HrIlhr+f3KQ9hVXhQOiG5aceiLnBfb/UUkAryIh?=
 =?iso-8859-1?Q?CrqG+fDL312PVbiWPVSqxW4ZHzO1YRDdkxyWXzVFFDnyfKv5HwZMGcorH1?=
 =?iso-8859-1?Q?FdnwZEM+m3eZ+lQiScMjSYtJ1vmKxoRfS8ULZdSYpxL0y5N2NHgXSUhiqJ?=
 =?iso-8859-1?Q?88liKBL01Sb0zO0nKM/C3K1PRPlxMNDgz9u/qiV0PyC5sQ6Q4UCN2HLauD?=
 =?iso-8859-1?Q?mZaGmcp9ElNlYJjQ6gxTQcCGQouv7hcIaKUR8fycCJpxfydWHPSzQLncGl?=
 =?iso-8859-1?Q?9XZblonEjfyA2uRb/PDJzY7FPViMoxQAvXkb2Go2LTis0UPTJc1eDTn462?=
 =?iso-8859-1?Q?QNvxtzON8U8+oUf/sJi2aP9WmK9McRdxWP6gr7f+8yo3vxVPAcTx51BJvB?=
 =?iso-8859-1?Q?fQWuHB2RcIXwQ07xGcMPQyDstl82GJ85ONPpgxohafHaLMqytEPV5C9Z5M?=
 =?iso-8859-1?Q?BW0hqKMz6kF1rxqxZt075XyIl+2HZNe02o1mgqfFQwR/70DCGk+Wwpbzco?=
 =?iso-8859-1?Q?c2LkfPZ8eiS5PxEswdA1f+8HenePRVoVNFbq9T2XS5bJ0lHZjO7wII+ZOV?=
 =?iso-8859-1?Q?WyMgOY8Bm4r6qzStO6PItlmTUikYyiuDBr0Ix/7RnlTEbM8ZiePdIKppxl?=
 =?iso-8859-1?Q?zlXFlsF5xd+5yQBulmGsSLrWGhbGfq+gX4SckgiMdhXTKufUDOSMTH/KA3?=
 =?iso-8859-1?Q?3eCrH+RwsMK9mgBoSjR8/Xlt78MFpM+Ic4er6uqxFr+E/V4vZb2e2mpqo6?=
 =?iso-8859-1?Q?Y8NbiIZ/6dsh3lxMx3cjPD1KEO+9KhtTef3NXPPo72+uxlTGwp9f7yhbTe?=
 =?iso-8859-1?Q?ITTjG/366L8jGHqGO/ZX+63s4573b0i1BHa3XU+hGxcFmVqMCznCsjZlgD?=
 =?iso-8859-1?Q?OROq+eEPBR4WHInfk5xZi/Ofd64bWlTC3ISnJriiDrw9KNCiuJSSxt/Y+u?=
 =?iso-8859-1?Q?2oZvvoKKs0yK4hfLYaSvpxR0PZck9IEpFN/bo1tyA7726YA+xINuopv3au?=
 =?iso-8859-1?Q?Tq0TNhdsFbex4VXwRdpNjLElBTYr1NCPfioEHMuFzBJMNzuBNYq8MINhpN?=
 =?iso-8859-1?Q?jagPXsqF3A8uxGxpFlxmuX+aBDDMGPZTHw+piRj5uLK2SEtspX2nga/SoL?=
 =?iso-8859-1?Q?Xo8wZHmPgiecVgq60YSjGbt1oZCtqXV1fYNKjKb3X2eDIJm/n3F+o0YDGF?=
 =?iso-8859-1?Q?udq4Ex95bdU7vezfUuenKLaTiKGI5rU9gkyp5w1KugHDY+nw5ctvS5GA4X?=
 =?iso-8859-1?Q?UqJ1ud+kQWZgDQh6X0Sb55T0Uh+JIwO/q7j0TK+dTqB6YIvKrXReknmlBf?=
 =?iso-8859-1?Q?97b3WR8SM1oa+pxCos+v+R8b8qWcUccIXm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2628e87c-6e02-4179-280d-08ddbd1ce40c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 06:09:54.0502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NdQy3Zty+0pGXSnMDN+IejQkU5LPGMqJpLR4d6AheUUhpk28iN8jXWKUiz0oxecWu0wgs0Tjo9m3pUT/AOxXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184

On Sat, Jul 05, 2025 at 10:14:18AM +1000, Balbir Singh wrote:
> On 7/4/25 21:10, Mika Penttilä wrote:
> >>  /* Racy check whether the huge page can be split */
> >> @@ -3543,6 +3594,10 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
> >>  					((mapping || swap_cache) ?
> >>  						folio_nr_pages(release) : 0));
> >>  
> >> +			if (folio_is_device_private(release))
> >> +				percpu_ref_get_many(&release->pgmap->ref,
> >> +							(1 << new_order) - 1);
> > 
> > pgmap refcount should not be modified here, count should remain the same after the split also

Agreed.

> > 
> > 
> 
> Good point, let me revisit the accounting

Yes, hopefully we can just delete it.

> For this patch series, the tests did not catch it since new ref's evaluate to 0

You may not notice bad accounting here unless you unload the kernel module,
which can hang during memunmap() pages waiting for the refcount to go to zero.

> Thanks,
> Balbir Singh
