Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D662D5C6C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778959; cv=fail; b=NECbYYaZuxTiepFmeY2/9zoWvibKWONkElMnP2ZaTqJOjORcHTzpud0LmcS1GJdUUJ8qNbnn9uvLOXcmrXo8EHRMnxW1sHowbh//9unvWrFASByI4nhf8UNbBuLSTWkgY+4cTNo7JEBMH+XZ1hfb0FanMxrcNzl+bkliOXHPsYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778959; c=relaxed/simple;
	bh=2aEBV22n1AmqLbl5oADLmH4fToHnAcguLjDIFm0y3fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fgwmV/8dlaGQhxsu2+0znsCR/17tVsgd0heU0Zu1NnWWueuRlzmgLtafs1clp8HDllJmgzMYFPT6YGH3O4CwiCT9T3QQC1jmDr8LzsRQcAUK/uuJrU3lEl0JWqG9Xyt8vbJTJ8LI2GsV5PC6h9TaiYVMG9Hq53/+OGYdyS6OyHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SGHUK/PB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e/z5aGew; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SGHUK/PB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e/z5aGew"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFN9ko020350;
	Tue, 24 Jun 2025 15:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=41JFjWqWLmmn7736RY
	JEWitRiLH4EA1li5m2WyQ81co=; b=SGHUK/PBW6kC58d5REZq9U1N0aqtaGXygh
	FahGq+xOlRXgez4FNYrty4epO9bvtfh4RrnTnnbG6gL2mW2BXvzGUTOVjNef7teC
	b2RnIhPgSO9THxt/L26F76h+TPeml0ZuFEDDtfHlB4D5b99DBiANsZpJyeQjFESs
	0/jkrzRcJkZmVfaHTFY/t62TWv+5xXMdHSmRD1eaJmTqqn5HSWcrU0aYJh7DECQu
	vbdp/8lPpVsgNQbHeckFgs9mhVLkwx459m4gjLh535NRM1IYDN3x1K4QKpkBKZm2
	fTPnFE0Y4LUwHgtAZnJtyuFAoO1KmnqKrbJnErZxBALYvXNShSGw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uwf64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:29:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEDpJc025266;
	Tue, 24 Jun 2025 15:29:00 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvw9hqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVM7Kq7AUbiUFL+fV7kXClPvixuQ92S5z1eeqmcMF7t/sL39Xpm7zafDGY+tCTTeRW1b75h3NHoTqllDdJnKRjB8tOw1eaft/J6wDWrZjsTuplioTSxr7N+Sw2oExeRwsgDcjqJbkquqRXIQh7iZ6OPN2CZL5VQuuTZNdZhiTM+w96AlcRlgibD/48J+T57xOOSZlv9+/ABZIIK3Ev9/2yR5IhV9aaX5ZLTC+2PqgyiZGRPZVf1eD2sCqwZIbvtkeSPQ2PhmQ+4S/rDyY3d3TKZOZyV/3VTuChneAyuIhfVexKYKU42J7mxm5V23yctiExubqrsxr3C5IX6xXfAmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41JFjWqWLmmn7736RYJEWitRiLH4EA1li5m2WyQ81co=;
 b=a39jap+j4swxodYDmsm/haNrGP46sROdEzaPSIYIDxlaQVuU/cBXc0XvJhkrjtg7ti7/V4LG+/EOLr0S3ET3hy2FtfhQ/mPNlzXOzWSFXL6wIAG/Xt0MJ/A+MlIX447hCtmtJ1hiYLA9B/A59t9s4qzJ4rHNZ4Z7djp7jTfJfvf2nu2EBqwFJsLrTaxi4WCmfz8zzQofO1BoaUOX5gD5DYdOBCLJCirJ9zLeb2i8qf8P1qqw0tCOPC1INdzYcpg4O/v5fLN5tDNHCQhoV+74zRM1XgWMDUe4zLtHplJMVT+DBD/ioGBNJoOSbTe+NnVY5TROHTmC4ktqtaKqwQ/OSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41JFjWqWLmmn7736RYJEWitRiLH4EA1li5m2WyQ81co=;
 b=e/z5aGewBfHwy9vNeK6VFoAl5sbUsffk2mJS8ICj0/CabuyOYPoGJOw0yW0iGyQR5JtqePvlEbogSVkNIA84zqMzueKr11fYCHgOmZXEBTaOqFSkDu+v0un9MVCTgvEr3U+la7rZtx4JAwnHIdVji9RDdbE2HeTDaDK+nEi6hwA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4889.namprd10.prod.outlook.com (2603:10b6:610:d9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 15:28:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 15:28:57 +0000
Date: Tue, 24 Jun 2025 16:28:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mm, madvise: extract mm code from prctl_set_vma()
 to mm/madvise.c
Message-ID: <2af52908-7e1f-40cd-9297-6eb972dce0ab@lucifer.local>
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-2-600075462a11@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-anon_name_cleanup-v2-2-600075462a11@suse.cz>
X-ClientProxiedBy: LO4P123CA0256.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: c1999673-f6ce-4086-2d1e-08ddb333d66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+uAfIy0rc3iGpN7eCjDH0CbZWqRvoq2wS/asj7Hni0Qj5c64/ta1mbC/Y2jK?=
 =?us-ascii?Q?lR4uAcnQNMw9sMgaG+0ioIFWP5wgShD2g0VEnjMboShY11Lk1MgNndvJOqoZ?=
 =?us-ascii?Q?hBD1byMl2lqSMFcvBYpJNUWwINrYc1ytD5VPcmRE7I00Wpd+SuNLsHZCiQ69?=
 =?us-ascii?Q?Ok/BHqdVikKzwFQP2lPwANzVjDYXt3f5Ph6i2HwU6zJaZkFUBkPwksyFTWiZ?=
 =?us-ascii?Q?0O0qN/FNZr1c2A9qSECc9wZIFFuy3bWFQ9qZvkeNcqN0dPvbVLbLgI/w5Psj?=
 =?us-ascii?Q?vrBqxWmmaGKoBrY2wNOf4zph9V+9OG9eWqVtnym3EBDwbKE/Gkw2LUyApBQg?=
 =?us-ascii?Q?3xaZmNRbrL5+VpK3XhxmlJ7gtUrd/yCsoyp5CVQiLUdXmPCjIA+WpsSUFNtc?=
 =?us-ascii?Q?904h8b6Cfy6Ypaq2CYD0GKSdZGeMNO4iy9OWoj3gGr1obnT9lJ6B0oxqF5na?=
 =?us-ascii?Q?f+YtpibQFrYAEKmc+mdx/Z6sUdPD+/EMTn6NvB53JwObavisbKbdQTktpmLt?=
 =?us-ascii?Q?/hNE2Lded+Yq7dvgOrswvnx0XMLfDvVuN7CTi+00XYu7cZPqE5GgybxRI+2S?=
 =?us-ascii?Q?2uKP8SSe6LQ0ZNmAfmxUS77p6g2hPqbKuaYudl3TuODkE+bLxt+4x+++hTvh?=
 =?us-ascii?Q?v+V49C1URLOnSolww3asdwd9PSOLyYnF/yz6rIMlu/Qm3ljF12s8fj3tpkAE?=
 =?us-ascii?Q?kCx1/jMftmXSTVogFrGQIJf+UUgeDV6X/GLF9hAsKScofJ89nR5MculhEOcl?=
 =?us-ascii?Q?XOEcZKVF0trdOrYD/e/fGBsNz6Kt1438qEDQRW9aZ5csiYm+8++HrhURNzy4?=
 =?us-ascii?Q?shvoplBfnqtMlTC5BPFx9mISMFWpN81wNmcnyjW28w3fVnkmWdL/ydX/BGoF?=
 =?us-ascii?Q?Fyl1RMFmpRXBbP6mvWfds0ZD8Cbe88G5LwAOMLUZHcF90uWcJqA/YmcbUxs5?=
 =?us-ascii?Q?SNajPiI8plkthLO9GIpfsjtQ3R3K3Us4x3Qa4FWZSN/lrPQ+8hRf9AyED2dX?=
 =?us-ascii?Q?gqD72yjBii9FhFBZ75nvT7nvHd/178B09ZzPdJsT5ePt0tJDUkf1cLl+id0N?=
 =?us-ascii?Q?zFVoS/Zu9HQ44QYZ2hMx2X9q3RSEFRUIyYGmFt/67O/OPh4bXJnAVGSMVdGu?=
 =?us-ascii?Q?BoWczZxmPUkJ8dXPNWc0ymhxbBcv4qUhD1S0J7ax0URD36z71Fc/0mDo1vvs?=
 =?us-ascii?Q?APYzQP5Ql0lepIB3vJFZZWzlsasezYYLZM+epj0k9dRm/RFw7bhiyJQwGiJ3?=
 =?us-ascii?Q?PDQ1RaLKMXWegPysGV309UyM5I+4Iz4FWHBuSG+hgsM0fAqpF+/SCvCiTAfL?=
 =?us-ascii?Q?BUk0SNFutJL91Iokuwm5eNEhWCjW3qbogZJpcDAwVhO+by600aDQjiR3CT9r?=
 =?us-ascii?Q?5EU5RoSGvNRLi5lGWzPNfNVB6vpT9LljvFFamk6Y7alN1goinVdJ2vu/m2fl?=
 =?us-ascii?Q?1wUfVmguafs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3dFVVlXarh7EfZ+83WylyAwzx4/BM0i+VdcY6RkVgCZeGW1EVA0N/fJB2EW0?=
 =?us-ascii?Q?/mqnsBG3nPNv/SPm0hVt4QAIiQ7pPQN84GEUV4AFOidLJqIQN5TiCHk8JVc1?=
 =?us-ascii?Q?nXsNV8iCTUYV3Boxlje5nFhbZTvGRm6DralDuD9setr37KEuqnOf7m9vXO2e?=
 =?us-ascii?Q?JL7SuKpjNWP8U2z3U90s/jIhgVNTIZG3HhMjYYuvXfvCsgpTySEVdPtUJb0M?=
 =?us-ascii?Q?CEjToWl6o2+rptxRfQmthm0u3DNgwzOcltsYhRewwlsvQiFmXBmb5S/P0da4?=
 =?us-ascii?Q?OJCFAIpIXKxaE8RVZmDt6GrI+zIF/FQKhXnq+3xdEjGKlV91ifPV64lb0FQV?=
 =?us-ascii?Q?dj7JgU9RBLmOmW5L2bzgM8xq316ia4UffPo5dbA7W1ByeRvZjwrNvdh1JTRp?=
 =?us-ascii?Q?n/XAowrzumakLEAh/YNkL4BFWSKvVNwpawb9XhTaZ8EkdCZqdWeyuUzEbx4w?=
 =?us-ascii?Q?L0lBbZTn0M4ZMI07cMCMnjohGV7TtjPcsRxjhuujTD/IFKlXDpRkVJZ4DSDO?=
 =?us-ascii?Q?oaCr01ocJ4oa/2CDf7d1wSXNBYwKpt4TOmlfnvCVPyrXByPqKIKoHemqYtlh?=
 =?us-ascii?Q?QRFq246hV+SY94ZQernFWFDj1KlR4RfDO2IT9hWRNVZPCuHRYreF+ZjtM3os?=
 =?us-ascii?Q?dG4yBbeZK68qI+A/4cm1r4/kTe6/FpPPAvc7b/+IYaV1JDE3YN8qI4IOxmX0?=
 =?us-ascii?Q?khN+NS1zioBnIAvl/HsS6O3IxgR1VAbG0vZda8S3+G9qeRTPFlE5wdJt0tq+?=
 =?us-ascii?Q?DJhM0B0+tlTnq79sYUaJuQQY3lr/wequRBhgo2qGv0W76D9s0VH3xVIVwBAo?=
 =?us-ascii?Q?a5iaahsErpYeNCn2JbpSPimY3gZ7UaiQ2J6TaefB/wyoegL5G+qWV+mO0HeW?=
 =?us-ascii?Q?bgNgtfrvxGKb/cFyXulQYh2bTD9v3A4nYcbrYl5+gnM8IM13QzZ8/ePiAQvE?=
 =?us-ascii?Q?o/5arJcpSerEPXliwRtT17EpD76IvuuL73i8Pzn4BT1Sa1vtH7izuZ5D6Rqo?=
 =?us-ascii?Q?xxYSlkvVor+rYEsf7wdjNHIpUeoZiVCNBGMJTq0Gm16OQ2taiu2X6erJl37M?=
 =?us-ascii?Q?nuMoGOcTY3Nl5RJGiAG/nAbhjxoefMT1VClCaP28R4ftqgAQHWLGNm0SsJ36?=
 =?us-ascii?Q?Ou/80fY1mRi74rOHbpM+1TxTXkTD1BcOvMn799LgidahG4sl7t0OIpXYIjMb?=
 =?us-ascii?Q?H8kY9dWTvZIAgfyYyozn5cwi148je9YaksXGuv7qO0bDc6IawgiVmTBW7irr?=
 =?us-ascii?Q?B8xtfeGkSD6xr5Zkxyv5nC/QF8h1bswBc1jYJJ9kCGBm1cwjD0h9Nx0bggv2?=
 =?us-ascii?Q?YSTChOTsktVNOrRcAh/s5JJvFbVFmSb01cw2xjg5dLDdb82ChN2nCzLI+PXB?=
 =?us-ascii?Q?1i5RgRZWhIYRC9y/7NeX+ASr4CjUhx+T60GuD5qbx+392iIzsIg3wb6Oa0R8?=
 =?us-ascii?Q?c60sQWhez1FxOfDw9eIXrEd8/XpQrXSDzytFTWyThyRDzylI2+M2yxPGzde4?=
 =?us-ascii?Q?q6/fF+X8ALs3cWvMXLcOnOnhN3KmVYCuEybfAupuzzwDnKGpD6oDYqX3xmUu?=
 =?us-ascii?Q?Cj3Dtt+9+M0sGEg/6JrrcGt7pBTfOd8CTPucncbEx4Hcjz8vnaCy+uGMQohe?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zDs7bA0BLnROJNVyxdO6s7owf61g0Eb7KTNC1tW1kVgxbqx4TltnGhJ0MdvE2tkF3lHuGSjPytwodG4R3jwURavtg7VQbWc4hYhiwnd8jOt8qIng7vmvEVbVLvSouUc9WKGLOJfM2DMzwE34gA5gQcKOIezy+fr3uZI05plCYOpi1VwKDBvL9RRvLlrEOBjG64zB2x3lEeNbsSeeDDi4r84+iPwS+sq7BrAlQ6b7DLeP5tatSOQcNyMXaBr4BfeqDDqwqdbS4z0GVE/mtod1+owC3vK+JtVb8SA8Uuw2TGY3Ojiq3TZWG2BkzGpGYe+bGp0zFjxPxLszgqK3BEbCDbFVOFlePaozBDX6eIWIc0B6Jg1s/DM2Y7Ev6io85cknDOcMDP7cv8utNqArnmzTA/tqhtW8sxA+hcyuRFYyZplWdRck/kMFpngkRadHOegHf9TZOIOtW98H27t2MNYzvno807RS4Jw07hpTIEPGGGWLDSCaZrJXXNxOF0NYDarXecAdh/lWJR2WKNwEsgX2PwOMp9+DdTzSdIit1q6hZeQIsseM45jbmbBuG0xUqn1vDcdtG3iOkIzoKlW6JY6vajgKy1zyTsjKCyT4j1uJcpI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1999673-f6ce-4086-2d1e-08ddb333d66d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:28:57.9315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2bleTMBcuPvct3z/HLRrnK+3IQtfidWsFVTOuQ+JahAOQUNIq4Cc7zdITyxlEq4wLR4Xnv4XPGMqeLMtMT/VIZVTqIvFXoVbIcNm3mUyEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4889
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240130
X-Proofpoint-GUID: cZC2SBOwamPP9MaNzKXLogI117z6mLHp
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685ac43e b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=FRBCYZIS8gKo8cKnkVcA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: cZC2SBOwamPP9MaNzKXLogI117z6mLHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyOSBTYWx0ZWRfXxuhSK1GoWsV5 4LodpkWK9jiaVcnWsxIQ4texakGwDShx6OarzBDaJhCpZcFI5Q6j+kX1Ffzme1tWaM8mGYdUY5Z NfjL5HNHzyRJX4mCKXUwXAAYRK0KpQqibpCzrSHfazvM6aS6QsyGrtk7sivgm+9CbgtXCK41qGW
 z2Y3H1WB7HoRUOJ8rruWohPdCmDDD2XxlOTDio806EPjSACIluPahf3Uy15sJnCYROoRkKvEcLr w9qdhvYS2vUK5pIjYzcK+e7/BRKu27oOouiy0rlzD2bNYDDxIpurpGaamh1k6sU1utBaxJviI7N dlXjqymfyowiFBNNvLsLSxDuGkVn2II0yfpSzJqE9xofO/2fZGQ6YYtF0HNV+SS5Fshz4ljA3uJ
 EWaQxBvmYPRtE43cqzUsQXg1ZYz43NKG2nrDLY4cOeeg0p6Us4KixsHLPYvKN7mK/v4tleS/

On Tue, Jun 24, 2025 at 03:03:46PM +0200, Vlastimil Babka wrote:
> Setting anon_name is done via madvise_set_anon_name() and behaves a lot
> of like other madvise operations. However, apparently because madvise()
> has lacked the 4th argument and prctl() not, the userspace entry point
> has been implemented via prctl(PR_SET_VMA, ...) and handled first by
> prctl_set_vma().
>
> Currently prctl_set_vma() lives in kernel/sys.c but setting the
> vma->anon_name is mm-specific code so extract it to a new
> set_anon_vma_name() function under mm. mm/madvise.c seems to be the most
> straightforward place as that's where madvise_set_anon_name() lives.
> Stop declaring the latter in mm.h and instead declare
> set_anon_vma_name().
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks for doing this! :)

> ---
>  include/linux/mm.h | 14 +++++++-------
>  kernel/sys.c       | 50 +-------------------------------------------------
>  mm/madvise.c       | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 58 insertions(+), 58 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0e0549f3d681f6c7a78e8dfa341a810e5a8f96c1..ef40f68c1183d4c95016575a4ee0171e12df9ba4 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4059,14 +4059,14 @@ unsigned long wp_shared_mapping_range(struct address_space *mapping,
>  #endif
>
>  #ifdef CONFIG_ANON_VMA_NAME
> -int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -			  unsigned long len_in,
> -			  struct anon_vma_name *anon_name);
> +int set_anon_vma_name(unsigned long addr, unsigned long size,
> +		      const char __user *uname);
>  #else
> -static inline int
> -madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -		      unsigned long len_in, struct anon_vma_name *anon_name) {
> -	return 0;
> +static inline
> +int set_anon_vma_name(unsigned long addr, unsigned long size,
> +		      const char __user *uname)
> +{
> +	return -EINVAL;
>  }
>  #endif
>
> diff --git a/kernel/sys.c b/kernel/sys.c
> index adc0de0aa364aebb23999f621717a5d32599921c..b153fb345ada28ea1a33386a32bcce9cb1b23475 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2343,54 +2343,14 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
>
>  #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
>
> -#ifdef CONFIG_ANON_VMA_NAME
> -
> -#define ANON_VMA_NAME_MAX_LEN		80
> -#define ANON_VMA_NAME_INVALID_CHARS	"\\`$[]"
> -
> -static inline bool is_valid_name_char(char ch)
> -{
> -	/* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CHARS */
> -	return ch > 0x1f && ch < 0x7f &&
> -		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
> -}
> -
>  static int prctl_set_vma(unsigned long opt, unsigned long addr,
>  			 unsigned long size, unsigned long arg)
>  {
> -	struct mm_struct *mm = current->mm;
> -	const char __user *uname;
> -	struct anon_vma_name *anon_name = NULL;
>  	int error;
>
>  	switch (opt) {
>  	case PR_SET_VMA_ANON_NAME:
> -		uname = (const char __user *)arg;
> -		if (uname) {
> -			char *name, *pch;
> -
> -			name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
> -			if (IS_ERR(name))
> -				return PTR_ERR(name);
> -
> -			for (pch = name; *pch != '\0'; pch++) {
> -				if (!is_valid_name_char(*pch)) {
> -					kfree(name);
> -					return -EINVAL;
> -				}
> -			}
> -			/* anon_vma has its own copy */
> -			anon_name = anon_vma_name_alloc(name);
> -			kfree(name);
> -			if (!anon_name)
> -				return -ENOMEM;
> -
> -		}
> -
> -		mmap_write_lock(mm);
> -		error = madvise_set_anon_name(mm, addr, size, anon_name);
> -		mmap_write_unlock(mm);
> -		anon_vma_name_put(anon_name);
> +		error = set_anon_vma_name(addr, size, (const char __user *)arg);
>  		break;
>  	default:
>  		error = -EINVAL;
> @@ -2399,14 +2359,6 @@ static int prctl_set_vma(unsigned long opt, unsigned long addr,
>  	return error;
>  }
>
> -#else /* CONFIG_ANON_VMA_NAME */
> -static int prctl_set_vma(unsigned long opt, unsigned long start,
> -			 unsigned long size, unsigned long arg)
> -{
> -	return -EINVAL;
> -}
> -#endif /* CONFIG_ANON_VMA_NAME */
> -
>  static inline unsigned long get_current_mdwe(void)
>  {
>  	unsigned long ret = 0;
> diff --git a/mm/madvise.c b/mm/madvise.c
> index fca0e9b3e844ad766e83ac04cc0d7f4099c74005..7e8819b5e9a0f183213ffe19d7e52bd5fda5f49d 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -134,8 +134,8 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>  	return 0;
>  }
>
> -int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -			  unsigned long len_in, struct anon_vma_name *anon_name)
> +static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> +		unsigned long len_in, struct anon_vma_name *anon_name)
>  {
>  	unsigned long end;
>  	unsigned long len;
> @@ -2096,3 +2096,51 @@ SYSCALL_DEFINE5(process_madvise, int, pidfd, const struct iovec __user *, vec,
>  out:
>  	return ret;
>  }
> +
> +#ifdef CONFIG_ANON_VMA_NAME
> +
> +#define ANON_VMA_NAME_MAX_LEN		80
> +#define ANON_VMA_NAME_INVALID_CHARS	"\\`$[]"
> +
> +static inline bool is_valid_name_char(char ch)
> +{
> +	/* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CHARS */
> +	return ch > 0x1f && ch < 0x7f &&
> +		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
> +}
> +
> +int set_anon_vma_name(unsigned long addr, unsigned long size,
> +		      const char __user *uname)
> +{
> +	struct anon_vma_name *anon_name = NULL;
> +	struct mm_struct *mm = current->mm;
> +	int error;
> +
> +	if (uname) {
> +		char *name, *pch;
> +
> +		name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
> +		if (IS_ERR(name))
> +			return PTR_ERR(name);
> +
> +		for (pch = name; *pch != '\0'; pch++) {
> +			if (!is_valid_name_char(*pch)) {
> +				kfree(name);
> +				return -EINVAL;
> +			}
> +		}
> +		/* anon_vma has its own copy */
> +		anon_name = anon_vma_name_alloc(name);
> +		kfree(name);
> +		if (!anon_name)
> +			return -ENOMEM;
> +	}
> +
> +	mmap_write_lock(mm);
> +	error = madvise_set_anon_name(mm, addr, size, anon_name);
> +	mmap_write_unlock(mm);
> +	anon_vma_name_put(anon_name);
> +
> +	return error;
> +}
> +#endif
>
> --
> 2.50.0
>
