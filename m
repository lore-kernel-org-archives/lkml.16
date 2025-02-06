Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E394239563
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862093; cv=fail; b=ZdsFUCOMlAYau8dFtzdJ3bTAl5YziFnPFX+hvdvEmEvbGKRJ8ufHDTKts79IB2wgTnAuiIhmbDYzHMgf4Em7aIZdh50a995q5546mcMM45ZbH0OnawdGRwGRe2kLr2HL49V+9+1YbXcLJoYSoaINT6jP6hmdRyyal6Jtvn790PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862093; c=relaxed/simple;
	bh=kM9bEgIeOn2xFHHULy9q18YUEVpDQlv93fRr63uHDxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qlSI1Et0Jgru2opLOppU1ArWnHWLi58QAYDdLdr+DNg5TI8QtJsQJpnyh7SvumbDGCT6YIhX2CqKVCVvpDBnlwd5abV3UFALTNHg4OIyFBTa+cUEMn+jM4aebl8DGrTVq59HipL/xO5QrcodXAb9wgHdYxxLUOBjcmy9s9uwH1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TwmDcJBV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MTDQ/vso; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TwmDcJBV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MTDQ/vso"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516G3IEu031550;
	Thu, 6 Feb 2025 17:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=FHWojXtqwEsMmP8lgP
	r32vD1Hg7MBsNdCoKLwjTL9ws=; b=TwmDcJBVgOqazTfdHotJQb1AgYCsBlANa+
	861Z7AHMuZrfzvOCt4Q1sLrnr+F6Yfuk2KyFawTo/FXS9975bWRuKoFofpaPF1j2
	q2Pkj/SHxYBtIAltUHz8R5mo9BBfM1ZJUCFid3lBNYkKmhko3BX9l8ldjZolA3Cd
	KJv6nWxnerxbqXWYyDnQHZnv3HhCDR6CfOTqIzf1zn4yL2XMCdyvoDPEwFnps007
	Qx5hxlGdMFnHrisSVhKqGzUTcBlzCZ1G+AfnVc8OXPS31LThxd/o71WuW/RV2nt4
	zt0IQvB4TZjnEVcI2v7+ZfSFuhyIYpoLB7IrgC80xe14AVSds66A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44mqk894q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 17:14:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 516G705j023688;
	Thu, 6 Feb 2025 17:14:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8gm182h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 17:14:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBj/88zQMq98mbU3fboJ+PTDgZEh6rl0vudBKTnYD9aFLL4WFPymaLeFhcFRLeAysygtRVcQkfZZDqZRd53HGKwTYlz/ucNT3USTSp+xR6nAcswO7VVKzuAjBushwI8SdNAujWYcQdiBFqU0LI0Qp/ov2Qjnnk1owUddqfZS07PTkESJPb+sTbVHSg4moKYhxJ57lAQ7gHcek1UOV88qROpiQFnuEG2iOzirBuOMCp9X8Ax8RYWndhSQkuVVWvsuliuTfeGBRtBx6wD2Xo4vO4leBJv0i7i/HRMpW2XjWaeJxM278dO67Q8KRtErIPykOOfuBmmJ4zHnRT88X/dufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHWojXtqwEsMmP8lgPr32vD1Hg7MBsNdCoKLwjTL9ws=;
 b=VlV+AbrCEB9D2XBR+oRThWzD1W0t/OAsxSJPPhxKvIUGUr/wF/2qGvaB4j+y2XnJNYumSGgwhGlq7fFe7BggIsXphqAVwnzsH72QIzKq7GUjqfzFLM2FPPxJhuSkAlTFInVpoy/lXyviQC0JtUjs/0eEZR8HWEtRmEd/syr314LX8cS2KGeoSsorRons3O9VY+6dbryGmHPZZumhaPjEHsk24mkE3M5nYWsifMRgzirCniM3qF0UAc2v6UDUIY08SBwmL7FuHYGII+PRjw5AB1tBWvcO9jl1fHzQTgZjJY82ea/UJgYYOlPtA9BI8+fRhKoDY9P3eFKz2U5BO1Zkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHWojXtqwEsMmP8lgPr32vD1Hg7MBsNdCoKLwjTL9ws=;
 b=MTDQ/vsoS7ABDNelwIV+Xrfp9flgWYFHCZS4YJqksMC9SH3XBZvdGjz2q4vJp6cJ39GTVy6Y3izGwJ25hFL9l0jkwdh7h0q3oTxsTxA33GvqUF+jTrq10GcmaY/W/0917fTckTfDYqjw8xIhKkwn+RBDf7bYqVt+Qj1bsZdz6ZU=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH8PR10MB6339.namprd10.prod.outlook.com (2603:10b6:510:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Thu, 6 Feb
 2025 17:14:37 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 17:14:37 +0000
Date: Thu, 6 Feb 2025 12:14:34 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] reduce tasklist_lock hold time on exit and do
 some pid cleanup
Message-ID: <572h7chpl6z5ldizh3oh63olcyb6vyh4k4lq7ozmpwnqybkfxo@qarxk4rdndig>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250206164415.450051-1-mjguzik@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206164415.450051-1-mjguzik@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0308.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::19) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH8PR10MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 541ee442-4b72-410d-1d93-08dd46d1bc1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?99bxX/ctupTvVYv76Qxpe/cydlctfFZEZQ0Q5oOeSTcFyn237Fog9yNByHFl?=
 =?us-ascii?Q?JHmVDNFoSba51UnvN82cwYIfuQeYXWFmtz0wEZ1b9UXpj/Y9XRZwM4FPMU5R?=
 =?us-ascii?Q?t45v4McCVo3f01LFLWLJQGSvxWS66aQtooMouzpRm46LOq5JUNot4u+yL2zA?=
 =?us-ascii?Q?jx+5HNoq4wlGnYm4WG+xjpPloIMOdtEfNoN/iSouSKzq6fZawjWskfXIFgWE?=
 =?us-ascii?Q?s++HIYYMLcEeYOTqiQVAfxqQMZTCa2cElMZkUqaaeKFAoCXV57//fQZQc8Mn?=
 =?us-ascii?Q?YcqPJ22w52s6innLf2FKjSa0HjquO0SIM3BP0gg3Rf5NYw0V2Gw9SLAFkEZr?=
 =?us-ascii?Q?IYyoefiMEl4SjSEf7+T1jXPuGQ3Kgy9nALlXWIA1wl+JOLWHpUCadRtEQBGj?=
 =?us-ascii?Q?SFu2haOH4yzmMwrzKTay/SHGBWJWkvpzVVBfgMYXEo45axzlEguivacDuiU6?=
 =?us-ascii?Q?VflG+W1Nuidvv5T4+x4ooSCRlJ/qcKVM6VQxkIBbGHwCHEjpdjpBqxNxe0dE?=
 =?us-ascii?Q?cLfaiRkGLIZp3hrGPwf0L/BtHVhsP45YjjRA2J50Nk/mbRpXn9ubKNngoqLu?=
 =?us-ascii?Q?Iy7SAwjbmNJSQTXbTObY694ROJe2NOAGY7VNHi1bui9EOAP+YkoFsmcod+N3?=
 =?us-ascii?Q?BNLa7KipqnekUQC+l7F3G+xXpD6ZNcyg7EMu8pb8k8z5yZFuQb9v7lwZwt7L?=
 =?us-ascii?Q?Zf5wJnTJ2koh9O2fJ44fAxtg8olVoVOZFiP90P8QuvwILB/yYSoS+Cb4QYm9?=
 =?us-ascii?Q?CZLm7GMXec9AKXInNltJeRT881dN+AlYSgPAM65ED4xlqgSb2ZHNVveny9qW?=
 =?us-ascii?Q?bgdHHhM7OuF2i2JqVuNjIP+dry7AU9mh/S9m/CImSli5pQeY1thWq8lZ5w7X?=
 =?us-ascii?Q?9sIrEN8iVQgM2ahlrzT1GSArmXcf4J5Z8k7eBKLTc/z6tSAtYx4VXV2IlL2+?=
 =?us-ascii?Q?demuRs+uo6qfa3WZ8b9Vi15g8JnEoFNynALfhI4Zng+TV2+PbCBcEauOu2al?=
 =?us-ascii?Q?IlD3QaNdv0Gz0kDcBUbcukz19ZtvQKDHHR3vgk30+iBDfHif6mbd/0FZS+kO?=
 =?us-ascii?Q?cVC17rgAoY8v/e5iusIMe/1TiFTuABQGInbYKA5erTIZy9DGFTuSdD9y+GdQ?=
 =?us-ascii?Q?HfbP7dz9msRzvIyRoGXdQ31OB+iBwYCD8ygUXyFgf4+DBTt1ot3vlDKcnzWu?=
 =?us-ascii?Q?vfG7QRNRgKT7/IRIgOY9OGoKIsxaMkJZNqxLxKVALV7Eh6c7Xbv/Kvqp0Oaa?=
 =?us-ascii?Q?8gl/7gsnF6TLdkwtqIGNSegbWwXPhTnwGxjATRD9aPy/B9dU8K0MNcoN80hN?=
 =?us-ascii?Q?IGWfFDE4KlPNE6dh6lDtVe2gOUovMY/4C0dCMFc+otpBVpfF88VgwVFAuexA?=
 =?us-ascii?Q?LwBAyLMzzZffSOsAvEK9E7wvaYQq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r9eEpD2+h8WKAzIEVZmHpVzFkWdD40hhioEaZkM9BMAtFV2xT2+wj5a9oYxW?=
 =?us-ascii?Q?y3Hm6a54UFWueiRB+txwBk+ZTVTkh2B8Ph5ko60p9+16d74LZ2XS7Wk9AXUh?=
 =?us-ascii?Q?QUezxJoDbri4heMXYJRAgkR34HMwQq0dN0ojuHiNxrTroITWYK02eJDlQ0xQ?=
 =?us-ascii?Q?eN1K5z1t2N85eKR0zHv+Hfur+b6X9MDlJiSLXVIJi0nEPxTj9DVPv8W27gro?=
 =?us-ascii?Q?LA6RFRUAFfL9qcAs61pFB8unTqPPZVkrBuoLOPo7FQI128Y+mJpmmA7fb9n6?=
 =?us-ascii?Q?KKsWC6o7J5rqOd5DHFYtpUbPJsgaXa60nIKazoq3Xb5NGORZGLjU8O8hqb4/?=
 =?us-ascii?Q?A5wOgGQsBpwapt+mn67oT9znrUtP5nBgMZXG46V1pJxT8bosuz7arlgR/IHw?=
 =?us-ascii?Q?GrSs2h3QCODgQBuMR8/7BS8ZsNSF7jBaSG8it47DD8ItSYvsm3a1rDSbWJ25?=
 =?us-ascii?Q?ue49R6SlPfGJR6vtsIc0ZMKQ0xkZEK7OJeWGUNmRh4CBrvLbov5K10rzePZh?=
 =?us-ascii?Q?oDbMUrQMdf+eU2b+i8z5p4pzq0nyzIHiWUE5Y9toRtSdNNazuWQB4226xPVb?=
 =?us-ascii?Q?PTUubTfE6MnFhi8NtgVDOYFYxON8hPa59Y29li9Jih36kHeqlGnXhfYy8YGi?=
 =?us-ascii?Q?cCuIBM/KsLarOvlAVkeR2n3Eldmltjni/ZUXilm/YDmUi55q/5m60KJJOa1J?=
 =?us-ascii?Q?3798Hu71Efe8oC1sqALZ3qNcEzN/uAhtrkR6itHCINp6LtSi9HC9ElMO01tI?=
 =?us-ascii?Q?k56KkAbI+efqc0ZuVHzQg+y5glXl9itswF8Y4MjvJvdn030Auh83yY5q2Nrw?=
 =?us-ascii?Q?tA9Q87PAambCrMv2v5RZULaU/y4p0yTUSH5Rb/RqkHWIcJsxjCEfkHD8i+t1?=
 =?us-ascii?Q?Dyp3Dcs+/YnISRmawi/4QZQNNPAFbVTFIVN3s+zUmPYcCbC63cqvHIiIIdYI?=
 =?us-ascii?Q?eVTWH7nB8jd3D7BxHVhIBLgpcHQUeqb2zsYh8Mlz8Qs3xIqx9Ax40bNuUpDY?=
 =?us-ascii?Q?PRalhSlsPYJrqGM7pk+iR9rWRqWXpSCPGJJIqYGYIr0jXB548mcwtUs1SUxd?=
 =?us-ascii?Q?tyWhPhs+EwybcB1T5Zonoam8w90FtGb5tvXgmVicMhMgc+FV62IWGKtdWfv2?=
 =?us-ascii?Q?+IJpJTIRdFFHkVqUa4lDmjg4RppXpAo/3iIk8IK4YGxZr1pRqCR0Lc5wWHin?=
 =?us-ascii?Q?HJBKN1dKHxFCoGh/ZzMl5OlHzQgH/sz2VngRlMk6AsXfmZCJmGeijbyu58MD?=
 =?us-ascii?Q?GN6P2SwewKoPkcnj5E6qKKevQHq0lrjV2Z525mv33qpZFZpeGAKUl+WM0oQ/?=
 =?us-ascii?Q?4kr+3LmOoMfnoPcybk7u/T4IH46/3zoi3sQgPiLNYlvEntkyx9+mrIzwk9Wf?=
 =?us-ascii?Q?HPAHJNzWj1WN14TsodbMAGC2TFe37wakt4TbU92qZUyiUrhxndh5aNGPWwME?=
 =?us-ascii?Q?kQKM4qGRLzBSxoKytSFK13zWyfWTbmMQba54k/BbVN70XM5I7Ndec8j6OpWn?=
 =?us-ascii?Q?Gzy7JgK+GIQZZVS8WiFb7y8M0Mcu+hMxbSgKz5vd9m7Az1GyNtXaHcQ4JW/q?=
 =?us-ascii?Q?rx0RLa8+uCuclwrhplqmsTkCCbW8URgPUJtG5TbY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2JCXuf7I37lJoXNj6c+9KL7pjByuNO1XSJ8dlmtT+kQh3rApX5h2lZdTr2ju84dBCpANkse2EMvQ1sX9UlGwroD+ECI2kmiBWIUmhfpBlXP7FwmiC07kjqwzgzfssoy+znMtDtv2RHgztvBDu2HBm9P9AjnU0lmMh/y39W9UmYIRhdE1Yxm9RGZdOuTis9XS3J1o8yB2cjck2hopqpuV0G9Islm9v/Nyv57UpCyvyH34XBEqd3CURnD8lS40UUqs8DMO0NMY/j1mdFt8jCLUdtPf/m93am8WXVg3L5FmZVaBdXDlCtHopTIfxv1ByIMGet6OltRuww9rpFMWYIjidczDhpZ3sgMLqwdAXmoz1EcnMdblEQUb4Cj6PD2/VD5hBmADo+wIm9wxTxBC2vGA6iGLPhAiD33D3aFgrz8utsr3unQJxGyyK31P0wbwxKyk5JWsVtC0kSqrjrtl8b2K7h8Ddh74r2BdoglPoPoOyplPhw1GLhUgA8Ex0dbpSK5vW4f+QVQl7imtAmOUTgoLDUQEz97FeEIHsOGxH2ooaRaY0VgjbEuSTfzT6e4K436NfPlsrWfxOqXRQx2ez2FHednVpDHcz0ZsTlEe5yuteOw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541ee442-4b72-410d-1d93-08dd46d1bc1f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 17:14:37.6353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY818AgEYkImkw1CeCC8ugVtf5iwbwtz9pZA3NUd2g6BUOwAL+OeXSyhbHq5K9HsAqfGz7rROqze5Y9I/Y8G8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6339
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_05,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=959 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060139
X-Proofpoint-GUID: nfBg9FkqATTz3eUhg6LDuD_ae-I1ZEOF
X-Proofpoint-ORIG-GUID: nfBg9FkqATTz3eUhg6LDuD_ae-I1ZEOF

* Mateusz Guzik <mjguzik@gmail.com> [250206 11:44]:
> I fixed fat-fingering and touchedup some commit messages. git diff
> between the old and new branch does not show any code changes.


Thanks for doing these changes.

Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> 
> hopefully we will be done here after this iteration 8->
> 
> old cover letter:
> 
> The clone side contends against exit side in a way which avoidably
> exacerbates the problem by the latter waiting on locks held by the
> former while holding the tasklist_lock.
> 
> Whacking this for both add_device_randomness and pids allocation gives
> me a 15% speed up for thread creation/destruction in a 24-core vm.
> 
> The random patch is worth about 4%.
> 
> The new bottleneck is pidmap_lock itself, with the biggest problem being
> the allocation itself taking the lock *twice*.
> 
> Bench (plop into will-it-scale):
> $ cat tests/threadspawn1.c
> 
> char *testcase_description = "Thread creation and teardown";
> 
> static void *worker(void *arg)
> {
> 	return (NULL);
> }
> 
> void testcase(unsigned long long *iterations, unsigned long nr)
> {
> 	pthread_t thread;
> 	int error;
> 
> 	while (1) {
> 		error = pthread_create(&thread, NULL, worker, NULL);
> 		assert(error == 0);
> 		error = pthread_join(thread, NULL);
> 		assert(error == 0);
> 		(*iterations)++;
> 	}
> }
> 
> v6:
> - expand on the commit message in 3/5 pid: sprinkle tasklist_lock asserts
> - move fat-fingered free_pids call to the right patch
> 
> v5:
> - whack scripts/selinux/genheaders/genheaders which accidentally got in
> - rebased on next-20250205
> 
> v4:
> - justify moving get_pid in the commit message with a one-liner
> - drop the tty unref patch -- it is completely optional and Oleg has his
>   own variant
> - add the ACK by Oleg
> 
> v3:
> - keep procfs flush where it was, instead hoist get_pid outside of the
>   lock
> - make detach_pid et al accept an array argument of pids to populate
> - sprinkle asserts
> - drop irq trips around pidmap_lock
> - move tty unref outside of tasklist_lock
> 
> 
> 
> Mateusz Guzik (5):
>   exit: perform add_device_randomness() without tasklist_lock
>   exit: hoist get_pid() in release_task() outside of tasklist_lock
>   pid: sprinkle tasklist_lock asserts
>   pid: perform free_pid() calls outside of tasklist_lock
>   pid: drop irq disablement around pidmap_lock
> 
>  include/linux/pid.h |  7 ++--
>  kernel/exit.c       | 36 +++++++++++++-------
>  kernel/pid.c        | 82 +++++++++++++++++++++++++--------------------
>  kernel/sys.c        | 14 +++++---
>  4 files changed, 82 insertions(+), 57 deletions(-)
> 
> -- 
> 2.43.0
> 
