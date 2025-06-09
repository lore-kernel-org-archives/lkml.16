Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC479259CBD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475716; cv=fail; b=hzGnDccD10xrtFVPjCbYNIHdAKz9snS/hEhw0YGA2slxzCXMSN2JRWNFlMe8oHV310ifs7vXmtYaOc6FNvJGqczl9ATks7sbhW+ZV7/WCQbGwUQd0vsk8DgiK4/wNpFBn3SbX1DYSLGQuyJ4+wd8z89+OtQh25qjaZNF2/legXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475716; c=relaxed/simple;
	bh=nQooq1VA9vAFvEuiMFOkvC1NIKaR1zn/26NGnI0LNzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tqMwslVtvMj16jjLzAQFwijSDDw6HE89V8Go19+cZBNXiEk3XBXbBUASEo1/N35ER+HmH/YouPN34TcfVZjkonPuA/79Ik3U79KxXdyosgx0cFPSc1STn3NPWjvi2PIRsUTHiOywTP7XXHDUdHuf2Y2Qrhz/53o0FxOk+EWjfV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p5juT6JV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cqTgaS3D; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p5juT6JV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cqTgaS3D"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593jwY0018914;
	Mon, 9 Jun 2025 13:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lgdBnFZjOpg3LS07kKcmFVm+R6XLXq/NoPXEBC/Lp0Q=; b=
	p5juT6JVDQh5cr79EV4lWW8grxMRYE+sjwnFcYguYY6oCCczg+ChKrJ4zmDRLbAr
	/W35zesKZcfVEt1bOvILW6dtZEkNgwLZVN3yoGRJxQBDlIww5np7fAL/6KWLDs7h
	V7+fmRpe1Er9nYpvewzFoBKLHN1ZNaoZpbpp5EAoelukDF/OFEKHgdyJZuCKBEzE
	n9MTj0n2kMNTRQMLUXpiSCbMqgSAs8hCc+ssyrHoPA6wS/b5YHJIqtMxlwyy8iyq
	9XLtEP3QRYwXuUsGVV9nFNUIpM4dO74YxOpKNrbO7IYXHjpFPHd0OHf4/N2oMTTV
	GpAA5LU6U6TPO5p7g5Cjfg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74t55m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559C9T4V007593;
	Mon, 9 Jun 2025 13:27:13 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2088.outbound.protection.outlook.com [40.107.102.88])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv76tda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkOkM4m7FwlRLcrr2VvgBI9dA1ANIMymXX7/cyEWFS7ReUpHZ5cPB0uu8z9qtsspFPD6iJ+ZgdCsUXkbQJZmFP7ZgMDI7uYpFnJQRIlPHSKJ23VqOLec4A7Dn+tKpuLl6tMF0LFG16kmEACq7LLibMR5iroNU416izGhsr/9DCOW6++8e5WzEGBPOOfOg78K3MVmYzb4FEN6cx7NM40Zz+boh7MWNh7yCVYUvfG+LUxjjaAtKDQ0s03lcvlDGUOkglEW3sGX9aGbnLZbvJbFVizvHNEPZ2vFPO7FbJCRsTJuD9Je/9KnN30Ym+H3AGrUM0hBDNBE2yPed/tLv5V8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgdBnFZjOpg3LS07kKcmFVm+R6XLXq/NoPXEBC/Lp0Q=;
 b=kEtLL9wt8UznpfPWuo3vqzPF5xbq4eSF5oNi8WudjHDQa5INmAUCNZK4tE2AunVE4aQyQ9SAEhory8si18Ps/7y1Ae54uYyxJLa8z76W1Qu9KFq+mzrhhCPOa5LSNT36HxxASavPDQNMpVXlDghnkFthaBfXkA0gATHnBvy17cb+thkMqVhF70bCqkU3yqwUgcNeGL0T4YjDHzD4fjQTDfAO5WLb7SG2RC/EEi2OCGi5b0gfn13DFEHMvWxIeN33irK0rYTR57vZ43XoFsGNKuBPbXQKDWN3WitnUdiWq0IYDGvGnZJVK723aJl44lKZFpYk/J98ARlqxuEmgQf3CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgdBnFZjOpg3LS07kKcmFVm+R6XLXq/NoPXEBC/Lp0Q=;
 b=cqTgaS3Dl4LfURDvYc2mM+DFBrrsFNMp0jhVxWDW+v/4PH11nNVUeGu8m1zZh5P1wHsT9TQun6o05viQCZJwZ/y1o07lFXf3xo2+nSwHQey4iVLHcp/DO7088hfbeHiVOzfBQUPO9K+0Ei8LL1HJB6Hp/Hr8hrN30S8bF/ESwp4=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DM3PR10MB7947.namprd10.prod.outlook.com (2603:10b6:0:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 13:27:10 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:10 +0000
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
Subject: [PATCH 06/11] tools/testing/selftests: add mremap() cases that merge normally
Date: Mon,  9 Jun 2025 14:26:40 +0100
Message-ID: <094de8c0b76b8a040f5ad6ede0c09e14a949915f.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::17) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DM3PR10MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: a16f5ba9-cc4b-4674-3c64-08dda7595696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EdTf8avXPy+dwmYdijumc7RcKthBgTXZmjDmYMYJE24GcSUAcxc8BdlnoNVy?=
 =?us-ascii?Q?f5hCgaPRXJbAzJUEG1Y+OZmCWlMl6l0VZpinmc1RD3eCRJbD4nW3TJrxk5vz?=
 =?us-ascii?Q?5/mUCzcb9MjyD2ApukocgRdcbaRnUUdYkxtYySELytIzVirWzwrs8/CXrHY8?=
 =?us-ascii?Q?N+A8+eAnwagC2etAvXTFrqDWIpDUWO2Q3k5QsR8P2qNX6l9eyLP31xIkQ5/v?=
 =?us-ascii?Q?2lUes/1JjmE7txxvEuDctGsDrhJsW+nVhBMpuwlGwdnvcNMzazZFFLkIlErw?=
 =?us-ascii?Q?N9CLCLrqreMb3BRcssqGtfEWGxpWb4F8MW8UwNGsGi4GjsCiOUTm0X6hcZr1?=
 =?us-ascii?Q?4HeNO2Iad+HKBwWezmltn1mqkiKZ+B6KdAs8ei22Jl7+TJps9oUyhFmxuSV/?=
 =?us-ascii?Q?SrgVYpIjyzOis0OjS2NFA1fikv0MemvVbtEDqKx1DA1/xrxq20RHpdPWb8Xp?=
 =?us-ascii?Q?EADKOrAd8mBMpMJBAH2XJPg1nLeEpkA9G48CTZPnlEQBe++1hBLUcsgCYB5W?=
 =?us-ascii?Q?fJ3Wx3i8/N8xip9G1bMst7cSKQlxg9BYF+cjEePem2EIEEqmD30RdtuUR89u?=
 =?us-ascii?Q?J6fTzHixcnbBRfkmvSUZQHFLuT29Yx8l1Pqo/pE5vqZdpHE1gWPLzzU2xbIU?=
 =?us-ascii?Q?tYAU5SL323nKu2w4IafAxaNi2ZlELDawqJyB0YUD1tOQp3XcRfUotzPYy62N?=
 =?us-ascii?Q?qejb0NGv5uzyHyW/hhHlqQKk6x5mjWi4s8OPc87PqjeqjaLVlLsk0vKa1iuE?=
 =?us-ascii?Q?JLeFHjTX+LdqkMMe/XO7Vfxh/AkrAmGECjF2pEKTPURH3DKqn/rpdoPqx/Ek?=
 =?us-ascii?Q?NVcH7k2SGrpTvzmip1iZZl4EHnPZUpXRVCa6V9AOL3Tl3C5rD/QIUTjHJyZl?=
 =?us-ascii?Q?/MRgPGwuIK07iw5hdKESdEiD+BSFzQDyzu1TDpRhuTdqrDQqaX8D8TZhX2YE?=
 =?us-ascii?Q?MEpobw1fRm3HWPuGV1kPf+2GxSU6cWVFb2S6uP+CDl1JuO3PRJmwyM+6Ror8?=
 =?us-ascii?Q?9Z7GAW3Yq9MT4v8r5+V2XortfrHhF9aSQ010FpLlXQ7RsejnWTi2eWoJB1mI?=
 =?us-ascii?Q?vScrD3aBVgeiaC4HTVx6ROsGTPsvaZ2Q+OiS3fOa1/LqGF8HUu9sJ2Bmqkwf?=
 =?us-ascii?Q?M5NmwKHcNPQ2OPxQG5KK19lPLbfjQS+th1IMaJP7ZeA9UEvNs/AZZA8HRMQH?=
 =?us-ascii?Q?TL2WSNq0yL54KQYOoRByFvv/Evhu0hJ31AE8Sgr1OvTgNgS7Az1sMW8ote3o?=
 =?us-ascii?Q?LmFKfNhnaWRQKWMURtIek/eyxEQEzwG9P6J2RCSSEh5J2wV6PmwQoTJKtSt3?=
 =?us-ascii?Q?AV+wJ5YN+BA4yjlh2Hh9hPKknBkEyKJtvfhwaIK8z/GFRWsxs150bW5HBfKH?=
 =?us-ascii?Q?5mtG625l7Tkkdv290Xj0CwY8X8s4ClSe7E/x22IRN/OBn/qzIg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8DaAjEJhALfU99WC9tBcTJ5t8ZJqza6PNY8AB0/Zv1fspu65H2E/UXwATSX4?=
 =?us-ascii?Q?8ElmsaAKs5wOThpsp9PHscmGOSA47H4yyNITP8GzKUWfpMsr0EodBj4jJWTv?=
 =?us-ascii?Q?tnAjapx45mbiWlycmbTCustz5Xs2zco2w5PYWMLa4GMQhwSD3+LQzTrIgUnk?=
 =?us-ascii?Q?zOGnwRTB18sHkSGr/Xt3FWK2Sgy6jZ4jI5GAPEnyTdXKOJq7BHpMuRuiGvZS?=
 =?us-ascii?Q?3iPsKLoWKpkuCZMH+63H6Co3XP7nufmgvuhUwb9iNh0nLNXDGU548b1QA9CJ?=
 =?us-ascii?Q?n4lvansTriK+Dz9Ty/sKzjdmz3dlHxHL86VkQVIiymc1hqtwlGAUdlzfwH7V?=
 =?us-ascii?Q?N997ckJzP60DHVcgehr8LBa75QXsY5qOMRIoFozRZc+6E00r1c9pb4qu+38F?=
 =?us-ascii?Q?eE5Vb1M0XOQm8sxWfDtwZWmDrjcg8ifWRJ8dk8KNIGe2dLG9ptuZOA4V1B0t?=
 =?us-ascii?Q?Nvkg8rdmf7bCqPQuA3HgnorPbSqebeYjBrf5pu6BxHW76WTlOhSAR0ZMyc7P?=
 =?us-ascii?Q?wQvm+ojydDTYfXoGwS9Y1sZcuZ4fobgi0rTtpF0gFPUcHYoGvm1lwGTi7sey?=
 =?us-ascii?Q?bUa+GQUWawbCqx6OMhgobp/43SczUq0QYvXlZUwTnBWDpxr9ainsZ4JdVydk?=
 =?us-ascii?Q?f9To2YqIl2sm00rxs+Xr6vbkslA7UxgE++P2Ez5L2kEnfWJ2smSWqDl6V4jf?=
 =?us-ascii?Q?HUN38w6G9yOl40VFhsUCzQJ82vexo9FRGeDb7sMRn8upJ2K3hFIz5hxOpcmL?=
 =?us-ascii?Q?sYec5YP7Wq9LQppAIzrvtsewjbgvvu8gyII9t/K2UwvWM/DX65GW2Jb8DGUb?=
 =?us-ascii?Q?fDN4hlpXMcCmzIJTnCnyE8lmIgV6kqhzNn+RHz2CiJdU6tr8so2pxjvRfyWZ?=
 =?us-ascii?Q?MVetPECx7vpQqTu8avty+qxHNp8UTmO2xG3F1piXENU4f2LUyE0yDxsP0FU7?=
 =?us-ascii?Q?gN+5m/X9yXA6a08TVmHZXZrCNQyKH/3fC58+pJv/x0kDehjqmM9PusP1M44x?=
 =?us-ascii?Q?/+ahP7Kzjly1O0X+sNlm/rgH5eGqKstx6gEgh0gsLVN8HphpISNY9C7a8YQn?=
 =?us-ascii?Q?Op6i0XJx1Hwqe/Bd9k59y3Ee1FNrH/hG6xSFaZiM/Ic9bltr8A8VgCoHnddf?=
 =?us-ascii?Q?TaIFSF52qFLRsB1ltobfMcj6dgYxf1SIfIfx6ISSi0RnHtvjfPCNbwwM7kA7?=
 =?us-ascii?Q?icHZsxfn6rSgAMPZ+z9gwvibT/+2oyxQh6g/XWOvblR/bFfb8neQ4NtjyopJ?=
 =?us-ascii?Q?f+VaFjirEMBqeBpCbjWwRJAZe1Ui1rqGMNHsiTLeb30lOYZAky27eVuCWktN?=
 =?us-ascii?Q?aW5FWgp9FLLvxEgHGDQZkT85w+l+Y3fS/LaxdUFeAMpLFviGbZK5FOfLde3l?=
 =?us-ascii?Q?kQeaDJfIMJb0vE2fPNZFzUQE3fWGrgr4nfADiTBI2QBSCS3L1Sf1nWb3nE/L?=
 =?us-ascii?Q?jErg+vBUYkIOlvFkmU0+CxbtN2iyQrKHawfDxDv3XoRX9RdqXZXuOosDGSUg?=
 =?us-ascii?Q?ACFOOgQAzlJajUu0m3VHe+qEJcIfhOtkaTNIWjpYkOQ2DcdLl2h08wKyGjDP?=
 =?us-ascii?Q?JT6N0EVX2uN9HDHTttkC+OmvwhT2kCnJV5ivMgZUNIAYijxCadqY4kM85ijh?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qIHS+wu09IKqicuXyJYARvt6XrgyF73d6ZBaP0P/ykk4B04bxmfCZ4API1cqq5lJLe2kkQHXIxVycK8iYPJAK3vhSxg48VTvWl/bQsfNz1+m+ZNeUtr9JLkx44O5/9/z7zl6oFhTUG0hBezUlUM2oluXxtnqMCsWVmWgySB+LS5cSScMZ5e2Tu1hIV/i+DsB6qvMRSBLrD7J1k4SSj8j6IaIAf+NPKE8HchZkIg1vbgZ9H1fqXdOKg3bg4zxBBfiss4ik6lA1vHoMrBmE7JUak3oGs4qflzcTnKWH6MdRM8TC22sTu1h3oDJJjHV3G0vT4Ybmc9FR4wi6eRE1YFEYlC6ZGlL90ijNZdCDg1RqmktFuMJt25OBlGQ29W8p3MsnnKT09z6dsixWc0zPp1DItggNZldgSRAC5a9CM9OXMNlEjA++QXzn0HluqpjC9gghcTVaC1TI+9tPso5JmZxD6FbzbphAzSuW/glx2GoUWWUwsaklngegKxznEBtVFdwDvO2Aea74ju+Q4/2OA9FQ12FKARVGZKdTtq/Zu1DwMzzx86X3dSAsX9CANXE8IBhRpuDGVFuJA5wgE0883iwePbYrqw4JChF90uF9mRR9Kc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16f5ba9-cc4b-4674-3c64-08dda7595696
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:10.4431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBhLfPQLQSKUmR8hx4K9+VZoSChHq6m+P3J9Z53a1PEhcGn1DhD14kCJXsKkFBEQDD0tzYG8cNmVL8wh0X16mgnvvoQYTaIGXHQt8S84RYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7947
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506090098
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=6846e132 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=17aRRUwdhcp-6bMbmpIA:9
X-Proofpoint-ORIG-GUID: xrlsvxidpU-wXt3rvbKZ2PShUeyz8nB9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfX/VTW7cKU20Qj i/NFNeX30RIN8gkdN+rnaTh3xhXFvV3tC89W0v3jJrEIpK9NggHtKejYA0C5mdH5XX2PwYirLh7 9wRmyXCKlt8JTu37QA6Q5TbjvzhftoBnV+/XJcBjYC+GqK9vv4v4uLO1GPOxPW0wtUg3krRUz+a
 Tt5JxJMx4cG4qIz/reyYlBxQlt/V/6wn5IY5T4XJ5gDXjCdhbWYTR8n2QY4KCLBuXJRGnLEpFC9 cl+Q2jYNq4GV31datVumM5VLggUxKJcRVfMbS+P9tVmVo5hTsP1iBsULNdF3f4HmCnFWZ8TUy8J VS3kV1IsNpUyNIrDmPDJ/uw2/KayqD7cNRu/bBEjlo94tO8YbVXH4Ue3bbMtkdE9FabPm3yeb/v
 ba03hhgCEjw+Cyrhmh4UDJRVf9xJRDruMux60RyIkKcB5ceMDOJ5w2wdHwEEgko4ep249ty2
X-Proofpoint-GUID: xrlsvxidpU-wXt3rvbKZ2PShUeyz8nB9

Use a direct system call version of mremap() as, when we move to using
MREMAP_[MUST_]RELOCATE_ANON, the glibc wrapper will disallow this.

Also import linux/mman.h (which will amount to the local tools cache of
mman.h) to enusre these header values are available when later added.

Then, add tests asserting all the mremap() merge cases that function
correctly without MREMAP_[MUST_]RELOCATE_ANON.

This constitutes moving around unfaulted VMAs and moving around faulted
VMAs back into position immediately adjacent to VMAs also faulted in with
that moved VMA.

By doing so we provide a baseline set of expectations on mremap()
operations and VMA merge which we can expand upon for
MREMAP_[MUST_]RELOCATE_ANON cases in a subsequent commit.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/merge.c | 599 ++++++++++++++++++++++++++++-
 1 file changed, 597 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index 0ae77dae4737..b5c183403fe7 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -13,6 +13,7 @@
 #include <sys/wait.h>
 #include <linux/perf_event.h>
 #include "vm_util.h"
+#include <linux/mman.h>
 
 FIXTURE(merge)
 {
@@ -25,7 +26,7 @@ FIXTURE_SETUP(merge)
 {
 	self->page_size = psize();
 	/* Carve out PROT_NONE region to map over. */
-	self->carveout = mmap(NULL, 12 * self->page_size, PROT_NONE,
+	self->carveout = mmap(NULL, 30 * self->page_size, PROT_NONE,
 			      MAP_ANON | MAP_PRIVATE, -1, 0);
 	ASSERT_NE(self->carveout, MAP_FAILED);
 	/* Setup PROCMAP_QUERY interface. */
@@ -34,7 +35,7 @@ FIXTURE_SETUP(merge)
 
 FIXTURE_TEARDOWN(merge)
 {
-	ASSERT_EQ(munmap(self->carveout, 12 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
 	ASSERT_EQ(close_procmap(&self->procmap), 0);
 	/*
 	 * Clear unconditionally, as some tests set this. It is no issue if this
@@ -573,4 +574,598 @@ TEST_F(merge, ksm_merge)
 	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 2 * page_size);
 }
 
+TEST_F(merge, mremap_unfaulted_to_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Now move ptr2 adjacent to ptr:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |----------------------|
+	 * |       faulted        |
+	 * |----------------------|
+	 *            ptr
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_behind_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Now move ptr2 adjacent, but behind, ptr:
+	 *
+	 * |-----------|-----------|
+	 * | unfaulted |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr2        ptr
+	 *
+	 * It should merge:
+	 *
+	 * |----------------------|
+	 * |       faulted        |
+	 * |----------------------|
+	 *            ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &carveout[page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_between_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/* Offset ptr3 further away. */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr3:
+	 *                \                 \
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |  \  |  faulted  |
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 *      ptr       \       ptr2      \       ptr3
+	 */
+	ptr[0] = 'x';
+	ptr3[0] = 'x';
+
+	/*
+	 * Move ptr3 back into place, leaving a place for ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                     ptr3      \       ptr2
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Finally, move ptr2 into place:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  | unfaulted |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge, but only ptr, ptr2:
+	 *
+	 * |-----------------------|-----------|
+	 * |        faulted        | unfaulted |
+	 * |-----------------------|-----------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr3));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr3);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr3 + 5 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_between_faulted_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/* Offset ptr3 further away. */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *                \                 \
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |  \  | unfaulted |
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 *      ptr       \       ptr2      \       ptr3
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Move ptr3 back into place, leaving a place for ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                     ptr3      \       ptr2
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Finally, move ptr2 into place:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  | unfaulted | unfaulted |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_between_correctly_placed_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map one larger area:
+	 *
+	 * |-----------------------------------|
+	 * |            unfaulted              |
+	 * |-----------------------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 15 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Unmap middle:
+	 *
+	 * |-----------|           |-----------|
+	 * |  faulted  |           |  faulted  |
+	 * |-----------|           |-----------|
+	 *
+	 * Now the faulted areas are compatible with each other (anon_vma the
+	 * same, vma->vm_pgoff equal to virtual page offset).
+	 */
+	ASSERT_EQ(munmap(&ptr[5 * page_size], 5 * page_size), 0);
+
+	/*
+	 * Map a new area, ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                               \       ptr2
+	 */
+	ptr2 = mmap(&carveout[20 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Finally, move ptr2 into place:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  | unfaulted |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_correct_placed_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map one larger area:
+	 *
+	 * |-----------------------------------|
+	 * |            unfaulted              |
+	 * |-----------------------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 15 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Offset the final and middle 5 pages further away:
+	 *                \                 \
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 * |  faulted  |  \  |  faulted  |  \  |  faulted  |
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 *      ptr       \       ptr2      \       ptr3
+	 */
+	ptr3 = &ptr[10 * page_size];
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr2 = &ptr[5 * page_size];
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Move ptr2 into its correct place:
+	 *                            \
+	 * |-----------|-----------|  /  |-----------|
+	 * |  faulted  |  faulted  |  \  |  faulted  |
+	 * |-----------|-----------|  /  |-----------|
+	 *      ptr         ptr2      \       ptr3
+	 *
+	 * It should merge:
+	 *                            \
+	 * |-----------------------|  /  |-----------|
+	 * |        faulted        |  \  |  faulted  |
+	 * |-----------------------|  /  |-----------|
+	 *            ptr             \       ptr3
+	 */
+
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+
+	/*
+	 * Now move ptr out of place:
+	 *                            \                 \
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *             |  faulted  |  \  |  faulted  |  \  |  faulted  |
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *                  ptr2      \       ptr       \       ptr3
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Now move ptr back into place:
+	 *                            \
+	 * |-----------|-----------|  /  |-----------|
+	 * |  faulted  |  faulted  |  \  |  faulted  |
+	 * |-----------|-----------|  /  |-----------|
+	 *      ptr         ptr2      \       ptr3
+	 *
+	 * It should merge:
+	 *                            \
+	 * |-----------------------|  /  |-----------|
+	 * |        faulted        |  \  |  faulted  |
+	 * |-----------------------|  /  |-----------|
+	 *            ptr             \       ptr3
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, &carveout[page_size]);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+
+	/*
+	 * Now move ptr out of place again:
+	 *                            \                 \
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *             |  faulted  |  \  |  faulted  |  \  |  faulted  |
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *                  ptr2      \       ptr       \       ptr3
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Now move ptr3 back into place:
+	 *                                        \
+	 *             |-----------|-----------|  /  |-----------|
+	 *             |  faulted  |  faulted  |  \  |  faulted  |
+	 *             |-----------|-----------|  /  |-----------|
+	 *                  ptr2        ptr3      \       ptr
+	 *
+	 * It should merge:
+	 *                                        \
+	 *             |-----------------------|  /  |-----------|
+	 *             |        faulted        |  \  |  faulted  |
+	 *             |-----------------------|  /  |-----------|
+	 *                        ptr2            \       ptr
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr2[5 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+
+	/*
+	 * Now move ptr back into place:
+	 *
+	 * |-----------|-----------------------|
+	 * |  faulted  |        faulted        |
+	 * |-----------|-----------------------|
+	 *      ptr               ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 *                  ptr
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, &carveout[page_size]);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+
+	/*
+	 * Now move ptr2 out of the way:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                     ptr3      \       ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Now move it back:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr         ptr2        ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 *                  ptr
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+
+	/*
+	 * Move ptr3 out of place:
+	 *                                        \
+	 * |-----------------------|              /  |-----------|
+	 * |        faulted        |              \  |  faulted  |
+	 * |-----------------------|              /  |-----------|
+	 *            ptr                         \       ptr3
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 1000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Now move it back:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr         ptr2        ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 *                  ptr
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
 TEST_HARNESS_MAIN
-- 
2.49.0

