Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5061ACED5;
	Mon,  9 Jun 2025 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481189; cv=fail; b=cDW/tVuqoUqCWoHM2CRxKFE0cjo17ko5Zs0/yGfny22hgSKgGU6nj7tIURkZSvFxOrFneVkvRIwp6nQpo7l+h+ZwHe72EezVYW17cf99OQvLnPyCLuOHkF4WFAZ2v8FoLLiN+2x1c06ADWWJMcq3vTQScYCivZMA9Mkoq2w9QEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481189; c=relaxed/simple;
	bh=EuYkXm4rF8T+I2vTouw3ZtjWr+AGnL5+EnnE2CNjORQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SNRZkmhx4+qSFLRR9u0WV1zn9CYXIIApv6rJALbnwj90Ei7TmRvQX7F0TH+osRtTmbREiip7WiZiD45El08fxOnduqTf8+Zj8SQpkcqI+2dhJUHh4AQeCZAsPj2edqgSGDoP3xQPtN5KQGTueixG4B8F3tZ/s+Kq04ykpQaTIbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BcJ/vOrp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NON/fIbS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BcJ/vOrp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NON/fIbS"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593ieI2017184;
	Mon, 9 Jun 2025 14:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=cFgySoCS5+y7eT4pV7
	d2IJ9AoM2t1D4/Es9euWpv3CU=; b=BcJ/vOrpsXLiOXE0q5QmIAn0spfeMospo+
	k1vKeZFa8CBdLWhrT6i1fpuvAuxq1F61M2Efb1JeCBbxld1LNcrgwOBTkLtoXPTL
	3kTjSmFnnw+zh3JERhDqRp1cHLHKBW/zScT5xglbvycfr+iw02FryPrEYyIISAe/
	h6HSUHtfHZxJjfKvRY0hz/lSc8vyTF+7c+JboGMkkviruBwlTyibqHWGr5pGoptf
	L/t7VemlTyIlk3a13WBg0Vvd4qZ6sYftqqg05G4Us4oClHcdcmhF2789uwkq6cbK
	g1gzqNHlgk6wal1Z6fD3NYLkMFkFwzux2hiQgUqKomxeut/Ik+kA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74tbav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 14:58:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559EHDRT020677;
	Mon, 9 Jun 2025 14:58:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv890dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 14:58:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnYHZZJvT3dhQFiFkqfOaHtkdSm/I/oOGvzOm58CBySHXSR42OyetHsa8AbqMsbaVOH7Nwbp2gsfUDxHao/pg2Icw0eHZ1hxyJuOqi1SuhoI/irUB3QrhdNWg1u33/5aY7DQVf0FuCDma+dC5bn4roStIfjDxH9H1Jt0sDrdLT1MOwGFCqEs+LHTEddvDK0Ce3Wkbp/Mz2VVZkYmK6aYj9H91DrkdUWQ7iqtmyQ0DxzeQcce1L+Ck9vflZQ2Dj4v3odPKw+UQP7B2bMfkHCxtV9fi0jLtmlWeCnEsNHHz5NJ2cEysqbusLE3qphFfigBFk8KWyhF2CQKoo4QfPaOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFgySoCS5+y7eT4pV7d2IJ9AoM2t1D4/Es9euWpv3CU=;
 b=tnBgJZxTzK2lAXeDcbbTCfVZ0BbgdIzTan4aBPK8ZCqIDMJICxFZKdNJ8GvLerldyVswT7GFDVqqAjhVCydaOfWEpVDQG/xOcQ654AIXOtmS79NN2BpQg5zNLhoM68A9bAwdB2xB15viQorc0hMxJ7TaUfVJPN6L2t8BLvLcXV4GhZYCFudtd5ZIZPY4buqg8wgc7gviuaMKqb3YBPsSocUduGg8TPwLY1U6GVhDtYqmOXZ9s55UbGu/SHcLb5pyimiM7taeEwVznxkbe2QuneqaOHZ3sWvgRw4NVXNIXAw2WRBtE49XUOhIYJDl81CYTUKk8kVHdp6eNGgQMtyivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFgySoCS5+y7eT4pV7d2IJ9AoM2t1D4/Es9euWpv3CU=;
 b=NON/fIbSiFBfaNOgLx+oERDJDbTQhEz/Ms4JQMzgi5uzNqGjS161ZUuc9zIhLX1n9gufuzqIHZN1hvxg5A/TX1HRMYStP/sRQL/QHkPwIENraFHEMIrWSXD2bYd8FbuVhSxFHJ0ms6zWFnVzhyQC20YqjwrcO/T5dMWUizf9roo=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SN7PR10MB6521.namprd10.prod.outlook.com (2603:10b6:806:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Mon, 9 Jun
 2025 14:58:56 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:58:56 +0000
Date: Mon, 9 Jun 2025 15:58:54 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: ziy@nvidia.com, Andrew Morton <akpm@linux-foundation.org>,
        david@redhat.com, linux-mm@kvack.org, hannes@cmpxchg.org,
        shakeel.butt@linux.dev, riel@surriel.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        hughd@google.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <4fd6ac70-a2a6-4876-835f-73ba4475ee17@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <063273aa-a852-492a-93da-ba5229f544ca@lucifer.local>
 <8200fd8b-edae-44ab-be47-7dfccab25a24@gmail.com>
 <b8490586-131b-4ce7-8835-aaa5437e3e97@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8490586-131b-4ce7-8835-aaa5437e3e97@gmail.com>
X-ClientProxiedBy: LO4P123CA0276.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::11) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SN7PR10MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8c52dc-7b8f-49ba-f2fc-08dda766283e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nmTCCYI/F/X7uI7MjQz8MKJRaKWZ08d3GIUIinhtNHXUjEQEiJl0dRuK4HjM?=
 =?us-ascii?Q?+j97y7cI3lkyNzCtCm74VyOiOzGTCyuAc3lEv2ws+gKtnR9S27lJ8475+m5S?=
 =?us-ascii?Q?ke/IwO8u877oln8seINDrz1XzRyz6nJBgDeLjUTj1Rb1U9wWJSnsVM1MlWtJ?=
 =?us-ascii?Q?ZwdkXIuGGd/g3DxuLILynMCd+BxvGgrqbhwHjZNfXenRQLQRZLDcRWqRWHn5?=
 =?us-ascii?Q?CDSHf3Ti1eC2J8y3HkuCxPKxEdwA5hUoB+gdK1tHzUEIjlQjBGb0jTbFS/ki?=
 =?us-ascii?Q?x6XLTjxY/6GwLreEAkcueRgG2bsYgdSlCKwtB6UtY1oUrA1euy8uKM2T2Wue?=
 =?us-ascii?Q?t+v5lA6724GpD3IaLJTm91SM+kPZoI9sYgfI+01WMx12XlZzLHJXWNiv1QyI?=
 =?us-ascii?Q?wXGj62vUKZK7uElv72XE5hhlpwZstaBfNUxPGDKw/KnYd9XizKtINVUvDtK0?=
 =?us-ascii?Q?1Spyjr6J7yAG5pbNVpl9XPXhcW2KMHJq5y6gMVHyWXFX5bNtI8eDV24mFHSu?=
 =?us-ascii?Q?jNi41f4eiW3JDWPWmaSEPQMqcMSJlWgn0K1b5ogKKNJvmOgeEQaHsVac6yeD?=
 =?us-ascii?Q?0KVksGLJEijDjf5wZluE1UaspVD5O5reN5s8IIb9W21YcBVm6HiUjk5yn/eZ?=
 =?us-ascii?Q?gYPsFK38Fyb3TQfp6ANIv6+j/O95iuYr98mIW96lFc0CNkWg++ve+C+r6nyF?=
 =?us-ascii?Q?BlYxyQBJZX5pLjBpKj5TJlgKhFFLBomNCc0H0FqVMD1PespFTL5dVZzF1YDP?=
 =?us-ascii?Q?IDRYvzDZcvFGjB93u0D5LFefSLPdBzvCsFMhOVb0pTYhX1Sn0Mt/hWq4x2uH?=
 =?us-ascii?Q?bmKAqfVPxFKVEI5Z5GbIvGZ7VhJQ5PbkYgxwkIjrRzglTPAdaUQveIkBVSfF?=
 =?us-ascii?Q?M6j1w6oj3g+fW3PbzvjAd91CfO+0BLy8bJpcX70H72kUvpa8q0XsI22VnVC/?=
 =?us-ascii?Q?q2P8IM72u7tpaUC3uNJxdpG+O89Arl19EH6eh/Jl+hir5mQXnvWkxo+y01Bm?=
 =?us-ascii?Q?9lBHxh+pveuCfsNab7p4AXQSUpUWEZPI1Fjzc8U/UnmgpEc7mqF6unhiyipz?=
 =?us-ascii?Q?LF5+YIy8BbgKqR4PblkKb4LArOtOo23UI27SXs0ZnsOb8HFrHoWwP5SBeE2A?=
 =?us-ascii?Q?BTL3Y/VijxFC3cT7+jLEFy3O0WxDzWLhPpEIZT1LwDTjFKzAw7/OF4tYDCmM?=
 =?us-ascii?Q?EvLp1nVo43FcNzjcBazwIam48IqFlmCG2NrChoZBR389+p64+MoIQKzEJlG3?=
 =?us-ascii?Q?SKpnUuWBEv+mzgKF4pxi0j9kdPtm79SYvbDCl3armBKrmvzkvOOyPyVNUkYG?=
 =?us-ascii?Q?3ZoDdzypnNp+rZ8Owb6PWwQF/iL8Qqm2P8fznmwVoDok2tabVf/0HCJG7v3B?=
 =?us-ascii?Q?bVCU6mh/biDDzq1kjMQpCqLtMAlqbYhpUutewBBiLKeVJ4uJGzlPQrXD/xQY?=
 =?us-ascii?Q?wsJR8za3KK4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4osrgrjXgictWDBLcWtObmlTBqBtRbHQzXts6JDQWZJgul1USZjzU7HJzODP?=
 =?us-ascii?Q?43CLAENlDHBqjLu63piVcmKKUYStuLUc87tSDA9olHWiZ8vHqofM0uClp/jW?=
 =?us-ascii?Q?v0k9fnk53xCfKbLfKnj3nBrRwvYqT8aNdbI0N8xpEm/6wUpMehjAIkRrrE3V?=
 =?us-ascii?Q?IP7iJ78xYypIBfMCamLEBJl/TBOkqIBjzy2TtA0BMAdLxoyya2s9eTU1qFdw?=
 =?us-ascii?Q?9QCrTFJPDc0R1PB6me40bSY8uGLC5lb+gDkXDkguivqTgSLUi3ib2bmjQaqs?=
 =?us-ascii?Q?UztkqFw1CbJCuE1MeU4ff8UALIEfGQnbNARD0ArdtRzIIakntWZR+hVQb5lb?=
 =?us-ascii?Q?mDzMTL0zuRpaI5SHjRnU4CjF8Ol+V8SqbEWHTafMjqyZm+SHlvpDjBwCvNpi?=
 =?us-ascii?Q?vLXVZapbTimaoNHADIdk6irHdrRTeXDX0wjmqdchSm/0fsG0y17ICl0UPn3D?=
 =?us-ascii?Q?FKVC3+I+gs+icPb6I0ZReMGtyahXcaszDs2maT8kNSAmGBtQsucg1ubWn7E1?=
 =?us-ascii?Q?3fwsfXjjuDtt789Gfr63B4Zn2k3FgTfGJ7U0FRCwFGUPaHrRwCgZWtBhyUVn?=
 =?us-ascii?Q?tog9a+FVX1Iput99UhQ8jZwQa0kMvMCFslkUqXgiP8j3Uhw7akny7HMhz3+T?=
 =?us-ascii?Q?HHxnszCnB4aK9p5eV6q057BJaNZV3peyRC46WbsaH4wWtcf+bAw7wf4jgvp/?=
 =?us-ascii?Q?a0oNCLUPvv8JGvWjulHqBh0uYHb7LYUFd3H1VOUIlDFZJ+wHKb3WBsOQM63T?=
 =?us-ascii?Q?rolNPWmVA1NnWaucXsvPYR6icFdRwCLkxLlsndrhjweU7fkP8WnlYbtqblDz?=
 =?us-ascii?Q?jKS9lz3pVJbrQOqGsyb91KNlupGrmu8rjPKX3EM6zHm+vov2QptfJALTrIil?=
 =?us-ascii?Q?17yUftSQDe1F2Ybv+vzhFajdYwNWlTMSm60kZI/bPjJy/r/M3hkE2sZswGer?=
 =?us-ascii?Q?HQF9R9yDkn3YxRH6YLzZfwaHuf8v+/kvjb4REh9eOU/IdqCILuimp/skWDRo?=
 =?us-ascii?Q?W5i+qk80+ypygkNiCLEeUTiCXvCJujGlHqmEdKB1a7+1EsukeMNmRbh7rgXy?=
 =?us-ascii?Q?DUy1Q01YY1SPvz6E44Zzfnso0gV436nCMPSHy4HiTGUCiBst0p5mvbhx1Tce?=
 =?us-ascii?Q?woZsUz396m0EaCRqav8aUs79cFuNX9dCS9VVHt26Mi2/1lpgglJOGgFkwxQ1?=
 =?us-ascii?Q?Hgz0yH+U4Vyx7g2EJhgNY+/+KrROytopkfujrABXqv6hGmc0W4CJJxmVfh1j?=
 =?us-ascii?Q?NCA1UONA/k7oHhQeZG+bXreXmbxV0momDdsK3bCj0Jrc5q5FU7uYkP/VPEhy?=
 =?us-ascii?Q?0JvKOdqABHL4xO4bob2qLRao+4ZkV9SLSl/SSzCOeeO7IvjVnsKO53KgOG4x?=
 =?us-ascii?Q?/ghMj6fDw56ZcDhE0TiVsBwUHLtzs6RZTfLm6u2SYC3slOdr6Lj8kG1//JRH?=
 =?us-ascii?Q?aLvTlpESnEb5ABTxmgnYsXAI2qwB6tWIwsO/0frc9aG/Hr8UpAUe7j+kMAIV?=
 =?us-ascii?Q?jSvLeZ7CPkpQyA6jsGiFXliiYCP2oJLzC7II7M1XR7MRX4kNsxEomS8j1+kE?=
 =?us-ascii?Q?wJIdo0junx34/nfSF8qr05uWkYvEM6GzqzVuUM0FzwT0YEUhm4GhC/l6M3JD?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YUEfUqMUfYHZCOFuUe6hwHYZuakpUmCreBBBRRtBNGBuu7tgcPMipKQZbf8RIxkgpBlVaTitka/v+Buf5CV3N/mD5ct07yO3so7Hdi7IXdDrq1MBSseCbuyOG9iwUNVHmOraSU06JaW4HESdZHNFZYbFDc1a9o38RsmZOm64DLapf3U7pNFbYQEQ7TqbAUuXo9dJbeaUPf+MNABKsURMeQOJH5XG4MeCSqtR2yY6I/hJ+Z/31HeDQmPlJaUaznqJJ/tmFrdJ2SkErHv0PBQ7WHOjzu28v6GJaMIsFmDMSmuRUlv+uhLLOPPwgwSZrHaTAi2MpTNrqXeBvXhqm8NRwpJwuO2AxSZsQSVnpVmrgUfoKh7QKhtGGPhBWiReddwAgwYH4ZclAv/kTMR6aYmbdocWoy1VyvBL8Gw09iTPG7n0Y6mApfcKKvJwFs3rlzA1UXF7tY+Railx9fAsT5yomh8EV2qOEhtVE2/VigIXquDttUANPn+7etKY1hJnbmg9Djo3pajgQRpNGRLALyjxjsMRzsZ5vXRnxVcXyLer2yNt32FK5tQbkd1thoQ1TN63AhJAuTvtNmgb6Q0tQG2F0E/YZ5pU/ufzwDxe45WFEDU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8c52dc-7b8f-49ba-f2fc-08dda766283e
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:58:56.1361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4BDvTn8czXnLBRTOAtCkNu+yzPbVlvluz7q2Fa6sx/5hxydDv7PASWfQShRZR6/+oPpEt/F3EgT0ScCk5Low+WLJ72l6b93d1mNzlXJldU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6521
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=968 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090110
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=6846f6b3 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tBFMZI5H2UhPne4Fc3UA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: mUSnpjSyB1-yPdJ5m6ge6LrZiQyEJApI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMCBTYWx0ZWRfX+gM+ZbaIinib Ys7mkSMroqksZ8Ps7JSCh+URzL6YgRrNQx9f8+eHg/INHDWOGP6BBLUAwtVCUleUlaLCgEV96v0 o8+RRTpyEeWjg8OiIbA4VI0wnJFln3ATRKiPnlf4HlBHRK3zUZFP0ZJr004ue4PWNNiKQYSYkk2
 LHX+eO45F46IAomI63bmEPu13N54nG4LXMGJ2oBJai1de6Fx9BZur/32Xi+gM9Mgn8Ba1Vo1kcJ Y+s/Y27eo8SMAsXGtTIkshvY8f+KF0UqMcaXBFD5Et2huomGmCwjzXbs56ekKAl1flA1pbPhGDw pQkFzId7TiZSaIRpp17wRS7ctr1nlMKNSr9/wvHDwtZ9H5VTnVMYeTo4AdpZdwwUyaMDpiUepbP
 +SANqvl7PYL4bCE5nkhs7u2+07mElTMUIxLAtIF5R62LMr+yKd3QHEJoGF0FQirD9312wHBc
X-Proofpoint-GUID: mUSnpjSyB1-yPdJ5m6ge6LrZiQyEJApI

On Mon, Jun 09, 2025 at 01:12:25PM +0100, Usama Arif wrote:
>
> > I dont like it either :)
> >
>
> Pressed "Ctrl+enter" instead of "enter" by mistake which sent the email prematurely :)
> Adding replies to the rest of the comments in this email.

We've all been there :)

>
> As I mentioned in reply to David now in [1], pageblock_nr_pages is not really
> 1 << PAGE_BLOCK_ORDER but is 1 << min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER) when
> THP is enabled.
>
> It needs a better name, but I think the right approach is just to change
> pageblock_order as recommended in [2]
>
> [1] https://lore.kernel.org/all/4adf1f8b-781d-4ab0-b82e-49795ad712cb@gmail.com/
> [2] https://lore.kernel.org/all/c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com/
>
Replied there.

>
> >
> >>> +{
> >>> +	return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
> >>> +}
> >>> +
> >>>  static void set_recommended_min_free_kbytes(void)
> >>>  {
> >>>  	struct zone *zone;
> >>> @@ -2638,12 +2658,16 @@ static void set_recommended_min_free_kbytes(void)
> >>
> >> You provide a 'patchlet' in
> >> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
> >>
> >> That also does:
> >>
> >>         /* Ensure 2 pageblocks are free to assist fragmentation avoidance */
> >> -       recommended_min = pageblock_nr_pages * nr_zones * 2;
> >> +       recommended_min = min_thp_pageblock_nr_pages() * nr_zones * 2;
> >>
> >> So comment here - this comment is now incorrect, this isn't 2 page blocks,
> >> it's 2 of 'sub-pageblock size as if page blocks were dynamically altered by
> >> always/madvise THP size'.
> >>
> >> Again, this whole thing strikes me as we're doing things at the wrong level
> >> of abstraction.
> >>
> >> And you're definitely now not helping avoid pageblock-sized
> >> fragmentation. You're accepting that you need less so... why not reduce
> >> pageblock size? :)
> >>
>
> Yes agreed.

:)

>
> >> 	/*
> >> 	 * Make sure that on average at least two pageblocks are almost free
> >> 	 * of another type, one for a migratetype to fall back to and a
> >>
> >> ^ remainder of comment
> >>
> >>>  	 * second to avoid subsequent fallbacks of other types There are 3
> >>>  	 * MIGRATE_TYPES we care about.
> >>>  	 */
> >>> -	recommended_min += pageblock_nr_pages * nr_zones *
> >>> +	recommended_min += min_thp_pageblock_nr_pages() * nr_zones *
> >>>  			   MIGRATE_PCPTYPES * MIGRATE_PCPTYPES;
> >>
> >> This just seems wrong now and contradicts the comment - you're setting
> >> minimum pages based on migrate PCP types that operate at pageblock order
> >> but without reference to the actual number of page block pages?
> >>
> >> So the comment is just wrong now? 'make sure there are at least two
> >> pageblocks', well this isn't what you're doing is it? So why there are we
> >> making reference to PCP counts etc.?
> >>
> >> This seems like we're essentially just tuning these numbers someswhat
> >> arbitrarily to reduce them?
> >>
> >>>
> >>> -	/* don't ever allow to reserve more than 5% of the lowmem */
> >>> -	recommended_min = min(recommended_min,
> >>> -			      (unsigned long) nr_free_buffer_pages() / 20);
> >>> +	/*
> >>> +	 * Don't ever allow to reserve more than 5% of the lowmem.
> >>> +	 * Use a min of 128 pages when all THP orders are set to never.
> >>
> >> Why? Did you just choose this number out of the blue?
>
>
> Mentioned this in the previous comment.

Ack

> >>
> >> Previously, on x86-64 with thp -> never on everything a pageblock order-9
> >> wouldn't this be a much higher value?
> >>
> >> I mean just putting '128' here is not acceptable. It needs to be justified
> >> (even if empirically with data to back it) and defined as a named thing.
> >>
> >>
> >>> +	 */
> >>> +	recommended_min = clamp(recommended_min, 128,
> >>> +				(unsigned long) nr_free_buffer_pages() / 20);
> >>> +
> >>>  	recommended_min <<= (PAGE_SHIFT-10);
> >>>
> >>>  	if (recommended_min > min_free_kbytes) {
> >>> diff --git a/mm/shmem.c b/mm/shmem.c
> >>> index 0c5fb4ffa03a..8e92678d1175 100644
> >>> --- a/mm/shmem.c
> >>> +++ b/mm/shmem.c
> >>> @@ -136,10 +136,10 @@ struct shmem_options {
> >>>  };
> >>>
> >>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >>> -static unsigned long huge_shmem_orders_always __read_mostly;
> >>> -static unsigned long huge_shmem_orders_madvise __read_mostly;
> >>> -static unsigned long huge_shmem_orders_inherit __read_mostly;
> >>> -static unsigned long huge_shmem_orders_within_size __read_mostly;
> >>> +unsigned long huge_shmem_orders_always __read_mostly;
> >>> +unsigned long huge_shmem_orders_madvise __read_mostly;
> >>> +unsigned long huge_shmem_orders_inherit __read_mostly;
> >>> +unsigned long huge_shmem_orders_within_size __read_mostly;
> >>
> >> Again, we really shouldn't need to do this.
>
> Agreed, for the RFC, I just did it similar to the anon ones when I got the build error
> trying to use these, but yeah a much better approach would be to just have a
> function in shmem that would return the largest shmem thp allowable order.

Ack, yeah it's fiddly but would be better this way.

>
>
> >>
> >>>  static bool shmem_orders_configured __initdata;
> >>>  #endif
> >>>
> >>> @@ -516,25 +516,6 @@ static bool shmem_confirm_swap(struct address_space *mapping,
> >>>  	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
> >>>  }
> >>>
> >>> -/*
> >>> - * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
> >>> - *
> >>> - * SHMEM_HUGE_NEVER:
> >>> - *	disables huge pages for the mount;
> >>> - * SHMEM_HUGE_ALWAYS:
> >>> - *	enables huge pages for the mount;
> >>> - * SHMEM_HUGE_WITHIN_SIZE:
> >>> - *	only allocate huge pages if the page will be fully within i_size,
> >>> - *	also respect madvise() hints;
> >>> - * SHMEM_HUGE_ADVISE:
> >>> - *	only allocate huge pages if requested with madvise();
> >>> - */
> >>> -
> >>> -#define SHMEM_HUGE_NEVER	0
> >>> -#define SHMEM_HUGE_ALWAYS	1
> >>> -#define SHMEM_HUGE_WITHIN_SIZE	2
> >>> -#define SHMEM_HUGE_ADVISE	3
> >>> -
> >>
> >> Again we really shouldn't need to do this, just provide some function from
> >> shmem that gives you what you need.
> >>
> >>>  /*
> >>>   * Special values.
> >>>   * Only can be set via /sys/kernel/mm/transparent_hugepage/shmem_enabled:
> >>> @@ -551,7 +532,7 @@ static bool shmem_confirm_swap(struct address_space *mapping,
> >>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >>>  /* ifdef here to avoid bloating shmem.o when not necessary */
> >>>
> >>> -static int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
> >>> +int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
> >>
> >> Same comment.
> >>
> >>>  static int tmpfs_huge __read_mostly = SHMEM_HUGE_NEVER;
> >>>
> >>>  /**
> >>> --
> >>> 2.47.1
> >>>
> >
>
