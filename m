Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5E92063FD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115166; cv=fail; b=HJvwZ4oJ1iV/G3KL1qee6BfDwc4BRgoBygFseum7hLU206boaRWnm6DQdaTbPX5A9LW2a+LWXXyr65lTe/5OugsvWleuK6y4T6YeofmWesl3vTBMQSe6gDeWW33yhLcsZ4BTCv8KSD2rXCb7Ss7D048D1jcrsqbCqLGfo1eEtfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115166; c=relaxed/simple;
	bh=5IBryjzqjyt9zcxBNsJ8xa9OCGcN3cBHn9ZVTJYvmKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R/FuXQZSK+aAoLdp8lH3JrOi4UPkpuYyFxKWlxGHj8T/Y+c5xEgpgepXNg91nTABPKR8x/kL3pbU3oqCdD0sTW/tywCPThzufi4bIF2txF8SeY2AsllHNsvzIFwoxyXrzc8+66xB+lXMmpMBrZzYn7Ho5h80DWfkgk4vyoyJjU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XTQSU9qW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i28w2RaA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XTQSU9qW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i28w2RaA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538C6otI021814;
	Tue, 8 Apr 2025 12:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=hYmh9nRXgj5hpWbMml
	MQaOl6y2ehNp8tsCZIMQI+lEE=; b=XTQSU9qWJ84AMBzLE0ZNC7SbKgJbAjmCJW
	2zo4lZIyy66jwAWj56Q7zihBrPNY0JQbLPmsIy5w/QT3nHtjtgIJCLB6P6eb+s//
	yYSE9+jIpoLGEQ610yTg3ehpazDMZxGPIpbVjRkLEVFq8I9V5mHOXE3ymTgIR5ac
	9xotaYACXU9CreMurKcxuwRDe1BKdX88OspDN5oobkWR39xzsUWEJQRTp6TY/mS3
	gNDQ7SNqrLlgTtgVPlwQtx2mu2tkNrQr7PnYf0ducU8V/9hY+2haikqglBvXCSQW
	rmcPdtl4zskxKT8e5offpIkZj94s9TOQw8W5WaQBdS36NSjsaM7Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvd9vjh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 12:25:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538CKtTg022599;
	Tue, 8 Apr 2025 12:25:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty9xnx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 12:25:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ody2WWkWNp5il3vaVeSyvNU6Zgv+BPfGfjRm6qvD+D91eyR2rawulhQ9J7j6lYQ0NP6GBHwBMdRDNZsT+JyYPHknp/bYhp9ysrKN5w1z4LeiCH1QCVam29S43iePhkQgjfbIWVMUKQrGVnVBUiEvgPdNAP5wJ/lRq/4YSBwlpwvdxy27PtVdLrEP33GGwOCj3Izp6Vwy7tVOQQ4P7fEO9ilyfnj01xaU7O1eWkyqioBMdHTt7J9FehDjlenSjSyjv08IYEKnZdyABrTRzyGJVJQoqSNTdpjrkCVZTDspwhuB2X9Mn68wxS8AdW5bTctuBWcLnU8KqtOKZkDjOmINhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYmh9nRXgj5hpWbMmlMQaOl6y2ehNp8tsCZIMQI+lEE=;
 b=X97ifyrjjSjsqs2ResUUIoFL/Y1VXryT2qFxu/b9M6yENJmjR6Xd5D376NgqdWWr52rf/hNMYh1YyUwEy5Xuu3B5JS/jvbGd5da83qwnAZRlfsfsUPHIOuqm7Z374XJh+8jJXNf2unYx9/Lr5vrfdKH1i1abiEk0ApEfFl/zye0eyJgvDgVqhQap7CuZjDVGpYaKVaUqS6Uyhft2RambcazXL5lS8rWO9fBMAJ7DibhJHQTbmCNSz0Qh2S6MGjzXRx6Kc1BlIujOE+dYrCMNN6VZqDHMjGYc5iZngELNBx+KlePnADu6iLBJDggnq2DQY3EpMX0gBuU5xtJhKKnvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYmh9nRXgj5hpWbMmlMQaOl6y2ehNp8tsCZIMQI+lEE=;
 b=i28w2RaACOjpb4FDMVWf4Da8UKkQUprNmfPIJ7u/2f2sKtssghIyRsParcP6Hgl/CrHE31lSvwaGc86mty6RRsSsc05QGDht1Alhk1zoTuN/kbs7SqsN+f3SthVMCEqr6w4KqAc2p0N9lAFsW2PNLv14QEdGb1QBuJUxuC4GpJc=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SA6PR10MB8181.namprd10.prod.outlook.com (2603:10b6:806:43b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 12:25:00 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 12:25:00 +0000
Date: Tue, 8 Apr 2025 13:24:57 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, Rik van Riel <riel@surriel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] x86/mm/pat: (un)track_pfn_copy() fix + doc
 improvements
Message-ID: <4751373d-8068-4797-9d4e-dae802730ba5@lucifer.local>
References: <20250408085950.976103-1-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408085950.976103-1-david@redhat.com>
X-ClientProxiedBy: LNXP265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::21) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SA6PR10MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: d93e9b8f-659f-4c44-115c-08dd769861bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Po9kB0fuqb1Xzv+LUrrJzaWWIBFHe3YJCUATppPZGeqcZQ0avGJ0KOynjmC3?=
 =?us-ascii?Q?XA18rHwKgiv029lF1hsvu5gX3YoHfJaXU3OOa4wTNBZNUsZjcIbQpB7JLn+3?=
 =?us-ascii?Q?lWK6I1p8d1vCjP/kzBczUQ5kO6CciaCjhotlAzMlw/mFV5DFHO3dekf7jLhM?=
 =?us-ascii?Q?gpT6feCtDIJrEXgKlrm24OxSSP4hXzD3snnwRtJ/bS4riA5tEX1TMkiRlZPJ?=
 =?us-ascii?Q?Djbt5VbV0gBv52TcMRG9CggdO9belHXb+pZ8LWMzh37tFEKbpgzv63qkZrpY?=
 =?us-ascii?Q?7PDj7PGZzUIxBOyMPfuqAS07FrO7IrZ31uWRaqICDHGJdt4qEKeeJOzGMRMM?=
 =?us-ascii?Q?r2Ac6zqN3Dal/1X4r3J/qRXNq27x9y5jjcwpc86E0901cdmL40cbTh7/QI38?=
 =?us-ascii?Q?vbtMxTUXsmMnH3Bfo0O+n6WgdkmWzoc9hiJWGu56OvG7c9UlY5fkUFOqNQp2?=
 =?us-ascii?Q?ZhB8Qa5CilTpjG7i6LjAbzKA6wI5NnTdznGjcP+OCXloe8KePd6frPg1P4mJ?=
 =?us-ascii?Q?qwwhJR9njCuJ9TksbByc1b+QA1gzBJWGYZIfjVTNSGdH6hGUuCdDp0O7OkiS?=
 =?us-ascii?Q?S+3yM3jk7wWFIlvOOxoZQmwGbajYvu8Pe3GuIbQC+UtbTYqrD+lm69M2SW/G?=
 =?us-ascii?Q?Ql4QlbA3Nbv4KUhMZlE+15DpcwsRQjPdU4alP1kaG4PLHyFIeJ3ppTRDrkxC?=
 =?us-ascii?Q?V98EDwTb2QgG9B82toeyn727HkVPuryTePSJpYUrRBkR4vYrpWvVWvoGWqcB?=
 =?us-ascii?Q?NY6XNFOY2Br2i+iVlc/ollRTcb5FUK0VuiJznlBIeDRnNUn3+CiSmPZtCJyd?=
 =?us-ascii?Q?omOUU5T5TDN66JQIEg87omCTyUUNkZ7j7gAOoBZHHbMtz9cROypo5hUpKHlu?=
 =?us-ascii?Q?HHTqo0HnHISf60f6lyvmgZzEN8pEPtuMyU3xUgrw4K11c6iR5AUhTVaBOfm5?=
 =?us-ascii?Q?dFWxbv+WCW0cAgKGXO1zrutoJ/Hlb+XatvG0qtxW1W6hx1U/0EeHO7sJ8ply?=
 =?us-ascii?Q?gZReR9YnCRNQe93cF7vENzaAqDnFj7EoM49S1apebU/eBjbIrhgHxfPXgl+H?=
 =?us-ascii?Q?mbt7orxuYKzFeDkTi4VjYOQzmrTSfTcu1ok+GPWRuRhmZis2aXMfjq22P3QO?=
 =?us-ascii?Q?jwVxa3z9Zc+WfVu9FaRYiNIpba4vcQAWc4BiDN/lv2gR9hxZqgMRgvPCkvJl?=
 =?us-ascii?Q?pmB59FUAyUtijCfdWa3VlZZNY/tNIwWjhYMnRwuiG8B03nILDzm2/jITZErM?=
 =?us-ascii?Q?8CbZgiB53u9/OxWsrhWxylcxyg2AuejflXya57FnK669gDYwfDpwfJxC2ltY?=
 =?us-ascii?Q?sx78XLHHY/tLEWAEiPBS672PH2MLb1Rud2CIb6Obvmok7KgGvdPum2fyfdOg?=
 =?us-ascii?Q?9WQAKxKPG6OUvU+XTEamfybHrfsd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n1ItpFRJMosew/5VeFGb1zXaviKTheLkEHAkpKavMKbVO+RQ62WSXYdKZUea?=
 =?us-ascii?Q?lrLx62yXv8E7amEXrd62q0TsS+OBow9QK8StVf6PUbni9dfTUAVidpODocF5?=
 =?us-ascii?Q?PdH4YkGOWNQJzuCr1fTXCtZ8IfkxXmXZ+VZei5k39qtvwH9V90Zm6rt5aPUF?=
 =?us-ascii?Q?N/F+1OF0PjmXGkn4mjRRCsEtqDY7Bblp/J4Lc3gjfM79yu84IOTldabc3mjr?=
 =?us-ascii?Q?Bv4fzYDDEzEalSj6xydXYQRqo8GikmUUp43wiLeRZNwt0rheLhxlhM8l51/k?=
 =?us-ascii?Q?DH/slnADL5TEBB7pFOZoxIfa2LFAVHS8obfrv/U5wHWIK+wcDaDz29Ilw2Zh?=
 =?us-ascii?Q?VzSkJ/yGC0aX3fVEElCp3lxWgEslLAg536GmuQPhI6fs0b2UbXyWJHWn3Cji?=
 =?us-ascii?Q?HN+sWIjLl928zDJwA/jp04ra3cFa0ov5mPN5aIScpelCbM9uM72p7lphAgU/?=
 =?us-ascii?Q?lIyvJgd4cuFScyNuAc0PMMnwEFD30TnlMvPmhRX1YLks8i5bkY2uP+V1JXdT?=
 =?us-ascii?Q?yciyB5rPP3HYf5RfZ5pF2KLpkuTEzGBlfFbuj9XUedQxf+Re8iYiF9gsB/q7?=
 =?us-ascii?Q?we6vPAhT8Ew812tPX3xbQltGtaqImGdbcGba5jnr0YhxSUUoNQ8ZaEGhRC1b?=
 =?us-ascii?Q?FRl8IyXOGgXTfsBQEclHcM3FXFZPdGljoZ6gEcHFY8pdqdXz77Dmv5ZvxG5r?=
 =?us-ascii?Q?tt0hAwLURp3YXCHyPxoWItzjh2EH+abLchDQ0sgu4Hibwd6RXqs6Zr875UDh?=
 =?us-ascii?Q?dS/6ZoK2o38E3C22B7i8LJOkZx5Sv2UH9+olQdQ3KlkVhMzYX+CXmbGNFLqI?=
 =?us-ascii?Q?l24rq1znPkNn7uEECeb08svrNDW8vv/dy5hMv2iUPA1ODafgrUUMsll1gZkQ?=
 =?us-ascii?Q?fEQ9AP9Im9kkXP3+R5cjMrxIEJQ2p2Q8tobl+auCMwvLyLf4YgRH5a0OsVEs?=
 =?us-ascii?Q?+GNHkUGHzrI5JzeE81RjXxC5uq39Rmlz9LDAXj+QhaREeAoJH+ma53B85Vb6?=
 =?us-ascii?Q?bhFgbzCSH1J94Y31kc59DtYEmzm7GciDZogKeiYl4H0Qym6/M+aRNYfgMrD3?=
 =?us-ascii?Q?2LqnKYfOv65qzOa1IxdOHThka3m7zn1PjqSTrlkYuQy8Q5xjYVNz8TiOtTv/?=
 =?us-ascii?Q?kDdEqUcnUIoUuqKqM9q4RyDmS4QqUrLIw18hz0IImn48vsJKicmuBh8w5gUn?=
 =?us-ascii?Q?wgbD2jHd8nEo90+GCX7Do2xLoMV/x+LtqjEBKRIy++Bwwb3oKjvPiGtQNo2r?=
 =?us-ascii?Q?auGOcbvQUtYr1oooJgHsXRp+llsj6C14EwNIx0Qpn07POcMoIZySS6eqQezn?=
 =?us-ascii?Q?QJP1S4Y3AoVgVJ6l0JhLAbIkN+ePaK6NZVkjWpbRoJjglSl1SLGueUZ9zCoL?=
 =?us-ascii?Q?dakRbl6t5JVDp8x1q1HDLdFlkrSHQjFlMXgH0nylYGvrd3vtJOS53jgtj11f?=
 =?us-ascii?Q?velX36DxqrgJ/A/KtavyOcxKbNslFbiSno6y7V+V1KjqEv7LBNHPg/c324Zv?=
 =?us-ascii?Q?+VL8bHLZsk+GFlc4Swrj53xVD4q6pfPd7oMa70AB6B7rTgGqfPSQiA6wUeYD?=
 =?us-ascii?Q?XjnNhsBba4Vie9mvMJBdNtSoU/G9DBBPP+wnGAfSlDN55WWUSEAS++NNofn2?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/3NJLomlKBWIK+fyWrakz5gdnJJcKdBJMH9MWg7ipMkwMBias8LQzVc4eyNZ7jQ1pnuRQmcAwFYqqDRLt9Qdevx+GvXwIiohc+l6LEtTgpABM5J/oc2Z8/Ph3li1+9Dna91h9sZSE1qPSNTerIrQhECM5PJgK9XoxECe8yLem2sFm3QPZt9NjxPqgPa4bFAE2bLSum2Edd+/bmG57LUgFANH8A9oKZukfngNVoVBljq+yXDOUmaHs3vt5qHhT1XT6yG6vxR4F89kPz3sipYTaAlsWS44g86GXk1fwjhM0yQnDtrJMOLOXSobTd/sbjX9SU+bPVY3kkK3w9RieKLTBa7o8SBUKs8beumQDrLhPZOsZukgAvCenvCEwzmZ6vbqTyV2CD8m4uXKiAn8KnJ1q4Fc3EyExjkgmLMUyQz4KMS7k0QSacV0hKSb1cy/36mvU3glJAq6LAmUNEKRFxPqsiVbgHYbPA1JR0C1//bAOCApEhm8qrA0gndB5p1PD4jLchxQaKPz8LELqWPX/rz6swABG9mZ12o+wp5iqqsGpSVsDsEJ+ZBmimjSenYeoxIz4TjRCls0v2HnJ/1rl1vJFmfTNvY6oMJtnL9QcYf2Yc0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93e9b8f-659f-4c44-115c-08dd769861bc
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 12:25:00.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAmf+onw15t8DmG6IPL9o9eR7Rb/h4x0lmxVR/3qQOFh1xO52DovH51GK5SbHkZwsOVBUF0yiBSZ3d3rwwSj+sCnVtwKl4ObKLfRkWOKzkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8181
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504080088
X-Proofpoint-ORIG-GUID: ICMfJcOMvjwatclpsfJFyq3tnNkgSSAV
X-Proofpoint-GUID: ICMfJcOMvjwatclpsfJFyq3tnNkgSSAV

On Tue, Apr 08, 2025 at 10:59:50AM +0200, David Hildenbrand wrote:
> We got a late smatch warning and some additional review feedback.
>
> 	smatch warnings:
> 	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
>
> We actually use the pfn only when it is properly initialized; however,
> we may pass an uninitialized value to a function -- although it will not
> use it that likely still is UB in C.
>
> So let's just fix it by always initializing pfn in the caller of
> track_pfn_copy(), and improving the documentation of track_pfn_copy().
>
> While at it, clarify the doc of untrack_pfn_copy(), that internal checks
> make sure if we actually have to untrack anything.
>
> Fixes: dc84bc2aba85 ("x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Rik van Riel <riel@surriel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>
> v1 -> v2:
> * Adjust the doc instead of initializing the pfn whenever returning 0
> * Decided to keep Lorenzo's RB :)

All good with me :) the patch in this form is fine!

> * Retested
>
> ---
>  include/linux/pgtable.h | 9 ++++++---
>  mm/memory.c             | 2 +-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e2b705c149454..b50447ef1c921 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1511,8 +1511,9 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>
>  /*
>   * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
> - * tables copied during copy_page_range(). On success, stores the pfn to be
> - * passed to untrack_pfn_copy().
> + * tables copied during copy_page_range(). Will store the pfn to be
> + * passed to untrack_pfn_copy() only if there is something to be untracked.
> + * Callers should initialize the pfn to 0.
>   */
>  static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>  		struct vm_area_struct *src_vma, unsigned long *pfn)
> @@ -1522,7 +1523,9 @@ static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>
>  /*
>   * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
> - * copy_page_range(), but after track_pfn_copy() was already called.
> + * copy_page_range(), but after track_pfn_copy() was already called. Can
> + * be called even if track_pfn_copy() did not actually track anything:
> + * handled internally.
>   */
>  static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
>  		unsigned long pfn)
> diff --git a/mm/memory.c b/mm/memory.c
> index 2d8c265fc7d60..1a35165622e1c 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1361,7 +1361,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  	struct mm_struct *dst_mm = dst_vma->vm_mm;
>  	struct mm_struct *src_mm = src_vma->vm_mm;
>  	struct mmu_notifier_range range;
> -	unsigned long next, pfn;
> +	unsigned long next, pfn = 0;
>  	bool is_cow;
>  	int ret;
>
> --
> 2.48.1
>
