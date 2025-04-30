Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794D61448E3;
	Wed, 30 Apr 2025 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022722; cv=fail; b=MciBGYOgOhEo0I86+oUDrHpva8ZNd02VsXQCKCpXI4QCSLzIW76QgnC2lS9xLwDI/y0zBW9I7uQ+1t81IAAWkQBteOwwid1WIzEXiVDbf3nGymsoF895KVCYi9tOVVln5NJv3gQhgqdxfGZKiFO8Qg0KqnBVXMuhxeaZlVhNR/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022722; c=relaxed/simple;
	bh=0fPyZurbfN2y1JNRENgybjfAiy4w+Q6sDZDJ895076E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cX9ud4QuU1/mZ/DsoZRRm7hr/UFUtIp9zu1ifnAMUPcqwcQb3WgWQzh48yw4gkLI2gla15alxMPYPpLnEaT569yQHPL5g/rTQpH6xzBfOum7MENTQcscrNZuyZhx9ZUjuqg3gXgjeNE+8yyx0pzhK+qkShQOStRGGPSt4MPzexA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IaJZ70qI; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IaJZ70qI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrKlrs77RgTREuGvNQd0VNPJQJqIGKOvW+pKJ8KBPEmC4TFHAAOUBAu+ZWf+r19VNrpRXlgSm7+oH5b2XznXV4O5OrYIzQeXj8dDBo7q1nywV4+rN6g5K0acPQjehfwyY3twWzH4W1TcrIm+H/4bBIvcZMTpSmsfwhxhjA6Cbor0lojUqK4jAZYR0TQYwxpRtStsmP6rHP0HdUZMZhJmnNVQkxzZKGB3dRu1oF6vOLa2yI5lqS1swv30LP/HPEh8Mw7rapbfhT4g3WVRxfYi10IUXwMKwtsZg1iKgWpD5DA18Mbmioid4XgpH8SV1OBfsAVc0NnjQ7uaiT+9JtspBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fPyZurbfN2y1JNRENgybjfAiy4w+Q6sDZDJ895076E=;
 b=MrXNmRPHBpKoYSJDVtLyTek0K5vsnUMH6KCTFcUNZTVwuqWDWy14gj9tKIm07c2FbXcrvYgmZZIoUQ3ouQ1litXyiFpSH/OShRd+Mo2WMass8PYmlw1rRlvZ0rmBCs+EusnVg/bxI/T+pUdSfp/OH6k7qL21zPi1YQXQGDSr1n2KtvQrLaxVgqTDyieQeDqAtFRcS8t2Ris5qzl0RoHRNgmgcVwRCVSMhOY/71qT9b+OW1PZ3FFVYLvM1RelofCKcLgNLpjfWo2vXIkxwU810VwxA5Evkj1IMHgwayHWp2MvOJlderroG8D/791r/NVbTRUZ5PIs19DHvfhEe7JPgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fPyZurbfN2y1JNRENgybjfAiy4w+Q6sDZDJ895076E=;
 b=IaJZ70qIZmkS/AhaoUSegu6TaoLsvlOP9JPDNTVuZsZx771f4i6BLiTdZYdsomzRZhyFocd8aoSAy9q74Vr45dfRJnVaYXl13kOeXF8QPqHQqHKVZ1vwQM/w/DwUoeNAW9OH25faxJnNG9Lh1hEXefMbH6adS9bQNDuU2+jGd7E=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 14:18:34 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%5]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 14:18:34 +0000
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
Subject: RE: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Thread-Topic: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Thread-Index: AQHbd9MxLQsfHKHRn06jkLCPeMCORrN5TCNcgENn4yA=
Date: Wed, 30 Apr 2025 14:18:34 +0000
Message-ID:
 <IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
 <8734fa8hed.fsf@bootlin.com>
In-Reply-To: <8734fa8hed.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=7451d246-e79d-4881-8eb1-c7a461fcb264;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-30T13:14:43Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|SJ2PR12MB9008:EE_
x-ms-office365-filtering-correlation-id: 8b645d84-1ef9-416a-8222-08dd87f1e42b
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TzRRSk9ObzVzVUtjVTdBQzVDVGp1OXliQkZ4UDd3bGFjNVg5a3p0NW1teFow?=
 =?utf-8?B?OGJtUU5zdXNBYWl6ZC8raVRjSTBrWDE4TnE3ZUNhWDNNeGRaZ1JwVjJLWXE2?=
 =?utf-8?B?ZjFqekxCMnpLODRWczd4VEY2Y2hzNm0wMHR3OThjaWN4YzBCK0NpRldVWFJm?=
 =?utf-8?B?d0l1RDBDNThWdjJJZWc1SnlvUTVCQm1vSVVPQXFaR3Zkeml2UUltRWlGSmhn?=
 =?utf-8?B?aDBDYVBlMjl1U1dmYlJlYWZlYWNUNXhHaTJja1JOaGFtYlRDVTRKQ0RIVGJB?=
 =?utf-8?B?eXQweThVZWtUaGFQbEEyZHBKYlNwalk1NlpxR0pLWUtIMkxGVVVzZmMrQ1Ro?=
 =?utf-8?B?QjAxci9zT2w2dENleDhVL0NlTXdrcDZ4NHhyYTZ0SVZvTHp0ai96MXlJS3dW?=
 =?utf-8?B?cXFxYzZpNk9uQzk5bWtKZnRvUDMreU9kZU1mYnAyYVlubVloWTlWcUtCR05U?=
 =?utf-8?B?Yi80QnJJMW9wNW9wYXZpTFdFMzlVNmVkNHdKc296VERpNXRFMm5ENWM3WTVR?=
 =?utf-8?B?WlRreHViYVlWNlVnMzlzYlpSVnF1VzF0RTRBRGtZU1lCblB0WERvTm10N1lD?=
 =?utf-8?B?bUpMM0t2ZENlRFFNVE84Q1R3ZEJmVUZuMDdYWXhzMlg1dUtnTmlOcExWWlZH?=
 =?utf-8?B?SldneFhwZEdOWDAyWUhSeWt6VWJOOERxQ3czdnJ3WTBjcGRia1NIN3dyZUIy?=
 =?utf-8?B?cS9Yb2hIUFoyUmV1RllnUGNSVWJVbkI3UzJlZmsvTkVGeXRoWThjUDl5K0Rz?=
 =?utf-8?B?N05OdkpyM09md2RDb0lDb08yZDBmeS9tVWUwZE5IMXJsc2k4UjZpOUY3dGxG?=
 =?utf-8?B?WTVqUXdDNlpFZjhlWWsrWnVUWmZzMWZKMDVUa050WEpxemlvMmNneUFLZlhj?=
 =?utf-8?B?ZS9Xb2taQ29ZanV2Vkp4d3pJUEZrMUdKbjNQYVdTZWljTC9DK1B2RHQ4Q2Iv?=
 =?utf-8?B?OFl6NzBOdlAxSlZVcnJkSGs4eUZnaWhNQkg3dDg0aXk2RUFueGVNVXhZRlRl?=
 =?utf-8?B?UlRjSjNYd1l2L05xNyt6SGN0RVRTdXdGVFV4OXFmMjNOTXIzTlF0b2VDd0dZ?=
 =?utf-8?B?eGFhVVBEVnp0bUZPdkpGR2wwSWtmOG5UMG1QSEtMbldDNCtIRjZlNlZIWGZQ?=
 =?utf-8?B?SE9jWjhuZHNLeE9Dem4wTS96M1BHQmRKMHRmay9CamVtTzZ5NGFXWVZGbFNY?=
 =?utf-8?B?SVZkOXBmYUtkcTRmYUNkb1lMNittMmNRUk14bk5WYzhiemcvYk03aFZaNDcr?=
 =?utf-8?B?MHQ5ZnBDMlIyQ2x6TXIyVjM4Nmc0aTNxY1Z3Um5kY3VJT205d0YvcmxmdXI4?=
 =?utf-8?B?MVNVQXNNQ293akNGSmFQUGVKNkhYTklvOU1jTW1YdG1zUmpiejNrTm5FSFdr?=
 =?utf-8?B?Z1MyZ2lJRTlPSzhDTlNuTHF6TUpjMW1lVnhkc054aEFxRmc1NHhQYjIxMVRk?=
 =?utf-8?B?RHhIakF2Ty9RbWlkVVJNbWxrQ0tvMyt0MDdxa1JGNEN2aVgwU2RYLzlOUWhO?=
 =?utf-8?B?VE1LS0dFaDhZbGpKTko0VzFLRUZWbEgrYjYwRkYrUUt1WTdib3ZCT0VsSzNl?=
 =?utf-8?B?QTZtVDVOc0w0M0x6UDNxNEthUkFEMUg4c3N2WUZhSUFnVTRVSXJrVXNMMExH?=
 =?utf-8?B?TDR3UEZCS2I3Q2RXUW5vRXZBdHpXTG90Qm5jaXpOajFVaGVCcGluUlpVSjN3?=
 =?utf-8?B?OHJQUjhNaFdIdmRobUVQMlNnWXhnSHhzS2hTMEdxMUF3aVJxTVB6b0g4Yzlt?=
 =?utf-8?B?dzNieFZkY0UzL1hmQ1lLUzdPbGpUYXVFS1dvTCtCTUwrbDN0Z3VCR1doU1Ny?=
 =?utf-8?B?YzhVMy9aV1VOUVNvZG5yTEpvd2EzdnN0MzYyaHM1bno4YkErTCtGRkNla0xN?=
 =?utf-8?B?Z2hsZzJleXNZb1FQMDZvZW52TlN2aTJRMENLS2t3VWIxQkdzRDY3RG53bUt1?=
 =?utf-8?B?ZDAyczBrTmlTMjcrbDhWU0RHZTVrRXd6V2dtSUNNdWt6a25YMkZEWlBGdC9G?=
 =?utf-8?Q?EdzR7rZjuLa/z2FBxdPWe8aQ/kKw8c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXRwRVRxNEp0WkNhelpDZDc2aFMzV1ZPaTl6NGdiZ29yMGw4eGlTTG9Mekx2?=
 =?utf-8?B?VkdmRmlFUm1mOUVqT3lhLzViT1FwQVpWOVFSVzE2Q2dXWW1lMmU3eFVlWnp3?=
 =?utf-8?B?ME5USlJJQXA5OXc4dHVuOGFQVGxhUFpLTGYxYkhlK1NTV1BoQSt1R0VUeTI3?=
 =?utf-8?B?YXFxd3RKTzROOVJyQ0RlRGZ1ZzcxekhFT0VyTnhMbVlnN3dCa2dBcEVxVzVj?=
 =?utf-8?B?Rm9MMWRwZlZIK3FsanVLZ1dkbCtocHp5UnYzUEFaNWhJS1JZcGtjRFhLREhi?=
 =?utf-8?B?SXNvRG5ZVnJLQUowM29IaVdjTC83NCswWmo3M2J3d0p6ci9KZERKanNhWjdB?=
 =?utf-8?B?Wm1pTXpsSlRJV2ZnOGJ2ejRrbllIUWMxN2UzUXhqVU5RNk0rTEVpOTB4eWVX?=
 =?utf-8?B?NUNqb3ZuRUZVWVJydTQrcmc0WWhkUGoxUWFGOTRYWndpaE5TcCtHMFk2ZTZV?=
 =?utf-8?B?TjNQVDNxTXhIN0Foa0p1NURya0FDVm9qc0ZIMmpKdVVlMDhVOFhYaVl2UzU5?=
 =?utf-8?B?ODIvdHh5Ym9YK3dmc0xrc0NyMEpYTnpOeVdSdEdTejZiZ3BBY2JYbHFyV1Ir?=
 =?utf-8?B?WHpScmVkbG93YzYrclNTL0hNeWhIR21zdXhTN25lM2hEaDV4VEl3Uk5xc2I2?=
 =?utf-8?B?d1IxRXJzQTNjUVZVUGhPWUV4VHB2bmNEWW5XOFRaS0xqT1hqWkVUTUJabXQr?=
 =?utf-8?B?T3ZoeUI1N3UvVkRDc2lIcUJ3QVpud1kxUHBFOU1NTW5yQUNidVJqdGZhMUZD?=
 =?utf-8?B?eWR6L1MwYW4zYVROcml1YkRSMFB1RmxmZkJSOWkzQ3dtYmVvMllJUnJmZy9h?=
 =?utf-8?B?dnBjcDNmWS9ENnZsSjBDQ2hvVktwZjdxQUoySHV0bDFDUmtqdTkyRkJwWHlS?=
 =?utf-8?B?bkc5MDdZTHFjT0pZTGN4OEsvVG9RYnU5dGtGY29ZQ09zeHhCTmpvVGYrM2da?=
 =?utf-8?B?anJkWW9PWm5ySUlpYTJ0UVljSVIvMnQyWXZYZEllcUdPVkJkZE4zL3NEc0Mw?=
 =?utf-8?B?M0h5RlkwSUZkb3NLeUdYblpVZDNUcGdNd0F2K1FIUy9ldmlRUWhlTWFXZEww?=
 =?utf-8?B?Mm9iUDNEZ0ZKb1FQdnRJcnh6Ri9STnZQVW0vcjVsdk0rd29hQWp6dHIwVU1w?=
 =?utf-8?B?YUpvNk9wemx0Q2pCbnl3YnEzK0taUytGdDJpOFRhSFh6ZmI3UGhDc3ByYUhp?=
 =?utf-8?B?RHRGNnZaY0ZmbFRFUE5hZ3UvazZvNkl6Mjd2cWZTZXRrWWl2cW50bWo5NHpm?=
 =?utf-8?B?emxwSWZpRktMUVdvWkxuUXF5bkFSZFUyTGZwTmwyRU43bGp1RXEzUmp4eHg4?=
 =?utf-8?B?MGRlb3pnMXV5dFFjRmVweUhvWWswWlRaQWFSVU0yQlhkZ1ZEK2MyeG9iekdG?=
 =?utf-8?B?MDFEbXdiMldxSDBxR2VYK0lsTzZyeHpPR0lTM01FTTN1S2ZabGZKT040bm9G?=
 =?utf-8?B?NXZLQWtNUjQrZmY3NTl2VlRDUXNVQ0NQTUlFL1FlaFFvQkFqcUR4UEVzSnlE?=
 =?utf-8?B?YjFWV2VuOFpXTkFpTHkvVTNOTzBSZm92dHZuUUc2dnBWN29aRU5lUWtyaEUx?=
 =?utf-8?B?a0Z3Y1pTQWFOQWNJa3ZVZGxhTTZaQ3hnYjFQTlZmSE1kVGhKQXU0UExvRW92?=
 =?utf-8?B?OFJkWDh5SzVLdDBCdW4yRm5NWVFUa1pxdXQ3MTB3MFJyLzBja1B1bHJScFlj?=
 =?utf-8?B?SENadDVsa0c2RG5seHltOWRSNENEeFJFNVd2M0xwUkZmRFJGM1IycmU4UU84?=
 =?utf-8?B?K0FEYTk0SGl6QnhJV0YyZndIVmRySStRbXJTU21kblcxS2VaYUZpdWx1NkI0?=
 =?utf-8?B?elZFZTM5WldqRytkbEc2Y0N5WUtXdkZCdlkwZEhwdHFxTGo2enRvNlBUTXMy?=
 =?utf-8?B?cnZCQjNhN1JTa0E5ZFRqK0V3cTZZL3Y1R2owV3FxU0h5UGZQQVJqOWlOWG9O?=
 =?utf-8?B?T0JGeWlSbzU5SnFQdTdSa1ZiTXlsanY0ZHRPK0dhU25hTXlCZjI4SzhxYzBQ?=
 =?utf-8?B?Y05RZWVxSk5OSGpNSEpUU1JwQWRWckpPWEd2T0tBSEJWZTRka29kVjZCM0Rw?=
 =?utf-8?B?WkEvRGc1WkFNYTlNYXBZMHVDRWhaT29SbmFNR0VxL2J2V05EQjV4dFdOQk41?=
 =?utf-8?Q?5CKM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b645d84-1ef9-416a-8222-08dd87f1e42b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 14:18:34.0978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkrdfjCM1IQgX4Zz95CvmekVRrG3HCEaGXZMkEdGrCk+N+EJQxPU1qGmNDhlfjoPYM8gm935EHg7Qt5hgaExFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9008

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGVsbG8gTWlxdWVsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIE1hcmNoIDE4LCAyMDI1IDk6MjMgUE0NCj4gVG86IE1haGFwYXRyYSwgQW1pdCBLdW1hciA8
YW1pdC5rdW1hci1tYWhhcGF0cmFAYW1kLmNvbT4NCj4gQ2M6IHJpY2hhcmRAbm9kLmF0OyB2aWdu
ZXNockB0aS5jb207IHJvYmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0KPiBjb25v
citkdEBrZXJuZWwub3JnOyBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGdpdCAo
QU1ELVhpbGlueCkgPGdpdEBhbWQuY29tPjsNCj4gYW1pdHJrY2lhbjIwMDJAZ21haWwuY29tOyBC
ZXJuaGFyZCBGcmF1ZW5kaWVuc3QgPGtlcm5lbEBub3NwYW0ub2JlbGlrcy5kZT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MTIgMy8zXSBtdGQ6IEFkZCBkcml2ZXIgZm9yIGNvbmNhdGVuYXRpbmcg
ZGV2aWNlcw0KPg0KPiBPbiAwNS8wMi8yMDI1IGF0IDE5OjA3OjMwICswNTMwLCBBbWl0IEt1bWFy
IE1haGFwYXRyYSA8YW1pdC5rdW1hci0NCj4gbWFoYXBhdHJhQGFtZC5jb20+IHdyb3RlOg0KPg0K
Pg0KLi4uDQoNCj4gPiArc3RhdGljIGludCBfX2luaXQgbXRkX3ZpcnRfY29uY2F0X2NyZWF0ZV9q
b2luKHZvaWQpIHsNCj4gPiArICAgc3RydWN0IG10ZF92aXJ0X2NvbmNhdF9ub2RlICppdGVtOw0K
PiA+ICsgICBzdHJ1Y3QgbXRkX2NvbmNhdCAqY29uY2F0Ow0KPiA+ICsgICBzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZDsNCj4gPiArICAgc3NpemVfdCBuYW1lX3N6Ow0KPiA+ICsgICBjaGFyICpuYW1lOw0K
PiA+ICsgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgbGlzdF9mb3JfZWFjaF9lbnRyeShpdGVt
LCAmY29uY2F0X25vZGVfbGlzdCwgaGVhZCkgew0KPiA+ICsgICAgICAgICAgIGNvbmNhdCA9IGl0
ZW0tPmNvbmNhdDsNCj4gPiArICAgICAgICAgICBtdGQgPSAmY29uY2F0LT5tdGQ7DQo+ID4gKyAg
ICAgICAgICAgLyogQ3JlYXRlIHRoZSB2aXJ0dWFsIGRldmljZSAqLw0KPiA+ICsgICAgICAgICAg
IG5hbWVfc3ogPSBzbnByaW50ZihOVUxMLCAwLCAiJXMtJXMlcy1jb25jYXQiLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25jYXQtPnN1YmRldlswXS0+bmFtZSwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uY2F0LT5zdWJkZXZbMV0tPm5hbWUsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmNhdC0+bnVtX3N1YmRldiA+IE1J
Tl9ERVZfUEVSX0NPTkNBVA0KPiA/DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICItKyIgOiAiIik7DQo+ID4gKyAgICAgICAgICAgbmFtZSA9IGttYWxsb2MobmFtZV9zeiArIDEs
IEdGUF9LRVJORUwpOw0KPiA+ICsgICAgICAgICAgIGlmICghbmFtZSkgew0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgbXRkX3ZpcnRfY29uY2F0X3B1dF9tdGRfZGV2aWNlcyhjb25jYXQpOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKyAgICAgICAgICAgfQ0K
PiA+ICsNCj4gPiArICAgICAgICAgICBzcHJpbnRmKG5hbWUsICIlcy0lcyVzLWNvbmNhdCIsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICBjb25jYXQtPnN1YmRldlswXS0+bmFtZSwNCj4gPiArICAg
ICAgICAgICAgICAgICAgIGNvbmNhdC0+c3ViZGV2WzFdLT5uYW1lLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgY29uY2F0LT5udW1fc3ViZGV2ID4gTUlOX0RFVl9QRVJfQ09OQ0FUID8NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICItKyIgOiAiIik7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgIG10
ZCA9IG10ZF9jb25jYXRfY3JlYXRlKGNvbmNhdC0+c3ViZGV2LCBjb25jYXQtPm51bV9zdWJkZXYs
DQo+IG5hbWUpOw0KPiA+ICsgICAgICAgICAgIGlmICghbXRkKSB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICBrZnJlZShuYW1lKTsNCj4gPiArICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5Y
SU87DQo+ID4gKyAgICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICAgICAvKiBBcmJpdHJh
cnkgc2V0IHRoZSBmaXJzdCBkZXZpY2UgYXMgcGFyZW50ICovDQo+DQo+IEhlcmUgd2UgbWF5IGZh
Y2UgcnVudGltZSBQTSBpc3N1ZXMuIEF0IHNvbWUgcG9pbnQgdGhlIGRldmljZSBtb2RlbCBleHBl
Y3RzIGENCj4gc2luZ2xlIHBhcmVudCBwZXIgc3RydWN0IGRldmljZSwgYnV0IGhlcmUgd2UgaGF2
ZSB0d28uIEkgZG8gbm90IGhhdmUgYW55IGhpbnRzIGF0IHRoZQ0KPiBtb21lbnQgb24gaG93IHdl
IGNvdWxkIHNvbHZlIHRoYXQuDQo+DQo+ID4gKyAgICAgICAgICAgbXRkLT5kZXYucGFyZW50ID0g
Y29uY2F0LT5zdWJkZXZbMF0tPmRldi5wYXJlbnQ7DQo+ID4gKyAgICAgICAgICAgbXRkLT5kZXYg
PSBjb25jYXQtPnN1YmRldlswXS0+ZGV2Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAvKiBSZWdp
c3RlciB0aGUgcGxhdGZvcm0gZGV2aWNlICovDQo+ID4gKyAgICAgICAgICAgcmV0ID0gbXRkX2Rl
dmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDApOw0KPiA+ICsgICAgICAgICAgIGlmIChyZXQpDQo+
ID4gKyAgICAgICAgICAgICAgICAgICBnb3RvIGRlc3Ryb3lfY29uY2F0Ow0KPiA+ICsgICB9DQo+
ID4gKw0KPiA+ICsgICByZXR1cm4gMDsNCj4gPiArDQo+ID4gK2Rlc3Ryb3lfY29uY2F0Og0KPiA+
ICsgICBtdGRfY29uY2F0X2Rlc3Ryb3kobXRkKTsNCj4gPiArDQo+ID4gKyAgIHJldHVybiByZXQ7
DQo+ID4gK30NCj4gPiArDQo+ID4gK2xhdGVfaW5pdGNhbGwobXRkX3ZpcnRfY29uY2F0X2NyZWF0
ZV9qb2luKTsNCj4NCj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9lcyBub3Qgc3VwcG9y
dCBwcm9iZSBkZWZlcnJhbHMsIEkgYmVsaWV2ZSBpdCBzaG91bGQgYmUNCj4gaGFuZGxlZC4NCg0K
SSBzZWUgdGhhdCB0aGUgcGFyc2VfbXRkX3BhcnRpdGlvbnMoKSBBUEkgY2FuIHJldHVybiAtRVBS
T0JFX0RFRkVSIGR1cmluZw0KTVREIGRldmljZSByZWdpc3RyYXRpb24sIGJ1dCB0aGlzIGJlaGF2
aW9yIGlzIHNwZWNpZmljIHRvIHRoZQ0KcGFyc2VfcWNvbXNtZW1fcGFydCBwYXJzZXIuIE5vbmUg
b2YgdGhlIG90aGVyIHBhcnNlcnMgYXBwZWFyIHRvIHN1cHBvcnQNCnByb2JlIGRlZmVycmFsLiBB
cyBkaXNjdXNzZWQgaW4gUkZDIFsxXSwgdGhlIHZpcnR1YWwgY29uY2F0IGZlYXR1cmUgaXMNCnB1
cmVseSBhIGZpeGVkLXBhcnRpdGlvbiBjYXBhYmlsaXR5LCBhbmQgYmFzZWQgb24gbXkgdW5kZXJz
dGFuZGluZywgdGhlDQpmaXhlZC1wYXJ0aXRpb24gcGFyc2VyIGRvZXMgbm90IHN1cHBvcnQgcHJv
YmUgZGVmZXJyYWwuDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IGNhbiB0aGluayBvZiBhbnkg
b3RoZXIgcHJvYmUgZGVmZXJyYWwgc2NlbmFyaW9zDQp0aGF0IG1pZ2h0IGltcGFjdCB0aGUgdmly
dHVhbCBjb25jYXQgZHJpdmVyLg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzg3
c2VybXhtZTEuZnNmQGJvb3RsaW4uY29tLw0KDQpSZWdhcmRzLA0KQW1pdA0KLi4uDQo+ID4gKw0K
PiA+ICAgICAvKiBQcmVmZXIgcGFyc2VkIHBhcnRpdGlvbnMgb3ZlciBkcml2ZXItcHJvdmlkZWQg
ZmFsbGJhY2sgKi8NCj4gPiAgICAgcmV0ID0gcGFyc2VfbXRkX3BhcnRpdGlvbnMobXRkLCB0eXBl
cywgcGFyc2VyX2RhdGEpOw0KPiA+ICAgICBpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpDQo+DQo+
IFRoYW5rcywNCj4gTWlxdcOobA0K
