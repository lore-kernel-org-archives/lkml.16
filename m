Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90D928B4F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524235; cv=fail; b=qohEN1x8sVycMpR5n9WtD3MK/FIHG5pQZf3KlxJ2Y49QBa5bcmhpEQNDC1ICGvTrraJPjQvCPVwpScRKfjKveTlL1d2pPwUCUeRtpvJg1DSY9jGceimnTxWlP6Fd6V3XCbdo3WOowRWZlkSp5mTXoKclfpZEoZrgzSyczlpVoNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524235; c=relaxed/simple;
	bh=zwZXcFYSNpkviU4MPjSeqcG3Y2ZxVxasxe0PSjedKyc=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=h2sYbMdCc/eHbBY45UD1+zuImQMpoebJ8Huu5DXSwMc1oN2ZsEsmLvI0E/r0QLMQEIp+vwuqrmCadInGd65z0Eyf2pOSGohmMIh7QKfjWqyVOgD4a37tQCut42zlh096qZHJKjWTheZ+1SzFWzBQ2NqtSEoA6CicLx3w3OdvtbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P1TcZKm9; arc=fail smtp.client-ip=40.107.102.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P1TcZKm9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muNAngcHdcmvQACBEZfUexrTQ7l14QRUh1FLplu4yEvA4ao4OTPtCdb6lVLHf6uFKRXe01qucgXJJC6bqsydqNcKMRGbGMzqX1eBxMFspqlQl7YERUHWR/jkYbc0kWVtR9EyXTfpDQqQBHwlgq0ugMijPl30TOWTimDzrPIcEUwQXAj7F5Jf8mdyqttijmDt0YKzp8r+Bc7nAcTSUibV9m6lAvU/CGpQrjdcEfZLMbyG6EF2f3VH056VL3ZXOv2sDSoU8j2czEx17DCN+n2Wyfp+0Ug/YMYOiWxKAT3a+c2x2SbOTKZLdLRjazoj3QzHDqH8iKlwIcgrjZaYInYwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbCNIg9v1PtENNL62l3QJP/kGsFY3zhggRP0VStoi6M=;
 b=EefFWZapqviMyykSXoRnznveYv8RvR/6xLYbXjT7TIJjWUtdncrle/PDeK3nucEJdrPOs+psZnhPDoTxoCeOlG2E1JL+p4E3E3HFR7NTRw0b7EF2S+DFx9J1U/ZA5AvtJEmp+RpNdr2zywjNsAJPAtORVANPaoUlOUNRhY6ZdDx1wvx9GWQlV2OxcMtdbz4ZdceymxEtiP0xJXzvWzwNMXpYQCqKm+vRcG9LTIbPDE2/1gOCp0xMKFKCLl6Gep0kUYf+xlqVDoehJsYR9Wg7Wfv8Ra5JkHdLdHJl+jS4WvCziMrRIfBNwqJdXUZpQRFtbU/2EHV+nnkIdlyKC9YmZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbCNIg9v1PtENNL62l3QJP/kGsFY3zhggRP0VStoi6M=;
 b=P1TcZKm9Q6nnEBGPDCMYAYxRFWDp9877Knp57EWMChXzPxD3BZIxgXlDmkjkc+bU8J3nMs9moCLQJe2LTBmThOnfkw7A1Y6aLUjAQlFSrLI0optTcY1GXdgmRWLmFkrScggdzCVxguNO+0cpcULtQWZqALH2GaabNSn9noIUWAg6q9EUlY7+ZhAq7ocv55rkthDF/tJWtg5NuVW6/7RJxjHseL4ltOnB1criPsy3CNxIEhTz2t2NNklWbkQ2Wpeh6wh6EQF6mUeVHhlk7KpjdByrJGVjQqbLUhZ/rrmMv1ni9oaYV1PtueNGC2AIRqF3szXeUJIoBmk7GebayEssMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6073.namprd12.prod.outlook.com (2603:10b6:a03:488::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 19:50:30 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 19:50:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 15:50:28 -0400
Message-Id: <D9F4P4GJQTYE.37T2F8W787T47@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
Cc: "David Hildenbrand" <david@redhat.com>, "Zi Yan" <ziy@nvidia.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, "Nico Pache" <npache@redhat.com>, "Ryan Roberts"
 <ryan.roberts@arm.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
To: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.20.1-60-g87a3b42daac6-dirty
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: BL1P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ1PR12MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: a6eb6b27-0ccc-4089-3e89-08dd83694479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWN2cXorWWk4VkNHdmluUGdJQTFXRWwwSm1oTDBIdjRiaTN4Y0l6cEJFZ2FM?=
 =?utf-8?B?OG05RXcrVGRvS1UyQWY5M2VWbDdkSTRUTlg4azB5VkFMekgydFhYemUraGIx?=
 =?utf-8?B?N0Y2SXhtOEJyOUhydk9uWEtITUd1dmRSdndEUkpERkVMclk2UDZOUVRWK2E2?=
 =?utf-8?B?M29pZTBiWXMycTBHSDJMK1VCb3B6ZTFsODhxRkFwTFYrWlFORTFMbGFLZ0VI?=
 =?utf-8?B?dGIzNDd6cnlPUmhHcVNOWEFqNXZxUWF1QSt2WVFnd1VOejdrMHhXK09uWnRJ?=
 =?utf-8?B?NDZYUjlsU2ZWaGhWOGZ6ajE4VkZUZVNYTnVDeVZ4d05SazdwRjZEZmFZdlpO?=
 =?utf-8?B?eHROQ05iQlI0VDdxbDduSDduN2RXV2Vjb09VbGFpdUxTY21HWS8yQUFwclI0?=
 =?utf-8?B?STFVUkZjMU9ONDdkVUZ0djIveDdpVUNBN016TTNteDdpSG9HUHNKMXhNZDVy?=
 =?utf-8?B?QTQwWUs4YTU4UlBEZ09PUTg0SXR3R0JCMmQ2WEVMaEhlQTZES2NReHUxZVVJ?=
 =?utf-8?B?NnRSQklPa2NpZXgrZktaQ1FIQktXQ2kzdS9JSkxRZm9ZUG5ySWlsQ3Y5VVhN?=
 =?utf-8?B?WDM4Q1hEWG5CblJ2TG1GL3VZUjlSWXkxdjFCQ0xxMkQzRWMvclBieTY4T1JL?=
 =?utf-8?B?Rk0zelo4ZCtINkpHRFhxZFNiRUNONVdwTDJWWDNxZjBTSWp5bitOYTlVejZX?=
 =?utf-8?B?QjBIcFdzYmJjSTdsYWp1K1NCYVhsVmpsK1o3dG1MNktsTmM2ZEtKVkVkWXZv?=
 =?utf-8?B?Y1paaWFnd3NYUWM4NHhuMExHVFRmVVJSaElMWUNFcXpySWRqVG96TUJVZkhQ?=
 =?utf-8?B?TktweUFvdWRraHlZVStWTnI0b0JJN1N6ME9jb3hadW83YkZuQ2V2Q0FPdHYz?=
 =?utf-8?B?dXV6VjJQYmJiSVNHYjU3V1lHMjV3WHlpVkxOSW1LZ0RpTHlTdXN5Ny9WZm96?=
 =?utf-8?B?cnJuU2JyRkxESitHczlHbUpKQjVqZUt4TW96NnZONXZoTTMzYW5kdjVxeFhy?=
 =?utf-8?B?VEl0U0xRc3c1VnQ5TUptOGdCa29OaUtib0R3V3dxamV4ZGV4RzA2WWxkbEUx?=
 =?utf-8?B?NXY5MFZQU2l2cG5rN2FWaTYvK0w3dEYwUFlxNm5rcHNJcTdzMW9YQUVBb1gw?=
 =?utf-8?B?SW9VQXZJclVjMm9ob1dkQUxIS1EyeHAyN2swaldiK25MZ3VTSVlxUmF0bWs3?=
 =?utf-8?B?K21pcTJ4a0ZPb2luUStNNzd3NGRhKzI3L0pzV0ZwSDUrdGdCamREQXdudlRQ?=
 =?utf-8?B?a0FadWN3aSt4TGErL2NKejc3SXpLYlQ5U2l4bTZEYVcvaUQxbFF1aThuZUgx?=
 =?utf-8?B?c1BSSENpbFNad0t5cmUxYjdHcFhYNDRJZlFMYjNoY0NTSFduT2NNWDlZaW1m?=
 =?utf-8?B?TlJ2V09hTVkxSTFGRFUxY1pieU5RRU1VL2NCYnBFWFQzK3BwNEJmemZBWTVC?=
 =?utf-8?B?dXJFVjhpYmcyM3Q2RFNNUnQ3eUFyUGRsanZGc3JueWNZbWRpTnRGVDFzd1M3?=
 =?utf-8?B?UE82b21zZE5FdEV2Mko4OFFWN2IzY3hxZXd6Rm5aeGZ0cWprSUtnd1pPUm9v?=
 =?utf-8?B?bVlWcUt6ajVvL203R3R1ZCsxb3pRSDUrYjlHWU42WER3OTkraDhhTzIvVUFW?=
 =?utf-8?B?RytrQ1B0QUJGODVhUklOWERZaWVHZ29IOW5DbjVwczhjeU5mVThoWFhpUmt0?=
 =?utf-8?B?S1BzbDhXQUt2bytsNnFUUWZWNUI4Vk9qaU9YYWdkK2FTMFF4UkhnSlFmYjhO?=
 =?utf-8?B?QkgwMXVZM0xaMThLK2JqREJFKzNLK3N2cURmZlZXUlViQStxei9xTkdZNklW?=
 =?utf-8?B?VlJvYXR6dDM1MS8rV3NLcUNQR2tXbWxiNUNDVGtVVjRJVjlhcGxBOWp5eDZk?=
 =?utf-8?B?bzlaeDJkTmo5YmhGWjdTWlNaTEhrVG5JUThPVXdTdGN5aUFkdmxJbFNsT3ZN?=
 =?utf-8?Q?5I66V/VO9rA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFh1RW1FUi9SczcwSWRjelNOM3ZWS2JnOTJVcmdrY3h0QkI0L21VdkI3WjNL?=
 =?utf-8?B?NHllWU9qYUNwSG1IQjlSRFM2czhtOWxHZHMya2E5VHl0citRbEYxaWtwbjhp?=
 =?utf-8?B?QjdQYXkrNEtaY3ZCaWNyZDJ1bjFEVkoybS9CNDlFcVdiK200cTdiNzA2Q0hW?=
 =?utf-8?B?YzZaM3Q3aStacHFid1pxUlNkbk92MTZ5NFN6azE3VUNMakdMMWwxdGVrVm9C?=
 =?utf-8?B?cFVpSEx0c2JhbEY4Nm9RNkd2eDRVMytFSmdiQXJ6d05ZWTRnN29VcHZGOW1l?=
 =?utf-8?B?UFhDQ1FDRzRzdlcrZGE1VTFLbG1DT3J0L3hzVUhlMXAyNitKRzZ3aTNYR2pi?=
 =?utf-8?B?NEF0SXJrVlVDVllDcjZ6ai9KOEMwSkh4VHBKZUVJSy84bUZicWV3aVp0TkZU?=
 =?utf-8?B?WHNKVUpVTXRqdkg0Z1l6K1NKczZBSExjV2NGaWFFZFJSVG5yZldqVVNjR1RC?=
 =?utf-8?B?T0l4VGR3WFhWdUVPcXNSUWFCWEo2NER3YXdzazdST1JnU2d5SXAyMU5oaE1v?=
 =?utf-8?B?WllMRGEzeXdHenM0YXkyZk9pcUllTU12SGNJVFdzdXJJS2Mrang1UVJzTGhE?=
 =?utf-8?B?c1dvTUE5UkdKeVBWOC9RK3VvQmhjck1qUEVjM0F6bEoveU8zaHA0OS9CeWQ1?=
 =?utf-8?B?U0RqclZYZVgwWnlhVzI0bXg5VkgrR2o3Z2ExcHZla2M2WWpyOGN3ZVpjZlBq?=
 =?utf-8?B?M1pqaVdQb2J3U0h5bVpHTTljYXpib1kwOCtQejk1enNVajV5R2FQRHRqd2Zh?=
 =?utf-8?B?RThGalY2bC95OXJuRDFXSVJIS3lUa1MwSjNSNkpzSmxHdWlrSmhaVXdYY1l6?=
 =?utf-8?B?RC9GMlZGWGRzcmpQR0JWcit0WUxTeWw1aWNSVjhHbysyVmR4Nnh6RjNxVmNq?=
 =?utf-8?B?bDhjOURzNWV1aU5TaGQvMGVtdGhYRG1OWW1sU1drbWxMWlZ0UStQYWVPaEI0?=
 =?utf-8?B?RWx1cDhZL1dJVFBrQWNtWmh0M1dmb2l4MVBiM0RvNFBjZS9WdU5hWC9sYlM0?=
 =?utf-8?B?eW9PNk84WTJWb3NUazAvRlRScUs3QjJCK0lLTzNsR05FLzljbHQzQTlZMjBL?=
 =?utf-8?B?Zk5QRFYvRHltOXNQMmFPaHdZeWljb0J2dk9xbGM1SDNndnZrU2QyM0w5eTdv?=
 =?utf-8?B?cG1Ed1NUY3IwbWNHcDJOUUdsMTVYSVpZcExxeWQreHM0R2N1S05zaExYbTFv?=
 =?utf-8?B?K290eXRpMWhua0VrQUFhKzJ4T2xwZzF6UE9tZUZWeFRmL3owY25CaUZqcWVF?=
 =?utf-8?B?c3ZieEI3aG80cUhiQkJ3dXgveWl1MkttOUtGSVloeGVKRjFIeXF6M2FPWkx5?=
 =?utf-8?B?VDF0MzVuOVF6NkFPMHMxK1FyVFFZb1JiVFp5TmwrbktYNTBQaGhlZjNxOU9v?=
 =?utf-8?B?OENEV0N1TTlOY3ZKWWxaRTdZMUg1RnF1TU5yeXUxUkVUY3FKdFcvSmgvQ3hB?=
 =?utf-8?B?bnNpNlgyUEJYTHk4c2liMjlMTUxmbHo0QThwUVVuM1krUGtwTDA0cDZvWSsr?=
 =?utf-8?B?R1EyVjNzWkNTWXp3cUZpMXBScUhQQWVmL1pncXJRYytkTzRXbEJiRXdYQk9x?=
 =?utf-8?B?cTUvUFlCNHhDTXRzVTRXaWo2bTIwYlJ3aldFQzJOUEs2d1lMNGpIQ3ViUmov?=
 =?utf-8?B?VHBkRGhKTk16UWVxTkh0WDlXRStoSXprbUVtQUY2KzYwV0tiYkphZWZWM1VF?=
 =?utf-8?B?Q3M4ZkVhakRZbENUMHMwaUZseGdhTU05UlhRb1VuV0VuRTQ5UHJ1SUtqOVRr?=
 =?utf-8?B?OWplbWFza002NDdEZjdZQmNCZWxkZWlJTGVXK1hCYVNMOXlNeUJwMnhQaFdu?=
 =?utf-8?B?YmxOcTNDNytycDhRTTJjeUdEaFV3VGNBVWtzRUMvUFhBenludlBFRjUwS1JH?=
 =?utf-8?B?L3VvN2hKU2tuM29iQzU5Q2JaOUwxZEx0MVZLR05TOFhWMWYwZUZ3TXRmaEp5?=
 =?utf-8?B?cWxndjBVTUdjZGExZlpuUmp4MGU5WW82VU5TRC83UWVsN3F5ekJwd3pOMWhT?=
 =?utf-8?B?Vk5tKzNzNXVBVmZHUkNqYXVYOE9ya3cwcnNlU3pITGwrcHlYa2lGTGVKRHA5?=
 =?utf-8?B?cElMdm5RMXRuRXJXSEhWcmVEeUJZWnBIVFN4Q0hMb1ZQTmlkWjhFazY5Q0pI?=
 =?utf-8?Q?Wzczr5GdeF+x+k4z2ckoHLD4R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6eb6b27-0ccc-4089-3e89-08dd83694479
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:50:30.1512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6mf3kPkZT9l9sbgX/im647mVavqCjWEDMMX+Ddt/6VwvtxazLNVWdN6YnU+y4i/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6073

On Thu Apr 24, 2025 at 7:16 AM EDT, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for Transparent Huge
> Page support and add appropriate maintainers and reviewers.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  MAINTAINERS | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4015227645cc..85cd47a28a0a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15563,6 +15563,29 @@ S:	Maintained
>  F:	include/linux/secretmem.h
>  F:	mm/secretmem.c
> =20
> +MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
Acked-by: Zi Yan <ziy@nvidia.com>

> +R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Nico Pache <npache@redhat.com>
> +R:	Ryan Roberts <ryan.roberts@arm.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/admin-guide/mm/transhuge.rst
> +F:	include/linux/huge_mm.h
> +F:	include/linux/khugepaged.h
> +F:	include/trace/events/huge_memory.h
> +F:	mm/huge_memory.c
> +F:	mm/khugepaged.c
> +F:	tools/testing/selftests/mm/khugepaged.c
> +F:	tools/testing/selftests/mm/split_huge_page_test.c
> +F:	tools/testing/selftests/mm/transhuge-stress.c
> +
>  MEMORY MANAGEMENT - USERFAULTFD
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  R:	Peter Xu <peterx@redhat.com>




--=20
Best Regards,
Yan, Zi

