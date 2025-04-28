Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E50C8C1E;
	Mon, 28 Apr 2025 19:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869013; cv=fail; b=WXkcT0ylQwy0b4ZnyVvojo7A53ba7Wa1d8RhZrVfF+22VGiP9ka/344yd7Bg2zPnRAdJX9VQVbjUDbqP17/UQq/xPAM3/cqWdAk0Vgh1s/iOyHupkONKlgTelu/GdzIVZizZc/O+1lrCe8jjDen0ZC5CXtcR5aPBCsLFaY7lhoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869013; c=relaxed/simple;
	bh=dTSTl0A/LHUijEuzj+o3a02TqcWSc+T0+lrKc8rb9S8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hQmd22CJvVhOITUbpyKBlvYNX3n/BIG8PzycKgHN/41pPDsltTxmtbU5eORh4VfqoXzXKRxa0G1ELAkH9haXFjJIlzSXA66M42k56RkbBHHVN2nUxSFcXK36edE4xVxCIrl0NSmfdQjQLH4i9eTfTtmJ9ihhQlxzUn9GMIXDjXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NQZoz5KK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PFYi6qmV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NQZoz5KK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PFYi6qmV"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SIXHrX009076;
	Mon, 28 Apr 2025 19:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=W5xeNkUfrA4mkMhs20TqURInp2jnTgEoS+hZfSDh/Sk=; b=
	NQZoz5KKTZcQ6OrEExWkNKd9mOL3p6wBM9GExFsGzdsN3qKUCnB2kUv7iUq3pFVO
	JacgNJwQ43BWPoo5yVIrJIlh0UoJTSUoxECLbbzjp2tq4UGm+2G6vZ3zXiJyx42i
	ZeTpUuGzKoou0+GD4eNXQcerCHgN1v6TKN2kACFm1uA1pcQAfbuuMUYJ3ogEoj3u
	07D9+LCkscQABFag2vEGLalG+5g14y652cPiukvXCnyHRd1J9l4QE9vdxoxAYqFi
	vqtEBYAYfpEhovrasbuP/qproSpUN09I1U5aoeIQorQuQFDiBavH8mSMvOJpN9tD
	gIF+eUd/5iuXjl3qKO/mOA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46aentr6dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 19:36:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53SINmgR013775;
	Mon, 28 Apr 2025 19:36:17 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012039.outbound.protection.outlook.com [40.93.6.39])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nx8vxya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 19:36:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAhJlFyn1Rnz5NTYwfPcH/vVKeuXq5rDOgoqNUaCqp689IDlmT6kmh6iziOkecejKZVQ59zP4ckqPDrTVVoLinQNKAU0yiHnkDxgtXf3tap++Q00ks1hGnIF4s1oaLOdksQSxVQjpPqDk1ylpKQ8mgZVs0pVUKBZaRzRRYTHd7/bRXtL41nW3HJjcG9txqh5imJlGRrQvwRn+al4D1IUqVl0WRRW90b6gBXSHpZct79pNl9RFswIhg5klhB7lq+dECywo2eXCpUca4t8S8kwaLIs6C37sR/HNh1aLPROym9/q4VoXKGn6sylP5yUExaYFikYLBaiNigrT3Mqyd3sag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5xeNkUfrA4mkMhs20TqURInp2jnTgEoS+hZfSDh/Sk=;
 b=CLjD50T4didWJb4Bit3tQvlG+K6ZeFNHKBpdXeToh0QcMCbzSNr9ORSW9v7devmnqjiL6q5xKBOuUKQ+m76cSpauIEd1D4PyyA5RjHaCxZrWXdKI5/68yJn2TrqtrfNLENLLeXL1370KvtnWIvCWmSzhY7rYRHnsWSkZW4n2Blcqztg6NklwKa5IFjcc6ivDUGaZHrkTVmITnODAfbO7H5hRrFeiqNuhOz+uD9wuI+ck3Md51ybVpaKstL/z5u5kSXj2lmBLxhmM3prtrBkGYls5QNC4+2CKlLT76gHvDP5zOaAUxhBy6u9I9cXe6sITtHPEyyBKCtk6bQNh8nyHDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5xeNkUfrA4mkMhs20TqURInp2jnTgEoS+hZfSDh/Sk=;
 b=PFYi6qmVr+5Wy1BfDhU+wYmHxYhchDBFkjQG4jFZhCXDfgHsqU5lUGdfc9jSp73z9ATmbNA2zXddDSk7MjEsxyh5AJ4KnStDhD691JcjRQOe/ihvz3jA8l2aGQ4rdeL5MPLF1gadEAHZB/XijYD7B75x/2BrKT/L3pCjDJEEgcM=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by PH0PR10MB5756.namprd10.prod.outlook.com (2603:10b6:510:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Mon, 28 Apr
 2025 19:36:15 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 19:36:15 +0000
Message-ID: <b9db2d5f-2169-454f-a4e8-719342ef74cc@oracle.com>
Date: Tue, 29 Apr 2025 01:06:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] platform/x86: Add Lenovo WMI Helpers
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
        linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com>
 <20250428012029.970017-3-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250428012029.970017-3-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0103.jpnprd01.prod.outlook.com
 (2603:1096:405:4::19) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|PH0PR10MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da24ecd-3f05-4e6f-5855-08dd868bef0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVc5aTlUS0VYdy9KTXRMYmQxdU4xaEcwb1EyRlhreEJoNkllTEdNcmtKU21p?=
 =?utf-8?B?OGE5b1ZjNkZEbDZ0dEt5dm5meVhpSUJsMXJBR016WUlienR4OHdGZWlNSTlk?=
 =?utf-8?B?L1ZkUG9TME1UaVhwQlM2QXJoaC9OdDFvMUkzVnNPV0xtLzR5U0pjZ3NZSzBK?=
 =?utf-8?B?bU5uOUVpNkVFejlyZ1dzbjVhZUUyRjZEaHJWLzZIMnhIQjRTQk1zeEJWSXNS?=
 =?utf-8?B?M3RPN0RBNEtxUER4Z2FvbWxlcHVXWHNEWnRJZis1SzJFdmtpbWwzVXhIZm5i?=
 =?utf-8?B?b0NsV1BNYVNUdEQyNUVNdFhseStUL1F3djRPZUJzcjdvQVhNK3ZrN1JBMEVC?=
 =?utf-8?B?R3hYakllTFVodlN5Ny92MjV2MjhvTmVhMUdHMng3YkJYVHJucThZbVZsKzBS?=
 =?utf-8?B?SzVCc0hEcWxLbEMxV210bVhFSWhDV05UanFzeHUzMGZWWEJ6bU5CSExTR3J1?=
 =?utf-8?B?MkwrYitOaE51ZFpUZHhQTXJydHgvNFdWWCtpK0pMRTNZVGRNellnNEhvR2NM?=
 =?utf-8?B?aUp6bTErcFp4VGcrQzF4eUtuWVhuVEpoUUxaQUsyemw2Qkt1ZzlBTW95bHRO?=
 =?utf-8?B?KzdQd0t0MFY3QU1JUk44RW5WR0MwTE5FK3E1cC9WQjRlY1VRUHg1TFdNaHo2?=
 =?utf-8?B?QzJHeVlTazc3eWNIL2ZqUGJROENjY2hmckIxUGtjTXNXM0lrMHA0SndjdHVv?=
 =?utf-8?B?aThjNE0rZVQyYXRXWHVDZmJVaEgrVHVScjArSU9WVHI5WnpkcTFSOStucEQ2?=
 =?utf-8?B?L2QzYU9oU2dhUVg5amY1YzdyMDkwdVpoc01tYlI0MTN6Qkg5TFpHem92Z0tH?=
 =?utf-8?B?VlhpNVpHUnd3TEs1OTlkaXoxK25NT0lwN2tPNXZEQXozS05PaFRUaFZVM09R?=
 =?utf-8?B?eWhBOEppRzlOeHZ6WEU2QVRHazlRa3NRQkwvc0dWOE54aVBveittMXErMkdq?=
 =?utf-8?B?aXN6VHk1K2NDWUZsYlV5QnRIZSsyRFlwdDRkcEQ3MytkTE5DdGhtdWhmakRE?=
 =?utf-8?B?a1M1THBrQjJZZnQzMWxrWm1BWHBGUlMxWHQxQ0tFM0dzSmN4ZGUvZlJtd0tX?=
 =?utf-8?B?TDQ5TEtqR1E0TmZhZ0xPWTBXYWwrOGl2R1FkcmQvSkVIRUhiMHpzMmRKaGlM?=
 =?utf-8?B?OC82SWMrdU1VSm1ESlBCdlBodU1ISUQydkJmZWVMeGJ6bXBBeFpvUnFyL25t?=
 =?utf-8?B?WEZSeUlmUEwrTW9MNy81Y2ZyU2EweDl6aU43bHY1S3h3cjE3TzRQQVlGaWFR?=
 =?utf-8?B?MXFmUCtmY0grNmVPNVkwVkJ5bERiUWxtemlLeGdseGo1UDVMblBieGJaTTRC?=
 =?utf-8?B?S29aNEdXM3NycnRka3ZyZ3JsUW5EL0J5Ryt6eFhIdEErWnlRWU9qcko4RFpr?=
 =?utf-8?B?c1UvaE95T3lNQ0F0OWVLbnBCL1F2VlozVmJ5NmhkMkRqci9Zd0dvVWx0Tjlv?=
 =?utf-8?B?WDlKWFk0dlVJbmllRlVoZXJBWDB5cDZhMUJ0U3hWMWpibldEeFYwaCsrUFFG?=
 =?utf-8?B?VWY3Q2lTU01tOE5kY2dyN29PajhiV1ppaGtVSEhGQ3pxSWZubGpvajVkOFVs?=
 =?utf-8?B?enA3eDJ3Mnl6Q1Q3TUxmUkFpOTc1TTJwVVYzSFV5d28zUzNxbDJ5Q0dzQW1k?=
 =?utf-8?B?ckUyVnBaZkF0QU5JdU9DOXpiZHR2L3g4bTgvYi9xdk9BemtPajI0WVE0Q04r?=
 =?utf-8?B?V09rTVBXOGVSalBRZWVnNEx5cWhpQVhyUWJZQWltNVAxYkt2bG9RMG1jNzFw?=
 =?utf-8?B?V0JoNU9IVXB6MTM2WjNWbjNZMTd6L0JCcTZuaml2V2lQVG4xbWc3RTZRQVZU?=
 =?utf-8?B?ZUluTFFZQ0x6NWk1eHU5QWN2QlRJNjFmWklnWG5XQTkvL2xaanZvUEhRMmkx?=
 =?utf-8?B?OHY3TmM5SGVlTmJLTnRIK3FWb3REdUZ1QXY5RHRoY1lTNmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVFnS1NiQkVHY0lFdG1FZzBncFNvbm94bHVONFZxaFprQ3p6M2xwcmJCUEJL?=
 =?utf-8?B?QXJnSzNpZjVIWkRDQ2pzK3hzd1doZlJMUVlvT1d5dkNWTms0aHFOSzB4Q2NY?=
 =?utf-8?B?enpvdjZtNFV1MlR0SXFReXo2aURWcHFYRUV1MithenU3V29LTSt4ZlJiSmpo?=
 =?utf-8?B?ZXlJajdoc2pWM0NGa1ZXTjJHVElueDZuSzdlQlRrOFhQTUVZOFdrWHBPVDZX?=
 =?utf-8?B?NUNVUEdpZDFLanVmb1M4V1V0a01oTjV4MHY5N0pVOGNEclQ0aVlGTGhhZElq?=
 =?utf-8?B?R1BvbFpZSy9zU2p1OUlWS05FTzFFNTNxVzBkUU1YZGhCc1ZZOW5mQWp3N0xC?=
 =?utf-8?B?cHJmcEVjSWFIM25ab3FWMm1uZ1p5NGxycmJFaExnTVpsZ3FnTHdiZE9hdHQ3?=
 =?utf-8?B?RkVUaFh5T1d4Qk9NOTEvZGR3cll1SjYwdmdsRnBYbEYyL3ZZVGJScTRLZ1h6?=
 =?utf-8?B?MndpRGxjb0I1Zy9iMWo3cDd3TGFOdzBjU1lVUWpTWFREbUlpVzJySWZDc3o4?=
 =?utf-8?B?M2ZhOTd5ZDhQT3crQmpXWCtqSURyamtEL3NjcHVUZ2laRHdWcFkraS80VkhC?=
 =?utf-8?B?NDVjWmRyeHo3bW9qSVA0cnZ0ZnVDUC9GSDJQdi93L1NWYnEzTFV0V1czNkJp?=
 =?utf-8?B?bVY0S0RsU2JLUzVvN0x6K3dENFhZUk9BU0ZUZGw4SVErSnNJRkxXck9GblB5?=
 =?utf-8?B?NGs4SXYrOGFsKy9Td3ZCdlBxY3FieDY2YmEvVFkwMUlJUTNpM3VWdVlwbVBH?=
 =?utf-8?B?OEUzMWVpaDlaUmZLMndjd1V1QkNuVHUvY2g4TjFpclZOc3cyRjdnb0d5emsz?=
 =?utf-8?B?Um9sZE1SUy96TWhEWGxiMEQ2azhhbXIyMllCb2dSNG5ZYThVQyt5TTRoN2dL?=
 =?utf-8?B?VytHYmh5QXN4YjA1bXVLMzZHNUFYaG1HTlV3Qms4L3poMjM5amZpN3Q1ZVkv?=
 =?utf-8?B?bFptU0RBdzQ0TW5hdXZXb3dLYnh5NzVnbUQrOWJLZXR2QUhKMjBjN3dLT2pO?=
 =?utf-8?B?SFlGQ1dNU09EVFY1SzB5dStwVzRWWW9kMkFKNkU2QnhUQjBqd2ZUQUtXVmVT?=
 =?utf-8?B?dWNjZnJ5MVpDWSs5a2JCYllXcmxxQUx1QWFEUTN4dld0endybFUxWm9Pcmxk?=
 =?utf-8?B?Sk1vSTNJd3J1NkwrTHJEMGttc2pRWk9YSWpDK21zbmtRMUpLMUdWSWdWeWpW?=
 =?utf-8?B?Q3VrM1VkRHNGbExrRjRhLzRvMVRPTUM0NVVyMS9LRmVlT0JZWlZGRDEwd1FY?=
 =?utf-8?B?Qy9LZlRhWk83R1d4QlVwWTZPeXF6TTF2bzAvREQvQlZnTzN3UUJMRGNNVFJa?=
 =?utf-8?B?TytCeGg1RSs2eksrUC9XV1p5SnMrNzNvb01MNk5xdDM3WkpXZXY0TFRFNERT?=
 =?utf-8?B?VkdpMVB0NW1nTzI5MGdoeXVWNXFORGNzbEtTMUszUHo5V2g5N3pZSUx5TWEz?=
 =?utf-8?B?dTVSZzhmdkRCTyt0SGlrOVpBY2RVbXFYbzNOckxKb1g3S3N1K25sSjkrcGh2?=
 =?utf-8?B?S1FSUER2VCtXUEdUN1YxMlhMMzFDV0lWNk0xYUtBUDRrc2VnbzczWkROa2dR?=
 =?utf-8?B?OUZYSDB4NWo5T2xsZVRFbXZ1L2FuTE93M3E1R2dSa0diVmRNRW5CczZqUW96?=
 =?utf-8?B?amgrUjNaVUs0OVhXUFNjMlk2USttQ2NPNjRlam9yaWFvRzFNanhiWXI5QWVN?=
 =?utf-8?B?UmtsVjZVY1Q1UlRibHdKRDlTb0hxeE1oUEcxaUNDY1JWMklnN1hpR0ltZ05m?=
 =?utf-8?B?NDFCL3Y5cUxKNmUxOUsrN3dEM2UydmR4YkxHd2dFWGdTT1BLQkpFK1VEOE1Z?=
 =?utf-8?B?ZjhsNnZMVlNQVDMrSVVhMS9VUkZmNmJJa0Mxd3NML04wOS84cXhKRVdlMk03?=
 =?utf-8?B?ZmxQaWE1dmtQM3VsWFFaeFFTaXpYam92SlNYK2pTMWpiZkI2QktTenNTL1R4?=
 =?utf-8?B?TzVESm1LVWp0UGxocDkwRHMzMXBadGVSbVArNmxJWmQ4ZHZXN1hZdjRNaWpR?=
 =?utf-8?B?Tk9KL3FhT2FXb09meE5RbDZMTHZjajUxZVdmZDhLd2t2Y0w1ZTZhclV6ek5W?=
 =?utf-8?B?QW9za1FqRlhoZEJRU3h1cFFzajB3YWUrZDNFME83WGRkd081ZitSdkNQLy83?=
 =?utf-8?B?ZGFXWFNGWjQxS3lrTXA1RjBVTlhCaEpGVzg3WVRTWjhIbStxdXlGNzBQMndv?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vChNYEc9e7bnd1szmBxDz0el5pDOLNYpzoj4id0/ow0z+kuZHB/uxsidGGPVYPdG19Pp1/Fmf/C52oifPiKDs+Zd3fDUYTaCz2cMEVkgB/aPQrxeh65aQsQYK+xx+zK1mniA+eOydG6LvCeVBzXY/fmQVdYRFieMfZeUCtjxtisIKDwg7/aQHu3AC7gsLGBqw7AgFRl9iG2WdlODs6GWbsvjCRmy9VK2Xvc+Oj4kxe0VskbGdClN0XP9LoVyV9DBRDG2048K9436gCfYBYso2IpMDP8405IAbzr1coAVF/CDis8Xn+7+kmBNOw9PsvcJYG87SBRlb826yo1tnOmfAMPfKtIa9wwRQl7csAwNfPGMYDK11nFJcbHtZ4xodtQlVSuFGHFlOjmqoqbLQ3lvfOM1M2XQh7CrACznPxDu2Aaq+Czav61ERx4xzcSbcwvM0n5PFvAXpp8vcms+MHp6OUDJUw8+iAM63NQ0qa4M6wxbN8vxoyUVb4U/Tc4PYg+09GnE67rhe2OZdVKragc/CIJY+fGXwWEfzyUv/oOGLfCRQQFhCDYUy1Ud+lr9m1W/moWn0OnivklgmeTlaWn6Glam0b1QHXDfPxRRGhinhI8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da24ecd-3f05-4e6f-5855-08dd868bef0c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 19:36:15.2661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4xoDZN4tYgToYMTfZEzOfHhqL3XccSYUY7hl+qbr3y7aQ+u8iUC6ZfJ+1Tw6ZlwRsETJZvVARqUNmLrR71lNk7CQXpbI9DNHUXkn//NFGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5756
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504280157
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE1OCBTYWx0ZWRfX5yjR0odK9RL+ l+839H1BJSnOvmaARDI8GnPd0ZF40ThHxAzzFeNwJTtKKHXf7VViQb4DHkGcNPgY0ko3XJN0iK8 fjv71s9aGY1RN5Et7+YyYDWf3OBMAnXJtUNR+L6DlSBWbFUZQS3NYsTFy5dun9JxwqTIbzbUwqJ
 sPq162YnlvFCo/dMVKWUVojsi92IxOmQveqbk2OdrAMxWsl2SgMRDFDMFCq+gz+uLwWqKbdXh0g zhiyCPv5PBjA4IkobpxZst42QM5713yR6eWEP0iyZgM8O+poo/7Nv2MkQEGcLXMUhecf3h6TGPp IMfXk4CJnmrpP2xRqh8JjeOKhzLctdBKSVUFN2ZxvQxWFML3tEEvyumGLTqwGGeU3YySO8uU8hg AFuX6tfh
X-Proofpoint-GUID: x7GPQb4G-D43TcMlz_dvPHS4FypSvGhz
X-Proofpoint-ORIG-GUID: x7GPQb4G-D43TcMlz_dvPHS4FypSvGhz

> diff --git a/drivers/platform/x86/lenovo-wmi-helpers.c b/drivers/platform/x86/lenovo-wmi-helpers.c
> new file mode 100644
> index 000000000000..2df0408e2a9c
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Legion WMI helpers driver.
> + *
> + * The Lenovo Legion WMI interface is broken up into multiple GUID interfaces
> + * that require cross-references between GUID's for some functionality. The
> + * "Custom Mode" interface is a legacy interface for managing and displaying
> + * CPU & GPU power and hwmon settings and readings. The "Other Mode" interface
> + * is a modern interface that replaces or extends the "Custom Mode" interface
> + * methods. The "Gamezone" interface adds advanced features such as fan
> + * profiles and overclocking. The "Lighting" interface adds control of various
> + * status lights related to different hardware components. Each of these
> + * drivers uses a common procedure to get data from the WMI interface,
> + * enumerated here.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */

add a space after "Copyright" before "(C)".
Copyright (C) 2025

> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-helpers.h"
> +
> +/**
> + * lwmi_dev_evaluate_int() - Helper function for calling WMI methods that
> + * return an integer.
> + * @wdev: Pointer to the WMI device to be called.
> + * @instance: Instance of the called method.
> + * @method_id: WMI Method ID for the method to be called.
> + * @buf: Buffer of all arguments for the given method_id.
> + * @size: Length of the buffer.
> + * @retval: Pointer for the return value to be assigned.
> + *
> + * Calls wmidev_valuate_method for Lenovo WMI devices that return an ACPI
> + * integer. Validates the return value type and assigns the value to the
> + * retval pointer.

assuming you meant to refer to wmidev_evaluate_method, the real function
typo wmidev_valuate_method -> wmidev_evaluate_method

> + *
> + * Return: 0 on success, or an error code.
> + */
> +int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
> +			  unsigned char *buf, size_t size, u32 *retval)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *ret_obj __free(kfree) = NULL;
> +	struct acpi_buffer input = { size, buf };
> +	acpi_status status;
> +
> +	status = wmidev_evaluate_method(wdev, instance, method_id, &input,
> +					&output);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	if (retval) {
> +		ret_obj = output.pointer;
> +		if (!ret_obj)
> +			return -ENODATA;
> +
> +		if (ret_obj->type != ACPI_TYPE_INTEGER)
> +			return -ENXIO;
> +
> +		*retval = (u32)ret_obj->integer.value;
> +	}
> +	return 0;
> +};

Thanks,
Alok
