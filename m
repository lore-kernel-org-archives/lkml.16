Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56261E8323
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356481; cv=fail; b=ELVe3Wp92sgsXuRcGtq7L0hv6n6Ys6WNPnbgqemaHwBjd3tp8eqQFYATa+NDKN5reGvDWZWGq84BDtdZEGztx+GpqA+fBHRKWR1agF6a9D/qtODpmdHkxRy0qR1/Sb1dwC/b/StzUM3nHYz/4Hys7SDxkA0LZpJkB2ZlZfPrzso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356481; c=relaxed/simple;
	bh=xMt2geazUAwUpkp4jxWCPF2hz7XTu0ALWvimCtpDepg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=huuESp//dY+H4smyO3KYiF2/jmIiT4lzb53UkPZriY2zTidqu5oRc8/yuxYD13/X72XEFOP8ggOqou9m+S/uq98lSr489o9Ti+2L63rmlH1qe6DaEp4JhgLgpC9TNo+Vx6EkBiwRQ1yA47em790zeoCQh7b0S5nQuyyqXldiSh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K9cBqGSH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=chjvN+sk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K9cBqGSH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="chjvN+sk"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B7CH8U026855;
	Fri, 11 Apr 2025 07:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=tQXvNGiHn/FuSdWO
	6rQ+j0Rv+Dzd7SbKfXhZfPM5zAs=; b=K9cBqGSHPR3TZk9A6Mx4uekWpb8jkV/l
	iggkbQjdrqaehQpqOq7AnTvar9oqf/UrmmtCv3T0mQrtOHWeTYPloXUFWgMbVCAG
	lcS2gvqj5uSB0apvchCzZAmTcqUnB+xOBsXPUNkgvl5K5JHtNFQ6MkxxVD+gDOi+
	DqaVE81nKfMg4abRq5k3qzqDNzw1XodZS3RT1w/dYNrtlHnvLKcjolvYFJZWoNFO
	Xeub7AY2bVmlY3lJVryJyzvnhMfe5wsHwiPnyFhjWDNoQcYIlVJSPyRcsqIxVa3V
	YBSUMN+6WXT9w+hSe47Mdsvil4P/xFQ7fFD06H/lKnVtArU5gNY02w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45xxft81bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 07:27:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53B59ilj016123;
	Fri, 11 Apr 2025 07:27:47 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013062.outbound.protection.outlook.com [40.93.20.62])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttydaj3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 07:27:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLEvqZLunqRENaAZXe3RLRF4/buXNUdSppl9dm3X1becTo5aNrYh/sn8Z9Ph/Ar0X+/bHeJAzeEtfgBT3gbzZ84DajQZJUzXlEEnmSiG1w6E01Yepu//mgQZEaAH9KoYynSBF9YsmpuupSbPS6yVzPC0tHzYa2ZU3s1KTs+IsOkRRA4g7RQCsgxJUY/X8e73G7sgJn7hyhtz4Evay4ot4l4I3Dw88WTlSCVQDcGDbecz/PSPZveRoi4kB23YGF9wQRR+b60uS+HQh1URol6Or/7ygbAGeDwbJRZLzD9EQxWzR9DS5j0iQ7XAgA2KwT1WRbyiXoN4r8ExnUuy9mVGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQXvNGiHn/FuSdWO6rQ+j0Rv+Dzd7SbKfXhZfPM5zAs=;
 b=IwXfAEy7AmTpKv8F90DLogRfYh+F96zRbAkCXsh2CAOJytF4pvm/wJdJksXe63rZCSFL8PlCdddcUYU7FKJ5m8UXXaKWTCxp/x6N1AJnN9jn74YGrqVqgTZSFNnur/e2Hos1nh33N2sbbKEhc/tyq323aec25CPVpxu6kHnRk/1CPg/QaMbWtlzpyV0ilX9//YnbYVh8wUSAEniLEXkX+U661Lg2mnzeCDR4VJYvLS+vCx4UQpOxms/EK8TwVMnaXLATjRmJ5twpFnkznx7KTrURkHIcI8BTx3mCu2eU5vbT02/229jXlYDUjbCxMqmlpe752ZAjeY2JoP5d0xRjGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQXvNGiHn/FuSdWO6rQ+j0Rv+Dzd7SbKfXhZfPM5zAs=;
 b=chjvN+skB6dqiOF4BP/sJe0Nn1y649kgyWOPkXgtlKBV9RyuKCx54owAbwLTMuv0BhJOB1qNhIMAbylP5XHCq3bsh5IqjjsoaD4agZwdsoxjIUOuIugj4okwQld9SaEGglhaeya9a46AVrYArd27VgoP3Kc5r6k74nP9IGycOtM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5066.namprd10.prod.outlook.com (2603:10b6:610:c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 07:27:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8632.017; Fri, 11 Apr 2025
 07:27:44 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: add memory advice section
Date: Fri, 11 Apr 2025 08:27:24 +0100
Message-ID: <20250411072724.10841-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0308.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::32) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e1f67f-6c71-4d5e-3683-08dd78ca59c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UTCuPjMssi2MECHupfkGHxNguNOl9ExUahYxZAyM1wmOFJXShfWDU6iV1DKP?=
 =?us-ascii?Q?YuVBxitGwbmaC00o+sxLSGFpm2twSKk7Ha8UGZnm3v8KsKNdGUqQuSfc+tCa?=
 =?us-ascii?Q?hQyK8bf3icL2xFuBhQnoamA5CLa6n1YvpoEYgDcFw2NuqLZJ4OUBeXTyB/qa?=
 =?us-ascii?Q?0B03nbjO3WKRJFh19+p6PM5+N91JfTIrvPiNm9sNAjuAF/aA0OsUdISxrMfF?=
 =?us-ascii?Q?pWNfbv44HW+nV9eHA8wjQbkG75z/gdFW2ruMz3wDBoFzYDUYblzsqW5giJN7?=
 =?us-ascii?Q?Qk0Xa1PbJLHimjc23agsZ1q8t152Hvgerhc1Ef8Vtoy8i2wRFaWpBW/qvsp3?=
 =?us-ascii?Q?8eL8e37U47lfHg8XJ6KYwc0LMqhbODPhcsWj5Z2W3j3eufrVQRyoR4FaS2eD?=
 =?us-ascii?Q?oiIgO+6gJrosTdss3JNmMWrLGRuU4e+D4CCMHjnLqvgFA293yOEbwi2Vyll7?=
 =?us-ascii?Q?I1HHo0I9LJ0+Zib47THOtcwajxF4U2raHF4XGCBeUsyhyljNrLMMWasOUfxF?=
 =?us-ascii?Q?o632V0CayZZLV2h9XLb5oJNlutB7meKyCzbyROOf3auE0jmZhc1cd+YleCSu?=
 =?us-ascii?Q?PM07uMulz5ZMFeg945cg129GNtwBKlhdmpId9E4Hj/cxi5r92A+rOYTVvF3Q?=
 =?us-ascii?Q?ag31qeDDBKaUDgwE6QSZpfe7tsXR4YE9oUvcBei0TafPsH/WcHGP32YDG45/?=
 =?us-ascii?Q?D4c5NMOadFBPm3Mb29t/V8vqaKjJ9LcCat7G7MbPmusnHxYfS5gknqvXIOUN?=
 =?us-ascii?Q?F0w54M1smiIMAereSCUDioI+xiwZY7Ur4IZa3hBzV8N+s95jrHGdOuuFXqXD?=
 =?us-ascii?Q?G80CHKyKIRgbZwfyMXyRQWPzPjqF37mg5jKVDxF47bdiDu4peZOgcX/5qy9T?=
 =?us-ascii?Q?p3xaiWt0rErvbhOfcgwUDsGWf+BRRioDInPg7bkgdL9KG/+fuQbEXa+q72t8?=
 =?us-ascii?Q?RSMaqndnvgCuh5I/ucb1mZVFgT2qlspWjYBI9p0bJNUtnFo9joubn8WhKgr2?=
 =?us-ascii?Q?rUiYCOVllHS+OLdPrR9aXFWnLb3hMhVHKmfIYBBTVipenbdWY3NxckA+iUZW?=
 =?us-ascii?Q?2wbCa2JAgsBv1wd81rQKxNZePQ6cmYj7JY56LYjpj2bFSeoLPnLlyg0SiRdh?=
 =?us-ascii?Q?fpud6GZ/rJss3ur87H+3xwgL4/9fR7PZ7iZ/w6o+s9RhQ2li2bSTZJFzX6/4?=
 =?us-ascii?Q?dkjoAYYURYTG5qUBwZf7sLKVUcuSW1ReTCNOagIBfz1wgRCCXwcUZ0I5mGu7?=
 =?us-ascii?Q?cQ+b0xlt06VQk9Rp3jJYvr5+PxGhMunFF6/iazy13lgqND9J5Ocnxu7D0f9g?=
 =?us-ascii?Q?TUyfeU3zuPlD4zcyvGv0Eump6bLHH8/DrVrFkMnGCoB2gf3Y4g4R+UmgRGtQ?=
 =?us-ascii?Q?PKTMnj6//EHOEUpNf/c0cTFVIgsz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wBsBMkbNd4bphDlzXa4gPcIWhoV3U/Wb/p9M2VFeGOEid/aaCg3bbopYA0qR?=
 =?us-ascii?Q?2GIWz4UadWlFv/1hp6/Ikf0Q1NypGVymP6z/Gin0KBkSXHcYZcfiiSX2FUAn?=
 =?us-ascii?Q?b5pun3NLRUcNcZB1mSe/5WSbpFxpJbGrr/6U1iINMjofadqWk7H9HsNDYPWU?=
 =?us-ascii?Q?BR1Epcx6iaCUeCu2s5hkOqtInqZ9dXeQF+xZTOyq3PRmq8G3rBfO43L9ue6S?=
 =?us-ascii?Q?acFfkD4WW46X+PaXt5QRi6TqbIhcGmvBFR6kERlc7oFKtm8xFANnpd9NomyO?=
 =?us-ascii?Q?oOEjZUSKh6nhCrLQyvGCu6ABzPzcj5dvSiYEDpYDjKX1ImczleFoIqzmwRJH?=
 =?us-ascii?Q?HKZQG2pPhltfItq5Hl50cShdSTmbnQJNihU+Qd670BAK4DO9wRTG55P2/CV8?=
 =?us-ascii?Q?pSkVCapjHUHOFj1rEIlwqcPzpGaCNpoLHTlXKPwcEAJBKTd1+vGW9WHqvYpi?=
 =?us-ascii?Q?SRPR29T0rCAHq2/xiI4zk3mamtlTY88nSPUPq7nqsR0dmxPdIGzVTQBKYqvK?=
 =?us-ascii?Q?1LtQa7/ditVcgAlOAzXUyDUrq296ZXCCYzUKXKQtrbKFKCj3QC+4xqjuL0sr?=
 =?us-ascii?Q?MWTnTSk/9VD70ssvfLxnkwfSktqkIm4+awpJJ0cF5lkvSqwq1uy93FwkCvw0?=
 =?us-ascii?Q?VOUoRjS46NaNuMSZMB9jIABktgqgvJv+UvB4eSbHcXDPp9PNRbrTcJxUJNhu?=
 =?us-ascii?Q?amOexiduHKAT8I+VXDOOH1vR/nBB0VWcZDdo9n1s3LcutuKwnqph8/kfzSey?=
 =?us-ascii?Q?/5+uZ4k8HugCHsGNlKZz4B0XROvmCn+iYP6GRf74wWLz+ZHUCRatYv4vrYUY?=
 =?us-ascii?Q?R8/TpU3zwTuHTRN6K8PoOrjfOnrBSVR2BUPKSTXPbJWQkmyC9S/D5UtRvj66?=
 =?us-ascii?Q?ihuy8l9i1IEZzh+aeHQYTuA6CwBPIxVef4bbnw9pFJMNQcZ80NYRNRVFS4YD?=
 =?us-ascii?Q?km+2bVk9GCPRqzUl+G8J4QlW9jPwgygYYLOP5KxsFI5e4OeKlpc4Cl5YHbX+?=
 =?us-ascii?Q?dZEcGlGFy/wNYcIxdmGEhzBPWurtT8ICwiu9Jp9nGCsr/faSfGdyF6Cl+Cj1?=
 =?us-ascii?Q?OEoZicdt2ybbniY2V1/EHohp/pn/1c4r/fZZbzoYGogJRinKCyj0473cluUz?=
 =?us-ascii?Q?SMpNhuRLPjz8zMtzKDUhWMNJ4fML93PRQRZTJGNXVso7UkL7eJr9QDPW//aF?=
 =?us-ascii?Q?fOr/837R2R85Y4KiASt1UP2Ii06HWKF9YOXpqBxEk6/ZUfNwrw1UOkXWp4Om?=
 =?us-ascii?Q?46/bIYlKnKuSpufOlmDRxa13nHtOhlP8UM8CeIVTV/qkO5LqaIRLLz9TuMrU?=
 =?us-ascii?Q?dq1aCe16GDko65XiHUp2y/naluipbQmlZ4v5YX41H34FJXlIa4TK1ow3If6D?=
 =?us-ascii?Q?3GkWzfLcY8P6r/zN3ak7JgvkzJ2/asmp48T5FCSYDO95mj6ha2444woXZLUZ?=
 =?us-ascii?Q?jYqeOVGoQxkOS5Rckx812pjE+x6CB9fA02GqGNjlX6vdDwmcF6YcGHhQ/4Cy?=
 =?us-ascii?Q?F/gYZ0W9KK2b2URbSirdxEdkzG6qC+GvMq5nDGwHeLdCJb9C+q4A9masaifr?=
 =?us-ascii?Q?uEeWugSOSn8a6Kx678guDf0EO9YZMDQWCXkV6X1hMnHtiwPT+l9srEmmFdK8?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iB6sgZ3iH99sCHov4WRnHpvpkuZ96RZQNCvZCqdOgFk9aQU1VpchPRAQMyqi6wW9fiNbs5Oo7K4eDdJvB4wzOpnGFf69FuOUcKw0u1exz6ezIh8m7y13o4TkD1+H6ayn5JZ16/VzHLFi3eW+j/WdoCD2+vj4VYat9r1kKj2SKqHTFmwALXHNZgkhT88mICN5U/ipJrnTe9f7pmWJGFasVj5tfr1dzb1epqobJ9sKFccXS9UeHFQ2+T48Bpte2s4BPU/isupWSmAwvyI6iH3x1DatfpqCEbuzTuAzTzEuRUkPp1cThB5iQqiZrShBcnVaE7vhS4PmuprclD3OZ/1Ld4GQ142Eb4KkMdfmgBWWH01OBchCv1xM5luM+04XHS4/3wBVO+kQlPRL72yi3WOa0y85fDtyz/RpZF/UUKdV6Hc0MVBCmHjYS23dpOIAucX+V0Ik6SO/Rax0Vk6zljRGfryvYynB5yhG9F6QEz5VGMJi1QtyhiWExXC9YkSzWA24bKLyGZ+jIZ781Oewx5X7BEyhBBUsS1GpSWFeATxkGu8b8ctMbxvfXsUCZYXkWKM3jKmLc/E46CFGPM7H3Z3sx9geEHff6BssiYXHBObN1+Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e1f67f-6c71-4d5e-3683-08dd78ca59c2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:27:44.2503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoaUS8f+WysEPOM5uWthOE12w8OYYPsmbfMB/C6FJA1ZBKr+5KrGyBrqkdewWdtVL3QUQA+LRu3x8RDksvwqOVP+Qy+s2vwuybcOnRuAEY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5066
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504110049
X-Proofpoint-ORIG-GUID: rkXP7IsEZGgVMErgKrNNwX12z8KUm1IG
X-Proofpoint-GUID: rkXP7IsEZGgVMErgKrNNwX12z8KUm1IG

The madvise code straddles both VMA and page table manipulation. As a
result, separate it out into its own section and add maintainers/reviewers
as appropriate.

We additionally include the mman-common.h file as this contains the shared
madvise flags and it is important we maintain this alongside madvise.c.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: Jann Horn <jannh@google.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
v2:
* Fix conflict
* Add missing L: line as per Jann
* Rename to MADVISE (MEMOROY ADVICE) as per Andrew
* Add tags (thanks!)

v1:
https://lore.kernel.org/all/20250408161105.156350-1-lorenzo.stoakes@oracle.com/

 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e60c97c1ca9a..b59dbdfa1efc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15567,6 +15567,20 @@ F:	mm/vma_internal.h
 F:	tools/testing/selftests/mm/merge.c
 F:	tools/testing/vma/

+MEMORY MAPPING - MADVISE (MEMORY ADVICE)
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	Liam R. Howlett <Liam.Howlett@oracle.com>
+M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+M:	David Hildenbrand <david@redhat.com>
+R:	Vlastimil Babka <vbabka@suse.cz>
+R:	Jann Horn <jannh@google.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/uapi/asm-generic/mman-common.h
+F:	mm/madvise.c
+
 MEMORY TECHNOLOGY DEVICES (MTD)
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Richard Weinberger <richard@nod.at>
--
2.49.0
