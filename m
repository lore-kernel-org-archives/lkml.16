Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167E525F975
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284450; cv=fail; b=k1D9pErISTCdI1PFbFYWiB7b78HLGVKsweHiHgAB3OLpybplL7+/j1TPBkzBFis4KKopCCAIXh1U+apZDWEK9qeq2wHGKek+84lSYxOjQF1Wg98jEtNj1xbw9044dRg+SHzThY+MhiVbX3cxHXfIBBeS+DLzKey8fWkfS/2dnfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284450; c=relaxed/simple;
	bh=2/tt3zAjIydYtn/drF1i7zahuXf3Kxx61dltGupDs9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ppN4PX6yfzCgxWwD15wtEREPUhXE5g4CeYo8zcHD5VwMwhj1ReHPBp6Pc0DveyZep43QnTrcMjQdMWgeU9OAxaN8iPPeMyGJxnPrdSt203gVEFczfZotALIUICQu3ODhiOA14B6DXvZ0x9ofzGObKcEdR8pc39q+1ZqKH7COZTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lBjhE/Kg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P6ya0c1p; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lBjhE/Kg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P6ya0c1p"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84esv006119;
	Mon, 30 Jun 2025 11:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2/tt3zAjIydYtn/drF
	1i7zahuXf3Kxx61dltGupDs9Y=; b=lBjhE/KgteL9eYXIPh4DMVv3t8MZdarwH8
	+/pmmM/H7ceeRI3iqhjVX373HWPleP/JcCW3bUmIyuGcEAEUZKhXI/79x1Fw5Me1
	nZ8/W+nopyHadjbgB5ZBU5H7w9JHMzVtFBgu6S8klpqxZkOvED5HJdrpYsCYRlvL
	tzc5VJIy64ulKPh+z941PpFXavCeROKYA+v48kpffMSxA0ulPu0KvV13UzK4Vj6T
	VxjmQG4vECvMyaHUexoGvJuRJy0QYhT+OkkuC5cIM/e7mb78iAxPh1tVBtM53ak/
	+Gih85X990AakkFuOa8JY7rPAH1RSjZxFh+Gc+e30ZV8Xy+qNSoQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704ab8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:53:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAo7Gg017276;
	Mon, 30 Jun 2025 11:53:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u88ahu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:53:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EREVLRVdrlaG/Z5lhWC52IcitsNxH95VDs0sBz2Ih4nBktiRjrTcEoYpnjkPfuYq+EhoFEWcHwnajrjn9oBYm/+dV/PMc60evdWQ8ck5F1UrOVKDjSN6y1TVDFk2LXEE6bEHj877dxsR2eBHcs4X7E54RMftNZOEOeQlB7IL1Bv4RkmysZu93an9PR3970kXy3ykokfhsGzK38HNvjDTp4rjGjZnGbyV3stRC0dHSaLSQYCejdhbXlzQ8uALoR4OAGTT5VsboSOUI6EGg1hSI/M/Zs6zlVvZaHhO53EOk47FqAUKCtTNEa3tb49iKy9x5Q1PUC3V/0dRp50FGvZG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/tt3zAjIydYtn/drF1i7zahuXf3Kxx61dltGupDs9Y=;
 b=LghGjIPktnf4P819db9y9TmCK2oqurSRXMBf2VIGjkqVPI/b9skYZBCrZRtoYMZZuT68Nc9vdwIw8Ar43t/2vD6AluKIuoxC2ikXiPIpq6AWoTZRMRIomYe5z1dp8L8eRfFxkvL0ofcvx586PFIggW/hcXe/szGODndy6shUJxFrQlCYltHt1bfq8B+VXcpU1uFs6SWPagJ2CZKAzjndYyai/OBd9TTA1QKW3UogPtbG5rbvKGiSr5oBKu7m+uq7MAHsuBcy9J8tm/KOPEbhIDO1kDfLZ1g8OkPiW6Mkx34o1DGwg/Tt7xM4SNiGnM6vXwHmVvhBF81SgDBlTclVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/tt3zAjIydYtn/drF1i7zahuXf3Kxx61dltGupDs9Y=;
 b=P6ya0c1pKOLlWDihZJTtE9oZ+cSQ8nBo0s9Q9hYmLZXXnBBAG3cvp6FQLfuAgoIte3qAoY1mYA8MCkRHdqfJbrrRB8EA6GyfYtc7YW3mrFU1+J867U11XLIML2W7lMllNo+Fk5dpL7GA8lpJ6uepi3RIe4rPF9D6byAsQvrEmFs=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by BY5PR10MB4385.namprd10.prod.outlook.com (2603:10b6:a03:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 30 Jun
 2025 11:53:12 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 11:53:12 +0000
Date: Mon, 30 Jun 2025 12:53:10 +0100
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
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
Message-ID: <65dc19c3-b2de-4e56-8f11-b8185f721c4e@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
 <79a48c48-53b1-4002-a8b2-447e69d96e49@lucifer.local>
 <3df4db71-752f-4c59-841b-84025914870d@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df4db71-752f-4c59-841b-84025914870d@arm.com>
X-ClientProxiedBy: LO4P123CA0693.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|BY5PR10MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: fc713902-d962-44e0-928d-08ddb7ccb085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tmtJuzz/xS45t3hBSueCwxddreCuqFQJU4acXk6N9g1WzsaOI1stG3iQ5e9W?=
 =?us-ascii?Q?vLCYQWJA9SVsID7cZqSoBkL1EE/7M2JS2pJ4Xha1AbBuG/qijpf5j4J5E4xI?=
 =?us-ascii?Q?OG0rJI4W0DzqtyBwKBHQ6TOOGG052SqT/tyjR+2yHpekYtPqUERtuWLxV8O1?=
 =?us-ascii?Q?24WwAdpFxuyWdlCfjL7YmwMt0DikHg4m2yJOeQNxMEjf7lMyIb3mYE0TjFHz?=
 =?us-ascii?Q?OQ71sGYyUSECO4x32LVFvyP/g06nb2PyKNAzdjR2adrzUs3XrEJjgbdzsFZ+?=
 =?us-ascii?Q?0Ipz8yC8fvIjx9DgVZOMzb2uYdMHLBy8cODGvbGCmfEIOJcREX3FIdaWU3Cb?=
 =?us-ascii?Q?SDRyi7lyNGoC0kmYcjLm/Q5GguBzJWWxqMaw3OME6ViHJkNF8QnstnmtO172?=
 =?us-ascii?Q?L8i42+YOqkqsM5kWNWhf0r20nld+lIbWtRq7FaOkg0zny2hkWUb8u7rHsT3e?=
 =?us-ascii?Q?glPghb91vbq6KPcORgBkIxyPDIFgNfo2VS1cAPIj3PWG1i4k4RomEnOKCVme?=
 =?us-ascii?Q?tQcljpM66nH4qA5WLKL5UpAIbvYwhudL7TnFfBTg61N3rjpNowUVCxW3G5pX?=
 =?us-ascii?Q?xWkc/R64H6E3loa2k9ppx7etB8bmhaf5YKPPP9JR5qjENRyprMz6KMHvwrc4?=
 =?us-ascii?Q?8vFfXmr/tqRV6oXhGDJVNfnqIZD37A7wQSWv0Jvz0Ad8+d3QILhH7vMhyoRQ?=
 =?us-ascii?Q?6W7NqIew7Zk4wN8sCQbo/Mew4BxWFFeqJJZNAiXXm8s7aatMFok1mZIAUTEc?=
 =?us-ascii?Q?j3ILv3XyfttE90Bq2C6gJRGIA2vCZnHDgnyWW+VZylU/JK3ZZQRsumiWcUAs?=
 =?us-ascii?Q?tRxa3L0+Lp5jiEmBHtbqxoyOecBaEJ+ljpM6neoJgoiKTAJYb9NutrRUBvhM?=
 =?us-ascii?Q?jJno1unLFp3Mpd0AtxRkp5O7WCsTAWIatKtb/szcuo4BXvLKCWvxEBx+eGOM?=
 =?us-ascii?Q?re1pLoaQq77AnLWfPMOHpuIPNJ+UQgUntOnNR64a2lx1yEtfALKpieRQGQl9?=
 =?us-ascii?Q?q0oY/kicBfvadfP3Q5E4wq0tiGbrsP+AjmLXnxyanlrUwa+LpcqY9rnoxGGs?=
 =?us-ascii?Q?CPYAAdEFBEYJXaMPwFze/rm+SZSzijpEBj0NknyDj/nM/a5T119Ps5PBWhVj?=
 =?us-ascii?Q?Gj4H1SL0l0XRJnBPRlQx1z6Abu7wqhv5sRPnNaKVDijLA6HMshNFfUCNklXl?=
 =?us-ascii?Q?vTLhMY9BDaI5J3ZVATBqU0pzshdyPhPswTIgLDcOo26+NAc5tK4yo7x8oCei?=
 =?us-ascii?Q?5hHeHHpQ9EoYzkHGED556p/Zlf6HV+XuZI3ybUBd4UjY/Zf+4gUPOGstLTCO?=
 =?us-ascii?Q?EEcbbckHI9NjFGp5BQ3AbqkFUpeAP3rh9w0+rhF+GUnaZTJyziKSCu90jDMJ?=
 =?us-ascii?Q?ldExbCUwWCqWtvNH+098brrdVZs612f2jy/6XjH8VLw0L/rOZIFhbiVSODIz?=
 =?us-ascii?Q?gk/5gI9JuFQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LWkX04sd6JL9o4PcKtfYNG8Q0Ed0Zb9yCGwussHcLjBU7rX39CrAmt8qc84i?=
 =?us-ascii?Q?EqKwzPmsqejlg7FMb3t1tJplYbk8MGSIy/32j4NJE0avLao8jeU7xAoUhLgf?=
 =?us-ascii?Q?ZNli5g2WOtcPRbFGesTpu3FS2q+uewhKFXKQsM2jvRSjYcsX6vjZlqKRECVI?=
 =?us-ascii?Q?wVbVS7gUhEuRAgcCoaOPI68VmoZuAkxuEVNOpv7xWRc0g09s53nRhukCb8xR?=
 =?us-ascii?Q?bXmZyodWrOGnQ9hXUL/wDBAIzAYqjG+oaZ/xGRyGh02W4shXyra9pOSwkgXg?=
 =?us-ascii?Q?Vlj485RfjC3HNTworgNefzbRXWsd8FII7H6mtrwx/WgERxCLHRznh9ak+bmL?=
 =?us-ascii?Q?Dz7uMvXT6v7HwouY09HNS24uOr3ToAHJCHI4d4SfXlj7LcaVGq82T0cdD/Wa?=
 =?us-ascii?Q?vrighZBDfoAaQDA0Yp/NOIn/7aPFCKIhPpQCjKhs2l2RgRkEnJQImY2Nq+Mt?=
 =?us-ascii?Q?WhL/c5cKtmuPBkSojT4idmCsz2y/OhgjneGSGBZf8wlnouG7jn3UQbX3U35J?=
 =?us-ascii?Q?IHW404zEf39KEXNrcVmAC54ErEzwPQaXu44b28npRji8e2Koik6JFEaiGvYY?=
 =?us-ascii?Q?t114xzuvT4egosuk173rChfOmIwAq9Hdg0UrschA5U2BoA14xLi7z/mh3+F8?=
 =?us-ascii?Q?izOzJch4pP8MDT189L/l6HsHwdec2jj4UuFirNvmvca6VMBJDkUQSM//Cd2Q?=
 =?us-ascii?Q?KarWrVmQu4roR7nUuDXcqvXuNZJrhiJiNq5Aa6ovoDf3YwFRoz3LSmWy6kEY?=
 =?us-ascii?Q?LuxonDoyDKxeK/YgTFO1/UBuNIB06pmAPRMPUBgNVLuYqRrndyHeLR+b+k41?=
 =?us-ascii?Q?R1Q7dh6vwwRf/xUIwpE3rnYwQmFEAZ8KfsEPdFRWie7vmsbhg8bho+Oqiocn?=
 =?us-ascii?Q?AkrKGGKHEOyx8IlHAAYx/6vmFO3EA5uwWeTRgs0nh1uJB5cRnoDyrSVpCQf3?=
 =?us-ascii?Q?OZtO+2788nSZj39wR63FI6RoNDVeLMRR7SRHrsvKbCvRNtslUJ5CZ6ztWfeQ?=
 =?us-ascii?Q?7h1oW/Cm4YlNhSRtOML2c317vAXPSiGOhBUGu74J52x7so8DbH1LrXSkxk3z?=
 =?us-ascii?Q?tk4nYHXH8R89EiklC1qx+LiqsXoxoJkVbOeuR5Q+wGB0w2oF1I1gW46BbWHR?=
 =?us-ascii?Q?pqShLQGLmsF2IGnNwnFNCCPiaMuDVxz9vAXiwULIwntuvHm/NwU/V9LNY8x8?=
 =?us-ascii?Q?M63+ht4FNJj4gInvniPA1V5e1eQI78QapFtdMG0khTrS/aA9DKEclEmLQF0T?=
 =?us-ascii?Q?4dKJSMDzeJC6UkoYEAJZGcnf3eAFoHM4igUjhq/a1siaLVBmtIPKFRWOMj/e?=
 =?us-ascii?Q?oibLSM07pGQ/x26N4Emeytciv+dp8Z+iTa/0hM+em9gLxf4k7XpULQcxsO3Z?=
 =?us-ascii?Q?RJm48Q5CurmYsx9wP6/Gp4wPGqWNvswnVf2HU7xDUnn5pVhMlKUVmY0v+/Vx?=
 =?us-ascii?Q?Xm8jty+akTweQxiELhOws+7+8/qszoARDuyzpXnJcvprn5+PTX0OgZ4H30X0?=
 =?us-ascii?Q?IDG0KcFMQ6d/w0smWmn3n/fY+yrIaHZ0ADT+48mP2Ci8J72608dYeEAJ6Wfv?=
 =?us-ascii?Q?S2VYN0a1zi2Gu54dtxF/W24Rxqmn03PjWywNqANrAnvCKXBcRt3U+eQ27dly?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qu93ML8KMvHcyqDwtxlVjIG8UQ1x0in1phaMy/G9GkwgBskMhmIw7pkw7+CH1FfU9PUrMzAYq7uD0PmxlQ3DrkD8m5u+nWaTRgdvrtFGq6/ATmTbVZrIfuxUEa5CzJ9ldrgy3YpRHmihsdaG6lLIVn5+egdt2v11xfFG5xdvgPqwIBxOWinNthpi8FVFIXiGSRVKRFBqQ5WQvrvNxgW5lYR/UH28aQvebnhgGhxIjYv40dtfBT/SDIePBCw9GvntwrD7OuWVMD+Ul/usOB51y2CXbQmqvkDuPCfyhcpycPaapPCuVQS6jC6TMUNUoLDsgeGTPdPMdg2cSFum9FVI/zE/mv2TBPoml0UuGjK/eY2AypEohdBZd9aNgW+558wh1k+02Cly+ajm47xUP7rMHXir4++Y7ixdKi5HAbGhBDKpz4tcSDCIPwxRMhe3TveRUhOXjEGDIEQd8AoKuv/auYWKmdUsp2woIAA5EaQBNxRqwAOr8OOWA5OhaTE2f2PG+5nKoBWR5Y15ljZfiAVSB1hX71IGBbIyhoALPKYWlPq9T5dtfWlViyxiBlg+f2qmU5VaERowNdFtt1Za6VNMWeRy5WuLd/45usKKhU1VYbE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc713902-d962-44e0-928d-08ddb7ccb085
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:53:12.3378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AuK0tY9paa9uYTef6BV8lfU5fnC+Bu2pH3hSyJhm4ZQpMceNOB1e8eTkQHYg3f3+Q6hsM5ttdFQt4AgXOmBPK6kQpM0iO9WlRe0FepxLug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4385
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300097
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA5NyBTYWx0ZWRfXyDWoEda39enu VozRabz2wsssCz3iRrhQNDnZWZg6qaiqHtgItjkQWnrTaGfPrPmgSF8gLvynHgCVvYD1kVOvCVU TT30xthHoA+XubdBIO488J/iMzkBKUE6JD8IVq2ngHOt3PLarvR4MielJBtjzDbkZFjTGWiLyK1
 54hVS3BvGAw5CouNsRbWlZesusI0leU1HOSe/mL3td1i+gExSEvFDC40+qznZ5hzWnOdJD2yOn0 OOJlFS23SKFe3yWke57+9QdlMK6APZVTtMIpx7Io6txN+k3u33DAS1DWnUcIMGUSmiFUCE/QBkt BV1dpQSKO7WIxbujhHKyStKIltCwnpHEPlEq2Zcf3GF0W8H97GspzmbkvydA5IIK+h52fplaLMt
 4efm4KUPTBw3JOL7zsfLsPqyCx6FjYNVww/yRrIOAv2HeHWCRYK2405vk6t0g3ASigDOV1ck
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=68627ab7 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=PhfGC6nqfEZMpBp4BIkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723
X-Proofpoint-GUID: cQ7ZZck-Keo9ldQ8-KPASVAg-lGz178D
X-Proofpoint-ORIG-GUID: cQ7ZZck-Keo9ldQ8-KPASVAg-lGz178D

On Mon, Jun 30, 2025 at 12:39:33PM +0100, Ryan Roberts wrote:
> On 30/06/2025 12:25, Lorenzo Stoakes wrote:
> > On Sat, Jun 28, 2025 at 05:04:32PM +0530, Dev Jain wrote:
> >> In case of prot_numa, there are various cases in which we can skip to the
> >> next iteration. Since the skip condition is based on the folio and not
> >> the PTEs, we can skip a PTE batch. Additionally refactor all of this
> >> into a new function to clean up the existing code.
> >
> > Hmm, is this a completely new concept for this series?
> >
> > Please try not to introduce brand new things to a series midway through.
> >
> > This seems to be adding a whole ton of questionable logic for an edge case.
> >
> > Can we maybe just drop this for this series please?
>
> From my perspective, at least, there are no new logical changes in here vs the
> previous version. And I don't think the patches have been re-organised either.
> David (I think?) was asking for the name of the patch to be changed to include
> MM_CP_PROT_NUMA and also for the code to be moved out of line to it's own
> function. That's all that Dev has done AFAICT (although as per my review
> comments, the refactoring has introduced a bug).
>
> My preference is that we should ultimately support this batching. It could be a
> separate series if you insist, but it's all contbuting to the same goal
> ultimately; making mprotect support PTE batching.
>
> Just my 2c.
>
> Thanks,
> Ryan

Ack, was my mistake, apologies. I hadn't realised this was part of the series, I
hadn't looked it for a while...

But I think it's better to have the refactor and the batch bit done separately
so it's clear which is which, unless the change is so trivial as for that to be
just noise.

Cheers, Lorenzo
