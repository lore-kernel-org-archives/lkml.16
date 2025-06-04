Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023D46FC3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749054751; cv=fail; b=s61MEctRqqoacgf5gzhuOaMe9ww+7cIz7pNnc4VAfeeJdIIUTZKkNmQ15iK6LGNpZ4p+cpfGpWvRiJDIlskzvFL0daM04zytzT2lXbY84tvLKA3jPP28bG9mzY0un0SBpL1G5PSxMA9JsTrYoMn15b0MXpnafg6sjLCrNajzfEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749054751; c=relaxed/simple;
	bh=abS7qUi2e3YR2MVdIavKCYdGFBlCVWvpO+IggeJFnlY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tThyDef6lrioNnEqMUAFL1hTkdDJkuLALw2Zc9iMlHXQEHXMsL5k0HcM9z5LdJYmAU7D5h7UEtAV6scFpsBFQv5K2cuhQ7cqYNbKMH3w/kNLU6hUADQpEP97fkCzIwYEpeCjCeBB8eXBLlK+etGXXEm5rm85JdcgvoM0aAMbXEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nW6OZS04; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qfGTnh54; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nW6OZS04";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qfGTnh54"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554FeEGU009623;
	Wed, 4 Jun 2025 16:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=89bRWuNyk2mvuOzk
	45CwOMdqpH4xw5mtBuyn7ITrAm8=; b=nW6OZS048BdD7s78yA1eIxLNS2Cg4ZNy
	Ol0drhuloeCLmKGIygGQKTrMUgZVrlxLavV7vUelQOuOX2mwa+2H+vA1I2vusKFw
	ohZazf32OgLxups7HGZsR5csvbLnXOP23ujObuqBj9yYcfMbUkb4D9p2jXVNVtU+
	bzKHb/eH3TbfUUbKdwuWnVJQNQRlv3FZCPSbAHU+KO0bCYobfu6g3VmKokWjJKJX
	xXiDrYcssGFkk+Q+/VGrWcCcx+7B8GiJbXiJh4V+vptalRPFJbbaXivnnQc5O6Nf
	A4z2U3GO9Yi16eLEZKVT23EF3ZAXlu0YVP6HOrZF/G6CuqcR/DTSxQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j4f86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 16:31:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554F0R0r040614;
	Wed, 4 Jun 2025 16:31:54 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11010024.outbound.protection.outlook.com [52.101.51.24])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7b82at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 16:31:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkwjIV3koaJNcUcycQcTvDrXNPyKvexrvJOdPCLpT3o2LTstxhB7SqEiB0YuBDGP4rSsGeKrLy//Wfze8pBL5IH0b2XOXHyQL0KZaV+9gooFZ/bLQ5bdZsquEV/C//Zp5EHNzttw1wY4I5Zrje4b4Kp+mDyUm2I5tFMEt3YGhE19ZxsjcMUhfKyyvCCNM8+xTVZj0zBS377IDjM84UKxg4ixqJqoIzGs9iADt7L3CTOwS/iU181S6hM+HwHKNcuG7lQDDRWxgXcmatT0nBp0IOycm5mB0G5x5oKP4eIoYvb2MSx1lqY0EUKFEYgHdVygJcp4o8d9zZ8C9W0astWMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89bRWuNyk2mvuOzk45CwOMdqpH4xw5mtBuyn7ITrAm8=;
 b=cGdmslJHF/l7/Kciht9+K3TkBuVKFc61trmE7nUaYfOLT2wlPCwsDIrxNPRorj6LyNC8fUBR/UlRcMwb9BKr9iG0qTpdIFnmJQ4rMGTzeCoTSBf4XQbI7WxWGoRDNzJRwF3fHOLScmghUln7FAwNTG2s56nZyhoymqGg/hEoXkcp5xWeiuESV4Klq92j1O0UBXXjVMXctVoQZmEqLMzVIJIInT4I1Z3O3Y66nzB/Im7kpwZTTTObs/xqC1W4+OEeplyGroKmbkQUnUeUz+1kbx5CBugkpLc1kNSDaGu2z7oHyd//NYVdlbRN5/sb66LHn0teSQG1S7c+zAAZqXqFXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89bRWuNyk2mvuOzk45CwOMdqpH4xw5mtBuyn7ITrAm8=;
 b=qfGTnh54wH9dT4Lq+5eIXS71FiiTQMNwnsilbIECNbEF2RNlaAsff+QSckzI2NTzLkXGsTszy3ahuhO3bY9aZgQDUxrg+xtAeuQddi7wr5Bl+4SOGT5RWYTjWCYlm21k4IjXiRD+cVIpTUymfqz+b9YnetqZqAF2I84uwi5TpRo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB6879.namprd10.prod.outlook.com (2603:10b6:208:421::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Wed, 4 Jun
 2025 16:31:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 16:31:45 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yu Zhao <yuzhao@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Chris Li <chrisl@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add mm swap section
Date: Wed,  4 Jun 2025 17:31:39 +0100
Message-ID: <20250604163139.126630-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0328.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c702c5-02d0-4183-e87c-08dda3854baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tjZfuBWVkt4hYMf6DvoP/uY3p7jN8meAlZ6bWxbw39qPSCOYFqr4xwhOM+Ns?=
 =?us-ascii?Q?lFtr9XpA4+gMeevxU/bC+MuJM9X9Qk+53e0F2J4NvoJp/q1eSy8Kool5TJkV?=
 =?us-ascii?Q?z7mclZfMuMN0v7h/GSxxini8vOkgb6zgFmCSsinJKPsUGnrGiURMyoCekTFP?=
 =?us-ascii?Q?pXclCF1YaQtmhUPb4dgFTZJqmGD0FjUYzo1ORxk5UORM6AH3Oh0lTMEYP2u5?=
 =?us-ascii?Q?jTAz3YGJft7Z4oKqkza30DcWkot+9qiRxkwQkyXuLJsJ67NyFSEfde+T3tzA?=
 =?us-ascii?Q?6Vyv2sVz4xOYcRJOqGNh4EL7pt1kONT3jSd0l7nEln5rprA7/R0UgXEu0fPP?=
 =?us-ascii?Q?HKgjcGCJoyUmQWwbg+OpzD0ZQ34hfg4+QjCUMhYoZiKPRbWSqsxoUOtzpKsW?=
 =?us-ascii?Q?dHgBJNz2UwyDH24j3NPnbWpxM85E2ToH6OtdKCdT7Cbpv5BhnPmxU5hxqdSH?=
 =?us-ascii?Q?dXJ4ci4Jo9knPj6i5rmH6MVJ/pV/gFQVSmwhHqA9si1w9Z6v/yYpOLnfKyth?=
 =?us-ascii?Q?6BQDOXPPt6+5wXHph/rhhUstSrdPWrJ2BnCRgUMiakqLuE9dG+H54nzzsCCu?=
 =?us-ascii?Q?pVFkW0PjPKJBe9UpHgs/pJPeUux999nlbPoyVAloQOCK9W1mRoipQ2SOCBbL?=
 =?us-ascii?Q?9fE2Ws5KW/JIyk42ZPenHkqLeBQHADHtVqvew//zhOJb66iQm+jNMgZbIAYL?=
 =?us-ascii?Q?MiS9GXQFtozgPxNHPFxRHWQFdn0hsMuzZJci3PdUBFYAE8cVo/p/9WRZ6eDT?=
 =?us-ascii?Q?aQTOUn/DgUBrfhSjPZQHs5Bm4LCAK4NLTFDxxiIGgluzhAJvNG/+cEETgBqK?=
 =?us-ascii?Q?l6I3h5hTAMVvnKCsteHqU+toV7FqSlr3Yh0jn6xQ8AmcGIUjPgELnjQx5QQA?=
 =?us-ascii?Q?Hqw1WqwlvY57/012lJ0ULiMcJcXvQxiIGGtUmeLASEvyTGkgPPqfBURNun/h?=
 =?us-ascii?Q?isk8LLbDAT4lrKuEEp6ZWbxoTrVPOaKKgyoY03dVkMZRCzJLlzo3nRR//hoi?=
 =?us-ascii?Q?vs68AqQ1ohc4yjkqP49gTlV7LP17LK3eOw0n0POSt2BHEyR+uRhkLHRMc/xh?=
 =?us-ascii?Q?A7StBns54EyNqcLKqObH05+E5GdNS2dfKFmyTIMYsN9cxM9nA1lN1X7RJb+R?=
 =?us-ascii?Q?KEneAELCy/I+vokt1Fu20nqJIy+GSq6haxGYAqLq8nBccqs/AnoM64x0RL3W?=
 =?us-ascii?Q?DvefckxPEaXcV3lXMfMhbZ/ITKLBI0RR2M0nKha5I5Ua48IZrqiNk4iz7AFf?=
 =?us-ascii?Q?it+APDjo0MuT7UIB8pQyP4VvVNE/kcNtuyvzUzUlrWtDkIopVMZWQ43IusI0?=
 =?us-ascii?Q?a8pvIYM8NV4KT63wqSx4CtvllE6Pdi3keqiAX3Zc+CdqAVT3jl+ZUYVKctJd?=
 =?us-ascii?Q?wD32HoLyTxJQvWMSQmGpK5Ux/PRuMTOv93NLQL5Vsm2iad2KaNRwuTM41/u7?=
 =?us-ascii?Q?KtUe0P6EJeQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qAMjGr5atnj0hRLj3FjPud1ZcK1gx0eCwga342sFi0UBUtan3JeLIVPY0dHO?=
 =?us-ascii?Q?3IZONUzRjGeI4TjKcUk37MEm3zyrm6VI0VYuY8Z37az1jnZcAyFWqGCQiXek?=
 =?us-ascii?Q?oLwdwZch5SfjNPlFClC2p8pP8rVr+ytkuaSEJEcB87IVX33vnArAJGfc0veC?=
 =?us-ascii?Q?g1igh9HbQnRgk4vmDU1DSqKZPauivMKhyqkq0AvHiY4olj4EVf1hhdhaA31v?=
 =?us-ascii?Q?aOgPJZCuMpTG+OkODZJuWQoMJfET0ZytaWmpShGboMG63uqdMiMhvUveilld?=
 =?us-ascii?Q?2mDsaPRTCMfVNCaveQ+Mk7yVhgPM7E4Mg1jtMEAVgMooKbrq7YPB36hQIgJL?=
 =?us-ascii?Q?WoMFyf+HPtdTmGuXNrlAYyN1WG37i6B1hB/HmE1H3xEIW0OMCLySAfJ4lnr9?=
 =?us-ascii?Q?i+TjI2+3xfkZWiqBJLjzMRwLk/08HVk29EXsnflYmiby97iW0UxpOsJUNPeo?=
 =?us-ascii?Q?TrYPkYlBigZHLiTAZGZoq58eya8yP49o+XJ4dU9vSeK0GYM+Z0PxQ0kur9nA?=
 =?us-ascii?Q?UFNi5Ge18k0t3zVlOWt7Xm/x0osq3Zc+vj8aSB18qRvHurIiE6yDbq/sCQDs?=
 =?us-ascii?Q?aHXaqlweHYSzMnnfl6oieNcyifBnXWereEq2Bd7z1e+jPZ71kzwbAHf1GsL0?=
 =?us-ascii?Q?jfCiwF3cEQAk8D68A9/OgJ66rd93AmQ/nwfcGJNVy2yD77Eo7wlJFgK7BwKG?=
 =?us-ascii?Q?W/eVAKkfZZvf8xiyG9isUOyFpZduGLpeSej23WGTNBM/wTN8qKGbPdU9TfqL?=
 =?us-ascii?Q?OankjoWgRiPviX7Pz/nglhM9Mh81QlwBOea6ClFxN8Y32DdPoebsPhj4Hc3L?=
 =?us-ascii?Q?xq8oNRiqOQMg4ost8kQXFr1TRUO6Egzhq9HJb8ylSwDrFWkQ4qt45h/jqZ+c?=
 =?us-ascii?Q?E36AjFicvdqMIG6huXXuLZgep5AqbTpRDMLpWCFg2hDUHX09Iu4QdGSRUFb0?=
 =?us-ascii?Q?XBSe1yafY2uZqXjWptmNZ1VhAlwaO8sWA7ebVTep3Ja/U5i375l3qozM9Ayd?=
 =?us-ascii?Q?8TpkXjASs/wqIOvLV2padrYjURz7qF1b0khN4KjUHUDkLGULB21tK214QD+H?=
 =?us-ascii?Q?u3SLRiVoe7j6t5NeL5GqL/PfpZY+dCrbpcIdEBEZ7neARHr404r7xVl4jP5O?=
 =?us-ascii?Q?y/q08HFNUwzQQ9KzCd9wfGBxrfj/Ax82smRd26a7FLDO0MfkvCmE5ZZNJ5ho?=
 =?us-ascii?Q?8zY7k1x0ewXEcqdektA4iQpWgXVg6ykwE0N7TILFb83ygGkn4WMas3n0tm8u?=
 =?us-ascii?Q?nqpZX5BE5W+T641Vsho+UICiIHR4BhLONKUhJOXytdg8WqhpPDycpBnlp5WJ?=
 =?us-ascii?Q?k1NA8LqkQBungVB7xzaE8kbLGGoF7O6EdHBGwOncGYTxHu8biWXDnrnUfzSj?=
 =?us-ascii?Q?8D/8g5NKfHmu4zY/zn2A5u0Hj1536KdNHIc5BSVs1I/7rPw5X/P/TJjJTaTv?=
 =?us-ascii?Q?Y32e53/WjmrbppyzAJ9CZu57jIbFm0JLa+vDmqR2R3LZfzvh5YBZIxr96E8H?=
 =?us-ascii?Q?K2Yu71MPqRN896bNELulv31XTBy8GIIs3DCEO47KHm8CutStrHADf9vNRCaf?=
 =?us-ascii?Q?JjZYM9OrL6lHpZFhnvc4CVuwQBsrSYYjzpya1wtlYug+F7osZfsNkuN4LOyQ?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MqqOrGDjJ9nydBMkcWHiLpUULCLlQK2JhYO1ymF8hB7LlQ8Pj7fMB6Sp9OTmgPAf5yxzA/LD9rnjnpMcEw6euNA21nIAfqXbRk77eQ5Scdwnx7gShsVWWQgJ2aT5MB4HfEowyPqExnVqYnz8qR49l9WqHIFrRlsf8smdGzcGeXlRRqocuRA1eXeOP4MJFchoQ5ulhi678UwX9daA2JdUB91eU0rNSxRc0dtvOOSrCvBVv9C2qDABqEYNz2On15p55NMPDO/WzHgSPnbt5t8EV3Td5ZqHF26vUHU40vSVaf4WnMNTH+Zfo0lZd3eldMZZnmxtPmYSIOPuJamxSd3Ma5f7V7nRxqA7UItzYK2yAhVAXIIJ2ao0Z2rn23AC8GIBwcQhCX71EeJYgpjK5+MwdGqr1Z9txN53UuUN0Cy2ZNN4RJY/cPotEZr/VNEC9Sld5hpwnMdOr//3SaroO1UTg/1dnn3rCnATQll6LRMPU3wPTE0rHjWcnEBOwCKyZpJl55XcHspzMsurzU2oQSXKauItSEI0/wSf1SNHh926Uqpz1MN3BC+9+7Cm0xzjhmP/LNrrO65/cikweAqCu7h0lUoE1YAdJO7lvj2LGb+6hLM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c702c5-02d0-4183-e87c-08dda3854baa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 16:31:45.2771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfkLCNJVigmAMJdu2QDAH/xQqSiq4p/4CfmCVDdillmmojrGquEUEX/hrvFBjttPAr9g3pf+99f/GgUMweVDQsTNfgvlsNeXHYlA70ABz90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6879
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040125
X-Proofpoint-GUID: ySOiQBP3iCFWKLTiXmv1sProPFxWiJLT
X-Proofpoint-ORIG-GUID: ySOiQBP3iCFWKLTiXmv1sProPFxWiJLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEyNSBTYWx0ZWRfX7necSdxhG8zE BBCtMWsL90AAQNUlbtcz/yBpjRg4yAdsj+3Z26JcDuK3u/1Y/dOIr9tQ4gzYyWu0E0XVBbkhWi2 xSGgEGOGKPrauVc5htMBEHmdvJ9lk2S+G+FDDesmKrrQrY20MDuAlPi7VUl0LdQGcM/J2m+ynGm
 Ctpn2WNzG8YXxorOiXQ927Pr2H9dWRtmuTeI6/khq3fEynq39b5cHHSnrslW2JrbcSwGa2qEI4o 8fo6C52GjUPSPK7RNdcTORL8Gwvsq7wtEcXevgRvOKfHtp7vtcSH7K8FSHZcakycF+7AKrKVrTq ULDG33RrFvytOFIT0E6fMUydA6vCKWfLx6wLnDr/pD/PpD+lsACOipUWSVs41cgmQDFSXv24sWB
 IE7ICyKsHwr/Gl++eEcah88ODU9Az82iOBtokdjFWeLR6oxviql4cXR5rDFyHLzjrWpVm6SB
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=684074fa b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=GvQkQWPkAAAA:8 a=AiHppB-aAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=Z4Rwk6OoAAAA:8 a=37rDS-QxAAAA:8 a=eQKO4FnNY5kshQ2SyKgA:9
 a=HkZW87K1Qel5hWWM3VKY:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13206

In furtherance of ongoing efforts to ensure people are aware of who
de-facto maintains/has an interest in specific parts of mm, as well trying
to avoid get_maintainers.pl listing only Andrew and the mailing list for
mm files - establish a swap memory management section and add relevant
maintainers/reviewers.

Acked-by: Chris Li <chrisl@kernel.org>
Acked-by: Kairui Song <kasong@tencent.com>
Acked-by: Kemeng Shi <shikemeng@huaweicloud.com>
Acked-by: Baoquan He <bhe@redhat.com>
Acked-by: Barry Song <baohua@kernel.org>
Acked-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
non-RFC:
* Propagated tags (thanks everyone!)
* Yu Zhao hasn't been active on-list for a few months as far as I can tell, so
  will drop R for now as seems unlikely to get an OK on adding him, we can of
  course add him back in very easily :)
* Added missing mm/page_io.c as per Baoquan and Nhat.

RFC:
https://lore.kernel.org/all/20250602152015.54366-1-lorenzo.stoakes@oracle.com/

 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26a0925c3830..839e1ee1854f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15816,6 +15816,25 @@ S:	Maintained
 F:	include/linux/secretmem.h
 F:	mm/secretmem.c

+MEMORY MANAGEMENT - SWAP
+M:	Andrew Morton <akpm@linux-foundation.org>
+R:	Kemeng Shi <shikemeng@huaweicloud.com>
+R:	Kairui Song <kasong@tencent.com>
+R:	Nhat Pham <nphamcs@gmail.com>
+R:	Baoquan He <bhe@redhat.com>
+R:	Barry Song <baohua@kernel.org>
+R:	Chris Li <chrisl@kernel.org>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/swap.h
+F:	include/linux/swapfile.h
+F:	include/linux/swapops.h
+F:	mm/page_io.c
+F:	mm/swap.c
+F:	mm/swap.h
+F:	mm/swap_state.c
+F:	mm/swapfile.c
+
 MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@redhat.com>
--
2.49.0
