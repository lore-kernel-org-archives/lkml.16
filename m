Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C00725B2FA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357256; cv=fail; b=axvCKpBx6Iy5LY0fXHAJyH2kwblW8s8PPYUxN6rFCTbEYEKqtYeaMfeRmpHWR9x0HAfFMsDC0cx1h8HOauCo1sMYybMLcf0T3czPnqTWguUJv9jd3UkQVJAUX5hxYb6MsETsXTOOmWMC08j2q5EpNA7bAemu+KHXMi1NE2TzphU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357256; c=relaxed/simple;
	bh=Xsanjnn86eawG8ORacrGA1FSKx5CcKhKeE4+dJ85ecY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EUvWNJQ9wcNo9flHi0O8uq+DZ6oaMrc0QT+o/B6yBQxjFTQxLO8+0SyImOVwwBZ9847IJJLLRGFasP606TcWzFVw5Llzg2/B6I0PgavrO3beb7UsGrH01NJ3s9wbHWBWk/PXTqmF4IsatX1evcXCTyVQ0ndMIYRutQqgkRnpx5Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iW83cUEg; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iW83cUEg; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iW83cUEg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iW83cUEg"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RguVvEENJ2tESXAiGZEW7T1aAWT3p5PjGbKylrji+Kz0eN1WokhPe+tRjK5QfZW9i2pbIpX9CnxwHY63fS626LvHX+gRVvQUySYbWLu7zisNSNO2jgDojSCvikxx37tZ4nfyKJBcNxF60UrFcPDYOZPgbt+Bqr7MMfVkrYCGakJEzuNWP38wich4fmvi91o+ts4Rr0aswz+wTyUhLbnJAPqC16JChriFLOhcVpOG8WaGpXD15pkCQIwMq5BRU+/HsJ7UdLgZRohr9jwthv0MTJbeCssi1EAXFczVj2yUOvY2kKh+cD1RCpXVuKKAYjiZDMFO2n4S0/Z41hGWd7884A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaTHfiX4ID1dlEHL1zTytR47A4vVDlT+h01+qiUk1PQ=;
 b=hAk/7qUJK11LWag38ksD64RFmvDwtqQuKFc5jsLOJofajnG71l32eLg+AUHHGhvv2HTcoXqc4Vr48JQkqTBFO+RpQBq+VunggWWAyBqbvWFxefadxQxduYSs6NGHa+Ty45L7vbGeYnPH8WxmwTwom8ATfCLJ5WKK4ld2IgAYDGzmDMo8FbdLKgoGtBIxwStK5mcPkEfP5QWYzUdFVZ6X80EWxQHXvBCaWBNJmbivAgGWc15xvhO5F1XbMkqZS9iD2Ukv5s5Hnj7zM2tWBFxwayZaqK9eZB217xJppfm/s4gGoniKuKOoPw1PYiXvyh+63YY/iMcKlQftzt91XTHvlQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaTHfiX4ID1dlEHL1zTytR47A4vVDlT+h01+qiUk1PQ=;
 b=iW83cUEgKgET2eop/+4SSSozS5ddvPU6o1eW1tmdddXWQ2jQAIVGRj8Ppnismmna9LV99vm0CkWk24OSWmI8bI7YPyqSVWSirePDbyMTbOCvLOz5Wcodjt9KlGokqrhLf8VwesiyQIpwtoNqsCzctEcYLR5JbxW+xe2eahZ/mjM=
Received: from DB9PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:10:1da::25)
 by PA6PR08MB10443.eurprd08.prod.outlook.com (2603:10a6:102:3cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 08:07:27 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::21) by DB9PR05CA0020.outlook.office365.com
 (2603:10a6:10:1da::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Tue,
 1 Jul 2025 08:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 08:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxPqgHXSK9swJDGsfMqywWkJ8J2xrTRtdgVCmV6riwwejNuyTR9TkVd9N+1WaB0LowTpuFw2MKRF5n+6QGrCHQQg+1VEToCvKB1KvlvgMwsPIMMF7l47sq7nWk00AO1RNGiyY98o8AcHXZF0AOVxSyVoEwI+g3SNwzSTVr3P6HySpl8OJ4DgAim/CyudyJjqlHofbwBx0Z5tDMnOxaVJH2x9CqwMbG1TbHzTkOlOdsC9v9xVusGa2RTbF9jA3XR5qJtRp3boFYmLM4lD0DaT8lN2MFW0uwlmAbuKeTgt9fRpns2hSi4Xr/qqW8dciPFaGtkkrj9p53YupzzjNYEnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaTHfiX4ID1dlEHL1zTytR47A4vVDlT+h01+qiUk1PQ=;
 b=GNFL447j5zTaI27rtUzJCwpoerrP4ycoSSnMEqavKdrr8GUejDrJieG7lIrdtlNclL7EuXoFM41DUGyRw+8Nm8RzlMeSrP305rwXqFuRgQ2Kut/qY01YWFVNpKspdXk7C5VYkABjSy1Mcm5Ui8OeQkZT/eo/AmpUUmFPlAlucp2pcquRbx2Ij5oRq1UpihTceYKyRODPdqIyt0a70IBZbFZK0V4KzQFVDaFkaIVv0xWmlrbTEWXTBrwsS4djkDKFF50EAnJ9cJVhT47HEzShscD8hiJTuVlcTfgLRXBIQKSFzEvMFiBIDpsJ0zAb/QmlwL9qbJbmQGlCdr+pjiobqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaTHfiX4ID1dlEHL1zTytR47A4vVDlT+h01+qiUk1PQ=;
 b=iW83cUEgKgET2eop/+4SSSozS5ddvPU6o1eW1tmdddXWQ2jQAIVGRj8Ppnismmna9LV99vm0CkWk24OSWmI8bI7YPyqSVWSirePDbyMTbOCvLOz5Wcodjt9KlGokqrhLf8VwesiyQIpwtoNqsCzctEcYLR5JbxW+xe2eahZ/mjM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM0PR08MB5379.eurprd08.prod.outlook.com (2603:10a6:208:182::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 08:06:53 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 08:06:53 +0000
Message-ID: <f5b68790-b997-49f5-ac90-aeb3e34df690@arm.com>
Date: Tue, 1 Jul 2025 13:36:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
To: Ryan Roberts <ryan.roberts@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM0PR08MB5379:EE_|DU6PEPF0000B61F:EE_|PA6PR08MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 135e70fb-d30b-46a2-d2f9-08ddb8765153
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RXE1ZlhrMHlnVmNIanpWMjBhRkJwY2g1Z0V3UjFEVVpTT0RqcWVwZEFtVjh2?=
 =?utf-8?B?d2hTSlB6YmRCQk1DQ0VCa2JZK21FaHlZR1c3UVBDNzBWOFNybkJZSTlodzFD?=
 =?utf-8?B?SVJXMFJoR0MyVW45QjlHVFBDeHF1aFFLeE1wa2Rld1ppcUNMY3NxTzhyQ1dv?=
 =?utf-8?B?OElSeElIdHJVSlY5N1VIV3EzL0x3dzJLNnBVN1NIdVF3OGdoYmRTV1owT1dy?=
 =?utf-8?B?WnZ5c3BSblpveE5mNXlLdkpKbEF2Tm80SVRqNTFZdkhlemdYZHh4NXdQMmh2?=
 =?utf-8?B?SE91ODlaaTFFYjVvamRRTXE3WER1YjVEOUp0aFRPZTk4SEtDRkxjWjdpSkwx?=
 =?utf-8?B?clYwdXlBVDh6OFFMOFZKSG5qdW05OWZqcHlTeVQ4eEUzVEE4TFRuKzJ6VFEz?=
 =?utf-8?B?SHFiQ2lEaGhaN0pZYnBOQU81dUNQTWdqTTgrclFSeEVhUXdXQTZjRlk0S0hy?=
 =?utf-8?B?N1ZKQkVmdDBJYkNPc2lXK0lDNFBrTExoQy81dmVlRm96b1hiTTdoeFJmZk9T?=
 =?utf-8?B?elZSWVM5elpLUFgyd2xTTVMxWEVYeTZmS1dmRzE4TzVNd25BamZETUNPRmh2?=
 =?utf-8?B?RmlWbytRdVZPeDBhSGlFRFE5TmMwaVdERkh5b09ORjB1SnVTbVh4OWNaSVVI?=
 =?utf-8?B?SW9tZ3ZFRG55TW15ZjZJdHAvZ2xZSFVObGxCdG8vV2NkcDBZMlAxZlZabEZO?=
 =?utf-8?B?dE41SjZ1RHJURTJ1UGF1R1lucVpkS2J1ODRYMS9oSGxVYXl6S2tJclVabUwr?=
 =?utf-8?B?dmFCbmlYcFluTnlBY01VMy9YN2FyTEdnbG9QRmVEVkdkMmFJM0NpT3ZvZjE5?=
 =?utf-8?B?dnNGSWRQMVo0UzlRZFdlQ3A3amszRHBuQktIR1hWNjJSdHhqSUVzQ1k0M2lj?=
 =?utf-8?B?MllKR0Z4QmtYNFkvSTdLL09rbk1YMDY0Z3lrTlJQZFBxSnd3bzZSQXI2Zi96?=
 =?utf-8?B?RkxSNndTRVpYRW5EeFJJK0c4MVp3RHNwa2hVUmNkRDRUVVhYRFVOaS84aDF1?=
 =?utf-8?B?OFdRR0xlQ2hMbXNYMkdPeTR4N0pMY05XUDQ4Z3gzZFNOSWtvdGFpcWhEcUd4?=
 =?utf-8?B?aklpWjYrNnVzWVVqS3BJNXlZRW1nUlE3eWt3dmZmNCszOVlqZmpNQ1pxWWJy?=
 =?utf-8?B?bVJKQW9IcktYeHNVL1NPVVFGOEZFTXFlQW1PTFB1a09mM3FyK0VHV2tmYW5R?=
 =?utf-8?B?MHBoRlVzL0xqUmEyM3RlSUxGdnoxWjJTOXhnUytjNW1MYmszamVuQzE3dzFO?=
 =?utf-8?B?UDhsSVR2bGtQZlhhcnZINHFZS2NxUTJoNGVteS9FNU9INnJ0QXZDM01Qc281?=
 =?utf-8?B?Rnk0MGc2TkxoVU9uWjQ1dVM0dVN3OUpVbStoViswZzRObVA1Z1d1OFFwVFdV?=
 =?utf-8?B?RUxYby9oZUtmZUhVVTdLWEJlS3pwOXZoeGJkZTlxa3dlUTFDY1RiTkVXODND?=
 =?utf-8?B?UUdIRFNqT0pMcFVhMnZKZWUvTWk1OHhIWEQvdnJHK3N0ZGFTOWxTaEtZMzFJ?=
 =?utf-8?B?ME5menlseU5OR2V3bUhla0QxTTNrdGxrcUJWZjJRYjdTUkNZNzY1RlpiZ1lp?=
 =?utf-8?B?YjBSeG50cmZDQWVuMklsWDJ3LzlNOWNIRmxIS3JXTzhqWmFtQTVRdkgxYlZO?=
 =?utf-8?B?WWYxTGhXRUJMbkwyQW1WSEwvSDg1R3JMN1M2NnpmdVZLeHVWNDRLNUhVbUIr?=
 =?utf-8?B?R2tDbXBNOEVuSFdDa09uL1FtUHo3RXBWUUN3L3g3ZGk2Smd6MHdDY2k1M0xP?=
 =?utf-8?B?UVB4OTgybHVDdk9XYUV1Mkw4SFk0OG1qeUxWT1YyNmw0dEkzdkpTV2lWZ3Ft?=
 =?utf-8?B?OXBpYk9reUdLcC9PajQyMnN3VVp6NDRFR2V6NWxZbXZaV1hFbkVnQnluVzNn?=
 =?utf-8?B?M3lsZkowODE1eTFKa0FtU1NBZERIN1p3R3FSdzE0ejJ0NkxzN2xPbzFkYjZ3?=
 =?utf-8?Q?SdjqUPBkSLc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5379
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23ab692d-0b57-4b36-df96-08ddb8763d49
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|36860700013|376014|7416014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mm1HRVdpc3NnMktFTS9XZVdKRThFSUZRblJPb0NyTnRyVWxhaC9sT2Nia0dq?=
 =?utf-8?B?YXRzZTZ5Y2h3azl3MTgxQ2pLRzM4bW5kMU9OUXgwbEg0Nm14cENSQWVVZXo4?=
 =?utf-8?B?bHdrVGZpRFJlclZPdFJySHdpTkpDSThaNkNiMmRlSmdWQjYyc051Zkx3ZDdF?=
 =?utf-8?B?QUVVczJ3WGZzZnVFcHgwZlY5cTY5QlhVZmV6SVR5eUoxdVhTL3lndjF5a0hx?=
 =?utf-8?B?bGxjRVM0TjZIcXFmVXFOdkxFd0dreTU4di91SFFuRGl3NTFmTDJHYXZHRE0z?=
 =?utf-8?B?d1ZSMWt5YnFjTUExcUFtUVdzeHdMa092K2NNNWFzOHRid0RWYW5yVFZFUUNT?=
 =?utf-8?B?T0xadnR1REdGNG1ZODIwcHNNWkFFTC85dGpPYnhKbUFmVytvQys5UDlaSTlV?=
 =?utf-8?B?SUF6aFNtSUduVFAxVklqNUpqZGo2dmlYTjg4QkVuQ3F1Q2lJU3NCbXY0dVBV?=
 =?utf-8?B?WmowdS9QSGYxc2lsdkVJOTNOZDdFM01KaklSV083dW5SbnJqRzVFVDROZjI1?=
 =?utf-8?B?Y0VyTE9FU0daZW9pcmZKekNNTnFCQVBUb21wWktMZkZUKzI2Ri9jalF3SW4y?=
 =?utf-8?B?NkRZT21JWDZZbTZZTGNBSERTdlpCUGVYN3RZMnJaaDNVaTJSUVJVaHk3czVt?=
 =?utf-8?B?ak1OTVNkWDNVeWVJWlA0cEgrdjNMN24ya3FDR1hDZStpRFBMYXVsYmtxRFA0?=
 =?utf-8?B?bkIyKzQ3SVRMYitzN0R1czNHeTFEVndLaDcvemVHbmQ2WUc3b2hrcFRPcURn?=
 =?utf-8?B?SHNGb01oemR5bTZ1SlphNHhCaER2bUhsbDMrRSs0Q3RIVjRFVFJ2OVNMcFNH?=
 =?utf-8?B?ZmNwOTVzdFNEaDRCZkRKOThpcVZrbWVDbXNFdW5rUGdmcnNwempGNm5XdlJC?=
 =?utf-8?B?eE1pMGtxaTZ5dXQwS1V4S2NjcGh4NExaTWY2Z05tTFVrd3hBWEhrSkQ0RElJ?=
 =?utf-8?B?dnpqT3ROVjZqc0txVmFvY2N3SStoOTBjWVZqVDFLWkZCcWJKUW56am5sbFln?=
 =?utf-8?B?UnBmZEVBSDBJYnBxd1NMUzhySWVOdEtJR0h2cEswMURXdWhrdkZ3YU41eVpJ?=
 =?utf-8?B?dUdJa2RiNGVUcFh2TDFGU0t6UlBXUTRmOXlFeUxUcEQ4eFJ4cnIwclFMS0Jz?=
 =?utf-8?B?UFlhSTJrWDVEZ1VBUnp6bWJoL1BrWGdENnYvbWxmUDVJYXFWZXF2YUJDeXBi?=
 =?utf-8?B?a28yZ05heWh1QTI3RTVPeVkrUVc0WGtxWkZvUG1KMGZ6ZW16YzFka0ZCU1NB?=
 =?utf-8?B?SnlIYVYvbDlLQVJzdEUrcUtUZ1lWc0hiS1QvYXdiSC9mcmhrcVZmWjBzOE51?=
 =?utf-8?B?WU5oK1N3alExQTBGMm1BTm5IZHJEU3VkeEs0dG1LY3V0R2lMNzVLREZUMXM2?=
 =?utf-8?B?RVhvSnhiQnVMNkFRWjU1aDBDQSs5SGtmSHd6MzBVV2oyNXlndUpFajdiM1lk?=
 =?utf-8?B?dFAveEoyTjZXS0xjTEZ1SUcrclhNU3A4MEtrMW1qaGR2a056NXZNaldwNXRo?=
 =?utf-8?B?TXNXY0ZyM1M5eUd3MlJmNGhNTWhuNlc3cVF0bkx1YmxjS1BmcVlDeGJadDBw?=
 =?utf-8?B?OWlRNzljdlZiRGxPWllZOXpTVHFTSzhxTGNvaWxaMmlSRXFSaG9OdDFWZ01F?=
 =?utf-8?B?TEtFZVlVejVldnBhaFNVNEIwUHpXb3NRWGxGVEEvZFJUUXNDZTBZb1d2VXQ3?=
 =?utf-8?B?MnhmM3U0a1FaeUxLcXRRZkJGaDU1RmpYa29aWWpLVGFSaUNrNmUydDgvRXlq?=
 =?utf-8?B?M2lvSVMyTzFLNmdkR3d6Zk9pb3VhSWhUd2N2bDRoU3JrbWRIWWloa2dlcHNF?=
 =?utf-8?B?anduK3hlNnlGL1laZTVaU2MyRis4RkxKZnhxbWxQRHgvZEtWUVM2blptRloz?=
 =?utf-8?B?NndpTXREaEM0RFlYVUhmV3oveHA5TjdMUDFFN2h6ZTZzSFgrTXN5RUg2YkFG?=
 =?utf-8?B?ZVlzTEZvTURwc2t4L2RHTVNFdUNRaHlqVFVPVkVuaHJkNEZlL0J5dCtxSjY1?=
 =?utf-8?B?R0VQV05iVVJIdmhpQkZQZGc5SThIcG9vUy9ieUlzd1RpMG90cEF4VFVEQ2gz?=
 =?utf-8?Q?kOuSmA?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700013)(376014)(7416014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:07:26.5466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135e70fb-d30b-46a2-d2f9-08ddb8765153
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10443


On 01/07/25 1:33 pm, Ryan Roberts wrote:
> On 30/06/2025 13:52, Lorenzo Stoakes wrote:
>> On Sat, Jun 28, 2025 at 05:04:34PM +0530, Dev Jain wrote:
>>> Use folio_pte_batch to batch process a large folio. Reuse the folio from
>>> prot_numa case if possible.
>>>
>>> For all cases other than the PageAnonExclusive case, if the case holds true
>>> for one pte in the batch, one can confirm that that case will hold true for
>>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
>>> and access bits across the batch, therefore batching across
>>> pte_dirty(): this is correct since the dirty bit on the PTE really is
>>> just an indication that the folio got written to, so even if the PTE is
>>> not actually dirty (but one of the PTEs in the batch is), the wp-fault
>>> optimization can be made.
>>>
>>> The crux now is how to batch around the PageAnonExclusive case; we must
>>> check the corresponding condition for every single page. Therefore, from
>>> the large folio batch, we process sub batches of ptes mapping pages with
>>> the same PageAnonExclusive condition, and process that sub batch, then
>>> determine and process the next sub batch, and so on. Note that this does
>>> not cause any extra overhead; if suppose the size of the folio batch
>>> is 512, then the sub batch processing in total will take 512 iterations,
>>> which is the same as what we would have done before.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   mm/mprotect.c | 143 +++++++++++++++++++++++++++++++++++++++++---------
>>>   1 file changed, 117 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index 627b0d67cc4a..28c7ce7728ff 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -40,35 +40,47 @@
>>>
>>>   #include "internal.h"
>>>
>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>> -			     pte_t pte)
>>> -{
>>> -	struct page *page;
>>> +enum tristate {
>>> +	TRI_FALSE = 0,
>>> +	TRI_TRUE = 1,
>>> +	TRI_MAYBE = -1,
>>> +};
>> Yeah no, absolutely not, this is horrible, I don't want to see an arbitrary type
>> like this added, to a random file, and I absolutely think this adds confusion
>> and does not in any way help clarify things.
>>
>>> +/*
>>> + * Returns enum tristate indicating whether the pte can be changed to writable.
>>> + * If TRI_MAYBE is returned, then the folio is anonymous and the user must
>>> + * additionally check PageAnonExclusive() for every page in the desired range.
>>> + */
>>> +static int maybe_change_pte_writable(struct vm_area_struct *vma,
>>> +				     unsigned long addr, pte_t pte,
>>> +				     struct folio *folio)
>>> +{
>>>   	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>>> -		return false;
>>> +		return TRI_FALSE;
>>>
>>>   	/* Don't touch entries that are not even readable. */
>>>   	if (pte_protnone(pte))
>>> -		return false;
>>> +		return TRI_FALSE;
>>>
>>>   	/* Do we need write faults for softdirty tracking? */
>>>   	if (pte_needs_soft_dirty_wp(vma, pte))
>>> -		return false;
>>> +		return TRI_FALSE;
>>>
>>>   	/* Do we need write faults for uffd-wp tracking? */
>>>   	if (userfaultfd_pte_wp(vma, pte))
>>> -		return false;
>>> +		return TRI_FALSE;
>>>
>>>   	if (!(vma->vm_flags & VM_SHARED)) {
>>>   		/*
>>>   		 * Writable MAP_PRIVATE mapping: We can only special-case on
>>>   		 * exclusive anonymous pages, because we know that our
>>>   		 * write-fault handler similarly would map them writable without
>>> -		 * any additional checks while holding the PT lock.
>>> +		 * any additional checks while holding the PT lock. So if the
>>> +		 * folio is not anonymous, we know we cannot change pte to
>>> +		 * writable. If it is anonymous then the caller must further
>>> +		 * check that the page is AnonExclusive().
>>>   		 */
>>> -		page = vm_normal_page(vma, addr, pte);
>>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>>> +		return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : TRI_FALSE;
>>>   	}
>>>
>>>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>>> @@ -80,15 +92,61 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>   	 * FS was already notified and we can simply mark the PTE writable
>>>   	 * just like the write-fault handler would do.
>>>   	 */
>>> -	return pte_dirty(pte);
>>> +	return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
>>> +}
>> Yeah not a fan of this at all.
>>
>> This is squashing all the logic into one place when we don't really need to.
>>
>> We can separate out the shared logic and just do something like:
>>
>> ////// Lorenzo's suggestion //////
>>
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte)
>> +static bool maybe_change_pte_writable(struct vm_area_struct *vma,
>> +		pte_t pte)
>>   {
>> -	struct page *page;
>> -
>>   	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>>   		return false;
>>
>> @@ -60,16 +58,14 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	if (userfaultfd_pte_wp(vma, pte))
>>   		return false;
>>
>> -	if (!(vma->vm_flags & VM_SHARED)) {
>> -		/*
>> -		 * Writable MAP_PRIVATE mapping: We can only special-case on
>> -		 * exclusive anonymous pages, because we know that our
>> -		 * write-fault handler similarly would map them writable without
>> -		 * any additional checks while holding the PT lock.
>> -		 */
>> -		page = vm_normal_page(vma, addr, pte);
>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>> -	}
>> +	return true;
>> +}
>> +
>> +static bool can_change_shared_pte_writable(struct vm_area_struct *vma,
>> +		pte_t pte)
>> +{
>> +	if (!maybe_change_pte_writable(vma, pte))
>> +		return false;
>>
>>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>>
>> @@ -83,6 +79,33 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	return pte_dirty(pte);
>>   }
>>
>> +static bool can_change_private_pte_writable(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t pte)
>> +{
>> +	struct page *page;
>> +
>> +	if (!maybe_change_pte_writable(vma, pte))
>> +		return false;
>> +
>> +	/*
>> +	 * Writable MAP_PRIVATE mapping: We can only special-case on
>> +	 * exclusive anonymous pages, because we know that our
>> +	 * write-fault handler similarly would map them writable without
>> +	 * any additional checks while holding the PT lock.
>> +	 */
>> +	page = vm_normal_page(vma, addr, pte);
>> +	return page && PageAnon(page) && PageAnonExclusive(page);
>> +}
>> +
>> +bool can_change_pte_writable(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t pte)
>> +{
>> +	if (vma->vm_flags & VM_SHARED)
>> +		return can_change_shared_pte_writable(vma, pte);
>> +
>> +	return can_change_private_pte_writable(vma, addr, pte);
>> +}
>> +
>>
>> ////// end of Lorenzo's suggestion //////
>>
>> You can obviously modify this to change other stuff like whether you feed back
>> the PAE or not in private case for use in your code.
> This sugestion for this part of the problem looks much cleaner!
>
> Sorry; this whole struct tristate thing was my idea. I never really liked it but
> I was more focussed on trying to illustrate the big picture flow that I thought
> would work well with a batch and sub-batches (which it seems below that you
> hate... but let's talk about that down there).
>
>>> +
>>> +/*
>>> + * Returns the number of pages within the folio, starting from the page
>>> + * indicated by pgidx and up to pgidx + max_nr, that have the same value of
>>> + * PageAnonExclusive(). Must only be called for anonymous folios. Value of
>>> + * PageAnonExclusive() is returned in *exclusive.
>>> + */
>>> +static int anon_exclusive_batch(struct folio *folio, int pgidx, int max_nr,
>>> +				bool *exclusive)
>> Let's generalise it to something like count_folio_fungible_pages()
>>
>> or maybe count_folio_batchable_pages()?
>>
>> Yes naming is hard... :P but right now it reads like this is returning a batch
>> or doing something with a batch.
>>
>>> +{
>>> +	struct page *page;
>>> +	int nr = 1;
>>> +
>>> +	if (!folio) {
>>> +		*exclusive = false;
>>> +		return nr;
>>> +	}
>>> +
>>> +	page = folio_page(folio, pgidx++);
>>> +	*exclusive = PageAnonExclusive(page);
>>> +	while (nr < max_nr) {
>> The C programming language asks why you don't like using for :)
>>
>>> +		page = folio_page(folio, pgidx++);
>>> +		if ((*exclusive) != PageAnonExclusive(page))
>>> +			break;
>>> +		nr++;
>> This *exclusive stuff makes me want to cry :)
>>
>> Just set a local variable and hand it back at the end.
>>
>>> +	}
>>> +
>>> +	return nr;
>>> +}
>>> +
>>> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>> +			     pte_t pte)
>>> +{
>>> +	struct page *page;
>>> +	int ret;
>>> +
>>> +	ret = maybe_change_pte_writable(vma, addr, pte, NULL);
>>> +	if (ret == TRI_MAYBE) {
>>> +		page = vm_normal_page(vma, addr, pte);
>>> +		ret = page && PageAnon(page) && PageAnonExclusive(page);
>>> +	}
>>> +
>>> +	return ret;
>>>   }
>> See above comments on this stuff.
>>
>>>   static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>>> -		pte_t *ptep, pte_t pte, int max_nr_ptes)
>>> +		pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)
>> This last parameter is pretty horrible. It's a negative mask so now you're
>> passing 'ignore soft dirty' to the function meaning 'don't ignore it'. This is
>> just planting land mines.
>>
>> Obviously David's flag changes will also alter all this.
>>
>> Just add a boolean re: soft dirty.
> Dev had a boolean for this in the last round. I've seen various functions expand
> over time with increasing numbers of bool flags. So I asked to convert to a
> flags parameter and just pass in the flags we need. Then it's a bit more future
> proof and self documenting. (For the record I dislike the "switch_off_flags"
> approach taken here).
>
>>>   {
>>> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +	fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +
>>> +	flags &= ~switch_off_flags;
>>>
>>> -	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>>> +	if (!folio || !folio_test_large(folio))
>>>   		return 1;
>> Why remove this last check?
>>
>>>   	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>>> @@ -154,7 +212,8 @@ static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma
>>>   	}
>>>
>>>   skip_batch:
>>> -	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>>> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>>> +					   max_nr_ptes, 0);
>> See above about flag param. If you change to boolean, please prefix this with
>> e.g. /* set_soft_dirty= */ true or whatever the flag ends up being :)
>>
>>>   out:
>>>   	*foliop = folio;
>>>   	return nr_ptes;
>>> @@ -191,7 +250,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>   		if (pte_present(oldpte)) {
>>>   			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>>   			struct folio *folio = NULL;
>>> -			pte_t ptent;
>>> +			int sub_nr_ptes, pgidx = 0;
>>> +			pte_t ptent, newpte;
>>> +			bool sub_set_write;
>>> +			int set_write;
>>>
>>>   			/*
>>>   			 * Avoid trapping faults against the zero or KSM
>>> @@ -206,6 +268,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>   					continue;
>>>   			}
>>>
>>> +			if (!folio)
>>> +				folio = vm_normal_folio(vma, addr, oldpte);
>>> +
>>> +			nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
>>> +							   max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
>> Don't we only care about S/D if pte_needs_soft_dirty_wp()?
>>
>>>   			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>>   			ptent = pte_modify(oldpte, newprot);
>>>
>>> @@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>   			 * example, if a PTE is already dirty and no other
>>>   			 * COW or special handling is required.
>>>   			 */
>>> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>> -			    !pte_write(ptent) &&
>>> -			    can_change_pte_writable(vma, addr, ptent))
>>> -				ptent = pte_mkwrite(ptent, vma);
>>> -
>>> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>> -			if (pte_needs_flush(oldpte, ptent))
>>> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>> -			pages++;
>>> +			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>> +				    !pte_write(ptent);
>>> +			if (set_write)
>>> +				set_write = maybe_change_pte_writable(vma, addr, ptent, folio);
>>> +
>>> +			while (nr_ptes) {
>>> +				if (set_write == TRI_MAYBE) {
>>> +					sub_nr_ptes = anon_exclusive_batch(folio,
>>> +						pgidx, nr_ptes, &sub_set_write);
>>> +				} else {
>>> +					sub_nr_ptes = nr_ptes;
>>> +					sub_set_write = (set_write == TRI_TRUE);
>>> +				}
>>> +
>>> +				if (sub_set_write)
>>> +					newpte = pte_mkwrite(ptent, vma);
>>> +				else
>>> +					newpte = ptent;
>>> +
>>> +				modify_prot_commit_ptes(vma, addr, pte, oldpte,
>>> +							newpte, sub_nr_ptes);
>>> +				if (pte_needs_flush(oldpte, newpte))
>>> +					tlb_flush_pte_range(tlb, addr,
>>> +						sub_nr_ptes * PAGE_SIZE);
>>> +
>>> +				addr += sub_nr_ptes * PAGE_SIZE;
>>> +				pte += sub_nr_ptes;
>>> +				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
>>> +				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
>>> +				nr_ptes -= sub_nr_ptes;
>>> +				pages += sub_nr_ptes;
>>> +				pgidx += sub_nr_ptes;
>>> +			}
>> I hate hate hate having this loop here, let's abstract this please.
>>
>> I mean I think we can just use mprotect_folio_pte_batch() no? It's not
>> abstracting much here, and we can just do all this handling there. Maybe have to
>> pass in a bunch more params, but it saves us having to do all this.
> In an ideal world we would flatten and just have mprotect_folio_pte_batch()
> return the batch size considering all the relevant PTE bits AND the
> AnonExclusive bit on the pages. IIRC one of Dev's earlier versions modified the
> core folio_pte_batch() function to also look at the AnonExclusive bit, but I
> really disliked changing that core function (I think others did too?).

That patch was in our private exchange, not on the list.

>
> So barring that approach, we are really only left with the batch and sub-batch
> approach - although, yes, it could be abstracted more. We could maintain a
> context struct that persists across all calls to mprotect_folio_pte_batch() and
> it can use that to keep it's state to remember if we are in the middle of a
> sub-batch and decide either to call folio_pte_batch() to get a new batch, or
> call anon_exclusive_batch() to get the next sub-batch within the current batch.
> But that started to feel overly abstracted to me.
>
> This loop approach, as written, felt more straightforward for the reader to
> understand (i.e. the least-worst option). Is the context approach what you are
> suggesting or do you have something else in mind?
>
>> Alternatively, we could add a new wrapper function, but yeah definitely not
>> this.
>>
>> Also the C programming language asks... etc etc. ;)
>>
>> Overall since you always end up processing folio_nr_pages(folio) you can just
>> have the batch function or a wrapper return this and do updates as necessary
>> here on that basis, and leave the 'sub' batching to that function.
> Sorry I don't understand this statement - could you clarify? Especially the bit
> about "always ... processing folio_nr_pages(folio)"; I don't think we do. In
> various corner cases the size of the folio has no relationship to the way the
> PTEs are mapped.
>
> Thanks,
> Ryan
>
>>
>>>   		} else if (is_swap_pte(oldpte)) {
>>>   			swp_entry_t entry = pte_to_swp_entry(oldpte);
>>>   			pte_t newpte;
>>> --
>>> 2.30.2
>>>
