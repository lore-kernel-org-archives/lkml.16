Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A298D20EB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558143; cv=fail; b=YEE5agdln1B0f68jkjZoRGXIsrd24UzIAFkseTAYP6wXYI+lzMbX+5swBuW8D3W6SeHqB2TW73Vtvj0mTLzKciInodTQYftVJFhKI/GPHF3W7+SnS28MMBpsjD7e4dCVrT1ATLFlI9ONIEirZpCWqPnor6yw2YnnINE/5r88UhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558143; c=relaxed/simple;
	bh=/vOSpnOwHKA7I9KeM4dSaT6qRANNiSWSCtF10jDV2Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WtHWW8/suEFJl82ApQ+ZaA0M4y7Ady7afsW8X6A7T+XOVhTtyRvh++f8/x0M0GIqvw9dcBdsN6j9iEhMlOI2UgRyPTf1iSvYMfCXYYxP/hz9gtg/4R3Ip9Gf67fe/zGaZ3BpfOcYT3bhy/RMWK0dDGLjklc+QFtlN1vv1e/XMO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S9jn2sPa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h1oqzomZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S9jn2sPa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h1oqzomZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ4EA031141;
	Thu, 3 Jul 2025 15:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=G8o0aSCnN6478Bl7ho
	ZQMe9afpEtGxP5prWby5ErWvs=; b=S9jn2sPadWEc9TFMyJ/TG37SJ2OVfiP7aY
	aOTl3F42TwrQxrGiSX2+Z5RAy7+6NvNQdm/tAjFilpw86eiicAL4KOazy/5C0liV
	Psp1oM5dwjEvyUQQ1cZsQ3gENtKYqzRXylbXNcjL/cM2lV1BzRqdIrhN2ORbLgl0
	e5JuhCF1S8+ejI6bkmxZW1anEBwc2b+Ixu5Ir616Pb9Df7Cn44lZ14ebmmvPzNdR
	S3zgvkX/Pet6N/PlRfYYmq5rw1W6emHtDAkstXHTin7oGjz64NJft95QQyTIDnZm
	KCXcUAM4AaKxh6fVDUpSMXMUIoY2k3NdvRrcajBh+IcUn+DQjCsA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af9acy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 15:55:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FKS9t024808;
	Thu, 3 Jul 2025 15:55:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucvas6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 15:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAJ1x9WEAEpfPqBrwaUvuiykfL4kQ+MW7hT9x1ckFMYT2oyUtMni5hDJQjyHBYazyref2lIgyWRavn3mk8kDCUSXd3tpPHSG3bBPDwWZett4Yym2CUSTNRl/FhTTfJPkvMlZfGb4W5qQWeDTRmpruuLti8gePDUataxPC30X7IYerFkOaCSSlPDOaYq8Cslfpy+B76k3fFy6QJ1vVoZe2B2ALyjnIGzdDIJZJdXTv6IHG+/vtmppnAZPKebIV6snHAYL5d1WpEJc7CYLPmwLfovRu0yfgAVH2E2BCAhPvT9xxTEDTIKMLAMHSSUC0MuA+/T1ONEeeGOJWp0ojJQqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8o0aSCnN6478Bl7hoZQMe9afpEtGxP5prWby5ErWvs=;
 b=ylS5WWZNAIq17SehBtNGIGwDYKWFWGXBFoFq4KvAtnwyW3vrsyQxiMdpM9ISiSGkMA2rSQzYbeL3J6oVgMkRj3mPuT8C+bDOBSDCmDvySJrRtWihHEByqh0SoNrpSD6uEb4L4HQs2nBA6nmv7aVyLWmI96sqTUE76r0arzn160Lu4iaXlqRa+Gs+aVCMyI5GsD1dDeIE0cx0hE3xyt/hDsSOZsHNg1zQebiagIqTgtQCLH8z0gTU63Vy8cB88jWSvG00pviOUWMsNVDLLx0aGMjvTOso+nmLeXUzkiTSZrhT4VZNSmK29J3CH81qmkGSvKQt7qJdCNHx/jYhsnXHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8o0aSCnN6478Bl7hoZQMe9afpEtGxP5prWby5ErWvs=;
 b=h1oqzomZo8FKn9enHF6offoCjf9TP3yrLiKObVyz6kDbtdyJEZSU2tzQiRi0cgNMGFoEu6hU3x0BUbOvKVkJ5/OqN42bLda79QC+0g9pZxIucBNhmoIvkSwhXexO/lDJZSsif+9DH1O987HwMD+t2SV4QwypOLw/3TftFHYQ+eE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5789.namprd10.prod.outlook.com (2603:10b6:303:140::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 15:55:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 15:55:05 +0000
Date: Thu, 3 Jul 2025 16:55:01 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 0/4] mm/userfaultfd: modulize memory types
Message-ID: <54bb09fc-144b-4d61-8bc2-1eca4d278382@lucifer.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <92265a41-7e32-430c-8ab2-4e7680609624@lucifer.local>
 <aGWYT4vFk2pyVwtv@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGWYT4vFk2pyVwtv@x1.local>
X-ClientProxiedBy: LO2P265CA0290.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d16f133-22e0-42e4-a25a-08ddba49fa4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gcDFCc5M4VXhMWs/808S85KLMt8Df20qxk+VfuqhncfLP5jc1vK7SEvAhN1s?=
 =?us-ascii?Q?SY2JbzGx+Wm5jAzQkv8+xMdufGWpH3sQ/jd4QdjPTSpRAnmxhGFOUmGVhYq/?=
 =?us-ascii?Q?yT4M/KFaKy9ArLf856ruG6hmLReUEU9bnOStc7iCyoDuvpTeRkuBUo0IThTM?=
 =?us-ascii?Q?EJcJ3p+Sr9ExmyrDouzqd1eYOquNnn0kTBF9E8OyJWElo5CadF0I5be303r8?=
 =?us-ascii?Q?iJHxOBHszrDcXQXXayKvnYwgaetbCsczfq8GmRcIWv/XtxWQcbv5pSxRKU7q?=
 =?us-ascii?Q?sWYNF2UAorGbO//DkhN7aCIKVV7CRyu97xI+6ujoP+Ar8sM+q/ohiSOyOVsv?=
 =?us-ascii?Q?XU60sH7yrSvxtn6U2RpPg7aIKagTMZxqRb70DaVFpYBunlkTLqKnx/L2Jo+8?=
 =?us-ascii?Q?CwcOn46vBszkMLJbnF+T0RYT3A0Tekc4+4REKIqkMaEb0xZyqIWsE+H2gC6T?=
 =?us-ascii?Q?YCjVnerVjK3BXa6HYyv9WZ6bo0HitOfbFKytllO7WlaSfw14dLXFCn9B1dSB?=
 =?us-ascii?Q?1qu1s3arC+ZiPPAli0GSfUJ/N26km7EpJBP+AnWOKS4I8qf5RuqFeRUOju8F?=
 =?us-ascii?Q?Gj6hoK2VWl2808hDTifrQrtcO9f3h5v8lBdZWKKzqeC3r3CFsvABgkrCLT/H?=
 =?us-ascii?Q?5Wyyd0BNcl0J/L7wQHQHGjyO6sK4/wSb1bWhS4RBfKa8tOGm07UHvrKxUbX7?=
 =?us-ascii?Q?GGK3phyYilLM6uY/Y1HQOE3jiOj902evc29yxzdqh+3fpMEKo6wkP2ESSDsR?=
 =?us-ascii?Q?C69M6ZBdNs3XdDFnT1wiDas8GnNKU/QGF+RPRpy2AKqNqN0jkGDvrt2TmhcU?=
 =?us-ascii?Q?WhQgfltdgR3OYbyKE5zbffU2oBsANt1y2Y4cKuZH1Twqa2bEaKj4GZd7WP0p?=
 =?us-ascii?Q?xxqsS7QIk3GEuSt9Z/S28UQwrioZhvgTZ568u47baG9CFoPs9wEqFAoo5VI9?=
 =?us-ascii?Q?L6j7pcxfvSy3MTwHYt6sh+o62kWKyhKtJfR+qQSLCTlvyiNrJxsaB+RN8F9M?=
 =?us-ascii?Q?7Dy1BmGBOuhHDwNb6hFhPF+lnzSW61gIAfVLOQWUTCCX80m5bWs9DMmNqLZ0?=
 =?us-ascii?Q?fiYObcemcF7QiGrfSFb2AQEMo85M7CjzyRtifOib4aQ1FgLnTChTT6nTuaNI?=
 =?us-ascii?Q?mtXX5yF8loufOVFkDvWejM3b7n/j1sXJm0BMk8lrF0TbgP6nuSc9xF8X899f?=
 =?us-ascii?Q?IwdwR0Y0Jk1fsaG/kG/3UJIAy7VjvCotn0Y46eqOyqDmS4IABd7So5GazlCI?=
 =?us-ascii?Q?vFEn6pxwZZX5zwqTx/Gzu12GdU1SX63x5gzqhP1v9u5UKfCMbLMvPyj5FeHi?=
 =?us-ascii?Q?bxPCl3SvpA7gXg89UGR8s+GGE6o6DhYc/wzTJ95nf7fynlKS22rj+Gj6p9mY?=
 =?us-ascii?Q?smWHeSWX3z2R9GRD0QaylJK00QPZBT893IRY2Z83FJMvbeXn4jkMGQDrWD97?=
 =?us-ascii?Q?7kxvKWX6arUnMjNSKUt6IVHw29WkUfkr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xG/Tq2cz2qYaXkMa098pqYbrcCwgA2/QMmRh1zoXptD8InGbczVZoDIDDOzb?=
 =?us-ascii?Q?tkXfP7k2UyuNzlBo1FUPMSJ9/SOrg1dKE3cFkLrSD+pG3HKJsevTDM6hO40r?=
 =?us-ascii?Q?4tyzcvAeh4LPM8/zxFwwkdfYSRbIms9LIdX5QqGaam1yE4EzQFTbQyBi1quC?=
 =?us-ascii?Q?ssdhx0C0wJH/BFRtiseHHd95DRZ75O3O6Y/n7+MJGl0uMy2v8MnfZKC/d1XO?=
 =?us-ascii?Q?pKoafWkfSrXxMU9sw7oErRzSfG+Lc4weCkzagUZVf6dTbP+c+YE7petmpslE?=
 =?us-ascii?Q?KVLyTPrx4fuyk1GVgn9sJifeTK3KX+dOkCuMHebbp2uw4BWJxs5+NcKRuYxj?=
 =?us-ascii?Q?xydmh1HQJB9KIunK4KYsAgShk/cH0qQS2rTFJhuhDWVBEWtVvspQCR5jB+7e?=
 =?us-ascii?Q?LNKwroZ78HEeu9fq3bsKAs/zZmS/GqZAA9orezUmfVePftqK3FxiV9mHoB8i?=
 =?us-ascii?Q?RN9U5PiYsOQ/th85/rwYVDNB+l9kFN+bf2159K7WK30uUd13MaL8lT7+f3fp?=
 =?us-ascii?Q?7+2zDOQAXyBvfEXICf6tGZeF+ELMd9BAWXZScaj4CyAjW9uq9n4g3ihCBOih?=
 =?us-ascii?Q?ECFkYE3rYX7BtuPO7lDarj+aRL3zQYYjRKRUID11tlDlcC13jMvZSyqG+Ofo?=
 =?us-ascii?Q?MTh7cDfXGvD0k64Fe11jnL/mUy8UtRvdD/EOHym2sAlTN1h+Ctdtob29MQBM?=
 =?us-ascii?Q?RhAO4WIE09cSj3ZNiteC1W84rAhGljisapvBW+bp/rIr+v9KooHflHVPTXSp?=
 =?us-ascii?Q?UWgwzKrpalOL4Oq2bJ1dCsaXacZTYxYUbY4KW8JxPaOaWwnjEnITU/054v+C?=
 =?us-ascii?Q?fPfK7uWSw/LcCExOobL8m/Ob5WuPu+QKVHoInSPBUO0wUyQYLpITWgvqP5Rq?=
 =?us-ascii?Q?OKkefi2EI+AXlScbYIQk4eyzSce9Mdmp8vTwmt5JryVZrSJ+Ly6V4sNGhKBV?=
 =?us-ascii?Q?queejF/Fg6OxjLfSLufhZg0BVEVLbAaGLNKx/VkC9bIc5hxuXNz/maZIS0Tr?=
 =?us-ascii?Q?TMpQaNf/5BZfH3dWx9F/yS5imMnm7LFFotbBzQE68Am5sDrK+VqBKHwE09zZ?=
 =?us-ascii?Q?3Nh0YY8N1KVRJ7F4fVazTLm1n2ajMoksHyJCt9XknT9k042uRQrV9LGRpWBe?=
 =?us-ascii?Q?DTKTOJw5ymLTc5lKH5uaR4WriI0fmJ6dohpnBWwiAqq1cCYvQhbT0tNw7B+I?=
 =?us-ascii?Q?d6WEjTe6dtQD0pB0Cj8wETnu2GGO5ViLmGAhfjPntD+PQ2rwlshPQfLi9S+d?=
 =?us-ascii?Q?hCd6GDArvWQEbsMzshi/vffBXY4UU/J9pdbel+rCfJEZR8weo2xhlap0I3sE?=
 =?us-ascii?Q?S+13hhQ15mxujMap7VtcOsBserSBfTOTd0yvyVagHc0Ab+ZY7LydVxUcrlPc?=
 =?us-ascii?Q?uzduGRGU3qLtewlvwaU5mD5BrsumPg89gHuIjn/EeraTfqFxS0lTWD81IQxC?=
 =?us-ascii?Q?ggfGStcc/2pF3L30/DRetZCfhgeMD/pMMvNrHKG4TzNzv4uWq7Psf4KTiFiE?=
 =?us-ascii?Q?dzp9H4TQYuN31TrqlGxTz97sxmmiiY3EPPLelBJ8/++1/129beH7/osFzi7u?=
 =?us-ascii?Q?Zrx+2zc9+w+LtsuVJZ8xsF6O3/4dxSeZ0eQPgUO+6dxC057WprN/V2bE2fMQ?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UZw7aKoDurSV9ufPMrTP70zHF+D7Tfy+d5nhhOTICAjHJyniYMci2qc1FQPoSkq+CbdCObmG0tIE5xk7Ruy/4cs3sSV/jZtVGZyAOftYah6RUB/HDIzpM4r/eK4aGxkTyrjJvhZOqWygEFqqMGlC3VEdsro7zsyQLi8q6fwD5WIpisEQfKnPt4tLCRcT7c0iheVmrVYjUFXo+ANWYOgnQUexfjEVbb4a6og/IZ1qbAN/5yf+AypHm3PEtixfDHyXFvT2rwUQxx+b03KC/sBZGf5nLxnjIDckKjbmE2x179r6zBHYZH299OJNhTAQjdgHPR5FLPDeUvpVCT4nQvZAHCQIAkorV0QK1TclvZJ3n74TArXiOZHiTdcvyVovP/1saacQJpHg1YjqdY799Ikn2ndafnC4J1ArPmj7a4IsX1OrWu2Q/Hdw7tK3P6POcWBGJazjjZ3+y7aNDFMXTVrVFCWNSF2RyZRHlB7hcQQ/9lE5LQi8EJFMAjrhwsd+jwhnmkICoyxfj2H6D16MNVOoMtth0X+pSm3nI/+/TwMRjTR6tf97BXBDfmxdCwlm6uzgRLGtZgIcT8ZpM1d+UXzeNGklSmtJOuc0yckBFBg0OjM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d16f133-22e0-42e4-a25a-08ddba49fa4d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:55:05.4283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Pbx2yfdkj8Xp8D40elsfhTkhtVUBACEW6zvYCeuv/65zmS5jN9yFQ52+3bK4YYWeaLS+LUS+6Scust/aFahev0/eVfefQacG5CFnzyLpCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5789
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030131
X-Proofpoint-ORIG-GUID: 26AoKqus8n0cXDxImcUHz1lV3t46h0M3
X-Proofpoint-GUID: 26AoKqus8n0cXDxImcUHz1lV3t46h0M3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEzMSBTYWx0ZWRfX61qog2cxZAsM /bL4aHEASgJurmYNidGNnVVPU04tJVDwS8yAb+coZooSohsAMUqufUgBf9fIS6Fb9vW31MF4104 e2pKdAQ+SW5uNPtgx6q8P0jH+/5RGwyTMrNNgGa+NfnjSShihRGEa6U4ayrSu2bCgSpzOAqBmVG
 8TyW5ok+aXYRqI18tIqvssel1u/xMlDih6qvMs61DJgu6xWKfWeVBXiNEfIbGk+esHwK8Gw9EEA iKFUHXqPVU/jmcS9m2LCS4efZ2Y3Wft6ag2kbJVB8o47iXwHaog7gtaAAHXwzlTbbF/SxdTRuIc oyXjE0L8+yGs6SVn/ygqnj8rj8QcvyIck/ZOv8ckjqG/d6Qf/0FVLaZeI//QNMZqWcbmR2ukX7E
 vUu1vg11LIt3/jq9rk3lG9lGuqNQled0Y5eGj799Xjj9wuXBN9t8+6S4BGV+/kxQ/tYs9yZa
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=6866a7de b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=vggBfdFIAAAA:8 a=ynZnjbMfqA4hRJymWuEA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13565

Peter you've ignored a large part of what I've said here, I'm not sure this is
productive.

On Wed, Jul 02, 2025 at 04:36:31PM -0400, Peter Xu wrote:
> On Mon, Jun 30, 2025 at 11:29:30AM +0100, Lorenzo Stoakes wrote:
> > On Fri, Jun 27, 2025 at 11:46:51AM -0400, Peter Xu wrote:
> > > [based on latest akpm/mm-new of June 27th, commit 9be7387ae43f]
> > >
> > > v2 changelog:
> > > - Patch 1
> > >   - update English in commit log [David]
> > >   - move vm_uffd_ops definition to userfaultfd_k.h [Mike]
> > > - Patch 4
> > >   - fix sparse warning on bitwise type conversions [syzbot]
> > >   - Commit message updates on explanation of vma_can_userfault check [James]
> > >
> > > v1: https://lore.kernel.org/r/20250620190342.1780170-1-peterx@redhat.com
> > >
> > > This series is an alternative proposal of what Nikita proposed here on the
> > > initial three patches:
> > >
> > >   https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
> > >
> > > This is not yet relevant to any guest-memfd support, but paving way for it.
> > > Here, the major goal is to make kernel modules be able to opt-in with any
> > > form of userfaultfd supports, like guest-memfd.  This alternative option
> > > should hopefully be cleaner, and avoid leaking userfault details into
> > > vm_ops.fault().
> > >
> > > It also means this series does not depend on anything.  It's a pure
> > > refactoring of userfaultfd internals to provide a generic API, so that
> > > other types of files, especially RAM based, can support userfaultfd without
> > > touching mm/ at all.
> >
> > I'm very concerned that this change will simply move core mm functionality out
> > of mm and into drivers where it can bitrot and cause subtle bugs?
> >
> > You're proposing providing stuff like page table state and asking for a folio
> > back from a driver etc.
> >
> > I absolutely am not in favour of us providing core mm internals like this to
> > drivers, and I don't want to see us having to EXPORT() mm internals just to make
> > module-ised uffd code work (I mean I just will flat out refuse to do that).
> >
> > I think we need to think _very_ carefully about how we do this.
> >
> > I also feel like this series is at a really basic level and you've not fully
> > determined what API calls you need.
>
> See:
>
> https://lore.kernel.org/all/aGWVIjmmsmskA4bp@x1.local/#t

OK so it seems the point you're making there is - there's a lot of complexity -
and you'd rather not think about it for now?

My concern is that in _actuality_ you'll need to do a _lot_ more and expose a
_lot_ more mm internals to achieve what you need to.

I am happy for the API to be internal-to-mm-only.

My concerns are really simple:

- exposing page table manipulation outside of mm is something I just cannot
  accept us doing for reasons I already mentioned and also Liam

- we should absolutely minimise how much we do expose

- we mustn't have hooks that don't allow us to make sensible decisions in core
  mm code.

I think overall I'm just not in favour of us having uffd functionality in
modules, I think it's an abstraction mismatch.

Now if you instead had something like:

enum uffd_minor_fault_handler_type {
	UFFD_MINOR_FAULT_DEFAULT_HANDLER,
	UFFD_MINOR_FAULT_FOO_HANDLER,
	UFFD_MINOR_FAULT_BAR_HANDLER,
	etc.
};

And the module could _choose_ which should be used then that's far far better.

Really - hermetically seal the sensitive parts but allow module choice.

You could find ways to do this in a more sophisticated way too by e.g. having a
driver callback that provides a config struct that sets things up.

If we're going 'simple first' and can 'change what we want' why not do it like
this to start?

>
> >
> > I agree that it's sensible to be incremental, but I feel like you sort of need
> > to somewhat prove the case that you can jump from 'incremental version where we
> > only support code in mm/' to supporting arbitrary file system code that might be
> > modules.
> >
> > Because otherwise you're basically _guessing_ that you can do this, possibly, in
> > the future and maybe it's just not the right approach but that's not clear yet?
>
> Did you follow up with the discussions in v1?  I copied you too.
>
> https://lore.kernel.org/r/114133f5-0282-463d-9d65-3143aa658806@amazon.com
>
> Would Nikita's work help here?  Could you explain what are you asking for
> to prove that this works for us?

Yeah thanks this seems like it actually implements useful functionality. The
point is the API seems currently to be a stub so doesn't really give us much to
go on as to what might ultimately be required.

You say yourself in the series that you'll likely need to expand things and you
already have todos to this effect.

>
> >
> > >
> > > To achieve it, this series introduced a file operation called vm_uffd_ops.
> > > The ops needs to be provided when a file type supports any of userfaultfd.
> > >
> > > With that, I moved both hugetlbfs and shmem over.
> >
> > Well as you say below hugetlbfs is sort of a stub implementation, I wonder
> > whether we'd need quite a bit more to make that work.
> >
> > One thing I'd _really_ like to avoid is us having to add a bunch of hook points
> > into core mm code just for uffd that then call out to some driver.
> >
> > We've encountered such a total nightmare with .mmap() for instance in the past
> > (including stuff that resulted in security issues) because we - simply cannot
> > assume anything - about what the hook implementor might do with the passed
> > parameters.
> >
> > This is really really problematic.
> >
> > I also absolutely hate the:
> >
> > if (uffd)
> > 	do_something_weird();
> >
> > Pattern, so hopefully this won't proliferate that.

^ you didn't respond to this.

> >
> > >
> > > Hugetlbfs is still very special that it will only use partial of the
> > > vm_uffd_ops API, due to similar reason why hugetlb_vm_op_fault() has a
> > > BUG() and so far hard-coded into core mm.  But this should still be better,
> > > because at least hugetlbfs is still always involved in feature probing
> > > (e.g. where it used to not support ZEROPAGE and we have a hard-coded line
> > > to fail that, and some more).  Meanwhile after this series, shmem will be
> > > completely converted to the new vm_uffd_ops API; the final vm_uffd_ops for
> > > shmem looks like this:
> > >
> > > static const vm_uffd_ops shmem_uffd_ops = {
> > > 	.uffd_features	= 	__VM_UFFD_FLAGS,
> > > 	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
> > > 				BIT(_UFFDIO_ZEROPAGE) |
> > > 				BIT(_UFFDIO_WRITEPROTECT) |
> > > 				BIT(_UFFDIO_CONTINUE) |
> > > 				BIT(_UFFDIO_POISON),
> > > 	.uffd_get_folio	=	shmem_uffd_get_folio,
> > > 	.uffd_copy	=	shmem_mfill_atomic_pte,
> > > };
> > >
> > > As I mentioned in one of my reply to Nikita, I don't like the current
> > > interface of uffd_copy(), but this will be the minimum change version of
> > > such API to support complete extrenal-module-ready userfaultfd.  Here, very
> > > minimal change will be needed from shmem side to support that.
> >
> > Right, maybe a better version of this interface might address some of my
> > concerns... :)
> >
> > >
> > > Meanwhile, the vm_uffd_ops is also not the only place one will need to
> > > provide to support userfaultfd.  Normally vm_ops.fault() will also need to
> > > be updated, but that's a generic function and it'll play together with the
> > > new vm_uffd_ops to make everything fly.
> > >
> > > No functional change expected at all after the whole series applied.  There
> > > might be some slightly stricter check on uffd ops here and there in the
> > > last patch, but that really shouldn't stand out anywhere to anyone.
> > >
> > > For testing: besides the cross-compilation tests, I did also try with
> > > uffd-stress in a VM to measure any perf difference before/after the change;
> > > The static call becomes a pointer now.  I really cannot measure anything
> > > different, which is more or less expected.
> > >
> > > Comments welcomed, thanks.
> > >
> > > Peter Xu (4):
> > >   mm: Introduce vm_uffd_ops API
> > >   mm/shmem: Support vm_uffd_ops API
> > >   mm/hugetlb: Support vm_uffd_ops API
> > >   mm: Apply vm_uffd_ops API to core mm
> > >
> > >  include/linux/mm.h            |   9 +++
> > >  include/linux/shmem_fs.h      |  14 -----
> > >  include/linux/userfaultfd_k.h |  98 +++++++++++++++++++----------
> > >  mm/hugetlb.c                  |  19 ++++++
> > >  mm/shmem.c                    |  28 ++++++++-
> > >  mm/userfaultfd.c              | 115 +++++++++++++++++++++++++---------
> > >  6 files changed, 207 insertions(+), 76 deletions(-)
> > >
> > > --
> > > 2.49.0
> > >
> >
> > Sorry to be critical, I just want to make sure we're not setting ourselves up
> > for trouble here.
> >
> > I _very much_ support efforts to make uffd more generalised, and ideally to find
> > a way to separate out shmem and hugetlbfs implementation bits, so I support the
> > intent _fully_.
> >
> > I just want to make sure we do it in a safe way :)
>
> Any explicit suggestions (besides objections)?

I gave some above.

I'm fundamentally opposed to us exposing page table manipulation or really any
state subject to sensitive locks to modules.

Cheers, Lorenzo
