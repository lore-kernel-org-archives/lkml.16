Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69384EAF9;
	Sat,  3 May 2025 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746261518; cv=fail; b=NhNIl33w1API7fD9O4PZWZwHC5U0DEwJfRKoCtuh0SomZ2eglQQy7c2g28I1KeFl4qLU2d/yTZxumFP9EMIDbFfunPF/+Yy6ON02aMdnXlzUhDQcv6m4+6T8goemmNCx0BQgK0fo1Undd80Nvo52fHhYP+ns5XNmAIcxnnP0wzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746261518; c=relaxed/simple;
	bh=ABNV2/Dl5JPAPPyzApN1uZIKtVMHgADw41CQd46AZG4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J7vyXV4FHvMuD2NERSGsV19vLq29Zu60FTwIo0KQDz7++TE6h1/UYcscMTquT0gxH7ygataK9KYCCP4Dhtm3xlUxuqf/oldXJ+iZr43XiXgY5vWXc86w+S5uD2wP0O+cW0WoAaMHiJ+Z+Fvz++eb6WfZ3eWRbNRBNUEN8Lp0ZNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NGokjWVo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=teKsFs1A; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NGokjWVo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="teKsFs1A"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5438SC8O010833;
	Sat, 3 May 2025 08:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iYyDGC24n99xMbo63FpBRRR/Ue0d9WU2LxADQspPlGs=; b=
	NGokjWVoH+lWhWkNb8ViUGKJUyM3mZooyhvoEEdgQVP6kA/TB5g1pAWOPSXYvdWZ
	2XWQQ60It9OSWFe+Jzt0vOz10ZqUpVFSDUsjUXpsFBO/JK1c/5POuFevDeBrXUti
	Z/ogF0jWyXQlql8YN29KcuWCtmMg6/LxPg0gGj+WxXbPFkH6FmpbY5An37OWaene
	HNR/sPTURra4A0gu4WQa7LjBqotOnVVXZpUDNNiNPuywgSw5EPLaTm/nMeD5wXiL
	O5vLc9+jNJgimqRIkVnNfRwUMQsWTCYUu3H/Sklxesc3gQogSGlkKxk5TjOsmukH
	gqZzbl7tpyfEZ//VwdHwDA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dfn280ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 08:38:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5436t1CI011187;
	Sat, 3 May 2025 08:38:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcdrmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 08:38:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv6Y9EMpVqSNWkbcI/LuG5yJ96vQHILVNxoV/qp8uzX6vCnaCb78D5E6e4SOitIqQ7xiwBoHKVYy+FabDbWf37yfSej6ZkokUJ7A8+MBFGDv5FSvKFO0RZFXBwdo+MaBsI6zeBINU9OYosgZPoPKVERJWrh5hyv+DfIMZlyWufAiTfzxrH+w5lcT81a5Y92l/PytT+TdZK7UWT8qZZ4s7r4FWkbL+/+ABQcmOY5HVoU0GzpXG9MFkrP1ffp+T7IYiTduK9PWSbVimJrWJ0K7mLA70/J1ToQfkBOcZvq21rQgP/gz1crWzgfVcd30WBoOW6DRnG7uVY46mLe0zT0I9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYyDGC24n99xMbo63FpBRRR/Ue0d9WU2LxADQspPlGs=;
 b=j+4ldJWXa25OeI2b9cSG87K1ucA3wEiT1mWgIncO0R2KzYZqkOszTYkTbKbE7PeUKEay5m+/I1EUngYqEleN+zpqAuPRwfc1tx6CaDVp3bVpL5HiRNW9BfnK3hPt4D2ogOcm4Pp68nWFIeDedOaKuh8XotDx1j5nSF2sGPKTjyhWf9IyD3nk/gRGCUlh8EbbLG13K9R/fiWIeGzftu+KKktVKU4WGA9WEwUnXtMdZePEUYt2KqQg9oQCrUybtzyTAkQcnHRa/xBxWkm4ckIyyr7f7zJ18trhHEmx7LFMBGtOU9+eWMYCfzR3mdfPVgdGr3sMIHW0mJUhh5q8xmw8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYyDGC24n99xMbo63FpBRRR/Ue0d9WU2LxADQspPlGs=;
 b=teKsFs1AyvaqLIRxruxaCChVJbej91SJu5HSqhoo6HVweXxcSUQA0YLCcEpHiyGkUECpmrVlvIH47iqRuqZIY1ggHMQNnxJvRfIWp7jc8wd6sR8u4AtGlGDaOHY29G/0X05oKbKlPEkYEVpandm1tDAmtg16xuyruX7jPdb303U=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CH3PR10MB7530.namprd10.prod.outlook.com (2603:10b6:610:155::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 08:37:57 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 08:37:56 +0000
Message-ID: <59ea8b02-696b-4972-8874-72e707e87b52@oracle.com>
Date: Sat, 3 May 2025 14:07:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] platform/x86: Add Lenovo Capability Data 01 WMI
 Driver
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
References: <20250503000142.1190354-1-derekjohn.clark@gmail.com>
 <20250503000142.1190354-5-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250503000142.1190354-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CH3PR10MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: bc646b67-9f80-490e-9116-08dd8a1dcd91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUNGd2x1bWdyd0NPYitCSVdJbHhuMjZHOFFKcU1ocW9Od1dROVZuZFBOaFZ6?=
 =?utf-8?B?aWJxNkNrR1ErblluYk9rYlM2VXN5M3RCNGNhbXhXQVFSaG8rWS9lRWwvb1RD?=
 =?utf-8?B?cGZKcmNGR0diVG9qWmcwdHRNRDgwLytoQmR6R21hS0FHQ3dVa1I2UnNadzcw?=
 =?utf-8?B?ZGVBd0NxemxZYkdYUkFKOE9LRTJzU3Z6ZGhoUXAydnlpSHJFd3hGWU12VTA3?=
 =?utf-8?B?S0crOGQ3TDBMWXpFWEU3RDd1ZnNWYkZiZld2S3hmaWZVV0VCSVp4ZXlpcXd1?=
 =?utf-8?B?eGJWNGFpYzlQdWFxSjFRNVJQc3NxNDA2a21nMENuVjBiYktDbkdrSXlrWHc0?=
 =?utf-8?B?UVJ2N3VhTkF5UHp5QXpKTG9qYWlsR0d0bXc4dS82QXI1S3Q3NmdRa2xLWHJ2?=
 =?utf-8?B?dHpmblJlRkhOajZaWmVxMmlXcnVVM3BJSWtHU3VKblF1MG1DWGlDSTF0UDBB?=
 =?utf-8?B?VHV3U0xtVUFsNklwMTlrZnlqMHczcUVMdlFtRGViM203Q0V5YTkxV0xzUVJx?=
 =?utf-8?B?VVlkRFhsd1E5MUpUNGVHa0sxcTNzL053eml4UlIvZmdZY2RubFJXMkNGRWNr?=
 =?utf-8?B?K2xPckdTRGFOKy9ueUlXMXQ2SVNwcno1UUdqRDBZR1V1aTJweEdaMWhRaWV1?=
 =?utf-8?B?M0lmWkY3Z2I0R2JvNEdoU213ckFTUEV1dWtHeU1mSFMvUG8vbWpRY05UcytR?=
 =?utf-8?B?MmhjNytkNFZpeVYxaTBNZEt1dVNYUDZiSXZCR2NROGhnbFdZTnE2ZDVCVnhQ?=
 =?utf-8?B?OS95WWZlT1dKZ25uWEJQRVBudUZsaCthc0I3ZWU4UXFzRFVORkRkMThTcUVi?=
 =?utf-8?B?UTMvTS83eFlySStaZWczT2FoOUlwdWRKeVZQejRPS0c3TGNJd1BRUjAwSHh6?=
 =?utf-8?B?R1JaNzRPN3NhdEx4ZWFuSGNyYmpyWlZVVGlPSHIwUjZXSkVOQmRiMTFmU1dH?=
 =?utf-8?B?dkgvTHVGckFUTTJhYkc2dXg2WXk0YlkrSlZ3bkUvaUtnd0wxK3VoYmhrYkZp?=
 =?utf-8?B?WmFZVU9wQmZPbzVQNHZoVlB2R094aUlxRHNhdm5QRU5pYjNyNk1vdGhtMmJY?=
 =?utf-8?B?VmVIb0liNXpuOVVUUnZGTWxlVFM3bk1ybTJtbGx1T0hyRFJuNlQ0UWJmTzIx?=
 =?utf-8?B?NHpvc2E1QlFXVjBBY1g3TUNQOU85Q2VVQ1RkUDdaMkFlYWR5TGdlT2ZSaWtU?=
 =?utf-8?B?QnZUc3ZRc29sampBc0ZuL1VwOHUwajd6UU1XM3YrLzEybEZ6UFhjcEdsVkth?=
 =?utf-8?B?TnJPUVJuNlZEMG5aTUN3Q3VYWEhsT05QSnJINE9ISTZMOFZiMEpMemFKZkRi?=
 =?utf-8?B?VmxacU9qTlUyMDhkN1Rhd2tuNDZlY1hoZGpJV3NWeEYzMzYvbHU0YmpyRCtY?=
 =?utf-8?B?Uk5jcjJYVmY1cWpSKzZnTDd4bFNpdHh2UTF0S0F0NTlFS0g1Rk1odzdJa3V0?=
 =?utf-8?B?ZWtKZHBidTNoa25pSnBSOWREbVVuOWpWZE1BRlYxdld4Uko5NWEyOW1maVpU?=
 =?utf-8?B?WERWQVNkQk4rQlRWWjJFUHBINVBwRERDOTEyQy9EenhNNDMybjdkMlNjeDRX?=
 =?utf-8?B?VE0xNzJRdE5jaFgvRjA1dGNoZXZxM2tsdXo3bHpPQlBzYkNWTzhXOUNBWVd4?=
 =?utf-8?B?YkVWR01CWllETTdzcGI1cEkvdEorOHlFZDNIQVo4T09xdndNdUpVRWhnR1gr?=
 =?utf-8?B?TWxoREJoMFhHNFZZT0FveDNXRGQ2S2NHSjUwWE9yN3BCRytiU1Q2SXM1MXMv?=
 =?utf-8?B?RkRVekpGYXFlWkt1aHJEVGpGbjhUQjhpUjlUZzhwdzBVc3JjaHJva1kvUWY3?=
 =?utf-8?B?RTJLUkZRd1FDZ1RtODRKeE04bUFucDNVQjJMelhZL1N4Vk5VcWk3Nm52QUEy?=
 =?utf-8?B?ejRtZFZlN2w3WkZHQWV1MlZOUmJqUk1ybExQcU5CUExneWtOeEdPSDdRaUxn?=
 =?utf-8?Q?4upyPZu+2WA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmEzKzhpbG0vN1JoQUJXaEcxK1BkdkdnYlhmWGJqVTRTNnJTUEF0MzJzSVBh?=
 =?utf-8?B?VGpHYzVBaCtHNzVYTFdTWFlXR3lTclU3TUpROGJISVlqN2l5ZktuTHQ3TXF2?=
 =?utf-8?B?bmpzanZxZjBaRlBpRkFBaklEd25TMEEveTdXTDZwd2lSTmFOVnJ4dlFlYWNI?=
 =?utf-8?B?MEVDL2c4RTUrZXJWRS9wV2ZVMk10eUQ1a3JMRnhWTWJ1NHNjOW1SSk81bUFW?=
 =?utf-8?B?aW9KM1kyMkJFS2dtVTR6RjU4cmpkb3Ftb3RQRXpVQTg2MXRwcXRNOHFzRDRv?=
 =?utf-8?B?d21TcXpvNExQVU5WK1ZHWjBMeGlRMHQva09CbFhJWDVxcDUxM3lpbm55dVA4?=
 =?utf-8?B?VHdhOC9Vdi9WNWZrOGlJbHNOdE5PaWh4czVYY3E3Rk5YK2dXWHV1dzY2MXpU?=
 =?utf-8?B?TWJtc1RRRGJ6MUN4VGZWYm4xNVhIZ0hjVXpGSHRIaTdaSUxNZmgxNFdEUHFW?=
 =?utf-8?B?eVZNeVRpSmJZWWdyaDdHcUl2V25sQ1RISFNUanp6NjRYaTUwbXpqZ1U4NlpW?=
 =?utf-8?B?TWpPVHhrNnhFVHgwY0JWNWZ2eTFHbU5FTUtZS01tTU5HQ2QwTjFyU2VUWlU4?=
 =?utf-8?B?NW5ySzJ3Y2RVbCs2MUtFRnVTNzMwcEdUM1l6cHpiTVU3SDQ2Y3NWVS9Fak8r?=
 =?utf-8?B?c283YWd0emthdEFKcDhpUHcvUUk2TWEvUk92dW9PWllMMy82aXBrN2l4MkpB?=
 =?utf-8?B?UEM4N1dJdU5pUFRYaDJrSGRhbk1oYlJVTDZlTi9YeERycUJ3YnpHTy95MXoy?=
 =?utf-8?B?WVFMRldOSVFlYkV4b1NlcUpzN1RLdmNTSGJtV1pyL1FHQjBwN0JhNENjWHZj?=
 =?utf-8?B?c29WRzlqSUZjNVY1YjA3V0R2OXl3M3ErWWlGSDJhY1ZkZmhXdWZrWnFnMVkz?=
 =?utf-8?B?c2REOHdvU0dHR2Y3LytLNlVKdkRub2pteVpMOXh3Q3oxL1JZMDlQMTdQQk5u?=
 =?utf-8?B?V1hkQVVyc0xHQkNDRzc4aGRQeStLbERIdE1yNFpiNmR1em42U1NhMkJIVWRx?=
 =?utf-8?B?QTkrMW5MSnVwK0QxdEQ5N3U4dHdoMnFVUnVMUjhQc3F4UHdFVXpaaTlKSjky?=
 =?utf-8?B?WFg2cnlsRnpGbFRJWkFoSnpsQ0ZkaHJMZjl0RTlPcEpTSGhtb2cxaU1hcUxp?=
 =?utf-8?B?RHhCMjNZK1lsa0I2WlRQa0U1NThCWDZWQXJBRXpwRy93NmF4Y1ljZzlXdWlD?=
 =?utf-8?B?eW05Wm96QklRQUx6K0NzUnFqdjl2NmFuRHFHdFduVEpFOWFWcHlpYkxzc1Uv?=
 =?utf-8?B?Rjl6cmlOK0lCWTB6aVhNcTMxRTlidmNvMFFNRUcveG00V0Mxc0F0Y0dDWmFH?=
 =?utf-8?B?SVJBMFhsM1hPNnBVam5QWjJZRUd2Q2Q0d0RZMVBISENNM0JkS3RMVnJrMUdt?=
 =?utf-8?B?eWNrSDkvTE5qbXAyMDM0Zlo4Qy94cEF5QW5rVVozdWlKUWJramhVVzJ0YmVM?=
 =?utf-8?B?WEp2REczRkJnYmUxalhoUEI3TG56Wi9FOGROUGhzZndkcXo2MU92ZXFuUlN5?=
 =?utf-8?B?ZEZxc1AybnVkbUdDUERVOXdsNnN4aWt2VmxidEYxQWdLMzVUaUx3dmF4cVRi?=
 =?utf-8?B?MUUzVUVwV2docERsQlNaTThSbUI1Uno3MXF5YUpLd0g3US9DRVNuYWdHRVZM?=
 =?utf-8?B?aGROY1U3ZTg5Mlh6S1BJN0FwbExndjNZVUxxemNFdHpEN3BucEVrbkZGeEF6?=
 =?utf-8?B?SzAyTndSWk1RalM3M0tOdW5nWEJDblByWGpoQ1AxOXE2TTJFbmlTSlo4Zklt?=
 =?utf-8?B?c0ozcEtBQVVYVmJMeHVzQU50THpjcytkQXNPS1Q0UE5WL3NxVk5HWlo4SCs3?=
 =?utf-8?B?NHRseHpweHFpM2JwaFF5Y0xNR2FSb0JtbDVHMmtSS2pEbXUxMmdmcmNZWWpY?=
 =?utf-8?B?QjhVT2p2VkNBMzc1TGFacmtWbnZheERJTmt1NGY1S1M4NDg1dFRoSTB3RXdY?=
 =?utf-8?B?dGVKZDVzamF1RTlwdkhkUUUwaHowdnZxOG1kNWVORCtBWU9wNDlrRWZ4Yks1?=
 =?utf-8?B?SUhZcXdHazFYbXo5ZUhJa3NYVEJkSmlLRlpoZHgvWFk0MnRpdGxiRjJxVnpJ?=
 =?utf-8?B?bmdpdjJDeWhBdVkxenZVbFVvOWNRZXJlVUxFcXF0aldRNUNyMzJOOTYrNm9G?=
 =?utf-8?B?bW5xRmd6S3FEVEg1TzBxelp3MHh6WjN3dU1yYWFzR0NKZnVpU04rU1dvQ0k2?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1kmvl501ZxvmjszJcWLKW3WDuCU+haEf3In+nRbDVfMeCLDEZE+pTb6CNOgpF5U2h5pFM98DlZ9O1NpUNjHJrt3KdSsh4J7714FtB3izOq5i1xn+ff8ELvD7BQtqYtOjC8WL3AR1zwb/KYfUbsqSjFS/GK1NwGRqKd288/l+8S40/sj+SWmebhaSuNtjkax1BEg8GjY8WhQRgwA3aQMWvuC5oW2HpzB/lmEYzSxaHpOyusxMRnY6jyvDYZN4O0vuA8ZHgA0fRXi2h5D3hqKFGIq8llzFasEQWAFEOFmXcFrZVsKc0HlWW/mbA9rmsfTa5JTayKhwQYtG4cgK5TKKL82CiJpu8AMLgBqsD2N3AtYnVUodsPPiT99WxSEVxr1k2ec30lDuPU+qWz1//4pMC5AIf3dMFJTextA61XpnlFYTcYGLiyZt/3ZGjs5+/ua6ryAiw2tuKthbK2ftj5VtxPQcwIfr8twssFTdd2/wMXTVRI+YzO1FBHXCyObjL9YNaqR9DWV+TiiQeJv04cPZHFb/upXp4s2AzKXvEHbj0vSFl30+tyByXZdSXDfhEiNdRWSzUXIohiAlVTaTkbmzCFLtekvPj5Mbqi06vt2IuFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc646b67-9f80-490e-9116-08dd8a1dcd91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 08:37:56.7263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWhx/0Yu7SBJS2rM3CarAVfqij5cT8G9aVwRGwaZ0eOZFSm7m9Gb3dsbycK8P9O7l/NkW3GzXjqDHY86JsdrrhUHVzitEhhBhGj1D1KeHyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7530
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030075
X-Proofpoint-ORIG-GUID: m6Pk780o0O7j9q8hW9RQZniuxiF8Ljul
X-Proofpoint-GUID: m6Pk780o0O7j9q8hW9RQZniuxiF8Ljul
X-Authority-Analysis: v=2.4 cv=GJAIEvNK c=1 sm=1 tr=0 ts=6815d5fc b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=cRXjOdbKqacN-FEcQLUA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14638
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA3NSBTYWx0ZWRfX3oNuEDtgI69R 0UaRp7nSbYeOkgfUiDwxRdxLAaV5icqkwuDROO8Zwguf6NUefpOa5cafx9IZmPGP0t8bFBIyvd5 rGRe7e45jNZy/b9mOXPcl2GsTgPCO6aDmOC+Lrphjhu4k1fkiF6gMFw6+T0V6idl7VGrGu7H94h
 //Dj/pORmYuFE74zcfq1daOaeN7bZ0j15jjNC7bGfrJcANovLUIyofQ0+0hPYkjFy2ifDWIJqb1 SFIVmnGttjK8fklscb1ZvHsVzdD6wA4isMtQENIPzmzPhl/o5sjeN8X129A8uigAM71p/M94Qqk nmBgQ61OnCLCGylc6GoH8NzxZV/NR+0seQf1DmGJj4JPkiUE5M0URodLbaqmR9Uq203tuqy0H/x
 lqWoUFwn7D3FwKsoZ7WIinHOCoITO/vcUPe6BoYBNRG9lqcY6HlLsWhAzGbKsJSRTlHwbCPB



On 03-05-2025 05:31, Derek J. Clark wrote:
> Adds lenovo-wmi-capdata01 driver which provides the
> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> enabled hardware. Provides an interface for querying if a given
> attribute is supported by the hardware, as well as its default_value,
> max_value, min_value, and step increment.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> --
> v7:
>   - Do memcpy instead of returning pointer in lwmi_cd01_get_data.
>   - Put list mutex inside lwmi_cd01_priv struct.
>   - Unregister from acpi events on dev remove.
>   - Fix typos.
> v6:
>   - Recache capabiltiy data on ACPI AC events to ensure accutare
>     max_value.
>   - Fix typos and rewordings from v5 review.
> v5:
>   - Return to cache at device initialization. On component bind, pass a
>     pointer to lenovo-wmi-other.
>   - Fixes from v4 review.
> v4:
>   - Make driver data a private struct, remove references from Other Mode
>     driver.
>   - Don't cache data at device initialization. Instead, on component bind,
>     cache the data on a member variable of the Other Mode driver data
>     passed as a void pointer.
>   - Add header file for capdata01 structs.
>   - Add new struct to pass capdata01 array data and array length to Other
>     Mode.
> v3:
> - Add as component to lenovo-wmi-other driver.
> v2:
> - Use devm_kmalloc to ensure driver can be instanced, remove global
>    reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
> - Use list to get the lenovo_wmi_cd01_priv instance in
>    lenovo_wmi_capdata01_get as none of the data provided by the macros
>    that will use it can pass a member of the struct for use in
>    container_of.
> ---
>   MAINTAINERS                                 |   1 +
>   drivers/platform/x86/Kconfig                |   4 +
>   drivers/platform/x86/Makefile               |   1 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c | 301 ++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-capdata01.h |  25 ++
>   5 files changed, 332 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b4b06e81192..1b22e41cc730 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,7 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-capdata01.*
>   F:	drivers/platform/x86/lenovo-wmi-events.*
>   F:	drivers/platform/x86/lenovo-wmi-helpers.*
>   
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 13b8f4ac5dc5..64663667f0cb 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
>   	tristate
>   	depends on ACPI_WMI
>   
> +config LENOVO_WMI_DATA01
> +	tristate
> +	depends on ACPI_WMI
> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index fc039839286a..7a35c77221b7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>   obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
>   obj-$(CONFIG_LENOVO_WMI_EVENTS)	+= lenovo-wmi-events.o
>   obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
>   
> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/platform/x86/lenovo-wmi-capdata01.c
> new file mode 100644
> index 000000000000..419b51f7f7c3
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Capability Data 01 WMI Data Block driver.
> + *
> + * Lenovo Capability Data 01 provides information on tunable attributes used by
> + * the "Other Mode" WMI interface. The data includes if the attribute is
> + * supported by the hardware, the default_value, max_value, min_value, and step
> + * increment. Each attibute has multiple pages, one for each of the thermal

typo attibute -> attribute

> + * modes managed by the Gamezone interface.
> + *
> + * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
[clip]
> +
> +/**
> + * lwmi_cd01_component_bind() - Bind component to master device.
> + * @cd01_dev: Pointer to the lenovo-wmi-capdata01 driver parent device.
> + * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> + * @data: capdata01_list object pointer used to return the capability data.
> + *
> + * On lenovo-wmi-other's master bind, provide a pointer to the local capdata01
> + * list. This is used to call lwmi_cd01_get_data to look up attribute data
> + * from the lenovo-wmi-other driver.
> + *
> +:* Return: 0 on success, or an error code.

typo :* Return -> * Return:


Other than that, LGTM.

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks,
Alok




