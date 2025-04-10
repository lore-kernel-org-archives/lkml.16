Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E228F938
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312728; cv=fail; b=cdsMzsMRXTsC8tk7zow7u+jKvcCJBw/XbSqTsL6dTMr9t46IsJhf32FEH1XjUW+eEepl8sybvRQP8OaupNNQhODCpfEtE4YtKT0PspeX2YgpgUfa6s/+Jtdf7r9+po2ti+KZPQFUZc8EgZB4elD3B3SP5QDlm18nlcqB+NUuGFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312728; c=relaxed/simple;
	bh=h2f4iAAmW3SrMeYNInsaR8UMWDffc2i5/slZ71JVr1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TNT+8eacnsTUPS/PZB2sPHs+ZKnsj53EVEGPRiKcOUJyrCpSPX3znbf9/g6Hdj/9KPmwnMf+OtauOCr0YsO4n3GLRR4h3Z/CegSp0utnf1nRkBKFS0heaFdBi0ImzYY70V0FVeVd3wCFIMjVc9/vCg4vgPvswLLm0+4tzSFC8CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CVtbYKfP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q5qrAocg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CVtbYKfP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q5qrAocg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AJC401017240;
	Thu, 10 Apr 2025 19:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=o7eP6MCng3sbSvxvyy
	adBxos01nN3rMK7iTr6yLpR2g=; b=CVtbYKfP0sQVeREu092S3B1cQ2asPQI6xM
	igOgw42R3FGU9DaJh8D1w5vbSnK6dGAXx4rPt80jh4rwxH7BakXqN2+kwaiEoWUl
	IyvreYKXhAM13e3krDY0Ou7jlW/wnYvZCrRYCZgkj5bDxamBmdhZsdN9xsuTc3kc
	oL5os9Ww9kPHYV4lWYF/F0q7rpaRmJB+S7hl6kkFc1J8TNIcyO27TC+xyoVWVbm2
	+C7z2fuIgrNFm0CDvnIJ+cXPocnAY/qBnO5Q56I/M5pXWKSWD74q+jFUTqcH/6tF
	4VEIgWb9e/293nSFHc3cO301xFULI/KTyWiXXlmiY6+Jhk3kHgbw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45xkxc00d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:18:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53AJ1ekQ022238;
	Thu, 10 Apr 2025 19:18:37 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010003.outbound.protection.outlook.com [40.93.13.3])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyddtrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXsfWorXXvKiotb8n3M/wY14I4cOho7/dqcR5e+sDU8slPdTrv4dFm3BLcy7P1xVp0n2k/NJmO5xaUEBBJD4atIu2u0clQjzFu31UkRHt0xMGRpY/OWkVc6s3KYRUsdbbC+x2B3o8y2NOchNTgH+1vorpybIY4wIK4hhVV7uouh+QPZ+6YFK7evp3cUIRAN+4P9+D6FKhzHEjlXNxgOjLv3l2qlS9zFNNRFn7PFWP//FhdknHnwo7IxlgjfwBbWdSlqoGJ4ogQVRuBnTbLxKAbfjGXz5bELBU7/7xWIZE0YqHYwZD5kZhmPaU7lRIBiwYvIH95gDee9TrqODdsp8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7eP6MCng3sbSvxvyyadBxos01nN3rMK7iTr6yLpR2g=;
 b=Kco4upknnkxL8V+3zJLvDq40mwhlPbh7Nitg+0WXQnwTOUfc6Tr1D22bMwzGgOOnYK0Ep43vHQaGG8YILv5xnz7OstXp+H8GlD2JXap3t4hQHt3XsQL1i9cZP2gm3TJTDzylH5mO4/iBBAz2AgaVz5Z3eqfhlMWlcRVxMRwYyztc0KOKiUcCBwmoiB3C47nF7cv6q+3uwLhTrRr2VvEe+rsyILlhxmEtfeSNxW741jImvXaeBJ2l7krq9bOjBeCmOQkA8YJ2z+nOVP/vIa0IoAe6iU+HFdFzbd606/66LTAhE7eAmJmKe8ztVjUJctR1y2g/0BdknmluUUqrRK4aeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7eP6MCng3sbSvxvyyadBxos01nN3rMK7iTr6yLpR2g=;
 b=Q5qrAocgVkqlhaG+BFWfEKjWTeos/JEGqtdEH2BM0ffb1ZBl8r8bE1O9TUlQIqbvhjm1MTR5HxK3DwekHsp52wc5osI1J/jcFkHMo/9YWGHlk0jIFNEuOvz5bNBOwm8g+/twv6zkyCfKLjHMyqf41LhVOVugxXe9ecVfWDOlxbk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH3PR10MB6714.namprd10.prod.outlook.com (2603:10b6:610:142::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 19:18:32 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 19:18:32 +0000
Date: Thu, 10 Apr 2025 15:18:29 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org
Subject: Re: [PATCH v5 5/6] maple_tree: add sufficient height
Message-ID: <nim5zkf6h2x63ketliyde2plkkklg2khme5by7calcawpu7l2m@h7cydfhd6kqj>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org
References: <20250410191446.2474640-1-sidhartha.kumar@oracle.com>
 <20250410191446.2474640-6-sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410191446.2474640-6-sidhartha.kumar@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::33) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH3PR10MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab68b74-0f83-4fd7-ae9b-08dd78647b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WvTnDL3EL5FKZWAOV74oLyn6JrklQDFG0qH/QBZyZTmv4DhQaUvMG3Ar5JR8?=
 =?us-ascii?Q?zZ6ueCEUT55qz4AhKJkm0Y8/5NEhViK/7gCufrnbW06FByeNwWSmyyccIWLF?=
 =?us-ascii?Q?oaQeEqubaXZyPWUpKdmg04T+K3cj/nA9V3wTLD/1Fk8TDsJoirxV6El2cmjD?=
 =?us-ascii?Q?JjlUa0TQ2eNxugmDZ5Vcgsfc6NYBID+AdU1ZFuBNHxIcsfgbDfVKhozXPA9m?=
 =?us-ascii?Q?slH7RDU46HVuWRXZ3nXIfavU82k8Ik5Xgf1s2jH1TEynWHIV+gprfCBxKgrI?=
 =?us-ascii?Q?RUKCLqzXdYie6XdSAURdT0vWMAFyVWBi+1V7hRf3GmG8HlSKuy9Glyl0+k0n?=
 =?us-ascii?Q?wz04B4GzksFhrDWoObmkHiUpLmvIyr58qFOhtbe0977TccKg0z57CKuAWcc1?=
 =?us-ascii?Q?dwoS5LjZ3XXmDDMrGDKxxNiiZeTklM+qTcmXi4v6+ykpW5gw6g9nbpFCh23W?=
 =?us-ascii?Q?1X155ceizmKxh7EGcQhPvFYVl8wMQ9dUTg8R7UBjDIgsHeYtzhldOha+USIi?=
 =?us-ascii?Q?oUCzgYR40APu85D0pKByx3MgdpT5DY/4bHmRRoQ2eozWTzJ/FmZcMYaIQhCt?=
 =?us-ascii?Q?wRKsfS3zaZilrYQHx+W2WvXKGNLow1NXgXHzOtBOj6hFKpaZHQz9lCZ40Qgg?=
 =?us-ascii?Q?g9IbA46s5bVOur1x3a7rmbOlOp+ZiBWWKWZdOkv3YHV2+GHxW0r9qq2Rgj94?=
 =?us-ascii?Q?uKAX/DgqEqPPwv1HILVyfwGhuVZqb9nHCa6MiKnaGGemf7O6GTRrpJvY2iQo?=
 =?us-ascii?Q?55S+xUz5sEiBYGcPKtZy+Jgq0UQKI49FCPAD55t/ePNohq8arWdc+MQvTnFb?=
 =?us-ascii?Q?bXthwq64wwX3c+dibo7j1zUaml0YqLXulJqrcAfvEcB4knQfmVTzCfsMn7gK?=
 =?us-ascii?Q?HGuyaOLJgx4WodqXr7OSfE2ZqSrso/bC8oC8auei8fGjEeXfIGoatkp1RvB8?=
 =?us-ascii?Q?2BPHhMDJZMNxhslj2lh5VQCyYxB1MKIVNJ/YlCro2OYqxhaT7BSufpsHHw5s?=
 =?us-ascii?Q?Rae9/Zu1YYqxNLngoufXv2fFnQkBKUzjnS2M0WwpF7GIy3AE5mjrk7R3ISGT?=
 =?us-ascii?Q?mrrNdVYmC0gBJxHFb704TyL2a7YUV5QJ1SG4y2VGcp8ca2CDvP4eC6XECtVE?=
 =?us-ascii?Q?1fRfYnKWEsd3lYsQlVEnTZfmNHDQ5OFljVDjW4HnLoTYLhvPLMBlYOkDQ3NX?=
 =?us-ascii?Q?fWTOLA4G4CpFItMJzwntKSUlT8Kaj+34BZ5UQim4CRjZEsydKGpOMDmyTE/V?=
 =?us-ascii?Q?2SDUwTrHeV2hlpkkkTZpThmo/qk4zI7iwM87ppr8dLCTk2ALMJ5H1heTdX5H?=
 =?us-ascii?Q?kTJGStnpn5Oad66bCVS3TCOnddgsKU10k79dCCu5oBEd1ZaiaGqX26iEEcXA?=
 =?us-ascii?Q?Hlooom6f0IdxPniKhINlU+pzQlMS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HWw5gtGGtcZZj360Y2BYib+3dod25eEb25PzX/I490shFBr5isKAKS1WH+fM?=
 =?us-ascii?Q?oKG3ne3nPKet7w6vHZy69WbDLgtFLQEuueXwVUYbyg9zP3pjPWBB0FvmJsd1?=
 =?us-ascii?Q?ezR/FYR1l51XXSd+pkSV1v+oQikt/iXjk1iViEPrLZ6IwV99O4jnzNELDEbp?=
 =?us-ascii?Q?UlZhl4yZEB0M5FxYgPCFEbVk/fyVCnvVPsn0BIdZdnGbwzTtAlxIy8xxHi7e?=
 =?us-ascii?Q?sDOHpvjnQB9q6WjDped1+83CtvBsVDw3ZHBw3B77Mi+DqsBYB9kJRs4zM29a?=
 =?us-ascii?Q?4o+ZWL51LekFriMopV9joRx42PJ357tOGcahmoxH+Im/ecFH1Mxj5Z4n6BI7?=
 =?us-ascii?Q?mZ5MRv7K777Klp5mBI3Y286djQyInqchLccV19ekLFBANP5WYTV95jUmcXPR?=
 =?us-ascii?Q?Do+qmfQPdjuZdsX5AJE0HnDnDnEUAI5m7lBpozNhILuFI5FKQ0EgoGQI3dD0?=
 =?us-ascii?Q?dy1g2moPp6RhYLUuMb2KVqdCgIG78BwmciTf3lyzBwRsQw7pB6TWsSr9ronQ?=
 =?us-ascii?Q?SVrUl7kfnxUA8Oa9zht3LYMWASJw1sNo67NDTf9Za22BZenBlIyU+3HMRLx0?=
 =?us-ascii?Q?ymh7WIjkbRru/1K0GoJ0601/o5SZ+QwLcdAwQ5si2JuK4ncLl2NbEyGmJBe1?=
 =?us-ascii?Q?tUHM0ai4I/h2bfLeZHEkRuiI1osT4OeJbLvo41ncoQWJ9Rpm8Pt1Qi+J8vR9?=
 =?us-ascii?Q?rwkf/PK2ejzXhaboAWYm0Hw69762GzOcuEfShlPUtY9VthUaXPpwnU5fALGx?=
 =?us-ascii?Q?YnajgNb9w7wUV90AtCu5uiFjMJe9YZ8jEVpmM3WAd7b8eGqa9uz10d4X1tTf?=
 =?us-ascii?Q?Putq1jwwmriz9C10vsjfzJFHgbHmFoV5qIsvjW0sNtcPhu1n1bWDB7ELYzLz?=
 =?us-ascii?Q?To5YUGZ15AKPMoL/znwa9GeuO2RlhYkf8djWkIzn73kEKUqoTOZ3DmPKdQBp?=
 =?us-ascii?Q?JmeotRtymcLDMBn8jVjanROmbpB5qNmvsfO5Lae7bqSfUD2RQuNmUnGM0U8j?=
 =?us-ascii?Q?m6t4vvr5GBc0qXuCBrX7Re3xS1FdKSifgzTXFbY9ox8OROflWBrbR/aRWOBP?=
 =?us-ascii?Q?QenANhFQnMUnpFoZQZu2x/Zas9MFrGk+wfLJU0P6Ky6lY4R9fJJ45mLqhPQ3?=
 =?us-ascii?Q?JKmJ+wcpmq9jPRBUjj9McpeOHDbqtkLdp0XjUZa7YFIiJnUR12zV+lfXQv3J?=
 =?us-ascii?Q?QhceUWGoXwr0y9I5w6vQ+WjO4aWdJRvTkWkeaCSwNetmn3Dev7CktDgaWOkr?=
 =?us-ascii?Q?89S4ERyc92z4ueu5jiTTnhLn7R6S13ccTHvUWh5y85FlrVWVk3Vd6s3IZ7Fc?=
 =?us-ascii?Q?e9Gwgkp5ExCgM3x66gpp3xrp8bt06idx5QGSdw6ao6+5TdKTaGnPTEm7sUKS?=
 =?us-ascii?Q?ntHOr3yu7ktyOgeAJpC6IQvqWlzLIEsgI0xgaAFijrX/vNBmOqUZxT98qMoB?=
 =?us-ascii?Q?U7EAIGfcyMrk0cVVRpRWE0/0XfiEc7qa1stEjDvcmBQl5CvJXtDlaTRAdEpn?=
 =?us-ascii?Q?CjvKlGRoiX0rQRPiIkryBSvE5Fd6Ajbu3OlwSUEP76hIFRm/R5VlNT5KiYWM?=
 =?us-ascii?Q?j0yUEzE46YV6XgEc3aRlnaK3jgtJqgyZn/tHK+SD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nAPU0LfWKsVyb+nCCYMvabYsNp1EuIpU1ROTfbCmilKpqM8ZSYFzZXcVW+3ppzmZWV32NeDSO4U3X7OX679Mm+mfMqY2499njc4uQp9XwKFQWmhPGRE8ZASiI9V5X956EZRiDqdKMOz9ydJggyFFWEW4jYg0yZFzyPcjLUUHEgZV8LdQdkStcqxoatUFQdWyNzi8p5X5OYuY92MqtNLzockYjS7ONFHh5V9IfuWKkHroFxzO6J5/3fod8uPzLqRtc8bJ4x0jNH8ip/IgKpA37V9IxZeMvspaOCxkzaPm1s8FrtcV+y/gjIWczGBhDeCA2m/yCFoqd282ATxwF6auG5S+mJfrwqOP03Hnu0xhHIRDwaZ26FPXGCsJuCGpH72RRcM3iL9xMLq2PmwD7ma1eL1+eBsvQ7h0bRLMTBirD4l379Y/A4U6Bs8xMDHYfAb0gb9vWH+g2WxoLV4udaQCXQVgS6adhVhVtyL4ktebElbaZ4uv9ZBPqFMCGL6H1ptDtlU6hgdfdpxIAw7mOLEpdH+thMJhvlsGmZSwUBoV7x6BWplzcAwhAAIctkwKChyiCmPC9wKpDUjkWkLPX5QY+19Cr3Ct3DB6I+D4o6RB6ao=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab68b74-0f83-4fd7-ae9b-08dd78647b85
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 19:18:32.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PtXvbQouDoRH4IeEVLJ6kHmO406GSOr4FWwGD7KCVugHDnOBNqEbwwqZHTJ+NW1TmrJ3EORE/P3aT6jPOs+sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504100139
X-Proofpoint-ORIG-GUID: MM30dl8Zywo4kdl2Q9nw4LHH0man-Woe
X-Proofpoint-GUID: MM30dl8Zywo4kdl2Q9nw4LHH0man-Woe

* Sidhartha Kumar <sidhartha.kumar@oracle.com> [250410 15:14]:
> In order to support rebalancing and spanning stores using less than the
> worst case number of nodes, we need to track more than just the vacant
> height. Using only vacant height to reduce the worst case maple node
> allocation count can lead to a shortcoming of nodes in the following
> scenarios.
> 
> For rebalancing writes, when a leaf node becomes insufficient, it may be
> combined with a sibling into a single node. This means that the parent node
> which has entries for this children will lose one entry. If this parent node
> was just meeting the minimum entries, losing one entry will now cause this
> parent node to be insufficient. This leads to a cascading operation of
> rebalancing at different levels and can lead to more node allocations than
> simply using vacant height can return.
> 
> For spanning writes, a similar situation occurs. At the location at
> which a spanning write is detected, the number of ancestor nodes may
> similarly need to rebalanced into a smaller number of nodes and the same
> cascading situation could occur.
> 
> To use less than the full height of the tree for the number of
> allocations, we also need to track the height at which a non-leaf node
> cannot become insufficient. This means even if a rebalance occurs to a
> child of this node, it currently has enough entries that it can lose one
> without any further action. This field is stored in the maple write state
> as sufficient height. In mas_prealloc_calc() when figuring out how many
> nodes to allocate, we check if the vacant node is lower in the tree
> than a sufficient node (has a larger value). If it is, we cannot use the
> vacant height and must use the difference in the height and sufficient
> height as the basis for the number of nodes needed.
> 
> An off by one bug was also discovered in mast_overflow() where it is
> using >= rather than >. This caused extra iterations of the
> mas_spanning_rebalance() loop and lead to unneeded allocations. A test
> is also added to check the number of allocations is correct.
> 
> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  include/linux/maple_tree.h       |  4 +++-
>  lib/maple_tree.c                 | 19 ++++++++++++++++---
>  tools/testing/radix-tree/maple.c | 28 ++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> index 657adb33e61e..9ef129038224 100644
> --- a/include/linux/maple_tree.h
> +++ b/include/linux/maple_tree.h
> @@ -464,6 +464,7 @@ struct ma_wr_state {
>  	void *entry;			/* The entry to write */
>  	void *content;			/* The existing entry that is being overwritten */
>  	unsigned char vacant_height;	/* Height of lowest node with free space */
> +	unsigned char sufficient_height;/* Height of lowest node with min sufficiency + 1 nodes */
>  };
>  
>  #define mas_lock(mas)           spin_lock(&((mas)->tree->ma_lock))
> @@ -499,7 +500,8 @@ struct ma_wr_state {
>  		.mas = ma_state,					\
>  		.content = NULL,					\
>  		.entry = wr_entry,					\
> -		.vacant_height = 0					\
> +		.vacant_height = 0,					\
> +		.sufficient_height = 0					\
>  	}
>  
>  #define MA_TOPIARY(name, tree)						\
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 5610b3742a79..aa139668bcae 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -2741,7 +2741,7 @@ static inline bool mast_sufficient(struct maple_subtree_state *mast)
>   */
>  static inline bool mast_overflow(struct maple_subtree_state *mast)
>  {
> -	if (mast->bn->b_end >= mt_slot_count(mast->orig_l->node))
> +	if (mast->bn->b_end > mt_slot_count(mast->orig_l->node))
>  		return true;
>  
>  	return false;
> @@ -3550,6 +3550,13 @@ static bool mas_wr_walk(struct ma_wr_state *wr_mas)
>  		if (mas->end < mt_slots[wr_mas->type] - 1)
>  			wr_mas->vacant_height = mas->depth + 1;
>  
> +		if (ma_is_root(mas_mn(mas))) {
> +			/* root needs more than 2 entries to be sufficient + 1 */
> +			if (mas->end > 2)
> +				wr_mas->sufficient_height = 1;
> +		} else if (mas->end > mt_min_slots[wr_mas->type] + 1)
> +			wr_mas->sufficient_height = mas->depth + 1;
> +
>  		mas_wr_walk_traverse(wr_mas);
>  	}
>  
> @@ -4185,13 +4192,19 @@ static inline int mas_prealloc_calc(struct ma_wr_state *wr_mas, void *entry)
>  			ret = 0;
>  		break;
>  	case wr_spanning_store:
> -		WARN_ON_ONCE(ret != height * 3 + 1);
> +		if (wr_mas->sufficient_height < wr_mas->vacant_height)
> +			ret = (height - wr_mas->sufficient_height) * 3 + 1;
> +		else
> +			ret = delta * 3 + 1;
>  		break;
>  	case wr_split_store:
>  		ret = delta * 2 + 1;
>  		break;
>  	case wr_rebalance:
> -		ret = height * 2 + 1;
> +		if (wr_mas->sufficient_height < wr_mas->vacant_height)
> +			ret = (height - wr_mas->sufficient_height) * 2 + 1;
> +		else
> +			ret = delta * 2 + 1;
>  		break;
>  	case wr_node_store:
>  		ret = mt_in_rcu(mas->tree) ? 1 : 0;
> diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
> index e37a3ab2e921..2c0b38301253 100644
> --- a/tools/testing/radix-tree/maple.c
> +++ b/tools/testing/radix-tree/maple.c
> @@ -36326,6 +36326,30 @@ static inline void check_spanning_store_height(struct maple_tree *mt)
>  	mas_unlock(&mas);
>  }
>  
> +/*
> + * Test to check the path of a spanning rebalance which results in
> + * a collapse where the rebalancing of the child node leads to
> + * insufficieny in the parent node.
> + */
> +static void check_collapsing_rebalance(struct maple_tree *mt)
> +{
> +	int i = 0;
> +	MA_STATE(mas, mt, ULONG_MAX, ULONG_MAX);
> +
> +	/* create a height 6 tree */
> +	while (mt_height(mt) < 6) {
> +		mtree_store_range(mt, i, i + 10, xa_mk_value(i), GFP_KERNEL);
> +		i += 9;
> +	}
> +
> +	/* delete all entries one at a time, starting from the right */
> +	do {
> +		mas_erase(&mas);
> +	} while (mas_prev(&mas, 0) != NULL);
> +
> +	mtree_unlock(mt);
> +}
> +
>  /* callback function used for check_nomem_writer_race() */
>  static void writer2(void *maple_tree)
>  {
> @@ -36496,6 +36520,10 @@ void farmer_tests(void)
>  	check_spanning_store_height(&tree);
>  	mtree_destroy(&tree);
>  
> +	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
> +	check_collapsing_rebalance(&tree);
> +	mtree_destroy(&tree);
> +
>  	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
>  	check_null_expand(&tree);
>  	mtree_destroy(&tree);
> -- 
> 2.43.0
> 
