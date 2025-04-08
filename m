Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E0E23BE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 01:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076773; cv=fail; b=CrKSsCf6DspQDoz3dAcwjxigL+kyn4hBeYEWaUEPP9jhCs/Werf10Xqxkc0/EB580SOBCjeRWLIGLBpQ/JKoBp8hf8W1hlApGb1Rkvxm0jTp5LYyiVOMDgUTYR3ZyOx/8YNrvyb5mhiU0mlpVYUmbd0V0v6gJZpCpl1UuanJ9Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076773; c=relaxed/simple;
	bh=EujvPp7VjmUa5uIMnjcg03KP+dehx8vty7IG1RlV2bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NjsHHQps+/dTuNx0XmsNJb96TNAT3NVtzJgSlkAEiYKUY161BEPJ+a15HKdMT5II0bKAN5eXZ2Pk6vY/rdc1MnOhlAczV0cFDhG6+F1il4RYlKt7eerhKSbs8X6+joiiFuHBFW2vVijWAIf6s3HgzEWGeazCsR+xNppKBPlpwKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lIGZLPpC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=STabFqnY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lIGZLPpC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="STabFqnY"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537H0kQx024334;
	Tue, 8 Apr 2025 01:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=C//ghvcJhpo90ZfO17
	j4aAvh4dG31oDfJgcdat9ZZ7E=; b=lIGZLPpCqbo6XbvSSh40tfzL5zhjQ8iY7f
	PQ/KVaqdhZW9tVwjqrYG/3xIfdaVEkEl/kES9A++tcz2422GH2Bg6mRMZFx9IFXL
	K9Ae0mXvBjNl91qa4AzEW6m0Hvm3j9sBP2TlRwsNfhQoUk6qIzzKX6qZhfdF9RYs
	DKhdjL1jjf4pEawGtM48+/ClR4uYk3tTKA000iVLauDAxAJ297ILP12mDldvUqUo
	BqJd/C5nHyIxIMg3V1C+chXFObEKQR22u+Cqon9qURMfLdbNxFOFukTxHi5MbZd8
	sHu8kLv2gR5cNAX1P15PE1kfz4J2JAIRyx9IiDupZrtgZjgasImg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tuebku8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 01:46:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5381FJ2l016139;
	Tue, 8 Apr 2025 01:46:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty8k86d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 01:46:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fj39tBw4FPDjGI/NW4DtnGAWEaeA96P+szzT12NjHZbiH5O7+XCEF9/O4IYXHfD87zLar9AxonrmK53rlo+CflDRRkykDyKlUznBT30MFWun/QaXHo4cGNRUp/ervkeFZRey0Yr2OW0oGrjhzU+bQ/120wb5DgR/YheiM3mlCR+uoAsFEyJrCzbdQgdHZWJwVKxbk93h3K8oAv8nKa92D44i3jmBhPelDU2Y4lSycVKtzWlXJ3w6tZyhmykTIjlbK8RY6vkKTORcxUUasWuzHlnMBHAZvPHtEROU6600JQR04o71tvSUvKssEJgIBoEMSzuYQPRYAkxyToLWAgxjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C//ghvcJhpo90ZfO17j4aAvh4dG31oDfJgcdat9ZZ7E=;
 b=rIUW5GEOEQtevv2iQ7WB02SvgsB165b/JKEJCJKmP9IcjcVLO1+M5SjI9bne43shRFLr9l+WXf0Qb0bcyiWmNeZDo0/lZiGutAVG4RsFBBX+0gDjf+HVT2RkbmmH38PraieYYUtGhzcpLpWLK6Wh8PHA9F2Q4m//Ex81OetsIj5AI9NDmdPki/oLmRyPYXYGYEr5tFPi/gANv2oKNrK1IE/7T63KkxnCUmTpMtyzao0S0JURDoBEkAOuiIjY4/wPpur54pRyP0UkSW+EIWS54+ah/lNfyxmL1wUOJ3aEQY0Ve8gm/5WYA4YJHU/8q/75kGdTU7lEOvRdheLqa8EzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C//ghvcJhpo90ZfO17j4aAvh4dG31oDfJgcdat9ZZ7E=;
 b=STabFqnYVrxGE7dMOGXOAlnI0iFC0alk9lbCuODtZjXG4lxgZv0cxZTVpJGt2FInhS9KPPPwUggY1SKGvtjahOGBfyaoHp0w0OrCzG5v2BQuYgZC4ppWBU5O713iRfmNktnPz71cVDmuqNWWG0l8wvEmiEn71pKUgy6cvBd9glI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ0PR10MB5662.namprd10.prod.outlook.com (2603:10b6:a03:3dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Tue, 8 Apr
 2025 01:45:58 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 01:45:58 +0000
Date: Mon, 7 Apr 2025 21:45:55 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, willy@infradead.org,
        linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        linux-mm@kvack.org
Subject: Re: [RESEND Patch v2 3/3] maple_tree: assert retrieving new value on
 a tree containing just a leaf node
Message-ID: <vgiarjjxk2hy2m5nm6vuotizgndofyb6436eaulhamt56ytra3@cjswiccpnrii>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org, willy@infradead.org, 
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, linux-mm@kvack.org
References: <20250407231354.11771-1-richard.weiyang@gmail.com>
 <20250407231354.11771-4-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407231354.11771-4-richard.weiyang@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0307.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::29) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ0PR10MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: bccd248d-15e9-4b04-a284-08dd763f1bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|27256017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wT4Sn8stfK/fqRzJ9jKIxsEair4w7NJF0gvwk24dcSel9ssgC6Y3E0khRMs3?=
 =?us-ascii?Q?XQy/Wew3Oa0wvaVfxx0q7TF/OXOOLTtOmZ+WJwsDVY7G+PyEwYP3nQOFRIaM?=
 =?us-ascii?Q?1GgVCJk+aqRYKo+pbuMPm2cnaB1RApymy2mRmi/Ev2n+AMByTzpqiAzoDYKL?=
 =?us-ascii?Q?MrvwcjTTk9VkPUGvSy98nc3glhgEeovaKrdgW7AUbjunrsgXE9i/ywbJdQWt?=
 =?us-ascii?Q?LqJq2IzADVeQ1wI/OEMzexlIJc9CCo1xFnzttLY5xuSQhVcaRfzJGkXlcPo7?=
 =?us-ascii?Q?psGItBCABBfhtHOEGQqrhkD0ytnNa4qXQ548TmgQSW+lw4hAKEQAo8Hb5YGz?=
 =?us-ascii?Q?oM9Zcf4PG6J38TIyKffkSJpgOEpoBneYweg15W91bofQG75C0kC6xkxJJfTA?=
 =?us-ascii?Q?1M5M3GqkcR9+bDME96uDZGQK2Qr2hRAP19zD/28YSFgWG6p3uDLaWq9O6lUS?=
 =?us-ascii?Q?NRBq4X7ki+RIbvDVCZu40Kqcn+s7s53kKZS5Fz2Ql7Kjo1dsJ13K3f7UzT9U?=
 =?us-ascii?Q?GtfAYApvDGWPzOtew72aLQW2NprZtGVCYXiJ4tn+pSXF8WiMdRjRfdKQhB5/?=
 =?us-ascii?Q?fwfFnWkU9gzv2P4KKb2s30W1adN0DSaQ87akVoaemfl+3ewUh5c/OyWOLhS1?=
 =?us-ascii?Q?08pd9cTsXJKTvLzeycUKbROgECS5ar064n2RNUijmi+Uil7fF6xQDUriHtGq?=
 =?us-ascii?Q?rhMQkWmaLJk+TYbvAP77AF3/j5SHY1bUomYAeyNbFlZvF4zAA8YwrfYVPWrN?=
 =?us-ascii?Q?cVSRt2fKiWM9DX0iNfvzon92WO3cZ/WMMhXWbHyzBSdVSob0mWdrg4ejXREc?=
 =?us-ascii?Q?JZDFPzOa5b6lVl+0KC/Jitdi7XwEi1/FEbPLwmZZ1EWHCYNXPE9IG+gp3J+7?=
 =?us-ascii?Q?yioqm4J81QmwIRWLhPCpgfxSbenQtgAh0eyVgTvSNZbkmH03C8SkxClDyyL6?=
 =?us-ascii?Q?V68GSwB5R8sJfN3aAvmLvEKQq+wCLEbVbK0rbHtYRAflZS4G5vRPRvji8XlA?=
 =?us-ascii?Q?+52QqqIaTUpwVZxOU0kjcCUBOftdXMCwjxXp8hj90Ay4FBPruzMrobnUNbsH?=
 =?us-ascii?Q?8SlvhHHvXHtgWHubsMyW6O0lcNPMevTljVLc40Eh2aaASZcEi0NCuBB6b127?=
 =?us-ascii?Q?nENKi8dAEgGplDyvhBZ5gEDZD4T4HncAPbY2tLijc3BTdvg2VT2r+kbDedtY?=
 =?us-ascii?Q?2bkbmlwqCiK2vJPrz6OChewgruWPhhuI2nrwjgcfMKKHEgNHUifpgsyOgI3L?=
 =?us-ascii?Q?CgGB6kDWPQlYhbk/M+lv7ThrU3GB9MjEha1E44rNHKE9PP2ClPS3Ir7cpwWW?=
 =?us-ascii?Q?iXbV290foN/QL+tYWEBsIJ3qjLgP44BVseVNCC5HmeZ4t2F8HLKC60rk7kME?=
 =?us-ascii?Q?2GuD//zTu4FWP5dYmosXSnXKAvdC9SqxeArBOr+dc9gLy5t7BJTOKiwXGb3K?=
 =?us-ascii?Q?wHXLGLUlbfh3am4F9WSXx2jDik12sEDf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LoYZRLEC0KdaG2BZSvr5kXegiVlQ3yEXrLjsqUjdMfXmf7/4dG07JdpDWYvj?=
 =?us-ascii?Q?5WzrbV0ipb3RavlQQmnaQNnZFYtpVQGbMYEJMxViRCuElSDJhvjIIi4FZCtJ?=
 =?us-ascii?Q?+h7A+v8ZzUgv7WeKr2xRXPuTPwWZPyr/cxoPiE6if2CBgbYq+QjTrxBigF0Y?=
 =?us-ascii?Q?oPpGI5kJCNbJCsxRZvQTz/knIKew7BSON/mEJT5a/3MQCOXrOohkqJU6UXkg?=
 =?us-ascii?Q?jwg84RSTD4f6UfoVaXatbcQgaLX/ru0uaZJN42/df3XgAx9Nid7iqB35rXiL?=
 =?us-ascii?Q?oUE1lN/WJUeA/ubmBxiXUb8fiPW9dWvKzcxzCc0uTUbKTESo4jdkJns7j8qu?=
 =?us-ascii?Q?UllEZOMdGHI78+MhGvWZNRiU7XKImy1oViFFRsoRWbT1HiSnSBQF9/KYl/B9?=
 =?us-ascii?Q?teRDM3IfRrRrWRLLc345SRrSICis2LhT0HwA+SH+C67g+D4gsMeVxjhopF55?=
 =?us-ascii?Q?Z0zXWoJ7mucclDb2eXdycsv5IlbZX7myY0K9hz/muTMe2zd9upPMvyJIZu8L?=
 =?us-ascii?Q?mj/983lOT6IMh+Jef9+I7JIChwbcTBLA9hwL8EQjOjS29KYMtQUmfT+l/Yyx?=
 =?us-ascii?Q?SqryFrJ0GgCLjYNE3Z7VJviV/2czZSyuyj/EiqKkg4jELCw+cdUL9m/nVgTk?=
 =?us-ascii?Q?O1wXZCyqOgs9vId++LbrjBktxtF8tTe9BFcVw02N+TEC+qyGNlwsFpkjRONB?=
 =?us-ascii?Q?0NL927e0IwdiKcuhI1CLzRc8I4kIEKkAtFKhCB+oVi/N+RgWSHcKXxd0h1NN?=
 =?us-ascii?Q?Zkzn1xLcNFfvGu65S9hHSXB2nkMRv2GwVijCMmR7F7e57N0/nrdygZ8SqOS3?=
 =?us-ascii?Q?A4LKzn4eEwuA8T0SFPeilVtptbCokS2/S26g7jWteko/69bQGVSSWuhUzd+g?=
 =?us-ascii?Q?YsVQrL0iOHna6QUbmdP+Ka5xDT2WrlQBCNga29dFkTZ1g4WHdP+V7IZt/s2r?=
 =?us-ascii?Q?ErjTMwb772ClElxEvYvtp1GLtxmvmuA/fD6gQ8P5hNeiZ4EcFKSCzxyiZlea?=
 =?us-ascii?Q?y/Dl1CU5k4iIMtpw2YS1pDiPPPWlE+35ECQ8pgBK5Hjc1UR+bTbeyAD+ENvx?=
 =?us-ascii?Q?ahpqnh+M2BPAh/pYLZkW1yVYWPKB9O8z75gPm2Lg2xwlu682Hdoa337WnpRa?=
 =?us-ascii?Q?ZhicFHLK/0LtkesbSWWXtjQUSe2cGQ8yYZHvI5gH/KZrelXFcTrVEz09X3Oq?=
 =?us-ascii?Q?9WuX4iNBUH2hM20Z/RCFgaHgpGMS4CoRizqw/lx3MDlPgJVMy4/6YzgCQX9v?=
 =?us-ascii?Q?j3sU8Qz9bQJL3e9zSfLdfdYgxL+7XnxYw2yBrmvkub6l1jai8zie/hivZ0wv?=
 =?us-ascii?Q?qXlne8kxFHjEkU1JVYtCSP/D3qZLQrUTvthUJJusl+rAcJpYznSh3RXRTHwd?=
 =?us-ascii?Q?nIUYJCu2QVEGOrfe6ETIfjrf8/i+c0ZNXPF3XC/ReI2Kuaz46PcfM2MU8DlC?=
 =?us-ascii?Q?ontEA/XcCdYDZhtqQU3OMRLbsnqQLbArO1zU26wPtRK6j+8aocxpoOZQ9OSD?=
 =?us-ascii?Q?TbiM6SIdJKLC0giiYCA2ShRHIKAKAosWimkUhZQSTPsHrw3q7SQjgZhvD8MA?=
 =?us-ascii?Q?/AeUuel3cNbo6OEg9+SCwipYrfLET6ileDq3C+m3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XRR8W+CSeVzgUaFYp1tVmZAVWNFh4NJbo0QO4TT4WCSpnus7L4Ks1Q7jPlML0PxC2wTDCRb2oXFAXJqgcVF/BPolIftbptwPcb5zgLsmOqb1VTMeTRIrLpS05Z8z+UozJ7mceslFSPs91cLVQrBiPaYp24o1Cr+JyvlC3nYQlJg0/XG9orsr31npmHU9rJdm8y/fTpR7zyhuZu7Hoqp9WHl7RmaGQdvNG4jCNitcG1CDCs+4SEyHHxkd/DdwGfr01vGdcTY3H8xN8s+q/NQPIEaLFp6qpJqGNcZS5PI1ezko4QrTdusNk3n1axOT1xYRVWh61S51JfzlVMCnwCTi2Dh0CKRbcVP9v+LhRJXL71MsWmj63F7cAj5oGr1ZwC80DlsuA8+ByJsUoHVF/NMAHqXlzIdG967lzdkM7O0qjmlv0w54spP+NJKHTfb3nzDoKyS1O2pEyHZaZTxdAUzMqZemk7tD0ERgBFGQHQFmiLa0B+G4T134ZOpc/CWBtwZ8SLZQtmYWGEuOGalD3VYSwlQMcCU/4oFovP6WzdQV75E54Gg7SbG9YZzkXJipO0cC1WuNIItv++s+Wf7m7mjzaPNLXw3DNTUaPJr6qeKRSsU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccd248d-15e9-4b04-a284-08dd763f1bf9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:45:58.2461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/yK9GkISzO53O29F4J/ZUJ6RrZ8LXTmU9ln0lZ794bRh1wuf1AI9+leRUljdHRggkQMGwLwOOs60c1e6NUA2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504080011
X-Proofpoint-GUID: 7VrXt77iUZ5SOc7kvOSKNMH6ZlAEHZEn
X-Proofpoint-ORIG-GUID: 7VrXt77iUZ5SOc7kvOSKNMH6ZlAEHZEn

* Wei Yang <richard.weiyang@gmail.com> [250407 19:14]:
> Original code may not get the new value after overwriting the whole
> range on a maple tree containing just a leaf node. The reason is we didn't
> set the only root node dead during destroy.
> 
> Add a test case to ensure the new value is returned when overwriting a
> tree containing just a leaf node.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> CC: Liam R. Howlett <Liam.Howlett@Oracle.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> 
> ---
> v2: adjust the changelog according to Liam's suggestion
> ---
>  tools/testing/radix-tree/maple.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
> index bc30050227fd..1e293e4d856d 100644
> --- a/tools/testing/radix-tree/maple.c
> +++ b/tools/testing/radix-tree/maple.c
> @@ -35256,6 +35256,30 @@ static noinline void __init check_rcu_simulated(struct maple_tree *mt)
>  	MT_BUG_ON(mt, mas_prev(&mas_reader, 0) != xa_mk_value(val));
>  	rcu_read_unlock();
>  
> +	/* Clear out tree & create one with only root node */
> +	mas_lock(&mas_writer);
> +	mas_set_range(&mas_writer, 0, ULONG_MAX);
> +	mas_store_gfp(&mas_writer, NULL, GFP_KERNEL);
> +	mas_set_range(&mas_writer, 0, 0);
> +	for (i = 0; i <= 5; i++) {
> +		mas_writer.index = i * 10;
> +		mas_writer.last = i * 10 + 5;
> +		mas_store_gfp(&mas_writer, xa_mk_value(i), GFP_KERNEL);
> +	}
> +	mas_unlock(&mas_writer);
> +	target = 10;
> +	mas_set_range(&mas_reader, target, target);
> +	rcu_read_lock();
> +	MT_BUG_ON(mt, mas_walk(&mas_reader) != xa_mk_value(target/10));
> +
> +	/* Overwrite the whole range */
> +	mas_lock(&mas_writer);
> +	mas_set_range(&mas_writer, 0, ULONG_MAX);
> +	mas_store_gfp(&mas_writer, xa_mk_value(val), GFP_KERNEL);
> +	mas_unlock(&mas_writer);
> +	MT_BUG_ON(mt, mas_walk(&mas_reader) != xa_mk_value(val));
> +	rcu_read_unlock();
> +
>  	rcu_unregister_thread();
>  }
>  
> -- 
> 2.34.1
> 
