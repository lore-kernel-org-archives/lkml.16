Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF42AF10
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610881; cv=fail; b=RfGD5ApkLL1nTvDfwq7S02mhgegK+RnLG58r9zItZsZTXvBe0ZhOjXS70bP7PCrz1wgQ/XiGQlM1EXdM+wewRCeUmYJZkL+zmmLqSzNi3RjIN4SOCOCmlf8nuJDkwVXwph+chEkfCgLcSO4tDkpsP/q67c4a1/tBZqNQJoWccdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610881; c=relaxed/simple;
	bh=jn2gTPTsCpJFk8LtwalGn8Eb490kWxEIYiRTnZaZDdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WE39i/pEmuLzeFNyf6oIiqfXLS9wxvfwuwpRdZF65hnk3vTsYqVanPW+4WGMUdadUbuHLNatDDDF21XthtKk+d1mm9UG4STxvaxCj9r4sOisvGqWi7DMtHNQ1IxHrUx7BvF2kGT2S5VX482CSAVExs+qWExFYSYJAQ79fdtxPf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VpBM90k3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wPG86Tci; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VpBM90k3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wPG86Tci"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513JMvxO024984;
	Mon, 3 Feb 2025 19:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mgO/n/+leKTvbWS2FB
	nuIx0aL7rmm+68MrMlRPKcxxw=; b=VpBM90k3hiG72d27hXTnqqoqxWx/I/ZnXl
	RmlQaKIG2cOeJ4B6AolWEcEfXmcwqNGYIX71TINjpkJFnxk+5WkyYvKbGsUUP6Ju
	4KYCoQWh6F7uVhSSCiOhv1M9ZYQyhZeaFZe9efYv3vYCLIB6cAMRsufvsAInPV3E
	Z8Rn2cmt+wVGI6B4CNgJcqVGnRxTz9sk328KGRmOfu8uQW9xk1cyNZ+IuXrOhMZX
	Zb3tk29unGP74L2ABJQT6GGTTz9yuXEDFX2phqib9PfooQv5ZSr4YlKN+t4vQQ6V
	ioq3uU4MKzyWSyLIxXJQLPdWFjnWZVeRA6ihpJwaDqpuobZ5x7Hw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hfy83d3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 19:27:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 513JOFe1039048;
	Mon, 3 Feb 2025 19:27:46 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8e6sxyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 19:27:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8BJV3o+TJvohH4SHNwCp7AleFjfwT7Krl1MalyUgOVEnN5TzePhtu2mNqkwiubBdCrwY8Z5VsxrDQp1NpQyNERgfbG0WnK09Vzx9HN1PdXfVS55SjrxJPlQ4ReJ+zTLXXTYNQr9EVHhKSd1rIjQ9V9pcediPXz29Q5TQY4DMmOfLsqNioYrsN/EfeSbcd+q2LZwERKqONrzXUsW8f0D8HOdXg+5G1ZSu/NJa8NpPEpSP3t485Rkb72YOAyg8VgxL2WOQVkjLk/Bk7M9zYrVQBc3bPtYo6OX9oIOf3YS/9gOBWLDb/OHr0N6mF9O++wxSK4tukAEnfprFNEjW6CPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgO/n/+leKTvbWS2FBnuIx0aL7rmm+68MrMlRPKcxxw=;
 b=pezXq250KUWJxOPXeoTijyJB6/fzXp6XeYEPGXrcuExK+H5v4yhyDTHaotgsbKcXtIAcXklFzVcuq7ggKJC9tRvxT+GyvbAVCivQbLB3BmH34pBRAX1xhMAHSvFGeQwlfMfG6ZAxBz1NC4xHSjBepmPf/2yox/d+CuCUm21bSHIbOVQhMr3NyaY7crDhi9AaJoOSa1AFkRThp90dm+MaU13+1i3w5KiCIeGD8u4MiYIa/V1ENBv4MUp1bCjEQLeL1C4Q1kG1Qu+goVVwvCdVcJNuwlV1pke611n2Yllj34DTG8EYPjk7NVn0nK26gw9RztzfhqdExsJ8wTXWozVNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgO/n/+leKTvbWS2FBnuIx0aL7rmm+68MrMlRPKcxxw=;
 b=wPG86TciCC7YIfJ0HhpsDdtjovCoFb+IgUjpToFy9CeOdhPV4ATgvc1v1zD5NNJ31hYqg3toonT5hjVFlEEQi3G49L4AVSuXJVys9uKRvbZoQhjnuY6o17JOWJLVEah2JPBUMa5QzwDQZHn6sUViTmKBoW8JvfmVEJKuFSiaXFQ=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA6PR10MB8088.namprd10.prod.outlook.com (2603:10b6:806:43f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 19:27:44 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 19:27:44 +0000
Date: Mon, 3 Feb 2025 14:27:41 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] exit: hoist get_pid() in release_task() outside
 of tasklist_lock
Message-ID: <eqoac7dyanvez62nc5ge3lfxxxbjcln3k6nrz4tkrg67v55sdb@sosx2sguy5f6>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-3-mjguzik@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201163106.28912-3-mjguzik@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA6PR10MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: e01e93f5-eba6-4d30-34e8-08dd4488d528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t7pdO5MCqdFClPTQBQ+k6PHWzikUgemuYW34gZUQTo2Jp/mavmXpjA2WvVTf?=
 =?us-ascii?Q?ZgNjDSDv3kEizEoWOlqjxJ1lxrL7mH/i698cRdgXRhCUUXx7e91ljcm9BOkR?=
 =?us-ascii?Q?enRzlouqzNkxPNjZvBVXL6OM/xlc4frjprZZ0My3S3LJN3/NnT7oUftlfh6/?=
 =?us-ascii?Q?U0luCZw05b7oQT/w2PLvcz67jR1oCbo+bcTVr187dxmvhkgzLs3pVuVGEJod?=
 =?us-ascii?Q?aT+xZ7/lfhq/pmAd7pxym30xqmlMrrYvcxbpebp/mEYPbiNVIbs5EmlZC1ri?=
 =?us-ascii?Q?qdoNLAsnhmfgOVUfHO7GokgYbF7elqFkE44mrGrHrrs3JLgsnQ6J/JiP3RUS?=
 =?us-ascii?Q?Eh2oPDG5/rAg1LoH33vuWp7y3L5DsN9THlMvpyFTDxTFgraD+gmL5F1YSPAk?=
 =?us-ascii?Q?dKujnfctYXUvWp3fPjmhCeAPWK8M7u6EcQDHWffysr4O51iIJqWslm1yIL/K?=
 =?us-ascii?Q?8JX4MSBWdvAEdSs4Y5VAKYn6eHejoinDqdMOu+YbPQC+b4QxKmooe/tfn+IF?=
 =?us-ascii?Q?NM+P7AUQsnZ2wOg2Ser3JUUdN/DNtQGURiF+reLW5yLCIO/qLAV+v98vfOBq?=
 =?us-ascii?Q?8CPDaR82HTJrMebUyEgFSLNH2IFmoAO7+B0wGI4XYgcMHAnqq7uF/5Kf8DUv?=
 =?us-ascii?Q?tjpzZOIBgWBvHAI7NssNiYHtXrpFukEivLzdOeXCuUR92mTgE18VFQ/y1r7z?=
 =?us-ascii?Q?QFLjtnzqnC8XxnvXvAlZ1w6NSVRKuo8ov/a024XDyYoulaXfbpYMVStu+GyE?=
 =?us-ascii?Q?/IzpoO9mMmLsKdhxzzvV6C5pq2IpVHB/6P+ezUMBZAG+65SsyXBJSCFSqZjE?=
 =?us-ascii?Q?RWVm09gar/TKmToXVEsTqxGb0AK/Pgfn2y+4GnE2ktSn0hdAQu8n6GpqdLeY?=
 =?us-ascii?Q?ozN3bHNNYv+yVgQZVPZKgQXdZxuB+zlCR1jTG9WhGyGzcb0YFccTWDzMDx0z?=
 =?us-ascii?Q?nVtbBjsTpqr/Vr005fx8vNH7J3K148ArcSfti6dPNVX0jQ2waEnr1H0c0RQt?=
 =?us-ascii?Q?OLjFX8DTFPM2RaeIksHWX/Av9+/FBUzetm/5K2vCm3ccJDo9VIzWNCXD9LOd?=
 =?us-ascii?Q?MI0z83u/OvK2ekt0LbOiemCxxHe3oHhurQnUNtx8mi7fkOAXN9cGDlANUmhJ?=
 =?us-ascii?Q?DDk4z38S2v6JYgrnJZtDJ15haVDf1qB3GyTMXwAToqM7meGbnTGbkFw+4YJn?=
 =?us-ascii?Q?sC1oeb1MDlyFVp0xc/Q6W3T9fVS8Gc/xHQ+c3HYUVcofi35euY3rAzMBuCAC?=
 =?us-ascii?Q?mjkp1jfQYIN5dQGT3Sjlua5OVIxdXVIqa2NV0AcG/jRuNKBWC8hZcffth7m6?=
 =?us-ascii?Q?vR/lLgbxqhbWnoDDeV8XPBaNvpcJmEH0PedWPPwZ8OT08IHxftH2xmcLsVpx?=
 =?us-ascii?Q?3GRanI2sG4sjeH2LGLzI34Kr7ERQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?klLkTcikRv3JuPpkkmQj4HKmEo9pcbjkL5P89yc6ZVXiYbeEfCI5bjH3jZco?=
 =?us-ascii?Q?7ltzlA5/EXEAm72qpGRGmQUtxJmOUB8Q6vPKg79eS2ZTB3Fq/xDeJZLwdbVe?=
 =?us-ascii?Q?Ieoynq+rUBqtrzaUr9m2o0tZP2zLreYIEGVPOV/nyTis32QzaeGD8l5S65LL?=
 =?us-ascii?Q?fTt6QLSmKmVAYLwMDUZVKvdlkD/nauWOkSGT9r/RzOU07STo/ZPUvWQcWtte?=
 =?us-ascii?Q?wBsd7hItxzqq0CzAxBFN4K+1MHq9BLHKjcVu4sJjdLda+jJMkg1KBatRiJ3J?=
 =?us-ascii?Q?byquGWpc8rejLxTvaW7ePzWe4A1Ujg/DJatmFIORviO+X/kG8JutwR08BBfF?=
 =?us-ascii?Q?Ln8vptCV5Aq9YJoaZwtwQiiSkvscj7cjKnJetxw7q4NuHe2s2xWZTxIVlyLn?=
 =?us-ascii?Q?yChIfyfziSar+coIVo0JprOxIUcYoQ52noZHWXtrAFIZVHtYeSoe1ylZ6Ud9?=
 =?us-ascii?Q?JcAeNxNCVNWyESQDUpqumvG4EKkerzKbOAjcDGCi63X5RudxvhdtQnWidBuI?=
 =?us-ascii?Q?hnD+YOZ49wvFpZMmClXV39ZwAJ9uwIqdXu/v3Odkm0pi2b7BHN89GhwIELvo?=
 =?us-ascii?Q?hBM0r8iKVg0D5bAi4Q3F6d6GziBeFvQ7xUDkbEh52edlEFybrQ2VUal/TUJU?=
 =?us-ascii?Q?4rfdUByoUU7tgRE0NtaQRsZZq+qTPFCCjpPv4Fl1qf/H0YNgxDtuEFJ7VtP9?=
 =?us-ascii?Q?X+zw0lykLKLNEF2C7J3yKcjCwJei+WrhRxKdzpSEcpmBLTr2v+f7KL7yEFwK?=
 =?us-ascii?Q?HcPIE3KkjI7sFecaPM+KnkwgefIXaqxqWZNrfsIdTLfalHzKW0q7bIEqBhqu?=
 =?us-ascii?Q?enjoCKIOLHiYyff2Sd8b8a43ujthGrdQMd9eNarnvkJu/YER+yTf6K2+T5LW?=
 =?us-ascii?Q?kXCEhODJPud3vnobg/vZBys141EX0p9kaWerxNnklF+vxxhl35wFc0v1y0r4?=
 =?us-ascii?Q?mT4TDvbx4N1IA4VcN1tlOq+I+AZuzSpfCieeGmGUmvB+L+S7jR8rrv1tfoao?=
 =?us-ascii?Q?w4iczcVHiDBbHHIu1OyXcxIU2XXdDsVLnVScb5xEU31it9+nDg37N5wsBed/?=
 =?us-ascii?Q?m+ypmMwn+nw7sJMs6m3+QyziC/nOxf5nro0V3LNJ4dCP+gDGcd4VlUx3AvLY?=
 =?us-ascii?Q?TMbzlNIyN8fOB/aCvgfLaO5xs4KbUWHas9LEpryPfJhdTHm4JvR3/kcYNPzs?=
 =?us-ascii?Q?1Yszg5BDiX6Qiqbtu4XOS0yyqL9EFquFHvbdoyUYeYgdwp8T/KIaF+hqgo9d?=
 =?us-ascii?Q?8CgbABJfNgDUMj3iuSa+d2SrynLeO/6mm/7gvi/1ml5q4WkfOnPhBEb3tfR3?=
 =?us-ascii?Q?7OF1OHUeyGO8wkaJKiYXkHX1d63TJ0OdtQPrZG7feqmDXNIPefmsSMjwT3nl?=
 =?us-ascii?Q?ZMgOd5BgXPebcAoBZb2WZRcIqtksJoAVZC3zal2CyMwYRvR5P6IUadd54ao6?=
 =?us-ascii?Q?kX55MsV6jA4A72I/r59XGlMQjIQ1hv4+QVku+GkXRDi3DVFEopcBnPknVLTF?=
 =?us-ascii?Q?7WwtJXgt94YT8nFMYIX6iuBdoxp8ZrRUyKBZxp8jy4ZuwIFmFqJrvBuCCf6b?=
 =?us-ascii?Q?z6N76jrbXSaX7+4PH9VC+PIjRSJz5fol6GjqMbHQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	avnf6fjKctJDJaOFefrWtNqBJERJxF1sPwYVC0rqMtsCPyqgRmIviTeHO5WTyeyEPHCKwNVlZVlTrPXJTLIHcnMoZBXisBRqrzngdch++vn5bGk8ycWfcUw/BbtaHEzP3y062jVR7x6BUXdKtuk5g1p3+fNke241iSEsFgnNy+DwmMlip+kLApPQNSEuchGdEnYbZu271nTDJqjb/L9tF5JfqO0Z3TsYKkM/LM5Svr4hyNnlcXLQtGAIjo3pphjVUHF1UmGaWV30L0Cjd1FnlKW/DC09Ubvb6AhRlf3OIAoo4cKdcHKshDc4zRLvJeII7qqhgxam0oMy6RrXA9zSjsssohiOnZ+noPjVNewdirODIkO5mEHGEbA5pVJqGPJaZISBPItAdim1YMtMQEvoOS4Ak7OYMsQNyKg5BuDFRLSMsqpHYzkECbt27ZQo70qrgJDo2N73ESv41dvJmji+wqhY7cHydvjbvX5xeAdnFZCbAwjKeLP63Voux7sQ8yi22z9tQtqyVf2LmnNKtHWkNx1pMB9ily2fZ6pdGjxCrR3jIeEhhFY4YB56aAzROv5sd+El1bOIHE0ZQjyYDfWBljz3KlNjFR9+Yluv3EMQxfg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01e93f5-eba6-4d30-34e8-08dd4488d528
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 19:27:44.0829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 720Cty+TlZnqdPml6zQ6gLyFWhTOwouZ2mietRwMfrl2MUCjgpdnqiLWJwdwYEoH9Z9bbGvdVLBFAnbTrcPS/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8088
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502030141
X-Proofpoint-GUID: yIPcRqRmcjV29bTtnGaQKbMxJu7am5bB
X-Proofpoint-ORIG-GUID: yIPcRqRmcjV29bTtnGaQKbMxJu7am5bB

* Mateusz Guzik <mjguzik@gmail.com> [250201 11:31]:
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>

Change log is a bit sparse?  I get that the subject spells out what is
done, but anything to say here at all?  Reduces lock contention by
reducing lock time or something?  Maybe even some numbers you have in
the cover letter?

> ---
>  kernel/exit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/exit.c b/kernel/exit.c
> index 1eb2e7d36ce4..257dd8ed45ea 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -248,9 +248,10 @@ void release_task(struct task_struct *p)
>  
>  	cgroup_release(p);
>  
> +	thread_pid = get_pid(p->thread_pid);
> +
>  	write_lock_irq(&tasklist_lock);
>  	ptrace_release_task(p);
> -	thread_pid = get_pid(p->thread_pid);
>  	__exit_signal(p);
>  
>  	/*
> -- 
> 2.43.0
> 
> 
