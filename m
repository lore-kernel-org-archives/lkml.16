Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFBC190477
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355142; cv=fail; b=nHTCU8KX7+RX/Vy9N0rwBq9V8jou723nU4XN7j3+It0DazoAmgs8SpRa017akDyzXYKVh+WEWByctYVsAVqCY78V65zYQKH8YAb1Yl94uGFogfdj/7XGZ/U2/Er4uLzmCvSEZAAEISbS8L03tjLXWDQLZ8ANVlCwJOm4jMJLFdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355142; c=relaxed/simple;
	bh=iECYAIwHyxUeZxoR6JkkldnXA/exO4BXC/wjAYlHtj0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qAQZ34fIApCJyXA2avVrChcnQ8TXapv3WpHz0I8ozLtBhwe7oPZkVWpHYemm7VTlTRQXU4PgBHwCFMnh4aD9t5/IGtxrnz2xEpTYpMX685wZtbFp959fmI5CAs1CZhiQ2pVy+yU6J7Sdw2bf6fmjIL1jyO4TPycXRMm/f1zr1tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k9YYlhg4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H04oCTMX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k9YYlhg4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H04oCTMX"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611MeBe007988;
	Tue, 1 Jul 2025 07:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NkDD1D5rKyyJsIgR0sFF3V5hKp7nCwDmCBkB+As2zpg=; b=
	k9YYlhg4NLuWZgQHbQnjQKfw3D16vn4obLYEEAAaTLBlD8ENLV/+gJ+KUYeKdBwo
	FbhhxiEBxH325cTudBJw7coqbw0p79o9toYKrbpciKZ740dTvPz65tDEb+U5zB0n
	UUw/PvYkKwdl/4WuyyNd725Kw9adHTzHHWgoLj7NxvfS/6IaDHZtVR0SEehqwY/u
	mS3mTgMCawfwwe8TnQCwS38n1TbHhVdgVqZdYCmmpg85PVmblETuWQnXw/k7MF9d
	hgEibtegbHIw0wd8vUqXvUt/MED25YxRXy7az5sIMdOGATQ1qV9sHmkhdCVT9hkb
	+ZpxJX2fop0KoyWGPWTOIg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766c4u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 07:32:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5616oIAV017566;
	Tue, 1 Jul 2025 07:32:13 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1e5593-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 07:32:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npKUuki8DFcZ3/zpkYa86BAehznjbzShjKaruj9Zrw7B/VrHhxGJINx5QeZYkHfLsdTVMHn6TBCWTrqEXxCV4AYcY0qVbKevLllnGS3FnG/pRDAj8YXP9A+xDP+c/h3f9L7HKTd/cMcWpa9CCqFlppVm7DEDTWpEotfAoc3TTxCQQ0X97erU0ohSJ2kmF6XawboCPObe57UpnoLKMJp6O5i+3iN3WpSH/KH6qfCrbNtndItjlNvIKylewiTzMTV6zSa6e6pRqfei/v3ol9e/BKOaMbrWnYbylHj0pI0i+t6AwzRlseofm17B1IxP1YIWwcANu9M2QFhHVjaoQE0bTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkDD1D5rKyyJsIgR0sFF3V5hKp7nCwDmCBkB+As2zpg=;
 b=bfgc9o3EMjrC/A3cwSPGlqZhsxkdtzLxSpJ/i67NtiExjAUEFShsrL5ei9I6oIWF8Gu2Xh9wiiZeKzDLRzReYaZJOg2tUaiftk9PFfuhAPVs0bWwzlwPBXa559N2qu4L3uMFIblh4Ae6n7oBxlJJZ/9EuNINwqM1ldcDn3voPviONjgxEcgQOYP/e+SHfosDp6IZUVQI2iFCR6+okfo3cH8VIqvyQBZAVd0cglEFhYvAxsPbaZ+LHOUz2sImrKebKvuqzczd9EqCivse36hamdaSlSV48xfiZ3bS5jb3EKT31374GilPiokpKku+O6Q9CAnCOxywNUuu8FQQtS04iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkDD1D5rKyyJsIgR0sFF3V5hKp7nCwDmCBkB+As2zpg=;
 b=H04oCTMXrUSybdO9/Yxq+GxXkX0w+PO68pgE3dAVUqZocyOY3dZ3amGRyN7VDhkAddkDA1zd3mZVmdNI1NXGkUDS/UylnQ4PluiBWXxLujTsrTfGmeD1b/Sce8Vwe1afdHvSP/8AE4oK0ke5cSrb/6qAMDPed15Ya+2zFjri82M=
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f) by CH3PR10MB7332.namprd10.prod.outlook.com
 (2603:10b6:610:130::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 07:32:11 +0000
Received: from DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a]) by DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 ([fe80::2072:7ae5:a89:c52a%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 07:32:11 +0000
Message-ID: <b66b4e76-f07d-4067-8c99-55600bbd2556@oracle.com>
Date: Tue, 1 Jul 2025 00:32:09 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Chen, Yu C" <yu.c.chen@intel.com>, Jirka Hladky <jhladky@redhat.com>,
        Abhigyan ghosh <zscript.team.zs@gmail.com>
Cc: linux-kernel@vger.kernel.org, Chen Yu <yu.chen.surf@foxmail.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
 <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
 <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
 <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:510:23c::6) To DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d1f)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF5ADB4ADFC:EE_|CH3PR10MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: dcdd1c42-a917-4506-18a7-08ddb8716434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEVmSW42dEkxNG1ZaFZDeWlKeUNqcWc3bXFWQ3dmZzVYVzJzckhLMGhNMnRh?=
 =?utf-8?B?Y0gwall5akIvc0FIT09sRGlLZEpPQzRnN2tWSkhwb0JnT1hwUWNMWW1DTnNm?=
 =?utf-8?B?WjZHNzJDWWNMd0FEenB6TWRUbWhJNzVyUklyMkZTTUY3UitpQnptOGN3a2ts?=
 =?utf-8?B?ME92c256c2VvVlBpVFA2SHNEQ2JCVGtHbjF4c0VReTVEb3Z3UllBdnVkU2dD?=
 =?utf-8?B?TzFQS203b29ubVFWNXpvd2tWajhkUS94ZHNrY1VUOUJIUlY4WGQ2Z2x6bkVV?=
 =?utf-8?B?b3RPU3lPdllMdElUenJDRkZQWEk3aHNTd0c0dnlEUEYyUkhZZk9hWXprNk9W?=
 =?utf-8?B?R3NzRWFpc202Wks3SWFscWZEcURQOWh1NW9VdTJhSENMTTlaVEtmQzJXSFlV?=
 =?utf-8?B?MTJYV2NkcUYxbDlONnBya21hS1RDbCtBNm12VzExLzd0a25GYSs0c0JUZ2F6?=
 =?utf-8?B?cjcvZHFScHdpTlg0c2tzUkZQV0EzZEM4dlg4ZEIyTDJRVHhMeUxycy9iS0li?=
 =?utf-8?B?T2Z6OGhSemhWQ1ZxWERKc3FHS0FPdTlSSDNCRld0NEtrVzRuTm5wWWliUDF3?=
 =?utf-8?B?UW80dndtUzRuZTlJdmVnTmhIRk9UMTJrYmwwVW5CaGJwdVhyY2lFWVlWSmRH?=
 =?utf-8?B?RnBHSWM3SXBaaEs5bndDY1BET1R4bmFMRzI5c0swWVB4cVZjK0NSdzJZVnZa?=
 =?utf-8?B?cDF5Mzc3T0xJNHdEc0tpcE1qVHdyNVl2QVJVUDdNOXBZbG5DNnJ0eEVxMzV1?=
 =?utf-8?B?bmlTWmdDZGtVeHVaN09NbEtwaUhKOVduU0liTGozZ3dzVURyRGdBQTdweXB5?=
 =?utf-8?B?YnZocy9MM244TENnaDlPd2llVVRqRWgzSDZEVWZFclBmTmZXTDYzUEZjZWZB?=
 =?utf-8?B?Rk9EZndqNVNiUVY5Qms5UU1BTENlSkZqZ0UxSVR2QUxwM3h2VWk4MHlkK3VV?=
 =?utf-8?B?WGJxUGdhRnFtYUhob1hSZU51SHhGZnN1QnVXRVlwZHdNVldqRTBiaERtZFUv?=
 =?utf-8?B?b0t1QVNhSmZZSmJnWmdWNFFQcjVXcnUrTUtXV3Z4UkxreGR3SWtCdG1xbWE1?=
 =?utf-8?B?OWdyK3BrNXZ6QkQzL0NyakhSRmlqWTdOOWUzSHlEeDZrNWdCYUpIOTNibzk4?=
 =?utf-8?B?YkJYR2Z1VitOTlQvRVQ4dTRacmo4dkgxZzJQOHdHbkdnUDRROFF5c0xYd25u?=
 =?utf-8?B?eGVZRkVidXdaL2VYekxEVEdOY2d2enZIM1hVZmltRHU3WFRBK3JTczZLTGpr?=
 =?utf-8?B?Y1d2cTFRT0xaaG1NZ1FjekY3RG0zY2JyUGF2S1V4dC9veFpYTlBWTnVtbGQv?=
 =?utf-8?B?d2syQzlnRWdoVzN3Nk9lbHM2VXJLMlBLSXNWa2d3K3NqNjhRY2NsNEVUK2U2?=
 =?utf-8?B?ay81SnVqQUhvM25yenFWd2Q4bkdCb2xmYy93MDB5RXZ6QklyZm9OZzZSdWZz?=
 =?utf-8?B?cnE5cGFJS29mNkVOMW1BbWZsK095cDNCNGtYQjQ1RGUvc0RlSDJMdktiNnJk?=
 =?utf-8?B?MDBBS1lWUnVoTVhhS3ZLNVRocUJQV214WENadnIzMXo0WS9mOG9NL2hpSGpO?=
 =?utf-8?B?VDVPNC9jN1JlMEwzZnBJYnBrOUViUlZndng5K00ramRaN2NtbGJaeGdscllJ?=
 =?utf-8?B?NmljY3pHLzhPRHptMmdwaTVVdm9lOUM5bjRlbjNzRDZxTXpxNFE1WTU5ZDRK?=
 =?utf-8?B?ZDdSaHlXckw4UkRkNjArM3ROY0xsdE0rWHlDeS8zTCtpVUVpUll3bUhNb25T?=
 =?utf-8?B?cVZ1dTZjQm15bUh4c3A3a3pENmMwcEhRWTk4Ni9OSS9uUnRtRmNjRXVsZm9B?=
 =?utf-8?B?dU82aGhyZ2hwNjV3NUJhQThFSHMvMTB4bUk3RW9kWEc3dnVqdEpVVVNkR2Iv?=
 =?utf-8?B?aVRKYkdKSmJsUnpkVzJaWktGMEthM3N3ZVB4VnluMmNnNHJtZjhRSUQrT1Jy?=
 =?utf-8?Q?tQki8fehnMU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF5ADB4ADFC.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MC8wNHFsR3NjZ1MyVnRjblBOZ0c3UnExMXZ1U1JNOUV2bDdSMzgxVXhCeS9E?=
 =?utf-8?B?enZyOURtNTVKa2dTQXoxd2pFN1RSSURqWkxhTVpQQkc3SWpzY2Y2MVZoZWdr?=
 =?utf-8?B?MlBOSW91dG53V2xtNUlxejNNZTd4bDlKMytXdXFKYnRyRnd2VC9ic1J1b2xi?=
 =?utf-8?B?UFprK2Z3WnB2MUhPNlRpUE1NT2dZYXdGaDM1R1ZaZ1ZDeEFCTTBRanN2cXpx?=
 =?utf-8?B?RmNQdGo0YzFhaFB2SWNEN0lnU2hmKzhrSjQ4aW1IdURyeW5NamZBcEgxQTNH?=
 =?utf-8?B?KzZKR0hWUzZRS3l0T2lrTjIvMHJpUHY1UjcxV0R1U216blpLdGRhekhIRFBh?=
 =?utf-8?B?NlJNcnFOOWhZK2lKb1A4QTBZbkY3bDgyamxPTTBzZThFZktYbjdOaGVuengv?=
 =?utf-8?B?OVVOSkhGcHFURnBockMwK2lFRkJkZldvdUxEbnJVbzIrUDlnb1QyeHJYY0hr?=
 =?utf-8?B?eEw3NTh6M3A0RDV1RHBQbVNmSWdVMmJHZG5CMUE4Qm1RUXFKZ05zT0Y0UE5Q?=
 =?utf-8?B?RCtkKzBnYnpmcWFrZFFEVlZNRzB5Vng2Qm1tLzVzOUM2TnFiZG03VURSVkdT?=
 =?utf-8?B?ZDZtYlh4QitFSjhPTUR6dDd1SHprNTlOTjhlNmM1clNkNGRmMVIzNFAzOCth?=
 =?utf-8?B?NWllT1Z4Y21RZTBNVFJ3UDFidDFMa3RRS1ZsdzFvL1RaVmVKd1hFT0o5d3p1?=
 =?utf-8?B?WW54M3RoS1pwaHRBWHE4NmZjcnlqbUk3Smw5WGx1aG5CT0lTY2RQRDN2UU5l?=
 =?utf-8?B?b2NUam1HVklPQjlhYUVrM2o4bllUdVoxNHdmSHFnTnpHZUVkczhDckZoV2lC?=
 =?utf-8?B?Z3ZSajFaaExyTHdocG5SVVNQMlc5eXR1WDQ1UkxuWnVGVUsxUWdrNXJxN2kv?=
 =?utf-8?B?UnRpVFovdzdici85S2JwR3RkbEZQSGR3MlBXd2xaZ3dPc1lVYitCS0hVa1R2?=
 =?utf-8?B?NzErMjNtZGxnTXoza3R0MVBrUVJjeXRFL1IrZHI5WE5yM0JPUVk3bUttbnNG?=
 =?utf-8?B?V0MrZE15QUU3MkVRbEdUN0g0bmhYaERhMkl5VjVMeHdFNnBGSFNmaGhzU2Vh?=
 =?utf-8?B?bXpXazdTQVVKL1BiNzE3Y3Rjc1l2MUdsZDRORExrR2tlWVNJak1xc2JFcUpu?=
 =?utf-8?B?bm01UmdyU3QvbEllWCt3NHJQUHpHNkFSV0VmR0JuVkJKa2Nkc010Wk1md2JG?=
 =?utf-8?B?aXVhTjRXTkd0VGx6aGdIc201ODV2blFTSFdFbGM3Zzg0V1diZUVIN0VCbXBy?=
 =?utf-8?B?d0RwbDQvN2d3MUVxaVNJQnkxZm4yRXQ1OERXVFY1Y2lmclhYWVRkODdCQlpT?=
 =?utf-8?B?cGQ3QkdBVUJrWEIvbXh3aFVLbUpQYXBpUlFNNkpHRStBb1g0T3RUanh0b3pa?=
 =?utf-8?B?eHh1Y01QelhCa0ZWbmpxTnFzQWNXbmhvT3BFZnNTWldFdzFENklydkJQVjdE?=
 =?utf-8?B?Z1ZhamNYUWwxWTc4OXJxaHVWdDZHSEZ4eWpVUUc5VDVtem0xODdwZVNtY1A1?=
 =?utf-8?B?OUlaNWZ1VGZudHFZdmtHS1J3cjV0L05PMzZUeko2R2QyeXFZN3RQemJmZjNj?=
 =?utf-8?B?M3pBYnVjY3hod3htT21ud2JUc0ZkNU1VVi85WVdDbVNkNVg5OHFOekRoUVgz?=
 =?utf-8?B?VWRhMjgvb204cnlCZXdCbVdwQUN6Mm5jRnllYnVwb1BiWFdTYjEvc0N2Nk1G?=
 =?utf-8?B?SUROcmxaeTNsQkJBMDhxSEQrNnlFbWE4Q3hEUm41OVNjTUxJZTRBS2Q4ckdn?=
 =?utf-8?B?NHE0SVM4UHRlV0ZYeGRBb1krcVdYSkp1TEFoOFE2NVV5VnR2bFd1QUV2QzFz?=
 =?utf-8?B?ZEx3SnRMWi9Ia2pndEFxbXplMzB6MUpMbVllcDFCRmtCSnA1TkxZcnQ0UGdy?=
 =?utf-8?B?bUl0MkMvVDgzSG91bzM4MWx2WU1vY0I5Tm0wR01ldlA1RHhCQXllS2hlTnhT?=
 =?utf-8?B?OXUvRU45dGc2aENKSm5MYUhRek9qM3JNYmhCR2tQM0ZkcE1nNmcrejM4dVhl?=
 =?utf-8?B?ekxsY24zMlBQQ0l2Q3JrMkJidWp4YlJwbFA5U2ZqeGpXTmkvUEozdXRwNmln?=
 =?utf-8?B?RWpTUUpLb1AwSW9jdDd3NTJlRDZ5ak5rZEh1dW1lVXRrNUtjS1U3bDF2MHYy?=
 =?utf-8?Q?51lNiTwG+2luJYUSuf8Y3j9VL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ajgsCOIDF3NqhVSBekfbTHXL7PLWlRHT0dRxrwbP9OWj7EH+OIMW6rRjOvDzr4pP7QuuHaQoE9ejWiRz1BgNK3e/aTLnZTqsQT2gaZfv27N1LL4B/ATBxhs+BdJBTtp3+0svgkBXKGxpT/TDf30inwlIi2iaCawiH79QiPnjbdXSLeBFDUP0ZOoy6pFpdALVWtTNXDCj/O2M+YZUOPVHkhZFBZt02PoPWaM2gHZ4EAHnLWJXjKh05QG+fQ9Ti545dcmkETysBcvClyM9TcyK+RxBPFmGlY7uXiwubuXcJD4TnM/EndDaS+Jc86akDaphAeFhi0yLr6tG6Bi2h8GKCjKvvudfCw77kJcWdfsPsctA1YB6KqC78S4a3Fmfns6BA/hlaE2C0Yt26UXwUSr0Ba75y7IUR1MXxgYw3q6bmw1DXs2Efj966e5zy6yu8V4WG3KavhBfFn1wxD/RbMZSwcez2LwsRmBkHejFn8bkhJcreZNr/OYoSxn09Mukzqh+e2fCZ9IG0QNdZB2XN+DlMCfM08j77n6W3heleltiOHxtIwKPFwz5+pV44pGLG2ATvRqQTjXS2mh11n7xrRJUZUMmV+Uk9NC5ilXnEtO+9aw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdd1c42-a917-4506-18a7-08ddb8716434
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF5ADB4ADFC.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:32:11.2847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rt0qN5Bkwey46nj28DaMl+viOsusUD27IH0QVfVdkH8xG0Vnqj6wEp+4CBS6dQKVhyMQKHkPWruBRcLhhtlHsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7332
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010042
X-Proofpoint-GUID: 6dV9BH4iBpL1BLGyiuOxxk5nDcPnj6Q0
X-Proofpoint-ORIG-GUID: 6dV9BH4iBpL1BLGyiuOxxk5nDcPnj6Q0
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=68638efe b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=YguLmxJTUwsarVcvxfgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13216
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MiBTYWx0ZWRfX2eiHKShd/ClP QweUIinbDyDRsQftFedB0dO0rO27slYGVfUnjHrqNtRiK8ONfgfTSkhebnJfXQScT65CE5BQ3EE F6JRC7AfFB4xZYZJ/rekmcyOtYIg/RJaCRFctpRcat2oVw806nYq+ZCpRUdCoBsE+yjlULjB2V5
 e6WqlfRVohO9gAVDObYH1Yr9OKelfttg3zGGhODX2/xdhwvbBe11+SJswUpU2McFzS53XUfFlFj E3h7XgYOFjyVK8TlP/dtyKVcjDCJChHCtGhN6m+01EGsBuIkhEYdY7I4x0u0XgRSeYDXbye3gvB CZTbAWt2HxTV6n8u00qpdp6DU5siOcYQ4fsKNrtx5DHY8+nK07slYocv1npeyBfmi9yxjZiZItw
 oG/UqOW3CWVFWKQci616f/KKw0GFQ8tAhSycIe/ejeVuAqpb9gGaTLZPGWxDzJvHnrTMkD78

Hi Chenyu,

On 6/27/25 00:33, Chen, Yu C wrote:
> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
>> Hi Jirka,
>>
>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
>>> Hi Chen and all,
>>>
>>> we have now verified that the following commit causes a kernel panic
>>> discussed in this thread:
>>>
>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
>>>
>>> Reverting this commit fixes the issue.
>>>
>>> I'm happy to help debug this further or test a proposed fix.
>>>
>>
>> Thanks very much for your report, it seems that there is a
>> race condition that when the swap task candidate was chosen,
>> but its mm_struct get released due to task exit, then later
>> when doing the task swaping, the p->mm is NULL which caused
>> the problem:
>>
>> CPU0                                   CPU1
>> :
>> ...
>> task_numa_migrate
>>    task_numa_find_cpu
>>     task_numa_compare
>>       # a normal task p is chosen
>>       env->best_task = p
>>
>>                                         # p exit:
>>                                         exit_signals(p);
>>                                            p->flags |= PF_EXITING
>>                                         exit_mm
>>                                            p->mm = NULL;
>>
>>     migrate_swap_stop
>>       __migrate_swap_task((arg->src_task, arg->dst_cpu)
>>        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>>
>> Could you please help check if the following debug patch works,
> 
> Attached the patch:
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 8988d38d46a3..82fc966b390c 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
>  {
>      __schedstat_inc(p->stats.numa_task_swapped);
>      count_vm_numa_event(NUMA_TASK_SWAP);
> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +    if (unlikely(!p->mm)) {

I am starting to wonder if we should keep this check and add a big fat warning
like  "there is a bug here, please report it!" rather than brick the kernel.
A kernel panic, for sure, helps catch bugs like this more than a line of dmesg,
so it's a tradeoff I guess. What do you think?


Thanks,
Libo   

> +        trace_printk("!! (%d %s) flags=%lx\n", p->pid, p->comm,
> +                p->flags);
> +    } else {
> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +    }
> 
>      if (task_on_rq_queued(p)) {
>          struct rq *src_rq, *dst_rq;

