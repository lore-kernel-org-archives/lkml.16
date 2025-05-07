Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDDF156228
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 01:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746582657; cv=fail; b=g7FVZhsrDN0C9SC4QJXY/KQxUlw9gbXjD7cpNWpd055HgzTybM0nT0juv9FykoQ9pPWCoXDtj0pIllWxjkFloWBovB1/0ANpgJR+OqQLTf2v7KVRJwj4uJlU1JzRYEiUnteCc1vqbX/W2TVXnmQS0BJx4X7Sx2JkL9xOUrLK6xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746582657; c=relaxed/simple;
	bh=+VWtxSCzW2BnRH4u5tJjzjxoQsqSi9As4C49nUH8lzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lWiWPUrLxyEC8U1wTfRf6dTjFRI0AQ6c6/kqmKQ8A5JjKCNuehVQpYxuuLYIjLPOcrzoFD7EKRrbYT8rOLdqGlky0/bR3xp1uWVdBTLJL1JGas8Sx2SGDFHNXgotClOLxMPY1XN06OPjS4/5NHBtM5ZxGgY1khXhpOmWvrsTsr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jtLhRC76; arc=fail smtp.client-ip=40.107.236.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jtLhRC76"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1b3c/smW0gJ3IPwilAN9/lQxDTmiiifR03sRexBsXE+HYwm++OR04YTNwzleYjCZlCuyjuiAyVvf2UA+aaQKCZRfvD61W+U3Eoak2UzEFMUXQ+nzItTiFBw4csdwaasKun4n++OwTMEFRPPbYQUZpYGvyhPNW9mcUgsRUOp9mg962pIfFUNhn4fu8FFZNiYB7zFIzX2Xd9fGgj0icCmAdqCeHIJ6qGuO9wi/jTh2DNR2t/IYTur9nFtEwi+eWSluUpLhksa7NDprKycfQEk93DMnxBD0+PSBSkjVBLKN3FRMTpOIyKI53K0+5ZVuxrLevxm9lXZzfTJD/aoEhebIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDv06xwTufUB8StVLw5aOBlbT4Dgx6Rq8o0U/mYZ2tk=;
 b=lO+jNYxC39RQ0gsZ4X6m9fLHjxBjocBy1xkQ0d/mULF8Tx8pKPfkm5SmCm74UXbbxZu+k1qEeSL/AmL8QgewGZ/UZXcKR/cLw2e763qPn8ozBOSSCqXuwK5ax2OSd9S8Vtk+OUkTtR5TnqVRj3yKtylgyk+8eK4sGTOeqZOSYtAaRWgAWxvFvTfrYh/9go4hIbb4KNbQAy60INTh974VCqwvQ94F+/r9+1H1xZmmikpuGauQdjs/cHmZxLpGQ+j5IDGnLzveePmERLLJ9/drM7Sh+RVJgNrRxz76ofJX4tFwq9+CvXxgC5ABsqEx1nk11hV5vabSkW+I0CdIrw+SMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDv06xwTufUB8StVLw5aOBlbT4Dgx6Rq8o0U/mYZ2tk=;
 b=jtLhRC76BOEhOWdKoc6IiMO+vBqq+Flv0IRdzp3Ycrlef/rjyIBgIZW379Do/etrd2/B09sIRp+LVY7+yIQCxRdYADqwBPWgMW/FA5IlDr6N/Ex3CiAVn/7oJVk7nIz7DxDoSt/wnX5Ew2Z/cyuvq7c32O9DwbfI3zvFDjHOnoAE5XVXWIzeMIHIk7Ndp+Ur16aHM7fzSnhpjrC3yxeGLyHr2kWFLjyLkmIx6XX2JXMO/j4iI14caNDppuxiQFk3sI/4sUzzQO7hH2lpidOXdLbrHp44lvX967nW9nXjhMphtu++ys3RsniMiEG/jtRrOhzGTXXkvN+TyxMA21L8vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4331.namprd12.prod.outlook.com (2603:10b6:5:21a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.21; Wed, 7 May 2025 01:50:47 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 01:50:47 +0000
From: Zi Yan <ziy@nvidia.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nhat Pham <nphamcs@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>,
 Andrew Yang <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>,
 Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Date: Tue, 06 May 2025 21:50:44 -0400
X-Mailer: MailMate (2.0r6254)
Message-ID: <A3307E1B-B741-4C23-8053-72A1CA04D923@nvidia.com>
In-Reply-To: <aBqzcIteOzC9mRjY@harry>
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
 <aBqzcIteOzC9mRjY@harry>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN0PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:408:ee::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4331:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf214ca-0823-4094-f0b9-08dd8d099686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3dkNGtQdkY2czRmNmRRN0ZKL0Y1SVgzb3dPWEVwOVRxbm04cXBVZm44Y2Fv?=
 =?utf-8?B?TXJKUDBtYWF2LytUQUozWEQxekJSN3l2MkZkY1NwUnhTN1M5dHhpRFZ6Y0g0?=
 =?utf-8?B?ZmF2dGl0czN4amUrS21vNTRwWkExbmgvNkpWZkh6Q0xiditkUHZuZGlCUHdo?=
 =?utf-8?B?UDhLbFRZTmdZMDJjTmlaMjQ4cEdpcTAyajJZeTVvdTBkbzhkL3NBY2psUzht?=
 =?utf-8?B?Z0JuOWJXWnQ0NW9GU2ZCN1BlV0dLSm1lRVNwMWQxZ3pmQkU5QWUyeExENEdB?=
 =?utf-8?B?SkhuU3IxL3NZd2RQanZiU0Q5U3BsYzJqZCtQckhvczlMWm5UbnhWUC9seFBz?=
 =?utf-8?B?dlVtdENrNkJtSGM2eE4xSHU2ZVBLTVE3TlVvOWIxa0NZSzgzK3BBR0taYTcy?=
 =?utf-8?B?d1U0NkUvL0dBblJJd2pla2o5K1Y4UHJVK3l5cVI0WHVmcjdoSGZwTTFVMjRa?=
 =?utf-8?B?TU9wOG1sTEtTdkNBT2Y4dTJ5WHYrWnZ0M252NzFDOTUrOVN5MmFHZHZ2VS9k?=
 =?utf-8?B?SDUwSGptSVFRZllyL0lVNEJ5b05NbGpZSXl1aWJQZnpTZnVqWVIyazJ4akZ4?=
 =?utf-8?B?S0JhUWNOZkM1U3hwRXE3ZndZTkE1dFEyV3NpMGwwZVc1bXNuOUM3T2tYcGor?=
 =?utf-8?B?OFI1Vml6c28zSnoyMTQrZXdiZUUvb0Z3MU1nRXdTVnc4N3NXVm5yOGk4Z1l5?=
 =?utf-8?B?SlV4NTkzWXhTanNKcmk4aFRjeGhzZ2Fha3Jaa3VEazVlNFU0Y2lnaXNMZjRY?=
 =?utf-8?B?c2ZOeTFKb0pCMTJub0tpd1p2cGZZK0tVODA1SHFWY2VUK2htbnpXbU5vUjFv?=
 =?utf-8?B?djdZbURBNXp6Umd5SW1kdkRHSUcrRlZFenJ0dmxwaUdxN2tENWttcUFqOHJX?=
 =?utf-8?B?NmtndktBSmhuWjIvdWNUZXdtZy90cnRLTUdoaldiNldNK2JuVXpvQjZ5Slgx?=
 =?utf-8?B?aUYzVFlwZnM2a2pYako5am1Fb2Vna3Nod0pwWnVJeGRvalpBZWxBclF2TDgz?=
 =?utf-8?B?RUF5cllYanRVdWpEQnVSUDBjZXlQNmtzbHNIaHZ5OUFleGdjZEJxZDI5ZGE3?=
 =?utf-8?B?S2FNZ1kwMXBjeVJOaXlWREg2RnlPWGp0MEJUaFRSb0RueFhheTRtOXFHMjZG?=
 =?utf-8?B?YWlyclFuTG41Nmw5UytYWVJ6SktPRFdKamlOVG5tWCt6YU1CYlMrcHY3WGFy?=
 =?utf-8?B?ajdFQXNXWWdQQWNEd09aZ3hKOG93RHRlUFcrcnhwZ044ZVYxcys0Qy9pcEhi?=
 =?utf-8?B?VHl6RUcwQ1RyUXArc1BFY3lXSTRER3g4M3JNc0tKT3dDQkhLOWFiZ1U0TzEz?=
 =?utf-8?B?ZWFGOTZJVnpPWHBkRkp2VkU1cnhrc3U4cmIvZE1ZTlJPVTFla0g5SXlpMGpS?=
 =?utf-8?B?dmZLTHl3SlNVRy9wdU9wQmVGT3poU3h0Q1ppR3FCQTZWdndlRmEyZFNNMjlN?=
 =?utf-8?B?amRocVU5MEFhL3VQUzdYUk1sbEE1VU82Q1k2Rm9YL3VmZnptM3E4aFVob2Z0?=
 =?utf-8?B?VDhDbkdVMVJydXpReVByYlBiTlFmV2RWWFlGcXBkQUI1RFQ3WElDaEhZOVNL?=
 =?utf-8?B?RG16VHJ6dWd1VGpYcHZmVWVNSU1LbXpLZ1c0cVdZUURsRzVjSEdSS0ZNT2tO?=
 =?utf-8?B?aGZaQ01TRkp0Y3p4a3hiejlZNC9OTEVBM3NrWENxUStNTUN6S3FnM0NGOTha?=
 =?utf-8?B?Z21DRVY2ZGhHeE9BWVkraW1PZUk5cEJwUmpJSlJZU1BoM3VYNnkyYU1XVTFO?=
 =?utf-8?B?Lzdsb3JEa1J1UkthSERHeUVRVzFuQzNrSGU5Z0NOZlZnaUo0aU9kdkkzZjZs?=
 =?utf-8?B?RWF1bTB2ZEwxaDdUdE9VQUdEWFdvSkZZNTNxRkVHamFjMkdmQjQzQXpsbVIv?=
 =?utf-8?B?LzBMVlVvOGhtY0F2T0FndlhWUWRxUjRTc1UzOU5PNWRtaC94V3pRbVJJQmpy?=
 =?utf-8?Q?wwfZbBB1h+c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzNxSUJPZ3RJV3V6QWthRjhPZkZrZ1dCb2dSZDM1OUU3N3c2TmR2NjZUaE5V?=
 =?utf-8?B?eG1oUzhkZklEYld4NDBwS1JVK0tnbjhPRklYR2VMM0ZXOTllYU0wckdjNlYy?=
 =?utf-8?B?NDZLNE53Z1U1RUVKa0lwbHoyTXp6UXJFdUNKNGYrcGRwQ1NyYnZyOEVyU09u?=
 =?utf-8?B?WFZVbmZFUnpsNzVWUTh2SlorRlJFMnZmTXdFcUlEQTdLR08vQ3R1VmQ1K0VO?=
 =?utf-8?B?U2ZETkJVQjc0QVpwazZkdVVCR2ZRS1lHNDRSdld3NXk4OElhNzFhMXgzSWZP?=
 =?utf-8?B?UngzN0pXaXkvMkR3a0hqaUExTDZwUy9vUjhIUXN6QzBSK2p0dHJIZVFhQmVi?=
 =?utf-8?B?Q0VOOWxYeXFYV0pUcGtMOVVSQ2xQejRNMUNYOEN3NUxTNU5reW53TGZwOVVC?=
 =?utf-8?B?WjV0TWxiZnl5QUlwRjJyYWtjcmVzR3RXdTJrL3dUMjNYU212bUNWOFZoRG9z?=
 =?utf-8?B?dTdPUWlWamQrajhUdDBOczZKbHh0bjN4bzBqZnRudnhSMkh6amRuWWliNW11?=
 =?utf-8?B?RmNXMit3dW1jQnNkNkl5ZUlIbHVncEJVanE5ZEZqc0lMYThwSTNZa0VrRGRT?=
 =?utf-8?B?eTB1WTgxY1pKWkl0TFRLY1o2QURwN3dqRzdPRzNaNXdHbWd2T0Z0b2d5ai9F?=
 =?utf-8?B?Sm50L01CUUFqMHRxendySlBRMkhRWkdWSDU3bEFOZStqd1JzekhjRWgzcytM?=
 =?utf-8?B?Vzg4SVRGUnlLRHdjRHgvK3VQdU9JWWI4bnZUTVJxdGhhd2RYU1FFQmhvYlJ3?=
 =?utf-8?B?VzVBT1BrcW84dVdOMEtrdU1YbU94dFo1K0RHVjA1YTI2Zkx6TUpkTlBTb08x?=
 =?utf-8?B?dmRIdk9pSzQ4SDk2NWp0L3Z1bzM2RmhGbGl2Q1NoRm5QcTZFSjArbjlRWkhO?=
 =?utf-8?B?T1NRZnNGc1EzMGdUamlHNlpUS2ZpMmxhdDBzeVZ6UjVVdU5ubzZNRElTWXho?=
 =?utf-8?B?UEQxK0Yzdk9MYkpGME91Vkwxd1lONHFIcjQ1WkJ0c0ZLNUdSVU9zSDNXN2Rr?=
 =?utf-8?B?RFFyanVKUGM1ZWhaL0VjZU5xUVB0QzA5S1E0ZEZPb21pOExvSmhXQnlORkxn?=
 =?utf-8?B?c0lzelFlRUErWWtGb1Y0VzhVeHh6UXlyc0ZCM2NUUSsrNXJHMUpTY0daYXF0?=
 =?utf-8?B?c2lzK1ZYVTFiUW1zUmN3SnFqekZiM0hudTZKa2lGcWc2aytzOVI2TnBwVmda?=
 =?utf-8?B?NmlkRHdVTGt4RHZaRWlaL0pKbVBvWVV3YlVBTHk2NWoyc3ErODBJSE9WRU5H?=
 =?utf-8?B?N0ZvVE5FenJqN01pNmc3WnhJOFJUQUlNR01ldW80Wm56Q21Ua3dXRGk0eHgr?=
 =?utf-8?B?NWd6MVU5SVZKbC95ck5XckdiUWJHLzZ4KzVDM0FZZVFnSWhkb3JHQkJQeUxw?=
 =?utf-8?B?MmFMcGlCVldPMHVoYW1vK0E5ZWZVUDJTZkNZeTMwOHFueGxMRmJncHczL2J0?=
 =?utf-8?B?Nys4b25BaG92RFR1YU5yQUszNi82bU8ycVpROGk1QTNsdzE4c2hXaTRrZW1E?=
 =?utf-8?B?RUlaYkZLME5XNmFBemFJbGU1Y3g0bTBER01jc1llNHQ0L1hxNm5oQXZKemdN?=
 =?utf-8?B?ZTB5bXlwSjVQdzdnVVhmQXQ3bnhUbFVWWWJCQzIycEF3MTZNVFdTUWd5cSto?=
 =?utf-8?B?VVJkNHZSMVNHWUdncHlCcGtKU04yUUpVeDQ5NDVmb2ZEc2QwN0pqbmQ3cWo3?=
 =?utf-8?B?Tk4rSGVDcXhyRVA2RTd4Y3M3ZTB5eG1MeUlzcXJ6dXUyOFY5TmJnVVRES1dk?=
 =?utf-8?B?eHVuaHdxZFo4ZE9Nemp1OW5QclFhbHVaL0xFNFZXcSswbU9sZVZ5cWk0SG52?=
 =?utf-8?B?Q0xrQUtyVThSUER0bTI5YjBZWEZ0TlFsZHNxRGJFcW5jMUV1VU55NkdTVlBB?=
 =?utf-8?B?b0x2S1JhN3ZQK2gvZldySmdUblFmVTNZeENrcXhBdEV1amtxZDR2TmkxVnpD?=
 =?utf-8?B?L0JtYkdWMjAyUjVMbjU0ejJ1Wk03eVdnWEFmbytXckFOaWY0VGF1RXhWelp3?=
 =?utf-8?B?cnV2TFROcU5EMXY5NXJQZWpVZE80MWtpejhpZyticWkxcEYvNDl3NmxnU3Qz?=
 =?utf-8?B?SzRVUGMxUDJXckF1QUZnMFUxSWduUkFlSDB1M05aS2NWTThoN1FJbU1UcTIx?=
 =?utf-8?Q?FT+nbQqjX94eYjASOo6I77c61?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf214ca-0823-4094-f0b9-08dd8d099686
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 01:50:47.7689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaPl8IwLSS0h4xqOzs+u2Oh3O5cJwpaKklaNUKZaU5okULgz6kHwRuk6V13DUIRC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4331

On 6 May 2025, at 21:12, Harry Yoo wrote:

> On Wed, Apr 30, 2025 at 04:26:41PM +0800, Qun-Wei Lin wrote:
>> This patch series introduces a new mechanism called kcompressd to
>> improve the efficiency of memory reclaiming in the operating system.
>>
>> Problem:
>>   In the current system, the kswapd thread is responsible for both scann=
ing
>>   the LRU pages and handling memory compression tasks (such as those
>>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can le=
ad
>>   to significant performance bottlenecks, especially under high memory
>>   pressure. The kswapd thread becomes a single point of contention, caus=
ing
>>   delays in memory reclaiming and overall system performance degradation=
.
>>
>> Solution:
>>   Introduced kcompressd to handle asynchronous compression during memory
>>   reclaim, improving efficiency by offloading compression tasks from
>>   kswapd. This allows kswapd to focus on its primary task of page reclai=
m
>>   without being burdened by the additional overhead of compression.
>>
>> In our handheld devices, we found that applying this mechanism under hig=
h
>> memory pressure scenarios can increase the rate of pgsteal_anon per seco=
nd
>> by over 260% compared to the situation with only kswapd. Additionally, w=
e
>> observed a reduction of over 50% in page allocation stall occurrences,
>> further demonstrating the effectiveness of kcompressd in alleviating mem=
ory
>> pressure and improving system responsiveness.
>>
>> Co-developed-by: Barry Song <21cnbao@gmail.com>
>> Signed-off-by: Barry Song <21cnbao@gmail.com>
>> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
>> Reference: Re: [PATCH 0/2] Improve Zram by separating compression contex=
t from kswapd - Barry Song
>>           https://lore.kernel.org/lkml/20250313093005.13998-1-21cnbao@gm=
ail.com/
>> ---
>
> +Cc Zi Yan, who might be interested in writing a framework (or improving
> the existing one, padata) for parallelizing jobs (e.g. migration/compress=
ion)

Thanks.

I am currently looking into padata [1] to perform multithreaded page migrat=
ion
copy job. But based on this patch, it seems that kcompressed is just an add=
itional
kernel thread of executing zswap_store(). Is there any need for performing
compression with multiple threads?

BTW, I also notice that zswap IAA compress batching patchset[2] is using
hardware accelerator (Intel Analytics Accelerator) to speed up zswap.
I wonder if the handheld devices have similar hardware to get a similar ben=
efit.


[1] https://docs.kernel.org/core-api/padata.html
[2] https://lore.kernel.org/linux-crypto/20250303084724.6490-1-kanchana.p.s=
ridhar@intel.com/
>
>>  include/linux/mmzone.h |  6 ++++
>>  mm/mm_init.c           |  1 +
>>  mm/page_io.c           | 71 ++++++++++++++++++++++++++++++++++++++++++
>>  mm/swap.h              |  6 ++++
>>  mm/vmscan.c            | 25 +++++++++++++++
>>  5 files changed, 109 insertions(+)
>>
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index 6ccec1bf2896..93c9195a54ae 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -23,6 +23,7 @@
>>  #include <linux/page-flags.h>
>>  #include <linux/local_lock.h>
>>  #include <linux/zswap.h>
>> +#include <linux/kfifo.h>
>>  #include <asm/page.h>
>>
>>  /* Free memory management - zoned buddy allocator.  */
>> @@ -1398,6 +1399,11 @@ typedef struct pglist_data {
>>
>>  	int kswapd_failures;		/* Number of 'reclaimed =3D=3D 0' runs */
>>
>> +#define KCOMPRESS_FIFO_SIZE 256
>> +	wait_queue_head_t kcompressd_wait;
>> +	struct task_struct *kcompressd;
>> +	struct kfifo kcompress_fifo;
>> +
>>  #ifdef CONFIG_COMPACTION
>>  	int kcompactd_max_order;
>>  	enum zone_type kcompactd_highest_zoneidx;
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 9659689b8ace..49bae1dd4584 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -1410,6 +1410,7 @@ static void __meminit pgdat_init_internals(struct =
pglist_data *pgdat)
>>  	pgdat_init_kcompactd(pgdat);
>>
>>  	init_waitqueue_head(&pgdat->kswapd_wait);
>> +	init_waitqueue_head(&pgdat->kcompressd_wait);
>>  	init_waitqueue_head(&pgdat->pfmemalloc_wait);
>>
>>  	for (i =3D 0; i < NR_VMSCAN_THROTTLE; i++)
>> diff --git a/mm/page_io.c b/mm/page_io.c
>> index 4bce19df557b..d85deb494a6a 100644
>> --- a/mm/page_io.c
>> +++ b/mm/page_io.c
>> @@ -233,6 +233,38 @@ static void swap_zeromap_folio_clear(struct folio *=
folio)
>>  	}
>>  }
>>
>> +static bool swap_sched_async_compress(struct folio *folio)
>> +{
>> +	struct swap_info_struct *sis =3D swp_swap_info(folio->swap);
>> +	int nid =3D numa_node_id();
>> +	pg_data_t *pgdat =3D NODE_DATA(nid);
>> +
>> +	if (unlikely(!pgdat->kcompressd))
>> +		return false;
>> +
>> +	if (!current_is_kswapd())
>> +		return false;
>> +
>> +	if (!folio_test_anon(folio))
>> +		return false;
>> +	/*
>> +	 * This case needs to synchronously return AOP_WRITEPAGE_ACTIVATE
>> +	 */
>> +	if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio)))
>> +		return false;
>> +
>> +	sis =3D swp_swap_info(folio->swap);
>> +	if (zswap_is_enabled() || data_race(sis->flags & SWP_SYNCHRONOUS_IO)) =
{
>> +		if (kfifo_avail(&pgdat->kcompress_fifo) >=3D sizeof(folio) &&
>> +			kfifo_in(&pgdat->kcompress_fifo, &folio, sizeof(folio))) {
>> +			wake_up_interruptible(&pgdat->kcompressd_wait);
>> +			return true;
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>  /*
>>   * We may have stale swap cache pages in memory: notice
>>   * them here and get rid of the unnecessary final write.
>> @@ -275,6 +307,15 @@ int swap_writepage(struct page *page, struct writeb=
ack_control *wbc)
>>  		 */
>>  		swap_zeromap_folio_clear(folio);
>>  	}
>> +
>> +	/*
>> +	 * Compression within zswap and zram might block rmap, unmap
>> +	 * of both file and anon pages, try to do compression async
>> +	 * if possible
>> +	 */
>> +	if (swap_sched_async_compress(folio))
>> +		return 0;
>> +
>>  	if (zswap_store(folio)) {
>>  		count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
>>  		folio_unlock(folio);
>> @@ -289,6 +330,36 @@ int swap_writepage(struct page *page, struct writeb=
ack_control *wbc)
>>  	return 0;
>>  }
>>
>> +int kcompressd(void *p)
>> +{
>> +	pg_data_t *pgdat =3D (pg_data_t *)p;
>> +	struct folio *folio;
>> +	struct writeback_control wbc =3D {
>> +		.sync_mode =3D WB_SYNC_NONE,
>> +		.nr_to_write =3D SWAP_CLUSTER_MAX,
>> +		.range_start =3D 0,
>> +		.range_end =3D LLONG_MAX,
>> +		.for_reclaim =3D 1,
>> +	};
>> +
>> +	while (!kthread_should_stop()) {
>> +		wait_event_interruptible(pgdat->kcompressd_wait,
>> +				!kfifo_is_empty(&pgdat->kcompress_fifo));
>> +
>> +		while (!kfifo_is_empty(&pgdat->kcompress_fifo)) {
>> +			if (kfifo_out(&pgdat->kcompress_fifo, &folio, sizeof(folio))) {
>> +				if (zswap_store(folio)) {
>> +					count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
>> +					folio_unlock(folio);
>> +					continue;
>> +				}
>> +				__swap_writepage(folio, &wbc);
>> +			}
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +
>>  static inline void count_swpout_vm_event(struct folio *folio)
>>  {
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> diff --git a/mm/swap.h b/mm/swap.h
>> index 6f4a3f927edb..3579da413dc2 100644
>> --- a/mm/swap.h
>> +++ b/mm/swap.h
>> @@ -22,6 +22,7 @@ static inline void swap_read_unplug(struct swap_iocb *=
plug)
>>  void swap_write_unplug(struct swap_iocb *sio);
>>  int swap_writepage(struct page *page, struct writeback_control *wbc);
>>  void __swap_writepage(struct folio *folio, struct writeback_control *wb=
c);
>> +int kcompressd(void *p);
>>
>>  /* linux/mm/swap_state.c */
>>  /* One swap address space for each 64M swap space */
>> @@ -199,6 +200,11 @@ static inline int swap_zeromap_batch(swp_entry_t en=
try, int max_nr,
>>  	return 0;
>>  }
>>
>> +static inline int kcompressd(void *p)
>> +{
>> +	return 0;
>> +}
>> +
>>  #endif /* CONFIG_SWAP */
>>
>>  #endif /* _MM_SWAP_H */
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 3783e45bfc92..2d7b9167bfd6 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -7420,6 +7420,7 @@ unsigned long shrink_all_memory(unsigned long nr_t=
o_reclaim)
>>  void __meminit kswapd_run(int nid)
>>  {
>>  	pg_data_t *pgdat =3D NODE_DATA(nid);
>> +	int ret;
>>
>>  	pgdat_kswapd_lock(pgdat);
>>  	if (!pgdat->kswapd) {
>> @@ -7433,7 +7434,26 @@ void __meminit kswapd_run(int nid)
>>  		} else {
>>  			wake_up_process(pgdat->kswapd);
>>  		}
>> +		ret =3D kfifo_alloc(&pgdat->kcompress_fifo,
>> +				KCOMPRESS_FIFO_SIZE * sizeof(struct folio *),
>> +				GFP_KERNEL);
>> +		if (ret) {
>> +			pr_err("%s: fail to kfifo_alloc\n", __func__);
>> +			goto out;
>> +		}
>> +
>> +		pgdat->kcompressd =3D kthread_create_on_node(kcompressd, pgdat, nid,
>> +				"kcompressd%d", nid);
>> +		if (IS_ERR(pgdat->kcompressd)) {
>> +			pr_err("Failed to start kcompressd on node %d=EF=BC=8Cret=3D%ld\n",
>> +					nid, PTR_ERR(pgdat->kcompressd));
>> +			pgdat->kcompressd =3D NULL;
>> +			kfifo_free(&pgdat->kcompress_fifo);
>> +		} else {
>> +			wake_up_process(pgdat->kcompressd);
>> +		}
>>  	}
>> +out:
>>  	pgdat_kswapd_unlock(pgdat);
>>  }
>>
>> @@ -7452,6 +7472,11 @@ void __meminit kswapd_stop(int nid)
>>  		kthread_stop(kswapd);
>>  		pgdat->kswapd =3D NULL;
>>  	}
>> +	if (pgdat->kcompressd) {
>> +		kthread_stop(pgdat->kcompressd);
>> +		pgdat->kcompressd =3D NULL;
>> +		kfifo_free(&pgdat->kcompress_fifo);
>> +	}
>>  	pgdat_kswapd_unlock(pgdat);
>>  }
>>
>> --=20
>> 2.45.2
>>
>>
>
> --=20
> Cheers,
> Harry / Hyeonggon


--
Best Regards,
Yan, Zi
