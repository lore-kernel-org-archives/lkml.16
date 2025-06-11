Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52652857CF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648618; cv=fail; b=PCMuq847ACmQ4KnufW7Tm2c+/1k30uX6+rWRF41oVE1EFbcDP3+wSZaZ02GJSXInAuf3pjsIcfZCUJO0l6ozxOkpaGKzcRfLSefu73gOAzTIxuSwU2qAPa0o9bNQXhhiCL2LOT4L92EsdW3FgdbFnEIMpm9CbUlGSlkjXcO49bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648618; c=relaxed/simple;
	bh=oJqRCJV+nLqM/e0OBcUHlgyojbGwjbbbBvA29+GB9o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PuiaAMNg/Zt5GVlCvTzSdT1zlmt6QbT1ki1Y0TB1XOtm6FaWP4er06UxLJpZCfJHJduZO8cCUYsJf2jgzdvVfXhEkez8TJ7LC11Ga6OqzICRPnDB+QSz+eX9LKwT3PzHWCdEEwb7Nubw4fgeguJkatk03thqEaZBbohdkM9DdMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KEp9110u; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XKpE2a/9 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KEp9110u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XKpE2a/9"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BCtY7X028850;
	Wed, 11 Jun 2025 13:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=oJqRCJV+nLqM/e0OBcUHlgyojbGwjbbbBvA29+GB9o8=; b=
	KEp9110uY8V1DYwTfwIQE6y2bMDnlUjUpRiByC7z/NK1BzAKJdV0bETbqKzT2Y5l
	54WFF8XZPaaiKkzgP/QRxvOibF2auEP2ZEFoAt+cQlgIjZ17ENuUy8Wzq/0/XXnj
	zwH/OxqI7NdQoYIwCrkBZuw4O92mdE0hg3NRK2QlQXhgX0iV7L4UJVGE59rfHiYy
	DMKiv1BNJfQ/+uKvezIXrz/J0PyK8a1YZpXPlBpfDIniyURwKLdGBBaIFcqvJg2J
	OiY3HZPC6J10FPADAYKNIu4Y3ASX0dTgMTAbXyHmtEna1ayJclgZYTryRLTA4Vsr
	KdIa8i7PpjnUgWC7+TC0KA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf6sjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 13:29:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55BD3VW5007163;
	Wed, 11 Jun 2025 13:29:21 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv9xcme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 13:29:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4Gd/d/BdGsWnjDFtaDiKISycOebxTtXnoNDI/Yi7v5ftL2c0LRKsihZlrEGMnCpkVYVZkpnLezdsBwwFIL0g4L6dgMJ9xw3HBJX+4ptYlYHvhAPMBz9NnSBDe1HFXS+lMsI4NGnXBK+b7HndGdWNkbOJ6o1S0Rdx3Fsr+9DFY+1hsNGABLPui+j/CV3jy63XKCgYMI+qWEOGOGc+QnMbiS4eih2MoUHcOqzTZDEqL/reeLzgROzu65VjaZ8G+ZZC1qj3Rsx9sRq1HpyUpxJrTxyxwo1vNM6iGBEKAZSQV0XPslKeuKcE/iNkFJPbqFa4mIwBeYeTUBKPf4HaIjUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUVsbduT4r9iyVbwRQ+0sClDOyPuk9BtqXQDAsZKtws=;
 b=XPrL8XfKQ1QJTUb0uYdqnU6GCJdc3Ke0053n7K2oQPqpCN0Hc+/4riu98FRUx2BUJnyvJ3fTDACX5PDBaBe7JhrqEhlOUJcZjZF0OEdlCrbAcfAwG2ddfjckJaGOg08kq4Q+tzkQOfxtBCpEkDUolP1NCa7V4RgrvY6HYQVFYt4QokmMnpOYUe05CouZFtlYMWlGBbrLooiYz1ZrVJKhN+MmpOSB53U1xzBIH3MMpwt62FJVx6E68KY2WnO+NM9YYGSW7/V/1GhBtUF615pLHuKZ/WMxim+oL47ahe6Xeyt/BIAN8WtbTVn2+Qz9bM6Zd1mONFz35qWj1zSZb730wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUVsbduT4r9iyVbwRQ+0sClDOyPuk9BtqXQDAsZKtws=;
 b=XKpE2a/9rjXsBBPMNiCaOOssSF+7d9mM9qV8LTD+u5dz65p7A+bBNv2s5mMC4hgtbFomM2eNSVrD7XHpNXAG5joBvCDei7QP7PliWsZrP7SU7qp4dxdlAr9RPzZc/leUL8e0xROqYCNQ3Ppkik7CazBsidHOjQZyOiJi1OgovnY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4547.namprd10.prod.outlook.com (2603:10b6:303:96::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 13:29:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 13:29:17 +0000
Date: Wed, 11 Jun 2025 14:29:15 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org,
        libang.li@antgroup.com, maobibo@loongson.cn,
        zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v4 1/2] mm: Call pointers to ptes as ptep
Message-ID: <5d1a561b-cf29-4527-b695-90ae9e5bd696@lucifer.local>
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-2-dev.jain@arm.com>
 <9cbaf817-7a33-42d8-ba39-fa1b448266f6@redhat.com>
 <574a1c6f-f542-408e-8d26-728749892b1c@arm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <574a1c6f-f542-408e-8d26-728749892b1c@arm.com>
X-ClientProxiedBy: LO4P123CA0156.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bcb582-7984-4357-4007-08dda8ebf758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?1weIuH6Y+Xv/trBLSANeyf0ewLXyLIPdxhXygg009RKixaR/s8jsuFS3jF?=
 =?iso-8859-1?Q?lvvgY8YkhE7l3y+Yo2Ibz+R3Q7R5+nG7keDtxkBCHkD6pNJE9BwEVptgJs?=
 =?iso-8859-1?Q?RHS1zBvqt9LZVq7n3zvOVqIhOMKMZtfjsJZURRC53ldAQvIkXEnfhPZR1k?=
 =?iso-8859-1?Q?cFx0BtauzJjbUDK6BeDEPRrfsJnVPCnTZzMf10Rcu2GRauyavzZSYZC1w8?=
 =?iso-8859-1?Q?lgW/Z2G2R+1tbsQjB3swT4vjpTiC4bEVSOzdM9OK9i+aD5YW6VI9tCFHEt?=
 =?iso-8859-1?Q?aTWr7ifaxMxETA7z0XoIMNZXSRwtZGwEiva4UKV9T34ilJ8MIrmnaVYPa1?=
 =?iso-8859-1?Q?mDbzei6vEL3Ujo2rhtjBLZFp2xYo50uPr8xwEEV3NsSrpNswUcoIMLY6/Z?=
 =?iso-8859-1?Q?sbeH05uCHV4vn5WNkxwOQDHlNzxuFtsKIIvcMjpyx0giDOOy8NJ/ijL2Q1?=
 =?iso-8859-1?Q?T2WTsFtHf+tLscv4RLAG2uxHarIOSUuhPx/trR8xwf34Q73J4UxHDEeehK?=
 =?iso-8859-1?Q?r/pFcNo0NA3Ds5xPwFNyO/0jNsJ6kZfmbqSOy5fxRGlR+9cv7hoz/1hrBa?=
 =?iso-8859-1?Q?55FUT7zdUY/ylKKeQmpAOZI0Sz+e7F7vHWgSShX0lTiHBpd34ngpBSxN9k?=
 =?iso-8859-1?Q?ilSupc1egBCVrffDD7mE+SUN7ck2Hm+t13zlsucYBQDsxyV8/m/3iGSUzi?=
 =?iso-8859-1?Q?j7RTMTJZOjhV9DvMVDMJIpIUx6dwJvPWKcQdjqQArnFZYPOHEQUIUVnypH?=
 =?iso-8859-1?Q?fGN9Dk31OwQFQA5N56Ofxf6LWSiZGQvkdMWrsgT2gYC/nnuwOjInyJ7WHJ?=
 =?iso-8859-1?Q?Efd5Ic5R8WimXfx8npH+1hI+JEayMlmmQ7WwymCJg9yCMIviCt8slZtB+r?=
 =?iso-8859-1?Q?ImxKmkpL1+inHPxfVW1lJ3Uq5y8IMb4d4IodWXrULlLuODSY3SFa9VQNyo?=
 =?iso-8859-1?Q?6nfRH3TbgjDx/CFO+K2mJbNS/TvINMtOavy6NVgR0vZPCOtcX7g/jaJYSN?=
 =?iso-8859-1?Q?oz8jQgoyiMd2GQrcLw4X4nqKFkYcayz/GvfzSdaNfrY/y3FMhOutHtXjGy?=
 =?iso-8859-1?Q?6baMQgWuvqrsmu7X/eeCqzm3XC2pNlbQ9xKqvQeEqDwLOqYvpl9sGWOCOu?=
 =?iso-8859-1?Q?8zPCXGLsDrSYPFoTG8b64QrOC6mnBrg/RRj1P/57yMgYywIhGKF+1mO/y0?=
 =?iso-8859-1?Q?Pu++ZUFMk7wcWb2UMlWm72JHc3GHMmcH3eAglQfdBv/mu9Qv1smubqaLnz?=
 =?iso-8859-1?Q?nFEkq/QzngK4LeTovHRxfGhfoHgQYGWbkUWbtxo6edTQH3hcQMo2gdjNIE?=
 =?iso-8859-1?Q?+lgrept1qWuYqhe1arckzleHtEpmaisYBB49etF9agyzKcTb2MuUXnpoRP?=
 =?iso-8859-1?Q?6SWnJQIVKxmb7O6K7Tb5coyMSfJS/5WtN/8qy4KSAHMoUse1Mz+S454cPz?=
 =?iso-8859-1?Q?OcgUyWTW2h8rT/z8t2vdHnw1W7iI1zrXHyoEswFtPZiMqVzS3q9ANtRzBb?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?CR9EUzMLjMy6WGk7XrpEpRjd81si4XosCbe2xTNcLBEdmWIXYQsKpTX3Wk?=
 =?iso-8859-1?Q?oCTDjGxkt9oLYXetpTGvDv/ui9yeS/q+8EZs17iX7BW31ynxq18DHRdK+M?=
 =?iso-8859-1?Q?rs8yZGOE9z0Kv6cndIO13mXgjTX78CKpU20g9qUvPCm/59hMRbzFtWOFAM?=
 =?iso-8859-1?Q?4X75scjo5/0DlE2MAsKlQ6TiyEkwzRP6yka4BIFQHVKmJ88SIMxhkGbv22?=
 =?iso-8859-1?Q?K9sIHyJGocoQQGv+dsGtanwV0MljAIEDHCGbU5pqPQUUJ07phUYn2pPlDk?=
 =?iso-8859-1?Q?Ypc16x/24JOeEPslObFkbA8uxsNwhrceIsW5yZqiqYmtXNdzS/DD1TwH/D?=
 =?iso-8859-1?Q?RgvcG3avkeZIpU6Ub+CalscSj65qYe3zZCdl+R5TEDEeLsnD6bAWewMAxz?=
 =?iso-8859-1?Q?KN943tZkAZlFZdmB45XkMBeND2LvVgfu6OEhe/osCQEFsLGcYNw6qiOOsE?=
 =?iso-8859-1?Q?lkfQRr6MuB+6r1ImNPPJ9FbVhh/1U2UXjkIUPbM7TFmvjxj6xKiTGs29S6?=
 =?iso-8859-1?Q?tUduJcuyRbPKA+5K1uFVftWCx4AHUdQ2OIkI76H0XqTEudwrWNYpoJRe1v?=
 =?iso-8859-1?Q?WptzSfDZAf25zhune3t2iYxNxE6Ofhx+jiMuvj3pFw29BZrX5vGwzttbF6?=
 =?iso-8859-1?Q?YShl5fuOX9qbiaPtt9eJdCJnxHkutwJs7zqF72JQpDNRpuRYj10BSX3E6U?=
 =?iso-8859-1?Q?oGE6fDzPny5Egosy1f9tTI0xIoFGpAfkK/s/GfqyHAG2Rxd9QZ1ZovGLXl?=
 =?iso-8859-1?Q?rI3U4usGH2pBEBSY9wV6b1G4eN2uDlrpPBifIT6Y4zU5t3xWlp8SVkoWF8?=
 =?iso-8859-1?Q?SLNbzxkr7k4ds51cm79DHg8nI/sy3AFXT+BDUrLSBMLtUYqFsOGvZ0hp2M?=
 =?iso-8859-1?Q?vN7yFgtDiIc0xiUM29D0dilTRamN4tLCnT6wwBhOwOga0xMhw83DUCizz9?=
 =?iso-8859-1?Q?0FUW8x0lpESAV/yvdbcuSIAuXDPI7mmuqOH3hHhleYhhR6HxfNqaXRzhjb?=
 =?iso-8859-1?Q?Mkl+6R+f5tSCMk58tqKRjWJnU4UzVsGxyWynDcCSA2oL376mjq4D2t1RNu?=
 =?iso-8859-1?Q?Tcv5U5MUsO6EsfMnc9CXi7RrHcsr/Wqf0ku+IC0e+CqSwV4o+ZT3z6lLQQ?=
 =?iso-8859-1?Q?cjhjr+AGcL34WTKJSSyNujuQP0gJ9d8N69CIYFI+VoOnlG8nG5xqPLarL3?=
 =?iso-8859-1?Q?TZO9FS3Exc425d2h//VTFBMNYcRowG27JJ5XBGTNoEUagDN/zZYr5R7VqO?=
 =?iso-8859-1?Q?8LHhY4yuB+FLl81R/JQaEQDfGEbpqX7aTPceeQMGmVRYK23Veh56ukIr5W?=
 =?iso-8859-1?Q?teXSs8gvbRFg/46UY9ydFQ6EWTYrhqlwtxI0H0ehZYzo9lzesdq9maQbrf?=
 =?iso-8859-1?Q?a7GK09Ygv9FgM97HAfhrQ/FvLkb/V79Fy5gzbM6pjIA+iLZVlWBL+enhxu?=
 =?iso-8859-1?Q?hXYL68kyv5ashCZ0g1pOWeTqimOYxv6b8cfZhNccA7bQfkAKCSHX2ZpjMw?=
 =?iso-8859-1?Q?YqJNN7+IoN6Ml/DSAvP0lGXd9tAMUhcv8sOgHK9mjR/kNT6LiSrHVJVHKM?=
 =?iso-8859-1?Q?QSuhjBH/LBdUd1Ls0lvJvWxRVJDMhpdAd5wzEmFvlY88gEp2aa48pvteIO?=
 =?iso-8859-1?Q?iJD+J2VbdtqWAvQ1vxIJZFjG2qqJ2IlIsDwejuyqpt0pdbyZnGmKXxGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D5wOsxZaAVe8n14Q2KqTXYiZbFw9PGzhPj5ShyJFE/hr14LV1qltcwOOlL8d+WI6YeWKFLSwI9qOyxrOm52M667fFbdHugX+6uzSZmjn14nZM9SESg8zlA2yrJCS4xVk2if61p5aAwV8mNpC5WkLD5OjOwFp4eaj7dxsNJuygXL4J9kiZnyy2i9D27zj7SLKeEuBPGnUhMfkRh5uP4Y0CRGLTYLIIuCG8eALpMOWEG12StsmjHmZAYeyDdqiYRgZhXqaVbNBECtOJJO7VkyKUZzhZPLZ/s64qpH3veEFhk947zFO3A4cWW2W5MfhtfKTZo+dlim6+zJPocV9k7BGANUcouTrhfsjhn7jp1dIZ3ez7sDUZ10134CBgQSrCe3/AghEdSlgUgAb7rP2nPeTp3yDxg/aEGqMb3G1jwlGsIBm5bihz6ZDEnoFTmAYby4Z0q5/Ckw2vfaznTfM31W6tgpJ+c+TvDqOHLQIupV3L5wwjN2fqGelK/+A59MbfhgiOsVOx6qI0qr5/nrobTTFyNQ82geK/IQpWn18Q+K80RkOUJR6fYwW6C6h0pBqvK6N8OjdZIT7+hErn3Hj7kl44jDsY2T/xxa8Q+RJAM+b1jc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bcb582-7984-4357-4007-08dda8ebf758
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:29:17.7734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+gzQsycXMOnaPnMHEFRE0QvKQDgN1VA5Gfw6mFUqLj4T9rBu75qHIatliDhLKYmHwm+Y/wsin0xM1DhFBf5OwNAH0UJ1F4MOPHSzrqdi/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4547
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506110113
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=684984b2 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=YVkg0PlXJm2DVpsjpX0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: UZLbMFvtfM-Gh9PTBRPNkHWFGiMQXjjt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExMyBTYWx0ZWRfX6OkCY8XJTdke M4zu16ge5J0FohsdymGqvqsLzCx8OhyzmNJzFhyJONJEyj1Su58iBYWBbi+5kxFbxsKPZZOLHrI TiUFG2j+Lgc1jHRht+cic4D5c85ys4RdhfDvNU77UnVdWcDExn64eRD92ObEbZyNiEsoChY2fgw
 tAkAv2eTpZoj9AeY6PNMO3x7VjMUZQ1lhVt/CY34re6XmyQNUzpF6L9riYblNqV8BHHPMilBxCI RpvRCz+PQO9mN+kRl66mc1uPduL+zl1tqzWzbcAx++ukLVxh+fe/QqM7STFKfiD7biw8xl+qm5B dlF58bzmvtlUbF++D5VVAjVsqxTAdtKPUf5JNtr7/Dgl265FhJr6Nq722zzbMwNmgGppkJcKCxS
 MpTmnybi3A6N9MI3hySWGt3TSM+izhkwT8DBNT+oZznwJwTK9RJnlkof8EHiKleGtY7faoSl
X-Proofpoint-ORIG-GUID: UZLbMFvtfM-Gh9PTBRPNkHWFGiMQXjjt

On Wed, Jun 11, 2025 at 06:55:28PM +0530, Dev Jain wrote:
>
> On 11/06/25 6:53 pm, David Hildenbrand wrote:
> > On 10.06.25 05:50, Dev Jain wrote:
> > > Avoid confusion between pte_t* and pte_t data types by suffixing pointer
> > > type variables with p. No functional change.
> > >
> > > Reviewed-by: Barry Song <baohua@kernel.org>
> > > Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   mm/mremap.c | 31 ++++++++++++++++---------------
> > >   1 file changed, 16 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > index 60f6b8d0d5f0..180b12225368 100644
> > > --- a/mm/mremap.c
> > > +++ b/mm/mremap.c
> > > @@ -176,7 +176,8 @@ static int move_ptes(struct
> > > pagetable_move_control *pmc,
> > >       struct vm_area_struct *vma = pmc->old;
> > >       bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
> > >       struct mm_struct *mm = vma->vm_mm;
> > > -    pte_t *old_pte, *new_pte, pte;
> > > +    pte_t *old_ptep, *new_ptep;
> > > +    pte_t pte;
> >
> > Could have left that on the same line ...
>
> AFAIR Lorenzo had insisted on moving that to a new line.

Yeah, not a fan of having pointer and non-pointer types declared on same line.
>
>
> >
> > >       pmd_t dummy_pmdval;
> > >       spinlock_t *old_ptl, *new_ptl;
> > >       bool force_flush = false;
> > > @@ -211,8 +212,8 @@ static int move_ptes(struct
> > > pagetable_move_control *pmc,
> > >        * We don't have to worry about the ordering of src and dst
> > >        * pte locks because exclusive mmap_lock prevents deadlock.
> > >        */
> > > -    old_pte = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> > > -    if (!old_pte) {
> > > +    old_ptep = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> > > +    if (!old_ptep) {
> > >           err = -EAGAIN;
> >
> > One of those things that's completely inconsistent all over the place.
> >
> > But yeah, I agree that ptep is much better for a PTE pointer.
> >
> > Acked-by: David Hildenbrand <david@redhat.com>
> >
