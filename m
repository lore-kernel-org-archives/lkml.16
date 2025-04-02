Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EF6238D21
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594022; cv=fail; b=nzVyXxWK3auh6GrMwEIwdDU1nXvg1y5mRq95tZKfZnSCYFviDexaXvqSd3m8hW6gpsH0iple2VhZeR8SKd5hDfOOtR0kfLOjNhqGvmS0udyGR7ZDOnz1V2RaHHLYZKAGp4accmCuhcSrELsOlJPYX/x7qrO4rNb3ePmXaaBsUaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594022; c=relaxed/simple;
	bh=l4zjhX+lympT5DSoj2K4xlJqCHyeFkfNv6wxAEokEVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q0OGwzyO3VfyG+dO0G6c2+VmS1ZA0eh7Uus5FI03Z51KNtbR5iGqbOY7epV944f9cvLpLiT2xxvf2Q5HGbXAOrqLb0bP3tgSttRkQr4nTWTnupTgjE2MDerLF5ngWhELuRRbpp3yf3FIfst3gIiNZt5XVg0HBIuj6wr84XogD3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g5IuNkMX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R45xRt8q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g5IuNkMX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R45xRt8q"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326gIc7013589;
	Wed, 2 Apr 2025 11:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=k/5cNBDdH8khqcJ3bZ
	EfAKsgaxSj7KFP3YSKkwJNnSs=; b=g5IuNkMXhNgltussSgvTyUxSkxsS52mca9
	jNZnoPTF4jj2+dYPukYmBtYZ0bnoxtz9P430PAQLlL+2Aa2CQjBZYRcXGLqX1C69
	C9d3JaZL26cibTT9o9u0f/F+sFXXVYojfrUEhfv/JDXHaLyU0Nx5jRaRjXVdqGPz
	EK8AgjYyQ8aeLQ90iiv7acqU4Jewi3E8GldcculKz30gSC3mBZlsnzwUMIYHbW5Q
	HePGbuhrVhdlGcgVN+108yZaL8SSHf/x8a3ECuPl6l8K90kqaXHd1y0gYrUjLaXu
	W5Qt26XExleRyQN8oYHIZyWNk3vA/ii2z5yPDdbg9fplIJlDHU+w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p9dtj627-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:40:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532AXPXi003357;
	Wed, 2 Apr 2025 11:40:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aag771-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:40:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHHmWQJtBa1cBS0/MUMJNftGR9dxNGDyoXz3UNxr7rf2uOmJnw/WTno7lYtpnUGdM4ng1qmxV6sQIaKTCov/naQI86g5hw2p84sSpjsLsD2rg6jqE/AZRrU1fI5MCkZPcblpP1bEWqtw9vYmPtqt0i75d9P6EilMMv1uPfhNBjLSUn8RglQawbUK/TzoGrB9ceyOt6xMi/40mcg8E3WfT8qOnNJJp23QEns4OcL8t2qbyQn6b/exYLvFu/xl2bnJPQ76c6Jw3uiGePwqP1lPFCHeMX1MfPpXqX0nq4seh6OnYkV1i/4ikTbo7VllE/kNKoJuQmuCwW03qSzEBLrIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/5cNBDdH8khqcJ3bZEfAKsgaxSj7KFP3YSKkwJNnSs=;
 b=h6oEY/HMosL5uH5KE8uQ1aUz50OyY+VexDtDuYKkkS3k3yedE0UjHsL+jDkFLCcSshveDTH8/XuqCR3robUfyTj4nJhInG25DsE6ljquNPROTEPNVjCdCOPI8AFFa7qPCCeAyl9uXAZm9bBj4lWfhqcclNvYCFYNf+DZvrVW83tPES/hDeH1gMlxFrlBhE8MYm4kSHmOFm/KW1D2PZwqYnHbK+D13gkqIjvjhSHOjWj9N6vCR4I2lC3XjcT8Fdu/XmjNzLJJMbomF5ONTot3iuDs/e2bGq17mIIdx/umVNOpnvM4CS/FUwuAm3tbTCyPyfFoGOQHebLDnrVEZcOXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/5cNBDdH8khqcJ3bZEfAKsgaxSj7KFP3YSKkwJNnSs=;
 b=R45xRt8qhTgqe+PU1PgExt49UOmB4jnL7OksnqIFfW3ZQs2OCLxxPrFRWwsHAAd0tRB24wy+raN0j1Ud2A76RmOSbygEHBAyTG+YKE3cAXGhKq4usb1Mv45NWdo5wCB6/bJCLC6Gj28kmzfTOnPcYjdHraKhvpS8ILxsInx875M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB6654.namprd10.prod.outlook.com (2603:10b6:303:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 11:40:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 11:40:05 +0000
Date: Wed, 2 Apr 2025 12:40:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
        Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Liam Howlett <liam.howlett@oracle.com>,
        x86@kernel.org
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <687f1663-2b96-4b95-bdea-5f044c98b34a@lucifer.local>
References: <202503270941.IFILyNCX-lkp@intel.com>
 <9b3b3296-ab21-418b-a0ff-8f5248f9b4ec@lucifer.local>
 <b21bcd61-faf0-4ad8-b644-99794794594f@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b21bcd61-faf0-4ad8-b644-99794794594f@redhat.com>
X-ClientProxiedBy: LO2P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 40148970-5a8a-46ea-6ed5-08dd71db1ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jAIhqMSHAOnlFjttn3AbQQtazv2kE7eYGp/lfXKGw7PyZTd2r0ZBU4aUPh5j?=
 =?us-ascii?Q?P4idEpgQP9XO6swvftbk4XucA9EkzjXtrVZ5pT1pWxcAWmeHeJV73raUewT+?=
 =?us-ascii?Q?XzTDQK4VieuMBVdPfQlJK0WO40doKex/2tvI0rYhiK+zmM0gjMrr2rEoJN0U?=
 =?us-ascii?Q?CEZU8JujGsIw/yeV2wqEfGd5UEmnlbMzfLwZINCGaIOp6WqKR0dxWh35hxE+?=
 =?us-ascii?Q?ihhW80AWXkL9f6wQaRQMgAymVU/l6jkHoYqtFAoantdabgv325QcaIDQoZ9L?=
 =?us-ascii?Q?tUyVHzvBIicaQA2qSyiPcJQqgVfqLli3PQIupdPrnrQVktO/31KXZlDSWy2L?=
 =?us-ascii?Q?U7k1HMgvmD9eZpiINnZxfqEcJJ/wo8VJK8W0SD/FI0yGFtcXV/qj5AvBN05S?=
 =?us-ascii?Q?Sd1cOWvI6eXckpiFvaP42sZH0VYhbPg0YSbgKEsfLqkOPB8cJ941gC2Gg/6Y?=
 =?us-ascii?Q?EvAcLPYhsXXa5SYCkiDjTVN/aAKkfM2SczzkFgFs4LE3UkenYX0fp8GufBZ9?=
 =?us-ascii?Q?7QyJtMfcaaE9BIuKJ5lZjJEtWZj0Hk/dCmre8YomR39Peu8/o+JtyyMOD8Hm?=
 =?us-ascii?Q?05y7DY0JRU+zYsUsa8K4IYS3ClNvXvSS/2JOiWzRjPMdUZQNnhXzKQ9YwUqy?=
 =?us-ascii?Q?PgakkyTu7X0DKK2/HMY6B782JqkaitU7CmiEofRYs76GudAzp5jcO7gd/Pcb?=
 =?us-ascii?Q?V2bDjqR6Tdb9gi+c8iPqK9qc5eCzat4EZwXU9AvEiUOADhG3EqRze+aIhbIP?=
 =?us-ascii?Q?H6D92JV27IsCSCOG0phE3iKKmZaUucPVmVeQH4FTSUIOU2z82DlarqdN3ciQ?=
 =?us-ascii?Q?ruJZ6ep0zfq1q8tCWXqEDEM2r9Y3CAOQUK0EgCxK7Vu9XURVS2qiiv0WQSwX?=
 =?us-ascii?Q?3mOIxiUU7vXErUSLBVHb1/mKUQjex0tC1FOB1bMOJdhcltqtsVD9g69V+V/0?=
 =?us-ascii?Q?nhD06sPYIs4+7Rj5XlUO49/u2SX+v2W4XVuLwHtIz+xHDq0IIbrp7TBefMNX?=
 =?us-ascii?Q?UAHEfHUVEEBjpeZ4f1kLRUMzJ6OGl+NR93Wik0q0imNbvgBndkuW3r3c9ZAx?=
 =?us-ascii?Q?4NxW7YBlP0sylwvSbhCPxbHMul5+RU70hkzLedR4ft3dLSJdZSuAfFJKW2o8?=
 =?us-ascii?Q?MTMvMlSPfaMtcPfuwgMWn1cC37m+eojO2byqn8AQ0qtLH4ya85gQQ9KUfyxb?=
 =?us-ascii?Q?sCjYVY+SwoePKpqyC2HTFTrelniASpxjVNIYCRDDZz+wDEJOdGnUcIgPYI7Y?=
 =?us-ascii?Q?j/ZAXa3L880JtVI+bOH46L+3vdqMOQb70/uN8NjdS4mA4x/rF3hFau/L3QI5?=
 =?us-ascii?Q?iamshWh1RKvHF2O08ELXRmWQ2ecat+vbPlzbwsGuCqbZYg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IUnoBhbzUG9SoBh6frygqta4oAB1mhMLHAqJ7oBjEdvHEz6p7q8tFNgac59L?=
 =?us-ascii?Q?SpAVLrKg6Rfc6J5fFG+RjrpaMdAvTTe+HR8+OHbFPP44+wHra0MBJcvMXfme?=
 =?us-ascii?Q?hC1dzRJHTctcvo+Yf427V4TiXLcPobjF17MCDI4oA9Of1F5BqXLVeRgQaqDU?=
 =?us-ascii?Q?Tzqsyc6qNIEMXkfe9WxWyHZybzqI98LUiRN8TQ0nzn0qWZkHDe+N4BicSFoI?=
 =?us-ascii?Q?jrhoefUzkNwtC1aXF1UI1T8TIqJQzg/KObXW5A50DbcvmDsQFeB5p3g/UhF8?=
 =?us-ascii?Q?7xbKO4N3qPj7ljTa1Bk+nhXe+9mu3C0y2/zR9c+dEriCiqvQ6lwpH7bMyZZc?=
 =?us-ascii?Q?jvFA3wET/OqevyMRAXU7XctaZhXk8xWfkOPye33htheqEuKGpH+Hv1lE/LU3?=
 =?us-ascii?Q?ZOQxhgMDDwwHBT59bO7gpbmyvVCxCjXw+uxwIb5HTPQodEME4rHpsUjItoQh?=
 =?us-ascii?Q?mYEth0xmZLEkLfztKnmzrjuhqLf8tXBKuzSAUB0zaUOaFDeS6INZurWnU4ov?=
 =?us-ascii?Q?gpsAUrnlMhHo3SDMVa5EZn9wbbbi60e1cIRTEBIZ0cZ+Bt/ilqQVrZK7r23s?=
 =?us-ascii?Q?aeZ9OfLyc2LjTbMjiVdEOzAtCffodEJP3iHwUzLD/vGLhv1fE7b8bom9S5Rp?=
 =?us-ascii?Q?ERRlGINSk63SRd8myMHPO/BdhFLdqvGlVW/1v2zDY2FEQzFgIgxGkl6BoXc8?=
 =?us-ascii?Q?lN2eTiMMMlqmuF+sNozZHQmGAWVTH3PHsZH3Yc7EyrNcX+DMuCvmR+n3MA1n?=
 =?us-ascii?Q?R7voxIwohI0O72Ikta/Xs3kSySFwh5XTmH8ypKInVhAiLohw5ZcIdgdjTwmR?=
 =?us-ascii?Q?zRJyifse7AnMflviKygwjMuZrkdfIaX3ygb4uEVhWyOqH1aAMpx9Te4PVEFl?=
 =?us-ascii?Q?IY6V2px5pzI/jbD5YWiP8ykKTLtGe77i1/y72x83WpZYaTMaia9DdJ5lE9gR?=
 =?us-ascii?Q?VHqOtzjecch+WgPqxdkTFM4yU5/kNmSfbhq/+tw3Kz7oIOBjPrboRp0c27Zu?=
 =?us-ascii?Q?fjDeQb8VIxuQ1yuZAf9KeH9hXhzAjDjvyreyHc+tINvCaeLuXBsOlgquQC1g?=
 =?us-ascii?Q?UxOrPMzr4/f4wFqg7oDnAqwbcpe+Z3UsOekVVoO+DSrfR0wx3lClJamq57Z8?=
 =?us-ascii?Q?00OCgsx+/LkIZ4MGq788FN7QdYjHwrrMIAzD3c0DhROvQuRgTmFAr29q8tML?=
 =?us-ascii?Q?Vk/gLaQz88tNo6ePpv8ocCXvrLwrVPR7v+dAlrMmZjIrCQ375j9W4THJWY7L?=
 =?us-ascii?Q?TGFPjFEgHpMt8igIJ+qVHpU8bH1N8zt63on5stBA3J754Fm0+X63j1YsIaeb?=
 =?us-ascii?Q?OWn0U2Q/sPVei+KsgHSd1aof0eB+rroVcG3hi0+Lpq8mllab992jS1THyilm?=
 =?us-ascii?Q?q41vcAXgRnMDBuBYBxziy2NJmMHe89wKyafdPfNoCxFXQ8xEVji31cYIcTOn?=
 =?us-ascii?Q?JMm+xkgpb4s62VLvpc/ojKRNoCUuOyuwIRw9X3mGJePIXruPovH5mxhNkWrP?=
 =?us-ascii?Q?p4eGRkluOj8tuYNxh+MXgs+NpsvbuswUpGhhM7ctLw7STqEjF9dVZbGMnxzV?=
 =?us-ascii?Q?D0p4i9mQbC6ROHlrBUNwPhDeMT33d43amqdA+W1+YYHZjysg9EXpxIvNq4Tw?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2a1yQL0HKMnZGmARIyY8FG5KvmJWY+vsB4oTRQz3IRfvoYPtwwllJAJtDwjwQGlfo6EI4fU47HTYlc+A2wjykXRKR5p6vna/NAiz/lwgY4fYwM9kdSHbx3xSu9QMyWOd+wRLmyBZ2/mMQMeKYuMGSX2Em9rXn/mISIA17sxtTY6P59dEvKDs4bfw/D0SUurNTby9n4PiZfw6dFeNEn3AzCG9GW/TWythY8Y/CJ2V/6z18yHR3+EWyash7mV767upFe9S75ZnFUB/FSW9VdcKwv0X4lBhd3MF/t/eOIdamoWhVO0j91l4rMAyxMYrvpoR+TspgZ5Z4C3wfHUcqZyPK46aqYhu+8DJ1Stu+IzZkTN7fRxbLbx7wBm4xsUtqlIz/c23Q83izY/DamoBaKtcoNRn5uFJN5kjazvVeJ7OzB4KVm4+GYxfoqQhLaLuOGY7hdx0PGueDvO0DISVtxSThwVHnpEX0SIpBznNRVTWyeTJP9M/LM/m8CZUK9FN9h+dxGSmUJAQmdiQyzsryvuDv5ytO9vaZAEYHPrbVdJjmqmhsZqGbeG66QiyyPpJhgoCYVXwRGenVMPgrad6q3oy3DxrdBOZ+30M1LLozgkFMmo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40148970-5a8a-46ea-6ed5-08dd71db1ca5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:40:05.0541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsaoDxpwBKZNxOGKglIEOafZ8z7TzcqenY7w3oX0MR6l3Xth6TdO9Vjo89tADftanNvHzrir95APG4rQc0CFvfaP+E9F4zOjZemkYIaVEb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6654
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020073
X-Proofpoint-ORIG-GUID: 5dZ7foPUzycNApUEn9CI4NU6AN_xCOZD
X-Proofpoint-GUID: 5dZ7foPUzycNApUEn9CI4NU6AN_xCOZD

Let me try that again as my mail client went crazy...

Actually let me +cc a few more so this isn't lost further :P

On Wed, Apr 02, 2025 at 01:32:52PM +0200, David Hildenbrand wrote:
> On 02.04.25 13:19, Lorenzo Stoakes wrote:
> > On Thu, Mar 27, 2025 at 09:59:02AM +0800, kernel test robot wrote:
> > > BCC: lkp@intel.com
> > > CC: oe-kbuild-all@lists.linux.dev
> > > In-Reply-To: <20250325191951.471185-1-david@redhat.com>
> > > References: <20250325191951.471185-1-david@redhat.com>
> > > TO: David Hildenbrand <david@redhat.com>
> > >
> > > Hi David,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/x86-mm-pat-Fix-VM_PAT-handling-when-fork-fails-in-copy_page_range/20250326-032200
> > > base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
> > > patch link:    https://lore.kernel.org/r/20250325191951.471185-1-david%40redhat.com
> > > patch subject: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
> > > :::::: branch date: 31 hours ago
> > > :::::: commit date: 31 hours ago
> > > config: hexagon-randconfig-r073-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270941.IFILyNCX-lkp@intel.com/config)
> > > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > | Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
> > >
> > > smatch warnings:
> > > mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
>
> Huh,
>
> how did the original report not make it into my inbox ? :/

Yeah it's odd... maybe broken script?

>
> Thanks for replying Lorenzo!

NP!

>
> >
> > I have a feeling this is because if ndef __HAVE_PFNMAP_TRACKING you just
> > don't touch pfn at all, but also I see in the new track_pfn_copy() there
> > are code paths where pfn doesn't get set, but you still pass the
> > uninitialised pfn to untrack_pfn_copy()...
>
> If track_pfn_copy() returns 0 and VM_PAT applies, the pfn is set. Otherwise
> (returns an error), we immediately return from copy_page_range().
>
> So once we reach untrack_pfn_copy() ... the PFN was set.
>
> In case of !__HAVE_PFNMAP_TRACKING the pfn is not set and not used.
>
> >
> > I mean it could also be in the case of !(src_vma->vm_flags & VM_PAT) (but &
> > VM_PFNMAP), where we return 0 but still pass pfn to untrack_pfn_copy()...
>
> I assume that's what it is complaining about, and it doesn't figure out that
> the parameter is unused.
>
> So likely it's best to just initialize pfn to 0.
>
> >
> > This is all super icky, we probably want to actually have track_pfn_copy()
> > indicate whether we want to later untrack, not only if there's an error.
>
> Sounds overly-complicated. But having a pfn != 0 might work.
>
> > > Will comment accordingly on patch, but I mean I don't like the idea of
> us
> > just initialising the pfn here, because... what to?... :)

Sure, I mean for all of above let's have the debate on the main patch I guess so
it's in one place...

> Stared at that code for too long (and I reached a point where the PAT stuff
> absolutely annoys me).

But, also lol. Can. Relate.

>
> Thanks!
>
> --
> Cheers,
>
> David / dhildenb
>

Cheers, Lorenzo
