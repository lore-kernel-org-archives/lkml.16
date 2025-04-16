Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81771459F7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808960; cv=fail; b=rqivmM3+yGLE+7cF1za/5iK9/i4MvIZy8KrAV5SeyQMoGcasW9+QoJdRbVYN9z6jqCjYAhn+tIzyfRV4Y9zzCB3FzEq9tSWC4fFkryRgm3P6AdjDcQG5MfPOJGQDlV3oo/fN6DX7Y+0MoYVx+PT21ITyWFRJ8Gvc/p9+CjUyQkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808960; c=relaxed/simple;
	bh=t+qi0OfweqofrA2Qjaw0ifrDzkH+2/SMtciyCITz/Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J4B5EKYrcQRG8Cmvm28muNm7Yt3WzNjybtZk2YwgYaNmA6pwW7zFj0L9gsL/cx5kR9xCkFh0M14I0+euGL8YkKY8O7eFeie+HN6bOxIs8DjZX6zq9fL++U9a+Ionac9nYHkRgG+rlqdJef9V0jL7Snbd32y5CaGtH73/oTaFaZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fj06+vxX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H/iUiqFY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fj06+vxX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H/iUiqFY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GBTJBO020760;
	Wed, 16 Apr 2025 13:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=PDOUKS5gVoz1idgG5t
	8OduwxeKM4irXc8aXk8H5dEYo=; b=Fj06+vxXoSdpLXLFWjLfmeN4bLn8fYP82j
	Dt4tEJqHxId4hyRnoHIvGHpKNVhVRXPUsUU4BtZD/9SQxKyywfGF3nz/vnuvPATK
	p+esfsyl9lr9gtzp588sWWb2d2aGykdMDfbo2VBAtx72QgcoOr5eSWY03eVpi0dZ
	aHyQn0GONL4SM9oMS+vM/eyXKfvm7gZui+108BBnM5pLfC/d9jCQc97IEW2LyhTM
	e4GaFqff7WNEOzbz5fBkA1hvML4R5IaRH76QgUhZKb94N7YtnX0QLOqQ5pRAe9Oj
	ykMtWoAPZIGgbKSZ5MDNWZYRgXkDBRKA80KB/e6bV8UGxuPinU5g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617juc3yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:09:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GCKnuf024716;
	Wed, 16 Apr 2025 13:09:00 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013074.outbound.protection.outlook.com [40.93.6.74])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d51u023-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:09:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+b9He+QangTfKk3/49ZlXS8iSCnABkmOeWH9TWipppZ46RFw0Y1K1i7rUrFAL44FEj8w8QURME4KGVwU/+JJQVkjlK8o8LAfiB3UdzlDdaiaXTedRJ/jiaV7wt2CdCk7Q3qMiTnMo2IeTb5OJxW3kLdQwHDtA80BJMM0PJ0HoJ3XWlKtZPZCsZ4RjENW5cT26nNsUCCaA6LjPDlGZEsuWCAjrg9dpHb2x64L7JkQOlpcmVvK7JHNL8nlhi6qhSiSL4j7Zhgq2vbAARXTKu9KMg8ql7ApTw+X9SQbGyOA+JqA+PH1UtAETEk+xK0EcIvvlGts2wSiTT0CH/0VQvGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDOUKS5gVoz1idgG5t8OduwxeKM4irXc8aXk8H5dEYo=;
 b=dw0T73aFHDoVenj+mIQhxGGo1hKXOK7C43AIdJKjuUmAXSsyRaDIth/juacCgNLjnAvi6Wx9cGlDmK8TI60CvRckMwR5TA4gGVYWKETziAfnTRwjrn7ONvc33Cw8PVzWLoJphR/PiW5N0FviUgXEnXPtuAnObsmCeeTb8a0ty/F/AWsWcuf+3nS60q2/1I+s21H3b2ncIyqnWhBSE90EBlymSQT5Q9e1b/Ci9PRxhVg6x3qlVw4WAULVyLHNI5HrgTa6LmVeBFSao+rmgtjFIEDfIuo6ukI+zW6woy/kbj9s8x2i7upPe/RIozz9kmRRvsGOg7upKGoJpQVwVCFBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDOUKS5gVoz1idgG5t8OduwxeKM4irXc8aXk8H5dEYo=;
 b=H/iUiqFYAcBqVD5svVK7iVskigS/hFL+W+lqZVJzJvNiW/Vab424oCiC1avY7DgKp+WIDFlPyBH5y0/bekNAijdzxmul1Ypta2I3w7ghG109Osr+XCEhtRJiwzqlmKDPukk1FASjdvLno1t79ytzt7UVvJLtWeuuJ29Dh8qfzlk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA3PR10MB8664.namprd10.prod.outlook.com (2603:10b6:208:577::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 13:08:57 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 13:08:57 +0000
Date: Wed, 16 Apr 2025 09:08:53 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
        David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] MAINTAINERS: add section for locking of mm's and
 VMAs
Message-ID: <egkv3aien6thoc523t6h246fietdvtru7fmqq3nscmqhkdcqzl@lknxd42navmz>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	SeongJae Park <sj@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1744799282.git.lorenzo.stoakes@oracle.com>
 <e6ed679a184ca444b20dfa77af96913fd8b5efa0.1744799282.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6ed679a184ca444b20dfa77af96913fd8b5efa0.1744799282.git.lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0336.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::13) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA3PR10MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 8089c48c-f900-4d0e-2afe-08dd7ce7d8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jbb77kl4PMXWw/c1aqqGk2iGjejvBawSgbTQ9QTF+DiVWYsPXC0nMnF9FM2+?=
 =?us-ascii?Q?o9URU0CkOINUDBCGj88SLRdHMYJGQxNy4e3nYaEc7Z3488UOY8i9KB2UVY9P?=
 =?us-ascii?Q?kUuPsI43P7izdSMKAHuvUpDu3p1gOFDCJV35loUWpn3xLYF9v2Xo9j65oUyS?=
 =?us-ascii?Q?8d5dteDIeszJ0POQ2ejG9aO1YB/vfh/wW8X9hFgZUQS3aB8bCq/GDuljIuTz?=
 =?us-ascii?Q?VNGlLb1AJCIusM8zHUW+fNqK0t3f3MZF2OcJ1dUds+r6DhQ6tkQqFFDAQwgt?=
 =?us-ascii?Q?2J8S0HIA7gCUjJRBAwbfo3ayHGGvqiMy7A6pvxWFh3/B7eSo03CGClWhwO6v?=
 =?us-ascii?Q?phOdTRcwtg+UmkRaJvldKQS8jrzSxPGPxFb/GL14I2vcscgAxaxfgcfi/zbc?=
 =?us-ascii?Q?CIwv8ol3dqyzPNvaGwbqa+MQw9k5wDwDB5J3cGSWBGEaH3bh8E49obQW+icm?=
 =?us-ascii?Q?JACiwsG+9Hi28Y6bkhhPecN4LkDuUKD+avTT+3fkhpIItlh9ZbvjnYnaaUKq?=
 =?us-ascii?Q?htY2GHjnDdbZmBZfvToj+dEoF9z26pDnn/xy8LZHqjmqpz+tfyZk59cjPz07?=
 =?us-ascii?Q?mq+yjrzU4X6yzaojdHM8OUG0USuRr03rVJShNOVrL1ap+k7c0KX6xDVGRKRF?=
 =?us-ascii?Q?G/ZdD69TmLHr08S+SGJfUyV5UzASWRU4p0AevdCDXcGMPDCJNjRpUAGxmqyd?=
 =?us-ascii?Q?IVpY3+RLbZJllKmKBd2Kc61MJmW2GgBLsfQcMY9Ybr/ROTwel+gcrkqji/5P?=
 =?us-ascii?Q?JrWwsYTen4Vqprnx6M7qCNGJkJM1seqxN0Bu0N6iqYF7bW/DD90LlBMT5tUQ?=
 =?us-ascii?Q?QvFIayejc+XDnDF9eBuZJqC2NLNpwvD8xWuNVYhqinJ+XDLefDfNQHNetJzT?=
 =?us-ascii?Q?LmBXFzs3yFljB0UgK/+JuwPV6B2gxpu5Ux8MpWoMMsfYIfWqM1gyzM2LIE2j?=
 =?us-ascii?Q?+q/ef+uiVw+MUxX4eaebIhKZ9cCUJIx0RS82zlQyLzskn5IDQ7UAaza4bib9?=
 =?us-ascii?Q?d/R76aoS2SarY64sipW8RbKnkm5hiY8jBRpbVRoZJbFDTDRqP84ZVfc5fzna?=
 =?us-ascii?Q?aB8KPDOWzGTaKAga3VyRlzveAxxQ4mgtedmPH1ETG5XV0VVLkPipTH8QPJks?=
 =?us-ascii?Q?A0d6H26P1yxqbaRhSxSf2rbh5zgUBSBpKCRQOw0BJMvec0FbzOzZ/0JGh6wL?=
 =?us-ascii?Q?67cxQej/WMYXnJNyQPD/vDEBRjxsbPabbMsW+YCyV0ee+5g+bwn/CdDT4V9o?=
 =?us-ascii?Q?A8mxkyv7J+1qoLDVMRhVVZW21qV9zTZe78AXCgq/UkGbdkCJqv6HgqGVIxDj?=
 =?us-ascii?Q?6T3nx+AaOyCTpe+BeMRnUIhFOjCQG+fafyUzbgzgIFnc5EbIGqeoOt2d9sxN?=
 =?us-ascii?Q?ze3Wfp8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+IR4FgbBZ0LIZ38eSV1Q6SBXB/81pqH3k11AL9tdRYVeucsmF81WCj6frt+/?=
 =?us-ascii?Q?KcS06/kPxgc/kWueO/itL/X+nIheR+qNKgK00iglxja4GkEmkgNVNFk41fMl?=
 =?us-ascii?Q?R/8PGrRiyqrDRY/XWaxPIZYcJ3bJRGVJBkdntzAxMWv8appOVQaXxZigvpgi?=
 =?us-ascii?Q?z6NUUt3iW+AkOcAL3cYfUOOeTFOkVFDBd35AMN2imc/IMZuWzfpEMob/TJ2T?=
 =?us-ascii?Q?zzPeT0odEA6yAqmoW5cPcmb0nAZHoTyUqSloAYOZVJrNH+a+fjd4qamp37vh?=
 =?us-ascii?Q?5zDjoy/KmExqQhtsVj7AwcgMh8DtAtFHoCQPMlK5+zfWb0StW3YhEpRA/NTu?=
 =?us-ascii?Q?55GbhwNpOOOnnLfL0VJ9xcO0bkIynF2hjPMz85/9erKiC5Abw1JkNpA0uyWr?=
 =?us-ascii?Q?3W8lu+mkoGCBPcxHIFnWKjiyzoAbLVZgwtwuOmGjJnjHMdNLUAdTrBc2QxZ6?=
 =?us-ascii?Q?2XgEup0nNBahvklabkL5YFLgnyzMEqtZdHOZQEFOyeEyGju4ZhJcQ5Qk5JJf?=
 =?us-ascii?Q?yZTrXzF+PAG4cFwcu1iZWeXNigTerMeaAQ++y7eqVwStbvd93rCjZ6oEG45w?=
 =?us-ascii?Q?dOj7L4Sgi87fVmSj7SNU5GsaFx/5saawCP0W4oBb97SbjLqc+StW/HeSQrOA?=
 =?us-ascii?Q?LH3uby/yL7Xydge1PFjiC1bkxPkhDqmQO0azm0EEjqbI5q9LAIhaTe/9J1bA?=
 =?us-ascii?Q?NgfGWtDwRRVuCCqI2qLvoTR/Pd0iaKq3R0bEM+Vpt7BnhEk49bH1vf2y5qX9?=
 =?us-ascii?Q?ZrOVFPgh2Zg8Gs2FcEhlCrVJgvY396gcPYFFKVBfHDELsznc/tUIZxNo/Wag?=
 =?us-ascii?Q?tgem+ZoC973bPyn+Qqbt6cmnUZQTlZupZEidLoTNqjlgRsn/lnD0kjjM6kmo?=
 =?us-ascii?Q?hLMluU1K8y+deBaDdtXfhWFy43RXuC3VKjqEBQisP7OgTl+rim/HXckjO7ya?=
 =?us-ascii?Q?D8WqI6wluaQNx0oF69sPnR7SgoV+JUtS4L+Bdw9M8Mms4utHS73kVYkiiy92?=
 =?us-ascii?Q?CxUwymAfMYSztL8LBUApVhwxNB3RHS0R+obOj1G24LrOq+1K3dXu6sIotyin?=
 =?us-ascii?Q?J0io2eR/CBb5yIWWduPReBV8KD98xOX+8bWgHsNn+zxiXvDlN3r9Q6AceNwN?=
 =?us-ascii?Q?ApTw0dVabEDpC36NjhYfK+6Sn4ZQ98R0ZTYTjxtPkcltha1z2J2QmYCCZ44T?=
 =?us-ascii?Q?TujtW6jYFyhg37KgBhBwT/YpWPRDxR6ursrxlIzjHu866Tlt4CfjjPHULNJP?=
 =?us-ascii?Q?qbqNAeT1eadF4mNowSmGn36F5OXMWUWYlhGQDBuIYzX8c2CVZowSTss8RVGs?=
 =?us-ascii?Q?Ow2ymojBfWXxPTSckux2J2/A7skJF+UCkuHdloOV4ZxbPKumf7HmAWMv85Ka?=
 =?us-ascii?Q?GB+YJrWInUbbFTqAbe8GkWyvtxQoIkTG64qrnFb+GCGUxnyTYP2aAqw7PUy7?=
 =?us-ascii?Q?gskNmvliKgEnqJKXaReQa+H3Nk46LuhLVsUvdwuetctjBE06XpejUmowKpHB?=
 =?us-ascii?Q?mK2E0kbuYNErAg1Z+IPCBtvHOpxImVQDhbjyoPMA3M+DIvWw1PobWhbnZst8?=
 =?us-ascii?Q?Ns2wnHBM342LQswhzQqNcGCLoe/+2AMi56bERLPSdD41+CkEr22VsVGpcUos?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6dEo/LpJHHlp742oJXgSUhp1mEqXqD+NN6j17rTmaJ9ImQvss7zfPdOdqlKjsLbAKM3nI1exRMCOKNn1gw/m2CGZheuaKpIcww/cgEzmrGDDgrbGCNyUJgJh1VTURNh4M1P6NylsZ/honkFl8vIWgu2TB9t1YlWFs3iDNqkSPCUA+zevbdB7hvgyfliB5D8TG34a6Dp69gbRAJWTFmwG0DTl2W/p/g993JB1vLjLpFWZVUKb35JboW19izndezck0ETQxlDg4VDnCv4z9jfk0niogwCxnv155iSh5oPtGul+Se9GF2Nms2OWcJu54XcIhedmua3ZwO0Scma50KnxJt6/e3/ySvSu2ET3vGjmSYtG0VPPXJvVJ5roxKnMEuWH6ka6ZqXbN6puZZuIpDOoEfjhBPDv5GDnvUyaqw/e2nX4o/VhqlpuW9qXRPtN8Z97vEOBJVcuUIL0ygKv9V9MVuqTXkvNGtG6XYP5GoLWEkmrGHdZP8jTbOouHKqesxM86Z0FRZUs0iKhRHZmgmhUINZbVEwhiLeN3vZzlgXTEddMVxwbOAvE0Z41Oz05Zc9pIM5ZUvTuXg3byoFomTMpnz0c3LFLAx9/Oi47DixS6FM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8089c48c-f900-4d0e-2afe-08dd7ce7d8b1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 13:08:57.2796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElKeSYSl0MEawvisqC7rSdgMz0nwiPt88h7ECtq2RyVPfvL4fR+A/pK2ZUyd5pNOL0wAd6x+mTrqbSKmteUGSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8664
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160108
X-Proofpoint-GUID: Rb6VQe0tDqyzTUPh242ymAQ6QT2_WEl4
X-Proofpoint-ORIG-GUID: Rb6VQe0tDqyzTUPh242ymAQ6QT2_WEl4

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250416 06:38]:
> We place this under memory mapping as related to memory mapping
> abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
> separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
> files, so this should encapsulate the majority of the mm locking logic in
> the kernel.
> 
> Suren is best placed to maintain this logic as the core architect of VMA
> locking as a whole.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  MAINTAINERS | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..03bbc41138c9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15595,6 +15595,22 @@ F:	mm/vma_internal.h
>  F:	tools/testing/selftests/mm/merge.c
>  F:	tools/testing/vma/
>  
> +MEMORY MAPPING - LOCKING
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	Suren Baghdasaryan <surenb@google.com>
> +M:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Shakeel Butt <shakeel.butt@linux.dev>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/mm/process_addrs.rst
> +F:	include/linux/mmap_lock.h
> +F:	include/trace/events/mmap_lock.h
> +F:	mm/mmap_lock.c
> +
>  MEMORY MAPPING - MADVISE (MEMORY ADVICE)
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Liam R. Howlett <Liam.Howlett@oracle.com>
> -- 
> 2.49.0
> 
