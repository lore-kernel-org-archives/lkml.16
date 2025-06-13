Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE61E871
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832082; cv=fail; b=NQnWXj+MQzri5tFd7QK2PZmznfuaMoSEik6LtJlD0j2GW76tQ/pDJLNtocARXDU8uSWmeKDvZIUTiG1pHsG9tNCYdJCFaalWbdzCxUT0UjBiJ0iLSUUcMFSOpooYvM0jbN8GABHly7pJA209oOItf+NbGdbTKWzp2pmm+4to1o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832082; c=relaxed/simple;
	bh=8GC9bXdnnh80fkFk9OTl4AzvuMdOEQrRbnrxgSTxtiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g+7J5WWxJF4mu+A6slXdgFITfazWe3zWMzE+yoQtn7SEUbUuYZSehCE0ojWfpMoDwKJmu/Sve9Bwonjg1Ao8DQxs0lVZzNOr7GUHPywq8ndMyIzOqTPfECTf3PgMk7gkwwE5LXnqmegQK1PPS5vyWEzOQaTwNP25yxnNh9eApE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R1q9Rq9M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LqxSVPCP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R1q9Rq9M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LqxSVPCP"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtc7E007761;
	Fri, 13 Jun 2025 16:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vPAlVpH3s6bnWO+RY6
	hr/HQckZY4sredW4DBZA+FfhQ=; b=R1q9Rq9MCTKrxRFvCQimJt4oz4P9CUprMa
	KZL0s6ZET3oTpxc23KiD0hikzOxAvMi0psVqOK1Xf8Exm88Wea1OZ0TmfEO/x+M/
	DS5zdzqTRfTOgiUQmL9ihuYPXjbz6AB18HkzlV2PcqNqIrMmw9XcV6jv7NxTStp5
	N7JsNSTf2EDa9hHX/Z8skUk8mhftvSBv+rzhBvN6Wn/yMMMdo/Kzo4ZadA6OJOyh
	92MjKxflh2uNLvPomAL7fiYFewKXIpRhlApVF0i9g2Qx8NCVLZfbsklxAcm8MSKP
	t14ANxRSGYOI0ilcrDO+Z1LsWZAeq3nabO2mv1Va86qyAmv3UsvQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dyx40a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 16:27:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEvInC031858;
	Fri, 13 Jun 2025 16:27:37 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012030.outbound.protection.outlook.com [40.93.195.30])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvd3nyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 16:27:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1x4nmY5fEreHm4XTWLIdf4x4QDC17JenkH8+EBkAaZgXpZDGcltdPo4CVl5c0NwaEXSleaNCbbseA3kspWtba5OMx+FAC6fjTsCV+3e+TQNkgFMeed9t2drA3rgVmqOMs637PLkqBU846Nyv1jt78gSyBO1z89oN/YZmItViZRX8Y3JG/tSL0xQABOpen7lEcRpg89y+pLTqiFEdRQ+d88Z3KxFYXv81J2X2ecSZkyogKuyGJvpyYepurqGAFJbM78CPQbNJyIrzC+Q90nITbY0kqwjsdvLGyJ31uiqfeJt89Dac0oxILRbR0GpZ3mz27PILUnReM53fJsUfBRRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPAlVpH3s6bnWO+RY6hr/HQckZY4sredW4DBZA+FfhQ=;
 b=qmAOOfpnEXiq5ATaF95ynwn5tlDcyjcJ51GlGyZd2YC1YwxyH/1q9HbH2Z3KZRmv6zVoQHMLw0+bp9taG6EAPW/HxSCe5Oyb6CDyO85Bz1iAfVKS8AOZWJgq3O9bU5McnIj7A/jgKYH+4Ds0ARBmc1tj7ntj6cayMO5mYj3yCjKam/3MJh1K8qRXGSoG17vjxbFZuJrOmPVBGLpKb1dRAyQgVge7aCSIkTHRHvbnTTZiRL9jWKGtvuEa3DsNARC59mRGeUrQg3SDCf2LN8A3jzTwsV8nzIlqC+PHepWayopvxnKfu5JwY8IpEKk2zhKmSHaPwMRxeYps79tQ6Apv0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPAlVpH3s6bnWO+RY6hr/HQckZY4sredW4DBZA+FfhQ=;
 b=LqxSVPCPIjrYAFtZWGJamlJosr6RELGmMuctBEV06FZkJEHmeZ3weyrf4vV6d0nAATG4Bu4mOJsXoce2MYB4PZiRb5kZNyabtxY4NWkt1EcNZ5UAFwpkk+SzSyF/RO9r/bgYSsR701sEKORBfxFT2ND94UIFkulw9cxOSYmQZ9M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB6734.namprd10.prod.outlook.com (2603:10b6:208:42e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Fri, 13 Jun
 2025 16:27:31 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 16:27:29 +0000
Date: Fri, 13 Jun 2025 17:27:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
        will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
        ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change
 memory permissions
Message-ID: <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134352.65994-2-dev.jain@arm.com>
X-ClientProxiedBy: LO6P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0c7162-4b99-40f2-0136-08ddaa9730fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YPie35ObFubyNiAhG4x3gHs37f1VSBYBkSZ52twOau4xKIUfStpV737kqkgp?=
 =?us-ascii?Q?tYMdn4T9R4QtNoskHyCoVZ05ao/dX5TH8wA7QGfzWViyOTqiLpRU3xy4LhFg?=
 =?us-ascii?Q?7eIVymKCvcI8G1Kzyj0XJ9QcKcjN7qfRSUEdLijyU0XeWEPtFLie0S2aJxY3?=
 =?us-ascii?Q?64qEmlNMlMLubNz0Fif6vTsDlPBfcRKjpU1DZ8J6gGicniesPCqWITOBO6l3?=
 =?us-ascii?Q?nCYRddrauEOSZM1DCbAJMmH0Q/bN2MFCZUjJWiF0F5/1MB2u0lrD2Y6qmNnZ?=
 =?us-ascii?Q?BjPikPvSwVKGDa7/vJSFah2ALkVSF/JEfYbfCkQb0aV6QwBRWYUzujYeKQHP?=
 =?us-ascii?Q?CxeqfEZIb1qEtVIecjy1Vralv1eGUiJOzj18JfGU3vgmDo+iRMqrQS/UEFHA?=
 =?us-ascii?Q?cnZQ8OZJ50lYVFYv/9K0tyqaNZwnytj1EXMQ4JX+d+4sZ03IalgwDrwQEJlE?=
 =?us-ascii?Q?dQc8YKwGJrL6CPfkbfF7cwngyrVmbM0MXphAyG3H2iEBpF2R/0oMTPhDmZbz?=
 =?us-ascii?Q?52B+EoqItKbuZW+6I7gXA+jDlGsemc/zhIk+ERwq5ACG4dvhh6IuqmCneAYl?=
 =?us-ascii?Q?wwqb5UO5Bxb91H15+/tnOChoH5UYt/kz133uSc//qPtHx74xU6Bh2Zh0VSmD?=
 =?us-ascii?Q?giL8igLjDJz5XRmgD9RtHgfGYHPQ39Uwkyvz2Abu8DU2h+xZkHhD5rWE17cr?=
 =?us-ascii?Q?1z2DWlT7+eum12CQ4lf4/pTUZvFjvjhEbPduCVe1lv7jTOfVtnbUpra//Sbp?=
 =?us-ascii?Q?ZtQIlDcGrxnqTbRisDwQN9yjB6AxyJcHAHDv+2jPZ1xfDhIofVlZNoUEcFeu?=
 =?us-ascii?Q?VJthiPMC6LZLT4wmaDnztx01x5qwlvEwHbR7IrZbi1Gg6qtbSUw4UCcUFYmf?=
 =?us-ascii?Q?BjbPjl5c1mVQyd7r+6yCiqCQKYBDPFZHb2I+DfTcnxma6mL/SVBMumVkekGX?=
 =?us-ascii?Q?L6dXUa9I51dbvvF9DqFiK2kIfe9koeLgpU2x8oZl2XUoMOGwmnLb/YRbv3R6?=
 =?us-ascii?Q?yPku07TxfrYQ7oFQSETCJArT+9NIDXH85lUHvyXd0AXPepEQsVDOKzEurvcR?=
 =?us-ascii?Q?kofOBzRRmXU5DvXT8cPlOwGAO0N8KSbFV1BTK9aIEZiqAPQBKatUNVExjfFd?=
 =?us-ascii?Q?9HNyl4nSc8AkmfZozO4MX1L0rjWjhVueAOV56UcVeF/WBbCBmxo0+C0/C1I2?=
 =?us-ascii?Q?1dILdcQBYDwnI7KeRf6s72Ca111QO5aEHsgr5w31uCFl+q8qOprYAsLD2gnu?=
 =?us-ascii?Q?JeGp0Ghm3zRHx8gd/TWjsBh/SG2cp/3DLJIaMauom0fACHkM1s7T7NT/i6Ci?=
 =?us-ascii?Q?pHEHyMICD10RtmHiQqlO6xnyqbywo/1YLAPH15wK0WGyddE8BbAks0VJCetJ?=
 =?us-ascii?Q?BP868S905TQVXWSL2Tub1ddmLc9ss4sTux3jx6v8A1p3CwRXrppf7prhH0WZ?=
 =?us-ascii?Q?EoLgsI2Cp2w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3y4zd7IKq+I+5gk2FdkEVp4+j4hERkJSwakLYlrE2Tay2+2Ykxi2/IUnhZad?=
 =?us-ascii?Q?GlfCnDU5g1ytcpOw05Km0hHj6sRENYO/GWdzRHDSrGb4ioh70YJX7IR8XyHR?=
 =?us-ascii?Q?txzutMEia6IqgKtYY6y+w/myRwTSAbQx+RpeLC8+y/qnpsg4iPY8GH9l2IF4?=
 =?us-ascii?Q?lBiIZ2TKKzaR7H8btIXTor3ihoyxAF0ls/zT6d1k3bJlMdcxEvC9Lzy24xlA?=
 =?us-ascii?Q?TWnKxE1cndydsPO6XBRcelTRhOvnYEr8dBxXuNvfznqcqUh5ydwC3JsATwZE?=
 =?us-ascii?Q?C+Oy5tHN2NIySjgXv8XXn5rRWD/uobD0YxNjzAoiR1fc3n5wUPcEIG3r1zy/?=
 =?us-ascii?Q?x/+yQJkKtyPzAJnKsRtT5RRbmGv/W+QpGQB6LwQJa6ky3Nl4UGuNCKD9IYT7?=
 =?us-ascii?Q?6FeKYHmPzpjyxuA1cNhozc1mrlgWig03raQ9bgeMfkeXUDrUs5HpK6ofJ3lr?=
 =?us-ascii?Q?9TK+WIolQiaxNizyt4roRuOKbD15j0LTbQOzRNrrP6glvb7WTmofkofla4ei?=
 =?us-ascii?Q?zKpn8IlaF/DOP3uB+fi397Zjr35alAJmXUPagjdCPlJmMzxzuzmFw3+dzxNd?=
 =?us-ascii?Q?CyeTAWEaiDSsfEMi/CZk4saFfBzHgZETSj5uzbIhGDIYaNgYZE66ZkcKrThA?=
 =?us-ascii?Q?YGqAEdEA+SXpJUoFVha9sggUZU4V9oCJxSuZZ8euaETtUAAZ/1DmzcCOb51G?=
 =?us-ascii?Q?2Od6Z1j9Z596f1MoPMiSmC/NDtnUNxwWAH+oopjJ55ZAHsNw7PuKi6mal/6x?=
 =?us-ascii?Q?y0h11RZO+i5jFD03tV+GUB2bL5IHxod7N2zuQmT+LFS6DYhCs34q8UBs69Tl?=
 =?us-ascii?Q?EA8BYiyjrarswxVsemLEYcqCndp0ZT9E0+Bbfwu4s5UC74M/9sXEUAKLQlUF?=
 =?us-ascii?Q?xk42six+ryZFHxEVUMbL0pNI54m68SN7AqLYZU+cN0oEdiyathEbv9ijFQ9u?=
 =?us-ascii?Q?uZRMKykpI8GxLYo/wgpuXvVR9EJ5RMUeD/Y2E6Nf6T+8NMx4i/pHtWvXmmqg?=
 =?us-ascii?Q?iXL1ZZRUpsM9dgr/jyfJFXchWeu87qzrbUTYT5b1fjBfEPxCWJaTzWlehVe/?=
 =?us-ascii?Q?CVdAnYR7cdqypV4bMgmePwlkBqWiBiy3QGANjgdWhILf2efFMb9BzCt4lNcl?=
 =?us-ascii?Q?oRiC6KdlGyyYghmal6im+tTgIL0e00hpzIXK3jF+dnPWbfrASzYSrw2Az/3W?=
 =?us-ascii?Q?VT+u/3jLYTU9/kFV4KjxLb8GM7azp6PwLWfLl9FOMrI9PqJ68cgtCSyxrLrb?=
 =?us-ascii?Q?0IEMWBluY6Ir19V0ZqTc2R3JG+rvWDubv6mG64KJm3V3m9Lp6cD/UO+x/OOq?=
 =?us-ascii?Q?vo4fHAbXuLb2gJOZMzYVv7wVm4D3N+OcumhXU/OFHC18Xs1WrVV36NtdBhX7?=
 =?us-ascii?Q?Zz8bBww938gky5A1NNnPl48h3AVwqyiVRdWG+uBdxrm2yXAJo3QIwE+aScno?=
 =?us-ascii?Q?VMRBT5QEl/uyeEdcYJ9AdDXcMDJg1sdoLTsZKLnvbTgZMJC9KNSo4lLJQrAm?=
 =?us-ascii?Q?c/Yy7QtPtkHzZPSX90skjbcFdaE77JeLjZ9kKMpeS9FX93Ay7STqUSlX9CHP?=
 =?us-ascii?Q?LgUxY4/hwTr3hJbI5kmbMGt1u8D1NmUOSPwMSPtDrW5EDJrQE3a4ZY1oWRW3?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ArP720rQXQo+5Uo6ugeTwBS9sV+kbrnN/V5NwY7aWtLOgpAZoey/nCTKVIKmTm4ndaltmLTkC4+QWPQnBx+PO4dq5EWMuZCL0zI+K2pEv4bpb0MbP9y+vhRCATFzCPB2OvuJIWXpECVbzi/ScbQpevTdYfpHaq3H2Mp+UMYZ4RchRgiJnjdqTshsRf/QItH2zyg1Ulf9zRE+thvJTcAVDOZ342/8rHZQkDpSZSbKN/oYxrEn4JXLFAy19XIpHUZYhq/GiYxDFhHps1Up52/jKl61fkrV/S91dZN+U3yJvWomlbhPymZ+/P5Aiix41JY4wjrBGZd8G2rDuxtSaFGmMFa3Of4x0Y1vQOuFgVz5JjLuCq4AzFz33BakePeIdYiYwY4BJq5rqJoQ0eL5wjTMoYR1/Dk8NrXKLOHZ04ntQz68NPEN0Rc06eIaLTf4vIXgNiDaZGy+URRo+E8HoeBwKH+6TLhrCU1AnMeOYhgb9w4NnCq8wlDu/4Gmks1OVwDhuMJERJlaqFYLOgnXCkC3149AMIOx7fw8p5WxKyfDEfm3TLoudHDB/+pUC8gu6/d6O3hZ1ZWMfnl+5OxGkvRf37SkxPzXnqoxvfs+h4Pze6s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0c7162-4b99-40f2-0136-08ddaa9730fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:27:29.5902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIZIHgtJ40gHXoogcK/GegjZ/0N5qvF+Dbdr70MNJQdfdKkOHwhmx9HriJ5hPwx4PXDg7wW7A+E9WPVDG+1oTQaY4ScPnYULb2z+MQfzPHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6734
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130120
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=684c517a cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=JcvlGVHqST4ebTMvxbsA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: NnNauSVNPbT2YFTnjYI23xe0txLNYAek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDExOSBTYWx0ZWRfX7dA2YM0oo7Ct D1bs76KRemgXYycSADPc22fwZGgoF6h6pnIePWYC/a6ttSZ4ep1SrmC9Dn2whRRuRjJFyJHvNj0 zbxu1qROUEy5/rvREMZ5MtjjndqVBUvh7c3xyYdZAbf1WrkifoxdlIUzPb6OZL+mWjZOIuCItIT
 v3O3tbDDf3Rf2vJpF7Ganhr5qFVRKUYxeNJCrkbuGqEMamW1sD8kH915vd3EDAuBypkINYsv8W9 rmZKaTIji9rwQKmX2nPB/YjgqTNE/Q2CwlRWQsnkacSuQ7zGwqV14FWNq8qnoG8mVZC/Z5bVYdj afG7fQFBuN8ETjrih5OkaFfzkbgS5nEqgKWFH+u5ZZ1cG/9Y4SYr2sc+96T2R6CVoGancXTZRfx
 B/Zu3EswYx1Ji5UM8lOjThTX2fcMQDxSPMg8sasTq97zwvenkHsayrvKJTs6DRvmFSGdKMI0
X-Proofpoint-GUID: NnNauSVNPbT2YFTnjYI23xe0txLNYAek

On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
> arm64 currently changes permissions on vmalloc objects locklessly, via
> apply_to_page_range, whose limitation is to deny changing permissions for
> block mappings. Therefore, we move away to use the generic pagewalk API,
> thus paving the path for enabling huge mappings by default on kernel space
> mappings, thus leading to more efficient TLB usage. However, the API
> currently enforces the init_mm.mmap_lock to be held. To avoid the
> unnecessary bottleneck of the mmap_lock for our usecase, this patch
> extends this generic API to be used locklessly, so as to retain the
> existing behaviour for changing permissions. Apart from this reason, it is
> noted at [1] that KFENCE can manipulate kernel pgtable entries during
> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
> This being a non-sleepable context, we cannot take the init_mm mmap lock.
>
> Add comments to highlight the conditions under which we can use the
> lockless variant - no underlying VMA, and the user having exclusive control
> over the range, thus guaranteeing no concurrent access.
>
> Since arm64 cannot handle kernel live mapping splitting without BBML2,
> we require that the start and end of a given range lie on block mapping
> boundaries. Return -EINVAL in case a partial block mapping is detected;
> add a corresponding comment in ___change_memory_common() to warn that
> eliminating such a condition is the responsibility of the caller.
>
> apply_to_page_range() currently performs all pte level callbacks while in
> lazy mmu mode. Since arm64 can optimize performance by batching barriers
> when modifying kernel pgtables in lazy mmu mode, we would like to continue
> to benefit from this optimisation. Unfortunately walk_kernel_page_table_range()
> does not use lazy mmu mode. However, since the pagewalk framework is not
> allocating any memory, we can safely bracket the whole operation inside
> lazy mmu mode ourselves. Therefore, wrap the call to
> walk_kernel_page_table_range() with the lazy MMU helpers.

Thanks this is a great commit message!

>
> [1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/pageattr.c | 157 +++++++++++++++++++++++++++++++--------
>  include/linux/pagewalk.h |   3 +
>  mm/pagewalk.c            |  26 +++++++
>  3 files changed, 154 insertions(+), 32 deletions(-)
>
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 04d4a8f676db..cfc5279f27a2 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -8,6 +8,7 @@
>  #include <linux/mem_encrypt.h>
>  #include <linux/sched.h>
>  #include <linux/vmalloc.h>
> +#include <linux/pagewalk.h>
>
>  #include <asm/cacheflush.h>
>  #include <asm/pgtable-prot.h>
> @@ -20,6 +21,99 @@ struct page_change_data {
>  	pgprot_t clear_mask;
>  };
>
> +static ptdesc_t set_pageattr_masks(ptdesc_t val, struct mm_walk *walk)
> +{
> +	struct page_change_data *masks = walk->private;
> +
> +	val &= ~(pgprot_val(masks->clear_mask));
> +	val |= (pgprot_val(masks->set_mask));
> +
> +	return val;
> +}
> +
> +static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pgd_t val = pgdp_get(pgd);
> +
> +	if (pgd_leaf(val)) {

Does arm have PGD entry level leaves? :) just curious :P

> +		if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
> +			return -EINVAL;

I guess the point here is to assert that the searched range _entirely
spans_ the folio that the higher order leaf page table entry describes.

I'm guessing this is desired.

But I'm not sure this should be a warning?

What if you happen to walk a range that isn't aligned like this?

(Same comment goes for the other instances of the same pattern)

> +		val = __pgd(set_pageattr_masks(pgd_val(val), walk));
> +		set_pgd(pgd, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	p4d_t val = p4dp_get(p4d);
> +
> +	if (p4d_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != P4D_SIZE))
> +			return -EINVAL;
> +		val = __p4d(set_pageattr_masks(p4d_val(val), walk));
> +		set_p4d(p4d, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pud_t val = pudp_get(pud);
> +
> +	if (pud_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
> +			return -EINVAL;
> +		val = __pud(set_pageattr_masks(pud_val(val), walk));
> +		set_pud(pud, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pmd_t val = pmdp_get(pmd);
> +
> +	if (pmd_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
> +			return -EINVAL;
> +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
> +		set_pmd(pmd, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pte_t val = __ptep_get(pte);
> +
> +	val = __pte(set_pageattr_masks(pte_val(val), walk));
> +	__set_pte(pte, val);
> +
> +	return 0;
> +}
> +
> +static const struct mm_walk_ops pageattr_ops = {
> +	.pgd_entry	= pageattr_pgd_entry,
> +	.p4d_entry	= pageattr_p4d_entry,
> +	.pud_entry	= pageattr_pud_entry,
> +	.pmd_entry	= pageattr_pmd_entry,
> +	.pte_entry	= pageattr_pte_entry,
> +};
> +
>  bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
>
>  bool can_set_direct_map(void)
> @@ -37,22 +131,7 @@ bool can_set_direct_map(void)
>  		arm64_kfence_can_set_direct_map() || is_realm_world();
>  }
>
> -static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
> -{
> -	struct page_change_data *cdata = data;
> -	pte_t pte = __ptep_get(ptep);
> -
> -	pte = clear_pte_bit(pte, cdata->clear_mask);
> -	pte = set_pte_bit(pte, cdata->set_mask);
> -
> -	__set_pte(ptep, pte);
> -	return 0;
> -}
> -
> -/*
> - * This function assumes that the range is mapped with PAGE_SIZE pages.
> - */
> -static int __change_memory_common(unsigned long start, unsigned long size,
> +static int ___change_memory_common(unsigned long start, unsigned long size,
>  				pgprot_t set_mask, pgprot_t clear_mask)

I wouldn't presume to comment on conventions in arm64 arch code, but that's
a lot of underscores :P

I wonder if this is the best name for it as you're not only invoking it
from __change_memory_common()?

And yes this is a pedantic comment, I realise :)

>  {
>  	struct page_change_data data;
> @@ -61,9 +140,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>  	data.set_mask = set_mask;
>  	data.clear_mask = clear_mask;
>
> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
> -					&data);
> +	arch_enter_lazy_mmu_mode();
> +
> +	/*
> +	 * The caller must ensure that the range we are operating on does not
> +	 * partially overlap a block mapping. Any such case should either not
> +	 * exist, or must be eliminated by splitting the mapping - which for
> +	 * kernel mappings can be done only on BBML2 systems.
> +	 *

EVEN MORE RIDICULOUS NIT: extra line in comment here!

> +	 */

OK so this probably answers the comment above re: the warnings.

> +	ret = walk_kernel_page_table_range_lockless(start, start + size,
> +						    &pageattr_ops, NULL, &data);
> +	arch_leave_lazy_mmu_mode();
> +
> +	return ret;
> +}
>
> +static int __change_memory_common(unsigned long start, unsigned long size,
> +				  pgprot_t set_mask, pgprot_t clear_mask)
> +{
> +	int ret;
> +
> +	ret = ___change_memory_common(start, size, set_mask, clear_mask);
>  	/*
>  	 * If the memory is being made valid without changing any other bits
>  	 * then a TLBI isn't required as a non-valid entry cannot be cached in
> @@ -71,6 +169,7 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>  	 */
>  	if (pgprot_val(set_mask) != PTE_VALID || pgprot_val(clear_mask))
>  		flush_tlb_kernel_range(start, start + size);
> +
>  	return ret;
>  }
>
> @@ -174,32 +273,26 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
>
>  int set_direct_map_invalid_noflush(struct page *page)
>  {
> -	struct page_change_data data = {
> -		.set_mask = __pgprot(0),
> -		.clear_mask = __pgprot(PTE_VALID),
> -	};
> +	pgprot_t clear_mask = __pgprot(PTE_VALID);
> +	pgprot_t set_mask = __pgprot(0);
>
>  	if (!can_set_direct_map())
>  		return 0;
>
> -	return apply_to_page_range(&init_mm,
> -				   (unsigned long)page_address(page),
> -				   PAGE_SIZE, change_page_range, &data);
> +	return ___change_memory_common((unsigned long)page_address(page),
> +					PAGE_SIZE, set_mask, clear_mask);
>  }
>
>  int set_direct_map_default_noflush(struct page *page)
>  {
> -	struct page_change_data data = {
> -		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
> -		.clear_mask = __pgprot(PTE_RDONLY),
> -	};
> +	pgprot_t set_mask = __pgprot(PTE_VALID | PTE_WRITE);
> +	pgprot_t clear_mask = __pgprot(PTE_RDONLY);
>
>  	if (!can_set_direct_map())
>  		return 0;
>
> -	return apply_to_page_range(&init_mm,
> -				   (unsigned long)page_address(page),
> -				   PAGE_SIZE, change_page_range, &data);
> +	return ___change_memory_common((unsigned long)page_address(page),
> +					PAGE_SIZE, set_mask, clear_mask);
>  }
>
>  static int __set_memory_enc_dec(unsigned long addr,
> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index 8ac2f6d6d2a3..79ab8c754dff 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -132,6 +132,9 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
>  int walk_kernel_page_table_range(unsigned long start,
>  		unsigned long end, const struct mm_walk_ops *ops,
>  		pgd_t *pgd, void *private);
> +int walk_kernel_page_table_range_lockless(unsigned long start,
> +		unsigned long end, const struct mm_walk_ops *ops,
> +		pgd_t *pgd, void *private);
>  int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
>  			unsigned long end, const struct mm_walk_ops *ops,
>  			void *private);
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index ff5299eca687..7446984b2154 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -632,6 +632,32 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
>  	return walk_pgd_range(start, end, &walk);
>  }
>
> +/*
> + * Use this function to walk the kernel page tables locklessly. It should be
> + * guaranteed that the caller has exclusive access over the range they are
> + * operating on - that there should be no concurrent access, for example,
> + * changing permissions for vmalloc objects.
> + */
> +int walk_kernel_page_table_range_lockless(unsigned long start, unsigned long end,
> +		const struct mm_walk_ops *ops, pgd_t *pgd, void *private)

Don't really see the point in having a pgd parameter?

> +{
> +	struct mm_struct *mm = &init_mm;

No real need to split out mm here, just reference &init_mm direct below.

> +	struct mm_walk walk = {
> +		.ops		= ops,
> +		.mm		= mm,
> +		.pgd		= pgd,
> +		.private	= private,
> +		.no_vma		= true
> +	};
> +
> +	if (start >= end)
> +		return -EINVAL;
> +	if (!check_ops_valid(ops))
> +		return -EINVAL;
> +
> +	return walk_pgd_range(start, end, &walk);
> +}
> +
>  /**
>   * walk_page_range_debug - walk a range of pagetables not backed by a vma
>   * @mm:		mm_struct representing the target process of page table walk
> --
> 2.30.2
>

Other than nits, etc. this looks fine. Thanks for the refactorings!
