Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCED1E25ED
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211528; cv=fail; b=gsA5ZWG42PlkbSvMkzxDJcJObX3L0bQN6BboX+AqiO4Ok/gM5AyOK75A7vefOqh8GrjwKOUsdgEHKPSpHpQrRospWwOm3qVkqU9Eujh78dIssvgq0qabybr44kJdsXul+d08t9sfCiGmsL6W1GB70HVFsN4R+29ZIOSOcIjY3+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211528; c=relaxed/simple;
	bh=8vM3kRxGRNjql0E93wTcZblKVyW0ouBdkNvHwnMXm5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j57fsZXAdrM97LKmNqFvpHMtfkQlb/O3bsHwRveLa62voAuTLLaablpCQXZ5GVWYAvS8rgGwt+F5CDIPsRpcbLlNWKZLR2SvwUYIpj60zGVtvRgi8+wCcLvKvFg4xF3QhSqLb4G1CmpBIkZY++LIQHR6x3DtCiLeXSnhzEenegc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z5TOs/oA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u29dhi7p; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z5TOs/oA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u29dhi7p"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565NFKC031650;
	Fri, 6 Jun 2025 12:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=P7mBmyIvf8s04x5GwM
	yrCyGFH486bw8jXpw1k+wGajY=; b=Z5TOs/oAiFQKmpS1EmhsOV3orAI0T6R9uE
	rsbfiWyRI4pTYTOdiT/KfvY6rxZgOx06N1pIOny0UJ4lfXssgB76ai+uD7/SXdu6
	ttRoIBe9PMMVt/h5f4oyFA8SteknbfYGYvT+PDCjrLVc36FdTCynuwdkOBVm3mUC
	rv8L+MPiIi3CvCmSiL7Ul7PKSrsoGLGBG1DEGcCTV8Ok6r94QQ64ITs3p9afsYLO
	yCDNPC0FIRkEpKV+gcEM97L0xX+aMSq99Yn2Cx/WwJuSTYruY7qFUMRrnGIEbONE
	J5093ve6DjN/vHpb9Cp76uem8ww7BQ7i4u8dHAKxFcv8d+FuZseg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dyw97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 12:05:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556BjZl4034599;
	Fri, 6 Jun 2025 12:05:13 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010001.outbound.protection.outlook.com [40.93.198.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7d72u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 12:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZZuxsJcIE2RrHnAt9F6jF7jG3aiX+nUWUOWGhFxz18M3fOaDJgDAB3RNoLA6Pr/ftYmbLbSQ4f0z5+PAo3I83V7OMoFV1jQLtmHpcIqPe2Cr3E5Nz1TM8dZl31R/Q7b2ZXENKQFSSZYkQi/o1p5fAdJs/JD8ZjFHHCsXsH2rhtj0WvV6Gol2NGvOu7sNxKa70JAsqZTQLlOesbwFFv173O1E2DhzOFz9nj+dcA+dmpdKSVhTyp86g7E3kuPx62PveMgOotVUEja+8FglJdZ5AtUjkJ7M8WwtlhsZEkVTWPsA/KKQDlfXTeh8EP7X106NQIJ6xi2kqaW/tSFJlBFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7mBmyIvf8s04x5GwMyrCyGFH486bw8jXpw1k+wGajY=;
 b=cbf2Ss0dJLHsBDcP42InKq8UtQ9kU79N+XqpthKB6Kt0hJrhKCy03FXOjRm6ogOentPW9EkcwobvrcyVUHV9E93KsG8d1ZvXlK8dGX7RloyuympsClA56CCZqGV6bDfQtXiZW4drbQgnXlpSPBqiDnXrZrdM4/ulxpZMSrPaZtt91ii1fhfoyrtBbAT/QMnn8CHKvckFIXnWqWBm/drfm2afHXA8ZxGjr+c29NAnad3viq0qR/Gm1dVYRCHt+sajiUwR8Pa/b0kwzmj9i8ERy4rjoZZYfIXzK59IldKQYpj/bgX3NPokbIUT47KqlldwpdVwiLp7oD2M6w3kG1velQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7mBmyIvf8s04x5GwMyrCyGFH486bw8jXpw1k+wGajY=;
 b=u29dhi7ppzCrxIEb4SgsKrV6VBS3nAIPsawWR2E3x9ifCmAxjhsa0su10qUz7L9H3h2E+u/ZvpAWW/NOUYJF7QsrRuS5b3VifWlRlDCjHL4p2vXz9EUZ72VE/4NGZdpYa7Xc3yikBhT4fgRGZ+/Uu1aX+UIAtGNQOam8AS8EcjY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5131.namprd10.prod.outlook.com (2603:10b6:610:c6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 12:05:10 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 12:05:10 +0000
Date: Fri, 6 Jun 2025 13:05:08 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
        brad.spengler@opensrcsec.com, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] WARNING in vma_modify
Message-ID: <e6e71e0b-347b-4edb-b558-b502f55a637d@lucifer.local>
References: <6842cc67.a00a0220.29ac89.003b.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6842cc67.a00a0220.29ac89.003b.GAE@google.com>
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: e5326af3-996c-45ac-eadd-08dda4f262fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QaIuEZlGwHT4VCwDB722A83HPVvkxIoFCcw0VolJyW7q/5ViQRmtooSUZqgA?=
 =?us-ascii?Q?C2rOX5i1lt/LwwUFGGt1icVfpDc3AS8Tv7ttFAmwJlmuD0VrbMWvZEb6kAzZ?=
 =?us-ascii?Q?HQdmj5kgosqreAfGG1QO73e+q1sr2qJrVN39Pqe31Qr9FnEII9L4pzpVQVor?=
 =?us-ascii?Q?gV54k1MF+Q+RDY35luyh/XOQNxAqgU2P5frpau956Q4ZVzMeO2N3f0hjvRN3?=
 =?us-ascii?Q?1N4FL8jhaiNstrFevQHlVy67tplNzniZ2QP8QgMOdp/MKlWRUH3x1pCVTYtx?=
 =?us-ascii?Q?yiaxyndE8mLTGQjTdpkbLTPxEfXGPX9rtN/8pogFmhdK2h0KpVwOfXIwibsd?=
 =?us-ascii?Q?A8XO4QIcLxmnNgWuJv3o6/6lSf4gBP63WrQnZVvFdSHxogKd1CvfkTszN+hP?=
 =?us-ascii?Q?v+pqNdQ45l2uiiRcMpZ2dyMiVPfdJn6wFcT1AazHjj4t3/tUdTW0S9y8nfrN?=
 =?us-ascii?Q?a1b88oLd2gghFoKQJowgJhgWYqvJQsRFrmFLyE4G9uhbE7WMOR68Ynf2U25k?=
 =?us-ascii?Q?z0r1nkNe/glfCzFsK6YN6WjS0cm7l3NcCUEZFwHpZBo6D5rBtYLmVJTRbJEX?=
 =?us-ascii?Q?xdtQHc9s1LOvmUN2563FbpNsxkvkKMDLwBHS8UKG1G9o3gmvJv732DkYsfNo?=
 =?us-ascii?Q?FaRH7lC7nDMXKrclj5V7GE586wUfbYk9krj4dvR9jJx0YWo0dyoSPHnIsLOe?=
 =?us-ascii?Q?OhuqHfyuMXS9v0HCl5oaDh855zkSaYwKziF4UmZzzktP8k+43KtxddH9NHKI?=
 =?us-ascii?Q?8kybFefPAPjshgaRZDa3TmU3G8tQPWa8+uvlBVM1refptrTOItf+r7VfgWE8?=
 =?us-ascii?Q?QyvfdycIPuv/CaZBz7DhqjvamD23RQ3x73pwWaHqgonJv7aMaSQ1Qwe0Sci0?=
 =?us-ascii?Q?4nJZLGkYM+BiQTMjPChsa1H2QxU6R94ea8wfS38uTy0Rnwa+nxF5hqfNuev+?=
 =?us-ascii?Q?ZHIpqGM80mwv8jrmK9DrWiBc9hNd2dysvvGR63I8IViLO2pOU7UjcQInf/yc?=
 =?us-ascii?Q?QRO8xmqoKf33VLzYaNhpAxncrJF+S+f+UQ2KajATNIeP7Wdu4ox07JIXsxJI?=
 =?us-ascii?Q?6t24y7Js9tMPLQ62AZ17bOmN/aoSHd4wE3/Wc0dzkuD5idLPcufJs7aq+IiZ?=
 =?us-ascii?Q?Qlqyu/x9xAluXsYHcdHCAxKSEuAacpV1fzTGKXkgmgRGg2BVrJ/I4zR/pm5b?=
 =?us-ascii?Q?PdXLd7XbW16xIwuCfs/B2gFdYaEZ+Fzv8Y3jelGSQ+qmBsK5HLa+kgXXfsNI?=
 =?us-ascii?Q?C6L6125rbnMaLCabhOXIKahxznxNQs7sgQ+yJ10cjzr/6nniFxsxvitOLnCH?=
 =?us-ascii?Q?UvjMzm0hiiVMeTrj4hkGASswgaaz1/7EsNv/hACWbQkb1JVvrzDry0aNTnRH?=
 =?us-ascii?Q?9k9IpMBqjidO0qEI1dphb8LDiovM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rDCl6M9zWhwmhrkk9xzjxBIHc+aadhbD/DqmOEmUvM7YrbWwOCoa3rmLg5CH?=
 =?us-ascii?Q?wETaaQ0cJvlM1k3B81TJtXYLAJPrC+hUvxsN6gRWsODwGOqrQKg4Xl+epXYs?=
 =?us-ascii?Q?Fgl2WLOkrfhE30THX89m6mDfGrMNPBx+3IsbFu60v5lCGgGpO76aSdQvHlKQ?=
 =?us-ascii?Q?XogOwsRSPlUJ0qG/kAByDuzlOksO/+YjfRUezgEaWEsvwn6+mhJaJzRHH9yo?=
 =?us-ascii?Q?bmmdgacVXGNxZBJGh4JgZXXUd2lXlzh9tJru/Q4UQpvd/51JZbcIuSSGnqmJ?=
 =?us-ascii?Q?gqdEOd+O7LdHduhsGx51Oip3wzUZ8yY/JhxduGAmYYK2qqZK3BuDOBumKzqm?=
 =?us-ascii?Q?C7fJR5na7Rn1c5wsQT1/eC8+sMC9xu92qfbLBjhrvxe2kND/aekCkcG/l+tS?=
 =?us-ascii?Q?myDUBXIi4jBkbofjSQ5aiM3MCHa1H98sY0caeZG9fmHI57dBuF7tOiyvZ1AE?=
 =?us-ascii?Q?vuBu4HiLs43mAiJ8dwJVtueyPw2SJi+Xljq/n872lnggmf2ko/KWIOBHKE6x?=
 =?us-ascii?Q?uEl2Rmrlhf/xaxGzKrFZW7mxZeuOVdAjq7wf1hUBA496w3R+tMa/iq04GzvP?=
 =?us-ascii?Q?TaBpvqXvbxkTO1iO1uGSGGxaattVyomabgzJGTzlHrDrMVLBM0HkjZHOhzcw?=
 =?us-ascii?Q?xQcTf2nrauB0B7S+6827h9+SWAryc6IvrdgbgYIcfpOgBG3o5t19GROJZH3m?=
 =?us-ascii?Q?SP2pJrKuX/tvP/5w9pA0C7kkk3vjTUgh7c5asYGCoHqimazpEwSgB1NCUkKB?=
 =?us-ascii?Q?9JZPtJ50nOt1PegVEktblFiniZDqGNqklL9RbDRB4iTV92S8aj2d+HxF7tif?=
 =?us-ascii?Q?feaFUJX5hAl1TgNDHglBH+WUk/pwDrWhia33XHZm+i7Wz1gJMUkXPgH0TWpt?=
 =?us-ascii?Q?Cl/9ZfMRNmOITojW8IMd6np+G/ItP2vnPk45/p6nQbofqxvr0gtZIUTgEInz?=
 =?us-ascii?Q?a20tyYG7xH6nazVrXNYpGgdqtwj6YoLzQR7I1jaJv8o3eHov+18Gcj1oPKky?=
 =?us-ascii?Q?BEfBkrFNku7XHGXrBGTRLEaWFqDBPAjPH7Hz5axbK4khy7g7FiZmn7wVEIuS?=
 =?us-ascii?Q?B9jbs2m63LnVgChze3Z0Pb9rWDcDogoMNHrg0f1THxPchG8gb9NY7+EPL0/0?=
 =?us-ascii?Q?SOFFQK+GTOz/Q7/AAQA75QRX009t4i7vPvbRJI5RQhpf9MCCh1Emni05BDeD?=
 =?us-ascii?Q?neHc+SF/WuppYGnCqxRgFMcOQ0ZmNtRjvt9rpH5OnsGmuXcS/zbvYBUUk5Ed?=
 =?us-ascii?Q?6Z0LBlncTuapgaRPE46GQDmluOkbzvfp4vrYKh6i1m7ZwpFXMlQ6tO9HeSZB?=
 =?us-ascii?Q?3ouphBCJnBfwH7NvXTMrEnEuFOYuwY5yp+Gmr+i+kJTCm7fQMCSzjy4bEvsQ?=
 =?us-ascii?Q?/fH1+cVb3jota+Kj92pMgwNrXsGC+feu4l+i7lm0skj/+1WJM3Rgpp2h0BA2?=
 =?us-ascii?Q?UnX8j0+w7T6pqiKI73DF4OukssKuB60ww2iCrRF2dbRq0Qr3aVw+2ubHXX9t?=
 =?us-ascii?Q?HOvwC2Lty2amM7Sc8LkcFAAtuCK6J8W3yHC7sNt16pS/Iy+8PFQOWJyu2N5r?=
 =?us-ascii?Q?G7rnlvJ20vHXtaNjHGISWS8178dxQ2ODmf/cLrRIN0bb+VLFdYOyBwH+s3NH?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gYIK5Ep+s+2JwPVcb446S/b0CVyEggUPPK2ELMNtOK2V9b9X3E/bwH54Kr0NviQHSAovF9lSkNx8GjotALLC2G0X51xPtKELfcjF4BtjBf/PHbEc4a++iGoNwN6gKz0iAOO11OKP5/jA393ztDnf3Lhs/lyek7CsLWHHwF1pAkGY8YfmAZ1s/9/C2yTGWSSy0RxrFjOr+nralfnj+fECepIw2I8ap3p4Fulvcl5IkLLEuDT78YshT8iWZ2cPaeEiv3jh3PyEcpFFrm1QwKMMU+eoFIjD5X/VcV2dvOngZf8X6cEceZZv1t6WSi89A2FowR21kN9/nF8dEUjnTLal25Vm9pWDbAOHL9o1OyZ+l7IaUvgPppWPdbuuYz8pZ14W3JulrdPbSMzp9Hnzbvy4moSD7LZK3CM8JLIGC27TwafbAdelo4iWv3+1ZVvhzFodKv5BlBRNzaRQW7JSMuLozXCIou4tuRTlbWHwYd9RBBOOzKDajACVQ9nWGYmBoHa6zqxJybrM4fcpyRxVxMe3fLXUAu8tnKFuedvSJ0aYvKrSmnciDblUwkqX7IcDRQ+eIKrH2DOn6EGiDUO8uXUhSdhaS4qKk7gxC+hgIxNyUyg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5326af3-996c-45ac-eadd-08dda4f262fc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:05:10.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTrcfeI4zSLGyNAHIBpk8rNKQz1hEzfm8MXziWZ7z0RtAV5WL0HO904x47W1Uj+XtD/o54EptdLhWheiorl+3qAIhUgHdwWwC1Jw2GOeN0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060108
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=6842d97a b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=edf1wS77AAAA:8 a=3g80flMcAAAA:8 a=oHvirCaBAAAA:8 a=yPCof4ZbAAAA:8 a=hSkVLCK3AAAA:8 a=4RBUngkUAAAA:8 a=GgtC0AtW7QVaeDaU40oA:9
 a=BhMdqm2Wqc4Q2JL7t0yJfBCtM/Y=:19 a=CjuIK1q_8ugA:10 a=vVHabExCe68A:10 a=DcSpbTIhAlouE1Uv7lRv:22 a=3urWGuTZa-U-TZ_dHwj2:22 a=cQPPKAXgyycSBL8etih5:22 a=_sbA2Q-Kp09kWB8D3iXc:22 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEwOCBTYWx0ZWRfX+TP+7r8Et1pB gquAk32rBxpbr3EbPcbGQylz9v82+1+cZ2tcJOess63EnMyvSAtFCsu1uuwuQMHqjoJ2K3hQvNP 2M04S29Wu3fx/YQtYyjZRFVoT20z+FMmcsVvAfBwbglXBoJKH++fSrX5ZaJE+VbKDKRHvmCzE16
 MtdOFWgYDCNDA2bKJYcLc+e5nB1Yid/MSlabTP8HEyGS/6XHuCqbMwfoj1n6NF1MHjvZzpm1GY0 3j6NeHVMMx+HdHRVXhR6WH6RFbXQZzYInsixMkk/Yo/Vb9sk8RQ1JZ4Y5UwYQnIJMfn8fGV3eTY k3kNctvkbgs2L0PxfMF1X1ttqqbB1bSwc+r7pRtwq60dgvw/i4ks2hPaC/Y00xAyqJEmjB08fH+
 /pPOp0bvBc4s9fb+ViJhbMf/vEJkEuYJVqHqelVihYezbIVvg6T0mcAcuvjUUQ3ma5CGNzxO
X-Proofpoint-ORIG-GUID: UlxvPVEyUZSxtqTCm3OaGXoK2SkIhg5l
X-Proofpoint-GUID: UlxvPVEyUZSxtqTCm3OaGXoK2SkIhg5l

On Fri, Jun 06, 2025 at 04:09:27AM -0700, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:

Thanks.

This is because of the never-really-possible-in-pratice 'too small to fail'
preallocation issue that logic in vma_modify() addresses (a fault injection
makes this possible, however).

It stems from mlockall(), which is doing a loop of the below in
apply_mlockall_flags():

	for_each_vma(vmi, vma) {
		...

		error = mlock_fixup(&vmi, vma, &prev, vma->vm_start, vma->vm_end,
				    newflags);
		/* Ignore errors, but prev needs fixing up. */
		if (error)
			prev = vma;
		...
	}

However, in the fault-injected path in question in vma_merge_existing_range() we
have an inconsistency - in the case that an abort occurs due to duplication of
anon_vma data, we execute this branch:

abort:
	vma_iter_set(vmg->vmi, start);
	vma_iter_load(vmg->vmi);

But in the case here, where commit_merge() fails, we do not:

	if (err) {
		VM_WARN_ON(err != -ENOMEM);

		if (anon_dup)
			unlink_anon_vmas(anon_dup);

		/*
		 * We've cleaned up any cloned anon_vma's, no VMAs have been
		 * modified, no harm no foul if the user requests that we not
		 * report this and just give up, leaving the VMAs unmerged.
		 */
		if (!vmg->give_up_on_oom)
			vmg->state = VMA_MERGE_ERROR_NOMEM;
		return NULL;
	}

So this means that the iterator, which will have been set to the prior VMA prior
to this failure occurring (since wre're trying to merge with prev here), doesn't
get changed.

So in the mlockall loop, we set prev = vma, then advance to the next VMA, which
is vma (since the iterator was set to the VMA prior to vma), then we are
essentially trying to merge with ourselves... whoops!

This triggers the assert:

	VM_WARN_ON_VMG(prev && start <= prev->vm_start, vmg);

Which is why this report occurred.

The solution is to consistently reset the VMA iterator in this case, I'll send a
patch for this in a second, I've tested this and it fixes it locally.

Thanks, Lorenzo

>
> HEAD commit:    cd2e103d57e5 Merge tag 'hardening-v6.16-rc1-fix1-take2' of..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=107c7970580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6acfdd5e5c8ef3d0
> dashboard link: https://syzkaller.appspot.com/bug?extid=d16409ea9ecc16ed261a
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d3f00c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13c781d4580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/4f3c020d1cfe/disk-cd2e103d.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/f67c698d4603/vmlinux-cd2e103d.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4a3974b951f8/bzImage-cd2e103d.xz
>
> The issue was bisected to:
>
> commit 47b16d0462a460000b8f05dfb1292377ac48f3ca
> Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date:   Sat Feb 22 16:19:52 2025 +0000
>
>     mm: abort vma_modify() on merge out of memory failure
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15b5580c580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=17b5580c580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=13b5580c580000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com
> Fixes: 47b16d0462a4 ("mm: abort vma_modify() on merge out of memory failure")
>
>     7f83ee71a000-7f83ee71ffff: ffff8880117713c0
>     7f83ee720000-7fff07f51fff: 0000000000000000
>     7fff07f52000-7fff07f72fff: ffff88801182e500
>     7fff07f73000-ffffffffffffffff: 0000000000000000
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 5825 at mm/vma.c:808 vma_merge_existing_range mm/vma.c:808 [inline]

This is

	VM_WARN_ON_VMG(prev && start <= prev->vm_start, vmg);

See analysis above.

> WARNING: CPU: 1 PID: 5825 at mm/vma.c:808 vma_modify+0x1540/0x1970 mm/vma.c:1604
> Modules linked in:
> CPU: 1 UID: 0 PID: 5825 Comm: syz-executor396 Not tainted 6.15.0-syzkaller-10820-gcd2e103d57e5 #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> RIP: 0010:vma_merge_existing_range mm/vma.c:808 [inline]
> RIP: 0010:vma_modify+0x1540/0x1970 mm/vma.c:1604
> Code: 0b 90 e9 9a ed ff ff e8 4e 56 ab ff 90 0f 0b 90 e9 a3 ec ff ff e8 40 56 ab ff 4c 89 f7 48 c7 c6 20 8c 96 8b e8 f1 05 f3 ff 90 <0f> 0b 90 e9 4c ed ff ff e8 23 56 ab ff e9 4f ee ff ff e8 19 56 ab
> RSP: 0018:ffffc90003797b38 EFLAGS: 00010286
> RAX: ffffffff8b5d28cd RBX: ffff8880246ea780 RCX: ffff88802c93bc00
> RDX: 0000000000000000 RSI: ffffffffffffffff RDI: ffffffffffffffff
> RBP: 0000200000000000 R08: ffffc900037976a7 R09: 1ffff920006f2ed4
> R10: dffffc0000000000 R11: fffff520006f2ed5 R12: 0000200000000000
> R13: ffffc90003797c60 R14: ffffc90003797c40 R15: 1ffff920006f2f8c
> FS:  0000555582b74380(0000) GS:ffff888125d5f000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055c124e6b168 CR3: 000000007547b000 CR4: 0000000000350ef0
> Call Trace:
>  <TASK>
>  vma_modify_flags+0x1e8/0x230 mm/vma.c:1645
>  mlock_fixup+0x22a/0x360 mm/mlock.c:483
>  apply_mlockall_flags+0x2f0/0x3c0 mm/mlock.c:736
>  __ia32_sys_munlockall+0x10a/0x220 mm/mlock.c:782
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f83ee6a76a9
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 a1 1a 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff07f72138 EFLAGS: 00000246 ORIG_RAX: 0000000000000098
> RAX: ffffffffffffffda RBX: 00007fff07f72150 RCX: 00007f83ee6a76a9
> RDX: 00007f83ee6a68e0 RSI: 00007fff07f72150 RDI: 00007fff07f72150
> RBP: 0000000000000001 R08: 00007fff07f71ed7 R09: 00000000000000a0
> R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000001
> R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
>  </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
