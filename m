Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC728134C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943125; cv=fail; b=ng8mGyZy4L7Dmd6qLPJRiz0giV/ZLFJNPfP+EnzpapOiTI4BvM6zr+GEvvxeeFekYOke60N7Wk1L6859kt7FBRjXRO4WRmSJVQrE93h41kGe6WwV2aSmX3Rx/Kt8JS1eMxpHSFQuB3Cu0pMzL+0GCrsKyc1ImeXclN1f12FU09o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943125; c=relaxed/simple;
	bh=IWdB+aU3YWMa0bVnz1uNmghwiG6aO91WRcZydhlWznk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=luYfPVvUzV7fV7IEz0gLV5Nwzrqkl1mgAdZBvH50XIcIRz02dKzAdf81W8rwJ+HCpZ8hte5PX+FukZ8OEUBITJmxQW5gHbhsStJKpGKX6ZpwkTxg9QI6akadlLWpBlvapUNkmLBBVfVj/bBvV7EY5KL11HIZdLxExzO0XaHlpTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UTkgoxZj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zxq5aFZQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UTkgoxZj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zxq5aFZQ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5537u2mV019473;
	Tue, 3 Jun 2025 09:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=yY1ElxuBED8hH6Ln+v
	pHJlFMhy7730vM/Fs8tv6yKf8=; b=UTkgoxZjGBNwivcA52a4iO7TrCPYkC7qdT
	bNd7QPklTBF9RD85uruifGPf3SxX/rKhiWSQqBXJ30K6MQdqwOYopdKFIggpuZwh
	A78C3pj3wn67KNoTo20q+nfCW+d2GeK2DSWiLN0/BAlMFyzsRG+vR5DFvPIuEz29
	N2dDGxVFCD4KSz/9Zvkey3HWuNwBHADhfXS6xB5L1VOyyAhGzeL4XH1VyBikePkU
	y6Gy68KZvtj/laIbXQCRJxs8b4RiFEr5D+PxUIgk5xm+Zi4bALi34S5REWa8WAhr
	lbzOX/z2uVG4KoQOaDjQtl6qmYnIzFYLIa14nhFlVBNa3gxoosPA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8g9gaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:31:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5539Ip4o039174;
	Tue, 3 Jun 2025 09:31:38 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr793fne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 09:31:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmvX9PgfdUabm7i/H/idp0UEAIe7W0KWVEE6coHycJJQVFyNS2n/eP1V243aoCa0LQsE9laA7VJIniJs2Z6o0lF3GEnisCRrn7brkTP2+bz6vZELJeywZmM2sBMKb++hkGv61WU4LQK4Z9bhQPh/hfaOPFYC6ytDenNXULlUhZUVqYbTssw9R1Q7sW75wW3BZ1ysVvpeUXflYdPlhK0leD2SjDQpt5q0C2ethUUTX7uPC99xE6TiVDnu5x1BclL4B7Ut8IxxdYa4NbDR5Ngb/fh5w1K6V6PEvmlWxYZisM7e2cytivN3GdEJG9blCPw0swNYz+dQmMBtbRwGgOCIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY1ElxuBED8hH6Ln+vpHJlFMhy7730vM/Fs8tv6yKf8=;
 b=sCcrrnEE5euwTFLrbMrtVJb5R3dfv8OiXN/tksr4R/vMCToCcKncPToHBeTm4wG1xgY+V+D0Q2/ZeIUVW5K0troM/8gHOnTtiY3jGZmeMFMU4ej0dUlV7sYec7h5KbkzmxelmuSFTHPI/I8CbMCmOB9Q1ss/4oYbvyeOZychBTmCmTWkCZthu4F+h/N4Hji3Owvt4yEfFG5GZqaRQTrjO6ahJn0AoT4gLqjgJVJ9ONq0hFDP3Qfjy8ue1AarzqOJiyo8eO0TrOgHDjrvwiazfGscDJDbm7Fu8rGHB6cFyDOIIEhVA7fEQm51vK2OknkbCN923vYRo6Dg9yaN2kQe4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY1ElxuBED8hH6Ln+vpHJlFMhy7730vM/Fs8tv6yKf8=;
 b=zxq5aFZQV+v2Qu6weh7fzgMZiMgKln4n+U4OqTH/WHi56i/Ox01Ib/DVK/RrwSsEIRi82RRHSav8RSMFyB9zeY2k+7ROZ68RyIGMsBiIYlib83hp0kq+7PL+aX1ZTbdR8i/wfDFxy3oPq/pnSQaiHsTmfCkzEiIpNBY5hYLMBVQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4622.namprd10.prod.outlook.com (2603:10b6:a03:2d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 09:31:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 09:31:35 +0000
Date: Tue, 3 Jun 2025 10:31:33 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Juan Yescas <jyescas@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: Kconfig: Use verb *use* in plural form in description
Message-ID: <05576df8-20a6-417d-a4f1-867c4d30a9ea@lucifer.local>
References: <20250603061303.479551-2-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603061303.479551-2-pmenzel@molgen.mpg.de>
X-ClientProxiedBy: LO4P123CA0415.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4622:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa8ae41-5e2a-4c4c-86c8-08dda2816f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M2ZCi6fJ0Tl4+PFm1zMrwIwYBN7KAE5nXaKMed6JZV20oJvqsuFfbzaC9cHw?=
 =?us-ascii?Q?//qk0zJMvWjk4sO7B8jFWZ5PLvsIQriyRruR3ldCFpIW2jn12GPujKcFuJRE?=
 =?us-ascii?Q?67U6dsm5hXBwfob1xJ96GKM2Q1XUuPODRPxO56ibY+fmDSFpiFqgPE2XnPny?=
 =?us-ascii?Q?b4g39XJnmJ4dOwXJ+TEg3+eQtHEPADEQFXVitHC+bBDYKamrL5B6EyjHVqpl?=
 =?us-ascii?Q?zRPbrr1lU3Sh8jt1WGv8fq4NuMveVOc7RBCsY8U+HQdK686yzTNOGfzsGF0t?=
 =?us-ascii?Q?9Fp+HrG6i8Q60B6IOrFYo1W07y7mip48CVbUQo+x8yk8zmVIY6kJube6HwYb?=
 =?us-ascii?Q?N9pwzqYjZyXtRijm0kzhLLtM9YEmZclE8W8xZVDvWIZFYt1yu+nwHQRHefBf?=
 =?us-ascii?Q?CVHSHt2RoyPlY3VqzHSGdPmUbTaw+JhMZ03A0kyBciOTPEVmJIsjvDhUnatG?=
 =?us-ascii?Q?czZu0X1sXoWlwBq1BmiXQFtTKxo7gT9+Tt1P8Cyc4AggaFxl7xBJ6Ftd3US6?=
 =?us-ascii?Q?xd7JLZyX/1Aaw//b8qR/ZEeImyycCu7Oj8oyq/q/KHleHSbkLegACrOWwEEv?=
 =?us-ascii?Q?OiIzJjGeXwCj3lyi2rcF1AnVcEn3brIURiaAb6yVwQQ6oVQ05P6LeX5+ghIA?=
 =?us-ascii?Q?4STBD6I2rYxhyfOdRpJmUcXu9UWKd72DmRo19u0vVbG2S4ZeN9az8zfX3yEO?=
 =?us-ascii?Q?0Qc5lxOb4sUN6MkfMg/oK3QaE/Gqhk9bXjBcpeAOFiBIP6czwEzOdQxCpiIr?=
 =?us-ascii?Q?GyB7U90qL+2yz5qu2AA7DPd+1kwfrJhtfYuJb8WnyV0PRzvYETZKYIoF1RKI?=
 =?us-ascii?Q?6Rq1N/4VcYPFH1jM7VLMr56zkAclZoOw1f2qlm/J0vayTba9NDP1/Kys/xmr?=
 =?us-ascii?Q?ICjGRI/KEPUp/dzoRlLOBNYgJY82PgtP8QdmnhreUu0nBDHlXTmEHvH16yQu?=
 =?us-ascii?Q?T7Lb4TdUTktiAb4Ivbhjt5qIcOe1lzHAatPDhHoTykOYAb+r03HScTyfLpaM?=
 =?us-ascii?Q?7m4wc5NVOgJgePKrPaAwC9U9W1qqEpzcmHaSh0qn8e6aN9f6i5E//LJreYTM?=
 =?us-ascii?Q?9X4tZ6LVycV3aIYtv6xem4p0MmPnuk0/PXBBG3o5j8uaekSpY5WaQgQcIUoc?=
 =?us-ascii?Q?0bvA4LfhbhkoZyZZeJw2JTv59Fk2kM1j5s4L3yGbhLQE9H7axHODshGk6Vv0?=
 =?us-ascii?Q?zePT8+l4tfsw9jqXe92rOoY1CyuS2HBHBsz2s8185OxhLg8mBbjQ3VMqI1UD?=
 =?us-ascii?Q?VARNfY3j3dmpiCVtO/F6EeTsyGBZ7rp44iYje+XmZazqheMFh2hSrxXwRwB5?=
 =?us-ascii?Q?fYiIa487xmMRn7SsFxTPxco8aS/MPXIxuOtyNzZzUzTIQD2mOEl/KoBiN0Ei?=
 =?us-ascii?Q?+/VZVIkJnSBjbyltldct8b2o2N9j/EsBkwYpxsngvTHVfpJjOtySSxYtGE67?=
 =?us-ascii?Q?umKqKxLzT44=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HSXetd5ytUbP1KbfHspFqM8G+x3cc23V/baek7C0PuDTw2dGUQqkeWyXFTld?=
 =?us-ascii?Q?I7RyWsKI/olIO3cNHGFXF8J3wU4FkV5HRsxCf24zR8CQsmvs/5nc+Hly508X?=
 =?us-ascii?Q?TNsBsBtS7cQ7f8ouXU1Bh7DkNRUOQW8N3ixB3rIZkUUt1T8bDyktondwiTV4?=
 =?us-ascii?Q?Bvrlg5AC97g0+TG3Tpu5zD0zIDOiavv5HeXPYxWrPLmlYwLDODzeoyahjCLm?=
 =?us-ascii?Q?TSG6/MlEvqkVw3WHxyQh8c/Zj3CTaXiWFe9HFahPBZKg31VBlhrKZPM2lqkY?=
 =?us-ascii?Q?XuX6eL6aUJjPeq1Qm3RxFw5U5nsKPXRAlP/vB2pF+f9PwjpqtlYYQ9rlxVKS?=
 =?us-ascii?Q?wbrxesmIafTYixFapgNI4hqDhwdYPPtnp3vYoA5vSbB9bg3npfPYk08LR0vq?=
 =?us-ascii?Q?J2QviGu6eJLLQ4JX0xSX75H3mRUZZvywNQq3xSxEEHPGD46Vh4eWmYEleueg?=
 =?us-ascii?Q?lvjV6UoQ8IwTn/x5Ke5s2tkXGILffZ2vPH6kMJglY/7bIzpCT50yfU1uW3ov?=
 =?us-ascii?Q?VdWGrY8cGvCpAofQdvt0JppRKC/BTgRCA6SGcyS4ueP0Jp1g0bZ245WzQnyu?=
 =?us-ascii?Q?Zr81DdMMAifusE0UtUmK/cId2qhvgejD/ETRqCbObzaQuC3+SuvWmZWAfeBO?=
 =?us-ascii?Q?prfFP6kqqg1CgQA5jewlrOmlPBG7tLXOLJP7FQQhcVuEBxb/JXMOwkar4eko?=
 =?us-ascii?Q?3bKg2DdJVUwpDHLzSedhkVy5mAccQmUZ8JaVXSgA0iFqhbBEIqcJGe9oVqhk?=
 =?us-ascii?Q?6ZWBUUD0FUkjmeq4Q9lUtrdD/NbjizXiJo0PZvwXYbaOjCG1tw8GRci8iRlH?=
 =?us-ascii?Q?wiiRt1JSy3qQefuUzOhVQQz06TU51//WiOzW55iqrF80M5VC2rnJOKd9I4+u?=
 =?us-ascii?Q?v6wsOZ6nvpLc5FYBfAIl2JUjC9E46wTvOP6rFyAYnUoSmekTmutyl2q0b9Xh?=
 =?us-ascii?Q?v5CFwqu7vvYBOt5DB/rBtEEZ3cp35Eu3rvJin6bPT9JkFaCtOQpR2vUa5PI1?=
 =?us-ascii?Q?II/liBreseTlDCid9z8ioDm0ILTKc54AniPI7owg0P70O1u6WVm6C6PSkkqH?=
 =?us-ascii?Q?bsV2AcsiGZzY0b9MZOvXdVXB9f9l1jjb+moSMD8X1+fbMxpHGBBe1ReXQMtU?=
 =?us-ascii?Q?tmbcZPBu9bXheihZjROvfajKX05LcZoIJZnQB9DbhJPmPH4WsZOZl6RZZYZr?=
 =?us-ascii?Q?GArqZRLUGzyfjS0pglFkMzZ+zCGZKsog5TfHdvrQYpQ11QbD281h1/8gzGxy?=
 =?us-ascii?Q?y/e5cOqoYX3GjskI28/gJ6b0qWMCaZQsJ9kHgt/6oZTdI5aPFJ/FEBzAJe2n?=
 =?us-ascii?Q?avblJ66nCPsEbdCvb+JNvJvosbmsnUZ4Z4XiQEOK/dBK/+difV/wzrsKFgi/?=
 =?us-ascii?Q?k7BJplAzcTBb2qJboE46/TflMngBpFXrjglIDbeySAp4fWr12rgubYcfF3MI?=
 =?us-ascii?Q?9M2BetpkA1lhxI8rfmI1oeNi/7SWV7v5YUFwPFyEYkjnCQW3M2cKaZMcWtTj?=
 =?us-ascii?Q?OoO7632sd2Tk54+n9oiWd2DocjvphYy20JvCkPO4/NWfdivt3qVT+4raj3Bk?=
 =?us-ascii?Q?/WUsd/xQg3gnq2Lfq+tU10KTj2VpHuiTIcNyOUGuukN+9YPrxtHcW+f2rxOt?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lKBBs8Qt+1t/KZKGnST2o7Fc4CHlbeZFK/hQE7WX/q6ExZrp3UA1LKVcjY5CMZmhtlFDDTUTv7ml8pao8ml8oBdQc7xAOX/9uhVbHpDXIPWdpEEtxTNzjsDQHu8qwHlo/A+rGUd8rWRoGruHUX0OoDbTsMWzLq5jwBOcNja3tzsAxgxJt4sHvSHZxHWuJ4f1KUyEhl9gO9JVNkjJRpJLv18AeriSAW/qMgtHH4wIB64WwTYf1/4/ZIFeAxsxdr9TRId7sdmNrooQo6mTVpSG0f1lX/on2Oz18xqH9pbNMoGnwyPYMvf8kvctjcwzGpF1iX4qq6H/SvOOWF+bLXb3SGkVgdf7nltgSzQ500XgNDxnUFsV4aB7i/5maZAYJATYf9uo8gksFsN+PCv2LQRxn1EMTQArpeTRWa5UpzxGW5P01DKImm7No+k9gBJxP82gNCYfar37tuIiRDgod93RraQ+/jvAfcc1eitpLudCLwGFszZt6mBBAkU2JeLdQu82d2n+/rdd1OIyFsQcZufsJpMb5EEKt8G1lyXQAyQns7chbEyxIOtbwwSQF7T/CrURIyFU7fdHXfiC3WuEZzHdAE1nLmKJEDMNrNZAslczibg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa8ae41-5e2a-4c4c-86c8-08dda2816f12
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:31:35.5360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2RHKes7ReVSYM+KyEKZkRbYTMXWixYlLGsSceMRH6lUG/XhYPNnu6HcKEj3K73asnWiHgiPnLlyaMb9pdzBQ8F98gupso8GEGY3qTgReaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4622
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030082
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MiBTYWx0ZWRfX1a3SqSFG67vt FPGKysosvVUfHonqaEvsroTSohbMG5RztcIJ4cpy+tMEK0wZ4ckjKtXYPHTEJV7S1XOzszOaW/e 3zJpABQoCP6ROhaAZgPHXu0/ASrTj2LaOmpSmlkBFn6aNeI6BxsQa9gjkczvRy1cUJOjFbVEFPC
 U3Qj09KrgQIBxv0pFoBwYNMqxCxx0E44FTuHi0F7uYl9osIVvFRahbPqXQSdmRsLalRv8j1TsyW mEKT+Jg7usG2GyyqzXh68p5Qzpd+Mb47rSQspSUNVoEmZ6jeRnZP7k9INAmU4vadstfZVbMB3Gq dTStzksUTKEzu410DBmoHfmeVYLTVVu0PwuH4mVF2/ug9cRww+T8tlxcWBDB67gDwsqAJVmBEkK
 6q5WvS4KWQ5Dt41dUeWQsK+Mmoum9l7q6cqZM2MXCYMlJXm7cYKCjyqrPCUWFTRHQBABpr0l
X-Proofpoint-GUID: g6whkJr448ho72QTEJqDK-_EZ0mLv_Bi
X-Proofpoint-ORIG-GUID: g6whkJr448ho72QTEJqDK-_EZ0mLv_Bi
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=683ec0fb cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7IXffH3kuHzQvbFlcIQA:9 a=CjuIK1q_8ugA:10

On Tue, Jun 03, 2025 at 08:13:03AM +0200, Paul Menzel wrote:
> *workloads* is plural requiring the verb *use* in plural form.
>
> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")

I think a fixes is unnecessary here :) I mean strictly true, but we don't
need to backport a typo fix :P

> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
> Reading the sentence it feels like, something is missing before the
> *please*, but I am no native speaker.

Seems ok to me as a native speaker! Though I don't claim to be the most
erudite...

>
>  mm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index f8bb8f070d0d..e3a07687ed0b 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1022,7 +1022,7 @@ config PAGE_BLOCK_ORDER
>  	  or MAX_PAGE_ORDER.
>
>  	  Reducing pageblock order can negatively impact THP generation
> -	  success rate. If your workloads uses THP heavily, please use this
> +	  success rate. If your workloads use THP heavily, please use this
>  	  option with caution.
>
>  	  Don't change if unsure.
> --
> 2.49.0
>
