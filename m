Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65A160DCF;
	Fri, 30 May 2025 03:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748575793; cv=fail; b=CAoNS8ZUQ8XYnMt0pNZrbT7S8jYVdrxhwnsCQncpNQBU1ubICSBW5HKu9+OP/bRpRp/mDqdTn/BsoXfi3aoj7c8Nob0jBbX3vPKdJhO7L2JFtUdisK39KGqQoUadZsR5ClIvgo3ssCpv9/YryzrLx16jJPOrx6CiAMsgBAzenPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748575793; c=relaxed/simple;
	bh=BTMSjpOYGf7JVdPFWuDA1HDf5yuv355V7+2byukndvk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=vDxGhbBdRdYq4pfh3vJfv7LRs7MVstgp+hzYawqhZg4SJ/uzq1HQTaawXnixwu0Wi05puRjpHnfU7ei37/CPzfdtkqoO92eMxa/xCgtvLkpgG08Mvog2rV+65wjolzgk8Bi8kS2845fL60EPxT9dt4PBrNc8JHfOTWfnh0NqTuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GjMhsx7q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qsygNgNJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GjMhsx7q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qsygNgNJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0u0xH025386;
	Fri, 30 May 2025 03:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=TuGwMqf+Y8UV1ZNRSrGytddnDNdXazAjFM6TKQ9Tm7w=; b=
	GjMhsx7qtaRfyihcBd6ipj62bFJKA7lrAatfyeCjtBCw5qFqs2vH5EB96MbWva1C
	1bWfLcmFHwX/wp0su2G5Dz73VE176ZaZBXNDZ7uXnQvrlElANPASDCDofnSFYywk
	ptXRUO2wQ+jYG8+hS3T5wYbIpfw1pBR16yTsdDTPJIkoFuXctdpMOQjNbhK67PpI
	3/7VPmzvGjRhr9Vp8qac0Uf7NfujdFlFb9zSMG8uUhqCPAAcePlxk1PGkDbhOlcM
	w0vP2KhJ71lNEXNOB7MdLzfQ9h0v2jBIK9rW3pR+EASFptFWdnnqxB/MqTP6rREP
	jM/X9epXxkVC1NXLLsUgGQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46wjbcneh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 03:29:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54U2j6hU019205;
	Fri, 30 May 2025 03:29:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jcrunj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 03:29:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e12J4WEPdbPokAplr3ZWHhR6VUit/v7VTVt9l/dbg5ttc51juMRQaokmj0nD/5nhHsRJkGt/KhUGe50wJCl8TdqdMG8JLnOk1CVIPyXsN1XqA1nA2imgoFsbr/gWaBmynIUJvx07gUI6UTX+TbtLChdZa+uyR7LBIO/BtOFN9Wsoy2td8HTMbPJjytLyf7B+Lqvn/DSEmaVtp2HCVrM8Ci90lGEozO3qpadPAuFbf1YK/33riWpmwIyFlkcry6ostudbXpKRWijS5JfHpGZqRz0J6DBUarv4V2TgjXXWvLE/hm3HzfRD9kFxDWhcJbVh66nVYGlP14wx7XfbSnG6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuGwMqf+Y8UV1ZNRSrGytddnDNdXazAjFM6TKQ9Tm7w=;
 b=rjR0+wt27txaZ7NxhNeMpeXGq5q9Gjm+VsYDfVS/nFe6/VgAPtyV8vyLzm5lv+ukfPxVenDd2s0AlnDlPqRX982O5DhTpbOF4rZyLkv3iOxOC++Vxoq42d8U0sS85qBFCnbuImbKr/vUPoG1Y/qYz5waAmNr1RjGjbaCoT7ZIC2ujh9H+MIAqHC+zrltjj8fkG86QrDwdeCz7OJzpTc2+vf98wZg2/p1sJ1cWivlhpLhN9F0R7QmmLLPBZ2QWqbbo+p71/aCkWbi5qnRENmuuAT+wbXR3aCo95WkLtsUpGcPaWzm9wv8Gw/UFrJKld8L/BYtpiCGgUCINVS8B0MVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuGwMqf+Y8UV1ZNRSrGytddnDNdXazAjFM6TKQ9Tm7w=;
 b=qsygNgNJrfiaXb6pB8NUuqODs+bBRZiPyadzgX9+5e9dZ4snoGlFC38J9hOMn8l3qw8O6nQRGwyZ9M/kr+lbiwfCsXvNG3UO/S6HRDeE5/KurPyNRkwmw4UR+gNxIPHkZSZTkl19WrAwuWtJm8bv48d0NZHvIrb6d0DGx2fCpvY=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SJ2PR10MB7733.namprd10.prod.outlook.com (2603:10b6:a03:57b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Fri, 30 May
 2025 03:29:20 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8746.035; Fri, 30 May 2025
 03:29:20 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org
Cc: linux-debuggers@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-toolchains@vger.kernel.org,
        osandov@osandov.com, paulmck@kernel.org, sweettea-kernel@dorminy.me,
        liuye@kylinos.cn, fweimer@redhat.com, sj@kernel.org
Subject: Re: [PATCH v4] tools/mm: Add script to display page state for a
 given PID and VADDR
In-Reply-To: <1f8af317-2fff-4a1f-ad0e-9d9c6c15f3a1@linux.dev>
References: <20250528091543.355386-1-ye.liu@linux.dev>
 <87iklkadzy.fsf@oracle.com>
 <1f8af317-2fff-4a1f-ad0e-9d9c6c15f3a1@linux.dev>
Date: Thu, 29 May 2025 20:29:16 -0700
Message-ID: <87frgmai9f.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::17) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SJ2PR10MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7253ba-f530-4fe0-f3df-08dd9f2a2a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWR4Y1JzWTcwbzd4TWMwbU9DWlRPT3ZQR2IvTHEvR0huRFJIQzJFT2dUQWgx?=
 =?utf-8?B?Q05pYlRvaDJXc29wZG1LYk9yamcvengxcjhoRk1TR3BnY0o3TEVyN0FzT240?=
 =?utf-8?B?RVB0RlIvUENaeEg1TStFdlZ3bWZ2bUtSa2twTkMwdnlPUFpXQU90SEVzR0hJ?=
 =?utf-8?B?TmM3ajlnalUwc0JSKzFXclYvU0hRdUdSSTVHWUtPTWtld0pkOVl6aEcwTlY1?=
 =?utf-8?B?eWViL1UwamZUK1IrMjZrQ3dmT21NcUZBSW1md2VRUHgzUk9nd0g3ZVFGMmhW?=
 =?utf-8?B?Nnpld2thY1p3K1phbEt1VWZYQmxLUFBCMWg0N01kazVJemhkdk9jWGVXUUp2?=
 =?utf-8?B?ZStQTWJmd0h5dlUxRGtFcmRoOGJuaXhRTTlEbjdZdXVmV0srYTI3MzRVdHNQ?=
 =?utf-8?B?SmZIdVlvWmlSQU9wNkVSSGhuV204OGI1dGV6SUNWL09HbkVVWmxIRW0ySyt3?=
 =?utf-8?B?MFhDRm5jN1YvR0xkQWZtTlVqMHF1czN0c3BYd0lJWFRwU0gxRFhWQkNjT0ln?=
 =?utf-8?B?Wlo4b3MyL2lwcUtFQUQ4bWFkSHY3MFQ1aGhNTm1yV09RcXBwdFkvNG5mTEdL?=
 =?utf-8?B?TnNydmFjSFRaYTBrb2Mzd2dvNVhTR0RoZ01YL2pQQ0hRYXpDbmNCeUZUSjZY?=
 =?utf-8?B?S3dpMWJ5T1VqSmFONGwvZTBTWkFtWHlBN2tONHlpR3hqdjRkb1M5TkgyOEZR?=
 =?utf-8?B?QmZJaWFMWmV2TWhWaCsxSzhjeldQNklZTGJ0ZE5iWDRGbGNiMVBsakdlWDV5?=
 =?utf-8?B?Y3R0U3RZa0NaMlRMdWJnOWF4YlpkUVlnVVMxdTY0MEIzOXhDT2MrU3pCOEhO?=
 =?utf-8?B?V0JGWTJmazVObDV5bWpkaWNFbzYzcy9IblVNRE4ydVo5bG5JNG1YZTZqTWJX?=
 =?utf-8?B?VGtmQUJ2Wkx6TlBzS1Y3MW0yZEtQZ1ordmRJRTRKaEJDaUFxUkxlZ1Zyd1Ey?=
 =?utf-8?B?ZFpXSFBLY2NvaFNNT1dxVlN1ZHVLS0dETnZXajlwZ1dQTW8yaE51ODIwbDBa?=
 =?utf-8?B?dUJKdStnSE5PY0RPbENVcUtYYk9SVUpQZ3B4OGEreU9YUmZyUURqWllmK3Rk?=
 =?utf-8?B?TGd3ZUo0TWZ3RXpjM0VZd2dIb01zNUlKRjB4WGpOSWIvWDkwdTdkd2RZQ1hX?=
 =?utf-8?B?SW5TOWVFTmY2UHhXQWlVODVBaFNQYXVjQmxHTVBHMDhRSFhTTnpKVUViTFhs?=
 =?utf-8?B?UDVVRUpkWUlSbGZXdGVmWjlnTHJkSFRGWEhYdjBUYXFGSFJwek9TVGszV2pi?=
 =?utf-8?B?TmE2TjdZYkZsMVQwWVg2dVVTcDZGUkVIVGg0SlMxRnlMYTdueVVtN1Q4RGNT?=
 =?utf-8?B?N1IxVDlEUTRJdGJFZG5ZRjIyZG5XTEdTUm5uNjl0dVU0bkkrYTBkSmxTTnY5?=
 =?utf-8?B?dmlFaS9BRkFrNmtGVGt4cjdldUk4dEpzSUJjdHVvS2k5VFFCSDF1T2pRZm0v?=
 =?utf-8?B?RGljVm9NZjRUVTJrdEdTOHg0TFE3MitIOVdKNUdqQUFjckplTE1CNnNob3ZI?=
 =?utf-8?B?UXRYVktXcTNPeFFna0lqMHNzWVlsd1BHbUR1ek9BekpianZtUnZRNWUxaDdJ?=
 =?utf-8?B?dzBGM0dIOG12NWlhK1pFSkkzWkRSL1IyeStBMFJiaCtlUkxYSTNFVFhlL281?=
 =?utf-8?B?N0F5bUJqcmNCY3dDYXdrR1pEZE9VeVdwcDcyWGRqR3Q0c3JpR3hRa1BISFNv?=
 =?utf-8?B?ajBuaHNHZm41dWpvTzZOdFJvQWZoa1hSVnpXS0xPVWQrMTVMUVJBUDZkSDVk?=
 =?utf-8?B?QW54ekNEM2tVQXlVaEMwZDd6RVRLeklHd1oxVTN3VVJKc3VuNFdmVXVqUEhx?=
 =?utf-8?B?K2lLeEplZ2Q0Y1VLdjZlc3JkbjdHTkp0dzFHQmZSbFEreFhWUis3NExPdVpx?=
 =?utf-8?Q?zsaLgGYT4FKkO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2FJcFVTVlRTdU5RMlkwV3ZBeEZjZmVaU012UHRzODlyR0R4eFhjbzYzd0k3?=
 =?utf-8?B?WU80YUFlNHJENjA3Z0ZoQzhLeGpuMWRDbXlIVHAwSnoxMDVFRjJkOHAyQkoz?=
 =?utf-8?B?ZWpsWGorQjc1bnA2aFh2dDVJSDVEVVUzenNUQjNrdnk2RS9lOFVJZVRBYWl6?=
 =?utf-8?B?VXM3aytvOXBUYWx5YWllWVl0Ylhpa2NBSHh1VXRNektYOUtyMlJVM2JjVGZL?=
 =?utf-8?B?N2RQaFdFTEF4bXdNRnlUeWZZbFR3cisyUFhkbGhnRDdwSmJlbUk5YXRLRGll?=
 =?utf-8?B?NWVNR29QV1VUV3JWeUxWZzlYdWMvVFUwTXk2ZExwVzJpUFZqMEx2dktmbXM3?=
 =?utf-8?B?OTg3aW16Qm96Q2FEd0lQcHE3bG1qMXNXQkJha1FuYklMbW9KWTNVUUx3OEtq?=
 =?utf-8?B?WTFBY0NLaU5BVXZ1N0ZuR1lXeTR3amgxRVdyS0Q3d1luei9XVXB1THY1aisz?=
 =?utf-8?B?Y09rd1JjTytKcUhCdnZlbG9PNW1rM3ZCeUVjSDZqMmp3SnhpdUk2SmF0STNa?=
 =?utf-8?B?TDVaRVlrRUhLZEcwVVU2bHQ3UUNqZ1J4cm5ueGQ4ZlRDOXNWS0NETklVWDJl?=
 =?utf-8?B?YkFQNnFmY3R4QXVXVWdRVndqSU1vLzRaVjQweFZsZFA4L1BEWHFXWGpLRUF1?=
 =?utf-8?B?ZUFYQXZaL0RqclBXZ3YxNFBqbHFjTmwxbDlvUVRCNmJWYk1DUThNM2xvWnpT?=
 =?utf-8?B?bUZzc1RaMTdSMnlRdEltdFg5RDdEWCtjclhYMk5pTkYzV0hlU2VhZ0JLOE8y?=
 =?utf-8?B?cDBpVjg0c2RWaXJhSWJqRldQbTE1YVdlL3JOUURnTm5jODZ2U2svczExcWE0?=
 =?utf-8?B?ZWRjMGU0UFNqQ3haSkhtcTE4S0RXUTYzVHhYSWZ6Tit0Zi90QytyWXdiQzZl?=
 =?utf-8?B?V1VINTFjSXNTRzdRUHhPT0dsclQ3M3A1VWZyTUk1Wks0dFQrQmNhc0tReTV0?=
 =?utf-8?B?RjN0MjRoVElqS1JKbE53UjZ6QTkzRStGSjY4ZHBSaEFrM2I0QmdGVEw4QnVQ?=
 =?utf-8?B?UURFTXY1SEtpRnRzdEhrNGdoOEZ3dW0reXpqektBencyRCsrSDZpVkN6eTlq?=
 =?utf-8?B?dmNPMG5zM3dZdUExRjBQM3d1OGtMTm9KNUhrVGZuZ2lvdFdkQ3RBYkdLeUNV?=
 =?utf-8?B?dE1ZdmhoclovK3JlVVpqaEwvVDhtaDVNcjFzc2FLQnZpR2NFWEFMUU4vV01z?=
 =?utf-8?B?VStNT1hucFU0SjdCRUlMK09YNWMrMEdyYjM3c0JPRlIreGRNQlhzNFh3ZzJn?=
 =?utf-8?B?THE2aU4wcmZiRTc4N0xFR2RUMytuUDZicXZxRzFnaDhPY0I3d2VqVTNvek0r?=
 =?utf-8?B?YWdFSDd3NVdBS094d1VRMmVIbTRRTHd3ckowclZtdWhYWGkrL25zQ2x0S1VW?=
 =?utf-8?B?a3B0YlhhbGlxL3FQVUdqbnZVOTdwSTE4VzZEbk9wS1l5a2l5Uk5IVUJJTGdO?=
 =?utf-8?B?MFNZQVBOMEFCeFFuT3NPUzVmNUNMY2lmUWlnZDZZVS9WWk5LNktmcjVUQUlp?=
 =?utf-8?B?VitMNmY5WlI3SjVZQUpwQlVsQW16MFExTHI3eWtVaWVtaXFiam8xaU1YdXpM?=
 =?utf-8?B?azZZNlVCWEFsOU5sRWo5YVREL1IvOVllcmU0RitHSTZLWlh1azdjdTVwcmhD?=
 =?utf-8?B?dGdUcUhYb1Bic2dkRllYSlI1UW94TjM4bEoxNFQ0bDg2cnFDendaYnNVOHUx?=
 =?utf-8?B?Uk5sSkZxc3Q4VlVJQzc0QjJncDJBSVJMUk9KTzlLd0E0TStOWjIrMVBqemRF?=
 =?utf-8?B?dWNkdlZIUGVlUEl1Q0VrVCtiWFVOSWNwUjhaQmdwYURHK3VMRVFaNTBESHhn?=
 =?utf-8?B?KzJSYTdlOWJvM2lLZXovU0s1ZUZWOEsvV3R0TFBIem9yam1QcEhUdWFodWEy?=
 =?utf-8?B?aFBuMmhkcG5OeTljUGF1ckRvbDdwSFBaTkJqZ1RrbFlORUZ3UzVpVzdPcnBq?=
 =?utf-8?B?a3BoNEczU0h3bUtjaDhUYzRoRit5SXM2TkNPWitIY2dONkVUK2xWb0RCNUJ5?=
 =?utf-8?B?VjI4WmhMNnlobk9TQ3pUQ3UzWkZyMVlrcVVMT0xDQUVrNlhoYk9OdGRGcVVC?=
 =?utf-8?B?RGRHU3dPdUdEdWJuRUNIZUNEbklpNjhzZ1NmMFBzeS9NZTlqcFZCbG94WWZq?=
 =?utf-8?B?ams4MGVpVWowc0l2V3BsemxGRCtMV3hsdkVnNHU5Um1zT2JCY2Q2d0h1NldT?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RUjFy7rfDMknZZG4JdR/FDQQhIqZStR7xbX9a4ArXq2d6woBDQ+b23umU8JzrCXZ2ZFEeXPFfsJu5BUkEUWh3pym1DiXcaQ1H3W2AkpJmntM4nlu+9om5Ipw4IiZV6WU4xpPpjwOo7APY9IpuvvCZZddT2t4XsOl1F+4yI6t1Bm8eaS8HOWxvV8wX40/3qB/RBDYaj0PJJ4L310TRnfF+yKvmztFkptfKax4Xq9SjGjgRnLQ7XBiaJlZF32nT4WEEcG/pHv3zo9gOFkU7igp6D4u/H+j7m0NA54Ci6ZfYcDP/mXSNZcXDsISL3npiv2Ki+aMyXlDZ8Zf1viE9rH5aNNMYMPm7MPyU2QL+jABsgqKiZFFA9vAnaR4iGNT9yRuMqTU+8ft7JOPgBI81UfSgqTrSLqMvzMQjuOCpRUgl06l9KmpBUbmVk5wXOJH0D4dYGFmJLlUzIxgVQnn6RTO8VYSiYuLPIzbAbRuYT3LUu3Me++XiFHlGoMV4+Y+r23lAZLUVU//GmDize+p8z9Rrbz32TZsj2TksE9BQR15HAzW4GRvFgzgDX6Lrf7KClxYrkrBgeFs7M9FfBk8Qmzsj/VSEOq8rrFH4/RVXLlmdQ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7253ba-f530-4fe0-f3df-08dd9f2a2a0a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 03:29:20.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Md9VMAFt+6ATzLDXmGWG64zO1tL9SFXnZ7qWfBPCM2Aj88y3VD74xGNlSEiaERtGzyFYa38O+ADQ7+tz1JvKprNn1YfKDkAsHiaU+dM7+eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7733
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300028
X-Proofpoint-GUID: 0zBf-gQl9YjSkULi5yWkjYsufYsVq3hn
X-Proofpoint-ORIG-GUID: 0zBf-gQl9YjSkULi5yWkjYsufYsVq3hn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAyOCBTYWx0ZWRfXx+POZ/5eE0D0 QT34KmN9NpVftUlyt9wXujwx7C7ZYXxU+HUzP9fLPjWk40qOTGgOj0+qG3/WDvtSgw4lvik8o8/ EqhmrHzkfXdtRsvOdlfDKJB+W20YlFtdEDxI7ObrPcCXVY10ZEWNDdloaoemoLND+pYghurqyDk
 FBBYSsvQzlhrSlTCNqQ5T0I+dGA38ElHI6oGutz1FFO4YlM/HFphpdNredKaqTWCZa9LOfg6T+T 0XGUAS7jTsLxBiBJ0Y2KUkREsqUFTxeOcECntXJHjqRWuOROJO8Po9xEV2iBYucpAZD4pNhAdyP sxC12EWTxAcNuxK0DU5hRkuaGs1jEI+1V8Qar90SfR9y0V71DPnzIQEro+sLYx0lVsdO8h70JjU
 zdEkq43Fuli/yD4Q6XV012VuQRnJ+Sm5Goxuy5dIHF5+gPEHLScvGmUKdBX0PCR9LNuIOSKe
X-Authority-Analysis: v=2.4 cv=c8qrQQ9l c=1 sm=1 tr=0 ts=68392613 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=UXIAUNObAAAA:8 a=ifEA0RKLEYCnOpZB-IoA:9 a=QEXdDO2ut3YA:10 a=Wz26C787asYA:10 a=a1s67YnXd6TbAZZNj1wK:22 cc=ntf awl=host:13206

Ye Liu <ye.liu@linux.dev> writes:
>>> +import argparse
>>> +from drgn import Object, FaultError
>>> +from drgn.helpers.linux import find_task, follow_page, page_size
>>> +from drgn.helpers.linux.mm import (
>>> +    decode_page_flags, page_to_pfn, page_to_phys, page_to_virt, vma_fi=
nd,
>>> +    PageSlab, PageCompound, PageHead, PageTail, compound_head, compoun=
d_order, compound_nr
>>> +)
>>> +from drgn.helpers.linux.cgroup import cgroup_name, cgroup_path
>> Anything in "drgn.helpers.linux.*" can be imported from
>> "drgn.helpers.linux" instead, which would help if any helper moved
>> around from one module to another. I've recently started preferring
>> that, but I don't know if it's a huge improvement. EG:
>>
>> from drgn.helpers.linux import (
>>     PageCompound, PageHead, PageSlab, PageTail, cgroup_name,
>>     cgroup_path, compound_head, compound_nr, compound_order,
>>     decode_page_flags, find_task, follow_page, page_size, page_to_pfn,
>>     page_to_phys, page_to_virt, vma_find,
>> )
>>
>> Again, not sure it improves anything :)
> Thanks for the suggestion! After considering the trade-offs, I prefer
> keeping the current imports for clarity:
> Readability: Explicit module paths (e.g., mm/, cgroup/) make helper
> origins clearer.
> Debugging: Functional grouping helps when analyzing code.
> Both styles work, but the current approach aligns better with drgn=E2=80=
=99s
> documentation and our workflow. Happy to revisit if needs change.

Sounds good!

>>> +def show_page_state(page, addr, mm, pid, task):
>>> +    """Display detailed information about a page."""
>>> +    try:
>>> +        print(f'PID: {pid} Comm: {task.comm.string_().decode()} mm: {h=
ex(mm)}')
>>> +        try:
>>> +            print(format_page_data(prog.read(page.value_(), 64)))
>> Rather than hard-code the size of struct page, you can use sizeof(page).
>> And in fact, all drgn Objects have a .bytes_() that will just give you
>> the bytes of the object directly, which would even avoid the sizeof().
> I didn't find the .bytes_() method. Can you give an example?
> I used prog.type("struct page").size instead.=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0

You're right, it's "to_bytes_()", sorry:

>>> prog["slab_caches"]
(struct list_head){
        .next =3D (struct list_head *)0xffff9f604cbecd68,
        .prev =3D (struct list_head *)0xffff9f6040042068,
}
>>> prog["slab_caches"].to_bytes_()
b'h\xcd\xbeL`\x9f\xff\xffh \x04@`\x9f\xff\xff'

https://drgn.readthedocs.io/en/latest/api_reference.html#drgn.Object.to_byt=
es_

But stick with sizeof() (or prog.type("struct page").size), that way you
can use Program.read_word() as mentioned above.

>>> +def main():
>>> +    """Main function to parse arguments and display page state."""
>>> +    parser =3D argparse.ArgumentParser(description=3DDESC, formatter_c=
lass=3Dargparse.RawTextHelpFormatter)
>>> +    parser.add_argument('pid', metavar=3D'PID', type=3Dint, help=3D'Ta=
rget process ID (PID)')
>>> +    parser.add_argument('vaddr', metavar=3D'VADDR', type=3Dstr, help=
=3D'Target virtual address in hexadecimal format (e.g., 0x7fff1234abcd)')
>>> +    args =3D parser.parse_args()
>>> +
>>> +    try:
>>> +        vaddr =3D int(args.vaddr, 16)
>>> +    except ValueError:
>>> +        print(f"Error: Invalid virtual address format: {args.vaddr}")
>>> +        return
>> I find it quite useful to replace things like this with:
>>
>>     sys.exit(f"Error: Invalid virtual address format: {args.vaddr}")
>>
>> Which will result in the script exiting with a non-zero exit code, and
>> it will print the message to stderr, rather than stdout. All while being
>> one line shorter, for the code golfers :)
> Agree, I can replace it in the main() function, but in other places,
> I prefer the script to continue running instead of exiting."

Yes definitely!

Regards,
Stephen
