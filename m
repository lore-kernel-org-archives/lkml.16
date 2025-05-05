Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0501C481B6;
	Mon,  5 May 2025 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454509; cv=fail; b=I5buDDEsbgVGULjAK4hqDFgOpk6KpDJRci2jlEoQ2iWMbPp1BSFLQGMUOtNsmGu1aXgggCS0qcIdEwZAkvUpxMs7JcXmxnw7cy8ZY+S0YLsmb8m0P6TkeI7K/uRI9DexvkL9RTeonXa9zGYiWBKqgJLxLE+wtZC8ZX2D/jUvwPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454509; c=relaxed/simple;
	bh=bqIdeWHnOdyPTvUF6p51gF+imMo19qBlar6OLS3yFUk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dUd2xxsmVe1IGPZtZcAZ9ZOoFaC5q/FtEQ458Z7YSkI6nAwsvtKAeYRWLht7rY5obbjwE38IBi6SyYcP/7CxaYJE14eXAfSmQEBGBDUsrgu+u0tosfq20/T+AycshmJTNbmp5T6NIWL8cdiGA++q4AF+4/uj9U/vgitvfIMwWMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=Y1L7JxEV; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="Y1L7JxEV"
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545EDXZB006052;
	Mon, 5 May 2025 15:14:47 +0100
Received: from ma0pr01cu012.outbound.protection.outlook.com (mail-southindiaazlp17011028.outbound.protection.outlook.com [40.93.131.28])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 46d8cx9503-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 15:14:47 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLCntmSa03XksdvS5Ar5OQdgqWiyRYWBQQzQ2Aer1zzB+mO2AslDZRIUul1E5O3zdgi1EMAFXnGR7c9V/ZDHjfEigHUaWyCdcxexlKe6TT7uxnJOrrz/P210kc5mgogEhUdmY4MxUbB//XYXQY4vBiOg9xrrLuJ98NUHeI4JDPO2sEcIDtpu8Lw7KTR0SAGzrwKKc2KwnrQpxugnlEMOeXfJxK/DVgxJLN9WIvWE9SQ219ZtHLSp9bEggH9mnMguvm8658ETMPjrZhuNa953OiJiLSXHaUuAtvaGhJ10lyRN7KKmLMsdgLR3ZTpcw6QgXsHRXKxe4iA5hKBtBQWOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqIdeWHnOdyPTvUF6p51gF+imMo19qBlar6OLS3yFUk=;
 b=jHNiGQeWA2MSPAwcGrU7/x/5SqzBDuiv6X3C/HwgYH9iR/qiHAUw7WoEIm2tIpBLqpshU28Bm7J6E9OhV1ff+SdlbW3wYxQ2e4HKl7mNio61KGCkV6zmnqZoq2m/lLuiGesd3uBotH4+jCr52x38aWDUn85O/up7VZhgAVTcjXSTmEipkAH/supK/PkGoWkWEwTCOMIA1EaxznKxq+YIoQ2UF4Cgvrm2qjm3qPiFTVpXWeMBuTNViCgxmp64GUwfDtJ78ud5BoMelWPO0UG3+wtTGrO2nkgYhZzaTnJBtZcJZVrn2WDbL6yiXScsz9cwiEZYb+BzmZdOqzpDnwSdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqIdeWHnOdyPTvUF6p51gF+imMo19qBlar6OLS3yFUk=;
 b=Y1L7JxEVdGKEvzxEMtBy7R7KwqrVtfGsjbcsmTFiHqnQV8059I7coQGttwdReBzAMFb8UMugW8RRxqU6nPXGD8ELXaZEPxPTTf+5bayusHHjKosORA7KizcDM+FXo0AaxlvCQDHis2RPA4fpjfT6PTqWOucUIr072k3KjGiS8QY=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MA0PR01MB9938.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Mon, 5 May
 2025 14:14:37 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%6]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 14:14:37 +0000
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones
	<neil.jones@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        "soc@lists.linux.dev" <soc@lists.linux.dev>
CC: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: arm64: dts: blaize-blzp1600: Enable GPIO support
Thread-Topic: arm64: dts: blaize-blzp1600: Enable GPIO support
Thread-Index: AQHbvcgI2fVkDT9JJ0ex9uUO0AU+XA==
Date: Mon, 5 May 2025 14:14:37 +0000
Message-ID:
 <20250327-kernel-upstreaming-add_gpio_support-v2-3-2c45a1acdc0c@blaize.com>
References:
 <20250327-kernel-upstreaming-add_gpio_support-v2-0-2c45a1acdc0c@blaize.com>
In-Reply-To:
 <20250327-kernel-upstreaming-add_gpio_support-v2-0-2c45a1acdc0c@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MA0PR01MB9938:EE_
x-ms-office365-filtering-correlation-id: 0f817479-12c8-42de-36e4-08dd8bdf2b0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mm9GUng0S3Jkb2RWM3Q2cVppaXc1eFdiejUrZHFhVlhOL1pDdHJQS0xKN0xs?=
 =?utf-8?B?MXMzNC8vcjFQUEFjSUY3UkJQZHhBQWdacTEvYVNCT3FqOTF3dUJQMHUxR1pm?=
 =?utf-8?B?eGxWR0IrWGcxbTUwQnpId0crSG9sQUNOSmkvelpheHljNGlPdFR3RDUrMXZR?=
 =?utf-8?B?cTAyNlZYbkRjRGMwL2xnVmZDM09wSDI2a2hxeVdYekx1aWVHdVI5MXQzL0Ju?=
 =?utf-8?B?dzlLZHFXS0k0ZXl0aUdaSjl1VTRJWm5mYkNzL1JSWVgyNWxwLzREdHBxbFJ6?=
 =?utf-8?B?Rk1PUHBnbm5vcFExY0dBdXJGTFgrTU5RUXlteDdCMHhqdGFOTWhCcVY3MWRl?=
 =?utf-8?B?blppZ0Z3L2E5cTZGeGNxM29hMExuK1dxYTY3UWEvbGprNWlTakQycms2RE4z?=
 =?utf-8?B?VkhlK0hUWnJrNWowMDRRbVpkY1dEMzZRY0ZibnRERHpDVk41VHFqM2JYYXc1?=
 =?utf-8?B?cGlvZGlwMlhoejZRZ2xqZ3BYUGtQVlNScS9BTUQ3YXdVUUNvdTV4dk1BQ3Rr?=
 =?utf-8?B?NDVOVzJ6QWVobzhLVmswUkdxZ3JxTDIyNWZ6aWJoY1puK2NFY3BTWDM5a1B1?=
 =?utf-8?B?U2JzK0dvbmdxSEFjbFJBMWhyY3RPMytBWG5jbFdxQ3NsdzN5QWpHZzNBS3VE?=
 =?utf-8?B?SDN5azMybEdXcjFUYkduN3BST21tMUxYUFZxZHlVNXlISVU2d0tBZFFpb3lm?=
 =?utf-8?B?OHBuclVaOWg4b1BlUlU4VDlrWURNdy9MOVYraVJZNkVNQUxNbGtNM3kyZWZG?=
 =?utf-8?B?bkovNElCb0w0LzdGNERiQ2RncEJLTHhTMm4rSmtGSVR2TDFCeFp5bzVubGFr?=
 =?utf-8?B?VGRBRVpvWXJFRzhObzN5Vy90SVhkTXhhRTJaSG44MEpKVjRmR2tZM25lMWVj?=
 =?utf-8?B?VENsV2JxUFM5Y2xzaUdGRlZqMm1MQU8zZjFEU241Q0ZTbU5tR21ucU5nVjA3?=
 =?utf-8?B?K2VrcVhqZWxLNWZpTUk5cHlaM0pKL0ZyaGZRc3VNYkl3ampWN3JWaEhZOFNu?=
 =?utf-8?B?V3hxZlZpU0lEa2FiNGRTQURIVWcxZ0FGb0dIZHZMRGNRbHdvMlpFbmlGZWp4?=
 =?utf-8?B?Rm1Tb2VVZzdQaGN1bVl5NlRna0wveVRkUUQ1QUpleThIZlhvZmlZNnBIVFYx?=
 =?utf-8?B?M1c0bnlReHpCNUViMjdmNTZMKzhYcHZNcTJhMnBNd2YvZG1aTk0waEtTa3RY?=
 =?utf-8?B?V0VPWnBPaWlaR05SMWo1WXFRZnNoR3NhZ1RHYlNqb3RkTUJuSWdUV1IzN1pk?=
 =?utf-8?B?UVBWSkk2ZUxJamV5L0JhS1VQeGNUb2plbyt5RjJocEowVHF5L3ZyM1RSZUNQ?=
 =?utf-8?B?c1h5aGtiSHdkVjJxVGVMdGlPY3lPbVpUUlZCSEYzWDVqcmV6N3QvTDA0c3d2?=
 =?utf-8?B?NDIyRHd0NkNYUUJqQm1sYUdteDhBRjZ2dGRIQm1SWXNOcjhPRjNnVHhQNEZS?=
 =?utf-8?B?OTR6WHpXTk5CY0FHZ240SzdxWWdKRWcvdmNVVXhIV2MyNE84V2FaenlLUzJK?=
 =?utf-8?B?YUp0eUE1d2lEeXNGMHVEM3VNM3Q5LzdpMEhYcldzNmhoMnRZQzdXQXUraGtW?=
 =?utf-8?B?TXNONjdiY3FhMFRUV0FGTXhQRGJpcTZIQ0tDYzlxSWpKeUhWVm5wYk9BQVZz?=
 =?utf-8?B?UXVtMjJzV1ZGYTNXR3lOSnkxQ1oxRmVuWGMwZFFLYmNZZjF5NmFkQk83WWoy?=
 =?utf-8?B?MUNRbWJCdy9UYm1jYitEcW9SR1l6WDZscFBtZjdvb3RPUjNQckF0NWp4VjFx?=
 =?utf-8?B?YnFCZlF1dlArdStDVVBEUTFPZS9ZR0txMGpVVDAxSitXMHY4Yng1b0djSmJR?=
 =?utf-8?B?QjZFYW8yZUt4QmxBTFNKRjdrN2VaL1BhZEZ6Wk9nZ0Y4UlpGT1QvdmpMQldq?=
 =?utf-8?B?TzNIQzZVRS9Gek9QV3JHMnlFZ21QbDd3N0VDZ3pkK3E0ZjVIVG1XbGZtdUQy?=
 =?utf-8?B?R3cwRm1Wa0doanlWWWd1VFFBV0M2S29mMm5rSHdtM0dUNlk4aDZEaDFISk9o?=
 =?utf-8?B?SkJmUW5mNnBRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWlmbFJZNVNYa1RtVGdzOThnZ0l6aHl1eGVZVG9RMDBJdnFwVmVKbGRZT0d3?=
 =?utf-8?B?TkwzbC9UOEhEKzhZcUpYSmZ4a1FBYmhOWnVlYndQbzJEdWg0aHZESTVCc1cy?=
 =?utf-8?B?TVRiM2hvZ2NZcGVITy9aVUl0dW4yOXpkZjM4Tnd2bkMvbUE5empocExTdSs4?=
 =?utf-8?B?Q09zMTNKcG84UndiOUhydmJCclRYanMveGpFN2xXRndxcmVOZ0x0QmxUQ0RW?=
 =?utf-8?B?Z2dHMStVOUpwUVJpMno4VHk4dVZyTjZFUmVFeEViSWgwNFpLeEVzQ2Y3ZUUx?=
 =?utf-8?B?S3pmTGZscVNJUHdXNWIyaHBiVzJXNmtxeUpUM2FoR2g0M2lJektydHh4dC9S?=
 =?utf-8?B?d2JJa090b084a1VXc2pvN0dmdFR2WVpRV09iR3B4ZG9jQ1VNOU1lVDJmaTl4?=
 =?utf-8?B?M1V0QUZXVlI0d0g5UHVFSUI5dHBLamNXaEkwRG1xd1ByY0NDN3lsSFM3L3hR?=
 =?utf-8?B?NzBJcHVRYVJOYXZJajRkeEZkYTFjZTNHa2R5Ry9TaWF1VEx4LzhaZVFPN0pS?=
 =?utf-8?B?dHN2a0syekYwNFpSdmFWT09WUU1lbTc3V0Q5R09SazcrQk82UmxnQ080bVVI?=
 =?utf-8?B?RS9DVS8yZmtsdjN3UUY5ZDdVWFg4ck01V05qU2wwMHd1bFloUmFneVpSZ3hF?=
 =?utf-8?B?LzNlUk9BQnF1YzhodHlVMWxwN2trbW14VDFXdkpNTURtMXNUZG9wQU9NOHRv?=
 =?utf-8?B?M01VTjlPc0YzR1ozL3NyQzVVSzNtUFJrOFBNN3F5b3h2YXhOcWJCSkR3bHJJ?=
 =?utf-8?B?dkx3dXlrNXFMTzd0Q2RidXFpcGZUUlhjcFVUcStqRkVWUUNuMkZ1RldjcTZP?=
 =?utf-8?B?WUxLUzFnVVM0djZXRTFOS01ydDAyZmtYM1VaUTA2Wll2SUgrclVyYisxL1dO?=
 =?utf-8?B?QXhYb2lCek9yek5adzFWZVhJeVMvakJ5d1lma1dzSXYwcll4TWJuTTdVKzdx?=
 =?utf-8?B?czMyWXZkemQ1WXFBOVpVbWZzd3BCYjJyek1QN29tRkpXQitwQzBzdmY3bWMv?=
 =?utf-8?B?ZnNFRk9FeW9HbFppTk1FVmVoS3IrZkRTZVdLWEtRR2VKTW5zZVhkdEJGVXdJ?=
 =?utf-8?B?YlpqaXdkeU03RXJCckJoV2d6TVEvTkxuejJOd0t0RVQyUHdMZUtZSkdZRzNK?=
 =?utf-8?B?cSsvL0RHbEN4MnVieExWbzVMa2VCS0VyUEJrYjVXMHN0dXVMV3JENFBmcWcx?=
 =?utf-8?B?eGhKZTdtYXZpb1NXZHFyM1JCSjdyQ2tYVlJPaE04KzJYOXZqdFFYYzl0SnN4?=
 =?utf-8?B?YkI1TmFFcUJJSVMzdzN3Z1hnZ0JjOThwTUZROFhSNzhBNERSWldoS3ppOWtW?=
 =?utf-8?B?NzVOejAvVUFEWll0Z2kxeXEzd3dES21TK045ZW8xYWpEU3QrMXQ5blhFRGVr?=
 =?utf-8?B?dHFmaTArUnZrZ2FPK1dzSmFLZVo4ampLQ0tEWnNKTjJqM2o3bks4N0dwTk1V?=
 =?utf-8?B?bWdRc3Uwcm5jU1U5bGVXa1RxcGkzdDhxSHIxQ1lJQ0ErNWFkemlEQlFSWHVq?=
 =?utf-8?B?QjdOakg2aXlNRllhMWFPSXpKdVVwVTdqanBSemNDTmxONmJ2VGtBVzlucDVk?=
 =?utf-8?B?emt3YWdJS3hKNHVHOTFoRkFzYjBKdG9EdUhualFDVDZOQmlmOFU3Y1doNkJO?=
 =?utf-8?B?enpCNXUrLzF4UTdqNGVOaWM1VCtYeUN0M2d5OWtMRXRuUnYyNnhmYmUxSkJX?=
 =?utf-8?B?eVQweTBydUlUWjdBLy9IVFIvOUtmZE16Wk9HMXVrOEdpUUlDUTRzdUxLMXAw?=
 =?utf-8?B?RjVleW14dkdYeHdBV0ZCbDRUdk1VTjVHcGVvbGI1aVIwdUZxbEErWjNRWjFm?=
 =?utf-8?B?ZHJlZi9GbUEzMEQyQTFUdkcrZ2ExeFNPN2d4MXl3MzE3Q0p6Unc1Nmg1N3VM?=
 =?utf-8?B?NlpzQytNVkZ3SjY3RTZJVUljL243aEdueW1vTDlTd3Uwc0VpODdnblY1aVRk?=
 =?utf-8?B?RXgwOXlXT2hGdi94V1dyWnFmcFRQdk9YZmpPOGswUzlBUUVCUzhIZ0Z1dGpq?=
 =?utf-8?B?K2Y0Qy9MSWxta1d6VlYxbEQzR3J6VkM2cnJPaElXbFN4VmtCeGVUVzVWUFJq?=
 =?utf-8?B?cGUyMzdpRzJNUElwR0JEK01UYVJUd3hNajd3Ykt0ckljcUNNNlpwZTRMUlNw?=
 =?utf-8?B?UFduNkErL29LMHQrdTJIMFJzSXVsM0JlUjNpalM4dUQyM1NVSWhBYXBPOFZy?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C13892BBB69B8A478CD05FADF4F9ABB4@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f817479-12c8-42de-36e4-08dd8bdf2b0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 14:14:37.2484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wc3NBARbOHfKXprsr5agKD47yI1RxvfAzHNo8J3cahD61FClyL5Zx+F0BmDMg965nPwtMKM1dh0xFJs/Ju5WUy0bLti0VQ16okjTDHV2+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9938
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNyBTYWx0ZWRfX454RQrmGiwXS h/hWU3Lj6YFCFto/fQCTgC9o4vqBmKgGLbhDE79L14f/LFfJqtQ5Po67dpPspWWfmJhQb5rlu3b TIuS+1p/hwIXDc7hlNHn9ZG0r9VRIROHIKX2/UDlLJfSAcYqgNPpd5JbeunwEGNH75QTLdChxgC
 70p/d51hD+SFlnspcoWHNJuYyXd5SKqgooGwYbKuSf8BKEF3pc2RS8+h9NDnPtSf0cOUJxahwBq nx9T/G0YsSfcGG6T+byAcp6HyaengPY90MNR3yNBs7B5XMci/NkvxNUBsjrNZb5Yxjt0MrH1Cmp yN94UdcoD9albGLJVNPmbn1dK00sUqB++4rwbUTh8qPjfKlqgTgADIteocLSeAAgko6h3fYIQ8L
 vHX3ybPAMCdxzNnWGNVbm3qZTpuZOi4h8GQVnRZNmEbEfqmvLoD2G15/ZDNx1nUjgdccqooy
X-Proofpoint-GUID: RWIl-cQX_ecGgASl7rGJKQ87iDeuUMIG
X-Proofpoint-ORIG-GUID: RWIl-cQX_ecGgASl7rGJKQ87iDeuUMIG
X-Authority-Analysis: v=2.4 cv=PvCTbxM3 c=1 sm=1 tr=0 ts=6818c7d7 cx=c_pps a=g6sBawl8R0naeIbhPH00Eg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=QHqmgu5OOtwHbQ_X0O8A:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Reason: orgsafe

QmxhaXplIEJMWlAxNjAwIHVzZXMgdGhlIGN1c3RvbSBzaWxpY29uIHByb3ZpZGVkIGZyb20NDQpW
ZXJpU2lsaWNvbiB0byBhZGQgR1BJTyBzdXBwb3J0Lg0NClRoaXMgaW50ZXJmYWNlIGlzIHVzZWQg
dG8gY29udHJvbCBzaWduYWxzIG9uIG1hbnkgb3RoZXINDQpwZXJpcGhlcmFscywgc3VjaCBhcyBF
dGhlcm5ldCwgVVNCLCBTRCBhbmQgZU1NQy4NDQoNDQpTaWduZWQtb2ZmLWJ5OiBOaWtvbGFvcyBQ
YXNhbG91a29zIDxuaWtvbGFvcy5wYXNhbG91a29zQGJsYWl6ZS5jb20+DQ0KLS0tDQ0KSSBhbSBy
ZS1zZW5kaW5nIHRoZSBwYXRjaCB0byBpbmNsdWRlIHRoZSBzb2MgbGlzdC4gVGhlIG9yaWdpbmFs
IHBhdGNoc2V0DQ0KaGFzIGFscmVhZHkgYmVlbiBhcHBsaWVkIGJ1dCBub3QgdGhpcyBwYXRjaC4N
DQpBcm5kLCBjb3VsZCB5b3UgcGxlYXNlIGFwcGx5IG9yIGRvIEkgbmVlZCBzb21lb25lIHRvIHJl
dmlldz8NDQotLS0NDQogYXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUvYmxhaXplLWJsenAxNjAw
LWNiMi5kdHMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrDQ0KIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYmxhaXplL2JsYWl6ZS1ibHpwMTYwMC5kdHNpICAgIHwgMTIgKysrKysrKysNDQogMiBmaWxl
cyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspDQ0KDQ0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYmxhaXplL2JsYWl6ZS1ibHpwMTYwMC1jYjIuZHRzIGIvYXJjaC9hcm02NC9ib290
L2R0cy9ibGFpemUvYmxhaXplLWJsenAxNjAwLWNiMi5kdHMNDQppbmRleCA3ZTNjZWYyZWQzNTIy
ZTIwMjQ4N2U3OTliMjAyMWNkNDUzOThlMDA2Li5mYjU0MTVlYjM0N2EwMjhmYzY1MDkwMDI3YTRj
NGZjODljODI4MGY1IDEwMDY0NA0NCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYmxhaXplL2Js
YWl6ZS1ibHpwMTYwMC1jYjIuZHRzDQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUv
YmxhaXplLWJsenAxNjAwLWNiMi5kdHMNDQpAQCAtODEsMyArODEsMzkgQEAgZ3Bpb19leHBhbmRl
cl9tMjogZ3Bpb0A3NSB7DQ0KIAkJCQkgICJVQVJUMV9UT19SU1AiOwkvKiBHUElPXzE1ICovDQ0K
IAl9Ow0NCiB9Ow0NCisNDQorJmdwaW8wIHsNDQorCXN0YXR1cyA9ICJva2F5IjsNDQorCWdwaW8t
bGluZS1uYW1lcyA9ICJQRVJTVF9OIiwJCS8qIEdQSU9fMCAqLw0NCisJCQkgICJMTTk2MDYzX0FM
RVJUX04iLAkvKiBHUElPXzEgKi8NDQorCQkJICAiSU5BMzIyMV9QViIsCQkvKiBHUElPXzIgKi8N
DQorCQkJICAiSU5BMzIyMV9DUklUIiwJLyogR1BJT18zICovDQ0KKwkJCSAgIklOQTMyMjFfV0FS
TiIsCS8qIEdQSU9fNCAqLw0NCisJCQkgICJJTkEzMjIxX1RDIiwJCS8qIEdQSU9fNSAqLw0NCisJ
CQkgICJRU1BJMF9SU1RfTiIsCS8qIEdQSU9fNiAqLw0NCisJCQkgICJMTTk2MDYzX1RDUklUX04i
LAkvKiBHUElPXzcgKi8NDQorCQkJICAiRFNJX1RDSF9JTlQiLAkvKiBHUElPXzggKi8NDQorCQkJ
ICAiRFNJX1JTVCIsCQkvKiBHUElPXzkgKi8NDQorCQkJICAiRFNJX0JMIiwJCS8qIEdQSU9fMTAg
Ki8NDQorCQkJICAiRFNJX0lOVCIsCQkvKiBHUElPXzExICovDQ0KKwkJCSAgIkVUSF9SU1QiLAkJ
LyogR1BJT18xMiAqLw0NCisJCQkgICJDU0kwX1JTVCIsCQkvKiBHUElPXzEzICovDQ0KKwkJCSAg
IkNTSTBfUFdETiIsCQkvKiBHUElPXzE0ICovDQ0KKwkJCSAgIkNTSTFfUlNUIiwJCS8qIEdQSU9f
MTUgKi8NDQorCQkJICAiQ1NJMV9QV0ROIiwJCS8qIEdQSU9fMTYgKi8NDQorCQkJICAiQ1NJMl9S
U1QiLAkJLyogR1BJT18xNyAqLw0NCisJCQkgICJDU0kyX1BXRE4iLAkJLyogR1BJT18xOCAqLw0N
CisJCQkgICJDU0kzX1JTVCIsCQkvKiBHUElPXzE5ICovDQ0KKwkJCSAgIkNTSTNfUFdETiIsCQkv
KiBHUElPXzIwICovDQ0KKwkJCSAgIkFEQUNfUlNUIiwJCS8qIEdQSU9fMjEgKi8NDQorCQkJICAi
U0RfU1dfVkREIiwJCS8qIEdQSU9fMjIgKi8NDQorCQkJICAiU0RfUE9OX1ZERCIsCQkvKiBHUElP
XzIzICovDQ0KKwkJCSAgIkdQSU9fRVhQX0lOVCIsCS8qIEdQSU9fMjQgKi8NDQorCQkJICAiQk9B
UkRfSURfMCIsCQkvKiBHUElPXzI1ICovDQ0KKwkJCSAgIlNESU8xX1NXX1ZERCIsCS8qIEdQSU9f
MjYgKi8NDQorCQkJICAiU0RJTzFfUE9OX1ZERCIsCS8qIEdQSU9fMjcgKi8NDQorCQkJICAiU0RJ
TzJfU1dfVkREIiwJLyogR1BJT18yOCAqLw0NCisJCQkgICJTRElPMl9QT05fVkREIiwJLyogR1BJ
T18yOSAqLw0NCisJCQkgICJCT0FSRF9JRF8xIiwJCS8qIEdQSU9fMzAgKi8NDQorCQkJICAiQk9B
UkRfSURfMiI7CQkvKiBHUElPXzMxICovDQ0KK307DQ0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYmxhaXplL2JsYWl6ZS1ibHpwMTYwMC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9ibGFpemUvYmxhaXplLWJsenAxNjAwLmR0c2kNDQppbmRleCA3ZDM5OWU2YTUzMmY1YjI0Mzg1
ZGQ4MzdiZTk2NWJlNzcxYzdkMjRjLi41YTZjODgyYjJmNTdkNTdkMzA0ODY5ZGVlODc3Yzk5NmNi
YWJiNzEyIDEwMDY0NA0NCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYmxhaXplL2JsYWl6ZS1i
bHpwMTYwMC5kdHNpDQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9ibGFpemUvYmxhaXplLWJs
enAxNjAwLmR0c2kNDQpAQCAtMTIwLDYgKzEyMCwxOCBAQCBnaWM6IGludGVycnVwdC1jb250cm9s
bGVyQDQxMDAwMCB7DQ0KIAkJCQkJCSBJUlFfVFlQRV9MRVZFTF9MT1cpPjsNDQogCQl9Ow0NCiAN
DQorCQlncGlvMDogZ3Bpb0A0YzAwMDAgew0NCisJCQljb21wYXRpYmxlID0gImJsYWl6ZSxibHpw
MTYwMC1ncGlvIjsNDQorCQkJcmVnID0gPDB4NGMwMDAwIDB4MTAwMD47DQ0KKwkJCWdwaW8tY29u
dHJvbGxlcjsNDQorCQkJI2dwaW8tY2VsbHMgPSA8Mj47DQ0KKwkJCW5ncGlvcyA9IDwzMj47DQ0K
KwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0NCisJCQlp
bnRlcnJ1cHQtY29udHJvbGxlcjsNDQorCQkJI2ludGVycnVwdC1jZWxscyA9IDwyPjsNDQorCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsNDQorCQl9Ow0NCisNDQogCQl1YXJ0MDogc2VyaWFsQDRkMDAw
MCB7DQ0KIAkJCWNvbXBhdGlibGUgPSAibnMxNjU1MGEiOw0NCiAJCQlyZWcgPSA8MHg0ZDAwMDAg
MHgxMDAwPjsNDQoNDQotLSANDQoyLjQzLjANDQoNDQo=
