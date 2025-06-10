Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D7A246BA5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561595; cv=fail; b=qKI87yOMGPNep+m1z6DZbU7gtckXtHIHiXx7sWEN0xngeypnMyFFCgY/1YPyU0qcIygE+4BkssW9ofw32Ac8k9ebcGBXa44cKjlZy90iYIt6AHd+oM+GQeEy2I9HzOFEgECdxZG/3kggFQgRiQoY0Jpl29n6q5SboBwf20kgzX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561595; c=relaxed/simple;
	bh=/V7ZlF1gHsoEh7YMLo7jiy0Zxd9xpnfewYeGaM2pSb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lTRbRll1Fso0Uon7W0iUpi1GAo0ulvrpx/DIZhbLByPhUp1Xvey3XTp2Y/CCf/b2WQYH4Euoa2tUlFLedcNAklB/DtzX2tpjxviGzPwHmPcYC0/ToLbbrqPv83XE1PA9BTLtGM5vzcf1ZRq3LKfR1tlfSRQ1YoQxZBUZX/ujAJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A1miAJWP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AwBx576g; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A1miAJWP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AwBx576g"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ADBgv9011336;
	Tue, 10 Jun 2025 13:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/Xs2iygU6kZaBbfYfr
	yGlQ24Gd4IbbijfOoaD2oYEPY=; b=A1miAJWPuQ1fO2n0evt/Nq8jaWPGGeBEbN
	sErMHCtr4UuiXsHuxwlXGNj1/Eu2Ki6KeaI1uV7yhII+Na4CK40SL9HLCwuhz9jE
	7J6MqqlENL0aPUyRN3Ybj3leNUCm/yRDceDHf1JUBkzYC/ZI7IoiYm52vdVIYHWC
	ut/Ytwd2R8vY4L2hwWquyZgXpPsM9REr2X4GnLAv3tgxNHVGbltnoc5IbYvo/aLU
	rG4bXgJZlykzcJrSoKPVtOJXpwAw3zWxYdNZR/4H7TvMi5xbXTZYLOJ/fAJy1LPj
	pvgQ6020b+rOUfm10pbcW8PT8iZOzMc5TAOic/Cjk4aiZ5o8TaHA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad4517-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 13:19:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55AD0YSt003281;
	Tue, 10 Jun 2025 13:19:05 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8qsd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 13:19:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS8eRRASifmbzBkyS0fycnpXU7Ry+gX7qXcQLlqD8RfMSvjqKn/a9DlGZZ85daOiTypAGanAljAEAP/FIOvLemHZyX6XD2TgTWFZsmvVJBrmLNbdhT0qetgBTtzNJIWPcRfSjjgWxWgDMyVMHOhreYKwTrwGK2dkCNpLGKeCsCpDn/GoJWrqE5ysOFkf9SvR6gJ2qF/5cXAxvV+Y96l3Cw8b9/vkIcTIBWuNOGX8aWvOsTCvgb3rufIyYvKL9u+teuo4OOJ1E3LR3Kd5xbCk4MU+F+nY9NOpLJyDc+1Q9ropR6cFgSLOm0k+VtjR6bhlgRJQoYUVyKoZxW3U91VmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Xs2iygU6kZaBbfYfryGlQ24Gd4IbbijfOoaD2oYEPY=;
 b=vRNGnX71Q685CCUX4FCTbmP8GSIWi0TJ0rIHRD7D9knkwKmawHqf7sao/amKrD11w44UklIRfC5doiPPf/2k/8I19kfKMlkiJXC1phBJE+mIdKxD5CD2n/RqvJP5hM+Y9ftsCqV8K+Ls0iAMKrYKV1QTN6bp9tIpSprZmTcpdcPY6qcuNHfrnfjCXHf3TEZQ8BzNKZo5j5TaDkTcC/HTxUpVmrve7vLQdXj90zjKnboxq6sEM++RvYTIoFshZENl5AyG75xHu3IswSxzmhl6fDZpxH3ZiX+6wPaK3ueXrYX9oU/+9t5Sir6lqit/Di/DywZuxeurVcEveP8n9pn83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Xs2iygU6kZaBbfYfryGlQ24Gd4IbbijfOoaD2oYEPY=;
 b=AwBx576gVzN4SSWg+HA/ZGlpcTkxujVhcdpjOAHvyLj6XWfQL+xD5/V7osqcrfyD6jjX2apTL6h1AplSlwmWnvw8h1gcIm5A3cNEhiq6eaghiU5ihBnvtCiRcap4tVcDSFY5FJrg3jzZDs0/EafLDjcc3omLNo0cZqJLRWntE4M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH8PR10MB6671.namprd10.prod.outlook.com (2603:10b6:510:217::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Tue, 10 Jun
 2025 13:19:02 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 13:19:02 +0000
Date: Tue, 10 Jun 2025 14:18:59 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <af75dbe7-b6fd-4288-8171-32fd6f09a850@lucifer.local>
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-3-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610035043.75448-3-dev.jain@arm.com>
X-ClientProxiedBy: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH8PR10MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: d541bde1-8b9b-493d-2200-08dda8215e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zz1MTURHB1i84OfNj+UE7tnhBIRTAWrJvisGWh+1V41c3E9OmmHtx1aYxOYm?=
 =?us-ascii?Q?EaHH1l04f2eVe1Sg2caw2hBQfA7mHwdw2V5mIqzNm8B1kH8ydU/wlv54YERn?=
 =?us-ascii?Q?vP+iIQdeQzsQcIPWG6CZAWAEmY72Ac/oRVBs9HoxwGRa4lpQD9JAwkocLjiB?=
 =?us-ascii?Q?J0qmC3S9ELX4chPY2Cl0r8AH58SQ4fwlzredznU9tm19NP6Lq8Jtx0j0McIX?=
 =?us-ascii?Q?HSNeGIqJttAJc0Goc68tTjN9AW4CPopY51g9Wz32AphwYlNzv9tMsLuGcoH6?=
 =?us-ascii?Q?mMXUZiq/knRpQKLs2rndJadAfyzVjshoKQUtRWfikx3sYkKVN8Bvrdu4wMMd?=
 =?us-ascii?Q?4X0+TFkYVLtxb/4nyi6TYFVPte9HJOlP3yj6L2WMLGf2qh7M2VKlz7VZE5Cp?=
 =?us-ascii?Q?rrgF/G6++oYAmSKb4mPvKoQudNj1LqMxg2s4t8Tr7eXHpBPdsrAtppHyTD6C?=
 =?us-ascii?Q?DIJNTi91a8t7rCpSmSBakG1bAQCAk3DXee98R0M122JZUYwOW6PgdNgdpz49?=
 =?us-ascii?Q?p5cK/ELlVgmMdJcw0+/V3oOFl2wS3YLmSEDPwQ8xpM0ycmfMUNRCxcT7CR33?=
 =?us-ascii?Q?8iBXp1LIfW+0WjhuuVISVnM8E55576+XFwGPPDUaoGcanGCRCwj7s7KLxMtc?=
 =?us-ascii?Q?0t+froJDRRVmIRAazxqQ27Sc9B/6A69xnal6VMJsX4NxnJQJ1LzgKlEbkijG?=
 =?us-ascii?Q?dOeVOCPvdWApIe2bhyfED9t6nA7DLqvhnKCdqEECDnzA13AKLnJPg/qCjSTI?=
 =?us-ascii?Q?p3R9k0Z2WsB42PyQVo14ZCWT8o9JfN7NhlPyjjnr8UWadh1nUa+FZOfnqKRK?=
 =?us-ascii?Q?sLrX95RL2W0qhurjNxXriuofJck8tYK3EgFisklJrU8ek7Z6h7wn207RkqVT?=
 =?us-ascii?Q?r2vtVkUgyxmj9kJO56KBPmpyVt7PcgqUpLKJswTcL8fU0haTHO00+k4aKR/Y?=
 =?us-ascii?Q?nu3AZwDQQW0pK8ZnuJ1ZC1Lpg+PDWfogvMG0gXlKozcNI+ZtQQ9TbyeMWtVy?=
 =?us-ascii?Q?iqyteyCgydK6rIMj+sWJIf8l1GZXv3SM9aQCKdh8gSqEO4nQY1aypzb3QgjA?=
 =?us-ascii?Q?or1+sHEholCOWJK/N2QUYDsDmd3o0hPQ9zGmL9h8oTi/3E9JZaDK1cIqMRbR?=
 =?us-ascii?Q?ZGpzWKvfqfTlfK6KIapcrft3Gr0Vmr92dtZ/BM3ptf1ZhqHAWP7fVDRJ1Vs6?=
 =?us-ascii?Q?GAPdTwsQ+AoUCUyy4ebB0Hf1lyTXAQs2AiIaJAEiVoG/A7Tmh8LuZMrqMpp+?=
 =?us-ascii?Q?WG6Ji9otjCF2uQ2T0WJaHm7+tqKB+wgRew5DskFByQYGUlhkgNmN6u2tmy0/?=
 =?us-ascii?Q?N8asn/ufTmMJo5K31UKMX7alkvNeAit7zhxtOPPMYs8gKNLXYMMBH3I8/oMC?=
 =?us-ascii?Q?62IS9dI8X1NNGRqpBxx7j1gL4/BmQlENMbuQNgcXq4Osv92Pog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iWYLvoWODDOrKHyAz94g7dZRMBGBksFTeY5g3RDpuPbyb80bnxaYo4HC730T?=
 =?us-ascii?Q?Mj8FgzPClL56VZde0zPb0ac90BNKkxEON2uLT9aQmZHa1OcDFmkvwueQ+u8D?=
 =?us-ascii?Q?hEIg141QdoTI3rmlvhqhmQh01CRWzuN0zzyqTeyhtxGR/iNqrzNr4/nVWgW7?=
 =?us-ascii?Q?IXY//jwsl0MSCvqR2+i/qNV8F8sgXocXeGaovGcs36nP19gyUmPLFY48rshE?=
 =?us-ascii?Q?wCWbGYMc2zfBAH+dvZaiiBBUPl6JwGD7ttJwI5SoBfq3DxYkfousf92Qno+v?=
 =?us-ascii?Q?HbdWvnf71q9hKEwjiFp5e6ydfkgnKUaVXukjIIuFO+DOjTqsCxE78vBMIRcU?=
 =?us-ascii?Q?WAiHH9PChcaVDPuC/26Aqpmb1lvcTAhmFKiQGqdx2n/SzzZ87MNYQ/7GaKSy?=
 =?us-ascii?Q?kaoI+08y/F1vWYlx5Fa18LIXzbcV8Sd2jv7mSKRzCXEZqEMvPs52FUxLYyJz?=
 =?us-ascii?Q?aXihNoI4vCNE4txS/NWFRqLOb9Djq7+sGz4L6eWV03s8RPit59knMTbJlWfJ?=
 =?us-ascii?Q?pq7tcHKXA5ziqV0pImPwnoGHCkMHe/Q3aNOBlOtBDnFrqrocthADzv+romkU?=
 =?us-ascii?Q?pJx35My0dQKXWgXvld/uVkYrn9TkC0N5WqfeuFUZNm7PC5qInSoc6W+iAdsW?=
 =?us-ascii?Q?bnT5xe/qvKWlwKw7g0vfumWzPoDV64c43PJa4KGFgWY2+c/dbUOFfGB9W1X/?=
 =?us-ascii?Q?xuDeSbsrMbSLA56vCmmCxNb4M1PTa6yGqthQVRONjrBWkjhPHQUmSLtDDsnm?=
 =?us-ascii?Q?LTufhaYrqsgpeOeZB4yRYEvwd+yM7vWnRJLAvs5EDzXCZN8vmgK8b5I6ouoR?=
 =?us-ascii?Q?TQXxnJuYg3mqtSibbDn+Q+w1Mqov4iW0qoWTmmJpltR8jvcXafcgMvZxGAzq?=
 =?us-ascii?Q?MPpLqiAJ3s0HFGeAbx3Auaex3cAJmQFxTGoeQb3lshWHy3sfPMsOfyJrNkWG?=
 =?us-ascii?Q?ENW3H8mIHoMvmrOM5yT3bhczHftQ3Y7izKqARECO0OqzVUx9wSU4cEmzl+B9?=
 =?us-ascii?Q?SqpdLwdf+8nNm978tekIArRTKdKRgNT5hNKAvUTDOU58Mvo3W1ZiJ0JsUl6c?=
 =?us-ascii?Q?fc7FW1PeWDMvE+3EyVXAzU5sMEaOFKh9LN/tbE4ZrqQAy1tdbPXIgS6wschC?=
 =?us-ascii?Q?dzfNWqErBjaBWw3+/QTGhrcd2hs1IghLGH4YqdgOoSplnkP2dWxVhOtpknSQ?=
 =?us-ascii?Q?nzgzMfz/hFLhaYT4eBbF8N+vvHkvTAkg0FCZRXSlpQ83iFULsaVUp28RLaqy?=
 =?us-ascii?Q?vD1Q4+LdMLMweJ+py5RQ9wsBwVlmkxfK//kUrD8LpkZ0U/FJe7c73gLHCMiC?=
 =?us-ascii?Q?kJawyIwYaMXzGSTyO7TguAQgnI31WMHPWRTqYFuLBiqWBgof668T6E3GPoRM?=
 =?us-ascii?Q?59WDtoUrF2sHLwfNFiK0mOOoS9slW+qke1jMvg5RX91Y9dmgph+66UX1JnyF?=
 =?us-ascii?Q?cwXQRXgiebBrQS0uddx2LbbrZJgwbVpsPecuua57G6w2vxCRhy3U6EA0kV/E?=
 =?us-ascii?Q?6Yd5kHpmGULPySg2TWFlELMPs2mNHJNgiT6zOCR+I+/eQuE3A4eZiqZRVu3s?=
 =?us-ascii?Q?PMf/0z9WG11R7qc8b42YZm7Tba9vDz+cMMtIMnFiqu5sAonSAoIr5igU+t4h?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9TkEBSAMoW8g60cNJmLRWSMNW6SnOw/oNZwHeuFT1iTCO77XrloZB2yT2fc1AQH2dbjutSQZKbUwooLYOudtIFw5HYOLXppK1hyyrJiQvng0AuMYIVA1G+B48xCJZIShsXvcV33GLkSwtd+6fiRXFkjxZVPM/hZ/UkRBvXfy+VfwPaLS0wCOMtMho8bvzFFSP0jisOz40a61usVqCee1xc08SLl90KxWgtlhjEWeVmBpS5XKTnh2cEZFCh8yENypE29v7DIXsEFCQ8v6zvq8t1qtXSuJFcCqtamcN8HBT/bsOUPB6dXTkq9FJ1uHQPr6ZoJwtGVEOEW6VhxLOMGufovwOCJozhVJPF8JkQgKiXsvX/tlqOFzAvYKsaYPEt1ItD41ONlDr3tTDoqR4Pkty6dMIHtNmrt7q9WEWFRXUhAB3uIaQ6x9aRs8MgDbJdn0hk4YvaCA5VGQpnyvHuqhEzo3tr5wYDg2wcxizmQKNNpM7pNv0ypT3o+PYeLqDYRU85hnkQyotFRl6h7+vXBVdeX6hESvhkVoqV7hG2ziqlqAAbVaY75gmbLABylHCrLxjubGXKbzGdpVpIeTecyb+CvenRe3lMlS/lYUJPi1ayc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d541bde1-8b9b-493d-2200-08dda8215e5f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:19:02.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V15z9cvxXfD+b2t5EuBOHjX6Iy1bMPCgr/ysIzrHb2vp3liPLHduUFX3/vDATRvjQ8SSt1npAejXG2O+2vxN3gRopnNDN4Sqrx/utOBC1l4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=958 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100104
X-Proofpoint-ORIG-GUID: OMfHQb-5tJOt3jxGll2sD1BwklfQl8E4
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=684830cb b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=Pq_2Wrnj-zEXneWydwAA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNCBTYWx0ZWRfXzmCu5r+1DmT9 sHtXjm1a01XZnbamnDbONn+VTblKC9+HdzK42ujOnBD4ov1/x+gBz/WD9g49ku+c/iY1e846m94 +tAnbFUE6bUPUp/di3B8Q+edOJcoZ8nEhrsA0b7pxJGMVdGrQv3Ra4lYWHqb8APPHac6TgchVIH
 7o7A+VoDXLbVIL5kDt3ZV6x7mbexCsM5ypprBfu29Vu9A5Vc7q7Rehr4N6gjEDpsVhU7No4TFle QCjzunvVzbqR2EpFbgI58bs4N9w2UFD4mg4olhHA2VZLAk/dccFQpkTBStKEo77M1mQiQVkAHer RMWO5hEmHZOo7F4pticMJvfTPdY+yif9UEuB0ZqgYJRNyPs2fx+64z/r8AoV2pRra1/KJnD7IE8
 Y3PefPMLLIgzrsPRycoz78P88ds+Kjp0H1XQwBjKecgp5YvssnFcF1QAD9lDhO2cIbq6O/ET
X-Proofpoint-GUID: OMfHQb-5tJOt3jxGll2sD1BwklfQl8E4

On Tue, Jun 10, 2025 at 09:20:43AM +0530, Dev Jain wrote:
> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> are painted with the contig bit, then ptep_get() will iterate through all 16
> entries to collect a/d bits. Hence this optimization will result in a 16x
> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> will eventually call contpte_try_unfold() on every contig block, thus
> flushing the TLB for the complete large folio range. Instead, use
> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> do them on the starting and ending contig block.
>
> For split folios, there will be no pte batching; nr_ptes will be 1. For
> pagetable splitting, the ptes will still point to the same large folio;
> for arm64, this results in the optimization described above, and for other
> arches (including the general case), a minor improvement is expected due to
> a reduction in the number of function calls.

This is a fantastic improvement on commit message, thank you very much!

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Looks good to me:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/mremap.c | 39 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 7 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 180b12225368..18b215521ada 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>  	return pte;
>  }
>

Just for ease of reviewing the review :P

We dropped the comment here as agreed:

> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t pte, int max_nr)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	struct folio *folio;
> +
> +	if (max_nr == 1)
> +		return 1;
> +
> +	folio = vm_normal_folio(vma, addr, pte);
> +	if (!folio || !folio_test_large(folio))
> +		return 1;
> +
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
> +			       NULL, NULL);
> +}
> +
>  static int move_ptes(struct pagetable_move_control *pmc,
>  		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>  {
> @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
>  	pte_t *old_ptep, *new_ptep;
> -	pte_t pte;
> +	pte_t old_pte, pte;
>  	pmd_t dummy_pmdval;
>  	spinlock_t *old_ptl, *new_ptl;
>  	bool force_flush = false;
> @@ -185,6 +202,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	unsigned long new_addr = pmc->new_addr;
>  	unsigned long old_end = old_addr + extent;
>  	unsigned long len = old_end - old_addr;
> +	int max_nr_ptes;
> +	int nr_ptes;
>  	int err = 0;
>
>  	/*
> @@ -236,14 +255,16 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>
> -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> -				   new_ptep++, new_addr += PAGE_SIZE) {
> +	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
> +		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
>  		VM_WARN_ON_ONCE(!pte_none(*new_ptep));

We added this, which does in fact seem sane. We absolutely should not expect to
see a new PTE here.

The uprobe logic recently addressed actually made it possible for something to
be there (ugh god) but that's now fixed.

>
> -		if (pte_none(ptep_get(old_ptep)))
> +		nr_ptes = 1;
> +		max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
> +		old_pte = ptep_get(old_ptep);
> +		if (pte_none(old_pte))
>  			continue;
>
> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>  		/*
>  		 * If we are remapping a valid PTE, make sure
>  		 * to flush TLB before we drop the PTL for the
> @@ -255,8 +276,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		 * the TLB entry for the old mapping has been
>  		 * flushed.
>  		 */
> -		if (pte_present(pte))
> +		if (pte_present(old_pte)) {
> +			nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
> +							 old_pte, max_nr_ptes);
>  			force_flush = true;
> +		}
> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
>  		pte = move_pte(pte, old_addr, new_addr);
>  		pte = move_soft_dirty_pte(pte);
>
> @@ -269,7 +294,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  				else if (is_swap_pte(pte))
>  					pte = pte_swp_clear_uffd_wp(pte);
>  			}
> -			set_pte_at(mm, new_addr, new_ptep, pte);
> +			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>  		}
>  	}
>
> --
> 2.30.2
>
