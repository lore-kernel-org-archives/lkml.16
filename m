Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3819A13C9C4;
	Mon, 31 Mar 2025 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422398; cv=fail; b=RGtjrCtOmVXxBheYB0ANoNd01ZjBkCf2Q9i70Kx6yhhHvQmCm0NljRizUnKRAHAHUiPJVPrK+F4DSahIhYEJbbsH5YBj0MbbdRa8mTZdsMLg8tP2UjOl4ip3LSCCsLDUnPAEI4gm8A+9TSnhRBWIfkcrZ34eazx/S9/AXA0gjIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422398; c=relaxed/simple;
	bh=iIshgasdF87A6gy1UcWXZdcyhrmMjQd62u3fWXfzECw=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z7PfYU3NZmIOfVP4POXwPszR7qIzgAsbh4OQScS2cbJLmWiTNtj4hKt+y//Wg5yW3WeBEQGIZSpbI2He+1xNGsr8yUoMuuhP3DBFyuZHKbAmlQnFhiCQ7LGdPQM9T+kkgZEpZSEil1m7KPy2nVhH4esooxQ3dzL0nseECXi4Z34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mrMBBvu2; arc=fail smtp.client-ip=40.107.162.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mrMBBvu2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibNzR6rT4+uvZkPcgbtZlNAv8m7kb/jYpzMpbDbkrFGWITRuamgxairzY/pfhWUBdvLDFbqLjZuHp8JfKQNQMWry45V7LDyBltcO98WvjHy6+9fSqCZCV+hRC4Rp1RJCEd7GP/HqptSF+eXycM+cVd9gRUq7SUpBvvgfrxcuTeaeH/flJhHydHw0iPFnjladvXgYu4XujSdqYSVwWoMH4eCb1ok6zP06VU/duuJ0DnPhJ3EpKeUPTjrwnwubDKOt4i73w4jwRAdkABqt/T/TMFbTCWPHKwnZNPICNU7qb19YElzFFaTqoKT4McjQDopi+wa5Hf4Avz+YJgMtEbFTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hspu0x9w/srfFS+gKCnL4KihfBa3KrgepmoMtHOe56U=;
 b=wfX10oZ0jKX94yI5fY87dbcl7uH1aaQFgwaE67DyyXUKmo6o/4ZDoYvZxBMWs5ByD5wE1UzKPdh38jri4/0ft0KshFSh+0dliqG4RtlHUXls6OORPGiFKTEalEZap3/fh5/dueQoQQmkX4Y2VRe9lqSHrOIrpWpRFGXRiN/0qTPlnNQT3HtlaCbQyhBbCZhLMup9Uvbges3b9dG/gCCXtpz1FrsLbLoSS7JJDoHYuoU0Tq3Mjs4cO7OFLkO2lGXfYqtQSfIMCUlR45ZG/VmvO/lveUPt/fzXOTd1PCBsjOCvlh6SmkulpS5ZfzD0/CzoLNZ9hxrWz2qz78njyhQRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hspu0x9w/srfFS+gKCnL4KihfBa3KrgepmoMtHOe56U=;
 b=mrMBBvu20GNvHI13TBibxmysUQCgYkYHWWthb91JdGZfnoDdKsdwQzajijmT5pwRP6LKOTnFUu96xl/DSsiwQ2oweUpFBXjRiHXmVk9dqvoqii4dHo5IOEkEUm0BdencMiJ5gOYtHKYMEHWXM2M/V6oMxlBxfZFH8WB9LBDvptIGP6NdsIpzQUELhOfobvGiB8G61QTtETdoLsRDebe/M6JEkYncC4fFRYEXxM8q7PYf28eUiiSLoqzTVzogRWyvhgv3lFKvwwVea1yUW+Yqt594loaDGKG48r+i42kPJxia9pTPxCZCEmrmsz5NiNX9HbTln7rwXiDfpHy+4N1zKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by AS8PR04MB8899.eurprd04.prod.outlook.com (2603:10a6:20b:42e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 11:59:53 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 11:59:53 +0000
Message-ID: <9ad435fe-8575-5077-45c4-3e003e6fa320@oss.nxp.com>
Date: Mon, 31 Mar 2025 14:59:49 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: NXP System Timer Module
Content-Language: en-US
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Fossati <thomas.fossati@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <1bbc1ddf-4aed-cea9-6c3f-c3497f03e123@oss.nxp.com>
In-Reply-To: <1bbc1ddf-4aed-cea9-6c3f-c3497f03e123@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::12) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|AS8PR04MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb0dfe8-a376-4672-ec75-08dd704b8bc6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXNwUHBkRUkxdCtCOUZpSHJrNTgxUklmWFFWNk1xdkdRdk4rT1VNK29lc0hU?=
 =?utf-8?B?S0dSNVRTREtQcTlHem5hWVpEa2dmQUQ4WnRnTnM3ektuUG5ON2pBVXEwSXRy?=
 =?utf-8?B?SngwZVVkSFMxWThJM3dsSVJFVjYyV2JXTVJpQXdJUmh1dm55WDN4cmkxeFAr?=
 =?utf-8?B?WnVSVDhRTXJHbUhyQTU3U0wrZ0IvTVRFV1B4aE9MUW01NnhiMHdCQllscmRo?=
 =?utf-8?B?VnFUZ1RqWVhNaTNNeEljMlFzMVhrSlZXcXlKVlZWRVdRZk9uY2xSUHk1cGNV?=
 =?utf-8?B?Wlh5Q2JSRUlTeklwM0FwRW9kY0JiTUdNbDFCSi9ZcnlxWVRQcFR0RFVIbUdh?=
 =?utf-8?B?dFhkaEwxcDFWN1l3dzhHOVFVWDEyaUs0UXNYVktNbWMxQ0JlUHlwdkV5T2M1?=
 =?utf-8?B?WDdqMEp4bTJnckFvbUF6bWhqTVpUN2orSnExLy9xQm4xNy84cWlvMU1xZmla?=
 =?utf-8?B?dlFRUi9zaXZ5ZE9qUDdraTQwQlZtNmJaWkJnY2haY0Vlb1UvWTBQYi9Hbmtq?=
 =?utf-8?B?QWxxK1NqdVVjM3FkTDVyb2N6eS9YbDJZTHM1amJGaWFWU3pqNXNwQXBYVHhq?=
 =?utf-8?B?VEs0eHd4ZnAwYVFxeCs4QWJaMVhVSjg0N1F1Y3NoZVV6cUdHd1A5a2xwOWZU?=
 =?utf-8?B?Z0NmMGczSmloSldzMURPZW1tb0RkOEdscjBCZkU0cEJvYk9oMlpJTnJneDBC?=
 =?utf-8?B?UUF6eFUxU3MxeEtiNTlVaXB3Z2x4YkhhamRSN0cybWNveE1kaGNzcVNIUWIy?=
 =?utf-8?B?QnA2OEVXWThIUGczamMvWkhNQnlnR2FKdVBUamNwQXk4SGJubzZaOEJPS01z?=
 =?utf-8?B?eTJuYkJ1TjhHTmtwUFhhV0I2STlrZzFEeWNTUWw0WlBVSzVwQ2RBT0doSTcv?=
 =?utf-8?B?WFBSM3FrL0IvZ2xGd3U1aEw1N2IvUUZ3V2dyOHc3MHN3Z1A3QVIrV2c2ZThU?=
 =?utf-8?B?T1Y4TTFoSWVMNUNLN1JVeWVLYWpvdEptREgvczd0bVF3dis5Slpad2h6SDA0?=
 =?utf-8?B?TWd4bEZkaXV1KzBwanJiNXpCWFF5Y0hJV0p6a1BicnF0ajJ1SEZibTVHakN3?=
 =?utf-8?B?UWEwNWtKbTVzaXU2NnZ3YzdkSWNSUlFTemFaT2JDWEVhYXhjUnNQeW5teHJv?=
 =?utf-8?B?YTRVMXBtbXBxSEhoQnBVRFpSZnBOaWZEeDRKNEFrZ3lKVDBOb2QrK20zN0pm?=
 =?utf-8?B?MFBuZkFPSlc5WnUrdFpwZ3JnMjNyRkUwNkVFeHUrMUFNT010R1BEY1dTNUM1?=
 =?utf-8?B?ZmZOeFJEREsxVExJSCtrTjNPSHY2dVc3L1NmdUZIUDh5Z3lGNDlLZVEvVnJW?=
 =?utf-8?B?clVWWG9sWmZuZW9OQzlQVkdNeVp4cW9lQzJWdkNRUzlpS0d6WVJsNmFYTFJH?=
 =?utf-8?B?enk3clhYRHdEUUhRSVBicUY2ZGV4TVdjRzNaaWdjbE9DNThpRjFZNmxpK3F0?=
 =?utf-8?B?SlhVbDJqZG1zRTc1VkRhYVZRclpCR3dkUWN3VmV5ejdSczcvT0E0U2NsUStR?=
 =?utf-8?B?d3FPdjdBMEJNa05ZQ1RMQnEvR3NXRS94d1U3LzZHNjQwb0JxVCtnbEZ5S2dj?=
 =?utf-8?B?RHY4TlEwa21tMnZlKzRQcnd1ZnZBS3c1VUM5WG5JMDZEYityVk1uSEwrQ2ww?=
 =?utf-8?B?RklLdXUrTkRMd3NJeDJVd2NpNzBaOEorZm9NM250a2kwOWdsUDNzUlBZVUsz?=
 =?utf-8?B?SjBqUGJJUkg3YUJtWWI1eFlXVE5TM0ZLTWtmNDU0azJXYnRIQzFEcG9qYXRO?=
 =?utf-8?B?ZWsxRnBiTmVZNk9sVURiS3c4YzFHOTNDTWZ6SUltdkJOSjl3dk9aZkczQ0FV?=
 =?utf-8?B?bnBaUnVqWGVjUC9mUWtyQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1lsWU5RMkhlZUJEY1JhcWJ1Qjd6eDhYSEZJK1ZXbTlEZzNLOGtjU3Y4cjQ2?=
 =?utf-8?B?eEpoempKZjJqU21xakxVK2tHL1FTQXRYRkdiSUxWZFlscXphRHNoeitEU0Ev?=
 =?utf-8?B?d2VzQk9xbm9Scyt5eTdnSDhOa0V3VmhDK1dJbHFxazJaRS92MXNDNUw4Q0di?=
 =?utf-8?B?MkQwZVhpSUtvMUxoY0ptL3diaDdhaDBra3ZJTEl4V2FJOTRSV2VldG1uTHcw?=
 =?utf-8?B?eVFZTHF4N1dXMFNpY1UxKzhYT1ZqenFCYStlZTg2aldwY0xPRUNKUzhQeUxN?=
 =?utf-8?B?RmJ4MFlmcDFsK3VXUUhNTDdmVlh2ZjM0V214WXgybDR2d0k5MWw3NmZjOTE4?=
 =?utf-8?B?ZDZpazZHWGVJc3o1djNOckdxczk0QXdvOEZraVZzUm5Ub2Y5UnpyNGlCTVVn?=
 =?utf-8?B?V21JbUpJVnEraUNqdUxiTFpuckJKbzB5K2tyK2p3QUFmcG5BVFJiNUNTQUp2?=
 =?utf-8?B?c3R3SUNSTlg4cTZOekErL1pwUnErYVN2TXgzK0lUSlhvaCtnWnF1T3hTS1pz?=
 =?utf-8?B?by9nS3R0T2ovc0pDazZZby94MEVHL3ZwZCtCeXFYN0RReDNTNUhjRSs1Tzhq?=
 =?utf-8?B?Q0hQVUl2dTJnNHIxRUFWQUZscXlyZXhaVnpYZzVNWXlWWm9KOWFjYVdsK3R3?=
 =?utf-8?B?SkNjWktWNk8wU1RLNGJNU1NDVExlWUhmZklIVzlMTHp6NVVUZDY1bmJyWkpw?=
 =?utf-8?B?dFNPZERtdjF5aHBiNWt1QVd6OXFTMW9xZ0h6bms2RmY4Y2R4ZnlpWUp5Qkhw?=
 =?utf-8?B?T0NJdldiNisxNEtBZTc1N1J1ZG0wRUQyb2R2MjlCMVdadHJZd0dTL3QyQkFm?=
 =?utf-8?B?aW5jd0VJb3hCZWM4cGhxWFVzWTlNaGt1eGVMMG1ob1IxZU1ubEE3NTFFTzZ3?=
 =?utf-8?B?V1VEQ1cvWEcvWXdYWlBUU1R1ZStVUGpEb3VPd0tMQTZYUUFHNzhBdmc2SG5G?=
 =?utf-8?B?L3c2cVA2YjM4RHBodUx2cjV1OG5TWnZaYVdkaC9FSkJ6RUQ5ekc1YkxJUEYy?=
 =?utf-8?B?cXdObzFDVzVTcVhpL1VMRkxDa0p3M2lIcGo2enlEUFZtV3NYK0hwMmYrR3RO?=
 =?utf-8?B?VmxKQlBTSVRHWjJuN0U0cXB4RERRL2E4UlpiK1RzTW9XdmlVMjBpeEo5NWNG?=
 =?utf-8?B?ZVpEV0NJL3BOd25McDlkVkc1cGNOOXREdFFyZ0MxelJYcHcyVFZBSnNXZE9m?=
 =?utf-8?B?R2hvS2dqb0FkRjJqYk1HOUJnbWtvc2liYzdVOGZ4b2pURzRoaHRZZnJKWW9E?=
 =?utf-8?B?bXVyaHhmZDZTcFJTeVdycGh3Vi9hUk5yN2ZLTmZodWVsVTRlT3AxajBQT0kr?=
 =?utf-8?B?WXUxdC9SV2dzYW5sRkViZkFUYlJ5TXI3WThvbmJVUjVjYmxDNWpPd0FmYXhn?=
 =?utf-8?B?UFBIcjdjbHZiN1NzNVl5Rk5YbEdoT1dmdWhtbkJtYXltcVZCcGVBSnZwMURj?=
 =?utf-8?B?Y2ZoRmR2YnZueGo4ZFBDU1lWU2xzTHp4YlcxNHQyMVBTbjFkdTZnWUYzdFJk?=
 =?utf-8?B?R0ZlUmhZbU5wSmljRnNoZ3BsOER4QVI2aWNVcHdPa0pLZWQ1VE5Jbng5dHR1?=
 =?utf-8?B?bEhlcmhlOFh1WDBqRHEydXM3YWlCWXpWU2JNc3lZSzgzZ3lndlRKaHpBODZ3?=
 =?utf-8?B?Q0h6alRaT2E1M280bmxUM1htWHlaZkZvSjhkTnVwQ2k2OUlSOEJMUDN3QTVz?=
 =?utf-8?B?ZS9tblYxdjdONDFQZkkxbEhKS3VQeVlhRWRWaDBvbGdIWFN3c29mRXU2YVNk?=
 =?utf-8?B?ZHk5VlNJbC9YS2h1VkJZaEc3a0hrUjJEVjZuVG1NRmpRNEFOai9PTERBc1h4?=
 =?utf-8?B?bW1vcVA1b2dqVlhuYVVpVndWTFRVR0JOWTd1TExQaVNtMmYySTBkQ0U1Tjgx?=
 =?utf-8?B?TCtuRHdGN21kaEU4WlRIYXVJcmhxQkdOTUNDVEtEeVFEeHY0L2R6T2h6b0xh?=
 =?utf-8?B?K1NtQ3NROFFXTHNBZHUxRUVxaUQyNndSRFB2Y1NFRXVrRzJNWTdIbTR6cTVs?=
 =?utf-8?B?MDl1ejBpa0x3MTdGaUJ3RHZPVmtpUElKVUtVMHI4REZmRDZGNGRnYmVBRm84?=
 =?utf-8?B?MmJDblJZbzdpbC82TkJnc3BkQXhKbkpNRmxnSmZ5N1RmczdoWFA1TjNMbFBa?=
 =?utf-8?B?N2RobytCc1JWQmRqdjZDeWVjMDMwSmp2Um95aHBzdG9JMjBrWkw3RVFDQ0Jm?=
 =?utf-8?Q?dz3lVJq8jKeYCi/sG/XB1Ic=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb0dfe8-a376-4672-ec75-08dd704b8bc6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 11:59:52.9520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icX23RynVYpqE7PLqakmShKBW8IMs1K44RvqQKysq3eE6LGtibIe0SFFSxmeR6bWfdTNJnpLIS1DDW89eNSw57p8pr6/h6A+aj5ecUubg50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8899

On 3/31/2025 1:49 PM, Ghennadi Procopciuc wrote:
> On 3/24/2025 12:00 PM, Daniel Lezcano wrote:
>> Add the System Timer Module description found on the NXP s32 platform
>> and the compatible for the s32g2 variant.
>>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
>>  .../bindings/timer/nxp,stm-timer.yaml         | 59 +++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
>> new file mode 100644
>> index 000000000000..41093892c617
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP System Timer Module (STM)
>> +
>> +maintainers:
>> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
>> +
>> +description: |
>> +  The System Timer Module supports commonly required system and
>> +  application software timing functions. STM includes a 32-bit
>> +  count-up timer and four 32-bit compare channels with a separate
>> +  interrupt source for each channel. The timer is driven by the STM
>> +  module clock divided by an 8-bit prescale value.
>> +
> 
> Please update the description, as this one refers to STM instead of SWT.
> 

Please disregard this message; it's in the wrong thread.

-- 
Regards,
Ghennadi

