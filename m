Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D994C7C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738326734; cv=fail; b=kO3PpuyOcJpqsCSSAlBHcedcgjMprdsbT9ZRHxfdnIgb+7qJjyTGraHrsc+c8JtRN1byEfmXr6cy6BpPicVYSTebMu5Xu2msvwGCZnMMLFxZVbeHZshJNaRwX2UCIIRVwcfJyfszVnn5LwUDBlaRsQZFakAfdTxfvci2seEqyc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738326734; c=relaxed/simple;
	bh=auZmmbQ8UgrIOVvQ8VPODyoeVktFkO/alv9dcUXqVks=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Cnw5x5aQoP/MKuvMwp3b2qOGq3l9riiG8zilyRj3aVPnThWt7Vb47smHax4fCgjA1+wgOc/9NTo0Ndg3UcYl73ss/PPz4Ncj2Mthg4uInj939ylPGTIw+WK48Ssaw8MYNgb0WWgRGDaPtjXfivao3PljecuYxra5iljrlEeaXq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iqlU2lY/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lNs9jUA7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iqlU2lY/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lNs9jUA7"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCMiUn018911;
	Fri, 31 Jan 2025 12:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=zHDvPfAI4DeO4CRD
	TkLR+orzP5chO3E83QFFEt7JT8k=; b=iqlU2lY/4c+o7E6UY8Yv73vOTFllgIR0
	l44RU2GDG5XCtomECdngAnluL87GCT7buC7u3zVuV5yH4fZeyALaZhe9gM8zW8Kw
	xAXjGkAVZzazd++ostO2uy2/nnUFLx6ZAn/dpR+sU/P2cuHQO2QwTcBcJ+iirYxa
	3j48+3350QTSp4kxislAwTCRuVwcICn4Y6mCS2rq6+pt1CZ8ljw1Jwrx+mAaOAgv
	ycgAl+/EBDT4fUNmVcCi0f1c2+GNgsCQZSgeqXu90t/0MwdX2vV/8oHsXINHF8WN
	pqFm1g8VIJUHHkcxfFTpk1nfGgE9wbX2Yn7ZSINmpp4wZjiXRm+Twg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gxf2r0h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCJTl6006172;
	Fri, 31 Jan 2025 12:32:03 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gfhubj4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWCvB/pY+DrS/uBpLRadnFQsmOSaO4xxKgMnPkm2O7VUkukdXVxGIkPbyfg8c0e6Ax4ehzSjlu7LIy+ySt+qTJ4/RETlkLsvrwhFY+B801rWpXwwdYV+ZCpFqcGciHSTSuZ1sivYQ0SFdEoxtdNf+IVjWF7QuixsnLVWoymDhEjD2t5hWtLPsCbyAJ0TADeuUWR/kIOYKdiVk4IIIPvUY+HeyyYZoH1fDkPm8/vIyY6C9y0xV/ga7luTuUgelCFgNhmX4kFWF+0HJ5BoyKfp5NFjuAG8Ca34xpAy88974HXKyqIivZGD5ePYj8EpMasExNyCyFiSSjfdcyHi4EEakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHDvPfAI4DeO4CRDTkLR+orzP5chO3E83QFFEt7JT8k=;
 b=XgviLlttI/0sNQMrLgdp19wlm6kaiyWlSVWbbv7Nk79XUmpx0rSYtz2RHKt7AYS7TAgZEvWtxA6oHh9F/kHclhh9QhLkW+KZpJ5MpNh1FyxZVawJfgoppTUvvuj6Vqy6MaQCnrz/oLlUUvfJYliUFn0iKCSqP1gNJZ9d2OcnsYpWsja0NE24NVqaJpfEgStWfSC+OO7VaoBc1TK2bwDVfgxJ49ra5q9+SeKMlLJNqF+sLdFsmqeqGnUk3DI7ecD2ns2xXSMpkPSN38+Pk4P4qOtzZiUDyYIAvQiCKpCUWYBHslU5cMnch3pbIb4RQq1pKgyX6gdWqXNBPHJftUmnsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHDvPfAI4DeO4CRDTkLR+orzP5chO3E83QFFEt7JT8k=;
 b=lNs9jUA7roxnlWtPrNlC10mUwiKIvsJau9imgX9+TkNDkzVqy9UOvT74rNHe066Zp++7brbQsAqkFme4Dkp+rZ5stxKpA6LRQF2TY/2Q6nSpBcFhN44doYQpiBGhWV+RoSCoewh6VUT4TQeExcEJq/CLAps4yBYTdGfj1nb7zi4=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH3PR10MB7741.namprd10.prod.outlook.com (2603:10b6:610:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 12:32:01 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 12:32:00 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] mm: further simplify VMA merge operation
Date: Fri, 31 Jan 2025 12:31:48 +0000
Message-ID: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::7) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH3PR10MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 854fbf84-47ff-49d0-4d2d-08dd41f342b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NC2IGB+YHG4NDtvaDQ+/nCnIk09OS8olzr16eXuVK6+EZL4PzAj+8Dmaem/j?=
 =?us-ascii?Q?ATt9k6SBPR1PxFtm3aDeO/3Jb0M9M3trg6wBHowdN6EV+I8fr8TH0t8t4hNm?=
 =?us-ascii?Q?vaoxqKA4pJqB7JukaJko9p65Y1siPZArmmOE51HPakiTL4y+XiznllTuNkAk?=
 =?us-ascii?Q?Nql0r+TyEiyligPWLhc/WjuI8ekFG0Fi5N+2JM2qNoZb///gxUD/c/RKilAb?=
 =?us-ascii?Q?S3LxnvGdhykKa91p3FKMy7t05XUHyZYNfDd2RvIJUvKnhtZYlfWKoeBNkcUL?=
 =?us-ascii?Q?u22Tl5emIIOhXFffW4+og4cHPZk+0JJ4Q03SWlZ7Txgh0U3lS1e0ql6BJR+v?=
 =?us-ascii?Q?O5M0GIRZn0mbyEwuMGEdaEO0UG0OQn0v/V7Jp3y7lUCMUKk/pjfGHVR7cuVo?=
 =?us-ascii?Q?Fkvi03YZGcfQpI2oMTIgZjJUY+iLYWcqje4UHWDaR9bpiu98XvCXWGRdnJkR?=
 =?us-ascii?Q?SlnLYWSTPqN6Ekj4yAfT401efel0qTCqqhPwvTzvjiDQ+vWef2VCFPiHPYDP?=
 =?us-ascii?Q?TcFSTJWHvbgm5GIlL/3DKJjaJPrMghaFQSfysuDAIeA3c11BG/oCYpRuSP9s?=
 =?us-ascii?Q?Nk6x3jjYJ1X3OiUlskwemW3GIb07XypzKN4xp5RTR5kZq+Nrp7QNSxRxmt2v?=
 =?us-ascii?Q?eMblzLNLLhsr+9zubJB8I1xL/Dj4/ziN7SghScXrcw7Iwh1eGVH2wtoL8fIp?=
 =?us-ascii?Q?CPbUszsbHzxoy8Qjx6cz8B0d9aty6XBE/ttVOVxLFJuzzW9roZcm7wfTRqU4?=
 =?us-ascii?Q?2v1JAXNSduj56s4WqnmvYtjorpuk+/oAssrKeQFoam0Uz0IOHhNiGxl8dKJf?=
 =?us-ascii?Q?5A3tIRi0UiYyIzMtnIefYKNVRUR21EmE1mWyeGuFizxoXbbdTSRkrq1/ZIG3?=
 =?us-ascii?Q?CEUHzYXQefxnsdZ5jtHrCmkh+w/owVfEOrOIQyiyfU2Y2nOTC9y8jmGn9dMr?=
 =?us-ascii?Q?MM5HhA2b291jkuPcuW2SDo3CUtk83m0BScXwBLFexm3Z8TQqGILXHZaxQAPa?=
 =?us-ascii?Q?AJsFy9Hd4gTg6q2Q2geB/TZlCIyQxRzQ4nOsXF4D/66GsNgvMAosFiFkjhlm?=
 =?us-ascii?Q?D3Rfa1dw9wOPTFmX1nbX0q0Dn8lotAeHVKWkEK4agHzR9seW20+8ljBSR2k5?=
 =?us-ascii?Q?XLXaxKXEXO87xjoYdSH4x6JK7WFzVxgJZS8BQbMBpJ6rHzQp5LDrCh79mML9?=
 =?us-ascii?Q?3B2JRL4aFNf+wkmyHl9BkW81v5jNIrNL52Ej6gflRIsqIe5Ht4tsgs23lTUw?=
 =?us-ascii?Q?jwFeNM8tee7lFOq9Wy1GWfIpdIumtexygyR8UyOe79yYMifBU6CWP3P4RqJX?=
 =?us-ascii?Q?YhGX9t44TXeWhy70mgNFQg51uPqrilTKIde/0vDbFoTv8L811X5pMIExLHV/?=
 =?us-ascii?Q?wg/g5yDjJTIGF/HvictzuSMV0S8E/pNKqQHmqUwaAxTSusO+nA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kvPUtXqWGkt5mcrKijBP2dUoa5hXoEL61mCXyJPUWUTYnGXzEjgV8tNfAfH7?=
 =?us-ascii?Q?qNqLp9oPVCoZ9OUUkAL/Y9H9HHHfP4+QpnD4n2jsFSrhoqjHlSs0FLWq1Hq0?=
 =?us-ascii?Q?kfkCNhrhQPMWpbGtF6ph0/1Oq5Bx5nAbqQsDW8QqJSZMQ1Hj+sJBarkX6NYo?=
 =?us-ascii?Q?0/gEWm57fJArxoXcCmJz8DZ6E9hONQWeRPROLuxmaxdV3wSm42fcLvG2N1Aw?=
 =?us-ascii?Q?Aob6+oWJOdmL5fdusG5Qb40HzMYowg/HtKI3yt+2YnzTbJbplaAAryhQipNW?=
 =?us-ascii?Q?KyKRy66xUg3Dlgf+Z3jd+dv7mOKS+BPkjOgUlEgdyIG9JuxZTNwR7IAo/75Z?=
 =?us-ascii?Q?HyAGlFfHlBEjrfWl/An2/ojh9v6GQCpGM+kg9BhIDdCTvZ5KigsOzFCP2ax8?=
 =?us-ascii?Q?uQ8YJwjxPDramghm8j+NQCaU/4AN+lesbpyRf9iaTzzJOV7DGAQARfshG8a1?=
 =?us-ascii?Q?CVrnj8o3BO3xo62rQaYFfg9hJzW0yu87tBOAZAp0WFJwzn5wQDTuZvUUDMA7?=
 =?us-ascii?Q?9eLipavBrR3e9LpefIr72Rp46UCfZm/XWOba7RBe9d/d7K0lGoM29GNLN8Zh?=
 =?us-ascii?Q?Bxlqb74AIkk40jAROX0BmLN6kOyzqkox8uH5BGu1mVFRdnxydDvTIaMOeDbS?=
 =?us-ascii?Q?h4xIWvqsBJGo5MvDboRTQPAzPu5vLqbyFc1wf+ZIp5DJGD3z7hHCEw4f8Gya?=
 =?us-ascii?Q?MeykgMj/FIysbtAN81J7T8wwccOa8exAOP4ZBESS4hzQAUMt4tJM80mxTwYF?=
 =?us-ascii?Q?DFI2PYeG3vti0ZwIuq4xzWeukWhj9aXYNSA3NR5gJ8pknt6PRAF1sx43vjq5?=
 =?us-ascii?Q?O3liQ/pg1eSPAOwVyRrH9mc0m7U7mSKOyH5W5m0HTY6g4hAQdhMmCanWqdEh?=
 =?us-ascii?Q?izr2qZJC8Zk6hY7guSkvWdHhEWsR8spclBXhV+H67Au+XYiuMEz/4Zd5G7mw?=
 =?us-ascii?Q?FjjK4vdP89nttLi98rPULjo3jGldPmhL/eKsne99UbnsUu6bFFYKpWR8Zf6y?=
 =?us-ascii?Q?L8ivr3YLSjzVgFo2W1tnTbajd+qWkDzLPr2W4iHNBu0jUloSnqy70sm00O4V?=
 =?us-ascii?Q?QDZdnU3r43d3zqEB1BvXNKhnGB6TYTHxshNobg6+Mw2pwWrnX7WDN7PAgxJW?=
 =?us-ascii?Q?xs9syOtk989oscPwu3O9gaYV+OI9jZP68KrfT3p18CuIOLRXrVHAQYx4wq3I?=
 =?us-ascii?Q?qI66sYpc7C9CBNR1yY/vkU8zWU4IE7AudErcgJWAf+gAF532+QefTNGaooyW?=
 =?us-ascii?Q?PDOeMKhZvqvKE+C7bvtIuJ3RF6qd/6NWlC8kpGJaUJR0jfDyqU6CcAshdOLl?=
 =?us-ascii?Q?4nxpyCt0r//Rzyizjuj87n8/J78GVlTJ/7xPMk1IQKI22aU6zRLXMfl8A2/E?=
 =?us-ascii?Q?FCtYuigftKQQADMosfQk6OKovW4wehP6uloJqzmWWHTZ04HHMFQJGg45iYh7?=
 =?us-ascii?Q?uE6BgkWxsOkICEVs4O0chuEkkFCU95y0B55nrfR8zjLQIHGP13R0QTy5V0L5?=
 =?us-ascii?Q?YXe8fYW/+sIyYJ/HHmNsvO3SsRT/pRgJk343ryRCJA72U0Au5LhDAPi1MiuV?=
 =?us-ascii?Q?gn+4H9fb3Co3+eH3gsZ/hr+vpx3eZ5+aSLbGXcq7JoeJROSmm8QMm5eN1l2C?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1jiRul5HEoKgPx+pBv4i7pG/4bWgX6pLxsX7JVenKhyVKJYmGTAmgrGzfRlkn6GcFTOLb/rf9803ENIgzGZrI0Zr/hBhIlsuUn0eH9xCbh4bMs1lSyU3gcau5JAfGe+lHjugJfL+/7eaLoarUheyL2jmFgrCJreUdxUBcxFAZw8tbdMINA1vTUr8fzNnAL6DYfBHuV3/2soUrvrJeTB53fsToMC2xhWkIjg7TROGV1lfxEYvFn0g/BqApO3cr5CcaOUYeY8qSXUHUcTJ6mz/+l0+GOlxc+kyduqESQQlmJ96RWD53SeA8Q4cGasb6KYupTRUDDtWPNlWv/RrQ0dYzIBg3u106FqwFbtuYRKInK85E2V5RWRG/fdCtb7g7BiZHa62QeL3jTykXtmsHBXeG0PDUhwCClna5Qv9/hg8OZ/K/k2APf3T7eA5SkXMeg3Ae111Es+1l+xGarkcHDbijy21G8tFynueQ+eudJz2z0TkDXr7fVQOkGsop+JjJFuw3UEqniY1fYmzB3RZjsrc1p3Un9NVwRYuNkfqysPMIvPTCkbYmZxQ7Ta54AYFTcjGU+ZHZFXfPxShPsZkd3IFYjwQSLALpFIELNpNCpgITJw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854fbf84-47ff-49d0-4d2d-08dd41f342b0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:32:00.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtzPJBNaTamQ5/kvnfszVGScRgClc7GSN9vZoJh1dlJyRDiv1c3HqjEgfftPe8NEQJtCY2hR0nyu3ujr3/pJAe7LS4DGwHd2GgwtGvc6DOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2501310095
X-Proofpoint-GUID: C1QVtMb_P3ziUKAm7zlKGwm4coQdMHl9
X-Proofpoint-ORIG-GUID: C1QVtMb_P3ziUKAm7zlKGwm4coQdMHl9

While significant efforts have been made to improve the VMA merge
operation, there remains remnants of the bad (or rather confusing) old
days, which make the code difficult to understand, more bug prone and
thus harder to modify.

This series attempts to significantly improve matters in a number of
respects - with a focus on simplifying the commit_merge() function which
actually actions the merge operation - and importantly, adjusting the two
most confusing merge cases - those in which we 'adjust' the VMA immediately
adjacent to the one being merged.

One source of confusion are the VMAs being threaded through the operation
themselves - vmg->prev, vmg->vma and vmg->next.

At the start of the operation, vmg->vma is either NULL if a new VMA is
propose to be added, or if not then a pointer to an existing VMA being
modified, and prev/next are (perhaps not present) VMAs sat immediately
before and after the range specified in vmg->start, end, respectively.

However, during the VMA merge operation, we change vmg->start, end and
pgoff to span the newly merged range and vmg->vma to either be:

a. The ultimately returned VMA (in most cases) or
b. A VMA which we will manipulate, but ultimately instead return vmg->next.

Case b. especially here is confusing for somebody reading this code, but
the fact we update this state, along with vmg->start, end, pgoff only makes
matters worse.

We simplify things by replacing vmg->vma with vmg->middle and never
changing it - this is always either NULL (for a new VMA) or the VMA being
modified between vmg->prev and vmg->next.

We further simplify by placing the merged VMA in a new vmg->target field -
whether case b. above is the case or not. The reader of the code can now
simply rely on vmg->middle being the middle VMA and vmg->target being the
ultimately merged VMA.

We additionally tackle the confusing cases where we 'adjust' VMAs other
than the one we ultimately return as the merged VMA (this includes case
b. above). These are:

(1)
	    merge
	<----------->
	|------||--------|    |------------|---|
	| prev || middle | -> |   target   | m |
	|------||--------|    |------------|---|

In which case middle must be adjusted so middle->vm_start is increased as
well as performing the merge.

(2) (equivalent to case b. above)

            <------------->
	|---------||------|    |---|-------------|
	|  middle || next | -> | m |   target    |
	|---------||------|    |---|-------------|

In which case next must be adjusted so next->vm_start is decreased as well
as performing the merge.

This cases have previously been performed by calculating and passing around
a dubious and confusing 'adj_start' parameter along side a pointer to an
'adjust' VMA indicating which VMA requires additional adjustment (middle in
case 1 and next in case 2).

With the VMG structure in place we are able to avoid this by simply setting
a merge flag to describe each case:

(1) Sets the vmg->__adjust_middle_start flag
(2) Sets the vmg->__adjust_next_start flag

By doing so it turns out we can vastly simplify the logic and calculate
what is required to perform the operation.

Taken together the refactorings make it far easier to understand what is
being done even in these more confusing cases, make the code far more
maintainable, debuggable, and testable, providing more internal state
indicating what is happening in the merge operation.

The changes have no functional net impact on the merge operation and
everything should still behave as it did before.

v3:
* Fix seemingly compiler-version dependent printf() specifier formatter issue
  in mm/debug.c per buildbot complaints.

v2:
* Fixed buildbot warnings due to missing a change to a static inline
  stubbed out wrapper for vma_adjust_trans_huge().
* Converted vmg merge_flags to bitfield flags as per Vlastimil.
* Update comments which were rendered inaccurate in 5/5 as per Vlastimil.
https://lore.kernel.org/all/cover.1738172812.git.lorenzo.stoakes@oracle.com/

v1:
https://lore.kernel.org/all/cover.1737929364.git.lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (5):
  mm: simplify vma merge structure and expand comments
  mm: further refactor commit_merge()
  mm: eliminate adj_start parameter from commit_merge()
  mm: make vmg->target consistent and further simplify commit_merge()
  mm: completely abstract unnecessary adj_start calculation

 include/linux/huge_mm.h          |   4 +-
 mm/debug.c                       |  28 +--
 mm/huge_memory.c                 |  19 +-
 mm/mmap.c                        |   2 +-
 mm/vma.c                         | 327 ++++++++++++++++---------------
 mm/vma.h                         |  86 ++++++--
 tools/testing/vma/vma.c          |  63 +++---
 tools/testing/vma/vma_internal.h |   4 +-
 8 files changed, 302 insertions(+), 231 deletions(-)

--
2.48.1
