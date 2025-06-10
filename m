Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216E246BB8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562530; cv=fail; b=e9iV+78FeYzo2mq6PD7E9AxqqdYWZqSWCMT/49SaKVzILcFg4bEx4hMiM7G+VbKciaF7mcQ4Su/CLZcSLYd+GV/64LSJlGs0Sl2+WeLERJFVUj4zS2fQWRm1S06KEBSgF3sT9gwA/JHVuVBmYHYbSeqWQoyDYxIPQV5G5GbjWJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562530; c=relaxed/simple;
	bh=i1Yb3XziHtULMbdPMSo5YJpXtr3zDyFDA9QB2mGDCTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZSDWzaoL+3kfsa0181OimaqGnSyBg71I8m23WIxX6vhYW06NO7LS3xRxpzUJ8CGEjgfRC/bRP8A6wQ81+mkyxWG0/jnAz//iQJa4oTooHqCdDZZlqVvicpAcHeL1/15zeC4T6UMAZrLIOCm4UwRRJnGLu4j3sXg98SbYnEPwUvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Uzu8wbce; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=d83sOKPh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Uzu8wbce";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d83sOKPh"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADBemi011293;
	Tue, 10 Jun 2025 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=0bXGsM6Hz2d76sh0Kp
	j0/hpOnsvf0oi60pYWbyOyE/Q=; b=Uzu8wbceA7IlBai8O0fkZoYIJcu4ln+uD2
	q60JA2u/O8FVmU+vRHarOdGNMVtbwq4N145A0Lj/aGVnrXF8N87kY8OGoAxP5F6P
	2JUQM+yADwuXrrXxycsCu4T56J5/fOK9OfgyGSKfeIyuM51uQshQx8om/HnLmEIw
	4ymoFhhXo0K1xTrbp3s0low2W6DIf37DuRO9iv9alay1YOdYqGmH1CitslUiyxDR
	+Nxvi8cDf2MRkkG2NLy1NzVoYkFQdbOT5FqLcJuR09uFuoX6KTlAg3ynHUs7K0/q
	DTAzd1j8jzZWFHnBqinLnU6vkTnFxhE49tsHNoGozAFwssnHs9iA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad469s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 13:35:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACoBfe003330;
	Tue, 10 Jun 2025 13:35:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8rc14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 13:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3Fe8Bh3jIFQ/66GLWiSDguyfrB8tPxwowGU9xTNTnycSqp2bYKf62md5B0m6XZySq2HsBix0aRLcv3Ejuagdi2AYNsnva225vmTfBUXVUJcwzWRDJLRsAnRc2WWZuhimHkYjcLbxQh8+ag+sqRVUy9Wd2RVoXDIdA5EgnBqvAHA4BFK/hk19U63PmLYeWajihyVrVnD+OZ0bvvo7gBPIkxroM6effuGZ3HNyCIaBqr+aPHcNAHIBdI+g9ajzckV8JVVwoh+SSGNxbgaAmQgQe1zSjKthRg7Nm453nMkAqvncDjpXU70Bh1ChzniOusHuIampEYfw7OJnMTnD6levw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bXGsM6Hz2d76sh0Kpj0/hpOnsvf0oi60pYWbyOyE/Q=;
 b=D9s5lJCisWvylIevoc4ShZKqTFiQz6OOMb47scuWC8Msn9ivuOM87rCYnEqeCkicVvoh0z96l3VI9nJLWVR1zmEYtZe8UmVY4qyli3lJCXjSmeNBTWzo9aikdzssuXn1uvzvDP7cf61DPVWzAP9J2szvXzkUjTUJl34kr9kjwVoyZZo4DamJZ9YuZ8eZ+MjLpo+9WedLYgvR2a3i3MSVcAXJ1ep+xQ+xl4Dj76kVFkPmnPgvporddfaLza5v3WA6Ay2PaqTqf9h8b0sxweEVU0xFt0qBOCBi1bhHm8nGbAgVVPefFEfND9kKmKCspF9bXNM5GUxjhJ37H4c50FAZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bXGsM6Hz2d76sh0Kpj0/hpOnsvf0oi60pYWbyOyE/Q=;
 b=d83sOKPh71PNBU59TfLJqoRU3C36XhEQ4UwvQMttFcMxji72iO7y81xDajAcMYJWc0VdG6qPMLIhvY+W3lcJP/1hshcfldVdFyxiTtYNAMVYFQljqxarVYMPP3CCauXyWv5Wy+EkHL0ReN7zRetNdRTUJw80zfMB+o8vQ7yM70E=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PR10MB7948.namprd10.prod.outlook.com (2603:10b6:8:1af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 10 Jun
 2025 13:35:02 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 13:35:02 +0000
Date: Tue, 10 Jun 2025 14:35:00 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
        ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
Message-ID: <1c4714bb-97f3-4261-92b7-34223a32e016@lucifer.local>
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
 <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
 <359668fb-df61-4135-89ee-2675a06a5c1b@lucifer.local>
 <bea0969f-5a6c-4486-aeba-964fa79bd714@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bea0969f-5a6c-4486-aeba-964fa79bd714@redhat.com>
X-ClientProxiedBy: LO4P123CA0459.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PR10MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 967d5b83-8e45-4740-e886-08dda8239a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c4V/44fgqXOOLFRSxAOgORvyq965yRoWnby2nVALJuhGIXoQgVzNoPmOjG/s?=
 =?us-ascii?Q?dqtCnJPg7yt4IpeeEcl0k1pH7TZEYqvnoL8MVt+KNvCCjygN1jsWX8W+g5wg?=
 =?us-ascii?Q?r/Vws3Yc9Ymx1Z1QmuQ7R6dvBvwtJSa/IVURhyMedmGpJuXIn+gSgxjoFKEe?=
 =?us-ascii?Q?AgJ/ma2oiFf3bln2q3snijVrryfUQo3EWoPUB7VhLkVfqlySQhQcJIqdTW5v?=
 =?us-ascii?Q?jTc7MvReGwtnTraN4Whh5164HitRFlDm0q+Hlphv9ZEg1awLPDYAHhg1V18Q?=
 =?us-ascii?Q?nJ1hyAX6VxHtyMlBaZwe3o2OyKKvppVaY6MsYGMkTCWnWjtJi9svIhZ8PuR+?=
 =?us-ascii?Q?Q4JBubs2lfY1tSNTLFZUL6uAur0p/NG4aiFPXzUDm/ewaO81Zbga8ovU5qLL?=
 =?us-ascii?Q?RYnBZ+WBdzGa8l7pS16ltfDfKqLPsq8Iwpr2OvQYZZDgK7vUxEkYTbfNR4ft?=
 =?us-ascii?Q?Tn/3phII2jiBNhaMJjaO3KVyXYYYmX1ssGBWMTCf3E6RW4Wp4ccF0L344hmp?=
 =?us-ascii?Q?vmHQsX6R7imM9IxvPcCcrp8MIrZyoudbECAM37scDyQ72N9JXPe5aDHoql07?=
 =?us-ascii?Q?WjizVbmWfYiqsq9ZW3CzEQQTJsE/5IYPnlDY8lXdT/sQOdn4sM/jrQIiC1yt?=
 =?us-ascii?Q?DZLyebUVafraxjHP7gJBuYKUp81IedS5dRRJBJxgzF1FIPJWgprEDutY7ioG?=
 =?us-ascii?Q?2Gk/wcD99A3AiEEOiOxGwlkM/VF5k0QdazYtlJ8mh0fUeVKvNYfdSC2vkviB?=
 =?us-ascii?Q?eZN84mEtSr/cWVB/iM9D2GUL/Xi9sYY991rvPZ6Gp0mT2KNtdLSGSqXDrOIU?=
 =?us-ascii?Q?nw+/7i/9es5y9bvsn0HJBrwihyliXg5ApDSWLSOUPPQGja2mmH8ybonHtGzj?=
 =?us-ascii?Q?5MkzpotZe8FsFDuEqdwBOmvA1/4K0zrgPHFTvd0kaNCwIB1Kfib2j4Dj3p+l?=
 =?us-ascii?Q?DmtdUToIt2ox8DfVM3K4f6Arb9r5Wh0DekrE9SwfiVMgqsQV06Jt07ovlStz?=
 =?us-ascii?Q?qVRQPMhiqsPKjqO+u4/76t50oauVSiFa6EPHXX2KN/SD7CqGycFZoPYzAEKq?=
 =?us-ascii?Q?7QiYAKps8oS4YixDV8H0OME37c6CXNrjH3CWxMdQZcs1oiiHhg4d8+DmvTE6?=
 =?us-ascii?Q?FlP8MxClGWoGNJPUuU1yYoeycBJvTt0aI0cR/MnfZK24YLmPVKXCOb3HS+76?=
 =?us-ascii?Q?g2lyZ8G7y8OR8wxPkgBIVTOnt1UhxftUpe/hKHVomXG2DaMzL6/1vLHX4V5u?=
 =?us-ascii?Q?QAvO080qQv3Nnth6SckWD1aDAYelJJSyaxsl028YHG3JlJ8/fa7ZEyV65QCx?=
 =?us-ascii?Q?Bte8/+yaUDH/TSJgWSj4YvOE+nr8oAg6C/st2si+yZPrpcUqJMdSnfJbQ5Ly?=
 =?us-ascii?Q?6JDnArOeESntSkYjiw39kB3wAwNVlPXcj+4nxbxBrIAKRuLCo8rxjxP8RUbe?=
 =?us-ascii?Q?1J3lCSMb3LQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qylx3WAq0glL1jnqToq8ZvzM8l66VqIrydpPlL8VRgDaZsL+6cPmWtJqNmkn?=
 =?us-ascii?Q?M+5jtHy6C9BovB9L4VnXo965KhiGYnEy/J5PjHJGw//UXcerQAjUa5+uZK34?=
 =?us-ascii?Q?7ns5KLhKcPyc/bOHyrT4KEkYgVZpfsURyk+k7AZHeq25qHWcg+4ioJqpt17z?=
 =?us-ascii?Q?3SRRWD9miT/VGuysbcL8kWeTyvAUwutWK292Bdeorm/2mHJ2/sRnJxmKJzVD?=
 =?us-ascii?Q?6EqShu+PbLBag2azbTiC0BAZsgV5KgJuLFXyQ4savRUkkmcyG6Tx2X/6an6P?=
 =?us-ascii?Q?ET60iUCeSjjZg2y3kLLsgojHxBkeTps69cLVnZAdEGpdeGzS075CTj9J7gkB?=
 =?us-ascii?Q?Q3lLn7k3CLKz//0F0VLCHof/gXi+TdrLrr9BSoqsTL3ximy1x34B37AB16Md?=
 =?us-ascii?Q?dKY5VOESfLV9Qn7rVs8kLmQqyI/5zcPKC0l7WPEuS2NwCaKLr1DNLseYv0vc?=
 =?us-ascii?Q?SOOZy3a784ecSnAICp4WCPl6lW1z8BFLXdY8Ipx23fDw5azXfBwr1ThVV9h+?=
 =?us-ascii?Q?C6OT1GKZQoeJI5lAWFpCEOgFO56vVphxcttmHOEZ2KlfSkdHjq5s+Bmy8S6I?=
 =?us-ascii?Q?ZcxergpcPkMGM0oJ3cKcNmYhJJMWLQ+H/TBY7qpRPdz0gxAvc5J+AN5yUpOM?=
 =?us-ascii?Q?LyMdOfG/fAQfKSLE08w9CzaPy3LFs0CEy2B561opwfM/Z8zrQ2bHkwmYuNH9?=
 =?us-ascii?Q?ZPjKwzyCrnVCUtAMm8zazacNvNiFEXJ9OfdoSHNqPZIdQMhoSLwIKXUT1OZs?=
 =?us-ascii?Q?eIlEXv//I4WlWhKwiTmCVyiQ0pBdIuvo1lipQHI7Nzdcqno3CEMO8d+gxCoT?=
 =?us-ascii?Q?+wXkVSnFdad+ztteswATk0AZug6vMRYjEUf7MbWlKy1B0lHjbV7rzSsMfA8H?=
 =?us-ascii?Q?mC9cWNen9YqwRYqNbLRDD7L/ZtY9OaIBX21W8r2Zp+rI+ZdGxyOYfV9UDoUt?=
 =?us-ascii?Q?vAVhKnZwZeJ6yQHkNtpffST3TyLs9MdCHYY+4RETWdKhUXJJ2OEcm61OIB3M?=
 =?us-ascii?Q?f/AnvQJI2Tu+UXqnZnV/HSuvxrCcSs2FjWWi+LS8LyMllG7Sm91CCz6rhbgp?=
 =?us-ascii?Q?YfYr4SCSngjWqv0GlYnzwrvOPnRP4EqpEl+nSLSfadY9bIxLT6+kxy7roiIW?=
 =?us-ascii?Q?jIHlwhOrK5ta/vcT9qJBeaSziivcD7Lw4c48POmt4OgyuhUE8dkafL2zZHuj?=
 =?us-ascii?Q?/JoMJIjpGe7IKJHcSpopV+db2ip10OruIAht50ZTbwuelBH2P+IXW3mJF0NY?=
 =?us-ascii?Q?zCncQoTBYf1Q+QGIqzsS5NeS/RXY7BnWt4RaVrTZgDx1qdH/Ff0Xa8tctwo5?=
 =?us-ascii?Q?ex9Th7ZgdT51Mg9gpVIzHc+4fLWBc9LJigw2K/mwVmuoj5eSc6QUxKX4Rkqi?=
 =?us-ascii?Q?JaAMQ+fVqYN0SOGP75ZVlAoNJPGHkkuVDDlXvyajkxpsItDBnMPy/d+6qRAd?=
 =?us-ascii?Q?Zigfu5kkC8vKtOI1te/TOmdgPJFH4oeZdscwz0fxm/FlTELRR5rH/8tjgGvj?=
 =?us-ascii?Q?+of5kVR0ZLT4qqgZ3Avui7ZpEYJnuQ4y1FR6njjxiNfdXzQf03PJFuUbzmlt?=
 =?us-ascii?Q?i/SFyat0LO3ME2t+KcMDA6XRdbvBFndmXeJQSAWVuTD2qD1tV0JgNhfTK12U?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l/d+nfy/hhj0cNwtV3MYf89BE+iDIcvyLS1qqG4ByzP1v45Iaxs1D3vEW8zPih+NRugnvj/YJxwWbuuxAUOEO6gLIHDEttauzMEGkA07dUUFS8EX3f5sI+pjImAkfrpNZmC/4pXiAuPp1s0pJkcfaxdwgZYDm+9JUVAQlrS1dSOOt65vNvjogjVU85XTUVkEuoiJVU32D4u0nAQL9TFqVwHiYWesJAMCK1PIdIAUEh9GWPkFtkOnIwb0vICIV2Mt8zgLv9mtPjxDJB5uh7mu73KgWfzSEWVcUSKDxg9wmVZbcJcGKGXSuzPUhbA0+7SiUdMWtAui3NCrUmP5m+TTCPjwtWoD9m/C4orgG2TAPENATuax0Ydxt+Y4+oI/W8OqhdW0H5pZPnc3CNKWQ9c2wRXTpZQU0skCICcFPOF20Sf6mLUSRCXIopDY+kvjDjkZc3ZWXrvAGQpgmDdYNe7g7hrAE0zvYVdrqhHq4B6v+ocsqv/MYMcOgnq8ioMw+hThaJ+k6+Y+waFVPfiOplGZhG84aofNRaApUuS7jNPmEhcQE05mgir84nZbcrRbXEl7KMVBL1sINTXMcq01iquEnnxKoehkoKotwxAdG8hGul4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967d5b83-8e45-4740-e886-08dda8239a52
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:35:02.3575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdn+rnUFfLeff1WuifOCutsKEZqGdr0huDYfDRnwHB/VFnBNNhv4NLq84KxmBr7Xir73dDnVQffuJ4ZczQ03LwkNE0p6/5aMqPFiedXlqFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7948
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=932 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100107
X-Proofpoint-ORIG-GUID: yUHbkYg7qonb_isu80sFZ2IERtRoc8J_
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6848348d b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=KpFUNaAQEwU7tdmsnmQA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNyBTYWx0ZWRfX0300k7FNJ28d ijABk052xT3NglicrqMkYBd1kYTUd6W5vAKv533+DLxqtYnm5jxHWyrV+jVqMVjKQ6OSU9IhxvE rCUbaq44npXF96dpGyz7ONhtqS06sbCWTUBM+Q1Vvg2fGjSeRu7BTF4XTaC0bBT336N3pmO9j0L
 rco0lxq/SHokhiflpFRtXHxOc9liX0dXr95GeSfMokGLjsZZtPKf8WHjtBStPNC48vtavnkmAj6 JGP+0wFvL5rYbZoGAWACC61CjROsJA4j09q2Q2Ilj+YG7B0AKNimYsN4Asm97oOHA2ls083TBfB 0e+kxquWJLoCxe74dDkfagECFRGesruvIpaS/MDUNfvRWTCXqmZ8mMDvXuUDkts/z4Vq5huDOUT
 OYThehHFHSfQLpyJX6IHVFq6sqM/Ax1OwwdoUkzporN7I4jrlHspk2dnFMSXqNOI3gc3OraI
X-Proofpoint-GUID: yUHbkYg7qonb_isu80sFZ2IERtRoc8J_

On Tue, Jun 10, 2025 at 03:31:56PM +0200, David Hildenbrand wrote:
> On 10.06.25 15:27, Lorenzo Stoakes wrote:
> > On Tue, Jun 10, 2025 at 03:24:16PM +0200, David Hildenbrand wrote:
> > > On 10.06.25 14:07, Lorenzo Stoakes wrote:
> > > > OK so I think the best solution here is to just update check_ops_valid(), which
> > > > was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
> > > > enforce the install pte thing).
> > > >
> > > > Let's do something like:
> > > >
> > > > #define OPS_MAY_INSTALL_PTE	(1<<0)
> > > > #define OPS_MAY_AVOID_LOCK	(1<<1)
> > > >
> > > > and update check_ops_valid() to take a flags or maybe 'capabilities' field.
> > > >
> > > > Then check based on this e.g.:
> > > >
> > > > if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
> > > > 	return false;
> > > >
> > > > if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
> > > > 	return false;
> > > >
> > >
> > > Hm. I mean, we really only want to allow this lockless check for
> > > walk_kernel_page_table_range(), right?
> > >
> > > Having a walk_kernel_page_table_range_lockeless() might (or might not) be
> > > better, to really only special-case this specific path.
> >
> > Agree completely, Dev - let's definitely do this.
> >
> > >
> > > So, I am wondering if we should further start splitting the
> > > kernel-page-table walker up from the mm walker, at least on the "entry"
> > > function for now.
> >
> > How do you mean?
>
> In particular, "struct mm_walk_ops"
>
> does not quite make sense when not actually walking a "real" mm .
>
> So maybe we should start having a separate structure where *vma,
> install_pte, walk_lock, hugetlb* does not even exist.
>
> It might be a bit of churn, though ... not sure if there could be an easy
> translation layer for now.

But you know... I looove churn right? <3 <3 <3 :)))

That's a nice idea, but I think something that should be a follow up.

Quite honestly I hate a lot about this code. I did some refactoring before, and
I might do some again.

todo++; ;)

I can tie this together actually with Muchun's suggestions from
https://lore.kernel.org/all/1AA4A4B3-AEBE-484A-8EE2-35A15035E748@linux.dev/ in
my 'page walk improvement' todo sub-list...

>
> --
> Cheers,
>
> David / dhildenb
>
