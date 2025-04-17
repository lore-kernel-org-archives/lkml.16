Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC123BD0C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889558; cv=fail; b=SumENTV2sadrpCM2UfRrOEeattvnXqXUlUbL91AOn+91sxz/9/VDvZsjGYmeP0Tqs0QdLD5EqK9tPvOLKNVYHC9rqVW8nh9mXnycTePmAffH2I+63EVS01adXsabFc2Fqnc4AJUpU1NLB26xkj0BnjqD/8YG7WSDZAatOqYan7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889558; c=relaxed/simple;
	bh=ffChfe7OI/yGExH8MnNjk5h1S56tQ24vmzNpwAEzYgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MB76ug79ZrhVMBeW622qtSF8fUoMfQBK3CyestFaBggkDaMP8/lBUOS5MaRGzt3i6bBKguiKac0Ecp9Idemgm616qyF6bLPdJUw1HwpnYXClwYcrNqEjftCUz2nP+QT9mbZUhXoKaRuMPKbqO8Uq17fSf/khJcIlQwbP6uf3nVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X/ONRDPh; arc=fail smtp.client-ip=40.107.243.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X/ONRDPh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXsPO4qY4As2hoWyW5uAmD/YDIj9gCiOg86Esa1pzeaTByg52USDyqqkFdHjfztwBrp7VJM7Ikx/PyBKOrFvuzJU+T/CWjqHXx9BZzsOYlrL7TzElMHy975jtAAuG3uGCxnSxwWDNLwE9C0urGks0CmqCTZ3Wl/e0shdI0SearJkZuOs/AqqmL6ZBn9vFQoXGi8Y4WBYtlBeVVc5OpI7TB6RywH0IELjGA65VSGYO93RBCiaOQRWJva6BKkxU1FluEmdD3v3pJfJAi3mRg34aRmVQV6zh+49WhfdaWq104QUndUQhfboDRRF1Uzp21uWuNEBqCAENXQg43wZlKzKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REO2xR1Zf/Nga93UGeTvL5h2O77K3q/EwoRqj57TCr4=;
 b=jlyIIxfy8IVeJVMIj4eZhm4kOtTHwvAFDWKC3U+FDXxFvAgVHawE0Hm/25/yy+sxJycocwHwg2wyBfoo8sGVN+bpHaNK4OprelcKIB4Lu93ebNljdFQ3SMdBwUtvXsTE0Fv5nmucJHld5cqskqSTsTd5sghB+bI+S3Kxlaz5BMEBylCpjPg+vBEaduKB8SlcNwio/kVmFm2dZ5XoryPC/D8Jm/BfnOUUco9uqwFsd+DlA2psJc3c/8hA0hGnf4nuVw2/98Eimh55S7byWxwGS8Rt2EkS1WRfVJvb3XP+k0nApzHCtX23IePqRbU/hmvS9+mbS9e7i7fF9V5E+yOczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REO2xR1Zf/Nga93UGeTvL5h2O77K3q/EwoRqj57TCr4=;
 b=X/ONRDPhR4axPhoIGpJ+JHBGVKNM3ctyw+TATAC6Y/tEkepA0wKU3MpGPjDaCzBhQxhPSwpJa4kQxEqNNXaa3PikFhK0iJbNZx8fo5hu1yLTDfHnNdRtsDj5cGwIrEl/recQwUS4KN3NnouWlfPOwBv7R4gjMrY4RMQTTwW9PYStpWodkGTljULAOyd9lerZ9jVCqjQb/G9+seW+gr+8nNN4+7tkj0seZc89rrg9Vk07sPWZjFCYtsb/QDtAVgfaIBVW9rDtfjAj4wEml43JRa7Bqlq44CDpwG2dRWVO/3kCdHdohkp7hoO3QSYHcWzqJAKBVmxJu6JQbtar3x9Uyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 11:32:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8632.040; Thu, 17 Apr 2025
 11:32:31 +0000
From: Zi Yan <ziy@nvidia.com>
To: Gavin Guo <gavinguo@igalia.com>
Cc: David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>,
 linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org,
 linmiaohe@huawei.com, revest@google.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
Date: Thu, 17 Apr 2025 07:32:28 -0400
X-Mailer: MailMate (2.0r6245)
Message-ID: <412E70A4-4775-4AF7-A878-7FEBF9A122D8@nvidia.com>
In-Reply-To: <f344d741-962c-48d3-84b7-ce3de5619122@igalia.com>
References: <20250414072737.1698513-1-gavinguo@igalia.com>
 <27d13454-280f-4966-b694-d7e58d991547@redhat.com>
 <6787d0ea-a1b9-08cf-1f48-e361058eec20@google.com>
 <83f17b85-c9fa-43a0-bec1-22c8565b67ad@redhat.com>
 <98d1d195-7821-4627-b518-83103ade56c0@redhat.com>
 <7d0ef7b5-043b-beca-72a9-6ae98b0d55fb@google.com>
 <05a7d51e-f065-445a-af0e-481f3461a76e@redhat.com>
 <f344d741-962c-48d3-84b7-ce3de5619122@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR0102CA0052.prod.exchangelabs.com
 (2603:10b6:208:25::29) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af3ec5f-6d62-4295-1dee-08dd7da38a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjBtOGQ5Zmw4L25IQzRxYUtFbStsWDZGc1R2QlRXY2RpV3dDZkwvS3QyNnF0?=
 =?utf-8?B?dllQZXBST1NRcThxeUwzdmdaRnV4b2RRT3FXb2k1NFA2a21WWGNsUTZzbFFW?=
 =?utf-8?B?YVFTbnRuMkw3NURrSDZ1WStLbUR5elNzdHBYUzRiU1Zjb1VReENrSmk1bW53?=
 =?utf-8?B?L2gyMDJkUVpRV2hCVis3RTYySGN4RU82dWhJb1dzc2RyYWpNUUk3bmRHWkxz?=
 =?utf-8?B?OElsT3FoWjNMeDE0NDdQRFlCREM0MG9ZOHdqbXgvZk41U0hBeTFFRFhoY29C?=
 =?utf-8?B?RmRhSXBuYUdqazc0cVFHV2w1clcvZU9OSHJWZzVrMnU3cjI0MmZCNkg1d2JX?=
 =?utf-8?B?aXFNNzRNTlphU09YM2NMTnVoOERKUi95bDBvNUdGdDgyR3hrYUJFWDhpM1h1?=
 =?utf-8?B?Rk9YTXZ0Z0EyaWFtMG9OOGEwUG5mRnhDaXZRS2wzK3VFVkhKUWUxWDJHaUov?=
 =?utf-8?B?Rk1WMXd3OVRrVndDcHZnVmJPd3VSTkNQSTNyeEgzamlDa1VyOHZ5TGRDdnNO?=
 =?utf-8?B?OVgxWXU1UEdOSlhBbkxneGovYmVrS3lnTlJ2Y2hUcVRzRUFPbUZQai9HejhD?=
 =?utf-8?B?SXcyQkQzbSs1QmNUcUVmMCt3ZnRwekRPV0dvMG9XQkJrSHIvTUhOaitPd1F4?=
 =?utf-8?B?QmdTdFJWUnJzajdXU2VBUC9rL1FkY2ZxdENyNWcrbEg0M0JoOHI1eU1uckto?=
 =?utf-8?B?NGNqcWlCUkh5SWJHLzlhOWZHZGtWYU9jYUUrelRHOUw1NkJBR0FwMHNqN2sx?=
 =?utf-8?B?ZTdqZnNQYmFRZ3VPb0tONVlQbjc1dFYzaGlqNDV3eSt6N3pmZUVwcDllWGRS?=
 =?utf-8?B?YWpjazZrcHY2RU1XQzVTbDBWdG1OVmRyRklHbVU2cEhqamdjWjNTa0kyNUVJ?=
 =?utf-8?B?WDBlT3dSTHA1aVFVR1djZlJKWUg2Y2dZUTVYZWZDRUtTcEhLcTBQdlh0QVNR?=
 =?utf-8?B?STc5aDVTY3NaUHFRVjVpcWd0VjlFMjBSSFJycHdIcVg1SXBuemQ3MXFhb0lq?=
 =?utf-8?B?QmpUZEFKWHU4OGFxM0czYVlOS1ZQdElGY3R0QXVqeDYvTkNWSGZ2M3dTWG5U?=
 =?utf-8?B?QUdwM2RuL2EyaE5NOWtHY2JIbERGNVBLSHhZc0lRb0FrSTl1aGlJR3R1MGY2?=
 =?utf-8?B?aGp0enl6NXZDRXZNam16TUtXaGRDRlpwWkZKM2NTNzRzODhSZGEyd2F4aHZW?=
 =?utf-8?B?MXRJRTFHbk9LUUhoeEJ1MkEzOGZSZDNMZ0ozSWxZWURlRk9vNFZ3WFA0VnJK?=
 =?utf-8?B?dzlzR1U4UHdDRTViZ2FJTmNDZzl6TE1EdGxFMEVteUJkWnZTenQxZEVtN1hR?=
 =?utf-8?B?YjZMSkthaEI4OE4yM0xqKzJMSDBjM2dDK1QrNjV6L3VUWUN5OGk1Q1FLb0xY?=
 =?utf-8?B?RTM5dHdZN0VRYXI4U2dWbHZ4Ump2VzdHZkNxSzhrbnl6N2ZlNGFOU2swK29v?=
 =?utf-8?B?UnUwN3RSSVRvRFViamxIS0V0MDRDaG9LYXBkNUVYNXFBekpVNHBHS3RlZ25s?=
 =?utf-8?B?OXBhWHRRVCtYWkdicC9HdGkzVFpjRmJ5UlcrLzBsSW9hWDlBbFFaNGZQY2FR?=
 =?utf-8?B?VVVjWkxhUlNDSWhlYnprZ2xHbGl4eU0zVDRsTFZYbmR4MDMyVUd4TEtJNWh3?=
 =?utf-8?B?c3JwZWlDUzQ5RkNIeHpRSmFSTkZjNlkzeXN3QUxCSnNPTkJaTVVFTHlmRitl?=
 =?utf-8?B?aXVBSUNPN3UveGxvOFc3anBQM3cwTHJXa2V6ZVJuQmpXRnB2THg2VDBwQzY0?=
 =?utf-8?B?bWF6UTZBRHVrSC9FdWlaS2FFOWo0TTlEY1JaWVRDejEyUzBaMzQ1Um5pOGVo?=
 =?utf-8?B?dXhtR0lNZW56YklQODhTS1JnUVdoNGNIdVhBL2JCdjVNdFVqYktHM2xWWmhX?=
 =?utf-8?B?a3hQRkh0ejFhd3FXdzRSaWZraGwwQ1lKdHE3Tlc5VUh2QW9sWWd4MU94ekRm?=
 =?utf-8?Q?VWO5w7dQxrg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzMxeStrcXUzY1ppUkNyZlovUUI3SFNNbjZpVVNkK0pwMGorbnpESDRlTjkw?=
 =?utf-8?B?dkFHL1RoK2NSRjRmcXF3Vjl0K1MxR3NESXJNSEIvWWdrN3FpQWgzbWQ3Sktp?=
 =?utf-8?B?a0ZVYnlsTnZjZW1JMERJekJ4L2x6U1gxSUNrUFExR3hhS3dWait5RGc2b0py?=
 =?utf-8?B?QlFwSHVvaE5ObnlGR3d5Y1NydnI4SXVtYVRNNmE5aTFhbTJaMTROayt2K1c0?=
 =?utf-8?B?MlNvZ0I1VFV0VzZ5dHFpQWVVMnJRWTV3ajVJM3JTdndqZWlKeTJDeUlkQWtp?=
 =?utf-8?B?RTBON01kTEIzcUovb0Q4bE44UE4yeGlDV1k4YkNWZ2hyOVRXUDZkMUNoMGZv?=
 =?utf-8?B?ZDdyeTdIQzJJdHZDTndxUHlwVm5EUXpIcmxMaFUydXJBQ2pMSExlVytzcnJu?=
 =?utf-8?B?YkYrZHNhNjlyTXR1blFtMVIrSjQzSEs2YTdlVFlZU1ZrcVZNelh4ZG5EWVUv?=
 =?utf-8?B?OURGL3pkZzlvUVF1ZXV4Q2dsNXRvV1J2dVFpRDRtM1BHZVhkWmt4bzJqQzlZ?=
 =?utf-8?B?TnMydTlURG9yZ1lmN2dCeEs2ZGtkOUpDeDIzN1lUNXVNQlBKcVhudVExNDVa?=
 =?utf-8?B?dnUwY1NFK1JFWEh1RWlIOEhrMmIxaFhBNDVRdjYyZko0OE0remtROXlxaFc2?=
 =?utf-8?B?RG9Ya25wR2pwdGZjVjBicGI5aHZjV2dyQ1ZwMlhuc2dDckRRU1ByeEI5YzJG?=
 =?utf-8?B?d3ZxaG5ZTndGdDNacWNHekt3WFUxUGg2VDN6WUEvUkovZ2xLakNndHIxZ1Fu?=
 =?utf-8?B?MHF6WlFvVVlBMnpzQ3NqYkZ1VlRkY1o4dms1aW5QVCtMb2p2T3pncm9QZTUr?=
 =?utf-8?B?SG5idmpESTRkNldxa2hLd2VaQmtkSks0MDg1V2ZsSzFJMnJ5NW5zR2p4ZjVj?=
 =?utf-8?B?NTJrTVVhRlRjSlAzaDNVODNnVzBiMlMwVVZnb3hhempYa1IyQ2tFdURwZDY2?=
 =?utf-8?B?S0hPWi9WYWg4MFZsVlhRRWlSV21idTFnM1k3dEV1SE1lWmFkMHVtcDJjKzFy?=
 =?utf-8?B?T2xTcGRUZmpkMDdCSzBzM2VBVS9YWDk1WVEvREpqeUtKN2FFeWZmSTZmWGpU?=
 =?utf-8?B?L3AxcStDcUVCYUc2SUJKaTF2SHJEUGFOc2s2Mk05c2VOdnE1aE5Vdytlb1FW?=
 =?utf-8?B?ZmhDejVPdnIyM1U2YU9Rc2VZVU15SVNOVHZOZlJwL1dzSzBkY28ydnRUM2tR?=
 =?utf-8?B?YzRsN1o2VkFVanVISXhmNmVmc3RFU1hZWHpHbjI5RFVQd244ai9BUTlrTE5B?=
 =?utf-8?B?L0NGMm5zWFpOc2dwOTlzT2UyakRNOXVxTTh0dHZ1TC9tS1YzVUYrd0ZSd0My?=
 =?utf-8?B?a3AvN2tBZ2VtZnVRa3plci9ZYmQrNlJhVWVOV2t5SWRaSkZEeDlOMGtLaFgy?=
 =?utf-8?B?T3BicUpweFJnUE5NYnFYOTBRV0tTT3JabHE1ZC8wVnFKS083elFUdGkzOUta?=
 =?utf-8?B?cnhQU1pjd3l3T3AyQkZ2QzhuL0dzd1RUekFnOUZCNUNGcUVBemFNMXI1QmNn?=
 =?utf-8?B?VHZ3ZGh3NnFENGxFc1RUaXZOcE96QXlSMW5IZTJQaHBKczNOZ3dMQXpXckVW?=
 =?utf-8?B?ZXh3b0hxTVdVUHFRYlNWZ0JLckhiUnBoeXFSWm43RE5VQWU0Z3VCajI0ZlJM?=
 =?utf-8?B?clBYSmgvWXVPdWZ2QlBTVUVyRnZjeTNKWTBNMnM5MGNjb1k4QkVUaStPa28r?=
 =?utf-8?B?UFI3MG9HSlN3cUUxNVBSUDNiT2NGMy94SFhkU1NWaURpNk8xSnJwWGxpZ1VL?=
 =?utf-8?B?ZDRtOGlnQlZkTUhYMTdsNGlodnluMVBBam8vUXdOU3BIY2l6VXBxWVFXQXVo?=
 =?utf-8?B?TUVRdmlTUGs3aDBaS2FoV3htKy8rRzZvV3dmWXdXREwrdGdaanFNcTByWkFz?=
 =?utf-8?B?Sk5TaU93SUhMY3QwbWNyTE1EMTRDcytoeWhvVWZJWEpScjdqOURiTDNKWnlz?=
 =?utf-8?B?U3ZwVGNQWUNQcks1K2pqUEQ0b1BEbUFyenVtaVZIakI2Y3NjbkxkR1VubGNk?=
 =?utf-8?B?ZDYxRmMvN0poM0prRkpLZWpKUm1TL0NBbXRUc2xiczBaUGY0R0NmcE5GbUha?=
 =?utf-8?B?UkFsbHNMY2VpV0N0S0VSMEwvUGVxMWpXU1FBWkY4bFdZTTd2SWhqZnFiVGNx?=
 =?utf-8?Q?XdJA1yeHM65y1vgJ1C6F3nAsj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af3ec5f-6d62-4295-1dee-08dd7da38a92
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:32:31.6150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHlYBhAYSzEtQnj+v/ULK5wP/Tyh6TXPH2N1lYOdrQ0ylTOHi3BYJKoVBdQ5Epth
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330

On 17 Apr 2025, at 7:21, Gavin Guo wrote:

> On 4/17/25 17:04, David Hildenbrand wrote:
>> On 17.04.25 10:55, Hugh Dickins wrote:
>>> On Thu, 17 Apr 2025, David Hildenbrand wrote:
>>>> On 17.04.25 09:18, David Hildenbrand wrote:
>>>>> On 17.04.25 07:36, Hugh Dickins wrote:
>>>>>> On Wed, 16 Apr 2025, David Hildenbrand wrote:
>>>>>>>
>>>>>>> Why not something like
>>>>>>>
>>>>>>> struct folio *entry_folio;
>>>>>>>
>>>>>>> if (folio) {
>>>>>>> =C2=A0 if (is_pmd_migration_entry(*pmd))
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entry_folio =3D pfn_swap_entry_folio=
(pmd_to_swp_entry(*pmd)));
>>>>>>> =C2=A0 else
>>>>>>> =C2=A0=C2=A0 entry_folio =3D pmd_folio(*pmd));
>>>>>>>
>>>>>>> =C2=A0 if (folio !=3D entry_folio)
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>>> }
>>>>>>
>>>>>> My own preference is to not add unnecessary code:
>>>>>> if folio and pmd_migration entry, we're not interested in entry_foli=
o.
>>>>>> But yes it could be written in lots of other ways.
>>>>>
>>>>> While I don't disagree about "not adding unnecessary code" in general=
,
>>>>> in this particular case just looking the folio up properly might be t=
he
>>>>> better alternative to reasoning about locking rules with conditional
>>>>> input parameters :)
>>>>>
>>>>
>>>> FWIW, I was wondering if we can rework that code, letting the caller t=
o the
>>>> checking and getting rid of the folio parameter. Something like this
>>>> (incomplete, just to
>>>> discuss if we could move the TTU_SPLIT_HUGE_PMD handling).
>>>
>>> Yes, I too dislike the folio parameter used for a single case, and agre=
e
>>> it's better for the caller who chose pmd to check that *pmd fits the fo=
lio.
>>>
>>> I haven't checked your code below, but it looks like a much better way
>>> to proceed, using the page_vma_mapped_walk() to get pmd lock and check;
>>> and cutting out two or more layers of split_huge_pmd obscurity.
>>>
>>> Way to go.=C2=A0 However... what we want right now is a fix that can ea=
sily
>>> go to stable: the rearrangements here in 6.15-rc mean, I think, that
>>> whatever goes into the current tree will have to be placed differently
>>> for stable, no seamless backports; but Gavin's patch (reworked if you
>>> insist) can be adapted to stable (differently for different releases)
>>> more more easily than the future direction you're proposing here.
>>
>> I'm fine with going with the current patch and looking into cleaning it =
up properly (if possible).
>>
>> So for this patch
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
>>
>> @Gavin, can you look into cleaning that up?
>
> Thank you for your review. Before I begin the cleanup, could you please
> confirm the following action items:
>
> Zi Yan's suggestions for the patch are:
> 1. Replace the page fault with an invalid address access in the commit
>    description.
>
> 2. Simplify the nested if-statements into a single if-statement to
>    reduce indentation.

3. Can you please add Huge=E2=80=99s explanation below in the commit log?
That clarifies the issue. Thank you for the fix.

=E2=80=9C
an anon_vma lookup points to a
location which may contain the folio of interest, but might instead
contain another folio: and weeding out those other folios is precisely
what the "folio !=3D pmd_folio((*pmd)" check (and the "risk of replacing
the wrong folio" comment a few lines above it) is for.
=E2=80=9D

With that, Acked-by: Zi Yan <ziy@nvidia.com>

>
> David, based on your comment, I understand that you are recommending the
> entry_folio implementation. Also, from your discussion with Hugh, it
> appears you agreed with my original approach of returning early when
> encountering a PMD migration entry, thereby avoiding unnecessary checks.
> Is that correct? If so, I will keep the current logic. Do you have any
> additional cleanup suggestions?
>
> I will start the cleanup work after confirmation.
>
>>
>>>
>>> (Hmm, that may be another reason for preferring the reasoning by
>>> folio lock: forgive me if I'm misremembering, but didn't those
>>> page migration swapops get renamed, some time around 5.11?)
>>
>> I remember that we did something to PTE handling stuff in the context of=
 PTE markers. But things keep changing all of the time .. :)
>>


Best Regards,
Yan, Zi
