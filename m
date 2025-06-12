Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C821F16B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738076; cv=fail; b=GbAImKNbG6KtwC+Md3RKRv++hvN26RHH20BN89m2PI188TJS5qlLGW9/LiNq+pmP1quwOlxHgs6bXWQIY1g384XLhPGdbietkAFFmL4ahjYLa8YnV69OVtWZjK0bPJ9QVH9Ukh58WIiEYYDgU0m7DMU0At3KwSfswLGZdNRImYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738076; c=relaxed/simple;
	bh=j7aoQ86m4DJVDkpoOWqT49wmEuo7fupofiUlo095GKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bORku76PKEWahapaABJF29sRQH9Mgh5R7GUyTOEYZ7jaPrGs0Jlaw6ovyD8diJ3izqDtOanzU0j9Z2hGraZwMyUxHPzWFRCGeviLR6HsPUosFk3ElypxcbjPDlO1VVPhveW0LBMPP6VlUg5L0NxSw9PS4Cc8LHh/icEZs0N488s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HiXu9dYf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mfKstFeZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HiXu9dYf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mfKstFeZ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CDteXV007722;
	Thu, 12 Jun 2025 14:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=eCV8rbEmzCmmJwCjLr
	zgRDySlotR+4fPPHD8qThZmQU=; b=HiXu9dYfKsct8avaJzeULmMTISQgTyFDV7
	Xkg7MDsmIGyQK8F5YR8BpHZOwebh5BloCyngMCi0yytcMtp9Tkc66Y0vyALthkDd
	SLl4LAIKTuiNR06Yqt6Lkm2E+aMpxJEBwdSi2hW2L/Ir6abY/Y/h4xDfLmKuXCq0
	2lRjUNEKGuas2wTwcRPRU9XgRtTfVSYg0HjAO1KvEQ8MfAG9SAn1ODy4rgcxXBg3
	1iiCZ8RsDiSFdTYO33ZGokUQOd80xLIA1NcSts+0aT3MPNgQzhMS+kJg0qmLa0pk
	KLWn5MZOQ85GXG5j8xQw1LyhznylAhBShs5eOltcrXBruuALsXsg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14hu4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 14:20:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55CDoSGJ013254;
	Thu, 12 Jun 2025 14:20:56 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11012066.outbound.protection.outlook.com [40.93.200.66])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvbdube-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 14:20:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx6z8dO+M4aFmTUr5yc2N3dsVJ5nzKDDtFi9rwU675dbU6bV2Kgga33tm2UF1AUmTnKOds7eAiqyAAy0Yb1W2YkDpqaL/DdrBFnpESoEO/pv9pdoFgziXOpVFhmBIlzLLfLSCyaRV9bsXPfUZFRwEhUZK45Wk3CXkbHGDWc24FomyCld3Wp8jNAiVHGSqwfLhedPoywFLIhLOd/ua0EN4hGNZJq7UZaOwR4ywXeMICSTofsB4KH6LpZaaMZ9EAYIlgWFOSlV0Pd+tEJ10M7KLM8M4ULUE23PvZQTytvdqoUH/PeK6CaO8kCI2x9HgUR+uz41LG2D8xqGyqpDB0Vwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCV8rbEmzCmmJwCjLrzgRDySlotR+4fPPHD8qThZmQU=;
 b=qGFm3Ts4MJIJ2ogzrxfMUUtEO/xvrbdMXOpLMLgXHniH0hvspvFmdLat/8VIbW1iiw8zb3aHoat0I+1HiuMpeawtQE/2lWTm5oC/mpxl5UgfDkQxLfbvaAKS2BwkHRcPI4InjZGh97/k90I4mO+GRV6PjAuFLIBj9RV+w6C5Vzdme2ePB82BYcEfZl6GspAVTTUnJbN4y97WLz5uDPRbqKA6iX8k1dhAcoPLtJ/376k3HB+rZ+YSiBHAIXIhvKxDX+PC9qWF86ERb9eSmN0UoCeX7cH/uaaCPwGzNtyDozdV4DqKZ6VlJsLChBqg18lOO3LCDWWJPClhvRsdvBo3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCV8rbEmzCmmJwCjLrzgRDySlotR+4fPPHD8qThZmQU=;
 b=mfKstFeZmoBMrUTV55p80k98C8WM7wP78tFczMqRKsELt4WwIwNKFc0UzZDUECRbiVv0kIgpdR3lIxW3vsBOJjldCfw+OhS2m56tc0RAWsw6JNwvZhSIuJ3dlXc6PIb00E+/7p/jmnAkonLcA3FDYZx2nNark/ILAYuGbw77kzc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB5865.namprd10.prod.outlook.com (2603:10b6:806:231::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 12 Jun
 2025 14:20:52 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 14:20:52 +0000
Date: Thu, 12 Jun 2025 15:20:50 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <976f8544-91b7-49f7-975f-fac29a00d3fa@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
 <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
 <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
 <201a1cc4-93fc-48e3-aeab-759ba8c8a47c@lucifer.local>
 <519c59e6-20ef-4edf-88b8-a71f38cbd2de@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <519c59e6-20ef-4edf-88b8-a71f38cbd2de@linux.alibaba.com>
X-ClientProxiedBy: LO4P123CA0439.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a07edf9-e838-456d-0c36-08dda9bc562e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J5DDxFa/vguDexqSuo8Cg6bjvEjkNZeSOdcbF78kHexih4T1MVcUOSGdHEBz?=
 =?us-ascii?Q?p+NXjfP5BZhKcvKydNex4+KUIQ9T0gQDef3sjbDi2iCi8n3D9p/3halPSBqe?=
 =?us-ascii?Q?xeRTvFQN1NqtjfL0UzsDKpHrqimqnjyrjgJsJupo63mf8SiPKUWbpq3DrJMx?=
 =?us-ascii?Q?sTOxlN+Tu9bQ4IkDqGhaZ/zxp00NkMbfZ77AygVQuhwcq5LpqtynDsdAY7A6?=
 =?us-ascii?Q?LEIjIkPa2KDMQBrJiou99z7tHZAoryyHRXHdpBuXeIk+FRMsLBXBDDwDYr2e?=
 =?us-ascii?Q?B4po/JuhiWXpoX8xd9XVDuhsr1/gkw124Hk8V1tNdat0BKZL4ycP+n9EBxuf?=
 =?us-ascii?Q?sxuTTE+j4mXNrNh6wzWCYYHXzF8aDsI3HgmsouLBwvOu0m6ujgXNhV6PmXBy?=
 =?us-ascii?Q?oFOtEK96iY3hbabrB15lUejLYvYh+z6oEFiscaRk2fd3YSCWcafDLc1gCvYQ?=
 =?us-ascii?Q?Wvc2P8fIeKcQijgo54dH+h5VGwVkOcwphAiK5Dp6yZNMa0UuFyT3uEE2Hbfx?=
 =?us-ascii?Q?TrKPiAHa/XdkTms4k1fQSXHyZMZKeySVnF7DrpdVLS7UaEsD4WULT+7Uu/fH?=
 =?us-ascii?Q?ktyZ4uKCi13BvkoO74E/3MYvKeNIGdLxMhmFQr2IVobtBUrM6bRgvIzYAymt?=
 =?us-ascii?Q?gN2+hey1s02mpMFc9v3k8fWYnDeqOy8K++LqdWDsYe534HwEYRguxe38Rl6g?=
 =?us-ascii?Q?WjpEX8aPKuedMM/+TtdhlmofA0BHfcG8qWm9f24CZGqh7yLEJjR7gWnskQrC?=
 =?us-ascii?Q?SFkVEIVNQI8Va4vho6Nh5W5ylS6/8++aJzb2LHaJj/jrxsmsNDzkp/zg1S8Q?=
 =?us-ascii?Q?3n7UG7BqUvZIldQbVtS49aO+AihcQhju/entkgZ+tNh/vEOrsyvnIYzJdqEv?=
 =?us-ascii?Q?xa9eTsGy54LB0Jc/nU81TzQF7hri724WzvlIWgO7huf+ytseD0m2UF/XMybT?=
 =?us-ascii?Q?gTDNvzj8VsbEo0aqFjyl/FiQvMtMM5bzaXna0pThPOe0agK6t2khOc8OtFE2?=
 =?us-ascii?Q?zzFeJLn/a6bkQmPHKmOKKxSlKcXcH0NaMrtTJtmiWujHiVVfteOtm+PMA3wY?=
 =?us-ascii?Q?O2Y1d9oRVNpnI0iEFz+s4ESNPjaOwGgk1Ss5IpGZze3ARLmFkbGoOV0crMg/?=
 =?us-ascii?Q?9tIWwvbQOq61m87vhGT/Eb5Z6TSEzJsCGoOwceExHmoeV4SAe642y8b109bi?=
 =?us-ascii?Q?4IJMe13ePqfo5IqJ2wBeTHTPBao2CSgOE/aQvm1SzW9kbmre19g/fB9Ny37C?=
 =?us-ascii?Q?sUoMCp3N8bKmPTYVM30j0q5DMJ/IP99MWaiTBG3W7SuPcCU0eidx1tImWcmW?=
 =?us-ascii?Q?JNQcAoA1z1k2ymFWToDxa7rMASdYdWxej4r7Xm31gIErDEXjAjGQRPqimezz?=
 =?us-ascii?Q?AJYrknvr1e2B8+cUfcMksSpPkYAMy6h7Swt4zrYFHN4dePjAfntTVTPrul2M?=
 =?us-ascii?Q?A7IiEdp44ws=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l6ykH7HGfAOzSCUfflQo03lQQYhTYDNdm1XMTLe32YZzn78vQrlDLP5/sFlW?=
 =?us-ascii?Q?ITXNDplB3DzatKO9zvXMTK2gTaEyKVuhYgTj1OsYBVrCoowhLG5Ex6A+TSgd?=
 =?us-ascii?Q?Rdql543uKQpHMv2/L8AJtQ4NVM8GtOZ6J/XBQI9AV3j6MrvHfenXvDg4Gfys?=
 =?us-ascii?Q?xNsF47Or3SYmdyN3SuppmSl9Ct9bj8sq401lKh8lt5li0vrD2I4uwUEj/NGD?=
 =?us-ascii?Q?QttRZwYgvKZ0JZK0FOYbv8lfOOUss4veBqlUB7l7gh3FmNoR1zk6vSnjDCr9?=
 =?us-ascii?Q?R+tQByngMQH9qT3dj0VfZpJDAn/P04Z0t+pr7QRl/M/aEEk5iT7lMRKvqplf?=
 =?us-ascii?Q?MPnJ39l5zwI1lEQQLP1e1s+al2Qte0rARnADgHuCBRmmNPGXQ66rzha4qiMS?=
 =?us-ascii?Q?pKvq3CQY+tiLDW+QPEPwtDffWONf663uXQ3HNUtSUERyBCTcV5LlhsXKBy17?=
 =?us-ascii?Q?VT/fr8ZGcLgJ2TCQzxSztDJ0mXWPIjiNVDuTozAP4bpPfhVHRQxmVkhOLGuu?=
 =?us-ascii?Q?lXw91veWTYBi/tOdEvifFO+Hl/Lp98LvjK+gsRbXBv+KO/PRLwJJ37tNVRhu?=
 =?us-ascii?Q?0REfpg2xfdynGmYt6cmX671u47sFtCyj+mhuHP1mL5fybRN5PdPcmWKcY8JI?=
 =?us-ascii?Q?F/c/qwYKktjJfqKL9i0wlz/hcOLNb5Cm8GJUTArG8R6uedLYVNeTPib9xbIP?=
 =?us-ascii?Q?3g+YUJcu613L+khwd6IOit0k5Xcv1Zxnwupc21o/mZN9X6G2MCfy9uZXqdig?=
 =?us-ascii?Q?mInz3HjkrFlpzrAHzYZXTgZIHtwlL2kCnvcl37OyqwjUpCWUsyrrA+sBBhQk?=
 =?us-ascii?Q?O2SUox8gVHSt8T6DwcdZii7qvj5kbD7MjOMuyw30TlTKKAFyKZx9HZJYcCjY?=
 =?us-ascii?Q?RGIamCjHctq9BmmXxP1H1To8EHhyHX56EcZ45FMWRkQ8nZ9kbAKxjdvRwTr0?=
 =?us-ascii?Q?+SMJnWEHaFoz9YYu9Sjmu4HzOns90dxEw3J4iZFWDlluGOA0AtYkWVP+Nk1M?=
 =?us-ascii?Q?nVuL3qz+1czBGefx0gCnICZPuxSEvXHkF88YqScvl91eIpumqgIIFsz4uuXr?=
 =?us-ascii?Q?5uJlQqpoSnYX4wVm1SBIeY6b/M3HGrFX++WbCLyTMpmtJonCDoFD/unFcq0u?=
 =?us-ascii?Q?cE/VHdqlvGhfi+REXI57EP8Ky6c/iKREfQ8wxSABTtI/O9CL9ShVJCyRJ8Z2?=
 =?us-ascii?Q?5kk52Fg322FYEED8gWj2G+2MUJB9fOT0hXx35ORfjW832YXP4vZAcy94aYSP?=
 =?us-ascii?Q?7+xrmXtCj5ZRt6iVtyMsH5Ix9KSLBq2xe6xkUFLrUpICcIn3AJty3VlwcGaI?=
 =?us-ascii?Q?vKAo3lZG1UWhfRtyjzJxMYA7iPZcJ7NXMDko+nhkf0ya5XVMk9rPzvpl/NAr?=
 =?us-ascii?Q?8phwE3Qo7PyxLOAJ+9cFtAWd0eO3T39NSVXXBtr8guoHr0INbisCZGhuyF7X?=
 =?us-ascii?Q?0iVwvRQNeKbNQAq728Ml4UcGaQNYxM0FzMlOnHNA02dpFhbwM3HVWx5gErnj?=
 =?us-ascii?Q?FdkgYcakr+rnTrpAm5P5NzQyQTdIWaivbe1Vvw7jYkL4TkAwaosOj8TDJTDA?=
 =?us-ascii?Q?kN9pKJihi8uplxxWzd6PckA40gqUZtnVHIBpTmypcnabWTzEeW7/jvsyrJJ4?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S9oec9WJ02Vna6PjENIpBh03UUnwm9oOtwao3qMrrJky5CtiSKnyBNqwYxa/xeH8QYzs4svvRTvFhEY3unKTs0pTrikm70JFoZ7wYqlHT/etaAfpuVv7alN8IRr8iHI4q4I7bXSgDfTguh0iRP+/LapxtS4MsAGNcvtPwL75aK8Pvjk1S8aGjw5tjbyWUXM6DJOnSrouUFZT5ZmNVh+z7q1RQVY+rtUDrU1SjiA2m6gQJ2Lwlpxuc4kP9J9BwmKBzRUHPlgGBdvSh6qnyOIhOC/Eekm5sPrtKF/UpvQqQtkDF4VqfLIL8kAAfHlV53iXsJ0y1NRq5uI8AxeTtIb4c4+GG5gyacTGUxJT3uJxngP0AX431ekOzSgKPyBV5l0MQIT5t3OAufzBx5B0wA8ajToe6aBFTok50kqdOge8svh/hmJHOv9AMzcvilrCHtHn43fdhrQAQLB/RwRK+yfLsRWeHPvVrHepFlojgQXNhB6hso8UPq7EFX7ZtEFIJ01KSePVefp/zgG2R3k1f5Ig+zoq6h4U+odBFcYIETp3LrRe73glE03fx9zA5BByhzGbo5AeUnTCzC0LaybPo/DtUNLmkehgutgCge3NOht15x0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a07edf9-e838-456d-0c36-08dda9bc562e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:20:52.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PK2OHhbTAF1diidloPp5V8AnzSyd0pc/bTw+zJ/MlN/WmTmA5pJdkpTBiJ5PTDKfAo3RAOWvNSfF0JksEDBt6JhbNALZ9To5fNJfMT4qZDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5865
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506120110
X-Proofpoint-GUID: k3znFo6jo7ax_PyRB4RJNwblyYDGOAhF
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=684ae248 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=zWVp3tX8IjOacNazXq4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDExMCBTYWx0ZWRfXwXcwEJslU4ZA 1bE4Lw/ATEiq35dC86zNQ6y3j937RCVKHhHO8qCBdzzkFsFDyY5ARHqamHS88k+V8+lpN046qfl Gn1UPcntBhjJkpq0fw5Ncc/bcjgbpj2QVi2+Uh6o1V8XTUaYC4qB9Y/A+4TGLZIas3QEtRojI47
 EUIcg2ed7f963kk1uYthXOVIkKac0MmrFyDBe+wixTzMS8shfIKE9Jj3sy9NLWMIEaSMiKgFk3S h3KOfW/q8EsR+b7O+1E+bqHm4zI8Tey535s59PHgJJfkeelPs9Hgg/hk9tK1s1Iz5mDbTS/vg9J fgOnoxK8LVrkoknwDLS3INt0wMiSjhBbB4GOrSKX/hWAYltGXzhbeFsmCiOZ9YDN9H3ozlvfHH5
 QRCSY2wuC0yv62nBYqLrC8GzxulLlDCFdn+wzpNMNyHdKvgOl7ZALrUn9FUr5KbMmDBlKIqX
X-Proofpoint-ORIG-GUID: k3znFo6jo7ax_PyRB4RJNwblyYDGOAhF

On Thu, Jun 12, 2025 at 10:13:40PM +0800, Baolin Wang wrote:
>
>
> On 2025/6/12 21:29, Lorenzo Stoakes wrote:
> > On Thu, Jun 12, 2025 at 02:27:06PM +0100, Lorenzo Stoakes wrote:
> > [snip]
> >
> > > I propose a compromise as I rather like your 'exclude never' negation bit.
> > >
> > > So:
> > >
> > > /* Strictly mask requested anonymous orders according to sysfs settings. */
> > > static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> > >                  unsigned long tva_flags, unsigned long orders)
> > > {
> > >          const unsigned long always = READ_ONCE(huge_anon_orders_always);
> > >          const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > >          const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> > > 	const unsigned long never = ~(always | madvise | inherit);
> > >          const bool inherit_enabled = hugepage_global_enabled();
> > >
> > > 	/* Disallow orders that are set to NEVER directly ... */
> > > 	orders &= ~never;
> > >
> > > 	/* ... or through inheritance (global == NEVER). */
> > > 	if (!inherit_enabled)
> > > 		orders &= ~inherit;
> > >
> > > 	/*
> > > 	 * Otherwise, we only enforce sysfs settings if asked. In addition,
> > > 	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> > > 	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> > > 	 * set.
> > > 	 */
> > > 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > > 		return orders;
> > >
> > > 	if (hugepage_global_always())
> > > 		return orders & (always | inherit);
> > >
> > > 	/* We already excluded never inherit above. */
> > > 	if (vm_flags & VM_HUGEPAGE)
> > > 		return orders & (always | madvise | inherit);
> >
> > Of course... I immediately made a mistake... swap these two statements around. I
> > thought it'd be 'neater' to do the first one first, but of course it means
> > madvise (rather than inherit) orders don't get selected.
> >
> > This WHOLE THING needs refactoring.
>
> Personally, I think the 'exclude never' logic becomes more complicated. I
> made a simpler change without adding a new helper. What do you think?
>
> static inline
> unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>                                        unsigned long vm_flags,
>                                        unsigned long tva_flags,
>                                        unsigned long orders)
> {
>         /* Optimization to check if required orders are enabled early. */
>         if (vma_is_anonymous(vma)) {

I hate the level of indentation here. There's really no reason not to have this
as a helper as this just solves this problem and any sane compiler will inline.

>                 unsigned long mask = READ_ONCE(huge_anon_orders_always);
>                 bool huge_enforce = !(tva_flags & TVA_ENFORCE_SYSFS);

Huge enforce is when we don't have enforce flag set? This is super confusing.

>                 bool has_madvise =  vm_flags & VM_HUGEPAGE;
>
>                 /*
>                  * if the user sets a sysfs mode of madvise and if
> TVA_ENFORCE_SYSFS
>                  * is not set, we don't bother checking whether the VMA has
> VM_HUGEPAGE
>                  * set.
>                  */
>                 if (huge_enforce || has_madvise)
>                         mask |= READ_ONCE(huge_anon_orders_madvise);

I find this more confusing, honestly.

I far prefer having the never checks up front, and I prefer David's 'explicitly
deal with never through negations' approach.

I also think adding these READ_ONCE()'s here adds a ton of noise.

>                 if (hugepage_global_always() ||
>                     ((has_madvise || huge_enforce) &&
> hugepage_global_enabled()))

This combination of conditions is just horribly confusing. And why are you
giving an explanation above but not for this one...

This is just combining a ton of logic in a confusing way.

>                         mask |= READ_ONCE(huge_anon_orders_inherit);
>
>                 orders &= mask;
>                 if (!orders)
>                         return 0;
>         }
>
>         return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
> }

Thanks for the suggestion but I do prefer the proposed compromise solution.

>
> >
> > >
> > > 	return orders & always;
> > > }
> > >
> > > What do you think?
> > >
> > >
> > > > +       return orders;
> > > > +}
> > > > +
> > > >   /**
> > > >    * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
> > > >    * @vma:  the vm area to check
> > > > @@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
> > > >                                         unsigned long orders)
> > > >   {
> > > >          /* Optimization to check if required orders are enabled early. */
> > > > -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> > > > -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
> > > > -
> > > > -               if (vm_flags & VM_HUGEPAGE)
> > > > -                       mask |= READ_ONCE(huge_anon_orders_madvise);
> > > > -               if (hugepage_global_always() ||
> > > > -                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> > > > -                       mask |= READ_ONCE(huge_anon_orders_inherit);
> > > > -
> > > > -               orders &= mask;
> > > > +       if (vma_is_anonymous(vma)) {
> > > > +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
> > > >                  if (!orders)
> > > >                          return 0;
> > >
> > > I pointed out to Baolin that __thp_vma_allowable_orders() handles the orders ==
> > > 0 case almost immediately so there's no need to do this, it just makes the code
> > > noisier.
> > >
> > > I mean we _could_ keep it but I think it's better not to for cleanliness, what
> > > do you think?
> > >
> > > >          }
> > > >
> > > >
> > > > --
> > > > Cheers,
> > > >
> > > > David / dhildenb
> > > >
> > >
