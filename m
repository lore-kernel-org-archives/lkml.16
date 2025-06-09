Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE99207A0B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481764; cv=fail; b=lwNrlihN2xyW7ZRdD8F422EuqvzZJ8YvjDu3dvNN7yZ0Hcpo/u4uVyZ9rbFNuRmaZLUGSTRKNyc6rBRTOEjTCDuyT+e3PSNIRql3G+BmcGW3LJsiJE/bG184FPF7a+mwxlHQ4vRmZUnA7f0gPO6VlDBD+Nc8e71kHyODAKD43XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481764; c=relaxed/simple;
	bh=waXfl+m7xwLvNfXSpri9S3Kzq/AYkwhCVPuUEK7dfcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=InQOk1s4fpibq7LiEfpKSqy4tMhVpwR18Wr7cXw99i5Z2YXTco7Vt4SQWZTYlaLxb1PgC08rySMN4j2ND8+kNOOEUSo0TBv71gBlnlMWaCyNs1y1UzUbRpfeujI50a/TlfOZ4N4c+YY6XDTm3D5pJ4j6oEqVHFv/+QNs18qrebA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mabeM8yW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=frzO74+A; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mabeM8yW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="frzO74+A"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593ilXl017209;
	Mon, 9 Jun 2025 15:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=waXfl+m7xwLvNfXSpr
	i9S3Kzq/AYkwhCVPuUEK7dfcM=; b=mabeM8yWDmm3hoGi5WonFFGyK8N7ja3hIX
	H+TrsjxjpHZBGobmzMt2zcHbuMrLGDIwboYuuUfuEjfa+6pdeQiucIOME4YRDQ89
	Fx0ZCHPjVYifAy3CnhiRpHw7cwNUjIjC1/19CB976z34gEtr0+ll4VmhAum7nd7j
	Dhmx1kOrNJcpCco7i1eULwzRptNzh8J3waSuFqUxfzuglrTPl2nO1Cm/8DUa3l3E
	erW6y+aPRr3wHn8t9sOoqpJiUnZVsZRM3wEILVYHZhw0aH7t+9tHIX2P28Ptu5Im
	jh34czRiaCUi2bes/G9zZqYCtvwg4k9/dAMd5UqTPIUVSoTIDW+A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74tc8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 15:09:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559E067o007379;
	Mon, 9 Jun 2025 15:08:59 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7aepb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 15:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMLm18oCqmHFQB3F6ZXQx2aX0CBHWz2TMJA9GPYUCJ+FV/Qn6y83IZRHMR1dyxrD58wF/jFzgy7GOaxVu2pp+h4/zhIhlS/pgQWTWhZgrC2jKVmN9wc1uxijisQPbxQcDTe7LYbibFqbnAcufhMTCBdNTngG3HJRlnr23gnIlulF8eKoPstrrI1eIus8tqbIYRTB/9Ct2nJqot7zPYedvLFeRopIpn5Jw3dvTGuO+1uIz2ZIYA8o0U4MuHLLgCcqSaOxpDnjRhGdFBk4TCbIeha7qaR8TzhF5yzPQ2VN3I5JuSs7/yB1dUIIaqtkt7XY0hbAlWAwA995tHxRc+d89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waXfl+m7xwLvNfXSpri9S3Kzq/AYkwhCVPuUEK7dfcM=;
 b=QpIFvpWlp2J6OPQSNPQ8DjWGfaI0AODMEm+Rt/Y7Trg5EllIunVpjh87jTqofFA/5YC6Vaet2Wpj6nbycSiLKyKKa3dutI88xbIM/aTo+kkBCLkF2NhdMaUdH8VKxT8ULAjz6EHGTIjkQX0Y3J8uQDGIIZgpTQf3+Y9CfwN4nNzzQFI4/P47Tusawx5pZaA10JHKWvdRx5ZRnpm9ObFwguzdUT1x+MkSIFYPLCvAE9LcsNue0B6GA3uxrH1y57X3TPUblsXBgH/6TxHqwdnIGcEbf2Zur0a7ip3wmAFtWQu8THdlpLKKzkM4JtMSlvFcvwB8zwFFrk951+4d0uAv/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waXfl+m7xwLvNfXSpri9S3Kzq/AYkwhCVPuUEK7dfcM=;
 b=frzO74+A3RDWCam58pQU4pbB2vcOAmu5oYEeGFHrA9ImuD/Yn7qOtWAIqbW1YNqr2MJ14Ztc1PRne/jAZ2k3iI5watitClCHk6n6Jjs+YycVsdvaSJuMmDpuDrGwXfJQaS2WMdPOFDXvEd9tkjRya6bMH06mWRjuEH/l0PhaRBY=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS7PR10MB5008.namprd10.prod.outlook.com (2603:10b6:5:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Mon, 9 Jun
 2025 15:08:56 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:08:56 +0000
Date: Mon, 9 Jun 2025 16:08:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Jann Horn <jannh@google.com>, Barry Song <21cnbao@gmail.com>,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <5afabf30-da5f-4fa8-b1c2-e3b384c2d99c@lucifer.local>
References: <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
 <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
 <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
 <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
 <7cb990bf-57d4-4fc9-b44c-f30175c0fb7a@bytedance.com>
 <bfb56be6-d55e-4dcc-93a3-4c7e6faf790f@lucifer.local>
 <f0069b65-9ca8-44e5-8c98-1d377798c31e@bytedance.com>
 <d68ba9d4-5850-4b70-bbf3-00d79f19fd3f@lucifer.local>
 <5fac6f20-2643-4d98-a29a-06471f156762@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fac6f20-2643-4d98-a29a-06471f156762@bytedance.com>
X-ClientProxiedBy: LO4P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::23) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS7PR10MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d151535-f575-4006-27d5-08dda7678e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ec2Yken35Dv1leJLm07s6sFAiVDYXMcDLyZFWTqGdw2E/DCwCzzuYk0e4rmw?=
 =?us-ascii?Q?7P8elmTLzQPhTWXgmn8zzlBt8FxBHYxm0zRyBEkmSWWITwSrSzL8ql5UbRQK?=
 =?us-ascii?Q?NdnhmMDdJ1YLa0/IJmNxqvB/ywu16awrM0k6OTyEWLTt3d/z0ZvG+IXR1AAV?=
 =?us-ascii?Q?YmButI95gKkxgYawpNDNNpzGGg+tKQv4WZWu4rQJM3JfPKZsrU/CSrhw/CWS?=
 =?us-ascii?Q?kvFt8ytXmDZWTh3l5t2KYKDuYv62krXVZAjF0YE/CP8SrJI+DDzsxMZGARvp?=
 =?us-ascii?Q?Te/HsLmYf9NImkyelryfNpLBMm1HOwnZxNQ4HAhPqkcQtFjQG4JJD4pcN9QU?=
 =?us-ascii?Q?udrUcKbJEwZwXktuQ58heeJW1wbNcFF3K3AAwwMjA3q1VKH+bhD63RYpbbmd?=
 =?us-ascii?Q?/EeGk+aZ7W6N2a2c80eW8KygZnG5JoxFmJvT6jH/aSVMovxQplUFqaED+d+j?=
 =?us-ascii?Q?XYqu+NvLEQOsHuivXTkubSHMDe1Jgs1/enE/afKwcRr8l3nK3aVs0q5NxfeC?=
 =?us-ascii?Q?car7snfdsBH3AMuQRkMyXYDcvAL+JHaRdRcOS0aPruozExpAiix8HE5W7b5B?=
 =?us-ascii?Q?APnn0mGMc1clMRmaDf8kt4OTb4TdaMeKc7k7TzrKqSKL8npT9S83zVnihfel?=
 =?us-ascii?Q?7n8YcqOPa1wlA/8nA0unPudkQ+k9MYR8WKqcrwv7sPjwlwPAtbtM7agU0x6k?=
 =?us-ascii?Q?vL2ly8HTrHnrz6Ue1DwhrAQ7ZgffGQTYADY2XKGpU8w3IeBgbrSJzzwzlQRf?=
 =?us-ascii?Q?BaOOz6ZyRHYz9nFUtgb75AZUpnFEqXjc3dtBx5zny3UlrUiZiUW06k6IfDQ1?=
 =?us-ascii?Q?vS+oLBvUtGkYaXYXAyUtzCDoUg3oVsu9yVb3wcfZ5qBewCuc26ebn7LpVfKx?=
 =?us-ascii?Q?/Ta35wpiTWtgmyZ1bhWfCff8NgTs75Z+v9LDddyrRdiY67MfJE8pOPHjWFbm?=
 =?us-ascii?Q?CCgheY1icuv7u2eCesiZ6zCRjKRasH1zU0272hJHETy2aWXldh/311VLTk+Z?=
 =?us-ascii?Q?BaH564Yjzhgewgca9WOp8LpYjopFfK6IFCP7S5eUafZKBvmOKWU2w6xwMg7E?=
 =?us-ascii?Q?cSmR0VnHCcJ8FSbL6Tf4yvnlZcDTRapU8+HyirSewmifC+a2/ZUzEtSR66C/?=
 =?us-ascii?Q?kgJKxCM4fw5hefh1IECzDetYRy3NpNEBs42Hu3dvxcZWnOadrBWkJqFJIa5D?=
 =?us-ascii?Q?YvmBFZ87Ecq6tdTcDbFpdz0pbbLuyWKVFor3fL0ocE/WYI3vN6tnYKt8XYrA?=
 =?us-ascii?Q?iDl11cjodc9WLrwWZhi4c4rBe675K33A0wdg2ldZrpq0wt49p+47b47pttGf?=
 =?us-ascii?Q?tWhFxHogO0MYkLtI2/4zDSlEbkzJamFSKck5cnEyYkw8Vel851Mpdpolj/YS?=
 =?us-ascii?Q?S8u3FiTbFXlGa3RRMgscHQFpu7JKvx6W5FArnzySGwdZIuaNT6uGRdxGXCZv?=
 =?us-ascii?Q?C/wvw4efA1o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YuA9P9GxP+E7MCGK0Q/nZv7vSnsN5wwVwv4LQuiKw0fmRWtN1EWhCmsqWUR8?=
 =?us-ascii?Q?OZ6j4ZnjIUrg/H4kjx3tOE0j3a/4B/ioATFwOU1oGXfGTWhwDFMmxAIC/D7t?=
 =?us-ascii?Q?4tAGa/3L3NdFRpI+ngU5mf+DJ7l/6ipFtj/brU8CV2bTj6s+5Dg7NUK/0uYQ?=
 =?us-ascii?Q?awVfwSo0aFwFHeEC9D7Cu0T+kQNq15BLwlCyMsU7SfUIcTEqhxNpi02HcNbu?=
 =?us-ascii?Q?TXelpDmCPmxPJ0xUOOWR+b7MKa7es46c6jrSBQS3pU9MktDT98AMjS0hG4ry?=
 =?us-ascii?Q?DPGquswT7mdDHUl8r3BIW4wEvzGh6wIlb311ytfauMVjpa5UzcCy7K3jdR/j?=
 =?us-ascii?Q?lgKyaUiYz0+9VXvglzsL1zrXC3ok5Im7emT54/d0K5ZGLVyAfw36/N9g3yHz?=
 =?us-ascii?Q?Zd7AeLFwPl1LAQXYNC2N3X5WZmYVIq8VdG2f+NUTVF48kmw4p0iSi0L1hX56?=
 =?us-ascii?Q?IqtP5aQQzaw/MaWDN+ALp3UI6vd4tkKYjDbMAsW77j9YQE26x3FFBPY7zVDL?=
 =?us-ascii?Q?PStDNqJzXaM7x8VWWcgI/ikGb9CkY14A0MdAAD07T3PCx9FEqd36YGjvj6qN?=
 =?us-ascii?Q?e5UcuDsUEwr6ZFh71RBVy3oJ7irQQH0M/sYg2KVZlQJtdGLLMfJHqLni5XmT?=
 =?us-ascii?Q?Uj4qomuZ7oetmcgtkr8QWoC5W1d9/WXwjgkovzjSpvIgaMJtlAmSkGUPORIW?=
 =?us-ascii?Q?ck8Gn4ORBdQmyy53Me4GgxYP8BgXdTTEg5w9woMaJBYLaybwUx6C92yYcxJi?=
 =?us-ascii?Q?1iauluQuwN+lZ2FxGIWVAn9E3HnxYcgXc/M9J3Da4SVby83A12H3Zr3zsYTo?=
 =?us-ascii?Q?YPQ7gNfsiTXzLGMpkbirgUqG8sKvapVWhDASe0jma9cZdkER9tuQibWtRhUJ?=
 =?us-ascii?Q?Rb6+IjQ8/Pn4ERMBNogzm5vuyNdgPptL55tnUSSSN4V/T9JhASE5mcY13UdW?=
 =?us-ascii?Q?lFd37a2BPPTWoOsrDRwxM3hsBstk/v57BsDcK4bbhyYCPTlAmh8PEKEtYaJi?=
 =?us-ascii?Q?k72ReUFNWmHJfqNRuRrW+L45IUcfjcf38MrGyL+kh0Ag7zALbxWNczmFknnr?=
 =?us-ascii?Q?FysO8RWbleQaqLW36c1OFkPCwaPMrUDjMYIcAyg65tdlts0sBVHgpVnPRCtr?=
 =?us-ascii?Q?7QJ7Mb8KsauZ8nNfKePDX4FHsw53vIMgt1lIpTX0zIic9C7Fvt0zorCICkCW?=
 =?us-ascii?Q?hV3UwppxJkLI3KYhcwtTTSW+Sj/DD4beSy7pCRd5Hle04Rec9FVRb/Ta29si?=
 =?us-ascii?Q?vujuPCjSL8tqCPHiFZdBxQgFT6azLM3EPiRWJ/MreuZNN5v8VxohLy5t1OkT?=
 =?us-ascii?Q?K0CHgEhl8gTS6+jQABDYQ72+N1IsfZSsc7nXqRxLJmlXNq4WD8NPsvDCozxF?=
 =?us-ascii?Q?PXxA9fsXA/224sFXZuNTiPCrj3SV2vl2PsuunNoh6Ec+euxCktAUjwOSezrl?=
 =?us-ascii?Q?KRVgOiodSFdiOnfX+KFscZ9Rz6Rbotb3om2LKT5DzwtiPNDyj5QaVgyqfUiR?=
 =?us-ascii?Q?UEwqbTqHT1HaDj9//lq2/jBAjFC4+A1nbJSA2NXZMNzDqSkQrucHxAcRqrff?=
 =?us-ascii?Q?gwbL5zUwK3IXd1qeoyrmQmmgkdOruafK1zdfhMiZdM2/F8Hff+F5BSVr735I?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jWuSNrkY/gulKjiryW9ZzgBtRuOLN7bOExChv0kU8GzjMa4q8uaWBf8XTwf6rXXuwzTkFW6JDFvUuOjzYaau8tGtTsPTDfkjBrcPGqcrgwlUouUVn0G7lgrPSChrjf8A55VEGGujqh889lA7rMfqgwhA/F4Z053CrQKKER9sPOd7npUDmMN4lZR/jYd+iTSifzS5kzbqE1y3pvARcBw5cMRUDc9BMLAA2EnREmz2xMCUodVCwvS1fTO5Bsky6K4Bgvy9NiVFsUaL56ptTRjSuLEwjt0WiBE05T+ngBcYT4QngBXLPTLL/mGU2vhgmN4teGiSLFqNdu5/k65jfx863xtJEZFlAUuEQE9E3XPeAGUPvFRPLHH/SqeINikHmMOTlz1ua3viydtmlAHSRNAVZ0MzMR0yhmlrdpgDZoyp9ytEKZ5HFLg4FNPJ4u9FLRl6tBgBAUVvRWV5ppJBPA3ZkqMVIxgd77tX1GK2dJlyOFVUIByZIbXsohgnUAA3We8Vy1MTx1/e35bD1CCKf5OhBTpU51qdU/jfonth/GPEeFe+eEoEjcWKDelTTFRtiyDXt9kPp7f9XY7fLl62HrKUhesxBYQBZnuFxSnDmxKp0ZA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d151535-f575-4006-27d5-08dda7678e3d
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:08:56.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKR8bSTCmCnXD/35DkoG9dJx+NmG0h46EP+5k3z3SPMrLLBvuHiadsmuGJr6AWQjPAu8lL6LFbdOXVuFXBa+k/riqxvOfzTa68mnIGjvk9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=634 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506090112
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=6846f90c cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=3lpVkEXhDBfPzqlo3TUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: mYfUVcnWatubL1_o415XJ-vsImUlJN4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMiBTYWx0ZWRfXxLbspeLZV1kT RmacHrSA1w9laOSxhizN0lKpWDfH7jmWXe9g8IEGji3iY4foVjw6fXcJnKHI5Yszaa1km98F4JF nUsA7vRqMaCJvc/F3MmdWFEVbQiVvS5EJVRbmedp2r/hNwJ6AgFiC3d+NaRpWy3dPgPuFwZRpRs
 1FKgao/k60TBjt2cl0m9ytOTd9pZD2A+lNkx+vQx5ZGDBq1hHhY1u6qZ9JFmsfRvmJUkLsoDwHe ZVGVOzmIG1nBG+5RXR5uIq7ut6AyMyYaE9zf40t/b4UXQifLIN0khkOS3fvnk7WPhQ+bNWza5tC cTy12CqqcXARZK6M+Ei/A77kfqtCShMgxVteM709HzSOITkK9xm0dmEWvR4Po42HJQWreEeyQrq
 /cknzPHgTpQgeoocpQaRX+UkWvVi70byRKDVeLWiX7jyAJmmz1P0H64xChd1tg65tERGPWt5
X-Proofpoint-GUID: mYfUVcnWatubL1_o415XJ-vsImUlJN4I

On Mon, Jun 09, 2025 at 02:40:09PM +0800, Qi Zheng wrote:
> Hi Lorenzo,
>
> On 6/6/25 6:44 PM, Lorenzo Stoakes wrote:
>
> [snip]
>
> > >
> > > >
> > > > We could in theory always add another callback .pmd_entry_sleep or
> > > > something for this one case and document the requirement...
> > >
> > > Maybe, but the SRCU critical section cannot prevent the PTE page from
> > > being freed via RCU. :(
> >
> > Idea is we'd fall back to non-RCU in this case and take locks... but then
> > ugh we'd race everything RCU and no it's all or nothing isn't it?
>
> So maybe the RCU+refcount method is feasible. We can release the RCU
> lock after incrementing the reference count, which can ensure that the
> page table page is not freed.

Oh interesting... will note down for when I take a look should you not get to it
first :>)

>
> >
> > Overall - I will stash this response somewhere and come back to it if
> > somebody else doesn't in the meantime :)
>
> Thanks!
>
> >
> > >
>
>

Cheers, Lorenzo
