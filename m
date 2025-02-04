Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0822066F8;
	Tue,  4 Feb 2025 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658524; cv=fail; b=ANhCiSFDY1G+EDi+iAIPQlKbPP2/O29LU5n1NQTUTazablijQ92ApPBh9YE+EGQpPf5jeNTQv1oggViYZy9lDAzcMSzyYCrbIPtYzFCpY/gtUxLSvLW88rOETR/aKd2do0/oSawuL4360m1qfaM/+FfuiokLDieDvGCMnRo32K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658524; c=relaxed/simple;
	bh=lXEEK81BDUhgXOMi6WwMNy+vEGQFf5iZHOtyWCFCElI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M+BE/b9i4M0aCn5PnSG7RqLS6kAWCRfCzKEQlzKMDJL/Yw06DR0fDg/TOQBBRCMhk1zwQ0/pkJrIyg1G9POf0aElhjbI7jDYznurPRzd1j9BZ2S+jOVwC/8nYBRMwXjA1952p1/jkf4pFJaOLrazOiNSlaft82Cjsn0efWxtrCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LPKlA1ld; arc=fail smtp.client-ip=40.107.92.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LPKlA1ld"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MU92lpFLNPI6tUTan09GiDNVsDjR1mhaaUplwnCyo1IlOc4OBN0R9Eepeoe9snaNuXmt5Rup+ACFhNO/oG8v5s41s9SrSPwC/0FkrgKdWIJ6GHmdvy1CI286MHX3nO1ZwJj15kESLI1bSqg1jaZrsQ6xqjbwJuRWyw39hoX1Z6JrMAKBXKOLKcUXrHaMQfFHL1Xjm2RCRjzH5b1A5xs2O53nZisH7sETaXAcVOcvfeFF0XQgxHxhgrTX95NiQv9n2NqQmOP3hHnjxw0lnRk6yCFPOEHjtsR3ztOW1jfUNUcyrWluaHQKev3mQEHKrQiDeabJe+/Uii01RfMck8pD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5T+MHeyYbo/Y3RHzPMwNiiEeC+sO0GGMuEGHst8XbE=;
 b=XdOKPXu96Swlh+s9DXpdRaJU99Mx/RdFvbfDXztwZJj7+SMTnUdCN6Nv9whPk2wQ95+vDrYOFOahOyCfMmBv9wST/EajEyYXnhppExbReIoTtyn+u/EMgPSQs7Qsd50vcxjI5+qtjfg8lUl5FNX8nDT9fB0UvtijiXstkiaXtUq91XlIK8MgPWYDLhiUnaCFpy+2eaAUHUu5Sb64JJJYJaxM3XWUPBlGk/hcxCkaUukgS8WYqkudGLm44/aUVNKB3upFnWb/DQiCOfDKPBTC44SSIsjrbFlCRpjc/26EFy+T7XhM1eXuyIlggyOg4hGKeR0v5RmUDkluYnl6qy0Q1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5T+MHeyYbo/Y3RHzPMwNiiEeC+sO0GGMuEGHst8XbE=;
 b=LPKlA1ldPNnuUxQf8DAIGIi+iUpJR/EnstRqiD268QNi4+EYQZ4AUFMHVZBlZakvJd0FSIccbHA00yn2Uzxbg7R6Pf//jBpjP6kujZgEhLee87v0eB6bxyedN3i/PzmbYTUE5woJf6MW1xkrgTHSpv42o23rW0nXBdANeJocwkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 08:42:00 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%3]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 08:42:00 +0000
Message-ID: <29724b4a-dc1d-416e-b8d5-11e85cdf7a85@amd.com>
Date: Tue, 4 Feb 2025 09:41:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: arasan,nand-controller: Ensure all
 properties are defined
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250203213042.12657-1-robh@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20250203213042.12657-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0177.eurprd09.prod.outlook.com
 (2603:10a6:800:120::31) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: c557cf44-8b60-497a-b2fb-08dd44f7ca60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0xKZ20xQk05RXphZnNDUVcyUk93RFR4UUhXMUh3cXd3NkRzem9YZ01VRUo4?=
 =?utf-8?B?Z3F3bjFxd1B4eEVZQUlMV0lrbGh6L2YzVVBQbjVxVkU2Nm1veDJsc2JJN0Q3?=
 =?utf-8?B?VnEzZVRMMnVXbU1zb1MvTWpabTNFSitvZzlPdklYOE5LY1FNN20rb3NWSEhC?=
 =?utf-8?B?SlVNd245aXZ1bnZoTVhFOFYvNzFnWHZoRzgyaUNSTWVSOGMzV0gzZWl4QThR?=
 =?utf-8?B?MzJXU3hJTWozMUZsNWx2bEEvRjVPZ0tpdnRSeElESWxab3UxMTdjdVVMU1kv?=
 =?utf-8?B?VzVKaW9uNDlrOUdZMllmSjJHaFhYTkRNdmtKZjBOQmFqcjJnV1ZMSCtWdURV?=
 =?utf-8?B?aHQwdDgxY2VPeGg3MzAzZVc1Q09ucVFmTzdyNEFRa3ZKdTl5Rmlia0hkWE45?=
 =?utf-8?B?cUUzU04wZ0d0OTR2Y01BbWxodld5TlM4cldEUFI3R1V5ZGdtMkZHNTEwaTZz?=
 =?utf-8?B?YTFSc1NtNmg1K1ZKYW85b2xCOUVobHZNTXZzWVh3QTRnaUNneE5FSmJrUWhG?=
 =?utf-8?B?ZWd6RTVxaWZYZTVtcGloTXVxejlZZE8rMEJOUWQvenBOdnVUSFR1VngzSkxJ?=
 =?utf-8?B?ZVhuZW9sOHNwcG9IWnU5L0RXTGZiZHNPcEU3S0JOWlNKWVVxc3kyVUVCNEFW?=
 =?utf-8?B?K21DWkxyalRrQWFIWkwrVW16TmlINW5JS2lkMkpIN0JrMVUxNm9FeEJjZyti?=
 =?utf-8?B?MHNGQXZYVGp1OEdkT0RXNE53Q0NDcHV6eUFOcXp4VVI3Nk96RUFMTStmVTJ2?=
 =?utf-8?B?cDhGcU8zcXlsTTV4ZnFUZG5OK000ck5JT0ozSnZvSkcvTkFMdDFvU1ZJYUZX?=
 =?utf-8?B?SkoyeUZoMmVITXJKQSs3Rm1OaUF4blhFL3BuZnA1STJUQnFRMy9MVnZQV2JS?=
 =?utf-8?B?MlVXR21ReFhPT29odGo0Wi9hVUY4aVRCQWp6UG9hY0hvcDhnMStNTVMzZXJI?=
 =?utf-8?B?U3BzS3RjWWtCWUM5VEp0WGVBcXlYUjloa3FONGo4MTZ0OGVqVklTa3h0NzVQ?=
 =?utf-8?B?WHBYRXlNUHlReVBpQ3FoeGR3bmE4NTlNWjV6UUI4Nk9JbW9rMWxIc0hRQnFN?=
 =?utf-8?B?RnNjdktmcFMwQVJzdHYyclh1VGdkWFJJQm5KYmp1MWlWaUZBY0p2c1IzZkFy?=
 =?utf-8?B?OURYOHNQcWpFZWo3QlRRN1dOTldRM2w3V3NHUUFEMWorWU1tL2t3YzUzc2NI?=
 =?utf-8?B?LzdEWjBpUloybGI4RHgxNVZlMmlCYUVhUk53Lyt3RTA5TjJWSzE5aHVBS05R?=
 =?utf-8?B?K1dLMHNmQjhEMlh3T3ByWmJmMkkydUkvbmtoR1luZm4zUmkzekVXUUcydDlq?=
 =?utf-8?B?VFcrU3RucFlyU0EzeklOelN2eENLaW5IMUc4RmNobWNGUlYrZVFIeHhZT0N6?=
 =?utf-8?B?UDNTdGMzWGU4N3lKekJ5akVRVXBqSkN5S0VtMGxGaXZCMlpSZGEzZHJxWHFu?=
 =?utf-8?B?dXBmNzhJZ3NMeTlYQ3VXMFpEeEdJNEkrdnZwbGJ0ZlFydkdSeEMvdW91MVJr?=
 =?utf-8?B?cnZoWE1rOFlyclY5QnhzcDMvV3RpbFdLdHRGNzZvSkR6Um5DVTZ6akYvb0I5?=
 =?utf-8?B?TlBEYUlWdytTajM3YmFJV0JnQUNXNGlVOG9saE1xak1nblB5R2tuRSsxdHBY?=
 =?utf-8?B?ZjFMOE0xSWhyd2JxYVFkNkQzeW5ScWI0MDFobmZOWUlMVlNrWVM0VHZyWDJX?=
 =?utf-8?B?U2Jzei82NG0xMitsVXZUYm5WNkljbXY4eTRyL0gyNkt4S0VEYytUVlVzWmh1?=
 =?utf-8?B?OThYZWl3aGlPV3oxMG5IMlMrNzFDSlFwZ3luY3BCaVM5TFg1T0pvR2pXakVM?=
 =?utf-8?B?dElzTHNldVZNMzhJZVc4UUJDS2VLamF5NVU5RktES3lnb2ZDeUNaTVZvVGx4?=
 =?utf-8?Q?bZmtiM6UlLlwF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnpXMmxBTG1EcDRvM2NKS1ZET3dsdnhFbTl0Rlc0TU5iMGVxaVZaY2VmYnVH?=
 =?utf-8?B?Rm1SVnZIOVJhdWNPZU5hcWdWYXZHcXFKeWpTN0o5WnRnU3ZzdHN5UFMyWFdU?=
 =?utf-8?B?cldDbUh5Sk5Pd3NRcG9seldlVTd2MnZxQk41UmRIVlkxYWY3UVFUTWlxaGxW?=
 =?utf-8?B?NDcyWW9ZU0VOVE8reWJNZ1FxNTFJUEpuSUJkTFhiMWJncVJuVnZjYkM4KzBa?=
 =?utf-8?B?eCtkdG9xK2YzMzZtRFdvL1BNWXlsSXA0dTJrYzB5SndPaDI3REsyVDlFam1v?=
 =?utf-8?B?UzlCYW9TTGVYdjZGOTFhQm1Bdjg4cWxqRUUxUjRsZnJzRU1XNnQ0MENOYVZq?=
 =?utf-8?B?eXFZR0p3dnk4MCtKV0xJUll4TzI3YWwyVWZUWDVGUGJXN0hCb2RFWVE2ditQ?=
 =?utf-8?B?YjZjWlc0L3ZtMTJtcVVxNHBVY3FHdDVZWjlBN3BOTHpFbHQyMXJvK3RGQ1Bp?=
 =?utf-8?B?UGpYalgrd3VhekJiTFBZNnZNY2YwS1Z5TXc0eUtoQ3RqQ1ZXV3dLZ0lxTHVO?=
 =?utf-8?B?UGFsc0hqYmNQUVBucDJFd01OSjh3VFgraXVxWG43bGtKRjZ1WEV6VkV6bjd2?=
 =?utf-8?B?a1hsYzNhdW5ESDN5RU1OQWEyUCtDUWF0TlFNcEZVZ2Z2N2Uxd3JUendLcU5R?=
 =?utf-8?B?ZmRaUG1ySHRTU2RHK2s3SFdTM01TWEsvUmhIUUszSlFqL2FYM25vYUI4UmQ3?=
 =?utf-8?B?RXhXMmEwQjI4OXpianNSREdLTkdFbS9zaHVCRWp1S0FLYThlNlNTczN5L3hB?=
 =?utf-8?B?cUl5OXpWdWxVd0NYbWRjZkRnUkhSM3Z0M3V5enBpeVRteXk0amo2TGNObWF3?=
 =?utf-8?B?SjIyaHl6SHh6OWljNW5oMUZITGowa1A2aWpPSjFyWldPVUZYM2xmZHZyTWRG?=
 =?utf-8?B?ZWh2NG1iTThzdGtrakpBNi9wUTNnNXZONGl4MEtkS3lxTzQzQm1CWVBwczBp?=
 =?utf-8?B?TE9vYTNyaGhvMHduZHRKaVBTT0FVeVJ5NGFGazB4OVFQMnpXaUg0MzZIWkxq?=
 =?utf-8?B?dDc4aXNpczJoVjN6TG5lMXVWbjNqSENDY0laQXBSS1djdGFDU21lZHlBa2tQ?=
 =?utf-8?B?VjEvdUM0YmlUNEZoM2ZPTEFxbEY4Mlo2V3lLT2c1Qmw4NFVXQTNmekd1NWR3?=
 =?utf-8?B?QndublZYTUl6WjFSSmIwYWpXMGdjQTNicnU3bElSeTdGbW1ENXBkWG9vN3Zh?=
 =?utf-8?B?VVVqdkl1bjltRXZnR3hoMWhuM0QzUmFmSWh4SmZhK1dIbDMxVjdtNHVxK09O?=
 =?utf-8?B?YXZtY1NGcUdkYTB4Q1ZZTTlneThRNUxTcXZUMEZ5RWZUekp5Q1JIb0xKVzdB?=
 =?utf-8?B?Yk5TYjcwR0hBL3JBY1d5dWxkZ0RHeWV1Z2xXTm9UQzlOVWZBNTFvdWJqQnNr?=
 =?utf-8?B?blQ4RmRDMHFlOG1aN25NR1RVenhuc2hHTE1pN2lXSDBRMGk0UWtPQ3BBSmlz?=
 =?utf-8?B?ZXk3VVRnV0k0TlZmQ3ZWMk85QklxOFhmT3laZGV3SkFLQTgveCtCN3VPWkFT?=
 =?utf-8?B?a285Q3RESXVUNGh2SnNkTWlPbkZsTTkrVXFTcGlCUkpEeGU4NTdxRG9TVjdV?=
 =?utf-8?B?ZDYzQ2h5LzNUZ2pLNExZdmFNT0EwK1ZsUGNmVll1dkdzbHFUcEFNT1ZNTWF1?=
 =?utf-8?B?UVlUa0R0MVZOdEE2WEsrWmxhU0NZU3JRbWFFOXVQc0hpUTFOVE9tcHRiUDJR?=
 =?utf-8?B?aTBJZ2t4Sk1pRTBCQkN4NVYxTGhiUndocXVXcHFLTm9oVGZsSXUvdnd2ZmJT?=
 =?utf-8?B?MFQ1UTNocWw5dXgwVFdNWXJUTzBISUJKdEpndlFGM1YzN2VWUTFtRUlOKzFv?=
 =?utf-8?B?UWxTU3Q0MkxhTHphRUtSN2N5RDBoQ3BzR2VBNUxGWkxLRDhOektHTjJKR0JR?=
 =?utf-8?B?L0NQeUo3ZnNsZjJYclFFWmFxNk9MdFdMT3VtZ1VaY0lNdE5DUExrQzlwKzBY?=
 =?utf-8?B?cDE3TFpMVWZqanRUQjBKOVpISHlmZUt1SHdDb2ZLb3oxbVpFYW9kd2h0czlw?=
 =?utf-8?B?WkhBZm0rSEVnV0VyTGs0RnJ5N04wZjE4NGRYNGdnT1BjdlZxM3hsRGl0UkFL?=
 =?utf-8?B?U21hS1BqendBMmFmUXdZaGc5R3A5NnllLzZldEd3ODdsNGtEWFFRYjQxbUh2?=
 =?utf-8?Q?OKGXNQDEPXgtcv9qucjHnC8zQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c557cf44-8b60-497a-b2fb-08dd44f7ca60
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 08:42:00.1916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23jJm/UTrrPqDWM88zw7olK6G4ESYeChZ1Xk4k/kvEFsllU8CbKSdL2wMkIEoWlE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613



On 2/3/25 22:30, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'unevaluatedProperties: true' allows. Fix this constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../devicetree/bindings/mtd/arasan,nand-controller.yaml         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
> index 15b63bbb82a2..b90d3b48c2f2 100644
> --- a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
> @@ -42,7 +42,7 @@ required:
>     - clock-names
>     - interrupts
>   
> -unevaluatedProperties: true
> +unevaluatedProperties: false
>   
>   examples:
>     - |

Good thing to do. And we should extend binding to cover other properties which 
are missing in description.
Pretty much remove arasan,has-mdma from DTs and describe power-domains and 
num-cs in binding.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
