Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63175191F6C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336952; cv=fail; b=uy8EtKlZ+DhiNKD00+szeA0wlmWPWa3hbVANfQpxJe7hCYSc2NseCmiZVuXjqVH4e4NKPD14S5jeRygOWsTvvjBpMyyH4opofmmklu/V1ZKwMwdZC/STllEF7PqU8aRdID94J0jelq8nrKGfdz92+9dQO0dCOU8R5aTxCtQq1jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336952; c=relaxed/simple;
	bh=67gBkf2ZLIF2UmCnZY0gkG694x7PK26dWIeNJIKrIZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hQXBZQCXxfe3+YZP8Wafn4ZidMBy+Ns5+7t5QqtUz1SzR8rnhhyu2c4nbGVN0h23x+UPJfLcOAhCeHR0wGsNFqzco2WIWBcVpQ3aEalIQIQn1Sy7psg0jfX9nTOlqXPn2e1HxBRzs/c0KboJLcOGrLp0tnIq3/+2vejhaxXCo+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lzV34VjX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WrUkKDCz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lzV34VjX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WrUkKDCz"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FJBQor023103;
	Thu, 15 May 2025 19:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ig/4IqjejUYU+f9qUl
	1dCxMIfaKGUTRzoxZ0lBVcv+k=; b=lzV34VjXWfOsJI4OmbLwt6/AEjTDf3XTml
	MXdUewORxwa8g4NJ7F+uZtFcg302WlWWaE+aEMnp7QuNzr6QSUxSIdDsmMHDs7eK
	/jGQ+MByGAgOSAwDWX4yI546KGsFsdk75l52fuIvasp/Hu9ixLZO4d5DZy1SeHpd
	GisLY2/AboMwz9AOaDvDI/DQ/2sGDXq6uVq99x1DfB81WEMhm15eJUwKmlozpSv4
	tJ8WdeoiMrdIsjBxs8oUZj779wX7AZLg2WcO9/jPby6vk8E6gbg7K+9Z9xdBpV8M
	5/S4Y7Y/xL707XoxfcXF+buyUEwyZp4+JJ0TlPUGallYsTYvh7tw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbccw7a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 19:22:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FIMjVC004613;
	Thu, 15 May 2025 19:22:10 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013074.outbound.protection.outlook.com [40.93.6.74])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mshkytg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 19:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sddg/6hWwWj7Bqj5uiAsDZG6kzCy9gRQk45GdBPjOY4yXVqb/bYxGNBuU7s0aZtqUa13ntWpFhGJ68XL+QMVsOVHqrsD4pxga4K3QPXIETICf7faIQwluxc/153ZsO/jjpAnyL4TDXALPT4mpefYAPclS3GwK38uPVzm08zO66myCp+ZVs4zKSftf5rZdcBSj1MPE/naGvDnTZx5UYqVSJY7ARzNVTrNzykOEsYhhEz6JLIwhDDHvUH2czh5a7c3FuOdwP2Xom1HEfAzD0NeV2J2mVxbFLla1i1Rfjgd51WjHaMT6GqedPKNNZoy3vBkIlc+TOHp9hdQFC+E6TVqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ig/4IqjejUYU+f9qUl1dCxMIfaKGUTRzoxZ0lBVcv+k=;
 b=oKqarUf8wUCdIcQewP6JAxEPvM19aqtN3ETmCzdaLbi5zFxXsX9DbVrGAvYStdef1IBFd5czqtcG4IHp/K7RbCTF24CGp1eNaZW8Qx5tNMrsmtG7veaeBJexdbYhIpjnpbKA1fAWHfaoda8hYHPB0jI3FREnvnu6S/EslSpVS6+1cy6UhF4p/MQIxruLqrk4YhkcWyLix8WSd8LGXYvfisRq/lAbD26x/xKJQ4tba/TLF4HHDNXgb2ErBbZH8QN0XhK0XmC3mNHPutV9ISTDlCymb0PRsJL4yLZtYqhri92q2kVhIu/oL54uCKGcgMXSKkeCLCBN0t6TF5i6pvTGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ig/4IqjejUYU+f9qUl1dCxMIfaKGUTRzoxZ0lBVcv+k=;
 b=WrUkKDCzTw/RBdlVU6SPBxWoDrRiJnO6qr5q04EPN8Ohx8fa+8K0qSXRGZSyGWqzNJyCOYC4M7CdmaEQzMFRnHcA1Spv3XP1PQS59gnLhFQ8ZFqBCxksru83kLJThbE2DVKLYdco8V3hokYOeCdx1wmhprFZEjPnkAE9vx/NyfU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB4961.namprd10.prod.outlook.com (2603:10b6:208:332::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 19:22:06 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 19:22:06 +0000
Date: Thu, 15 May 2025 20:22:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Alistair Popple <apopple@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>
Subject: Re: [PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <d53ec398-473e-4508-8aae-638cc7c8a190@lucifer.local>
References: <20250515191358.205684-1-lorenzo.stoakes@oracle.com>
 <AC1AD5C9-70CD-421E-8AAD-64FD847F9B97@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AC1AD5C9-70CD-421E-8AAD-64FD847F9B97@nvidia.com>
X-ClientProxiedBy: LO4P123CA0314.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e91f74-4af7-4725-5886-08dd93e5c7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UovIx1IPfdeJ3xTc1ypy0teR0CFPPJyRZD1cWacKOCAaVKvbgR5e5t7jTH/s?=
 =?us-ascii?Q?N1sn2ADipZ2XxgUeNufW82e5OzzddyBPlfy4oncLQjCDbOVbnkbQmdioY5DD?=
 =?us-ascii?Q?XJBLeO1h3Q2dsd4qeJzIFXVLARic/Qgopjq0WMLrEqO5qXAieOmZNTKLDvDW?=
 =?us-ascii?Q?vDz6HmcENYxX/ETQtF+/ZrpF/ezHTLf9+fjbrwL/L7xGNi6vUHczITO32qtc?=
 =?us-ascii?Q?DZMHn4vr7yZ88S1NmxghjNWsLR6+wSkw3UqtFPQ1CSoJ/KeTLtewf/zZURDa?=
 =?us-ascii?Q?eqEbyFBsrVAFEZ9mDKLS3xK+4TmoFp0SvuCObqoh3vB5JRjvTQO2WzYVTPoN?=
 =?us-ascii?Q?kf+lPKVWCt+OAypban+oLDv7oe+7QLXULlAQtuHK4omMGrsLpX0VfKsnTV9U?=
 =?us-ascii?Q?gLjHmq/8810DLMsVpGfjLygYzQS4TdDVakDqPMUJmOVZfYNwxeBuSSQAvqOV?=
 =?us-ascii?Q?pUDCHnxjKhdRs0tDfcw7tJt/YphyhZjrYanx0EEiBeBxFxblQ4LJF9r3yPuV?=
 =?us-ascii?Q?08sDWrjqt2ldwlIgn9n5XCMapSsl+IoCl5odkRCJndR0H4bEJnAaXouyDqGN?=
 =?us-ascii?Q?XlAFo5qpYnbuIP5vKp/6V1IpMX7RX6OB35Gsi33e5mFJ3/aRcr4Eaqh4DApN?=
 =?us-ascii?Q?SxTI2t00yIPdx7hp8y7aLZBmu8hNOhPE0BQwETNRL7u9+TgS/hduYwxNrJJR?=
 =?us-ascii?Q?psHfQ5NZUXB6AKef0oeEcOq14duzyMenrtiu5L4hC8S0TfrzpJu6AS+VsmGD?=
 =?us-ascii?Q?nM8OSUrd3PY6PyM60Cel5nvu65yHz1jDxWf6mvcQqDhtttc2DicuMw/EBwzw?=
 =?us-ascii?Q?c9ishFr2nOdcLLNXm99x3IlibxXix9f6BTvv4JtIYqy/u8vrIUb3Z2iglBWf?=
 =?us-ascii?Q?l5VRLIPAncPAlh3oxh5iaHveqEFzN49qpzmWGZZLO87DIEHJ/FSxOK/1iFwA?=
 =?us-ascii?Q?z27HvA9mG/z0Q50FbJBOJcOzZMNr6yEA3facZtfzgeymETnYLYwOXQM3q7I2?=
 =?us-ascii?Q?xURwrpxLFpbKMCdKtHolLEDQBn4KTV7FFA5QaLAWwCdq7KhM7FyxxmsEgjZV?=
 =?us-ascii?Q?x/H6b95VZIBP1eosExQ8IdgWiNlTPSBAFpy9xaBLxJ2bMhyd+cB0RwJ9yxg7?=
 =?us-ascii?Q?VHiIwybjYwRibPhojAKnHPJu+GW3+PHrBpNhPpcBj67u2u/VB8Lc/ld0VWk4?=
 =?us-ascii?Q?EG1nBSlSG686KCn5GsIfSaF09oUwZduwcSPZvUbD78AJr/6+1LAfZIaS7xEU?=
 =?us-ascii?Q?nPOKqbwf0fJ5GhnWYbnZOso8WviyVKy/+LFAjSMMY/kONIG48HKULKIZwPYA?=
 =?us-ascii?Q?awDwgkmC9bGaJChWVf6oyRj4kVygNy4zhNJAPH5TyOqY0/ZpSREkGHUudkb9?=
 =?us-ascii?Q?pzpEBmL3WD9rmLFQdey61uhqUItB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ju72Oxv5xCbVvGdpR1PspawjJgiBdQbpO++6lBA63UHSWJAPJ1afsNiurwYx?=
 =?us-ascii?Q?+LIfob4WZAnkTaCYIdNNKrwDf5EjPnTe6s6zdokiHAh84zuagaRKLXMpIvN0?=
 =?us-ascii?Q?4e45abDhwWX4u8SyfCPLeVJhI7BrTByiC4ugeT4NHtM14Zqxu6e0PFN11T1B?=
 =?us-ascii?Q?AzSFlX/2GlOApqmgfv4ox/IySWAlY6C/85OrPX15+cOsIPlNuUbX6VvGFNs6?=
 =?us-ascii?Q?sG4yFklMtNjXnvzyYDftPm4iS2lYN0OLSKxqsWSb9PGyj6bmdrIARvn1MXQw?=
 =?us-ascii?Q?EeG8rim078qaPaR8rE+D19cTt1Dpma79oBTLIccbWZvCKRp1cq0IVtgyK3Dk?=
 =?us-ascii?Q?MJ2r5Ifqrh/lnU5uYwrwvBuMYLN9aDuBysSyuXmOnLOenMh8kPfyRbV1GnbZ?=
 =?us-ascii?Q?bCIdJw7Oho6yXonb3N3HRE/gME58BIxsZBktt+5InMpUI7iYmR3fUupiBc3A?=
 =?us-ascii?Q?TjHo5TvAchsyxeotCa9U1w9murJCu2rgtk2RNCGeDYtHl/VxbEjUqQXKv3C7?=
 =?us-ascii?Q?BhpeHFbzYGpC/SkGAE4ITavs296A9ZuYQYQmCYIUUgwwIc+a4RCgDZ+MQ+f9?=
 =?us-ascii?Q?DksMWBe2I63Nw9hOzmDoCq20MZdXis1v8yJ1wV1DVa0/sRI35aM2/SF9ONaX?=
 =?us-ascii?Q?jJ9yI1Ju1pReFAjBLuAKMv0Zx8ZLYSB0uKkkj6azh6YH1mLOy3EU2mOgVBSe?=
 =?us-ascii?Q?QrEDkYVKxlOHSCGpc1keMzJxL5m7+vzhLFdp2J2bdD15kOLiI5OeMp5zieJd?=
 =?us-ascii?Q?akRft6Gn6/PnfxS5wl9NhDynVJnxFDYu8FzSJpGuW63AktFytuhuiuOangDR?=
 =?us-ascii?Q?JrtslyaOFufUxKGNx5JJTGHaSckI4wnViqjQ3dMX1I4G6nqmnRdoxzM3kF1p?=
 =?us-ascii?Q?KaqieAms3ns4bmwkTNUWSKS/qkvWkQQtKj/5xH0StuXZTQ99lsRpp1Reb1ZB?=
 =?us-ascii?Q?yAwzgX5sVrwaNVkG5oN1tFVBaNU2OjlH4cFM8x2++oUJOXb0Xo3sPtonifWm?=
 =?us-ascii?Q?W99Gy+SGj7HywXkJshbfCrnbCrZAyiHoQEsqTVYram50d2S8e0sFuCkfIhLU?=
 =?us-ascii?Q?LSCClF78+R8arg6KvMSr9hk5FrrLrqFPEGJflAGWmAz5lPr9jokvpSY5sVr6?=
 =?us-ascii?Q?jQR3WBJ9sSyr/UDDchJOY8C7nXMc7M3m+Ie5lS41lpmpo1LK1v5HCPQuAizM?=
 =?us-ascii?Q?lAniXSiJ9qBcGYT1RzIatmdyZ/w1s3Hfh1JcokeHTPYdxOnFHicRQQi8ejOu?=
 =?us-ascii?Q?HJex5mmPvmSXBXNAN2McV0X618ukEmGpW+eVadRMc9KQBDZjIGGaNryEaDuk?=
 =?us-ascii?Q?f2I3PEaytd63pjxQ3BhOn2njhn4YydzocTnLBLKNZUYGtHJSm8DB15JvybMn?=
 =?us-ascii?Q?zsqmgQY2GpJuSOXDmMLprTPdL87peo+jCLb1gxLOIJnJjkxVSGLHKECduOrs?=
 =?us-ascii?Q?ArXcG3kbPUvUuNfOW8IHSfltRw+2/cozm0HLKiI2cTEZoKkA+W+rnBOmBx+R?=
 =?us-ascii?Q?ba6Q8X/vf+6niH8vCcx+67I3lOAk9aBIrvFCHLf/SvbqV66qvs7os9sktQS/?=
 =?us-ascii?Q?vYT+qf1bZSG2f0vYhKZ6RVaaheIWuT/d02oqS57X/49tK7S1ZuRhYwO2KhUQ?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6nRIzV4SUT5IdNtZLyn6UdGbhkhY/ixBu2XDAqnEonGr7DSN3YjeI78IwAieHJMzvVzR8OrtVj8nZYY7QW+LdIRUo912VL39/yHVAflkcSxsPpni0ZJIgJOrg1Y7YwDloadJ9z0I99KoA3NcNma3dG7cKWCElttNXwxqs5xeEV6BNcF7Z3SVxWh/KUNFIzMykipiPOk35lwdfdmsqzRzyPHgqSRSt3UjBwx+EhRfaYHkIvhPpLAs7ycIXzytgptMQ3HfP7dLtvnx0o4uykmHZu1p+TVamv54DcSpCnqkjpjEOULvfr/bPohXpOwn699bbKZNTOo9MhOChX7GHo+cK4kN2syhRWIm2pYqZdJjFEUXx1NgI1kLXbtR/GBPb3hIBEvYd2WHTwo/b9Z+T6Lme+G9zqcr6CeX968+PvlA/S2PgSUtb9WS0wOAin7z31pGeOBQzWgCYcfoOvTaOq80rTnuLWZumqVLKiLjXF1lbjNsSW+9I0UDKNaFj9L3rNAloNZk+ya5ZQaoW8/VLPrrDjaKuGrjvt7rBItW/MqweehAAyhbftrL4pNDvts/Bw4gNooTa1Tu1AxsYBofgGiv7cpOehHrA9T/iMMas8fJq8s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e91f74-4af7-4725-5886-08dd93e5c7f3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:22:06.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hW/deMmflEezae3ZPr9cbhhWak+nXvO81HpRiaPi4ltaGKrDY84rABDyPjxSJmkuXTSdbNu9aG4G+vaNbv5DUbe0teYOfmpRaRfd+KYZCaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4961
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150191
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE5MiBTYWx0ZWRfX95WPBCJ4ggRS oRyPCbUYpZy5HF0n8hiG9DiV3UG0sDNn+m8ywzTbD/CSEHvl7occu0aFUaLuCJ82ah2LOstopqJ hDRiSt2mCFC0auJwB5af9NDLaFF2FkBIhRiw/TW4PYNgN8215V9uS5hxTtxul5mFpo85I2tRtej
 0k6DH8P8aHaBEcYWOpvgHumYOWcJmd264Z1IQXuli7NqFB0yh5RDef6JHvg2oVftP2o2YDUrexR rZ2zXRrzsccPwjZzYoRbYqbW5PdKwEWjrKNV0FYZHAZ2VXxE27eejwQ0oyhdL+HlFp/cGhWiilv 5qxjVF8U+5uaIINW0/E1OfHULBNt3ZCnn3nYb8/ubTE5x8EG163fB051kccYcwhoN57rjfdHQEs
 bCrUQ/q96T8YXXERLoPkFZ1ucUPGOwj18e23TX2JVtaD2u83jgMU0BRFmnd0MaA257A6Hoff
X-Authority-Analysis: v=2.4 cv=Y+b4sgeN c=1 sm=1 tr=0 ts=68263ee3 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=1-S1nHsFAAAA:8 a=ph6IYJdgAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=Z4Rwk6OoAAAA:8 a=tHa68p0SAAAA:8
 a=SRrdq9N9AAAA:8 a=37rDS-QxAAAA:8 a=8ANAjTy906HjrOixRyIA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 a=ty6LBwuTSqq6QlXLCppH:22 a=HkZW87K1Qel5hWWM3VKY:22 a=ufIsyHvWW7FwcMbVRpPq:22 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: 30FuHP-tfGJcrtKeiIooQ2nQNE6wTnIQ
X-Proofpoint-ORIG-GUID: 30FuHP-tfGJcrtKeiIooQ2nQNE6wTnIQ

On Thu, May 15, 2025 at 03:19:08PM -0400, Zi Yan wrote:
> On 15 May 2025, at 15:13, Lorenzo Stoakes wrote:
>
> > As part of the ongoing efforts to sub-divide memory management
> > maintainership and reviewership, establish a section for memory policy and
> > migration and add appropriate maintainers and reviewers.
> >
> > Reviewed-by: Rakie Kim <rakie.kim@sk.com>
> > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> > v1:
> > * un-RFC'd as there seems to be consensus.
> > * Added Gregory and Byungchui who kindly offered to be reviewers also!
> > * Removed Alistair as he hasn't been active on-list lately. Alistair - hope
> >   you don't mind, We can very easily add you later, just don't want put you
> >   here without your positive consent :)
> >
> > RFC:
> > https://lore.kernel.org/all/20250513160007.132378-1-lorenzo.stoakes@oracle.com/
> >
> >  MAINTAINERS | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 314007e2befd..17403329d76f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15577,6 +15577,25 @@ W:	http://www.linux-mm.org
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> >  F:	mm/gup.c
> >
> > +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	David Hildenbrand <david@redhat.com>
> > +R:	Zi Yan <ziy@nvidia.com>
> > +R:	Matthew Brost <matthew.brost@intel.com>
> > +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> > +R:	Rakie Kim <rakie.kim@sk.com>
> > +R:	Byungchul Park <byungchul@sk.com>
> > +R:	Gregory Price <gourry@gourry.net>
>
> +R: Ying Huang <ying.huang@linux.alibaba.com>
>
> You probably missed Ying's message[1]. He also wants to be a reviewer.
>
> [1] https://lore.kernel.org/linux-mm/87wmakt0v3.fsf@DESKTOP-5N7EMDA/

Ah my bad sorry, I did miss that as was buried a little in thread for me on
neomutt :>)

Will reply to top level with a fix-patch!

>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +W:	http://www.linux-mm.org
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	include/linux/mempolicy.h
> > +F:	include/linux/migrate.h
> > +F:	mm/mempolicy.c
> > +F:	mm/migrate.c
> > +F:	mm/migrate_device.c
> > +
> >  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
> >  M:	Andrew Morton <akpm@linux-foundation.org>
> >  M:	Mike Rapoport <rppt@kernel.org>
> > --
> > 2.49.0
>
>
> --
> Best Regards,
> Yan, Zi
>
