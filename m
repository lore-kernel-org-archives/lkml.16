Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0331D79B1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413633; cv=fail; b=BzZRr4so0hYNchegf/zWOk7e+7AD57uT76IeNLi01QyWG3G1gMrk9wdz+kuatP6aeci7sGiS+a4TBPj2Q4MP5fKgRgCxAW3rzMmEIA9ug/fN3Ye4EYnjmOwnoUdlRJZ9KwtLRpraksPcTlefe69yOwiwUMASagAQ7YxTnZfW8zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413633; c=relaxed/simple;
	bh=jKr4EeYA0WZ3heh1G3pzea49Hatd8etJQrN1VTMdvms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r2MOB7sBQn7mCtG1Eh9IZXeiKFEJKE8HJSKG53kf2C4rHkspfxzfzAUKC9UVf/J8U/n/J8KZdhUUFZramTGJ0c86HJYfDcJqiuhYiyXyuVB00xTC0L2L6exDbTuc0z0ehLFzUrBuM8BGoHTdr13QzzRsWenNZzv1RX7SvCJdvkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CDRfBB+s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X01rAlHT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CDRfBB+s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X01rAlHT"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UMFPJp029810;
	Mon, 31 Mar 2025 09:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=zfqtbSXQ8F20jqH2Bd
	z1A3nrUfLK9jRRUkpmZ3L/2SE=; b=CDRfBB+s+yHMHMVKzOs43aDy8HqGXTPEwN
	9yr0D8RAgRXi58zqqf9jHI3RzJ+UvwAHWE+GNHVcM8FqNSo6TFBT+L4iCe+9FNli
	q+pDQK/KUySDNKwrjB3r+Y1CoZOpAzlIfSwAWXpcw4XOBPjdMg29wgjOtJ5O10lx
	I9101fYwvVrEOgSZGeMTSUUfBla+7yf5Zbgwdq7obdcQEn5b/RnarVGuaIdO3C+f
	fm/V7HyCCzb76Jl/Rm1es7jBkwYTFk28oywuzu42DJMdH4X9IhTeer+rpMtMuqYL
	RPb1RHHTnkQTOxiq3BGOmiGZSQM7JyQ+BE+oQg+BGgwcfLKQllMg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8wcavmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 09:33:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52V82uIB004286;
	Mon, 31 Mar 2025 09:33:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a7r0b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 09:33:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gk4p1Rhg824nufTrjvB/dHEz/ibMlROzeGTxYEgjLbQXHKve4sDRmqz35JQwbRnP/A7urMcHtPDjvtxzWX0H2crO++Oo1koFLeF0428DWDFaP6f4+ZlP03qy7q/hPZ7w6nC9GeoAGm2oow1JTomZca94gYiFCk0qDvjcldJVKwFHINlYSi2yQrOdxre3k9E2cZJMilZ7eauUzkQ6CZVM2qsUlGEkcvdvYS8nwdzp8PLQRdqXL10G2lKux8fZJqsrVD0hLglZ8CozSjvTJHSV2u+3peDwReuO0aTVoIif5skrRQtWC9F0oH3DuCFMOyioBhokwwuU+1binu7TXn7low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfqtbSXQ8F20jqH2Bdz1A3nrUfLK9jRRUkpmZ3L/2SE=;
 b=Kv+wyRoOJmOWb0c9u+mBR/slzkhWCKb9Q7xSD/QzFBXPHKqRvviW0zlkYokSEbmp2NOXHufHLlGaH4T3ZVstRzh0Xb5mvUW0HHmVhcIEZ+VGJScsJK0cgsK7eFGQ5FMoDzjzThTajauyC1wRYUWHrivjLMLnkbYbEDojLSLUj7X2O3b9wDkCsVbTNN7UDenulxJKsD8KemrXiNUKvi2sRGOvJAny2RFSrckCMP05XQEn74s6YTHrnWPai//UIRoo7/kC3cjpu4OY/j6M5pg8o/D0kAnp63nZd51dOX/F+2Q899kkvS5iWhFpig08/tu8HB5X/JN0+OH4/tz4pbCuJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfqtbSXQ8F20jqH2Bdz1A3nrUfLK9jRRUkpmZ3L/2SE=;
 b=X01rAlHTNRIV/kJOOdrZDfYApXwDQtN999JX8IR44XVrhNfkmPkRJraxFnxp8OWsTaZBuvblWBEQ57h7pDzqkrGUe32uN7qaATXWTFN6W5u9QNT14IqpeBxnqqejldNYD1lbK842Ab+QY1v+7bylBcKH6z/jf3MMTBvWVxKalDI=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SA2PR10MB4475.namprd10.prod.outlook.com (2603:10b6:806:118::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 09:33:25 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 09:33:24 +0000
Date: Mon, 31 Mar 2025 10:33:20 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Jann Horn <jannh@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Harry Yoo <harry.yoo@oracle.com>,
        Yosry Ahmed <yosry.ahmed@linux.dev>,
        Oliver Sang <oliver.sang@intel.com>, Yi Lai <yi1.lai@linux.intel.com>
Subject: Re: [PATCH v3 4/7] mm/mremap: initial refactor of move_vma()
Message-ID: <2923316b-e1e2-41c3-a5b0-b51c1d0a39f9@lucifer.local>
References: <cover.1741639347.git.lorenzo.stoakes@oracle.com>
 <ab611d6efae11bddab2db2b8bb3925b1d1954c7d.1741639347.git.lorenzo.stoakes@oracle.com>
 <b2fb6b9c-376d-4e9b-905e-26d847fd3865@lucifer.local>
 <cf12cbac-e8c7-45dd-ac5a-93a60f6e87be@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf12cbac-e8c7-45dd-ac5a-93a60f6e87be@suse.cz>
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SA2PR10MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b445679-e59f-4a3c-e847-08dd703715a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5QmSkURPkH5+nvj+FIm6T2n/prgAQ+3XCrnbZoAb5M8Zl1voAn8dWzkhTFhX?=
 =?us-ascii?Q?XO15N0qab99hJdMHdxs8Tl9EFvNmaaTxZTEzpREP0gNf74gHmovFvDLA08fV?=
 =?us-ascii?Q?ASmjr6b57ryG/stGR5ADTFGFA0asZaPqknX1PHAqG2LrGHwd3ZfMXHfNl24d?=
 =?us-ascii?Q?7OOnpqfivcoGdLzG1BSkEp63GwOnUvpQsPZftxE1xkUYkhj/f4m+YFDCfYmL?=
 =?us-ascii?Q?eUz+hHpbu7GTxtZ2ELIDaLwNYEVLxGGQwm+RVN15dJYuLh2ZDuIb1hDHoVVT?=
 =?us-ascii?Q?onGSjEB37d15s1BAhXmwervhxLH+s6g6FKy1rN9dzX8/kOVxFV2hDuv44VVo?=
 =?us-ascii?Q?CGtUewxXrvBKe+uU5XCVlUEQF3N29EKRp7AHxrJCPdmJ2beZEMwG59GT/f2u?=
 =?us-ascii?Q?eCz90FoLi2Z2gp+rhVcBKQ4XuwiQK7sBwVdiaPyuTrpmok4IkUvZFVlAojmk?=
 =?us-ascii?Q?brxAudi/6ZwXoDjymsWTuk85ANDKTLsBtEPK8+SFRZMYQPfNFuQ8OU6rkeDw?=
 =?us-ascii?Q?t8vAZXMSY98cLHfCEy4ta89Ed0hCvvN6jG07Eb6MqQXCcd/Ge2iqdrkgwlab?=
 =?us-ascii?Q?c4mZ4kU+Y9FkDmkLqzGhrGbkDQA7mWB369DIrSi7t0NcLm5qswocwYfhP8WL?=
 =?us-ascii?Q?FBmbGIwTt78UXOM8OR7jv051QC0MuSdWPY0MhKrsR3zlPsWeZB9mY2RdR/z3?=
 =?us-ascii?Q?55eGuv9LQD8QTCfgbnRzNySsxs0VesLj+cmBifASchLVCb4wznqdHwP3lRmG?=
 =?us-ascii?Q?tplUkZsuO+/wbBBoQSv4+O4U9Uh5T93F/K9CML7Btw4LHjwfKmpM+GqJQ4gF?=
 =?us-ascii?Q?gKdqoaJbUM1XVe3vZJOYHHJDMVZcBw5zJi/bjEHlcfxjlNP7xTX9qXmddUmL?=
 =?us-ascii?Q?F6ab9cdHsWQnIUER0HRFMs1vPa3E7USv2Oi7X61pnT7l9v5XIsZVT6empHWQ?=
 =?us-ascii?Q?XMWPYkCwNcx5c5LcM2UH3gRqKG3a0bjSVLdDXrgvi+bXfW14Y5hIjUG3W6BI?=
 =?us-ascii?Q?+uQeOXwpLURkRx0/a4g2wD2cT9FEj7Tsn/u1EllD1vH9FGlCRhEBZS25WyJN?=
 =?us-ascii?Q?1cR4ZTCNWd/UNZ94hpKsj1Msp1TAYH0lkyt1701phjm2YsGbhV7+CMAU0uhg?=
 =?us-ascii?Q?edBWT2TcXRgMMZznfS8toe0XqG1EJSxpwAqF056kaKbJ7aNfh8oRjPVFPmtq?=
 =?us-ascii?Q?uEYjh+g1PE7nhQK6CKhMDV2fpXVf7AsH1/2SHGi9RrMO9LCvKiramzx1atps?=
 =?us-ascii?Q?h7qg/mvGzSvTVVa6hcetHc/pxl1CITYt8+8dkiSvAwBPryuvGjkszA1Cihhu?=
 =?us-ascii?Q?qogzz9urHYVjZlxLFN8LRY+VstaKdu62RX0opwyvgui7ur//auAzouNVgIFT?=
 =?us-ascii?Q?UYeVBDIp0T3xnGCLn+ExuulISTVs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eXXFRO9yglro/wjXsgJ/kUAM7nWdd7NSQUxVwkQfUsIpN0YgwTuiqQje/qSx?=
 =?us-ascii?Q?s0ccXCbZesYQWjoIwnhK2ndPuw20C1bJcFAymruOF08cQB7i1Vx/YEXbubLR?=
 =?us-ascii?Q?ivCq+KExsmZ/3774kwMrhmQ34PKDoL2n+dc2/wT4vM8RsBHHAHhXcg2Acrs2?=
 =?us-ascii?Q?CY3zdI8t2STBhZTFCbH9S0P5LD5FOxBjkn3ebfJvOriQWTXLTFPCa46V1r9S?=
 =?us-ascii?Q?xEW88S/JzOVVFCNnlG3TwyU51pl/Bo6p3JiJVDnsV4CLyeUGVw0AYXyCCjRI?=
 =?us-ascii?Q?AmTJi/ZlJPKTXOjuvJ8bS271Q7Uy8Gh79HP4r6QsBBYKo/HZLJmCZM+Cdu0Z?=
 =?us-ascii?Q?ZRzrljLGj4ermlemFFkDCCh1EVioPj5FJYqc8SXTpTXlj7ZgWNqJnv+qAtPA?=
 =?us-ascii?Q?OIKhKcLN5Wdc3L9pKGELUcJkOK4njSTAgSfdYXdOpF164Afi7YITpJ0GQRPO?=
 =?us-ascii?Q?FiQkYRcoExHMgyAWcGzZVl8rHt5Ik1VGR9UtKoaeXt88CWYR+8J7RpEx7KnL?=
 =?us-ascii?Q?19lz+JD9IchS4mLY8Flsg5eXZktspq1DrxS+Zg2wMpL5ucL7ErtYWWiH5zRW?=
 =?us-ascii?Q?CVFNUJTx/gnnw9PKhn7ifB1hMQsxpcznYBOSUPAe9asuKau1u/u+CgBMByns?=
 =?us-ascii?Q?+bBRUVQ8eOD+exYsskrfcNGiAI3QdRcTZVqJAaeauDWje/TN9ejyq9TRTXIe?=
 =?us-ascii?Q?1zglKh+4j9auecWD2Oxrwm8+FnLdO4gx8p6QFzM6KLrIhHhmFm1BxC4bml8Z?=
 =?us-ascii?Q?DYPIh5LiCJOOzeb7E6WskRNy6J7gqZPV1oYLkAKuHAwcXNLdYcGPapB2PT8j?=
 =?us-ascii?Q?MmuyqYjtLlHx03UmAxVEO9mIwfGFRMQ/R0pJhC8dSM0enCWADhiCkSUN+9bx?=
 =?us-ascii?Q?dV92lvmmm621M95LvFy8BESgn8K4kQAciTssVyAYFaRRisEVbO0TlI+czluK?=
 =?us-ascii?Q?+dBWNU51e1buxXZwipbN7Lv54oLQ6s2g7mzZoq5zRuZDyJHKV5YNF67pAroD?=
 =?us-ascii?Q?/DXE+yP5wvVjNjDhW0sI7B01UBN3kRFwLsND1IaVqTluLRh8KvjIe67m3a4Y?=
 =?us-ascii?Q?V1xkuzV/SA32Hpf6DG722wd/x2S91p+VCnYbGT1rBhfmWFfr4/iTZoJ0hViY?=
 =?us-ascii?Q?rf8YYR24rWK/Y04AJ+eZBgidjyS0MjCF6FEVwG+SOKjShFtFrq1MaYe0coP3?=
 =?us-ascii?Q?vn2xkzHWCRxZWpYigsJbgdBMj6XxkTLKpI1SiXKMvk7BCXwrCAOgNZCEUP13?=
 =?us-ascii?Q?qRfMlvwsBec5Zz4nk5LkHf8QsvusjcJqiCE6ull2E8z1X0xRKN9hSVAaPc3/?=
 =?us-ascii?Q?WeYHeiUnvPnUUBaNKLlF1BZsGcSHz6IUewEPemp6DCNekjdKElFcK+jq8hvC?=
 =?us-ascii?Q?638zR0UWdn7xYOkPTJ6dtklMBJVp77NTafIBymn0tOvw9I0XdzaEUZ96ZIhJ?=
 =?us-ascii?Q?j9k/ptcIaEIvaiqkXtGNpCUgcDPk68KOk+821V7R64fUK0hiTAXH9V2etvI2?=
 =?us-ascii?Q?wvJ2Z7/1/xvzxj1UmsgVP8G6e7ztZmSCZ5xZSQXZKwFijcezibo5isqI2jOX?=
 =?us-ascii?Q?abfHS7UKCYrNDG0/S51lLrm+cqxoni4N2nvYXVzCs8GrOhBRuNU1rfnOvh6U?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xONGhKiHZ9IaEVM/eQLN8Y+RPClzfpnwjzGHo5bn//mS8UgngoByOuZ5HrjxUdX8FnRBJFDM8mIXmKwtQepCRuZiCSRf9AfRWecZFGGnjSpvR83BuG1DoEzixKD3tUE/n1ILwpVTDe4begIA4xZX4QZGdDN5xcHUK8jtqvVqZQXhQKx/4J/fMBDStnnAboZmXYJjZf0G28FoXVFqpAqQlQWhk97MDFl/cA/FaEs/BcSQFwkCzOPqgN8lVB5+TfTMZnIjnZKkl4W1BGXR/Basr0H/TrTzL1+4UOZh0fnAl/XtrYRrbNJyHq5qmgatboHwbcH/9O4RCx6tFVLJFo1W7SIdRe5xC+qR0Uf9vEiZ4ejIT2+lz2yIKmodfXalWmJfhbDVd8PsW3bHGuZSZ+c8/xSzoAiwmg1F8WkXJHmnUEj29mndYc77xpHrD2kx5dPaSGNLrNPx8EH2MaWUARtvwVzZ7+NonGZYzWQiivp4EcMH31u7n0paaVJB3CXdxAZvfnR+D38F15ccap4E5O/3P+J9MZ/gLlu4HQB+VQBHGe6nUN6YN+h6RYb7rV8blubLEpsObXtWMjKwwSxeuF3PQoBm3tf9ESRZ+FvkvW9puNU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b445679-e59f-4a3c-e847-08dd703715a5
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 09:33:24.6617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpUcS1DRlr9ONjBVjFDN4i519F1REqfC61G9H1X8uXFEp8T6etbE949UDOUCfKgRhYspDT7stoj+5Aha7T1tZT9uARsjdTcNX7UoNUUO7f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4475
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503310068
X-Proofpoint-GUID: m1QuazkbaBEweCVaMTZZZN6kChTbtbul
X-Proofpoint-ORIG-GUID: m1QuazkbaBEweCVaMTZZZN6kChTbtbul

On Mon, Mar 31, 2025 at 11:13:41AM +0200, Vlastimil Babka wrote:
> On 3/30/25 18:52, Lorenzo Stoakes wrote:
> > On Mon, Mar 10, 2025 at 08:50:37PM +0000, Lorenzo Stoakes wrote:
> >> Update move_vma() to use the threaded VRM object, de-duplicate code and
> >> separate into smaller functions to aid readability and debug-ability.
> >>
> >> This in turn allows further simplification of expand_vma() as we can
> >> simply thread VRM through the function.
> >
> > [snip]
> >
> > Andrew - I enclose a fix-patch for the issue kindly reported in [0] by Yi
> > Lai. Since you've not sent the PR to Linus yet maybe you could squash this
> > in? Otherwise obviously one for 6.15-rc1.
> >
> > I've tested against the repro and confirm it fixes it, also the fix is
> > 'obvious' as is the cause. I have replied to [0] with an explanation there
> > also inline.
> >
> > Apologies for missing this before!
> >
> > Thanks, Lorenzo
> >
> > [0]: https://lore.kernel.org/linux-mm/Z+lcvEIHMLiKVR1i@ly-workstation/
> >
> > ----8<----
> > From 3709f42feb30e2cfe2f39527d4cd8c74a9e8b724 Mon Sep 17 00:00:00 2001
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Date: Sun, 30 Mar 2025 17:20:48 +0100
> > Subject: [PATCH] mm/mremap: do not set vrm->vma NULL immediately prior to
> >  checking it
> >
> > This seems rather unwise. If we cannot merge, extend, then we need to
> > recall the original VMA to see if we need to uncharge.
> >
> > If we do need to, do so.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
>
> Can we get a testcase that hits this path? :)

Ack, will add!

>
> >
> > ---
> >  mm/mremap.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index 0865387531ed..7db9da609c84 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -1561,11 +1561,12 @@ static unsigned long expand_vma_in_place(struct vma_remap_struct *vrm)
> >  	 * adjacent to the expanded vma and otherwise
> >  	 * compatible.
> >  	 */
> > -	vma = vrm->vma = vma_merge_extend(&vmi, vma, vrm->delta);
> > +	vma = vma_merge_extend(&vmi, vma, vrm->delta);
> >  	if (!vma) {
> >  		vrm_uncharge(vrm);
> >  		return -ENOMEM;
> >  	}
> > +	vrm->vma = vma;
> >
> >  	vrm_stat_account(vrm, vrm->delta);
> >
> > --
> > 2.49.0
>
