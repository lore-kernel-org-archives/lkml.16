Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79661A9B32
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744219847; cv=fail; b=sAXDGLlmxyAq5ZPbDuftt0KbgHspfZxhKLqfInJTlsyy9qdHQR2drfTXrE50TjUH459jkMxmnoDCLFOUfqIeP0doFsNGflrEcg0KbBmAj5b/BVLBmg33ktayno9+aOgBmr0LWZGr9Iz2XmKDIEwR2Czm93Wtw1lIlp46eNV9YZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744219847; c=relaxed/simple;
	bh=B+5ZIvs/gAe1CEgNeS67KtEBjeiPFdWh2vtoWKWKj9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dxfJD3QLd5Bstr+grYlg7P8exQwmZeMuV+JAoauT1uFd5DcRHFOVV7RxBdLOEgol8qZG9AUKXDqLs9dVHmwHBsEPL7KSqqM4clen8pdPjszyd5OgVBaaF4vl1xN1stUna0USSFjmh0IVjGNTSCLVPEiEZKPwfr3Ds8u36ujquVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nKSNYaiY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v8LK9FxM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nKSNYaiY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v8LK9FxM"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Gu0tB020054;
	Wed, 9 Apr 2025 17:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=mpfktZoththLF2MQxJ+/htW+V+CFZoHLULaH2cA7cxE=; b=
	nKSNYaiYVqDwrm7+c9+VAAkcc0Sb+kmfS5sIwrZSoXQ+7kEw01z4IBIWXQVhIBkf
	ZIktXRoy6OcBcaU+gJVXUBsI3oZWZlWqFJWQ/kJ0iGb2bjgIi9OzHuhIrlJ7Z8xC
	9fY8p6I+7wwq453+kJj2aQuCFgV+nNSfyzuBYyDcFBtpx4rHICSYGG8Da/tTCdzJ
	4GNgaXYmeRShr5isVmB557lkNiZxnsV8qWY5W8GsEPYvQzZ9mj3tfrnVP1Kq2Ss5
	AgeK3unZd3OKoq+AIxkTgRXKgdAAXqS70pCgNQNUOxxRjG8vsXu1LrJAuVxp/Pdu
	ZGLoiwbsMdQ/lBV3iZPPyw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45ttxcyp32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 17:30:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 539GFVOS016332;
	Wed, 9 Apr 2025 17:30:32 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010003.outbound.protection.outlook.com [40.93.13.3])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyb33vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 17:30:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2AfOa10bqjTAOlb3usbGStKxtqXTZ/BQxxt58BdI8eU0VMQwpmzU9Ne9My8COx/MQY1sh6SbgICVsrOml7IhM8iBLq31Z7qfctQSJlurf1FiFBmxw/Wg1crERCucK7vdP28aedHNN1hwvKCCfJBoJ5zju47xZYDf4vjwKbGWwPiklyzyDoL2Qsqi0S3LLNN7gsP2oB07XTz+2MzG0OFpa5UYZx2XxUtXv9VB5heIgvo2pQ0lhCsAOG6rFJ3Xa+VFqv8CG/VqPvfqoBGwHQyA9O0YBa9mapdh50RgpEciOGtSVwkJjy4RuPCkK09tFcqFMCYj8cv0p2dMtNrGYtRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpfktZoththLF2MQxJ+/htW+V+CFZoHLULaH2cA7cxE=;
 b=nuphyuqcHSB7tLx5dE2ha3Sn2lCHMsxLnZCNw8erxhY5XuzsnCKhVyBumMvBTngX37p12ecOqHAR2j/HM9Le0UCA7RsNjHPgNQ2AvbArEf4dMNTP2psn/0oHbM5XclRdsjSE9SptPp4U9e6UdgHgpaKR6w7e5WH9PZCOCstQM3jmDATXeBqk7BOlxWcPEdExI1DJvEWltb0C7B7PYEsprzpk8dwxCtXZL8hGEo0rQYlJ+k1LUvcGxyK3wrnVLdJGN6T6k7F+0HeMY0E4BzNnqfn0dgJ4FMyBoqNSQA6KCqbblY+lzQF8385GZ5tkgCy2GvJ/b2R7JFxG3zl4/mre/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpfktZoththLF2MQxJ+/htW+V+CFZoHLULaH2cA7cxE=;
 b=v8LK9FxMAZmOA7v/1WZ9SpadNUbbsKNW7p/Tb6inGUDm34caQKxt2kolAb/ArZqgoEbmVb/LGFimreVF+YyFDETyb3gZG0pQdIwHqEOS8bCKdY/1BQKK8Z+40AHIM6lU7IWux0lopsyFL2r3n+ZvmH3ZPN0gxI60xWe9tjTe+0A=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4280.namprd10.prod.outlook.com (2603:10b6:610:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Wed, 9 Apr
 2025 17:30:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 17:30:23 +0000
Date: Wed, 9 Apr 2025 18:30:20 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Aleksandr Nogikh <nogikh@google.com>
Cc: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>,
        Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: [syzbot] [mm?] general protection fault in mremap
Message-ID: <f2d77295-ab4f-4557-81dd-40039754e643@lucifer.local>
References: <67f1c7df.050a0220.0a13.0256.GAE@google.com>
 <07a22812-4f5b-44e2-a4ce-ad0537934041@lucifer.local>
 <CANp29Y7TnFB9eTEDoG5gjoeEkv7mt4GXNYDRz7xnaOhGfcg84A@mail.gmail.com>
 <6efd1c14-2253-4b7d-a647-dce471ffff6f@lucifer.local>
 <CANp29Y56cNQDGG_0bZEzVedee_rcDKPs28kb=D0-0seRKpbrXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANp29Y56cNQDGG_0bZEzVedee_rcDKPs28kb=D0-0seRKpbrXA@mail.gmail.com>
X-ClientProxiedBy: LO4P302CA0042.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4280:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c274679-a4cb-461b-4ee1-08dd778c3555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXJaUTNNbldUaWZhSS83NUxicjRqVzJtU3Z5SHprRXpYNnozOVRpSDFCai9o?=
 =?utf-8?B?NTE1cVRJVHI5aHRrcm1iS01yZm9vSzk0ZVEyc0Fma2h3M3d5cEFsNExwSVV3?=
 =?utf-8?B?alpGQi9IQTV2UDhpb0xWZ3YvOVZVaEMrSlc2cTRVZW9SeUpkRGtBb0RsSlA2?=
 =?utf-8?B?cWZUR2tvVm1wdEIvVXhmU1VDR0x4bktKaXZKNThjTm01OEF2ZVdJSjRBdkdT?=
 =?utf-8?B?NUJlQW4vQ0Y4cjNyTnk0bTR4RE5RTTNGM29wVUJGempWbHV6N2FxTHhrQTVl?=
 =?utf-8?B?d1B3UVFZUlhWTmVReG1JSHJibmtraDU4dzkweFNNVnZ4R2JZRkNjOHhlU2pa?=
 =?utf-8?B?b09kYTdPRm9wbmo4ZlprZy93RFJUTUprSGNTL2R2NHpwcEFSSkFlU0svMGM3?=
 =?utf-8?B?cXk0VC9YbnF0UE5wTFd2V2NaaTdnSWZnUkM3anV3QTczeXBGa0FvaTFlbEV3?=
 =?utf-8?B?UFd6dndXUnlIUTJyL3B2eVlLT0ZmMWFqLzhLTFgzQU9ISlpuYmlEdHc2RjBC?=
 =?utf-8?B?YXd5Mzg2UUt5K0Npc3FRemV0NTVhb080c09rVExadEtQQlBNTkZHYVVFaGNi?=
 =?utf-8?B?ZHdOblZKZE1PeUU2bmlCZ21MdEVLRmNvRzY4MkpDUjc3eUJwWFNhNi9oZEZu?=
 =?utf-8?B?OUdiTVBYK3RCSkUreGZ4dFZxV1pEdVZiNndCRERhNlZCR3BGRFJCcmdiNWNh?=
 =?utf-8?B?REJvUHh5UFNqSmJjQVNCYjBzSm1TRzR0bzdPUkptckpKQ1h6M1h1dDZrWEth?=
 =?utf-8?B?cFpNdnYzYzVIdXNGOU4xU0EzWlMzeitObXFzOTRjL09VZ2twQlFYWFlpdHFK?=
 =?utf-8?B?VkhUOEQ5WEVHVkJlV3JVN3Zua2lEM1lvMjF2a2RoNlVyWk81dW1vU2VMalRq?=
 =?utf-8?B?T081M2gxTDh0WkdnSkdEamJDVXFndlQ3cldIaVVET3R6YTFKem1wc0YvZSs5?=
 =?utf-8?B?T1M4ZjZ1a0VRczBYenZacjFZTzFIN3p3UmhnT2loVVc4cVdoL3BZTFExWW9k?=
 =?utf-8?B?TjNLYXZ3a3VxbWJkajFUNnBsYnFTVE5IZ3FLQktmV1F5RHJKTEVKNHNVNzN3?=
 =?utf-8?B?UmovMUdZdEN6dXVqSC9Ca2QzUys5VGl0c3RmWW1ueFIzdU5KVHQzL0hlakxj?=
 =?utf-8?B?c0RnSHR3S1p4WUFmenYrTTBnNUI0cC9INlVwczc1MEtaM3I0MXY1dC9aL2pR?=
 =?utf-8?B?V0dzSUZJTGhrK3dGT1JheTQ3VTRjT0pxTkdWclNzdUM1dUdmN25zNmNYeUJj?=
 =?utf-8?B?d3JxNTlWZWwwSzNORmxJMytpS1VtQXFLQVArVWdpekNoczlmNEN1NFlWMkUz?=
 =?utf-8?B?Z0d3UUk1LytvRmNMb0hZREM0QUNBZkVaVFpzQzZmNEtoVkpnVFlwbStPSGpk?=
 =?utf-8?B?a05OV04zNTNLTFl5clQwcW5Ycm13V3hnQmVrNUNZazdVSHFmNDA3UDNXeU9N?=
 =?utf-8?B?SEltalJjTkMzcCtKUkx2YWNIWEF3QUVaVmVaQkVWWEJ5STFLVkN5TmgxVlUw?=
 =?utf-8?B?Q0pGbmRQd29KSkVING8wVWhYT0p5ajByL05jQjVBOHB2czdJQXlhWFhFQlpm?=
 =?utf-8?B?RG90OE9qS3hhS1dVRUNWbWpWbkZHYWlZSFdOZUlvcW5mbnZhWUFZWWVid280?=
 =?utf-8?B?WkRuRWZwZDFJN2lGOEZ5Ui9PRWJvVVpMLzRldVkvSGNLMUhuTDduR2wyR2pj?=
 =?utf-8?B?bUR1NDJrcXgvODh1TVI2dy9tNE9td2lyQ0FmTFJTdCt2MjVVc2xGdU9EaVpQ?=
 =?utf-8?B?ajYxbHVPQkNZVDQweUpETHdSdnN2UkxudXdYL0JnQU41c04vNEFvYTArYXRo?=
 =?utf-8?B?VFpmZTJwcitwUG1jVWtRdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjllaDMwUjB6Mm1RL0RTQk5XOEMvK1d6QlhvVkdNa0RwVndhU2ZtRlJsUDl3?=
 =?utf-8?B?cS9JcnVwemN6SkYwQlZtV2lFYnVTQ1lodlhWN2JVTXFtWnZLaW9wWlY3Rjkr?=
 =?utf-8?B?cFFjbGc3dURFYjFETXd6VUpacXZRWlBsdGRJVmQzMmltZ1VJZERnbFpycC80?=
 =?utf-8?B?cWNLc0hKN09iNDFJOTRkZmRPVUk4VmdsU1hsY3hKeGZ5UE44RFFOaVhvREJB?=
 =?utf-8?B?U0k3S3VvRURJdXR6aUkzdGFjMmZhTysrbUVuTSs2K3ZQWGdZVXF5SFU2S0Mv?=
 =?utf-8?B?TC83TysydGdoU2NCWG9CWHFpakloOEV3Qmc3bXRENXNRL2MwaDVSWXl0ZnFK?=
 =?utf-8?B?M2FyUTBMWTJOZGJIWjNHcEJZSTBiZHlsbHQ3dWFFbGxCL3NyRDMvQUlOdFFj?=
 =?utf-8?B?cW05VVZnd2hwOWlGSTRNQ21lSzY4RHVxaHJVTlVaZ3ZQUkRiSzd3ejhlaHNn?=
 =?utf-8?B?UkR2VTJSY2tDOTRMSXlreEhtY2JXbFp5czBNQmF5ZkVqZUNFc1hFaUVLaFE3?=
 =?utf-8?B?RU5jdDI1Qmp4NWpyc1Ewczd1NXhMYm93Y3JWbERtQmJVc0hWM0s2RmlJTGd1?=
 =?utf-8?B?bVAvc3I1K2RlYzczdGxTYTdyTGcwd095dHNSOXBYTWtqMi9waGFNblVzTzFJ?=
 =?utf-8?B?bndkTldCWEkydkZHMnc4NnZPallsTUFRK242bmhWanZ1a0h2Q1VPY2xLbXdw?=
 =?utf-8?B?MmNZUERQaEJvcU9HaGRhVkpKYjNlZlB1L3BaM2pvK1IyN1h5b082SW5VOFRY?=
 =?utf-8?B?akVyNkNQSVNxRStUaEMyNmtncXFGZmUvZURMRWQ5L2ltRlY5ZTdCNlRYSUxQ?=
 =?utf-8?B?Qm8yeGNva3h6Q1NDQVVBbzZZaTY2aElCZVhtZzJVUUQrSFZwSVBEZkxJNjE0?=
 =?utf-8?B?cmRKdFVTVjJUTTBEdStVTXNKTER1OUFjQjd5QnRLWjNzWE5TbWpPOVF6OUdi?=
 =?utf-8?B?dHZaS3hNZ2cwQnNZTjcrd05GNTgvTkdSWnVYN1VWa3NqQTl5cTlIZ09iZmNC?=
 =?utf-8?B?WHJrNEdSaE10MHBmTDJ0bTFlTFJzWEFjbXJMc1NMMEJHNDUrdE5MbnNoaUIx?=
 =?utf-8?B?UGgzTTEwYVJ3czQ2SnNvK0xINkp3blRTNExjSFErdFBjM082QjRhWnQ4dlFQ?=
 =?utf-8?B?UzhNc3RqY20rTk93aVBWalMxWGZBZm5tZUF2VmI3UitKM1NsTFhQUHQrOFI5?=
 =?utf-8?B?OE5uNkpFVGUvWG9NTW56ZVFaMzdvbGhHRmtUS2pWeDJqNmtCeS9xUDQ3Y2Fh?=
 =?utf-8?B?dmVaM0JLQ1gzY1NGY0xWTTVRS1pJUlF4MlpVcUszZDZkUElRcDBoTXFJQzNR?=
 =?utf-8?B?d2thVC9VM2xNYW9Hc09zVWk4cjRiN0JMZlVrbmd2S0xpRmo1TEpucnhCUEU2?=
 =?utf-8?B?eTc3ZDBncm1Cc2lmbUVSd1pabXRmNGIvL3RYcHFMeEkvdTFpWVd4dWh1NjhO?=
 =?utf-8?B?djVTd3hHcmM5SllhVzlvbzZtSWxwS2JGSkNIMHFGQzJhZjR5RGlLVDJGYlNR?=
 =?utf-8?B?OFloQmVXL09wbTBEamVoaEkzd1N5TDBIK3RrR3NUT00vQ2VNTHZBOEQyVFA1?=
 =?utf-8?B?UEpHMW1NR1NjZ2hwQVEySldsQXZ5eDE3VWtLbkdRNDlJVlAvYms1SmZieC90?=
 =?utf-8?B?bnBUaDJIT3F6Z2JsTnd6SFYyNzJRR0VESGRsb3phcFU2ZHBHNEo4b1dyb2ZJ?=
 =?utf-8?B?SHlhbHhIZHdtNUtCeXozc3MxcFRidTdsQXNjaHZ0K2M4SzlIbjFRazM5Qk5H?=
 =?utf-8?B?YWh4OGJWTlJ6a09jR2tlWXJxQld0YVRDYTNCMHhxV3QzWTVqUGhXUjVqb1Yy?=
 =?utf-8?B?MmUxemZ0Q21WSE5yVzFJWFJUeWlNOTRSN0JSWlRVQWxrdU8vL1ZzRXFFaHQ5?=
 =?utf-8?B?Mm9Qb0lvUHZpYW9FMVkxekxOcUYreVpqL2Z4a2pNcU9jK3JUZXowV0dNZmRO?=
 =?utf-8?B?cXNrVEduZE1ybkdXbnZFV2RKS0Y4N0FadHpFcy9sWTB6MVkxcmFmUXJZQUJ5?=
 =?utf-8?B?aFhjMnRhVUhYQlpPeUZ3UW04U0NPd2R1Mk9tVURCQmtyMEd1SytJL3VBVlNi?=
 =?utf-8?B?WXVhaG9VSU42MGFhQXd5TjRVUE5jNVRwWFRlM0tSRU94SSs0NzJSQ1V2Qkpq?=
 =?utf-8?B?NjhLcFM1VEE5ZW4xRXZ4eVVHT1FLa002UmhiUG1GQm5LQmMrUDcyQnVQQmIw?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6neFm01d75J0N6m4A7+U97YknmygOP6D8KCnivyx9CteP3ySgz43v78on8eCcWIXO6qG+OR0qg4buJ/YmXbLi9aDo8ekxpveZgaEGfLmZc+8rln6gk7UJXHw5FsvtjmXoFy5aQ5k7xf0x423yhRjfvls1E+cXLhEN+MUXfvsryFeg7aXANzkn2fzHRxVkqk07By8BWT93KicL3xi48/qFT47ARGcMvoz1YL1t2RZfuiUhjieL6FblHd/umKH8P1T08eQ7qwzuzlz8FaePfOAit8mxIPMvRbejbYEAsSh0iBkXyniJtNAndSTR3YrfHwbGB21e/cPwQUYmxjiIqgNTVzl+r/nxe7KRmuR0NGzOMkdDFZBOIBGVO4OphfMCVSLcpGCI6CItJIaCQkfmntojAsuhWp4jw11Zgcgif78p8YVdCZ3/d64s9+9av5SrvXsRkF88sxfNE6MEFuOVknL709ScVV6vBRVxqgzwlUMSzjgZ/kDJvgaGdBGeUwh9hqM2po4dGF4bzWg4kyXcDViq0kbvKBDemVFquo0GxMKBNTfGP1JAtp2cPKc7TKMN1kGNSvPwfB8gwyvtrE5elMimgUqQ4X1h0iwEfs7Aa7xToI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c274679-a4cb-461b-4ee1-08dd778c3555
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 17:30:23.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPMa39B/Z0xcNAFtCeM7Qjsh44OTz0uBRHlrA9RJx+y2uMceZ53mdXEGpvROekmnztVdqmu26gqm65/paY/GfJottmqa5WdZdLpYL+4wdm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4280
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504090113
X-Proofpoint-GUID: sSwaMWGy8M9Enqma3gKDtsAlNY8zkT84
X-Proofpoint-ORIG-GUID: sSwaMWGy8M9Enqma3gKDtsAlNY8zkT84

On Wed, Apr 09, 2025 at 04:57:48PM +0200, Aleksandr Nogikh wrote:
> On Mon, Apr 7, 2025 at 12:28 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Mon, Apr 07, 2025 at 12:13:19PM +0200, Aleksandr Nogikh wrote:
> > > Hi Lorenzo,
> > >
> > > Thanks for looking at the report!
> > >
> > > On Mon, Apr 7, 2025 at 12:09 PM 'Lorenzo Stoakes' via syzkaller-bugs
> > > <syzkaller-bugs@googlegroups.com> wrote:
> > > >
> > > > I did actually try to mark this fixed, but apparently syz fix doesn't work or
> > > > doesn't prevent other syzbots from duplicating reports.
> > >
> > > This part is not very clear - why would #syz fix: title not work well here?
> >
> > Sorry for not being clear. What I mean is that I already did this on
> > another thread with the same, duplicate, report - and then received this
> > one afterwards.
> >
> > This suggests to me that this does nothing, or does nothing useful at least
> > if other bots will just keep on reporting the same thing.
>
> When syzbot receives the #syz fix command, it keeps the bug open until
> the fixing commit has reached all the kernel trees it fuzzes. After
> that, if the bug is seen again, it's reported as a separate issue with
> the (2) suffix, then (3), etc.
>
> If the bug manifested itself with different crash titles, marking just
> one report as fixed won't affect others indeed - if syzbot knew they
> were related, it would not have reported them separately.

Yeah this is what I suspected. I mean you could take file/line, but then
that'll vary at different merge commits potentially and it's clearly a
non-trivial problem.

>
> What was the other thread/bug in this case? Maybe we could adjust our
> kernel crash log parsing rules to prevent similar duplicates.

The [0] referenced below. But not sure how easy it'd be to recognise.

>
> >
> > I appreciate that recognising that it is the same issue might not be
> > trivial, but obviously it's not a hugely great use of my time to repeatedly
> > chase this stuff up when the fix is already upstream and I've already
> > -manually- confirmed it works.
> >
> > My patience with it was somewhat eroded from my experience of telling
> > syzbot in the previous thread [0] to re-test, twice, and it failing to do
> > so due to broken presumably VM images, leading to me having to manually
> > test the same fix I already tested and fixed a while ago etc. etc.
> >
> > [0]: https://lore.kernel.org/all/bee2d5f5-db93-42f1-829e-3fd250649ca8@lucifer.local/
>
> FWIW the "unregister_netdevice: waiting for batadv0 to become free.
> Usage count = 3" bug is discussed here:
>
> https://lore.kernel.org/all/CANp29Y5RjJD3FK8zciRL92f0+tXEaZ=DbzSF3JrnVRGyDmag2A@mail.gmail.com/t/#u
>
> This is an actual bug in v6.15-rc1 that's plaguing Linux kernel
> fuzzing on syzbot at the moment.

Ugh well in that case apologies, I assumed some VM setup issue :)

>
> >
> > We do very much appreciate syzbot reports, don't get me wrong here, but I
> > do also have to partition my time somewhat :)
> >
> > So I'm afraid I can't promise to always do syz fix updates on this basis.
>
> Sure.
>
> Also please feel free to ping us whenever syzbot's behavior is annoying you :)

Cheers, you guys have always been responsive even when I grumble inanely :)

Though you might get quite a few emails :P

Mostly syzbot is really useful and has caught multiple very real things,
but when it is noisy it can be pretty noisy :)

Hopefully we can help sort out tractable problems, I guess we have to
accept a certain amount of noise though as a biproduct.

But sure, will raise issues moving forward also!

Cheers, Lorenzo

>
> --
> Aleksandr
>
> >
> > Cheers, Lorenzo
> >
> > >
> > > >
> > > > Anyway, this is fixed in commit 36eed5400805 ("mm/mremap: do not set
> > > > vrm->vma NULL immediately prior to checking it"), was fixed a long time
> > > > ago, as soon as reported, and it's been a matter of waiting for this to
> > > > land in Linus's tree.
> > > >
> > > > This is now fixed, upstream, and this report is - as a result - redundant.
> > > >
> > > > Thanks, Lorenzo
> > >
> > > --
> > > Aleksandr
> > >
> > > >
> > > > On Sat, Apr 05, 2025 at 05:16:31PM -0700, syzbot wrote:
> > > > > Hello,
> > > > >
> > > > > syzbot found the following issue on:
> > > > >
> > > > > HEAD commit:    a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git://gi..
> > > > > git tree:       upstream
> > > > > console+strace: https://syzkaller.appspot.com/x/log.txt?x=11ab27cf980000
> > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=adffebefc9feb9d6
> > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=5250c4727db03e3436cc
> > > > > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> > > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1693d404580000
> > > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178ac94c580000
> > > > >
> > > > > Downloadable assets:
> > > > > disk image: https://storage.googleapis.com/syzbot-assets/8ecd2318067e/disk-a2cc6ff5.raw.xz
> > > > > vmlinux: https://storage.googleapis.com/syzbot-assets/05691b82062c/vmlinux-a2cc6ff5.xz
> > > > > kernel image: https://storage.googleapis.com/syzbot-assets/4698994e99d4/bzImage-a2cc6ff5.xz
> > > > >
> > > > > The issue was bisected to:
> > > > >
> > > > > commit d5c8aec0542e2d79b64de9089b88fabdebe05c1e
> > > > > Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > Date:   Mon Mar 10 20:50:37 2025 +0000
> > > > >
> > > > >     mm/mremap: initial refactor of move_vma()
> > > > >
> > > > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11ff2a74580000
> > > > > final oops:     https://syzkaller.appspot.com/x/report.txt?x=13ff2a74580000
> > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=15ff2a74580000
> > > > >
> > > > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > > > Reported-by: syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com
> > > > > Fixes: d5c8aec0542e ("mm/mremap: initial refactor of move_vma()")
> > > > >
> > > > > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > > > > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> > > > > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> > > > > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> > > > > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> > > > > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> > > > > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
> > > > >  </TASK>
> > > > > Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
> > > > > KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> > > > > CPU: 0 UID: 0 PID: 5820 Comm: syz-executor115 Not tainted 6.14.0-syzkaller-12966-ga2cc6ff5ec8f #0 PREEMPT(full)
> > > > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> > > > > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > > > > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > > > > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > > > > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > > > > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > > > > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > > > > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > > > > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > > > > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> > > > > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> > > > > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> > > > > R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> > > > > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> > > > > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000000000000
> > > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> > > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > > > Call Trace:
> > > > >  <TASK>
> > > > >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> > > > >  do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
> > > > >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > > > > RIP: 0033:0x7f46ffb182e9
> > > > > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > > > > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> > > > > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> > > > > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> > > > > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> > > > > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> > > > > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
> > > > >  </TASK>
> > > > > Modules linked in:
> > > > > ---[ end trace 0000000000000000 ]---
> > > > > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > > > > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > > > > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > > > > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > > > > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > > > > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > > > > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > > > > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > > > > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> > > > > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> > > > > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> > > > > R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> > > > > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> > > > > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000000000000
> > > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> > > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > > > ----------------
> > > > > Code disassembly (best guess):
> > > > >    0: 48 83 c4 28             add    $0x28,%rsp
> > > > >    4: c3                      ret
> > > > >    5: e8 17 1a 00 00          call   0x1a21
> > > > >    a: 0f 1f 80 00 00 00 00    nopl   0x0(%rax)
> > > > >   11: 48 89 f8                mov    %rdi,%rax
> > > > >   14: 48 89 f7                mov    %rsi,%rdi
> > > > >   17: 48 89 d6                mov    %rdx,%rsi
> > > > >   1a: 48 89 ca                mov    %rcx,%rdx
> > > > >   1d: 4d 89 c2                mov    %r8,%r10
> > > > >   20: 4d 89 c8                mov    %r9,%r8
> > > > >   23: 4c 8b 4c 24 08          mov    0x8(%rsp),%r9
> > > > >   28: 0f 05                   syscall
> > > > > * 2a: 48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax <-- trapping instruction
> > > > >   30: 73 01                   jae    0x33
> > > > >   32: c3                      ret
> > > > >   33: 48 c7 c1 b8 ff ff ff    mov    $0xffffffffffffffb8,%rcx
> > > > >   3a: f7 d8                   neg    %eax
> > > > >   3c: 64 89 01                mov    %eax,%fs:(%rcx)
> > > > >   3f: 48                      rex.W
> > > > >
> > > > >
> > > > > ---
> > > > > This report is generated by a bot. It may contain errors.
> > > > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > > > >
> > > > > syzbot will keep track of this issue. See:
> > > > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > > > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> > > > >
> > > > > If the report is already addressed, let syzbot know by replying with:
> > > > > #syz fix: exact-commit-title
> > > > >
> > > > > If you want syzbot to run the reproducer, reply with:
> > > > > #syz test: git://repo/address.git branch-or-commit-hash
> > > > > If you attach or paste a git patch, syzbot will apply it before testing.
> > > > >
> > > > > If you want to overwrite report's subsystems, reply with:
> > > > > #syz set subsystems: new-subsystem
> > > > > (See the list of subsystem names on the web dashboard)
> > > > >
> > > > > If the report is a duplicate of another one, reply with:
> > > > > #syz dup: exact-subject-of-another-report
> > > > >
> > > > > If you want to undo deduplication, reply with:
> > > > > #syz undup
> > > >
> > > > --
> > >
