Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6E265613
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208044; cv=fail; b=E1mvWN/X0lD3sEVso9nnntQFZ+v/zC47Z//trL51enmCGclyHexI8cNAcDf2pnimoKATZNiV3uNB+j+o3cxdFXkh9dS8I0AqH7jnH+UwnbjF6zVDarwF50uIS93rSfm9fb4TGcajYzxvzctOLle3ukicShGf3aRg/+9Ks9OcMtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208044; c=relaxed/simple;
	bh=e0L7fgwQL/iYjiRT/RLY6SGrjry51yHwtscKYSPEUX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wmw2fJ7L37GeLJwTWDOF8dlfM/xG8/7rov+yQgbsn/zyYBiJkSlfKX84f072WmsPkBTDeEb5ANgKLDsnFQPdyNx9la1x6prfijLJhOCjX4gGgYTcRuFf/9TF1sdGpcVSf6DAGF9d6e8VbXtFF44FGNMtrVLtpzeOLz0LDjIWlaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KuoKDRTY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QeekMCN7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KuoKDRTY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QeekMCN7"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5397twi8011362;
	Wed, 9 Apr 2025 14:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WWW/zG452codJGoCF8
	df2H4pd0YyGJVSoHZ0J/GNYEg=; b=KuoKDRTYhrWvihFejwJdq6zhKgOXTV5yc+
	s4BGdMyr48Nzyu5Lz6IY1sNr4Ym6iiqd1Eh68RBbR9eNU7SOEY0+mvwBHvf42Prr
	O72buoZoO/CvdDJFPxuBu9HSzm04mL2NcU0WUKmkewrG4O+aiZa9nBLy0yfiSr/n
	JdfpWZYK1RZuAwZMMbNewoPEWSsBVOo/oTcq/rMOdHY1fYjckPggA7zC9GWDeZEb
	HdUcr//4Bbf5qr7KTJSa6YcZuWnmYqwfgzTgX6j+SRxfhNC5GVjvDPUlVkTUXL5N
	/64lXRjcaNNazQNiMOXA+txkH3FY30V3Ai9o+9xcWMgBFKjCxMrQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tw2tqa1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 14:13:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 539E21En020984;
	Wed, 9 Apr 2025 14:13:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyh6b7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 14:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcJ51l5ypp3zwNaBHYzeU0u3QpWfUKlKdT/akZbasQqsemYPZrBFKrIVtr1t7aVc2NkGiaZO7nmpp7Ieyb2+tgUatGoyxegJO9B22iJyFr80JCt6ZQ3rO8o15tPCzfXO5UZDSBa05WvqNGHeqwPDtMETxisnoJ9yzu+7B18OL2WeiU0qilJMm+TtNKj5Jj8nmCZfhAZBy9cnBtgHU2U4cIRLyPNncvDCOdol0nWw+GLS+ZTE82TBmfALC5vQwJ2CSewWyJ6Cp+HalcYYyEqyvfOgU8iYYYBh+A5VlpyA+JTTCc5qFdgKXQbieQ1SRiI++l8AWzG9TOE6teTIW+cKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWW/zG452codJGoCF8df2H4pd0YyGJVSoHZ0J/GNYEg=;
 b=C0T+1bcldDmKTpd3y0WwoIWVTofgA+/BfFsvXRkJH0d8bk3uPbudDmVlebpV7GEnOOQLt1oxz36WyRQnHS3Z9F5JRWuflyrKBO1JGPLrYuQt2hqLeFc8LsujpdDavCuE+01b68uybfhv4LHovSW346KIMk/E2x7iUjbB9/U+WpdNLs5UsFXR/Ozuz2MGVjkfB4xxHz0X4n174RRLBuSkO9rYkqAMwrlX4lo7lPOuC/olwsAxntS0ERlZoIc0eF1AGt3033Bs+5VswgM+8j5fKR7gQET4SoWGmclto/5/W5EqK5agEysoFHN3rGxFzS2PPO+FSc2vLlN6FQxXLULMOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWW/zG452codJGoCF8df2H4pd0YyGJVSoHZ0J/GNYEg=;
 b=QeekMCN7eDSGQfIXONAj0gECuSKEoFDYJcM1o3QcmEJ5otT0LltReIQXu+YqGE4P4VDBW9Uzmrlh1d3gUFIS+nQc5HaD/qV3HquZYwo83R8sOjp0yfhRWAF5/+6QhOknLFLjVRQVi7Q5KmZzRirnzxK2WyXBi4coW7lAn5Ux1U8=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH8PR10MB6358.namprd10.prod.outlook.com (2603:10b6:510:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 14:13:54 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 14:13:54 +0000
Date: Wed, 9 Apr 2025 23:13:49 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lkdtm: use SLAB_NO_MERGE instead of an empty constructor
Message-ID: <Z_aAnUr5Rq46Jsp4@harry>
References: <20250318014533.1624852-1-harry.yoo@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318014533.1624852-1-harry.yoo@oracle.com>
X-ClientProxiedBy: SE2P216CA0139.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::11) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH8PR10MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a7bb5b-2c76-4597-8c8c-08dd7770c2ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hnhlI9w1KGk3lTRFlQM7KnZZlmF9LSGxzLRAsEGerAfVAiCsnsH3BjFPjuUQ?=
 =?us-ascii?Q?14xn3HCSh9jk1qwNZ5pR+1ThQ+thmIIkGbCi6T3+lvG0+SeX9S0wJSh/e/Pk?=
 =?us-ascii?Q?yFbM7DyauB+QPMxRxJA+5+mByYvWdy82suxRNgRIv3dOxNJFPwTYYvMr8yTd?=
 =?us-ascii?Q?zE3EPRbERpOWyWggZ1ooICfioDjmEL5a4FsekBXKli4F5VBjBBsEw8DIGaEH?=
 =?us-ascii?Q?D5Rxwd4znAriBtBmOnPwccHrUSiKnqLloFVzogy3DMfh2hZxqzY02XYn4zTy?=
 =?us-ascii?Q?U9v6KbwWswF6nPzaAS3+rek8UpnOreQoaNri/RO98qiK/SkaT05DGLbTW/TH?=
 =?us-ascii?Q?HXQ/vhstlKbla10BW7Vbnl8nV4c/s3Fj12H3dx2Ywh5S4oX325Kus7FOXk67?=
 =?us-ascii?Q?InRNJv20YiMNofcCBlxzzb2kBSxPSBd3030oCnsaNyYoH+uH9XC508c8QILj?=
 =?us-ascii?Q?Iy2bu/S5WX6P5Hf/fE79epAOoCvf4nE8GIFRPocpm9bsRMTSY/wzUuV3gcNB?=
 =?us-ascii?Q?GTwjqIXPdqLP52jhzweGeC3mBUpAobq7cln6Z4E3oRB5tqI7n7SjbxM9vVnN?=
 =?us-ascii?Q?9qhok2bUOvNjXA9lkTdf4b9qQQ/6VxIg1J4rJApQYMesKY+Nt3GdAqzCHynN?=
 =?us-ascii?Q?6CCujPjyQoOQavgxj5wiS+LUOi2rYkU4l3yGPjr7GLTFzjQNQSiaXrzYDeHY?=
 =?us-ascii?Q?p2Zk0B6FbFrcJRn8ievqhA+in2aGEwKWBRIyP3+mTH/GkJN1TZPdcMe8n1/+?=
 =?us-ascii?Q?asRc2oLBUarNv4QzykvO6mrEC7z3MgXyGSqTWevNXnt0Ta5JPiLbEZxiod7n?=
 =?us-ascii?Q?vOKz4yqXUZAPnYT421cIHRfMx18w7SVvZKkvAU/UZyTu7DLGAzvI3EbMl2Q4?=
 =?us-ascii?Q?JFo8GfLCp7JzMVcwLdwsD8JzvmKu4E/C9ufGxHHxkcyCSZLtse5YTx7n11/B?=
 =?us-ascii?Q?nWlh6gnrHiXSLYVN3cViZJxN30zYpotDgT9h/jxh8ksfHo7fwGVzePGoxOK7?=
 =?us-ascii?Q?Ysi6zbPNi3MCkzmHX4fZfmk7pWeJ4FEFbhoxWL9B+1wQrf3QsgA5GrGo5V6u?=
 =?us-ascii?Q?9+nGIQVkPARKRLAcdSTggf9No/1aLP2t3KolODbJknI2MCh50vtMB9lUcz5l?=
 =?us-ascii?Q?xSGPlGUcrE5vG59gGuIAhkZcXe9uaiDlj5koQiAjjRO/m5b+fimd9LRmacN8?=
 =?us-ascii?Q?iKa8AravkHER5kiuQTFnnWWyWyE8op5Mh2DLpolBGLIdi6Y/OWbrwGcRXl2C?=
 =?us-ascii?Q?8HW2sSXRXPh0Bi48xBRvraqLgUeZWAliaqlE+1+s4swKEkvDMgMmnXuGperO?=
 =?us-ascii?Q?PfJOB7Km0GsIKcKhcPAzGSFrh55mepeRGxxETWAZjaZKw5YTadeN1ww8cQWU?=
 =?us-ascii?Q?KU6GZ84wg6+pbza1Hgt6b012D6Fh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hCIEtpNVrZPrCpxSF36I5qPObFMwTkonsh6Dg04n5QhfUsYSVL1jNj1sCsNG?=
 =?us-ascii?Q?nnJ0kkhxzUFDzleX05jj0odFUC/DXbSeW00mIUqPSvNfEMSaQs5DF5K5EIWO?=
 =?us-ascii?Q?BqE98ONj/T4srl8lncTtzpv6MF9W/hLlKckXVD8btjKO+FKoCGloZ7jC3wbM?=
 =?us-ascii?Q?NfiQCYWIVpUyOr5HPdS/+s6KRtQw3Jjp+LCC53zbc3IGCPc+zO3VDlW1Ta0B?=
 =?us-ascii?Q?6di+pt0TivKh0OPMbOKOZzpUIBaJvpv5O05CJkSDK8MRhdJ+VRlCIDznnqMd?=
 =?us-ascii?Q?S71+SBycggD4gXGRv2hyiVoS0UAFhGF3n+/w5mDYVffhuxgDzSNM5Tf1PAmZ?=
 =?us-ascii?Q?nsWFu1aDjdekpKdiv+Dru2Hbmzos9S/kBFJMYiZyA7MnZgOEEPSgP2ldc978?=
 =?us-ascii?Q?vTzw3LcKm9QTFADAguVWeBfi+EPsj9swwtMT75Xm5hMbwxHdkZxVNZwaWMnK?=
 =?us-ascii?Q?wmwB9I5VC9NgqVqMSUcQJzQ0HTVJtdFtKiZGqfblYEMqgdoo3G3jbUoi1mlD?=
 =?us-ascii?Q?E/p4+tfdiiV2BvR3Wpl+Cg3WTDFdPA1zas5iEbjK78Hyk3XInN5ps0qCp/7i?=
 =?us-ascii?Q?VxN0G06SdAI/qAT76CK3pUxbcGR3TqZLVJHsC6HHzyq2X5+rIypGSbvHTLAU?=
 =?us-ascii?Q?TKo1koXl5oskHYaQd0ufi2p2CDvO0ytK9MOxhdxT4wi7oC63obSLry0F7u5m?=
 =?us-ascii?Q?Z2++fw1/quXC+Dp1wir0UQLPvAQ4+pxfXrtgrUbOZEvrYut9yzoLT/r19/52?=
 =?us-ascii?Q?oaZPwYDIf6DZ/p+kluT3E7UfFreMoPJt1NK0YswM14JtPgx5d7ev3WZD3J8L?=
 =?us-ascii?Q?/gAb/D4mBKClZUrRG1P/rHLUkT+vWkp70fYDMxGuJaXioumB3XVZPvHLXaFU?=
 =?us-ascii?Q?5wAYHeoUZCzICzWI9kv3uMa1Je+pSQyNyL9XY75D+NyY3Vmygo5td/5xkw9E?=
 =?us-ascii?Q?DcEKqvnreNxamRr4hzvvkDn9LCzL6JxfJXxA7NxawowO/poVbq0I462RzeMV?=
 =?us-ascii?Q?5uLyheX8qp5cC4F3nKem/vg1vOpocU8X/6Zxf9xuAJFZgKMIKuVoA4paXXVR?=
 =?us-ascii?Q?vu9GGPYaksl64MnLk9RrGIiHDIVepyknYam964biRwmB1q8oC4eLGwTadrtq?=
 =?us-ascii?Q?eocV1VEh8CJwtEkwqEKb30TlvXuiPFJkOVgRLlEd0DmdflwNeDYdUKF6bG1/?=
 =?us-ascii?Q?GhTNZlgPC11NML6nmbLp3zgTjwQAn4g5E9smtVkWvBoQSsx3Fxrx/6ckRZLp?=
 =?us-ascii?Q?o+7GszD1mMFKmbdfCJuaZw4wm3zG4Dm1kdNjfivAZ4uqW+Q/5CRhwY3qoOZ3?=
 =?us-ascii?Q?z4DZlVQxCsNVs7C3t7mE09HZQDY8X+QEJyBrvvwctWF8QkHPX9FE/lJ4OS7B?=
 =?us-ascii?Q?htdwbAwCcL7rFIR+fknFygOuxVbyiaNrkXaQ6cmADtQUKt3NZ/adXglNN/EK?=
 =?us-ascii?Q?IbDHF3s+EFLX2tRMNVR9c3AY+4wipy1bB9Qu+f6iBDGO0vfRtlKcsJv0+IRm?=
 =?us-ascii?Q?54WZMpG2RBc5yL0XrpTK7gz4qRLxpJDMMB+Uf+UHAfXJwKOGobFjJMDGfkAR?=
 =?us-ascii?Q?IjCqFSODyWMi6xcc/9REAvX/yyR5MTgmBJYBitkh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qxSebFd3WI2Vpy4mL/nElJwUjdsR+Wehh4kQor9iNYke+Qbo6RDp4O1XZ8dv02tr0rp/czKu/8QCoECp0IsxlMVmSBQcjLVtdTjOh9+b/l8r+0TBzMx9MjtP9Jpg0RFa45TLUSumU6uX3ilLsJjuqL7F6L7FBlcJ46QPixtzZxS6MNNfRznEsmZRqfS2tC3FfTjrRO/3RIQmgL8RACEPVjS97wxVE7D62nJHOKKMT5A9eEQmsNxBiEPrPUi07kIDtb4lX8xblz/ovOb9FC9oTciBu4Lh09RrRqqPe3zEA4KffWoHPsXEt23fqI5SrFyKr8XdUhMsOy+fB3AS07pCzgVHN5hSs/MYmFxM5VTSeqAQ1pEFiwBpuaqKwTitEPPjMWLzNEyzu62/p/rsoHDwzDWz/aHnOIvcNHkYsDgu1YUdbwDW5DDS0TE9DpEva/gJ4SMOmtQKIjnrWuIqE9YB4lKOKSZ/IDqOpppq6jzSjZwTwsejalilVZL6E2e3ETa/emMExAtlcN+WkyGuyluVfW2MpIm0lBiOh/uiB5Pik0EZ3oXxwkVvZ7TZ9zZvTZf3Gq0cACbAx+76EVA7KXIKLRupkmzLOmMazOWuHtQAfGc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a7bb5b-2c76-4597-8c8c-08dd7770c2ae
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 14:13:54.4392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GISxC1AiNd6fSSAUwmSfPDPm/5ZoRHaJoIcMIBhB592yT1m1P4aQBz7xgkMK1Kal3EJI6bbxf71SZjJfarrtXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6358
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504090088
X-Proofpoint-ORIG-GUID: h_86K4_7fVYYSObscB5c7fa7sMR_fFJZ
X-Proofpoint-GUID: h_86K4_7fVYYSObscB5c7fa7sMR_fFJZ

On Tue, Mar 18, 2025 at 10:45:33AM +0900, Harry Yoo wrote:
> Use SLAB_NO_MERGE flag to prevent merging instead of providing an
> empty constructor. Using an empty constructor in this manner is an abuse
> of slab interface.
> 
> The SLAB_NO_MERGE flag should be used with caution, but in this case,
> it is acceptable as the cache is intended soley for debugging purposes.
> 
> No functional changes intended.
> 
> Signed-off-by: Harry Yoo <harry.yoo@oracle.com>

Kindly ping :)

-- 
Cheers,
Harry / Hyeonggon

> ---
>  drivers/misc/lkdtm/heap.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/misc/lkdtm/heap.c b/drivers/misc/lkdtm/heap.c
> index b1b316f99703..c1a05b935894 100644
> --- a/drivers/misc/lkdtm/heap.c
> +++ b/drivers/misc/lkdtm/heap.c
> @@ -355,23 +355,12 @@ static void lkdtm_SLAB_FREE_PAGE(void)
>  	free_page(p);
>  }
>  
> -/*
> - * We have constructors to keep the caches distinctly separated without
> - * needing to boot with "slab_nomerge".
> - */
> -static void ctor_double_free(void *region)
> -{ }
> -static void ctor_a(void *region)
> -{ }
> -static void ctor_b(void *region)
> -{ }
> -
>  void __init lkdtm_heap_init(void)
>  {
>  	double_free_cache = kmem_cache_create("lkdtm-heap-double_free",
> -					      64, 0, 0, ctor_double_free);
> -	a_cache = kmem_cache_create("lkdtm-heap-a", 64, 0, 0, ctor_a);
> -	b_cache = kmem_cache_create("lkdtm-heap-b", 64, 0, 0, ctor_b);
> +					      64, 0, SLAB_NO_MERGE, NULL);
> +	a_cache = kmem_cache_create("lkdtm-heap-a", 64, 0, SLAB_NO_MERGE, NULL);
> +	b_cache = kmem_cache_create("lkdtm-heap-b", 64, 0, SLAB_NO_MERGE, NULL);
>  }
>  
>  void __exit lkdtm_heap_exit(void)
> -- 
> 2.43.0
> 
