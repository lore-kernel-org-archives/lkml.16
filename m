Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52BD1F3BAE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365360; cv=fail; b=htGcGtqHpe9x6UM2zwDMNZmJtZ0tSINDvRu2JZY7WXoAjFTvHDW7k0QFuayty2OCqIbaSNXzoYDqkAIlXc55z9+pe2sPOpB8T7nxWHo1qEljP4DjiKWfSON/pLSwlyTiJz8GPOylis/Toz3UuzfAtbpBJDKat4QTHtxNA9zmc2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365360; c=relaxed/simple;
	bh=Gb/KqkrWtprKOfgAIddTsMyDyDzo/8yxpUVNrOisx0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pj0kAdy+YwAhMg38lFy/HJsYNmvo9IpUwyPh3HOIq/wM8aTRj76H6BatT3HabF2amBR+QVne5EQiS+JaQRypGL0s92wG0H43Q97+DRFXMohJOr2+mVyUjdpj0JiZGHh2j+cTR+lx4P+jiW+WP10VEqsMJiH9w8ClchRZ+sI0r9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hwDDWsP3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c+u42Q+g; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hwDDWsP3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c+u42Q+g"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611Mts8005431;
	Tue, 1 Jul 2025 10:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=r9psTm2GKpRYGdeGH3
	NEpVwMbKKimpUVLSRNj0BI0TM=; b=hwDDWsP30TAXoRaHQaww1aHTfCwkeIUgiL
	1VA3o10BLKLZxfsM9ArhKYY1d7/fBBI2XktjTAUCyejcL8h3iZTIjxPOtxHTK2YR
	NHapBJ4A+wZs9NAju1D2oFZo12UIfwZPUfN0JRlrA40k/ejJtfU6htBhDWg29t2m
	hpKQf6DiWvOR7nt9xGrU9+gpal+4eWkw6yWsINWGuo3lrzc2Y0WIym9c2Jyqo+Rh
	YvnVXu+zSdZBmMVU6mAx78EAvbcHNMuiPSjSeKcF/i8ncpCUqgvaw1PqTm0YEDIr
	Or7ZNg8Uwey+pFUnjvl0L9WfvMyV+f74jF/Lf2ul1AwK+23RxUJA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704cg47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 10:22:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5619KJjS017529;
	Tue, 1 Jul 2025 10:22:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1eafrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 10:22:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWmEROLYCaIz57blmBxkDhs5GK1NN6SWQtuNMHZpvoQxiijDU12W5eWOY1HCjEay02Zz+ODdh8Zo+n40fky2iNUcdq7sNFReToePK2WXfGTqdNEE0BjoqjSc/9imR9fx8qkBFI6VYQB1kZXd8cZgGt0ewiwKG+PD4LihzClkafw0OJ878ICw76N2QAXReRhC2VF2MMSEYKGktAXfTBLHW/p2PHUFAFHDXGb+uoPm6wDDTwQ8yRdh1p7iQFecC42MYYQIQvLwBrVuJvGbF5H3EE5M1K2Gx/chWcpD/XSq8O8xXnUCpbEJYK3CErdApHgcPq0ruhnkZftBK4fvTLUKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9psTm2GKpRYGdeGH3NEpVwMbKKimpUVLSRNj0BI0TM=;
 b=nXyMFRaWmtRhALa1rPmGOAio5d/T1VA1wSmrhtpgKnwNTVrTwcPVvHlSeIITkk4vpzL5g+hXSD0axPZ4OBJ9NraRizKwPCPANniQFG2EpA8FbpLu7VBaw6dppRwbltR528IZJSN0xrAOF7VAZ9ErV7eo5snOSyNaTqPiyfOLDtNfH98jGk4uLiq7BOxhnbREbs69p5PTJ7uqnoq6SnDRQlE1k/6oJWqMkRancfOHOgapJTfuE6Eb5oGLW9XsEK6V3urGOhd3uhoWeI+QUriRXoUAafe4mBWLZ7Y4AsBWu4w0p8b+kNQD4FLAphM/UBMPxhU7XYhACe7+KJA01s9H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9psTm2GKpRYGdeGH3NEpVwMbKKimpUVLSRNj0BI0TM=;
 b=c+u42Q+gAqQBpwAv3fwatjx5Yozen093BBb8/LoOvMiwx6XOLl3AS0naKi4MqK0YPkTXMhmsmlp8DPz46zctkwJDI+QFwMyiWljRWZLiUqtbkpufj6EF4O5mjXTzBkuqBx6PF2oXBHAhRdxLC5J/z0v5UhP/f3a3sbS9bvCCEV0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN4PR10MB5607.namprd10.prod.outlook.com (2603:10b6:806:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 1 Jul
 2025 10:21:59 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 10:21:59 +0000
Date: Tue, 1 Jul 2025 11:21:57 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Message-ID: <61f50191-8bd0-4f25-b3b7-86605af8c0c6@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
 <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
 <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN4PR10MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbd3c68-5d3d-4f80-db34-08ddb8891cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tz8iDNXjyF8kjxhEwlVV1z0VBcUwAFzRMBmLRFEMSKX6L4kEMXlzCnguRgN5?=
 =?us-ascii?Q?KgQOlJq06QPRB2EP5hHtDIXPgcnRujwPh4mJH3M6ijQToA9/6e+QUIDqcoEm?=
 =?us-ascii?Q?X10KgjetSEm6T6Gm3QLvTbqIIioqkO3hGzsGXTcchGTkMo++GeDT9fwWm/pp?=
 =?us-ascii?Q?gIlcg9w5uhpW5SDqj2RAFVXpf6Oe6WGjMh8GmmWXyfhkHwFx44cgRjn6+pDE?=
 =?us-ascii?Q?T18m2h55Q3oYx3AfJPWMXYXTFOF+SW3jDAJm4tvz4diUG0VXNwV7L42s3nRJ?=
 =?us-ascii?Q?hXeEZ8ZTAweyAo2jJr8S/ZUdCkfWIY0bjRTcNC/Wwv2zUuwKk+yUqQZF3+Fv?=
 =?us-ascii?Q?kNZEV7tQ8ACdtpxxfqPmzpfWOmHthDiKWXK9gx+UyL/YCVayf+YjAxoVB113?=
 =?us-ascii?Q?klZ4Obt+tbBAL4O+g3mCaZo4YredWb+BB+xBB/57mtCF8kTaujXRYWlWR/zc?=
 =?us-ascii?Q?98PO3J6JgDf6kuKJq6ldcG7IW/G9lPWbZrO3kN73G03CYIKxPigXpy4gfjnb?=
 =?us-ascii?Q?4tJVzkEmAbaL6BOaUhyqyo2oX9XjAZryCn3quq8ixyf2T4dagbkzzw+4rqS3?=
 =?us-ascii?Q?bqDgBxNjZ5DNiQEeoGZy7s3t8gwtChkJoTRswNNrW0yXt+hdg5G4oBivrRHt?=
 =?us-ascii?Q?6KZu9PeRcuElHzKQSk2a7iIFIPAQwtgzMZqi6A/mEC9J84J8LhTR6CUeppmx?=
 =?us-ascii?Q?FXdeI/dEj5KKs86b23GIbYjUc476+ZXgUUzjhi69Hy9RoZilRzaB/xSil9QF?=
 =?us-ascii?Q?55++6T/KCyA5KH8OEyBw0Kc5UJ5ZuFFrVRQgUDLoSn1aHwP32RMAQdY8nzPp?=
 =?us-ascii?Q?WVq4/XsNRzgtHP919pZmcgoo0V1hZqvIS8Ut8kHi88QyMpLDlRLRe06uPapw?=
 =?us-ascii?Q?tHRdzbUoweucYPJk8xPhEx+iV94HsWgf8chY6gErrlxmGn8AG/Q18T5Ro6O/?=
 =?us-ascii?Q?a2nPiYGVdKXCDNEJBEmiLHlCmREyTC2mwcxnU71W3RlIaeEI4wYLce4tI0ux?=
 =?us-ascii?Q?1ZtRzIUE/Jy7RWjYa7uR4TzB6vZLCQkZb/HvHeMFenYKGx0HZBdi2ToeyktG?=
 =?us-ascii?Q?yrWjg/o5dfnXSXpZahGEXUTztUm0wIXPwzNmMcoOHU6Mb0cz59EbyUs7qck6?=
 =?us-ascii?Q?tEdQcgY+R5ywYuVGxphtv/OFgGxIwiGFXyqfuMHbgTj1GbeE/kU3OqyYg7B5?=
 =?us-ascii?Q?5abTSRPsFk94ugKH6mAFYKbp5pw1etIsSIev1Nk7+W6ZQfFIEajdnxo6qVy8?=
 =?us-ascii?Q?xc/pxVXOTe6aOzWWbfxTgcy0b3toYI0krJKijDyuZXaMD/BDw/yDz21pJHI3?=
 =?us-ascii?Q?6KJ1oV//9o2X8vBmcYKrLBa0CRTUJVNZY6jb0hxCdc7UCbVe3+tsWAYCLRyP?=
 =?us-ascii?Q?OAPMiC/FnOa+Xp1WJNjIoAQpbV6MScAj2wV+Fl76v2n6jFy1Aw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HrWPBcqTWSM7BSsASoJ3GSZkr+N7Q5GAfaiQd0NbN9OoO3VeGBYbHJPj7LBA?=
 =?us-ascii?Q?kBZ0Nyu04/lPAG/qrJ/z+83UQo73+CGxpmS3e4SCTzHF9pbmloU0DPPsZ2qH?=
 =?us-ascii?Q?7THbAzhLecds1LtcqaCc8VeYloC2+hgwV2T0UcEONQP1tLyn05kat75HX20u?=
 =?us-ascii?Q?FyO8ykLIrwRTHbVMwU+900gff+HXsLXSSdJYtNILpAICRw6M9Uxmy2kSg1K4?=
 =?us-ascii?Q?HD/P/uQQY1iGSc9BslqXGfAAaDl2e81/RPn1xuNvB+yh/Z1Zhnm/eIBtniba?=
 =?us-ascii?Q?tXZ8/d0Ftwf+08thyGA7BCJ/VS9kapu2nlW1PCk2n0GXfacr+RzHzNVyn3CO?=
 =?us-ascii?Q?crUQ6JrvUzCc4p1Pi1zqXH0bwCHoA6hSJ3u6HRikBAYHQ2f3O9eDN3l+KXtP?=
 =?us-ascii?Q?KrTI/MiC/0G28O4VRVnqbWzxDY9CHboLLfP44MCQwFY56yKd0KgVEzy/LiTU?=
 =?us-ascii?Q?ZOW2Ir8RFb1JLyQsW4SH3tgB433r6XbGgtp2wAQSX6hofHC5YzR2aoQl5Ntj?=
 =?us-ascii?Q?r7rPW7tSoa/soqHYrLqAQfehzA+8W43bAlilFKk+YBeORPT1DN/PzGykQFFY?=
 =?us-ascii?Q?9/201MdAS8rBkJmLjfW10gEsbWRIRmFttIF+DQN/ZM2ibJ6PGCKwW62mGsne?=
 =?us-ascii?Q?zySZXT3BE5eGz6bvVE2iFjLY2OUNQ2r4GdV/uP1RZ4XBTSXrAuqaoysSUAmL?=
 =?us-ascii?Q?Sffe5APOZaRSA/kmDZ8g/VMwpnGD2LSC5j9HIBCZedB7sEGWR2HhKpaWJ9qE?=
 =?us-ascii?Q?trLoYym0Rj4X3eunXrguZ3OiwiWZHNnS0gd3huTVs456VMbSh5bkulozjhS3?=
 =?us-ascii?Q?+cg3jwpKPnxwnnDz7dRGig1FoCD509jrUl33huHvKVOrDGt9lw2BZ5YIY0y2?=
 =?us-ascii?Q?UjE65q681LmZOJjcrYZ/ShGe3UVS7PrOcCw/NwCQcKwfMn7OvLEJaYP5wXAd?=
 =?us-ascii?Q?SfbvP2rbCWK8QkkE8rtZH8GpZpK5swL1JmZrp09di5IBjI4VKUxBMuzGonkk?=
 =?us-ascii?Q?Y59PoYQsmAKN2BUo2VFFykJ8wz87OVmBOXO3/lNmiMeoKKHnMZGfBbWvVbUj?=
 =?us-ascii?Q?VYgCP0i2FlBefjywGwfGewhaE9+1Narx1L8u4q0gLodKnlNsYD6KkWXB8Htf?=
 =?us-ascii?Q?j0GLKVwfAe/iDpIV5InG1kjn2hZKsBfAucJcGDo41LFK2mL8Ir2ZU9B4K7HE?=
 =?us-ascii?Q?UfLPZqFu6c/qtLjrVtC0k3sWWOLEBEl3vbD4aLbPjw7qnoNFWvA0Y2oKzPkS?=
 =?us-ascii?Q?sk9f2lX17mWyN8POIaY51lQeZJiCRs49zlM/2TOgTK5FAyj22XfgQ9IU0gPQ?=
 =?us-ascii?Q?GZIamDqXNcYTlAGRTByHX4YAvWWVupdhcv3COAOsaxZJikSZreJJ0PEo+E6C?=
 =?us-ascii?Q?L0blKM0w684lENpAa9x/bg/IZRHUlWFUkdJinDv/OMsuaaDEiYl1AYtnsakp?=
 =?us-ascii?Q?ehX6YyTOn6XezrbOqlXp35QuzYjbSzkU62JiPYgaxLTO/X3Ub8fDtl7g5EIE?=
 =?us-ascii?Q?W2gmBMIP6FjAv7gRS2PPhFKouWZM88C+ehe6uk2ocuKK7VdFFF0itYum7xrQ?=
 =?us-ascii?Q?jO84c/xsNeZVOOJBgM4/RLpm6PmrvlKai/rE+fH7QfFn7KzkMbhOLVVNvmWv?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4FmAjZRkNmOgVB3CMi22P+wW3wUyUl4rFPsvW0SbY2U3tglCRT63yRrhgPGGrUVufTptOIf+VAyHoDh6dNSiuAAx5bWNH3kHBnIXOjfluf7tCgpDsCY1EKdOYCb4LzmbdKQmUGl2Mt5txZchaMavhP/zET3/5hyEIPhiOlNAZmaNj+jy7/vybF64ce8k1UvIFCJq9xibudzEP67ssk+20hEXBaMThBfnzTu6M+AcRaj+RsWJdFBSNvKsQaLXIupjjjL0HqhltBa5T4vQQGsjqNX1iqglbhIFEmg/f2N8uZeZggvpGsy4bOqYPVweN7viWugfBMwDaJyfXDm+z2pVY9qLpVKzQ4Xco05Ei++pyU6qv77JmRHr8RMPbzKu3ryZuLa/83fZv6lid6K9jfi0ejQHzBfeojPC2LGtovaBLN+SCr/do9vKS35suDZR+pk6n1RqAvSnnxVu8XPShmckIIGAugondocgAVLuKCcES+cD+HrpAP04NKHZEt3feeWdUMFcooSGUNnmeawfPI7aIKpvJ4+kboaHd/UG9LOUYeeMQTE46bLG4RvDXrFWiiWED66QA6Z+/Hfdacx65sGDn3TPH7kniGJm0UNlow6IOts=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbd3c68-5d3d-4f80-db34-08ddb8891cf1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:21:59.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG117tfUQ+1Ex9Xhp8XjvHV1CXV7Xk/ohp2WnAf4qDSkgF9t4C9pLwPrlfxDsKkAZ+gApOAA8qdtgGToX99GJbK91n3Z2Q0+bfwSVhAx8iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5607
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010062
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MiBTYWx0ZWRfX8lWzjhJWm/fc ZLKfJerU+z3hv7vwmZpJFmgAsnXJJshvQjgGkraFpOHgYss7RF6WeUwvtQyCe4RcDgslhqG/p1o aUq1yJ9HWHuh2SU6OlaeLNvJvzRI70fWg+h/UghK4tCWReszMI+L5q8wscPyYzstLr9BnY8gHyB
 kExqoaaRTXwe3AFvY854T4iGDjG/b9Av+uEKh84GM5yWFytDusRr6j+IXloJMIhg8ggof3wouZN yM+2DFFd7ZSx0w8FK0xVNTooXrfSzCiGHG7NtkrLE5CAAQtivLtZ+aUbTnORS70p5/f/MdtHgyn IVo5Dq3GnHIuLHys8lLd7ffZ1SvM5HVyL3F90THYzPyQgf4xu5Jstz+MRf0pcRdHKauML8Ls/dt
 D9TD4DMH//gpFpdc8NvNrBq1ridZqIpMM/vxkdvmrMi15evGt7EpxYojJmG3/QJLKxh86wml
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=6863b6cd b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=gkvgKkssCfJ_5xKbFcYA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216
X-Proofpoint-GUID: OWSV-hH_OXJ22KXDDMl5gX-TEecjDBMW
X-Proofpoint-ORIG-GUID: OWSV-hH_OXJ22KXDDMl5gX-TEecjDBMW

On Tue, Jul 01, 2025 at 10:53:08AM +0100, Ryan Roberts wrote:
> On 01/07/2025 09:51, Lorenzo Stoakes wrote:
> > On Tue, Jul 01, 2025 at 09:30:51AM +0100, Ryan Roberts wrote:
> >>>> In an ideal world we would flatten and just have mprotect_folio_pte_batch()
> >>>> return the batch size considering all the relevant PTE bits AND the
> >>>> AnonExclusive bit on the pages. IIRC one of Dev's earlier versions modified the
> >>>> core folio_pte_batch() function to also look at the AnonExclusive bit, but I
> >>>> really disliked changing that core function (I think others did too?).
> >>>
> >>> Yeah let's not change the core function.
> >>>
> >>> My suggestion is to have mprotect_folio_pte_batch() do this.
> >>>
> >>>>
> >>>> So barring that approach, we are really only left with the batch and sub-batch
> >>>> approach - although, yes, it could be abstracted more. We could maintain a
> >>>> context struct that persists across all calls to mprotect_folio_pte_batch() and
> >>>> it can use that to keep it's state to remember if we are in the middle of a
> >>>> sub-batch and decide either to call folio_pte_batch() to get a new batch, or
> >>>> call anon_exclusive_batch() to get the next sub-batch within the current batch.
> >>>> But that started to feel overly abstracted to me.
> >>>
> >>> Having this nested batch/sub-batch loop really feels worse. You just get lost in
> >>> the complexity here very easily.
> >>>
> >>> But i"m also not sure we need to maintain _that_ much state?
> >>>
> >>> We're already looping over all of the PTEs here, so abstracting _the entire
> >>> loop_ and all the sub-batch stuff to another function, that is
> >>> mprotect_folio_pte_batch() I think sensibly, so it handles this for you makes a
> >>> ton of sense.
> >>
> >> So effectively turn mprotect_folio_pte_batch() into an iterator; have a struct
> >> and a funtion to init the struct for the the number of ptes we want to iterate
> >> over, then a per iteration function that progressively returns batches?
> >
> > Is that really necessary though?
> >
> > Idea is that mprotect_folio_pte_batch() returns the nr_ptes _taking into account
> > the PAE stuff_.
>
> The issue is the efficiency. Assuming we want to keep the PTE scan contained
> within the core folio_pte_batch() function and we _don't_ want to add PAE
> awareness to that function, then we have 2 separate, independent loops; one for
> PTE scanning and the other for PAE scanning. If the first loop scans through ans
> returns 512, but then the PAE scan returns 1, we return 1. If we don't remember
> for the next time that we already determined we have a PTE batch of 512 (now
> 511) then we will rescan the 511 PTEs and potentially return 1 again due to PAE.
> Then 510, then 509...

Hm really?

The idea is mprotect_folio_pte_batch() would look ahead and determine the
PAE/non-PAE sub-batch and return this nr_pages. It'd check 'this page is PAE, so
when's the next page that is not/hit max_nr_pages?'

So that'd be 1 in the first case.

Then you loop around and go again, and this time it'd check 'this page is !PAE,
so when's the next page that is/hit max_nr_pages?' and then it'd return 511.

A better example I think is e.g. if we had, for the sake argument, it return 16,
16, 480.

Then we scan ahead 16, set nr_ptes = 16, process 16 PTEs. Then the same again,
then the same again only for 480 PTEs.

Each time we set nr_ptes = the sub-batch size.

So I don't think we'll see O(n^2) here?

It would be like:

	do {
		/* now returns sub-batch count */
		nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
				   max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);

		... rest of logic remains roughly the same ...
	} while (...);

I may be being naive here in some way?

>
> That feels inefficient to me. So I'd much rather just remember that we have a
> batch of 512, then split into sub batches as needed for PAE compliance. Then we
> only scan each PTE once and each struct page once.
>
> But to achieve this, we either need to merge the 2 loops or we need to carry
> state across function calls (i.e. like an iterator).
>
> >
> > Would this break anything?
>
> It's not about breaking anything, it's about scanning efficiently. Perhaps you
> don't think it's worth worrying about in practice?

The question re: breaking was - if we re-do things like getting oldpte, ptent,
etc. on each sub-batch does _that_ break anything?


The current implementation is not acceptable on the basis of adding a horrible
level of complexity. That function is already terrible, and adding an inner loop
for this batch special casing with _sub batches_ to account for PAE- nobody is
going to understand what's going on.

	do {
		if (...) {
			while (...) {
				help!!!


We can do better, and I'm going to go further and say - this series _has_ to do
better, because I can't accept that, however we do it.

I want the efficiency gainz as much as you guys but I"m convinced we can do it
without causing eye bleeding confusion...

>
> >
> > We might need to pass a flag to say 'don't account for this' for prot numa case.
>
> Yep, another bool ;-)

Yeah... but we can't sensibly add a flag for this so the flag idea doesn't fly
for that either... :>)

I mean I don't think we actually need that flag, let it skip the sub-batch size
then check again. Now that, I reckon, is a small overhead.

>
> >
> >>
> >> Then we just have a simple loop here that gets the next batch and processes it?
>

Another advantage of doing things this way is we can actually add a comment
explaining the sub-batch size.

Right now there's just absolutely _nothing_ and it's entirely unclear what on
earth is going on.
