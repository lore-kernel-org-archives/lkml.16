Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A9F189B84;
	Wed,  9 Apr 2025 07:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182218; cv=fail; b=NOPREaadUhN0lJw2ZfRi5X+mhdOorv1NmUC4pLKmOoMUJfAoKRm35qsX1sQpb3GaTZdJz5kNZn3llFmSY/dnTZpTvyYij2H6+5lUTgTXgN/Yf+N5dYEyCwy7bXExd3uqgi+7PzDWMwXbBBsuY05MezJ7vmDklrnte1PSUcV0ZGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182218; c=relaxed/simple;
	bh=lMS25O/3ua9GXLy1UxadZutqHxLEZ1Kq6c1PN3iqbpU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gGg+vo9hfwa9OIKV/fJwzeo7Egw3wqWzVfCQnmr2CDdOinWL34WKEcSzMa2skngaO0cLRgWOwAK2rYFOT9pB/Rsh+SIcShXfROzkeeDgXo+oGNpFRBVEg/pGHGUG445b/cDIb/C1ij4wTM7z2ZBNTuW1zjtMhVNwl8+OFJFutwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jJ92AD+K; arc=fail smtp.client-ip=40.107.21.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jJ92AD+K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXlz7z7q91AIzSb1yxt8ZQZ3pBTRjANwez0V+YGnZ3WqzzX0qfw44dNpv470SiLiIwCzEe24heaF+8N3sAaRmOzUKzlW36rBgf9s6By/VjZrcpcXFJ6J3IhC8znjZU81fg9j++JeaP4+kHZhX4ql5NEjTXXSB1NxPO1G5OsFl1tGtHvvxf6Y/0lRu2ASuCtHlALYUoh58AwfHwV9nJ06sr90KvE1XOHjm0yP7A6t222GGoB4zjJUYewGXglOCgbpS6ZzeYYOE7vqxS7UMxWf9hZsqqJpfUgqmVa/jHEdwTmENOZLCJ+Hv/x86plZ6cZtDuvDjKNRgkBOHATfY4fQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GreMgXf9Xu8e0W1UuQw/UIC/Jyh194fcwnrGv0eeS84=;
 b=e+lP1wtK8bRFcfbEiSwavdeTBTqI7JDAedTrYWx0Ls1bg1NCZbKm7QrA8dd4pk4WiXKuuGs8wbr1BDb8hZCYHyrGX+6cq/3Wql/QWXB/daAkYFlUJkLrN4qu7+Xmm60YeqfDiVDgrCtFeo1kKC/B8H6jv5u8qPHuNwGhXkOH3X3YVqcGx1pwhdmQQ+UyO7mFiN/EsZCxYxOFOLzGH7lP+8awxsF21tcom2LWYXMSxvGaAIwO5gaPSwYw5kddEMKcY+J89iTroh1C/Q5cxqcj8S1ocPXFGRuv/+MUUrasUw0DSg2xNcYdL/8wxvvggLbrl1059V5tjy8tHjcN17ocPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GreMgXf9Xu8e0W1UuQw/UIC/Jyh194fcwnrGv0eeS84=;
 b=jJ92AD+KfMNw2qJ9Ayy7D1WJ0qgCEGXdcHc/EqAHSCxTggOzoKfOM0IgQNdtZa+JamaOLt9N01Ety68vNHWtOgE6i3CHHnMPwPHsDHIgiWkGKbez+t3flyJEl2NHME1rbi0GM/sOknNm4wPQDnT3a9Tm+yq2qbzPk57menTdJVkTS2HsggYxSjPVNIHtBPgROBH2OoQgCGIIzmwhhKG9454/Nwj4QyYDMDtKrPKvgsPio17Ml/gpM0pHPWsmPIib878x56vBjtOnQp21VmNLtsWm2myZ/Eb3pMl/FR/MRQRdyvF7Z9LmGxt+Sj8HrKRRTlxv/RLNOhQCrmViWyCxyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DBBPR04MB7994.eurprd04.prod.outlook.com (2603:10a6:10:1ea::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Wed, 9 Apr
 2025 07:03:32 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 07:03:32 +0000
Message-ID: <47d24f17-c285-4e18-b0e7-fb6c6381f042@oss.nxp.com>
Date: Wed, 9 Apr 2025 10:03:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ina2xx) make regulator 'vs' support optional
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux <s32@nxp.com>,
 imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, Florin Buica <florin.buica@nxp.com>
References: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
 <dab2f459-240f-4e4c-9bf6-8c0285354cfb@roeck-us.net>
 <4efff19d-b5e6-49b5-9a15-e4af622c6ebf@oss.nxp.com>
 <2a12e6be-c253-4542-86a0-aacb71671ed6@roeck-us.net>
 <1d7318bf-9971-41aa-a952-85367f001c9c@oss.nxp.com>
 <661f972b-cd0f-4d9c-b429-5990edf8f13f@roeck-us.net>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <661f972b-cd0f-4d9c-b429-5990edf8f13f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::16) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DBBPR04MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8833ef01-b9e0-4e79-ed5a-08dd7734a336
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWxvUFo3M01SZFVYWDRudVZYakJIeEtnVlhPN1k5UmpycFF3TDNubytocUVx?=
 =?utf-8?B?OUhwY3FFVGIrZ1VWaVM2QnNpOE5vMFgrbnVJVkdPUkxqdkNqMXBhL1JBTTdj?=
 =?utf-8?B?TnY0ZVpLQm5KNEpxRXIzNHB0VGlOOG9TYkFoYnJYRmxCSzZGOUJpVVlNcXFj?=
 =?utf-8?B?NU9mRTBIVitCb2w4SDdmQXV5aDJBbTBaeFI2MSt5TVZtUzNjTmpwQ2xDVW5j?=
 =?utf-8?B?cGRTRUFRQk9Db3ZBQUQxeHdybUVqc29hSjZpR3o1eVRFK0xZeXpzVEJUb01X?=
 =?utf-8?B?ZWQzMFhPT0dubC8vTUhpUUs0YTNRZklMenFrcm1laytvMktJQ2NzbDBpNVBQ?=
 =?utf-8?B?YjlsaHZPQngzUjR4QmRDTWNWTUpLN0lLR0JpM2dtNWIwUCtHems5VVlLaHps?=
 =?utf-8?B?b2tpcWZoRkF4VHZuUHduR0JwSDFZSCtGd2t1RjBPdUZ0QmU1UGx2UTBYK2hs?=
 =?utf-8?B?RkJha1VnRXVrQU5UaHFBc200TmFjU2Q5QXBuVC9hYURBcWd2Q1AyWFlkblpM?=
 =?utf-8?B?cHlRYXIzMkJjdlYzUFBsTXp2RkZYUHdGTi9QeDB5d05MUnlpL3hWUW5MYjVI?=
 =?utf-8?B?VTNJazgzdEJmMHozTW9FZmxpMmtaV3hyNnJtRytsMTJaRXAyVXg5YU5yVUpG?=
 =?utf-8?B?K2svcVMrNXJ5OTlqc1JaSnllMlFMMkNHZDNYRGdwUGpRblhzOHRHeXhVdmFZ?=
 =?utf-8?B?K1FVRUE5VFpPUXE4dU16MTkwVG1ia2FXK3lnOE1JVnVjdzZaM0dWNE9OMDVk?=
 =?utf-8?B?Rm90SUdDWFV1YlpLMnFOWkFReG5DYldSR3Z1ejF5SkZxalNJbzJ4TDNrY2J1?=
 =?utf-8?B?WkxUWnU5azZHZ0RKNllNczhMSWE2Ny9nRVNHdXowYnZGb2dGSlRUdVk4T1l0?=
 =?utf-8?B?bHhxWnQxMFAxZzQ3bnFSZy83UVdWdXhnOGFVU3FrVTRZcU94aWREOGVYL1da?=
 =?utf-8?B?ODZnb2xOL0UzT09yZHF4TVoxU2RCYnJ2ZEw3SHZYcmVNLzV6WVd1SnFNTldV?=
 =?utf-8?B?MFpMY2JCazhkeXRDeE9mRGtRZkF6RU1lTm81RzZMcDg1VURVcEFkUGY2cjFo?=
 =?utf-8?B?bkQwb096emtHSzVKWk9ObVlJd3hzSGFxS0EzYW1NUWVhSWFVRHV6Wmc4ZU9X?=
 =?utf-8?B?d1U3Z1FrbGFhRTB5YkdUSTFFNjNHai91c0lZMzdWU2ozdTArNEN3ZTkwYlV3?=
 =?utf-8?B?WTRVV29zYmRoRC9YQkhoQlhTQU5rUTdoZzIwYVFzdjJKa2NreWp4ZnNzNnph?=
 =?utf-8?B?T3JDTk50eG9WODJJanE3bkt1S2IvSHJRN01OTEV2aCt0bmFxc0JianY0M3JB?=
 =?utf-8?B?QndoWjdTY0R1dzN5WE9VZC9oSlU3bkpPNkk3Q3RpY3BzeHI5SGtSNjBDTFdJ?=
 =?utf-8?B?Q3ZMOG8xVVlZWHJFU0NKYWxGQ2VNaTMrV0FHNDJQaWJhMGhvUVhSQUs1TU5Q?=
 =?utf-8?B?L3JxQmVjMGJlVWtmYXhESDQrUG9oNUJMOTFrRTZsUTJOVlBlOXJ2dUxTcHJp?=
 =?utf-8?B?eTV4VGdJY1BPMWoyR2VQQ2Z6YUNhN1IzdFFPcU1OTGdRb2ZIZjFPdVpYK2cv?=
 =?utf-8?B?aUJzOHR5bVordkZyUEhuejl0Y3pJRFFQNUF6aTIrRFp0aXNLMmlUWWd2eCty?=
 =?utf-8?B?ZUttS2VMeVZVR0JpYWlQZEg4WkNMemF1WUpPL1FDUkVDUE5BMXgwMlgrYk1X?=
 =?utf-8?B?YVlwUkRhYk00bVAxOHg1ZUM1K21DaUdpK0lHT2RjaXp6RWg1VmJTZk8vU3hk?=
 =?utf-8?B?bHRucm9peTkvdkhQeUU3VFcvbzhlWG9QZzNNOGpDS3NmejgveXZIUmFha0Za?=
 =?utf-8?B?TzhyOGROckRaRHVJd1MxM1l2QzN0MXJNNGNNRXNqOFl4SzJYTk1lKzA1L21z?=
 =?utf-8?B?M0lodkplTVRkQjdZak5pczQ1eVJXakpKaERwWFVjOXY3dWFqYW80dWx1dlEw?=
 =?utf-8?Q?FoNl5I5aUGM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlRFbm1tQ0JiU2t5Yk9PZjlEMXdqK0ZQTXlKdjJTeTlITFdvaXkzL3BRMTBv?=
 =?utf-8?B?c05udGlpZmJreS9kWU9QMGtlai9wZWFXRGdrdDBnUUg5azVJTnNOZTVqYnF3?=
 =?utf-8?B?SEo1Y2RIZEFEb1VNclNnd1cvVG9TYlpxVmU5Z0E4NGhYWDNTT2ZwT3VLRUR2?=
 =?utf-8?B?OWQ3cnFRYlRGUm56dUlpeDZQeEdLMy9rRXpLNlArTjhOQXhidm9xcjJEK0Vx?=
 =?utf-8?B?UGR6aHZlalZqNGJqWjJnZU8yWW9UOW1qeUxIM3VXeUFiV0hncUVIcEFBTUtF?=
 =?utf-8?B?MEtYNXVUQ3Z0eFJBekhXdVgveEtCN0tIbUZ5TkFUQlJDeW5ZTHlqY3JyYmMw?=
 =?utf-8?B?MzF4eTRqSERIeHlqK2RiUzRna3lEMEZyK1lyc3dDVG5GSG9RSUswVFU0WENS?=
 =?utf-8?B?NXFQL3BwODRpVlZTRk84TG5WQlNiMGxzM3AybVl4dHBYU3FzYWRzV3F1d1Fn?=
 =?utf-8?B?TlU1K2d6UDVOZ3FhcFZ2QWZXTUlhcEVMall4Qlgxa0w3Yk5iMk1ScEVsVm13?=
 =?utf-8?B?NEVhcTNBOE1qRkZieVFDNy91QmtMaXNkZWNBc1JrcmhMZGxXUGZYRUdMSzdE?=
 =?utf-8?B?SHRmSzhtOWlNQzg4eUVLRE5CbHRqejY3RVdOUHdSQU1iMTdJbFEybjZCVlZw?=
 =?utf-8?B?Q240M2hZV1lmek41VDJ0SWJLeWlMc20xNzdHNDcwYUZIZEQvdk05NHBsNVp0?=
 =?utf-8?B?aUxHaGNqU2ZEWXZKNEh0QWIyVkNJYldRZUFTdFg3ZnBpNlU2WXkyMlhEWEJB?=
 =?utf-8?B?K0pTTlRXRHlLSXdzNkVGZS9WZ1BTenVad1A5dG9ZVU5RbGdGSkhvY2MwRXRt?=
 =?utf-8?B?YzFwbWk4WXlIalByQ2w1NXhmaSt0TVdUNzN0b1NFSGY0a2dXR0o1NmJwbEFE?=
 =?utf-8?B?REw3Qm5PMGM5M3orbHhtRGk2ckJLcWx3TnNIMEIzSldBU09sM0lQSi9IaVJK?=
 =?utf-8?B?UGFwYTdQdHpkbTNZOG5hZGFZTHhPTHdXc0RRYnVXVi9JdmFMWXYrWllhQ3F6?=
 =?utf-8?B?a29EN2hzS1ZVSE05aHVxc3pVcWlaQmpzMjhNcVFhNy9pc2w2UjVaakw4Z2FQ?=
 =?utf-8?B?QnZseENZSUJXenF6c3hPWWNtZVRHZnlseUJLQjhEaWYyQWw2TCtyaGdrWkRC?=
 =?utf-8?B?blFOK0JIRlRtYTBGSW1BOVJWMUF3U3QvUERydXFGVE1KV1B6bmNmQk5KSm10?=
 =?utf-8?B?Y2xDZ1VEd1gxc0ptNElHUVp4UXdkZ0hvNkpSbGppZzR4Z1loRmExSVFhdXoy?=
 =?utf-8?B?ZzFGcjZNdWNGMmttSmkvUC9yUDdzSUc2ajBuTGJ1WXJZb29XWVZkTmhGUk1W?=
 =?utf-8?B?SU9xTFJIRUUyZy9zMVdDeTFycEE3MzRSWm5wMWNkUktaTjdZRWQ3OStWSTVy?=
 =?utf-8?B?dFBkbmlsa3BvRVlsQlN0dWFqWndKTDlzTGpJVVIxSk1iVDg2N0FMYnZncWl4?=
 =?utf-8?B?eEpCa1FMQlhBVGlmbHcxRjdqdU4rOGFKNHN3MEI0bzVVQlV2NDBiUDhRUVl6?=
 =?utf-8?B?cnhwdWNkdThjQ3N6WW9KZDM1dFhiK2NsRFFvZkZnR1hrYW9pL0lzcUNBR255?=
 =?utf-8?B?LzhKRFlxV0NPU2NYcTFqOXJEeHhKNUsvcVBjNTBOWWRaSkFxRldWN2MwanhT?=
 =?utf-8?B?SmtqbUd1L2t3OXdoc3lYdGZkR2JnbmhXQjl1bkV4ZWo4a1ZGSUhBUXgvaFJC?=
 =?utf-8?B?YUtkM2RhbWJvNVE0MVZZcEJGUm9FNGpaWkhDK0k4bDlVYkN1L1R0QjJJL1lU?=
 =?utf-8?B?V1hlZmZLVVMzYi9tVmRvZXh0Mi83ODFrV2JJTVdJSXJWcHpRUytOQ1I0akxq?=
 =?utf-8?B?VFIwZ3g3dEsrN3VOVC9WVHFtbXZSNm1UQTBoanpmMVQzTXkxNkR4eWlobXFo?=
 =?utf-8?B?a0V5dkRUSDNwcG04V2tMdXVheWttWWZtTUVDVG44THkxcWY4cGtQODlMK3k1?=
 =?utf-8?B?RDIxRDBUVExHdDVWVWdGTlBUb1kxQ2FxdTdKVHVzNGlqTkxUMjBqMTdPOXp1?=
 =?utf-8?B?amJMRmxxNXFDSEE2Vk55emcyT1c4bDdHdFZDRHFkVFRYMnA0RWtiaFBocXo0?=
 =?utf-8?B?OGZZM3ZGN2JtU25RK09oZFhaQWNBaC9JbC92Rkh6bjBqQlB6OFVYRmhRT1JZ?=
 =?utf-8?B?d0MyTkJLTlpJV0VqU25MMnFZKy8xTkJ5aTNBaXBWY3BPUXFyb2hJbExucW5W?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8833ef01-b9e0-4e79-ed5a-08dd7734a336
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:03:32.0488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpbPIl9NizVQEl69S6yjxDk7OpPZ6Edt6MMKn9FNf5wOEosLRFeKGrcYeDW+pmKjT8HseUMSMymasZ7JlXPksM1LYadfLZsA8FIaTS4D4ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7994

On 4/8/2025 9:07 PM, Guenter Roeck wrote:
> On 4/4/25 01:36, Ciprian Marian Costea wrote:
>> On 4/3/2025 7:06 PM, Guenter Roeck wrote:
>>> On Thu, Apr 03, 2025 at 05:29:26PM +0300, Ciprian Marian Costea wrote:
>>>> On 4/3/2025 3:15 PM, Guenter Roeck wrote:
>>>>> On 4/3/25 03:15, Ciprian Costea wrote:
>>>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>>>
>>>>>> S32G2/S32G3 based boards which integrate the ina231 sensor do not 
>>>>>> have a
>>>>>> dedicated voltage regulator.
>>>>>>
>>>>>> Co-developed-by: Florin Buica <florin.buica@nxp.com>
>>>>>> Signed-off-by: Florin Buica <florin.buica@nxp.com>
>>>>>> Signed-off-by: Ciprian Marian Costea 
>>>>>> <ciprianmarian.costea@oss.nxp.com>
>>>>>> ---
>>>>>>    drivers/hwmon/ina2xx.c | 4 ++--
>>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
>>>>>> index 345fe7db9de9..ab4972f94a8c 100644
>>>>>> --- a/drivers/hwmon/ina2xx.c
>>>>>> +++ b/drivers/hwmon/ina2xx.c
>>>>>> @@ -959,8 +959,8 @@ static int ina2xx_probe(struct i2c_client 
>>>>>> *client)
>>>>>>            return PTR_ERR(data->regmap);
>>>>>>        }
>>>>>> -    ret = (dev, "vs");
>>>>>> -    if (ret)
>>>>>> +    ret = devm_regulator_get_enable_optional(dev, "vs");
>>>>>
>>>>> devm_regulator_get_enable() should provide a dummy regulator if 
>>>>> there is
>>>>> no explicit regulator. Why does this not work ?
>>>>>
>>>>>> +    if (ret < 0 && ret != -ENODEV)
>>>>>
>>>>> Why this added check ?
>>>>>
>>>>> I know it used to be necessary if regulator support is disabled,
>>>>> but that is no longer the case.
>>>>>
>>>>> Guenter
>>>>>
>>>>
>>>> Hello Guenter,
>>>>
>>>> I've just tested and devm_regulator_get_enable() does work as you've
>>>> described, providing a dummy regulator.
>>>>
>>>> But, according to the 'ti,ina2xx' binding [1] I see that the 
>>>> `vs-supply`
>>>> property is not required. Hence wouldn't it be correct for 
>>>> `vs-supply` to be
>>>> optional ? Using 'devm_regulator_get_enable_optional()'
>>>>
>>> Yes, but the reasoning you provided is different and suggested that the
>>> current code would not work. Since that is not the case, the change 
>>> would
>>> be purely cosmetic. Also, I still don't see why the -ENODEV check 
>>> would be
>>> necessary.
>>>
>>> Guenter
>>
>> For boards such as S32G274A-EVB, S32G274A-RDB2 and S32G399A-RDB3 which 
>> do not have a voltage regulator, 
>> 'devm_regulator_get_enable_optional()' would return error value -19 
>> (-ENODEV). Also, other usages from the Linux Kernel seem to perform 
>> the same error check when using 'devm_regulator_get_enable_optional()' 
>> [1], [2] and [3].
>>
>> This patch would help in S32G2 and S32G3 to not print an unnecessary 
>> kernel log warning hinting usage of a dummy regulator when such a 
>> regulator is not required according to the binding.
>>
>> Would you like me to send a V2 with the commit title updated as follows ?
>>
>> "
>> hwmon: (ina2xx) make regulator 'vs' support optional
>>
>> According to the 'ti,ina2xx' binding, the 'vs-supply' property is 
>> optional. Furthermore, S32G2/S32G3 based boards which integrate the 
>> ina231 sensor do not have a dedicated voltage regulator. Thus, making 
>> regulator support optional would help in avoiding any unnecessary 
>> kernel log warnings during boot.
>> "
> 
> Make it:
> 
> "According to the 'ti,ina2xx' binding, the 'vs-supply' property is 
> optional.
>   Use devm_regulator_get_enable_optional() to avoid a kernel warning 
> message
>   if the property is not provided.
> "
> 
> Then add a note to the code explaining that the check for -ENODEV is 
> necessary
> because the regulator core returns -ENODEV if the regulator is not 
> available.
> 
> Why it makes sense for this function to return -ENODEV if an _optional_ 
> regulator
> is not available escapes me, but that is a different issue.
> 
> Guenter
> 

Hello Guenter,

Thanks for your review & suggestions.
I will send a V2 patch.


Regards,
Ciprian
