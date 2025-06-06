Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4C928E0F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214307; cv=fail; b=dgxcgVcmYtJhujlR/5qv/t2GSMiZTHm3xm9rp6cADGo9pVM937OXP0T8nY8fSLJ6symmW8Xt3tu9q8qB4Z93/vj6DuSLA3obY/T3m8iVQnz4/anXy7/2kreGVp0PLjuBN8T6Hw+3jgdvWUNVWD6ItpSYTFBH9Zc55IoV8ldr27c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214307; c=relaxed/simple;
	bh=ZnpeZOHCcRBTNutphSNpHFWkFUHssqhUbvwslgaJybE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Xi5L8frMAIosJ4bJXw3SlsFR+8n1m5TQFJhmmqgiFi6qRuWGRlQCrz9LdfZp+bDMtQt7/PriHOUQllxkaFgAQtuCWvnnzYEt6mRvjA8RdpsL3H4GCYWDx9cyA8D/TFAXUeWm7ovRL+dOCJ+Pd8KmU3KdUh2L8b9c2lISgtNT78Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aLHHbdK0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fk1F0OE1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aLHHbdK0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fk1F0OE1"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565NDfG021672;
	Fri, 6 Jun 2025 12:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=CvCseE55t0zVpbcG
	g+6eYXUrS5M39WTE8wfPVULVQU4=; b=aLHHbdK09hDTkWmQAd1hoPsHssAfhZ4j
	ID9e7XS22ysEpi7eI1I0bq13N1YxVWjzk8yQkXnlbjM+3aY4boLC+DAECxt8pkwz
	Ho7pol119jQoZKtJOqeBcebp0QRxAkiQMr5WPARqkheBlr+hyhTc9/xooNvldThT
	tJrrFlEJp/E3uctBzs5ZiOMEMcF7LDORqsxqZ5zgibeD3hOuk06NVe1wYTSj0LCn
	bYR83irPXuDS4yXjDV0fvkpmpxRcy3ktbIsdJ+/FH/X5cEMhP71mMXmyKCyB4hCk
	qIBT39XAvMOc/wemzr1NbOwGL1079wyHTOKeooLaYMIoqGzHmqyh9Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8bqw67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 12:51:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556B7h9r033794;
	Fri, 6 Jun 2025 12:51:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7d8a5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 12:51:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBr06JFOTy9pdYYk3a+e3n0o7rmPiSjR6NGx62IAtP7dyHmBcNQyDLk4XB2L8K0u/RbwDcrgERn2webzJQ1ACuf7v0DEpmrz3Umc/LEk0V9Lez8gsw9UMkymaZoHUjFpmlkm5yHBtzsynwtmPPKJhVKmYXEh5XaGwd+vYDLe6loThD3juWb2xs3TFwejbSk4xcIx14tVsFz7Wz/5wsTSi2emt+Ve2up0hXWEwqeWOkAVNOLD8A7WM01FSEoy0lEymeZieXXJlArAm35bTVZudzX+UlNsH/wLheYoebOJ0hp5bX4J0GIqxQ51oem1klg91bxEqrh+O8n0K8OLSuITTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvCseE55t0zVpbcGg+6eYXUrS5M39WTE8wfPVULVQU4=;
 b=QQOM0UqXnkxILbN/vDadng2VpdczfEuef0PYaZNPVzb2kDlojcCcdmvzdD6+rX9GX5j/TfonROF7WZ2mHSSs7LCmSsfSv9W5STzJh3FpMs6R96pKUJq+hSgpOffoZjk0HPx1k9CRtY3eOP0e2Kh5CIY2jxmfnRm/YoiQL0Sk3o8JalwVDZwR5pW/R8bJcM2nq8HdKrOWlYkZQ+Bx7Y1K+FI1bNgGPejQKlS6bXFX1A3zmaytfsRG7rY6ShG5jfpMh4dsVgYVw/wuy1hSxLJlLqppmtm86XN+lfnAzNKhdguSsNIeNu1RLXqBnhnN4CwsHSHedwH1+EVgSFv+y7ENRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvCseE55t0zVpbcGg+6eYXUrS5M39WTE8wfPVULVQU4=;
 b=fk1F0OE1D534LTV7F/DNSb3qQ93tXMBTUPwf7tfhS4uPon0FQykbHrzCNQmneLxILyman1mDjqHmjxB9m2dKclz3gubWe7zN3dymUy3rSmLw/ts6gTflTgJmc1ZyJlLVaNv+k2rCGLz9O7i6yI0H2M//ufsD6ClC05uvzzlkU40=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB5772.namprd10.prod.outlook.com (2603:10b6:510:130::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 12:51:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 12:51:27 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mm/vma: reset VMA iterator on commit_merge() OOM failure
Date: Fri,  6 Jun 2025 13:50:32 +0100
Message-ID: <20250606125032.164249-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: fef0a3f3-4920-4c4d-5857-08dda4f8da13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z6WJ/nuCfUULi0MDtxj/erOC/hTN4Rw35GX7suE5eDwkYo1i0MfhtiQ2cyu3?=
 =?us-ascii?Q?OtN4du8y+nFU3h1YPPmPl2rrO7dKIRLmyEHeU2oXusWxksuq5YpaXU+MqA8x?=
 =?us-ascii?Q?8LfIoLo8mE8Iof8p8MFSpfeZkRmav6ULekTImVP6n/aO0HqPtctTp1C8eDac?=
 =?us-ascii?Q?qQlO2M9miqn6wSMUuFIJK/zSmDGXReCM4ijbvjMxQhJsbuJbmGLZgZaGfQkm?=
 =?us-ascii?Q?au+7ug5WJjWQL+Al5GkYxUa1rCd4trk/YUhY4rFBHzyWzupH6Rrfz1QONhUl?=
 =?us-ascii?Q?Ny74VLfijQ2cXSxKNRh+iqqPc1O7Y2ulmV4bV5CIAlY8ypadsMux4lJOC/cW?=
 =?us-ascii?Q?qlEf7OHBxE8QWYVIX4fyxluyin0aUfZtj5q3eOXwWX2iXShxDlDuAkF5VpVS?=
 =?us-ascii?Q?ATdee+qPWoBb2TFA9VSpvkzbyA3rYc/DBlotUV62GlRZynr36qvP5Ywuu1kO?=
 =?us-ascii?Q?ISyAgUBD/g927akUjFrBuF41iIw4jnx2TtkQavS46eZozYf1XEmPDkeQMxG8?=
 =?us-ascii?Q?Qdh3FfoywvURAWIsTXsgsdTnq1Svwi8LunGUiXiL2nwpqCqktxc7jGKwPQQx?=
 =?us-ascii?Q?ZuWjjZncFuYyDzxtFEuH9swZJ5E9Vf5b4Gcue5UMi/ld9ibeWVWbIpsuCuJN?=
 =?us-ascii?Q?IWMnMM9uhTkrp13Na95LT6SAz4V5NkVvdPpZoVRA4hF6YY17XDO/ZOq3wAa6?=
 =?us-ascii?Q?KPFMdtWoSOvmfmeQJq3hWPTKAAEcqf6tAwYa7e6lqlxGDvudDivBpcateNPM?=
 =?us-ascii?Q?B2CPfBAirwwXqRJ+aqhSE/0bu5Z7YUoWcm3ST0c7qNCNBA0HahS+XDhawpTF?=
 =?us-ascii?Q?hKYOWEbCrtpCtS0uuisclAPNcNVSgm7Mlf57mShBOxYq7dXQ1IbIUTZz+YUC?=
 =?us-ascii?Q?jI1G/Au3zXYM3/fCgJ9BkAXPKJh5r9yfnWmxmpqjC8ik/DSUtTLF8aivILtB?=
 =?us-ascii?Q?Ev2mNo1KnIUHJR1Y+AG66jC+sm28PbteOmaqRDlBQyX8qDpPOxcjGuYzZhtr?=
 =?us-ascii?Q?CtMnhJdef1BsJdCmto9r2eEftp7uoBg7kBzrShuyakCHWZpoJKQh85D840E+?=
 =?us-ascii?Q?6mgpu77htJOL/+TKjsmqq7jCEkw8rlPJ4O/WApDaAkAEcV2J/vlUmSStAHO4?=
 =?us-ascii?Q?/rnHUy10FSwCPR7d4vc6gIquJ9Y5d454IChbvCQaKfXpkePsiRVTwiSxk17H?=
 =?us-ascii?Q?WnTSE+VflD2ID1x5tsVBg7XVmOmD2J01CpfnCHWNWvWC/NpOV3PHux33G38v?=
 =?us-ascii?Q?42n+gZO91VGSGMaDwyfJOAI3axj+ntTRGa/kbxLKndOzsh6Odt9UQN9BADHj?=
 =?us-ascii?Q?NmH2+lM6wg1woq3URMxP5T+Nk1ytku4JOEDVTQY2LWgMTK7/JDQ7byK9kigs?=
 =?us-ascii?Q?s2uj/vCHC/9j5UD48sOmKo/RkCBDgnBfbkKQhdYF4WqbQbj74TfcbdCOaXOO?=
 =?us-ascii?Q?47Y9F0qyYVg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dfa7uVjIDcENdxt5fi4yBHNB5a/CQ/dW+OVDIH17YQIPYpL1jx8bkxvuTGKj?=
 =?us-ascii?Q?W0vmc4Niy3u8xMrFBBsNqcHPXwxh40uIlbKY9bDdFqOrpgPu/vMIwP54CVLt?=
 =?us-ascii?Q?oFExsFNbnAiPkUPS0wkeUAorD3wQi6czqH8w8rBbmO2FuvNHJj7O8A/0dlTO?=
 =?us-ascii?Q?dCZsF6WxZiH0mjaRgyz0DBk5IPEeAOTBn3uoXygvhiRb8OrGbuGBw1iQMOoA?=
 =?us-ascii?Q?k4weVZtlQtD6O/tLHCjpgX/SlDFGTnB+G7SVD13q9RNSIANcstDKm5js1Fwx?=
 =?us-ascii?Q?Qp05s/trA/ErorwapdVL4OdnsTTfyDsLPMQa1fe699KR1BsbajRc4V3oD4Bs?=
 =?us-ascii?Q?Uq2+oykT4qkaFwj4VO/tDVjETdo85bK1U49djBF27UHFePZuUz3VYOhnJGEH?=
 =?us-ascii?Q?KTbC6VosBbJiKQSy0ZxlNoXvdN+mPc8G3QjO8uC01UcXkguthPxzOfoQUkrC?=
 =?us-ascii?Q?86I2ck9/hM/sJC9VvMf5tcCZjWW4/19Xm2mQjZRwcQhElP4a6sZT2FZupVkW?=
 =?us-ascii?Q?/cvjd3RZhomthXNSsVM3fYqgIrJS8MyyrbAZ/b2nhC7OVJ+5u29xCJOrZxLu?=
 =?us-ascii?Q?3aMIQhGktWuJMRK7E2atHhCxhxyvtfZp5STlCIbJhZnrjJeMnYIs/bUUf3yH?=
 =?us-ascii?Q?7zChfv2RIrgudf6vDcQPR3SligcboMTuZ6pJmGfucpzTUG8kIfLT8hhfr2Ks?=
 =?us-ascii?Q?yTdFkuZNLL9h3p//kWLdHsRp2tDZBSqA9aOE7X3dpiEaYlJ1cAQ/DM70ydy4?=
 =?us-ascii?Q?GGi6ikdHJFB0nT6mU4CLmvY7XBu1n7tv+9nesahtkCZySR4TgkLLlPNyq8Eg?=
 =?us-ascii?Q?XbPOaf9A7B/onwWywaQa2CocWgnhA1l2BrcFYm4sahwwrkBwYF39It46GYQw?=
 =?us-ascii?Q?rYI1NKmj+WW4m/j7HlRuPCMN4cdbpcIgXJjyVPU7kk34Po5pHsZevTloOk0d?=
 =?us-ascii?Q?kOBfVimhGSMbc5S8YNf8eoOVrzNDHBgRcxL0LWxcj0/G8++e2GTsaw6rZriF?=
 =?us-ascii?Q?zX8r06fYqK7mp/BrgEgpcbVgWsMA+ynvV09GsF/Tcy/0DCHYWFB1eToVVNyc?=
 =?us-ascii?Q?8TTjVNkC6vJupQ311xWA2vShAEPP50uNXfA7yWhgbijR9bwgTWcB/pzIzHeh?=
 =?us-ascii?Q?IC3ygFvWYwzldjF+LDyum4WM8O2ZAhOfI5/9YE0kZcahKn/7Kk09sWnRI3MK?=
 =?us-ascii?Q?SgufLYKaiNiOo5qmCYnIBBkV142fVz25D3jCgbpdfz9g/qxfHBeEecBC/9bT?=
 =?us-ascii?Q?LW6I3D2MfSLwnkvyApYSJonH49Z9fygZPn2tOnOjkMaIY2yHhShcBPnOlRU+?=
 =?us-ascii?Q?0H7mulZIowSHuz8ztw68pYouGcKQRWVug3PRafZjukMKj7PZ+sAOapUFaweN?=
 =?us-ascii?Q?u4dt+P/See0MPStre/MsoK3teE3DC+1NifmiSZO8yaFV7z1EDhCHZSSgW590?=
 =?us-ascii?Q?0ovnYpn6bDnR4IO/WP0fHNpjj2J/Gi/AiWcKyw7N0Rj42c/4EQTSNAhJmtLN?=
 =?us-ascii?Q?35gqjplQa4LmFytNQshh2iMMnbar1z6w23VIBBU05V+RTjUfBtvGLK51Lj/X?=
 =?us-ascii?Q?1t/fKXZm5sslZuVE1v2Ne++OTXi1FZByeVhjlgnCvqJtVPY4Y4DipfbckctY?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EIYHYony58qN9BZw96q/eE5q7gSUutMB+TGdjDJfjJsujnjfQfPScrIpEHD6Ri6Vbsl2OECJSRQqBbRsCABTV7rkdl+oEh/as9eiRAQMizHbztA42nciQAIPciJrvgBS7COJ3R5EsCKPrXVsxyEYCyHyzGZFyUu82P6+77Gdiz3weBnq51jggdBXv4YhPZvqDA1qeEJnrPv+0abtxjI0YaHNmrIzQnNdu2py6ey4lUZ4IPxccmWSm4vlv1n7RHAUi5cy8TcuHg8F8MSMYzTA0Z10FgSJczAN1fhc1qN5DLWd7HDBsKzdAflnL55btEFwQrIidYANUwZOxkA67jmCNT5PEb+LSwAdoxaCjcGZCT9kCeKKJ8HSHNIxK9r5u9y8wkxxZJHRCtcvQjURjfGfgAEMm7oMonk2pHkzfHSm9lbwYIT+DzJs9cp23usN3RHrVjWd9kf39PyJxOMSb6WXhfnCY1l8WApCGVVrypmCat/Y+YTfO2tX9M2LNE0KKjBG97NPddVJGG8IZFhpZbWveyqcXx+pd6tpKfKrvfbVFgJeLhizZB6Z1/VPpc1zetXNjOedXCkWA63ZfeMk0jPocZv2tGJpiMitHJWLU5W8i5s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef0a3f3-4920-4c4d-5857-08dda4f8da13
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:51:27.4696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIDq7bFcErBQhRhWyP5nsjgwcgHbfpKOt7g/t4jXtUG0LnPRe1PSihSRzgh8dWnXo4yWL7cB/e7YA3Fv0MieX4lbMqe+nLPj9cfpRYOH53Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5772
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060116
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExNiBTYWx0ZWRfXxnZbouR7sa+t MFKtRm1HlggNeF3/3WYNhVamZagZW1uO8WUMyFH5Kbu2nfgD/nlyEgFzuR5l/5ODtGHniuV2h4O 8IOwtsIxgcqR0l1Jz7OhaQ73RGjk7HBjAz3cSRqigLojzgsMyYSXi5JvvWBJSafUa8CLmN1bcvT
 rIZqLdf+lPrCiWBeLhp2YxoZ/X14vuJL7CY6QM7X/HAo5LWt1K2HgcxfyQqDNHLnv9omOyxm8dn eHhJhEKB+AHoHkvuEdZymTAlTK3kCD3qymLjRK3pmyBOcbzU256KiL+s3HWugA0o1wjaltNCf/O 6pnZVXPmWVyB5rMlYfMe6IPdmHSIXMgIWsPCiS+XTpcjJq9HX7l20v6/WTkj9okJGMSkodMT2CV
 Ihzt4H11FOhfKZT66aqUVzS/KxH7ec2Fv2IUY/idakNDc36RiZS5GsaEzjwDfs6gf62URazh
X-Proofpoint-GUID: ej45UXMGOLm4Ny8oEnjtqrNZbKoFcSRN
X-Proofpoint-ORIG-GUID: ej45UXMGOLm4Ny8oEnjtqrNZbKoFcSRN
X-Authority-Analysis: v=2.4 cv=H+Dbw/Yi c=1 sm=1 tr=0 ts=6842e454 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=hSkVLCK3AAAA:8 a=yPCof4ZbAAAA:8 a=kKeYGVQPzdyspAW5r-MA:9 a=cQPPKAXgyycSBL8etih5:22 cc=ntf awl=host:13207

While an OOM failure in commit_merge() isn't really feasible due to the
allocation which might fail (a maple tree pre-allocation) being 'too small
to fail', we do need to handle this case correctly regardless.

In vma_merge_existing_range(), we can theoretically encounter failures
which result in an OOM error in two ways - firstly dup_anon_vma() might
fail with an OOM error, and secondly commit_merge() failing, ultimately, to
pre-allocate a maple tree node.

The abort logic for dup_anon_vma() resets the VMA iterator to the initial
range, ensuring that any logic looping on this iterator will correctly
proceed to the next VMA.

However the commit_merge() abort logic does not do the same thing. This
resulted in a syzbot report occurring because mlockall() iterates through
VMAs, is tolerant of errors, but ended up with an incorrect previous VMA
being specified due to incorrect iterator state.

While making this change, it became apparent we are duplicating logic - the
logic introduced in commit 41e6ddcaa0f1 ("mm/vma: add give_up_on_oom option
on modify/merge, use in uffd release") duplicates the vmg->give_up_on_oom
check in both abort branches.

Additionally, we observe that we can perform the anon_dup check safely on
dup_anon_vma() failure, as this will not be modified should this call fail.

Finally, we need to reset the iterator in both cases, so now we can simply
use the exact same code to abort for both.

We remove the VM_WARN_ON(err != -ENOMEM) as it would be silly for this to
be otherwise and it allows us to implement the abort check more neatly.

Reported-by: syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-mm/6842cc67.a00a0220.29ac89.003b.GAE@google.com/
Fixes: 47b16d0462a4 ("mm: abort vma_modify() on merge out of memory failure")
Cc: stable@vger.kernel.org
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/vma.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index 1497d7d28096..01b1d26d87b4 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -967,26 +967,9 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		err = dup_anon_vma(next, middle, &anon_dup);
 	}

-	if (err)
+	if (err || commit_merge(vmg))
 		goto abort;

-	err = commit_merge(vmg);
-	if (err) {
-		VM_WARN_ON(err != -ENOMEM);
-
-		if (anon_dup)
-			unlink_anon_vmas(anon_dup);
-
-		/*
-		 * We've cleaned up any cloned anon_vma's, no VMAs have been
-		 * modified, no harm no foul if the user requests that we not
-		 * report this and just give up, leaving the VMAs unmerged.
-		 */
-		if (!vmg->give_up_on_oom)
-			vmg->state = VMA_MERGE_ERROR_NOMEM;
-		return NULL;
-	}
-
 	khugepaged_enter_vma(vmg->target, vmg->flags);
 	vmg->state = VMA_MERGE_SUCCESS;
 	return vmg->target;
@@ -995,6 +978,9 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	vma_iter_set(vmg->vmi, start);
 	vma_iter_load(vmg->vmi);

+	if (anon_dup)
+		unlink_anon_vmas(anon_dup);
+
 	/*
 	 * This means we have failed to clone anon_vma's correctly, but no
 	 * actual changes to VMAs have occurred, so no harm no foul - if the
--
2.49.0
