Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58FF9D6
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280176; cv=fail; b=pFt6zx2SKSJant9X9RblNpScQo9AMNtJw0GUlw/rWtFuOau3+qyCR7Z5cu8zROtQwe1syObaPKqQ0QN/31IZHokmcE0OX7wB9uZh4gqZT9kwYPfCEs1QjizLUzNiRi4kcOIf1HYZkIhR0JFQSUi41KlNg2hw/iFob2mxQnQUo4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280176; c=relaxed/simple;
	bh=Olo2GMHuJNH6WCvbdBxop+LwJhGqO3Ut7dGAwJ3Azqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nZErXJ8E7Mhpmwtl6ovDFOi/lLwDxid/nlg/OoUKvnY5B9MgojdgBi84UJbYnhRg+k9OP4dK1HuEwGNwXQeeZZ4ncVWnCur3RNFjVYBxH+W3C+YfIlhF+uPUFJ5maBQMea8bXwJGNdwUFDTlN9yDzcztr1pUMOyPhXw665bPX+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E+rlaceh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ojllol0s; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E+rlaceh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ojllol0s"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84bJR004395;
	Mon, 30 Jun 2025 10:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=dXOettf8xYoKckduUv
	XcIedwhqahzLwHLNAvHPBpPj4=; b=E+rlacehUQuFcYC5pLb13/HEHjKNxNqxMP
	rXo+p7S8h6Vf6gFV97qziV+YVrSZaZ754skJy2N9x1V72CYQkx4gyXSkDFwru061
	hD6GhdtO4kK/+IDK/0wixu67fIZZG0VHimT/Xx902HYPa+BPggowN96g4c56j+Zr
	dYSOdbYHeVRhjRy37aoOfO9cR+3uMylbPW7y23ozeZQUvjHt/1Hf5b4AIgFitWbP
	yOXKoLtGAf2I9v1Dby6yXyzMIdChefkC2SECRMqwo1SQTyPkVvWqDlOtPqp/F90X
	S24JnqHvkkwL7y297yBq7oxAb2mkkrBiupVG4/pXHPeEhMnxCm5A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766a8f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:42:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UA50lm014696;
	Mon, 30 Jun 2025 10:42:07 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012059.outbound.protection.outlook.com [40.93.195.59])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u865c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:42:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOwYknH9Qtbi7e17KzUsOexrgy12nNRdnkh47xMPWxSZokCMqG0mL2VTI1Lr6FyBwj6oFZv5Np1l2y5Cm/EW18JRxZCEFYPRzrAKABa/OvmKqcbLRcBOiFNbob2UMixCDGO0MZqkdBkUjStrAuTQrYICWJ0yD5+3Ev3XItsQxIUV4orCbQSQAyqJMtc6XbvLfIKKKT06aggaIvIIEM5UuME1VkYFJ7U6ekOSkKDIHYE4e2+S5zIky0LxklhzxScChq7qCtUTspLFf+31ov0dw5SwTYFWeoHhB5c1fBtnbx+hrIONajfVM1IfRLeksqkKdrHtQh1KWkcpp5WXEmp4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXOettf8xYoKckduUvXcIedwhqahzLwHLNAvHPBpPj4=;
 b=q6yjqlz5mIr188Rzh1YKCT2ctLHqadTyEGdPVP2IjFVQyGYrRUWie0YLarKxVSPTz/KvLrp0ILymSvGM61DFljqCw7nP6wQC0eGJoS/ejxQVt1AfoPD+ADojk4dxoVq+YJTpfX2QYIDZgQQGRO/xQwl7kn1/phgsZ2W1nt8XfNgliUVhdwnnpmgGXGRDdrHOeLNCGYD6TrHCbQQihByizTCsd7Cue6I0kZjbCChyAQfBIhCaLUmRWYPFrKmjCo3IJRQ1fhrKY2DXkRhnLPr++nwFdRzGEg/E5Sm1nvO+Z21pya6fwK5QdEEA0/ASCHq6yLof0BHQoKCypBmFy7S7Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXOettf8xYoKckduUvXcIedwhqahzLwHLNAvHPBpPj4=;
 b=ojllol0sXQp2hUdWBEfToUuJcrNxhO8lgYvlNPMbEE4Uyq/quZodm59QNXMI23FhyMPCHlixjxY+U63wpyTLwOGQvtAP3HORqh5zULayXZLMkNtiIOWPRF/Fbbsh7xGZSsUYFg8f/MI55i9Aw5tqGxvfx9yCpENpdaY0ogjFz2M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8298.namprd10.prod.outlook.com (2603:10b6:208:570::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 10:42:04 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:42:04 +0000
Date: Mon, 30 Jun 2025 11:41:56 +0100
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
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into
 folio_pte_batch() and folio_pte_batch_ext()
Message-ID: <d9f8b010-3c80-4d02-99df-30171878c799@lucifer.local>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-4-david@redhat.com>
 <ec53b2ad-9c1b-4039-b59e-905e1853c1a0@lucifer.local>
 <9185c50a-1427-45fc-941d-e9796cea4831@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9185c50a-1427-45fc-941d-e9796cea4831@redhat.com>
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f39a6ed-98f1-46b9-de22-08ddb7c2c0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vekZCRkSJ8/3IgvjBhnI/et8QlCP3KvjDFboBzLBt1TGCTeVeIsqJ9Q/dkag?=
 =?us-ascii?Q?D9us0cZlhpke8yDSDGEswgL5cVKmdnQYcfn4tgnd2xJs0OmHbLfJsOaNqY6D?=
 =?us-ascii?Q?mrYgqMO1E7qfFY9TpW2KVasuAWl/M7DJMwO+8plBra4C30guVg7RYb9EydzZ?=
 =?us-ascii?Q?rwFVxdH+9h2/l/kgQ8DyFrhwkpOdL+syUa6xHSqB2xKFgfvaGf7fdofBc4c5?=
 =?us-ascii?Q?9waCcGSy+/N4jRiKrqWk1bwypqGjH1LEMShy88DO/jjVJLTxzh3+FLznF8Er?=
 =?us-ascii?Q?dnt7LyxUjpPpJ7Npu5eC0vCgUgv2Jqvm+AF5xAbaI17wpFdlbDksfud9rBm4?=
 =?us-ascii?Q?5UScKLCxdBtapmeQrfRsEEp+NJKcO1Euby1X+3QFm6NEdvya0ALBW7uHeNbE?=
 =?us-ascii?Q?SVEfQjpdWavuvfrRN98wUAq69iqdazP0wjmlB2/JeTRlywUN0LXB249/zUpc?=
 =?us-ascii?Q?xZdJ/ZR+973Md9yjsrp/iVv8waNwp0/R7c2SHC9nY+Hcd/vOHjT+ebdvRzPn?=
 =?us-ascii?Q?uHvQxdXT0GuelwlgrUR+A2iS2T1ug90vvplesfnVWG2/KyP/Fv4HSaVohlwY?=
 =?us-ascii?Q?YNey+xWUTJEFqNhQac2uJZgTaCkzDiVOVec91b+7ixlx/j63l9aEHTPk97Hx?=
 =?us-ascii?Q?/27dNevOG14kBikrQKK8TnqbQIUWsj7LuZg87ZP4u1pEPyKpZ2PtGoU03JV4?=
 =?us-ascii?Q?VXbcNuI8gc1ao7+EyRQLQfHYH+IRc53RDW6rtNaOhHTsxOg6+EPpIW8hTdbv?=
 =?us-ascii?Q?hvmcy4lZNPsS2eaD+1IfZdNlF+MmEdV50UpIYh9P5zXjeBtbgzjONSAAIZHg?=
 =?us-ascii?Q?2OZPwF0/6GaS3Vq2CyAfayubOIrv+0L968vx07KmfkZ/yQb/ilhIlyQAVzgo?=
 =?us-ascii?Q?cqN/Y0FjMl83SW9kHtgARcvTSSUOs+aZVt20gwe+DyEoQp3ZLFsmLI9qDx0j?=
 =?us-ascii?Q?8z3RRUUmXz8TFiES2FYAZYKfl+Ih/azHbTpmDVHAOXXF50SUr7ezM5Vhh87z?=
 =?us-ascii?Q?+7wr+9AUe0rpWPTOaNtLkYEnVpVunEUCbdGsHz19WQGbuREnCMOGAeETtU5Z?=
 =?us-ascii?Q?GMCAbyVZNeZdUnzskCkrffESX35DdEYdBQxspDxWFFxtuNzgdHTCCVlGGix2?=
 =?us-ascii?Q?NpLIvkzSJDMUB5BrAqyej6NB7dg/9qAyy32AbgenBm2oOFgZR4ECgsCsBW/O?=
 =?us-ascii?Q?lUeQqmUN4dSLKYauwsBW46tLePLeBeuk6BYvGH5QJLBbhPQtXN4RELT29lva?=
 =?us-ascii?Q?4WQQekQ5mq7D1FroxsAbrdiXE++TpgAFDRWlEqa4rY8z97SDJ4RowJYFATWR?=
 =?us-ascii?Q?VfwhY8Lbp2kw+Yzo36CHExGrEFXmMWPEYLj4wihpzbXpsa4ls4enAnkCaONn?=
 =?us-ascii?Q?GEYorRl12X0iCmd03yt7pHdM3U3f39gXdGF7S5VX+hcylwF4bw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QYinMoomdMJGyS4UdUVOr4pl5RRiF2A9ttH0PL7T3H0YqL6VtQr1vgYeSW1R?=
 =?us-ascii?Q?5TC3eY4Xhd69oQtQyBpSSJOdbnZGHKNkE+PBuV8o2S77QjXAWhai44NAkqTY?=
 =?us-ascii?Q?gJjS9FosisuKMo9EJQUfNA4nSHBGABet/s8Ti8Yx2cVpovxLUCQ31pVmZekC?=
 =?us-ascii?Q?T/VMdoou9WpxCecVvEUD+bcVhrcMwBYyZ/p8Ta7PgG0+6uN+phlPSz1+VO3l?=
 =?us-ascii?Q?scR4wYdeMOy0C5ecikry1a02NyMqS/9ps5n1L3OY3xN8UCmeoQKsulpbaO1g?=
 =?us-ascii?Q?x/eq2Nf2KGnRCNGd5y7KK0prNp7Jou3sa8YGQxjSPUI0wm3dNc1t8BSewiOh?=
 =?us-ascii?Q?v0+J8Nvd3puymNv3J2E+kUjH30PXa2tol+GTEjybbYVc5Ap9hXwkyof/NZCF?=
 =?us-ascii?Q?1HnJ6TJ/m/1mMvEASR3+/UA3qPZd+D875RC/CcQIXmZDfBEo/CfMqRFTSzNd?=
 =?us-ascii?Q?8+RB9aHxTdWUDrd7vyQHD5PnuUUoLOaq9DlPeQv0sDitvNYPN5fQqNVHWZlS?=
 =?us-ascii?Q?FI2J9oRUiMNf2QBhbcZ6ccF2Ey3dFa8ja8b8F11le4fQNg8cUDGpSKeJpw5N?=
 =?us-ascii?Q?nQIXLF3Z82NDcf/ut5y6b2Y5llvBnviBjvZxmPbmaGyJ4LzWubbjZHX1vz3l?=
 =?us-ascii?Q?Cc+ASEma7mY4RyEZF0h/mARBXUJ2cfJjFqyPEV+u3zjtsm6CiDSD31EmXoow?=
 =?us-ascii?Q?atA2OLnBH/oFiQJ9O9fXsV9BwC67Q3kqkdtp2ahMmLxtA9welnoq+i9AEw4l?=
 =?us-ascii?Q?Bf6RurMBbZxxrRCHrXlCrHrWSfh9oZ8tlSVVZJDBvpjTNxDXTERdkPvEkL3p?=
 =?us-ascii?Q?eAJshdtdhr/9gENBeOAzZeJ0ZD4Itj2I5xK4zL/tYk+rPXy3Vkxn0ROljzbt?=
 =?us-ascii?Q?1sYA+bfx0TbRT9NLUV7Pfb+KvmCb1hqQlSnsgD2IXp5cEnFV25gpDyJVgkaf?=
 =?us-ascii?Q?FeRWfQwswynzyqjLUXYujx/wqXH87iXBKzv1hyj8idgpjJa9e30VDhk24ynQ?=
 =?us-ascii?Q?Qo4TrjAuPZmra4eNSE8DRqlF4bsbTLbAf9L8a0dTOe1A7vmvPX339V4ypGlf?=
 =?us-ascii?Q?/Scqtm+0tnz5qX9rX4l3PeY2aM9K9gBpfy6AjeNMRHu9Hq4a0rcvBnRdBg1O?=
 =?us-ascii?Q?90yXVxCa2ST1AcjF1UxPNO8saQiNtDxD6W2yEy4FWjc5syBmKMWEso4dSCmO?=
 =?us-ascii?Q?deG6OfvzR0XjkIMleK19VC5X3KXespdVu2L7cujX9CmxaWkllcWCnv7s4ltE?=
 =?us-ascii?Q?Jj6N11Iimeuze6TGJV4DQoOg0uBEpDiFaI7zjvT1/mVMzDZd6YxlB+Mr+gte?=
 =?us-ascii?Q?mknlHwTDw2R12cJ8Gezht8SKmtFHaucX7cwiWTnO8T8MAdDVExD+6NCZbLA/?=
 =?us-ascii?Q?tBQzPEycT5aFOxrYOeCDoaE5h/GRPnMZAWTQY7FZdHvs7cC8i9VT7aBbmpNM?=
 =?us-ascii?Q?OdixUXB9pIu/naNIKm57i4zmSr6eYQ7muVitq2OyeHva0lMNgrPfloRbP+U7?=
 =?us-ascii?Q?+OpSa7qZylU5bnpYeJedIg6RuctybybxlIRxdyoIeKEXNac+eaFptmHxr/ha?=
 =?us-ascii?Q?ur+R+n7BQyMTl9c/zfIhN/dJmrj8wSR581sj6wIwf04terqyyL0ahAyHWRkw?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FRuebETLxSh5pnsZo1QTupD+JUBjx5xjRH1MkrwbjGPOny7wM565WlVCmybHEwdYjHXvUhNa0Q8BBdxoRCyMQ49MdcvGuPaMernQ/Ob7+tPQdCNDb9W65IgCbM2D0kYuzA7R4PepwaLSEuS+4iHXz38kuSKYJOCp053IrdkKSKRZbqE0Cjwa3pobc5ML27KlKjCju0s07vK3DKN83vob0yjj5iTutwFmqTKMAIK0g4pBFwrvkRQyUP+HQ1MwsMHukexoRmrWvYzpTCF9sgPoULbQdzaPDZSdyudTO1ykdEmcseX1Evjso5nbIA7IURxvpea4AaGg2vWjCosV8OJdrnIk/VcSbR8Xm2nRFGcRGYo9HJRDgjPCZG15tPmDubjvHKn5BMv3bW53I1G2/mE5vMAQQSdsDEpKjdOhlTVVR9dHZHtgKowRS3Kaftcla+4GY8N61AKUdoy8oPyeO7i/Wh0dL+FYBKisleUkxUp5wuawNr2oGWpkWromDM2mtRazBA5oPndvktpH8T7piRrmOehueiuL6F9yBsu6ZjwLm8KzOP6XsKaGlm6nAvUNmY50YqKberEQv1FtD8fVmhpjzk964eSU4rUcBdQMwPmpt0U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f39a6ed-98f1-46b9-de22-08ddb7c2c0c9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:42:04.3398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xmr+HOX2OiR37kwaHQHqXG7Sq31UQAnY5cktYJVT29+gGaM2CjiZ+YeEX7GP/u4CMOAO5OCqM2TE1UVbMX2Y/crvK3cVBz3icVDIZ461QdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8298
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300088
X-Proofpoint-GUID: JcL7KDnf4lqRjmTShXnR84piIMHSEkKn
X-Proofpoint-ORIG-GUID: JcL7KDnf4lqRjmTShXnR84piIMHSEkKn
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=686269ff b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=hCnG8ow2OE6bP0dw-jkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4OSBTYWx0ZWRfX7prgB/oyR4eR AqeO+Il2cAPryN1zU7XOQA3sSHiQNu/0kxio99tb9hmk7QnoRuMXHLlEqzU2MhAx4tPs5q7DPQW xXyE1TtLEqovQ8o8RMYdF+Dy/S2MfTsxrJBJVQSXQtsflOU2qPJI3MCA5eH5+tphsgesPeHlvnm
 GaoQ8FKJhjWRJ2jsPXRcFj24xE9BR1vPRaR31GtTk7m3rqBycRXDFtaJvefgWWefN7mdBkmQ/KE PF9tj0E/dEQmKfKxWNvV4ufhMQFWPNxOwDA9hZm9IgpsoarA3asaRAI1Dm0umscpCgjdU7v5I9N aiOVliTF9Fzz3ivNk4QnLPYTfsMHC0IvU7p96hTIUGqBD/1/fdO79Lnr1gajv0Z6CX6eTqLeV9e
 Mbaw1Prv1gQ9HGhxVbGneiC01tzPLroNR20nD8Nr55qL0JAvboBPmL4V+AP8ipHjqXFgyMGw

On Mon, Jun 30, 2025 at 11:19:13AM +0200, David Hildenbrand wrote:
> On 27.06.25 20:48, Lorenzo Stoakes wrote:
> > On Fri, Jun 27, 2025 at 01:55:09PM +0200, David Hildenbrand wrote:
> > > Many users (including upcoming ones) don't really need the flags etc,
> > > and can live with a function call.
> > >
> > > So let's provide a basic, non-inlined folio_pte_batch().
> >
> > Hm, but why non-inlined, when it invokes an inlined function? Seems odd no?
>
> We want to always generate a function that uses as little runtime checks as
> possible. Essentially, optimize out the "flags" as much as possible.
>
> In case of folio_pte_batch(), where we won't use any flags, any checks will
> be optimized out by the compiler.
>
> So we get a single, specialized, non-inlined function.

I mean I suppose code bloat is a thing too. Would the compiler not also optimise
out checks if it were inlined though?

>
> >
> > >
> > > In zap_present_ptes(), where we care about performance, the compiler
> > > already seem to generate a call to a common inlined folio_pte_batch()
> > > variant, shared with fork() code. So calling the new non-inlined variant
> > > should not make a difference.
> > >
> > > While at it, drop the "addr" parameter that is unused.
> > >
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> >
> > Other than the query above + nit on name below, this is really nice!
> >
> > > ---
> > >   mm/internal.h  | 11 ++++++++---
> > >   mm/madvise.c   |  4 ++--
> > >   mm/memory.c    |  6 ++----
> > >   mm/mempolicy.c |  3 +--
> > >   mm/mlock.c     |  3 +--
> > >   mm/mremap.c    |  3 +--
> > >   mm/rmap.c      |  3 +--
> > >   mm/util.c      | 29 +++++++++++++++++++++++++++++
> > >   8 files changed, 45 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/mm/internal.h b/mm/internal.h
> > > index ca6590c6d9eab..6000b683f68ee 100644
> > > --- a/mm/internal.h
> > > +++ b/mm/internal.h
> > > @@ -218,9 +218,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
> > >   }
> > >
> > >   /**
> > > - * folio_pte_batch - detect a PTE batch for a large folio
> > > + * folio_pte_batch_ext - detect a PTE batch for a large folio
> > >    * @folio: The large folio to detect a PTE batch for.
> > > - * @addr: The user virtual address the first page is mapped at.
> > >    * @ptep: Page table pointer for the first entry.
> > >    * @pte: Page table entry for the first page.
> > >    * @max_nr: The maximum number of table entries to consider.
> > > @@ -243,9 +242,12 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
> > >    * must be limited by the caller so scanning cannot exceed a single VMA and
> > >    * a single page table.
> > >    *
> > > + * This function will be inlined to optimize based on the input parameters;
> > > + * consider using folio_pte_batch() instead if applicable.
> > > + *
> > >    * Return: the number of table entries in the batch.
> > >    */
> > > -static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long addr,
> > > +static inline unsigned int folio_pte_batch_ext(struct folio *folio,
> > >   		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
> > >   		bool *any_writable, bool *any_young, bool *any_dirty)
> >
> > Sorry this is really really annoying feedback :P but _ext() makes me think of
> > page_ext and ugh :))
> >
> > Wonder if __folio_pte_batch() is better?
> >
> > This is obviously, not a big deal (TM)
>
> Obviously, I had that as part of the development, and decided against it at
> some point. :)
>
> Yeah, _ext() is not common in MM yet, in contrast to other subsystems. The
> only user is indeed page_ext. On arm we seem to have set_pte_ext(). But it's
> really "page_ext", that's the problematic part, not "_ext" :P
>
> No strong opinion, but I tend to dislike here "__", because often it means
> "internal helper you're not supposed to used", which isn't really the case
> here.

Yeah, and of course we break this convention all over the place :)

Maybe folio_pte_batch_flags()?

>
> E.g.,
>
> alloc_frozen_pages() -> alloc_frozen_pages_noprof() ->
> __alloc_frozen_pages_noprof()
>
> --
> Cheers,
>
> David / dhildenb
>
