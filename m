Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012044.outbound.protection.outlook.com [40.93.195.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E2E257453;
	Wed, 11 Jun 2025 12:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645731; cv=fail; b=ofFZkW+wc2Z5Wy1FC2sOCod78bKp3RZC0TkmQTsWiUEuvkcS3x72S2INtyCR/KEPS1wcfHmqSSpMsiQMAAKFy3GcIF2usW8z0nI7xzNBIfUrlT/QjtK0ccOyRwbwEY2WL8f3QCniShsxW/YxArb1gaxdWtE8GSAsN0SXi4bhn3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645731; c=relaxed/simple;
	bh=1dBNu1qZgQlUZqA51lbw87p9iRkIk9D2L4MzGwIgsnM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sbtmF5S8qvQHBcdwNu5s/j+Z0V2k8SeuFNFEf52suFzGKB1y2J48/8Qf6qibPzyctKgS6VGi+csMYGyYzwzGlv1f8mc60oJb+8g5aYoF1WuTm+XVwKkgLJV9qzQNfn2K/aFQNDxs8uIOjBmQpNrX2nEHtUW+i1ZCcxmQeBAQ+vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=J+3jP4VV; arc=fail smtp.client-ip=40.93.195.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="J+3jP4VV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSj+hOpgDotZh7xLFBpiOeef9hKW7W7+cWrMP9N97dS+JxF2cUoC9QcphjeS6gwfWEawFYfSpdG9CPFjRbJhR4Os0S637zdOqPrZJNKpyGuc7vlwFaiqCGagqsbexwcT+guyabPftOCBwTlZsasw+CwKM7UAcb+aZaybyINNqEYJqlCS0iL23ejpjUgUnRPVlT3fMXu3WpzphyJa2P0Rklk6GzyplrmehjPqq+8GRvGqxMlX9yju/SGgjjjHMFsWNWi0CI2HU97RLNPh7v9hGYZ9FasdZ0t083qllsdKYn9Q9IOHmU1SHrLiVQpTUPViUH45u4zRkcJ0YiNCXN+hoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoEnRq4nuG8aoPrKiFF8Y6PkO2wAiTB8YJYOg2n4JVA=;
 b=pL5Eq2Zp2bPk2SLS1Agr380MpuIbTImN2Ad7K7uSapdBlbuOx0JL1NAlAoNyAOpOZYGJ0RZHRa0EtjAEbFl82IwuRE/aKE+tLDjck0gJwctvOqPLOhNDzZXZXenNXczu8nSrI/Fvl2uqdVhdwv6ws9uqIgpk5x6GM7SSHdvuc/1AbI3K0lzAWUKhKfM7VhZZ6gckI0FGG03bd0y77ATJRP5o41pcpHQc7kWoMgDQL/8efwkZm5jL1JQiUvlLa/5ddGTroTsXA2wD0mGSJJ0188OQbD5e0nO0vO+w+5hbxrAhQgwhZj5r3oZW8rez1bmYJMMgDx97MA6CIy5aEa16zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoEnRq4nuG8aoPrKiFF8Y6PkO2wAiTB8YJYOg2n4JVA=;
 b=J+3jP4VV1EXTZ0pvlSiYEyeStkYY11xFm8NynG+LUmz4QTJvcroz7O+rbyDwOZr8/+LNAgOEgOig1OJLw1q9I50cpUV1lskB6ZyBhQV/0LCxk7AkspEQT67ImHxrDLu6dSXyvyV8K4pIRLy3xOH/XnIipgSQSujlGeah36UHcIxHTzbYffBDP/O7fTW2omyoCAU55f/HnO9QpBAxBnRSt5D0lajCFiR8VZNXg9VfjHtrLtzd43uq0QerGMDI7jQt675iZEJmuAx9CXdlmi81Bpb9mA6Rs0dpWMTiyvEtfd3bDPvnDDs2LQTjS8C4frXLCs9y69ElhFEroc6JG2YxQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by DS7PR03MB5480.namprd03.prod.outlook.com (2603:10b6:5:2d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 12:42:04 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8792.035; Wed, 11 Jun 2025
 12:42:04 +0000
Message-ID: <b7c104f6-ce31-4d15-a719-001374e7e580@altera.com>
Date: Wed, 11 Jun 2025 18:11:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] firmware: stratix10-svc: Implement ID pool
 management for asynchronous operations
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
 <20250610-sip_svc_upstream-v4-2-bcd9d6089071@altera.com>
 <7ca5a936-b5e6-40e5-9d40-a1cf5ff37131@altera.com>
Content-Language: en-US
From: Mahesh Rao <mahesh.rao@altera.com>
In-Reply-To: <7ca5a936-b5e6-40e5-9d40-a1cf5ff37131@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To BN9PR03MB6201.namprd03.prod.outlook.com
 (2603:10b6:408:11e::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_|DS7PR03MB5480:EE_
X-MS-Office365-Filtering-Correlation-Id: 873d4a22-0645-4111-880b-08dda8e55e49
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2tDZUhaNHoyZmQzMEtQODZKaVFzT0xWNStEV1pHVURmYUhsOEVneEF5L1Av?=
 =?utf-8?B?cFd6c2FoZmVwVXM4RWx5T1JsNTZxeThvNDUzeWxYdno2em1idjhoeUFTYkVT?=
 =?utf-8?B?ck1DVE4yN0xZamlZUGNFNXZGSm1uS1AzMjBXNzQyOTNvSUJ2YUJHbVZaMCt6?=
 =?utf-8?B?YllFT1NnK3Q4cUxaYW5qMEVueGZRbVlBM0dRbGF3MVEwam9hcDZIbHFjRjBE?=
 =?utf-8?B?cm5CMkF4QjRDTHg3ZG9pVm1BSjRnOGh0Z1NaYi9nNDN1VjVveFUzZHc4Snpr?=
 =?utf-8?B?RDZRS0NuVVg3S2JNdWs4MEgydVU1WUViV01idWhpVEVHQldxYlUzaklUaVVU?=
 =?utf-8?B?YVFOZ0EyNTFibHcwSGVWeHhVcDZzdzBaTi84WjNIWVpPQVpKd204UWRJNDZv?=
 =?utf-8?B?R05vYTEzbmhyQVpkaU5Ba0x1ZkowNFJkUHcyd0EzUHNndmhEdU1ZUlUxeU14?=
 =?utf-8?B?MmJ1a09mTk1WQm0vdnZLSW9mVFcxdERZcUllWlc0YVNPY2tZRXEvaytkVk9T?=
 =?utf-8?B?bTV3ZjFkVVd6V3dDbWJoclNmZndEREp0V3I2V085Z1FmUUM4L3hwazZOT3FI?=
 =?utf-8?B?a0NGdU52RWQvRmtTMmJnSFJrR0FYTG5TQzJCT2JKZXhiWjZmbzF4Q3ZrWS9u?=
 =?utf-8?B?dGZRcTRJMTAzVThCUjFlZ0dsUW1ieWFsNkpvK2phSjQ1SnljWHJmOEZUMFVy?=
 =?utf-8?B?a1NucHlxZVNtZjlIQnpEUm9DSHZIVnZzekdhVWFOUDIvKzZOYmllemRzelJO?=
 =?utf-8?B?SmFZUWRBZnphSHpuZXF4OERyRytaU3BadjdEbmVLZ1pZa2hwQ3FuQnhQUVBJ?=
 =?utf-8?B?QmZJZm8wT25mdTN3Ym1EWllVQUJ3YnBLRmh2Tnkxa3VZalBQODZId1pBOWdP?=
 =?utf-8?B?bEw2UFU3Ky8rMmNycXo4dUZBWVUwUUpxVnY1Y2d6SFVITzVRMk00R25tZ2ZM?=
 =?utf-8?B?SjFUcVBURDJYczlaTWVhT1MraXB5YkZjbEJqMHowMTBOSG9VaThhUnUrK1hK?=
 =?utf-8?B?TlBldGNhY0RjWW5ObHd2TXdsWHgzRHY4OS9UeWN1M3lZZUQvRlpwUUlVSXVx?=
 =?utf-8?B?UnorM20vanhaS1hHd0lMbkNSR2cwRnJwNU1rcDJkSmIvQWNRb04zZlNyc0Z2?=
 =?utf-8?B?RDdOVkxBd0JUN0UyT0k3YW9aQ3Btc1lxWlQ2cWZqMjFUT1RwRnZad0hUR2NK?=
 =?utf-8?B?RUxydzA3dC8vaFZSVWJtZlZkNjJjLy91U1JiUDFHKzdZMmVCb2M4ekdBMmsw?=
 =?utf-8?B?ZmphRzVSZk5NM05qYjZEU1RqNHV6cVU3Q1lHa3JKK0VnVkREa2t3NUVSR3pV?=
 =?utf-8?B?OTEyUS96L1lEY29KT0ppamZZQzRFZ2lVUUxFQjRZYStPY2d3MmJiNk1rdTQr?=
 =?utf-8?B?STE5cld6UUhMdVV1UE80dEloMnJ5VFBiL3R5M1hVU05VNFBSTXpqYWowL2tN?=
 =?utf-8?B?ZGZ0UEpZdm4vK1d0ZU8xUE1wUEZqM3A2TFI0TG50OWRjY3dEaE1yeldxQ2Va?=
 =?utf-8?B?YW9LMW1XUzIzTkFQRi9xMGNvOGJLU0tmM3FzR3JSZkRjWlpEUkcxaktpaEpU?=
 =?utf-8?B?emxPRDlIcjhKL3JOTzJ1bnNJR2tYRXZuMExWUUdiUTVzd3BPdXBaSEloL1Iz?=
 =?utf-8?B?bFhLelM3RGxHWUlvblBkaFlYbmE4cGliUFNhZFdtNUwxdXFKNFNkRjNNWmxS?=
 =?utf-8?B?NFR2ak5saDNIRmdVQjRZWEl2aDlXY0ZyQWxkcmtNR3JKVVB2M0pJTlF3ZHpJ?=
 =?utf-8?B?VWpjam8reEc0RksybXo1bHcrdTJZN0RraDFpU2dLVUZxSDJTdEpKN2RGbUhn?=
 =?utf-8?B?Y0xwc0FYMUg2TGo5ZkcwalNKbDZIQXFKZ2tBb2V5MXVNWm1CR3RRR2s2NnM5?=
 =?utf-8?B?c1RFUGNvUlJENzVzUmdYb2ptTnc2YXVuN2NZMFgvVGs3WmI0QUFNZDJsVytU?=
 =?utf-8?Q?ddTTYIVVyWg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlNFc2o0RFJ2enU4V2h5SlNoSk1zMWwxdHJGSjRZWlQvTWFVaGhqMzR6WnhE?=
 =?utf-8?B?RW9oalowb0tzRDN2YXM2SzVzR2M2MnNXL01NYUlGdjlhMHdrT013bUlzMnpX?=
 =?utf-8?B?MWFweGtoUjg4Z2V1NW5JbDczeXVXZDllTzVGTnNwZnhlRmlJTjZsb1cwSmxz?=
 =?utf-8?B?MnNxYU1TSmFNU3Y2OEJkeTVuL2NMQWV5RjdWeEt3NURES08vYlk1d2UyVXoy?=
 =?utf-8?B?ZS84T1RhdEhlbGI4bW9kZVVBZG9YclNnR3Q4R0xkS083akt3WWIxbElaSnN6?=
 =?utf-8?B?RVJjNkk3RHU2dGtwcUVya0F6K3F0MDQzcGFqdWtDS1Z1M2wvUkVWQ0pISnM2?=
 =?utf-8?B?ajQ0Z0FyQ3o1Szg5bXA3Nnp1NS96T2xGcXpKb0FXOUF2THpWYngwTloydUJr?=
 =?utf-8?B?cWVPRkRDTGIyV2I3VnBuakVjNEtkL3RueHVTcEVITkhETXNpc3lMMWJuZTNB?=
 =?utf-8?B?azEwOVU4SjNrRENubWpTekNiMG9oVThsOHhjWTIyR1B3Z2prNWRWNXlHT3Rs?=
 =?utf-8?B?ZnhodWNjSmlmMzVmQ1F4VHlaSTk1d0ZYMVVyaXRBK3hzR3dvbE9RYUx6a1ht?=
 =?utf-8?B?Z244eGQzVEpXVFl0V1ZQWDJucFVHaHA0YStRY3gyMHlYTDhrWHcwNjhjYlRp?=
 =?utf-8?B?OS8zRTJuY3hCTzZDc2JwQTF4cU81OVNraUkvclYvbGNkZ2tNcmNkYUNTTXlF?=
 =?utf-8?B?V1VtUWNuRWZaUzY0NGdXd0lKUGVaemJjVkVmU0pja3praUFKNWIxT1hDclI0?=
 =?utf-8?B?ZllCU0NQdUtUdnd3REJGYjR3QmgySWFzUHZIcmVYdWdxOSsvZlByM2s4a0Y4?=
 =?utf-8?B?aG1wMmFNQW5WM08xSjY0UGxrZ2hYZ0JINTAyMENCcmU5S3JvTTAwWU5XbXhM?=
 =?utf-8?B?OTUwZHNDL1gzUHMwL1BWRWhOVTc5Vmg5QStrMnV5UFF4V0NwVDlsbzdueFVK?=
 =?utf-8?B?UmoyK1RIRE9LcmNMMGI4d3FxRHpnUDM5b20zeFlIelhCeWJIQzQ1NDBXRTA2?=
 =?utf-8?B?RUswejZ0aGt5blpUcWQyYzNIbGVzRjBEdnpiZk83bXU2dWpXSDB2QzVuOThp?=
 =?utf-8?B?TzBSd3FPSTMxY3ZEME5rbGMzbHZFVGxqRi9UU1cwVVMrY1NXMVAwRWRrYlo5?=
 =?utf-8?B?UGNQRnlZek45OEJqY2RDSkpiNm5FL1JrSTR6eE4zdzNIUS81OTFOUVNNK0F5?=
 =?utf-8?B?TnBFeVhWdTdPUTY0Q0xEaHMzTEY1d3NJcitvK2ZhRzVDNDBCc20zN1dvSzdJ?=
 =?utf-8?B?YjNadEFSOTJZNEYwcjhUTzJtZmtmdGJXT2hPQVQ4VW9ocVJEZ296cXRoajEw?=
 =?utf-8?B?c0hLMGJMK1djQWVEbjR3Z2RZNUZuR2tGNXl3dFI1RktoWDJ2ZTN4V0UxanZ2?=
 =?utf-8?B?a2kzNU9PRjlWdlZNd0ZXU1Zzazl0SnpZS3BWQjlnRHN0bDRNR1kwOVRnYVk2?=
 =?utf-8?B?cmhNUFZIdXdYT2VOUXRGYmdhY2JnU2ZZTE03QWZKTDNUUzkxV09hRVNTdWta?=
 =?utf-8?B?aDc5Z1N1Nk9Oa0FzZnpaMGtBWGJLNytFUnZLRGUrUmNvdUI0SjFsNUNtbG9T?=
 =?utf-8?B?RktTM25oWCs4bUtycGE2Ti9GUU5odFhYMjdoUUhYVGl3ZWtEMlllTVI5QmU1?=
 =?utf-8?B?dEZ3UHRoay9hSlFlazJFejdZa1dOcXA5ajNpQmljdHlzd3RLK1NXQVErUXVZ?=
 =?utf-8?B?Ym1uckZHeU92bE03cU5zdUc4Z3lMaDNJcTd4MXg0ZzlLcXBBUmUyQWp5K3lV?=
 =?utf-8?B?YUVlSnVSWVdQcS9aK3hOTjRKMWViVjBPZExFVXBOTVU2cXFqVDVUbFdhS1Yr?=
 =?utf-8?B?ZXRFRFdLd0VkV01acExQWVpPc1FwVVp3c3N4QkpyL1krNSt6Y2J1ZU9TOG9B?=
 =?utf-8?B?N3VnTkZ5b3NZbFlIVG9FM29PTXc3T0YvZXRzYmJ5OC9pRFNnQlVML2JyUzFP?=
 =?utf-8?B?eFcxRUVRaGpWN0VVWSs5Y2lCZjRMNzlyM2JYQU0rbXkwVVltYXM0VUZNbmVU?=
 =?utf-8?B?VlpqNjI3YTBWU3lXZDQ1SFp5aGw1dVJiazVHTXFGUFhNTHo2RlZNa25qeFFy?=
 =?utf-8?B?VEhHMUVHZmYvUGppSTgwbWh3eGNEMG5VQXAxSkJTR2FzSkZaVWRzUUJNNWVO?=
 =?utf-8?B?dEcveC81K3JPMldyNWpNdE55dGhCaEFDa2hDNnVQY3B6dVZHRXVtbnQ1Wk9G?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873d4a22-0645-4111-880b-08dda8e55e49
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 12:42:04.2669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zji670BI+XRZ5XQX3TajVk6dqoLXSaxK3tZaQ8BNAvisP+keSdz9SH6SskVe3x0d9/FoUNDHTJ0NBcmG6JAxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5480

Hi Mathew,

On 10-06-2025 09:51 pm, Matthew Gerlach wrote:
> 
> On 6/10/25 8:37 AM, Mahesh Rao via B4 Relay wrote:
>> From: Mahesh Rao <mahesh.rao@altera.com>
>>
>> Implement ID pool management API's which will be
>> used for Stratix10 Asynchronous communication with
>> Secure Device Manager. These API's will be used
>> in subsequent patches for ID management in
>> asynchronous operations.
>>
>> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
>> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
>> ---
>>   drivers/firmware/stratix10-svc.c | 195 +++++++++++++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 195 insertions(+)
>>
>> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/ 
>> stratix10-svc.c
>> index 
>> 955468555738b2031dfcf6dc4db7dbf11ccc482c..6d21f0301c3457c1b1bed52e39ee03d14294943d 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
>> @@ -170,6 +170,21 @@ struct stratix10_svc_chan {
>>       spinlock_t lock;
>>   };
>> +/**
>> + * struct stratix10_sip_id_pool - Structure representing a pool of 
>> IDs for
>> + *                                asynchronous operations.
>> + * @head:         The head index of the ID pool.
>> + * @size:         The total size of the ID pool.
>> + * @id_mask:      Pointer to an array representing the mask of 
>> allocated IDs.
>> + * @lock:         Mutex lock to protect access to the ID pool.
>> + */
>> +struct stratix10_sip_id_pool {
>> +    unsigned long head;
>> +    unsigned long size;
>> +    unsigned long *id_mask;
>> +    struct mutex lock;
>> +};
>> +
>>   static LIST_HEAD(svc_ctrl);
>>   static LIST_HEAD(svc_data_mem);
>>   /* svc_mem_lock protects access to the svc_data_mem list for
>> @@ -177,6 +192,186 @@ static LIST_HEAD(svc_data_mem);
>>    */
>>   static DEFINE_MUTEX(svc_mem_lock);
>> +/**
>> + * stratix10_id_pool_create - Create a new ID pool for Stratix10
>> + * async operation
>> + * @size: The size of the ID pool to create
>> + *
>> + * This function allocates and initializes a new ID pool structure
>> + * for Stratix10 async operations. It allocates memory for the ID
>> + * pool structure and the associated bitmaps for ID management.
>> + *
>> + * Return: Pointer to the newly created ID pool structure, or NULL
>> + * on failure.
>> + */
>> +static struct stratix10_sip_id_pool 
>> *stratix10_id_pool_create(unsigned long size)
>> +{
>> +    struct stratix10_sip_id_pool *id_pool = NULL;
>> +
>> +    if (size == 0)
>> +        return NULL;
>> +
>> +    id_pool = kzalloc(sizeof(*id_pool), GFP_KERNEL);
>> +    if (!id_pool)
>> +        return NULL;
>> +
>> +    id_pool->size = size;
>> +
>> +    id_pool->id_mask = bitmap_zalloc(size, GFP_KERNEL);
>> +    if (!id_pool->id_mask) {
>> +        kfree(id_pool);
>> +        return NULL;
>> +    }
>> +
>> +    id_pool->head = 0;
> The above is not necessary because you used kzalloc() above.

Ok will remove it.
>> +
>> +    mutex_init(&id_pool->lock);
>> +
>> +    return id_pool;
>> +}
>> +
>> +/**
>> + * stratix10_id_pool_destroy - Destroy an ID pool for Stratix10 async 
>> operation
>> + * @id_pool: Pointer to the ID pool structure
>> + *
>> + * This function destroys an ID pool for Stratix10 async operations. 
>> It first
>> + * checks if the ID pool is valid, then frees the associated bitmap 


>> +/**
>> + * stratix10_deallocate_id - Deallocate an ID in the ID pool
>> + * @id_pool: Pointer to the ID pool structure
>> + * @id: The ID to be deallocated
>> + *
>> + * This function deallocates an ID in the given ID pool. It first
>> + * checks if the ID pool is valid and if the ID is within the valid
>> + * range.
>> + *
>> + * Return:
>> + * 0 on success,
>> + * -EINVAL if the ID pool is invalid, the ID is out of range, or the
>> + * ID is not set.
>> + */
>> +static int stratix10_deallocate_id(struct stratix10_sip_id_pool 
>> *id_pool, unsigned long id)
>> +{
>> +    if (!id_pool)
>> +        return -EINVAL;
>> +
>> +    if (id >= id_pool->size)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&id_pool->lock);
>> +    if (!test_bit(id, id_pool->id_mask)) {
>> +        mutex_unlock(&id_pool->lock);
>> +        return -EINVAL;
>> +    }
>> +    clear_bit(id, id_pool->id_mask);
>> +    mutex_unlock(&id_pool->lock);
>> +
>> +    return 0;
> 
> Inverting the if statement would allow for a single exit path:
> 
>      int ret = -EINVAL;
> 
> ...
> 
>      if (test_bit(id, id_pool->id_mask)) {
> 
>          clear_bit(id, id_pool->id_mask);
> 
>          ret = 0;
> 
>      }
> 
>      mutex_unlock(&id_pool->lock);
> 
>      return ret;
> 

Will add the change.

>> +}
>> +
>>   /**
>>    * svc_pa_to_va() - translate physical address to virtual address
>>    * @addr: to be translated physical address
>>

