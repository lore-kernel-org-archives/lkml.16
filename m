Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFA25D1E6;
	Mon,  5 May 2025 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459481; cv=fail; b=GhjA0XPDfv7S/uSH7M5CXniQF9p0INfQ/HqrNkPchq75SyBDczlti97L5D6VCOo42jIcLDq5eA6v/8CjsFSBKf1jkceP81TLy7CWOVUrYa7Qjt+8q0jrlDmCw32nNh8zq57GeIDJzYPcsuwToSrHZQKpTunnW/gTRkeRIjT83u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459481; c=relaxed/simple;
	bh=VtMGr95hJB+cJAZCy1ZF8/xbL/SLz79blT8LAnl4mFo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cwwiohvOu5GMR/rJw04VXARRAUFStjvVmeqXPwq0PobRgqgKKMIvDyQ1TJwKvqZoM8gDQn9JNkvrnZSKYKCiZPVRIRDyKgCzqG9VjCnxPLi7BXNyxs68DblukJcgPZP7suU3WhXqt4PSP8RF4ZFMKkK2G1gfhPbw7dVnS+2Hr50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EUq3YvFi; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EUq3YvFi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDSoktBOYRkOcitAyKrfQyXjWRMZ3/yHYRrevLzrv/b68Cbd40tdZ7bAzh7nLwe6m6vf50volq3+rhMk6yQz6S+SmqhYxqturl38x7jd8RFmapxxXEWXh8q/q8NBhPI5WM9toTGuaSGU7B56tdRN6ol6fnLt051eOectHgvj9V9rCUGes2n6XxBlhEoPldvZoykWDxlppFkcvP5imcod2+ju4zXNDu5b86tdvd/QsuFuDqmkE70IOZCQjjmPk2FwJIhHj6H1Orsu675yQ8F96rzh+clk6GDKQG8n+bphqjlHRELf+3a5828F7ASzlEnZvsCTL+vV3ks5iLwhRQI8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mu1NA3h4knWh1jGU0UgUIJlILw+t532P6Q6Q7zrfePI=;
 b=lD6BkmmgQcmCU1QqXbmca5nPeri6OPZlNx3c/hUbWS3hU6UwJ8RIJkYrwMj9Z2KQw0ymFE6Pikt/ELZMVZeNVZIyfaUYG5TQ6/4/AMI3T8GP7NVmcABFYyMKRJHnRIdP14b+PGRlrbca5cXcsbSVbAq9d9J+fqlln4tNZg+ByFxsiHnFb1t9btU1GpQa5vgj9zeyaKX8qcR5uwAvkCoLWGy+tiCPkm0anvyma9QGH72j8mD1NnZ70pvfJSW5fD8S6t13CJAJGSCvze1e12KhYqorSE83FQ8MnpFX8ptszH5N8300f1dpdMgEQ+qtEFobKJ4N5JPaUNyg7LTIQ1plwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mu1NA3h4knWh1jGU0UgUIJlILw+t532P6Q6Q7zrfePI=;
 b=EUq3YvFi0nTLOj7jzgIQ7cIhMGFQ5CZkVlCP1uMYKn5fJYaIppLiXKg+Qm3UDJ6txK+pUY5k5phbUOIVh+UeQwCPkFFOLa6pOhCfbakC/oInhKANj8RJNy7/n5RhGx0rRjkUy73ju7dB4Gf/2hcukVNOAgm27TGnc/I++R+8fCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 15:37:56 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 15:37:56 +0000
Message-ID: <b1f8a874-2ca8-430f-99f6-2d7b3238fa1f@amd.com>
Date: Mon, 5 May 2025 11:37:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Hans de Goede <hdegoede@redhat.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, W_Armin@gmx.de,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250503002448.3753937-1-pratap.nirujogi@amd.com>
 <599f5f0a-0aa7-4973-a16f-bb88889859fb@redhat.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <599f5f0a-0aa7-4973-a16f-bb88889859fb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0301.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::10) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|BY5PR12MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6b7e46-9baf-4633-77c6-08dd8beacea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0dVSnZiaFB0d1Y5VDNSbk11WTJPelFuZXBEa0hZN2FXMFZFUnFkNUJuN2c1?=
 =?utf-8?B?YitaZ0h6MkhiSllXL1RLcmpnQWJlWnlUNFQ1Zm04d0gzaTJoQWVyanRZY1Iz?=
 =?utf-8?B?Zjg2VkQxUkJKUFdPSEhmWElGNm9qc3RRSFlTRDNmMFRzZkU5NG9zMitQMXRE?=
 =?utf-8?B?bU1paWoxdUl0U1ZQNEtqZXljSFdiSjI0MDNOQytHdFVZMWJXazE2ekJGR000?=
 =?utf-8?B?aDlGN0lzWFhDRE44b2NJbHRmbzZEV29Jc1hmeXRzbGozbWwycTMwbnlzQVU2?=
 =?utf-8?B?RGJzZDB3enhrczRUS0JJMmJsMVcya05pdDA1YmY2ckQ0SGYvaThUYTFWQkFC?=
 =?utf-8?B?SWN1K3llc3pncHN2M0pXTVFJT2x1S0szdnlCdUtQNEFlbEMzUGlGaUpJZGRS?=
 =?utf-8?B?dzNjQjRHM21QVmxqMlF1N1QwNWRmVEhVd1hzQVIzbjgzUUZsK0UvNHUwWGVo?=
 =?utf-8?B?UGw0K1g4bExsSURCYnZvN2pNTWM4cTJrbVkyRkVMV1Z6OVUzdE9pcGI4Vm8r?=
 =?utf-8?B?SnU3eVd3dWUxSm43K0QwS3FPUi9aRFNOdnhuZTd1ZThSS3BDRTRhZWtSemxD?=
 =?utf-8?B?MUJwSFVKYmxrRGFKOWxvWlBwbWw1c2RiWHBkeXIxd2xRYlpSeS91aWZ3QW1w?=
 =?utf-8?B?cFVLUlczMG0xV3hWM1NyL3I3czZGU2EvOXM1bER5UkFGMVhJMm5kZlNVanFU?=
 =?utf-8?B?RXNJZDBSMUpVQzhPMElDUnEwRVdiWTJieUQvSW5vb1NzdFVkVDJBN3FVZWF0?=
 =?utf-8?B?SU12cFl1ZVN6TWtPQVhTSWdCc2hGbUtxMkh0YzZHN2ZqSldDSzNLNTFoRGV2?=
 =?utf-8?B?QWlpTGNsNVVSQkRCRk1GOEN1VHdqMUdQYlRkR05kWHpuZE0zbUl1Yk1VaXd6?=
 =?utf-8?B?UWZoRjdSMnZnNFQ0ZXRicUxwcUQ3ZU95NHpUWG14Y3BXMkRHQ2hzbldEOExL?=
 =?utf-8?B?SWtGOVlwY3JjZkR0bk5ERDY0TWo0bHV5TzJPaDZKdVhOMTNZWlhiK3dWZmhH?=
 =?utf-8?B?cStxSnhLdXQwZytYcHE4NzNvSGRaZHZZckpZRWFwaGlWTTBOcGdlRnNlK1B3?=
 =?utf-8?B?c215clNGZVZaWXVleVd1bEJsTUZQM0ZHSUd0RkE5eTZKcUxPdEVocGlBOC9C?=
 =?utf-8?B?Sm9HSlNhd2hOV2tIUUw3YlpkQVJqL1V4eG95QXQ5L242NXc1UStobHE3cUw4?=
 =?utf-8?B?UW9DZjRBZGt3Q3FoeHppOWtuQ09Sd3Ruak1KK0dqeGJrT0pseDMwcHZaYVFN?=
 =?utf-8?B?N040aWpQYWQwUHQwWTQ3eUN3dkh1T0NsbEJ6dHRxZ3BhSGtVb1J2bnBrSTJN?=
 =?utf-8?B?NlA2dm5VY091KzJCdC9teFpsa3hVblVpOHFUQXZpcTJRbDgyeXhFVXl0RkF2?=
 =?utf-8?B?WEI5WGlQdnFTblFKSGxDNnR2dDFPaWlMU2J5R0g0NUNoYy9sOXduK3h4cHBU?=
 =?utf-8?B?dWVJS2IvZUFvOVF6Q0lKQklaYzRLQ3JhN2RBSDFZckhKamdCUDNjT0lFVDBl?=
 =?utf-8?B?Zm0rcDRnMWUwVUppZE40Ky9aYTdiWWc2clhmOHJXeGNaUTNNY0pmekFwWmM2?=
 =?utf-8?B?UzVIR1JIUHVxQWxBdjhDZ1l0cFMxbGpDVDZ3Rm9tRmo1OVlHT1U5V0xvQ00v?=
 =?utf-8?B?R2VwWjhSaW9ZYnRIbkYzUmUvY1NrMmtSTGVDTGxicFp2d3NUUW5ZSzdZT0lk?=
 =?utf-8?B?RG9NZTlqVUVVYTd6bUs2STIxWUZiUTB0dFlLWTZ3OGE4SmdCeDlHbmNZRmph?=
 =?utf-8?B?Sm9VUGl0OHMvM2lOVTNEMm5WbmhJQUhTTnlydjhlQ3Z6S2JsWElYbGw5Y3dj?=
 =?utf-8?B?aVlxZ1RjZitTR24rbVlGMm5jN1JZbXJnQVdUTDh0UDNmd3VrYlQ1L0VpSU9E?=
 =?utf-8?B?UEhNRkJFNWQ0MThjRUl2bmpRdXZadE9tVU5kMzEwQXd4YWNiVml6NUxGWGp5?=
 =?utf-8?Q?Pkj2QCo80v4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnQzK1pjV2JhZVd0a09rcHk2SGlzM0MzN21kNTJaSm13ckJST2E4YkQxVDVi?=
 =?utf-8?B?d0cyY29VRENQeEY3RW50d3IzNnN3UFpsVWE4SHI3bTZxNnRJVk80RkxRK3lM?=
 =?utf-8?B?QVFkemo5bE10TlVxTzNON0ZEdnI4RWw2VEpNWUh1WlhSM1NVVUk1cndHTlRZ?=
 =?utf-8?B?U0ZqaVc0TlhMVWpCajFlYnVEd3E1YUZIYUdoR0U0ZEhqQm52TnZuVWVEL3hY?=
 =?utf-8?B?bFBtSTlYTWs2aVh6QTFaNVRVNnZmS3JNOXlyZ2Q3K2xaMW5SeGkrdXVCa2pm?=
 =?utf-8?B?UVIxMDEyMmZPaVlpb0t1ZWxqd1V4NDBxYmdlT0dBczZQUkp3MlBCRnEzV294?=
 =?utf-8?B?NVBOZUpYRHJyVVFaRzVoVFp6ZFg1eXFPUXRFYm1GcVdGeEh3UG1uT1pKemxq?=
 =?utf-8?B?ZnlVYUJNMWdIRG9JdVZYYnhYRnVDVmhvUkE4SitRdzAzNzVkZHRObjRpQ3RD?=
 =?utf-8?B?eFF2Tk8rUjAvQU1IODdIZ3pYUlNqZWR4blFPU0RFN1BVZTdicTZpdllTUGFZ?=
 =?utf-8?B?bWNXaS9OMGVTNmpSK2lGVmhEcUdhSzV6RUxYeTlTYkZ5Q3VGM2tHUWlkUGRW?=
 =?utf-8?B?elFMeU40UStZbW02OUE3UjlCTEJLa1FQcG9jak9tQklRWnpMSGVZTTJTUVd3?=
 =?utf-8?B?T2JPREZXbC9KMjI1citoOTdJaE9Yd1hMZjhjMW5BMFlUazFLV1pOTWV4Nm5J?=
 =?utf-8?B?enhHUGRyeEdlZE82V0toTkFwQjQwaFlMcThLWGh5UWErTVRBQUJIa0RzNDdL?=
 =?utf-8?B?ZlRkZHMyK0NwcGUrWE84Zm53UUc2QldZdEZhSVVNZkZvTTNzODhNZHNrRXJ0?=
 =?utf-8?B?VDliOHVqdUtlL3J1TWJqalNoTVhqWDdJTjVCd3ZjZTBOVE05VGx1OHFDalpF?=
 =?utf-8?B?bEJtTGhHdHN1eWNMUVV1VnFOLzBsTmFNL2Flem9iN09KQjhLd1V4djR4RUc3?=
 =?utf-8?B?ajNrUzNsbXBJRGNNSmU5MkxJVDBNd256T24vTEZreXdKWEo3bEpJS1VSa0VK?=
 =?utf-8?B?VHNKTUpFOG1jemIwSFhtRytSU3pSNDlFMVkyYTZYVXluS3RZS3BkRG1tNWhm?=
 =?utf-8?B?eWREQzdFWld1Vm5yeDVrTUxWclIzVUlZUGZGUTQ3b3hHVlVGZUtTU0RqUzhs?=
 =?utf-8?B?Z3pBRnYrVmVRTUk4eWtJTE45clVLQjhCRHhpUHBEdVhsVlNYTUFmYk9wNldM?=
 =?utf-8?B?bUNWbXFiNkRGeHVHWlNvdDFKMXV5Mi95ZzJpTkpVUExseVVEajBRVE1nc3JQ?=
 =?utf-8?B?VTF6TktuZk8vS2UxeVZxZXdnVnVKOEFPc2NrMFhyR0p5SmpFUFQzcExBQ1pk?=
 =?utf-8?B?MkcvazZFc0JtVjVFK05UbzRwNGh5MUc2RklwRGxhZVdnR2M1SGk3cFVscjR1?=
 =?utf-8?B?bTdwNUdiejhxd3dOQTI3aDY4T0FRQWtIQzdxTG93azFaV0J0bHdoMUxtUnU1?=
 =?utf-8?B?bVF2Q081Ym1SZVFqRU1pQmE4Mjl6bUgwRXpDVzE4Z2hjSWE2NFdTd2prVnh5?=
 =?utf-8?B?ZUpyRmwzM3RXSGRWN0pNMzl0dTc0ckc3dXh3N3BTNUlQNWI1bUNGZjR4UHlJ?=
 =?utf-8?B?R1BDNG9mUnRtbFNQOS9oL3JBeisyY2FmWlRvelJzcUhQWWJyYkszMi82NHMx?=
 =?utf-8?B?dkgrbERsTzV0dGlub0hEV3dxVDNNUnNJemR6emo2VVZYTnhPQktNc1U2SnpC?=
 =?utf-8?B?MnJFelRrNlZGaG1vSnlKY04wZjNrNmZOSDZQcGJJY01BZzZqcW9ZNVRNMXlD?=
 =?utf-8?B?SENXYnlYRU5FZ29YVi9RQU1UMkFQL2VQZUtqVzJMUWFHNXlOdHRjS0dlY1Zx?=
 =?utf-8?B?cU5vOEFlR3N5V2hLNlNHcDA0ejhCYW1yQjJud0VUOGhWU1JFY0hta1E2NU5J?=
 =?utf-8?B?NGpkV3E3TnN3cHlzc3luc1YyamZPeDRHdEpNMlpucEpja1FOQ3o0clIxWWdl?=
 =?utf-8?B?WmRIdUF5VXNhejg4Ny9HWEIrSTVZWktDUXUzVUpucTF0YytJd3ZETVEyNW1V?=
 =?utf-8?B?UXQ1Qkl4aHlheHR5VlJYOHh1WjFVOEl6aU8veUlHRHdGK0hNQ2ZJQjBTZ251?=
 =?utf-8?B?c0lNUlJ0Y05CSHZ2NVJOcXZrOWFDN2RnUGs2eEF6c0Z6YldXR2ttL0NscWFL?=
 =?utf-8?Q?zQbEmsLLUuz+Rgoc+ZukknRN2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6b7e46-9baf-4633-77c6-08dd8beacea3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:37:56.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wX9JqFJDyG2SPipbQ7hsMHSXcpv9DZ0qk0cFbR060WXvI82hI8C+0TArIYtuapes4s+f5Jby31mwcWHYkWpyWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227

Hi Hans,

Thanks very much for your approval, guidance and support. I truly 
appreciate the learning experience.

Thanks,
Pratap

On 5/3/2025 10:40 AM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> On 3-May-25 2:24 AM, Pratap Nirujogi wrote:
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> Thank you for writing a new driver using the new approach
> we discussed a while ago.
> 
> Also thanks to everyone else involved for all the reviews.
> 
> Overall this looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
>> ---
>> Changes v9 -> v10:
>>
>> * Remove i2c_board_info->addr check in instantiate_isp_i2c_client().
>> * Update mutex protection regions as suggested in the review feedback.
>> * Switch to devm_mutex_init() and skip mutex_destroy calls.
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 277 ++++++++++++++++++++++++++++
>>   3 files changed, 289 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index c3e086ea64fc..152a68a470e8 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>          This mechanism will only be activated on platforms that advertise a
>>          need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI
>> +     help
>> +       Platform driver for AMD platforms containing image signal processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp4.
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>   obj-$(CONFIG_AMD_PMF)                += pmf/
>>   obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..336ac3da2041
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,277 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properties
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     struct i2c_board_info board_info;
>> +     struct notifier_block i2c_nb;
>> +     struct i2c_client *i2c_dev;
>> +     struct mutex lock; /* protects i2c client creation */
>> +};
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] = {
>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] = {
>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +#define NUM_SW_NODES 5
>> +
>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &ov05c10->board_info;
>> +     struct i2c_client *i2c_dev;
>> +
>> +     guard(mutex)(&ov05c10->lock);
>> +
>> +     if (ov05c10->i2c_dev)
>> +             return;
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (IS_ERR(i2c_dev)) {
>> +             dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
>> +             return;
>> +     }
>> +     ov05c10->i2c_dev = i2c_dev;
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct amdisp_platform, i2c_nb);
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +
>> +             scoped_guard(mutex, &ov05c10->lock) {
>> +                     if (ov05c10->i2c_dev == client) {
>> +                             dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
>> +                             ov05c10->i2c_dev = NULL;
>> +                     }
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(struct device *dev)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     int ret;
>> +
>> +     isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     devm_mutex_init(dev, &isp_ov05c10->lock);
>> +     isp_ov05c10->board_info.dev_name = "ov05c10";
>> +     strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
>> +     isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
>> +
>> +     ret = software_node_register_node_group(ov05c10_nodes);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     isp_ov05c10->board_info.swnode = ov05c10_nodes[0];
>> +
>> +     return isp_ov05c10;
>> +}
>> +
>> +static int try_to_instantiate_i2c_client(struct device *dev, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = (struct amdisp_platform *)data;
>> +     struct i2c_adapter *adap = i2c_verify_adapter(dev);
>> +
>> +     if (!ov05c10 || !adap)
>> +             return 0;
>> +     if (!adap->owner)
>> +             return 0;
>> +
>> +     if (is_isp_i2c_adapter(adap))
>> +             instantiate_isp_i2c_client(ov05c10, adap);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10;
>> +     int ret;
>> +
>> +     ov05c10 = prepare_amdisp_platform(&pdev->dev);
>> +     if (IS_ERR(ov05c10))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>> +                                  "failed to prepare AMD ISP platform fwnode\n");
>> +
>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     if (ret)
>> +             goto error_unregister_sw_node;
>> +
>> +     /* check if adapter is already registered and create i2c client instance */
>> +     i2c_for_each_dev((void *)ov05c10, try_to_instantiate_i2c_client);
>> +
>> +     platform_set_drvdata(pdev, ov05c10);
>> +     return 0;
>> +
>> +error_unregister_sw_node:
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     i2c_unregister_device(ov05c10->i2c_dev);
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");
> 

