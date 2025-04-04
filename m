Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D71DF963
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767575; cv=fail; b=dBe7gMCk/rqszKpWCnr3dVDXG1gFjeaH2N6MFl7AGnLzUkcYYVn9K2K0r1LWdVirijH+ESmj6303GagHeiuJqlIorDORdyq+T8lQyrcyAra64Ktqv0dWnSg5jw0xhU+U8tOm9HgkOo7K8k2CC26gSSLrELpkYj2J9mH+lBnVEwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767575; c=relaxed/simple;
	bh=eCMMKylCk+f/L6efrHfAlkNOLb9YYcQTXvcw0V8oZ1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ABWNtAcjYRjNEVcEbbGqgF009hWle+fFuLJEOOkxHz7Sl4w2dPoGQTySsqhQ6B0CmHTWONTXqfK3Ume1Y7P0yX2Pkt+Y7WS6KXvM3SZRQuF1z8bWAfJHu7NyLCMatIMH90JqrQkYwzxnT+I+qDRVjYSSRblnuaiOc0Eg/zFi3KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lq/Sis1A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KYJYY8KR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lq/Sis1A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KYJYY8KR"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5348N4Ui009446;
	Fri, 4 Apr 2025 11:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=iy/6hNBezHnAT9ePXs
	+/gx1Gzq+QIZ2HugA8GuObGGg=; b=lq/Sis1AjTlcdQVgigpgSDd3C+ZdTKPoN5
	SoQN7+Vc0mKLTRNhrb4J1Ot/eDPUSXLOLWCUQHart/3y9hMr7F6PvPMqenfJc9i8
	QaaqI/88T7TT5PWTGC2w1mOD/qg3JpYPZ+e1Dt6dLA9n7mm2jbssZBvcRQSiyN72
	B5bOGqykvhUnjtxjNPqDFA+7EE1NWHj6h0R5CI6y4NOneRzs910OXMpByDQUnHrV
	P1Jz/kuq5WgiWqIhbE40PHKkO0DNcYBYJsKK8nxbMz3SGEt9ukJ+h5E9f8sa1ICB
	6nKR9lZf7HJGO/o1JSBlZJk9dJoycLP56jnWuhByvaSNA4So0pcg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p9dtpvrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 11:52:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 534B8a3q013862;
	Fri, 4 Apr 2025 11:52:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45t31f5fkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 11:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5qk6MG8kn2cQoWSxrOXQTZWii/r536Pjbug+ShKKf/VU5R0rzILDNnZg/eTkMvbw5ws6a5PZZjXzIn7Ys9uNYXUJxkTsTR4lK8b1mDBsOfnmeXnT+mds4xmW9Kfm50YBGa36znzyC2I8XMZIDfSxs/IbyJyyI0oAjqFkjuJwwZotkc0DSGRE5xqupAgH2B9sj2c2NAoEewPOSho+eOI9Dba3nSDpXnVDRVjACNqLKX2uK8OXldXtc6635Jy0RSGLMmjliZCM/gZKQSEzYrCjUUzbZf97DPhsdMuNNkAE/afvPmx7+nGwEa2HWcyMlOBaFEg6KCHaoLrOlBM7C6V/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy/6hNBezHnAT9ePXs+/gx1Gzq+QIZ2HugA8GuObGGg=;
 b=wcKf3C3SgST6bU95/lMwLSUe8h3FiE+MV/mL2/QRCFYejjC79dsTT2QeTSVOBwmS8y3jmNYttR0d0GRU3YsTVduUtC80zffVgPHam/XiBuxOOO3Ye4AjmZjwjR8CvnGd+3+FT6+PgfrV83xTUyNPWnkYGBo1ig+RQ95Shj6rkkLSd7RRIDJ6QiGTcV0scusOntvbdBXfrkNYRtqR/5iAjl6vrxZe2ffL+QYr82skAM2b4MjaG9GJSpZAPZFijNX0KWjsYo80PgnrSLuY7P0cf2rven4hrdX/7GlwtT6tiAVbRDe4Hi2/PY2/uF76TGGBZw6cGMxpTroHOy9U46zCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy/6hNBezHnAT9ePXs+/gx1Gzq+QIZ2HugA8GuObGGg=;
 b=KYJYY8KRscJdrmBk1RGNJJjDfDQHaUr8P6QA4qVL4vnJfSR72WATXa3NRFLe6O1Y1It68HPFtHqk0uZ1sCFmi+CHIHXxHQZc8eJ5suQFnh/nE8sBVhRHBEb8NiEvbOjAMcga8VrmqcoudoRvL23XvwHoQhbtSOVwi3r09UlWB3M=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DM6PR10MB4251.namprd10.prod.outlook.com (2603:10b6:5:21d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Fri, 4 Apr
 2025 11:52:37 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 11:52:37 +0000
Date: Fri, 4 Apr 2025 12:52:30 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
        kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
        Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>, x86@kernel.org
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <e75ca8d9-0386-4de6-bee9-e6044b001a30@lucifer.local>
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
 <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
 <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>
X-ClientProxiedBy: LO4P123CA0404.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::13) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DM6PR10MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba5839c-d918-43a6-06ac-08dd736f3080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3OaBO2oV3k7sRAZHu7hiN+044xdsmhjIB9yqca0utYWzureE1EgvoyzjDlvX?=
 =?us-ascii?Q?jlgKYoQ5U6x8Bdom8UJCRnKK7eNOo1zKvMnHNiJy4BlqKhWRiUXDhyWuNQ6L?=
 =?us-ascii?Q?nfrQa79dUHqycnQYQY8yokgA6MsBdNk0f6cPprbrnqVsDeNBZxXV1Hsz9H0b?=
 =?us-ascii?Q?N1A0HIWp0RBymdAG02k3LIFPoTChqJg9pfhifOU2MtlgRoxBuftpqSA14N3y?=
 =?us-ascii?Q?9rlCqBhwSc1PW68PZHhYsNGf32P+CexxE4gnulqLBlou++zVZpVpTy3wY6yI?=
 =?us-ascii?Q?rf8ab1/G7K65MX13PstbFtnu63A8IVxhRTauAxrNN/WzCI+eoGF4Cos7SDSR?=
 =?us-ascii?Q?BIT37VOLglk1Bagv90/I2A+xhucXQWjEWga2ZMlssJv6atDOhD4eXFJr9GiK?=
 =?us-ascii?Q?/qfvdtaI4+2DDc+xY78CZYICsqrA0InrcUcpmvs6bRDrYGbWvYySWIw3I3Zy?=
 =?us-ascii?Q?qVJFDaKGSpgjC878TF/anRhD0idkANcvkDvl2ib8V7nVALUWSdH5uvioC3sZ?=
 =?us-ascii?Q?pUDU9zQzCwn4/TCUNdq5DXT2ixratwLXicoBRuCtfgtXfeeanOhgn89Q98+d?=
 =?us-ascii?Q?UWEnU1V/k0IByyC3JpE7R2eyzCtq6CPPbXzmoQxLlc39j1UxXCn0DHS4xJVt?=
 =?us-ascii?Q?bKoq/v61bjkrpYVxIw/qb8SN6MCHJZCP8/L+vVbEeLZITe14p+DdVmRy0Zg6?=
 =?us-ascii?Q?ILPIPaQwrOExs/YU+gzdfhopV/CBWRAelD3cdtzcZiJ35zrJwUonYEepkiNT?=
 =?us-ascii?Q?x55wda9p8U6of2RiPqw62fV0esKZyPPxvYTtyGsiZU+5YT6zHdV7wDl92aUW?=
 =?us-ascii?Q?jn7t9ahJ7osrG46FucCW3EaogXYTnUQjgHSSiI8z6zy1rL/sLz+G3myKVfbX?=
 =?us-ascii?Q?wQlm75IeemBHAvpYF+be2GlCKn3M51WEpCfFZ5k3nK5wME0C2uZtJa6gLTAu?=
 =?us-ascii?Q?W98xq7NauTZ9GkwraqlcLsAHOcmmG5HkbHUYEViXOC9T7R2scwtke/ED7K6n?=
 =?us-ascii?Q?DG4I5cup27i2oS034N+YiqToBWaBgw6zI+NFNkwPFUaY8LAEmK9SREXZcCjt?=
 =?us-ascii?Q?iARWgGFDesxoAGLD3YH69hJ+9HPtpVbnv7PPeMgFFmPfcL4jHxV8dI1yOK3h?=
 =?us-ascii?Q?XS2h3sYMIrggUw4ed7+VVmZvuzOhodBMheR8Ods2QVUivimq689KNkn1Rcvy?=
 =?us-ascii?Q?8Hh/UeRpRC9MRlagw3c2hKqJaulexoseUOaHxiP9Gu7pKyV/6XEykXhYCQ2f?=
 =?us-ascii?Q?TE1EtBOpIdg3ar/50IdYaWjZgPD4wIHd54mvwcogbvt4EXl4Eulyt5v+LVJU?=
 =?us-ascii?Q?7cw1TIhrCGGFH6mwfz0gH0paMCXdgF5ii4RsFNlmZE8aA9G1Ju7LZl6CZQqS?=
 =?us-ascii?Q?MAYkAN2oS1urdx11S3zMHU2YhyMI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3PKCu8MakNf/K0PEgNdXENn+m45sEpoEhEyHP4yPiRwyGcQ6cz5NA0h84gE6?=
 =?us-ascii?Q?jLOAug17/7TCg9EL5/UPUWPf4WMShHCYPZ15qlrpRXW7AxVLZLlsgMmbUZsH?=
 =?us-ascii?Q?AEKInIvW1I5Xav0h567WfWGm4n+dfogpb/ICdEoHqEjSj4iCtc0rGxiA6lTq?=
 =?us-ascii?Q?25YW4ahSljQqpeB/3nC/iWlCbsHLGsayPFF3jzOBB8zKrbu9+b72VLy9ZVeM?=
 =?us-ascii?Q?gE7NsQH8510hKeuXLgDWK9qkjV76ob6H3IN5Q/xItrbR+0EPabZ2va9gBvx5?=
 =?us-ascii?Q?m5NK2/eWPK+6kWj1+fZw1U/TC2JhbuhBFwZG+am8mVOAcDVMTJLy2CeE8/i6?=
 =?us-ascii?Q?BeQV3EXdHtwHj/gW/p0Ekb+WK7dgReEP3tvzmUHTUQcbCZ80WZTwFre84TAc?=
 =?us-ascii?Q?m8pH971Nats7v47o9jHVGOVm49PY2CITsLngMWvj38MkeL50Tuc/eAnkxL5T?=
 =?us-ascii?Q?qZNn4Y61XATwsigWzFxhtZqG01e7ThxCXjDETH4UbWmEDSf0c7lbrlHuWfzL?=
 =?us-ascii?Q?Nb++JeDxBiTObRlfJiJ/eVtX4hfRgQkCE/ddpgrlhxDYN3zKUzg+RH4u5fY2?=
 =?us-ascii?Q?PLIQ1BL5baGV5wAmBds5TnYqeyxdfV1pjYnfm2U8DeBoprBAWZOmoG3csZJD?=
 =?us-ascii?Q?cfyqMmCuhEp+xWNgNwmtCH/xwivZRbfGFLcRm/L+dTPGbdAKLIx3cRDAgCKB?=
 =?us-ascii?Q?uUUc6NjUr7DljZysvCBSyAS2LLrLdrRLPP/LQQPMOu04g1jtBwnaAfbiAUAf?=
 =?us-ascii?Q?SORRPuD1ociReMTGq4FbzjxePQk8swK4f27qoGMhcK8PKV81lfNFYiZPZyHM?=
 =?us-ascii?Q?wTCIocGXIlFWP1pQDSoJFZ9J3JSd9Yo29UGuMUGrvLZCDjKRhMRHJjQon0PJ?=
 =?us-ascii?Q?6dulH6o5yxgk8yDl8llhO+97qx9sGkt9jnVb4+AN/bSB4Sg9aA1JlMWRNQu3?=
 =?us-ascii?Q?OaaYQ6g2xs2irYz8h1f0DV6WgSljl6+ioTVUh9fqF+ZbhGoFLKea8fewUGqm?=
 =?us-ascii?Q?ZGMEqh2EFWWhwjzZRP0VZ+BrXX2c5iK6d5zRkJ85QY5Gio9T1hzf+S0PsubY?=
 =?us-ascii?Q?x/x92iP3jQGlR7ljHNXVqFYg7Q7iM8cgwcPdRrtednTxQgaYLBJKOUjNre80?=
 =?us-ascii?Q?8ttMQOnwnDDEm6Rp9+ElrFfLN/6K8IZElpKUS7o3QvsjtMDRHfMJQ5Tm8r5/?=
 =?us-ascii?Q?dON5RnSFXTgxOVxUQMb2GZFWL2luepIa3ZNnBiwowQCoqSvtQxtoQ2FFynoi?=
 =?us-ascii?Q?9zfPuFkkNcbc4WZ1NwHYIrYwrx3xxwGPq6h5h7BXSdHUrwvOX57Ftv3kx1uB?=
 =?us-ascii?Q?JN4DBbwR7HADTL5aLQxZSqAwhD63yDZKUYf42Kq7QgRIWaB1iP5aL/gmc/lN?=
 =?us-ascii?Q?Ox3a1I+sMvDSgKi+++F6sUMxyQyKlocuyPdNDqYcqgim6EqQg0lQU7Ruywot?=
 =?us-ascii?Q?/kCL6aBayrOyTmsyv8lpzYQRwVLxZbSD9HoJTkhJm1NUFiEQRR5LXiapCupy?=
 =?us-ascii?Q?Ch1+epkWN6hZHo+b2cipv5rkuykuVh7GOW/8xF53vO58VtwDh+Pwm7CCvUPD?=
 =?us-ascii?Q?XO81stiOqTY/0Lve9Z6YVOXpwTL+FPU4BxzbpIQq8q4bsHXikNiDf0zuMhWw?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GebyBYCGbALAHmBA9PUJNl0cReq+QL3T7NWUpVUvDch+eNRfdlqd/gqpdx17elcGrO9lq9HdyYbgZomC6P5zvtzhWxonhP7yp7DQOyNnObuDkKHg/0vSNi2JgMvYM72HvXMaHxJl77RRJ1zLkGq/M7wlLY9oFlE9YXvXurt3PflMDIENp189gXbf9wU96CPsWRcBMK231Zg+c+4NJ6KS754KAmOaMI3CfLjPHcZshOWGrUSuOPZ9VT0kch9ob1/jJXawd9RFV7M8YrHJ+ukxIVmnOdDkqyiqEuPBSjS/cW0Oe3wYEwWBzMBbomITOKvIjdFi9Df4UXU15Mh7yEqBIPjnQZsmzgLa/mroW/oOUgOP8HyH56RKc2hYEFIcy7PgUlDI9ABpDsulSwk2Hk0SMNbX0hn5BPyiAS22MvvjlZtFAQ4HBM7XRYYHhuczjDP8jKXO8DXDJ9RaX59UfIf7nAOekzLjraIoYrFWUW+B6nON2yiWu41HYqhJzIdAoFCZsb/LbQ6YiGbbvWWMM3xLE635nkn1DODdcoPdehTcVgdLEJUMENzk4/6Ov++q1ti1dD5lp372dxGOllmf2d6G5jOs8QGrv8VWXoUEDbkP8S8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba5839c-d918-43a6-06ac-08dd736f3080
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 11:52:36.9484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hagiLu/MSEjbSlAnRV1E2GykxWuWdS8SDdP3MIcl46KIvrATV+3hC2LiUqv56CB/JOjdb872W28U+uii8quaE/yv9DXDWPpJyNV7O3Qa5w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4251
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504040081
X-Proofpoint-ORIG-GUID: oqZoNkrS171IE_pys1YY_KlFdDz5-K9M
X-Proofpoint-GUID: oqZoNkrS171IE_pys1YY_KlFdDz5-K9M

On Thu, Apr 03, 2025 at 10:59:12PM +0200, David Hildenbrand wrote:
> On 03.04.25 17:14, Dan Carpenter wrote:
> > Sorry, I've been having trouble with my email recently...  I replied
> > earlier but my email got eaten on the way out.
> >
> > What happened here is that the zero day bot emails go to me first and
> > then I review them or forward them depending on if they're a real
> > issue or not.
> >
> > Here it's a false postive because it's set and used if the
> > (src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
> > this correctly.  I've been meaning to fix this in Smatch for a
> > while.
>
> There is a slight complication (on top of the VM_PFNMAP checks):
>
> If "src_vma->vm_flags & VM_PAT" we
> * set pfn
> * set dst_vma->vm_flags |= VM_PFNMAP
>
> Then, we only consume the pfn if "dst_vma->vm_flags & VM_PFNMAP"
>
> While we won't be using the uninitialized pfn (good), we'd still pass an
> uninitialized pfn, which IIRC is UB; likely nothing happens on GCC clang,
> but we better handle it.
>
> So that should better be changed; I'll send a fix.

Maybe just worth setting pfn = 0 _as well_ in the caller, belts + braces maybe?

I mean the patch is already upstream at dc84bc2aba85. So I guess these fixes are
intended for rc generally?

>
> Thanks!
>
> --
> Cheers,
>
> David / dhildenb
>
