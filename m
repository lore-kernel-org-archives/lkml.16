Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D582A1EC011
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342532; cv=fail; b=sywJcrU1ZLwKR93zW8IPVXezepENeSHVIoKr+HB0sIOKDWgXunZAAO2t5Ewh4alHzl0ToaUgZKL5V3tr+MNXxdCkyoQH8HDox6nHCKEJOJVPNjL5mcyBuOfRbuada8HFeVtRhFntjAy30QX+c07wgbA0ZB4234Q3PKeprnROZvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342532; c=relaxed/simple;
	bh=v30nK9W9gN8ITY2oYSYQakqhTnIZ1BXgK3XdLe3aD44=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RzvSZ1obLwzd1rHHFoOY7+1bV3XC2t3rgBzA/azkNHsWmSTQc++Rz7IZ1G6wm2eid802FoQwX5dhxpIZPRL9QF+EUmreUritghn4Z7pJMdo+mulpzOMbBFyGgYtl75yGfGvrZXbZ/fcoPPJg0YgvAjg62rCIfAVbyAZK5UV8rXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JOVgcZKP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n+93kc14; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JOVgcZKP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n+93kc14"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VG52HV025855;
	Fri, 31 Jan 2025 16:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=tDGedCVSbZraSDjLYP
	t1dw5WYlYZdzs2ulVDdZiG4ps=; b=JOVgcZKPF2aSxZBvlW9F4K0KIqwryWYvAT
	pzEcuRTeJht28S2sRy0Crqr8uKtGgpTAfaV3bMv/y+sym1jTexKC1rGNqcAxM7bC
	eAQpByAm3a6oNsDHvXKWzvExwohTQXt+EXHg48yKzsgbyCSNwLA4j6vl1CMEu3MW
	jhy/D//yM3Ty6IqAvBqfSkF+3s+ozyn4PTJ72u5HAhMOfJ4SHRipFImqB8Uw9ZkJ
	GPZs8TFd1g4c6H27OFUB34LnqGe03pdNS8uq1uu9IOzASg6jf899KOE7Gm548bIz
	DK8BbEqa6KWFud/w5YcrSsSWXpSXEDjk7OwA/cPZldD861hnFeGA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h1qfg3gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:55:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VG6Ys5006103;
	Fri, 31 Jan 2025 16:55:10 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gfhumb20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnpO5HK43fXMmQGA7cKq5jsrSo1F1HGc5bhjbXBEfEgVpibhXe5En3cu6Q3RKNq8Sbe2ZPxlOqvYX557C5wxdJ8dE9LaeeamN002YbJooouKDR1xrlHuEc9FFvzVEaFTJ0nYKrSiG6LqEjqJugzb6bQ8ZBcwskwZAFbdOiDY3ClHguqI+HJ+qaF0qu2SM6R3XnbtZ9cm0zpWEu+5a+TnOzjX5Rff8HHNMqfbAjEdd0n8JKQXXIkIasTXMUryUn0eHbWSGnCcm7SDG3UPXWBc+QfkEjulyMFDiLjpMRRT0NJrThxSTHxvcvoRdSRXrtJ8bd/rj/r2CegN2o6PgL6Fvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDGedCVSbZraSDjLYPt1dw5WYlYZdzs2ulVDdZiG4ps=;
 b=puWLCU1w5OrZ/ZwLLPC0I2deKPQwTaeysVcrDyxwl149Z7gwoqUj5gjFRRBAbnlC1OKLYdPqUFgwtvne/XT88ZoWcjNx08vU/WnBiaTY7TM5bPgpOGGFILWUDnuG6leMKc9xoDs2XhmcrPS49Rl8ST5hal42AclWKMLD0b+rsV73WIpE+6RckcVO81eO4SzzjBtG24pSbW3rB6OQ+VZLa5hRh4vrC8h/oV+xEr4O47R/62tn5vl2LxYxJirECROBjn1pbkfwgo2XQm5csAIGEH4IvDpmTDBIAhFtIcaCGi5Jm0siZh+lYeHT2bAthsT8DUUwjsDtlXq7WTu/+dZlAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDGedCVSbZraSDjLYPt1dw5WYlYZdzs2ulVDdZiG4ps=;
 b=n+93kc14q7KYYSrVEFSDAR3XxDy6niEPna+k+Jp4gUBGUml7SjbWGccn3OcoYaIV7rd15Edmq6Cbn9dNchtyCw5FM0DydLDg/6v3c1y0Vkbe2J6rOxxVylnqSBBtUpdSDBuxmqPXaXLmkgGBz+wPjqRvhqS/2mg2hk3mnOJxRes=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB7061.namprd10.prod.outlook.com (2603:10b6:510:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Fri, 31 Jan
 2025 16:55:08 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 16:55:08 +0000
Date: Fri, 31 Jan 2025 16:55:05 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 0/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <a89c68fc-23e0-4cef-b7db-4d118b365e92@lucifer.local>
References: <20250117013058.1843-1-sj@kernel.org>
 <yp26taqjxput2k5w6jekhnexbp2isqdksckrv2jjxomxswjh6g@f57mxzd62fyt>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yp26taqjxput2k5w6jekhnexbp2isqdksckrv2jjxomxswjh6g@f57mxzd62fyt>
X-ClientProxiedBy: LO4P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::9) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8fd922-e015-42ad-6eaa-08dd42180498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sWa2TVx+PSkx0YAJ8dfkCsHcXC7yM0K3SPMLlQWHTLqZg5vB8wRX8xTa05xF?=
 =?us-ascii?Q?q84Yt5wa97dnAAoBLtBIWffq089NoAKLmakUjSvQgG7J6yw0HZ9LesTfQCCG?=
 =?us-ascii?Q?d/3nRLNRw0+FagngE32aMEeluzi+fE+lx0gxDR5iBnHahHBlIJuZzHBbrocG?=
 =?us-ascii?Q?qYo7J8XvgGeKEmxuK1bSamCcKx57Y/+LsRq/iaq5Q952PMJLa1Hz3bZt1i51?=
 =?us-ascii?Q?jRyjHwfbyMtPEgAExV7SUBr6mVJoGc9SA643fP5t4C6qmDGvp0aV2LYef9qz?=
 =?us-ascii?Q?EWJXN6lcu9PIoPQWIW44qchQjZRu/rPC3aRJ+dgLkLgjVb9tR2/cWTrpPphm?=
 =?us-ascii?Q?t7e8KXMccMau1fI+Prh0m0FRFgZakRfqNlEviQG3kQoxFIbYCGENjbTuoZXH?=
 =?us-ascii?Q?F2wYTjS2S7ehp2NHPN0xTLd8m8ZSTiAaOq9uzFpHzuUBiz29TqX8pqaWfG5U?=
 =?us-ascii?Q?RN/WgB+1f9HEDhofxziET+TleZpindMvhBPFlEuhuKSYykHdSjYHeWtgug+Y?=
 =?us-ascii?Q?gPLE823KgoeEH/LsNxGq2dloYSSDSSXerYkGIwSfD5gnmT1KtsAYvhIqPd2+?=
 =?us-ascii?Q?o2yWBpqzbTSpjeqNgLu2ZH3SCInx8JJQ/ZaxhTqgAXKfLYx6eJGEl+ydP/qy?=
 =?us-ascii?Q?po19Q7k/CWeVSx7E/qd+JHJKhlM99ITdWdqD63fW1jUKtHbA9norHhZ6HVob?=
 =?us-ascii?Q?U5Xo8GyrrB0yQedWdhgWbEsLhCFsJ8OsALievOk7LSK/YwKCKlqyLkMEuEV4?=
 =?us-ascii?Q?5aYg8g5zlrk6G/IzGZL+sfO3rF6pE6wIdhwNflr+lzRiZSA5rk/SeYlGCba6?=
 =?us-ascii?Q?L/qI+g33xC03VWUJN1GqnwSrYkhJpycrR+GNgwZnhTJPOckS9EN10u3mr8jt?=
 =?us-ascii?Q?Uly5KM7f0rv3xYTWrnD3//ScP+2tBS8Lb7Q5MuN319hf0OU0LRCXor1KJfXp?=
 =?us-ascii?Q?x25T4xpk9s6VFqB+UEyWM/wWqwglxXHpVUCaK5e4V+PkCY3lq1wbA1qtsTpK?=
 =?us-ascii?Q?8xoevk3AmGZSXz2Px1GMmMlpuCEsMn93PxirYY1Dd1GNB7e9au8Nl7lujvVZ?=
 =?us-ascii?Q?CBeXSnz+LF5ILJqjtNXaHXORKptN787+MUVOsKot6ztO4HSrtooZVx1ub2kQ?=
 =?us-ascii?Q?IIopVe1alvZl21bVAFoEVa++/9qDZr8dV8W9rONEEX1RBuoIymUo2TMatm2M?=
 =?us-ascii?Q?kwh4xyOYsesRe2kB7fXAdS16pSgiOSuSxtAGpplopvb3XNFWCtZMlnSrQgbs?=
 =?us-ascii?Q?orp7FUiNjo0tMpbisOIyVMAi+7R7oXHPj+oHCvUFKYE5RCt1gAmd4y7XGXd+?=
 =?us-ascii?Q?LKWtR2GFGLiRVoOOxTWunaEVH9unlNtBASPbjQ8R9z9XvlnVeRd39C0mUiFE?=
 =?us-ascii?Q?By1Sm1zy8EPr7q9lrxdbEioDYjhM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p3k8Z9s8CLfBfN7CZEBuTRbpWajs02K96wzZ9F3UCYufyTnb6+EEjMpU+8UO?=
 =?us-ascii?Q?wbxOyEHWE1imDGhGyawf1b9txC7jR6Wrb70hdSVzRDgDG+XermmmtOqXSZoE?=
 =?us-ascii?Q?4rvJS8+iw+u7Jagnyjyi1P2Hy9gjHD7vivOlEm7NioPzxw1jbG/uIiCUc5U3?=
 =?us-ascii?Q?3jsr9PFP6WIicDFxFUo3tg6osHZULsdFxSTmlaOIqbHO5ydmLMtnCxEYxwUg?=
 =?us-ascii?Q?i3QsfLrQ5wGNOEbQjVJ6XuM02fXbU/GLbdsCaoxHeZzCw8zPbh/N1k29rI/J?=
 =?us-ascii?Q?dbam6CxlFpPTedPJ2FlF5ILhF4B2J591ivbgAMLxmMm4d+6dtTAwmf7VYvdR?=
 =?us-ascii?Q?xOu+7jdL8DFBV0U4HQhtvepXv0ScMeZyIe4qgTm/JcNskPkk7fhDV2JtGn7v?=
 =?us-ascii?Q?FhwHwR4rmguAqUHio0iBVJ7sY9jkqZUu1tp8nMqBoGUCHaVc4pzO0QKfJVH5?=
 =?us-ascii?Q?yWLhYruslUH2bTVYirsUbUJSCXz3QqdfBigbKC/ww0mKiz8uPufPNmokqHwh?=
 =?us-ascii?Q?M5s2RjWjeecviX/Nws67oubRcApAWLBPGKzaBH6dh2uGwqsP6z0viuDGKseW?=
 =?us-ascii?Q?9B0NEdtiO+W5bnOmfDWytkSnE+RbYfX3rPaoYLlOEn9DxU9SFe2KqtYKYBGu?=
 =?us-ascii?Q?qZIJeZ5YUWJOQBI4aZ4xI08Nl8tkmHPdDStQtiv0a1SN8TEtaZK6324/vzEm?=
 =?us-ascii?Q?+ZWNMtkMhyV3VQERT0gxtWCzXhoJgy01W5dglSN6fI5TCMoPXplcxnX8VB1p?=
 =?us-ascii?Q?HbvAfpfHpMNV15qcqTHFhw4k84dn6UTqkHeq2D9t5Orc+8LTjZj9WWO+Sydh?=
 =?us-ascii?Q?U2hKim8oBEDfIhcFn9QSCWrQzVomBXn3AKOobruD4jHRinmb6D0WVFOxM/LD?=
 =?us-ascii?Q?6HxKnwgO7Y3sEerq4i/Bzx6X3aJzB4eHAimFlOolUHCRS4t+GTryTquFKs7i?=
 =?us-ascii?Q?93mYIP427MsMY29T4tLa0M+JmG3x5WhJcjZM+bzvAW05s3d83msHgS8YkrlW?=
 =?us-ascii?Q?3PmNfFQQHPOjiABnI4tkQI9V568B2/4xv1XV+zyyqCuiokEFrd1C+G0mzQtK?=
 =?us-ascii?Q?H4H07cdTHDyWrbfq+k+DBHPMZ8cDLxC7uMPcKcXY5izx9EaiT9aAMkJ19v2X?=
 =?us-ascii?Q?GYqCVr3Je/WLrO/5La0WKgLJNamRxyFq4PKs6LqDZeuHCDNFZ6ID2e6+f/pD?=
 =?us-ascii?Q?HUyEhuA6Qre3TtH5C4QiWavdUlJwOWen2RBtgF9k8ZYP204PzmBuJju/JIVh?=
 =?us-ascii?Q?OnXRA9++Ygr4pdsPyIsmAZ6F+QUKU0mhC+8fwxnPn41vMGAPbClu0i/QURl6?=
 =?us-ascii?Q?TC6z2avz+zWLfs0oOVt+cfwNYR9N5SEttAsGv1Aubi8Y0yguDMd87BXkflmk?=
 =?us-ascii?Q?TS2JgLB5adCfQaFlr3VzF3IXRYgmIMmyODJ3obxahG0Tvwxf6c3TvxNoBMlB?=
 =?us-ascii?Q?hhIx1DfnM9aMknZcSeW9H7aH9hz6Nxox96ZoX2KPGTdTP0HcWTnw6XYi5k6o?=
 =?us-ascii?Q?3TTgkaGBkyBvRPi8fWUOQ8yIb7e2GUeF6dAMq4Z/ZoEyK/YD8OdIzoUtFn3k?=
 =?us-ascii?Q?qqBjx4JkGMShy1tTk5hfZ1HmVWwRR9Dzb/udk7rXl+qrc8U5EzOTjNiy6GDb?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Bv4wb8Q51vz0xnUez2eZjFPC2aOB7pcKDDuJn3YkA8fVriqQpWdTyE3JAvGwERk4x/92XbDuAXhMSdtrQojVIcYLQuZmexpY49jq9N0pHfAwzbBZD/8/mOj+DDAOquCAi9ySHlw3aSX4DiiCFbnOfHhXqJ0kfsmpCwn+tW3xyHcQW8Z3OwACQZfgTk14wnaGWNzxdR1rx+6SwcR9wmlY5pi02rhBMZy0eFQ7+UwcQCwxohVKSupC1tR52eE7qPrPDuVUQzuxHhyBdH321hwjn7cpw5ALQg8ZApN9EHx/APocplcAuApm6UgvVWHeZCqjLGXhbdVMQWCcqvIvWPTOmymbUNfne6a5mEoD+IA4agHVF1/0IKrifW0ZWzxSZN/5ZZ/JOPBrZG6FhSHUUa1x25VyICVFV3fM97kW4GLQm++52fwx2mpJ2JPcim17eh7lVAlxPMiiUHHTURSSZlNAHFUl2NWqbngCtvdLSmJBBjMyF5kNE/TSpL5IYhz1ES3BUhCFsPTpf1yjz1y44ewXgzAZaq2kSSZiNcUCfEAW5+g+py1J87kte/R6Ur2FAXrYNAbxW28WVExn+Ctw+qvR90lK6M00UbC+kX47iaVuj2A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8fd922-e015-42ad-6eaa-08dd42180498
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:55:08.1478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sm9J+TiMdLvEmi09ihmwmHNbLeqgV04dNESoW7IHYe0fbAanqOAIiGZqVrZ0mwf5YXIdT5dgNZ0CMey2iAEDA2F5nTgpsFHpylAjTgIGQXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7061
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=956 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2501310129
X-Proofpoint-GUID: F4KAz7K9j_c5bGV7R9vdbQxHk0TDsGza
X-Proofpoint-ORIG-GUID: F4KAz7K9j_c5bGV7R9vdbQxHk0TDsGza

On Fri, Jan 31, 2025 at 11:04:51AM -0500, Liam R. Howlett wrote:
> * SeongJae Park <sj@kernel.org> [250116 20:31]:
> > process_madvise() calls do_madvise() for each address range.  Then, each
> > do_madvise() invocation holds and releases same mmap_lock.  Optimize the
> > redundant lock operations by splitting do_madvise() internal logics
> > including the mmap_lock operations, and calling the small logics
> > directly from process_madvise() in a sequence that removes the redundant
> > locking.
> >
> > Changes from RFC v1 (20250111004618.1566-1-sj@kernel.org)
> > - Split out do_madvise() and use those from vector_madvise(), instead of
> >   adding a flag to do_madvise() (Liam R. Howlett)
>
> I was waiting for a non-RFC to re-examine the series.  It looks like a
> good clean up.
>
> Do you think you'll send out a non-RFC version soon?

This is definitely a great cleanup, there's a problem with patch 3/3, but
SJ - feel free to un-RFC with the fix I suggested - and then happy to give
R-b and T-b tags!

Thanks for doing this!

Cheers, Lorenzo

>
> >
> > SeongJae Park (4):
> >   mm/madvise: split out mmap locking operations for madvise()
> >   mm/madvise: split out madvise input validity check
> >   mm/madvise: split out madvise() behavior execution
> >   mm/madvise: remove redundant mmap_lock operations from
> >     process_madvise()
> >
> >  mm/madvise.c | 150 +++++++++++++++++++++++++++++++++++----------------
> >  1 file changed, 103 insertions(+), 47 deletions(-)
> >
> >
> > base-commit: b43ba6938d01ad4487028592109d4116a28b7afa
> > --
> > 2.39.5
