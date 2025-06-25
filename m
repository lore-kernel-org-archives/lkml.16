Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E92B285C97
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843917; cv=fail; b=VAYBDdTB7XvnBHVWiIEjFylGfU36TOUdSzytj7zf4u7U6QzpZe7vxVKJu2r0wlPp6URnVsa1n22Rxxz+BftAHO/UZHi4Sbd8iB76ORq4ZMj/DvRqkmf4peUqRf2Q3K/quepHzmIC3ayui1N4nUBZMGm5Ok5aZLUkCuaYuA5W7fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843917; c=relaxed/simple;
	bh=yTIfpB7Wgt20F8QcqcbA7VV6xIA0CE07+lq9TNasogU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GMH2ZHGEjgPMyq3CfEtbjktheN8cnPTlPCfm9pGcAjw8ntIenf3ZvewrofLHOnLLhcY4KXnIXAMybDLVRaubX9VtjsiRbjzhWqpxu4zeTX7kHqSBh9Jc+JP9mIFzo7c9c7j8j00w1LAnLNtgPccZLxlQ6zR5hydvQA6c/ueuvoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fwsAW7x0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SzCkuRIb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fwsAW7x0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SzCkuRIb"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7fshA028501;
	Wed, 25 Jun 2025 09:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RBkKynqu/cuNPMxFi/
	Way9Q2BxS5r3DxwGNYwDTrNh0=; b=fwsAW7x0cojJWlWRgy3PLaaRRKY3lZ8kfM
	vrLQ2Y1o3dgkzkRuJcS620d0Tjd4pVFmosm7pIVWz50hY5sbGYkh5CdtpkTWjYrc
	8Kvsst8OT8Tfu1TAndAd+D7ic5O6YgBmhs1c27dspizVQFclTc0hsAGuhG7o3vrw
	tieKo1NhDOCp9ZYJi0w4auG5yHZSHX8vWFzttvb+KjsEu5vvKKOlzJBbtVDLSqiq
	g1hYiSRzIh0ZfXDqP4O40grdOY863FKrCOMLiTYPb4R4w1UiYifyXrQigCSJiCMM
	flry3p5SUGT4mrgA0AqLUcgSohHBn7dKYLtkHfIWBkYoNFB0l21Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egump04u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 09:31:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8XoD5025751;
	Wed, 25 Jun 2025 09:31:38 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvxb8rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 09:31:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZQfji6wHv4T4XEwn8IEI/R8+cBWqVj09OuRI6GQCJbCtg7wlXe+OIDAoY43meASS7iqUbbS9hhpLwXa7eylQykPzfaLE5Db0xL7frwelseFH6mddM+qRUIv+VtZ2Q98cPObXGZpPZNKBK4/Zhev6TAv7Bq6bg2pEZSNfmduuO1ngnTfdzZwo0xeq20xvHJgtJZEp8KbDWLz+h34hh6mQiI5UGNpTiDShHMwGnyjr3LPF2ptAaMeLZCuLeY4u3EYwuhGiyITUmYIlcpXAfYXaozHoSRPH1vvAOPtCCuYOcIye+sTpjPjwU3G6ckjj1SFFJmPvMS6B5Osvu0Rkj9Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBkKynqu/cuNPMxFi/Way9Q2BxS5r3DxwGNYwDTrNh0=;
 b=ePB0hWtLALOVoOdsBealQzbRyUBMeOpiuedtb9zaCPD7o/Scn3ATDzyhNhH+w25yB7U1VUKn4hQ3a50CPF6blWWSRmNBarmgXOGYNdjlLV7CTMdoSLzxXVCbQLZYcJ0UFMjel3F1f4aaH/Pjhn8hVUvQCRaIg/N8/WOB9kvkjHdXsNNCHcYWF2t6A3Rz66eyCvzT/oKTcMUfN4brmBMsehVQsezGBhTl3B+eCHvOLgBPJvXHeyKTHkHfQdxePPw+EMV3biCxcj2Z3vzV6rnBYj/Kax4u1TnnpHyVSu/LbMM9mNig4vFZthr7HXL/CO7PxByznlIJkKEm2ghSyoo3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBkKynqu/cuNPMxFi/Way9Q2BxS5r3DxwGNYwDTrNh0=;
 b=SzCkuRIb+EfBm/SKzyEX5FzrXsAyd/n3IO4i2qmldEomcDfJ522RqT4y+0K6s7gU1xuG9eOmf1B5WAb7kfZ/XHXunMPaH4mh6DN0Pb9UjGi5mKwbkNxfWUDnAq5ArtwkQSof1xA21hlLjEBc7221p7DUupNcui9/u297cjNwXhU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5118.namprd10.prod.outlook.com (2603:10b6:5:3b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 09:31:36 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 09:31:36 +0000
Date: Wed, 25 Jun 2025 10:31:32 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>,
        akpm@linux-foundation.org, ziy@nvidia.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        baohua@kernel.org, zokeefe@google.com, shy828301@gmail.com,
        usamaarif642@gmail.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <ff3cc6bc-dd40-4b6b-a293-eedcc7c8eaf6@lucifer.local>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
 <a16071e5-ae97-4e1a-9df8-f353f6b319c7@lucifer.local>
 <23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.com>
 <decbae07-0c84-4379-9f9d-6e2bd6dbad6e@lucifer.local>
 <a877b2b7-382b-498b-9b4a-188a0845d630@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a877b2b7-382b-498b-9b4a-188a0845d630@linux.alibaba.com>
X-ClientProxiedBy: LO6P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e65a31a-1170-4102-8c5f-08ddb3cb14ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iHuAG37is2TCmafKhLvGAhrcoA1VVNpvAl0hz5+wrU1I+E/h4QHsmTfKZEYX?=
 =?us-ascii?Q?gUgJ/vMT/KsbaIanTRGdB4J6Yh35qA/Z2Xuv07MbSgp/pbyAtahnkZS0qRPW?=
 =?us-ascii?Q?O5w6r7viFAXSVfyJmeBBL6eGph3c8DvjKDekHf6y9K9JW2QnST5VYx/ydO+j?=
 =?us-ascii?Q?r11PGIGZS60W+TcEoXJByU8WTjEROKqrb9Rba5UavqU/cMtAuAXlIQ9P9H7Q?=
 =?us-ascii?Q?7mPHCvUqeCjYbE4xsGClrJFsxs5j/HZaQtmcdIjBanOOtgSeMo4Xu4DfxytV?=
 =?us-ascii?Q?QNNJnsH1j6S0HzCxoJN0EHqbvc7z3TBZf/vdoGz0tjxAnyts6ZKGMWYEo+7i?=
 =?us-ascii?Q?o6wu84He0m2Pa5AtQRidRM0HViuUtuNPXKTkRP21N8lPCpHQPpnFb8PlrK89?=
 =?us-ascii?Q?jiw+hJYFfp29wRF24+MDRkDz7o92HCkNY0xpWJ8BqZTkN+8/AUOxhUu4G3Rl?=
 =?us-ascii?Q?qNOIc7jCPkwefyDOTKyv+3l39eHfI5+MRpr7HyGOecnPidvv/lkIUUsI39OM?=
 =?us-ascii?Q?hn1TWe/tF3Qkgt/J620m9Z9m+7ovnG3FvVKneOvIiD6JdqZcuCPGgOVZTtNI?=
 =?us-ascii?Q?e4QvTlvJHrfj1Ofzx8Gxif04DDnLgdxnGrRvhVaCSghLsMhyzJjirOanc9li?=
 =?us-ascii?Q?5TMIzQbmXODMjVbCjPXqtMMj+do9j1MoDQkvB7y2HIPNlEZ0bqozmz8MIv1Q?=
 =?us-ascii?Q?SIcTv+Se1WVDRuK3/J7B+BDgMKnP97sCy/Ba2D5tIL16GGKZ4BX9bogzFKui?=
 =?us-ascii?Q?KxpaluGlzkDMOwjr1HoSHWLQLyYlUqd8uHXxJ/Y281Xp2hyNqSTpI4sQZPN5?=
 =?us-ascii?Q?wC9JIgqZSFfMTt9EZ0Ydy9chCuCTUVuEs6y2FxDAlzf4KuxmhEBGTxE6j6JZ?=
 =?us-ascii?Q?uAhXNHAEcUScKrGY+6DxkSUpdOoyjgiyB0034QRZBge4ziU/4yMB1SNorWDn?=
 =?us-ascii?Q?gs+NtcZ1y6t70F4g8FtZtoBJPTP1wDZu6DmK1l3okXZGOLfUS+ujI7D5LDRt?=
 =?us-ascii?Q?ckSGORBQ8cK/YkE+nSb8TEXS6DDwocVawZ5X6rmdG5HLvtk3WjOLfvTD0wCJ?=
 =?us-ascii?Q?OG28dDjeOoZ2sBFuOzcE7yh+v5gozOAVqi+lmlIEviM9AlbMd9hQxm5GT2ce?=
 =?us-ascii?Q?JUkCc8wCbwu7pruKJwva/d1IfG9D7FEXBW6MWJeKmdP8ts0uCD8TP6bREm8C?=
 =?us-ascii?Q?hi098b3hpzc9uhJOVP/Df8cVGa9iRd9PLIsv0ZCzH9vyFcFRjDIdV+bP2QVE?=
 =?us-ascii?Q?3Rnx6JseCfno1IaKjKSl6ItrWiabsHjI1jPSNc8jewJZdRB6mADHeos4b+N2?=
 =?us-ascii?Q?PTfVZjrvPK5bGYik4n1NSJwv/d6lgtkgh3t/ATnQwkH/zYZbxxBDPVTmNIK8?=
 =?us-ascii?Q?D1Ga7pki69fsIIskQKMbq2ui79J30agKsA07DBKQzzPjb42xwOuSibjYJAkD?=
 =?us-ascii?Q?9stEFu6+zoo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?slwpo2BPQyqkNEMHJsPLLcJPD5/xG4Mbex4Zgyal447bXoxo61cEqmrDtNKX?=
 =?us-ascii?Q?YP8OyswAnAAMCUwsST/q+NrihnfTEZtpU4rXGS3d+rL/mmKYIoOkqjtQTWyw?=
 =?us-ascii?Q?2PDB9mOqF6l2WS9XHNgrT92/y6vUp6LUpGjoiUsoQIzaq0bzYAd94LqTzjBs?=
 =?us-ascii?Q?3mZ87oXgharKu84oXdCNQG92RMO4yTJBASb81tjYe8h4f3fR/MiDbi2ZY5rX?=
 =?us-ascii?Q?A9gswcuzc4P4hr5N1fOtMHZzzwtbyVKMR5COcuFKlMIliGtx8R//TupDnsoQ?=
 =?us-ascii?Q?g+7LP3AMHg3jdG9RIRvQe6/lyUfJVDvDp7gi24aGqjC3PQwvgVVwYQpMZUAW?=
 =?us-ascii?Q?hrGCei0ak5tqK7btOB/b9M2kwkPIDdWYqukZHrv+tuXLRSsYg52DPC0vqu8S?=
 =?us-ascii?Q?q+YqnAwyw9s0RqQrd3ZK7nVS6ciN0zQwJpXxIH2vNPxI5HJBbJ14ZFcjR+Wn?=
 =?us-ascii?Q?Y9tYq6w4s1QbxuZ055HoNDN0qtgECe5fiYvTQUcfoFKYresJqHRLCIFi8AJs?=
 =?us-ascii?Q?WyQ9NFqZBxzdjv31OU1ij2fJvv07NulQyS3XBo0OuPOzk1UjMbfnm8NL9iRW?=
 =?us-ascii?Q?PBb9Wt9FGNbRqZF7CR+2mIMzfHDjWFU7IGT2EEbsUlfosSRv/fQ9JY8ptrRE?=
 =?us-ascii?Q?HFAMtk8tddOXzMW5FL4TWKbXBKx5dOgYggzBs3NxuUGbCPgDJVCQ92M6Q9g3?=
 =?us-ascii?Q?iRnZP3ekwOjD4leEn8n/w5Uu3MyV//lS9XyLWuvrm3SwhNT8Mq6BEoPAs+uB?=
 =?us-ascii?Q?VxUYZNNq7C+1531v3NiuyGWC1f3dbxoNyrOME4u83nUPriywgKaeqGbc+4Tz?=
 =?us-ascii?Q?iJHMMxCiAHTuEjVBVWKxaai5b4sVfVUGF0TSdVUOYj7TqdA9+8Qi8vzuY4r2?=
 =?us-ascii?Q?KjyL24aXQ8YSJxSWaI8pEnnjlprIrEENwhEi9MKY4CI7EoNSPcfwFyH5pcfy?=
 =?us-ascii?Q?XnXbReJhxcgRAJ1RRDoFKC44qJbfqrOnu3ImrW143cE12oiCQ7ytZO6XYL0a?=
 =?us-ascii?Q?zmY6YNCgxpXSh2uMcpWoUJ1b0k9ePTQ9nw88/aLLmOdMcxHkiwotyuoPN0Sg?=
 =?us-ascii?Q?PMNYFhOtPTtpajXLNsMgpiNDU10r/PIr99X55e4z9CtV8IVCgRvNfdCcTfth?=
 =?us-ascii?Q?rUZe6uxzEpQXzfeh2gylUbKq8HFCTjBWDnx+oIfsKAW0P51yQKQWVl4OeGBp?=
 =?us-ascii?Q?CpL5Pcid768fDOHRXupXXTNwHUhP+Q2MsNoZ2ZGZG74OQt34wh178LXdyyNu?=
 =?us-ascii?Q?DDQpqNPEiEcLRPTR2wx1SKTTLSb8rCl6rCjuqdHpskQUHJx5QmeFffkHtTqH?=
 =?us-ascii?Q?ccc9HvxHzmWhWdnhDGNs5KxH64vYGprvifN+G/5TuuUc42ODxZJl7Cp3EXJG?=
 =?us-ascii?Q?n9zWz7Jzr6g8yASQE0Y02/TaKMKvBM8T/G+27qZ3iT/lvdyZ25fuIOh1napv?=
 =?us-ascii?Q?/EvZ3MptNmMZ1dCebA3NOUTwxzSVxRUk3R8tvslTuZBgzi9Fh4Gy/iBqwt34?=
 =?us-ascii?Q?N7UJDDBZXbMDgG1V/TnvK3a4Slmg9LY/VK1a3vL1JlI34GJtHqkDj2urWuex?=
 =?us-ascii?Q?fPMHNfzIwPwRY+jnb2VgUYxK/0Fs43x3PaOD2qgJx+9HNN1NMQIUOJXkP5Ya?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cWkFhIFoyd3kAsmqQdtv4/LDA1EfAeKqiffu6vqvLLjzHXUfHPypEO1Z/23SWCPxJA4LeyLZNIAe1oUxc+DRXPaV5ARsT9CKp74+EsZOgBjTNj6KmSUCda/+pPqZwOjFoAQqU+ec0QkO+5yr6+kj+CvCEwQCPq0STzGClLqVwIAw3k+sUoNN0VyICtaaSxVGLsipZ61MX4kJkajjNUhCpJQKeWdhwV/xuPd6tSWkeYkLi6VPaabp+3u+cZ8D2+nO9CgSjmGukz0lr8/puhQtULUDqUZetObBr9j7J3ZA2Zinh0F8A3AtZmUajaOf0T/WiVwS7f/Gu0vM+Rfv/Y3w21Gy5oS6GvYqDefDHqIsaMU8GtYabQXwt57cuLYF//87ImYrIY3Cbg/P1txVcXpgIupo8VtwaGWt6EK2P0qnzdqHZejCkRmYxUk0VqfTUhIyF+pnAqVQo7af9MlA/EuGyQFeKHFO5cY8ZBaOLhr25H7kUm8WYZZYD4SOq0wGDMteCi29MRAj5GynXJ8+hsT+YPyluKVZpNmbcaoi+GVDY49urJ4Fxdo3YLShzWiSRZYsN/sgzNQMxoiGbRUdkaIpTqofFB85xy6/sYACXPICZGE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e65a31a-1170-4102-8c5f-08ddb3cb14ca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 09:31:36.5937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hic1u6iykS1nNAUPQjIyNgfv9ffd2no92YCe9TCtgO06DMWd2pduAgZpkJ4K6MPxM/S4/T3NPTZkCrI65ehCZTZix5tRwTnH+cLuQJU35w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5118
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250070
X-Proofpoint-ORIG-GUID: S8DLkdpOtqvdLrV3qJ0yXGX7Fg-Ju7u4
X-Proofpoint-GUID: S8DLkdpOtqvdLrV3qJ0yXGX7Fg-Ju7u4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3MSBTYWx0ZWRfXw/jJXEcDlrux i/nAFhqizlhIs0+qtdgs+uuhngQfXp1Mn9CWZBzzX9X22lU7jkCZyUzb9PPafVvClg+LUopUsqZ +MjQ9Rajhv1Srs7zFHYx3/wlm82zoqX/HoytWcqQqM35cBSR81RL/MYQkGuqi4urr0BLx9D3AZR
 EyGMkiamVlCyrj8X+432XzfAs8z9qRWU/Nq53GcixNN3pFAw2Slcjp7jmV5hHOn4B8dKIbK20lm OeozBsGYmdjqVQ+WLnpiDH2YP5PYthk1G1wxnIJvxQ3IW7ZkqyIbHVjZ39YGMwyXwZAizTENOT9 CVgLo/rQSuHwqlqdzzmi3N1HLxWUBtvh6JS0S2SAD2S5RCAe3oPx6Gdr2yBoFwWIBUQeL/40OYE
 Q2H9QlzG92C/GN8H3oLBEHK1toKU6ebfjlirDvItqSs0rM6p5pmyKnYg6amFahyvV9gxSl6D
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685bc1fb b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=tcVnT6hyNcE7qv_QjisA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714

On Wed, Jun 25, 2025 at 04:52:03PM +0800, Baolin Wang wrote:
>
>
> On 2025/6/25 16:37, Lorenzo Stoakes wrote:
> > Yeah maybe the best way is to just have another tunable for this?
> >
> > /sys/kernel/mm/transparent_hugepage/disable_collapse perhaps?
> >
> > What do you think Hugh, Baolin?
>
> I think it's not necessary to find a way to disable madvise_collapse.
> Essentially, it's a conflict between the semantics of madvise_collapse and
> the '/sys/kernel/mm/transparent_hugepage/enabled' interface. We should reach
> a consensus on the semantics first:
>
> Semantic 1: madv_collapse() should ignore any THP system settings, meaning
> we need to update the 'never' semantics in
> '/sys/kernel/mm/transparent_hugepage/enabled', which would only disable page
> fault and khugepaged, not including madvise_collapse. If we agree on this,
> then the 'never' for per-sized mTHP would have the same semantics, i.e.,
> when I set 64K mTHP to 'always' and 2M mTHP to 'never', madvise_collapse
> would still allow the collapse of 2M THP. We should document this clearly in
> case users still want 64K mTHP from madvise_collapse.

Right yeah, I mean this is in effect how things are now. So the task is
documentation.

>
>
> Semantic 2: madv_collapse() needs to respect THP system settings, which is
> what my patch does. Never means never, and we would need to update the
> documentation of madv_collapse() to make it clearer.

Yes, and indeed this is the choice.

I think, as David said, it comes down to whether we have a legit use case that
truly relies on this.

> > (One side note on PMD-sized MADV_COLLAPSE - this is basically completely
> > useless for 64 KB page size arm64 systems where PMD's are 512 MB :)
> >
> > Thoughts Baolin?
>
> We should not collapse 512MB THP on 64K pagesize kernel. So seems
> madv_collapse() can not work on 64K pagesize kernel.

Well I don't think anything would prevent this now right? So MADV_COLLAPSE is
pretty problematic on 64K pagesize kernels in general.

Anyway that's maybe a problem for another time :)

> >
> > * If we drop the series, also consider how we might provide mTHP-compatible
> >    MADV_COLLAPSE.
>
> Yes. Agree. Will be another mess I guess :)

Sigh yes sadly. Let's try and make it as unmessy as we can I guess :>)
