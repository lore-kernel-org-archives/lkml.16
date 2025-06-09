Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D75258CED
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475720; cv=fail; b=o6d1qd/ccnf2dx1MTxrjDntU5BOBahD8dRd9c4sLpb/ouQxV20b7gje7whs17Vzfw9a6Kkf/A+uxOwLF/GGP7bkwwm+x1saPw2qAwf0N/KE+vvr2F334vs+VuPVzh7c24Afd1iQF5hT2j239pBy1yQ8tkBPa517t1xxHYd2xVEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475720; c=relaxed/simple;
	bh=pPI1vmYeUYrc5+YozPFLzNI5agegrnsYCWVDOXPURqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/EKBi/DHJAkmg9SR7dqpd4vSOkRowCz44rxw5XwQg6mZturtNS7hqI7GzlwzqJPqMl6Pu1qhQXuKV7rJmJt2+G34KTuztXtc2JYaYU7HLDbC1wcRokFr4ip2uDvm1qmmm9eGL1uO9S7/LZUNDSPsO1oiAgL575x9qu6ghKic7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lLdaOQpQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=K4eSEkBA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lLdaOQpQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="K4eSEkBA"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593fkpN008071;
	Mon, 9 Jun 2025 13:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=55AlPUUE8TEbDwrhF3KgcH9bxqg16uTOTWsEfqmFR6s=; b=
	lLdaOQpQOM/nm5ULvaoth5rslVFvnLREebdTv8UhfQOJ28PmApENuuRG1PxaI830
	y9ceM6t7Vkq8Kt+M764cDt+8X3MsDicsdMPY5mI82ym2c/zX3qU+4keKkPjkD429
	K/ncPLNxeHVVW+02ixRJm+pJZjhVEtLC4rbnEu11U/1RSdXzKosJRvdYkmosGC1X
	fFp73+z3ewloZR6SofZL4EblVVJ8OgKIg42mjtcXYCqUDoh49K70Yao1V7T1NAzx
	FbtidjFgqNzGuw51gORUmGHyrMASzl7zbgWWW1OEnk8WaIhdLIp22WrnllxOlnJD
	oN4feAs/KI80MZel8cEmdw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14a4k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559C49LQ020697;
	Mon, 9 Jun 2025 13:27:17 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv85t3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKWQZTXpuGezv5bj9p024O4Rrrp+nUUtDIdGqeOSr1RU3sFd+fVSz0rFtq/aFORlgj/XnRhpAIXw5vbhjx028kgvxRrZD1b7EBEoCfMqqR/33/D2KYjUwkpxTkUKwAbK2Vbn011naSAsalt4MPmJBV7g/zkmLR144IyB7Q8d+GzK8m4oFXO/Xr5vmis95QeHF6otAepYYMCOTo2FZ3yrJwGSkVqj+q/zOJ/qak/AHO5RTHO66EyZN7EDkeOO8FIIwRTGkiipzkGgF0OUgWMZVh8xE1mWBJ6WDXte0nhTjmab3IcyWF/yZ2GPGbuWNFoh6q9gfOLpd66NV1yWku7i6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55AlPUUE8TEbDwrhF3KgcH9bxqg16uTOTWsEfqmFR6s=;
 b=Yx+EJyqHt1Vru+j8jGWsC/YVTa5/ymoux5LjGoK8Yn865DI+JAYZva+MtxNwfc/sfYfX28B8X2QK84OgD2a42EHjHt9kmigCkw7QN8LeaA+rOHL4tvqsXw2dJgow6bcoD1ztbRLVc8YmhBkyZs+3oadgRmB8P9+10Fq7Gh83Y0XpqrE60Pf7LxZTjL8XkNPZzVavYUDwAHad93vL5lCaZJcl35UA8kA6qagHv1Qj5Jfk8HiEq9B68dAZgyV/JO8EUnfvBB+YZ/04F7BI2medi0pGVkKlSHwIMW93Peq0Q+a4xmBOVuQf+ONOERxFFfkcXw9fKFTVN/gKl4z7hBIo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55AlPUUE8TEbDwrhF3KgcH9bxqg16uTOTWsEfqmFR6s=;
 b=K4eSEkBA6eOLPrvNGGt3ZmjyV9MTwb/H6TzKDAEL3dBo2trznLNOpqtOY0JpZ8LF2VABiOADHR8PCnaNjMtHB8ebXGtajwiYwVepDP8duk62a2xCmPpKP4BzAbVEzTN/9jJXQicqjjMv0AAFYyWq3ahCKflMky00hY0VAgTV2p0=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DM3PR10MB7947.namprd10.prod.outlook.com (2603:10b6:0:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 13:27:14 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:14 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] tools/testing/selftests: expand mremap() tests for MREMAP_RELOCATE_ANON
Date: Mon,  9 Jun 2025 14:26:42 +0100
Message-ID: <25ed4f20f8874db9a496539aa9793013d22de06d.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::12) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DM3PR10MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ccfbda-b6ef-47a6-4a91-08dda7595933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o6vlSI90d+pI3eg+6UDBNdq8g0BwoeQlOms2IGn6JyHdIvSEfq1DlJJgqa1k?=
 =?us-ascii?Q?LkrrhW94G8kK3eLA/8EhgwCc4zl2lHCdMV4QzaG0ulQAhuBypx8Y572efkeX?=
 =?us-ascii?Q?O63gUnv5IZbA2TWMbASYpAHMHYqsHAalTnEBoEff01gHA9rq0joTRpcgm4U0?=
 =?us-ascii?Q?Zkv7IKm/TwlpYccQeVy5BxPB6fjr3aF6ZiVcFTW+HGa8AMsbC5P5iOomHemt?=
 =?us-ascii?Q?h7X4okPsIJNcnDlfeMO9lbxFwvVrLIFP1hpv/e2f1OOkQ2idvhoDk/ei4R5J?=
 =?us-ascii?Q?tUIa2uWYcjwbZ+Wr/2mTY8KeM728V64vzzb2K3af5BuxhgxpVQTDVm3DpAJu?=
 =?us-ascii?Q?/fxYbDonT6R1V0/aiew+FKgALjSVu6dZRPFu3oJ1BVmDjTBxlsewS23LarPd?=
 =?us-ascii?Q?3T6uJoFgmgjmqtTbAI+yB+F/FFM1Moqa7P3ZXrVxzJJ0h5Gjeqkv4Yd8Qq/Y?=
 =?us-ascii?Q?7m3R3ITfiSpLZ3F5a5J4s0jcRs9+5HI4Z5Ndv4eKEDd7MX5hdoCQaxkrW2uy?=
 =?us-ascii?Q?fnnyU56EVKfgVz3wrlCHrPER9pQp4pdRV5fi46bgKl6uVCXJcBBi1MyXRqPl?=
 =?us-ascii?Q?VFsLdFQolTfk09a3NY4wLVK3vapwEKAXZTSi/P352nddfrJZmGg8XXCPjS9T?=
 =?us-ascii?Q?Ho5JwY8SwgIZLB1PQRiE18W0Lx4PQT8yvxPsq1sjBL74EFkSFxxB9+qMCh/o?=
 =?us-ascii?Q?g1Ez00XjHV+kFTlzq+6DJKeTqgyWE0ngE/IMlYUr90gt23DO4iBmyyS95bFu?=
 =?us-ascii?Q?W4ne6tEPTfP8G1RV3PRvKD4WE7Rk1n36s9w//IqqzLu2Ar3+bxnDeiikKPjB?=
 =?us-ascii?Q?YK7HzblpaC2NgXXY43jowhkrdZXQg48UYYcSi/RVSVGS2zkUY+KGClWm6KEF?=
 =?us-ascii?Q?ZcBNzFS/kTZjzt7r8poxqg87lxoBzwL1fyd305/t7UW+1HqfPd6dn2uFQJDE?=
 =?us-ascii?Q?Ymi3AuymgZX9uXoBkpJAMZSo2S0A4uHbAOl9rDpLcmgNq33919BCF014rUGW?=
 =?us-ascii?Q?vc8ZuOrFSXPznhD8F2Z9sLr5Fh9jNmAejSLip+AVDg/BneHnfGeux1NBVHY/?=
 =?us-ascii?Q?4AyEtiFpCaSPGvtoJ9mbGBcjiTsnEJ44UkkVQUmNgp88vzgnYeSYHi79cju/?=
 =?us-ascii?Q?yBw9b/jPQISuw0HDPzzbzhz7FBntdlhgET5EsJ9zP7rEg34nAlR0rCRrai7n?=
 =?us-ascii?Q?KjvueD536OxEP2PaCyBWc77DESW16SYLQJjXvUSd0UV47V5XPpG6YGpFJnFi?=
 =?us-ascii?Q?cxZ5gxMnPmb3gJNtsuEo/fee6rDiSlnPaf8DbOpQkLuJqyoBgg6g7GTVvfEm?=
 =?us-ascii?Q?h1vaC/nQ0fW+vSPXqWGq2ma7Kyuu+Fv3FSQarXI8AVJ8RSdv00HDse2xDqVi?=
 =?us-ascii?Q?M1NMWhPTxUcQjrnqiFxQWouE68EeJrnrS2CeK88sTrXZskvA+FXrZNZ6XODl?=
 =?us-ascii?Q?7xN0CEwyS30=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5CtxvD52+0ZfEb9aGJl1ulbSmF290ZfwfiTpISkXXtrcFZXqk+96LbQjjEme?=
 =?us-ascii?Q?8xRERi4rBZCk14Pzl3/vJXs6iY/X4zbCUhUbQq9yhn9ky8qbAwcuJjX6O9JU?=
 =?us-ascii?Q?ebE6qmhofVubeEwEypToN+CzB1pmnn4g6NvfVCSiIqayXcyUdjXTOCOLSKVa?=
 =?us-ascii?Q?bnIfSC/03QIuB8LUCXhOvM6bwnEJ8xTr1/0CFkKp+8l/VQg2XAbImemeeJCX?=
 =?us-ascii?Q?bWoCHKMDUfq5ehyvH9UYziOoDJJIWgeeDMTpwM/OzpcuPbNJPB5jtXOjspag?=
 =?us-ascii?Q?erpa3MjgKA80u7FnypN1pVRLSt/7OLaL5v4AogSDHIK2wOfFESGGE+v+AkDO?=
 =?us-ascii?Q?Fh8EhCZka9JCX7ksbJREkm4W92p3jYD/eA7h+UbmoJm6fSnx4+sFzWaKJqXp?=
 =?us-ascii?Q?s7BeZEbyEmtalVRHHTUjNC5pktJZN1QRZGRhR4a0Ah8JSxxzETDKTHuCcE8W?=
 =?us-ascii?Q?sko9LIU1otDfuc9a+SR5SJR2vn7PKVAqKdcbC/B9LjToD7LnHo8YUlczifNI?=
 =?us-ascii?Q?B7im0YwaYtVME/BtudhqReJUM+Pjakx5LT0LN+NJ+6zZOVCsbSGxBFLvs3ys?=
 =?us-ascii?Q?yfK3inCcC89QuIMHDcL2x4/9qrGAL0JDWhUvUSO6dUynOF1mCy7pbkgtuys5?=
 =?us-ascii?Q?Srw5fLtnsz0lfBhjR3fY0rDclMW7rgD9PiYfmx7ba6fidmm1HxkXsy8dfwgz?=
 =?us-ascii?Q?o6mWJRXIC7t+qq0Edz6lr2zfPWsiAvmE10bHZjsHZ/tT3URGrEY5VmE6iaS2?=
 =?us-ascii?Q?FAfP2WHEe00kJzx3slnjM1CFLOYvjEY/uZxGmZUgSSr/2aMgxdszD4yKoqKx?=
 =?us-ascii?Q?qSl/FuchxuL5kUenAG3A0LUPwKQ/sDlsP7C+mRr9a1OyWV10YIray5ArQZ94?=
 =?us-ascii?Q?TFMMmIQpQVxsJYaKDgYq8o8cgzMax2Lhsn5R24AKRCu90ni9Mn2nVF3bbdwP?=
 =?us-ascii?Q?AbmFUAA4ZrpQ68/uwX1V9sbRAe0KibVqw1EL4vCmoaTZMdoFxi/udJw/o5tC?=
 =?us-ascii?Q?/cHoBEbJNyVRqvIhQsv0wzIXahyD/9gpE8032WCx7os3chhkX6blyVE1vqnh?=
 =?us-ascii?Q?X3AfN/R8FdyDq7Gwtk5+j0PUA2H6d6eLdUi24ktW1XYYnsJ6dc07bsIZwzAY?=
 =?us-ascii?Q?Oinj8zm4ASNhmyCgBTF86vi1VJsA/91PD3uzhOdVdO1JOtXYKXuSvHfwYm1x?=
 =?us-ascii?Q?jJ87Nk4fZ8k6GYI/mFmp2WvuilOpRJMxXPTbEfdUgCTyM40PBfetqnTImFbf?=
 =?us-ascii?Q?jetGOvyB1fTwfKUaGu1P0s77tTxxQim5tphSfrN3w/HceTrMI6k3ndtXK1FU?=
 =?us-ascii?Q?QyC/KtY+c8cFHPy7nzH+5i6rTfgVY4jmzMC2zPDWQ2S71NnLHaEGFIvpuau3?=
 =?us-ascii?Q?puGI6mQoq7PiDmOTXP86AvqfI4SIi+T5qdK7FrMU0CIbfTTSB5Mc9h0v0qMJ?=
 =?us-ascii?Q?jMME+Fj75FZNhgG9ObarHiilCns7OBdgbQ8+dBSPZ+xuZqpryJcAaITVMQGh?=
 =?us-ascii?Q?w4s1izWIL6AgZ06StDBv7hlcPl10xtXFwuSi2cOLUpxTnk7qVctWHFAkTHlM?=
 =?us-ascii?Q?++4Z3InyczGIlNsjIJeTHZt7u7AZaJOUoJiHFaTwHwlLl8vWmhckHRnRCm7I?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WYVP/KfHXdOG6AvWbsPAGbnkB8uaERfCPrNdT76+PyQs0xvocD2cxxUofKB5JreIOjtK1ipL+Cjj/ouGQWarivC3J80CX+zGhEhw/jtVPCn0zQqdgAk/ktpFOVN2XtetkNOpw1wXvZ6hR5es19enI7J2QfEDdWPlMLWjvymQiJlZYHPYGkPFpSrwo9Zx9Km6eqAamlLBFpD0TDlEBqsMZ6iXeVwXWWrYGGztG+x8GkJ8bhPP9mwnKww4NTHAfWqbcbcbeQFuMIQtE2NfbKa/GfqiGKnLvu7ZiiA2T2SiawDacUSKpAvZqKp0sYv97eycfutwuU3SA9iWwX0Ax69Xla7PFLukz++t9j2IhgXgFqjtvkEjLanCPyyD1BRggRaNkpdT9GDNUyMm0vJyHVOyzkKz1s53x/gQRtRmjyfttde11MOphxk0ezV0nR1VIvIfkaPUVMBKJ8yl88o25vyuJYOzPu8voAHjzuSnfaViSXxeXjJe8xViRbEHd2XcJhrsIXaK0Her9d4ipnEYdBiROyX1fTBMZhuIGNQFrc/sJrRbioJSG0VIHgyrBvKBeM6qpKEC5jhmblWcRC0xiURo2kpoAMYDFBcBSqIdGp4nBuI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ccfbda-b6ef-47a6-4a91-08dda7595933
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:14.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyKV01d7yP7nh1lCkpDvJaXBJ9qu10TgTv4r+cM/2Fl/PR5k8lAjNDcz/oDzBbSiFN/1GNmiaz8e4Vd/qjTcy4ZI8OtKieSsTTMhlQMi6Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7947
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Proofpoint-GUID: fg6FNAgMsoysaAqM7bIn7XN3hDHL5gBK
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6846e137 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=R-bQzvCybzszNUzdUgsA:9 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfX8sCqmTr6bXvo ZQNd5+ZoNeQ4JHggt6rkdQHmPvgsSEEaqI1mTb8OML/PUFIbR0uEffy+4C1LLQxgoEhJe1k8xPZ uZPavtb6orJMRB0Ie7DaOBdOTvKxrlhiYqAxgwHDtOnntDZKRZUdgbagaE3Ai7uoU4qK8w9M8Bu
 fbVSpciTszVw6V9Li0UygThDyoXaypMhWlASpXjQjPAC8Est0VaWASDsp3KoHXJPV8Y5iN56w76 xv6apPBIxYV4Mrvq2Sp8v65RWM6i683qGpAq1anLHfYbhYJFFyoHpy16oZTLSTQIC6oBL8lNF2W BSzxp0dbkjNQuNf16rRih0lxYqYvAmWM47pp4VorkTyiNlQOVw7+Youhh5Eu+FcYoLViwQJ3ykB
 dTYgrXspRmzwmZkG3hS7br5tf6HDuBIJ8MIN2iMMJhUuQ34RZoK8Jd/elgZTT1zN0GfBDUdW
X-Proofpoint-ORIG-GUID: fg6FNAgMsoysaAqM7bIn7XN3hDHL5gBK

Adjust every relevant test (that is, one that moves memory) to also perform
the same test using MREMAP_MUST_RELOCATE_ANON to assert that it is behaving
as expected.

In order to avoid glibc not being up-to-date, also move to using the
mremap() system call direct, and import the linux/mman.h header, which will
use the tool linux header wrappers, to get the latest mremap defines.

Also take careful precaution in the instance where we might unexpectedly
fail the 'mremap move within range' test due to large folios mapped outside
of the range we are relocating.

In these instances, if we test with MREMAP_MUST_RELOCATE_ANON, we ensure
the folios in question are not huge. If testing with MREMAP_RELOCATE_ANON
we do not - this asserts that this correctly falls back to non-relocate
anon behaviour.

In cases where MREMAP_MUST_RELOCATE_ANON is used, we attempt to immediately
trigger reclaim to also assert that the rmap state is uncorrupted.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/mremap_test.c | 262 +++++++++++++++--------
 1 file changed, 168 insertions(+), 94 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index bb84476a177f..5d6ff0d1da7d 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -8,11 +8,13 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
+#include <linux/mman.h>
 #include <sys/mman.h>
 #include <time.h>
 #include <stdbool.h>
 
 #include "../kselftest.h"
+#include "vm_util.h"
 
 #define EXPECT_SUCCESS 0
 #define EXPECT_FAILURE 1
@@ -34,6 +36,7 @@ struct config {
 	unsigned long long dest_alignment;
 	unsigned long long region_size;
 	int overlapping;
+	bool use_relocate_anon;
 	unsigned int dest_preamble_size;
 };
 
@@ -60,7 +63,8 @@ enum {
 #define PTE page_size
 
 #define MAKE_TEST(source_align, destination_align, size,	\
-		  overlaps, should_fail, test_name)		\
+		  overlaps, use_relocate_anon, should_fail,	\
+		  test_name)					\
 (struct test){							\
 	.name = test_name,					\
 	.config = {						\
@@ -68,6 +72,7 @@ enum {
 		.dest_alignment = destination_align,		\
 		.region_size = size,				\
 		.overlapping = overlaps,			\
+		.use_relocate_anon = use_relocate_anon,		\
 	},							\
 	.expect_failure = should_fail				\
 }
@@ -184,6 +189,12 @@ static void *get_source_mapping(struct config c)
 	unsigned long long addr = 0ULL;
 	void *src_addr = NULL;
 	unsigned long long mmap_min_addr;
+	int mmap_flags = MAP_FIXED_NOREPLACE | MAP_ANONYMOUS;
+
+	if (c.use_relocate_anon)
+		mmap_flags |= MAP_PRIVATE;
+	else
+		mmap_flags |= MAP_SHARED;
 
 	mmap_min_addr = get_mmap_min_addr();
 	/*
@@ -198,8 +209,7 @@ static void *get_source_mapping(struct config c)
 		goto retry;
 
 	src_addr = mmap((void *) addr, c.region_size, PROT_READ | PROT_WRITE,
-					MAP_FIXED_NOREPLACE | MAP_ANONYMOUS | MAP_SHARED,
-					-1, 0);
+					mmap_flags, -1, 0);
 	if (src_addr == MAP_FAILED) {
 		if (errno == EPERM || errno == EEXIST)
 			goto retry;
@@ -251,7 +261,7 @@ static void mremap_expand_merge(FILE *maps_fp, unsigned long page_size)
 	}
 
 	munmap(start + page_size, page_size);
-	remap = mremap(start, page_size, 2 * page_size, 0);
+	remap = sys_mremap(start, page_size, 2 * page_size, 0, 0);
 	if (remap == MAP_FAILED) {
 		ksft_print_msg("mremap failed: %s\n", strerror(errno));
 		munmap(start, page_size);
@@ -292,7 +302,8 @@ static void mremap_expand_merge_offset(FILE *maps_fp, unsigned long page_size)
 
 	/* Unmap final page to ensure we have space to expand. */
 	munmap(start + 2 * page_size, page_size);
-	remap = mremap(start + page_size, page_size, 2 * page_size, 0);
+
+	remap = sys_mremap(start + page_size, page_size, 2 * page_size, 0, 0);
 	if (remap == MAP_FAILED) {
 		ksft_print_msg("mremap failed: %s\n", strerror(errno));
 		munmap(start, 2 * page_size);
@@ -324,20 +335,35 @@ static void mremap_expand_merge_offset(FILE *maps_fp, unsigned long page_size)
  *
  * |DDDDddddSSSSssss|
  */
-static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
+static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr,
+				     char *test_suffix, int extra_flags)
 {
 	char *test_name = "mremap mremap move within range";
 	void *src, *dest;
 	unsigned int i, success = 1;
-
 	size_t size = SIZE_MB(20);
 	void *ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	int mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+
 	if (ptr == MAP_FAILED) {
 		perror("mmap");
 		success = 0;
 		goto out;
 	}
+
+	/*
+	 * If THP is enabled, we may end up spanning a range which has large
+	 * folios not enclosed within the mapping, which will disallow the
+	 * relocate.
+	 *
+	 * In this case, disallow huge pages in the range.
+	 */
+	if (extra_flags & MREMAP_MUST_RELOCATE_ANON)
+		madvise(ptr, size, MADV_NOHUGEPAGE);
+
+	mremap_flags |= extra_flags;
+
 	memset(ptr, 0, size);
 
 	src = ptr + SIZE_MB(6);
@@ -348,8 +374,8 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 
 	dest = src - SIZE_MB(2);
 
-	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
-						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
+	void *new_ptr = sys_mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
+				   mremap_flags, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
 		perror("mremap");
 		success = 0;
@@ -375,9 +401,9 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 		perror("munmap");
 
 	if (success)
-		ksft_test_result_pass("%s\n", test_name);
+		ksft_test_result_pass("%s%s\n", test_name, test_suffix);
 	else
-		ksft_test_result_fail("%s\n", test_name);
+		ksft_test_result_fail("%s%s\n", test_name, test_suffix);
 }
 
 /* Returns the time taken for the remap on success else returns -1. */
@@ -390,6 +416,10 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	long long  start_ns, end_ns, align_mask, ret, offset;
 	unsigned long long threshold;
 	unsigned long num_chunks;
+	int mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+
+	if (c.use_relocate_anon)
+		mremap_flags |= MREMAP_MUST_RELOCATE_ANON;
 
 	if (threshold_mb == VALIDATION_NO_THRESHOLD)
 		threshold = c.region_size;
@@ -431,10 +461,15 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	}
 
 	if (c.dest_preamble_size) {
+		int mmap_flags = MAP_FIXED_NOREPLACE | MAP_ANONYMOUS;
+
+		if (c.use_relocate_anon)
+			mmap_flags |= MAP_PRIVATE;
+		else
+			mmap_flags |= MAP_SHARED;
+
 		dest_preamble_addr = mmap((void *) addr - c.dest_preamble_size, c.dest_preamble_size,
-					  PROT_READ | PROT_WRITE,
-					  MAP_FIXED_NOREPLACE | MAP_ANONYMOUS | MAP_SHARED,
-							-1, 0);
+					  PROT_READ | PROT_WRITE, mmap_flags, -1, 0);
 		if (dest_preamble_addr == MAP_FAILED) {
 			ksft_print_msg("Failed to map dest preamble region: %s\n",
 					strerror(errno));
@@ -447,8 +482,8 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	}
 
 	clock_gettime(CLOCK_MONOTONIC, &t_start);
-	dest_addr = mremap(src_addr, c.region_size, c.region_size,
-					  MREMAP_MAYMOVE|MREMAP_FIXED, (char *) addr);
+	dest_addr = sys_mremap(src_addr, c.region_size, c.region_size,
+			       mremap_flags, (char *) addr);
 	clock_gettime(CLOCK_MONOTONIC, &t_end);
 
 	if (dest_addr == MAP_FAILED) {
@@ -549,6 +584,10 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
  * subsequent tests. So we clean up mappings after each test.
  */
 clean_up_dest:
+	/* Trigger reclaim to assert that adjusted rmap state is valid. */
+	if (c.use_relocate_anon)
+		madvise(dest_addr, c.region_size, MADV_PAGEOUT);
+
 	munmap(dest_addr, c.region_size);
 clean_up_dest_preamble:
 	if (c.dest_preamble_size && dest_preamble_addr)
@@ -565,16 +604,19 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
  * down address landed on a mapping that maybe does not exist.
  */
 static void mremap_move_1mb_from_start(unsigned int pattern_seed,
-				       char *rand_addr)
+				       char *rand_addr, char *test_suffix,
+				       int extra_flags)
 {
 	char *test_name = "mremap move 1mb from start at 1MB+256KB aligned src";
 	void *src = NULL, *dest = NULL;
 	unsigned int i, success = 1;
-
+	int mremap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
 	/* Config to reuse get_source_mapping() to do an aligned mmap. */
 	struct config c = {
 		.src_alignment = SIZE_MB(1) + SIZE_KB(256),
-		.region_size = SIZE_MB(6)
+		.region_size = SIZE_MB(6),
+		.use_relocate_anon = extra_flags & (MREMAP_RELOCATE_ANON |
+						    MREMAP_MUST_RELOCATE_ANON),
 	};
 
 	src = get_source_mapping(c);
@@ -583,6 +625,12 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 		goto out;
 	}
 
+	/* See comment in mremap_move_within_range(). */
+	if (extra_flags & MREMAP_MUST_RELOCATE_ANON)
+		madvise(src, c.region_size, MADV_NOHUGEPAGE);
+
+	mremap_flags |= extra_flags;
+
 	c.src_alignment = SIZE_MB(1) + SIZE_KB(256);
 	dest = get_source_mapping(c);
 	if (!dest) {
@@ -599,8 +647,8 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 	 */
 	munmap(dest, SIZE_MB(1));
 
-	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
-						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
+	void *new_ptr = sys_mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
+				   mremap_flags, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
 		perror("mremap");
 		success = 0;
@@ -629,9 +677,10 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 		perror("munmap dest");
 
 	if (success)
-		ksft_test_result_pass("%s\n", test_name);
+		ksft_test_result_pass("%s%s\n", test_name, test_suffix);
+
 	else
-		ksft_test_result_fail("%s\n", test_name);
+		ksft_test_result_fail("%s%s\n", test_name, test_suffix);
 }
 
 static void run_mremap_test_case(struct test test_case, int *failures,
@@ -640,13 +689,17 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 {
 	long long remap_time = remap_region(test_case.config, threshold_mb,
 					    rand_addr);
+	char *relocate_anon_suffix = " [MREMAP_MUST_RELOCATE_ANON]";
+	struct config *c = &test_case.config;
 
 	if (remap_time < 0) {
 		if (test_case.expect_failure)
-			ksft_test_result_xfail("%s\n\tExpected mremap failure\n",
-					      test_case.name);
+			ksft_test_result_xfail("%s%s\n\tExpected mremap failure\n",
+					       test_case.name,
+					       c->use_relocate_anon ? relocate_anon_suffix : "");
 		else {
-			ksft_test_result_fail("%s\n", test_case.name);
+			ksft_test_result_fail("%s%s\n", test_case.name,
+					      c->use_relocate_anon ? relocate_anon_suffix : "");
 			*failures += 1;
 		}
 	} else {
@@ -656,10 +709,13 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 		 */
 		if (threshold_mb == VALIDATION_NO_THRESHOLD ||
 		    test_case.config.region_size <= threshold_mb * _1MB)
-			ksft_test_result_pass("%s\n\tmremap time: %12lldns\n",
-					      test_case.name, remap_time);
+			ksft_test_result_pass("%s%s\n\tmremap time: %12lldns\n",
+					      test_case.name,
+					      c->use_relocate_anon ? relocate_anon_suffix : "",
+					      remap_time);
 		else
-			ksft_test_result_pass("%s\n", test_case.name);
+			ksft_test_result_pass("%s%s\n", test_case.name,
+					      c->use_relocate_anon ? relocate_anon_suffix : "");
 	}
 }
 
@@ -703,8 +759,8 @@ static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
 	return 0;
 }
 
-#define MAX_TEST 15
-#define MAX_PERF_TEST 3
+#define MAX_TEST 30
+#define MAX_PERF_TEST 6
 int main(int argc, char **argv)
 {
 	int failures = 0;
@@ -721,12 +777,15 @@ int main(int argc, char **argv)
 	char *rand_addr;
 	size_t rand_size;
 	int num_expand_tests = 2;
-	int num_misc_tests = 2;
+	int num_misc_tests = 6;
 	struct test test_cases[MAX_TEST] = {};
 	struct test perf_test_cases[MAX_PERF_TEST];
 	int page_size;
 	time_t t;
 	FILE *maps_fp;
+	bool use_relocate_anon = false;
+	struct test *test_case = test_cases;
+	struct test *perf_test_case = perf_test_cases;
 
 	pattern_seed = (unsigned int) time(&t);
 
@@ -763,66 +822,71 @@ int main(int argc, char **argv)
 
 	page_size = sysconf(_SC_PAGESIZE);
 
-	/* Expected mremap failures */
-	test_cases[0] =	MAKE_TEST(page_size, page_size, page_size,
-				  OVERLAPPING, EXPECT_FAILURE,
-				  "mremap - Source and Destination Regions Overlapping");
-
-	test_cases[1] = MAKE_TEST(page_size, page_size/4, page_size,
-				  NON_OVERLAPPING, EXPECT_FAILURE,
-				  "mremap - Destination Address Misaligned (1KB-aligned)");
-	test_cases[2] = MAKE_TEST(page_size/4, page_size, page_size,
-				  NON_OVERLAPPING, EXPECT_FAILURE,
-				  "mremap - Source Address Misaligned (1KB-aligned)");
-
-	/* Src addr PTE aligned */
-	test_cases[3] = MAKE_TEST(PTE, PTE, PTE * 2,
-				  NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "8KB mremap - Source PTE-aligned, Destination PTE-aligned");
-
-	/* Src addr 1MB aligned */
-	test_cases[4] = MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned");
-	test_cases[5] = MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
-
-	/* Src addr PMD aligned */
-	test_cases[6] = MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "4MB mremap - Source PMD-aligned, Destination PTE-aligned");
-	test_cases[7] =	MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned");
-	test_cases[8] = MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "4MB mremap - Source PMD-aligned, Destination PMD-aligned");
-
-	/* Src addr PUD aligned */
-	test_cases[9] = MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "2GB mremap - Source PUD-aligned, Destination PTE-aligned");
-	test_cases[10] = MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				   "2GB mremap - Source PUD-aligned, Destination 1MB-aligned");
-	test_cases[11] = MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				   "2GB mremap - Source PUD-aligned, Destination PMD-aligned");
-	test_cases[12] = MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				   "2GB mremap - Source PUD-aligned, Destination PUD-aligned");
-
-	/* Src and Dest addr 1MB aligned. 5MB mremap. */
-	test_cases[13] = MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "5MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
-
-	/* Src and Dest addr 1MB aligned. 5MB mremap. */
-	test_cases[14] = MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				  "5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble");
-	test_cases[14].config.dest_preamble_size = 10 * _4MB;
-
-	perf_test_cases[0] =  MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-					"1GB mremap - Source PTE-aligned, Destination PTE-aligned");
-	/*
-	 * mremap 1GB region - Page table level aligned time
-	 * comparison.
-	 */
-	perf_test_cases[1] = MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				       "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
-	perf_test_cases[2] = MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				       "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
+	do {
+		/* Expected mremap failures */
+		*test_case++ =	MAKE_TEST(page_size, page_size, page_size,
+					  OVERLAPPING, use_relocate_anon, EXPECT_FAILURE,
+					  "mremap - Source and Destination Regions Overlapping");
+
+		*test_case++ =	MAKE_TEST(page_size, page_size/4, page_size,
+					  NON_OVERLAPPING, use_relocate_anon, EXPECT_FAILURE,
+					  "mremap - Destination Address Misaligned (1KB-aligned)");
+		*test_case++ =	MAKE_TEST(page_size/4, page_size, page_size,
+					  NON_OVERLAPPING, use_relocate_anon, EXPECT_FAILURE,
+					  "mremap - Source Address Misaligned (1KB-aligned)");
+
+		/* Src addr PTE aligned */
+		*test_case++ =	MAKE_TEST(PTE, PTE, PTE * 2,
+					  NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "8KB mremap - Source PTE-aligned, Destination PTE-aligned");
+
+		/* Src addr 1MB aligned */
+		*test_case++ =	MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned");
+		*test_case++ =	MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
+
+		/* Src addr PMD aligned */
+		*test_case++ =	MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "4MB mremap - Source PMD-aligned, Destination PTE-aligned");
+		*test_case++ =	MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned");
+		*test_case++ =	MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "4MB mremap - Source PMD-aligned, Destination PMD-aligned");
+
+		/* Src addr PUD aligned */
+		*test_case++ =	MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					  "2GB mremap - Source PUD-aligned, Destination PTE-aligned");
+		*test_case++ =	MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "2GB mremap - Source PUD-aligned, Destination 1MB-aligned");
+		*test_case++ =	MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "2GB mremap - Source PUD-aligned, Destination PMD-aligned");
+		*test_case++ =	MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "2GB mremap - Source PUD-aligned, Destination PUD-aligned");
+
+		/* Src and Dest addr 1MB aligned. 5MB mremap. */
+		*test_case++ =	MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "5MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
+
+		/* Src and Dest addr 1MB aligned. 5MB mremap. */
+		*test_case =	MAKE_TEST(_1MB, _1MB, _5MB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					   "5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble");
+		test_case++->config.dest_preamble_size = 10 * _4MB;
+
+		*perf_test_case++ =	 MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING,
+						   use_relocate_anon, EXPECT_SUCCESS,
+						"1GB mremap - Source PTE-aligned, Destination PTE-aligned");
+		/*
+		 * mremap 1GB region - Page table level aligned time
+		 * comparison.
+		 */
+		*perf_test_case++ =	MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					       "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
+		*perf_test_case++ =	MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, use_relocate_anon, EXPECT_SUCCESS,
+					       "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
+
+		use_relocate_anon = !use_relocate_anon;
+	} while (use_relocate_anon);
 
 	run_perf_tests =  (threshold_mb == VALIDATION_NO_THRESHOLD) ||
 				(threshold_mb * _1MB >= _1GB);
@@ -846,8 +910,18 @@ int main(int argc, char **argv)
 
 	fclose(maps_fp);
 
-	mremap_move_within_range(pattern_seed, rand_addr);
-	mremap_move_1mb_from_start(pattern_seed, rand_addr);
+	mremap_move_within_range(pattern_seed, rand_addr,
+				 "", 0);
+	mremap_move_within_range(pattern_seed, rand_addr,
+				 "[MREMAP_RELOCATE_ANON]", MREMAP_RELOCATE_ANON);
+	mremap_move_within_range(pattern_seed, rand_addr,
+				 "[MREMAP_MUST_RELOCATE_ANON]", MREMAP_MUST_RELOCATE_ANON);
+	mremap_move_1mb_from_start(pattern_seed, rand_addr,
+				   "", 0);
+	mremap_move_1mb_from_start(pattern_seed, rand_addr,
+				   "[MREMAP_RELOCATE_ANON]", MREMAP_RELOCATE_ANON);
+	mremap_move_1mb_from_start(pattern_seed, rand_addr,
+				   "[MREMAP_MUST_RELOCATE_ANON]", MREMAP_MUST_RELOCATE_ANON);
 
 	if (run_perf_tests) {
 		ksft_print_msg("\n%s\n",
-- 
2.49.0

