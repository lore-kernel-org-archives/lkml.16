Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53B11F4CAC;
	Thu, 15 May 2025 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325274; cv=fail; b=cVBkNUpp5BG1rz4Q9MxX0SrdnDLQIUrOIHjg9xp5Xg+Q2f5pDWOAJCZ0F/TdE0WFW+K6+F5XTD045On+wwp+Owiue1XvmPbpko5T9wlhzxyAh4mbRlLLeFKAnbCql1rfmth4XgaiHwaOMg1jkl+z82Qc0/4Y1s/NL/mwbqDq0Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325274; c=relaxed/simple;
	bh=ByaQg42o9V1WtUvpmD9i1NlGyORkkf8UpDV9l2pVguA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ntk+y+TSeQYnHOK1zOfSrFK7ZtPIydf6MI8L2d5i0xeKv66dPe3M8Fg5/FUI7tfEJXtuR4/GITtt9a1DGtsGU3pM5qi9DSfT4MtxQHhdbKLyosZxRAENc5Opdxa9zM6HVyDIK+SBEEm8uLPAVHBUGvhwFdPUYqNpkraGlZ/NqlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ozHsa/LA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wHOkDoPl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ozHsa/LA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wHOkDoPl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1oIG022187;
	Thu, 15 May 2025 16:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Ji6i1U5Tph/PYBCROY84riGSKGgLtOfxuKYb3qtBwrY=; b=
	ozHsa/LAoNe6uxLIrj1Epabmw3wVjqACApreg1BfOT8w4tHu7lC9u/fj3uFn6016
	gEeuzKLd4e40ofEbOCeJY2ufodRJIsYFWXGiEZjeoi+82hxDlAPOfywS6Kvy7hIr
	/e1dkcqcn4jsxr48LGoRt1EChEACRYn98Frwi8UGYhoCiF0vnY0I7RGsb3ASekKH
	KzQPKe+PmnhNln74DmAzv4ZRvXdzF8Dk8fnjE26LFo8fQ+8r3/zC/rBRBytB8RWD
	sCeAV1jYZhaaFlRHhVnyfXVgCTTEDWXZcAUV3bzzYoZkwr48BkgoBdAV/ydGlVV3
	Jb/c9GJ8kVnzkzNMmfwiig==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcm4hkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 16:06:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FG1O4N016177;
	Thu, 15 May 2025 16:06:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mc350tps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 16:06:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGf4Xxv9U+XSagLpzqumPoaUSf1vK+9d5SjukEUVCrjMNvpj4XjVFh/wBrDye+keUuxqzEi3J9Q0QtqaCtIkFg0d2nuRhog88N0bY7q9NA9giLTubXqHl0wcuCT5pJG13eX19wZohTr6jtHCl0Z+o4A34FtVTT4VCknrFG8TrZWc3O5nRoUSd43PcNfWop80/yX6YYfTS/mFGQpDE5s7cFfHErT/1TATY2KQAK6E3K4//Sgmu9gjof0hePnDmQuZN0Q0C/agfR01DJvcLfsxxE/wcAXAwtxtEspuB/kXqlUL65JexUq7ZgE4hct7cCycnau0K50RFwU02h+9hBUUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ji6i1U5Tph/PYBCROY84riGSKGgLtOfxuKYb3qtBwrY=;
 b=qKV4EG+MiQUiS6fhzyNQ2zlcOGUUiA1xq3n0ZxLMQW02cKa8BtL6Qr4BBDm/tRNpg5XahajrfYSFTe5bSM1J3GzxIQHSPJu1T1liU2EBTFAzV8Pd3xRq8i+HEl7cc32q7bACXSUWXkPBwcf7LnZhKhvoWf0eFAV77VDlNMgoydb/y7EOIw2JdNc5noepJE5iEYiMT88Q7b/PsENOCWsRlm8r8oLaObZNvUYije8xB7uyf49XHL7aEJsfhqR23zWWswFAsXE8vsuvCWrlpH2Ay4KM5icPVvW4rNyUWxlOtd+RT2qH1gZVpN8Vs/sGiWdCY5Clbhi8QkyoBlXuCaD6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ji6i1U5Tph/PYBCROY84riGSKGgLtOfxuKYb3qtBwrY=;
 b=wHOkDoPlFO8SJZaTcYo9DmXGPZE/YiPz49N4iRTVpAOha4JYtqXIXCEHvzO1PB9BCzCnubFaAsP/cv5wMNaUFguAtjGCYdnccWcldHoqMNSZW4MZRKae12e6YhCGp7Q/Wqpbz1HSL1P53EU4+Tr2fSvxx/WwUGibCaPU/5Dra24=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4860.namprd10.prod.outlook.com (2603:10b6:610:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 16:06:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 16:06:48 +0000
Date: Thu, 15 May 2025 17:06:46 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
        linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
        riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e6d037-1b0d-47bf-dc55-08dd93ca7f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVFtRGVIaFkxWTA1OXZHOGVhMUtobGNVVGNEY2pPQUtOYSsrMXFMVldBMWJ6?=
 =?utf-8?B?MHlHR0NyY3B4R3NiMXd4c3padTBKSTFXRGRIcWQ4bGtHclVTYUtsNnRlMEx6?=
 =?utf-8?B?NXNnR1FuemVuZHNxVDVoY2FYSDJPOEswRkV5djJsZm9Zb1VBYTFkZ21lZTB1?=
 =?utf-8?B?aFVIVTlkYnpRaFRTTFdpNnpGeUFxYS9oNE5KUkFKTkF5NlEyNzVxYk9qM0pn?=
 =?utf-8?B?Y3AzcnF2SUU0VGZEM3RMcWc4T1Q4N3dhOStOUFpRcDU3R2RoR1RsOEQ2T0pv?=
 =?utf-8?B?NUZYbkV2RnZ0L1FoSXVKYms0NWlEd3h1M1Q2MjFwaTljcjV0YVBpeUlxancv?=
 =?utf-8?B?UVlPQUpQczJqS1B3cHNjRjY4OW82enIzUnRnMG5icndNWWs0MEVqWXF6bCtn?=
 =?utf-8?B?NWs3Y09OQ3k2VmxQck01Z3IwSStQLzBmM0NsVnJuTWJ2SGxuRXBCaHJHN2gx?=
 =?utf-8?B?OUsxOFM1aDhuR2ZYMkpkVnhqTm4wS0EybUFpRmI0VlordFpFZUpiUzBaR0lQ?=
 =?utf-8?B?VkFRK1JYWlhIVTVEZEdDSW5IS1ZUcXp3UXROTU12Q2pLZU1OdzM0ZTkreGNK?=
 =?utf-8?B?NU1LK295d1BmNkxidnJmd0RqV3ZLM0ltRlVBSlA2QjZjQnNmN0FXSlh4SHZS?=
 =?utf-8?B?Y1kzVCs1bzduN3FvcEFBNGU4NTU3NnJpaXo3N044b2VHTzNXaTFRT0huY0Yw?=
 =?utf-8?B?WC85UktJY05uRUM2TkplR1JTQjdMQTRpM3dwRjVKOUd0b0hvZ0haQjZFcms3?=
 =?utf-8?B?NFdmZWtwL1JmRjVaZFRrSkpESnVhUDVhRmU1Z3JYWjlBdUlTQU5GbnVMTXhO?=
 =?utf-8?B?RzZ3THI1YU9CQXlxZzlHWlBzOVpIVm9DMUlaOUJXTHBKalUyZWRKNzhNUjN2?=
 =?utf-8?B?eGJ2MUNtRUMwdEsrODFOV08vRjNpanN3WXhVb3MrbWhIdHUycWxqb0t1U2FE?=
 =?utf-8?B?STNOQWNLWXF5Z2RTYzlSZ20xNWI5cFhpc0ZJWUhzOEFVMFB0R1U3bjlmcU81?=
 =?utf-8?B?OXVCT29QZCtXYWdyUGpiaTJlS3VkMThIcnFFTU8rMGhxTk1XYnB0TnczQTRK?=
 =?utf-8?B?NHFtQVZMSXNwaTdvb2NhcEVqQk95cm9oNmc2Q1JXMy9UTTdra3JCeXlEaVlM?=
 =?utf-8?B?S2pzMWpIZ1J2czF1dmFoS3B1dUlZKzl4Y04ySWJXekhDTnRXVEFqcVZLU29a?=
 =?utf-8?B?K2FSdlRkTllwQnB5YmczeTVURDhNWDNpRmVTUC9zNGo0aEgxNGJxUXFVYjBj?=
 =?utf-8?B?Z1BpTkhBWW8yNGI2NDJZQzQ5YSs4UlJ4dDc4QlkyZ0VaUFF1VjN3dEpWb1hR?=
 =?utf-8?B?TE5JOW9XMmRFeUVkYlVrL0JkVW8zb1ZQVTNaM2J4UE5lQVZoSTNWN2ovdi9M?=
 =?utf-8?B?MmlqSXlCK2RwSnlmQmxCVnNjMU9QQ1daSnY5QkU3NWo2MzFLa2tiYlBadHIw?=
 =?utf-8?B?b3ZXZ2pBWXZ0eS90Y1VxRk1MNWxVT3hTYjJJT1dSNWkzNFJOdmpQTWR1NjJx?=
 =?utf-8?B?QitJTklFbXU0N25sYiswUnhTdEtON2tuc1lTdVlUa3dBYnU3OFl1VDlEVmpm?=
 =?utf-8?B?OUZOeEVkZG9IbzNwckJuUThCZUtIKzJhWjZJK1l2QWxxbFh2U0N3djJvL0lL?=
 =?utf-8?B?UHpHUUgzSEVNNFRvanpSbmRqQXRLYWxWK3paZ0hEOUpjb0VBYmlMWk04STZ1?=
 =?utf-8?B?bGhxeEtCam9nakRFcFFESTBzbzRYSmJBQ3J3aG5mS2ttSE1aL0ZjVnpGYllh?=
 =?utf-8?B?Qk1qV2dIUFB4K0R2THBmRjJXSDN4NUs0UnRMNzZWWjBjNkFDQ1laYnVqWE5U?=
 =?utf-8?B?SzlFcXhHZDdaajFDSDc3SlhjV2VDUWJIdnVNaGFHYnVWR2wyK2hvWHNHcS83?=
 =?utf-8?Q?YRQnh0zy5FYO2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHpHcWRVWlJKaWU4aEVESkpIZm5ZRkhuRFNsRmZWMEFvcFVyTlVhVDBYeFVL?=
 =?utf-8?B?Y29Qckg1Z09aMStzREg3WThRQlNKNEl4M1NLWHJaQnFqRzZoOWhkaEtnSS8v?=
 =?utf-8?B?SExwL2t5bW5obmVJN2FaczdnZFNXN3cwR3BVWVljcXowQjFBYjd5ZUF2dTJs?=
 =?utf-8?B?UmpzekZIZTFhTllpcFFCZVF0ZW92bThJeU1xbitwZC9RekxYdUROdjZ0S3Av?=
 =?utf-8?B?TXBXaTRxVXM3eWtRVkt4SFdLblZyQS9adW9MZXhIQ2tWRWxrS3lNTzY4WjdR?=
 =?utf-8?B?MG0vOFUrWHB4NGRuT2cxMVNydDF0NlV3QW5BeVVGTU80RUNrajlkY1orZHQ3?=
 =?utf-8?B?S3dpWERCWFJ3S3RVNjBxVnoxNXpKenN5am9WZ2t1d1ZhKzArQ2NTNklhY1JK?=
 =?utf-8?B?VmZNdERadkc1ekw3MENzZDRpbHRicGZzMkdUVXVnSlZwQk5ZVGtkZ1dMazk1?=
 =?utf-8?B?aTdWN2plOHNBK29kNWlWMVM4VmQ0c0lPYkNuL0JCMUswanU0bXQ0SFdaMncr?=
 =?utf-8?B?UmQ2amRJc2JoeUJtN0krZTRsWUhrYUR2a0hoQjBkNW1YbnVKdVNuT0NURnpT?=
 =?utf-8?B?UzR2Zm5EQThDNFBSanhmb3cvYVp4d3R0OXdWdGdwZElHWE0vbTM2eWtxMGdh?=
 =?utf-8?B?b3VRcGRTcGhKcyszeWEyL0NnbWRaRjc0clJmNUwxSHdSU2ZkRm9ReUtYUXZF?=
 =?utf-8?B?WUo3SUZCU3B1MnQ3OTBQR1FIWUNNWmlXT2RONUc0NEFSU0tlMFZZTERyeURP?=
 =?utf-8?B?NE1LcXFZaXZXNkQzNHNiL0J4M05YVENBdHU5eWtQbmpieEhDVXN1MVZ6eC9k?=
 =?utf-8?B?cmhGZDdXMDI3MTVGdGZYVTdBQjBsZnRkcGpGNkk2cE1CNTNnb0NZdTVkWVNO?=
 =?utf-8?B?dTI0ZjN0MTRrMEJVOXd0US8rcERobFdmV0w3ViszMGEyWjdXL2JlYVB2RUJv?=
 =?utf-8?B?T1I5WFowQ3FJSzNDdjRtTi9FdmF3aTF0L0NCK1k2ME1QTFVDOWdwR1BrdUFO?=
 =?utf-8?B?a201Qm1zb3VOUWpjMUw1RmdhRjVzdGdxQm5acGJvTjc1cy9RNUd4QW01ODdH?=
 =?utf-8?B?ZHlaTHJQYlgvbzcwbEJtQkdNaURYK2VhY0NhSTR2d2ErTk5aV0V1TUJIampz?=
 =?utf-8?B?aXlDSGxQZVBaNmZTK3FwcGhrM1ZFTDVkQWFDYW9NMnU3a2VyMW1PZ3AzdzV1?=
 =?utf-8?B?bitUcUlHNDNUTFJGNFYzMS93VWRicWkxbnRlTlFJd2IxaitLdFhURDNZeGw0?=
 =?utf-8?B?MVk1OEw2SEpnOURIOSthTXZ5VTA3aTZLekhpMFhYeEE0cWQ0R1BCdi9QQUt0?=
 =?utf-8?B?OEo1V0lTTzRJVDdSaFF2SDNlaXlpbkRIcFdqQ09ZdVRWNlpyR1R4dE90MzhK?=
 =?utf-8?B?YzNJQVZVSXdqMjFNbUprTDJWd0orNXFnV0cwSStmZm0wMi9oeHBrYlVoR0xG?=
 =?utf-8?B?bUl5b0JqVGNNdDZqanl6ejN4L0FvRU5ETlM3TnlBbGNLSml6Y21pS3lZT3ZF?=
 =?utf-8?B?ZlYrOFYzWjRsbVZ1V1RpRzV0TkZObHBVVU9XZDdjUmlTQXQwU1BRZWRmOVpk?=
 =?utf-8?B?Z2lETkhFM2txNXR3Z0dSdUJ5YVRMRFg1SFJNMFdVeTFJWE4waU0wZW8yU0dj?=
 =?utf-8?B?MHFBNXZnTjlkUVZVQ2lFSUlHSnlubExlc3VxZHBSR1FmdkcwVjVCQU5ZN2VE?=
 =?utf-8?B?Z2pnNGlhc0xkT09rUDlLVDZ3OHVXampUNWJZU0N4OWZEVWtRMTErTWk0WXM4?=
 =?utf-8?B?dGIvMUJUSnB2NWZSOWZUa0Q0UjNyWkR2ak05ckMrd3RPNjNpQWVTTU5wajV3?=
 =?utf-8?B?VE8zYmxTeEkvTUFzdlVETklyOXlVV2gvSG13a0c5Yy9obDl2VEw0QUtLQ1hP?=
 =?utf-8?B?Vk9lUTRMT2hPZXdNWVRibnFNNThoK2tiMURGby94YXRQckdmQXlyU01jcHRE?=
 =?utf-8?B?Mi9UKzJrYWpJQTlXNE9IS3hZU1ZuT3YvV29TTGFqSkZUNlJHSzJQNnZWcSs4?=
 =?utf-8?B?WW5Rbk14bFBNUVQ0anZmOSt4elcyeXU5dmVtMVVMTzVGVTdnUzFjbjhEQTBw?=
 =?utf-8?B?VUMzUHNUNGZObjRGVU9wSkwvaGE0VEZpem5ydlViblBRSzJnNVV2dW5NN2k3?=
 =?utf-8?B?MDlVcWYyN1hvVGRyb0EvYlFhdlB4c3NLbzI5YUVrZlA5MWNDckFOL0xMcUFj?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jrUl+6Upx4nADNHO/fMlD+f7lZMxw0WXEoymnC1jA1fMcWW/DnbLlHOL21RzAZyUrUBevPcWALehCgUIPoEWo61h4ZbpA6BQG+PnZ9wubqXljv1nKn1n42BhxcY2qUrc46uFNcUcaoC+tA4ua8tnrd1jzmz9JIUnLWesCJ7lyLBKNJbzHGVBdthj2Imym8nAup3CVDrBpHhZvedtfJlcTTHk8wzKMHlXMcQAhZ7vTIDbjCVoCNXFkLARDGprNn/DLjM/McoLb+I4Y8hVz8jyPR8AQZHHl4UgC28ijMUHVc3GLpJgpFi/k2LVgtFReI08DZQ2dOcubeT2Kj4BG8oMLioPKQvvgBREs+SOSj8IONKWmI8/ynBIuWEsAzrMBvC5Y2Q7dHTpgHBTrbymhdhlJEhVLA0Si52MLERx1D38G6qtiEPTWK3yMG/LICJi+hRQtlLC3A0cr7zRrMbI7Ulq+0qwJk6ISmWF9gPlexArgx0MHyibXTH3QULD0YUIt+MV7gRAXCXwDlhC5cEHlfnvDgNgWG/gKFQCJnRn/6TdTKv8FTT0Bp242jj3/iDpYcmb/+L/Q1MU3Khh7CpLZLhTLxNS2QfkiuE7s3i1xKHaaYs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e6d037-1b0d-47bf-dc55-08dd93ca7f58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 16:06:48.7829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkhzxvRcIFUqO2if4bCZBqY0EvM4CdffZf680bZJWzgnerNtFRbYzzxaakgDI6WY/chtd5yyAjn3rQn/74TTgXAdkRs6GMtTKafjr+YH6S4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4860
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150158
X-Authority-Analysis: v=2.4 cv=DZAXqutW c=1 sm=1 tr=0 ts=6826111c b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=P-IC7800AAAA:8 a=k7a4KV5231s141shf4wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 cc=ntf awl=host:13186
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MCBTYWx0ZWRfX4RDzWvzLKPwO c9wySU0n3GtimG8LjYsXF2OC/6CcwR69NXJqXmokfzbgMtr8j3AtaJJB1pVOnYei/zG11oa3KEg TuwM7c+bZEV4bE5Cl0QF/8K8IoTjiluP5v8qHWH0A7BEFqSvXJb44YBvb1/1VYU89j9pfWlidMi
 6AVxWqEX6WLdvzUlydtSCoj8uhMelVHWef5btPQdXVLUbArF2km++xDx1OpKCqLZ3Hnm6p/ZZLi ooH7TcEj5M80q4X3+6vxjV5ZSwDJgsiP0Qe6jitOltSjkhXxhH0yDUvYvrq8aE5VonR0t2cmfK/ wJSSq3PukFJgGuCVP9CxVE2aqTCuxQ2Lac+6JGH1Qd6+tXy2HQnT9k2NEajDKBxa+KbpVuM04m0
 WD8XAi5lnUWCPImkI2fNLSpAMyey1V/6FHD6AMjge66zMGTlZ+ZBY+Sc9QLhWm5/5CvuGv1d
X-Proofpoint-GUID: 3ax21qFllCg4C2fvRAqK0vhKoE3EmQUH
X-Proofpoint-ORIG-GUID: 3ax21qFllCg4C2fvRAqK0vhKoE3EmQUH

On Thu, May 15, 2025 at 04:28:51PM +0100, Usama Arif wrote:
>
>
> On 15/05/2025 15:40, Lorenzo Stoakes wrote:
> > Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
> > outlandish stuff and needs discussion.
> >
>
> There was a lot of discussion in the
> original patch (https://lore.kernel.org/linux-mm/20250507141132.2773275-1-usamaarif642@gmail.com/).
> And there was a conclusion to go with Davids suggestion (https://lore.kernel.org/all/13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com/)
> and the following reply (https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/)
>
>
> > You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
> > never is completely ignored and overridden. Which I am emphatically not
> > comfortable with. And you're not saying that you're doing this,
> > anywhere. Which is wrong.
>
> No I am not.
>
> hugepage_global_always and hugepage_global_enabled will evaluate to false
> and you will not get a hugepage.

Ack yes as discussed elsewhere.

However again, as discussed elsewhere, you are setting the MMF and VMA
flags without accounting for the logic in hugepage_madvise().

>
> >
> > Also, this patch is quite broken.
> >
> > I'm hugely not a fan of adding mm_struct->flags2, and I'm even more not a
> > fan of you not mentioning such a completely fundamental change in the
> > commit mesage.
>
> This was also discussed in the original series.

It being discussed in the other series doesn't mean we can no longer
discuss it :)

>
> If there is a very serious issue with going with flags2, I can try and just
> reuse mm->flags bit 18, but it will mean that only MMF2_THP_VMA_DEFAULT_HUGE
> can be implemented and not MMF2_THP_VMA_DEFAULT_NOHUGE

I have a big problem with us fundamentally changing a core mm data
structure for what appear to be very specific purposes, yes.

But I think we have a better solution... see below

>
> We have run out of bits in mm->flags.
> If there is something new that we are developing that needs another bit,
> we either need to add flags2 (I don't care about the name, can be anything),
> or we need to limit it to 64 bit machines only.
>
> If the maintainers have an issue with flags2. I can limit this to 64 bits,
> it will probably mean ifdefs everywhere...

I'm a maintainer also good sir :)

As I say elsewhere, we could make a pre-requisite change of making
mm->flags 64-bit even on 32-bit kernels.

This is a change that I will be doing to vma->vm_flags soon as I have the
exact same problem, and it's very silly indeed.

Adding 8 bytes per process for every single process everywhere just for
this to suit essentially deprecated kernels is... not ideal :)

But also there's further issues with having 2 flags fields, I discuss
elsewhere in this semi-stream-of-consciousness..

>
> >
> > This patch also breaks VMA merging and the VMA tests...
> >
>
> Its doing the same as KSM as suggested by David. Does KSM break these tests?
> Is there some specific test you can point to that I can run that is breaking
> with this patch and not without it?

They don't build, at all. I explain how you can attempt a build below.

And no, KSM doesn't break the tests, because steps were taken to make them
not break the tests :) I mean it's really easy - it's just adding some
trivial stubs.

If you need help with it just ping me in whatever way helps and I can help!

It's understandable as it's not necessarily clear this is a thing (maybe we
need self tests to build it, but that might break CI setups so unclear).

The merging is much more important!

>
>
> > I really feel this series needs to be an RFC until we can get some
> > consensus on how to approach this.
>
> There was consensus in https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/

I disagree with this asssessment, that doesn't look like consensus at all,
I think at least this is a very contentious or at least _complicated_ topic
that we need to really dig into.

So in my view - it's this kind of situation that warrants an RFC until
there's some stabilisation and agreement on a way forward.

>
> >
> > On Thu, May 15, 2025 at 02:33:30PM +0100, Usama Arif wrote:
> >> This is set via the new PR_SET_THP_POLICY prctl.
> >
> > What is?
> >
> > You're making very major changes here, including adding a new flag to
> > mm_struct (!!) and the explanation/justification for this is missing.
> >
>
> I have added the justification in your reply to the coverletter.

As stated there, you've not explained why alternatives are unworkable, I
think we need this!

Sort of:

1. Why not cgroups? blah blah blah
2. Why not process_madvise()? blah blah blah
3. Why not bpf? blah blah blah
4. Why not <something I've not thought of>? blah blah blah

>
> >> This will set the MMF2_THP_VMA_DEFAULT_HUGE process flag
> >> which changes the default of new VMAs to be VM_HUGEPAGE. The
> >> call also modifies all existing VMAs that are not VM_NOHUGEPAGE
> >> to be VM_HUGEPAGE. The policy is inherited during fork+exec.
> >
> > So you can only set this flag?
> >
>
> ??

This patch is only allowing the setting of this flag. I am asking 'so you
can only set this flag?'

To which it appears the answer is, yes I think :)

An improved cover letter could say something like:

"
Here we implement the first flag intended to allow the _overriding_ of huge
page policy to ensure that, when
/sys/kernel/mm/transparent_hugepage/enabled is set to madvise, we are able
to maintain fine-grained control of individual processes, including any
fork/exec'd, by setting this flag.

In subsequent commits, we intend to permit further such control.
"

>
> >>
> >> This allows systems where the global policy is set to "madvise"
> >> to effectively have THPs always for the process. In an environment
> >> where different types of workloads are stacked on the same machine,
> >> this will allow workloads that benefit from always having hugepages
> >> to do so, without regressing those that don't.
> >
> > Again, this explanation really makes no sense at all to me, I don't really
> > know what you mean, you're not going into what you're doing in this change,
> > this is just a very unclear commit message.
> >
>
> I hope this is answered in my reply to your coverletter.

You still need to improve the cover letter here I think, see above for a
suggestion!

>
> >>
> >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >> ---
> >>  include/linux/huge_mm.h                       |  3 ++
> >>  include/linux/mm_types.h                      | 11 +++++++
> >>  include/uapi/linux/prctl.h                    |  4 +++
> >>  kernel/fork.c                                 |  1 +
> >>  kernel/sys.c                                  | 21 ++++++++++++
> >>  mm/huge_memory.c                              | 32 +++++++++++++++++++
> >>  mm/vma.c                                      |  2 ++
> >>  tools/include/uapi/linux/prctl.h              |  4 +++
> >>  .../trace/beauty/include/uapi/linux/prctl.h   |  4 +++
> >>  9 files changed, 82 insertions(+)
> >>
> >> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> >> index 2f190c90192d..e652ad9ddbbd 100644
> >> --- a/include/linux/huge_mm.h
> >> +++ b/include/linux/huge_mm.h
> >> @@ -260,6 +260,9 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
> >>  	return orders;
> >>  }
> >>
> >> +void vma_set_thp_policy(struct vm_area_struct *vma);
> >
> > This is a VMA-specific function but you're putting it in huge_mm.h? Why
> > can't
> this be in vma.h or vma.c?
> >
>
> Sure can move it there.
>
> >> +void process_vmas_thp_default_huge(struct mm_struct *mm);
> >
> > 'vmas' is redundant here.
> >
>
> Sure.
> >> +
> >>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> >>  					 unsigned long vm_flags,
> >>  					 unsigned long tva_flags,
> >> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> >> index e76bade9ebb1..2fe93965e761 100644
> >> --- a/include/linux/mm_types.h
> >> +++ b/include/linux/mm_types.h
> >> @@ -1066,6 +1066,7 @@ struct mm_struct {
> >>  		mm_context_t context;
> >>
> >>  		unsigned long flags; /* Must use atomic bitops to access */
> >> +		unsigned long flags2;
> >
> >
> > Ugh, god really??
> >
> > I really am not a fan of adding flags2 just to add a prctl() feature like
> > this. This is crazy.
> >
> > Also this is a TERRIBLE name. I mean, no please PLEASE no.
> >
> > Do we really have absolutely no choice but to add a new flags field here?
> >
> > It again doesn't help that you don't mention nor even try to justify this
> > in the commit message or cover letter.
> >
>
> And again, I hope my reply to your email has given you the justification.

No :) I understood why you did this though of course.

>
> > If this is a 32-bit kernel vs. 64-bit kernel thing so we 'ran out of bits',
> > let's just go make this flags field 64-bit on 32-bit kernels.
> >
> > I mean - I'm kind of insisting we do that to be honest. Because I really
> > don't like this.
>
>
> If the maintainers want this, I will make it a 64 bit only feature. We
> are only using it for 64 bit servers. But it will probably mean ifdef
> config 64 bit in a lot of places.

I'm going to presume you are including me in this category rather than
implying that you are deferring only to others :)

So, there's another option:

Have a prerequisite series that makes mm_struct->flags 64-bit on 32-bit
kernels, which solves this problem everywhere and avoids us wasting a bunch
of memory for a very specific usecase, splitting flag state across 2 fields
(which are no longer atomic as a whole of course), adding confusion,
possibly subtly breaking anywhere that assumes mm->flags completely
describes mm-granularity flag state etc.

The RoI here is not looking good, otherwise.

>
> >
> > Also if we _HAVE_ to have this, shouldn't we duplicate that comment about
> > atomic bitops?...
> >
>
> Sure
>
> >>
> >>  #ifdef CONFIG_AIO
> >>  		spinlock_t			ioctx_lock;
> >> @@ -1744,6 +1745,11 @@ enum {
> >>  				 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
> >>  				 MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
> >>
> >> +#define MMF2_THP_VMA_DEFAULT_HUGE		0
> >
> > I thought the whole idea was to move away from explicitly refrencing 'THP'
> > in a future where large folios are implicit and now we're saying 'THP'.
> >
> > Anyway the 'VMA' is totally redundant here.
> >
>
> Sure, I can remove VMA.
> I see THP everywhere in the kernel code.
> Its mentioned 108 times in transhuge.rst alone :)
> If you have any suggestion to rename this flag, happy to take it :)

Yeah I mean it's a mess man, and it's not your fault... Again naming is
hard, I put a suggestion in reply to cover letter anyway...

>
> >> +#define MMF2_THP_VMA_DEFAULT_HUGE_MASK		(1 << MMF2_THP_VMA_DEFAULT_HUGE)
> >
> > Do we really need explicit trivial mask declarations like this?
> >
>
> I have followed the convention that has existed in this file, please see below
> links :)
> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1645
> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1623
> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1603
> https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1582

Ack, yuck but ack.

>
>
> >> +
> >> +#define MMF2_INIT_MASK		(MMF2_THP_VMA_DEFAULT_HUGE_MASK)
> >
> >> +
> >>  static inline unsigned long mmf_init_flags(unsigned long flags)
> >>  {
> >>  	if (flags & (1UL << MMF_HAS_MDWE_NO_INHERIT))
> >> @@ -1752,4 +1758,9 @@ static inline unsigned long mmf_init_flags(unsigned long flags)
> >>  	return flags & MMF_INIT_MASK;
> >>  }
> >>
> >> +static inline unsigned long mmf2_init_flags(unsigned long flags)
> >> +{
> >> +	return flags & MMF2_INIT_MASK;
> >> +}
> >> +
> >>  #endif /* _LINUX_MM_TYPES_H */
> >> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> >> index 15c18ef4eb11..325c72f40a93 100644
> >> --- a/include/uapi/linux/prctl.h
> >> +++ b/include/uapi/linux/prctl.h
> >> @@ -364,4 +364,8 @@ struct prctl_mm_map {
> >>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
> >>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
> >>
> >> +#define PR_SET_THP_POLICY		78
> >> +#define PR_GET_THP_POLICY		79
> >> +#define PR_THP_POLICY_DEFAULT_HUGE	0
> >> +
> >>  #endif /* _LINUX_PRCTL_H */
> >> diff --git a/kernel/fork.c b/kernel/fork.c
> >> index 9e4616dacd82..6e5f4a8869dc 100644
> >> --- a/kernel/fork.c
> >> +++ b/kernel/fork.c
> >> @@ -1054,6 +1054,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
> >>
> >>  	if (current->mm) {
> >>  		mm->flags = mmf_init_flags(current->mm->flags);
> >> +		mm->flags2 = mmf2_init_flags(current->mm->flags2);
> >>  		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
> >>  	} else {
> >>  		mm->flags = default_dump_filter;
> >> diff --git a/kernel/sys.c b/kernel/sys.c
> >> index c434968e9f5d..1115f258f253 100644
> >> --- a/kernel/sys.c
> >> +++ b/kernel/sys.c
> >> @@ -2658,6 +2658,27 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
> >>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
> >>  		mmap_write_unlock(me->mm);
> >>  		break;
> >> +	case PR_GET_THP_POLICY:
> >> +		if (arg2 || arg3 || arg4 || arg5)
> >> +			return -EINVAL;
> >> +		if (!!test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2))
> >
> > I really don't think we need the !!? Do we?
>
> I have followed the convention that has existed in this file already,
> please see:
> https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644

OK, but please don't, I don't see why this is necessary. if (truthy) is
fine.

Unless somebody has a really good reason why this is necessary, it's just
ugly ceremony.

>
> >
> > Shouldn't we lock the mm when we do this no? Can't somebody change this?
> >
>
> It wasn't locked in PR_GET_THP_DISABLE
> https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644
>
> I can acquire do mmap_write_lock_killable the same as PR_SET_THP_POLICY
> in the next series.
>
> I can also add the lock in PR_GET_THP_DISABLE.

Well, the issue I guess is... if the flags field is atomic, and we know
over this call maybe we can rely on mm sticking around, then we probalby
don't need an mmap lock actually.

>
> >> +			error = PR_THP_POLICY_DEFAULT_HUGE;

Wait, error = PR_THP_POLICY_DEFAULT_HUGE? Is this the convention for
returning here? :)

> >> +		break;
> >> +	case PR_SET_THP_POLICY:
> >> +		if (arg3 || arg4 || arg5)
> >> +			return -EINVAL;
> >> +		if (mmap_write_lock_killable(me->mm))
> >> +			return -EINTR;
> >> +		switch (arg2) {
> >> +		case PR_THP_POLICY_DEFAULT_HUGE:
> >> +			set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
> >> +			process_vmas_thp_default_huge(me->mm);
> >> +			break;
> >> +		default:
> >> +			return -EINVAL;

Oh I just noticed - this is really broken - you're not unlocking the mmap()
here on error... :) you definitely need to fix this.

> >> +		}
> >> +		mmap_write_unlock(me->mm);
> >> +		break;
> >>  	case PR_MPX_ENABLE_MANAGEMENT:
> >>  	case PR_MPX_DISABLE_MANAGEMENT:
> >>  		/* No longer implemented: */
> >> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >> index 2780a12b25f0..64f66d5295e8 100644
> >> --- a/mm/huge_memory.c
> >> +++ b/mm/huge_memory.c
> >> @@ -98,6 +98,38 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
> >>  	return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
> >>  }
> >>
> >> +void vma_set_thp_policy(struct vm_area_struct *vma)
> >> +{
> >> +	struct mm_struct *mm = vma->vm_mm;
> >> +
> >> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
> >> +		vm_flags_set(vma, VM_HUGEPAGE);
> >> +}
> >> +
> >> +static void vmas_thp_default_huge(struct mm_struct *mm)
> >> +{
> >> +	struct vm_area_struct *vma;
> >> +	unsigned long vm_flags;
> >> +
> >> +	VMA_ITERATOR(vmi, mm, 0);
> >
> > This is a declaration, it should be grouped with declarations...
> >
>
> Sure, will make the change in next version.
>
> Unfortunately checkpatch didn't complain.

Checkpatch actually complains the other way :P it doesn't understand
macros.

So you'll start getting a warning here, which you can ignore. It sucks, but
there we go. Making checkpatch.pl understand that would be a pain, probs.

>
> >> +	for_each_vma(vmi, vma) {
> >> +		vm_flags = vma->vm_flags;
> >> +		if (vm_flags & VM_NOHUGEPAGE)
> >> +			continue;
> >
> > Literally no point in you putting vm_flags as a separate variable here.
> >
>
> Sure, will make the change in next version.

Thanks!

>
> > So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
> > is to override global 'never'?
> >
>
> Again, I am not overriding never.
>
> hugepage_global_always and hugepage_global_enabled will evaluate to false
> and you will not get a hugepage.

Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
if the policy is never.

And we now get into realms of:

'Hey I set prctl() to make everything huge pages, and PR_GET_THP_POLICY
says I've set that, but nothing is huge? BUG???'

Of course then you get into - if somebody sets it to never, do we go around
and remove VM_HUGEPAGE and this MMF_ flag?

>
>
> > I'm really concerned about this.
> >
> >> +		vm_flags_set(vma, VM_HUGEPAGE);
> >> +	}
> >> +}
> >
> > Do we have an mmap write lock established here? Can you confirm that? Also
> > you should add an assert for that here.
> >
>
> Yes I do, its only called in PR_SET_THP_POLICY where mmap_write lock was taken.
> I can add an assert if it helps.

It not only helps, it's utterly critical :)

'It's only called in xxx()' is famous last words for a programmer, because
later somebody (maybe even your good self) calls it from somewhere else
and... we've all been there...

>
> >> +
> >> +void process_vmas_thp_default_huge(struct mm_struct *mm)
> >> +{
> >> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
> >> +		return;
> >> +
> >> +	set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2);
> >> +	vmas_thp_default_huge(mm);
> >> +}
> >> +
> >> +
> >>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> >>  					 unsigned long vm_flags,
> >>  					 unsigned long tva_flags,
> >> diff --git a/mm/vma.c b/mm/vma.c
> >> index 1f2634b29568..101b19c96803 100644
> >> --- a/mm/vma.c
> >> +++ b/mm/vma.c
> >> @@ -2476,6 +2476,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
> >>  	if (!vma_is_anonymous(vma))
> >>  		khugepaged_enter_vma(vma, map->flags);
> >>  	ksm_add_vma(vma);
> >> +	vma_set_thp_policy(vma);
> >
> > You're breaking VMA merging completely by doing this here...
> >
> > Now I can map one VMA with this policy set, then map another immediately
> > next to it and - oops - no merge, ever, because the VM_HUGEPAGE flag is not
> > set in the new VMA on merge attempt.
> >
> > I realise KSM is just as broken (grr) but this doesn't justify us
> > completely breaking VMA merging here.
>
> I think this answers it. Its doing the same as KSM.

Yes, but as I said there, it's not acceptable, at all.

You're making it so litearlly VMA merging _does not happen at all_. That's
unacceptable and might even break some workloads.

You'll certainly cause very big kernel metadata usage.

Consider:

|-----------------------------|..................|
| some VMA flags, VM_HUGEPAGE | proposed new VMA |
|-----------------------------|..................|

Now, because you set VM_HUGEPAGE _after any merge is attempted_, this will
_always_ be fragmented, forever.

That's just not... acceptable.

The fact KSM is broken this way doesn't make that OK.

Especially on brk(), which now will _always_ allocate new VMAs for every
brk() expansion which doesn't seem very efficient.

It may also majorly degrade performance.

That makes me think we need some perf testing for this ideally...

>
> >
> > You need to set earlier than this. Then of course a driver might decide to
> > override this, so maybe then we need to override that.
> >
> > But then we're getting into realms of changing fundamental VMA code _just
> > for this feature_.
> >
> > Again I'm iffy about this. Very.
> >
> > Also you've broken the VMA userland tests here:
> >
> > $ cd tools/testing/vma
> > $ make
> > ...
> > In file included from vma.c:33:
> > ../../../mm/vma.c: In function ‘__mmap_new_vma’:
> > ../../../mm/vma.c:2486:9: error: implicit declaration of function ‘vma_set_thp_policy’; did you mean ‘vma_dup_policy’? [-Wimplicit-function-declaration]
> >  2486 |         vma_set_thp_policy(vma);
> >       |         ^~~~~~~~~~~~~~~~~~
> >       |         vma_dup_policy
> > make: *** [<builtin>: vma.o] Error 1
> >
> > You need to create stubs accordingly.
> >
>
> Thanks will do.

Thanks!

>
> >>  	*vmap = vma;
> >>  	return 0;
> >>
> >> @@ -2705,6 +2706,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >>  	mm->map_count++;
> >>  	validate_mm(mm);
> >>  	ksm_add_vma(vma);
> >> +	vma_set_thp_policy(vma);
> >
> > You're breaking merging again... This is quite a bad case too as now you'll
> > have totally fragmented brk VMAs no?
> >
>
> Again doing it the same as KSM.

That doesn't make it ok. Just because KSM is broken doesn't make this ok. I
mean grr at KSM :) I'm going to look into that and see about
investigating/fixing that behaviour.

obviously I can't accept anything that will fundamentally break VMA
merging.

The answer really is to do this earlier, but you risk a driver overriding
it, but that's OK I think (I don't even think any in-tree ones do actually
_anywhere_ - and yes I was literally reading through _every single_ .mmap()
callback lately because I am quite obviously insane ;)

Again I can help with this.

>
> > We can't have it implemented this way.
> >
> >>  out:
> >>  	perf_event_mmap(vma);
> >>  	mm->total_vm += len >> PAGE_SHIFT;
> >> diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
> >> index 35791791a879..f5945ebfe3f2 100644
> >> --- a/tools/include/uapi/linux/prctl.h
> >> +++ b/tools/include/uapi/linux/prctl.h
> >> @@ -328,4 +328,8 @@ struct prctl_mm_map {
> >>  # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
> >>  # define PR_PPC_DEXCR_CTRL_MASK		0x1f
> >>
> >> +#define PR_SET_THP_POLICY		78
> >> +#define PR_GET_THP_POLICY		79
> >> +#define PR_THP_POLICY_DEFAULT_HUGE	0
> >> +
> >>  #endif /* _LINUX_PRCTL_H */
> >> diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> >> index 15c18ef4eb11..325c72f40a93 100644
> >> --- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> >> +++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
> >> @@ -364,4 +364,8 @@ struct prctl_mm_map {
> >>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
> >>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
> >>
> >> +#define PR_SET_THP_POLICY		78
> >> +#define PR_GET_THP_POLICY		79
> >> +#define PR_THP_POLICY_DEFAULT_HUGE	0
> >> +
> >>  #endif /* _LINUX_PRCTL_H */
> >> --
> >> 2.47.1
> >>
>
