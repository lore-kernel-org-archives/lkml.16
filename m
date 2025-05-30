Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09913AC1
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602692; cv=fail; b=lEIyGAzP+4oEiDRLCHocwu6OJbGXXxYBz6ZtylEAsVRzUWhoixjzLnAzFwcQtGfHq9y4wRWkUo+7w9ruE79ORze7k4T3PEdzMj+HSvJBEZ5nCWUr6BEEqYS9/lnqeYq3cNrm1RNV6oWyjB5DTn3j6ZHpacAi2bbKYEdW2rEcnzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602692; c=relaxed/simple;
	bh=K2H2FwNV31bikTe9eE7nuaLrsMrALJJW+aSJeCxDdjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PCVWV12xsoPi2fOo1OflRiQlnG9RcN+WTsNS894uHtrW2EC9lTKVSsEN38VCy24p1w+r/eXTrDmoQAx7QvubBkrPQCSJZeODX4kkbhQ0gpfkxpYtgzYCZOzpjR+OX76SRTA6M1lpgXqTUupB6ZVhf1HQ3maIrkg5ijEbHhkW1/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TUB7vJb3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gkNEGvuC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TUB7vJb3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gkNEGvuC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAt2IM015368;
	Fri, 30 May 2025 10:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+InpXDdBabnVKVLwYq
	nndzd5tGCJG+m3xd/M2WUnrd0=; b=TUB7vJb38TW+TseAhco1t0iaCx3rmn9+C7
	ql2a/OHWHHn29KbmG5JtbkAkD0qsrYeIFW9l/pEEPory1NwYei3LNW8MTAFdNrkV
	lj+YseIyLXu6MrNz2UNlCMeHCZTT2WiTEE978BRGSoZ16Osbv16ryAhgN16BxDSZ
	BgLGR/H6Cxye+5Btd5vi17rs+11jAkv4a6V76oe/T2KZNcF7SCNuc/RXxxBMcoqG
	Ufi/7CU+8Pw7aS01XXDH3V0bBhk9jjDZOg9zQu86/1YYMgK4A+da05QlfXMuggsn
	0ho955ERke+wu/0RSSvx0DrxHb/d6W7cPWywWNiu8u11V70uzfMQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33n21p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 10:57:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAOHQT023051;
	Fri, 30 May 2025 10:57:48 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jcvcq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 10:57:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGyEzZXyNqS6sKGXDQ4E52rWZ/sbNqhduTg1sUL+jfWIDeUyrKV/MVlK3CdRGk+b5m3dQxlrGt9UssuNQGGi7KKFrAeZindfbiKc0LXNe/NFu+w7gDWJdysmMSNn5X7krrgo/+ufKagibxloHa2NpdwliKrNdr3PXf1KL1Msa7HMuZ6QzBw/7GqdB9K2xGRcOTfZFQM/Aj4vQp4oTsIeYdRxOv4s4WLGQUfs4BNgzZQ98VN65pkUW0uL7WYjjiu3f6WJ509NwTXZqvsjVkqYLikiQE3KYbKRbh8iLHIskRmn8rUmH0eWAlCNA2qtNgR1KiuXVRCg49NkWLFLOlWs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+InpXDdBabnVKVLwYqnndzd5tGCJG+m3xd/M2WUnrd0=;
 b=y8z2PQu4C0nKXB3KTwK2Y3raZTCyYEOfsRIgLRHorrUrkh0sWvKK6bbHMT6VxfHa1ct8vOn0Watj/lVJOPpsw6l/wwYc9jQae+rRkKL5+26ZeCrq/SH6092yGF7LtbXXeiJ6ja3Gk2dkpCICybrU5e0eJRewbxtcAAFzMZXgH8KVYeeSHtk0Gl0yJIjrXJeNxQQ4zrY/DsJVUQkNCTp1QC7DvzrZPcC2oqpus6Hx33c2FFfPYxsWasLfX5Tx4/8Blw0nqHO0Sp5IsLh9m/c5b6arsevHrSIdN1UN4zd+CT7wrKPbkzLGkT+/HXT8ard19mhKru01JtzI0gG0WJS2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+InpXDdBabnVKVLwYqnndzd5tGCJG+m3xd/M2WUnrd0=;
 b=gkNEGvuCOVKur2aD8o5cKtyM5b3piflk4ryVxSbP0RquZHv6Qo9BHxs5Ga/S2EhVQy9eDCsc2rQJadO397A0nDZBRvjmb/MqV9aA1SomV3dymVZ10FWxtePoyHl7aOXXbuJ8B9xkV2W1t6ijZdAg7HK5+mfTha5fW6Ckkq2oFtI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF972B28679.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ba) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 30 May
 2025 10:57:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 10:57:45 +0000
Date: Fri, 30 May 2025 11:57:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
        will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 1/3] mm: Allow pagewalk without locks
Message-ID: <6a60c052-9935-489e-a38e-1b03a1a79155@lucifer.local>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530090407.19237-2-dev.jain@arm.com>
X-ClientProxiedBy: LO4P265CA0314.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF972B28679:EE_
X-MS-Office365-Filtering-Correlation-Id: 5085be02-aaba-4eef-4294-08dd9f68cf1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Iw/7RmHukCgueeuhJXkGmc1NmsyTclbNmn9SABW6n90ZuX5c6to9PEggKL/L?=
 =?us-ascii?Q?1CGEcfQIWhupuTEU4cdZXiHd+oVOuVV+jLJsjRV4qCr5zcBbeCHofy+VJaz6?=
 =?us-ascii?Q?EOCynI5SQ/fOPHP70XEFPfhKrZ/ZWqB823gDPVYCgjgDMPy5L8UARVjbWsCY?=
 =?us-ascii?Q?2MAmBTWJikc8M8LWVZFjoYer/WOGcXuUyx2N6z3HDTwFpGTRGpqp6DYFGyVI?=
 =?us-ascii?Q?BvwAt1zLV/DEj5+V8UPrRyoFqwbd4T1Tgnw8wBBf+uSQ/mHBYajjK6aSnpoL?=
 =?us-ascii?Q?xa1Vnr987ha3Z8+ybfE32S8LpBbubIgbJuCrlkdIZEH1h0OOLkslHT1T/JcS?=
 =?us-ascii?Q?nTrOeqCCeDpUdLW4CiaRPjUdZWBtgKICNFdfQfgq+OvsbXAYcOpmImdu4Xex?=
 =?us-ascii?Q?hXBMV/oPuvCfykaG2xer8E/TUxYg9N5eHoqkeRRhsop7Bsk5i4DFBZqWynvn?=
 =?us-ascii?Q?39SUOrII3IyHckRn9EaBY3+sIPjjfXMtKulhLQCQg/bhhKgDmwEBPU/RGgbq?=
 =?us-ascii?Q?w0EjlB78xgogUU+q6Wy+RZSGHMjTcnohv7mTfkxOH8F1JCexSzr4Efmcu340?=
 =?us-ascii?Q?YGN556bOgIYEudi9MlHJy1WSK7p9SH9zbugoO+Bz7MLJVdQaxBVgXNvaC6b9?=
 =?us-ascii?Q?gPY7xpK1M7GG93/karm/v4MJKr6+ocYRr0iQM13b02cVLqnSMSofxKHxLbFo?=
 =?us-ascii?Q?9iCtZoS2aQ6bdoWqoHTeALIzEQzsUIVtpd0Jj0UkLY8nyClbWf7SarRFlzof?=
 =?us-ascii?Q?wmgCn6FjSTmp6f8HSXoindl7tcG2TosE0VIEn0y+bI5Gc0qzug/+nYHTG9PJ?=
 =?us-ascii?Q?twH5gEIhJwEurdGSymgdSIiGGIWJLK5mLQ2UQFf4Lf7hee+jb6lNrw/jHAkH?=
 =?us-ascii?Q?sAgL2VMfC1jCgrv04H/phdQCgTx6bRFk+CRIiokRGbmui6pIG+9gJ7rb7ho+?=
 =?us-ascii?Q?b85RaERwZMrPBLiDd96Ze2qwr09O+m2GbI0C5YdK371WjV5LaBTkQTrcB76D?=
 =?us-ascii?Q?ElwCjKLaCmx8MbSue/EPE7uaJsBn81iMXshCdEQlfmHdDaWgObmD7vQAYonI?=
 =?us-ascii?Q?NNrhTHZ8u09O/q46Y2rj1rYM4NuLKxUyvM3ZEpFbtO4ALiISxXvbLMp+V/PD?=
 =?us-ascii?Q?LQ545PZcwu4Jb6nknSW3STjZPktt8wpx5A+XV3p3iiS252hq0+LlfUGU798P?=
 =?us-ascii?Q?hZ5HAnp6MuPoPMlxqbkGK84ugMpbAxsM7iwSiVe39S3SJ4joH3NhECO75Xqz?=
 =?us-ascii?Q?IhsFLIv284mSZF1lVDF++ybt6ZZmaARmnRkKqTjWc1t7dqhz1z5W0b9F0g1v?=
 =?us-ascii?Q?Ptst7ltZNKweyxs0eGIRZbbzSxnevtoiIe5aa1FznOA2ZEbuYhNRDm7h9Yoo?=
 =?us-ascii?Q?bXLqEul4qo9Tnkwuyj8leEFRv6Ofp7b+8EvWAq4yXCy8UHBpt3LW6CeFB5a6?=
 =?us-ascii?Q?PKImPIeaXwQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xhiE3irbxLMcFtzjUBhLoj0TCtASEcdjbJ4FSWgUM3hgHlFvEMkU1/XvrQ1v?=
 =?us-ascii?Q?q5KDvMx600tUwi5wpoueR/2rwlcABiaUDj+LUA+YK4jiRFx6jHHDuhIvv7ky?=
 =?us-ascii?Q?f7iPnubw8FVHkyOj7j210YbzR9o8gn6hxUq1Yo/NNtksQEGk5WP7n//GcVdE?=
 =?us-ascii?Q?c+2awIIc6V45bmIHG7MbliED5Ab6DG88HmDGndQsa5ZKxyHS6MUKSjIUbmur?=
 =?us-ascii?Q?Cvw1Wl+E9mKr2bmm59eUqvUXZGgkg+rYyqntbZ2x47GDzqOxRJs4snkVI9fW?=
 =?us-ascii?Q?DdcNT2sDTtj5nyK47kMlkPShvxdcqe8e/aZ6v2A966TNhsnVkUon4fie9Rab?=
 =?us-ascii?Q?3jm9lD1EqAMGFDL8f3g5UWRVxbT+4qIZVWLEWxzYpfMm4nL+6wAabawpuHKi?=
 =?us-ascii?Q?pC+2qZ7cfYLKw+0LvKK5p/FZzRL4E/ARcf+p3LLprXgnU0D18Ke5vsTvZm0K?=
 =?us-ascii?Q?N/ex6APkhYO/2g4NBG4vxeRmanvWIMjO2dHeGzUt6JgttsnpzDsDzWrZHM3u?=
 =?us-ascii?Q?4Zdt8xpJI2x/8Q9J7DdZ+9bqUFrm+nzNL7/8pixZxtYJTqt1WFIjW+3z0Rz/?=
 =?us-ascii?Q?968BkVrwbFAEX89prvBYHjGxi8VXg8zKw6Oy2WQI4ryk60FHJO9x6idNRXoA?=
 =?us-ascii?Q?Pn/2/C6ngX8O3xZFkNblvqZesnHdl6H8KXkKF5LL+3DrBkSUGYb3dne2BBJo?=
 =?us-ascii?Q?edo9t5Qg0Q0xppmbfPE6kaiYHbGYmxVAMaZ+2zocGodo0hnKqBxKekKMHtSj?=
 =?us-ascii?Q?pv8/Xis/QtMuJN01zSiI8fZUPHRrK3bjPzCPFh4NPoqj440roeEL2BkGuuyx?=
 =?us-ascii?Q?lkh9CldsuUXYNcvSyrpfy4872LTfg+TkYcsbrlugIbleTuofyAKkFb8M0Cgz?=
 =?us-ascii?Q?OjQdTkOAEj5cITk5OM5ijwrAeRvfjpH8rjO7HUOx5Hmhv5XWapxFd558rlpn?=
 =?us-ascii?Q?vVRSP9T/l8RfYvS7EkQqEv3peGi421eKZ+Ejc5xq2a0NeJHu/l33ihYkF7mu?=
 =?us-ascii?Q?NPvtigo7DUWfr5CSd/69qhgKh7NF95EOWbvUbeaj9pSIGoyOu9YhioX9jm+v?=
 =?us-ascii?Q?lnMdTG8iwfeujsVbgbJ98g/Nqj5sl6byeJ82FTQSJdCvvbsOLTUsbmBgtoU3?=
 =?us-ascii?Q?aUB7r1a5jW7Fy30h0rPPgtv6Ddi3yOET991eKYztqC70Y57p+pJBHomUzeGZ?=
 =?us-ascii?Q?TQ1dAgLUAe3u58msNPCJNEodlfEMeKBQgP1pWNmQy4IydfOQ5w8/q8yjskN8?=
 =?us-ascii?Q?Gwj4Z0c/awPlXmPYkG4COP8REmrhpb7epkQwfDwAG1wRs8zOe7bX/afKUgb6?=
 =?us-ascii?Q?VtUji7HmdFogygghHAuh0GdOc6uQG16TjxMRI6rWri5tJDeCPO85HK2rG9Zz?=
 =?us-ascii?Q?zRPM4gxjbeiRXInh84dstFH9QGE1IZRr3ozoctGkwCWl9SX/VJkZkj8wjbg5?=
 =?us-ascii?Q?bTlP6NK/ini14Q6VpYtLP7+Ovogihsmz2g59cl4Ld3RK8Kja5wadRMWq0x+U?=
 =?us-ascii?Q?rQrLIInFGuEE5Zu+mX6xlQOPtjk2j89zgxn9KDP28wdKn7pdLzoxiSPJdpff?=
 =?us-ascii?Q?lok2oCnACTvWV2lDNRuyAV2e20ijWC7iJLPkRk0AMsUts34qA/cdNmHT1Fyu?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OR97IPSvFU1wXFt5hPMEwPws4MhJX4GUbJz1KHoMD0SMsSuT1+7UBqYQ74JOe8H/KhOS6z3W8er+GWkUcoSV8Nxzh2oHKdbc4qSvxBErVkz1v9cdOEV0aNeFsh3hWdpq5kJ28QvaGQhZgxGqT60IFWKXjmvrNBxogItcVA5YhaBB2qXVPxBF2VKpAHDhR9LZV6Pb9y5sktQs4mIS3PPMp4PRrJuO6AqybC7pGIy1ocaA9OCz4ESajyb0l5xIIbWVbZIY7zDekMEeOuT+mnIGDS1USH5TU0o8GvhlmSXWR8TZW8f4NhvYMzNV+JB5AC38qT+DEZNArXlrp1VibCzQMUKc5dFneH+HYGR6IfGVGZoCICKm1ohl/ONnfeYxtLXtgEdta5YAqyIH5LD/Fhbk0PipHKZy+RdcMvixY1tE58s7A7qw18zCpJx35YSGZPIMu/nDlU5JL5EvfUZXUDbcUG07yjQB18wmDuUB1M+uh5l8SqQbV9gj0uaLFI4ANr5/nnfLu/gpeIS/ylB/KCFR7rO88yIjntec1RWTNUZfp3XZfPa/Ui0pDONioeYAqT2mJrO4QbMivC9dF+EOLBiUWsc6ajR1ZJPEWezhQoJWWr8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5085be02-aaba-4eef-4294-08dd9f68cf1b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 10:57:45.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwOCxX1/bZHsFyFvwevCeYk5rqSzGCOzXYl4lzh9Ayhgy+xcrjvUTphxQW/X7gApdNg94H+rvW24NsZK3505/ZE8xILNrtHBq8zk0J1EnQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF972B28679
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=766
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300094
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5NCBTYWx0ZWRfXzjQJavQKUc/e hRmkI/uCF++EXrg6BnxL0VpxujcESafg+vUxMds2ML2AaAzqW2aUkGRM8dj8whBgcdDQfzCsvgW QpxKFvoxXQXTrmQTkEvNuU3YqlhyCa8qsv1+hYZf0WsgmDbXs1Fby9ycFKwU5y84d8XZ5V4ouH4
 bHw875aOsL/pvXv26psoYJHrcyl0gdyyiONRoTHsrTe/yi3lJxmB7CX9t/MYkKZ8BuHERtNycFp CsFx4Xu2+lKQ+kVG+0ObRWARi042bLZJQhOo0Ye62FAA/GQqwdFVQTnngGlMZmgdkEFEALmDFi+ wrXK7Dvwb6jvDTAA8hC5JFnHSYYqa6kPuNYjRx5aSz6oAd5iIuI2Bdc9X0/lzotqOJ9kQ1u0UtC
 Q/1P7CTzKLH/r+5iOvnlyI1v3oO0pL/Gk0Uaxg3bQm5pMUYqWOSRhTX27/h57ZMCayHxo1Df
X-Proofpoint-GUID: -j04swdBAEAMppxa0Adgjqe1Ot8IL_2r
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=68398f2d b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=b29DJYFuNLEv4TLQqRQA:9 a=CjuIK1q_8ugA:10 a=PG6Q-FFm6skA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: -j04swdBAEAMppxa0Adgjqe1Ot8IL_2r

+cc Jan for page table stuff.

On Fri, May 30, 2025 at 02:34:05PM +0530, Dev Jain wrote:
> It is noted at [1] that KFENCE can manipulate kernel pgtable entries during
> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
> This being a non-sleepable context, we cannot take the init_mm mmap lock.
> Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage without
> locks.

Hm This is worrying.

You're unconditionally making it possible for dangerous usage here - to
walk page tables without a lock.

We need to assert this is only being used in a context where this makes
sense, e.g. a no VMA range under the right circumstances.

At the very least we need asserts that we are in a circumstance where this
is permitted.

For VMAs, you must keep the VMA stable, which requires a VMA read lock at
minimum.

See
https://origin.kernel.org/doc/html/latest/mm/process_addrs.html#page-tables
for details where these requirements are documented.

I also think we should update this documentation to cover off this non-VMA
task context stuff. I can perhaps do this so as not to egregiously add
workload to this series :)

Also, again this commit message is not enough for such a major change to
core mm stuff. I think you need to underline that - in non-task context -
you are safe to manipulate _kernel_ mappings, having precluded KFENCE as a
concern.

>
> [1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/

Basically expand upon this information.

Basically the commit message refers to your usage, but describes a patch
that makes it possible to do unlocked page table walks.

As I get into below, no pun intended, but this needs to be _locked down_
heavily.

- Only walk_page_range_novma() should allow it. All other functions should
  return -EINVAL if this is set.

- walk_page_range_novma() should assert we're in the appropriate context
  where this is feasible.

- Comments should be updated accordingly.

- We should assert (at least CONFIG_DEBUG_VM asserts) in every place that
  checks for a VMA that we are not in this lock mode, since this is
  disallowed.

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pagewalk.h |  2 ++
>  mm/pagewalk.c            | 12 ++++++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index 9700a29f8afb..9bc8853ed3de 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -14,6 +14,8 @@ enum page_walk_lock {
>  	PGWALK_WRLOCK = 1,
>  	/* vma is expected to be already write-locked during the walk */
>  	PGWALK_WRLOCK_VERIFY = 2,
> +	/* no lock is needed */
> +	PGWALK_NOLOCK = 3,

I'd prefer something very explicitly documenting that, at the very least, this
can only be used for non-VMA cases.

It's hard to think of a name here, but the comment should be explicit as to
under what circumstances this is allowed.

>  };
>
>  /**
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e478777c86e1..9657cf4664b2 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -440,6 +440,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>  	case PGWALK_RDLOCK:
>  		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
>  		break;
> +	default:
> +		break;

Please no 'default' here, we want to be explicit and cover all cases.

And surely, since you're explicitly only allowing this for non-VMA ranges, this
should be a WARN_ON_ONCE() or something?

>  	}
>  #endif
>  }
> @@ -640,10 +642,12 @@ int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
>  	 * specified address range from being freed. The caller should take
>  	 * other actions to prevent this race.
>  	 */

All functions other than this should explicitly disallow this locking mode
with -EINVAL checks. I do not want to see this locking mode made available
in a broken context.

The full comment:

	/*
	 * 1) For walking the user virtual address space:
	 *
	 * The mmap lock protects the page walker from changes to the page
	 * tables during the walk.  However a read lock is insufficient to
	 * protect those areas which don't have a VMA as munmap() detaches
	 * the VMAs before downgrading to a read lock and actually tearing
	 * down PTEs/page tables. In which case, the mmap write lock should
	 * be hold.
	 *
	 * 2) For walking the kernel virtual address space:
	 *
	 * The kernel intermediate page tables usually do not be freed, so
	 * the mmap map read lock is sufficient. But there are some exceptions.
	 * E.g. memory hot-remove. In which case, the mmap lock is insufficient
	 * to prevent the intermediate kernel pages tables belonging to the
	 * specified address range from being freed. The caller should take
	 * other actions to prevent this race.
	 */

Are you walking kernel memory only? Point 1 above explicitly points out why
userland novma memory requires a lock.

For point 2 you need to indicate why you don't need to consider hotplugging,
etc.

But as Ryan points out elsewhere, you should be expanding this comment to
explain your case...

You should also assert you're in a context where this applies and error
out/WARN if not.

> -	if (mm == &init_mm)
> -		mmap_assert_locked(walk.mm);
> -	else
> -		mmap_assert_write_locked(walk.mm);
> +	if (ops->walk_lock != PGWALK_NOLOCK) {

I really don't like the idea that you're allowing no lock for userland mappings.

This should at the very least be:

if (mm == &init_mm)  {
	if (ops->walk_lock != PGWALK_NOLOCK)
		mmap_assert_locked(walk.mm);
} else {
	mmap_assert_write_locked(walk.mm);
}

> +		if (mm == &init_mm)
> +			mmap_assert_locked(walk.mm);
> +		else
> +			mmap_assert_write_locked(walk.mm);
> +	}
>
>  	return walk_pgd_range(start, end, &walk);
>  }
> --
> 2.30.2
>

We have to be _really_ careful with this stuff. It's very fiddly and
brokenness can be a security issue.
