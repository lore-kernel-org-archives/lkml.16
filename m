Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8751C69D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743471979; cv=fail; b=Cvyum/iRZDiW0vT2emEiRXgt8wYca0059fN/le+ZlbrnNkcJYBvnhKJhjNMaIvytV4ynQcqHlQsUf2p9M5DV/KYIlk0L/s7HfnOFIS4Yxr4Df7m5srHWOM+H6lscfZ8mXcNqLIB9SmGt+Q0gHsVcS8Pp3ks1iF+nuqMnJJW1pRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743471979; c=relaxed/simple;
	bh=d64LBG27He/PbZNZS8b5lOPDNxm8nV9pdcS4DLG1i90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V2cPcgaBqxJZI46dB1qlfxuu/m8Nr9KnwPDOCazLHJtAYqCjuieGHqIHKABnhNb/I/YcCBeh+hsYUL0TH5y9mWvq48ss9lk4iLIA27V77jH4LzPUsPcWggCzPhIwgxT78DKBUtNB4EG1nkM7ORIM6Cmu8Ablgnh043AM67Zm+Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mi2HQhev; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QiX+BxBf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mi2HQhev";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QiX+BxBf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VMQnUM029610;
	Tue, 1 Apr 2025 01:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KCo5CQ08HcrNcPI3oX
	OwWqVve0bR3yXfawh1X7Zwdyo=; b=mi2HQhev+ZPAUOhNpvWvYBOgBhm+ViWBN4
	rpqfQ43IqWB5v+T+C3+0kC+Ahrs4cNDWJWNfhKJUK8RK4ZOtCz00SicnV5lBou4J
	49KNFNlHG7FuKmKEgP5nOrVtmuKsbZU2o++V6i2HDKt1zleaqNTo2U2WlkOzXUeE
	3B0llUTD+aQrOEU1qcbzVdPO/0TmhmDhX/d+/KxL72pBn0Nzsgd6eqTvslkYV0oj
	8pf2/BrrEvqLj4NNxXeSr2O7UrRgikgK2ZwClXld/flrAazKe8LE8QpVntvTEy3b
	sl9kxUTtAHMG7tqI5zhZk26/B0MM0uqNTwKGM/TBw3ExLzqkT4KA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7sammr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 01:45:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VNvegw010722;
	Tue, 1 Apr 2025 01:45:54 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aend73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 01:45:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmKglHQc/aq4UCkds1BrsqSzZna8kdX1zoeeqtv9Kn7C8NS0fYzoOnnOMoDXotVq4l3MFsGG1Dw4J16l7GSwKKAfazMYu/esxlesbTrn1Zg4kvHJMmQau+9ZtGRV24EWUsXLGf7xgPu33g8CaMDNZrYrJaGAUxsgdL7SU09BAw14YoAjuRQQnzOrEXa8gb5oXWnlVxmJqKAvDf7ibKRm/Pqu3sP9IFHGf3uHOtcodSixlRub7jB/FNCw+U3IQNT6RpIjIZKqU+I1RD55glXTzqm2dQpE1yAF4r8s80j2BPtnW7YHqAYjFB7tJOhVpM9d9coRUsqdqFNlF0f2lGiFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCo5CQ08HcrNcPI3oXOwWqVve0bR3yXfawh1X7Zwdyo=;
 b=uFcahW+5weTXBzX4fEUSF652iW32q+3gWWME5j8a8huCXyDnptVJX/bWEo4bzdozlNYfGsofAHCoLyRyGOo2ljV23bGzc6EZLSo28fP55yGHIj91AmynCl7/zCI+fguM2Uk8iRmlOXW3VuN+EEY6J7JYZD2blbbqIW5tbP9n4sDUzdrUucwn4dcp/P4zpai7JvKB3nOo/mVP+4+ECNpYI2BdKVsDVGEylvA8vtR5CMhhiSwlhK6hx+ixIDjI2tCE+3lYajYUZX05jyKRao0RttWH80Na7dGQsk1uACm8c86tJijwZHO9zMoM2VlLvUiQCz0xU1rmuc4S2AK8m+WHlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCo5CQ08HcrNcPI3oXOwWqVve0bR3yXfawh1X7Zwdyo=;
 b=QiX+BxBfPn0DwP/r1Yq6S36xWXn+uQfnJ8Vzhd09njf8UI+l2PQvZOtO/2G0kVGu6/w1w/M7bAJxbxilYw9JkzcbchXqVK4dGwcfxC+QvwYYSA46vAfRxsHW62ySDe+YpfCSxAArfYgmxOE4KnUTj8QA4+DTzJuj4URU0o8jq90=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA1PR10MB7856.namprd10.prod.outlook.com (2603:10b6:806:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.34; Tue, 1 Apr
 2025 01:45:52 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8583.030; Tue, 1 Apr 2025
 01:45:52 +0000
Date: Mon, 31 Mar 2025 21:45:40 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <howlett@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 6/9] mm/memory: split non-tlb flushing part from
 zap_page_range_single()
Message-ID: <maypa4pf2fp7zcee5dazgeoowaxl4n4vnqhnfhck3yscchp5vj@dz2mmunbvm5j>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <howlett@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
References: <20250310172318.653630-1-sj@kernel.org>
 <20250310172318.653630-7-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310172318.653630-7-sj@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::25) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA1PR10MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: dc89f3d0-3148-4fd0-fcc5-08dd70beef61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bUlH9BVVnbaFDzDFQUqRJnGXlaPNvHgPP57jtSApqSzDiL/0z6I6HtMmEj91?=
 =?us-ascii?Q?RqJxFe31oKQXdHQ8/MhqH3K25n+MTXxdDyaAWzrY4Dd8jqMWgImWzd+ChCNy?=
 =?us-ascii?Q?ugvXI2XOopNbi/TYvwXTC5p0wWZ6tjZ5H/9aYw6b+qOvs1W2AhGnV75D8JeZ?=
 =?us-ascii?Q?cRih5IPScxtzM+9X8VsGP77qBPV6GEc56TYzU21rSlD6RRGZPYimklOe3Zuz?=
 =?us-ascii?Q?e04Zprpw5zem26huepd9mrpz/qqRrzIYYHwtVTvSj0Igs8uaH11G5JZrCOrj?=
 =?us-ascii?Q?AEkNTaLWiL9bULKdOiUi8G+3bCiHrg2/DuO7jG6bjeWMrzf1A0TPAOJVeiD7?=
 =?us-ascii?Q?Bv48+4sZzed2oX94XqndsQ5/UIQC8S1AURbQaY3HFnizgKmoKyTT6kHtUW/D?=
 =?us-ascii?Q?2Olo4gaSHx12Pm9A2k3ScNH7nlptnjfqBu7BOrL7agCoww7eypBD57Vn/8PS?=
 =?us-ascii?Q?FBCCQD+0UwXrg5oe21R6q1mVmrIRHL3oSNQvPeoeeSc54hAWI97C3TWCBOd8?=
 =?us-ascii?Q?fJ0UVLRGH4Ed1/Z5kwdTWEpJg3PmWu47QVGOkeHq04B6esulBlYMpGiGpYhO?=
 =?us-ascii?Q?3f6fRwfMIUOW03DwgMVkTFepCRVBsywXz+opGOGAc2mDxLw1lC/dGXzFt2Gw?=
 =?us-ascii?Q?nsDr/CNDEAAkZsFPpVI/iSLsD62JVcIsdfX5rKiSAwQDQNMYDF7Oes44Fm57?=
 =?us-ascii?Q?tS+49skS06bFsvY2un5kwNFBFQgk7YmlATM+6VQHgW3JTIkzCOnbCL+4djX8?=
 =?us-ascii?Q?Kq0T6y2NQouYaALnjXym73DqAdc0RSuLm2YWvhiEYKlSzEQILylbYJJgRg+/?=
 =?us-ascii?Q?c1gXsTEMNDjnhNR8n+QG7UT/DYaV3Cr95DGPv41gIiTcOUGG/up0e53M4fuK?=
 =?us-ascii?Q?6M18vUMNz/iFBuibqECIxPpjrWoaRnjzxNvXG6tG7aOA2c/3GfqLMLQALviM?=
 =?us-ascii?Q?x9rKQZR9Uz0fut5SCeQONSFGqG8u5ZF17XFy3u5zSyFV98Ikhod7YOLSZf3w?=
 =?us-ascii?Q?JvYwFEj0d5cJmo1FWJrUASQHheR1nN9mcK36gM4sQy+O6Rdre7AgTADzJ9s3?=
 =?us-ascii?Q?MJAl1Y/Vkw4+R/4udhhOC1SPY+fhSqTBqkuEe9+hV3Caw9KZsJNCf4soT2mG?=
 =?us-ascii?Q?viejzo4qEb7kIHg9/s20hRlJ61V+sxOvnP5Fgt9xwCdZINoC2PRsvZ9KJOgv?=
 =?us-ascii?Q?5ygJT+SiIeZirTjpnZ3WM+whvjsP/xS9KSFDYQSTB++mv1AH7lN1NUSbe1pg?=
 =?us-ascii?Q?TBChgPA4eOSW4V/pKPIHEHW9Yb9kJatatZ6+jQyre6ztHpwqK6CV9/fa38la?=
 =?us-ascii?Q?TNxjvgTcT6kh/ZOy95YYrHqVWPr9as6EvUZ8jOZRTobFGFhA4quqevaXmPHd?=
 =?us-ascii?Q?o+XzWwO798eWUf9hypRa/SZFIBd/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HZRHR8jv63pOlEpC/XT0rnqMtgoT+hk9tbyTlYtq9qMAMq3TMJgXiKtXQ4Vd?=
 =?us-ascii?Q?kfyXb0XEJQEpbHAxkEJQxDP3/rGi/Meol79AXmUjcT1yZCclacO2ROdpR6YM?=
 =?us-ascii?Q?WN3dscXs2t7eIsoCOZ/BaIRDldbQPTPHDZlD8gX4/Zu11cdXZzwVfDab3622?=
 =?us-ascii?Q?91DOnMNPthuMqCffYHPsSuqrt+pI7dosgb2YMBy9+V4UHSTstY7XIKh93GDu?=
 =?us-ascii?Q?nqX3atpUHra5Vu9RZqfyL0T8MXirkNYfx6GAZWqtKq+qrJeuSd7RkD29ug9B?=
 =?us-ascii?Q?MOnOZtI2Ci4qFhX+24Sr84C51nCX9lpOwrKeSH07I/M5HrOj1ML5YfIjVEwE?=
 =?us-ascii?Q?8sBViFOIz//XnTcV4tn5Ahk91n27DQNv2pPEin7Ss0FtOG2lId9IxNHELcSC?=
 =?us-ascii?Q?YrvH2WUUHNtKgXUXxVp0sg6lrTCDe9M/ls3q0rx3/UCB+hZo9uwtPgyJ8Rjx?=
 =?us-ascii?Q?+LvNP5nppuP3JzOI+QXM/ks2/+lgJpjcde8k7PsDfF5af6ZK+jei+G7nG1+h?=
 =?us-ascii?Q?ctC8z36IeFTuaTlpOmILXnpyb5BMnxuza0SGm5vUiKatAoDXeY4M3i6O1L53?=
 =?us-ascii?Q?2T1g2bwF19HUBYlrPSqi9Jjvz81jamQlnBafmPt1+wyF9DD9+pBbkZmZ4lpc?=
 =?us-ascii?Q?e6xhSh2u1guaE702NgXd6Fn+TXoQCiawxdFNJGgzU9LUg7obFDF/TqPeZ58e?=
 =?us-ascii?Q?0O6137D65fEbssAkTNn7Om5x3F+DOaq19COObnydsX0uwIPvNtt1dAJKu+Ei?=
 =?us-ascii?Q?Ggnp7ONKmtdjz3BTHjv6sHBxNO2IiTPG5Xstm6p+uLRVwYH+2CwRyXY84Zi2?=
 =?us-ascii?Q?K+jf5o0VwpsfkxrlVUGqcjPdA+EzfgbNeTdcQCpI6N1Kx/iutQOncXbsmlps?=
 =?us-ascii?Q?O7VUj66uHAYs7Ltgoc3oVphELxnRNLdVynw+TrtW93bWEC/9R+v7+AhYPCVT?=
 =?us-ascii?Q?TvP7izmzIkLO/BU7X4OFLbBr77AJWv584j42ruA16KUwnI4xtxVsqrnTfUNZ?=
 =?us-ascii?Q?SjbBOagxPHNMbh69i7E7wNik1jvkm3aGvB1foe62N2RLc4rTCUhXbhvfQudk?=
 =?us-ascii?Q?HRLIPoYeBA47oLbqmzdVzmuQFyuFjMAieycaHGaAJ+ieS34zIvCoQ2l1pC/2?=
 =?us-ascii?Q?6PdXZ+DZU2s0qtMwotbmi3ddu1JgwQci3iEzHODd58nOzrAL3SJcZaUNW+IH?=
 =?us-ascii?Q?AGlUb54CRGpqjqCPowHuzlZmboB9tmWQPVgMA9Dm67yI4UfotoPTsD7g8PSC?=
 =?us-ascii?Q?clZPDhYdhETopGNoZBfOsY0b6tfDdqGKejv4C0tjFQxk2YuMsXW+x72uWv//?=
 =?us-ascii?Q?CKvSv0QmlEDG88BdIepokglTguvc5J2f7vqb1kffph2wlr0bf0pnse7mFEHH?=
 =?us-ascii?Q?+kiwZb6sMqCPYPmmvcwZEAXg1TOcIEQSZF9FEL2E8OMLgm5CTomB1sOSiulY?=
 =?us-ascii?Q?ku6gEOlCjHROF0U6IZYIKNngLPfk3jqp2KwwTCz8RVVEZTLQ9Nk1JVOufMv2?=
 =?us-ascii?Q?qK3pCFZpU62RG8/rJ6vnph7Qe7Iqsyb4eK4WSA4b5dWirj6rfZ40YwYMa6er?=
 =?us-ascii?Q?FQSEY74tfcxMz94x4AlmOquV+XQoYA230+IzGviT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qwEBjW6FqnuUFGXHpqCJgXTQt3jQvkdyz6hBcmlgYG2iiXwOetWUc7W4sGQhBzCrKKZMJP/ZFbo3DFSG8WBvVpl6kHtehlJSsrXpvRP34q6+FQJgILGFPjRiaFhyhx9ePdhb0P5mM33hHYSdAeCcpwRUKStjej8bfasuLP9mPIM6ZfcwjspGzzoi8CoLXlalSl21kZtkE20rHejY9G2e1RMNFi4cU99nfsuhWPWhw1emrIFbrFmCuye3aVg05VXbEQ9E+k+vUa4DJ8YnhJawLBZTr6/uDDPhKv8laL/kD8WZtb1Dkpqs7TQrBOXaaRAfmJ+qftjjECfYagIi+TfoHeYf2RtIlzRZpdc8Ocdgneqzb0NX49XtRAYDP+53D5MVHIIhyXKWUgte//VlxnPlc+D0BSFo2t9JEgpLqzCSmodURXaWPbNb3nutv39fqy83fa8j6rCaLm+b13pUaiAQYaKzDgXpytCvWOLLVAt4kE77TUEBI57Ib/Pgnk6jFSxQlzzS2gYVzqaP6jbz/eMsr+ZRkSKqVML3ZCvQhsNSTMTo6Nce6JK7Vayh93fkK3yd4HL/wKesNBdIU5xlEskXrfvpao6qTb17+LsENWboAwU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc89f3d0-3148-4fd0-fcc5-08dd70beef61
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 01:45:52.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfN9JOpY3xD+9uxfXlxsHwsAsImGnCUMvJR4n20zaE8R2yjkHx3JAJJOucpXUUSuWhcHI3nLPtH/NR6hmRA+JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504010010
X-Proofpoint-GUID: Vf_SS2KiEcbZNRmIO9Oa2ya38nJyUpBA
X-Proofpoint-ORIG-GUID: Vf_SS2KiEcbZNRmIO9Oa2ya38nJyUpBA

* SeongJae Park <sj@kernel.org> [250310 13:24]:
> Some of zap_page_range_single() callers such as [process_]madvise() with
> MADV_DONEED[_LOCKED] cannot batch tlb flushes because
> zap_page_range_single() does tlb flushing for each invocation.  Split
> out the body of zap_page_range_single() except mmu_gather object
> initialization and gathered tlb entries flushing parts for such batched
> tlb flushing usage.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  mm/memory.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 78c7ee62795e..88c478e2ed1a 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1995,38 +1995,46 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
>  	mmu_notifier_invalidate_range_end(&range);
>  }
>  
> -/**
> - * zap_page_range_single - remove user pages in a given range
> - * @vma: vm_area_struct holding the applicable pages
> - * @address: starting address of pages to zap
> - * @size: number of bytes to zap
> - * @details: details of shared cache invalidation
> - *
> - * The range must fit into one VMA.
> - */
> -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> +static void unmap_vma_single(struct mmu_gather *tlb,

I could not, for the life of me, figure out what was going on here until
I realised that is is a new function name and not unmap_single_vma(),
which is called below.

Can we name this differently somehow?  notify_unmap_single_vma() or
something better?

Also, maybe add a description of the function to this patch vs the next
patch?

> +		struct vm_area_struct *vma, unsigned long address,
>  		unsigned long size, struct zap_details *details)
>  {
>  	const unsigned long end = address + size;
>  	struct mmu_notifier_range range;
> -	struct mmu_gather tlb;
>  
>  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
>  				address, end);
>  	hugetlb_zap_begin(vma, &range.start, &range.end);
> -	tlb_gather_mmu(&tlb, vma->vm_mm);
>  	update_hiwater_rss(vma->vm_mm);
>  	mmu_notifier_invalidate_range_start(&range);
>  	/*
>  	 * unmap 'address-end' not 'range.start-range.end' as range
>  	 * could have been expanded for hugetlb pmd sharing.
>  	 */
> -	unmap_single_vma(&tlb, vma, address, end, details, false);
> +	unmap_single_vma(tlb, vma, address, end, details, false);
>  	mmu_notifier_invalidate_range_end(&range);
> -	tlb_finish_mmu(&tlb);
>  	hugetlb_zap_end(vma, details);
>  }
>  
> +/**
> + * zap_page_range_single - remove user pages in a given range
> + * @vma: vm_area_struct holding the applicable pages
> + * @address: starting address of pages to zap
> + * @size: number of bytes to zap
> + * @details: details of shared cache invalidation
> + *
> + * The range must fit into one VMA.
> + */
> +void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> +		unsigned long size, struct zap_details *details)
> +{
> +	struct mmu_gather tlb;
> +
> +	tlb_gather_mmu(&tlb, vma->vm_mm);
> +	unmap_vma_single(&tlb, vma, address, size, details);
> +	tlb_finish_mmu(&tlb);
> +}
> +
>  /**
>   * zap_vma_ptes - remove ptes mapping the vma
>   * @vma: vm_area_struct holding ptes to be zapped
> -- 
> 2.39.5
> 

[1]. https://lore.kernel.org/lkml/1406212541-25975-1-git-send-email-joro@8bytes.org/
