Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654F25C818
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282515; cv=fail; b=YKca1oRa0jKe6JUQme8I8IwKv2PtePPHl7oOejEuaA9SY44otkS+2n9diN/myMJSMwkorv/zshtmvu96390QKQrGzFsnts3hinWaCd/QZCAjmBTzmONgBj7bOaud9Fsy4+HkXoliCbx7HcGU+MbZrmU5nw+r3O7246UDyOrxQ2A=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282515; c=relaxed/simple;
	bh=fbq6PiypxpJvZrWkXbL5dp3tO4/dSmGUe2ze3u6CE2k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CKYqu/pHCIC2thfEg+kIPXHxOanjigwUhko+kEJi3NYI1+gI4kXWMPF+osN6W22UQodNzxIC4qK/LeniUVHXzWKBzrTnz+9TnPKHLY3hgI52VUknbLY5NiMafFoS45kn1J+ouHbzTXq/C8y1Hr5607NHg04IdM18jZS2OFzkNZs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hLcUVBf3; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hLcUVBf3; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hLcUVBf3";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hLcUVBf3"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eeGe1sCqBRyx3a4DlRWnf6/DeOFjTezO0UfFojvdNEDUMvLRGDa8Avmkxg7obO4TDW/AsD61Dez8lk+izZQ0jyekDW8ElKOq294VyeNLNJxIab2g2Zuw+mOOjr3viMtajsbaOhpz2dgmZURHVUvpby8bsVktvqme522QXnQo9xApesjeI/pgWEhM5LODw7lFp9FgE+H8nvW9cDNvY/l35yO97pIlY0T5SQxnZzewCeWsfBT/2RmQYdKVbFQ9ww+56qretxhokV4sWoXtXH4L5JMtv2gmFl2VYivjDfGJuWx9JOdBM+5UqqqY7765MnvEi7mwjHKsFfof1nBRpdHl+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxU1O6O/2GuJmohErcLENNpjkhHKYoKds1ld6zS+oXs=;
 b=AmKejTnP3AIU6hztQGduK0lAm9wL957TxuZtPyut8UEH0hwa6FvsC4scE12mzIYmtg8B47NcFQGshC8rA8MR2sAmUlZRqELawbrSqmysqhVZCuOLeQunVpfbllfV4Yh386c3N+vpf52QPABLLqzOS9ab1cCn21N428Kt0y/9vbgl+qDpEMYbxLk42lCGN5FyLvwXTYsF8KRpmd8r0V9oJJhcvZvZC1+zB3ZiYh8Iy+ftF3fBNsWJ3xwQ1lw7Y65pjE9GWVKa26RH5GeJ1OYJD5axAQ3j3IZTxSmkmRP78/i1Bbw7j+Zgae+50NnnqlDcd95+6uInoQchB67el6xtKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxU1O6O/2GuJmohErcLENNpjkhHKYoKds1ld6zS+oXs=;
 b=hLcUVBf3KzEyF/hn01RNW3R437Mz1eeJCzRRzbAgZ88EOfaXu48NM8Bm0qBQMtVM/AkQ4cUMgyUXMfSVWOqw4nq13rE7s5ch9C6Nj4OL2q51+kcHuB1ZdZVnB8yZYFdkzt8QYwIJbmIq8ibvN3bYL56l/jrhmNltmpcPI/e0xg0=
Received: from DUZPR01CA0282.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::17) by PR3PR08MB5660.eurprd08.prod.outlook.com
 (2603:10a6:102:8d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 11:21:48 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::8a) by DUZPR01CA0282.outlook.office365.com
 (2603:10a6:10:4b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Mon,
 30 Jun 2025 11:20:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15 via
 Frontend Transport; Mon, 30 Jun 2025 11:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuwkZmnNSGVHCrT+oGfNyAglvNTbRr48PbE7m+BrxZogZ+IIInyNoGTpm7hd1hhtDISzFBvVWpgWN4WsAOqhUOHdfmvyA6K9VG5gwnxkTmo/c+B5/WU9QZgUT9pHnwxHiZdgV5kaiZtSftnRmUxM8G0z1nFueXG64q0dea5WxJ7RH/6XWrbVlGvoMcq6QpukKloE7vMt/iSiLfoX8pcMl9yyAc9kjRUteQqC89Y7esj1aM/nTJTe7gxNrk6R4JfFpep5KmDVzC4ADM4Dwt2MyuTghZUE/TbxPWklFzUfI5m0xoA3nG1rjRi9dCLPifqwDzF1J0EY/u5/JLDgVclk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxU1O6O/2GuJmohErcLENNpjkhHKYoKds1ld6zS+oXs=;
 b=Tj4B5wd9W/0eW9xG67Zns5L/iZaQiOov6hWe2pLvIZ8TTRzqJJs3Z5SQXZ6TxJdH9Nb0B9uCjVx2UO7rzP/yQsXReP6NtzlCPyjKH9dQG6d4w6fyzsctCyit0D4X0i13UVyPetB5ucxp/gIENIrxuxBTSIe7nWvS92POXlQV2+B6ukD/1AdL2sMbvLUBRWqzWIVbVHlwMOLuF1YjBeGTKZKwHCZzHcADWaoCjMnk13A7ToakOKkPgNE/y89H4LvBnjVliuG8tl4x+RvQrp6BlAdIuwE7OwlUQeC34ut7DfuTLPQXAMt+NIMQGL6ssia4XV0hiO2xbZez0DJhG1AVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxU1O6O/2GuJmohErcLENNpjkhHKYoKds1ld6zS+oXs=;
 b=hLcUVBf3KzEyF/hn01RNW3R437Mz1eeJCzRRzbAgZ88EOfaXu48NM8Bm0qBQMtVM/AkQ4cUMgyUXMfSVWOqw4nq13rE7s5ch9C6Nj4OL2q51+kcHuB1ZdZVnB8yZYFdkzt8QYwIJbmIq8ibvN3bYL56l/jrhmNltmpcPI/e0xg0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS4PR08MB7878.eurprd08.prod.outlook.com (2603:10a6:20b:51d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 11:21:13 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:21:13 +0000
Message-ID: <6ded026a-2df2-4d81-bb70-cd16a58f69e9@arm.com>
Date: Mon, 30 Jun 2025 16:51:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
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
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <41386e41-c1c4-4898-8958-2f4daa92dc7c@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <41386e41-c1c4-4898-8958-2f4daa92dc7c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS4PR08MB7878:EE_|DU6PEPF0000A7E1:EE_|PR3PR08MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: baf219f1-3099-44cd-03fb-08ddb7c84cf6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aldmZHFpc0EzTjBldEh1K2pjRFB1MysrdkthTS9VL2pRL2xkTzBXNm1lekZp?=
 =?utf-8?B?RG0rNHVBZEV0cXFUNU1yOUYzYXJDZ3p3QU9YMXNlQlplTmdNbFJ5YnJJclps?=
 =?utf-8?B?UGoybnBWVTdPdHhOcXFMK21HUTJKRlZJZ24yamRwTFVoNGJlNUt4NlRSNTBm?=
 =?utf-8?B?SFNCc08zRThaTmswWEJSVFZNUmo1ejdHUDVRRGRiRExEbEIvajNRWEZ1dGk4?=
 =?utf-8?B?SDhtYzEzZTBrYUxoV1dEQ015Qm14WmxhKzVsQmdGRHFydWNralpaeVRKSVps?=
 =?utf-8?B?TlROcWVJYTBFOEFTMjhaYXp5WS9jYlYyQnU3RDFxbFlmZzFWVGcrbFVhZ1FN?=
 =?utf-8?B?VDJKbnA0cjBDT1J5L2c2QjF4SndjYnc3ZXlmeW1qdmRqeE1DaEVOV1F2eXdu?=
 =?utf-8?B?ZkhtZ1BqbWNvSVlvcmI4NFlISGptQzlyQkpSckxDd2N6d1NEcnh5c052Wlox?=
 =?utf-8?B?ZExPWGtONkNqMTN0QjliS285bVlWVThrbjU5MDZCb0xlWFpHeXFSV2oxZDhl?=
 =?utf-8?B?dnQvTkZNdXY0NnFyd3NYeE5oQ2FvUkFhWW5uTnRwcWlCM2dWaXJvSzNNMmFs?=
 =?utf-8?B?WjR2NmFwN1BUVStaOFByRlRsV1RKQVBwSW5lYjFHamM2a00zVUFITTg4K3hH?=
 =?utf-8?B?YzQ5eGJVR3p0WTR0WXYxYW1VcERIQXVibVF1ZEFYUjhGRW9VRmhvMFppb25i?=
 =?utf-8?B?TU91Z3RmQ3B6Qk5LYzZyTXVURVlDWjlxRHNhaFVVUThJd2F6SXFvZXpsRVlU?=
 =?utf-8?B?STFoai80eEFkUzUrcndsRkVqalRONW1LQktRdzhER1JGOWFDUFdodFlYbGlk?=
 =?utf-8?B?VUxRV1VIR291MDFaMjFJV3JqNUpkeS9SQTJOZnhmbVpUUW5oZTBtcmtHMWxQ?=
 =?utf-8?B?ZDY0Tys2V1lObWcrL2w0R3NpTmdGKzAvcWUxbGpkTlFUV09tWmFiZm5XS2Ra?=
 =?utf-8?B?cUMxbEhFVlNRSEtXNlFqMEt6dHo2WGFXWTJQTDZBSU1ZTnhxN0pGTXkrMWFh?=
 =?utf-8?B?K2pzQUU4K2x1czkxdWJ5aWExYmc5ek5jajBJZkl6ditudGIxNG5JcFcxOUVu?=
 =?utf-8?B?TmRsZUJHMDRwVnU5L2FiclpvWHd2aWNQQXAwM3hvWFpyRGZubFptbk55ZzJ0?=
 =?utf-8?B?MExQZmJMaWlUeVJUOTFQRHJuQ3lSL3NoUUpHQWdUTkErVDhqWUJudmNoM3FG?=
 =?utf-8?B?cCtYUk9oSjNORCtPS2R6WHZNdTYyZkJZcXh1bjNYSUdCUUdsbENIMDJJeU1k?=
 =?utf-8?B?ejYwY0NBVFdHY3k3cmppc2g0NFVFSWF6MTZOSXhjcUVpekoxczJidE82cWlS?=
 =?utf-8?B?ZnAwNU5EdURrQVJhL2tCS1RHUHVpdFFodklLTjZSK3phZnlHUkZOZ043c2xa?=
 =?utf-8?B?RGdiNTlZOUNtY1B2QXJQN09vcStmY0d1eVZ6blNZL2JzV2FqQXdPWm04bXNS?=
 =?utf-8?B?NUE0SWV3aENxdjh1UWl6bHVMbzVnVXgrVVM3RUVvc0t4TEptOVo5ZFBoa3Y4?=
 =?utf-8?B?RlVsZHdZYTNIQW4ybTVKSW5wU2JTMXhWNnlUS2hRNjBmSUZSMDR0NXYvem5S?=
 =?utf-8?B?NWtiWDQxdlkzU09Vc0UvZlZnUDVoQ1BhSUt5NWpwb25wcEZBem5iT2xVN3Zn?=
 =?utf-8?B?M3NCUXV4TitFT0ZpeW0yUTAzR3RqMGh4U21FdSt6RWZaNmsrcVBONkQrMG1U?=
 =?utf-8?B?ODRkT0hSWGJnT0NsTE8wbnFFbktGNEY4ZldXbllENlhTSVJESHdJWUd3Rkx1?=
 =?utf-8?B?aU5GSEtINXJHOERHTEtJZzhCU0Y4SHd6OVdnYzhsMmFYUjc2SmN1bGVkbmRG?=
 =?utf-8?B?VnRaRkpzV3FCd1pRTFBpbk1BK1oraWtIMTE2Z2psdkRqWjNhMFY4QUZ0b1JV?=
 =?utf-8?B?cCtJTHZzTHdaRnpIdHJZMG5pNStEVEFDWENzOUZLZDE3SlNqbytEdVExVi9K?=
 =?utf-8?Q?Lj3ktSWocmo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7878
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	edd148ed-0dba-4210-9480-08ddb7c838b7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700013|82310400026|7416014|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emRheXhDaFRERU81TDlaSjJVZDNPdW4zd3JtUFhzbEtrSU81bnJYN1MyK2hm?=
 =?utf-8?B?NmRyblo0dDlINytuWnEyUDZYUEJpcU5uQmxLVlNkdmtOWFpJRkNHcm9kbm5j?=
 =?utf-8?B?dzdPRWxrM2NzcEQ4N00xeE5EVS9wQmhwK21ERHA3eHRhUFZBRll6ZW5UNFpX?=
 =?utf-8?B?Mnc1Wlg3dnBOVWkyMFc4NmxBOWFINkRKdi9DSEZnL1FJQUV3cDRvVmFGY0JP?=
 =?utf-8?B?ZFpwSkVuRWFBQkpocWx3SWZ0dGtZWW9LYmpuQjZOTkJlY0hCYzM2NE0rQzRs?=
 =?utf-8?B?RDcxdlp3NGlLUit2bmJyRGlTUEVCU1hxcWx5SzNuZHNWcUcra2ZFTFRrZHpN?=
 =?utf-8?B?RFA5Rm9BMCsvdWx2clZGa0xKa3FIOXJoaXd5QjloMXF1REJEOFhUNEg0Yk5W?=
 =?utf-8?B?aUcvNmoxcURBdTc1R0FUTFlFcGt3TVNLcmlXcyszakRTOFFWN1pDR1hRSGFV?=
 =?utf-8?B?SUp1YmhBQ3E0bWRLK09RUkVneVZvVVVaVFJ2YWs3WGVLWS9pcVpkTTdicHlQ?=
 =?utf-8?B?VnhiNE9uemdaWUtXRENZanFxZDdHNHJTNzZBVHVZSXdSSXVNTE9CUFYzN0dQ?=
 =?utf-8?B?Z2w5MEhyRHIzMUtManZyR2ZjSXhpaW4zSW14dTJ0VXkyREM5bnlMNCtyUmF4?=
 =?utf-8?B?dXlqWkZPc0h5Q3dWcGpCL2lra01HaWNuY1ZOcDUrYUdIbXl5OEhmNk9XTFli?=
 =?utf-8?B?VG1kK1c1dFFWeitxOWhpbzFvR3lxUG1CeTQyWWV2QXlhN0c5WEgvcTNlRno3?=
 =?utf-8?B?QndYMUVEUnE5Tm1YNzVjN2p1L3dneTd4ZDFKdUNvMU4vWlQ2TmtYQy91RW9H?=
 =?utf-8?B?eGxTYUtxYmtnNVYxSjV1VTRMcWJVY05oQ1JaR2tsNE5SZERFZFpNNzRWblRw?=
 =?utf-8?B?cFZrTVFYVlB6NmVsV210UXp5VG1Xb20xWUNPYUcrdWNNQnoyR2Y5NFZ1cnp2?=
 =?utf-8?B?ZHpUV2tQdzd2d2cvWjFVcG1ENXphd2N6LzEvaTh2ZkRXckg1UUZFRTFQZE5a?=
 =?utf-8?B?VTRIaGlZQzBqUW1mQ3E3YWRCYmxkK0lvSy9GVGFMR00xdEs5YkNBSmxCK2dL?=
 =?utf-8?B?VHRUWHJTTGNZUWJja2lxaXVSTi9DRUNrTzRueG9WUkU0aGJ5TDhWNktJYlVn?=
 =?utf-8?B?WHM3Z2xYNmJFUUIyVzJEQ0d4NTc2cFU3OFV5d1VEYkdrWUtNWXBwcDlvc3F6?=
 =?utf-8?B?dmUwMzI4MEd1K0FUdCtKZS9HRUpLNG9UenZOMENTZ1NXSHExa2IzRk5MSU5O?=
 =?utf-8?B?WVQyeFdnV2hrdDVUU3JPZ0oxWWNFeFl5TSt4Vjl1NkxvVVhEeHI0aTBzZkhs?=
 =?utf-8?B?MVcrTS9CaGFqbUJhcUtQTU9iMk52anMyS0hzQVF4RXhTTS9na2ViSXlEOEVw?=
 =?utf-8?B?bFBmdUlVNkdkZG9nZ2w5ZHAvKzl5WGJNOEVOWWtsTGN0YjNLQkVrWlljeHJY?=
 =?utf-8?B?T0FQVmRmeTVmY3N0eHFJbm1lZVFRN1duT0hJMVhvOXVXcU9LZmZWbDUzZ1V2?=
 =?utf-8?B?cWplZ1pNUUlHeElhTVFpbDFRbzFiZENkTk9nL08rUGFFSWNQa3QrWGhWKzB2?=
 =?utf-8?B?cnRKbG8xeUJKSXBsYlZHa3UxMkhxelI2MkFYWFBWTE1VV1QySkVxY2VJSzlJ?=
 =?utf-8?B?N01HY2RnUU1iL2JKMGNyMHhOYWJZdHhQU21JOTBiZXhuZGdWOVEvY2swTmFU?=
 =?utf-8?B?ZFg0NGI5M0JwY0FyYTFSd0JJamRVL3grbVlieWV3d01KVFJYUnM2Q2k3dEhi?=
 =?utf-8?B?Ti92SGxnUzBFS0w2MHZRVEptdXdPRFlmMXI0eTU0dEdPNFdLYWtXU3lnaG9q?=
 =?utf-8?B?V0thK2FKN0I1dHhSTDB1SUtqQ05waXZVb1grRU1zRCtGY3orenU0S0xnUUl2?=
 =?utf-8?B?Q1NFUWhOVnRSKzBhNFJpZENITlh2czBQb3lZbUVLOGVUMXdKV3JlNWNTOGJL?=
 =?utf-8?B?V1RRVWJYQUhucDBoa1ZTaC84dEh1R3liWTlqQ0pBbkI2bHBtUXR6TVhBNGNi?=
 =?utf-8?B?MXlvOEJHaU9zeXd1cU14ZWdmdW5KckpvU3dPSkhoUjNnZVRPRkFXQXpvSFFz?=
 =?utf-8?Q?GbclNR?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(82310400026)(7416014)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:21:46.7961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baf219f1-3099-44cd-03fb-08ddb7c84cf6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5660


On 30/06/25 4:01 pm, Ryan Roberts wrote:
> On 28/06/2025 12:34, Dev Jain wrote:
>> Use folio_pte_batch to batch process a large folio. Reuse the folio from
>> prot_numa case if possible.
>>
>> For all cases other than the PageAnonExclusive case, if the case holds true
>> for one pte in the batch, one can confirm that that case will hold true for
>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
>> and access bits across the batch, therefore batching across
>> pte_dirty(): this is correct since the dirty bit on the PTE really is
>> just an indication that the folio got written to, so even if the PTE is
>> not actually dirty (but one of the PTEs in the batch is), the wp-fault
>> optimization can be made.
>>
>> The crux now is how to batch around the PageAnonExclusive case; we must
>> check the corresponding condition for every single page. Therefore, from
>> the large folio batch, we process sub batches of ptes mapping pages with
>> the same PageAnonExclusive condition, and process that sub batch, then
>> determine and process the next sub batch, and so on. Note that this does
>> not cause any extra overhead; if suppose the size of the folio batch
>> is 512, then the sub batch processing in total will take 512 iterations,
>> which is the same as what we would have done before.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 143 +++++++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 117 insertions(+), 26 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 627b0d67cc4a..28c7ce7728ff 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -40,35 +40,47 @@
>>   
>>   #include "internal.h"
>>   
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte)
>> -{
>> -	struct page *page;
>> +enum tristate {
>> +	TRI_FALSE = 0,
>> +	TRI_TRUE = 1,
>> +	TRI_MAYBE = -1,
>> +};
>>   
>> +/*
>> + * Returns enum tristate indicating whether the pte can be changed to writable.
>> + * If TRI_MAYBE is returned, then the folio is anonymous and the user must
>> + * additionally check PageAnonExclusive() for every page in the desired range.
>> + */
>> +static int maybe_change_pte_writable(struct vm_area_struct *vma,
>> +				     unsigned long addr, pte_t pte,
>> +				     struct folio *folio)
>> +{
>>   	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>> -		return false;
>> +		return TRI_FALSE;
>>   
>>   	/* Don't touch entries that are not even readable. */
>>   	if (pte_protnone(pte))
>> -		return false;
>> +		return TRI_FALSE;
>>   
>>   	/* Do we need write faults for softdirty tracking? */
>>   	if (pte_needs_soft_dirty_wp(vma, pte))
>> -		return false;
>> +		return TRI_FALSE;
>>   
>>   	/* Do we need write faults for uffd-wp tracking? */
>>   	if (userfaultfd_pte_wp(vma, pte))
>> -		return false;
>> +		return TRI_FALSE;
>>   
>>   	if (!(vma->vm_flags & VM_SHARED)) {
>>   		/*
>>   		 * Writable MAP_PRIVATE mapping: We can only special-case on
>>   		 * exclusive anonymous pages, because we know that our
>>   		 * write-fault handler similarly would map them writable without
>> -		 * any additional checks while holding the PT lock.
>> +		 * any additional checks while holding the PT lock. So if the
>> +		 * folio is not anonymous, we know we cannot change pte to
>> +		 * writable. If it is anonymous then the caller must further
>> +		 * check that the page is AnonExclusive().
>>   		 */
>> -		page = vm_normal_page(vma, addr, pte);
>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>> +		return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : TRI_FALSE;
>>   	}
>>   
>>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>> @@ -80,15 +92,61 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	 * FS was already notified and we can simply mark the PTE writable
>>   	 * just like the write-fault handler would do.
>>   	 */
>> -	return pte_dirty(pte);
>> +	return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
>> +}
>> +
>> +/*
>> + * Returns the number of pages within the folio, starting from the page
>> + * indicated by pgidx and up to pgidx + max_nr, that have the same value of
>> + * PageAnonExclusive(). Must only be called for anonymous folios. Value of
>> + * PageAnonExclusive() is returned in *exclusive.
>> + */
>> +static int anon_exclusive_batch(struct folio *folio, int pgidx, int max_nr,
>> +				bool *exclusive)
>> +{
>> +	struct page *page;
>> +	int nr = 1;
>> +
>> +	if (!folio) {
>> +		*exclusive = false;
>> +		return nr;
>> +	}
>> +
>> +	page = folio_page(folio, pgidx++);
>> +	*exclusive = PageAnonExclusive(page);
>> +	while (nr < max_nr) {
>> +		page = folio_page(folio, pgidx++);
>> +		if ((*exclusive) != PageAnonExclusive(page))
> nit: brackets not required around *exclusive.

Thanks I'll drop it. I have a habit of putting brackets everywhere
because debugging operator precedence bugs is a nightmare - finally
the time has come to learn operator precedence!

>
>> +			break;
>> +		nr++;
>> +	}
>> +
>> +	return nr;
>> +}
>> +
>> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t pte)
>> +{
>> +	struct page *page;
>> +	int ret;
>> +
>> +	ret = maybe_change_pte_writable(vma, addr, pte, NULL);
>> +	if (ret == TRI_MAYBE) {
>> +		page = vm_normal_page(vma, addr, pte);
>> +		ret = page && PageAnon(page) && PageAnonExclusive(page);
>> +	}
>> +
>> +	return ret;
>>   }
>>   
>>   static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>> -		pte_t *ptep, pte_t pte, int max_nr_ptes)
>> +		pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)
>>   {
>> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +	fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	flags &= ~switch_off_flags;
> This is mega confusing when reading the caller. Because the caller passes
> FPB_IGNORE_SOFT_DIRTY and that actually means DON'T ignore soft dirty.
>
> Can't we just pass in the flags we want?

Yup that is cleaner.

>
>>   
>> -	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>> +	if (!folio || !folio_test_large(folio))
> What's the rational for dropping the max_nr_ptes == 1 condition? If you don't
> need it, why did you add it in the earler patch?

Stupid me forgot to drop it from the earlier patch.

>
>>   		return 1;
>>   
>>   	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>> @@ -154,7 +212,8 @@ static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma
>>   	}
>>   
>>   skip_batch:
>> -	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>> +					   max_nr_ptes, 0);
>>   out:
>>   	*foliop = folio;
>>   	return nr_ptes;
>> @@ -191,7 +250,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   		if (pte_present(oldpte)) {
>>   			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>   			struct folio *folio = NULL;
>> -			pte_t ptent;
>> +			int sub_nr_ptes, pgidx = 0;
>> +			pte_t ptent, newpte;
>> +			bool sub_set_write;
>> +			int set_write;
>>   
>>   			/*
>>   			 * Avoid trapping faults against the zero or KSM
>> @@ -206,6 +268,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   					continue;
>>   			}
>>   
>> +			if (!folio)
>> +				folio = vm_normal_folio(vma, addr, oldpte);
>> +
>> +			nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>> +							   max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
>  From the other thread, my memory is jogged that this function ignores write
> permission bit. So I think that's opening up a bug when applied here? If the
> first pte is writable but the rest are not (COW), doesn't this now make them all
> writable? I don't *think* that's a problem for the prot_numa use, but I could be
> wrong.

No, we are not ignoring the write permission bit. There is no way currently to
do that via folio_pte_batch. So the pte batch is either entirely writable or
entirely not.

>
>>   			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
> Even if I'm wrong about ignoring write bit being a bug, I don't think the docs
> for this function permit write bit to be different across the batch?
>
>>   			ptent = pte_modify(oldpte, newprot);
>>   
>> @@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * example, if a PTE is already dirty and no other
>>   			 * COW or special handling is required.
>>   			 */
>> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>> -			    !pte_write(ptent) &&
>> -			    can_change_pte_writable(vma, addr, ptent))
>> -				ptent = pte_mkwrite(ptent, vma);
>> -
>> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>> -			if (pte_needs_flush(oldpte, ptent))
>> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>> -			pages++;
>> +			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>> +				    !pte_write(ptent);
>> +			if (set_write)
>> +				set_write = maybe_change_pte_writable(vma, addr, ptent, folio);
> Why not just:
> 			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> 				    !pte_write(ptent) &&
> 				    maybe_change_pte_writable(...);

set_write is an int, which is supposed to span {TRI_MAYBE, TRI_FALSE, TRI_TRUE},
whereas the RHS of this statement will always return a boolean.

You proposed it like this in your diff; it took hours for my eyes to catch this : )

>
> ?
>
>> +
>> +			while (nr_ptes) {
>> +				if (set_write == TRI_MAYBE) {
>> +					sub_nr_ptes = anon_exclusive_batch(folio,
>> +						pgidx, nr_ptes, &sub_set_write);
>> +				} else {
>> +					sub_nr_ptes = nr_ptes;
>> +					sub_set_write = (set_write == TRI_TRUE);
>> +				}
>> +
>> +				if (sub_set_write)
>> +					newpte = pte_mkwrite(ptent, vma);
>> +				else
>> +					newpte = ptent;
>> +
>> +				modify_prot_commit_ptes(vma, addr, pte, oldpte,
>> +							newpte, sub_nr_ptes);
>> +				if (pte_needs_flush(oldpte, newpte))
> What did we conclude with pte_needs_flush()? I thought there was an arch where
> it looked dodgy calling this for just the pte at the head of the batch?

Powerpc flushes if access bit transitions from set to unset. x86 does that
for both dirty and access. Both problems are solved by modify_prot_start_ptes()
which collects a/d bits, both in the generic implementation and the arm64
implementation.

>
> Thanks,
> Ryan
>
>> +					tlb_flush_pte_range(tlb, addr,
>> +						sub_nr_ptes * PAGE_SIZE);
>> +
>> +				addr += sub_nr_ptes * PAGE_SIZE;
>> +				pte += sub_nr_ptes;
>> +				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
>> +				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
>> +				nr_ptes -= sub_nr_ptes;
>> +				pages += sub_nr_ptes;
>> +				pgidx += sub_nr_ptes;
>> +			}
>>   		} else if (is_swap_pte(oldpte)) {
>>   			swp_entry_t entry = pte_to_swp_entry(oldpte);
>>   			pte_t newpte;
