Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5CB27466A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658406; cv=fail; b=bjbcWtSMCqU+IkXfcp6EUdEu96o87eySce317InDmrhDew4WOGIZwhYmCErRicZn5sQHDKlUil6D39Gz1eS1C/3AxKZQVUrAsApSIYIb+UkwfG7+jIpGMZ/2Epxqp1+L454T2zHkPMOXl0HXFdvU9i9dBwVusHzZ6hb3qzPpers=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658406; c=relaxed/simple;
	bh=9P5ZnRyDReAWZN/nfF8S757dXC12g7ElQffk+EvfXvA=;
	h=References:From:To:Cc:Subject:In-reply-to:Message-ID:Date:
	 Content-Type:MIME-Version; b=VHVBTiZV1CJSibArHH8Bgnwg41T1ChqECidTWAe816kkhQ7VTrSOO7pFvl8umqN/mN0yfQgQgFvW2Oek2VkGHPQKZyl+PF7f7jA9spLF8a/c8tdcqNYa9wzcDcCcSMDoWtsCalTiT3V1AFXOIjZzcC2lWARRTXCIHaS6E8PbneY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nAaP9ZKL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cprAsREJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nAaP9ZKL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cprAsREJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EIpwFJ019793;
	Mon, 14 Apr 2025 19:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=0udpAKBc7lopUCXjqz
	1LZY5F5mGSn56J0SGNzB/aUsQ=; b=nAaP9ZKLJhRRnO2siun1/bM/r85ZBi/81x
	ffYNFgN+JmnRo06eCUX1jB1UPgNmBfP+EkJWQ+dqylm8carZYw7B0RjkPTx5TrzV
	kcqOh9/zRFBufx5qcevpSEQJ9rK8orzwonDHNoV6CU50yrw+oD9IIT5PvOBnowLc
	qPmiDlCQoSAzqK3zl2oMdfIRMndoQqMkrqMKsCOoWg2bibJo4QMuukv4DJe33kpM
	0iK2ZYU7AgvVTnUYmS83CEeFUz25GnBgCEyrWiuKTr9SoCh0unZnrMDEc51UXG/R
	SXl0kCKulLjnNWo5MfOZHunvE2wHZgCBtHMV5Q4Fy9GQjAweFc0w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180w82jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:19:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJ8v9k005744;
	Mon, 14 Apr 2025 19:19:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5u6dcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 19:19:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmqsHACkFTxc0sbSRpkgcXvkYumsDBEbhbAO5TGixp167grlir1q8zK9+SvAGDE5RAYNVWtNghxYdenE3kQh2kQV4bahZUmXw4rBOxJ+M3XLYS1o4+bo0I8FRc4stJ+Kt0t0TNEY0teyAFSoadPL5PT5OHqAz93qFKbTTiJ59ditA4C0ecYqWelk2MGPZ0WqCqfDO5aeSU7M9wnP/Sqm4uk5tzRtR7a6LKv56RdpB7LDXC+xAHR7MOcQcZ/k0snhHb8MMDTcVEFnoBpMunh1Nbt7EQVI5hnr4dIKPCwevqkrXDSDUEftIaryHX7jJAR4FsIhiy9ocA/F66roO4WMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0udpAKBc7lopUCXjqz1LZY5F5mGSn56J0SGNzB/aUsQ=;
 b=Bt5CkVxI+khOZ34CSas61Jf7H6s+GVJjqR0lUk3ZWRrRAxEERYkmg6F6vOAHhF2S2L7gkKBPHMyFiG/+qEXyEfIWXi4QT+kEembZxElog1Xl13NCCgPrahHcVQWZFV8pFwa8L4XAxMEUB+BffG3HK/VJVjdxXeDWk6PHNU4h7T5xDb+1eQ265y8r7x8n4rbC3OxMfwgj5qVqXfDkUs0bSv4IrrvB2paIswOOr3hyiCMTtLLwnC6kL8JlPKPdZDr4AlJ/+2CsuBzSECVW4HDBly8h6gpFVItWWI/3+6o3xazqQuv/SeYe5c8xE+27CKZ2PNJMouVrzFgsdZwBMHm9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0udpAKBc7lopUCXjqz1LZY5F5mGSn56J0SGNzB/aUsQ=;
 b=cprAsREJhSKAG/LEsDiKad+KEIz+qj7Wc5y2hTQYQzHpu10z0oP8BhXN7Y2/n2dxB16CZWZr1oCLJZQJTkfMfTkNebjTiZNnoVxg5ALGbHCgiJP+fU+18y6LElpFvY+UVgAI2uxWF6AZOhXCS6JIafRaTpcndE1lvN0CnQKQSTY=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SJ0PR10MB4640.namprd10.prod.outlook.com (2603:10b6:a03:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 19:19:17 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 19:19:17 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <Z_ys4jJ8MQ4-kW8P@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
        paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
        willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
In-reply-to: <Z_ys4jJ8MQ4-kW8P@gmail.com>
Message-ID: <87tt6q3618.fsf@oracle.com>
Date: Mon, 14 Apr 2025 12:19:15 -0700
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0369.namprd04.prod.outlook.com
 (2603:10b6:303:81::14) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SJ0PR10MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 8211ac3f-4644-409c-525e-08dd7b893fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oen3QdjRSqx0hmAWO0UfP4V6s2QdaWn1MKJAe/nx6ViODjCX1Vc3LRqvHbaH?=
 =?us-ascii?Q?M1Tls8kDjCkLDWxSyl+RkmTi1jSjfwwbTh79kzu2x6ZMuZtGyfTLG45JvV5l?=
 =?us-ascii?Q?ZCBktxSdmmtzTBIMZCB2EFkzOK8FnAaWZI7aJnMp4XDNWFrH5BiJ7+JLev2n?=
 =?us-ascii?Q?ujS5wyVjaCLHqfxpeH0QtLvR3TT4c69GxJw217zQUKcthwdDSO7Zc1prXnkM?=
 =?us-ascii?Q?jY2hRJVihTHWVb8oNw5tWnD8IniUJpF2QHR/FndWi3zuJHYukniLRl0OcdzY?=
 =?us-ascii?Q?B8H/R4LL+Wx9BA++Uc8RvjPGGZDWCDQzW1dBEBoDZVOieNqZS67yFpQaZWs4?=
 =?us-ascii?Q?QoauLl+GmRr8HdELHVP2Hduua9zghOwrPSSX0PhNrCyaeggDq1KmD+wLt91j?=
 =?us-ascii?Q?HbxGctIsysgD93O44ivMIdKp7xJ+pnauloPLQ4xNdVXBuZUcoZGKnTJFbsP7?=
 =?us-ascii?Q?Dc9p4LzS383Q6z5BLd0DLrsGYIjLriH59Ft9WJwgznf8SN4jaZhzBpWvpqOq?=
 =?us-ascii?Q?wg0u2JQqFAxXX8tf05OWPDm37QTJQTwQ5xE2V9UMLYX03QDFwCXMa4uo8yhI?=
 =?us-ascii?Q?Bh9WQ37hxpQkaY+ERVrDVd/vBK1Jk4YTRJINIq7fQjvTzK40Iz2D8Efqt0OP?=
 =?us-ascii?Q?x1jMaiGlgs5lbUfQqrOYYQnqFBXTvMqAol33RdY+eUaxy3JEjiJ0RsRRZCt3?=
 =?us-ascii?Q?KedDpFSqmhQRXrBH7PXEYVM69RxBAdNyDFktBbtObWt8T9+Ad7fXG5TyF70l?=
 =?us-ascii?Q?xt5D/Gj4RppPF0D0hBMjMzI1ND6xcAH6cBc6e2uKCcKabnkLvZfwxru7W3gI?=
 =?us-ascii?Q?FeklVdDnDm8IdsnrZkSrNHRAm1GfzF8MP51AeDQMH4QWpBQGV3OKy+VCXllx?=
 =?us-ascii?Q?omo6hUb40hgBxdcknRW95rYPs3XSq0/zFQ+5XQ3xEZ2qeUt1gDHVGTT6ISWg?=
 =?us-ascii?Q?3GVXg5w2M2+oX1S0c610n01hWGRxgxgwJJ7D8AvFaUFKRtTw6ieM169PEe7R?=
 =?us-ascii?Q?SSk8aOEzsIi7xfHy/INQaw/Nn3qbJGnIuTsa526pWfeQeeh+HTGw4vtGMzPF?=
 =?us-ascii?Q?QdSelW0XFp+85b5CdA2WQv2NkpXkS3X64Yg/IQWqV7FGZDs7noTqNRBNqdq6?=
 =?us-ascii?Q?ZgVKXpe/pzwO0p//bHOqtmwpazexJ+I/tva3aM5/ue7mvMlkg6QC/S/gGF4I?=
 =?us-ascii?Q?dnqZTus+JH2G7fvDBKAaK2A7713CuKgvkrprTvi5SnGGtZRKqld/TFc/226W?=
 =?us-ascii?Q?rMUAtl9lTlhgtZUan9b9irBilvp+y6wpms/ZujfzYoRfuG4iyLSqx9SFufXA?=
 =?us-ascii?Q?VO+ObgNakI1SxccXzM2U6r55dJJAYs6bPQtZWJXQQ86V3F/QD/ecCs+ik05O?=
 =?us-ascii?Q?bw+3rR/AypA6UBeJQnNkecPBCe5OBi3v6qPdaJoCEI6yGrwWpYIpy6xXoXxX?=
 =?us-ascii?Q?Y1mvu80G0Bs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wktjlrnfc1ohAU+tb7nCnO3aZFpfeyHSNr+5KKy2+HfOc0JfpgZh0PgSam2P?=
 =?us-ascii?Q?1waGobFmPSwLCeTjxNZxux6i4W+yNEtwZfgRjjmOHJePq+MLn8XEM3N9sKWv?=
 =?us-ascii?Q?vWhxeVAh99LuoOdPo+8nBHS6KdbLpqEOwWdXW3uiuB4iVlReNyKGDqpFNQ3K?=
 =?us-ascii?Q?+ylE/B6DGi2I6eldyGU0rbleDtfaSZzDFeVWgcxGhzxC7Vkx5RRwQwrghm0l?=
 =?us-ascii?Q?bnkBvQu+0Jvs9WSes31jNx1X8kPY1JqrR3lZlPi6Q4nHTez678OXHVMD9oFF?=
 =?us-ascii?Q?+V3oXEQbVpNITWA/WrKI7JpCNE0+Bo1Si64zchVrU25dFvy4NUySuF7+dfnR?=
 =?us-ascii?Q?KAv6FXLGUX4n5zvAwxrsHbre2iI9tXcgHtfS7iDlHqkffxUML4O4DfkePJ3L?=
 =?us-ascii?Q?5ygNlPuJtIW5YVHPQVs1KURsYVgrgD0g6iZDh5unAfn+1hRH4VgA0sUe9oN7?=
 =?us-ascii?Q?kvfPGCvSQqxLHLPMDiihax12kxNqmsSKzZiJ5/YcVY9RP4mQ0lUmWw7kbWSE?=
 =?us-ascii?Q?0PnZvCE4VDOpd17wmgTpdsYTrcoiicZONSlEiKSDbtVeb7KL9kvrGujUu49B?=
 =?us-ascii?Q?bqB8Z1pOOtEHFT77AOwzDvRjSiE7/h1IkyR3N8em3JWD3ZSYIBtm3t/WkNZy?=
 =?us-ascii?Q?GXhTCr2ilvlb45tW+NTc30lNsYo/WhWcb29STvla9yzEZcxYOauRfdFM5/T7?=
 =?us-ascii?Q?hya97ZGp5eYQD0iOQfih4JY51pKRYDGs2DnzAW9Y2YCP4NE4M9D9IIMHo4Xr?=
 =?us-ascii?Q?mjc5AJbSERnaUm5sdL2vlM9HybAYGHYNNsONcis3eJauhS8To8/KCBDmb6Yj?=
 =?us-ascii?Q?iCr4KdIfwcmknkV186rKBSKK7SBZ8roLqwqY72SfgbFLmTKg3F1bYbk4K4PH?=
 =?us-ascii?Q?cn3xV+fnyeTQTaK/XAwqLDGBBuG3bJX6toT+r/87FQcl/+1Gvp9JtmzQe9Yy?=
 =?us-ascii?Q?en4sQGfeFfgMkFw5zd94H1oVBY2231LVkPyWqB+ZonpSW4aFVawfoYPMTmdI?=
 =?us-ascii?Q?W0BVKmjBhFyIdstqgTkQkfu2j0uyJCuppcNoO51hN2mpkrWj1Uf7YNWdZXlp?=
 =?us-ascii?Q?myI/AgzEZIANWGLCwvLZw3QDbjCrj28Zv2+J/xFoxkMXs/4JCIDZZxvd/QuM?=
 =?us-ascii?Q?U9ckSnJB91luvCZNypCDSC72ztSd6EmbZ/YkToV+j5WH+6yh8Jg/xpQCeSSA?=
 =?us-ascii?Q?K8Cr9P7FDSuOVOegkVkghFN+DbO/YUS4kbxdjc7Jkh+hyY5SFBakKXWY6uyf?=
 =?us-ascii?Q?CuRo3sv2B4gG/E3Qvv5NBuEHqohXiReHA59+wSHNM/VvBrltjB1SMtVeZuwg?=
 =?us-ascii?Q?DaVB6zcX1Yx6by5sJ2aicFR9B29mktau4KmphUgRarKZ3Sn3IkE5G2Y1X3Tn?=
 =?us-ascii?Q?3sObwouSPu/wp5WcaADwhz5c/TNs0N5RK4hlUscTAWnJjgvdy+YgZh+IwuqT?=
 =?us-ascii?Q?XZd7Z0Du6BA5V3iUFR/EQYTLSFzqTgtS6Diz7u7Q9+U3ZBS0RSQtvQDBWv7Y?=
 =?us-ascii?Q?X8xvnfhlQrsOxbmot/uW1vu90QkxSSFA47fTCcgQ6asbY1QLjfW6FgBLffPD?=
 =?us-ascii?Q?pisghWxaSlfwUY8nqZRJS4y9a8RlF2TFXWVSGpx8qy380Qo1VnPSiEhANAR7?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HxYWfzdaqZaRrnLW4LXwtf405sk7WiPF7z9jsXYe9U2BuXvi+1ebJl2fvLqRmynQVACu7UOCOBPvLRXQb2fjtwZ6909LdplbcZTV601jGv3LdgXzqP/ZxNFPD72g8hG/Gyo19CuBZxr7q0L7EXXRXIM8bY87+d4Nt1bHWjHwyZ7IjjqFuPKsjPMUlDYrWc6+kRn6y0dRl0UK5lUtpJj7OZitPJSXT0grdsJ6SbqSoL/L9kvvVdCL50SQLRsXwdXnIPoVBjhN+hLnL59jFroyp4sfXMqBiqi+QifbcS7PiiHxwEFqu5gdrL7WmFZgCUXmxqi9NiahErBJWAPbsEePUV+gud3TakG2S8sRJ+7ZUIJl3/3EwVOGofV97Sr3oK5GX+bkihb871Ma6hqx4FceLnIBvbSak4gzvr5HZC1h5WdvfzNRzFtBCapUsr1pEpqsbmSJ2P7JvVo4XIwv6jgMfM4YR0fuX3Fw2Zcl1aN335j3fcEBF/CRp+MiMmQ2hxyCv15uU81Lv2fzasfPVzVh6Btve753+aswz0c8S4CuzoVAIUvocWHuFVUCGydaoqhwpiGcOUr+PdBi1ohMEy7ypvhb0+wbUCJy+M+RGCm1jiY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8211ac3f-4644-409c-525e-08dd7b893fd8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:19:17.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlOGYkL8NaW9olJBbe2l7YgM+BUz4jBc+8N6e6cjSw61i+ynPclzyubzwIrBQ1IuMU99j2aLA4QMJF6MopUAy5cO/UeubBC+5fNffC5JIu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4640
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504140140
X-Proofpoint-ORIG-GUID: 0v0ySTi8E6NOxxO7t-oNZYN5SEnkX_N3
X-Proofpoint-GUID: 0v0ySTi8E6NOxxO7t-oNZYN5SEnkX_N3


Ingo Molnar <mingo@kernel.org> writes:

> * Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
>> We also see performance improvement for cases where this optimization is
>> unavailable (pg-sz=2MB on AMD, and pg-sz=2MB|1GB on Intel) because
>> REP; STOS is typically microcoded which can now be amortized over
>> larger regions and the hint allows the hardware prefetcher to do a
>> better job.
>>
>> Milan (EPYC 7J13, boost=0, preempt=full|lazy):
>>
>>                  mm/folio_zero_user    x86/folio_zero_user     change
>>                   (GB/s  +- stddev)      (GB/s  +- stddev)
>>
>>   pg-sz=1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.2%
>>   pg-sz=2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.5%
>>
>> Icelakex (Platinum 8358, no_turbo=1, preempt=full|lazy):
>>
>>                  mm/folio_zero_user    x86/folio_zero_user     change
>>                   (GB/s +- stddev)      (GB/s +- stddev)
>>
>>   pg-sz=1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.57%
>>   pg-sz=2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.10%
>
> How was this measured? Could you integrate this measurement as a new
> tools/perf/bench/ subcommand so that people can try it on different
> systems, etc.? There's already a 'perf bench mem' subcommand space
> where this feature could be added to.

This was a standalone trivial mmap workload similar to what qemu does
when creating a VM, really any hugetlb mmap().

x86-64-stosq (lib/memset_64.S::__memset) should have the same performance
characteristics but it uses malloc() for allocation.

For this workload we want to control the allocation path as well. Let me
see if it makes sense to extend perf bench mem memset to optionally allocate
via mmap(MAP_HUGETLB) or add a new workload under perf bench mem which
does that.

Thanks for the review!

--
ankur
