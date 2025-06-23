Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDFF274FF9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695774; cv=fail; b=rqU/WjvU8nqPTrrkzw228jlMO5aFA80ijZa6ie7NzEp66uTgMwaCIfYEwturtkZZUqZDFJy18QLz4nuEHvjruuOCukWwBgkJQ7Yi+c+ZHnvCmhFpZh2AxTeDlI28VPdL5LXpikb2a4WSEU+0Lnn+tgRzuKHlbxDUzTyzuFm0X3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695774; c=relaxed/simple;
	bh=0Sp6HrmhzrIqOK/y2CwMlvNOj5mimCyharZYbwLqXMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g7bIsikyQDIrHl3g25OqTLAqRv/IRW4XgGCYA+oZM2xPooinNhv9VjRj2POJ5krjlEHLgL62KKAo0q/llYk795geNZONVKIvNiBINZkiIhYuKqC5af4RehmAY8D2TiEDiuwapiFkaaWuX53wP5LAH8NB4y6BYcBzDPWavBIR/Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Cs8dURBK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RrLJdAVq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Cs8dURBK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RrLJdAVq"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NCie4S027450;
	Mon, 23 Jun 2025 16:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0Sp6HrmhzrIqOK/y2CwMlvNOj5mimCyharZYbwLqXMg=; b=
	Cs8dURBKizuI2kxakuD4xfYVc5HvWNLtD3HO5TwtHuUOpXfld7zM9xCtKKA6Xpny
	rNa4LF1+pg6Owc6Ja6RYsg5q6ozdiUMQ22MLYgnRz0srSkO+zFMlS/W5+S/KFfLX
	a2RPUvUedTLiM8MBkRHlUWPYH4ZrwqCUQCF16y8X/lewEejIuQA0Ut+DNUG5Qthk
	Wj5UmOF9OdhHu37+TBHtuvVLRL04jr6foveeAzSeXuR669Bjt1pPeOs8YNBbM4Hw
	DHNzfEG2DupTa4Gt4NeGTPz4fVPwoBConVVX1VeTGLQKNnVXEx1Rin0/ut41kjOV
	NMs4XIjIpX046b13RGAqEA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds87u4yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 16:22:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NF5hW0007396;
	Mon, 23 Jun 2025 16:22:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq2jbx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 16:22:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBRgoHamNTYlyu8QEIxhoyMUNIXoFj5nYorZ4SF0nNp/mbg3ZpB7HZp2YTxDKfDaqkZjx1CRJ3g0+UWIu3pGJvpbZdEZV1X+auu7nbyTiXH1MyIGyahcV8mr5uqxzqEv995uI01NB8YdqdqSjzjPwo/UP7T5unEZnIPdxFYsRVLQqHif1OTzmv3NGM+/w5ZhjODez1cEuVv53uW2ZV6XjCnuZ4xl55x7lCqqCJzo2VTqh0fl7i5D73WJA0Q0dyd5Vola18FFwpdJmBj1zJpcF9OtCeyHyFbtCKGB6o8eVkXuDuxcGHIYnsWq5nBsjF57DAr0naCzt5iFL7Fe2ScY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Sp6HrmhzrIqOK/y2CwMlvNOj5mimCyharZYbwLqXMg=;
 b=YpzfXU45hmZxiO1wiDu8yp7oFBO07AkQ8k+VVB+Phd+jbMWy2V3qgcPWaEPWdrMYC9YCX+CeRZCAqS7jbKgszwGsXjvJCT22lgBX+VUjbdqMAD3rJYbD7aAP6lVb3A7Gt08VTHGiEc9IwhVWTHkz21hy4ldhi/s7W7MgQ/PNp0F5Y+2L78iBK3LyhFgHbbA826GUfTiTlwWd+TLHULTQHDIx5AcQPpAVJMJ4IuCH8SYMZrdb1E6664m3CQss9G4yRysxX7qKZCpJ5T/gvC17YyCxocSVZF58hZbq4iFA84MnJE5pmycl/du5Z1hcATW49lLDfvjDUBUKGFeymO6/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Sp6HrmhzrIqOK/y2CwMlvNOj5mimCyharZYbwLqXMg=;
 b=RrLJdAVqwgaK4IWWvUyltKi2PhnXfFz/10Epza4PPXEsy2ZVqgpcmOp0yy4Nwel+xFgvNrQQpvSCZOP6MlLHRV+dkBSzg4c7TmB1CtfZtNRAAxCiZOrYUl1bky6D95JCEUfzE7NeFvXtNIJcsJeuKOHD73wQ4ep3lqWM22m1/iI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW4PR10MB5840.namprd10.prod.outlook.com (2603:10b6:303:18b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 16:22:29 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 16:22:29 +0000
Date: Mon, 23 Jun 2025 12:22:26 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] mm, madvise: simplify anon_name handling
Message-ID: <rhjfvvndg23mhvuddtrn35fmbcteafhjusqcj6uug3blvrykld@voxejacky3cb>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
 <20250623-anon_name_cleanup-v1-1-04c94384046f@suse.cz>
 <CAJuCfpG_ORN2+pifB4H16eASTAQFY+Fa_5FRROkffLKuNJpD3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpG_ORN2+pifB4H16eASTAQFY+Fa_5FRROkffLKuNJpD3Q@mail.gmail.com>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YT4PR01CA0482.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::20) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW4PR10MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 03fcc4c2-39ee-412b-b4e0-08ddb2722604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3JFSm91VG1kN0R2VjQwUjEyUjVUamJzTEdEMTlQMEdKZ1QzVlZKY2tmckoy?=
 =?utf-8?B?djlHQjBWUXRmcDdjNG1wQllFdEdIRUdGVXZ3VGNBSkFKajJzVWtUbzZkVHVW?=
 =?utf-8?B?dFRNSWwySGczRlF3U3RwL1ptbC9tdlh6YTVaT3UvS09HbWF1a0dlWkRLdFhN?=
 =?utf-8?B?WEMwSjFBb1JWSDZSUTZzY1JxNFV1OFZKTTM0MThCdkd3UDM2YStXK1grOTNU?=
 =?utf-8?B?SjNVVDVVNHZJUzdqdms3REo4SkMvWUl1VUpPa2NPWksxRTE2RmQyY3VQSXRk?=
 =?utf-8?B?anZqZ3pnTEtMZzcwRG0wQnlRalJDN1l6ZStBTUNCY2diVG44WnpOc25RWEh0?=
 =?utf-8?B?RExaS2ovUzNjUjVMZ3E0a005dHFpVzlUQzhXRk5WS0lpanp4MTdBR2ZzYk1n?=
 =?utf-8?B?TFN3N3JmcllTNm1nQkNaSWpzWUhRZklUSGlTRmtYclZZSTVUL0owQkhsNDVw?=
 =?utf-8?B?T21PT2cxZk12Mk80RVVkSkR3bFNhaGJaUDd4OTQ1d2FhQkE1L0o1TmYzTFFj?=
 =?utf-8?B?NGJQZ2FLbG9QMEIvbWJTR212LzBFb2Y1SVlhd3VMQytGMFVtQzZhNGZtb2Zt?=
 =?utf-8?B?c3JZMXFFZU1aY1oxblBaak5FeEJIejVaR0RMSk1lOVgvbk5rMlNNSEg1L0wy?=
 =?utf-8?B?aWlGdmtCZlVPVU5YQ2NOZmJXTXhvckJMVWlwR1FtQW5uK2F1aUllM1kzbG4w?=
 =?utf-8?B?cmJseDdySFBEdk42dmNudGJZeEdxeTVzOHMzc2M1TGlzaDJiMHZ2Wkx3b05P?=
 =?utf-8?B?dVJEdnA3STcxcGxDaU91a1l2QzQwTU9GMWI1bDZSNU1KVTlxOTI3dVFmaVov?=
 =?utf-8?B?dWYwNU5jTW43dWQzR2lCcXVIZEZCbG03eU9FQ1NmUnJqMkFHaUpNbmI1enFo?=
 =?utf-8?B?dHVhdzdrVklmaFMrVGh3d1l5aE1zVkFNZ2NDN0tzQlhVK3BtYlV1SVB5OUZ4?=
 =?utf-8?B?NXRjaEhxQ2s3YmxnY3NtL2NFcWs0Tnh6S2laYitlby90ZFpXcnpEdUJLT29R?=
 =?utf-8?B?dGdXOG5BbXJ2cW12bm9aVFZYaDBvK3ZOOGhFQkdyTG9TbDNmQ2pscXQ2d0VW?=
 =?utf-8?B?cGFpR1FCSXhIOGp4bHNtZVJZSEd0alE0QmJxUzJSWTR4a0g3WnpBTVppQUw2?=
 =?utf-8?B?YzdKTFJiK1FpYU0raktyVEpXNTdtcTlxTnQzZ2dqZFlZelhxeURUTVlSc1B1?=
 =?utf-8?B?Zk5MV2hsc2ZYQ3k3MTlodHBqbDArV3BEZUxOZUd3ZXBWVXI3SFRmTThJNFFB?=
 =?utf-8?B?OCtKYVJxWXI5dW5GMkxOemxqaTFLSkJyTWU1dlVxY3BCOU1wV2tHR3dUcUlo?=
 =?utf-8?B?bUFMSGlNeHJDM3RRYi9SdjlPaW00UVpjS2ZCQmMyS1M2UHdsTUE0bGZvbUJs?=
 =?utf-8?B?Z0R0cDVBc0FSby80ZnFXejJHOE1ZZUc2d20xb3hQbk00Z1BUMm5Qa0ErT1ph?=
 =?utf-8?B?K05Xbk1NQmF3S29aelQ5SHdpOGdaQ3RHYXlTY2ZzQkxzOFpNVHJNamx5WCs5?=
 =?utf-8?B?MWdqNStERW9PMFRjOStZT0hYdXJPTEVWdG1oUGZ5NXg5UWJCSmVyN2VQM2Q3?=
 =?utf-8?B?YWlmd3Z5ME1zQlhxNUIrNHdnNERSTmh0S1J4SmFWMmYvVVloMlVLc29wZEMw?=
 =?utf-8?B?YlhYanA1cC9ldzlqR3ZjUUhJUjBCSzRmbGQ4Nmpxa2w1MDVYTXRPMUNrdEFT?=
 =?utf-8?B?blY4NExIbkhOV2tlTkFuOWhkUFdhKy9UOWFHdFNSOUFCNkEvK2laZkpuemhX?=
 =?utf-8?B?MFVqT2FqZEdSWUFheUNPZXBjQmlCZE9NU1RySmR2QkptaGE3b2lXL1J2MkpJ?=
 =?utf-8?B?cVFGV2kvMXlqTmZpVWV4RXpTVldqN3VldC9sK0RLeFdDbFhqQUhNUjNqVXhO?=
 =?utf-8?B?K3ZEVGhVR2VTby9PdGNXOHh5dmlLQzAzazU5SGhIMVB2VmU2VFZRQ0dNdEtL?=
 =?utf-8?Q?tYZ1thq9VJ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGdUZDB0bXlUeHBkem5kS3dtL1JlUkNWdm02WVIrbGg2bTd2bkp4c2JZVnFq?=
 =?utf-8?B?aDB3M2JSaW5oMU1jR1BaTk9LaTRFSWJNUlhXdFVGV2xOSFZMeTI3TWVuZEwx?=
 =?utf-8?B?ZlVxZUdIUlh4T2lJc2luL1dpQ2V6U2VFNWF0WEVHajVlNXJDbmZ5NUY5SnNo?=
 =?utf-8?B?dmRlWXhIL3l3dkxkSlFBVEVzcnVUTi9hK1d0N0NaL0tFSmd3RXRwSVN0WVA2?=
 =?utf-8?B?eHRSVGNWNlRqVUFuVm12Zjc5WmtuLzVaSVVJc09TRUt2SEQ1V0F1ZDJOSmd2?=
 =?utf-8?B?QmxpNnh2SldtN3FGQjA0aEhxT2I3ZnlzSnhmWXpqV0kzZ0V0a3haTFBqS0Rt?=
 =?utf-8?B?MkpqTFVlSjdRMVpBUU5MMkx2S3I5eFhJMW5qMUcxLyszMXZFRzlrWmhmaEVD?=
 =?utf-8?B?OG5VM0FpSU01K3BWL284ZlZicXB4U3RFVGQ5SlVld0d1V1FyMm0zQ2QxK29K?=
 =?utf-8?B?dm5EdHQwd0JWVDhib0VjZ2hwbTVlbFhmMHg4NTRubW0ydWNZRzE1T2xtUDdX?=
 =?utf-8?B?cGxSRU5LeDFIYW9xVWsvWkV0Y2hKNnZoQVlNOWtLMmdxa2lGY1dDSzNRQ0pW?=
 =?utf-8?B?aEJ4Q1RBcWlkamYrMFpGck0wQjF2N25wZDNWL1l3Q3RJZllaWEhYeHJadlVV?=
 =?utf-8?B?MlJSY0I0TEl2RithWFlqNVZsQVV6MHdoRzFlR1pPaUJlUWhlMUJrdU1EcmNW?=
 =?utf-8?B?b0d1RjFZMXFYcUN1RDZianR4anBSNWEybWNCeWlIbnpYblpzVmtkWUwyWFpL?=
 =?utf-8?B?OU9NQmVEUk1LaDBhS1RRbXN5U0dEYy9sSnZwTWl3R3UyeHBsUTNpNFA1YmRx?=
 =?utf-8?B?VFB3NjdWWS9UVy85UFBMMzV1VFR0YkRZeUNVd3VWZXgxbFBadS8xRFFHcVRT?=
 =?utf-8?B?QzlMZWFScFE1em0yRDZSTW8wZmQzTEoxdWYrYVVMVDJpL0I1bGJiQXk3TXFM?=
 =?utf-8?B?OTJEVnpWd0dVdWtwdEIzU09sem11KzlRQ3ZwNk93eEtnME5Cb3VKY3haWDV6?=
 =?utf-8?B?TzdiS0QreTJoWVlSYVlNQ2NudXR0MnpKQktENnIrY2Eyd3RYcWdvQ1J3NDhu?=
 =?utf-8?B?ZmJJZFFLMDkxa3hYd0Fscmg5UjVtczN6akVpMVZhRk04Z2ZCdUNDdkRRMmtX?=
 =?utf-8?B?NVNYUWQ1aTJqbURuaGt1YnZYY284a08xdUc0ckR4MWpMSFdWYi96NW4reUls?=
 =?utf-8?B?ekcvd08yYjEwa1J5VFI3ME1kWTdWSGRzZEJGVmRiZFV6Zk5valFOL2p6U3BM?=
 =?utf-8?B?MkN6NXllSFgvK0tqZ2RUM25HWTNJRXBLa1NEWHhQZmluTWY3NG1rQ3RBNm9Q?=
 =?utf-8?B?clJzZE5PbnRNWlJHTmtRaEhvVWVJSjB5U1RBd2s0WFJ3L1NPNnRWTXMyeDJV?=
 =?utf-8?B?Znc5ZFgrUndUN2FpZ05VUU02MmV5aldyYXdHdC9RMWZTMElJZkVaY3dBNEdy?=
 =?utf-8?B?SzJPWkxHc3lRQkRJWE5GbG5udm9VTkpJR05KTlJSQnZSQWpNTVJrNldrbkRH?=
 =?utf-8?B?MXZlYk83SEpNcU9vSmdMSVBhNlc4c2x3TGwyTmdGeHBybmhuWm9qb1JoT1FP?=
 =?utf-8?B?NGJGS2Z4Q3VmV2VFajZVOE1jSmtqYmk2Q3A2cTNqMW1xcUxiTjhJSWsvajRz?=
 =?utf-8?B?QUZnRVl5U0FxamFsWHI2RStsbkJsTThtbjlpYjZJQkdPeFg2b0Ryckd0cUJ2?=
 =?utf-8?B?Wlk3TDdZNVpBeUIxemwyZFY1OFBiU05zZ1NoVWFzVlg0OTJTNmNENTFMdHBM?=
 =?utf-8?B?SC9UMHRFd0ljaXJZQllqVjIydnE5MW4vaXhqVTREdGJtVFBsZmFiWHpjeEtT?=
 =?utf-8?B?Y0xBeUFnQ1gxcUhYaHl4bUZzR0E4ZVFrSlE1bU1aUHFyZG51QVF6QWdZMFFj?=
 =?utf-8?B?VHlUOElJdHhHay9PTGtSRGRDMzhvOWJMZjVNOXVDTmlKQzBWTjk0UExWdi9F?=
 =?utf-8?B?aUZRbGhFSFExaFVnZ04xMXZBV3NJbk5lQ1prbFZ6WnMxV0tmMWxxM2J2ejRm?=
 =?utf-8?B?WHdFM2FoTGtick1MZE1jOFdxSE5jKzRvMU9vUG1Ia0lHSnphemlRb3ViZXFS?=
 =?utf-8?B?UWJ1VEMrRUtvWStNZnk4TlFEN2hQMFIxNFEyckUwaTJRbHRDUmphODhKMkFt?=
 =?utf-8?Q?sUrUxTWp2jben6v9NWV7Hr9eG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	81i1PnBCiAYC7Ffy5o+clx2HVeDlvRjt+5+/uIfjTnUJyoiOq7ZwY8jZTEh9mAmbrC/j8WW+UoralNMrX3HqXc54EmIVF8fMjYrAAwodrF4IZ5Kp/vLtJSZIlsBVfRYIAqFDG4L6dlLoGS3FwU2aISuu/G2aOOMyvy+zBnVSG8L6UPS+rfXgq7Ckln5HZFTvL/6+90GhA4d1SXNkErxpa35fRXUCVs3rM8bHrA9VS8JCzNrlbr5DoArlzEaT0txO8GgqCi/Mxiz4jhm2Gpp6C8DBSSIjbqBslb5SUNYf09dR69I7XjNza3NJ+n0MrbrozGEm/gArHGbg9nJxe1v3C3mL4lqi2xQzAjJ0vcOB/mBB8jx+g05NMLp7p8wdlXhvoGqRAGvLHLpPa9StVW3+hSll6CFnlQbg0jOujMB3+vEs6GBwQzD1cX/xyCNxq28whQsJzu2qdEBZ0pgruHzUvFXwG9HaV71e8TAjTnz5rsnM1v3iuhXfkGlau+Wzf0n8ssd/EyJiVYvpq84EggkhjzY+EjMlDK7cunpok3/UcAbhs81v7Dp6DTYiAziwkzBZRwGSi5wT9S4kfAaawJKBgILAs2oq0sFobPaqsLjfG9Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fcc4c2-39ee-412b-b4e0-08ddb2722604
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:22:29.1478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4jve7o0VyOUDukWZj/dBEE0Sl7n90xN2acW/YOg2n75qsccEP+i5eZpn0w7I6wUYHAhJgS0E1suMjoXatMkNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5840
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230098
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=68597f49 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1XWaLZrsAAAA:8 a=BAQKZbTsPSTgUFkPSUsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5OCBTYWx0ZWRfX44PKiY6KdIYK zT+kwyCiuVLrtSl+gYNpwmUxkvL4ED4gOLoNCvi+2pAE/o3NyFu35stmDt52jP0SvE5WoLrBc97 JjyeD1yceHAR4w5q8IFwEqOzyKjJXpqBl3oKu9qAhVpZU3sqm0abBoWfZdS7MNyzV7zUAEUVsjJ
 Lm6BJ/kKFP15nuKBb6hfHVs8ve/QqID1utweCp8eSORURergi/WDs2FKjkPF+j1+i1GVE1vHbFA jJLnUfXz9TWwcKggZTnTgCWEzYh+ELeGMKUDEcWl72IBvcmO+QWRtTbMH++vFGg7naEQoUSAQOB Cy0FuJaluNZHJwv0gJMu1To1nBCYN50b7jMkXuhsQr94M0NtLEkoT4tulIhfJLXFWOtYn73Ic8J
 fc35TnC9xOVZpZzEBCFOCVRoBbsU0EdciRJXaFlHHr2XRtAOtSbz1frC48h+Sj5KekziRPXI
X-Proofpoint-GUID: vB8EpN-cS9MsEV65l4fW3pOu9ibgEwEA
X-Proofpoint-ORIG-GUID: vB8EpN-cS9MsEV65l4fW3pOu9ibgEwEA

* Suren Baghdasaryan <surenb@google.com> [250623 11:39]:
> On Mon, Jun 23, 2025 at 8:00=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> =
wrote:
> >
> > Since the introduction in 9a10064f5625 ("mm: add a field to store names
> > for private anonymous memory") the code to set anon_name on a vma has
> > been using madvise_update_vma() to call replace_vma_anon_name(). Since
>=20
> s/replace_vma_anon_name()/replace_anon_vma_name()
>=20
> > the former is called also by a number of other madvise behaviours that
> > do not set a new anon_name, they have been passing the existing
> > anon_name of the vma to make replace_vma_anon_name() a no-op.
> >
> > This is rather wasteful as it needs anon_vma_name_eq() to determine the
> > no-op situations, and checks for when replace_vma_anon_name() is allowe=
d
> > (the vma is anon/shmem) duplicate the checks already done earlier in
> > madvise_vma_behavior(). It has also lead to commit 942341dcc574 ("mm:
> > fix use-after-free when anon vma name is used after vma is freed")
> > adding anon_name refcount get/put operations exactly to the cases that
> > actually do not change anon_name - just so the replace_vma_anon_name()
> > can keep safely determining it has nothing to do.
> >
> > The recent madvise cleanups made this suboptimal handling very obvious,
> > but happily also allow for an easy fix. madvise_update_vma() now has th=
e
> > complete information whether it's been called to set a new anon_name, s=
o
> > stop passing it the existing vma's name and doing the refcount get/put
> > in its only caller madvise_vma_behavior().
> >
> > In madvise_update_vma() itself, limit calling of replace_anon_vma_name(=
)
> > only to cases where we are setting a new name, otherwise we know it's a
> > no-op. We can rely solely on the __MADV_SET_ANON_VMA_NAME behaviour and
> > can remove the duplicate checks for vma being anon/shmem that were done
> > already in madvise_vma_behavior().
> >
> > The remaining reason to obtain the vma's existing anon_name is to pass
> > it to vma_modify_flags_name() for the splitting and merging to work
> > properly. In case of merging, the vma might be freed along with the
> > anon_name, but madvise_update_vma() will not access it afterwards
>=20
> This is quite subtle. Can we add a comment in the code that anon_name
> might be freed as a result of vma merge after vma_modify_flags_name()
> gets called and anon_name should not be accessed afterwards?

Surely that's not the common pattern since the anon vma name is ref
counted?

And it's probably the case for more than just the anon name?

...

Thanks,
Liam
