Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4FF2080C4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836665; cv=fail; b=FAhYUNxMi7Y631KbibTSV4wggbDa3NIylLnzvwkjwYaHwuZ3e9yP3SHrOfN1ulq7p3ioIs2ggWX+mltvOLbcQlw1xE82g1TZN5KHsyXD9e8QTXuHWJZ6rA296xMKoWpqCSnV+R3L9bNv1vYSHjJSkcxRnAjsNVOPKshlCvCJGM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836665; c=relaxed/simple;
	bh=giDiHvgnwDJKeo0ByME/oHDcPC8Arj3zYFa2DN2lLCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p+CuobkR8Cc4qpzbcKtnmD3bDcC3Oj/R3LfWNtCW7C8CIaf55sd16yHrEA4LVds7TRp4wXBMv56ASCI1DBqLloyDFNZoRQV+uegrqcZjJIkgv5SlyJ39em5ANuAeR1McAzu37C7VSshjKxtbIzaVo7fAOyzS41HoeVygCf+QUcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sVnTzrKP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=APVXIQus; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sVnTzrKP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="APVXIQus"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7QgIA023544;
	Wed, 25 Jun 2025 07:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=giDiHvgnwDJKeo0ByM
	E/oHDcPC8Arj3zYFa2DN2lLCE=; b=sVnTzrKPuHefOBflT2MmhXPneKP1kbdw0N
	lYWk+WvGXr46RtJMp6xGhyUgiloIrH5Bsl6kFF/YBzCNwrEhTS5P0ZR08qjpO7K1
	qtQUNGb4HvuIkwPka2yexnZMO4BTFR4MjGodeFvNz38uCP1mFOErJJL0M0eiQ05D
	wIWecG7gHxxBOlLQjc+WPHpzPPR3kD4bXICHdud/OeT04SN2idUQOXnpVRMEV+iw
	5POgJd3x6K7wEeLlKjUtiR1DYU0elDz+A84VTZeks8771sm6Q5oqqiQFkUo1SByT
	alLk3stqBEKovInjblLex69Ghcnd+YGIe/Jm+4SUcvpA91kta32g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mxq4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:30:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P70d7Q005022;
	Wed, 25 Jun 2025 07:30:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4qfxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:30:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNqeHIK9bLTDZ0MKgcw5z/CoOxgobHcbgKU1y+vz0YnUwDIMDWesqCbTPzBnCr20cE+k3ff0WtmuP62Eu8dxvZlvwpAOaskhQ1/+up564G3HlAi42e/SyWqJJfnLz0qTmGmj/1W0mNfrVsyfCovI2kgS3oQD/WUd9gWoOfgKcFts7mEWdrq53M8RYnxY8VidTfHS2JIqnbNjyzBHmy5w7hduhuh9vBcY9nnJCZRBCyfQrG7bKSkULRd0QCMrHuQOpJhJlwoGlsqGiZ64OdXMhSarXEg/sTI1xe1f8pANZ8l4T+9sr3DHVptZYl9hjzk6NAbo66NF2vOzGKYmaNt00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giDiHvgnwDJKeo0ByME/oHDcPC8Arj3zYFa2DN2lLCE=;
 b=s6fgLiM/c2wkrvytREMprid2wflVR1UB4As6lbD8NyenL2NTd20D0IgN3h3y4ovHxTM84nVKdsmWFtqF7WugP7aG8zujP3TJq+rGqCoHvUUEfhdYL9T5p+BXyGk37eSnUN/pTCNRjy/s0124rECOs0IrDNbxFLvIv/v1cVPrmTMM0dtcTOgDAhh/6CPAOsW2jsuxu+6W9ttiQa+ku99FBURCxbbXwHTeEwVrmoa15Vt4PMXb/ygfsna9DV3mX721vbKrVKDhXOty2S6Bdy4VVdjX5M6jZCQkHi8hW28gv/gbeHBoqJfFLnJLyfwrCXxbh2HYBAeog1I5276ZYxbQrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giDiHvgnwDJKeo0ByME/oHDcPC8Arj3zYFa2DN2lLCE=;
 b=APVXIQusI3AVVOwSgMJxx6dKyAxGBg2Y7JMfJDV9kaa3CsNhAutKakOR8sa2zBvHFBZ2rDTI+uVuAZg7WQj/TJk6rPc7z5xWIq43HlIAb4/ZCDrNpnw9L4BlnCHN+bT1hOvd2rMIutUb7Ytck8RJI0NdcwGh04FO6XA3/3VgoUU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN2PR10MB4334.namprd10.prod.outlook.com (2603:10b6:208:1d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 07:30:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:30:35 +0000
Date: Wed, 25 Jun 2025 08:30:33 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <db757c1f-8666-4a73-ab57-cce83059e95d@lucifer.local>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com>
X-ClientProxiedBy: LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN2PR10MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: 933f2c00-7559-4772-e0fe-08ddb3ba2c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OVgYgdMICIhUbEKPR4S+hR1NVcGT1WZNgNWZNwvasTRllEBwyY0WJ+O6YC2p?=
 =?us-ascii?Q?EZtw0LpUiteMOSNdMkctP3pVABeyLqC1/XFNApRSpeqS6ojyt3aZJIqEacpJ?=
 =?us-ascii?Q?Ss8q+TvVrsQWsdNrQvtVo15YOgn3Yi8gOp3d9Lh3w5wZN3TeiK2YdVFK5hc7?=
 =?us-ascii?Q?uNURwFAZLo50xeKCpAZUY2yu+D1l+nPH5pxCS7WaJGjyvyFJoPO+5uaIdaEj?=
 =?us-ascii?Q?JG0Kqbnwf7rxbPEJ6oMmDNbBK7DdhWqhnISDV9M4IvIj3zUJL4azQM9eCRSw?=
 =?us-ascii?Q?FIc5AdieAcnvKzb68etnqrcKX+UZJxb5feqF2JJABLwjN6VFJLgYcnqkc8NN?=
 =?us-ascii?Q?VeWrk8JhrouIHHBUM2bOOS4xk7v5Xo4V4DXaY+bcsgM2HfeZW7u3hdDSYmvJ?=
 =?us-ascii?Q?eeVeDccXOvyFu1UeZnHRZENlWZLaWt5LqJYBCXAglMQ/tE/eZBgnY3Ki1+Rx?=
 =?us-ascii?Q?DoTryhEvHzjidh43Tdsjr60qyjjeOKH2krhFL8bo1EGlQTsH0FV2zsxlgScF?=
 =?us-ascii?Q?FcBiXTbDk4bJ08KNjQ+PpGBDJDA3S2Hz3gr5Y2dYk487LwyhzNWOVW9whMed?=
 =?us-ascii?Q?nFaKtjimM57K+/xlGgmazXB/J+eH+eF7PAI5wb+y0peCFxsmWyYFiDwFK4/8?=
 =?us-ascii?Q?Xj9Wfo+Q8eFQsMKJpGauftRdN8QrFP5zUBc3S056shGwDYsTrjOVRE/YkOcb?=
 =?us-ascii?Q?DYPiu+rWIypa3jMMCvNdIdUqgcwS0ZWXTIJNN+KQsRUYb0Q+Zm9HlgrocXbV?=
 =?us-ascii?Q?SbYfLKG6PxnoeNyOgcy3tx4cMvJyfjPjyGLiUhGc4zkUrpC6qISih7C89uuR?=
 =?us-ascii?Q?4+TlTzBrTGND5SBL7efzQqlZKD7cXb12U9Kg5L4tosygYq/wIYl/ajgIMxaU?=
 =?us-ascii?Q?OVE2EjVsdugMZbVaE5/SFYqh5s6bAuOrMC/mIaIdAoHVyO7Y87OvTcxBfQMd?=
 =?us-ascii?Q?0IqVpy98lbh7V138Tzb/N6P+K/AyiPgMowxuL07XkJB+CuFs1wQLcLE2kpZI?=
 =?us-ascii?Q?Op8Y2qtxgDSE3E3UzTWLjLag5T7H/un9o1qzdN0DU6eDvSn4o1zeWA3acc3k?=
 =?us-ascii?Q?u3DkMJ8AlRM1XHjyAT58R3TLNp+7pTaJHL7uC60IBsq6iD90yry6POMNaHWN?=
 =?us-ascii?Q?MFpbq9egjin14wNySuaJnv1vPkd+TcxT/Ambf02SngBVl3JDqqCfSQerceVo?=
 =?us-ascii?Q?Bmc416a2mj5s8nVaPAAXL2QXsOSouNcQjN+KKSrTx1UkFccMM72YVUui2WxI?=
 =?us-ascii?Q?00aBY2k9r0QQVxnLagMyzv6zFsQKxFEy3g4sjsh9se7a1IaGDrAp/z8GRX83?=
 =?us-ascii?Q?pAk7j+/HO9kO7pKl4iAXWYs2eQU5k58NqsqevqVApX9Rg8bOrCUhDWOi9KJz?=
 =?us-ascii?Q?3uv933Yi8FLwse7LgrRK+Xj4b1qxBKQzFbJlhJkGja4bXahJ0aFox3smPOcX?=
 =?us-ascii?Q?RHQp0xsqBxI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y04YmUQTu7kq3PosaOhGZGvCpoZQtx/dZIKwjB/WlY8do9D5zv8StNxYtWDM?=
 =?us-ascii?Q?IgX5W6KO+ZiCHNCIYwA3XDSd7rFEcC416qThHCnDx/7r2pXb9vGH0/+vSG+Y?=
 =?us-ascii?Q?sIbmPH/m8c2dXVAPaIkGidkJ4wOinwR2SfBezyEH17abpwERMfpaJQGO4bCM?=
 =?us-ascii?Q?UnyeJO2YlivnI99LVOE9GrUE/9Yk2pXKfFHpVkSoXa2+9gdVenJ3I8sIvucN?=
 =?us-ascii?Q?xiI2FS1+tnhTtg2+lvZiG4O2eApSPBC5qtCVAL7Cnu6LFMjQpsKCGrmYACVb?=
 =?us-ascii?Q?jt59/DI9BMzItzDmxKoKFp6zXYMb56VDj1E6+3VYU2ICw5Juag1JipCcIcAc?=
 =?us-ascii?Q?TxNZzug0Dk/v91leLFzvXSiNjiE5KkRhCRDfjAbBOXz3YwSRi0Xc9hcE+owg?=
 =?us-ascii?Q?gnSJENJT2Wx5m+u56af0VLxmV+6EJ3gYGw21eJ2YTTcYZmB4/YWvsECpoDmr?=
 =?us-ascii?Q?yb8Fe36JhrBa7di0ntpap8f4G9KCGLbFiNUXT2Fjke9bGZMCEUUoznHt+sSd?=
 =?us-ascii?Q?r1gDfCzAHOyVk49KbQWIYoz7sdafiI5h7+M+5Qw9cTXKBJdvetec+rWU7Ciz?=
 =?us-ascii?Q?33Efum3KLtOFZSw7u7ALIdf1pd6Qz+fbo/pBcWpinV0uYlH8vo5gv5Mi6V/W?=
 =?us-ascii?Q?FOwPf13nNMHaGdCuNZIf/1M7pkxcF9rTXMV9FRaQ0W/cGcYBY+Hi6xHE6SvK?=
 =?us-ascii?Q?VR9R3Qzv3cMYprEGHKz6XGu9M1WtJ/dec3bzm0q6YIUFZHDinNyRmw1vrwyz?=
 =?us-ascii?Q?hhbAUmCDujSuCXoiwLY978nNmwd2lS2KpDOn+SVa/Wt3I3zRnCH5ql1MFSaP?=
 =?us-ascii?Q?Zw+NA5WySDNcUTtDGidSNvu/VTw/TEsn2H802xGE2UFx5+k4TG6dlDVqti5i?=
 =?us-ascii?Q?IW/Xsq2dX6JpyuJFlOaClCoTF5/uVEnVtVvZu5pfEYxLPmoT94gAG4pMZ41W?=
 =?us-ascii?Q?nu/ph6tve/znw/+aml/uq1/hytFKXgHUe7StHr5emSqk/wuCOUnXKaY3CB+F?=
 =?us-ascii?Q?LvPxj8IW78WuQz9r3xLepk6EsS7iQjUfPabF3Ug7QQiZI8htEdmKrowoZ8e/?=
 =?us-ascii?Q?+BLeWEnEpVVbdzEVJ/pswBYIL5V6wseoPnrBk8UrBeMWUix5+gFn2W65+GRO?=
 =?us-ascii?Q?hKIsRPuKbp75km4JEWUXpz7sa9AbZ/SfXQHfe7cde2XBFxZj4+4OnXdLUUg3?=
 =?us-ascii?Q?JT0QAiFFRJ8dArqrc2QgU+g6Z7h3gOGdUOAh9D01zObuYBe12F4CGQwX0sK4?=
 =?us-ascii?Q?GAIra6d7aWZOb6PwqLwd81TU7XP2gmgNXmEdhs5lR2pTbDRDiBouhLlrsiiX?=
 =?us-ascii?Q?z8Kx1Yc/2QfSm9u1sr2nPQa5XUOu1SRaDP+al79gNpYh8ldh92FkUTL9GCWG?=
 =?us-ascii?Q?EB9abq+FPjj00ViVE4miAItAk9vY3h/2zklDL84LFe6GSlYoxpWpe2q9I0AD?=
 =?us-ascii?Q?73D8yMIQp3qdZHeAiY1FK1zpxkrzgJQGGn1wojn3ThIl1yfvR6fjJIgNFwlB?=
 =?us-ascii?Q?7cs0czPOmpimaDrhqHkkQCUBSCmY2F3OFKk6zo+MvfTg2kPJTelDoOlVUpaW?=
 =?us-ascii?Q?er3xoTfJmsJuMhnZa5ERnP22Sz9UDzccjXJLu1t6QlaQel9vlYqhjTBuxJsr?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	csqizeIy/EpOeaamiuJlOA3jMcf93FEbdWij1tTSZxbjbEo2ofGwI4pzuEKDJt+xujFyNIy6ER3z2NHqWUIaWXNz1Zd9xV/2PM5bksudRml18fb1lb4lww2hoQSZqVPwo/knPV2/ovRLinxIrY0kjjHfuwCJvL113NEaLLZNPRYtmQMDno2zbZjD0jyOavYUyamOzaPLmGmDO8rDDYxjG9fccg9wxi9QPxohr8ZVME0fEOGPoWy9kqHyvFPpe2btP19rBqfi7XcRuhbcCv1EVjiZmA5Cxgvl1wI+/yD7hdXNayEoUTDf/v+nD4dREHeVsqCKN/TW+RDKjxnWUdEsEs4AKz4bfP17MI7g+XLTm+7qU3dwvpMDM+Ks7qHLRsffiJQOZ7cK2HVLhW65IFmTCw90qIDQD+j7FTmjheOOnLeGXiURaf8ddq8jzGMpStPoHzIhvSg2ZVQVw197ZgBolKyNFTh+z9ZcnPqItQQmYLiKcMJs+EKm7k714rfnVe1KXy2v+JrsOMyhY0/Qp9o5lwzJPgpSmxpm+lbIZHdPJqlbM8JHb7aNSsA5V/nPiRUH8F+Q92Guga0zQd01bdVAk7PwxcOAaYRmRFTG/K7ogTw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933f2c00-7559-4772-e0fe-08ddb3ba2c97
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 07:30:35.0666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDtglmnp8ZyydwcmoDIBtu4gh2OlOe4q904jUvWR9TONtgVaGBiiJYNoqrTv696neyNucWaUt2rJOb0j9+bs3JD8tce60SyAj17LPY2HAJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4334
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=292
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250054
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685ba59e cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=HUZaR8POJHTX_Ta96XIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: CF2jsNWiAZt1SRoji7rzyWis2dML3Wxj
X-Proofpoint-GUID: CF2jsNWiAZt1SRoji7rzyWis2dML3Wxj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1NCBTYWx0ZWRfX/95rHrdjcFkW Ss3Xnz6rikJ65gm058Cnimk3tYtHsfWLrqMKHtQy0toiCpJui8gC3dWcnaHJ/fbRKCjoHeTkoaJ OCr9+yoNpD6N8moEi5QA8gdsQ6xLEg/gmyZufVaP5kKAj5bd+MeNU7VEVju8JZoyWZqtUbHxRW9
 fQ/ASVIwXOaURBNLvXU6oEwIqaPpWpJoUvmBzL+k88d72QaoXV3AHeiGjXMbmpvX7G/PXTsecLF kaaWsq4WLC3R07aHPvkMsrKW6MuCUzWNOfGkgIkluYVGypQIBkwhQdK/FnQ89h2mCf6MfyHxnrm PnWSEpIh4QWFiyoMfp6dpvXQ+KagDLINciQnM73FzPGcLywU/v6IHcEwsYJCj7rVr10Ih9UH0xH
 3RKCfx8EuL9PgyLXqqHFdp369G0dBA5HG0JU4n4ZkmLnuJCybIlO2eOsUdOAMzp7PnFXowJF

On Wed, Jun 25, 2025 at 09:23:31AM +0200, David Hildenbrand wrote:
> Well, one could argue we broke user space (admin settings) when we converted
> "never" to no longer mean "never", but "never by page faults + khugepaged".
> And we did so without updating the documentation.
>
> I finally went back and checked the original discussions and, yes, this was
> deliberate [1].
>
> As so often, we created a mess with THP toggles.

I mean... !!!

>
> Probably best to fixup the "never" documentation, and state that there is no
> way to disable MADV_COLLAPSE anymore.

I disagree on the basis that system administrators will absolutely expect:

# echo never > /sys/kernel/mm/transparent-hugepage/enabled

To disable THP.

I _guarantee_ you that's what nearly everybody except a handful of people will
expect.

If we do decide to not do this series, _please_ can we seriously update the
documentation to be _absolutely crystal clear_ about this.

I will volunteer to do this in this case :)

>
> I agree that if we want a way to disable all of them, we better have a
> "deny" now. ... until someone else breaks that, then we can have a
> "really_never_deny_all" etc. ;)

I really really dislike this. 'Deny' is weaker than 'never'. And now we have to
add even more complexity to the thing.

Sorry but with 'never' we basically chose the strongest possible term.

It would have to be something really horrid like 'never_even_collapse'.

I want to throw up...
