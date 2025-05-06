Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94C27AC39;
	Tue,  6 May 2025 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535270; cv=fail; b=jwGOoDELCTPnpyCdvs85rVrAd0qVSWY/fpRzsygsYrW6fmvHcYlF8JMnUkU21MAGv1mN3+QRc4BgJj/OUAGuSRz6P/RBUYFcl2qFgug+I3rDdXvJZ/+xDldLGYvt4bhSyvLmeNrXLcUtNEjEjc4Uhe1vaGIVSFeWGxN4mQQrFZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535270; c=relaxed/simple;
	bh=btS43yZ7PJyTxEBW9tty2lXwC3YJQdeGNrv+Go4sp9U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KZaFvhts7h+iBjk9dG6ZTHKlXGdGLelJoaA0Y1QyER8eD+tbInTSEc5GGDwSIhNtRB3vvcYKLnmc00fBNQQm2Z3AHkDfN8UqTPG7+QlLbm/eIAI8JRQQtbHZegG2E86CxwhrFDB5yKVRRhkMPqSGcUkgzKME38v10KkBx4AcWEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PzlSuweR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UYG3UGqB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PzlSuweR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UYG3UGqB"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546CbEcj023807;
	Tue, 6 May 2025 12:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vZ73+mXBYhl/LpNjmEsrCHaHP/HzGzxkr9tGPkB+xT8=; b=
	PzlSuweRCAw5trb7Qb92LRxgtW3VLbrfTBPghWyiGREmt2xVV+iJHj953nCLKPcb
	nXiQxlLZseHSzSScb0TD+7mK8iLlNtBfRQ1i6Ros3i6SCUPMylufZmzXHqUHwAzO
	wbAPKYCWFIVhVMtRJiyKkDLcJbyI6IdyV4ks7F/hYbHzTmpsw4t0suFOAZoQw33G
	b6XTpipPjd56zMkgRArq35oAENUmHUoI3MaZU1Gi6QzXOiuEYqBIEADEp+IMHXRK
	sL+1QxAzl1Pr2fUjr8xhJG6YCOoVsiztEAuWpj/vNOiH5wq1rP3a8OX3xWXRGIoZ
	Mlgpg778FVGLYUNLUBJ+ZA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fjk8g05j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 12:40:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546CMlQA035985;
	Tue, 6 May 2025 12:40:50 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012037.outbound.protection.outlook.com [40.93.6.37])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k9pnq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 12:40:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtHyUwib+7aqFouhyVuf4DLlYn04W2fSu2vLfA25v6BvBsHHn0ao9SUTAQqOd5ehft4NfyynAaMkTyF/oOQMCdVPRPYzpf6zyRA34tEZx5i2q+2BM6M/SJcuS+IpwMC7o6MyJG2/sfptgbcWwP6KNVbNm+RM/bR1n9h7UTGCsHmCI0wL9VpQTgAtF4IlKVcAuiJf9T9ZdoGiJDhJ3ApDPzw6vOpFChGjGtSQZ48W6+NMG9IiRE5r2h5uEjh5tSbtW9WduAMrj2uwBabF5UuOVfgpFEBGzB/29vQezy7z93drYz7Jmh0GuVzfw5fXEWJ2cweUr9a+qjwrNAvU6dCn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZ73+mXBYhl/LpNjmEsrCHaHP/HzGzxkr9tGPkB+xT8=;
 b=sWHWdcWrbwshPTpLeBMziNXx0+SQPEvyzPuvQ1Cn4LYgHCCseCV/uhGKLrd8JftsPo7qTzKBcpSaSX+CqpfsYHxZ5XgvVwFEmuf03FUOR38j8RMcxUIQq+6gpR/N1NTr9F477vm4Twc9r//Hm8ZrjRADStmnpzCVxEoppyRjiCoL1zlhDxhYQ/XMzTTjeXlqIl6V7xWxFI+q52ar1uTDv2JloDAHp/DoN7q1a+xBXHWHn1NyfbcGJTMEK+HLpxrKrCU/Zw0mi6ZtwnUBD6ZmgpvW+UhqXQ6kCwO9SKRs5ANnqNoW9+O4GaUKPgsozuu5ArPo58XXuJdRtpEidN+PaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZ73+mXBYhl/LpNjmEsrCHaHP/HzGzxkr9tGPkB+xT8=;
 b=UYG3UGqBsIejDuVyv+Q7o48UHDNU2+i9eHfkQ0AIc3YRn4H2ySOMmrfqm4qKAN2b4rTogIe4CQ17i2slQ1fdQY4uRIzBirPT2oWm11D+z4pmZeCFhD+Vgn/zNGb8wfPb/+K9nQX5l9Th6QPW8tMAAahF2eLZxfmZsbfFWTBoJ4k=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CY8PR10MB7377.namprd10.prod.outlook.com (2603:10b6:930:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 6 May
 2025 12:40:44 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 12:40:44 +0000
Message-ID: <96885570-f326-49da-b1b2-9048f02a9197@oracle.com>
Date: Tue, 6 May 2025 18:10:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] platform/x86: Add Lenovo Gamezone WMI Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
        Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
        Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
        Mia Shao <shaohz1@lenovo.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        "Cody T . -H . Chiu" <codyit@gmail.com>,
        John Martens <johnfanv2@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
 <20250505010659.1450984-6-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250505010659.1450984-6-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CY8PR10MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c84e8f2-e308-406c-252a-08dd8c9b3774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3RTcGMxMk5XWTBNWlgvOVFFRE5xMEVjMWZHMkptV2V1bnhBYWNSN21kdEFX?=
 =?utf-8?B?a2NxbVJ5OWVXRFNHd2F5THV6NDltekFXK0FCaUk1bFBwanpXeXl2Y2JFS3lk?=
 =?utf-8?B?anM2RzYwZlVidWw1NDVLVEhSekNEakR3cEU0OGNPUzIxOFViem9YcWwxTjk5?=
 =?utf-8?B?M2RNWS9vNVNBZEJCMlhlMkxuUDFMSzQyTUdQUno4WWc4U2xPSUx1QTd4eXJq?=
 =?utf-8?B?WEZBVDdTSUR0SzQzVlplZ2hnNHRaaGtFbHlOUThBVGp1SmkyWC9xV291T1ZX?=
 =?utf-8?B?S3JkZ0k4OGNhWnpTM0xadjhnSGZLQnRWbGlKV0ZROGhHOGZKSzRjWDRCcjND?=
 =?utf-8?B?SzJCS25TS09uMEtzM0F0NFBOUXhkTmw1TCs4eHBmL0VQdlFiMmoybWlhYlRE?=
 =?utf-8?B?OXdOQzdVT3E1V1RTcW1lRTRlWG0wQythcXhvYUlHc0x3cHVZMzB4N2l5dFI0?=
 =?utf-8?B?WUtTMWZmaUVCZm13citvVFZKNWdnWWQ4N2QrN3J4dFRocSt2N2Q0ejBpc05D?=
 =?utf-8?B?bTVKYkdaYmxVbWY5M3JuTHpuVDBmbWQvamFpVEJJOE9VdlBYYlFpTXFZVy96?=
 =?utf-8?B?SVRNNjZQcVU4SGRQWEd3RzhGdTU2VElvNjJFY1pNNTRLWURMdHFrRHB1TWsy?=
 =?utf-8?B?bUU2em1pVzNJdys1Z2YrVWZ0eDZ5aGM0cHZvY2xFOStxTENGaWxKZlBUcFpH?=
 =?utf-8?B?RWI0bFZhS0hrdUZGWmxGc05MNGhMcklIa0ZIUW1QV3Z1QTNVU3lLNUdwYlh3?=
 =?utf-8?B?Uks2Ynhod1ZSYlJ4RmJVeVRveG4ydWlMZFVlWUVCbFVSaWxoWkFjS3ROa1pN?=
 =?utf-8?B?UnJOVmVYMHVTc2dsZEttRVUwY21lRFhkejlSTFAxUmVYZC9QOVdEeHZKanhm?=
 =?utf-8?B?bnBBQ0ZHbjBtQjBQclRZSVRWZGdtZ2gzcTJJeU1OTVQwY3NQTjcwZHkvdXVG?=
 =?utf-8?B?RXQ2NWY5bHB3WjNDM2YrWlhUWEJHUHJCYk1uOC9sNnJqU3NMWm9XZStEcHFO?=
 =?utf-8?B?UlFVbk9xSmtSTXZuQlVIdE1scTEwcHN5bTFoZkt6ZUhOazBwSVZWSWRGZENS?=
 =?utf-8?B?TGM4NnpwbkROb2I0UzlsaHg1cDMwWDFvTDFVeFUyTW1ya1dLMW44SzNXRDBL?=
 =?utf-8?B?NlVzTDhaRzdmRnN3Z2ZHMjV6UmV0ek11Y2ZYeHU5aUxzSVlNRWtJL2JZaHRO?=
 =?utf-8?B?N05TWXNYYXliWittVTlIYU5tZXdSbU1nYWNKa3NpcE5hOUVSSWRlMk9QekFR?=
 =?utf-8?B?R0VBNjZOVFhQaGtaczdSZ1VrYnJySlYxYkRRcTVpd2ZXd2piRFhWTkRSMWox?=
 =?utf-8?B?cnV6SEZsL2lXSFBuSGhJdFBpQ2YrSThFYm1GUWoramhXZmtHemNaRHZDczVT?=
 =?utf-8?B?ZkhxZk5kWG94TjYvTFVuUUFkWWhaanFjMngwUVpNT2FNSVI0SjN4aXVxZHFV?=
 =?utf-8?B?ZXd6dXZ3RzN6L0NXZ1VSQ2V6WkR3U3Z5OFcxQlh4MUtFTVFCSFBuNm9TMWxF?=
 =?utf-8?B?cHJETzRCblN4aklHRXBjb296U21yYzBadk5LZmpFYlA2NTZVRFdqTWhra25J?=
 =?utf-8?B?Sk4ycTUwSnZic0FmUkExekZvOE9wdE8yUEt3M2hhVTg4ZkUwelpicDJDbjdG?=
 =?utf-8?B?MzFTa3VjeVV0NFVTKzN0bXBQeVFDMDdURzA5cFBNUWFlUFZ2dm8wdTRORlNa?=
 =?utf-8?B?RWtHbEs2TkF3NzZrVyt0MUkzUG5VQUxFeDdGd2VnMWZtNllRNXg1NGVNOVRZ?=
 =?utf-8?B?ems5Y3BXSEIyb2FDWmx0eEFqTnR3bENIZUw4a2xrVDdNRXpmSEFiZjhucS9p?=
 =?utf-8?B?M1RjbGk1Vm9mSnpISUUyVzhnZDdtTXBlSVJVbnc4bWEzMGNJTmRmMWNSMVhW?=
 =?utf-8?B?TmN6cG9nR04xL2xkNC8xTFdHdlN2ZGVwYUpUOE5RN0hhdlNkWm8zWVJXdzZO?=
 =?utf-8?Q?aWSLGbccCf8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1E1cFZpWTRjVU5VeE9WYzhjQ0tZdFVYWkRTeDN0bDU3cW5OY0loMTF4aEVY?=
 =?utf-8?B?Q0wzWFkxY29NUE9KRlg4NWdwaG1HNVM0NHBlbkVrSzllYUNLYTdRU0RzT2lk?=
 =?utf-8?B?RXhXdHk4aWVjQUphSVAyUENDYnVNN3gvdTJlSDhkL0hVa0RqSmR6K2M2MjU3?=
 =?utf-8?B?YUtxUW1iME1FL0pzdVhCNTE4YmQ4SlNQUVJJR01iNXNUY2hUVzVGQ1FJcWgv?=
 =?utf-8?B?VlpGNC8xMjFJRkVFV2UvckJnNUV4R1JOZ0xpNHZxNm5kN25rdkx0OTdLVGVM?=
 =?utf-8?B?RVFZU2FwOG9VL1hHS21wTy82K1o2YWEzMGhZRlJoaTY5a2xyMmJQaG1MRFVD?=
 =?utf-8?B?c2hBeDVrOE5iTFk2dFh3c2pGMnM1OWhveTdpWjFZdDZEMjhkS2YzWjRoVGpQ?=
 =?utf-8?B?dFBwcHZJTWR5SGFxMFB2VGhPMTkvR0FVazZWSzllbjdsSkJvMGFNb2NsQ2Ft?=
 =?utf-8?B?RjEycXNSUFNnYXR1ZUd2aXBRK2tnVjUxREI0TlljNWdtSVNYUURIRUZtczE2?=
 =?utf-8?B?U2VJellGcHhzS3FWR0RKY0s1bFlaRDBEZXpKM0xtRUJsMHh2RDlzZXlIbFRp?=
 =?utf-8?B?b1FtZW1IWGRxODk2ZDRXUWVRSDZBcWduNWpXNFI4UmdWcUhYT2NUZDI0MmlH?=
 =?utf-8?B?VFdLN2FWM3VoajNsRGdZTVBCd3pJeG5uMDl4N1N2ZzZxc2lhaWVKM2JqaERH?=
 =?utf-8?B?VHJKeXZPak1SeTJ2dVBOV1BtZFpBeXhleFloR3lTek5yeE5vRDJ2ZHh0WEJH?=
 =?utf-8?B?clpQdWZPUSsrTGllS2w3N2xQeTNwNFUvUE12QXArTkNLVUdkb0U5eWV2eUxa?=
 =?utf-8?B?empOclpKVGxELzg3WmN1MzN0bGlwR2kvbm9jMHo4UlhuMTZBU3c1QmwyeUt2?=
 =?utf-8?B?UlAyS2J4Z0hhbFh5T2wyR1VGQXBJdzBmRml3ekd1UTNhamxCM0djMEZrT1Rv?=
 =?utf-8?B?N1RRQTh2Y2c0cXRYeFZiNm10WVdrRUdmbnR2eXJrTFZJUmRhU2g3U3Q2ZmE5?=
 =?utf-8?B?bStUblY4OFkwR2tobFBOdEsxaTdKZXI5S3l5eEdQQjFpTXh4blJibEdRUTYw?=
 =?utf-8?B?NnNnQnBZQzV0NlBoQkZGUDM2MWVnR1h5MWkxTzRyNk5KT3lFL2JPZTZwMkc1?=
 =?utf-8?B?ZVF4d3pEQVVVOW5ISU4wZGxUNStqRjdES1ZhT054anp5aWNRREJCLzN3YUkr?=
 =?utf-8?B?Sk5UL1BNbHBBWTBvbnY4RXU3YmttNnNIWVh3UTZpVndkSGViTlA0ZVZ2Rm1W?=
 =?utf-8?B?M014eWpRcEpOdUhQNC9EOWppMDBjdEFlSXlGM0pMNmQyTDcxcEtEeTQ1VUo2?=
 =?utf-8?B?dktodGczVk1xUnk0OTQwQyszMGYzd0hBMGp4eEJwMkdlUTNoTzR5OWI1c0xx?=
 =?utf-8?B?Y2E5bURrYnRSR21QbTVPN0syYS9ybTZiL042VWVHZE1PcVhFaDNIOFliSmtD?=
 =?utf-8?B?U0liMXlZSzJPa014bXA1YUM4NGJEK0I1akx0UVNZM1Y3WXlKYlpXYVBPVWZL?=
 =?utf-8?B?YSs4LzRCU3kxaEN0S2tEWW9BTHZlS1hPcDJHYXMzeTUwZjJUU2REbmV2MEdo?=
 =?utf-8?B?dkIxSG9uNWZFZC9Gb0c3STI4SWx2dDRtUkFjNmZTL0MybGc1QnRDaEVMbmp0?=
 =?utf-8?B?d0c3YklUV1BZcFo2U0I2UjFsVTgxdTVzakg1Ylo4MHIwUkJFS2phWkJtdklT?=
 =?utf-8?B?LytlZFdwOW9FeUhkUDNnczYvbnhTcjRQL3h1d1hZVWtHMGNEbndxVlc2dktL?=
 =?utf-8?B?ZTRsMFE2ZFVBRUFXaG1rbytpQ1ZWaTZ5Z3pNQUtxb0Jsb3ZBb3lIT0RidlRK?=
 =?utf-8?B?QUxHbG5mZFVQcmFLZ09Ld2lnaEQxVitPTkVpRVIxbnZPSlZHTVFxaHBrbExo?=
 =?utf-8?B?NXRnaWwveG5hWVBaT21XOTlRTTIwNTVjMGxyRnkraHRmajNvSXNxR1pLODk1?=
 =?utf-8?B?cXYvclpyT0hSUlNPa3h4VnNuVEJOTU9sUmtPV0lKKzZtUEFnWVFWb1ZXQS9N?=
 =?utf-8?B?MEpyQTdmeFFtQVJuNjE5UytacjdULy8wc1lydzE4ZEpUTzdBR3VsbE1KVUdL?=
 =?utf-8?B?OXJWN3ArWllkNHVzaDBWbEdTTmtWVVNPSlJUU2V1cjlYQjdBNDBNcUVnNksr?=
 =?utf-8?B?S29Wa2JHQnZhdnBsajJRbTB1WUVsdldqbmFrSkFvcldkYTRRNlhObzZWRllP?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I0hxUBETp60NhHW/0/nDvb6IfeIC7SP3C/uRkNccy001B6cZHNHXkRhBevYEZ2R3Bk3dU1mV22m1/ohKaiaKOz64lYklOas/BjmQ4ZGomgDZ7OxN1RqoxoqWjOwt6HFF4mJmJYSQD2kacHsZFD2mFeW2pbiOZk2R25DLsmRweh+IUTxxlyUAyFZ9SWw7xN+gYi+V+K7pmokhqN4me+68gfVJ3+Jomku6cX6DVzbd+/+ZlPG7ibk9x/YqOI2mZ9sTPQc4bsrKETcGiNrJg+BZfA5NEpKyoZ0Hrz25dQKGvHWZ5Wlsx/Jbx2FnRH58drpCyaECG73uM+zqI6MN+EDQHW3yK8lhf7AHQo/q8TCI5/NWt6tp7Fi3HZ9h2eAASeKCfY9mxIbUc2LCbeCcPZQX4dvvDaNhh+G4CcQkHFvAc6WefFtO/9c12O01oPzZ/PPpGBnc8dwYE6Ahjiky7Rosef4WVxjZtkactSBuMD2/qIQZEDF37UqVUL0gSHhywflmVLfq4Dw5FMRsjjnB2EKW8GSwBCcEqgjCAuR4V6o5EKKfBzOK1W78tBQC/W9NQF2cgczRi5k0iccrHLXObThBfyt2F05xjiW7VBRvWMHRx1I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c84e8f2-e308-406c-252a-08dd8c9b3774
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:40:44.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwXm10dBI1jGHYIgJ4jeNqGkH28jySsFFLkc022M3WzfW4JK+8a6tWr+tQ01VpltfUpTG48S5JA+xCn5d2MrJUwd8yP+b0L0hh/iwOiwd/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7377
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060122
X-Proofpoint-GUID: hFL6GarRmUjW2pebsZssXQZLP3LSVT6u
X-Proofpoint-ORIG-GUID: hFL6GarRmUjW2pebsZssXQZLP3LSVT6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMSBTYWx0ZWRfX3KpVZrFwcf1H 3KvtLWNQsqTRXr4pCMlmMW7/lSIjELPWeJOJNCuT4ZUqyei6zlZyXfAU2PQ2IE8KJ4ANtj1VSp4 jMGIx3eVIiog+lBZals7z3Mhuq9UzQ67i3LnKLvDdQoZps4xgH+A/AaHHe+Cp8UnZp6yAONSl+h
 YltX/gcvkcpKspdjBpE0ufn26KkD3VdyWKpReBo8rX7oAHgBN/eBUlYkvfteQVyoKLKAo/odyKS Lr4gJ94S7ozSY5kLaQ8yG2hCbBYd0DaAbdEzflJLmOkNnCU06l6/YfHY8mS7wPmzLb4RVlinAA9 Fsiim2fCaLY6kFZ0/QHNgI7jwgfGt7idF7GL2ICYZiWB4aX2T72e8kK2xrsmKfU4Xvu9hUUYk6j
 EFgGw05R+/iCDWWdNFVJyQzs7leI2jJ5Hbx9SaKZ4MGlmVbEbdiSBmpzZaBEVJMj5edXBIvK
X-Authority-Analysis: v=2.4 cv=f8tIBPyM c=1 sm=1 tr=0 ts=681a0353 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=dy6dLz4b8bkTSSRESFYA:9 a=QEXdDO2ut3YA:10



On 05-05-2025 06:36, Derek J. Clark wrote:
> +static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct lwmi_gz_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	priv->ppdev = devm_platform_profile_register(&wdev->dev, "lenovo-wmi-gamezone",
> +						     priv, &lwmi_gz_platform_profile_ops);
> +
> +	if (IS_ERR(priv->ppdev))
> +		return -ENODEV;
> +
> +	spin_lock_init(&priv->gz_mode_lock);
> +
> +	ret = lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
> +	if (ret)
> +		return ret;
> +
> +	priv->event_nb.notifier_call = lwmi_gz_event_call;

a '\n' before return

> +	return devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb);
> +}
> +
> +static const struct wmi_device_id lwmi_gz_id_table[] = {
> +	{ LENOVO_GAMEZONE_GUID, NULL },
> +	{}
> +};

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks,
Alok


