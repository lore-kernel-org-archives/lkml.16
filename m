Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFD81B043E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236478; cv=fail; b=c9HUl3Tu4oWs0ThZ5RZtUK1yPFAfWrVK1OGQ1VGzaevc8uX0XG7XLo8HwRVgD6CyXUqcJTY8HHXOcGTrNhwvpbpzonmkPCDh59K3gNhSX9zlQrwg4FIYChVm4aJ0ns7GLV9Ao6pYbC05KTZpPabP7T6VKlVgVtf6ps8qflmJ+GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236478; c=relaxed/simple;
	bh=1xXwiBx7cxmrn8RrIzSGFlGTyMKzAvkT/evjKjEHgyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jB0iSukAPpB61wlrNQKKC/+TebO9T2fbQpJXozkiiuxIgGUwWQHQP4vS5pxpT1orab2sV1ZG+zkAeNPTdwx/2QAYAbrwt6RVRHzT8XwPXKskeHUl/mYYzou7GI5Wx4DQZEzHye1XdVpO1q5Y0ELPcdirNCfA76ABNqW74WZgJvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pf1iZI9j; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h0LpQQei; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pf1iZI9j";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h0LpQQei"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EDhuKP020605;
	Wed, 14 May 2025 15:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1xXwiBx7cxmrn8RrIzSGFlGTyMKzAvkT/evjKjEHgyc=; b=
	pf1iZI9jPyNjxh/eDfyO5FAcO70IKZ2KdlpELvxQDIr4NLh+aovaVjCVasyGShdo
	0SinxEI+KZQEahvPwF2CLk44Jfq4DTO1oBTG/vhOdjF2xcKknmvz9SIsbUWJlkT7
	3GgV8BJxaRIiU2Fi6sDlchUTbT88TX2ByhtWkhRJuSpeFk/M/A3LAKANjA+wGaZe
	4UY24d4lY/B/Cpz6oUHzA3KQtJLuBOhRePnyaP8UhfHBhO2oHz0qlVuZsQNYzr+9
	bVl9tzeDaSXwR8ual5RhQZdGmVzmvDb5rpkhx4ElwEyonYa04GNyyT/Tsdvogq/I
	4W0uGBLjZsIYc68BuhirjA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcct6ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 15:27:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54EEXVtk005033;
	Wed, 14 May 2025 15:27:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mrmcwh85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 15:27:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYIeTZBL9tiQzv3SWX8yjREU3838GXFdQI+WJX1yO9yoBnVr/UznoyFNI+UTMC1V8a9Kj27++oWNyTAL178lr8VAnF2mAlMULvedOVgVV+TwSK5wfqlYUCPWHzKu3ZQD2iBEDEMQn/9MY3ipx9LXGhMin1zr7UgFF2NAvhWjcnT42ejF2pUq4NpWVCnWXB9x51Tr6QE5Mrib5HXlbqEKT9CSYL+VVBnE1fehNjB2EOnIbi0eiN25jMIeY5FwBXGoUcV8fj6LJZR/oaQ2nw/EJCBhUod1W9hONSIzS1NKskqZxjmfYep4naxIr7GOBfH3xAmTwyi2pd0tcdSKkKRMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xXwiBx7cxmrn8RrIzSGFlGTyMKzAvkT/evjKjEHgyc=;
 b=RVe9iz9uyw4PSBZweGhSfW9jax7St83ndlFwWPpqndtmSWE+Gosroz8+RpvsMQVnN6RH0OUhUtmSpM7e8ygeL7P1CQp7ZQapNRVNtuctq8T8EabarE70vDuwVVM5cniYQ7I+ux23exxgPQ69XIDvDsZqNuq4kbBqiJk+9jz6ggP5nvPV2AWhUSisznKfbsuo6ngeRvZsWIIEqbSLCV9JAe+xdbQZ/i0tqTh3LuhlivZSmj41NCtYxrft4gei1URcRDriycNIVgpmQAGHTnyiYMumDUFXV8ghKxBtxfIFuogJswSyO3aXRZGQ5C1sPA+ZO06hAvHEzXseuvxkmViRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xXwiBx7cxmrn8RrIzSGFlGTyMKzAvkT/evjKjEHgyc=;
 b=h0LpQQei+qDKS0wwLapLKpM2L1iLotxB67hpMb64vzW4aGjbnMonK9Mz62j1k18BnNgPx0Bed+b4mwSTkH7m2dF/baNPkGQmJhb3lg3quwnq6vdsgHlxvjsv2EoDEryd+PtdIuav3vvmBDQsx4IXXOsIRRDtH48tufCF8mUCjZQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7940.namprd10.prod.outlook.com (2603:10b6:408:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 14 May
 2025 15:27:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Wed, 14 May 2025
 15:27:38 +0000
Date: Wed, 14 May 2025 16:27:35 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        yang@os.amperecomputing.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-ID: <42872c96-e9c5-4c3c-9095-3f12202dd803@lucifer.local>
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
 <106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
X-ClientProxiedBy: LO4P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b3c26b-2571-4e16-9c41-08dd92fbdc00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SW45M1ZtYjRhZytIT09NOU5sYnNoczU4dWhxWmpaa0VvaHp6bEVqazhRT1pC?=
 =?utf-8?B?T3AxcTVLYVQ4ck9OdTRuK1NzcytzYmhwRjVvTUFNalJYRkhKa3JHZlJaTG1Z?=
 =?utf-8?B?SXVJUUtJWWRod0xxQU5oSGNwUFlEU29qYnMwRzg1cUZ3TXBSUnQ4eFcyaUY1?=
 =?utf-8?B?V2lzWjNCL0NZbTJ0UjFJeE5lZW15K25jS2xwaitnb1oyVytjdk0xMHFaM0Y0?=
 =?utf-8?B?WjMxeFRPMFRlcjRYNmtXVWEwMWx2bmtXaFpUZHdvb2xZbVdkc2FzM3hWbGdo?=
 =?utf-8?B?UW9INEJmc0lDQUtZTGwvUVNINzJDa1JneUhUOU45TllaYzJQOFMrK1pDYmtU?=
 =?utf-8?B?Wk9qM3Rnek53ZjJLdFFTMkNieDVHM2s3YkFZdXMzZUwvdkc3SmQzb2xodFFY?=
 =?utf-8?B?U0dBNWptaEpYZEJRcXdjaHRZc0FyTmxMcFZGVFhUZld1WGZaaUh1Q3RpakdF?=
 =?utf-8?B?eURnM0oycmFiZkhYTEJvb1BDejk0djlxZ3BNRW91eUxkQUJndHIrMUluTVg4?=
 =?utf-8?B?cXEwZnJsbVVIUzFKd3h1b2k0SE5VNGRWVzNjTzJVbXNGVU1qdDRNUmdzdE96?=
 =?utf-8?B?SEtkSDVTSlpkWDZUTkJYVkNZcmNYc01xQldhL1UwcUlZMkc1dHc1U2R5N1h0?=
 =?utf-8?B?K0lwRm5FWElWdm01cWw5ZnJGbU9zdS9hOVJPbUhraitGSWNEK1Q0cVVUWmhj?=
 =?utf-8?B?VUhvWFNrMjAxNE1OM2h3cWxNNDgwMU9kMkhoNit1Q042dEJ2Mnc2WUUzWXJk?=
 =?utf-8?B?WlhKS21TN0pQQ09MRTlXTWFvSGErY3R2NUUrbzJFMnIyWnorbXdhWnRueExu?=
 =?utf-8?B?bFZOeXhnbHowMms0R2NUUFhxejRwMU52RGpUS0drbDN3TDFRdXNYRG5WcWQw?=
 =?utf-8?B?ejN1ZXpRaWgzdi9DR3had2NHckZxV0o4YkRGTzMzMzc1bW5pa2V2TE5vWGg0?=
 =?utf-8?B?QUhDaEFXOFBBUVFIek1pdmdVTldQcUw4WXBBY21yRHJSK3pPb1B3RWhKdVV6?=
 =?utf-8?B?UmszMjBUdENXSXYxS3E3bFBQaUtHWkRiVzV4Y0ZmRUlSSE0vOVMrdm9qRkJz?=
 =?utf-8?B?NXdiVmFkdWVOUy9aY2x6enIxWnk4TGROd2N6YTczSEV6amJTNmdQZnRwVEZv?=
 =?utf-8?B?bms3SEp4anoySy9SYXp5dmovbVhzY0RGZDMyR2lRWE9zV1hFT3EwcFl2azNI?=
 =?utf-8?B?WU1PNG9lM29mVU5LM3k3cGh2MU1YOGorZTNZZkNubGtvNE1HbUo3akt6MndK?=
 =?utf-8?B?NVBKWnV0UWk2blpqeWpTbElaSFovaVpncm9Mc1JqRWtELzg1VFpoNDdyZGdE?=
 =?utf-8?B?MDNxRHRnY0VSdkkyaTFnUy9YTFJUS0F4dG0xT3hjNmRVbDJqYzZiSHE2dmxi?=
 =?utf-8?B?bEl0OWZneEl3RGs0OUFNeWMwWnBjTk9tTGpUcTJ6Y2tGZ3pyUUNBK2RFVnNw?=
 =?utf-8?B?SUIzckNURGdEQ2tTaG1pS01wMzUrRUp3MkViTDY1QzFrczJmUVZxUkN6WHB4?=
 =?utf-8?B?ZlNPTU1vUEVpVm1rcmJVV3FHZE03bEhYZDY5TDZpclRXeVk4RWdIU2FoWHJU?=
 =?utf-8?B?Sk96TXhLNWlMWGh0cVZTYkI0UG8yYnkxN0wvK3A4bEQ5djdwdU83V1pCWDln?=
 =?utf-8?B?elN3OThqb0pEbHA4Z2xTYjNzSzA2NHdvanloR0M3RjZ4SFpBaVpPSE1tTTRl?=
 =?utf-8?B?MHBrTWZnZ0Z6cEoxVXhNVmkvZEFTZkJOV3hWb0QvdHZWdDcvYTA3Z3d5bzYy?=
 =?utf-8?B?b2ptTEhoQm5YWDZpREFGUHBNWkp0RW1RRzlOeW82aEtGeVBjNGlPSklvREpi?=
 =?utf-8?Q?HKb9A7p7ocQUerkJCGCcgNE34zm8y8fjT2W94=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk52SmMrSWdxZG9Nekx5NUZFWUhuVGVMb1kxWDZRb3NqYmVWR0dkbWM0NFdX?=
 =?utf-8?B?UXM0NEtBQU5OZ0I1cFlsMWpMV2ZwUWlqNDhzU1llWllMZXpUeVFqNUVjNnRo?=
 =?utf-8?B?dHhodHZqb3dKVnBEb29ReVdjT3B5MHJ0UjVIT0tldEdQeVVUZkU1N3lnZkFy?=
 =?utf-8?B?OVl3dFdUTFNnbE9VbXBqdjhhSVZZOEFMVFNjd2dLaXg3dGpKVnFXakZWNG5Z?=
 =?utf-8?B?dGZkcEladWMvdlh3OUh6RGRNL09MakIzOUVOU2xVM3lTbTVaSm10OC9CSzV0?=
 =?utf-8?B?RVlPMm0wNi9JV0tQOUpJOHU2Vk9ITFJLZDRJOUNBUUpxSXI4UVI4S0xwWVRs?=
 =?utf-8?B?a2Z0dmxvVGxCSitOTE5kNkdkaW53YXQyaW9yQ203T2s2RlFicVFlQWJIVVMr?=
 =?utf-8?B?dDRjRlBlNUZDZVAyVGJUaXFIdy9hOFhLWGdWanJLSFlyTy9pUldVQ1J3UGE0?=
 =?utf-8?B?UUtpci9EaVpzdnVYMlY4MDlTdVFicmhnYndqc20xUnA5QWlDN29zQ1liWktJ?=
 =?utf-8?B?di9OemlYQlVyS2ZnRGpvS3BkdzB1Um92cFFyRHNUL05NME1QWStlUFZiNWt0?=
 =?utf-8?B?Z2FLRkZySWVWMHdKV0lzOHlSeW12cFRHcThCSXRYdU43b3hVTGk4bk1GN3pI?=
 =?utf-8?B?L0FsYWFEdEkwSy9XT01HQ3JaNXh5VkVPWmthV1FHR3VuclgwQ1F5MjFJdDhn?=
 =?utf-8?B?UWRUYjZpT2ZlbUYvNm1ialM4aDZRQ0paUVRad3VsSjVvOTh2b2V1T3VSa2dQ?=
 =?utf-8?B?dmliVVlHa0NUeGhtM2pxbmEzOGtCV001N3loZHgwcmp1ZklVMWdTcUVWRUZ1?=
 =?utf-8?B?UzFjQi91d1lqUmJUN2x4MG5YS3lzRStFYlk3TWdzaU9naGxGK2RVMStxNmtD?=
 =?utf-8?B?clF6WHhFRHcwV2VFbEM4V1ZsTitCVys4R2NDVXpoRVl3aDArR1ZlRlU0STd3?=
 =?utf-8?B?Z3BwaTl5RzFURTI4UGV3OXVpcWgxUFA3Q1g1QVM0Sjl5VHkvU0NybDk4Njdw?=
 =?utf-8?B?T3ZDT0RNVGcxbkY5dTMwMmFnajFHaEhzdUxUSjF0Z1hEdGM3TVFwVFpWOEZt?=
 =?utf-8?B?aWl2ZGhJWDZYcm5lQmVFM3l3UFMrSUhLMlp5RWwzTHQzQ0tRUTErTFBEQ3Ax?=
 =?utf-8?B?d01QRE5tcktLNXFoS2JIaUU2TUlhM25YVkdGNjlJRUVBQjdvbHV0NWNMeHNj?=
 =?utf-8?B?TFFTQ1FaSFJ3MEtlSTNrejRHYXByUG5ub1IrT2FpeUR2SDMwazZCbUcyWkNu?=
 =?utf-8?B?R2ovNkk0SFhmOXNDWnlRMmpTdk1HbG5JTWEwN2JpRFZ2Q0lvYUdzWWthSHdK?=
 =?utf-8?B?aDNLaHpwNFpHMkRDT0F6S3JuNXRXY3dEUW9jaDZjS0lHWktUNHdjMitCNmRC?=
 =?utf-8?B?TnRjUGsrSHdWcWFXNmt5aHRkTzY5WVpycVptQ21BQ3V5M0t0VElVVldjS0p6?=
 =?utf-8?B?ZnpRTXh2TUl2QVAxbGt4UlplVHhNV2tIVk9VNlNabzBSZy9iaC9YanM3VGgz?=
 =?utf-8?B?a1d0UlNYTUNQdzVvdHZXREpLSDFJMDhjRVo5TGIxNkNRM1M3THVoSEt0ZGdQ?=
 =?utf-8?B?VWozTXEvOFlhUFZLa1ZVcjJVaEtqeWxzK28xdzZDc01qdjZTM1dXWUp3ZnMr?=
 =?utf-8?B?UlBhVkZ5bWQwbnpQaDkvSmdMSk1Jb2pMUzcvT2Q5MllVNjFpS0kyQ1ltRVBv?=
 =?utf-8?B?MTlBWEZlTnhwRkFBbGZqTHNSdnVTNjBtL3h2RzRYc0xvTm5DN2s4djlseVNa?=
 =?utf-8?B?TmE2MjA5NDV4RjZqV3h2U3dvc0huNUlOMFZMZklzaVdleXVMazdOS3k5YjBH?=
 =?utf-8?B?OHN6RnVBMG5uUi9LT3Q0dGpoajh1c3BKVUoyRlA1UkVXdzUzRW1VaHhvQnND?=
 =?utf-8?B?WG9aUlZmeEJ6cjFLWDdMTHNDMUg0c05Ocjk2NmhMZ3BsTVdKM1FhQkYxY1dY?=
 =?utf-8?B?N2dCei85MHFTdE8ycnRSN003K2lHVnR0OXJoMXg1OUk3bWluUFVocTNBcVRo?=
 =?utf-8?B?WHltd1A3bnhaV01zQWZuWmhUSkZQRE5ONmZObWg1ZnpGU0hBREswL1JhSTdj?=
 =?utf-8?B?ZHRTbUR5MitDYUZMVVVSVVdHTEUxTG9oUEhMK25Xc1ZDdmlzbCtDNTNYRUUz?=
 =?utf-8?B?S3o4QWE1ZDkrVHlPbUhqWFd6R1cyVnpsMVUxMlIxTjA4Yml3UG9FRWMzZ0Fy?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	beWkoLeGeWZGMzB/ZsbucWb8hbErfFzLPFohOuOVE7UcYEnQUuBIK9jYhwMB1pOyjAyrtyHihgBLR96TUD3fLRyKf7TzIZTuCVeeE7K7yr35St52XFLJ2/RH0a8wME3x/1RgwSDElz9GDZPgMH0oYCga8QMagBZXCIAChWeVpg1KMO+8jXom7x2vC4uPBNpq1SzKtDSbI0fMKm7IUI7ddR2eJ3pnDUFMfuG995udKd17ugv/ce31/UMkIvs6/bAODqDRGD1JhGf0YQlbs5zBztTI0Jb4A2HCcu0pm1uNViM0vTOsFzOV6Rh1meDoSaGaIyGTInw9iP0CXG/vMd3IkOzmRMS255A7TIVrKREblZY5rGtKYN6ZhXV/G6flfpnSFlR388b684EqqPip70HYus2jgA1HX4kBvC9/QLM8iVXT0II/aby/yux+DGIRd+URaWesEECAslgNxf9q5nH0rvVL7wdmUpWwLbpOA94vrYBGcJ+rfUf+U5D0K5OOm1hIdiM05z6Wk47oR6le8KHwG6o8EV11AkJ87LZFjRWu9bgcbvWZ/FO3EC7uMW0awdGLNcanDq7ZlBnwbNtSJgqnEqnY+4Mm0oNAXxYHKCtv9l8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b3c26b-2571-4e16-9c41-08dd92fbdc00
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 15:27:38.2767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9gB6C95SZBYr6ccLxK6QF5eUuSsS6OtObtLygqfz1m5hZTMtkWEGWWk9wFYz1VEcXZ2Z8PrUgiPc0ghU/z0xqUFZUL9efppPvfMmqF/W2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7940
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=992 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505140138
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzOCBTYWx0ZWRfXyEKET5BilZDR y24RPa+K2wrEiikhTcqhVUvNPY9n/1fiVoA4yNOChWwfXHKt0EKVn+sTF3iVVnQKFlKjYvBOH05 jlqQKqygWiDdhHk7z/fTtPNaKbUWvdfhpF9vtxXM8LWCqP9BChUwowNSqSL310DlpdH2dVS5AZa
 s6BgDXewm2tG/S1t5anQ6NChEuqJoT4XEMZKdYyI2bt9e0Mo9yI7qKX1/PIQNiicu9/wFwPPCwK Fwopng3HqkX3DK0NLDZ1gXT+pffXnq8gvQx6U3D5+XO/fkysxi2q4ZbWiH4iKnvkWV8ngIjd/2f B+QeTmf5nVduZXU1ZoTkmMIsfn6CQU1vMa8vNxUwEONj3aFV8xxlPQkmcyltadG8AwqjQiH9Lv6
 eQs8ySe6DCoSzWY62oJ020xNAd09Wm23ny8pYte/pquDJI20klI3NrkGTkmCremGjMl3mQFt
X-Authority-Analysis: v=2.4 cv=Y+b4sgeN c=1 sm=1 tr=0 ts=6824b66f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=rMReXC7u_kcH4dlU7LAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: bxThN5V_MwSgolcgKIIznrFqDekAa8nU
X-Proofpoint-ORIG-GUID: bxThN5V_MwSgolcgKIIznrFqDekAa8nU

Andrew - please hold fire given below. It seems we _can_ patch this after all :)

Missing context:

> Andrew - we should probably drop this patch for now given the report at [0].
>
> It seems s390 (to risk sounding hyperbolic - fairly ludicriously) declares
> PROT_NONE in an enum somewhere that blows this up.

On Wed, May 14, 2025 at 05:07:58PM +0200, Ignacio Moreno Gonzalez wrote:
> On 5/14/2025 3:52 PM, Lorenzo Stoakes wrote:

Igancio - you're deleting too much context here, you did it in the other email
too, it's really hard to follow what's going on. Please try to be careful about
what bits of an email you delete when quoting.

You're putting my comment here without the context of what I asked Andrew, so
now it's not clear what's going on.

>
> > I have pinged s390 people on there, but I don't think this is going to make this
> > cycle given we will probably need to coordinate with them to fix up this enum
> > name (which seems the best solution to me!...)
>
> They answered that it would be ok for them to do a quick fix over the mm tree:
>
> https://lore.kernel.org/linux-mm/6f8f3780-902b-49d4-a766-ea2e1a8f85ea@linux.ibm.com/

Yeah, we need to figure out who's going to do this patch though :)

Did you want to Iganacio?

I would suggest chasing up with them to see if they plan to do it or you ought
to do so.

I can also do it if you need it quick, but I don't want to deprive you of the
opportunity to patch that :)

They are happy for that to go in via the mm tree, so we should be able to do
this quick.

Thanks, Lorenzo

>
>
> >> +#include <uapi/asm/mman.h>
> >
> > Also this should be linux/mman.h I believe, sorry for not catching first time round...!
> >
>
> Including linux/mman.h leads to a compilation error:
>
> ../include/linux/huge_mm.h:601:23: error: ‘MADV_NOHUGEPAGE’
>
> Including uapi/linux/mman.h works, but I am not sure if that is correct.

OK this is because of a circular dependency (le sigh) as linux/mman.h itself
imports linux/mm.h (prior to including the headers that define this) that then
imports linux/huge_mm.h and welcome to hell.

Le sigh deux.

OK leave it as it is!

C headers are a pain.

>
>
