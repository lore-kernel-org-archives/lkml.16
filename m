Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79921F09AC
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110318; cv=fail; b=o3aElQ5nNpkD3ZBcVlQjxmg/dSfguaKD+Rb9uWr2uZkxJi/QuM+4nM9FQmzUgwfar02b4lc7mFyMl0R68n3zGzlJgEfcdLZvU+9faM0++DzkSfeGh9HJTEmX9MsYIHZUC66cMrB9iaAc0ZkysNv8OMm1hegmNk3ySv3GIye6dXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110318; c=relaxed/simple;
	bh=4DEB9g1VzMwUSeWL8JhhfQpPySYbMQJ/dVQLeaazewg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BlSwlBv8YhfJuX1LBArrt2BcBhUxjbl4qOYuVL3KGgLDHzhK1wLRxOO0HI+pm4nVlMiJWnJ6swhP/lsNr1rL1XEqBvCzW1X1DCGbp1nZdv/6S+WVanaP2wquShy7fAl0UsRP/o7SDi0GgsKkvIni6PGPHK6j0dRy8vy8dx3pdoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fbpieD3o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TOXPg7A1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fbpieD3o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TOXPg7A1"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541EMxtE019681;
	Thu, 1 May 2025 14:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VoVFVVl4jBME79auOh
	KsxTFTlP7qhBTeq/XrbgWH+Fw=; b=fbpieD3oZTTYTW+lLW9fjRI7wyw8ZC3XYU
	L6BiAq/425zTaxlH9yqw9yY2HeuRo84p4ufOBFD3o+ZJiAp66jgiJe4jplQt5WsT
	phMgDRvAVP8oTbtQwieN3+WhozPP3pitKQBvHqbsRGmQBtT2RSfLrhmQuKa9As9R
	MLv2vUfVSVDWJUF4a8LKDv3VRs5huIbL0CB7ElQrAFNlaaczOl3SG9gQk2I2beyE
	vRnG/93QxX2ELYQ8IbrWykCg48QOX/8NBGRu07y1NhSWOb3Fq9nyFj8O+qEMUiY4
	diqPiSVbx8JAyfmY6UXeiwNAi1dOoBid8wRGRry0sqd8VINzNFdw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uck4j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 May 2025 14:38:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541EcMMZ033498;
	Thu, 1 May 2025 14:38:22 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012053.outbound.protection.outlook.com [40.93.20.53])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxckhxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 May 2025 14:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSd0HnMcXn2OA6UVEc8o25wzySbF9q4PuZptfSf1kx1Hj3muYfl4p8KSi4PHL9LHbxYkOv4fM8LpTZstF3UOEQeAYq46kcLint23xtOTmE/fFByx8IfMjQP/o1CAyp0q6u7QA2l8l8Yieihow6A5SRmAG7sKV2gUyocsrEK2Hsgo7MZ+w1p1pnNRem/Ek+r0CJMglVr4+FN+k6VU47BwoJarXWYDAl/yL7Wt3hGO+UAlU7Ohv0Zu6oHQLcwvPX9vXxSQdwDIQOB8lii4t72EXKE/tWZSUqKOtvhha5lkzLT+B7okA6GbfBOoOtQTsfMXQ/P0PjwjrpaKMnC607WauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoVFVVl4jBME79auOhKsxTFTlP7qhBTeq/XrbgWH+Fw=;
 b=j6rRDN3kOqQZjHabgPAEvwYacvk9waR1j/bakfK+iTcMNTJ4CH9yQQh6zEg6NetYWRF/Zqx4/NdZuZTbmSdQ6uXekGo9PtMShBzVpUrFbeCCEQId35BKwa7FLfHnemA6dQ9Wwb6YxboVKpgBsmU1FKxF7UJA3bQKZ7LQi8dQSkivegqIa41irx9IS8ikD9c3GXo3n0pkBaQnOU3uO+Hq8J4ky9/KWz+ElZOzRaYxlW6neXSHPQiAQ/6GONYvUz/mtmSeIBQj/S9R/xui0Df6V3tSczjsAiePUk9E1EdPEgaGBQNIq3XByc6dSZxYzOE4GssRIbzsQ7sMQae1GJQhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoVFVVl4jBME79auOhKsxTFTlP7qhBTeq/XrbgWH+Fw=;
 b=TOXPg7A1IlnhxNYRKdx/8lf3bdd39SmEHyv03TKzvR+WhJvdJfisMfHd1l46dn7lPMmyWbPXEv3FJ9k7Un+fR6pueIoY2nRqUS52piwJoFY6t9fh9sjFfz1YuJyPyq372x3UB0kK46oU21ZWcicuV39iE+haF+NQeamAX3QnMo4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL3PR10MB6139.namprd10.prod.outlook.com (2603:10b6:208:3ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 1 May
 2025 14:38:06 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 14:38:06 +0000
Date: Thu, 1 May 2025 15:38:03 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Message-ID: <fb53f16c-9386-4b83-9696-1ab51f03fe54@lucifer.local>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
 <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
 <20250430154119.a5ljf5t5tutqzim5@master>
 <ae3717ca-42e7-49a6-99f9-73a4c0be70f9@lucifer.local>
 <20250501011845.ktbfgymor4oz5sok@master>
 <d6d5a67e-efcf-4e23-90c4-4f6e370bde32@lucifer.local>
 <20250501143501.vljk4hriuc3c2yrv@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501143501.vljk4hriuc3c2yrv@master>
X-ClientProxiedBy: LO2P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL3PR10MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b1dc6f-7fe5-4dc0-7bf1-08dd88bdc8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V1AiTr4Pg41BBuu30jElAIlV7UDQ0P7jXX54PJDHALOvREVCSWGSiff4N8PB?=
 =?us-ascii?Q?pmzCUptNVAjtKwTMNdv+tFdLzTvaNto4JvyJedtWhBK0hBObwvkXkZ0Vynf/?=
 =?us-ascii?Q?e5j6XcqFdbHRIQJ8y+G/Y7EgdSqvcchFllYy0cCtYFNFchZ1NXjNaa0ZbZTD?=
 =?us-ascii?Q?+MolqNtB3gcwD/6gVYk8wGe/pnVnPNhJLsjUtHsQhthiJgo7gHsGykVVSM+o?=
 =?us-ascii?Q?4nv61LFJCkOky+qM7O7Cxx8f/xJPWGCM3aLss8d4uPLxIFP26rmkhrxfYIF8?=
 =?us-ascii?Q?AS4oSuvWr9KfZ/sDnRT7oLN1FBFbwOIjUi1lys9JPrR/E6hyXRwUcJlbVvKB?=
 =?us-ascii?Q?+cgwQfkqp7DV+uSKeKYLrVkJj6fzRlqxgXFKdO2CxbNGj4U8WUe0gaRWQZf5?=
 =?us-ascii?Q?AgybzfHDSEprmtgrYDCKkSlWqn55NhpydU6AlWM1TBsKDKEmQw0lYdQ+sZdQ?=
 =?us-ascii?Q?ss/1qosEM6lfheFTrYYRVVRE3p1liKDkhV54TiMVdmezpeGsjgIj438xbC2o?=
 =?us-ascii?Q?MqAPEwmK9IjtJcyg1Dd/WSZj8we04mEgXg9yJtCnqrKHnAdO/HLfaQebIlel?=
 =?us-ascii?Q?/HEdWjIU2UHEQmCVWmIsY/ywZYXv4fX5StVg3LK3ijXkUOZD4EwZ5zjmjzkJ?=
 =?us-ascii?Q?OVOXBruk+YmwB3vP562pmslq3NqV0DZUI+qbM5dDlW8kgnku20PHxV4nFGvH?=
 =?us-ascii?Q?SJwry5dAAMibNvf55vUhAw0e5J0P0ayJVCoHs6644hLTNPpWRDSnnhN8uLI5?=
 =?us-ascii?Q?wtA8OjRGt8tK3TCaAITtT+h7Sf1g8U8wj6NRlMMe5NDa1MqDcAYYU/MfuJ1m?=
 =?us-ascii?Q?OMozPcwJmQJXUZ3/ixuClKmEPWV07Aghska7bRzvm1cKuIRDNzGVKPekFi0Z?=
 =?us-ascii?Q?s4MmSDIcppo3dPd3m+8Pr6yfnTLD+9fihE8I2cSnpefJtrsXyhZDAXWaWFlO?=
 =?us-ascii?Q?2VsD9/KeVSj5ZwBHJg152Wkdw/Kl3YX1VdExANHT2RUP4mDXULcfSrVdMbP2?=
 =?us-ascii?Q?XLlhPUe17dsxUFycwSgin6DGhMHDMbgKR9MZ8a045vAL5PKYFl2zMK0EKaYW?=
 =?us-ascii?Q?DevUdredpCcrblTuGGu1Lw8bD35HiY6FYWXgTmMarT8s0KIGFSl5qf/ctcyr?=
 =?us-ascii?Q?TdR3NlrP6iDy8v8oyO9W6S1ldDm16IkcPgceKjpfGtwVWfs6OLNjMvhkfq9F?=
 =?us-ascii?Q?wUg6MX9dI2mOmVpKrSiuSZAWiwcXADEOj4YV/zXxNv0wjoyjxjTIrLa9fRN5?=
 =?us-ascii?Q?PMvrKGEbkQIeuqmLZpbIegbKXrvpqxWyUl6kprX4U0eM+qw/zCVX4lrSsFA2?=
 =?us-ascii?Q?0eVnOnUwfKI0u6dS6Bnd2IxsOf+44hj1m2G1rhNF1Ik0KrYrQY9trrPPwODx?=
 =?us-ascii?Q?oYiT3uZClwLnY26ZCI+nDDenIupOiJ+G0BAkJE1Q/OIz8WLDHdAdaJJN1UGv?=
 =?us-ascii?Q?Ac5xMLEeyCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ON7eaGOPKCmubTU9d3CaDFhcvPH8nYALX/TLUSqul8pgaGADp/k9mrukqhSQ?=
 =?us-ascii?Q?KdPtC2joSwQzt/fZlB1QXRT5PtDvaFIr9TLdaDxiem1pzW8Zec/XANP5QNek?=
 =?us-ascii?Q?VyZAU/7PA0YOeBdsCC+vqGQ4urMI6j33mMWUsMBKieLE/SIo0wZRx4AZIloO?=
 =?us-ascii?Q?fWk/GjMh7hp5TiAHdl5Z89qNcegRX0jMqQwCkliR1qOEVA4YC+ApIVwWmIGW?=
 =?us-ascii?Q?coRdFnGY+gmZHl9+cPDqH1j9JLpH0aB8FFIt3zVl/cIoqEsdhID1hBJ0ykHH?=
 =?us-ascii?Q?47129dbWjKP204ZBqOheVgpLgxp6B2IfPXQnAxzq/46LpsraZkUH5MXfWJgL?=
 =?us-ascii?Q?/MFXWfybG8IMkPelBGZpsqPOoPhYivb/1G6gA9DNlRRWS0TFLfaSpZ4V3Qei?=
 =?us-ascii?Q?1+t233CKqG9ABN2rGJw3d9F2VrNhbqkC1KvtEcXEihPJ9UVGSuUivJRx+pxM?=
 =?us-ascii?Q?wvJiUVpM9vJ2/TYAYHGpcMYGJSCCzM4yAU+Y6G2oscg5lpcoGiSkQE1kuqMr?=
 =?us-ascii?Q?1lNqi83sQ7THtPaXZVysjPz9Vqfx3LubqoHlWs9aid11vTirgBBAWlyXocqk?=
 =?us-ascii?Q?pQL7bOnypO3DOCe5qKf+zuA0ZpQuO3GFbgrluXot9qDfJUM9W7HRLexCnern?=
 =?us-ascii?Q?DRAiwZQe96TLcu7HD3zlbhxGi/WUaRC6kYLAcSf6SOj1vAdPR6FYi7qZdGW9?=
 =?us-ascii?Q?uxQuvHdYh1xod51qIqzbHTFX/por1E1okojY6K8PFIyrMCWSTmwkdWSrTdD/?=
 =?us-ascii?Q?ohZEjhx7fWcY00zX3ro0+2CCTEk6Emm9t90M0dmRcvZzjaKje8IeFytUAQu6?=
 =?us-ascii?Q?+70luCBul7XSFaYJD9xy6eVRJkgIjewn68mBi/nex0isEC+YeRnodd/gQtd0?=
 =?us-ascii?Q?FcEphThFyAoFw/AG/mTUtZ8/jRByzrHenXxKPUS1jEqFzGs3Es8kQxJEC5fk?=
 =?us-ascii?Q?0/i7z1zmxaish2dh5zz800USrdZNA0h+hA8wAnnqw1sR91AwEyU2evmLLsOx?=
 =?us-ascii?Q?aEK0b2gyAqcUA+h8kpbGTRmPr2woXzAzBElb9M90bMkEvdKuLWhh0k6knKVc?=
 =?us-ascii?Q?lZ4k+taYIbFEaoTVDDjJPHEHEv+fOTJmEDXCrOGgQVxP6F+IeTQD82rjM+ej?=
 =?us-ascii?Q?h9zOf7PnG5/8gkHLct163Maj0+YEpl/c383GnTRKylOLHzwtgyJ+Z3AcLToK?=
 =?us-ascii?Q?gz65AFCd5Ltef49A/532bqi7kermTWaQMPBk6JJ2tyDZ4NNA7Jv+rozS3YQT?=
 =?us-ascii?Q?b1kU58g3DRYvj/jVyO/Rb+Sf3k/sgJZ9Rp8eHo7A7n7324Jui8yss1O1imW6?=
 =?us-ascii?Q?/gSVwUyqT5NXpSz2PhMzs8ZG3NHlvbS+zHm+fwvvJoovdnsRIgb5esS/BZ97?=
 =?us-ascii?Q?blm9FCIz3Phgs5vREhEYIdy8MdmnVuiOhuTSz4gw0j6vzir0omHCsq9W57nh?=
 =?us-ascii?Q?Ah4eYZmu9UL1/bsa31ZGCoTuBiOubBq1R8WxFofZDdkUY6CG2iZtZiXHHTTw?=
 =?us-ascii?Q?F/LpPqgpNXgQYARd+GEWYWeRY9eL0nDSGOznrcMRscNMIaZSrH1ScETlLgot?=
 =?us-ascii?Q?xpbZyRnCC585Ys8j6knnTowBLpfRegkNf6vsJITM0OnbEpwoknQTdmx8umBN?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ffXmqP0qG9ZMhwjPoHCIJjUf1fthMQ8NtnsIf2aYYxLSJCW5QMbo70BgjH81MnG0BiWd2MkWU6IPgxW4Acf0+b9kVehplUuxGNM4pWaZQhVhjfNNIGi+P0p9vag2jr8Oowv9zorCZ8vLIjoN1kUxJHh/zGM6Rn77bY9rJEEs4Pi2NR+rvj1du8fR8eJOpKII6V9Yc2CaIyh9zOHSbpbuZCac30S0eBXLLgHwuQgCUwZOtsvl6kup8i5Sl4bdFnb5HRyplRRrUj7T/LTaSzczFMNfS1DG+zxu1OmBnN+Tk7BS7CSNgJngflA0+DhwDKiYlZzNaEMgXt/93HQG9fGGsMG5BP4+Po7Ns2PIL/kzSG+2mOj28rUkGJVyhrWN5e6szE+t0mJLK+4RXRN4mkPkTtPsR6154/UPgu7xTxvISHOu35oCsgsFcG+k9hVGHOqO2lOA4Swj/3LFvyhwG8+kv3HdFtRoAKvlGw1Xl/C9G6yrCePcF7W/c3xv24pu7ALhVg3mx3kZns/onVYE+3BYmWHRuye2fUKCchVuyY2XTiTsHaWbIAaNYQZ8JDSsIOf8fMY4miRcJWO/xdZO4ZKX0dqVYAZCq0g3b12FLstbotA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b1dc6f-7fe5-4dc0-7bf1-08dd88bdc8fd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 14:38:06.0075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7PcQJQ2xCLQprlcSkcLnkt6LQK6Ryy3fW/WKkwRgyOHJrUBV53OfK/EBNf8/XlBSCvao6iFLK2D+74Zg0IOpY5AxAU4S09xxSCasL76Nuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6139
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505010111
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=6813875f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Yw4-2y9V_jRyqFUs4EEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 3y444YPbpf99UhkIyWNSAF_84nQbuQmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExMCBTYWx0ZWRfX+Rgh+xU3+zmW pEme2mfPRiF8X/LXlkrXyV9nNeCF3DIDDINCWsEBH9Ytc0ynzL08GcUIVxSI4pTFOy1D9GRzAJY Zp0nzZlfz8umTr260M4v+R7VzfNxbzlaULp99sZy93rFWMSZkRB0TEm6SCsbdGbnuVeBQQx3cuq
 NFuw95uiJOwD5CI0kttrbsNycJjVXB6/1xhxEXUkA4P69RbZ3TdZ2PYHJNOtzQTjj5uL1gFpE/s uHCr3/0fAiMihBpw286BhI7VHLwh9222cahpbWaH3DFchb6k5BYM+LHxF7ellx/Cm+G52SiiF9Q qG/x0b6fQ8KXn4cMiWFMu4aT+E+/ETLvqCf/NLjJoB2V2A89OB4HiweIhilDxC8WoiL/5937yqH
 HOrefF31IWcf8DrI9hPb5XbMBh3Sxe6X8ZRwkgEwZAuDNBrFvkLTWzSs9DOMkkG/A5mVwH0O
X-Proofpoint-GUID: 3y444YPbpf99UhkIyWNSAF_84nQbuQmU

On Thu, May 01, 2025 at 02:35:01PM +0000, Wei Yang wrote:
> On Thu, May 01, 2025 at 10:27:47AM +0100, Lorenzo Stoakes wrote:
> >On Thu, May 01, 2025 at 01:18:45AM +0000, Wei Yang wrote:
> >> On Wed, Apr 30, 2025 at 05:07:40PM +0100, Lorenzo Stoakes wrote:
> >> >On Wed, Apr 30, 2025 at 03:41:19PM +0000, Wei Yang wrote:
> >> >> On Wed, Apr 30, 2025 at 02:15:24PM +0100, Lorenzo Stoakes wrote:
> >> >> >On Wed, Apr 30, 2025 at 12:47:03AM +0000, Wei Yang wrote:
> >> >> >> On Tue, Apr 22, 2025 at 09:09:20AM +0100, Lorenzo Stoakes wrote:
> >> >> >> [...]
> >> >> >> >+bool vma_had_uncowed_children(struct vm_area_struct *vma)
> >> >> >> >+{
> >> >> >> >+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
> >> >> >> >+	bool ret;
> >> >> >> >+
> >> >> >> >+	if (!anon_vma)
> >> >> >> >+		return false;
> >> >> >> >+
> >> >> >> >+	/*
> >> >> >> >+	 * If we're mmap locked then there's no way for this count to change, as
> >> >> >> >+	 * any such change would require this lock not be held.
> >> >> >> >+	 */
> >> >> >> >+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
> >> >> >> >+		return anon_vma->num_children > 1;
> >> >> >>
> >> >> >> Hi, Lorenzo
> >> >> >>
> >> >> >> May I have a question here?
> >> >> >
> >> >> >Just ask the question.
> >> >> >
> >> >>
> >> >> Thanks.
> >> >>
> >> >> My question is the function is expected to return true, if we have forked a
> >> >> vma from this one, right?
> >> >>
> >> >> IMO there are cases when it has one forked child and anon_vma->num_children == 1,
> >> >> which means folios are not exclusively mapped. But the function would return
> >> >> false.
> >> >>
> >> >> Or maybe I misunderstand the logic here.
> >> >
> >> >I mean, it'd be helpful if you delineated which cases these were?
> >> >
> >>
> >> Sorry, I should be more specific.
> >>
> >> >Presumably you're thiking of something like:
> >> >
> >> >1. Process 1: VMA A is established. num_children == 1 (self-reference is counted).
> >> >2. Process 2: Process 1 forks, VMA B references A, a->num_children++
> >> >3. Process 3: Process 2 forks, VMA C is established (maybe you think b->num_children++?)
> >>
> >> Maybe this is the key point. Will explain below at ***.
> >>
> >> >4. Unmap vma B, oops, a->num_children == 1 but it still has C!
> >> >
> >> >But that won't happen, as VMA C will be referencing a->anon_vma, so in reality
> >> >a->anon_vma->num_children == 3, then after unmap == 2.
> >> >
> >>
> >> The case here could be handled well, I am thinking a little different one.
> >>
> >> Here is the case I am thinking about. If my understanding is wrong, please
> >> correct me.
> >>
> >> 	a                  VMA A
> >> 	+-----------+      +-----------+
> >> 	|           | ---> |         av| == a
> >> 	+-----------+      +-----------+
> >> 	             \
> >> 	              \
> >> 	              |\   VMA B
> >> 	              | \  +-----------+
> >> 	              |  > |         av| == b
> >> 	              |    +-----------+
> >> 	              \
> >> 	               \   VMA C
> >> 	                \  +-----------+
> >> 	                 > |         av| == c
> >> 	                   +-----------+
> >>
> >> 1. Process 1: VMA A is established, num_children == 1
> >> 2. Process 2: Process 1 forks, a->num_children++ and b->num_children == 0
> >> 3. Process 3: Process 2 forks, b->num_children++ => b->number_children == 1
> >>
> >> If vma_had_uncowed_children(VMA B), we would check b->number_children and
> >> return false since it is not greater than 1. But we do have a child process 3.
> >>
> >> ***
> >>
> >> Come back the b->num_children. After re-read your example, I guess this is the
> >> key point. In anon_vma_fork(), we do anon_vma->parent->num_children++. So when
> >> fork VMA C, we increase b->num_children instead of a->num_children.
> >>
> >> To verify this, I did a quick test in my test cases in
> >> test_fork_grand_child[1]. I see b->num_children is increased to 1 after C is
> >> forked. Will reply in that thread and hope that would be helpful to
> >> communicate the case.
> >>
> >> Well, if I am not correct, feel free to correct me :-)
> >
> >OK so you've expressed this in a very confusing way and the diagram is
> >wrong but I think I see the point.
> >
>
> Sorry for my poor expression, while fortunately you get it :-)

No need to apologise haha, thanks for reporting this. This kind of thing is
useful, we always want reports of problems (in this case, ahead of time...).

>
> >Because of anon_vma reuse logic in anon_vma_clone() we might end up in the
> >situation where num_children (which strictly reports number of anon_vma
> >objects whose parent pointer points at that anon_vma) does not actually
> >correctly reflect the fact that there are multiple mappings of a folio.
> >
> >I think correct approach is to also look at num_active_vmas which accounts
> >for this, but I think overall we should move these checks to being a 'best
> >guess' and remove the WARN_ON() around the multiply-mapped folio
> >logic. It's fine to just back out if we guesstimated wrong.
> >
>
> Would you mind cc me if you would spin another round? I would like to learn
> more from your work.

Of course dude, if I reference somebody in a change log I always cc as a matter
of principle :)

Cheers, Lorenzo

>
> >I'll also add a bunch of tests to assert specific fork scenarios.
> >
> >>
> >> [1]: http://lkml.kernel.org/r/20250429090639.784-3-richard.weiyang@gmail.com
> >>
> >> >References to the originally faulted-in anon_vma is propagated through the
> >> >forks.
> >> >
> >> >anon_vma logic is tricky, one of many reasons I want to (significantly) rework
> >> >it.
> >> >
> >> >Though sadly there is a lot of _essential_ complexity, I do think we can do
> >> >better.
> >> >
> >>
> >> --
> >> Wei Yang
> >> Help you, Help me
>
> --
> Wei Yang
> Help you, Help me
