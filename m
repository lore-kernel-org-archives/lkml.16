Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B623F406
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744246; cv=fail; b=UgE+aHL9Bv5mABYOwD1SljAQQOMgLWRTLBxraeQG8ZtpsCquc0L4Vq9055FQkmU7uyExo/UqU1ZLDIViTpLclzBv3L+TaN4GZUAUpEn3vYm0U5TEXIB3C5iQM0ZQ3gpQZyIt0m87ctrK5T+2XJ17WOsPNAHMMJAWS+9yfhHbGwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744246; c=relaxed/simple;
	bh=ftQnLnrNuwyrm80EgemhOXdgM9ELxulI/9Vsq2LdGtg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f3XUQW5C2p7Ed7oRQWQ4O1cSx3fWqEuNJeU89ZFrlBNhI051PucXqO72SgfktyHIfv35nZ8LBsNK90n9FecxyllJC4j/JnmeDqeZGlG9EvZU0NaudUmUwIXdKElSRheCFMLjnm0RzglVSy7ndHQLqzNtYmI7db1QYMXy9eqAs1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pEv7fcEE; arc=fail smtp.client-ip=40.107.100.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pEv7fcEE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llUCNNOXJYYvL3qY5VnRzj6Z5AS+M2Ipf9vVAutFLL/WjqaF7tRrXXxjgQO2LCgH53roVDqjnjQ9ron9kPxaMRsp2WMQTiDdjMbUwO7bB89TUmPiZgaDgTr4aYyAfEYNrt2ZoW1eaqUc5XDw/A/aJhTVEpnYmtdMCQt9s3UtrN/kgRq+l47I+VbtvlmUe6TqnK8CNhDn6hI9nBJvA0ydu5Pksv+tTOZ7h7FpDMfGvvJGXtgIVQQhenOHYuRTtb/i8mhMMJGuPjwW7iGTovv/v6Eo/7XxqlWPeWpg32JKQsDjLW3XIABpaXu+z/IeJFV7camotHg/Dekkl9i1epq2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrS3t0xlBFHEXs5TIKsSRbgRmIyznCWMZyMhK05thIw=;
 b=oCFaj9TcWCGQR6yWL57JUG0vFtan1neAK4fFqhDI5ocDkgxUVAz85NUmkn+kIzBupWjrzwzkBvGEYQzqN1PN/NM4xFG8vcELmrnzZydXF7MXgk6Wx7HVyS0r/ia6ZHGcI3NsVvrwFhA84dH+P4jxvuQ5D4Kic662WOP93qym5m6HUm+boXy1xcyby3XNCJzxwbAw2DWtdTrq6v0VSr6wJnY3eMkyG8RBzWsD2qjfZQ+f9VnwOCKLL0X8u77RQ/iCdLDYunRmMaWtJ+Mri3ya+EWALcZM+koC1WUOxsdbYygYlNeNslOIfppmUxIcsvoUAD1se2qI/dBZr1HIlp4GJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrS3t0xlBFHEXs5TIKsSRbgRmIyznCWMZyMhK05thIw=;
 b=pEv7fcEEnTbuhlZustNogi+wGSWnvi3lTegFNiE1KQc81hdpvHhNgehrWAbNVY4RF0x6YLjbmDME89J5KXtpZFRHS58T4nB9wFuiS3EzxyVcDGDESnC9SaHIgOys+UX7rQgbVo7mFP3yKv1v5Rlbll9qt8nlPB592ATXNckyd6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by DS0PR12MB7629.namprd12.prod.outlook.com (2603:10b6:8:13e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 15 Apr
 2025 19:10:42 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 19:10:42 +0000
Message-ID: <88201f49-5302-4a99-9eaa-12fe433e0999@amd.com>
Date: Wed, 16 Apr 2025 00:40:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] mm/vmalloc: optimize function vm_unmap_aliases()
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-kernel@vger.kernel.org
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-5-bhe@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250415023952.27850-5-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0036.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::6) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|DS0PR12MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e284c9-225c-412b-2f36-08dd7c513744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckZFUERIakxuYlV0YnVXZlFseGVXZ2M5U1o1Wlg4NTFNY09HZFcyRUNodDU5?=
 =?utf-8?B?TGRBamFtNSsyVFpaQ1kzS1gyZzRrQU83SSs4bmt0WnpwVUwxN0dvR3RGQXE4?=
 =?utf-8?B?VkV4UHRJOWk0YlpTYVlUakNjZmhEWEg4R2tkTExGY1VsWUpHODZKWDlxa1Bz?=
 =?utf-8?B?d1Ztd2pFejFwb0pVaHU1NjNIbzhuWFF1M2xQMmRCTUc0WmVabldsQTFlSXJJ?=
 =?utf-8?B?NlVYelpoTERraUFRYjhTUWxpRXRPMmNrSWlGcGFOOWZ0L3FxRlU0ODZzYkJF?=
 =?utf-8?B?L3lqLzNtS2JlLytJRWhUcHJTUUttbWV1SndDejlOLy9BMnQzcW5td2tyOWVB?=
 =?utf-8?B?Z0xXbk9McnRDMktYVmNZdUEyVlhUSld2VGlJeS9tK0l4N2VQSnAvRHpuMzBu?=
 =?utf-8?B?eS9CcGNtMDkwNTBiMkl3Z2lSd2NVVi8vQStlcU45V0tSenZTT0FKZEJQUGdp?=
 =?utf-8?B?Y3BMdkZvWW44MCs0M05CVFpEM1FDeHlhZ25xK0RlU2VOK3VGN00xSlo4Z1k3?=
 =?utf-8?B?SVZmaVBmSGU3OUNXYUVpUG5sd2Y5bFhoeHphOVo5bHJJODlIWDNqLzJaVjJZ?=
 =?utf-8?B?UkRia0oxam5LYXMwSktMZFdpN3N3bjRYOWlrbXpFbU5oM3UzTmtaUWlOeFFy?=
 =?utf-8?B?YzNQMjdGYnI3ZWhjc3AyWitDdVZZN01nTWI5d2tidGRBZDN6NXp5a25ETmZt?=
 =?utf-8?B?b0lDSTRTejJXMndsL3hwMTNiRmVoUG1WTFdZTmFIVSt0WTVXUElnbFc3TjBO?=
 =?utf-8?B?YWFoWCtyTHJNcmlpTmduOUxJM3hMQXp2bHpCaGl5N09WOVJXb2g4SXUzdHpO?=
 =?utf-8?B?Ry9nQ08rZHppVlJsMU0yVXVNODZEZ0wrTzBlRWpxQVkvQ2pCTXhyQjFkRFQ2?=
 =?utf-8?B?N2ZjdU51aC9FVC9YY0VaYTN5Q1pKVnhtMUl4RWpRTGV2UmVsbVdkRUN6azcz?=
 =?utf-8?B?MDNzK1htekxyaGdvaWR4eUFjZ1laN3drUXVaOEhqVzVma216UDZ0SDc5aW5L?=
 =?utf-8?B?bUd5ZkJlZ0FEaytmTUZvajRSbVV5c2poSFJ6ZFVWVkEvWng4RWdtWkg2MnFV?=
 =?utf-8?B?LzJuSHIxRGxtM0h0dSszTmlDVXY3OEJQb0kvT01KekdZeE44WDU0cm16Yzhq?=
 =?utf-8?B?VnFQQXhDQTRQTHBZTXVRdmQxM1ZZb1NSK3Z3SjhKanY5eTNTbXUrOHhBRkJ4?=
 =?utf-8?B?T0JvdFd1RW5neWprNlpTbndTbTBzbllwYk9WYU9Kc2JTTC81dThWZTluMGlw?=
 =?utf-8?B?dktQQjFLQ1dMZ0NzcStNSGVvMVhVWEgzOXg0ZW5XV25PdG9CTCt6dFY4WlZn?=
 =?utf-8?B?NXlRYjU2N25QNEw4cklHcWc1Wk5la0N3SlNOYy9mY3BlanE0NUZBTXNTZkxN?=
 =?utf-8?B?T1JWZUFKejdVeVpvbDZwOUt2T2ZDbWtLV1JvK1ZXRHh3bk9mR1hoZWZWeFZC?=
 =?utf-8?B?S2dzY1pjWEhtSVdRamsyZlNvMThaSG81bXNTTU5vWkxMZHZJSmFMbzF0MHdY?=
 =?utf-8?B?K05ISHdINmIrNEZsTlFkWUVPR29oSld4RWo1dFJlV2NJMzRENmc2MHk1Nm1M?=
 =?utf-8?B?Z0dIM1BlenI4L3VqRkVDRVVxRVJKdWdxalk3K1NJaGkyazFSZERyd1orZkQy?=
 =?utf-8?B?bkxJSEFXZnl2ZWJYbm5RZDdCUmMxMTBCMUZ1dDgrK2ozU0twU2hUQzZ2bGZh?=
 =?utf-8?B?TXEwZ054aFpFcUM5UG5YVzZuZnhnQ1BSemh0ekdOcklDZXgrUHpYNUh1NFdI?=
 =?utf-8?B?Z25wTUJQdE9uc0RyMzFvUXV3OXpPb3JKOE8rRll3Nklhb09sdUE3WW1RbnVY?=
 =?utf-8?B?WU1EaXpqd2w3ZEJOMjlIZ1ZqeTRselNHQklORHpJR1BXRXNlYmxSTVdXNU9V?=
 =?utf-8?B?bTJ5SFN2eTI0NkpZRi9QMURMSWxLb0RXWktDTTIzWVNuSjdBUW1vejhIU0Vp?=
 =?utf-8?Q?PPwOYE9oVzg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STNDNlRuRCtvREJGMlIzeSttSG1sVGlSaEZ4cFk2ZWpNNzY2VlJsc0xmWWRC?=
 =?utf-8?B?U0ZmSXMyVnovZEtMQ3hRbHJKUkpyZzFrYTZBNUtKVEtGZCtOZG9XNTY4RVN3?=
 =?utf-8?B?Z05VL0l0TFJQR1dGK3llTzJYOFBOWkVsVlJ3Sk1DTFU3aE1qTzZFV05hTVdh?=
 =?utf-8?B?S0pzbTJEZ0d6R3UySzZQajNmcG5hdjRLZzcxQzNENzd0OGx1cjJvN1dmZi94?=
 =?utf-8?B?N215MjhmUzBMTWlZdExob1lsV3AvdFB1SElSczc4emJyR3dQdDRoVEpoS0x3?=
 =?utf-8?B?RjhUaHhyVFE2OGw3aXR0UlM4bkpxYlpvY0pNb1lhZUpaNmVXQ0FwbzdUWlZ1?=
 =?utf-8?B?VHE3ZzBrVFB1L0pmT3J2MmxQNW1ka3dxbkVGVHdGTHR4ZXlTcTVtcE5hZm5K?=
 =?utf-8?B?SVhzMlFiMnhLODZhcUJ6VGEyNlNkeEhsaTlSU1BZeXpmZ3Zwc3ZKSEs2NGIy?=
 =?utf-8?B?eUN0N2dJUnV2Q0piYkM5WlpsRVlvZnlabEV5ZC9zRlJBci8xOVFJYldnVVVB?=
 =?utf-8?B?M1hKUHVsQTY0cG50c3I4Y0E4cXNrYUtsSXcwcFIzSFA2R0pCSG0yc0FORkZS?=
 =?utf-8?B?anpqSitsbmw2czFEeEY4U3QxdlR6STBmbzNPcEJLd0txaHphck15c29HT3dN?=
 =?utf-8?B?MkxyblRCV2IzZVVUTTM4TmlLNDN1NDVFcHk5dmZiRkxYZmFISy9kZFNXOUdO?=
 =?utf-8?B?Z0pLNURidmNFdUlNQ3hNcVRiVERuc25rSlhtUmtZUGRJcGFJejlUMHQ0dlI1?=
 =?utf-8?B?aDRSNTlEclFLeTZOQk0xbE9JMmpvQnNtSEwybXV1NS8zVTUxSmNkbDFqMUVu?=
 =?utf-8?B?R1dTRC82VTZidFRJQU42R0lHN1VoNXIzQkJmL0FzcHFyd3dHUTltbXEzVjB6?=
 =?utf-8?B?MUowZ3lrMXI3TzhGUUZBYkhpL1dSVmoza2F2TmpHSm9iM1RHdDl4aUN4UHNC?=
 =?utf-8?B?MklsSUl1TTBYNkdjY3F0d29WVW8xdlVDWk9XeW1jSVcwbXZQdGNLR1VSWWNx?=
 =?utf-8?B?NnRGVC95djByVTV1ejBIYmN0N2Z0VlcyR2d5aHNXeHpFa2tnYXQzSU1wU1Uz?=
 =?utf-8?B?RVJSNEthSFB4ekdOblFzdzhXWmMzVU5vY3ExaDExc1BYWFJGT2hNTlE5YU85?=
 =?utf-8?B?QzdrNVF2eXBnZkdEUjJ0OWdKVDBHZURndkZtSi9ORnRoRWRyRmNZNTJCUEhK?=
 =?utf-8?B?eUlDdjRuaDM0NWhVbFNrTk1JaHFJWTcrUjhjSi8yUGZlbTFaenVzd3BQdEdH?=
 =?utf-8?B?RzF4dUJkNHdBOHdudTdaM1BZTFlxMW9xSnIxOHJhQjRZdkJGdEVBSlFvU2Ix?=
 =?utf-8?B?K1lPU3d5LzJGaUpTeC9kOUZRbjZlaTlXUTZzR2x1VWdQdXY3OWF2clB2SDBK?=
 =?utf-8?B?SEdPSXhGcUJ0SklwT2ZKMm1FV3VCU2tnUncrTndvbUxGUEViRU1WdlRIMnFD?=
 =?utf-8?B?V05RMnZHOUMvdEwwZXZRL0I2cGswd0ZiMUJyY0gwMjdGdHhSZFhOZWQ0U1dZ?=
 =?utf-8?B?WnVUbmYzUVFpbGQ3clB5K3VOOWVqSTF2NUducWVTWUdZdmFncG05UkpSKzZt?=
 =?utf-8?B?TEdPYkF4MGE2RGVmSHcxQTI0TVNTNFAxUkJGOVJSWEVIaGpXV3Y4Ynp1Qy9p?=
 =?utf-8?B?Q0NZWXl5aW1VV1FQVXJIK2xvVW1SSlE3NFF3OVZ6UERCRXkxVElmTEpBeU5L?=
 =?utf-8?B?UGJoT1YxUGoyS0FjaHkyUGhLc245YzA1ckxod1dGWUtlUmIzVngzaUpwakgw?=
 =?utf-8?B?THEvdXloT0JsbWRHSVNibU40d3ZpSVJoZXQxOVN1dVI5bFlET0lUSFNPanRL?=
 =?utf-8?B?MDg4WTNPUFMrOS9zNTkxSXRWYVlja1dQS3FLbnRuTTBoTkV6TlVDWkttRXZJ?=
 =?utf-8?B?S1hXZ2daMXkwQm1lckgvR0JkeXZmQWZpTjdscklwOHNaM1haZGhXS1dNYWRD?=
 =?utf-8?B?MkNDM1MyWXpJL1VpaUtFaURzRjY3NysxL1orSFZVQ1FtQmNycXV4bVRsRG9W?=
 =?utf-8?B?Nml6bTN6bVFNd01VMHI4dDVOTkgvMFJEaXlpYW1odTdLL1J2c1l5bkpURTZj?=
 =?utf-8?B?M2xQakZwZGhUVWtxRTBTRGpkV0JvWmZjeURPRDhEZS9vNElGNFg3aHJaY2hL?=
 =?utf-8?Q?KE2hKwBiSOYrKzgq1Gn2GM4hj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e284c9-225c-412b-2f36-08dd7c513744
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 19:10:42.1747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zix4dRM6jckJVrq4HPM/k2uLrOm+lNt11vo4AJLseeVleHgL7cc2xUdUEDS3D7fAf5iIPzkCqOu6HLRRu5HJnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7629

On 4/15/2025 8:09 AM, Baoquan He wrote:
> Remove unneeded local variables and replace them with values.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bf735c890878..3f38a232663b 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2930,10 +2930,7 @@ static void _vm_unmap_aliases(unsigned long start, unsigned long end, int flush)
>   */
>  void vm_unmap_aliases(void)
>  {
> -	unsigned long start = ULONG_MAX, end = 0;
> -	int flush = 0;
> -
> -	_vm_unmap_aliases(start, end, flush);
> +	_vm_unmap_aliases(ULONG_MAX, 0, 0);
>  }
>  EXPORT_SYMBOL_GPL(vm_unmap_aliases);
>  

Reviewed-by: Shivank Garg <shivankg@amd.com>
Tested-by: Shivank Garg <shivankg@amd.com>
