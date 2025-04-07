Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA75D229B10
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023766; cv=fail; b=k3eNdzI9lqf1uW4uobmL/QzUMz86Y5PELyvqORqkyMdqSxR8X0E9PpTghM65iyfHoyKYH8BgRvFzr9aNCi3wPh7bIkEUvRTw+MthDkYHqB1GM75Xw5uW6UO0/zhfsDZhyspDmRm9kABI9i4PdECY/gN/YcxvEar+kHIEEQaY3Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023766; c=relaxed/simple;
	bh=Bx6Y4hXkUideNpTFBtPVjBUoU7LjqAXshCAkSfq01+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YvaPXFlz7kE5HBitY9ItCIn+DNFPtnLFFRcut1SZWrbqao71B45vtWsH8u/ZZLs70K/2W2fKNTsOvHg8afTJR8JSP15J4eRUglJ8ZJjFVPHjEfzEq4bbvtOdWfQJzXnyUhZdj7E2ckpDe/peMoexgLqgwpW1nAIirWtYzsma7Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aRX689Z3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gRJgM1XT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aRX689Z3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gRJgM1XT"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376Y4iF029143;
	Mon, 7 Apr 2025 11:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=q3IXLkJjgDZtRgiUf/
	NJEBFnmUCRWW+Lq1C3mL9w8oQ=; b=aRX689Z3QSo8YY9s3slZnTkoGRvJVHSrNr
	Xh0EwZ04WxyTkzjM+Ad7fuKQsb7cpLkfDA7tZwA/ckz2BXP1ZBhsiCXYG0LBOEaj
	mQuL0KeH9beDc1O5NcV6rSus1Naplsf2EiA7RV5FOnQMa8i2v7Kq3kmgY/nqvpdt
	mt+UdhL6rtbfYHtyq3Cwv5CZ5o+v/SZw63cEZQrCpU5zYfD8f7F1/bp9dMR5qcZP
	uHRtaw+wtmb92ZPRl+hA9iGZrne9KPNwEicDcK5M6I1iUXvJV3BBi6chh47JKj+5
	HrsjI1RasDDHrNMcE7/sKYbmwlltfXyRNnuP8awbscN6WtesJH/Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tu41ab0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 11:02:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537AbIQw001286;
	Mon, 7 Apr 2025 11:02:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty7mq7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 11:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mj2iG4HGb1QnkeZkZ0CcYqbx9r3uPHHrig0jEVhYBZ61SjO3Wqk+Qi74ril+4m0ZQz0oRLR4sRUj+BbeTHD1beQ4DlXrGqWZgwLG8QZ1f7HujMhNNjZZDTK26D/FG7dxExHU7pri7Eai56yCzPkE83sa4yNF90dnWIVDRsDjthIoDaCGocYObMa6rlKMiVjh1H5IdSNyb1JW3iBr/gEGLPxp8ODk1lLPVNXZLDGFk3ZrgJbnNAUx1wGRtnU0JWythC8/6Bfp6yhYVxCmvnIgtkCn1vRfmYoZGiX9O+7qJAnPsbnlyHIdgyKaOqMTbh0h6bJNa94RJ1rN8vcO6aSn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3IXLkJjgDZtRgiUf/NJEBFnmUCRWW+Lq1C3mL9w8oQ=;
 b=ZswTaxttUDkQZUxcLMc4jjZAttNh1mr2GWvHm7wRPF3cY7lpc1+0p2nIHZwu0J7V6FWDTqDluGvZ6uP7BJaem/g8qHPD7dpECCxCpDuJofrQeqgcCD2fcqjgxAVjutiZPNzYlypLG4/x7TV1lWfbi6HWRiP1KyAMxShYy8b5U4F1hHLi3OVlvn3rfFsTUJ5i2b58kjfqUlfOOwC5UUT+3oj4LGb++xRwMJZ28DMxncQ01wFRsuJZxOrAIej2PlTvJQtXV05OcodcCCIHrYS4MEONL44HGBhdAb+c6Gtpi7F3Q9cBGU6bjqUnorfcWU2AJN/aHSxtxB5cf/Bul0dnWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3IXLkJjgDZtRgiUf/NJEBFnmUCRWW+Lq1C3mL9w8oQ=;
 b=gRJgM1XTFkLgwAtTfaEhlSCRTFAicxS+oA5pA263mzOhkGjlr+uAj/O9efm1zRP2LDXgN5VNvyCGce6kDYKPTjd0O2qH0YMgRteH4xfmFKh2+JiwJcst59ddVcuwTYJjIJkDT0aiA9ERX4AbZHv2UEJXRZq3d5GVqQrohAbInhA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB8055.namprd10.prod.outlook.com (2603:10b6:8:1fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 11:02:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 11:02:03 +0000
Date: Mon, 7 Apr 2025 12:02:00 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] tools/testing/selftests: assert that anon merge
 cases behave as expected
Message-ID: <4a8a1163-a7f9-4368-98e1-f79b0411aac4@lucifer.local>
References: <cover.1742245056.git.lorenzo.stoakes@oracle.com>
 <e9e016392b6ceb5c58a868439fd7039e31bfda18.1742245056.git.lorenzo.stoakes@oracle.com>
 <20250407025455.67nhchndedotn57g@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407025455.67nhchndedotn57g@master>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: a79d77fb-bc53-4c3d-9715-08dd75c3a0d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CMXYLe00bGTPZg0EOpyn2o4rRwszpSoG4u+PvJ4yGWaaubkIWCsuWmJyei3+?=
 =?us-ascii?Q?ISdtsoCevseB9xKnkeVGAm/sU7UCqQpsK2SkXoGQWjmvbSLl0hbpPVaPU198?=
 =?us-ascii?Q?kV0X3/gH0dHXEyfOsr0ObT1PSt5nYI7Kqm9gLl5q/RsGwYFoyfmC2+kSIzqW?=
 =?us-ascii?Q?HEn0+KDIxTj4RPPuSQFtDva7OIq6zN7iCQ2U5RbdYI47/vO0LBhOOFZynPxv?=
 =?us-ascii?Q?TUS+4JpJhCwx+gs0GhiWcppT/0Y2GG2FSrZqfCyEHN6JC8o5ynAOCG7iLlb7?=
 =?us-ascii?Q?bPvghOOuqTx32SGwRlDN70NAE0SUOV9/MnwiyxfSH5hSZIi3mwVarvBCB+30?=
 =?us-ascii?Q?wSMBBBSQ/+ZtVrgdwN313gvkn/nuK0iVHsqqLc78Q5wv3NE3Sj7IHgpkiNuv?=
 =?us-ascii?Q?GVz1uAsx/Wdg+9jTt7yGioNm7OPEH870jeUFOzodByB+Sgz2y1Lm1OAyVx+h?=
 =?us-ascii?Q?EtXMhQfrfodrO+uZim7XM5y1bYBFXtPUcj1Ff/UxOpr8e260ZbXUOKy6bS29?=
 =?us-ascii?Q?UVe7L05MRguVAJM/9Z4pAxkjl5zspn4AVoG9g6tpuG6nQdvlNnjq1GVVnAsg?=
 =?us-ascii?Q?buEln72IUsHirvF7S7X4JhnrN+2z+CIuTdIrClW22nue867xSfD91xoP6Uue?=
 =?us-ascii?Q?wQ1Ln5pffFMqJhwQUQ3HAQMNTRGQqittovpRplEiK4SBpBLL9ckUMOIzyd2z?=
 =?us-ascii?Q?x4ibJgOuxGF/vJs6g6pyHnr8JAwza5xc9/0i2/ZF8YlFRbcZb8zb4WmVDNC4?=
 =?us-ascii?Q?KHKX/QZSw1VH2gbll1SNopXflVUOpbb1gURcSLT3pac3WytS81NjAkCZDvrw?=
 =?us-ascii?Q?neWWmWTxA0usfeglwOu2MACKA9j6YHjzuLqFWwKtdIRBR/ikecnUr0FaSu/T?=
 =?us-ascii?Q?ITvYJ1FKkhdV8rzZUctlnfivKpxt1tzZXDaVMZmWEHiBzz4znJVZWUTKL8vQ?=
 =?us-ascii?Q?ulPYG31fU66qObLZlH0Lk5Tu5IJemkSOtQfoCzr4PQuGdqSXC+G7QnIl8i+s?=
 =?us-ascii?Q?YsiP3UoXVnlJ4a5fMZYVPfAb7afUNQodhinX9miCpoawPGA2iSKOMOd3MHkw?=
 =?us-ascii?Q?wWZqWE9IYrSEow/s9ayN2/wNk8xUXvaW+kK9fJg7TJLonyNZEbJjTcj354v6?=
 =?us-ascii?Q?PcKpkXFyKqrrF5brzG25PqYMqWVayzuBDTpNvC5iur79NhL6ICCC9R8/tbY5?=
 =?us-ascii?Q?h27diBHze6mPANeQ/AIZUB314CHCbF7ag5oHZ1G3Rc50Q1hbFOWke4+w67wj?=
 =?us-ascii?Q?dLUXuwBFkV8pZVWN0gDKruSkjDo9CppLNeMTJgmKr6vL95QdicTNGCos5g+L?=
 =?us-ascii?Q?fmFc6OXVBB5nNJ7xJ/5WHvIBHKVl+gl3f+Mew3ALp7DjAsMK6QLLqCvjFTgg?=
 =?us-ascii?Q?+MR7Sy1szOVxcTJEBYinCsjT9lNi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QeuAdO8G9Vr9XFifrAQOCIkFF0s3mpc7IWMhQKUd94EQdaiwz7QdHXTu36jQ?=
 =?us-ascii?Q?x969M8zFEMsoaGlTmmEIem5mowoaMQE8ThlI1LeeG3IMbvEELZ0E03QL0gve?=
 =?us-ascii?Q?zFSlsH1lmE4LSBedC0D6R1M/tVuvST9IkY4UXNJcojxyK/y71J2kmrSrSN6Q?=
 =?us-ascii?Q?1P0cUujTT5JAxyepWYG8HL3WBWcC4at9rmeaitcq/nUCSQ1fVTl3sVyaomdN?=
 =?us-ascii?Q?INdO3oVMX1rOp3S42fIyreX0X0MINruc6LMlwoT4DhPxcFaseRDf+4135MU9?=
 =?us-ascii?Q?J8a5NmYePFiwxdFYg9xjF3JRQjjON2Lz4OZ3KCd2w9rQ0d+DnDCUikTVc8dO?=
 =?us-ascii?Q?MAD7Qyt2wuT7gp/JcKT7xz8RK1fYRwTCVUmiSEL/Eyco9sJex87u3htLUmCJ?=
 =?us-ascii?Q?vjYv+R3AxH1QB7TKDK/FaT1a7FnGQ28f57vBtUodk8pjU/lIjhptCU4qGNX0?=
 =?us-ascii?Q?tCPhj8mEnJlx7av2kbFOwfyzKvnrUpKPqnx1NSL084ixZ/ZVEpbea/20Tlcg?=
 =?us-ascii?Q?mYFzKLM+RlswYEOj7NZ0OrRg3n8xHxntxJiBpxdYMlaWz43jW6Ppr4aZF3CF?=
 =?us-ascii?Q?H+zZ98b6+FXVsrXv9r+POwWWDJedG2flag6nmwsCpQ5bGKTjO+u29lPmqfMy?=
 =?us-ascii?Q?PiFwRDjNXuC8s6jgPlHEW4zDS336iG/lviaUYfIUuY+728hXO5lsKdq+mlVK?=
 =?us-ascii?Q?EM/Gisi+YjoYbEHK2b2tVmM396Vbew8CiJHlpp1wg6wgNy/653IyyW2KP4qZ?=
 =?us-ascii?Q?L5w4d8IENnl3SA5Q+1Kxks88dWLhmS1PhY06zYfUpI5IAwkkQYihdO4jAt0V?=
 =?us-ascii?Q?FlKM0y/EO+tdSX9w2aWiYJsP6Z6rGcUsitcATKKBsUHei3C/4yRxkh7pN+uM?=
 =?us-ascii?Q?gb08XlgEz7hwBTpyjPpQ73MfRpjp+F7nWyWIz6+MKjzdyL7qcTD5KlXbNgUL?=
 =?us-ascii?Q?vTn3DlhlQc++l/KrdQPHVd4Rei07sB7/YdERWtyoEIUBqpbzB+S7g3bumD5v?=
 =?us-ascii?Q?0f5YABpS8ZEtfcpFXf2fMnesKcTHCWwk8EYTJo0UsYY9D/9eGDUx0oFUFLvx?=
 =?us-ascii?Q?F6rnfodb/5tLtA0374l6JnM+myMpdHN0cUIT7GkXXjLbztqytIYoGu5MVczz?=
 =?us-ascii?Q?jTumZZj/mQfvvj7hueLLm76qo6CyYlY+nYfyMnLqeWYspwbygLndK5fhTDOq?=
 =?us-ascii?Q?ayHiIeauu/biQ9BbsKvOh34tWJJk7DQfg0J8/dshXdHlycte4qXOG4/I+Lgo?=
 =?us-ascii?Q?lSehVxv7HJ4emVCBcHlucYtJP9hT+edVc5C/QxrA9sivzVczBSgxzVtgTLdr?=
 =?us-ascii?Q?I7MAeFh43hshmxJzre7rFe73GCiYnGcp/VkXVECUwWRXviVyHGI0WZuKsqEQ?=
 =?us-ascii?Q?u7J8kZM5ddZtBxEThVmuSRSasDhE+uBtMnxIBfiVzU18dyqcz4rGAP1r5Xpn?=
 =?us-ascii?Q?treGXr2On6SNkfbK49UZKsfxAb05kJfDun2A1Nmamw2mrYnQkj2fn6RWpqnX?=
 =?us-ascii?Q?qa90IF9oPhVjFlmOxkiQC6Vi9ln+7V7o1wbI0N2sLEbiiCMLsp7j6j55bqA8?=
 =?us-ascii?Q?BvnJ0AypinjCsWXcMdk1HqaUWls+ZnjxdNwayPI5d7UdB3UybvrcdLKp8zqv?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jrBODNA1UkISe8eXMeyhgSq+AiHA4cwKnAIPCtJ2auFhfJZ+/HDtAnbcaGqmpsW6MxL4rJ+2Z4H+jzAySa3D6aEeppxE8LlAYHaao4zpNoenwJx7peObV7ymeRmiFO3AQ4lox3cS4W14prniho12tLhWpddzrWGD6NvXNIP/XFHuL3sECaWXRDoJe7Cz+jXOs49oXSRU0QzlwoH5laJaSbyPZ0pGEQvanF8G9qEHUbLmcE2hSJZnafIMEtx/HU1ZEnD984Lx56g35Aut44UDBAu9aBA0sCBPvzGby2UcNMzsFgLeKPzUt3QYLqjs9hYpV14gdt9L+Zj9q+9/Af+69qotazqTQGeWZBcRgsR5yBRHDOlgHh3WcEsgYp0CqPGDzEXN7AyUVg5i2NUct/jUiXW9cgbCTv7NQUqxu8UNyVIBmAi7E3L/3BQpBYUxaxasQbf8YCqmV+aI142nn1jjn24mIuI/jDsPOzpyS8bE5J5YiX3h1TFftfxt0hDlOlJeV6D1Du89fzB5TU2R6+imXo86LCIeYhzWGIpe4/hCK9LtkqdgGS9mp8jV+w+XtR4HeM8ZlXIkOhsqmndU2LBaoTffywDwn2x+9jwh5OjJYm0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79d77fb-bc53-4c3d-9715-08dd75c3a0d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 11:02:03.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKAepdQEvco9p2d3K/SHDbPVr5yQIxwil8jCwLxygZUWrQz/ovam/BSEyYz/RfftKGPJKcPMZYnliwNHqJLVO1U+uturITQwZedLcf/DwKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504070078
X-Proofpoint-ORIG-GUID: JT7pxpWuFaZllnl4m9XDHqnV2E4771D-
X-Proofpoint-GUID: JT7pxpWuFaZllnl4m9XDHqnV2E4771D-

I know you mean well Wei,

But drive-by extremely pedantic review on minor details isn't really
useful. I can't tell you not to do this, but I can at least ask. I don't
think this is a great use of either of our time.

Thanks.

On Mon, Apr 07, 2025 at 02:54:56AM +0000, Wei Yang wrote:
> On Mon, Mar 17, 2025 at 09:15:05PM +0000, Lorenzo Stoakes wrote:
> >Prior to the recently applied commit that permits this merge,
> >mprotect()'ing a faulted VMA, adjacent to an unfaulted VMA, such that the
> >two share characteristics would fail to merge due to what appear to be
> >unintended consequences of commit 965f55dea0e3 ("mmap: avoid merging cloned
> >VMAs").
> >
> >Now we have fixed this bug, assert that we can indeed merge anonymous VMAs
> >this way.
> >
> >Also assert that forked source/target VMAs are equally
> >rejected. Previously, all empty target anon merges with one VMA faulted and
> >the other unfaulted would be rejected incorrectly, now we ensure that
> >unforked merge, but forked do not.
> >
> >Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >---
> > tools/testing/selftests/mm/.gitignore     |   1 +
> > tools/testing/selftests/mm/Makefile       |   1 +
> > tools/testing/selftests/mm/merge.c        | 454 ++++++++++++++++++++++
> > tools/testing/selftests/mm/run_vmtests.sh |   2 +
> > 4 files changed, 458 insertions(+)
> > create mode 100644 tools/testing/selftests/mm/merge.c
> >
> >diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> >index c5241b193db8..91db34941a14 100644
> >--- a/tools/testing/selftests/mm/.gitignore
> >+++ b/tools/testing/selftests/mm/.gitignore
> >@@ -58,3 +58,4 @@ hugetlb_dio
> > pkey_sighandler_tests_32
> > pkey_sighandler_tests_64
> > guard-regions
> >+merge
> >diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> >index 8270895039d1..ad4d6043a60f 100644
> >--- a/tools/testing/selftests/mm/Makefile
> >+++ b/tools/testing/selftests/mm/Makefile
> >@@ -98,6 +98,7 @@ TEST_GEN_FILES += hugetlb_madv_vs_map
> > TEST_GEN_FILES += hugetlb_dio
> > TEST_GEN_FILES += droppable
> > TEST_GEN_FILES += guard-regions
> >+TEST_GEN_FILES += merge
> >
> > ifneq ($(ARCH),arm64)
> > TEST_GEN_FILES += soft-dirty
> >diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
> >new file mode 100644
> >index 000000000000..9cc61bdbfba8
> >--- /dev/null
> >+++ b/tools/testing/selftests/mm/merge.c
> >@@ -0,0 +1,454 @@
> >+// SPDX-License-Identifier: GPL-2.0-or-later
> >+
> >+#define _GNU_SOURCE
> >+#include "../kselftest_harness.h"
> >+#include <stdio.h>
> >+#include <stdlib.h>
> >+#include <unistd.h>
> >+#include <sys/mman.h>
> >+#include <sys/wait.h>
> >+#include "vm_util.h"
> >+
> >+FIXTURE(merge)
> >+{
> >+	unsigned int page_size;
> >+	char *carveout;
> >+	struct procmap_fd procmap;
> >+};
> >+
> >+FIXTURE_SETUP(merge)
> >+{
> >+	self->page_size = psize();
> >+	/* Carve out PROT_NONE region to map over. */
> >+	self->carveout = mmap(NULL, 12 * self->page_size, PROT_NONE,
> >+			      MAP_ANON | MAP_PRIVATE, -1, 0);
> >+	ASSERT_NE(self->carveout, MAP_FAILED);
> >+	/* Setup PROCMAP_QUERY interface. */
> >+	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
> >+}
> >+
> >+FIXTURE_TEARDOWN(merge)
> >+{
> >+	ASSERT_EQ(munmap(self->carveout, 12 * self->page_size), 0);
> >+	ASSERT_EQ(close_procmap(&self->procmap), 0);
> >+}
> >+
> >+TEST_F(merge, mprotect_unfaulted_left)
> >+{
> >+	unsigned int page_size = self->page_size;
> >+	char *carveout = self->carveout;
> >+	struct procmap_fd *procmap = &self->procmap;
> >+	char *ptr;
> >+
> >+	/*
> >+	 * Map 10 pages of R/W memory within. MAP_NORESERVE so we don't hit
> >+	 * merge failure due to lack of VM_ACCOUNT flag by mistake.
> >+	 *
> >+	 * |-----------------------|
> >+	 * |       unfaulted       |
> >+	 * |-----------------------|
> >+	 */
> >+	ptr = mmap(&carveout[page_size], 10 * page_size, PROT_READ | PROT_WRITE,
> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
> >+	ASSERT_NE(ptr, MAP_FAILED);
> >+	/*
> >+	 * Now make the first 5 pages read-only, splitting the VMA:
> >+	 *
> >+	 *      RO          RW
> >+	 * |-----------|-----------|
> >+	 * | unfaulted | unfaulted |
> >+	 * |-----------|-----------|
> >+	 */
> >+	ASSERT_EQ(mprotect(ptr, 5 * page_size, PROT_READ), 0);
> >+	/*
> >+	 * Fault in the first of the last 5 pages so it gets an anon_vma and
> >+	 * thus the whole VMA becomes 'faulted':
> >+	 *
> >+	 *      RO          RW
> >+	 * |-----------|-----------|
> >+	 * | unfaulted |  faulted  |
> >+	 * |-----------|-----------|
> >+	 */
> >+	ptr[5 * page_size] = 'x';
> >+	/*
> >+	 * Now mprotect() the RW region read-only, we should merge (though for
> >+	 * ~15 years we did not! :):
> >+	 *
> >+	 *             RO
> >+	 * |-----------------------|
> >+	 * |        faulted        |
> >+	 * |-----------------------|
> >+	 */
> >+	ASSERT_EQ(mprotect(&ptr[5 * page_size], 5 * page_size, PROT_READ), 0);
> >+
> >+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
> >+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
> >+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
> >+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
> >+}
> >+
> >+TEST_F(merge, mprotect_unfaulted_right)
> >+{
> >+	unsigned int page_size = self->page_size;
> >+	char *carveout = self->carveout;
> >+	struct procmap_fd *procmap = &self->procmap;
> >+	char *ptr;
> >+
> >+	/*
> >+	 * |-----------------------|
> >+	 * |       unfaulted       |
> >+	 * |-----------------------|
> >+	 */
> >+	ptr = mmap(&carveout[page_size], 10 * page_size, PROT_READ | PROT_WRITE,
> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
> >+	ASSERT_NE(ptr, MAP_FAILED);
> >+	/*
> >+	 * Now make the last 5 pages read-only, splitting the VMA:
> >+	 *
> >+	 *      RW          RO
> >+	 * |-----------|-----------|
> >+	 * | unfaulted | unfaulted |
> >+	 * |-----------|-----------|
> >+	 */
> >+	ASSERT_EQ(mprotect(&ptr[5 * page_size], 5 * page_size, PROT_READ), 0);
> >+	/*
> >+	 * Fault in the first of the first 5 pages so it gets an anon_vma and
> >+	 * thus the whole VMA becomes 'faulted':
> >+	 *
> >+	 *      RW          RO
> >+	 * |-----------|-----------|
> >+	 * |  faulted  | unfaulted |
> >+	 * |-----------|-----------|
> >+	 */
> >+	ptr[0] = 'x';
> >+	/*
> >+	 * Now mprotect() the RW region read-only, we should merge:
> >+	 *
> >+	 *             RO
> >+	 * |-----------------------|
> >+	 * |        faulted        |
> >+	 * |-----------------------|
> >+	 */
> >+	ASSERT_EQ(mprotect(ptr, 5 * page_size, PROT_READ), 0);
> >+
> >+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
> >+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
> >+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
> >+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
> >+}
> >+
> >+TEST_F(merge, mprotect_unfaulted_both)
> >+{
> >+	unsigned int page_size = self->page_size;
> >+	char *carveout = self->carveout;
> >+	struct procmap_fd *procmap = &self->procmap;
> >+	char *ptr;
> >+
> >+	/*
> >+	 * |-----------------------|
> >+	 * |       unfaulted       |
> >+	 * |-----------------------|
> >+	 */
> >+	ptr = mmap(&carveout[2 * page_size], 9 * page_size, PROT_READ | PROT_WRITE,
> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
> >+	ASSERT_NE(ptr, MAP_FAILED);
> >+	/*
> >+	 * Now make the first and last 3 pages read-only, splitting the VMA:
> >+	 *
> >+	 *      RO          RW          RO
> >+	 * |-----------|-----------|-----------|
> >+	 * | unfaulted | unfaulted | unfaulted |
> >+	 * |-----------|-----------|-----------|
> >+	 */
> >+	ASSERT_EQ(mprotect(ptr, 3 * page_size, PROT_READ), 0);
> >+	ASSERT_EQ(mprotect(&ptr[6 * page_size], 3 * page_size, PROT_READ), 0);
> >+	/*
> >+	 * Fault in the first of the middle 3 pages so it gets an anon_vma and
> >+	 * thus the whole VMA becomes 'faulted':
> >+	 *
> >+	 *      RO          RW          RO
> >+	 * |-----------|-----------|-----------|
> >+	 * | unfaulted |  faulted  | unfaulted |
> >+	 * |-----------|-----------|-----------|
> >+	 */
> >+	ptr[3 * page_size] = 'x';
> >+	/*
> >+	 * Now mprotect() the RW region read-only, we should merge:
> >+	 *
> >+	 *             RO
> >+	 * |-----------------------|
> >+	 * |        faulted        |
> >+	 * |-----------------------|
> >+	 */
> >+	ASSERT_EQ(mprotect(&ptr[3 * page_size], 3 * page_size, PROT_READ), 0);
> >+
> >+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
> >+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
> >+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
> >+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 9 * page_size);
> >+}
> >+
> >+TEST_F(merge, mprotect_faulted_left_unfaulted_right)
> >+{
> >+	unsigned int page_size = self->page_size;
> >+	char *carveout = self->carveout;
> >+	struct procmap_fd *procmap = &self->procmap;
> >+	char *ptr;
> >+
> >+	/*
> >+	 * |-----------------------|
> >+	 * |       unfaulted       |
> >+	 * |-----------------------|
> >+	 */
> >+	ptr = mmap(&carveout[2 * page_size], 9 * page_size, PROT_READ | PROT_WRITE,
> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
> >+	ASSERT_NE(ptr, MAP_FAILED);
> >+	/*
> >+	 * Now make the last 3 pages read-only, splitting the VMA:
> >+	 *
> >+	 *             RW               RO
> >+	 * |-----------------------|-----------|
> >+	 * |       unfaulted       | unfaulted |
> >+	 * |-----------------------|-----------|
> >+	 */
> >+	ASSERT_EQ(mprotect(&ptr[6 * page_size], 3 * page_size, PROT_READ), 0);
> >+	/*
> >+	 * Fault in the first of the first 6 pages so it gets an anon_vma and
> >+	 * thus the whole VMA becomes 'faulted':
> >+	 *
> >+	 *             RW               RO
> >+	 * |-----------------------|-----------|
> >+	 * |       unfaulted       | unfaulted |
>                    ^^^
>
> According to your previous comment convention, the comment here describe the
> result after ptr[0] = 'x'.
>
> faulted is the correct description here?

My 'previous comment convention'? What? You mean my describing what
happens?

Yes this is incorrect, this should read 'faulted' in the RW section. I will
fix if I respin.

>
> >+	 * |-----------------------|-----------|
> >+	 */
> >+	ptr[0] = 'x';
> >+	/*
> >+	 * Now make the first 3 pages read-only, splitting the VMA:
> >+	 *
> >+	 *      RO          RW          RO
> >+	 * |-----------|-----------|-----------|
> >+	 * |  faulted  |  faulted  | unfaulted |
> >+	 * |-----------|-----------|-----------|
> >+	 */
> >+	ASSERT_EQ(mprotect(ptr, 3 * page_size, PROT_READ), 0);
> >+	/*
> >+	 * Now mprotect() the RW region read-only, we should merge:
> >+	 *
> >+	 *             RO
> >+	 * |-----------------------|
> >+	 * |        faulted        |
> >+	 * |-----------------------|
> >+	 */
> >+	ASSERT_EQ(mprotect(&ptr[3 * page_size], 3 * page_size, PROT_READ), 0);
> >+
> >+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
> >+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
> >+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
> >+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 9 * page_size);
> >+}
> >+
> >+TEST_F(merge, mprotect_unfaulted_left_faulted_right)
> >+{
> >+	unsigned int page_size = self->page_size;
> >+	char *carveout = self->carveout;
> >+	struct procmap_fd *procmap = &self->procmap;
> >+	char *ptr;
> >+
> >+	/*
> >+	 * |-----------------------|
> >+	 * |       unfaulted       |
> >+	 * |-----------------------|
> >+	 */
> >+	ptr = mmap(&carveout[2 * page_size], 9 * page_size, PROT_READ | PROT_WRITE,
> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
> >+	ASSERT_NE(ptr, MAP_FAILED);
> >+	/*
> >+	 * Now make the first 3 pages read-only, splitting the VMA:
> >+	 *
> >+	 *      RO                RW
> >+	 * |-----------|-----------------------|
> >+	 * | unfaulted |       unfaulted       |
> >+	 * |-----------|-----------------------|
> >+	 */
> >+	ASSERT_EQ(mprotect(ptr, 3 * page_size, PROT_READ), 0);
> >+	/*
> >+	 * FAult in the first of the last 6 pages so it gets an anon_vma and
>             ^
>
> s/A/a/

Right, I'll fix that if I respin.

>
> >+	 * thus the whole VMA becomes 'faulted':
> >+	 *
> >+	 *      RO                RW
> >+	 * |-----------|-----------------------|
> >+	 * | unfaulted |        faulted        |
> >+	 * |-----------|-----------------------|
> >+	 */
> >+	ptr[3 * page_size] = 'x';
> >+	/*
> >+	 * Now make the last 3 pages read-only, splitting the VMA:
> >+	 *
> >+	 *      RO          RW          RO
> >+	 * |-----------|-----------|-----------|
> >+	 * | unfaulted |  faulted  |  faulted  |
> >+	 * |-----------|-----------|-----------|
> >+	 */
> >+	ASSERT_EQ(mprotect(&ptr[6 * page_size], 3 * page_size, PROT_READ), 0);
> >+	/*
> >+	 * Now mprotect() the RW region read-only, we should merge:
> >+	 *
> >+	 *             RO
> >+	 * |-----------------------|
> >+	 * |        faulted        |
> >+	 * |-----------------------|
> >+	 */
> >+	ASSERT_EQ(mprotect(&ptr[3 * page_size], 3 * page_size, PROT_READ), 0);
> >+
> >+	/* Assert that the merge succeeded using PROCMAP_QUERY. */
> >+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
> >+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
> >+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 9 * page_size);
> >+}
> >+
> >+TEST_F(merge, forked_target_vma)
> >+{
> >+	unsigned int page_size = self->page_size;
> >+	char *carveout = self->carveout;
> >+	struct procmap_fd *procmap = &self->procmap;
> >+	pid_t pid;
> >+	char *ptr, *ptr2;
> >+	int i;
> >+
> >+	/*
> >+	 * |-----------|
> >+	 * | unfaulted |
> >+	 * |-----------|
> >+	 */
> >+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
> >+	ASSERT_NE(ptr, MAP_FAILED);
> >+
> >+	/*
> >+	 * Fault in process.
> >+	 *
> >+	 * |-----------|
> >+	 * |  faulted  |
> >+	 * |-----------|
> >+	 */
> >+	ptr[0] = 'x';
> >+
> >+	pid = fork();
> >+	ASSERT_NE(pid, -1);
> >+
> >+	if (pid != 0) {
> >+		wait(NULL);
> >+		return;
> >+	}
> >+
> >+	/* Child process below: */
> >+
> >+	/* Reopen for child. */
> >+	ASSERT_EQ(close_procmap(&self->procmap), 0);
> >+	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
> >+
> >+	/* unCOWing everything does not cause the AVC to go away. */
>            ^^^
>
> Before ptr[i] = 'x', we have unCOWed pages in vma. What we are doing here is
> COWing, right?

Nope, it's the other way round, as commented. A 'CoW' page is one marked
for copy-on-write right? we now make it just a normal mapping by writing to
it.

>
> >+	for (i = 0; i < 5 * page_size; i += page_size)
> >+		ptr[i] = 'x';
> >+
> >+	/*
> >+	 * Map in adjacent VMA in child.
> >+	 *
> >+	 *     forked
> >+	 * |-----------|-----------|
> >+	 * |  faulted  | unfaulted |
> >+	 * |-----------|-----------|
> >+	 *      ptr         ptr2
> >+	 */
> >+	ptr2 = mmap(&ptr[5 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
> >+	ASSERT_NE(ptr2, MAP_FAILED);
> >+
> >+	/* Make sure not merged. */
> >+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
> >+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
> >+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 5 * page_size);
> >+}
> >+
> >+TEST_F(merge, forked_source_vma)
> >+{
> >+	unsigned int page_size = self->page_size;
> >+	char *carveout = self->carveout;
> >+	struct procmap_fd *procmap = &self->procmap;
> >+	pid_t pid;
> >+	char *ptr, *ptr2;
> >+	int i;
> >+
> >+	/*
> >+	 * |............|-----------|
> >+	 * | <unmapped> | unfaulted |
> >+	 * |............|-----------|
>
> I am not sure "unmapped" is correct here. The range has already been mapped by
> FIXTURE_SETUP(merge).

This is pointless and actually misleading pedantry.

For the purposes of what we are doing here, this is unmapped. Do you truly
think mentioning a PROT_NONE mapping here would be useful, meaningful, or
add anything but noise?

>
> >+	 */
> >+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
> >+	ASSERT_NE(ptr, MAP_FAILED);
> >+
> >+	/*
> >+	 * Fault in process.
> >+	 *
> >+	 * |............||-----------|
> >+	 * | <unmapped> ||  faulted  |
> >+	 * |............||-----------|
>                          ^
>
> Extra line here?

Eh? I don't understand what you mean... you mean an extra '-'? This is to
fit both unfaulted/faulted in the same size SACII 'VMA', a convention I've
kept (hopefully) consistently...

>
> >+	 */
> >+	ptr[0] = 'x';
> >+
> >+	pid = fork();
> >+	ASSERT_NE(pid, -1);
> >+
> >+	if (pid != 0) {
> >+		wait(NULL);
> >+		return;
> >+	}
> >+
> >+	/* Child process below: */
> >+
> >+	/* Reopen for child. */
> >+	ASSERT_EQ(close_procmap(&self->procmap), 0);
> >+	ASSERT_EQ(open_self_procmap(&self->procmap), 0);
> >+
> >+	/* unCOWing everything does not cause the AVC to go away. */
>
> Same as above.

And you're equally wrong here.

I appreciate it's confusing and perhaps a poor way of expressing it, but
I'm not sure there's a gloriously wonderful means of doing so that will
bring clarity to everybody, as is the nature of mm. I do my best.

>
> >+	for (i = 0; i < 5 * page_size; i += page_size)
> >+		ptr[i] = 'x';
> >+
> >+	/*
> >+	 * Map in adjacent VMA in child, ptr2 before ptr, but incompatible.
> >+	 *
> >+	 *      RWX      forked RW
> >+	 * |-----------|-----------|
> >+	 * | unfaulted |  faulted  |
> >+	 * |-----------|-----------|
> >+	 *      ptr2        ptr
> >+	 */
> >+	ptr2 = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE | PROT_EXEC,
> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
> >+	ASSERT_NE(ptr2, MAP_FAILED);
> >+
>
> I think pt2 is after ptr. Do I miss something?

Yup, didn't update the comments but clearly updated the method. I'll update
if there's a respin.

>
> >+
> >+	/* Make sure not merged. */
> >+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
> >+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
> >+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 5 * page_size);
> >+
> >+	/*
> >+	 * Now mprotect forked region to RWX so it becomes the source for the
> >+	 * merge to unfaulted region:
> >+	 *
> >+	 *      RWX      forked RWX
> >+	 * |-----------|-----------|
> >+	 * | unfaulted |  faulted  |
> >+	 * |-----------|-----------|
> >+	 *      ptr2        ptr
> >+	 */
> >+	ASSERT_EQ(mprotect(ptr, 5 * page_size, PROT_READ | PROT_WRITE | PROT_EXEC), 0);
> >+	/* Again, make sure not merged. */
> >+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
> >+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
> >+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 5 * page_size);
> >+}
> >+
> >+TEST_HARNESS_MAIN
> >diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> >index 9aff33b10999..0b2f8bb91433 100755
> >--- a/tools/testing/selftests/mm/run_vmtests.sh
> >+++ b/tools/testing/selftests/mm/run_vmtests.sh
> >@@ -421,6 +421,8 @@ CATEGORY="madv_guard" run_test ./guard-regions
> > # MADV_POPULATE_READ and MADV_POPULATE_WRITE tests
> > CATEGORY="madv_populate" run_test ./madv_populate
> >
> >+CATEGORY="vma_merge" run_test ./merge
> >+
>
> ./run_vmtests.sh -h would show a list of categories.
>
> How about add the new category "vma_merge" into the list.

Probably unintended but this sounds pretty rude, especially when you are
performing unrequested, rather pedantic, 'drive-by' review like this.

A polite way of putting it would be 'perhaps additionally update the usage
to add vma_merge to the list?'.

Again, this is not very important, sure if I respin I'll do it.

>
> > if [ -x ./memfd_secret ]
> > then
> > (echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
> >--
> >2.48.1
> >
>
> --
> Wei Yang
> Help you, Help me
