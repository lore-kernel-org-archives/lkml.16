Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690F255F31
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364849; cv=fail; b=Rq3fkamD9/XFsz4sq3KcIZO132GxPip2uMhg3WvrXXcws3ySFV3gTRknoJtnZdrG49mWz1axXhZvbYW4eUDwyB/83B0p3k+PZNe1j1ciNJs5WhiHA8F6QmGNN1Iij/TJs0U7nxBueLnDtCIxSLlPRPkms2JMlT8+eWMBaivVuc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364849; c=relaxed/simple;
	bh=40PP3TWxOaVYdZ4RgzaVTyeu5IHS9Nrp4Sc6fMyX1tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TVd/HD7tbVMluuPnIFslZuE/paVi5P7rbKEbC2YY1y/m9ugeVGV0eqiOWud1fWJyRjDB2cbAFQEgBj+vga5iC8cmDCKcNg/gYizkH66lvQsOnwIcv17Pu+tSJwz59+49EZlgsNCwENBBMWS9TuHgIO99plUiKXDNFhOSEHysftQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FsO6aYTc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ETAzG9ZX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FsO6aYTc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ETAzG9ZX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIfgMt016807;
	Thu, 19 Jun 2025 20:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=H5TIg29Y81p/1tflp/ior2+vrAVBLjw9uGr9Dm5QyR4=; b=
	FsO6aYTc57tI9H/irBbgs4jKuTAAhKZ+JxE3qp6ZTmvV2seDW6xXkhdSgNQya24x
	dOTf0N+tB1FdQg2p/gmKVCxJKiJ/t1cL2decdkh+AkywcQAzkH5DTAFSf0/EUEjy
	0R6ae8ChpCaEToTdGfUVlbd0uEAxYXYkEBj+yww8vOJ1aEZNWlNPAnhd41wtfiG4
	XwrZ9lzVf6nATTlwuUikJIXYXPy1j8Dyd6bWH7hbtYzjk8ZFSzAofYCrNVkfRY8W
	h61ndLRUPVR2H3DyVxBwypYM7ycxHYU5ROFx5vrThpjI8A0PTbvjQf4gymnJCJ5Y
	oEdFsIKjRaoWW5/Lvf2w0A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xx21w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIOMaB022847;
	Thu, 19 Jun 2025 20:27:03 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhjg14q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTLn17yqaiC+dsjA4owNB4U4QOzsP8pRuIb04Fpnk487vwbJ9Hc6jp3pd+VXK6ond140cnfSk7UANmd1PocOfdXKFnpVEDNScd41yG/3pfFUh6qZyXs8l7bcmLNCcowRb3VDgyRsFGw1JjSiN8gl6zpCbI1AvXmZ3uH2TtYs0bIxfGzy+eSSEov2nS/DatNtLRnvPns4Ov3tMR+VHj1whVncQ6VORqDdM87QP/Q5HQdO91hGcca3d8MzA9Ru5E3YTsn9w3uI6elrXfViA12Q7qrJEdbpMtE5Tn2m5yRrCEufY3QWtSSzeZqlZTvkIEQRZueR6HJbRkmvcR5fx0Rrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5TIg29Y81p/1tflp/ior2+vrAVBLjw9uGr9Dm5QyR4=;
 b=apyiy2zsEAtWIkYrph5POFVeFzQi28ir5Uu9QB4Nx+mMfEBejKqthG4H3BXiPa/Ojgdg5N1uSUQJuli0OABU1ODHgw/P8dCELrQVzpIq+2EXx4cUrClnOxylm/Z0RJz3CFn13/9N5eNByYtO6Q3Nh/951A1tpOoioRDukjNqxKf+TbyWSXHkNhkqhw7Eju6oAcUPbmgY90GqSxj90QwETJYjFQ4GrNh2S6V4nrmQRIhj9W5yY5HF4ELJt6i9gciqWRq85oRIfnTv998B7EBNhCOomI/Hcc2s+8V2bW/4VTcJRn7YH7XOvOOV6NryWS6djbp/1KLQUpr0VGn7FLpxag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5TIg29Y81p/1tflp/ior2+vrAVBLjw9uGr9Dm5QyR4=;
 b=ETAzG9ZXWC8sjMnM4cLE3v/MTswFIug3sZWshl7CmdcEBe+fU7DbX6eU5MCPoC+ZrpJEdzQ9xfMPX4BTETEPxKkd9UuVwJDDA8RFtHX2MaH3Bote4bf0Ofqt/BiHjRXT0A7xka8XIQRA0jyJB1QrVlNFO1AE3RKouce4S7g3Yng=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5791.namprd10.prod.outlook.com (2603:10b6:303:14c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 19 Jun
 2025 20:27:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 20:27:00 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH 1/5] mm/madvise: remove the visitor pattern and thread anon_vma state
Date: Thu, 19 Jun 2025 21:26:26 +0100
Message-ID: <4239e727b98763856b86cbd9eeaa0ba792eb2394.1750363557.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d0dbb5-1495-4e2e-0795-08ddaf6fa54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PDP2dwGrOZTd7RhOHpomYUuiXHswJss5pPYhzD2oiQhXxFzeNeqNDhOQ6f9e?=
 =?us-ascii?Q?Nv5xgh9SiB4ImehMeIIs9t/1mvYhtyWBf1bdQFE04JU7lPJD2tnsovdQFGDh?=
 =?us-ascii?Q?kdjgLwrMwWq5CyVK45g/R6HYTreAUtfisBlpcZr71MV4HQXsQwHaRp3noZiv?=
 =?us-ascii?Q?U26GERrRJpV4wM2ocbAF6r230n2UL99kq9iAqcM3e/O/6BiH3NebOnao3CXx?=
 =?us-ascii?Q?b8qhmApT/la+q9DfSG3R0hNpI4cMtmVZVLhanl17TU3Zt/Sh9v49ssxixecU?=
 =?us-ascii?Q?WX1HfDtK4VjdZe6j9x1mVrsF5eEeDSflChyxmbi30uJdzg1GBrJVP7UEZOat?=
 =?us-ascii?Q?0XxCWqLnEmEYE39MaQrNc4V4vzyCEr1ihKzf5yYpaLJ2ssmToecraSmgrglw?=
 =?us-ascii?Q?FxfLHz44IunN98AVMzKt52V8G7XmlyWDcFmQDRsossVEvNkeNA4yrMX8Dfvt?=
 =?us-ascii?Q?tga9Marpwtm1E0CUzVq+dda2teTFcy+Fi6UN2uxXqq4H+Fkrgj9+/pqDpMWH?=
 =?us-ascii?Q?CTn5lP/8OGbN7a5KTJVYrLOzIVyFpXo923i5/noSPmEv9qwuMcyBp+j5QQQC?=
 =?us-ascii?Q?MHiP8XabuOZwvKSbgbZcDljb8EJwjENDUi+Y45fRKPgrn0SE6S95cdj/NG41?=
 =?us-ascii?Q?4/YpYRXlbyu9MqqwRZlVZjxBqk/uIc/hv33R7gm3YtRj9piuqw9gezt6Xqxq?=
 =?us-ascii?Q?qezxAniju0TqylURUrUOJ5/Rvee3cJw9v2KoggtavxYnocxNJUNHwHoOVL+D?=
 =?us-ascii?Q?14mQ0rx1Lq5Nx1Lzo0HNO7n8L5ZIk9S3woPVaT4gjvXVg+avUbEp3DSWwW+J?=
 =?us-ascii?Q?iK4XdvdYIYTa669jWl8gugM7sryweMDLSLTzaTvNX9uUsmP+XU9dkbHeSPU2?=
 =?us-ascii?Q?feXcbd3e9iOltEsjLppBmu8TOME7jegbAmIpv/Uhd4rT4+TduWufhnrJ3Pdj?=
 =?us-ascii?Q?9QIe0Rry5Rbi5RAwFCYsmL+MSxsR6OKu/YNjVjwR1dHezICnSR7AWMSpmorq?=
 =?us-ascii?Q?qj/Pw1cDQjEj4JzVj2yvYJZaSTT+ooe4WB6/GR6L7fX2A4+L1x9QUIA3roRE?=
 =?us-ascii?Q?+OcVThOTNrxjNkkeSe8K777FGQ5YPzQInY54ec4mF7iwwTeR0qihpQfjTHyY?=
 =?us-ascii?Q?4uPwTVLUHf26eRVog6uLbOfwdGlBiYu42kxyooC8Z9XUdKXI3PxoPIRmeuFx?=
 =?us-ascii?Q?GmUwV02Czi2Gg1uwOPaIHPbeFakT9Yfh3ERVoiwW/8wJljHcJDxdyfG3xEoL?=
 =?us-ascii?Q?ZENvWtMI/zyDQZxc+KAod7Te0zXTFnoOX46o5onPVBLPqNEyKplS2ur29W4D?=
 =?us-ascii?Q?Dz46732QnMKfqmr7MAd83E4Itm86d7q6pC80j0Cxhf9uKzb4kmNjQPqHp2BB?=
 =?us-ascii?Q?Awvu7A8jXnJ9RGTDb3ABiuHLHF16ZQoNcRDezOx8NfhEPhKh3j1m+0E+3okG?=
 =?us-ascii?Q?idi6KoSy7xk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f+FEJPuo8yIUCjkmnoAlU+S1m4y8MEUOptJUwE/SQcavQd463pLLKjvlJTjF?=
 =?us-ascii?Q?hxEwcWdpSYqf2AkZdf86uAiiH0zvBEAAEgivUVO6ms9pOIH6XyHjVpRAGSYu?=
 =?us-ascii?Q?kknk4QwnRTdd/KH4ESUSYa9HKM3lj2QbLRWrOtUS0CnHZWa3VsB7hklT05JM?=
 =?us-ascii?Q?OwNBmQeKaVc7sNqncRf4f00DzhNW50K6HDTriDh99E2Mp5+uKR2MIgYoZUtO?=
 =?us-ascii?Q?et9EcRo/ExDZJwdpmIwOfwKNSGB1Wv6rsBVrGGtaiJlKY2Thz1SdKng2DjVx?=
 =?us-ascii?Q?5SISzxtdp6DXbmLvZGQj7DLZdL5SbwNvCPSFS3A7Uiaj/XJ/tl2jd+1dmnqI?=
 =?us-ascii?Q?brIswJzcQ2MWOEhFXeYMvRR3G+Nf7wu/55W/1x3lJjxntYWACyIr8WRXC7pL?=
 =?us-ascii?Q?4w4WT5Ibuffjplf+1s/DzAIdmxzKYLx4Cy5ZTQXX38fCynU4tD8cO2yLLbWe?=
 =?us-ascii?Q?xz6ROh3FWGuI+BucbCWvLJEjFKR4jJOJ8ny89D1cFzZXX8VukbT3rNgD4rEC?=
 =?us-ascii?Q?Wj/e6GBoMQeQejh7XwioP0KqPMWuSzEaA3E58n/87I5doodhEO68PrkDN83V?=
 =?us-ascii?Q?sJHWfyha26RasWOX27cY1IhRUDp/WR/qL8mIRl5/v3Zcf8NY2tzBByPLVIxQ?=
 =?us-ascii?Q?ihCfFofUUIiSmkVVLfpELqSmXEVJ3LHuNJQ+aif3hfiS9z7Q+UvPCR1KGI+R?=
 =?us-ascii?Q?8EA6IPcjpJsw8oLIQmDC4+EFRvgWtDuuIh6o8BkgZG9KMJ7AMo7aSGOQolv0?=
 =?us-ascii?Q?UByB+Lyzinf/J6C6lswjnCMYCpdlATjM8D857hDUs1cIoq1SRn3ujOGeRLH5?=
 =?us-ascii?Q?8XdpS5iOLueGtp/AGfNJ2yWl0YQCmq6YiiZq+tZGYYd/pq6ky/2+CkIO0q2r?=
 =?us-ascii?Q?jbz0ILYrvdDR2lGVVncK/hwx2UAyzcy3eyhGq8LbTTKq5FlLdP+UbANYXQHF?=
 =?us-ascii?Q?FMGf2ut1YbmrZrFhb8jrnyY4kIYQXQTefIj0bdoAD1YMGq9x5FKIeoyuOIf8?=
 =?us-ascii?Q?UkAT82zwMzS0qGcbkQkoFg+dZ3XHZjQIEgtll4zskdzL18z5MEnbuQgBi8IE?=
 =?us-ascii?Q?d91raz5i53E0OL/+5cNVwBR4o+7lDWkcH7rM9/tdrX7QfkMcTnPt6uy24XFy?=
 =?us-ascii?Q?hDC4v7len60ja8twDTX5+o+4IDh0fZpzACycBIatIstE/u2ZGamvocGWkMkB?=
 =?us-ascii?Q?77RaMzZW+gqxJj51qk/tKHSgdkn8YXjfEcyoTyc5M8crdXheOWIG26Om+rGc?=
 =?us-ascii?Q?mEDa7XOfiVB9OwQJ+H68qJ9Pnf8i6yrtexembsnXwVrFMKvQale9TjI7hBGh?=
 =?us-ascii?Q?MTsrXh5rCjq80C6dD/0z6xT7YH1ov1munTAbVY6LwQqsu5DJXEMlXW9hEtoD?=
 =?us-ascii?Q?MZ0xHQi4mQ1UiVWUHwcFucc4FDoyHzCA/XPFE55qOb62JqdSMcRg/NOVhpHi?=
 =?us-ascii?Q?oghiujNa4qUrXqt0O/CP9lteTXkbMFQ1P5TPNjqJCblbrRJ/C11X4WJLUn8H?=
 =?us-ascii?Q?eEbGjTribZE9pGmwldBWhujeczhZ2cCtxtJpF1gexb9wYCv9Kgi+M3hdMAEB?=
 =?us-ascii?Q?iS6jrqZxglAgTNqbUTuwcOzQXsVXj3UXLoK9jJNMndXWxCZ8blRq2Zupvk8x?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qcONtQ8qiiAK0P0TzYBg2+0s0g2xb+ffyM2DXZ/inkd+gjcB6GJyDGVs8wMTdmsLlSb0bbOe2TLNGfrIg7kZE0+HeTqVWmlCN26c/+IRbsYtFwYGJi/0WWIiLr+SrQNcKFVlKAfJugOPDza6rrDeagN5YLVfuz9jcr+mYtjtZvs4++W/8AR97Jd8JNM/Y/0YWd5BbeIpUvabecPYe4weTZi/3/nBmZHCZVB+YRid7cLRWPKwbbM+tofV+6Ax4YsfvA6W+b9ouW46Od/ABzU2xxnjcZV2Wewcy6kNTF9xE0IyEAi4oUyhjGaInzJ5Uxi/npX6usAlKNeYMrGNqM/SH6wfnEbhj0xr0+K67xqN9MwFa36prYRLTBbICeS8feXYqwA3EFMGFgKuhMEtaVsVs7/rQqkZZiRAImvIPK/DYd16O9Byh0spvy3MHCfjQXz1Mqe4X7ppOLyMuN5XsaOz6Z40TNzHLpy5C0GLZHVFxydQahDmxnBVSKVepQE1ygIl8lb+uOMiIorAKMDTfAR8jMlhO7AjvHlmb2AnaY4PXSD0kCu5Y7Ehnfy3n4QqpoWDW3HQKGmzJ9Itb4DB/pM+DXuCdmu6UdFEKnDQbRulXGk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d0dbb5-1495-4e2e-0795-08ddaf6fa54a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 20:27:00.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 454MnqcpWGL2pWOrnhfTPzI3DEn+XAkIQg71vy82Xqa5oNFUSAAAgJDAUbXVR7yJTTz4kK4fY9G7EvkhhVOglBxmTi4i24+44ih8fIS+1nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE2OCBTYWx0ZWRfXz026WnJPyUd4 DmUcd6/tCOTW6eT2Mh9u3e/z85FehsLxceaz1cdRXChjdTC7omd8whxTHeZxQenYyzU3wvQQwyL qeYMGmbNImfuqJR4S99PEWx2O38GQc4SYuLtnTwhbJg/cy9INDHzkWn0I581nGSIE3btrtSgA2i
 PR9LhorPRTt8FnZD/Vj6G0vznSclrNjBFr/nR8pPOrKn0BXbFHFSxobN3WDlqi3LP4j2BXc0VQp a87Kzjh3GLcxRDIO0+k20HxjQAzMd+t/TrgA52dop8tKijj7ciJxzttOGsfhxnNOgjjkAnqan1r NMgh1B99ct0bzEyfkzX/5gbqjgFSiX10VOFm2TBkWRZy31hauf07C1LicwAUvE9fygsqY6TVIco
 PcOMMpaeB2+Ciq3u+7iuL+d/ZdveLvbZXbSEavtD+fbo4Zkjj3r5fb3SP6BI6fuboNsroRup
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68547298 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=YxKqSm6MmbSmlWEyA50A:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: KiPVxWkZWy1KeE0m_fRPbo0IfJl_47kC
X-Proofpoint-ORIG-GUID: KiPVxWkZWy1KeE0m_fRPbo0IfJl_47kC

Now we have the madvise_behavior helper struct we no longer need to mess
around with void* pointers in order to propagate anon_vma_name, and this
means we can get rid of the confusing and inconsistent visitor pattern
implementation in madvise_vma_anon_name().

This means we now have a single state object that threads through most of
madvise()'s logic and a single code path which executes the majority of
madvise() behaviour (we maintain separate logic for failure injection and
memory population for the time being).

Note that users cannot inadvertently cause this behaviour to occur, as
madvise_behavior_valid() would reject it.

Doing this results in a can_modify_vma_madv() check for anonymous VMA name
changes, however this will cause no issues as this operation is not
prohibited.

We can also then reuse more code and drop the redundant
madvise_vma_anon_name() function altogether.

Additionally separate out behaviours that update VMAs from those that do
not.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 167 +++++++++++++++++++++++++++------------------------
 1 file changed, 90 insertions(+), 77 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 070132f9842b..9dd935d64692 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -37,6 +37,9 @@
 #include "internal.h"
 #include "swap.h"
 
+#define __MADV_SET_ANON_VMA_NAME (-1)
+#define __MADV_CLEAR_ANON_VMA_NAME (-2)
+
 /*
  * Maximum number of attempts we make to install guard pages before we give up
  * and return -ERESTARTNOINTR to have userspace try again.
@@ -59,9 +62,13 @@ struct madvise_behavior {
 	int behavior;
 	struct mmu_gather *tlb;
 	enum madvise_lock_mode lock_mode;
+	struct anon_vma_name *anon_name;
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
+static int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
+		unsigned long end, struct madvise_behavior *madv_behavior);
+
 struct anon_vma_name *anon_vma_name_alloc(const char *name)
 {
 	struct anon_vma_name *anon_name;
@@ -112,6 +119,48 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
 
 	return 0;
 }
+
+int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
+			  unsigned long len_in, struct anon_vma_name *anon_name)
+{
+	unsigned long end;
+	unsigned long len;
+	struct madvise_behavior madv_behavior = {
+		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
+		.anon_name = anon_name,
+	};
+
+	if (start & ~PAGE_MASK)
+		return -EINVAL;
+	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
+
+	/* Check to see whether len was rounded up from small -ve to zero */
+	if (len_in && !len)
+		return -EINVAL;
+
+	end = start + len;
+	if (end < start)
+		return -EINVAL;
+
+	if (end == start)
+		return 0;
+
+	madv_behavior.behavior =
+		anon_name ? __MADV_SET_ANON_VMA_NAME : __MADV_CLEAR_ANON_VMA_NAME;
+
+	return madvise_walk_vmas(mm, start, end, &madv_behavior);
+}
+
+static bool is_anon_vma_name(int behavior)
+{
+	switch (behavior) {
+	case __MADV_SET_ANON_VMA_NAME:
+	case __MADV_CLEAR_ANON_VMA_NAME:
+		return true;
+	default:
+		return false;
+	}
+}
 #else /* CONFIG_ANON_VMA_NAME */
 static int replace_anon_vma_name(struct vm_area_struct *vma,
 				 struct anon_vma_name *anon_name)
@@ -121,6 +170,11 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
 
 	return 0;
 }
+
+static bool is_anon_vma_name(int behavior)
+{
+	return false;
+}
 #endif /* CONFIG_ANON_VMA_NAME */
 /*
  * Update the vm_flags on region of a vma, splitting it or merging it as
@@ -1252,13 +1306,12 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
 static int madvise_vma_behavior(struct vm_area_struct *vma,
 				struct vm_area_struct **prev,
 				unsigned long start, unsigned long end,
-				void *behavior_arg)
+				struct madvise_behavior *madv_behavior)
 {
-	struct madvise_behavior *arg = behavior_arg;
-	int behavior = arg->behavior;
-	int error;
-	struct anon_vma_name *anon_name;
+	int behavior = madv_behavior->behavior;
+	struct anon_vma_name *anon_name = madv_behavior->anon_name;
 	vm_flags_t new_flags = vma->vm_flags;
+	int error;
 
 	if (unlikely(!can_modify_vma_madv(vma, behavior)))
 		return -EPERM;
@@ -1275,7 +1328,17 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 	case MADV_FREE:
 	case MADV_DONTNEED:
 	case MADV_DONTNEED_LOCKED:
-		return madvise_dontneed_free(vma, prev, start, end, arg);
+		return madvise_dontneed_free(vma, prev, start, end,
+					     madv_behavior);
+	case MADV_COLLAPSE:
+		return madvise_collapse(vma, prev, start, end);
+	case MADV_GUARD_INSTALL:
+		return madvise_guard_install(vma, prev, start, end);
+	case MADV_GUARD_REMOVE:
+		return madvise_guard_remove(vma, prev, start, end);
+
+	/* The below behaviours update VMAs via madvise_update_vma(). */
+
 	case MADV_NORMAL:
 		new_flags = new_flags & ~VM_RAND_READ & ~VM_SEQ_READ;
 		break;
@@ -1325,21 +1388,25 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 		if (error)
 			goto out;
 		break;
-	case MADV_COLLAPSE:
-		return madvise_collapse(vma, prev, start, end);
-	case MADV_GUARD_INSTALL:
-		return madvise_guard_install(vma, prev, start, end);
-	case MADV_GUARD_REMOVE:
-		return madvise_guard_remove(vma, prev, start, end);
+	case __MADV_SET_ANON_VMA_NAME:
+	case __MADV_CLEAR_ANON_VMA_NAME:
+		/* Only anonymous mappings can be named */
+		if (vma->vm_file && !vma_is_anon_shmem(vma))
+			return -EBADF;
+		break;
 	}
 
 	/* We cannot provide prev in this lock mode. */
-	VM_WARN_ON_ONCE(arg->lock_mode == MADVISE_VMA_READ_LOCK);
-	anon_name = anon_vma_name(vma);
-	anon_vma_name_get(anon_name);
+	VM_WARN_ON_ONCE(madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK);
+
+	if (!is_anon_vma_name(behavior)) {
+		anon_name = anon_vma_name(vma);
+		anon_vma_name_get(anon_name);
+	}
 	error = madvise_update_vma(vma, prev, start, end, new_flags,
 				   anon_name);
-	anon_vma_name_put(anon_name);
+	if (!is_anon_vma_name(behavior))
+		anon_vma_name_put(anon_name);
 
 out:
 	/*
@@ -1532,11 +1599,7 @@ static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
  */
 static
 int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
-		      unsigned long end, struct madvise_behavior *madv_behavior,
-		      void *arg,
-		      int (*visit)(struct vm_area_struct *vma,
-				   struct vm_area_struct **prev, unsigned long start,
-				   unsigned long end, void *arg))
+		      unsigned long end, struct madvise_behavior *madv_behavior)
 {
 	struct vm_area_struct *vma;
 	struct vm_area_struct *prev;
@@ -1548,11 +1611,12 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	 * If VMA read lock is supported, apply madvise to a single VMA
 	 * tentatively, avoiding walking VMAs.
 	 */
-	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
+	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
 		vma = try_vma_read_lock(mm, madv_behavior, start, end);
 		if (vma) {
 			prev = vma;
-			error = visit(vma, &prev, start, end, arg);
+			error = madvise_vma_behavior(vma, &prev, start, end,
+						     madv_behavior);
 			vma_end_read(vma);
 			return error;
 		}
@@ -1586,7 +1650,8 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 			tmp = end;
 
 		/* Here vma->vm_start <= start < tmp <= (end|vma->vm_end). */
-		error = visit(vma, &prev, start, tmp, arg);
+		error = madvise_vma_behavior(vma, &prev, start, tmp,
+					     madv_behavior);
 		if (error)
 			return error;
 		start = tmp;
@@ -1603,57 +1668,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	return unmapped_error;
 }
 
-#ifdef CONFIG_ANON_VMA_NAME
-static int madvise_vma_anon_name(struct vm_area_struct *vma,
-				 struct vm_area_struct **prev,
-				 unsigned long start, unsigned long end,
-				 void *anon_name)
-{
-	int error;
-
-	/* Only anonymous mappings can be named */
-	if (vma->vm_file && !vma_is_anon_shmem(vma))
-		return -EBADF;
-
-	error = madvise_update_vma(vma, prev, start, end, vma->vm_flags,
-				   anon_name);
-
-	/*
-	 * madvise() returns EAGAIN if kernel resources, such as
-	 * slab, are temporarily unavailable.
-	 */
-	if (error == -ENOMEM)
-		error = -EAGAIN;
-	return error;
-}
-
-int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
-			  unsigned long len_in, struct anon_vma_name *anon_name)
-{
-	unsigned long end;
-	unsigned long len;
-
-	if (start & ~PAGE_MASK)
-		return -EINVAL;
-	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
-
-	/* Check to see whether len was rounded up from small -ve to zero */
-	if (len_in && !len)
-		return -EINVAL;
-
-	end = start + len;
-	if (end < start)
-		return -EINVAL;
-
-	if (end == start)
-		return 0;
-
-	return madvise_walk_vmas(mm, start, end, NULL, anon_name,
-				 madvise_vma_anon_name);
-}
-#endif /* CONFIG_ANON_VMA_NAME */
-
-
 /*
  * Any behaviour which results in changes to the vma->vm_flags needs to
  * take mmap_lock for writing. Others, which simply traverse vmas, need
@@ -1845,8 +1859,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
 	if (is_madvise_populate(behavior))
 		error = madvise_populate(mm, start, end, behavior);
 	else
-		error = madvise_walk_vmas(mm, start, end, madv_behavior,
-				madv_behavior, madvise_vma_behavior);
+		error = madvise_walk_vmas(mm, start, end, madv_behavior);
 	blk_finish_plug(&plug);
 	return error;
 }
-- 
2.49.0

