Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF9CA6F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749304457; cv=fail; b=D0ns4yoL28uy8/NfNbB93ulgXVRKIq4UJF5LIQvD5za8rbjt6LBCT7if++KTOIhTHALDL482i3yoClnKp8n6KjzO27CDEr7m1CIjbY9sxdbjnfaCO4nMfadHj8gqUCY1/GWQQuxNAf58PgvfFfc03pqk7KuOn9rT9a5ALGPbHN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749304457; c=relaxed/simple;
	bh=8l4PfA2GWz1l7Pl+oNS6r6VgIyLQACEEHBvrQXU9zzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=psYouchtChSsYErKUsoMSNFZVvGtRTD6+vw6ke81W75Pcz2+rBKivHmhCL687kOs9854Dc3Hjus3EcfRwImjhTWBq97I6admJzkGjaXlvpY0ydO5CtYkXsjzz6K9OGAXxFAKM8K2XYNoFeCk7j2pniMPN7QhVQ+9UUjZ+GN//Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T1g6izii; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QD5GCo73; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T1g6izii";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QD5GCo73"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DipHx001784;
	Sat, 7 Jun 2025 13:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=8l4PfA2GWz1l7Pl+oN
	S6r6VgIyLQACEEHBvrQXU9zzY=; b=T1g6iziizLRvy1TkQ7i34XCHihiYuGvD7U
	w84ZDA+uP4RusAa8pvTp9NTiwa8yB1vCRh3Kn7IccoHhqzLMQkZy+3OyrNx7VFay
	lKR2gKrLmiRLafcwE6mpgsfu0Khbl/Or5XNdYBvpBImvn/VbZoMecSbboUv6s0Tb
	uZIktN3DdVa8GC58gG4qRYSQcnZ6xFOE43+IfgKnhM8E04dE+8ykArvac4MPfILM
	PhHQAXNuMGAyRcIZaRQE8jFSMFKbT/33gBfMSLVph64dARHWM82doa7yl10VvpGD
	H9ssKgnLRD16zzgYiYZ11IvwoesGMoBN5kojARCOmyLgAO1KW8KQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf0a6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 13:53:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557BsTLd003301;
	Sat, 7 Jun 2025 13:53:50 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv61u7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 13:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qA/maUa/CdoaBYi/0LuuHkrBdcpC3FOXR8LHzbkBxQTb+bDqbFchqA3y9ALRdsFex68t7fYI9moUT8EMJwwoUMEHG15HUheItcphE3MEIMF8eLYMtzXg4T1BOXR011r9iXSGS1lBjM5428MucEDUn/2Mf95Iu0MKk7t1wit914F7FQC9yOvO6qa3mc90SKyJ9A1E00XqFCPX/ulNUCAtBwoZG7YaykZNAhhHDTgimGvisJ3j143mWxK6td9nBVceLxcpHibAf2tyJFmpUDeN8AEPV+bed1tLhxR8dnsyqsSPO5D2/UE1IBPeZU+iJ0FGCH8bC06/FqbVKN5SwmfGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8l4PfA2GWz1l7Pl+oNS6r6VgIyLQACEEHBvrQXU9zzY=;
 b=kqBMEDAcNiIS6pduFVXMAIKORBWStSCX92Y/U8uT/TEf5Eh3xrX3wWfucv2Tk7wizdFxC0Mx00bfBfF1h2DavqftLXALShWAqz5a+seBWxZYannwRPF/zGQUKbB9l23roxfWjkCb9OvSyzYdH9B2T/X3xs8Hqdo/CC+ZZVpgxEXbqSME8idJjy3dzvzfclcuJN3oXKP9BgIHB/yMijBSmiJ66NH8D7Og92TF2bcGqeoSU3oEzaUskMfxtXjYJBrOPVyisRDCMvPNLmwgDsG+zs2Xhx4DiAd8F/ZBlJOdKn2YXEihl3cZP6hf7hm4MDaFOCuGFYcz4platkUqGAZ0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l4PfA2GWz1l7Pl+oNS6r6VgIyLQACEEHBvrQXU9zzY=;
 b=QD5GCo73Sheqa00u6lEbBDhZTkkYozHMmOws6g0Htj6Ml6WEq8Ux/yomV/0RyurBu19YsJXXXUomE/6eUxEMVd8e3SvJSmbYq3QbFgutALhBZHDi3NlY7h58FcwRJL7edwqMjddPhkiF5EX8Of6UwePVlNG5Jc1cs4KGvzQIqzo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB6890.namprd10.prod.outlook.com (2603:10b6:208:432::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Sat, 7 Jun
 2025 13:53:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 13:53:44 +0000
Date: Sat, 7 Jun 2025 14:53:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
        Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <04f52d21-baeb-4286-99eb-99edead514b8@lucifer.local>
References: <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <20250606184212.GB63308@ziepe.ca>
 <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
 <e5e88da7-d7c5-4a10-9318-76c1e38dd0a6@lucifer.local>
 <20250607134214.GA158671@ziepe.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607134214.GA158671@ziepe.ca>
X-ClientProxiedBy: LO4P123CA0250.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::21) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 461fd302-9ef7-4bfa-a63e-08dda5cab774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q+X/X7e+Nf4AEYiPyT3ImjlhKfULuAaF4mevkHe6zJhQDxAanyF8ofl9LE29?=
 =?us-ascii?Q?LOD8K5806NDUjP4zcj58mxXWcWb9THELMpAh5lpU864Y9D2GLZTsVeTwzE+a?=
 =?us-ascii?Q?WZS6ocgLjCKRCfw6CNG8H4Y7jXDUrpXLygXfeQh/8WyFWmPX1BnViGpKc/SR?=
 =?us-ascii?Q?c0w3lh8Jcmi+u71mEWmkNujntXh3+lcJiLvwPFoBYKXjiJDxXDK4bKKHDX5d?=
 =?us-ascii?Q?/S5SqH+hX4Al7UMeBTsYTMTXbm3iMCxryHfb+anbw2sg8uihauRy3+R+wwXQ?=
 =?us-ascii?Q?Rxn0b/M+50xIE5E9t+iE4YLiTT0Iu8KrxssghdOkKDaWHXTjzs4uKU7Jwntb?=
 =?us-ascii?Q?VBsv3Lj1PcfOR697Qv58lZbahp9oratFXDtOjc4n6FdGzzG0nr+pwJxR2Z7a?=
 =?us-ascii?Q?SWWr0agMUT/fXOCR1oIZjPY90Ung6uMQmbGu/ZdYJal9KjJw2FiynuJO2OJO?=
 =?us-ascii?Q?azt9Ox/Rv9pcLhpeswMLzE4rrdUbhEWEVK1J1F1fT2qQb9TuEQ5LW56KmzFD?=
 =?us-ascii?Q?miHCPZr+PS0yncvO/8XXF/2f1btT3qNLRAkumzuNi8LKp3Z7KxsubdPiQVCj?=
 =?us-ascii?Q?Uojdb1vg+X//nPdkLJydekkZRotStb4GsiEfoUNMHnr0CGw4Z1Fq1dmiPvVO?=
 =?us-ascii?Q?AOIA0F72sZmu8/J7l2hiiEsZp+xqYQkI5Ri7j4isIV29l4tTN5G3O0gHOmDG?=
 =?us-ascii?Q?9IbT6NUtcfozrcZNWXSdxehn0RkrvFWw7pBqCozdk85yg/nouYwEUHaEk35C?=
 =?us-ascii?Q?g+RS5be4itAt7wveuTHTavoDbyICIq58tMyT7jlL9mtnrolMACTTy41mOcSP?=
 =?us-ascii?Q?2zZn9vfwGuHciIMgs/cC91sxR59f4RaR7EeP/0HZBReJKT9IP4zVKjk8aCEH?=
 =?us-ascii?Q?a3NAubZnCbQv0HPFLxXhYlHAO+i2YLjpn/x0fNekr1omVmg1kI/1vV8/WEdz?=
 =?us-ascii?Q?zuaRbOONl4O364RS7ssT9dC6V5kqnDEAuw9yyco6PpdFr+po7B4J6tiaBapc?=
 =?us-ascii?Q?7YoqqmG5EwTG3zAA0yW5oHcdEyV7aGr53nHyMLH+uu8u3x6qVIO9tNiminZ/?=
 =?us-ascii?Q?DBdNi2HqQpwpsoSd5oqpgDG2jf9rlAd35BpL/p+ewULEmYyveWzGPhoBY7SC?=
 =?us-ascii?Q?getk+6LFYIAnJtSilvMACAp2docafo8Xx3CsLrFt4t1jsCRING83BEqfKnQE?=
 =?us-ascii?Q?U0ECo/fnHxGJjgXAx1O1Lioc7tUIBPg3GW474a42YSqExLTrZFHMzKOo4kfz?=
 =?us-ascii?Q?G1LkuSu+TXkR8rUelVu9YFk8TyN/M9DQQGkTDZDltnaNwGy0iMWrrfUG8YBt?=
 =?us-ascii?Q?PsMDQZzsuz/nw64QzHRPaofD4Jm9vomJprZdh/icg5rm6U7e1gXPu2jYDVal?=
 =?us-ascii?Q?1ytLTx9rAg/UnL594J/e6bfxeif/vbuicN82fJGW3sVQWrCDPI0fznK2afRL?=
 =?us-ascii?Q?bzZGDraoqKY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HNTkV3rCDs9XXCjZZi+/PpC1Yk79erMN6gbkDhy3UWDIyG61U2qeJwBP1P8i?=
 =?us-ascii?Q?OihCpvIJBRqgV0fsJ+vp5R5OWjrv/CxY5FUAxqbY7cldiX3lBRF2ziEanuHM?=
 =?us-ascii?Q?tuP34YjjXoEk4LDN6biCZHzzEPFl++3DLXE+ROTSYwf970qU15NsQ+nbEkzL?=
 =?us-ascii?Q?rND8VmenhidsBdEdMhnkYs/GxMSJKvvHMptYfuwetK+J0fci28zPIn0MPAzL?=
 =?us-ascii?Q?TI1u2A6An9C2Zqz0GKgQfckwQsSeRaV3A+8VFW/1I2yVDC6ynUtXs1FjzXTj?=
 =?us-ascii?Q?kQnKCIgiwYJ9SGfbFU6BSsA1vopf9aRcd387whJXQn5QMc3F9O3OlxHabf3Z?=
 =?us-ascii?Q?1inbnFEfpxKiCQh8iBCsEw9/YHMuK5JH23BC+t8FL54PpdLyRz4ZOz2vrxhX?=
 =?us-ascii?Q?hTJX0BijQPaHFrc8wBKue1vLBl7XN3xfKwEMdVxn/woZh9Orz7kL90Q0VPJC?=
 =?us-ascii?Q?FrMaCzkTYMDW3YykVAOIPKjQLQIb4hlzzh9zqvprYw6jxHm5nIeF/eIunHfn?=
 =?us-ascii?Q?V9EwGnNvgLNpNi/+NWc/2XXx/uOfG5LaNPYtCiIoDFgqZTIpIO4tozCQlMr9?=
 =?us-ascii?Q?BBgE4fQ9HZg+/wo9XR47gb8MHvaYLxV10TaL5li91MG/tFblJ7KvIq6jBmCt?=
 =?us-ascii?Q?ouTC7PvatnvJ5R381+zaWXf5b3rKtsP+6erlGewr760RgmCkSJtWys2uJ2eT?=
 =?us-ascii?Q?tgdFQdH/duBb22uq49VhYw2nuogJ2ESixoiqHJm03dIao57VfuvvdDJgz/80?=
 =?us-ascii?Q?VexiNE+CxTEkAF3/5RhaqmLRuFzu86vIQ7e1bg8XZWGPJ1QWbSWNQlByqqah?=
 =?us-ascii?Q?lr+yEyPg5Eg2k6rSLvlKD7YA2qMuhrehlM39y9iWYTKsa9qd6vAnmziqFA1J?=
 =?us-ascii?Q?rOCaVgAX6zQQLBZ5Ywb17mXomHB/yBdTKZ2uGxRQVHjA/GNvCVnyodc2WeYE?=
 =?us-ascii?Q?W3O6nM0gb8PovuuNq7VooL/XlquPxFerbwxghQaky1VsNl0R2FWPR8ckGeBx?=
 =?us-ascii?Q?/3K/SRLafwhyp34HYkjpK9wZaoewctX3N4i2Xj6ZNxQcoc7YrlWOT6Hk+KaV?=
 =?us-ascii?Q?c4T75RXcZeSIGnyUaIooSHsI15hB1kLnHKkhjH1VLTfyKySKngZM5/3OWdgS?=
 =?us-ascii?Q?gpr3aRVlp0EzbUwRwn2ohxAG1P2yYJpCCvR/gvx7TAm3Xl/BOWMU6Y0O2i9w?=
 =?us-ascii?Q?VMZowT/h/7xQxR4NevciIX+io7qGcRNAe1HZcu8V/zZHUTItPIcnqkfmT72l?=
 =?us-ascii?Q?/EourlveY0DpNNm5Fu3xm8cX8gYNcq9SH+IjjtHaPOd702wXZs2HhXnqTM/t?=
 =?us-ascii?Q?Tfx8urktVsGuBFL7BwuaN1xZBOkcIUQ/LDWJKUJmUlHnm7ihtD1B6H/67JaP?=
 =?us-ascii?Q?lq0eM/tdg42OOFv3+7MXkeh6/MAi/wZoFHC1CfazS+oaQ2citVgJW2zEiXka?=
 =?us-ascii?Q?+UsQTcmGcZ4Ms/Vu0ee/9O129yn4wiZlakbHfp/5HbnRN4e5XW0tcGdaPzMK?=
 =?us-ascii?Q?L3dGguEms5I4m+BRdepIuNau07jhf6HcePl8VcAHuR32UBmXXidqYE/MgJZW?=
 =?us-ascii?Q?qzd4LT8eoFQxDvZBlZTNQwEWGMszkOG3jJ8MKhn9BqyT2zsf2loqpMtxpNpm?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dslvZP6TG6iDOzpL4JwEAODVQFHWShuURoO6PMf6B0n9WJgCfbbmSaRVXKIV4GPen9wsEpV7pOtladns3lcp8WQz7gwK3+1drCySMWSVnaSZns1lPnqHVaHQyMR6sULO1H/bIRvjLdo7Y+rIihyDROIQRYhN/6F5pkqwf7CcKHZzETo7okM3CS+744PnuKpOwyJRvyYZThdj1oJuEbc2Pe+KQzpRc6No4Z/JKRB8/zWoDlGRvmCzqWUhvq6Rjfpk3jRePUZjoERL/CLm+qFrEkTl79S4yKFU/3eixQ1TqmoiDA5wsaR5UO41+ShoxOYqhH7PYOnvacAyJGUwdK2Ck/T2rUx2IsBH7EW2QCD1K3nnIff8xUm4RfqLWZS7lveQbXJQv+AoXRyeG3I8Zf/Fz+5sPpxcCN+Vr+kLOHnrpe88uJC5o/toxjm15nSpz3cv3odT5AYg4ov1WIJZsOQojDC0xKB6X2cXS8V3goMdpbJ3V63NLL9xittFV0A6leIfvAPRCocOrU1E1O2sM5jx0utuTUDZ3Delo+LgIGiBVYnT++4ZgTqB9M5tvWo2EUUWBxKYdA0qiA1to3ILAC9y8xdHCO0nQZarpkgy6GCJg7Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461fd302-9ef7-4bfa-a63e-08dda5cab774
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 13:53:44.3638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoE4PRfHgO215UQ96yShkYA0uK/g0qWA+bjR2VGyNol4R+kPIoYvtbRM3RCBny8JPlr0pzrY4nCSMLQ7LxgBJvbksVY76V66loGGbbq6o7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6890
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070099
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=6844446f b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=coZTJYOxBwvoCrrMZqkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: 68pgRK_b0k_gL4QtSSMrwqs7AvA990s2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA5OSBTYWx0ZWRfXwG51hAt3PouU NCBLeVPRlBh80lUiOyDUlPs5ggoDrUxqCUnil3hWPaRedu3Tguy1XepKVa7Ukd1N3RUOIi3VNjT 0rhWXCP6RzydjsdvyrGkOCk9DZ4Rj0eVBpIZe6iKrXciFKKFLcEmHvf3qUFEcrTvevKwTwJMpkq
 IUm9L+WUur6m7p4jyFPVt/Jz4ojzk55p4Q0YRo5p4n5KqPtj4ROJM2vorbeSkS73i2LkgcE9uIy pQ36Jz+AM/JKK/4bKg4cSsvP/LkAZuBVHdnit0hoeDncRBrvExMR7sJMKIVyLZpniSAAG+fMmcB DRpfM77InSSu+DkDXBvThXYdF2h6g5RZP/W/JRfm0afWF0SjvlcyVG7mkBy8JTtd3QlRFKwD/eU
 NoKUjI5xin/kmUgmlYKrPRfEiLQSwOMZ+RJcBNfanDGw6uy3U+jAPzUjLLkFMS5IU32d9TYM
X-Proofpoint-ORIG-GUID: 68pgRK_b0k_gL4QtSSMrwqs7AvA990s2

On Sat, Jun 07, 2025 at 10:42:14AM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 06, 2025 at 08:03:15PM +0100, Lorenzo Stoakes wrote:
> > On Fri, Jun 06, 2025 at 07:46:52PM +0100, Lorenzo Stoakes wrote:
> > > On Fri, Jun 06, 2025 at 03:42:12PM -0300, Jason Gunthorpe wrote:
> > > > On Fri, Jun 06, 2025 at 08:23:25PM +0200, David Hildenbrand wrote:
> > > > > > One last data point: I've often logged onto systems that were running
> > > > > > long enough that the dmesg had long since rolled over. And this makes
> > > > > > the WARN_ON_ONCE() items disappear.
> > > > >
> > > > > I think what would be *really* helpful would be quick access to the very
> > > > > first warning that triggered. At least that's what I usually dig for ... :)
> > > >
> > > > That's basically my point, it doesn't make sense to expose two APIs to
> > > > developers with a choice like this. The WARN_ON infrastructure should
> > > > deal with it consistently, maybe even configurable by the admin.
> > > >
> > > > Keeping the first warn in a buffer is definately a good option.
> > > >
> > > > Otherwise how is the patch author supposed to decide which API to
> > > > call in each case?
> > > >
> > > > Jason
> > >
> > > To clarify - are we talking the first instance of a specific warning, or
> > > the first warning in general?
> >
> > OK sorry I'm being dumb, it is -per warning- reading the thread :P
> >
> > So I guess you would have the macro establish a static buffer for each instance,
> > and then some interface for gathering those up and outputting them?
>
> Honestly, that seems unnecessary, just a single buffer for the first
> global warning. Maybe with a 1 min rate limit for replacement or
> something.
>
> The kernel doesn't run around spewing warnings as a general rule.

Well, if you have WARN_ON()'s you tend to get that in loops if one goes.

But then in that case obviously you only usually truly care about the first.

>
> > And I guess we'd not want a new interface for this like WARN_ON_ONCE_STORED()
> > because that'd be... weird and how would anyone think to use that and nearly all
> > cases wouldn't.
>
> No! Delete WARN_ON_ONCE and say the new global mechanism is good
> enough to capture the first WARN_ON, everyone always uses it always
> and then nobody needs to think about this anymore when writing new
> code.
>
> Jason

Well that is simpler :)

I have encountered situations where I've had more than one and needed 2nd+
but it is rare as you say.

My late night incoherent babbling yesterday was perhaps because I
misunderstood David/John as to what they encountered in the past... maybe
they can clarify...

I do find myself grepping dmesg to find the first warning and it's
_annoying_ to do so, so this would be handy.

But I'm not sure it'd justify getting rid of WARN_ON_ONCE() when you are in
a loop or something and now your dmesg is going to go to hell, still useful
not to do that, esp. if you know there's no value to further warnings
