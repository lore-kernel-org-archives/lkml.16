Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011018.outbound.protection.outlook.com [40.107.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176C2045AD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208146; cv=fail; b=PxrWKP3bwV3roMNF2aSh1qRqyZ+iHsdCIJ7WwYtRYSE4TA/ECzNDQr8+LT9Ej4KdQaWYYUqEOFY8wVczZs5N6ml36PyFK8VF6xsUaMQ2Esmt+UCrP+/wAMBwqq7Fyrt9hJPCiwVa8yLGX8skuW1D8HK1hEHJlkpDQjkT2WRsIzY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208146; c=relaxed/simple;
	bh=POqkcvFfI9cYtWK/V9FhWnnxPYoz4RpPBx2hB3CmzoQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FeTv1AjSSv5DqG3BjvIGxm4ksjwbI93PIuo2qImNiPcSzO5kggU7fgU5iv2OEpujlCZoZ2D9jdNk7PzQhUBe3LWf6DCl6i6r8qzSk5BH95cJuYlDIiaW0syCWIBEL8adnkWHJ0QNKa6umWS8WShpuBDe+Tc/Y83yLA3tMBvM4zY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P875yah8; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P875yah8; arc=fail smtp.client-ip=40.107.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P875yah8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P875yah8"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RretKA24+htvGxTXQ+8O9UZGheOKUOIMiye9DHYevYRWftuAI7biCQnwnnjZJX+CFycdPVdGmpepG8q4gEUHaqNzoL9aEPZMJIjbt8euY8pYwiFXMPC/Qxrd9+7aC7KJAM3ZS9Tc1diykzWYYOpzYAucUE4hKGt5+wFmI2gARvnHQGJTWRrNu4ZsKHgAFD2mqGiGU19pt+9Tz8Klk4quLrNJBBuPo0tN9uNXEh4JqjrJTJ5xEG0Igo2i0SOe8EAOw54g47fpP9Li5lKsho60zOUSM3Rbaor/gfKyeP8NbAWnGI2utNsaaHBaT8pisbEPBpKd0mV7j2yqcT4NkOkorQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anwSU70I5sZHHSEdYyScDb/+deGA5K7JxsW4H73Zlq0=;
 b=NySmcCVv3SvGujSlxu1OiZzAvl70OoXR5/NynoKo6noTVoKeCFw+8Cf2A9NmPGIHEG29trpE2wEB+zOWFfCb9cnc22RA0jYDgYG0ngXCBBcgmF7PAuCczOKRkseSfLfHKpBTVgbnELhtVs07GEO+iuiksFER8KIDXvySQQ+Op8mzIlgT/XM0mOe+HTvXZghj6IaKzYcdbY6nuRWt8vydMbJxfZsFxw2yk1hmwcPi3CbssuT+7nVo9OKvAPPMGc/N81F1UQRKzKgDiye9fCRkdQiyKyJtq3qPmdUnJ2R1QerzrexsnfZW/JQeexcTugba/RclurkZ3ZVPEJTY0Krcng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anwSU70I5sZHHSEdYyScDb/+deGA5K7JxsW4H73Zlq0=;
 b=P875yah8FCxLPPUaRQER4FAkFoqf4uSPuTOdtOXzBhqQaHUV2BKT8H26GbliSm9G1J02/KxAaLyGX9RwIydlY9UHsHCb5UqmXhRMDZymUiQHI9JL8q/AytB3zsUtP8aU1eWRsOIPqnF6Ok+ha+E4j+MC3ZqbLxUJYsF824ctLTY=
Received: from AS4P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::15)
 by AS2PR08MB8361.eurprd08.prod.outlook.com (2603:10a6:20b:544::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 11:08:58 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::3c) by AS4P250CA0025.outlook.office365.com
 (2603:10a6:20b:5e3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Fri,
 6 Jun 2025 11:08:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.2 via
 Frontend Transport; Fri, 6 Jun 2025 11:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCUEfbH94hIhOpahy/soRviCmgbeVfdL4SFI7al/uvcHWozEaajeqiGJhRB8dNmf518eK+ezbnMF7BSYwQcDg0hURuHDlMyFq7NsNVBin3ev6+qGo6dGJoALZC6eYdLVAkieWEjATWxHVUC+j3Q0T8YblODLmiyxCx4bhESmbdGVME2ktO5XBaIJsQkIRYf3uPQg/JdG6ASJFwgunU9MZHWetPO0dJwYVsPEzyj2oJE/1o2tOZ+5Vi/YwONhsq2OlNcSI5gl1UnqgfHD4ptgXEpLDlCmOTL7EgD+L+pX/ZmwEQgurUymMCB5jCyAEHe3Cz1e/4B38wlIUo3U6dBbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anwSU70I5sZHHSEdYyScDb/+deGA5K7JxsW4H73Zlq0=;
 b=nD1TEzuQUsz+Z8oR3oBarzbRozn5/SF76feUrQ2xf9BcTwdr8S+PSvxQGVni96sSw5rlUWb2yx2dWUsyYZaeT23Tph0G6jAGGw/211j9xvuExkHzQnt3D2q7tYBa81CgSvfgNuspJBoJmrHOfN+a5Ar0C5wCsVs0HK9YNOL+iShikzS+bKAnKUJ825ZLvxYBTTw37VRVon/Jto3eXMwn9P8dljvAHzi/fVp73lY3tC9SLgQBFqHVbqrSMw4+ex/wmKf8g4KfKh9xVIjVzi6yfIKE+natMJJpjOZjI7y5zWZSRDSVpYbEODfyBrZ7F0q7rZbK9d1fwrHR1j6sDz8kPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anwSU70I5sZHHSEdYyScDb/+deGA5K7JxsW4H73Zlq0=;
 b=P875yah8FCxLPPUaRQER4FAkFoqf4uSPuTOdtOXzBhqQaHUV2BKT8H26GbliSm9G1J02/KxAaLyGX9RwIydlY9UHsHCb5UqmXhRMDZymUiQHI9JL8q/AytB3zsUtP8aU1eWRsOIPqnF6Ok+ha+E4j+MC3ZqbLxUJYsF824ctLTY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PR3PR08MB5818.eurprd08.prod.outlook.com (2603:10a6:102:8b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 11:08:24 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 11:08:24 +0000
Message-ID: <a6d9c651-6743-4002-8a0b-fdad617ced56@arm.com>
Date: Fri, 6 Jun 2025 16:38:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 Yang Shi <yang@os.amperecomputing.com>, Ryan Roberts <ryan.roberts@arm.com>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-3-dev.jain@arm.com>
 <f528506e-b04d-4c80-93c3-93ba4ca385bd@lucifer.local>
 <f6b203cc-de3e-45ac-b2e3-b2d9f8ae0c31@arm.com>
 <d2ace2dc-0d1e-491c-b574-b1fcc65f9a88@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <d2ace2dc-0d1e-491c-b574-b1fcc65f9a88@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PR3PR08MB5818:EE_|AM4PEPF00025F95:EE_|AS2PR08MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 46376c03-8cdc-474f-349a-08dda4ea88aa
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eG9MQzJ5VjNZNmxNWTdROTRkYTVWZmw3N3ArR2hIb1pocTQzeE5seHJYazNu?=
 =?utf-8?B?ZmpWc1BaS2liZVBuNDk0MjBXSlJCQUl5SkEwVWpFemJ0b2Z2ZG1JT1phWnMy?=
 =?utf-8?B?THhrbTN6THJOMUNvWTlucUNXOWZaVTVKaWlQU2xvNnFDMUZ3Sm1DVnpMWFRy?=
 =?utf-8?B?aFBibjZoSC9sOVZJOWlZWkQ3eTYzaXVXb2ZEVnVmZzM2bWFmY0E3UFUya09j?=
 =?utf-8?B?aW0xQi8wR0pNT0hFc09hbFNSWVZCdmFUMWgvdlR0Q2xzWjBySk5ia3RjZ2pV?=
 =?utf-8?B?b1RyYlkyZEtVWklIYUp3Y1lhaEZQd09VdFZSRGhzUStkdGlsYk1hd0JWUXM1?=
 =?utf-8?B?eXRER0srT2JGMXcwLzNvTkNPaTR6aFVWR29ZdmxxSFJDZVJDalBKbTFmcHNV?=
 =?utf-8?B?ODJiMzUvKzZ0RVluY0drckVLSnBwUVJkVUdRQlhGdTA4TDFVZmgrNDhPWGJi?=
 =?utf-8?B?RkVWRnpSSnhyT3puRkJSS3c5K0I2eVQ4WDV6NjhYZlVUdXlDbmNMWU5NcDcx?=
 =?utf-8?B?YW1KcUVsVWxnYUdxWEZ6eWxZWjJ4SGU5cDQwUUZpWUloczNFcG04UnhtSEhP?=
 =?utf-8?B?S3VWdFFSd1RYM1luMi9hV291UCtMSWpJWmp2MHZUY2ZtbmdiZlkvRGcvL1Nw?=
 =?utf-8?B?OVl1dXBzNlNUSisvMUFPZUZUR2g1anNFYkhHUkZBZVErSkN1TDZVQVpnRWNT?=
 =?utf-8?B?dnZLVTJ1bXZlVExwSWlsbUdhZE9tb0s3VGJJMDRsa1IvUnc0QTcvOXp0SlNI?=
 =?utf-8?B?YnRJWEYrZ2hUQ2g3c2RXNnl4cFpVM1daTW00R2NSMndkbVdDeW9Ya2FxRktv?=
 =?utf-8?B?NXo2VmhTQVNuTm1sWm1Dd2R3bzdTS0VlOVNWV096OG5aVmZMN21DanRjd0lv?=
 =?utf-8?B?dU01aUNLR0pubVZDM2R0K0FkQXBPUDZxQU84S0FRdDNRTDhJSUdaTEV6Vkps?=
 =?utf-8?B?cFFtdERIL0tSb1VzcXRhWURER0NyeEh5NGF6TjNXenQwdWwrb0YrcmZCcDA1?=
 =?utf-8?B?Z0owMnkzbDltSWQ3L2tvaDhMWEhxWnNlYTZoaWFYbmhEcWxyREt2Y3J6NVg0?=
 =?utf-8?B?OHNta2VIQ1hRMzRTZWhQYUpnV05lYlVvUVUyWk9yZzhwNER3VDhBalUxaUxL?=
 =?utf-8?B?Wml4RWh3RjV6Uis3Y0JWQTZuQ0lFNkN0Zml3aG53Nm42T3IwTk8zOE5YdnFD?=
 =?utf-8?B?Ly9wTkMyWXhkYnQwdklSZ3hyNWQrSDJHalRUd3dXOWpIUEFpMFZmblU4NDVn?=
 =?utf-8?B?TnRiR2VKdjhWUXBsMlRZdEFXSjJUaktPVmZ1SnpBUk9heUhXWjE0bGVTTUFw?=
 =?utf-8?B?amtZYStyeWxsWk9wb2gyQzRUZHpiNU5hajBYYytNRFBkSU1kNjFleU0zRmhx?=
 =?utf-8?B?REk1dSt6SDBEOXZBZmVwVHpicW5hT1VzOWNwMmlPWTdraWtJcjZ1UTNYcEo2?=
 =?utf-8?B?QS90QU9yQUcyLy9jQkFaQ2p6NjNtT3loTDFEK1JGR0ozeTRXWjk1THNtTjE1?=
 =?utf-8?B?QWl3dGVwVUNNS0hyVzJ2ano0V21nN21vb1hzalNRL29NMU4wb081a2tFWlJO?=
 =?utf-8?B?cXE5NkJNVjB4V05zL21ROVBidFpORkNjWGQwUU92dW1EalVkSGMwek1lMThn?=
 =?utf-8?B?RE5HRWdtQVZ3NzVhblZTdkhOM3R0czBFLzd0bnVFQ0p2SGNYQ2Zaa2VrUHhv?=
 =?utf-8?B?Y0tJeWg0Q3luRGJUcGpiMndyaEREMk1TankycXVZZXRDMWJhdkh5SWxQODZP?=
 =?utf-8?B?dnJQR201cmY2S2xPZDY4Y2tlWWFKNzYreGlBM3dJMXFmL0QraGgyYTdZVnlx?=
 =?utf-8?B?WlNsR29ZT0VJaDNwNmJRZ0RtVmN4QTQxTDBkN1RONzAvVzcxUnU0S2pzUXdx?=
 =?utf-8?B?U3BGN1Y0Mm5teXllTENtaVJ2aGd1L0dLdFZDUjR5eGJFeUxHTFVmNjFWeGZG?=
 =?utf-8?Q?OpNfUrLqqhs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5818
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87334a4c-ea07-4179-6da4-08dda4ea74c4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|14060799003|35042699022|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFV5aFpBVFcwMGFpNlIxSHNWK04wTVUzZklHTXkwUmRNZHFRNm9VSENzdUlP?=
 =?utf-8?B?MVJiMHlrdEd5YmQ5bCtQRjlPMHJQMUxNeW1EalR1QjVWbU9ybS9iYk5GeElH?=
 =?utf-8?B?VUx1WXE4M3JXYVgrMlpZSVg0WFIxTENLYTZRc0wvOFFoUmtLRGVsMHdKcWxO?=
 =?utf-8?B?K1ZwM0FKSTd0UktuSFVKcW1DVXZXVnVYOUNwZm5tTXlUNC94YjBFcTJRaXBL?=
 =?utf-8?B?S2ZMTTNibVpyNWwxKzFycW52THNZcVl0KzBkdWZZWWhPd01aQWw0SEVmcWVL?=
 =?utf-8?B?MHVCZ1Zwc1ZabmZCYXNUWmsvWUtJZ2RDZENjSUExN1ZtY2F6NktDZW81a0Jx?=
 =?utf-8?B?WWhOcGVsZkJTS0dpMjJXek1ZQ3E1Z0k0RjFXdU9xNnhmM3dBRnAyKzhTYlJF?=
 =?utf-8?B?TCtjN0ZKZ0NkcnU3WTlXdXN6bjB6T1I3UlhJVG9qV0ZVWUppT0YwcTFnZU5I?=
 =?utf-8?B?YmZRa2d1ZnAwLzBReXpWSDNQNmtUKzhmWktwZkdMMHRFVnl5cFBnM2I0Z05y?=
 =?utf-8?B?c1ppZHJybEllTEpVZG5WTWVqWnYwWFNSNCt3VjdKMkhidm92THBQeFpWWnRy?=
 =?utf-8?B?QU1sYlJvY3I4Yzh0c0diZmRHWGozS1NsNVZLTGc5cWd4N1E3Y3hWZTRzUWlR?=
 =?utf-8?B?b3FJcnI2ajJMalBQZlRXTDdwZStjdzBkQ2RZajUvSkV4Nk8yckpEREdjN0t1?=
 =?utf-8?B?WEpSN3JiQVhCYW9odFhlKzhoR1JqbVVvL3dRNUVLYWVyVzR6WWFXVXZIdDh2?=
 =?utf-8?B?UTNUQXNabUorV1pKRDhwSlhUQk1UbGZUbExzd3VxNm9rbkxsZXM4UlRYWUNG?=
 =?utf-8?B?Q1lNaDk1Y0h3YVV5WitONEdXNUwvQ05tcC9DVTV3MHNxTjRESHowendQUjZW?=
 =?utf-8?B?YWFCR21nbUZUdGswS05jdSs3TXROZHdlcHJ4c2w3R3p3MklnOUo4eEhFZFpr?=
 =?utf-8?B?KzQzdkl2M25NWGRCU2c4dUlKeEsvQ04wNElkbjNHRnlYengxZnJoN0tKYnNo?=
 =?utf-8?B?Nm55cVJjendiMk5oNnRkNWhKb1Z6eFBIVlh6MW1xMTBaZHlQMGJPQ3JtdUZW?=
 =?utf-8?B?Ym1hUzExRHNSVXpvOFBOMDZpNDZ4clpLUVBBY3RVVlcrckVxT3NDZGZwaVRM?=
 =?utf-8?B?TUZBUFp2N0VVdHNydlNyWFlhZmVoY1IvRmRGc2JOOW5hMkkwTTNsNmwrTC82?=
 =?utf-8?B?Mm43Y2dEUnJXZ0tydkREZWpUMGYzQnZuRy9MQkwrNHdZYkJUaTVqdnIyZWdN?=
 =?utf-8?B?RXFoZEdLSUtlNk9QOU1XUUgxZnBEMmNMM1M5bGhVUDN2UGNncGlWREY3eDZw?=
 =?utf-8?B?VUNJT2FkMFdxS2FHSXRuT3FiNmRUekEyNFN1WDNQSyswalQycFdmUG85SFJl?=
 =?utf-8?B?K1JwdDNLTGR1bHlGcnJhSFVhb1dZSlVmMm9QbzhaUG5vOUVTaW5yMGxxdmZG?=
 =?utf-8?B?Vk90SUI1cDhwWFg4UkJGY2tLZTNsczAyQzZSNWtoWTdBTS9yeHI1QXY5b3N1?=
 =?utf-8?B?QXZvTlVWZlNtNENLbGU1eEFwMkVpbUplbGw4SHFSOXJzS2dZR3Q1OFJiR3VP?=
 =?utf-8?B?TG5CS0VGOHdhbHBMOHIwOHc5VmRnUVBPMGl2Vlczc0xnL3lpTEN1blBOR0p4?=
 =?utf-8?B?a1ZJTWtQeGs5MlJ2UDF2MjBJQWUxTUs4Q3FlUzBvSTVXMmhubFhDak13MHUx?=
 =?utf-8?B?SU1PdXN2dDVCYjl1RU1LRzRqcXpoSGRjdTBCYjNycUlxaFBQY05XM1BoU2tW?=
 =?utf-8?B?YUcwYU0ranV4QSs0SEw0MkpTb05NNVczamhzZnJMR0p1RHd3M1ZWVXJEYURt?=
 =?utf-8?B?aUx4M2NzOTY1T1VxaThvWUJOb09aTGlyUTJVQU1TVWFoMlNTanFnUW1DV2l5?=
 =?utf-8?B?SWQ1ZEJpM09haGo5NDc5bjY4NnBLd2xyczVMNDJ5THhad0liYmwxV2R2NkJW?=
 =?utf-8?B?MjVqREF6SzBNb3k4a0hkMlNIQjV4anF3MmJDUWUwUC9oMVVxVFhDb2F6SVNh?=
 =?utf-8?B?a1cyL1FMZ0ZEMWZFcE5KZVk1SDBpam1BRHRWK0hiSjdTRHBOQWdkTk5KbnhM?=
 =?utf-8?Q?gl2bRp?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(14060799003)(35042699022)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 11:08:57.7710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46376c03-8cdc-474f-349a-08dda4ea88aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8361


On 06/06/25 4:26 pm, Lorenzo Stoakes wrote:
> On Fri, Jun 06, 2025 at 04:09:51PM +0530, Dev Jain wrote:
>> On 06/06/25 3:19 pm, Lorenzo Stoakes wrote:
>>> On Fri, May 30, 2025 at 02:34:06PM +0530, Dev Jain wrote:
>>>> Move away from apply_to_page_range(), which does not honour leaf mappings,
>>>> to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
>>>> if a partial range is detected.
>>> Hm a follow up question here - why not just improve apply_to_page_range() to
>>> honour leaf mappings?
>>>
>>> What does honouring leaf mappings actually mean? You mean handling huge pages?
>> Sorry, I always confuse between block, page and leaf mappings :) I mean to say
>> block mappings, yes, huge pages.
> Sometimes I think we like to give different names to things just to make life
> confusing ;)
>
>>> Would it be all that difficult to implement?
>> That is how I did it initially. But I think we get into the same problem
>> which you are describing w.r.t extending walk_page_range_novma - currently we
>> return EINVAL in case we encounter a block mapping in apply_to_page_range,
>> basically asserting that the callers always operate on page mappings. Removing this
>> assertion and generalizing apply_to_page_range kind of sounds the same as
>> removing the locking assertion and generalizing walk_page_range_novma...
> (Again keep in mind walk_page_range_novma no longer exists :)

Ya I mean the pagewalk API.

>
> Yeah it's problematic I guess in that you have a pte_fn_t and would have to get
> into gross stuff like pretending a PMD entry is a PTE entry etc.

Yes, since the pagewalk API has level callbacks it makes life easier.

>
> Ugh god why do we do this to ourselves.

I know right :)

>
>>> It seems like you're pushing a bunch of the 'applying' logic over from there to
>>> a walker that isn't maybe best suited to it and having to introduce an iffy new
>>> form of locking...
>> IMHO I think it is the reverse. Commit aee16b3cee2746880e40945a9b5bff4f309cfbc4
>> introduces apply_to_page_range, and commit e6473092bd9116583ce9ab8cf1b6570e1aa6fc83
>> introduces pagewalk. The commit messages say that the former is meant to be used
>> on page mappings, while the latter is generic. The latter implies that the former
>> was actually never meant to exist...
> What a mess.
>
> Maybe the least-worst solution is to just add a new
> walk_kernel_page_table_range_unlocked() function without an assert and in the
> comment heavily underline that _you must have made sure this is safe_.
>
> This needs revisting in general, I find the use of init_mm.mmap_lock pretty
> gross.

There you said it! I have been reading kernel mapping code for some time and
the entire point of using the init_mm.mmap_lock has been mutual exclusion,
completely throwing out of the window what the mmap_lock actually means.
For example, we take init_mm write lock for ptdump_walk_pgd(), which does
not sound right to me since the only thing ptdump actually does is walk
the pagetables, yet we take the most restrictive lock.

>>> Can we go vice-versa? :)
>>>
>>> Also obviously walk_page_range_novma() doesn't exist any more :P
>>> walk_kernel_page_table_range() is the preferred solution.
>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    arch/arm64/mm/pageattr.c | 69 +++++++++++++++++++++++++++++++++++++---
>>>>    1 file changed, 64 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>>> index 39fd1f7ff02a..a5c829c64969 100644
>>>> --- a/arch/arm64/mm/pageattr.c
>>>> +++ b/arch/arm64/mm/pageattr.c
>>>> @@ -8,6 +8,7 @@
>>>>    #include <linux/mem_encrypt.h>
>>>>    #include <linux/sched.h>
>>>>    #include <linux/vmalloc.h>
>>>> +#include <linux/pagewalk.h>
>>>>
>>>>    #include <asm/cacheflush.h>
>>>>    #include <asm/pgtable-prot.h>
>>>> @@ -20,6 +21,67 @@ struct page_change_data {
>>>>    	pgprot_t clear_mask;
>>>>    };
>>>>
>>>> +static pteval_t set_pageattr_masks(unsigned long val, struct mm_walk *walk)
>>>> +{
>>>> +	struct page_change_data *masks = walk->private;
>>>> +	unsigned long new_val = val;
>>>> +
>>>> +	new_val &= ~(pgprot_val(masks->clear_mask));
>>>> +	new_val |= (pgprot_val(masks->set_mask));
>>>> +
>>>> +	return new_val;
>>>> +}
>>>> +
>>>> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
>>>> +			      unsigned long next, struct mm_walk *walk)
>>>> +{
>>>> +	pud_t val = pudp_get(pud);
>>>> +
>>>> +	if (pud_leaf(val)) {
>>>> +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
>>>> +			return -EINVAL;
>>>> +		val = __pud(set_pageattr_masks(pud_val(val), walk));
>>>> +		set_pud(pud, val);
>>>> +		walk->action = ACTION_CONTINUE;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
>>>> +			      unsigned long next, struct mm_walk *walk)
>>>> +{
>>>> +	pmd_t val = pmdp_get(pmd);
>>>> +
>>>> +	if (pmd_leaf(val)) {
>>>> +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
>>>> +			return -EINVAL;
>>>> +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
>>>> +		set_pmd(pmd, val);
>>>> +		walk->action = ACTION_CONTINUE;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
>>>> +			      unsigned long next, struct mm_walk *walk)
>>>> +{
>>>> +	pte_t val = ptep_get(pte);
>>>> +
>>>> +	val = __pte(set_pageattr_masks(pte_val(val), walk));
>>>> +	set_pte(pte, val);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static const struct mm_walk_ops pageattr_ops = {
>>>> +	.pud_entry	= pageattr_pud_entry,
>>>> +	.pmd_entry	= pageattr_pmd_entry,
>>>> +	.pte_entry	= pageattr_pte_entry,
>>>> +	.walk_lock	= PGWALK_NOLOCK,
>>>> +};
>>>> +
>>>>    bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
>>>>
>>>>    bool can_set_direct_map(void)
>>>> @@ -49,9 +111,6 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>>>>    	return 0;
>>>>    }
>>>>
>>>> -/*
>>>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>>>> - */
>>>>    static int __change_memory_common(unsigned long start, unsigned long size,
>>>>    				pgprot_t set_mask, pgprot_t clear_mask)
>>>>    {
>>>> @@ -61,8 +120,8 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>>>    	data.set_mask = set_mask;
>>>>    	data.clear_mask = clear_mask;
>>>>
>>>> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>>>> -					&data);
>>>> +	ret = walk_page_range_novma(&init_mm, start, start + size,
>>>> +				    &pageattr_ops, NULL, &data);
>>>>
>>>>    	/*
>>>>    	 * If the memory is being made valid without changing any other bits
>>>> --
>>>> 2.30.2
>>>>
