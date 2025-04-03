Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B59323F279;
	Thu,  3 Apr 2025 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664420; cv=fail; b=WHDlT9euFhEqXfMj8OYyUrdZDeU1oFz9bwYj3cJ2AAmwHjDAh1qJzUN41Y8btQBQqghfW/oHRqyIEYBBG2X6W4oXGTL6WdRDU7FsdOV9Sd3pxGH56lXaYuIUkXJQhdKM7tTJOpXTAH07O8iMN2RIvfAGdcxcPxG71LlOuyDKbUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664420; c=relaxed/simple;
	bh=Nc8JAG46GzgRf9g7KJPoVR+8OQOIWBx9AP9AtrNf5jE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=coRB4pEZeKh/2SMBQ3fVx7J4Cjlqz5uXvVrelrcORJKvEWsopPAlKivV4T4gvabmF+6K31cNmMvdXRPl51atLIh3CkdrEPLiYMeEDNUqEtpAX77tYfrEfddoLENosoEBM4fEBhq2wl15Zdt1P3gFFQpyoN8VVB3Ulmgcan7VwUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2/bebkco; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2/bebkco"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIJQWoKPAVEnOnafY5lQuY0aewdv4ZE4CaTDYlc/qrpG8LfyRCosNVasOxb8oPlqFrGEnZxtqEt6gyex9HgNr7+raoGLrYualHIJQu4I1s1ljjDj4qoRdhkY/3HYtR6HFgz6+mouDOUlYZhGp4xxeIJYyEbVS5j2GsChlRR4E+H+pXHH4ByDi6Xyx7DtNdhNCIBoRbzV7j2+LT25Ifn5A9l7jEwFLeHNrxRAmEZQ0xhmcBjag2hZ+9npmo3qFql8RFAoF/lLrJW9yi/a8ax4G72SIKA8DONUuREvP05GmO+kOavY4zrJV2QwnQp+W4ykWHvw+xgcreGTUti5QQUEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24cNsf0uV7e9XTK+UQI6khoKk2Lx8nj61i9xUzv8Z30=;
 b=xLqXN7byAIXmhoSgZy0AnA1G7n2fs17eEPdUwx/HNF82WtioLiZI1FYdPAxsxk0lquPXsN3O7l1+Hh0yPG6mi3t1J6ADFm/WkJQWJlnNTTR+f6Fia4awy23DkUKqoU+hWrwCMfOz4OII9sjcNJew2LTmYdUaz5RMvsYPCaFoXWxqKVUl7DoOdS59qxzcKACXZsMEtXLBNeNGmjnEyO5GrkM5JUl0y1neKxJiqyDR63EN5lQOhNkMoFKjuhW4764NkAznGY0V5qdu4s1TBQLK54NuROhYduiLwt/VVR28yGTNTERdVX9+tG6tKwtcZegAViH4+MSkF7nPR9hsbveujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24cNsf0uV7e9XTK+UQI6khoKk2Lx8nj61i9xUzv8Z30=;
 b=2/bebkcoKSpNWeJqrldormeUTf1sOWrCMBR3Ukj7eEc7jP2KXFyCnZU0IGe1CHV+1Q+0u4JcpJ/DQLgc0rMoxhzoJY10WbcSDCiMdHW62RFp7ZSDANg+hxGy2ps9QSr5jPTRXMevJNXMosiQzaW8QRT8vcxi77wp9VxucrV1GQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SA1PR12MB6822.namprd12.prod.outlook.com (2603:10b6:806:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Thu, 3 Apr
 2025 07:13:37 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:13:36 +0000
Message-ID: <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
Date: Thu, 3 Apr 2025 15:13:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use of
 SWIOTLB bounce buffers
To: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev
Cc: mst@redhat.com, hch@infradead.org, Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?J=C3=B6rg_Roedel?=
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, graf@amazon.de
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20250402112410.2086892-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:404:14::20) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SA1PR12MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b88d56-a7b1-4828-903c-08dd727f0d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUkwRkNSb3B0WmhzYVpOOE1qNzRlcjc1UDVsaXNwbnVDVDVFTzRYWW5PV1h4?=
 =?utf-8?B?REFxN2VHM2dEQUFpTitKZEZhTlJxMXlYNlZHRjk0U1VXbDhMVitTZjE2dGNs?=
 =?utf-8?B?RTEwYWpsK1VyUXBhWXBxZGVtM290dEFrZWlDWCtQWFI3czl5dVQ5MFFNaDRO?=
 =?utf-8?B?aHlRTEkrVWxOR0twL0VUTm9DMTFlU3hSYlVDSEdyUzhNaVRJTnAxTlV3cHdz?=
 =?utf-8?B?YmllS0FxZE9jVGVCZ3I3ZFFVa3VZYkQ3YjNZMExyTHcxRU9VcGM1cnFnd1Fq?=
 =?utf-8?B?MkcvVDZEeTEzQWpNdXdyTzI0UC8rY28vd2M5YXNHWFB3TWUzWGkwa1E4d05u?=
 =?utf-8?B?czVUZkxvMktkZTZvN24rQ3NxbGowZjFvY1dkVFNYYUpOOHpjVVhOS2p5NnBT?=
 =?utf-8?B?Y0FSL001MXBQbk41NWVRUlplbnl5N2VEZm96blROWkVqRVRzTHpKYWsvM09K?=
 =?utf-8?B?ODNuQjE2RTZGTHVUdXl0czVGS0ovdkhJOTA3MTRyaVozdXdvSDBXOVJFSjZO?=
 =?utf-8?B?MmhXaGdNSXVVbU1SWjF6TFk3TmNMVkdQVStDeHZLeHJSR0ZqMFVRaCtiSTJI?=
 =?utf-8?B?S0RieVlRRk10TTFRZGFWUVNxb0l6VWNZN0E3c2g2NmJvbmc4cTVXa3Rna0t2?=
 =?utf-8?B?WVI0ZjJTV2l0ckxVWU9SdEI3RWsyeFk5Wm1GNmJFZWppd0pROGVGZk82VVNG?=
 =?utf-8?B?dUZTS0RoN0kvdEt5SDFXRmN0aXNGVDA2NnBTOFVWRHlyUzNDOGhKRXJQWHFa?=
 =?utf-8?B?eGpvcmZSZURjdXhqem9QWWVOWGhpN3JZRUFUWWV6Y212YVJRdnlZelZ6OEFN?=
 =?utf-8?B?ZGtrZVorUFRjYUJQeHozMmtaRk9hdUdNUWgrOHlCWFBYVElCaTZWUm9sR1ps?=
 =?utf-8?B?eC9CSmRHb3pXcEcwdFF3ajY3ejVDRHpYWURwaWZITkJVTEJ4dE1GTGVNbkxS?=
 =?utf-8?B?M1hsZnFLbHFHaExLOU94Q3BPUUJjUkNYUGNLT00yMHovMUVOVUlqQ2RpZ2dk?=
 =?utf-8?B?Z3BIWHlRNm1KeHhzNGdLaVhTalB5c0czYVlTYmF5cDNoeEdYV1p3U2NtdG0x?=
 =?utf-8?B?ZFR5aVdFTEpKQm9pVWU2TGVkRTdTSEIyRWkxTUJWQ2huODRQSFh0WWZzZDN6?=
 =?utf-8?B?aWJtTUVsc1JlZFNobTY1aXpTQWNwT28yTGQ2Rnh2c2gzOFlOeTlpa0g4RmEx?=
 =?utf-8?B?bDFWKzA3YmlVWUJJd0tSdFdDc2NIY3pOOGN0UlcvN3VDblpmOXBSTXNyWm1V?=
 =?utf-8?B?RTRycUFpQVdJaHdGMWJSeGZKS09aNjZTUlc1UnZPZTVvZ29BdTlnWVhuZEd3?=
 =?utf-8?B?Q0JwdVdUR20yUWt6STV6WDZRcW1LbVBweWVXU3ltbWZoS010V0hZZDBKS2ZY?=
 =?utf-8?B?M28zYmZSTVkzRTNGd2prb3NVbnhNTjBkWFd3RHhKK09XdWovdlQyV3JieHpI?=
 =?utf-8?B?dlM4NWJGVHJpS0U5WFFGZUJmWVFuOXF0UjNnTzRxaU1DRjVvTGNTSDRlUjF3?=
 =?utf-8?B?UjJkaGpoK0ZLbXJQZXNsR3ExWWo5TWdKOVNtMWFJUG5pZGhJRWxUR25peVZI?=
 =?utf-8?B?RDV5bFR5bndlSlpqeTh4eG9PMHZVZGhXNmQ5eTI0bDJwc1gydnJhZVA5THlV?=
 =?utf-8?B?VDJHZEM5MndRcDREMERKUEgyUmhEWXAyV25iVVBBdnNSbHZsd1BFb284QVdO?=
 =?utf-8?B?eU1SZ2FBSXdTanNNazhubllGVXVmRXlUV0g0YlErTVEyWjZ0SVVjMHVRNkRX?=
 =?utf-8?B?d1VoSzdqR0JyUFFodFcreU5KUWx1dzRzSTFzcUxSK2xzUWxlSkZjbHB0bVc0?=
 =?utf-8?B?Ty91U0RWR3VmUXhkQU11M0hFdUFPQ3o4ejRlYk55TStTWDBYdWRneUFzbGFj?=
 =?utf-8?Q?cPNGfPyxPbYOj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2FLMVBUNkZnNUtpMkRQM0wzYi9QUGFaMDFOUGdwNUFGQTN4TmlqVXZCa29T?=
 =?utf-8?B?Qjc2dGFuOHlCUVRjbmNudVUwblpnZFV3M0RxM2RZK0RHczlIRHBSZWhpODF6?=
 =?utf-8?B?dmNKa2RtRzR2R21lMGg0UCt1KzM0V0RXUWpaVUZmYlNBWW5NOHRPcHJoNXZY?=
 =?utf-8?B?VDQ0UHUyL3lnOVl5TE1nb29YRDROU2pYSzBMZitDaDZYNkhqQmFDRjBJeFdC?=
 =?utf-8?B?aHlMTUN0TkliZ3pPdm9EZ3JOOW1CTmU0RVhldG1uc29sMHBPUVZra1VoVmhQ?=
 =?utf-8?B?NnRnNDRLdUViTFBGMmlQZktYanJOT2ZpbzdnTmt4S0pyV2YxZGVBNzh1MjNU?=
 =?utf-8?B?akVSaG15MDRRTUdPSUgyMjg2Kys5Q1JLTnZJTWVUTW9pSmphSVNDazdzWGlZ?=
 =?utf-8?B?eE9VQlhVSTZZZGZDclRzbFM2YXdZdk1KdGsyMXJwSGIybFZxd3paUWMrRURG?=
 =?utf-8?B?UDBQKytZNng1V05HRVRKSVVaek1VUmtkSTAydDVid2J3WHNlZU93OW5rS0w2?=
 =?utf-8?B?T3grdFlHcThqV2xHWndlbGFhMWpZQkR0Z2ZHeDV4WFI3TVlWRUhLd2RFYS9F?=
 =?utf-8?B?amFBajRsNTl3M2o1VGdwOWU4dXQ4SEwrWVdXOEpJdGJaMC9TWXdsdDdmRHFG?=
 =?utf-8?B?RzY5Z0V4QjNNTzQvZXB0Tk5Wb2tEdXJLSVJCNVVrRlBvTzJYemRITTZrN2Zt?=
 =?utf-8?B?U1dUR2s1Y3BiTDRQSlYyNG8zaTRqOE9kZkVweWZmZW1lYjl5RTlTYnhCY2or?=
 =?utf-8?B?bm5TVUJuci9wazc1b2FWMW1nRDJMeFdUWTFTTFROaEp3LzRZLzliQ29vUGNa?=
 =?utf-8?B?ZjExSFRoVTJoc21KMGNuRnVqT2hpbWluQ3V4T2NoenNCY01jQkdEeUFBNndR?=
 =?utf-8?B?c0Q2c3d0WjVnRkhpZm02d3RaNmptd3Nsd2xvSVh1L0Iwc3VxM085T1JJdzM5?=
 =?utf-8?B?VHl6a3FsWllOckxQWTlRTDJuamZaTCtyQVBCRGJIZ3hTN2VuSklOZnJXdEtY?=
 =?utf-8?B?RnBhOEI1VjRmdmdNWHJPVW5oMXkxYWFWQ0p1YmxRcDlrUUMzVHMwTEtOOW9l?=
 =?utf-8?B?V2VFOVh6SWJ0WG80dHRyV3IvZ0c5TllRYzNZYnNKTVB0dEVnQzd3K0pvdytH?=
 =?utf-8?B?cU9NQnNOckw3bzFlbnB5STNUZXFOcko3cm5wT2h4cFVyd1RLWTZ2bzgxcnUw?=
 =?utf-8?B?SjM4LzlXaWp6RVRGcnFNazJiQU5ZaENGeFhpRlpTQ0pDSXN1d3BDTVNDYzNn?=
 =?utf-8?B?cUdlTURoQ0lnVDhRWkxMVVFPT08yUFpCODlzdnExWW9SSlNCQ1dFSFZ5UlZa?=
 =?utf-8?B?UDhXVlFycjFudGUrL2FrTkJvSUNTSC9uMkxTcXQ5OTVDR2RnL2M4d2J6Yk9r?=
 =?utf-8?B?TzJtdTdHQVNXMXJsZUhxTXVqaUl1cHRSVWc0WXFqL2xJME9aYXJiMmU1NkFG?=
 =?utf-8?B?dFI4WE5yY1AxMkNqdzI3a2RhNUMwUjB5UjJGQjJjSHFDQ0drcTVNU0U1MkNE?=
 =?utf-8?B?UXFEdWNQbEY5NGhOaC83K3prc0oyUi8vbUtZOC9JSUFwdnVaeGVicHgrVzdV?=
 =?utf-8?B?bFpkSmZUQUpEaEYwWnFEcWd2bENqNWZSRTdIS2pEaUxmOXdtaHlIZjZiVGVK?=
 =?utf-8?B?MlIvY3J5WDFpY25SUFd1alVEbXlTL1NVZkZGOHQ2OWRsQXBrSlRNTXhXS2lN?=
 =?utf-8?B?djUyNEJMWlRZc1B4SUdLMWt5eVNLZTRoS05XaVdkQytNdVVwUTIvUkM4aWl5?=
 =?utf-8?B?TVIySXV0TFl1bVJQZlJud21telNIL3lwQ0wzUW0vS2lzWE9JTjYvd3E5TkNE?=
 =?utf-8?B?dVc0QW5HUG5jY1g3b3dkTFlpOS9hN3FiODl4Z1IrUTBXY1FJSCtobzJiakZF?=
 =?utf-8?B?OHJHWS9yTmhQdjBLVzFKYzN0c0c5SE9keGZoL05UZDBVb0NMVFR3dUpOTjll?=
 =?utf-8?B?eWlFTHVYRTdqcGUvS2lsRGNNRnE0aVl3RGNYSXlIcVhVME91VXo4RUVyU2ln?=
 =?utf-8?B?MzY2UGhCMzJpU3pocXJGQUF3ZmxGMHdyazFHaDluTXdob1lXcU1UT0tXL1ZO?=
 =?utf-8?B?RkhUVnhBckV1UzRpWVdLbWZBR1hRajVSaUIwWEQ5dlQ0bXBSRzNxWE5JSmhl?=
 =?utf-8?Q?mSfrCiy9WmvHUaTwKnCpjeGyA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b88d56-a7b1-4828-903c-08dd727f0d4e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 07:13:36.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrxgmeMFIBvpzrXDeAfN1GzF5eMgO6+3UmdOtKzah4vEyJF4Oi8usgQE+YIiEnaib4qNPe7JPNsLzX/xkcd92g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822

On 4/2/2025 7:04 PM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Device-tree bindings for `restricted-dma-pool` were defined in 2021, which
> allow devices to be restricted to a given SWIOTLB pool instead of allowing
> DMA to arbitrary system memory:
> https://lore.kernel.org/all/20210624155526.2775863-1-tientzu@chromium.org/
>
> This facility was not specific to virtio-mmio, but does apply to it. No
> attempt was made to ensure backward-compatibility for virtio-mmio devices.
>
> Define a VIRTIO_F_SWIOTLB feature which allows the device and driver to
> agree on the use of the SWIOTLB, if present. This enables the device to
> refuse to operate further if the driver does not support the SWIOTLB
> requirement expressed in the device-tree.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  content.tex | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index c17ffa6..63d075f 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  Currently these device-independent feature bits are defined:
>  
>  \begin{description}
> +  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
> +  transport provides a memory region which is to be used for bounce
> +  buffering, rather than permitting direct memory access to system memory.
Hello David

IMHO, if we need a bounce buffer, why not place it on the host memory?
Because if the  bounce buffer resides in the device memory, it requires CPU traverse the pci bus,
that can be 10 times slower than accessing host memory.
This performance overhead can be worse when transmitting small packets,
and stress the CPU cores, even lead to IO starvation when CPU over-commit.
The device side memory is a host thing to the guest anyway.

Thanks
Zhu Lingshan
>    \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
>    that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
>    flag set, as described in \ref{sec:Basic Facilities of a Virtio
> @@ -807,6 +810,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>    the driver. When clear, this overrides any platform-specific description of
>    whether device access is limited or translated in any way, e.g.
>    whether an IOMMU may be present.
> +  If a the device transport provides a software IOTLB bounce buffer,
> +  addresses within its range are not subject to the requirements of
> +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''.
>    \item[VIRTIO_F_RING_PACKED(34)] This feature indicates
>    support for the packed virtqueue layout as described in
>    \ref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}~\nameref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}.
> @@ -885,6 +891,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
>  addresses to the device.
>  
> +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> +then pass only addresses within the Software IOTLB bounce buffer to the
> +device.
> +
>  A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
>  
>  A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> @@ -921,6 +931,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
>  accepted.
>  
> +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
> +
>  If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
>  buffers in the same order in which they have been available.
>  

