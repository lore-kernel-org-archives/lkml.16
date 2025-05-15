Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD41361;
	Thu, 15 May 2025 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332596; cv=fail; b=Enc6EtAb+BlnW6PNng7A2WVFwEeSueXCelZb5+Nq41bO9p18iBxCeSbna5YS9hNe2mQO81e5Di77Q/s74UexoWKinBWLBb+XaEG5OBgRThU6ttD0Bh79t3fGsHxQQVOWmmzg+N4Ce4cnaV+Wc/6v6DxE73IdtyD8Mn2GINm+p7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332596; c=relaxed/simple;
	bh=1uZBbVuJs0clivYYli9N57rzGDENunWLUijmAJyYQfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l2GW4qE9OUvMRJEqllPXhJDpJOHWN1+HHn6IKDiwdX6IBS5tbcZWr11HcoGfTMdFh1vL6k1F0SIqph9SBIfeSsU11Aucvhngk+5s/9euWy9oMx1Tz3OPccnearYPUVRazutsklPRil4NBPzzonK/0QXNfXVsjbY9RjLHAqw0TCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a9G+DXTL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g09ZKlcW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a9G+DXTL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g09ZKlcW"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1qta016626;
	Thu, 15 May 2025 18:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=zhoaxml/kogBwkJSI7
	q/cW/dXveIew9k+l7R+LzIsDk=; b=a9G+DXTLQhKTLdObSYgDmP+v8U8hBcsybT
	FX/iyj+JXzIWdyDdhQyc6ajp/Qp3fUHwUAD5zP55I42sF98CP/rZ5mX8NhQcFEem
	IVUBSfYwFIRGDp+eZB3ZKmNYQQ01oiUanlXisZj+8Zx68RcL/37DXokS9xEgQ5lb
	cQDTRh2RyxdPCy+xl6AgVwEBAa1ID8BQlTV/+pMqZ9D9E5Kymk0exbHumP3S9wlQ
	hc5kVSpwfTdzLKBrdxtBKjXGeZvuhB8XHJRI4CoAhzTz3BD9aTdmt3dyiSdjwQUk
	Awnte/o0hJm9nzsqHpsUYlBdzpPtZSQX76aC1CVyUlajUEViPzZA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcrmvn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 18:08:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FHDbTi016824;
	Thu, 15 May 2025 18:08:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mc355jkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 18:08:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yuc3L6JJNo7jC2B2HPXiNklIUchFjDy8kjWTyG4iIzoFRHa5psTC5+CmHM/fSCwZdM2pzCGE56GBGzP/jAwDiufV1Nr3rlrItUoetPxfRQPrBhbQQoQ4/eie7KK8OtkbmibM1pWgBpiwbHzeNItp2pRS9+2bNJMsi5lD6LjEnlwngHShX9sUlbVCrMl1xOFf5RBzKmqbbcAH4ejkaJHRz5aMCzKKR37rrYXhA0y3M2MSBYdDSzvmcEzEOTKwzdzxdXzrdncLUCATg1EnmuECuXOShVD5wKKQwfjZTWoIfINqVg1zqOiiDfhRmedmAZw15s3r9VxaNM20mO7BuzGWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhoaxml/kogBwkJSI7q/cW/dXveIew9k+l7R+LzIsDk=;
 b=LN4HhB6CMf6nOyHLJCDk8MaUOiVWH2NFmR5YtZ2ECWCh6wxDiocBIBxdiOG5XP/vTIxvicUTYOBhVuntkfhBCClXunzmOLkMuJ6tULWHePUh7tVLkSYMylWVsDuUv2iD+G9+VKeq6D/7+cop67Y9mXJWs1OiahbYusYpbGXwZCAzFfvaEx9kzSpXAF4GWx+N4fSGEoa+hkK6ulR4qabTwNasN1GBSn1yNXtkCZvyAMajcntmdzrp8RHmB1IToGxjjLQ7fjJ89XsvZk9O2HHqgOoR3RyghnD8SW6wrRrE7USaC5VVN6JmxLKHr6XNxgomTUhQLcJndSisjpoNzyTgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhoaxml/kogBwkJSI7q/cW/dXveIew9k+l7R+LzIsDk=;
 b=g09ZKlcWkWLI7wzm7AHD2VwdT9IKzlu0zIK9+rnp53/i1x8r7i9H6S10g8Z0dx1mrmLX0mFqdWrzlVBtdvg/JUmSXlNdwd7/cyUCQCcy/Wrc0l6P36eG5MpYbyiiQnz07ZwCqbswzSgn0uLMaDeIKq0Pr6kBeJuks+TaSheD/sM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7982.namprd10.prod.outlook.com (2603:10b6:408:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 15 May
 2025 18:08:51 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 18:08:51 +0000
Date: Thu, 15 May 2025 19:08:48 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
X-ClientProxiedBy: LO4P265CA0286.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b5a427-e96e-48c9-aa89-08dd93db8be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7/6zoLWlqFeZUwxW8SU/F9Oe9ov5BqkIXbykZDY9u0qX/wtxaqWws5P4H6jm?=
 =?us-ascii?Q?99FF3o/F136JD9BSLVoaxVvtcZgwppFj6NBInEZhLmjOQ6fc7TmqZQKanqYc?=
 =?us-ascii?Q?mrNjyH9fWvA+pjU0QRB+kicvBH48dzSDfNw9fN1wgilr4kFQYV+MG01c+4Wn?=
 =?us-ascii?Q?FP3XJuTKcCwH7guxLwZjTwbhH2YTXYwvigVIR7aPYuTl2DCqrDq9Ay4LXgPq?=
 =?us-ascii?Q?dWNPS5yIqgTtZHfp6q5N3fIyyQJ6PEpl4dz4LddUsO8bXfnw4RnhwE0CNtUx?=
 =?us-ascii?Q?JzFfExZfgfKJHJEXPqjhIhnhCCLPbs7pLzD0q/nKuPiV52GEQbNAJtWZzJTm?=
 =?us-ascii?Q?A0pXMOcJvmmWgi/p8mPpXp1cl2/684TrInVHrTCnDyzDzAoo/jEGSmQSmpB+?=
 =?us-ascii?Q?EdRTg5ZZuAibOmBXc21caaZs0cvW2y/Z6jzMIgq+v9Pd1BcdD6SrbtpOD4jb?=
 =?us-ascii?Q?Xl8ciTpULQal/lJ0Zj/XS3dO81QqhOSEeRuX/PnY0iK7/TQQqeuEpVf+iH+s?=
 =?us-ascii?Q?xwa5Xt55jyx7AvTdjbCJ97FIdOHfkvNrQrTOJXUs4AbdgQFr6zC6uMPKxM/u?=
 =?us-ascii?Q?ypLqKx2Vg/QEmJ2c+qD3xMggSru46+sxuwwLYIxlZeiiq6Gh7FtysvA6Sw5E?=
 =?us-ascii?Q?EvKZmioAD6/GLxiivVbCj2Br/qYNoNvBdVNk9Oz2hItVDGylZ2NDBzU3NpRG?=
 =?us-ascii?Q?yLWfX742trZXN/wazKX+oM8YShdApKAbbOr3M10LIqzFkcP3U3rBFTGY8Q7g?=
 =?us-ascii?Q?dDXxbLA7zA1+AN+h48ERMofcTHlHzyG8IoOVvqc15kx85rWCDfk2lOU2JX4Z?=
 =?us-ascii?Q?ZmmsqyidhRA3ZPPiloI4XZQ4gU2t8z3UCYGNRJ09w4gwjIsAqSewk1A0Ao5x?=
 =?us-ascii?Q?LyqlLRu3FUEy8gSX6UL4+Ec7RGWS2+ks0KgNeZzUgU/J1WIxBH/BR1f8D7F1?=
 =?us-ascii?Q?ayRLEiax6ReZAk55iyuGHPg/KkVoG5F+8P5o8MgwWM8oeilOcpepY+6P9b3o?=
 =?us-ascii?Q?umHuu3BQQwMlzU1lc9JjX6EjhYeUVH7FugXtGPmvERW2CFm4SqJtdgB+W6cT?=
 =?us-ascii?Q?hQtjJC2R9tLymx5TwQV7l8gD1tZqZvIXJzboR5t0evsKvqEv3HGBqaX5VT4L?=
 =?us-ascii?Q?tpy8A62RhYcFpwokp9JFN3dvg9cWbzFBgdF/gctnWTP/QD3Hj8SpjF/B+50K?=
 =?us-ascii?Q?dGcpnD78rxqasA1E45tY50k1w96BFQ4MLBNg99JRVxRWRx4Y/ijsl4/Wi4ep?=
 =?us-ascii?Q?Ih9lXEQOMLKP5chEeZsTAX9NnEXB8VuIGq6woZGIu77m5YEerzp6tyOMUkcH?=
 =?us-ascii?Q?Te1PaUUhbjXKXPOIpfcd945u7KIt5Ih6H3c2c29PNfO9VMu4aptyjCVB5TME?=
 =?us-ascii?Q?c0GGaIOXaFXNTwPsDb/h+T8eGSDIj9OZm009lEGRaXNqa3Z+lMQtDHkiDKsL?=
 =?us-ascii?Q?Qce2rn59HMg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kLXatMrJWsk7+pVVJdtd2fD++ylojbXVBd09iGI0osTaP9+bO8HTM1woz1Gr?=
 =?us-ascii?Q?bFb8fhCdBpzkfVp0ny+Arp8TLT6w+itr0iaDZ7WYgzLCiQlYlAJx87c5I/ms?=
 =?us-ascii?Q?Oa0EGdq3dMahA8l01cMVBMHbUrDfq0G017U5DyiaQW/uW+2bDoH6goXsOYrL?=
 =?us-ascii?Q?N7DcMxRPiOMoEmHGONyoSIhvaNnyH1aMwQuCSTGzZy8BgNmrhenaROgIM/9q?=
 =?us-ascii?Q?7ifvLvdu64Ov+LjyGUVZNcthQxGfhd4iK5pciPRDAmG9pt2LLgnCY2Scs2Bx?=
 =?us-ascii?Q?okuu/34KQ1oD5ZKCoVDDueORwUXvcC6rQjFU7nCIXHw3Yua0pkU3A8OrKjvT?=
 =?us-ascii?Q?mtX6TQGK1TOAaAHZsFasZakoTrcqLmx2CiiB/zFaNF7jTGmOkwZg+rXy01P8?=
 =?us-ascii?Q?WsGu62qf00arGOM1YKMFH/u8mFjTXe7rBIpfhKYypCW7G6TVAMX5pNpgwur8?=
 =?us-ascii?Q?OMR8dCaeYg7PLnsZ3sFXO1VuK4Fb+9spkkxlDZ2TuAkzMDX+JD6L2KHjObm7?=
 =?us-ascii?Q?jv/goV2TtIWWBL1OfJ+QmAE1g3pyNWS4xGHrJIfgsga98b3nXj4/h7MJp3TZ?=
 =?us-ascii?Q?EMK8MFCfgALZoLnejIzayx3zV9cR/75D8oy0/rsl6XC/DH5/uG6VyR6E0EKF?=
 =?us-ascii?Q?UT2s7MJroI9ESMivDLYKQ2FxWPjUDPEPfuOgcisjLWGQ/EBeielAq5zZ+qOD?=
 =?us-ascii?Q?p8lWJJrn7RpDBZhz3NN8xS4eCRJPwS6PylskTCTL78YTr8v3X2RDll5h70ar?=
 =?us-ascii?Q?iHtjB9NA003TacUuKFG1RpAPEJedCTfgThWESZI6zPrHLE8ukzmZivWfqym6?=
 =?us-ascii?Q?Zv2+41CKqlzidVptBdyNxQrNU2TXPDARtzyd5Fh3rA29q0n0k9DtUd1Rt6Dv?=
 =?us-ascii?Q?9++HwQLPUQr4xizFOo1n9HYtL2JbgNeFCZ5byQb1vtS1Pa8ebeBsO46Sq7LK?=
 =?us-ascii?Q?pyH9AKk7pBQaT9hx12M9hj1XA28y9yZKVuOPpxFqmatB6jZBGBIZyp38otzC?=
 =?us-ascii?Q?w66I2rLqxoHMCU1Udh2LHf+YghSq4bJlBvbSjw8kWwElJnt4dCHYKNmTrUye?=
 =?us-ascii?Q?dkkGM+P/GjNxSwfKgEDISHJoaYjbaT9TEgAjA8KnjylL122eLJB6LXQwFkiN?=
 =?us-ascii?Q?+RTq9ws+AIqk1YdoImGMxdRrutHs0oFZcq5sRg1NZyfZrAsxBMcHHSP2PRh0?=
 =?us-ascii?Q?k3RLVsusqwbin02TN88CbT/J56UBdAQQn2cZkV1CRce8/fAS36i1xTvrvbU7?=
 =?us-ascii?Q?FS/rUyVXh9SYv70K7iqhuAYgQ/OheabB4PMopsqeCGxfNce4Jrg6S4kdT+vA?=
 =?us-ascii?Q?xNamSNYZFCIaphFrewYZAQFtTNkDB6xV7EICVLqShIukl80JQFCMQZ5QJnae?=
 =?us-ascii?Q?5xRUnknw85Nq72iWD6WgkJ9CzwxGe176agsDQwiR7iuEK4ZFeXoB5aNQYqb7?=
 =?us-ascii?Q?iQ+JSTJ6LAGK6x+Efv78qqK7lrh1sOgSEolEZrk7+H+7FTlVRgXKObwC7Z3b?=
 =?us-ascii?Q?v+odj4jLztkxgysXakJuEafscjY2JN9HS+Cdt4OJg+UCm/AUQ+/QDax4V6rP?=
 =?us-ascii?Q?hEiyLRqm+i3fdKMot37hWmJEOefkyc7QJNc9J0sarhz3yQm2jDSCIbdoaUXP?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u12ZSkROrS56HuEE3VpcESmPi7RgNhp20fCsZVW2NLAQV3UsCNf4Mh9Sb01la0Gw/1szFJ7EXqPK4ELnnH7g6rcFDzRr7Hqob9mq66VRjYo1EloNI4K1212n6g7yxXmIgU888W/HDrjpM1Zh8g5fdh+mGmSssCXMuG5GD26CaZ+c9Lh84xak4Gs/clL+rj7dmVoxILFjrHL6vRBpfUaCYhBr7a/b7U9gxz3VU6NKZHSRjlVPm8Ckwwb2UJlkQjlgvdSgW0MaA/yQsnspj82obwVlKYLFyfmqyjCNGTiOCywXPFQcHqq6OMahxDaI+4scfXMZHL2iAEroFIFFx733Vjrfr9DowPec4ptkMusccblhrHkif+/98jIWr8+ECx05GZbNRNUJ2ZGnMKdOTYUGrbpsPZS+T314IuKMYpgS2g4xvms90XzNUfk5RWThh4MPSHDsNMgVJjmBXySafX9ybhHd7omZFuX4KUmBAmGUfaUJSngIBRZQg4GcR1z1kKcp37J9YGL3Hx/RrCo2CTO+1J9MCrGYOMvYSG7Qd2jpQ/RLEtXwWdDbHVFMXJ4uBbi2RgRXBzzvTcYtUzaB/BDLkQebf59kaLffqTaJ9cWN+Hg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b5a427-e96e-48c9-aa89-08dd93db8be4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:08:51.2751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acijqKd0xPfZEFYtrbOO+pm1rmIivsDcTzADkFkaK6b1bj41TN7nAY0IOCdJW5h0oe/7aJ06WGcpBo0CGDgtjVV/MAuD/8IJ23OPf+ugFZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7982
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150179
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3OSBTYWx0ZWRfX6M0kAgOyV2lm WFaBnOZRGdyJ5W6KvuK8CALPXuyBw5P/eHv5AZYRhGcgDLuPFksS2XBV4hHMKw/FH1LAQ3V1F9e KhXqxQzY67yeXTKgkWaEFVkR6K/3YGdQhfjap/R9lXyq+yhEqofKq9NqYhEwffuDbLvbamyugDH
 PyYyn6irdaGuFc8uNF3A5LOdpACsY+qZYcpBIWKAhbdmKNxy/ZDGacP1yz525LRNPbjBKWxKVcj yyAtiljS4zA1nCGeH2W4NxWfcxOOmU4pMorfoaccX655pQXxTwa0dzi6989h0lCeYto62wpzhB0 svCPbJ7m9jFLCuQRmAxBr5+5U3VlJqdPZwqopOswltLZzMFHPCwHwKDSxWIm2lDg4tlK6uBBfii
 Pd7OfzDLoBIFbUOmDeqhBN8xpiPoarwJxWipSskEm+w2c/fYRxN2i3NXbpVjjkzlF/Ti1m4H
X-Proofpoint-GUID: iZtUXdv8rh7XMDBQjawnMkxCM1abAowu
X-Proofpoint-ORIG-GUID: iZtUXdv8rh7XMDBQjawnMkxCM1abAowu
X-Authority-Analysis: v=2.4 cv=cuWbk04i c=1 sm=1 tr=0 ts=68262db8 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=xks01QQi_NDh6uxhIZ8A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13186

On Thu, May 15, 2025 at 06:11:55PM +0200, David Hildenbrand wrote:
> > > > So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
> > > > is to override global 'never'?
> > > >
> > >
> > > Again, I am not overriding never.
> > >
> > > hugepage_global_always and hugepage_global_enabled will evaluate to false
> > > and you will not get a hugepage.
> >
> > Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
> > if the policy is never.
>
> I think it should behave just as if someone does manually an madvise(). So
> whatever we do here during an madvise, we should try to do the same thing
> here.

Ack I agree with this.

It actually simplifies things a LOT to view it this way - we're saying 'by
default apply madvise(...) to new VMAs'.

Hm I wonder if we could have a more generic version of this...

Note though that we're not _quite_ doing this.

So in hugepage_madvise():

int hugepage_madvise(struct vm_area_struct *vma,
		     unsigned long *vm_flags, int advice)
{
	...

	switch (advice) {
	case MADV_HUGEPAGE:
		*vm_flags &= ~VM_NOHUGEPAGE;
		*vm_flags |= VM_HUGEPAGE;

		...

		break;

		...
	}

	...
}

So here we're actually clearing VM_NOHUGEPAGE and overriding it, but in the
proposed code we're not.

So we're back into confusing territory again :)

I wonder if we could...

1. Add an MADV_xxx that mimics the desired behaviour here.

2. Add a generic 'madvise() by default' thing at a process level?

Is this crazy?

>
> --
> Cheers,
>
> David / dhildenb
>
