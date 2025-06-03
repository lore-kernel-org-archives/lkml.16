Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC74132111;
	Tue,  3 Jun 2025 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748959918; cv=fail; b=sniZO0vXJFGExil4C0NrKK9fnf6R7iAeW+MfBJTliqVWjqCUXmOqBgww0sovcZNyoaUFDdjJaiD45wzTD0AQ3XkGhc5GGMDK3Xt6oe+HFM7TOoS+uo2Q1hVGJIUeW1pglZuLsfzajkCIUfSOd+EToiQUOS6He0PoEsO+qFJFxUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748959918; c=relaxed/simple;
	bh=BVmzJuLfNIjDSEcckLL4+7xXoJ0uJ+vHCXw4CDj6jAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h+FQUUQNyTJcA4x9TrsmRI2nS9ltcmUdhIg5pn50rvXfPh5Q2s42mx29WalsObCM/cLTFOiKD0OzQZ3oeQ5SIUHt3XFY4z5kw+anEuvVExJwEsoaUUh/qnMvMiVquV+EXTbIiZBiz7wdQoDOEsZkaOC2ovlTkYY7sZqgef99g6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S1CLMQNY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Tj8cEnbn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S1CLMQNY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Tj8cEnbn"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AEvkl028953;
	Tue, 3 Jun 2025 14:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=8xjjUrLoC8VmxR5JdS
	+T0m6A0QH7XY3lJ0QO8QKmlfg=; b=S1CLMQNYesvnALoO8dwdaH6V/8rH05ZLCu
	M+qjuYTQqlcLNHCdyXRmlHDM+wxcuIi1eHF8WcQLvOfBqx6geVDpB847dp0MqFoA
	+TJVUCQWMKlCMKGYD9TNoNYHdD4vNb48VE17a/rJNSSkgIRFW7ycF2imOcPLTwH4
	4BET6qaNzkShLoYFgxugivMCTu+HckBRdJIh0hwjNP62WnizeAGxYMreJ3I3qGG8
	X0ZA4H6qKQEupA/3MXTuKM+EJIQ4zxY417zQznrP0xPo9iCanXb2LfG3V8Alsk9J
	yQ1jUbYHdSDrn9jTPbn0I4sohsvzmAKQvrJmTFBHIMVXLvhVWPRg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8g9ycu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 14:11:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553DSTfU034915;
	Tue, 3 Jun 2025 14:11:36 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79msdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 14:11:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAj/IgkfcdLtf1qu11c0ys+/Mt91ml2H0tfxgEFTVMxg9AB6eanqx26ZoplDh/y44fQkMU0v9ejoxoyWDWoYHuc1hUjjoMtZYl7OTKf9dJUFPwuVnQ6jcX4E/jc0HWPof0BBpfl237XwfAgNhHWB+NDitfespie5y/o/x/be5S4KI3XC2vAggpfbEivmHxBCfue6YuztsoJb7mBqjorIOFOMjjDr+o2c/IFo3WlvI9o2pE8Zr09x9tif+nICjSHJdX9wkVf2FMlt1j75LleVyWtby852yZriLH9YMjIQrFnDaaXZcTfhXxez82T1guUEXBwSQQrwI7HKFWoKGKJsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xjjUrLoC8VmxR5JdS+T0m6A0QH7XY3lJ0QO8QKmlfg=;
 b=jYF8sGvuoi8azvzMyN2620tbPbyrVFtffs/s2bZU2mTqFKRHro/KES0uB7mr5Qs7f1tkCLNLsEE5qKRhobmAEJMxQGoO+dsuCBmGKS154z0Fu+5kaV+LJKoDjI//Pl/j5zU54T6DKxnLy0d8dHOxqlaIlLPZHx9agkYTIJtnA8r6pXbslrzwNMIOIltFI/9ymjgnycOI2ihNmW1FLQNEElrtz8TWMwlUpqXVNUfc/bCQYMrL2X5dQQHACZcTFxdgRCbd9MhyBg47DAv00ed8zedkngJYJyGEziI+Sxvln/DMd6c7rGDR9EwN/Fa9XTsB6tGSUjnzyYjCkIF2UVz9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xjjUrLoC8VmxR5JdS+T0m6A0QH7XY3lJ0QO8QKmlfg=;
 b=Tj8cEnbnGZaR+oTRxkp5MI7dBHQP4Mzx2/UQ3cw43AYzi7cBlMY+SKI6uDoiampBDX0GSY+v058Ee0JD5pbchkosSW3ZNJqphQKPfC2X4U19VpnAw243xP61C7VvntneKqdKw6syBiRIelviNj2JsUoNE1o0R1sVO1OvaU6G7w8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6283.namprd10.prod.outlook.com (2603:10b6:510:1a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Tue, 3 Jun
 2025 14:11:26 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 14:11:26 +0000
Date: Tue, 3 Jun 2025 15:11:24 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
Message-ID: <28f53f7e-5ac2-4ef4-8944-6741161e6870@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
 <38bcf562-86dc-42b2-9ffc-53cbc5d8ac22@lucifer.local>
 <877c1s9b6p.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c1s9b6p.fsf@trenco.lwn.net>
X-ClientProxiedBy: LO4P123CA0563.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 05217fe1-8b51-45fe-8ce2-08dda2a8875a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hSQTKXuDuqjcPzHbnrW9OvxZGEXR1HQo6i4ZuVbytfbVrOYYaZv1iBCQ343l?=
 =?us-ascii?Q?vDGHGWPBNwYb43Kh2Jh7sSS/N4ivr/jM2ftyxHdvwMXnlkhNxAwIHYBvGWdd?=
 =?us-ascii?Q?nA2tiNhtFjjg5eSFyBd0810jEhgcRiVKfWBSexx1bP0X2WcGDnqnHcwwnkfZ?=
 =?us-ascii?Q?7sAgTlE6ycafn/9QtCqfx5YMHWggCllaTdezyUS32UsWJd3kz58cYHXhJ2rz?=
 =?us-ascii?Q?ugXf/y4hNhT83TZ1MTWQvaWRpMlejlkgW3f/FpZkdwMfYTtvMg5y/hi+Kchf?=
 =?us-ascii?Q?oyW080FrDtAMhTrSif6tevfqN7c8HxyCvMtL3WhtChI/rPAuuGgnMZygkCPe?=
 =?us-ascii?Q?do9VCatAAGkRdaSLSMv6Dd4I4QboRLJy8yOkZEgNIyxDo3UYq6nFOP210T4f?=
 =?us-ascii?Q?TCpHyWgN5YP+jqHWwNvy5zfoeermYK+rd98VFOsKXvf5n+edeosAFXKVZSTI?=
 =?us-ascii?Q?8yv/HTfGgLf6iJhm94xaXeIaHB9uae56EnD82yRck5hvp0BwCLBSZkMZO5BI?=
 =?us-ascii?Q?lWakMiq6k0vmiQr3CgMwR6ZSYx1eub43MeRjNV1xaCunZvN9pAo6QPOji47R?=
 =?us-ascii?Q?cahMsRwQHUo6WtUw2aJDLlqUhYHBjIs8/Mtbdqy5XnDX1Ep3+FmS7dcUxOl2?=
 =?us-ascii?Q?+aKmD1seGUJ+Kk1D2VRjFwS7BQIMpz5N2J5TG8M5RJnPgk2umEXmlUWnzc8O?=
 =?us-ascii?Q?1nuIsY6iW9sKpwEOFAfu9YVVyXxF20br+F+GK7RmIpOaFQToLWXsu9+3jSsI?=
 =?us-ascii?Q?qFX4kqRDD4fgWoM297m9Ue0Uga5vbVXDQVwtuFLJF6MVy92Hlz1IhURxiXZa?=
 =?us-ascii?Q?bsD5GVNd+jUQRMd8jkh83IfcbxnNtcTMK8Uc8KQfmpixIe9Sb7byGMJpiNxP?=
 =?us-ascii?Q?1UJgMhvgMTw/imxRj70Hu80Qq+NjZyDUZPS069Y3KGSuU4gJ/BmuSOZtwD7P?=
 =?us-ascii?Q?fb7yk9QkcAroZuYjN9IqVmwqNEVWwGMkaoEcTx7SluGS7/s2Od3qvFs1dZ4D?=
 =?us-ascii?Q?VkhhTbQ5/oZ2nZLVcqeqh+k1F5bAgTBcVFkcMDbr5OZtdwr619hDcUri1GDC?=
 =?us-ascii?Q?bG5LMlM1o7OaVfcy6Y6Y4/4DuEUlGmmZtgLSUSRzzdojUpH5UdCIgUQYrlND?=
 =?us-ascii?Q?AEtCMzFBvjLSgrETPx5MogH6LbQeZopHDsi8YExvd47jQemvBZLJaNMz35Gs?=
 =?us-ascii?Q?w/1tzhvVFMFY9aiNCG9nm/keedoShIiH0oAXr8S9lM8E27yJ5hcJqkoy3mx8?=
 =?us-ascii?Q?lypvgtK9wER9Fz8+fPulcRR9pOEf6ZbGhzF2kkdjXQUF2FHtKx5997GLEnvF?=
 =?us-ascii?Q?Lh9GXjt9EO6hLdafIxFqvUQ+y74rBu6DaPNDILDLYBndMMMp1jLK1oVrBKeo?=
 =?us-ascii?Q?S1em+b1zAI75ka9FoPhjK61WArTQYZg0/p01g9aa2jaTlpFUi7CWCRUwadZp?=
 =?us-ascii?Q?iBSwHDiHcAk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QooKomKB3fSwqFlZXeJ1Ud4m2JgYAf0GdvqjAKu2INb+ha1uyNx+G+TfI24A?=
 =?us-ascii?Q?EXXfunW14PkSIFm0Trv1F67E8HL672g8wK/7p8UeAB9FoYQ6fuI3/tfHjeqL?=
 =?us-ascii?Q?90v/3xTPv/MTKRdJT7OUyBQXS8df4RzbP1BLknaE+8Dh8OMktN+Ou90UzF6p?=
 =?us-ascii?Q?DX+R0TwuD96Pz5qAvCzIwsvNi8DtezmdE1RcACX3nhQ9DvfxIXfVKHpI70Zy?=
 =?us-ascii?Q?h23AxneJwR4Acm1FUMmqyqt6kXXJB21qAIqrxS5F9/W0umdm8nYcbNvGgN3U?=
 =?us-ascii?Q?WWfuuVOW2rG005T3BcH4PUU1GeVUwAYFreV+rlZ1Kg03ZbDCjFSocF/LGuvw?=
 =?us-ascii?Q?52zYM6Qe0B1PkOmaW/1NGidNQzr6Q3BEChPodODkyp2WiJU1tAg9proCUD4Z?=
 =?us-ascii?Q?f/EW6EjlfwOFWZP1Q3Otbx4uVxNAtD/UGmRwT4Ql3k7iI3jdq5Ww3tgQQFNY?=
 =?us-ascii?Q?BFUVJomtppugEFtJKXrcL/CKybSuCep9dj//5guIMO/FppomgdwH3kaWM6QH?=
 =?us-ascii?Q?LGrEzVlHGlnBUWaqPGqlr7zpLil0DRJ1RXmRcHrHmp//s+p+Ocd4qgudVtMW?=
 =?us-ascii?Q?5OKs8aUSQOVJFeYO4YaIMPkfZFm9VPTf/Z4x12aTmrfYGfmmsR1yT2z1+HNZ?=
 =?us-ascii?Q?vhEWi1sB5/OaWJqoRlDTfWeU2pzE7LnhavUTnRjoxh2yNOd2yqkPMllgdrOJ?=
 =?us-ascii?Q?siakJX/d+GoQTjGAvWfI8JJc0YLdW/EuNf0wpNkZfzhco5iuBfpCd3MiWrt9?=
 =?us-ascii?Q?TCQ3Gd6c0ZdM/qgqDfUG/8UeMIn138JJqRcUdfIcJIVU/srqLzFTFkvjE1Jt?=
 =?us-ascii?Q?1vU+3/o2gOoSuEzgumwjSRy8Dzubtt7ErqSn27qQIb7ln4w6av3S21MDZ2Kf?=
 =?us-ascii?Q?0cowMFCXYNA/wEjYUPq7Go0gmycC4hm3IJgWNwwP1CCAOIBIx4D83aTfYz1u?=
 =?us-ascii?Q?QXeYWzROMkMSBrM/i3R6Xc1aS0uatv0cUjHZRGjxG09L6RSlIGhONn//01y8?=
 =?us-ascii?Q?KPeb2W1W+8RFhwOni1acqMbVSL6TMl/LvX7CZQUF7TfpGaLRp2M8rQpe57PV?=
 =?us-ascii?Q?Fm/7Di+Tx1gxO48lL+Qt+Xd+pSrluwLkCxs0T2vmhwIoTDbG15nEaeoK0BXo?=
 =?us-ascii?Q?IyT5+NLQZvruzD0bnBi0edtHoKP3RPc2Bw9iz/813rscAO3Yp+GJugJ6X7La?=
 =?us-ascii?Q?QYyKDfvU0vkY3UfjhW1tOXvuLOS7wS5fSFpBS84GmUWt8tUZRz244o3bDIIk?=
 =?us-ascii?Q?ackNNb34YEP+ixteBvLVA/kll3jT0LQczV+lfcYHOmRt9a/uDB72C6zSQn48?=
 =?us-ascii?Q?ehs6fWpSKhI7ZOClH5O5YALs9aeoQ7jXhYr5TLKjEh6G4pEzk8NHDAjraJhq?=
 =?us-ascii?Q?vIg7z3Icy351lZeSlqBLYcTah7UeMkweeUKGUO4iwQurXt9+7daI69DxgP3u?=
 =?us-ascii?Q?eU4cVSh7jSrvdnWacB8iKvhsTHVmwqp4tKM0W5HoX+1UZ2vijvQwbboQazbL?=
 =?us-ascii?Q?WEjau1fZeP9Bfq7piaVbdBC7GE/Ny2bL3sn/t39o9Ne5uTBOEO0ckCN+qqGm?=
 =?us-ascii?Q?7QvZoOImj2Y+sLP6DMFRISGErcTE6ArAkPnQ/Ui8voz91DcJlshwCrUmb7ly?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IGji7CSwaqFItX3objEQPJmNcb92PeIFEPSG5LjKOztSqZvGUy7nnRGQo7nuONkxy91BLzJDUNWdGtMWR74Bh98HpZLwW5ItFpYIyrTXiB4ogQZnTQ28l0bBZQpjSlgYI35XWHyfQqq6CxC1xSR4gSbbIUd4liwHoaJV4uBcssXlNM1Vjhr6VrdznBABZwfb3zpNUncT+tmv6q4f/CkYheUOE39j+eHlMswChR3sNEFU5fWrvGctEZglLQHyA0ySFF6rq1bASBBW6ZaJNwPDafdUPFXbxfbMmScxidZtrLOuISbVobNHs5s+NY2PRXWf9JDbegtvs3UnHux2r2xvDtLt9MMhIM+76VUSrBt2FxOVrPgmInDqS32+RrZIiXGbKI9W8BwouaphRxFMVxIHEBdKv/hw1F3J6i/GMN4Nss768xWMIMVu5RhPS6UQOfP2MCm9OD1fgnrBbWDi5m7VppJ1h40v/y+NnH3SaXzQXNqAm9LW0TZmchPzhox91WTpn01OVLVYBzFEssvvhSWTJUhaWHB1e22fc3b9JJ6Lqk+6PsziMch29lp2ZoPZywI78mYFk38cSR500zlnb/bly3qnKhsTFG+D5Z/Ho/B8eKg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05217fe1-8b51-45fe-8ce2-08dda2a8875a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:11:26.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RMfhqk0t+pgjLovSYZQ05dZFeaQsqKyuCuuuaYiTgtH1EWvDcO/pRM808eCIw0jTK12g5G5dU+XG1oLySP2QNpzrQVl6obBBWcyCKAQtIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6283
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030122
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEyMyBTYWx0ZWRfXzfozZg97bp8o nFVs1k0d+4PJewf44RPwfg1J6h0cVdZ0YGJTjP7MonkypX85hceBGMwZUkipZBSANmYgDfgy2WR toLzC/j4o6olvw/7lqbeaOd3yAeX5Ed9FZVGSU3VlU77QxS/3E63GnS5++/THDMC1TpYLJ+LrET
 yo/0sJ5A93T4XK5Un+GN33aVKi/Ri0stDuda6sVk9erPd2HFk+cys/1HinuX4JfwFP2Sd07/zjZ D0/ISVrv5725vMhC4FtUX0dM8V5AHS0pFJhFMIBnew9HQJ+/fl70cL1l0IQEZlax2Q0FoYwv8fe G6nwExTBzlMDcNziv96kn/dRKgtboIQnl9DRhowTrCwmYfRMLbLlmn12GgZzfLSxRQQBClH2I4l
 cxzv6y9mK/MjNZESlnZDWTjXJai1X6FFdh1/vCOu/0+9z6MN/D1yJs2iMCh7P7DgQAk/ktox
X-Proofpoint-GUID: bLjaloRe69WiJcIgeuEdd-IqAny4q9ov
X-Proofpoint-ORIG-GUID: bLjaloRe69WiJcIgeuEdd-IqAny4q9ov
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=683f0299 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=lwG28bVMucyWlqBYmLIA:9 a=CjuIK1q_8ugA:10

On Tue, Jun 03, 2025 at 08:01:02AM -0600, Jonathan Corbet wrote:
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>
> >> Re: the c:func: stuff -
> >>
> >> Well, the right thing is making function + type names clearly discernable, and
> >> it just putting in the function name like that absolutely does not do the right
> >> thing in that respect.
> >>
> >> I feel strongly on this, as I've tried it both ways and it's a _really_ big
> >> difference in how readable the document is.
> >>
> >> I spent a lot of time trying to make it as readable as possible (given the
> >> complexity) so would really rather not do anything that would hurt that.
> >>
> >
> > Somebody told me that in _other_ .rst's, seemingly, it does figure out xxx() ->
> > function and highlights it like this.
> >
> > But for me, it does not... :)
>
> OK ... If you look at what's going on, some of the functions will be
> marked, others not.  The difference is that there is no markup for
> functions where a cross-reference cannot be made (because they are
> undocumented).
>
> We could easily change the automarkup code to always do the markup; the
> problem with that (which is also a problem with the existing markup
> under Documentation/mm) is you'll have rendered text that looks like a
> cross-reference link, but which is not.  We also lose a clue as to which
> functions are still in need of documentation.

Isn't it a pretty egregious requirement to require documentation of every
referenced function?

I mean if that were a known requirement I'd simply not have written this
document at all, frankly.

And it's one I feel is really quite important, since this behaviour is
complicated, confusing and has led to bugs, including security flaws.

I really think we have to be careful about having barriers in the way of
people writing documentation as much as possible.

>
> The right answer might be to mark them up differently, I guess.

But... what I'm doing here, and what mm does elsewhere works perfectly fine? Why
do we need something new?

Surely this cross-referencing stuff is more useful for API documentation
that explicitly intends to describe functions like this?

>
> jon
