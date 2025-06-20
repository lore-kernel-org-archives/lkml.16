Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E40428AAE9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425510; cv=fail; b=BGW72YaeTDAWO45Uj57hvnIyNf9rcSFLyJMTr+0MCufgKnSxOuFKZm7xIspqEy2kW2MZbi66syYQMskrfTL7w3dIp5gp0/Zqtl+QSnPuTnbUIE/KO68jrbvME3MutzC4Tl8pOPw1Vh/i55JMEDziSIulE7SR7u8RcckZPrIWC04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425510; c=relaxed/simple;
	bh=JHO09bzm9bX7lYdcHRW8lepqrUKkuotgS5VaX8++Xb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SlKah0NC+SQKHilZ6vZ98oEQSZgvpSQ+wFGjQ2ZmZ0sWV5siI6y9J1aasul8gdE1E8FgB2YaxmUIfwN8Jpbb6hObwPqMG9+qdGsXyY/jUueOOL4TrFSP79eRz33X2KTraAqKawdYAx1Qxx+IAU0APa2MikO5QixW+TmqK9e1kOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SWZcadf1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YxNyBdM5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SWZcadf1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YxNyBdM5"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7fgS0031326;
	Fri, 20 Jun 2025 13:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=g8AlrGoLzV57v5e1/P
	oInSHZ8TWjXlDnmHHwuK/9nQo=; b=SWZcadf1hgH8374r9dcjiAzvXb2cVGEUkw
	8P5maY/2qWTPL3TwmPJEzWR6nKJP2Et2hJFV+mZ7ccYKbHwfep3yB62FaQunc0/i
	+770EcVUsgibG2A7doPuMgWhgw1O+PeWS4m0+/pnUUTV5JMQkol+6vI6qcBRzNHw
	sEMZ89IdnUA+/pFQMdrgfiQJMfXhaWJnnCTaNcGkpcLN/imfs+Wa9+UHXyyV5WNj
	2w3elmX9bXbA45qAb4Tlk5r/OUlJN0xNRWGBF+7Pg+dT9lurj4LAQdzvacPVF54O
	VGHyNVFDv/yCuYnLdF7hCEogkXZpV1zLWParNvAdK4NatB+ZXqCQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f3p3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 13:18:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KCCk1S021594;
	Fri, 20 Jun 2025 13:18:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhcp38e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 13:18:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTkgAlWrrByjSQU17WABYqIhGAKZ4uqryFfiz/DPGMhTj5CQYvlGsFdCIqsrZYkIhzg99ovU8Pz95MBLvpNDrFsqOsNEYsTzprXdqUIz9vGDAijQGa26ygzd4pEb9pT/2DUd1unJ7pfL16xZr6sFGwezK9UyK7yPq7hHqpWwbWXJ2WoJXgjHXJvMJrpVzMARJV0FyiFAnmYJPctxlNM0gz+snX0FvNhEgjVU5tH4p/lHnhFTG+E1l8/VQETopraiwg2MoJ4HwCkkMbs7aSFebRAZVrOMco8squ1LhU7gjp+l5LiNWsLC1i4SJM8b/24U54W2H0e2XAEf1Ctmub9elg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8AlrGoLzV57v5e1/PoInSHZ8TWjXlDnmHHwuK/9nQo=;
 b=Ln8jZ42RZc7KxWr7Vas4opZC01g7p5ZIXkvvGM56s+7lGYWdEe4cZK3m6ae/PCXJ8Gn3m0nh/6iWTvhOXgQnauSkwzwHFGhRIZMT8Tv4EfSCSaYJGqMG8Fc+zxZs1NonWVlye1RJOu3wAdW+bPIRs9X6UFYGN/iUOvs5dk1kPBhaMNdoEupnQK0WUCtKg6chtQ2Y5VjASjSx/Fi9nP6hySo1IdYLrlwT9uqgOOahdmJtaZGyr8OBCrWctv64KtIkPF0oje245QpHv1DKvVehurlAvo5dq3jDa5fuBXjtjAtZElzewabPvGpdZ7gXl2DL5wA1q63FlZsvwCDyApYSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8AlrGoLzV57v5e1/PoInSHZ8TWjXlDnmHHwuK/9nQo=;
 b=YxNyBdM57LRvg8PNZlzuSywJ4L8m8scSHBx4PZMb7BS/cPpKIDJTScXOVIo/FlUH57u8KqObVEx0YzGPIFNOnf679tPvXo4ouVMvkPrS2lGZqy07mHF2iU3IaouejttjfBsmDQjXvQdAAUWR0MuuIl/ybvCyqj1aa2bYHuZcWus=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5024.namprd10.prod.outlook.com (2603:10b6:5:3a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 13:18:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 13:18:00 +0000
Date: Fri, 20 Jun 2025 14:17:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Jann Horn <jannh@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
        SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/5] mm/madvise: remove the visitor pattern and thread
 anon_vma state
Message-ID: <0b3d1976-16f7-423a-98a2-45a5c550b5e4@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <4239e727b98763856b86cbd9eeaa0ba792eb2394.1750363557.git.lorenzo.stoakes@oracle.com>
 <8c4a4ea2-1eab-47dd-9b65-d60cfac16577@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c4a4ea2-1eab-47dd-9b65-d60cfac16577@suse.cz>
X-ClientProxiedBy: LO4P123CA0554.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 09af45d6-56f6-41f5-8a48-08ddaffce160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6gssL15tOWrDvq+Q9xzLmSsJfaGOfjRysuEt5m7YyceZAUB/GRObCI4NLPdL?=
 =?us-ascii?Q?ZJyT+IGcQl32FjwLZaGG33g6jgoHZgLfwqd9Yd7xmp4nkTbzvU/YGvffqtpz?=
 =?us-ascii?Q?mkjEdiTpY9UvkTnXhaa7TTdQE0XV+Idt3CGya7r+186praKdVD3OMsWJfVWc?=
 =?us-ascii?Q?fJ8xfiiFkra4yeWULqlf83dpPgMUTSs3r6UPLlz0P/vWXVbkOhYTkrWPWfFI?=
 =?us-ascii?Q?9sleMqlQYf2wRUDjDAKE1Zv88JbgzzlvWnOLKt+Hqbb2f5z5W8k1Fe5ry4H7?=
 =?us-ascii?Q?u0+g8ihUXktQVMsEG8kOzRvyjewyMyzKm+VPhpflQgDu5CNJe3BVV8RRciUh?=
 =?us-ascii?Q?xs3+Z0Lb4vMPa6s9QZijzLYn/zkxfldX4jkk/WnNK/Lk4Pdp8O9qep8aXzg4?=
 =?us-ascii?Q?czLjFs0FDVjBiU/06SXrtyJeyU+HrlM2/wwsi6jqFzFu0eic1++FpKIX8uGm?=
 =?us-ascii?Q?myqkNGpy0JOCahs0X9Vq4vmEn1+3rrfAlYl8IR5LZ18yd0I+G6ntdjD9m6uz?=
 =?us-ascii?Q?BD/VXTIQBHqQ0INwjpwMFjsZuFoxSiW0jfgUL6G5GjjlJM3VgLNdidOgc+7b?=
 =?us-ascii?Q?Zxhj2xfkROsiQ9xUG/X6HMWut7qG6v+sXvG007x5W8aIBBSoBIZJPGXblq4N?=
 =?us-ascii?Q?cg+XuDcKNe2Hk36h4cE4XtjOMPgFW0Fu2HDptdqMFsRXud2Blf9OpcFvO+I7?=
 =?us-ascii?Q?tXUyQEBWeqjw5buTzbrtjVfNx6KSxUdjcM9z77rAqj/9lQ92ZAokIppxMtZi?=
 =?us-ascii?Q?l2+r4OV3PuuAWVybu+ZH7VcBySsJVCFPQ4EQHBgviOgbhdDi+ck1PjiOmtyK?=
 =?us-ascii?Q?WZ7qkV6cJBntT37e12zqAuchanEhs/1dzv5SPjNnYuLS41l3fMzICitfy5h2?=
 =?us-ascii?Q?+JB8ifhl9CPhsFSSRdz6S6/3ZMQ+zUeerUNlh6+S5+XFTG9PlIIyLPBsvIBT?=
 =?us-ascii?Q?ezzDJ7JKFgtjUOcPJFIoPmsLKsyB+3+gKE8pUwJY9L67b/f6rmKR6IkHx7Hg?=
 =?us-ascii?Q?Qy604AC9V/JIZhg+7igg2PYPVdJc1X/vShV9plsHQP5Romc3HAYuaFuReP3Y?=
 =?us-ascii?Q?kwodvlu9RJ3P8+wynhYuMq5osYR53qVcFsh2fFY3tmuNmtZziWsoI00rWlgW?=
 =?us-ascii?Q?HdxNEXFLxP5CSLTk/JmlzqLOfIEUmoRLUJJ92+ENU9SOoFYsFhJ/PpiJGTbz?=
 =?us-ascii?Q?XFqoDVdJaPtgRhdJX+l9lutHhvUiXNF+PWHzDK4ay6B4w+1mWrGrr1S1SOAX?=
 =?us-ascii?Q?sHoF6qa6+2ow2OzV1LNMlYP739yVPg/GRyEEADanauMW/nYWaPq/jMqBcX9t?=
 =?us-ascii?Q?m189YI9QLfpjrx8SN8Pb95dxyES1V+7oj4RdmhJUZeJ+nSWsrmtTIqr8rErF?=
 =?us-ascii?Q?lJ8H4GIp/Xfh8cYltpYZIQ9QM6RD7zGNN/Sejno0WUE9RodMv8If+SlP3ZTK?=
 =?us-ascii?Q?qK1d5oh0Npo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dtsci5x2xNsA+UCt53AJldgyQIHwtrrqeUPoDlP8kTMgk9w2XA8HwpCauGip?=
 =?us-ascii?Q?8u8w7gkDWhkwWuYAVdFfvx7O9l+m5O3mGWtFTyCYiMhceUlpmbkWjLQgkp0V?=
 =?us-ascii?Q?WOcqZgiL8PbQcWFijNMV0t3/On4HOOoa15p/9vHHDM171t3tlAmPUPUbgOHC?=
 =?us-ascii?Q?E0oF1iKAzPXP2HrlUmYRdU+GAGn/HLhUcgwMD3k6jVWA143KrlKEE9s50e4M?=
 =?us-ascii?Q?jDutfRiTtuvwP1qZ03DJSmOlj10Ff3vlM0poQz6c3HdqocO+dACHo3hqfpSd?=
 =?us-ascii?Q?nxRHQUoLGq/zHLLjAIYVqbcNz/nsldFDZkvEY5IJKGBdD3/ddNRWCsiRw/J6?=
 =?us-ascii?Q?6Q7VuAM6xAa77PFmaxZn5a8EtLD8Q1LWgGXi+mf+PUY0uBs0U9bbYzWc92Hh?=
 =?us-ascii?Q?OBjRWT4GueD4XWq1TpbbqxmD5OkMNw8Uv2RTNZS1BHeyQt2NBdVJtlJoTOE/?=
 =?us-ascii?Q?9QH8gxvsVGrru/pHdRZ5iXOgekOUlqvAQYMB1G5q/ee1bA9bG8hGPfHZ1Ra4?=
 =?us-ascii?Q?E+FXaq4qNjbwQ/1NbHYUo4U3bPtPmEqGVj7ePtvFGcPdUDij6UX5kDhwaWzg?=
 =?us-ascii?Q?maYdeggwZ31UCE3IA9KHWDfp8LbZhSwqJ1/Liu7Dfapui6OQsb52AJVdzAH5?=
 =?us-ascii?Q?fg0CUc4o1vJtSwv/cVrZnO50qqAIyLv4biSEbMnE22WccRxJ7xgFzyWwuRZg?=
 =?us-ascii?Q?QAs9+PE/m1uskCid7hT9iK8Cz6m1q1kOUvsHGWYdXh+RC8QW2CA5TKSymRqY?=
 =?us-ascii?Q?OTo7YgvA5U9ELn059jaLllb7rCbZFWb9UImceOHrgRLX6MDBFr6aW5Jr2XCR?=
 =?us-ascii?Q?O10GFAvhpQA6NKPAW7bX++S3Sd3W7XAVQuesUMc0eazfmWyXQ0IC+m7K+br7?=
 =?us-ascii?Q?6y4FlsBd+74SeU8+QGOAzTJIlS+dAsq8V2aU7Kvz6XTc3MilRBInpGzOjLad?=
 =?us-ascii?Q?tNWJXpzHXU2Io3MkpxspyhV2/ZZRnxPbDPwgyUD0whkmwfrBPPAIW1CJOcSS?=
 =?us-ascii?Q?IGjcaO+XcX92vv6F+C5fIU3DXLxNwhZpPfW5Iq8/g7AXXREe+IqDXHdNJ3He?=
 =?us-ascii?Q?rsgMW77dLCsmm2gG7XCMKTyMMCwIFCeq6GVbpPoDNIKNlUJxHvELafx6O/TP?=
 =?us-ascii?Q?VIXKc9PJBnNIWlYCM3aCOMTFM9HMuEth0IQqMXUYVnGNy5WO4QhnEOX2zTs1?=
 =?us-ascii?Q?OjzyAubsDTGCPe0Y64mcO7QXk2ex7PO09uM0Kw1NVDwfwLj15oc/liUTobZJ?=
 =?us-ascii?Q?1tsPc6C79SZy16xwGOlWQ7D0aJ5j8YAPSTOmm5EvrEC/4OrW3pyVcYpxM6vb?=
 =?us-ascii?Q?BHnwa89C8nvoAycVlrU9yTnqFSbpCf3CgINhFKg4ybEqrkrKEK/j25YRJ8YV?=
 =?us-ascii?Q?PTe94KC2lrhh7GZj2+lxzHZ9/gA7UZCVzAhmS6wMpfIXwFE4odzhC+7AmMc7?=
 =?us-ascii?Q?XI2eyLk4Ne5pMCGWY1fp7VzAwymHSqPUDs+PiGPttMrtF3EFaj+K77zlcMTC?=
 =?us-ascii?Q?4jACrlx+6UdKJKx1rB3i4h4ppaZxjpWuBDG0cFABLIa8AteQnJot8rGW5YMm?=
 =?us-ascii?Q?lGg6EWcMyfZTTuUP9VqpHYN2+i3GSg9HPQIocRvA5cy95AlQkWoOH2T5RlwJ?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BtImWZU0/MgduzzJQh3NOqJLHuhdyzVLT+mTnHC/NEqLYt5ECVjvQbXk4rRuzOESXBGbNhBSS/mmLjWedi3WBOe7pQure5nzFemax1V0yq89bybYE9Ke5CHQAl1MQIlaUUGZxkVGv8JTj1O7gBt9tCMv+2f2cvEqZ+GIfiG08GfLzMUPbRMtPeA+4KRpasdrgP3NTwwANq7updjq6IB8BeskMKAzcMIF5WZ8xA0OfFst/69i1CajLueaLJg2YW14wNls631qo3h+Vp/vKCZI5mF6Vf+N4oscenHO/J+mJwjELe6fKh5flUmw/RfbDEmP+eXOmqlioIUSWzK/rx/rBqB/N5dXEX81LsjU7V6I8hLz2URpZOUozAhFamILy4lajpMhzrJP+jFB4bo3LKkA4Ajk0PCgvr7AnCvAw0KNOOkiYteVuI6NDYOfAF1tgptL30+/hgUFgtBDFiSp6yC3qGq+djKM3msQlGSQhdKlB5GGX2q+V38vBteIY3ouPikJtlpDMOzQAr/axBII3qfrjD7+Xi4MADxxg5x/0g5CufPXHk5iR8PCNCHLJznzgY7qeilTYlHDARtcEzuKhw8NDt4Zd5ZcYrmvpENdaST/h4s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09af45d6-56f6-41f5-8a48-08ddaffce160
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:18:00.5101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUf4mZVd9rRCvUo10h4joXPFLSakx2XsJDrC/gj7Cgdj0r27a+O2XZ/8VEOy6485VhipA8OCSQR7fUYGyKp+NupAvCWTCssrcAK4201E2jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5024
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200094
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA5NCBTYWx0ZWRfX851Sv9JHiH4/ ECwXdLjfMl10xENT6qrHZn4juq64LOcpLa9DoJ3ZtCrQCsTepyoPKeI4UDyy8NL/Q0Gkl/cl8L8 QviUy1fKjKFJbPGy/D1A/Q1MjrgyfWbziaLFQ2JfQu9nR5EkjUigFPyFRsxMeJwCbD4gPFBwpdP
 3FfwD2fP40t8twhELfg/5kUMhldeDQCC7vDqyxp1/YWWwoj+De9ndglTi2dNjEzw0F7e+cFZCTM u0FsZdKXofJbNoOk8kxGmlp1AIkCfY3AXvZHohR2KpOtOIn/sShzxCqbQXH4/7MXAFn9j4dMVpF mqyx4XMqX1wHSnhmWIgsG07dgg0YXNEEJbjDqWh6jIk4cptQJVfqZwueKJCEkuh6XLEEzKMn9Zg
 olVPIW49CrEZEVGMYkHCXvx5tQPfIhVxjwcaWQD8C1RJcCQf3kbO8VaoB+LVZrMfGHxSYFyn
X-Proofpoint-ORIG-GUID: fnM_bUouHsWfwUHMhbDN5gbWoU2pXswc
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68555f8c cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Sq3iZ09Uu_02-b1o8XgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: fnM_bUouHsWfwUHMhbDN5gbWoU2pXswc

On Fri, Jun 20, 2025 at 03:05:02PM +0200, Vlastimil Babka wrote:
> On 6/19/25 22:26, Lorenzo Stoakes wrote:
> > Now we have the madvise_behavior helper struct we no longer need to mess
> > around with void* pointers in order to propagate anon_vma_name, and this
> > means we can get rid of the confusing and inconsistent visitor pattern
> > implementation in madvise_vma_anon_name().
> >
> > This means we now have a single state object that threads through most of
> > madvise()'s logic and a single code path which executes the majority of
> > madvise() behaviour (we maintain separate logic for failure injection and
> > memory population for the time being).
> >
> > Note that users cannot inadvertently cause this behaviour to occur, as
> > madvise_behavior_valid() would reject it.
>
> This paragraph is a bit confusing. I've inferred from the code you're
> talking about the new internal negative values, but the preceding paragraphs
> don't mention them. Could you explain in more detail what the patch does?
> I.e. adding the new struct madvise_behavior field and the new behavior value(s).

Sure will update on respin.

>
> > Doing this results in a can_modify_vma_madv() check for anonymous VMA name
> > changes, however this will cause no issues as this operation is not
> > prohibited.
> >
> > We can also then reuse more code and drop the redundant
> > madvise_vma_anon_name() function altogether.
> >
> > Additionally separate out behaviours that update VMAs from those that do
> > not.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> > @@ -1325,21 +1388,25 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
> >  		if (error)
> >  			goto out;
> >  		break;
> > -	case MADV_COLLAPSE:
> > -		return madvise_collapse(vma, prev, start, end);
> > -	case MADV_GUARD_INSTALL:
> > -		return madvise_guard_install(vma, prev, start, end);
> > -	case MADV_GUARD_REMOVE:
> > -		return madvise_guard_remove(vma, prev, start, end);
> > +	case __MADV_SET_ANON_VMA_NAME:
> > +	case __MADV_CLEAR_ANON_VMA_NAME:
> > +		/* Only anonymous mappings can be named */
> > +		if (vma->vm_file && !vma_is_anon_shmem(vma))
> > +			return -EBADF;
> > +		break;
> >  	}
> >
> >  	/* We cannot provide prev in this lock mode. */
> > -	VM_WARN_ON_ONCE(arg->lock_mode == MADVISE_VMA_READ_LOCK);
> > -	anon_name = anon_vma_name(vma);
> > -	anon_vma_name_get(anon_name);
> > +	VM_WARN_ON_ONCE(madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK);
> > +
> > +	if (!is_anon_vma_name(behavior)) {
> > +		anon_name = anon_vma_name(vma);
> > +		anon_vma_name_get(anon_name);
> > +	}
> >  	error = madvise_update_vma(vma, prev, start, end, new_flags,
> >  				   anon_name);
> > -	anon_vma_name_put(anon_name);
> > +	if (!is_anon_vma_name(behavior))
> > +		anon_vma_name_put(anon_name);
>
> This is not new, but the refactoring made it very visible that we're doing
> get/put on anon_name exactly in cases where we're not messing with anon_name
> so it might look buggy. Some explanatory comment would be thus nice,
> otherwise people need to git blame for commit 942341dcc5748.

Yeah I was confused myself until you mentioned that commit and - of course -
it's because of merge :P which maybe I should have figured out right away but
there we are :>)

So for my own sake as well as others I will add on respin.

>
> Otherwise LGTM, will wait with tag for v2 as you replied elsewhere there
> will be changes. Thanks!
>

Thanks!
