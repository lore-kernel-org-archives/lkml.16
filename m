Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AFB2C15AF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157885; cv=fail; b=INYqFwznTMopGpT7aY4MQAp/KnTyO/i1Evv4EAkKqVDznWoNBYnSfCoDfWg/od4xktd/WaR7zUJc5BDIknXNZSluEqPDMbkv2+z00VTG4QNmvyWqWNxZr9HvhGtGMeQgtGc4o+Qpzeb184isDTns4g1aeg5XxLq2xsylje7gaM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157885; c=relaxed/simple;
	bh=nE/+Ax6LfXHgAwnVwSMEz5xD02z7wK89/+mF8YLBvzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kjl/OqfESxuoEaWTrjLY/6SlLaSt0dDh4F55EabE2aLHmXgULfoR87dYJH620+9VnwYR/b3CTdRakVKF3pkKG2A6cL56BG331OtDcHnaZPCf52YevkR+nJqMjRna/d01ktZoNuSf3TWRtHsN7eanxXl4/cDLcvtxKux60KRt4GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TDgTMuj7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fv8Kw0o+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TDgTMuj7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fv8Kw0o+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tebp000521;
	Tue, 17 Jun 2025 10:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=nE/+Ax6LfXHgAwnVwS
	MEz5xD02z7wK89/+mF8YLBvzg=; b=TDgTMuj7A8Jo+NDpOMpbYO1EnTFtxLDGXD
	yv3Qov3TcwtbMZPkPl9PujcLy3fz5x5KHh2MiS3LVzgotdMGm44EsKvNt/qs4m+Z
	e2yXE95HJ+y0N4W4S+b3yNn/O7R7ErOUzpV8h/gNcgYtbxRiKhlcCbH0VOe3Fcew
	q1UpFqDflu0wXMa8bHTl9q2mNIBhLK5/9APkUm+0xwjPDBh4LU4+yPnXEdwdsPpc
	IVLY1HLcVO1vwKItgMP4hvadDX6OhiMyy0tnHYtQCQH/LIzAtjnix3I8PaJGEynx
	ui7MStKkurs1fjTsasZIW5Lo3KlidIBLufP4LWa9Jj8Nm4XCYoMw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xrgpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 10:57:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HA6Ap2001644;
	Tue, 17 Jun 2025 10:57:17 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh933b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 10:57:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0ifKY6KtPUKDvPnDRE1T0utcR7aLIoEqrtXnMIrpWgHRFIt2a4F+sUnoL6P0uSeSHg1hiirx3mJjTn41KzTolXQ4g1vGhWK7055+oIoKUdY1+MZ8j570Y5dQBGkOqWUwd66wXOcuOZcX7JT9AU8jD9/PFQdxiToiT5Lt2ka9Fm1UfzWVSeGMc2CHCydH4cY4g88+UD8mySxmy/DhU1kt/s5DORIH4ndlgnbKccwfWaf2umdrAHso1y1NXfWYYnQhNiQoK4bMx8UKiAnZjJGP4rsyqjzFDGGMvuGtOgrYhJG8DFCNhNPeASUAAKjvpMNiRt7RO9kla/rLp5dfZySuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nE/+Ax6LfXHgAwnVwSMEz5xD02z7wK89/+mF8YLBvzg=;
 b=GtpyAEr5CrCHbp7ngXtyehIht9JUqaEatwvhwkCUoX1dKtI+YOSJPyMyticXwQI7tL902Ii8Sfxq6o2WJO/dthkpKNTdAoGa8SWBi5dZj0Z4DoLbpJpdmh+TDw3eE+Xw7LuPDdjzde/m616XPo8Ec6MflkDg9k5zGoFuJgqMhe3KqJ4PmCr7R0v57DQHdUkE/ycRxM5DvvWIhYOkfnAg8Aqm7zjvGnJwx67yKjJeaDY8b94D1I+GQeqTSw060zk4KSwvF/4QFLlDqBAAmx6hGC4PjPJgEjZx0ma8j153NhbW2CvZ7uZpMGYo0fUFRyDAifP3GBnWYR+A/USCQJhAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nE/+Ax6LfXHgAwnVwSMEz5xD02z7wK89/+mF8YLBvzg=;
 b=fv8Kw0o+PrPpKORHhOMGXnrR0mo8F4yubWTy/qE4n+kLCcazMZknbjLTFlv+KijnmHd6lzeDkn0rUNpMX5YvttfE2KJdgCpYK6KyAWPL2yFrj+nfVfLEfFXdwTDlW1CBmQ8RhT4GfsSe4d5vGpsAJ+ku7MblipkXJx/wuLqXKjU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB5814.namprd10.prod.outlook.com (2603:10b6:510:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 17 Jun
 2025 10:57:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 10:57:13 +0000
Date: Tue, 17 Jun 2025 11:57:11 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Pedro Falcato <pfalcato@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <58560256-58da-4fa6-a953-d2c4695ffba8@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
 <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
 <68d8c7ad-aea0-4556-be63-9b67d70e4386@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68d8c7ad-aea0-4556-be63-9b67d70e4386@redhat.com>
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5aab1a-8526-43c3-47d9-08ddad8db790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E/2F1RT0ptryYXT2m4W/UcOacKDoPkUtO9NSNgWNoACu3V1juasp57CFCshZ?=
 =?us-ascii?Q?RID90KfgbUOgxM9FE21rbqOmeeBFRAwT7oZEo4JHwzecP5ERrlQstacs0ROl?=
 =?us-ascii?Q?Pc/PaZfFXYHpgJVtTQPupZXW23kK3lnSD8Ar3/8vHXi/mOk3akhyLuj8k9AA?=
 =?us-ascii?Q?t/JR9uVB3SQ6yJCnbBD0bbLDohgAbb90y1dstT9JYJ0MHTkyrT1sT9pcUCa6?=
 =?us-ascii?Q?tXLb8zWWnLJ+N72QnoDH3aDVD38gS+MT/M0oAQczYjEFcpIxdmkO/7Tq2zsD?=
 =?us-ascii?Q?omd/CggJt9MPGUwA4L7ZyC26pfUSpvAs2sQWx8l71K60hWAliNVGEQRI65Of?=
 =?us-ascii?Q?WjHNuIW65HPjhqkNRXG2y/0p97kIw0vjpcZhZCt8KPn52JNdM1SQxdJrgz4g?=
 =?us-ascii?Q?SxX2ZQItV+km3nw04Ax+v8aeYYfNzoj57gBYtiGLRIJC3VruvRrce21ZoCCY?=
 =?us-ascii?Q?rI6pjSPKGE8TmkyDO7WHmasSYzkHKVaDBzSFlwiMG2bFV+HtUKMob2If2KD9?=
 =?us-ascii?Q?sVLQt/7bFf8CfRTIiFyg8mujZRi0eZmyGUTMjfnr2YxoAtScpelhEOLV5uVW?=
 =?us-ascii?Q?VqCV2G4SuZSY7CkYfYEkGlHo6QfLQZoE4SgKg+lzy139ldA4nyvxgd0cOheU?=
 =?us-ascii?Q?TjA048MQHwB5VIXljCIbxuAXq+FMCM1D6v2TIc283D82Lw9SFF/zgt69sWKi?=
 =?us-ascii?Q?KOCjUIAKinkF8vHmQrenpKDv4gFCNAoA0b5DYVr+ZSoadpSeszJ5Em+/PrhG?=
 =?us-ascii?Q?J3S9WCCvMVtgqwyrSfXcP6sz+YjAcoKKdz3LtVq9f5z52qN6LdB3J940KzJs?=
 =?us-ascii?Q?nOrBuYs26ig1ArGn7p+APekWPGyrQDmk0A7+Zpp4YmINQOysgY7GwFzuDbj/?=
 =?us-ascii?Q?yombUzjKrU9ntivYV0up/s6O6WbKPn8UirtG/WqkuhG+SHa3z4iK9/uTQPPE?=
 =?us-ascii?Q?VD6DjXFq/bp5KM4NCQ/6bErwxzIFST0qiIpdnFHCVCLAHASOO6hn1gJbvG5b?=
 =?us-ascii?Q?KIwzCWMc4AQEaHoueW1Rx2uo563+Utetd4q91xVZehFJeAs0nhHee0E0yvAV?=
 =?us-ascii?Q?7cTYIXkWmjv7wcs/FpsAQDs0OH3R+uMVpinMaSt7tnPJuqf5DmKAji3VDGmn?=
 =?us-ascii?Q?nJzc3NYYJ6XWB6eUb66PIoGg6oMMSP1iiHwi9ecN0m1XPOpUH6iTMcFZ/4D8?=
 =?us-ascii?Q?HpI9N9GE7lunDRa2K6rGLiPScfh7uohKBemrZS7fLK1sPY66lf8TVIrsY0WD?=
 =?us-ascii?Q?7wu69FQVLPK67YKhV7Iz5cWWU/CadZBywpa3dbPjWfHpyR8IAjx3NtIPZpRs?=
 =?us-ascii?Q?ghskkcgVT1zVoMsdUlYOxYVCKo9t9h1MFiSc4pUHcq2sj026BH2i0aYgDO93?=
 =?us-ascii?Q?paQpm75TVGZyjWNTgHb4U4BM0/eeuOnUNYmXx/go/Q0SriFetSpImMehX416?=
 =?us-ascii?Q?p7ONHXq1ppE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vJTiNv3igeGElL+V5+OagwufqwNqbmDebIjC9qvKo58InodKrsL9Ly1Nd4Mp?=
 =?us-ascii?Q?Icuzo9WeYekqP7C9IfCwJQYLoZT5v91wrIARijB3g9BmpLMGCEWOehgYkRS5?=
 =?us-ascii?Q?zYBw+J3qPkx7PRcDCZQLBFHnFdp0xYYEx9exuLvjC4BoaJUMGFhCuW5vX56+?=
 =?us-ascii?Q?fsDFfnCDsK+Q27OKObgcqHkWZNYsKsI73Tjy+Wb1r2ZzTw5NURB06j+KC+yk?=
 =?us-ascii?Q?OBakso4SaNjVta9BN8BUsNVYMJNdaOm9DSjRcrvrjuU6MsK6qtHhROliyrgZ?=
 =?us-ascii?Q?DGjHQXcrPlSo4JSkGc98Y4e4tGW6nPqNyRBZzqeF9bHZdx0729zQlzj5uXVg?=
 =?us-ascii?Q?4Oc3007DTW8nmgUFORN4wqhqo/jnZbRTs/HV/QNs0DZXYEGSqM5hKmp2p+1R?=
 =?us-ascii?Q?aTA0OnUHr2HVnvXjUYRpyNZYfNAa4pbIm7XTuSwEgrjZlvmYeXu6rOv0JyI/?=
 =?us-ascii?Q?09Q1V0birJYSj8dfXe3916vPgn5PxsXANsD9sZDV5GsyGuWuc/yG4n38Q4LC?=
 =?us-ascii?Q?BZtRZ5wQ0eheOXeLEDERl6vCNOnh7JxcJasjOanfHTX6zqEi8IKzP79f+SxT?=
 =?us-ascii?Q?3bIvJ70LnMG7r2oeJXExj/0V+oYYI6DZRN3pH2A4yIjWgSFtxlx/mbpWJOQE?=
 =?us-ascii?Q?DER5z5G99eb8CMnn0Whi5ViBDko/wgvEicymBwgn9Egk47+fW9S87M1U4UYf?=
 =?us-ascii?Q?eagoDjzxHF9vyoCjFEHBdJVtl+cQG6b5spb/141UwUmX6VN4ZzXA+frSpRGN?=
 =?us-ascii?Q?4phAc6mYWFNQ92pmMvATcOeQmMAE3Mrl5BifFNAszeBlbSuWtknQBpKUGcxC?=
 =?us-ascii?Q?OgvMQ8LbGui1vUCxQDATMJEODDhLbBHrP4r6eiJ7l5i0Pgnpp4mZcgTWJzzn?=
 =?us-ascii?Q?743L+iKGF7OnrS/hXW0Mlj57t6j4ersZTJYQ+dNf+fTbztN32Hux7UtLRygk?=
 =?us-ascii?Q?3EnGyc56WvxuDz/s7ioDBC1IJ+SHCHAilcYhuE75Gd+b6huKZo3BYWh/02qi?=
 =?us-ascii?Q?SldOFC2URHmtQ75Awz80DiiFp78/9+Elqz0fGtqkV6sZMvbJfVoXxBb2t9ls?=
 =?us-ascii?Q?ymMgulz6YLCXEYRZN9quyuzMuqLbDDTea1u4a34YYTVK54WP1lwBUOHEuqHe?=
 =?us-ascii?Q?ngWXFsbQh8l3xNu6tIfMtICXFkV9ztYlhh9PCihlT6nsgOKpy3vGyq98a/Qn?=
 =?us-ascii?Q?N+hCMFBlD97tk8Yk5jlxv1/yo0vjJ0fyWtrBeogdE2/mr2oh6lhy+nuNnTol?=
 =?us-ascii?Q?NYcmLfOiPvloNofo64M8uzrn1sdoNH0YFtzw9bqD91AllsbZ55Rs5ExHbv5z?=
 =?us-ascii?Q?jV6AwksBUqVTbgbeGBCGanyFspBYliw89rFqxLyj6yvlivsUurr0aUI6NSh1?=
 =?us-ascii?Q?rYU4fMLiy8slE7lqCDUtvHFzECUmbzHGbUYWkv2kth8dUQRKRXFb6EZX1Is+?=
 =?us-ascii?Q?jgNGk2ZLIpQxu+dLrfi2L7G7AlEf3jLsR7wT+RrFkydk3vTyK3rF7F4H6Cmy?=
 =?us-ascii?Q?eQXEL0LXWsXq1SvTyHcfjkOir8kA55xh1ldYKP0ULlwE7UeInkRm6KrgTXPw?=
 =?us-ascii?Q?8Z8ez2db1mzdwYjfxXlVUBv4SqKJxPB61EZWif0eGk0dvZVnetkJUHUw+DD9?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KknnJ7gJjtY+8Qd+6HafxkVwo9mQbvnhqrCWyFDKyC9nHfFsQcY3IsIRe+K/DbBrj70DD+9fwXI7QjpLVx06NLWujHHWR274UI1YoZ0qZv7KI+/yOaIiRcf0cLVF6ngLmC/8O/pq8uUA+1KKb7WkH6ziEHUAoBAqlarlXIg1BZ53+U5LYB6X9efG+87X9kWmAQehVst3SPrRz44QWD5k1+UgZACPlBR9AhsbyHxfJgIEWJja1VInJ8XTKY+touQc8/wy63E7kwkxq8qMzXi9S3di5sp9hiEx0o3rFb2NLW1lPwU9Mi/TzH7xxJr1Wj9HBwAJHAQ8pKc8nKeEt73NBx99invSmtqMVZ2Q/lL/VrYeahO4y5VoAZSlZKg0CEB6qBrM960YHpb/pKdOrIxToX+1ovqMSr0QSRZqHelYOg9364I2KYiEnJA0sd6oVCD4TMRa2dZrGYi4RXY7oQiyBDaud/Pe0sxG63Ibat4dwEdwGioJEMu4R2A2VESBzH6toB1yX+lxnWMkK/2zn9uUgOrbIYgfB7ZGIvIl97q9ctKdZgCV3AksU38ZL+A9w7Xlpfdjzk3zR5cnxXHHWyoUk/6mzN0zLqogbB2wO9kU+9c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5aab1a-8526-43c3-47d9-08ddad8db790
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:57:13.8918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97/HwU79OO9e+Dfq4d63lfrJd5F0NPTpBr3JDMgg2srdtKBbR0n7W0FCgthJ0Bn5v5+Nvk4+ejIWQEhd9FRUiNZLj+45z9O1b6KcvWL3lA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=796 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170088
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4OCBTYWx0ZWRfX+Mmz4otUwuJx 0uDHM2YGFeqXj5uQBqsSKFa0+uj3u7H91tr6kJ/Infi2gW+OXcRiAI/0vpCYF3YgCItHWMd3xpK Ly+o6EzI6zqJi7yt7QrbNNisjV9+8mT9yS1I5UGgdepinxF63FFEv3XrEW1PahhfDiD/0nzKx/E
 1g4WYptqXH5wS4QsYuogtmOF2tBe4YfkSl8OXhWncYW6UAOgYzrSJf8QoGBkCN+oZ2aH+BbVWgA OZwXe8iHJycxyoa8Bs/DZXVH6TNXsQ9SuoIoEntbfjn3DKjP1CtdE0WVnN5svJ1v0QySwPmmKXb +4Teb1gWtZmmUnOg4K2d9a2I3HoEcS2o45zGD1w5r5UcDxr2s2O6/EAQd9y9elL49S2QA4Eb0Eo
 dUuGeI/JyO1jDt1JgBW04mb/bZ+B4AbtRU5mW3cC/J3WK0jhOhfY2Z9YmlSpeCsuHWHC17KH
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68514a0e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=KHwPYq1Ht8199UrCJQ0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: d93DjYDnfSLF08P_z29yIaNkfUJWUX-6
X-Proofpoint-ORIG-GUID: d93DjYDnfSLF08P_z29yIaNkfUJWUX-6

On Tue, Jun 17, 2025 at 10:45:53AM +0200, David Hildenbrand wrote:
> mremap() is already an expensive operation ... so I think we need a pretty
> convincing case to make this configurable by the user at all for each
> individual mremap() invocation.

My measurements suggest, unless you hit a very unfortunate case of -huge
faulted in range all mapped PTE- that the work involved is not all that
much more substantial in terms of order of magnitude than a normal mremap()
operation.

>
> --
> Cheers,
>
> David / dhildenb
>
