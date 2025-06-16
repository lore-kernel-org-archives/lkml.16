Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154B5136349
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106354; cv=fail; b=RKlcPI7QNXMwYMVxQEDMox2PRaw3xy4CgBm6Y/WsMd4/K7qJdkiNzlF5lw3SqfYNWjqWPp3X5brZbKsXfICyEvKekUdtPEvo0iwPT8bddHFCouZ7QuRSkqOm0m8JYcDZG3zkZLBtNQBCoDBTHUTb7D4xGI4SErXHGIG4NAv3tKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106354; c=relaxed/simple;
	bh=gLEuQuWUDOdZkwMvuXHAa0sYh5SDdWLlNqgTs4ddUng=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Iv8Y6upA0cObXZalWOq4FxuM4fwZntJyg3D9ZD9VVLZ6MLWRIxc2gdOy+tHvDzjR6zBMM55T0p/sqhptWzUaeAEn+xjx88A4WpkrOVUsLghjCIDTkpOmYaTCz4w3KcBHwRSb2LuDgh4gMK02S1/8YUt4ULLSduJIvXk4RQQk4UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GT7qfruj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VwDKfkJG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GT7qfruj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VwDKfkJG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuVRa006533;
	Mon, 16 Jun 2025 20:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=uTJahHfIPk0lu7tY
	cdFir2CXXw5S7pI1yEl24GvZJPc=; b=GT7qfruj3gAvQyK+EOH4Mr8TZneTgbFY
	3cjwR6NtpCWQWNkHe45Xqb/DT1iyGfdW9udNqNiHoO/nkwVS4O+2yTM4Uqgsy/Ft
	Y3ugbJIfaOCNDV1ZXZvlDV8CXUGO6zOSNO6QYmEkIoMqczLWTwVqIrZZ+/NlJLnh
	3Fx4LgNV1l+77K1JTfzsEt1VXRajK+TDfh8EQ2CEFFfaZ0JsVRvlEKXOGf3MnpUp
	OmSb7hksOQFNaNFoL3NeCNKeqyD4ujmAr+ppsJjVkWVhV4Cksmv/gJ2xJA7j+UtO
	I9NuqohkLx4AzzfrVfup4EkQY5pwTFQcfjrUEX1T4DbJwL9fanV7yw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900euwav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:38:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GJCT00032130;
	Mon, 16 Jun 2025 20:38:58 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011033.outbound.protection.outlook.com [40.93.199.33])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8dm61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:38:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oN3kSrXaEOEfCqQOJne7S2kPeuMYo4utNT87JiAAxWEh9ntJoKqDOYA3cTBv+FxYVYQZZKgk8zgupfi6pqWsiCMdid2qMFXzpFAGcZ5ulfE3wmTdtytHgq+jsFM7OfTEMlfKZbxufMJRymMd1StAReM9x2GmE5I6eeH+Hc/ITaU2L4qHMmcA17QvDhAXCQWX9kV/7KGZ6p2pTu8DG+tSBxGoSTs8x6m//hCmguMQN1imK5mKkToh+IYhnS+gI0I9YMvMq9xbodWwS+nyZ845Cu1OhXQHR3Q/7gIx4ZQ9MelfOMnofaNIkEOkZGm/Y7fANKupjlFDtyHAW7wmsCarEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTJahHfIPk0lu7tYcdFir2CXXw5S7pI1yEl24GvZJPc=;
 b=Pxm+cKRyrrSmgc8IYF5wZHvtZ2UNJ53fwWEEY4YMQzoA2hjQU4V8JImYiMCLak8dtl7DfBFu44wWSflzwntjQXl8sxBbGBxPzImKeN4Fb9ESqJGuqQVH3SmFGdh3xr/itcYAAz4u49RYQHFc4csVxDAqbiqJu0EtnfBaU8OCQ+OVB9bSZoH4MnOP9I1q8YJocGF5LJrpXbf2g+QoQrGKaPkZ32OQb42QQMtsHoXVg8+17VEuMjQrAR5cj/DXafA8D4yHemGKQOqV56yGRkGwnVX6v0HBZRngGqdObpZUf/TYstcX7SzUzFfnEC3wb78mrMUWbwKLXeneWEc0B25GQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTJahHfIPk0lu7tYcdFir2CXXw5S7pI1yEl24GvZJPc=;
 b=VwDKfkJG3wTG7F291GfMhWobZbpxeQZx/itAPYZshWg0mzY3iUpIdoQkKSmmq8G6GJ3yX2egTaXKHSPhZoOgf6ASqh0Ve+DXoXaFUaMoRQ/IMyaD5Ldx/SerLlgT5UD6osTQd6vxIrVAhqZrUytAeQnNJCWHazS1hy6CSZgZP1Y=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN0PR10MB6007.namprd10.prod.outlook.com (2603:10b6:208:3c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 20:38:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 20:38:55 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] MAINTAINERS: add further core files to mm core section
Date: Mon, 16 Jun 2025 21:38:44 +0100
Message-ID: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0318.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN0PR10MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a28da44-de29-495f-ce81-08ddad15d004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yDUPRFRr5yLq+kQ8Yx+y5GDn7/bLq+FMN2GRRFSitN/KVOV7fboCZlDdJFub?=
 =?us-ascii?Q?FK9WzvscFTnGBXbGXHn+lUB1nyzNyopqrDYwaRiqJhRv3kVh03Ky7HKJnWgg?=
 =?us-ascii?Q?dyFOkcPqgaAa8sR+FLO7oqkPCm82aDo7WSPctB00VjkvQ5NDEgKh9TSYIqTL?=
 =?us-ascii?Q?rQhYCvQ1GfYEpfp2ZEuim1+J10oU3ZVHje4Va3n+0V2V1M2Xpqk2C4b4wc++?=
 =?us-ascii?Q?RNQe5L8VRE9mpv1eFaZdB9pgYMdAr88fLYDComDB1pSNLmK33TZoRjRmBCTW?=
 =?us-ascii?Q?qWz6dHuMVXAJHIbFragsRSn230601hHZ/P9R+wXNnDF+NHB2jlnZqsPaDBK7?=
 =?us-ascii?Q?tCyYNhbcJnLlErwgtqUA3TTuLs+yeC6rdYHF3d8tksQQHE0xfEWRR9nruP64?=
 =?us-ascii?Q?QeIPzqpUuX1PPPs9Mg4Pg0XHLiJz3dzjKUPwevTetf0vxltMc9AUzkPYwfnr?=
 =?us-ascii?Q?rZGLu6pGz880LDDfClL6WjGnjyL7zzXmiWM+15SFHV52blK263u3f9j+OZcP?=
 =?us-ascii?Q?PD0WOI6i+g94vSAZOR+ZygWXIqIWlsz1UkQRm+WTYQtTOCr4k8geRQEXhXtb?=
 =?us-ascii?Q?Oepyin0xTgk85xIP5FHYmHL023lsfivuM81M7avrcirBWA6jCyEGbrxja6e/?=
 =?us-ascii?Q?wmP0sCUonDF4xAYeCa0r9G29kgkzIQeeUReE4posoo2Y6dIfoZJpiAa/6DNr?=
 =?us-ascii?Q?G6vLQpzndAxUJPRepgbU5yZVd0/iDFPJFcAeQkfoCWBY55Shqscly4t7hV0X?=
 =?us-ascii?Q?YUAO/ZsZt51hWXlNwH6T/8znDgdZMIUB+wMm7un3aj+5KrODYmZkxzaCan3O?=
 =?us-ascii?Q?b7DEEQ2KUD9fFHHIkemxqREHm8+WwgqO4qsGtnrJKKXHpeJfa2dpQ7s+PT/Y?=
 =?us-ascii?Q?mOxQXT5tA8AAaVHbiremteAzqTqY++a8n67MNLGxjFIbQSOdZqBimIKtlhfS?=
 =?us-ascii?Q?j1HpMvRqUUyMJhoHEFFyRh7ibWo7MiKpeHtBcylPtPnMKmlJRV5fiKqX+Tp4?=
 =?us-ascii?Q?UW5OV+7BLvLTxc1SrsjyI1G1TmzaOKGxe/ewK2PpbuLHyGP8iWTrMXee34C7?=
 =?us-ascii?Q?lRHcNpvX83WJAqtUwwlxMPqwbNSO3SSChEXhBoUAoERdzJW4ftBzq9dXUpjc?=
 =?us-ascii?Q?QJfFjB4y5yvErV1aBH/yz/upPTmZ85GYsGmSirToOpzkL77vz9X5bWySj72Z?=
 =?us-ascii?Q?oV6MUYxyeW/yA8Nw8HWOjIHPkppT69KvySw1l9T/Gi1ULAYJjLrlSX9xznvO?=
 =?us-ascii?Q?iXY0V/mTfGnw/bvc9FK/CQrgCtjqzdgxvoo5ka5XcJD5hAzg6PZUF8XkEiiF?=
 =?us-ascii?Q?YRKuQ4LpGI9uaq4/N/+kpCYpqv0Dbi74TcdF3OUi8d1+eub8voT/56TlrsBK?=
 =?us-ascii?Q?pSbu5Q0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Oj2L3M6G+lki0glZ+zzClLXj2O4xsJvR275lx1YEcd71YnnrWHHrC1hPsc2?=
 =?us-ascii?Q?1acsCCTElDBuvq2wga2E2JPb56Y3mZaB0flMCZmzBTySqYZsRYOvHdIzK/nY?=
 =?us-ascii?Q?XErKSicvrqMFvxd1JLnwEtUbaCgJUihcnyff4v7zVDVL8N+DL9v2iKeW91ij?=
 =?us-ascii?Q?tTxO4KcxJ4qfHx1gDkN/43teoP8oNDZew18BqBJ6i1KQ/qe1+Vyk/i/ZfYa1?=
 =?us-ascii?Q?iHDIWATuZOZ7DGP1fwIeWgcHHakKlXyVtIxz7/wxToNIYDyNttFGR/iIWHzq?=
 =?us-ascii?Q?wArMUEuN4MtFBwbEuZ/U4Tnf1vAZbtvrOAEDklzqoGi5jprI+k9n2AsTADvw?=
 =?us-ascii?Q?mtlsTpWOrku/xGcqDl48VGTe3IItcVjGNHqozN2MQdF/ZmKBARr5DWrnBOoD?=
 =?us-ascii?Q?BOW95UzgzI2Z3gn2SYFiKO856cVnEY7/Ts/TpvKUIgk6rf3ulWNS6/ZMylfe?=
 =?us-ascii?Q?siAIIjzT1zpMmZ+J27h6c/Y23BZLJ2GhBbDLKnPPDJV9J7fhtk8R2hkTdAEh?=
 =?us-ascii?Q?fDiCpe5OYaKyRckZp3PrK/7ZgpgMvhvhSgTz2RXiQ2wJHoImMMArGAs/Y76H?=
 =?us-ascii?Q?YsbBCXodxMGgMm1cz3Zi0xwRzL8qcvJMYsrV11ZBy5h1+dyf9i5pf5JLD1xc?=
 =?us-ascii?Q?W7kzPydvYapVh1+Y5BkJNpyTpthCydqh7uD40azuYQOHwlLXd61x0JCz9EdJ?=
 =?us-ascii?Q?kL/e5/zqYrWvdDV2fvZzfKdMRWefe1+phszGmGTp1oo6pop3+TfyKo78voTI?=
 =?us-ascii?Q?52TWUZuDY76S+NwdJQqeyF9k5oZZl5+Z/NxSrAhggtPSmSQRTWxYzIgtmkXt?=
 =?us-ascii?Q?uJhgfbSqDLIePqql+pa3xPqDgoUAPx8TS579WZOCEf+Hq4/xrJHZCZrt/un5?=
 =?us-ascii?Q?ta1ZuYSnIFaFdZZbS47R7WEGm08iEEni5zNghH1DTcMNrn9a5O2+B2RsndW+?=
 =?us-ascii?Q?tp6XBQLdABVmZRfIz4sVsDXKTfMPg3Lx0J2gsU4lMR++S6uGRJBHx2/1axPM?=
 =?us-ascii?Q?xCXmoFWGVUWzWLVSjgXI2ghAb4xkCmdn+QCvXGOqbMZjkmYnE9vM6e56cggn?=
 =?us-ascii?Q?/9/npaFE6GO+7fnYM3GCDa2aW/W56CrQUffnd3/pwPmsUqePxRvqzStHSxgB?=
 =?us-ascii?Q?byKOIxy6MJJFzMsOzHTc0CkkdJHhsLqyvRDOWZ7/7HRZbdmEgkoG41hwUU2I?=
 =?us-ascii?Q?NWcKEkwIxJHZejI2TO+X7wVbZLgvZbrz9+BZ0u6MpZ98PArzZDBytuP922sM?=
 =?us-ascii?Q?XKsPTj9XuIvOCNXyr33YE+dgpKgc/9eOWEV80MK3sa+RAj3d5OfzALGFVadD?=
 =?us-ascii?Q?H7toXC+nB7kDT0SX0Rd70BK65yqf2Cz1IeG3bz3fqoRzeOSmpa2OvlPe/SW+?=
 =?us-ascii?Q?xguZzp3F22bB/9BTqbbiB6y0Wk5yohKCCd026suyfdsImR2pdYbcYqu3RJ9C?=
 =?us-ascii?Q?W7YFbsoiOOThDfYHQzTyMT8oh6sZvpimaGR4ukp1rwA8mpnqnngmuBaC41oO?=
 =?us-ascii?Q?nPPiXkH1DSJgmNFGBrQ4ALS/jJAKWW+qvdpX65u+k4FN2IPvnaTxwSjIMu3c?=
 =?us-ascii?Q?vdrrzArlYa/HRoYOkybxcf507oLsiWDdIygPieogZCQWLZRiNL1RxjjKjPAX?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qy68ORukKn9PAkRxDyt5tZiwmeu2TVGThl4dWvLIXBrkWLNtNxHD5KOb8cw0P8KBSeX4ABevzSwtBoQiGXgDhU3iBf5Vsxcn1Bmfl1IOTTg9dxlcW2Bh+FV8zXncdhHLzI0yXQ3qYT8SW1BtA28YE1D6/Htv1cXVRM8LXiznBRYRCXhWe4sZzIYy7xN+IWlpulFUBrFE7EbIhlna+Ka1olzdRyp3hLejJm9J8WEF9gfczXvhaGE6KDeE+KYT0DYyR+Bhg3GpOwdf0C7DlAFfc/f+VTwfowsP9cDnuRgeVyiIIlQx838WoTG5tRDHxk2c3ZijVgLEuQy8ybty8YrWavUST9Rq78Ra+vr/eqwMqNZhP2qKaie8+WI6spDkY5qOvErh5TJQGCQWnGdo41TU2JrxTKY1pOn5251xZUG4PVbEZxEz90yBR6ZCcOgwYx2Vh0u5oDMnrU3FWg3kzBKESmxSjhkC14wzvBO35dc93Y35AVjedgTZ/cTjyOrJbo935F+UyUdVJCRn50E6EFHeHUGfjEkXxhucomX5axRqd/pj5HBnDlYRbVL3oxX4DY5AK42VGev3nlXejeXhjWuU7/ueG1Yf6B3R0AGlVcKwNsI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a28da44-de29-495f-ce81-08ddad15d004
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 20:38:55.3075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+ljjRbs+IvKhrS8yoezQkr7KGaJikNFOxAWpRQUYPPU166tQRzfepc4am9fvyxuKFBZ3EL3IX0t1SEJ2wm7jJ+fcGUIWvZAXWSbKcsxcLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160143
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE0MyBTYWx0ZWRfX8wxpBU+kDJyh ZBeEXrvQHKD91CoI1GBFvqtPJfq6S4j81PyWu/eTWXeyE0/B2yg8wc0MnKJMehFRTim4m9oPKeY NdEHWhU86S0J5OM0BpiGonAyP9ylXvu4qazDx+H426fYUNUy3rPxCPpn5oq7LRoXL31KqSumqbu
 94osNaaYNC9rTobyYHRdBuYxNERPqR84Zd8B6PMWefN4Rh5RFomKe8HEPna9FSN2iU2iPnKrKm4 R5xrc2gjrfkBiFFaqeb6mv6WUWNhSM/C7Ckqb4pXUl51G7XHELX/8OGhNSBXtUxEkX0NrUXaW83 tuFYBv1FJuqrrqtKwWDJQ/ZLko1yg6u6qjYm44KkrbDT9iDK5vCjG36qQd99bjemeBKkiPvHSj+
 onfPSBo7NlhspFfdRhPwVHWKu2+Itiud+bhX4UPSszsdH5TAqvfaM6y9e9o340eyKl2UoOWt
X-Proofpoint-ORIG-GUID: m5L9WW9hRcKW4RX0PaKM8yku2NgfNuMd
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=685080e2 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=Ku__rv-utw43wA9qYbkA:9 a=gK44uIRsrOYWoX5St5dO:22
X-Proofpoint-GUID: m5L9WW9hRcKW4RX0PaKM8yku2NgfNuMd

There are a number of files which don't quite belong anywhere else, so
place them in the core section. If we determine in future they belong
elsewhere we can update incrementally but it is preferable that we assign
each file to a section as best we can.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
REVIEWERS - let me know if these seem appropriate, I'm eyeballing
this. even if they are not quite best placed a 'best effort' is still
worthwhile so we establish a place to put all mm files, we can always
incrementally update these later.

 MAINTAINERS | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4523a6409186..a61d56bd7aa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
 F:	include/linux/memory-tiers.h
 F:	include/linux/mempolicy.h
 F:	include/linux/mempool.h
-F:	include/linux/memremap.h
-F:	include/linux/mmzone.h
-F:	include/linux/mmu_notifier.h
-F:	include/linux/pagewalk.h
 F:	include/trace/events/ksm.h
 F:	mm/
 F:	tools/mm/
@@ -15764,16 +15760,40 @@ S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	include/linux/memory.h
+F:	include/linux/memremap.h
 F:	include/linux/mm.h
 F:	include/linux/mm_*.h
 F:	include/linux/mmdebug.h
+F:	include/linux/mmu_notifier.h
+F:	include/linux/mmzone.h
 F:	include/linux/pagewalk.h
 F:	kernel/fork.c
 F:	mm/Kconfig
 F:	mm/debug.c
+F:	mm/debug_page_ref.c
+F:	mm/debug_vm_pgtable.c
+F:	mm/folio-compat.c
+F:	mm/highmem.c
 F:	mm/init-mm.c
+F:	mm/internal.h
+F:	mm/interval_tree.c
+F:	mm/io-mapping.c
+F:	mm/ioremap.c
+F:	mm/list_lru.c
+F:	mm/maccess.c
+F:	mm/mapping_dirty_helpers.c
 F:	mm/memory.c
+F:	mm/memremap.c
+F:	mm/mmu_notifier.c
+F:	mm/mmzone.c
+F:	mm/oom_kill.c
+F:	mm/page_idle.c
 F:	mm/pagewalk.c
+F:	mm/pgtable-generic.c
+F:	mm/process_vm_access.c
+F:	mm/ptdump.c
+F:	mm/sparse-vmemmap.c
+F:	mm/sparse.c
 F:	mm/util.c

 MEMORY MANAGEMENT - EXECMEM
--
2.49.0
