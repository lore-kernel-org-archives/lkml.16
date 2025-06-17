Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1003342A99
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137607; cv=fail; b=cw5ZPjh7nKim4M/mXv+jUT/OIwmJMlSx+C0wCMJHcdVTWF1pqUvE1cR0sgEeHndQrOWvpMKAanYyEeycfd/teg+AH0dwoXHO3aWUwaZkZotBCcnZ5s8sEAhTe/eZeMn9ZervL24yn8vCrVBSArlYNuNoti5cp2iad2GNn1dBHUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137607; c=relaxed/simple;
	bh=BaP7I1AtpbcZsZ/kX6KctCll95RnHXHn0hwUv/UA4qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JxQqkTBrRv5Yol/8RP4nHfXLdo1Wt+/rBgou58dePMy3+d1+79rlwUTWim7wFjVGJOlZONMg+ujl/3syAxd0thsX3pniAA2HPX83c2m6hJf1Ak4tracG9GSNsBb323/BEPA+mxhvWSvF2cf0OTQ/FXR+NQ3taA2pZbSH8RJ1LFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lucMiB4I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JRlO4tX6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lucMiB4I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JRlO4tX6"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GNOiqi017625;
	Tue, 17 Jun 2025 05:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7D27Ckx9r8Yj8A7V8m
	o1jnHDMbT1IoXv8z/+tXI8zQE=; b=lucMiB4IQHGixt4JzQGtY9dE0KN0PsyQd9
	cHTsoa0nsrA+pLp+/2Lpb4CrdzAUNQWi74XouBAUItAraiI7TnrfZFWoxLfutVjP
	t31uoJ7M6XY60j0eFvbN7o+UQLza/54deHiRqSYtDap7xPmFlgI8sMKVZYR06ZW5
	A1GGbHSJ0BPjp/lVsRF61nxhsNGzl2fUCollgH3F4/lay0Y3PBP3cSkmdZTXET04
	zjujxhVresLvUNCfAWAK5TvRSF8k05OyZWL/LR6GUKzFOUw0lsai9KwboYf7ofgQ
	NBfN0M26VN4v6n0PH70b91WLrHfSE0lTf0mvrvt/kTpSyOQALrBA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4mjp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 05:19:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H5Do4X026039;
	Tue, 17 Jun 2025 05:19:50 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011001.outbound.protection.outlook.com [40.93.199.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhf1fx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 05:19:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/RJ0o7QsN9DR0Wj53DHDohZ3F9DAeLiJVCNXhqcgtGUFxj40mgpJMdMqfqzNxRAXViF3t3SLVgq9bANATmjP1sXfojOmEeiQ8yNL6M/dbfaaUuJUrh8NmRq3NYD48nSZ+Mi/V2GsJGP90rRexI5I3X1V0EtCxbrlXrABLZ7gsAgSmTKRqgSpB9GreWu3G9DbZithO8gqfhDTjz8CS2H7mNJHyvI/ON20W3ES1tHL2i6wYFtfRbXru44P0uyz39NgOyjg7dOGUjvS9N6GlMmsVDLV/USAygVSfOkYh2PYWrVW8NepQAOcWpuyGRJ3LkXoYbetL0fJ1fCXebEllEEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7D27Ckx9r8Yj8A7V8mo1jnHDMbT1IoXv8z/+tXI8zQE=;
 b=PTX0BGjC8SAd91a4bX5/pNsUoGHrm1pxv0B1jIxXZliT21uSx8XRzm+/6MbDlZtkj/FxFLF0iGNm+9PQEfFMpUyURDLk9GUWa043WgVUw8uc47FU5X5x+vHGn54b4+7rJ7SFXuXeISx/usnmvUUl0Q4vFK/f37BlifVBf5676nzvtQRtkaobYs4FczFqS+CAmtZXhEr/GbDJe/eZe33O3/03yI/ifzhOhTUcZteFwezk5PB6aywaFNa6E0OMLqiHBXpY+pOCvm7KAtBO/a0N0jA28cQBCm1Cu/XXXprO1iVoXHYIXWNSOZEkahMgE1rB5se4GhW08cZ1Jbh4henwvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7D27Ckx9r8Yj8A7V8mo1jnHDMbT1IoXv8z/+tXI8zQE=;
 b=JRlO4tX6Tyj3OClk2yep/biOHhMbvxXboJYpXNlkDW2XTHxeSwj3UXc5J7zeds71kdKWAonx+7RJ9bfMjLPBwLFaJiQFvRP9mYFGUSE4SZ62Iw18ZagkxJ3FZLEYCmRgVLMO8gu4Scl43V24lVs6LyK9W1xhE32UJARsIpS4qAE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6361.namprd10.prod.outlook.com (2603:10b6:806:26f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 05:19:47 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 05:19:47 +0000
Date: Tue, 17 Jun 2025 06:19:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH] MAINTAINERS: add additional mmap-related files to mmap
 section
Message-ID: <592639a1-fc0d-4a25-a7ff-2a4d1d99d762@lucifer.local>
References: <20250616203503.565448-1-lorenzo.stoakes@oracle.com>
 <cxwmebrnmrhnlzk4n4w5r5zlv5jwzsqfejgmsqup5fljg6jeee@vo377ihsh76r>
 <sskcpsimubcpf6uq5dtoiklp23ese3psxgl75r75saxwqpvxgw@m5cf2kfxgqav>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sskcpsimubcpf6uq5dtoiklp23ese3psxgl75r75saxwqpvxgw@m5cf2kfxgqav>
X-ClientProxiedBy: LO4P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: e6250a1a-0103-427d-e849-08ddad5e9395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iV4VizEBzYWvcWJ03yPWDoW3xfz2AxhTng2WhOJrF1CGVyIz3nyXB2m3+r0x?=
 =?us-ascii?Q?yneDvfMkv2AG6ohpfN9jCqDuwlB+8eiOz6L3r7oNLcPdwMyjh+B6Zj/LW11T?=
 =?us-ascii?Q?+mnnJELCcjaYZaJpXyBswV6mtjLKK8zWmeliyHfkD8o7f5Xt7FxYqFzIFPCh?=
 =?us-ascii?Q?anj67Qxz8LLlgVKD1Ln9t74KDO+6Kf462M7f4bH3iYEYdwMvoc116KyWKo5L?=
 =?us-ascii?Q?8uRNdEF7Cy02pTXMnhl6bsQ+JpBbbUzLeHMr23UnoyucTtNAQs/VQhfhAlFV?=
 =?us-ascii?Q?73PPI6DMHGLsaZgmdKZiq8GsZJqx85UiQww4AZ7etPWJCUi/OcIV3Xouua71?=
 =?us-ascii?Q?L1XMv/iOcNI7JzGH1dEVvRKQg90T0PbsnVgPKACB++iql8H9rZMG6nz8MQke?=
 =?us-ascii?Q?lIE/bCK5oXOuFl4pcOLewXaIxFrA726BfoEGlhgEGBGqFj9wSZ6o+kOCU6aS?=
 =?us-ascii?Q?m04LUReQc3DLu06SMDDzzhMhQpVkCVYKPCMj9WBQIW+s3DbMnZEUqE211Ag0?=
 =?us-ascii?Q?TqjLX6xw7/nh4aTQd1Gkpqb2Nny5Lz9iwLCp56XXIWUWYmIdDroJc5LW29VC?=
 =?us-ascii?Q?nQf084LuUo+K4CsuHahK+ttxFnZLabdxYCrE7xI01xblTOp0l+k5lXExi8li?=
 =?us-ascii?Q?V2XOYF+xMWNztomZde50OBV7T8IMQikSkvgskkMBkLfIkQAEMaBE25seN8t+?=
 =?us-ascii?Q?7tQ+GmNaInf+lH9Y6EIjWsz/8px74lIAM2IWl54vXGolAG1/Opyqf5yT9O9C?=
 =?us-ascii?Q?lAi3GyZURu2tB2RaWp/vODCTNrEHCHCpDEY3zvsfPmmRKeFysPalapzJNADg?=
 =?us-ascii?Q?i9uwkPlhrnZQPBYw4eJpjS52KIfiJH6GkXc5I2Y3QCdPGyxg4qGJaQLJm802?=
 =?us-ascii?Q?yVD5nGOmJri0fvCIdmH4/yHJbMq+CZO5cKEgkUR3TT/yeqTAxIgerCoDEnud?=
 =?us-ascii?Q?jWAmcGg+PP0z9ff5Xs6napSuw5u6mgibizInUfe9cHgxcXJx58lbO3Do6L6j?=
 =?us-ascii?Q?RQqP2EWRFnTp98cCukUXPd9h1nO//osoupR9AiEWlfmDleFnpGbe0iudQCPj?=
 =?us-ascii?Q?3zwsKVd3nkg8kE8qKKHFoTBRWgYToGreW9N3QVujdslTcJ+68lES2LPKTsrl?=
 =?us-ascii?Q?8ufsAUy3vVNNV1tqgqzyKIkS2iYdX4Ste1+RefvsTHS9RmU+erFIy+S6iYKi?=
 =?us-ascii?Q?v0rsEQJrTFxYJzvMMWdlum6+pBfSHgK24SnXKybIKSNgZISWVuh8J96OQdjX?=
 =?us-ascii?Q?81zFOXVLoZPTo5xan27VvX55YxO74KSWsYjPLU/DVCI4HLhdVZaiTpvIS7Gc?=
 =?us-ascii?Q?UWd49dsxKrLco5L7Ays+G6EnmhV5r7YUNsnpQTsYsX+lAAJbocO1ax5UHzBb?=
 =?us-ascii?Q?HsbArz4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nvxRh8CuPxaEtJRm03O0OSp4tCuipeIfyjZGBA3SjEuXtSQMHi2Ds+YSFhIC?=
 =?us-ascii?Q?j37jR/8MAfCi/5zRwVV9iVzT3sur2UcW53zGhJJNd7HWU4nqxJqJZEPsJfNa?=
 =?us-ascii?Q?X7RRdPEIU/lDbLvuhvsW+Dw+06q2RLlEbe76+RXrmkGivwq9qaKiqimPqjKg?=
 =?us-ascii?Q?rDTaWsVTes9bqqen7VcD6uCLkGwwYcWTh57o5xgzCYGcP5cOWTAOE23xKula?=
 =?us-ascii?Q?v2YUwM7P77winxyK1xltENunXosW0YKjFp1lLZh/5y8sHDMCrOjCgYCmyPz0?=
 =?us-ascii?Q?V/yHwaJw0rk7Xfo5rTF1JWK+DpkbxB+u98isRPcLT1/TFNdZWYJ4taJmnw72?=
 =?us-ascii?Q?AoTtHSX2TSoLSg+F+ICnWuRB4nStyDEQ/toqAusGSxC7K06dAU5xfz/MoMZR?=
 =?us-ascii?Q?MMWPsf/ouDTa4QaYEdLNkYex0iQUd0Ioc8/uEsWR9CNMzugq5UrVR+/ghCYK?=
 =?us-ascii?Q?W5u6rlnwD98Ox/qry/RZAVxeaF4AFnP0mHg2dt5sXXPzxh9DIQJvpxlBgjcZ?=
 =?us-ascii?Q?kjnTLb4PXhfZXdCAjrVizm6myoMKDoWEAGp0IXIkwtWYPgszCOV89Iof2613?=
 =?us-ascii?Q?QKnUgNVEjV1naDw8QEr1aDrtrZRmSNLEwfXfettj2577Cmn8g7wDILaPpZdB?=
 =?us-ascii?Q?mhGhFk7v4iJzQNX6dmHzxY7HoMgUVIbL57p6XJiZaBS2CQ0rXrLvBELrWPsY?=
 =?us-ascii?Q?uDHpwH46DeUETytgIX906hNCN8pVGVaW72XlpM45g+7nb0fqbYWfAsBOuKp/?=
 =?us-ascii?Q?cb+h5r4I7djpfXKyxiAnisRp/DwggPBISwLosw7eOZEdB7jcmy3Yq5SYP/aC?=
 =?us-ascii?Q?e5fJEFy3PmQOrF0chp+ErKfgXGQeLxDgQnsv4H7ACiG3IZGWsA0CFsiYiqHk?=
 =?us-ascii?Q?PaXLtrzS/vdDEiI1YSQQsq5QYYPds9Vbn4wvXtNZtgIXv1pRN/A8DCVC2I/w?=
 =?us-ascii?Q?md48pGYeOcmB2IwCyAKfT8It2SRXHoLJcYQkoDQVx0ix2FOVGX8AlRzrRqCL?=
 =?us-ascii?Q?QrBc/DCMEaHPwXR1CnTeG4XD53q9RVzeOYMMQJTapTU2boWA59Nq6wjetvxj?=
 =?us-ascii?Q?efwH6oke1tQ5jtUdiAcFXWmzKgYSugvrTXCMdHVSpUE/0hgr6m2WjZ+8toEX?=
 =?us-ascii?Q?TitkV4FuzoRqJ9RQXZiUq2RLl/tWzqHGcf/yeiFve2J6/mc34f259KHOJyLv?=
 =?us-ascii?Q?WDdFba82D0SJJZGgR6KQel6+RkY/eOmlnmep41SpYDlbQV5LLsNl3r5y1eEo?=
 =?us-ascii?Q?idz84lCnKpWzp5culwm0mnV/BYdqGwdRZG8Th0QS8B951+N7ukzcFpJqXvet?=
 =?us-ascii?Q?LZJmY0xKlYkifUcVylYhBFzbGtuldxU6A8JJJ2i2cwDiR15eEaYwaaamJMXc?=
 =?us-ascii?Q?SiIbqE2RPUjNJqlvLx1KvHbGiZsjwXxc9vLqSNiRycwc0c5bX7g7ax9uGuDS?=
 =?us-ascii?Q?7IcxJbgMZM/qy+V/59Yf2nAzlrRR3R7pZWCq1ytzNQe7dFQS4kHt+Moy49J/?=
 =?us-ascii?Q?yJUNr9iVbklkkUlqkjB5vZJHdBYFt0tRro3WZdtuE92zbCOYqC8ooz6OUbPo?=
 =?us-ascii?Q?Dp0E472V9ddsz07oiuWbLFGVesCRzlX0lhm50poke/TLqs5KM6zQ0TQjWbyK?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lLbUnzwg74aH7UYtt4c7VQpiY0UFBXVjp8A+DL8/fWul4fZje6LfF+5JGDMaNfuZ1Vv/tMFcsGQiOEBZ9vEfPQfpH/IQ6nUVOH0QDQnsUeL7WgOhb5bTjPIplXnPbgSm6Ut6s5kIahXF1EpbrCm4z+MnSU1qDjpqbjQy8nxATPfgog81Gn7GyvmiE1SQbtnrTKTHAhwfqul42MPzy2goiaKRWoU+FKR7H+Dpura4ce/kZ5N+NW3HZlb3MjGg/c/I2tr9HQeXf3XDOHyyCCjOyu7O9zP4JBe+ZIqn63VYxxPkfkdAYuYeLH4lz3NaMtSGIAvd0kAUBkt+BEG5VELjIFm4op5svSoiX59dMFlIdmpY1/ivF3Fw9t+q91Cms2Bfc1udmWDfN79dAeICsZE8pxjEsipplc4L58TpN6QnkRggjE2gZDuwsao69Rdw1EO3PwdYH7Cu26uo+5TzZ7xsbiPnagE7DGcPKRW2bn0xdNlaYT2EgECIcBNgGmhHTjjSYki/z6vanuQw8OrWr+DIyPi4JTsyLoTrva9gOrk1NGbtWrZWADyiTrn7Af+WwQ4hQ/iBSAxArBqTOSr6Lb72DM60iat6IT2KNmCuQFKK3WY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6250a1a-0103-427d-e849-08ddad5e9395
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 05:19:47.1779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNJpOmz1udXIe5Mpvjy4uw+a0Z2hjvNOfXYCLdefcEt7zehfikgSGc0BGarss+MufDxCVbYmwNPybrV9UGE53GTQPhiOE4ypac5dWLYC38c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6361
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170040
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA0MSBTYWx0ZWRfX/E2E4KBhNTIv 2IMQHQLu+3SgAr48IS2OIlz+qw5h+ixVuWQqoRplAKWEvJJABfJvAowauOxsOafZLzBRLnpCcOW im4tFFKq/6f4qhNCc1QehJjeNcRDihlq0rl0PC/zcJy7eVu8yXUMUJPIigznre7FFaSvGY7UURi
 C447FprNYOkpGOHabwAYIIdrg8U+zIzGBeDHkcpU2a2/Ec4rDHUqn6VC9GPnHZXpMVfPoYO5EEi /E/u92uwrxWvZYJueZhuEdYa/nmZ2MMVraqThzwn8G+cCLLI5PngdkxD/giaydKuzNXobBDKyii nuu6I/3NHuezhD2eEpSyeB7cQ3ZKUB0wJj0IolwYwag+c+CDJDVUV9yDySeJKFbs6T3JOgB9EvG
 BXjmKV0KFbJKqfubEg3YIJMZktRZku+za8QYMwGwqHlsadyyaN6agqDkBUuMerbAe6B+wXnZ
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6850faf8 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=37rDS-QxAAAA:8 a=VwQbUJbxAAAA:8 a=NqGAiH6V0wYtjcPObpEA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22
 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13207
X-Proofpoint-GUID: 9xyEAoWko6jj41ZYUhJJn9Hd-hubNKLe
X-Proofpoint-ORIG-GUID: 9xyEAoWko6jj41ZYUhJJn9Hd-hubNKLe

On Mon, Jun 16, 2025 at 10:04:54PM +0100, Pedro Falcato wrote:
> (adding a few people on CC)
>
> On Mon, Jun 16, 2025 at 09:49:52PM +0100, Pedro Falcato wrote:
> > On Mon, Jun 16, 2025 at 09:35:03PM +0100, Lorenzo Stoakes wrote:
> > > msync and nommu are directly related to memory mapping, memfd and mincore
> > > are less so but are roughly speaking operating on virtual memory mappings
> > > from the point of view of the user so this seems the most appropriate place
> > > for them.
> > >
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > ---
> > >  MAINTAINERS | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 4523a6409186..a5d1ff923a62 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15735,7 +15735,6 @@ F:	Documentation/admin-guide/mm/
> > >  F:	Documentation/mm/
> > >  F:	include/linux/gfp.h
> > >  F:	include/linux/gfp_types.h
> > > -F:	include/linux/memfd.h
> > >  F:	include/linux/memory_hotplug.h
> > >  F:	include/linux/memory-tiers.h
> > >  F:	include/linux/mempolicy.h
> > > @@ -15974,12 +15973,17 @@ L:	linux-mm@kvack.org
> > >  S:	Maintained
> > >  W:	http://www.linux-mm.org
> > >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > +F:	include/linux/memfd.h
> > >  F:	include/trace/events/mmap.h
> > > +F:	mm/memfd.c
> >
> > memfd is a big stretch, no? I think it would feel more at home with shmem, or even VFS people.

Ack agreed, will move over to shmem.

> >
> > > +F:	mm/mincore.c
> > >  F:	mm/mlock.c
> > >  F:	mm/mmap.c
> > >  F:	mm/mprotect.c
> > >  F:	mm/mremap.c
> > >  F:	mm/mseal.c
> > > +F:	mm/msync.c
> > > +F:	mm/nommu.c
> > >  F:	mm/vma.c
> > >  F:	mm/vma.h
> > >  F:	mm/vma_exec.c
> >
> > the rest obviously LGTM.
> >
>
> This reminds me: now that we're at it, could we cross-own madvise.c? Now that
> we know it can be done. It's the only mmap-related syscall (i think?) we're
> missing.

This is already owned explicitly by MEMORY MAPPING - MADVISE (MEMORY ADVICE)

IT was separated out on purpose so David could have M without having to M
the rest.

>
> Also possibly mmap_lock.c.

This is explicitly separated out in to MEMORY MAPPING - LOCKING for similar
reasons.

>
> --
> Pedro
