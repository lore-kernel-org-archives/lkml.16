Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FD8297A63
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722681; cv=fail; b=Y9yRUk4HmdQrAL9dXFolEUSebh91ag/fxveBKs4nVPzuNkoIaqkSCWucQ/CzDR8RnSANMopmCSG3HSLfipmzuppkl6tUbiV+FZuggqK5RK+ibD/sWOxgLrR1xUY30JeCk72ZgMh1cgkD2auawMaFOxn7/Pjbsvmjxp1qQWDEK4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722681; c=relaxed/simple;
	bh=6TpstzQr6QeTHnBdyd2yueADX4vZ/dtSVG9K2Re7O4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oz8LwbEWJZWdvQvhOxfrlRfMPLXI2oDs7/qntfhaq1OJAdTcrwChvsAHgpuvfbVHPI1TAwGRHY6ov1nsQjmr6Oq2A3AVR3J41ZyUHKkYzrEGzScnKpFgkQo09eapiHSo9vcWfm4Q1a1mNOLXVxJNrjHtUzOh4j4fCeVLAH2vidc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N3W6yzto; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q5jKCIMw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N3W6yzto";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q5jKCIMw"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F6fsRN009830;
	Tue, 15 Apr 2025 13:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=AIa7rZGA7xQ8XYQVrqRaPWoPQsTBFAnod3gSs6vqXXg=; b=
	N3W6yztoM06nu3b3KnPOaJ97dkzFO2eQzlOf6mqLDz05HMjAfvNSbZdt7q4qQ0qZ
	nn2UQuQteyuawGU6mcc+2TwcSQIfd3GcxFBtF53WNQDSbDh9y8vFO50UIcOZ+QDy
	253pdUTz2y3DOiGvIg5/n+vOwP5hTyGmPsx3cN8bINIMPS9XKvahanMcMn/RK2jJ
	M1SteUboI5OWKgHyx9p951pZbYMG0+gJD5Xi+nbYgqbwdN7m7TD8LpsHCJgu8yln
	cXmmYWgwDy/jKY9GD3z7Enm8QLYRCsK0w4PPISw2S3bx2+G+iuxkZAt3eqf/i1ay
	nq7QSAVxH++WMn3PcI/hiQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619441f9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 13:11:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FCekJ6031084;
	Tue, 15 Apr 2025 13:10:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460dbahjf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 13:10:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYjNTMBWnV+XdPzXuLdUjGJ01lwnFLG/JeSilRI0TjrS1FS+T2e675DM8kmFLgGVn3sqVy3Bci1Ut/yucXwsA61gqS/rWep9VUkNRNktVkQ2OWaF3ZcvMpaSOzkipcxnyWkglyY43veGRXF65rbZdnNJf2g0HW8CjyT3Qmituq31GCR1viAUKFCun/IVYm6AGJeL79ScJdnjXbZY42j3Kzh/z7VrRefLBVd7ntdW+r0g7sXShBl3ImsVlMcwcKRWpCaZb29rP6ZERyE3QIe1h46faqAkNtD8cGzJBi0eFu7mdSAuSrMXfBRnVrRysXlimzsPXDFiIBPyaYs4v+tSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIa7rZGA7xQ8XYQVrqRaPWoPQsTBFAnod3gSs6vqXXg=;
 b=NVFvoNN5hN6coz7lQndXrYe/E0jBktG1+iSR2mF8DndUX5TcxqObAQBBhHOKHIihDRbB9oZgy9mSetGxhKrs5CtzfjaElKqNxr/MXVzXVGi0jWxFod720uaBR9c7z64jJ/UyEcBx9vi98ppH4atRnU0AvGFA93DeZI92DGmOcnKDUCAtwGlNELL7nnS9jzaAJHCuvscunyFbegDFW0Ix9gbwAc2G1PtVN0lXE4tyfh0zSIj6LBzNLMi52oYOSrsKKJDmLyLuSvD8AMFpOzSEtw2fPZhmZlIMLF2gOvvGsyLEhIOOBTbFAUQ3pK1u0DSHwxI+US7RjAQmnsoW+xi1Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIa7rZGA7xQ8XYQVrqRaPWoPQsTBFAnod3gSs6vqXXg=;
 b=q5jKCIMwuC1dtFusI+sOB3GA3jnom4AKZxaVZioarnkh2qB0+gv3ZqgTusfLt9ER37kDqVjY+c/YPOsfVwUAdOJVJYUG5xy9bNGj+XkbaISqtvRdvIbrMyiiR7yJ+eK8VDV0n0uL0X8mZB4gkR9xDFoGNcG/Iq0EkvjpTD65PKM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6567.namprd10.prod.outlook.com (2603:10b6:806:2bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 13:10:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 13:10:56 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH 1/2] mm: move mmap/vma locking logic into specific files
Date: Tue, 15 Apr 2025 14:10:45 +0100
Message-ID: <acd557ff58c49aec6a83955b62de026687a79fa9.1744720574.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 2374e1bd-afd1-42d8-d8df-08dd7c1ef54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QAUABk34xAAfxhXwfX0HSHLO6q/3UVRXQopwu2hAz95dNQtem5PNSPQgFK6V?=
 =?us-ascii?Q?MryOqIA/GFrMfMyG/lCQJ2B2dfLlmtBxsRijDFFaNZOmpIdwqCSdjv+7xBg8?=
 =?us-ascii?Q?Kkmsf8oIN4aU2LOizgCrSQHsPAb2abaiBy8icelIaU2ctBhHonyQc3+NWM+K?=
 =?us-ascii?Q?sQonlDbyHOpYY0mroiUWnhzzF86M9LIhRvQLK4/jbFMwRKrr3Zao9QUahPxq?=
 =?us-ascii?Q?B1LBQCmKeK77N+kReJrAi3vdR8piRhFOywh8/z9icFyE6UZuQqcOuNPzzIfl?=
 =?us-ascii?Q?B8ICjnHlIgql1bFOhlwNK/2qb6YdbhUp0TKgjpnZOHglptwuEeWd0mO7LPkx?=
 =?us-ascii?Q?EpZxBmm0n4+Dw9L8YZYNy8IHq0bohs7DyAAZ4zmW5elxg/Kydf48Kd0yE1Q2?=
 =?us-ascii?Q?gBmkrAm2Rw7IMWn/lnAYg9nxITB9o8EHSE0BpQJQLH+tf4MNKCbWOOv6eGv3?=
 =?us-ascii?Q?YwGd+MOE+QmBONRILZPcIuoCNsLcSkGsa5TrQtLVIs9ufL7y6ma9uaaeNHjv?=
 =?us-ascii?Q?LcuBxhO+BDvGWyx6TJ9W/zUlNaNfiY+oTMBMAcMPGWFGmEWQehqziLHUsFy7?=
 =?us-ascii?Q?pq0YFngaqNvxApic84NU0JHMb5aG/yFNKHcykfknJkOdOx2nFh9Pi2EeoYJs?=
 =?us-ascii?Q?lxukmeGCCPlw68UBDa6Iq90C7NVzZPePth4GTHloK1UKieawZQ2LTMtUYzH6?=
 =?us-ascii?Q?gglu8tDN7hj0jpKSzT6bzrU62QnxopV3OwGBqCSxjjYIaAm8tPRlymvGH2xN?=
 =?us-ascii?Q?fHrJxbOr4c9N9l+x/2I2m0HhzC+WAji0YJFGxl5g/49FGUq6Y6yu3nZF+COp?=
 =?us-ascii?Q?rk1mdlyscyXYAnFTxWfUJj8Dr/trC+KpwpKyy2GgfMmFI0Y5rAs+ql+hx+vC?=
 =?us-ascii?Q?IiY7ovC7Bhx7blfs/U5xThu6RJEW0i2XcL6BOICxgGVOFr5D+ZZEw3w8GPOt?=
 =?us-ascii?Q?It/KuoI8GqPOtt5yCANRNZaw2gD8ZIsczoL7eNH82oOcAUngrrlDoS608Twa?=
 =?us-ascii?Q?f/ZKoul4RXcCgfFobYn0huihQobl2+YkbjV2lvwdpFh4ozz9W3Mvb/qXLDFG?=
 =?us-ascii?Q?aXPTO57WhG0p206ro0lyCDxHFTLh8phd28VVOftPoM1ZtzB5tRkLs4ZYud0Q?=
 =?us-ascii?Q?ktiY+WK4zsdzbimN/LIuPFbUcJha6YBF2EYpm6ajXN1YStYXoAbNEMcexFkR?=
 =?us-ascii?Q?T9Ly1z7684NrWHM9D1vKrQAXD+0NHAgq1PlYjJHg1hmX+YyIPtKaGWmmNW5T?=
 =?us-ascii?Q?MQNbQYO/p/FElJiagf4BXGMEmGQ4m4orNrmsbPH6vSSOyPHBzBhOpbv8Ahvu?=
 =?us-ascii?Q?/AMhQTRTA0C0KmvAgyWfL2dqJ/4mAovU6mhVwlbmmDr2AvvNX1VeSIhSXqtY?=
 =?us-ascii?Q?ORGhGzfVIaRnbAUsArZBC0z/TNTDwFDyJ3f8t7TqJ5CHhW3MxzPpADDBmnSS?=
 =?us-ascii?Q?YLSowqfF2Gc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IhD9rlUIJdxYQYh3G6sPBm7erm52N2+p1z01RdHIMBd25y7cvqBQ9z9h3Igt?=
 =?us-ascii?Q?Rv5xjniVaWEGP8KqduK6zMwGKvjblMLnqrf0ITn/SQpZ5Nuye5d2LW0HRnrs?=
 =?us-ascii?Q?PjjBVG2QROedB4rPRiszAgG2lyguRnzZCMr7kLGWIgSQ7xjQ+FFGCd3hu3te?=
 =?us-ascii?Q?eb1ed3hw7fE8C9gGIREAqiyw8HUCrMDow02hlJF0wbZ7yGk0oXqlXP/FnAEn?=
 =?us-ascii?Q?CLAWA46QBWnZNQxUcure5CeCbA+gU8n9h2HVEvaYgEbdii+sLvdHtM3F6Nt3?=
 =?us-ascii?Q?bVzj4Jy+sYacYdXDV5mPA3Kaa68qSwbGtOGm3ALeOih31fr7gVbbcivYa8q5?=
 =?us-ascii?Q?E3zgjrbgmpxd9aRsujtekkQV+wRU6WD5zIAdAYiS0nn3ajPGHTU0GK15rMZq?=
 =?us-ascii?Q?KAsMKYK65sOLiDoQo1TufZE/qDQlpm76sQn0gvHvaTvpT7eYHOEAmyXcGhVO?=
 =?us-ascii?Q?R6072mDcOoDQLX7PQy8FM7Wi23rZXEuLF6HY8MfEEwIegoLw/6BHG/UpHOzr?=
 =?us-ascii?Q?nlKCQ/26w5ISxGxEcgZIldW7D1EMQGDrgmVIwK/Hux6elxc4XSI9G3ss2lwk?=
 =?us-ascii?Q?P1THtVzGjrefqmKxS5iZKshMD6L70zEt5z1OVj7Ia0w4EKp3HUxZseCkfNL0?=
 =?us-ascii?Q?KT4ZdgqgGybsRbIwRPHufYgUo/cWOCboPfo4QdMB96Zf70UaYvRPUR2VuKtk?=
 =?us-ascii?Q?S/JOQCSSH9KTbylqpWGb4DmgTnTeZXfYwlLAz5RzEhIeCAckgfJX+HYjq7s7?=
 =?us-ascii?Q?XuVs+OrEFn29Jo8HNKiWIrrGSMBAG7WL+qeWzUXzEDBuMQ/CLmpUeESG3U/g?=
 =?us-ascii?Q?HtiQBDNJRIljAwPI96OvLhBWFTPkHcPnT3h0wdfZFuVOmpPs2gCGi+W3dWZg?=
 =?us-ascii?Q?LY60C01zWSBgLuGr8E9vtqlZVlF+QMPxiH3du6ZGJz9W09rl06UZrC0WsRIV?=
 =?us-ascii?Q?NRTcZeAszinPxf1xP3nkdvgr2R6czJeTLzxfNpQyvqa35ZX/dLnGkaTiwNBG?=
 =?us-ascii?Q?O3MRQB9qQttjzVANoJUQDgrxXANTfTab6428HU54HOurszSnjdLGxUwfvYgM?=
 =?us-ascii?Q?rwakw9JQbGgLTO4lkn4T9VFmTqHwbgJP3uvbLNXx3//lT1cIr2D2uoYNhdwV?=
 =?us-ascii?Q?kBYObvVIxzyd5m/Bx0z9LJ1Y26Vuzfu2PZsNHYjOn+dEzW0SFEIeraNg7Jfb?=
 =?us-ascii?Q?dBUZh4NThfcTR4/i7D1RVD1pcqdO+eNVMZzfYoBVhhz6Lr0nqco5cyq9Ervm?=
 =?us-ascii?Q?QmBdjAHr/AS0MO7oZcW4s+IZRf0IIk2NBUzIn/weu4mmNEq11WTwUEQpjOPF?=
 =?us-ascii?Q?K1ibwVTKfyUKHj3Wya11oQEoLzew4nty1/D5P94+Lg8sKqoGYPU7kJPZUDWW?=
 =?us-ascii?Q?jPZuA8oP2NH1gqmzQ5gfkKg0sVQdppZtmWEzMaxvJZ2PHcNvYaUWcMYcNOSl?=
 =?us-ascii?Q?6dJy9B1yzjuD6sKm1my+o8NVMu0QrEOxEeHL22En7FEthdsxTwqSJvMqVJPF?=
 =?us-ascii?Q?FXuUE2CYKoshGmN17ghgJ3WE+W2YduIYG/Gz5fCz6uGcOhwac8JE8HsfmDtP?=
 =?us-ascii?Q?b3AJLgx45k72Fb/2T41AkYDKmldBRDYaAVEmyvvT+tySuusxm2Z9XrK12ooh?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k5vAx8SEbs3FN6LxOiSeJqwuUuzHD1tUpgeQXUQMo/0B9fhu1OIQnxnj6LvpLLxs9q1gP7QZFteQd3PEnGw2Jl3PT018hwfaHi6eoO1GJxRkFJx7z7kbKJ8ub77N0Tx4j9uymMCG4pz3ud+69q86gm9O7qAnEapxwyoq3uRvo8pasHJd982ZWQL5lCqasSojg12+z7MZd/EYwjnglKO7P6Jr1Wv/1oT3d+dC+M6QSxo3eBFJWGkm6aXZC4eBbMIH6ptwtBgMZKwCUz3b+I2E+gNRlzb/kh9uXi441WOYxEfEmFjNRTSPIkb0ruzrGWyv/gnj5irpxSpZYEaJrnHcWT2oUS2MWOEUihzDrNAI28E2J78AkRTw224v9oJWmoQiQ3YZXQzqo0+tIdndvz1EaMl7GMbQOjEqz7djuBMnjEeM1nFRqLsS393oHF2ESASGIgHsrGJBkLpf2ZNz0M+2PhpFvO9CBHMOLZallO3HBYD5+e0XNNFW5BT0v3RTVsg8sGvbtvmcbujC2XUmAV9pwLLveKyckjvTZHbWC14j3Fzd8lLRk6WPVj+mpN+uWtJPEN5JDR7RbMZvxQr9fS7xjRngpudwlNQEf0uAD2+69Lk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2374e1bd-afd1-42d8-d8df-08dd7c1ef54a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:10:56.6462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EjLtzbq9xMbGRF1oM72Iqo9Xb8N5aigjrDS8Q0BoP4//DQxhBsH8wFoZOsXHaSAyVQgHf9vhpzpUKrsqxxESwUUsOZBJP4PGriZ+nXwjWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6567
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150093
X-Proofpoint-GUID: yASgHqdHFi2RuJgQZV1jvMem-WIj_BSK
X-Proofpoint-ORIG-GUID: yASgHqdHFi2RuJgQZV1jvMem-WIj_BSK

Currently the VMA and mmap locking logic is entangled in two of the most
overwrought files in mm - include/linux/mm.h and mm/memory.c. Separate this
logic out so we can more easily make changes and create an appropriate
MAINTAINERS entry that spans only the logic relating to locking.

This should have no functional change. Care is taken to avoid dependency
loops, we must regrettably keep release_fault_lock() and
assert_fault_locked() in mm.h as a result due to the dependence on the
vm_fault type.

Additionally we must declare rcuwait_wake_up() manually to avoid a
dependency cycle on linux/rcuwait.h.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/mm.h        | 231 +---------------------------------
 include/linux/mmap_lock.h | 227 +++++++++++++++++++++++++++++++++
 mm/memory.c               | 252 -------------------------------------
 mm/mmap_lock.c            | 255 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 486 insertions(+), 479 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5eb0d77c4438..9b701cfbef22 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -671,204 +671,11 @@ static inline void vma_numab_state_init(struct vm_area_struct *vma) {}
 static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
 #endif /* CONFIG_NUMA_BALANCING */

-#ifdef CONFIG_PER_VMA_LOCK
-static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
-{
-#ifdef CONFIG_DEBUG_LOCK_ALLOC
-	static struct lock_class_key lockdep_key;
-
-	lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
-#endif
-	if (reset_refcnt)
-		refcount_set(&vma->vm_refcnt, 0);
-	vma->vm_lock_seq = UINT_MAX;
-}
-
-static inline bool is_vma_writer_only(int refcnt)
-{
-	/*
-	 * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the vma
-	 * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiting on
-	 * a detached vma happens only in vma_mark_detached() and is a rare
-	 * case, therefore most of the time there will be no unnecessary wakeup.
-	 */
-	return refcnt & VMA_LOCK_OFFSET && refcnt <= VMA_LOCK_OFFSET + 1;
-}
-
-static inline void vma_refcount_put(struct vm_area_struct *vma)
-{
-	/* Use a copy of vm_mm in case vma is freed after we drop vm_refcnt */
-	struct mm_struct *mm = vma->vm_mm;
-	int oldcnt;
-
-	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
-	if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
-
-		if (is_vma_writer_only(oldcnt - 1))
-			rcuwait_wake_up(&mm->vma_writer_wait);
-	}
-}
-
-/*
- * Try to read-lock a vma. The function is allowed to occasionally yield false
- * locked result to avoid performance overhead, in which case we fall back to
- * using mmap_lock. The function should never yield false unlocked result.
- * False locked result is possible if mm_lock_seq overflows or if vma gets
- * reused and attached to a different mm before we lock it.
- * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
- * detached.
- */
-static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
-						    struct vm_area_struct *vma)
-{
-	int oldcnt;
-
-	/*
-	 * Check before locking. A race might cause false locked result.
-	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
-	 * ACQUIRE semantics, because this is just a lockless check whose result
-	 * we don't rely on for anything - the mm_lock_seq read against which we
-	 * need ordering is below.
-	 */
-	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
-		return NULL;
-
-	/*
-	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited_acquire()
-	 * will fail because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
-	 * Acquire fence is required here to avoid reordering against later
-	 * vm_lock_seq check and checks inside lock_vma_under_rcu().
-	 */
-	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
-							      VMA_REF_LIMIT))) {
-		/* return EAGAIN if vma got detached from under us */
-		return oldcnt ? NULL : ERR_PTR(-EAGAIN);
-	}
-
-	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
-	/*
-	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
-	 * False unlocked result is impossible because we modify and check
-	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
-	 * modification invalidates all existing locks.
-	 *
-	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
-	 * racing with vma_end_write_all(), we only start reading from the VMA
-	 * after it has been unlocked.
-	 * This pairs with RELEASE semantics in vma_end_write_all().
-	 */
-	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
-		vma_refcount_put(vma);
-		return NULL;
-	}
-
-	return vma;
-}
-
-/*
- * Use only while holding mmap read lock which guarantees that locking will not
- * fail (nobody can concurrently write-lock the vma). vma_start_read() should
- * not be used in such cases because it might fail due to mm_lock_seq overflow.
- * This functionality is used to obtain vma read lock and drop the mmap read lock.
- */
-static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
-{
-	int oldcnt;
-
-	mmap_assert_locked(vma->vm_mm);
-	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
-							      VMA_REF_LIMIT)))
-		return false;
-
-	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
-	return true;
-}
-
-/*
- * Use only while holding mmap read lock which guarantees that locking will not
- * fail (nobody can concurrently write-lock the vma). vma_start_read() should
- * not be used in such cases because it might fail due to mm_lock_seq overflow.
- * This functionality is used to obtain vma read lock and drop the mmap read lock.
- */
-static inline bool vma_start_read_locked(struct vm_area_struct *vma)
-{
-	return vma_start_read_locked_nested(vma, 0);
-}
-
-static inline void vma_end_read(struct vm_area_struct *vma)
-{
-	vma_refcount_put(vma);
-}
-
-/* WARNING! Can only be used if mmap_lock is expected to be write-locked */
-static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_lock_seq)
-{
-	mmap_assert_write_locked(vma->vm_mm);
-
-	/*
-	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
-	 * mm->mm_lock_seq can't be concurrently modified.
-	 */
-	*mm_lock_seq = vma->vm_mm->mm_lock_seq.sequence;
-	return (vma->vm_lock_seq == *mm_lock_seq);
-}
-
-void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
-
-/*
- * Begin writing to a VMA.
- * Exclude concurrent readers under the per-VMA lock until the currently
- * write-locked mmap_lock is dropped or downgraded.
- */
-static inline void vma_start_write(struct vm_area_struct *vma)
-{
-	unsigned int mm_lock_seq;
-
-	if (__is_vma_write_locked(vma, &mm_lock_seq))
-		return;
-
-	__vma_start_write(vma, mm_lock_seq);
-}
-
-static inline void vma_assert_write_locked(struct vm_area_struct *vma)
-{
-	unsigned int mm_lock_seq;
-
-	VM_BUG_ON_VMA(!__is_vma_write_locked(vma, &mm_lock_seq), vma);
-}
-
-static inline void vma_assert_locked(struct vm_area_struct *vma)
-{
-	unsigned int mm_lock_seq;
-
-	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <= 1 &&
-		      !__is_vma_write_locked(vma, &mm_lock_seq), vma);
-}
-
 /*
- * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
- * assertions should be made either under mmap_write_lock or when the object
- * has been isolated under mmap_write_lock, ensuring no competing writers.
+ * These must be here rather than mmap_lock.h as dependent on vm_fault type,
+ * declared in this header.
  */
-static inline void vma_assert_attached(struct vm_area_struct *vma)
-{
-	WARN_ON_ONCE(!refcount_read(&vma->vm_refcnt));
-}
-
-static inline void vma_assert_detached(struct vm_area_struct *vma)
-{
-	WARN_ON_ONCE(refcount_read(&vma->vm_refcnt));
-}
-
-static inline void vma_mark_attached(struct vm_area_struct *vma)
-{
-	vma_assert_write_locked(vma);
-	vma_assert_detached(vma);
-	refcount_set_release(&vma->vm_refcnt, 1);
-}
-
-void vma_mark_detached(struct vm_area_struct *vma);
-
+#ifdef CONFIG_PER_VMA_LOCK
 static inline void release_fault_lock(struct vm_fault *vmf)
 {
 	if (vmf->flags & FAULT_FLAG_VMA_LOCK)
@@ -884,36 +691,7 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 	else
 		mmap_assert_locked(vmf->vma->vm_mm);
 }
-
-struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
-					  unsigned long address);
-
-#else /* CONFIG_PER_VMA_LOCK */
-
-static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
-static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
-						    struct vm_area_struct *vma)
-		{ return NULL; }
-static inline void vma_end_read(struct vm_area_struct *vma) {}
-static inline void vma_start_write(struct vm_area_struct *vma) {}
-static inline void vma_assert_write_locked(struct vm_area_struct *vma)
-		{ mmap_assert_write_locked(vma->vm_mm); }
-static inline void vma_assert_attached(struct vm_area_struct *vma) {}
-static inline void vma_assert_detached(struct vm_area_struct *vma) {}
-static inline void vma_mark_attached(struct vm_area_struct *vma) {}
-static inline void vma_mark_detached(struct vm_area_struct *vma) {}
-
-static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
-		unsigned long address)
-{
-	return NULL;
-}
-
-static inline void vma_assert_locked(struct vm_area_struct *vma)
-{
-	mmap_assert_locked(vma->vm_mm);
-}
-
+#else
 static inline void release_fault_lock(struct vm_fault *vmf)
 {
 	mmap_read_unlock(vmf->vma->vm_mm);
@@ -923,7 +701,6 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 {
 	mmap_assert_locked(vmf->vma->vm_mm);
 }
-
 #endif /* CONFIG_PER_VMA_LOCK */

 extern const struct vm_operations_struct vma_dummy_vm_ops;
diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 4706c6769902..7983b2efe9bf 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -1,6 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _LINUX_MMAP_LOCK_H
 #define _LINUX_MMAP_LOCK_H

+/* Avoid a dependency loop by declaring here. */
+extern int rcuwait_wake_up(struct rcuwait *w);
+
 #include <linux/lockdep.h>
 #include <linux/mm_types.h>
 #include <linux/mmdebug.h>
@@ -104,6 +108,206 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
 	return read_seqcount_retry(&mm->mm_lock_seq, seq);
 }

+static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
+{
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	static struct lock_class_key lockdep_key;
+
+	lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
+#endif
+	if (reset_refcnt)
+		refcount_set(&vma->vm_refcnt, 0);
+	vma->vm_lock_seq = UINT_MAX;
+}
+
+static inline bool is_vma_writer_only(int refcnt)
+{
+	/*
+	 * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the vma
+	 * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiting on
+	 * a detached vma happens only in vma_mark_detached() and is a rare
+	 * case, therefore most of the time there will be no unnecessary wakeup.
+	 */
+	return refcnt & VMA_LOCK_OFFSET && refcnt <= VMA_LOCK_OFFSET + 1;
+}
+
+static inline void vma_refcount_put(struct vm_area_struct *vma)
+{
+	/* Use a copy of vm_mm in case vma is freed after we drop vm_refcnt */
+	struct mm_struct *mm = vma->vm_mm;
+	int oldcnt;
+
+	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
+	if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
+
+		if (is_vma_writer_only(oldcnt - 1))
+			rcuwait_wake_up(&mm->vma_writer_wait);
+	}
+}
+
+/*
+ * Try to read-lock a vma. The function is allowed to occasionally yield false
+ * locked result to avoid performance overhead, in which case we fall back to
+ * using mmap_lock. The function should never yield false unlocked result.
+ * False locked result is possible if mm_lock_seq overflows or if vma gets
+ * reused and attached to a different mm before we lock it.
+ * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
+ * detached.
+ */
+static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
+						    struct vm_area_struct *vma)
+{
+	int oldcnt;
+
+	/*
+	 * Check before locking. A race might cause false locked result.
+	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
+	 * ACQUIRE semantics, because this is just a lockless check whose result
+	 * we don't rely on for anything - the mm_lock_seq read against which we
+	 * need ordering is below.
+	 */
+	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
+		return NULL;
+
+	/*
+	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited_acquire()
+	 * will fail because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
+	 * Acquire fence is required here to avoid reordering against later
+	 * vm_lock_seq check and checks inside lock_vma_under_rcu().
+	 */
+	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
+							      VMA_REF_LIMIT))) {
+		/* return EAGAIN if vma got detached from under us */
+		return oldcnt ? NULL : ERR_PTR(-EAGAIN);
+	}
+
+	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
+	/*
+	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
+	 * False unlocked result is impossible because we modify and check
+	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
+	 * modification invalidates all existing locks.
+	 *
+	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
+	 * racing with vma_end_write_all(), we only start reading from the VMA
+	 * after it has been unlocked.
+	 * This pairs with RELEASE semantics in vma_end_write_all().
+	 */
+	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
+		vma_refcount_put(vma);
+		return NULL;
+	}
+
+	return vma;
+}
+
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
+{
+	int oldcnt;
+
+	mmap_assert_locked(vma->vm_mm);
+	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
+							      VMA_REF_LIMIT)))
+		return false;
+
+	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
+	return true;
+}
+
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline bool vma_start_read_locked(struct vm_area_struct *vma)
+{
+	return vma_start_read_locked_nested(vma, 0);
+}
+
+static inline void vma_end_read(struct vm_area_struct *vma)
+{
+	vma_refcount_put(vma);
+}
+
+/* WARNING! Can only be used if mmap_lock is expected to be write-locked */
+static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_lock_seq)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+
+	/*
+	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
+	 * mm->mm_lock_seq can't be concurrently modified.
+	 */
+	*mm_lock_seq = vma->vm_mm->mm_lock_seq.sequence;
+	return (vma->vm_lock_seq == *mm_lock_seq);
+}
+
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
+
+/*
+ * Begin writing to a VMA.
+ * Exclude concurrent readers under the per-VMA lock until the currently
+ * write-locked mmap_lock is dropped or downgraded.
+ */
+static inline void vma_start_write(struct vm_area_struct *vma)
+{
+	unsigned int mm_lock_seq;
+
+	if (__is_vma_write_locked(vma, &mm_lock_seq))
+		return;
+
+	__vma_start_write(vma, mm_lock_seq);
+}
+
+static inline void vma_assert_write_locked(struct vm_area_struct *vma)
+{
+	unsigned int mm_lock_seq;
+
+	VM_BUG_ON_VMA(!__is_vma_write_locked(vma, &mm_lock_seq), vma);
+}
+
+static inline void vma_assert_locked(struct vm_area_struct *vma)
+{
+	unsigned int mm_lock_seq;
+
+	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <= 1 &&
+		      !__is_vma_write_locked(vma, &mm_lock_seq), vma);
+}
+
+/*
+ * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
+ * assertions should be made either under mmap_write_lock or when the object
+ * has been isolated under mmap_write_lock, ensuring no competing writers.
+ */
+static inline void vma_assert_attached(struct vm_area_struct *vma)
+{
+	WARN_ON_ONCE(!refcount_read(&vma->vm_refcnt));
+}
+
+static inline void vma_assert_detached(struct vm_area_struct *vma)
+{
+	WARN_ON_ONCE(refcount_read(&vma->vm_refcnt));
+}
+
+static inline void vma_mark_attached(struct vm_area_struct *vma)
+{
+	vma_assert_write_locked(vma);
+	vma_assert_detached(vma);
+	refcount_set_release(&vma->vm_refcnt, 1);
+}
+
+void vma_mark_detached(struct vm_area_struct *vma);
+
+struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+					  unsigned long address);
+
 #else /* CONFIG_PER_VMA_LOCK */

 static inline void mm_lock_seqcount_init(struct mm_struct *mm) {}
@@ -119,6 +323,29 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
 {
 	return true;
 }
+static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
+static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
+						    struct vm_area_struct *vma)
+		{ return NULL; }
+static inline void vma_end_read(struct vm_area_struct *vma) {}
+static inline void vma_start_write(struct vm_area_struct *vma) {}
+static inline void vma_assert_write_locked(struct vm_area_struct *vma)
+		{ mmap_assert_write_locked(vma->vm_mm); }
+static inline void vma_assert_attached(struct vm_area_struct *vma) {}
+static inline void vma_assert_detached(struct vm_area_struct *vma) {}
+static inline void vma_mark_attached(struct vm_area_struct *vma) {}
+static inline void vma_mark_detached(struct vm_area_struct *vma) {}
+
+static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+		unsigned long address)
+{
+	return NULL;
+}
+
+static inline void vma_assert_locked(struct vm_area_struct *vma)
+{
+	mmap_assert_locked(vma->vm_mm);
+}

 #endif /* CONFIG_PER_VMA_LOCK */

diff --git a/mm/memory.c b/mm/memory.c
index 688f3612e16d..35cfc91d5a2e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6378,258 +6378,6 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 }
 EXPORT_SYMBOL_GPL(handle_mm_fault);

-#ifdef CONFIG_LOCK_MM_AND_FIND_VMA
-#include <linux/extable.h>
-
-static inline bool get_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
-{
-	if (likely(mmap_read_trylock(mm)))
-		return true;
-
-	if (regs && !user_mode(regs)) {
-		unsigned long ip = exception_ip(regs);
-		if (!search_exception_tables(ip))
-			return false;
-	}
-
-	return !mmap_read_lock_killable(mm);
-}
-
-static inline bool mmap_upgrade_trylock(struct mm_struct *mm)
-{
-	/*
-	 * We don't have this operation yet.
-	 *
-	 * It should be easy enough to do: it's basically a
-	 *    atomic_long_try_cmpxchg_acquire()
-	 * from RWSEM_READER_BIAS -> RWSEM_WRITER_LOCKED, but
-	 * it also needs the proper lockdep magic etc.
-	 */
-	return false;
-}
-
-static inline bool upgrade_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
-{
-	mmap_read_unlock(mm);
-	if (regs && !user_mode(regs)) {
-		unsigned long ip = exception_ip(regs);
-		if (!search_exception_tables(ip))
-			return false;
-	}
-	return !mmap_write_lock_killable(mm);
-}
-
-/*
- * Helper for page fault handling.
- *
- * This is kind of equivalent to "mmap_read_lock()" followed
- * by "find_extend_vma()", except it's a lot more careful about
- * the locking (and will drop the lock on failure).
- *
- * For example, if we have a kernel bug that causes a page
- * fault, we don't want to just use mmap_read_lock() to get
- * the mm lock, because that would deadlock if the bug were
- * to happen while we're holding the mm lock for writing.
- *
- * So this checks the exception tables on kernel faults in
- * order to only do this all for instructions that are actually
- * expected to fault.
- *
- * We can also actually take the mm lock for writing if we
- * need to extend the vma, which helps the VM layer a lot.
- */
-struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
-			unsigned long addr, struct pt_regs *regs)
-{
-	struct vm_area_struct *vma;
-
-	if (!get_mmap_lock_carefully(mm, regs))
-		return NULL;
-
-	vma = find_vma(mm, addr);
-	if (likely(vma && (vma->vm_start <= addr)))
-		return vma;
-
-	/*
-	 * Well, dang. We might still be successful, but only
-	 * if we can extend a vma to do so.
-	 */
-	if (!vma || !(vma->vm_flags & VM_GROWSDOWN)) {
-		mmap_read_unlock(mm);
-		return NULL;
-	}
-
-	/*
-	 * We can try to upgrade the mmap lock atomically,
-	 * in which case we can continue to use the vma
-	 * we already looked up.
-	 *
-	 * Otherwise we'll have to drop the mmap lock and
-	 * re-take it, and also look up the vma again,
-	 * re-checking it.
-	 */
-	if (!mmap_upgrade_trylock(mm)) {
-		if (!upgrade_mmap_lock_carefully(mm, regs))
-			return NULL;
-
-		vma = find_vma(mm, addr);
-		if (!vma)
-			goto fail;
-		if (vma->vm_start <= addr)
-			goto success;
-		if (!(vma->vm_flags & VM_GROWSDOWN))
-			goto fail;
-	}
-
-	if (expand_stack_locked(vma, addr))
-		goto fail;
-
-success:
-	mmap_write_downgrade(mm);
-	return vma;
-
-fail:
-	mmap_write_unlock(mm);
-	return NULL;
-}
-#endif
-
-#ifdef CONFIG_PER_VMA_LOCK
-static inline bool __vma_enter_locked(struct vm_area_struct *vma, bool detaching)
-{
-	unsigned int tgt_refcnt = VMA_LOCK_OFFSET;
-
-	/* Additional refcnt if the vma is attached. */
-	if (!detaching)
-		tgt_refcnt++;
-
-	/*
-	 * If vma is detached then only vma_mark_attached() can raise the
-	 * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
-	 */
-	if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
-		return false;
-
-	rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
-	rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
-		   refcount_read(&vma->vm_refcnt) == tgt_refcnt,
-		   TASK_UNINTERRUPTIBLE);
-	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
-
-	return true;
-}
-
-static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
-{
-	*detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
-	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
-}
-
-void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
-{
-	bool locked;
-
-	/*
-	 * __vma_enter_locked() returns false immediately if the vma is not
-	 * attached, otherwise it waits until refcnt is indicating that vma
-	 * is attached with no readers.
-	 */
-	locked = __vma_enter_locked(vma, false);
-
-	/*
-	 * We should use WRITE_ONCE() here because we can have concurrent reads
-	 * from the early lockless pessimistic check in vma_start_read().
-	 * We don't really care about the correctness of that early check, but
-	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
-	 */
-	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
-
-	if (locked) {
-		bool detached;
-
-		__vma_exit_locked(vma, &detached);
-		WARN_ON_ONCE(detached); /* vma should remain attached */
-	}
-}
-EXPORT_SYMBOL_GPL(__vma_start_write);
-
-void vma_mark_detached(struct vm_area_struct *vma)
-{
-	vma_assert_write_locked(vma);
-	vma_assert_attached(vma);
-
-	/*
-	 * We are the only writer, so no need to use vma_refcount_put().
-	 * The condition below is unlikely because the vma has been already
-	 * write-locked and readers can increment vm_refcnt only temporarily
-	 * before they check vm_lock_seq, realize the vma is locked and drop
-	 * back the vm_refcnt. That is a narrow window for observing a raised
-	 * vm_refcnt.
-	 */
-	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
-		/* Wait until vma is detached with no readers. */
-		if (__vma_enter_locked(vma, true)) {
-			bool detached;
-
-			__vma_exit_locked(vma, &detached);
-			WARN_ON_ONCE(!detached);
-		}
-	}
-}
-
-/*
- * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
- * stable and not isolated. If the VMA is not found or is being modified the
- * function returns NULL.
- */
-struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
-					  unsigned long address)
-{
-	MA_STATE(mas, &mm->mm_mt, address, address);
-	struct vm_area_struct *vma;
-
-	rcu_read_lock();
-retry:
-	vma = mas_walk(&mas);
-	if (!vma)
-		goto inval;
-
-	vma = vma_start_read(mm, vma);
-	if (IS_ERR_OR_NULL(vma)) {
-		/* Check if the VMA got isolated after we found it */
-		if (PTR_ERR(vma) == -EAGAIN) {
-			count_vm_vma_lock_event(VMA_LOCK_MISS);
-			/* The area was replaced with another one */
-			goto retry;
-		}
-
-		/* Failed to lock the VMA */
-		goto inval;
-	}
-	/*
-	 * At this point, we have a stable reference to a VMA: The VMA is
-	 * locked and we know it hasn't already been isolated.
-	 * From here on, we can access the VMA without worrying about which
-	 * fields are accessible for RCU readers.
-	 */
-
-	/* Check if the vma we locked is the right one. */
-	if (unlikely(vma->vm_mm != mm ||
-		     address < vma->vm_start || address >= vma->vm_end))
-		goto inval_end_read;
-
-	rcu_read_unlock();
-	return vma;
-
-inval_end_read:
-	vma_end_read(vma);
-inval:
-	rcu_read_unlock();
-	count_vm_vma_lock_event(VMA_LOCK_ABORT);
-	return NULL;
-}
-#endif /* CONFIG_PER_VMA_LOCK */
-
 #ifndef __PAGETABLE_P4D_FOLDED
 /*
  * Allocate p4d page table.
diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
index e7dbaf96aa17..7e4a1f467a46 100644
--- a/mm/mmap_lock.c
+++ b/mm/mmap_lock.c
@@ -42,3 +42,258 @@ void __mmap_lock_do_trace_released(struct mm_struct *mm, bool write)
 }
 EXPORT_SYMBOL(__mmap_lock_do_trace_released);
 #endif /* CONFIG_TRACING */
+
+#ifdef CONFIG_MMU
+#ifdef CONFIG_PER_VMA_LOCK
+static inline bool __vma_enter_locked(struct vm_area_struct *vma, bool detaching)
+{
+	unsigned int tgt_refcnt = VMA_LOCK_OFFSET;
+
+	/* Additional refcnt if the vma is attached. */
+	if (!detaching)
+		tgt_refcnt++;
+
+	/*
+	 * If vma is detached then only vma_mark_attached() can raise the
+	 * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
+	 */
+	if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
+		return false;
+
+	rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
+	rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
+		   refcount_read(&vma->vm_refcnt) == tgt_refcnt,
+		   TASK_UNINTERRUPTIBLE);
+	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
+
+	return true;
+}
+
+static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
+{
+	*detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
+	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
+}
+
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
+{
+	bool locked;
+
+	/*
+	 * __vma_enter_locked() returns false immediately if the vma is not
+	 * attached, otherwise it waits until refcnt is indicating that vma
+	 * is attached with no readers.
+	 */
+	locked = __vma_enter_locked(vma, false);
+
+	/*
+	 * We should use WRITE_ONCE() here because we can have concurrent reads
+	 * from the early lockless pessimistic check in vma_start_read().
+	 * We don't really care about the correctness of that early check, but
+	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
+	 */
+	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
+
+	if (locked) {
+		bool detached;
+
+		__vma_exit_locked(vma, &detached);
+		WARN_ON_ONCE(detached); /* vma should remain attached */
+	}
+}
+EXPORT_SYMBOL_GPL(__vma_start_write);
+
+void vma_mark_detached(struct vm_area_struct *vma)
+{
+	vma_assert_write_locked(vma);
+	vma_assert_attached(vma);
+
+	/*
+	 * We are the only writer, so no need to use vma_refcount_put().
+	 * The condition below is unlikely because the vma has been already
+	 * write-locked and readers can increment vm_refcnt only temporarily
+	 * before they check vm_lock_seq, realize the vma is locked and drop
+	 * back the vm_refcnt. That is a narrow window for observing a raised
+	 * vm_refcnt.
+	 */
+	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
+		/* Wait until vma is detached with no readers. */
+		if (__vma_enter_locked(vma, true)) {
+			bool detached;
+
+			__vma_exit_locked(vma, &detached);
+			WARN_ON_ONCE(!detached);
+		}
+	}
+}
+
+/*
+ * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
+ * stable and not isolated. If the VMA is not found or is being modified the
+ * function returns NULL.
+ */
+struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+					  unsigned long address)
+{
+	MA_STATE(mas, &mm->mm_mt, address, address);
+	struct vm_area_struct *vma;
+
+	rcu_read_lock();
+retry:
+	vma = mas_walk(&mas);
+	if (!vma)
+		goto inval;
+
+	vma = vma_start_read(mm, vma);
+	if (IS_ERR_OR_NULL(vma)) {
+		/* Check if the VMA got isolated after we found it */
+		if (PTR_ERR(vma) == -EAGAIN) {
+			count_vm_vma_lock_event(VMA_LOCK_MISS);
+			/* The area was replaced with another one */
+			goto retry;
+		}
+
+		/* Failed to lock the VMA */
+		goto inval;
+	}
+	/*
+	 * At this point, we have a stable reference to a VMA: The VMA is
+	 * locked and we know it hasn't already been isolated.
+	 * From here on, we can access the VMA without worrying about which
+	 * fields are accessible for RCU readers.
+	 */
+
+	/* Check if the vma we locked is the right one. */
+	if (unlikely(vma->vm_mm != mm ||
+		     address < vma->vm_start || address >= vma->vm_end))
+		goto inval_end_read;
+
+	rcu_read_unlock();
+	return vma;
+
+inval_end_read:
+	vma_end_read(vma);
+inval:
+	rcu_read_unlock();
+	count_vm_vma_lock_event(VMA_LOCK_ABORT);
+	return NULL;
+}
+#endif /* CONFIG_PER_VMA_LOCK */
+
+#ifdef CONFIG_LOCK_MM_AND_FIND_VMA
+#include <linux/extable.h>
+
+static inline bool get_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
+{
+	if (likely(mmap_read_trylock(mm)))
+		return true;
+
+	if (regs && !user_mode(regs)) {
+		unsigned long ip = exception_ip(regs);
+		if (!search_exception_tables(ip))
+			return false;
+	}
+
+	return !mmap_read_lock_killable(mm);
+}
+
+static inline bool mmap_upgrade_trylock(struct mm_struct *mm)
+{
+	/*
+	 * We don't have this operation yet.
+	 *
+	 * It should be easy enough to do: it's basically a
+V	 *    atomic_long_try_cmpxchg_acquire()
+	 * from RWSEM_READER_BIAS -> RWSEM_WRITER_LOCKED, but
+	 * it also needs the proper lockdep magic etc.
+	 */
+	return false;
+}
+
+static inline bool upgrade_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
+{
+	mmap_read_unlock(mm);
+	if (regs && !user_mode(regs)) {
+		unsigned long ip = exception_ip(regs);
+		if (!search_exception_tables(ip))
+			return false;
+	}
+	return !mmap_write_lock_killable(mm);
+}
+
+/*
+ * Helper for page fault handling.
+ *
+ * This is kind of equivalent to "mmap_read_lock()" followed
+ * by "find_extend_vma()", except it's a lot more careful about
+ * the locking (and will drop the lock on failure).
+ *
+ * For example, if we have a kernel bug that causes a page
+ * fault, we don't want to just use mmap_read_lock() to get
+ * the mm lock, because that would deadlock if the bug were
+ * to happen while we're holding the mm lock for writing.
+ *
+ * So this checks the exception tables on kernel faults in
+ * order to only do this all for instructions that are actually
+ * expected to fault.
+ *
+ * We can also actually take the mm lock for writing if we
+ * need to extend the vma, which helps the VM layer a lot.
+ */
+struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
+			unsigned long addr, struct pt_regs *regs)
+{
+	struct vm_area_struct *vma;
+
+	if (!get_mmap_lock_carefully(mm, regs))
+		return NULL;
+
+	vma = find_vma(mm, addr);
+	if (likely(vma && (vma->vm_start <= addr)))
+		return vma;
+
+	/*
+	 * Well, dang. We might still be successful, but only
+	 * if we can extend a vma to do so.
+	 */
+	if (!vma || !(vma->vm_flags & VM_GROWSDOWN)) {
+		mmap_read_unlock(mm);
+		return NULL;
+	}
+
+	/*
+	 * We can try to upgrade the mmap lock atomically,
+	 * in which case we can continue to use the vma
+	 * we already looked up.
+	 *
+	 * Otherwise we'll have to drop the mmap lock and
+	 * re-take it, and also look up the vma again,
+	 * re-checking it.
+	 */
+	if (!mmap_upgrade_trylock(mm)) {
+		if (!upgrade_mmap_lock_carefully(mm, regs))
+			return NULL;
+
+		vma = find_vma(mm, addr);
+		if (!vma)
+			goto fail;
+		if (vma->vm_start <= addr)
+			goto success;
+		if (!(vma->vm_flags & VM_GROWSDOWN))
+			goto fail;
+	}
+
+	if (expand_stack_locked(vma, addr))
+		goto fail;
+
+success:
+	mmap_write_downgrade(mm);
+	return vma;
+
+fail:
+	mmap_write_unlock(mm);
+	return NULL;
+}
+#endif /* CONFIG_LOCK_MM_AND_FIND_VMA */
+
+#endif /* CONFIG_MMU */
--
2.49.0
