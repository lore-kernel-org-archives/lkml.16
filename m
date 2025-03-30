Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3738C8F5B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743353236; cv=fail; b=EvP5adpS9qL9w8RnHN4+IE9qHE3v4mMoqZIlCdPmVRJYSF+z9EX3bSuvnyfgSkf5UkZi02GXFUgIa1+3R5tIsC1FFPEf/TxEYkJrXHCgSIipb4/dPH97/CodGS6tg7D9zRYgEsaC3KLOHhpzHS5vem9Mi/6MynEf4aKPbYl/9aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743353236; c=relaxed/simple;
	bh=l+7s4rjjdJt9xTyXnQ36HTN7Yhpn39RCO1qaOFgxZC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D7I76xt+2UyW/YQZuObbFx2rgasinvpYl7Drh2aoYhp/ZBlaWmAsDLC05D1/BTW8tPwPbcfV9VxEm3b4BbPQYNBueZA6WJrEPHECTa9X2JxYTG5gp8l6UEHNLXo87QoY+qChh4cE3GdDG3KzO7xoe2nhdloF8RInWt8/53mgpTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hO+JZUaZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w+Gv0dS/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hO+JZUaZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w+Gv0dS/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UGgE8D018146;
	Sun, 30 Mar 2025 16:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Vif2GXYyEZyPVi2wDu
	Z6a2wA2TMxB7AAmxhYngaIF/E=; b=hO+JZUaZIxvuQBdoCn6asFNREVYPSzBqPX
	WovJTZM3OEMX/c3zCh06ZKMARnCJdoDsxNy1Bqt/cwSkFyjfeit8Whm0h6/GRESU
	5rai3ZRqYCRVdfnq0mE9Dt95fYVoxf0unh1F25eqbi1VU4YduwDknPXCJL6t+6rv
	+/Aa5qy+M1dkRyc3GfVl4r1OP84wuoW0v/UZr9hJC4aqfwK9PAEv9dGQCbY4SdRF
	le2Flf+s0GkI44SEVTGX0XHTcDbTKDJnpQ1uLq5ZnwWKdxLBUAmm2kvUt9o9//Gt
	ZfnSfQQs6u+6vM2/5TeVw5jwED2wZJyj8dOCLWrFQA+YeuKisaEQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p9dt9y7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Mar 2025 16:46:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52UFlL9w010838;
	Sun, 30 Mar 2025 16:46:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7ad5yp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Mar 2025 16:46:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5oQNCjuWCo5aqI3RWjbWBzkCggMvxugyHxpaIbEcKIrJxT66xFwcODaVsWDtAOk4Dr39fQ9gnb4SfbegsQL8bkfu0DU+HNEbbN2Qv23j3/IGeb8Oc4ak4uL4JnCsrmHuVU5QgPOwMQPKU6QOJ93P+JxScqVFqy26XcapKAQZo4Ycc66YEjDs/qhVBxuEyXt/EZUaNRtaNswMwwF/PLErNSEoLhHSr33lHpteyrwccfBVg7vefhp3pUoLIb86nuoXXY02e3NQttpQRhtduFKSNuXrTQ1rbIRO7WGg9bllcz0gUHrSN9Mm3NWORRDmM0yI1dhgupIkq568DTzlDNi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vif2GXYyEZyPVi2wDuZ6a2wA2TMxB7AAmxhYngaIF/E=;
 b=qtK5dGTSZ/c+BxMebv7UmLyZmQpOHHb9VdM6kXvZur4m7IUMAThaxMRJd/u+O7memPxYa5VEoAeTBxalaw1u8Axgl0Nx2sOxWIyQmDmTfZxwbfkBW2xhKcEWFc8vXZwkIuaH+JS38QLtw6Yn+7eZQY2k4aHUV1mvV7ehkEz3DkOkDJJLGkK1NiVWiZ6K2NmJ48nngwFj1SBF15vMuR0QlQXpI/v9bnkjpwMx9cgIQd3EeW52y/nRIAOXC0mcERFpTMuCeBhORYyPogRnakfKw00K1IA5AP0fpGZNMWf7bG8rYAyBAwALdhCzvRSMunlQqfP+0T4mYF7woYfbpwf7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vif2GXYyEZyPVi2wDuZ6a2wA2TMxB7AAmxhYngaIF/E=;
 b=w+Gv0dS/bq9XXG+QUvrYIAJv0qRYt97GzLlwNHhzi3vhvXH25pe4SWpEOMfVPKKdMPo0/hNEh2yKNLCJ21bmHDSfN/Amls7fcIzXc6CP8TqH0TpDRPBzHWIRpYRk5Zc923T0N01PbgOnZSEZq5xGEi8osjjVSqxt91T7gv8CTPQ=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by BN0PR10MB4904.namprd10.prod.outlook.com (2603:10b6:408:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Sun, 30 Mar
 2025 16:46:44 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8583.028; Sun, 30 Mar 2025
 16:46:44 +0000
Date: Sun, 30 Mar 2025 17:46:38 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Lai, Yi" <yi1.lai@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Harry Yoo <harry.yoo@oracle.com>, Yosry Ahmed <yosry.ahmed@linux.dev>,
        Oliver Sang <oliver.sang@intel.com>, yi1.lai@intel.com
Subject: Re: [PATCH v3 4/7] mm/mremap: initial refactor of move_vma()
Message-ID: <a2eef86e-3d38-4df0-a889-81ec9beda391@lucifer.local>
References: <cover.1741639347.git.lorenzo.stoakes@oracle.com>
 <ab611d6efae11bddab2db2b8bb3925b1d1954c7d.1741639347.git.lorenzo.stoakes@oracle.com>
 <Z+lcvEIHMLiKVR1i@ly-workstation>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+lcvEIHMLiKVR1i@ly-workstation>
X-ClientProxiedBy: LO6P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::14) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|BN0PR10MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: da62ccb8-0f51-4435-3e25-08dd6faa7420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QGGYza9CE2rXC0ucVQU+aetM11JvGhz78vyjjdg5wto9a+8baQtRujUiitJL?=
 =?us-ascii?Q?xM4LpvM/amBaBm+g1jmdBecC0jxq5goV1PcWWXrdl4OEi01qcqgqbzQzdTr3?=
 =?us-ascii?Q?5VH267EOLcoIQRYxAa0Y66K7yFXIbEOBXoHq4R6S2tT8M4+4s+HZhXyvGSUQ?=
 =?us-ascii?Q?EJ4vffqFQ43a9m6kDFQnp5JOB9CwPlxvsKPHyCS3kCwkF3/2uye2GqtUvWWr?=
 =?us-ascii?Q?r431N7L/8WzlHZQzRBI8rjtAYguU2e7QJ4NUF0SIDr2JZ93a/yLTqaW0rB1k?=
 =?us-ascii?Q?1c1O7UKOyuSvyi82Pek7HTIgPmhP+LeB3ugs5zsvSHJIPYSeXrQg3IPgxWaP?=
 =?us-ascii?Q?tBuPm0FCt5M2QsvPfHn7aIxMNevVx6YEO3HR4ALTeOX1XdIT8PRxeUJ4r4cL?=
 =?us-ascii?Q?qOI1KpUZpOSiNFJmUiRojgzxHRTTgChkAA4BFOXXfDgGIBxVovp66f8I+Eku?=
 =?us-ascii?Q?P5gUVcvPeBxGNbO7EEf5u+VtPqk+t5Q0x4CcFS6+dKHgx1/dKdR9ntYPn/t5?=
 =?us-ascii?Q?nzb2wfie40IHSW2obcfA3Fp7XNzuYyXYe0WNoLAemxOyZAcPnDtYYUd8fsU5?=
 =?us-ascii?Q?ZxVgFjhNZ6FuA/C+pzl8h/tNiYOqJ3qxouzReO1126Ys7g0qNQQ+9zHHXJ9t?=
 =?us-ascii?Q?mcFivaQwiGJeBGM0LA06hRKKxt0f9Td4gp5e+ZRSl+woPipbjyGeMsiG3r4S?=
 =?us-ascii?Q?TZ9KFpfAcQLAPNKayi2AmaqLFl3RefFQIV/QJxIyBw0HSc9pjZwLOkqGgIxe?=
 =?us-ascii?Q?5Tb4Q/PqEtcDdiHfFuH7K/bXZ/lHxxFqbUNIYPA7wBJ8dKvUNzp+ofCZYwmG?=
 =?us-ascii?Q?72oVhHUQn4HUne9RtPbnqhdoq/7pk+lfbRdtadfAqQ/ocmjCZzNE0v01u659?=
 =?us-ascii?Q?vEl7EhYoMiRQpZx6Wo1fn+SUcd3W7I+BQH+jKM0uEU6xpVYlyOLxAjQych8B?=
 =?us-ascii?Q?A30WkNlLhPOinzc3a0CxDEgLhocnJRpoRylDUgPxuxKHwwMMZxEsRyjB7cxf?=
 =?us-ascii?Q?pED9AIza58EBoQj3+xt+4A9Rin5761DDNjfHjOSIuFB4eikJHDPqM4hPa8Ot?=
 =?us-ascii?Q?Vtxnjml2T7lAeFiAnsMVWiTsUy+5Qe+wPX1ltjllZ7xefGMBURH5N+vPUXLU?=
 =?us-ascii?Q?S3JjFPHE3W31F0YI5Z3JXyJNxH3SZ6KbamuX9W3g9ATQmYcqNk9M8pAaLM2T?=
 =?us-ascii?Q?IHJ7IjJ0Bc01554dStM//YGxpexQHwvQ8KKc1B+Ul5CMlg5/BnmYFb3Zuw4K?=
 =?us-ascii?Q?tIZX6QwWj/pa6Hc6W6J2Ho89L7fGq6XR4cRHFcXHX3bha5/krigNHwjBddD3?=
 =?us-ascii?Q?TrSSTig8LZ+QpV3QR+QdT4F5AB1MYFrMz0xxm2tFPm8Ldw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NNh7MbpK9kfowuEcorhXNZxpN4iW/Yciuly1z/NKEIyoYJaQxHk0j3Hfb36j?=
 =?us-ascii?Q?qunFL+62L8ADxvwAli6NE5lYRstub8Sypzx/i2eKWS8qLwESRmBXwK+n/Y7I?=
 =?us-ascii?Q?g207gcFE7O/9Qr+XqXgL8JpPie8KBoKR+Hbdw1TwkUDoon704zg3e21oJeBJ?=
 =?us-ascii?Q?KtxO/x0G1fEFTzr6RCrCJV3RzkFvoQ3bhLaz6mQAd2eC2zfXkUdRf6qGc0pS?=
 =?us-ascii?Q?MywsbA8+8DE+05MZADfdxFoIK4IYegd71FP/lkKEBSjljIX39r4rXOjJRCVa?=
 =?us-ascii?Q?YJyq4S6MEZnqgWSJoE0ldaa0T5R1GVmqIbb6VlvymEZ7UHekC4uZqrTinYnN?=
 =?us-ascii?Q?2ZgyQF1w4KnKSsLPIahutgj35DEMTX/kPEQ1w12uYmZl8U5t8CCGZB9zwZPc?=
 =?us-ascii?Q?8tOyMnU4bxKcUTfDnHUMcWz4xaReihQpTr4V6V8qbg3rSt+YTgzQyN53IBIQ?=
 =?us-ascii?Q?oBTfsK9taCEuVTWtsUTf5Zwqf6CqNvBFMG5bV6v0aRiO/mqiU1y9qjBKsW/O?=
 =?us-ascii?Q?LO4LZDjXL0Zs/oGCQtS3iaO2XK7Nu3hBWHjd6yISbccVgdO44Q7V/uxwoP0l?=
 =?us-ascii?Q?MQW1HBbr28AUHwv0lodPUXRsrMYnBPF6tP8NTfmSCfX5qbvnDAI18Vg/Gkb1?=
 =?us-ascii?Q?H51owPq1/oZFCWCty8Ui4xbVoLwiP8TAv8oOSCPUokd/WtaLQgV4rjyReGon?=
 =?us-ascii?Q?tYmCW23DUFvrR8qduIKR+80qaCgTYb3fA6VO/Vu0FFjOwKsQ7unGeo1JPnwC?=
 =?us-ascii?Q?C+KFEcmoQD2NK6BOOrQXbtRVEPAX9HSy9V7OJvRF1N2AI6ggQ6s2EwZB81+I?=
 =?us-ascii?Q?yZPQq1RRb7Cg3CCOsm/czrAFZYyz5SCgVlySQk8mf9X4Ytqv8+qP0OVbqSq6?=
 =?us-ascii?Q?NS3j6g165UzxLQfomEV/FjpoGaf1FaIX96vI+imGNpvdQ+nxOexQGpED/FfX?=
 =?us-ascii?Q?YT0+w+Z8Mytt8UeaoPtpn3OwtrOxqlc8uahpmctGY2z700RCO2CfrIRwwLkD?=
 =?us-ascii?Q?feGPn20tngNmiDj+18u+KR/Ivs/u7Az2miosnsLlnd2ElhfBeZtTclURuKhB?=
 =?us-ascii?Q?d3C4gn0EmwdqnGCcCfZgHxJDnM0LMgDZVBBHK08D8zpUCfR5QnfGfchkL+PO?=
 =?us-ascii?Q?KYU02Ik0hkoCRncp9Qv1oJaRvCmP/9La6vJOG0cVwhNNRyasjYfN6dsEq5zc?=
 =?us-ascii?Q?XS/Um+ulWq+qFy/t2EYWXfEnsSaI1FokyipvV7oFI7feDL0R38Xg3DAdLBBL?=
 =?us-ascii?Q?HvMkxfOSKGqdrPD2n4m9RAOYB6I8SUnnQ3wVm1hLS4ahlUsIytRNYXhkHOFQ?=
 =?us-ascii?Q?9hsg3bePn/NfIfyIrvpB116bFx9WxJg5m+1tf9ItKFAm9j4gmHqzy8DHKU+B?=
 =?us-ascii?Q?ZnAn7SSc+61gDtau0SrZrwEgF3yZWfBimrPenmG9DJkz7dIUpxhkwv0YS5DA?=
 =?us-ascii?Q?FmUlbu3EsiErBz3EjAgkT4TfjglBYthZzG3Vj3g1moJOvYkDHF67rz0ZJE+M?=
 =?us-ascii?Q?nzMKV311HVt2MmiKRrfzoQfJ7jlK8yln3U6Hu7cnuVlAEpnn6f8EOwO6jayk?=
 =?us-ascii?Q?kfIBrIQQGRvgqbOj+qedmpUh59TcdAahHPMBIPFs3ZCaPek2e//kPmBhXcZP?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pP+1u3dwM0QJM8bgzA/KrIRinI1j0h3Y15edEDjEx29c81XmwMVOrl4eW0OXssgAFbi+ijZ4MKSzzQlqqe1C6RWZTj+bfpAYSUoKmICTr7oqP9jAoKYCFYH4AyVy4Ti/svWKX9+a7HESn0fpJJrp8bFMtCnAI7k+5feK2ZLqMQRCDb/vRdCb/+F7NAxnnYDu0YassWDBxUWMC5gB/R0jGb037X4m/9c0t5jIDjSz2PxcuUpYtSZi6MyPHjU1W7x1LYAzQOA71fGngW0wfnsJtE8aa3NXXWDyKR2fpojr7elgkj0rhvCmUO1K4AHqYSxw8jVbnyy7tuYpQVKrSzag5mgJLf+DVKDVGTDjR/GZo1T4DQmcH4T1fEYksCrzcITmSFwp1v9zqwvUJLPFev4Dzk03chqYt+HipeABevUF1y+sE29IcVhEHEBUiP5sBFanQ9DWKyNMtS5WE5Nco8TwIJM7yQhrCMeE1mMMDGkk0TiePWGOVw9E7Y3biacaT2KtMV8BBTDaaC0FgTy3V0rfWiRYeqIbivDxK7U14NQZOat5befhRg1lIjViz1311rMvzWHJUskfTj6OZOsBDie4A9r5pZb9ADi4d+XJkQPr4Cg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da62ccb8-0f51-4435-3e25-08dd6faa7420
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 16:46:44.1946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxlVDL5SwhQoUW/+suKpBwGmgyqcmHvE+II3tsRaeRzOMXNYsvRu+KARTSlRhTKMF9CG71Jq2Xw7O/813srTyI1JkrX/WE8c5EK8ish34aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4904
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503300116
X-Proofpoint-ORIG-GUID: bEKi4okMn2kAApdUbvtpvup92bUyYYrP
X-Proofpoint-GUID: bEKi4okMn2kAApdUbvtpvup92bUyYYrP

On Sun, Mar 30, 2025 at 11:01:16PM +0800, Lai, Yi wrote:
> On Mon, Mar 10, 2025 at 08:50:37PM +0000, Lorenzo Stoakes wrote:
> > Update move_vma() to use the threaded VRM object, de-duplicate code and
> > separate into smaller functions to aid readability and debug-ability.

[snip]
>
>
> Hi Lorenzo Stoakes,
>
> Greetings!
>
> I used Syzkaller and found that there is general protection fault in mremap in linux-next tag - next-20250325.
>
> After bisection and the first bad commit is:
> "
> d5c8aec0542e mm/mremap: initial refactor of move_vma()
> "
>
> The deadlock can still be reproduced. You could try following reproduction binary.

Thanks. Yes the repro is consistent, and I've identified the problem.

To make life easier as this is noisy, I'll send a fixpatch in reply to this
separately.

>
> All detailed into can be found at:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap
> Syzkaller repro code:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/repro.c
> Syzkaller repro syscall steps:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/repro.prog
> Syzkaller report:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/repro.report
> Kconfig(make olddefconfig):
> https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/kconfig_origin
> Bisect info:
> https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/bisect_info.log
> bzImage:
> https://github.com/laifryiee/syzkaller_logs/raw/refs/heads/main/250329_061207_mremap/bzImage_eb4bc4b07f66f01618d9cb1aa4eaef59b1188415
> Issue dmesg:
> https://github.com/laifryiee/syzkaller_logs/blob/main/250329_061207_mremap/eb4bc4b07f66f01618d9cb1aa4eaef59b1188415_dmesg.log
>
> "
> [   43.795673] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASI
> [   43.797814] KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> [   43.799835] CPU: 1 UID: 0 PID: 665 Comm: repro Not tainted 6.14.0-next-20250325-eb4bc4b07f66 #1 PREEMPT(voluntary)
> [   43.800338] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org4
> [   43.800911] RIP: 0010:__do_sys_mremap+0x13a9/0x15d0

This is in vrm_uncharge():

At:

	if (!(vrm->vma->vm_flags & VM_ACCOUNT))
		return;

Here, vrm->vma is NULL.

This is being called by expand_vma_in_place():

	vma = vrm->vma = vma_merge_extend(&vmi, vma, vrm->delta);
	if (!vma) {
		vrm_uncharge(vrm); <--- here
		return -ENOMEM;
	}

Now the astute reader might notice a rather silly mistake here... we are
assigning both vma and vrm->vma to the result of vma_merge_extend(), then
seeing if vma is NULL, then trying to access vrm->vma...

So fix is to correct that and reassign vrm->vma only afterwards (a failed
merge will not result in vrm->vma being invalidated).

Cheers, Lorenzo

> [   43.801188] Code: e8 ac 57 a8 ff 48 8b 85 30 fe ff ff 48 89 83 70 ff ff ff 49 89 c5 e9 2b f2 ff ff e8 91 57 a8 ff 485
> [   43.802152] RSP: 0018:ffff88801aa67ce8 EFLAGS: 00010293
> [   43.802432] RAX: dffffc0000000004 RBX: ffff88801aa67eb0 RCX: ffffffff81e42e5a
> [   43.802791] RDX: ffff888011e6ca80 RSI: ffffffff81df64cf RDI: 0000000000000007
> [   43.803172] RBP: ffff88801aa67ed8 R08: 0000000000000000 R09: ffffed10023cd950
> [   43.803558] R10: 0000000010000000 R11: ffff888011e6d8d8 R12: ffff888020fe5000
> [   43.803943] R13: ffff88801f8f2780 R14: ffff888020fe5170 R15: 0000000000000000
> [   43.804324] FS:  00007f8f5ae81600(0000) GS:ffff8880e3684000(0000) knlGS:0000000000000000
> [   43.804749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   43.805069] CR2: 00007f8f5ac57910 CR3: 0000000021690001 CR4: 0000000000770ef0
> [   43.805442] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   43.805796] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [   43.806173] PKRU: 55555554
> [   43.806345] Call Trace:
> [   43.806558]  <TASK>
> [   43.806700]  ? show_regs+0x6d/0x80
> [   43.807345]  ? die_addr+0x45/0xb0
> [   43.807768]  ? exc_general_protection+0x1ad/0x340
> [   43.808360]  ? asm_exc_general_protection+0x2b/0x30
> [   43.808939]  ? vma_merge_new_range+0x16a/0x930
> [   43.809499]  ? __do_sys_mremap+0x139f/0x15d0
> [   43.810012]  ? __do_sys_mremap+0x13a9/0x15d0
> [   43.810528]  ? __do_sys_mremap+0x139f/0x15d0
> [   43.811043]  ? __pfx___do_sys_mremap+0x10/0x10
> [   43.811587]  ? __this_cpu_preempt_check+0x21/0x30
> [   43.812177]  __x64_sys_mremap+0xc7/0x150
> [   43.812652]  ? syscall_trace_enter+0x14d/0x280
> [   43.813201]  x64_sys_call+0x1933/0x2150
> [   43.813658]  do_syscall_64+0x6d/0x150
> [   43.814101]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   43.814686] RIP: 0033:0x7f8f5ac3ee5d
> [   43.815125] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d8
> [   43.817168] RSP: 002b:00007fff14f19058 EFLAGS: 00000217 ORIG_RAX: 0000000000000019
> [   43.818037] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f8f5ac3ee5d
> [   43.818430] RDX: 0000000000004000 RSI: 0000000000002000 RDI: 0000000020ffd000
> [   43.818793] RBP: 00007fff14f19070 R08: 0000000020ffc000 R09: 0000000000000800
> [   43.819160] R10: 0000000000000000 R11: 0000000000000217 R12: 00007fff14f19188
> [   43.819540] R13: 0000000000401126 R14: 0000000000403e08 R15: 00007f8f5aeca000
> [   43.819945]  </TASK>
> [   43.820066] Modules linked in:
> [   43.820308] ---[ end trace 0000000000000000 ]---
> [   43.820587] RIP: 0010:__do_sys_mremap+0x13a9/0x15d0
> [   43.820874] Code: e8 ac 57 a8 ff 48 8b 85 30 fe ff ff 48 89 83 70 ff ff ff 49 89 c5 e9 2b f2 ff ff e8 91 57 a8 ff 485
> [   43.821855] RSP: 0018:ffff88801aa67ce8 EFLAGS: 00010293
> [   43.822150] RAX: dffffc0000000004 RBX: ffff88801aa67eb0 RCX: ffffffff81e42e5a
> [   43.822543] RDX: ffff888011e6ca80 RSI: ffffffff81df64cf RDI: 0000000000000007
> [   43.822928] RBP: ffff88801aa67ed8 R08: 0000000000000000 R09: ffffed10023cd950
> [   43.823347] R10: 0000000010000000 R11: ffff888011e6d8d8 R12: ffff888020fe5000
> [   43.823757] R13: ffff88801f8f2780 R14: ffff888020fe5170 R15: 0000000000000000
> [   43.824156] FS:  00007f8f5ae81600(0000) GS:ffff8880e3684000(0000) knlGS:0000000000000000
> [   43.824627] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   43.824959] CR2: 00007f8f5ac57910 CR3: 0000000021690001 CR4: 0000000000770ef0
> [   43.825350] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   43.825757] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [   43.826154] PKRU: 55555554
> "
>
> Hope this cound be insightful to you.
>
> Regards,
> Yi Lai
>
> ---
>
> If you don't need the following environment to reproduce the problem or if you
> already have one reproduced environment, please ignore the following information.
>
> How to reproduce:
> git clone https://gitlab.com/xupengfe/repro_vm_env.git
> cd repro_vm_env
> tar -xvf repro_vm_env.tar.gz
> cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
>   // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
>   // You could change the bzImage_xxx as you want
>   // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
> You could use below command to log in, there is no password for root.
> ssh -p 10023 root@localhost
>
> After login vm(virtual machine) successfully, you could transfer reproduced
> binary to the vm by below way, and reproduce the problem in vm:
> gcc -pthread -o repro repro.c
> scp -P 10023 repro root@localhost:/root/
>
> Get the bzImage for target kernel:
> Please use target kconfig and copy it to kernel_src/.config
> make olddefconfig
> make -jx bzImage           //x should equal or less than cpu num your pc has
>
> Fill the bzImage file into above start3.sh to load the target kernel in vm.
>
>
> Tips:
> If you already have qemu-system-x86_64, please ignore below info.
> If you want to install qemu v7.1.0 version:
> git clone https://github.com/qemu/qemu.git
> cd qemu
> git checkout -f v7.1.0
> mkdir build
> cd build
> yum install -y ninja-build.x86_64
> yum -y install libslirp-devel.x86_64
> ../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
> make
> make install
>
>
