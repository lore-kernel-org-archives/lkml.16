Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5CC27605F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528298; cv=fail; b=VZkURXi5CPT6/p5bd/em0xsNTBCb1u3PtIF/BuHjGYitttr9IDHHbAIU0iCuXq8ItzU7JxRyA0U6KYhWO5JkCns6rXKxVFr2wNT0oiy2lvmRxS3z3xWt92AToALtJRZq3rLpaU8Tj3aKN1Ufh0Odr4dVL5fRzIdDqBA40IwKAAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528298; c=relaxed/simple;
	bh=WPDmT5vVhbKn8k/+fAqMY8c5xUDYJmx8UR7OZq+Qino=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fKw28vy3hZQn9/5+v2zzbNW7T/aH2oI7kxs/SIXeEQ+MAP9F3XK27iY0S3i1Bs0C9C6Ncccqfk1Rx7GOZBP6nlMnfO8kMnLYq+YxJW5XnkGey2f5XH1mWm2uBEateDYW1AWcrck9cFfUpmGBoRlyBJbUX+zIASf3tPCsAEV34lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=px+LMyig; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UJ/3qxse; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="px+LMyig";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UJ/3qxse"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AWMwj021944;
	Tue, 6 May 2025 10:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=w9vkZyVcCj0xX+Olzs
	X6uOn0JPZ7h+1Fq4yq3uhW0ZE=; b=px+LMyig7xY/ADFDVXitD0Za2dYW/DTt9T
	djXHEB7Ao/SNCfp9LQi8JFyi8mHxUjpM68sQdbVuVaI4QgSItka1oWq2kMiEAKcw
	WC2as9oQI39ihVXfHv6EifPhCeuxi1BVxx+F/biox39l1Yx4sik3xpxYL7rWcW5Q
	up9v1hiCybg1Jjbn2maofZutHy7/ajItie3UardNFdwKbIxJ8ujuoF8RO3iJDR7g
	ulC2Ey790iygwiWPork9eNaa/JR+EVVMsUbGV9tG/MAX+EMUOffiAcE5rBXR0tAw
	S47g1UKSTu0s3z//Jgkeb0wdOXDmGTemMO/M2qPj/tzrbwwBJ0mQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fgrmr0jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 10:44:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5469ua6g011253;
	Tue, 6 May 2025 10:44:08 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012053.outbound.protection.outlook.com [40.93.20.53])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kf365r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 10:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6M5ciC0B+9oNLqxXXhNb3ekWWOEg85X5xRk8c2ph0lgopfnx+AVciGkpB/IVYPYUPn/EIyAhvLWrrpr4KfMi9Yx6mR3OPP4Lwzvpp8XnGfpd2pXhLuu3+cOCUKrR1BH//soRUdhwSdto8Zh54DOHm2Ei2uDVF9nriNvqzdBuGHs2I0LKyCPYCp6aoiJXOFOHGI5zWiDq76KWlFcdRGwctpYt/xPSi6SNNSO4aGXTO8ABrNDVnBJTRXv8cwyyt2SlLTvrWkI9Lod1GLcb92l3BclZCqDcY2jVBDOECKQWFQr8GhOyfu1HGREW1kmodrQuf8n7FhKRgz41l8dSBJIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9vkZyVcCj0xX+OlzsX6uOn0JPZ7h+1Fq4yq3uhW0ZE=;
 b=y7ndez+IyrrVaKVs2J0V3vQ8YzQTfb2AnwSamt6p/4Ei0JYMoQ+Ydm/l5V+uV4X3u3zxIU2NhacMoYbBm0lZpL9FwgbSBR44c+A0xqkOX1abWRdwhCxvvKPr7S7GmPecaVEKo5e6RK57HnCOO/nm/20Mh2d+Rk9jtnkLzl5eFlRDMLzQ3DyYqvGRACIsTKdr+i6+sY15cyU5Dit0efvoMpGWQj0eu38X+Vek5f02wyJIxAq3V+0gExn6esbMK0Meq8DOiJqHOCJm0fofZOFMybxcx+gWrPx+aOVn5WdyvNEOdgLdriJ6OMOhXz+Mt5+S4TlxhR4cOzBJSf1CccfnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9vkZyVcCj0xX+OlzsX6uOn0JPZ7h+1Fq4yq3uhW0ZE=;
 b=UJ/3qxse8y9Tf5CuW7VnuC1r6gawbyHgYaFjXtSvqk0BcxfDBfNS2lOSIJV+wwtH3JvexTMbiaAz7JVOd70fJ+9e8SB7MO6ikdDWKWkx055/Y+/Q/EI5ImSI87xPZcNxde/fbnIw2I6Keg8El2Lp/Wpq3mplPHXU3QtnL+FSwLE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6954.namprd10.prod.outlook.com (2603:10b6:806:34f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 10:44:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 10:44:05 +0000
Date: Tue, 6 May 2025 11:44:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com,
        mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
        zhengqi.arch@bytedance.com, baohua@kernel.org, willy@infradead.org,
        ioworker0@gmail.com, yang@os.amperecomputing.com
Subject: Re: [PATCH 0/3] Optimize mremap() by PTE-batching
Message-ID: <4210a878-7dce-40c2-bd0b-0c2e39cdd80e@lucifer.local>
References: <20250506050056.59250-1-dev.jain@arm.com>
 <b26480a7-ea81-408a-b287-7cd52571a1d0@arm.com>
 <c7c75d9d-4d5b-4bfe-b69e-dedb4b0d73fb@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7c75d9d-4d5b-4bfe-b69e-dedb4b0d73fb@arm.com>
X-ClientProxiedBy: LO4P123CA0513.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c225702-e3bf-4c01-46b8-08dd8c8aec0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?llRRBwn7zJ5j/cYap4a6eWdjI2pyIA2d72uf8dabvJASz6aDLTV7utsi6NpL?=
 =?us-ascii?Q?WKv3+XuPTGOnNTPjHD0MaITjSLATtZc/oJ+t31gb45F9u/dwN0K+Mm3Br8mO?=
 =?us-ascii?Q?6wLTRYRfcSFWYlLwJUsSDtSW/XQI51T1SG6dfADfEkeKKiVS1oIOFvsQjbJz?=
 =?us-ascii?Q?8hZBJ5EhiCFTUgd1gUB5bZT/TFMfAecPYcpfnzohbtV2h20piSKms4nYu1YM?=
 =?us-ascii?Q?Yerx4gTWDVbqhxJrGxrLGmMypA2n2YFYd1IDY3fptEeJNA/iGuf3rOQ83MA7?=
 =?us-ascii?Q?wn4KOdP+jlG7tK/ZYP/YJEsthVo0PQ0zI4zPnsj2P/nvIWEfJTNG5TOc5/UM?=
 =?us-ascii?Q?X/csJLXMRJ3WG6IeZygIF40yPAVXU0IDV3fv6vrBZRHaHBv2Q4jb7PTygaOU?=
 =?us-ascii?Q?bKr2b9qpadML5n7boLKuGAc1MraXCgwGSgVzyz/ovqbgvXRAhcOb7yP01VgL?=
 =?us-ascii?Q?OvZsJ+vL1PWFn9Flve6Gcx9ipm6zZ+ZBB6j0dNviN/CfNf5Pad7gAFKlc56B?=
 =?us-ascii?Q?yrt1g5KIOMGY+/SdCCLhM20vVFcgPL8Mq5qF6L9dsSa6cucZViQH4xpvsK6z?=
 =?us-ascii?Q?ZYuLqSA4ZEBwqWDPjMB6bvoVcBmS4ZbstQbd7gAU7Wj/QX7mz94u6R3baJrR?=
 =?us-ascii?Q?C9U7xaPZmfAhlHgVD04pzSX5+ePAuGn16gojbasYVnAAxC6KVmeCqt1XmrlI?=
 =?us-ascii?Q?44A+bmwIGgL2BJiCMYGGG9Ul/+7xBlJmj6J5ALWD4ipzRvan82w5v3WgyobZ?=
 =?us-ascii?Q?PiedzII+ODXhypA+EsbYfN6t8EVU4YoUi6cOd4kJHw6qmKLISI3KaGAmmdVo?=
 =?us-ascii?Q?KMcD3joblw1qNSj52N7QSGGyqw30l/23VaEQU2X9G+d4QLyX/nKUXL+sa9zh?=
 =?us-ascii?Q?m9FFNTaowJgBegxhW3z+f7ar9N3YHUKhg2wkOKyDm5E8ZGzTMk4zD5BMvTtZ?=
 =?us-ascii?Q?vYl/3O1Ma63qEl0jKULjvZnmpp5HGDXspAd25z6KznasiKHK0KKTPFzfvjbV?=
 =?us-ascii?Q?6mDXzRZbwnos02G8yGwZcK9qYgu4r6MtMQO/aLHAO/TlJCAPSQxW+qXsSw5Z?=
 =?us-ascii?Q?xD5DAPtW7syiAkK93M6HVs2p12kia4q1W304Hk0WXzf3tAa0D1LX2dbFBmtJ?=
 =?us-ascii?Q?np1tZvWktM4nphTDAgUegkMXWnbEk2ppV4X7pIKaBBza2tF5I2KtPaGE1Q2c?=
 =?us-ascii?Q?ohAv+2qGFB3aVD3LTvh0OC0n7ylsgj0QezsgC/HVy5N9j4wtYh/36NBkJemo?=
 =?us-ascii?Q?fO1PwTPlGtu27T3pvgUV4lk49rHFnj2jPisixPzMr69nbMx1kAB+Kriez+i1?=
 =?us-ascii?Q?Tq76RrkurLTnoXtV2SCU5F7K5J5oVWnVNQo0wf42gsp7FoMj1/9Xr4Sd5nGZ?=
 =?us-ascii?Q?ST2H9f7d4JgAxXAo8q3d2qHvHe11gb0kpi7Vb7lIQb21JRR6Sq2yEoefHIiz?=
 =?us-ascii?Q?90cg/K7iroM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sBPylzLuJ3iHrZWqkAb+Ntk3u0saqQcNuF0vxJbPgteFOHueR++16kI5Iy4N?=
 =?us-ascii?Q?mkMkO7RLT5HehpnmvMRSbt3r/+zpNCPvdapVLtncpLbKouB41Ma9sAC0/i9c?=
 =?us-ascii?Q?wbbhDhMIKgaZI/Gy3m4fgZzk/8dnY8B2SgAS9zPoF5iIM7EE+DXFse3Y0Jsx?=
 =?us-ascii?Q?TcQyiq91mDgOwMRzpFD/d4DQX1oEToLQjuTI5Ml0AjSN0z4UPsor9NFiFqlq?=
 =?us-ascii?Q?WqigI7jdpX5pUTPR+wknBYE5NmAV1QUR9+h+1Ju8S7qHGlJbVKoO36O7z6ky?=
 =?us-ascii?Q?cEM/qH0H1JmDOCnk1fTMTr7YEpnEOUS+Zg2AFPWsGgNg7ut2t9r2T+pJopgQ?=
 =?us-ascii?Q?1ivz2uoGWWHCXgN1x5+LToPVgTdsGUKFZ/N3riJhaCvmMksTKvbyasALx9hx?=
 =?us-ascii?Q?ocbyWAoEMf1BviaKJ0G+cpUSzPNe7+6ECf7fiRivA1GeIR/pholxkiAFy7eL?=
 =?us-ascii?Q?RBaBjPFrCk8ltJSPWHmdVqb43vlEi0/jTVTqjYwWZhWT+3S17AmQaXKFgzCV?=
 =?us-ascii?Q?FGp3TLLubKnTHxLPvNnQ4lxarHkwZOHioqYz1SD+9eXTaNj4bW4rf2Mw2rt4?=
 =?us-ascii?Q?FN976BbsbLkb4B3EpONQUV3o3/Igk6Zi2Q1VoAr6ui+ji7uR6PT/0x0Wc1OC?=
 =?us-ascii?Q?KwqHfLyBlMmwnsEsiA9y8J9Fb0BzNTRGTfAHsdTd3HjVDiBEDYi++adNSrPH?=
 =?us-ascii?Q?vJvBy5HnW4h3oZcY45PBXblcdUEr3Nujh7tgumWHKdED4dLH/c4UTz2Egrc7?=
 =?us-ascii?Q?sOb6IwrXp/5s5anPAbcVNkOFEp4Pr4nYpV6ON+2j8TMPJKiMqMaDpbRiq+pR?=
 =?us-ascii?Q?3UyqZCL9qLKN/iILBp37NnGHpRq/l8wV0UGOJtiMOp/As/EYHTrE3rWEcOKu?=
 =?us-ascii?Q?Aae14H6WeOckpPkm3uiA4MnEmJS1+viFlpan7MVZ+jYBu5fcEC+Km0VQOZCt?=
 =?us-ascii?Q?WkV6OR0Odl7M328RmLFl0FeoqWSAiAWLJ2DyBhedEqLvXuZ+14nFQzT85uBj?=
 =?us-ascii?Q?HmzW9MP1BUVua9RomDCo2EcdfVmaTOu6Pwmw6jnqw3SpH5SKUR1jceaMUULl?=
 =?us-ascii?Q?w4RYx6g9h8uIQ9LqpW25FO6dJ45dUfy1vgx75ohqSb3GjSWpSo+ZOd4p/8p1?=
 =?us-ascii?Q?YoJcOcaLivKr3Ve4DdTNd5V2PKhw48May6DYPV82BVkcHVKkz8+1OnV83tGe?=
 =?us-ascii?Q?4hJuT+od1F0F5+IuWHxbMZ6Kj+bOibiEEYCuz0A/FAt2/S++eQgPpOCsHsxW?=
 =?us-ascii?Q?q6U09qmIyMPFJCZFe9KHvwKaK6r4B5JVt6dx4vrDx9z4Fud+VtkQBE6jiZn3?=
 =?us-ascii?Q?NQVDQpV6fcfUyCUHkPrm/Hgk/sPPIPdFMMBMtJ+FA4mTLu+pIhxtsdO4ViDc?=
 =?us-ascii?Q?AwZ2rIst+qZgfe/G9aQkPUvPxZY3cOiDlDC7xlJbIgfj+YtXQndkGDKcLDbp?=
 =?us-ascii?Q?aOb5nYWl7Q/q/yo+JZzF2JbUibPLL6wYkTfrYp0dGS1/5XpkThyzuAqHW9N7?=
 =?us-ascii?Q?C6E0LNbAkcj4EAggFxKeN4U2f9zJSxzELVqX8uXRu/WJijeC5HdgeNOzdI+i?=
 =?us-ascii?Q?2odmYebvriOt4NpfEExWn5vh80HIMijrO/dzp9LxF1XsV2LRnACU4rGQrI5P?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8jZGXjF669VqEFJwvlX8v/lXO5yQGT1Sc1P8iM8YCfwJ6A+NqorUGzU6susexp551ZgGemuGnYvQvEtX/iGBlAMbr3vJ3TfD4rW5mJ+qdxa+7KfRIn+93QlpBQqd2+Dz1Xs1el6Nt6KYG6ZXWsCfuCkIh0IUCmOuW60QgMiJinMKoOkBKQaHrZtvCGx9pB81Z1hrbBvqmz4l5gNFe3PUHEVtBzbmNIZelcq7aZ2/91VGkoizVDg/bcMwrlUtNsBYGTWvwLncSHxH04jbClHHkQs/2DhRMXJIwR/Uy0nHY3um94+jmbxxxDidYEaP7GFB/LTp5e1MFvZmR4IvkAc2P3ERqV7jcOHnJQV2T8v3eE0GNcR2M9qviBeRUEd27qR/eDcumDDIlNCHS3C5bawK+QNKmff8Y0XKd5UX+RpzD8csQFsawLP5fhuDKCapJ//Gjv/RGfUUGN7wfJ6UzO6XiMVU1YP72A/dV3AioGcujhKv+z9yVOxFCN6P6v+uNNvWKNzGAf7DUN7tVa1HK7gphbA0cwzI75F30+JBSHcl/U+ZVeJSO8eMGcrPb9x/dXbIJHgNSH/Y62xp9HoGDdV97FBRfKyqWEsyBgaRvC3u5oI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c225702-e3bf-4c01-46b8-08dd8c8aec0a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:44:05.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Acu6eFMI7PwigIGysd9OJ27JLg7db5RUUiGZcEmR8eCGXEZtqmN01HP6dMmSEjx90b0QDDBk2ZblsoVxonU4+3m2rB7tmdIEwRPMwDafu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6954
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=935 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060103
X-Authority-Analysis: v=2.4 cv=XvP6OUF9 c=1 sm=1 tr=0 ts=6819e7f8 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=QdgqI_opIRazmKcgweUA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14638
X-Proofpoint-GUID: zXKMq_yLW4bWjstL1pLtL9dxdyJFku_D
X-Proofpoint-ORIG-GUID: zXKMq_yLW4bWjstL1pLtL9dxdyJFku_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwMiBTYWx0ZWRfXz4IdaktvXq84 q870mY3CdXBfZGF11kLGImA6DoEwhNSRwKH/2BTwgz1krid82oagtbC58QysKFHx683PjW0hxaW d7ii3SVkHullnOKIP7hbKGvTwOt1Dtw9wvftOlxlXgFlWFzvKLNp+ocXufld9kH0YBk2ODzEm6r
 K0QCHBPmu+WBQ9wAdB+EU1fZCOo3vXJKkKOTy1eEI0b/WmSMhmWoVJGRAdLPOIO1a0J47VXMMok G1DkJ4yV5RO/EICk8adpl+2AkBy91zOAxZyTjpPvceOWSP+5jeHRTqv2h/qsfFmdSAD5iKX03g8 a5mUwfm2fr1QG6mXAA1WIZcvsU0M7H1obIp7XxtKeZ8F/PkZPeedujJAQeIvYqVbdSxVTAGJELq
 NVjAKh9ggAXhGWgpeVejuZfMCRpp7t677z9OpDvVYwq+nPciCQ+tuRe6k45HbVn7eOxrPJHs

On Tue, May 06, 2025 at 03:52:39PM +0530, Dev Jain wrote:
>
>
> On 06/05/25 2:46 pm, Anshuman Khandual wrote:
> > On 5/6/25 10:30, Dev Jain wrote:
> > > Use PTE batching to optimize mremap().
> > >
> > > Mapping 512K of memory, memsetting it, remapping it to src + 512K, and
> > > munmapping it 10,000 times, the average execution time reduces from 1.9 to
> > > 1.2 seconds, giving a 37% performance optimization. (Apple M3)
> >
> > That's impressive improvement. But could you please re-organize the test
> > description into a pseudo code format or better provide the test program
> > itself (which should be compact anyways) just to be more clear about the
> > scenario where this helps.
>
> Sure.

I echo Ashuman's comment, definitely would like to see that.

And wrt to perf improvement, whether it's a microbenchmark or not, that's a
great result so well done :) I echo this also!

However, it'd be good to see some more detail here also, you're kind of missing
out - everything - about why this improvement happens - what the intent of the
series is, anything about large folios, under what circumstances you'll see an
improvement, etc. etc.

While this might duplicate comments you've made elsewhere, it's mandatory for a
series, and Andrew is unlikely to take this without it.

In mm we place the contents of the cover letter in the first commit in the
series, so it gets stored for posterity also!

Cheers, Lorenzo

>
> >
> > >
> > > Dev Jain (3):
> > >    mm: Call pointers to ptes as ptep
> > >    mm: Add generic helper to hint a large folio
> > >    mm: Optimize mremap() by PTE batching
> > >
> > >   include/linux/pgtable.h | 16 +++++++++++++++
> > >   mm/mremap.c             | 44 +++++++++++++++++++++++++++--------------
> > >   2 files changed, 45 insertions(+), 15 deletions(-)
> > >
>
