Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2F01DF26A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051408; cv=fail; b=f9gU1OQA+ylMWNGwZhHYn3K5MvHVSdpkDIt09eMUtf4YbITzLZew0uqNBaYUsVPbH2Ym8cJIym3SS3XjC8uSbMRWzPq1qO6Mjg729HYhmV6kHEVhULqAukkJxjdZhxWpuQmgryuI3s8vZJJUGmRkN8b7VhJdQC4hJbYRg4UORt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051408; c=relaxed/simple;
	bh=lRUbZ6X5Uc7cJR3AA6qGfCSNMkcRrznTV6AJX62/idw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FyW+X26zh02WrXDII7y1vfYyCUyD8qPa1JJ5o5o2wPEhqZ1RM6PsEhPrN01Ywu8KjWP9b8vHT0gNmcbUOWzRKH/ESXL47acDBFW9bMPIOxnnTe73J4er8Ich7os+N/PG3zzLylBleWbXurWe9a+oVqrnboBjysdF6YVYvXzV3Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ErsBkWHj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nvqoA4AE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ErsBkWHj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nvqoA4AE"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNdKS8029927;
	Mon, 16 Jun 2025 05:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=br6tihzUs8C95vLYDjsGvrwC3Zby1q7EAS0AkXiUWbU=; b=
	ErsBkWHj88KUF1LfV5ZZG1BnjnJlzS4n0qrIBshujXgv6L0lU8JmB3XE7ZDyDqrF
	E8O+2E/L1sFbucsUrFDpA8YZUrbMpDeBVNaw8a1kV6cDA1QoEC0HDXJPcpFg4Sup
	/1pdnpv8es4jZZ7e3h5HxhCi9zbE2Ld/RKeZWYy3pjqE+X6hbwxS+afGhB0G8jv7
	RmD83lNN864lUdmFzVbdHaAopzBNFZDvaYmhMLo1lWalfRikp286W435vNKYX+vo
	VBQHy/0kd1ll+hcsxCmrnVvENF/iVtOlwl2frXJFn/2/hng52IAw+cpFG0XzMv7Q
	7hiYity2UsKiV3NAkR7LYg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4hqru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G34JEr032159;
	Mon, 16 Jun 2025 05:22:48 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh7f18v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZkDKfiIZU82khyzLaQZWALx5owaajrE4S3TgS0UelWSZWafhoK625p8p4DxM64yqNHIo+vVoQNPVWedc7SjNR02DWMaLnTt1LZLN/i5UaYsSkiA7EzFVS9ZEvV3UqQi/yC98CCpelpHLLrQmL5BnC6+OsG5XP8MkOtSKZWtNZU4+TO9tuHqUILoR+OOv+ajzqDuo24rlUYDvca0dRfEtt7wgDWCl/fTJsKaTUVtaFoqkxL2ClUxTQnykOkrxCOxRUXZPTg7R/IjN/kIPTTWNqVOjgveV8DwEnX/1ZTy1mpQ4xmZhtbI6V+2YTpG7xLTL0QXZGpA82AEj9evBCqKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br6tihzUs8C95vLYDjsGvrwC3Zby1q7EAS0AkXiUWbU=;
 b=okkr1GVLUhGkhOhuHb/s9SGq/XuVaYZiltx2SFlDidmD1v6dudP7s/SVWoqp7EqUN6uZHNHAhQao/d+KWCzG8hgfyqrWh5FLqTaxjGwSqKBBkcCPl+WMbKJHjGfzxJ3UTjqftOxSsSgvbev3RWRzOTCJA5uH4cm1BceqOKZVwjDxPRgMC0mLAU4CqVIsuue5ZF49CZ5N6FrkXMJH9J8/8LEWWVcVl+vZzdMr+bnqx/NuYP+eSvOISqQPyCzqetVgv0Ti9zbhzIWT5FxJZpsAOi79g3JCkt3ec5SExdcofPwOKA6IWAVe+YxeOVjUQli4iQLPck3xbRHPlC9KXG8W5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br6tihzUs8C95vLYDjsGvrwC3Zby1q7EAS0AkXiUWbU=;
 b=nvqoA4AE/1xz+PioM271QRzTVmg6uBrkp0Wo+uft3OTaJZfqbCbM6QmvMjEhZKsa4IyOPKAfemaoONYEcFH4+jU4Jcf+lRFZT2O2XFWwtr6K4e8ehrQSKMz4RkXSyJKd1qmY5w4cdHaZ94M+N+3s6sLXMofXPbcbOxfF7zd4XkI=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by BN0PR10MB4903.namprd10.prod.outlook.com (2603:10b6:408:122::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:46 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:46 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 09/13] perf bench mem: Add mmap() workloads
Date: Sun, 15 Jun 2025 22:22:19 -0700
Message-Id: <20250616052223.723982-10-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:303:2a::27) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|BN0PR10MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d169ff-cc48-41f7-2a7d-08ddac95d3b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bdo43Uw5ff7G0iXBg18d9rTJ8u9aWWY1bmn1XNXR6+LjE+MjPucK/tAPSCPL?=
 =?us-ascii?Q?ShhuEF4eZyhilAjAD8md0InDWRMvoRmOv2cr9v2iLE2ig5Ziigk55TrApT3g?=
 =?us-ascii?Q?ItwZmnRGMjZC4OSU/U34pBUW6JpZbdEdVGyC4Jm1ZRqQtfYahO7Zwkdn111u?=
 =?us-ascii?Q?u9tOM5ijiQOHmFvGEEOTmHKegvNBdK4xgQMT4UqEmoFnqrTCPEA4yqSEm7VQ?=
 =?us-ascii?Q?Qu764hRM+Ys4sAVR6ol+yZf17KfyPrUmT9V5d8ytDBVSOpCTUQSQaQfoYvOF?=
 =?us-ascii?Q?u/WpXpB5brLnX8oWjE4gT9ylsZISd/U/X7UQX4NrH48bm9BAxZnJ3ewnDq+h?=
 =?us-ascii?Q?bA/S00qh4OozL01IO0aA290XhwSI61v22HqxE4U5bHv8wtlMPRG48UZleBmV?=
 =?us-ascii?Q?Kie9fWsqBGlBBickJVYLBzAFAevBWpScnxpeylv6wf5KYm8+TWDE2JlY6sCh?=
 =?us-ascii?Q?dpgTWIi7iTscXV074/JWM+1Gyj/C+PCR/U6Sq4VFMPY3/w51iSzuHfPvGa6l?=
 =?us-ascii?Q?FDny4ov9N44e5l+XbKg57eeTQtqzAhKEeVinD/CzK4D6DQJAFckngC0EJj/+?=
 =?us-ascii?Q?XHEudHQpRFBhWCHhobVPXuikqn6hW0EariwWYn6hCWxsazOgXjXtru2Z5Jca?=
 =?us-ascii?Q?ZpSBDWosAQhjQQknvmHwKZJId8sTzERU8afG680IfH9D85q5wNv+OMnbHb4Z?=
 =?us-ascii?Q?MgmEjJ+4OFT5msZHKm2ejV4Cmn+JTaOVndCq4+RX5pITbuznrWSkoL4t/PXI?=
 =?us-ascii?Q?XVNXHlJd/7h/A85QdFz1e4FKhy8r3Wid+ePjvkNDZOIdtNvQajLUAk+QYmg6?=
 =?us-ascii?Q?gfIS6PFGS0sAwPB7eleuSkTxS2looOZjfx9EC/yXYiU+lx10byyegp8cnrDh?=
 =?us-ascii?Q?x2TlH9GY4/Vuvv4KftDkaFIqMmIeFwFNX7tluOZVlVXfEd31B1rbUo9J8nKk?=
 =?us-ascii?Q?MvcJ/sIUeKFfHhKdGm8FrQf/RtMnH/5xFWPG8hCf12kZLKQpES72QxLvlCDZ?=
 =?us-ascii?Q?rhrUo33uBSjwiGl/oaO2/uJpP3o32lzpWo9icQSYMpZC5AC5JZ9Xso0Jt8K8?=
 =?us-ascii?Q?cJld1cJ9WhOlrqx4snokqPjVc3cozizafyy/phCwBnRiGr4VA/MiD7fINLzF?=
 =?us-ascii?Q?U+dglXU65m3+CRBaUqQrnjZZvrOCEa7CVD3YYeVoNexXdZ5IedH8k+DI5IPO?=
 =?us-ascii?Q?c0t4k3HsSopXUBypDTSqhD13QP1wN8wsqxtOKIP2xXKU4Cao2qJJwV/RcMl7?=
 =?us-ascii?Q?mZ2NqzKCK1w5k6iHc+YzrEnoP0yfxbuci4t1xOz1KqNWdcLovMz8ieOleBjI?=
 =?us-ascii?Q?8RhvOwofg/KWaSh5XycKptqeutwk+ifZavfUI2tzzvbBVWedl1Yz2tI4veyW?=
 =?us-ascii?Q?Q+FcnF71v2ZT13r+pMRoq3sw5FIwd6K53kRdC+9bSpWARN6reudfNoxSlbKB?=
 =?us-ascii?Q?54JHp+EYs1U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ZnXlI2ONAy3tK9h4+Vc36DmRjARzR7nIDL/J4w6ZxPe4Gu42rWSqoGKF4Yo?=
 =?us-ascii?Q?0UCP/2lVohiigR66AG2kG+SrSbAGVJINXO5T0zpXZEx1J6r42V4RzSM1lBO0?=
 =?us-ascii?Q?DnM7LxC4F8Q57yafq7yQ2+3nDW+PSmmEREXizi+MvBAq1TAJR0+X2pZfK40m?=
 =?us-ascii?Q?epTCqe+9jma+5OnT+4kYYGsJ819TEvEr2y4ISTfnrBmO97P5mFKXHe9Su38C?=
 =?us-ascii?Q?SLX7j8o3G8WdJSRsGtDYeHowTUxRjRSyuGqvrmLBpm7Uc5DFbQmpvFiPoDsK?=
 =?us-ascii?Q?sSg7Z2YYbP1yblAhrwdCRB6IQ+6S2oJMDh4u3pOFoTezfBOA4OGVcfll/F4N?=
 =?us-ascii?Q?NtGIpV7kQAkakj6ICiU9dPBcpkhjmiDDWm959FPy5Cq1nk3/5BBqw6+pCd73?=
 =?us-ascii?Q?N1s7gd4Q67tCntfYTKxTTgAqyUMAfROGFSje4PXeM4U/A2NBuo/+EyLKJ49c?=
 =?us-ascii?Q?p8zxGPIdRSL3n0Bho9/g68rQZd8IpxdPp1OpqvBbKGNzsVX0pzi95z9Uhr1a?=
 =?us-ascii?Q?mva2LbsWqaaC2AgykJTRtPFuUeaByGRxuZKoBwWpwiVxXsx4Y2vZygwYLWHR?=
 =?us-ascii?Q?pzfO0Ywl8/HD5vMkf6KK8dC6v0NGxX/4imLMtWRqykWYVzFXxGJMKVuykEVN?=
 =?us-ascii?Q?NyHq4rW7aGBoQOMPWu2GmZKeJcSdeS/AmCPgDYY+hMHAnY3Xsr+Rauuxvx+O?=
 =?us-ascii?Q?xJtU/cY3aNzpcFRhszsL/c7dizL8gZ0HIF+9rvNR6uxAwai94x9O6OrKLHSo?=
 =?us-ascii?Q?M812ZeriGQ/pA/zhGkA04Y+ssSj6ZJRivBlhB24dsqB3Y6RqShbo2mNm/HED?=
 =?us-ascii?Q?KHvtZM4LHg/tOLvqg+7b9v/VSiJpID6tZFzC9iBPIeXPtc3RhEUCDrmcfXFq?=
 =?us-ascii?Q?b+RJP3eAE+HTgDq6q+Cf+EzBhNZKu8QcNLeTPLh4W2+UJVvLFuF9iNzTKMK2?=
 =?us-ascii?Q?OuwSUinvz2ltY4xBMfm+dXVhFiD8oYAvJ0WT2xyCb2XrvgKCBYtxxX5mxJSX?=
 =?us-ascii?Q?MEVFndrYIC7QHkU+IRouQfczPxkwWa7lX0ODa/cFZBzfUUIfSrDQLEum2hm5?=
 =?us-ascii?Q?PjUdoiufHg8cV+hNl4pkeo8M+t9wz72yw8WH37Jm6Op4jQpq7JKrbp2bP0sL?=
 =?us-ascii?Q?6zQTAxB6WWKeqHMgcSzHVk15FSOrAMXbSMd47+aeXdl0qBxSdJrmsr/mhT2y?=
 =?us-ascii?Q?GG0zl+Z4f4OflrBzF7FRtqDNtdVtC4bF9qtfAeomyHOhvMSPCZXsEclzy/z4?=
 =?us-ascii?Q?fFXOv5liPX4SCjqWk1FzprSxLqmJguOc7Nlq1vQ83vLcumBCisI93KdZY3PH?=
 =?us-ascii?Q?TEmQs42Z71nDb/kOusgBRV9aHGdflkhAnJR7w+H9kVLUVwueiPNmc2ZUNxS4?=
 =?us-ascii?Q?l11UJsvlW6mO+JpOHwYq5yXJai01cTchWx+OkJLFtwNYTC7csE76LsZwVAGU?=
 =?us-ascii?Q?sHm8JGNUXlNKDfUSu7kgWwSI07ULqXUZw4T8iwH01J/iDcH6Cw+cGHGrLEnZ?=
 =?us-ascii?Q?xGb77JIVqyOI8/zp7vA8MUV7/c8Z6z2V7McPhpeqzfYpMr9b+N6efvO0Caej?=
 =?us-ascii?Q?UERU5qd3B2eE5BeTmbhrIOI02zk9HRLgaIU3lOnlFseh6nxMWtVOEVBGcDmq?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N7RxOZc3uxGPJWKBDpVZnk7fdTexGt7GGndqwsD4wcvef+F+lsipMyXo/cbx3K0KjtTi/CshEYvZ5lkoDByTIMfuEEiFgqCH+c6jfjlT/gouBDfNP57enxZV3nQ6dSsjtUXz2x1+aXOEJUbI1cirfXefgXBOum8NeW7TtXcgy037miMGCxturvcNkQ2zvGpXZ4x9TlxEqHBipGXsUnEK256dZvx9JmS3r4cjc55cqTVXeh7PRdYsMwvc/1tH5qnzbCy4u4JoLpGJfI03/lUGQzDDqS2Q/xjZ7226HHPBnfc+8Tqmn9/YNGnQSYjB9ukTFG0CE4sAkJwzP0feliPk/G7nT+Gp0o44othmdZ/j8K3umXHSkc4jFeVViEvSDij5NZSGxLvbNGujlXaqRvtwCINJhVb4Q6Odq/ehzqO77WA/hMeozJJmiIrQvmHiD7QoJuXow6PSra6eBpUUExnjtLRj6/nECCfDqEeMv1P06SYOUq2D2PWLCqwvnP4AFm0g4JFKlArFQWzfbF5Lc/HKqeoUTAHX4V31wgF3HUUd2lTlF/pOE5vkFOQm0X7vGKV0lAND7iGfj4Z6uEoTu3CLzOluxlCgzp6XQSde4I70Ru4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d169ff-cc48-41f7-2a7d-08ddac95d3b5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:45.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdrxcOKS4Pr6039hlu2w6Rxarzyu8KnmeQ/GJ8hwPeRafJKPRZY5kPkg/j6nQLoj7/GqKP6ifeWlI197cOZRead4aVz1P+vqTzO9S9NIQS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4903
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX21W7NiHWGg3J H3MbDoP4WR0N+RX16Oo7g8sJKQCTlTssjMhQ4wq86xfW6O3Dd1o0O6OSG5n5epdrm0DG7yMQWm/ JMPpKrfnsLDX3S0V5JgnVh1xuAVi3apVSzEC6htpFm1g4N8K1rQs8U5bgPeYI5n83EvZR6SGoR3
 W5lGKixXrspTJYL5RXsBEf3H339njEkmACXL2MB2KBvvDxK8QEk4V5lw5UAp5C73yzIsBYfm/6K g3ktJ4DT+zlxHjhgNE9/1OoSRsLqRbg06XhAZIl+9dLUhw0uhqP7TBxhfXMDE0ZXpJ+qQIWv7I+ 5nLneL6/pDdjnQiDOp/6hLs4Pc3d1rs+TAFjSdTPAqmezG30oNIDFcM+z2xzUwmRLafwFJNOptc
 YAldnQlto+hsWk8Ot1alNjix2yk+q9ukWJ6+sX67A6nZGFto9uqnLRo114wg9sejkYacukBE
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=684faa29 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=l6V3Glt4oJD2QoyZdxQA:9
X-Proofpoint-GUID: W0o2iU1MEDpkjFfJ3ZklEug_SmuA9yca
X-Proofpoint-ORIG-GUID: W0o2iU1MEDpkjFfJ3ZklEug_SmuA9yca

Add two mmap() workloads: one that eagerly populates a region and
another that demand faults it in.

The intent is to probe the memory subsytem performance incurred
by mmap().

  $ perf bench mem map -s 4gb -p 4kb -l 10 -f populate
  # Running 'mem/map' benchmark:
  # function 'populate' (Eagerly populated map)
  # Copying 4gb bytes ...

       1.811691 GB/sec

  $ perf bench mem map -s 4gb -p 2mb -l 10 -f populate
  # Running 'mem/map' benchmark:
  # function 'populate' (Eagerly populated map)
  # Copying 4gb bytes ...

      12.272017 GB/sec

  $ perf bench mem map -s 4gb -p 1gb -l 10 -f populate
  # Running 'mem/map' benchmark:
  # function 'populate' (Eagerly populated map)
  # Copying 4gb bytes ...

      17.085927 GB/sec

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 tools/perf/bench/bench.h         |  1 +
 tools/perf/bench/mem-functions.c | 96 ++++++++++++++++++++++++++++++++
 tools/perf/builtin-bench.c       |  1 +
 3 files changed, 98 insertions(+)

diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
index 9f736423af53..46484bb0eefb 100644
--- a/tools/perf/bench/bench.h
+++ b/tools/perf/bench/bench.h
@@ -28,6 +28,7 @@ int bench_syscall_fork(int argc, const char **argv);
 int bench_syscall_execve(int argc, const char **argv);
 int bench_mem_memcpy(int argc, const char **argv);
 int bench_mem_memset(int argc, const char **argv);
+int bench_mem_map(int argc, const char **argv);
 int bench_mem_find_bit(int argc, const char **argv);
 int bench_futex_hash(int argc, const char **argv);
 int bench_futex_wake(int argc, const char **argv);
diff --git a/tools/perf/bench/mem-functions.c b/tools/perf/bench/mem-functions.c
index 8a37da149327..ea62e3583a70 100644
--- a/tools/perf/bench/mem-functions.c
+++ b/tools/perf/bench/mem-functions.c
@@ -40,6 +40,7 @@ static const char	*chunk_size_str	= "0";
 static unsigned int	nr_loops	= 1;
 static bool		use_cycles;
 static int		cycles_fd;
+static unsigned int	seed;
 
 static const struct option bench_common_options[] = {
 	OPT_STRING('s', "size", &size_str, "1MB",
@@ -81,6 +82,7 @@ struct bench_params {
 	size_t		chunk_size;
 	unsigned int	nr_loops;
 	unsigned int	page_shift;
+	unsigned int	seed;
 };
 
 struct bench_mem_info {
@@ -98,6 +100,7 @@ typedef void (*mem_fini_t)(struct bench_mem_info *, struct bench_params *,
 			   void **, void **);
 typedef void *(*memcpy_t)(void *, const void *, size_t);
 typedef void *(*memset_t)(void *, int, size_t);
+typedef void (*map_op_t)(void *, size_t, unsigned int, bool);
 
 struct function {
 	const char *name;
@@ -108,6 +111,7 @@ struct function {
 		union {
 			memcpy_t memcpy;
 			memset_t memset;
+			map_op_t map_op;
 		};
 	} fn;
 };
@@ -160,6 +164,14 @@ static union bench_clock clock_diff(union bench_clock *s, union bench_clock *e)
 	return t;
 }
 
+static void clock_accum(union bench_clock *a, union bench_clock *b)
+{
+	if (use_cycles)
+		a->cycles += b->cycles;
+	else
+		timeradd(&a->tv, &b->tv, &a->tv);
+}
+
 static double timeval2double(struct timeval *ts)
 {
 	return (double)ts->tv_sec + (double)ts->tv_usec / (double)USEC_PER_SEC;
@@ -270,6 +282,8 @@ static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *
 	}
 	p.page_shift = ilog2(page_size);
 
+	p.seed = seed;
+
 	if (!strncmp(function_str, "all", 3)) {
 		for (i = 0; info->functions[i].name; i++)
 			__bench_mem_function(info, &p, i);
@@ -464,3 +478,85 @@ int bench_mem_memset(int argc, const char **argv)
 
 	return bench_mem_common(argc, argv, &info);
 }
+
+static void map_page_touch(void *dst, size_t size, unsigned int page_shift, bool random)
+{
+	unsigned long npages = size / (1 << page_shift);
+	unsigned long offset = 0, r = 0;
+
+	for (unsigned long i = 0; i < npages; i++) {
+		if (random)
+			r = rand() % (1 << page_shift);
+
+		*((char *)dst + offset + r) = *(char *)(dst + offset + r) + i;
+		offset += 1 << page_shift;
+	}
+}
+
+static int do_map(const struct function *r, struct bench_params *p,
+		  void *src __maybe_unused, void *dst __maybe_unused,
+		  union bench_clock *accum)
+{
+	union bench_clock start, end, diff;
+	map_op_t fn = r->fn.map_op;
+	bool populate = strcmp(r->name, "populate") == 0;
+
+	if (p->seed)
+		srand(p->seed);
+
+	for (unsigned int i = 0; i < p->nr_loops; i++) {
+		clock_get(&start);
+		dst = bench_mmap(p->size, populate, p->page_shift);
+		if (!dst)
+			goto out;
+
+		fn(dst, p->size, p->page_shift, p->seed);
+		clock_get(&end);
+		diff = clock_diff(&start, &end);
+		clock_accum(accum, &diff);
+
+		bench_munmap(dst, p->size);
+	}
+
+	return 0;
+out:
+	printf("# Memory allocation failed - maybe size (%s) %s?\n", size_str,
+			p->page_shift != PAGE_SHIFT_4KB ? "has insufficient hugepages" : "is too large");
+	return -1;
+}
+
+static const char * const bench_mem_map_usage[] = {
+	"perf bench mem map <options>",
+	NULL
+};
+
+static const struct function map_functions[] = {
+	{ .name		= "populate",
+	  .desc		= "Eagerly populated map",
+	  .fn.map_op	= map_page_touch },
+
+	{ .name		= "demand",
+	  .desc		= "Demand loaded map",
+	  .fn.map_op	= map_page_touch },
+
+	{ .name = NULL, }
+};
+
+int bench_mem_map(int argc, const char **argv)
+{
+	static const struct option bench_map_options[] = {
+		OPT_UINTEGER('r', "randomize", &seed,
+			    "Seed to randomize page RW offset with."),
+		OPT_PARENT(bench_common_options),
+		OPT_END()
+	};
+
+	struct bench_mem_info info = {
+		.functions		= map_functions,
+		.do_op			= do_map,
+		.usage			= bench_mem_map_usage,
+		.options		= bench_map_options,
+	};
+
+	return bench_mem_common(argc, argv, &info);
+}
diff --git a/tools/perf/builtin-bench.c b/tools/perf/builtin-bench.c
index 2c1a9f3d847a..a20bd9882f0a 100644
--- a/tools/perf/builtin-bench.c
+++ b/tools/perf/builtin-bench.c
@@ -65,6 +65,7 @@ static struct bench mem_benchmarks[] = {
 	{ "memcpy",	"Benchmark for memcpy() functions",		bench_mem_memcpy	},
 	{ "memset",	"Benchmark for memset() functions",		bench_mem_memset	},
 	{ "find_bit",	"Benchmark for find_bit() functions",		bench_mem_find_bit	},
+	{ "map",	"Benchmark for mmap() mappings",		bench_mem_map		},
 	{ "all",	"Run all memory access benchmarks",		NULL			},
 	{ NULL,		NULL,						NULL			}
 };
-- 
2.31.1

