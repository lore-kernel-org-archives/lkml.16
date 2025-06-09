Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EFD38DF9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749497431; cv=fail; b=Ikyn3hujDbOqkNnt78G6e11D0HRp+8oqduLUfFhmzGdTIJST6zyz1uVjxCLWLJDtXyr7jbonbXM5NjUwTk5qFgISxvjGWUOOyTGHZsJ4tcZAXSlu5/kX8er2jQwj/sJojAw8VPuktB2ynXe14EGRPML9IMA8JzLeBGonl8Om5QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749497431; c=relaxed/simple;
	bh=CoqAgjeLmpWuYnDS9ctZ/t08F27vyRJSPYD9B3rLTZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WnD/MpVhj0Zv2jIT+sr9HN900xAxUtSpSibGC5zvWRrvEKHaG3ne2tz6X1eSqQyfRzAYYC75juljgH/BIwCFyiUEwZQHoHY8wAX0HJhLtvujcFsZMzSus8HSMDLjIeeeSfivH4FL0cbRIW6EsTf+jdNyNh3eHSWS+nGC9EUSbR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p5wv6BgK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ltgRvZlT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p5wv6BgK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ltgRvZlT"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559FSfJq004042;
	Mon, 9 Jun 2025 19:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=CoqAgjeLmpWuYnDS9ctZ/t08F27vyRJSPYD9B3rLTZA=; b=
	p5wv6BgK1nQa8qBN3rpWUQ0FxQWWlsLV2h/1dxS8iFR2g9gu617y1dbT8ep4XT9h
	jVqf1x3FmArhjKAxOaM0FmH4gP9g0HV6wkyZbpEYXhSoGYAEWCIeja0Lp0F/fZnR
	ZM11nHvAfMSsipv02ATwU8TMHsYEgUYJWJI2WVKNGFAB471usu3/P3+ieJ1sopp8
	QgRJ1oD+U7+pWeT6honLsaKJqC5jGBWPghuL/+oleWFwcDHhRYH1Mz1Dui2RmH7o
	V3izTk8LYryYBbC54vzT/0lVrm3TcYC9swA+ERZ8b98LOV+2y+dKmAt+0y9WCZjm
	+L9jQ8QYOPYhGOwalWxOMw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywttbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 19:30:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559Hk8Q8011797;
	Mon, 9 Jun 2025 19:30:10 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8tseh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 19:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4eet3KDTmpuTtnnxpJSlmYxREbDZ8kv2Cfd2dNY7by1kADsiMy3YICH52qXEtB1oBquSvv9k1b61Hg492dc6VzVK+Fy89sYjovrvIMDGs6txzvSNPt2W/Hk4pXbfpXLaQvpYvja2K2MgDG5u2nDkvEbFNS2oIFyonAZAtHv06S1x1jR1pAXOYtMBMeu3CUtcCnYbXXOLE3raSFjtJX1a82FPtHUsLNdzbDGRbjJSqAAcN2Xm2jM/mhxMN/LMBBVn237/6gLEJjxIVWWYNkfBeU/nyF2RlsqYfSfObl5msg0C1z3vaeZBLLKk8obnTeuaK23H2LychbjgBaJK5bSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoqAgjeLmpWuYnDS9ctZ/t08F27vyRJSPYD9B3rLTZA=;
 b=f8UP11o6DzEG9UtDQhlhkhnIYGIrbNq4gN9A1UPUIkI9BsfouRNnez+sjakmp7WEhwBKNsvzo4Lkprw0WxyBdKNqLRoTxVnE0lDrh1VlJN/WVwRu8VjBhWqEBDuTpPdZtDuu4Xe9J9iatyHNjoWbC1Rx7ShBQ8bdqd28xcZp7O61vu5UD1utO9a/h518NBWzLqzFbH4th4ep6NdxBuiY1PQqfHGkvnyMOM43UiSQUZkfBPDt/fvteTlmAb8yn3MlssjU3OWSZ9hvTbrShIi561OM9ZG/oJn2C+1SeELPdEDbNtC0cWMCYJULuBfSx3f2OmdMuNxNyQa2WBRFmHn5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoqAgjeLmpWuYnDS9ctZ/t08F27vyRJSPYD9B3rLTZA=;
 b=ltgRvZlTzijf1iJMDDzE+XWs1DekxojU0d61tzuYn9oL2p+n/lGLTUNtw80gWBl8ytAFi/fwpIPKrR2kMxB2Kzr70MvTEy4i1nZrv1SHL9hA9x1+1wWyx/c5DeALqsAZUBJdrtnicjZOWRgJkB6i1/sjW3laJFfk8ktBoTcpKlo=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by CY8PR10MB7316.namprd10.prod.outlook.com (2603:10b6:930:7a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 19:30:07 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 19:30:07 +0000
Date: Mon, 9 Jun 2025 20:30:05 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: shmem: disallow hugepages if the system-wide
 shmem THP sysfs settings are disabled
Message-ID: <ee68b942-492f-4ab9-9341-cd70460812b9@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <39d7617a6142c6091f233357171c5793e0992d36.1749109709.git.baolin.wang@linux.alibaba.com>
 <b6ae32e5-60e0-44dd-a1e8-37c162d04ed3@lucifer.local>
 <b455db10-f129-4603-a087-43a1b52ff09c@lucifer.local>
 <aa6aa559-431e-43c0-bd24-828e6558bac3@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6aa559-431e-43c0-bd24-828e6558bac3@linux.alibaba.com>
X-ClientProxiedBy: LO2P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::18) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|CY8PR10MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0f2ee3-cf63-4022-5e33-08dda78c0aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDVEeWxFTFVFRzBoVTl2c0FTcDlTbUFDTnNxTVZEOFRMTUlRWjVBbVREVjJK?=
 =?utf-8?B?THQ0RTdKbGxlMUJmb1JBR1M5RHFYU2RVdXY4cG15ZGhtU0kyazdFd2pEbUJa?=
 =?utf-8?B?K2NQOHRoYVpyL1NTMjJ2Ympnd0Nkei9wVW84bzA1MzY3MjQyeXcrRGVaQmts?=
 =?utf-8?B?T21sTldVSHlhMTRHQ3VncW8zRFd0QlNSRUZGTGp2MjcvVnhHZTFVd1JXcGtr?=
 =?utf-8?B?UlRtSlBvTkt5VkFrd3RSalV1MFkrWnZWVTBYNVQwSjEwaFZKa0wvNkV3cEdZ?=
 =?utf-8?B?Ym9RZDR6MnVBLzJUc2l5Y3pibmJuemJSSHJMa1ZHemdVOWJTVnlPRkhORW4y?=
 =?utf-8?B?cWZ5YitzMmxhMmtpVWtmQmhNVk1oWGNkekRYZkV3VXhBSjkwcjBEbjIwaUI1?=
 =?utf-8?B?cDVOZ3lERWR4dEdrcHRsOUpYaG41Vk5URHd6U3FsR3Q4SHYwYnpEVmNOTHRw?=
 =?utf-8?B?dlR6Tnh5RDlzdDJOTTUrbHpqeHl4d010cmh3TE90SVpWOUJtR2FmMUlTS2tW?=
 =?utf-8?B?bmptbzB3MWxBNm92VTZxMkVJTTBVWVZ5VWxiZ1R4TzI2WE9oWTF3b0xVcHQ3?=
 =?utf-8?B?MHl3aVZrYkh3bEJBWlZoYVhFTitwSElHVFlRUHZpK0tzbW1DWUtScU53ai9Z?=
 =?utf-8?B?UWlhMU95TWtoRXV1RDF0QWxYSWlTQzd5SHo0UXI4ZEJDaEpseGRjOFhxS256?=
 =?utf-8?B?OEhUcUl0TGVZL2lrTHg2ZHBYNy94QnBiN1VnUFVDVlcyVElUaHorT3RBc0xh?=
 =?utf-8?B?eXA5bERoSG1sQmdQN2FxREJieHFkV0dyS0JVbThOYk5Da0tDTURTNU8vZlAy?=
 =?utf-8?B?dXZnM0Y5czljd0xiWnE3VkZRUm9QblhsYUFKQk5xalFMK0wrZWI4U00xZUpk?=
 =?utf-8?B?ei9CSFArdkRuY1g0SXloRzk2aW9pTHp0djMwMUt4dFBUbVgwSlpSWElHdWZu?=
 =?utf-8?B?WkIzbWpzODNHN1VIWVVXbkJuQTZDWUdMMmIzT3dTT2h5YUdKVmdacm92MWx4?=
 =?utf-8?B?UnBCVDMzS3pVZSttRUZselN5eTh0ZnBZTVo0TXY2TWxBWU1HZXd4U2ttb3I3?=
 =?utf-8?B?R1NTTUlMQTdZM0hncEthNHkzR1FScWZmRmcyR0p6VFhzb1lJdjdWamYxa2tT?=
 =?utf-8?B?aDJzbDdGRHowbFBxVmZSUGxyOEUwQ0lSVWhlZkdyaWRNY1JDUGVPb0ZaSE5n?=
 =?utf-8?B?ak01MUdEaVl1RFJKQ3hhaCtUVmh2bS9RVFYyS0hPV1Z6cGFCOUF0UHhzMk80?=
 =?utf-8?B?SHdIblU4cEE4OUdGS0g1T0MwZDFvUndoTXF0Z1BvRG5qL1ZDUVR6N05xd0Nh?=
 =?utf-8?B?TGRpd0hDcTZYcjBOUk9tZmFrcGZYWnJvd1Fpa29UUU82c0JFWVdVSlhNNHY4?=
 =?utf-8?B?WUdVUFEyM1VhVmJBc0lsSHdVdzc4K0FDczFkK2J3NVlDaXduY3R5VUhIeWhV?=
 =?utf-8?B?OFQ5UzlUUndjcVN5VXBUVkpsZk5FYnNzSUc2VEhjZ3FZajlpSE1saVdRNVp3?=
 =?utf-8?B?cUs5dHczdHVneS9laExnSmhBdlhZaGp1d0hOZ3FPMXVyYlRYYVV6c3h5SkJJ?=
 =?utf-8?B?L1dYVXltTERhVTRSS2E0YmppK1BiRXZXUGt1dE1RaGdJNjJrbUNzMzhDUVkv?=
 =?utf-8?B?d2dLTThKazFqbTZQellvQ2dvMVRnTGdxeTJTL0hHOGd1YUV6QVNpQWwwc0U1?=
 =?utf-8?B?TVZKa2kzWXNxMy9EVXNURUltd0pmSnJQNUJkYm95NHVwSnpmUXAzYkNuSG5Y?=
 =?utf-8?B?dk9tY2VXNXZ3OGdiQWVvOVZjSWZpbjZaMTlQR3U3NlQ2ellaVzNlSS9uV2d3?=
 =?utf-8?B?RGpNM3dueWp0K2dNMzkvRWl6amZueWlxc3VHb01kd3lKQ3hDY3puQkNDNzJG?=
 =?utf-8?B?dVQ4YytjSUdHam1ZeWQxZHBiMkMzdWNHbzMrTDhEVkVUcUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkRyVXhLU3JrbldUZkZhN3llN0E0NDZtOWFkQk0xdC85SVRzUmRhS1J4Yytw?=
 =?utf-8?B?Umg3NXpMRHhzTjVmci9vWGhxSWdhTDZubTlhUDZleEhqTnB4YlhYckRmU1Nh?=
 =?utf-8?B?RFFFY0ZpWTJJcVh0Uzk4SSs2NHVaNVNxMk8yR2oxVDczMzcxbENjbEtBM3Qy?=
 =?utf-8?B?aCtFbFJKYnlwaTdIckVsL3dTVHp1ZzlLNGR0T1NiVUU4a1RzYUNSNlhDTHJh?=
 =?utf-8?B?Q29vQVd2RmJJWDBjeFI0ZXd1RmFPNmp5QzZpQkFRVEtLSklRamlWL3A0bk04?=
 =?utf-8?B?bFh5dFFXNUZMK1VLSnZxVjc2THBVaWtnVkl3aU9mU3FyWjlGSmxBbnNMSkov?=
 =?utf-8?B?M1RzYXN2c0JHc2xmaEJCaUJFM0JUcEVzWGk2ZWZEalJVRGJ5YWxnWEtyVTAv?=
 =?utf-8?B?TU5uMks3ZHBCZ0VkNVFuOEMxRWJwWDR3NVhweUwwMVlIVTdIQ0xKUzRRN1R1?=
 =?utf-8?B?MDZHZU8rU1pUMFI1NEhxejhXTmxRcE5RMWFDVTBwaWNSK2VSbjhZeUJLekZ2?=
 =?utf-8?B?Sk1VcXNNdTZJeUxQOThyMmZZVjhrZXVUMEM0NXc0aXF1aDJVck1BUDNuSERo?=
 =?utf-8?B?QTEwNkdacFFWenZYamJuRitZTlAwdUI1MDFtY2YxR0t2aUNoY1hPOXE4bDkr?=
 =?utf-8?B?VHRRdkViWVFPNlBBcnY1YXN4MEYxaUVaTmwwU1R4WFhqdE1KNTJwVkdtdTUz?=
 =?utf-8?B?Y3Jwc1ZkR3kwRUg4b25Tby91c1RxeUMrUURBTG90aXlkRGVhemZuc08vS2Rk?=
 =?utf-8?B?R0lJOHhnTENXeE5EdXR6cmZYbWNyRndIV3VoVUVuVXczbiswVFlFSThKbyt5?=
 =?utf-8?B?K1A1R2pjZVZ5OHBjZHJBZ2Nuby9Eem5oQm9SYy93QWlLb3RkTHFSKzI0ZnIw?=
 =?utf-8?B?UkowUWh1Z3pvUS91Z3lWZ3JOWUxCdGZob0JOeTBKMTV6VzMzblAxSW1jczRQ?=
 =?utf-8?B?cGl1eXQ4T2NESHJYLzU3bitJNlkrTTZxUC9RaGsrRDR4TVJNVThuaER1elJv?=
 =?utf-8?B?RElRTFBCdXJyc2swTTE3a25uOW1WWUlGbjdMZmhMREVSa0FrM29JV0FmRzRx?=
 =?utf-8?B?TXdpRU13VWw0akdHNGd0WkhDRFVOZUFrY3BmZ3RhWldGNzRrdnJVY0R4TVda?=
 =?utf-8?B?S0dGYXNRVnh4SVZBS1JubDEzeTlzUkM3MUFndG9PWlZMakkzZ2dKUGMxK2dR?=
 =?utf-8?B?UzQyMFM4SkZIeTRkbk9ZV3JQVG5JTXNiejJiUk9qN0FHeldIUnJpSFdSZ0FX?=
 =?utf-8?B?YWUwREMxSENWamc3Sit6bXAveDJZRUVXZE52WjJDdVVCYXFtSHVxZmlrc3Np?=
 =?utf-8?B?elJyR0gyUE9GRnZiY05WTU9IMGhtTHI2OGQ5U2R0dUlveVFucVgwbWZIVTNX?=
 =?utf-8?B?L3J2VUdXN0RxR3V6bzBMb1Z3b2V1elBqQXRxR29ySzE4Yk5lWEpaNmJJODlV?=
 =?utf-8?B?VFBVdVMwT2hObHhCRGg1cDRxSzlDVmZ3Tm9JK1pLa1BnRFVlcmpZRDhVVU1s?=
 =?utf-8?B?c3RMQUZqdDJvaEN0OCtWeFRNUzZiVU1pdkxpaTEweWJzd2I3ajNyNEY0azJv?=
 =?utf-8?B?Y3ZEWWpIc2dRYnMwQzA4U1ByYWs0SnI2UUlHaXNsNGNKZmNBVWduWWIvMEha?=
 =?utf-8?B?aGI5Sko1NldoVVkwS1ZCa2pObnBhS1VpS1BlZFBjTXRINEdYTWFsdjFjajlV?=
 =?utf-8?B?Z2ZTc1BYMHNmN2twYSs3VFJnR1VUeUR6Z1dtd1JqZ3FVYVZMYTJSYUc0eXBv?=
 =?utf-8?B?QVlpWXkwTjA5NU1KRkZsL1kyaDBIREwwc2U3ZElNM3NJSnlydVArcUhSbUUx?=
 =?utf-8?B?bHFzRHdGWk9GcTFvd1ludmRJVTkyMEd0bUJ5OGFDU0xNUjJoTHo1YmFiN0RT?=
 =?utf-8?B?S3RVcUt6OFdsaGpPdStSZmxCT1o2VmdRQUVXemZ6TklucDdBWkxzR3VQamww?=
 =?utf-8?B?eWI0RHdWdjJTSjYwbmllemMvZ1FFOXBjWXlHMTNKWnB0M29KL1haM1B1V1Jx?=
 =?utf-8?B?dzVjOGQxMFJoR0ZmSnVwY1IzM1o0aE94a1NOQXFDNTMvNEpoc0RLTW1PT2xo?=
 =?utf-8?B?eWM0UENCOXJWdVZkNE1zQVFFYkgwOHVjcGlPdy94S0hPN2crMmVLcitYNjB5?=
 =?utf-8?B?OCsrZzBDMyt0QnFGVStGenlOK1VJRGxxcVNaSUo1Qm0xdVVBTmtHa3Q4TEhX?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BW1x46OYziL/j6yBaFsuCb5gOmhsCKoHigEZ9W+ioWgzaWyiJkvjKIKOJ4qEDDdSEkPK4StQBO2sBdje7VKhEtBnNMEsdvtzDyQwHoC3STYsYY6ZyesblxEcZa14cr1v+ZSDm8vwVGEKQ22u4dEWuA20boLFreAe5w6ypM+MXDYB8FvCknBaJZOJTvSpj/XtMWb7Gj2MnaHClSeOGVRkp8630xUvThZ5Iu0K9mPq8JyjKT/Qm9g0bVv98Q/pPmr/CzM7WcWl5gBqLDNhBYDYGo6BSdrYaAXwXTnNkFqezcKJMR+o2WlFoPoeNwYAbqMSLQyA0KVadkJvEVZYJHu5v6dm5VbX3FXIyqc1ZD6j0zEKJe84oAkAtPJvvR3kpS3+YeqxvNBkOgBzk0RjlTRrcQaV4FzgtZdlZeVCEmNfoYtOIJUx77kwzAcod3vOFCMmum+eWDEX0recqypB4jzFlWl6ECQeDQpqXpXchWgTJyoRajnX9hOICk4jRMOuS/Zn2uO3wBQ7i4F5+hnJgq40QccVdf8037tmaCQCjPvuaQ5TsVRvVCILdtoA0ODd1LIOfq2szTrP1KhJPRa5aN5bVmiZE3srCIFIJ+838n97+8s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0f2ee3-cf63-4022-5e33-08dda78c0aa5
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 19:30:07.3640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY5OFvYSAd6K6/HR6xgnNojjA1UuOL44nKz5RL8V/YdqMBRZQfFMnhUK19x3gUgkHVB3N49GErL+HWEcZ1xKR9MAScL5fc8ysXkMLUvtZg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7316
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_08,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=803 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090148
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=68473643 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=iKf_-czaNULld-bL3m8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FY6ekjkYutfLkUf355rgQ4a4unPfpWwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0OCBTYWx0ZWRfX4L03fzxYp4Fp jnmuLO6wLS1F2lB9HptOTOmmLkMga50eN7UaAOjDBhqJSh2fr4wuLYhkmDdv6gZb3Jfo9kYIInz /xcflUnLIzAKGBbu8WzUGjKtzLlIA9qgzj3HuL87ZcFs/HFT8uK5s5+yJ/Er7R7dLn8jFo04Nds
 Mle94j0r97KZTy3rFi7i4172XPyXsLMOFxQW90aVGYas5bSR9C4b48wvmtcpI1OcIrBDzjpDGGb KsXZYK1V7pTKg/QcJWqXCe966ngnxuCQ0AslYUwu8fdqFvCnYa0CmkQh/sKb2okbRIxdckGsCIq iRaHT8RDHYBu7nVKIE6Q96QiZF1tGz43r2X4L3KQ3EAQj0j1yuRT/8/MucGmB6YUOkLQRlgBmrb
 k8E5DO1QpvoJQcEySrnjX8EG5qU2bjAkHGFeKnR/CupZuQRgTQ5Yv/TlrOodtq6tZn91Y+/w
X-Proofpoint-GUID: FY6ekjkYutfLkUf355rgQ4a4unPfpWwt

On Mon, Jun 09, 2025 at 02:34:22PM +0800, Baolin Wang wrote:
>
>
> On 2025/6/7 20:17, Lorenzo Stoakes wrote:
> > On Sat, Jun 07, 2025 at 01:14:41PM +0100, Lorenzo Stoakes wrote:
> > > On Thu, Jun 05, 2025 at 04:00:59PM +0800, Baolin Wang wrote:
> > [snip]
> > > >
> > > > Another rule for madvise, referring to David's suggestion: “allowing for collapsing
> > > > in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
> > >
> > > Hm I'm not sure if this is enforced is it? I may have missed something here
> > > however.
> >
> > Oh right actually I think it is implicitly - if TVA_ENFORCE_SYSFS is not
> > specified in tva_flags, then we don't bother applying an madvise filter at all
> > anyway, and we account for that in our 'enabled' check in
> > thp_vma_allowable_orders().
> >
> > But I don't think this patch changes anything, I actually _think_ we can just
> > drop this one.
>
> See my previous replies. Shmem mTHP sysfs settings are different from
> Anonymous pages.

Yeah sorry you're right, responded elsewhere in thread.

>
> Thanks for reviewing.

You're welcome!
