Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF28119E7D0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051875; cv=fail; b=jgUko+5ZMvO+s8o3qcs67Ai0JmGwySvkcdWJIpA6h1p/+5ahal22qzcAmT0ZZ70JenNABcW4MQ54nM52E9l7maEc1/T4SWcYYvSNlmbJJjL9IhVumcgqzU0DY7LpxLXSI6Fs21YjUVN12Pkq+ITM6YmCjFnPF1r8INmUGbx3vdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051875; c=relaxed/simple;
	bh=M3uUVtLcxUskCKUZSzlaK8VCNAN4T74BkRZE4l69DUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QkmXLuVmuGtIWrlL3j5ZOj9YlBoAQiEML0+QmqmV0sd/xccxGm23uPrpbsW8eh0Di3WHTN9GkBx8ABJrNw4cUIIWkYMMmv01wNkjIX91zSLZvK5vRcmvFgwwc44Y5hQSNXJSNFnLnkJeT7OJb/K/KQ0LZcCTaz8/Pf7DLVWd6M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k8fqU9it; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=va5v19+0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k8fqU9it";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="va5v19+0"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554FduD0032152;
	Wed, 4 Jun 2025 15:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VgggKxPv3yJiMqTRcB
	OxCfYK+zgdKecMTBW/UUeFy94=; b=k8fqU9itgb6CVFK2VdR3jfh10Xw61Yi6qn
	r55H3zdmgyGoOTmgxiAYK2a8ti8SLmMA+guCfsG5lo4Io/CHKkqd2HRAWmtIWKfW
	Ozoh9kb07udC3HY9uAyfWDffKgJ5FwfQROxlb6c8Jr598CDBhSma5LfaSlBFz7Qr
	5hnn22UykowQpcc373S/cSRrhYXEJelIA9clB+wEkkM+OKyYsbQU2H8S6b5wpNId
	TH3s/rGUDn/YgRKKTlNqIwljl/CyUJhovZPZjvoxk0xEEl3X6h1a9MKgh1UxjoF5
	n3DYwY8jqUeQTmOh0DXeHZuupUtgg/e/UViw7b4fSl+7mors7b3w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dvbks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 15:44:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554EdKm7034835;
	Wed, 4 Jun 2025 15:44:18 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7b5ytq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 15:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAUEvOqAn2O/vGdqKv4zd6ljhu8qGrzUdcTUQEEuFfHF1Uuf0He5QK8L4x5yxEdWsy4GVf8Y2qsHVL//gVHCUr4rHqEKTyXkKgBf0DejU+HmpZ0g3mDhvzblPtVPixyjSEfsoWRWIQcMirWsCyELJ4uGCTMhlqOLRa3JYeEM5tvD+jb9F9mYCCr0AdkyEMfGWJuD0KXsfBZ+EsTZPweKzglJmYvCJe2y7FNzpZJp3rt4pR9z2b8tllqCWB8s6ohznhzEanJsjkiNZ+Yh2j7q/+XIuClnZhW+4tTo1BLdcJR8ubzFCUz14m0VYY9hWXrGGgJPXFNb3GuQrhgrpt/UYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgggKxPv3yJiMqTRcBOxCfYK+zgdKecMTBW/UUeFy94=;
 b=fhscMqVPwpKh7qDaMitJ8h+allKDmBzhrne5OJrX8wk5B4RQt5losd0Od4ON9Eu/PF2VxahXeldeeif0zWsR74Nb9587+reOsNPuXoILSGKzoyONmLYiULYmTUHyYWU0q1xti+pzkCRCR5rcR8OiTmTbiqJy8wwgaIUDlVYfV6XCtIs4s8L9PZVyRtkKLn5FiQCj9D2sXAXfqb1kXwqlb89mrBVd3YtxqqY0+4O/VDoLRi+7Ugm+BiIsXX2eFwaRyKqYMD34XCzaH1B0KFKy1F0YJ+xxJiwgrSXTcOYy3SzaKzj+chM/zgcbmK4RmFIMTm3nVuBp9ehRLjo32PMoIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgggKxPv3yJiMqTRcBOxCfYK+zgdKecMTBW/UUeFy94=;
 b=va5v19+0RDCeJ84zsb9xcq/TBf81KvXunXUu67StjSyGbHPIBju6O9hldIoWYR9++Aflz2gPktOwJR/5dah02x8/qjNDSn48tyl+mZdjnt7JM4cMmJdfqt3+hfiTzCeDrbQVSHqpm/FAeMUmNjtCcASkw2hi52qghBCJbd+Yc+o=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH3PPF18C4487EB.namprd10.prod.outlook.com (2603:10b6:518:1::78b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 4 Jun
 2025 15:44:15 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 15:44:14 +0000
Date: Wed, 4 Jun 2025 16:44:11 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <8fc9b4e3-55d2-48e2-a9ad-4f21dc283f35@lucifer.local>
References: <20250604140544.688711-1-david@redhat.com>
 <fb548cd0-4a6a-4e90-92b8-24c7b35df416@lucifer.local>
 <5575b0cf-de59-4b4e-b339-c310f079bda7@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5575b0cf-de59-4b4e-b339-c310f079bda7@redhat.com>
X-ClientProxiedBy: LNXP265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH3PPF18C4487EB:EE_
X-MS-Office365-Filtering-Correlation-Id: f316265c-fd50-419a-6c4b-08dda37ea88b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B1CPJ3ZQ2rmXd3iV6QxHhwa5hklMSlaeMbyYq/rKmP0kMFtd8PIv3dl5jtX3?=
 =?us-ascii?Q?PfLPZleQd3mq0cp2wC6UPp1VAcu6CC7S56+AjpGU/u0vNAlY4PKgEwdfOJcL?=
 =?us-ascii?Q?HhG8ewAx54aFD3mEVqLHrkMsuj9zEGLi/Ki+UIIKCTLJnP4P8KL8S6GUS2z/?=
 =?us-ascii?Q?yYEqpPU4YyLbk3Fq9wQdDF5ymLqU0N+/ExeokoQbzS9beWIMyOcQKl9xgmCH?=
 =?us-ascii?Q?2tP7tqY2Gq08f8dP6RI76YFZH9+6qYLNdjfEoKHFwSF0BpNJS6H263iJYLr/?=
 =?us-ascii?Q?3mRxwCzx+oQofqhroAFm4UES4qFjizIk02t0c8NwDvnIHJVjrdZfeF8WwAuG?=
 =?us-ascii?Q?Vr03DZc0E/WfVjL30bRTYGr6r0BPz95s00J86YKXRm1wxwmrYzFoDxnnIIPf?=
 =?us-ascii?Q?M4zxlcjz3e3aFx+NwUIQIHv5Gh7gt2/R7UYXlSw3EGDxCm9JE6q9JhV8enuV?=
 =?us-ascii?Q?/p4fxV3bBSDaqv9lMwfQwwi6SQK/rUwFsVmRr1r6+BO0TZPZTkCHFc5fXqgm?=
 =?us-ascii?Q?CLR9sotz27O85Nw8HDKSDCGzEwE7n/PdM04B1xDjbaF/0utF79ElErAzD41G?=
 =?us-ascii?Q?3BEM3F8FS72MXzbYGLG48waelKszom30lL1JxoWb3F2mr8J1X9dH65wU2Hmo?=
 =?us-ascii?Q?10Dd9VxlfXEGOxLNX33Og/M4oqgroTfxsY/f5uv4yX3thWC9tsvU5Zzlysl5?=
 =?us-ascii?Q?qxgt9aMzo0zoZobHN4LBi8wdZTOVyw4+W7psxh33s//lQTtCCF4mkGxPlFyH?=
 =?us-ascii?Q?aT4ayDx3ZHc2mmE3d3/1pMxMx9Ml+hD7hugm6pYcp6jLovTw0cdy44PIdSdx?=
 =?us-ascii?Q?kPD0b8TnVTwpcoUxSTrdepRrkY7FL81AZEW9b4qircA9UJX85SnUXXwtvF6V?=
 =?us-ascii?Q?R2ZdEBzr79WhQgufTKF1zN4jzgJojXsreSBwdl/b/Cvoa3JrQxmal4WoV7TX?=
 =?us-ascii?Q?wgSaRZiDZOMzQcnwoMFYCTfHMN7fMvj7+7LDKEc0u6rCmgEb+ErgdYOPHcD8?=
 =?us-ascii?Q?r51N7j+zAtzj7xZa9Prh908Di1Rdo9ayFamhYGOvqsCCIdx42/5eqnuDYHg9?=
 =?us-ascii?Q?1/rFhl81k0LJ5iF13eWJbtud2xDsfpT42nTm005TEJ2E6uBJdqlDyh8vCvV+?=
 =?us-ascii?Q?PQQDFyoyV/p3npCyykDW5pATEzTRIMXQW9Hj7mSFpdSTDv0RmmMNsJJ2mvGo?=
 =?us-ascii?Q?KfSd1tMTCIodBHYiPVcN1dfdHuj7YMvgi8K7hC8xSKRjSO/3FVjDoOls8v2R?=
 =?us-ascii?Q?/HVcH1T+mLIS9ZVyuZeN9h6JhtgPSAegzyhSJzl5cro3iA1QjP/60WX0ejLP?=
 =?us-ascii?Q?9qWOe9edkZU+FJF6GG8USy1FpvmH+xCWKxjcOezxj6GVRviZUgNqgKS3bgs/?=
 =?us-ascii?Q?KLj1f6SHpgVVOpdPgYyODw0toBObYHLFeNQDHxLH8j7ipUGm29QOhsNxnNsG?=
 =?us-ascii?Q?3WxLyH6w5IQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WVSaUBpIZEyUo3N1vfVqdMEzXDLFxNL8CdzSAqu788h9wNNO3jiCpqcfhk7K?=
 =?us-ascii?Q?iLZz/PcWXKopLt5F/RKwaHUXcYTmXw3XDcqx8yF93IZmS0Jwo4KmM9UKIAOW?=
 =?us-ascii?Q?UzFRsgX0riadXOLNxUzOJI8Vey+cCnU3rqE8bF7uCvpgRxk+CiP0AmFrfPB7?=
 =?us-ascii?Q?0yfoqEImvnhji9hdnNd4V/i2jHZbux6YLL5P5p9vDUfC2E2/Ih5+ibL9pakx?=
 =?us-ascii?Q?wlq5d7LHXaqzseDzk6nD6np87cJn6PPD5pbdtTBgIc8tqtd29rLrI7d5iIDl?=
 =?us-ascii?Q?YWq0LC8YyYINaSMk3HNzp2Vb+80E8OrWEYn1CsvC6bZxRjvaDa5M2V3XD8Xi?=
 =?us-ascii?Q?Xijm11laK4oQgjOwShhuyl1xo23g4qg1aLqj9COHnFE+z2hyBlGHQ8rlj4H/?=
 =?us-ascii?Q?jjXsN6JL7OKdKCF4PPOAaUu7pl5Ce210oIcz3wGH9B/OeEuR47WElgIMdxHf?=
 =?us-ascii?Q?JxHhPz6+fVVJDAlvRTlMmmuZ/0Xvsvie8WssasEEVJGyRMF8h1H3s85nfm1h?=
 =?us-ascii?Q?IIkw+juGvWAym6qkOyaD+R40/eo4rvrU8N2LbWOYYCC59fxXDmItQpVjFe2P?=
 =?us-ascii?Q?3zapSDlVr+Ie0WStI8OFo0PJrvccLVEjWsLSGbMgLdN1Z/Ui+PcY7DEdgdsQ?=
 =?us-ascii?Q?zpMHdHMjCTe9YUIvAiO/j924cENSPJJHVUGG5HLcMH2ZCjXN4gca82AwmaZT?=
 =?us-ascii?Q?ZN3bB/X2ZnQpbJZPE+pnVN5JBgAbBGHpVfbZUO741xfvtUuB26o+Ba7ASHRx?=
 =?us-ascii?Q?nX8zAQKBocXJEp9aes98k3FVAHsamk0gvUhd4D2Tv/pVEciNdJojoCMkRoxd?=
 =?us-ascii?Q?9tXB6QSVoNKSBOvA8PH4u23u2hHF161otgxUjLPSiFD+a2XpYKv2BfK6tT06?=
 =?us-ascii?Q?X7c/gQ0wStiuQWXBBPT9CZ0X8pONCecVzp+ocsQ03aElJWKE3acSUG3fcONy?=
 =?us-ascii?Q?1HCmv3oDe1vLcbdNkBtJ2kjw/OjS5zd0XVBMOEehlWmYisBukXLh76CHM2jM?=
 =?us-ascii?Q?gDYVpDIrFz8EQkWQxa2sm+M5Wn+WoPLLKIQfbF2Xk/ZcQyRWSTf1vZrs+mrP?=
 =?us-ascii?Q?DK6fLo3yz+qTDal3F6nvRGJ+AOVZtS+yImsO2mBgmhjseg9HLDcKdnDripKJ?=
 =?us-ascii?Q?BSIotRS60ltROgnPDusEGj9o275bdeIa9uFgWTfVZMq8djWPBU0Bb9gVZyzX?=
 =?us-ascii?Q?1fyfyUD22lvI/vLjMM21poMwv9+YUTfGiR3JWqLvGlqCbQPew9cbT4/1Y35X?=
 =?us-ascii?Q?NKYBGP1IzU9EbMaze79ieH4ZCa+zTn7APZ6KRb2v8+XDtuB8B6D/HZibUnmO?=
 =?us-ascii?Q?XM8stOhBJA3zlPClCjs4e7kwyyKoWqejJuN/TEAMlxn5HpQx0/bQU9CKBof+?=
 =?us-ascii?Q?S4rmvTWCsY6no9TOZTNBwx5HTGUyOf5pYs4JiHP2lr+wI585F5No2ZRyXSq2?=
 =?us-ascii?Q?y+URqyhYQpHZM2gS22FmKvPx25eYet+AjrTY4q3aVrOo5KN3k7473gY7BlBL?=
 =?us-ascii?Q?iHSm96wWK4ozrerUOgJj3YQpePto/ELYbSL2gCBtmcjj6aP4SWV8Yok/nxqK?=
 =?us-ascii?Q?aTaC6QsH0a/1lPVqiS/UPGDWsmAM6F6v3aSUc4AjpbdsY9m7yskTGHULeMr4?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vZfqAO0GN9/o/126dA0fYcT5p5oBlkg2P9fakKTN+UXNX77hk4F+S4XPqEnTKaVXDSCDOxhvbH140VpfL60T6b2uZLfF2pdxqs3O+4PITOaTTM8/L77bOvIK9Ff4TPAhlNha4xCZfjV4rivaEEgGtlc29rlouf5OwzLuVtAA+1e4fZfTrM5sF1B16zHjvFfSUB3PIHAXoAbMqfdB729TDdolLSH3IsNIGC4KSh3RZvvjV0XghP+cBEujqb60vKiclQTAKMwlFclLMUjFdNmdB/75vDVJGm+X6TdmI7ojYLw7bdRJlT5DCfBfaFKbPYllgyCSDfKZ+8uJ3knkg5eKwK4/QE33NnMP8mk+ICxPpY2U/rP6O+KSO6jhN8a441V/3ccAA4F911xya0Ecls+Vf5FrS+u0NZnOxl4Z6fDOankW++UmN7hG2rXkcRh0hQx0whcIMFPMdjkGB/pe5I5WVUi1hStQOzgh3ZKs8417qXkbnglXuRNIlNjMVk41ywY68fcyVhSl9Im2Eiqx2NdQuP/xmVptvmySQk2sBSe01pE4VXbg/6Pclef+ze/k14jrlkZ+bmRghatYSUWON1vLQUIoaXVze4WgP0MdfFW/e+0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f316265c-fd50-419a-6c4b-08dda37ea88b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 15:44:14.6974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQiAzbkhwOXE6G5O4sSjCATpWdC2pzCl57s4j8d0GCx79jMlNh/aRYYdcn3s+Pk8PD5qgCtxotchqpBKGtI9dumIP2QqaM69S5TEIlvojZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF18C4487EB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506040119
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=684069d3 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Z4Rwk6OoAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=iox4zFpeAAAA:8 a=9jRdOu3wAAAA:8 a=Ikd4Dj_1AAAA:8 a=20KFwNOVAAAA:8
 a=IiUBJ2Na09XcJe3L1ysA:9 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExOSBTYWx0ZWRfX6YkH5R+O+db1 rLiXqv52Mmoq6wqV43o2RxOfCjBCEYweZub/KQwDiS3D6aoxOHyL8lhLigcSGDCl3HUV9o/59My swNNdBHNrlkNUrN1bwslGDSMwaJlhC3oX+O8MaZLt6HOQALDLUV38Uc0PXeb/pwLWa7EVrUjEJQ
 7siHV2JeXhY6SzNZPanFh7CW+p7GJVs+ko/3KTD4aD8QbK791AbJaY5G46C+UWAegTvkbIlPYQc 5gitXr/t+LhgQa/qEZWWuXmfpV2eyWuC1vEwSPcA96FXEhKaO3x3Hoa7QJSMMO5RDHOLGKH0oVF hj1++CB4G1dFUj5D7EEz6SA9kbrTnv2QXIvAhiMh7KxJdccYu2y+cfL1+xlEX2ff3vaejQlWKXP
 nqE+iYXJYc0OPWWtr+IugxJBmi8Xp7BLbijCo4iPCNua736B2prYQLE//qWHWCc9bahs6sN5
X-Proofpoint-ORIG-GUID: 69ftFrZajoV-cQnOXkQA8K2CaG_cNBvp
X-Proofpoint-GUID: 69ftFrZajoV-cQnOXkQA8K2CaG_cNBvp

On Wed, Jun 04, 2025 at 04:58:25PM +0200, David Hildenbrand wrote:
> On 04.06.25 16:48, Lorenzo Stoakes wrote:
> > +Linus in case he has an opinion about BUG_ON() in general...
> >
> > On Wed, Jun 04, 2025 at 04:05:44PM +0200, David Hildenbrand wrote:
> > > Especially once we hit one of the assertions in
> > > sanity_check_pinned_pages(), observing follow-up assertions failing
> > > in other code can give good clues about what went wrong, so use
> > > VM_WARN_ON_ONCE instead.
> >
> > I guess the situation where you'd actually want a BUG_ON() is one where
> > carrying on might cause further corruption so you just want things to stop.
>
> Yes. Like, serious data corruption would be avoidable.

Yeah, I just wonder how often this is ever reliably for sure the case...

>
> >
> > But usually we're already pretty screwed if the thing happened right? So
> > it's rare if ever that this would be legit?
> >
> > Linus's point of view is that we shouldn't use them _at all_ right? So
> > maybe even this situation isn't one where we'd want to use one?
>
> I think the grey zone is actual data corruption. But one has to have a
> pretty good reason to use a BUG_ON and not a WARN_ON_ONCE() + recovery.

Right.

>
> >
> > >
> > > While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> > > well. Add one comment for the pfn_valid() check.
> >
> > Yeah VM_BUG_ON() is just _weird_. Maybe we should get rid of all of them
> > full stop?
>
> That's my thinking a well.

:)

>
> >
> > >
> > > We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> >
> > I checked the implementation vs. the other VM_WARN_ON_ONCE_*()'s and it
> > looks good.
> >
> > I wonder if we can find a way to not duplicate this code... but one for a
> > follow up I think :>)
> >
> > >
> > > Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> > > something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> > > VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> > > happen", but more reasonable to check for during early testing.
> > >
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > Cc: Mike Rapoport <rppt@kernel.org>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Michal Hocko <mhocko@suse.com>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> >
> > LGTM so,
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> >
>
> Thanks!
>
> > One nit below.
> >
> > > ---
> > >
> > > Wanted to do this for a long time, but my todo list keeps growing ...
> >
> > Sounds familiar :) Merge window a chance to do some of these things...
> >
> > >
> > > Based on mm/mm-unstable
> > >
> > > ---
> > >   include/linux/mmdebug.h | 12 ++++++++++++
> > >   mm/gup.c                | 41 +++++++++++++++++++----------------------
> > >   2 files changed, 31 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> > > index a0a3894900ed4..14a45979cccc9 100644
> > > --- a/include/linux/mmdebug.h
> > > +++ b/include/linux/mmdebug.h
> > > @@ -89,6 +89,17 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
> > >   	}								\
> > >   	unlikely(__ret_warn_once);					\
> > >   })
> > > +#define VM_WARN_ON_ONCE_VMA(cond, vma)		({			\
> > > +	static bool __section(".data..once") __warned;			\
> > > +	int __ret_warn_once = !!(cond);					\
> > > +									\
> > > +	if (unlikely(__ret_warn_once && !__warned)) {			\
> > > +		dump_vma(vma);						\
> > > +		__warned = true;					\
> > > +		WARN_ON(1);						\
> > > +	}								\
> > > +	unlikely(__ret_warn_once);					\
> > > +})
> >
> > An aside, I wonder if we could somehow make this generic for various
> > WARN_ON_ONCE()'s?
>
> Yeah, probably. Maybe it will get .... ugly :)
>
> >
> > >   #define VM_WARN_ON_VMG(cond, vmg)		({			\
> > >   	int __ret_warn = !!(cond);					\
> > >   									\
> > > @@ -115,6 +126,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
> > >   #define VM_WARN_ON_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
> > >   #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
> > >   #define VM_WARN_ON_ONCE_MM(cond, mm)  BUILD_BUG_ON_INVALID(cond)
> > > +#define VM_WARN_ON_ONCE_VMA(cond, vma)  BUILD_BUG_ON_INVALID(cond)
> > >   #define VM_WARN_ON_VMG(cond, vmg)  BUILD_BUG_ON_INVALID(cond)
> > >   #define VM_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
> > >   #define VM_WARN(cond, format...) BUILD_BUG_ON_INVALID(cond)
> > > diff --git a/mm/gup.c b/mm/gup.c
> > > index e065a49842a87..3c3931fcdd820 100644
> > > --- a/mm/gup.c
> > > +++ b/mm/gup.c
> > > @@ -64,11 +64,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
> > >   		    !folio_test_anon(folio))
> > >   			continue;
> > >   		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
> > > -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), page);
> > > +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page), page);
> > >   		else
> > >   			/* Either a PTE-mapped or a PMD-mapped THP. */
> > > -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &&
> > > -				       !PageAnonExclusive(page), page);
> > > +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
> > > +					     !PageAnonExclusive(page), page);
> >
> > Nit but wouldn't VM_WARN_ON_ONCE_FOLIO() work better here?
>
> No, we want the actual problematic page here, as that can give us clues what
> is going wrong.

Ah yeah... didn't notice we're checking both folio and
page... PageAnonExclusive() seems to be a weird beast:

	/*
	 * HugeTLB stores this information on the head page; THP keeps it per
	 * page
	 */

But anyway I'm digressing :)

>
> For the small-folio case above we could use it, though.

Ack, no big deal though.

>
> --
> Cheers,
>
> David / dhildenb
>
