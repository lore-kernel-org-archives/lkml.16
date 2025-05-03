Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA482798F2
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306860; cv=fail; b=rqniOStVXLinoakxRL9zwWt6QHUwNvEFEMGMvhArilWAXTSbwp4Kh2OOYA33V9MRj6XAu6SsiHJ6DWDsPmciGNUq8nzeYuZu3FpSP3HGtq92I5Oz/5GYSubAOrJC8KP0+zr/3wicnGKEKSKWmZHTKFA2IxLQAdo5F5otxEcNQ0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306860; c=relaxed/simple;
	bh=jKZORa4g14kSfcnKrOuxymjZ8DPEq63yyK58MBFFU84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xw/sZkjzDqbBDqmt6X9aAsbOkhH/EoAzyrnujO7V2lk3b8XtPddAXAilH+dUwg6+RprXMMANs+K4dhIa4sgOdOEOI+gXLAIx4+jyhySgE3X0WF/Ggh1eV0hVswY4jYxVlwTKEy1HzecuaHJYIrJjJ3/9SJLd3JsxjS2cpjz8/Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QhVAAScQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mQnAAkCf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QhVAAScQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mQnAAkCf"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543L1nxw032305;
	Sat, 3 May 2025 21:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8B74GaCLue7r0Bt62+R38Fa8FABO8o7zSAGbPu6YmJ8=; b=
	QhVAAScQP6xU9RFlgMJycA074jwq7UBD0eFR+vKL8GIjhaDUNh4ZBx+fLP0FR+cw
	uRe8Vl9llGmehZotm/NX+65+B60mbyhX4HQJc3OJ6naUg/srTHFnzM7go20KFi8a
	FqVriFa97Xg4TmErf1je6zpTnlacCqbxGH2FN6Fg7LWYaB7e31UpnhxHGc4zIw/h
	+yANIzTWqVpVLWW4tgeL58ziFHuZe4jWSF6edp8VMJ54yrnzF7qPiUQ+Et0P4egf
	OND0q+f8v0tots2BzxUvGufy6Hevpsh2d70xKcX82yxSYnzXw4j8V+5do1Hyk3Dx
	Y/3yFTJJJm0VqA+FDJRTmA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46drqp81wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543HmmbY036125;
	Sat, 3 May 2025 21:13:02 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010000.outbound.protection.outlook.com [40.93.13.0])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k6f61p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BolBNFp0hWykdckx+YpfIj//65RWx0utMGkZ7yo7EkXkw1vV+mkZAG/0SkT1GjzlfyfgynqmVYq8Q4fm/pj/aXgqTqaXxxHq+yT1wWKFv82r7HNlWmbtrOuJrxBTtj4wASIMgG6P3LzLY5/AWEMNeQHv+I0X/AJbLOR2R+E8essn/WVEccDBBOyXPH6vXBfXXWBHvDePOaQTPHUnbPqbgXCcmy64Fs45NBfVY8ajO2onFL0Uz8SDp/dGuIEFQWGKkv1sR1b8/Knq5DeqCLDpiPRsOhaPlfxUTU3gIhy9ZldYG14/+hKr3uMyVqQqROpLd0pBGswh8/jJ2aU2CgwW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B74GaCLue7r0Bt62+R38Fa8FABO8o7zSAGbPu6YmJ8=;
 b=Apkb+NYCXsIQzYUwkg0RdKDcmtVBabEEWMljoA1E9QkKaJJY+uGgWrb4dz1dPD1V+/affstXIFUL34njNydNDE7wf+4VDMNbyIgVFF+Tc0foCrLpX7izq08LciWqtlJ57caYgiDGQ9OK78Y3uAOXBvvM19bVBiE3H4W0nce2+tieYvxsriBN/BXIT33/u4FGnZNXBHp7bfEzwAsEGZ0P52LlK6yqi0Xjl7Gn2zcCnjIi3CTxhQWmBCld8Adw+Ol0sbJg4yYzBjHr88Nl74JqcKAhVG3qiTDBepSiAS2uY71rtrLC6lSE1oW4eiC0gS/faf/TWcAQnXMsJusTuXaL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B74GaCLue7r0Bt62+R38Fa8FABO8o7zSAGbPu6YmJ8=;
 b=mQnAAkCfPXxMzHxyiXz8wAF4wq2JcwyVU4dzuVQnHSkLE927EX7gZrB7ByvFO6q393s8n2lFI1iXufUpQNWt3SM9YthYhGvAkmS49asrpmpGtTdDzl8286WdThAujf19yq/YgLeq1Yp7l6joipDD8DijcLdQCH5nY4FP1npUAwM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:13:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:13:00 +0000
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
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 06/11] tools/testing/selftests: add mremap() cases that merge normally
Date: Sat,  3 May 2025 22:12:28 +0100
Message-ID: <cc4a09462747b50a0ac6139c549219c1213cea8d.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0210.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: cef9a559-b0d4-45d0-618b-08dd8a8748ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+mgk4RHiRMMZpmZO/SGe7o8BZB6Oo98l2fjULdxLJbrgQIQ8wGYeM7mpVdyQ?=
 =?us-ascii?Q?J5nTxyvWUZsmPmJZKD99WOyzBQm9LXcIf0uLAHzX5FglfdRHZlP3GRgqHJ1x?=
 =?us-ascii?Q?q6P1nFmTYrTBAbmBpQvm1KRIk4fECyPresBSZUONUO6gFJMpk2pYuEQZ6Y3b?=
 =?us-ascii?Q?/qp8B6fCw5ViVD/KWjRqG/1gmaoS5QBfH+E0iOoBLIqMtXaMdQOnYmZmxGNW?=
 =?us-ascii?Q?c+q0RZUs+sm9Uo3yQDDKPdtHGsJVcc+XoNRDntHk1TgbocfJWZKT3RLl4o+w?=
 =?us-ascii?Q?KGX63TyPFCLGj2N1DCpWC7ORe0XsvQQvuMCviu7mjsdMcb8SZ/7AI2N+jU+a?=
 =?us-ascii?Q?uWXqqJ3g80pjrwcjCwjoUUS8916/KxaTXdgykTAAke0535XGZrACg+XijAK0?=
 =?us-ascii?Q?oj2HR7+Gt8kEE0w4sWvfPJq03SjQJh/exf9BcznPEa+5MpT5z9hBlrO4AlUy?=
 =?us-ascii?Q?tPErXFpFVeDunVdotq1pg4gg4ejaMmkapwDzl6o0/btdt2xw7VWnxfCUHGZ5?=
 =?us-ascii?Q?TyRooAN5PA4RXR+7DnOOsJHPdjTAD3wXGFQXA0kcVm38AchZGyaViq0w+yI9?=
 =?us-ascii?Q?iN9RKvhsdltaMj2wFVrjG6gABOqni5PIO7hwQbq/AhpDpsyLrh0y1AWIlFm8?=
 =?us-ascii?Q?AL3DKXhrhbyog+BwrGUdYEeE8qYFYtnLn+poVESbBv/Qed2SoV6ml57QSp1r?=
 =?us-ascii?Q?kzvUehoyejOY8CgviLnj6ocrM6TJHWT4EsLnGANnrWheg2Z7Z1tE3O4AVCna?=
 =?us-ascii?Q?43ceQPA5By2Tvq2VZ+5gNC2EGdiyMH4qBzTawSGm13ijo/ZZVijBbhDajtcb?=
 =?us-ascii?Q?PRTIeDYvDAXj6NnlTwD4KT6xh607PG0K5tl1dhGeLQpNUQVQs8RPhaDluE1y?=
 =?us-ascii?Q?fNEeVaV3y6nVhkBDYdorELaRXzdq1u8X3oNHIx10Kow3glswRvZG0afoaJlw?=
 =?us-ascii?Q?hm3eOCAY8Hio5xg1W1itPnUIubkJRPiD9PenhZq8nFThnHeeWhNT0uqzruAO?=
 =?us-ascii?Q?K5UjDS8iHNXRxB3sgV+t2aOc9mbqVESNgB/M/5p24lrjEock9u/ljTR6fBSQ?=
 =?us-ascii?Q?8HMq9givIuTSrCAlvn2xombxB6vyrDzE89egETxTUc0XNV+lFbI89mmNCxVg?=
 =?us-ascii?Q?pEDK2p568vGKbsxz4pHVOOcOq6UEaHFxn4JjH5zxPi5opoyQsZC1iEo3xQOZ?=
 =?us-ascii?Q?LWahiKdArTiIWCl8R1QjF34Ot1iyTnqrikji5Isb015oRHa06ptdKHZGC4Vw?=
 =?us-ascii?Q?8IDb/jo6Qk9pZsMY1mZ9kPfaFfeCo3pAT6zUr+7TwDxnEmlMeCwaQ+GqtdS4?=
 =?us-ascii?Q?eMpAAp/2MuU4SvRohTd25MBHZbiVSSyC7DcC2DpPWSh24fiiwCVkXHKauRFY?=
 =?us-ascii?Q?xlB5mlIfOeR7WImUKDnmC3l3DO63uDAXdqZMSqP/xGdbnEIl7Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MeeFXqPH3cJIC99pimyf6VQ0IsxoutFoiI5U4qmrSKz3LOAHo26XLpgIb751?=
 =?us-ascii?Q?TKclz9E5JG5mgM+uXlm2s94Toy8QHJiNYsAe3mInGAQ7S4mI8wPKkbPR3Ocq?=
 =?us-ascii?Q?WPVDOMTXzJBPTv/4G8/WUmkYaAUNCYRwcDT6Jryd1e/k8/cyCrORxuu83EFo?=
 =?us-ascii?Q?huWu1s4u2r0YszWu+lQn06eNDYhQNSMFrsuIjhB6iIl0wmhqqTsm0Y80nMjb?=
 =?us-ascii?Q?c1Ez4nOPpUdDj6wrpFeg9dVC+zzAQwOHCo9XmVi5ykgMVDrin1EeSwi8V/2j?=
 =?us-ascii?Q?GImiCZneT6M4PyHZju6DsepHyanxf3K4mZVsC40Vi9gHaZZDjbk1+S15Hq5p?=
 =?us-ascii?Q?Uexdrt7CwyLXe182hhSmPY6Xc2+MtL3JSu1FK8mrion2nJIg+VwCfU0zGwd6?=
 =?us-ascii?Q?VqQ9/gQJIGyTU3X8kVyozCDWLVKpBHoLKdbyfQ0iA0LMLgLdG1tDWE/escNC?=
 =?us-ascii?Q?9flmfeUcqzZU0hds9EYyM4yVf46X/dXxd20vRqtTo7y2JC9pZMKfJNTTQhSb?=
 =?us-ascii?Q?T9TD8JChshPDVoBaX7Zt7Hh25lhihQ2iRCQFPwHYImbIK6qcwdUe8q4ic3CY?=
 =?us-ascii?Q?9lmyWXgoKx0hD2W33W/QSzp+Wd7LXwgR95T2koKboHkwMcXcJZthHOtQUUER?=
 =?us-ascii?Q?S8EVCN72eAODt5n7lMkAT8Pi29Due5VGtQMVZ7XgxyR2NfEXU0c9y3qL/YP3?=
 =?us-ascii?Q?5pllIAKI4s4zwY/uke2YS8aAf+/Th28yLasMKArY2hWoHvvHIHqG7iY+zM77?=
 =?us-ascii?Q?ldyunWmgfe1+s6v2aq9N9b2cyte5sP1jRm+FOfwDi+De6WABNJNPwXK2At6M?=
 =?us-ascii?Q?YDEcoNcnM6g2Xs3bw8ZmybyK2M0FX8gPBoMGukZ3G4x12roapq3jWxc5iKZk?=
 =?us-ascii?Q?N7ZQDb3PCjesl8WoxDiRY/97hSwHG0iVU+Rs/nfeflqAxIzX2RO5VNGF881+?=
 =?us-ascii?Q?BA5lrr7V1FU9QVBYPbqTbL5CYlaqucFaKbcSTHzy+J5uSkDFeCU0C5t2zM7w?=
 =?us-ascii?Q?PtNS4xny1Kkz/TxFW48Pp3L7y3XdYpRmZL6jzUi6e0EaRV/hRl+IV3vNUDie?=
 =?us-ascii?Q?ckYDx52C0L5oEi8oQkq31K8dpCZjZnPVGrcSoDV7r6+G71/lLyuWagVcGgSl?=
 =?us-ascii?Q?zrOIqEkcrhFsJEUmIhtBKEV8gN+URrTIZU59P609LPdUNs+bM/OKN5foKIVx?=
 =?us-ascii?Q?RXiOS1ZlvITKTVS7ghW/FrpIgkiCH2gYCmvrHvUS/7ubbpIQoFxhyi7bWkBW?=
 =?us-ascii?Q?PMiTo1N/neYWKN+khxUDK3bGJwCA7N8xKp19RDvoBM8BazSWicLJJooHvgiz?=
 =?us-ascii?Q?LmrdwGRnJzWG+2dWKCncMNMbK0f3trSBFZRJXmI7SlEzwHw8gR3vPYJmC1+U?=
 =?us-ascii?Q?5oblkEBtjvD0aZASgPX+NuP8+rbOA91Qox1orV3WGL8TAk0SrkB0TMJnw2AU?=
 =?us-ascii?Q?Clq9xpYZvjG0/+p82YGPrsU6E1VCEgklqKGNjfpG3pexmf7RqSrLHgUbFwzV?=
 =?us-ascii?Q?KFAAwYcHy8ACziMoNuNwmoFumTZR56PzBhD9u8F0Xu1XYGZH2A3MOa+5xmps?=
 =?us-ascii?Q?22XoqYir3dRG+W9WKoy8yN9KjO0xKeOMHcrF7x3GSuVDqvyoAZ9D4rBKWydX?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X/+n2YaI4OlequU7ZfAiRlDpXp1X9c1SkjDtYiuKiPFDspnQZj8Fk2PZe+Wg5fExmx3/q4c/0tBgYCL3IEGhKrJbKVDCjxofiZEpM1/95CfSHkagAwQ87kxuzgQJ1i57ycZw1o7F0uze/JFR9SUYs/Hj0yLn0WCaljnRGpbA3m6fC7Q8TMpha5Ww9C2mWk5Y32JT+A9oCFXMvJU1DvdjnVS5kfoy1iaeIoi4UiRNxscNp1ZlLLPTqgIGjiR/As9dviB//9vQy3MGZ+XScDUde54KgdtNmCfoQoy92NUG2PmYhrkpRRqwT8SEWlQfxz4BZ9HoZZ/FbGAxUTpgNRqKP6nde3NpoLkF+kPB+Oe2iwfwkyR/dn+o3YJFEcnSJQQQ5GbEnXPYwR7XrSqj1hElpw8K39uCsWpFHEmoIfIRdli9GLvDf2Dawwy8zOL/gsn6CzxN6BJCjICrKas0bd8WIx6Dx4f9l6t7lL/wL5Dw8EPJPxRmvnQFbqxra/vd5Gs/CL8iuO9AuY+LOdXpWMVv+nWlEcZ/nQK0DYtZ4+NrvBby57xXvVry5urfKgX669rH0wBOrzIpUZ4EK/JgQXTzxnIdN3LeCkzZlb7H9SCFtE4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef9a559-b0d4-45d0-618b-08dd8a8748ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:13:00.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PftBIk/BiTHbzgljQROBV2gv1XSq7Y9noipzLJRcpc5pY4CSKlAuACzzjzSsbQvWBn+7uUUpWUIkNsHTl4R8naiRrPk1UIG4KsyBdTR1/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=972 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505030196
X-Authority-Analysis: v=2.4 cv=OYaYDgTY c=1 sm=1 tr=0 ts=681686df b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=m_9kmdVzOEAqCdwpqnIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NiBTYWx0ZWRfX0e0g9j+Gy9Vj spY1VcnLhVglVD0OaI1W4nWtmSZ/WOxyQwU4YrZa6HZozWrq83mtKNoQQxGYn5K5vL0AwDfi0Sf FDZD87OpEqTWlaO+T5St+W+J8MJoL7AdaCnoYTptVQTXrzKysEGZr/eWvJLPKYAyCMFTThjPV/n
 mgHphWIUHTHH8hawlw8faXux1kl3I5MqappnW6jljGI9Jw/wfTiaa+ffGwlMifqhaq0qxMuw+vl ZT30E7N9WBMlI39rXvtvKDoRwkIngAhCRvN/EAF7gpWxMd24F2aH5Rme50jUM4ct6HlAOxnuA/u nfkJs54InfVw/rMWBhNDo/XQY5AEnDJPymoyxXcSUchLZJuudrc6uUehlRU5K6NUoUSpOChod6q
 zmegj9G3ktD7rs1DxX0E4lgngtAVSoBdKkZrDI9C6CC3hw8Hj9CY7ZPKFiTVfO6ZyNR8+N9B
X-Proofpoint-ORIG-GUID: uquhjQjOznprLcGzgm1NzfVDJXZJjSEE
X-Proofpoint-GUID: uquhjQjOznprLcGzgm1NzfVDJXZJjSEE

Use a direct system call version of mremap() as, when we move to using
MREMAP_[MUST_]RELOCATE_ANON, the glibc wrapper will disallow this.

Also import linux/mman.h (which will amount to the local tools cache of
mman.h) to enusre these header values are available when later added.

Then, add tests asserting all the mremap() merge cases that function
correctly without MREMAP_[MUST_]RELOCATE_ANON.

This constitutes moving around unfaulted VMAs and moving around faulted
VMAs back into position immediately adjacent to VMAs also faulted in with
that moved VMA.

By doing so we provide a baseline set of expectations on mremap()
operations and VMA merge which we can expand upon for
MREMAP_[MUST_]RELOCATE_ANON cases in a subsequent commit.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/merge.c | 599 ++++++++++++++++++++++++++++-
 1 file changed, 597 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index c76646cdf6e6..746eacd0fe70 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -8,6 +8,7 @@
 #include <sys/mman.h>
 #include <sys/wait.h>
 #include "vm_util.h"
+#include <linux/mman.h>
 
 FIXTURE(merge)
 {
@@ -20,7 +21,7 @@ FIXTURE_SETUP(merge)
 {
 	self->page_size = psize();
 	/* Carve out PROT_NONE region to map over. */
-	self->carveout = mmap(NULL, 12 * self->page_size, PROT_NONE,
+	self->carveout = mmap(NULL, 30 * self->page_size, PROT_NONE,
 			      MAP_ANON | MAP_PRIVATE, -1, 0);
 	ASSERT_NE(self->carveout, MAP_FAILED);
 	/* Setup PROCMAP_QUERY interface. */
@@ -29,7 +30,7 @@ FIXTURE_SETUP(merge)
 
 FIXTURE_TEARDOWN(merge)
 {
-	ASSERT_EQ(munmap(self->carveout, 12 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
 	ASSERT_EQ(close_procmap(&self->procmap), 0);
 }
 
@@ -452,4 +453,598 @@ TEST_F(merge, forked_source_vma)
 	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 5 * page_size);
 }
 
+TEST_F(merge, mremap_unfaulted_to_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Now move ptr2 adjacent to ptr:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |----------------------|
+	 * |       faulted        |
+	 * |----------------------|
+	 *            ptr
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_behind_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Now move ptr2 adjacent, but behind, ptr:
+	 *
+	 * |-----------|-----------|
+	 * | unfaulted |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr2        ptr
+	 *
+	 * It should merge:
+	 *
+	 * |----------------------|
+	 * |       faulted        |
+	 * |----------------------|
+	 *            ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &carveout[page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_between_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/* Offset ptr3 further away. */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr3:
+	 *                \                 \
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |  \  |  faulted  |
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 *      ptr       \       ptr2      \       ptr3
+	 */
+	ptr[0] = 'x';
+	ptr3[0] = 'x';
+
+	/*
+	 * Move ptr3 back into place, leaving a place for ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                     ptr3      \       ptr2
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Finally, move ptr2 into place:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  | unfaulted |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge, but only ptr, ptr2:
+	 *
+	 * |-----------------------|-----------|
+	 * |        faulted        | unfaulted |
+	 * |-----------------------|-----------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr3));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr3);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr3 + 5 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_between_faulted_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/* Offset ptr3 further away. */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *                \                 \
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |  \  | unfaulted |
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 *      ptr       \       ptr2      \       ptr3
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Move ptr3 back into place, leaving a place for ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                     ptr3      \       ptr2
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Finally, move ptr2 into place:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  | unfaulted | unfaulted |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_between_correctly_placed_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map one larger area:
+	 *
+	 * |-----------------------------------|
+	 * |            unfaulted              |
+	 * |-----------------------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 15 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Unmap middle:
+	 *
+	 * |-----------|           |-----------|
+	 * |  faulted  |           |  faulted  |
+	 * |-----------|           |-----------|
+	 *
+	 * Now the faulted areas are compatible with each other (anon_vma the
+	 * same, vma->vm_pgoff equal to virtual page offset).
+	 */
+	ASSERT_EQ(munmap(&ptr[5 * page_size], 5 * page_size), 0);
+
+	/*
+	 * Map a new area, ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                               \       ptr2
+	 */
+	ptr2 = mmap(&carveout[20 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Finally, move ptr2 into place:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  | unfaulted |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_correct_placed_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map one larger area:
+	 *
+	 * |-----------------------------------|
+	 * |            unfaulted              |
+	 * |-----------------------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 15 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Offset the final and middle 5 pages further away:
+	 *                \                 \
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 * |  faulted  |  \  |  faulted  |  \  |  faulted  |
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 *      ptr       \       ptr2      \       ptr3
+	 */
+	ptr3 = &ptr[10 * page_size];
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr2 = &ptr[5 * page_size];
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Move ptr2 into its correct place:
+	 *                            \
+	 * |-----------|-----------|  /  |-----------|
+	 * |  faulted  |  faulted  |  \  |  faulted  |
+	 * |-----------|-----------|  /  |-----------|
+	 *      ptr         ptr2      \       ptr3
+	 *
+	 * It should merge:
+	 *                            \
+	 * |-----------------------|  /  |-----------|
+	 * |        faulted        |  \  |  faulted  |
+	 * |-----------------------|  /  |-----------|
+	 *            ptr             \       ptr3
+	 */
+
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+
+	/*
+	 * Now move ptr out of place:
+	 *                            \                 \
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *             |  faulted  |  \  |  faulted  |  \  |  faulted  |
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *                  ptr2      \       ptr       \       ptr3
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Now move ptr back into place:
+	 *                            \
+	 * |-----------|-----------|  /  |-----------|
+	 * |  faulted  |  faulted  |  \  |  faulted  |
+	 * |-----------|-----------|  /  |-----------|
+	 *      ptr         ptr2      \       ptr3
+	 *
+	 * It should merge:
+	 *                            \
+	 * |-----------------------|  /  |-----------|
+	 * |        faulted        |  \  |  faulted  |
+	 * |-----------------------|  /  |-----------|
+	 *            ptr             \       ptr3
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, &carveout[page_size]);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+
+	/*
+	 * Now move ptr out of place again:
+	 *                            \                 \
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *             |  faulted  |  \  |  faulted  |  \  |  faulted  |
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *                  ptr2      \       ptr       \       ptr3
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Now move ptr3 back into place:
+	 *                                        \
+	 *             |-----------|-----------|  /  |-----------|
+	 *             |  faulted  |  faulted  |  \  |  faulted  |
+	 *             |-----------|-----------|  /  |-----------|
+	 *                  ptr2        ptr3      \       ptr
+	 *
+	 * It should merge:
+	 *                                        \
+	 *             |-----------------------|  /  |-----------|
+	 *             |        faulted        |  \  |  faulted  |
+	 *             |-----------------------|  /  |-----------|
+	 *                        ptr2            \       ptr
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr2[5 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+
+	/*
+	 * Now move ptr back into place:
+	 *
+	 * |-----------|-----------------------|
+	 * |  faulted  |        faulted        |
+	 * |-----------|-----------------------|
+	 *      ptr               ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 *                  ptr
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, &carveout[page_size]);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+
+	/*
+	 * Now move ptr2 out of the way:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                     ptr3      \       ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Now move it back:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr         ptr2        ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 *                  ptr
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+
+	/*
+	 * Move ptr3 out of place:
+	 *                                        \
+	 * |-----------------------|              /  |-----------|
+	 * |        faulted        |              \  |  faulted  |
+	 * |-----------------------|              /  |-----------|
+	 *            ptr                         \       ptr3
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 1000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Now move it back:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr         ptr2        ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 *                  ptr
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
 TEST_HARNESS_MAIN
-- 
2.49.0

