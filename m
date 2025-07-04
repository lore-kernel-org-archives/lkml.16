Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0AF1552E0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638457; cv=fail; b=Tmp+5LsxHDX/zUuru2Tom95RftYA5VcG2sxeae8FvdiAVDPp4GLMSFmta7t1mBWYzsVgKX9IFd13N3h89fzUnNnbM+cJ/Zd9Jc5UqS2E/A0BC8yC2ZJwJrjbxlKkvdBXGS0pK08HLJIsTwQno8UIL8U4xB83fmcE6e8KB918Opg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638457; c=relaxed/simple;
	bh=8o15/3A5pkbp0BCt4LrGMA4/ltTbnHKGhYGxycwV258=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MkRN2+Z84p6/j4SBZ8e04l30p1SQmHC7aLEZEhh088RpViKiWgsQRjBxD6ZOisX2wt4fX6Y4xvypi64T10+ah8jvebexYLWIfkIlzLTw6BUcdeuDV8LR5GYSQAtkeUnGbqFJEed9HMaoOQdPoA+eb3pUhPLLSucPEX2bRvmS8Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rJFO0n8Z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PlJ2ETR5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rJFO0n8Z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PlJ2ETR5"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5649Ysck000354;
	Fri, 4 Jul 2025 14:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=61BD5LSAL3ePTcp2nT
	nOYpbzqeA7fXDqaycmyY99YSY=; b=rJFO0n8Zn1mkhf6yXqI3ua+3hTMetWIawi
	dkC9occVCzlgfhXQWXio3IMvo9ZD2WzXpA95sYXVggBMJA/TNLxnzWiKHCVGmqH1
	64oPlMnoMELf1sZuO7igQy2lDpmukJu76CpqaYhB0+1WtUeM3Y958ahQThFSXlki
	xw6At6sArIa2O8B+w/afhrVTFY6RHuAoI2+js4/stoXghRqhfPSkfTe0AlRA137y
	K3AhJnQzk7NfVaDDaiedoytFxJgT5Tu5cnHvXIzj5vHjDUhXBezN6L+ylWzdMxsr
	r6k105LYTSqZxGFHJcAFYsr8vTB1FVwGUJsz7DD/oW0bRNK943eA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80watq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Jul 2025 14:13:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 564C5CSt032461;
	Fri, 4 Jul 2025 14:13:57 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6un5c3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Jul 2025 14:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drRhdlrGG2s60zyhJh6Ke8stkIlNYSNEl2hDn4OWzwkBYItqkIQeKYpfCxmMQIxgHxpLNQ7L1ii1u4GhmSXI+KlS3kfQ4/GEMo/eSddBn9705/TaLLUPPQMoMRgRv3aDTcd/KNJoeM4tdVT/gwFpBmKyH5nobOg7R3ACpA4++zguUWcOnBi5Sp+9Ax+RiZckxPZOC0HtaJ+I5saP/Aoz66NZgMMNv8I8dW/urbZsHy4NDqjGbADohPc2KA9t9OHu7/5taeCIhcx9beGwn6XQcmkB8Y0pRBTXxXIwikCWWVlWGTEmddw7X7BJi2D2C2m67Ifyw/J2HXxo40pVzN6cOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61BD5LSAL3ePTcp2nTnOYpbzqeA7fXDqaycmyY99YSY=;
 b=K+U7as0IYNrUD1Lz/yzqTJ1Y2hUDNyjrRbj4hJ/8bzxPbNUuq9e0wdozNj72dIoQADLYI3R6ezTMn2+JlvC9rbg3VPy1+xXGRGjEQ2NJfrW2KT9pXm2xtYWkzBYnre8U79uK17O0Rz6C5gNInhBGzjgelG4Td2MSiQd8uyQ8vVR5EoD/KJaDW79RwOVivMmzDLBhrVcjOn5cd1gR5yedYGP5Wv1MNjeV8CuJxnIlBvabfw4LanQ9cWoMJEif+aDqvxqTNILxn1Wjmn7Y1KdDdTSbnaseqwnatAmdoZYy0jzy5iifDcPDbrh6bMsGYn0PpJd/7QZuoNl1SJcNjyI59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61BD5LSAL3ePTcp2nTnOYpbzqeA7fXDqaycmyY99YSY=;
 b=PlJ2ETR51Ar2I2VmbYr0+sYbGu+/yaYhbSwQIZHaiOl80RCD1G/8cFeCrvgU13b0x+hbjrr89yTjLY5mPRED4f2hC9KQGXzkibBTfreihTePIxbuBt7LqLPRCwdgoevku9gjeDYC7o5H96KMoT21Spa0q7JPeIW9DdWtzKXc4Gk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by IA3PR10MB8163.namprd10.prod.outlook.com (2603:10b6:208:515::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 14:13:41 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Fri, 4 Jul 2025
 14:13:41 +0000
Date: Fri, 4 Jul 2025 10:13:10 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, richard.weiyang@gmail.com,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] maple tree: Add some comments
Message-ID: <d2vb7vy3y2dcarwe5ugf54axq6joslxjfhiu5vlasslhfehkaz@erzfum3spu7l>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, richard.weiyang@gmail.com, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250703063338.51509-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703063338.51509-1-dev.jain@arm.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT3PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::6) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|IA3PR10MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a57006-8c7d-429a-938b-08ddbb04fa2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LrpAV676jFDpDr4ZLO3h3vNJqTCEAddnk+tSTbpVet4RMWDv/8F3O4XNm1Fd?=
 =?us-ascii?Q?2kGInadj4dcA7JYqg2twCHc3YxRtA8x49iQwiT6S5zupekysH4tYjfWG0MOl?=
 =?us-ascii?Q?yT/ImheaxSuRRRImTxpdNa7G2gsQC2pZPmeyPjYHQlnlnQlPTauETpni5evW?=
 =?us-ascii?Q?OF8/LmNG70qwbvu+SVfaSktgePRpvAYEd5AxXnrU6kPEErEHPE6i87ZFLXFC?=
 =?us-ascii?Q?nsegXjNpiCWshOqWv4MIBkrPvtW1Ua/LzPlItJDJ036Dv/TYxul2ozpfohXq?=
 =?us-ascii?Q?A5kR+xf792TvukY74MRE2In+9VF167uwnykxGXhIrCzyEmO0bVQWR1gFmGSY?=
 =?us-ascii?Q?F/NLiv50hAIVwuP1qhcXqn53ssZ8YWey1CaXldvrm8YimajgFlYmzL0+Uso5?=
 =?us-ascii?Q?Fq+Oc7bUS5HJar6BH4zIjmrCtHQJt5dykvwoJ2WHpqHmvz9iQnlkPBB+Nnz7?=
 =?us-ascii?Q?zPzlsjwFLTRSAkZuJSAvduRsRex5++f8+3WZIzkvsFnEmyYOs8kPVx3nhNJW?=
 =?us-ascii?Q?h344LEJF7Nlng30a2jSonKiWVchIZk5kMlaebQKx+ZJx+uddORuqxTA2An7+?=
 =?us-ascii?Q?uG9IImvExqDg5G151kNWB9nK5eUFbjbjtxqDEt4KR/l9ztKJFpGt7q2hAp82?=
 =?us-ascii?Q?8xGym6w90FUbtFS5wLcl8VvDxxKmQXOphIxGZDXr+Y7EICr1kRhKGAz4FkfU?=
 =?us-ascii?Q?joeQEz64JcftFgSgvTOUfBpzAcIIRi8er6SkYx8Qp3KANBCfKA6izNmPF0Bf?=
 =?us-ascii?Q?bVWOL4Dr3UsNBqH2Y5wiX/ahGilRK9AoVoDXy1FFTFGKsidIhlpDAYPJqzgv?=
 =?us-ascii?Q?YpfBfU49AcioSlRmuFb/NCe89lup0MnhpWfK5xDaaxWWILc9P3Jq/FDt4tln?=
 =?us-ascii?Q?VSUy4FbcmZWTr+fmxfHgv4RH5tqPeKLqQZ2PTLHoMbkk5Hj2c+/e1pzNCC15?=
 =?us-ascii?Q?DFeD9CHq/zt7ZhEZIXSi/BQDEggMMNlPjle0w7F12nvFDKgZgdBeeLgydp0t?=
 =?us-ascii?Q?pf+FBMOX+ue3k10vw1SN9ua2xXQuc9p1pfDf/y+vCVxyibLCKBCRHpClDs2c?=
 =?us-ascii?Q?GzBNmMSEM+xnsg7IFxizAj11sszoFvXL69Xm5N4vHkxGkExa7jZsHWdP9DLs?=
 =?us-ascii?Q?/O98HktEHPbUDArOq82EDGpHuo/kLl/cJ9HCAWoEeYcOYE4ZUeU6ISBtPsxB?=
 =?us-ascii?Q?fDhUF8vGOqW+Sieohfx/IgWM4eBk3+szuFBAYsoQzPOMxZdggXvlo67x+7lb?=
 =?us-ascii?Q?rv6PA86sNpP1o6eF24aTDjNSpPpPxXPKTcAOl7aoH8/t59XIVzdvgI+6lvrm?=
 =?us-ascii?Q?DHeBlJVGf9+0oNNOo9DwWUGptM9wkj3oCfeGBspPI5lLIyZCa2gz4VvbOMOV?=
 =?us-ascii?Q?m7qvG2GHTKyKeiEpstk2h5G0Krxa7D9wgmNA7ARhXGb76xboQrUMYQQTdSxz?=
 =?us-ascii?Q?VGh1PBN2rlM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Eh/uWYrqpNiqpxoO8/breP+RNTWcO6J4bb79gNSKdjTX5vladpdf4gMDPYq?=
 =?us-ascii?Q?dJ63gcHIxvDJk53KtH3nyxaXPneCQRIZyuyGtHV1lHzAsZkvdZ16XJWgoKEF?=
 =?us-ascii?Q?Rk0EBNY7T1Lb05L4smgC12wf1nTKCV/e/onvBquHCeyXHbwUi1ZE26mm7BY8?=
 =?us-ascii?Q?b1TkBzFBT1V5SSoLVOAb1I560V/xJa5jM4VZnj8N0NlQyTfxXV9FRgWBjiGv?=
 =?us-ascii?Q?xymtTGbOY5MI69zR2SwuIhRHcHKsUFXs7gFaRgk+ZwWgsf2ZWFblVUNU1Avt?=
 =?us-ascii?Q?Ze+jy6wImsM5dJXEWShMesEN/R0RF4BVi10qfDoXILHOnFsA1rSNQNbb/CaV?=
 =?us-ascii?Q?HN6v2u1XHbR0+cEwCqpCsjyu9elcq5bplMJQAa1wFy6mo5UGlnYNihGH6ZOz?=
 =?us-ascii?Q?soCIxu9LVlb9sUe6g7yL8S0ZqOI5D2QJfspVWm7mi3oj44mwhk/W3fjikufx?=
 =?us-ascii?Q?POUixXq1PJZa36BkmjLi0gA2WK+tkP6M9u7FxJfoQ84bDYou6cfZWnUonK7r?=
 =?us-ascii?Q?K3YlWgW/Hv4NKZwI061uZ9RQVtQbj9o7IgEdMsaUTfwExTtPE8U6UDzEx7Q8?=
 =?us-ascii?Q?5UjCKWeCuttZbkG6v7vC1TbgphQ2tRRcKs3KykSyScsJWbdiAtWYEDc/fA3K?=
 =?us-ascii?Q?YEsCtLP3tCHDexNNUR/4vX3H6MGIVwUwrFZxX5Htj3XDHyeJByQBXY9wPyke?=
 =?us-ascii?Q?UF54aTlbkev+HpKUwLHdwXpROqnFgkH3HOMgIBu2i1nGNDFZTCh/UgOwskaJ?=
 =?us-ascii?Q?+DAJGJr25AVlk1orSC61/zeXzuK9zE2SaRU8RRTD/nRiIHTRI8wMt9NPnlXr?=
 =?us-ascii?Q?a7N4h2ArSsUYUqcFme6NfvqoNpDNxLMfrnCINcpKgP+nZCd0wwcCnffhxDrg?=
 =?us-ascii?Q?hnhzQvmM5x0HZDTOCKjjEvWVU9ysiBr+0Ho2CNn4gol7gKafHFyZx6aaAliw?=
 =?us-ascii?Q?ZDXS1SLQRugGUFwrsMXKlnO4yPpl38yjq8pQKNVuN97hkMXJTDwosLd4T6wa?=
 =?us-ascii?Q?oFiGPiO3WMccMCRcCRIaf+mLzVrRACiBUmUo9+NmZIwiEkUfTwvA1FW8hm0h?=
 =?us-ascii?Q?DN6g0hFxXlGolDjZUaggplLkKQLFJ5md8SKin1RGjWrvVbDCW1FVp8XX0jKs?=
 =?us-ascii?Q?IYzrAEcgSBnhw8r1cC0HbXYY1lQe2cf489vRhhA5BI5T9pJ0vsBvDXj76G9T?=
 =?us-ascii?Q?zyF3t75SH13gMEssyWs20B9nQdp4ALyeElcHdTZiprB6+QDWYChWveQO9Bjh?=
 =?us-ascii?Q?/pIeS4ntd6dy5ogdrI9gij/X0/2r82+Vw6z9KGGvb/KwsVN3xeU5fHiCofAM?=
 =?us-ascii?Q?Z06eGtXEcZhpsXEac81UxWz5nTr/GENnhdGsGTksD3OWHB5sryFNec07eMF7?=
 =?us-ascii?Q?ugUrGxIZFMHPBi1hPymKAg0EskjeuSi5VoUdo0iDFruHar38gdvuSGVU0zcD?=
 =?us-ascii?Q?ReBaWpdTQKZ8SDoXwmuOJKlpmmHVtQKHRo/dDmGzC74jFFpD1+J1w+9xADGL?=
 =?us-ascii?Q?38mGOd7Ij/CVzSUSS/abtwXv1tMyEgxxhVYA1V2ZoS242bKjXgskuKyU/7lO?=
 =?us-ascii?Q?wyZ2VGy+IIfKzpT0RgRrhhkV88xqzPQD4pBvSTNb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eC964XxDX5FK/KBPNrlEK8/hK+iaNMzUUbOyMSq2BvqWUoN6SHYNJ4Z3/0ID7xdjzuXgifHid7bN23TZnyvs/CGWTU/cmIvPGbG9ID9yVulxfoxeLPKRBfs50Gd50JKgz4xOm9r8Zrf9i4dj5qM9wDBJ/KGHoP1x7n8MZt5RVGeTRiEuAR74yURZXBpN2c9u4pUrfHMFYldTQ6YnafXfcOXBfckDbLCVmxTVaQtKXdR7k2VHN6jAmYl80yGCyd8bM5FJnBhgPoCLANPqCLszhwtnEhFVtBNeBT/v3v28e/9WyF4DOe+64DnANujaRX/RciHGx8xWuPrnJQ8gky2Ojs917BOt3PgMLuZA953k6bdYwi1eumU7iVuf5ipbDDow3lidJ/4FIL49c0u4NGnKny2DeG7BAQXOWmN61vpmIDeHhI5wh8ShbYDZ+zj8EJZzrJRUa2V0fPIxdbyZCX5SUqK34kqJWB6zO1/fKFMLs0pbFS1v9U1Mm8/aEUAoxGD0hQLRUuGNlM55j8dTs4iWTINry4ewhgtcGn+7/Eo85f+6B2en6Kv+4jDv2k4vaArDUBuEZ15LjKi3a475gnAGU487iGqAGjtfnvUFqUoasHs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a57006-8c7d-429a-938b-08ddbb04fa2c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 14:13:41.0066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2J3ZJoNeHaoDb01M+i2CKn4T5n0wVfxv2rUZHIs0VG/Ceeu4He6JjBMEpcsC16PFDQNyBAF101X0kori5gwG5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8163
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507040108
X-Proofpoint-GUID: Clq17cZESG54kVw-d-w1v5MOpVcgxFVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwOCBTYWx0ZWRfX7OHSynwfmpk+ vArflFDANFoWumsfM//Rk1oblHuD8pqjxGaoa6eVphJFQ7RZujk6Q7RhhmdsG6l01IXow8hwrWK T2s05W/kxTpZAWu2qET3Cmwp4njYsk9S9DFlXDX7j+pHwJ2fpaP+J29nDadzN1+Hx59v9T0vyj/
 zxxt1hBJIO6JYJEgWXiw6fGeKXiNdjjOYob8wxWW5ZWmZUeuM0bfbOPs6rc5UcSW4rbcjXN5NjV 3czAOyEgwz0cMBrVnLLzOSngoatFVRyl1bQCvaBaJDXZ8E+G2Fxx6QjrC7P45X5E3wVoL32+1+s zsmLgzzzgAueh5xrpfwnsngyTajUySw2EfOp/7hbU48Q8i30OkBcktZMGxHjBMp1C5DiNarpaMG
 2Xy186NXoeLgk/OPHz+lblB1DbE1IPeZUxYQKL3p5u6ok7lujkqX9r43lusfV49YEJN4kcKi
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=6867e1a5 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=7IPkZRsMv_DBGOYTekIA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12057
X-Proofpoint-ORIG-GUID: Clq17cZESG54kVw-d-w1v5MOpVcgxFVS

* Dev Jain <dev.jain@arm.com> [250703 02:33]:
> Add comments explaining the fields for maple_metadata, since "end" is
> ambiguous and "gap" can be confused as the largest gap, whereas it
> is actually the offset of the largest gap.
> 
> Add comment for mas_ascend() to explain, whose min and max we are
> trying to find. Explain that, for example, if we are already on offset
> zero, then the parent min is mas->min, otherwise we need to walk up
> to find the implied pivot min.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Thanks!

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>


> ---
> 
> v1->v2:
>  - Drop MAPLE_ROOT_NODE comment modification
> 
> v1:
>  - https://lore.kernel.org/all/20250626171918.17261-2-dev.jain@arm.com/
> 
>  include/linux/maple_tree.h | 4 ++--
>  lib/maple_tree.c           | 8 +++++++-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> index 9ef129038224..bafe143b1f78 100644
> --- a/include/linux/maple_tree.h
> +++ b/include/linux/maple_tree.h
> @@ -75,8 +75,8 @@
>   * searching for gaps or any other code that needs to find the end of the data.
>   */
>  struct maple_metadata {
> -	unsigned char end;
> -	unsigned char gap;
> +	unsigned char end;	/* end of data */
> +	unsigned char gap;	/* offset of largest gap */
>  };
>  
>  /*
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 0e85e92c5375..b4ee2d29d7a9 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -1053,7 +1053,7 @@ static inline void mte_set_gap(const struct maple_enode *mn,
>   * mas_ascend() - Walk up a level of the tree.
>   * @mas: The maple state
>   *
> - * Sets the @mas->max and @mas->min to the correct values when walking up.  This
> + * Sets the @mas->max and @mas->min for the parent node of mas->node.  This
>   * may cause several levels of walking up to find the correct min and max.
>   * May find a dead node which will cause a premature return.
>   * Return: 1 on dead node, 0 otherwise
> @@ -1098,6 +1098,12 @@ static int mas_ascend(struct ma_state *mas)
>  
>  	min = 0;
>  	max = ULONG_MAX;
> +
> +	/*
> +	 * !mas->offset implies that parent node min == mas->min.
> +	 * mas->offset > 0 implies that we need to walk up to find the
> +	 * implied pivot min.
> +	 */
>  	if (!mas->offset) {
>  		min = mas->min;
>  		set_min = true;
> -- 
> 2.30.2
> 
> 
> -- 
> maple-tree mailing list
> maple-tree@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/maple-tree
