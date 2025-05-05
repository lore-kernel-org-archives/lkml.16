Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1360F2741B9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746470647; cv=fail; b=Nk3O0875hVVW9SSsZSSJgsmeVMsLcUP+qtx8Qsk0eOh1OROe86P5f8XqGWj5Dn/b6VWFbimU/DdVYb6wVxO3Puqb01oyLwhtZGhKUjs7amKZO46vlaLdDbfNOMPpF+H10bUp49APIWQXWYa18uEOj0MLPNP7Si8oMPc/qHlLDUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746470647; c=relaxed/simple;
	bh=pYuYU9fzuhTLNWo3PXEW0Tna6BGk4mxRO8I2izpfcKs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eXDE853zmgO3tTXXN3R3AnjIGvuUVjrdAAafszxRirVN5Yv4LPSIuj4mmmuSQ0fe9MSulhTPqNTwxmkMqNXpDPR+rR0/7x77TETh/VwExDTLW9tnfmjanKUj7dGIJsiWYNEI7j8GjziGytL/YhMcby45YPputpmWOZajTILvJhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hAYbRkiS; arc=fail smtp.client-ip=40.107.94.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hAYbRkiS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8QjlJ4msxyyULkKm8HrGtusQs/ftLBDij4a+HsVrRGUjmY20ZpEVWJoyVaKA8ELWlq5z21A/GsG7pxZXRm2U3WGoGjgKEWpq0jLlZTdmm7DVunkfZBGYBBayeTKmHxV8hUcO2XQeUxz01HZfjXaonp+44SzZxDxpWnQRbAawP5+N7pdjPLOhTR6VlyvP3VvhLMng+Pb2mngyBpbHIJ6ImdZhcqA/uJMZmRIAXR6N0xg1uQ350Nc1WMranKcLUp2814RIaGLk/VCDQVyzcP20bCXay6HrJcGrqrktxkOyZFwGSUf6xMxsK6JTKioC6FPHYkt2MsE//fcwO6OLu+anA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anPxEqaBK+1+yut4vm18VNYmhy+jluVjmboVkEDEu2o=;
 b=RDHQPLWDlo2ukX8lrPEI7IyOOAGGy5WlrG3+TLHFnS+E8P+QG9sOEoThJI9nBUUnG0432THd++jgzJBvvGB5xFjS2ohSCnda7pZuggUp7xBG7U4+xS9YRzQKNdyw4kuBBoNO81A0IFXeJh2oIP7260nraKTSb7Y64gmgiFHA/YIXKX1KPvxjv/gs33QdCQ87j4KVkdBLPpQwM2t4HsPONZSrVhYLeM8OMVhAhRDJv2cPUDR5MjBRh1KF+Om7FDG6JnwWUcET2FpHqnstdHDZw0jmZRiYZ8t0dqCgMVRHMwj37ZGX6CQdN34XTMPUi7njiMHFFAWgWQznKR/jLAuHdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anPxEqaBK+1+yut4vm18VNYmhy+jluVjmboVkEDEu2o=;
 b=hAYbRkiSkmK1iDl/nrfk1b2/4PkURP3wbZWDGw4MDu1OleqnEBiJIh3NWsvWf/AzSQ48dwx9pZ4kqaEf3LtKYqq5AFnHubhLTb02Hge9V2ykN/74Me6NoieweZasoEEKk70tys5W8bTngFD2SEqgBF+x+V6m9z3xr6RqkOK23aI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY5PR12MB6129.namprd12.prod.outlook.com (2603:10b6:930:27::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.40; Mon, 5 May
 2025 18:44:03 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8699.024; Mon, 5 May 2025
 18:44:03 +0000
Message-ID: <258f6582-0c28-4c2f-bbe4-918fe2c21223@amd.com>
Date: Mon, 5 May 2025 12:44:00 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Use true/false for boolean variables in
 DML2 core files
To: Ivan Shamliev <ivan.shamliev.dev@abv.bg>, austin.zheng@amd.com,
 jun.lei@amd.com, harry.wentland@amd.com
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250424181453.3f78a2a9@laptop>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250424181453.3f78a2a9@laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY5PR12MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d17903-c459-4048-a827-08dd8c04ceb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXVZU1U2VWFJS3VYaWdSOU5JZGF3RjBzanowcGpYK0VFU0lYZHJRS3REYktU?=
 =?utf-8?B?TWY3SDcyTHkxYkg2NTF2Q2YrMzV3NHFjSm1Pc0hpaUxjeUZxNHVRbVhmc1Jt?=
 =?utf-8?B?UERhcGJRVHNwWThsUGt3Y2lOWm56N0NRWENGN1IwSUZOS3pWdU9FTFpVZnpn?=
 =?utf-8?B?bkZOcUVNTDJ5ZkFpTVJnaGk3T3Nnd1FFSk5pa01IMHhjZ0htMmFhUW82WUtL?=
 =?utf-8?B?NkQ1ZTNSSUlEUHFtYkhrTkNlNWw3OTF0THo1aVFEWDh1UHVjWGRIYUVyRWZ1?=
 =?utf-8?B?czkyUzVOeG5FeHRac3RhUFBvWFhBWURBakM3dTgwQWZZcXI1Smx4UDFJMXVj?=
 =?utf-8?B?NVlhSFUrOEw4aTVLNEoyYVIzNFo5VlZYUXRKSlZLR1FpV0o5YkorVkIwUEtD?=
 =?utf-8?B?Y1lKTisrMWRVajFVZjl5eFRpM09zTUZ6aGNZWFVWNEwvZHk0KzdUR1lhdEZH?=
 =?utf-8?B?d0xzZGk0aU1iTng4dlN3dTdWQ3RjZ1Q0Q3FwUEIxWFlEaWtrNFNqNk8wU1hS?=
 =?utf-8?B?Ym1ZSG5OTHUyRGxxWFR3a1hWQXF2L25FanNXb1g1RS9SaHczWnpRRXZOS2h0?=
 =?utf-8?B?bTQxanRPVEpubjdXNVNaU3lMUUJmangzc0pFYWllZTE1QWNBUHN0NzZodURl?=
 =?utf-8?B?MFVxNW52SVM2MURNdmNCV2FnK083NXpuak1mTGZkWGxjc3R3bVFORHppZURy?=
 =?utf-8?B?Z3lXeWxMSmU4S29PZ0RmSTBnK3NSUXJzK3VSVFNINU5aak9BTi9CSmxaamZE?=
 =?utf-8?B?TkFyTlBpNXlQQU5xRUtUZDJYSmU0bi9ZUzNYZHlsaERDdDRiMjRtbEljVnd1?=
 =?utf-8?B?ZkJ5K2RlVk43K213dk43YWw2QzBmK2hoakE0SzcyVmthYzNHYzhtVGdVRXlP?=
 =?utf-8?B?eG13cDlGUkw3dU16RE5MYXYyRFBpVDExeGZVeG1QdVRvU3RNSHlLdmdwMkJ5?=
 =?utf-8?B?bnh0QmQ3VjRpTWtGM0d4alg3UnRONTR6U2lCSHBrSldDUkk4UzM0STB0cUp6?=
 =?utf-8?B?YVpxQmZuYjNnSWkwWU9IOWdYamtRNU1nR3YvOUtQWkdtSzRoTkI3ZGY3SStl?=
 =?utf-8?B?TUVmUWRicXk2b0Z3ZFVOZjlXTW1qQlBHTmNuQW50ZjBWT1hkb1pxSFR6Q0VT?=
 =?utf-8?B?cC9yNDUyd1gyR0dBS3ZyYnZTdjY1ekRxNXVrTWJHVGFKR08rREN2YTRCSHFw?=
 =?utf-8?B?emcwdkc5S2lwZ3J6dlhsK3N6SWdtaXNYUFFQc3F3aUJCQUVWaEFkMlA5QWxT?=
 =?utf-8?B?TGNLb281RnNCNWVvQUdjbFRGbytHWVpZbCtBdkZDbDFkcDVBaW13N1VIZXFs?=
 =?utf-8?B?TWlJaCt2MWU2Mkd3Wk55Zmo3dXh6ek9lVkZkMzNEeEptbGU2Z2JDMitjMFpY?=
 =?utf-8?B?ZkpKY0I4cE5IWndkVTZNTkhZZks0N29PQzdFZE5EbkxUNWFKNTJ4QWpta3Y3?=
 =?utf-8?B?c0k2UVcxSkVodGd3VHlLdFhmMXZVbjEwWVdtLzVnSW5TK3J1c1RQRSt0WE1v?=
 =?utf-8?B?czFTbVlMbU04bmxRMjRCSEdwSDJWbTJHMHVKZ2RKRjZYTktpdkxnMjhsT1Ar?=
 =?utf-8?B?QzFVSktYb0ZxRWpMRHkvak55TFEyWm85Uyt0K1RsRFdid0FmWWpQcUJGMzM0?=
 =?utf-8?B?ajRTODlybTU0MjkvelM2dWRNNUlvR0RTUEpkSkpDdmYvSWppSlN3eXQ4OXVs?=
 =?utf-8?B?aWdjVHF2OUxEcW9Uamg0bFF2SEJDbjgyTCt3Y2haK1JEbmxPcVRQdDduN29u?=
 =?utf-8?B?YkxaRTh6alc2VkR1bk5JVUhFZjkweW10YmRhRVRMbUNBZHZwYUZDSVRqLzN0?=
 =?utf-8?B?ejBoTHAxbEthSUtkZ05JYkxTYUFTZ1I1TW1aUTFVOTFSNWFwY2JYaEhGRmhQ?=
 =?utf-8?B?bUdpWTVVOHJDZHBNMENFVit2bXBkRUoyMTNGbGFMK3kvcE9zenJYTE56V3Br?=
 =?utf-8?Q?AqdtKHyL/OA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8476.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmduUWJoa2JqcnhXTlRCZCtsOHl6SXF2cXJKdktyNmVhZDlnTjhZRlQybHpS?=
 =?utf-8?B?RS96SEVZdnRxamF2RDI5TGRTajBSTEgzeEMxZFE4bEVzalRjK2xUSDFoTXlM?=
 =?utf-8?B?bjlOaUtpZ0FlYWJhZUJMTUIzbmpRZ2N3b0JHalNwMlZ1Zk5Na3dOQnRoZ1dB?=
 =?utf-8?B?ZWJFKzRWVlNFRHp1VTRZaC93M0dxbmMwbytqUkdpRXNMMWFwOGNDWjV6OEhW?=
 =?utf-8?B?TTdKSmZXcFJtZ0pMZlZCM2hNUXlzR0tHb2pxbm1ESERlYkNOSTlGV0lkU0Iy?=
 =?utf-8?B?RnpFMkNxRXhQVkcvWEl4elc3K0dkUnZKTnNjaXJhSmFrd0o4ZmNJUDk1aHJG?=
 =?utf-8?B?VnVvcVUvSm1tdW1mOGdNM3l6cXZaaEFEa3dHVEp3Nkk4RmlZa05HbWtocXdV?=
 =?utf-8?B?L0VoZ2t5eE5QNU1LVGsySE5OYTcrTDVSaGtBWkNmWlNvcno5M1hKejFnNmw4?=
 =?utf-8?B?L3BVbmlyWnRiaG9RV2tMQUlOTk1IV2pEOWhnSkRzM1JQTWdubkdpNGJaalBj?=
 =?utf-8?B?T3pDS1gwU1lPZ0pHV2g2aFBiSkc5NEo1bFpzaUJieDdNUThZYkhwMzJnY3Jp?=
 =?utf-8?B?anVpaytyQVJ3RGxOaUZURFBzdlVDczVsdVNLVGoxS3ZrWStQN0hLL2VWeUFL?=
 =?utf-8?B?T2Z4akJTTThwZ3hOVTM1UnN4YSt0ejlJbmZ1dTJYMG5JcUw0TS83V09iQUww?=
 =?utf-8?B?Ulphc25LbU9GcnhGamhNekpHZXVVd2xaV29ySEQyUkNtdzRiaHJpUWwwZjcy?=
 =?utf-8?B?MFZuUW83dUZVRWdsVEQ3NUFSNHBrT2Q5WjFYRHNKalViU0I4MTh6K3h0MVdN?=
 =?utf-8?B?SlJmOTEvUVUvMmt2WHpYcFNWaE83Y25FdjUrZDA0Z3R5Ly83VkpKTHhSQkZq?=
 =?utf-8?B?RmJXbUJleWw1cUliTy9jdVQwUnN5aU5rbWllUEQ3OWE0aC9RblBQRkhBRkZx?=
 =?utf-8?B?ZllXTHFFYStpWW9GNjFhb2JwcG5jUURuTlhpRGlReGZsQk14L0lCY3lNV2Z6?=
 =?utf-8?B?LzNEYTFWYStNc1hWZVFRRkR1V2Y2aC9XY0RsL0VPYmJ2cktEaGhrSmJQUThs?=
 =?utf-8?B?SDlaamx4SUpyWlpFSDlFNTRQazdmK1JHVEJUM1dqc0dpaUkzbUhDUmRCcTU0?=
 =?utf-8?B?K3pWOW5pTkMxNWNMN3NPZzFaeUMxMitIZVBKMGtYMVMzcFNUU0VFVjlNY0Er?=
 =?utf-8?B?WngycHd6eThyemtxdTRxM3J6ODJWc1F5V2pHcisyZWpZMWFpd2xGR1pQb3hv?=
 =?utf-8?B?MlRScTNtTjZzdEtNWFJjaEF2VWhBWWU0RmkwcFpuMzJLVFZ0dWdVTzdBT1BP?=
 =?utf-8?B?YkJ4aW1LSFhZWEZqSm5RTXZReC9FOVF3WktQdFd5SWRZbkJjRHBEbk9QUklP?=
 =?utf-8?B?em9DM1dtV1U1UEtheVo2dWJTckNKcTRkUUJwNks4aGFzR3FLbisxUE81U1Jo?=
 =?utf-8?B?dy94clZpbzdBcW5ZYXN1K1hyMk9CN1JWc3F6SzBNY1Bmenh0bkJiNHZYaUNV?=
 =?utf-8?B?WHBxRG0xSWlYRVlXM2FxM1cwMFo2Z1VpZFl0WWFUb0FtWmhCYXFPOU5uNFpp?=
 =?utf-8?B?SlJQTklSY3ZCRUNucFIwclBNbHFhd0FuWi9KV3ZnTnBESGxkMitSUnJmM0hp?=
 =?utf-8?B?ZmY3ajFZd3lKdVA0cEF2QlRuM2EydzM0UUo3a2Z1U3hIVFc0RXI1UUo2bVpD?=
 =?utf-8?B?MWVqNi8yNnpxR2krbU5OQ2RFN1ZCdStXWGkzQ0ovUW1mSWZWeXRNeUZMeVBF?=
 =?utf-8?B?cldzOUVhaU9JcGk1NWFUUVZmOE9pS0k1dXZhRXZXRVFuZHhZTzZzaG5mVWJS?=
 =?utf-8?B?NUxKV0NuNGdENWdEaWJySEVBaW5kVWVWR29NMHc5alFhUmMvTGVNbjNDMHJP?=
 =?utf-8?B?R2w1bFIyamVrdW5Vdy9KYlNpbXdhOFY4bmFDa0xKT2lKM1NiUmlyK0R4Qnpo?=
 =?utf-8?B?M0RmcFRxYlA5c05USjVxcGcrS2ZIN0h2bm02clBac1BSZEpTUS9mOXlKS0x5?=
 =?utf-8?B?R1NXdW5lM2xMbmVPWnBKTHVmNEhVcmdqenZtU0tVVVFyMHRTUUd6ZDVFa2FU?=
 =?utf-8?B?cmpOWjRWTjRJSlFMaFEvNmZNQWV0d01TUWw1MXllcUU4cmZLNDBkU1VnWVV5?=
 =?utf-8?Q?wAztuVLj6u8N6g9ctF4vNB1R+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d17903-c459-4048-a827-08dd8c04ceb2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 18:44:03.4037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYugiX0iOHmMAf9famtPULrNmo26Wteo5uQBnLcoQNrwAkv1lIAzwe/2B0Io25HPM0gIun4876BddpAYj2rs0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6129

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 4/24/25 09:14, Ivan Shamliev wrote:
>  From 694c017112d176af07c2a65f015a8e73d6895e81 Mon Sep 17 00:00:00 2001
> From: Ivan Shamliev <ivan.shamliev.dev@abv.bg>
> Date: Thu, 24 Apr 2025 11:00:08 +0300
> Subject: [PATCH] drm/amd/display: Use true/false for boolean variables in DML2
>   core files
> 
> Replace 0 and 1 with false and true for boolean variables in
> dml2_core_dcn4_calcs.c and dml2_core_utils.c to align with the Linux
> kernel coding style guidelines, which recommend using C99 bool type
> with true/false values.
> 
> Signed-off-by: Ivan Shamliev <ivan.shamliev.dev@abv.bg>
> ---
>   .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c   | 16 ++++++++--------
>   .../dml2/dml21/src/dml2_core/dml2_core_utils.c   |  8 ++++----
>   2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> index 4c504cb0e1c5..c299fe4b3b74 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> @@ -4962,11 +4962,11 @@ static double get_urgent_bandwidth_required(
>   		l->adj_factor_cur_pre = UrgentBurstFactorCursorPre[k];
>   
>   		bool is_phantom = dml_is_phantom_pipe(&display_cfg->plane_descriptors[k]);
> -		bool exclude_this_plane = 0;
> +		bool exclude_this_plane = false;
>   
>   		// Exclude phantom pipe in bw calculation for non svp prefetch state
>   		if (state_type != dml2_core_internal_soc_state_svp_prefetch && is_phantom)
> -			exclude_this_plane = 1;
> +			exclude_this_plane = true;
>   
>   		// The qualified row bandwidth, qual_row_bw, accounts for the regular non-flip row bandwidth when there is no possible immediate flip or HostVM invalidation flip.
>   		// The qual_row_bw is zero if HostVM is possible and only non-zero and equal to row_bw(i) if immediate flip is not allowed for that pipe.
> @@ -7163,13 +7163,13 @@ static unsigned int get_qos_param_index(unsigned long uclk_freq_khz, const struc
>   static unsigned int get_active_min_uclk_dpm_index(unsigned long uclk_freq_khz, const struct dml2_soc_state_table *clk_table)
>   {
>   	unsigned int i;
> -	bool clk_entry_found = 0;
> +	bool clk_entry_found = false;
>   
>   	for (i = 0; i < clk_table->uclk.num_clk_values; i++) {
>   		dml2_printf("DML::%s: clk_table.uclk.clk_values_khz[%d] = %d\n", __func__, i, clk_table->uclk.clk_values_khz[i]);
>   
>   		if (uclk_freq_khz == clk_table->uclk.clk_values_khz[i]) {
> -			clk_entry_found = 1;
> +			clk_entry_found = true;
>   			break;
>   		}
>   	}
> @@ -8502,7 +8502,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
>   
>   	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
>   		double line_time_us = (double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
> -		bool cursor_not_enough_urgent_latency_hiding = 0;
> +		bool cursor_not_enough_urgent_latency_hiding = false;
>   
>   		if (display_cfg->plane_descriptors[k].cursor.num_cursors > 0) {
>   			calculate_cursor_req_attributes(
> @@ -11097,7 +11097,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
>   		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin);
>   
>   	for (k = 0; k < s->num_active_planes; ++k) {
> -		bool cursor_not_enough_urgent_latency_hiding = 0;
> +		bool cursor_not_enough_urgent_latency_hiding = false;
>   		s->line_times[k] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total /
>   			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
>   
> @@ -12199,10 +12199,10 @@ void dml2_core_calcs_get_dpte_row_height(
>   
>   static bool is_dual_plane(enum dml2_source_format_class source_format)
>   {
> -	bool ret_val = 0;
> +	bool ret_val = false;
>   
>   	if ((source_format == dml2_420_12) || (source_format == dml2_420_8) || (source_format == dml2_420_10) || (source_format == dml2_rgbe_alpha))
> -		ret_val = 1;
> +		ret_val = true;
>   
>   	return ret_val;
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
> index 2504d9c2ec34..215fd80cdc8d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
> @@ -533,13 +533,13 @@ unsigned int dml2_core_utils_get_qos_param_index(unsigned long uclk_freq_khz, co
>   unsigned int dml2_core_utils_get_active_min_uclk_dpm_index(unsigned long uclk_freq_khz, const struct dml2_soc_state_table *clk_table)
>   {
>   	unsigned int i;
> -	bool clk_entry_found = 0;
> +	bool clk_entry_found = false;
>   
>   	for (i = 0; i < clk_table->uclk.num_clk_values; i++) {
>   		dml2_printf("DML::%s: clk_table.uclk.clk_values_khz[%d] = %d\n", __func__, i, clk_table->uclk.clk_values_khz[i]);
>   
>   		if (uclk_freq_khz == clk_table->uclk.clk_values_khz[i]) {
> -			clk_entry_found = 1;
> +			clk_entry_found = true;
>   			break;
>   		}
>   	}
> @@ -555,10 +555,10 @@ unsigned int dml2_core_utils_get_active_min_uclk_dpm_index(unsigned long uclk_fr
>   
>   bool dml2_core_utils_is_dual_plane(enum dml2_source_format_class source_format)
>   {
> -	bool ret_val = 0;
> +	bool ret_val = false;
>   
>   	if (dml2_core_utils_is_420(source_format) || dml2_core_utils_is_422_planar(source_format) || (source_format == dml2_rgbe_alpha))
> -		ret_val = 1;
> +		ret_val = true;
>   
>   	return ret_val;
>   }

