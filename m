Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF02252283;
	Thu, 22 May 2025 21:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747948339; cv=fail; b=JZBWyBKez/0gCn4NiKG7ZMqVahiJxkL++kzbUKvgWNi+ySFX7qlrHeR2AlW9c1nupsKbAilqoEcCQ/iNVeI0IQD1TlIj0w4XCbqm3q/nJrAPNrSH32Eg6IbcSCgvA+HvXSEkaBJh5WSfV9kT01J+7SESAm8/9XZSJcw8YmJzrNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747948339; c=relaxed/simple;
	bh=KTePNMtxVwjKJt33bbPpj6RiOW3jIlfA7BUjAef6CVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M4fZZDKYrelKHOxG3GA93glcE9C6mawUTjeoUkAtEOvQS6VWVEl/2QSyeuHxYC0nYu7uFBvPkVioR6rquz1NaO8h2WKmBx73RQCtUwe/XnkG7je7E5i4bOoR/BWWvlIo/2NuIdnjobxFpolRd6qYYpbl1nyAG2AML6QRNOPBfq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o3mXWbvW; arc=fail smtp.client-ip=40.107.236.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o3mXWbvW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnBMWL4c5nFr+QIZtVzBeqJ+bJBrfvcvQKq6n+reV7S5XEWCh0TCBuSFiYDFWmViwwH2FCFlTRrJ3QCwIsKUaASaBj8hVOvxep19pVZJxhpPwZr/3Q+Fkxe4DCK57JglQnQPhsOq7tDQh0wKoaC4dWc2NGtluZR3wFc2ucVGzhUTdHqX/qw0Bhtu0zWV7JAd8nNty/QrijGyjesLbE4/8sbIv6Y6afNFTQarNlNmwVqL28lDCZ9PsMIDCkdrnXaJOLJMOYONZo7Vt5lZzByeQcMTAQw9J0T6i1slWNtnDbUWMwwWjFAqqb2sPnviKFsyB8W5XYZC+Rx5vjc4dIkEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxSmPo1RQDIkKtV+VwWhgoGkV6MoVQ22HV/lFwmchiw=;
 b=rU+lf5U5uaV0GpR+C5oD8+rnkCdwJuMdn8/hp+OUzt7GbO77DrXTyg1bKVbdT/cpoS0v6VA8jG7t7p61/U5QmWthAtZILQSuA6JWhujpzbjsjKb4yc88oQaBW+6Q4/evcRGbk4IyyLN2o8QouQm7vCse37KPfYJ00lBiitEGRXGZfLRqxTr8cSlXo+TzoPJZfiyJm8u1cAK7njdnNI1KohPUw2H4lQOhTVF/FLNKp095KOjNg3QSaxI9+3mmvrLitBN5dZo5uhoqWe9Z0WyS6r2yIw6ix+ujmMBHSZjolIKko17f4Akq+lknQV38nWIhZOi0KlYHiauhqJlmCriu2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxSmPo1RQDIkKtV+VwWhgoGkV6MoVQ22HV/lFwmchiw=;
 b=o3mXWbvWEIpkF2DBrPklcC4/xJufzdGxFGKAjH+oOoQrxpsIht24Yq5pb8EWWDpiBDF+dXkxLEqg9/6n1d4UbcW82LJmoGd9hBVd9MbuWPE7ZFMcV3gBpPB3aNgfKqCjQ/78vQIv8yMm+BMM3ebB6vXQ0X8/VyJJebyZIXLVv1kRcwd5dbYwFJVVlB2zaOVAfL+rMEmleRUwLyR6VnORWo81+1C+ObKo5h32XvN7g0sf5f8S11skS/XP6gtew6HQUpyC+nmuxXKqEG1GZ1jcIooJiOafJMIt47PXcsbdMk77QVqQGxhe1s1Ozya1tqb7vfbDjVtNGNB3z4YtmaU8Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by MW4PR12MB6826.namprd12.prod.outlook.com (2603:10b6:303:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 21:12:13 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 21:12:13 +0000
Date: Thu, 22 May 2025 16:12:10 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda_acpi: eliminate defined but not used warnings
Message-ID: <aC-TKm55YkzvG47N@ddadap-lakeline.nvidia.com>
References: <20250522203020.1478369-1-rdunlap@infradead.org>
 <87r00g74ye.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r00g74ye.wl-tiwai@suse.de>
X-ClientProxiedBy: DM6PR14CA0045.namprd14.prod.outlook.com
 (2603:10b6:5:18f::22) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|MW4PR12MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eff0083-95ca-4ae3-f8cd-08dd99755277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QkMFnH1+zTSBC/GDGq/hEbc3dxpy7y3cBt9lLU0eGbUkEfT9s0M69ctQJWup?=
 =?us-ascii?Q?XJtI9xEQJofX1AzqcGMo9759pFj24s4K5H6pVUQ1+IVRMmxjuFK177+q+UxN?=
 =?us-ascii?Q?ssTbQ5JzZSI7U++vgS/e/I1kO/bPfY92NpKpzQs08twjP5fvBDAzJTOK3KiD?=
 =?us-ascii?Q?GkVMhD4rJgPfkf0+rI6WdBjZUanjmrJexWmgNWlbpPOnxaXNAOKn7Nfop/fK?=
 =?us-ascii?Q?wEJXoLj4TtRlzS7RsiV33FyA+zbnNXL9xbgWkvdIBCx8cYPBw2GB4WAIOg/Z?=
 =?us-ascii?Q?q0q4x94ZUL26V2YLNoTwbypz1NpPgPNXRg/HS3F0CHn9jE5W7qg/8ycXbnzu?=
 =?us-ascii?Q?otqyQTw8O0ZTMAPvQVWsGvM2iT7IiL5/HQEUwuXZNHtlY2v+Dbv37TvHULrM?=
 =?us-ascii?Q?SKs4Pmak7iQCSoaxsljhjpx6SbidxHlp9T0yAFW4d397UfJVKqjcxvzwPfcs?=
 =?us-ascii?Q?cDEKLe5M2mUkglunhM8v2402rwC3NF9dOe+m1B2zPt/xHe2qqwgvH9ubQjc8?=
 =?us-ascii?Q?ZSZyA+m1UzijWH06u6CeLDVjgxajIyBRx7L8+iSGMb/uftMl/jiEtvZpMcEp?=
 =?us-ascii?Q?/4JKv6ttrFdVXMB8ptC/5qiHcAyp68s/IBW7LW5N1xsdmcESwj2XBAUZpa04?=
 =?us-ascii?Q?E/MOG1PV9pir1duq4zMg7c2N2pqlzed/mOFtQEnjrWwPEwf6pmfhBquywgEm?=
 =?us-ascii?Q?tnvHqtDjRhAGbYlCLUaEACcFwF/Bae3nK5sXhx1cNIUQjzRRN85JNtTFxpkw?=
 =?us-ascii?Q?zT1VZFCj1XGsEU1XySuWZ2scOLpRbbAE4JKJBu9ZFt2DYw0UtrOIfghxIVGP?=
 =?us-ascii?Q?yo2IeGr0TerFMCb0Nbq7bwyOb87ukSk5VE49s/amlftDjzHOnEfum9egxqNU?=
 =?us-ascii?Q?FQ3gjjBcS8kdOFjm0wkQupFBlkW5Ute9VIqWXzipYekg8DMfybZT7Su8KXQ3?=
 =?us-ascii?Q?879sluTsTECzTlaeBWFPl2WFrjd6y6Z2k1ViVeOVMj09qMQDXmBtNIz3qMAQ?=
 =?us-ascii?Q?wLFgVmwH2mxPlixxmcRhTHrau6fHZzAzk7yx+UC909RVCfH0mU1Av/RYoD/6?=
 =?us-ascii?Q?+MCXqWcKcN7YAY2ww03tpGRZMmnQIvHjJ0i4K0aycGjkSH83JRXaUlFFZ5uS?=
 =?us-ascii?Q?0JnjWPF4PiuYZlkUaHlOJoyHvZ5v/ivN2bfhYxZGxylySWdf+qb9irP4SA3y?=
 =?us-ascii?Q?rW5oPoZsWSY2TVJTi731qDZwnOGmiGYRIZ2ps43Pr0blCex5LIPqzappE18p?=
 =?us-ascii?Q?Kj1MseINuZU5rFiNxPbT35fzH6QA7dUdOzUL6TlYSYW0tdZKrVBf0j9/96s4?=
 =?us-ascii?Q?K9Xus1F8Y0eKYA22zME7zjYIhlow47x87OikszoqiFfY3/CeLz15WdNcnWC0?=
 =?us-ascii?Q?JnX9BTpKYMynSHNHgLI4aZPbY7wVhceFRKV51X35LPNTiKPH86TiNCRcPWbR?=
 =?us-ascii?Q?3NlTyw20rYc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MJYijdPqjLOArBT+eqxbGTFgiK+zuxeNr66Z3IvtQMUpaS9wDpljB7eNyouD?=
 =?us-ascii?Q?/uTRedNuclONDDyArgxNmf2zyAh0b52hTZ4SfNFBwZRMOCZpxeQTLTJIjmi+?=
 =?us-ascii?Q?PoPmLeA01oDsl95JAJRZSRDW/cALc4VKD90QbTSMZZ9AWpF+UomTQJGFvCA1?=
 =?us-ascii?Q?w3NlVRxOfJKlz6cXR5ENVBMps+w7o+I497l63nRgcvFhJ62oUCj5q9MmZKtm?=
 =?us-ascii?Q?AsgbNygwl7pBGRh5BeIQCWv/Hl8mgDwcDA97CnyEPfMPaSMeld4TFrChw8TP?=
 =?us-ascii?Q?6y78Ss9X9I2C9rK2ri9zlvcc36yDCxMHAZHNuxnK4hp1DaXO+q7troAUiz/h?=
 =?us-ascii?Q?47jWlGWxhYN2R0vBDIQbF7y33Xcd7qhHaFVUujAf8EfXlpOc6XfvvP/9ZVRk?=
 =?us-ascii?Q?n86/ebjrc4dPunb3gjgInth0VMBwR9/G4tqy1j72oNyKnPc7b4L5Ghu2sk1R?=
 =?us-ascii?Q?c7KIQrxzkl5vMaGHLTqxnoUPiYr9hSY2kNSKQEZrq/SiHejTCOWULwBQUifz?=
 =?us-ascii?Q?1UX+Uo/zksDOkJyAQXePTOxYgzeC77AnU+/xk63NY7+8vAr/6cMLwFHb7ikY?=
 =?us-ascii?Q?FUTXXhX0JIhztVncIh+g4KiClZ4gzq9VGmel85VoJ2cBwrRcYUokXE5sqV6f?=
 =?us-ascii?Q?SlXaKrZeY7H0JJzpbRVBaOMf3rkOFH5Re5gg1lqu2Szv+3fYwiM8IwzZViFe?=
 =?us-ascii?Q?D7VPXGUzEj5jmVkA1Wy6aCFegcKUK/napwypLz3PzhLB187WGB9xL8kDPJaI?=
 =?us-ascii?Q?aRtXYzlSdz66jbngvmKZcLFyGiTRThjwhtw5bFzHXg+OHwIoqy9ikFpoEmap?=
 =?us-ascii?Q?eIb0ZTFgm6yrrYvXxo99WAtZmgHNsaFPMxs8tBrrfU4i+qyT0yJ0dVYoS8pc?=
 =?us-ascii?Q?8yIwkLJJq4cGRFkg7FBdEqx52F2p/GF7TU+mVuO4OWfepwUCpGH2tqviUIy5?=
 =?us-ascii?Q?WBdcn3bs5G8v5Yjmf0Vz+QJnxz+WJhYNig9cFOLUsMfqAryDiiSDObMn1d+k?=
 =?us-ascii?Q?+PMz5nCM/2TkTmRXOfFpTVtyt7hwWtkrrILCVXOtgdv4D7oz52PXunWBdWr5?=
 =?us-ascii?Q?cSQUhaEHuIti4plMDqDHypWj147/nZN8ip2ovIitDEq2TzXNw7j4iuRzVA3Q?=
 =?us-ascii?Q?Z6LkqPo8w+G6zvgyytV3IGpP6b40Ny99lFxzYc3UxOGdPeOObXYiBFtsnoQ3?=
 =?us-ascii?Q?sLUNtjjfYz+dQPP8FjOlTmJEcnZadEw4+btoZwx7VSS3eWidNhEhStNTJpD0?=
 =?us-ascii?Q?j8+JBL7f4J0oLqI2vukig3j+VDfX3JQZ7xBq0YEEQf8SQqHxSEme4Z0Sp2jj?=
 =?us-ascii?Q?d6dD7NulHVvdG6gfnIjNTT0fPSEBvWNXfbWjJ/WVbitWjk1DnuIx3Fy5VsKr?=
 =?us-ascii?Q?4QTKUtUgLPiHTglrEsBBRsjWw8b8VCGQnjiC1aeiuyTY1ym9lOSxyy7ZSqCK?=
 =?us-ascii?Q?j+l1EY/TlDc0YZxab7ATJYJ7giqNJ24qlUXOkCboTHbrbl6fynE2BzYzdFQM?=
 =?us-ascii?Q?U5ptOTie1bhI4+b2UExYicLdbezC86a9SeGL7tHcn2TLD+pMCX4PLFQ3g36t?=
 =?us-ascii?Q?ddNViacmGpvbL/T2iNi33obbbXTu/Lz28QPv2fOu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eff0083-95ca-4ae3-f8cd-08dd99755277
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 21:12:13.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5ct8Vt18h18WAMkybsVNVUVpE80d08M9d+j3Rx0COoz2OScckTeSKVSRqW7kUHAEjefc2d6+OUcVqQDuBT9xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6826

On Thu, May 22, 2025 at 10:42:17PM +0200, Takashi Iwai wrote:
> On Thu, 22 May 2025 22:30:20 +0200,
> Randy Dunlap wrote:
> > 
> > When CONFIG_PM_SLEEP is not set, the hda_acpi_suspend() and
> > hda_acpi_resume() functions are not used and cause build warnings:
> > 
> > sound/pci/hda/hda_acpi.c:282:12: warning: 'hda_acpi_resume' defined but not used [-Wunused-function]
> >   282 | static int hda_acpi_resume(struct device *dev)
> > sound/pci/hda/hda_acpi.c:269:12: warning: 'hda_acpi_suspend' defined but not used [-Wunused-function]
> >   269 | static int hda_acpi_suspend(struct device *dev)
> > 
> > Enclose these functions inside an ifdef CONFIG_PM_SLEEP block to
> > prevent the warnings.
> > 
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Daniel Dadap <ddadap@nvidia.com>
> > Cc: Takashi Iwai <tiwai@suse.de>
> > Cc: Jaroslav Kysela <perex@perex.cz>
> > Cc: linux-sound@vger.kernel.org
> 
> Err, it just an incorrect use of SET_SYSTEM_SLEEP_PM_OPS() instead of
> SYSTEM_SLEEP_OPS().  It seems that v5 patch went back to a wrong
> macro, likely mistakenly.
> 

Sorry about that, I'm not sure how that change got lost between v3 and v5.
(I also introduced a typo in the commit message of v5 that wasn't in the
original patch, oops.)

> A fix patch will follow.
> 
> 
> thanks,
> 
> Takashi
