Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A02626B740;
	Tue,  1 Jul 2025 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367435; cv=fail; b=K6eQs6UE0jKhrVQGPZzpMIHDOAkwR59AzOaQd3qQ6kcj56me8oeYgOEENGg8Dm3wKINF7ljlCEoxxpipi7Koovv4KuhBcW+Dnhmfp3dhqeeW6A2P/0QgBUS1VXnvHv5WbwTtXF6SwxrquJqsrwqtPD44q+OPM1Shdioj1jJUBrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367435; c=relaxed/simple;
	bh=I8IVbUxBQCZrjKFJq+eTurooB4p3RUOQ7zrMvMMWCeg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SInNbGTO2UBH0JZ2knWsipapNSnTQWjTmzEUHZ2zBpTpoAvn1XoVaE6Tlv87ZTUbUgDl+hqdRVYtBC1c31JkW0RLJIneZqNoIqVzdvovJKyCXuKk7QBDhYQmJUiJXTr9/7Ypxg+qZF7Ht5/KCoiowobEgVz6bUZIcbq7UYWx29g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=HCFp7nwY; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="HCFp7nwY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbYf9bHfI5GswMZzcyyOvJIeDB/oS/kIwpo5z9xjfKwT2gAu0ymvN7aLYQg4GzXmy05i6C6uBFIscozHwsFuqAhDhJyp8X1jPzyvqXMbhPEv6KcSsIFs6UmYq9EmoYtv5olWO7uYNI3zfg+nIBeJr1lzc6oTgo+4IthLO/NukpFFh84/XlkEs6y0bd8a2EgEmtT3pW0IenpzQcMQWic1IvCfiX30Q9cYoeD24Y05V1Cuj01iulF8Eqi7o8B+xCprfgUvRDvVo2nRBPN0vvaf1xnyrpjBoKgz8xNDT0r1GbWI5PJ7U7+531SsE/hbDoheSPmaCp2+ClT5LWhh9ymtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8IVbUxBQCZrjKFJq+eTurooB4p3RUOQ7zrMvMMWCeg=;
 b=b85yoPj0R8FWW++GZbmzscyp+ktxfVAj/1X+NT18ukKUsniKHa+VuWevbMvwPsv6VA6w0dsuFUCwoO+a/z5XXpi0NgCiApAP7JVudZ9JQACNdsnhpC4bp3XtgfxaIPKkKnAVEcHVqPyZr0lCy2HuThhRB+Gz4w0mMp0wuYq3ypOqG8pBgl508TijFiJXMKkPLJuN73n76udLmzum/ohw3SXoysYmfBUpOcsCRT+4D7mD7YFAVWno43+3hOgX8IjapvQz0lX5qlPgYXyPHsuwjIo62lSZXXNn1y8Ifpw6TxmUOMNeDrtAvPnatmPzLMJQnMTVNFlXN6/MD7IgnVMgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8IVbUxBQCZrjKFJq+eTurooB4p3RUOQ7zrMvMMWCeg=;
 b=HCFp7nwYeXv5kwFl9pDvtDMKT0UqHBHwk6vLui0D3frxh7mEuXUUp5au0P+T4w3PDdbzrJaMi1+JrEFL1ojknF+bgOoz0nJqu0rK0jvBczsh46zW0RvRzCqCoKFcW585L4SfPqrspKRsxKEM6ACC4fkVrhqqljiIpRkbvvxnEElelIwXhcvTw2gv9ootOnsq3L+p6hJoS/AHcuOBj1NeSUmA73i+GdgnwAp1dmPexTMozG2Vgyu8/c3ICEInEdAm/EsmH/8i1WyJhc9Nz+NjQtbGR4isbA2P5A7gNjpKzQyhAzfJJZWYsHYgJ/bZoFg7XHr8fCU33w9oOt62KvI3vA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AM7PR10MB3558.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:133::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 10:57:10 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%6]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 10:57:10 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: "kristo@kernel.org" <kristo@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"nm@ti.com" <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-pinctrl: Introduce Schmitt Trigger
 macros
Thread-Topic: [PATCH] arm64: dts: ti: k3-pinctrl: Introduce Schmitt Trigger
 macros
Thread-Index: AQHb52VpueHUCmCy4UKbBFPM19oeUbQdHv2A
Date: Tue, 1 Jul 2025 10:57:10 +0000
Message-ID: <679f42499eb87ae8124e1bed79d2e73ef0eb992a.camel@siemens.com>
References: <20250627131332.2806026-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20250627131332.2806026-1-alexander.sverdlin@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AM7PR10MB3558:EE_
x-ms-office365-filtering-correlation-id: 4aaddc06-fe63-4209-bed4-08ddb88e0767
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWRHVi9WM05OY2dGczVkTnpmb1FaTVkyMkZWL3dXdU12UUZRTHFXRTNSNGJw?=
 =?utf-8?B?UHRSdC9sbjlUbkQ3elpOdGZESzJSRGwrUkNWWjJ2MDR2WVNkYXpxeElZcUhx?=
 =?utf-8?B?ZlVrajRPVjR2cUhXaWVaMnlrdHl6b3RjR05zRktGM0dPZExrNDBhK3Y1YUFB?=
 =?utf-8?B?WHcwU25Lc0hhQko1eFlGaTQzNTdGQlJlY2VVMm0zT0pDaFVoS1dFUU9kdGho?=
 =?utf-8?B?RUFsM0tRWWxjbU1mOHJ3YXd1MEdPNlJGUjJYZUhBWmQrLzJZVlFkUGErT3hh?=
 =?utf-8?B?VEsyY2d0RC9ydUc4OUtMZ0EvZHhXWVIxS0V0azNGWlN6bFlvVjhtUmR2REpt?=
 =?utf-8?B?TUpmdVF0bTA1T01pSDNLSGhaRWtoVnVtWm9vT2dINTNWSm9wVmY2a2JkdGww?=
 =?utf-8?B?dVJKT3p6alcyMk90RjZuTDV1bUlvdmpqRTdDQTE0RXQ0TnpyYXhNR3l6UjVR?=
 =?utf-8?B?Vnl4TmZyd0VBK3ExYnZkd0gvMU5KVDVNQWJtM0k1cnpYTHV6VmQ0SUdWY0hu?=
 =?utf-8?B?dVBLOFRESjlyb2RRTUtpb28vTGtaeWJVZUFjN1BSaVFhaHV1c3hna3FQU0Vx?=
 =?utf-8?B?OTZLMFVwK3l1c09ja0I4NzlsUDNkVDd2Wml5YlV5VjlQanhsUjdFQXFYaWgz?=
 =?utf-8?B?TVdJS0p2SU9VbmtqY09GUWkzTzZSR2ltU0krUEpvNGY5WEgwRnhMS2o1OFdE?=
 =?utf-8?B?ZkEyWmtnZ1FsMXo1U01QU001eDN4eEZJbjVBaTMrbFEyNHNuSHlXQnkzaEl2?=
 =?utf-8?B?Q1lCZGl4Z0xZNWFyc3gwTE51Z2ZKMzFPU1NBeUxrNFVjbWpiRlhLcnBlUDlG?=
 =?utf-8?B?Nkc2bnJqcnJTbkRJV3JXa0E0Szh4TmFzS0IrTzFhSkgxNTlPTW9MMlRvcGNC?=
 =?utf-8?B?RGRZdDlTSlJXZ3ZaYVdkRC9MVGZhR3o5QjFUSGM1ZmpXbGtzQ09UdnhBYUJm?=
 =?utf-8?B?NWpTWVNkeTZNYWtQbUpXWklFSDd1ODF0NDlXaFN5Q3NsbWlNNGU4WGhxQTZh?=
 =?utf-8?B?TlFkN0VmVHdkUFIwUnBxdUFrdWp5Y21CaEZCKy8xVmlrSDI0MGRvYys5VWRT?=
 =?utf-8?B?YUFWV0pBU0ZBdHVGZmY3d1V2T1JLSW1USGNxaitXbmR3RHhPbjFMT0k1RU9n?=
 =?utf-8?B?eWlvNGNqOVZCTmpBcEgrbkJRV1M4STRXRTZGT2RWTXZuTTdGWnFvME5JQjFW?=
 =?utf-8?B?b2tFbGFmN1dlbTFCVjdQM3RRUEdaVU83WnFpckovUGJrNTJscUdZdkpPQzdZ?=
 =?utf-8?B?WmROR2Y3UFJOSUVRNWs3cXppemwwWGYrTWtRaCtLUkp6c1puNWRKaGtOcEw4?=
 =?utf-8?B?VlZYK2xvdWVFOHMyNVdoSEQ1dk5SelMzS2VJUFVSN0RVMERudnJPZW8ybXU5?=
 =?utf-8?B?RVJZblU2Nm02Ti83YTQzSkFCd091VkNKU1gxakRLQzBkZjl2L0M2K0xQQ1RU?=
 =?utf-8?B?cmp6cUJuL0ZPNDkrbkNSWE51eFhURGtySElIZFNkNWRtS1JlVEQyd05kYld4?=
 =?utf-8?B?OHRhZUZTaEdOWWg5akl5c3RRcFpDTlVxdGRMaWRSWFJ3eUtBNTFJWVZuSHJ6?=
 =?utf-8?B?RWpGaVZDQmFLTzQrWStlWWkxUHpsNTVZdlZUTkt1WnRIY3lwdzlJYU9EWTc3?=
 =?utf-8?B?MlRoYU5QNjBmb2JOSEN5QU1yR1QwZGpTczJIVEJuNXhyeW00Uyt1S01LT0cx?=
 =?utf-8?B?VDQ2TVhkZFJtNDV0cEtBVUk4L1JuTGJ0eSt6QnZGeHNuVzlUZmUvYXFVNTFX?=
 =?utf-8?B?OE9WaExSMmROcTdLOWpqdDBJNGtqUkVMWjJMYk1GclQ5QUs3TTBxU1NBS3JD?=
 =?utf-8?B?N2FjaDlGdVQ0WkdvbjNKWEMwRUpQUE1uZWpMajJyT3JMZ3JIZzc4blVlTGxF?=
 =?utf-8?B?dGR1V3lOSWpZTkpCSGpudTVvdTNwNzJDZ1RVNGtvank4MVp0d1RJRE9OQ3ZV?=
 =?utf-8?Q?MLGYH2r52iI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUNUbVJWdko1ZXNlU2dSL1VUc0E1bUEwdTZpQlVkd3dtZC9zNHhmakR3R3Z0?=
 =?utf-8?B?bjlnT1dNczFiaWdKMWNubE0zK01nWVU5SXR1ZXlVVFV3MEpCU215RGJsNi9y?=
 =?utf-8?B?cnhBT3FDekRTekk4bnZPWGdySlBWTWUrN3J3Uk1jMnZhY284Yjh1WjUvMW40?=
 =?utf-8?B?OWdWNzZkOHVyYTZxeHVscDBsZXI3WnlqaER0MXY4akFDeVNhdzJGN2dGYVdV?=
 =?utf-8?B?SU9yRWpPTWRQOUg4dk03WXFQblBiR1M2Y0tneFhwczgxdWtaZnQxVUFIdDMx?=
 =?utf-8?B?SWdWNVduVVVIK1JDVlJhaHNVcUllYjdhUURka1NKc2ROS1pnSUVaZ2ZHMS9u?=
 =?utf-8?B?a3hrQU1GbU9vY3pPSDh1YmZIZlBRamdFd2tsSW8zMjVsWVE1a2RFTW5GYmRT?=
 =?utf-8?B?L0U2V2U4dTZsbFJpT000TDBCL0JHcW4xUnp6REVVcXRzVzFmd1llTGNWY3d6?=
 =?utf-8?B?UmZJVkViZFN2a0o5NzRXV2lDY0M5N29ESys2UUF1RUtwamhKK3BKcmg0aTR6?=
 =?utf-8?B?Z3R6UDhOUmZZdDFaRXFrd2JWa29RV0hUeGVwVVVUS1BFWGdRU2N4MU5LaFBq?=
 =?utf-8?B?aFRzUG5Oemo1STBhTmo1TlcyYUQ1ZUxTYTZrNWZveVcwOXpsQkNxSitCTEcx?=
 =?utf-8?B?Q2R4WnFlZ25PNVZyTnRTbFZRVmdXZ2x0UFVaVHhnQTdnbUtYQy9Bb1JUTnV6?=
 =?utf-8?B?YlExRzlkdzdoYkw5cVlOUEI4R0p3dCt5VVNnTnF6a1hOUDY5eUV0L01aV0dC?=
 =?utf-8?B?a1hZc1ZzdDhwWmJPcG1UNTY1K1plUUlSamhnbzRwb0t1N3NwV1kvOEN4MkFZ?=
 =?utf-8?B?akxxaDZrVUQ0YWJncWlHVTJ0ZTFCazEvUXM2Yi9RY25ZYnlITlpWMGZUZVhQ?=
 =?utf-8?B?UkRzNThKTWZHeEFRWjkvaGpFWk80eDZlVThHV0pNV016T2hkV0NsUjZWc3lK?=
 =?utf-8?B?dzlLTEVoNFNhenJySC9udU5tN1FwdzYrY0hVR0FWTXFSWVhIalEvTFZ1SUt5?=
 =?utf-8?B?VE9udDVOVS9OeFBtZUNMUVhTT2RzSGRWRkpVZ1o4MXRuTm1kaXlJb0FhckVi?=
 =?utf-8?B?MU13d05SSnJJMXc3U29GTlNETmhvNDU5OHRxKzRwaDVXSUxoanpsSkQxUUwr?=
 =?utf-8?B?VGZwZ2xhbkRZRE05SWU5eDY5L0I0bGsxNmNRaUc4dzlheDJSL3l6MGdIa0Nq?=
 =?utf-8?B?NGxRbUpHL2JzYzhBcGxhVFdPMDliVEl3M1lZWHRjTGV5Q2s2LzVHNndSUjg2?=
 =?utf-8?B?UEJ5cGJJd01sdW1rMlA0SVY0UlB2bnNLUGRmZUFnUkt3L1FDaGhwNlVTcVBi?=
 =?utf-8?B?eGc2RkMxd3VXTFowdFV0d0tOY2RPM2ZLR2I3V3RySmlraEVwS3RsME0vVWs1?=
 =?utf-8?B?M3dQcE12N21MQkd6Y2taUEljd29LdWQ3WjVGR05XWGNJazBiNjFhMG15bFIx?=
 =?utf-8?B?aXJ6a25nMmsxYzZSV2V6eFdmd3ZYTUFtZUsyT0k0Q1ZTblhOMnU0ZE0rdytx?=
 =?utf-8?B?VXNaUDN0YnBETG84MnNLUkh1T1NJeEpJbi9STXVSeE9vUThTNDNmaGRDWXgx?=
 =?utf-8?B?bkhGV1RTVFo1bmVuNU1mMzBVeGI4M1ZTTTBsaXFNOERMMGgyYUhZa2w0MWRL?=
 =?utf-8?B?VWZGalI5anJNTTJnWEl4YzNSdmY4OHhCZDVRN05pc0FXS0d6RnJ1ODM3cXNo?=
 =?utf-8?B?czVQWG5ySzJ5dU16ZGpQby9oZmo5Q3VrUy96NitxWEhObUpQdjdGMXJEeTlM?=
 =?utf-8?B?V25UTjE5NlYybTFPdExWaDBQTjJzM2YrQXV2VklaSEFjU3ZGQkRsSUFnekR0?=
 =?utf-8?B?VFFhNHlGVHpCUldXN2tIa0R3NXlsTFpUcFBYSEdmYm9kd2RTNEw0UWNDWitu?=
 =?utf-8?B?U0JIKzVHM0FJRjFVSHo5VzZjNzdSd2NFUFdXdHVybHAyeTNsb2ZITGJqdkcx?=
 =?utf-8?B?OWNLNExtRy84Zks1QmY5WmtIVHdXVkUwdG5qOUk2c0ZiM0tLOE0yM0IyTU1x?=
 =?utf-8?B?ekUya2RiS0lRT3hWZFB1VE96RERiWE50Z0xocGVTS0VGM0p6Z0lNQjlGU2lr?=
 =?utf-8?B?ZnhBZE4vZ1NlMVdNaW9EOEZMWmFMN3VIb29QcHd1Z3FSby9Ka21RZ29EcEsv?=
 =?utf-8?B?ZDVRUm1hUE9kVGV6RGVxcU8vcmYzM2taWmVCOGRBTDJTMk9nTk41cld5Szlu?=
 =?utf-8?Q?HpOqP4yNoaECoPNy8qgWkX0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D6E414BE1352944B4D8ED1899CCAD6D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aaddc06-fe63-4209-bed4-08ddb88e0767
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 10:57:10.5525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXjs2kSwASr0JDnRBgzyrsvpkQxFU3+08T/UqPfLciaQp+TA87Sq3XqZlUt/tybUcWx7jHP1h4zYBqYgLBVs9NKLGISZQRET8FW8XZPaTQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3558

T24gRnJpLCAyMDI1LTA2LTI3IGF0IDE1OjEzICswMjAwLCBBLiBTdmVyZGxpbiB3cm90ZToNCj4g
RnJvbTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+
DQo+IA0KPiBJbnRyb2R1Y2UgU1RfRElTQUJMRSBhbmQgU1RfRU5BQkxFIG1hY3JvcyBzbyB0aGF0
IHRoZXkgY2FuIGJlIHVzZWQgaW4NCj4gY29uanVuY3Rpb24gd2l0aCBQSU5fSU5QVVQqIG1hY3Jv
cywgZS5nLiAoUElOX0lOUFVUIHwgU1RfRU5BQkxFKS4NCj4gDQo+IE5vdGUgdGhhdCBLMyBtaWdo
dCBoYXZlIHF1aXRlIHN0cmljdCBpbnB1dCBzbGV3IHJhdGUgcmVxdWlyZW1lbnRzIGFuZA0KPiBh
bGwgaW5wdXRzIGFjdHVhbGx5IGhhdmUgU1QgZW5hYmxlZCBvbiByZXNldCwgYnV0IEFNNjJQWF9J
T1BBRCBtYWNybw0KPiB3aWxsIG5vdCBwcmVzZXJ2ZSB0aGlzIHBvd2VyLW9uIGRlZmF1bHQgY29u
ZmlnLiBUaGVyZWZvcmUgU1RfRU5BQkxFDQo+IGlzIGVuY291cmFnZWQgaW4gbWFueSBzaXR1YXRp
b25zLCBlc3BlY2lhbGx5IGlmIHRoZSBpbnB1dCBpcyB0byBiZQ0KPiB1c2VkIGFzIElSUSB0cmln
Z2VyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIu
c3ZlcmRsaW5Ac2llbWVucy5jb20+DQoNClBsZWFzZSBkaXNyZWdhcmQgaW4gZmF2b3VyIG9mIHBh
dGNoDQoiYXJtNjQ6IGR0czogdGk6IGszLXBpbmN0cmw6IEVuYWJsZSBTY2htaXR0IFRyaWdnZXIg
YnkgZGVmYXVsdCIgWzFdLg0KDQpbMV0gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjUwNzAxMTA1NDM3LjM1Mzk5MjQtMS1hbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20v
DQoNCj4gLS0tDQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy90aS9rMy1waW5jdHJsLmggfCA1ICsr
KysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvdGkvazMtcGluY3RybC5oIGIvYXJjaC9hcm02NC9ib290
L2R0cy90aS9rMy1waW5jdHJsLmgNCj4gaW5kZXggY2FjN2NjY2MxMTEyMS4uM2UzNzFiZTdiODA2
MiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy90aS9rMy1waW5jdHJsLmgNCj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy90aS9rMy1waW5jdHJsLmgNCj4gQEAgLTgsNiArOCw3
IEBADQo+IMKgI2lmbmRlZiBEVFNfQVJNNjRfVElfSzNfUElOQ1RSTF9IDQo+IMKgI2RlZmluZSBE
VFNfQVJNNjRfVElfSzNfUElOQ1RSTF9IDQo+IMKgDQo+ICsjZGVmaW5lIFNUX0VOX1NISUZUCQko
MTQpDQo+IMKgI2RlZmluZSBQVUxMVURFTl9TSElGVAkJKDE2KQ0KPiDCoCNkZWZpbmUgUFVMTFRZ
UEVTRUxfU0hJRlQJKDE3KQ0KPiDCoCNkZWZpbmUgUlhBQ1RJVkVfU0hJRlQJCSgxOCkNCj4gQEAg
LTQ0LDYgKzQ1LDEwIEBADQo+IMKgI2RlZmluZSBQSU5fREVCT1VOQ0VfQ09ORjUJKDUgPDwgREVC
T1VOQ0VfU0hJRlQpDQo+IMKgI2RlZmluZSBQSU5fREVCT1VOQ0VfQ09ORjYJKDYgPDwgREVCT1VO
Q0VfU0hJRlQpDQo+IMKgDQo+ICsvKiBTY2htaXR0IHRyaWdnZXIgY29uZmlndXJhdGlvbiAqLw0K
PiArI2RlZmluZSBTVF9ESVNBQkxFCQkoMCA8PCBTVF9FTl9TSElGVCkNCj4gKyNkZWZpbmUgU1Rf
RU5BQkxFCQkoMSA8PCBTVF9FTl9TSElGVCkNCj4gKw0KPiDCoCNkZWZpbmUgUElOX0RTX0ZPUkNF
X0RJU0FCTEUJCSgwIDw8IEZPUkNFX0RTX0VOX1NISUZUKQ0KPiDCoCNkZWZpbmUgUElOX0RTX0ZP
UkNFX0VOQUJMRQkJKDEgPDwgRk9SQ0VfRFNfRU5fU0hJRlQpDQo+IMKgI2RlZmluZSBQSU5fRFNf
SU9fT1ZFUlJJREVfRElTQUJMRQkoMCA8PCBEU19JT19PVkVSUklERV9FTl9TSElGVCkNCg0KLS0g
DQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K
