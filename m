Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883BC23ED53
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744222; cv=fail; b=FHRehow05jYZ4NNYi0YzCe9pEm4aPRy+CFMC9EDdTGREiGJGfCSXS1TNGK5kyKNTTxwb3ojrABcQ2qfTpsCNZImK36EYeh0BwUTxNYEnNToK8Vii+3EKoEuoqi+NaiBm6II2PSPf+DMlUE0mmhG9/XOaJyKvrs0c2ePD2/MDszE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744222; c=relaxed/simple;
	bh=79nQ7SIUCXxaJT0Tqhiifs5+zH5guAoq6AwETD7jtxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n9PRflU7M5v4+xQWrhCV9XO6JAgHDbSnjU2TR/Uy2IbYh5V1qS3MojhFvgcSl5maLpQeZ8MqaRWpwEnQGbxeADcHRHVgY0VhGGLkic7wQr0hVVEYnqA3KvLcEiaVVjr/+GJjgh06UyDGvT8Z9Zw99B2QPPbBeizSyeAL9Y66o30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CTBuJ34O; arc=fail smtp.client-ip=40.107.223.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CTBuJ34O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOv6hOioMzz3yoSXXj3SUgBO29gZlXjtmnxEMueTv+pT0PEJC1W24nzVSg9TmsvTn88qc0p9ayx747e4v/lE6j7K/e1rs7qeS8dP9ybjTtk2+fA6fICcMllh8oVIf+xn6fOYyvPwhRlrfKzgdk0t3Y8Fho1mmSU4yCnHyp4eTJxUhko9O0PMEFAfnERmoXjCsm5aHPqzu3W71GvSPnquLbeVu9DROHYpDf+kxd7HC+T8SYl0MDQJbaYZHIWQmkB28F+mcuS6quhwMzmv1jVyR6Y/gkVQZfFXkMcBUGlp//opAsZtq//VLCl47Z7scsNZpMTtz0p4Gs6jW9UGf1hW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79nQ7SIUCXxaJT0Tqhiifs5+zH5guAoq6AwETD7jtxY=;
 b=xIsl2A/thYCXkJ9HxlDYCpfBDQKrLpJw8SMAyXl1w9rbbUlKA7mz7aIFMTP8BRhl7m5kklE/8K/XRKp8yooXyjHYR1KV6r82vJ4a9hIVEqMBexqQIydqGZpt8dIHonK8t9Ib/YG5CelVIRyOe9V8Xs347A1Gx1mV4h4ebwW7HAXxRI8mpAFZNqVAakJH1KynRUxG3dQWl3pHkcoXKCQoMbyGiApJjiBtNErO/K/AwOKXrhSjyDeVi9ZaJtCDJLswE9snkzgstQAjA7kQgBieTIjAIXh8oGyvndlc7PT/QrkesaGOskHTilkB3+rv60nQI2nmPhY+qiFbW/IuC0eKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79nQ7SIUCXxaJT0Tqhiifs5+zH5guAoq6AwETD7jtxY=;
 b=CTBuJ34O2lhzr5ciMAPpnN+We5hFsK8VXs2x9fOSXqCPC9SgBNQTe3p7QzcuXMkLfDTRQ0OOMGGN/GVrlKAe6duwE1g8bcMu/0JV/VnD8fO2Xlbz5ZdNj3QQOv2xj0nTaDLxMhSEn9YcW8AfclBxtQ/ck+NSqvTiRGrVkFK3g8W8r+49nsuUAVjkdYW4fNRWgz+hh88yjzXt6A8xR4nUg8N/lH1sKu+VSpwAHIeijYFPDlPYMqedQb6IX/ADuFFxLJ/5KUgDuD/0VFTpdw1HIJpgumOl7cXv46l1s6ofGOQ4IMnP3Xr6WUoE3A9snV7TlhstVWYgiTyVZNPGk0OGhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 19:10:16 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 19:10:15 +0000
From: Zi Yan <ziy@nvidia.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
 luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
 rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
 jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
Date: Tue, 15 Apr 2025 15:10:10 -0400
X-Mailer: MailMate (2.0r6241)
Message-ID: <AC2C5344-E655-45BB-B90B-D63C4AC8F2F6@nvidia.com>
In-Reply-To: <20250414034607.762653-1-ankur.a.arora@oracle.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:a03:60::42) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: c02b4a70-cbb1-4518-b47a-08dd7c5127b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7MHnYrOOMnAI6bV7ZepiwqVLqeedBnLs6qDfkzCogTUyTpXIwJvk9VU26pNJ?=
 =?us-ascii?Q?YlHEklda/VLDc2donh+EisPRnHzVW1pmO+YLUG1XZzQq1Wg8RyS+1rRuPHnY?=
 =?us-ascii?Q?GglVOo6d7NGF585jrgGkCNdyh2ITyErETU0WOLeSu85385LUbnkZVuqykUi1?=
 =?us-ascii?Q?/hgavnpPw0UIlfeWniAntx3gqaOr/WVZ0gpZ1tWzlUMmbQj5SbDjmCkX+olO?=
 =?us-ascii?Q?GfGyzIg601GZMzvPeAJ6LeK9ziNap+UaJTvILwZXAQGE7xBd8yjuH60STXfW?=
 =?us-ascii?Q?i6Hnc8xNQFaX8AtsCTdFE8BHAsksCMhL6Rd7aewLwvbdILaP+XLKPzmAgGgS?=
 =?us-ascii?Q?wrMBtJb2CfLii3/zR4L0yaYPT/ppkBZ5ieyz/Pd6yZU+2ZROl76u4at4mV1l?=
 =?us-ascii?Q?i8oCBCcXK4TJOm/okc8yK6DygdplaEURIFBbJw6aXvcNLK7LpI5egH+09p5a?=
 =?us-ascii?Q?og3jeeSZ76rSdE1AchNS5XE+zHpeYEpx9gppuvDhYzPK8ywsupxP2vWIIPBI?=
 =?us-ascii?Q?/nRG2NbbbWt3EGmnEFfiHdyLOhaBQdGvD0+K0BNoHoExrgN1Lah2S0YJRQ6m?=
 =?us-ascii?Q?9vOyDIcUy39k9P/56vs4R9nOZFe0eTqFFQ1y8BqGZfSaxP4BrP1xPPUpJh7U?=
 =?us-ascii?Q?Fdlp4UHD8PsI0jz2rN2piKjdehYo9+G8PTtTS7c+PgH71nf4f4cQC9esxvVq?=
 =?us-ascii?Q?27jNjGk5CUofETtq5bQFY8wUJDSxK87chYU9pNIBol3LJqXUGOI6emFVCBJD?=
 =?us-ascii?Q?JpM4228RxdW4XrrjaJ9W8arvsUvu+XkHkdBirv4W7B1smL53JTRGDtIbHTnZ?=
 =?us-ascii?Q?XK+bO3nhh65wM01YEBMAfeuklj9ZnWSPxjKu51vW2xbRTFGe+IA0XOuYbZBg?=
 =?us-ascii?Q?4sCsnYTrv0DIU6Iq6wOnT2241Ge+N0Wry6cNPAjoHRsvsbsUJSZiCiF6xIu/?=
 =?us-ascii?Q?SNDxAepWe4EJ5O4XnO/agZoCzPrtMF1dFwR1eAYVZ4nsBejYlUZ5QahOxQbr?=
 =?us-ascii?Q?d9/D24HuUvx9vSq2qI5iUgOs2C3LvCg1Ac7Vj2nzJnqJVuAkPPOUBVWwwNYr?=
 =?us-ascii?Q?Cs3hgXStBK58nK6fzOx4B+9EC+q8N1/N/eaXUpOuRm7lakzPYw/TN1gCcpUK?=
 =?us-ascii?Q?yJfGCpmnzI+1TrlG/dHo0RFr3n+nwQBKbVsn6Tqk2xOJ8zCXrlKkn5so2nI5?=
 =?us-ascii?Q?mmoGEvdkF1tyt85PnYr9yOIcoRNE2p8JqfZdbFv9IrbiK/NIWGCOM0Sqb8Ne?=
 =?us-ascii?Q?2u77rNDYIG1m6Hw7QpvvedN/mZZVfLMbcnLo03dMlRrStqY6tXjXIAe7VHR6?=
 =?us-ascii?Q?nnSenMe/C1Wxmd8/bKGmuSwa2bja+8uJBKK5C19481W85OCkFN+m8iw6TD+K?=
 =?us-ascii?Q?h8Kt7GiW9s6ogbTH97h0cxqxD8ZdDYiinY3cEdXdzGomYmF9xSu59rXdZ6b5?=
 =?us-ascii?Q?FJ8YCDJiEbs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?roGpfuUmKlsaYdaLUq3Lq8d3Kj2Sq+Ng9ESe7Yg7Htb0ZdVoneXcTdL72XAr?=
 =?us-ascii?Q?GFg8VDuwZJFTCN4tTVaDzyclvUk7E22V6nVAMorYmKWSVI3OEZ6KetLurivQ?=
 =?us-ascii?Q?N9dB1SuR/X7dpuE5RP4y0wqVCoV1TRnHwsDUhny4mmMIpSoPeqTio2oZfEiB?=
 =?us-ascii?Q?kHremYovxUQ871lJi/+bTM5g1JCej23y5eWb3mDGSstmwNXYfWe10Hi8XJ+V?=
 =?us-ascii?Q?3H9ynZl3UUqEQ9eZPBrXOVbsDz+hdV2+VPCU8v+U+L/xnUhXfgj/708kffPC?=
 =?us-ascii?Q?KiR1B08TUfnK6iOsAlq7PUBTadmW+250GdbFcz2vB6S9kCtvkAu48rMG6Ooe?=
 =?us-ascii?Q?GJ/oSXSKGgkHODRTeZb9M2Ryp/Gd8tn0oHF6hQAtkocyCWd53nihTBzg6smJ?=
 =?us-ascii?Q?6uM1ZZl+hvZlZdO/aXnkAL55t/LQ8IRTuDDTRKYum2ZnMshz/bYxB+jCaa14?=
 =?us-ascii?Q?miT4tZ0sS++uzyYTyLoTt2PBUAhzciSupmK11zAVSyRaVD79tqlgujPxXeJn?=
 =?us-ascii?Q?y+or8BgbfIK+QaVh9T8R/efighHj2tXszFmKwF8WiXpwmnQR23BPhWSn9qj1?=
 =?us-ascii?Q?mr7NN7epejU2oJCCMuY3cbySyO5xUtc62I4RfssyjDQoOs9s3gii5fQ7BR80?=
 =?us-ascii?Q?QEj/s5diR+OAUM810GXrrZQZHnSTOQJ6eWpfXiAZ1wPqA3RK+0RzZAA3E18K?=
 =?us-ascii?Q?q+jBoKyavUsSvDuTdFgequNOUnba12lGzjA2DmuGSLnuRQS43JfTMgEdLEUE?=
 =?us-ascii?Q?Qc55Hlz5x1nMypZhYrw0G8ZVx0EarJJOvruIlhynvS52ptUGWOHbOQtncHKA?=
 =?us-ascii?Q?NGH+dDmHHI1rH+pUj+uSTuxBu98UJlW6M3d4286qWYTt+pc5vYd4lWGH49Mx?=
 =?us-ascii?Q?DnBpZiQpocvzq8NEtaQ02auL6a4trRjl5+/HdBEQOwMgu1SfJ7memNapqyBH?=
 =?us-ascii?Q?9lJI2KgdjCrjb21eNtiCRpT+llTqLhtN2TXAisj9hT4N7SQWTKuppIYjKgIa?=
 =?us-ascii?Q?n/dHuoXTyWaKojbfMfON0IakY8NMI/uPHKb+fzVwuh75dprbwi47bv+JFtCl?=
 =?us-ascii?Q?sh70mFw1JIIZXHclT9m+t2TZLVricvcMLto4Tx/diFSth76R4KcaXp9fVSUc?=
 =?us-ascii?Q?ibsZNQ+u9HO5T93baeBUVbwJw6NtO7vZcA8e+lxK7oUSg2xPS9bMXBZ7fb7q?=
 =?us-ascii?Q?0GuoVfnQsw7FAQsI5OTbwb7zRzm6hFw55SitjPkzrxX2hX/i+jjkTR5MeTw/?=
 =?us-ascii?Q?wlNv8u95pdbroMbGLm+BJNnE6lpzz4nuRKET7KThCu6WuG8kzmUvua2SrUGq?=
 =?us-ascii?Q?JXmUiu7M2VrsccFQPN0qG72TYJO9JuayLspLp60KahXt2bw+ShuZqAC4+cua?=
 =?us-ascii?Q?tAzagMln6/9hCqDHj7P+ynu7gwx5vNMU05QT4C98H9aJOTX2dMtG8ywmIMbZ?=
 =?us-ascii?Q?r4P4CxmxCnkUCSyPGBOhjfvCxlCWLEoGYEceNMt+kN9AycNzmOgqUwin4FZ6?=
 =?us-ascii?Q?f0fsKj3ksOllt64GO6DbifbZIwfQdz5VxwciGe9UZhebq5L6GycdzSVfAbf/?=
 =?us-ascii?Q?w6bwRnIdH83jc9RRxpc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02b4a70-cbb1-4518-b47a-08dd7c5127b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 19:10:15.8593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMdNqFu++qVluo+HtCZRe73vGbk3qdbUa8escGu/ockA85xkQlAWhTTZ+WXLjJQ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143

On 13 Apr 2025, at 23:46, Ankur Arora wrote:

> This series adds multi-page clearing for hugepages. It is a rework
> of [1] which took a detour through PREEMPT_LAZY [2].
>
> Why multi-page clearing?: multi-page clearing improves upon the
> current page-at-a-time approach by providing the processor with a
> hint as to the real region size. A processor could use this hint to,
> for instance, elide cacheline allocation when clearing a large
> region.
>
> This optimization in particular is done by REP; STOS on AMD Zen
> where regions larger than L3-size use non-temporal stores.
>
> This results in significantly better performance.

Do you have init_on_alloc=1 in your kernel?
With that, pages coming from buddy allocator are zeroed
in post_alloc_hook() by kernel_init_pages(), which is a for loop
of clear_highpage_kasan_tagged(), a wrap of clear_page().
And folio_zero_user() is not used.

At least Debian, Fedora, and Ubuntu by default have
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y, which means init_on_alloc=1.

Maybe kernel_init_pages() should get your optimization as well,
unless you only target hugetlb pages.

Best Regards,
Yan, Zi
