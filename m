Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2088.outbound.protection.outlook.com [40.107.212.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC52F4A;
	Thu,  3 Apr 2025 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669257; cv=fail; b=NJnp+iEfSx2TB5glBk9LnmpjDXGpHt8uu5k43n6ODumqTDMYlgu0RNxwgPWANlSCFP+e3SNfM1iy/zdcuox1ugxydRhixDN1jnLvH1EkxdU2BRs/GmxitHRR6KIAwQ0Ou8LgHMDhvWBawsTojpShnI8q1BkfD9jFsnsjLOq8Idw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669257; c=relaxed/simple;
	bh=/pALLU3xmtyCRytt+Ca/fKj7ZUdaZuq9YVh6s8/tSi8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZiQTNejZerbVRAwtipeFPHZnsTnPT7eV77iI+HwdBrPRqwiMOoDUL9ubvc+hmgvKdiQVY0E/HhBtOCR4hAhxpBN1jCUk9RqVq6cx01GgR8TFFPTNLUy6RNbNn/07NWFsWVrBnfrwGjePTX99/n7m4xi/rTXYj1AqOpNA/WN9g5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2hbIBSQs; arc=fail smtp.client-ip=40.107.212.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2hbIBSQs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qx7WtZLTkONnx+b4hKHmRYe9RecnbXx5EnoAeflRNKlpGbcRNa2pWOw+UGHMcG0Q58H1h0YC4u97CcBhnL9oCOKT5ratcEqeXJkJZyYVKq7jojt9bu220tK0x/u0BRRVK+0e5o/cieolwJXYexXX9Aj+CY1XEN1hATOo91cWsC4IJ21AGinteGvASepF0QVSJbmkpFlEVQ3aYhgSPM5eivYyoQtjUkOwuLE2SOlVhlnEUw3tyavqBmHlHGs2JgiMWvVpr+bM3mtthJPC3e+++3T1K2RVQJG27PAic/Q/hrgIJTL2PZZ2GvUVqu+8I+aIBffHK24VTYL6EjSYR/02HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsB/C1S08jgydOWSRraRJUTxFMueZ/8NwNmReIQKfWg=;
 b=MTuIs/EqwxXWqRdYm4VYTuY1E508Hldtm//GDM2Tbg2c5dbgO87rajCQnM9eKzVrBsVfnlqkGjEWI0RytkJJE8H0joOrL0nqzgAuVWgHvUORaFcRhVIC0d7M7BKFMRgaEkQ7W35Ye/S7FMe5F3Wl3BBvVIlEzrQi6csWUo/aDxYtNqe9Q0PSJTBcVvIZGjAnBIiC/iU9IhwzMcR2A3ea5MDTpSf78qy5o2b4S3R8ld8fIj6adaWy/8Fm+xMzGgaH1LL94vPGEHRe/d+K0y2vNlXygkYdvUTbaxH/hy1jUU19FUTMNlYjgwsx9rO2Q+GehBuk9O0iqYX6r1w7ZGdjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsB/C1S08jgydOWSRraRJUTxFMueZ/8NwNmReIQKfWg=;
 b=2hbIBSQsyxY0+bWCqZsT8sh7VtGSb7M0ISHS12lmt2zKAwJ6Bo0dgxuynlXc0IzzP1+RaNbWjn4tJS+m2eWTy1cxVDYWUXhB+YM6KI/2fkqM1Ku46VwCOQFmBTk72YZGp89GSOXmGDq4r09ng+xbEiOHhzo6GEEiAL1nizSzOyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 08:34:13 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 08:34:13 +0000
Message-ID: <c7c5e449-3df1-4162-b5ef-c9e05945d22b@amd.com>
Date: Thu, 3 Apr 2025 16:34:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use of
 SWIOTLB bounce buffers
To: David Woodhouse <dwmw2@infradead.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
 Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?J=C3=B6rg_Roedel?=
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, graf@amazon.de
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
 <20250403033230-mutt-send-email-mst@kernel.org>
 <59be937432fe73b5781ecb04aad501ae5a11be23.camel@infradead.org>
 <20250403040643-mutt-send-email-mst@kernel.org>
 <0261dfd09a5c548c1a0f56c89c7302e9701b630d.camel@infradead.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <0261dfd09a5c548c1a0f56c89c7302e9701b630d.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWPR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::19) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc5fa9a-8bc3-4e86-6c1f-08dd728a4ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzU4WjlNQzBOUUNXTVN5UjdFL21QTjg2NUlSd2RNZWpsL21JT1V4dStSbVM4?=
 =?utf-8?B?Wlo0b29yVTZTS3QwSzZ0bTlrOFRFbnZ2Sll2MGhEeUNQSTVTblhueDBNM0RJ?=
 =?utf-8?B?Y3NZdDdIYUxENkE5dko4d2RtNDNkUVpuZC9PdUNzWktRRytOKzdpcVlsOVhi?=
 =?utf-8?B?LzFMUzVSN0k1eGJ4L251eFBNdjlob1ZrdUdLdDl4YnAweU8rWmk4UzVNSU1Z?=
 =?utf-8?B?bkxZTytJazROam5IbWlrZGNVMldGWUI1bndNZTNBYzFOYVhKYy9XVE9ORXJU?=
 =?utf-8?B?Tm9DMElndWJjZUQzT0hodkQ0cXVGcFJORXJDZ2UySHpUUDdMVTdtem54cmMz?=
 =?utf-8?B?QVE0T0RNSS8xT3pPbUp0dlI5TVRnZDJvS200TnpqQUhhK2x2OURUdUhsTFdB?=
 =?utf-8?B?SVIxT1NSR3ozMDBGTS9Ra3dsZzlia3BkWlVkQnoyRGtXMitvVGhMZmNmSXg2?=
 =?utf-8?B?b05ja1RYckhyQm1IaXVrM1p4eGgzTnpiOUFYK0dONUpHY1FySHE4NERmTW5j?=
 =?utf-8?B?alV4ODVGV2k0bHRvRUZkZktndmg4cnRSOHpuU2ZERExVT3AyTDNoT0tCc0w3?=
 =?utf-8?B?TzN3UU5GbzNZb0p1a2o3RUR6TkhOdjgrRlNhNEgrQ0ZGNEdadTVrdjEvUndl?=
 =?utf-8?B?YUVMSURLY1hvM3o0MUg1Z1piWU5DOVp6UldId0NjTVJyVnNEdDZOcjF1NDVX?=
 =?utf-8?B?VU9xYTNMeWxjeTRTY0w2YkhCUzZRaEVSRzJ3NXNLUDZaTUcwSTdEVGJnNjFV?=
 =?utf-8?B?UEtvRmNqUFE1TnRGclZYOEhlbHFWSHdJUitaUndKdUY4cGtPaTE2UnJ3Vzgz?=
 =?utf-8?B?Z0wvYTkyRndreXRWb0FWRDV1a2xYTi9mSmtFa2JBQnBsMWxZMTJreFRpM3Vn?=
 =?utf-8?B?ME9vK2lwa0RhNDhLWUpQNlp6NWEwNmRKZTJ2Nlp2ckNJRDFESzA2THFyUnVV?=
 =?utf-8?B?dmdxQVg1MUlFOEdON2swR1UzaWs1TGNteURNZ1g3Vi9hMWtrWFQvY2QxUlQr?=
 =?utf-8?B?ZmtLS3VWaUVQRDNBMkZROVZtVURDa3NLWHB5eGdqQ0VneEJSeUZodEtDRlZX?=
 =?utf-8?B?R1VBNjFSZ092Mm9aeVNScmR3YXFzZ2U1RkdEak5NMk9EcklFRkNaaDlQQ2d3?=
 =?utf-8?B?Q0oxRHl4UVJRci9sUzhFbUJkVkgyNkJZZm8wdnE3aTJVZlFHeExGeHJtbS92?=
 =?utf-8?B?eTNHWExBRG5hOXZiNUw1R3QrajV3OFJzcC9nREhBRDV3dmtSYlRsNFVkQk1T?=
 =?utf-8?B?ZXc2c1NuRkc0OWNuTGNNWUJGQ1dWc1lRVm5yWG9FU2kxQ1VGSW8wcmtBenpT?=
 =?utf-8?B?Z1BXb3RkdTA2OXBHUkVMM25MZEYvNGI1T0VnVngvamF2blhNSllJaVNhNElT?=
 =?utf-8?B?R1dFWVI0NVlFSXF2b1NlRWYwQUo2dkMrS2w5VUdKbElGYVZITFE0WXY0THdM?=
 =?utf-8?B?VmsxSXgxTGZpZ2RCVmhXRll6YjdPZXBiaHJXSlpqcmErVTRCaWdZSThEcDFG?=
 =?utf-8?B?UEdXQzZ5c2h4ajkyQVpWazQxNThBUm4wRS91VlJET05kbnN2MFJDYnluckFF?=
 =?utf-8?B?SXIvVHBMakFCSS9FM2lkSG9ERDlUOFV6aitMMVNEZVJWQ3RDU3hBMFR3a2Yv?=
 =?utf-8?B?U0FPVzRWYnhva0hSS3J5L0g2Tlh6UWg5dnZKSkZ3TXE1L0JoYmp5TTEvTzRB?=
 =?utf-8?B?RTdSa2RxOWJIY2ErQWRwYkJDUWVDSXRKbkRSUXpJeENhQisrbDd0cjhTSlRM?=
 =?utf-8?B?R3hGZDdzUWU1bVkybkM5ODFNZmozT3hRWjhaSnhzTHFBUUo4VVpBdU8xLzBs?=
 =?utf-8?B?T2Z0Q2I4MnVQRVhjclg3dklKejhSU0docStjUkxPQmxQTW9EU0krSlA2OFZX?=
 =?utf-8?Q?d0xRu/FJHiE7k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHZxcFhzNVBOMG9zblU2cGVMdHNLQTJXYlYwSzB2QkxyQU1pUlVkUCszTWVs?=
 =?utf-8?B?T0IyWG1Rc0hiUVNtTjRueTFDalVWSGw3N2pObFQ2THl4TGZlbkdLR0oxWXk4?=
 =?utf-8?B?SHNhektCaEplN0hLOW5rYUthQldXRFhUMEZHbVhkNnJ2SzFoVVpDb1hHOTEx?=
 =?utf-8?B?NWIveHdSd0FvcUVaaVNoMFRUT1hQdlE1VU5JYmFCUUxqck9FSXJVRmhDWXM3?=
 =?utf-8?B?YkZ1UzZ1T0Y4SmhsRWljVkJVN2tjZnQ3M3ZVVEM2RTJuQlAzYUQ1b0N4R1dL?=
 =?utf-8?B?R2ExWTZJTnpCcXVkMHVDMFQzR0ZtRlQ2b3FYcGhjNTcraDlDa0lZNjl0TC9m?=
 =?utf-8?B?UXFkVmpYSUM1V0p1OUN5Z3hoL0htR2FCbTR3cmZwWXRWNzJRWlVTM3pIVFB2?=
 =?utf-8?B?VmtLd1RPeFc2KzhZN0c0Q1JtaktNVVN0akxTbTFtR2MybURxazZFckxpcDdk?=
 =?utf-8?B?bWwzQmRyMXpHMTRJa1JWdmY2ZnlueFFFdk1zTmpscVRTbElSZ2lIRHFPbnBh?=
 =?utf-8?B?T2MvQk5tNzN4SkdoNmx5MWltNWVvcXIrVExUdjIwYURTTXUrQWZaU0IvY2xQ?=
 =?utf-8?B?VzBWNmhHR0xKVG1CcXJOT0d0S3F4aDJSMDlCUFN1aHRFTHRVcW9RUXBkaGRJ?=
 =?utf-8?B?QmY3NStUc2djZkJSQlRJeGZaY1lrcmExMEJMUkRUQVJCREZkbStXcjh5TXpJ?=
 =?utf-8?B?Mm1NcFh1a0NyaitDUlFndGhtM3J6M3J0OUlLbSs4bjFrelJyVGFEbEhaYTBl?=
 =?utf-8?B?YzJLTmovRENYYUVYeHpzZS9GQ3AwMW4wTmdvdHRyZGN4c25jelpQYnZSNDFh?=
 =?utf-8?B?OTQ2b3FZQVpXUXVaaytZNXFkczJwUDFrZCtzNERwRVdUenh1dU9LYzBpaDlN?=
 =?utf-8?B?enZpM1BHYk40bHNQSmNUNmlmQmE5UStwZ3JRS056S2M5Qi9TOEF0dVBKZ3Mv?=
 =?utf-8?B?Q3VoaTdYano2ZHhleml6bUxFMW55d1Nua3lON2lsKzcrQVBOeld4QjdVdnJ6?=
 =?utf-8?B?Y1QyNGhSS3dxRTRlQk1LUGx2dm9zbjNsVVk0RG9ESUtJMllCZVZiQWdaa1Az?=
 =?utf-8?B?UnRmbTRWc2RaRzFpMU85NDJsb203SmVqTkJWR3pLd2YyWTkvWVFqS3BRSmZN?=
 =?utf-8?B?aDBxTkF2d1hzRml2WGMxU3ZGeWlaRHl2UUMvcVoxa1FvQzcrVExGc0ZEQTht?=
 =?utf-8?B?NHhuK0RhOGY0M3lJQzd5QkZqc29IaGpaeUl1V0UzS1NaV3pxNFZyLzhoZWVu?=
 =?utf-8?B?QWVMRjFPSkpYNmtwNks5L2poNmRiZExTMWVGMDU0MmMyczFLbW9IWU9sVkpK?=
 =?utf-8?B?b0UyQXVISXJQWm44SUJrQlFmcG1IU2FQbkNqaitHSHVJb3F3SXdZOW91cjhE?=
 =?utf-8?B?TkJPdEgxbEZpdGVodUF2ZHNKYnhJeEgvV1dscmFyWU1BcElCdEp3Q24vd294?=
 =?utf-8?B?QUNFZ2JRZm0rME5kdGd6cTlKOGZ3MHpURHp3U0F3cXR5SE1RdXBVVnpzWUFr?=
 =?utf-8?B?MnBxNWoyOCtScCsveGtjY2pNNWtDNVhhSmxLL0FQc0JkaWpuaGFudllJSzlp?=
 =?utf-8?B?M0hldjdlQVlkbk1BelluSmJGQmJrdWRlcGp6LzJmekJsMTlweUVzczRLUkpp?=
 =?utf-8?B?UnRxd1kvOGQ1ZmdPbjhOU1BZekdGTjQwM0RTcXl6UCt0YzNiTVp0alFyRW9H?=
 =?utf-8?B?ZWIwNlZncnJvMUZzUUhxYnBzOUtja212eDhESEwzT2EycFBMMXpjcDZobkha?=
 =?utf-8?B?NHROSlVkaGR4b1dvbDMvNkFFNlJ2a3VmeUlJdzM3NFlnY3ZFOEFpWnA3ZDI1?=
 =?utf-8?B?QkxUbUZydXJrTmNiOC8yS21WWmw4UkM4U1NaNzdiclRBMndqRWIyb0RQb2p6?=
 =?utf-8?B?QS9qaWtyWVd6S3pGbXlGdFkzT2N1Ri9FdDF1NmNwSjVaNEx4TWpNTU1lVG1a?=
 =?utf-8?B?WWkvamZaVlhHY0NudmRSbmh4SEk0dkxjZGdLYURmQ0dsZ3ZpbW1jZi9MazhS?=
 =?utf-8?B?V2lrbGJRUEJyKzJXdzJCMzNPZEMvYzI0OGhRdVZXT0RzeFdLWitYNHhFbTVD?=
 =?utf-8?B?S1g4ZFF2RGpUS0Y5WldRSjRSYUNTK044c0kzVDhNTERmS0VBbHNLZHJnMXp6?=
 =?utf-8?Q?OjWjC2VdHf+jI7w8f1ch8m9pa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc5fa9a-8bc3-4e86-6c1f-08dd728a4ff0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:34:13.0801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1vAAVAexium6Vrao2+V0565oh84xESAQMtoJjYrnF3rbJLB7UkzVNZ00sFmxCQQgQ6mFPWv9+v9jbZ5bDCoOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268

On 4/3/2025 4:22 PM, David Woodhouse wrote:
> On Thu, 2025-04-03 at 04:13 -0400, Michael S. Tsirkin wrote:
>> On Thu, Apr 03, 2025 at 08:54:45AM +0100, David Woodhouse wrote:
>>> On Thu, 2025-04-03 at 03:34 -0400, Michael S. Tsirkin wrote:
>>>> Indeed I personally do not exactly get why implement a virtual system
>>>> without an IOMMU when virtio-iommu is available.
>>>>
>>>> I have a feeling it's about lack of windows drivers for virtio-iommu
>>>> at this point.
>>> And a pKVM (etc.) implementation of virtio-iommu which would allow the
>>> *trusted* part of the hypervisor to know which guest memory should be
>>> shared with the VMM implementing the virtio device models?
>> Is there a blocker here?
> Only the amount of complexity in what should be a minimal Trusted
> Compute Base. (And ideally subject to formal methods of proving its
> correctness too.)
>
> And frankly, if we were going to accept a virtio-iommu in the TCB why
> not just implement enough virtqueue knowledge to build something where
> the trusted part just snoops on the *actual* e.g. virtio-net device to
> know which buffers the VMM was *invited* to access, and facilitate
> that?
you trust CPU  and its IOMMU, and the virtio-iommu is provided by the hypervisor,
emulated by the CPU. If you don't trust virtio-iommu, then you should not trust
the bounce buffer, because it is unencrypted, more like a security leak.

Actually everything is suspicious even the CPU, but you have to trust a TCB and
try to minimize the TCB. I remember there is an attestation mechanism to help
examine the infrastructure.  We need a balance and a tradeoff.

Thanks
Zhu Lingshan
>
> We looked at doing that. It's awful.
>
>>> You'd also end up in a situation where you have a virtio-iommu for some
>>> devices, and a real two-stage IOMMU (e.g. SMMU or AMD's vIOMMU) for
>>> other devices. Are guest operating systems going to cope well with
>>> that?
>> They should. In particular because systems with multiple IOMMUs already
>> exist.
>>
>>> Do the available discovery mechanisms for all the relevant IOMMUs
>>> even *allow* for that to be expressed?
>> I think yes. But, it's been a while since I played with this, let me
>> check what works, what does not, and get back to you on this.
> Even if it could work in theory, I'll be astonished if it actually
> works in practice across a wide set of operating systems, and if it
> *ever* works for Windows.
>
> Compared with the simple option of presenting a device which
> conceptually doesn't even *do* DMA, which is confined to its own
> modular device driver... 

