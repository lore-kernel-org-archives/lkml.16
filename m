Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DBD14F98
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227067; cv=fail; b=TjItH3xoDiH9sfRUnpc8EKwgiIQL5IFZ/cDgzsarwVTf1/3Y7CprXmL4gA9MT7zGOG1BMxOWhRbhnaGxV9LplkLxLQu9m2JPrrPjORRUmPXzBE+o+WhEg3zdKex0rZe8kMXH44vp3PCmsjI+u/iegG08H63IT92JN1GQYdSP5tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227067; c=relaxed/simple;
	bh=iLPSwIMxDSpKQjSzrzV1B5x36Si9BqtUje2eNz6mkhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r33aTV1jxkpcmBFMh6cfg8EmrR1UL3VupbFRHnVB23BPPxrVysS6dYcAOmrMRmErs7z+VPvIFNxU6WqmMBztfdCmL7Q1/d2igrN/ehfE1l8qDbZMzRl8soZxhb8oeyi4tXeszd4tf+SKHXJO2r1+Mz9gAxKwiphc3I+FcS+W7FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gl7TWozO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=d9bt7jZm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gl7TWozO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d9bt7jZm"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L1E0Q2011283;
	Mon, 21 Apr 2025 09:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=S1v5GwCZWZUlerfQgq
	hBiPkGDOkoHPMT9jmQT7eja94=; b=Gl7TWozOKZAYE2pYfg4LH8y7fQH1vt54b0
	EdRYsZD8LWyLujOUNDs7rNzxdnG8IfXiMrGfDHesk1YtjlFPFe7dt3GmNdukLIzf
	3JvD5MjXt2ZS4KfEnx8332ltSnmQ3mkaxSUsUJrj+3T8vDJogTrJt3FZUymYTx1h
	J3TDWfJD6lG7qV8FqEQxgekC32EJKnv/XQO1xzmK87YIjEaZdDqbTQYTt6eDakjG
	GCfpIHhG/OVOcnI1p4GD92rn8HqgEnsN1r8OT1TpM0gmfzF8UWglsq4kkXNnYx5E
	aKcPkOj8tgtkoUACVdf9n0ro8h8rFplsSyVZn9YKltJMe96b3Gag==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642e0a646-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:17:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53L7cqOE005730;
	Mon, 21 Apr 2025 09:17:24 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010002.outbound.protection.outlook.com [40.93.10.2])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429828ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:17:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6SeyeOv07O+ojmN2WWkz/qgytnB2bRUMiONJWMcA+fBufYOwEAVGn0C9ZgHxbPvwEG+OvnTEne5D1AWwpenbztd6TVc8I2Id+3eGXOoiRuzEYkyTWAK5VNHK8pHXR5xZ7XQBnthbM/tO2lm17S7ODi3TNvpN/vRLlHibjG9Knw/wQcpmoUV78ODjtbCXJOy0xD/1eUfl4qYaQcLlU8QKH0q0pmS2yI1ZxfLb1iXwEvzG+O93sHLO86cwePc7In5At0GEP5bfovNe96rs/Z+4E3+lj9DAXxXBrqp8gFOiZm1AJpZd/7urbq7tL5ZN+41rHviHokC7Cd4+Std2ZAYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1v5GwCZWZUlerfQgqhBiPkGDOkoHPMT9jmQT7eja94=;
 b=MJ2tUieWEBV7c2h/3zs7fWf+b3XgNRYqccPFRCzmrhTzls4tsRFXWYa9vMrTphA1R0u6z2PT3v8anjtv57L4ioeAvRX67wuqdaiWY0NAN6qjUwkA7dF3dtuggGjj2hdvtG0A39seHV9NdXeihBr/f3EApng15QAjl7z9a2QPdP2XR4F/vtWY/VmPiHFdDQd7vG0wnVYPvky9NU1dOpjEdkg5OUMc4tGbySDy/RFO4qOeeP2tDjeLszPFsj/GYTa1gkCfHp+dEXjNW9knSRBoeE+MrdmLIAhMFkk9iNzd2PaerwjoibAH2fN7zrrLmjtuT+gLqB0yjPb7lccqPFFxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1v5GwCZWZUlerfQgqhBiPkGDOkoHPMT9jmQT7eja94=;
 b=d9bt7jZmXsgklG887yrCVXXSAxoMC20/8Nt7IQMsaKoVqLbM+YAQGK4Ae/M8MdvDEivnjjYeZlPsXyozOKa3V7RFxS9JjQzIbUhMQWWcN5pgC8GoklYKocwg9VOhnipyRRboEMjIm6TCTCs24e2yV4FrmtptvEAFeU14RMB1PNA=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by IA3PR10MB8468.namprd10.prod.outlook.com (2603:10b6:208:583::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 09:17:21 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 09:17:21 +0000
Date: Mon, 21 Apr 2025 18:17:15 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Rientjes <rientjes@google.com>
Cc: Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [patch] mm, slab: show total unreclaimable slab footprint on oom
Message-ID: <aAYNG_Fp18Pn4_TD@harry>
References: <93c5936a-fbcf-20a5-af1d-bee840e18d39@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93c5936a-fbcf-20a5-af1d-bee840e18d39@google.com>
X-ClientProxiedBy: SL2P216CA0125.KORP216.PROD.OUTLOOK.COM (2603:1096:101::22)
 To CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|IA3PR10MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c28a23-954c-4ee9-86ec-08dd80b551ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?StULhTuW58yPRU5/T1v7nYdmiLCdiC0aD9gct88NiN4E3WU2lcZ//19nT8qp?=
 =?us-ascii?Q?LKEYsJCvKilnCzP2hVAR42NWbGKsAc9xtnwQhHKG1etnBA6Rbyu6RhU6D65s?=
 =?us-ascii?Q?HSwY4URYGE4jXdgqxdLcoM50gL6k25MtKB5VPKqVcj5a6iBXDb3/viF8PTU1?=
 =?us-ascii?Q?J09ds2d8PlPjIBTRfoetWGq7D6sAn2Pk+a84MvWqq8fSasEmA5rW1hSae6TA?=
 =?us-ascii?Q?i84g03gKX9dWgKGl1dk93CdYEeLBl0Yux6Mf/gJuDwFHebLYpXBJNAM9qNZw?=
 =?us-ascii?Q?pGbRhCw4SQq6KltiHWl/O1DL5wBEllS5Vq8vzYlcZPzXj/5L2fGKY6SWP9uV?=
 =?us-ascii?Q?olJpfSc/d6HtuIUdnQ6BVjLilffBeVWKa99SaT60Njc1+FaxcrHxQy/GGlON?=
 =?us-ascii?Q?mQzs0cyrUK9cIs7NokeffBaataZMp8C1zjUKl8V7tdyn2gvB3KKM/0OKGUrL?=
 =?us-ascii?Q?3sMXR5GN82Opxvi2hi81AYZvtN2StSHSwUJk/Z2cMyLMrPfe39nfx8ByowHm?=
 =?us-ascii?Q?lQH/GXu3O2RaLN4vTU1QYL9t+ZRl2vCRZzZI7HiBeDRgcrDxzck/8UgS1/tI?=
 =?us-ascii?Q?iM/gdu5EC0VfypUsQq+hGu/XFWZK3sGXTiL9DCItxgAXnZZFUYxEjfNDsPnX?=
 =?us-ascii?Q?ckITTvyFZJoEdWaKTACvoFyekxlyG2X7Tuzwo7aNs9hzX8MF/2WjqPK0tTqr?=
 =?us-ascii?Q?HNsoXaRAeEIxIRw9zbCq9+MGvoccP7IWcFDi5VKy3X3XLfN29oERLPEK+ina?=
 =?us-ascii?Q?t1ISfnVjdGiNAh1xn5iBOiKvOTjUYVVy72esJUHiIXgTASCtxt1Zgm4Iazwe?=
 =?us-ascii?Q?5VvKQz6aPSLllPl9DfF9R1VhzdTCGDzyMP2/1Fh7CeQL53ZK1PhMJT65ga8a?=
 =?us-ascii?Q?0vQPSDv0yWklMCUzKqyUYNp8GryqhHW/hrhJfWJf0FtXGSWYjk7+9tNB/zFh?=
 =?us-ascii?Q?M+UHVGH/BcQGVO1W++ElyXqbzlif+oahyNju/TlRWdkCyrguwA85RQGYgEPe?=
 =?us-ascii?Q?qkVothFl8DooF4YQqC/zz+J7NhgZ5eIIAs92sozaBEHQNuWzV2rOCMaJPqvF?=
 =?us-ascii?Q?QbV62fggOUb0P7uCf77c1+pWWqdGMxp+CR9e/mxKzgudfIdjBqeqqE5oaaFa?=
 =?us-ascii?Q?h4Nl4L50ChcwUpg/5mllH9ib793YQLiBkRODW7FRupG51XNxhpN4hdjJiXL2?=
 =?us-ascii?Q?nxCiLe58jk0bkyKpmka7WLWios6iuFdoxM7tJfIllkwd4K/RvqHiLh3e3Hnr?=
 =?us-ascii?Q?DbPKIq+FItrw8kkUIqIv3Yc28VtstFH8NUHKP32CoBALGm4hAkrujBVAYwis?=
 =?us-ascii?Q?XEOdGP4Fj+ysr6oIxeiN7i4/1eVanYIhuPZLKqsZxt93UfBgKl7Z9/zotBwT?=
 =?us-ascii?Q?A5vDO+F3uC6Nm+sc46wI7Q8ihXf3nyOmxXa9zjHI4221/IYxwMmUiIjiDp0C?=
 =?us-ascii?Q?UCGCYfex04g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6dU3kvmLDluo6NX4cKybyCJb6l3vxq+CoozDWw5b2njV31sX9DSoSWTfcKqm?=
 =?us-ascii?Q?iT+vFrLrZXqMoF0uPooxFeCw+X9gaEkpH89NmvLBEATdYJ98MZjxwNy1HlML?=
 =?us-ascii?Q?Dtxx+CZ0tV+gUZs1eFDEBp9lmkLPOM0KOZjp0a0zhZNqe4HYAuYxiCgWaxhv?=
 =?us-ascii?Q?tSZwegE62I8btHFhpbf/w2rwiKxc+rKQwE9ga7XkRv1yvXA/u37ln2GCJWFM?=
 =?us-ascii?Q?LU7dXa9uE0KRiW6RJRaZwLEXwX8kSBLcGyL17Krs42HpUR3QglkKQ7qHE437?=
 =?us-ascii?Q?H7836HgEiDXpnoc85ctgvWCgn0jBxetF1wAImEv6XTxsBUaAuuv+QiXsMFyz?=
 =?us-ascii?Q?216C2FcmfQY6ECb7/NAp3MntoLZcMApNTJ8Rm9mcJRcfco9Vp729zWo4WOZk?=
 =?us-ascii?Q?9jrmXAgTIdF/OkFP8LIprn9MAgR1K5zGl82I2Tt/vja59FRN1WfRsLTmw9M2?=
 =?us-ascii?Q?bOaIlXWaTPVJWl1+/79ohi0r7pvfg0Ydla1mXzneLX1AgIqL7CfM5Fid79fC?=
 =?us-ascii?Q?SXk6kD69e4jAPn0Fya6msXjFZza6kRjj5NO57eAflMBLRuKZrd1nUZRWiI5v?=
 =?us-ascii?Q?Vc0QwUMtPKZRS4SAWnUFMhzStnHFkYQC/jeDPwlzwlGZTiQyJdXZtvM+xRMW?=
 =?us-ascii?Q?lxRbKin6EUr93KnS/i2hEOaTqGSd6NCZJa/JqEZ2r4cgwfV8U5xhFEQPQcYu?=
 =?us-ascii?Q?SZfCZKea30Qk7lfsWtG6JfyVZFpJ2/56SjRW78MEYcbQPDCfnuhXPP4ryX+y?=
 =?us-ascii?Q?oUQgxdr58fFHAPWmJGXAcU34K3LuHhDgE8DZfE6Jrm8w5yZt68gZsQ1QucTI?=
 =?us-ascii?Q?hT55zMshsp92dTC2tfqKUfh2xzzqDU+cu0njIUf67gkTy9WKPkkNwZzXlM0x?=
 =?us-ascii?Q?FfrPLZRe6NFWQsH5H4GSH4R8r0XI5vmrK1f2O0nh87W8oejmGZbXj0v5TzUM?=
 =?us-ascii?Q?QYZwmmfCgd4BUcdlMbEYaFOQ9eqIvtJ/Gu3IRaVDPOKkrDGC8SVoXl6FWyEa?=
 =?us-ascii?Q?XpXnxZEdjeS7gps9lxNRia62MSRbKGoJZZwztQRxXEAQA3Rz7Er+YfsNKW7M?=
 =?us-ascii?Q?7NL4oT5+WBFAWK7XNtb3HHQo20HPrwKWqSXXYJcKCrJ2GjF2mgA8RCsEIJUt?=
 =?us-ascii?Q?gY7CmthbLJj2cUQExKZCv455k8AwUVAHXx7NkUV0OLNHhxc0ANxv+8g3V0Y2?=
 =?us-ascii?Q?sYSO2XulOsDSzBH3Ux/nYhOvqD2owAjEOPLcgR8zGCMot11DMrbED76GIz3R?=
 =?us-ascii?Q?CNS1KCoyAvM4XYQqnsG94+RVM9sRizGpdxODdHadenXnNGM5foHPTBETnkKB?=
 =?us-ascii?Q?b1QyXIw6gVPd09xkGPin6RTPouImCGU2jF3t4bl5EN2Fm+hOPiLa8RNn+I7+?=
 =?us-ascii?Q?EnccjVID3iFF+MQEGMmsTXdOjzfLIAe1DBT4urzUvpn6CL74OMtd2KqZvFZq?=
 =?us-ascii?Q?X74Mog9yKhZhi+tImFingWm0N27G3G3/SBox4pdmwnGip5C4x0A60kOltV/l?=
 =?us-ascii?Q?IbMvYy/jPo1X4LwTsRPKpXEPe4EfUNNtna206MYl/5VMYdAvbweQRrwFk8ir?=
 =?us-ascii?Q?cymgb5C426Dmvr1c1yDMFEE3wMM63ltWBL3ALk+n?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UV7PESP8A4roqs+hmZWJN7lvKhYMtyHQgslIGvzX5CJTF4RbJ/s651T9Mj2zMYSpBaaMFRL/Lx7FQnpECw+5akTumR7aejr0lD2XQgCBbKT0WsHjKnFRMnLgP01nA/PauRmkgxeY1yCFLy+IokaTQ5qtiV8Z4lZraUiZipml6JLh7F91Gnyb5GRcv8JiEoDs0/KJaBCiNTAj2DAbhrjEknnTnKYvF78x4MId/YZut0nNtoSotxC65taccHRvhXpowx0t2SqCdajmMG4jGrs0s72nWsHseo+ZZJLfAskulAl+Z/ESHJ8Db+XFh7s94z3/BoGfhrwx1WFjyidkmuVlK8wmshOJ/gwKqboif0Q4SnkLp/QlAx+TjQBKfd9iDZcp4HrL9oStcQM5P6+x9Im9BlHho5Ds0423Syvuk3Yo7x/9p5G1LL3gTC6/0a/QOsocXspff1QVGg4ePK4McAoS/fJZa4aStF4b7DaHXGoBtLeNNgVm9rhiMRfy8e/3T6kcz7XStkSTa9vo8Xc0nfvauCzebBPJjoWRarqM0gX8O/csGvFwkkfuvi3oDyxMahiDuYVJNpC7//O7bprdKPd7XivHcooTMWsCrjwM4lTUBgY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c28a23-954c-4ee9-86ec-08dd80b551ea
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:17:21.1922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9N74kMr4wkbsyn05MXLE1kG1NCEUYd3XR2/Pbw6PWZFV0cPEaMAyFaGs92ddRxkNIx/yM8TS9ZENssgBE5vXKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8468
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504210071
X-Proofpoint-GUID: XHCn2YsXL9g1ddG2SJnsNkFeIdhxWMsK
X-Proofpoint-ORIG-GUID: XHCn2YsXL9g1ddG2SJnsNkFeIdhxWMsK

On Sat, Apr 19, 2025 at 07:26:11PM -0700, David Rientjes wrote:
> When there is a large amount of unreclaimable slab memory in use at the
> time of oom kill, what really matters is the memory footprint that it
> consumes rather than only the number of active and total objects.
>
> Include the memory footprint in the kernel log for debugging.
>
> This may overestimate the amount of memory since slab pages may not be
> all of the same order, but it gives a useful upper bound for
> understanding where all the memory is going similar to slabinfo.
>
> At the same time, align the fields for some lengthy slab cache names such
> as fsnotify_mark_connector.
> 
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---

Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

By the way would it overkill to maintain a slab usage counter per
kmem_cache_node (Yes. one more atomic in allocate_slab()/discard_slab())
Or it doesn't need to be that accurate?

-- 
Cheers,
Harry / Hyeonggon

>  mm/slab_common.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1145,7 +1145,7 @@ void dump_unreclaimable_slab(void)
>  	}
>  
>  	pr_info("Unreclaimable slab info:\n");
> -	pr_info("Name                      Used          Total\n");
> +	pr_info("Name                            Active_objs   Total_objs       Memory\n");
>  
>  	list_for_each_entry(s, &slab_caches, list) {
>  		if (s->flags & SLAB_RECLAIM_ACCOUNT)
> @@ -1154,9 +1154,10 @@ void dump_unreclaimable_slab(void)
>  		get_slabinfo(s, &sinfo);
>  
>  		if (sinfo.num_objs > 0)
> -			pr_info("%-17s %10luKB %10luKB\n", s->name,
> -				(sinfo.active_objs * s->size) / 1024,
> -				(sinfo.num_objs * s->size) / 1024);
> +			pr_info("%-30s %10luKB %10luKB %10luKB\n", s->name,
> +				(sinfo.active_objs * s->size) >> 10,
> +				(sinfo.num_objs * s->size) >> 10,
> +				sinfo.num_slabs << (sinfo.cache_order + PAGE_SHIFT - 10));
>  	}
>  	mutex_unlock(&slab_mutex);
>  }
