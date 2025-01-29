Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3161E25A643
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175597; cv=fail; b=V0VE30AKhVdFWBZfGzlb2XeV6RdJJsAEI1bCUr0USheeKa5UXZOAeHrLtqIUTeEa0ZBZMvHjkCnnjtYHre3dbkwYtphrkYi7eX9sWPxF7i6OCOYkmtImbIilwoe5S8cCxgqFx9sKbBiNYirL1fSYlzN1tn+lZfWQxR7h29HzXcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175597; c=relaxed/simple;
	bh=ZiW7+oLuA5d4dNpwt55iq4BxnQVAVUTQZ4y2USDrvz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oIYj9SXmlOhZcgC8lj4vI7NSLHaQqo7yQ6KCiZcucEbdNNO9LSGlw37zqDULYLSeSg0bklBJEc3GvQhBOYi5r0Xsl5ColUMNAS2ameKZbXJBVy6dINfrHzTYP0vLCkMo3mprFcqrk6CJ6y6DR1TPPxNJtgw7BPd0Yc1a/YNDPOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b3hchN9H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sDsPQE1Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b3hchN9H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sDsPQE1Q"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TIBj5K020203;
	Wed, 29 Jan 2025 18:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YJSKWlatYWLBz+jZN7/O6d3gx2Ck2wdZ4ueX3ZXgvIM=; b=
	b3hchN9HdESwB6bGDF6kIwjwaZjuuksasbZIib3fB8jVOaFjNHIlWl3Zdem6qQRm
	blNeQf9O3+F8vpJsVBA23dddXUxXNKs/k66PzRA26ABFz2YSwbHV5BnuApuzh6ll
	IfP1P/Pm+HI7JqydAXRj3P7fNZUC5/H3nIouy9YmfhP8alXyns3a28uu/Jz2VPjE
	EsbdoFzKu9aDAyJmQAZmRoL4KlDuItO/fBAlnlh12ww12YfGfpkYJ0rniAVtpWen
	o7NqPvctNOrzNwuiM3+cxOYgMXz9RhfKNdQt7IQPg2XTETpD8Y/Lx9fxmP9BMhis
	kEt31s5uuK4h4cc3DCqPbw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTP id 44fsd501cd-1;
	Wed, 29 Jan 2025 18:31:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TH3nZH034139;
	Wed, 29 Jan 2025 18:16:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpda2sec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 18:16:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Csg9+iC/KLOl2ncE9t9eQJ2yViRHQhvtacRe+hIGu+eWi5pdy0zD0xUWIm0NdagrfyD30fE1HOTxsB/aODilwbY6UJcxv1VZpvEYIUw3bMVcqPmgPBD53k7hSJqN2cx29/06wMM6GaR70hLmWIks0Kl73oMBlMapxOIKOR9mGSqR6Lsf3Z5D7/6ZFpeKY7Ov+MJFaVLGUc9u/RK+i0AByxpO/UD6mZ6IMaVryygkBDjWreFF29oTQcLS/qboKPIgDAI0mc+5y80/SFLSfu2lBI3TQ6PjcTxomDZO3Vbu6GJLkLepgyJZKxzp8uvW/wJI4H+0Wcg2IOGAqdRI+Ea25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJSKWlatYWLBz+jZN7/O6d3gx2Ck2wdZ4ueX3ZXgvIM=;
 b=Tcf6KXTW19ZlLQwg7mkILEqLmYpAbl17YgANsC8AH9VBOsyETqUigeDJu8FyNPQ55XbDw8CULZakcqqDjb/QGwCRRmDJw2fAzP/bkp/DAWGwms1vjhtBO8U+NEUojJVEQc+29ZevO+0Kks9FQ2oMYf0EOhOJ0UJbzPWms0IzCsldHlGbcoKanin7/7qU6av80VqWaGgSrjKc2z+NrT6tQJFA7oSWttMFbFvGuGc5yKGsPvF06xlUn9JoRei5+ZWJr2Tz7HliRvzmAlFZ1IJ2FmoMf9E6A5jYe9j8lrfbUmJyduTDDanKQh3w9m/rP8/dz5CC5eeSnOQQzCKhVk9SAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJSKWlatYWLBz+jZN7/O6d3gx2Ck2wdZ4ueX3ZXgvIM=;
 b=sDsPQE1QUZA3wHuTBm55bSYBix9FZjFoiF5kMTAea/YZZvzKzAJ5E9s9du3IFzwZb6kWT08PtjHG74HQoYzw9lgWZjEPO74xDZgX8RVhvZzz2h3xGMGHN/FH/d0cB/3S+fCHeGX3iWkiHnJBROS3hCfG6T41wElg0VeFCDRpDws=
Received: from MN2PR10MB3374.namprd10.prod.outlook.com (2603:10b6:208:12b::29)
 by BN0PR10MB4919.namprd10.prod.outlook.com (2603:10b6:408:129::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 18:16:55 +0000
Received: from MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348]) by MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348%3]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 18:16:55 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] mm: completely abstract unnecessary adj_start calculation
Date: Wed, 29 Jan 2025 18:16:39 +0000
Message-ID: <9f87c3bbcc1ee6714a94b5bfa593ea667958ed03.1738172812.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738172812.git.lorenzo.stoakes@oracle.com>
References: <cover.1738172812.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To MN2PR10MB3374.namprd10.prod.outlook.com
 (2603:10b6:208:12b::29)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB3374:EE_|BN0PR10MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ef871f-bb49-49aa-dd61-08dd40911cee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tmo5Tn/UXh9M2sYyJ6rwOjzaO3NDA4+ZFT4XUiG/wMldxKfVloyuysjZ5TRC?=
 =?us-ascii?Q?qx3SxdY+mHIF6h5zPjlZD9BQ4AoUAjMLtooXMxJTlINRSrgZaaaxELjt14Pk?=
 =?us-ascii?Q?wT/P5euHMbnb3FvBg2ZCqUueDK9tMDuENtzI6FvCd4jIjoOp/8PaA28eKoSG?=
 =?us-ascii?Q?SVxw7/RjR66ZRDA7NHvIArq1MptyT2auQQMR2/uM6L1rRS3NomCHdpWyWBE4?=
 =?us-ascii?Q?CJ265gE7SPsBRvshLXdr0c0TLZRCSFYfFNfS4p4lx4JKhTKL2bjv9VaV+NHn?=
 =?us-ascii?Q?Ko5ne+rJA0i2qY+NEMM15dHEx5tYgiddGSIBaWmhdbTQ+AcxoU/+kwEO4dH6?=
 =?us-ascii?Q?HGwzGNn5+2EhDiyVYYSD6n9KdZ744nvgHcDd1TfY8PVMJCltDY6jt9JEiqcK?=
 =?us-ascii?Q?SDUFx3BILEDct6Wf16sYiCH8mCfmpTOtdGkQLWDg0/M+9ep5ofPZP1PIBnAk?=
 =?us-ascii?Q?8rQrJdC56AaZC0QDBgu34h7+4g/OM8JkOIF8VduLcj8LITiiObdxijqWx34n?=
 =?us-ascii?Q?3eSZKzwF8Tt0km1lEGyF7PXQU38/MsVKIpDV09UEqP7HOFPBbK76rMN2G/mY?=
 =?us-ascii?Q?Fck+Vdoj8oJW+tzjRCiFZWVwt6UpLOsB6GKLpb+ml8WyYCeahz+aEGOdcqcz?=
 =?us-ascii?Q?V3uI53HyvZRI9FiC2SECM4U3aauAJUbifewgNaCdw4agscZp45iEf+zEB6hf?=
 =?us-ascii?Q?487Zc6XYK5R4Zk22KLwEbqRdLRYK6Jx5Lo5Uu5UbrZLCmMXnW/A/fa1CE9rH?=
 =?us-ascii?Q?RVfEnZsxApQrzrRVf5Q/Z56LeHk+3KGF1TxNqat/ipp5g4asJIBBuAPBEG6M?=
 =?us-ascii?Q?CYzB2NGG0USkeAbKKRhREf+NFj+syqzlP3U+xK9ou8FCUzK0JRfL3JYpc/LA?=
 =?us-ascii?Q?++LMwtjjWVgJG5r4mOeU+5tkM5NYFRx2hoJlWoHCOqGBCl6ZDO5nnhURTGuG?=
 =?us-ascii?Q?mGDXoWHbKe5BWXf4EhIDE4qEPRVMq9boiMs9Yqf9KDkMHkqApOCsjlnMCBQg?=
 =?us-ascii?Q?ugU0/QTXPTRTcO2982xjzcfXTXZhN1odSPf4/xk+IhmE2CbEl6Wownzyi39w?=
 =?us-ascii?Q?Z7IRPEx+TrLZKonelOVOcnG++vJmSb8NyzZ0wHEOqKP+hpbEfPPYoj3jaZnB?=
 =?us-ascii?Q?Vcl3qiLjxTtvFetGhh0/4J86IdzbtLzfiSGUFdU51KFuM5FdvTORmSzkYQEO?=
 =?us-ascii?Q?fskll94ikeVLg8inLbWEEDbNnE7wp9AgK42WEV23FU1YbBoT4FbZoq35vDxT?=
 =?us-ascii?Q?ZThNqT1X8pHQ3AVK9bHaXgl9EEIqp3dtl4HVoGJQc6n7Tx7+D1sfpHCXL7XE?=
 =?us-ascii?Q?cGOqV4w0jm/gQRgR7xQgpuZqoOp/84xfBn0PBJnM/TWiUworn/7mp1+acsQe?=
 =?us-ascii?Q?vOp6bLLi4Vyiv7YH6OPDYiGPqQry?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PXVL2L1FwZK1zMhaHT4lK5PKQPdPtx/AKp6iznCbVJl6Nf7RCFmIdvh/NYaM?=
 =?us-ascii?Q?ogmkrHIWf8wWJpxL84EsdN0pdbehdS24ynb44+iq/i2CfHQmHkcWrOogqePk?=
 =?us-ascii?Q?WwMk/qck/QsmaKQG6BfmL1UOzaYhazr8YBxbmV1FaHnjVAQcPOypMr0c42KL?=
 =?us-ascii?Q?p1CGqqi2BEDeSSfINoYp60u9W9Mf66L3GHiI7UMBkyy50C5Xe4EJma8sS+dq?=
 =?us-ascii?Q?VKTEvrxYmEhZMHgjUhlCw+gJAld71ZdiMClJaOZwYOLf9HVBqMMkFRcuLxCY?=
 =?us-ascii?Q?4F9N9KXvZgKJ7ewqS2qW4u1Rw9EEkXUmNGo9NplE4SgI9dh0CujHPkOdJ1qd?=
 =?us-ascii?Q?RIiyre1bD8Whauf0m2ide4C7PW+MkU5TrZHLgLvasYkl9o3iDvolUrgQhRBv?=
 =?us-ascii?Q?0zeSdH2VVY/0gpMeL9+W0XVspiIoS6axc/eQCrqOmuQdyQhAgQl2zDTPWMJy?=
 =?us-ascii?Q?xL9+6SghiNavyLcewGWkKTr8ZRgYoYqZD5evA3/KDJYzl/4bhODYZa4wPedC?=
 =?us-ascii?Q?C40RfjQ58dTngc9yMXtg2VktUZYvJ5Hx9PRtgwsjx87RInsSAkIzcC9x815S?=
 =?us-ascii?Q?cyhnVOj2CJQfP+bBjtBo67HiIkofAz0ZDy2Yg4zTdnQWuEZ9lCrrtdCr5q5R?=
 =?us-ascii?Q?dnszs575Ufcwc89H1GZRFrfudvBDEqQjGzEGQN8mwertrGQhJWb3uz4WH1eB?=
 =?us-ascii?Q?CA2kl/UoweKdbhCUr0p9lgqdqIhd+raxid7TbnKfltkUfxexIfnWYnWDkSSH?=
 =?us-ascii?Q?LfTXsoHaWGJIkXd0QMsErXGoQ6iTlyFtLvMRahP/oJ9rzS+O1LhQ/N1NOWNK?=
 =?us-ascii?Q?cmjK/mx9FsoxyNIM/3VCd+2KzLk9R+phRUlrug2uGw7q0cNJ/yJuqtM78gfj?=
 =?us-ascii?Q?evlJr63m+yU7f8JDRQGmUCJDucjqE1wFlPS36SiyXccqgmNEHmiOf2+zqZEF?=
 =?us-ascii?Q?uiliElmCrMfxNbJop2SwvhGK2XodyU8SA6aSwLyu7GKECj/adoKGt3USdIgb?=
 =?us-ascii?Q?PJrxUKa5tH+/bzxSJItdp7MJF0tP4uieZsfREztV2wUcPDIn4N2xLmNBeC6P?=
 =?us-ascii?Q?nS2irPe/cOJ81/kzc7eGo/lCUeXphyPSguZCj8DDQnUX/5WTuyxTejyumQH3?=
 =?us-ascii?Q?23KMFwl9xnXWwh+12+WMs/NVpBAIzJ2OR34Cj3W3SWNDBJDSvthD6SK3AO7E?=
 =?us-ascii?Q?di4oyVM7x27Di05PswuDRZUUbFtjMOKedwYa4LJcO3EZnxMEt/Qy7jUxzY1h?=
 =?us-ascii?Q?Aq0RRqL7eBW1QyBlUL+xziRM9hdqmTjl/op7X9UgKO5urF3M9l6wg5F4bOzi?=
 =?us-ascii?Q?ttcDAzv+p3VAOnpd0ihprkt1E2RUzrwIoQz+iAww5yQWuoe8ryRQLnimHDGl?=
 =?us-ascii?Q?Q4IA9hGLaRvNJceRCUiWErG06RgIpErK6rSPNnKrHP99hzB9oqpvcDIihLEE?=
 =?us-ascii?Q?XoyviTua0OfEIzrOVQMdOQT35yR0biaI+bXAITUhiE8uujSmvxm4HrXqaaQE?=
 =?us-ascii?Q?aMJ5kgd8Drc3YcMB+V5xSmWw3qQsI1B/Ix6QWVAzSaVUizp39s6FG+eynNxl?=
 =?us-ascii?Q?AwP4qwqQKseru2v+SpSnldrViUhiUANzSYq4rtHTR2OC9V0hQ5MC5A1sVE8I?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EqYdcUo+6BJAEgrfmR5Wt6LtOHOx4I45LORQCeCS/bId9YjHeGlzIOv9FSEL9YqjtFHHmMCnXcuT3gCZKc04lbP8+x7RaYXUnji0O1fn/GpBXuUxl9xUAS8oQpyzt0EhFF2RB0QSqYCF17upLc1ySgmoWjcSe1egNF5HZ2vFMiIGW4zJQNClfBAbf1VUj37jX8x2/y00AVdjDtAX/24E+aQY8aer+CIvhJrTCPuquLr54lAR9QAc5peeV+BKyOq45nyShr3pNy1P6HFsx6qZyO3tkYvtqRgEny0GneWvAZ0ocjOrCMc5wc/sI8qqQg3RUoLJnSKlzM10JGHxEOkoGcXrjXhSz1mF+Hi9gJXsez+EYuWh3Aes8G5a/mA3T1MDzgpZN7vWrVJA4Yle875YrqjMS3Jf6R1f1zrzqf7LRoDMd/nDC02imBOhT7n1zZ056GFZhXAPTfmzp2B4DMmgzDBPISPoAf9QCfzku+agyEUPPyiPSCIBXunQQ6x7ktCdnF1HZl83HCHT+s4EIjEq1rrBsbWh73TSB/AUaM/1ELu/J7KMZ6Dfd4Y0DQOINOIkEzYjPja1/f+kFs7as7CbNN7EU0eC+dcK/o3Nu5nHZ3A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ef871f-bb49-49aa-dd61-08dd40911cee
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:16:55.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJughdbP89743OUF7IHnfQoyoCWzdIdMtYBGWLd6UX/ApeZe5KPNUrtHNwZ1Up81pDn4JsXuBDorwfnQWIg+o1e+1uiwJNbFojmpUCfa054=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4919
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290143
X-Proofpoint-GUID: nSyN8DRMfhDOOnlh0lMw3soeOSZ77E4r
X-Proofpoint-ORIG-GUID: nSyN8DRMfhDOOnlh0lMw3soeOSZ77E4r

The adj_start calculation has been a constant source of confusion in the
VMA merge code.

There are two cases to consider, one where we adjust the start of the
vmg->middle VMA (i.e. the vmg->__adjust_middle_start merge flag is set), in
which case adj_start is calculated as:

(1) adj_start = vmg->end - vmg->middle->vm_start

And the case where we adjust the start of the vmg->next VMA (i.e. the
vmg->__adjust_next_start merge flag is set), in which case adj_start is
calculated as:

(2) adj_start = -(vmg->middle->vm_end - vmg->end)

We apply (1) thusly:

vmg->middle->vm_start =
	vmg->middle->vm_start + vmg->end - vmg->middle->vm_start

Which simplifies to:

vmg->middle->vm_start = vmg->end

Similarly, we apply (2) as:

vmg->next->vm_start =
	vmg->next->vm_start + -(vmg->middle->vm_end - vmg->end)

Noting that for these VMAs to be mergeable vmg->middle->vm_end ==
vmg->next->vm_start and so this simplifies to:

vmg->next->vm_start =
	vmg->next->vm_start + -(vmg->next->vm_start - vmg->end)

Which simplifies to:

vmg->next->vm_start = vmg->end

Therefore in each case, we simply need to adjust the start of the VMA to
vmg->end (!) and can do away with this adj_start calculation. The only
caveat is that we must ensure we update the vm_pgoff field correctly.

We therefore abstract this entire calculation to a new function
vmg_adjust_set_range() which performs this calculation and sets the
adjusted VMA's new range using the general vma_set_range() function.

We also must update vma_adjust_trans_huge() which expects the
now-abstracted adj_start parameter. It turns out this is wholly
unnecessary.

In vma_adjust_trans_huge() the relevant code is:

	if (adjust_next > 0) {
		struct vm_area_struct *next = find_vma(vma->vm_mm, vma->vm_end);
		unsigned long nstart = next->vm_start;
		nstart += adjust_next;
		split_huge_pmd_if_needed(next, nstart);
	}

The only case where this is relevant is when vmg->__adjust_middle_start is
specified (in which case adj_next would have been positive), i.e. the one
in which the vma specified is vmg->prev and this the sought 'next' VMA
would be vmg->middle.

We can therefore eliminate the find_vma() invocation altogether and simply
provide the vmg->middle VMA in this instance, or NULL otherwise.

Again we have an adj_next offset calculation:

next->vm_start + vmg->end - vmg->middle->vm_start

Where next == vmg->middle this simplifies to vmg->end as previously
demonstrated.

Therefore nstart is equal to vmg->end, which is already passed to
vma_adjust_trans_huge() via the 'end' parameter and so this code (rather
delightfully) simplifies to:

	if (next)
		split_huge_pmd_if_needed(next, end);

With these changes in place, it becomes silly for commit_merge() to return
vmg->target, as it is always the same and threaded through vmg, so we
finally change commit_merge() to return an error value once again.

This patch has no change in functional behaviour.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/huge_mm.h          |  4 +-
 mm/huge_memory.c                 | 19 ++----
 mm/vma.c                         | 99 +++++++++++++++-----------------
 tools/testing/vma/vma_internal.h |  4 +-
 4 files changed, 57 insertions(+), 69 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 93e509b6c00e..e1bea54820ff 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -404,7 +404,7 @@ int madvise_collapse(struct vm_area_struct *vma,
 		     struct vm_area_struct **prev,
 		     unsigned long start, unsigned long end);
 void vma_adjust_trans_huge(struct vm_area_struct *vma, unsigned long start,
-			   unsigned long end, long adjust_next);
+			   unsigned long end, struct vm_area_struct *next);
 spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma);
 spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma);

@@ -571,7 +571,7 @@ static inline int madvise_collapse(struct vm_area_struct *vma,
 static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
 					 unsigned long start,
 					 unsigned long end,
-					 long adjust_next)
+					 struct vm_area_struct *next)
 {
 }
 static inline int is_swap_pmd(pmd_t pmd)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8d21218dc740..de72713b1c45 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3017,9 +3017,9 @@ static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned
 }

 void vma_adjust_trans_huge(struct vm_area_struct *vma,
-			     unsigned long start,
-			     unsigned long end,
-			     long adjust_next)
+			   unsigned long start,
+			   unsigned long end,
+			   struct vm_area_struct *next)
 {
 	/* Check if we need to split start first. */
 	split_huge_pmd_if_needed(vma, start);
@@ -3027,16 +3027,9 @@ void vma_adjust_trans_huge(struct vm_area_struct *vma,
 	/* Check if we need to split end next. */
 	split_huge_pmd_if_needed(vma, end);

-	/*
-	 * If we're also updating the next vma vm_start,
-	 * check if we need to split it.
-	 */
-	if (adjust_next > 0) {
-		struct vm_area_struct *next = find_vma(vma->vm_mm, vma->vm_end);
-		unsigned long nstart = next->vm_start;
-		nstart += adjust_next;
-		split_huge_pmd_if_needed(next, nstart);
-	}
+	/* If we're incrementing next->vm_start, we might need to split it. */
+	if (next)
+		split_huge_pmd_if_needed(next, end);
 }

 static void unmap_folio(struct folio *folio)
diff --git a/mm/vma.c b/mm/vma.c
index 75bbe82b2e65..39146c19f316 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -513,7 +513,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	init_vma_prep(&vp, vma);
 	vp.insert = new;
 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vma, vma->vm_start, addr, 0);
+	vma_adjust_trans_huge(vma, vma->vm_start, addr, NULL);

 	if (new_below) {
 		vma->vm_start = addr;
@@ -644,46 +644,44 @@ void validate_mm(struct mm_struct *mm)
 #endif /* CONFIG_DEBUG_VM_MAPLE_TREE */

 /*
- * Actually perform the VMA merge operation.
- *
- * On success, returns the merged VMA. Otherwise returns NULL.
+ * Based on the vmg flag indicating whether we need to adjust the vm_start field
+ * for the middle or next VMA, we calculate what the range of the newly adjusted
+ * VMA ought to be, and set the VMA's range accordingly.
  */
-static struct vm_area_struct *commit_merge(struct vma_merge_struct *vmg)
+static void vmg_adjust_set_range(struct vma_merge_struct *vmg)
 {
-	struct vm_area_struct *vma;
-	struct vma_prepare vp;
 	struct vm_area_struct *adjust;
-	long adj_start;
+	pgoff_t pgoff;

-	/*
-	 * If modifying an existing VMA and we don't remove vmg->middle, then we
-	 * shrink the adjacent VMA.
-	 */
 	if (vmg->__adjust_middle_start) {
-		vma = vmg->target;
 		adjust = vmg->middle;
-		/* The POSITIVE value by which we offset vmg->middle->vm_start. */
-		adj_start = vmg->end - vmg->middle->vm_start;
-
-		 /* Note: vma iterator must be pointing to 'start'. */
-		vma_iter_config(vmg->vmi, vmg->start, vmg->end);
+		pgoff = adjust->vm_pgoff + PHYS_PFN(vmg->end - adjust->vm_start);
 	} else if (vmg->__adjust_next_start) {
-		/*
-		 * In this case alone, the VMA we manipulate is vmg->middle, but
-		 * we ultimately return vmg->next.
-		 */
-		vma = vmg->middle;
 		adjust = vmg->next;
-		/* The NEGATIVE value by which we offset vmg->next->vm_start. */
-		adj_start = -(vmg->middle->vm_end - vmg->end);
+		pgoff = adjust->vm_pgoff - PHYS_PFN(adjust->vm_start - vmg->end);
+	} else {
+		return;
+	}
+
+	vma_set_range(adjust, vmg->end, adjust->vm_end, pgoff);
+}
+
+/*
+ * Actually perform the VMA merge operation.
+ *
+ * Returns 0 on success, or an error value on failure.
+ */
+static int commit_merge(struct vma_merge_struct *vmg)
+{
+	struct vm_area_struct *vma;
+	struct vma_prepare vp;

-		vma_iter_config(vmg->vmi, vmg->next->vm_start + adj_start,
-				vmg->next->vm_end);
+	if (vmg->__adjust_next_start) {
+		/* We manipulate middle and adjust next, which is the target. */
+		vma = vmg->middle;
+		vma_iter_config(vmg->vmi, vmg->end, vmg->next->vm_end);
 	} else {
 		vma = vmg->target;
-		adjust = NULL;
-		adj_start = 0;
-
 		 /* Note: vma iterator must be pointing to 'start'. */
 		vma_iter_config(vmg->vmi, vmg->start, vmg->end);
 	}
@@ -691,22 +689,22 @@ static struct vm_area_struct *commit_merge(struct vma_merge_struct *vmg)
 	init_multi_vma_prep(&vp, vma, vmg);

 	if (vma_iter_prealloc(vmg->vmi, vma))
-		return NULL;
+		return -ENOMEM;

 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vma, vmg->start, vmg->end, adj_start);
+	/*
+	 * THP pages may need to do additional splits if we increase
+	 * middle->vm_start.
+	 */
+	vma_adjust_trans_huge(vma, vmg->start, vmg->end,
+			      vmg->__adjust_middle_start ? vmg->middle : NULL);
 	vma_set_range(vma, vmg->start, vmg->end, vmg->pgoff);
-
-	if (adj_start) {
-		adjust->vm_start += adj_start;
-		adjust->vm_pgoff += PHYS_PFN(adj_start);
-	}
-
+	vmg_adjust_set_range(vmg);
 	vma_iter_store(vmg->vmi, vmg->target);

 	vma_complete(&vp, vmg->vmi, vma->vm_mm);

-	return vmg->target;
+	return 0;
 }

 /* We can only remove VMAs when merging if they do not have a close hook. */
@@ -749,7 +747,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 {
 	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *prev = vmg->prev;
-	struct vm_area_struct *next, *res;
+	struct vm_area_struct *next;
 	struct vm_area_struct *anon_dup = NULL;
 	unsigned long start = vmg->start;
 	unsigned long end = vmg->end;
@@ -900,12 +898,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 			vmg->end = next->vm_end;
 			vmg->pgoff = next->vm_pgoff - pglen;
 		} else {
-			/*
-			 * We shrink middle and expand next.
-			 *
-			 * IMPORTANT: This is the ONLY case where the final
-			 * merged VMA is NOT vmg->target, but rather vmg->next.
-			 */
+			/* We shrink middle and expand next. */
 			vmg->__adjust_next_start = true;
 			vmg->start = middle->vm_start;
 			vmg->end = start;
@@ -918,8 +911,10 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	if (err)
 		goto abort;

-	res = commit_merge(vmg);
-	if (!res) {
+	err = commit_merge(vmg);
+	if (err) {
+		VM_WARN_ON(err != -ENOMEM);
+
 		if (anon_dup)
 			unlink_anon_vmas(anon_dup);

@@ -927,9 +922,9 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		return NULL;
 	}

-	khugepaged_enter_vma(res, vmg->flags);
+	khugepaged_enter_vma(vmg->target, vmg->flags);
 	vmg->state = VMA_MERGE_SUCCESS;
-	return res;
+	return vmg->target;

 abort:
 	vma_iter_set(vmg->vmi, start);
@@ -1092,7 +1087,7 @@ int vma_expand(struct vma_merge_struct *vmg)
 	if (remove_next)
 		vmg->__remove_next = true;

-	if (!commit_merge(vmg))
+	if (commit_merge(vmg))
 		goto nomem;

 	return 0;
@@ -1132,7 +1127,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,

 	init_vma_prep(&vp, vma);
 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vma, start, end, 0);
+	vma_adjust_trans_huge(vma, start, end, NULL);

 	vma_iter_clear(vmi);
 	vma_set_range(vma, start, end, pgoff);
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 1eae23039854..bb273927af0f 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -796,12 +796,12 @@ static inline void vma_start_write(struct vm_area_struct *vma)
 static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
 					 unsigned long start,
 					 unsigned long end,
-					 long adjust_next)
+					 struct vm_area_struct *next)
 {
 	(void)vma;
 	(void)start;
 	(void)end;
-	(void)adjust_next;
+	(void)next;
 }

 static inline void vma_iter_free(struct vma_iterator *vmi)
--
2.48.1
