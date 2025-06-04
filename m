Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB28202C45
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749064370; cv=fail; b=h7kliUWwSiRGArmzRTUfqBC6Ap1Nz7JOUmMrg98Eaed1lSCVZkJKDLVmH6lyXirm499XFCFA9N4s7nwNnftKvd2VUAknYefATs2vb8K3ZgonwXCU99QHddv6fP0qUflRvgO2Vc1E7kdaiKOcEaqdAHGfS/0mwnoYhNIuSnzul18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749064370; c=relaxed/simple;
	bh=MAG5V+b5CIq3ZP0QnQQtNFEdkVpHfJe86x6kCLszHe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IrRhiLxETcDEtf7RE1Tn/To866Ghj8B8DrEyftvuXOfqAIgoBwlM1ywW2HGd6cq9p5MFcYkn/vmcoZf4kGn9QPDD5A6sgQAMDk8PtvTcK1nlSTqyVYTRCuFG+cZIP5hVNe5L4ubgedaVXahT1slAKKdu3kGLNndr/0lzEJwXZZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EHYsHWz9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nFByIohZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EHYsHWz9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nFByIohZ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554Ie6mA019961;
	Wed, 4 Jun 2025 19:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=0GqruRF+DpzKwaUrwQ
	+bqMnYW/vbyPwCBFZsgGuV6og=; b=EHYsHWz9q4yHTT3aRLYjowL2AdgHLnszY3
	EnNo8gyMPqrD14AAV3JbGt6qTO74vtkOPTDRNpmXigHA/TlW81ZmeD6LJCD0DlYW
	g6xt+58Ab7Aof5zERzFKekKSRwjMnWCSJ2tim5ONs8aAb5Zn9fIk/WeeEzKTYZgf
	kVmiczVxZfUkx6ghrekg0Opwpokkg6AEfwcjlggXIUKti8bbLpqWvHoMV76Gqhxa
	i4ZlVkRWESNlHFKnn8qvLZ2oYZ02hlbBvOBcfPvBo8EAFaS1QumnxFZGhJXd4Xa4
	DsBVCAoLJBBgxTzbRZI8ONwSwHMnB50Q569ktuLXuA7SgANjpCFw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahcshn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 19:12:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554J2cZi033829;
	Wed, 4 Jun 2025 19:12:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7b5v3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 19:12:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6amKSkyIx4VApbIWWHAUFg7Agq3Rrga8FpxW/gQxMGmZQDJFMmmZaICAKFCZ4k2sRoatSbB5zuKcxXcD1n9EqS5P0fGXrwrQGrK5toSQrgQanmdVwx4xX0TVVPkJZGRrp2vxtZ0/wFn8pZwzl65oP+alfpnB7b2CvnufDb8mG/xswt6vy+FybgA2nTWzgrJ0y0QDwypwtC2NuFnqOLrw4+8PU+usdVduSbatb5CmfC+tmnAvcUP0nieHG6RF5P6B6DBBDjVaOPBJg/jBELQnYnAuXk7b1ZkrIhHC+aXidcphsuIjhdvxxUbbqhK7GLFY1kXlJogrijBfUA9AQ0Icw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GqruRF+DpzKwaUrwQ+bqMnYW/vbyPwCBFZsgGuV6og=;
 b=kJ4PjJBgB79EOExlJiXqp5PXsnp5cJBYsREEp4Z1NAtaN7r9wEbwoM1+6mseaGGO7DLl0vtjNkQhZ0LhYe6KMjEqJ/mY8R3V8IT5gm2JVARAMe5H9KswhAwmVH5idBxvcWk0CM7f/k6fGYjvciDdpj3PuvBNJfvvddSOesHe+oRAj1Un4yVixg5gdmgBFsHPaXnMkuFbZdXJEbQ6UXIQ710DcbQI9vKJWtyITEBivuZJ/M9+7Ax7WbxEgSH3ACWVETW0XLTPvXxiZBPXfBubn4QFjpm8Cr1W/PnoLxawtrtibutXwdnXDIJchWlrjhKRXcB0RJZQcc4QKvg0Zee+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GqruRF+DpzKwaUrwQ+bqMnYW/vbyPwCBFZsgGuV6og=;
 b=nFByIohZWxx8DGSlxyQmSpkVPZaWamVWg4tnVy1A6FdGYuNSzjER2wqx/sfWSYhU4VfaMZam5iJDpYKkv9tY9oDtCthoJr020LU8XU/NFrWSPuidwT8wEERGzvRZT31+kGNehnee2ju8bERe2+uQYW59BMtzGe4ilZXrTVpo36s=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA1PR10MB7661.namprd10.prod.outlook.com (2603:10b6:806:386::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Wed, 4 Jun
 2025 19:12:25 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8813.020; Wed, 4 Jun 2025
 19:12:24 +0000
Date: Wed, 4 Jun 2025 15:12:20 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <ipscls57c234tnkiivnkssiehkxygsgqja3z772qmvnjaatg3h@77pcu5lra6eo>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604140544.688711-1-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0333.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::26) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA1PR10MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 671bdead-2db7-4ed1-c209-08dda39bbd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IR4C9cx3r+cMgAKnW9heZkuGy4mYHOmhebeuxeseohhNe2lkJOzUnsfSW2ru?=
 =?us-ascii?Q?DRsexcNlM+vm/qYXhwPvjK65XhL2CguU94AAOvkNSSYIJsNCPbr0u8h6l1VR?=
 =?us-ascii?Q?ZFu0BcdjN3dvicSC9gIqUW87PCHvVJv31NnuE9H7Rw531U66UWkdyULy5Zpb?=
 =?us-ascii?Q?16lTDo+MEmb3kSONAr+islTVzGtRvra1bbR3sOSJN3f3cvgMT5BDt45x/Qjr?=
 =?us-ascii?Q?qfHxCMjxuIbwz44R+mQy6cDwGU0i8pokUm86rQ8WAgeA3ki5omZbk/Hm72AW?=
 =?us-ascii?Q?SUGXt6K7SSMCGGQykbhy4tUU6swWDu5Fc4x7iLjpiGrM9EEtZXRkYUlwcIZm?=
 =?us-ascii?Q?qdv1OEMogif3RxDjBqO5Fzkwa49YVK/kCVotgvgtF/75C6WawwJjwhwH6Ds/?=
 =?us-ascii?Q?zE5KSg+uVcs4FP0O4ZnW43vK/qPyY7M0aTZHWDI1FWTTAmBgp23n9cHYRTSe?=
 =?us-ascii?Q?UFwQbIZk0eQcjHqWkoYRcEbNBWwX5PEzya6NfphW+80FtrqtSQM4FSKn1jG3?=
 =?us-ascii?Q?VpiUo3vO7wsUWinlNZvcqovgWMmc6Xy9Bq2pikHDLfWbQ0RYwotoYjUaY9H5?=
 =?us-ascii?Q?qJMYQQ1C0EZcxk9oywH61qgouCcwvH7mEU0+73wdDt62AYCTWk0d50npkaVH?=
 =?us-ascii?Q?p17y5isj04HTleA8U//eXpxknzUj/d3HVYlkNSaYI7pgxxvWiCpma+9idsJc?=
 =?us-ascii?Q?Id2C+HiHBxpJIPaC1n/SnCpXxVMlnMLi0D09+4AAVuO88buUxcM8lfShLJ9Y?=
 =?us-ascii?Q?smL5YPg2SUScYn81IiF0nszwX6zql/gU6EC/nX0YGpIBcmEkayaLTKXyeXzR?=
 =?us-ascii?Q?V8+C6Vy8RL5R8/WqT2LSevVxoHPncZ5P3ZTdpOvKtZgpfYR6fWe0ZfnITddY?=
 =?us-ascii?Q?6b5/VzB52xBQaKYnj5tYaj7a+NuKxhi5Rqa0po74dO1rdqklM6GKDQAdosLq?=
 =?us-ascii?Q?63MAoZmRx+qetf7CkVYTWoBGyWfglvChSY42QmUoWmOJm/jTnKA4OSxI2T/p?=
 =?us-ascii?Q?FcCDXHEVJsRy4HhADx0hVrpQd4d6EHKJg0ckXQ8dtfvUOPwjP5WEYUzcS/3C?=
 =?us-ascii?Q?keTY8dv9dDgQYgmGmlssamWfxPryi/LW3vqhvDjnYWR750u9/YLGEhd67jtI?=
 =?us-ascii?Q?ZOjSJq7qkB1KpOJdr/LHxZHhp7sh3Vw+ZZ0VtZBzxgjGOyoidPxb23Wmy3Xv?=
 =?us-ascii?Q?or6Qj7Rrhz3EEPfhvKR+IqNjB6RDwW3MUiI+nKp/jHRUp7bNPrBHy5zfj8Dq?=
 =?us-ascii?Q?qh8sKM+hLdmtoqj6y/M7UEwHRylhWmoTib9W7BwNC+6dPyyBceaiKenjQEUc?=
 =?us-ascii?Q?JlscSpl5AdGcza+HLjC0qR2xNyMnVzislwILuyMC43IuCy8RuxkMJdzaDaLK?=
 =?us-ascii?Q?kPc0Fy27EgMAO7Bn3/r4o7u0KyBBzFCBOuk6urz/uLXrVBXl2ByoieO4zznl?=
 =?us-ascii?Q?nxdzH/6swOs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q/9z6XVBg5EA1f1jQCKtgsJkX6SNqwl6Q9CkgkhpBrJkghiwjgWeWRITUxnl?=
 =?us-ascii?Q?ZfWhp7lYT0LBBZSjgv40xPJfaOmpZ75bsG7Cw44Mw9DWejO1J/KVNVy5p11P?=
 =?us-ascii?Q?8LAKyuhZo0ELmdv/gwdw0/W6z77ladt2qTAgeLXeZUl70ibW28O3k54SYgMp?=
 =?us-ascii?Q?RMoPBJOkF9i3it5AF6N0MQ5guFa7yosKHWx9cShb4bvXZNUNEiOUhpGzvWfA?=
 =?us-ascii?Q?49BgrdK4eLDmLepDS2Xy4isEs6bUfwHw2GNanW2+l69UhJ3s12sDkBfXjnJz?=
 =?us-ascii?Q?Kc6kuN1aMaJweNeCeSW880fxiCYyQrzULzc7hxqvK7yNIFGhQIxYEgOqXdxw?=
 =?us-ascii?Q?3qJ0EZBs2g6IFNRg6VRoY1cHGjkzZkWV7Uqpsgk13aWEzfWp7ZM+C6hHr91i?=
 =?us-ascii?Q?AmqAOSylUWbLtO7Bv+cpgl/hcUv1hg5yW5pX0kQ0B98hdvn7Dgv1Q553hRPr?=
 =?us-ascii?Q?D3sgV02KVK6tBHFbybDwAuEN5XwdsbrhWL6nx9YswEhxgyKvzAf+yDZ32uuO?=
 =?us-ascii?Q?hE1itzVeAEVA18xC2U0UPGcCsR1sIwSNvcFNC2fcsNSWxj1QQRnGigJ74Rxd?=
 =?us-ascii?Q?1Gj2DqEZC/cc45pFHgT+cz3vEZpnoyNH2dBEkQ4zKYqBBF0cyHTuTo9CeLP3?=
 =?us-ascii?Q?c17Cjiw22Ygzj5Qifx/MVc5ozkjzohFIdDghXoRpKdhcJG64TdR3a6qUnOoi?=
 =?us-ascii?Q?kIDFVj0jIMoq3PZKT3H8Oe/Yzk3gKF9hjAH6p9bEzE0BQP/TZl5QqT0BjepE?=
 =?us-ascii?Q?vmt/HWadOJCjPfTXu/5gJVGRQHs4i6clNuONusqGm0rnA77JKO7zOS3T7vAi?=
 =?us-ascii?Q?wwltI2icX8aQQgaQVeAuQX3zXbiDzcSD5+RbfNdZitBQ9ZPOWUnfjWnKV5OR?=
 =?us-ascii?Q?Z+4x6Olg9eVbI4l32/1ylPmA9eSapvUl2pwwXSclSj8tCNAEHqZI+EbO2G+Z?=
 =?us-ascii?Q?uuCAXAjY5BrntXAdgxoMrovzHqJSqtG9ftDR2InG5Oh0g4obKfpE8kUcDRc0?=
 =?us-ascii?Q?cV2xin0b7FT/msiMRwwd3dFmDHSAU6cXh6cRK74aHda1UsRLcA1ZyEUkYNVB?=
 =?us-ascii?Q?Kl4QuJKs9SXf42oJooMEgSOQL+q1++Qt0EpoWkGozgbiIO3pI7af5FQv6O4d?=
 =?us-ascii?Q?1+KyFGEGFF4IUQ7PvS7TLfz0VE6LAWsSzZMpZLlH68Mm5V4FXnUcp6iDDGDQ?=
 =?us-ascii?Q?YIlUso+VYKfvjcdqhhsSheD1TWxIjMYoIJjHpirgfaAreHE+XgeizTgd3YFL?=
 =?us-ascii?Q?4NMCzSFtWdVX5wlvSrws3gsXRUP6xKaahCqRAnIbZlsU+7AAhYpOhn+FaKUg?=
 =?us-ascii?Q?2foAP8ik5Our0pwlOfRD8umce/tA9clj4myrn1nasyywEPuHPt/houGhm4bo?=
 =?us-ascii?Q?DncTpATv4ppdmTEBEwXaUgUCq5ZLp+t1z67VPOeqa4VXdrqGzmyLLGjD4Hc0?=
 =?us-ascii?Q?5Iif8i9qLNmqbJux97dMfCZbwGlIz+mvW5cYVrhDlule5mBCj8vYyHNAyrb4?=
 =?us-ascii?Q?4PAKrFUIW4GOclS5C278Me/VfgPGDjAnO8Jc2b6msEtxXVeEmcofz3tMXgr0?=
 =?us-ascii?Q?2OfjOzRThhjTl7vT+Pi2tWk2KgOVtBbax7yo94A4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XrtL22rDFSc8CJoVKMkSA8NYOZNMVdwbJzF2/L3YFty8SAve6v0t2WnSrGgMXG4W5fojMT7MuJeNBhbO8yKaCtihhrK2fL7Gl6cV57FXZ9zSVllPeslXtEVMo26f4octqUMTeLk3Hm0myQ+hc2LV2VvRO1zfTP+TjGXidUSG2JkbCH5A6z0uKEbpLhQ1Z3HK3C15E7IQhANtYcac+F3UPaRbL+Vef9ldRx8FWd6UNFAx/z7wNAd8Ym4VKpsNvEMJwodzwODD9pN+YcK/3kbnjX6HCxht8DkbIxz/woPBHO/Z5LH4mXN0/MovDVp5qLg7LbYzTCZOo9bzs5dE+N5IEzELKnOHZL9DnryX5ncoZBU3TadnjH1W9saOI1avE/ITtqhZMYwco5wohq+K08XsyLdEsri457nGRCJdel+0Lu8nnGaEbZRlLb39YehfOOPp7wO1X/aPhWAiVHLWT93qae/KPCHCfEY8K3he23NZBWs9nuhS2G7h3ByCJsDPOdzblrxDn6IMUMQZKzuHdwzPHeFhtMOwFhGQ6Q2+f6JiIElvEDQwukPJzaRcu9kGwfMqjOstiOuE/takSxrQ+D4EP/DjIDcd6yyeFgwnYcwkxUQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671bdead-2db7-4ed1-c209-08dda39bbd12
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 19:12:24.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfoCsD1YcjYPvoS3ckltDGvEHZsv8hv9GsBEjEusqTxXOWOYnTDerD5dX530EPMakJtTwwp3keNEyYJ8huirnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040150
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=68409a9e b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=iox4zFpeAAAA:8 a=9jRdOu3wAAAA:8 a=Ikd4Dj_1AAAA:8
 a=jLtvaRDhEtiH42pHbnIA:9 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=ZE6KLimJVUuLrTuGpvhn:22 cc=ntf awl=host:13207
X-Proofpoint-GUID: bx1KYolMuupE_KrnpNmtKAknph2VMTvG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE1MSBTYWx0ZWRfXzUpOoF8obLX7 IfdeLldF3ep8Ipk7aKvAdS9CKZVCF1cz6suFa2Lo4sL8Q70zbIUtzIhP9QuRAApZx+dDgn1Ocxc sq8HKKC3ez0Lc5ivYoUVn0BEulXPPj8dTW3N4fuxMF9KKEYW4ain38dAEpX/PCyU17zd3mABAi3
 pdOT3xS+2pGQeaZ4d+A7dAwPO/kOYfxnDdYOa2DbIFwTjxQJuSXbRvTxHdtrGfVB1Dfxe7pI9xx 3mg4jnCGMrwWrSWQs3awl+iq9GnWzQYcuWCcxSIvv5ztviGW+2gc6ftf9ydSx4NtjOlq/vP1rEE RbQmszu/BbHk9YcCI8mtsBHZt2/at0j8u+F/t/U8FIFhXVoRXsILgwRWfVVQLoqCN16eaNHBO1y
 0EVy1rELAyLM50CQOqptInLq3HmWAC/IZ/uN+pBXelmuDn/Wxof2CZAam/b7kkYB9iN3sA/m
X-Proofpoint-ORIG-GUID: bx1KYolMuupE_KrnpNmtKAknph2VMTvG

* David Hildenbrand <david@redhat.com> [250604 10:06]:
> Especially once we hit one of the assertions in
> sanity_check_pinned_pages(), observing follow-up assertions failing
> in other code can give good clues about what went wrong, so use
> VM_WARN_ON_ONCE instead.
> 
> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> well. Add one comment for the pfn_valid() check.
> 
> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> 
> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> happen", but more reasonable to check for during early testing.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

seems okay, besides the one nit.

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
> 
> Wanted to do this for a long time, but my todo list keeps growing ...
> 
> Based on mm/mm-unstable
> 
> ---
>  include/linux/mmdebug.h | 12 ++++++++++++
>  mm/gup.c                | 41 +++++++++++++++++++----------------------
>  2 files changed, 31 insertions(+), 22 deletions(-)
> 
> diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> index a0a3894900ed4..14a45979cccc9 100644
> --- a/include/linux/mmdebug.h
> +++ b/include/linux/mmdebug.h
> @@ -89,6 +89,17 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  	}								\
>  	unlikely(__ret_warn_once);					\
>  })
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)		({			\
> +	static bool __section(".data..once") __warned;			\
> +	int __ret_warn_once = !!(cond);					\
> +									\
> +	if (unlikely(__ret_warn_once && !__warned)) {			\
> +		dump_vma(vma);						\
> +		__warned = true;					\
> +		WARN_ON(1);						\
> +	}								\
> +	unlikely(__ret_warn_once);					\
> +})
>  #define VM_WARN_ON_VMG(cond, vmg)		({			\
>  	int __ret_warn = !!(cond);					\
>  									\
> @@ -115,6 +126,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  #define VM_WARN_ON_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_MM(cond, mm)  BUILD_BUG_ON_INVALID(cond)
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_VMG(cond, vmg)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN(cond, format...) BUILD_BUG_ON_INVALID(cond)
> diff --git a/mm/gup.c b/mm/gup.c
> index e065a49842a87..3c3931fcdd820 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -64,11 +64,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
>  		    !folio_test_anon(folio))
>  			continue;
>  		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page), page);
>  		else
>  			/* Either a PTE-mapped or a PMD-mapped THP. */
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &&
> -				       !PageAnonExclusive(page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
> +					     !PageAnonExclusive(page), page);
>  	}
>  }
>  
> @@ -760,8 +760,8 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
>  	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
>  		return ERR_PTR(-EMLINK);
>  
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -			!PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>  
>  	ret = try_grab_folio(page_folio(page), 1, flags);
>  	if (ret)
> @@ -899,8 +899,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  		goto out;
>  	}
>  
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -		       !PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>  
>  	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
>  	ret = try_grab_folio(folio, 1, flags);
> @@ -1180,7 +1180,7 @@ static int faultin_page(struct vm_area_struct *vma,
>  	if (unshare) {
>  		fault_flags |= FAULT_FLAG_UNSHARE;
>  		/* FAULT_FLAG_WRITE and FAULT_FLAG_UNSHARE are incompatible */
> -		VM_BUG_ON(fault_flags & FAULT_FLAG_WRITE);
> +		VM_WARN_ON_ONCE(fault_flags & FAULT_FLAG_WRITE);
>  	}
>  
>  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> @@ -1760,10 +1760,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  		}
>  
>  		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
> -		if (!*locked) {
> -			BUG_ON(ret < 0);
> -			BUG_ON(ret >= nr_pages);
> -		}
> +		VM_WARN_ON_ONCE(!*locked && (ret < 0 || ret >= nr_pages));

nit, we are losing accuracy on the value of ret here.  I doubt it makes
much of a difference though.

>  
>  		if (ret > 0) {
>  			nr_pages -= ret;
> @@ -1808,7 +1805,6 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  
>  		ret = mmap_read_lock_killable(mm);
>  		if (ret) {
> -			BUG_ON(ret > 0);
>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1819,11 +1815,11 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  				       pages, locked);
>  		if (!*locked) {
>  			/* Continue to retry until we succeeded */
> -			BUG_ON(ret != 0);
> +			VM_WARN_ON_ONCE(ret != 0);
>  			goto retry;
>  		}
>  		if (ret != 1) {
> -			BUG_ON(ret > 1);
> +			VM_WARN_ON_ONCE(ret > 1);
>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1885,10 +1881,10 @@ long populate_vma_page_range(struct vm_area_struct *vma,
>  	int gup_flags;
>  	long ret;
>  
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> -	VM_BUG_ON_VMA(start < vma->vm_start, vma);
> -	VM_BUG_ON_VMA(end   > vma->vm_end, vma);
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE_VMA(start < vma->vm_start, vma);
> +	VM_WARN_ON_ONCE_VMA(end   > vma->vm_end, vma);
>  	mmap_assert_locked(mm);
>  
>  	/*
> @@ -1957,8 +1953,8 @@ long faultin_page_range(struct mm_struct *mm, unsigned long start,
>  	int gup_flags;
>  	long ret;
>  
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
>  	mmap_assert_locked(mm);
>  
>  	/*
> @@ -2908,7 +2904,8 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
>  		} else if (pte_special(pte))
>  			goto pte_unmap;
>  
> -		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
> +		/* If it's not marked as special it must have a valid memmap. */
> +		VM_WARN_ON_ONCE(!pfn_valid(pte_pfn(pte)));
>  		page = pte_page(pte);
>  
>  		folio = try_grab_folio_fast(page, 1, flags);
> 
> base-commit: 2d0c297637e7d59771c1533847c666cdddc19884
> -- 
> 2.49.0
> 
