Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307F1519BC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674405; cv=fail; b=gA8f58+g/EK4j8/zkAUyhItb/PSyv47waj0OFUm99t2cEzJmemWMRd6IkG5VtLQ1DQijSn8dz2jFoo8LGsW3jZWrSlnr5oKMPoyb4RRJUz0jmKw3ZyF2E8Nzn7ZqBjzIHUxVJGputdjfnUbBTbhvhFi7T82hqXjULzZ1JiS3CHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674405; c=relaxed/simple;
	bh=EsaZcAkAadfHYGGA4yXnU6hwMCNsqt63GPPTOAUFmUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=imAqMAWIpRXewoptswGIN9QIC0r/MJ9ahn/6Lm8XEqOFKEAlGat5kpXPDkwut6EgKPMBgHatmJ2jpeXGlRES3NnTWDWd0PvIs5ZgoJksQ6/4T4RRkpX4yB3/ENVfN4qvMVRRZa5LnKR/T/PQ6ZBsAAxMnUAnxZq7NiSdfhaGbH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gV9gCfR5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fujRfF2o; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gV9gCfR5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fujRfF2o"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8pRil027142;
	Mon, 23 Jun 2025 10:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/T6hglzHibpgCUE09aJ7KjIddVFjnwJNVjfR8fqKogk=; b=
	gV9gCfR5ICPuEClXrwLXJ2r7fdlCj4oGCVuRKY6W86PhzCdec3OXwh3rfJVmvfo5
	2hDaD/BgMgiE+GP02wGJCI6dYJRLjl03bv0s6FzAhddNyACHdrEA+b4zYWcXpbwO
	+cpXclvuB3NAYy00ukxy0hGG+QA7AxUgLF63vRQKTgrzhBqr1XgevYJCDQlhEQ7l
	wqzSqL7E0Q6Smcm6aZ4PERm0AmWQtdSJozLYcbWPUDS2OSUwoFnpaCCC4xpcFrE8
	5wv1HsiSfu7q+aisn3zsrGfpf0hjB6rp6J6wAwjsG7Koo30rcCfMTy1xfj8BtrUN
	3TTZ0/ZcGEFGy0/0Tm34ag==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mtcwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 10:26:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9MUmn024338;
	Mon, 23 Jun 2025 10:26:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkp5ra8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 10:26:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzfJ/OrMJd8XMOut/4xroG4coO4UEKZSETD/oUyPKY7obc5ewovnRTAHTEmEleEB8z/r3e+Tsso+YCtnz5v+SEYLrNozC6KyR1glIMM0Bos6oj/Z6jZHkPz4kco1w5tfuGJ8/MB5U2S9Jclk/PjZFIYw2bJ3C0vGzjvd7KchBgaEwwvI8bSUzbyjOw2/elCHPFsLgPWsQ559JzidC6/1DzcYpIO2vukgxBj13cIcEOWUVjDDB5LAmATL6TCsr9y3+WnTh4MyioJpAi2vdlehUxHuQklXOaxU4FoLiuCCSolQjq9BtqErRxYRQnfft+e7IEteFl15SxUqs11S2n+Iew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T6hglzHibpgCUE09aJ7KjIddVFjnwJNVjfR8fqKogk=;
 b=jGU43xjRmpWjHAC3zKNxhhyD8bU2T4WkZdml5paZp0gatdggZdyq9AzDtm7bcAEjGrsHmEh+U0vs2I4A1rt/YdY2brM19pBJFZeZ9Ls1eQs3rb7YoGqf6nESEFFSjvM6d4x5PsEDnGtjnQhVGb8rEqZpemCLwx/uH0BLWzViq6ufJ/hEMzogkdhUXNytG39wMtcmjWg/krw5hcgxIeut8+pJUFwGItBwdrvohgmqWaQhxzxb74cZFQ6nFlUJdG7cmdOIHvDsuV/D0NsF+nN1qgTpfPXvXijCByLF01YvhMKmdfTpjAEcF+bYNJsY4SDPDNJ3Rv41lFPSL3hsrq0frg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T6hglzHibpgCUE09aJ7KjIddVFjnwJNVjfR8fqKogk=;
 b=fujRfF2o3dvSBPYJeSvqxDws+GKQ/RtlyHnhT6WkQITSpiByKwzxKX5IxynEZoBrOkPInr2BGHUWBak7xll7mvaCIXC8m0ba4beloU8bDaxvdmHxkQgVwuWB8S219rtHtSv19QjbQXutPn/6dgryLW5S4HfThKV9GmkEPMf4oYk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6390.namprd10.prod.outlook.com (2603:10b6:806:256::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Mon, 23 Jun
 2025 10:26:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 10:26:23 +0000
Date: Mon, 23 Jun 2025 11:26:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <17180060-91a4-4957-a6aa-8e8adaf50ae8@lucifer.local>
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: LO0P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8994ee-d234-4fea-5c16-08ddb2406756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEUxT05vN2grVUlLMVFxNmhRSmh5OUUxazZWMm1iSHkyZzV1UFhxTDBvZ0tB?=
 =?utf-8?B?SExueS9sZFZYZzNVNW9XeFR2disrWHhXMGlPQ1lyeDFUODdvK3FkbzRoUklV?=
 =?utf-8?B?UEltTGgrWHp4M3h6TnpNY2FhbUtjci9VUWFjQzhSN0lyOWJ0cVAvSUx6ZytK?=
 =?utf-8?B?cjNpZ1ZBUHdpMzUvckdyQ0hRUHViZHF5QmR4WHVRZVo0WGF1cC9VNW9ONmJR?=
 =?utf-8?B?d1R4anA2N2pKUERrS3RLaEFEd1g2SWs5MSsxc3AzTjArcFZlOWpndTlRNFRs?=
 =?utf-8?B?MVFPVFJId1pjVDBsZnBUQjM1MVY3bjhCYURlaUYyQ3R1cDFqelQ2NUt0QVRE?=
 =?utf-8?B?bFJ3QnVDVFJoS2k5SUF5dCtlT2Z1enhyNDZGMStmV09yMTJCUXVvKzlSeUdH?=
 =?utf-8?B?S3NFOEtqU2pDQ3hLVUR2WDFxZmJrcFdJb1M4elpxMmFwWXArdExQQVM1Ymkw?=
 =?utf-8?B?T1l3bnVKNUtPNEhBYmdoalZBWUF4QW5rQU9uSGlRQjllMXNUSmRRcklkeUUy?=
 =?utf-8?B?RnQzeHJxMFRrOG9qZDk0OGswdHNLNnVKamdlMU9ZandhRklya3I0cmVxN3RB?=
 =?utf-8?B?NzhNTzI5REc4cDZ6VEtCVHQ1ZE9DWW0wM3J3OHZEMGozM3BoUG9kRGRUV2ZV?=
 =?utf-8?B?Z1phZW1QMUt3R1dmR2lVNW1DM3hJU0E4NjVuenVvcGwwSnppUndoSlRWWXNV?=
 =?utf-8?B?OVpIM2FPbGk1YjVvWmdJb0tHMjdtM0VyQlBFVkdHNlpLZWVJZ1ZsWnRFOGVx?=
 =?utf-8?B?dmNQR2w0bDcxUUhHaTlqL2tiR2pvMGlSVkJsQ2hCdTdmbnVYRnRFejlNd3Ew?=
 =?utf-8?B?MnNJT01UbnVDMGFRQ0xpVUdVVnVIZ3pFOVRhZ09SR1YzbnBJaFljUVNlQkNT?=
 =?utf-8?B?citpamxPb3Y4L25ydGw3eFlQaU1VdjhsS29LdTdNdUF0cWJwK2hWTUwyM0FY?=
 =?utf-8?B?b0VwQ20xNktGa2pnR3kxKzhsUmZxbG9mcjhzWnhCZW1MQXlsQ3NheVlTOENU?=
 =?utf-8?B?S3pwQ1ZZVEpZZzVTN3NxdFFsVFlST3lOUkN6OGxzZ1l3eXV0KzFRVElCQ2Qx?=
 =?utf-8?B?TUZDTFZ4cnNXM1RuMEkyZ2JsK3R5eWdxRnNKMm1zekc5VHhFTlVsYisvZTJ6?=
 =?utf-8?B?ZFZQSjk3YmFBNksvQWpXNnc2a2tMNFJRY0hDNURrOVM0SW1IQ0kzMW5uV0lI?=
 =?utf-8?B?QnRYQTIrd0J3MUxWV01tZHJiZmV1ZnBZTVV3amdXdEdMTG1xSzU3d050LzNt?=
 =?utf-8?B?Y2o5TXZxQXhTNFpkbExvODlOYnpOQ3VYMFJBbEpicXZhdUM2SEZZS1ViWUJT?=
 =?utf-8?B?MmhrWFpGSm8yanVrQzlvTURINjFtL1NOWFBoWlZRWTkwbmo3SC9lOFRGZWps?=
 =?utf-8?B?clI5T3h0UnU3VjRBYTF3em85Qk51SUZORUszL3NHZjR1MzRqYk9lVmVDa3Vv?=
 =?utf-8?B?WWFiZlVnNG04bitVZk16RmoyUFE4YVM5bnVVeExPR2Q3MmhFamNkUVY4d3lH?=
 =?utf-8?B?TkpQQWFVY2lzOUJvUjFDWEx3N0l4cFREZWRrRHVjNFNrK1JoZUViK1F5cVFO?=
 =?utf-8?B?YmpZWXpUT3Y4T3gvZmhaR2Zta1Y2emt0QWRWeHNrdlI4a3pxc3EzY1Blelcx?=
 =?utf-8?B?R3R5WWhjZWlzMjBqTEpwcWh4Wm53TWR4OFU2alVSYmNjREl2Lyt3WFVHUmo2?=
 =?utf-8?B?K2h5SDZaY2VZbFI5K2ZZKzBQZktyeW00ZFh6eUkwNklDSGpQd0xFaCtvNEpJ?=
 =?utf-8?B?OExVVTBKSkVrek5NM3BHam91QkhhMzIzNGh2a3g2N29iaEJtQWEveUZtNzR6?=
 =?utf-8?B?dmRnNjYyUzZqQml0OSthTFpPWngrZVhRNVVZdmZJd0JON1RzK04zUHhIcVpI?=
 =?utf-8?B?S1pwbVpwWllJRUFlNXBzajZwdzRnUmZtb0N2enNHODh5OFUrL3NReXRHaGtU?=
 =?utf-8?Q?mXWXBpz9VRA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm1wbW5LRGNRY0VIWHZJRGdXMS9Pa1F3ZGVFT0k4VkswVmJBclY0dmZ3R2ZK?=
 =?utf-8?B?WFJaZjlsdDlWN2JGZElrWUwxRm9nWDZYaDcrUjQ2NUxLUVRla0tUNTFEQ1pU?=
 =?utf-8?B?QmU5dnpRWmszeUlpcWExMHg0Tis0Z1VZN2J3MEtRWlFOdURMSk5JR3orYnBW?=
 =?utf-8?B?MGlMRVRZNUNOTjFVNGNjSFAxRmZValpsRHdrQjU2MFhoNThDSkJwOTZqdTl5?=
 =?utf-8?B?V3RFSHV5QXBWSXpaUXpaR3JoSGl5WFVZRlArdm8wL0RvN2VvQkowdVJ5dXdl?=
 =?utf-8?B?VzhkUkhhN0hONWdKakJSSC9mSnYwdXV3aVFpcXUreldubmREOCt0K0tPaEUr?=
 =?utf-8?B?WGNOQmx5RlpvRENSbGhXTklhNVMyT1ZSM3pjSmVRS21YYjdXUFpMNWc1WEtm?=
 =?utf-8?B?eGk1bzdUOW5vZjJqQkpkbWpZWklEbi9XYmE1TDlaTXBpVVRxWkdlZ2xhWmxw?=
 =?utf-8?B?SFhjU2dWNFpYbGFORG9DRkM2M2plckkvV3dlVTFUdWRMS2ppWENGWmt4V1BJ?=
 =?utf-8?B?aVpBcVNwVWRKaitzYjF0eGhEdUtYcE9YMzE4djMwWUhoWXVQc3ZQTWQ2UXBr?=
 =?utf-8?B?ZXBrRFdsNG5zdklyS3pUUEVwQ1g3Y3FqenFmNnMxa1oxczJZMWF3NEVLenZ2?=
 =?utf-8?B?SWNJdDEvRzNrU0RpSzh5cHhPU25xRmVRYkFVc3JnZGVtZ1lwQnRnN3QvdnRU?=
 =?utf-8?B?Q1MraTVnZVkzUXFHSm9TUGoxVHBJc1cvRHR3d09scG9wY2YwZEtOeTZiZGlh?=
 =?utf-8?B?QVRJbncxN2tkZHQrcWFiazdNZ3cydlNISWtzY1BBaWVBeXcxd2h2bjQ3YUlN?=
 =?utf-8?B?Nlg4U3FLZWE1S21OazJQVW5nbU9xTmlBNGRxZ1NIT3JydDh5ZEhsbmx1TWdn?=
 =?utf-8?B?ZlNRUktBMi8ramxwaGZKOUpkZGFJS1NsOTdlTmRYc0RacTBKRWlVSENEOHo2?=
 =?utf-8?B?ZmR1bDc2YnB2Q2NWMEgzNWlHcHNNZ1diSGlYOExaM2gvVFpTVlF0K3FadE9t?=
 =?utf-8?B?bXFLV3hWc011MFZyM3J5a3l2UXpHdE5FVHl6dmsyMys0QkNBaUpndjVKaENu?=
 =?utf-8?B?eEhPUWlSY2RZUmQvSXF2K0JmUW8vOXE2WkduZVcyVDJYaTZzaEhpbWN5byt6?=
 =?utf-8?B?S2pQeURHYmgxL1A4NmVPZGQ2eFdBd09tTlhIRXhsWm9SKzNCTFFnS0s4MTZu?=
 =?utf-8?B?T003dlpvSW5XamhEM1ExYWxDaGpKaGFFQmQvWXUzRUJhQ0dNQ0picUJFcVdY?=
 =?utf-8?B?aExEWG1jdHdmVGJjbFpDV3M5cjMyeVJiNkFyOFJncEZjMGpIRWZFK1dIMUZs?=
 =?utf-8?B?YVpmYm1PSFdjUVVxZG9kUTJhL3N2ejhmSzd3V0lnYldkeFJNRjR1YzBqVzNN?=
 =?utf-8?B?VENWRHhveWhqeWszMHF2VHdYNFdOU294ZjI4QWNYUE1IdkprcDk5ZXAyT0hW?=
 =?utf-8?B?WHFDQlNuWFc4YWtXdVliQnFGcW5kVWp6NzNBQ0tDTVZzSjZuOTJ3M1p2eko1?=
 =?utf-8?B?TmxpemVWT0pNUUYwTHRWMHlQb1dUb3ZVcVdXV2tGbGZudVJOdHhjL2FubWF3?=
 =?utf-8?B?MkhIUjZjZThWa1ZYRm1xSyt4bnVqTktVVGFlcFJuQUFlRU9OWWtwYm5WQ1J2?=
 =?utf-8?B?by9weWtFS1ZRTzh4KytqNzdlamEvRHUvWEhyQVFyaVlqeXR6N2ovVEZMRmZ3?=
 =?utf-8?B?N01JNHVaODlLdnIxUmRqU0FPZTZmZVJRZDY0elZFZDB5WVNDV0w4SE1MQ3kr?=
 =?utf-8?B?RVhZVGlldGVSSzdLWXR0ODlrcVFnQWtpSEV4emtYZG9SNERudnZNSnBWN0RH?=
 =?utf-8?B?eUxCaFp5bjZxa2doM3hzaVlqK1NrN3BKUGlIdkppRlNmWEFka2U2ZkoxQ2hH?=
 =?utf-8?B?Z1Vlc1AxOC9peTNlV0dpek5wOXFPSVhuUnhoM2l5SnRsVS9RWVp6MkIrWkxh?=
 =?utf-8?B?b2R1cXRybS95cS95OTk3VkFueG5GdTFZVHJnTFlUaW1yWDFuWmEzKzhxWVlH?=
 =?utf-8?B?YkwxSmYzZTMyODZKN0RYY1d6OXhyc0J2Rk1KaktZM3hXcXRsdUtWc3Uzb2tY?=
 =?utf-8?B?cTM4M2p4aXVIWkErUXdFd1ZlNlFRUE5rWDcyMU1lMTJ2MmZTc2dHdFpwSDd6?=
 =?utf-8?B?aFBjT29Qd0xtNDZpRjJTMURFTk1YaXJQZDM4aWluTEVpSDBWTXloRkloVEVL?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gVPJ0eCsJaWPFmFw+p1PsyMawuNvtn0KhidgIFZ8Hi5VHn542m//r4kgA0vptrtEOtusn+vJ9eLD+AJMFdXI1/W8dpaJ2cv3IGTwfKkCOSJkCEZeMiGxMePy5KAaMqagBObOhmziYh7oMQl6lTiPIQXBZsMuQ7i5oc9U87ItveLQEY+g4PoI4AjJ8sd7b+sQypzaTjKV/W3D3yxuTh18GdHmgocZ87XtHmqUk9fH5paou3r2DgGS9/YVOd/E67GACmAKcwVclCvk7lVQRv5AyNX9S4Jkmp7MRbAEFKM0lcm6ME5Skv7EOsBSezXTa/zvm3Wk8+qkkWMDPT2k9hBrALS5XZ/68lv/Ef0WP+Gdbfqk8lKVdG/YftxUQON04yYUh9qrl/3xz4SfY/oJKfkBw8srKXJr0+2EOnVMqOr9T7A1B39AWNoQqqGAcI7nFSaVT30BTNPAbEYa+oQxxVFvl0Jtmzj5ZmU17ClciZk9UM6nG0N6KIdy9OXyMmVftHENU/dRcVHSBQzw9/mwHPDxCN85YCNxjQUiKxFhc/DP0DKXdCpTvF0Nv+HAwM2eusxj7zeOkgf/BfiMe+m+1K9MY6BU4HgKTL6gTyJj4XyFgTI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8994ee-d234-4fea-5c16-08ddb2406756
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:26:23.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPLwM5zduHjeLCH12nXfbZ7cWhO9VVSWaF/XQFcR8Rf6uE18HDhTLgMOw2CdK1D1Ys3wxtCnXG95vW9k3V1OdzL68JKOcJ0XX/i3pJY8kaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6390
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230062
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=68592bd3 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=SRrdq9N9AAAA:8 a=YUoa6jniST8JHMrpNP4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: XtoBCLpkUfXklLp0hHakaOMbgtjg2fOu
X-Proofpoint-GUID: XtoBCLpkUfXklLp0hHakaOMbgtjg2fOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MiBTYWx0ZWRfX+jHxL9YD8LW/ N+RfQjcLAn+2tjOKldLvG+zAgk/pOAUhWrwhHRn4R22T/aC7ZR79TfQfFFLInMoYb/qEoHCU2Ap vrX4RPq42I+roze1sxBpYEehahnrpgenIL9teP+X1/A0333QJuK5oeEs873NrUR1bUGAc6bKZXm
 WfGtezjXJp/lDD9TyolqCpuPVoe7beTtYt3OZ7c+vt5iDjzex1pVoniYWMVZyXSy9oXoUqeaR6P ReHRvXnKUKCltRcJeDsnJVMteChPNbByj1m4IfQarO4wDIQnmxAlS1bd//w4M5coKcyRm1mWu9L wpNeRiaTKKGMD2zWXZQD5skT6dNAMYlzZT2pTbidfm7UUkGS6VFgqhNVRFJjpTK5czebgkyn9R2
 zTolQVOmHZY+vzstJndU0C/98e44FACJIoZHnuuNx9GVb6oTVbkQcb7esBmYhBjHMJuRg3u6

On Mon, Jun 23, 2025 at 04:28:08PM +0800, Baolin Wang wrote:
> When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS flag is not
> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
> callers who do not specify this flag, it creates a odd and surprising situation
> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
> being allocated and used on the system.
>
> The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE will ignore
> the system-wide Anon THP sysfs settings, which means that even though we have
> disabled the Anon THP configuration, MADV_COLLAPSE will still attempt to collapse
> into a Anon THP. This violates the rule we have agreed upon: never means never.
>
> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is only
> one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
> collapse_pte_mapped_thp() function, but I believe this is reasonable from its
> comments:
>
> "
> /*
>  * If we are here, we've succeeded in replacing all the native pages
>  * in the page cache with a single hugepage. If a mm were to fault-in
>  * this memory (mapped by a suitably aligned VMA), we'd get the hugepage
>  * and map it by a PMD, regardless of sysfs THP settings. As such, let's
>  * analogously elide sysfs THP settings here.
>  */
> if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
> "
>
> Another rule for madvise, referring to David's suggestion: “allowing for
> collapsing in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>
> To address this issue, the current strategy should be:
>
> If no hugepage modes are enabled for the desired orders, nor can we enable them
> by inheriting from a 'global' enabled setting - then it must be the case that
> all desired orders either specify or inherit 'NEVER' - and we must abort.
>
> Meanwhile, we should fix the khugepaged selftest for MADV_COLLAPSE by enabling
> THP.

Thanks! Sounds good.
>
> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Appreciate it though I'm not so bothered about attribution :) but just to say,
of course the 'never' stuff is David's idea (and a good one!) :)

> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/huge_mm.h                 | 51 ++++++++++++++++++-------
>  tools/testing/selftests/mm/khugepaged.c |  6 +--
>  2 files changed, 39 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 4d5bb67dc4ec..ab70ca4e704b 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -267,6 +267,42 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>  					 unsigned long tva_flags,
>  					 unsigned long orders);
>
> +/* Strictly mask requested anonymous orders according to sysfs settings. */
> +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> +		unsigned long tva_flags, unsigned long orders)
> +{
> +	const unsigned long always = READ_ONCE(huge_anon_orders_always);
> +	const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> +	const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> +	const unsigned long never = ~(always | madvise | inherit);
> +	const bool inherit_never = !hugepage_global_enabled();
> +
> +	/* Disallow orders that are set to NEVER directly ... */
> +	orders &= ~never;
> +
> +	/* ... or through inheritance (global == NEVER). */
> +	if (inherit_never)
> +		orders &= ~inherit;
> +
> +	/*
> +	 * Otherwise, we only enforce sysfs settings if asked. In addition,
> +	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> +	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> +	 * set.
> +	 */
> +	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> +		return orders;
> +
> +	/* We already excluded never inherit above. */
> +	if (vm_flags & VM_HUGEPAGE)
> +		return orders & (always | madvise | inherit);
> +
> +	if (hugepage_global_always())
> +		return orders & (always | inherit);
> +
> +	return orders & always;
> +}
> +
>  /**
>   * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
>   * @vma:  the vm area to check
> @@ -289,19 +325,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>  				       unsigned long orders)
>  {
>  	/* Optimization to check if required orders are enabled early. */
> -	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> -		unsigned long mask = READ_ONCE(huge_anon_orders_always);
> -
> -		if (vm_flags & VM_HUGEPAGE)
> -			mask |= READ_ONCE(huge_anon_orders_madvise);
> -		if (hugepage_global_always() ||
> -		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> -			mask |= READ_ONCE(huge_anon_orders_inherit);
> -
> -		orders &= mask;
> -		if (!orders)
> -			return 0;
> -	}
> +	if (vma_is_anonymous(vma))
> +		orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
>
>  	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
>  }
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 4341ce6b3b38..85bfff53dba6 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -501,11 +501,7 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>
>  	printf("%s...", msg);
>
> -	/*
> -	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
> -	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
> -	 */
> -	settings.thp_enabled = THP_NEVER;
> +	settings.thp_enabled = THP_ALWAYS;

Good spot!

>  	settings.shmem_enabled = SHMEM_NEVER;
>  	thp_push_settings(&settings);
>
> --
> 2.43.5
>
