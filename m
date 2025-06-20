Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20D72BD5B1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431572; cv=fail; b=EKmytv4gaGYFpt5vDj6TJp0s+IBmuUiZOJb3hlmyk9GErySBjCeuQTNFo+/w2rvacU12PcPeU4z+FFy4RjgFs8rvFrF4MkPUZ0JZdU+SXv5607zQyxC/AGKN0vp30/UaMgsMiY07NXi7EynaEZxjPj0q93nd1C9aW/Vw2NIqkLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431572; c=relaxed/simple;
	bh=/NHbTD5PTSlx+GS2cs5ia1g3hfvqxhaZaKPEoS4bw+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ItG7TBgZxjyn6UXEEMMHgh8P6C0AsHyR4UGaLbC7jY9jBp3vQEZ3/6tnGgsIFZzaKbo5ZE/+EbiLcvKv60PBBUH1EzUB3TKsnGpDGf5P05RJ5YJwqPQCTJ9KXqI8oLxl1GjATzRfJPoN1NRbnEFWNkoTxBa5JYRgcRhZ4X0fA1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eNHdNEGq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=L+l4VY/x; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eNHdNEGq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="L+l4VY/x"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBmuC023345;
	Fri, 20 Jun 2025 14:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=a5wqpAefuSD15XWxmd
	OpChvno5MTkFOcwm/NNnI0qvo=; b=eNHdNEGq2igc/HGvSzmjikym/7vccg56uM
	Pr6bAdu5jo4CiD9xUOFT1s9F+jpVlK6dN7xaiKXH/gveBSln0TLHkiwThMdlEHww
	nSul4kk0UNz9o2d43twoOk/OPsfNnY4+3RbVaei0ImiRPC5ogBYCapraDnCxc+1t
	776Bb2ypAQSPVSqUYgIDj2TGs65sSr1ZUl6B7X915VvlxtoU7APc/STWpH9yt7a9
	Jf8UeG+SqetRI6uTwaYhKZ7OHeGOMQVz2XJHjaBEEuuyfq81y1R0T78/eHJ6ks1L
	9KT7o55wr4gVktMTqclkE4fdx/6mhM1wba3U0EG2uarIOC9i/dJQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f3vq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 14:59:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KD0h5Z021636;
	Fri, 20 Jun 2025 14:59:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhcs9jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 14:59:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOHzy6ZrJYp1WoyvYz5rPdDaTAZwtn0Yr0qH9i9khrty/fzjk+fI9z7Nqyt5pve/29xco1MmgJq+BVlg1+9J0TlIrNgnD/NGb9gPoQ3YJyqY063HCByf3pSrEpWf8Ci+gX2MLAX2PDpAPn+SiOAJeywe7JsYNXIrQ186ZUAqu+v13LtCWalmK8XCo9roUjD629Ah2JOp0tdqYUN0OvNaMcgttrR88Ll7Xc29rVEvzzEosbIhzrezEwhrJAehzYoU+T91nVji5fkKNxJ1IlBbSwqnDFuTKnO/h4S59erBEN3MXdRC7eJtmbBLhqpXwCP5LYf4zo4/roQLKostHM+NIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5wqpAefuSD15XWxmdOpChvno5MTkFOcwm/NNnI0qvo=;
 b=baFHnzfAa4HEyllJM6Z+iIBNgO5lSTWPK+hCnAQPQ4Yvn/mrHhYzHHE/Ih+GSf56x0scoZfLPf88jF9Nfc6rsMbJrQNXW2ZqEN/JwUtNMzwxyAF9FKdDYZeHnkO584I3wj0MO+cYwHVO3PlSc8kG0uHjUayYAMCmjsGBUfgae4P4GGCOODjx6QbbfdRmepfRBg8tbkEmQpRc/AD3/ctS1XN4nVdvlts9PiAIvAoDHdbaJnRnwX5eDqgmuuzLc4ulm2BZU/0+icaK52E6t7lVyCzVctZ3xI+T1s3fBhSlokgsADYyBavcrOhkDBBwZHeEo7jIz8i0gGNiUZch/MRzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5wqpAefuSD15XWxmdOpChvno5MTkFOcwm/NNnI0qvo=;
 b=L+l4VY/xSQfZkrkb6ZSIeDfrEi/3LEv01DfcA0rlEFp5WDBSpJ0QgnXjVaSXzweokviRoE7phPLqohHgnKmokrcv8ItytxVxs6p0Y6+Kd73pCuNwrztVpSbuznMs7bmJWpgfCijcCr5GPD8Vqe3UukBMVgKeLVJgjb3EjFrliAE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ1PR10MB6002.namprd10.prod.outlook.com (2603:10b6:a03:45f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Fri, 20 Jun
 2025 14:58:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 14:58:58 +0000
Date: Fri, 20 Jun 2025 15:58:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Jann Horn <jannh@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
        SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 4/5] mm/madvise: thread all madvise state through
 madv_behavior
Message-ID: <d5fd1a91-0b32-4eb8-aa4c-2f4e0e1ef102@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <ce41fab11efac21ba28b89328276076b9e389093.1750363557.git.lorenzo.stoakes@oracle.com>
 <117f730b-6107-4093-afd2-51c15e503cda@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <117f730b-6107-4093-afd2-51c15e503cda@suse.cz>
X-ClientProxiedBy: LO4P123CA0112.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ1PR10MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d01c473-d7ac-4b48-472a-08ddb00afbf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vLjFtRoQbRshzOYH17N3jExCQL+zRnM2xHUPszk1SPa3PLeFO9XfJM+Qvcqj?=
 =?us-ascii?Q?FsdWkXlAMS21IgfMqCn3JJLqLwtKfmZb7zCBex/aWbwCnY0bSi70DqT3vY9C?=
 =?us-ascii?Q?AUFgWsZetkkjQktnTEmt7NV5ZlXdCoII6mMhxNuCIAcJmbdw1Cw4nMrrGbaK?=
 =?us-ascii?Q?Iw3pMpvrXAGFXn77A85Iap4amsZE1wvADCUPHKBJ/VD2AjF4inC56EIMjbXy?=
 =?us-ascii?Q?m5L5n3c/UuTpq+dn4P9JcfF0pRo3RySrZ0V+08AlEgLSXyPaqJZGEL48WYXo?=
 =?us-ascii?Q?VTkmd8kAzLRR07NIfOoun4L10DuEE42ebGOiqX2JQ/m7YBMJDt5PjGNGqON+?=
 =?us-ascii?Q?pJ6+vwVQwocFpS7xc7Qxi9a9cZlY8oW4no3P0RdQiu8UMFFfE7jvXREKz/SH?=
 =?us-ascii?Q?+rw7VUDHxeVgEyWSHqsJJtcFjChBDpVXe+BBibxgBh3aJeXkqu0PM0L65ivY?=
 =?us-ascii?Q?i2GdVl7OEUsMVNE6SzngZe5v61yEY8k45IZu9EndefDGYfVJWmYEJg+Vxfsx?=
 =?us-ascii?Q?F9KLCBewmJQEXQXJr9BGE3pX4bfHYbi7UVHx7cusXTaYylKRUidgoM1TIOU5?=
 =?us-ascii?Q?M6DrneOBeKafMGYiZoaSQtPLPcUkOxnLGrMKDU+72WpOxwiigGpvB3+UjT8v?=
 =?us-ascii?Q?NRKtVMO3mmfum+XwWWO+i+H8b0mK2dXQGNGYqW05NZUC/lUwFYWAl7nwxFmE?=
 =?us-ascii?Q?MOHH1lsTkxx9SVVOE6XxWo7Xo1FqKEsAdZj2UOg0KiZ+NWw+fH+DDiQEgg85?=
 =?us-ascii?Q?dqceWuAS2NCp++zmEAz8Q2n/aLP1gLXpvDZTnbz7UANsPrASmU37jSUnS6Ti?=
 =?us-ascii?Q?fl0JWnkKIj/CtvJ0NceW2W5hwPDwOBmKgvF3InuRrCJ0p12e2qSsbKPGxgNW?=
 =?us-ascii?Q?qbW3vazsPW9pntNZSS7WO3ah15lJDI5PnHP9b116fdBJxAg1I2d8qVY+wlIO?=
 =?us-ascii?Q?Y1opbTfxUo2q0oLE0y7TMe7CMC0t6B3mFQTvvz6LhGS56Bawj2tY/uTHEqm4?=
 =?us-ascii?Q?JRW3n3MDdg7IzPrC8ZVaOlXMYXDiEH5NOoob49jACcs2LfnUiTQZoAbalWf/?=
 =?us-ascii?Q?AQaM++IxNuoZYRghCiZYfurqJlTZbvIQIDhKlCoJWvtYngyNslUFQ/dOR8ie?=
 =?us-ascii?Q?KZYshyy5CHmjoPD2vTy0+7AsaLzekzkXXoKtev/F470C/OkwoaW2ReFjowne?=
 =?us-ascii?Q?+Daz16DHzM2KqUBza+FyqiXydtilp7AgSL6PnXvzAxX0x9aOM5iycgEH98ov?=
 =?us-ascii?Q?ZgHh7VPBpN9ZVMdg93nzWpZla4D4i5xa43ZE6R79Unn29owmrPIzm0xhOKpS?=
 =?us-ascii?Q?zs5bveA7jbCcOwjeH+Sjc713VlRHXNV5YzF9JQ25hiI7eFBGUTiXp1wWAcm6?=
 =?us-ascii?Q?/MODC1jRb5uDszxgx0AtXCdcpKdkOSEfNX4Ac22u0BnXfcnIdA6ppmVLC7o2?=
 =?us-ascii?Q?zAG0EqgKIa8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JNa41REuSdzCrOo4Z5jqFI85QZbA5c40XS32I/3WwzBI/SnGRjhzWXFZMFun?=
 =?us-ascii?Q?p03a07Co7eV4Qljgn7dEI/vxw+7hP13VjmXb622ZEXiqM4fJKtFigKuSSrve?=
 =?us-ascii?Q?zyffNRm3oPcqGMHurYatsCPZtEcOkCkGUJHszXhFFia8aU+SsR9ilaRAzD0f?=
 =?us-ascii?Q?gC9mK5ar1ZnS/TQw54LtBBQdQtQRNylBNn0xzLvQFTpPOT86lzy53yBxt6Yb?=
 =?us-ascii?Q?wnsOYRPqL25UuTeSFb9st7apA5ak/hh8GvdGuJEXx5p3HXDxkOQkK+oDXXby?=
 =?us-ascii?Q?1KwwWghI3NtfML++3wiRAzEFuHK4fyrRyUnKh7LZP4jfVNgupTLJi94oQVrF?=
 =?us-ascii?Q?o4rWPGsONJoL7SZ1e6DmDzkTE6/Pouy9QsZZU4f+bWdi8qJzdRAe288xxUYm?=
 =?us-ascii?Q?swDbur/pOZCdRAeisPRXgFadWC2PZluT1vIHViIq4FqYtXI1xXKQdm+vlBEZ?=
 =?us-ascii?Q?K0MfHoZ85eXLRz4u054zAA2tEE0mWsjinybQVvnFSwpWoJb/WDjXIXe8ODR1?=
 =?us-ascii?Q?72a82PpAXutxrTXTJG+gNgs4l053afeFICBTnjpxJrFohfBC/hZu7Hi8DoKb?=
 =?us-ascii?Q?lekL6Eyks6Guc/AZ+fMtLiHv5i5jTXRoHmcGUT29nwx9LNhlfi+S+9imENEx?=
 =?us-ascii?Q?blgSUWEonKlZALRv/Pvrv10k5Hp0IMr/AP1uSTtxBVSThBE+XW7QWuwz/KdL?=
 =?us-ascii?Q?oU6qC3kjKzJeu9Pzrk1ovQPIKAPS37/WqA5aMj+vUHrUuCOOnBiZ1sPEwoQX?=
 =?us-ascii?Q?OhG6llbdjxzc5mjQParQC50oDBNScaGVSwobSksFSc9jsR9M9ltGSZ+q7XyF?=
 =?us-ascii?Q?fFlWD5bFgjCCZDU8rqpN1R9y+21UV3F0hTS3RzVczOBDrNHGEk3C/6W0hYqf?=
 =?us-ascii?Q?NT4ZU0xx1vNi31ijxVHmHRCKxy8Z40oAeJAixOuVEMBa8pn4w+vF9xjVLd71?=
 =?us-ascii?Q?ifmK+ddX/ykL3JBAB6KmuMtMizF8iVWtIWuoczCIA3os9cVmKVnj5V9n30EN?=
 =?us-ascii?Q?ySD8R/SO67dMM2JJ4q/8jRBxWBiJ4I7qoOSXFI/JGVgPtNcC8gMrjq2y6Oxn?=
 =?us-ascii?Q?Fu0yTpi8fg8AzHueKTB63ut0sMxPQsrweM1o0rUwAdp0CPYlCQ0Y15UpVlos?=
 =?us-ascii?Q?lm2YAfQqW+GrCvshmGiViM4+ixHZrYOB+gcSD6rBpxochK16sIisj4QRLuLh?=
 =?us-ascii?Q?PApzcqiVSybrD7kPI3c54LpIhoXuF5+tyj31Q+VkMeJea6ftdsjdqFFsqHA1?=
 =?us-ascii?Q?UMCyQUvKrQP6trB/7bTUH1qH1g3njNoHoh1s2vUG+Vy4syXK2hAq5jpHvrak?=
 =?us-ascii?Q?wLvfVdQakPXR0PcIOpI3Tt7OZE76h0Iax0LzK4rBVo4aD/PfOtXE6bpNMplW?=
 =?us-ascii?Q?6lob1fBCr7+zjszxENvKO1fMcoJcLPj3ChhUm5KAzztzvY2MKmklXumlIwAt?=
 =?us-ascii?Q?kvMOJSk7nDEETuf/EhQFae79j82Z1HhKeoYe7EZvhPddrZhoZM3mulPt2qMH?=
 =?us-ascii?Q?ILKmDy9TBplXfFbsgFiagAZgNJWlJ3OgHym32cQrdzEsqE6CILzb2xE+GbNz?=
 =?us-ascii?Q?bo70ZmSmKDTrivYOjV3hd/lbekE4M8HGAKzZ5NKp7zC8VfIPFp5ZaiIVYO6n?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LIVYvJuqrI7i5xlh0n3yxY7DomRpBSVP3yua7C6uRFZEB5mJZjhFS1qX1WliAQk1+SJasc0DSljHP+rw8yUFKHa6wV/WGOsvvVYchHMs2+eJWo44IUnv32vp0EAiZPpCZF3Xusznumo3Gg4cgQBNzWLripxF+PX86yso77nRU8cHTju/VHc2F98HVQ7UKJvEPEJdjyv7NqiKaf2M3DZLI5yvrQ3dFSmd2EJHmmkYIC9RfTb+HloWjGglHoP8d9WKX3nUD8nw5YudFY51tsvbkev3eKlQlb1Is1dubu8ehkff3Aj39wbO4OsE/aFdoXEu0b5cpOo5goKIp60b9Kky6rH1YNh/GEje1A1qGfDR5XC2W4RqLWmI5hGXJkNW4RIaKZuIBW4ygsRTnZOetNHx9hclrUFAGKclLBVwEr4CuTe2Xw8FHNDUbbg8LjSUWcCdLRiknCjiPlV+SK6ZUe+NTNjrUiaPY5PZIEXdUAYHCSy2SpNUa3qgwZazACALv3cqYNII8etRZzV5ThK1RnzJKgc14OyzhhKMUxA03RLJ4BGHT8RRCLR34yaFv5E5EqjnekgawCW8/4UYfM3WcHwqh/DrN57TOw23X6NYtJIYVoc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d01c473-d7ac-4b48-472a-08ddb00afbf1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 14:58:58.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caONRjX3JJAY61RgDBHqwLVcP5lI7V0/pI9XbVB0f5u8OhPoWZPn7H2l6PwAOcHrHEdF9vg9Zj9rf0bGR2/U4TJKlD1TTzno2Ljh0TG2EqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB6002
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=970 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNiBTYWx0ZWRfX/JyjN8lFUpEq ay3h6imb6oezbOqTTwGSLrNRAP9YAveOW0hsTik52vHn3TcjL4ydDDj9qfVxtPK2kPEBvsN+HQ5 tBZ/ZfntqB6gAH7mhQGvEC503No6VmiLZKBR/A8bVLGLOC0HdbJe+M0SLP5natNg3Krqb54ZJub
 JBYl6na21SKc10vmqPulcykNrrTZG9pILTbmgPYlpS8seRCS9KcDwHwPR7UJmU4KH4GhTony2KX pj8rpJ/POVktMUYQw78oSnZ6lXvbURbjsi6/nZRw6fHh7HGsuwIpc36KLLAcRjPPQS/H5MTamnc MtXrVI+bkF9DK71GBYVO+GUvlUYZD7lseBf6AAIc2dOIj1BXdyXKhfj3d4LNtk+3fT1iVyUh4os
 1ASZtPYnJsOYf47BC/Q+HhTdBS3IYSb5mteP6M1OyrCfHD0t1Hv+Vzre991Fnxe9xEM0/F6i
X-Proofpoint-ORIG-GUID: kLzuuX2Iw6sMgsKi3DjO4UIbG8daTYwZ
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68557735 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=p3-lhFvLbEyJGo2-L_YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: kLzuuX2Iw6sMgsKi3DjO4UIbG8daTYwZ

On Fri, Jun 20, 2025 at 04:32:48PM +0200, Vlastimil Babka wrote:
> On 6/19/25 22:26, Lorenzo Stoakes wrote:
> > Doing so means we can get rid of all the weird struct vm_area_struct **prev
> > stuff, everything becomes consistent and in future if we want to make
> > change to behaviour there's a single place where all relevant state is
> > stored.
> >
> > This also allows us to update try_vma_read_lock() to be a little more
> > succinct and set up state for us, as well as cleaning up
> > madvise_update_vma().
> >
> > We also update the debug assertion prior to madvise_update_vma() to assert
> > that this is a write operation as correctly pointed out by Barry in the
> > relevant thread.
> >
> > We can't reasonably update the madvise functions that live outside of
> > mm/madvise.c so we leave those as-is.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

>
> The prev manipulation is indeed confusing, looking forward to the next patch...

Yeah this was the whole motivation for the series, ultimately...

>
> Nits:
>
> > ---
> >  mm/madvise.c | 283 ++++++++++++++++++++++++++-------------------------
> >  1 file changed, 146 insertions(+), 137 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 6faa38b92111..86fe04aa7c88 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -74,6 +74,8 @@ struct madvise_behavior {
> >  	 * traversing multiple VMAs, this is updated for each.
> >  	 */
> >  	struct madvise_behavior_range range;
> > +	/* The VMA and VMA preceding it (if applicable) currently targeted. */
> > +	struct vm_area_struct *prev, *vma;
>
> Would also do separate lines here.

Ack will do.

>
> > -static long madvise_dontneed_free(struct vm_area_struct *vma,
> > -				  struct vm_area_struct **prev,
> > -				  unsigned long start, unsigned long end,
> > -				  struct madvise_behavior *madv_behavior)
> > +static long madvise_dontneed_free(struct madvise_behavior *madv_behavior)
> >  {
> > +	struct mm_struct *mm = madv_behavior->mm;
> > +	struct madvise_behavior_range *range = &madv_behavior->range;
> >  	int behavior = madv_behavior->behavior;
> > -	struct mm_struct *mm = vma->vm_mm;
> >
> > -	*prev = vma;
> > -	if (!madvise_dontneed_free_valid_vma(vma, start, &end, behavior))
> > +	madv_behavior->prev = madv_behavior->vma;
> > +	if (!madvise_dontneed_free_valid_vma(madv_behavior))
> >  		return -EINVAL;
> >
> > -	if (start == end)
> > +	if (range->start == range->end)
> >  		return 0;
> >
> > -	if (!userfaultfd_remove(vma, start, end)) {
> > -		*prev = NULL; /* mmap_lock has been dropped, prev is stale */
> > +	if (!userfaultfd_remove(madv_behavior->vma, range->start, range->end)) {
> > +		struct vm_area_struct *vma;
> > +
> > +		madv_behavior->prev = NULL; /* mmap_lock has been dropped, prev is stale */
> >
> >  		mmap_read_lock(mm);
> > -		vma = vma_lookup(mm, start);
> > +		madv_behavior->vma = vma = vma_lookup(mm, range->start);
>
> This replaces vma in madv_behavior...

Yeah note that the lock is dropped here also :) so the previous VMA is
completely invalidated, so this is valid.

>
> > @@ -1617,23 +1625,19 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
> >  	struct mm_struct *mm = madv_behavior->mm;
> >  	struct madvise_behavior_range *range = &madv_behavior->range;
> >  	unsigned long end = range->end;
> > -	struct vm_area_struct *vma;
> > -	struct vm_area_struct *prev;
> >  	int unmapped_error = 0;
> >  	int error;
> > +	struct vm_area_struct *vma;
> >
> >  	/*
> >  	 * If VMA read lock is supported, apply madvise to a single VMA
> >  	 * tentatively, avoiding walking VMAs.
> >  	 */
> > -	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
> > -		vma = try_vma_read_lock(madv_behavior);
> > -		if (vma) {
> > -			prev = vma;
> > -			error = madvise_vma_behavior(vma, &prev, madv_behavior);
> > -			vma_end_read(vma);
> > -			return error;
> > -		}
> > +	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK &&
> > +	    try_vma_read_lock(madv_behavior)) {
> > +		error = madvise_vma_behavior(madv_behavior);
> > +		vma_end_read(madv_behavior->vma);
> > +		return error;
>
> And here we could potentially do vma_end_read() on the replaced vma. And
> it's exactly cases using madvise_dontneed_free() that use
> MADVISE_VMA_READ_LOCK mode. But it's not an issue as try_vma_read_lock()
> will fail with uffd and that vma replacement scenario is tied to
> userfaultfd_remove(). It's just quite tricky, hm...

Yeah this kind of thing is explicitly why Barry excluded uffd replace from the
per-VMA lock I think.

So we absolutely can't use the per-VMA lock in conjunction with
uffd_remove(). I'll add a debug assert in madvise_dontneed_free() to make this
clearer.

Will add in madvise_remove() too as that does the same thing there, just to make
sure we have assert coverage.

>
> >  	}
> >
> >  	/*
> > @@ -1641,11 +1645,13 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
> >  	 * ranges, just ignore them, but return -ENOMEM at the end.
> >  	 * - different from the way of handling in mlock etc.
> >  	 */
> > -	vma = find_vma_prev(mm, range->start, &prev);
> > +	vma = find_vma_prev(mm, range->start, &madv_behavior->prev);
> >  	if (vma && range->start > vma->vm_start)
> > -		prev = vma;
> > +		madv_behavior->prev = vma;
> >
> >  	for (;;) {
> > +		struct vm_area_struct *prev;
> > +
> >  		/* Still start < end. */
> >  		if (!vma)
> >  			return -ENOMEM;
> > @@ -1662,13 +1668,16 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
> >  		range->end = min(vma->vm_end, end);
> >
> >  		/* Here vma->vm_start <= range->start < range->end <= (end|vma->vm_end). */
> > -		error = madvise_vma_behavior(vma, &prev, madv_behavior);
> > +		madv_behavior->vma = vma;
> > +		error = madvise_vma_behavior(madv_behavior);
> >  		if (error)
> >  			return error;
> > +		prev = madv_behavior->prev;
> > +
> >  		range->start = range->end;
> >  		if (prev && range->start < prev->vm_end)
> >  			range->start = prev->vm_end;
> > -		if (range->start >= range->end)
> > +		if (range->start >= end)
> >  			break;
> >  		if (prev)
> >  			vma = find_vma(mm, prev->vm_end);
>
