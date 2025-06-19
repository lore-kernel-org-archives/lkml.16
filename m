Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050AB24729D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364847; cv=fail; b=pUBiFQDe4okdotnpd8eG5ACIY1SQBmeeuE5an71fCJjni7XoSNcz50vbrpbGiow33PA6XuN9Rh4tTrkyMfgYgaxob+RCctnOzsFfT8sKCZJKbKsgYl2Jm2UjU2FNz2/Xn+rVLZjuR3PL5KklD4TDape9tzXZUNycbgnIXp7Ooh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364847; c=relaxed/simple;
	bh=WCN2/Pw61hx3hps6tanGmqwDNddGeVn6CsGQwMl0bJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uz33xbu5s0ZTSklhOcmYhdicBbLhLMCLnefqL742D3pRMjMk3q3J9oGCH6pKO9MXkGkXaF8xT+k5OpN66kapY6VWiehcpvVlYgwIQ+wUeWKd4D6ksXnEw9NJ5dtScfH3wRmfrw4LD5xYcN8y3M769LFaCaDMA4lTCE8KJA4B1D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hTY1VA5g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rMpk57t/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hTY1VA5g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rMpk57t/"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIhstF004542;
	Thu, 19 Jun 2025 20:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=caD/VXTOSUWzywsa
	QpCAQ43ds9dlhDsN6uSWeGlQxzA=; b=hTY1VA5gdtrTIpBBm8oQ/tkim3ptKVMt
	dN5PqkFo37r56tPsPsQddMZStDmCPIxrHxIkrqJziqJRUpPTvhL7PuOLNCVlulPk
	+TTjnqPRox0R1440a74fD1MRJg1CkE7ta5WPfmlV3SvRC4U8vn/Y/lvPyaCP7WAe
	pL7GvwgsCz0yGTfvU7+y4F3FUd5PzeFSnjbox6wf1/FJPA+9ZzyQOVY+R+lLcnhn
	67bFqtITMw9+K6xhLsi9odbdRU0FpUm6HczSVJ40FpXCNGkavoKYRLYRTm8il2qe
	LD4xvGG5+RT+bQTOkaxtzSvS/L7FoZnIBs7Q8RomDnNdXpUczDgrbA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f2jm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIZSCA021546;
	Thu, 19 Jun 2025 20:27:01 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbyxfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6ae5zIkkluX696Sfx2NFLXLdkOl89igw/8FFiPneAofE49qrJskhcButDXLiVOzy9rsPq+JE1lSQPz60a6mhIAThpoDfjLhpbwqyteaOKIbxt4nZ9Ng+6oRg2kCAaXM+3fpQSq3cyy6fUXzPoZgWlNFOR9kz7x5BfjLcz5hOL6Q6XTyyqCw8XBBN3ISRgA7XowJVOygzS0KKJfh3Ozh9ieQmSHLJLGlId1fmZrhivaDfC5ZzBCaccng1/2Y8uMt9Nb+RGgK6HYUvoC7uF9Lp0hSnBdLOHHy5hLWIsf9Fn3ZBsRFXXUEWPuedYlq+YBc2Kz9ME9uHTEmL94KvsHLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caD/VXTOSUWzywsaQpCAQ43ds9dlhDsN6uSWeGlQxzA=;
 b=xAaUH6ayqE1w1GtfsCyM3y8AD8IgscD4f5xCUA0mMaRtdJRyg+Xde1AgGDkqsDvllLAK02MBAqnGdMBhRjiTTEXRr5tMws2s9NvFqaj4uEPHFrKO20kxaIGBFf2ZMbzeGccDHD1Dfg7zho0H3z9OrhhhVfGKJcsr9Su68ignMBCrQtMkOiyuktNRh/Npu5lf1RWLuRJ/RFUuuT22ne8NSG4/VTNTmt55Uy0RNIyVDhRadULII+5BLWXX3OdvCmaNDkr/2mknS3ibh/PmSbIaEMp9nWw+AqIc2KxG0FKug4VT/M/2d0O2emNUxRht5sKyRIk2/9np80xins/U8oav6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caD/VXTOSUWzywsaQpCAQ43ds9dlhDsN6uSWeGlQxzA=;
 b=rMpk57t/totumDw8poBrjiVRCywU+7i+9WPMORYddt5bXB3kXRV9BrPZ6dVSZbTHCgc3r0nzd1l0zy08vWWK8RxAlZXlcKR9RJW7ICc4gsdhp3F017CbliYaSmmbRhlviEbrP9Vm9SBRROS92FdcL1zREgF4YmBQbd8r1TI9hYM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5791.namprd10.prod.outlook.com (2603:10b6:303:14c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 19 Jun
 2025 20:26:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 20:26:58 +0000
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
Subject: [PATCH 0/5] madvise cleanup
Date: Thu, 19 Jun 2025 21:26:25 +0100
Message-ID: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0434.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: e6299dc0-a611-4a5e-d6d4-08ddaf6fa3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GMrEATYQtU0eOk7gSR0g2aJDge5DEyOH6JpgfRMqd2ATc5IUSX2P9X6C0FTS?=
 =?us-ascii?Q?evmn/QcsUv+9Y6wd6YLli/XEXPXcZmopc1nqoGK6ddilZ/w92gWhN3Ku92ZL?=
 =?us-ascii?Q?lB5lqidGlDVVw+EoElhlpJikbNXFF3wU8x/TK+7inp18zUlz19QN65DfYvcd?=
 =?us-ascii?Q?0AU2o7jJL/vUevnO+00jBgfuo8Zn8+cWxf+/DgHjRGG0TukHZSDDu1zWqp4V?=
 =?us-ascii?Q?KILK+rlrvApM5UaJHTngeRstHTTVsGb7ik6ZC9gGtrAwvW5uZgqPOxFPt119?=
 =?us-ascii?Q?3aZlk2bDVDSmL44bTJ4F7zUZtjAfueSa4gAgc88SlE3tGh1N3AtEzX5BQF1o?=
 =?us-ascii?Q?pKjeF9Joe9MEkZd45ulcGkpeQzYnfHMgXA32tP3fBdF/xQic6BGyQXVUWKS4?=
 =?us-ascii?Q?ObroBEELktpZZjSMg3F05OCDF1Au+5+3pbTL/M0mM5i3GXBaV89pBPg8ar7+?=
 =?us-ascii?Q?CKhQs1p8Ec5+ojncsUTUijf1OlbKwh4XHLsKXiuNWmo6KoqI0pvA7KuNju+I?=
 =?us-ascii?Q?tI4wFTUL/5MZyF1Kq6u2hV5HyvEWGo9YuJwF32eMG+YkCLaAsuCBYAAARrKS?=
 =?us-ascii?Q?SROj9Oi4Y+CWCbzW/715+i9GPFAb9scbQXglxjjaSvl/K9+ysCq3L8/ju53Q?=
 =?us-ascii?Q?xHfY7WICWIHgOn9zJ2vtJRGn3fEOEty30OBUAIv3L48D0vflpn7VQpz+U3kY?=
 =?us-ascii?Q?dBH1YAa0ra7snWQDCLQDb6uVfJO18zFup8irR+8O+wcqBIGH0xakrxELUNec?=
 =?us-ascii?Q?M5OGSs/ZSwzyrnBKkOb+FVW3aWJJVdKawMyV09nlA5D02bvBciHCwBkny8VP?=
 =?us-ascii?Q?3pSiVlpKARwPuMSg4sFeV7VnPa8GI0S/YjtKFPYci2o7vB3Z7rAPmh+0RVzE?=
 =?us-ascii?Q?d0v9Jo6BwiGcHOkon4Aj6BT1Bau5xc+AojE0xkqHHSg9+5LHs+bEibL1Z4yY?=
 =?us-ascii?Q?EK9L6zga57FIkuqPtmTJmbRb2i3qm63aVzC7fBb9L+/c4BloCaVYUtf17m7V?=
 =?us-ascii?Q?jNLzxDihLFP3OeJMvykHK6Csy+WxJtT9t17NNa2+wq/FrkjZ3nO7mIxdL/X2?=
 =?us-ascii?Q?fEuU/CcEecKMT97n/8+P1/hSkw4FeCKskp+5k3U+U8ANK/5+r6bjguQ7OIsR?=
 =?us-ascii?Q?4BaYULH4Gey5820pRI8s108YpEPU7toccW8TdPr3Leg+nvsQekN7Q+dd4xzo?=
 =?us-ascii?Q?apJjIOh8HXhSAJsMtSomu8CM80BJ/TgPvGTb1BQhTS+DhCkBhedBtkykyDhZ?=
 =?us-ascii?Q?/YTuLulmqxTt0GbPLkoeKzeTC6+NxiAnWPTAbl7cWe0WcBcrRoOJ1Mpu/INx?=
 =?us-ascii?Q?+ciWcST2xYcnCrhbDWoUFXIcnPF996+Ns2yZqEqyrpCJO1UQigTclhXx7+i/?=
 =?us-ascii?Q?1QTp5OnCi1rWNHqAHTq3hn2Q98wfiGs9xV/T2WwESyP9tkff09weLoiVxNKj?=
 =?us-ascii?Q?fd4XzQ8XHMY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CId09ObLJdjiBCxslng/6Kf+8kFazLosCzWTG2b54spp2JCeu3uBFQ0mUMSn?=
 =?us-ascii?Q?IHwTdK7NrsB5nDummKh75Lc7KiZxIDrSwJcxmLB9hd+clI2qS0duZa0E4WoX?=
 =?us-ascii?Q?xJr+QiY6VATd+wMOYyVIyot3XKnUfCvdqFkg++b8hP4Hz0jBte+LyRBcNKy3?=
 =?us-ascii?Q?49spN652X8UGOdcni1Ql8R9F2KAxwll86gckmPxtDy+drnv8KwPYjK7Nb8FG?=
 =?us-ascii?Q?+QQcuDqPqRuRXNW76HM/7jbTgrZ9rKY0OqOvvosxj9zC3xuev5Ws3F9tG3Q1?=
 =?us-ascii?Q?zsGwdOvPXYvAN5p3V70TXCFllmYp3Gj6dv22kcYYExiAsOpHjyFMPpvxa9O0?=
 =?us-ascii?Q?fZkG2xrI/hb/WBpP9mo0i4uH4DL6xv5vYWdWYxuBzFSokiIM0Ox4ghbVH+Mv?=
 =?us-ascii?Q?LNYQFwNN00TCoO6bv6GzN6gg9RFJ9EpJrg72qo9UsbqQvfcfwTZiU0Xqh2rg?=
 =?us-ascii?Q?YNtecNues0qNW1ZmDVzUGXwx3IRtmZXbwdoOsp9Cd5Qu0C7UzAUht06biIr5?=
 =?us-ascii?Q?fvkTyfA3eSBirws39FXdcDxHusd+w+Li9dmsxYtlARu8e9KWR9if5Nj1PVyl?=
 =?us-ascii?Q?RL6hhlpW/tYBocE5wRfHANEPR5pZCdsCKbkoIj88pwshrb+djNoCCcj1CMaU?=
 =?us-ascii?Q?UrClgClz/FpEvYiQsqCa94uXTUntGuI6qMyibmZDiQtRcrZEhcMFYqR/ksrq?=
 =?us-ascii?Q?fkglaK8WttbZ2rCnog6GwfMPz2kk3Bbtkhcf/YfL1S4XnwLRw7MsZUHSB9dG?=
 =?us-ascii?Q?6K08n5mAMPGqjFo1phEAJQUp6EGFuEVmBSVV0IC7d2kYdS9PK0wSWpcb9p3O?=
 =?us-ascii?Q?BsFf6TqgdfGjIA0dq6gTQNMUX6kXnokYWyRlUvXajU8M91himdX9G2TtS0q4?=
 =?us-ascii?Q?thV3scLXWzdQ1Ju249XEhYtu+Hx7ek7ehla8m+jDznDIZP5IadhNvdTRoMhR?=
 =?us-ascii?Q?7FMs7E/HSzvX64UE4W2SOGRdRmCo4cqzph/9dlzsipRqCoBs7tkKKNb19v4J?=
 =?us-ascii?Q?fohImWSiQcHaInA3seoMt+KMrKD9xEW4VbJITDI/Hk6erquiIMKZ1JIyWQkV?=
 =?us-ascii?Q?7UZhA+aKi3EHZfDe4rvzMUVJ2sArVFMe4Kz6l5GFNlCbwF4Pdbu3ioKR4/Ka?=
 =?us-ascii?Q?8qsy2I+1OB/1XnWY8YHVSA5boHBJZWVj83hOAo1sHiSyW4c4dJT7+6iVYk0X?=
 =?us-ascii?Q?8IoynP7PvW8PLQUlV6DvWWTc4wIADcdV9WSGNIgiaZlkRfmX+dT6cQczyQqu?=
 =?us-ascii?Q?bQoLHtDJ99+3ILsb5+jsq9OHL/C5PMQL7ZQKW4rWWA0gQcN/09b3EyeR+gUP?=
 =?us-ascii?Q?nUalkLVwiuzigZjpISKBcZlkvHwh3gEh16sPJvldBMjywe+AYnDfzUJxJ3ed?=
 =?us-ascii?Q?d5qGCEbJ7jaN6gbWlOSWkJ7cKitJhfT+1NqHFI2cmJNJ09aceAI5zOZLwl8L?=
 =?us-ascii?Q?omPzVaX3lXP2eB+OE8zxl4Sz+vag+vBwarpCuD6NtXZRH+VNd8iwVddrJhe0?=
 =?us-ascii?Q?lRWLk+dWa8n+28rka48r/uqz9it7CnoAgl+DFk/iQk1fmAnNV4U5s2nxqEWH?=
 =?us-ascii?Q?QYzr+aHwFBWdHQZ9lwhsMkwBwVW3Vc2Zk13FEX4NmFU59pQ0iM1cRX+m9XtG?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r6fA89YZnQ3PQGNfUbF8hUQezeaEXyO9FRyyAvRxICUJIQ9knJYWI63VVlK+UN8asjMz6n9geA1f/E1ApX2NBQUHund5090Vv2isniUevaLz9gXb9DaF7vuV4zUfNhXch5i/dqOWf2PGD8KCKxr8zPzOCtWv7fY30JYnrXHZJF3VTn1BSzQGWyLCIcPBiW+oE8QTopcgcHqs/iertKbsyfNa4Obt3m0DiQQv0iIqdKgbtOo7Hg902MobJIr1gN5MaWhXjo6MJXw+esNETy2Mg6gplY799jreB7RBWptsuHCSq1qLOQIJ20FAKHg7KoWn5eiQlPW5FmULXpdfhm512ooEpxMmIkJv+qnxQxvzdPnQLRQ6tFqYOYSXlre4KpdnENFXgl4EyXv6atrTmAKjyI+2pQegnizlbaiMSFPY/l2onmeVSp5wcDR7TwmQRi/OLhrOAhV1HmNnD+Kq8BncciJpLtes658Ura2EdC5UO09sxz/QA8MyEZkzzdJT/I3L9oTWvf5AFzZWxSVkcd6QNT4A7b+2gph36pnRbJbPezaVYRxZzyvFJ+b4yQA6EczH5mAKNU1o3RUT9f5IIe3pYHvwjKqbRUJhZqGln3bNqD0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6299dc0-a611-4a5e-d6d4-08ddaf6fa3dd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 20:26:58.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96NE5JVnv9n0Zrpi0Z9/MXp1ZWJA3Z8U7RBaXr+hhoIshcBV6adtqUwA7ws7i5UQX+y2nCDO5DX2HVvzjmluz+wscim9D4eLynpET/krUHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE2OCBTYWx0ZWRfXw/Ef5OBKtZix ddEQBPOdtQHirYD7dztg40NSyRdnrmEiNIgO2pa5ecTwNSKRF0nOjjVNQTXDNXgKq6RE83cdAZK bEqsSs802oSy0QRrdnrTxAYlJ+z7usRpuKR4KwBgC6FlIlL7VCpGV1INhWwInVMXog2EMYw2vTC
 req9dvXf9EJtUD+efVrHuwU1TJ4Or4tMedZFGhY3A0oACL2DMDJKNB5v4JvlySKIabqQYlYRz6t 8fEyu+SPnOOge2fQMVRqrx3w+eZJNK4fqg6w7IV7uQpkdXw5/UW8RNQAGi1QniwSMr5UnpjzezQ uJYMG+69hwZ7ODdIGULZVpDpsIXLke7cQ7+ge4TaH9noxxAYWhzPyiaI3jzUSXo6eBlsW1VsMHb
 yTT0K03umG3gB+6avV8k7O5sSH3yi8R4DokGYHqI7c6I4+6XSQ+wVO7dnLPb8fpVeIrrClhU
X-Proofpoint-ORIG-GUID: 8WF9Xr20l4Q7vdEqPv26Xp81Cyg9d-Np
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68547296 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=wEWmzi6hgfC_Eq5b2vIA:9
X-Proofpoint-GUID: 8WF9Xr20l4Q7vdEqPv26Xp81Cyg9d-Np

This is a series of patches that helps address a number of historic
problems in the madvise() implementation:

* Eliminate the visitor pattern and having the code which is implemented
  for both the anon_vma_name implementation and ordinary madvise()
  operations use the same madvise_vma_behavior() implementation.

* Thread state through the madvise_behavior state object - this object,
  very usefully introduced by SJ, is already used to transmit state through
  operations. This series extends this by having all madvise() operations
  use this, including anon_vma_name.

* Thread range, VMA state through madvise_behavior - This helps avoid a lot
  of the confusing code around range and VMA state and again keeps things
  consistent and with a single 'source of truth'.

* Addressing the very strange behaviour around the passed around struct
  vm_area_struct **prev pointer - all read-only users do absolutely nothing
  with the prev pointer. The only function that uses it is
  madvise_update_vma(), and in all cases prev is always reset to
  VMA.

  Fix this by no longer having aything but madvise_update_vma() reference
  prev, and having madvise_walk_vmas() update prev in each
  instance. Additionally make it clear that the meaningful change in vma
  state is when madvise_update_vma() potentially merges a VMA, so
  explicitly retrieve the VMA in this case.

* Update and clarify the madvise_walk_vmas() function - this is a source of
  a great deal of confusion, so simplify, stop using prev = NULL to signify
  that the mmap lock has been dropped (!) and make that explicit, and add
  some comments to explain what's going on.

Lorenzo Stoakes (5):
  mm/madvise: remove the visitor pattern and thread anon_vma state
  mm/madvise: thread mm_struct through madvise_behavior
  mm/madvise: thread VMA range state through madvise_behavior
  mm/madvise: thread all madvise state through madv_behavior
  mm/madvise: eliminate very confusing manipulation of prev VMA

 include/linux/huge_mm.h |   9 +-
 mm/khugepaged.c         |   9 +-
 mm/madvise.c            | 569 +++++++++++++++++++++-------------------
 3 files changed, 309 insertions(+), 278 deletions(-)

--
2.49.0
