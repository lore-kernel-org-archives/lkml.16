Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C13928EC1C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189520; cv=fail; b=QlwIyzDlV7K/HU95QzkbssZDANgzZEKWAK1N3ib6ltgrnkaiK0NEnXpyFSiI5xP/czkFLTJx7xoQFADgyyl8xe+fxsCyqAVm23ebgWUMC/uLrQpqhYG2zYkKQRuemGvQFeZVJnjqJBhUMCv9eWAtiAjHZ6e+/Cxy6XqDqHYHvmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189520; c=relaxed/simple;
	bh=518FEKGov1F+5SMXTW4dgZ+RoalQNw9u8MH+qQjdV94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QfuasPrQaTxbCxsfjLerJ789zzDjn1uVBRI3H3nNlMkBIIFcu4262vwZL2gQjI181bhaQm0yOPCY1m+dOmf7qTZvQx8x9+cVtu9htlhNRLFjM7+W1caPKPhNW8toy2zpIi5RLwVHP2GBvo1H0pvJHDg9kSzke7PsaNS5HTAOXq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qOs2VDHN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DVNgyOXd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qOs2VDHN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DVNgyOXd"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HHtZwC000894;
	Tue, 17 Jun 2025 19:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mlFIVMyuvlPHhHds0V
	yBMyOWXilXMyYOQG+FbVgEzAA=; b=qOs2VDHN76tLIQD/ztqQsLFwas+3O082PC
	EC2JsTKjPClRIwJbNWMTY7BPzmoBq9If0u2VvSMQlXyXvwOAYx2NyJPkIMuf5j5T
	is70w9r6HLI6m/88kHpwuGK0/aEOBQoSOqT5/tmuUEpoe2V1YUJ1hgn4m6in73Wh
	p7QyuEUKC4jzyTLkW7ePgRwClQ2AGZmmmRuyAQR07fg5xI9OGW/sN7Yno9e/xHIh
	aJLccxTQGVhmv0zfzeeu7fWiGYSzPJZG+tHT4VzY7strcGbgexNzpsHwtg4cbQPh
	CilcMR9FPM9qjLqVfwQHMP1YzkasLfn1WK7B+U+z7Lnic0AhQ+MQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914ep87w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 19:45:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HJ55r6034458;
	Tue, 17 Jun 2025 19:45:06 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh9f8sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 19:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMfsKqr9voLr6ZlxxjxvSX1s4UrvCOpjch6c2Hqiw/ZLuf4VD3lCW65Uj3Cj6EqesQhXwAXYNu0nIz8QZigORynuPl+E5XrTXPKfUy/ckBU+SGn6X/Wr+tMV6Rto81NOtTGAMXUtWJYgrjIshQHmMKefdR1sF387QwRUOKow1tVkVFQY2nKawaQGpCMJ20feLzA4LEPYKTOks1Ezj0JwXTy0tO+5jFaxj4BV9J6H85scu62Yhsm6GJRJvDXU1IqRbarZKnJRPND8OlaiXFM1rhMFnCLX+kFY7uy/oagKo2d610mHOQEGv1ai/3RnTOcbxH/G8UKFsoYD5IFD/8RDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlFIVMyuvlPHhHds0VyBMyOWXilXMyYOQG+FbVgEzAA=;
 b=ZfOQ0oAQQK9uMTLglTgag28zRlIL5d45fzP2dRfy8iL9zsK4gSqJQU9zC0UC1drQrxAOUDidybGD/x56Ep6jvJkLNxI/cwaxqjD+Jg6cgMXSfPL8RIfVn2SmIM/BRZVRdfmyoaheClvobMm/vvanyGL15VO+KpFKfZK0CPnfh783PeVai/VvftdHUu7vfNcISOp7oPNyZiyoBZ/6jiU5G7PiftnnDML/RKnV048H3GSEJiYjCbbOzFaO3NOCYPI5BQtdGJj5T1JEdCoHEXnauqt3+Lm08V/u5BYgD30ip/wUyuXt3LGqlGW10F6d+w6eXDc857pOaFfkLDVeQI9cbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlFIVMyuvlPHhHds0VyBMyOWXilXMyYOQG+FbVgEzAA=;
 b=DVNgyOXdGe5O344PxfHbwttCMbAIYRYE0wnVtnTz/hr145wGqt26AzIyY1NsDbjxbiMYbMYPx6vNGkmoOTUDOYID+1QRNbCjAHSMmGiDmNZoB2DeMfOKX4nn/EHVgT2GtJTu3oiPjbwBL6gNmlrESHOLnB4XfMCd1B1bCIousvA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL3PR10MB6018.namprd10.prod.outlook.com (2603:10b6:208:3b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 19:45:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 19:45:03 +0000
Date: Tue, 17 Jun 2025 20:45:00 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+52343d77314d6c0447fe@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] WARNING: bad unlock balance in move_pgt_entry
Message-ID: <3925be8e-2aad-49c1-9a50-492749ff4329@lucifer.local>
References: <68512333.a70a0220.395abc.0205.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68512333.a70a0220.395abc.0205.GAE@google.com>
X-ClientProxiedBy: LO4P123CA0472.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL3PR10MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: eeaa8047-75cb-4bbb-1d70-08ddadd773f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a9/t4UPjFESWHZr8boh1VB6syLdVYC3Yp4wof8kXi0V1R3Bfa4zxOmUo3xyj?=
 =?us-ascii?Q?It63EAt5RC5fIIWzaMnl5h0LSHC0FB0Hi2WnOaHkaX8mz8AAo5DicC0akOXC?=
 =?us-ascii?Q?IT2tQxmGYMqa4TXJj+xWL6brn3ro7C5dOI/AK3WXcTW8x1ooHCAInj4HAhqg?=
 =?us-ascii?Q?ZzDlUUVH08h+mUs+yNCd27AB/qTNtMc4oAQSFNiRyq1G1Hfyxzsl+FeRoUJz?=
 =?us-ascii?Q?D6WXetsioGDsYX0Uogg2kBdpfQ5bPSxkgRixmxuWFv4lA6gnlNL0NhuETOF4?=
 =?us-ascii?Q?IcaxZOv26wlS/lQ58PL+lNCDnSR61/9vWfvwqkJkwAw8IfDuDcaFlYsGaGq0?=
 =?us-ascii?Q?wXYsUITPoXsgeRoalmNbdCNGsAO3v0y/esp70dzgQBG06QVlVCW+wSQv6aKd?=
 =?us-ascii?Q?Iy2Q5OlNbYeDisuAsHtTGSIBnCLbrnzI85ZjALYPZXDUfI+pAIZWEeEbVIHi?=
 =?us-ascii?Q?P192Y50VJ2pPkSPNyIBqtRrChuBLYG1E+F6NwP3Kb4zEK9imouQwmTpzHS9T?=
 =?us-ascii?Q?KHTjNiJAXlzsIOysgfbq2/ignn6zbkMYMJJnhXpm6PtFcbkS0PsHpUWV/5O+?=
 =?us-ascii?Q?d2rfg3nnlxQ3RMrbciV4BASenwp1IhYIQrwxyvL7DmHqld1gojiwmGFv4fT2?=
 =?us-ascii?Q?7E0Swo6jTRHWzO3VZfyS7IXjVrhwIjwyUxen8ePOanHwLvLHy8EnAJem0C/K?=
 =?us-ascii?Q?rvSfW8NeIeKurEOaeAA4gtukHM3dVUwZAhhIKqFq3XcQv95MRwMJ4hGA0pu2?=
 =?us-ascii?Q?zp+iUhE0yeMRpdozZ0UTvvI45SMOjjjNb2uj7lZYQBHzhylDAYh+oaxPQxPI?=
 =?us-ascii?Q?ejoVbH8Wdykymzy1vcGoFvoAHFu05fpCthJvU5cNjcaOufdHyTv6RDjryYLf?=
 =?us-ascii?Q?tVIKlVmrVV6qHp3EwT85jlUl+kWmXP8cgNAc2O0qkH+c44FR7b4PIhGKLmfo?=
 =?us-ascii?Q?XYN+6f1qckugh83b9iMkvZiuHPHzazJ4clTfH5A3+j4MOEy+WcmeoGW6xXUI?=
 =?us-ascii?Q?fNW04vWQvcXId8YBAsLuXlNEIDlHLjfg8CImNaVyE8Mt1pdNMJqJzMb+LN8q?=
 =?us-ascii?Q?o4W0QtZI1yvPwIKIcD57N6yn7AIRL/Er+p7WAJNx8yDr9RlCJuXDvPOFcD4k?=
 =?us-ascii?Q?mvbWbGv6iiSpFMD0aPeUETKdSRrGIG/d55fyyUoPDWZeJ4fkpUZKFsjadhbm?=
 =?us-ascii?Q?6dQNVSP1HnuM8DRENddi932Xc+38twCa+QhmObEy2oQElXADiSb3WEtDCjZ1?=
 =?us-ascii?Q?9z6LqAujxxp0iHiZ56IeIRJIrbnM2Sno9zM7daFxKK0wcSJAIcyLMspCfHjk?=
 =?us-ascii?Q?moXcNqFrZV1bubBUHLkZmL5UatbKJckmyf7h43uAi+FdgER2pjabPu/CMyVE?=
 =?us-ascii?Q?c5jmnknrlWTuEEfGIyMOZtffqhra?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JUuYs+/hmB0Yd1k386tSPQFoKOjM79q4aMRkPsrC+R3Pq6SozuxuqylJgC66?=
 =?us-ascii?Q?NXoUMSen+YYpZ/pMTpKB+pDQFsvOP8Tg7sCypYEnSjPd2pe3D+UQSquzYRvf?=
 =?us-ascii?Q?uLciURxtsan9Z1oSaDqGtQRMlOfiO/auNulsxaeGByTN57koHUSBEa1XHX0G?=
 =?us-ascii?Q?fJiJPtecj5mh2zwynv5hV6ua9n6qM3C+edsGh5FZOdqWsZcxsOwke1tbsE8S?=
 =?us-ascii?Q?dUzoy6zm+BL2x1bedDf7oWPP9WFxiETTQhpEyqm+lBfUm1Tyun0KO6CJLMZX?=
 =?us-ascii?Q?rTCQN/zltUjrOeHdijCqfJKz77TNgQ89vCQ1dZ2qEWwjbDgCmkBXMhNTT/Uh?=
 =?us-ascii?Q?aQ6avO2h30jNvJAVt8IK8ihEuqtXTOuBkXdwMMhUmmOHiuJ3MaE2kefw1r5h?=
 =?us-ascii?Q?URlCuvXN98H0JNvdLVQMYWRBhVSs+aS9eE5vCTTdKox1Hjl/OP/uyUCaNyDG?=
 =?us-ascii?Q?8012Jiz3XdSniOldSFMAAquZda38FdGMeOaDEzQvbZbdibSv/SbVrDJg5CGt?=
 =?us-ascii?Q?akuXme24oPJ+mQY65XqvYqr4pVEqaiyQtDjBYwhmbYS4b/hazVB4Bo0KtXvc?=
 =?us-ascii?Q?LZZeqqevImeLhmdtqxd0ClZRHgcXU647udkIx3Mg82M3cg5rpMd5WWKPYnKy?=
 =?us-ascii?Q?Xvd+8Clyu/X5mRGZ5g9TeTX5fzfyAzS7ZiAgXRh/WmmPWACjq91He8vI8mrt?=
 =?us-ascii?Q?PanEcMzIqG56w8+woB8NyBVKoIlGD1qn8aeMqmAbL+cbOBS8vud7NLAETdw2?=
 =?us-ascii?Q?LetvyI7naIVw7v27MwinLLVyDFAHUmXNsze7D2IYzLLyL9ebj+FxhubtSVo3?=
 =?us-ascii?Q?hSniJu+P2uGl1YC6akbenEoL2/J1jUKPPxf7WTvxLzcFATG5wV0JuWnGgrJK?=
 =?us-ascii?Q?XD8LvFaMn7xKVafYXEUZliVlJ2N04KaxrcXisIWDxbU9l/Jf+ePEqcZSvszH?=
 =?us-ascii?Q?ErrbYVCudP6L8q6FB0ooZpRLFBDys9VglHe6dhJTDSL+elf3tvfHxUY7RJaE?=
 =?us-ascii?Q?Rd/BPEqtgazNU0bvd55hOpanO30FBttKcOqYazTEvwGzKaMMeKjdBeGb423q?=
 =?us-ascii?Q?iOojtXXA6tqB0Ci284m9M2L8Aq3nOdL8so1gMUHLDk8WOQ4btgr8msEuVzCV?=
 =?us-ascii?Q?Wx1Z8k60lPPlDs2MDF1zXXwfV6gmto2UEJO0G8ekgiZo2xTyDhjMnsI/dnRp?=
 =?us-ascii?Q?6ouAOq2zKFhHfOqZkx19t6DnY+fh+mSsxHqm9Hala2uu7L+WmE6oJk0/0thL?=
 =?us-ascii?Q?j2q/jO6rhkYaHZUVDEvutZXtHwiAyPc/JQSpbc5roCdMScVdh61sJ29XAojM?=
 =?us-ascii?Q?oMnqcc6zl8qTuhAY7GpmCMoUCmIc6PzWLZd8+3NUkNjvnUoqf+oHBVdjAbZk?=
 =?us-ascii?Q?jZSFaQ++Knb3JDBYPasem48URYpI3p+1nskj3h477qmPKmzjYzJWG8/QGRM8?=
 =?us-ascii?Q?gykVpSul7Cjfm+zYTulyLRm2aR9d84MedTFfbn8RY5+voaY/RqKUBvzCSTKm?=
 =?us-ascii?Q?7ayzxgPOXeAtKjSBThURf/uaduIowRB10zeKjVkG+y94gkeAZqVf9vNtPwaN?=
 =?us-ascii?Q?kitiMpaZSPtMvq+m50L/RmMgHM5+O+r128TpYjAGQhMwhBZWo10+dw+ZjJL+?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UWbd7eLBbgEpUeJ0Qjic6/iKgfu5R0UfQFNfKQLdqgAutByLd83PCVhaIBEQtSLv60zj1BmtA9x3XwCedUNkUtKZmQmlf4Ox7bueIiJ1itjXaC1UnIowmyC/6uwEXz+rij1qUsi7mT4i2SKMkLGvRKqZGYgQnkIFtMUPu/iziexKLwupSd4cke6MC/EmxdOaqGTFfuRBzgrXb6GHllhp9YN0Z/hbQrWh76kDZi02x+V1bvdnc6EjjTiYkaJtbKSCyvWVwM00zL30HSZYcMdUSeeggqHi7HWqcc21N2YS5hnVUSni81n2tK3sd6SpCDXfRU1Gpdk+ydKyN/ZTKtBzrpnVfeZk6DWFUC1ni0sZUI2Lp6DJb5CMUPRduI0m7CGQWgVO2J3nP+D935jvo5x+qK4pQ+5kDSRTBUCDJfC7eXb896gyzW3xf0A+wytIA599uc+2fF7uTz0L1ohuuSzr9b9pp55fCW5cXyGh0vopI6HR5O7Pf5zleVW4FmwbCUw8qmFkxoHqr71V228H0KQ2uSW90oRwqaPoTzgCwXbHuPApI02W7TppcTnBKOvqx0SeqqBt5DWygkmeBhFVH7UPkaSJcRR3neDq6Wy+hJTgs5o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaa8047-75cb-4bbb-1d70-08ddadd773f8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 19:45:03.2616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kH3PL8AdCp82fQ2HPyJgkshA/GavT4MMSLmYc67TL2SJQMknEZtgOkTXzFniwLzvnOGRt99dAu1BW8UrWyR2BBzurTrG/HbktHIyrGWAxk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6018
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170159
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1OSBTYWx0ZWRfX1Qzp6tPLMOlG 7dLG+yGcjFpWYo4X/BqjnCNERaTKI/miTSf4j2vhHs0QKIoPFJ6913wHsAQJExZUGy81gdtSiX3 KEVEJ/q5gyJtytFtmlYNHju7hQAhiqVj6dDEP7j4uQ7o80iAef5/z5iKuN0zyTW12h8Il32uoBc
 T0Zt8TzumjGFIp//tBkEltW74PCGesK1JO19mnxagojm60REq4Pnn+UjP3+Tm+b/Zlvs1j+awIM 36X6dvbFqkla40LJqs3F7gtDhY779vvt4zZOQ32LDggkX/jNN7qXX/v6F9PINkQzwOaK9RXLp4G 9i1xaHYAW/vSQ1Pm/nhopN6IPC/pmZaO2mIXzgmKSvIUYVOd4bOxPPpBXozXlUlc5X4knMnIsTm
 YQcX6YHUtiBRSMb0fQuEdff7qMkOQnAr85GxhNkh0nByrbRXSdHE1fsJLFTy+nCyKFqQBkgf
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=6851c5c3 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=edf1wS77AAAA:8 a=3g80flMcAAAA:8 a=oHvirCaBAAAA:8 a=hSkVLCK3AAAA:8 a=4RBUngkUAAAA:8 a=HinhdCq5Qm3Aoo8JcR0A:9 a=BhMdqm2Wqc4Q2JL7t0yJfBCtM/Y=:19
 a=CjuIK1q_8ugA:10 a=vVHabExCe68A:10 a=slFVYn995OdndYK6izCD:22 a=DcSpbTIhAlouE1Uv7lRv:22 a=3urWGuTZa-U-TZ_dHwj2:22 a=cQPPKAXgyycSBL8etih5:22 a=_sbA2Q-Kp09kWB8D3iXc:22
X-Proofpoint-GUID: fA50c9AMaf2Om3s-YKuWrzjsT-jqGi8t
X-Proofpoint-ORIG-GUID: fA50c9AMaf2Om3s-YKuWrzjsT-jqGi8t

On Tue, Jun 17, 2025 at 01:11:31AM -0700, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    050f8ad7b58d Add linux-next specific files for 20250616
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=16389e82580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d2efc7740224b93a
> dashboard link: https://syzkaller.appspot.com/bug?extid=52343d77314d6c0447fe
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11389e82580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16824370580000

Sadly non-repro locally. Seems to need some kind of very specific device setup?

But I can see what this is, a silly bug in move_pgt_entry().

The maybe_take_rmap_locks() check should be moved out of the override check...

I'll send a fix-patch on thread, while there's a lot of ongoing discussion there
this should fix the proximate issue.

Thanks!

>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/49faa18d2f53/disk-050f8ad7.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/7c6f9cd7fe5d/vmlinux-050f8ad7.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/84a08d6403ee/bzImage-050f8ad7.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+52343d77314d6c0447fe@syzkaller.appspotmail.com
>
> =====================================
> WARNING: bad unlock balance detected!
> 6.16.0-rc2-next-20250616-syzkaller #0 Not tainted
> -------------------------------------
> syz-executor359/6969 is trying to release lock (&mapping->i_mmap_rwsem) at:
> [<ffffffff82104277>] i_mmap_unlock_write include/linux/fs.h:557 [inline]
> [<ffffffff82104277>] maybe_drop_rmap_locks mm/mremap.c:197 [inline]
> [<ffffffff82104277>] move_pgt_entry+0xfa7/0x1170 mm/mremap.c:686
> but there are no more locks to release!
>
> other info that might help us debug this:
> 1 lock held by syz-executor359/6969:
>  #0: ffff88802f641760 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
>  #0: ffff88802f641760 (&mm->mmap_lock){++++}-{4:4}, at: do_mremap mm/mremap.c:2371 [inline]
>  #0: ffff88802f641760 (&mm->mmap_lock){++++}-{4:4}, at: __do_sys_mremap mm/mremap.c:2453 [inline]
>  #0: ffff88802f641760 (&mm->mmap_lock){++++}-{4:4}, at: __se_sys_mremap+0x3c0/0xc60 mm/mremap.c:2421
>
> stack backtrace:
> CPU: 1 UID: 0 PID: 6969 Comm: syz-executor359 Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_unlock_imbalance_bug+0xdc/0xf0 kernel/locking/lockdep.c:5301
>  __lock_release kernel/locking/lockdep.c:5540 [inline]
>  lock_release+0x269/0x3e0 kernel/locking/lockdep.c:5892
>  up_write+0x2d/0x420 kernel/locking/rwsem.c:1629
>  i_mmap_unlock_write include/linux/fs.h:557 [inline]
>  maybe_drop_rmap_locks mm/mremap.c:197 [inline]
>  move_pgt_entry+0xfa7/0x1170 mm/mremap.c:686
>  move_page_tables+0xcde/0x2940 mm/mremap.c:1367
>  copy_vma_and_data mm/mremap.c:1807 [inline]
>  move_vma+0xd5e/0x2010 mm/mremap.c:1913
>  mremap_to+0x7e7/0x8b0 mm/mremap.c:2106
>  do_mremap mm/mremap.c:2396 [inline]
>  __do_sys_mremap mm/mremap.c:2453 [inline]
>  __se_sys_mremap+0x8f5/0xc60 mm/mremap.c:2421
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f33da2e43b9
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 11 1d 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f33da273168 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> RAX: ffffffffffffffda RBX: 00007f33da3673f8 RCX: 00007f33da2e43b9
> RDX: 0000000000200000 RSI: 0000000000600600 RDI: 0000200000000000
> RBP: 00007f33da3673f0 R08: 0000200000a00000 R09: 0000000000000000
> R10: 0000000000000003 R11: 0000000000000246 R12: 00007f33da3673fc
> R13: 000000000000006e R14: 00007ffccf0ef660 R15: 00007ffccf0ef748
>  </TASK>
> ------------[ cut here ]------------
> DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magic = 0xffff888033554d00, owner = 0x0, curr 0xffff888033b15a00, list empty
> WARNING: kernel/locking/rwsem.c:1368 at __up_write kernel/locking/rwsem.c:1367 [inline], CPU#1: syz-executor359/6969
> WARNING: kernel/locking/rwsem.c:1368 at up_write+0x3a2/0x420 kernel/locking/rwsem.c:1630, CPU#1: syz-executor359/6969
> Modules linked in:
> CPU: 1 UID: 0 PID: 6969 Comm: syz-executor359 Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> RIP: 0010:__up_write kernel/locking/rwsem.c:1367 [inline]
> RIP: 0010:up_write+0x3a2/0x420 kernel/locking/rwsem.c:1630
> Code: d0 48 c7 c7 60 ee 8a 8b 48 c7 c6 80 f0 8a 8b 48 8b 14 24 4c 89 f1 4d 89 e0 4c 8b 4c 24 08 41 52 e8 23 3b e6 ff 48 83 c4 08 90 <0f> 0b 90 90 e9 6d fd ff ff 48 c7 c1 34 81 a1 8f 80 e1 07 80 c1 03
> RSP: 0018:ffffc9000b2ff498 EFLAGS: 00010282
> RAX: 636aee1c3dfaec00 RBX: ffff888033554d00 RCX: ffff888033b15a00
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000002
> RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
> R10: dffffc0000000000 R11: fffffbfff1bfaa14 R12: 0000000000000000
> R13: ffff888033554d58 R14: ffff888033554d00 R15: 1ffff110066aa9a1
> FS:  00007f33da2736c0(0000) GS:ffff888125d40000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f33da29ba90 CR3: 000000002c068000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  i_mmap_unlock_write include/linux/fs.h:557 [inline]
>  maybe_drop_rmap_locks mm/mremap.c:197 [inline]
>  move_pgt_entry+0xfa7/0x1170 mm/mremap.c:686
>  move_page_tables+0xcde/0x2940 mm/mremap.c:1367
>  copy_vma_and_data mm/mremap.c:1807 [inline]
>  move_vma+0xd5e/0x2010 mm/mremap.c:1913
>  mremap_to+0x7e7/0x8b0 mm/mremap.c:2106
>  do_mremap mm/mremap.c:2396 [inline]
>  __do_sys_mremap mm/mremap.c:2453 [inline]
>  __se_sys_mremap+0x8f5/0xc60 mm/mremap.c:2421
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f33da2e43b9
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 11 1d 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f33da273168 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> RAX: ffffffffffffffda RBX: 00007f33da3673f8 RCX: 00007f33da2e43b9
> RDX: 0000000000200000 RSI: 0000000000600600 RDI: 0000200000000000
> RBP: 00007f33da3673f0 R08: 0000200000a00000 R09: 0000000000000000
> R10: 0000000000000003 R11: 0000000000000246 R12: 00007f33da3673fc
> R13: 000000000000006e R14: 00007ffccf0ef660 R15: 00007ffccf0ef748
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
