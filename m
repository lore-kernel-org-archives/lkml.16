Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61164211A11
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738788182; cv=fail; b=eTKK8A2SYbps4qNoo6d9GGvPkpWU6O9zRaQ5fEW5GbF1y0+qQ6yUevTBRCeTNn50fUX3RFL/QCIY92eWKVuVpsHBdGykgKuNaKjsXTxMBcF6QoThLmhddOwwJXZC9+4i9uu22VvMkTFL9XeNzm4oeHpQu8zgaEiRVGRcW540cuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738788182; c=relaxed/simple;
	bh=l+jZOucD94oPUcVXHRA1VhQ4LAx0z6tUy+ItFUoTHGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HX0phIhP8ff2qBR+8WOA2IY4+tv/vkle//SYFs3kFqPmozqFR8Gh12specQl9snkxf/E/lm9CwxWJwz2z2Y2pWml4NcI/F3N5e2OyfjYtLmyEWD2sT08/tl9XIxhN4b9GzUw5easBvJ2/6exzoO173JwAdWvAkPkq7ZrOpn7Zpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gb+UZTTN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cr6IMHF1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gb+UZTTN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cr6IMHF1"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515Gfiwj016866;
	Wed, 5 Feb 2025 20:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=nipQQ0C9U2yaJtYfQDm3jUuym1+Y5zTTMzMy9pgKEuo=; b=
	Gb+UZTTNgBzk2WHJmfF0wv79+yTwo+abAj4hs62BZ0ifxOMuiWn66CL0UUUIRM4Q
	0ipU7+uhWgW8DZ7apiDO+BPO8lAr4mR9Q5hXxgpM5xL+YD4blh1jfXrBA9jvnPnW
	Y9OzELxKucQdg0ClB1splY+kyPUOqmDliePULrWnu0uHxk0HLtQEHYHlusZtDv3N
	7IVeelpLOi7gRi7p10pFdijLhl9Um54FR0yLjNLZ4bRAf/xwvs8aBO56C5QnnQIo
	ePTeABnlOWG5hU4KANN6mwTySLX9mZ6TPEWL1gV7w8UfA7LnnGWM+yqpvKnLpUP4
	fia2sDDWlB09UnA5CKzfWA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44kckxkxt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 20:42:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515K0Pql026963;
	Wed, 5 Feb 2025 20:42:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fp3852-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 20:42:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAG1Cujo69T7axo7HEENgDSJ+4MJVFNF+N4oD1YgVU+4phcPDyOC9tw5Q4cMcY8njTyDTlMeKdsscTwUKnkTrwo5gZFQSuEiPOXafQn16Xk+o7lMmR2zXaUZo3N21WZfVmA7jYPMLxyMoF6WTqlHozdG7cGfoDP9P+FTC8bFCZATsUJvJPzTcHEtFtuHIh5J35gga4hCzMCrRB7Db6xWmSlNCzwCziYsziYi39tIDWbd2W2W3+2v2fGLkevftJnD1vV38AeeMoZ3wOwt2N0iy1ycUt/CDHLnfhPRYVkPwAQeDthIN81JI1tueU4wWcFu5UObeWTY9zbHNTynyyDLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nipQQ0C9U2yaJtYfQDm3jUuym1+Y5zTTMzMy9pgKEuo=;
 b=nKtJU+drctczh1PJXKnt766elqlxf3I04XITnxzBFc+7n5VnUVnGZsxeb6PQx/w4K6/1XxsaVNA2nQ5mUWNohk355yMuajr/F+7NyinxrHrtw02XSZPstHI2K4NKUnc8bg0mQpJYDPUwa12FX3OqCL0XgkgkZfiI94w5xaPI7H8CBHc/NQXuOcmMVXWJuJsd9Gv4nWIzw3tJ9W2l3HwL/nCbqTnn2FxAci9EVj/3nDTRAB8vcr06VbSGmnx9RsE8A/jxTOTLb/MNBH/Yhupku0XIZrqNIP3MmkLst7IkaUKFdBN/tnxP0bMEBGjtKsL8FodRMoVg71QYzsQr1AmWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nipQQ0C9U2yaJtYfQDm3jUuym1+Y5zTTMzMy9pgKEuo=;
 b=cr6IMHF16HsBBH3DB1+ypJZU3fuvm7kTpxk21AjwC1nzPcvySckTiYMSAcLmtz/I93XIB8ueb26W7njN+GIj2s8Mp8L7Qfje7z/AAybOhHFmEp/5xRsOvas3PW9KThdgLLydrsBk0jXEe/TKv4uT8Dimk5tvmuqLcok+EJeHxoY=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MN2PR10MB4334.namprd10.prod.outlook.com (2603:10b6:208:1d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 20:42:46 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 20:42:46 +0000
Date: Wed, 5 Feb 2025 15:42:43 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] pid: sprinkle tasklist_lock asserts
Message-ID: <jamcxevfeuzsqhsj7b5o7jt2avfqpqmcahwadiwnayj6cwqpvf@psksqzyktksg>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250205193221.402150-1-mjguzik@gmail.com>
 <20250205193221.402150-4-mjguzik@gmail.com>
 <wzbq4zk7uln5pzjkho4olu3hku2xv2taxymv3ien437tjxivlm@sz5kxj5oohsq>
 <CAGudoHGPAQYwVUEYgxMYZ808=wAO3RteLsqNgG21pvE8Gfs_eQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGudoHGPAQYwVUEYgxMYZ808=wAO3RteLsqNgG21pvE8Gfs_eQ@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::11) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MN2PR10MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0d8bf6-0ad8-406e-b72f-08dd4625a56f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|27256017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzY3Z3REZnBWYWozK1RSaFlhQlZuQ0YvM2hEMHljM25DbjZUeHk1T0RpRGRT?=
 =?utf-8?B?UkVQL3B1RTVjY2JUZ0JXT3lZRjd0eHpVb2ZUaEJZdmJFZ1hISzlNWXlqcmFu?=
 =?utf-8?B?c0x1RlJsQ1Z3RnRwZEpBWm9SejVockRPcnBPKzFvNWJlaVNFSDZIZWhXUnEx?=
 =?utf-8?B?OHBONEZqMDl2ZkFXejl5YXoraUFhRk5CQVk3Ly9NL3VzSWJyckt3UVcvQ2pz?=
 =?utf-8?B?MFQyemFCSFZKckFLY3V3dFNwNXBaVWZJZ0tvdjZGOWZ6ZU0wcnltWElrSHBq?=
 =?utf-8?B?K2psZ29qM0EwbFZrVEszanUxYi9JSFVnUXJRUXpTQVp3U1JzbG9YV1JZcVVv?=
 =?utf-8?B?VlA4QzdpbmxEWWEyZ1RYNzMvNDcxaEVPQmhNQUY5c3dHVnBPZE11a2tBVWNI?=
 =?utf-8?B?SWk3LzRaeVl0VFNIRGZLSTVvNFV0S1lwLzZ4TlZvOVpYempRaWJrLzdRYjlF?=
 =?utf-8?B?ZzdldXhmNVVJSzA5V2UzMXNaMlZSTWpoSkNKTFFYaGtVb0FJNm1hWTNtRjRa?=
 =?utf-8?B?K2p0eXRjVGJhWkQza2R1K1B1aDNZUHhhQWxJTFlIQjhSSnovb1E0OEYrOFVo?=
 =?utf-8?B?QmUzK2dDaVBFN3B4Yzl2K1dlc1JjcnFrWERvS21RWWl1enlkNlQzZk1WT29W?=
 =?utf-8?B?bjZtM1lNZnZkRTFScEt3bE1RR0kvS3RkS2hPeDk0TVdVWmc5YStXU004RXJZ?=
 =?utf-8?B?Ky9yaDJma0k4bHdQZWpBOVlaK2VlYmxlZHpmTCtMeXBoMi9OWVlVZ1BFcXNH?=
 =?utf-8?B?WlBzVmNmVUVaOGsxUlFpYWRJRHpvR0dqTGt5a2JqczdrL1hhbmpYU1RvOXRn?=
 =?utf-8?B?TktDbGk5NmN0VW1CdTRTTjlBZTUvVlBXU1VvZ3g2czQvQ2JmSTBuTTJ5Nmx3?=
 =?utf-8?B?c2d1dWNkSlEvNlJuV0c5OW9qZTY0Vjg0WmN1eDY1amdUL1A1d0hvckxyRVJj?=
 =?utf-8?B?Q2NWN2NVbkx0d0d2aWVvb2pUUHhLa1FHOXVxWUJ2a3RZNzVBeHB5UWFvTEtn?=
 =?utf-8?B?eHNOSFlleEpVRzlUNUFTcjBseTg3NVZBSUJaUWVFckQ5dkdPMFk1SG9KSFJy?=
 =?utf-8?B?WUFhTTl5QkdrNzNQUXRkZ25BUVE5UTNYMVYyRngwQis4ODF0YzNrZnlabXdk?=
 =?utf-8?B?RjBVSGg2UzNXUGxEUWlXaVllMG9MYmtNczY2N2w5VXZqS3doNUpnNGNpVVVr?=
 =?utf-8?B?VGx4WVZNZkZLckpjcVdMaDFNejl4K3F1VEVINDc4NjZoK25UUDVPNFloeTFJ?=
 =?utf-8?B?Nk8vYzNLWE44OU0wNDQzTVN1Z3BFaGU1RURTTi9mZmJaRTR3bmF2SHh3ZE8v?=
 =?utf-8?B?WGc0S2gzdFVWM0JRV3IzTmc4OEZSb1dFMUxJUFdVUGdWcXhIOUZlaEl0dGo2?=
 =?utf-8?B?VjdVS3oyWTNOTkxWMHREZFYzRVVJQUdkZzVNbTBVdG5xK2o5K3lVWnQzc2JF?=
 =?utf-8?B?NmVlVHozQno2TXJqTGxkck0wYy96ZjdmZTVmZU1IYWp0dGF6aGZDZUJmUkRm?=
 =?utf-8?B?ajRtMHVRV1RkM1U1dEFtclBWTkpCeXFnZFErS2xuMEhUbi9tS21aN1huMVIv?=
 =?utf-8?B?VTJGOVBxY3RLQi8zQ2tYV1RxYmpkRm14S3VROUY1NDZTL21iMmlTeVlnVE4v?=
 =?utf-8?B?NlR2eGEzdGdmSUlzYVlWenNtVlVtU3BzYlhkTmJKOG5nU001VDNmcmdSaFVl?=
 =?utf-8?B?cVRzMS9KOVBwSGQrdWgzRzZuVld3TDNuam9MUUQ3cHlkeDFXeWlmOW9WaEpL?=
 =?utf-8?B?VzVxak00YXM5TktYTVJScGhRMVVlVTliSXJYSUNnMUlSUlFhM09OZzBFaldr?=
 =?utf-8?B?VC85QytXaDF3NVpUa2tRQU9jdEFqKzkybzFGVmNoQ3hzTjVrM0J5SVdaRld4?=
 =?utf-8?B?bHV4WTFHSG54QytGcTR6MVBPRi8wbnl4anNuS2dabUhxYWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1Q2WU82bW9NRHpwU2J1aUlxMjRMTnNHc25XNExBZnEySWhMdjBsTTlkT3B1?=
 =?utf-8?B?V2g4OEhubjdkODB5Z080bXpQdTUxM2l1L2w3ckpVazQ5QmZHUDlpNStjemky?=
 =?utf-8?B?T0dSc3ZpYnhiSHMrZ21kaEpNendwVXFxa0VlRHpxYlBaOHl0dzFZZ09neTVX?=
 =?utf-8?B?SFVHdTBBVnBNUWYxVXJZMlBoVGc0VWgrZkRQbVpvcnJCMStjcS9ndGsyV1ho?=
 =?utf-8?B?cTIrbHVmeVdjTTE3bHczNVVXc3dvbFRpS1g1WTV3SlVHOWdXbjE2N01sVWlN?=
 =?utf-8?B?N3Z0VTIveG5mMjdVRmxKODlnMUtlVTFjbG82cmtaZ21HNUphVEFGWk9GV2tV?=
 =?utf-8?B?L3RQUkplMXlpb1U4cURsUFZhZzNsa3orS1VsRjN1Y1pUWUd1VzNTSWV2NTVa?=
 =?utf-8?B?ck9WSWg4eFlVaXJ2MW5RQjlXWmJmb2pjUmkrQkhGdUpUNW0zTWZnTEgzMmlx?=
 =?utf-8?B?WVprVHlOMjlPWE5YZHdpaWJ1amdwKzJYdk1GMXFwdU9FRmo5cjAzQjgxeGZa?=
 =?utf-8?B?eHBwV3pGbUwySmFDU1hJOVh6RlJHUlNXdERJK3JPWHlsV3gxQTZkVmE0SXlv?=
 =?utf-8?B?Y2pDUndxTkpKQ0hYemQxbmVydkxJbzBHYmFncVhRc2dtY25KQUQvSEJySGM0?=
 =?utf-8?B?R0dsVytsQlg4Rm03RWhDYldTR21uRlZuZW0zdzNVU3BPTFRYcVNOUml2UCt4?=
 =?utf-8?B?WUdudEFmSS93Z2J5cnJmdHY1cUdXV21JTS9lTC9JcXZPaHZkbHNwVXZkSVhG?=
 =?utf-8?B?Y3BwMkxyNXJXUndzYldrQWZiOVdSRVVva3ZaWk9qT2gzaHREMkpvaENvZnNW?=
 =?utf-8?B?aW5zRUE2NkI0cnNQZkZDeTVNM1gzUWJXc0RqNlQreUptQzB4a01pL3VyaTAr?=
 =?utf-8?B?NGdwUE5hWUUzeGxJSThFRjdtZGhnY3VSZHZjRU1zWjBBOUtBQXloVm1BcWpM?=
 =?utf-8?B?VzVoYlBoODR0OWxzNmFPNHpmenlYRTdZbnpSSmFGc05HcFBESy8vZEZPZkVL?=
 =?utf-8?B?TGdBTG13cUwwbWFRV1dvZ09ZbDlQRTJGS2o1VEJIdnpSejJnNkxPQmJFazRo?=
 =?utf-8?B?WkpuN0g0MW83QXU0bnQ5SkxGZTdVSThGOTZFczZ6Q2RWUkVyUTdsYnNCakY3?=
 =?utf-8?B?SUV0SWlnWGFxRzVqa1REeVYwbUxFcEtMTWRjSTJEYzhTSWtQQTRUaWxLYmt3?=
 =?utf-8?B?eGVUWFNTWXN1WjVOcmZpNGE1SW5xQTh1cmQrb0NxaVFiemFtY1VPNldLbXRY?=
 =?utf-8?B?MkxGY0hVa0owV2w2QU1hZ1NWRUc4Z0lMTlFCK1RQdHo5eWdUdDlKNkdDL2xi?=
 =?utf-8?B?SkNCNnN4OTE2VFZhMVVwdm52ZXhKWERxdm1uc2lVbWNvRXcrTUZ3eUI4WVR5?=
 =?utf-8?B?VHZXNjlMZFhlSDd0TmNVRnlJRlB0Y3ZaajBCeVhPK2tYZFpaak1FZkk4ZDYr?=
 =?utf-8?B?NXVRcWlidVZJNjB0c2d4UXBVMVB3YWRrdE5tbEJiZUZBRS9uTDR3ZUNNU002?=
 =?utf-8?B?QUJmRmsyeFJvSjRXa3czZXVhdTlKZWZUd284NUFkMExtUnBhSURmQ2ZmMnZy?=
 =?utf-8?B?YmdmYlF1c29Vc2hvemRtSDQ4MjlLbzh4dVAzenBtUkRBZHRvR2RndFFKakdw?=
 =?utf-8?B?ajc0THZXQndsN3hTQnczbU1zNEFzTExxOUoweDdGbWFDZTFrbm5YQWNBdUpn?=
 =?utf-8?B?c2Z6Q3IwMWM5YnYrakRDbWo5VjNUZGdRSlp1M0xIMmZyTUtKL21mNXlFd3BO?=
 =?utf-8?B?YXhqL3g0bVc0U0dCcWJCSXpodnZ3M0RiejcxNENxZjduZDhhWU9OR0RORVBM?=
 =?utf-8?B?WmF2Q0lXUzJDVUoxdUN0Y1N0ZUdGQmFwTWtlcW9CQkpwSVV3ZVp2UnQ1emFE?=
 =?utf-8?B?V3hYa01rWWk1UzRUM2l3RGlObXFaTXNXcjBHK2lWd1FGWHlCZHVVYTh2YVpq?=
 =?utf-8?B?UUVDVktyMjdwL3k1YWZ1dHFpcnRpRUlhLzNWSVZJckp1VmJjYmRJV1VnWnBH?=
 =?utf-8?B?Q1JFcnNpRy9zeS9QdStmR2RlaXRNbEwzOUsrK3pMOTJpcTZuU1F3cXBBbEZy?=
 =?utf-8?B?Y3dza2dCMnBhMWtQcmhXS3E2M2NMYVNCYmNrbjZnRWZ0VWxZQWIwOGRKNEJz?=
 =?utf-8?Q?D9i41FKF+gYInHTZs35ZSKZHq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j66HysYhXfcs3SAYaXIre3ZEURJUuYV2EIw4EhW3WPF4pirG063DqJJtlaQJBCVvXe8buMYLzF7Bobyxj4hUugJk+xBqdiDYKtsFBqx4qImntV797VFjIDjrnoKU75b7382K2kXQeEkM4tyTYL9vp2vZ1sEqV/8Woux2ZlYKh9kKlknQ43EwHQO44vFISga3yug/Aa+SmIw7GxH2FjlSTxWbB2mYJpt4TqYjIZFMXsgmuX+/TOy1tpzJkuahEIUw7B2uGuHKJAz1OE71yd7M3Tmf0nvsoBNahllPCEy1e9/K4BGaBXLdUajrNee1BjCO3A2IgP1q6ZKd4Zh9oEomtQxWo31+9m1/HtktGRSiD2pexC86PQ8QR8c6iB9XNOWbr/2hVD+/NqEQ2WQgJembve1QbK6lD1XnA2B1q0r8/poQs4pbFkzgeOIPTHjVJtobpesRWuD7srq9XlU+EfKVW6AYGm/UhlA8BMRdqF3XHCoTZg1mzYqdI37YwMIEqvk0d9DZjR+dFkPHZxMRjiIRIQMZMSR06Gr9JEMEzuVqCz4PfhqH6lTn75domtc4VMfcMNaCmpZe/1mp/+qXeC0xVqQp0ECqGkQ0GS2lLHGXzLQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0d8bf6-0ad8-406e-b72f-08dd4625a56f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 20:42:46.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0yQ0xtKouQpzj1Fop/4tTK1OrgFCZuwW7ttLfUhcELKMJm00tfNdTnTVh6kuTIapLhUi3JvWwdM3ekvnHHgyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4334
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_07,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050157
X-Proofpoint-GUID: UD4PFQCsNMmBKtsRkR28V9G5zQc_soA7
X-Proofpoint-ORIG-GUID: UD4PFQCsNMmBKtsRkR28V9G5zQc_soA7

* Mateusz Guzik <mjguzik@gmail.com> [250205 15:34]:
> On Wed, Feb 5, 2025 at 9:27=E2=80=AFPM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
> > * Mateusz Guzik <mjguzik@gmail.com> [250205 14:33]:
> >
> > If a patch is worth doing, it's worth explaining.  I'm surprised you
> > didn't add a comment after the last revision missed a comment on patch
> > 2/6.  This is literally in the submitting patches document [1].
> >
> > I don't mean to delay this series, but I do want to know why things are
> > done when I'm hunting through git logs.  Having a change log isn't
> > optional, and now you know that Andrews script won't fix this problem
> > [2].
> >
> > I see you are upset by this considering the terse and lack of
> > punctuation in patch 2, but please try to understand these comments
> > serve a purpose in maintaining the code years later.
> >
>=20
> I'm not upset.

Good, thanks - that wasn't my intention.

>=20
> For this specific case I don't know what can be written in the body
> given the really self-explanatory nature of the change, other than to
> spell it out(?).

You could say why you added it?  Is this something that was seen
happening?

>=20
> Does this work for you:
> The routines need to be called with the tasklist_lock, the asserts
> validate at runtime that this holds.

Well, you are checking this lock because it is protecting something
that's being changed.  You could say "the tasklist_lock protects X, make
sure that it's held"?

>=20
> I also git log a lot and like to know what's up, to that end I
> appreciate *short* commit messages so that I know there is nothing
> more to the patch than meets the eye. In particular if there is
> nothing of value to add in the body, I appreciate if there is none.
>=20
> But that's me, I'm not going to insist one way or the other.
>=20
> > [1]. https://www.kernel.org/doc/html/v6.12/process/submitting-patches.h=
tml#describe-your-changes
> > [2]. https://lore.kernel.org/all/20250203175128.80319b42c9739f0d420080a=
4@linux-foundation.org/
> >
> > > Reviewed-by: Oleg Nesterov <oleg@redhat.com>
> > > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> > > ---
> > >  kernel/pid.c | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/kernel/pid.c b/kernel/pid.c
> > > index 924084713be8..2ae872f689a7 100644
> > > --- a/kernel/pid.c
> > > +++ b/kernel/pid.c
> > > @@ -339,17 +339,23 @@ static struct pid **task_pid_ptr(struct task_st=
ruct *task, enum pid_type type)
> > >   */
> > >  void attach_pid(struct task_struct *task, enum pid_type type)
> > >  {
> > > -     struct pid *pid =3D *task_pid_ptr(task, type);
> > > +     struct pid *pid;
> > > +
> > > +     lockdep_assert_held_write(&tasklist_lock);
> > > +
> > > +     pid =3D *task_pid_ptr(task, type);
> > >       hlist_add_head_rcu(&task->pid_links[type], &pid->tasks[type]);
> > >  }
> > >
> > >  static void __change_pid(struct task_struct *task, enum pid_type typ=
e,
> > >                       struct pid *new)
> > >  {
> > > -     struct pid **pid_ptr =3D task_pid_ptr(task, type);
> > > -     struct pid *pid;
> > > +     struct pid **pid_ptr, *pid;
> > >       int tmp;
> > >
> > > +     lockdep_assert_held_write(&tasklist_lock);
> > > +
> > > +     pid_ptr =3D task_pid_ptr(task, type);
> > >       pid =3D *pid_ptr;
> > >
> > >       hlist_del_rcu(&task->pid_links[type]);
> > > @@ -386,6 +392,8 @@ void exchange_tids(struct task_struct *left, stru=
ct task_struct *right)
> > >       struct hlist_head *head1 =3D &pid1->tasks[PIDTYPE_PID];
> > >       struct hlist_head *head2 =3D &pid2->tasks[PIDTYPE_PID];
> > >
> > > +     lockdep_assert_held_write(&tasklist_lock);
> > > +
> > >       /* Swap the single entry tid lists */
> > >       hlists_swap_heads_rcu(head1, head2);
> > >
> > > @@ -403,6 +411,7 @@ void transfer_pid(struct task_struct *old, struct=
 task_struct *new,
> > >                          enum pid_type type)
> > >  {
> > >       WARN_ON_ONCE(type =3D=3D PIDTYPE_PID);
> > > +     lockdep_assert_held_write(&tasklist_lock);
> > >       hlist_replace_rcu(&old->pid_links[type], &new->pid_links[type])=
;
> > >  }
> > >
> > > --
> > > 2.43.0
> > >
> > >
>=20
>=20
>=20
> --=20
> Mateusz Guzik <mjguzik gmail.com>
