Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A1D259CAE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475720; cv=fail; b=rx8yRG5ZNXBC35NWZAkiJ3PjEl2b1FuHByeBJCdBhmsp0ArUbxHazRJqSLiorMnQ6dTrNddabPTooH8gOcDE3j9VUgJ4Y5FNMR74nG5rK3WTo70o9jnGIQzfQGEtB92lTBy5WlYqbDvLrGg8e54CCBDjf7l/g8x+v/YeLQ75HDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475720; c=relaxed/simple;
	bh=zJ0Ng+aI9NRRHOD2svL7oEpzUnIntoEmybJh2cMphaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ne/pKXEPAYZcMDzXbU8NCa05H81KUfAdOwPBb50uSBcHeR26amQeLCJnM+BvgvkC53uB1s2BsJ5z7A7sftijmzI4ofzA72QhM5oousn36TC3/+a4B3C0YcoSqlHlGQgCmF1iwbMz/AKHW9qF8O9szE8rdZoDEkRV72lqz+kJmSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P1Qu0291; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eL6fhSHm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P1Qu0291";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eL6fhSHm"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593i7Vl006323;
	Mon, 9 Jun 2025 13:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=j3vmUqu5S8cJ8P+Z3w+DYUiCjUuJozU8xlZp6bNae4w=; b=
	P1Qu0291RSF7yQWP5DE2ZhY8r7SPKgRxaOLxrtpipbiWVnhDSfqF6UxcMcoe1vhz
	TnDzbHqwdOUMZJepPsVbWFTntax4y7D/H+DvcC/C71UFPMkT6q7Z6saZK3+0OkOY
	iJ4N4+7jc+tcdxRQlYrHIU4kQnJramqKZCT9UZD2JGiMbxqI6G9/GoR8j/dAboN9
	NjGrKsyWVKme5Gm6V/sbxhXFPwRb4X3GPkixrYmRynzt2snpnuZaMVNymtCtGIE7
	p1aPNrbfPxWrj9JMY0uKSWFytG6ujqyxqQQAHu+sLuvJ2gsfX/CoaH78Ghx5R59O
	4QYGWEP/Mei+tp0jC5iddw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywt3fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559Blij4007575;
	Mon, 9 Jun 2025 13:27:04 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv76t73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bd5XkvtE88FJfNKLWOr2HqPKU0+i8kwNISud2FWNw3pBmDzzP5mWMou4Q7tE/0hoZ6PZ8xLyDMPsNg1FlrVhf9H8Yh7ZKxh/mcjekCYQRrvHsMVTdB8V15Dt/HG2rxLRsB5F3uT9rIDNlPdnv8jVkMYy5aGUC35wloZjmnWozEUrenXHRrV3dEohlDRD49pfj9np7mqClVVNkvYQJWyWQaQudafXu99wLjpg2tZ/uZdaj8YLkdj3TfXoLPx4IiKgMVOxTpZa3De6E/068vyc0CDKthHbYIfGHddj5a3HzrcTroPZiLpOa4VAF2M1XizPeuNyoB4Np9qB7R/SIyOk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3vmUqu5S8cJ8P+Z3w+DYUiCjUuJozU8xlZp6bNae4w=;
 b=gkvFIlPaj0yq0+6jdYlL2FeqgyloYmdAB2wgnUZVUy+Qqqn5csln0vPjdWYQU9mBxkW/RMN54eyutyWHNuXQI8IggbmQtF1/HQNxsJYzb2d/aULK0pGl69s5dnMqmXfOP2d5DC57x08t3jW/fh9W5uKpUo9V1CG8KA/4I2a+t96PxK+BhyON7mkTEzVy4jOZYW91vZI7AzHHU70hMpwWxCosM2+aRX7Rx2eseS8B44fw+DqbiYTVDe+0R9cb1W9pnxQ0qyMZi4CI1cma6TijRkHsPjSomadNFj5azpT5VkCYzPps8uEQRzCTo45ibqZw8+kZ0rqVwqfLz/X4r12E3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3vmUqu5S8cJ8P+Z3w+DYUiCjUuJozU8xlZp6bNae4w=;
 b=eL6fhSHmOQo+fTV29BMs/n51foM0nEArT/ur3asyRkaaooXJzRCM1PodEXlWD6Bd4N81p5G+JICPF28sjTOcoHyxgRZEfOThn8LuUysIKBTWPZHanaWVThniKbra59zTWmx3TklMhLvV69bKtA7H5tXPvj0v2fUip/r8OH7zz2Y=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DM3PR10MB7947.namprd10.prod.outlook.com (2603:10b6:0:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 13:27:01 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:00 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
Date: Mon,  9 Jun 2025 14:26:35 +0100
Message-ID: <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0135.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::14) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DM3PR10MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: de5f61a6-9770-4118-07ed-08dda75950c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bd/h3ugnfqs1I/14ZNblMrsUPqqVN8Wrbq2VKyzNiq8pEJ6Y5fsPIrafgfmG?=
 =?us-ascii?Q?RX7WYaY39Qp4G3JNN8Ywrgf/MhovBFMxfNMX7tAGAJfmanWlP2Dujgd+pr60?=
 =?us-ascii?Q?Rk4YDR0uCdMmeN7iw9M2GJmvkyT1KcTlA1oC6j34rhtCmgfshnORhIFScMRS?=
 =?us-ascii?Q?6b3rD56k2u1tMkyVKRyEmfYvSvWPT+WzpXlbgh3+mVjMc2Oloyitae+byyei?=
 =?us-ascii?Q?lV4EG5VrE6ecaj8cVgmA60jVF2iMU2fHIZxQ0Y6x8Jmv+hOZcpk2ZTLajRIu?=
 =?us-ascii?Q?PZu6qWrCAaWlmh6GbKYt6juaCAF3QTmqgZuAgCj6JXbapS0Yi/RzGuNFowQ8?=
 =?us-ascii?Q?Jybwnl/U5037Sq+u90yW5Z8IQ6kdLm7aH8H3ntP7j5ml8dgSbV2zJKw4+NTW?=
 =?us-ascii?Q?WoHLA1srk1fCEM/c2awISAplvaKOsTlgb6VlDB5URIL3ttn4EDX9QaEQTyN5?=
 =?us-ascii?Q?hLXQyTpSaXoCTV7pYz3xjGPKIQGuI437MDgNgY7j4j0Z7hz8K7+D/6XM5q9A?=
 =?us-ascii?Q?3Ywpg1Ty7VYFlCmQEsons35x923/grInV0sKz25quLFG6fMtLsp8wGTgqfjr?=
 =?us-ascii?Q?axgKePxNXo9WuCETZyeixoEfdhZHV1BIUnsgawHj2C/5BUW93g4kY4ECqtM9?=
 =?us-ascii?Q?CQDYo54lXWrH364Cmt+rD882bq1ydBhMa83h6XMcKwmDqjXuMPDYCbkQtuav?=
 =?us-ascii?Q?/EVpyaboW7fLaPHpCsUqHuR3zSkYgjnEusx7JbaF0Pmu4Tfr06Ws7OOjCTEG?=
 =?us-ascii?Q?mik0PQefkTY/b4g6T8cXnZniNsw092y6ag4Wbd5J511CsrWfLMsuiuwfbvLR?=
 =?us-ascii?Q?L4zdTxRC6Y1RLR4RlGBLpUstpoImBt2gjRwmUyB9nKemsWu6Rhm4SgHJrvQ4?=
 =?us-ascii?Q?lRdZblTQtXRArL3a4KRHRKdhscXIxx5W6f8VOtvdFxNnakkzJrFxT0Khlk3a?=
 =?us-ascii?Q?9kugtBoLkWpnT2FFBkKWlzC/4aemGh5Flncu4dXGlpOyIm9lAHpHfX5LAFqS?=
 =?us-ascii?Q?xViCk15iv9hSAHirvQWfSn0ZXwQdhIb6hDmSELWjlLUAIBWvrUdxcWndamm+?=
 =?us-ascii?Q?VUgjIGEISpqxDsppAmqNOz5k0EA62CeshSLY6dOSQ1nKQ4rqcf3ZoUfPaFHK?=
 =?us-ascii?Q?oLteF+Mgv9QHYNDxAZLO9KzfEIy6Tuemx7i7o8NK76SguhzZH5l3R+faCnD7?=
 =?us-ascii?Q?G3C4iKwFh2kAcmlxj8M+AOFK9nIpUc70Vj2oGCK+ISA5LVDTgi+9mnOBRf2o?=
 =?us-ascii?Q?9MAkk+jM+NLIkMF5IyBuJ+GfnhISF+weTUtajP7CECQ+jfw2QSoCTdbcHWXO?=
 =?us-ascii?Q?risOGNF6Z7+908O2JUcp0tcPqjQLZ5SAsr4R+KFyM4QisLAfQBZ8yDs17Wie?=
 =?us-ascii?Q?deynpGK9j9GDAoJe14fncq1h555LOiDq0a9MTxhEXCppBX9fWQMNiI6Gl+n0?=
 =?us-ascii?Q?lrsAqle3W8A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b8Y7MbotTgn7K9kKtIMwI67J8bb3H9zXh83A6wS/S/WePye9ajNYmU6OPFrx?=
 =?us-ascii?Q?DDACeqvO4itB0Kqt+YhFV4BzHxNGf27NPNEyRB37Rvl2vAOAJvahDpYRhB2G?=
 =?us-ascii?Q?qa+u6HEkPIwD1MNlkUy2yuodYwK+aBrdGLFUlI0ObJ+qATe7xAOJftXT16OP?=
 =?us-ascii?Q?u7UZJ7zNWE/lAZX5secrnSG5NI1VAJFtn+Km2JQ6QiEE5Bg3mUN9ZE51Fs+1?=
 =?us-ascii?Q?YNaaJMrqdfbUM6NmuFqYbrnO9jE8zvYfDYkxEfEUBavDdAt9x0GfM14/B2Mf?=
 =?us-ascii?Q?hxZVu9BvXU2f5reWwoBSGIjrwBZjug7HNyl5HvSKGZfYeVuzgB4PU8/TnpkU?=
 =?us-ascii?Q?oSiaWM4FkZxDkwsvAsiUnzsdC/GVf3Owk1KCClL1cAcjdxqTZ+xsXPkwAz7u?=
 =?us-ascii?Q?BxfE9V3Nfp3FZPZ8CKK0NJrpbIY+M7HNXjfuXF9SRYGdvmCkvfEQVIJabAgu?=
 =?us-ascii?Q?7Lm6SR8+7D/pojz3ow+jOQAMItDW1s9G4vc/jP6BlbI2sOzkRKB3R9IaC4lU?=
 =?us-ascii?Q?P3COkVtwV9aL883uhsGVO7bgvoJNfBmivIFNoH5Cfc2aJgan3Pr9c8rddKX7?=
 =?us-ascii?Q?IWFIBJQ9DytfAjDvahDGRalJR11Bd98l4jnrTkiXX2leP2s7tAr1cmfiy5Cs?=
 =?us-ascii?Q?kuMly+Qc+uUg4UCON9ZTrvJjZSkW+Zf04GJ23BMYpt9VF6ao8y+PXq+EVnjg?=
 =?us-ascii?Q?Qe5cBJ7e5/wzxaLYA6Tnj3lcLxak2X7WZhmh+8SxeBtRHCZy+J7xm6pvByAQ?=
 =?us-ascii?Q?EsIDJC2pXhqby+CFh8p1cEAVGRr2HU3K7bZ4dclVMWxTb5EmTD8yR+RlhpmO?=
 =?us-ascii?Q?EMAdjuObyqE4ewRMFPC47uc86fPPYK+MSvHMeSYcRHkYkLgsGEHC/UU0lLyr?=
 =?us-ascii?Q?54imU+NSrP82hRQpArGd+zv7sU5eOHdP1BrCgXEPN0BeD55zbXZRe+PYij+s?=
 =?us-ascii?Q?sRmuunDyb8IDOPmL2F/1tOyGHSGWmlJn3N8yMnKw5zew3kyhonORb1Gu9He0?=
 =?us-ascii?Q?rNxxFHaakwsJbSbh1SZf+zlqXitmao+YRCRB8QQvJ5CRICmgrpFzXKIil5nW?=
 =?us-ascii?Q?cf64Bnr/iaHTEZA5RkgWjt4SIhieYAzNZl79TxGqa5m6+MyB4nS4rm6+UflD?=
 =?us-ascii?Q?NIvC9Kw67HjBVlQvZizE17VMfBa5AAXlz4c0mr6hI47FEqcJfPP6ktaINPVR?=
 =?us-ascii?Q?TsVbW+4iLfa+eM5lMnH7rZ6c4a1O/VuutKt8uf+5hjAfBhdxCYpwrrO+eMua?=
 =?us-ascii?Q?pl7zyl2pfeQBSR84GxQIiYBiwwf3NBuIlx77PBMrl+YqN0ev2TSKW9wU+kPk?=
 =?us-ascii?Q?khuYTBgr8E/2FUCnQ5yBpt3INYlqh2kPhAM7Rq03/HdYiYcM2ETXExNCiWbv?=
 =?us-ascii?Q?uISIL+JCNUPHhy4lzllrd7WL5YBHiA+y9AQhhpLKvmO/w26S4TKv8lJd//1+?=
 =?us-ascii?Q?wfzmIqsRC+hncG2Vr1y5mIh8r2ICGK8xlqFvj8mtwhdnLWGoglAyd9eqMU6b?=
 =?us-ascii?Q?Hz2Lg6pfe1+kiuzLNK+UUldQVs3aym0ZIZESOSlfcQL5qRmZ8vualt6zl0ve?=
 =?us-ascii?Q?2zHuMOlaj028eJg6DXuxEQy2pWV5SpL9tUvHYgGiVTKpeWxsp787519LPhxJ?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eIB5kpZMMulXTfw/8zlF18Q5X81wwr5VDmGOH64MQE/D1IGBNAVN48x5nrvaLHGiE/dJJVlwUjYCGzr2PrxvzG0qbGnul5nwVd4p5C6DlnlJ16b/7qEThS48CD57uXuuBzecuYmIeS0KIgnO94gVtdkXoTvaxkoWe0gEf8MjgENxhJdHUarmkpqBAb2RrRru3Nkp4W4zUm+XmxCKId4YG5+6r1iAvWHlffkjOR600KVu2iJUBbLnc2UkYicZwk2LBmgxSuQV7ZmDXUbfGBtXoxbyvDDlwDpd5NCbpCH9/CaaW//vMazX2tykUG+rinNZpAmFm8S2e3ox9DJMmuH5X/MAb0tmYOtDJ71j6pV/MEmzLItelcz2Aq/NKpHN5nc2yR0Cryg/6c4LetcjLT7ATXer0fMmOxz9pWBpXOdzU5ZlwRzj6TNo5LRKKy04IOQLttRR7JMzFYD8i4HydIcGEd+CvDW+f5nK91q9g/4eY/gKmyAR1GkcPB0zwrETIm16WOjOt9ya6fCbtTiSNEpZMSoPYa57ozsJd6EbJkomLnqOnCA1NZYacYJR3h4QnoIohClvJdtVxyFmoXaEZJp5+mCaKd4skyvmUV1uBUl7F+Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5f61a6-9770-4118-07ed-08dda75950c6
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:00.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c46qo26q+gI0vtNaZsn0T+By1vjkzLVqXxK+66AdYECM4Ci1nZIlAgvM7L2SNXABCLfmLBSSEb+3/mTIGloGrTej2JnOH7KfK4I7u54Cr8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7947
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506090098
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=6846e129 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=xeFcnC5iRgFsLvszZ5sA:9
X-Proofpoint-ORIG-GUID: SGS_BvXk4OGs8xo-lWAV8vXJ-H1Ukhg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfX+wJ/BJyuJra/ fglwSTGCYn/VoK6C9kH7vxnKU4x5ThbxqPUEYXeoEB0HMtaTvFXUvSRmhPFH8R2jF+kDuMpMvFV oO14EZPiAKWQtvU+f2IeaIBglJ6eVrSG2S18IdsXTcPtp1pHJIMi84VnreQ+vwKrnwNF/gcBJtc
 2VyXQDaTComQeljGrSu9OkzAfOMFx6e6RYVYUTbVecwXjAVsCWT4r3KLdie5M3MpnYrW6D3bJmC 73NiTTFgb2I94JV9Anx9+CQ5Hf4oT2G7HbwygO6CJ/r4dXf3cgPcWEqfZmVGvqFlkusRRc6mTQZ OtJqOxkn3cZnLjv02LYv28OaJV4AL+wD9v96Y25O6mvCLqb5HdVKng5et3uJ2BYdS0T9asvAU5i
 fQG28xVS6NwW5acE3xXXi8Hk6oliuswo1Q05yssNzlbS+L5DEeTdPKv4Qlg6TbAhDbOoy1s9
X-Proofpoint-GUID: SGS_BvXk4OGs8xo-lWAV8vXJ-H1Ukhg0

When mremap() moves a mapping around in memory, it goes to great lengths to
avoid having to walk page tables as this is expensive and
time-consuming.

Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
page offset stored in the VMA at vma->vm_pgoff will remain the same, as
well all the folio indexes pointed at the associated anon_vma object.

This means the VMA and page tables can simply be moved and this affects the
change (and if we can move page tables at a higher page table level, this
is even faster).

While this is efficient, it does lead to big problems with VMA merging - in
essence it causes faulted anonymous VMAs to not be mergeable under many
circumstances once moved.

This is limiting and leads to both a proliferation of unreclaimable,
unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
impact on further use of mremap(), which has a requirement that the VMA
moved (which can also be a partial range within a VMA) may span only a
single VMA.

This makes the mergeability or not of VMAs in effect a uAPI concern.

In some use cases, users may wish to accept the overhead of actually going
to the trouble of updating VMAs and folios to affect mremap() moves. Let's
provide them with the choice.

This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
attempts to perform such an operation. If it is unable to do so, it cleanly
falls back to the usual method.

It carefully takes the rmap locks such that at no time will a racing rmap
user encounter incorrect or missing VMAs.

It is also designed to interact cleanly with the existing mremap() error
fallback mechanism (inverting the remap should the page table move fail).

Also, if we could merge cleanly without such a change, we do so, avoiding
the overhead of the operation if it is not required.

In the instance that no merge may occur when the move is performed, we
still perform the folio and VMA updates to ensure that future mremap() or
mprotect() calls will result in merges.

In this implementation, we simply give up if we encounter large folios. A
subsequent commit will extend the functionality to allow for these cases.

We restrict this flag to purely anonymous memory only.

we separate out the vma_had_uncowed_parents() helper function for checking
in should_relocate_anon() and introduce a new function
vma_maybe_has_shared_anon_folios() which combines a check against this and
any forked child anon_vma's.

We carefully check for pinned folios in case a caller who holds a pin might
make assumptions about index, mapping fields which we are about to
manipulate.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/rmap.h             |   4 +
 include/uapi/linux/mman.h        |   1 +
 mm/internal.h                    |   1 +
 mm/mremap.c                      | 403 +++++++++++++++++++++++++++++--
 mm/vma.c                         |  77 ++++--
 mm/vma.h                         |  36 ++-
 tools/testing/vma/vma.c          |   5 +-
 tools/testing/vma/vma_internal.h |  38 +++
 8 files changed, 520 insertions(+), 45 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index c4f4903b1088..6d2b3fbe2df0 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -147,6 +147,10 @@ static inline void anon_vma_unlock_read(struct anon_vma *anon_vma)
 	up_read(&anon_vma->root->rwsem);
 }
 
+static inline void anon_vma_assert_locked(const struct anon_vma *anon_vma)
+{
+	rwsem_assert_held(&anon_vma->root->rwsem);
+}
 
 /*
  * anon_vma helper functions.
diff --git a/include/uapi/linux/mman.h b/include/uapi/linux/mman.h
index e89d00528f2f..d0542f872e0c 100644
--- a/include/uapi/linux/mman.h
+++ b/include/uapi/linux/mman.h
@@ -9,6 +9,7 @@
 #define MREMAP_MAYMOVE		1
 #define MREMAP_FIXED		2
 #define MREMAP_DONTUNMAP	4
+#define MREMAP_RELOCATE_ANON	8
 
 #define OVERCOMMIT_GUESS		0
 #define OVERCOMMIT_ALWAYS		1
diff --git a/mm/internal.h b/mm/internal.h
index 71eaea2db9b0..e18f8dcd9794 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -46,6 +46,7 @@ struct folio_batch;
 struct pagetable_move_control {
 	struct vm_area_struct *old; /* Source VMA. */
 	struct vm_area_struct *new; /* Destination VMA. */
+	struct vm_area_struct *relocate_locked; /* VMA which is rmap locked. */
 	unsigned long old_addr; /* Address from which the move begins. */
 	unsigned long old_end; /* Exclusive address at which old range ends. */
 	unsigned long new_addr; /* Address to move page tables to. */
diff --git a/mm/mremap.c b/mm/mremap.c
index 60f6b8d0d5f0..2da064f8c898 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -71,6 +71,15 @@ struct vma_remap_struct {
 	unsigned long charged;		/* If VM_ACCOUNT, # pages to account. */
 };
 
+/* Represents local PTE state. */
+struct pte_state {
+	unsigned long old_addr;
+	unsigned long new_addr;
+	unsigned long old_end;
+	pte_t *ptep;
+	spinlock_t *ptl;
+};
+
 static pud_t *get_old_pud(struct mm_struct *mm, unsigned long addr)
 {
 	pgd_t *pgd;
@@ -139,18 +148,50 @@ static pmd_t *alloc_new_pmd(struct mm_struct *mm, unsigned long addr)
 	return pmd;
 }
 
-static void take_rmap_locks(struct vm_area_struct *vma)
+/*
+ * Determine whether the old and new VMAs share the same anon_vma. If so, this
+ * has implications around locking and to avoid deadlock we need to tread
+ * carefully.
+ */
+static bool has_shared_anon_vma(struct pagetable_move_control *pmc)
+{
+	struct vm_area_struct *vma = pmc->old;
+	struct vm_area_struct *locked = pmc->relocate_locked;
+
+	if (!locked)
+		return false;
+
+	return vma->anon_vma->root == locked->anon_vma->root;
+}
+
+static void maybe_take_rmap_locks(struct pagetable_move_control *pmc)
 {
+	struct vm_area_struct *vma;
+	struct anon_vma *anon_vma;
+
+	if (!pmc->need_rmap_locks)
+		return;
+
+	vma = pmc->old;
+	anon_vma = vma->anon_vma;
 	if (vma->vm_file)
 		i_mmap_lock_write(vma->vm_file->f_mapping);
-	if (vma->anon_vma)
-		anon_vma_lock_write(vma->anon_vma);
+	if (anon_vma && !has_shared_anon_vma(pmc))
+		anon_vma_lock_write(anon_vma);
 }
 
-static void drop_rmap_locks(struct vm_area_struct *vma)
+static void maybe_drop_rmap_locks(struct pagetable_move_control *pmc)
 {
-	if (vma->anon_vma)
-		anon_vma_unlock_write(vma->anon_vma);
+	struct vm_area_struct *vma;
+	struct anon_vma *anon_vma;
+
+	if (!pmc->need_rmap_locks)
+		return;
+
+	vma = pmc->old;
+	anon_vma = vma->anon_vma;
+	if (anon_vma && !has_shared_anon_vma(pmc))
+		anon_vma_unlock_write(anon_vma);
 	if (vma->vm_file)
 		i_mmap_unlock_write(vma->vm_file->f_mapping);
 }
@@ -204,8 +245,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	 *   serialize access to individual ptes, but only rmap traversal
 	 *   order guarantees that we won't miss both the old and new ptes).
 	 */
-	if (pmc->need_rmap_locks)
-		take_rmap_locks(vma);
+	maybe_take_rmap_locks(pmc);
 
 	/*
 	 * We don't have to worry about the ordering of src and dst
@@ -280,8 +320,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	pte_unmap(new_pte - 1);
 	pte_unmap_unlock(old_pte - 1, old_ptl);
 out:
-	if (pmc->need_rmap_locks)
-		drop_rmap_locks(vma);
+	maybe_drop_rmap_locks(pmc);
 	return err;
 }
 
@@ -539,15 +578,14 @@ static __always_inline unsigned long get_extent(enum pgt_entry entry,
  * Should move_pgt_entry() acquire the rmap locks? This is either expressed in
  * the PMC, or overridden in the case of normal, larger page tables.
  */
-static bool should_take_rmap_locks(struct pagetable_move_control *pmc,
-				   enum pgt_entry entry)
+static bool should_take_rmap_locks(enum pgt_entry entry)
 {
 	switch (entry) {
 	case NORMAL_PMD:
 	case NORMAL_PUD:
 		return true;
 	default:
-		return pmc->need_rmap_locks;
+		return false;
 	}
 }
 
@@ -559,11 +597,15 @@ static bool move_pgt_entry(struct pagetable_move_control *pmc,
 			   enum pgt_entry entry, void *old_entry, void *new_entry)
 {
 	bool moved = false;
-	bool need_rmap_locks = should_take_rmap_locks(pmc, entry);
+	bool override_locks = false;
 
-	/* See comment in move_ptes() */
-	if (need_rmap_locks)
-		take_rmap_locks(pmc->old);
+	if (!pmc->need_rmap_locks && should_take_rmap_locks(entry)) {
+		override_locks = true;
+
+		pmc->need_rmap_locks = true;
+		/* See comment in move_ptes() */
+		maybe_take_rmap_locks(pmc);
+	}
 
 	switch (entry) {
 	case NORMAL_PMD:
@@ -587,8 +629,9 @@ static bool move_pgt_entry(struct pagetable_move_control *pmc,
 		break;
 	}
 
-	if (need_rmap_locks)
-		drop_rmap_locks(pmc->old);
+	maybe_drop_rmap_locks(pmc);
+	if (override_locks)
+		pmc->need_rmap_locks = false;
 
 	return moved;
 }
@@ -754,6 +797,209 @@ static unsigned long pmc_progress(struct pagetable_move_control *pmc)
 	return old_addr < orig_old_addr ? 0 : old_addr - orig_old_addr;
 }
 
+/*
+ * If the folio mapped at the specified pte entry can have its index and mapping
+ * relocated, then do so.
+ *
+ * Returns the number of pages we have traversed, or 0 if the operation failed.
+ */
+static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
+		struct pte_state *state, bool undo)
+{
+	struct folio *folio;
+	struct vm_area_struct *old, *new;
+	pgoff_t new_index;
+	pte_t pte;
+	unsigned long ret = 1;
+	unsigned long old_addr = state->old_addr;
+	unsigned long new_addr = state->new_addr;
+
+	old = pmc->old;
+	new = pmc->new;
+
+	pte = ptep_get(state->ptep);
+
+	/* Ensure we have truly got an anon folio. */
+	folio = vm_normal_folio(old, old_addr, pte);
+	if (!folio)
+		return ret;
+
+	folio_lock(folio);
+
+	/* No-op. */
+	if (!folio_test_anon(folio) || folio_test_ksm(folio))
+		goto out;
+
+	/*
+	 * This should never be the case as we have already checked to ensure
+	 * that the anon_vma is not forked, and we have just asserted that it is
+	 * anonymous.
+	 */
+	if (WARN_ON_ONCE(folio_maybe_mapped_shared(folio)))
+		goto out;
+	/* The above check should imply these. */
+	VM_WARN_ON_ONCE(folio_mapcount(folio) > folio_nr_pages(folio));
+	VM_WARN_ON_ONCE(!PageAnonExclusive(folio_page(folio, 0)));
+
+	/*
+	 * A pinned folio implies that it will be used for a duration longer
+	 * than that over which the mmap_lock is held, meaning that another part
+	 * of the kernel may be making use of this folio.
+	 *
+	 * Since we are about to manipulate index & mapping fields, we cannot
+	 * safely proceed because whatever has pinned this folio may then
+	 * incorrectly assume these do not change.
+	 */
+	if (folio_maybe_dma_pinned(folio))
+		goto out;
+
+	/*
+	 * This should not happen as we explicitly disallow this, but check
+	 * anyway.
+	 */
+	if (folio_test_large(folio)) {
+		ret = 0;
+		goto out;
+	}
+
+	if (!undo)
+		new_index = linear_page_index(new, new_addr);
+	else
+		new_index = linear_page_index(old, old_addr);
+
+	/*
+	 * The PTL should keep us safe from unmapping, and the fact the folio is
+	 * a PTE keeps the folio referenced.
+	 *
+	 * The mmap/VMA locks should keep us safe from fork and other processes.
+	 *
+	 * The rmap locks should keep us safe from anything happening to the
+	 * VMA/anon_vma.
+	 *
+	 * The folio lock should keep us safe from reclaim, migration, etc.
+	 */
+	folio_move_anon_rmap(folio, undo ? old : new);
+	WRITE_ONCE(folio->index, new_index);
+
+out:
+	folio_unlock(folio);
+	return ret;
+}
+
+static bool pte_done(struct pte_state *state)
+{
+	return state->old_addr >= state->old_end;
+}
+
+static void pte_next(struct pte_state *state, unsigned long nr_pages)
+{
+	state->old_addr += nr_pages * PAGE_SIZE;
+	state->new_addr += nr_pages * PAGE_SIZE;
+	state->ptep += nr_pages;
+}
+
+static bool relocate_anon_ptes(struct pagetable_move_control *pmc,
+		unsigned long extent, pmd_t *pmdp, bool undo)
+{
+	struct mm_struct *mm = current->mm;
+	struct pte_state state = {
+		.old_addr = pmc->old_addr,
+		.new_addr = pmc->new_addr,
+		.old_end = pmc->old_addr + extent,
+	};
+	pte_t *ptep_start;
+	bool ret;
+	unsigned long nr_pages;
+
+	ptep_start = pte_offset_map_lock(mm, pmdp, pmc->old_addr, &state.ptl);
+	/*
+	 * We prevent faults with mmap write lock, hold the rmap lock and should
+	 * not fail to obtain this lock. Just give up if we can't.
+	 */
+	if (!ptep_start)
+		return false;
+
+	state.ptep = ptep_start;
+	for (; !pte_done(&state); pte_next(&state, nr_pages)) {
+		pte_t pte = ptep_get(state.ptep);
+
+		if (pte_none(pte) || !pte_present(pte)) {
+			nr_pages = 1;
+			continue;
+		}
+
+		nr_pages = relocate_anon_pte(pmc, &state, undo);
+		if (!nr_pages) {
+			ret = false;
+			goto out;
+		}
+	}
+
+	ret = true;
+out:
+	pte_unmap_unlock(ptep_start, state.ptl);
+	return ret;
+}
+
+static bool __relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
+{
+	pud_t *pudp;
+	pmd_t *pmdp;
+	unsigned long extent;
+	struct mm_struct *mm = current->mm;
+
+	if (!pmc->len_in)
+		return true;
+
+	for (; !pmc_done(pmc); pmc_next(pmc, extent)) {
+		pmd_t pmd;
+		pud_t pud;
+
+		extent = get_extent(NORMAL_PUD, pmc);
+
+		pudp = get_old_pud(mm, pmc->old_addr);
+		if (!pudp)
+			continue;
+		pud = pudp_get(pudp);
+
+		if (pud_trans_huge(pud) || pud_devmap(pud))
+			return false;
+
+		extent = get_extent(NORMAL_PMD, pmc);
+		pmdp = get_old_pmd(mm, pmc->old_addr);
+		if (!pmdp)
+			continue;
+		pmd = pmdp_get(pmdp);
+
+		if (is_swap_pmd(pmd) || pmd_trans_huge(pmd) ||
+		    pmd_devmap(pmd))
+			return false;
+
+		if (pmd_none(pmd))
+			continue;
+
+		if (!relocate_anon_ptes(pmc, extent, pmdp, undo))
+			return false;
+	}
+
+	return true;
+}
+
+static bool relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
+{
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long new_addr = pmc->new_addr;
+	bool ret;
+
+	ret = __relocate_anon_folios(pmc, undo);
+
+	/* Reset state ready for retry. */
+	pmc->old_addr = old_addr;
+	pmc->new_addr = new_addr;
+
+	return ret;
+}
+
 unsigned long move_page_tables(struct pagetable_move_control *pmc)
 {
 	unsigned long extent;
@@ -1134,6 +1380,67 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 	}
 }
 
+/*
+ * Should we attempt to relocate anonymous folios to the location that the VMA
+ * is being moved to by updating index and mapping fields accordingly?
+ */
+static bool should_relocate_anon(struct vma_remap_struct *vrm,
+	struct pagetable_move_control *pmc)
+{
+	struct vm_area_struct *old = vrm->vma;
+
+	/* Currently we only do this if requested. */
+	if (!(vrm->flags & MREMAP_RELOCATE_ANON))
+		return false;
+
+	/* We can't deal with special or hugetlb mappings. */
+	if (old->vm_flags & (VM_SPECIAL | VM_HUGETLB))
+		return false;
+
+	/* We only support anonymous mappings. */
+	if (!vma_is_anonymous(old))
+		return false;
+
+	/* If no folios are mapped, then no need to attempt this. */
+	if (!old->anon_vma)
+		return false;
+
+	/* We don't allow relocation of non-exclusive folios. */
+	if (vma_maybe_has_shared_anon_folios(old))
+		return false;
+
+	/* Otherwise, we're good to go! */
+	return true;
+}
+
+static void lock_new_anon_vma(struct vm_area_struct *new_vma)
+{
+	/*
+	 * We have a new VMA to reassign folios to. We take a lock on
+	 * its anon_vma so reclaim doesn't fail to unmap mappings.
+	 *
+	 * We have acquired a VMA write lock by now (in vma_link()), so
+	 * we do not have to worry about racing faults.
+	 *
+	 * NOTE: we do NOT need to acquire an rmap lock on the old VMA,
+	 * as forks require an mmap write lock, which we hold.
+	 */
+	anon_vma_lock_write(new_vma->anon_vma);
+
+	/*
+	 * lockdep is unable to differentiate between the anon_vma lock we take
+	 * in the old VMA and the one we are taking here in the new VMA.
+	 *
+	 * In each instance where the old VMA might have its anon_vma
+	 * lock taken, we explicitly check to ensure they are not one
+	 * and the same, avoiding deadlock.
+	 *
+	 * Express this to lockdep through a subclass.
+	 */
+	lock_set_subclass(&new_vma->anon_vma->root->rwsem.dep_map, 1,
+			  _THIS_IP_);
+}
+
 /*
  * Copy vrm->vma over to vrm->new_addr possibly adjusting size as part of the
  * process. Additionally handle an error occurring on moving of page tables,
@@ -1153,9 +1460,11 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	struct vm_area_struct *new_vma;
 	int err = 0;
 	PAGETABLE_MOVE(pmc, NULL, NULL, vrm->addr, vrm->new_addr, vrm->old_len);
+	bool relocate_anon = should_relocate_anon(vrm, &pmc);
 
+again:
 	new_vma = copy_vma(&vma, vrm->new_addr, vrm->new_len, new_pgoff,
-			   &pmc.need_rmap_locks);
+			   &pmc.need_rmap_locks, &relocate_anon);
 	if (!new_vma) {
 		vrm_uncharge(vrm);
 		*new_vma_ptr = NULL;
@@ -1165,12 +1474,59 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	pmc.old = vma;
 	pmc.new = new_vma;
 
+	if (relocate_anon) {
+		lock_new_anon_vma(new_vma);
+		pmc.relocate_locked = new_vma;
+
+		if (!relocate_anon_folios(&pmc, /* undo= */false)) {
+			unsigned long start = new_vma->vm_start;
+			unsigned long size = new_vma->vm_end - start;
+
+			/* Undo if fails. */
+			relocate_anon_folios(&pmc, /* undo= */true);
+			vrm_stat_account(vrm, vrm->new_len);
+
+			anon_vma_unlock_write(new_vma->anon_vma);
+			pmc.relocate_locked = NULL;
+
+			do_munmap(current->mm, start, size, NULL);
+			relocate_anon = false;
+			goto again;
+		}
+	}
+
 	moved_len = move_page_tables(&pmc);
 	if (moved_len < vrm->old_len)
 		err = -ENOMEM;
 	else if (vma->vm_ops && vma->vm_ops->mremap)
 		err = vma->vm_ops->mremap(new_vma);
 
+	if (unlikely(err && relocate_anon)) {
+		relocate_anon_folios(&pmc, /* undo= */true);
+		anon_vma_unlock_write(new_vma->anon_vma);
+		pmc.relocate_locked = NULL;
+	} else if (relocate_anon /* && !err */) {
+		unsigned long addr = vrm->new_addr;
+		unsigned long end = addr + vrm->new_len;
+		VMA_ITERATOR(vmi, vma->vm_mm, addr);
+		VMG_VMA_STATE(vmg, &vmi, NULL, new_vma, addr, end);
+		struct vm_area_struct *merged;
+
+		/*
+		 * Now we have successfully copied page tables and set up
+		 * folios, we can safely drop the anon_vma lock.
+		 */
+		anon_vma_unlock_write(new_vma->anon_vma);
+		pmc.relocate_locked = NULL;
+
+		/* Let's try merge again... */
+		vmg.prev = vma_prev(&vmi);
+		vma_next(&vmi);
+		merged = vma_merge_existing_range(&vmg);
+		if (merged)
+			new_vma = merged;
+	}
+
 	if (unlikely(err)) {
 		PAGETABLE_MOVE(pmc_revert, new_vma, vma, vrm->new_addr,
 			       vrm->addr, moved_len);
@@ -1483,7 +1839,8 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 	unsigned long flags = vrm->flags;
 
 	/* Ensure no unexpected flag values. */
-	if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP))
+	if (flags & ~(MREMAP_FIXED | MREMAP_MAYMOVE | MREMAP_DONTUNMAP |
+		      MREMAP_RELOCATE_ANON))
 		return -EINVAL;
 
 	/* Start address must be page-aligned. */
@@ -1498,6 +1855,10 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
 	if (!PAGE_ALIGN(vrm->new_len))
 		return -EINVAL;
 
+	/* We can't relocate without allowing a move. */
+	if ((flags & MREMAP_RELOCATE_ANON) && !(flags & MREMAP_MAYMOVE))
+		return -EINVAL;
+
 	/* Remainder of checks are for cases with specific new_addr. */
 	if (!vrm_implies_new_addr(vrm))
 		return 0;
diff --git a/mm/vma.c b/mm/vma.c
index 01b1d26d87b4..326cfec70f9c 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -62,22 +62,6 @@ struct mmap_state {
 		.state = VMA_MERGE_START,				\
 	}
 
-/*
- * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
- * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
- * would mean a wider range of folios sharing the root anon_vma lock, and thus
- * potential lock contention, we do not wish to encourage merging such that this
- * scales to a problem.
- */
-static bool vma_had_uncowed_parents(struct vm_area_struct *vma)
-{
-	/*
-	 * The list_is_singular() test is to avoid merging VMA cloned from
-	 * parents. This can improve scalability caused by anon_vma lock.
-	 */
-	return vma && vma->anon_vma && !list_is_singular(&vma->anon_vma_chain);
-}
-
 static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_next)
 {
 	struct vm_area_struct *vma = merge_next ? vmg->next : vmg->prev;
@@ -801,8 +785,7 @@ static bool can_merge_remove_vma(struct vm_area_struct *vma)
  * - The caller must hold a WRITE lock on the mm_struct->mmap_lock.
  * - vmi must be positioned within [@vmg->middle->vm_start, @vmg->middle->vm_end).
  */
-static __must_check struct vm_area_struct *vma_merge_existing_range(
-		struct vma_merge_struct *vmg)
+struct vm_area_struct *vma_merge_existing_range(struct vma_merge_struct *vmg)
 {
 	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *prev = vmg->prev;
@@ -1803,7 +1786,7 @@ int vma_link(struct mm_struct *mm, struct vm_area_struct *vma)
  */
 struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	unsigned long addr, unsigned long len, pgoff_t pgoff,
-	bool *need_rmap_locks)
+	bool *need_rmap_locks, bool *relocate_anon)
 {
 	struct vm_area_struct *vma = *vmap;
 	unsigned long vma_start = vma->vm_start;
@@ -1837,7 +1820,19 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	vmg.middle = NULL; /* New VMA range. */
 	vmg.pgoff = pgoff;
 	vmg.next = vma_iter_next_rewind(&vmi, NULL);
+
 	new_vma = vma_merge_new_range(&vmg);
+	if (*relocate_anon) {
+		/*
+		 * If merge succeeds, no need to relocate. Otherwise, reset
+		 * pgoff for newly established VMA which we will relocate folios
+		 * to.
+		 */
+		if (new_vma)
+			*relocate_anon = false;
+		else
+			pgoff = addr >> PAGE_SHIFT;
+	}
 
 	if (new_vma) {
 		/*
@@ -1868,7 +1863,9 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 		vma_set_range(new_vma, addr, addr + len, pgoff);
 		if (vma_dup_policy(vma, new_vma))
 			goto out_free_vma;
-		if (anon_vma_clone(new_vma, vma))
+		if (*relocate_anon)
+			new_vma->anon_vma = NULL;
+		else if (anon_vma_clone(new_vma, vma))
 			goto out_free_mempol;
 		if (new_vma->vm_file)
 			get_file(new_vma->vm_file);
@@ -1876,6 +1873,21 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 			new_vma->vm_ops->open(new_vma);
 		if (vma_link(mm, new_vma))
 			goto out_vma_link;
+		/*
+		 * If we're attempting to relocate anonymous VMAs, we
+		 * don't want to reuse an anon_vma as set by
+		 * vm_area_dup(), or copy anon_vma_chain or anything
+		 * like this.
+		 */
+		if (*relocate_anon && __anon_vma_prepare(new_vma)) {
+			/*
+			 * We have already linked this VMA, so we must now unmap
+			 * it to unwind this. This is best effort.
+			 */
+			do_munmap(mm, addr, len, NULL);
+			return NULL;
+		}
+
 		*need_rmap_locks = false;
 	}
 	return new_vma;
@@ -3153,7 +3165,6 @@ int __vm_munmap(unsigned long start, size_t len, bool unlock)
 	return ret;
 }
 
-
 /* Insert vm structure into process list sorted by address
  * and into the inode's i_mmap tree.  If vm_file is non-NULL
  * then i_mmap_rwsem is taken here.
@@ -3195,3 +3206,27 @@ int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
 
 	return 0;
 }
+bool vma_maybe_has_shared_anon_folios(struct vm_area_struct *vma)
+{
+	struct anon_vma *anon_vma = vma->anon_vma;
+	unsigned long expected_children;
+
+	/* Trivially fine. */
+	if (!anon_vma)
+		return false;
+
+	/* Currently or previously shares unCoW'd memory with parent(s). */
+	if (vma_had_uncowed_parents(vma))
+		return true;
+
+	/* mmap lock is sufficient as it would prevent num_children changing. */
+	if (!rwsem_is_locked(&vma->vm_mm->mmap_lock))
+		anon_vma_assert_locked(anon_vma);
+
+	expected_children = 0;
+	/* The root anon_vma is self-parented. */
+	if (anon_vma == anon_vma->root)
+		expected_children++;
+
+	return anon_vma->num_children > expected_children;
+}
diff --git a/mm/vma.h b/mm/vma.h
index 0db066e7a45d..f976da8f1b76 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -274,6 +274,9 @@ __must_check struct vm_area_struct
 __must_check struct vm_area_struct
 *vma_merge_new_range(struct vma_merge_struct *vmg);
 
+__must_check struct vm_area_struct
+*vma_merge_existing_range(struct vma_merge_struct *vmg);
+
 __must_check struct vm_area_struct
 *vma_merge_extend(struct vma_iterator *vmi,
 		  struct vm_area_struct *vma,
@@ -294,7 +297,7 @@ int vma_link(struct mm_struct *mm, struct vm_area_struct *vma);
 
 struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	unsigned long addr, unsigned long len, pgoff_t pgoff,
-	bool *need_rmap_locks);
+	bool *need_rmap_locks, bool *relocate_anon);
 
 struct anon_vma *find_mergeable_anon_vma(struct vm_area_struct *vma);
 
@@ -512,6 +515,37 @@ struct vm_area_struct *vma_iter_next_rewind(struct vma_iterator *vmi,
 	return next;
 }
 
+/*
+ * Is this VMA either the parent of forked processes or the child of a forking
+ * process which may possess an unCOW'd reference to a shared folio?
+ */
+bool vma_maybe_has_shared_anon_folios(struct vm_area_struct *vma);
+
+/*
+ * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
+ * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
+ * would mean a wider range of folios sharing the root anon_vma lock, and thus
+ * potential lock contention, we do not wish to encourage merging such that this
+ * scales to a problem.
+ *
+ * Assumes VMA is locked.
+ */
+static inline bool vma_had_uncowed_parents(struct vm_area_struct *vma)
+{
+	/*
+	 * The list_is_singular() test is to avoid merging VMA cloned from
+	 * parents. This can improve scalability caused by anon_vma lock.
+	 */
+	return vma && vma->anon_vma && !list_is_singular(&vma->anon_vma_chain);
+}
+
+/*
+ * If, at any point, folios mapped by the VMA had unCoW'd mappings potentially
+ * present in child processes forked from this one, then the underlying mapped
+ * folios may be non-exclusively mapped.
+ */
+bool vma_had_uncowed_children(struct vm_area_struct *vma);
+
 #ifdef CONFIG_64BIT
 
 static inline bool vma_is_sealed(struct vm_area_struct *vma)
diff --git a/tools/testing/vma/vma.c b/tools/testing/vma/vma.c
index 2be7597a2ac2..238acd4e20fd 100644
--- a/tools/testing/vma/vma.c
+++ b/tools/testing/vma/vma.c
@@ -1551,13 +1551,14 @@ static bool test_copy_vma(void)
 	unsigned long flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
 	struct mm_struct mm = {};
 	bool need_locks = false;
+	bool relocate_anon = false;
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vm_area_struct *vma, *vma_new, *vma_next;
 
 	/* Move backwards and do not merge. */
 
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, flags);
-	vma_new = copy_vma(&vma, 0, 0x2000, 0, &need_locks);
+	vma_new = copy_vma(&vma, 0, 0x2000, 0, &need_locks, &relocate_anon);
 	ASSERT_NE(vma_new, vma);
 	ASSERT_EQ(vma_new->vm_start, 0);
 	ASSERT_EQ(vma_new->vm_end, 0x2000);
@@ -1570,7 +1571,7 @@ static bool test_copy_vma(void)
 
 	vma = alloc_and_link_vma(&mm, 0, 0x2000, 0, flags);
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x8000, 6, flags);
-	vma_new = copy_vma(&vma, 0x4000, 0x2000, 4, &need_locks);
+	vma_new = copy_vma(&vma, 0x4000, 0x2000, 4, &need_locks, &relocate_anon);
 	vma_assert_attached(vma_new);
 
 	ASSERT_EQ(vma_new, vma_next);
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 77b2949d874a..636dd94ebdf0 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -26,6 +26,7 @@
 #include <linux/mm.h>
 #include <linux/rbtree.h>
 #include <linux/refcount.h>
+#include <linux/rwsem.h>
 
 extern unsigned long stack_guard_gap;
 #ifdef CONFIG_MMU
@@ -196,6 +197,8 @@ struct anon_vma {
 	struct anon_vma *root;
 	struct rb_root_cached rb_root;
 
+	unsigned long num_children;
+
 	/* Test fields. */
 	bool was_cloned;
 	bool was_unlinked;
@@ -251,6 +254,8 @@ struct mm_struct {
 	unsigned long def_flags;
 
 	unsigned long flags; /* Must use atomic bitops to access */
+
+	struct rw_semaphore mmap_lock;
 };
 
 struct vm_area_struct;
@@ -1401,6 +1406,17 @@ static inline int ksm_execve(struct mm_struct *mm)
 	return 0;
 }
 
+static int do_munmap(struct mm_struct *mm, unsigned long start, size_t len,
+		struct list_head *uf)
+{
+	(void)mm;
+	(void)start;
+	(void)len;
+	(void)uf;
+
+	return 0;
+}
+
 static inline void ksm_exit(struct mm_struct *mm)
 {
 	(void)mm;
@@ -1479,4 +1495,26 @@ static inline vm_flags_t ksm_vma_flags(const struct mm_struct *, const struct fi
 	return vm_flags;
 }
 
+static inline int rwsem_is_locked(struct rw_semaphore *sem)
+{
+	(void)sem;
+
+	return 0;
+}
+
+static inline void anon_vma_lock_read(struct anon_vma *anon_vma)
+{
+	(void)anon_vma;
+}
+
+static inline void anon_vma_unlock_read(struct anon_vma *anon_vma)
+{
+	(void)anon_vma;
+}
+
+static inline void anon_vma_assert_locked(const struct anon_vma *anon_vma)
+{
+	(void)anon_vma;
+}
+
 #endif	/* __MM_VMA_INTERNAL_H */
-- 
2.49.0

