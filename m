Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A11B4121
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547276; cv=fail; b=Z98hrCwyEdeNT0Or0+Tw9hFywnbHYTO0rSfKQSWQMlHFYGOJGOUQ7YtH2WQA+GYJuPzOkxkb8OUyuPQ2Oum+yiDb1uXs6yimCgRPnXMlHMely9iYiGRttdf0H2kCBwTit44bcrgIpSMTKghnTDQUCpQv4sAz74AKn3rQqmBfXH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547276; c=relaxed/simple;
	bh=+rzQ0kELdUnVz6fS5jLDVWEXAFBgLOFSdERnsMrzGFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NKTdQ/HXxupPkEJLzAHNAtfA7a0QcWJ6Isg3Jf9i5G92Ff98htH4q8WfBKAQ0MeYVYeCKlJRMsds1Be4L4yq63d0rvhGBU/VCU/s3nxykfBKd9rLfvJeFf0dP3h19GdfqfsFCmLKwkGpM5ewyhYmy303GwokuhPQTSrS7qKwQ7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EOsuK6Jb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hqJJ7I0e; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EOsuK6Jb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hqJJ7I0e"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546FJarC023902;
	Tue, 6 May 2025 16:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Z8UQ1wh6evKagEU2ay
	EY8tq/N/fru6IAHB6tRhe7zkY=; b=EOsuK6Jb9vpwmyXdCRLEN3x/WBzCa4DLUj
	n2BDRrJatJES/19eI/aT8QbRDEF2fIXaHSIhnciHo8Wma3OGf6v3/Q29UgEvcppI
	cePe1m6kUizgBmApQoS7LsXefIUEmJUKhZLMlnA5QJ0nzU48xQkdZO6EFDYgrbxU
	ugZFEYo5NwbXSTOrAHjRC8jRWjMefpAiTzjGZTmXkMIW4SoRmm41FSW3TaAkpNAH
	e41iHeQKXeokJfYeUFShiNa0gMVCUxV0vI8n+36S0chcxMgQjb01C4ktsErk3AHf
	g07xbysO89oDIUaZa5CxaOiDBY0rGu1KH7Wl97e4fQmGL2WzBTOQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fmyd04mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 16:00:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546Fxqg3035432;
	Tue, 6 May 2025 16:00:48 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013079.outbound.protection.outlook.com [40.93.6.79])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kffmw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 16:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgsq+IS0KdZFF/MojZgGseDvBb42ZVO+D8pd/wDXIuOQcja1UZRtP/52wKDzwcrziUyElrFOxg4rJfj4KRXLrMyIAnPqZ3m0NZfBFy6zJ3fnnHyUMP69Lj60bP+Kn+S8Q2efIBItI8tfNzVKg2g9DlnD2XtA7M+k+fsRFgm1w0FRzOO1/yAwwvdpptb/C5JT5xYGEqm1/PSKFT7PYZB6ZzWhtUKe4h/7JRPYzGh+wSe+S2FQzCVcPpkDz+9750xcMLXOaZlq7gKVflWjUaNQsqGAOrAt6IaUcOQgw0Uu8WEOyzJlZCEv5YI4OFYQM9yWJvkT16CNjdvThYVo4yZrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8UQ1wh6evKagEU2ayEY8tq/N/fru6IAHB6tRhe7zkY=;
 b=OhuQo2I7AT3LQv/9aqZDWJqcHK0ampE5BJvpisiWjuSQ3uXWN0tJNVLCaDEF5tNwxJGp6FBwiRmA0F/CAXcBb7w5M/aj2/WxWdvHUU8NLJMYNOVkAxGHK9UUgFKaBq3bIKRA/sVa2r2AceJoRbui1ftreRX+KD9f0PIlQ0tsKdRgTvxXQimoFU+Qq3ifNcbTKjOZ8yo9MHuEHsc0V4f6vpV5zp6wgOL8rzA385dd+pDRuCrdQh8sygr9uG7v73GXZpXlGhBRZR/coBH3cC2Zim0lK43usPwG1mv6SjTfecdhYyQ6cEitfNco2A6g/j371BZejclMUcVUb/V3WWsN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8UQ1wh6evKagEU2ayEY8tq/N/fru6IAHB6tRhe7zkY=;
 b=hqJJ7I0eGo7F3ihZ5h2v7974OQT8Ak771VLuSwfwh2+AAZb9gdpjBGdbrTUkqnq8LtIFDcbaanzLrqqJ/+GimNqELdMicdrE2/K03GBjhMM4yHveTeAjRCuBIuz3hOKHC4dyC5SB6KV+Cxv0XBPP/7MKhBRDDDuhUYR/xhr5jnI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CY8PR10MB6561.namprd10.prod.outlook.com (2603:10b6:930:5b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.29; Tue, 6 May
 2025 16:00:41 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 16:00:40 +0000
Date: Tue, 6 May 2025 12:00:37 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Ignacio.MorenoGonzalez@kuka.com
Cc: lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
        yang@os.amperecomputing.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 2/2] mm: madvise: no-op for MADV_NOHUGEPAGE if THP is
 disabled
Message-ID: <qpqhkheqdzkzh2q2y4kx7ztoz73vi337mv4osmuc5wpzsif4cm@mrrvn4ivnv4w>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ignacio.MorenoGonzalez@kuka.com, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, 
	yang@os.amperecomputing.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>
References: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-0-f11f0c794872@kuka.com>
 <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-2-f11f0c794872@kuka.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-2-f11f0c794872@kuka.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQZPR01CA0174.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::23) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CY8PR10MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b000b9-9703-4f46-09a5-08dd8cb725f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i+FmQ+6YiGfUietBLzEomCw0X+iH8l0UIa9nWzivFFovGcYB/55K1eIbN9gG?=
 =?us-ascii?Q?6RonKo9eBS1YC2FpNnggHrQav+x4cIM+uxCAXLBFFCIPVqVpbpMoFWLmMgmC?=
 =?us-ascii?Q?iiMeGmrdG7UjYmrjpQWQ4EKTtqtOskcvTOVZ3Yl8YCaTFwmZxPBZzrAtBM+U?=
 =?us-ascii?Q?jpefkNmJeOgOixTbH6eVZKfNadm+uhBs8+kj1IcNglrwu2TQ3YPVKimvI7im?=
 =?us-ascii?Q?9+IjMIKTK1/zwsRJl1sRLQYt8KMBwDID/WH5o9zLxJKndr8yRwJ4GMYSCGTm?=
 =?us-ascii?Q?7nUT0coLBmqx7+4OTb+dvnODjBCSDNC5c4ZN6+GrOFvSfRou9CeXty6fJ1PK?=
 =?us-ascii?Q?86mpYJ95/DLl2aNi9ycuM/N+NjOkZZvfWryMJqpVCpOv8fEbw4hDusQ9QZUY?=
 =?us-ascii?Q?iSnxf38W3zj6UPuZTfnuE5qs8Jat9f2bNY65GDb7l/b0Vpj3g92eveUk1yK3?=
 =?us-ascii?Q?zyPmiaof/Mc7JtIf8pg9eGmI0CXBN481vP/+/RijmNASSEqVknk/hw1/r7sn?=
 =?us-ascii?Q?8QC3IvNmkL5+eqa8uhA0vGpZgOrJUZDIsbHxEdDQJ7JtFFcuslEuXx9wSG2v?=
 =?us-ascii?Q?pUKxgs6uxjlsGrzFvK6iMsUaX8WAcp3KW8bOzx17kfwQrtA2Yb+8ILSsGD9l?=
 =?us-ascii?Q?GuVQmlwGY1fhP4KIEpbnos+n6jahunfcAfgTS44A8ZYr74YdsycgXqt+qP0z?=
 =?us-ascii?Q?h4bFryT/YHYVqBiRPBk6GswiAOqdAQQxlYQqDEYAFrFO/qUZx9AFlIGwQcNW?=
 =?us-ascii?Q?YDZwDoexj1OJUm/Sk5kmliM/XyFg+BNvb9ydShKeCBCkNuALQytjXHdA29zu?=
 =?us-ascii?Q?6S2RWmOUweCmlnrK9syDhBe8LNKa9QlM6Ub3OxuWUxCrNEtjvdk+cEw81HND?=
 =?us-ascii?Q?sZPMHGEMdos4PB0H5jTtspZXy4amr89V6ESQIvcY9gZgN/uZRgQvOOMQE/U7?=
 =?us-ascii?Q?VLumMiT42AISZRasOOC+KjgQgiznLnCmxHlNp+TBKeq9zrk5/SmPx8dpeVKE?=
 =?us-ascii?Q?hvekmQJULvupGDJxqWzareIS2M3Zeld15qKF6Pq9dMpOjzayQiF3rNv7tNJB?=
 =?us-ascii?Q?3vj0BZVBilncmS3KkecsxbnwUCEU0JWTMsgQ2UoelFJXcfPsfC7/VFAi1niz?=
 =?us-ascii?Q?HJgCKp5Hw/FDwzj+oGvS0TbPIQTqBdJQfvXt13SiGZfaPVlbfVa0bFTZDgsP?=
 =?us-ascii?Q?tVgREOzYBQmsZ2iZ+M4JkXIHrNMCCE+YQKf/f2XLwMilV3Np/NJCwhUkVKLv?=
 =?us-ascii?Q?06yjEOsMiMQHZ9jkxGzXezAMryMqIbkAh5p2YnHn6/aA1uO87wD1qSd8G12O?=
 =?us-ascii?Q?OtuOe2+gYQ4X/+1vfB3jQsFhmMdTpqRe3INSyjOuqDap+++tbAimFoZ0Uhse?=
 =?us-ascii?Q?s/kRX3Q3EjMss4y5IlVPShCoQz8v8mD9EhSGsumhIG0OmdHpYTVbWYxVKA7Q?=
 =?us-ascii?Q?VlLFMX3NDqo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7BsdIQyBrlFjBiuckRQEGx6vEq97/1WazcgtoweucTyL5N9P9QLIC+AbXh04?=
 =?us-ascii?Q?S6ZrwpeCue7g9bF3iAfOzL6ubTvhV7jlQ0m3lx683ICOWPjByxf+8EdAByWx?=
 =?us-ascii?Q?q7b169JF85B+tLqiSLPlyqxb8bOY1EOhHcXk6UqgpyEbIrxp/AFy4H875sqF?=
 =?us-ascii?Q?hVwA6cTBjJLkMADxlFDvU1eTvzXU5AZfPfBWvWXMtg2Li1Cqx7lQEDX49Ib/?=
 =?us-ascii?Q?gwj2jIKT/zA0julfubTk1/Rs7S43ZhOtm8ShRTblVJrAT5qMd3QJRmExAZNe?=
 =?us-ascii?Q?9tobK01vf//6n1mxI0Cd6owaI/jv4aP7S5IYb4LtlluPHtKtZozqBiohGBH3?=
 =?us-ascii?Q?xJAGvCvarr341YC0y3CutIMp52I2ze8meDBIGIs2QePgff4YUpbY76WVDpn2?=
 =?us-ascii?Q?JrU3zIaSozCLdimxeVc+/x72HXrrq2Lia7YxFgnWSNedxJ1owa7Yek/3NX6u?=
 =?us-ascii?Q?I24wN/dCAde1QzWs4v/kkGMVamXAYv5oQBOd5+rvbwjgrsRR4pGtZqoXEUfD?=
 =?us-ascii?Q?qmQ5iNp7GJn/oTDBFSAfCOMliSr0DTUlhMQl+rD+DNp+rFSQ62M8TLD7NpNI?=
 =?us-ascii?Q?4i92UFS9pD6Zv9HGx1H5eTjPq41TZ9oO8ixXq7amZ8mg0MxV0GWnbqpDRBkK?=
 =?us-ascii?Q?mCAY4ciGQSG1IdKZtNJbWhuhhKJwBkJA6nryrppOZjE2tG1QgwJNEAmgiyx2?=
 =?us-ascii?Q?8yMrXw98yRfdSUIDnRt2KG02OYk5+s5jUHX5htwNzANyyQKUT+gkLxIWZCBY?=
 =?us-ascii?Q?cU1m8dWnfG+ZugTmNhlEKiGravPAbmDttm80Bm70Gs2Gg3tPcFUjV2ta6/ee?=
 =?us-ascii?Q?ALEr3P2eLWLzNYTPN89HDf1qke0LSUlUCxiTHkoSnrKOCd/nLxnVUkZz1jlY?=
 =?us-ascii?Q?MJm7ztawj5fBqMwC7qGvS3n2KUKfOqDYn0X3D6negIU7KZC6YhHfu66TW9IK?=
 =?us-ascii?Q?pTeTtjyWCCdNyTfUPSOVvOBHGfmu6PP4iX7RAbDZBSc2oVlwexmFLP8zA/td?=
 =?us-ascii?Q?5gh8UmCCSNtXXOE8DqGsYry+UmEjRRSMD4iR4Wb/qqze31lfKaUzEXDnyI9E?=
 =?us-ascii?Q?AYQvht3WKKxM+e+F4t/8NtCoJ/njHuRbNMS0FSKgQPCwQ4xKJ25YKCYczNUM?=
 =?us-ascii?Q?fXeU7rlmCxVDcy7//4XKJeSCVjrk8paI/PoVhQ6/BD0tcmI1PAAgeKUIvzjA?=
 =?us-ascii?Q?lR69EFkW98j8yg9Ao4zmA+Ap298nV0dOO3JByMfNuD3n3B8QlE9LkpyOnq/n?=
 =?us-ascii?Q?76XyhF9zM+J2zQux9vrC807V+PbF8BNVAMYyl9CLipgwxH2eF2uLrF5PjV65?=
 =?us-ascii?Q?7o/STjAYtQD3N/SlNdVgsdmEptnlg3L1Nq7JMtY1CtqK4h2g4R1a6Vk2pbKt?=
 =?us-ascii?Q?OxIknrmsVyKlKh7DkyRcS9mVre3gJxozH+gTUsKVxVOvZe3oU/LNcgTa13Tr?=
 =?us-ascii?Q?luthjkig4cyc92CoBUtX5ReJY2jnCivEKvjv/OXJ8dyB7v3jChie77f+YdCh?=
 =?us-ascii?Q?hlCliH7scbDVCOyydonwYe8B5qMrVs+EwIOx/NMELSnLat1xozBqV9U/uz5V?=
 =?us-ascii?Q?VEFme1WhmNtqo/cpdeVIGDAz6KUPiMQxGwWhiKHh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GlYRsvVMmlEOrn9H72+MI24reoVMcIB5E4xzK5BEQbql0t7rsDaGyybjE4QwOUUXS343m2xM+QjT0SRkqg7phwJBG2dWJRNNq0YCBcw8+pzefqitgm3x7/Sd1nD9p+nh5xgkORwHnxk2+0VUtttgamB7RI8SUbdiirIROsuqibKQGWLJMeykbfro7yN6tnflvdEsDywYAsneaZBD0rze9viY7LdH+2ORkRMBDvJmbeUp7mNcsqpZ/rdf5FoGym5GT9ip1Z3PusX7arovKV3mCWximnBiKwfCOxQMqkitgtdGsAIteWMaSx3SNJ0HVicqkOie2W4hndD9O2TaJpEriC58gKQqmAev/nlTecSwh1uh2rO3r00+MxH3uRKz8Z/X9ZB2fJWc5S3/fvn3e0KYN4Q3S/1xqzBIcHicHRjjeii7EYooTppE0DQJ/mfiS0L1b3z5e19h1zsPG1Jemu2hzWI3PqB2nYow7+I/ErUqcqfwohtY2hcjIvvXMJXKUVDYgNGA//ncMi+MIZyIYMZSMvBt4hYMfdEv4rh7pH2shnnxIx82IDDXpDlDtEjg95TAFkBMDdDyiir8Bqh1tXEfH9n0wTLtJlJ1nB5ALAfYfyQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b000b9-9703-4f46-09a5-08dd8cb725f1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 16:00:40.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgvLpfuE+iB9Z95/vS5qFsjrAnQbkY0tiDHbFhYyJa8zBOwwEfSVc8kpnWevX5q7N8MEB64MrQOH4W+LSuUuZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6561
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060153
X-Authority-Analysis: v=2.4 cv=F9FXdrhN c=1 sm=1 tr=0 ts=681a3231 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=TAZUD9gdAAAA:8 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=vzhER2c_AAAA:8 a=AIV7JYKxGoLyEOIUsiUA:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=0YTRHmU2iG2pZC6F1fw2:22 cc=ntf awl=host:13130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE1MyBTYWx0ZWRfX5IXqF5Nthy1y D7ufY8HmIEFUIswS2Au2aX9uwfcbuCWtG5a5a5GYoNtTFZ+Uyi/96TqN04ky7MFKOrm+aHvuOz2 x8wgjN0Y8DZU6V/DoQeAYnAnWV3RO+R8NaxgXmD88D/ivSfTM0kx4LpvAIVZXtdE7ojJN3AgeyB
 inzEDrYYpaQ4Se3w/JwOEgNMQlG/V7B95lUjVB8L69nOVcK/3qdZUC/v0QqtiKxLo4HcsRz+pPA 9nC9Y5RalKeXaaagbNGviwhs5abF6/Ldr5AXqWCfJ5t9hkqWK1XzzmAeP8YeW6ejopvDZtCJmCB zdCEAy0/kmT94s+QZp9nLwEjWEbhfLDgMdWDAZeNLgtgEtppoye5QpZdh8GGBZgd4Ntxm1a7N5Y
 zV6Rn2p12wMQ7KIh0uJul88nhU4FWlTWaJiJ8U+CLVbkHHsO0xb5HL/vLq/Li6yQJiPhOxjD
X-Proofpoint-GUID: Pl_5pA9G58yaej5xooZrAs-KoPeSwbaJ
X-Proofpoint-ORIG-GUID: Pl_5pA9G58yaej5xooZrAs-KoPeSwbaJ

* Ignacio Moreno Gonzalez via B4 Relay <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org> [250506 09:44]:
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> 
> VM_NOHUGEPAGE is a no-op in a kernel without THP. So it makes no sense
> to return an error when calling madvise() with MADV_NOHUGEPAGE.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Yang Shi <yang@os.amperecomputing.com>
> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  include/linux/huge_mm.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index e893d546a49f464f7586db639fe216231f03651a..cdb991f9be918182f94003394cf793654a080224 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -7,6 +7,10 @@
>  #include <linux/fs.h> /* only for vma_is_dax() */
>  #include <linux/kobject.h>
>  
> +#ifndef CONFIG_TRANSPARENT_HUGEPAGE
> +#include <uapi/asm-generic/mman-common.h>
> +#endif
> +
>  vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
>  int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
> @@ -598,6 +602,8 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>  static inline int hugepage_madvise(struct vm_area_struct *vma,
>  				   unsigned long *vm_flags, int advice)
>  {
> +	if (advice == MADV_NOHUGEPAGE)
> +		return 0;
>  	return -EINVAL;
>  }
>  
> 
> -- 
> 2.39.5
> 
> 
