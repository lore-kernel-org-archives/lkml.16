Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2068.outbound.protection.outlook.com [40.107.212.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425D21ABA0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241768; cv=fail; b=e93p4cXnFeJBTrns+jytLa32YVyMyuLvxI3e6daTece+ZgYqzrNf0W7WrCDXUajeMzrKl0JXeB/Undk3M+xJ4ZUn0BSSo8U4qB4t+GJ9YBFlDlGtZtZdysHsiysHjnTD6i78QR3EVnbRv5JKMqpbe9D8X5UaQ7MIpsqvXL03BKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241768; c=relaxed/simple;
	bh=j9yTiBAbhVHQt3tKfoP98GyRnoetnWlWLU7AdYXgbFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sGWfaOBgjqqbig0i6+0pe2sZgnsgAsHQSghFbvCC5toMsMK/uC+D9HkRaUdN3ACjwzLVo1+xs03bstvfkr+vCwC545Y+kmd+3ZxtXLLOlHsrvgIKFOpapmJkSi3UrHRmVuvZ5DepLBGeqXPcBuyP225S10I9eLprX0FJfQvE+iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W0QU3Vsv; arc=fail smtp.client-ip=40.107.212.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W0QU3Vsv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRU39zoTtEpZLHQYakg2aWDtusa0gU4bkeSYyKJGV20CepyiXH+6DrrFHEthvUqAdUtlXsSpVbj5mS7wy7fZN125+G7IVoKy1ZBFUB7qkgXf2BzdVyWHZw6pcxELxCvvY2hLW8hzYfECrROMbR5uovc5lpGy7pDfoF5ilQrzJ7xzfeFBl3K+OHV5gJhD+zq+6RfjqothijtFEmMlI0ZcMV15S75BJIb7WHqbIHCAMATZtPcA0dZAotKxJIJnm5TdhPeywpFafg4HX6KT64hrBadP5wMcWu1NomDqMnzTZ+7jso31dLjlD1I9MR80ZyAHLEGmygJY9ZywGNY4wULpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gqi57rPtzj+CT35RXZYepFSfRun1bC/fFQnP3cdFY4g=;
 b=h+U4coF29yAH17NGjwCE0Eu8FLmCMZoDBuVUJcS+KT70vraHsi+0fGtW4E3G3+RmjoaxpG4MLte31PXdUqz1FOM371otgEn/BOPgfbnfoWJefPj7NAP41vgz0vypuPkR3bkd80BYhRgf1XJNTjCmCmD5XMcBaLXVTk8y38ZiM/g8MRvsi31KbGLxkOM+vYvPvRnk13xUACI25RnC4cgFCEwAr8/ak7rL7U8Q3cAQOCVOU1gcB33C3Qgf/9DzjGKXqtG8Qahp1sx+vZncIUXMkM4nqvJBbVHaiPZRvfJ2CNbbLF82FUMTGN0lCkLBGXam2bK6HeMBg+NGs+F62jnXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gqi57rPtzj+CT35RXZYepFSfRun1bC/fFQnP3cdFY4g=;
 b=W0QU3VsvXqlkGWxryyYNZX3rRWLUGZAsz9Tx+iCnSxeAmu+u4VLKmcy/WqQpM047x+IOm4/ofSelFnwvIpsYqXgZ/Wc3k7nlVtdlfAY5XLM1ySPmY/BVXyK45/nFHs9yDzkOnBV4/eF6d75/9qmuFdW6tBhJ77jL85vDPXK1mNZgIEdTFGL6C9aK37f1JmEpfpr9k3Ps8VpAZ6pCMqmrh3CI1c/N6PbkcdTJe2S/9k1KzsPzWgbKtQaueR/sVYvTkYAXg72cYrT9lguuQOD1K0zMd2X7M9x5s/9YX9ve9Ac+OOjQPJIP1Ywy0wu8115q5CYsp/C/YwRTUmnmCYrLJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 23:36:03 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 23:36:02 +0000
Date: Wed, 9 Apr 2025 20:36:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: dave.jiang@intel.com, saeedm@nvidia.com, Jonathan.Cameron@huawei.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH fwctl] fwctl: fix repeated device word in log message
Message-ID: <20250409233601.GP1778492@nvidia.com>
References: <20250408223300.24561-1-shannon.nelson@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408223300.24561-1-shannon.nelson@amd.com>
X-ClientProxiedBy: BN8PR12CA0011.namprd12.prod.outlook.com
 (2603:10b6:408:60::24) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb81e98-d389-411b-7bc2-08dd77bf4a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G8ZJM1/In4IkZrdNmTruZJg7GvGZHDHdRiS3S4qSm7V3sfaHntWw6ZDbqmU6?=
 =?us-ascii?Q?3lEfDBU8JXtGNKrrDVtTLQw6/X6MDFLJ4YtTVweTTaq8Ibj8C2OEnpVUvoCl?=
 =?us-ascii?Q?NEZhRlbiuDFX08pcwFKyUHqxmjXMsh8O8EBfQ1FJCkB7KMjOeD6CSrZkEuj+?=
 =?us-ascii?Q?GOyGpxC+eOXDhAasUco48KkK/YKX2RlPs74vgqVF/JnVMNrlhPAtWFH9Ib2U?=
 =?us-ascii?Q?7A0MTaf4PwV7oS3rELLJXtJsq7JYGvqRv5rjf/a8NetAR7+gaWyxltygHTUC?=
 =?us-ascii?Q?lzEjJo/tr5fTyvev9Lbs8v8zE4TYFdu7uBJ/ec0yv/XhD2BVHUe1+rii8jCS?=
 =?us-ascii?Q?mf9E9FwX9SbZISdASwum2zFKL7HlCOUXleLvAqWndd2ejs7KHv6vZ4RLYers?=
 =?us-ascii?Q?jPGgXjrG5acxXNLtSkXEcg+xdBtj5MaC9Gg0y0Ed67I6h47lbr1RKhmjU023?=
 =?us-ascii?Q?58cRR00GtaaQ1MeBuFh4XVVbYgmahAXsyeu3VNyNoI/t3iXvNpQgTJKDimix?=
 =?us-ascii?Q?e1dN+YqNJno8e4DwCWWf2oeaTLOzEUS+rw4oBf6cKCmd8fGJKZRamM8coc/E?=
 =?us-ascii?Q?eiAJwsx2S+cC27mdN2bxIHl7Ty/wbw3uL7aqIIi71C7OlaLjSSpxLON8HIgH?=
 =?us-ascii?Q?wb7qFkxlvxRuYXTX42LXrxLs9SvZvVBijC81+4RSXIELEzWRgRwQL03CWi1v?=
 =?us-ascii?Q?KQh06RjE9+I5iKoBtcy0EfDJFvZcj+LY+UvI/+L0DrhtT6yR1XvYom9hjYtE?=
 =?us-ascii?Q?GVT9ItNvRSs2ngk5jVyZdf9btD6pUrWQ46ez2cw/0clijcr+d6ephUo1+ey3?=
 =?us-ascii?Q?GCeQUyqR/RV1YlIWJnal9aULbHQFyCr6BYIF4+MDqGeYw8QkW9bVMF+jUy+Y?=
 =?us-ascii?Q?Y1qpON+1/hivBs+Z8lJwW1Kd0OG+7CQNnFcguafcyHyxtcqImTehqTcUNoe3?=
 =?us-ascii?Q?/1QgqMp5wndgGqZMbXfNIll349RBvle1D5lZgYlsltkOZB+CC3xTpICdg6WV?=
 =?us-ascii?Q?Kd+yzKNv6k07kJx8q/MH0V+hse8tDEA4kwjmBPW+tkV9m59bpMbfR+xeB6H8?=
 =?us-ascii?Q?4kFoVZJpYb2qmxGSFaouAA6NKpNOSe+3U/39lQedGbv3qANACzwEEDUp8DoO?=
 =?us-ascii?Q?Xy5ZAwQWtmVGMk3fYG71J39PhiEV7DxcdvXGbsRceAhMAP1+ymtpqgdxYiWj?=
 =?us-ascii?Q?GZxC+jydKomzc3RQ+61gMPTX5+DV7qjqhy5vzMUzwOzWh7xGx2DWBXB0gNgS?=
 =?us-ascii?Q?vjYn2FUVrOFMzflcK6aXrDjG2hEGYTE4nNDMRHrsIo5Ny0Efg7bKnd/Hl8Ec?=
 =?us-ascii?Q?PzcZS49ntMqXuWytwWqI+N3Gba+0akL/UItCXoyok+vNS+QyNRa7bIocTIjy?=
 =?us-ascii?Q?E3erCbM0jt0DHDKVxZC8Ma9GGvN0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8htBho0Q/IRTQviw/TR3y8McIT4ybcA7qKR3hMSLYvJThvGme69W/sJRxhS7?=
 =?us-ascii?Q?J+XH+POqXddbcvr1xVwAdQ+qOpqlQThOLJbAOFjFHXaxid798VnCZlDgwysR?=
 =?us-ascii?Q?ydqjlLA5C14NdjpgyOKqHQwS6CvpGfKVDi6HvdcTILVzN0i43IRrTk3upQMW?=
 =?us-ascii?Q?fi6aCdNt5brRmo5ILNBy0oceSCgO6LuYVYL8+CfNtfoYRb9rkOXQR02J6cv0?=
 =?us-ascii?Q?WIYt7aTl8TqWnFXY0RpJHIJhBnyTyfKfEWrelVYCvcNUtpElr1Wbw/z+nPgA?=
 =?us-ascii?Q?aOAXGiw/5fRmqNLu8W9X/v3jAoW2H2U6QbeoiZKXnC285MrZueiQLEU7nFgj?=
 =?us-ascii?Q?HrqDh9IQMi4XaxOfcZL7awx3TygZ1jCGIklD9jbO7wwKc62opE+Im2/5dFI5?=
 =?us-ascii?Q?xQstTVZ6jpW2BLUK+DB8uV8qhDLFjwrwoQF/G/tq41mR/UJHmOKsOA+YzBap?=
 =?us-ascii?Q?mtTztGRkQNPSNyT4Wd28DvIxHrV8icSHQQuH4u2InucGd2BYZSveCrtlCvhP?=
 =?us-ascii?Q?bMIGFM/HCpMLol3kxiEFJUtvOnhRaDq4LdPyfiiaZv01wbgfpE6YdcPjjWVJ?=
 =?us-ascii?Q?r482pLQMML6je9UrWeNtzkkum0FvWwlIWju9op3KKUuYn9MgcnVbQXa4L5dq?=
 =?us-ascii?Q?iw62cl1aHVG+QLkOTuZcw/P+3MHb7Jn5OqN05hgaeO3gOJ88jysS5jkEC6ad?=
 =?us-ascii?Q?n4Fw4zEMhCP4Vjc+86p6kJKOqsJ+WhC4WfsSGUP9AG3nk9bWM5bOg/FfBBfR?=
 =?us-ascii?Q?XCtmEJfKnPB0ldgyOepfXPdHeOjGosfD5qk2+OQGZqsNQCls5lNgKjMSWAb/?=
 =?us-ascii?Q?u5QiRYp5qXnQugAFPhVaVfGFxgdXd/gTtdIBF7e4ST3HqspGZd6jNBkHvgKT?=
 =?us-ascii?Q?f8G9t/weuUTz8ggE+zsFSP/gsdDDblvF7vSE5yxnxrazZeR/+KY4Pd6SdlUU?=
 =?us-ascii?Q?k8E1xitUWTXi+xjpYLBT4wSb0J2VLuwqvaTT5yjmOFd4df3fNX0whqi+HXGh?=
 =?us-ascii?Q?bcNswJFAWJIJGnRZZAEKxIuzXKNVtXE27cVLqJURV/1vZCQEkXSKPRZVjZ7G?=
 =?us-ascii?Q?PTRUJwNCoqLpf8TvLJzP9E8ezRvz3FxRMqk/eO9WOHuAXqDYPojThJXCY7Md?=
 =?us-ascii?Q?xmBxOkS0Fyolqt1eSAOMt/6ozO3P3pcBUbH9HZfpKLdhVUkZTPy3B0xj1pqG?=
 =?us-ascii?Q?ecLIG7wyxRKVvbXWo/ysjb8fKxs+YBss9qEY9+N+369VmmKfqZAX1qYvfOJB?=
 =?us-ascii?Q?csGEdY2wi+8HDmyzROgQ8tuUZlR0ZQpMSGbJh5HQT9Y+5GYlLQhQ0KGj9O2N?=
 =?us-ascii?Q?81U5bxmJ3JXZXPTIUwdQrc823wpC9ph9ODhZpd1qVdt6f85/tv3eea7vaV/B?=
 =?us-ascii?Q?0Gf9YlminONdCa4HmLzGdL/q8fn28+VpjPMlQSUB5Mhql/it0G89RIVx8Tm7?=
 =?us-ascii?Q?Oll/CV/oM03RReMGg/2cMHwf++cf3kUPukbK54anVO6HwisvlGd/SLxhbtoz?=
 =?us-ascii?Q?LZF95yQup5nbX8F3wJ+fSB5Vz/UFlo7V/s2iES0zGPbk402xSKq46nGIOMla?=
 =?us-ascii?Q?yYVI71EkoXtlI14zc+0+tiUsM3i6URXaUESdRJU+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb81e98-d389-411b-7bc2-08dd77bf4a1b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 23:36:02.5429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +n+UxxFjdJzpJD4Kj04vatIFTWqeA6/tM6FDtu2xwRGSHiQ8MkL1WNg2NOOC2OmE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180

On Tue, Apr 08, 2025 at 03:33:00PM -0700, Shannon Nelson wrote:
> Remove the repeated word "device" from a dev_warn() message.
> 
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
> ---
>  drivers/fwctl/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied thanks

Jason
