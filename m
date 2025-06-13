Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BC924C08D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813443; cv=fail; b=VTK1eHLB2ijOKbR5e+EUMe6eZXbC/wPCrtiJize3D8+e159BWokXCMR3u6KYLh1Ru5rHJT0LdU2/mwcKM/Ndww3519qh+kj1d5yWUbTjIj7r8f+dTrVaTjI7TordFdiDRV5QwSB2FrgwlXtlj1P/8K93500JKwCFnmZ7j0Uj+HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813443; c=relaxed/simple;
	bh=iPVts8P32zDM9CiwyFbR4H+S63wazRYPGCViwSN79tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y45Yfe82psxdbDGyoaO1rSs16bqTbMIW8BQbBRLAkvqmSuMA+vLI46zI1OzNGFBgvyUMGoxPRjW+7G4AgDqtYm0L2tJmY89YGFlatXJv0OVjEeGo5OT77xJ/WxO4ks4etZ5A5o8JoPoaE6zqdu18mG1MLm3TwB55YPrR0AHDers=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CFdoWQL0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i8W7mAS+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CFdoWQL0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i8W7mAS+"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DB8rNN009857;
	Fri, 13 Jun 2025 11:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xyCriSY+UXwYFmdZw2
	YhQxa9a8TkhABGH+0mw51TjsQ=; b=CFdoWQL09ePaFt0qPtwBQrLVuzcZnxejr0
	s3bVHgJSLPDWl5ekUzD01OnZV8SS1Jm/DL6AdSLkFNZaPqCLcug8YB8Tw/siv0Na
	vo4piZNI6ve3UKOH8/SAkPorY4fPGfv39LEApvGXVX/tdbdMjaLpXwr0tWJfO0A/
	ZpMFfhdE11s2SJdeSGsqTQ+UrarCzJopUtxTDiQ+XZiOn1RYloJ5L+wd2ilIU8mu
	zvd+/EyiJ1rH9LhygeEWYZWYqSDyJ8wUb3SuiC/9DM9tXPUVIwrh+Ag5YJZkcWHg
	mNPpjrhPhlsAlhkq8f+C8DNqms7YkcPSoJvrptHoXoh3l1cBbLaA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14kd94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 11:17:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DAq3rh013483;
	Fri, 13 Jun 2025 11:17:03 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013057.outbound.protection.outlook.com [52.101.44.57])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvchvea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 11:17:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvlYOwrvGwyji69o7rF42ydvLGNHzuxa4DtpkdMZ9kOQoh4X3mVu4ikJmlmmqJLkFkibEaMYOC01OQikVNQKqUdJF/DCMCtdfcGH0dFop6/OrQPN5wXqf+eAlG0Y0vXjjQ2YZuGEEBYi9ASLjdE0LtILXXOs740NefT2PktSIwyX3qR9x7/IDz1PGsCsOR6jWE3v4FyMYeIuF4KSEXr/199sFrdDeYXgNwr89nRMxMpTBF26SLUZ6UPtgGuaHInxpiSZtaQ3+WdJTbI/Efbjh9JsOJjjcKM2GotI9GmBQgYzF2GIySQTJLJEmREa0UwzGWwKNvZo7JgM1Hs5XX+94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyCriSY+UXwYFmdZw2YhQxa9a8TkhABGH+0mw51TjsQ=;
 b=DanA+O+ncpRnPn099xaz/CR3RxjS+TgQNqW4Uu1kHA0FLPCNgMUCz1CPvkQwEUWqlO3yPHdA9kj3L2dBNM0/fgUGXQNgixRZhV4afJ4YYdXblml3JHMOjCtqbq7YQPJGXjNg4dfJuL8fqUsMFL/75LnkJyUq2O7D95FtboOnlxZyyTMvIudxlZe6HqnJAt06EI2qFPlizzTwKzlzIdsdIZ4CJcujA251frr9xixyPNpyUWqrReZWI7xp9lZJoDG71onKgv4w3Ld+kJ+691MMq873VT2R2PjN8wPabvrBDB/G2GkmTytzyigvZqq1bwk+swAyZAPeAcCXoYwiX1hn9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyCriSY+UXwYFmdZw2YhQxa9a8TkhABGH+0mw51TjsQ=;
 b=i8W7mAS+SIZByn82wdwhmgSsEb2RbrL1v5OUttsc6X4iPdt/8Z/qptt6o5p00Vj4q6ismf+ZL7XkSufIcb3QOy1QDscr12t1SzFiwCVMLKOhNmchalDHlFtDMwOSiF9lSD84ahdxznR1K0yN5ZEpzrjKO7K16NHy+lov/j30Zis=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4476.namprd10.prod.outlook.com (2603:10b6:806:f9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 11:17:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 11:17:01 +0000
Date: Fri, 13 Jun 2025 12:16:57 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, baohua@kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: huge_memory: fix the check for allowed huge orders
 in shmem
Message-ID: <c7e64411-1c07-401e-8503-928184ca22f6@lucifer.local>
References: <529affb3220153d0d5a542960b535cdfc33f51d7.1749804835.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <529affb3220153d0d5a542960b535cdfc33f51d7.1749804835.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: LO2P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::25) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 26928cbc-39ec-4030-ae5c-08ddaa6bd1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GtYaViLSzXuGPvd9H4t2o/TAV9Xr87ejFuPQUoj3AaFJ8HR+1XwodU16bnA4?=
 =?us-ascii?Q?0rvi616fctsGabr3XG5EV9CsCDrBwyEcQgx6g4Gy5kMnQKTRsMpSNJvjP3li?=
 =?us-ascii?Q?2mMVh++8tXLG9D1tBbvAumQnrVVcdNboDuv77IEWfecsMZynU9F+pPbMwuJw?=
 =?us-ascii?Q?rV2Sybsndfjna9BM7ao4kfJTg2YWJ/awcfhKYtNBeIk8Xkpmdh5Zftmu8vR3?=
 =?us-ascii?Q?uvmtk1yI+2fjecHtT2AmDDXNxJh74k+K62dfycDzodor4Mtn432xKwMVrC7r?=
 =?us-ascii?Q?c4Auk8sPnie3jD4Uz90LTeFnT767E5fycYQspFu/8F215u5KF6HUBMjNr2i+?=
 =?us-ascii?Q?3O6jkeewBA/8kE5v0Pu+bxrIj9yGdpArFfrVr+kyTDS3BgXVoRQyILEb3Fqv?=
 =?us-ascii?Q?AcqxglrgEEUHXLfnyfdgKnFPmQ28JIeHPPdzQWZjLC8L995uP7YDpLDsMDpT?=
 =?us-ascii?Q?ukmAJJoG+siZn5avW/UVaggdzN2iIwzodaP6txS5upiBvK9hPRwmKa28IK57?=
 =?us-ascii?Q?I78mFYQ3zyQVIzV9XxirsIy1tGMcsnBzN2JgUUFfnSIcTPzVP7dqs/1t0b3u?=
 =?us-ascii?Q?GzXQbviUuOtQ8b5WPUDAmXLf1HzRMTJ9uiP2KlbEsNUyWtNkWqkYX25b7U4r?=
 =?us-ascii?Q?2h0Mf3sOMdxRkFLm70ZBaVBUvqJ5/H0/uo5VWzDXHUlRQSfoK9cvP8rT+VJy?=
 =?us-ascii?Q?zKlmxHa5z8/PACBw16WWNFdweKTJUmhxJMqy4+Ve3Q9FtXrz98UrrT3hBuSO?=
 =?us-ascii?Q?EkvEmMuOKGDrEl+0gZ87juP+KBVLQHMtkmi/yQPs9cBOIDss9/IjG9XwnBdS?=
 =?us-ascii?Q?tYT/tVIVRco5V/0NU6ls4AqGoJycFqrLQVek5cAlm3VK5Nk5AjqbfnBa1UCW?=
 =?us-ascii?Q?+cSsvbEldtu6JhBTWj1SXOqRXEvgE2mU7vDE2HzQfeW7Tlovz1BrCNlwn7r9?=
 =?us-ascii?Q?/CMUknZE8e0J3clnpRxwshl+oRl4ECx+b2tlJ0/5JnHJeWLL2KxEhY7Jz27m?=
 =?us-ascii?Q?MKIRcje7RMYcZgjCwk91UPL31fNp9HgEfvujfVO8aWrJ4iW3qQWiyK47GPZW?=
 =?us-ascii?Q?FCNlvwV9Ue89qIhHjK/0LaqGeqbdr0y9bR9C0i1oI+QIN5V0XRpJ5tro95kc?=
 =?us-ascii?Q?BwgTlz0cy/+JNgHsNuiKnK+XnIjfYsegKIZzBFuIJsX06diA3bK+Wsy5YAX3?=
 =?us-ascii?Q?C8V8q29elUE6e6LUB6mnHjLm1UM6orL1w0vMTONHPtW4j+cKah0gjclVXvf3?=
 =?us-ascii?Q?Zz7IM8eJ/LX0LGQS7khe5ZFt0EwhY8AY4R9sjF7/9/UdyvA0RpEnEBmRjsir?=
 =?us-ascii?Q?i2T8+lz+PIBXfERT02+blXwNMjtV9O4D32f+Fue+Y5VcFRR1SbYHuv8m3/mU?=
 =?us-ascii?Q?62rsmvNyl8tlF6GEip+951H0zxoOJzLe04SbXK6VWAJPirLITv168vRziEiV?=
 =?us-ascii?Q?RucapQsHdsE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AoZfT490Cx9DPemAgbsfGa9jNH/aU1txSI0xfVWRhwnf2aiLVxVBmjLcxJTu?=
 =?us-ascii?Q?PzvcF24K2skil30NjgAOrOJWfumO+Iagcvj8Te2tfd/0jIFEwHxV29LezkQ/?=
 =?us-ascii?Q?HH6zAKbBxLhfiPF3N2JSvk33aQuI0lU9w91IgGgwsFZx6d32PViuCUuSZKyZ?=
 =?us-ascii?Q?G9kkJVKe5biefj1T3GQ01rwAxocpySTLIHoQEj65Y/5KaVw0suCQL9qBhiid?=
 =?us-ascii?Q?82DT2wSoWRpCvPwqUmxFZAHizvArjmcOoelS9L2fxosSyXEgx6rdOUugpZn5?=
 =?us-ascii?Q?yLOKw/SzThYpaUDx3PzosYkkHmiYI45VG6SitsiqjEXxr5ysnQbJSKBSbtnf?=
 =?us-ascii?Q?OzhNThHQnYZ3QjFNr/mUXxOLv901QWf/gPusKyLTNLK7p0se5l1u6g1cCOBr?=
 =?us-ascii?Q?GZKIlswQOa0w7g0HiXRfUVyrtQ/cu/8jzcpUMQtMEjUVWWP9FgPwRBQeRUgT?=
 =?us-ascii?Q?HBgGmBpX533eELO4N0qVlymQJIfA4TyDHtPHKp756eEkZlRz2bf+/jt4OnGn?=
 =?us-ascii?Q?7ecYRD7IKD77At4wzOVDq5ORobvU/2ouAsoliFC24+9Y4B4zeJl60PVrk+RT?=
 =?us-ascii?Q?T+MEykCeCzuvgU9D+gjIhB9JMUDacCSy0CMWA92d5UO/odz5CQKpN6fH4hCz?=
 =?us-ascii?Q?IWc1m1u0+w02NJ17Zt03IjrMVAYuMOJWVcG3KmuVSDYxNHVhhFFNZUl/0ydP?=
 =?us-ascii?Q?DNu6r1qEkNdrKC0hnfvhUnwg7WzCvg75tadZtlFCiLBNUbp8tnefGHa010VW?=
 =?us-ascii?Q?yLdkChDmxjM0Buvksdyp2QVK1pUrozg1wC3LQbrOgawoJqgeSPJAUZCHB14B?=
 =?us-ascii?Q?txwiKPdH8Y2H3infBvv/M7E+BOrnL5iW5tcuB6hlfHwK/4u9mBHU11UTizY6?=
 =?us-ascii?Q?UuRXdOIjE2iAtZCApz1hBpGf9Tc42KeBjy0sut+gLYhIIGL2c/M4ZkehSaIF?=
 =?us-ascii?Q?iz9jrzONVekCTr1Bd9RpxfDDHlBHa9VisvFGrkIF6eX9y4Moj4RcRsZd92Yr?=
 =?us-ascii?Q?Bjke/OYK+UhIqj5BX5X38+dlISSZQJUvLSgRAqjBykY39bB9cvcCzeoHeZVX?=
 =?us-ascii?Q?RQZ6oryjACR11O6C+02SsGKwcAmgBBBFJP29T5cDzhj36rbmZIcryGFuedVk?=
 =?us-ascii?Q?jkNBA7cuK/krBsLdTU/rRyhDJ4PClx5n33UIfTWvIGlEeFhefUEoBtrd44xN?=
 =?us-ascii?Q?K8wuOELOf5Q3tVlSiirfutnPgMO/1NgI/dewfy+ta3VKVyVyY+cU7S5sUmN9?=
 =?us-ascii?Q?2IQ4OUQrxN+vA3/rYJyVL43pNK59duPhJrN7/5VfPd1qcL+sLQaAAlt0q1Ig?=
 =?us-ascii?Q?Iv0/+aNzTRl/5q7KCK8dzLww6k7S8NFKwj65DkvX/efPYkCb4lLVypy5QVJB?=
 =?us-ascii?Q?6d2QI3CxhTKZoCg0xvaSY7IgQSARzpcNENtNwEGL6e9yxKFsRinRoAxWDvQW?=
 =?us-ascii?Q?DH/aoV8QUiQ/w2tOP0utReqnM/HOVG6H+1PtKzIG6hKat79T8hvYuCpkkgCx?=
 =?us-ascii?Q?ckDb2uviI4ceIf7qzgtpMZDDxd3MPUyWmKkWDVuF++Co1wfClpB6QFnnOMLV?=
 =?us-ascii?Q?eWtnn0l0r7J3HxSsYFtpwT/qTcsIzu62/rTjTq+kwXUeZ83+1+dwFIiIqv5+?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CtcS7M7s23y5YljSN1KhbUFhpEqOmey7fGRGdmdMCcFqERk4suKY88WPpMlter5jtjnZw4a5i76497+4TNXU/PJvmVPrVrYlwPYU2h4icOrFETvQnccf8LcRTa5gyATpqUOAbMPqDrEj2jqDmVD5lNLH95a00BdkI1VK25PKv+d2k8kkathFvLi/RmtnCkjXb7CVeIn0TOHrIlOFnkwm9Z4A0Sflz9N+dRdG/Q5gTGZHP3ujLxPvPKe6bMU+uR4kWfn2p5tsJw91TiQoslfFBB8TLe/a6JFmwt4A8cYdlZKeqXPnqfkTn73JM+KKrz8ECU7CgjNESxtgNAF1VIy8oc8bW8XfSWJeSXrJZX1gt1N50LJe98e5fSWCnrBkp2UCX/IY3489mNdcS0wKbhB300Pp+D7oCrAtvOkQJBcATXRm0w5qaiBdns8LxeuuotpMh4CkMI//xN/ZYOWIKuKSahe0mKMqj+zay7BLLvQ/ZGY6oK6yYtjOrw/YidszHCWiC6zQmM0nstvcXLcSur4kzWj5nzdwJq61HCRsF7u545aOovnGO4NBdpkByHASae0WWbuz5mwoYuLt6dOMuJzs6+mn4F7P0dl/E2J9I8zcmJE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26928cbc-39ec-4030-ae5c-08ddaa6bd1a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 11:17:01.3139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoCMeGzqrmngaWH2QJqYMlmJ9YO0Bu78zI8H63TYrOV1Q6DnmvQ2G7fOjhQ8qWOwIavetS+mV5H0+B/BsxBxgpo7urQQ0qUFVcU7SWucC/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4476
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506130081
X-Proofpoint-GUID: 8iGlGcNGwaYRWjtz0XH1vkHw9ft9RpbY
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=684c08b0 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=pabLTUDfCpVzztbp:21 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=yPCof4ZbAAAA:8 a=SbfSn0jHzW04FSbkzzoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA4MSBTYWx0ZWRfX5ONw57JuQLOX 67HQUAujPX9iXtdRyT5Cl4ppbO2hspCvupTCcOz3eazhI0EdObuFDSIiooOTFTXQ7ub7qWuhUjj fZBgfijqV5MYwsvt2RXBdhlVGP8ROCBZSewMGXWeLA7kfyfocnp1kiTrZiLv90Mo1Xdz612TjHE
 bfe5Qv2li1W373553BO8Xig1hmUlVcFMo5JeFgqDeu60OxF28JMpDgRty14vViINlRCZpmUXruk TOR0obPGbnlYNLg8FKfl/NHStrDNpWtA1WsQkaUgfOXZ30dqYN2J3bVY4MZuOXz6tnkxFu32IaW zMNuM27fh7MeQhKVo1SGWwo7mTbOQf+SwV45/ms6sYCVzwEKGf5W9J/Dsx9lgdVuVaUn3c7ilqR
 WEcj2h4XkC/YddPpH5SFhGqgOnB9Eq0dRRw5WjCX32N2lMofdGrYafzW7roNmCu7SeLnJQmo
X-Proofpoint-ORIG-GUID: 8iGlGcNGwaYRWjtz0XH1vkHw9ft9RpbY

On Fri, Jun 13, 2025 at 05:12:19PM +0800, Baolin Wang wrote:
> Shmem already supports mTHP, and shmem_allowable_huge_orders() will return
> the huge orders allowed by shmem. However, there is no check against the
> 'orders' parameter passed by __thp_vma_allowable_orders(), which can lead
> to incorrect check results for __thp_vma_allowable_orders().
>
> For example, when a user wants to check if shmem supports PMD-sized THP
> by thp_vma_allowable_order(), if shmem only enables 64K mTHP, the current
> logic would cause thp_vma_allowable_order() to return true, implying that
> shmem allows PMD-sized THP allocation, which it actually does not.
>
> I don't think this will cause a significant impact on users, and this will
> only have some impact on the shmem THP collapse. That is to say, even though
> the shmem sysfs setting does not enable the PMD-sized THP, the
> thp_vma_allowable_order() still indicates that shmem allows PMD-sized collapse,
> meaning it might successfully collapse into THP, or it might not (for example,
> thp_vma_suitable_order() check failed in the collapse process). However, this
> still does not align with the shmem sysfs configuration, fix it.

Can you explain why?

It's a bit painful to trace through the code paths, but why do you think only
MADV_COLLAPSE will be impacted? Surely everywhere that checks this is?

>
> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

I can't see how this can be incorrect, as we really should be restricting
ourselves to the orders requested.

So:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
> Note: this general change is suitable to be split out as a bugfix patch
> based on the discussions in the previous thread[1].
>
> [1] https://lore.kernel.org/all/86bf2dcd-4be9-4fd9-98cc-da55aea52be0@lucifer.local/
> ---
>  mm/huge_memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index d3e66136e41a..a8cfa37cae72 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -166,7 +166,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>  	 * own flags.
>  	 */
>  	if (!in_pf && shmem_file(vma->vm_file))
> -		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
> +		return orders & shmem_allowable_huge_orders(file_inode(vma->vm_file),
>  						   vma, vma->vm_pgoff, 0,

I mean this seems correct to me, but what a massive oversight.

I wish we had a sensible way of testing this...

>  						   !enforce_sysfs);

This whole code path is entirely indicative of what a complete mess this whole
thing is.

The fact shmem separately calls this function is just ugh. I'm talking myself
into some mega refactoring here :)

>
> --
> 2.43.5
>
