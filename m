Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619E330E83E;
	Thu, 19 Jun 2025 19:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361248; cv=fail; b=RGPRqf7wrFyVgtd5UvD0/uf/FpDpl9jmPlQ+YU3SDqWYc/M4muDxzW22rOohYk9DHSuZf76Gju2PJGhmk8TGKpxfPdFtXyCZAAS5y6xaPr+E0RWzxL/wWE2+h2zl2apkwwbn0xVwtSYNveXyKra7nIpilPjRjfhGpQIjI2Os2Q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361248; c=relaxed/simple;
	bh=0muaCQWa6CSVNHsBYJQpDILC0yRcuke722IkTMV2UFw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aRocUJ8pmv+ZUw33NbbX8ifLaaDdkQDi2GeZEnEUh8sjJQO2lYvNYUtEQyu1MO1EJa0nf32Nwb5I0H3QTwFqrc8BVrBcopaHu0J7T/1/feEbyl0qG2pwcx8BW+Wdn+Y9HXhCF+t61VFm8lvIUezI+14U0NchUtOzSw7o/sgcxrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VB2GjM0A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ibIBg3oA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VB2GjM0A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ibIBg3oA"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIfxDl012291;
	Thu, 19 Jun 2025 19:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=JpNNHCvI+5SJe/nERVgD1QDpU8H91sJ12vuXpKfP+pQ=; b=
	VB2GjM0AZIf1UdJGxEj3+A+D1DlfY04KlxThGrE3DFfb6/j0YOBVl+q4/vLnsBnB
	HYR3d/NHI0/VeSXZY2NrDfiWvFO0x5dAhFASGGKIW+hb9Ys1OxGQRKR0bl6c35hb
	6u63pOuFxfpWgficcqYzUVqrkIUmd13FeHclWYcziTPk+eJV+x6O0aoxtQ12tlLN
	kOhyeHe0eHfB9Vtqo3w43VblMbcTHNOpZ6T/NljSnSyb5ZXrykwHfLwbBwmhytw8
	213BMYpR8XwI7lK9oISjFtTK7ysbYUWAbj5AVmOPNtgc0Av5nP5NN9gQRwTNarAK
	o8T5AU2pKvFszexBbN1cjQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r9fa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 19:27:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIBVLM038469;
	Thu, 19 Jun 2025 19:27:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhc6gaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 19:27:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3xFoHQWkVueXaqpuHi9Vgu4nryPFzJp1ucaK/WQvj5RffiD2uZ778oKRWC5Ytr4M+p+Jh2WUF+9wNhpfFGzKPM5xaJJkmPh3cYfb4iijj678h+wcrJWdfPNX+9pIFg68Lly1QJoiLPvO0JZ1SOJnq0HwpQNLT21NijVi3ChhUEqZcxIdI74QjuFmlSCGVf83603sE++HkFlqdJ3Jwdj/FbGfTnyYKV6Gm1sPgakN4ruWkXrzuty5vKNDD7arcS0ZaVDs51IbPTn+2HIgXgyCg/D3+2s4fZHwz9AMNI2WT6wi974DSjIMfO5uJ7gkOZ0B36PvllY386xU8KvEWZ0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpNNHCvI+5SJe/nERVgD1QDpU8H91sJ12vuXpKfP+pQ=;
 b=PlR4AkzLspcYEfaFrZ4VXH4liHkAhJ4VxfKSnEz346gpD4hlxSGijAtmZhJ3o9qTWE+L3qqqdy9+V1oDTSt17LWttq0Kp01ovSPux6gXDz50Ji5oHYasi4/MPelZ8WeTXOTz+SY+xU58mhCAzWyMNk/Ib9KszeMojBlcScBFTkyVH/cI2/ewJWeNZ4YV66HwZObNqYvL7KB0nZwXgOau7wybN0TO8LV93YvnfjM4W4lVzEkfBcKchWyhWGnzofZizkFpcP6EQmUAi20fnkLwv5DEKVwUzZ/FjV/LNLrJALE9LcuG/TOSZ9MSUAyc/4WZ/stjLd+DXWZckAEgRXCPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpNNHCvI+5SJe/nERVgD1QDpU8H91sJ12vuXpKfP+pQ=;
 b=ibIBg3oAE4m1dQinVv6PHtFLshYSgXMuq1PqXYJE7LPpDGmmyOM+oT/qWoCB/foV1NdGBWS7sGtOrGF16NiYyNQ9i2sEnhzuSLndTSrUIlsisIIteUaBswATH7IRiaJN8IktZMRsbyE8KsPSpD1KGgHoyfnZPKDFL15hsT9tP1Q=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DM4PR10MB6255.namprd10.prod.outlook.com (2603:10b6:8:8e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 19:26:58 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.8857.021; Thu, 19 Jun 2025
 19:26:58 +0000
Message-ID: <668f9127-25e2-418e-beb6-79ff96706914@oracle.com>
Date: Fri, 20 Jun 2025 00:56:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: [BUG] ALSA: intel8x: Why incorrect codec index
 used setting ICH_DI2L SDIN
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: perex@perex.cz, tiwai@suse.com, phasta@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250618191929.2382821-1-alok.a.tiwari@oracle.com>
 <aFQvEYdQfiJn-29o@smile.fi.intel.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <aFQvEYdQfiJn-29o@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DM4PR10MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: cb340de9-24f8-4714-e227-08ddaf674237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlRpNk05ZDViaHM5YXpXM1dpNHd6dDNveFZnNFNNTG5MMHZ2T2VvZnpaNVhN?=
 =?utf-8?B?OU12WkZsU09iYWd6eVBVdC9BSW1pU09SRHpZT294Wk9OWUg4eEY1MGQydmt3?=
 =?utf-8?B?ZFF1Q0M2YU9uVzZ2d3RNaU5SMHpNRXdBZUsxN1oxZ1JzaUFNODVFVkxWTDVq?=
 =?utf-8?B?RUFCTTFiM3Yyd2ZxU2lHdFhWbjV1TnZxbUR6MTBpSUNrS0V0d3FmRTlxY2xT?=
 =?utf-8?B?cE1LYlY2Qys4VkNOTmZSTUZUaTVVNWRXQk1rd0tWdG5Dbnh2Wnl0TEx4dnI5?=
 =?utf-8?B?RVRrc2hISUExWHE4UGtPS3Z3dEROYlA2WkNGVi9EY3RLanVVZGg5d0FycTJN?=
 =?utf-8?B?Rm1uSFpQcHRTUGRjQ0wyWWpmcHM1dUVQakJpRmlYazh1aVJqUDk0ei9YbzEw?=
 =?utf-8?B?aUVxcmx6dkgyQWxCSkhJQkZObytRQlNHUkpYK1NlMDRNbDc5TTJyNUtmQ1I3?=
 =?utf-8?B?b2psYW81S25FZnZaaGJpWVZFZmxzZTBQNDRjc1BleXhqbldOcGdOQVNkZ2E2?=
 =?utf-8?B?ZndadnpjN1owZUlua1VoTFZkbnFiVGdGelJQTkc2YVI5bk1uTlBpbmpudmJj?=
 =?utf-8?B?d25nWmhJbE9iRkIxZTV6SlNieUF6QjVjdGR5S2VtYXJtN3l3QnJ6QXlKd1Ry?=
 =?utf-8?B?bVFqampmYXhueTNRTEtpY05lNUQxbllUeXVXTzdBN2NQRWlHUDBMR2xESGV3?=
 =?utf-8?B?dDVscTliVzBMUk0rd2NQOWpvL2I3ZXhhRW1ST3N6ZmFBbGNZZ0FpUmZkYmlF?=
 =?utf-8?B?R0k3bzhZV1crQzN4OVkyZ21zMDlhVGxoaTFEVUZRQUxXQTNjVjJwaGVGYW5O?=
 =?utf-8?B?Y3ZqK0NxcWw3TzlHQ0Zab2NqTVZNSmpGRFd4c1hWWXR5bjArdERZRXR4NXpO?=
 =?utf-8?B?dmxENG5pMUo2b20zVTk0T2NCTW10TzVpU0RzU2NvWXpUWkxjYUUyMTZXMThU?=
 =?utf-8?B?di9wSzJQUU9LenFTYkdWNVlXaW1jRHpoTjB1Ym1qTW9hMlBWUWtLT1IwdG56?=
 =?utf-8?B?cllnVjJ1RGp3c0t2a1d0dmVHTXozYmdHVkltK0JqVHYyc1FCWUNOOW4xdk4r?=
 =?utf-8?B?RFBQOWJPRkNpdk1zamtLMk81WFpwK2lmZm50cFdLY2lPc3lHOTJtakJ1TVMr?=
 =?utf-8?B?TTlYdVk0K3lzcHlNS1lhc1ExQ3d1Y3FHaThPV0lsY1YyTUpoNTRKTldQMC9M?=
 =?utf-8?B?bFlvYTRKdmdGYncvU3RZZ2dRVXJlbkF2Qmp2SUJLZmx2eEtvSWlsK1ZKaXI4?=
 =?utf-8?B?YkpncitjQ3ZXOVhQR0FKZGNBVWFmUWtMOWpZc1FHZTdyTG9oSDRNTHRQcmNT?=
 =?utf-8?B?VHhIeEtFTUpGZzAxNjh4U09QaWtSaWNZclY5OUtnL09QYWJvL1cyajJudWpU?=
 =?utf-8?B?d0xDSXFxN1pBRFFJZTFkU3MyanRWSjVvZGFkUmo3QlhTaGdIemI4UDllQ3Yv?=
 =?utf-8?B?bTY3ek5XcTZMVm1HWVNlRXJrRVlXbHJ0eEVaRXZDTm44bnNmTFhPaW1FMXpZ?=
 =?utf-8?B?dlFlU083d0c4azhTcUxqOHdXZGlyQTUvejR3c2xQK3pmMVRad05Pa2RVTzhQ?=
 =?utf-8?B?RWtPZFdYTVBJMjhIUzF6NHBXUFk4bE0rVkdjQmw5dDhtYVdQV3d4OGNrTGhU?=
 =?utf-8?B?dWlsZWNNM2haYllUdnZSNXBCNFN5YWlEMGFxMkFwMFE5NDhGcktiVENPZndp?=
 =?utf-8?B?U0RHeGdQOUhWZzR4bHl1YVg3d2xOVEVuVjdLUUthRnhmVXFsZVIrWjhmblNJ?=
 =?utf-8?B?RGh3RUtieHAyRnMvbFVwWGhuSDI2SklMSVlaYmZlYisrUDhDU0NDMnhtbUlZ?=
 =?utf-8?Q?8ZyAqL2c0sqe7ok+moOldGTbTWuxzYUyyXHzg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlIwY2dpZVFSUmIyQk1hVVNPNENsQ1ltK0U0c3ZKMHBHSlRRdmQ5NWVuM0E1?=
 =?utf-8?B?SkhSaXpCakxZQVh6cEJqOGdEMERkZlNuZjVqKytJQmY4MnAxaC9Pa1B3NUlJ?=
 =?utf-8?B?WnNzL0hvQkI3cU5CZW85YyticG16N1VIbnVRSjM0b0tpVnpYOFIxYlhtN0tD?=
 =?utf-8?B?bnlwYUhTK1hxSXVDdXprYjJ1VmRUNVBQQWVKaTRaWEN1QzhrRVR1d0phVS9v?=
 =?utf-8?B?eEJhZllIaFVYLytEWjR4ZVJqb3hpaWd2Sm16OXNJZWM1RGlaL3ZGdFgwbTFn?=
 =?utf-8?B?eXFjc1BZaVgzSXB4VWFCZnI0MlJRVWVxdW1VZGZ0UFZVVGFhOXpkYzVlSGNB?=
 =?utf-8?B?L3RGQklZK2RnT2RYQ0ZXL3g1clhiQ3QwVGlEcE1RcllQRDBKVkl0V3ZpeWFV?=
 =?utf-8?B?REhUSGFMUVNFVlJtVTlxbW5hUjJHN2tXcmRhZXdtMjc2LzJIR0kwZ0JnNUdM?=
 =?utf-8?B?bXZKRkRpbmUrcnZ6ZFlPS2RtMElNTGZvK2thMW9lbnZSS0l4bWZUYmcxREtv?=
 =?utf-8?B?YXcyNXJseUlYQWUzY2FTT21IWU5CUzk4R3VVTnEvS2IvUHpRYjZLeHpEYUVR?=
 =?utf-8?B?V3dXR1pxdG5FWEh6THY4WFFoWDhDUGIvb3Q1Y3M1b3VjV0MxRGN5WkNxS0ZQ?=
 =?utf-8?B?b3hHb0I1UXd0SWY2b1NFOThOalMxdkhqa2xQZHdyK2kyb3ZURDA3VFJwK293?=
 =?utf-8?B?Ui9LTHRYMGpINmZzTXcwV0J5c09qK2ZUY2tZbFFuMXFJb2ZlS3k0T0xPVXJk?=
 =?utf-8?B?OEwrK3IxS3h0bS9wY0FUdTVhbVZ5RVUzWjV4UW1lRVAxZzRqWi8xemxQOVRJ?=
 =?utf-8?B?SGUzN204Y0pDaUE3bHZSUHJkK2ZLQ0dJQkpIQTRvSWF2K2hVQ1ZUc3dJSHNI?=
 =?utf-8?B?NVpvRVdJTzcwTVZDSXBWc1F0V0ZRd2xCU3J2SStYVEdnR2l3ZnRlZWJUMjhI?=
 =?utf-8?B?bklDRTJYMHREV2t6YWk5SkIyd1NDWmp1dVFBY0krQnZrQ3lBM2VMci96VG9S?=
 =?utf-8?B?R1NLT0NYQ3RleHIzWTYwZWd4NTVVZk8waXBKcHM3TTZRSkJ0SFpFQVdCb0tl?=
 =?utf-8?B?K1RkSFV1TFhQaEJTbHJMZk5UK3dIdG4wOUJvZ2U0Sm8xWlBacHc2UjRROHA2?=
 =?utf-8?B?MGtDdnpMUldPUStzTDliQmsrcE9IR1lNLzJBa25Hb2dCMTQyY2xuWE1vMFNW?=
 =?utf-8?B?a0c1bUlBN1E4aVp0OTd6dkJRUXF4dnFLU3VsK3pGaWRtQ1dFWlU4dXh0TGJi?=
 =?utf-8?B?NGZJYTJVVmt1MTMzS1JId0drL3VTVDJKQzRiemgzcUV4OUg4SXZPQ0tyc21t?=
 =?utf-8?B?cEgzbk1OaVlJL2ZNeHFBcHFlOXljZ0dhVjVJNWdGN0ZadmFPZ3E2QjFxWkt0?=
 =?utf-8?B?MHpYeFV0aFdDbUpab0ZYTG5hejVhTHlxaWJ4aUljN2d1ZEp6Ujh1b1dwUkZa?=
 =?utf-8?B?T2ViekJaUFUrcW1QaU5EeWltWmdtaFdiMTNTY0JqT21pK3E4M3ZETUFWYWNO?=
 =?utf-8?B?Y0JoeE9scXIrUTg4UzFuQjA5ME91cnBEM3dUek50S2Q2czJLOU8xOHhESnUx?=
 =?utf-8?B?VmFLQkJJaG1lRllydVYwUFV4SkJQVU52cVoydHlmNGk0cDMvYSs0NENwMTdu?=
 =?utf-8?B?c1VzQ2tjT2dpQVFMbEhhNFJSUS9tamE5TE1BMzZxQ1JRQzN1dmlxSVRhL3dF?=
 =?utf-8?B?dmpDR0ZiQ29DTEFHc011b0JDOEQrRXdiL3RaNUQyY2doUWwwbDB1eHY2aVhH?=
 =?utf-8?B?MVYyZXBCS2laY0NYZnYwb2UwVUw3YmRGUG84ZllyK0E4d2hKVEhwMUliTHFT?=
 =?utf-8?B?aUFwTmtZcklzRWlCWVQ3REJPWEozUUx5TmF2MnhQK0VqVjJDOVdUQWplOUNT?=
 =?utf-8?B?VEt5YW9YYkMwUUNoQjBVRm9VZ1BBUlRXRWx3allXSmhoSkNNUFZ2WDNTWThI?=
 =?utf-8?B?NGt5M0JXcGZWUDJxNkNEVXBZKzZvVTVqbFZLd0NQN2Uvd1NIcm9hcDZHYytC?=
 =?utf-8?B?dUxGYlcrUkx3UnhKeUE3SjcwTzVSOGVDT1htdGYxNnoyVHY0RDk5Yk1QamN0?=
 =?utf-8?B?WjUveFMwN01uZm9FQlpVNHgwZFJ5WUU1V3dGUHIrNnRNVEp6TlVIUjc3K2xh?=
 =?utf-8?B?R2NBSlhVb2JtSVlvTlFzNkdlbUJyTUM3ZlBmUGwzMDI3Q2xPTVVRcXdwSmFC?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HLvHJ1z6Wrc7QAlADrq03nBzDU9XhgnUH18muJj27fGF44lv01zdeQoPWoT6/oDCCyX2riMyolaGwzqn9t6Lc8C4kvoZ0vqgREdBwa9m1x7hOMg/jV6de+8n7mhT+cX+tlfg8JzE4z5dzNS94ceV/ULy0AmHziLsL9pVfErh73/DZWz32X/3YmN1rrMqTXL4S9ZleYB//7f/oHhXbopevgXpz64QEWs6rCqY+bK54RSw/iLru1p5O1xPgWPPMKJqbc3sIbLOAGusvzMuAn/nH+onq5LOBkY00n7kLf9cdTzeXKTj2t+GEKN9PXmfl+vMidtmtdpjl77dvfmqxtTwteaoGuIq+eIOBDOLEQlyw5q7HmTJ9n0yIjMecFmC+SVYvETL3wUvu7q/avL1spPILGN4fAzym/6+PwNZaG8XOibfTujCghEDGdEYvpgVLPuoL3IbzKKJh7+orWXziScCM8ohFZo+PurfaV7lghd4cOOWA48KynCFZu++r8EJqgEZIUi1WVcJcGsZWanvNbWtNBSD1Yz2hQBsZPS452krqpK9/ZJqvQ8yJ6ymiuPQY0e5KlUBx/C5GOlt/K3jVFAlx6AvgRt7Jlyb7hUHVvLQp0Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb340de9-24f8-4714-e227-08ddaf674237
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 19:26:58.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3fUVIfJoCzzHyNeNzd79iL7+nMaR4WNacjBdzRVDBUIvYJ/70IEH4lfGSA42ECiGi+98Sl6fzJ9/CskOTmu3fsaLSOYA9kLag6t/0mH99k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6255
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190159
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE1OSBTYWx0ZWRfXyBev8/w3PL0A Xfy153nMCLgs44ENa0rVIQ2jriAa7yKZusD8xikuLqpMFgIkAbu4j+Bu4c8wUUxvRNiTIUDATsR 5Wby796wblF9AKoO2bSGnrBYJxALHflsSyrSk7Ad3NhM9ZYYItzY0ef15kppZfiycZeMJQEHrPk
 cpM6qPPFAX+YzJYNmESoeUciPuTVdQfa70TloGKcFsx3US5NOAMMGUIbHypoZtPYSI//IYO94dY mWLCod1RDhatA1JTU6zaUdGDwEbmFXnwt8K2XRlYz2+7UGNcKZQsjvA5QM9bw6BxehgqLjavRJz oGYd/qlun/nXyAaJ46blRPW9jGU55A6FRgoeg1m9m/Z4+9TMipjhXWKmWd+vjr4zn/vXi+fXZbA
 wKJRhqg2ZVXbHj5FwaCBt59o/dDk0+AnKAaN17QMWpYabz2dK5OzT/OjxYP0dkF+0RbLHgEs
X-Proofpoint-GUID: T9fJe6TWaHSv-SFdMlSst7xsmvEhzeE3
X-Proofpoint-ORIG-GUID: T9fJe6TWaHSv-SFdMlSst7xsmvEhzeE3
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68546485 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=ph_AhWEyTPd8HkGn-0YA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206



On 6/19/2025 9:08 PM, Andy Shevchenko wrote:
> On Wed, Jun 18, 2025 at 12:19:21PM -0700, Alok Tiwari wrote:
>> Correct the index to use codec[i] to match the loop iteration, not codec[1].
>>
>> Is this a mistake or intentional?
> 
> You marked it as a BUG in the Subject, can you elaborate more, please?
> 

I should have mark this as a query.
Why is the value 1 hardcoded here in the codec?

tmp |= chip->ac97_sdin[pcm->r[0].codec[1]->num] << ICH_DI2L_SHIFT;

https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/pci/intel8x0.c#n2252


Thanks,
Alok
