Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363A925A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359691; cv=fail; b=GxE8+EWCq0hU9km8c+DyQqq9lSQ1YvYe4Jw6joBEuiN7hHZgrmFBdwQookNJAkMYA4os/YWv/ofgtoFoevN33sS0NM37OsGexzBOWU3ib3BY3vB4vKaPepRWbg+IWr/79Q6Gr5fpdwh5xOGs4QalBJzEToJQRn0lcPgf2Nx6D5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359691; c=relaxed/simple;
	bh=7G2lp2oeRxJKY2ne6j4TWBp8ZhlozXKIlpHdCdb5bS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cB13xy7PBFk6rTsF4zi+UkTkIVOwqsPQUdZh6ZAsTBH9tBFJWY175jnJXWaf2W9OwMa5yGlipuxfePyErR/3LhY6u1hfhx/VjO0JZ/ppOZlw1/OpMoqdmtEG3G0IhWZ8UDRQLp/hJbK9n0J7AFPK/85Gh5scnvw5ZPQiX+R6bUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KUFzDWmc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SIgIS6cI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KUFzDWmc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SIgIS6cI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCjgQc010116;
	Tue, 27 May 2025 15:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=A0WK5rVK392XyjDGMx
	cLJVTF28Qt7mF3LXFa1Udw8X4=; b=KUFzDWmcet683NwcjkYGx+koUpCKYISsL6
	2eiws4W7n1e5rEVrGR/M6tMH16RyRUAm047Uw3oybEJQVL/B/Hs/CaQIDUQOHRhx
	zmFmOpEYzqSHNYOmzQeQ4auijYPVakCy9mDNjrcyjVmFwSqSw9ZOQysayZgbTbh9
	0vR2INqO6XoQcnrQVhLb4zCWzaOeKvhXxW0WUYVEcCQIAV/tCLzcsaTsoAHTJfGl
	DBmjkW8LCh04X9AHgjp2UWibZejm67/JsL/fKnho1Yhwd+bvcTZ0RJBkgEobxBCE
	h0ZviF9fQyCxnb3zXrZ+7nYFC9jl8pW53+7SA6S0y0nG3BCFa5vA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pd3d0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 15:27:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54REJKPl021081;
	Tue, 27 May 2025 15:27:37 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jfh7rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 15:27:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9Fkh5XaC61B8w4w4IijFXz2AUwPtbCC7mYBLmMmwm59vPxqYmMBcqTf+PGifD3NNW8v0oTBvSaUh+alVGtGDUVCEDY8VF8TXQzx0LMoJ53+lwA5R7ce9A6mVWb1YSypXFnO4uZkbL0l1v7ukm92X6K/PFFjN3h4soVChe6Ae286TWILaobfI5nMVZUNSg7UoGxdm2fAAclzKuPro0YOmu6Qo3IE8XAey1IRfqd4KWkRwHp/2G2cUoD8NtYtIjSrvk2GSLjifEWgmdgcJIvf76zhc/d/cyzIgfXrbAAvFAksYeKA8hsvb+l2qmvE9e1qpWqnaJjGq8ZTGHDo2YA6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0WK5rVK392XyjDGMxcLJVTF28Qt7mF3LXFa1Udw8X4=;
 b=V2uiz/g0Z5WQ3ywBcagYmz/Eim2G4BgeVELCJhPpedw3HL4XIqdII0Xmx/1c1AxBh+dHTeYg/WdUVz/NVqzrNJtqxc5fX0bjKA/HkPjFb8nTno+U5dRzCWYYeAkBrHHYYBlOtAt/Z6CVKnQvxzpOxuBg6wSHHGwhye13iOiDTnu8T9g/szm2D6og/Q+oBddO0dO4OuwkmrJPevUyIsKCNQH5O4tU3b9zLd9sZZQqAmBBbDdK8jJNgEHbWStLXWg8tOSn3q5cnAEKWjsPEpMbgpUJULMIUAIFNi5wxkH/V4kzTRbRIndsVkNeoNuVetOmJr11xcQou+JYCL0qoAnL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0WK5rVK392XyjDGMxcLJVTF28Qt7mF3LXFa1Udw8X4=;
 b=SIgIS6cIJaCfHpPVCx6xfM5maJO0rgiBdw/5mega4szqJnfcxFYx9FW9jd08gdBDnJNtaj9GHPrFaRjplPGL/BZ5K3tT42ttKKyVt3IbUKWASQ35wgxfp25NA6vCm8VN2vAwepqvytvJutUpJIDZ4BIe+tmU1P0cg7OkBHob1QA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7137.namprd10.prod.outlook.com (2603:10b6:610:12b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Tue, 27 May
 2025 15:27:26 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 15:27:26 +0000
Date: Tue, 27 May 2025 16:27:24 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org,
        peterz@infradead.org, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <f2bb8d6a-d131-4c12-871e-0bca5dbab253@lucifer.local>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <cd02ea34-0675-4324-aa84-2696e834d922@lucifer.local>
 <20250527151715.GC8333@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527151715.GC8333@redhat.com>
X-ClientProxiedBy: LO2P265CA0202.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: a803e72f-4057-4490-ba8d-08dd9d32fc7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z9mvDxYR37qiGOzvcieitAEkQBjVVL9V29HlD3W1Z33Ubk8pem2tNirbEUfN?=
 =?us-ascii?Q?S8Jk1saFn+/p5RIRxJCMpgx67xDu7sICpdW94wGTFje3ali3rHuh2ja8nICW?=
 =?us-ascii?Q?Ol9RQ0eJSD5/D3Gj+3qsERXCJfzRQ2XlNetnmtEJTatZ8k/osZZ+DHXvhn4L?=
 =?us-ascii?Q?TRtM/LlLvcQsyaGhVRRmw8KDqjhs6cPAqJ4MMnWdeZvBfzUjMYDw+13TI12i?=
 =?us-ascii?Q?iBbZN7EEb9CKAxb5jz8mdUVX95Ictdlo7ZYHn39gA89gpw04aV5oJe5ztmD2?=
 =?us-ascii?Q?YrjAi+vH0TLv+rvZwq2iOf8jAWi/Yz8qscqkIkKMnfGayvtpHqE7+5BQl6cj?=
 =?us-ascii?Q?DU9U8zRyqYRCn0dq9xA7xxthsEiIXzUV2r22+C1TzppCffDD7QB1AbmWtuOm?=
 =?us-ascii?Q?DUQhj9ebOkZP49lSCx8OGjBuXUyiuftze4VvkSPXP1BiRpUr4H1/tJ/1rRY8?=
 =?us-ascii?Q?jm81noW2BFRYUs2CY1a4Rd+g1fSuMHOUlEI51tCGtxw90DlWWg9Go2Bhp1n9?=
 =?us-ascii?Q?OztPE6hvtlnZKlDZeAQ2ntR/WxxirGoHfDslcl1uUmQZqaXR16XFpAEsA2Pb?=
 =?us-ascii?Q?j1DD6DYPagKqYqEvVBnp0O06svsdG2BHEpMBOQdAB3urC9BjuzO2C3KmDWjH?=
 =?us-ascii?Q?XNtXVUhoRMFSIMVfoh3Ma0R8Eywgs0WS6WMLSWIxbVhpmdOIF1tNsapCj4Fn?=
 =?us-ascii?Q?nKBR9OklsFieX8cgsLzMWijWXIvYFSSbswZ6Tv2nEAEW8VCTpVCB3nqMy0Kd?=
 =?us-ascii?Q?1Aw//i3zF8mgnfTsbEp/7wxO4i51PE3rF+qCvmXRQpEK2l38fOoO0hIH0gSI?=
 =?us-ascii?Q?H10XiwmbtJDLqspy7s+ySuICb7Dc39zANuUDHiC995+8E28KVKDRx2OoQqXd?=
 =?us-ascii?Q?kKmqR0QdZm9MvK/L0TLyOEnAEj+H3v7a59/2wYXmng2zK6+i3izzVWk0jV2Q?=
 =?us-ascii?Q?9q+07dkuLJE+eA7VL9db1qNOldfp4A1L2vwvEuBN13ZGPFHTL+2CsawGcRaP?=
 =?us-ascii?Q?bjINfk9FHdNHr5cmu5136/OPEnZ+lkzfZr+R3qsj4zNLsNPaTraCh5WvDpl0?=
 =?us-ascii?Q?NZZqWEWL+2c/ZIJf4DW4AiBwdq2VS8xdDATOK5PDIVY/NqcNH1QBNlwwo3hF?=
 =?us-ascii?Q?xXOUPOjD48gfkImrBwDIX1U4N3mAxij89waE0pF0Dok2R+RFKW/X/Qt2hCja?=
 =?us-ascii?Q?BoLIk5T1q7eSCoPn4SNa7kEuvHOH1/Z70Lq64dvSd7zAIaqu+7YL9DOVgOU4?=
 =?us-ascii?Q?Vuzpd6Yh1ksJN1bLZJiLyQaI0N/kB7wqJ/IP88CnqOUFWHXXSKVEvA/Krq32?=
 =?us-ascii?Q?WrunGVgAimQEgZWmZjyE5bI/Va3x0CZRcyh/Y6y6b3AN1TOQKjtsqe4GjTnw?=
 =?us-ascii?Q?Pn6bGwkIS6JNSty9hNeqeGl0vWHHcjNrUkfkdbxQ/qeD/iiSefkkgnj13KrK?=
 =?us-ascii?Q?7ugkEqXKKAA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yfKIXQnjFxuyORHaRbIRYk03Zlb2+EFFhpb3bT4MdJImjbtLJYcRztq4QVjC?=
 =?us-ascii?Q?a3yEEpOvVfHX6Pe4cYJ1I/a109HL8b3xcI/+shF8xqD4am2Vzqa8aS+WjxcS?=
 =?us-ascii?Q?xcrindOOSTCxjMdnyXZKRPkAV5SMufmcNUcbouXpctCTP0+NnmHa+8s1d5Et?=
 =?us-ascii?Q?L0ETmZJioWxmdC0CY1khBx7QHAD4kjKnOChDTHuNvRvrg4UTZjc9CjXBFzTL?=
 =?us-ascii?Q?S/Jp2ohyIn/lg2Yq6nEoDVyUF5x0swMNoH8mZXxsy7nEX68lgIWi0LFZphR1?=
 =?us-ascii?Q?8AKS5uSFyfOuowxDvxSs/j0O6pSMaUQ/MKtNxqSNaBEhRLYNdl5imRAEKLzt?=
 =?us-ascii?Q?h7fGrtmWkizGi4q0lnITvtXeqEbMXROrRkZ70zTpT92zGV0+LjfIrzXPmcRt?=
 =?us-ascii?Q?8DrQXMUpTrkL0U/WQHvahN+X5K7M08RGrcNciJDs3nf2VD1GjHd1vrnfkbc+?=
 =?us-ascii?Q?ixNOARo/OyTb1wDkD/eet+tDSnzy29cgtMibUN2eaEJQ75cMTtyTasa7Hhsd?=
 =?us-ascii?Q?j37ovroGEv8ZoLGMIHOcOpLn7ybgUKcQ8X+M99Rs6scJ08+bjIEdzOgtm53O?=
 =?us-ascii?Q?CYa6OBSZviwB2d3+guXbGFzM+Bm259C5zGfxRga16ug/Your1L+1c29BxGH9?=
 =?us-ascii?Q?ogq5BQ8zGWgPbOCzwBGpXoE1mdbXRPL4smHfkkmnACY20RNjHOWeqwyjMzlK?=
 =?us-ascii?Q?Hmw9T/3r/hDEK1NYaEFI0zCWV4k5PnASXlfEbSJM/xV6Qs6aw4zCM1DkpmnQ?=
 =?us-ascii?Q?ITkiU+MfDl25STBxNcU3+ORXlkRFZG/Ik9u9ugumpQRxotyIJlumQvvrFq1l?=
 =?us-ascii?Q?W98zhMc28E9k5f81Z4U5rr8AG0BeRheikF/XLD7Fy5N4UMSDnLIm9RoMCxyp?=
 =?us-ascii?Q?FDiEzolzHcwRoKsltAPVY9Hw4VUpFDkKVpKEvDuSjP6wBzZEM2TOoqf8aIYg?=
 =?us-ascii?Q?lsux3Xjf/4nl7Ko70nHG3hReLn7m9LQIOUAbskSSYELTlmfSNwXHqXCQlS/E?=
 =?us-ascii?Q?CdJetdJwudENT4NyGdgxzWEzXR37lD/nGpR996Sk6TLOSR7kW3ZehiNv1JJ8?=
 =?us-ascii?Q?32xy+BgsGnb9D9f4yxTUXgIsyOLHZP6cBPxDGlYBQfVeNbZ+zfC0u+mRIGDl?=
 =?us-ascii?Q?LRSCU0O0JYarnzRgPWM/PsB0NQVYi4+F4NeokKds8KEr9AhFUVtAn6x5BHId?=
 =?us-ascii?Q?SfVf1PYWqtUg9E3hsQxnJ47EXREHwZeyNv6qX5mhbOKpbEL9BPpEnvVHUhI4?=
 =?us-ascii?Q?XMp3rNkoHrE1/KOADJy9sQEbsALpowu5fYm8Qp8mdN4+0H63mHsPn6qsmjRn?=
 =?us-ascii?Q?IctiBVbgXESGXrNjZ5c0r+yJMAQABSsNJsE9DYqPM9IhEa6FIuytL0JUWIWB?=
 =?us-ascii?Q?1QdbKwF+fl6BsaOs8JMJ9U5C2UPAjPL+FDTPa/PJEGVP2sFxuPf9MRNbOTTO?=
 =?us-ascii?Q?p152ud8JCT9IR+Hr26qGly79NffPJJgRNaObGBK92i5yiM77wk4FxGbcTCOm?=
 =?us-ascii?Q?bR5RkfR2hHHcHyDTXYOu9Dhc1L/2MfScw0YxlsZcEukUKZFfB1h8gBCpfXEt?=
 =?us-ascii?Q?hXBTOTzQ0pEtiFJapJtPIjwjVew4Z2fxHKfgj1Fp7mtVFgIi1qOrwETADdEZ?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CwygPPLUtnSx7Ag4EyS9QYXzAYJwtw494vfUrwuYUdYxaxAisalj8s7wnm7pa+rv4Nk8tJ6NhHlj7Jw6H0OkaKp/48VngrzZKezb4+Jt4xwYgVETSYGknJvMrbAHPagTWDZa22zgz/5lD4KaaFpqAo5matCJ5wyMQyMsANrPioPUsFziilCMVvDUbN8HbuodMPDdTNfUpmJYqneDSjzPOxUNDiWr8rT8HMzfOSNc+mQQZPMipLBCcTAl+Yp2WpBY0uIx13pMAwWyDcUYjM0OFd3xsHvC/Rt8PDaBdnrV7jp4lfZOE6GgqH+V8JyZ3DFCPP8nORy/oZ/peGcJ9V3dclZpEUfN6tEbBKEuPSZPr2sk4m7DdriY4inHVMrd9BIWFbSaMYMBqw01GTEYoj4BtliWbFTQlcAWLtiUlHBPD/mxZk+HeFCj5TSjIPZqp3uyVNSa1oKME4ArrroNSagXo7S4pDHNz9Y8xKFEWWrpFmKqD6MQ9cgZCzM7lPOycn6DWDr9RYzmAOdFyZvdjWWMygSebH08Dg5BRKRDACdSno4jPurfQWTOHW1H4z2ViZccyoCRAEz4+4rI4PgsSu7QSvuI0L6YGyXbta1LYnbA96Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a803e72f-4057-4490-ba8d-08dd9d32fc7d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 15:27:26.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gms44BL7NdGsL2G/+cJPw5h53dtj6nEt8YEmVa7T2puHIJifyjocHXuQ8Kzss3hezD3tBB8Qg0VnGt2BYn3PIqsgLRSSvKaeeesZuXaVXik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7137
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270127
X-Proofpoint-ORIG-GUID: NzJbukylRnPhYOB3tgCctzoPceBSyFA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEyNyBTYWx0ZWRfXyCD0zxiYE9cH UQfH8DfBJNQVmufSuCbZZUUAL73P/gF0bcZI3M0zLDGTZ5VAWfyxl2YyEzulIc0C7Gp2TwADgpk tVyc19ICvsD7TS5x59HtcRC27BCu/hYNM3tHHthdGnlVD0jlWsyxnFQOyKyqtgrUmsHkN+ZcpS8
 /eyyTXMMvttCfQTYCr3NKMNqAaqiOfYR0PHZ2Jc8q/83XOyyVivg5jtiKudLF1jOKmqA1PIVDjf QfUKro37XXJ7XoNM9MQhV7CMsr8MeWWnFFYVrHnX+s7IKIk9/Je1HFWvlmDCtfqN+Z3003Dz3KZ RzQ0NaT6MgtH53D+Q+ye7wJ+aVY6GsNHHV51XDEmh8WYtbcr0VDD0/L9qkvz6Ql1ToLS93Ej8+c
 AW15tdz+blTruGH1DL+Qs/dBTLxKCCO+Y9K0Vc8nvnyRJi4fPwdm0Tqtdmeo779FsklIdf9C
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=6835d9ea b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=OzU0M40LdVYuP8gBVuoA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: NzJbukylRnPhYOB3tgCctzoPceBSyFA4

On Tue, May 27, 2025 at 05:17:15PM +0200, Oleg Nesterov wrote:
> On 05/27, Lorenzo Stoakes wrote:
> >
> > I am by the way assuming that uprobes work by installing a special PTE at
> > page offset 0 and only in the case where there is something installed here
> > do we need to worry.
>
> perhaps I misunderstood you but no...
>
> Basically, we have uprobe_register(struct inode *inode, loff_t offset, ...).
> If / when a process mmaps this inode/file and the (new) VMA includes this offset,
> we need to call uprobe_mmap() to install the breakpoint at the virtual address
> which corresponds to this offset.

OK this was based on the explanation given re: zero offset.

So presumably then this is determined by the perf_event_attr.probe_offset field?

OK well we can drop the vm_pgoff predicate and things should still work because,
after the move:

            A                          B
|-----------------------||--------------------------|
| VMA to be merged with || VMA being moved in place |
|-----------------------||--------------------------|

If A contains the relevant breakpoint(s), then they will stay in place, as
move_page_tables() won't overwrite them.

If B contains them, then the new mechanism that prevents uprobe_mmap() from
installing a new one (orphaning the old) will make everything right.

So we simply take my approach, and drop the vm_pgoff condition and everything
should work fine :)

Obviously let me know if you see any flaw in this.

>
> Oleg.
>

Cheers, Lorenzo
