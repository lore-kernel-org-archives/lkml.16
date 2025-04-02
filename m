Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE81121ABC3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589206; cv=fail; b=K2dXn/ipOEhakZkMBslvZgDFFXEah5JkPaDr5erYcjk1di4qSDZ5UoZ6qopsqsXEmSxlhgAvdc3pbcjZfOxWGV3uN90HkHQbklyjzZ84w6hms5xiSqpCEFbe6WGD2Oog1ai7UNkIsoDHd90wNDqeemp4OWJADfCAZgVOuGGl/S0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589206; c=relaxed/simple;
	bh=bkfXXJ0TuwPkLth1iMMsn+gPzTNJNaAOqKzb9FOWW/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=no2CLDvaHfRtApY4uRWjJ9GasIe4zrV73qEmCszZ84p6H+AD6DyjBHGT3G53pp+RoF6niR+2iLVH/IjtpNSP4rfpo75ynz97hugf/7MnuWtl3eMySOAVtUck34EtC5Zgkvm+M4JnmALZRnc0S6T1m1ZLZU6MsKDJUritfeOSPXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TtL5K7FB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ia8ZgVoF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TtL5K7FB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ia8ZgVoF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326fvet009445;
	Wed, 2 Apr 2025 10:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=xlK64yDCMIXdyPzDNL
	2lWqTeARWm5Y0LiZcvL1Cy6gQ=; b=TtL5K7FBDr1WZhkFpHkHAnOdxsqN2LKBS4
	k/CxzZXSE2I6XYYrqn6lvBMPZBHZftOZrUXA6AakZ/h4NrnCddrdNUUOr0Bxm22v
	XyQZyUqUtTkTWXPzjObP10DmjT/BpBW+bkH0BCEb/zEewaycTL5/yE6h7hnx55MY
	6QE34Fbi/DIGOVeJVY+YyMgOxMIR99XdvYI4QNYMEXepvC534fvu0bgX4lIjMS3N
	W57RCAXKPES7LrwGzECmlzoruzqOTdchIemTIfLNTiqXSAWvpuyFIS0GjHwjs/bp
	J0DQ8F67mSQI6r652KT1gitSc3RRxEhnMrAa44pwc0JaukuLwGTQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8wcjhyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 10:19:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532AFrU7004270;
	Wed, 2 Apr 2025 10:19:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aaqt5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 10:19:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiP6eP8IN/CWkWJGTz34EZnAq08nyFcMPkGpYI3oz3CCKf0hwgugnA1alTuzHQQXwL2V5w1Vi2U/mfAuPyWMUv2CZqNU5/Kx2hDm5Dhc+5l3W2zds+O7s5QO5u8lmWSaB9Iy+r7mHH/Ye40c8U/s+SniQgrx1CETsTjgnGfkynPH/lC+bzW9jN7CLIKTVH+jGfW+ym8yj/H5zOEwaTF9CN0pd9H9hFRbkI9pdPn4GmFG/uWhJfqVGxbZ6BnmOStWRvAE/qPy1Ti9tVSUcv4J97ODFJUE2ZqLSY845JgnwECA/srfvGEZNJy9AdbjgDjxKsh6erPLidZRtXTafry//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlK64yDCMIXdyPzDNL2lWqTeARWm5Y0LiZcvL1Cy6gQ=;
 b=q6QanLyK0Jv0LiK7ombz3ML7tN1hKOqRNiptI93DakoICs0iT8oSC/zMu+9vA7nJK3lKzPK1ZSmD7f/Xdiz3n5q7qzApO7EWGz4WyvyaeFNYjsCVEykg0WGuFpS7Bg+8PbrRGimNQgU37M+b2Tt1cZWjuu4haQwblDzC/8glfmraG7f380MrWIjglr6ImjAy2Sjq39fx0xH13Z1FmXm6c7ET5jEleOrFopj3yMFNYQ2MrFuiUrMDSFhPJoeA1L9+ITHl4jTbWU2FGiomlcU1O9u+u/evFmt9PjwP+OCicmf8S53/bCEHLQrZmWivGHxBBxbwKCjE/cu5CRUrepOANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlK64yDCMIXdyPzDNL2lWqTeARWm5Y0LiZcvL1Cy6gQ=;
 b=ia8ZgVoFC8omtz+wK9LfNojgwtUQBfu0bODPTBwxku4yAqFjVVBTAx8paaGX684HLGqiWdZprJBwXSVI2j/dRnciNwKvemMC/xQJdeWP9t5gBcDAsirLPbiCKI8FVsiek/dV526MnfRdRND0TZrEG+1R3NUHyMtU+tKC9E7V+QM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5585.namprd10.prod.outlook.com (2603:10b6:303:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 10:19:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 10:19:50 +0000
Date: Wed, 2 Apr 2025 11:19:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] general protection fault in sys_mremap
Message-ID: <5598853a-8f04-4bcc-8e45-984bd8556372@lucifer.local>
References: <67ec7e14.050a0220.31979b.0030.GAE@google.com>
 <67ed0af0.050a0220.31979b.0041.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ed0af0.050a0220.31979b.0041.GAE@google.com>
X-ClientProxiedBy: LO6P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: d9641bba-4a7a-41c2-3d07-08dd71cfe6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iJZ6FZdUjnJJzY67Kx1hxf8Wc1/6VaGcGUHqqcOWaQ07vIBcLyFEAdndYPZJ?=
 =?us-ascii?Q?6sI12l65g+YmsjBq7T91UKsR8LTpjo2Qi5/RjfMwcBAzIBv5s9NygIg9vrmj?=
 =?us-ascii?Q?ETh2Jp8QINIbviEdCm4xdkgSvEslUK/GdayB4fkUG1FQ278hXveBkn/0FUbk?=
 =?us-ascii?Q?BS3Pn4fJc5wrrZMvhmhJiwWw0dNJzqItYYKB3seixqp8m0nsZh34yDoWeZID?=
 =?us-ascii?Q?CipW9+Gc6FnV5vGerXNcSEr4Y+hZXnF7J8B+CNU9oOMverkHL6+2zj/pxdHl?=
 =?us-ascii?Q?tbJhHJAN+H5OoDdpuSc0wUhGR0zr54Kfw/EHmyO3AJtn1csASQKNk0nNBsb2?=
 =?us-ascii?Q?UzG+ErScqUlEgfLiJ+MXUQHf4HjNO1q/ek08MmvCdHlvCpc/2JGee8PDlcIV?=
 =?us-ascii?Q?xLDAA6AKKiOR0W7rPFWhCWaXFwyWw+VQonuUTK5++zD8wFCbyKP/Q7IkJfz+?=
 =?us-ascii?Q?Rw7c+mKO4RTDi+s+7O5l/CvbvgoDfaSg/HxVK+iFE7r4n+uLOBlosqOkuyZx?=
 =?us-ascii?Q?Zw0YrQojo2fmb3IARygURXKA1szpSwT3H05s3eFxV8BtI1d+uZ+RyVCtktbx?=
 =?us-ascii?Q?w6dbhjwe/XJR4gHZEaA4TyUilSmR7gmhDWyPhyY/m1baZs2yc+XzYYW24Oi6?=
 =?us-ascii?Q?cTGFrNbGGwz/gtqDZiT3SYKhcxMPxSJp5jvICWkBpLV3rR1kUiBmTY/i/kT7?=
 =?us-ascii?Q?eh/aUFJVoikOo2Fw9sULujAR3igR1Mv6RccSyqXMDIOp0OIo1aeMwc+OaEKv?=
 =?us-ascii?Q?FBPNBgWqzoSJWzoDY4V4XWHSaho9N9q2qdqDjyCcG3M2xiEOjCRs4gcnAErR?=
 =?us-ascii?Q?qqUc441Ttfzsm2oKCLD0t63Fph3sCdzJDgrLDlzZKpe1s3Q+7AX3+DTbIWB5?=
 =?us-ascii?Q?911+6jQAuSw4Xc2WRgiYhNkHkV0sJXTRhvO5IjA4W1Nt9g3T2OvJkO1Kz2Jl?=
 =?us-ascii?Q?bOvRJcb+ayC1Isf0uFslN2VhfpQrBVwe4JYIOD9PfAi/gnizn84LrgEoTBgu?=
 =?us-ascii?Q?nrlNoX6E4YYMUqHiBWsvcwRLCi5MiFbGFRbrScNv9AxRVqdjH91tKtEdh2x0?=
 =?us-ascii?Q?VOjIORKQjFnTKLnIYYPGBX0KwvN7Yblqw4dh89r1xN582qNgQ6YMezJnF+Yw?=
 =?us-ascii?Q?/A05c1LpXrD/J6E7jVklnXdCjeGAYfrTUW3e3G15HukIu6G3AQbJzTmJhsvj?=
 =?us-ascii?Q?OSEtmgu44c9DOR+Q8AM4LhHgFfm0cEx/N/8rOSXA17zCY732/OSSYAlXPUMP?=
 =?us-ascii?Q?QBKbrxBXzq4SMPD67ZR/lC8Jt6CxPV5bRmaiuUbmy/gJBABIbNa93uL3n3M3?=
 =?us-ascii?Q?lJpOy4ETExlD4qi6aqP13sjcr78MP10BhA0Kij776RrgkQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MxWCxIEZ6mBZC1SY5ckDWXqpTkS4BH0ADjd8lOd3EHPOUq878O9jM6Ze1YB3?=
 =?us-ascii?Q?FoRwt4qFCM4r0p6X1ltKS1bRKtH6p0JAqcp10EmwgRfekKiCw6E50c0oorgR?=
 =?us-ascii?Q?tvY3fzcJ5q0dz2cbppji7YwrOUKdBkT2ESS3MrFiAJXGZoTlVhloA6hHx6Oz?=
 =?us-ascii?Q?Jw2NRMpJ3hXX0IM1yTvkHB0XV422C2dIaEXnvkPuxk7nqVz3I2mySQXpIeAf?=
 =?us-ascii?Q?jOC9VcTVSmRrU/eeBeHGdh1P+OSSDy/Kp4pOet3RyYCrSw7g6tFLynkq+5Am?=
 =?us-ascii?Q?gmI5bnOxbFlIMikSMrZdqoVHcK7zHvFpZUwz0UWU6J6yZICXyBU3IS8jkBJF?=
 =?us-ascii?Q?s3Cocrgm/u/Suv1h01qjksoqM/7y+bHr27HTFCU5zcUIo3LaDXQiB8RUdp0v?=
 =?us-ascii?Q?5e6wOblkV/GMTBRWFO+yx09rpxJZ2RoB8N/Ria+VP4Zv18dZs6n3x0tLZ01u?=
 =?us-ascii?Q?ld4U5p+Gfd4JPUC3HdQcnKJ2CSDPo7vb9pfJF/X/LuSJKDRd5BvfzAhtwno1?=
 =?us-ascii?Q?la3oQLS+xbvpIN3nJGnv5VNYDRa+w3b27jal1h4FxC3f/p3Fo/FVbLcq5748?=
 =?us-ascii?Q?BDIctE/eBzdR87FK2kyoW4A5nrcNY1RkkvZ5Q8Qvj0a4GMY67upi3YZamSTG?=
 =?us-ascii?Q?U4nA7LGFNVobSvNchek0uxh6seJoghXCmpUHo9831nov4I7dWdC+l93HIQe9?=
 =?us-ascii?Q?maU94yQz6z77QjOcGImDYpbi1NIv8gQrRJ5e11ZOM8fnfV/q2oCJU2tn9xnc?=
 =?us-ascii?Q?K083vquI8Q3iaEP6qnOTuNMZQEhcsfn9he5GyzApWzN+JGhdSm2Epz/1XOMn?=
 =?us-ascii?Q?mGLhKDw42lOCIg96f8TeisCq2YvjpnmZq+CCVRfzyBf7zK4HT6BEedQ8XnmX?=
 =?us-ascii?Q?EHRNln7jLkBgrRZMR1+F5dVct8v4dmob/SQSuqaSOGCHZG4QtRjv1NFkJE+z?=
 =?us-ascii?Q?vbcqRT1DgMlpe8J5qJky/NRFSJL2hZhL5qsipUE4wW1qEMkFc53nJrvCeUF5?=
 =?us-ascii?Q?Th0+uhjQMk2L6qWJuqIQO8y9jf42I0B2d2+NZRZzNGpmzi+HWIXTvhm7HZf4?=
 =?us-ascii?Q?Mk8amV62eKev50h6ly1WL7FzcVtBKc+pXEdSs0d9B9200D79JWIwEI8PYXSg?=
 =?us-ascii?Q?PSGD2wy38hqL8fBqISB/Fe8A7x1B1WuRUMPw70wU1DceWpnC4A18TTc3xM1l?=
 =?us-ascii?Q?1FnXvM6XCZRAoCJM7DaFG1dgZnDlVyb6YoTftvEaW7dSzDDjAuFoxQbmp8IF?=
 =?us-ascii?Q?qmd6lvrXRQK7S4NLSOEGrxCLA8B459EV+DYdMfHA36WU0UOLAC7wA8IH4c5i?=
 =?us-ascii?Q?ZvFH8CJ3TOR1p/2ZB55UIF0n3aTBGbl6KYBh5V73T+4/7CkNXJhMWGUhBmCe?=
 =?us-ascii?Q?/m2Hq9fna/yprZR1R+xQbeX1wrMttNx6bofAPa0vm2/mr0OMAwEEEUSNios8?=
 =?us-ascii?Q?57Qjf12XJG0kwaFdHidO2RFp3Jg0iyVP/gwLl6KUY/pcJ8EO3ExQkKkV1MjT?=
 =?us-ascii?Q?fGopjKE7HldrYV5pNZPvOJChyf7Yh6KwVkOwDRmLdr6jl4GyiKOqfOZ8Oy70?=
 =?us-ascii?Q?tVvMe2MUWIYcSwhJyBVd8IY7NWusz92kG+2cYCTVUa2Q5ITUBwq5IuFnTqjs?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nF8NjcygVGzFVQ2/1M6ST9yPm7WhgCnpqgI4rnYlpQYsiwYeKUX1823ComRztbRzDFhLqJsIvROMaChd/L75S72AsM3k09VrCjP9fpidAHeECSmWa8h/Bfn1veT/KA7gO4X97vK1OF/alUJFwf8+NmDM8clTClPCYDNfeJKH54g0v8t70qelq54IIogh/S6NbI8kO5CxyRbTpqAx1AQEqruRGNt9Wnk2a27pB3paTp6ai+bW+T/83iGm6pCd+nGWhtmguHGZOUw0t3qGZD43rBNTQ79e/Oie/G5k9t0bzMXDnESoqsEjwgnhav1O4gMhKrx2XcghSobijNE3h/x5YGPwnIc4urj7Sq99qv1R4nUO67yj8fq+8dzJVDOoNgMrP531MK+LBKuuEM+n8WaudWPL4Zl5YWKP8OfV/EGe7F9aOeuEBX+aoPWt10FaM1K0jrnJjtY/tZ+8rMduXMC7rIQbz9//2vG8h+pZdyJmnFnA6WzUgoTYvIJyGttrw5Va1Z6i/P9AfpyUyXOF86hNKwKCaXdjQDG6o7+QIO4IkG20c955L0vI/KNhcMX7Jce5TRUR+YPBNqgIN5O89aI/eD/N36dm4VBDPa6UegHyERQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9641bba-4a7a-41c2-3d07-08dd71cfe6d1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:19:50.3354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIDKxkHEEMovMRlhjHgZpOr4VLErTMvXxyf/lwsepbR3kE7kZMZt62Q6MAMOSEdXZJZbhBAM9bovRSs2tfXVBAg+erZUlx0R60cG7sxmL0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5585
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020065
X-Proofpoint-GUID: XP7laoyG4ZZR4mXDnrdutLEd_zOFOt8K
X-Proofpoint-ORIG-GUID: XP7laoyG4ZZR4mXDnrdutLEd_zOFOt8K

Hi,

This is already addressed in
https://lore.kernel.org/linux-mm/b2fb6b9c-376d-4e9b-905e-26d847fd3865@lucifer.local/
this just doesn't exist in -next/upstream yet.

I _think_ we may be doing a 2nd PR for mm? But if not it'll be fixed in an
early rc.

To make the point, friendly bot - let's have you try out the fix:

#syz test: git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-stable

Thanks, Lorenzo

On Wed, Apr 02, 2025 at 03:01:20AM -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    acc4d5ff0b61 Merge tag 'net-6.15-rc0' of git://git.kernel...
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=16719404580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=24f9c4330e7c0609
> dashboard link: https://syzkaller.appspot.com/bug?extid=e3385f43b2897a19be24
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175a4fb0580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1687b7b0580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/e4bfa652b34a/disk-acc4d5ff.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/3d19beb8bb92/vmlinux-acc4d5ff.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/e7298ccc6331/bzImage-acc4d5ff.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com
>
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> CPU: 0 UID: 0 PID: 5840 Comm: syz-executor163 Not tainted 6.14.0-syzkaller-12456-gacc4d5ff0b61 #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> RIP: 0010:__do_sys_mremap mm/mremap.c:1784 [inline]
> RIP: 0010:__se_sys_mremap+0x25fa/0x2c00 mm/mremap.c:1752
> Code: c0 0f 85 0e 05 00 00 0f b6 9c 24 20 03 00 00 31 ff 89 de e8 d8 0d ab ff 85 db 0f 84 7b 01 00 00 e8 cb 0a ab ff e9 9e 00 00 00 <80> 78 04 00 74 0a bf 20 00 00 00 e8 26 2f 15 00 4c 8b 34 25 20 00
> RSP: 0018:ffffc900040cfb40 EFLAGS: 00010246
> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff92000819fca
> RDX: 0000000000000000 RSI: 0000000010000000 RDI: 0000000000000000
> RBP: ffffc900040cff00 R08: ffffffff821d1f24 R09: ffffffff8c271397
> R10: 0000000000000004 R11: ffff888034658000 R12: 0000200000000000
> R13: ffff888077fac000 R14: 00000000180000fa R15: ffffc900040cfcd0
> FS:  0000555571cf3380(0000) GS:ffff888124f99000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00002000000000c0 CR3: 00000000316de000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f4480ba0369
> Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff6c642778 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f4480ba0369
> RDX: 0000000000004000 RSI: 0000000000001000 RDI: 0000200000000000
> RBP: 0000200000001000 R08: 0000200000001000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
> R13: 00007fff6c642958 R14: 0000000000000001 R15: 0000000000000001
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> RIP: 0010:__do_sys_mremap mm/mremap.c:1784 [inline]
> RIP: 0010:__se_sys_mremap+0x25fa/0x2c00 mm/mremap.c:1752
> Code: c0 0f 85 0e 05 00 00 0f b6 9c 24 20 03 00 00 31 ff 89 de e8 d8 0d ab ff 85 db 0f 84 7b 01 00 00 e8 cb 0a ab ff e9 9e 00 00 00 <80> 78 04 00 74 0a bf 20 00 00 00 e8 26 2f 15 00 4c 8b 34 25 20 00
> RSP: 0018:ffffc900040cfb40 EFLAGS: 00010246
> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff92000819fca
> RDX: 0000000000000000 RSI: 0000000010000000 RDI: 0000000000000000
> RBP: ffffc900040cff00 R08: ffffffff821d1f24 R09: ffffffff8c271397
> R10: 0000000000000004 R11: ffff888034658000 R12: 0000200000000000
> R13: ffff888077fac000 R14: 00000000180000fa R15: ffffc900040cfcd0
> FS:  0000555571cf3380(0000) GS:ffff888124f99000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00002000000000c0 CR3: 00000000316de000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> ----------------
> Code disassembly (best guess), 1 bytes skipped:
>    0:	0f 85 0e 05 00 00    	jne    0x514
>    6:	0f b6 9c 24 20 03 00 	movzbl 0x320(%rsp),%ebx
>    d:	00
>    e:	31 ff                	xor    %edi,%edi
>   10:	89 de                	mov    %ebx,%esi
>   12:	e8 d8 0d ab ff       	call   0xffab0def
>   17:	85 db                	test   %ebx,%ebx
>   19:	0f 84 7b 01 00 00    	je     0x19a
>   1f:	e8 cb 0a ab ff       	call   0xffab0aef
>   24:	e9 9e 00 00 00       	jmp    0xc7
> * 29:	80 78 04 00          	cmpb   $0x0,0x4(%rax) <-- trapping instruction
>   2d:	74 0a                	je     0x39
>   2f:	bf 20 00 00 00       	mov    $0x20,%edi
>   34:	e8 26 2f 15 00       	call   0x152f5f
>   39:	4c                   	rex.WR
>   3a:	8b                   	.byte 0x8b
>   3b:	34 25                	xor    $0x25,%al
>   3d:	20 00                	and    %al,(%rax)
>
>
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
