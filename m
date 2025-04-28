Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D82296D01
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863996; cv=fail; b=V4PAAacR2KChJ98p0fRqXdA3qNztjbwY8OXaeKxj3KwtD9j2ijI5RDO3Q3PGrs/+IUclgV1BXMoUQ1CSzwmnFT0t+5oOEcfKy5mrYHtMdyAywarQrb+52Jf4WBq0ssd3ENItLPmrRKOkDquouiMRQIqQv+Zk/NjoaVNVNYt8qaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863996; c=relaxed/simple;
	bh=AbTOn9XVJ9NKIn6KLE0iyw9KBtgZmENCHYtHn/BmmbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q/Oh/rnLrvtr2ivk4FfSTIaXCI2REkQ1AuTRhwJJtSRcTfdsJjETDjM/4xk77e5Gk65N+AoREBDbowmqWI1Nn+L53XOHSy0qSm1TsQKrmDoEACkC3wHeE/Jz9YoyverPOYyG0+dKX/pD7+Rj4f4xxwnG2zPTowdPBCwRyyV/HWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d8pPgl9f; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N+rSEUy8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d8pPgl9f";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N+rSEUy8"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SI6rsk009116;
	Mon, 28 Apr 2025 18:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=NaAINlwcCWGVhtOo98
	QXiH5fYnb1F2J0nRcR3MH6ixM=; b=d8pPgl9fjto6PvRgBmfa0Ur4RaxRwzCkB/
	7qsrRSir+ZqYVnpC9IyXbf+zl/jZh+eWRMBYv3GkLtGDSBQuJpYXLPBbr3k+dA8P
	gXDzKevpNWdsSEwWOsbCEA1X6uP5usRZAB4unymkrI5lA2qmOnzbprpjdsi/ILuu
	dx8ErGLd4ZCEWG2C0UXbU79Bc8wbashl43aJnO/gLY0HXdyS+iOzXhBTmq/hkA2X
	v0u5T/olrVB46rZbH7SPgWSQa4X1Rn9ZgZ4o+WKK2nITf8dm0EjFahS4muHqyWN2
	654VlrBsrBLwfyJPv3lyTqhusVm/2Vc+hlsnD8fXm8qUmPEHXlRg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46aenug0gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 18:12:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53SGqHtZ035354;
	Mon, 28 Apr 2025 18:12:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nx8hvmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 18:12:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5NXOYvnVUeEscGLUxjIwghrZL3xrg+w5ZDa6Ud868VAUl4vNRj/ComRzLsn+Ljh/VsWGyULZN85Q9xyiKDvzphqmJC11Uzicto/BG+rnFHoFAH6luh/b5JFabbZgyLo9QeinweZ+AugfjDtGT3X/gjfFY19y/5geU4qBEk/avQ5MO0aQ8K66Gugm11FT97J8MBl9Lz7g8Hha5EerLC8j08Aliy8BySnMyHFFPdi264HjFkmQ7r3Y3Y6Bo7YCQosr/NiLkkKlhr8gswFxR2b5BwGND5dgKtHHEAcWZrALQmCbhoZLjHuUHnW6OrzBfzlh9XYQkh4Eq7qNcs5zklDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaAINlwcCWGVhtOo98QXiH5fYnb1F2J0nRcR3MH6ixM=;
 b=HkI1DVyqq7I+HtJ7g5ERCt0eoZoT5fS/VNHXtjRdGlj8ZcFI0sL2i9EVIm2djGwUorL23TLlNM9ulMaFXDEj/Vlum+j55ixpLXsrxG5VeLhsJPlTfokbrURc9mShglpYwgGPId+bTCiZ4ijMtU4Zg2nX9kBIWIhlHnur62K7Ss+HJI8JvJq7z2/FzVA9FCu8dDJxz6Yy4O7tH2e/usk84mdy1K4W1kvs95bpUoh2TmJhnwUD0mCW2RYrKGeFZZEoSa40qhXTrXZgMA4KVnxpMXEWCUElN5YxkE+Y3Q3kr2b/JE7diCz2+sKAvKrMR50u3xGfKZlwQG4ZFA9scsPrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaAINlwcCWGVhtOo98QXiH5fYnb1F2J0nRcR3MH6ixM=;
 b=N+rSEUy80IZY/X6aU1TgyuldK2zd26gn7jhuAFyIMstTgoq3FKCcQythTTHG5nPorFfaVHWcjzVoNnaHMjV6p5yqEXIuKKG8pJ5YmumBv8oNd4cnXaiTSptEm38cqJKqZhRrR+bqpP3GJFJP03PKXEnCdYt/78RkKZCy/CutSGE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM3PPF4A29B3BB2.namprd10.prod.outlook.com (2603:10b6:f:fc00::c25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 18:12:43 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 18:12:43 +0000
Date: Mon, 28 Apr 2025 14:12:40 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Hailong Liu <hailong.liu@oppo.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "surenb@google.com" <surenb@google.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        =?utf-8?B?6buE5pyd6ZizIChaaGFveWFuZyBIdWFuZyk=?= <zhaoyang.huang@unisoc.com>,
        "zhangpeng.00@bytedance.com" <zhangpeng.00@bytedance.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [bug] [stable-6.6.66] [maple_tree] [mmap] mab_mas_cp+0xb0/0x278
 invalid maple_state for spanning
Message-ID: <znbfqcbanvur2et7oy2yakkvjmfsnzvkphc3frohy7jh7hggcq@5e3nvk7hiijc>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Hailong Liu <hailong.liu@oppo.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"surenb@google.com" <surenb@google.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	=?utf-8?B?6buE5pyd6ZizIChaaGFveWFuZyBIdWFuZyk=?= <zhaoyang.huang@unisoc.com>, "zhangpeng.00@bytedance.com" <zhangpeng.00@bytedance.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: QB1P288CA0028.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::41) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM3PPF4A29B3BB2:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee3d617-f43d-4b32-6a1b-08dd8680454e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8XCZbqrDsPh6rNaPpKl+NhaVCuMi/FIhVNgYI1TruPkpqPxIyqA5VQr5j0wB?=
 =?us-ascii?Q?GD0sBPaPHRjHEkd409TfcMANoiOgWlYUI9onMmLKmWM18BTBg/TT/Is+EvuG?=
 =?us-ascii?Q?holIOZFZYBDKl1VyaW8JSkWLELeAkUwyIMol2s4VtLhm486d0gKDgHZE7WA2?=
 =?us-ascii?Q?9sje6myXABFsQP5hw7/LskQ4iDLy2EYB+pUGqRv5Qbls9f199nZ6MW0+woGS?=
 =?us-ascii?Q?XLr3RA4GVw6orJqx044hhIWXnMpr5j94VSgfXql7hYv47auDNNOYbibkd15P?=
 =?us-ascii?Q?fXzYQiWXglacM0BrmDTvzpWsrzkk+9neZSZmo50/NtrKUhPdzE67ehGwgR4K?=
 =?us-ascii?Q?6ngZa0zerDtROOzzC2nCbP9/P9y/WPF+9Pjr9ssCSs4mojVehZ8mOf4f4HcJ?=
 =?us-ascii?Q?asMPd3TXJqE0bbJChcfVSrp+ODMZM245oK7s8zAFTaLoYFi+KZDx/Z/ndCnC?=
 =?us-ascii?Q?HebdbMMmhCMMECDD2gpDFinY38TcaAkj9Ekd0zQ3hD8DUsMTiq9a6+RWCPnl?=
 =?us-ascii?Q?MZFUYGOWDq/AYNbrf9p/Dzs7LGt+KjuDj8ftpxQ7QkL1V0vO16QveGV30sVh?=
 =?us-ascii?Q?Ye10oBTFEi5HN8eyJbj2eNhSphtVQBVQ37bjFrXzBUT+Xpl0GyhUT3ojTThR?=
 =?us-ascii?Q?cmZAEDLt+y8Cyu+iM7k0dLx2EM2a5krqC2VrYde1DokdU8kghfDnKOJ9Y5ej?=
 =?us-ascii?Q?ELAfWNc+PkHHv5UqeXbRnDgru3/MtW6i/ruxEfEWPtfSl7FDhNZqzqTQj6F0?=
 =?us-ascii?Q?VlnBWpQKUeS8ape1YUnV29Ln2TINA460Lk33NFCk0BumBHc6v+2ST6LpL0TF?=
 =?us-ascii?Q?aqGIW4oHJnuWiDNz7X75MngexMixmr6KudHJAZzd9GdJDjl/LJzBsfS09an5?=
 =?us-ascii?Q?BPeqs4ILbqDr7zPRpIb5vpYn2ubRSPoSjh2yfTvGKKCXL36btVwOJ4o50KfG?=
 =?us-ascii?Q?R9cydCjGBXF80TaMDRssTYj9CB2uilB85AuH2rcUtaHRcviQqQ++7ooZOqGQ?=
 =?us-ascii?Q?+66mn0+KNa6vNULs8UbnynS0AuHdO6RBFjrgZGAWqs3oZfH4TdSaINOGkOXa?=
 =?us-ascii?Q?IenFdfJntFOAlpyIxYcoHm4Fpah+IpMgr3SpZ6biKWyT/zY5T6ajTWJH5wVu?=
 =?us-ascii?Q?uX6rVAxx78DtR4SQ9DOqlPfe4F7YOTvE5S+mJX0WELEHy0xeShhWGvdZuyRr?=
 =?us-ascii?Q?h+Jmlmd52FI7dTvdd39abPhMpl/pSTbVQFFYMwKuxAUmy7B1ewyx9exQqhlF?=
 =?us-ascii?Q?L+sMlaz+J5gJBjyvY/hourvVNR3pmkMCHTQXQQ8DyNToCwqoBpVmeERGyKFB?=
 =?us-ascii?Q?9i6fWgJSTvwYN9TwgOAMKfJPNOzoUauztSm/EEjP3rVxz1EWmc8QqSeb+Kks?=
 =?us-ascii?Q?8jSBI3sscBUhTQ8TcEe07v6QnSsIpUYlxy66TEGpJ3egqV5d0oeWmYAOgfUH?=
 =?us-ascii?Q?G/1IMPuHRfI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/HMatAfiPG7IkTMIz+sFPM1D9bxFZy4awIoYp2xboBWxvjcYP77a1qtuo0Yg?=
 =?us-ascii?Q?4WluquWt1OPR4ZRBAz8ifK6654rBcQEsPc+MiyV1VmaCEKGoAcMzCyMf9ZGg?=
 =?us-ascii?Q?aEWwYGisJHqNQnk839o4UxGtypR/bUwJH5jwer1dHnc9oMiwIox54MPscAI+?=
 =?us-ascii?Q?v3X+rU8VH3EEuhNNRa8khvQNdheyfWJCGAMxUTde1ahSfKHf/1lk4kWhcB76?=
 =?us-ascii?Q?xTm8Ax7biYiUt1d5XjOyB+pX9Rw444RWx6KSTI0RHq/LspZuYxIVeX//67XC?=
 =?us-ascii?Q?D7Yv7fb53E+LOnJVrvQ1lte8LVfbkD+kEmijcsxlqF8uGhT4cIqN/nRLMarH?=
 =?us-ascii?Q?tFU7d9oCt3I39SZCi1fu7JazLImitYrA9YxNBKmTMfobTW4MQ7SGUTWGp0fx?=
 =?us-ascii?Q?h9ziBKUGWgV/eQl0sI2fldH/IYHNYzkNBoPL/BMHZ7+/uVATZkSU7LIqE9e7?=
 =?us-ascii?Q?yHeGkIP/2I5ZFPGbiwhHYkcrHbfEPb066qaM1CMkYJufms1PnOjx/1rKIZsx?=
 =?us-ascii?Q?gUcKfRbbiqtdFX++rl+T3AJSWhpfqIXHCqLNsKEJUtbAolNSpYokSV5Bs5BI?=
 =?us-ascii?Q?sR72QF69oVHxb0AYZboe9lDmX2EbxVUJ20PGeGHcgMhfWQ9lmT+Ryn/lIqF4?=
 =?us-ascii?Q?SvenzbftCYRAglWWnDkr6CA24M42UPjILuUmQcGd8B16HKgiWJy+IxNjYhZK?=
 =?us-ascii?Q?jvo1fVOMRfexeARvwF4dwUqmtt8EVbj/7Rcm7tuqnR7ZkleX0eT6t90ghTt9?=
 =?us-ascii?Q?ikGUp+x3LPSoDy20mMG5dX+onH5FsJeH522jmhLqypz93R0H5qwT6td3nEHF?=
 =?us-ascii?Q?2o2U6NUh9LpU5fTD5Q9Kqee/YUI/aF+NImZyRBZZEDliwx3vU4LYTFC7Mqio?=
 =?us-ascii?Q?7TrG4N7V9M5r5E3UaiXBdJ0Zsad9WQfwghMh6UhbaP9+2FhnvOfRMonkbJhm?=
 =?us-ascii?Q?t/+C9BAtKnNlp211EKIdw8r9zM/wMNf+UTdSKEdWv1Tf5sAUlKtGpmIGeJ1W?=
 =?us-ascii?Q?wA2S3C/Rs4zAQsGtyKA14XNOp3tb3uItwNKxawgKsM+EE/gETt+AJEt+GfGF?=
 =?us-ascii?Q?1hnYcUVKMw8NNr1We5MvT5EnyX6kBqd4efTSi5S5KxvpBTvEVJSVCtvUEw+Z?=
 =?us-ascii?Q?zMRxmkPwoMJBsl9llMG/CB/Z/WsZJLu/OueFBjde44WgzBvr85Eiwyxh7lbu?=
 =?us-ascii?Q?Slhyl1Pbqqm8uC8jiBA7gLcCET2KBWST83MqLiWAWIZLa5nSatqLeSPLb7Hz?=
 =?us-ascii?Q?e8LG0Z1xfG99FXD6yZRtXZCyqcsysvs2xrrLR4tp02cuNYAZnG0XCo1mVkGj?=
 =?us-ascii?Q?wNg/n12G+9tJyhYZOxie1/R6LX2veUyscmIhZpNYP/rfBT0SpPNUWZNINdfO?=
 =?us-ascii?Q?BlqzLNVxD18ha6P+SN/QsD9EDxAFrlhfUMtZxthgnTxV1B2UAqFEG+zERzAR?=
 =?us-ascii?Q?cAV8DJwLoptWe6u/u68TjIDrgREkPHXVyRkLPBd0M9SfbkuTn6/YBqyimYbF?=
 =?us-ascii?Q?8NdPLuDe2W9p0oeUPEU+3GPpyGOyyZgGzh5a3T9bq7ot2uskrCaAFo77lr8F?=
 =?us-ascii?Q?UohkrtEX9/PcBkVNj31WhPXuOTOa4EaqUHZVY2wC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C3qopW/SIhlo6qJxVTxxR1ez8Zi2VsiV3Fyr42s329ozPUrBVBSOfB31gjW7X/XMjKBMTB8FWBdHZdobuoNkTmXRTWX3Jsx75yP5Yu3F66YGJwE/ZM2Duab3MK2AkbG23IpiXfgJUXp4KRb5QcmWUJbSelgC+StECEVbMJpiy9YUFgp8V33h9W9hT72dX4P4oXd1TARz1LOi+KWfMPs39THR5GUwllBbYsh19xvlaNnZBiIaO6jR9B9EXMROv7Rp3Blg+0YpC6ZWW8wm+EL6bsPXpfvl3qe7IcPnpnHchs9PHvA3beUYHZwTG8DarEundcqNweLkoUxvR8Ak59PwBD70MWfJWzOw+V2+tnskpPNH9aTA1wBgc8nTi6ZRcMqC0jiNH8e8ods0vieykU3BoRkUoN7NRTpyaXiXzgHbWyk6aCMXMjfD8Bbtu9fXeEmtkZCG3W1AOO5bz4R/XyRCgaR3u4NM4V3SML8RYILyc/0HbCMKeQxLt/viL2M5sZQIfRBrIyy0tjYfLMG9yVzWIrJzHwJt22iok2sxL0VqFWkHt9YY9Wv/xLKCK9Q5Fi6qQezzhF6IwBnLB/3BFRfMHwQZxAd1yiqbI5pRryOcIn4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee3d617-f43d-4b32-6a1b-08dd8680454e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:12:43.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8iD63jz/4WvLWLMMWMde5BjLJ3OeWlvSjQFTbqIQreOCbvT0nDKxY4yrWBOJtBvuhk4Mrh/9NlqsIbp4VOtkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4A29B3BB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504280146
X-Proofpoint-ORIG-GUID: whhvECwEy1KW0qcMOsTqZu85qDfpGUKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0NyBTYWx0ZWRfX89rxcMyWNB9f JUBgyu7rLrS3a7MPf6VjKmDV3qZIA3h1o8Pb89+MHexdityiubsvKNreYSSrm9rIrCTUU0PATl2 BHaHot/LooT+y/n/5SxKHpV42ben0QazSjm14vaNaPDRvxuYliW3eLNJu7gjXICPT8ZpKmoSYPq
 p/0aAaLk4QVjoH9P07gpzWk3z5u69LKfGrRr6RV9aSajfRn1aqia7FnNJCjpCgjFZzmQgjcO8sf Le/UT8VUO+cikZ6/ur/1iwjq0eeNPo96ptNeM9bif3d6KDtWEuYnmsgHKP6CCGtN2CIYI85J28L VYn0RtcoNXiwm7VgyPkiuWxAD/gfPFw0PuxLFNYm+vB1m3sVcdQ7JMFjOWgDXfEMq8Ji7tysmIa jr6TIndF
X-Proofpoint-GUID: whhvECwEy1KW0qcMOsTqZu85qDfpGUKX

* Hailong Liu <hailong.liu@oppo.com> [250428 10:34]:
> Hi:
> 
> After upgrade to kernel-6.6-y we face a panic on vma_merge()
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000078

Thank you for reporting this issue upstream.

There should also be a warning prior to this issue pointing out that
there are no nodes left from the preallocation?

> Mem abort info:
>   ESR = 0x0000000096000006
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x06: level 2 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> user pgtable: 4k pages, 39-bit VAs, pgdp=0000000a381d0000
> [0000000000000078] pgd=0800000a381d1003, p4d=0800000a381d1003, pud=0800000a381d1003, pmd=0000000000000000
> Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> Skip md ftrace buffer dump for: 0x1609e0
> CPU: 7 PID: 11563 Comm: x Tainted: G        W  OE      6.6.56-android15
> Hardware name: Qualcomm Technologies, Inc. Parrot QRD, Alpha-M (DT)
> pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : mab_mas_cp+0xb0/0x278
> lr : mas_spanning_rebalance+0x830/0xeb4
> sp : ffffffc0b2323410
> x29: ffffffc0b2323420 x28: 0000000000000009 x27: 0000000000000001
> x26: ffffff804c0ddb0c x25: 0000000000000001 x24: 0000000000000008
> x23: 000000000000000c x22: 000000000000000c x21: ffffffc0b23236d0
> x20: 0000000000000000 x19: ffffffc0b2323690 x18: ffffffc0ac5a2088
> x17: 0000000000000000 x16: ffffff89b7d68d48 x15: ffffff897cfb6898
> x14: ffffff89ca568000 x13: ffffff88082e74b0 x12: 0000000000000000
> x11: 000000000000000f x10: 0000000000000080 x9 : 000000000000000d
> x8 : 000000000000000d x7 : ffffff89d16690c8 x6 : ffffff87b3847bb8
> x5 : ffffff804c0ddbe8 x4 : 0000000000000000 x3 : ffffffc0b23234c8
> x2 : 0000000000000019 x1 : 000000000000000d x0 : 0000000000000080
> Call trace:
>  mab_mas_cp+0xb0/0x278
>  mas_spanning_rebalance+0x830/0xeb4
>  mas_wr_spanning_store+0x8ac/0xa58
>  mas_wr_store_entry+0x130/0x180
>  mas_store_prealloc+0x98/0x1bc
>  vma_iter_store+0x64/0x74
>  vma_merge+0x5e4/0x73c
>  mmap_region+0x8d8/0xa30
>  do_mmap+0x3e0/0x578
>  vm_mmap_pgoff+0x1a0/0x1f8
>  ksys_mmap_pgoff+0x78/0xf4
>  __arm64_sys_mmap+0x34/0x44
>  invoke_syscall+0x58/0x114
>  el0_svc_common+0x80/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x38/0x68
>  el0t_64_sync_handler+0x68/0xbc
>  el0t_64_sync+0x1a8/0x1ac
> 
> the issue introduced by bdc136e2b05f ("mm: resolve faulty mmap_region() error path behaviour")

I'm not entirely sure this is the commit to blame.

> 
> the reason is that call vma_iter_prealloc() twice and the maple_state is invalid. I write a reproducer here
> by cat /proc/maple_test_merge the patch in attachment(maple_tree_debug.patch).

Not quite correct.  The reason is that the vma iterator is adjusted by
the vma_merge() code to span the previous node without resetting the vma
iterator state prior to the second vma_iter_prealloc() call, but then
vma_iter_store() DOES reset the vma iterator prior to the store.

It should be fine to call vma_iter_prealloc() twice.  This code does not
reset the maple state; the reset is in vma_iter_store() via
vma_iter_invalidate().

The vma iterator is not reset during vma_iter_config() to avoid a
re-walk to the exact same place in the tree, for most cases.  This
optimisation would really be the root of the issue.

Looking into this further, the only reason we don't get a corrupt tree
is that the vma_iter_store() code detects the issue and resets the
iterator itself.  Unfortunately, we then run out of preallocated nodes.
There is a warning to detect this issue, but it is only enabled by
CONFIG_DEBUG_VM_MAPLE_TREE, which is heavy handed.

Spanning the next node is already checked in the mas_preallocate() code,
so the fix could go in the vma iterator, the vma code, or even the
underlying maple tree code.

Fixing the maple tree code directly means that we can still get into
this state in the future when people call vma_iter_config() between
vma_iter_prealloc() and vma_iter_store() - which should not be allowed
either.

> 
> the reproducer simulates vma mmap at frist. then mmap_region() vma_merge(), 
> 
> the code from stable-6.6.y
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/mm/mmap.c?h=linux-6.6.y
> 
> the reason show as follows
> maple_tree
>                parent
>     leaf_1(..|c)   leaf_2(d..f|..)
> 
> __mmap_region(addr=d)
>     1. vma_iter_prealloc()
>         mas_state node=leaf_2 alloc=*mt_alloc_one* new_node_a
> 
>     2. mmap_file(file, vma)
>         the vm_flags changed by some driver (ashmem) https://android.googlesource.com/kernel/msm/+/android-6.0.1_r0.74/drivers/staging/android/ashmem.c#312

btw, this is an out of tree driver.

I also hate the optimisation here of trying to merge a second time after
a driver changes its flags.

> 
> vma_merge() (c can merge with d)
>     3. vma_prev()
>         mas_state node=leaf_1 alloc=new_node_a
>     5. vma_iter_config()
>         mas_state node=parent alloc=new_node_a
>     4. vma_iter_prealloc()
>         mas_state node=parent alloc=new_node_a
>     6. vma_iter_store() --> panic
>         use invalid new_node_a for spanning write
> 
> 
> IMO, this issue can be fixed by mmap side maybe conflict with the patch. if
> fix in maple_tree which need to destory the new_node_a

No.  Destroying new_node_a will make a larger regression.  The current
code will either use those nodes or add to them.  Any unused nodes are
freed accordingly.

I think we need to do several things to avoid this situation.

First, the maple tree needs to do a better job detecting when to reset
the maple state.  I don't like this because it's supposed to be the
advanced interface.

Unfortunately it is a bit more work than I would like - but that work is
necessary for the newer code that preallocates less anyways, so we're
going to eat into that savings a bit.  Most of this is cache-hot anyways
though.

Second, we should change the detection of the issue in the vma iterator
store code to a CONFIG_DEBUG_VM so that it is shown to more users.  This
should mean that it will become less likely to get into a situation
where the vma iterator has issues during a store.

Another part of the vma iterator fix would be commenting the iterator
code to point out potential misuses.

Third, we should add more testing for both the maple tree and vma
userspace code for these scenarios.

...

Thanks,
Liam
