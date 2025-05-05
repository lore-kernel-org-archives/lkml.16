Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922810A1F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 01:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746409577; cv=fail; b=YDtPm8yvOBF19b+pyRtA8NSb1W/dEta69PQvZ2F9gBCkGYikbS3M5Czyq/hKaMRAMKvgRWN55tk+7gsF83ihfpKBH8IGNn2ioNhCgYnRQtA02RG+ki9oBHqD9QycIyK8tnea3fp8S1QNHiRiV63N6HUMcGK1K3z83XajOwIvUYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746409577; c=relaxed/simple;
	bh=McO2fgDsRtPOORVsEnLKxM3ql1KfvRG2/RlN6pu8sn8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U9AX6/5m2KRSMgobPzotfq4AdVUb8wIn9kCK9U6GvlXNsMqtITfi3Dtaz4hjrsD8Lcu9WXgVKd8mxBV24aHMPAC46yMqdEsT7yyQHIpsuVxAB+BytCfDOT46vi5yuFMR8kdQLKkdV2wWG+Cd3LAy5s8X+dQYtoTiS29zXmAn+jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cZHfxehc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D0auIcAE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cZHfxehc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D0auIcAE"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451g9l7027188;
	Mon, 5 May 2025 01:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=McO2fgDsRtPOORVsEnLKxM3ql1KfvRG2/RlN6pu8sn8=; b=
	cZHfxehc3M84RKMG4ehQ/0IYgOaUpWSHxE/7q5mVf4tQYRayTKqXYG5Vf/6xaIe3
	SPewWcLHO4uZBA42Ky08gdY76cJqm/z/JkMmev2wGAvOZwFbLGFYjnRF/OaW10vC
	n3qtE7HMHNluyaDD/qV6XSz3iQrgQX62WsNlVnNid3rJyCC84Ud9tLz+/xbzQ1BC
	pW2ehi4JUXRdYuLa/EpHB25i2PP/4Qa1DB4pSuA5NKei1X2Ig1S7xQRDdGBaZ+sw
	+PUGz5yMGMbZf3XGShzrEUlowVLvb6poyxOJA/v2dUDemh6k3tCXDw8EVAaKSarM
	Ff0F+XyE5WEUwz3GxPcyzg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ekw6r022-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 01:46:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 544NFZNj011320;
	Mon, 5 May 2025 01:46:04 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012038.outbound.protection.outlook.com [40.93.1.38])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kdd97s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 01:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQXEXpJt9mth6Bb1yN3K5aX+CVtRKphIquVBpU1akg51Xl0zOVnKhXldnyN85Y/d8A99AJ1SKZMU2lCSgWmphYuW3/Vj91qyJaYLvA/T4AjfrBADgpYvT3fdf7eeMBHX42+IK6gKs6UMImUwVkPA94c3siiVE8SCDqUMqFjzkSwzQSUjKnzimw2vs6co541fF9ursAaSBpC5PUrb1SzFqwO18JvuknCc5ndfEmARRZA4UPRMEtWDqroDjXVspPv29+xfTTPSlu/rsiBaxUz51A3E72h0tn4z7LCx8Pezd0BbHqf5+vFg59SW4pLw2qSrflWMct2HZD29DAAWwYhkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McO2fgDsRtPOORVsEnLKxM3ql1KfvRG2/RlN6pu8sn8=;
 b=hs/SE6dC8yvSDDs94y9wbpf6SKiXl3zGmBIkp2u82/oAoxnxiXxSusLmv6zWHTSIoPxVEy0G92leb8c56PVnaWVmo0KWcsP2C6owmLj+lFHPGBmNZ0mSmZLl1k1C8jHGm0gtZCTgcs/L7bEZz8V7Z9lFs4uhHHMf/D2TAXr3Q8uB2i1tsksJQmcJr+K0mN6lZ5UvYE0bqnLfsZR3vfaZWvl7eFEvDCBmW41M3hMOWEQ3cvvD3wGW06K/z9fXARXGAhkbnpetabQzLfCU4uHQSGquFBh9DIUS7FPIRTrErpdGhwi2gmqwnus46rI0QnEzD1f0S0EYMKB20khKcVs4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McO2fgDsRtPOORVsEnLKxM3ql1KfvRG2/RlN6pu8sn8=;
 b=D0auIcAE9FmJxzOl80Bf3vwrC3CBvf7J6RcTsKobbwvCggkaTo1Psu+bpJMYBEPu43U2D5sdfpcXEmx3u98MUkIK0MX+SDd0YRZM7cHOSpaTDQxMKXbVDU4ITuwYc1Fgn4y5qUtW6DaX+iShDHIbOUittVjUTzhMO7sJ+fGw9Vo=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by BLAPR10MB5124.namprd10.prod.outlook.com (2603:10b6:208:325::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 5 May
 2025 01:46:00 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 01:46:00 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: Peter Zijlstra <peterz@infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de"
	<bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V3 1/4] Sched: Scheduler time slice extension
Thread-Index: AQHbu0F1MdTMmRhrrUCPTfzyEjyJ57O/elAAgAPOCAA=
Date: Mon, 5 May 2025 01:46:00 +0000
Message-ID: <B8ADFB4D-32E8-4C6F-9100-69DE60E663C3@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
 <20250502090529.GU4198@noisy.programming.kicks-ass.net>
 <54b59ec9-5a6c-40c1-94f9-43311d2c5b6b@efficios.com>
In-Reply-To: <54b59ec9-5a6c-40c1-94f9-43311d2c5b6b@efficios.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|BLAPR10MB5124:EE_
x-ms-office365-filtering-correlation-id: 76a77deb-78b1-4255-992c-08dd8b7696a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGdDb0VvYkVhOVJ1Z21BWTI0bFY5QnNrU29yWmxwcjU1WG5yczFndEZWeW4w?=
 =?utf-8?B?ODhYenVaRUw1OFk5QVBBT09OdDhLdjFlcm9mUWFkRERIVFQxeE1CSkZod3Nn?=
 =?utf-8?B?cVhFMHhUcHpzWWVHemNGaGlnRmhnSkw2UWYyREJVdmR4Z3d4NDIyNDc2QWJ3?=
 =?utf-8?B?ZmRWaUJwTE9yTjQxd1RsMzRiN1VvR3VaTlRuckZ3WlRjamphblVDd0loRmQz?=
 =?utf-8?B?c043NkQxRjU2NThGU1ZWN3pKSVJmbnVRcHVlMnNjZStKUTRERDd3Nkd4aFJR?=
 =?utf-8?B?cEl1ZzR3dVZQQ1pQWWR6ZXVwQVBxbW5XVnZZWlFuUEhHTTlsTTBZc3lpZGJ6?=
 =?utf-8?B?S0FBbmtuN2RoSFl0cmlKY0xCL0RYYXlEblp4K2RxWkYyMTN5Y24xczk1akow?=
 =?utf-8?B?VFZMRm9jTHFzQ0VPR1l0emV3a3BLOE5GZFZwN1FSVzFPNk9DMDYwcVBQODJs?=
 =?utf-8?B?RisxVXQ0VVhWSFVTa3FkL1RISFh4TFRCMkV5Slo2bURMdzZLdmJEZXBwSExL?=
 =?utf-8?B?MU85N3hZVHBQWDhYdTY0RURoM20rZE9PdXlYamlWODFkcUN2dlR1bE95UGtl?=
 =?utf-8?B?MlgrVDFqY0oxLy9MeHVWQ0xNUXk3K0R6ZW1IeTN1S1g0VUNhckl2aGR2aFBs?=
 =?utf-8?B?bkYyYklHQ09zQ3JwL1dTZE1YWUtTcmFGL2VMMW9ndmRIUHUrU0hSMFBQUG5I?=
 =?utf-8?B?RXp0SkJ2dkdwTlYxVXlSN0t3YldwS3lCeDN0U3NVWTYvVENOUmYwYVgxZHJI?=
 =?utf-8?B?dFVJMVFoRHV0YktXbTlqdkY0NGV5d3c2c0hLUzVaK0lpRld2ZXhQNEVXdTNx?=
 =?utf-8?B?SG5mR2xIK3cwZG1MK3NMY0U3VVJGKzlnc2x6TENpZlpYcEppZnlid0YrSkVn?=
 =?utf-8?B?UHNDdDRmbHZ5Z2xhbGkvWWVJdEJBd0lsMDB5QzQ4Smc0ZjJDMlgxTjgvNzFs?=
 =?utf-8?B?MFBuWGI5YTJVNS9tdzlYa2pqTlR1SUl2OWtzMjlyWHRReFp0bWJDcDBkWUMr?=
 =?utf-8?B?REQ3aklzdkpkQW1DTEdYd0ZXYlR2MWt0WHVPME5tLzl2RW5Gc0UrZDJkVkJw?=
 =?utf-8?B?eWFUR0dyTmNuQ1ZzRFl0b1puYndaV0FyYXJWaVVXYTZQbzBpZDNDaFNTbHJj?=
 =?utf-8?B?QzgyWUFuRjh4WndTN0VZdVJza0RxL1pNZFo5RVU4RVJlN2ZZREMrL28rdHhy?=
 =?utf-8?B?bWxjVjZSOXcydGVpclRZMHN6bkxadktRM0IxRkhLRlB6dzRkNkJjK3pKaTRY?=
 =?utf-8?B?dlQrd3N3YmppRDZvcldydU0yeXNZdkREN2x3blZpRWNFWmhLWk1tWjlBVzlH?=
 =?utf-8?B?T1c4MmdWQkJLaXhLc09wM0Z1SXZqa1FRbTRiVTFpaUJMUGwxY0FnRE1ydW9i?=
 =?utf-8?B?YVZBWkY5WVpLbHA0ODJCbU5NcFgreWlmajh3Wk9Fc2NWRlEybjFFU0ZWbVpG?=
 =?utf-8?B?TW9hU3V5ZlZaeVdhUktZak11OGFqc0ZQL0hvZ2pydUVXcDkvRFZrckFpbnVK?=
 =?utf-8?B?blBuVGR4Nm5Zd1NsM3k4dktlV0kzaUZLZS84WXBhTUdXc2FhSXNmNXJTdzg1?=
 =?utf-8?B?VzVsVkZmSXlmdDhLTUlFQW5QRUtXVFJlcFBPM2lhQUJnbVNvVCtQNnFKL29T?=
 =?utf-8?B?d293SmpqYlFDeGpsemtuODkvbFBRSTlLZS9uNHlVcG13bEkvUU16UTg0NURR?=
 =?utf-8?B?WjZ1NmNob1ExQ2dTdkF6bXArQmVORHFGc1g3ZktNZ25mOHVORnJ0OEVBNCtT?=
 =?utf-8?B?SzFYaFh3TmZieFRQb0ptS0djeXpyT0I1ZHJDRUhBYmpHMGRCMTJpbEJIQjVs?=
 =?utf-8?B?Vi95ZUxjcEU2WDFYcVhSVzVTR2VZVlNJRVJSNTRubU40c05BdytwMWlLN05M?=
 =?utf-8?B?QTJtOEJ6dlR5U2IwUTRKN2E3Q2lZOCsyaER4MmhFeTU4YW5rQWdjci9KUlBx?=
 =?utf-8?Q?2XAWobFbRA8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STZlWUNFaFk2VjNmRUpOaGlZVzVIRjE0WkJtdmdGbTFuczFJS1pqNVlxQWcx?=
 =?utf-8?B?RWpzeS9oMWlTNXJSNDhRanNtRXJxYWE2cDVIU25kaEhXeWVmSEt2WHQzeDcz?=
 =?utf-8?B?UGdwemJITWw1QUl1NUlRR3JBSVRhSGVCb3dmVXo4aVJLMVJPS3BlelVNVTdW?=
 =?utf-8?B?clR2ZmRCOXZmM1RKVFd4NFB3TmtuM1hoWVQwMUF4Z0xPVjRlTHFtM1V3aEsw?=
 =?utf-8?B?RVMrcXpMM1BtK1BlTWtNSUtwd29FaEFQVG0zcUdPRm9uSUplWFJuYjdybGN5?=
 =?utf-8?B?YitMUmVKTlFRdWhQL3VxSndlaE93SDNBVTVNamJ3b3prR2ppOUpiUExuMHBw?=
 =?utf-8?B?eFhCM2FuNTRhVExhSWdCK3cwVXVidTM5ZzB6WExDSFcvOFNwb1VHUHdUdFAr?=
 =?utf-8?B?TXhUL200MWYxcm9OMml5RWZxQWM2T25FMlVFeXhRcHhwWVo4KzhrT05FOThL?=
 =?utf-8?B?NHRHejdnQnV5anVLNzRXV2JXVVB2ZER6TDVwOEhRMGQrdGFURjJoSXFKVThT?=
 =?utf-8?B?MjJ3aWovb2xXR2tDdngzaDQ2QVVaWDJhMi9xQVQ3SFhJendodTNnT3RBUWpU?=
 =?utf-8?B?QWlzQXRPdU03Qkp4RUxVK3Rtb00xSGp5ZFRWUzVwOUJlSm1EbVFHV2toUnIr?=
 =?utf-8?B?MTFUL1QzV25yQ2RtOHdCWG5CZkNRb2EwYmtJTWs4OTgyWDJ1YnV0VkFKT0pF?=
 =?utf-8?B?dXdaNnVwQzdoVWQyRWszL1o2ZHAvMUtJaVRzWHRXazh0N2tSMFBSdDdaQlJ5?=
 =?utf-8?B?NmtHZitOaTNydDBqL09Xc2hRd2lHZVZEUEUzTy9jSnpqMmMraVNYbUNVNkhZ?=
 =?utf-8?B?czlKRE0zNkpCL0MzV1J5cEdnY0FxZGx4dDAyUjl4T3dSR3l0U0ZXeVgyN2c3?=
 =?utf-8?B?bXNJamlzRTI3eHN6Z05WcGgxMUlmd2E5Rld3MXlNcWZXQURRbzk3bi8yMVdn?=
 =?utf-8?B?cDh5aGJkNkdtN1B1aDM3SU5QZWZLNW1YbXZ6RHVZNXlMemVnU0R0OHRCbExo?=
 =?utf-8?B?YTAwUFRiRjJ1UlQxazFFb251YUVzWU82NHhnZFlBMDE0Ym9GK1lnWm5TeUdG?=
 =?utf-8?B?WjN2Y0gzV2FRNHFsU2xEOUlud2hPeWZTSWh2T3lKOFRheVJnSXF1NVhRRFhp?=
 =?utf-8?B?ajRPc3VMcGtYRWRSOXF0VUo5czFERVlpSGwyZ3hLZDVYeE5PbGdUSzBaN0Er?=
 =?utf-8?B?M0JoU3c5K3d6SEkwSEd1RENiNVY3MXd0SVdMTE1vUWtMQWhXRURWSjdzNnB6?=
 =?utf-8?B?djNQeHNlbHNnc20ybm12VTdKREZyZnZSME8zRDcybjhnNkw4U3NBY2Zyd3o2?=
 =?utf-8?B?UjN0SUdPNGZuMER4azRDR0dCNEE1Q0tEd0ZQY1lwWjIvZWsyTTd3QTY3Vkox?=
 =?utf-8?B?UHNQalZFeG00aU5WMmh0RzNqVmdudjlUdUQ2VkQzTXFQazFJeU82RW15MmFE?=
 =?utf-8?B?T2lXbUtzMkgwdktWK2F4eG04cmxDTWJoSWViWE5Ec1BESVUvdFN2akpKNWdP?=
 =?utf-8?B?eERIODhWSnc1OEJWTHk3dzNEZmozTUZOQ2JsTVpiWnFpei9mdm5qR20rd1VT?=
 =?utf-8?B?UVdQUWFQVTVLcVFSV2JERjVBWVhFSHUrcStJVStYZTBsM0dUd3VsOXdGTTNE?=
 =?utf-8?B?RHNyTERYMGhwSmlCUmJBRlZndlZBWW9GTFREa1JXcTBqbitvTEdsVXVBeUpW?=
 =?utf-8?B?Z3hyaWIveUY0RXYreHJnZ3d6czhJeVhTMURZVmlQbGwvWk5JSGlrUmVXb0ZZ?=
 =?utf-8?B?MFArbHdIQzFNblhsOXhMM0JzZi9NWmJmWStQbGVZNDZvR1NkSWxqUG93aHMz?=
 =?utf-8?B?NXczRDc3WjIwRkdneE9aY0VOR2VUTkJqaVlZSWxZUUZaRnpIdS9EYUR2dnc2?=
 =?utf-8?B?YjN4V0FUOXpJVWJROGV0Qit4cUpPN3FZSHdRMkVSZEhiRnQzZlAySUNlTTNW?=
 =?utf-8?B?THpYelVjYStMTWp1d1U4S0tYeGg5SzZESHp5TGUxVDVoemsyVkNlZHJoUFhx?=
 =?utf-8?B?a2J3WnlWVFFWdS94OHF2ZlRLeDg0QXRoNjhSeUlseGlwTThjMnF1YkR0T1pk?=
 =?utf-8?B?UnNKazc0cTQrRXljUjVDTFVvMktMSjdJM2YweDFKV3VxVnlqU0RQNkI2empY?=
 =?utf-8?B?THp5V2R5SFdNSGRNQmhLeElGemVleklCTkEyS3FaUkhybVVZbVA4VVgxT2R5?=
 =?utf-8?B?bEhwNDRUOU5VUVVDNnF2QzYrOXl5c01hb1VmU0Y2K095Rk5aTnJDR1dyZUNE?=
 =?utf-8?Q?LprY+WRZ1GJ7CtRzg+BQ0tCUPrXQXvYxyX4rvAM5Z8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06DFF9015DA13749A4270FE9419CEE72@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j8A4tSONGbIldbDCVRFQpCt1NAY9pt9H8snGL/MQXDWuKLgKvF7gWUhqhsU4LlschYwduXz5ScpoasTbjXvTxgfdD0apCpCYCvr3D3r6nuUokwYXT+ji9WrsKqr6jRVl+wUAewqjIBqYwgox9S9jqA/vRUn2cVwRMKZOK1c/mZGSscZgpXLvBVkTgvih0ESlFNezG8wgWCtfirp8HrzxLNaaYokwy0Sh4BeHW4VbhGio6UH0q6sGMHEfMB+zCFCzMuLpFMZJ53MXXOdoUyDPkJhylHr3NjJ35hwRQQ/Quxzvfoe9Lpz4rE/+2He9C9Pynm+Q2TjGgtZ7wcrnbFn4IThuVeRX53aH4/mW/NfAYpGEpK5CyYgHVhArWZJdBk2Jrg2g/Mxw9CBEVA/XgOjFuu8wvHBQfQ7tFmdcqANXQUhQXqadA4qo1XmNVwQXyLjmH+PSx6BjSF0B2i2T9ED+aIvvd7hJBXHFtCEsC5D/GFHlbzLt6IAC6GFutc0AQl4pHCByD/1BCbeZxJZWWRYpXzgi14j3cOzCANHVar1KRjjIFAbd0TI/u/92Tp82AJ+jdhXOUEAGRrk2C2dFwxx6pcQ9YTB0aYQ3Q3of3jybOT4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a77deb-78b1-4255-992c-08dd8b7696a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 01:46:00.5470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YKm4aSnnHzaiVS/bKwpVec2MIPQjTxL7tyTLez5glxTRP+Hwbzs3wbKLGWEIzpznMAhdMk266zPQUR099rZLrsfjRSH0kF05c+c6cR/ZgSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505050015
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=6818185d b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7d_E57ReAAAA:8 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=GnHX9X3vANafvwQFFxMA:9 a=QEXdDO2ut3YA:10 a=jhqOcbufqs7Y1TYCrUUU:22 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:14638
X-Proofpoint-GUID: qinu8kwNvg_P6QaHs1vzZAUOAGrLRGTz
X-Proofpoint-ORIG-GUID: qinu8kwNvg_P6QaHs1vzZAUOAGrLRGTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAxNSBTYWx0ZWRfX6bMLOyPjm0L+ fho5hCV+eSVJNjZubRS/YVDm040gQbwhGaDtZAwmdwh4sp+jSwtRdEZ2PwHd526rdG7QQ9dZ0Ha F3BsWLDQAFdvhy2dAz/dd7ZK8ZPBtOK1ije7EM4yIMOu33ABnnPxVwLhcw8Sw94pE+P7OeftdKZ
 gHjGnfwGzZb3qt5THlphEV5xNGH3tW/007soh/GTczjjxUcs6aMzZkYQSz1bONjVWZT7/cedRAO NGq1GZJIbqpLrS6fqtpaclKwKDNUFjNYwnp23T549/TM7xK0Rg/Ew6ororM8vfB5jNVo4JOXVBQ gnDwwRfPGu4tlHRHEiujxl5n/x4Sim2ym7a4L1RamX40GpZhR2z2m+XhAfMkiIXuye9VkVvCsyi
 3yJW/TxoCQHLTLf2IpZt4m0ehO8pl4J6J9isk0UK+DrWgc7P1FpoVbcWEK6yF5BA4wWymYea

DQoNCj4gT24gTWF5IDIsIDIwMjUsIGF0IDg6MznigK9BTSwgTWF0aGlldSBEZXNub3llcnMgPG1h
dGhpZXUuZGVzbm95ZXJzQGVmZmljaW9zLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyMDI1LTA1LTAy
IDA1OjA1LCBQZXRlciBaaWpsc3RyYSB3cm90ZToNCj4+IE9uIEZyaSwgTWF5IDAyLCAyMDI1IGF0
IDAxOjU5OjUyQU0gKzAwMDAsIFByYWthc2ggU2FuZ2FwcGEgd3JvdGU6DQo+Pj4gQWRkIHN1cHBv
cnQgZm9yIGEgdGhyZWFkIHRvIHJlcXVlc3QgZXh0ZW5kaW5nIGl0cyBleGVjdXRpb24gdGltZSBz
bGljZSBvbg0KPj4+IHRoZSBjcHUuIFRoZSBleHRyYSBjcHUgdGltZSBncmFudGVkIHdvdWxkIGhl
bHAgaW4gYWxsb3dpbmcgdGhlIHRocmVhZCB0bw0KPj4+IGNvbXBsZXRlIGV4ZWN1dGluZyB0aGUg
Y3JpdGljYWwgc2VjdGlvbiBhbmQgZHJvcCBhbnkgbG9ja3Mgd2l0aG91dCBnZXR0aW5nDQo+Pj4g
cHJlZW1wdGVkLiBUaGUgdGhyZWFkIHdvdWxkIHJlcXVlc3QgdGhpcyBjcHUgdGltZSBleHRlbnNp
b24sIGJ5IHNldHRpbmcgYQ0KPj4+IGJpdCBpbiB0aGUgcmVzdGFydGFibGUgc2VxdWVuY2VzKHJz
ZXEpIHN0cnVjdHVyZSByZWdpc3RlcmVkIHdpdGggdGhlIGtlcm5lbC4NCj4+PiANCj4+PiBLZXJu
ZWwgd2lsbCBncmFudCBhIDUwdXMgZXh0ZW5zaW9uIG9uIHRoZSBjcHUsIHdoZW4gaXQgc2VlcyB0
aGUgYml0IHNldC4NCj4+PiBXaXRoIHRoZSBoZWxwIG9mIGEgdGltZXIsIGtlcm5lbCBmb3JjZSBw
cmVlbXB0cyB0aGUgdGhyZWFkIGlmIGl0IGlzIHN0aWxsDQo+Pj4gcnVubmluZyBvbiB0aGUgY3B1
IHdoZW4gdGhlIDUwdXMgdGltZXIgZXhwaXJlcy4gVGhlIHRocmVhZCBzaG91bGQgeWllbGQNCj4+
PiB0aGUgY3B1IGJ5IG1ha2luZyBhIHN5c3RlbSBjYWxsIGFmdGVyIGNvbXBsZXRpbmcgdGhlIGNy
aXRpY2FsIHNlY3Rpb24uDQo+Pj4gDQo+Pj4gU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWxqc3RyYSA8
cGV0ZXJ6QGluZnJhZGVhZC5vcmc+DQo+Pj4gU2lnbmVkLW9mZi1ieTogUHJha2FzaCBTYW5nYXBw
YSA8cHJha2FzaC5zYW5nYXBwYUBvcmFjbGUuY29tPg0KPj4+IC0tLQ0KPj4+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3VhcGkvbGludXgvcnNlcS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3JzZXEuaA0K
Pj4+IGluZGV4IGMyMzNhYWU1ZWFjOS4uOTAwY2I3NWY2YTg4IDEwMDY0NA0KPj4+IC0tLSBhL2lu
Y2x1ZGUvdWFwaS9saW51eC9yc2VxLmgNCj4+PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvcnNl
cS5oDQo+Pj4gQEAgLTI2LDYgKzI2LDcgQEAgZW51bSByc2VxX2NzX2ZsYWdzX2JpdCB7DQo+Pj4g
ICBSU0VRX0NTX0ZMQUdfTk9fUkVTVEFSVF9PTl9QUkVFTVBUX0JJVCA9IDAsDQo+Pj4gICBSU0VR
X0NTX0ZMQUdfTk9fUkVTVEFSVF9PTl9TSUdOQUxfQklUID0gMSwNCj4+PiAgIFJTRVFfQ1NfRkxB
R19OT19SRVNUQVJUX09OX01JR1JBVEVfQklUID0gMiwNCj4+PiArIFJTRVFfQ1NfRkxBR19ERUxB
WV9SRVNDSEVEX0JJVCA9IDMsDQo+Pj4gIH07DQo+Pj4gICAgZW51bSByc2VxX2NzX2ZsYWdzIHsN
Cj4+PiBAQCAtMzUsNiArMzYsOCBAQCBlbnVtIHJzZXFfY3NfZmxhZ3Mgew0KPj4+ICAgKDFVIDw8
IFJTRVFfQ1NfRkxBR19OT19SRVNUQVJUX09OX1NJR05BTF9CSVQpLA0KPj4+ICAgUlNFUV9DU19G
TEFHX05PX1JFU1RBUlRfT05fTUlHUkFURSA9DQo+Pj4gICAoMVUgPDwgUlNFUV9DU19GTEFHX05P
X1JFU1RBUlRfT05fTUlHUkFURV9CSVQpLA0KPj4+ICsgUlNFUV9DU19GTEFHX0RFTEFZX1JFU0NI
RUQgPQ0KPj4+ICsgKDFVIDw8IFJTRVFfQ1NfRkxBR19ERUxBWV9SRVNDSEVEX0JJVCksDQo+Pj4g
IH07DQo+Pj4gICAgLyoNCj4+PiBAQCAtMTI4LDYgKzEzMSwxMCBAQCBzdHJ1Y3QgcnNlcSB7DQo+
Pj4gICAqIC0gUlNFUV9DU19GTEFHX05PX1JFU1RBUlRfT05fTUlHUkFURQ0KPj4+ICAgKiAgICAg
SW5oaWJpdCBpbnN0cnVjdGlvbiBzZXF1ZW5jZSBibG9jayByZXN0YXJ0IG9uIG1pZ3JhdGlvbiBm
b3INCj4+PiAgICogICAgIHRoaXMgdGhyZWFkLg0KPj4+ICsgKiAtIFJTRVFfQ1NfREVMQVlfUkVT
Q0hFRA0KPj4+ICsgKiAgICAgUmVxdWVzdCBieSB1c2VyIHRhc2sgdG8gdHJ5IGRlbGF5aW5nIHBy
ZWVtcHRpb24uIFdpdGgNCj4+PiArICogICAgIHVzZSBvZiBhIHRpbWVyLCBleHRyYSBjcHUgdGlt
ZSB1cHRvIDUwdXMgaXMgZ3JhbnRlZCBmb3IgdGhpcw0KPj4+ICsgKiAgICAgdGhyZWFkIGJlZm9y
ZSBiZWluZyByZXNjaGVkdWxlZC4NCj4+PiAgICovDQo+Pj4gICBfX3UzMiBmbGFnczsNCj4+IFNv
IHdoaWxlIGl0IHdvcmtzIGZvciB0ZXN0aW5nLCB0aGlzIHJlYWxseSBpcyBhIHJhdGhlciBjcmFw
IGludGVyZmFjZQ0KPj4gZm9yIHJlYWwgYmVjYXVzZSB1c2Vyc3BhY2UgY2Fubm90IHVwIGZyb250
IHRlbGwgaWYgaXRzIGdvaW5nIHRvIHdvcmsgb3INCj4+IG5vdC4NCj4gDQo+IEknbSBhbHNvIGNv
bmNlcm5lZCBhYm91dCB0aGlzLiBVc2luZyBzbyBmYXIgdW51c2VkIGJpdHMgd2l0aGluIHRob3Nl
DQo+IGZsYWdzIGlzIGFsbCBuaWNlIGluIHRlcm1zIG9mIGNvbXBhY3RuZXNzLCBidXQgaXQgZG9l
cyBub3QgYWxsb3cNCj4gdXNlcnNwYWNlIHRvIHF1ZXJ5IGF2YWlsYWJpbGl0eSBvZiB0aGUgZmVh
dHVyZS4gSXQgd2lsbCBzZXQgdGhlIGZsYWcNCj4gYW5kIHRyaWdnZXIgd2FybmluZ3Mgb24gb2xk
ZXIga2VybmVscy4NCj4gDQo+IFRoZXJlIGFyZSBhIGZldyBhcHByb2FjaGVzIHdlIGNhbiB0YWtl
IHRvIG1ha2UgdGhpcyBkaXNjb3ZlcmFibGU6DQo+IA0KPiBBKSBFeHBvc2UgdGhlIHN1cHBvcnRl
ZCBmbGFncyB0aHJvdWdoIGdldGF1eHZhbCgzKSwgZS5nLiBhIG5ldw0KPiAgIEFUX1JTRVFfQ1Nf
RkxBR1Mgd2hpY2ggd291bGQgY29udGFpbiBhIGJpdG1hc2sgb2YgdGhlIHN1cHBvcnRlZA0KPiAg
IHJzZXFfY3MgZmxhZ3MsIG9yDQo+IA0KPiBCKSBBZGQgYSBuZXcgIlJTRVFfUVVFUllfQ1NfRkxB
R1MiIGZsYWcgdG8gc3lzX3JzZXEgQGZsYWdzIHBhcmFtZXRlci4gSXQNCj4gICB3b3VsZCByZXR1
cm4gdGhlIHN1cHBvcnRlZCByc2VxX2NzIGZsYWdzLg0KDQpPcHRpb24gQiBzZWVtcyB1c2VmdWwu
IEkgaGFkIHRob3VnaHQgYWJvdXQgc29tZXRoaW5nIGxpa2UgdGhpcy4NCklmIHRoaXMgaXMgcHJl
ZmVycmVkLCBJIGNhbiBhZGQgdGhlIFJTRVFfUVVFUllfQ1NfRkxBR1MuDQoNClRoYW5rcywNCi1Q
cmFrYXNoLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gTWF0aGlldQ0KPiANCj4gLS0gDQo+IE1hdGhp
ZXUgRGVzbm95ZXJzDQo+IEVmZmljaU9TIEluYy4NCj4gaHR0cHM6Ly93d3cuZWZmaWNpb3MuY29t
DQoNCg==
