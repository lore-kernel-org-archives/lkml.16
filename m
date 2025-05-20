Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com [68.232.156.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46125C83E;
	Tue, 20 May 2025 06:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.156.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722501; cv=fail; b=mPKMznKM7KCMX3IGmnwYaP5wemT1DWBvVLriW/7Ocd//rdmiiQL4D0Xi6SScnYq+ihzI0+CMzq0xKgmxp7cyTueyAkA1qz+IqCpBws6Pw2sCrH5vAfFY3ICnNExoCVhR5ke2jsjkF+oZC+mjiUhHvjizvXAc2hZxA2kKyCfORvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722501; c=relaxed/simple;
	bh=L55i6eEbQEpVR/wQI8+JqKaR7VR6ba6YT4TIz1/Hp0c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P7JzNe6Y3PbHJT0XNIQxpahUkJIFc2P0jrANFeQ6HLl0WLFsBKC4RvvzsHk6WTeTbfElaxN+qFl/NrlgZSKVXqtOMfRL1BGqeF77M0PZN262UOjMRFKDF6wHqL+QaC+eOXcvGSHQqB+IKkojVg5PykDOO5aFqSKM2bdTfssJv6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=In0O0l+L; arc=fail smtp.client-ip=68.232.156.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="In0O0l+L"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1747722500; x=1779258500;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L55i6eEbQEpVR/wQI8+JqKaR7VR6ba6YT4TIz1/Hp0c=;
  b=In0O0l+L5D5jvj1h1dEgiyVuvgDfEFkngn2eVkUkMlxX+LDpcI8Q03fG
   jlr3b6WTD7eY76Qu4nho6s3F0sNKtZTGNO2tF+Nvtyv3tMJ1NW0CgSRPq
   vha509Ez1MZOIBbWLfmUb6jRbM2cn1x1VylydN3VlKzBw6rZaSjDGD6rn
   hvfqDnJSFBnOQEIynHbWi1yw5+MrgF5UAZ10bnloKH2aYnWlhmBbbRcrD
   zAn0lh3YoRqRcCEPtDNhUbDmJj3W3EpX9RvplPuogodc8W37UPVApzfRD
   9Yq/Iv4DnezWh764sf0U4QW7XPInrsHw6QeUM8O1YF71tH3h32lAaIytq
   g==;
X-CSE-ConnectionGUID: 9EIM9EijR3q4AYCO3kRSCg==
X-CSE-MsgGUID: HzOIX/miQfaNGa5VNaaSyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="155514384"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="155514384"
Received: from mail-japaneastazlp17011024.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.24])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:27:06 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2ghWkTRGTq8bJXlpIgDa6CMQmm4EqLdrRf0PNtdGYF/t15tBR9naDUZfm5lPbvVm1bmQSwv1I33ik8QOqnhVQrOM7XWQZbyyjl4wxzxPhFZKUZXrgRL4J4AKuCprLa0jEhaGRdR40SFMJyBjo2BGFIrxk+pFll8E/jznZ+T9jx0GxAsTWmxFJ/Enh09xCiW/kvgZRt+8t2nvEx4OB3tz97ay5+OewqPLPCkQLV9GPJgOpHgSGDJkRHreUSxnJrrtj7YUcpphdveJHI98/BCuMNHuhD8lcHGXPQEYnG0um6uXFvVmBmlfxYhhETDdANTaR4JFUwjKXYR3Xci/lqgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L55i6eEbQEpVR/wQI8+JqKaR7VR6ba6YT4TIz1/Hp0c=;
 b=vi2WC7IHhTE7/v+uW4QR0l6su7JIu4V+fe2fYn8yfmkoxSwlTT03fPZnaD/hkD3SNa0QCa4+e+suEPi3oCO9q0Fp0lySqZ/9u24xAb/TqcmN2zw+mbVw/2Pnxt2QSUx/xFpQgjEej2wv/aXchEeyc6OPCqqM1ayDChQZy9JRpDRxXrxfAlgO5MaPC/NGdGzf2Q4Q+bX7JsQqCdefwVo2LGMK/UJN3mP8OBXV1IdPTXpVj8DiErSpQio/yvj+qKV9E0FWvXV5Yk8lQgSA0w/x+Lh0ENzmBjaiGiByqkhxki+DJBhB8yEaX+fxeC+prsKDoi5gqWun8tysx1TZ10IOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9382.jpnprd01.prod.outlook.com (2603:1096:604:1ce::6)
 by TYYPR01MB15150.jpnprd01.prod.outlook.com (2603:1096:405:1a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 06:27:02 +0000
Received: from OS3PR01MB9382.jpnprd01.prod.outlook.com
 ([fe80::948a:2ed9:c684:905a]) by OS3PR01MB9382.jpnprd01.prod.outlook.com
 ([fe80::948a:2ed9:c684:905a%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 06:27:01 +0000
From: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>
To: 'Guenter Roeck' <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>
Subject: RE: [PATCH] doc: hwmon: acpi_power_meter: Add information about
 enabling the power capping feature.
Thread-Topic: [PATCH] doc: hwmon: acpi_power_meter: Add information about
 enabling the power capping feature.
Thread-Index: AQHbyI+Sus8zrfmpRUiAL/7jGhowP7PZ74aAgADhu0CAAAYHAIAANhUg
Date: Tue, 20 May 2025 06:27:01 +0000
Message-ID:
 <OS3PR01MB93828403F03E555B7EA9FFD3D99FA@OS3PR01MB9382.jpnprd01.prod.outlook.com>
References: <20250519072756.1512244-1-fj5851bi@fujitsu.com>
 <a82015f1-0a19-451e-9087-060a1d2c6c4d@roeck-us.net>
 <OS3PR01MB938276CD2B8841B7E76C8B8FD99FA@OS3PR01MB9382.jpnprd01.prod.outlook.com>
 <1079afa6-72cc-49df-9158-70428fd6918f@roeck-us.net>
In-Reply-To: <1079afa6-72cc-49df-9158-70428fd6918f@roeck-us.net>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MWI4NGEzOGQtMTVjNC00ODY5LWJjNGEtYzEzOGRkNjIx?=
 =?utf-8?B?YzFmO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjUtMDUtMjBUMDY6MjA6MTJaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9382:EE_|TYYPR01MB15150:EE_
x-ms-office365-filtering-correlation-id: fccf5d45-1104-4a71-ea1b-08dd976754c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|1580799027|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q3g2VnpZK25ueG93Q1VuREl2NU5kUXJBd29uQzdHU2FaQllCKzFrZlc4U0JE?=
 =?utf-8?B?L0U2alBGSDRFSDBtb0FxTW9ZV2ZQY1phYWNTYXpUSGVmUGE1cjFWR3hJSEEv?=
 =?utf-8?B?MHo0RUFCSjVucGgva1hlWmw3TUFWWmt2RGl3NHF1MHZPZVR5VE01ckZ2VVcr?=
 =?utf-8?B?eDh3bDBZOGZyRXhia2VRMENYa280bHQ0eGpYWTFEZ3dMeWtVMnpsV2h2WjF6?=
 =?utf-8?B?alZhR1B1azUxT3M0Mll6SThnaHZwZkpUbnlHaFQrVjNhUk9MUnhoTlEvTTVM?=
 =?utf-8?B?WkVJTmlUVmJFV1hjelJLYzV1U2lTdGdMZ1h5RDFmMjRiWmxzY0pqK3phMUNn?=
 =?utf-8?B?TS9aOGxlMkVJRWlOc1BMaUpKNkZsNnlMVTBnbkovajN6b1ZpcFlvSk9jUTV0?=
 =?utf-8?B?R042VzNlSlVJYVFha253SzZWRmJ3N0p4TE5OZWs0cUdDT3piYVNydnpqeFNO?=
 =?utf-8?B?TnFBajk1TE5TMlBJWDlJNnE0MytycXNFTjlCVmJ1K3dnUFE2aTd4MHRLcVlF?=
 =?utf-8?B?Qm9TellHSWt3aTNBZnl6cW5XZTJBV0tVUmhGMS9QSWNSZmtzbkNZY0pWTXY0?=
 =?utf-8?B?N2xweTg3ZWNKa0g5cURBYng1SzBuekE1WHpDclJTQ01TUEt5akw5M0sxNE5t?=
 =?utf-8?B?QVFkdTBWNGxPcDEzcEVSYjltS1poQ01FTkpGUXFYNmNHRjlHY2tTaStORlZj?=
 =?utf-8?B?dzlnMWhxeTArMFgrS2Q3OUhQWEpqUFhLdE5yZm9BT2M0WXY5WWFuek9POHR2?=
 =?utf-8?B?a3B2ZFcxN1J5dVJVTFp6Nys4KzdVZmFkaVc2d1o5cW4rNlNNNjl4alJwL3BL?=
 =?utf-8?B?TnpVOWtmVjJZRGc3a2xsY3FublhRWXNJQzVSWTNTcnNHRGpOU0VkVG1wb0pV?=
 =?utf-8?B?RmhqM1MrdTdTSWdWdmdxbVBGOXFYY2d4WHJtNlJmbGovQVFSSkZoc25UREpp?=
 =?utf-8?B?UkxVbG5WcUJ1eTk1MGh6ZWJCWmJNMzlUSm9oRVd1eFczcERITEMramw0c2pO?=
 =?utf-8?B?bisvb0g4c0dRdDNzUlVBb3dIVTQrdTBjZ0NPUm55cS90VndENHlmajNnYVZr?=
 =?utf-8?B?Vk9OWmhnQTAvTjFxWmhVMlhiNzZTL1VETHgxa1ErWlFiQ1JDbkdaNXRrRFNX?=
 =?utf-8?B?UFdWMDV6MU1xMkFxSVc2amhrSkNINkdRVS96bFhoS2NFUTN4Y1Z1ekFscllp?=
 =?utf-8?B?WHQyVXJ0UVl3aVNPSENWZm5oWjRIOExCckdtTTFlUTJwQ2hkL0F6Z1NGWEZL?=
 =?utf-8?B?eElCcVc0RHZqSTYyamkrV2ZSam5HL09Rd2czS2kvMkJDNGJBL2JpRDBRMDQx?=
 =?utf-8?B?YXVNWXdEUkZmUGVyRWFndUZFWlZSK05pby9Cd0Ywc2tsUC9JV3VNR3R6UGlt?=
 =?utf-8?B?RDlIOVdEYlRJd08vSFl0UXg1M3BxTkZpdnBNTFdIQUUzTHJBY3V1aU94dnRE?=
 =?utf-8?B?OW56MFVja2VvS0pKVHluK3NrcHp6U3JVdTRzVm9pd0NlMEcxbXg3Q1U1NG5G?=
 =?utf-8?B?a2dzRWlDdTNOR1hWbmJEai92ZnFuTGpBK3hPYm4zbzlZdHRDcTROVE42ZWpx?=
 =?utf-8?B?T01BRFYvSzFHa0xJc05tcGQxak5VblZETnJxbnZjK1FuZXU2Q1UwSTUzT0NF?=
 =?utf-8?B?TjFteEppK3N0WGtxRkpVUmwwVm14NVRWR0tncjZoRUppNjg3aU9tZmlqUlNo?=
 =?utf-8?B?R2pPeXNpKys1WHhzencxeEo5K01GNnJ3aEhjUmRyQWlIZWZaRU9OSjlEYzhk?=
 =?utf-8?B?cU9DcWM1MlJ3bEFxcVcxVXdsakJBaEVQL0xEZEF5TFRmbGpVMlo3YXBzTnV6?=
 =?utf-8?B?NytKbmRWU0hTako3ZXoyMDBqNEdTVEpJenA4VnZObExDVHBkTlZYWnA3RjhZ?=
 =?utf-8?B?ZjNrUFYvdjFCWklOakVzQmFHMEdqQzV4ekR3YXJFZXlxZnhvZzN0eCtWakRF?=
 =?utf-8?B?QTJMRExabEhGYmVESng3TUhXbmk2WDdEdDh5dUNkZExsWWJPVk95TVBWaDFw?=
 =?utf-8?B?WXFRUWdHUThDSUJ6eG9wUGtKSGpIKzM5QVR3L1RwanBFRWUrenRvZ3dUVzNU?=
 =?utf-8?Q?2G1Rum?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9382.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUJNcncra2pCVlJtdEN2ZWFtSTNnekwyWGdqWWcrTFF2Qm1vTlpwUzdPMXpI?=
 =?utf-8?B?SmFwN0NqdzY2d3ozZTRPUFhyT1ArZTBiMTVxejZjV2lhZjQ0UXlYTjU5VkQ3?=
 =?utf-8?B?SWRGNU5JcElhd1ZpOE5vMVgwR01tNXdBckFkOGpzamZSQ3gwcENPUmhWb1Fk?=
 =?utf-8?B?TVpQWkVuWmRLNjVCRjFlNFVMNmFkRjhyUzdRRHMyMGFoeHhWMXdSQWNmbExj?=
 =?utf-8?B?V25USDNaL0RpYWhDaStWVEhkTHZhbmdFc29mdlpuMEthejliNEtqcTcvamE3?=
 =?utf-8?B?QXl6TkJ5TzBNM1RqNDdkQUM4dnFIN0ZXQ1A2RjJjc0hKamNGK3dBbW95L1FS?=
 =?utf-8?B?UWdxbU1CRVJReEI2emZoTFYvVnUzTHQwaGhvZXRURldJNWhFTDBPZWNwcXZK?=
 =?utf-8?B?KzI2SjNuNm5FWDVpbnVtSnFhVDNKbS9LclFkTFFWeHFsY01MdmlRQWE2ZzlH?=
 =?utf-8?B?ajIxMmZRMzVMZW9DVnlOZzlWVXg4TUpYRHZoTDBvR1ZFTnJQZnY1dzNlNGpV?=
 =?utf-8?B?UFFGSi9ORkY2dGFReVhkWXNBREYzYituZGpFWUpiRUFkMTdwMWxFSWU4czJn?=
 =?utf-8?B?OVZlTmM1d2tPYmpzL2FnSlZ4S1c0bXYyNzR5bU5FSDlQTmpzMTNiemlCM3Br?=
 =?utf-8?B?VnNWVXJHdVlzSEJva1JGdTA3cFcxZy9XZDNUQjdvVERvNnV3UnZjV0VhVS9o?=
 =?utf-8?B?dk5oYk00VmNGdEljUWRWdmF0NnM4cW9Gb0xZb0hqcEtSUFZSYmw3ZUV5RUx6?=
 =?utf-8?B?eDJwSGJtSGlLVDY4c2pFRW1xUUdmWC9keEwybkJmd1V0UzRCMEFYT2lRM2s1?=
 =?utf-8?B?czRNb2x2eXErbmFZWlJzTHUwa1J0NGh5QlRaa0FjTnErQkU4WExzT2M4SUpo?=
 =?utf-8?B?SzJTTy9NVG9xU3Q4dmNPcXdJb2laZ2Z6bVdCa2RHb0xjaURrZWNBd3gvalZX?=
 =?utf-8?B?c295WWpscXdFNjVXNEs3Mjh3WkVwUCtRWDRDWHE2MW5rSkhiQ2tuNjlhOGJv?=
 =?utf-8?B?RENoTUVaODVRMnA4eXViUnhsRlNNcVZKQ1YyY3FPYmJWZzhVaythUFNMVVBV?=
 =?utf-8?B?MXdkY1FZUFhqY1I0bE8xRFVlOWYwT2dUQjk4dElrZm8xZmwyYjdYdHFZa21W?=
 =?utf-8?B?bHpoTWVudDdRSmxhTGg2Q0Q5WHZEcGJNS1JVMDdwZHdZUnVxMU9WN3c0dXlD?=
 =?utf-8?B?L1A5MWFIOFc4VUI4WjJ4a3hwYXYvaWVTNXB0VWtlNWFkbFAwZklzbHR5WmJP?=
 =?utf-8?B?RjR1a3JsVVE3V2NDN3hsUElBZ0I1Z0RNVER5Y2ZyVjNqaDlVVHBCTXduN3Nj?=
 =?utf-8?B?Y2RQTzlISzk5emROQkdGNHF3WmhwUDNoc0FIenRTR3U0dGUxVS8reHY0azRL?=
 =?utf-8?B?d2RFMEEwUDZiemloaVNjUG0vdDJqSTVlaHc3UlF6Qmd1Yk1LbzYvUCtmT01r?=
 =?utf-8?B?ZFV2Z3dBcjY1MDcvbnVtQmVnY0V1RHNDbXVFSmR1QndQSjhPMXJ6cThwRWh1?=
 =?utf-8?B?YS9EbDY5RUxPeS9JNndETVM1VkNWTGNxNzdpSG9ObjFMMlJlV1l1dW9ZYnJh?=
 =?utf-8?B?czd0RmJQTFQ5MGxFU2tSMFpxMTczeWNFUGtuVFgyZHZhRDdUTzdtOXdHZXpu?=
 =?utf-8?B?V1Qxd1BNdHB2d3BhWlhKaUVXcW9abUE2WldTOEpkSGVjOTRSQUxucDVEYTNF?=
 =?utf-8?B?aHd6c3ZseWg1aFZOemtYN01FVmEwRWhKWE1VK0VqTDJuUkVRQjNMNnh2dFQr?=
 =?utf-8?B?cWZFblhsQWl2MmpsTXRGMG9kS3BPVG9GaG11Z1NkYjFVVzdsNjhuYWRScCtk?=
 =?utf-8?B?ckxiVElETm5RQndRQ1F4aUMzRTlvWXBnMlRqNUlvbWhkeldORkhTeW11N29w?=
 =?utf-8?B?UjFnV0NVMEtrRS9TSUVMMzB6akRiZjR6K203Q1Z0ekdoank5YWN0bnZnVC9J?=
 =?utf-8?B?a0dXdG9OOG13c1B0R3NGTUpYZGo1UkpHeWp6bWU2Mk9NWnJmWUNyOVdaelNs?=
 =?utf-8?B?Vk5vbUtWbXFKek1qVUowaEhOQ2U0V084Z1haRkl3dnltcG83VFcwVlJPQkQx?=
 =?utf-8?B?VWhTTlhIU0pRck5HTC9GVXpndFMzNUdzYUM2YVlVWmhJRkJrc2RVaXJUYUxC?=
 =?utf-8?B?OFY4YUlMbkVjM1Z5SEQydjBuam5Hd0VNTFA1NjBGam16Wk9tUEZXek91Um9i?=
 =?utf-8?B?Vmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	to7jNwtHWonnHWOZWz+jVvpUoD9eBWw96HSmmshAF1QAoAX0pF7XbHVwme85eorDoxs7pCP+WE4Vukj7RRHodOCqoaPwoyQa2d0F3AYnbl73XaBdnDzwOWanBHz5U4izdQ0yfsYphV2ci0hMFS97vIYAZiuDPzSgbuIrr7iQhTlW+pNgSDJT+XlgWNiCbcqmiza5Xeb/2mb+aC+nGt6i6kH8XwqSa84bNxFyg4RSI5VrK50IbmHcF7hhv+BGnaM1fT4yACdKHe4N/pVf4fOb318zYdgjD8Y8thE0a6t8ls/nMBe6HUwu+JEBXoivjxokyvNIAks0G+Ur2SqIZZxvGF/S/KrnxftY7ltqpcxwZVZXOgS39OIgFyZlYBy0f03vGNcUJr3XXcLJz2g1wNLtGVW/jr0m7Fvywint0qO00jgzx82JrYGT3bhqM+2eZo1sI1g2550PKtpQ1eyHR30+kgoxNUJTFU6NqGpPLTEcwtLeRIecPLdED1i6omYTaJ3wCxB/ofr8Vnr8r6qt68O8GDGYp/W1FFO5+bqS3dK0kei4dHwl1wTfPyrQZsCnAMHBzOAcggth9IpzJT4GDpo0S8XHXMBRuVfn7Vm646v0eh1WzN3O4OPH3iPSiiHcMMKq
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9382.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fccf5d45-1104-4a71-ea1b-08dd976754c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 06:27:01.6134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQQEoogXEVFd02asNRiP4qMo3GAxi63hdleASww5go+J6Ukn/1Ey9sCRGOeZk9qq/p81597r5p6wbqUrP/8eDX2kF+iS3/nzzrWMhd53v9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15150

R3VlbnRlciB3cm90ZXM6DQo+IFNvcnJ5LCB5b3UgbG9zdCBtZS4gUHJlc3VtYWJseSB5b3VyIHN5
c3RlbSB3b3VsZCBub3QgYmUgYW4gSUJNIHN5c3RlbS4NCj4gTm90aGluZyBwcmV2ZW50cyB5b3Ug
ZnJvbSBhZGRpbmcgYSBtb3JlIHNwZWNpZmljIERNSSBlbnRyeSAob3IgbW9yZSB0aGFuIG9uZSku
IE1hbnkgRE1JIG1hdGNoZXMgYXJlIGZvciB0aGUgc3lzdGVtIHZlbmRvciwgdGhlIGJvYXJkIHZl
bmRvciwgdGhlIHByb2R1Y3QgbmFtZSwgb3IgZXZlbiB0aGUgQklPUyB2ZW5kb3IsIGRhdGUsID4g
YW5kL29yIHZlcnNpb24uIEV2ZXJ5IHZhbHVlIGluIGVudW0gZG1pX2ZpZWxkIGNhbiBiZSBtYXRj
aGVkLg0KDQpUaGFua3MgZm9yIGluZm9ybWF0aW9uLiBJIHdpbGwgaW52ZXN0aWdhdGUgaXQuDQpT
dGlsbCwgSSB0aGluayBpdCB3b3VsZCBiZSBpbmZvcm1hdGl2ZSBmb3IgdXNlciB0byB1cGRhdGUg
dGhlIGRvY3VtZW50IGl0c2VsZi4gUGxlYXNlIHBpY2sgdjIgaWYgaXQgaXMgb2suDQoNClNoaW5q
aQ0KDQo=
