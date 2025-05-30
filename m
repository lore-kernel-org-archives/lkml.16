Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD031E503D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580836; cv=fail; b=oetLK6esViDjmZh38wzOZlkzYh2ASnbyJwUK+zt25p1DiH6ZLSWgUl4hJVq7w+QGHZjt1LlG+OB3TjY8uJy4m2UKlCTkpjhqei2MGABLhRR8j96nVGStpqlWv2QOfC3rF49/CxMu+SsS6nhTO45ZKKvB0dpAlSbd4t/HecKoclU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580836; c=relaxed/simple;
	bh=/q5wHVM7DuI7IN4+cMaYywwd2TFOSv83Hn0Lp4niE9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HL1Oc0+S4eEYASD0OP+yMKXeAOCIHXRN578Zi5/vkewwlkFhcF/WZPAMfDOaIFkr4t5WzuBLpblVsqYeN3mBXuvU6H9q89N4xvn1KoltLj03Kz/AH1E6bSpZy6e+msikyi/pCIhKcWIqYW7F3TeuQn11Sxct2SO8d9XiJ8K/S6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ClAjvuYR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kRM5ZRjx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ClAjvuYR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kRM5ZRjx"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0u18N006822;
	Fri, 30 May 2025 04:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=AP3Fwv4cWsL0IwPUGX
	50cokhJfhMe6FW0xT4V2yLgCY=; b=ClAjvuYRTJCTvEmXdWi9ZVFogq21DtqDx8
	eMttZUU5eMgEKOKD9Jiv57u5ly0DLOqkuL4vK3To9lEWMoNcMqstojyYFC0Y/vk9
	nS/Z95bQelsca0FIvODHPdWYAWEYCVLtbmuNTvB+SWPyHlBq9DkKBCI7MDc/kpwn
	JT1pIKrVSAdBGH9bZgMv3KayE+ZXR9gDygjAbNogwY7yjnsx3Ytlbv+lBt8oNkxg
	PUOTMKTTbVWjcHHTneLyJJL2khhKn8ZuGvjg0zFNpl0StR7DLqgiFTLWIa7cWFvA
	ivD4x8MqhBtWAMSCJ5Ve5p4R8ZS9XjodAeat9W4js1oiEeKUXOhg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33n1hwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 04:53:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54U3GlMW023348;
	Fri, 30 May 2025 04:53:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jcjaf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 04:53:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmw3C3F7EQFhPgyxl4w97fotIiz0QI5LRodF1/MnDhxymhkIQkzkY2fkg+chEljdOX3K4BG6iJoUBMa6bHra7U6808DdnU+ydmE7iSEJZlJV9dLkOSmBnEkZP3yESjcH8LBA1yl0ofymwvYqUiCoLTJO4pjxkkbKFe0P13kyeB9YoOHVr3Cx3d3DZoIyLHZhiW1NstA6jOj56L8B6yPNBjrTKhEmkaPSCaeJ8al8GElbJI87qqUDGz1/msyTtVyeBBbCUHWjHV/CffMiqKRKGjs3nFy+CdGJ6ZvDJfd0cCqBwT6UyxNRHM1ZvT/2DgQ6DhFLH54DfzupWLoS3rVUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AP3Fwv4cWsL0IwPUGX50cokhJfhMe6FW0xT4V2yLgCY=;
 b=kT6d4ehj4/FuwtG4h/I1jDVlEDNrPODmd86RA8Ex98RVLupF4vngZHLzq+Rq8UZeW6W7+tNeX1KPx7SlKhCSpwZr0UIR6ODmET97pnXjcJvKdZVcogFvNQTnEZXCXHJDpefr6c2ARXjwj8xkzfQwWSQF4VzEhMtbp7xLbTspnnlojb8T3SnRI08q9Y5G5CgDCVVMR/kbE/MaVFfrcJOFoBNVxBvZiij6VJE4GYxkiMNGswT4D+pFNmwXBnaf90ZhSaHczanoefXisZDswMFkkYazH/dSRsm5O+PHZMewaLlVlSnmN8TTTgtQZGuRM38x+OqVX223Z4m4MhhG0Ucd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AP3Fwv4cWsL0IwPUGX50cokhJfhMe6FW0xT4V2yLgCY=;
 b=kRM5ZRjx+S9c2/eK+1B7A4+HJtT0oY2/d47bVax43BGv1iUmml7pbnVRyzpso7KHlP5UlGawW2gicNKV2nI0/u902VOq03XD0PhX4PNJnjDTDUifXl/tbzjwj0f8OwNGBcuKo4VvZEBrLHUkP6UVL2VA+GkgBiYxWCdo0G/Ww6o=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4536.namprd10.prod.outlook.com (2603:10b6:510:40::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Fri, 30 May
 2025 04:53:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 04:53:08 +0000
Date: Fri, 30 May 2025 05:53:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add myself as reviewer of mm memory policy
Message-ID: <d27aa494-da91-4a40-8577-a982a74a1a0a@lucifer.local>
References: <20250530014917.2946940-1-apopple@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530014917.2946940-1-apopple@nvidia.com>
X-ClientProxiedBy: LO4P123CA0171.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 92983cbe-7015-44a2-fef9-08dd9f35df78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A24BIa031Ae22IIQ6IEK3H9xoLp5bl6iTlYdsoH6Q4NkBzvla7xeJteR58nZ?=
 =?us-ascii?Q?RzLWLL2WBEpzQ87NLVKisO0jKQUYwaCpB669LNxvi4VLU/89rJF4Yy3zGOTT?=
 =?us-ascii?Q?jBoDjrBBHT3QuAeDpqIihxXaaGHpS+uMwhAFYqPhPuLhI4QaVXZwjfUfZlxz?=
 =?us-ascii?Q?5k7IoPi6PMFCghlvW97mFUzVqp9VjCThVzJTIRdEfQfa4e/G+t1KB3sxJjuD?=
 =?us-ascii?Q?lg3i+07JZdLEMlupmRHCDFaLaBeb1wvtBvK8HOeuELGbBul6/FQuC3XRLcnl?=
 =?us-ascii?Q?tMo2MmkifLZrYJfKDnU7Haun51gCHPHOMmKU9JoIVDzbtzngGKIRMIMCA8MS?=
 =?us-ascii?Q?B3arTJ5dwukdti2sFvDVYD6j0ck4OkCI1AsIWsVrk9mBL8RvhoH24zpWUYZ5?=
 =?us-ascii?Q?PDn8brDkw4MjL2TJzFEqr4N7pIva5/lEbjAYzGNL1WBYzQ8QROTuapB83Ub1?=
 =?us-ascii?Q?EXwEDvH+dKqmq6ZgTR4OWCJbX9nfQo+vBHJwd/FGO9z43HkJyDoXTNZ7a3jY?=
 =?us-ascii?Q?Yl8Uoa/LAb9AB+7q72HMMWuDK/Ub4sqZHxwNJBF88Rke2A9SuTxKiGb2nqTb?=
 =?us-ascii?Q?sjimfPYph2dON6YQy7sUqDdO6sECEzqzwfDol14S/yffb2aArX14hNBcgq3i?=
 =?us-ascii?Q?McE/ZNOhWr7GDUGdsxyxWfSxNd9/e6KjUTJgWKrqZAo7/ozh7y7JwBmdKB3V?=
 =?us-ascii?Q?yZEjRsjp6grOob/6DxP2u+iy9H5ZybiNg8e8HlvyHjGD2AI3wTvLEJewX5cU?=
 =?us-ascii?Q?rKwtJTR/Qs+c1w+kvEsutN0Tus+gAxmNPH6pqSonriKZh/N1PL0aNyc4BKjc?=
 =?us-ascii?Q?aWWaETjcQTEar74QBC6w9dVWuG+iRduy8eaQNCxFZQ5XTUeXf1Tud7eOCD10?=
 =?us-ascii?Q?gXuSxdZ+cIDBMhBoWtZE+ed/B9jVcweWrDEToLsx6SiJ7ba1X8tj5VBmYp2u?=
 =?us-ascii?Q?nNKCr1VO7tE4vVT18F/6wd3wGH9vcCVOHYQ/7k421/EE4Erkw6MUpTqcqC8F?=
 =?us-ascii?Q?HSnR/LrGi2s7q4yr3x61e/qvE32FiqqtzETYikzFmQpFYWveKh3wgNsSiWJD?=
 =?us-ascii?Q?8jrhoJppCAgMUpCR/uia5KTWhO0mIo3NaEYz7RfUPJSNRgGoaQy3wpRmqaZn?=
 =?us-ascii?Q?U2/9G7clWQdnyz/JTlVNz5hciglVDia9LkGDkmb/ABQjmV6UaY7pMRdJRWA5?=
 =?us-ascii?Q?Epa6ROWnGv6UtJ20glXgCE+PvZPF8uRcsv4JloTOCQcyDGnkKvc/ZGHeKBgO?=
 =?us-ascii?Q?uQgfwkBDk4bZ+tRh/wUuyV4zIW9Ho7Re6fcIZX2bFGtQKd0BurZv9RIB0CFX?=
 =?us-ascii?Q?Soe25wwBzoLFk6y17JE6JdCKL28Om1Qw9DjBTwggIvUKnVU530tns9O99aVl?=
 =?us-ascii?Q?v0MSKPQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pqUuqP7kxAR7Rbq2sWtkdKiMZbnTzz03G9cTr6oxXjyLS4h/ple+9nwP/7U0?=
 =?us-ascii?Q?PL1Rk4V1fb3nSCJfH9CPgQyFNfqg2YnSl4OyhivgPoTZKgqoNmDh86Jf7FO0?=
 =?us-ascii?Q?gZb2Qv4wRRMJYhPQ8xmCsTvyVcnKA1hEA40iAN5yHKqYehd2352n9NKFPM2N?=
 =?us-ascii?Q?Ckikn6kXUt0gZG6rbpNlHZTywjJXE2yTZqPtVSaeHCP6cMgrOiDT5DUpmAbE?=
 =?us-ascii?Q?1qtTWxiz7/uZdGYH1zM6ZuZ/goMHVMI/15SzJdfEd84s66l09D7KXcHh0jNt?=
 =?us-ascii?Q?UmdHV/0pPEn0u5os6TzUxOHNYIzgOiAIZeSHnzbxtP5fujyWN6Wo6ktt3s/g?=
 =?us-ascii?Q?ddu1gK265thJdJ4n9NbghDaNbaqfZqddn8qf9n1cnWmWioKAtRVVe0KMpFxD?=
 =?us-ascii?Q?E0ME9m0OdoAVro1eYm8ggQ3JSZynuuM2VJ93PyLwPCDK6yv9U7gZxWinCB6p?=
 =?us-ascii?Q?gmQqXVc9cNMM8+ASCZ+NgAQY+G7A3zT3dJb0Zps5FdyxBUhgUr3bmLG0fufd?=
 =?us-ascii?Q?+ln3FfAvRb6fSChq6SommHG5kOvAxnUXo3qKgixNpDphfW+4RmrV4w0tA5wq?=
 =?us-ascii?Q?q7u/D+kCGZ5xJV3qHvCgfuO3dcLbQ9atgdClPDJA1ZfeUDa7OdScXj+pOHoN?=
 =?us-ascii?Q?lGvRsjRQDrGd3o40BfxDk5pIfERd5H0C+rbwLQB+9f9gXiyWIcbtd2CZEYOh?=
 =?us-ascii?Q?hCQbxGjl8JPfdzYhi6fQJzecXIh51A0uoWHrE1OHznzqQAmLP+SzohMQPg0S?=
 =?us-ascii?Q?oyQh2uj2F5bdIa5RtDGQXKAfjAWNIM1DxSMPr6TgUNO/yNBRqFN4J5VOhsAb?=
 =?us-ascii?Q?+9F00x3iv+/EE5NtC8NcPwUj9izKyaGoBNKlrMXphat9v41NV9+kzVn5zskO?=
 =?us-ascii?Q?mCWM4l7Mx8pLi1ht0v1gzfPa3K6hZZKsFtFr27lo7vznNBQlceyRDM81jjB1?=
 =?us-ascii?Q?sB7gh5FnPIGZ7l1CDw0cD7oPZrzmkEilBTHMXhm6YRMG9N8kGgICwfCuYNkB?=
 =?us-ascii?Q?fnGYyrkR5125MijVM15qGJ1K4VMhlfdDScJKG6uOPK5SjP5zups3RkExTt7F?=
 =?us-ascii?Q?0291V90KJ7vN+BvvvmgCxfbVceMpCA3WUlYRPtrZ8PTdI7rJUnkxgiapEBs8?=
 =?us-ascii?Q?9YHmdd05kbxzUnmp8yKsHChLOWnD0r++ZULWQr/em5fiQAVqzbVG4oUpI2uP?=
 =?us-ascii?Q?RdooMy3QJb88ssLoVHCL3LGmRAW2a3KRs5uCOgYmNnzwIhHvSfGWZXaSuVfx?=
 =?us-ascii?Q?rrBtxyM/Hchi3tTsepAdwlBK9Zua1l4urBM6Sg1kdvSNlQj11ZIFNZXaPare?=
 =?us-ascii?Q?c+hd8UrciJePTDL1U66lvwm1tVkL86Ks+PTurJ8wodY1DQVrqfMmx6C54biv?=
 =?us-ascii?Q?IGAXngS7oAooXTxjz3rGMY47OMMmyQYl2HqkGAfgQPfG3IOr9FAHEHEpjZt9?=
 =?us-ascii?Q?ParGzaYS7NqUpCVWU9dIHFgIci0MTSt/oqma3z8yf6aC7ucxMUKJc95YzlbC?=
 =?us-ascii?Q?Oz0t75a+k4OFg0xzHO0CDLzNYZZFOAcHQ1X5FC1VGMhf3E2sZBns76rtYgEQ?=
 =?us-ascii?Q?SFdtZzy5zyROmqKL4KOCJArF8WORSeJ6NkoC1zS0/HrSR0kvnzdXJSEPO/SY?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/YRLH6UyWmvtPOSxZMEjLt9dnlkgFQd1P/0aiZR/6Dwgy+RDND3qT2KG8oEUTPXUbwGa+EEuUGQFT+/K0/0Muw24vMYdb4+g8MwsOfnJ1DieGbYaYzRG4TNhhmpyB+h0v7FUGQxU88peaGNTOrGjFuUADeYMKYJfUX6tFCSXvwvD1/EkNLCrJNQRkXqNGkDrRqBA3tPykNnwQPzQon0aCzWAW1rJST/fr6bVxu8Km5HYfqUzRbP5h7nyOJ4xTp9B5keP4Z5sBu8ezUEh8svbRvMeLRJ/Aax4Zrl3Ny9A+9E8hLY8fWdnfkP1PykAUJ8fYIG++j0vZCTfCzkE3RsIcFSB9m+uTrmWwY0h5ASI33MkOSnA4z9cgdiJthCVF2O3HWBicv6XxMFvG1X1fCJ7Khhy1Y16AVC1nCfXib1cPoB46M2GTxh1vWeC9+fupL/9YZERBsHCUE3ou7FWBC2A5ZvsFV7Swxu8nPCgNtVfpBY7EXJjp1WlPaqXYvu5vDYbbJxXRmEtp4nQ4wJH3s5lvA9YbGeoSrtIZVe1gtEXmOUingH7rRCLF1wRra4TyX2ojVge6SFZ/5zKEWkdPdz0SjVcj9IfQbQ3JUQzgiAK/vk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92983cbe-7015-44a2-fef9-08dd9f35df78
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 04:53:08.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIaWJqw99n0x1aQsSAjdh0/mwCjMV5WWhRc3J1EMk0/ooMddffhBUzw2kXxK+gOJ8aPnVFTnMNZ/AFFdICs2UDEpKMFrSpBFCdY+llG1WqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4536
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300039
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzOSBTYWx0ZWRfX/fG+zQxzi19N OcLdWcEbOgz1jNFc7F4CwBH1zgUPS5VMbix80J8bo4pt1eX18dt+I51tw3/hCGNJJZJ1i67jTcS ybmW38xYGygxhu+aihTdeWEEk26MhhDb7xEsUXYL8VjUPG6dDNAT7wwOCtE2CeKwTw06TLWYIfb
 qBLGLLFB5j3PMd/v+E9vM1AcnBkHOJI7YXQGk6bNKkZi7dEBV6996qhCOOYBh5BGJzd3i6Z73kr 8ybvv/1Jzk5HWczkjfO+pw88ORJFfI81LFBlNqvuL4lgQlHZODNQ/QVj1nEboAqn6GiWfdi48rA 4rVG3fbFmee6pCk/yzVrHXHchaheF/JITNnNcUFYqSAf8/MHBTY24VbYk4bDFVQtTBNOhwJ54Tp
 heiyj86oFwSh7Ljr9U45QNiponlC1YRCXpl/HvfMmRQV4JkdeR5oGGJ3URYh7j76qTOolqnH
X-Proofpoint-GUID: w0cznOuR6_UDAeVekgZfp3CQHmunnTfk
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=683939ce b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=Ikd4Dj_1AAAA:8 a=yPCof4ZbAAAA:8 a=ph6IYJdgAAAA:8 a=tHa68p0SAAAA:8 a=SRrdq9N9AAAA:8 a=37rDS-QxAAAA:8 a=-xK20Md1j4yPEyZ2CcUA:9
 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 a=ty6LBwuTSqq6QlXLCppH:22 a=ufIsyHvWW7FwcMbVRpPq:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: w0cznOuR6_UDAeVekgZfp3CQHmunnTfk

On Fri, May 30, 2025 at 11:49:17AM +1000, Alistair Popple wrote:
> I'm particularly familiar with mm/migrate.c and especially
> mm/migrate_device.c so add myself to MAINTAINERS.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8f1125f68da..219f887f810e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15713,6 +15713,7 @@ R:	Rakie Kim <rakie.kim@sk.com>
>  R:	Byungchul Park <byungchul@sk.com>
>  R:	Gregory Price <gourry@gourry.net>
>  R:	Ying Huang <ying.huang@linux.alibaba.com>
> +R:	Alistair Popple <apopple@nvidia.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
> --
> 2.47.2
>
