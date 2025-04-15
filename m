Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6954D2BE11A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731453; cv=fail; b=c2Y472ITDf9G9JM0pK0qaZLd8Jzv+mPsmjYyVM9FeJL8c0dA5dsxVaqi/Zey82+drhm5j1QBdkh2sXUjD+1JyP+NkRL8YMF1Mp/atkjliiCaVZuiNJ5v82W7Gqwwk3kEOJdB3lc2qzTavhbhUqGYwL7Tcl+E9EoNts9tesnDPrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731453; c=relaxed/simple;
	bh=TmLelPHytundCJdkY7gASPEUTtlSyppzsFP/qi36AE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R1csMCk5IgWxzKYL+90ow4X3fVpbn9uj/tbf/SiYm5W7BxnkgnKWLVXGGaZRZkYESe26S6B+tqtPLrwcg69qvbv4iwxdX46FkgE7ikqXa21mkhuPLk2P/S0hQBlbMmkSTxOycVNbvfTW2BfFy+qVf5DGHWpwfEIwLSIhYPXlHZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OO884mlc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xy1IafGb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OO884mlc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xy1IafGb"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FFMgmK007736;
	Tue, 15 Apr 2025 15:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=H40GoKC15KqdpQfYVz
	gBbIz/sXGXraLy8fhnmuk8ehY=; b=OO884mlcP5g7laBfUbiaxOfg58CRA1sb0P
	mHS9RocBwkDQrDRNghcUfs3EH0SP3wy59UG2Fw6WtzEAtxLoYdHTsQawf4yZOIWY
	McXUi6cBs9rt6OYKdWHIHxSZTcFmVhcO/flziYIp3sC5sMIVt+BYP8GPnNwcS/w6
	CLdylQmC1SIx7w6TaYT6HGIP1uWjledSBgV0L25r/hLduRzezvVUgMWCyq1c+yew
	1WlPyLMQ7JB6F2v+p8Ep0rmvuJoItEeI34nnxNyCew/O7la5jFMb4o7a0g1P3wlr
	nIxVHUIEE7miR3ZqWKTzDMzGGNsRKtT7DzVYNXkGTUBBH/a61iDw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185msxre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 15:37:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FFQAQV024695;
	Tue, 15 Apr 2025 15:37:12 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012039.outbound.protection.outlook.com [40.93.6.39])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d50g6qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 15:37:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7Cq/pfy8xmePoRxlwXTXabkc4DE50j3GCZQZ3ODX4407MdYzVQKEMr0wzVBUfTmi8BluSRcuBt2xpQGUaGeiq03GiqmF5bbNOpW9yfkFGPoXaej+FAtBJcKdmt8lDicKEZLOeZ0OgohGdNtfQcf2+t9jOPoTP+Qr0vWGbRFM0K3HrHOEFe3xSE+2hTEC5lR1E0VOEuzBiKbgWAaB9FOe2sNW0DdqoPaCO2uDptyjtTY7rBfUUrsgg1sxh0N2aGwdKa6Ghs9CC0wyOluOTGS9Iu1MC7BjPCNiKiWIGWJ0B6kIKSqdQ4chccjX/Cz2tGokPSeJlYgHNjQslYmQu7bSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H40GoKC15KqdpQfYVzgBbIz/sXGXraLy8fhnmuk8ehY=;
 b=ukWQyqhfJH+rHo0VvDG7HTYGgvEjwek4HaXw69d2mobOt5bwKhlDg7YvKqbpis/D4YLsAIYpM3WBfURa/ynuyXHp9Sn88yKpGm8I/3rtqABd8lcg3AvsPejyN0MDaiEbizT1FLtFWpsRJ1XKC+aotIUy+HEYQOiGwnImxo6//1pIJNOkNg5XGauQeYlej+Xv2p5OUbMoX3A/1zSkdDn08wZbF2qQHViF9qh3t0+YABejytb3wMuITOXo3YEmteMV4Gkv04ECwxxjJp1jS+8y0x82upl2skFVSPBasaIQy2GndXzDShpVUY4FJqy8ws83QXXehh2jJ+fsQM+jGl+bJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H40GoKC15KqdpQfYVzgBbIz/sXGXraLy8fhnmuk8ehY=;
 b=xy1IafGblWJkhdi7znr7SnX1t2oEs76U4hEdtFc6Cd7QKlNNMKoaV48tvZN+AbRsXiwP14Ilz4b7WgxtQtNnxX+VGrOeM5JBA+9cVFkdLngoFm1mCiCl5Uh3kT6p8EbaJUKJ65vBh2RatuZYsjNuQi1grPnQ507gu9qYB1NjwVI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA0PR10MB6747.namprd10.prod.outlook.com (2603:10b6:208:43d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 15:37:08 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:37:08 +0000
Date: Tue, 15 Apr 2025 11:37:04 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
Message-ID: <bxgksbw7qplw3pp7gpve2ir63oyds7mxsnvprz45fj6oadotm5@syvchqjd2n6z>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0400.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::10) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA0PR10MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f50c441-5485-43d2-cd34-08dd7c336190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mnTt2JHoeymcDuK0Ib0S6Kj2s1+4KTcCUyv6SeTpCjPbO8QhEntlXmEwgKVU?=
 =?us-ascii?Q?6GgkVHPUnDCGvPdgPdQjtjIRzM1OVkNzmsQ0GzF8VKIN4bg5uqBCNS9w6Ifo?=
 =?us-ascii?Q?+iw1n1WkaIlllUA6vis6mPWxwZwMGpl+rteNH5RD56NYmRMsx/ECCojOLJB+?=
 =?us-ascii?Q?BRfL9WGq3LdoQGwYMBiOdazob33ZWzhSNBwVYTqAGRuK61Y5jtO5JHfY3UHt?=
 =?us-ascii?Q?qRfeGv36p1sQXd7O6x78MQ0dWWEHHJvMVKYAVBbUYAaTA+e7Z5L42TbA4Cbw?=
 =?us-ascii?Q?mVqK1KxzSuGrG0iK30HHyA28Jb0ACX9A4lnH1COt1GpdRT+p+gk6zU3BjDPf?=
 =?us-ascii?Q?zLhU12CWhmqcWFbpdi2ZlLfo077+p+fFDvEKCbtixebD30I/cMDKhx5tfuGW?=
 =?us-ascii?Q?8Q/U62ZmAx7b5nPpj0jWO5tsul9DYD3/hq8csudY5VPVfyRDMTzaiJbzQZfe?=
 =?us-ascii?Q?OOdb/fgAvw0Os98I5dSxQOyrXEMRa1h6ubL5RLRaJbEl1L9E8z5mxxIZI1OZ?=
 =?us-ascii?Q?kNg61LyDhcvsPrK9GyXw0abTUbOkI2aPKNl9mE4wcN9TuYT32LjyiPQeSYZR?=
 =?us-ascii?Q?rRtEaceJSH8YTzxKcWtvp9g0d5rQkLPchdpLeaF0qoiIs563aP7LOAgwUHti?=
 =?us-ascii?Q?UDjJSk7vohsLP5EvGEPH0ITSIO+QUCVYoVZfTRi5EKGWHRm6b3xZSaDSlzLd?=
 =?us-ascii?Q?Llgk3F+97+zG1fD7bUt4XMfAllB8imuVoWkLgLrRtElT/vgJ7YwiNPUp2B9l?=
 =?us-ascii?Q?Q3FlrewktnK3MjbomEyyyGs1NJc6MEXgkJggTDbV/OlEAo49svOeCaO7r8Wl?=
 =?us-ascii?Q?P+bU2yTALa984vSuQJB40mj7OGY6P3wRpJAhPYAeYSamJearSKB9K28Vu0dY?=
 =?us-ascii?Q?Rm0zj5279pduFZpRtHbU6S7VfFDF4GTRaU3o9EbKaoaNuYkkq0jYCeO/2TeQ?=
 =?us-ascii?Q?kKifASU3eBkRdV745ild6st3HCtdDJR3kR55koY1cmJ82LAprHo6kPkga9lm?=
 =?us-ascii?Q?/kBOqoJzJeNsi5n/3FPHxjj6eWYMi3fWfSffeEaRdoPtP8Zj9AinyES+Yn/T?=
 =?us-ascii?Q?UVPi755pf4vcTmA0xBSchCxFvyksu38EkYMba/f/DXVsLsNcaIgH+oKfzgVG?=
 =?us-ascii?Q?QW0NzI5uqSV0ZSlXu3gfnPw+eC3RuAlbkhP3ZRKsI4OMG+hfpgKhbueAltoY?=
 =?us-ascii?Q?w9xbH4ZNDm10aOxmqe2A1fTJGjw7MBNPzCQL2daVHp+LZXqT+7DrOfBawOET?=
 =?us-ascii?Q?vL3RwHgcc9my4Ms1gq7gYfeS9p0EhhexSlupyzU5Tba5eaKTmFqez7eaAAuz?=
 =?us-ascii?Q?ujUHihCdA1E18lZ1tcfFYAhoJFPMlK5z5wPgTcuqmlPonIAKbeZWPQj1WN0i?=
 =?us-ascii?Q?RTkSmf4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BuzREfFmLvztA/8TcFFPtwoRfCrMgzhtgsgViJXm6YHZZce14dVRjPmWlPU0?=
 =?us-ascii?Q?Z0Rit+RYnfKuYI/vGU3voN+v81IZ1GZGuG+MQ4V4aDlBfLPjRNUqPQhf3WZp?=
 =?us-ascii?Q?NqOWPhS8xhV3//Rk/vNG3qlMy3F2LdVT1lquOw9yURGUSWd6vSSlvbLpmF14?=
 =?us-ascii?Q?MUYCqG0j0zDm0RsJF65jORQXUHahf2Cvq+Cy9ERUMtJH5JVDKGTQdZwDMpF1?=
 =?us-ascii?Q?wotrwreCEq4jf48dCTei/5DDOhUTvi0CfmRsk+NinEoeHbhEDp9fN8vZClN8?=
 =?us-ascii?Q?8IV0ND0H+YUVBKmToCmdBwyQmW1k06fuZ3nIoj2hnX+t+/MF7cfdwevgdgpE?=
 =?us-ascii?Q?860bsVm18C0mDS2BtxdypB+i3Y7c+u5kADYNy/NE/x0TKtPrgtc0guAjhgD2?=
 =?us-ascii?Q?4V3HUUoRQB7gW2lX/HHlyhv5+ft1Sj0Gvm/JJwnc8AP/MLAfeufxRg9v8mQb?=
 =?us-ascii?Q?bJZcKvrtqO1q8MdNQ427ychtEtQQJ3ZsXWaW9Mk0mBXGkq6MMu5AOSdB8RoF?=
 =?us-ascii?Q?XJZ6TwDFlgywn8c83UOqvCBTheO8d/J5CP+pIVehonHklDT40WY/FEaEYiCt?=
 =?us-ascii?Q?VH60kT4ZLbaiPXYQukzcUU14qUnCBwXSa5gsadSk/vTCaqNvuLQg5/cyhP8S?=
 =?us-ascii?Q?Z6B+lcyVs1hzlYPopjzqK/IGMsDm0crJnuRK4aD0nwEB0s+qBC5z3owKNwfd?=
 =?us-ascii?Q?zMVBTQ25yqIEb5cjdiJYXstkaYDSxr0An0R+I7/Mxupnbr1kwXI8RFOPkHn/?=
 =?us-ascii?Q?kh7r88TvI8uY+Hlsf3kUK1mIeSbQ0lrJ4VD8mAzehZ9xZRWGHyT70j0mHdjM?=
 =?us-ascii?Q?OXokLdnoO/apku0F8s9oD55c9w/WeTLrxLOzH/5l4+zOijGcWnOt4oJQUEaz?=
 =?us-ascii?Q?9abVYpirKdJ2h+ira9ido0L21H04btM4CKGCgwv0PQaTT34UbDn72v/q5MS+?=
 =?us-ascii?Q?R55VNnBdRtG08eNi0CFKlm2Vgdw0+VAk1YIQzpOJuIhZlvHFkl0dBK+QKroB?=
 =?us-ascii?Q?IzH3GdrN0HenIedh1FzWLQ279RE2U/OBDFjBs83MyARpkdPFfvrNzQCSMoPp?=
 =?us-ascii?Q?nZaLJdsQlAxYw9RCEGIHkVX+cWUKUmaUjB2u1LY6PlG8Fcha5RwY8CVtynAj?=
 =?us-ascii?Q?xti0Qt8IQjmfTQhzgEPY3Ph5kSPnM3LTWH8rfSw81/SQop/TYWkGVRnlbkgQ?=
 =?us-ascii?Q?68Xf03W/8KjhoVgyoT+cxBBdMJufKqEGtn9NBpv65GYY9R0Evq5b+OIoYxIV?=
 =?us-ascii?Q?Q3qcvLTg8s831XUbrGaQNDFEka2UrZCIQiAqpM3i0TmUFPmuqBrmP3ua/7BI?=
 =?us-ascii?Q?j/Q1yJedQqxfNcwBw5d8POPhBArKah5A03ySNzYayUzFP3SIyMq9wCLYowdv?=
 =?us-ascii?Q?zPZKiP04cBqc4L3oGM7MA3La5Mx4/RPMDw/u7o+4YUv+Z6NmQY6HwCE08ZmW?=
 =?us-ascii?Q?Ujp/0P7MYoCnwP7IB/cO3po0J1iJaDxdlYFOqlXqHtC7FHBgWisTZlgoPLgE?=
 =?us-ascii?Q?W8gnk4DbQFZ8XLPI7RNPwax/tsGtFsQUzeSyO2ozvyLQ+4Sq2bYcwhhGiZCs?=
 =?us-ascii?Q?a7aHjV22tFIQ0kdpnvxVu1LwgQCtfldtsh9bORZs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HC8dSMPUJjTRLONTgeBSiSQ4a+psChbEuCCdmSDCfGZCwwj3LkGGjpTBbvlZ974ZmjOaKrDnAUvjM+9XdF/p9VVS4XV1594LIQK8qJnfWOQZvFMrvXioEk+PjbIFSgKUTobG/SGoW0dt3U2x+5Gpq07sSaik54MgAb7yhX4d3QFFV7DQvAk5Q8IiMZ16tP5VqIvgiCvxGlTQ5JhiaPfiuZAraG95uA9XoDrxK8EwlYucTvG+3FWFpVo9kxS1UOHEEh09B41JZb4u0ANaqDB6ij8cu0UcW0ApKedk1bvqwDLCIlnE6AmOoljgUwDN8wM057nP5Dabb2BTb1uTCU8XhGhbRqARwSBsIkGJr7gYJmI8RUGhUlIEru89Pzpt2ILBKIbKEl9kM3reYITK36JaM/2lLfg/JjROqmZw3f/T/7mOFbekZ51WyiZ5hdL06u/2msx90u8ZVd+PDQlyVezt6PBPrI4vX2+CHwTHom4+s2MBeQR5ZoroXeOqi5uYc0vS261vIRjWQcCMwA/hA4Abv0+hg8hdB4nqQfTN2fMWTwJdQNf7hjtRQoHjBxmJY7eDR/jqb4mycj+ZtG+x1ZvrOqeS2GbkOYrJlTIoj6MwPqs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f50c441-5485-43d2-cd34-08dd7c336190
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:37:08.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqLKbJsZvO+p394L2mDLVrYl0AplnXKiHrgMuoevpGloSiqAse4WXCdEh9jwYLvkqsuLUvplxGLwKRdGKsZ3XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6747
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150109
X-Proofpoint-ORIG-GUID: CFZgzjLTV1rtj2Ewswpk_XUeK9U3J8tE
X-Proofpoint-GUID: CFZgzjLTV1rtj2Ewswpk_XUeK9U3J8tE

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250415 09:11]:
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
> ---
>  MAINTAINERS | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..ce55676a16a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15595,6 +15595,21 @@ F:	mm/vma_internal.h
>  F:	tools/testing/selftests/mm/merge.c
>  F:	tools/testing/vma/
>  
> +MEMORY MAPPING - LOCKING
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	Suren Baghdasaryan <surenb@google.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/mm/process_addrs.rst
> +F:	include/linux/mmap_lock.h
> +F:	include/trace/events/mmap_lock.h
> +F:	mm/mmap_lock.c

It would be good to have more M's here in the case Suren is away or
whatever.

I have worked on the mmap locking due to the maple tree addition, and I
have helped with vma locking in some areas.

Lorenzo wrote the locking document, which Suren pointed out last mmap
lock meeting and does make locking changes.

Are there others that could be M here?

Shakeel and/or Jann might be good additions to this list somewhere
(looking at the edits to the file).

> +
>  MEMORY MAPPING - MADVISE (MEMORY ADVICE)
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Liam R. Howlett <Liam.Howlett@oracle.com>
> -- 
> 2.49.0
> 
