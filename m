Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D805528D8E5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697801; cv=fail; b=IYvknH9UcSAwbiKAROuIdQ9aPCvRrCy9+z6LwkRyOAQvdCH3PG7cz7QFMX97Fpn0diOd+PPom2OQBsbC3l3okX2LpprgET3DbNebpJ9KYzAm6qNQcmoL8fVc9pM4+1EDGfhBqc8fPUKUopDE+I53eGXvLzCoNrkiZEdekKcheX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697801; c=relaxed/simple;
	bh=yVD0JbNvoxoQLkZKRCf/G/XgRuJabxG+sb7CVC5TOEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MlbzdR1MaDD0Z389EKxnI/6oO7N2L4dGgQneuEkfDmcOzrJyioh5wrfPB7zpnQhEmc7nyehAY/NMwocXuyjrJet+Tfbev9EA0H1jvfyYmGaPHfTQdJsnfyzfzxbLoqkXpPmUyFc4nAHRqzMovLu+EWQUZ+ht3Y+Q+JeH3oZwQ5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lym7KNl9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ppw4fAS0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lym7KNl9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ppw4fAS0"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGXXHw015556;
	Mon, 23 Jun 2025 16:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=26RRkMHmEvWv0hG52b
	76kPmmPKf0C4XzdE+KGzckfxo=; b=Lym7KNl9Dx9YXLTMBcdXQR/bV21ZGhSDi2
	syypKDe1b0jtAsPt3oUBb5AP3IdUuvSGhTPEPyuvYTyg1nDHTDNqUj4jZm4NlXBO
	XD0LN5CQBUgBArpUkcVl3rPPffH1tU3gTsjHLdbuE7BOiVrjOm/Nmut8TiQ6X1h+
	m62UcR7zLq+2ov47aa44Jz19lfYQQOxlZSH9q6hebK9n9zbIznLSUJgMykTveDNZ
	yEQP0dE2lO/C90cIrkm8aE+X4JT0uwNQpZuk18bJJ1VJp/S9I/JQecTURPMA+G7a
	gTSeRIUosh+zOcKPKmnTAC22bRyyZe8l+y5/1+Ld7ABsyOtHTDWg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt5j318-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 16:56:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGYXAR024408;
	Mon, 23 Jun 2025 16:56:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkpkjnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 16:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGkFwTqGfttoGcjX8yVaWFI6qX6iDpKswE4ytcvoFw7oZ6zqXu8Xvar/NknkoItlLIaz5tTNX/M2qEy1R5HBhQbJ81Is5AWXeAFTbEn5Aky8jQQySZ6FC/nkLLSPqXrrDfLR8D7mux4FdekZofbc9/tFqTx3vNPqmE1tiCpwJiNV92fPla7cQ10iI1eO3Wm+sMqUCcPZbu/kOVWOehXbyWRxR4tnuPti3KRvYi5FQK5sBAZH407tFwDv44rgt7WLLH0YpVjW7DIA3m4VStwXvLxBId9j/y2A9gb9DcJ3KmWlpZ6bnHYyPDfalbH+3QCO1sAUhUvEWHv/EtQBskxE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26RRkMHmEvWv0hG52b76kPmmPKf0C4XzdE+KGzckfxo=;
 b=jn0f9je8bApF/6f7C/uEfIN1VEI9ctznFTwWmrgwfig+oDcK8dfxiY6zg6BzN42u90KBSfFo+fBeMqi3n9HiI2jwmXr7RAu6kqWUyR1fbaENiwJGSIBxmbOD7+HZok2fyND58S+BIq2GsPqyQOlF/m76BDkQBRSj5EX8eQiM4q6eQO8JiSh0AJQlNDPJHZKZ/zMSqnPgLZmhv8aTFh6Zs0gqb6hR4ladq4OdCxzGLDTSK1kdnqfQ8KP8+ivCFSWi41yRop7NgrQT0koctK8C+3MC5EHFCH9hNh9I3JXrXr0P/2k8lxLbIBN2Ork2h8VAOcwB0oicg1Ah04cL+29Wdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26RRkMHmEvWv0hG52b76kPmmPKf0C4XzdE+KGzckfxo=;
 b=ppw4fAS0OoExnUgJ9vi4j67D/yJzcAo2ceYrVQCuPUwCQb9musR+91ANVuz5fnczuaPFs6QACGJTup/Dh+UfpYR8CwNT5MHyS46zTH/HFIICOGFX5ZF4oxDDZ3vLMpF+T5GdWEsTW+KtKuTQPXEbvpaD3mF9or9MvkX2Fw6rf4I=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW5PR10MB5666.namprd10.prod.outlook.com (2603:10b6:303:19b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 16:56:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 16:56:21 +0000
Date: Mon, 23 Jun 2025 17:56:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] mm, madvise: simplify anon_name handling
Message-ID: <7fd9d523-d331-498d-8b67-2b525c0de37d@lucifer.local>
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
 <20250623-anon_name_cleanup-v1-1-04c94384046f@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-anon_name_cleanup-v1-1-04c94384046f@suse.cz>
X-ClientProxiedBy: LO4P123CA0223.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW5PR10MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: abe5414f-42db-4778-6b66-08ddb276e18d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OWMHFdPwVDB/ySlPhq58B4bHaxeOzmn9aR4lx6eu/4U+UevBKzGrzrCZQbAx?=
 =?us-ascii?Q?9yVN1DF7Cb63Iqx+owOeEvfUFL8bl9YWsMbOucguO/xPDLsE/Q8G3MbREElW?=
 =?us-ascii?Q?kwRg1E8rzxFSoCi2CykmXRGP+6tYWo3e8lPxhPZA4ixhkaalBYjDriHdOJYB?=
 =?us-ascii?Q?xe6Q7CA87QLrZRu/y3UPkPzEhlIgV788UkfAHR6pOp770l2GhHWe4UZc0rHD?=
 =?us-ascii?Q?lzlxTOpxMfHuFGy93qVtadfRDjUU/XvRJ5DMiyTgsK1pLgSacJEhBWFq7kIs?=
 =?us-ascii?Q?5Fy2PJ5yuUwwxSfb/n6aXRFYhdjZTJDdzilPI+Yd/w38QbPQLOryGkyQQLMS?=
 =?us-ascii?Q?sVl6kDbqVqSiWgn2L845sxv7Sp5Yw8jhMo+XpCIqqHahNitp1iHri9t8P2bi?=
 =?us-ascii?Q?H3ZdLFXmr0idYknKsySd7mGHs0PoYwtI8zi+Ef7aKArrfcWfiSutc9yUpTVk?=
 =?us-ascii?Q?SzBoTJ+I4UIeucdK2ix4b8gUbLpRmOFS5ECwosY+rct4Xb3q8WQW2pyN3M5I?=
 =?us-ascii?Q?UIzP9+HpQ5VXH+V2kpJdrX8uJotYBFofq77wHjzzBB0GbSXkPX2RYBDrnXq8?=
 =?us-ascii?Q?nxtk/5udYQFwAqm3j20ts49wEiwPQjN6lomFWK0hAeMmEHtofVR89546iOPY?=
 =?us-ascii?Q?hgRe1MQRccSRbQsU/gKbZ1plvSTS6eK5/wYJpEmnfaU3j4t2MnRy8ZsLxkPd?=
 =?us-ascii?Q?i3ENBKqPuyRDeEpYS2xPTnj03trhAQ7davqcfqOvmnTCDrfoWFOBqNZKoDOE?=
 =?us-ascii?Q?LxPVaSjYRdBYEc2ZjXTp6+0DjbQRLjPx42nMUkxFyqitFNaXx4fnnGeDqnWS?=
 =?us-ascii?Q?cckhtZdYWgo/iTcJ36HR9626Ip5ZzSNXPzl5HgxtKqIzLVP8OdRwtyICrZi2?=
 =?us-ascii?Q?elm473PpShOyw0oiU7nNw2ZS7zJFbRWFDCnK77Gf6s57szowPS2t8RNZ2KK7?=
 =?us-ascii?Q?vCcwds1vRK2fVrH0tsvJ+Mz5rnnOnKeNiWyfVxpXfFEUHY2ruXOiB1IXyEU/?=
 =?us-ascii?Q?El+HDrHYRDczFVCg8lDqqexsHpPWto9U2VWejIkKjyS3oUq3rUFmMGh6Skc0?=
 =?us-ascii?Q?wqkQY+jJe0aVgqpgQ2o288NAMXHAInlF29ZR9Qvlmop9sd3Lr9tTKoyZ24hc?=
 =?us-ascii?Q?j+Rrozr0TdRSG9IiRx1M++2jGP66J1Tbu2Oe9uH9b4VrRs7xA8DUV66HuTXV?=
 =?us-ascii?Q?YggR+rvzqxG/rn5rCPadA2iKxWAWTa7XtTi4bsyvGERQaUShaCZ31nR2n3gi?=
 =?us-ascii?Q?cfXpYdY2WeOIW3eSeBjmIKFMCuqFkB1Jp+pj3l1223LVL712e2yyK8qkSzx7?=
 =?us-ascii?Q?STH/rEp77hTMLGd9mrLHSnnpvbYHQvigpAvhqDU+f4f3qrgr+OfEuFnUJTKV?=
 =?us-ascii?Q?lb/eZzE5EU0xNsIL2GBmvYOtLoEUt4dVmBuFO4iUmM9iw1jj1twpCOG7j74q?=
 =?us-ascii?Q?9hp7uo9nd5c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cHUz0zmOg8oHZiz3MXToV4LxgBjf/Cob5oA6RTSIFQ7ABoIvFwgkE13Otdwg?=
 =?us-ascii?Q?8vXAVWMSGIXvqhm7hPL42nXWGhGSL9usxHHj7zt6PWWlLnsk+V9lJlLi9Pea?=
 =?us-ascii?Q?fJWIwC/9R6MrJbwzYngpA/cC69Qe7/GTQ/wptg3leG6G9niaGxjwjWHAwYTY?=
 =?us-ascii?Q?HFTWn1dq4pxkpjmKw47F7sjktA35LN6O1yGKke3k4AHw4mnl51+IgdTA9Qd6?=
 =?us-ascii?Q?2AKEa7RG2vxI8QzXOoivb68MejwUQ9R2mAEe9xm/1iwzO1ZHkRdNsPOipGic?=
 =?us-ascii?Q?y4/v6m3oaT5iS25yUWXNi8rLLKlHKN8ZiolG/9IyrfIxIG8RSrHhALZiIAoa?=
 =?us-ascii?Q?xofiL/gv3mAcsZ1nOsW1zPZYI8oI9xMcHSpfLtYkyb4e15OYCWZqJlLbBLWS?=
 =?us-ascii?Q?7qxZkqc9Z+xZwsCBuMSI9/emp7RLkqC65tt31Epa5DcbBqdsyonwx5H7/UER?=
 =?us-ascii?Q?KoD/mjiIqWRWejnBiJedyCGjc3tkOdvEc0fD6tAObgGBjwzG3xmWDdtJtdUL?=
 =?us-ascii?Q?hf3CrH+/QxD2FCTDLVyrytQC8p+Ges5kCneZwtZrx51/Ohrrj7rn2jPyfpdJ?=
 =?us-ascii?Q?s4M7eU8TdEvP674Al/2bzskk1UBAH9mNJR8wYgt8kZC74EJ4ULHUmDycDjKV?=
 =?us-ascii?Q?waKgHTpmun38TCmuWKTDSl9tPURR8DPoSeDjcaa1Pwagv0k79ZsQeneMG2tO?=
 =?us-ascii?Q?MHvgqrvxXZq3vE6J3ECh0tXsUv/fXLRcFVMwlbKA7uPnaQE+E+XJP7vVUkc4?=
 =?us-ascii?Q?LQqXxlz6UIphgkSH7E3H9efLcath1D1l0tWyvnrkhnLh6Kc1hwWyJVU/RGWl?=
 =?us-ascii?Q?duNqTJbQkdSoxo6CXihSHF9jqsHpycxBbsTNV7hm7vC/KVcL888aW55d5WpY?=
 =?us-ascii?Q?UoSYnk2TyI3PrY543Rcwbp2w1g+AynkAHdW7Z7MoOelsnv7hrp3e1zcn+Dne?=
 =?us-ascii?Q?Zj99PDJD0mknhUXAjAx1eBahwtJLkHSfchgpL/Lv305zjAwFeZFiKDpeps3a?=
 =?us-ascii?Q?PJ9G6qXyWmWTcmXqcJuoiZ+Qq5wTkZ5fdpZgf6GodDOZx8EBBtOJxvoT5dad?=
 =?us-ascii?Q?cLzfLApvvhR1rTsK0tFpXonDhhCP3tqLbxQYVbD2xf+i+Ou/dwPRK7IESUuq?=
 =?us-ascii?Q?U+GAEtoW2iIRPluVPJ2qTGKAqD8A5Epq79hyURULbHrpr8n7sSHxvcz1TwzT?=
 =?us-ascii?Q?9njR5hEsPctdcIidIkvjx4/aZvi+twD0/eWHYv9tIe8gbJ088sn39LhFqzTV?=
 =?us-ascii?Q?t4f/RjFm2vJx9ln7O9YPUl/hTpjL02xNQ8ojcXtoinEJ1f0mULzWoLh3t2Jp?=
 =?us-ascii?Q?YmDNB46E5G2QyFdEhAw8mNAQ7YRZrJ0BjQCdz4I2VBPuaTdOBjrqDvaKyDKF?=
 =?us-ascii?Q?oDCqxHyA23Ht9SNYWke/OrIePI1oYYPM15RTr2igM9mKD6V3J/pmq+9aZ/QC?=
 =?us-ascii?Q?uF5DeO0jdUpLsj0RZYOc2UVzKNTxaBM55IGhMzXrsI0VZk/Ukj+GXTEYdd/U?=
 =?us-ascii?Q?l/4scd4TDhy6IncZhiwQQryWQbQLYfY9JCInABt13Lpyv4eU0esF+VgJf+5X?=
 =?us-ascii?Q?cana5daBkyaK0Gh1StnDnfXiGgzB9KhZf1qNSvOtgNrQTxhtoL5EqJU4QYAm?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SPLFEAFqpE5n4Gg3HgRhsTZha/0d4SyvtYjd7jWLk8ZA/7zael9MeE5A4p+gNlQeAzZqM0sGt3ru8uBw9KzvO+ShqlvWLw31bTZ772n0uMz66zgoONImrAknLC5zvNAqV0f9to9DjKJ1jEzxdWNXI6ApP9eF/wntgJJI2TmtOUlOQKUgjXgH1xw+eOJg1ZxOoLaO/+8TuQhuX0EAjaxBNvH9swRhCaJnMeEHIWTHcEu4iYVG/y+tDIEKQ3K3mfRCWa2VcarLQEFlyNsU1+3XiSBz+Ux5uRO86Yf2i6gdFiuDU00g4EnPIxAkdiqJ/4lCmHZE/DARDRbEkzJiMD8NEcAobgEJ5n8fPh8BCRPmmaahc9RkNJTfAeh32lAmvXAYAiBvcLLgzwdxhlDqo7jtqUd14MCY3rq8XtpTj9Yfiea93G5QZLWPvjlt+U46Po3Lja3XpGzEYFI9jFQHdlhmnIvI8+4XDGyjqkBZecKkzIYuzGmMJRMUk0mEbMtyO7KtZ/5LJlYKFDWeUDNnuK3HeyJz6wVTj8kYWoaRHt0OWmbvUgBn6Kha0WyagQHRH7Zvj2hPt2qHZk8CRsX8wwTLjLdBUWdfMwewXW+aNV1enDg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe5414f-42db-4778-6b66-08ddb276e18d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:56:21.7524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nbqj+v3EUWoH0SDhAMrN0b9ry+eX6uwfUg9oW3vrZRlaWF3WJwaAiidrYh5lNBjKy/r3oVonoV4SO+iYM5nvSEkyA0NDeM+PRn766TzVzzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5666
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230103
X-Proofpoint-GUID: izdSO5jiteM5B8-Re07mz-J4R_ZsAT8b
X-Authority-Analysis: v=2.4 cv=PMYP+eqC c=1 sm=1 tr=0 ts=68598738 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=H_hO0AOPk65xzRFl93YA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwMyBTYWx0ZWRfX9YzCJuQwwZve 6MpTEF9+X/bBelhAWI9qYQpj09UWCx1fsfGQbI7IuDZ35lbwW/nqKnNmVX10cnTjollaTfm8wmS HtxqbPiJ1QdRlxnD8IVBp7m2BoiYzb3zAVWIuZR5ZmuNQD7/z7OpH1zMuS4eITp0noDiqSv/x3Q
 52PQe5kBqdxDNovz18/s7Z1PeYUUDYykqAQjCjJaBpxFTG05Ewb3/r9WC+YbcTTJIzC84I3e9SC JHtbboqPFRXx4542lkjRB3LHwbkJUdgTycbfaGu9LHgd4rah38bpwfeqb1doYooxNJ+e++VzL5p n33qHgFcL1B3IHKRnHx70PitllbmFip1KWYKC6Shz1gRjsLWx68jlnnh7pB/aAg7n3YxK1jVBmh
 wK7Q0oUeO53nw+kwNyLKcIltT47Fnmu47kviMiU9RLSB67Hjt++OelnN135w5e6Wcjpz+BTe
X-Proofpoint-ORIG-GUID: izdSO5jiteM5B8-Re07mz-J4R_ZsAT8b

On Mon, Jun 23, 2025 at 04:59:50PM +0200, Vlastimil Babka wrote:
> Since the introduction in 9a10064f5625 ("mm: add a field to store names
> for private anonymous memory") the code to set anon_name on a vma has
> been using madvise_update_vma() to call replace_vma_anon_name(). Since
> the former is called also by a number of other madvise behaviours that
> do not set a new anon_name, they have been passing the existing
> anon_name of the vma to make replace_vma_anon_name() a no-op.
>
> This is rather wasteful as it needs anon_vma_name_eq() to determine the
> no-op situations, and checks for when replace_vma_anon_name() is allowed
> (the vma is anon/shmem) duplicate the checks already done earlier in
> madvise_vma_behavior(). It has also lead to commit 942341dcc574 ("mm:
> fix use-after-free when anon vma name is used after vma is freed")
> adding anon_name refcount get/put operations exactly to the cases that
> actually do not change anon_name - just so the replace_vma_anon_name()
> can keep safely determining it has nothing to do.
>
> The recent madvise cleanups made this suboptimal handling very obvious,
> but happily also allow for an easy fix. madvise_update_vma() now has the
> complete information whether it's been called to set a new anon_name, so
> stop passing it the existing vma's name and doing the refcount get/put
> in its only caller madvise_vma_behavior().
>
> In madvise_update_vma() itself, limit calling of replace_anon_vma_name()
> only to cases where we are setting a new name, otherwise we know it's a
> no-op. We can rely solely on the __MADV_SET_ANON_VMA_NAME behaviour and
> can remove the duplicate checks for vma being anon/shmem that were done
> already in madvise_vma_behavior().
>
> The remaining reason to obtain the vma's existing anon_name is to pass
> it to vma_modify_flags_name() for the splitting and merging to work
> properly. In case of merging, the vma might be freed along with the
> anon_name, but madvise_update_vma() will not access it afterwards so the
> UAF previously fixed by commit 942341dcc574 is not reintroduced.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

I very much love what you're doing here, but wonder if we could further simplify
even, see below...

> ---
>  mm/madvise.c | 37 +++++++++++++------------------------
>  1 file changed, 13 insertions(+), 24 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 4491bf080f55d6d1aeffb2ff0b8fdd28904af950..ae29395b4fc7f65a449c5772b1901a90f4195885 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -176,21 +176,25 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>  }
>  #endif /* CONFIG_ANON_VMA_NAME */
>  /*
> - * Update the vm_flags on region of a vma, splitting it or merging it as
> - * necessary.  Must be called with mmap_lock held for writing;
> - * Caller should ensure anon_name stability by raising its refcount even when
> - * anon_name belongs to a valid vma because this function might free that vma.
> + * Update the vm_flags and/or anon_name on region of a vma, splitting it or
> + * merging it as necessary. Must be called with mmap_lock held for writing.
>   */
>  static int madvise_update_vma(vm_flags_t new_flags,
>  		struct madvise_behavior *madv_behavior)
>  {
> -	int error;
>  	struct vm_area_struct *vma = madv_behavior->vma;
>  	struct madvise_behavior_range *range = &madv_behavior->range;
> -	struct anon_vma_name *anon_name = madv_behavior->anon_name;
> +	bool set_new_anon_name = madv_behavior->behavior == __MADV_SET_ANON_VMA_NAME;
> +	struct anon_vma_name *anon_name;
>  	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
>
> -	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name))
> +	if (set_new_anon_name)
> +		anon_name = madv_behavior->anon_name;
> +	else
> +		anon_name = anon_vma_name(vma);

I think we can actually avoid this altogether... So we could separate this into two functions:

tatic int madvise_update_vma_anon_name(struct madvise_behavior *madv_behavior)
{
	struct vm_area_struct *vma = madv_behavior->vma;
	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
	struct madvise_behavior_range *range = &madv_behavior->range;
	struct anon_vma_name *anon_name = madv_behavior->anon_name;

	if (anon_vma_name_eq(anon_vma_name(vma), anon_name))
		rturn 0;

	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
			range->start, range->end, vma->vm_flags, anon_name);
	if (IS_ERR(vma))
		return PTR_ERR(vma);

	madv_behavior->vma = vma;

	/* vm_flags is protected by the mmap_lock held in write mode. */
	vma_start_write(vma);
	return replace_anon_vma_name(vma, anon_name);
}

/*
 * Update the vm_flags and/or anon_name on region of a vma, splitting it or
 * merging it as necessary. Must be called with mmap_lock held for writing.
 */
static int madvise_update_vma(vm_flags_t new_flags,
		struct madvise_behavior *madv_behavior)
{
	struct vm_area_struct *vma = madv_behavior->vma;
	struct madvise_behavior_range *range = &madv_behavior->range;
	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);

	if (new_flags == vma->vm_flags)
		return 0;

	vma = vma_modify_flags(&vmi, madv_behavior->prev, vma,
			range->start, range->end, new_flags);
	if (IS_ERR(vma))
		return PTR_ERR(vma);

	madv_behavior->vma = vma;

	/* vm_flags is protected by the mmap_lock held in write mode. */
	vma_start_write(vma);
	vm_flags_reset(vma, new_flags);
	return 0;
}

And avoid all the anon_vma_name stuff for the flags change altogether. This
should reduce confusion at the cost of some small duplication.

Note that we can then put the anon vma name version in an #ifdef
CONFIG_ANON_VMA_NAME block also.


> +
> +	if (new_flags == vma->vm_flags && (!set_new_anon_name
> +			|| anon_vma_name_eq(anon_vma_name(vma), anon_name)))
>  		return 0;
>
>  	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,

So maybe just replace this with:

if (set_new_anon_name

> @@ -203,11 +207,8 @@ static int madvise_update_vma(vm_flags_t new_flags,
>  	/* vm_flags is protected by the mmap_lock held in write mode. */
>  	vma_start_write(vma);
>  	vm_flags_reset(vma, new_flags);
> -	if (!vma->vm_file || vma_is_anon_shmem(vma)) {
> -		error = replace_anon_vma_name(vma, anon_name);
> -		if (error)
> -			return error;
> -	}
> +	if (set_new_anon_name)
> +		return replace_anon_vma_name(vma, anon_name);
>
>  	return 0;
>  }
> @@ -1313,7 +1314,6 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
>  	int behavior = madv_behavior->behavior;
>  	struct vm_area_struct *vma = madv_behavior->vma;
>  	vm_flags_t new_flags = vma->vm_flags;
> -	bool set_new_anon_name = behavior == __MADV_SET_ANON_VMA_NAME;
>  	struct madvise_behavior_range *range = &madv_behavior->range;
>  	int error;
>
> @@ -1403,18 +1403,7 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
>  	/* This is a write operation.*/
>  	VM_WARN_ON_ONCE(madv_behavior->lock_mode != MADVISE_MMAP_WRITE_LOCK);
>
> -	/*
> -	 * madvise_update_vma() might cause a VMA merge which could put an
> -	 * anon_vma_name, so we must hold an additional reference on the
> -	 * anon_vma_name so it doesn't disappear from under us.
> -	 */
> -	if (!set_new_anon_name) {
> -		madv_behavior->anon_name = anon_vma_name(vma);
> -		anon_vma_name_get(madv_behavior->anon_name);
> -	}
>  	error = madvise_update_vma(new_flags, madv_behavior);
> -	if (!set_new_anon_name)
> -		anon_vma_name_put(madv_behavior->anon_name);

Obviously I'll leave it to you as to how you'd update this to reflect that? :P

>  out:
>  	/*
>  	 * madvise() returns EAGAIN if kernel resources, such as
>
> --
> 2.50.0
>
