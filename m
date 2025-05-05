Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FD925A2AD;
	Mon,  5 May 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456248; cv=fail; b=HN+O4PWGKl8KQlCGchT/v/Z707clqDZIl+Tw3m63aOfdGY+bMxHx9iX6rFFmEeWNroX4b4NFQb0EAKjbtbblKT6/TJWxNY9g8tgnBtGNoiPWFkEgq2v2NUKW4TofLvzxd3EOaQU+xw03VkYIjs1m2/jHRwAavLPLu+aiqktQriM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456248; c=relaxed/simple;
	bh=7nElclobKvqfN1Eissn5mcXYu9fuRFI1VaXi2NA9gOU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BcV78zYXyLNqlI1jTK4EBRRTTbVaAzXL2X08Cihqb3rZBkUZiiQTlyZflELTxJfJjKvDivG4SkBa4FbIBQt+IM9Mis9kNM4320q4EEUQNTArBFbX2+1JNGMbn1FOGrJbCLFSE71y4uh5/pnS1CeZSBvJ1atf/vN/72vQrsIUE14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=Ys8/qwRF; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="Ys8/qwRF"
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545EF1aT008045;
	Mon, 5 May 2025 15:43:57 +0100
Received: from ma0pr01cu009.outbound.protection.outlook.com (mail-southindiaazlp17010001.outbound.protection.outlook.com [40.93.131.1])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 46d8cx95as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 15:43:57 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfYN3S7N8eTNZK8yDZFwq2WstFAQ4idyGNosS+EFY5NqHwt+yIspMZaahoDq73lKEM0ZvKiFX7h0VuYaWHU1KIgJk98PqjvSx/rrm/Ld5yF6H1A2YRBJVWisauBwJ0aQ1XoIToZtK+yXTn47QUcUOEsySdWI2yuHko1uZjknF10zdsIcqMv34z/HJyZDl6c1yg8uv7FqeluRc4bsDZ6ahhmrPHUGt3LnfRc6M4bqXYjnYlfs9X8nvf/YjKTGMFWnMGZwq16NBFZm3KcQPUofqJ2bQvpLzPIiZIC9UsDOamNM5/+3KNG3RwvZaM5PANPFq99ghnKgzAFMBwIlV4Byvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nElclobKvqfN1Eissn5mcXYu9fuRFI1VaXi2NA9gOU=;
 b=AOJ63ec3UcNfKVE8d+i1XgjfmUEbPqecc+jyh/4aTsU9FyO4w0hkHR7bY8nyWz9RrpRR+Gclo0FbdXTNIFvxgilGc7tPF5EiyDpMj7yYtZnyuZp/CiWrguOa9kHq8kBCgId8QclL5/At4eBauKXxH6KnB5nzBNyQmDbRHb6OojmMTkj+uYmR/kWWcWenVEfHwnA1k2+qi34x0D2oCStaC23PP1wg7DTwTUi7jW6VjhyVtEtbyEghW57n70gw6dFGMSrD5iR1ia++ni1jXToh+zzz5fSsDZkUg1VeJUGzjzTo12qd62v3pwfa0MEgofFvhPbj/kBLIESLtIN6EwFecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nElclobKvqfN1Eissn5mcXYu9fuRFI1VaXi2NA9gOU=;
 b=Ys8/qwRFrOFBbqKXVEK1U9AYHGPWMmprquYbKW5RfneVwJ0TyrZiNbAnjj+w6R+Is3zCM7DF4QDHXyEj2GQ+5CrQ5cZOWwWc39Y4GeP1FoMoDHPmyfJnoxkNhKpBQX8Ky74e2YaogEyZmEK370DZ3/RwrGBinXKjJ4Q9qZuqhQo=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by PN0PR01MB9073.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 14:43:52 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%6]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 14:43:52 +0000
Message-ID: <b35c8727-f6bf-4024-9e83-dfe12ac4400f@blaize.com>
Date: Mon, 5 May 2025 15:43:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: arm64: dts: blaize-blzp1600: Enable GPIO support
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones <neil.jones@blaize.com>,
        "soc@lists.linux.dev"
 <soc@lists.linux.dev>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250327-kernel-upstreaming-add_gpio_support-v2-0-2c45a1acdc0c@blaize.com>
 <20250327-kernel-upstreaming-add_gpio_support-v2-3-2c45a1acdc0c@blaize.com>
 <32d9f0c5-5648-4cc2-9db6-f5165d20d20c@kernel.org>
Content-Language: en-US
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
In-Reply-To: <32d9f0c5-5648-4cc2-9db6-f5165d20d20c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0392.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::19) To MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:12a::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB10184:EE_|PN0PR01MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5b4cd3-24a5-438b-b309-08dd8be3412f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEpubFJSQW9oTzhBbVB6aWFzQWJmcmtWTmh4dmtPV2dnZmxxWWlHWmV6YTJP?=
 =?utf-8?B?ZE5Sa0g5dk9RdDBqTHg0SWVmZDdnN2pwL1Y3UkFYeFdHa0ZvQXVQaEZocWY2?=
 =?utf-8?B?OC80QlYwdjVOdlZyMXIxRXF1d1d1KzV5dmJudk1ITTBabnl6ZXVyYVIxVHln?=
 =?utf-8?B?WW9mQkhjaUsxNjBPTjd3RmhoaFJFbzJiVHh4eWhVaTlXeFFpTnoxWVJVWTl6?=
 =?utf-8?B?dm1mMXcrZFBtVW9LV1JnWEdoeUNIV2RQc05yYlRPbGY4YzByRjB6TXV6OVo2?=
 =?utf-8?B?dUhsb0tpKytjeWN1eWQxQWhRNGpjdEdjZHVZMzc5N1VOeC9jRmNiWmpHN3hT?=
 =?utf-8?B?WHN1UlBMTHl1c2J1TVlibVREeFJYcy9oVjBwSDEvY3liWFIzbTRuM04xcWtD?=
 =?utf-8?B?VW9ocjRFdWUwK3JDd2REMjdlQ1Bibi9yRGZ4OE1ZYVZ0bWhiR2dXMDFPaDBW?=
 =?utf-8?B?cWQrSnoxVFh6RU9WZzljZUhvUG9HQVIyQzFZdlNIMjRXTnVBN3hQRktveDFr?=
 =?utf-8?B?cmwwMWt1c0lycU9MK3NaRVBwVDRWTWpMc2xxWDRYM2EwcHU0Y25IaGdVQXRX?=
 =?utf-8?B?ck1uSnV4anlBMll3M3lidkNwSFJBV1ZDSTZyNW9GaEhPSTQ4UDhhL2tpMmhn?=
 =?utf-8?B?L3l1bUpNWlBiN0ErMWl2OTEzYStYekZoaVRoQzRpellyTE1idnA1cncyQXBs?=
 =?utf-8?B?WFlCVE00UVRJUFc0RVVwSUZLYkJGays2M1FpeGxUVUt3OG9XVHRKa1doZG1B?=
 =?utf-8?B?WkgrUEdLQXRHRGNVNU5UZXgxV2hMTHgwd0FVNkc2S1NDS1BoN2dFMVJHNkF4?=
 =?utf-8?B?c2dDZ0VkVEtvU2d3akdMNHZPaDVFMTRXTVJzNW4ydHZ4TDJTbEgzZ2JlSi90?=
 =?utf-8?B?aW9hMW9QUjk4blhJdU1YMmF1ZGlXdjJPVE4xamxyNVVEcEpzcE5oUkxmZG03?=
 =?utf-8?B?MHBvV0dlc2ZKTXRGRHNFU0FMcEIzTEEwdzY0enJVamlLeFpHUUFQejNCSFBl?=
 =?utf-8?B?MUM4ZWxjcVg2dzhQN3ZmS24xK3hyS2RrVG9PK1g3eGNyWVhLRldsMERwR0x6?=
 =?utf-8?B?Y04rVEQxVlFiZUhMeHFVSDRQWElVWEkvbXVPVUlqMGFjZFhLRGdIRjNrK2Fa?=
 =?utf-8?B?MzdoSWZTTGxWbFE3dmxqUVpZY1BidjZFOWV0cjJwWUZlVnJrbWZvT0hsblZE?=
 =?utf-8?B?bU5LYzZPUjBjUDZoS2NpNXY1YjhLa1dNa1ZRRmJDQngxZzl0Rm9sOG9HTWtm?=
 =?utf-8?B?YlBrdnhDUk1ad1l2ZU1TNXVLenhtdngwTVcrbk1DUUJvQkR0Y3hDNW1VVzl0?=
 =?utf-8?B?VFRrREZ3VTYrT3JCOWNRRTdCQ3JHUTR4UDZqZnJ2WGVjQkV5YlNPK3lOL2Jo?=
 =?utf-8?B?SEdmcnpwRUxwUElvbmhRbVd0anR1WTVPQmZIbmhmU2xpcElWYVRiSHpUdWJl?=
 =?utf-8?B?dGV6OEFCUkpkNmFWbndNT3BzL2F5ZEVMb1lpVWR0KzJmaWt3SDFPdDNMSGph?=
 =?utf-8?B?d3V1aXFySEk4VEI3RGNrczBPNXNsMHZtVUYrUU91L2VKLzdKelkrYTFMb3h2?=
 =?utf-8?B?MFEzQytrTVNTZi94UGVsRXNUWjJubDMzZVlCUGg5TmxQTndMR0cwY1BGdzVJ?=
 =?utf-8?B?cG5NUkQ5S3p0ZllEOUFwWHNuaGI2enFtd01DRWdvb0swWEN1d3UveVhwK0Ro?=
 =?utf-8?B?QkFOdlFxK3Y2Y2Z1Zm5QMDBIQW5UOXNYY3d1UmViNTNmUitBNmZpTHg2dERk?=
 =?utf-8?B?aUc1UlNsRHMvR2xUMW0wblhncGFqZkxNV1YvMUc2anVTMWc1N0lxT041V3RK?=
 =?utf-8?B?ZzVQVlhQWWtvVFJiWW5YWW1rZ3NwRFQ4d2hiclRwYk1MdnhjdDBxS2J1OUhm?=
 =?utf-8?B?QVVaTHNUcnNmVnBQZGFCbXk0N1VHMXNEVXR5SW9UeUZCWk8wNmxaUHlNVVNE?=
 =?utf-8?Q?n1hYSL6waDs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlZDUnBoQlcxUHM5RFg0ZkpjZ0tNOTNhbFJvR3ZPRjNEQ0lscDd6cDRoQzVP?=
 =?utf-8?B?MThsOSs3Q2dsaS9SSERjbVR2UDZoMHlWRXVJNlBkVDJKSFhlT0VxbUN2NHNo?=
 =?utf-8?B?UFlKY216WG5xOE5IbVYyZzdaalZvdWF0bmdlbXFQc3l2bjA5Z2xQWGJ5aENo?=
 =?utf-8?B?QXRrSlY5QmxhSTNseTZIbWsvMjJPYUQyZCs4dTFXU1VpY1dSMDh6aTFMdXRl?=
 =?utf-8?B?WHlLYVFVNTZXUDRDeUFCOCs0RDF4MGRHcTNLd3BCVEsxMUdFUEszeWxKSCtu?=
 =?utf-8?B?bjNUNkNXZld4b1ZPSTY2RE5tWGhUYmpIdTBmaFBNM1ZQbGJ6Qy9TM21NWk9h?=
 =?utf-8?B?dXlEenJSWTh6OXVncGVxS1YwOHZBcVFvUVNiWU1KOUkvVG11WGM3cUhsUmgz?=
 =?utf-8?B?SER1b1NKSDY4WitmbWhEZ3ByczlIN2dFejFJNlY3R3I4UFR1a2dDcitRemt1?=
 =?utf-8?B?bmFZOHNEcEFnQTNrRFczaFExZVp1U2tUSGFESGUzWEN3QUFpMWhKNXBvMG1s?=
 =?utf-8?B?S0I5TW1XbzNsUTN1RCs2VU1BVVpzZzliMTRLUDB5V3V4WmdtRVRZZTdFb3ZC?=
 =?utf-8?B?cjZaSXIzT2VQSEMzVEIzYUtlUzlSUmk2YkRvOGdQK01YaytGVnFuYmpvcHYx?=
 =?utf-8?B?ZEZPaXlKT1ZCYmF4OWhBWTQzejJQeWFQRWhmRHIxVFk0amtQL0UzNjd3c1h2?=
 =?utf-8?B?Q25MbHNraiszUDNySmtwREN6ellZTjl0enhQYVZzc3h6dUFsMFVwZVBFL3B1?=
 =?utf-8?B?MFB5K3pweGVTc2ZJRnNLSG5NUHhTejJ2MGd3a2tBbUdiZHViTFBGeFcwcmlS?=
 =?utf-8?B?Ukt2WUxDdUpwbk1yZVlXNGZzOGlvVVkweDNyUzdJRG0zWDFNeTJqY0hKMXdq?=
 =?utf-8?B?ekdEWnRoeFdRc0JockE2OG1Pa2hpS1NBSDNTV0JmVkMreEsvOW9XYUljR2NS?=
 =?utf-8?B?aFoxelRTa2wzVzczdENraldEcnFYekR3UndnZFpsMVhNV0Y2UG5hcXRIdXNo?=
 =?utf-8?B?T0Z2V0ZHWndzMEF6b1lNdXB1NUhhRVArUFJsQXEwdm5MbHBWUGJOYTZ5OFBC?=
 =?utf-8?B?cVgxVG5jeTVWSFE1VUJMVGkyYXlxaVRCYVI4N1pLVjhsRTV3NFJuV1hxZWo1?=
 =?utf-8?B?aHRjYTRiUWlXSDVrY3R5WXM4Q2lndGduQm9INWprdVExZWFOUUgrN1V2M0NH?=
 =?utf-8?B?bVpHUEF3VUlrOGlkdlp5UjNjakhxVlludHEvaTJYSXVDQVcyckIwdTRIUWpz?=
 =?utf-8?B?US84eEhlbktqU1BLMTRpU0dvK1VFejRPY0tlOSs3d1ZsWVFxTTFLK3JrRksr?=
 =?utf-8?B?cnBySkpVZlNxaTAxb241ZkxWZWFmeWVlS0QzZ2xsV09Qa1FJazU4Z20xdmY4?=
 =?utf-8?B?bHF6NWVReElzVkhBY0s5VUpscmMvYmtJbDVNVVl2dU9RRGpIVHhKMExQUXA2?=
 =?utf-8?B?ZWU1d1Fyb1R4bTY2TFdNdzA3UVZMbDZGcTB0TGEvZzBYdGRhazY0eTFIMXlw?=
 =?utf-8?B?YkhlSGowczhQOHQ2M2pzVit6d05XU2FOdW5QWEpUTWJ5OU85QVRGaHBBem5s?=
 =?utf-8?B?MmYrSlVOdTdabm1xcmRhbXA5dEQxazNSUy9oMGs3K2Y4MkRyRTVidThJSVYz?=
 =?utf-8?B?d3JYeHhhMFo5M2QvZXhoUXQwT0Y0aGtQbmNTckVJeTlXNnBvTU9oZ2JOY1Mz?=
 =?utf-8?B?T0l2bWxTVlVwWXVhSzBYZjBrSkxRZFQ0QWVsRUd3NHhCbHVOeDgvajZtQ2Rq?=
 =?utf-8?B?b1RrV0xTNmlzaUJ6VU8vUGx0L00xR0hBZE5nSlROaCtzMWlqbUZqQWNJZ21F?=
 =?utf-8?B?M0dEY0lqM2pkQW1qRGdGRUJFMFhjZU0xWEp5K1RidXpmWVZ0RGdrcm5lK2p5?=
 =?utf-8?B?Qlk5SEhNUm5EWUJpc3lHbFlqT1JkWWcvdFhYbldWZ21WL3BDTXNhWUR2RENF?=
 =?utf-8?B?M2NDY0pCeTd4dndkTmVsclF1K2UwZjREeXc1akRqN3lPSnlmNThtUDQ3UGpL?=
 =?utf-8?B?aThvcVE5Ti9LdUdXaGxBcDZRcy8rNDByM05FaUpBWTJuRWEwa09uNmZ0Wmxz?=
 =?utf-8?B?RjBCbXlFVTVQMmltQlBXU2JUOEZxaG1NQnJ3YkFOTVR2OTBoREhpVWhDK2dv?=
 =?utf-8?B?ZDM2VWZNajVrdjFMMzBOaGIzOGthOGxlSW5Va0RlS1BTbEFJV1lEbzhocVBX?=
 =?utf-8?Q?6Njinc8jVN6Q0sasf78svr0=3D?=
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5b4cd3-24a5-438b-b309-08dd8be3412f
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:43:52.7019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwI6qo4bKNVL6k7banqmcIzTVhYDrOrl1Nr8f1Bh4sw9C5u3He2NMIrF41AFzOHLNv6O97UOGZ+XxJa0/4vZjD03fxs/V8VTXQ/G82zXHJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9073
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE0MSBTYWx0ZWRfX8OgSVFdZQyu0 w96mHHh3A/3LyfdFXAvDKyUXkuvDeE70kG7eRl8JIBTmv0SjMIx+AvjUtQ8d+bKwuf68R9f2g9n Oj32xuRtSO6fZycP+FDJrZkflYmlqIqt/3z2UV/VkDuKW+1Ieq3ijMVu7OFRsLUHmT4gbXXYo4/
 etEur+OOqbSOVc24PrOzioxIAwwVLa/sx1pJRfhYCn5sUq/iati5uBYXmeOJcDPalAs3LwkMkqn Lu5UwseSTYMwcwrEHVTngs0z/RUbfGa4SXDxdjLvTxhFWh9PZfoy1vIiUU5WeNpV1slD2H7coZD q4zWr4Pxo8tfWrUNBBQBCWVInRAZEnOsijb+jKqz1Tpg4ksS1WzsU5ldd0VV7XrEfl4LKzKLSq3
 b4vv9enr4sDAawaEZ7ZmrCJcXf4urqiVxlA/RVY+HPZdRHXlZ8/0vwGVdQ6azWL6+uZZBd1o
X-Proofpoint-GUID: S7v7v1KUarN5F5FoArjis387pfAth2ZN
X-Proofpoint-ORIG-GUID: S7v7v1KUarN5F5FoArjis387pfAth2ZN
X-Authority-Analysis: v=2.4 cv=PvCTbxM3 c=1 sm=1 tr=0 ts=6818cead cx=c_pps a=acs/d5E7+Aba6MfbJzuIpg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=VwQbUJbxAAAA:8 a=B1aPfOBTQV_d8-u9QvAA:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Reason: orgsafe

On 05/05/2025 15:17, Krzysztof Kozlowski wrote:

> On 05/05/2025 16:14, Nikolaos Pasaloukos wrote:
>> Blaize BLZP1600 uses the custom silicon provided from
>>
>> VeriSilicon to add GPIO support.
>>
>> This interface is used to control signals on many other
>>
>> peripherals, such as Ethernet, USB, SD and eMMC.
>>
>>
>> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> Entire patch is corrupted by your mail server. Please switch to b4 relay
> if your mail server is not capable of sending emails (like Microsoft
> Outlook).
>
> Please use standard email subjects, so with the PATCH keyword in the
> title. `git format-patch -vX` helps here to create proper versioned
> patches. Another useful tool is b4. Skipping the PATCH keyword makes
> filtering of emails more difficult thus making the review process less
> convenient.

I was expecting b4 to be able to send a single patch without a cover
letter but I couldn't find how to do it, so I decided to send the .eml
file produced by b4 with git send-email which obviously didn't work.
Apologies for that.

>
>> ---
>>
>> I am re-sending the patch to include the soc list. The original patchset
>>
>> has already been applied but not this patch.
>>
>> Arnd, could you please apply or do I need someone to review?
> Platform maintainers are responsible for the patches for their platform.
> Any reason why this is not working for blaize?
>
> Best regards,
> Krzysztof

I am the platform maintainer for blaize but I haven't created an account
yet on the kernel.org and according to Arnd it should be OK to submit the
patches for inclusion (until I get an account) by sending them to the
soc@lists.linux.dev.

So, what would be preferable? To send only this patch with b4 or resend
the v2 patchset which have been accepted and add the soc list?

Kind regards,
Nikolaos Pasaloukos

