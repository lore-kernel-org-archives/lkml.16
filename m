Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04536846F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.67
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897978; cv=fail; b=gPpoTUEh4x+YrbzwKjmuujvOaVjzViRpM2A5BGYYQgS3Nt28l5RGFNuJ88K/z71fR9PWU8fikeX7VtFGaBM3werBMOOGC/qrppkX/qF3T2N8ozDjRDnahWG+RXm3fUxGUBKwHGm6NGxLMbNft6O4vqbgVxt1gOz7XSBQWJT2fpA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897978; c=relaxed/simple;
	bh=4hiBv8+KP4Y/dEwCfB2drEtaK+XKNquntrqHM6dRz4s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ufa6/5PUor9rXgii6uNP2TdqFWNSNke2VG3tL8h615RCsHO/57Xb16ykw22KZG2DHuHgTAXe1tGTa+0gn5bJihAljnlSv9s5V6GlI+iDU5e3qw6Rijtr0xpAYK04VwAImpf/0HA4B5fgNrZmIJ+JObIpvXVAFv8Aj/rgFhugH6Y=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ahSXIScm; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ahSXIScm; arc=fail smtp.client-ip=40.107.20.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ahSXIScm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ahSXIScm"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LwkdeWn2M9xSMHBk+2UXTu4EWupWDeHWwUM0Xk72ncqdsYF9gNf4Of6Hn4vnMUijppD9IuDwVwmVTgSoDfBPF+mGzb0mnyUOJyqveDuk0YeGUPVHWP19FHl/chE6xR9Pj5Mi99iuVg99RkvnEkf5zMR2n0DTqsIIOM3P7KjdbDdFgdt1E0zDCfVdF0RDNMMMwrtSuQkLXcklUuOEhaOejrWacC4ka3wq4Wz6v8Izk00hTqzqudMQNGPmTBkZKQCRwAbQlXBv3b0ZAXpuVndPjvKtQEz7BC1bhB2u9MWjQ/3qfthfw2M1Zf7IgKJzlchQVGN8Ojh2O55K7RgNT6W/0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snCZ0YBuTxSPxaXZ1JGmZhefbEfinqjEOzYm5+zMrpA=;
 b=ri0/I204Js8u1d5CjAxs7LpibI8xQiAlhlYwOXsI/txC9kegm2eknEogz+lO+OtBKWYHG/OpQPsw7OA+qtphc8RnHehXIDqmBWhhfz+GnLa0kddjUUZ8YoFI9wYWZeBroeNqxoofS6YlBDgGegr43EhgEzUGw5CMCyGIEaCzlnmRs0/VLwjC/iQLaK/qjAqS27f62rymWJhRWNiZQJcERCx39QlUO30foGHgmMoWa6pJzIK0Dg/HgwZtGTD6Vg18w0jNd4/0GyzJ+IlIxRrwqKfe3/nTmnJI9lhnzOsOyUzsTBRJFdDJAobBgJthZ9CoIT2Y6AU9cxyMhvkFAGB2ww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snCZ0YBuTxSPxaXZ1JGmZhefbEfinqjEOzYm5+zMrpA=;
 b=ahSXIScmIZkndctmmR9zWE0cID9Env7o4kWyxzG884hcuX6068OdY6vn3amS8bbDwEBAYP+YhVTjTbqOkfVFMN9f5S8poiVahoS30Fb5FhKu6iw0dQ1xAgISIyuFnlvreCDuBioAcApwaKK+e9mQf3JOIVNJfsvlGTJaiZwVc/4=
Received: from DUZP191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::24)
 by GVXPR08MB11010.eurprd08.prod.outlook.com (2603:10a6:150:1f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 07:12:45 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::66) by DUZP191CA0001.outlook.office365.com
 (2603:10a6:10:4f9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 07:12:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 07:12:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUSKhc+xG0r5CCUlCpAVDltbrnstiT/t06es+X123upo6kz177wO/+fCmAm5HZWDJMZgGngJAb2EpbT2FgtuJSuEo+//VR7hWbkjMEZke5lcyWGhhATDe22cm/tr5ejfFDVdp4jDRttPPUXCRCNA+ibQxdbxnxlUMyTlYVyB5lHLQa1lhej1DzRXguWGQl2VUwwTUWHq6nIgQyziqT3rwv3QvEXUDJ3f2mCw6AK1weAmwenIqojJpf2g6BY/6JMDWdo49VVqcVqg4Xo4whtyqwH4NJ2rcnGphpx18D93DIP6y+iyH4mSTMsuMAodtE5YnkGv8tukGi4SvAV3yr5Ajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snCZ0YBuTxSPxaXZ1JGmZhefbEfinqjEOzYm5+zMrpA=;
 b=D1KsgXO7knJDWyvdMvdbdWhStZqzStRsjGy6VwbL76XzRdZETF8CScV+jg/5qTe1t2GSXI7bWYf1+uo6Cor/dnSsWukOAshD7uJJCVXGl76gj+fzo9G+tBghRpLjLl+xV1pnDIl/vV0vs4LaVRwoO4QFDirRTxQarHa/vHpAk9N3UU7N80+xOwfxXHLg6DcmIis/cFZgeUHEFbWlhlmIqBtB5sQu8V5Q+1ScfGnXgmF9DBSr3HUoz+Y97vgFbvBzxhz7eE1zJcJJnukaBWpyubYMf0myOOAXYQAvOduezm5HY9VQxb5pptmALhSSx6HO+uIlA/9bl/fDKaUSNjt/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snCZ0YBuTxSPxaXZ1JGmZhefbEfinqjEOzYm5+zMrpA=;
 b=ahSXIScmIZkndctmmR9zWE0cID9Env7o4kWyxzG884hcuX6068OdY6vn3amS8bbDwEBAYP+YhVTjTbqOkfVFMN9f5S8poiVahoS30Fb5FhKu6iw0dQ1xAgISIyuFnlvreCDuBioAcApwaKK+e9mQf3JOIVNJfsvlGTJaiZwVc/4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV2PR08MB8296.eurprd08.prod.outlook.com (2603:10a6:150:b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:12:12 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:12:12 +0000
Message-ID: <a7d51d9b-ef00-454c-9125-35af5d87e3c4@arm.com>
Date: Thu, 22 May 2025 12:42:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: Add batched version of
 ptep_modify_prot_commit
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-6-dev.jain@arm.com>
 <4d4b7d91-8ed9-4fc2-9079-267ffcbebb12@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4d4b7d91-8ed9-4fc2-9079-267ffcbebb12@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV2PR08MB8296:EE_|DB1PEPF000509EB:EE_|GVXPR08MB11010:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7c1aa6-58a0-4aaf-68cd-08dd99000cf2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZWdiM2d6VjJldjBGMk5lc3hHR0s1ZFEzUEVvU0kySUNRNWVsT2NrSUg1VnB3?=
 =?utf-8?B?d2Y5L0NEMElYODVOM09DTDdCcWxqR2JYRVF3RmVVVU44VnpMNSszbXU5MUp3?=
 =?utf-8?B?bUNGZ3ZaL1p6Y0R2WTNrY0RUdWZiMWlydVlXWFRta2pWZ1lhQzFUQ1dVbHIr?=
 =?utf-8?B?WERYaHQ4a05sU0hDNzJyVVQ1bkd0dGhBV3VoWE0zejFmMmxnOFhFUGZtbzhz?=
 =?utf-8?B?T2VTaG9QaVhNcUpYQWFDUG1SL2h2aWM2dm9qYTlXSS9NaFgxRUJoZVRZSDVu?=
 =?utf-8?B?NE1oYUhsbEc3QVBaT1FmUWZoSTF2T2p4c3FSZ3NBTndRbWwzL0JISGhYM2pn?=
 =?utf-8?B?cDZJKzlCTDBjRG8vMnRldjEzOUx3d0xHSEF1VzdSNlBYTFRWeHJaS2dINnFz?=
 =?utf-8?B?L25ZbTN3dDg1V1pXRDcyRW9DS3QvYWUxRklIS3FwMms0VVhvek9SOXpGb042?=
 =?utf-8?B?VGxyTnBUajMzU0hvV0V0VlMvbWR6aWJKbkJrUGpWWFhlZVNXNExQUmU2VUNq?=
 =?utf-8?B?N1NLOWhLOWIzamZkOUI0RVJTNmpHU3FjK24ySFhZUzV3WC9kbHhQcXlDMXdq?=
 =?utf-8?B?cVlGanNBUXA2Z3JLM2JQT0pYTDdRYWwrM055WWlTeFFudEpIZ2hSUkZXa2o3?=
 =?utf-8?B?SXVYWnNqU2xML0I5Q2NadHU0bTN6cHpvTDRPbG5GTnpVbUJnQnExSVVTKzdZ?=
 =?utf-8?B?dS8wSzVhZ2tyMVllZzRqQnNaaUpranpFbWc5NjlhcWV3ZllndkdjcThoRjJO?=
 =?utf-8?B?bVBvRC91cVlEeTk0K3RudXEvd3JWc09aL3d5WGxyOXI3NHpCZENSYXlQdGNp?=
 =?utf-8?B?MHloL2ZBb0pralR6TG9Rd01HQitES25lU0NtbnNaWkFGMzJZWC9iMGV0U3Fy?=
 =?utf-8?B?Q0toUTZpWG1oclI2MU0xTzJOQ2NkS1BhUkdONEtQcVoyK0FTMHBrcEV0SktD?=
 =?utf-8?B?ZTRXTVFIRzdPS2J5ZkVnZVlUTGF2NTkwTEdHZmVUc2hvTFZrTnpqNll2a1dB?=
 =?utf-8?B?VE1Vczhab0hLblVXVkhLUzdlSkt5NC90ZUZVY0l5TlJob25scTUxSkNocndr?=
 =?utf-8?B?bUduVGdEQUJsNmo1RWFjU3ljelFJS3dpR3dGUHkzRyt5dUduYzBkdjYvNTdu?=
 =?utf-8?B?STFJZWlML0FJSnVxOTMzOEdVK2wxSW1peEtnSTJ5OFVMaVY2eHNrUXJKUTJ0?=
 =?utf-8?B?cHR5VnNCSStCbGE5dDl1eVZIYXd2V1NRcTRua1dPSFZ1QjJ0ajhRamJDVWtG?=
 =?utf-8?B?eUdLTkFLeFFYSzczUVhPaFZxOE9IV1FZRm1IRmxtcHNST0ltSHJVMHRhcFJQ?=
 =?utf-8?B?WkFsMHZlUWY3NW9pTTA1ZWFZNGtPNWV0VTY0ZEVDNDExOEhlK1IxYkVkUmpR?=
 =?utf-8?B?bkQwS2o3Nk80V0xSNlZ4TjJ6U3JjWUEweVFVQ3FtRnVvcXdWZDRyQ1Yxc1oz?=
 =?utf-8?B?QzUrUEJwTUxReVdvcEVXWlFLVnM0TWUrSDU5aVFZMTQyNU1RNTh6dTBtc01W?=
 =?utf-8?B?OFY4b3ZlNFhYSlY5M1hmN2RpdzZVSE1yTk5lOEc0R0Z1cUp2TWkwcEJxWkU3?=
 =?utf-8?B?ZkJUSjF6TmE1S0o3M1NzYXprYlpnT2RCNUZGTTBmK3VpUmhmNUpSaFdDbTRD?=
 =?utf-8?B?YTRrOWhQeGdCdVBqNUdqN3VlWUN6WWdZMElQY3crc3FJN0R1YlgyaEFBQkNN?=
 =?utf-8?B?MzJqQjJFemEyNWFuZzVGYlJQVGJFTU0vZkE0c2RzNC96VzNHTkI2L2dsbnZI?=
 =?utf-8?B?NVRheFZTSGtNMnJuRkg3Uk12dDFlLzhGVVpYcjFJWFdXUHVOUjNLdkplSDRO?=
 =?utf-8?B?YzhsV2tBWlUyK2cxUlZBellQa2FxK2lXR0NhV1o2M0VzQS85TTBwa2JzdTBy?=
 =?utf-8?B?bG9OSkwvQWVzUnl1TENJQzJ6MFhlTjlMSXIvT3NzcWo4Q3c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8296
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dac2b9be-99c7-42e4-aa18-08dd98fff945
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026|7416014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmNDZzF0UE53M1BSaldkTzhPSW5aNTFmV0tmVmQ1dVZja1ZQQ1lVSFRNZjZB?=
 =?utf-8?B?QUxrS3cyZEFXSXR0RXpGWWFyL0kyRDEvckI1Y3JDb3JRWjFrcnViMFNhN1hx?=
 =?utf-8?B?WThSeDFOdVUyQnZ2dUptaWhncUNjRHZheEc1S21kOUN6SjRRV1BWMkZHaVgx?=
 =?utf-8?B?OW1LeHBGK3FhVXVkMHBibk1Kang5YWlJRWwrbFVySGRpd013Z1VHZWNFWG5h?=
 =?utf-8?B?c1FwOXBkTUlnOHRCS1pCZ1ljdjVKWE9UZXpQc0h6VVRsMWZmS25Bc1EvVWZj?=
 =?utf-8?B?UWdiZTVFQklyeC83eTNab1R4U28wOGZJczVOZ3JaanpRbld1RjFkbzZBYU05?=
 =?utf-8?B?d3VMU01OMklWVzZTMW1xL0hhUGNXMCtHS1ZvclFBOTFjWDRRYm9SS3Bud2NF?=
 =?utf-8?B?UjJuMkt3UTc3Y0k4elpkWDZ4emNjVlE5akJnZktjWkFXUGJaUHlkRHdmOUlO?=
 =?utf-8?B?N0lUbWtVMWtJUnZTRDFFQ0F1VkEyL3ZkWElUVjU4Yk44UmdjSzQvdkUzZ2cz?=
 =?utf-8?B?Y1duY2lvNnRKRk9HTTduTTdTMVpPV2JSZzhST2FMbXRLQmw5ZTVsLzNZWUxJ?=
 =?utf-8?B?UDdmd0pIaVhhRC95MEJHN2dNMlJBbzI2eFNZSXNYWDRtVXlLcUxkQm9pN1dt?=
 =?utf-8?B?aEVJQXBJRVNsRHM2ZjdhWnQzZFV5ZGd4dHkrY1g2TDVJSWNLR0o1aUJaa29x?=
 =?utf-8?B?NzdaWXpTdFBKT05iYSs4NlBOSWVYM3NIcUUvYXZneCtZWHdFRlJZdUlqR0c5?=
 =?utf-8?B?S3pTc3dZcmM4ZUxFbjE3QWRkeVFoZDR4Mkt4SEYwMVI1cTBSbHpKRjN4R2J4?=
 =?utf-8?B?c2x4RlF3VWNwSmRIZUN2MWIvSkFxcWZVTTN6ajFnRVAxdUkzR25HMmxpV3k2?=
 =?utf-8?B?RVk4ZUZUUzJIb25TSFVqOHVmRzVyb1l0Y3paazRxbGFzdVJPMFFjOEtxZmtU?=
 =?utf-8?B?ekY1eHFOeWJncXZnRVFndGcyOE0waVRiRmRqVEk4YnlwZWVaYTMwSHMvelFq?=
 =?utf-8?B?ZnAxbkg3UTc5TjJzVWxvWDZNeVorYkxibll0cU1TYWNtTXd0N1Q4RzZmc05X?=
 =?utf-8?B?dUZlMlNsSFZHcENWamRtbW14TnBYOUtBZ3prSmk1TjVDam43cVpDMUFQb2g5?=
 =?utf-8?B?SEpzM0gzT1E3NklUSDZTVjRDQlRVQk9jWmdjNjkvc1BrTjRVcENNN1hkakVw?=
 =?utf-8?B?Y3FHRmMzRnltSUhJeGZBTWtHdW4rSHlmVHZsUGtQeitoTTdkZ2xhYzFGK3V4?=
 =?utf-8?B?TWRkOTNkSUVpVU9aNklmRnA5U2JtS0JFdFM1cUN5cmdUMGVGRnBlamN4S1da?=
 =?utf-8?B?U3dNaVp1cWc3eTJqRlVCd3JZTEV2bjV6ejV1YTlXZDByeWVscWVRTUc5aDNp?=
 =?utf-8?B?dmJTNGdwNlNxRTlBd3dMM1F3VUNVbFV5a1JHNjVlRngzRWJIODhlOHRndUxH?=
 =?utf-8?B?eTJBQVNzZmZ1VVFjS3UwL29xR2dsR1ZhNWYxekVBMklCWGx0ak1mbmNzQ0tN?=
 =?utf-8?B?Rk5KSW5ZR3ZTVUFYQWJTWkZxRWxjcytsalZXV0tyOEdya2lhd09Sd0hqcjhz?=
 =?utf-8?B?UVR2UityeUdaWnJ4WUc5RTM0T3NlNm5idE5KaGRybEVFOUFlNzZVVnRwWUE0?=
 =?utf-8?B?ZTBxQ3JpL2U3RlBuMWVsNzFMZG91Sm5PUGZnYmRjTGVnNGp3WVQ5SGRkYlFu?=
 =?utf-8?B?VnhlS2UrRXkycUdSdDVDaFplQ0ZDU1hTSENhK0QxS1FRazV6dnJadG8zUnZp?=
 =?utf-8?B?VC9ta1V0a3kra04weUt3bXBUQ1l5YTJaN1BjeVZOZ2Jhc1VsZ3VuR2dSQ2Iv?=
 =?utf-8?B?S1cyWTBtdW5IOWU2US9Bc2lEWWplYUIzZ2JvQUs3SFN2RE5qRFN4RnBDM0M4?=
 =?utf-8?B?RUZDUk8xV0NzWWhiaGxoK01CdENUNjFLN3BHSEV6UjMwTk5jVmtDNDZvOUJm?=
 =?utf-8?B?aytqVWh4dWFrSWN0VVA3SG9jNzZNOFF3djdkaFBLblhJUzNCVExPVnlGWHAv?=
 =?utf-8?B?SkQycldPT2xrdG5zbUNRMkdtR0RFYzV3ZUs3ekNXMzJ0REtEOTNJc1FrZVRQ?=
 =?utf-8?Q?3ouHII?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026)(7416014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:12:45.1757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7c1aa6-58a0-4aaf-68cd-08dd99000cf2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11010


On 21/05/25 7:47 pm, Ryan Roberts wrote:
> On 19/05/2025 08:48, Dev Jain wrote:
>> Override the generic definition to simply use set_ptes() to map the new
>> ptes into the pagetable.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Let's squash this into the previous patch; it doesn't make sense for an arch to
> implement one without the other. Otherwise, LGTM.


Sure. Thanks.


>
> Thanks,
> Ryan
>
>> ---
>>   arch/arm64/include/asm/pgtable.h | 5 +++++
>>   arch/arm64/mm/mmu.c              | 9 ++++++++-
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 8872ea5f0642..0b13ca38f80c 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1558,6 +1558,11 @@ extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>>   				    unsigned long addr, pte_t *ptep,
>>   				    unsigned int nr);
>>   
>> +#define modify_prot_commit_ptes modify_prot_commit_ptes
>> +extern void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +				    pte_t *ptep, pte_t old_pte, pte_t pte,
>> +				    unsigned int nr);
>> +
>>   #ifdef CONFIG_ARM64_CONTPTE
>>   
>>   /*
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index fe60be8774f4..5f04bcdcd946 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1543,10 +1543,17 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
>>   	return modify_prot_start_ptes(vma, addr, ptep, 1);
>>   }
>>   
>> +void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t *ptep, pte_t old_pte, pte_t pte,
>> +			     unsigned int nr)
>> +{
>> +	set_ptes(vma->vm_mm, addr, ptep, pte, nr);
>> +}
>> +
>>   void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
>>   			     pte_t old_pte, pte_t pte)
>>   {
>> -	set_pte_at(vma->vm_mm, addr, ptep, pte);
>> +	modify_prot_commit_ptes(vma, addr, ptep, old_pte, pte, 1);
>>   }
>>   
>>   /*
>
