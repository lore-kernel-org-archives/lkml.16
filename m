Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43DB846C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818026; cv=fail; b=r2FcGvFowTIHKOzd5GHaJAUodix25RkRwaB+CMmSqOV3C6degxlsEJda1aqvWMuaVsW/LN82tA6QxEUBON5bfz30znZf9hRIhrGUsZu5qz9LQFD6VEENfj0mQCb0pPlRM0Qx+aqR2KaNXqemtr5wks1hhdldfyhj7tsqalhtuTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818026; c=relaxed/simple;
	bh=xtR8xZViGs5C3jcv+CDgARd7rz5Pbn9n9dq+3bEkKx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RadisZt/X0RawYmeA4+Gr71Xry1sDzqljPZ7c0lr0b3Um+1+saYGyWt5G5YnA75lzbBmzOAH738fwgqTaazbCe2vOOdQ6B451vatWjVpnU0q0xRGTXKQYZ/+SrGo8bIrNm1CDjQBaSbiThFZBInFw8t9urLqJhUMMzO2ZzrGyJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OoOnHMFr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gsGx38A6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OoOnHMFr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gsGx38A6"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DC13eS017702;
	Fri, 13 Jun 2025 12:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5+hrnATnXpE3ILj+3c
	gXzFzDxCdV37inzjm1Do1/r/g=; b=OoOnHMFrbYo0Q8i3Gszd9/yPSk4w8CQs6T
	pOddoZ4AAvmC2Hrb3BWsg+j0L5BOZvreBWylKWUdrSo2eRLLj9mtora3MNYzdBvs
	IXOCglTykE3Fzkp7V2aNUEx71pEPO7d4VQJ4PSgOdBaYHzmeBsW+pAEnRmnCMAAa
	ePFXeWcpTRmQxfOgedAYfWJnmzGOKmfgNXmFIbamFjb1NaVpapA2U1e/t3otn86D
	nNNxT85WUiCBIIu4UwbLkSRSwqLwQUwJpqzTW7IyiC4HRCmp/mYaTVCrNvqh5Lhe
	PmRBLwPw8gHB2cFaq3QEDw1dvFTTOoMG5RJWqpWjvlICDyKN+Etg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c753gt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 12:32:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DAdcNK040780;
	Fri, 13 Jun 2025 12:32:50 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdukb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 12:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXH9RweE4UpMf+tdobWWuL37KWhjLHMvw4qpaDJm+74370t/XAvqQvN3stXME7sVy5T1LNW7HvP3W+l9gdfdAMLGKmxwOmjLA2yaQAYBthu8/5Tv9VzhrVtamLPjsgT61DrizKSGa5rDowIoTx72eEEhdGhjLQE5zC7gz+w4xsqP94HA5kwA5JYD2a95NS8bg1EppjAx0bZ1XGZBwD7ArqPbo5J91QQgvjhyZvRj6mLwevjuEJYshxQzu2kLrKwr/78Pu5Qxc14WcvwEqCdHojER+F6gPA4zQywjbbC/gOrRjMInAjzKKPr/O6JY8Ns41qS7O7+DsW36ucO98UO8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+hrnATnXpE3ILj+3cgXzFzDxCdV37inzjm1Do1/r/g=;
 b=SxBhFoV2/txuepBmMrI0tSYWEBITougrcF6e6wrFv91Mv0kksWCZC4CQk3xHV8wfAnsolAsT1IqXA2IZ97Aw/cfPxslHbIihzSMdptEWcC2uvYzwLxDljpbR/Gln/Peegtb5DXdKVXtVLIzcClx7A+atnRmJaWCDG7ZbseBenNgMOLK6aLP73IZSmcK151gBKPWn7XIreNXgDE9dtNqLevk7cktVJnvNUTVz+kx2OWoe+shj9N5ijbCEis5X/v3EMGZEiGvNfDnSOv6U7AgM9Kfd9RK5r1OcH/GF6qbHXiIjrrcO2w6V3RIUzFxTw2uUNncIRj6PNfmNMJW2B/vyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+hrnATnXpE3ILj+3cgXzFzDxCdV37inzjm1Do1/r/g=;
 b=gsGx38A6IxAta97gZX77J8Y05DMzTxARIr4Q+2I1iMhCRUmMPolG2hqCw2y1RrvQOpGpbhRivoYrIa7+7aQG34PXoJZKQbWFp7QtcjtMBIzFBgNOWiPP9JkgcPnziVk6K1qBb22SgF68JpSBTSVmdVLMAY0xOxUgfQs/S6omYxs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB6127.namprd10.prod.outlook.com (2603:10b6:8:c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Fri, 13 Jun
 2025 12:32:47 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 12:32:47 +0000
Date: Fri, 13 Jun 2025 13:32:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org,
        libang.li@antgroup.com, maobibo@loongson.cn,
        zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <bc25dd02-6ace-45e6-9d3b-50f9c06aef98@lucifer.local>
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-3-dev.jain@arm.com>
 <43d9cb6e-1b8f-47b9-8c19-58fc7c74a71e@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43d9cb6e-1b8f-47b9-8c19-58fc7c74a71e@redhat.com>
X-ClientProxiedBy: LO4P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c74993d-3f85-4d9b-e5e2-08ddaa76671a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4iXrLNEmUM4oFqWl1+W7sqmatu9W5t78N1EWwbfjRigWrE4ljG5zGLzgsto+?=
 =?us-ascii?Q?Up7DALYbQP/3ARN+WcdUG6WeiznMNuOq+ihp0tszsDsYX2ycXsq0Lhdsmcgd?=
 =?us-ascii?Q?sLhbS8u4JeaJnc/9eugvooJFZ9mGJAl4Tfl8caVoVySFyIbx6KsFBQimosny?=
 =?us-ascii?Q?ZdklUNxXvY1mxJY9qUQujWL7CUFVLuY+vO6q3HbTa2x2Tr7z7z1nSzEsJ+jE?=
 =?us-ascii?Q?GUONM42oWvhfaqHiqAnNaSN9X07xhHOq/Ug5hXoi6qLMpaxesLLJo9oXE+Ir?=
 =?us-ascii?Q?irJjh01mGFnD9srVCmGB+oCwKtQg4ShOiFlH5ddRCzgGvcnl66wtFp9rHWfe?=
 =?us-ascii?Q?Y6VYfZnI0ODr7f/TiQFRG7s7InAqTOHhiLY7dAxumPgs4HD3gWos52gsKj1N?=
 =?us-ascii?Q?kBJR8tjFkhEE7hUHPR+5B3BktjuOg/F566Snk7a/FscpML5g0/h6iC+dJfAC?=
 =?us-ascii?Q?E5m/1+WMQZHBJNUIkeZCrpWh+0WtEh48kFA3mevphsQLr5Fpnf4nqNc0baMs?=
 =?us-ascii?Q?RyXvnZi8KSDe9DL3P2dYnB8kOzQLsR6q78nS46160frspbFUhCkKkEBymOTA?=
 =?us-ascii?Q?iOAlHsOYN7zqDhjM83ecb5Y+T4gZ2eH10bU+ZPpH/Ov4QsFRw5PHnwXWublx?=
 =?us-ascii?Q?CJ37rwkKW39JxG3jYqaFWOnbsLl1AOa0U0YdkDEE6rIjdim+fnCbX1HcCib7?=
 =?us-ascii?Q?89r/AvP9UzW3OU594nt29Bis1cRX/Ki57xuaKFBLF7v/olwL0yeBhl1jU++Y?=
 =?us-ascii?Q?aL8t7t3N5F9d2DYn2k6cwgBHBfLZ52NJnPHMtl0UHZL3Dxc2jr5O+pV9QAVw?=
 =?us-ascii?Q?4PxgraDfbhalnCD3AM3JPAXaYYqYXAXyjOeIsyoe2YMTgcav0rY6DoE+Y+mn?=
 =?us-ascii?Q?mrAO+Q8dwOZ+hFZVq0Zu0uxpcggDRPXQNN9eUjOYBR8uMRtGCE1cQEMVbFrn?=
 =?us-ascii?Q?CuqIN48Xwy/avPVLZcJQAIcOm5FTJABxpGjtWnEvprLpGVxvP1AlADNLYoyu?=
 =?us-ascii?Q?L22CiQeogodT1hclLFUNWSRbJviaIhh8b90h61i3RcDn4pARg9liRPGXHjOE?=
 =?us-ascii?Q?ggzE246N1teh2CNISi4ey8uZGUuNJ3sN2l8UAI1g3LFVsZNpUby9+6pgS3p9?=
 =?us-ascii?Q?1kHFDORW2Puyf42d4aSz3hY/3nSAn/Dh6ho7wsTjixUASJRz/HHKkESDD2q/?=
 =?us-ascii?Q?u1jTNpUnEPO7puZdrHRyDgbeG8AMgib/gpwJiA1fwd48sRa+uE2SR4ePZS+5?=
 =?us-ascii?Q?4hZ3b/lepOAWqZkrS6t8dl2J2t5+mn7z2w03VNYhAkVouKeyXo2bzfxmHKwp?=
 =?us-ascii?Q?L3MRsEOddiRdW9IGW+Z8G2i/AtCZuzm9wEe2gyCiFvidWyjbEd/XqNRoa78M?=
 =?us-ascii?Q?8Tthv4LNePJ4Fd1hTAHk+5+/usxP/N4mLACYkheFbhYjTr090Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jkH20Vp51My/hAof7UCtQoWyyDeJ6vis5c/I6zX/CJcPgTFklhkcL9W6qpnJ?=
 =?us-ascii?Q?EILkqMIIC/CS7r1WC+JAFK45y6ZUjyJIr564lkwSk4mRkW7D0bmESWn6Vl5z?=
 =?us-ascii?Q?nsrQXa9g7cJoizO8dAZKBpcTCtPqxGtLdamQo0r0+8NKmQvfvkMSXyFiasUi?=
 =?us-ascii?Q?30AYzv3PVSWIAE8CNQue8Kgn99qkjw5u0aAr4hfpTpPLb/VDKeItS1ywFWP3?=
 =?us-ascii?Q?q+2vqMoHrRF4ra+D/NQnYuEesqkDNAby+39/pmCDDo2TsX97rM2M125fhRQG?=
 =?us-ascii?Q?fIYro4fKUYZUkKggAaYUzR5tJUeMVnk0ijUS1e2AzGgSY9ZYZ/aHqX0DZogL?=
 =?us-ascii?Q?yItSYzYOlIUnMWGiza4EsNBKcC3kPWayTE4Gl+s9nLMgSRc13pimcqkm3oW/?=
 =?us-ascii?Q?L7ZCrSnjVke80X6B8/aoAmIS30KmE+c1Wj7YcIWaZBUW757iw7u/vLAG8Wfq?=
 =?us-ascii?Q?6B11TpYWUrW78K+HR9DoKvAvbvXKIsrIW6W5TgkKGxKORKaX8AbfS416uOGM?=
 =?us-ascii?Q?Q8a7Y2L68/rX+og9+q3FL5VvDp0hunQzPSrmGGxQHkkYtdAj4abcAC/A262W?=
 =?us-ascii?Q?OlqVItTQFDxDK2QN4HDQCyLaZsDLEYYzAAdOD3UqVUTfw1QwdBeHdoWnhdzW?=
 =?us-ascii?Q?ZJYDPymsoOni4zRBq1yGxZ2TxcJchW6yPHG2xznYYC9ix4k07lf8G9EiuS7C?=
 =?us-ascii?Q?EpqdHGWgQ5efStrWNBJ6MOvuXb+q51McotTiv5h4JGM5QuX4A1D0A2b4OUm/?=
 =?us-ascii?Q?7eJRNQRvuK1fbmBMiAOtswIQ5iTabf+WH8hrWQeCLCQWHEuf3p2tVLKb8Soh?=
 =?us-ascii?Q?PvWO/6gN9dC/cwDcc/ll7rTxB1zQoINmyYPYfF7akrfrX6Z/EBT3mn6wMyop?=
 =?us-ascii?Q?za+KuRi/9VxtV2WfyNjAaQFMEKoW16LzxftXrzUIGfAsFjeCREIgJu8pk3Nj?=
 =?us-ascii?Q?5iXFAWMiZLnDEeXjKY3Lo4cVB1YC3VGNmGzvgWISyx+sCYfEZ5Hmp4XPZTBt?=
 =?us-ascii?Q?YXfKYTrzJc22Ty6bhDVw8FyLMD7C7r+Mu4HkuKnR1QjXbB552YqQOfGGDvBQ?=
 =?us-ascii?Q?WYc/THUS7iHqxhtHaLVzcZjtz8bpBkbVjTGExffcoyWrugPg27P5JCi+ZI13?=
 =?us-ascii?Q?qtg/XxyCrpZo60JisHztqGzqQ98uJeNJzzx7EskSE0EjnUfzaooO/n1Ln20b?=
 =?us-ascii?Q?+Mxc3lkf93GNU8EP/qA/rgjsRkAmJWMj9fD+LZIpIHSTN2UxJhh2pn6jg7A/?=
 =?us-ascii?Q?aQ7zOCDC3TYlY2MHPV8/Rs2nlmmLWNWam+XZ8gkQ09Ul+SgTFMaxtiqG7/zo?=
 =?us-ascii?Q?a69nw0evCRDekrkW9y4WLXLxryX3k6V5kaj2dgrXKc7aAcUvhV7Xkgg4Musy?=
 =?us-ascii?Q?fXkBvUcH2YnN0mzncljXk6t65vNjUpilNehBJb0kpwjDYV1wS4qC06m89JKi?=
 =?us-ascii?Q?B+wbBt90ESo1+d2p1YWL9BDgPkJATvmAwpXL06uLAmDwPB2FClH2DWaxGJIX?=
 =?us-ascii?Q?+Xic51wHpSn3OiT1O8UlNzr3X0UjPss0MBgfTwFSF7Qy6QewH02Z3TLfwe8Z?=
 =?us-ascii?Q?vDz9MZD5T7fA+1vndAzV4GL6ih5IzJCRZlqwA5mYAFaF9CM/feQ8Q4QWgZNa?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aBPkZwBDiiO54EBCcrvntPa37fqrkkONfeQbIsY7YqbW6Gwq3c7pzq5udDouZ/f7YFXGp6xmA8A6l3as8RrQlD78T2AkJi6VvjS9vf+6XucPMYUCCaT1SpJjc4LmSy22ike0ZqRAW4Grv3OI40RuLSBsbX1V4VAeSduz5MbndRIlnt/XTAAPqg9KPjZp7Hg+4q80YQcigJ7e0IeBLIIb55CyyBK2Y0aKmS+TQSQb8cLxwgOvke1qqeu+EeeRWQWabmDLvp5lLTh/MDWC6yjR9yBQHDeSg0IIkZPvWnvWmxXSYD6VGv/2qG8VohWZnkAFt5sFIIFSUbpGwqzVZnfG0eRi8DSTT+3C7DOCn8zGaKa+iWwZSRLQs9EN0uNJ0BD3PqElAKIIAAt9tX792STYltRlBnBLVY2ZvoDxjOLepKNa6gVbI3zYS2VmzS6/boN3ODDsykMB8Jkq2zkfWrTE7eVOWi9b0sDl06DS4mxUlb1G3Me6MxFxXQXKNVCWjiFxeVSLDD0abbuDJQXqU2eUYyYyDet1XvSON3WTKRn6fhrpW1SYrbbSf5elS7+yYZ03qk3nJ36+Lb1Yxi+Qpwk1HKx05Ib1KgLnFdKvD2lE9Jk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c74993d-3f85-4d9b-e5e2-08ddaa76671a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 12:32:47.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Usi90gXp1/GB/fY9HoeCBka7ycBe5lKGcDMwQNuRUg8ZnUQDIv184wEMIjfzOge/X+53zOMLMwBhFh0zIxCCYFazqbMviYS+M4/LHoWkHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6127
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=806 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130090
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=684c1a73 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=ZeqboLozO35a2ErSEi0A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: QL9Dw0BPZwx8Ygd_CuDszd65qiSXvY7l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA5MCBTYWx0ZWRfX5QjS6bFomyO1 iXroTr+FaSLdsSeK8hbv3jAn3TtJPZQchRCmqYQaJ5taW1wg457JzuhkruPkQDq/FOygx583E1H U4PCq88YWdP2LSy/BVk+rFlWcuwrbotzoQVXwSCDD584EdxQJl/8lKciY/oi7rRtaRPFnwS/3Li
 H1tWUqR9/x5oDRW5B2XYjJnznOk75gqPn8TaUE59b0gISobDzy1tl2kQRAecGafnA2dVRHFNXxE x6jdE0CiG+T3HMgQrLoW+53B8iMC+C5KeAmf1gcLI33EI2ImZQh4uEikaEIdulhQlRgrabsvyuk 2malR6CDq22kkf9mv4sVfJWtje9ASj+HzVOwd5kK+2adEpCvLZDd7RPzWOsP9lbLZWjiU+/aO0D
 bm0x8+Rs7DnOvRhg8vmMflJL70z6/R0kDiEfC2MNtNdFGAHG90B4q+B64PkmmlnUMvhQLfRy
X-Proofpoint-GUID: QL9Dw0BPZwx8Ygd_CuDszd65qiSXvY7l

On Wed, Jun 11, 2025 at 04:00:41PM +0200, David Hildenbrand wrote:
> On 10.06.25 05:50, Dev Jain wrote:
> > Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> > are painted with the contig bit, then ptep_get() will iterate through all 16
> > entries to collect a/d bits. Hence this optimization will result in a 16x
> > reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> > will eventually call contpte_try_unfold() on every contig block, thus
> > flushing the TLB for the complete large folio range. Instead, use
> > get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> > do them on the starting and ending contig block.
> >
> > For split folios, there will be no pte batching; nr_ptes will be 1. For
> > pagetable splitting, the ptes will still point to the same large folio;
> > for arm64, this results in the optimization described above, and for other
> > arches (including the general case), a minor improvement is expected due to
> > a reduction in the number of function calls.
> >
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > ---
> >   mm/mremap.c | 39 ++++++++++++++++++++++++++++++++-------
> >   1 file changed, 32 insertions(+), 7 deletions(-)
> >
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index 180b12225368..18b215521ada 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
> >   	return pte;
> >   }
> > +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> > +		pte_t *ptep, pte_t pte, int max_nr)
> > +{
> > +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > +	struct folio *folio;
> > +
> > +	if (max_nr == 1)
> > +		return 1;
> > +
> > +	folio = vm_normal_folio(vma, addr, pte);
> > +	if (!folio || !folio_test_large(folio))
> > +		return 1;
> > +
> > +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
> > +			       NULL, NULL);
> > +}
> > +
> >   static int move_ptes(struct pagetable_move_control *pmc,
> >   		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
> >   {
> > @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
> >   	struct mm_struct *mm = vma->vm_mm;
> >   	pte_t *old_ptep, *new_ptep;
> > -	pte_t pte;
> > +	pte_t old_pte, pte;
> >   	pmd_t dummy_pmdval;
> >   	spinlock_t *old_ptl, *new_ptl;
> >   	bool force_flush = false;
> > @@ -185,6 +202,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >   	unsigned long new_addr = pmc->new_addr;
> >   	unsigned long old_end = old_addr + extent;
> >   	unsigned long len = old_end - old_addr;
> > +	int max_nr_ptes;
> > +	int nr_ptes;
> >   	int err = 0;
> >   	/*
> > @@ -236,14 +255,16 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >   	flush_tlb_batched_pending(vma->vm_mm);
> >   	arch_enter_lazy_mmu_mode();
> > -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> > -				   new_ptep++, new_addr += PAGE_SIZE) {
> > +	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
> > +		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
> >   		VM_WARN_ON_ONCE(!pte_none(*new_ptep));
> > -		if (pte_none(ptep_get(old_ptep)))
> > +		nr_ptes = 1;
> > +		max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
> > +		old_pte = ptep_get(old_ptep);
> > +		if (pte_none(old_pte))
> >   			continue;
> > -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
> >   		/*
> >   		 * If we are remapping a valid PTE, make sure
> >   		 * to flush TLB before we drop the PTL for the
> > @@ -255,8 +276,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >   		 * the TLB entry for the old mapping has been
> >   		 * flushed.
> >   		 */
> > -		if (pte_present(pte))
> > +		if (pte_present(old_pte)) {
> > +			nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
> > +							 old_pte, max_nr_ptes);
> >   			force_flush = true;
> > +		}
> > +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
> >   		pte = move_pte(pte, old_addr, new_addr);
> >   		pte = move_soft_dirty_pte(pte);
> > @@ -269,7 +294,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >   				else if (is_swap_pte(pte))
> >   					pte = pte_swp_clear_uffd_wp(pte);
> >   			}
> > -			set_pte_at(mm, new_addr, new_ptep, pte);
> > +			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
>
>
> What I dislike is that some paths work on a single PTE, and we implicitly have to know
> that they don't apply for !pte_present.

I hate any kind of implicit knowledge like this.

>
> Like
> 	if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))

I also despise [with words I cannot use on-list] how uffd is implemented.

It's _nothing but_ ad-hoc stuff like this spawned all around the place.

It's hateful.

>
> Will not get batched yet. And that is hidden inside the pte_marker_uffd_wp check ...
>
> Should we properly separate both paths (present vs. !present), and while at it, do
> some more cleanups? I'm thinking of the following on top (only compile-tested)

I'd like to see that, but I think maybe better as a follow up series?

On the other hand, this does improve this quite a bit. Could also be another
patch in the series.

>
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 18b215521adae..b88abf02b34e0 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -155,21 +155,6 @@ static void drop_rmap_locks(struct vm_area_struct *vma)
>                 i_mmap_unlock_write(vma->vm_file->f_mapping);
>  }
> -static pte_t move_soft_dirty_pte(pte_t pte)
> -{
> -       /*
> -        * Set soft dirty bit so we can notice
> -        * in userspace the ptes were moved.
> -        */
> -#ifdef CONFIG_MEM_SOFT_DIRTY
> -       if (pte_present(pte))
> -               pte = pte_mksoft_dirty(pte);
> -       else if (is_swap_pte(pte))
> -               pte = pte_swp_mksoft_dirty(pte);
> -#endif
> -       return pte;
> -}
> -
>  static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>                 pte_t *ptep, pte_t pte, int max_nr)
>  {
> @@ -260,7 +245,6 @@ static int move_ptes(struct pagetable_move_control *pmc,
>                 VM_WARN_ON_ONCE(!pte_none(*new_ptep));
>                 nr_ptes = 1;
> -               max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>                 old_pte = ptep_get(old_ptep);
>                 if (pte_none(old_pte))
>                         continue;
> @@ -277,24 +261,34 @@ static int move_ptes(struct pagetable_move_control *pmc,
>                  * flushed.
>                  */
>                 if (pte_present(old_pte)) {
> +                       max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>                         nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
>                                                          old_pte, max_nr_ptes);
>                         force_flush = true;
> -               }
> -               pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
> -               pte = move_pte(pte, old_addr, new_addr);
> -               pte = move_soft_dirty_pte(pte);
> -
> -               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> -                       pte_clear(mm, new_addr, new_ptep);
> -               else {
> -                       if (need_clear_uffd_wp) {
> -                               if (pte_present(pte))
> -                                       pte = pte_clear_uffd_wp(pte);
> -                               else if (is_swap_pte(pte))
> +
> +                       pte = get_and_clear_full_ptes(mm, old_addr, old_ptep,
> +                                                     nr_ptes, 0);
> +                       /*
> +                        * Moving present PTEs requires special care on some
> +                        * archs.
> +                        */
> +                       pte = move_pte(pte, old_addr, new_addr);

I guess we're good with only doing this in pte_present() case because the only
arch that implements this, sparc, does a present check anyway.

> +                       /* make userspace aware that this pte moved. */
> +                       pte = pte_mksoft_dirty(pte);
> +                       if (need_clear_uffd_wp)
> +                               pte = pte_clear_uffd_wp(pte);
> +                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
> +               } else if (need_clear_uffd_wp && pte_marker_uffd_wp(pte)) {
> +                       pte_clear(mm, old_addr, old_ptep);

Same comment as below re: pte_clear().

I see you've dropped pte_clear(mm, new_addr, new_ptep) which I guess is
purposefully?

I do think that it is pointless yes.

> +               } else {
> +                       pte_clear(mm, old_addr, old_ptep);

I guess this is intended to replace ptep_get_and_clear_full_ptes() above in the
single PTE case... no?  Is this sufficient?

In the original code we'd always do ptep_get_and_clear().

I think the key difference is page_table_check_pte_clear().

I notice, hilariously, that there is a ptep_clear() that _does_ call this. What
a mess.


> +                       if (is_swap_pte(pte)) {
> +                               if (need_clear_uffd_wp)
>                                         pte = pte_swp_clear_uffd_wp(pte);
> +                               /* make userspace aware that this pte moved. */
> +                               pte = pte_swp_mksoft_dirty(pte);
>                         }
> -                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
> +                       set_pte_at(mm, new_addr, new_ptep, pte);
>                 }
>         }
>
>
> Note that I don't know why we had the existing
>
> -               if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
> -                       pte_clear(mm, new_addr, new_ptep);
>
>
> I thought we would always expect that the destination pte is already pte_none() ?

I think this is because we already did the move_pte() call in the original code
before checking this:

		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
		pte = move_pte(pte, old_addr, new_addr);
		pte = move_soft_dirty_pte(pte);

		if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
			pte_clear(mm, new_addr, new_ptep);

But maybe it's because there was a presumption move_pte() would like you know,
move a PTE entry? Which it doesn't, it - only on SPARC - does a hook to flush
the dcache.

>
> --
> Cheers,
>
> David / dhildenb
>
