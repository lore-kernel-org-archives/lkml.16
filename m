Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0772DFA44;
	Tue, 15 Apr 2025 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730804; cv=fail; b=GgklJvDt8mvLdhSBQ1ADYgjHtISe18Gi5WhN6ICPB1RRr20gumKtDqtEoJxr/9tESv1zPmvOiu1U7u2Hj4PPFhmzESNU1XkLdbHCZ8+Z9GFbhihcVVVzU1H7tAQ3781M+zO8xuYxck0lelhftPTXLaAmaBLpjeJ6PiH5oP6BU4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730804; c=relaxed/simple;
	bh=VvacIhXm5+dWM/3vicsL6NO5wi08iuD3EatXdDnwdVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S6gCpyV7g/juccT9p+erM+GQIJ3L5xo46cpAqZUK+LG7iAZZHRXhB+5pkrMHkOg+gFZFE/6paQp8HwUE+YKbxJfwaabWnegdDQPu/IhrQ/yWXXVjEIUWsmyi519atq9G2p1xTJQrKvOVx3Ax5+LVZ7lIr0wVRHA8isugEV8P8/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IKxX0aIg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RzRBvOFv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IKxX0aIg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RzRBvOFv"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FFMjaH011512;
	Tue, 15 Apr 2025 15:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=VvacIhXm5+dWM/3vic
	sL6NO5wi08iuD3EatXdDnwdVA=; b=IKxX0aIgkyFS4AEcdZ5Mu/XhHsTBm4nmkd
	he8g7GNCGBE2Zha/7YAsJie4vsOnbr0seRC3qH3Ij9FJm+aEZe2NzvPk6sCgNDMh
	un0eCuRi8gfaqhRtJRBgBur2cLSh3rGBZ3Hu6I+Gsb0ajwPveaYQR20zMJrxdSXy
	SlZTEGoeWeVO+82rAA8Jp0ikiz4pX2Sd8NU6xzDtofrv/bE2xQVj+Zl5xT0lKLqk
	PmudvX20IUqNyzJaDg8+7Of2boVrOrkMaCwFe+vdozsqeZE2m7Nn++H/5mEb3zeA
	xx8eoLGIZN8hfrt7OaZtN39NINpw24QQWo7nRMcjxpf2vv9Zf3RA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187xsxjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 15:26:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FEfX6w005650;
	Tue, 15 Apr 2025 15:26:25 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013063.outbound.protection.outlook.com [40.93.20.63])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5vf9tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 15:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPWNrQ1Ppzb6l5eJLgLI7ksSctRiEPnbzpBzDzs5PTxUYPWNInwb/F2gjkQoBkkDvPryFXnx41/EE4zO7yarYkiaxLIuMY2b+ZOc0CWqm53Afw7Lvjmrt1JvtJRQGycdG6Bi+rw4rIVNhoHj7BF9fKS2baWHvhkvUltATEjNhwHErFVGHgNOj3afZEp/8IB0+2EUpgs9CstOrYEPXTBXcN5ntn4m+bdfOh7VEB44A1VkROV4DDXaZOMkIQv5bxkqGlCuuLNaJ0ufPZsIfU2Q40sP2Pccg4KSCEhSS/ZXRQFt5UlIPxjoaLA8lW2jWKIFQ41eJ4sXnObbPy0sZ8qBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvacIhXm5+dWM/3vicsL6NO5wi08iuD3EatXdDnwdVA=;
 b=RpngAmDH+LgcMFfdjO91wzmncxRw07PTEo7hrZLYAn8JP8BbZNt/t7BzgBdmFMB8fjz6dTw8hib8gNsv3PsCFsnyODOlGfBDMOnqrtkFGtkl+/feJRLDgZAaHe7+fMa3f4sNQ8T37Zv1yaC+0twCva4bBF4EnLHGjedE4C0KOpYIU9rwOJ0mGk5egisikvwVijKBboxLyUgCSRIfNjVXfm69+CKthlLaMEOKk5/XOCbtYyiDrdVuBliRq46k2V/Qb84XYXhi+eQvrLQ9x1XuXbs0SB7xCn0G1BvAS0989+/1ubFbSSXgAi5SoetOrNjGP6wxCDfYpt9rqPBiZ7w6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvacIhXm5+dWM/3vicsL6NO5wi08iuD3EatXdDnwdVA=;
 b=RzRBvOFvAo3jt9AQW71eg4c63Du75mdziWWs6sfmgtRsg0wZbWHgtYNtMF8t2KhmZGw0Cb/YYlB8kT3ioQB94HheAmO0Egk1Smv+d3VeRxHj7h3bat/I7hr7g37fHqqjo5Q5GTqT+FKTbasIcGK9VlJ2RhAITpHoHqurisrztpg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB5187.namprd10.prod.outlook.com (2603:10b6:208:334::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 15:26:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 15:26:21 +0000
Date: Tue, 15 Apr 2025 16:26:16 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: corbet@lwn.net, chenhuacai@kernel.org, kernel@xen0n.name,
        akpm@linux-foundation.org, jeffxu@chromium.org,
        Liam.Howlett@oracle.com, kees@kernel.org, hca@linux.ibm.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, xry111@xry111.site, tglx@linutronix.de,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com,
        zhanjun@uniontech.com, niecheng1@uniontech.com,
        guanwentao@uniontech.com
Subject: Re: [PATCH] mseal sysmap: enable LoongArch
Message-ID: <25bad37f-273e-4626-999c-e1890be96182@lucifer.local>
References: <433B5132A1535C98+20250415134933.531084-1-wangyuli@uniontech.com>
 <3de559d6-be19-44bc-ba8f-4c52d4bca684@lucifer.local>
 <6FA8AEB5634BC9F0+99411846-6783-44bf-80c4-8b46ad9d046b@uniontech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6FA8AEB5634BC9F0+99411846-6783-44bf-80c4-8b46ad9d046b@uniontech.com>
X-ClientProxiedBy: LO4P123CA0622.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 43174248-9617-404a-a83d-08dd7c31e01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vwhuDS+5oVDPtEfFwfxHUOPw4eMrUcK6AMZeHxA5tp5Eet90lNtp1xPBCg2B?=
 =?us-ascii?Q?CoqAyG0uTKRFxCVSUFzgcYyj/umknoS8T2hIBoK0axXtYP+/Vh4BzMn/DoeU?=
 =?us-ascii?Q?zTvm3p97g0rJWI1W5PgbB/N6DjhkcXtS3D10QB5BefIazKgEHDROM/iUFvRt?=
 =?us-ascii?Q?SNx7/3mGd5hgalNx0zFsl9XGK/cnY1EzK/Gfr+PE80ThMHvOFGUmlsycXHdF?=
 =?us-ascii?Q?TzPZ8IrWSg+p2jN6c9tpQflQhmMuFzn0MtyR87OQv1u2fSplKebBxlXG1FLO?=
 =?us-ascii?Q?lahNfTxjzlefx0XgV/+ygyvlP+LefkfuwzZMye+3EeAY3GtrO7fOR1bgc5mu?=
 =?us-ascii?Q?eRPO697k+gw8BnVh2G3nyCKvHGzJEnxSrXMm2bPap5i7gNiahsd1wiva1WWe?=
 =?us-ascii?Q?FBfnCOKAuWmTGzjI7+OEfLYNx7l2vmOE3NAhCZxKMEWnSkaJuRUqYRfcTbL+?=
 =?us-ascii?Q?TYabpSmMki1j9VFpXTQ2gIV/ZRmp+Urm+ulqHsEIqYwWx+pDGbB5qWqgAng9?=
 =?us-ascii?Q?y5WdE38eCIIr1mzVB6IYyw11DErrePryneL7twrMoev/Ye+dWR5Ye5W27u8k?=
 =?us-ascii?Q?04plDaAg2MtJcpPrCV76z0sBmvpD+XuESwuNh/7AbA2uX5AzXQkoTopU/7WM?=
 =?us-ascii?Q?Xe/umSIbCleKFFdbXWQuEKkpIDh4Ly1zdpqkUMgtqjs+uRTCCpTSHSU4PWHi?=
 =?us-ascii?Q?Xylf+iWQqQAzt0p8u6jU7TW/JCq/nPzRaV9Obg5Pd1L7QNzS/+6lJQzoIrcc?=
 =?us-ascii?Q?pqsYcQpydh9gSW8Q02xe9yT+AvDFAdy4GaWc22yAkSFqm3CTGodlsaeptlfM?=
 =?us-ascii?Q?3xgr0aO/CdxoOBSvDN+ReOlIiUZIRf6lY+SkLMXfcdTlgTTOcA+hDZt8Q2ol?=
 =?us-ascii?Q?uaiThfYuvVLgKzUumqPkK2+4j7OGHTvGJ3DNhACKYrAirzVUqjeH1IzUCFMg?=
 =?us-ascii?Q?A5JjGgTdg1VQRjLC0akBgwCQtM1rbxJK5bEoTPwavkOIn0+uVB80n1pJsS5G?=
 =?us-ascii?Q?LODpxdfqKFEnbkXKtYP6dSKVS72Z0vcb+d+jsKXSLF5iE/2O/A3EmBpbUein?=
 =?us-ascii?Q?fekApMzAOc95MziTEjBpoptBTkAIhFjTedrQbE2BDSZ3XtYq1rAu8RCmGuTY?=
 =?us-ascii?Q?2yduozOkH4HIDtC+ViLdy9llaygFWVP7M/P+Q5Lxb6hh26kjsEcjhfvULiGw?=
 =?us-ascii?Q?v7DzJJDrS0JZ7WcfexK/hIW9ezqrBTulNUumiK8fjlff26j3lZSMoT6mFVHq?=
 =?us-ascii?Q?dbsUtjm0j81Na6XfpDKQqN7UaTghULPVM206yabOtCfNAGg/tOcvfYH1XYhH?=
 =?us-ascii?Q?vnIQyjSiRD+jLz2jm1rmEm58hu9CnjSJTgJq2PEr4Wt1nMgTVib58v8oYVsQ?=
 =?us-ascii?Q?oqKXt7YuxrZZYTSP+gGIr3T+nQwNDXOQxcJLbxCVzd+p/Ttyx4HFysfLDeWg?=
 =?us-ascii?Q?L+zrh74YaNY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jBZwbKPv8kKhZGv5JFIojMcQIxvgnxcqVmEGJ5jUeVKmyyVaAQ+JljYRLYvE?=
 =?us-ascii?Q?yJGN4iz/ryFLybXD6/jAsffkmIO7G10qLK+SvqwgOER6Dv/YQ+4TGFq2eJrS?=
 =?us-ascii?Q?gsu75NcWQcstRZfYXIbuSNKkbSmPuiwk0aakDpa2Q0tfXiP0O9fGIdw3wBOD?=
 =?us-ascii?Q?HeQdzxMdyz4rzej4dRy5yioQYxPrLimW4NGd91jytQ8/dC69/n7V0YzxGfDx?=
 =?us-ascii?Q?sVixrA7Ylk+jWuCAmq7fJuW4QOnrrIvhs/AlQtBgxrAgTeLUA1v7Fu53G9hF?=
 =?us-ascii?Q?6Z4PEZkSw9C4Kvmxts1dCRpAEkGP0O4F60J4uJkw1YvjwIt62rGdoqcX1mKe?=
 =?us-ascii?Q?HLUyGBQSeqoNcPdM0Uu6DE3y5CPWvbZ0jeOM/PJreYxRPWN2Z4+6BotME8Hw?=
 =?us-ascii?Q?YdaVPjd9HJoh7OldYay4DUjSGDXFQ9+XhPx0YESPF0bM4eTwA92V2Mn0lIA0?=
 =?us-ascii?Q?2znN+nRg/XVti/dk9qeK/FWThbDC5hHZDyYMbMjaSWzXceZtyNjF34XAPNRy?=
 =?us-ascii?Q?VdBsnvi9lYSbVdcYSQB/3t+gIyPakEO8meaxxlyG79Ys3OaWoxo/8/gjB3h6?=
 =?us-ascii?Q?npj4iOOvBvBUtRhYufvz8yRVSg3FJUOkHQaVY7WZacEnpEpon/WNxo3+eilm?=
 =?us-ascii?Q?u/JZPgJV8HDObDpzKalThw3cgnW/0I+Ojn3awkVSNdV4smTZdBGo0j6a69z/?=
 =?us-ascii?Q?v0AoKauxwNPvsWkbGrtTz1W9owpq3tLrsBqhDiHV7MhM1fyyH1pMvzt2k/lY?=
 =?us-ascii?Q?JWSKorXnjENnpN9ON3zydjwOZfpJ7Sq9tySkrbItvKZ7VmuuW7Ex+Bkww7k3?=
 =?us-ascii?Q?nI/u5NjSnxPh55aiCp6MPeh2gTwnTJT11SYbkxmXw1aD14Sc3C/tNCaCkPVj?=
 =?us-ascii?Q?KvYwakLhe1mSxU4ebOj1fum7olsTOdhxCluflx0JWW7939jF4Xk7njkuf4Pp?=
 =?us-ascii?Q?1hL/6/HejlVgazCzJ/YWl0gu4iBLeylWYDVevqPueICMEKL+6tWTa6n+X4dW?=
 =?us-ascii?Q?uwUX10qu/Db64FRUzYbvEfvFPvfjeTGmh4GdgLx0XnHHoL/Tua1dmi+JGBZ/?=
 =?us-ascii?Q?Avf727rfvy47+D6VjGQS4aIi8N/kFJRnm/PxUBvokCC7BNn8rYWjmUxK7A5P?=
 =?us-ascii?Q?gao4xLSy7jkanQ3G5Jd9Fs8FKa3C5CvmAK1axN0gC2VUo9KF/a3cxfi+Z5P3?=
 =?us-ascii?Q?u4kWYCk4a1uCxP3W3qPvfwEf48XT2hYETCbrU9i+wFes+B+JqJxbjod1ULZ6?=
 =?us-ascii?Q?7f1TjIfgmFuSIq048EyoEDRS1PI5Ubcua8PpmZl9yxiOAs0nrEk6TVibyYpB?=
 =?us-ascii?Q?8e6X/S0zKTWjw1B+YcXkbDnP4g/UIyM2rkZ4oK2WZcMcTGKADesGWHCoPoG4?=
 =?us-ascii?Q?zV47Tg6i3wF964+igIZxPjJ7GJpeQsFiOOol39yhAEQd3eaaNWcq1ZoavtOc?=
 =?us-ascii?Q?QDxrrlaD9pF08BoFS9PlDJcBJcKo/H2Ra/6LFaMHaWeZlVUuFrzpmiCbwkJj?=
 =?us-ascii?Q?8n3d8CQhOycn92vQTaAycxhdzY7naACffzsG8UCnGYqNPcVzJMLS/z7P72dE?=
 =?us-ascii?Q?coW2uM0KcGX/dv/p5xpgwS3+TJk4WqLZ36qf0yC4ctAKv/CeR7L5h/E4Lgkc?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nmv75DqsoVGNMb8Y7LZEsyL4z+80sWRaX+SS04ndV/DOqyniDXW1cLUipr6gn3S2a6ptk15H1UEmVKdPS0bBtVCQ1kvqYwJUrfJEG/fNF57F+ukuMMIZxSAqzfjzS0fFiS8BFcqI9gjkd838KQIT6gRRQVUguHXeEcbqwSkcV/C72a7pfFP4qpBKZv9uIKUT+X0Hg+PYNyX+CoSIg11T0B660/RYvFabzfIP3lMCCH3kyMXPsZh55ZZ/+Lwk+65iOvUOoIb+Dx2E052MajPoJMVvvcwZnw9dzsjQXPeyd2ITlLVvTmEmExpYa2Dp53+S7jcXEspel1k81Qx1p7W1OnhAssqnRcgNRz0K1pQxo2vemsZQ940CFejhU+sRBy6/2oKjgvJNL/NGuhG31bHEXiziM0y15tNtim+tRaZzlyzpXAc7GbWXkMCiC1g3qrju+KXkxXP82LVpMh7AJWOGXJCsZPfa3LyivO8iun99aO/kOqn0SnROu1Gev1GvhNj4d0AOF+ZLIR0IvIjw6RK5H+xDaGthevKClwLcYMvoXL6WaCTbB30VFBekDCJmILeZmmC8Ny5pCIGgSScx2+AXyd+7GrEulJOaGPyzWLd4nFc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43174248-9617-404a-a83d-08dd7c31e01d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:26:21.2958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmkAjHp8YBeJ8BRJFvwu609TYmfI9K9un+j8QCJ7fmCWG/H3M3b6fxvTh1tyODc1xF9qanFFkQmA8bhgTdGM1JkInkP+rryQjOAEW9peVnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=756
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150108
X-Proofpoint-GUID: HbGMiWmHnG1zmt4Ia7gZdhLGQ7KSokIh
X-Proofpoint-ORIG-GUID: HbGMiWmHnG1zmt4Ia7gZdhLGQ7KSokIh

On Tue, Apr 15, 2025 at 11:09:37PM +0800, WangYuli wrote:
> Hi Lorenzo Stoakes,
>
> On 2025/4/15 21:58, Lorenzo Stoakes wrote:
> > I'm sure it's fine, but I am yet to encounter somebody enabling this for an
> > arch and saying 'I have checked to ensure we in no way rely on remapping
> > the VDSO, VVAR or any other special mapping'.
> >
> > Because if you haven't, doing this breaks your arch.
> >
> > I hate to sound like a grumpy maintainer, but could I just ask to check
> > whether you have, indeed, confirmed this? :)
>
> I've done some real-world testing before submitting.
>
> Before enabling MSEAL_SYSTEM_MAPPINGS, vdso/vvar is not sealed; after
> enabling MSEAL_SYSTEM_MAPPINGS, vdso/vvar is sealed.
>
> I tested the boot and shutdown of the Deepin 23 distribution, web Browse
> with Firefox, and document editing with LibreOffice both before and after
> enabling it, and I didn't encounter any issues (MSEAL_SYSTEM_MAPPINGS does
> cause a noticeable performance drop when outputting images via simple_drm,
> but I think this is expected).

I don't know why there would be any performance impact?... there shouldn't
be.

No this doesn't suffice, though thanks for doing this and confirming!

You need to examine the arch specific code to ensure there is no code that
remaps any of these system mappings.

I went and checked <grumpy maintainer>(100% of arches submitted now it's
been me who's checked so far :)</grumpy maintainer> and it appears that
there is no such issue.

So we seem to be good.

>
> Of course, I also ran the self-tests provided by
> tools/testing/selftests/mseal_system_mappings, and all tests passed.
>
> I wanted to confirm if "breaks your arch" refers to the above?
>
> Do I need to perform any other kinds of tests to ensure the validity of this
> submission?
>
> > If so then all good.
> >
> > I also think we have a table somewhere in a doc that needs updating then?
> > Jeff, can you confirm?

This is Documentation/features/core/mseal_sys_mappings/arch-support.txt I
believe btw.

> >
> > Thanks!
> >
> Thanks!
>
> --
> WangYuli

Overall if you send a v2 with doc changes I can ack maybe, but necessary to
get a R-b from arch maintainers and I'd suggest it going through the arch
tree.
