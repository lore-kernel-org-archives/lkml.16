Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9651874059
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920517; cv=fail; b=WdWpxNDmeNP62JRUbNyAl0DSyQykVMu7i5UJdtz8F8aorKtiDviZu5w+kjhXqGzY14eod0pskffXRw0fQ6WwLyrwIVtNYrYZcPkiR6tBlWSUF0bnwFJNLJH8X9IwI3Qr49miEP876VMDkqtHrhLasNKwKjZsppehRoBdXkzt7s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920517; c=relaxed/simple;
	bh=y8YYSdhDWBd6r95wqihxymIdd686GTHvoWadi3RygbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f6Pged0ZPHOEMf48x1+ub1fHq6fuliqSHN4V9+f/C/9cDkDWYKiDKeXCb4zdfNJ/Q19l6OWd58GKVyNw6KuTy8Nyshr32HCfzvWx9TC/k7SpFRN41utAL1t6gIjG6RPb0aesAkutxyyph0Cc4time09g3P+1buFCUyeKlp1zs1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dmDZnUn0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SuPhoWkn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dmDZnUn0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SuPhoWkn"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5171ttkP016765;
	Fri, 7 Feb 2025 09:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=iphE8HHigEN9f0WR0+
	i6ZBpGRgcKimbUCjELmRjiTmw=; b=dmDZnUn0Ja8hrxwKJK/PQLrEgdodcfi56a
	70Pu1lUcmb5AKzrTWf1cUHwsaUFl9PMiM5/aF1f5oUVnVP6H90cnCfo+RkMFppIV
	v/oryQTkTlwqaJgcTVvKXAIQ5uZBTSSetZndD8krenbUrw1GdDhg3rhZbUXBDAIA
	igz68B1EoRqxWIjLFrKXL/StJxyCBZF2PNJCgEE5W7Fj2cBbnXG5tMS8n31XoDFN
	mPvxbC6WE+EqhMz05QECSjkgkFU2lnchuaRjiy2XvM4CJxZr+acvDTz/lmNVSJTq
	N1OYTRqNnkr1tm7Y02VT65xtsUHAT8DnYyR8WI0n7UE8fyVqn0SQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44n0fshbjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 09:28:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5177SVq1023618;
	Fri, 7 Feb 2025 09:28:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8gmw5xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 09:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hl69Yup57irGDM6n9wf948QJfcHA2E1s9aqgnzj6HoqSHp3+eFErQeG6aMMYmb1blnojl2Ntyk7A3/TqeyXqLr8zZLF/MQK9ey7S76SNQr7XZ3N0EB5UjBzN/pvzTkMVp9zuddY8V2bX8bBgE7z8qxV3IGFN/c/AYCtpev/YYnxweCqhWCXHYAR8QYjfMkG29cxcymnAkFkFu6Qt9n0DhzS/oznV1qN2Yhh2tQP/hMnmSsRD8FYNtUMa6S4oPhKd0wp3DewKAn+/R5gFSc1kV1hFAcxmFCm6almUDRdPyp60+Up73ZcOCUQoI9GQIO8wdsVvL/c1cH6cJzeONWjGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iphE8HHigEN9f0WR0+i6ZBpGRgcKimbUCjELmRjiTmw=;
 b=FMg8HAk5rbdVbc5x3mYkvF4EhI/m649Afufi4rCmOAs7Nax5rpseqNubAhhJCWjv4P4DCh2bUDpRcYLKQlO9yxRw2ZrVastmXHip1XB9yg9B1EyBNPFIo5M0n3vv1H9yJcuMSYGvQEwfcOCQzStzndBkybUc/SjXgukq8WUIAoSNwaVmO0s7Dt5zEH35wPrjBjj44HmJ6OImejrnV2s2wuqGGQJnfen2jSDPOTSMINKWNrhAd9nSooCiwwLsF/Yf/RqhIV1JkJMvDTh+kz0+XwxP6HiUj+0etE73qfeEJyc/Yomr/xYBoTGP8Ex2/dNxtEUZR8urATpeyvZvosGbzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iphE8HHigEN9f0WR0+i6ZBpGRgcKimbUCjELmRjiTmw=;
 b=SuPhoWknCDfC46SHub+DAsLy0pwRVqVJbKp+0KK+nOPYylIlvjWy0hvsTml/hUo0ZyCOu+mu3dAurmL+hq8csQUh61vWEfonqSiQD/HSPXPO+yxjWXOFuywXNJpUN7yB56xjpKvyREf3DRkG5thBdGftZpjwbz1KUZNxKrGIDOc=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH3PR10MB7458.namprd10.prod.outlook.com (2603:10b6:610:15a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 09:28:17 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 09:28:16 +0000
Date: Fri, 7 Feb 2025 09:28:10 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Liu Ye <liuye@kylinos.cn>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mlock: Fix WARN_ON_ONCE condition.
Message-ID: <57fa3641-4166-4a0d-8851-2bddb4a19f1c@lucifer.local>
References: <20250207060448.146606-1-liuye@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207060448.146606-1-liuye@kylinos.cn>
X-ClientProxiedBy: LO4P123CA0176.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::19) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH3PR10MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 137fb330-2e65-4641-f35a-08dd4759c041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Db/hn3lOSC+8fAqgkdcspPzjxWw2iz+VkCwyYLFuHr9jinqlKkt6DhLmaBZE?=
 =?us-ascii?Q?PEuBf9orlesyuJSa4ca1wWqxH86zCrOef9aw3MYovBjMUPnoy6YBe+qKoLO5?=
 =?us-ascii?Q?GrcGv6LjbztHpZ7K+w9KdcMFLLh/lNZLeLKyXFF2njaa+3AdJX9ocmAXIunE?=
 =?us-ascii?Q?tkhRVL4bnI+vYtK224+zNmR7yWcrd/KqJVgmoXsDJK46R6Ff9+DjGvof75HG?=
 =?us-ascii?Q?JF/ryE0w2dqUz2ow+5yKYhq7xINnp/fdGxNnrt7oBBXVDJ2dr4gY8c24fxyL?=
 =?us-ascii?Q?quI7Gaz/ATkkQyH3s28LwRdWx40htbVkSlOFnm/59kbd1jwiTx0og7+q89Xb?=
 =?us-ascii?Q?AvmBkxWuZMgrA8qTsThfvmUJcZzttRRgqA2bIKJfDDDSuVzEneb63qk1bfUs?=
 =?us-ascii?Q?M87cn4BN4IcGwqQqjSMDBzBMo/zKGefvf2WcQPrFmsm/3HjvDGrKls52oMej?=
 =?us-ascii?Q?eDnpNU6RzYR0ok2EJdRXS5ZmsrBPD5OxomE3tk0jS0yQy4VjEV1wVIFFAqap?=
 =?us-ascii?Q?lLHXaa4lOR9CQi4q4wSSf/W4p8+XgqG/0MTszPsegI5yKUTnt7tHkF8a2LRD?=
 =?us-ascii?Q?ow46HYBNKvs4gDkHnMYfTfbp3JyuhTaafOL1/BOBekzDqcjPquS6UqwZMMcu?=
 =?us-ascii?Q?pNDS7FIg3ymtSBBPg9QjEwfDKGqWZrxk6ezFdycQDLIB/UPCCmNpNsbJMnPe?=
 =?us-ascii?Q?IH2eGspPnIeNZxmNMYAL0E+tR+5isMt1AaHHhLbGRw5U7tuk2AUGyqA5tUKE?=
 =?us-ascii?Q?SzKcZzzFrsyWpA55EFpyKBsk48bpY9mz8d0nUzeVYe+V19gSw329zPPc06dm?=
 =?us-ascii?Q?5vILsNETPzhAIc2HG5WJPXadFaIO+xLCPXgg5Cbv7BJZUvRVLneDwLW8YdE6?=
 =?us-ascii?Q?A2oqR6sHIemPkRIRnx9dbrt2pv0kYs1PMQIs3aZ9bt8XPfiVO0CyEUXcxx6q?=
 =?us-ascii?Q?gCH4OLmI0ZW9ZlbqNQjBfGq4b5UMtqqbGo62cqaTKKMEER0l8QbgYVV8ANjB?=
 =?us-ascii?Q?skmGO+VUHWWHmBcEHYnVRDDP5NSIg0gX5ZetOhySUpQPj7l7QhmWD23mnljt?=
 =?us-ascii?Q?Q8Ilif28DRMgXuqstBKtbiXN/MWGZWwa8lCbrAxDwe9eNy7WUEjCbjAb8y2+?=
 =?us-ascii?Q?lVaNwvSUp5AlDuzQe3VTnoDuIwGWXfkG4dexpYnRNiH7bTdu0/0Y3KOH/gPw?=
 =?us-ascii?Q?86M9IDsTMiYRkAkePmIFslrjbm1nMoamjw5yx/dcOhzCamrCkkM1V8Wvk0gh?=
 =?us-ascii?Q?2xp++9AZ03s5st5LF0tNlitKJn5/9ZOvfGJb7EKQhBLROdDtkL3lr+7lHpf/?=
 =?us-ascii?Q?ogeaDVLQIpD5r6Qjp9x3wduJI6yBYJI0TfcIzz4nVziVxpmqHvyEk9bcFya2?=
 =?us-ascii?Q?uMq5F6Ch/u+HmyQHdbFUfFcp0JlW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FIGnDZFjPu6kKnbq8ijTNPAtXv4CwRk1HJg4g2if4fe3f1tTpJOTIsr2AUn6?=
 =?us-ascii?Q?OaIljDwCyp4TUFMwYDcu2sDR6H5QJKxZ5EomnQs92yrV8ghTaMLXwDvjn6Du?=
 =?us-ascii?Q?kL/XYtK9FWkHHhA2wJ4KKzSKQRxCFiOOidtMB2YHOQZrUx6ZaOmfbjHNPIbv?=
 =?us-ascii?Q?Hkg6Y0ynB00zdOwBnT2Fl3V47+R6bpBuwuFlPo8Hf2PdEaG+x7zNXR+OhWE7?=
 =?us-ascii?Q?S9X7k3XW4V1k50/7vAVcM0dDSt/6SKCTKS9ayWP2tYYetbz/Hoe4G51g5+Jr?=
 =?us-ascii?Q?4t6m7QMMVkX6gdmjfjB2Pn7c+KomcA1i7ioFc1n4fpSxQ1i43VQFlPdq97Q1?=
 =?us-ascii?Q?vzQwH6pgZvscls89em4PyVu1ulqyBcaw1Glxa3xSIBnaXPJj7QofwsApBrQf?=
 =?us-ascii?Q?9BWxrevmR2qG4SxXQYSpJwkkp9viHdtOUEV7Oaw1ZP8+Oz+w9CA4to/Oicn2?=
 =?us-ascii?Q?0G4chyku7eRlw3CNSSrgph1rjZf10RkhnRIHRWFq2U9Jx5qas01jWahyrjwp?=
 =?us-ascii?Q?60/A0xoCkNblzicGNjT2B56BaWCSmH/3+VC7E6Zs7h91baX4BWRvrU+2OiIs?=
 =?us-ascii?Q?dRWMwZqjhiJQzMC2156552Iw63h/hJ0kyVQTWryLxaRDaCtla4cpZleE6y7v?=
 =?us-ascii?Q?liKbybP+V3mX4pkacCq5fyVMXvUpjGpxjlaDDr19Bb8apPTlav0qPhgItnu/?=
 =?us-ascii?Q?2S2BDqLFqOt96qbGAeoDSoQkWubWwUjTAvZlNIza47G8pR8KxYwv8pdcGfTK?=
 =?us-ascii?Q?hGRPt17G3DHd2QhIXOoZBDaS7pyAPGIP8B2k6Uc33YA/LybHXytIY1Cu1H5N?=
 =?us-ascii?Q?6/J+h58p4spQDPbg1tW5grZge6evTis94+K6kaYmYmESJuw0uZJgtaP1GzEH?=
 =?us-ascii?Q?s2FNYBiNW8C4Y4xgqIAZ9MQr8/dAa5EPDJrfvNhqSVM+oVpMYq7lA86yln86?=
 =?us-ascii?Q?+/XxFulALtTjdM6uADTxp8Th0ZUnxyZCJzLEfqCDpIG+zb92nbzTaLHPCyO6?=
 =?us-ascii?Q?PPM0FnzTD/Y8ZBUluBnlZIGIaYLjppNtXkGQb97iYn2/y6/WieeukL2CjHxD?=
 =?us-ascii?Q?fwup8ztMG1gDcdFX0DsMDdNI7i7KojDwSmE1tZ0ZjmsGLAbUshHwelxoWiQf?=
 =?us-ascii?Q?caZb7JmnZwjobCvnoisP6xwEBM0XV8ndTbLqZVSUOvaEijrZRhipN0TxaVR3?=
 =?us-ascii?Q?V/Knqv3xcqPCVVHeuD8wcBVmLiX/Ckloocmv/PN1ERxRmdhal4yvzobjp1cW?=
 =?us-ascii?Q?YIiBgTjPEqAPFM7Or36TT1WEFOoCYPIAxbotCdf7KANQRr6IQ3cwnhyoJABk?=
 =?us-ascii?Q?DrbeDQcZ/3blTnKH87grhM5apRK9/u8eQphK3RPOJglxBDmeBEIrZWJ73Bpx?=
 =?us-ascii?Q?RVD+ZQb7dIgGaaFCNNMfOaXsVxJJSEpdx226ahyV2d7+YqAWEr/we/X/9nq8?=
 =?us-ascii?Q?SMKl9ruIR7jwFarlUblsIKTijULT6q26EfNM6EDTgklmqKi0vxs6DLwMz+R+?=
 =?us-ascii?Q?+32CrzAqDqqIWj4bhU6n0goVrm4RaEMuzTUlOABVdxB+t4PLBRJXqihhxBMx?=
 =?us-ascii?Q?5sCE0OAAGXljYvNRfIZm29N7FDL2fbVwnsE8hMyZ6zlA0mqEoEK1WcMQ1iVe?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H5CBS2ikXPE41WoqiTd6Hx/dz1AKufX4F/aFQWYKaXfbwup0Of9vYTlhx7gVB18bANOtJoZImjy/RSXF8fsicyF4c7PhqHO1D7CbX/1sX0XOBb1d01JMj1UBT7Uf+lSLMaqNRO5ft3K31NlbbleXTRAmB/0J4tQYtRegMSlMoOVY24iqKBJMWY2j/aKm3BlMhlUEdt3QvVgotWDmkWvHYI+MPiL8obyg0lbLBoXrdiKnr0sWNwISV7a1WD402LhGID7+1C9b31wWCFvv4Dm/aAfdZt9dNOpa/DdP89dvlmuQdWnbdaS5tUecpgS+fcvgfzFPModG9TlMwyGTSXs68GAA0d0CQsjNgNiVuNtrzfE+oz3hqeAlMn3PQaoJXjwMOCl2KrNOsx7gBzLwkYRDUd4s71VIsYzPOWeiPPojjxCGAjOA4NbPryjcjNdGUSiGd8dIguxe6zR5xHzdSRCjJkziOkGKqIwcWWvpnD42NHT9pHAqh8zMyc1iBUTGG3UJKr8nAzsR+Xp2GcMG0uqigtoUC9FeKegWARPjoVKuOXiBtIEankWDfaX0jlY8hfv3x4vTTb7BqSsc0xNlWyKBfsQTO6ICEx8DNyVpcxn9lfM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137fb330-2e65-4641-f35a-08dd4759c041
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 09:28:16.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRl3VUdBtEPhV9qbxsFlzqwo28MTNE73EcwFX58HTAHdx46rZXZmB71PD2n8einq1fzTrOEIlYIYoCkEAHJO+qZDnAfADCP9vxsPPELhkNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7458
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070072
X-Proofpoint-ORIG-GUID: 43hSwf2jDbQ3Zh5pJsHA6jSZbY4fomhD
X-Proofpoint-GUID: 43hSwf2jDbQ3Zh5pJsHA6jSZbY4fomhD

On Fri, Feb 07, 2025 at 02:04:48PM +0800, Liu Ye wrote:
> The condition in WARN_ON_ONCE(cpu_online(cpu)) should be !cpu_online(cpu)
> to ensure the warning is triggered when the CPU is offline.
>
> Signed-off-by: Liu Ye <liuye@kylinos.cn>

NACK.

This is a really odd patch to send, if you were right we'd be seeing
constant warnings on this no? And as per Dev, this seems completely wrong?

You also MUST provide more justification if you're going to do something as
crazy as this. An 'it's wrong because I say it is' isn't acceptable on any
level whatsoever.

> ---
>  mm/mlock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/mlock.c b/mm/mlock.c
> index cde076fa7d5e..40acf7897917 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -224,7 +224,7 @@ void mlock_drain_remote(int cpu)
>  {
>  	struct folio_batch *fbatch;
>
> -	WARN_ON_ONCE(cpu_online(cpu));
> +	WARN_ON_ONCE(!cpu_online(cpu));
>  	fbatch = &per_cpu(mlock_fbatch.fbatch, cpu);
>  	if (folio_batch_count(fbatch))
>  		mlock_folio_batch(fbatch);
> --
> 2.25.1
>
