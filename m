Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87CA8F5E;
	Tue,  6 May 2025 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535437; cv=fail; b=SbrXy0uJmgEpYRW3zF2qMFnanR3ExXOc/+6xHHL3mmTK3ZR6K3TEuF8yXxQ3C0rpmRyRMeqxhBuAe8qB8xiolUPG6I6N1zJ7gIJRVK7L65ngbjbe/OQW3XeRIiUEhdDWYozpAp8HH7Lo0oS4QM1IlQtJL2f/AiWv3tS6z+AAalQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535437; c=relaxed/simple;
	bh=imAPphjrEOOYOEQ/VfgBZv/F15W2i2GCX943eGuSqzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KM2MXgWOzN8qQZnzrv1YswYtiMNN/xr5hNn/KJ3dppT0WUSm8Y24qCANKwjrNO3G9uNbBNJxzg6f3a+KRNvUUxT7t8Af0MGhKR4Vfu8hPdnIJW43UpK5bpZWijLwrfILP3z/Euq7xNPm7a3IvIA4CfMk+a647F2brc41/rmEyDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eDz/Ow38; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tz1jbMKl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eDz/Ow38";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tz1jbMKl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546CbOaO023860;
	Tue, 6 May 2025 12:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=b5oL10Btjj0HcHhcs3saMkREzmA/Z7cbEK33zlLIVfU=; b=
	eDz/Ow386LeG+4PVOf8/zKPb0UAbOFxW6U2vtE3bl/GxBi4bpPr+VStMPVYtgdyC
	WT/jkt9i7tIn3yPMyDZUap7aIa076ryvNKnMOFzDBQgD+reY6PQIV7Q2DhYJFWFU
	gKD02+fVT/h5KpVpcvnRme0fQBqOwyXE0Km67+F0xbhUgj1qadNsFTSZsUH5l3fH
	grM2twdEgLXcMDhqbzeNFt8+ziSOJr8jIsr9ENB2Kb/Bydq47bP0M/qrXiARz662
	IpJly+YePyW0q5WQLxc5mTDlIxtXh+DZS3NNrmDN5xoj9sMboiX0olYrVrX8sSQg
	Z2qG0+z8RObd+yf+20WLaw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fjk8g0ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 12:43:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546BlcEP035473;
	Tue, 6 May 2025 12:43:35 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kf6jx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 12:43:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kL6Sl/oi+BImN1AyVlZ/saFsjx6z713208d9fuqKSxYNlQo8LLZuBHsc0Oxz17wEgtcI5jY8ui/a2oQYYj41hHNDA5p7FwfzOAd0wyY9Q5ipYmM0ZuI0t1adhXHv5Nr3Aox3rXtGj7aTI4K/4mvM9ZPaIz9yzppIcbBUM27Tmx6skJAMC+LU0vE2+a0x1Ry1lG93HoRoHtp7hsP7dEJ12P+M0aM2RWRe8xQwn2He2tw1wiA1UJlwQ/OBUsb9Uds28a686wOTf/UzMSIAs+cSXWbp4sOV3w7wQYXZ3NDZJ/0hvD2rSV7qy4GoPG4+fNtPHDucVg0AUgO0t9+e9fJZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5oL10Btjj0HcHhcs3saMkREzmA/Z7cbEK33zlLIVfU=;
 b=hYARqSgMmFEqcGDYfyC4PN3aZVF3/A2qf/kl+rzweKKxFeyX9AJFx8RYlmRcjUwUrJ6lEQIp7ITaQt/r2O3SWMT2dNPfyk6ee3Q4G6y4hjzoDFVzZ/czp0YWd4bdvJg4zUd5IeCqn4aYqe0lr3FzKg4h5iw8OjmIYPt/3wuHwe7lW14+rK/PjyvrSTcerfg+tnscgCDUtifMTUZM39kgJ7OaoZ8QB8NiQGjfTf849flGveVGK2rQqRGWz4CIyQssxaZeZbFKb3w9SNVVyr31T7EWqbJelrGjfVlb8h9G8/IRJAU5dr7hBukWMLJYyTpNRwrOM8UNRCVUREYzo+RYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5oL10Btjj0HcHhcs3saMkREzmA/Z7cbEK33zlLIVfU=;
 b=tz1jbMKlNkIrpOOMRAhITuWG3i+M2a4wZHHYLqnfKWwy/vNLLsSSKo0D+VXn+NyQ0aRvvw4x00oYGBWyjYaP6zQcfiAmWnNrEkiQFiMjkSFoK2XLRt7dioL6zK1fFI21SA3d65lni7Izi8oY7SZi5ycbDncIWXpOh3w47N3m6SA=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DS0PR10MB6727.namprd10.prod.outlook.com (2603:10b6:8:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Tue, 6 May
 2025 12:43:28 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 12:43:27 +0000
Message-ID: <eafeb07f-84e9-48c3-92f2-cbfef8adba5e@oracle.com>
Date: Tue, 6 May 2025 18:13:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] platform/x86: Add lenovo-wmi-* driver
 Documentation
To: Armin Wolf <W_Armin@gmx.de>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
        Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
        Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        "Cody T . -H . Chiu" <codyit@gmail.com>,
        John Martens <johnfanv2@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
 <20250505010659.1450984-2-derekjohn.clark@gmail.com>
 <b23a54c9-ca99-4db9-a105-c0f3c000850d@oracle.com>
 <a566e56b-c5f5-456e-92e3-b0887b0f6b62@gmx.de>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <a566e56b-c5f5-456e-92e3-b0887b0f6b62@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DS0PR10MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 86faf2fa-03ea-44bd-ac8d-08dd8c9b9909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2xzSUc4SzhVMWlDTkZkWmY4VFdzL25PWFRjbzdiSjBvcFh3aWk4NGNLMjdt?=
 =?utf-8?B?TURLdDI1a3R3TU9hVU54Sm0zTElPbmZSNnowMTM3WkhueE8zazhUWUxlKzhh?=
 =?utf-8?B?dWtPa3JXU1BweHIxRlNvd2Y0eHU4MjFvVGJZd2RlMS9ydzBSanZPcFEwVldP?=
 =?utf-8?B?c0pMaHJ4dHRoQ0NySU10MlFIUGdnRWwzYVBibk9RbWVWQUl6QzNkeEljMHhU?=
 =?utf-8?B?bjNxNmlxY1hGcWpzRXd3a0ZiU2xTTFVDMGVrTTJvSkszdDV4S3VQWWh1eUV1?=
 =?utf-8?B?dGN1WCtBeTJodUlCblNVOEZkRHhGQjhCc3R6VFVFc050SGlkTnJPRGR5cGdo?=
 =?utf-8?B?OCtxdHdYRy8zZFVKOVpiV2E2dnNaUDZ3a0tBWFBZNHZaMUxEMWVnN25jSVkx?=
 =?utf-8?B?ZHd0bklFeW90SFQxSGN3am5lUWZkZUZFUWg3NWVuSURvb29JUVgrVGlTUC9a?=
 =?utf-8?B?WVUzMUttQWg5ZCs3eGFIMzQ4YjZLdys5aTNXcXVMaGJuOTk4aDRlV0xuTHVp?=
 =?utf-8?B?dDl5NU5ySmtMbEY3SDFtNUxpcWYyTUhobTZQT1N5ZWF5MnhRZ0NJTXJFQnpi?=
 =?utf-8?B?UlR2R1JsTU9zTjZNcE14MkR1djRDUml6M0JROHFaTnlWSmY2Y0F4R2FHamVL?=
 =?utf-8?B?WVFZdzdDSTYzV3FYeFYyY2FJRDJMbG5IVmM1TzdTcVFpUThPdWVxUmNRY2JI?=
 =?utf-8?B?aG1TYkJLcnNVNGYvT21vVU1wQ1ljd1llNndOV1pKendROWlNamxKSEEzdU1M?=
 =?utf-8?B?RGM5UzFWQkhYR3JDTE1EUnU3MmxwTmdvdTBHRWpJTkNndnQ1dkFqclBCeGlS?=
 =?utf-8?B?K3NqM2ZYc0lsL1Z1RGYxeFNNVkxxeW5Ib2ZUZlNHclNwQU5aWlMyWlZRdGo1?=
 =?utf-8?B?Y2kwamVDbHo3OFV0QjNhU056SG1zRGlDVllxbXlhUWxpdnh1a1ZScGlZNjVl?=
 =?utf-8?B?NmhJeVBIYXBuZlZJNFEvUXpta1piem1xVUlnSktRVWJuSEo3RUkwcXlnclUv?=
 =?utf-8?B?M3h6YmZMVWQydjU0QVRsNXVEeWR5OWQ5RkRzN1daa2EzL2VTSlVvZU5NN1Bo?=
 =?utf-8?B?TGZjMjZQUUN2T2pjUHBxZ1VCaUFieEpKOE5GTnVycWUrMy9TNnlkVHdCR2lF?=
 =?utf-8?B?QnpqdktSM200enRHRm0yeXREd0xRc0lkUWNQci9JaitHVGF1UWk3bUN3RDhz?=
 =?utf-8?B?blE0NUxxL3djQWw2NEZPZ1VheEpJTnU1bTNNMXdCOS9xWkZwejg4RjZpV1Rt?=
 =?utf-8?B?RlJYZ2t5VmMxNXBOdWJ1dkVyQlFJc21UTEVjeC9zbkRmeWZrbkc5ZVdFOTZJ?=
 =?utf-8?B?Nk12d0U2MVBLM3JyKzZKS0xMcytLWHhjVWRpLzlnWUNNb3F3N1JhZXJPdk5i?=
 =?utf-8?B?bXRwNVR3eGRWcjBUYnBDRERqczZVbFJjMkpJNUQwRFcxQzl0c3liTUNHUFpI?=
 =?utf-8?B?RTRxWVlzZkhQSUVyUHB5aXZYb21HUDloZWtmeHBLVzI4U2pzU2ZWMUV5cUo3?=
 =?utf-8?B?MWhnZk1qZ1krUzdzSVNZL29VRUJjeDlrZUx0aEJUMUVjd2FiTkppRnVTdG0r?=
 =?utf-8?B?dU1lWlp6TGpqaGgwK3JrY21YaWQ1QTRtQjRKb2JtQkc4SUprWjFQNXQ0bldo?=
 =?utf-8?B?citmT2lSb0FxbU9BbTAxdWgraHdtZDVBL1IzVEtSZVVSR05rNEcxTzBxR0dG?=
 =?utf-8?B?NCtPWDI2UFJoWUJ4RXp2S3NyWWxzUk1FL1ZwTlY4L2xXb2E5VEhNU1Vacld3?=
 =?utf-8?B?VDU3TzFXUzJDRGNabzVkbkpFRmN5UGoyTjZPMTlwbTRmUzYxNG9OcWdqYVdJ?=
 =?utf-8?B?Qlp2Z0puUVJUNWJkKy8vYkNoQlhHRjBxMFlIWWVFamY1RVNNWlRNalZYM2ZR?=
 =?utf-8?B?elY4Rnh1WS9pcG1GM1ZuTmM1ZWNZM2RTbjJKK2JQSlprZGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXVreUhveitNdSs0MWR4ZUFTa3JVZWIrWVRQd3NGTmp4aTY5Z3AzaU95Tjl6?=
 =?utf-8?B?N3FtWTg3aURNRVNmeDRGenN3cHpHeEZLemliUW56YjIwMUZ4WXNtYUNEZFlp?=
 =?utf-8?B?UWo2MUJOY043ZWlCMXdVSWVOR3JOQ2FOMk1xN1NKell2VC9YL1JqaE1aRHBq?=
 =?utf-8?B?a1pMbk40WmNHUnZlZ1NWR2JBVDN1V0NTWTNhd0huLytlSktXQ2dObXdWaGND?=
 =?utf-8?B?clJYY2o3VzA1QlVoQm4rUGVRQlJSR2VXV3VEdE1XWUh3ek9pMkNDZXU2YmZQ?=
 =?utf-8?B?MkdSUFphOEF2bkE1T0ZxYm5QQnZLU2FVR3lRemhxNnR0VktCUXBDWnRSaFpk?=
 =?utf-8?B?dlBUVEk4eHBRY1l1QnF0U1k3ckRMVFNZcktPTjRwVXJrejg2dTRTLzN1UW5y?=
 =?utf-8?B?ayswRG40L2NGTWQ1MHBxVmZCRHhlTWcxSDlocXNMV2RjTlRlaFpjVWlpMTVu?=
 =?utf-8?B?cno1R3kvNjFFZnRrRXQ2REFiY3NmNjlySnFHRW1IVFZvZCtyRzFRTGRaclZ6?=
 =?utf-8?B?Y2JIdkdJZXpKandPZ0tlOXVYV2U2dEtiUXB6bGw3cGZ1YllmajBVWk5OYkxS?=
 =?utf-8?B?ciswQkQxd2cwUnJNbHRIeW9jM25RT0JJUUdZRmpFUEJXMnNxdDY4Skp2ZVFP?=
 =?utf-8?B?RkNvL1o5cnM3ZTlBN1pXK0MyODRrTUJFRHJZWldWcE9EeVk1YlNjaWVtd2s4?=
 =?utf-8?B?ZG96cEN1R2VlTFVoRFlkb3dHUzNMc1NSVEpITEdXampHM0doYjBBZUVvVHVy?=
 =?utf-8?B?YitzajhtbzJKN2hubE5jQTcvMDNBSFM0b1BJdGM2QVRPaHp4R2JFeDVNdjBO?=
 =?utf-8?B?eUtCM2krczgvZy9RVUNoQWthYit6NkhLS1VwRllKbGNvelloUE4vUXpMM0FT?=
 =?utf-8?B?dmFvbVRGNWJ0VC9qTjJqODdYSSttaTFkd2oxTlNhd0Z5UWh6UUZGUTBjZmJh?=
 =?utf-8?B?cW94cktPVFRlQ04rblVnSThQaXhVRDhwOGRWYjAwYzVhQzI0VUsrNkh3amtN?=
 =?utf-8?B?b0E5dWlhcXl4bGJVSXQ2N2hRNENBSlpMeEFRMy8zenI3RCs4eDMzTDNCRFlu?=
 =?utf-8?B?NWFUOXNkSzR0RWIwM2E4akR5VUs3Q0o0M3ZoR3IzVzdnOTVNSWxXY0dPVzY0?=
 =?utf-8?B?cFNTdUh2ZUlBMlBoWlV0VEZTNlNHYlNGTkpSUHpUWVNHdXJ1Y296VG1TOVRZ?=
 =?utf-8?B?UnZrRCtuU3VXc1huMDFmR3pFSFJMWi94VUV5Z0pUZ3NESEV0VjJBZ05wRCtO?=
 =?utf-8?B?TDBXQkRzWTFiaFdoeG52dW5hUjVFSzBNTFZIZ2xzWDhhWno4SG9yQlU4RmRX?=
 =?utf-8?B?aC9Za1hraDVhbE0yUW5DaXJpZHBrSDFCbWdXZnFMMlc0OFhzS3Fqb0pYSlpC?=
 =?utf-8?B?aWNNSTU3NTJaWng1YVNIQUlsZWhqcVc1WVVsekt2WUF5SFRxZ085YTlOT1lL?=
 =?utf-8?B?b3MzVTEvT2NRWUx0RlFOd1B0Q245UDJjZkkvb1FaL253S3hOb3lmejc3eGxC?=
 =?utf-8?B?dFJBWEN6MDVybXhJWENVVmdIU01HelMxYkJrc2VEOXFPQmhIUS9kMjhmMUZV?=
 =?utf-8?B?bDdRYWxITXg4UENWNE1zWnM1UFFSRklQZzZXOW00YVh5RUliKyt1VzcvL05i?=
 =?utf-8?B?andQNWRoVFd0enFidEM4c0JFYmNHOXM3VkdvWklhNkxiWmNLanY1MFBMWXVQ?=
 =?utf-8?B?NjJFK0hmWEdmclY0NmRJd1VWU01VbTdTYjVsQXF3ZE4wZC82OHVPeEhVWStX?=
 =?utf-8?B?Skp1ZFdVMmJYWXo1cnEyOHhBNkUzMXQ1aVEyS2REWXdITUtNdTdISVd5QVJt?=
 =?utf-8?B?UzB1QTBld1ppbzVvN0VwYWJpdVRkTm5xN0cxZU85eDd0ZE5CaUx2TTdjdnhR?=
 =?utf-8?B?aU1xVTc5MWQ1TldQODlOVWVyNkVTVVpqYjU3V2FCaHFYUVErZ3lxZXhGN3BU?=
 =?utf-8?B?T1F3TDdHdDJBUXEyZGJOQkk1QUJCdW1LMkhwUkFtV2ZJRkcwUnpleHBaTTdh?=
 =?utf-8?B?bitkU1NrZkRBUHJlSlhjMGpBeVhmMTRub0FEbytXK2pGUWJEc0tRbTNwdDU3?=
 =?utf-8?B?K0Uva3pBengwc0VWSlExR00zRW5yWVZScjFqcVZQS2VhcTQ2RHl2UjdZNjlj?=
 =?utf-8?B?ZENGa2ozSkUzQSt1L1gxQlJKTmhieVlWajV0L2N5RmR4WllmMDNocEJ1Q01E?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U9RQvqdqaQuOG1dJphMfLaSeLJTItcWqpTWZcX7QTxiQRr7dnJz+yhOzdNgRpuHEmTQ+a2h9fSHJSVPpqQ13MlWptDcyjHZvw1dslr9k+ktWDv7CbyVb9xCGuQWBkNYsLrlfqerVIKv9NpZ7qQePwzM4P1hbNaeOiXjDuI2JAkSS/JPtOCpb3IEmYLRadTBhsWXoRhSlEfGYBYjt7vdwaYMRwmRpeVl27E4wfGD3ftfzGfc6IvX2c1POLIIbi4KLSgNs1LToIwUlKWSYNIKQ8+SGqHJjh1RJQezbel7zZmBKTVkApvDDOMjbLuhBSp+6GzX9HXbmvqW3EoH0Z3RzlHPWkF1a1tAm6VDgb/KfsasJlC1hPQwzKs0tyZYxWl8KU8GBO5MdlzZ/9eRFSy/ztzWvljZ6R1ZKWddzAeIZ6/N+okdr/nqnSDDowPk+OzugRaOA+5GK4tn8UnYyDHjouSGhgnNdfwX5s8RSLGetXW8I+A+7EVzw7dceTWI1/RMRnbvywqjUYbNvCXZ5W09fwaXn10f9ZuWSRvTHuGPA7uJZ4VxEy2fQuxr3RZ5Qrh91JgbK3OBNrCeQzQvsVNT0eCg+sBYFkPKcrmIwz15jBxk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86faf2fa-03ea-44bd-ac8d-08dd8c9b9909
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:43:27.7834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPK1jzZi0IX1qf7tHPWYitNLSTxFvjYLfpfAFj45CvkldHYjlH5S1OlGcf32esnQVVGhVbDegsv+nHU/YHjoooIcxwmzuaH5Iprx2AVA7LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6727
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060122
X-Proofpoint-GUID: ST8set4Usi7-aS_hnIR4l0hHtjZCn_2k
X-Proofpoint-ORIG-GUID: ST8set4Usi7-aS_hnIR4l0hHtjZCn_2k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMiBTYWx0ZWRfX+R4n0fgC0ntC AXwGqijwYfzRKjENamyjgl5fj5VOUJG9LFQ73cLNQvIV8dIwYSWAfWbKGi7bvcFEBgDFToxzB+V iWhFSuUWd+vFrtXlIF+SSfFTSbVndZKgDTFPwVA69CZU4TX+O2x+AQo2T1CvI2xoiWUSUmk6P9p
 ROM/vlbocXCHyfE7QaYlG4hd7+v7hugvJ7DZuwSXkdZ8Rv32r0T48kRscsDrrrlq1ecVAarsQdN xr11yxSCsCkqOV1u/Enz2FeLTXf6raXhIbSZDC7d9LUD08wyS++3wrC5zAJImhMpaYCrBxilkAW Icp3/40G3oCAV2zSL+4J2+a4ldZx4mjP7CP80aZyjqk/Da/3Av1kwlxEXrPnGwG8xCEHzIiNmu/
 9iu+0Y2NNs2a+YSEgiI2PEnPoMUjf53hEw/pSlRgkJB1s3vwe421YhFYUvaJwvQLNJCnzFwj
X-Authority-Analysis: v=2.4 cv=f8tIBPyM c=1 sm=1 tr=0 ts=681a03f9 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=iuh0FfJ369IWqpQ_ZOAA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13130



On 06-05-2025 17:42, Armin Wolf wrote:
>> Thremal -> Thermal
> 
> Those spelling mistakes where already present inside the original MOF 
> description of the WMI object, so we have to ignore
> them in order to not distort the original interface description.

sound good.

Thanks,
Alok
