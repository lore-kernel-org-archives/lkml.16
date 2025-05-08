Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD71E1E1D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731123; cv=fail; b=YDZlOhdtSOiyC9usfPbKhPBX+Qjr5sBoUmXtlbu8DO/vSrpWzcVTXp3mdIqJohiQqrL/zfXar3MtvAC1Fo/GIxtZMC3GEqwhjCQAdIx8by4wQ6rm17JCxJBVGiE8f/GFVW9hHfS+yw1jsz/do65sMiQxVNDNOnFctKs0V6BGXmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731123; c=relaxed/simple;
	bh=cH5jhxrpvXPwtT3tAtLwkUNR+gE3ieIW/qQXpvyOgS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TZAAb8xanA8rwmf20EsD5GOWkcwHU2FLzcLwAGWoJFdDhVy2PgnPKaKFpDn1gm/ADKCDa+AkVuUEcl3GISeWC4E8pmWwO4u1YwlQIDR1fuIaIENVMcfw5BHEVjPxtGRJaQlqW52h6wAY0pjvSwLttABCpN3FYHT/WcDPA62suyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HlJIUAYg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AowtQcWf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HlJIUAYg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AowtQcWf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548IWSW0004265;
	Thu, 8 May 2025 19:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=oTDoOzZxhH4g3lHESm
	cX7o+ZoKC1ZTV/Ey+ZeOFd4Wg=; b=HlJIUAYgsBYLrPtdUfDep3ktL+F0u/nq9m
	ITkOZ90j/wj35VE0524fLk9/lB8aPCJEfBEM4TtMgBXq3sOqNpE65GitYVRyEKw1
	fP4Os//GO628kP21LK9ql2LAeHfGu0DSzkfaXKjrkRLX5vrCtmoQ5aJ1SwCsEXeo
	0ffzqJeea7EphMBM5YDHvmD9KyKlj1P+hS+B2YS+5Lw1Uc8wiyi3fTolLgY0eTk5
	43byYgWUhjrxL6/u/UYhBxSVFqXjF4oQqqKqx+0eyG43zKibWI8O4lsrfacNdihL
	XCztqvEf/I7WIhgO+7+47NqGtkVzMBcVLBlIKzVZTskL8rl5lcog==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46h1yr0223-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 19:05:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548IVjBu024375;
	Thu, 8 May 2025 19:05:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kjb3gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 19:05:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YemjDyjzBQDIYooB/g/Uum0a7UksdSOMOPOl2hSz9aJ8VPAtUDZDfSC702JNgBiCXgZ8bYBhepIjBmbLia+TS/qNorq4iIno18m2kcq7wyUPlaBrPSSgCWN6hAssUZ/QIGXIl+8b82A7wTba2ye4F/NrROJduvOirSIcadKEaJyIbWmRj1oDIY6ZZbaRiKI7U0UcnpkqhhYs9Naj38PV3dv/g54u+wRkzRblaHFMdtuwtML0sxsGG/ZMi5TQd6gFvlOhCY04AHtjwdxKQxWfzVqvvAVuzJBuu5yegjuiffdD3luNI9E4G5k4g9DY5aCPupTntC6vKyYVIaaF9ZoHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTDoOzZxhH4g3lHESmcX7o+ZoKC1ZTV/Ey+ZeOFd4Wg=;
 b=BHHiurbPf0Edj8EnvR5lC2Y2fPXSRG6+6QTGJAAJfrNgcSJUzICd6yWomn5tYQtv1TyAiHtFYsCU8mEY3WYxpG/iDTxjUW1Lu7NG63NqXv39uA3iqx+P27dISnMaOd8NZycscGPahDjMM8g++oEJ0lOzjhFAOKlRT/O63b5/smleEKrT11f1s7eYaGz0jbTjamH2wsfU0QNHwttT2A/T1ElD98tNN1GB98jrvuJUl0edYz/XwEEEeKCpUbJnCq+Q9H0bKKuGyJV+OHxQ8IpvZbHHLreTZA9gySN8d1XVFlPNfulWWTEAERQeulTxvQGlciZADNgI6+9AEv0RK9P8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTDoOzZxhH4g3lHESmcX7o+ZoKC1ZTV/Ey+ZeOFd4Wg=;
 b=AowtQcWf5DKCa0oXTj3zTgqYCOMAfTXUng1sRnHiIHixGa42NIF90MK3Qam/8wkO8mP5D+zgurm26a2+ozUgQaz/JgvZRQrqHQJ6h3+r5bo2QFEek682J72uWx7g9VjmxIVLawbfmG2BxjsCr8kbv5PnHJcyW5/l5ekQrrV77qk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BY5PR10MB4211.namprd10.prod.outlook.com (2603:10b6:a03:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 19:04:51 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 19:04:51 +0000
Date: Thu, 8 May 2025 15:04:47 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Ignacio.MorenoGonzalez@kuka.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        yang@os.amperecomputing.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-ID: <wpxllvzvr5yxmmz6cjcbxc3gkpfdlfxikvoyt3xoyjcjriqys6@befrpxo3o7fh>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ignacio.MorenoGonzalez@kuka.com, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, yang@os.amperecomputing.com, willy@infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::25) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BY5PR10MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7afbe1-9a00-40a8-00a9-08dd8e6335cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EgFQWfz6Sui9dIzjFoL1UPYO+B54Jdn7d4L4EpxDNGtwguDnX99rZruRkCP1?=
 =?us-ascii?Q?tJ0M/Q6eXVvFacuwCMcTZUVD4DNXbA7LnGq7Ze6MQiPXQYstljxVanIUsukt?=
 =?us-ascii?Q?Fmd45TrAYfgNwZ/JUjVJbIEllkmB2/QSzjwQ7KJ047TQ4iQhKOwhWyuSjp8X?=
 =?us-ascii?Q?WDXLGPpUM6tsmupdhDyHWoTJFb2KY8UU42JTFd+dynF++MuS7zQK4cNAoX5o?=
 =?us-ascii?Q?2a1NF7I0xnGcF5OwAeDDkslHb4cdKoEEyR5bTxUnVdZdaY9i+O0F2GTDgY/c?=
 =?us-ascii?Q?ZNOUkDHS3Upn6H70eNXahq360EhmdciScPDW9ZmheX6jPfhgqkD3hXVO/3cQ?=
 =?us-ascii?Q?XO0hwaS7ieJCGlhySue8/uTF0i9qzSRDnN1cr5UcwRR6cwCPwFlQO8d4n7/S?=
 =?us-ascii?Q?bNT7Hyr/ZqNdqOiJO6uQDhv2JTxD1AyQ5WGJXGgqtIz+IRPDZpahDe7msADQ?=
 =?us-ascii?Q?d0LkNOoMtcZSrb2h5L9Lb64ALwrzO0B0PeM7Xj3mwryMr5iYFlJaY5snbO8D?=
 =?us-ascii?Q?MiFtxMQhvynlnSI9HgXW65SovEcvFmywIyoeRhRdC+Iwk+ktE4h8fbG3aRaJ?=
 =?us-ascii?Q?x+RfF5tYmOlLKto6JvgS+w9Wc7Bd1GQHsCl9yJmrF6Lf0WgTfJijAuyx7qw1?=
 =?us-ascii?Q?8gCqhL7FtGXeTxff2ova4X8jsg26QxkGHt7RJKPBTCEe7ZD0REjVdcIzj/fs?=
 =?us-ascii?Q?RAuP/miZjzv+8U40PxhneUkGOGl4idXU0GnfSqH8t8cXAtLOfJHjW+02GlXd?=
 =?us-ascii?Q?Fg4zfbLBQwV1jRS8gMyI+6GWkZ0r/YmoSSGmUcpEV/eGLv8+wCpY3lQnZ48O?=
 =?us-ascii?Q?Ro9GaYgGBoKqyBI5wwNcFGkC3b67rVzd3B0oO/3vulfcHoQaXnusl5FZmdHy?=
 =?us-ascii?Q?DmG/7r5qKCslJz6KSFpiznBTIqk5s/XRT6eJHQIygBFQbQP108je7okQXQT/?=
 =?us-ascii?Q?xDGt89NFhFuiQhB+WPgWF7KcQsLbgLlAyYqPv4GfQRWy4eKufYmR9a06/w/Y?=
 =?us-ascii?Q?s1nzQ7DlM/vaew6w9efpBdNL+PpfRJltbat/MYNTiTn6WbthVYWUBWjqWuki?=
 =?us-ascii?Q?bcpPLYXJIxmPjgID1GRx0+gqmVYqUDRbsLYB1IfGdNsOPA4RDmW4XqiEwVrE?=
 =?us-ascii?Q?8yde8MMFNbWs4pZGYp75kqs9ztihrUdAa5zE3gvHysYsQc5y0tcXHoTgJEmt?=
 =?us-ascii?Q?BOjv7sYZoTy6IM/c1jqyKX7t7wvpUi/WDOLXdkyKZQp+qeehJHdqtFuJhvwt?=
 =?us-ascii?Q?WKW7ZcNVkB6JU7kBZOjEnQ2rusk/xRp2D8gebCxRorGkjjdlss9sVo8n5p/g?=
 =?us-ascii?Q?h+gwFdh9v9opKzctNNZpQrMX05PYIeHeCAKcePeYEpIi7h9f8r1kjWE70X41?=
 =?us-ascii?Q?hyF/u8PnazXFaWmnpZsSe8s94tE/SqNpkIFk2zAsYsyM/ejNIXhTZVLuIZvU?=
 =?us-ascii?Q?r0yRMTGbuWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RpDHt6QSNHYtQTaZv2PWJ+m81zzwDZZqixCWqQPFeJbNq+daSxm7/59+DShH?=
 =?us-ascii?Q?xN8/TWyiWyVQ0nvNt9CqEzy/s+659IQrUpxKLQufWpVOQYxOfsP+qNhaMr5S?=
 =?us-ascii?Q?lqpvDY42t2uUICTm0doUjGZqLnxZaDDgWc+vnKZRkovFxTCjdw1IImhEJvgO?=
 =?us-ascii?Q?4dOL6rlH82+U01bYkMSBrVK5sB4aH4HcjTfO8vp3zdv2j00QMXe4+2IOxcQa?=
 =?us-ascii?Q?TLNLb1UUglXLLdtQz/TCOuj52WeMmLF2H4pdeTKeIMfyDJYVQmyJ3Hw2m+1L?=
 =?us-ascii?Q?xxzNcWPpmXs4eVWm2/96dSzWN4BWDsdOdtByMnqfAuzU0j8xD/q/hzGoEFWI?=
 =?us-ascii?Q?Nq3rMXC9IDpMB0w49xNb2EQKuaixfn2vKH0ie8omuhIy+URgm336T4BSGghf?=
 =?us-ascii?Q?O7RQxNHsNkt7uTgFmEytaSkKVYgGq22yjZwzWriogWUieBbSknCNeX0rVIcF?=
 =?us-ascii?Q?eXT8T/w4hxPEzH+rVdqg8i6tI5JIofi9fiiPnWfklX7S581TDskZrGfjxEqm?=
 =?us-ascii?Q?dL3S5Zo+jMgU7oq3r25PL67r0hTvFI5k8qvaJHWYTLRxH6wPV5Q9bMXJf7Ut?=
 =?us-ascii?Q?8JtvhlSKoStEalYCFgDlJXtWbzlvnzB2QtMYXrBc6fwNHHGw/BM8qKS7+loH?=
 =?us-ascii?Q?3lTmddviOA8J7DTl4xLYy2+2xBgiMb+2uYs/P/d75C/POJCUn8YQBFL7V1ut?=
 =?us-ascii?Q?FV/OoN7vnrtJUhxzk4MX+rda6K1nwe9SKtDkhcDDxrc1AVj1w1T6Je+rOLg8?=
 =?us-ascii?Q?0ATYeMujYiN4FO8p54xNGX+Am0l6csB71Hu/g+uD2uaZDAkySZGUqNSQT8Wp?=
 =?us-ascii?Q?FFOe5bbJ2DUweYk8jd0m2snWDSUE5vgS/Q9r/qbGaAtuusqmD1LZuDtCxaPW?=
 =?us-ascii?Q?ZHTOEzIJFMSfVBIbjqVayzFzI3kHnelN/wIWzbk9A8M9G+2pNIRB1V8yn/Sv?=
 =?us-ascii?Q?8FoUQph1ebMI3EEuRypG1rcsirv3miXdrzRQsd4nFjxcAKArRx00FubbCjo+?=
 =?us-ascii?Q?kiPHZbkjFGvvAyZWzD8ZSwkw1ZW86WOfKJze11Z9jhlZ+lrn6oOBZh9mOw5z?=
 =?us-ascii?Q?6uyvIXLc0eEgpKqKwgX7gp3p0TZvn+zEhRuotvKtwLIH8HT/fNBDnsfUmkHB?=
 =?us-ascii?Q?qN0BXqi18ziIoD2KJ5T22zOaxCsELPDHn3fdDyT5k+4o4Tp31JxbvgrAw2E2?=
 =?us-ascii?Q?zUMTj5OtEMV13y06YB9DkSOfG78MapN5sAgBPv8aRNGkN2HYLpFkXG90lcvF?=
 =?us-ascii?Q?Ph63ro8rcSZkdX1SnZjccGPeDz8nAHes1py+M9N7aP7xB22yyyjM1tlOb3uJ?=
 =?us-ascii?Q?QU3R5glXEHP7WJ7NqskLvAEO9yufGF6OiCEATkUkO31Yrv9WvVMe8lIXwAFq?=
 =?us-ascii?Q?pqeUElDPIA8xJ9y+sSQI5JkSQYG8Ohzje2yT7kXb6Y2TQ9mFyy4gOddBM6Wc?=
 =?us-ascii?Q?eWDQe2biNAgMXri1Kg9dRR2FxIqAez/9HvzQULIfxpWFt3iHz8tKNTVIIuhR?=
 =?us-ascii?Q?6L0CmuO0X/VsfWasAocC7Qv1huITDnbQ0TZoWNG3Mml88rQZwcmKSlBuGanF?=
 =?us-ascii?Q?IJYpnwzEYEwr9ZZoLYczadFFLzbcHOvH++5xW9fsyJsVx8VDC/fcCuqrR0hj?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GwNBMQqDFM4Yl8KRQ6s73eZYuSRUci4LGj0OO9m42PYSMQJ1BedYtqHaDvNSbHSbMXihfesvt/Mt6hF6x+sybmXZ1SMr1YQKkqYY41tID0l11JIZBve1kBJfYgG2IanxeKLpkH4szgrMFpkX2e4DTxMhQvGPO0yDo7UuBU6GvaTRK0sbBrZ3ZfQZ0NcHQN/ia8zJ61ciEM7XHQ+R8Oiw5kXb74KXu67dm9EUKGWC0ossLUxRKhToP3iwjY2DNJCyXZBwZ/b0HyXlLw8JoWMF5X0P69kdo1uqyxaR2kgfmHaSWHqOJbCgPC64lh6A9vMR10U/DHaNiHdphrLNwgN+zYCv4n40/HWAbViWqCSdsvLUoo36cxsJXeXNqDcO/BT3TLfFxEQQ4xY2qLKxQdb1MhJjeuJmkT1JOcGOOlP2TGdgmUj0JkTv5QUlJdRiCqa7rmlW63Y8dH1xbMZh2ybiNrKx+eXWOIj0Dozu+K6fZFWSYpUWxWow45q/yGp7cKEJfeb8d8YtNDQAmKaVuwroLlYFucWr7o04DYQidbz8LUN64NIRimX0oInySO11kbw9UXEXDGCkZBxt1PtXcAVf1h15HU+gkrM9TwocaFPpQoA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7afbe1-9a00-40a8-00a9-08dd8e6335cf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 19:04:51.4118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oMLH0GilvlB2ox2EmSCwxUqpEaqASOWEfp9Jcf9eU7hKalHgMMOvsDVGln8mPpaPgseiM8i60F1eVaW21bt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4211
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_06,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080170
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE3MCBTYWx0ZWRfX4Rk7O8gCNQe/ 0WGRZRzGMA6GtZ9HrpfjHcsFR9zEA6xOsgLM2Qx+oXdLXV1satDL4Nd3qexogefXHTPcTX1T0QD /ssqQ+ekaDW686wrap359eASlNhxOAvGibe1sHbouhb2ItkIKHYk1KJrKorq8tXkfj3nF84PPCU
 ykSIa66S2l12lzY88H+ft+ylI+LGVwn1BvXXsMEUMXgA6Es5xGEQ+7bdQiizW3Zu38w8JeCBh3Z OJ97zsL4A6a1Y8W2Vp0iturVLhpEs2VlS3pZvbNsd+INj0O6eUb3cxEOZrM7R1qBizsXDcukgNI KDRMqxqZQBozgai6t5qYrcLHVLe6zUgJbg+V3jNLmyANz7tJamIioglA0ComCHxnwyvjayw9999
 CFi+CbS9JNOXdTt1vQdJ0njF6FyLuDajJQ3LnKggQ2OCT5rzQfeUokmgaLXW8DFTDhw5jANk
X-Proofpoint-GUID: yS59UO_zr8Hi0KdLvmP2NzJ2KQ3RBJiJ
X-Authority-Analysis: v=2.4 cv=WekMa1hX c=1 sm=1 tr=0 ts=681d005e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=TAZUD9gdAAAA:8 a=JfrnYn6hAAAA:8 a=wRhBkI-2iXOkaT8_QbYA:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:13185
X-Proofpoint-ORIG-GUID: yS59UO_zr8Hi0KdLvmP2NzJ2KQ3RBJiJ

* Ignacio Moreno Gonzalez via B4 Relay <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org> [250508 06:20]:
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> 
> VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
> it makes no sense to return an error when calling madvise() with
> MADV_NOHUGEPAGE in that case.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> ---
> https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com
> 
> Here it is presented as a separate thread to avoid mixing stable and
> non-stable patches.
> 
> This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
> kernels to return 0 instead of -EINVAL.

Sorry, maybe I missed something here.

Which one should Cc stable, I don't see it on either patch?

Thanks,
Liam

> ---
>  include/linux/huge_mm.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b07247707d16cc67 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>  
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> +#include <uapi/asm/mman.h>
> +
>  static inline bool folio_test_pmd_mappable(struct folio *folio)
>  {
>  	return false;
> @@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>  static inline int hugepage_madvise(struct vm_area_struct *vma,
>  				   unsigned long *vm_flags, int advice)
>  {
> +	/* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEPAGE is not supported */
> +	if (advice == MADV_NOHUGEPAGE)
> +		return 0;
>  	return -EINVAL;
>  }
>  
> 
> ---
> base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
> change-id: 20250508-madvise-nohugepage-noop-without-thp-e0721b973d82
> 
> Best regards,
> -- 
> Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> 
> 
