Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E3156F28
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748589135; cv=fail; b=GMMxkI8vh88g72YB4AOo1Y2Nciez5DZxzcrHYLqabasORdcXH7UYSIXbqM4U4wdLpGjSwCyln8IDpRpKOYSOA5QmG590OFQg3KxLQjgF+6ONpNeQ+NN1QQiyqHldfeE5Fv0Z+g7aHLy8cBtnpoM+BySNqR6+jrJWsdtYOUh6igo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748589135; c=relaxed/simple;
	bh=1JxIT4I+aTTXGjUYw/VsvRDGiHsIi1NXf5e7VTcATiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YtZru2ZUI4/aX6bVOsw9e9gjF7Kh38Im24o9HmeNcbSA5Z0Bo1um2bmi/P/2e0i067+1zvjUXJ2SldYmechddIL3489cIr1PKkooHe3NyDAOwZN5sT5cMU+FP5dEDD7IJPRJY85jTP8VWdBfVYiMRI7y4RJk7V0XXNK3kwq7iVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BZojrRO2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vn8Ho0cw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BZojrRO2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vn8Ho0cw"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U6tuDM018945;
	Fri, 30 May 2025 07:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iPb9flb5GyscP20QDf
	zKeQ59Mwlnw5WRv6TCISOHpMU=; b=BZojrRO2n4tdpcTtgKkaHBLMD02qOr3mVD
	rZzt9MTPnx5SGsXEi4xWIHoe85IYbMYDvkQZCU9A0Qf1CvgxWwcYg6Hy8WOfCTdL
	4PbXf+4j0ib/Vy69aobWp7R0tQOZLYJ28fqydtb8lwWKY87lkmvnz4/XFTmU3/m1
	zMQ51K5Cd+Z6IrVUE219f9WI8/ov3pmRIIi5rFO+mnSG01mDOS/r4dyna2YkGabP
	FL+Jgwr72/vZZJ34fTGIE39pD0Nt+rTl6XdBggoFSRGIhxtrPLEdt1YXDR4qghNs
	Az4ThiyanY0z84YdK1X6nJjKfZBaSRXpjaoExdwstjYloiPI2VVw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v2pf1ck0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 07:11:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54U60U6I023016;
	Fri, 30 May 2025 07:11:57 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jcp8dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 07:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sogkY/OZbkX+AGJLCqFCLChH0VtGN/MqlMgIBouXw3PZSpEU3eGyAXfBf23c/FfMdYpo2HSWA3Nnj5CtcUsr1/RJxSDYZ02GZtbv09zkME+g+BOeUCJVkHAwOcumfbdymv26hP1zRUp5dj0PMWietkIqORqyU2fMxHwmnglgqwsW8R6M43B14mmgFo+SYeJ1dH1vwflQf19plSYvAX43Jc/Aem4S6IFSDK6wtqqrNI5Qc/1vO9ywSfRLX2ciJ8vV96y+b1cUOkRBabnYMYyGAwotMh1fSyX7/Jeou3rVMh7/k4uHo6B957DvmPMoJbZryok3JnkiMSt+QW3WOKQFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPb9flb5GyscP20QDfzKeQ59Mwlnw5WRv6TCISOHpMU=;
 b=TQFeuLbzkwZWyrWdu8UmDOemni7hAKsMajNtBApZqs3VABkDdQdaaQoPkrFXlTq5w6FWGe0WpzfzEODBCJlKdNO+NsbmqilkpTKQHLb9HCJPOhuabWxzDi9ZEFA2pSyb41BPzfmtkePKk5aHKCCMtXjjNyunJluC63IeMK1S7NNuF439hhxz3gmG6/pzC8ajtxVCDiMIFwI3RkHBjR4t/BYwUdfLjd9vQiEiWc6SRTbaLyF4l2+Ca2nCxHMWTSPV8teVwuJ7KY9CuD7UYQ5agV5Q8fy/5Mh4V7Dj+u4ZHhegXtv0uWJMAFeNukpaYTgvbg5yn9oBR+KOK6PQqwB5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPb9flb5GyscP20QDfzKeQ59Mwlnw5WRv6TCISOHpMU=;
 b=Vn8Ho0cwYaRgsVu+5RtKnZKmv6snKEGfGyu/EBnwc6kbHsBuwQW4vQVK+ZiDOS3INOQZLXPYKAhPQH4kOrWMpafl8QLpsyF0lLDDwxT6afpPtUumqCOQo9KaJBLSb29+atpOxHAVwNqbKR9lB1N8+nhnJdqbngdrS2zQnVUkJO4=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SA1PR10MB5781.namprd10.prod.outlook.com (2603:10b6:806:23e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 30 May
 2025 07:11:53 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.035; Fri, 30 May 2025
 07:11:53 +0000
Date: Fri, 30 May 2025 16:11:33 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm, slab: support NUMA policy for large kmalloc
Message-ID: <aDlaJQ9OdXGXVvjU@hyeyoo>
References: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
 <20250529-frozen-pages-for-large-kmalloc-v1-2-b3aa52a8fa17@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529-frozen-pages-for-large-kmalloc-v1-2-b3aa52a8fa17@suse.cz>
X-ClientProxiedBy: SL2P216CA0143.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::22) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SA1PR10MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: d94f9be8-b242-4af5-bead-08dd9f49414f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LuhY2xDvSGrouktS2glaA+uXH50I2YAOY/k14/GxvXdJgXTzHfyDUgE22BRM?=
 =?us-ascii?Q?O1lx/ScB2l9/+Tvsi0+VG2xHEw419Qd4Aq8g+Jhu7MaAQ9G6P4EJ/nRaqSs2?=
 =?us-ascii?Q?nj15E2nYDo4TXGE9tZnCoceYuOuqk+Q0M6Y8ur2S/KaHUWF5pbXSzCihBl3G?=
 =?us-ascii?Q?vD4UdqUGRVd6ADvxzKYcFFxLGCwB6mhXf/p6UJSmebdXxdbXyXmPc3SvR5Oe?=
 =?us-ascii?Q?S55gHFPsD6jPTkV8WKMLZoXh4U6KzYKok+xUaKId8lU16rr6fN+lBik/LpSJ?=
 =?us-ascii?Q?Y4HBiDd1ozAiKXMHhs6Eo6lrKnrI5QwyPgc/2exVf+3b/iLp/3t4FBi7ZDMI?=
 =?us-ascii?Q?b2m1vbmGn8I9uhJmRjM1otV4JJBx/zt7n8khsAOOck/JLrkcqAcvUTKzyK1p?=
 =?us-ascii?Q?qawjKMX88EZZ2aIODh6LOmwLdW5LcIlAefCLCwZHagfiI4qR6/p/174+OuFU?=
 =?us-ascii?Q?D4CoeKIotu/SMAv18O9Ony0gsIyS2Sj87zQmB8DUd0ZIKSBf+DyaRGq3UvJF?=
 =?us-ascii?Q?3InSnml1mV43MTTXm0B97Pk9jdoqZ3yS1xRgc0XgSTofkVZ0s/j50j4MnYml?=
 =?us-ascii?Q?fnvhIpn28nxVVQwE5Bitu8r4IlHeM8XcgZ6sNPOlTPAio0RKBednEWDLTYZ2?=
 =?us-ascii?Q?XShXf4R8+AM0uDGtFeDmv6D3ftOwmB8fQAG+86ZfETvuXF/HZS0hD64zY6lA?=
 =?us-ascii?Q?sHQoMu3Ei0AXG3lDxbr+xSwcCG6ntNFoTUBEi/mcWzVCWn2WruRJN2n0ChrU?=
 =?us-ascii?Q?/yZenUVtEszz3/L0HwSOnSEgtJkTsLU7CBICWQ8B58owRD5ugWONCa4s/8QW?=
 =?us-ascii?Q?J7xnPw7t157IN4nrR8r9hLJDIFUFv/cTUSO1r0bFBEepwowstQLKzaLVT3er?=
 =?us-ascii?Q?Oop8o3Matq1WfIj2AeE53EKfjwHuhQRup2rR3AJcbI0EAlkhmRMwMRuMWBSq?=
 =?us-ascii?Q?fbyBOET++8smk6g3390VEzupqE+I47/VwXeSUmPCvyBKaKAHNYbSUkXciyX+?=
 =?us-ascii?Q?EZ2dniieYsaCgUiphlF5dbW0dimmUe0W7eoKRfgW0IYtxgSfZ3qDD8zzKaOp?=
 =?us-ascii?Q?h7fQV1OEg+W87K7o5ZooCmMBQMvxFBsocixt7EkOkukNRfzYi9zz6xKDOLAH?=
 =?us-ascii?Q?zKIXiNGh73GS7GZs/oA270Ha3mQ92L3FV6O1TgDd1uwLJdKrpJ61uRDT/T0g?=
 =?us-ascii?Q?ViNo1rQ/xuayohgUH0Va2644pQOczgp9hDc9qh470SX9X9F/9y5W2gzpTLUB?=
 =?us-ascii?Q?gHLyXsqipnoycEzpz0h71DDKR3h1yx13xHpM2rnGmQV/FEdWlKNrUZL93h+6?=
 =?us-ascii?Q?FYSAHHj6ILHTaX8nuDe4W/qcyFpfl9UAtjAdZgIS65EZfuA6AVjaPs8zOKXb?=
 =?us-ascii?Q?4a78JU7317Vf4DyzMZuAPRcIHj1Vl8W1UBRsAX/lTOdOrZHrTerTQf8PAEdF?=
 =?us-ascii?Q?x5oDxLvLrmU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jbDyR/u2XSnc/87K+1Lwsz6WSKfS1MIwyI+LQr+UFG6RULy+BOwUHPZ5OE9R?=
 =?us-ascii?Q?SamH8pSnjx1nITE9NCmTaXenPw71PXjNfGWUHeHQRVuAPOS6dLUgaxxnnKAj?=
 =?us-ascii?Q?h8lm938HWuYd4DTF26hfp96WT1UaTiZdg/31BMOejZJHKbJkLEujMM3J99aY?=
 =?us-ascii?Q?94amrbc+0RkUAbJ7gzi40eMFhE/bJnFaJVn8kS3Uszi5mqfsrqAUcwZACpJN?=
 =?us-ascii?Q?vPNaGfXu4eaugB4D5XLL4keJ7OEy3R+D96u1hT1IgBmzttsJvDnlYgKTA3o8?=
 =?us-ascii?Q?wQek6YgJzW9rDLqm12jxadvONydfI3WdGQy1wc0YbIJJhbaW8eP5jAUrWLCe?=
 =?us-ascii?Q?88FDAGb9l5O+239nGenmWqz9YxWaazS/TWx+8dZYzaTw1iQcd8jDk6sitkXy?=
 =?us-ascii?Q?ICQCDdtWOarnUoU7fLynkCwgKeeeo23az1s2KpsOVGlQPLn98IxvOUb3lbXu?=
 =?us-ascii?Q?nFl0lR5fQ4zIMQlMv9fgyewZI5ngPv8jjUDNGTcIF+2kifw5LGX+3OFW2BMI?=
 =?us-ascii?Q?ZTEKkaUml1OkBbUYAsoDDntaGJfXmpcSFQaqlP+8ITBRw8nj/nNjTMvqdQrx?=
 =?us-ascii?Q?aldzLyPIPwuM1mVEwchMRFs+WxfftmZ+WGmnBS/k84mYmxfqekpkBCwJwoZA?=
 =?us-ascii?Q?iWgYIZt3jTzD4HbF0H1+3g6EQuFzBowXmP4mv0Z7bYRPCRDlTLO/Z5mqVO2Z?=
 =?us-ascii?Q?F7IkHh4nnM96pHshajofulSB2MbfRLdkEwA2TcXOnCoC2mL4qr9PaXc5p4Bv?=
 =?us-ascii?Q?LDcoI5CDDyp148ob4bAqOznOc1Ieq7Dk3dG4zI4DZxz7fO/d1DXqA3EHARsf?=
 =?us-ascii?Q?J358dVsWxiF34ozmU6xT57qVM5nB4jmh7rULuFkfdy0Zf5kxGlVQWG7ckUgM?=
 =?us-ascii?Q?OiyrFWbpKbrDWM4JETsTpOxGkOjYavRSxZf+tvvQVKDjFGWOfP6QPnhuj3Eh?=
 =?us-ascii?Q?fXU/2duATOlLPVtRU5pvdEmlJiXk/pHodPSOOVz/Ar8Fkl2vVl36KRF7PG2F?=
 =?us-ascii?Q?ASedOp02UJYDe6E8ssZjj/91enbId7IVNfZpno6eBBIXgj0EGVCsO2n0gz9r?=
 =?us-ascii?Q?bK8J6mVxU9ZBPWgTS0errrN3FJxxu9kIMKVOhHOTQ4N928bwdGWlmqP9LIXa?=
 =?us-ascii?Q?2gz+iu6BlVAxyMnSZtNAnl7OGScdKe8IjEytxtyBR4O6orkU9p6wleEMqAZX?=
 =?us-ascii?Q?c8tkiXWnRlPJCPrNNAknZtsM+GCTRDHCSBdW/eaMilyYjZE7s/lRJwNEtP4G?=
 =?us-ascii?Q?e0VDq4nKjQvJc0RIERl4QE92tJqXsixxjs3aE4/F1pXGgMJFRIYmGj1mJnuB?=
 =?us-ascii?Q?8hUl58uPuXg2Mvi7kzNpeUWEX5kDHe0Yz5r1fHCbAYKa3rw8/4C8FA6Dn7+0?=
 =?us-ascii?Q?XuaBIOdChEAsLDswwXYVtUFgq1NTnMcQgBfZeOO8ol2lLGMK6YITV2doq9v2?=
 =?us-ascii?Q?bJIvkTCLGnJcz7eVUXrou2Db+Dzd3aX6HmJdJYRDb+5OqP/ki5XiRypU8aus?=
 =?us-ascii?Q?RI8NfmXlo0fyeeKtcQcZCsVEZo8m46vfowMG9Neq77Gs68Wo6XiWlsSQExbC?=
 =?us-ascii?Q?7hvYqC81phbtYf/XNoK+ihA8bVRAdNh7vyBvk+uD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5IDdbi39ANvWU8/MWQnvkYH48lOJ6JlcYErkss328wlC2NkP21z4mPpSj7Qp+BEQpOq2BFAAqMswo3VBdR2c4X9/es6JIvwsGst4L2DDV4G0sWbji4lcUIr/3icwRxE4V5q8I4TlZ5wPU9a5QdcYHbYOU0mHJhABgtDnZ4ohNcddSO2B0GHjz8w4SX5lj1N+hUFLr8Qt63ol9PrUL/V2NF/rE1zPUY+nYSpFXCHPQfCocTgK+cXZwpEcBc4mYj0pCGpki74HDrQasb8t9YASbkLtc69wTdiYpBCjq7VL/l5CTzj90BtvSyA82RCiIJNZX7UvVgDbV7BhgfWK/tdcwZ4qWJQ9ElCW4Jqb9VPzAVDHZx6ulGvXlHgnRcYBK5+QRLg2opUHKXUcpsYOiXRFLN0ewomKWDnbBebXnhEc3Iahxgnq/SbnaNrYczgdTuMlrHL6K+0w/b3OAzwJkKo85ISJHhRpfBUHWIi4/MvY6FDnxuKLn+GYiCNcm9zDPeDN9Lxd7LfuDMOV4nrSyA+y844ZwVjRuTWm8uFvqXe2I76IR3DXwAOPRp8YSMjrG9Qg1UaOHAU/ZOJTuWOCjkDZ+AJpplAidOWqjjCCE2OeAWk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94f9be8-b242-4af5-bead-08dd9f49414f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 07:11:53.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qreISbisyssTzSRg8X8BN0+TuH5raMy7c4Y1YNvWqHIS/ywkAdA7qpSlHbMJ2aNWndGbhb2xzittHsRZuyTexQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5781
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300058
X-Proofpoint-ORIG-GUID: 450hYA_BPkRycMLM4D3-oZBe66HXrzoH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA1OCBTYWx0ZWRfXzKS77PUj1PLn 19pSgfYtowXRI1Z685s2ZjKV0Zmizb2UXgqkCHNBZ9ly18tGHUr4QhlvKlykhkRy7BiYq0+4gu6 ZKEd80Fa0N4TxRLr+jkZ9qeKMhxQZ4XBGeEe8D485CVPgdTYt+bgMAcbh1cirm1tl2n9i/LrmGZ
 5Ch6l4FOEwX21KfLwM1DPGwWMOr99JP9XXFmGPRr5YFOUijUT8/OF7TbvlDVYoBeMVloOWtAOeI jubl8hDHQTp3hFOKLxhecN9QWZLG+CnZZkM0vqjzTiHtDSEzg3t2pjOfOJZT01wtUGiVQFLwmnw f9X8jrMHr0iZIedfhGhlIflPcjl4T7j+Owbgp9GHfjwERNGeeeIikFhUnQy/h07M4bM56ktF+JG
 qYAOdqCPW1VMiuGHxw1UV6k8kVa9EULAZdw4go5J+tGmiv0i6xKRscixq54Cc2UcRzh9omhg
X-Proofpoint-GUID: 450hYA_BPkRycMLM4D3-oZBe66HXrzoH
X-Authority-Analysis: v=2.4 cv=TdeWtQQh c=1 sm=1 tr=0 ts=68395a3e b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1BByine6S6PWLjBDHbUA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714

On Thu, May 29, 2025 at 10:56:27AM +0200, Vlastimil Babka wrote:
> The slab allocator observes the task's numa policy in various places
> such as allocating slab pages. Large kmalloc allocations currently do
> not, which seems to be an unintended omission. It is simple to correct
> that, so make ___kmalloc_large_node() behave the same way as
> alloc_slab_page().
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

-- 
Cheers,
Harry / Hyeonggon

>  mm/slub.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index d7a62063a1676a327e13536bf724f0160f1fc8dc..d87015fad2df65629050d9bcd224facd3d2f4033 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -4281,11 +4281,13 @@ static void *___kmalloc_large_node(size_t size, gfp_t flags, int node)
>  	if (unlikely(flags & GFP_SLAB_BUG_MASK))
>  		flags = kmalloc_fix_flags(flags);
>  
> +	flags |= __GFP_COMP;
> +
>  	if (node == NUMA_NO_NODE)
> -		node = numa_mem_id();
> +		folio = (struct folio *)alloc_frozen_pages_noprof(flags, order);
> +	else
> +		folio = (struct folio *)__alloc_frozen_pages_noprof(flags, order, node, NULL);
>  
> -	flags |= __GFP_COMP;
> -	folio = (struct folio *)__alloc_frozen_pages_noprof(flags, order, node, NULL);
>  	if (folio) {
>  		ptr = folio_address(folio);
>  		lruvec_stat_mod_folio(folio, NR_SLAB_UNRECLAIMABLE_B,
> 
> -- 
> 2.49.0
> 
