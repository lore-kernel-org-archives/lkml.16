Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D43A185920
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434675; cv=fail; b=lOUQo0z5BQb8o1ANOIekHVOc36An87hcMKCUF8aIUOiwEgc2bIAupPr0fQJXoHlKYiXcxccHIulE6ONaflptLpuUzDzin/2eEvFHvJMa4pltq38sL3i+toUz8w9FiW2PcXdkBuvf248VC5SHMWoAh1wMfDufKPRLAwQuNb6vt9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434675; c=relaxed/simple;
	bh=nmXbcpfklGEOMuxwi1IVADLuwaYrTXohnFSSqm+nq0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FxhnaMF+cHt2SgYONcGHmpDagmcAUg4KIt2VLWSDdZl5iYDAGIHsBpkT719FKWcfvoLh/4SyA9ot85CRTMw5YVgf+btl4zbEEY7m4+2a/pUC60QSLaNIsrfNg1bv5ayewDOByXXOUR4y54q32YTIBuWfAOki9/7tWPPufiIQb/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jiJKOHqC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EU3Uyo1B; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jiJKOHqC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EU3Uyo1B"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBnJ7010634;
	Fri, 20 Jun 2025 15:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Vg9ghTvPe8uonSWU+q
	xaSXsniciy2z/3u1IARI87ld8=; b=jiJKOHqCxzJLg2yGPIVibDz1PNS5l40VhP
	g/PWFZvcewsEMxgt3S+/ifNxIZI5ogJenwRJKE9WfCb+pBWQqt+xFcE8alLC/0TC
	tXQVJw6S5s/o+8SfaZQUhztQCd6EQZ02WX94Tpgnm74Ymz1s0JPUY1353AB68Z5V
	hugXxP/zuOd2BJ4BZODoMuKy7sXoPwewe+2J8btwCDSnuTqI5ML1mWPdJ18ZeajI
	/xVk8ONjuqAoINXrwor270blfPLLXkj6EGX+a4f9Z00vtGYMR1BDAFyqz+JdD03P
	uF1cOnW1BWtyGWDuY/2pXBxXbRDCKYQpaIcVb81aL2HXHHYxd7Gg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4v0aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:50:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEZ1bO038324;
	Fri, 20 Jun 2025 15:50:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhd2kf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXITXRIhhfpnt6w/rfQfmPMnqOE5BclY7k4bApWpLbte8guJhSthcknwldQPDeVbm9amL4QUyssAKgYuJLdh3EAP+RTZfRWyaYulCmd5VjLwNjS83X/2lrFM/QDWcLv0oZgouSxcFWuH9M9L6qd95FsD/8IertsGZjP7WpOwwOMhMXSmMngr+cqCm4sVAQJnEELo/JtY1ifb16XHOmHCnNEQAJaFDtL9QFGm4DErBfQ+OsbP1WC3fxCR/Z2MKmLlcEozp9l5ZDBoT8lAcRoZdWOFNhbTC9b3PcCIRJPYDJ16XabBdefJMVZeKV7p37Baj2E5BHPOtIFu/p6QLS4CAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg9ghTvPe8uonSWU+qxaSXsniciy2z/3u1IARI87ld8=;
 b=RPTTfyxr7gLqdKPX0ouRRJCCRM7TZCpN7yUHsvCsISGn6YPWCdrDBG+OH5QvuGVQDo+Gfgp2NWsTqUE4mdF1ic9UDbapCrdxGG5RUj4qap2wQX4LUT7MLeIBMWK+R37bWs5EgxWCttXilgDg9vC9gqIDzbMXOlx2ZB8q5FGYjG7EX4lzAnjWpTAgo0SSDs4fMOlOg+k0TDB7ZyUqqthdzoESilMBzhFduxQe3sgjS+jGWVCL37dbxH1Fa9bkk+nOvwvwHkJ1jY02dP9d2NCD/PKK4ZV6kDTCiZoWcKop3+5Dj/1WztE9dM6pSAohNJUJ6x90TBZu1EUUYaquYpum7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg9ghTvPe8uonSWU+qxaSXsniciy2z/3u1IARI87ld8=;
 b=EU3Uyo1Baxq0NJo+idbZ6YEBQ5vSM7hHpjlkvE/LDyBJn5mnEj9I1vmswVkYQGjmGl8Y9RBQBjJVg9NsuVFcN+1A7K2JIK7J4Q1cFjkrsyiU76jW7iGD0CKJxAEe2hM+pFvvub3+OJRqnHT5ozLm2rzaNFK8t2M+xXRQ7GgakXo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6801.namprd10.prod.outlook.com (2603:10b6:930:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Fri, 20 Jun
 2025 15:50:41 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 15:50:41 +0000
Date: Fri, 20 Jun 2025 16:50:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Hailong Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: Re: [PATCH 2/3] maple_tree: Fix MA_STATE_PREALLOC flag in
 mas_preallocate()
Message-ID: <43e8466f-762e-4359-975f-f16cf74c2f7b@lucifer.local>
References: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
 <20250616184521.3382795-3-Liam.Howlett@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616184521.3382795-3-Liam.Howlett@oracle.com>
X-ClientProxiedBy: LO6P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: c39fd5ee-a797-4f5a-fca5-08ddb012359e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W5wt7ivITXUCMEtdOGuF2fLU63ccszgF6sJc8ChKcjQPIP2T6TGuOxk7lnxh?=
 =?us-ascii?Q?yI620xBQ9F/IqxrpDq5sfBQ/fECUtVX1ojZg7UzzQmo7KslzQqnXpOAA4zTx?=
 =?us-ascii?Q?CRKQmmxgbli47dPQktXgJYESrC4fCnVdFoLy1Begqsqipo0msjVFq/ZIixCh?=
 =?us-ascii?Q?9yEJ9JUPe87NiK8/uXd+g/PXO2vliiGVDA/qGVw8izdPoJTodDP/Nq2GEmtp?=
 =?us-ascii?Q?J7YUZxqSwptPu3+sHpVt8GcVQIwd1rbVMQr29L6ovfLkjiJJNJCb2/zJiFyJ?=
 =?us-ascii?Q?wUN2hCvXw67hayOClJdQ1pmkrtDwmQAG0GvbBQlyQxQPaU25vXS7kWRzoIKO?=
 =?us-ascii?Q?/Ovp9iHScr4D638Shjf7A7A20MHSKGCjZ05pjtZdCWRmIgD49STYYUHQUUnf?=
 =?us-ascii?Q?BwLdbqKANxiZKat2oJhNGzXAu+KuMKr3CrNc0BN9iutKKON16fpJRQEJFK4T?=
 =?us-ascii?Q?t2/q45F0GXneLspwgUCJcEXfh3IYMH2xp+0TOIWcAgzbDAlonF7mfAN8djXl?=
 =?us-ascii?Q?mEsCQijdUnanzGVtP24VTh5o1fNmt7Vwhq8oJTQ2Sx6+A5nC7yctzSCbMop3?=
 =?us-ascii?Q?PKGppoAk2WDcV/kgJEqxlWGuQbqpUUebh+KbwYB5MmiJux3p7QlY/X1D9zXT?=
 =?us-ascii?Q?bCBUN/FmBT/CV9dsgAKFQ1DZoZnjizUDz/D54jGquLgJKfUVqY5Yv2XodxxV?=
 =?us-ascii?Q?ATcXbtApj23mNU8Rh3B20opKyGs7H+l6cNMEwuvJGOBgIUKUeMg1wtdazlQi?=
 =?us-ascii?Q?5xK0Nrz+Z6IlrGHHPtechAd1LYCHGQPltuxhFxLySVpio3LQEZ5UWr1oiScF?=
 =?us-ascii?Q?ifANPLR4KnJawYIaK/DYLIqMRi0mQj5f/+ZUeg+NEiOicdUPfCdtZ8mhlSD9?=
 =?us-ascii?Q?P2Sh23uEyrHDUU3bAuOZU6qOfGG0fyAdmCTFAuPnxZrELALsfSxqSEZ36rcT?=
 =?us-ascii?Q?tX21rmMb6YK2lktnsbfpfteKmgFIll9kmpRiPPncqgaKYT623aUN2nmUUxJB?=
 =?us-ascii?Q?Xz33jOUSC4waBJYyCEPzxJFj94K0rZdF6EBW1ANXLWl1d/Lsn/JE0ya48Har?=
 =?us-ascii?Q?OUVUmNLLZAfGm4JJz/YvBcmgSMGGF0Hm3tTud1DB6leAcpXU7G+vfRnbT0AC?=
 =?us-ascii?Q?K67Sr80fjFmmIXn+pdbFpSurAQ+3GumINMf7K7pye24SP3O4pAMEvvuRg7ZU?=
 =?us-ascii?Q?NUeSUiLLpWN38rqnYpQVorir3ES4JSJedhc9vTwUYSyCt9g+YElbAziu94Sp?=
 =?us-ascii?Q?Iq/3aZgiHTVn4EY7i/vmLF7KUcJtLCzZQ2WHzMjT+Yf+vWmB4dPq8IkcNyYo?=
 =?us-ascii?Q?5Ua/Ay4znxznUkF3kB6c0zJToqJ3GecfkHGsodYh0o/SyY+yY8o63O1p6uJG?=
 =?us-ascii?Q?CRWxogtd6tEWgIS97BckH/W5ZhjB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z7KY8RZVLzbsIbDqIgsaA9t7S6Gj8tUz9UmbIY8RZTZLs8FnB6dr+NrFlOPU?=
 =?us-ascii?Q?MNuGMjp8fy+UNIpZH1KrtlPKcL8uOJ2k8tG7lfv03pHXu9oFi5ziNH+AtlwX?=
 =?us-ascii?Q?7tsy2L4PPHeccKJBZoXqwjOEMXcJg+qEIjhj2gj1ySf3WRCDY4xRcG1jUZ2l?=
 =?us-ascii?Q?fmLfy37C5L3AlD8eLX0hkw5tCO83UT17/n4fdkcRnv5cVs5P/hdjYcbQKg/0?=
 =?us-ascii?Q?HaHP22OMFftP4y01i6edcKodwr4Tu80Nzg4uvpXLChfSsOoCZI4IdXe6hiRc?=
 =?us-ascii?Q?7whJg/T+pnjXE8bsLV66DOzqQNxysZEqJY2edBMuwBdv7KXJ55Ju4+wG7aSh?=
 =?us-ascii?Q?JrxyEO5UWkymz0RzBqVRDqB/a5+gjbQ44yXz/3HFuLPjXOW4EIrUaEV0ICoE?=
 =?us-ascii?Q?NbpmivrbZCz8AnAvqWuD7nU3BfClKLgqPjSlxe8EIyN6UmqNsRn8DlrIotmc?=
 =?us-ascii?Q?/T3AnUIYgUDVkmxzfYzLwZaFBU1uZ7/F6ciHlQmNbsJGdP22PR+VfbnhEwat?=
 =?us-ascii?Q?/ceBXCUgdxXWy0BFTLaMHWZLLaPe1eYWwPu8vUrmp2QswGw27IzWMkYVv2ER?=
 =?us-ascii?Q?ofnkwjdiDDUzZ9PgiA3ByPrpgwUVVPwwttgH32yYvPU4GlKMBa5KQMt6Gy7a?=
 =?us-ascii?Q?TPgRpQ4KCHlIgiRhvwT5JFTmckDguaI6K5CZqiOmvjp1ZJNsB27W0SL/XRU3?=
 =?us-ascii?Q?pWbFGzrSfADI/PWvQyTJG/dNB7gf7tRz7SNJOhOf6EqQ9OBSRGzGRFNP/wTw?=
 =?us-ascii?Q?d4IN+5JXiXEh1QySzw/MawUX5O46Har6maeFCuSRuHUdq/jT1SP34ahHIi5c?=
 =?us-ascii?Q?cQboe0xGhcJmXQkGJUvoWVT99nRaPU8PILRz3EV7GsMPnYMLOAYC5cNylNdY?=
 =?us-ascii?Q?6jvnumFQHOH5u0I/tm2OLPVOWL6IU5MMJoZFU5/gZlsOX0+B9XtYJLXKnsqL?=
 =?us-ascii?Q?0bhMBdf6qAfBXVTm1P10kjYU2FMpBLM5bQUIP8+Zo0iK88+REJDBxzPNEaRQ?=
 =?us-ascii?Q?EvCqsj2CXFvVXAO7N2aTP++XxvU61lRNWS3F2OxGNLm9NyjORuYteoAAFokZ?=
 =?us-ascii?Q?mgUXs6yM3qvoxMmYRouvi93gEvGFG3UfZ2iBdnBDq2NSIIiJ1L+VrY41kIAT?=
 =?us-ascii?Q?7URV5mMaj8Ag/F/5FlyqpbPpvXFceTbbPPBySIYFVtx3L6XQ7DSutRmLWA5p?=
 =?us-ascii?Q?FhfNAs85NnPNbkwOVKdbUAczLygdM33rB6WLMZfziv27kYjSqwH0UfBCtK6E?=
 =?us-ascii?Q?W2CUczKtwzEGGxmitx+JqMVjshIIDD45BBihsZYMk9JpNOpI6joRr2uWfvzz?=
 =?us-ascii?Q?6j4dbJw/mQgGBkZgyk/rcd5uLxSpaMmi3MfoE2CyHoXFoIyxZtQ2SjWKWPoV?=
 =?us-ascii?Q?zpAFAPa5vBeJwLF/2WuASsLWrLHPd1WlBU7ASjMrHIglE0Zgdx96LzilTcps?=
 =?us-ascii?Q?SO6N/gRYzIYw3CV0QRIl/JweA8EAgiBX1RaBIuqy52sooqPDpEpaQYjL5tNQ?=
 =?us-ascii?Q?WvjrrkiQjtyRAk6Oj4UXJGJBcO5Vo3PF0OtoZYejjCQxAAv2n1SnWad8e8hk?=
 =?us-ascii?Q?mcwHwEIpndbFGhd3vwDAfEPLNPOtA4LNxRo94GEtf2MyKMajcbAhxlLBJpbL?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y5gvbSsLJ71czR6zenlWDwogW/NFPVumIsh1IpL//3sCIBMwTGWbkZ/ow/D78ACLrpmjkTH3esQBPeGcG5eFmBAcriUVpe7dglfUsubz5Ycc1T89aPnGFFLSWuX257bJWAAn3PyclMZa7RlMmQTUTGa2BAj1gq7ax0DT5NKUhaBxb1kMzQekcCruP3IqnoOOTqSweM22koKpAjDV7MSZanVoe0v0Q/OnOtGtZLOiXDcyzK8EnNbPQcYuLRFkwWIUV8CfacjURqEcQ85N0sBeJZqf6g8Upjpy0JA8zn3k5xigJdM/qgNKCEFIfajQ7sMYGVyK7ddwGnWNg3CCAfMu7DljE8ZCt0cMPprfKpi6dIpd+97nGtUkFOlNDrMtM5X2BfTyyT5juiVmSvczxJFjOHKC4iqZkmvw4Sc6SmTXRxua6DrqxNa9QQzKgErDRJ6xqeiypBANqwMjFuNCL/ioY1gcWKohNzRPoCzv+9XeqvgWMPvxCPXzycY6+Qw36voIrsuC1ke6L5/D6ofqqsG/hEsawh73138d8C4sU/iY2+u7atT9FPcp5STia9Ba67Poyq1qtW+T+/kN2bLSYGpjgfhJnXCaAmyIzSNNTEpPS5Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39fd5ee-a797-4f5a-fca5-08ddb012359e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:50:41.2864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fx2AdnZ6BFEHlqjBexhLAXKp9pbqRZ8HaFrb4UeCFkCS5Rt2xEUITFhRXu84SYgJZe5v5NDuQZvM/B/U63gw8YrE/cxQM1TKHrjHq5dPhig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6801
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200112
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfX/3sUHuPHs3Lm +WmmrCtkonY7Zeb5xdQKVQig7cGyxgzLHEcCvE56gkuUYnrK3sqZdj+cGgJybfrhxKfw8w1g9dT g7wq17F51MUgcHb+pSI0in8AW0lh1+4Q80DhKWEv95Goq18IeyBTj0HSg4YN7+WX4f3zOemS3EX
 m24Z0R9IagCyx28NIfB7cVBM3V9Q2o7SyEVKnjHOMGEA7vjtSkunA5fFynTMVJhbhc/lJjf1pYb 66VNvGEqCBU3H3BJRoEEWiy1eHNCUjjDaHc0cOxVVzt3xwEGLMlbagdQnoYbL2NpWvMyCYtOxbf D7FjXsksbzpj6VHWqWL/1AMDgvHR2F335kDeJMP0rlCdDDNB8pvyE0nSW2EM8kFb8i9PqkmAl7c
 6BoX/ByXFRGL9NdASA6VnX6BaliCRoriUXBpxg58Qh3YzW5ivb4gapACE8EO5dsSuIYAqZAn
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68558355 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=icsG72s9AAAA:8 a=1XWaLZrsAAAA:8 a=968KyxNXAAAA:8 a=JfrnYn6hAAAA:8 a=9WrcevZ8tw5wvGgCB3sA:9
 a=CjuIK1q_8ugA:10 a=T89tl0cgrjxRNoSN2Dv0:22 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:13206
X-Proofpoint-GUID: H5jCfN1xi-hYxNl0ttC5LZu3GE_2Kish
X-Proofpoint-ORIG-GUID: H5jCfN1xi-hYxNl0ttC5LZu3GE_2Kish

On Mon, Jun 16, 2025 at 02:45:20PM -0400, Liam R. Howlett wrote:
> Temporarily clear the preallocation flag when explicitly requesting
> allocations.  Pre-existing allocations are already counted against the
> request through mas_node_count_gfp(), but the allocations will not
> happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
> avoid re-allocating in bulk allocation mode, and to detect issues with
> preallocation calculations.
>
> The MA_STATE_PREALLOC flag should also always be set on zero allocations
> so that detection of underflow allocations will print a WARN_ON() during
> consumption.
>
> User visible effect of this flaw is a WARN_ON() followed by a null
> pointer dereference when subsequent requests for larger number of nodes
> is ignored, such as the vma merge retry in mmap_region() caused by
> drivers altering the vma flags (which happens in v6.6, at least)

Oh interesting, this was a deep one (Lovecraftian pun fully intended)!

>
> Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> Reported-by: Hailong Liu <hailong.liu@oppo.com>
> Fixes: 54a611b605901 ("Maple Tree: add new data structure")
> Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com/
> Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howlett@oracle.com/
> Link: https://lore.kernel.org/all/20250429014754.1479118-1-Liam.Howlett@oracle.com/
> Cc: stable@kernel.org
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Hailong Liu <hailong.liu@oppo.com>
> Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
> Cc: Steve Kang <Steve.Kang@unisoc.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>

This looks reasonable, but because I am not quite au fait with all the details
on a deeper level:

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  lib/maple_tree.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 7144dbbc34813..54a09c26edf96 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -5528,8 +5528,9 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
>  	mas->store_type = mas_wr_store_type(&wr_mas);
>  	request = mas_prealloc_calc(&wr_mas, entry);
>  	if (!request)
> -		return ret;
> +		goto set_flag;
>
> +	mas->mas_flags &= ~MA_STATE_PREALLOC;
>  	mas_node_count_gfp(mas, request, gfp);
>  	if (mas_is_err(mas)) {
>  		mas_set_alloc_req(mas, 0);
> @@ -5539,6 +5540,7 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
>  		return ret;
>  	}
>
> +set_flag:
>  	mas->mas_flags |= MA_STATE_PREALLOC;
>  	return ret;
>  }
> --
> 2.47.2
>
