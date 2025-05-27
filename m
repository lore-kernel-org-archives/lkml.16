Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD291E89C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363428; cv=fail; b=L2OHdoxg+1ReWN81DiJKSeovPlqt5cJXxFmWU3SO8lK6sPbdPzQlUta4ttQl4WF9xYHKP8ts7UXVIQyZ4BQg47P+O/NfhndT78q4VmGTDfzGmvV+mgFHas6pfZhnRCiyTnzzRYNIIPC0ySDgUoHXWis0v3I2MPm3BS4kzpv/Czo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363428; c=relaxed/simple;
	bh=BOyBbUnQBTmjPW+QgjgcDr1gSYHIW2dtjUoElzLfexQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Re/1RGBct8sIC61qSDYBzUTB8YAXTwZi/XhD/OB2BcQwvCFsB33cfd0FFc8HtzSPZVy29RQNwIaie0KQY2DmKGI/TuW7+l+Jp4S6rFGRvVrlLxQsefgoHXjY0bRG57wbHzEDUk0UGOi7ePmwVQhsSx8Ujw16a6uISHw6zfXL0Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M81k2/Vz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D2hUpSWP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M81k2/Vz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D2hUpSWP"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RFu33R024643;
	Tue, 27 May 2025 16:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TrHnKKN5sUvGOMy9H1
	9KalfuIIHyURs2aRMXQF8S+UU=; b=M81k2/VzZQZ3bH/ClKSBMeWapJ1+3MERBe
	vzgaRjfgTCe7VX4Roy9TjTdTpbrSRD1oRgVt9zbiIOCb5TQXuQ5PPKWZcRtU11qN
	egNAs9rZGVJxH284BhFtHdXXE9vnvEycpF4kT1enikbf0/+LPSIHDgyzqOi8kT9A
	B7gPJBSCYyx95nBZOBjw0PX9tu52pwpk8bR2w96GPy2dKG40ErQ2jlnD21d1A7uS
	sClL7Qw1kzRjRuqQ5IKQ4wXYrr2iuLWsww15YI7u9DcELlLqyEzcGyGyU/kDpuiF
	Axhn1d4/ylcOiI1beqFBp2LiMim5Czr1KBk2UkQzTEddhRpkDcFw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pd3kag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 16:29:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RGJQs1007424;
	Tue, 27 May 2025 16:29:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j9bv56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 16:29:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoioOp6wn8wzot+pdBNSgMgzb85hlrJHCDowIOA9oi4/3GYBDtBvlw1S611DprRRX92lbePc82R4+x9skMeK6NKMyXyqk5TF7PyGblH9sozhVdvH011tenFfIb8oBxr6X3ApYA03Ghe+P2SRlnsUjcYsj/dwixn04lX6UJ8ZzbWnZfwu7Z5fw+/pKdHgkYphjwlyqjLez9gZaa/inPwyI8jI+UvBkR4agDrpgKMVv627UPiw+2UGCLjyymBp7k5iHoK5ja29kwk0ikESPCi/LrvbbUbb4jx0HZKto6xN1Iqab4W5scicsZnG9bChQneAr1TjNfbYMpVgBrQcLr6JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrHnKKN5sUvGOMy9H19KalfuIIHyURs2aRMXQF8S+UU=;
 b=wANkWaqCm+NjfbzoSNLsjVI4sE3eBJVtcwT7OWPLjiqYt1XYUrQdlJWhKrsel/eoSG6RMrJvgW/Y7WyZ0VgtGHsHB5lh8o36/gticPVWu9KZFOOHDpGVVtBYhqnsg9o9zVnoCbjPUKP6imYGmfOnjlRTmRRpmZHMGjkq+DNU89buYZ2h+Df+ZLtGMNeXwWOiePOt913t0MJ8FloMUUa4G29ApH6nHhwIXarZwfAu0skbvO6+L5/qn78t2x71bchDrrhIw1ah47gyENnshRkfbMI1EiT7Bf4rtHCViMB8lMfzBK2VvLske+Chk6GGvRx1Hm7k6+ugPsslpQz6HlwSxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrHnKKN5sUvGOMy9H19KalfuIIHyURs2aRMXQF8S+UU=;
 b=D2hUpSWPKR2O3HlvO6vx2JPzFc2fSbCDCD4NrnTEhXcDjUgge+RHvz9YM7/QW2H9pczna1d86tUWGrnD2i1irv9bY1gPYAI+TvUKF3Fe5hJWkdnlYIBgtpbxvjeVOV5DLHm1DzBLbCK0bldGHRf4mZpa+mGBdxU7RZUSWQ6k1Hk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5147.namprd10.prod.outlook.com (2603:10b6:610:c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 27 May
 2025 16:29:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 16:29:28 +0000
Date: Tue, 27 May 2025 17:29:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v3 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <888a8314-b200-40b7-ab52-f30f0af93374@lucifer.local>
References: <20250527075049.60215-1-dev.jain@arm.com>
 <20250527075049.60215-3-dev.jain@arm.com>
 <3d5d5813-7764-4667-937f-cec52f8b03c9@lucifer.local>
 <422a63ea-9211-4e4b-a37c-8d4c5e964b53@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <422a63ea-9211-4e4b-a37c-8d4c5e964b53@arm.com>
X-ClientProxiedBy: LO4P123CA0437.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5147:EE_
X-MS-Office365-Filtering-Correlation-Id: aa65c769-50d7-4caa-85d3-08dd9d3ba6de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QsSVMagsfmmduqwGArw5IquajfWtAvu7FaRwGp5wlAYdnrtVfR/uihd2aPFd?=
 =?us-ascii?Q?+3Y3HbGuhGQSrfOy7uoSkV2EsOTHapo1qIZj6T4fsC3mD/BJSrCEPys/LPiu?=
 =?us-ascii?Q?zEWi0g2WzllbS0gzSEJVlTvozut5tllj8qNtracllwnqekJw7rhV+OlNgz00?=
 =?us-ascii?Q?C8193cWQJHXmL7oUTkbprGtr5gGDxxoZCxS4mg9UbUh6XYCwLmaW3UxEMZbH?=
 =?us-ascii?Q?EW6ub9mT/4CTxK5xLjBVghiG7tV2+XK7jQz/bkrSjDf0w2xu+ssmuISlt+9t?=
 =?us-ascii?Q?iOCobHmF2zYobeQRAp5FXdhfkmRhivtUwKUURrZylLMXo8jB/yiZDgFjly5C?=
 =?us-ascii?Q?UQUVQDTm2hJwTM2Sfti2wLnvvtmK5rkTEW2yxzWbZt51XqJ/6LoCqZsMiTRb?=
 =?us-ascii?Q?xvpP7uhbXgqI2H6ZnjgeKk5/JXZhPFIRbIPWFpAh4aip1dMlGxRgFznyTlF3?=
 =?us-ascii?Q?857W3MCFHHS2mNC6a3u+xeAYlXBK1gKUeOg6TFuhvU9rvCtXaYLVLclyS19q?=
 =?us-ascii?Q?eQ9qeZULhTafEh3zeBdzidAl3r3xOFdohNhpTCGdcWT+RktD6YD2BaP59d+/?=
 =?us-ascii?Q?fXH9Y2Dq74bW21UyEja/w1ekDt/lv9yBqJhrb10bNuhhCKbSSAfjEApBAL7T?=
 =?us-ascii?Q?ASSKw32sGwgjpeky7ZTuAeb1M/OXJjKsIJreWmkS1v5GUJ116xrDZLZhfsEh?=
 =?us-ascii?Q?6NjLBPXOstBual2b5UUnZKaBM6DP3XyQD0ZUByWW+INqxksurAIoHFfnQ4n0?=
 =?us-ascii?Q?04J9haDChcMd7ERWUx1++fZ10mCfvaL+39p/Xvf8J5J7npGQqmJh0tAdepQN?=
 =?us-ascii?Q?qmsfKr9M3v7ULSxhksNR+gI2w7C3qHej0B1Cdxtg5mAMD+FqbCz/Q4U2dXl+?=
 =?us-ascii?Q?PTjkxFcTTMUj9qpAiFSznqfdb/LdTow/tGV3KKlD3YbEm000g3YRYrMjb2n8?=
 =?us-ascii?Q?NtOs9FAEpgIudzWXkgjo1V5yCr6qUmyC4E0CfFpnzDWrOLFExSKEg3SaG510?=
 =?us-ascii?Q?yJMpo9jEAzyw+khCHfP4lBEJSAdoLOCD085MAHbyhmfmPjsFycFpw3dmVKEu?=
 =?us-ascii?Q?TzL9bdvpdeWaQ5a9L2+wSTmUrPxPop+vO3WHdnZbA9MRJSC88PFt+p7u9e0s?=
 =?us-ascii?Q?e7Ckg3z1SYSa3V/GlDcAGz2bpqoVDNmaM6Y+mpSYtjS4R4KpWuimAA8L7dbr?=
 =?us-ascii?Q?V1vhK9RrDeX7ZdCn7TaJtg7jjkOv7eYPsV38EMNEQSEl0W8j9XZdzt81Y+J8?=
 =?us-ascii?Q?Nwmy7AeWQZX0g/TZI6L0o3+f5mpWX06hI7iAL78djemGTJU0E0qODZS6Ixzh?=
 =?us-ascii?Q?mQLijhCDE54Gk7Mw+syBUgeWzB1lW+64MwGgKj2CB7ZBVpOkaWXd8VqUwu5x?=
 =?us-ascii?Q?3BvB+vU4VuAnuqW5dQox5/bmuRhvDBnKq6cvSwPogV/TV0/vrhGMvPS1aW2Z?=
 =?us-ascii?Q?rBC5qOCNlMo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nj+3gdT1hZlwqsDPZu9cHiNsTr6EEAZAxuPQpDxRr+dBdLwRwlxCyHUITLRt?=
 =?us-ascii?Q?Si7WbGko1lp44BSFRAy9K2oizRIc2luIYSVrdNpPQVfgc+Nq/uQIrnx0ywiw?=
 =?us-ascii?Q?Iy6WqsVMVJeJC6MY6kE731oR1QCeb8fmP/G3ZQuoWVcNrwo48FVWyikCOPGr?=
 =?us-ascii?Q?JWIYwcNI2AHQkdl0E/P+BBoDGaIQOLW9URq+0N2ZB7FrWTyvIWjYcLbpHOMz?=
 =?us-ascii?Q?NLYBVEiiuz/j7fO0yZS4CEsED/jVtuewChAU+Fmz3UnOPH6svdB3MDGzsfUx?=
 =?us-ascii?Q?ogRqBh8HnbSAmyAt7mwrlT+msdqr2pFLyqs192/zaO7eQLuZU5WiOzLP9jSa?=
 =?us-ascii?Q?mezInX6rlctZ4geaM59TnoZKcXxWPwFR5SklNHgMNjIOvbmeZdrhd3bwtfAY?=
 =?us-ascii?Q?SxlJesSA6JRgQckFUqGaEBku3LmnOWgIO0sZYvyx+7sqCJedduI0XuE/eEAK?=
 =?us-ascii?Q?oW6/1uf538XRWdHq9w+/JqNgpWNYOLqKsqKi36aY9DvO0NLAMRsqZ+UCKIss?=
 =?us-ascii?Q?bP3SAQriV5osHSBNHdSbTGSU0Z5SFqL1UhuodNXLQJYmLeA/xidn4vWQa2NL?=
 =?us-ascii?Q?V4HurEKa2XXYx0PhEgM5OCntiU74FJwsFyzoZ1DvVRyhVV5ZqW8PWhVha+9z?=
 =?us-ascii?Q?4iFGXnxfL8hrtw8Wg2GYLgoxqm5EHbXAXEWVq8txlm6141TKPEm42BX2hp/2?=
 =?us-ascii?Q?6kz0J3WSJ4g9ZUGpgUZixycl5dHpWbA2TpfrI+Pl2JGODk4z21BaWsgcoWkI?=
 =?us-ascii?Q?urgFBSxDipOLMRxvtGFOO2SB/ALsij8ddATO48a7yLmQKwWhsW6h81wRBjrH?=
 =?us-ascii?Q?WfvsJcARrmKbhHbBm0HRi/x7YOAWpdwPZUPt/RjaNpFyOgqBuQf09jY3hmoI?=
 =?us-ascii?Q?fbjDZlIwrwxFE0vJejnjCNuPfCy9BSCK6yW+pUSlLC48eOqpYfSDCKFKItmR?=
 =?us-ascii?Q?CqHzOOLtT4/nol4M0RFuoWSJk/unnBVFUlZfB4VOHmaWwuh7jpRk0ycz6aln?=
 =?us-ascii?Q?k3j14gWIORTL2J9oVxPghTTMyrSJNT8urbmBt6jzmJlEEqblNGcI0LzFN8u+?=
 =?us-ascii?Q?ucn6L9WXl+f44p48HmcUQGtNIl8xojb265NYfGphq0OzeORurzJnBvi3sLgJ?=
 =?us-ascii?Q?ST78Wwm6x+qh9QRm4WeP+16ZzpC9ulmK5ClTeUueSX/hQSo9vnzRcMyhNQMV?=
 =?us-ascii?Q?c5WLxnvvhawyijDTHz/LnZP9vEQsGDPCc5BvIFPmZ5qJhPLWTRWpwXFK6Syz?=
 =?us-ascii?Q?IyC08v4eGwFo9uOvdnFqU9YE3KWLyL82xf4moN4sUado39DhKxiCIITPg0O+?=
 =?us-ascii?Q?kg6kg36NQHnDXGCYTlTlfDCpT3eRS7SbeQF6m2vAZSo9nTrpJfHQ7xU/tymA?=
 =?us-ascii?Q?SREDfCYMh9OBQHtK7aLr6EwnpHA1kaEG44O8BCGKOzxFN3t+YfF2HCGQBrv5?=
 =?us-ascii?Q?Dl0GWozO8eD8TR9kkZ3+Dbk8Z5tnejt0yVEFBL3cye+V9qcwgyGO4LaBwTzx?=
 =?us-ascii?Q?U3R+7PP82frpVyP0z3rU/RMqqlixxghLLY+CaZtZUqAa1FlmORI0D2o4ld8E?=
 =?us-ascii?Q?GxKEdXgR5zSd/YhdjEJb35wZH2HQoO4AqRTCX6L+tioLf+IN4kT3FbCCNtEx?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G7TPFBK7FqxM4xejKwAqNPuvUzynySsE2juyR6MLGLnxm6JpA7a0MfMjUK27t+iIvVFMxYjjYlS9CuCWfA8RhmPbOZX78CeWYXgiC57W6N0pDIpGqCI6s8UYMIl+JmV31249exNBMODYdsBEQKvtBBy8xg3pk6ZP9eoX5rlLsEpnKUVmL7busyGvC3Q7Y9ENshd7azEUouuM8iTciSaofbNz9GuPsxUNrE74cvjhwkf0dnw0hkHCRl9aEblBUPqLdFk7xLZLUaxWxZk/NvXV52lyF2kIjA2ycJ5jYFaEPaRgRua4SePgpiXsCoCLAvaPZ0UBmG6kWnVY1egQImrwITlbgxFVr9l2pUnVLy8EuoYmqiI69LU31Gf2OtEk4eiXMdQoUYGGJ5glhxm9+mH4WGoo8hpjUFRT4SKhEcCPV/byGMuDJKiFhTyGr4HNarvGam2sZ7qpG8b/7VmYbBlehtu9CjlEDXIq9T9aKW6topQ0g798GnFWJvEBCVAxn3SYUbPb6s2U17R4Nfqo4Uv+mWOsvxCvWcmttQguEPzH95yfwluKJOgk26FrM+e+C7s7Y4BiZZgrzZFKbPhUYKhJKOhd8URrKB4s4DZMg5kV9RU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa65c769-50d7-4caa-85d3-08dd9d3ba6de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:29:28.5900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpV2E0swCMfQF7ZQqBydnEMdWm81jnfcKMza758yHOgisw2EEU+OI+LXS7AeZ7sysYfm9WGlzBXis52aka7j7JhI0eoXafidwMghDm4QRXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270135
X-Proofpoint-ORIG-GUID: hDicK2ecKPPjlKZJkFMwtgZT8AcMHpcp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEzNSBTYWx0ZWRfXz3XBnexsmNJg edvdAiqu9HF0L+tMzAb0RMJD0VuTi7aLrFUGx8MIMf7jJR/63l4yeVj4KOdNH187JVzDvUkMVug D3Ja7OFV8sDGMq3e+NwbExyFEz0dDjVlBB1QsqFe0YV9MeE7tZ/JOTRj0t+fjk9/tEgLad0S0NB
 DsGjCJghIZD7O2+9fyojaP3HSHGvrvSO25L/0qDS+vBK1tJKnL+4Cte/w5lk+x6B5DohqRQhZiA kMLFiDSjZ4B+byTe8Xns9x1AtOwHj3OER1HhsIuynZW/kMUoih/JdCJzo7J9B7uAiF3Xa341XAE u9iOuq6r+N8fCWaXR/20XSu+c0LlYvvQ/O/AOrsKLS6t9prFL/qsK0Xhi2PQXpZ89sZ2fCX7iLM
 K1ysBmrUS6Fx9r5vbiB9sBu03ZvzagAt0+vroqDuAcWizLCTIhnlbEwoofR4zdPAKf9w4zOw
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=6835e86d b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=cMmcVMJYroZ1qaCQGYoA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: hDicK2ecKPPjlKZJkFMwtgZT8AcMHpcp

On Tue, May 27, 2025 at 09:52:47PM +0530, Dev Jain wrote:
>
> On 27/05/25 4:15 pm, Lorenzo Stoakes wrote:
> > On Tue, May 27, 2025 at 01:20:49PM +0530, Dev Jain wrote:
> > > Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> > > are painted with the contig bit, then ptep_get() will iterate through all 16
> > > entries to collect a/d bits. Hence this optimization will result in a 16x
> > > reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> > > will eventually call contpte_try_unfold() on every contig block, thus
> > > flushing the TLB for the complete large folio range. Instead, use
> > > get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> > > do them on the starting and ending contig block.
> > But you're also making this applicable to non-contpte cases?
> >
> > See below, but the commit message shoud clearly point out this is general
> > for page table split large folios (unless I've missed something of course!
> > :)
> >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   mm/mremap.c | 40 +++++++++++++++++++++++++++++++++-------
> > >   1 file changed, 33 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > index 0163e02e5aa8..580b41f8d169 100644
> > > --- a/mm/mremap.c
> > > +++ b/mm/mremap.c
> > > @@ -170,6 +170,24 @@ static pte_t move_soft_dirty_pte(pte_t pte)
> > >   	return pte;
> > >   }
> > >
> > > +/* mremap a batch of PTEs mapping the same large folio */
> > I think this comment is fairly useless, it basically spells out the function
> > name.
> >
> > I'd prefer something like 'determine if a PTE contains physically contiguous
> > entries which map the same large folio'.
>
> I'd rather prefer dropping the comment altogether, the function is fairly obvious : )

Sure fine.

>
>
> > > +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> > > +		pte_t *ptep, pte_t pte, int max_nr)
> > > +{
> > > +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > > +	struct folio *folio;
> > > +
> > > +	if (max_nr == 1)
> > > +		return 1;
> > > +
> > > +	folio = vm_normal_folio(vma, addr, pte);
> > > +	if (!folio || !folio_test_large(folio))
> > > +		return 1;
> > > +
> > > +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
> > > +			       NULL, NULL);
> > > +}
> > The code is much better however! :)
> >
> > > +
> > >   static int move_ptes(struct pagetable_move_control *pmc,
> > >   		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
> > >   {
> > > @@ -177,7 +195,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
> > >   	struct mm_struct *mm = vma->vm_mm;
> > >   	pte_t *old_ptep, *new_ptep;
> > > -	pte_t pte;
> > > +	pte_t old_pte, pte;
> > >   	pmd_t dummy_pmdval;
> > >   	spinlock_t *old_ptl, *new_ptl;
> > >   	bool force_flush = false;
> > > @@ -185,6 +203,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   	unsigned long new_addr = pmc->new_addr;
> > >   	unsigned long old_end = old_addr + extent;
> > >   	unsigned long len = old_end - old_addr;
> > > +	int max_nr_ptes;
> > > +	int nr_ptes;
> > >   	int err = 0;
> > >
> > >   	/*
> > > @@ -236,12 +256,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   	flush_tlb_batched_pending(vma->vm_mm);
> > >   	arch_enter_lazy_mmu_mode();
> > >
> > > -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> > > -				   new_ptep++, new_addr += PAGE_SIZE) {
> > > -		if (pte_none(ptep_get(old_ptep)))
> > > +	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
> > > +		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
> > > +		nr_ptes = 1;
> > > +		max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
> > > +		old_pte = ptep_get(old_ptep);
> > > +		if (pte_none(old_pte))
> > >   			continue;
> > >
> > > -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
> > >   		/*
> > >   		 * If we are remapping a valid PTE, make sure
> > >   		 * to flush TLB before we drop the PTL for the
> > > @@ -253,8 +275,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   		 * the TLB entry for the old mapping has been
> > >   		 * flushed.
> > >   		 */
> > > -		if (pte_present(pte))
> > > +		if (pte_present(old_pte)) {
> > > +			nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
> > > +							 old_pte, max_nr_ptes);
> > >   			force_flush = true;
> > > +		}
> > > +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
> > Just to clarify, in the previous revision you said:
> >
> > "Split THPs won't be batched; you can use pte_batch() (from David's refactoring)
> > and figure the split THP batch out, but then get_and_clear_full_ptes() will be
> > gathering a/d bits and smearing them across the batch, which will be incorrect."
> >
> > But... this will be triggered for page table split large folio no?
> >
> > So is there something wrong here or not?
>
> Since I am using folio_pte_batch (and not the hypothetical pte_batch() I was
> saying in the other email), the batch must belong to the same folio. Since split
> THP means a small folio, nr_ptes will be 1.

I'm not sure I follow - keep in mind there's two kinds of splitting - folio
splitting and page table splitting.

If I invoke split_huge_pmd(), I end up with a bunch of PTEs mapping the same
large folio. The folio itself is not split, so nr_ptes surely will be equal to
something >1 here right?

I hit this in my MREMAP_RELOCATE_ANON work - where I had to take special care to
differentiate between these cases.

And the comment for folio_pte_batch() states 'Detect a PTE batch: consecutive
(present) PTEs that map consecutive pages of the same large folio.' - so I don't
see why this would not hit this case?

I may be missing something however!

>
>
>
> >
> > >   		pte = move_pte(pte, old_addr, new_addr);
> > >   		pte = move_soft_dirty_pte(pte);
> > >
> > > @@ -267,7 +293,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> > >   				else if (is_swap_pte(pte))
> > >   					pte = pte_swp_clear_uffd_wp(pte);
> > >   			}
> > > -			set_pte_at(mm, new_addr, new_ptep, pte);
> > > +			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
> > The code looks much better here after refactoring, however!
> >
> > >   		}
> > >   	}
> > >
> > > --
> > > 2.30.2
> > >
