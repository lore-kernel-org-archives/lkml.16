Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EEC2F43
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 00:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716881; cv=fail; b=HX4PHbQ7xFc/rXBa9ngdYcRf6dOdf8XYhL1xO8Z2iOc8g7u8i1VgUFT+SyRclL0PNiALsxGJ/dE8JJ8KdACEQVLxK4OQqhWGwZB38I8Gr0+6HCA1RYMlZOw9ixIExpLYZKU49aa/uxsbbchjcdpO6Ja8gKHAwedl3Qm7JOs3kVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716881; c=relaxed/simple;
	bh=30o3NJydUdSE4kls1tx6xEZmRaIM+Y6hNwRBU4386os=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BtT1fz42N5utmxdgI+rt5o9vLnl8R9Y/uBk1T0cBitab+apD2z98z8gRmoPBbeRo3QoKMeNL5zuD4JDhaA6EUQmjVIeSvjgoUjqVEyG2bVCsodIsYxZbwZN883egNoeyU4ywawfHyMGGurGRquO/1BPE5yIhcjnAiEL2YRuIR3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SDWh7fhp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dRYRR14S; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SDWh7fhp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dRYRR14S"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514NBqBm008092;
	Wed, 5 Feb 2025 00:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=uH+3FoYRfX0RrhBPGFH/7CI4bgj8I9bm4gjxF/SYWSc=; b=
	SDWh7fhpoQdZgOCyk/ak2aAukTRkcZhPfkuQ0K9VRbJQLWQEBCGBznGr7wroSyi4
	Jo4cwJ3sXpWhXqdbOy2++VZzsataOBMsKvBuAELMt1pjZjkNRYnNE3D9vqE6CVUz
	/DOixeAg2QRerRHW6Jf16VATHca14Zmd8MSBH7PijG4Y3WiSRZUoiKmU1RNY7JQq
	HeS46/3nHLLb1KbHfVdJLeHNBIL5RQdmEzEOHTcih7+PLP0+sXPI4DvAEj9DpG9h
	dgroSk0Q/0V1L0Vrb0L2U1aeo0uIHmk1rlsD0GrQMY6ooXyOWIEWIi9hTiDLZd0m
	OQuyo9Qtny1/AV3WXdZG1w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hh73nuku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 00:54:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 514MHBZL036473;
	Wed, 5 Feb 2025 00:54:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fmxu26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 00:54:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqz7sDUHT/oLq3uOhnVW5Yf5tPoMyBakZDIYoUPEs8pPLJUVIDDn+CWWX/DIld/Ttid2HJGGtNkAuieglT2fnsZd0qGnCdi+XlLtWUibwwz/GYOnA2LQ9Z62PIVN4FoGLIlrLJBRqipkS+5XmxtcISquAnSaiMMyBslYdRH8mMsI17q0yZ7yXnjgUxAiGAUZMSsAd6WhhooMTPNsvx8DUsHbpGsPDSc3EBlKVStPM8XVyw6fDz/n9SJv8irKFA8tGItrPaGaDrCC5hjCHpM3DasUyv7/DXFFQZ9QFdWhr3LRigCcmJpCznDvIXkzxLlCnbUWGFv9F5ERmns7wZo16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uH+3FoYRfX0RrhBPGFH/7CI4bgj8I9bm4gjxF/SYWSc=;
 b=m+HUVrN6PcuueefhCpO/RJjBw2jK72E2dgFrXOXSACLk6Gy50vIqdYjbNqNhnBzy4mV/b8bdkS6D9dmT3UkO/bSvDNa+WmDmLMi/62XOdQgMR9ZXdFO1O97gu3oDKlPHiRY6VcMm9YjTb+OsqtBEcfNL0iJK2YrrYMaAFwYnSwQugoxeVZP7e3R/zP4gOhK9Oqir7FLH0RnI+jP0D7FNcv8/xzlbcCx/QoRRFg1beDhCJemfI7qoNsDYjcrFTfKYMw2/yjvtavnlWX+m/t7rLRn9isac9EvnOfYtizYRjWup768NGKlye/QtfRP6ASYJcjTHkuQVxDjasGnZOxvXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uH+3FoYRfX0RrhBPGFH/7CI4bgj8I9bm4gjxF/SYWSc=;
 b=dRYRR14S2WVdGB+eObcUELl4gaExFNNNe8ejFYjmLapO3Up87VyfXspSqhYqO+vycsEUltOl5l+nfyE/B0JlweJiCTDXRQuLVe1XeSwi3WNzEfti57TB3YxDesHEMf/XWrwDGH40FwhENWMA6LlrXWkKzkuC8XqKiJM/tovsjsk=
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by DM4PR10MB6277.namprd10.prod.outlook.com (2603:10b6:8:b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 00:54:26 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::485e:729e:c0a4:e562]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::485e:729e:c0a4:e562%7]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 00:54:26 +0000
Message-ID: <c842fb2d-47e9-4b20-a5db-f55730b2c093@oracle.com>
Date: Wed, 5 Feb 2025 11:54:20 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] workqueue: introduce
 queue_delayed_work_on_offline_safe
To: Tejun Heo <tj@kernel.org>
Cc: jiangshanlai@gmail.com, haakon.bugge@oracle.com,
        linux-kernel@vger.kernel.org
References: <20250204113635.298634-1-imran.f.khan@oracle.com>
 <Z6Jn5wOcFKpSGFW4@slm.duckdns.org>
Content-Language: en-US
From: imran.f.khan@oracle.com
In-Reply-To: <Z6Jn5wOcFKpSGFW4@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0739.namprd03.prod.outlook.com
 (2603:10b6:408:110::24) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4468:EE_|DM4PR10MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c0110b-c719-4d95-679b-08dd457fa35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzdseVFLZkVSZ0VNRXl0WDlWWU50YWhxeDQ1b3ZLR0MyOFZ1MXlPT3Nlamtq?=
 =?utf-8?B?L0lvSGZPSUlFWFAwVXpITHcza1BiNTVQaG5sblQ1cnp5NnM5aTcvZ3lEaVlr?=
 =?utf-8?B?YjMrdmVVSjkvM3ZJaDh5MktXSkt5U2liaTJWNWtuZGhHTjlSbk9scXZaUk5h?=
 =?utf-8?B?UUxPRnhXazhRYndwVEtkdUo0VWsyMWVibnMrdndUUXRPMG5GUkd2Qlc2THlY?=
 =?utf-8?B?VzN4ZUMzeHZldXJXVXE0Z3dlczVuR1pYbzlEL09yOGUvMWI4MXRSbU84WU1J?=
 =?utf-8?B?YUM4Q1RSZXBIVXNRUFBEZ3FKbDBIRWxPdExZUmFrc2VjNDJkY3pSczY1dVE3?=
 =?utf-8?B?UHdPRmpiZUgzdVJBSWljbzYrTC9hWHp2WEU1NW96MEgwWXJhaW04TStUTE52?=
 =?utf-8?B?YlhlbVZTaEN3UjVNamZOajR2d3VIWGxncVE0UU03VXJkYW12ZWhVUVExb2Js?=
 =?utf-8?B?U2N3VzVWdmRBejFHNE4zbVlmeEVjaUhWQVRWWWs0aHZYT3NGVkttWmVVQzZ6?=
 =?utf-8?B?R3VjODRKVU14YWdrbHV6MlR6KzhTSk9zVjZkLzd1MmwrL21LMjFpYmxsT3ZK?=
 =?utf-8?B?R2FnQlJuMHdBRU9lR0MzdGNDZ2hYNWxBQ0ZSTGdDa3B4RW42K1VYWlJDcnZF?=
 =?utf-8?B?UVZEMks1RUxOQklYMGUzMy9zS0xOWTViZWFtTHl1QWR1bWo0S2ZqdGluQy8y?=
 =?utf-8?B?enBEQmpHamJ0UWpTdEhvNy9uK0hQZ2FDRyt0bGJzQW01bmN3L0ZkcnpHWjkx?=
 =?utf-8?B?cDBPdnp1RmJvcU1OaGlDVUZXdURSbGQxTXBuV1UxbVFsSHZIQW1MaXRLMVN2?=
 =?utf-8?B?ZDNGNVVoSTFLaE9Gd1dHRk5ZYnIzb2VVWnV2ZHdpUE5TOE80M3A5Q0NVZXdP?=
 =?utf-8?B?cDQvREw3NEtWZzNlbm4zR0V3NjNQR2t0VFhKb1d1VExocnkvd0tyY0d3VnRt?=
 =?utf-8?B?UGxPQmQyMldWVVJiUDZTajlRZ3Q0MzVIc2hiM042WXc1dS9mSUdYZW1WOGNJ?=
 =?utf-8?B?SEZiV2VlSGFXdVFEM1ovNWZ0NVU5TFNyZ0dISGV2WVNkZEgvdVNiOUlXUVdW?=
 =?utf-8?B?YXRtNTF6WUlGTEU4VFBoazZKa2hab3ROQVVJRG8veTlPVWJrWmdQS3lua2FX?=
 =?utf-8?B?dkFzc2ovKzNtTWpsVW5kQU1CNEsxV3BWc2dWU2I0Tms2SUZzYXNGRzZlZHh6?=
 =?utf-8?B?dlJYQXYvYzJUc093akZubmdFT21kV1BBczBKSFZtdTVyY2tWdUpqRlhLelNZ?=
 =?utf-8?B?VlhQUnFoeDM5L0F5ajNCTHlGRlI3eWF2UlhrN0FGbzRoWUVwa3BOaGxLWVlQ?=
 =?utf-8?B?RGtkYmprUlRvdnE0ZTVWYWZMV3ByaGdRR1VObFc5N01PbGNGTm91QWJ2TzBv?=
 =?utf-8?B?R0NKcVFLcTFBNHJNTWRVM1ZidjFOVzYvcUpQVC85VVlGaXQyZzFNT0hNMUtj?=
 =?utf-8?B?LzMxeHFIVDV6Rjg4dUFST3FIbjRSZDRHc1VlVGtVVE8xMC96aUNJR2tkVXBj?=
 =?utf-8?B?TXJIS2N0WGRNMU4vZHc5a2Q5dThsblhUYWs2MXRzcmZEWE1yTlRiSWlVL2ww?=
 =?utf-8?B?ODl4N3dOVWlUNERhY0E1UFRWMnVSaWhyOXAwRXhRcGpqWG1KZ3FzOHRRczRK?=
 =?utf-8?B?S3ZPVjBsbmVFWU5sc3IzWWpVM3RLM2lhVnhpZkd3QmZLY25zbkZmYU9iVCtv?=
 =?utf-8?B?OThWTVJBWG5VUFJhalhwVFpadE5OOTJOVjZjcjNrYVVNb1d1c0l5UThtWHBL?=
 =?utf-8?B?UXNrZVVEZGlka3VBM0tOMDRnQW5NOU1UdjRnSXQ1enFWV1dNWGFUVjhLMExR?=
 =?utf-8?B?SGVDS3lqeTZQZjJUNTd5bU9zQjg3ZzhHSmRZaFdidm8rcWg1eGFkT3Fjc1hJ?=
 =?utf-8?Q?G6jbhi0WKtBLn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4468.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDRiRFNsaUQvYVMwVTVRYkZCekQ5Y2w0bUQyYmFOVytwdkJQek53MWU3cCtC?=
 =?utf-8?B?bTNod0ZIQ01JbWMzZVVYcmV2ckZ4NkIwN2ZoM0V3WmVrcmRLU0haM2dzdUlY?=
 =?utf-8?B?UkIweTk2NGZDMjlSa1RPMzVjWUFuM3RhNGlTSDFaL2VBcHhzZE5QVFJCYkVt?=
 =?utf-8?B?Ymd4Z1g2UkpiRHoxNVIyRTdWVFFFZWd2dk5XNHp1VG9FallFNE9BQzhXZEtk?=
 =?utf-8?B?Tlc4ZmpJZTkvS205dDR4ZnIwdHY2dTU3Y2lMaVlkbk51T2dJQlRTOTE3c1lY?=
 =?utf-8?B?d3VvQVZTZ2hmUnBlSUwrQnpXTWNrUVZmYjhJaTY5dW1QclpTNm9USWVra3I0?=
 =?utf-8?B?ekFpL3MvbEdYVEhhSEFpd1U1Q2lkT1BIbDhXZUhWR1laSmNFVzRNcnZ4Z21M?=
 =?utf-8?B?MWJhajJxOEtmMVk5TDY1ZmtxZVk5ODhwbXQ4bG9JTFU3R0ZEeG5acEhjdkZk?=
 =?utf-8?B?QTRUSWhZdEo4b0xod1JuTXpHODI3T04zazI1WTlDY25KMnhJTHFMZFFHdzRo?=
 =?utf-8?B?LzBaZGxxQjRJTmZMU3BYTVZwVkdUclZLSGh0TVhOeVFHa1pWY2ZlcEt2S3Y2?=
 =?utf-8?B?MjdhazYvekZOMlR2OUI1WXBqaTFieDFkdkh6R0FuVHFJTG9jL0VMQTM5UFc3?=
 =?utf-8?B?bWxFNm15ZktPT0VUMWREOTN1TUF1UzVxRUJmLzZnY3R1SVRpT0ZWUGdtN0p6?=
 =?utf-8?B?Tk1hWkdhYlZuZFBMWEZ2N2dXQjFhY0JCcG50c3NzNEgvNXJCWkY4MEZZbWFB?=
 =?utf-8?B?V0ludXFyZFh0YmlGTnlmcWRPNm02ZDZLSG8wTnNlZjR1RkhDaG9yZHcrNDhS?=
 =?utf-8?B?Rzh3cXFFVG80WnhWNXJ5Nm5ueVhYNGx6WDljMlEvQldXT2lJVHpkS0hkbEV5?=
 =?utf-8?B?MzZkMmNPZlMzSnF2MW1tc1NXVWVPS1Z2cTJvL1c0aGRnQ2VwNFlJSTdQZGpo?=
 =?utf-8?B?QmlqdHpvam00K1lLVG13TVFoaGoxMGFSNDhNMEtFSGpyTFJRa3psaHJQdEtH?=
 =?utf-8?B?SEVoWGhlYUMyRWhVdndmZmxPa1QwcFlldHlCSnk0d05scDVPRGNGYVRhWExY?=
 =?utf-8?B?bCtkampPdVJEYnVJY2d2WnI5Nko4b3J1NkliOGhFU21YNmRTYm1PejZQUU8r?=
 =?utf-8?B?enlpeCtPNWFaakY3MURnYlcxZUhhWEE1ZDZEMzZ3Wmt3cyszdWoxTWc4VHg2?=
 =?utf-8?B?NDlXY3pRc1VzMXFCQnRQUENybnoyRk4rZllUdXliNk9oQWI4NVRtMERmalhS?=
 =?utf-8?B?QlJiQS9FanhlWm5uVGVhaDB4dHh0SnBTaHRZTGpQWFovR3NJOEFpc2dodlEz?=
 =?utf-8?B?SlRuenZrcFN2RTJPclllWk43RVNtQU9McnJsM0JTTU1kbzc5cFROMTh0cWhy?=
 =?utf-8?B?MW4ydkl5U0haRUxtN3ZEMXRwVWhjSTUyYy90ZWIwV25vNVppUFQxcENBMFZB?=
 =?utf-8?B?cUI0SXpEVjJVZFQ5MXJ1a3UzYk5VT2ZhV3BmcWZ5dnZTdjJVS0gyM29XTHpW?=
 =?utf-8?B?MFg4NWJaNHVmdHJlbythb1RBdFBRaW01OUs3cnV0WllDM3JRaHQ5Q2RyZ1R1?=
 =?utf-8?B?VmhsL2JuMi9VZE9sVVE0cXJqSnd3TmVSanhDRDhvbWozT0RscU1MQ1lxQTU3?=
 =?utf-8?B?NDJ1cUZkaE01Y1hBVjFabW9QMGQwL0U3dTZjS1RNNUppTko0ZG1zd3llM0lZ?=
 =?utf-8?B?a2l1cTZuRm1rRnVvZWJYUnVYUGJMOFk2eVVzb28wV0x2SlJxVlhSRlIzUzBa?=
 =?utf-8?B?d3dQZ1p5VWNWR1ZhZXc3aXR0N1Bqdkk1VUlDS05uTmRwN3dWZVgxeGxOZXhY?=
 =?utf-8?B?VTZCUGVzdHJnSkIzR2JiWFduSmJ0ZldwR3J6Q3V3R3g3TW5xVlpwRTJNK0Vn?=
 =?utf-8?B?YUVDdk1qUElDZVJNS3BYV2krb0FmYnN5UUZXeFpVOEhyVEVZRDBvWDdRMkFD?=
 =?utf-8?B?S29HTDdtQTNMWHBrRlMyTjN4VlVpMWwrNEQraWNOUFVLRDNGak1QNCtrR080?=
 =?utf-8?B?UkFjZUREMjBjR2xXTW1NMWpMeVRhdFQxS29vekRmckVnNGpUNlZBUTUwTEUr?=
 =?utf-8?B?K1hKejRQLzdxWHBtelhPZFdGYUJSbVV6QlhQN3FRVVVqdU4xL3dCKzhzdU9F?=
 =?utf-8?B?cHlYRTA0eTJWTmpOKzUvNGVadjRkaHVPTG9ISVdVaWVqNG1Mb0JYZ2wwcFNr?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fGZqSzej98W6MEskSn6FRtMnKxaWg2re29N50++dA0koTiv35jVwlhOKUN6CERCZdqc56rdU0UsosiQi53dzCb0ApCcaeRx2YzB0hB01uSpnIQbxjF3+v7U5ChHFVLFqzDTxejY8m8ZTRQ4UvbGOiO5/ILIHFaHl6NqtXQIUGvIGRjJrvhZZezRLJobAjk8AHiU8tnZhxn2icw9qTY607amHkEUVIIcBiVrfxJyFt+G0UiZt9eY7ghMbtkpnUe2hZPTch2S7osw139e4vGVOucERKP47+egNZysUDucRbfhK0WnlTRLuvxkQSa9olj3S+wHv/P97s18e6/iw3+cOE51qpuC7MeWWvPO5dlDrhJgsFbcaj7Wujh21FaQF3wMlLdG+DuLG2TP7RuUs6N45EAHLSgqO5P9Ipspd5H9pNotyYtxTPqivfKWm4dK17h3lNmzLC6L6GVHHtrFeGUZ25T6ysqwQNI0/dXSRPcamLcbUEHpP49ZRd/aQAEudG/YlLepJoc4Jt254dRpTak+OLR+vM5CqtuLCtKF2euFQV+hjAjboUqjGOUvCKGdjs31vqO94ZHUCHO3sveB8frlpNh1oZYiLY+PZgFIdELmsqy0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c0110b-c719-4d95-679b-08dd457fa35c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:54:26.2161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvEgXRS+s9yO8eLweAdwTkGZUCrH8vUdOtJ05pzndwvew1ONEjmYZ8O3LByGMgimC2bluDHH+TehPbU0JfNPUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6277
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_10,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050004
X-Proofpoint-ORIG-GUID: f9rmSAffMXtracaE3vIWM3Maukfmz0oU
X-Proofpoint-GUID: f9rmSAffMXtracaE3vIWM3Maukfmz0oU

Hello Tejun,
Thanks for getting back on this.
On 5/2/2025 6:17 am, Tejun Heo wrote:
> On Tue, Feb 04, 2025 at 10:36:35PM +1100, Imran Khan wrote:
>> Currently users of queue_delayed_work_on, need to ensure
>> that specified cpu is and remains online. The failure to
>> do so may result in delayed_work getting queued on an
>> offlined cpu and hence never getting executed.
>>
>> The current users of queue_delayed_work_on, seem to ensure
>> the above mentioned criteria but for those, unknown amongst
>> current users or new users, who can't confirm to this
>> we need another interface.
>>
>> So introduce queue_delayed_work_on_offline_safe, which
>> is a wrapper around queue_delayed_work_on to ensure that
>> the specified cpu is and remains online.
>>
>> Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
>> Acked-by: Haakon Bugge <haakon.bugge@oracle.com>
> 
> So, idk, do we really need this? Can't we just add a debug warning which
> triggers when CPU goes down with delayed works queued on it?
> 
Actually, we are good for cases where a CPU goes offline with delayed
works queued on it, because the associated timers will migrate to other
cpu (BP).
The problem is for the cases where a CPU is already offline or in the
middle of being offlined and past timers_dead_cpu callback. In such a
scenario if someone puts a delayed work on this CPU, we have problem. 
The WARN_ON_ONCE in [1] can indicate  this but the dwork's timer would
still end up on the offlined cpu and will not be migrated (since CPU was
past timer_dead state , when dwork was queued).

One way to avoid this is that we ask callers to do the needful (hotplug lock,
hotplug callbacks) and ensure dwork does not end up on such offlined CPU.
The other way (as attempted in this patch) would be to give such users an
interface, that can ensure that  dwork never ends on on offlined CPU.

Thanks,
Imran

[1]: https://lore.kernel.org/all/20250109232711.2081259-1-imran.f.khan@oracle.com/
> Thanks.
> 

