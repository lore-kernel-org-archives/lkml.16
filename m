Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D221F94C;
	Wed, 16 Apr 2025 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790627; cv=fail; b=ElEu8ZbWSKcSn07Wk20BXyc7L+KhqcBPRGrR9vmUuuU8HkiLHGec1ws/tkuQXv5L4loN+GjbqNsjlhtBEOlo7dkNEt69AZv24qrG6iZAHPtJmp9nmCJ7MlXl7XBAOsaJso3wfYkXXitxgKmJa6+n0DQRhKQACQoP9E9GqoJgxTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790627; c=relaxed/simple;
	bh=6g1MBaeXMsiZ+9KgIIy7xjiONapD/EP1wHDGD6gSPxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k2aUx7tJLkC9z8lQoRrmUcb2atfluu3G33GIqjLneVJ4DexwC4ApRBxmZrzYLrK264TQFHp64eWcOv/JCbsN6fw5gqZYppFzbblauqnVHPenM2UDp43vrbLprU2T2dZ9TTAeXaPAzA4xMR0uYmtSJLewoanscJ3+vl8Y3XY61wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cr01IAZ9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=snkoLakv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cr01IAZ9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="snkoLakv"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7uXN1015732;
	Wed, 16 Apr 2025 08:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=XNJs4HxJT8w7am0sIW8Pt5/nlipw7IWrDoUbjEnJfqM=; b=
	cr01IAZ9uCMeub1j9ZWHc0RYDiIVwMXbMhK2JiGNbi303ci4iUSNFfcqj2m/Jzb/
	77UDvCSfL/eYhGhhWVg59TUGv/VjwjZYLSfOh7gIFNdU5dF/OHMiyoJduFXQsKkY
	T111dgpt9MFhXD6dhPAHIPYXIKC2iMuTBM5MLV7TPhKCg6eWTfXtA1yssUjeYWZO
	03h6YXYwNxWaBe7fOTgSWAUr26VoalVwnUze74BVxpXBM9K51W2C8mdgS8hGnhDt
	qYoZC7yIeN4LJ6H2Lyr55MbFyGr1eaA9pAMxvUZdAgR1CdEvn3gqZMvltLlcqerA
	hLl0QbSqgWbRjtnzZcBatQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4616uf3p7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 08:03:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7H1CJ005651;
	Wed, 16 Apr 2025 08:03:22 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012050.outbound.protection.outlook.com [40.93.20.50])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5wfype-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 08:03:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJlPyEsLZ2TAnFuX/1IzamiluBbJ0jYCsOdmOepz/6zGlfByRrELu5r5sni83717vHdJgKZYJhk4c+i5Nz1tmjAf4KN8sklKAMPyDwpVceNji1A1oYpyybyKoRPTqpoNShm/haM2GDTiMgghWgIarFernimxQEtoSChebvUlZW8d0Y5DKKPk9k0va1B7HaiASSHDyL2iDdsoOY/lTrDTNVTRuS+pw/55T+5u1RbHGfGTv/gzdNn9ZoiNnaDYBCmt2I1taY/6OxQeuCdjYbDsNuLmH2ibxURpTznrarZXvkddxPkRwI9ZZmtEJlZRilmZ+vuIRc17ZBgaJbfHlzjVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNJs4HxJT8w7am0sIW8Pt5/nlipw7IWrDoUbjEnJfqM=;
 b=uT8XIVaBV9XYecEWWsFWSx4HWhw6lYcp3d95zfKzF43yrjK6eJVCQjxKGOgpRMNRIVinuj+HgqJ3mWXcEtn/DCgwjJC0aXHM5nFpwvrmFnvU2y/twg5hynMM0PlhMIsftymXiWpgxCvwksTXdNIzaRZp1xha/JBW2OKLUUWBHVuwDWn8gA5FqOLDf/Gx+AfKMGjskcc9geNZvMVpVx+plAhsa+/oXRh89l3+UODCAWE9RAtHkUBlJPwJaNpRcw+0cKB3G+yTyTTnIyeVh3CXmzSwATx5dCJz5viXaLBBYBQc0wFmjYkqqrIge9Btn/OiLlGXmtyPEzKtgOJf1xD7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNJs4HxJT8w7am0sIW8Pt5/nlipw7IWrDoUbjEnJfqM=;
 b=snkoLakv5ZJBrw9kOHQ5Zr8B6V7QEvBiQQ/NQCXSCPxwQz6F5y6DVlANk944nBt1cMNx4mY6mbKGg22VBp84jDsSN5tI34xFDIUbNCwInXPBdgv84Y0goRQzzFnm2f2YuFT/O4B9esZMLIkFhFmovxAmJus9Euw2c1mn57g5gJY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV8PR10MB7992.namprd10.prod.outlook.com (2603:10b6:408:1fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 08:03:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 08:03:18 +0000
Date: Wed, 16 Apr 2025 09:03:16 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WangYuli <wangyuli@uniontech.com>, corbet@lwn.net, kernel@xen0n.name,
        akpm@linux-foundation.org, jeffxu@chromium.org,
        Liam.Howlett@oracle.com, kees@kernel.org, hca@linux.ibm.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, xry111@xry111.site, tglx@linutronix.de,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com,
        zhanjun@uniontech.com, niecheng1@uniontech.com,
        guanwentao@uniontech.com
Subject: Re: [PATCH v2] mseal sysmap: enable LoongArch
Message-ID: <21558466-962c-4fb9-953b-911d2a586cbc@lucifer.local>
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
 <6954e026-94d2-4d96-a8f6-eddf0353598b@lucifer.local>
 <CAAhV-H4=SZrJjVwVv6fqxTZn9ODP-s1ZEgYKTmHMPH7aoJuvng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4=SZrJjVwVv6fqxTZn9ODP-s1ZEgYKTmHMPH7aoJuvng@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0505.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV8PR10MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ae3e91-556a-4a95-6280-08dd7cbd261e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1h0dGpVZ1pONHo4bWtSSElhcHU4dUt3TEIvZHF0SXZFdHJJbldrQkdUZ3VP?=
 =?utf-8?B?OEZwcjFKWm1XM3dQLy9LNHgxUGdJZHlNWmhaQWcyRENHdFVMd3hGVkZ1dytH?=
 =?utf-8?B?bHd0M202TElGMUJhRTV5RjVMVy9TdHp5Y1ozdkdiN01BcHVRQUFhWERUNUN4?=
 =?utf-8?B?VDkvdU9VRi9wOEpDMThhSkdKckVrN1FXUlI3ODZHd21OUThNS0JVQmVWR1NH?=
 =?utf-8?B?WmFwNHVyT3JFdHRyZ1RPdHRld0svc0cvU212TUwxYXFHSHNSb3lQQ2REYmRW?=
 =?utf-8?B?cDNabW81YU04aGlaK1d5R0J2NGhKZmdCdHpiV2JBSnJvSHIvSXJ5cEZwQ2hN?=
 =?utf-8?B?SUtET3hLaFlndFZNNnZ5QTBQWjNJSng2UGtGQk44TCtuQnVicVRCdC9NNkgz?=
 =?utf-8?B?dXNiWXRPanVLM3dkNzhwS1NHUWF2S3FhcVBaYTJGeDJlWkJNOURJTFJGRVlo?=
 =?utf-8?B?eWVIL3RQK3F6RGlSRnBHaTFtRkFLbzJBbzJiVWkyS3RiV0IyVjJVTEZTVG5F?=
 =?utf-8?B?eWJFbmtvU1M5OW1DTUtrRUN6amtIY3JaTk5pU01YR3puSEJpajAxVnRubXJo?=
 =?utf-8?B?MklRTC9kNE5ITTZ6OTNoQXZEc3hSS0Z6NGMyRmxnUldac1NBcjZ4WFJNaVZ0?=
 =?utf-8?B?WGxpV3kwSERjMXdqWW9XWGRpa1pYMERCRWlwYzVNNjdqZ0VlR1lPOEZJdFlX?=
 =?utf-8?B?MnQzdW90bkJMRmxZMWh4UU9hZFQ0OUFCbWk2SXR5N0xOZkRYSVVmYkNJd3Y1?=
 =?utf-8?B?bUVnRXFjeDZBODlnT1YveEtrUm1Id1FLYXkzcVdacUVIZ05pbnY3S09BdEZy?=
 =?utf-8?B?Z1luUy9xSzBuMUxUTUR4L1o4Q0UzZXlZSFJzL09wUEtlNDlFTXp3UVU0SEZI?=
 =?utf-8?B?bmlIdFhlSkVCUTMzdTJvem5TcmUvSE1jaHJPMHlmYTZXT1RLWWEyNUJ2ZU54?=
 =?utf-8?B?Y2VKdDBPR0sxZkpvTlBXMGgxZmpFWG00d21WN3B1VXhTTW1uY040OXVoTk0z?=
 =?utf-8?B?cEQzUUEwd1NOb1VON2Fpd0QwY3E4VHErMVdicTBWRW1hdityaERad2ZKL0JM?=
 =?utf-8?B?YnR3UU1SbVVpMzhpWEVZUWMvcHZzZmJqNTZLbmUzeS91UGZMWmdOSzhOb0FY?=
 =?utf-8?B?ajA5N0xXNVVSNDI0T2hsSkx0VTBlT2hMNWxPY2FNNzlSVVBlVnBHd3FoSHJm?=
 =?utf-8?B?V2VBb0pFV29WRXFuQURFQ0hNTnJvQUovVUswNDZmeUx5Zmx6eXBBU2NZUm5a?=
 =?utf-8?B?NjBoWU4xblVTcHhBcDN5K1YyckRUMDRDZlN6bGFRRDg1NU9DaEduY1pwM1l6?=
 =?utf-8?B?SG0zYWtpVUZVVzE4UWNZcXpGNTViNjlTd2V2TldMZmp3c1EyVW13TC9jdHVG?=
 =?utf-8?B?TGZad3MrMTU0c3Rtd3dlN3NhNnJYTGFyNVp4SmNaVkgwRzFJR2pFbGdtTGRM?=
 =?utf-8?B?TkZxZ1VGNW42d3VmQ3Z2S0tzMjFVZTY3elo3dUVmTFpxVnNWdVJDeXVVU1o1?=
 =?utf-8?B?M1k3U2VoYi9FMzlwekRDSjd5cE4xVGw0bHhJdVVuZmk0eHgrcUl3YjNFaXpS?=
 =?utf-8?B?RDZ6UWpySXMyLzROMXU0eEpKcHRlZVpLcThYK3JkK2hjRDdpTmVVVThyZjF1?=
 =?utf-8?B?NmVkZjVGLzZhQlNTdzNBdWd2RVZId3hxRG1Tdld6RC9iTTF5QStzM0RTL093?=
 =?utf-8?B?UkZrS3lRYitDWHRqTkxVOTVnL0wrNjV0SHphVlk5N2VuZy9UdTR3aGVLRGZR?=
 =?utf-8?B?ZWdnUUxKRytqYVFGWHZMQnhJcVNHU01Kckx5SFJ6S3JEZ1hrRnN2YlN1Ym9r?=
 =?utf-8?B?WmE2cDdFeFRxVzlyaDBzZ1RMSUkrVWIxY0plRDJzNzdVNEJON21EV3VBQ04z?=
 =?utf-8?B?T2VFVm0vR2JsaGd2QkQzdGNzOUZzSmFiek55NTV0UzFmaG9zVFczdnd3VHlj?=
 =?utf-8?Q?x3KMEqB6VJU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUNSZVpNWElPQ1h2NzRobmNtV2tOeFFXOEZGcmhibTFWaUxhZHhXS0FYZzEr?=
 =?utf-8?B?MzVwSnRMQW9HQk1UajlDVXpQUTYxbU1BU1JJMHFUYTFjc3pEQnQ5b2kyamJq?=
 =?utf-8?B?dGdsazMwdUdGR2RwMEYxOGlFQWh5akgxSDNkRG8yY1hPRVpJUmNMZTBFblo4?=
 =?utf-8?B?dytLdnhJTlVkUXdvZ3crWHVFS244bmlCcU9vaXNic0lxKzVjRXVySFVUTDJo?=
 =?utf-8?B?TjJHaWY1U2VMU2JCSkloNzBpc2ZCS051SnFHWjc5UkYra2VnT2RkQmJQOGpo?=
 =?utf-8?B?ajFkdldONnd1cnB3TjlIMlI1T3FqZ2NOMk40MitpejFNTjFOa0p1MWxvZExa?=
 =?utf-8?B?ZHcvT2w5SldYcEZvMkFSRWhrOUJ6QWhYWlVFalZzbFp6bXRjQVQwVUJQOW1U?=
 =?utf-8?B?M1FBRFl1SlI0cS90aUR6TFROdk41c3U1VDk1cnNzeUVRUGlhekc3MFpUUm0z?=
 =?utf-8?B?SUVGcDd4V0l3cmVyVDQvdGRZVlRqUmJaTEFDTlMvendrY1lJb2cyQ3NzU1ZF?=
 =?utf-8?B?ZUlJa3ZNd3lWU2txSW81S0FjRU84U3NmdituV0tTVDgwSHpYMWxteHI4RGpT?=
 =?utf-8?B?L0NXU2RkdHA3eTI1a3MzTHhzU011N0hDczcvVkF6MHNVNTF2UjZ2UncwYTRF?=
 =?utf-8?B?enNGQ2VCNXB1TTBJdjBLaXNDVVVudGJTN0FOVHBoMnRqY1FQNHQrSzhBMzhG?=
 =?utf-8?B?MjlPQngySEVzNHoxWkhPYjA1dk5DWk9GcUtOS21heG0zbDdVbmdvNUlQK0p2?=
 =?utf-8?B?N1hkQysxamZZZ1VuRlpWT0cxV1ZHVm9rZml4c25id25rajdKMHNUWGtBSnNs?=
 =?utf-8?B?RXByM0d1UGE0OGJMK0dzRVNoRDQ4STV1SFBSaHBtMXFVVkN2SjBOcnZBR20v?=
 =?utf-8?B?Y1ZMOThiRmJVOHE1L0NGdktkdXNrUS93VEdRbFo3dklYcDUxSFlOVE9LSkZE?=
 =?utf-8?B?RUpsSFZ5L3o1UGtnNmdab3JtQkxIRnRjMXFuY2dYKytjMWk2dmw4RlJaNU9k?=
 =?utf-8?B?VTE1d0hPV0RSc0o1a1BYY0ZHWEVTQTVSWTRSWnRWUkhWTmlZMWR5WUFQdmxq?=
 =?utf-8?B?TXk2UmFVWEd1bWE3QU1NcmZoNGRNUWtMYzdIeDdOQUFVNHA5T2tjdEZCU2x0?=
 =?utf-8?B?bWJnSStuMUZiSEZjazJqNWJMSHhLWTZYWi8xNmYycEovcTRuVjNIZVlnR1I2?=
 =?utf-8?B?ZTFETXNtd0E3YkFJKzJ6aUU4bHYxMzEvZElMTWpSQnlidnc1dFV0WDVhNFZu?=
 =?utf-8?B?ZGpqVU5wMkUzdlFDRlYzNmd2RGVURjVvR0JwMGdielUvYnkvUmprbWRyVjRj?=
 =?utf-8?B?Wlk0Vzc0djBJaWVmdVM5R3BHQjd4bmd6SnpTNjNKT1dVU0x6eUJKcW5xODVK?=
 =?utf-8?B?cmhDRHRZZzlqN2s5aXFRcXp0ZUxUS2ZnOWlTcHN4ZmNFQk5Nc0dzSlhITzZJ?=
 =?utf-8?B?ejVzMU45VnphVW5aQTRUbkRLM0lCYWx4cHZoeG1QQU84Z3hja3RNK2lZaTVR?=
 =?utf-8?B?UzhWNjRjenZxT21pejFMZElsSDVMZzRXd2s4VnZRcGNIRTNlc2pQaXArcXlt?=
 =?utf-8?B?ZDAwWEg0dDBXYnVBVFVleXpkWW4xMEkzSUJSUmFqOHk0WkZzS3lhNS9GUUlM?=
 =?utf-8?B?cm9xZGt1YVR4ZzhwMmlFd2ZNSmt6c0JHZkR0b05mdEYxaitEQWJTNUhxeHRD?=
 =?utf-8?B?aHpaK2V6a0llL0NvQ3lJOTZaY3gxR1NIM2J5T3FUS0hYSTR1Q1ArYndUd2l6?=
 =?utf-8?B?NHNESmZHZVpON1paT09JejYwUndyM2w3NDBLRFdseHNDcFRmckwxWVVtcGc4?=
 =?utf-8?B?YUU0a21qZ0RjL1ZkcTFnc2tHOWRmY2xxaW96eWE1OUl2d3BiMmtRcVBhc1Zu?=
 =?utf-8?B?MXpGUUVtK1dlTWF0YzFYb2VKSXFjWEZ5VUFMZ0V0Y0xtYUVqbXBnVEM4TTZp?=
 =?utf-8?B?TnNteHpVOWpqUGFZTlVEYkRJYUM3NnBSSTN1YzhLZVBEU1c4eUZlbWV6eDZL?=
 =?utf-8?B?OXlmMWR6UWN3WVV5ajc0UDlTQlFKMG9iZ1N4NmNZYnhWdUh1QXdqZHRYMXRl?=
 =?utf-8?B?TDFkYTErS1h2VGIwWWJCbDZHZEhvREI3alZpWUhpdUlMU3htZ2JmeHAwb3lD?=
 =?utf-8?B?YVpqQ0ZTcXRPN1hLZURYenhxb1hieGM1UExqMzFEU09JMHMzRlhjc0dISjJY?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8JJhq5d03m7nYfFhtOVXTsInFJ8JgeFxP0GBlhwya7OrYJHix+dexYmFTjaCpAVVxAFxqUS6vTKKDh4pf9LSS37LK5S/IhYknYss9PXbkHt1/MMXMfoUdcPf8dtkCHS7jBkU4v8hRoQ9lsVb9WpF9NmFN6RdiHk2YITKjLwM5BgijpWxrl0Gf2ACmNgH0R/Q5wcnHFXt8MM7bNtV+Pj7cOVrCgk3lpVGhsb2VJgkitKC/DnKqcoxRsHYD0qqLN+x3soEOFAircomBlfwQkEvJ8nxqvxs/MoilwbN8AaKDyqa7pQqHYyZ6tnsh6ucxapAI1BiTEvh+2Al6VmIVZRKv5B6OHuedtyx92Rpva1fGhSaZfMiiejGPu6UwcrSuYU0DnpydIPzR4dot7bxdQrN2OfhuFLegeyOvYZHnwEqqUneBsMjrZxFUrWyHzm/tP+fQTzl1ej/GmeAD+n05nyy8bqbtGOF3pMOe2JDgYfz7Z5G3xlrbze4kp745aKAQqGAmccXzHg/n7ipArZ0zvG4PsfrvhrirP3OIBAWJlI5p1kCESyuimLSAf+h21CNnN3rtbfeCy7DtFERt0d9d1s0IQelHnjsu9gBv6cjcV/xZdc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ae3e91-556a-4a95-6280-08dd7cbd261e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:03:18.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnLQMEgK9vfhHkrpGtnNPcPtXWE2Qg4BEl5hlFyiV64pMJ7v8gOOKnCt90JMJ8SS7lkUhpphQUpMVEXkOV6692Rwll3M4K4mCNnfWQ/C5bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7992
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160065
X-Proofpoint-GUID: tx2T3L-51N-H9DS-sHF2HGpJ0MqPI0UF
X-Proofpoint-ORIG-GUID: tx2T3L-51N-H9DS-sHF2HGpJ0MqPI0UF

On Wed, Apr 16, 2025 at 03:53:51PM +0800, Huacai Chen wrote:
> Hi, Lorenzo,
>
> On Tue, Apr 15, 2025 at 11:53 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Tue, Apr 15, 2025 at 11:39:03PM +0800, WangYuli wrote:
> > > Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
> > > covering the vdso.
> >
> > I've also checked and determined that, as far as I can tell, the loongarch
> > arch-specific doe don't appear at any point to rely upon remapping the VDSO
> > or VVAR areas so sealing these should not be problematic.
> What does "remapping the VDSO" mean here? There is a function
> vdso_mremap() in arch/loongarch/kernel/vdso.c.

It means remapping the VDSO (and VVAR) since VMA sealing prevents this. VMA
sealing means that you map, and that's it until process tear down, more or
less...

I mean this is the thing, in my view, anybody enabling a feature that
prevents you from doing X with Y should understand that this is the case,
and explicitly state that no - it appears that we don't need to do X with
Y - in any legitimate operation.

It seems that so far, I am yet to encounter anybody enabling this feature
who does. Which is concerning. But by the by. I guess I will continue to
have to say the same thing to everybody and then go check it myself each
time :)

Anyway, what you're referring to is a hook that is invoked when _userland_
tries to remap the VDSO, which will now be prevented, if the user enables
this feature.

So those using this feature will break a bunch of userspace, namely anybody
who wants/needs to remap the VDSO/VVAR etc. examples are CRIU, rr, etc.

So this is fine.

The problem would be if the _arch_ code itself needed to remap or move the
VDSO or VVAR around. This would be odd, and I think we know of only one
case (and even then it's uncertain), but it's important that people
explicitly check this.

_As far as I can tell_, loongarch doesn't need to do this so it is safe to
enable this there, given the feature is opt-in.

But this kind of concern is precisely why we need arch maintainers to check
this.

I did insist on these limitations and concerns being placed in the
documentation and Kconfig entries so people are aware on review.

Thanks, Lorenzo

>
> Huacai
>
> >
> > >
> > > Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@lucifer.local/
> > > Tested-by: Yuli Wang <wangyuli@uniontech.com>
> > > Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> >
> > LGTM,
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> > But let's get some R-b's from the arch people please!
> >
> > > ---
> > > Changelog:
> > >  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> > > ---
> > >  .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
> > >  Documentation/userspace-api/mseal.rst                         | 2 +-
> > >  arch/loongarch/Kconfig                                        | 1 +
> > >  arch/loongarch/kernel/vdso.c                                  | 4 +++-
> > >  4 files changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > > index c6cab9760d57..a3c24233eb9b 100644
> > > --- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > > +++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> > > @@ -12,7 +12,7 @@
> > >      |       arm64: |  ok  |
> > >      |        csky: |  N/A |
> > >      |     hexagon: |  N/A |
> > > -    |   loongarch: | TODO |
> > > +    |   loongarch: |  ok  |
> > >      |        m68k: |  N/A |
> > >      |  microblaze: |  N/A |
> > >      |        mips: | TODO |
> > > diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
> > > index 1dabfc29be0d..ef733f69003d 100644
> > > --- a/Documentation/userspace-api/mseal.rst
> > > +++ b/Documentation/userspace-api/mseal.rst
> > > @@ -144,7 +144,7 @@ Use cases
> > >    architecture.
> > >
> > >    The following architectures currently support this feature: x86-64, arm64,
> > > -  and s390.
> > > +  loongarch and s390.
> > >
> > >    WARNING: This feature breaks programs which rely on relocating
> > >    or unmapping system mappings. Known broken software at the time
> > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > > index 067c0b994648..54ed5b59a690 100644
> > > --- a/arch/loongarch/Kconfig
> > > +++ b/arch/loongarch/Kconfig
> > > @@ -69,6 +69,7 @@ config LOONGARCH
> > >       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> > >       select ARCH_SUPPORTS_LTO_CLANG
> > >       select ARCH_SUPPORTS_LTO_CLANG_THIN
> > > +     select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
> > >       select ARCH_SUPPORTS_NUMA_BALANCING
> > >       select ARCH_SUPPORTS_RT
> > >       select ARCH_USE_BUILTIN_BSWAP
> > > diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> > > index 10cf1608c7b3..7b888d9085a0 100644
> > > --- a/arch/loongarch/kernel/vdso.c
> > > +++ b/arch/loongarch/kernel/vdso.c
> > > @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
> > >
> > >       vdso_addr = data_addr + VVAR_SIZE;
> > >       vma = _install_special_mapping(mm, vdso_addr, info->size,
> > > -                                    VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
> > > +                                    VM_READ | VM_EXEC |
> > > +                                    VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC |
> > > +                                    VM_SEALED_SYSMAP,
> > >                                      &info->code_mapping);
> > >       if (IS_ERR(vma)) {
> > >               ret = PTR_ERR(vma);
> > > --
> > > 2.49.0
> > >
