Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A22155C82
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970513; cv=fail; b=WqTUgZzlpkyDl8uMQ6HoaE6tYDl5DLf3lHEPzyGx2xpNhlJmkfIzo1xZZrIvh8cPDtbbgaBCCVk18g8YiuIBdvB7PFBZOom5Sihc0CK8p0//7OxllA32x2QNR/GMWIZETqnSz+3DqchXGY0iyX+fwPlb/HUHvleLwCz9Qt96yXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970513; c=relaxed/simple;
	bh=UOkHnpkuD9nf7CtlbXVXmWa6uiz0aRrAzAsUA5q6/o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W+TnGv+J7zjG2x2sLZaZR7L26ppzcYKs29ckLajv/MAkv93fdp5yL3MvqD5Qkp2sXn9KeEGANCEO/4J7LuxwTAOh5k9Rdvmu0D+CJV3LTE/3FMgVnJ3vNFeyZ+bwIh8USC8zZtYJD5VTDVTUfCiSNMbJllr9156UrCD4Ed6Wwok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OTJdc2JN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lmsrutpj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OTJdc2JN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lmsrutpj"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7u0MC022485;
	Fri, 18 Apr 2025 10:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=5BbnRsOCw4GQq67OLlFoM9QI/aEWvWyt209a67YLrCQ=; b=
	OTJdc2JNDCMAickZCxJyGcZMSEegJRfwHbfhKcya1I/lwoWt/HOaschZqlW2y3+B
	fPLkcjV39M6J4Lp1nOoLIpsesCPNwwcPZu53pZ/uRa5yxJVxScMjgvMbFIBmJJNw
	RuHMWmTfzFqhvd3rOulBnL91uc3lHebKE2ZcTM4gkTNb9FzHU8wucIxz3osFS3O5
	ocfaRWbYAb2MELBu1SFGPA6HYgwVNYG+FvXJ1CdW//8CCrPS+UDkyL0fCqMybmB7
	uPnDLiqG7/TO7oBRz3NmqaLcDWl3tS+MvEAlsI0o298L388KN1p450bgAAhmrD+q
	FGMTyOolMM051eYPSSPZLQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185myxd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 10:00:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53I8P6tI030983;
	Fri, 18 Apr 2025 10:00:42 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013058.outbound.protection.outlook.com [40.93.20.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460dbeytbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 10:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhdBAMl3815c7pAc/1DldCj0olf26EIhPUcSSnfMZFubEd1Vnd1uAK9Wmu60W43CaXA+mYVccv9atlwg8hU+G0X0vk5rgt1T/D8aW9nCuh3yW6Mlou31FQSKCibOV76LlmKc2DMKIv6sTaGvH3pht9I0oYKNEx895R6ZHxQQ/trDhZNN3VjlB30Cn9gL1RR6GjV4GSNFrhHsX7KjsDfBwiIPIjxGHtWqgsBJoT2HJrULfNZp8iMXpPprnU0k0ggpkMejxEOXxZytZXg//RRC2l6bvAZ/LveTeRUUD56vKwBCxN0AlxxbJZtyJ9Low1zIA13jYONsPUmYQCSx5ZsQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BbnRsOCw4GQq67OLlFoM9QI/aEWvWyt209a67YLrCQ=;
 b=rGz4A5ZOtNaB8DTz7n+p3EyCvbx2QP+ckxfprtQ3cW3pGR8Hy0LcCC/Uk/ir9gAYL6vjT5HRLXlOtevJpLtdLZPYqOR3T1xeEr2HYNCv/Gsq5vYX1enM8sCligBWezBdxz/5tKoI7yjyXMaE0Fc3TYeM92RhVIVlh4k4r08GF7/7ZBnMnFeR/g2IYBSpjuUBBWxHsHJyzPU/3lDMLu6HRCSY59b/ktv+Wtna5TQZFKfyUFSBBzsw/1FMq3Xg3Zrbo9ZENypB8ZTs6dObOZl+Iq+R1DJKuGnQ+neY4jEuB4I2HodwFvZ2Wr9BtscedAavIN1TeK8rZqVf6P/kdCBXsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BbnRsOCw4GQq67OLlFoM9QI/aEWvWyt209a67YLrCQ=;
 b=LmsrutpjbW46KBG57UlgIVQavFb7rdx+oCoW/BnihLuwuAjZyiP5BF5ESEyWe+lxt9zfpvxDHM/5je2YC5giQPOwCqRXgUczuIAj4GR/n07FbdX4xXL54YAiov5TzMOZ/y8CYQr7U1eTKE5z3VUDkbKCSfgn1zd29W7EG0AcRPU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB7513.namprd10.prod.outlook.com (2603:10b6:208:451::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Fri, 18 Apr
 2025 10:00:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 10:00:38 +0000
Date: Fri, 18 Apr 2025 11:00:35 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, nao.horiguchi@gmail.com, linmiaohe@huawei.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Liam.Howlett@oracle.com, david@redhat.com, harry.yoo@oracle.com,
        riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
Subject: Re: [PATCH v2 2/2] mm/rmap: fix typo in comment in
 page_address_in_vma
Message-ID: <c49c0c3a-d6a3-41d2-87b8-cdb6dd68afa2@lucifer.local>
References: <20250418095600.721989-1-ye.liu@linux.dev>
 <20250418095600.721989-3-ye.liu@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418095600.721989-3-ye.liu@linux.dev>
X-ClientProxiedBy: LO3P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b6ca2b-cf78-45ba-4e6c-08dd7e5fdeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YW0zTzFwaDdsWnEzdmxQbzc2MkhjeWorWHlNZmplRDBmbkFjb2lKWVpDWExO?=
 =?utf-8?B?NEwwRUJiMEFBdXZTS1U0MzF4UjFiNHBZa2pFWlBmWUZ2OWtQSXVRa0ZXRVB4?=
 =?utf-8?B?T1FabjdlV2h3QjhNSXh0MjJTRTRQbzNBTy9QajFVQnMwUDNrOUp6WFJXL2Rw?=
 =?utf-8?B?dkxwL0V0bVplaThPZkJwWVlSb0ExamdQQ2FEOVZtQWJQWlJaOUVHT01uOUxr?=
 =?utf-8?B?eWR5cDNtMGVtWFhxUzFZM0I3S1NjWHlVL0cxUGdVVEgvREpsTll0Qm9CUHdS?=
 =?utf-8?B?dUtVTTRLVTYwSFFqYzFPQ1BmMzZmUGxJbnE5QXNqUVRtL1lpVmtqWCt6V1I5?=
 =?utf-8?B?U1V5SDNLVC9sQk9vWXdzTFVObS9udEtRVVRFZGtkYmZwWkJrTkppaW10MGpR?=
 =?utf-8?B?SkkvbDcyYnpMWFdaay9JWE44elgzeW00S3d1NWF0S3ZmdWxNV1gxWC9VRGV1?=
 =?utf-8?B?UmNOQ3E1ZUl4MVc4TkcrK3BITWVhR3RtSVZOVzFLaUlwQnBLMFdaUjZXRy9W?=
 =?utf-8?B?dFN1RUJsaW5uaks4WDVZd0FrV0MzZUsxNExtLzdvN0hWdlZwVUZaUjZKK0lO?=
 =?utf-8?B?YnZ6Nk9qdzJLeDNYK2RjU25LTUYwazJhQnN1dkVubmZvbHprZHh6QXVYMDhJ?=
 =?utf-8?B?eVdCcjYzVTJ6MFpDcFJ6Y083VzdBTURDUk11T1dKQVdjaHI3VElBL2E1NnND?=
 =?utf-8?B?Y0ttRTlPL0EwSmdtTDhnY0pFVWZhdU4xWmcrdjArTEdzYkVib0wzd2E3Zk0y?=
 =?utf-8?B?Z1B3RmtoTm5KMEc0NmRXSkdXcmZ6MjhUcUhIbHU3c2VCa2JuQ2puODIveCtQ?=
 =?utf-8?B?R2VMRmRwbzFGbHBrc3pLWGp2Nlg4ZTkwYVFmVGxGOXdQZG9FcXVRSkdIeGRZ?=
 =?utf-8?B?VDNrc0dma0xCQ3RmQnNSdFVHbGkyWmU4YkJ5MXRRMlRmRUY3UFl0bTRoQWRZ?=
 =?utf-8?B?Slp6UDVUY2JObUFUY1RmU0tnRTlHZzY1bWQ4YTZTbzZrZjQ3b2Znd1ZJMnZL?=
 =?utf-8?B?eXVWbWNlVGxoT3gwbHJjclhsdHp3M2tNOWZOVWsvMVlZRnNCUnE2cStUL1RT?=
 =?utf-8?B?U0FNQStvWTZuTDlNdmllYWMwMEorRVQ2UjBFYW5ZUzNaQVQ0YUlkc2VVQkpD?=
 =?utf-8?B?Ujd2K1krcTZmSk9BM254VlkwY1NMaTJUenpQR014MnlMeGs4SjcwSTZQRzk0?=
 =?utf-8?B?ZG9EbVRmL0FGbFB0MnBXNGhXa0Z0a0wvdEs1TVBkNXlqMEpINzV4RCt4Nlly?=
 =?utf-8?B?citXQmdvTElwSkVDMDloQ29CZE1QeU45MG5hQmtpNk5mYmFYOWt1SHFzTE1V?=
 =?utf-8?B?K21rbXFVc3g3akY0NEpFV1daOUNZUlp3MjNGRjlUUlE1Rm5rS3o1OS9JTkJO?=
 =?utf-8?B?TGZhaDlja09sT1NlTngrOENta29lM1RXb2pleXRGNFdETWpWbkxMSVVOZnZH?=
 =?utf-8?B?Wk1uNkFEL1VqR2kxZVFwQnljSjBENEd4bm5STmtiekJDd0RXcVlyQ3BQVUM2?=
 =?utf-8?B?RHdMYytwbVZ3SCtEdFZna3ptZktoWnRudHJzT0VWZTBvZHlNdDd6Y3RzRmZB?=
 =?utf-8?B?R2F5ME4vT3dIYnFDMnVEd1QvNmswTEVIUnVld0VzVzZETzdDZllLR1JmOTdL?=
 =?utf-8?B?ZWVVaG4ySG1KaDBmOUhlRm81K1hNOWVESlpTcDZsd29KaklZZUlJSE03V0k4?=
 =?utf-8?B?d1FpS2dkQ0ZuVXAwNXF6c0VBKzM3NjMyM2hXRVdPVVN0bFc2WjljNDA4M0kx?=
 =?utf-8?B?WFZ6Vmx3NEpEcEFmenFZdHAxc0MrVXF5UG85bEhoUXJjaUR2RHZGcDlEdDZx?=
 =?utf-8?B?c2VtWWFLS3JRc1V5dndOdnJITGRmeEJ5RGorSk84cFlmOHZjdnBzVVZ3Vnox?=
 =?utf-8?B?RzdSWHgxek9vQmVpeEdMaTIwbGhFMGNpQTF3dEM1Y2plRHV1RHZxaEs1SDZh?=
 =?utf-8?Q?nYrFM0ZlsE8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC94OHZXdDlJVXprajBoem15KzdxeEk2NHVwbkZ3UFBWaG96ZTVDVWYvYTVl?=
 =?utf-8?B?VHk3VU1HenQxeHFIbXNUdHN6NkRxaFV6by9nQ3cvdnI0c2dMbXVTdWpmSlVm?=
 =?utf-8?B?RU11TFNPS1RlK2dYT3dyR0ZPMkxWT1FtVURuYlFpMW0wSVNzU2d6MWQwUWZj?=
 =?utf-8?B?ZjlBMFg0aHgwSjJMZi9RTk0reHJOQTdiWSt3dWRXR1ptTDZ1NUE3ZlZ0VTZh?=
 =?utf-8?B?OHBFK2NhZVdRSHczcFFGV29hakJPLzJ2emFWb1RPUHhVb01VVHFWV0JtK2xW?=
 =?utf-8?B?b3c3Zlp3djE2dm5tUXJ4UDFJMk5QREdHVkNYSUdVb0lHb2FFQnNpTmE1Z2li?=
 =?utf-8?B?ZmVvSmwxSkhYU1BKdUtXZDFkZDBIeTdFeHJLODFhS3dJd0NRRHZHTWNXWWt2?=
 =?utf-8?B?ODFqZ0p3ejRFT0luMkZxOG9CMTdiZ1ZGRnFNVkFxQndGcWFrYVhRbTcraWp2?=
 =?utf-8?B?QTh0MnZlVnNScE95QXNpRTFxS2dMZ3FEQ1JLb2t2bG0wV3JpcTFseVppbWF3?=
 =?utf-8?B?ZkF6aFRlVEdNempRUzJVdXhtTmVzOWdXWXFmZDN2eGFQNlgxM0ViK0NFK00z?=
 =?utf-8?B?TjNsRkYvUWVUK3IvclZiVzBsclJvQ3h5dHUxc1IydG9XUncwKzNYWTI3TUtl?=
 =?utf-8?B?MlVNcHl1UGtCZ0lDeUxneW5rcWtwYWFNdVNxTnZpa2k3Zmk3dCtYYWw3TjVC?=
 =?utf-8?B?ZHRoSEJQcGp5bWNKb0RNS1ErdWVJVTh0cUdncDFwSnlBYm1lRE8xSFhJN1k1?=
 =?utf-8?B?dnhFTmp3V0prMU5waXpTaUEzbmpsRlphTG9BVG9qelhVZDY3cWhQUmpTYzFI?=
 =?utf-8?B?NWR4aTB5V25kU2JHT3gvaVV3TGFiTmVFS0FpYWZzZ3IvajhiTVI0bEF4eFVF?=
 =?utf-8?B?MGpiTml0RjVPSTVhTDFJWWIwV2tWNGFHaE40Q0pXbUpjZnRzRHZZWkI4SThm?=
 =?utf-8?B?K0IwN3BqRTJEVmR2YUUxc1RXQ1M0Qm9sSmZqUnh2Y2NkY0FPQzdRYmU4K1dT?=
 =?utf-8?B?aEZsaWRHSXczM011elVSb1VaeE1BcmhYUWJkUXBzK3Z0eG5xWVJaVkR2a0hh?=
 =?utf-8?B?NnFCWTljbldQejZTR2NHd3UvaHhiN0NBOC9JQnN4YVdSczRBU1U5WnVzSVhV?=
 =?utf-8?B?NVNPS2NLcTlKSVowZno3QlRVb1NFTzdVYVl0d1hXVVYzalJnbmM4dEU3cVlN?=
 =?utf-8?B?NURKeEszM1JkVkw2N1JzaHNwSUw5VGM0RHZVZVAxQ3cvUTk4VDZZeHBMMk55?=
 =?utf-8?B?L3YzUG80ZDkrVzFKK0VVUkE0YWdoK0h1S3JER09tdjFWWnh4Vk5FUFIzOXEv?=
 =?utf-8?B?TWh0VCtTdkNxZUlLbjdCNlI3K2pHRTNKMlFZSmRiVTM2NmIzZDI2aXY4elI4?=
 =?utf-8?B?alJHMkZPOEFLUExFanJ0YUVsUG16RUN3Y3krTGtrVU1ZNDlENzR3N0hxbzNJ?=
 =?utf-8?B?VmJoeUJJTzg0TnpSR05vdk43RU9xR0lCL2NEV2JxMzdIKzBLNzFBUmRrY2xj?=
 =?utf-8?B?SEJUMmhzQUcveFFkQ2E2bU9TSUhNQXpZaCswVXhhL0lPQU92YUszd0VaN1gv?=
 =?utf-8?B?Uk1MTjRqT3lWVitjamFVMUV5TzBHajhsSkVvck9NRUduZEV3M1daa3BIREFK?=
 =?utf-8?B?UUp4MVBQU2VuWVVLQUtNQ0ZEMDNVK1NJUHNNQnlGUkFEUVpsNWljNVp2ZVVG?=
 =?utf-8?B?V1ZIMDg4VlNpSGNFR3BMOHJIZXk3anRuU0E4Z0MrdG9PcHIraDZDZy96S1dU?=
 =?utf-8?B?djdYOFhoR1FzTnIxcCswT0JCcURITVBiNGJGOGpmclc3UDJ2TVo0Rk5YTW5y?=
 =?utf-8?B?U09xU3BnbGhkUDFta2ZRQWJ0OEltY1VIM2w5K3RvTUdoRHhqTjYvQkxhQlg1?=
 =?utf-8?B?RlJWb0ttcERmZVU1NDlaQno4d1lzNHhYVHlUQldTdGV6OEs4c21xYnIwdUNQ?=
 =?utf-8?B?YjR5d1FZSlBxa1pnNlVlZTU2ZUo3WDB6bE4yc2MydnR3cG5rajA5ZklHU0JS?=
 =?utf-8?B?aUxXbWRQdU1BWnJabmx6amhYSm4yOUF4cUhsaUdCZFlBN3FReDlPNDR3QWpy?=
 =?utf-8?B?ZEREZGhhV1FBdDFiRE82OHlwRUI1YjlQZ29zRnlpNjE3aE51UHNxTjBqdnlC?=
 =?utf-8?B?Ym5Za3cwc281MkhvcXNTd1B1ZXVncjVHQlNtaHR5aUVKbTBGWkJtRlFVQVFs?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Muxjd7GSMaNutzfSfjVS45K1SUjuqm0PWiMgtowy4ZH+A7V62i0ovkotZtp/EqmomUe/oWYx3t6KJjaDAaxNoBh9u8feBpB3678Xs5RluxQoytvGC+7EdW5ESo7I5gj2UOEMP6r0+lVtH3tEujNQ7Y0wnFIdy8p+K+zcmu1xOt3pJGHOOJY2jmHt2OAMzMWnzdJBtAyzCmZDErZU7WlHfdGcUFx3gVYemg1zRwQ31zMFYnsr3Deb200bpqopTmOenPJksy1iRo4gvr+lGpFPTixEDqhsEJiAnYg0A8OYwwpQtsiKuuYSEucsvsRzhXMfx+kZ4jyiBS0r8IqgIbbv2GMCkBYg9UWeLljuoJYOH+54nWZJVtAtZ2R/t0n7k3uKQXykWa1gKPSYqkxbki0CH1Xmk0ttldq/yPO+cTo1jbbjvTrNu4swk6GBlC2D5v/kOAC8gEqS/uBZq6m7Kg/qBtXCv0c81Au266O0ABft7Z+iGn/7SLFbGiwbEd3lVplg1L7S9pU7lOhXu0QFFQpkEm9DZPQuyiM862Ah8BJhE84r6xCmKWV7snc5j4IoPrANlf3GxZeYlfRpKEZcvFMDt7y4bfVkuvlQn8LrlaoetKk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b6ca2b-cf78-45ba-4e6c-08dd7e5fdeee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 10:00:38.4261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2i4l6YnMioXAQru9zBdemuusE3dCUO52P9XmAPDn3GAux82W0Kbfbk6tcIzAXTC/mzjlWwIs+AfLzSHwXPbI5FyadwHGJYu5pxSETMQ3L8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7513
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504180073
X-Proofpoint-ORIG-GUID: Io9NxswdaGmmMt0G5id3ZgoEgxyo147n
X-Proofpoint-GUID: Io9NxswdaGmmMt0G5id3ZgoEgxyo147n

On Fri, Apr 18, 2025 at 05:56:00PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> Fixes a minor typo in the comment above page_address_in_vma():
> "responsibililty" → "responsibility"
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/rmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index b509c226e50d..a9eed8981e18 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -774,7 +774,7 @@ static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
>   * @vma: The VMA we need to know the address in.
>   *
>   * Calculates the user virtual address of this page in the specified VMA.
> - * It is the caller's responsibililty to check the page is actually
> + * It is the caller's responsibility to check the page is actually
>   * within the VMA.  There may not currently be a PTE pointing at this
>   * page, but if a page fault occurs at this address, this is the page
>   * which will be accessed.
> --
> 2.25.1
>
