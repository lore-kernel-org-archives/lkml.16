Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCA1217F34
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750174027; cv=fail; b=qb2eBvCWC17sg/YgCw2Dzx5/O/ixpKgHvUxiqmaPeQr+ZHT0BR/DKtsFp5WOk8WwNaMydlfCjURr3L0JpgStLh9Fq6oU8j0S7sH6fsl84ORH6IPXcea1AeqdrVHMN8ty2cSMp+i2Sv8Phc9PIfVGhXLx+SGNGBAPeqka7vvHlqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750174027; c=relaxed/simple;
	bh=TPbEW3RcTfV9c/6tBa9bAKfDBMHP8GykStWPAaSG1ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pbwo1W0ONy3iu+OCPS+3EhB0XASIvro2zIFOJ9dlP93zgTJiq+fvBdjrFWTEXLd0JszTSvOqMum+l0G96OJe/gbNe67wEn4BhrfnkdaMFo3Ok1wnNkj3kyZUry6zNy7gbEn+BX3ovVTdCLdlT9cS6oM7UfJy+5QuI/f7IMj/d3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Aek3QT+K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Kkpciwne; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Aek3QT+K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Kkpciwne"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEX2mB010420;
	Tue, 17 Jun 2025 15:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Tv1KHGZ7cgtyxAEPTh
	s0dIBNmFXLciEPqPuI0YaBAE4=; b=Aek3QT+KC5rbWYr4JzFmoGeZMspD8eBodG
	SXWDs5cCMX/UKmGeHF6kYHxMX3BTVc30QGEWOsJXSP5zgaPIDdBtBubYCwHbuLT0
	Rd5vOIGs4eKKvSdVNJr78sXDVsASb0gnrn89pAG7egG3dZqLockxGENTYcfhyQeo
	fBZ6A7UqjO4uutMyyUFcO2T5B2J58M3ZvFVzAc7WhvEb2wCUtTF1sAKz7angg1Cd
	2MwbADNbq82lThBw1lrVrTK/azWofHSuXYXstjT+L7N3bADsiQbEGhdyv7et1E4o
	jDpriCzDaK4DWsm28JkOPDMY/sBZVS4OWR8I7rtZuPEpiIAnzyJQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914enhgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 15:26:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HERq5J000818;
	Tue, 17 Jun 2025 15:26:52 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh9cw3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 15:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDlr/z6J2XpwS/mrglTADbrWoxT/BSlvcLYhKdDbMteM1ymfvRqkwj49qrE1UKbwG9JbFVUm+Sg0Yko7T+Jbu4WD8V6eO26PXIWXSnEtj8Dftge8Hss/eYiNlN5AKa6CB/f6v7tqpX61jcxyHlr8N3CMw7DFboty5pEjeS233xEZVAoCfEN/m7MMv8JhdgWDxUJ8tkG/r0jthyeZ++meOGtd/XIGJg78Xqe5QXx/+0oL6JWDUhbq0660T9UROvEueXtzSejq5g7O0f7OUm08ILgmRMUFdI2IczVTufCEV6FBi4AV0JSSJ0+2OtLuIjArB1DWfgN9AL1z8VUYv8ivRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tv1KHGZ7cgtyxAEPThs0dIBNmFXLciEPqPuI0YaBAE4=;
 b=dzBP7OmBXHim7n0BGF/gP4Vvh6OkZMw95NkaNALiXvy5eSeP3QPB37JP/v9QwKZkBR4O+qLVXO08FMZe3Sf/T+iWk+sEzUAOK/Yny4i1OhWTfikKMlU8cggoLpM1/0sqCIv2VkbXFOtWX6uNmPmSo9DaUz7FOPG9NkCssIUOFUY5HxGsnOoFoQdkE7w8IEKX6piqhh9h0gqcPZRGE2QxXPTV84MOZG/njFgQW/G+QlBuFYTfXVM/mNP0A55cXY1fNZs+C3Yr1EgHZw+gbYk2zg8J9sXuL4nmeZ9vd7CWELh542TfDFGEfERt99JdppWgAeQv51Tdixr3GLJ1/DSgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv1KHGZ7cgtyxAEPThs0dIBNmFXLciEPqPuI0YaBAE4=;
 b=Kkpciwnedk9vTLNKB+kzI6BdhwjJAgg0fEG3/llEf/Pd3osiZ3uE3EJhRnhCEjTpQMRj7UEdd7bgPJU87cgivoEWb0Xtj94znjmMOvt1BFeIfERiCECjDbMQdDVk7UWbFwhwbdgZZX/HO3EoHmxUcxpB2UgwgwN5txInpYOW3QI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 15:26:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 15:26:44 +0000
Date: Tue, 17 Jun 2025 16:26:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
Message-ID: <103db35e-0b7e-425c-95ca-90be6c574312@lucifer.local>
References: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
 <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
X-ClientProxiedBy: LO4P302CA0001.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecf213a-d6a9-438a-3e33-08ddadb35dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mjunqtMznaeewbklbDm31X2oewx0F+96zYsRmDkBAR20upMuOEQFEI5Jd0NQ?=
 =?us-ascii?Q?ZAWqQyl/2GKajLuIgazTO1JHElIs0jtmKoJxQ6QwMLqDdtuS7SKBiH9IA1qP?=
 =?us-ascii?Q?TfnQ/RNzw7aiIramOibJj4JWoTjmW95WKEYwMiGhSTKCLWNvler5DtklUrmu?=
 =?us-ascii?Q?5PbTTGEwQMgYPcGR9cbDNWDpu/7NS8vTXc3e1Q1TjG9OsDQTCQVZW/JUpyHO?=
 =?us-ascii?Q?cB1ZA+VtodbSpHc/lMkteLPgMMDMqPhrdONCePSAbhLku2XGQisaZ5ypT2V6?=
 =?us-ascii?Q?dvrQ3bIwo5tt5OwGGncVNrMiRALqrsR5YlFLoDCinZar6VibRrQo8Ix+xggJ?=
 =?us-ascii?Q?9sL/FLQkIZrXDEXYaHCNytVDcwg0BevBDkB6MpAVLcw33wHKREAUeaAT8jBq?=
 =?us-ascii?Q?F4wxihbAXRAqpm8xxqNPQQ8UhZSfj8t7VFiA4VGohLHfK32m4eQgFkOto1A6?=
 =?us-ascii?Q?PIC0FgkzhqAy+DohAcQmyuSBfABil/oLl/HZivFTv/43tPmGa/xlOdz6YrUK?=
 =?us-ascii?Q?6Zhsz+7JJwmnZ/aM/nRs8NsjDl2/arVlTC9AP9Thejz3RE9p8toz+Gyhf91a?=
 =?us-ascii?Q?5xBRef6xyJoO60Tw39AnE2oSYwg5vbXXW8W6RJSMowTbMRhivDNvkGEowccG?=
 =?us-ascii?Q?8LA2VXk9ahs0YMcnLOr3ZhWWmhsYRsdzsJEqVqqIi/UL0YilE1lkbQ/5l8sa?=
 =?us-ascii?Q?GSnOWPCzmi3anQm2oX9i6P732qcZZrShb6VhjMHq3DRfISf+D1yYuHR2M6+1?=
 =?us-ascii?Q?C78nyi9DsoZtt1TaAuQ2FA3og4kFReilJMiquZCwZ8n6SO+CK07zxleqdFd6?=
 =?us-ascii?Q?ZXLMgTitPn9wCr7qBDZ06lZizMgJwzgaExa/3TsYUz8/P08qZXcuIJEwiYVk?=
 =?us-ascii?Q?HZgqBUxCVoM/ggueaTzjKLDQ7EqexUaLm1uMDW7bAaPmqk4pIGG1+hE+CWhQ?=
 =?us-ascii?Q?gPUB7R9e5gW8hJPDHH2OTEbXnnpdlWicJESa806IyOSsGuAGefKyLqVcILpj?=
 =?us-ascii?Q?5TlzQcTHYL01EUpeax/rYM0wR51nM0Nn4chnLUr2BIxkWh/DYyWj9/SULHPF?=
 =?us-ascii?Q?emwFp9oHu8iUpMqE4qftPK9ZEH2/S5j66rgGCmffBjByJOuFaFCzwgGo34/W?=
 =?us-ascii?Q?6AY4Hptd2YlE4dToZgTfsYEtMJMFGwCksHdQP20PWWqgF6dVZJ+sKAmmVPtH?=
 =?us-ascii?Q?kWYIxXtKo7WEBmwwefGPj1cX2D/gHCMymCyJ3RlA2vjvu+Xiov/vRNSoWdW/?=
 =?us-ascii?Q?axX/wpv2BFjUNQI5R12+OZvNQsfS1cRRJq4ZSH+oEQCQccIsYfLjwocqvHtT?=
 =?us-ascii?Q?cxx3p0mwSj5Gb6sdt+Y8Cvkp9SVbZLE+hL+VI5q3iPxzkmIFfbOLiTe2vE/x?=
 =?us-ascii?Q?I+Bei5mUgqjC6Qhafjljwkumz1DH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hna/cl3lviLoJbTWlMyBLCRbYPLxgFd/wD0XQK7QiyRbk4PZVaG/91mHvCgF?=
 =?us-ascii?Q?YmEKh4kiwVgxE/YXMiKdz5PsRhmt8bair7KsxGBh/eX1G1E+/IKiZlYrzvaQ?=
 =?us-ascii?Q?tsWd1In5MukNMcBs46aPyH7YE/PDPyZH+/TPhjIVmxOpG3MoYUNH6vxoHj+2?=
 =?us-ascii?Q?ZeAWAoKb82KlvXI2kzwFpXjOZ9vCxRWbBK0XnYb4b3Wy5DpLXvS4bQEH2rRt?=
 =?us-ascii?Q?wcDmn322/p2ULfz4J8xGQCi8OT/Jx0Od2tbH1O545vI/XnfZyzuZ5YbMJi7x?=
 =?us-ascii?Q?qtHy0y3o7UjgIxo117lcQfs8heOXE7HkpUiL9VkCG3S5FDNXp5ZztIZqmLAY?=
 =?us-ascii?Q?eCIhbdVD6zu3hwXkAHkpfqzsXf1Syyg8EOb2/hywwiO+g48gPkfcUf60wzt8?=
 =?us-ascii?Q?EkBJnaY5DkCY/c8qLnT6piHe3keTDVVRvFCR1twBhSqPoPzHo0cGmW7YVqmg?=
 =?us-ascii?Q?EYFgTQL2Szost37S6VfIu2x7pMWA0aQtmSAJ2lfaNaXgxNY2TDMtaGxibxZ6?=
 =?us-ascii?Q?is84eEvL5gHDN9SF3suVJz8QeA4bVah9YBtFg63oSGLWtsQGmjLwWTrzVCyV?=
 =?us-ascii?Q?MMi5et0dm7bXYHLhE89GU6CpLJYGFQSo8V7yIMuB0rmyW4uFFemlHCJsvIIo?=
 =?us-ascii?Q?f0CDHoxIyGHjsuEZDCh1l/RRpu6l7R82RMI3Bf+4fH8F2QSn6sJS7TTZ98w6?=
 =?us-ascii?Q?2WuSYqzS/oDi01Vb2Z/sVtgZNqew6KzfMODuvM7BBeBAhsNQ6FM5uaV4iLPP?=
 =?us-ascii?Q?aPS7N4ukIjXttmn1NmXNY29N+hU7r5+Fw18MxHC7VuEJ+yqJMgEE1WGO4usZ?=
 =?us-ascii?Q?TZ6PmutoKEg2u9zqTFnGtBYn8vp7091PaBnsm3ykjaM2AsS2p2n2PSF/+uhE?=
 =?us-ascii?Q?QXNq69Ew9k0ztwifLyyJZCs9tgV3rPIxm86H5KIGQav9lLbV1vzg3GEDaFJ4?=
 =?us-ascii?Q?ZPke9gKIHYjTybcOnv83JBScoE1BqZu+LyLVfHOp+m1epERRznujOZ1IiLWQ?=
 =?us-ascii?Q?o/u9qWfpZN1tG+XCd3qDz6aoC/dR+GkmCa80ZR5LHYXhV+agVphtuTJW1SU7?=
 =?us-ascii?Q?bjBdhAbVB/hri18g70xqkJsBjc3rSttH+HNpRdE3Qq2Ja5iaXCgEyitVxC2o?=
 =?us-ascii?Q?6NaV3mHoopLltG2DiAiMX2dRZv13BvCA+pbc0uQ6AGL+FWPcPxHuRi2YgzeE?=
 =?us-ascii?Q?oVzvpn6tw4FuuAmxrojitr+ElYF4p6pebA9zF+mufxih7RRk19FL7rdW0gsR?=
 =?us-ascii?Q?lbI5iv2yfxCcWqXeky5pAGM0KeANTa6ORc2fXC/2jEouEy7RiTkYnZkFNASB?=
 =?us-ascii?Q?mteUGBigl65R4zQBxILNjfiNqA8bqDQe6jEZedIC+YLDXefwSAHOjBBGtXLS?=
 =?us-ascii?Q?nC8wnDkd01Ntr7SJzhUOJoxqya8UcavXOyas4Al3vI0gS/43AygO6GT6secU?=
 =?us-ascii?Q?pV1Gcp3sAmXNxD3vju8n0AWRdc2Bmk8/DfyIDIKP2XR9QiMeFPd5sVBns6N6?=
 =?us-ascii?Q?FGVpGmacoSqaiBG+sTDceIwKRbxokKrPR0EZX1eXvYotronu5YZuvpnZssGB?=
 =?us-ascii?Q?upginwNXfzhYLHqM4MLmSyltRT+T+ZCcXSXI0uCM41Ws0m35EgwqbXPqsd9I?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2EgTCcGywn882c0dpwm9A8uy/kjMZ+Bh7AZCZoPdeb+Gatnk8omKZ4MkO0LUf2YCqPx1XTt2qQlf84bgy5Ig9UQNffPaSMBQ8VhVYzkc3z1byexHizkxPRonx9HVi36hF3NX7L3xMC4JiH9w/m2BEpKXioY8YMZCJ8e10M8uFKYbPnslP6se+q3Bp2KuGq07I/RJFQecjtc0J7IQI8JMBUnwYFaQn1kGZBS6smnbuTBuU051ACxZBULptyN8IOiZFfq9JOfG+8WYexTNCK5s87Bym/cGIFIdFHTzrVHdNEu/YS9W9E4M+6wKdCX4x0S7NgRD4B+CmVhCEHdTb5h4+Ph+Xxz2/JVMZQHr6QYAofNa21OpLWPnrNCq8pj1IP+Q+IoJ+fOPQJnvpcc1vv4oQZ4IMhEg2bVtO4YAKYvtaVXYZKq1AA2OQ4mJA+d1ZNObEq/xuKbI3XPDy1Qf3X5gm++UgrbkPLUKscOxTc8G4zccnOLCI/l+wz0TIvJKEf8GsHpjmuH6Cak8g4h1Tggn7VX+GmFzd2g9l3oliV+mazo/JNkUWySSye1DnhBQYoDRbxzHpDiXfRzfFvpDKwEJWGYb1f5r2OXKMpIIQr1J0xs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecf213a-d6a9-438a-3e33-08ddadb35dc3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:26:44.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YNP15kwRKTLutd+9FH64lEB6fKbnWlTqOUGl9r7Od1+q5JUDthUlCr/gljCWNxEy84Sz9sVx2S82Dks0LJGIKiundqSZ6OGdkNqPx0cdCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5109
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEyMSBTYWx0ZWRfX6uYX8I6DdZCa sC5+KqPPFRvB7a+eD6MEvUY+NY/VLDseIB6EVyfizXwryvtt0OOICzXICDPOZJ3/8pouEXJElJP WN2FQEbjLxQIuP53xMMQ6LcoSPerHLmGCjnZOJTQ4Hp5Qyr1NCamkofk6s4XEC4azinuGXAjGjg
 izKv9IvDqMJLubyBuVTRtbdKkX9Cx9UHlGxW2qgzjyOdzMYqywNHg6qz4xKxG83xU/b02M2e33G /kktOIBNsd0Vy2qHbsadHQylkYd4efgYxnyXmO0pZsuceXc+yFOYBTQxFZewsD4FZnguinZ8ouC 4YSSH0vOdm0VF1NVWw7yk5D8A8FzKw+oHw8gUfSRafGscReFq1GnQQqvrP6uZAV8YIT9n6uGMKN
 Pj3qHv1735dDVFPm6mJ6JiCRfyUEyLTcLTaISaMYjz/ejKKCQXD4cYBfOc3mZ4OhbexGDI6l
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=6851893c b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=frG24WKc_lYnWYbUNxsA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 cc=ntf awl=host:13206
X-Proofpoint-GUID: Fl6QK3HoZxRFNf6r6PqMmPxifrTqrTMG
X-Proofpoint-ORIG-GUID: Fl6QK3HoZxRFNf6r6PqMmPxifrTqrTMG

On Mon, Jun 16, 2025 at 11:10:41PM +0200, David Hildenbrand wrote:
> On 16.06.25 22:38, Lorenzo Stoakes wrote:
> > There are a number of files which don't quite belong anywhere else, so
> > place them in the core section. If we determine in future they belong
> > elsewhere we can update incrementally but it is preferable that we assign
> > each file to a section as best we can.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> > REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> > this. even if they are not quite best placed a 'best effort' is still
> > worthwhile so we establish a place to put all mm files, we can always
> > incrementally update these later.
> >
> >   MAINTAINERS | 28 ++++++++++++++++++++++++----
> >   1 file changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4523a6409186..a61d56bd7aa4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
> >   F:	include/linux/memory-tiers.h
> >   F:	include/linux/mempolicy.h
> >   F:	include/linux/mempool.h
> > -F:	include/linux/memremap.h
> > -F:	include/linux/mmzone.h
> > -F:	include/linux/mmu_notifier.h
> > -F:	include/linux/pagewalk.h
> >   F:	include/trace/events/ksm.h
> >   F:	mm/
> >   F:	tools/mm/
>
> Probably better to have some section than none ... was just briefly
> wondering if "CORE" is the right section for some of that. Some of that
> might be better of in a "MM MISC" section, maybe.

Responded in thread elsewhere on this but yes defo!

>
> > @@ -15764,16 +15760,40 @@ S:	Maintained
> >   W:	http://www.linux-mm.org
> >   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> >   F:	include/linux/memory.h
> > +F:	include/linux/memremap.h
> >   F:	include/linux/mm.h
> >   F:	include/linux/mm_*.h
> >   F:	include/linux/mmdebug.h
> > +F:	include/linux/mmu_notifier.h
> > +F:	include/linux/mmzone.h
> >   F:	include/linux/pagewalk.h
> >   F:	kernel/fork.c
> >   F:	mm/Kconfig
> >   F:	mm/debug.c
> > +F:	mm/debug_page_ref.c
> > +F:	mm/debug_vm_pgtable.c
>
> Wondering if there should be a MM DEBUG section. But then, no idea who in
> their right mind would be willing to maintain that ;)

Thanks for volunteering! :P

Yeah I did think about this. But given the above it's maybe better to put in mm
misc until we a brave soul steps up? :)

I have a few other new sections that are possibly ones we should add:

CMA
DMA pool
statistics (e.g. vmpressure.c, vmstat.c)

But these could go to misc for the time being also.

Of these 3 possibly statistics is the one that makes the best case I think.

>
> > +F:	mm/folio-compat.c
> > +F:	mm/highmem.c
> >   F:	mm/init-mm.c
> > +F:	mm/internal.h
> > +F:	mm/interval_tree.c
> > +F:	mm/io-mapping.c> +F:	mm/ioremap.c
> > +F:	mm/list_lru.c
>
> Smells like reclaim/memcg.
>
> > +F:	mm/maccess.c
> > +F:	mm/mapping_dirty_helpers.c
> >   F:	mm/memory.c
>+F:	mm/memremap.c
>
> memory hotplug related. Well, one could argue that it's just a memory
> hotplug user. It's mostly ZONE_DEVICE handling. Wonder if that would be
> worth a separate section ...

Hm not sure? Again maybe best for misc for now until we decide :)

>
> > +F:	mm/mmu_notifier.c
> > +F:	mm/mmzone.c
> > +F:	mm/oom_kill.c
>
> This contains quite some meat. I wonder if a OOM section would be
> appropriate (Michal, I'm looking at you :) )

As Shakeel points out that's already done (see [0]).

[0]: https://lore.kernel.org/linux-mm/20250617085819.355838-1-mhocko@kernel.org/

>
>
> --
> Cheers,
>
> David / dhildenb
>
