Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6B01C6FF5;
	Thu,  5 Jun 2025 04:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749099536; cv=fail; b=oZtLF0vA63z7bTuGJallpCdsI34Dwg92qvBerLS5r4eYfFYoj+R+fjUpA7c0N/+FyZHHuijWxIs4z2THtnpAMxtF6jiBnPVoN3B8rmVgAnu3+d+5NE8KNX9LZzYL6mvD6zohyheP1N+vcJRA0zisLab6nwV9wKRVUAxcsF4vRGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749099536; c=relaxed/simple;
	bh=Rs5LQ4BFZEX1CdCQRlPWjGTc/R6zYqPc0wTj4ac5lgY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=exCsZhVkSbSOBnxVwsuKUuhAJZ5jF/cIX416l3F5CqFbi8LEYrGcUafmfRdwnDOdMyiJF8KV4+uIHm+UasQfk69orK1mpsJTaIObOiy3qt8Wh0KPOzHsCkfkKNHh1u1CCARoSAO7Wi2kiVggCiJvoPQYeYBTzk5Tk/NBV9AhJK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DZ0bkUzt; arc=fail smtp.client-ip=40.107.93.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DZ0bkUzt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rb7bRSkToFBh+w/Uibgz4HS9mRfo/YiC3LVN0pMj5oFNYf/xjYNVtLtGM+0tU+kh4XBHhZ5wNdnShBJFrsO+yd4Prt9mSQdfQYbWb5KBR4r2BC0T57KxKXHtfTayJWKVQNUT0XBMVh6xzOMRmJNxNtKGnN9IbOpa+pzYrnge+MM2ywl1GPFgsc1yr3dRNSIN0r72MC63a2lF3u9QEN0cSYJKIhrcQ/92VlL8kG0SNP75SwErtJffDyrI25ZkyIXduGYuDXYR2+43TuHgn0jjMBEi8vEXtbx9UnVztR1nYkgalh+G6aO1wVTWjbuYl2TEtdAK3OWMW1RGQoYobBfw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs5LQ4BFZEX1CdCQRlPWjGTc/R6zYqPc0wTj4ac5lgY=;
 b=mZk9FYLT0NbOUCdQ/CDc1oQfi8iFYR6oTMEm+QI2mzgGsDKxfMbhEYysFzFMd+5voE9QxajWN/ssUgShnUqEyFVxbYkyfHvcSFwyMlE6R+f92/cV8To4D9YZt7cRwblnN1DS0BBHm79MTJQcxkuUHzc6LyChBIXojNO938Gnj97HGObrC7smj3APiGfy6Endrvw+DNNC3h7KtDTzDAjvhShVudyjpfcVWvdEpDMGG6Iew8HqQRxy5wSVVroZDxfnONe8tDVVH97aDIEE24wztixsXNwUz01rW+6hd0VNfT3157RMLvQlhJ3pf5atx0Art0ga+AgcU1+fbsp3ZvjQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs5LQ4BFZEX1CdCQRlPWjGTc/R6zYqPc0wTj4ac5lgY=;
 b=DZ0bkUztjoT2F/TSuFLVyckXSp31rURQ1qb4KwzJ/mI9a1KP5HLKxFuFcuA9aR4/bqlrFOgZadOoTG71AiHccZtRFW4NG3zGHpUKztsiFoO3f4r+YO7dGLbrbiTrqfFV5iC5AStwj86O23ABrXZ534lFf1mpypncu0vzCBBjrB8=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by DM6PR12MB4316.namprd12.prod.outlook.com (2603:10b6:5:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Thu, 5 Jun
 2025 04:58:50 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 04:58:50 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "git
 (AMD-Xilinx)" <git@amd.com>, "amitrkcian2002@gmail.com"
	<amitrkcian2002@gmail.com>, Bernhard Frauendienst <kernel@nospam.obeliks.de>
Subject: RE: [PATCH v13 3/3] mtd: Add driver for concatenating devices
Thread-Topic: [PATCH v13 3/3] mtd: Add driver for concatenating devices
Thread-Index: AQHb1L+rxkaEZPDIFEKZdywc9m/BhLPyqgB1gAFVkrA=
Date: Thu, 5 Jun 2025 04:58:50 +0000
Message-ID:
 <IA0PR12MB7699DCA10744AD147339839CDC6FA@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
	<20250603194209.1341374-4-amit.kumar-mahapatra@amd.com>
 <87sekfkjc1.fsf@bootlin.com>
In-Reply-To: <87sekfkjc1.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=a044baa4-7fac-4c6f-8346-1045909dac9f;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-05T04:44:34Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|DM6PR12MB4316:EE_
x-ms-office365-filtering-correlation-id: 63dd2b5a-4fb0-4ae8-cba4-08dda3eda9a9
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWpLNFc5RFhGYjJuMnFqRVM1dVBiWjNLQzVKZWF1aXVpdDFkS3pBYmJDZU1M?=
 =?utf-8?B?NUxERU9BUWVXenJMNFNMc2ZwYmhjdWlLR01tNi9hV0UxU0tOaGRucE9aOTBy?=
 =?utf-8?B?UzYyelZ4dlBDWFIyTVNyVFJENllYSjZycVcwYlZIWUlEMTdoUC9KZE04Q20z?=
 =?utf-8?B?akJScWVnWGl6d3RvNDNhTU02N1dIeHRDd1BrQUxIalBRSDVCYVUxVjl0MkF0?=
 =?utf-8?B?bXAwTEhXRmZoSzZJditmbTFrSXBPbFBoRmFKU09SNzdBZVRrbTF2WGMrNzFL?=
 =?utf-8?B?WUJTQnhXcndHQVJzcEVHQ3F5MWxxYUIxT1duUWtRTndiKzczRnF5YzQ2UU9p?=
 =?utf-8?B?djZvNDNoR3FDK0RzSzdXUmlJMzcwWXRFbVdSR0hvQ0RPNHEvVzZIbWFKbmJw?=
 =?utf-8?B?eUFrNTR5K0wwQi9lam81bTgvVHJ4OHdoT1JLbTlVRkRzS01zeUdIWi9IY3Zt?=
 =?utf-8?B?K3FBeHVnMVFGaUpOMGNYR2RxTEorRTdMbW5RZ0oyMDlVb1ZTZ0g2ODFLOVky?=
 =?utf-8?B?T3crNkc2U05kb21tRjRQL2IzQ09YMHROTlJRTThFZWJjTmJGazlNdGozajNa?=
 =?utf-8?B?ZXBxaWNqVTQwc0VnWGFTak9Rc25NeVBKNE1Talc0TGRtT1NUb3E5Q2x1TlRu?=
 =?utf-8?B?SkhYaVQ0SWhpeHNsWFNUd1JzRm85RkF3cjQ1M2VGbkhRSkxmdUhYVWlKL2Fk?=
 =?utf-8?B?NFFpbE9BMTJvMWw3TUZtTnBSVmVkY0kxajNJS1BtWU13a0ROZW5ZZ2t2cW0v?=
 =?utf-8?B?U3ppd3BWMUVkQkRsb2tqaHdEMGRlNlhtWWtYdDBlaWU0N2cyNXl2OFdNKzI5?=
 =?utf-8?B?ZFhqelU1WldJYWtheW1IZW82VEZ2OUs3UDAzSE0zSDIvaUMzQi8zNGlSSDVQ?=
 =?utf-8?B?OXNWNUd0eTlDd0h5OGtsUEZwZ3lYTlRlTDltTml1WlErU1dJdGJGa1NzQmlJ?=
 =?utf-8?B?TU5OdWErbGdSNFJKK1N6V1lMTDVwbk5yMDdXQTlBcktMN1htNWh2US94b0RU?=
 =?utf-8?B?ZmlLV2dIdWhOTDJYYkluQzhWM2QvN3VVeTIwRnBiOFd2bU9zVGszM0VvbVVL?=
 =?utf-8?B?dDBxNW1kTzdROXN4VlFiamx1NGJZZ0R3OWRXTW9tandqdlU4bnc1SkF4aXNO?=
 =?utf-8?B?MEtQU01jQ2hKZUNWQW43QnFQUVlnWDFpY2RLZldPODBNeDZtdWRzVUdJZm52?=
 =?utf-8?B?VEx0WWhNRmdnVFRONyt6a1JUUndZY3JJZlZ3V1gzQ0RCbTFCREhHeFZnVU4x?=
 =?utf-8?B?S3U5WGozTW1BRVpKVUF3anljUUJqNEpJb1FUTDBEM3R5NUY1QUNyeVlPTnFv?=
 =?utf-8?B?N1ZzZnJncHMyVVJGbEh4UjVteWs5ME5WbVh3YTdoOHBJWE9xdUYxaEp5M0Rh?=
 =?utf-8?B?UENicmhmRmhCVzRMVDlGa0RvNHJyb3FibGZYYmUzWlZ3U0dlNlNrVXgxMVg0?=
 =?utf-8?B?YjU4Y2lWUHBIWXlSSEVoWmU3L3pkV1VwRGdpY291Y2ZKYTdVVENTTnhtK0gx?=
 =?utf-8?B?RkZUN2lrZys2Z3J1UHNEVmJqV2hPYkc5NzF4SDE5Ly90TlRKb00wTGorMjg4?=
 =?utf-8?B?TlhPVFJ5WWRUOXV6T3NtSDZGZk5xOWdKdUxNaWFDTEQrUzR4RmpCcVBqTG1Z?=
 =?utf-8?B?TThzTGY2UWRZNERIVlZrR1VEZEZ0c0FVUWwvcDd6YTl1ZFpHc3ErRUZWNGJR?=
 =?utf-8?B?NnFUSlZDODVwdGxzNmE2dkRmT1BjOWsyclExUDBjSWdvbXJLN2t5UFB4NGhO?=
 =?utf-8?B?T09NNjhoaFkyd0JOL2w3MC9YYnpZZkdqcFpBQ3pkTVY5dEp4S0k5cjJtaUNy?=
 =?utf-8?B?U3lPN1I0RTErMFBQeEVTQXRPaFdoVy85R1UwWFJOc1VSLzlGd2NyUDVIVHVX?=
 =?utf-8?B?c2gxcEUyaUkxM0lUSnRoVkFRbWNHbVV2ZU82VDl4Zk9HdllIRmpHYTZLYjJl?=
 =?utf-8?B?S0VZcWlndUJFQ0dhVlNoR1hiQkNuQko3Wkh4TkMzQ2lVcEhIdm9iREZuMnps?=
 =?utf-8?Q?1pokvsjDQRDAHUAXzVgI0cPS8jkM0A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mjh0dU1UbnBreVFSZUFNOW96d2pHRE1PVkhvVVNMYUFyQjNXUzRZbUJtMHM4?=
 =?utf-8?B?N1A2UFlqVzNhOTVuaW1JS2dVSHZPOExPRjhNaWtubW5JS0Vuc1psQXUvdFgv?=
 =?utf-8?B?SHVqU1BtR3BYVEZUa0hxTTVjcldhMUpPZFZUWmp3alpIR1FzTjNkcGozMVNN?=
 =?utf-8?B?Z2Njdmw4dXZFdXVFME9idVcxTTAwdVkvd0dHR1BScGtCUFpVcEpEV3doSC9h?=
 =?utf-8?B?bm5sMjRoWDdZc3J0c2dLQStCTFB2NEhhQk42YVN6ZStzd3VGbFR6bFVEdWh0?=
 =?utf-8?B?UUdNV2pvWW5YQkhobVZWSnJtTXZMa2VQTWFTbzBWV1N0NS8rSlF3ZTAvQXNV?=
 =?utf-8?B?ZFM1ekV3STNneUwxV0lpSEhrcG5CbjFwNFF4MThiR1RUYUdnUkhXQjFDUHlI?=
 =?utf-8?B?bm52Mnl5eUwwREI2ZEtQV2N3dCtoUEJSZ25rdk16eE91T1RNMzN2MW9JVUZT?=
 =?utf-8?B?K1RLbTBOV01qZDBDZVY1U2g2bHVCZE40eVpqcHF4RFVBUWpLVE8vUjJNZ1dp?=
 =?utf-8?B?Zy9UT1BVUzVwMEtobURWdktpSDNTME0xYzZKN3BIc1hrUWlVQjU4Tmt1bXRT?=
 =?utf-8?B?OXRqck02cEgxVXFpUGE3aVVPUnQyQTdISENUMXFPR3JFMWF0bkgwSjdMU3o0?=
 =?utf-8?B?aG9Pd1hJMGlkZWkvbE1MRHFvSkpCMkNzSFpheHhyNVZPTXZGakFLa3U1ZHpp?=
 =?utf-8?B?d3YzWTRHSFV3eW1pMnVIbWZBNGJnTmFmUjFJQUxEaldSYUJsZGptMVZhRWM2?=
 =?utf-8?B?ZjZndy96K25sM2hDb01wMUtGN2lzSGZZYjZ2OXZCdmVUbXQvRWlTZktWSXZy?=
 =?utf-8?B?R3A1UUVCNWpmajFEZ1ptTDc3V3BRaVFxanVzZ1FtYlJTMkZBQkFsdWFPRkpF?=
 =?utf-8?B?UzJWNlhidlNFVHNabXZwb2tOWExOeGZSY3Q4TDBIdWx3MFJlSmY4ZkwvVVow?=
 =?utf-8?B?MTAyNEp5dnVQRElZbTBPbXBEYUhTeVI2bmh4VkpFcDlBeklTWjJiQVo5YU50?=
 =?utf-8?B?dWlwYkdDSUVBZXI3OXhGRVluL3V2R0lPcjJKSXdIdEoxb2diQ1FFVFE2OUVa?=
 =?utf-8?B?WXp1aVV4MWdWNEV0MStMR2cvWnRpekhaZjNkNWovUVM3eWpkU3lWVEhYRWZK?=
 =?utf-8?B?QXBXRk9RUkFCcGlMYUs4S2ZnNGVGQmtlZkRjc1RxOWV4S09QblVDM2wyejd1?=
 =?utf-8?B?VFgvRGlnVFUvS3JmaklrRXpGMGpWZWhLMmwrMmpKd1NsME9aZVdkN0tQdWNS?=
 =?utf-8?B?cEtKbHhLTG1lcWMvT1RYQ0pVU3o1SWxUaDNzKzBkaFFCRHZOM1JjWFZZNEl6?=
 =?utf-8?B?ekJsMklDdnYwc0kvK3Jxd0pYeFRDbHJ4TzY1NmZ2Q3NiN0N3MzY1R3lJdE03?=
 =?utf-8?B?Sk9lcWRocWczZGpZdWYzdmVyMkNCVEZpZjJCaGx3SmxybGlpMTJSQmtIWkV5?=
 =?utf-8?B?QzY1dmlTQmJrQWk0bmZ5NUtzN2VIWHhDZCtkckFrK0hHWTJTZmhCZlhoTWV1?=
 =?utf-8?B?WVoyWCtNK0lEQVQzbksveVVOZ3lLRE4wdDVtaXp2aGJsVEp1aEQwNDRET2VC?=
 =?utf-8?B?NG1mNG1Jb2M0NTlMZjBWTHQ2WGJDcnBqZGJqWlRkWkpoQ0ZwWk9na1d3VC9D?=
 =?utf-8?B?d0RFcDUxMXhPYno0dW52RGJLYnZmZUNTL1h5UmZYMjhadFZjVGFleGdHVjdN?=
 =?utf-8?B?K2lXV1ltSnI2Tk9XMTJrYXQ4RzdoMmlYeENsOVA4NEtLNXZVK2dQVXBKWkNn?=
 =?utf-8?B?bTU3KzNYS0s2Y1lvWFRjOGN4b3JtVUVTbVZZS0hIb1BtQVNwb3BPTjV5R01i?=
 =?utf-8?B?czFUN1hTWGZsTEdUcGp4VHlSVkpwN2J3a0NDSGZkem5leEg4QkFiMm1BZFlP?=
 =?utf-8?B?WFE4WFBKRnB3SWFjNFVWTWp0bVZ6Y21mRXdIdi9yWFpPbHo1LzY1Vm5mSy80?=
 =?utf-8?B?aGhvb1pFcFlCemIzSG9UN2UvOWFZV013YjczRkc2alpzc3dxK29XS2h3bnpC?=
 =?utf-8?B?RWlmZk5MMi95UWxKU3BWOGlQdjdraitxTGs4bWFpb1p0Yis3UXZta3hSYktU?=
 =?utf-8?B?Z29TZ1JWb3pOK2xlZEVnUTh3dkFlb3NtUXQvK2kyMU44RTNXcTFRKzZMbnEz?=
 =?utf-8?Q?FAp8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7699.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dd2b5a-4fb0-4ae8-cba4-08dda3eda9a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 04:58:50.4910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DukOFIKI5hijqkrIlgVYz57xX/OfpwisHH1fmL5l5FVfKCEcIWACyBDcfJezNwV66Il4j7QfsAHKWrd1fqk9Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4316

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGVsbG8gTWlxdWVsLA0KPg0KPiBIaSBBbWl0LA0KPg0KPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvbXRkL2NvbmNhdC5oDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvY29uY2F0LmgNCj4g
PiBAQCAtMjgsNSArMjgsMzcgQEAgc3RydWN0IG10ZF9pbmZvICptdGRfY29uY2F0X2NyZWF0ZSgN
Cj4gPg0KPiA+ICB2b2lkIG10ZF9jb25jYXRfZGVzdHJveShzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7
DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIG10ZF92aXJ0X2NvbmNhdF9ub2RlX2NyZWF0ZSAtIENy
ZWF0ZSBhIGNvbXBvbmVudCBmb3IgY29uY2F0ZW5hdGlvbg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1
cm5zIGEgcG9zaXRpdmUgbnVtYmVyIHJlcHJlc2VudGluZyB0aGUgbm8uIG9mIGRldmljZXMgZm91
bmQNCj4gPiArZm9yDQo+ID4gKyAqIGNvbmNhdGVuYXRpb24sIG9yIGEgbmVnYXRpdmUgZXJyb3Ig
Y29kZS4NCj4gPiArICoNCj4gPiArICogTGlzdCBhbGwgdGhlIGRldmljZXMgZm9yIGNvbmNhdGVu
YXRpb25zIGZvdW5kIGluIERUIGFuZCBjcmVhdGUgYQ0KPiA+ICsgKiBjb21wb25lbnQgZm9yIGNv
bmNhdGVuYXRpb24uDQo+ID4gKyAqLw0KPiA+ICtpbnQgbXRkX3ZpcnRfY29uY2F0X25vZGVfY3Jl
YXRlKHZvaWQpOw0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIG10ZF92aXJ0X2NvbmNhdF9hZGQg
LSBhZGQgbXRkX2luZm8gb2JqZWN0IHRvIHRoZSBsaXN0IG9mDQo+ID4gK3N1YmRldmljZXMgZm9y
IGNvbmNhdGVuYXRpb24NCj4gPiArICogQG10ZDogcG9pbnRlciB0byBuZXcgTVREIGRldmljZSBp
bmZvIHN0cnVjdHVyZQ0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zIHRydWUgaWYgdGhlIG10ZF9p
bmZvIG9iamVjdCBpcyBhZGRlZCBzdWNjZXNzZnVsbHkgZWxzZSByZXR1cm5zIGZhbHNlLg0KPiA+
ICsgKg0KPiA+ICsgKiBUaGUgbXRkX2luZm8gb2JqZWN0IGlzIGFkZGVkIHRvIHRoZSBsaXN0IG9m
IHN1YmRldmljZXMgZm9yIGNvbmNhdGVuYXRpb24uDQo+ID4gKyAqIEl0IHJldHVybnMgdHJ1ZSBp
ZiBhIG1hdGNoIGlzIGZvdW5kLCBhbmQgZmFsc2UgaWYgYWxsIHN1YmRldmljZXMNCj4gPiAraGF2
ZQ0KPiA+ICsgKiBhbHJlYWR5IGJlZW4gYWRkZWQgb3IgaWYgdGhlIG10ZF9pbmZvIG9iamVjdCBk
b2VzIG5vdCBtYXRjaCBhbnkgb2YNCj4gPiArdGhlDQo+ID4gKyAqIGludGVuZGVkIE1URCBkZXZp
Y2VzLg0KPiA+ICsgKi8NCj4gPiArYm9vbCBtdGRfdmlydF9jb25jYXRfYWRkKHN0cnVjdCBtdGRf
aW5mbyAqbXRkKTsNCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBtdGRfdmlydF9jb25jYXRfY3Jl
YXRlX2pvaW4gLSBDcmVhdGUgYW5kIHJlZ2lzdGVyIHRoZSBjb25jYXRlbmF0ZWQNCj4gPiArTVRE
IGRldmljZQ0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zIG9uIHN1Y2Nlcywgb3IgYSBuZWdhdGl2
ZSBlcnJvciBjb2RlLg0KPiA+ICsgKg0KPiA+ICsgKiBDcmVhdGVzIGFuZCByZWdpc3RlcnMgdGhl
IGNvbmNhdGVuYXRlZCBNVEQgZGV2aWNlICAqLyBpbnQNCj4gPiArbXRkX3ZpcnRfY29uY2F0X2Ny
ZWF0ZV9qb2luKHZvaWQpOw0KPiA+ICAjZW5kaWYNCj4NCj4gRG9uJ3Qgd2UgbWlzcyBzb21lIGRl
c3RydWN0b3JzPyBJdCBzZWVtcyB0aGF0IHJlbW92aW5nIHRoZSBtdGQgZGV2aWNlIG9yIHRoZQ0K
DQpZZXMsIHRoYXQncyBjb3JyZWN04oCUd2UgaGF2ZSBkZWZpbmVkIHRoZW0gaW4gbXRkX3ZpcnRf
Y29uY2F0LmMsIGJ1dA0KSSBtaXNzZWQgZXhwb3J0aW5nIGFuZCBpbnZva2luZyB0aGVtIGZyb20g
TVREIGNvcmUgZHVyaW5nIGNvbmNhdA0KcmVnaXN0cmF0aW9uIGZhaWx1cmUgb3Igd2hlbiBNVEQg
ZGV2aWNlcyBhcmUgcmVtb3ZlZC4gSSdsbCBmaXggdGhpcyBpbiB0aGUNCm5leHQgcmV2aXNpb24u
DQoNClJlZ2FyZHMsDQpBbWl0DQo+IGNvbmNhdCBtb2R1bGUgbWlnaHQgbGVhZCB0byBhbiB1bnN0
YWJsZSBzdGF0ZS4gQ2FuIHlvdSBwbGVhc2UgdGVzdCB0aGVzZSB0d28NCj4gc2l0dWF0aW9ucz8N
Cj4NCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQo=
