Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D09D19CC1C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952863; cv=fail; b=YWw2Lfupv7ILoXxx0DiX+zzYmWjDhpWIR69jShcUdp+XkuJzBwZEVs1oRNbYlYdpP5VgSWWBdZujMO4XMBnDSkwrRCCOJMtkzM2GJjIxqR8VVp4Vy3fzJ9hVXkvxRdke6gnzqTscIHby9m8RKpVBBtCGi4C2iP9A3CJD5DgW0BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952863; c=relaxed/simple;
	bh=VQ24EQFQnBRYPz3GLqTQ0iWB83ajRXNM5pu6XW1W3LM=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=Rp9o9+rJ1WSs72Wy+3bHdR8/f3Q7WtCrRJ9UxAnu2DHpXHOkPtCVK5QU8xqMH6PFUFoshdZ//CuZZPsul3P9p5MVg8EyaRitgZYD1wnBR9QM8ziZoGmmKpScbqy/9ox18Ur19T9qq0vVQoT3uG67L2HHEGUxtgB1SOWt++1/qms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FJFUOCCV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wPojUlle; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FJFUOCCV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wPojUlle"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517II080031436;
	Fri, 7 Feb 2025 18:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=2KQqPGnS+Q9y80ERSvsQwGAcfd4qlAJ6gOW3kHJ5UCM=; b=
	FJFUOCCVvYUkHG6Dw5OiRdC1R/lpmV/+8czudqkMlzDZV5OLmYVa0I7wXyeqstkt
	w83VQHm3IiH1KXzbnKgYPMyX60TSxxd4wluTQpg2Mp39nmZfm5Ez2aiu3VbzJi+N
	AG74ReW2nlvPN3cgduKnHNnPj5DSmDQ8JbSp3CIPAtdQa8SIiy7sJRz2QYW3Ycc1
	7cM4NBEEkaZUem8Z4mAh5zngI6YEetg6cGVuoyAcTJPP3wZL9ljVvt3rk/ZlKL9E
	5AVHgxz1FkFRqlD5iCdfWjnl4j22YFM6N3BHZFRaZ6ZW687prfm7+IPXp5tOK6dG
	JGNRHMnmkU/9xJEgEB921A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44nqb180ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 18:27:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517H8XnY027835;
	Fri, 7 Feb 2025 18:27:37 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8drv90c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 18:27:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NagkpsTT9HVLYUw9T2gDo2AjggStb+g22KPDJRekovOsp3bXV9XXiBw3rN8iDNsEq/cLvpRZqck5rPaIij4JD5jHZnlGS+GWrA7jL7xSSHiRKJ1trH42GnYoEyeyxnzswV9eSTaO9tx1d3jl+2/cWC3Lsek3WUaqXuGuqZuaTkeLkcxdPDQ+dFpBK10Rae1arAEjknpzgiojIQk7b+mn3ySYGzc3+TbqEGZoCpyogqlIXjmxWhi9TxhhEOifpGOgOrRtmc06B8To8ptQk1iZ+hJBEyc7DKWCmLPIqefYv45Z1P8I5o2zpE7CTS5iMqV9tpZJ+ScpBl+9yFor6KfCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KQqPGnS+Q9y80ERSvsQwGAcfd4qlAJ6gOW3kHJ5UCM=;
 b=kVB8O2u99IkuTUb0U9jZPl3mhheO3XZm8VJG1cMGg1BXUsfRfAg7zpaiDSJwgLZBpGde223EzVlLfixwsbw2jBB5bnAQMj0yqCW/LWhd1D38/yinuShCXBki3I9fkzYCbaTz26GSLxDMcSy/LHCXxEF6mho91RnEdnF4vciAr1FIlvkMl2IVbBS5EZqrjNxYi8dQKeNDtthuEia+TJpB2SaCVhl6/Xgm0RUaulUCJ6Ln6RsE0OdorTozcLTiIy+3SxdACOgP+Slgr2JNSd084eY87EXSeqaLM57P1iAA31Nq4McBrFxZ+GBJAyQNXVTvATA3ULWFn/r2gHdRzAF5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KQqPGnS+Q9y80ERSvsQwGAcfd4qlAJ6gOW3kHJ5UCM=;
 b=wPojUlleabn7M6Q5S12wa2yn6FkbREk9Nk/y02UJJTO/WAPb3uvHNvLQ/6u04Hnes12o7viZmGC7TCj0yeifjGzrz/gp0ZAYk7B674ABCyQ6MH0G6g6g26S+7sglen4tTp8XXxeGuCdrBvTHC8Yf/Kxr0juNOXdUlQx+TXHaJyw=
Received: from DM4PR10MB6719.namprd10.prod.outlook.com (2603:10b6:8:111::19)
 by DM4PR10MB6885.namprd10.prod.outlook.com (2603:10b6:8:103::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.13; Fri, 7 Feb
 2025 18:27:35 +0000
Received: from DM4PR10MB6719.namprd10.prod.outlook.com
 ([fe80::fa1a:d80c:deeb:8258]) by DM4PR10MB6719.namprd10.prod.outlook.com
 ([fe80::fa1a:d80c:deeb:8258%4]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 18:27:35 +0000
Date: Fri, 7 Feb 2025 13:27:18 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org
Subject: [GIT PULL] (ibft) changes for v6.14-rc1
Message-ID: <Z6ZQhs0JFr_6TQzH@char.us.oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FOmKtcSYgC1r6gzk"
Content-Disposition: inline
X-ClientProxiedBy: BL1PR13CA0367.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::12) To DM4PR10MB6719.namprd10.prod.outlook.com
 (2603:10b6:8:111::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6719:EE_|DM4PR10MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecbcfd1-3068-4bff-a768-08dd47a517cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GH6T3fDi40cV4cOHbsvATVEhO8e4ZTjxewzgktlNrOvqMpKhJTtlWVHBFlMn?=
 =?us-ascii?Q?4QBIeqcLF+EwKWIZF/lkUf7tXQx1RH8dC+QJ9Z4b8fXgHhPQC4ZpBOIIZ49U?=
 =?us-ascii?Q?UaIsRof1nX9uqlQttwS9/8omfx+Fzep5npD8Uv54yxP1GVVNfLTqnlb0qoYx?=
 =?us-ascii?Q?Xp8ez+M+NYA/rY5G/IS55Kqg75q9UzmcqY72hPrIknT48SKP1+XA18Sx4rmq?=
 =?us-ascii?Q?rsRR9v0rTGm2lITqdEq9YdDcQXz73njwDnqi4q2s2u71gd5t5IBElW5eRXJv?=
 =?us-ascii?Q?l8iTblvxenQ4EM8cav+gHDdHBYM2wpvsko90oK/rfjw71Wbrj7k7VrwG3nU8?=
 =?us-ascii?Q?k7o+HdTrurgAIDY+vDY5V5kc0TrJvFJOtcv4M3chro8FnpwCo/+5W5B0zw25?=
 =?us-ascii?Q?CcLpQqaAo5g3I6T6h6DyYjFF8FSzCZR/7pbDC8w6KVP5ZkYA7zQolacZEvzQ?=
 =?us-ascii?Q?X6furj15LUUWdZ3grJ3CTLDnDuU3U0XucCL5KmgCjse+DO537ax1Ltm7CJgR?=
 =?us-ascii?Q?LeDKbKDtMRZqVQHFjl+pRrXF1u5mjhQO/aKSrvVKrSAqLILws0cyG5yFCMmu?=
 =?us-ascii?Q?9hE1U5PnVfAobmATuOU1V3RCN0RmuARwCdLmASc6DwqqfM67IPTDQRVpCuQo?=
 =?us-ascii?Q?JxjbqRKJnAENZ/AovFAIiVOAXTbJkgdDmTOJE0lz1IKZiqX677GqZEttA6TE?=
 =?us-ascii?Q?g8BZhMxocXduvsot+UW7xD7sIIRin8gcko73uEKMc8IeGn+IXs72vRUxhGXU?=
 =?us-ascii?Q?BJ/u72MHjTQPW0fS8K05pyyqgz8xXpnlIazAkOXTC7Y6Z+WadzbOEop0T0+h?=
 =?us-ascii?Q?qVj+DQD0/SsbbCpZWSkQdkxloTfL2/RjSX0RXTcIKIMwGWMc5uJ8tYGAkPDE?=
 =?us-ascii?Q?h/i7t4VivJCpqyYqpMctLOzXTjCp0hSz7GVOuU7xTRF/A+1WXD8yduc8ObWD?=
 =?us-ascii?Q?KyzCl5PuBD4WNTaJPxy5Meced/yWsN6IpLSpt7A8UR7IavT/iSHpUubjy9/i?=
 =?us-ascii?Q?hTHhKzhB+HxteqwKAAxH3CK2ZPWeTleEbPRgNrMfhb8LSHjG6RzuQTuAG6aq?=
 =?us-ascii?Q?de6xcu0huH7fEY4oV+kLS7kD8I9V3x9cwdEy+gNw3Tm639FIIeKu7ovqjt4I?=
 =?us-ascii?Q?plSOqJC1I9oeapSil787l0QArVK0HGZohLmnQ77dPHc6TDdXy5eBPNJvXb4p?=
 =?us-ascii?Q?/OUYhgyP03hZOmvywnIucEFqbulWjs+uq6Igjnv77wfOEoU06NrYsjT74jr7?=
 =?us-ascii?Q?/8XBxIOgSvlv3cBNnuQ9DvlOj0F7FUG1Z4DRjPQdhZPSb6Gm9LszQSopUUPE?=
 =?us-ascii?Q?MfQNrL8aTC+vuRqgu26bBwPgIX4uBTm0Y8GdvJi4yGyDO0TViKSL20dshEMm?=
 =?us-ascii?Q?uDzyZO2tGhWTrV+En+fR8/KM/NGu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6719.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uHN/V0y1Yc86ZWLYUocxMSO7WcvHgovzxGmhAvZQYxWgKOT5EYUd+7SNml8B?=
 =?us-ascii?Q?7aqjftBdk9pi7PpHcX0RKmYEiSgmOYEbeeuO8O6M2Yd2P7/5JGcxAGDiL7/j?=
 =?us-ascii?Q?xRLZdHTNIYrTgYFkYfZlReid/PrfvKkseIbldCgQg6qQZE+3CYt8DIK3tJu5?=
 =?us-ascii?Q?hj15vbf8DrtsJlabtSgmVjjLWQbBQj7L4/Fm9znu2eHUDBqMh+/cbyfeYEuL?=
 =?us-ascii?Q?nVu455jsahMc8WjBFqtUhfiqZ9L3yPvqCIAH7/yQiyME5Oyo2L5y7L8wEyXv?=
 =?us-ascii?Q?RXTYaH9aJ3y9oI6gTN9OOOnJnbTmkcjSQc5thF/Gjrxcn/pMDA3DAfsjquhb?=
 =?us-ascii?Q?YymC5yHEbV6oHlCxA8Sp0OVEWPBPEJezjaQ4O163rAWWTtHSv8jjjBpkxRiW?=
 =?us-ascii?Q?tPpNy2iaX6j+DiDLpigfjZ6K5MgGt3JZyBcgfD6OlxN2sgBY9H4ncahRRJgM?=
 =?us-ascii?Q?HgkjFgF4BZHPvEmW4e6x76ef0PdflvrTN1/4qtqg9A0OouKm+EblxAPWQw9W?=
 =?us-ascii?Q?iAjAB/Rcc5FoJA6xCSoGzGwPvzs7gbnd4ogLVHnlVf0fBWf9QBovDPAyIF9t?=
 =?us-ascii?Q?18x1SFDGVUfwcAG3dNFFgiqwFAEic/o4SxoMyjqXAyqt4vzoUKcxJHoDPm2P?=
 =?us-ascii?Q?coRPBwZ6QU5/KMFbozJ/mLawHhnSbBQU6uRQAR8ywuNqj9eRmkfgohcJuVHC?=
 =?us-ascii?Q?hyf6kJHRc1kp5JRaieG7DROebzfOoqDhqj4pn+k1I1Xaotl8wOihVx4TTB9K?=
 =?us-ascii?Q?2iOWdVmGdaqyzkQ8DM6BdFnwvPkMwmY1yTXN7OSb8azwcYKImqFooVKO1Xxp?=
 =?us-ascii?Q?X1ddM2gTyY2UXGGtTUnq7z5mKVGYBRdT5Ho4/8qHm2lCkFnituBIFyrsbkOQ?=
 =?us-ascii?Q?oF/uRzyGpUF5HNaTB+RoOXwTlMfcq1faERsODAgoH150+59zThDu8TXcvKMH?=
 =?us-ascii?Q?I9G7pWCUm2EPEEXilVKFWGP8wijxw2SlcKl3y94aMery8j6e49QHYkYOMaAT?=
 =?us-ascii?Q?Y17EimFoXjKD7Bzwu/RSG9CgbHbviX61CxlzqxBv7yJRVRe2gvCWRnZ3dYHM?=
 =?us-ascii?Q?uiokUfmtbDwdDZh360E+HsP3smo8Rc+Ig9eQFlHijmZaZQr9A80zl9bv1AVh?=
 =?us-ascii?Q?fgwEJJV8Km5w0TT8gqf52lcSxW0J57WO7UZktO8g8wVvAAf6Mb966BKTcyK6?=
 =?us-ascii?Q?JlmgnYRnQSe4opvhw+X7axKQ5/CkYbPrCw8ij06A8cf1ujqU/uhxgiTYrrUl?=
 =?us-ascii?Q?fx5INpwmUbJuLiDsnhiztrA1I1KArm5AfRP8OTQx7HPsKWZ804w189ROQgbs?=
 =?us-ascii?Q?f2trsxJYTWh3Dy/+Hn8bW99ShsrvHXchHMQvhXipq3ObF7lquYqrK+G5jflN?=
 =?us-ascii?Q?wAx2H8osMNftQqvICfYU4/Fra1COtzNr705MXlCjfSXnK+PFFPZt9/cktEwP?=
 =?us-ascii?Q?QXf0HcPPC1WHNqSVzEMQ4OyABxO5E4LADZG0D9eK9+KNyTc9jLrKS+PNNb3w?=
 =?us-ascii?Q?wgYZrcYO/htjcX4zeV8kn3HUvaimjlllzYAluNnFfEZEQCm/ffnqn/wzh95D?=
 =?us-ascii?Q?1b42RBeGT1gx5JbANRXNBqyHL7YERomBMixHpV/20rTnff01RYxNxWKG3mgs?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sPz6IGuBjeEhcdVhJRRJAo6vq2oT5nnRjzhOxdDQees0kg92moE8yujV658ufosYdV5TS+hQG7akjgC9q7IrKDRDJqJHVphDV2A9E+1fuR3H4qUt6z0Ps0IiE7cAmU/gCjnEepNnzI146/UAQI+Cnxw9RYP7OfXJ/Tp0aQHe9S+Abxhs69fU1adkzy+LbmoZwSY+SPiGhZNeS1nhZmfrBhkDZsXeAa5+/u877rF7MoZeAk39qZDSUkvncuSBLxq4FX+kvQyMLVPQdU78tmfCJUfX0Av5yQabZbvpy5ch2vmlGRvLTwrGSiMe6lQcwRJouvOckw0I4pvIHN80TwY2eOajvr8w4mrsYnM50qS4gT++wyWiyFeOrr6M20WOeACbdJBoUjd2nuDXxsJimWd5EMv7fCoA4abgMe93Vu25xuhuhpbkfBDXfRt+F2ysQeoPtRPrTLJvljk62yve4c+/fN0yxB7MMe8xUb2DmFGivHlbAJxfLRkWRgkezVheC8s0weYKlWi7LdPAO+ULMAdm62YyJ9J0B32yRGsX3E8mqlM8vcytB6Ff3FUU6ndkqYo7kfmOiWwHgAayBWwYi/yDFWgj7UI5faUf8Sf+PXr5pwk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecbcfd1-3068-4bff-a768-08dd47a517cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6719.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 18:27:35.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xSAr/reiVQAfwNkdMTjQBO3UTgBJ1TtultNeiauK8LkOf36kZnmrFefOhDpFi48JbBWsUdgJiKHyb0JvEX3Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6885
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070137
X-Proofpoint-GUID: n8JZ1Q79BYd9yBZ_FcQgkW0cyVH_sj0B
X-Proofpoint-ORIG-GUID: n8JZ1Q79BYd9yBZ_FcQgkW0cyVH_sj0B

--FOmKtcSYgC1r6gzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please git pull the following tag:

git pull git://git.kernel.org/pub/scm/linux/kernel/git/konrad/ibft.git stable/for-linus-6.14-rc1-tag

which has two tiny fixes to IBFT code. One for Kconfig and another for
IPv6.

Thank you.

 drivers/firmware/Kconfig      | 2 +-
 drivers/firmware/iscsi_ibft.c | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

Chengen Du (1):
      iscsi_ibft: Fix UBSAN shift-out-of-bounds warning in ibft_attr_show_nic()

Prasad Pandit (1):
      firmware: iscsi_ibft: fix ISCSI_IBFT Kconfig entry


--FOmKtcSYgC1r6gzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQ66yPI/CGXuxfLixUqUOhPHbCb8FAmemUIYACgkQUqUOhPHb
Cb8b0w/9HgVL0rA4vbIOLo6sUYr7msUgXnx85lmhNc8hY6B9HplmyC2Qt6UpTy7v
pf3toOFLnYnjCT8oYv93bFYFhfM8qeA9Hl03SRki7aZhnh59jQCJtrnedaAiqJB0
7nQxV4dD/8n1Ab/WC1FJnQfzp2NsCw3GotwzRbC27/4ZPWcgor20KsU+aPP0IJD2
P2WpfgkvOUeSR0auOC3wuUvMqBofyAnwnbGPKEPKM4GSiZ6WetQatsggVe7tVDzI
5W1zKww0B47aWz7082kd9Ua5eBWN/uogkmHt4Z4jpR3QHLyi9TEfGo5AakvAhI64
idv8AR4GugrQWXGFTXjAtgG+x7ByeHxWeJ82vs3SdobXktLyI+HLo/VfNGYF0KKA
qPVVaVRPjTodCGufYyy0bJnA0Mxhyz9v1zRA+232c9rYUfG43cmaHLw57iqHjoOu
/DRsTcj/ROY0MqPJLq3XH/lIWHUPH6jMNnmhSXwFZunG722hk1nPzrPPO2y5MODK
sWWGrhY9eLII6bW05xZrThypB85oNDRaoy3aUT8yoInaulQziu6d8htrhRXfzB9e
m98nezENgkZAuNHJuDWfrvWSq1vWo5XOFPG488WwMcPGLuA10HLSQaVSQ2zH16hV
dkpD+sEtcSj11GXcfy0+nOByWwVCqH98x3Yug3roj6X0ovnB2ao=
=juGQ
-----END PGP SIGNATURE-----

--FOmKtcSYgC1r6gzk--
