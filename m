Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D71DF254
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265875; cv=fail; b=lKnnMsEMqQGE2moKwVxB5ujVXhRSdYJ0qeu8oIUTbTkxJKYIpYjG4K3bmsR1eADuihFOuVJ5fhmV8K+m4X4lZOqv1emHhQMPVKp+XsVOwKhd02pUx4NGO7cYuA+vtyPqPhMai2iV+1JXyShdXTZ60min0gWbdo5L10v6v8QyHpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265875; c=relaxed/simple;
	bh=yBDcWgD83x1vtKzMnFqQ8h8cU6SwHVaKiAEM+srv1hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=la0EiM2dfDp/yMpjhWussglEg1BWtv/1wNlAYUC46IZqg4iNhZF3ggNiSlyfKxmlEKD0wHRSlVm4yYu3ad1h55poq+fGKEcwoXdZDSLK4NNj2+EUd13Z5gQ1ylKZb+DsDkiucCF1SX3wFFVG2OaOFkLsDUlgWI/s+F2xXz7A8xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yd15lSHu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WMbQzXAg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yd15lSHu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WMbQzXAg"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5439l2vj012021;
	Sat, 3 May 2025 09:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DRIrRrHvuY4/Q/+onJ
	gAwJBQ1rKvBvrHu1pXz28sEuU=; b=Yd15lSHulMqeCLYBKCUGGXX4NJYlnRA0VI
	AU/L6omaDspJfUL3XByry+ed6ujjRL/Ogwi/r7/za9vM8x1LpOhli/3XIkO+Cvm+
	UgiMzWUJrIx+VBdwbVAmYmz+bwNY0VIyxl+RAFMZ4AL6DLX+DyHqSE4BN73cJdhT
	XkRvji1EkAw29COfhwi51r+pZa/m3P2Qh6sJoI3/0Fh9cBCff90oN7/4/vKsCxp6
	4dWXOrremw8iPqeJinmLim+46Yc0sUZ/MYpZZKmwSQYC9fV4k5QGIiU43Ct0wPh5
	nDG2UFd2th0uH8xMN9sYwGcWhIh/Fs6/JKj2Kl5jMo+bdaqMqdTg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dgtj8038-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 09:50:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54370cuP035632;
	Sat, 3 May 2025 09:50:57 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013076.outbound.protection.outlook.com [40.93.1.76])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcemk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 09:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTmk6GLGF2aczfpRdyVfutQEptSjqIa6IwDT5hDZED5/bikSRFf/WCbe/s902oI1F90WOaNZCdpC4ECk8AeRxsHd5MNXhCIepfScYiWEqsh4VZ37tN0m/443mkRQEWaeipKtJxdhQ9wW2Q9yuDQs5J3becvnKuCqZG92ohosVYCXWZcX2n4QBguUc5lbPt6PV3j/6q4JSn9vYiaYxysX851n+NeEf8P51zhBE6C6QdxikW5wAzPeb3aG2sM8xkbko0+TeVl/dd9Qn6s4hxO+rj6DrrnphttXQBVmklTMm689LWT7UIGY1hGdBYR5FbB7s2xZjpts/Y77TpCBRN6NZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRIrRrHvuY4/Q/+onJgAwJBQ1rKvBvrHu1pXz28sEuU=;
 b=YB2Mc5Ybp4HqdW59TDci0BPfNSdozhcBg2TXCpru+PPlJqbsnfglHKZzdI/QjxnvR3f5/1PotPQ17U1OJy3eBTsoLuKV5Kd7V4o+r6WSBzV34EDgB5r/rJsg+YKCEpDxpjQZyQ2uHHPveExepH+jSKvaAG7JQsZE9mlrTrAHUv79SPOAZli5FJXb/uR3XSuUcPXyI68+0549nf8ZadIGnfHaEmzMnXXq7hf8g7GDs5A3GOG/qpHsNlhz2xF+Ap8M6xDAlcizhdyDv1czoGkmJi140Ovbg65Z9iBSonN8TaKUWYGdrkSvzRPY6ggofUAzgPbhuIDRmmA99GrkTqF49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRIrRrHvuY4/Q/+onJgAwJBQ1rKvBvrHu1pXz28sEuU=;
 b=WMbQzXAg3hNlGkdrZUeXSCB+TaAnKBhLV7UwybxDIySYVS0VmpBjGEYAtrL7ashoZZcIFh5057InxQDRc0js/L13iykaV/3sJzLIRmtdlcwkS3qgIYoNdgHeqr4z9yKZrmUpMl0lpZc2CYmgCrt/Zi95smjaiH+8tGGJiUwcPxU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7960.namprd10.prod.outlook.com (2603:10b6:610:1c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Sat, 3 May
 2025 09:50:54 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 09:50:54 +0000
Date: Sat, 3 May 2025 10:50:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Ignacio.MorenoGonzalez@kuka.com, Liam.Howlett@oracle.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
Message-ID: <ee95ddf9-0d00-4523-ad2a-c2410fd0e1a3@lucifer.local>
References: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
 <ad1aa0fa-f1ab-4318-b423-35f59ebf0599@lucifer.local>
 <60bc73b0-48b3-4529-8a73-2b85e3217e59@os.amperecomputing.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60bc73b0-48b3-4529-8a73-2b85e3217e59@os.amperecomputing.com>
X-ClientProxiedBy: LO6P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 725da663-fd37-4798-8d87-08dd8a27feb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L5EKRCF2VForBX/WkIwlVgRrO6aO3Rn2cJnAkB5b/E+CzxtSbH4swB6B/IMy?=
 =?us-ascii?Q?SByw/mBUkFY6gYrh1yOC9HvsO+TDhWwvV0iY2K3QLPJOnEH5yHAPbIrz9OLk?=
 =?us-ascii?Q?TjuuXkkZUfpJc5OEQJc8/eFn71ZDrlKInOT1wJxLQXu0UGn45Z5XwxRF/QSS?=
 =?us-ascii?Q?huOWqHzG+Z8s6qLZ/sPcdxBRYIVu3+jlfPo6TiPKm/O+b6a4CjguMFC/RZ4g?=
 =?us-ascii?Q?NfZGqeW+wvByILH25n/N43frHghCcLJvW1VfQgvmEpdfMNRUxw+TfWZcesiG?=
 =?us-ascii?Q?eu+bHbqoRwDgKs3DwubqASZ+yVQ4mq3/1ophdM9IlB3bDxFck+PU2KwNHhfh?=
 =?us-ascii?Q?XVyxc+z+3FGyACeq2Jcnvvmj0J48UGIcwpi8BF/8qys8KHtagqIqoWmn1Po3?=
 =?us-ascii?Q?KJhr51D2kCLD1/8iNYML0VfKR3KjehnVZfAzkWRNPYYQ3lZY1Fxx5PuiH/Ot?=
 =?us-ascii?Q?yM4Hw+C/b0nsARxbSGhpt6PhIp4jZc2CbEFyz7LcAVT59znk5Gv5+98UlJCB?=
 =?us-ascii?Q?TnSUlHJvwfcn41DMvPv8k14UnK0jy2EIbZfDKvxwdSw4aN10zP8TlilLgsrc?=
 =?us-ascii?Q?sLVgl/SW78TyyVHtpyx+cgGBbXgKX2RlWJAoXWXIGDpQIJRZG9AN4oxziwXu?=
 =?us-ascii?Q?MG1zlKSPdqYKEZxI47EGH2HtmLt07bFlWnxj4rrrcCBvq3ktzaT9Nz2UJ/hW?=
 =?us-ascii?Q?AVMpNKFwryUxLOOJIdzskiLHhQTsmDzs21uF8KUdQIz96aI3K+mhboL18hYh?=
 =?us-ascii?Q?x6rrEMLiGRQvY7HSD8MgJ/B27res5rGDEFXCC+ypbYmjirHCQU2TGRK5huhZ?=
 =?us-ascii?Q?LnQziSd3XYcB4nDxiSDrNXjMV4aaiC7fPZWjN5WkHsI6KpjmuGWlsCTc60rh?=
 =?us-ascii?Q?pYQDimUBl2asipp6KtMHjsgB3sG5EUVDs2xFZ6mrRWI2nGpP4hzN9+V0ZUsh?=
 =?us-ascii?Q?ifU6VnzP64fG8S6sR+g/DthdE6UfsG/3aHBmFOp5qSCeHAKGzGKr3LG1HH5Q?=
 =?us-ascii?Q?yLXZNSBBbObkQ5G0875MMaNtQtiq5s9tJliGFmqi7GRE4xYzyiCf10Jb1D1R?=
 =?us-ascii?Q?h16hI94gHllA7K0SYTpzUhMhsIfg9FPk0ccPLMy1tMoIes9kAEWyaC2JRvq+?=
 =?us-ascii?Q?pG9ozpZmOHQdv2zmfxmyXUj/W9wy21HaeLquOuCh90cFrfZzugx3a7g0Ohgb?=
 =?us-ascii?Q?R9HluF4YD1Pik1j9bURVG8gcyJSKAiVYCCrDi+lASfPTkwxEPRqTJOyWpQs2?=
 =?us-ascii?Q?g1LgdgMK2tENzczbFSRhvPSDRUkz96HBgYvkANvXPxOhDt5waaWBN4Hx2sE8?=
 =?us-ascii?Q?OgmRBkFGzXanFTGsQHRjvr8pTVRf8A3MOeyzIO9Faw555Uc9h/KtTyrlDa6/?=
 =?us-ascii?Q?r8xWcKSW99S9cWEaVlTSQBv8pYalQMD9rHghdkCuCSW5I6b3eq6JTkU+jfwg?=
 =?us-ascii?Q?2fYx4DWww5k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2QGKuyBR3dVRq/DNvhmGJPDBH0pPCw3HrE3sIPtL1Z1Ft+UUPb6N4A+UCwBL?=
 =?us-ascii?Q?I8K/by7LfIstTrr7A94SVTLx+SKokxJghVFothDnAou01JHCuWCvfcX9Vn4o?=
 =?us-ascii?Q?YDx6m9i/sZuARz2lz5XFWdmija1wV2f/K+JGKs72EIrHBpQZFLDhfqY9y5iu?=
 =?us-ascii?Q?vmYNfYz4tsg3x05HsIf0WYqT9CwCKbXbvw2BB54eHS51xMHlJjuqz6TOLPTA?=
 =?us-ascii?Q?/OtY3No4rkbklZx1cmNUwdNOExaAJJ+QgFjTU9ogzH/TE3d0geLzQf7GJHGw?=
 =?us-ascii?Q?gX9IGHRz9dR1hr+f3yQFAgCz7YTwe2HKLbLc23tb0sOlK1VM+QYDm3kW35cP?=
 =?us-ascii?Q?+SMYhRX+Fj0+xDvMFUY0byQ416MuHpKdbRclO2UXxKvXE5NdO+E/+N5GfPCA?=
 =?us-ascii?Q?HqEK+SMNC2gvAnc7HrJbA7a/grlEe+aMWotMS3iH+cteDioH3Icrp4ptZRNk?=
 =?us-ascii?Q?GSGM69KC16ghmebBX159JoICQmom+qU6EP/G0hzH/YsX7YC5WcamcLXvxrGg?=
 =?us-ascii?Q?vlf+iqVuxzyyyKYs2H4YrUWlvBEFLbeXTAOEdRzPLNMWZrX+JIE5vzgpZW6+?=
 =?us-ascii?Q?p0NsuAoKuaJ/A7kMOpKdclRBnJikklE7ywaqHyhAd2opkXmpvuoLWT0ffx+I?=
 =?us-ascii?Q?dIGmVWRhdwFjH2dPNewF1/xaU9zV8FOSLnEZWSM4KU08FxUT4drvoSDrm2Vb?=
 =?us-ascii?Q?tbo7LUJwDqK5mlagWGnOusz0MFZM3Gxmi4lXAk3K5paXQILsG3PQJPYfkwQ/?=
 =?us-ascii?Q?FqCHZ/RMWggO639qmuKm6GxQVjbRYp+xEdBR2Iuex2UuTgeSEu72sYOJpS0C?=
 =?us-ascii?Q?w+IaopAyNAvY1pwI7eXHO764IFDnaox9SrElt6biHnpxUbtVfP1OD4cWNBcw?=
 =?us-ascii?Q?PTmHUp1HGqcnt6mkNaZipBBiQXn4Fis6Zr2fcLhOmteH0Bupj4Z/TxIXeHqw?=
 =?us-ascii?Q?Bbs/Nq0sU03iqf28FDsUhZ15HA/kM0A3AReiH8Pe5f7K7A9jSvNVNraqKQ6k?=
 =?us-ascii?Q?1DSEZh0owHvAhpjb3YFvgMrtBQfzx2rQS+k2RAYwxvAcpiJFmHOQxSpeTBW7?=
 =?us-ascii?Q?qL72/Il37DWP2xZc8RjCF6byGoX83aL9SkJyiF1/OApZZ5pXq6ssJqRS4j/V?=
 =?us-ascii?Q?VA8RhlPk0fdDtzJO73xLTL5BJx/XUJHg+9XjiwNlsZ0pJkXUM/LcwbdXoyRW?=
 =?us-ascii?Q?KZ2O9fBShoSvOD7CgAMKL9lvUPE8XgalmkNYFfhqLpHBupQdAlp74pFyzZ88?=
 =?us-ascii?Q?qZM/joF/DScO6NueGrFFo3FfAPBR9Xrpqqttd9+LW+51DVBbVCmu2hCIMqY/?=
 =?us-ascii?Q?jeH+2/2abtxWcHiKmuA5NWn8+fsWMe85Jjw06bMkgXh7HJ4w0Krc94L+Q4Eo?=
 =?us-ascii?Q?ohLbNemqJwrorBGeLQcbtJ238+tK3W6oGilrr+a62j5fcmpJKeNYDUqkp8t4?=
 =?us-ascii?Q?lRyuyoTT9jXmnW9AKHtsMjQAln0gbg1lBHNfLZJNZHnKZ/etchY2B/OeAWNP?=
 =?us-ascii?Q?dEX392mDCxjXF8rdgbcS0tFDmSmQI/08XJWtK5DbHfo7JmMCjkd9mCkmRRg7?=
 =?us-ascii?Q?HKJXdMGu3f5XxwU7XSA2E68tXT9UzFrY4t7AyKL4CDs+u/k8STlzO5yvylcd?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qAF83mVUDU/E68Nu2yaBnJVgVWb0GIhyo0NEm8tOvqOKufQcpcaaNj7zPS92QPXT4Sl+2jwYUg4lDFw3i5ID6lghHm2d0phC5PEI4BcLmg481mSL3eMAT2pq7Mt+ke6ynypqwGe06VgdLvvuDDiK5J4L8Hu3dT37juIxWJ77SX+dwx9IP/gQgvorTiF5wtb05ZvJIwg1ILnKyMQHiEJyd8knCbBTW5I2nz2DNHjiEe8n/Vrk5hrgKl64SsvsFrzgf9MN2LKlTT6VTNhY7fXLviKMb+PTUJYoEgR4M/Dd9LFpDL552ip2B/iQ9uUa+KvJQZzt/3cUcfK0yb912dENd2F9+PxPIA/Cz8CbAboYtE0I3imqVn4GtzTEVhltnp/Am4pWLSk8jMdWP0M+zhhzzhO5G2qHAwEV3csRlBwqQ01WEjUXvsLzbHH2xlmzD0siG81A3vYkqs+DS5uWpW+E5O6h8oh+VAUe2WyByBk2xaVOcveeSpL93ic389DRRyYWUyjYb1S0xMgz/mWttru1VBJCmG5T6RiQ6lUNSKFq+QO8c0MuSkEHLrxcrpfnYVEi8O6sZ+PuvDhU3ag12VfH+4Y1yLTFfOMuYrw9Pv07yr8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 725da663-fd37-4798-8d87-08dd8a27feb2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 09:50:53.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xD/dCiUY9Br8sEwFzkiB7Q8VJA1T+8cqTdrg6YcjsLBgXKE0XXk0qoo9MhvCA6iG987l3+IPGTkjxpLGe1SACysFnBMWTnX532KjS8nRWQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7960
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030086
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA4NiBTYWx0ZWRfXyGD2Jnbf55GR uVfanzc2m8PP4RB7ABts4TeLlDNUHUZn0EDMya0IOeVwMffZ+H9iIEeAhgq0sTwvl7sNkf+GeFl ysVGy7ZzLIeY9gtojixXNI43cVN7HmLVifeH22wKvnMJLitUZ4nqFFFXRm/+2f4P0gKacEYw16+
 HTvSwbIAJnH8s1ImX6z2yhpcoFQFfRup4yNawWO6Nzhst+5ah+L3mFzajNlTDSmAkUbrt1zMC2M bsEwWZYPaIb3dEJH/36+ajbrSEX7+u83NUzcJdBQbYIJv+mdRF6y+FB5zsCNx04kpyR94FJgNUg aBYm35x82WnrltUGh4YdNxeL599ngtWUHSrHucPL0hlRt43M9RnoXtNNBH59jFR7gyMTufIn9yh
 eLbOtiGLywsnFgC4H5OdU2NW6N0WFeMfeu40Kfp5Xb6eBqe9jEy+YZXR2GVhhgNkwM6oDl7D
X-Authority-Analysis: v=2.4 cv=I6tlRMgg c=1 sm=1 tr=0 ts=6815e702 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=TAZUD9gdAAAA:8 a=yPCof4ZbAAAA:8 a=vzhER2c_AAAA:8 a=ID6Ql-SC4mB76XsX2w8A:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=f1lSKsbWiCfrRWj5-Iac:22
 a=0YTRHmU2iG2pZC6F1fw2:22 cc=ntf awl=host:13130
X-Proofpoint-ORIG-GUID: nn3FXCaToOEXckXJ3I6cFGPOAPl50UMk
X-Proofpoint-GUID: nn3FXCaToOEXckXJ3I6cFGPOAPl50UMk

+cc Matthew

On Fri, May 02, 2025 at 01:53:15PM -0700, Yang Shi wrote:
>
>
> On 5/2/25 5:46 AM, Lorenzo Stoakes wrote:
> > +cc Andrew.
> >
> > Ignacio, you should always include Andrew in patch submissions to mm :)
> >
> > +cc Yang Shi who added this in the first place in commit c4608d1bf7c6 ("mm:
> > mmap: map MAP_STACK to VM_NOHUGEPAGE").
>
> Thanks for cc'ing me.

No problem!

>
> >
> > On Fri, May 02, 2025 at 11:31:41AM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
> > > From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> > >
> > > commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
> > > the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
> > > CONFIG_TRANSPARENT_HUGETABLES is not defined. But in that case, the
> > > VM_NOHUGEPAGE does not make sense. For instance, when calling madvise()
> > > with MADV_NOHUGEPAGE, an error is always returned.
> > >
> > > Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> > I don't see how can this cause a problem, and it fixes one in practice, so
> > LGTM. Though see note below about CRIU :)
> >
> > I also added a nit below, if you address this you can re-use my tag.
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Yeah, I agree. Looks good to me too. Reviewed-by: Yang Shi
> <yang@os.amperecomputing.com>

Thanks!

I also believe Matthew's suggestion (see [0]) is very much worth doing
here, in my view doing both is a sensible approach, would your R-b tag
extend to that?

In which case, Ignacio - could you apply both Matthew's change and address
the nit below and send a v2?

Thanks!

[0]: https://lore.kernel.org/linux-mm/aBTCtOXBhUK_FLU6@casper.infradead.org/

>
> >
> > Thanks!
> >
> > Do we want to back port this to stable kernels? If so we should have a:
> >
> > Fixes: c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE")
> > cc: stable@vger.kernel.org
> >
> > Appended here, and Greg's scripts should automagically backport, assuming
> > no conflicts or such (I don't _think_ there would be...)
> >
> > > ---
> > > I discovered this issue when trying to use the tool CRIU to checkpoint
> > > and restore a container. Our running kernel is compiled without
> > > CONFIG_TRANSPARENT_HUGETABLES. CRIU parses the output of
> > > /proc/<pid>/smaps and saves the "nh" flag. When trying to restore the
> > > container, CRIU fails to restore the "nh" mappings, since madvise()
> > > MADV_NOHUGEPAGE always returns an error because
> > > CONFIG_TRANSPARENT_HUGETABLES is not defined.
> > Yeah this is really not a stable or valid use of the /proc/$pid/[s]maps
> > interface :P CRIU is sort of a blurry line of relying on internal
> > implementation details so we're kinda not obligated to prevent breakages.
> >
> > CRIU is kinda relying on internal implementation details so debatable as to
> > whether we should be bending over backwards to support.
> >
> > BUT, we also don't want to cause unwanted issues if there's a simple fix
> > and this seems reasonable to me.
> >
> > > ---
> > >   include/linux/mman.h | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/linux/mman.h b/include/linux/mman.h
> > > index bce214fece16b9af3791a2baaecd6063d0481938..1e83bc0e3db670b04743f5208826e87455a05325 100644
> > > --- a/include/linux/mman.h
> > > +++ b/include/linux/mman.h
> > > @@ -155,7 +155,9 @@ calc_vm_flag_bits(struct file *file, unsigned long flags)
> > >   	return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
> > >   	       _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
> > >   	       _calc_vm_trans(flags, MAP_SYNC,	     VM_SYNC      ) |
> > > +#if defined(CONFIG_TRANSPARENT_HUGEPAGE)
> > NIT, but can we use ifdef here for consistency? Thanks.
> >
> > >   	       _calc_vm_trans(flags, MAP_STACK,	     VM_NOHUGEPAGE) |
> > > +#endif
> > >   	       arch_calc_vm_flag_bits(file, flags);
> > >   }
> > >
> > >
> > > ---
> > > base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
> > > change-id: 20250428-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-ce40a1de095d
> > >
> > > Best regards,
> > > --
> > > Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> > >
> > >
>
