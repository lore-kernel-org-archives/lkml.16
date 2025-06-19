Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606C28DB5C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364854; cv=fail; b=d6nzuxvzqRuy6vkM0d4ZvT9JyV8z/qy/AaFGAhAUvsMdsdj1B6DUFh1ZB+aMfyGlJiU9OYf0JRWbHiIKIqjzlEbMj2yS6JenoqNE5htbEB7J5NqeF14ta1Wokz54mEmhdFeSQjNxGPFAmzf21p2zsYvDXaQrChGuFZNfYW19OZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364854; c=relaxed/simple;
	bh=xM6Vye2sZKDPZaEZoatHBF/HyI1DqQorVjO8+dZXIj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mJEO3rrxBsj/8UZPTPKJaOcLOkFweJZWll2q0kJmlqZE7Bt6t4hHdaLtpXT/Q2VS21VGkFSH/Ln3v8BWAjOZ3r7LSoFvOm3jFsSmAM7EdLcdKQPcLjpTVXNY6bHhRAW96oNp3lwR4g7XJN0DeffjJJqsVdNd1+dZQ/nfNYLLafQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mkLophPz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q446hBWv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mkLophPz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q446hBWv"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIfdeI002021;
	Thu, 19 Jun 2025 20:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=flA5bHnaQEo0QyxD2X0SNRJvrJofnevNw0E5qvrZZpI=; b=
	mkLophPzpmmozi2MCIBR0K5WX/DSSwH17NPAsSNiUoN+hA0ud8qSc2SXOw6NPrPc
	UMYFwS7fwIOmoN06vgTNBcw1Sgr2HPP+p6T986sRKDTFihiCPV8kXPkcvxTw7SEk
	RSwrOiywfJxxVxjG2xdK5LYIt4HdbkipISsZVu8UasSwjU59jQr7f1BH0eRVZqUi
	Uf1kr5Z8zZ+5R5jeABLJ9PfJzaJ9Gr1yLjb+fuNotu4fbz2p11cUgMs/YiXLHRCm
	FMqH8LvblOobUHsE+Q0vFA7MOWBwshBA8W7Fldf3FD0YW1oITqREijafJFEOFk8g
	VTiUoXneyqkfDQEExPVbHg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4tk8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JITFuJ018373;
	Thu, 19 Jun 2025 20:27:08 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011057.outbound.protection.outlook.com [52.101.57.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhc7p2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwks3jJS5yRNvvlbx4JsGn7HQHBRz49KcMZ5Yzx0djHp2B9dHfODytRZXF2GzdbCB4+bKNmX6iG+OA2q9TJd6bG7y2WLiwXdsE8HAkikd1qXBBz71rqXC7Y+3/hAeXtfdhHp1vCBtf7sgyU3MV93p2XeHJv9jTgEzOYpAzY33WEthnmO7mvuU+s1mUOdAC0sRm6Jez3pYUIgiFTQOGm9elS4pNLlyh/IxVqp26Eltexi6BRj2KBFWbj1BBbkR4ctfhgZ3nm+KbMvdZ3Mp7tRPye9jD6aAPTmvPlKz9thKM14pSiGbo92kh0QleetC9XPwssyHfn5T8JxYiPpHYEN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flA5bHnaQEo0QyxD2X0SNRJvrJofnevNw0E5qvrZZpI=;
 b=AHNi0rOcWkGUw+fQwktPQO7C8fsvotloPxhZn4z6qBeGaGRExqKlMQEcHXw1vfNZJYSfN1A93pLfd+2uFnnqzEEUBWGC/+svNVEjiYtrgDmc2Zn7KdGcn0SyEQq9GIXAEEKXNEsglSHTER0oXP3JH/8atQ5Rbk0UDTV1gShOjmWVDYSe5dmHOciDve4RDRqKVJz2iw4L7S63DX9v6QNudPu2DaBSuQazyYezFg0G+O0ehTMMySWeXcvJSw3iu89vDWv4lsFOQjyB7HHmaJNc6gLJGi9UX7hrRPVcG+Tmd8dHLS3UdjC992pCf3UJmZJjTlysu/f3MvIUz4ScM0MrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flA5bHnaQEo0QyxD2X0SNRJvrJofnevNw0E5qvrZZpI=;
 b=q446hBWv2ACX1HPepYB0BxPyFYp0qUzb2He+57oVPmFiHorKQEnowumrzxcU0Ix/3LF8aMyJGaARKzZvmGBU0f+B82zZMLHfCVMSw8GhGVGOkqfr25eE9lgvcCcDnOuFYgLRC0MwlipzPidwYsSx6FUIYUu/4N1kTzw40cMt1nc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5791.namprd10.prod.outlook.com (2603:10b6:303:14c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 19 Jun
 2025 20:27:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 20:27:05 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH 3/5] mm/madvise: thread VMA range state through madvise_behavior
Date: Thu, 19 Jun 2025 21:26:28 +0100
Message-ID: <a520417243ce7f8122de05a0420f964a922e392a.1750363557.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 9529d3a0-eaa4-4e15-717f-08ddaf6fa814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FKd6j4OGYzivhKGwd9yUVOLyfwmx/c34b8hSklaEdc9z0pl00fwl0FGMCCUs?=
 =?us-ascii?Q?CVxV4B5zje5eQ+DsAKNaa3VcCXIoiQskbFig73Hwjo+ObDFctzcWJ/LZCGjI?=
 =?us-ascii?Q?0x2JfByROYD3CXWfGj7H2NLB/YbP0qRpk92fL8aY5pViICbe6tOwk77mcd++?=
 =?us-ascii?Q?TYaqCEXdDTUrVfjx6tcCWjYjvaOtKiLn23w7JLoiCDrxDCZP8PzJX56U6Bcw?=
 =?us-ascii?Q?umhPS3t6gd9Zz5CYKtzdtp/1P6Ewz+/az3fRYxZa+rrzG+nls8uCEK+GFd0o?=
 =?us-ascii?Q?SCjeS5r+wpuiD7HX2pfbTAh52K/ZOYtRCbNaIclLbkBFbSWfjEVSGf/yE8t7?=
 =?us-ascii?Q?45Ly6C3rmsgqIOgeJFYCx3C2/01OaG6YQRWfp/4KJ3xHvEtKZRIetjfbyCyb?=
 =?us-ascii?Q?ESpkO8aC8h88KT/gg93gfuyVYgDt3Ze1pIl2KtejmKS4ohzWZsNZzN2FP+PP?=
 =?us-ascii?Q?kJfrtgcR6Mhu1h3Ek1P06+b4uDSor6OZEHlt7OIjjIjgn/M7PSZ8FpGTbU0Z?=
 =?us-ascii?Q?2N0XWP+n9D2Pxt1CU6UHvCO5gCvUmzW2O5Xl7vSLke3uTuGT/ppTW8F8JtPd?=
 =?us-ascii?Q?LKSKpROAuZFA3BQoyaSg7tG5c9eItfYl8jBAStctKAVdmat8hqoemTsJm/ht?=
 =?us-ascii?Q?q90CzoR22mmAzPVh91Ug2ukXkWZN+zbAeTWEbcPFwIMzwGvSpcizQq9xOBF7?=
 =?us-ascii?Q?i5OzDs2Mvq6I2XLPodR07qA/wrLjT6lyIvVdHt7IAgBarwQznmqwuLf1mbGr?=
 =?us-ascii?Q?JAOtYUKuKMQPq6cWuWntDWKpQyjI4gcKDRNXHf/tfXzWbwhCziMZglCqXVTz?=
 =?us-ascii?Q?Bdd8fxhI9kfHhl6XFN1a0Sw+JUt2jwyQi1NKR+i6VrMWh+0FTeppEgxsRGzt?=
 =?us-ascii?Q?MAocMrjJTU3epNfS87FQO5jT9rFmBHc0AjeMXIVTyR7sPC4KxwhXKrqIYBL6?=
 =?us-ascii?Q?SHxW5KXLEO2Vft+wgrTy1dU0DcgXn2fGMxCUDV/h3FedAJFrSHMggGgHty3p?=
 =?us-ascii?Q?5zn5ckyjv55Nw+EKLHdOu52n3QFYTGwdbk2hxRPirsHQBT/74KV1OTJbj8Zp?=
 =?us-ascii?Q?4+Sf/6qEu1XxMpe3v/czTu7UK0NigzZNzgBKLzB2tE8EYkLzM8/ZSATqcrUu?=
 =?us-ascii?Q?ADP5XEu7/SKh1M5fu59cr4UBtzcdx6BWprHcgBf9300OTqzT1H4oQNeXw8jd?=
 =?us-ascii?Q?fc8dc1OKRe5apTbUU4HJ1LvZI4aklNU9mBq43DnTw+BGdeOs4b8/sYHy5f1y?=
 =?us-ascii?Q?EiFBoADkDBOGj/zludUBew0d4Oev9rAC7sqa3dilNp1Ko0QJto1dIbYL0fEr?=
 =?us-ascii?Q?BBLOhG3kreCwSZuEx1ZUtTYhCsWfUa5Ocjaj1lh+4BB1pGdOWvLE4GuLJD0f?=
 =?us-ascii?Q?xu2g/I5QipNLEAiItFYqtLIGkOoZjpYYMOh0Ng5vkBVOF+gGqCaZ+KCGxL/s?=
 =?us-ascii?Q?QgJ79PBB/0E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C41q2LcBZ50i6PFlelUPZ14HwaJ7CT5MVC7kMR5MbomPP9VjYQPKSxwyEzvR?=
 =?us-ascii?Q?i5HkcVstInApcTyIOLeY2IEEUGJkoEj//yhRLrtDV7q7Cxqh4EocNzXxec+b?=
 =?us-ascii?Q?ox8l70a+tplhy9wb4d0lZNWXFX2o6SRJY95A9XHK+RpLExDMMMbd30mB6Vfk?=
 =?us-ascii?Q?ES4jACdkSwPOoW/fDCmC7FFae+3P6bHk643+Nm9vxlE8p2xA2vbD9aGSOvCn?=
 =?us-ascii?Q?PyY8JEOq+D+PjbVid5DPJtcLfhEEgTckbXCX1eIQ06Qm6Z7NjCUb9iJkU0BG?=
 =?us-ascii?Q?CSOpCD7CXgey4J85+e/rI+A6m+Okn9Oq3cBfHIMM7udEi3awL87rHAiOY0P+?=
 =?us-ascii?Q?fv8HVa0ndpnrMgL8ChGlixu0SH6hinNDCHuNcT3d8qKQQpRg0CiU4eP0A9ql?=
 =?us-ascii?Q?zZ6bhqRQ8wm2+pGeeYTdKFwZZQFEcL1+hps6HTk12MSDYjZ9ERWGrZSp1+ey?=
 =?us-ascii?Q?RndzfFnxQ9J49m9WgVOXRU2CX/Uw/jybezNLXMt0lSLeCwSchXpTLdC9Yx8Z?=
 =?us-ascii?Q?CukSvCdHHcR21n8QNhvjwj7catWmY9iHuOMxkvXb5dxfwdOtekgvnY+7gUN+?=
 =?us-ascii?Q?p3XWJgnydXSJEB1Dj5kcO2n9vlxaREn9+Ftj4ptuWA1zE1hJs1mPtSvE3TgS?=
 =?us-ascii?Q?c2KLKS/9wcBHa8zvLv7or8CREfoOzLk82aFYjKFKeXGf+SpqPQwE9PYPsiXu?=
 =?us-ascii?Q?GXhyjK1ErViS7f8bDOHuy7RSRq4d2m9MjgWOWcXmpg8fvcF2qWzkSqDvsb+4?=
 =?us-ascii?Q?lmZGIr5f6kXoSLMLTMvO6BbjRkRbey8V/5Z7hPvyGKrCUa99gN/mA00Uzepo?=
 =?us-ascii?Q?6kEfoaEnfQkVnysJ/VwLqj9cZef4gpZlug896VknQEMWyOyIiXg+lOlTszYU?=
 =?us-ascii?Q?s5eqo8NgmIeKELqaEgO8T2DXwmX24g7Dumx1PIdT+HpvWbbOH6ccZn5xJ7Mq?=
 =?us-ascii?Q?DB+Hu5SfZSu5k0p8gukGEjGhMM7jA/byrqKhH7BTRCv0LK6kUZZbx1kmaI78?=
 =?us-ascii?Q?rarOy2czgZJwr7EsMtTyIUPKCw4TVbunmgzbH89QbrFNwxFbsI4tdLrLbWxG?=
 =?us-ascii?Q?fIxt+h5wUMxLip+xn5ete/UByf1CjfEupM4gkoD5I9aSaHMaLOu0BZLIn2pw?=
 =?us-ascii?Q?C800vVxOVU/NIbLWTp8zNqJ1JFVSIZuHMaHkhCJuiH/NmRSHpOG6zh+XZHIV?=
 =?us-ascii?Q?amH+Cesf8CaNs9HNDBQIW1vR4tQMSxSXrcqouGKkUmKyUoGmXLvVhGG/R6db?=
 =?us-ascii?Q?Oe7ji7ckU6Rh+nlWDB8H2SEKTMNuY72U6bN3z1bCmRr7SsG5KuAdMjmLs+5g?=
 =?us-ascii?Q?QCoySclXD2HlCdd3VGrNMAiVD+uiyKme+/ZThHbLr9qFddVPFHGNa/NAz7eb?=
 =?us-ascii?Q?YTgHX2ZBilS9O2WQRx12nJGXjh+s81SJr8Af9JbipnOMDcSboOdGOqvEBwix?=
 =?us-ascii?Q?ySYWCK1kpXpmbD7/vi3fuVXcesLqoWUkIPCvzLQK4rpP2mqETXzt/hBCh6aN?=
 =?us-ascii?Q?Xka5Q/0OVIpZNob6pNZdO4K667GEMvGN0vv/yaxVw2Nnk9yYun6VPEgu+FST?=
 =?us-ascii?Q?oRHpz1ByEldE9CXl/McRR009XqykRu/5jOxEJ0nFg8ZufU1b+Fj5jFJo/Ejd?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BNJOTeRKErybIv+ktXxHFiicSTMfebhONroyDRXX5tfBXazjdgxfh4gluaGFREwg5PScYFrz/j2CX9HQhkqkxbOEIqfnp0xvZ9odPTGHg8QwuQO158/YReJHmai8D2dvOmFVVtKiSGk54ZAqkVSEB4q6X9n1go1F/xELaPbdn5jrRWG0y42ZksRsnwupD7ZKmC6WwA2IaQ4agd9W24GVQSh0MvGevPcZEW2r/jR/KX55D7UD5bWDYmZm6roS/mHzUPl09P2VwMYSYkLBMups/O5z75KwXLttU/W+f0wfqI4c/wNjfkdqbjXFxRIeTAf1LewdINkIEVtm9k9vMY67GO8Iqx1MFiifLS/eTvrlt1ZfnJFHRftzZImpr0z/C7NX718oN+fwomFNHFMxKV5UAk65s5KfbI22nCWIzOCz5MabvD6aQjKSDdnDL/+fwmTiI9NisjNI8cOlwIS7cVwnoWqjqSqfn5xKPHz2hGFoMA7t/2wqoqJ9yS9+6X7YldMwcAR5QTP6bZmE3e151lFyVCMKtyNykX4hHztX6cPf6eSp4m8SybZtfuAMy8amOgzlBere7mZ5GpsCTOuO9UBMSnZpmOmNm0DrF9vn0FBYs2Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9529d3a0-eaa4-4e15-717f-08ddaf6fa814
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 20:27:05.4297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUZ72Br3f/+8+2OFsFXbTWv+UfXynoCLMmnQMemjz+cw2ruhTs1rHdnI5VekMFIWiPuEnqpiUTuAsMJ/bSu6RBasx0z/zMIyLdiA7uD2EJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE2OCBTYWx0ZWRfX54Iw5N+L3vKu 1YMWDpJ69k8CyHeATqXq4yKxmwh47Ueq/HxqDwBwYytEamV6zCTBw7x9cBg8V3BMd7zKos+hSMT yvSmFJRkhHAWPGbdygMsIdiLO2YPd/enrfTrp6o4jXRBYsRXeQzbL1zOsD/YHQ9zGIDUl0glKX0
 Y2t9ApCshuFeU6jbs7ZWlOxnFjl1NduKC8tnghrdYXDhkdQbS6heySlhs6XDQ5gr6ErKfejh0Li BVu4RR1ovFWLUT/gxBwnex6TwkiP4XJjCa73bgJ9eWh1o+4KwqZtQnIwxmozbu16PyQDctQxOth sima5kZDSiOwyyGzvxy8/F5Etsq5ZFn65htODX/cwqnfxWh2BtuV4394qVXZKQ8jYdTnK6CbxP0
 ljikzzq7ld6bsT3YFB9zZV8QISo7heVt2VplS4Di78l0DOmXCcddVk8yHuQu3ZgHsqgTDN00
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6854729d b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=06d9jRpDxHQBZIvN52cA:9
X-Proofpoint-GUID: WocHfbnH8aSqTUGDMZrQWqNUZ4vmN-bV
X-Proofpoint-ORIG-GUID: WocHfbnH8aSqTUGDMZrQWqNUZ4vmN-bV

Rather than updating start and a confusing local parameter 'tmp' in
madvise_walk_vmas(), instead store the current range being operated upon in
the struct madvise_behavior helper object in a range pair and use this
consistently in all operations.

This makes it clearer what is going on and opens the door to further
cleanup now we store state regarding what is currently being operated upon
here.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 101 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 55 insertions(+), 46 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 47485653c2a1..6faa38b92111 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -58,17 +58,26 @@ enum madvise_lock_mode {
 	MADVISE_VMA_READ_LOCK,
 };
 
+struct madvise_behavior_range {
+	unsigned long start, end;
+};
+
 struct madvise_behavior {
 	struct mm_struct *mm;
 	int behavior;
 	struct mmu_gather *tlb;
 	enum madvise_lock_mode lock_mode;
 	struct anon_vma_name *anon_name;
+
+	/*
+	 * The range over which the behaviour is currently being applied. If
+	 * traversing multiple VMAs, this is updated for each.
+	 */
+	struct madvise_behavior_range range;
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
-static int madvise_walk_vmas(unsigned long start, unsigned long end,
-		struct madvise_behavior *madv_behavior);
+static int madvise_walk_vmas(struct madvise_behavior *madv_behavior);
 
 struct anon_vma_name *anon_vma_name_alloc(const char *name)
 {
@@ -149,8 +158,9 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 
 	madv_behavior.behavior =
 		anon_name ? __MADV_SET_ANON_VMA_NAME : __MADV_CLEAR_ANON_VMA_NAME;
-
-	return madvise_walk_vmas(start, end, &madv_behavior);
+	madv_behavior.range.start = start;
+	madv_behavior.range.end = end;
+	return madvise_walk_vmas(&madv_behavior);
 }
 
 static bool is_anon_vma_name(int behavior)
@@ -1012,12 +1022,13 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 		return -EINVAL;
 }
 
-static long madvise_populate(unsigned long start, unsigned long end,
-		struct madvise_behavior *madv_behavior)
+static long madvise_populate(struct madvise_behavior *madv_behavior)
 {
 	struct mm_struct *mm = madv_behavior->mm;
 	const bool write = madv_behavior->behavior == MADV_POPULATE_WRITE;
 	int locked = 1;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 	long pages;
 
 	while (start < end) {
@@ -1308,12 +1319,13 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
  */
 static int madvise_vma_behavior(struct vm_area_struct *vma,
 				struct vm_area_struct **prev,
-				unsigned long start, unsigned long end,
 				struct madvise_behavior *madv_behavior)
 {
 	int behavior = madv_behavior->behavior;
 	struct anon_vma_name *anon_name = madv_behavior->anon_name;
 	vm_flags_t new_flags = vma->vm_flags;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 	int error;
 
 	if (unlikely(!can_modify_vma_madv(vma, behavior)))
@@ -1425,10 +1437,11 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 /*
  * Error injection support for memory error handling.
  */
-static int madvise_inject_error(unsigned long start, unsigned long end,
-		struct madvise_behavior *madv_behavior)
+static int madvise_inject_error(struct madvise_behavior *madv_behavior)
 {
 	unsigned long size;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
@@ -1482,8 +1495,7 @@ static bool is_memory_failure(struct madvise_behavior *madv_behavior)
 
 #else
 
-static int madvise_inject_error(unsigned long start, unsigned long end,
-		struct madvise_behavior *madv_behavior)
+static int madvise_inject_error(struct madvise_behavior *madv_behavior)
 {
 	return 0;
 }
@@ -1565,20 +1577,20 @@ static bool process_madvise_remote_valid(int behavior)
  * If a VMA read lock could not be acquired, we return NULL and expect caller to
  * fallback to mmap lock behaviour.
  */
-static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
-		struct madvise_behavior *madv_behavior,
-		unsigned long start, unsigned long end)
+static
+struct vm_area_struct *try_vma_read_lock(struct madvise_behavior *madv_behavior)
 {
+	struct mm_struct *mm = madv_behavior->mm;
 	struct vm_area_struct *vma;
 
-	vma = lock_vma_under_rcu(mm, start);
+	vma = lock_vma_under_rcu(mm, madv_behavior->range.start);
 	if (!vma)
 		goto take_mmap_read_lock;
 	/*
 	 * Must span only a single VMA; uffd and remote processes are
 	 * unsupported.
 	 */
-	if (end > vma->vm_end || current->mm != mm ||
+	if (madv_behavior->range.end > vma->vm_end || current->mm != mm ||
 	    userfaultfd_armed(vma)) {
 		vma_end_read(vma);
 		goto take_mmap_read_lock;
@@ -1600,13 +1612,13 @@ static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
  * Must be called with the mmap_lock held for reading or writing.
  */
 static
-int madvise_walk_vmas(unsigned long start, unsigned long end,
-		      struct madvise_behavior *madv_behavior)
+int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 {
 	struct mm_struct *mm = madv_behavior->mm;
+	struct madvise_behavior_range *range = &madv_behavior->range;
+	unsigned long end = range->end;
 	struct vm_area_struct *vma;
 	struct vm_area_struct *prev;
-	unsigned long tmp;
 	int unmapped_error = 0;
 	int error;
 
@@ -1615,11 +1627,10 @@ int madvise_walk_vmas(unsigned long start, unsigned long end,
 	 * tentatively, avoiding walking VMAs.
 	 */
 	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
-		vma = try_vma_read_lock(mm, madv_behavior, start, end);
+		vma = try_vma_read_lock(madv_behavior);
 		if (vma) {
 			prev = vma;
-			error = madvise_vma_behavior(vma, &prev, start, end,
-						     madv_behavior);
+			error = madvise_vma_behavior(vma, &prev, madv_behavior);
 			vma_end_read(vma);
 			return error;
 		}
@@ -1630,8 +1641,8 @@ int madvise_walk_vmas(unsigned long start, unsigned long end,
 	 * ranges, just ignore them, but return -ENOMEM at the end.
 	 * - different from the way of handling in mlock etc.
 	 */
-	vma = find_vma_prev(mm, start, &prev);
-	if (vma && start > vma->vm_start)
+	vma = find_vma_prev(mm, range->start, &prev);
+	if (vma && range->start > vma->vm_start)
 		prev = vma;
 
 	for (;;) {
@@ -1640,32 +1651,29 @@ int madvise_walk_vmas(unsigned long start, unsigned long end,
 			return -ENOMEM;
 
 		/* Here start < (end|vma->vm_end). */
-		if (start < vma->vm_start) {
+		if (range->start < vma->vm_start) {
 			unmapped_error = -ENOMEM;
-			start = vma->vm_start;
-			if (start >= end)
+			range->start = vma->vm_start;
+			if (range->start >= end)
 				break;
 		}
 
-		/* Here vma->vm_start <= start < (end|vma->vm_end) */
-		tmp = vma->vm_end;
-		if (end < tmp)
-			tmp = end;
+		/* Here vma->vm_start <= range->start < (end|vma->vm_end) */
+		range->end = min(vma->vm_end, end);
 
-		/* Here vma->vm_start <= start < tmp <= (end|vma->vm_end). */
-		error = madvise_vma_behavior(vma, &prev, start, tmp,
-					     madv_behavior);
+		/* Here vma->vm_start <= range->start < range->end <= (end|vma->vm_end). */
+		error = madvise_vma_behavior(vma, &prev, madv_behavior);
 		if (error)
 			return error;
-		start = tmp;
-		if (prev && start < prev->vm_end)
-			start = prev->vm_end;
-		if (start >= end)
+		range->start = range->end;
+		if (prev && range->start < prev->vm_end)
+			range->start = prev->vm_end;
+		if (range->start >= range->end)
 			break;
 		if (prev)
 			vma = find_vma(mm, prev->vm_end);
 		else	/* madvise_remove dropped mmap_lock */
-			vma = find_vma(mm, start);
+			vma = find_vma(mm, range->start);
 	}
 
 	return unmapped_error;
@@ -1846,22 +1854,23 @@ static int madvise_do_behavior(unsigned long start, size_t len_in,
 		struct madvise_behavior *madv_behavior)
 {
 	struct blk_plug plug;
-	unsigned long end;
 	int error;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 
 	if (is_memory_failure(madv_behavior)) {
-		end = start + len_in;
-		return madvise_inject_error(start, end, madv_behavior);
+		range->start = start;
+		range->end = start + len_in;
+		return madvise_inject_error(madv_behavior);
 	}
 
-	start = get_untagged_addr(madv_behavior->mm, start);
-	end = start + PAGE_ALIGN(len_in);
+	range->start = get_untagged_addr(madv_behavior->mm, start);
+	range->end = range->start + PAGE_ALIGN(len_in);
 
 	blk_start_plug(&plug);
 	if (is_madvise_populate(madv_behavior))
-		error = madvise_populate(start, end, madv_behavior);
+		error = madvise_populate(madv_behavior);
 	else
-		error = madvise_walk_vmas(start, end, madv_behavior);
+		error = madvise_walk_vmas(madv_behavior);
 	blk_finish_plug(&plug);
 	return error;
 }
-- 
2.49.0

