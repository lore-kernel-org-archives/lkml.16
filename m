Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C21A9B24
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598324; cv=fail; b=MnYhSTw2nHN9+1rmex1RFPSCpW2fvb6x/zUzsLzVJpFjxqWQiHE2g8vWPu+7bnXjSCRdvtVSfZ4YlYT8/sPFMTEtFt5yY9Q76yDqHc5inzFsvs2+dl614508H6J/PVvKQtyADtM3I9/5SI8AYIc0zQCfsKyyM4YJfwUFOkqnKuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598324; c=relaxed/simple;
	bh=A61eUp3NfkXvICCBGi1bcKZmIExJtuY32lqIrx0UhYI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jUQAI3MqqSo0Ql5e6akEuupX7psCoJP4SyePg3FlL6ebHZc8dST3AypGOjkyOBEOGQZI1QchKwjdWBRQdcF8S/5omczEE5BcsYTBIvbX4Os13mFTuethJZS2SX79qDDfwbCUomm8UQ9Jfq/VMenwpnOmUn7S41P2BTV1kSwKbGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cum1bl+c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RiIRg0nb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cum1bl+c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RiIRg0nb"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PFqWxt008527;
	Fri, 25 Apr 2025 16:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=uxRHiIs+YF7tZFoM
	+cU3WyH/zE62tUR1fg549qrDwJg=; b=cum1bl+cU7enwDtk+c+oKkitox78PXmr
	wOOCV0q1UVc3l2uHpGLECt38U7YazRVmCza7tlTdX2k3H3Va/OO/lM53unv2sEHY
	kbTB3gl/lL/AnaeTyV+C4l6TAsWWB/RRqUxrv0DcR5lTG9eJ5M9PahVYWViRLCIw
	kdQHm50JxmtTQT7l02riQyP6PY/vKPIxlG/lUkKYMhTb6rpTKeIdKFuQuLB+mo3l
	f73L7f5e6ZL1hZieLPYGMiQS1lBY+ghaVxMNg3KjpoEk298ZiaDthHEINy8eRfyT
	tyqDpFi9BD7kmxJX5eBqq+0ffo9122BnEbuzBKRpsPNW3vBAF+zPng==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 468d45r6vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:25:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53PFgreV013905;
	Fri, 25 Apr 2025 16:25:09 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012013.outbound.protection.outlook.com [40.93.14.13])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jxrunkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:25:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBa6frqOwKNl+wKCLllV9I9TayaxxzhC3xdt5tItAUT3pOD96EqOX8DFwFGF8xSiarC8s9giTC08ls2IDvPJDgtC8g1ONY8qfi0EqR8RTXXhICVRjUvvdt4PdX5CNN8n7okK80HPFMICHJY1vhbnDTURR2/GhH0Dx1BeFH5Q+eIOA+uJb9ernl7RIdN06/pNceJqH9wVfYW6ysHOig8ZZjWqyyYXVitM7dW1OkIxGKTsFLsRDge99q4qLXTLrrxBT2zSqsJL1gw/e8Sw454g519kO3FHXjVcda+v3rPfWtiDWNCDWam4yHiKJ9HpaNdVUXQiQipi/liqw9s6xCcWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxRHiIs+YF7tZFoM+cU3WyH/zE62tUR1fg549qrDwJg=;
 b=RWCS2VdQOnJVLA8sQqdA+Dm/59mVXO6GAH4SJ3HrxBqXJu+NPcQwhfAcU2xoILPpgos8qfJ1L8wwyfcpaDRnQ6cguuaCFjs52nf/3UCKHrAOndC1baKSfwG/caEZGoAUBizxpJ57cq3qK2plVtjG484TZloB7r6Xo+eQHOJY2jg/6a9jAKM/uaYg7Oy4OHuiJxz57aHm6DRpYgK3aC2mCzEa+l5Dr7dtYo8g1i12OxUqFL2RqKFptw0OkVIjoEl0HpsNhIXR+Er9feZloeNt75Q5kCJH+Y66J+tg3HFxVsmuinK28dgJqNjCf0xyU5V4RbiS208prPohouaCpEYL/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxRHiIs+YF7tZFoM+cU3WyH/zE62tUR1fg549qrDwJg=;
 b=RiIRg0nb0JBLl9Kpa9sUQNSNvitxz5m5CP3zCokJ4YWzmVKsgvb5wPdeN1bJNIfjvVndwKRwWW40PNOJWjXwfOzHiRcqCC/6cbGlBClAMzAHExZ+VNkfJzysLAFDV1QQd86pJIlopXhmQ9t65D0AzCh/9fEpBVA8sSbjnmgopkI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB8105.namprd10.prod.outlook.com (2603:10b6:408:28d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 16:24:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 16:24:42 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] tools/testing/selftests: fix guard region test tmpfs assumption
Date: Fri, 25 Apr 2025 17:24:36 +0100
Message-ID: <20250425162436.564002-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce2a795-28a7-4e4c-adeb-08dd8415af1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xMS0yDgxcoPk5gWSK5d/dJCoUjqbd9bX3o49j28+nveRMgZf983ju6cb2kZS?=
 =?us-ascii?Q?2GAOjkIcNArPUnntIz72kARx3Bf5LYKNSV/bIpmuDM8BpP4sJD7Tk4bzszpp?=
 =?us-ascii?Q?V3+1YkaVK9bZKLBwhe2SpeDv5MWF+RlZ3XdXgwe2gmMYO4favkg/DA9Nueet?=
 =?us-ascii?Q?0yQBcnP604UbZQtWGNi+n0OoBySjDmKvb8IiUNbZUVDy0mry/7mqjH45TRSm?=
 =?us-ascii?Q?EBxpNMy2OB/ktgn2EMgOQZrR6TVkOkp4qz7enbvTk/gfPUDfyP5XQafDsmfo?=
 =?us-ascii?Q?bSuiSiAZ2ApIqgLyYuh8G3F6GmS3/+UbgG7Uqku6ceOzpUsqbP8gAsASL4VE?=
 =?us-ascii?Q?J8POEOFYzdAMouFPGDAdpksv8/xzjxmAhUvk18NvrRLOHiZKa0ScfC9aWpAW?=
 =?us-ascii?Q?74s/+fETRFQQlC1SnL6NrtmcSL8jXiUR+0zuTxOGU22YgitIdIq9CK2lLg7K?=
 =?us-ascii?Q?hU9jJkckujpk3fRWhKPWdVv70GXrhIAWnfwXatv8MjQrnD+m8OYY9Oh+1KOE?=
 =?us-ascii?Q?f0fpSmFxPZN2l3DmH/ISQsxo6z9u+7DMqQZ1vFuAFzwUFXQocDOJVd2IHHFa?=
 =?us-ascii?Q?untlcPnx8c4QK9U4SrmfKsXtLqOcscX9K4rKNUGUPg9Tl99WTo6S7HVJaKg2?=
 =?us-ascii?Q?CSErTpBGPfxdsL9nUi0TyZSarT0evbl2pjARYE3JsmwSVvt7oaVkuLAVjdMt?=
 =?us-ascii?Q?zRLJ9FazM4ARkAvje2jKXI19yZ82EykaPLcsR4XTU3AyTSA8EQdw/7o8wn1N?=
 =?us-ascii?Q?lc7y2RjVAUQXT1XkwWbLstl08y5GIPuBYeeZno9//WqSp31p8NhFRAkudH1K?=
 =?us-ascii?Q?2I0D0IB8UiaCnY496rXDBUzGNgl0auWGuzTa0KHVlk5urNzN9G42roy/l/LM?=
 =?us-ascii?Q?4NVTvS+Gqiy1gHL+ofdNmTc2UWHiUeUXmJJrYBI3wk9D1380YGOuaoUGMogI?=
 =?us-ascii?Q?o/MoQrN+9khmMiPNHPZeKSjkWl30InEODlhjhdG6atS8pMLlP7oy+9QXh3KR?=
 =?us-ascii?Q?BIQ0tjdBnFGCVQmmYr0+knYK4DCnHcm3x3s7jsvJgcz0tUNGmG/u+mITJMxf?=
 =?us-ascii?Q?mMOq2xjoJQFOhNXg9jTn3MT6FP+u+/GMaR3m8RzTcGnEMtbT7gSDNStFtS1H?=
 =?us-ascii?Q?fZzX6rR/xoZqjMJM1jjf3X6VU72bOA+3+4EWgXblx/gcvivkczjUFyDge/Ez?=
 =?us-ascii?Q?bKeAbixO2FwTRGhisYLQipAcSJxQX8HJjt8754z4nlSXjv4ekmB8MIpDUsKs?=
 =?us-ascii?Q?GKGTjN1klrwoPcrGAYKJXnFRoYhfmFwCAZZYeYn4zCtUctxw4aCSopj8Ofmz?=
 =?us-ascii?Q?AwQaTZrbG48GL9jcW7mR0vqkUIYVWvdEouTOidct2U/Xlk9CqDQWXMTS4gTs?=
 =?us-ascii?Q?CS9ozL26VWvRaVJ+K5exLmj9qh3a68JCCzdUtfTcfTlOyRSDP5a1ytH21DyV?=
 =?us-ascii?Q?NHpPP8CBVk4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n15S0KVbGUuRWe0QF4MTwroqD/NBrZmim5cLCIas75/R2BpPdDLq/fp01IfY?=
 =?us-ascii?Q?rUexHuueKMafgNm0WBlbQzzCDmHZEmOECBV1beSOYyF8XREdMQ6afYUaQ2xC?=
 =?us-ascii?Q?kICpfs9a7P7EQUIuc28hch48t5P8+6chIZxJePDcxahRRcbXIJBTFBpEDRw0?=
 =?us-ascii?Q?ncjUj0H95nTDf+R+neYqbvOJ13AClIv1758vexSrCL+giFyBRNMD/j8RlGUr?=
 =?us-ascii?Q?UM6ZMl1Lw5IdnP3A5nmUFSE84vpMBnb85t9bhCAXf4j6iFlvs0eRdEQ0M08F?=
 =?us-ascii?Q?i8/Ije9d6zBpujYO0Eh3G523QFypfjLDTNCHE/0Yt9xHBIxE5SdbMYV3/Cbn?=
 =?us-ascii?Q?thvgoqnjDtItxrMTl4xsMnhJMIJak1fWGKaWFZc8/E1tEFIYpdi6W760RFLT?=
 =?us-ascii?Q?ZIeTUGzJam8yvsi9RIT7nwOf3i5g4BNggfy4f7zTYKBQVxak9SrENe4R5Pc4?=
 =?us-ascii?Q?0/uuoS7xn4NbjaCI7AmI7lOMwPEFBtu1zMuIA+V7sjwZcK3hfG/jC9OOX9Xx?=
 =?us-ascii?Q?PkLEEwTxszDB9wgyD/76Alq8Z/YeuwPg7NXAu3wEKi8AKAteohU3aEcghbqE?=
 =?us-ascii?Q?JdOaOeNgFw23n6TlohYUL4FrA/6BcRJT6DQdVQYjPuAt+PbHePCTJKhqkhgv?=
 =?us-ascii?Q?cPeU/eH/CEbnEiMYbO5m32YySqFPfOQbzQ3e3klplBg/TmaovsPe95VA3Fwq?=
 =?us-ascii?Q?ukIB4U8U94XQxl2vJwnBPU0f1CBk3Wd4MkR/5vACGAtKd4pr3UavsviuT5nU?=
 =?us-ascii?Q?WiSVsMf3wkkXDGxLxZGb2nCt7ONhb1mmJ1ivN82CHy6ZM4fL096We945/kWi?=
 =?us-ascii?Q?LhtK7oK1phIa672P10IWBEcUY7vnhjSvyxlEnUSdbSh6ugL7d2m/kupAS5Gh?=
 =?us-ascii?Q?RtZJBtZYF9sTPFyNgctcK+4ZMYnACjO1tFCpTKy4aM1u9+CQC8XvLWWXFs3Z?=
 =?us-ascii?Q?as0BQ/OdzB8FzXh+sA+NzliKZIq3NlKQvlnKkh82edezzMd8/nIibxIjjWNQ?=
 =?us-ascii?Q?S0JyEC9zu7eKK+Hd5g64XXVT5vt5LlEr04DuuxKakSkiPM4Mkx4dVcAx6+kD?=
 =?us-ascii?Q?3jU0mBhW+ta+mQzw+o/GQfI+Ny8n5hA+xD74mjbD+wJwhPWlJ2htZggvigaj?=
 =?us-ascii?Q?KE+PosniCVomFTffhBF3Ipqj2BidB9cPTQ7VePdqMhrBNRIEAn1V1fwuPvgu?=
 =?us-ascii?Q?46hebU2LT5oebgDIOCUBDdi8yMJkDo0GFEt1wzZ8hCD/Mw2oO66PcgxvFFIh?=
 =?us-ascii?Q?8X6nBjRWvhjWjv2HdLPyDxW1UP17fwEmiHU7CXNJunrl+EPRWW6KtyySj97z?=
 =?us-ascii?Q?+hRVMcH5kptFZu0ql2FEuFuN+cdBlFog0YrGQvd/OpRlBsUgtYQDamOWHW5S?=
 =?us-ascii?Q?uFspyTByZ74F6hH0KVZix33TIp3fbQNT2+/ug8LnWB5asP8g3ptk50yud3yn?=
 =?us-ascii?Q?BwErj/DLZCKn3S8Got4D2B+uNTTKWJKH8OSYf4vm8URomnhWVw+r37Cbi8ZC?=
 =?us-ascii?Q?7UZK0dU9rh3YkgvqKY98ioO6HJA6UC1885omGgVLG63FTbY6NDwYUR0/gkoK?=
 =?us-ascii?Q?ENb9AFYZyhhN2cZjvvHYeBBTHumMYm3Ctftb6RssB8xGGAVwJ9HepI3mHIMf?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ysTL+S+l6tlTtEUMY3R5l4LdyKsNIMZY8I8gyzJ92t9kdzIqJLRcN7zPokMnPo/YGV3TNlE3MCfwJEKDnKW4MxG11mKA5TePzXfwd7xztOEDa/6vnbv9Ed4eSaTbEiMEY2YGFBNwHCzISaLwgz15OUkKNMRa2L9Cy9OkCjiVlMs/HHfXgpOdbl666sWMpyQIiFSb/n/TlFcF6qoH8UlS3ML5hLMifcXJ5pztODLaZhUA/xsrTxaxz7BvFUJxP9PQXM6YTNdDQMA8G1BbJG7SQfloeQo8RBJOEA35LpqRRqgRuVUzoECNfijwP8bhmvxgZr8l04QteJp4jIVPc3+kwbX5AjYPUXx2vRAXT0mnhlzWonbHc4TpQ1Pg17tYUXaftlc3UdA2PwEmm3lTyCmGmgDzhCsHn1HU/x876694wYRDR7DVwJi58zq1ojoa5E9mDEQPMolnFS1Q3dFv32fMTW88KcUBhVowP9ggL82wRz/NGsHkjW7qWo9gCTCalmM93R72jZMt4vf/QnmQ9gwCxTOX7WvgTNMNoieBAAHfoAXC3qQkQTX7RFj/WQMf3CllS0EvZ2HL7r9bubJsKHkTWjaxprZBo3YBBiFPzf0WW2Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce2a795-28a7-4e4c-adeb-08dd8415af1f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 16:24:42.4501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boY8HBvD3BxiqTGNjqFBBytb8LCPnGPXtMTxjjzHGjS/HfpJDUlzwabubSAEY5q063BH1XcVFr9SiFtaO36OwKAh0EeL66nrwELRkcpUhhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8105
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504250116
X-Proofpoint-GUID: lBtaw0zVbzOd7_8jX-B5sYJ4PujiED4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExNiBTYWx0ZWRfX6kUpYym3YbBR nDX++3Jcc3Ojna4dNLUMcsFS6YSSz6exhueHhXAbe9Q5rb2LZI+L/h/NmH7tC2H8NmQTNci+WIJ +ZLu3APbvwkl6Z5aJSiGf8ggxLBRlPpnYGZ6Xo/9eYK1s/55wvf7V0e9zmnCqCC97HbdMNFIidG
 V1HAEI4PgcZcmnH2P6jT5Zz3eLFF5wJ9fuqpG/FkhmWWGP4ffVPUy1B8qsoPGTTP7JojCDY4LUN ICoqgIaz50/lH55EH1FyG7XYbBmsOW6JUpceYy/IMxZRjz6kfqJBU0kbqbxzHdaPchvQ2GA9GpJ KsMuY1nhAdE/dfc1IiDTKLQpmeWJ60kn5H+ByZXgvEUcyoIE1SbpEnvxo5pMKb+ubux9WJNXxvy pFXeSym3
X-Proofpoint-ORIG-GUID: lBtaw0zVbzOd7_8jX-B5sYJ4PujiED4z

The current implementation of the guard region tests assume that /tmp is
mounted as tmpfs, that is shmem.

This isn't always the case, and at least one instance of a spurious test
failure has been reported as a result.

This assumption is unsafe, rushed and silly - and easily remedied by simply
using memfd, so do so.

We also have to fixup the readonly_file test to explicitly only be
applicable to file-backed cases.

Reported-by: Ryan Roberts <ryan.roberts@arm.com>
Closes: https://lore.kernel.org/linux-mm/a2d2766b-0ab4-437b-951a-8595a7506fe9@arm.com/
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/guard-regions.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
index c39dd26c47a3..0cd9d236649d 100644
--- a/tools/testing/selftests/mm/guard-regions.c
+++ b/tools/testing/selftests/mm/guard-regions.c
@@ -272,12 +272,16 @@ FIXTURE_SETUP(guard_regions)
 	self->page_size = (unsigned long)sysconf(_SC_PAGESIZE);
 	setup_sighandler();
 
-	if (variant->backing == ANON_BACKED)
+	switch (variant->backing) {
+	case ANON_BACKED:
 		return;
-
-	self->fd = open_file(
-		variant->backing == SHMEM_BACKED ? "/tmp/" : "",
-		self->path);
+	case LOCAL_FILE_BACKED:
+		self->fd = open_file("", self->path);
+		break;
+	case SHMEM_BACKED:
+		self->fd = memfd_create(self->path, 0);
+		break;
+	}
 
 	/* We truncate file to at least 100 pages, tests can modify as needed. */
 	ASSERT_EQ(ftruncate(self->fd, 100 * self->page_size), 0);
@@ -1697,7 +1701,7 @@ TEST_F(guard_regions, readonly_file)
 	char *ptr;
 	int i;
 
-	if (variant->backing == ANON_BACKED)
+	if (variant->backing != LOCAL_FILE_BACKED)
 		SKIP(return, "Read-only test specific to file-backed");
 
 	/* Map shared so we can populate with pattern, populate it, unmap. */
-- 
2.49.0

