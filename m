Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E402A1FF1A1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834214; cv=fail; b=RDFAsyibD42WEeecQlMChyKWR+o9c9T5JCLoMgFrFufKC5tNe9fYDcEgua/H/ne1G2ncbJ5VqFu5RSKLC5h2jU80iC/FAP7h62S6FWqPJxQ55PJl7PV9z3oJoJ9EYRRINnmSdzeKyIryzYHCYsNuFTnTbOvB3wvl0TvibZTnfnc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834214; c=relaxed/simple;
	bh=vDVzCxmSb5k9gB9y8EilwkbFhkKmzzOOpxeJZfyPScQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JlUZNskMd0VBWBLjV1D7e1h31tugoKEUvFZ+NcG3YcKCeRUuPy2BH1kFxXA5NWTVliMlw10FlY/V3LdMq0gomtFi6+R8KLUm46dc+kC16WvZjePBs1nPlg47loFoKXLmPefA203/MFJz0/97P00o311S5SgWA8hDkXvlREqh0G8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=g9xYAwDx; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=g9xYAwDx; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g9xYAwDx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g9xYAwDx"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w0DemIhBsBVaaWBygaTGPEYC79Yx4fWUdmUSg99hw9DrS9xkasMwJcxb4k13MBo2eFTAe5OX2MOIjTa0T0rr2TY5VXOXOyCQpixKSAvUlXsWpEe18dwfiiR/3C8TwgOetYDW2u49n8mnMdnvTl0cBBvQtmttKgQUn6Ri4KjuPQ7i31MU9jTfYp0vtvAfF6NMcbGjXfCsA2kHMgccMmbAY9JQL5/NdyP9HbdVzRgwfJhrmIYmRSWGJ4UUrW/kwPdLivOAbPSLY8m/YiWI3eI1EEDnbGQvPFseai3i5TCesTH3ko+4rTfPjkGYqggkSMCmr7Z2jvuk+5vNpgmXPbigKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRTRWb29G4siJVXY39kSI3eJpXnurm/EhlbEYnYy920=;
 b=zFqAQgRSxvqZ7C6VUEzeDFfUQ8QRwJQEJZ4BMprlm9CjUkOUbygzLvMTAIW3zOyeTpRUlvJRvuUCl99yAl9f2UrPJZtk5ILzt5AdJIhXXSD9KopUrZgFzXnxar4B4exg0Hbpimu3SHAwzvoFMss8CWJW10LGHGI31wig1GRbrLjQWBK4FDTfZQqGgpaq5rQlDCv1SkkjZAkMi8jAFAXVPtSBJnp+fu6BrpvFCFaVbLJMIVmu1x+cEwk3X7Wsd6EBnZDxPJt9roXIlAdTMNImEQTBdulEsxHh4S+x70c6sLWc8rTRfk/fgEbbKZWRYtoy+LBkj4JbI3M6PQk50MV+8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRTRWb29G4siJVXY39kSI3eJpXnurm/EhlbEYnYy920=;
 b=g9xYAwDxzRRwhJNaywnTmqlYk4bzCMY+WZ+6TN8TUZxr574GeOKLNMrz/ggOxJe1Dx1j74wuovH1DfJevu0bq6fjMRZui+Fa1mEkgTLjolkhbax2QAYNGRqJ8WnOe/pMblxbtvAdt0+cpNCwRIHRCdURE0rzh7oS+xJAKkqyH60=
Received: from AM8P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::32)
 by AM8PR08MB6385.eurprd08.prod.outlook.com (2603:10a6:20b:36a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 06:50:07 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::6e) by AM8P191CA0027.outlook.office365.com
 (2603:10a6:20b:21a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Wed,
 25 Jun 2025 06:50:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 25 Jun 2025 06:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLUGcypIoY0hZyUsa58eaiE1YJm5BbY+gDL3vgZUx+JL3LRvbiWQIhTBbznVEDgj7sPlncMNLrzQg7ccsacWz7GkqZ7ibiZNxLsal1CNEBIVIbh5/mhDX967SN05rjCxsqDKgJUWh1D3MPXrU9zHwT3m40te/PA99ZpNGJ4zmWjx2phI/71WV93koQ7y2ZcQ5eGuzeuw1joJZuXCAcKM9ZpXZOo8byDUq0KsNiUcEoIzRPkjKbg2i2N6dDBw10BZnJBl1O0aYUKp99wlAe2NNdY7SIkmq0byn95VJQRXwLr1SSxZKYCmhbE695X8RXolM+1rk+F/QD8/JPJ72oTmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRTRWb29G4siJVXY39kSI3eJpXnurm/EhlbEYnYy920=;
 b=YDqIWDcOSntIvtfm+sbGzkdPQmI8V54Dt/fx0K4YuEyw6U63N2tmmUNmFYQQb0eW2aRk0/pXTYLsuiicE6rHIJ73TKLbuEVsPEA0VIPAsiRZRnEd0GLi7h50ljUCV7M05XGL3cIsptYhigyFiebf3QXhLArPdcxtRcNpkexzd05kLIKXhsO/OvMczx7U4NFpdoQqAOEEhb5tCt5ateWH1lCBapNw50D5I6Wsax944LxS0ulYORk/XNgLJ6nh49vAbLiDrsylqPtXVJpqgoNe2VYTqtXVYI5as/2N3rMK1wgAoBeRfXralG2W+cKMHM1cqZ37BO5b89RUCYB3Nbfp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRTRWb29G4siJVXY39kSI3eJpXnurm/EhlbEYnYy920=;
 b=g9xYAwDxzRRwhJNaywnTmqlYk4bzCMY+WZ+6TN8TUZxr574GeOKLNMrz/ggOxJe1Dx1j74wuovH1DfJevu0bq6fjMRZui+Fa1mEkgTLjolkhbax2QAYNGRqJ8WnOe/pMblxbtvAdt0+cpNCwRIHRCdURE0rzh7oS+xJAKkqyH60=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB9780.eurprd08.prod.outlook.com (2603:10a6:10:45f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 06:49:31 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:49:31 +0000
Message-ID: <88901329-08a0-49b1-b2be-c00d157cb901@arm.com>
Date: Wed, 25 Jun 2025 12:19:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Hugh Dickins <hughd@google.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, zokeefe@google.com,
 shy828301@gmail.com, usamaarif642@gmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <cc4da391-7c90-435c-ae39-30de37535c05@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <cc4da391-7c90-435c-ae39-30de37535c05@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB9780:EE_|AM4PEPF00027A67:EE_|AM8PR08MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b2cc42-8053-420a-2d52-08ddb3b48559
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QzRueUgrN3QwMW9xVHQ3cFIxSkxiTHVZVVZkQVYzMVgxSDNVbFBpZnNlenRR?=
 =?utf-8?B?dDN6TVdpY29ydzlZUWxzK3d4YytzSHF3eno0L1Y4Qm9XSHpYRnloVUlNaEdI?=
 =?utf-8?B?T0hRSnlLRUU4N1pMTTZJRjZMR1N2M0VNc05uNnpDMTZ2Mk5lYTRYaVdEdkk3?=
 =?utf-8?B?ZmxaTTVIUVpBckF1amFLWTFNRHdFUlA0VVc2ZTd2M1Ewa2lJajNVeGJ3VWJx?=
 =?utf-8?B?K3ZQWGpwTm8vdUtoTGJyNjVlNm5TZHVZZnJzcXpCWEk4OTJuTytkdjhxNkY5?=
 =?utf-8?B?Z01jbGhNR01HdTNvcDZCZWhkekVGMXphQjU4Q2U1NU9Wc2E0a2JaOTRCbjBn?=
 =?utf-8?B?emNRZjlUV21BdDBjRDRiVTgzTHo4TFgwT2c5SFY2MW5WQXgrMG9wbEkzVUUy?=
 =?utf-8?B?TlUyN0RReGIvMmN6OXcyVTFLSG1RZ3RqSmJpWGlGaWNwV3lkU2Q3K0cwVDBI?=
 =?utf-8?B?dkpqaEMrN0xLTGNzcFhlVHlucGZXWGQ3RTRGMTYydFBHc09BQ2ZHWjFyT3Az?=
 =?utf-8?B?KzFSd0Uxa281NTFEV2Z4MEdEWVEvUUdHM3FSS21uTVQwS2I0QjJBQzExb1dK?=
 =?utf-8?B?ODJiL09WNStUaFdQMURMZ0ZBR1N5aDBtemJkb203ZW91Q1gvYldBTlArVENZ?=
 =?utf-8?B?QWVSay93WWl0d2ZvU01DZTZSMzNiMWdHR0lPOGJWa2ZXSlhndXNZeEt1MXI4?=
 =?utf-8?B?RmpFZHYwSHYvaVRYT1JDSW1WdW5XUHluTisrTVJOTTlBcDZjMUVCcFd3Zmx6?=
 =?utf-8?B?eXY5Nm0vcXM0VE4vSWpTVVpVaVdIaUw4cGhrZ0ZCT2RPb09YcnBqTEVLT251?=
 =?utf-8?B?WnhsYitKcldIeTMyRUpUaDhjaUdmcHM2VXllK3l6TnQwbXlaVEFoZzIvL2tv?=
 =?utf-8?B?TjdTcEhmMzlUcDFHTG16NjJlWmdja3N0eFc2N3RGbTFsM2pzbHEwc0wrcE1X?=
 =?utf-8?B?eCthMFdVdVV6QXNmYTZ0ZFhNTzl0VjA2MTc3N3pFZWJXQVpaUXFEUGV0d2JY?=
 =?utf-8?B?WEFwemFlcFpvMDNkbWF4M3JtTWVBS0U1VWk4WWl6dDk1cXkwU0gxcHB0Z2c5?=
 =?utf-8?B?bmZMemVneE9iWW5HQnlicm5zSkxqcUVVWGxTM20wK0NOcG1KTm5lSTc3SzND?=
 =?utf-8?B?ZzRzVkd4ZG9tekU4dzh3WGN2QWVOL0F2K3FPVXpIS0xTd0JyUkI2VCthSHdM?=
 =?utf-8?B?K205UmY1d3g1eWRDR3FRUXRYKzJMUVFrcXdmVUszVWIwdGRSbkR4M0RScENC?=
 =?utf-8?B?bHFoZUlibnJBOTc5Z2lDazR3bndjOFh4cFVGOC92aWtITFRicFNUN3lackRG?=
 =?utf-8?B?cllTc3Y3NENXNHlscWtCUm84cms5cEFOeHF5ZHd3Um5KRUE3ekd0bjhsZGc5?=
 =?utf-8?B?Y0tPeHdLSXlSczg0STN5dVNhOTVoRVN3MWpkVU1TNkl1L0FIaHY5RUJwL3dH?=
 =?utf-8?B?TmN5ajFXV0Q3OXR3WkJIaStpWTdybmZDcHBLeTdLd3VOalQ1N1Y5VFQ4M2xH?=
 =?utf-8?B?SmJRNUs3TDV0dGl4UG5mMnVkZWFLMnpoVmtkSjYwMFZLVkdielljNXA3VVlU?=
 =?utf-8?B?elRmVXU0RCt5T3JscThNZ0l5c3RiQ1JxTXUyQzNtRExCWjhDSWl4bDhxMVpo?=
 =?utf-8?B?MDlJZUdaaUdyamlFVHhOSHgyeGVjelBpckEwRFdackJZc3dGNDdESDdsMHR5?=
 =?utf-8?B?OG5NeTNZekhDRlN1L1VyV2szVUJkZ2IvYm9Va0JudW5KM2YzRjM5UDBSUSto?=
 =?utf-8?B?c1hFajBIbit5NTlEMFlSZERLNHIzTDVScXlJTm45cERtbzBubHc5c1ZGWGll?=
 =?utf-8?B?WDI2M0o4c3BtQmdwTTR4ZGx6djdxb1gwT3QvdlhtR1l4SGdicGZpaWg0MmRK?=
 =?utf-8?B?N0QzUGNzcHZqcFRxVDdpOHFDOXNTcjRLSGsxbWF0N3c3cDZWMmpsMEo1bmwr?=
 =?utf-8?Q?d0fUfOIhazA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9780
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cac43313-94bc-4a85-a15c-08ddb3b46fd6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|376014|82310400026|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGY4TmpsWnNOcVVGbnZJUVJ3b3EzbUl2S3ZYNEt5TmV4RHU5bXlsb0MyT3h6?=
 =?utf-8?B?VXFabGQ5RkI3SEhtQi83MGh5aWVFQVVMakFqOHlTcE5aNncrMTYvYVdibzc2?=
 =?utf-8?B?dTgweFl3L1h2L3N5bVpLQWdkbndxM2tBVkNRSmdveFNlMThFOVBHdW8ybmJv?=
 =?utf-8?B?WkU1TG1OVFhKRCs3T1FoMzVDTU8vK3Z3bkE1VEwxemhwWHpNdUFQd0xOTFEw?=
 =?utf-8?B?d0thQTFMQWEyb09YTzZjbDBDRm1wcTNta0M0eVhOTUpOM3pRQzNwV2ZEVkFI?=
 =?utf-8?B?bnRhRnBoVldEOHY5UEZVRnZYUkRDWU5RTkUxVHJlNWd5N05Ed1VkeEh2YWs5?=
 =?utf-8?B?WWZ5WXFIbUhpWGF2U21WNlQ1bkFycDBzbTN6bDZiQW9VcG9KaEFrWEU3OE9a?=
 =?utf-8?B?NHltaE1mZGxYeUNNQ2NiRHdLaVlhakJBVFR2OStoRDNzclY3dzkwbnJPSWxM?=
 =?utf-8?B?YytLdXE5UW5YOFdGY0xEU1pzdlBNcmhYV0c1bjlsUDlpZzZZWkYxaGpIbmpV?=
 =?utf-8?B?elluQlYrYURHWmpsTVpYcVhET2RwdHJWY3d0bWZtYXNrRXl5VW04ZDBIQkJY?=
 =?utf-8?B?NTc0cEFMbnQ1TVlXeEV0a2VzNmRyZVdSOWxpbktYVGkrQzhjOUdjZFhTMjZJ?=
 =?utf-8?B?dEdmeHBJczdXR1NGelRxNUcrNm0rTE5YYVFvMSsyMFY0TTZiS0ZDNWJ3NDVR?=
 =?utf-8?B?dVlTTHRDK2pENEtEakhWQjcrZ2hnbkVKZWhHOFBoa3czLzdMZlBjVVQrUmlS?=
 =?utf-8?B?V00rTG10UlZzRGFJRVdBaGNFcy9ERllINlcrZXJZK2RVYTkrbVRTL1JaUDd2?=
 =?utf-8?B?bEhxcG5kM2Y1RVo0TUgwSHdMTHhxV0ZNcE8ra1RTR3JzYXVlOWY4NmVaU3J5?=
 =?utf-8?B?dzdvZkhrRnpYaDlHNU01aEpKR041ZUt5S1g2L21QTTR5a0N5aGtFM3FzYmpv?=
 =?utf-8?B?aHpuVnFQTnRmTUdob242OWhtc1Q1SVpWSXVuSXMvbTFiZFdueDg0eVhnbkZM?=
 =?utf-8?B?RS9VMTBxbFlxMXhQWWtjSjlTRDRyR2k1bTUzOUlVNWN6b0xPaW82b2h2c3o2?=
 =?utf-8?B?a1JSTURXTno1ZnhINVY0bGRtZDV5bXBaQ002WHBQTXRUeTFwSzNtYzhpZGpS?=
 =?utf-8?B?dG1pZmFOdDMvS1NVSzk2Y3dydi9tY2pxTXNaZUI4emVYWmRQY1psU0d1TXlU?=
 =?utf-8?B?UnlhM09kVlFNK1pBWTBlK0lrVGtmWHBIWEdMNXkxVjM1a0J4aFVSMUUxL241?=
 =?utf-8?B?RVYxYWJMbFF1NGlhcEFLVnpubWZpMEVkQm85Q2E2N1FQd3kzNjR4aG1hUjFh?=
 =?utf-8?B?eHFzeFdLRlkrNnlneC8xaVpmV1N0SzZ6VFk4REsyUlRQTzlYSHZZUy9OSWtS?=
 =?utf-8?B?eWNoV1B1SEZtNTA4NGJrNHNmRldzLzlNck1zYkt5SlJ5RGtVUGFtUyt6Qklv?=
 =?utf-8?B?ZGFtdmg4azg0dkZYdWlSRlR2RXZtVSt3TVZTRVEvd09UaUdzMXNFWDhabm5Y?=
 =?utf-8?B?SkkxeGdJMk93czkvUWhLeTFnOHNKQ2huN2dNWjd4cEtqZGw5RUc2NC8rNGNv?=
 =?utf-8?B?VVpwMm5Jd2dOV2lQb2ZDRTFQS3J0RVpiZnVLenNiKzNqY3ExOUtSelplbXhC?=
 =?utf-8?B?cjRBaEdDaTM3Q2NLWUNUZExnWnhhNiszd1M3VkoxQ3Z4b0luWHMzQjU0REtR?=
 =?utf-8?B?UDB3MWRWMVUxQkoyTkpjZk13Rk5wbG1uYnBPemw4N29nUUxhano5YklyUlY2?=
 =?utf-8?B?MzJDRWN1dEVFQmV6U2JkdnUxL0RjMWlBRFVPQVpJeU5GLzRUcHQxMmZzZkUr?=
 =?utf-8?B?dzl4MXYxQVhQc090Q0phVXhmdWtobDlseXAySUN2YVcyMEhJbWdDMmMxejYr?=
 =?utf-8?B?UGZublU1aFo2MkFaTXdWNlVseERyalkxNXlBakpzcHBPZ0lwWEdlMDZDbkVv?=
 =?utf-8?B?eDdHZ2J0U2tWbWp0Vlk1WXZwNUovZ2YwQ2FiM0pEUHI2MDI4MVFvaVhyc1l5?=
 =?utf-8?B?eUczQnBFcFRnSzh6dStZSVBWa0tIN0tILzVlNVJheEJsbnlyT1ZSeTlxeTV5?=
 =?utf-8?B?Y3RTZmJ0UWdnemNKcHdud1ZhZTBGV2JsMVg0Zz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(376014)(82310400026)(1800799024)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:50:06.8252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b2cc42-8053-420a-2d52-08ddb3b48559
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6385


On 25/06/25 11:56 am, Baolin Wang wrote:
>
>
> On 2025/6/25 13:53, Hugh Dickins wrote:
>> On Wed, 25 Jun 2025, Baolin Wang wrote:
>>
>>> When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS 
>>> flag is not
>>> specified, we will ignore the THP sysfs settings. Whilst it makes 
>>> sense for the
>>> callers who do not specify this flag, it creates a odd and 
>>> surprising situation
>>> where a sysadmin specifying 'never' for all THP sizes still 
>>> observing THP pages
>>> being allocated and used on the system. And the MADV_COLLAPSE is an 
>>> example of
>>> such a case, that means it will not set TVA_ENFORCE_SYSFS when calling
>>> thp_vma_allowable_orders().
>>>
>>> As we discussed in the previous thread [1], the MADV_COLLAPSE will 
>>> ignore
>>> the system-wide anon/shmem THP sysfs settings, which means that even 
>>> though
>>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE 
>>> will still
>>> attempt to collapse into a anon/shmem THP. This violates the rule we 
>>> have
>>> agreed upon: never means never.
>>>
>>> For example, system administrators who disabled THP everywhere must 
>>> indeed very
>>> much not want THP to be used for whatever reason - having individual 
>>> programs
>>> being able to quietly override this is very surprising and likely to 
>>> cause headaches
>>> for those who desire this not to happen on their systems.
>>>
>>> This patch set will address the MADV_COLLAPSE issue.
>>>
>>> Test
>>> ====
>>> 1. Tested the mm selftests and found no regressions.
>>> 2. With toggling different Anon mTHP settings, the allocation and 
>>> madvise collapse for
>>> anonymous pages work well.
>>> 3. With toggling different shmem mTHP settings, the allocation and 
>>> madvise collapse for
>>> shmem work well.
>>> 4. Tested the large order allocation for tmpfs, and works as expected.
>>>
>>> [1] 
>>> https://lore.kernel.org/all/1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com/
>>>
>>> Changes from v3:
>>>   - Collect reviewed tags. Thanks.
>>>   - Update the commit message, per David.
>>>
>>> Changes from v2:
>>>   - Update the commit message and cover letter, per Lorenzo. Thanks.
>>>   - Simplify the logic in thp_vma_allowable_orders(), per Lorenzo 
>>> and David. Thanks.
>>>
>>> Changes from v1:
>>>   - Update the commit message, per Zi.
>>>   - Add Zi's reviewed tag. Thanks.
>>>   - Update the shmem logic.
>>>
>>> Baolin Wang (2):
>>>    mm: huge_memory: disallow hugepages if the system-wide THP sysfs
>>>      settings are disabled
>>>    mm: shmem: disallow hugepages if the system-wide shmem THP sysfs
>>>      settings are disabled
>>>
>>>   include/linux/huge_mm.h                 | 51 
>>> ++++++++++++++++++-------
>>>   mm/shmem.c                              |  6 +--
>>>   tools/testing/selftests/mm/khugepaged.c |  8 +---
>>>   3 files changed, 43 insertions(+), 22 deletions(-)
>>>
>>> -- 
>>> 2.43.5
>>
>> Sorry for chiming in so late, after so much effort: but I beg you,
>> please drop these.
>
> Thanks Hugh for your input. (yes, we put in a lot of effort on 
> discussion and testing:( ).
>
>> I did not want to get into a fight, and had been hoping a voice of
>> reason would come from others, before I got around to responding.
>>
>> And indeed Ryan understood correctly at the start; and he, Usama
>> and Barry, perhaps others I've missed, have raised appropriate
>> concerns but not prevailed.
>>
>> If we're sloganeering, I much prefer "never break userspace" to
>> "never means never", attractive though that over-simplification is.
>
> Yes, agree. we should not break userspace, however, I suspect whether 
> this can really break userspace. We can set 
> '/sys/kernel/mm/transparent_hugepage/enabled' to 'madvise' to allow 
> MADV_COLLAPSE. Additionally, I really doubt that when the system-wide 
> THP settings are set to 'never', userspace would still expect to 
> collapse into THP using MADV_COLLAPSE.

After this patch, will a user still be able to use MADV_COLLAPSE and 
ensure no interference from khugepaged?


>
> Moreover, what makes this issue particularly frustrating is that when 
> we introduce mTHP collapse[1], MADV_COLLAPSE complicates matters 
> further. That is, when the system only enables 64K mTHP, MADV_COLLAPSE 
> still allows collapsing into PMD-sized THP. This really breaks the 
> user's settings.

This issue will still be there without this patch right?


>
> [1] 
> https://lore.kernel.org/all/20250515032226.128900-1-npache@redhat.com/
>
>> Seldom has a feature been so thorougly documented as MADV_COLLAPSE,
>> in its 6.1 commits and in the "man 2 madvise" page: which are
>> explicit about MADV_COLLAPSE providing a way to get THPs where the
>> sysfs setting governing automatic behaviour does not insert them.
>>
>> We would all prefer a less messy world of THP tunables.  I certainly
>> find plenty to dislike there too; and wish that a less assertive name
>> than "never" had been chosen originally for the default off position.
>>
>> But please don't break the accepted and documented behaviour of
>> MADV_COLLAPSE now.
>>
>> If you want to exclude all possibility of THPs, then please use the
>> prctl(PR_SET_THP_DISABLE); or shmem_enabled=deny (I think it was me
>> who insisted that be respected by MADV_COLLAPSE back then).
>
> Yes, that will prevent MADV_COLLAPSE.
>
>> Add a "deny" option to /sys/kernel/mm/transparent_hugepage/enabled
>> if you like.  (But in these days of filesystem large folios, adding
>> new protections against them seems a few years late.)
>>
>> If Andrew decides that these patches should go in, then I'll have to
>> scrutinize them more carefully than I've done so far: but currently
>> I'm hoping to avoid that.
>>
>> Hugh
>
