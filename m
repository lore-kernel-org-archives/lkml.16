Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5302BAF9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051141; cv=fail; b=c0wq1dBMd0ld/d034W9vmfvmnArFOAXpB7ExWZkIDMTkl3MtzbDEeUdlf3zBOHY3Ojd/pHxanTyg0KKJ28ntxpfbAlWz97331ayAa6ADnW01Ts7SjBsxS6dmw0NLprP3/Cq91zG50wSB3kjOjmA8zfHKfqvlcgXH9ZvZZmHpNDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051141; c=relaxed/simple;
	bh=YZEkDi3YWORKQFIqyAsVi1fatPBWIyhlwNzoUd9MkHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uxuS+YNoOlpEJzk5VQUHumJ+7HAU2awP1RPuXIAXqeW3Bt6K33GdBqwExBQ84tHhK09Zsv81haHbiEv8vTTz6VwLGFcgotqksaD05NGV+rBtsYWV0BEi4tpqNlt+ehQ3/HH8pHbsAgIPmQF5kUzAmPiBgidNyqyTjudS/k6RE7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KdXsZZks; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DNElbQjg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KdXsZZks";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DNElbQjg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RHfXYX019109;
	Fri, 27 Jun 2025 19:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6NciOF1Q+euV+f9sqP
	Hhf00ObLImPKW9s2myCgraDBc=; b=KdXsZZkstg6Sm60U8Gvdb0TszPVH6If6XD
	UM0JpoMNSq25jsf3yvcQfBwa0u0I1WgJrrBIf3FR7SxNMaLgLdaW7QKP8jiiJO3C
	R76WbWfliwc/bz9m6yLiowkFk0z7e0GmDcU1G0HqzAJIlk6G2yJY1xH8VgKigGex
	zSkp22P0FqPNXVgvqMX9nsQljO+CQkbC+kETvLj58FS7sHkp7qYspy/5/HPgXA0H
	JkmSCUsPtHdkBgs1bWBrmPu2BrAS/yj8vv0EpIFDo99QRo7yxYfdlbWwddBPE65p
	EY36UdT5gePZj7KF88lQEIpGdQyFcjXGP+Ao0gViuIPWZyPkTzzg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7kbbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 19:04:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55RHnDjY019297;
	Fri, 27 Jun 2025 19:04:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkv84x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 19:04:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0mD8vL+6lYV2myQry6WWdiXCRxvQIm7aekWkSBqjlBQfVUwEUJYidwM2lCnsihGELPr6QABHQrE4Ci9DxnSX+xBTZWo/yN21ulBJQxsc2NnQY0q+ESb1VTuNYZlDMtpvBcamJTuDcmVeUSac1vPOTomjAiuuKsQAOlMoaFWBiBkLixvQOOdD8cYm2gZA7yMpw3kKBzA1AJEjbGfzJP73pPKk+lifbf9FWkKYrf7hvYQZnY9GVzdbHNQj8OVKFdS+/Hm62yRdmkutkD+V5kHLtWJ0Ntu/4M7bMezDFyv9kdFgGedNLf/3y/AtOjYFpu8jbStpP0guTGTQzjRWHZk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NciOF1Q+euV+f9sqPHhf00ObLImPKW9s2myCgraDBc=;
 b=TSt6fSu4euvUJfWf9UpXdxFI6XAa6zsgTo77CW8UdMGl//xobeVoTeoUofEARF6q/wHTkY9eg66DppRPrLMW/t9kwnGJVSxrkwJR6pAHlKBv+PbmXD7zaSblZKn1gc7F1IcLbIkhUdsmhgx5JF6y0g/hcgwhzmebLI5uaQ4JKYQ8d2n5+88VF2YnoRL7yNxrZa3ytSXF7F41FnVsk0detO4945npo+jAGmj06qid0Vf174QQaFVJKG5BFYGCNqj/Ots83UiPzmrTmNRj1OWUtRozdv2Al7SHL+hM9Y7xEDU2D90+nvkXQ7tfuxm2nEixtWiuxNm0l9Z6zkZQQ3J9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NciOF1Q+euV+f9sqPHhf00ObLImPKW9s2myCgraDBc=;
 b=DNElbQjgu9b9LEg1gvKrvVRg0pnpqEe6S3YHRrluNwQJCsl/SNCM7G1v2WZI6KyE+2CLeL1CLfQLtCUiqQNpu4km3d6JjI/B7Belmq/DpzIWlUtdJ/AVSToUPnK7TZdoNx4FhEOovqiuPBjME2YUskjiVqSYS2LWYTvIu5QQDeY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB8080.namprd10.prod.outlook.com (2603:10b6:8:1f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Fri, 27 Jun
 2025 19:04:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 19:04:50 +0000
Date: Fri, 27 Jun 2025 20:04:48 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
Message-ID: <b6ccc61b-2948-4529-9c9d-47e9c9ed25ab@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-5-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627115510.3273675-5-david@redhat.com>
X-ClientProxiedBy: LO2P265CA0154.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: 766d54c4-b7e5-4ef9-5edb-08ddb5ad7ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jjw2JiV+0H6INn+vkYIsO+psU2DwbXa4TlDtAPu9ifN6uocIdM/qg0Fc7CaA?=
 =?us-ascii?Q?c3fDauVw1naSueXqNt3bVXLL5HDvdO5TepVsC/TjSn65MRie09j0WMUDYosR?=
 =?us-ascii?Q?aLUmuBKfl1vYsa1EMhw4a0adJyrltgnEQ1JWDT/8DuRnAgpjPYJeg85TCVWQ?=
 =?us-ascii?Q?zKKTC9cm9SC/RiwEGOcPtae9RJFqcqYOSsdZ+kyh7GTD/J/0EPjAf56cYLtM?=
 =?us-ascii?Q?2ONTXjfc4PnVEA1jfn1WXQ3pIcJeauyCEEzbqcckP/ujegj+XSUW6tGDPm6U?=
 =?us-ascii?Q?xhJc7jOpLxfTMkn3O79DRfCtbVMC1mQXWAek7MRUBUSkR3HxPVwtqUctLz/k?=
 =?us-ascii?Q?6GZ7aWLmcR0aSUK3SdIPbRb8LEBD6wAfRntAj3Y//HJIypEgj+FCCBftbCzY?=
 =?us-ascii?Q?/vg4dZn+RA99DkELEqiBkgiMlBTh76ooBZ783XIqlPnJ74r4u/ytZ5xDbX/X?=
 =?us-ascii?Q?hQknlqAs2wnpIaws1BEBWi+LnZkLQo4GvxE5Gj80kLzuqeyDE2FzIrDLPiY6?=
 =?us-ascii?Q?xmm8a3r3cvn/S6gRVsy3lCG+li3bzVTiCAE5Gb0EFTRaAsYTjdUK2apB9GEg?=
 =?us-ascii?Q?O59rsLQiSFugoP4znFZQCgpqGJ3Lk3kPvC9PvwjXg8g8S55hlqAJ/qi3fU9i?=
 =?us-ascii?Q?TwqWnaipM0eDH/XB96fyb1cye0R3tpD4x34lhX+ec/ii+bJll9sB/cN6yldI?=
 =?us-ascii?Q?7A1kQfkHO8+dsmtMTMqxRM3WUD0AEOrsoKM5WOMM+jaL06wbvaSijopiTU8D?=
 =?us-ascii?Q?HAUZzO27z7K+/KbrpmljwRJFCojgCMnPIoi5EKjsmX1Ka5OpTpqU1ihldZPM?=
 =?us-ascii?Q?1G/ZYpe/589WcilhDafYZbPptfnP/X6Rb7VJm5GVcpGG/41KxahLYfAd9hGA?=
 =?us-ascii?Q?h66hXiicV4s78M3jcpdiVM+khF7Vs7ExVN8eECBtj04Tg92ulwlIYYJjydQn?=
 =?us-ascii?Q?pVlATI+aWbbVtXaVOpaw8boCWv9m0hOIitc5TVMHqcpHlRT4/F9vhLtxpGX1?=
 =?us-ascii?Q?ohwenVEp2JL68/qvDamN/Yct6va3YLElTBdqY3jQ2it52SlmCBOvp8zYau16?=
 =?us-ascii?Q?HTUZpEOTkhHPOi3uv61Je6Zm933xKujeaZr9/NO5lM95KEPdqtUTC1Sni6sy?=
 =?us-ascii?Q?z75j5EGG8138CNTqKNcx8fE323Dp8ogtFmDqcfcchZ40x4Q9KeOoHyWcXdbV?=
 =?us-ascii?Q?KHogXRCJfzT13M0AoRb2pIFvQ6tkvNxK8I92owyWqp83pU9Qh/xcRaGJ+dVf?=
 =?us-ascii?Q?eQUBZwYtykRi0/dotIsievtLHoaba1NkMtBT6w2gT5J0U1pChxHJVfeZEjnW?=
 =?us-ascii?Q?HXtJ4P7MFwiUZLsci3KCe1l2IQkiOS9+Ma7BqLzBVf5g14S7YFxW1/TuZvS/?=
 =?us-ascii?Q?gdcDyteNIWyLXBNiUe9irQASesPVANEP6cmlLn9coDyYXtwZKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9MXOrNSEqErPcmy1dfv1HpbYxOWk8fHK8GwWjxEq0hCFxt9oj0Tjky0ZYspt?=
 =?us-ascii?Q?4OO/2lwUbI+n+FUTMKWUdcMI6HMibFgbZdnUbgOyNPfE83EOYQtDfnZrvX3N?=
 =?us-ascii?Q?gAzGlxahZZ2NJq3TRP0XVkIWZ3A+WvzmXGyNTSIhmTmJwf/7sobz7TDqZ+SV?=
 =?us-ascii?Q?g6W3ssohYxj6o2rlsCxjejXsl5uqO97qPMm3YDSZjOA4atG5oQ1iiVvFgjmz?=
 =?us-ascii?Q?pWZdYlak/0Ad0tXzydr/QWnRlZcNFBH3k9eY3FLc7IJTIsomV3sjySQ55jq2?=
 =?us-ascii?Q?Jq74Thm1+2m5yN/KF2+p5d4g/vLSuI3p3GMXzsUDQrJ9znvqztkw4dgjyVMj?=
 =?us-ascii?Q?sN59Z0xzVCYpzuEUF4WcIyQLPq5uDZXRmVxw4Q/eG8EC7DPqu/30bzlvJstO?=
 =?us-ascii?Q?99to0p2Y8K0iWZNp7hPdIvV4m1V53FPNZYgIFSU/nDDUWfx9hOJwssR5At9m?=
 =?us-ascii?Q?+ITiRBwUhdbq7zVhHFQTkVYsAdFGQ2PgiHr3u8t6U7EciG2J38Pl79Pg+yCo?=
 =?us-ascii?Q?qLF6bcZEv0Bc4sYlUtCwojDj6QALlsFZwcBTAa27JGA9mJUp51j0CUyot77H?=
 =?us-ascii?Q?gHtNWODdH59gk49hRW4r0jF0Zo5v6Vdbk8xIklsO6WFIO7eKkIx/L8inTAUA?=
 =?us-ascii?Q?J+DIxHN5NnrnXXHeL6EJugq/zIIx5ZR9VDLot1zwFiRNfe9mKaYQyTdyY8hK?=
 =?us-ascii?Q?nbmedqc3rU2UNXePrz0mTCsbqA3khOOuN4rIzLsYlOjyUyOAL63t26Rr5t7s?=
 =?us-ascii?Q?vL3OSliN0pUnw4sVINinWX1tpLjChzTqfgapS5uunneeGJ4/isDkRUCWM59b?=
 =?us-ascii?Q?X2DB52UC8KT9vwqKzNQehPRakHlOF2lC768DV0U/FyK2qAC0uKmLJsHYi7T5?=
 =?us-ascii?Q?7erX2dVyQQjuK+KFXvUzsSEa6tEKAUwnO7lLAOiy3cdoQr/IXHUJdcieCB13?=
 =?us-ascii?Q?Bv42LeOLwyVUADpwD495+I2c91YjZElg2PYzOP2P9XyvLBVbGbrjBPlRwqVd?=
 =?us-ascii?Q?o1EgLD61i7p1NemT9OifadTkK6oKXT7FF9tMxWFsEc30cZVYtS1as+qkcj65?=
 =?us-ascii?Q?QwCJZUhjjYExb7HPbmotMgap0D8Cx0KpRRr4d6GSpDzZwsP6KsJEGthyN5HR?=
 =?us-ascii?Q?Wo6+Yq2YOmf95rknZBIMfDyE/We8Z1ieB1KyF5MHs5ZLRY+T9HtZgdfsQj39?=
 =?us-ascii?Q?has7QpzqStGx04b3P4uqB4WOgzeh7EjtrHJQ5vuLwgc26h4qF2vxRt4x5flX?=
 =?us-ascii?Q?Cp1AvQDtnWulqOMiMpbvQdcVTdgbZGUDhSgDlq0iATWOr18wlNqCelTQimVt?=
 =?us-ascii?Q?d6HySs2OpnzUa5D2gqkYqKbYlshStHFnBh1S4wQ6g98oOu4qV2aXBsffn59Z?=
 =?us-ascii?Q?0KJcJ/NVkt27LCisctzAi9Ci+PVCcdfBmZQMnj/7FFJIhJihU02Eecg9udEw?=
 =?us-ascii?Q?qdUTT85z1mJ7fhCU1QLkPrdoaD+ctnfl7EurA+Op+cFvmpzKj0+3LzfDwL91?=
 =?us-ascii?Q?d5xggubpc6reNkwnptB4JS22t9ncVh4tp6kzXvbDbLjdpjQjRNzvd1iI4pYd?=
 =?us-ascii?Q?GRtj9cPKmowkD0LN2noTH8yQuQ3gL0hsAFOG4D1356UEQ7sycrNtIZ3g7Y80?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b7AkYErmZvnPDLN2IDtfuVmWZLGmvjFqfuadd3rG4mdEyQfgCf655QpOUsBSZxSLYbH1zVDy97kYdUV/cY6D1+cRd7t+3wiV24ssmf6XfiNqNjuGj4L9XYvfTCMnIx1O1lrxKPBs5RKMgwTKKjUP4ncaRJQaZJQ6Sz9cJjbIsnacMstQxSGUgNcWAu9W1PxbYooUNBUjmPzXmbtVjEmyxt5e9mDDzO0gQ2jsYBY6s+YHGgt2WCotbN+CWC+CfqYzPGZ5tsUz7PQ5lPz9V11QLuG8enmy4boVNyJxD4dtBEc9pJxkUE2U8NqJK9XKVXmfBp/dqTUH3sSUVMc5yu9ez47lrALU1zm9HZ82NbRtSz5ihSA2alR5qpWx5Olp5yzUkGRcq1iFmhh9Krb9D6/oBZyl3HxcipKvxYLjrn+GtP9LPowQ6DL3e7cmtKQOnBuoYzF9CfnclwR0Z6nQiJzzKkXf04L8YFLsV9KfYgsG1TUk71OGdrh9NxaYbip23eXojidgW/I+H6Sj45i7khrYygTw4Z5sF6KeqpH6NOmqjFHrB8pQv194AuoZ5zi0p69mDsCNeI0UMs1WEzLEXRu4hhajZ3QASFNb53Xz6Fs9doE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766d54c4-b7e5-4ef9-5edb-08ddb5ad7ded
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 19:04:50.5162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3s05IzKy2xlkMaE7A4gF+Ub1ydqmfEYTOloBxQDYZHW5bkcgDuO1IobS2KNsI2KIpDLtFVImABxiGamqahIvAlcPhdYje0ZPcwfucL/YoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8080
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506270154
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE1NCBTYWx0ZWRfX7C0gpDYXInGB 5OvyA2r/P4FLUtD/LwAqkHPVRdt1aoX38oh8smb7MONJYVERzdd5E8LpP/cKdQAIX22p8JW5c6S 4u5HPqBSMtTx7jsaLnfM0fgoPL++tw3PPyW3LGD19t/dhDS5lhRvWZ70ylawIL819reizLDJUq5
 kktwpJ+lNyo8VAwrTWgF0EZvjjaoREeMHVFVA9L7QHlSTlTZUrJuFsuqnJ+ro6Hf6dAuEteWiv+ WhHems3+qcx5Fk+QwcS5qfTiqsmiMUUFRgSGSi6nT+gU4rXyLBottPW73euhXlNAkIcMKq4zhQW 5iz7G3iFUcEWR5nhxHScvHNX10WW2L4UOLw+GMo1SYne4ds46q7V3tv/xyPJOvFMkfUdac6sUo7
 UaRBYRfU1ekF/k64nfgKJJyV4qv8UFeGcq28aNyMI+7HoXyT4p3qksZftintdW5AGJYjwG5F
X-Proofpoint-GUID: 5t5L0WtuMAFFizuXdovFZlYnujoM0jcI
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685eeb56 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=IUpqqJCsMlyWKIfrmpAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: 5t5L0WtuMAFFizuXdovFZlYnujoM0jcI

On Fri, Jun 27, 2025 at 01:55:10PM +0200, David Hildenbrand wrote:
> Instead, let's just allow for specifying through flags whether we want
> to have bits merged into the original PTE.
>
> For the madvise() case, simplify by having only a single parameter for
> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
> dirty bit is not required, but also not harmful. This code is not that
> performance critical after all to really force all micro-optimizations.
>
> As we now have two pte_t * parameters, use PageTable() to make sure we
> are actually given a pointer at a copy of the PTE, not a pointer into
> an actual page table.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Overall a really nice cleanup! Just some comments below.

> ---
>  mm/internal.h | 58 +++++++++++++++++++++++++++++++--------------------
>  mm/madvise.c  | 26 +++++------------------
>  mm/memory.c   |  8 ++-----
>  mm/util.c     |  2 +-
>  4 files changed, 43 insertions(+), 51 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 6000b683f68ee..fe69e21b34a24 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -208,6 +208,18 @@ typedef int __bitwise fpb_t;
>  /* Compare PTEs honoring the soft-dirty bit. */
>  #define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
>
> +/*
> + * Merge PTE write bits: if any PTE in the batch is writable, modify the
> + * PTE at @ptentp to be writable.
> + */
> +#define FPB_MERGE_WRITE			((__force fpb_t)BIT(2))
> +
> +/*
> + * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
> + * modify the PTE at @ptentp to be young or dirty, respectively.
> + */
> +#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(3))
> +
>  static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  {
>  	if (!(flags & FPB_HONOR_DIRTY))
> @@ -220,16 +232,11 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  /**
>   * folio_pte_batch_ext - detect a PTE batch for a large folio
>   * @folio: The large folio to detect a PTE batch for.
> + * @vma: The VMA. Only relevant with FPB_MERGE_WRITE, otherwise can be NULL.
>   * @ptep: Page table pointer for the first entry.
> - * @pte: Page table entry for the first page.
> + * @ptentp: Pointer at a copy of the first page table entry.

This seems weird to me, I know it's a pointer to a copy of the PTE, essentially
replacing the pte param from before, but now it's also an output value?
Shouldn't this be made clear?

I know it's a pain and churn but if this is now meant to be an output var we
should probably make it the last param too.

At least needs an (output) or something here.

>   * @max_nr: The maximum number of table entries to consider.
>   * @flags: Flags to modify the PTE batch semantics.
> - * @any_writable: Optional pointer to indicate whether any entry except the
> - *		  first one is writable.
> - * @any_young: Optional pointer to indicate whether any entry except the
> - *		  first one is young.
> - * @any_dirty: Optional pointer to indicate whether any entry except the
> - *		  first one is dirty.
>   *
>   * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>   * pages of the same large folio in a single VMA and a single page table.
> @@ -242,28 +249,26 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>   * must be limited by the caller so scanning cannot exceed a single VMA and
>   * a single page table.
>   *
> + * Depending on the FPB_MERGE_* flags, the pte stored at @ptentp will
> + * be modified.

This explains that you modify it but it doesn't really stand out as an output
parameter.

> + *
>   * This function will be inlined to optimize based on the input parameters;
>   * consider using folio_pte_batch() instead if applicable.
>   *
>   * Return: the number of table entries in the batch.
>   */
>  static inline unsigned int folio_pte_batch_ext(struct folio *folio,
> -		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
> -		bool *any_writable, bool *any_young, bool *any_dirty)
> +		struct vm_area_struct *vma, pte_t *ptep, pte_t *ptentp,
> +		unsigned int max_nr, fpb_t flags)
>  {
> +	bool any_writable = false, any_young = false, any_dirty = false;
> +	pte_t expected_pte, pte = *ptentp;
>  	unsigned int nr, cur_nr;
> -	pte_t expected_pte;
> -
> -	if (any_writable)
> -		*any_writable = false;
> -	if (any_young)
> -		*any_young = false;
> -	if (any_dirty)
> -		*any_dirty = false;
>
>  	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>  	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
>  	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
> +	VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(ptentp)));

Hm so if !virt_addr_valid(ptentp) we're ok? :P I also think a quick comment here
would help, the commit message explains it but glancing at this I'd be confused.

Something like:

/* Ensure this is a pointer to a copy not a pointer into a page table. */

>
>  	/* Limit max_nr to the actual remaining PFNs in the folio we could batch. */
>  	max_nr = min_t(unsigned long, max_nr,
> @@ -279,12 +284,12 @@ static inline unsigned int folio_pte_batch_ext(struct folio *folio,
>  		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
>  			break;
>
> -		if (any_writable)
> -			*any_writable |= pte_write(pte);
> -		if (any_young)
> -			*any_young |= pte_young(pte);
> -		if (any_dirty)
> -			*any_dirty |= pte_dirty(pte);
> +		if (flags & FPB_MERGE_WRITE)
> +			any_writable |= pte_write(pte);
> +		if (flags & FPB_MERGE_YOUNG_DIRTY) {
> +			any_young |= pte_young(pte);
> +			any_dirty |= pte_dirty(pte);
> +		}
>
>  		cur_nr = pte_batch_hint(ptep, pte);
>  		expected_pte = pte_advance_pfn(expected_pte, cur_nr);
> @@ -292,6 +297,13 @@ static inline unsigned int folio_pte_batch_ext(struct folio *folio,
>  		nr += cur_nr;
>  	}
>
> +	if (any_writable)
> +		*ptentp = pte_mkwrite(*ptentp, vma);
> +	if (any_young)
> +		*ptentp = pte_mkyoung(*ptentp);
> +	if (any_dirty)
> +		*ptentp = pte_mkdirty(*ptentp);
> +
>  	return min(nr, max_nr);
>  }
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 9b9c35a398ed0..dce8f5e8555cb 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -344,13 +344,12 @@ static inline bool can_do_file_pageout(struct vm_area_struct *vma)
>
>  static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
>  					  struct folio *folio, pte_t *ptep,
> -					  pte_t pte, bool *any_young,
> -					  bool *any_dirty)
> +					  pte_t *ptentp)
>  {
>  	int max_nr = (end - addr) / PAGE_SIZE;
>
> -	return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL,
> -				   any_young, any_dirty);
> +	return folio_pte_batch_ext(folio, NULL, ptep, ptentp, max_nr,
> +				   FPB_MERGE_YOUNG_DIRTY);
>  }
>
>  static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> @@ -488,13 +487,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  		 * next pte in the range.
>  		 */
>  		if (folio_test_large(folio)) {
> -			bool any_young;
> -
> -			nr = madvise_folio_pte_batch(addr, end, folio, pte,
> -						     ptent, &any_young, NULL);
> -			if (any_young)
> -				ptent = pte_mkyoung(ptent);
> -
> +			nr = madvise_folio_pte_batch(addr, end, folio, pte, &ptent);
>  			if (nr < folio_nr_pages(folio)) {
>  				int err;
>
> @@ -724,11 +717,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  		 * next pte in the range.
>  		 */
>  		if (folio_test_large(folio)) {
> -			bool any_young, any_dirty;
> -
> -			nr = madvise_folio_pte_batch(addr, end, folio, pte,
> -						     ptent, &any_young, &any_dirty);
> -
> +			nr = madvise_folio_pte_batch(addr, end, folio, pte, &ptent);
>  			if (nr < folio_nr_pages(folio)) {
>  				int err;
>
> @@ -753,11 +742,6 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  					nr = 0;
>  				continue;
>  			}
> -
> -			if (any_young)
> -				ptent = pte_mkyoung(ptent);
> -			if (any_dirty)
> -				ptent = pte_mkdirty(ptent);
>  		}
>
>  		if (folio_test_swapcache(folio) || folio_test_dirty(folio)) {
> diff --git a/mm/memory.c b/mm/memory.c
> index 43d35d6675f2e..985d09bee44fd 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -972,10 +972,9 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  		 pte_t *dst_pte, pte_t *src_pte, pte_t pte, unsigned long addr,
>  		 int max_nr, int *rss, struct folio **prealloc)
>  {
> +	fpb_t flags = FPB_MERGE_WRITE;
>  	struct page *page;
>  	struct folio *folio;
> -	bool any_writable;
> -	fpb_t flags = 0;
>  	int err, nr;
>
>  	page = vm_normal_page(src_vma, addr, pte);
> @@ -995,8 +994,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  		if (vma_soft_dirty_enabled(src_vma))
>  			flags |= FPB_HONOR_SOFT_DIRTY;
>
> -		nr = folio_pte_batch_ext(folio, src_pte, pte, max_nr, flags,
> -				     &any_writable, NULL, NULL);
> +		nr = folio_pte_batch_ext(folio, src_vma, src_pte, &pte, max_nr, flags);
>  		folio_ref_add(folio, nr);
>  		if (folio_test_anon(folio)) {
>  			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
> @@ -1010,8 +1008,6 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  			folio_dup_file_rmap_ptes(folio, page, nr, dst_vma);
>  			rss[mm_counter_file(folio)] += nr;
>  		}
> -		if (any_writable)
> -			pte = pte_mkwrite(pte, src_vma);
>  		__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte,
>  				    addr, nr);
>  		return nr;
> diff --git a/mm/util.c b/mm/util.c
> index d29dcc135ad28..19d1a5814fac7 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1197,6 +1197,6 @@ EXPORT_SYMBOL(compat_vma_mmap_prepare);
>  unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
>  		unsigned int max_nr)
>  {
> -	return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL, NULL, NULL);
> +	return folio_pte_batch_ext(folio, NULL, ptep, &pte, max_nr, 0);
>  }
>  #endif /* CONFIG_MMU */
> --
> 2.49.0
>
