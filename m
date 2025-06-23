Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B32940F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697925; cv=fail; b=AMjgftirtweuylBNExZppe3F3tOzofBOrqTIv4w9PW4Gt+M57eOjdjfi4A7i1yL97h70sF7Ws8C/9OmPNZ3sgeowL+9hzMA8yiTTCDhpAWC0HmqDVXKUkbMQRU6uufuXCcfjwqjfX4mZ73I9Y4mavJOKmfDU/3ScKOUJI1Qt7Y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697925; c=relaxed/simple;
	bh=24DCPbqZeCG1mz80Z27cltwYGYE7rOLKK7NxRftzcpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LjyuoIvBGPPuf1UENQVBORh1YSyhnn1bPmcRr9g5fRa99Q6yyyoD2AzECAp26b+ldjlGlib7St4OPsbeLc3gnxPJE8xRo/UU//iv8lWsX0HJYc5K4EBsIEuugt1ZjLRsyt0MCBXt34+srnuRdoQ6JakbP51J/Fs5++T9r/PPd7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BRQ5Xr9V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fmQj8g7A; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BRQ5Xr9V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fmQj8g7A"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGY0p1015475;
	Mon, 23 Jun 2025 16:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pLVUDgoiRc0bwWRsOP
	7NU9wLwa4E3lw9oJaE1qs1HGc=; b=BRQ5Xr9VViKSHIqK5b5MhssgeuhQi/0w0x
	B+wiPLTuAZjnJUgqW28siH+wOBlqbNm6mjCoVQFVYIwzI1oLRe4ES+w2zfXZsapv
	xaY0jtHDOijkHvx4tkAjdzrPkYbryWlxYOWacYXbsWN3lo3na3Ofh/H9I1X4KEhf
	Su5bLWXPyI2t5AbnVo/eJKss8Bjv3gaK4ykwWq7gO/W7H69XnwPMGxUjabWkAEtt
	749OgL6xPixaMvfUUm0lRhKEIqaWZ+1DePtVEaqCIxFHtoMofMBDQdZMeav1qQb4
	L/o5XFOFTFmv40URBA2r1sOkepUWCKivwUlErPcc9dMQx7ksIoKQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mu5my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 16:58:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NFSvIt009051;
	Mon, 23 Jun 2025 16:58:28 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq2kmu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 16:58:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC2xfKK4rJOZuZU3Mf1FR3sQE3pQxLiRRkcC1hCo9tm+0AK7sivmGt5VKm2uLE8WLDJK83szpefrDDGzewppNVUmNhe39Ipv14T16EdR+eO/oscyY8aV/LGVj6CtDyTJvXd+6ooXZq63tvYsUXIZqS1ZwRP7294Gp0ymqOIk/BDoqY8v06QinxDAgxO0vITznLCKIXgpf7l/KRwtVKo60vejwsy0tNVY9ziOXHvY2r/rZlCUXkZ6rT10tTkOhxQh1scdygMaYk0UJHN/ddCS9vhR5Sjg5Wp7WyFD3lE1Ko2WfC5txtofdXRHQDtQYIRNkIsL4tOplCIJcGVItnybew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLVUDgoiRc0bwWRsOP7NU9wLwa4E3lw9oJaE1qs1HGc=;
 b=r+U3dO11mrVXNXRdo2BfTeu0n9isvncxBkoigXI+jaP2BWyUus6du1WZYFJFm17pb9+N79jKV0CC+pJou8UIYWROU1Ear59IzTZnCPDHuk4OfIfPh7L0pjSsk9m+Je64lH4SrHkl9WPjfv1+txD6uN054ALGci0bs+SolZzIB/SSQuHy3lZM8ZHxTLE4ZqUKegmvQ9P4ufLND9RfIBO0mHJ8rz60ut788+JjJ78jrx3Uk2SLLi8Xf2Sfa9FOA4cjnnofFMYATP5HzD/ko5+qPipNeEATrR/yInakz5bOQMEe1tavKPJOytYDMZ1P1cBGIzZ0CVm0tC5qNKoXE60EiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLVUDgoiRc0bwWRsOP7NU9wLwa4E3lw9oJaE1qs1HGc=;
 b=fmQj8g7AveNIPcjSZzQXX0EcKrCJf7B4ukzKNu66Anqyev7zxYO/sgbr7Wxa8FEKQ87TVWcgloE1Bn5hPgzv55M0BnODYjzRx+FHKGPVZHmYVB4rg0ANE53Qq+u/NgCPH+Hdxtm01remjbe2QUWNzEY8zSlAyMT1V05gwhuj6t4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW5PR10MB5666.namprd10.prod.outlook.com (2603:10b6:303:19b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 16:58:20 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 16:58:20 +0000
Date: Mon, 23 Jun 2025 17:58:17 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] mm, madvise: move prctl_set_vma() to mm/madvise.c
Message-ID: <d882dbe6-2a8a-4fe4-90e2-b170f6e4d519@lucifer.local>
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
 <20250623-anon_name_cleanup-v1-2-04c94384046f@suse.cz>
 <CAJuCfpHA9hMbDfeW9kh5m0ZWOLaxya3PrwNh9e6rZDqQyu0gAw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHA9hMbDfeW9kh5m0ZWOLaxya3PrwNh9e6rZDqQyu0gAw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0176.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW5PR10MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4e8c76-e6eb-4a8d-ccc8-08ddb2772857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fMZro+pIGGmQhYjJiVL4Q6q1WdIxHQ89ZjYrV7vrBuPWdbJoDxK6R+3SnuUv?=
 =?us-ascii?Q?feUW01sTibo0Do5qRvtg4tayh66EoqV0/XKUGuCzyI187Ks7ttQaRrU3Yxp4?=
 =?us-ascii?Q?iZYjT6OroMmEkHTLKWAf10MNtPVP5BXOx+w/KnN+59uQQ9GR7tSx1Dmp6HYP?=
 =?us-ascii?Q?VOc0Xf2iqnr5rHI5xhIJKwi/xC1BPXiiiwkRMzqulfoMeMqH48Ib/FvjzoA5?=
 =?us-ascii?Q?wA0OycupoY3kGK7og9xu08kN92u/ERrxeSAipT3M8zjdQHY2+/Z53oMPXFtN?=
 =?us-ascii?Q?Rdu9vpWwXK+B3euA6G9VKC5TmnbQ7fB6x6i/9XYqrd8N3qI8SQO5fabfo7Sn?=
 =?us-ascii?Q?cuS624YTRDOc5f8Ag8g2gbP6E2N3C7MN+uQLKqWiLgJX1mztrNyeOmjbE2sr?=
 =?us-ascii?Q?6wffZ/YCSaBB0S6JjyzzlbYalq9qELbhu6x7xw612X2eK1DUeboIGd2JE8KP?=
 =?us-ascii?Q?Dyw5RLAHYmHozNQv5C/ZUMT2n0m192q/+ps564sdNkZmHWX0fP7WHarIAIT0?=
 =?us-ascii?Q?8j2JAJ5iDtvIx7f3fI5kmsqCia03Q7xGO0DrgYLUljPid1qFNIDqm4PR642u?=
 =?us-ascii?Q?3IojhU/X1aNaQeFq929twP2lNJyGQwUoDQT7TVtRsCMPpAZFNz86DyORHIoz?=
 =?us-ascii?Q?4BMJchtkfdJ/WttXDjjly79hJP5dYZ1hI9plgJx/PZcCnrQrJls9ZKMcr3V3?=
 =?us-ascii?Q?u8f2sddFxkspCLg9Yj0k1JWG5JsKSAk5Cu4hOYuv2jYztqugKV5SymVKTPte?=
 =?us-ascii?Q?Gz0brw9Xp07otxqeZJj3IrDfXsXNclsljwQggaCOTD45m6Rqd11/8qx+qVM6?=
 =?us-ascii?Q?tUDgqRwHblDmqMOK9ZEBz3UWQHX73rhj46/PSGZ9o7/mW0cwexjG0Bd+zTtk?=
 =?us-ascii?Q?QH6f8d9/T8Ylofc2nzqgFax6wf3qtzvHMNvDwsdtbt+0UrovrZWq1Tl+zm32?=
 =?us-ascii?Q?Qn6hjWh0duMjK9rlkGSjwV0mI+XHOAGUyoRtNWZqDsrHr/8EdLvB77mfU2uY?=
 =?us-ascii?Q?aA8VrA7las2vJywAlZD1ELbAHul1a9IgK6bwjsCKdOgNaqzBcbbZHxCisijB?=
 =?us-ascii?Q?5zmZphODhMo3t4UhltlMudSXAd3bvc2kMjSds2TeoTayRkM2Y5ltq465cjsw?=
 =?us-ascii?Q?G2JzdL6q3WHFuCZ12tZZx+pcEZOQpmjxfClOqHRzTTyZuOGl/GXYLNUyTNx2?=
 =?us-ascii?Q?OI+Uxyx3N9SZ9jzFoVx8PbllzMucnRSGFc4ZhE1YgUSlMBA2gN0ZUUqCeNQQ?=
 =?us-ascii?Q?+oT04ZT9RpUVWTyEmeFXtHXLauINMIoHF4L+Rm29SpDNlav9qpjCTeDmqSXu?=
 =?us-ascii?Q?/AE8QNFvivebltFU39Qz5epECQdu+ElFzGQ5DQa2tBpfeTt99ZiiG68XTS95?=
 =?us-ascii?Q?1xbAUrQdI0X799VQijIEVBsV9aANUY0Ua6XuM1MsayZadRXWIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1RL0+21l/sX5CnBZHo9KuceaVLeRaoZpt/G4uYZ6xrvn6Fj55S1AGzqHtg4V?=
 =?us-ascii?Q?ywfL3WI2L1QChJoIi3P+h9BuQkJdLeGSeps8KGJmH8S9f1olzJXcklhAqY68?=
 =?us-ascii?Q?06FvB+rhSklubT69Yoai3+6Alx5lmUXDUzl2bW3PL/zgs9sXbof+PmgtbsK9?=
 =?us-ascii?Q?Sid3JiwAA213h3p3BTDygcDRm4hB+FuuSdvlU4kDPwns/o4KBYKSyS9ysH3G?=
 =?us-ascii?Q?9ZVsxkZcP//cBgCaIfrxgBPVCNZk2105Z0/0hpvE8bGOn3mYS4DDBcn3xubw?=
 =?us-ascii?Q?Hs6hCb7JRhxhOJyvOj5I9/PO31JlhnZiFsNyU7gvhPu82SsddZb6rfF1rlEd?=
 =?us-ascii?Q?iKL3RsDR4xsB4p6MO0zr6x5kjtrNiVqfDMmH+SXPpAagzXA4ZPuKZfVwFzeL?=
 =?us-ascii?Q?cYAsT7PkmIM3tS/HZ2fPvxCamMu4TvLigE7xZ55lqGjpjFqqVs5bcCancf4w?=
 =?us-ascii?Q?1K4WE2yDwgo1aJTDK1svnHGZPQlICbuA5gblc4Fx9vg7xuhqe7ezvlTQNqD6?=
 =?us-ascii?Q?Ufg0o7fNCyaUV/rzzCCUhEqDrTUA6AdC4OPRw5zNpfUDCZ2Cj68VhwC893Bs?=
 =?us-ascii?Q?Nd+brqwyihqcBxMDyv4bhNUgRJ2/jTP++0qdhwhG7l9PQNnw+QBkJQwIjZja?=
 =?us-ascii?Q?TfPLRzBIuT/B0bRvctmpj2sOW5/4rlIHh+XZz0kwxFhzhQ12PsGLl+gVt1si?=
 =?us-ascii?Q?E3AeWmuuMf+4CZi+8G4RaUHJlMWg5tLCJo16r060jyhH90JleKWLQ4iDfMGe?=
 =?us-ascii?Q?ro3caSq66f90zHZLZVT0Jl6Chyqf2/KM5MfzUT/KIyibzKB1y8jHHYxxv54O?=
 =?us-ascii?Q?tq+w7Yrjb0Px7KHieFAuKva+88GMavcgu1pWSnCyyUycwpE2ADYFPhSb4m1y?=
 =?us-ascii?Q?wvLmWMsdjWIjPB/YMUXpvF/aZIpkn3eicp4LvNZTKL8WhNPQNSxQ8ASGA+ob?=
 =?us-ascii?Q?v41ckeCa1UwcP0VMilvcib4u2A2GKLWD+WBWf+IglZbfowjX2Jnl1D+VTuIU?=
 =?us-ascii?Q?D6PFv7LUff0MM8Lf1tbIcw3BLZS2cFlKXRYRBs8+XzZQp5u7W+KGCF/ck4zl?=
 =?us-ascii?Q?k7IZCcrGOTcTg2RSzGOQf9bAVlkyHUnqMYCZnCVvwbdgGQp3jONiK8ckoZAt?=
 =?us-ascii?Q?ZwiMrC4tr0OCzG4isfnxvNMFjT8k11NviZNIRwFvzhkk+HA43K+/JaIa1kKV?=
 =?us-ascii?Q?x4eRh3G/G14U6zoPFf6oR6kvWYzxr6AyMiV+18+A9tUPn1D3+1wSOXb0Lw80?=
 =?us-ascii?Q?RvfKn7e7DZZIR3jD7LE1hFBfHf/qxj6vGvAP0Td+5sgvLH0SuiJ9oLwcABtw?=
 =?us-ascii?Q?2vVKF0BlcK3teNzgh273uAHG7tSNnVfYiyrXcVVtoMJpDXTuN6D+l71OB82J?=
 =?us-ascii?Q?AWV+ckyBM8ZD90Q9GGgAQ+TJoQ24VChY/I6fbUNlVmiDK3ECVsqICfqhwkta?=
 =?us-ascii?Q?+lGoRtIBWuKoZ6KkUWoSFICaBt+LNFKkQEIXv9Se6ZZDD0emY79VG7H6rg/Z?=
 =?us-ascii?Q?iPtojAcnJDn6I1i2q7nb4JPFl1lUFHP4DnK+UEwCOILd5vuEqseUI3yapA6b?=
 =?us-ascii?Q?122cZomRHP7KmYl98vuxgSa6R5IF/VptOTB3hah93opUJOJ2vHg4m1gxpCfL?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pp6wDhLjT51Vi0svngjnrPQEroRgvx+NBVuYQ9TsP7oCN4sekZXhWNKhQXEe873EdoBmX9DA+Cl3wrHdJRJvdznC9RBose+zULAbio1zwuXKkMnKrj4kBrfpYj2MC3VyBFDqjuWucNfeLVISBIlDyRvlMxwbDLpIFdikamcqiX5iVD5Dc79k5XMBlr9Ae/4Pc86ivtOj38T6jz6WIwV27E7EY1SPM77RqF4O3raUhGem3kcs6eh6qgwVCQPqi6vORDlA3jblinCIiBnf1GOl43ElpFyf9g4gRWoXCQuVz+U4JI7UIkoPOvPdLuJvaUMh30HX7RsW76yd07j8ivGDxTmT/PBMGhWU45KvCE+yZ9DAosg+eFWqiYPYqe98iWpLz4wP5IAWyE3AXZQo+8yYmGVIdMcrLDga2piEGIlJi9PSUWVxCcQN7UxQugPSzzkGABHvh9iVL2fbpTOir9VHkSx7nl80c81/T9nuLiKkDKOLh1JX7lcHZkw9hNQ1uiUJyBkHylPpVcgSnpPxqVhYK/vn+ye3uBh+Q/7quRNW9TTU6HdGbMq/TOiLzoRyIlbwE18xM+qU4L4Om3B//SvnFMzEkz49wNfwL6wkhA+u20c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4e8c76-e6eb-4a8d-ccc8-08ddb2772857
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:58:20.5112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h3grPy8OcCXY+u3Pf2SYmc2cAkPuGBvFCBSObPUE+VJApdqF056vYpQanBlFe0bLlyx8gYBUEp2Lq2RGjOxVX1G25rgnsBUZ//Z+mDrmKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5666
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230103
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685987b5 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=BKV_Ns9na6QIWCWb0d4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: AuQN1FZq6-5w5WcbVgo0__TZb6s4Z998
X-Proofpoint-GUID: AuQN1FZq6-5w5WcbVgo0__TZb6s4Z998
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwMyBTYWx0ZWRfX53WhckY48tRN XXKY1ltHCMJ+IdgRHbqQzaBJDA2pCKYkCOr1lD+CdTHStN/MdGrZ0oxPaJA9ROoi03nL9GoaJYK bnCPvKb6c/1KVQX9IFRed+ugDAqYFzd55ig/d92W+ALGzdeQmFhXwpoHayiWoAwL+E18vP9b/Xc
 2HtmUmvJBkLdDhdlr+bhv1T7lU+umJIHqBX8YApuG1eGFEcxHzz6BRCpyEHF8PYlTBXeOE0w4dM 7xig6OU8f2wV5nFLNNd+jHq00VtAV22y9Ji73c/Dc5h9reHsi0otbuyFtvsChPUrHXphAswc4SX Bb3ssqfPSSPMT00RnRXMCw8pEFsOwWKo7iNX5fwSrHk7CBdA5hpUz1XRBbB6K8wpInQwLfMxFmz
 pTWQB6RSZSettRZFyZX1nGQky2kd9xEfmn6RNPtN8Avp5rH/MTOZLMhDcNN0fQ1qenob4cRe

On Mon, Jun 23, 2025 at 09:47:49AM -0700, Suren Baghdasaryan wrote:
> > -static int prctl_set_vma(unsigned long opt, unsigned long addr,
> > -                        unsigned long size, unsigned long arg)
> > -{
> > -       struct mm_struct *mm = current->mm;
> > -       const char __user *uname;
> > -       struct anon_vma_name *anon_name = NULL;
> > -       int error;
> > -
> > -       switch (opt) {
> > -       case PR_SET_VMA_ANON_NAME:
> > -               uname = (const char __user *)arg;
>
> My issue with this refactoring is that prctl_set_vma() might grow some
> other opt which does not belong in madvise.c. Moving it into vma.c
> seems a bit more appropriate IMHO.

And this itself is an argument against the horror show that is prctl()...! :)

Anyway we'd have to find a way to abstract past this, since vma.c is
inaccessible to anything outside of mm.

This is part of the reason I so _hate_ prctl() - we do mm stuff there, in a
place that shouldn't...

I'll reply to patch directly as I have thoughts here though
