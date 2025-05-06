Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2049.outbound.protection.outlook.com [40.107.102.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAAE214A7F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529177; cv=fail; b=COOE+uFKM5dSb5JxXuO409hKMzwfPaleAtc4EQTE15EkbgRSFcjGoQj/RkxJTigAY7RygwF6NZ/s4ZFcu+hCpc2xWa1IPdtMFgIe3EmFrYggUR06NQEpvekaIcDlpl4qaYYJYIhbafdP+1RDocWRE1A1Xltw3iGBdJ+TMSTUCgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529177; c=relaxed/simple;
	bh=0QnkYgHGzlXwzgeA83Lh9Sj2e3qDJdXsLOUicCYWuK8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L42pOCbw+5QtVp99SwbyFfazxBdm7MfhMo9kqnGBfc2AkzTpTnW14jmMJ3nA+RGoFdYPpNtBJW517gVUWdmuK5MBNM8FXZhWFVHK+6JEAuYA6UhhGPDH4kvAIfwo2Z76ja6kRAEHtYSH0V11T0DWOn7JgITSxCAQhRt4gNw/U6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O70b00f0; arc=fail smtp.client-ip=40.107.102.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O70b00f0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKBuY4NBwnFTO97g2JMUSO+AfkfhRjsei+vGCyJ15FUI/fB2lDZTew2iJw73UurDvwmt7B3Z4YWKfJ/maJK9JYNSBWQfHWGOAJz1FTLgSV6q9Pra09eIdP1WWcIiF2GQ5HRzf1c04V/y6GaLN8QCSDlYO0urKaxQLYs2O7xvREy71xv6Kw95BMaoKI5ZU3Mrajg1YqeZd71xw3NE3uzVnmZdP83JwBocqLyD0mCKIjiVCcc1Ao/xsRAQi5F518P+FM3gY/1F37hDC0s9CG5BlsHvL2foOnL5haK0qGivSFF4dHMH3SMDg+kHOLfuv3IcGkL4QDxetH4jCNx+yN70/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QnkYgHGzlXwzgeA83Lh9Sj2e3qDJdXsLOUicCYWuK8=;
 b=IRrcSWRPIWvwDElPz9zRsZw+HlrOj2JrbzIrjc2U9QjkGGQJNRBTIMRe15I7AmgZ+csHvwvnNMuCngqNAllv+EYEBI4DV9adVR1pCu/4oPTXN9cdWMjlV3JlKxc7nSjRgM45fyiVNi70DNyw+T1hC9V2EX0iLJ4MjNpTRnZ6nqfL3A2jY/0QgCttgT9ykGAVUUIvs5a4lu3l1wJ/2Gm/UgqxTCfrjFhLZeMUF0uCYc4lpPaQZOc7QNNCqZ5leChFO6Nbz+t8Wjg2S2IA2aBNnQUog4WNe3wAUEH/XX4Qot+G61W0Hf6fJXYPVO8wdU9YcB8X0KWLmzyaJDuhdZxDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QnkYgHGzlXwzgeA83Lh9Sj2e3qDJdXsLOUicCYWuK8=;
 b=O70b00f0JLJiPm/hS8P+VWOmQn52a+lfQOjD0r5nKVcfFR/likvWmU2xYPfJdJWi3sSryS93FD0ljqxkvyyr7bQRpPOBNP32eVCwv0fKlAO969ABzdiLuortOvGTvY2JcG3je6vSuFACq4bI4yM7k625iDCw8ThHqhnQvBVEAFQ=
Received: from BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 10:59:29 +0000
Received: from BL1PR12MB5333.namprd12.prod.outlook.com
 ([fe80::d4a:9dd1:afd9:1c70]) by BL1PR12MB5333.namprd12.prod.outlook.com
 ([fe80::d4a:9dd1:afd9:1c70%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 10:59:29 +0000
From: "Agarwal, Nikhil" <nikhil.agarwal@amd.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Gupta, Nipun"
	<Nipun.Gupta@amd.com>, Greg KH <gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 0/5] cdx: Minor cleanups
Thread-Topic: [PATCH v3 0/5] cdx: Minor cleanups
Thread-Index: AQHbuypbMy3CpimwhEKW+6Xfejvbv7PFdM/Q
Date: Tue, 6 May 2025 10:59:29 +0000
Message-ID:
 <BL1PR12MB53333E728D0A5837E453ED629D892@BL1PR12MB5333.namprd12.prod.outlook.com>
References: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
In-Reply-To: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_ActionId=045b8874-d0be-467b-af0e-607c9fbb40b2;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_ContentBits=0;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Enabled=true;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Method=Privileged;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Name=Non-Business_New;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_SetDate=2025-05-06T10:57:08Z;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5333:EE_|MN2PR12MB4334:EE_
x-ms-office365-filtering-correlation-id: 81102975-937f-4b9b-f112-08dd8c8d12d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TTNWUkgycXYyWnZQNk54Z1JpWXRIcTI3VjRxMDZNdzZiNXVmZnAyUmQ4aUlN?=
 =?utf-8?B?ckp5bnRSc3lyUWVodnVkbGdtVFpRN0pUSnZxUTRjcVlyMXBId3NyQVgvbWxJ?=
 =?utf-8?B?eWNuVnh6aUhKREg2YnRNTXdOL09zSzdOKzlreUZnM1drNHpyZ2JRK1NxSEVV?=
 =?utf-8?B?V21Ld0xnOGt1WEVzUGM4ek5BNFNPMjFjVTJPdXlWNWlEbTlwYTZrd24vUGJH?=
 =?utf-8?B?SVlqQWhYRVg4a0JqS2M3Y3RTR2dKVFJsK1VrekFlVVF0Yk4wZVRuN2R1RXRT?=
 =?utf-8?B?NDhRT1duTmg3WHhhK2Nvc1JaL0VnbXN6d1REbXBJclV3SjA2bExOUnBSUytW?=
 =?utf-8?B?NCsrVFZEZGk4TmJ4NXZVVGwyVURIaVk2ZVlXRXZ6eXZYcXkrZ2FwcDJvZklo?=
 =?utf-8?B?UGtZVEt5TlpVTG96cWhjd2dEZldsN2JOMWk0WDN4bHpmU2pDY2VnVER2ancr?=
 =?utf-8?B?aFpDbWZtL1J0UnJlWGl1eUhDay95YURLcjRZQ3N5cTBZZWxkb0Fma2FESGMw?=
 =?utf-8?B?ZGNsU2l5Uk1JVlE3VkRTWC9NbHNSbThTaHhnYy81RHBmOXBuWlBrNEhPSW1W?=
 =?utf-8?B?NytRYjZycUt2SUJxdUVMbjd5ZjJXR3NJZ3kzaDlQSkk3OXBQRTlFanpTRGNk?=
 =?utf-8?B?eVQ0YnNVejNHZXFDelIybGdHUFc5aFdMaXIzWWhIUkVwWG41VmFVK01qQ0JV?=
 =?utf-8?B?TUY3eHZNOTNxZ1VPZGw0SzB6bjBKYmUwQlhmbEhxd2JUdmVSTUw5d29KQUZB?=
 =?utf-8?B?YnJ5UkpSdUZPR0ZuUUVuS1pVWUVlZExJN1AvMkF4WXltVDgySU4wdlBHZlRm?=
 =?utf-8?B?K1VvVUFydVRSZ2lUOG1jQXhWSUZIakcwNEVWd2k5YnJYd29DNGlhRTBzSHVU?=
 =?utf-8?B?Q3dYMXhNdkkzbUZDWHF4ZVZFOXBRMThwSW8vVlhXbzA4c3dFcitSZ2ZnR1hH?=
 =?utf-8?B?ZlhTbUlLMDQ0R09QR1l1aVgzOW1EQyswMFJNanlLV0tMVFJqeU9OcmEreHBs?=
 =?utf-8?B?dWJLd2hjZnAwb2I5R1ZJbDhLcDhwMEpDWjdkOGFIQ2NlRTVTZkdZaWo0R3BX?=
 =?utf-8?B?QTUxVmVzbDNDRm9JV2hqUW1oQXViaVd4RG5waDAyMythOXZBZWNXU0NDSEZL?=
 =?utf-8?B?WW5EWTVrVWREZW4yTFFhSjQ3Yzc4ZWZzVkVTMHlSRFJyS1V2bk9XTEtJSTk5?=
 =?utf-8?B?RElqWFR5Y28yd3VtQXYwSzlGQmZTQzg1aEFzSUEzcktRc2ZTN0ZDN25vaFZz?=
 =?utf-8?B?bkMwc1dFdmpQRGJtSHdmcSt5WFFJRTNTMkF0YXVvWjAwNVdobDY3N0R3TW9i?=
 =?utf-8?B?ZnNlTm9hUjJCMXZPNFVkQmlCYmx3cHJBdVdhOU1LTGRUZmNEWkdmUHJGaUFJ?=
 =?utf-8?B?QzV0RHZabGNEZDNnUnpEbFZYbk9ON2ZmQWRRSVVzRHU5cWtTS3c0TThmUFpM?=
 =?utf-8?B?RnM0TDE4OVkxbEk5ZVdJUEUzdFFramhvMlM1RFNXLzFnUm5MREw4eWZ4WGwz?=
 =?utf-8?B?Smc1WnFneTdjVllOV1FjL01ZL1h0bTZ2N2ZuMC9zLzVtWFdhbk5pSWJTc2ZM?=
 =?utf-8?B?YjBiWFNJbExqVkNEdUFxa2crVEsvZ0xmcWd1Ynh2SUhxNVhrL1VHOWUvZldQ?=
 =?utf-8?B?d3NYT2hDcXErK1I1SDRDME1iZ0ZSZjNhQTZpZEtGeDJHYnNEdHh2bGtWc3pu?=
 =?utf-8?B?aFFuejVGM1hzYWFDTStPdERoc3JQcHVhcEFkWU9iOG1pMlAvTm1pTENTdGlw?=
 =?utf-8?B?dWI5ZjJnVVhmS3lXMFd5N1ZBaHROdmpkZDRZalFRdHBQZWR2U2tSTzd2K0V1?=
 =?utf-8?B?NHpWNkl3cjdCV0pFZHpWZEYrMEI1MUtPLzRqNkJvK0dyaTM2Sk5QRENoMllD?=
 =?utf-8?B?cWg0Tk94MXVVWkxxMWQ5dlBBUk5FNCt1RGJLRCszUDJSVDBIb0FSVkg0eHdy?=
 =?utf-8?B?UTFJdGZXK2pINk9IQkFBeEdLVFN0eHprVnZ6dEloL2daak95KzFuaVlCUk43?=
 =?utf-8?Q?oYtANIvbytVxu5bG/Szs+FbF9SWJYo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5333.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTlSRUx5LzdBbWo4Mks0QTJHVXVVOEgwTmpxNjhkMXJKQmNGOXlGNVlOL2J5?=
 =?utf-8?B?OFozMmhYS1d4ZGIwNzNzUUJYSlF6VmRBTWU4SXJpVzE5QWpscGI5Vy9QR0VF?=
 =?utf-8?B?SFdJZGtpZmRjQWJHQzhpRlVieWFENUJCRVg4cnk1dU9ZWjZqaXVXdWFWOTNB?=
 =?utf-8?B?Mmd2Vmd4RXplN2Vwckdja0x0STYxQUJ4UzVpc3lzZFhQMmQ4MTJGd1lPK2VX?=
 =?utf-8?B?cFR6WGtHeWlnODRYdFVCSUJEWDdjUzBpdk5YYnhjSVpwdjFkS091cVZnQ0JZ?=
 =?utf-8?B?MjV1RHBoWjhpK3hiNmpIRm9Ja0RhQW5CUWZRaEl2YS9rTjJzNytaR2w5Q0lC?=
 =?utf-8?B?VDE4bUZoRk1JVTFTVGZqYytONjFOVUtkYjFRdXMvcXBKQXZYY0ZQYU8yMHI3?=
 =?utf-8?B?a3lVWjJuTGFQZVdXTUVQdUtTVlhRYUE3eTJqemVIZGVGUjhqSUhvZlI5UXQv?=
 =?utf-8?B?c2RXUG9lbmpSYU0yL3JteHc5aHZRdmI3MHpEa1h0VWNRU0hHYktLTzJ2ZmJq?=
 =?utf-8?B?aUZWb3NUaXlGcENZNUNkNlhERVZiQlJhQ2pXakZRak1JQTk2MmFXeDQxSnJK?=
 =?utf-8?B?S1NiU2hwazQ2TlJ4K09nckE0V0JTRC9kRDhZWFU3NkcvM2RTVjN3cFRLVkJJ?=
 =?utf-8?B?aUpOTzFhM0M2b0NWQ0xNeHYvdElwd2JWejhNMDBobG5sZk8yYUFkQXpRT2h1?=
 =?utf-8?B?eTdtaW41bTJsakk3YytDZWNEM05DTEUxcjk2b1Y3bWp1Nm03ZDFPOWRITlV1?=
 =?utf-8?B?ZVdoSU5sSjExK0tjbk5FRmlzWVUwZXYvQkhXZXdzZyt1aTZZcGxlS2R3VUEy?=
 =?utf-8?B?Y3RBWENLYWNueXBhTWZqUGVraFpIblhjSFJhdlFyVS8wM0xQdGVaK0UwMkdk?=
 =?utf-8?B?b2p5SXA3Z3pQZm1wS2xDZGdrTDhMTWU3R3k4STY1SUIyZ0VqRDV5NE1nbnJ1?=
 =?utf-8?B?UHM1a3EyRVE1RUNNS1NnTTlxcHhQcEI0RTRsbW5VVjdMOWlnbFg1TTE4WW43?=
 =?utf-8?B?cEZsNlVmOGhPc2p6Vm81ZjdvQVZ5bkJJcUMxek1tRkJ6ak9yT0MraUU2cENY?=
 =?utf-8?B?VGFqT1pSSkhPSWZIN2grWVdZdlMvcFEvVk1XQ0VLN1l5OGtlQTJYYk5ZR3Jz?=
 =?utf-8?B?dmZLWjl5UlVLdEplOGFDdEZ0ZWJRN0ZkQStSVTk5QnFRclI5ZmxFYnpYUTdz?=
 =?utf-8?B?dzJBenUwTU10cHN0SG5TYzVOYkZjRFpBbzJMS01sMGlnZ3J4QVFWWmlnRzZy?=
 =?utf-8?B?ZStDLzYzOTh3VWU4QU9NQkxTVFpMVGQ1TUVEQ2c4bkQwdnpVeXN3dW5Qcks0?=
 =?utf-8?B?ejkva0cwZkVTcjluc3pIL2lIcjJCLzVlNXY2RCtQV1hLYkp3K3VMbzY1Tmk0?=
 =?utf-8?B?bkkwRTBqZ01jVTRINUhYTTdkQ1ZLL1luYmlHWHZVMW9nbWRjVkcza202cE1z?=
 =?utf-8?B?cjZZSVZNdFh3N01zeEE2YUFtdE5zcmlsRlU2QzRoZlkxUzllaExvOHYxWS9V?=
 =?utf-8?B?aDM2V2E3RG00NHhWMWlCK1NIY0UrejI4MUZVNWIvdE1oN0NSM2ZBb01KUy9F?=
 =?utf-8?B?TWFvRlI4OWw0OWtLY2dvZis1ei83UlVLYjVyUHA1Z1V6azFiR0MvTkZ0cmlt?=
 =?utf-8?B?YWFWYXpLU3MvNXI2UUdrbW1CQnhXczVVVTZvYUIzc0l6VXhXYlVTNER3Z0Qv?=
 =?utf-8?B?bVY3cStKTjV2Yi9qU09LUmppRWZuMXVNYmRUZ0Yrd1FTS1B5SEl4dDBHc3BO?=
 =?utf-8?B?L1pBd3krSmRTMUhwdW45dndHVDVnK2Q3YTlacnB5LzRpV3NHdDFFaG9lb29K?=
 =?utf-8?B?YXNlT0NFRkRoN3RvRXNZL0pmNUhaU2lpQUljNzdUVnpkSDQydE40VzAxc2ZE?=
 =?utf-8?B?eCt0blRBS1BqeHZ1ckpPZytQeTNJTnR6Q1BEWmg1b1lnRHd4VC9VaUhMMW84?=
 =?utf-8?B?Q1dCL1c3N0Y1a1cwR1E3d0Q2MkpQUEl2eWpqUm96aEgxZkFTd2piM2g5WXBN?=
 =?utf-8?B?bUVZcDdOVnlzRVhGRDFJYVdBVE42SkZNU1kzN21xVW1SU3VvcmFETzRqdTIw?=
 =?utf-8?B?OG9seTI1U3Z2azBCdld2emh0TlBsem9SQkhjU2xnWTFiWlk4eUV1bWJsWURD?=
 =?utf-8?Q?3cS4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5333.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81102975-937f-4b9b-f112-08dd8c8d12d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 10:59:29.0819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVbzO8gcx7H225Bdf5g32i6tPm3jlE4zTQ7qZoM9ES+cdTy8W0ZxDQuumAY6Q4WZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIE1h
eSAyLCAyMDI1IDExOjUxIEFNDQo+IFRvOiBHdXB0YSwgTmlwdW4gPE5pcHVuLkd1cHRhQGFtZC5j
b20+OyBBZ2Fyd2FsLCBOaWtoaWwNCj4gPG5pa2hpbC5hZ2Fyd2FsQGFtZC5jb20+DQo+IENjOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5
c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAwLzVdIGNk
eDogTWlub3IgY2xlYW51cHMNCj4gDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gRHJvcCBtYWludGFp
bmVyJ3MgdXBkYXRlLCBvbiBHcmVnJ3MgcmVxdWVzdA0KPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNTA0MzAtY2R4LWNsZWFuLXYyLTAtDQo+IDdkYmZkYTkzNjRh
OUBsaW5hcm8ub3JnDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIFBhdGNoICMxOiBBZGQgSEFT
X0RNQSBkZXBlbmRlbmN5DQo+IC0gUGF0Y2ggIzU6IE5ldyBwYXRjaCwgc3BsaXQgZnJvbSBwcmV2
aW91cw0KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA0MjUt
Y2R4LWNsZWFuLXYxLTAtDQo+IGVhMjAwMmRkNDAwZEBsaW5hcm8ub3JnDQo+IA0KPiBGZXcgc2lt
cGxlIGNsZWFudXBzIGZvciBDRFggZHJpdmVycy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6
eXN6dG9mDQo+IA0KPiAtLS0NCj4gS3J6eXN6dG9mIEtvemxvd3NraSAoNSk6DQo+ICAgICAgIGNk
eDogRW5hYmxlIGNvbXBpbGUgdGVzdGluZw0KPiAgICAgICBjZHg6IGNvbnRyb2xsZXI6IFNpbXBs
aWZ5IHdpdGggZGV2X2Vycl9wcm9iZSgpDQo+ICAgICAgIGNkeDogY29udHJvbGxlcjogRHJvcCB1
c2VsZXNzIHByb2JlIHN1Y2Nlc3MgbWVzc2FnZQ0KPiAgICAgICBjZHg6IGNvbnRyb2xsZXI6IERv
IG5vdCBvcGVuLWNvZGUgbW9kdWxlX3BsYXRmb3JtX2RyaXZlcigpDQo+ICAgICAgIGNkeDogY29u
dHJvbGxlcjogRHJvcCB1bm5lZWRlZCBkcml2ZXIucG0gTlVMTCBhc3NpZ25tZW50DQo+IA0KDQpG
b3Igc2VyaWVzDQpBY2tlZC1ieTogTmlraGlsIEFnYXJ3YWwgPG5pa2hpbC5hZ2Fyd2FsQGFtZC5j
b20+DQo=
