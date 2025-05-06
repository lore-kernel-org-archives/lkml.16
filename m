Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D0927A473;
	Tue,  6 May 2025 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531620; cv=fail; b=rwfEL9cW9Y3mHVy87aVfP8h48MGab40ADNK8WmMVwIwLb77AEWRK74/n1vI5oJPWu7tgnGcyJf9i8UMhn+Ckzp5PEyVQftaS3/g6WhBStDQoE/Fiw33lCzemg54VxwXQz5cfrAnsWUaf2zP/kU1L4f4dbGBc/EZa3SF+O4my7uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531620; c=relaxed/simple;
	bh=gRpKccFih4/r18/4EN5rhzdpfMNCxFPhlFXkNf9P8GQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ht+F50BCC1lb9YE14gMEBVuBdSxE+yrjBWL5so7EtztMsF1GfS/36kz22XSlyJb9HwRXUZMYgaS1g6b9evaoPqDXI2EC44V+/CTTTmcBHgh+Y5FIabxZs4Kv8JBFDIwQGYAMrQX4ecV+ol3NhIAVPqvSm4Al6v8xycXOmGBdLWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k38ZbpKO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cnq2686t; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k38ZbpKO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cnq2686t"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546BbuUQ018542;
	Tue, 6 May 2025 11:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zvY6IBUGFOdZrJcv/Qe7+m5iRKXwBEhSrm7mGPNpeeM=; b=
	k38ZbpKOhFc48YqjkHcmNTt5Cx3sFg4bd+YUjU1rS0pdkg4PsmsLYpbsyOm8dxTZ
	+gBZxYQ+cjCpCOt0+0Mbfa/pdvYlCXXFMhEFoZeafFpnIngqJGNyQ80shwZ/JBOh
	IziAgEe0/hzsxkN+mK6LpHsUDNPIXKxS99hJoCUpv0QTRhsor45wT3a/Z6Mu4HpP
	HUWKCRBhRKHdmXWVf6Z62qc7EFgS4fP5a22RTESg/qA55Zaj/BMhuWKZhd8nSSpt
	bU1I24B2d+VCX5L2xo9gAmw3P82HGLrdhceXaqD9b6RO9puVwTKr5zeoDopb4H/p
	MA+hJuoaj3n2EXGw/VQUYQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fhq6004a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 11:39:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5469tAl3025094;
	Tue, 6 May 2025 11:39:56 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010007.outbound.protection.outlook.com [40.93.20.7])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kf4hnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 11:39:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHsX3P1X/7ITJTSE0hLgvRa+/pO7Ml4sofCOhE0mJwc20yx668gY0NHZJWWZPUQJagMf2qwX+EfvxnM7L0VfzaAP8Jkn60Y75NCvxwFPMBO+m+8NA4VTzmKXUmqZikN8qpIuCeyN//AC+Rh3iqVb5NEhpIHKBmIi9OZzf1b/FrrZ/y6Bi+5znXe6s5uD0WEJUfYwO5Crv8VjuNgxywBRhIOrhtyAuj81qQc0xKC6yairYuU6C7COCUEXdCXATJu17LUSSZLJPqxdd8ZA0cQi8E55wEEy0NNGsxJeKiQeY3y8qJ0v5nmarmX3MuvbUjVbbpm2KAKZENQTEfoBKvd+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvY6IBUGFOdZrJcv/Qe7+m5iRKXwBEhSrm7mGPNpeeM=;
 b=c3u364ftN18Svvv4zDzM8icVVWnYZwrtw2NTr5DC6wAkz4119bJatUVwDDO0PIvWrgzM718rBIti3XbSY+UBWayTqMiKNpHti+xnscdbeyScatIl/ej2A4o7dDBrwDviuYtALRhSWQgQ66kXbeH6gZ/Cf+4JBFzukkfrhrMf+7Ig8u1xucgWg9+xzjou50aiQGaAlSN6C4V1RSYTakM/lvrGc+mXq4VVv1qdCdA9cGTy8+pkMEsYxuLT+1B6q3wvY6ZIfdGVnTXNniJrKIL352UtuxROPioLDjbf/nrfRAdLokaf60o3FOue+a1yYaq2d5ojm7UUTVHUSc9pT2IS4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvY6IBUGFOdZrJcv/Qe7+m5iRKXwBEhSrm7mGPNpeeM=;
 b=cnq2686t7o7pMa9aH51ZH/4TW+oD0RysVeI1rSsT1cBjYpIUI7W7Ake43Oq4FoQ1jjpCZi0ja1T5gUUYpbya2R8qqETd81pd0HopSxzrAiYKkWjjkLBUCtm1Bv+Q27COcezx7A47bHd1XfoTmNt6r8VNk1mSZLpX+hMjrP+jCG0=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by PH8PR10MB6454.namprd10.prod.outlook.com (2603:10b6:510:22e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 6 May
 2025 11:39:49 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 11:39:49 +0000
Message-ID: <0372e6c7-b919-4fbd-a0a6-710f903b2db8@oracle.com>
Date: Tue, 6 May 2025 17:09:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] platform/x86: Add Lenovo WMI Events Driver
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
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
 <20250505010659.1450984-4-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250505010659.1450984-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::19) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|PH8PR10MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: cf36ad5e-0bb4-4580-1508-08dd8c92b535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHRRY1FzUjEveHdOcklrcUpkUldBWWhhZnhUVnFXMldBaVJBMzltcktaai9G?=
 =?utf-8?B?SVVLYXZpbUhiWk1TOVFOYkN4M044eVRzZmdxOHRVeXRrbEJmMXRKS3BSMzlP?=
 =?utf-8?B?bU5PREZuU1liME5XRUNEenkwRHpoS1V1QVl5bXgzZUVzZG9DRGVxUm1VdHIz?=
 =?utf-8?B?TXl6ZkllY0lielRUejBGc1ZCajBWQkd6MW9VT2l2YnFHWmRtUjdISkJOQThC?=
 =?utf-8?B?UTJUUU1FK3FCeldTbFRnSm5iRGpIWkg2L2g3Z2VTclJ6VkFaSkc1SFVaSkRT?=
 =?utf-8?B?aFp6alNnMmhjNEpnM2JQRFE3Qm9ZNE90UlV4dzE3ZEw1SytKdlNUZWVqZlZt?=
 =?utf-8?B?RU5tM2xsZUNnNG83bDFYZGs0bWtMTjh3Z2djd1RKVHpFdWlOWXZqNkNDSm1P?=
 =?utf-8?B?NjhRc1Yrb3RKT0FqTkhoL2I4UWhrZXlya2hma3A4TDV0cWJsbnIwU0c5RlBW?=
 =?utf-8?B?TC9sRUgxVzdoUzF5TEhkTWcza2EwZmJBYUpvYkt0RGFnbG0xVFpScHIvd0Yx?=
 =?utf-8?B?MHAxZ2t6R05NeUFwbGc1MUN6Uy92bHpKQ3dPbTF3a3orQzdrNjlHdkJXMnlu?=
 =?utf-8?B?dkw4L2FoZGdyYWNIZC93OTZzKy9zTHRoTHZkYTAzRkRad0pDZ29ZcFgyZDZP?=
 =?utf-8?B?UjZCTDhQbVhiN2FxWE1OeFhqd1ZOWnRtbCtVaWRlNWNTcCtuWXBsS0lvYUpZ?=
 =?utf-8?B?djh0UldZbWFoZUVGN0hNZ3U3cHVIbEM4STVuOHQ0MG1ROTFsQkhxSXVIT2JC?=
 =?utf-8?B?S29lcmNYMzJDTUp6SlZuMjR5OHV2dkt1Um5EaTl0TWNaaXFvdVQ3RnI4ZSsx?=
 =?utf-8?B?WFNadlhhMkM2cmx6RHZ0amVrUUZCaEtETlR4M3FIU1Nab1JnVEY4aExHSXRX?=
 =?utf-8?B?Y3Z6OFRHSDVrUzRpR0d6QjY1Zk00UDFNUG84SDg0MjNzTnBqbGg2MXlhRHFL?=
 =?utf-8?B?UjVTZCt5Z055Um0zTWhxMlkrVGVzMEFCc1pla0kxSW12aThZT3pIYVlUNGxT?=
 =?utf-8?B?NUZnYjBYOGNYZFcxcWZPQXlyNEpFbzRzRlRhVXQvL0VLWkxrMU9NTVUzeE9Z?=
 =?utf-8?B?Z2hTVHArREgwb3BibTBONnJuVUt4SXp4NGF0RzNDSGFkZCtUS0FnTEFieElo?=
 =?utf-8?B?dCs2ZWZsbnBZUlE4ekRsa2pOQTcyNW1QQkFPZXNYUEEzTFFIRE8zcUp2c0o4?=
 =?utf-8?B?a3FQR1I3VUJZS3k0RGFCbExLMDZlQ1phQzcrdDNBVnA2REMxZTJOdmhqZm9Y?=
 =?utf-8?B?Nlp3Wjl0NkhIZXdNL0ZGaWozdWdLNi9ObVB2d21FaDZQL3JRMTd0cUJlMVU4?=
 =?utf-8?B?T2RXMSswSjlqM1lOVmlCbnJXeVBrNG5EM1dzZEpWUTNRWDNtVkpTbXViU1FF?=
 =?utf-8?B?c2ZnVnVZTzI4ZlpDeXR2Y1MyeHgrdTZVVXc2TWkwakcranVUelZvTlE2ZS9K?=
 =?utf-8?B?VFY3cmU1aDRWdmlha0syOW8rdVlaYUFyY25WWm1sdUpVUm1aV0tPbk5nRXBa?=
 =?utf-8?B?S0IxTUVPSW1qSW5rbnFmdmJHQUhweU5HTHBmajVCcmJvQ01zYzlaMnV1akc1?=
 =?utf-8?B?OGV2ekJsTElxWFpwVGllaGZUL2lDVENFZmdTeHlqSDdZOXkrYW1Ca1dIR1h2?=
 =?utf-8?B?dGdhNmJXUXJVT0lvR0p0STk3V2h5ZE50OWdnTGhCL3ZjSVdhbURJTjUzZ1ht?=
 =?utf-8?B?KzFvYWNNb1FySldiNXBpVnB6ZG9NYi91Nk9JWXNxeXpqVlp5NE1rdWM2Y0xO?=
 =?utf-8?B?dDd1dlhUM0JCdWxxMHkvYjZZb1R3d0Fxb0pNeTNwWWVWM29GZEdGbG5IM3NI?=
 =?utf-8?B?MEV4TWZBTlJiLzB4cVErZEJMS0paVkxjMVZTQmUwUXpjaTZxNDRZcVNvRVh0?=
 =?utf-8?B?a09sYnhkdWtDbjJxZ3V3WldhUzRVZTZISUtNSnExN0pGR3ZWSElqOGdUSEZp?=
 =?utf-8?Q?sbLjAEkqw+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3dOR1JuU1VoM2Jqc1ltc2pVamxpMkd4WVlYMGRQRkVrbnIzRkFVcVZDcUtO?=
 =?utf-8?B?TUozeU1iNHBYdFBTeTBGTS9WOHRueXlEQmx2RGZPNmtpNDI4cXpWc0xWWHpX?=
 =?utf-8?B?KytZMHBEMFdIOFQ3UmFPc2xMd0VGSHk1YWk1aWZaamJMcGZ6eUhVVXkweG9s?=
 =?utf-8?B?NlFVbVFsK3RnWFRjcTVtRjU2MUE4NWRRWHZMWm8waEVMSEM0a2ZjRTJHYnlS?=
 =?utf-8?B?UzVwd2F6MUtZME5xUWhybVI2cXlNNFV1UUVUb0hWVTd2L2FnVU5QSGNZOUJm?=
 =?utf-8?B?Y1RsQXMxQURLMncrcEVXL0YxaXJ5b3JQdXh1QzJVTEZEUVRBYlZ6UUlCajVh?=
 =?utf-8?B?cVIwQUtFZTA4WHpEalAvMitUaW13R2N5eW5OUHZIcy9XMmNSMWpMSHRPTCtD?=
 =?utf-8?B?Z2VqNzJiK3o3ZVljNXlCZWwzTWZOZUdOcENFRC8rK0F1TVBOd0Rhanh5Y3ho?=
 =?utf-8?B?RklPcmpuTjBmOUVCUUxYcUxZQUY3bHJGTDBYWjNaczE2VksxekZ4REtCVU0w?=
 =?utf-8?B?STcrWncraEx3bENEQ3Q5YjhxWFUzc1RWbGNud1dvYVExMWl5VEVsKzh1MDIy?=
 =?utf-8?B?RHpRZXB0NnNOUGpjOFdVa0RuQjNmR293Vnp2ckljdTZqcDhHb1Z2Z3VsYWU0?=
 =?utf-8?B?QVI0Yys4ajJLdlJuZXdjcTR4eDlUOHFHRDhBTkhwS1FDNHQ0dXY0djFzMklj?=
 =?utf-8?B?c1FSTGpoS3pvdDVhZGJTSnR0aFhUSGppckpOcy9BVVI4NkwwL1AzOVVTaHlE?=
 =?utf-8?B?R2R0TzUycDJWSHpuTndVTGRYQkJRU1RaTzdDUTZXZ2ZvUWErN0hqWGdxT1A3?=
 =?utf-8?B?YitPaUM4QnA5VUJSQnIxdXlEc0xFVmZqUUFWbjZwV3E4L0dqQnBRcCtIaUJt?=
 =?utf-8?B?N3poME5lbkRCNWVoQmFtUWVWeFF3R1NpV0VzNWxDRGRMRlBTQWNLTCtRazRX?=
 =?utf-8?B?RGdIck5acWQ4TWhWQlFwTlBuSkdZU3ZiYmt2dFMvK2cyUWJTWFZBTDJrR2l0?=
 =?utf-8?B?M1p5S0JuellESVN6bTcveWl3Z2hsaXR3UFhuQktqV0t0M044Vk9EZUN0dVBr?=
 =?utf-8?B?elg1VHp6TUxaY2NjcEN2M05zSGxVVFFLYVFPcEp4SDViM1JQUFZUR0FnSHRa?=
 =?utf-8?B?eWVkSWZlc3IvZlpzL0NhNFdSK0FncHBGcWhIQUtzRlZ3U3h4Vm53VGF4QktR?=
 =?utf-8?B?Ri9HT1k4YktxVmMyQ1hXM05ZZ2ZtZWtZMjZKSkNiZUtrSUdMWnlnY0huTUFS?=
 =?utf-8?B?MTljRmxNNnBHZUVKMkxEZTg1TzRua0U3OWU4UXlOVjc3QWUzY0VUdGU5a2Qv?=
 =?utf-8?B?YmhJdnJVTVJxd0s0WFMrcW9wN0Y3cGxwKzRkZDZSKzUrdU5NNUQ2bHByM1Bq?=
 =?utf-8?B?cDV5eVJoSVo5WE1vL0N1aEV5d1NTSVVSVDJyVU4vRUwwSkVYcVpnRUxxb3dZ?=
 =?utf-8?B?dFhSSUUyU3p0azh1bzVKOEQya2VXNE15T2xwaVFNQjdHOCtEc0NBdGF4Z3Fl?=
 =?utf-8?B?TEZvYTJDM21OQjh6eEM5ck9Kb2NQWVNKUDNVSFl6bndwVytueW5mdkpGY3Ba?=
 =?utf-8?B?STRHUnM1eEVmZkljckdnQXpZOVVMT00ycVZKVUxwTStBYkIzUVljNWJvbHpi?=
 =?utf-8?B?L0xzS1hFWFBLV1Zsdks2eXNpaUpIdmJJZ20wZUJIblQ1VEFmQlFiRUIzYXVU?=
 =?utf-8?B?TmNYQUJOTkRLQmYyV2ovdmpFZjhZNWd2cHNERGplV0tZbk5QUTNSZUlTQ1Ar?=
 =?utf-8?B?Zk5lZHNVNklUM3lnY3R2dWo0aTRIWWxTTUFLLzQwSU9WdVpvUUFMWnh0RmV3?=
 =?utf-8?B?ZFlBa0ZCUjNsb3RZR2hCci9nOGNXaWFSeFMxOEpwelkvSExuUklRV1BGckVn?=
 =?utf-8?B?bkozV3JpeGx2cXZLUlNJZjNCbnZ4Wkt6RVcvaGx2OXgvV21wbWxERlFTS2lM?=
 =?utf-8?B?Nzd0Q05URm1yVHpuL3dmQmRTaE8ybFdBQ1h5RGVVblYvZHNkUkdkQjBWbmZQ?=
 =?utf-8?B?ZzRweGFlL3FkZDQ1clZPL2swZzBVZHFCMGg5ZGxNS1JwZXFMVS9mS1l4cXhi?=
 =?utf-8?B?ams1NGMrNXNJTTl4VEZvT2tvNGRPYitZMlFmWWtsSWFBZWs1VDlqSE55Y0RR?=
 =?utf-8?B?V29xMnZQdFBvS2JHcUpaWG9HMW15bGhxSEhQb2syZ0NPYm9CdHdBd0dZTFdl?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zAD7VxGlsvlJtVruC12g2VGhve4SW7Bg0DIUy5gH6XCJbvLKKUCJ/49v13NKFkStYjuqg99qSsdCj1QfFA8522I7eB1qQqzlgvtGSSK23HBAQxxByLevt8fVgZbdxwLIQOtf7uJYP516V4gLKWH+LUf7muJa8lLGTIt5MlLRXj0g/IDdm1e8EM8v5BlQge4MSzU361SBSaNipAsQNF36pVtvbJ6Xi4O3DlCCugWmc+PK9LBLCqGAFRnZwvkwzNuNs5udYrQXi+B+ScjKwINbsK/ArsWzPTouXmbWDHzUpzV1MEhgTZLNsNHxEINENQrZQAClYiLs6G5UMnrI4mzPe15mAY1W4XyTcBA9wd3So24JNHbJX6wI9MfVz3t7bOWT71baaBmMsArt5GrFaY6Zjwx6J80GxIKulEXvDuXAVYW+OT6zAPmPa1gxXjrmzsT/Nvy1pMEySUu8z/pD6MKyc7oXoDUt1nChZT0XWMZY/mSsG9jWWH66YffHm6dXR02ix8OUKOI3qFM8rrXnioeZ40UsVk18fczNLvzihFVDn64e01befSsxHCyXuH4yK/++j6JFpPIFMr9RxH6NoUBIjnnEFwYRgk1aMmaMY6t5Dls=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf36ad5e-0bb4-4580-1508-08dd8c92b535
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:39:49.2841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAVzuTJLRMxwXtQnUy79Vu5oXBpAYqxsk2YRjkaLPA0lPdkQHKDFGrqPA2s8FozWu5x2GzExfLQFF24WuUe9ZyImpeFt/7Jlcj1hv05VycQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6454
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060112
X-Proofpoint-ORIG-GUID: GkyMPXYyZTgnAOjk4fIkAn1QsEZXgLTt
X-Authority-Analysis: v=2.4 cv=O9o5vA9W c=1 sm=1 tr=0 ts=6819f50e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=zd2uoN0lAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=eEzg6oYXyFUPSmqocMsA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13129
X-Proofpoint-GUID: GkyMPXYyZTgnAOjk4fIkAn1QsEZXgLTt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExMSBTYWx0ZWRfXwauEraGIdwI0 bbjBglCuOYnqrRC+mWfnq7G90AQU+Wkog5s301g1fkIyLK9CEXMblf0wgGyqAKTbFsr+mkYCeJL Od6Dda+D1sFW3PJkz9m+C/byGLPwBaG+wemQ0yv1bV1en1Leo1G5tOElIViSIP8Bj7rZf8vpJwZ
 MoqTqlmrffQ8gstUd72z28s+NLgaCfjTJ5E2CYx4EBybk8FZ7BcJkJeFxXoZo1QAE3TST0uuNK1 RmZcyAQ/QlUZPrklqRSO0T2Xi5rrWRoTOqv04x/CBDWKX0Q3MgmfB3ACLCRNkFoJdOmLqSo95Qt eyOrZywaULWuFn8ch6hZn6To3O+zNUTCS/MEH0TMixdAVqwfelk+Eiv6+ak9M76kciPqKS8C4Ua
 CYqgQKbjKPPt2GbyI/lV5Rvv7qedT/jS83afxEFQGElPqzCOVEngUGMSC1TDQI+aiTEZf/0B



On 05-05-2025 06:36, Derek J. Clark wrote:
> Adds lenovo-wmi-events driver. The events driver is designed as a
> general entrypoint for all Lenovo WMI Events. It acts as a notification
> chain head that will process event data and pass it on to registered
> drivers so they can react to the events.
> 
> Currently only the Gamezone interface Thermal Mode Event GUID is
> implemented in this driver. It is documented in the Gamezone
> documentation.
> ---
> v8: No change
> v7:
>   - Fix typos
> v6:
>   - Fix typos and rewordings to ensure consistancy in function description
>     text.
> v5:
>   - Fixes from v4 review.
> v4:
>    - Remove the Thermal Mode Event GUID from Gamezone and add this driver.
> Suggested-by: Armin Wolf<W_Armin@gmx.de>
> Reviewed-by: Armin Wolf<W_Armin@gmx.de>
> Reviewed-by: Mario Limonciello<mario.limonciello@amd.com>
> Signed-off-by: Derek J. Clark<derekjohn.clark@gmail.com>
> ---



Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks,
Alok

