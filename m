Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB662EA495
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258728; cv=fail; b=GJJQwRsPSZPGExhc8LX1x966DxXhGQbflS0FTMfw6GKwIw/dlkR2EnqWOvcL0MZBAUwTArzSiV0miPSZR+S0PD/rM7NCNHeswa68gBWQ/RhpgBLGe/lN1uiRluE4kWJFcyA7wglkt4DeDQ9pDXfEcSXcGchHoCn4zEel8DXdjHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258728; c=relaxed/simple;
	bh=5REcj3kPCQhyB6umkclzHmqJ4RqcCHhVC+wV64e75co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HzUU+2vkcWMuQqiew9UHb1FeFogb9rVyCK5ZjKJmaV62Rp64KMyylJN9k9P3hTHTJR/UxqXcKzn4PvOpZGkh4QNpLX7yqXdByz0XOEFTmy/1NW74qpYV38iVq+l0CtNcD3bDf1ox/J4ImkRDU4ml4FKPDyKVY00TMwCg0fhS5bU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k00so3SQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kf6818RW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k00so3SQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kf6818RW"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ICPxxw031136;
	Wed, 18 Jun 2025 14:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=A1xSrzbr2WXCUxdZfm
	OV1L4Eoo5vYy2cYJ5Rcq8CwuM=; b=k00so3SQAB0r/QClRCVxlgojgSlyic9ZX6
	u8B3FS/3dMdJ1JLSP1YD5VOMV2+q5J4EYhxksFLNFLRK4f/v5Fb+iqopoBdUioSM
	UZCeSETsNo9pUdoInbDPm5SdOrcuGU2rPl0uqnj8fPQ30feR62SAJOqv+4Koj8K3
	begq4ZnRGCNG6giRXTK9ZaitfShbwItyAfS7wXb/fFqkgV29QImizq77zjSC4Mri
	6cbGpem0KenoyoKr/NtsCQzA2/2/94FWF5Aa7JALKwE09u/l4aNUza1A0y+k3H4p
	52T8FSPs8uGoHqIWj3+mN1BsfbcOfKYEBw4YfOjhe8P6V0eCJjfQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv57wvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 14:54:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IEgEZ6035100;
	Wed, 18 Jun 2025 14:54:34 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhagvyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 14:54:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxDl/0onbkDAWvmi4NInhxSZ3tIYBNfBSf0OZ/7Nzd2DXPMellH8YRREfAcAOB61BC7OwAtfRw+4tXG5nkKkw9xoex9UxJEEVMsDNbJiYnYswTIjOqotfEcs1+AfV/1XXYJWvc19QliELxo7cNt0Xh2MmfoOmjO5c+xP9gjtgLvU+VFFmW1h4p0hACWIUaCzxfcR4IQwgFYyyH2xgRpWvAEeQUVkPWYJL1HW2+MQT4CWF70upK7J8MrUWpwIuvFk055ZZM5uAGe0XdZcsVMuVj4tWV7YL6QDyNiMc5K0ROL+Zch4YWrw0P69GyQxBc4rd4eB5twkPI++CQLoQFvakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1xSrzbr2WXCUxdZfmOV1L4Eoo5vYy2cYJ5Rcq8CwuM=;
 b=KDZG+gt3ICkqCARyZvgSF9gWahJZMioHoMffzPL/jvmzvyCV3//VgKS2ZmkWjhDm/wbMMu0zlqyEER8EpbzNz3LG3jWLoalwrUb5c/ZpFsyXEhc03y668M/lkD1x2Rk5dcS6wFfnwulnwABthdzWwZB/hZH3QRMh/4VJhUBLkv/YyEjo/RjiTZt5qEZLC3ATQwpXrk7LeSecXvrSlfaqhOQHTP9aaaztN7q2H6e/MdTxKuk1KbbWAO8Zt7riHXDU5zTUMyhouPOHdvPnb+lOgqVWSIGWtRyc/fPF4OJjiP9VjMV1mYnWG9TkvvnHvFyYavi11EwDS80GYxRnYeWMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1xSrzbr2WXCUxdZfmOV1L4Eoo5vYy2cYJ5Rcq8CwuM=;
 b=kf6818RWmzP6s0cfl/z46IBCal50v0YMIbJSrM8IBoVimIMtQ12XGizjsv1jTCZA104s7AxZYYIC2Bo9VzWU7LKY95FRPtxym4WIeojXo6FquQd9anyvZCgp2uhsnQ/Z4kVtPNmp/t0pJn5il0Mb3VJfClJDU6w36OyMqgQEI5M=
Received: from MW5PR10MB5764.namprd10.prod.outlook.com (2603:10b6:303:190::15)
 by IA4PR10MB8754.namprd10.prod.outlook.com (2603:10b6:208:568::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 14:54:32 +0000
Received: from MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9]) by MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9%7]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 14:54:31 +0000
Date: Wed, 18 Jun 2025 10:54:28 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Yunshui Jiang <jiangyunshui@kylinos.cn>,
        linux-kernel@vger.kernel.org, linux-mm@vack.org,
        akpm@linux-foundation.org, lorenzo.stoakes@oracle.com
Subject: Re: [PATCH] mm: Inline vma_needs_copy
Message-ID: <6otznlgh567keer6aj2jcfbzgvf2hmfxd2nhfp6qnv53yh3upf@iq73dot6ec5o>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Yunshui Jiang <jiangyunshui@kylinos.cn>, linux-kernel@vger.kernel.org, linux-mm@vack.org, 
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com
References: <20250618014209.1195734-1-jiangyunshui@kylinos.cn>
 <f7ea4fc4-999a-490d-b221-b3b935e4b1bb@suse.cz>
 <4469c40b-81fd-46ce-8599-0bc6c2d3160e@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4469c40b-81fd-46ce-8599-0bc6c2d3160e@redhat.com>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::16) To MW5PR10MB5764.namprd10.prod.outlook.com
 (2603:10b6:303:190::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5764:EE_|IA4PR10MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 8429795e-413a-4ebb-5759-08ddae78085e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d4dDOABE+ke4tSLBTm+A6EseXJD3LkFyvjzraqOTGeeONMqDsMAbD6QQ5bC6?=
 =?us-ascii?Q?TRCmb1d6+pQzcxeF8t5KhA140YvUmKrqSKp2zi8xCpZHfz8otHW4uzDSVJAT?=
 =?us-ascii?Q?vqSAblVERpfHxignxq27S3/Xodxxx6O91/597so5J8p82+jmVXhgfReTO0NT?=
 =?us-ascii?Q?6BgxMp/l0yQtwD69SZYHfq3lOPTo65Tu2tN0rvVen4kyP9fL1X9i1cZqkxyX?=
 =?us-ascii?Q?SmoG9oDEMGI0oAc/JB2VhtdMSqNivi4141pChl/pzqKabhuKXqDcQgzfdg+G?=
 =?us-ascii?Q?q8rPyPohBX0G0el15w9x6YuUnmS6HBxQgRmdjfzOHCw4uerkI2iBW1O+MrU5?=
 =?us-ascii?Q?0y2Vu4TcACMuEFwPtcUkXVVBfopiaWxoOAginoYUKWgT3iwNNINOsXLq72Lz?=
 =?us-ascii?Q?ZZ0AFXtTqymaOF+kSXyZp/VtTK/niw8Gh3dgu/fp3pH9XnovYzuMMb8MUtXp?=
 =?us-ascii?Q?cAQbEJH+KEc72Yy3h5H927KfWsGHI4jNZuXCUgsHygVTxMMzDhKozwJOLf9V?=
 =?us-ascii?Q?mQN1V9BMO8cyzEWArEKjAnfKPDpdDbYAA3lcdhc7WDMLyI31oPKypietYBEX?=
 =?us-ascii?Q?x/awhvqEeOcneRIbwQQPb7KGA5r3p81LdBeNmANEDjMpdI5p69M1E1248DXo?=
 =?us-ascii?Q?v3yUZB82gzm4Waa+P2e6hiCEx+FKU+PhcycerA93YfDSRzZfGeplwepFNmu7?=
 =?us-ascii?Q?/sxQn4Yio9T8bCHUjV0SzJ2j3Plq9eRjgCMGJh7IiArzQkOFGbgo3hKvO7Sw?=
 =?us-ascii?Q?iUrZsLwyVopjvcCg25D6ZK1+ZX+8KfJBUNQkkNn9Lc7NoBbiXDXW42aLMnTf?=
 =?us-ascii?Q?gT2/Jr8QUW/p2BjR9TpLIYZrWykAUeXo2qbKG78OPY7QUWSjdzTbb5wcu60Q?=
 =?us-ascii?Q?IdH35wuD1IbMgA3t88KUxCqvx9KG6CKGkWVA8I9Km9GYw1LKuxVVfUUfam+w?=
 =?us-ascii?Q?d+rcvUVYJHZo0m6AliVouC/qfGjXJLirvsDIwY6lKb0iW9g+1YBISNc9ZqJv?=
 =?us-ascii?Q?cbJZBD6Dv1AhbwJSW+U8TCfVAQSD5K+/RD/Snid/mGE9H1riRM3wYnRpNsZR?=
 =?us-ascii?Q?KDayIscsTnqVJwQCK21pEU3S+fTCF2SK1i0oIR8JHoJv/ojnn7nFOJCbOSn1?=
 =?us-ascii?Q?6gTPL9uGfaJdBM9ARoxu3steaHsN2W0Nl7YQwH+Ed/J+XyBFfbDXDIII6JBT?=
 =?us-ascii?Q?o8Bpc0bLlUN1LF/zoCIg7KRjv5LxiJCDKmebWBxEuK0as6n9D//3Chcmsb+z?=
 =?us-ascii?Q?XpWcbOzlPOz14tsE1SqLrWwLpTAkZnVrH1AK1r20JffZmxoExetTa80q3ebp?=
 =?us-ascii?Q?tSYJj8937dsHpmSLh5FRU8JPcAelYznIAxPE858NjsNt0G5Q+I+Nzpx3AKRJ?=
 =?us-ascii?Q?V8TG5I77nh1rZyxM9bDh5smbr/HgiREmY3zFkt00u/30wQvDtJY5dT6IRETD?=
 =?us-ascii?Q?SrKQ11EAh6Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5764.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+VRRtbEfUEKFyMfrsATJ9QiqBp/N6st4mltylEkmDnFRbo/7ndyu62p1vsVG?=
 =?us-ascii?Q?wk+1GxGKEchEHhrN+N05FJjP0+NhAZlXqtNEJi4yZBTjbinD8gBUDSu4k7nq?=
 =?us-ascii?Q?iRgKngStY1iqUEzdKlGEdt5kIhfuMKAelX09yLRyJUdvrEIEr087Ezj/evCt?=
 =?us-ascii?Q?IxoTmGr4B9VHr6oo/Oi9LSMGW51JUeqK9BZAAAFfpkQxxCgSLONj57iQqCd+?=
 =?us-ascii?Q?LRasTzmlRAIyM38oJQN8FDYtu9XongkZxsKAtp+wslGQ68OdR5FKlD12y3Un?=
 =?us-ascii?Q?90cpBuNtwAOhJsj7Gu0LgIpzo2gm287VyDfXPoA1tvexoe3uZLFNwfNvXZyV?=
 =?us-ascii?Q?thGahW2zY9WuSY1wxb4OYagapV86wKnob9fCZY6lYauQg+vKsFjUKIictL88?=
 =?us-ascii?Q?MXeNHEnI3ggvLSYFNNkD7c2gZ920wOe03LIAQ5xv1+X62OtX3B3VK3A35WAF?=
 =?us-ascii?Q?2tKzxGuJ4yoO85vtKRr/2rUSjsZgYhfIWEWgY3A5zC8yuBYitdQtuHf0xhfn?=
 =?us-ascii?Q?ny4QXkvl0krPwy785svObzsA9gqfVvVbzGQK5Zs3orLKNVmDTmhixzy6q1W6?=
 =?us-ascii?Q?UUHXQilPEzL4yYKZ+i6eLzKpt1DkwCo8dHsT6hctZgsOVvrdGjZS5Xhx7wYK?=
 =?us-ascii?Q?RAT3XuGyaHBNAscT0RDVvnV58xwF1N46/3aQs7unYHM0NFHdQAzzEwP3UBy5?=
 =?us-ascii?Q?YNBozVbDBvFcMr+6Lt7LHnaivssAvGKx/tpuTCXjgEAVXyHUzrBAIft/uXPa?=
 =?us-ascii?Q?cySDb41Qzv3Ax/ZCgGB9/4EjWHjG6OzHVowwpSbuhqJHE+HLq/92ppMDytsj?=
 =?us-ascii?Q?fo9adMHkEc9tg3tsxh8h4moX1f1L6hm+mChPGcXuAf3JgtNDXuujgZ2usvck?=
 =?us-ascii?Q?scW5A39l6pjrQ3Pspa0/XRGI8logV+9byU6Ja2seY4Octz+snzJRdbOJawve?=
 =?us-ascii?Q?yo0+Mfk/mhHfkVhcKW8tqIsarbTOXFSXv3qgIKyrqKqHuv+Q/aY597Ut79xS?=
 =?us-ascii?Q?8f3A96eeSrek4kV58fzJ/lXhg7HcOFg1QkzP0re0D+/2782HDIl+fi+qp4Ih?=
 =?us-ascii?Q?8Mhb1Bv+6+4+LUyryd3OeHPwkgZ5wZUXw5D0qiPnGm22arEbQkEDI+dUdELm?=
 =?us-ascii?Q?xubc7kAfrej8POV90xvjieqOPpxcKDlW9BunzRU5fkkmfMBD1iM6ZUKfNzTY?=
 =?us-ascii?Q?T14jQQHPTL/KS/qXOD0ehwc4XRYw3pb0ztCdUjcBE9oBvpdg/VIza0GdPHFE?=
 =?us-ascii?Q?lu/zYmPs7MR6IpPVjRyRvGuOa/g9w7d4C4YtDKXDEI3GyOlqhE9VdmFLDK0S?=
 =?us-ascii?Q?Dph/Cn+TSSHQu7fgm/FXsu4lV1qUx6gvywYUtNVoBRBBAeLraiMYHPesKYKr?=
 =?us-ascii?Q?pO1ORXzRafRVD43yDLg6pTvPE8ZkIkAnFf1etMzwYPx4+53TrCBVkg9ti8XS?=
 =?us-ascii?Q?O9HQYffxX0N2VWLXbeP4PQ6GQB+N0GVQ3j3AIHGnHaw/Zlku7tcRM9t9pyCJ?=
 =?us-ascii?Q?TR2/+Gh95ACsEan30TP+D1KzpgBjVB1qiDyHfAC7r5Gjjq0trXV/44TBOaYk?=
 =?us-ascii?Q?4XTVsAZDWKQAU07e/9F66bF9FAcxElZsDXa+OREF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	92mraF86xU0J6Le9FwT0kER/3ZC41Li/92ubS4l1xRNz/HVztZkeIaPr/Hz2EoVvwnPvC9dRDhd1bJ/rW1DB5SsE9d72KXKWwxryvwMEIa4CZNpOZSEueIdddmsRVRuaPBEDsgGdXB0RQGpSWE3jGq7E6LaIgCcWNBDlw16AFTQ3xYUpmhJtNFrjVrtVeF6bS5qDo5XRDbexvkqjUwDhIXJLaxu8jk9t6V0aDc9fdcOVUxzyx+26Lo6BepJD5742UFrNhs2XKw/DmaKyfC5NW2GQTuwoMNy8j615M522fKtd33ihGdzK5o4mcs/yCbZ0uPqHMjIX9zisqOTNuFdhMsTa5G60TrKRD5CU5jnPVfdKTsUFm++YEmx7jmwlbZkWTkVWq3CnPnjl13aL8yyM/RX37ke3w54N2TwnmPVoxcQM4ed1jbkPuL/1SY8VKTn+U4lB8Kmi3uqVAIL5d3OWOU7C6GMIRYkMERFi4T0HUueB+pLI9chhK/nAx7cdhpvg+f2h9g/IeGVASFzWMTB4FHp/Lx78F6TCRmjWgknNP09TwRQkFTl+JZuzRSzUaHwsCKbwfW1dIx5FAA+nZmvN9+oF6Js1zReHBcR8ZzmQwA4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8429795e-413a-4ebb-5759-08ddae78085e
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5764.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:54:31.8082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40bdIjw+ZL6fNOHv0e4/ghP8maapWpILWyFQXRGRvztYsliZFnGbXkULteXY20y5NrYihwIPBAsnjO1kzRsxSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8754
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506180125
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEyNSBTYWx0ZWRfXwT9icT1FXu9L Spznze8fvFfqH71fyP8j+Ex0kidNWxJUb/gUIH/L6VmobHkzPEEp40xhiOUwQ9pn63V8wf5WUbS szZTq7jyY4+eS+7o5rNgHStN3Ih4Tv1jwyy9ettY6el3YOXnZ6/DtnkUZ6U5KC9buXMTxcxEmQl
 dYcGTdQynqUxx688qWynh7g7FOq9HX/dEy+71Wfiszn0w56lx7DQw1CcuwfqTP6Nd/Pu/xQ7WxQ hjzLUqN7CYNQzh7f1nkehXEWazma0FBkna5ZDf4XY3TLh/Yo1su+HYMmes/rPN2beTdfOVBg2fd Ra8BI1NvuDWvPVOJgOUtM8TG1XJ9tjo/VirHHGJgPP7vTeKAG+SOEEleLwjdRTxgavO+a86bfmb
 fu2eMSE4DBO4UyaK2dNNUEDnHfNUXBvIIuYS1O8S+/KdEZQW2o0uTD0uld2nSm7vNBueKg1W
X-Proofpoint-GUID: 7Ke4HcLP1L8uZ59xsjgPDf931rOxkiTl
X-Proofpoint-ORIG-GUID: 7Ke4HcLP1L8uZ59xsjgPDf931rOxkiTl
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=6852d32b cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=KQtHnyQETWDkYb_jhh4A:9 a=CjuIK1q_8ugA:10

* David Hildenbrand <david@redhat.com> [250618 06:03]:
> On 18.06.25 11:39, Vlastimil Babka wrote:
> > On 6/18/25 3:42 AM, Yunshui Jiang wrote:
> > > From: jiangyunshui <jiangyunshui@kylinos.cn>
> > > 
> > > Since commit bcd51a3c679d ("hugetlb: lazy page table copies
> > > in fork()"), the logic about judging whether to copy
> > > page table inside func copy_page_range has been extracted
> > > into a separate func vma_needs_copy. While this change
> > > improves code readability, it also incurs more function call
> > > overhead, especially where fork() were frequently called.
> > > 
> > > Inline func vma_needs_copy to optimize the copy_page_range
> > > performance. Given that func vma_needs_copy is only called
> > > by copy_page_range, inlining it would not cause unacceptable
> > > code bloat.
> > 
> > I'm surprised the compiler doesn't inline it already, if there's a
> > single caller. In fact, mine (gcc-14.3 on x86) already does.
> 
> Same here
> 
> 	gcc (GCC) 15.1.1 20250521 (Red Hat 15.1.1-2)
> > 
> > So I wonder to which extent should we force override wrong compiler
> > heuristics?
> 
> I think only where we (a) really know better (b) it's crucial for
> performance and (c) modern compilers don't do the right thing.
> 
> > Maybe just inline instead of __always_inline would be OK? Is
> > that enough of a hint for your compiler?
> 
> I would do the same thing (inline as a hint), but some people apparently
> recently argued that newer compiler mostly ignore it either way. At least
> that's what I recall.

I have seen inline ignored, but not with a single caller.  Perhaps
godbolt could find a reason this is necessary, otherwise we should just
leave it, IMO.

Cheers,
Liam

