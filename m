Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B01B1C8601
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153134; cv=fail; b=gUs8m/OLlrwB0Bni9TwtOlCRnE1gOB3pQ5jWRSRRvfD0kHuYDV3Jx+InNw2KS1oyQVc8IlUDKVsAIPKeb1co1JRP2RKtK2PwhoG4PCrBU+AutQ8z5sIeode/qK+EVK3A1uSjqeTZMLWP8600Kd58dY70os2nOTvSAzm5HLaV5d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153134; c=relaxed/simple;
	bh=ufLiRzKLvQQVc9w5fGK0tuVwZyqwb4dik1zAFZ2jbOU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rocIk74QyPgiUqKHu7HOETe2um+Yf7l5Q+y/7WT2l5jwZNUbmV+T9fwbePtxCN5CugTkgwVVtimBDfd32FFrUpggkc+cmFjhsGoOl7mA5QPfsDx5x7pS8gONtfp19tnwUf8D48VGRkHMmGiv2zKEo3kn1XpeeBRG5z7ypociYL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AXkth4KC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ER2pEDsZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AXkth4KC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ER2pEDsZ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHM1d026855;
	Tue, 13 May 2025 16:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=fVWWMo+nexoJ1/AL
	b1UPiXOzTPCZg4GYsU8BdJFdVsY=; b=AXkth4KCzb9Pmz7GA8EUXVFDjBsNRrAS
	fdFFXfQgqvFSdMKoUl9WE6C70tZWXzom93Xg6E5SkLTE0v+UQSby6gZo9+wWpVi6
	U9/7l7HyJ3qcZrJkeE7Kj64+0RJNejI49vl8gkj2Lj/4UZojmwBuIq4qsSnQK3ul
	CWaKbGGY8fKJOkGCYEhXtVnVuCkU6ktfN5lvtGTmYdQWdDfwIrSjeUwL3Pv4rUXx
	PyqJkMOCvdxgD31RhkFrd0y3CNlIVCVMuduYJeNqRNXeSPgpc3FN5m7Iq1n2WvOK
	pDybCkP7Oqu7QINTb57Gng9itVVvyzF4vA+Ar/O58EztudiA/qpRcQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j13r56uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 16:18:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DGC6Gh004354;
	Tue, 13 May 2025 16:18:33 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011028.outbound.protection.outlook.com [40.93.6.28])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46m9d3r91v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 16:18:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceoR136zM3xRI7s61FurIJdswyzXGcqaUUMLvfN61mwc9F4dYzOJyReRf9fnasDS/i+NlGeBfG2M29eP7asR4GGl8Lxlhh/NL6eeQ0VTBIZpVZ3nFo/UC3K9wa3i3lQPZ/8bAREvvkSl5og19qqaSI+6S1F206lzjMdq2m79ZjSrUCp4LSQeKMfHWVXRFBurH2S3Jpch5lOKpum145Vb4GM2hBgQz6YbWBTKSBBZ/DyzyfUvvtOCS53i3chXR/T+GQ9fRPZVW5GYru7OKEwmxrfaQ8689rVBU/KiqECJTq5tWTE/hwJbPNx+45DtracSVfwCjztSRaDtdGUYR0p3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVWWMo+nexoJ1/ALb1UPiXOzTPCZg4GYsU8BdJFdVsY=;
 b=O0PIMV36IyncRz8s4THhLpAz28Oq6ZdiQXg4n1ao7kr4T5KTziDc9hnqH+ScLSkXV+NnvjeUQUTMQqxLeWToS66MNj6xGpeGVClposzObr5X4PXn8PB07k8NbMLYaUW3QYIqNaoAkvBPoiytaVnXTca2u4re8pDrXb/gQlyYor+qm7MoZxtMdpQQdVs8To0bFN+NmyeIX+OATB2Qya8+c3kP2WQ+H+5REjLVqD0qLJE50+xTTvpOAMznmR7MIdcQ7ehTJRFpUo9NSkOxs/FgsQzyxiZYLFUeUqGBj/fxsujABM5sTQiLUnwfB17A6qxC5EmXBJWdbKgHAYkTTjujog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVWWMo+nexoJ1/ALb1UPiXOzTPCZg4GYsU8BdJFdVsY=;
 b=ER2pEDsZG+C+d+B971Kl4NWQlZZ67itjUbryYJe/f92yKi03aiXIjfh6fg3RcyXsukEMmXZlKUCtZw/+5kduhB7BPCiVLMYBh2qmtFBdrIUXEqi6XpQG2+PaOX+yUEytUk+VGE6ruUMY9SDqsfD9j4h9yE08RLkB1FNmEdOvLl4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4566.namprd10.prod.outlook.com (2603:10b6:510:36::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 16:18:06 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Tue, 13 May 2025
 16:18:06 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, xu xin <xu.xin16@zte.com.cn>,
        Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH] MAINTAINERS: add mm ksm section
Date: Tue, 13 May 2025 17:17:58 +0100
Message-ID: <20250513161758.136402-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0237.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2f7236-a8bc-46a7-5c06-08dd9239be39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zfDTJOO/SWzCuGKyDyZ36vS6vOSKuKMHwzgS3q7u6iyOZA+W1DJdOk5aw9IS?=
 =?us-ascii?Q?K1hcR5mbfwunHFx++dpwykGBll9SNJ6fENnd6hs7ynvNZQYOx7Ph4XTL6Nmf?=
 =?us-ascii?Q?k/ICDcqe+JtCPv8CtNpI91VOumLNT6jIHZlLQt3fWyC1mzEUny2ZwMBZpdoz?=
 =?us-ascii?Q?8gxSJIHlXPSjqA+OTzOUXopzDwHrcWMhNGnzoQ7oGlQCdeYVERRm5zH4bmwj?=
 =?us-ascii?Q?suupixhWU7Vvv3eXk0U51PWiDtabIdagv5dCC5LNnOLP15P+89dilV3SRTRt?=
 =?us-ascii?Q?vQUKb5dV5LtGB3pwwmfAzQzSDirx/0sJug9IQsWNOXkiiZUfLYFBi/LjlaJK?=
 =?us-ascii?Q?TnaLh7rSWrI8oGWxnSeb34rFDczUQP6xvAArkKStFllQKDcaCVagsJvWov8O?=
 =?us-ascii?Q?ihrhD+a46RRzOg2IS5puuTYO7LUPMbpdrdTHjRhxj7eUu8ecEumJ0fHvwa4+?=
 =?us-ascii?Q?oF/L/7SLEjZ9uVcYxOC4OPVUKUZQ5hEJK78QSwBRUSd3syY37zFC9jvEbH6O?=
 =?us-ascii?Q?8LFj7viCiJhcy6WDl4EoZaL2VEjR4raxFdqm28efmTLAVfHzcacOzN0H9iB0?=
 =?us-ascii?Q?irReaRWLZE18hedEKB7rgjeWZbzst9Xz5O+kxlF8SKL8gddC1DsmiT4b4kWA?=
 =?us-ascii?Q?1o8+xJI2DeadgInwpkXhwmrMc8v+PxSHGnxHiirfHr+F2gF7/UMKHm5XJEaj?=
 =?us-ascii?Q?MX3VYYyGDxDfqeVnCnQlFrYqmObY+XlXvG8Rn2NhZNw+6H3/5ZofvFKP2m29?=
 =?us-ascii?Q?fAllrYZx36MiR41MOVfV1ENTbAA9NVljFy9Ga3rYGEivzmwnklTWexrx28yr?=
 =?us-ascii?Q?90mRxcdzGjkThsxFJatBn4aKidVzg9cOZdKrS76ganqVmCmSevq6oRQY3g7A?=
 =?us-ascii?Q?Tl7wV4gRzXYoGeK9J4qU0kN1XQl7IuIWd7QCf8sBI/z5svXy27ejQGZZ5lji?=
 =?us-ascii?Q?rUYvmNXC77Zp7RY5OusSWGVxllVIeKWfiuF/WpyPXYTbLxIu8+oF5TihI+CQ?=
 =?us-ascii?Q?bh39vXUkWQ/7w8W08lirxEY4NuyY7CvXbwhZSR1tuaEtNDMdvQWCSS81/u/4?=
 =?us-ascii?Q?XLKu1OZ1+sQA8ghnjYLjNF384NE60n2PiAt2egt+39Pa3RlJA36z7On+/MOj?=
 =?us-ascii?Q?Cy6kSoGruuFx60LYx1zYJRxur6XfXgNhu54NdTuaO4u+kUIC//91itIzhneQ?=
 =?us-ascii?Q?9Iac51Nfd1VicKgO/TunR+0sAenyDaqv38bHVE1WqYdQ4uOwIc5wIUd6MZeY?=
 =?us-ascii?Q?LmOzIu2kfS3iE3HdETVBQWqX0B8ZBIT0DW3pxiyqGrCfBNdNthx/fEPByrOO?=
 =?us-ascii?Q?01TLjKPoYylOdUxzAhuN6e+UziJpGboZp/l8dK9SFlkZZTruMPOEJFuPG/Ig?=
 =?us-ascii?Q?aRb+J+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zBdHrAN/XxPv6S/Q39WfM4m1bFDxFGWOe7PzVQBbLLOdRh3IsgLyE6YAlJNT?=
 =?us-ascii?Q?bjlIIIjgEggO1Qzr8U+fgd8C7Tt5bG/UPRxXbx8gcdGJPv+pI8b957/V8Cg5?=
 =?us-ascii?Q?JczNdv+HZPXSFkmma0vKxGCcqSapkUjty2hDW1G+kmgE+vASr4RzhCGutds5?=
 =?us-ascii?Q?aGsUz67UvmGRXOCB4gTFKMSssyy/7e9EzSRQQlPtjLdj4iyziCIufCLwN72n?=
 =?us-ascii?Q?MjsjM2Wik/tgkHwvftxVObNcccP0BUQ15gtqb5d3Nl2f0sS+EsmQNLFkelb9?=
 =?us-ascii?Q?6sBnyLQEL+zf0MOccsRDn+wbu3NeQJYojsyJSisTkGhIDV3P0joK66dNmh1X?=
 =?us-ascii?Q?ZkhnIMv8eJsd7l/JL8qbe7kSIwg4wqs4Rul1qlFy1qboKxLTRlx+NVXayVXC?=
 =?us-ascii?Q?8P1eAQWb0gfvCnuvSFUwB5moMR8RFI6RJg5rZWf2cjAjYcrQRu+AbKxqXtXY?=
 =?us-ascii?Q?WsW9t2ge4y94sw/aTMq0/R/JZEMSGYjg1QGJmXvSgqf6bzfLTNsB9pPehtpr?=
 =?us-ascii?Q?830RFnXnIxiTuZY4qeLhoJLtYo2GA50ttez3o36+mKMgQ/RgA1WstsxoupqZ?=
 =?us-ascii?Q?rqKOoKcx/QocBHnQn9yKFWLM+ZpL5KzEjJipShadJxCvyRPHiFX/SjCxbxYK?=
 =?us-ascii?Q?aIDc6yRv++hQyCBta3o7oPjTDlHwWt7NEmFGMb4vwOSu2sBXPf9PQ6tCzNSA?=
 =?us-ascii?Q?g2dEQqfxMAdRq6cLfdsdUACXu0T0r3RgamGeYnClgOVxqXnwPE2u485lQwkQ?=
 =?us-ascii?Q?KkewFCTae3IFpFx84yV/QndcV3rS39F8dKjTjMzlbI8bnaMMYEJQOj7QlUAd?=
 =?us-ascii?Q?x5fBkSLCxAo7HSu/NgoYvm1dd3SP8ZYCF5S0LYY2AvrWJzCPPH6liH6AxeNq?=
 =?us-ascii?Q?5IGtjL2XcLc3WSX1Yz/JelDlEw3DkmRA4Y2lQIz8og/0gQTq8Xr8cquzYxDP?=
 =?us-ascii?Q?kLLn9ac5iK424LIvM6Sq15y4gZNpnZuAG8VtZtdz2/XQmswS5vT8F2FVbJ+X?=
 =?us-ascii?Q?skflAPRR7mvdbh38MuDP6diDRlCHO1TmLZ1XaBz5bATt/OqrzDgM54rGnYTU?=
 =?us-ascii?Q?R9xG/osvZN0NYlVKOQvqdCpq/xftfjfc8SHyQlwR3t1qQdNDP1qFcKAFFE4b?=
 =?us-ascii?Q?+3Hmk5HiIHF7H3Tgmo72fUeVldEPJ2mRzT9NzsobTIberdyVAqmbPvTqhMzM?=
 =?us-ascii?Q?3RI0AwAGC/rDQEN4CJj2ibV/TmJxF93OUGMue5XRY77v5o/93IuqWAJCMVng?=
 =?us-ascii?Q?vbQ35yi7Ecy84CoMTdxIIxiWGiL6Nf9SzuIkEuKYplx0t9zmpOg0mLAEhoUH?=
 =?us-ascii?Q?0/7a+mSp5wWID0BKOOeXvxjjrzqjQqF2n+1wVMqOmYToZAiKS0vInSrrGua+?=
 =?us-ascii?Q?Z7vviYrKS+MeAW370OOQhbVIyYHf7MIcm1vXsmFICw13kLQkjr7sdlDpvoDY?=
 =?us-ascii?Q?GhrHMe5E2/umZbKvpKcEHZill138BH9ZfpOP67xl7q46Mcy5t6Dl13siMgol?=
 =?us-ascii?Q?UlB4rFTU5D0ExaKCIQvX3hGTdx5abg96Dh73BftvnvX47FhBe6Pk4l25GJbK?=
 =?us-ascii?Q?sULmwGNKNw4jhS8FHpfHWSYXuZQBgsmZ7S2lODkmibNzk+1eRs/6TVzSY5oc?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lDqRbAzfwj3rsSrHuqWJoM6K6UGsnPNkVvI/VuPoMC6j8UoweqlhRCDRA9UoQBwpdFiXtzVIhQXCT4x09Q09R8uA+NY4ehu6Px+4hni3OWjnBu/I/BtxhG56IExeLXPaLtZCi8GeI3wjaTtI3Yef1d4BPA5u4UrR6VLNWF1Mex954KBTHVWRL8pZz63xDuQSXiug+S2RS140zcDODPOGMGPu2qbS1QPDYRuox74k/Jclipcnrvh4CiB6xvJFt82aqab1vakJZgNXkpK27+kM6XJcnCTojHubdRkT9YVa7wsGIaD9cgzhAPrngE3peOqF9MZkexFk6FjUsH3jYOWVRpl/FNg82RcrSW9qB+q2Qps4223cDI7GrB4wUPyKpiGT4r9bPxQCi4JF9W/o10qxqQrvX9dBiUumbPcqqvC+2gbM0l11QH4FOw+9A0Lr+6Qr/wAKtG0SXEwAasgk94RmZDR2hyu7zxkRFUpVB5pLuiwf1sQyOVOCh4O8C3yN63tgBQBZmJo7RaRl5rpglqn+xO3zoWOqJbu262mszUDV8IQ3+SGLIK2sZ1/LZ0gTLdrgsPmEOXFpZCa7oMiZOWMX532dx0i8XL56DjZA9qqv17s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2f7236-a8bc-46a7-5c06-08dd9239be39
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:18:05.9488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eT7y1N1QzHoRCkDuvYb2RLIrGtpBhp7YaQ1ac0A2bGbZWThJLqVnnZwqcgEe2R3Gw3PbK3iEJaVxnqnKj07iMkixoc0WuPE98uWCoOG4Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4566
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130155
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE1NCBTYWx0ZWRfX93WM0U9+jt8n FKjtMHRUyWbRhSgR9LyVzIPcLMbvoAq1M8BUNd2w8Sz6iPaDEWHJfmNhelcrpKcCNgYXpTH8Xfu C91BwlUz4kld4dANZuLB7VFH0g7ygB5bBGCx0Mj0QQ3zIf3mTkhKtFjiCLVPf9vDxxix5Tm2q4x
 KKOls7sB2C/JCEMT61iacjiLSAOv2HvbTaowZKav+VS1uCPkYrFju6PChc/5NdmDi5UL1S4TEOS ruey2YLbHyYlDiuRiTsRrnuZ+55l21iG09p0XztUvSk4eKwTntkdVqqgh3d92e0GzyBfzWZXiFL waKi9fqBxihHyfK/ZOiYILSIks+erkmLVangqhQ0r2Vc84m3SkEJJwULZamvwhdwTGZcXAp8fox
 mGQPtADwTxtYkAnTuZ0pLmC9JmHiapEh000kQl/iU6woHnGgpybI05wgbLQZ/KawWq35VPL9
X-Proofpoint-GUID: OLp9uuZsCFH3-14MmyxkLpMLIVEuvTQi
X-Proofpoint-ORIG-GUID: OLp9uuZsCFH3-14MmyxkLpMLIVEuvTQi
X-Authority-Analysis: v=2.4 cv=M6hNKzws c=1 sm=1 tr=0 ts=682370db b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=1RTuLK3dAAAA:8 a=37rDS-QxAAAA:8 a=yEHFsg65M2jBh6DbBQgA:9 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=kRpfLKi8w9umh8uBmg1i:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13186

As part of the ongoing efforts to sub-divide memory management
maintainership and reviewership, establish a section for Kernel Samepage
Merging (KSM) and add appropriate maintainers and reviewers.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---

REVIEWERS NOTES:

I took a look through git blame, past commits, etc. and came up with what
seems to be a reasonable list of people here, if you don't feel you ought
to be here, or if you feel anybody is missing (including yourself!) let me
know :)

David has kindly already agreed to be co-maintainer for this section.

 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 80aa09f2e735..5ea2020acf84 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15567,6 +15567,21 @@ W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	mm/gup.c

+MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+R:	xu xin <xu.xin16@zte.com.cn>
+R:	Chengming Zhou <chengming.zhou@linux.dev>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	Documentation/admin-guide/mm/ksm.rst
+F:	Documentation/mm/ksm.rst
+F:	include/linux/ksm.h
+F:	include/trace/events/ksm.h
+F:	mm/ksm.c
+
 MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Mike Rapoport <rppt@kernel.org>
--
2.49.0
