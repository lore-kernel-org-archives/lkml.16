Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A76C19F13B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744747347; cv=fail; b=qba6/Kfgymq7oxH1ANJvUaLjvOGz5Swjw4yHb4KyONkrienL5ffn5U9IAqIGucykYpYZfbbC/xWm5If02dAS0wJaZtR63VcGMqPwVDG+cp0iXf7lk/iCcBPSuLKSZhEBgILYLdHXInzvmtBhwh4ther5bL2UliQrYUEaB2/i8xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744747347; c=relaxed/simple;
	bh=yEA3KmR3I5ncK+bhpasUYGJe+UfxUtBzn9IU9H4uvlU=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=tJk44l0po5fUemft1vJfpPiBppWahmb3tbTUmpjnXCcksbrNM5UoANDBpV32DEtIxfzV1rPbyyxXANk8F9LV854WkRxeGQzkI+TxeRPFJJw+crDUjnKp5IBQalswLElvmZXd3ayGp7aVeqxG3WwaiOZNeJpumf9qBRWqKdrD+H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l8BDa6Gz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H7poHrvU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l8BDa6Gz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H7poHrvU"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FJiFck011723;
	Tue, 15 Apr 2025 20:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=mgV/vS+adkcU8L1/LgH2VKAsU+Egh1dVIyhs9ux/U4c=; b=
	l8BDa6GzAjFcogplvj4I7EtYtmnTKeTs9Rdqu4lB9JzTSEgZQ77rVtJUV+k3gjTS
	jhBwdTHVmQ5zZjZ97WHHIivLo451VKiaBMnETEohNrKRar9qMU7ty8u01UUl7UGR
	vvDxsjdQ+N17WrUeC1lPDvy87pX37CLaadFg8l28CmtLqOoEB1dpGGiV1uB6RiUh
	xJrhlGmFrwcXwuE41QCS3mJN5Gi2rVDBkI+yPo0gBRXgOOfTHezRHk23ktIZb4mJ
	0IHGEOkM4Z1r/pd2vGoSmF4AIZRc5aFawE/C0f3v7a8Z0UywZALK+N+ac8pAb9c3
	tpkxLjcU8VCGlU9QuYMtOQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617juanj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 20:01:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FILMFU009204;
	Tue, 15 Apr 2025 20:01:50 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012037.outbound.protection.outlook.com [40.93.1.37])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3jkere-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 20:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5bbGNxVpaODme20HTjmZGGuWT20ppeY61TBUNkscNDQSRoCtdCxSjueRvNVciXWpMQ0rUr80r8b4IEquWyT3tVwI0zq1ZyH1337HNf5yNttFqQTiGQ5JvUQRPi1xQIIkZl4twhkaJdKSL+6ux17xab5FbEUkQzxvtl+ffLrTf0ObuTtUQ0Kfce/tV3d5oq4WVjqMb5Q9VdnghN/eMLbn1zfaHlXYRrkJagS1Erb7sBjhv+JULcbEaHjmi9/hXBY/yH1ECXJKbKr9yys9Ac4gQ1tHmBxZ5XIs3nUMr3vNcmaekBBNXtsibvZSlH/R6UQRW3MCvrsWAdNVVrgQysrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgV/vS+adkcU8L1/LgH2VKAsU+Egh1dVIyhs9ux/U4c=;
 b=iaeTtcmwRqZ7AzOaEBdG5KVK4ODSxThOciTJziLu0aUEo4wI3OlDBa+U2lNLTDHlgVyFzOasPH/z3xVQcAFnmgt0ksdy1N7lUXnqi/k34ka+zSZmHemI7SXBCrPuAlt7h0qMs7cmsoszx0CogulTZb8fG1JzDzVT7Ibj16b5HI79XdmFtIOlMdxN3uY+yo9OshWQHrXCQhmZu8bI5T5l8HyjPw22CRQ0XUJfx6uWn7BW3XJfpXf3atCAW5jgG11t963phDRaePabMeJNFRsX8b4++Lo2b5fKZr0+pHyqK1TBuvOaaKR5312YRRWvOXdH4N2qgDg0BOPXt+HY8GmKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgV/vS+adkcU8L1/LgH2VKAsU+Egh1dVIyhs9ux/U4c=;
 b=H7poHrvUdSm5r7WhGrb/jlwA+2H8Ty8v15AvFh6CtqhtRyhiVUOSQ6gqhod7lfqS+TUHJQI4/FdCZMA0a157sBncYpBX1yETjTUATnGQ1S2PS+VK2AQ8FMy2K+SCkXmKbN5SXkqLc0CaKf07jHUcp3PJ1VZaiEyMdHk/VsCWmnQ=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by CH0PR10MB4857.namprd10.prod.outlook.com (2603:10b6:610:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.38; Tue, 15 Apr
 2025 20:01:48 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 20:01:47 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
 <Z_yr_cmXti4kXHaX@gmail.com>
 <20250414110259.GF5600@noisy.programming.kicks-ass.net>
 <pf2p3ugs3blztd5jtxuwrg3hc3qldc4a7lfpigf24tit5noyik@67qhychq2b77>
 <87h62qymrp.fsf@oracle.com>
 <CAGudoHE2DW86hsx5H6iBwMUuKT=onTNd_OnBBCbv5dCpqvHjUA@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
        Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        luto@kernel.org, paulmck@kernel.org, rostedt@goodmis.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
In-reply-to: <CAGudoHE2DW86hsx5H6iBwMUuKT=onTNd_OnBBCbv5dCpqvHjUA@mail.gmail.com>
Date: Tue, 15 Apr 2025 13:01:46 -0700
Message-ID: <87cyddxkgl.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MW4PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:303:16d::21) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|CH0PR10MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 82335b93-2c12-4a3b-f58d-08dd7c585a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkJIaWlnaTdEOVJHMnM5UHU4TW4vMGplL3N5VzlQY1VrblM0UjNJV0g2WFNK?=
 =?utf-8?B?YmVQOWZiUVhTUENWek9VMmo5YzlGZ0ppMXAvZ2JlemVUdXQ1YVQwYzdHdldV?=
 =?utf-8?B?Yll4cFdPNWdnSk9JRlMxZjgrSWpDYXlUa2tWQVJGelZYbmozcms1aXZJVFlx?=
 =?utf-8?B?U2pzcVA1REwzR0tuUUFUNW1IMkJoNjE4VTFOamRMSU1rLzFLcmFGVVVqWjNP?=
 =?utf-8?B?ZVp5Q0tkYTN5Z1RHdFhTZTVQSXlFRWdaeVJGMzc4UlZEeXBuamFJMGNwSFZR?=
 =?utf-8?B?VnlhcEFkZk9xOW9IbGZBVFJITXhMbk5TYnB2MXdVdWlIenpydDd0TjJ3TWhz?=
 =?utf-8?B?SndnRStTQ09xTGNuM0l2VlBBY0VSeVlndllid0h0NnZYdGRqdVNDYzRRSFM3?=
 =?utf-8?B?L1E2ay9jM0RoT2JvRUZLSVVZUmZEbWV6aisxZVJ0VE96MUtsU2owT0E2TkdF?=
 =?utf-8?B?R0VSVlFpRnZMZmFxVUYxcFZnQ210QnJNanZyRXVoVEhkSzlYc0lQM3dNOWx5?=
 =?utf-8?B?WWFqZEQ5N0F6TklRTVNqNDNlTnh5aDF6T01jQVhFU1BDclV1OWRSQVJ4d0Vx?=
 =?utf-8?B?VFdqa2ptVDVoek02VGQwbFljTVB5bUVzUEE5TzV4OHJQYjJWcEdNYlo3YWlp?=
 =?utf-8?B?b2ZaVjdhaVBxdjlGTEFqRUpFdXhuckpSRjRpVytUM0JPUVQ2VTZaeDZZcGZv?=
 =?utf-8?B?TDlLQUk3VmpCblAwRjVSbWwzb3ljWTk2b2Z3RWVZb3NaQVRtRWY0QUlKZTFN?=
 =?utf-8?B?TC9sdGkzSUJlckhlVGs4dnU0M00zNDIxQVlhOVkyb1pSbDlqNW9nYUk3aUM5?=
 =?utf-8?B?dzRubVVvZnVBdmExWlRJek9wNjZsVTltWWVBK2kwSDJ6L2ttSVVqazJYWmJn?=
 =?utf-8?B?cGt5Qm1udi9JeFJnM3pMaGRzam8rUmQ1VDZCVEFaN2FYZEJDc1l3b0psdVl6?=
 =?utf-8?B?TC9YRVJrcGdZbnlzQUJNQy8vVnJtN0RXdmdJNHgyTEcyekE4Kzc0ZVlVM3lp?=
 =?utf-8?B?dmd0d0t0bFJEUlRBR3NGc2RxSWZEWTlkNVdPMWdEaWZoa0ZZUytSbHJ2eVNH?=
 =?utf-8?B?TExpU2FLbjF5WnMvMi9nRnVMRVFERGVLRWZZbGpJZ25mWXJ6WXp3Vm5jKzF4?=
 =?utf-8?B?aWhCRGQ5R2VuUElZZ29oWHRpaEQ5N0pVUWphYVp6MFNoeDdqYjZsNEJtc3BD?=
 =?utf-8?B?TnFTaUFiOWhiT0F3dFhlUnovdVZxQ3g0LzVxRVNhMnBPYVhUdkxleGJrUUhT?=
 =?utf-8?B?a3NDLzAvQmU5ek9VbE1hTzFUWVhGU3I1T1dQOFB0S2pQYXRlb3V3ejRQalFy?=
 =?utf-8?B?RVl4STE5M0V5RUE5WFlCRkRnYlRJY3Y4NG5waE00aE40UGhOa3czYjhnQXFs?=
 =?utf-8?B?UFdqcUNjbGM4QU1iWFBrWVZ2cnQvbUpnaENwSFJ6ZXR2YVUzaG1IaHpUaTA4?=
 =?utf-8?B?QkpYSlVCK2JaQVlQNjRRbytKajBoZ1dwMDJDTGxzWTh2c0FGVSs1YXpRT1JC?=
 =?utf-8?B?ZEhNdXFrUUVzcWlJQy9yMk5RZVozUlIwc2RxN0x3dkVhTU9CaTBlYmZzczJG?=
 =?utf-8?B?Umk5NFBHcGhyT1RFNmlzeWNRSzNaOU5EY3BUUElzMUlLVSsxM2k5TUdmV3hW?=
 =?utf-8?B?a1B1K1hFVmlXUVhTUkF3b1VKZzRESGlBS3JkNmJiN0tkbVdDVzVwVFd5Q3R0?=
 =?utf-8?B?MTFaNi80WnBNWTY1VG5SZXEzUHFYNTJyVVdOcDQ5NE90cFVpallVeWt3UjE1?=
 =?utf-8?B?UTRPbC9va0crWERNd2JPWlJldHFYZVovYk9reHBwQnZFUVdKM1pTNFdiUXVE?=
 =?utf-8?B?NU1hbHZPOHRUdHMvVHVMRFp1VXhyRFZLTXJzOUxvSGJFcHcvM205QzBjclZh?=
 =?utf-8?B?NmZYVk5Tdk1QK2FDWGZSSk1aRDk1RUFDLzZMTlBvVTBRU1E3T1VjS0Q3Vmp5?=
 =?utf-8?Q?k0pZNCnI9Cw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTZJdTlFaXBhKzI2cm9UQ1pyVFZDTmFFcGhCOCt4bkUzNVp1RkRWNVMxbldY?=
 =?utf-8?B?UHJ4Y3JVbElyWnNiT29xendMSnVzeFdQdzIvL1locUUwQ3hGL0hqamxtVXRC?=
 =?utf-8?B?TDZManpSbGM4NnNqNkd1T1hlVFNhK0VhY3U2K29kc3V5Z1FMcFVJazhjMkZM?=
 =?utf-8?B?U0w1SGZrSFRyZkxzelBuQ0Rtc3pjbUJoZEp0MG5jWEJ1c3g3ZVI2MlA5aHJx?=
 =?utf-8?B?ZktnZzhucHFpWVF6ZFl2NTZpc1lHZVZ6endyNjR6UW9xRXZYbGZlZ0tnZ3lW?=
 =?utf-8?B?VDYzb2RPdGk1VGdQbW8xQjJIUUY1a3dobU84anBvZmMvZ2dzRjBzQ0tpWGNY?=
 =?utf-8?B?RmNMeVpCcGltRmFpWjZTU0NLbHozbk9vVlhLRy9QTHFsYXlXS0s4ODBwbk91?=
 =?utf-8?B?bGliNDFaYUJEMFlzUmhIRHhSYkZlVHhzcEJ2Sll4VEZTa1dEUGFGRW16eUtB?=
 =?utf-8?B?cjBNVjRRY0tBYUhWWUZxT0NMWkRoSjg5VmVLR2g5NzI5c2pPVXZIeCtjT2h3?=
 =?utf-8?B?ZzNzQWtVUi9kditndmlxdzBSOFVKdndJb0FCZDR0ankwQ0V3YStQUTBYeXJu?=
 =?utf-8?B?aUdnZlo5WG4xZGptOHc2SlkxWS9ZMEpnSHRBcjQ3Nm1rcTFMSFRCakVSRzlI?=
 =?utf-8?B?RlRtNFJUQ0hNM1pCT2o1a2RmTXREcW9EcjgrbG1FMG92Q2N3UnR3Wnc2T0NY?=
 =?utf-8?B?SSt5R1hlSlByVTY2VVV1anF6V29NTkFYQUViQldndGpjMWx3WHl6Zmp1Q0lq?=
 =?utf-8?B?eWJsSmxWSUY0QlhwTy9Tc29BVTFNYkJzNnowSW4zNjBVcnNEdnJWUjk2NDVJ?=
 =?utf-8?B?YkNaSlB0RGlZRkdKWXZycENoNll6SzBPRkJML2JuS1pXYml1clY1UVFBVFRk?=
 =?utf-8?B?bnZxd3hzSTQ5K29PSEppNkZzZDNSTkZSTi9PVForaWpuaDNMYk4xaDU2am1N?=
 =?utf-8?B?UFVFSmtWamV4WUZlaWhIVWZkR0Ntb09uRzA2d2Q0Q3BvYU5UeDkzSkk0K1NN?=
 =?utf-8?B?MHl2QWxBc3BXbUh0K2gyaU5keGhqNUhkN09Lc0FDQVFCbG1WNDdPVmRCclFs?=
 =?utf-8?B?WU1tbHVGWXQ2TWVvZ2prZHpaU1M3SUllellSU2dnYldXWUcwQ1gzZzRSWi85?=
 =?utf-8?B?OENOdnFSZ1ZQWG1tZ2pDYkRhN3VCRTcrdm1rV2pIQk13M2I3T2lnZ1FpZWJQ?=
 =?utf-8?B?akkwQkVyay9OZ05CUlNTSmFodWF5QnI1QW5RemZ0Wm5GNzEzZjJpaG1sOEY3?=
 =?utf-8?B?dml0NExJUmwydUhDTDlEZE1oWlpqaUthRkVCZ3ZSS3FWU0hlUjRUbjN5R1Fo?=
 =?utf-8?B?OFExcGxuelBFRUNJQzcrd2RLRWFZL0xzRk0vWldzNG9Mdk5ScFdCY2hIcnZr?=
 =?utf-8?B?SE1VYTN5R2ZMRkIvZ1NEc3BNa0pDTnBjTDdLT2t5MHF6cGI4Q3hXUGZHYmdR?=
 =?utf-8?B?L0hZSnVJTmEzcVp3c3pUQnR5ZDE3L2tDWWl4TldsaTdScGoyWmlCQ1lzelNC?=
 =?utf-8?B?OTJhUGsyZzRid2hFTG1EMGxMYjRVZVVGUkhrRGlmaDVOZTRZYmxoNG95a29I?=
 =?utf-8?B?c21za1JidFBHQUwxTzJldlkwOGwzT3lPbUtjcFRuUjNwRzd4T3lmMmx1Q3Vy?=
 =?utf-8?B?Uzdqc3JWRXA4QTZlRFkzL3JPbUtHcVdPaXE4R0NYMHh4cWFpRGtTbzVsQ3Vj?=
 =?utf-8?B?THF0Zzd4RFV2SHduNXhYSTg2WGxxem5mREF3MEF4dlFnOS9SRU9ibUt1WGY1?=
 =?utf-8?B?TndCSWZNV1AvTlpaY1ZreElJeTdnVEE0bTk4alUyNFo4UzArbDhEMTg2VDVs?=
 =?utf-8?B?V2YwZzdYZ2MzMFF2Q1Z2aVdsWmZyTG1IRHJ6L1k4aWVnTkJZczNZTTMwTVoz?=
 =?utf-8?B?cjM4dUdQYXNqMkQ2U0RubDFwV0hxeXZPTnBUcm55M1c4eFFXaGdmT1pDV05C?=
 =?utf-8?B?dkZwVlBCQmV0ejdIR3hxWGUxZHIwNXVDWnZqallBRUJaeXcxNm9YRUxvcUpJ?=
 =?utf-8?B?VjQrZ1BFNEpiZlZMeVpJOVNweERWelRYOHQzK05GYnB5V0pYVzl1Sk1icXZE?=
 =?utf-8?B?TmpaUjVqWWZZSzlzVFV5MXZ0aksrZGxjc0RPNnI0K2ZQL1VSSHJsTzFLNWpG?=
 =?utf-8?B?UVVCa3N1VjZJZFJZYnA0RGFtaHZOVUZxdzMwWVY0R0pTRE81Tk1GejJrUDAz?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1VvotJwMtP7qNvfQcIXbDYSJCWMHiYRsVBxB2Rz+6VNGQJ55DypE5OG8TX+V3at/SbO5jFLuzFb2s4/MG/U9f6t1ZkzEwRlu34n41A92Tm+711nD8rrXRX+rNj0pXKd8IF7hYf+k5FTHEvJVeaCZ7SQOSGen8KhwTeO//ygNgi1Uvrag0WXVm+rlh9ZpT9Q1cRoiN3beBJl7TfXNDz3esJrBYgMI/Y0cA+leqFLIMhmpP3KlDEyWkdfR98RQ2XwZ2Xg9ul+9SScUSvR35/7PSbhF4gC5buwqWcwEaJW26sxoaLVttNns3IPPXW9AfWMgW43VgUFHSqkdsZuz1kBy/WCDPxnnx1HibK6K02OoHn+65UulmX9daso7ACi3jMax1AdLgrZYLGF+VHzxuoIhUZoJ91oQz8TQCeOpbvynOy03GXs5p92a5fFq82ToANa0JLsFzoWSOQNA0TT2mdPmnskmkrYBq8ZO1/ur8vkQiuWdQ3dZWgPpQgly1NVcY//IPkIdIAis6g+0f4QlUnMoNEa4A+HnwmJ5RmOFHeANT6ZE/ghuJUUT7wcvqxYKc/hjo1AtFQvyMNtN5RLfzSzVgLuPk8wp17zRCCN7veNXuRg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82335b93-2c12-4a3b-f58d-08dd7c585a6d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 20:01:47.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gttjl86wlQh3NVFkDYH85uKheoFdyIQYy99p4wW5scUaFtY4wg8jy77eHHEZhZ6TkUWeJuIGFGqWk8/OLX3ziHlg/MCfRa6ZevfsfHzoppk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4857
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150140
X-Proofpoint-GUID: 5JS8R06JgTLxlNFZqWqCt7kX0Ym9RL0r
X-Proofpoint-ORIG-GUID: 5JS8R06JgTLxlNFZqWqCt7kX0Ym9RL0r


Mateusz Guzik <mjguzik@gmail.com> writes:

> On Tue, Apr 15, 2025 at 8:14=E2=80=AFAM Ankur Arora <ankur.a.arora@oracle=
.com> wrote:
>>
>>
>> Mateusz Guzik <mjguzik@gmail.com> writes:
>> > With that sucker out of the way, an optional quest is to figure out if
>> > rep stosq vs rep stosb makes any difference for pages -- for all I kno=
w
>> > rep stosq is the way. This would require testing on quite a few uarchs
>> > and I'm not going to blame anyone for not being interested.
>>
>> IIRC some recent AMD models (Rome?) did expose REP_GOOD but not ERMS.
>>
>
> The uarch does not have it or the bit magically fails to show up?
> Worst case, should rep stosb be faster on that uarch, the kernel can
> pretend the bit is set.

It's a synthetic bit so the uarch has both. I think REP STOSB is optimized
post FSRS (AIUI Zen3)

        if (c->x86 >=3D 0x10)
                set_cpu_cap(c, X86_FEATURE_REP_GOOD);

        /* AMD FSRM also implies FSRS */
        if (cpu_has(c, X86_FEATURE_FSRM))
                set_cpu_cap(c, X86_FEATURE_FSRS);


>> > Let's say nobody bothered OR rep stosb provides a win. In that case th=
is
>> > can trivially ALTERNATIVE between rep stosb and rep stosq based on ERM=
S,
>> > no func calls necessary.
>>
>> We shouldn't need any function calls for ERMS and REP_GOOD.
>>
>> I think something like this untested code should work:
>>
>>         asm volatile(
>>             ALTERNATIVE_2("call clear_pages_orig",
>>                           "rep stosb", X86_FEATURE_REP_GOOD,
>>                           "shrl $3,%ecx; rep stosq", X86_FEATURE_ERMS,
>>                           : "+c" (size), "+D" (addr), ASM_CALL_CONSTRAIN=
T
>>                           : "a" (0)))
>>
>
> That's what I'm suggesting, with one difference: whack
> clear_pages_orig altogether.

What do we gain by getting rid of it? Maybe there's old hardware with
unoptimized rep; stos*.

--
ankur
