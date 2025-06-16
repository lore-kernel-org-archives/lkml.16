Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCF71A2632
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750098363; cv=fail; b=Usrw91b3JevDK3+/ZC2kX9+RO9RqS+2LZ6JEX+H3+iuigkryka0WFfqPVqIPtZOm8/zkQKUyHM7MKPf7cOtrL5Y6GMrz+Xz8CtjsnZO9KBZAktgSHMuWXXmcAwrThKyUiYOxQdz60Lj4VqewUhSDso65DXGsKVitiCck8oFSbIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750098363; c=relaxed/simple;
	bh=6gTuUr4iUtiw+zoSYfIAjBOfgYB5qFQeG7qJ0Ok6ESI=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=QYBly4j9qsXPrygy+9xw0303iCuCEikAUadrazRHc8B6Ou66te0AJGfH6Y3fxQzsFlYlMdhKJUQkA8pMwpBstCwNzEZP1JnW9UONv3rDbO83hu4Yi2zrQln2l68tvGXHsHntNiu26O182I/0WdvBRkH46hrbw7iaTEMYRCspxn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S0cA+w+E; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gG3cl8AD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S0cA+w+E";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gG3cl8AD"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuTt3015758;
	Mon, 16 Jun 2025 18:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=AypnOJQ02fpluleFq6
	7wKB9VUYtzciDt+u1YDR3Y1Cs=; b=S0cA+w+E3j5BhPUry5pNIyjSeqOzcD8Fs5
	8L8UX1tA//Tmw4rjlqXs6X6myvsY1VZKZJQPA+tzw7hieBYCeQXbrzoDQ2uBbhVV
	adN3hIVGNuwhwr+PqzUAlXq6Xii5t3QrYCv40cL3seKwzcsgV04rtNlkJh9I3+53
	wbDu0qYcr5KwLAs2bFvCgfDlD+fdWkY7EH1pNmWp1S5715GCIthHDxRhFe5rUecf
	lHiSwvDsB+en0HQEnY4fWUmMssNFpTkE5z4lmVf/b5Okr2bqRUu2cbMaOIfheh/0
	8sS6JUrBAEX/ZpjOBb5MermnjVOkPNkzHmDEdbxJvNhjD7bBKUQw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv53ee9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:25:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHa2ju025888;
	Mon, 16 Jun 2025 18:25:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhehg2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:25:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgReEuu4jL+q7zOkO4f2s/rSgY0GyDQhkf+fIamcXIlykwSndP/HGppqluiM9SbgxHWxQXjkQcAkSXTEUInGIOyXTPnVP2DdXxlkjcfuvB4CLCJXLGYH6b9TEePGvtWUgUBCK7xmkuMV1vV88z1EQTvoWe2tTjr1Y22Qv2mHxEyApi+8znoFH+IqtnkhFZ5nona5kHue6sglmRCMcILShRKF3unD4PeBW25jprAUARNR6fLTFGjpLD4WBUC0y+EIHPQQgJXyhpycV94lw9qfCbi/ukaJNlTwgay7/3uSnZYTT+Fc4wPMemMzor+ntCHVh3mnDCasP/2EpPCHwLfvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AypnOJQ02fpluleFq67wKB9VUYtzciDt+u1YDR3Y1Cs=;
 b=O9z5QhEAdSFgWWAdzYS3nJCCtkIhULaG4s5vQLeAFfhpYqPLue7B56pieLdsmKE3bDw9auvLtyPj7KGcOs9d9WiT7AssdjdV4Exs1GkV5qdIFLqYy8JHqakKz6Ejfg5FgV9lQUDtmXyCssuQ1+8EDdQpY8fOYkwuJ/tQi2phmD1bkx0zgKlRzgsoV/MC22hf+H8acy2MmsjNPREdm0CZHMjE8AX6Mn5Z/EO6dWbDTzBhTg4W4xcn/7dQ/5TjL83SMUwY23YZUPsAFMNKfSv66INsq6rZSOrAAylP1zscQGc4cX4jbC9CgHdeiSFOd11X76sFOCwIFp2Az5pwJnsUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AypnOJQ02fpluleFq67wKB9VUYtzciDt+u1YDR3Y1Cs=;
 b=gG3cl8ADIoX/cevZ8MxwTWMpZRtkikmHEXAIzucORAaxXs+3jPAsn0LkIXhCnjiZD3i2zlxnMNba6obhP+b651BNUuo1cLKEebS1wtJGmc7ThNP7NZfUarF5S0sQUCoAkquD0BFvBoyp2IHpwKUjeYoe9eGmctNFOHdMwWSDfLw=
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20) by DS0PR10MB7066.namprd10.prod.outlook.com
 (2603:10b6:8:140::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 18:25:31 +0000
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f]) by CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f%4]) with mapi id 15.20.8722.027; Mon, 16 Jun 2025
 18:25:31 +0000
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
 <5d3e4538-9757-4d6e-bed1-900c9859d860@intel.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v4 00/13] x86/mm: Add multi-page clearing
In-reply-to: <5d3e4538-9757-4d6e-bed1-900c9859d860@intel.com>
Date: Mon, 16 Jun 2025 11:25:28 -0700
Message-ID: <87o6uny25j.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0104.namprd04.prod.outlook.com
 (2603:10b6:303:83::19) To CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1SPR01MB0016:EE_|DS0PR10MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 496a80e6-11d0-464d-c117-08ddad032d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WKhjrBcgETg6dBSfS3QIOtmvryxJtiXTSb/sLFB5piP+bzi/9BlOrN7BGJtj?=
 =?us-ascii?Q?g+KOww+1cX4wg5Pm4RSBqjdsAps/oGCi113D5yxx+Hof02WfVwAWpHw7ZXL7?=
 =?us-ascii?Q?n/zwLobUh9igd5RSR9bTuaSyVtDXpimfYCWBpoN4jPCARqstTqCfHVh7PqcU?=
 =?us-ascii?Q?io98ZMBh10p7J9de8ZAQQmKxxj+ZSQCWFzWwpSqOq9lsiU9Sdk/Udlykhi9X?=
 =?us-ascii?Q?EqY0glKGc4YhtQE21MFwLy19F9RU2cjpxFZ9XW64dlRhQmkgpgYFrM27aoH3?=
 =?us-ascii?Q?NI1AzEU/EJGcLbyUM622mo/ELA8IhNXncFAF9eFY2bT6vcOfXacrgcBq7wu9?=
 =?us-ascii?Q?9+/TxExcAbb1cg96RRJ1PatlqM8LvM8zw78va4LvG7rQKBNebtapLGVIyyQl?=
 =?us-ascii?Q?s0rE/CX0XF6xdSP+uMnD2SysQZa1b/62SgRzZS3q9ou5qCzUWmGV+lmU5Oig?=
 =?us-ascii?Q?iSd19eQ/1dnf1Sb3krvOF0a3zkSN6pUTONW6ktQHNcCsFTzMeXcd38UKmxZ5?=
 =?us-ascii?Q?V2jzxOeg2ut2KUyfW91bnluxPPaICy6yno9QPlW4SDTXzx6p0mWyguw+WzQy?=
 =?us-ascii?Q?JMwc2Mg/4xwnDLtAByBLjz8vOxUff5sZeFwGa2/EVIRuzws4zxWT27ha/5ZA?=
 =?us-ascii?Q?45SVuHR7CjMtgvm2wtIvUvDJcqTr21qBjjEYmHEAY9yDAQaRrwt8WicyqZ5v?=
 =?us-ascii?Q?QsUkoIP5Wnw1FuxDsxPBJKsCkDNSgVTNWSkUmq24MpmmwfawiDuuuBJZCdAs?=
 =?us-ascii?Q?EomPAfq2qQzw0ShWO0nXn6kYeHR+g/I+49I5ed/HIoD45YCYQwdQ7LSOLlWT?=
 =?us-ascii?Q?8LQ8D5byTK7+a9R2jkOEGZiLzzaNg32wkj7N8/bKRewcEBC3yNMhVmoyk5bJ?=
 =?us-ascii?Q?ouHh9iZbYLVcoOQoIg3vOfPgP29T7h+pOqt+y1g/PKSLxD1XvKM1+fYoOtjl?=
 =?us-ascii?Q?PyjIxENHdJQSOhPz5SdVfRpjgatkBRzp6FhZMAc3BuxbBvNZsG5nTyJVYe++?=
 =?us-ascii?Q?3pVNF07bbYSNwL9J6rpJz8RYSdhC+igeRGL5KwPVfJx8XtmgYHDIebyG3GoX?=
 =?us-ascii?Q?Mc/HvU0kzvZSO71IXGI5bEkviG5DHv84lSvBiRI/jHwpWT9Sso3z4nIyTIOc?=
 =?us-ascii?Q?jvKZOReVlJZ4d8AGDq3mCw0a2IHU2lxY/7zbS8oOdYh1gKR+z91ez5EsXIo2?=
 =?us-ascii?Q?UGEKAc+t911hRP6AWBPwAAVgU4xNeyIqllY4w1f6O3W7P1aWa8kVzBeyEy5Y?=
 =?us-ascii?Q?bQpbPSSvLavi0hQ6Sp7AzGoELWjZ3jhWF+6wdQc+ic54mZXnklm4GyAdYae7?=
 =?us-ascii?Q?OM1PHo3I5kPX4fwRnVKQAIbqzg6wPtC+8/QSDxrk88wOCAPUGK97NARNrxz3?=
 =?us-ascii?Q?z72NpeLbUIBKKegJW/Wns8q8sSjwdO9tYMFMrLPFN3MWcd31yhdCfXwIcrRq?=
 =?us-ascii?Q?XmjUBYEKEiU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1SPR01MB0016.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KtP59up6h53Vw2q+OwTDCNISx/pb2IuqMQv3/vcEHr78oLNwxOx/kYtvT1GU?=
 =?us-ascii?Q?Wgx/xrZULC3PPp8k+IqF44PS6Te985ZsE4+F6Poar6XDcCu3ozumN9tF812L?=
 =?us-ascii?Q?cufH255tB+beMdYEvO6VyNdWvZDvwsoWE0+MpOq/Ijy8T2TP+fo5Q/7VuzKu?=
 =?us-ascii?Q?1/T0hn7D6TeHEYAzr1B0anG2XfiDGevlakyJS3e40Li3REf460TEQkG/bvkE?=
 =?us-ascii?Q?nxvxssNrf2DmZoJ8+UddlNw5/oL0eXWPFvEN7z6Ioo/9qUSE0rX8rOLK/Zs8?=
 =?us-ascii?Q?cOhRYaWLS3Qv18+SOv2nonavAxSK8PqUciwffn9xrHYcnYicOHkhgs7voVTN?=
 =?us-ascii?Q?uLibT9NXNSqqveCyVoDNc7XgPK7MHx3RZVStnFChIAsMSE6oXIaOJ/dIOBRA?=
 =?us-ascii?Q?rSgp6gLRxEqSeBBhAPqV4rVd6c7moGgV4BYbz3LC7BPc1cz2SSUSnz8pSukr?=
 =?us-ascii?Q?rvoiHfXj6yk6kgTLKllqhmSPZtj7lN8ogw1RyxK7Mdiwvo3fv/EVKOFLiHzK?=
 =?us-ascii?Q?n9CM/RMlVq3P3EyGc9v0sGqrUloDwHyjW2kVb+9T+wRdE5sCYHs8BV7PcqjS?=
 =?us-ascii?Q?Zuw5G0IFNOtHfNvtzuZQnWRM3U3Qzc3lMXfnAGXSTTq49Ot5JIvcaFOuzYz+?=
 =?us-ascii?Q?wccQXiKg7bYFEgtbjXoOWLOkJCGZ70AeqYawCon2EaJaUH+thLHgC2Xzay+i?=
 =?us-ascii?Q?H4qFBWLADLWz+44z7XKW7DsJ/H06+XyaKe/kghrgwM5r7qS2o8av4JPK+w6B?=
 =?us-ascii?Q?PCyB+jqy4nttCcZVtl7O7Iy/oIFMeqeMrBg6bJnorf9znnNPSfkITuckITUq?=
 =?us-ascii?Q?H+KcSkISL/M/G4Lx9x+4ezHmVhl2OmIhJ8RpLjgE7KH4OD4WFIqtSMfkJHez?=
 =?us-ascii?Q?7QasXR8iKA/NeZnn3rhMxums6kwAEUoTIHkWRwZo4ceYYUMDzBwPDgC14XvC?=
 =?us-ascii?Q?grYqfkSM/AKlMmTIJ6a26Xi09PnEiN7JWq1kx5HFwMO02Lc5AhTKF76s5NAX?=
 =?us-ascii?Q?PnfRoCB0+4xEIYkX9rIXjTh3tmkuF8K/aYO/jZ/2Vsk45rNSTwaRsFvoj2GG?=
 =?us-ascii?Q?SfVGyv7Nq8WUGL1mZItWUQo2lWXwL8IeDWzxPFacCkeOn0uxIH7O24vM85Wj?=
 =?us-ascii?Q?UBLS5N8P/xnGJB21Vnmg88SB38vp4IFH1ZIDrcP7zZyhmx55IkUPRHeiSr04?=
 =?us-ascii?Q?YXnsx7ouqj3BnrPDIAJ+8I6q+GrcOGWuddlyOg5C/zLSa8YrzzjZFfUGdUZo?=
 =?us-ascii?Q?OruUnz/tnYGw4g7PI5TUyAEEt7VQbBsN35iW7V9t4puBa9cwmxAN0Lxos26r?=
 =?us-ascii?Q?5x64kT62AkVUJ3M9oIwutC47Ji24V8PibqkvikAfrbpICWy23x0qR0IiLJyU?=
 =?us-ascii?Q?d66nQalO18NAjrROutwpecPpi95FedHLvb8SJ1YmEYSzxWJ3r9g7RZMgG/A+?=
 =?us-ascii?Q?P7vOeOhWyH4Tqyq+NS0SWj76DZvvgpc4GR+7BBId7etAfcqyX4/ki0Nq9y4S?=
 =?us-ascii?Q?0GVhHNAKGgoxEGdKWgIpjFsYf5yRyvD6fawTQXy67MCDX9Ad0kn8LJttANPr?=
 =?us-ascii?Q?KXEMYC5slBpLd+DoB3pAS2ltqRtFjE7lT30kJ3yxGQlYBv+CAzL/oGJyFTf8?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FdQOgxPyJCsycNq7ouHBny077GUch8BSMPEoI5DNg8+J3pTS5btBPyBk6l348B8O6YkoRnLig1ec9a68tgjApFnhC+GblafMKvzvWpL95GsQCc0LzdOnbgKf/PsT+tPcNCyp+gGW4DehPvdfj8IR7j+ipru+PunGVJSk805sJInygHC+VJq5323KN/h7HbEzsMIm4j/BTn38oq5heonduNDNxSjUxtJcelFSElJZIQbJeDAxGZ70cOzrNJNyAHEU5gKdXw28KxBhQQCwu/fEfS1pBTHR5RlPJ96R1NHTA0vUB49MGfTe22/rI+C7alErwBFDMMQFYuwEzmaeLZDA3GpIAD7t3jmeNKtyv2VAHnVKgchiHF9ckC8iFrHx9iTxBr1SPRC95ar+NuSO+UDXXxHUSTTfvHy2jG5CGvTRHKQrx/M31VH4r9+aa07tI16CPcDNdRRQVJbLR4vHflHS3Vwf0Na9AbAnLwzbc0zVrOnaX8Go2+yG8mkfRNYtmjiqHmOnSfK0l+Sna2Li8YNHe7OOoT29dCh609RvskoW9gXWo2Z8UHgvU7Yvo76qs3LgyHEmXFYPBYeR3zKpYwIxo0H5sA+NEE87soNnWwJB7ow=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496a80e6-11d0-464d-c117-08ddad032d04
X-MS-Exchange-CrossTenant-AuthSource: CO1SPR01MB0016.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:25:30.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDeVSKPINOsZRoYxSHv568N0QUZJp2k4wHUQOhdu4GYfPYi5bHqmknga4aIRYethjfkQstd5+oVGbluCoL5Hlhvm0dBaf5cP/tGYGwDIW8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7066
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyNCBTYWx0ZWRfXysrcgCp7iuaT nZvcrTWMQo/PZbSHkoMSm9+Oq4PwS5V15AGy8H+6BTXZEeKh45rVVXbY7QRVBAI0uC2XlN+7UxV cFen+cqrg4fYJfHz4IRY3FpzWGBjazmt45c/XsjRAxq8rBgykMpQakjfQrh6yxUNRr6nhTMyHLf
 GqIAVPJhzC0/4SwiMjKMpqurwwHpblNzwjVxd286KBtOz584VE7eA5Fy8WKCDNfh3nFnQCEtRbt PAEyT4dMogWNIrDz8kFpi2I4CJTbKlJwjh6D0ktmqBat7M6GXCUSJkAd36BDXwaxqeiO7iOsh8x lBObO9VJhm5azrr7rt0AgtJVUnvBPJYcm3ODCUA++yGFJ2tM3Bt6xlmV6NRFE11jpyFP0zVE1r2
 aa793Vd/5j0hwL0EU76AtMEli58Gx4pytcpV/bjGfU0FTizbj/aO1kUpMBdnqbCvEFANX27J
X-Proofpoint-GUID: gSxjNnZqj0XuN3hsbDKnxAFVvSPmgGgj
X-Proofpoint-ORIG-GUID: gSxjNnZqj0XuN3hsbDKnxAFVvSPmgGgj
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=6850619e b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=QyXUC8HyAAAA:8 a=H-ZuMbLQr-idnBUfFXEA:9 cc=ntf awl=host:13207


Dave Hansen <dave.hansen@intel.com> writes:

> On 6/15/25 22:22, Ankur Arora wrote:
>> This series adds multi-page clearing for hugepages, improving on the
>> current page-at-a-time approach in two ways:
>>
>>  - amortizes the per-page setup cost over a larger extent
>>  - when using string instructions, exposes the real region size to the
>>    processor. A processor could use that as a hint to optimize based
>>    on the full extent size. AMD Zen uarchs, as an example, elide
>>    allocation of cachelines for regions larger than L3-size.
>
> Have you happened to do any testing outside of 'perf bench'?

Yeah. My original tests were with qemu creating a pinned guest (where it
would go and touch pages after allocation.)

I think perf bench is a reasonably good test is because a lot of demand
faulting often just boils down to the same kind of loop. And of course
MAP_POPULATE is essentially equal to the clearing loop in the kernel.

I'm happy to try other tests if you have some in mind.

And, thanks for the quick comments!

--
ankur
