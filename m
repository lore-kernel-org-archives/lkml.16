Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C8D1DF260;
	Wed, 16 Apr 2025 06:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786663; cv=fail; b=VoKpy89UcJZ2jbAC0YTsxgTJu1cnIEPCj0UVluzYM7nCnc/wJU4ZfuhjiK71Z7+iakORMo+hKjIwA4SBbetxTYJ9N1o66uSIe6IaTLevnbM5ZWsoV6NKvgKGTJab5YXnmHT9igPzcIat+npg0xESVdtuxtKfIwS1HpV5RbSpZrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786663; c=relaxed/simple;
	bh=NmWtgvm7ZtJGFEk0XtaGsNUUmdlq9hNKN0gvN6IASN0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=czXqaMwGfYnkpgvKbFYUr85Fy1B1og2MelyKMxTK7PyChowmqpiXuR9EyZxWTFeUngKIMf12lcQANiyXjTkwK/i5Vz0tHdKRzEmAQBRrVZTpO1XcdtprQ0TToOlQAfGRo3dUv3MSQaLdV/jt00ZplIUPq/fVtoEFrtS4w7B2g/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=S9W5Dxop; arc=fail smtp.client-ip=40.107.21.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="S9W5Dxop"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihMwHKpYffiXOGLT2+jtS9LDPDOLcQGSSS7CDmT9Ct+nDtEwHLMSSyNt45y8+j2eAW4LLnsSq0eYX0ohkbT1bns7kXSEFK9Uxi5qz9pBoUS4jr1QoS50x+MyT9d9x+24jmhz9ZEfeOE1+StFblWL68t2xk4DtzZGs81XshbZ01LCZbWsyD8Jzo2CDYKimJbygG10wpY+QmKuraX4IeuiFctwRGO8OvChlPjGM0d6D+lEpA1m+kNhPmttkOiwqgLs/YCc196QyYnGMoDTWOKalxXBFUJkdoAbET3nuAf5SI9fYkCmtXTu4JNLw9Np4Ikpv8iQVap40o1YOuF7AFssfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmWtgvm7ZtJGFEk0XtaGsNUUmdlq9hNKN0gvN6IASN0=;
 b=Gto7sv+OPsJ8GKmigxzGIRxBFMG9FtCyPDqy1MKuuws6Zd0uE/vWvR5OLaD9SltO76w3veGCfXqGKNLyNBtPUnb35heAR1V46KdCuxOI7CBir62pnlDsEiRzrPeGR+Z9zv/PLAWzBwGEM3o2dfwd5poFoko09zjiIHY+pC93qDCbWWkrxsoZo9WB4uSGx4zAVrJRx1FZntZz3gKf5igeNVWuxuG+ffAhdUM18A3tZGP9FBUHxpUXCQa1Eaeh0T+72eQfSCJ1+DBKRVLX2RPfoxs0p0HPKXvF5mwl8JGMNNmPS0jJubQnZ5QIVBhx0RN+CzmBMFsuuxv8V5DmzF1P7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmWtgvm7ZtJGFEk0XtaGsNUUmdlq9hNKN0gvN6IASN0=;
 b=S9W5DxopdtM+BT7wS7QuxsfGZacACRw1N9Lt+YgRu/vHCl55HbfwGHfV5vYY+Jl1NAJfN+lsA02QqW3/dJLntFf5Qj4lhWSdPIn+hR2ISHnuKwrENyJ/tBQyDYwttfMXwCfRpF5iB1XlUxhYrRNMs4pFDF6+tCahmhFHB5DWaT8=
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com (2603:10a6:10:1a0::11)
 by GV1PR06MB9646.eurprd06.prod.outlook.com (2603:10a6:150:1cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 06:57:36 +0000
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0]) by DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 06:57:35 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Jai Luthra <jai.luthra@ideasonboard.com>, Shawn Guo <shawnguo2@yeah.net>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "m.felsch@pengutronix.de"
	<m.felsch@pengutronix.de>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>, "stefan.klug@ideasonboard.com"
	<stefan.klug@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Thread-Topic: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Thread-Index: AQHbGL8KifipXUsSOk2/fobsQXRO0bOkOinfgAHOTQCAAAFoAIAAAXiAgAD81oA=
Date: Wed, 16 Apr 2025 06:57:35 +0000
Message-ID: <49a83fe4-863d-4f84-912c-cf58dc22ede6@leica-geosystems.com>
References: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
 <ZxYiCv6SpLq9uh08@dragon>
 <qqi2z7wutuy7e6o5fhpzsgfwkyn4quqmdeftl24meld72sudpg@lo3qpk4x7lbv>
 <d6852cf6-e8a0-49b8-a565-2d94eeef67d9@leica-geosystems.com>
 <20250415154724.GG9439@pendragon.ideasonboard.com>
 <20250415155239.GH9439@pendragon.ideasonboard.com>
In-Reply-To: <20250415155239.GH9439@pendragon.ideasonboard.com>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR06MB6901:EE_|GV1PR06MB9646:EE_
x-ms-office365-filtering-correlation-id: a69e4569-dcb3-484d-3a25-08dd7cb3f80c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?Rmxha0RKT3dBK20xR0lTU2NvV3lJNEZwdzhjTklWMzRVdXZwSEVSaXhPbWVz?=
 =?utf-8?B?cmhtc3JnYWFobzF0WVFzbmdtTEdhb01WNHRqV25Pc2NsUUVIUHh3dnZmZkNv?=
 =?utf-8?B?SVJhTmRlSy90TW8xQU1YNUZLK1U3cnBINUViMDdJTm9NV3pPZ2hwdU92NXlQ?=
 =?utf-8?B?Yi9VQmhEV0YyTXIzRnVIcWExWW9hQU8vL1ZWU2pQV0tYM3lJSE5BdHY3d01I?=
 =?utf-8?B?bDl6SzRGMEgySndBcEpjR2dGdVBkcFM5QWtQT2lEcEtjazJPR3d0dFJwTVM4?=
 =?utf-8?B?ZTVwbHJKNFhzb0tXZ09BekE0ckVKdkVwbGVIRURiWEo2ZEpBb2ZucENNUFll?=
 =?utf-8?B?TTJjeWNxWEgvWGkzT3Y2djNNM1BQVUg5WnhOT2NjRU8zT0lQSW9tVjFBNUdJ?=
 =?utf-8?B?UTQzVGQxbEQ2dmNlRjVlaEhYcC9qUUFqWXRRQkRFY1QxS0xCcms5MzlpMmlL?=
 =?utf-8?B?MFhjb3c3dkpKNU0rZnI0YmdEbWxkZ1E1eXlMUDFodXRtWFdEcHF2bzZRTkhi?=
 =?utf-8?B?aTY0WkYrS1lORVp3VmxmK21sakZMSllNNTQwaURkZ3B3VjFlQms1azVYSkI0?=
 =?utf-8?B?Z1cxaFppSWJFSGZoOEpKQ1JtUjRIQVhEOEwzRWVVbk9PU0EzY2VRUllTVE9L?=
 =?utf-8?B?amJZdEMwVHVyUWNlem9aUG41TEpOaVZBZFl0VXQvU3JyVmFXcXFldGM2YUU1?=
 =?utf-8?B?ZHYwKytydjR4VjA1T0ZTZlc0ZVJUUFhvT1VSNUV1SHlNYVp5WmpjUndpYlZX?=
 =?utf-8?B?RHZxVmphMC91T214S05zdXRDOUtjWnZQS3VIbjBmVkh1aFd4aDVYM0RGUWhu?=
 =?utf-8?B?RFVmdUlkazYvL1hZNWNoeE5xYklqNUQ0ZUZDOVNrb2pHNlZuK0hzK0ZjRjVu?=
 =?utf-8?B?dGtUQ05JTkZqL3NQS0padE5lSmJUeGM1R1N5TW9ZTEhncktHK0ZpQzNERVVq?=
 =?utf-8?B?bHRtYzVGcDUvT255ZnA0YnA2QUNuRTNnRjMwRnFhNmVza29JTmxIRkYxN2Y0?=
 =?utf-8?B?L2QzWHJzbGdoaGUvc3MyanNGNkNxVTFjSURKcElmb0VBQlQxWGVtaWowanUw?=
 =?utf-8?B?c00vZ2pER0xyQ1FoUDNqa1hqSUZpMFFnbWtYL0FoUXgvSngwOW5YOXB0R001?=
 =?utf-8?B?Z2FYSGFhOWdkSndsTmNXdFJxNmFZWlFZblFtQzRhdmVZcWhsSnZ5dWFRVElz?=
 =?utf-8?B?ak5lZTNDQzQ5bFZVSmNIUG9SZkZuWGM1NjV5UGJyRVAyQ1lLbnFnbjdQUHln?=
 =?utf-8?B?OUlERzByNG9nWGpENHRMSUNCb1cyam5HSG1aeGlmZWZMeHMxQlVub0IybUJx?=
 =?utf-8?B?ZW95V1dZb004MThZWFJjajhrd0p5VFN4TDhBYlh4aEhDbVI4WHdNZTRqa0Nz?=
 =?utf-8?B?UUcwTGI4Z09veTJ3UXJTcGN2cnduSXZONDdxTjZnTFZVc3N1TEZXZ0lXWERr?=
 =?utf-8?B?TTNHSGl4WFE4S2pBWjFiYWxEblE5Wi91NjBkYjRkUmQrdnhPL1F6b2MvR3NM?=
 =?utf-8?B?aHd3NWhJVmsyY2QyRzRzUmtXSHFBQjJDME9JZldUUkZGZlczc2JRSE0welVN?=
 =?utf-8?B?NGFwcXNmM0JiZ25UbmVOeGtsWUViVytNa0lRZmVCMUJHU05UMExlSnZQMzR4?=
 =?utf-8?B?ZFBwdVRNcFFlUG1yUWVlS3gva2VpUlRadXEyaXVKdnhxb2RKMDkwZVRNOXBU?=
 =?utf-8?B?STZ1Y2poekQ0TDNXYmZBVlQxcXZiRno4d29qeERjcDAwYXZlSWZmYXYxbDdL?=
 =?utf-8?B?Tm9pa1Z4QkNRb3FWV1V4Uzl4dXRFNVppTDFuZndKaGdPbUxoWDZmNmpFbnNL?=
 =?utf-8?B?dzY3WmZnSFZDeWhQYlZuNEF1WTFhbDlpNUhrdm5YQ1J2NWRlVFFBR0tVTG1J?=
 =?utf-8?B?STIrN1NNTG54OVBlb25NTFZiN2pJTjdqaXFaVGk0TzVmTFdUTnNYL2V2U0FX?=
 =?utf-8?Q?ZjwIsDMh0Ns=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR06MB6901.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MG1USzJmdFZVOUJ6Z3Jsc1drdjd2Y2sySHhmbll3d3pGZFI2aHVTMlk5bHR1?=
 =?utf-8?B?RVhFR0huUzhQR1RZRFRvT2hqWVlwdkhvQVdUMXFaaWxob1dqWlpPZVNlYWlt?=
 =?utf-8?B?WlVNTTNVdHBHNFdEejc4UFJyRUd5Tmkydk5IRmxWMHkxTXdmRnlyMW1MYWF0?=
 =?utf-8?B?bFlzeUE5ZmV0Um4rVTVET0duQUxIbituZS9tcEdkWDcyT1RlZXJxUkdteDZ0?=
 =?utf-8?B?RG9mS1I5bHZieGFOWERLNy9lMm84RjNxS2d5U2FnT3ZWMDA2ck1JeC9oZW1u?=
 =?utf-8?B?UzFjRWVMRlFqN2ljN0I4Tm0zYmUxRTFEWUdGVmpZSit1djZDU0wxYTl2MHJa?=
 =?utf-8?B?TmNybnhrSmMxZXVJQm54UzZiNmJtMW9YZklwM1RGbEIwR3dMQWNGdlgwcW92?=
 =?utf-8?B?TWFubi9zaTJhaHdxb1FGNmdtbnlIVC9KSDdDdTNRTnAvV2ZJT2ZkblYvYndD?=
 =?utf-8?B?ZUo5SVRZMXQvdHRKcGxEajMvR2pBbWRPa3NZOFlnRlorRUgyZGd2S2RHOHpt?=
 =?utf-8?B?MythNzUwSnFycTViQmIyUHA4c2RVUzF0Ukd4RWwrWm5ZMTBPMC8vUWRWQ3ls?=
 =?utf-8?B?SjEyOHZaOGdzOTVHUHpIYXpDalc0OFhBa2YwR0MwT1p5a29SLyt2MmJKaUFI?=
 =?utf-8?B?Z3V3OHhUTk55N0RqNkF4Vit5czIxRjRwQjhGWm50K0t4NjlMSlp1bUV2OGJ0?=
 =?utf-8?B?bW9aUVU4dmROQXJRY0JURXZCc2QzU2dvazllTVRBZ1RaVmpaYmd3eEN2NXRY?=
 =?utf-8?B?OE5sTm5aQjBTK01hdGQ0dFR3Q2MxVkNnR0lKN002b3VVY2Z1NVpNejVYenQ1?=
 =?utf-8?B?RjlzQWhWQlhOYjhMQXRSQVZoejA0RFZLU1F3dU5GNFN6czRnSnR3YVJnY1lm?=
 =?utf-8?B?TnhaWVlzVHplNlJFbVBxMXY2dTdRWktyQ0FqSWl6M1dwdllaUzNzSUE3alkr?=
 =?utf-8?B?QWxjUXNrdGxRTTJXaGpCVFMwdjBFc1h4b1lvUXFDTGJpOUtIQTdZUHRzMTU3?=
 =?utf-8?B?M3RodDlHRGdTZXdaK2hiZ1VoeVBabGV2MWFnNkVQZXZkYjdQam0zd24wWUNw?=
 =?utf-8?B?cWtjaDl6TEJBSElIWlViTEJ2MDJ5RVpoci9hbjNEbTM0WmxKZUZySUxRSW45?=
 =?utf-8?B?eUIxSjNXTDRDOEdxV0hNd00yanpzRk1keEl1NStUTThiVGZRR1dNSXI3QWkv?=
 =?utf-8?B?SCs0TkdkMEZzcUpsVHBEa3hHOVBzR2ZPbWJ3RE1ROWRkV1FZRUNOdUt0NXpk?=
 =?utf-8?B?dzljek1ZY2dkS2x1dFhIOWJrQWRDeFd3cTk0OEVFQ3JYblR2UnFtY2YwMlQy?=
 =?utf-8?B?Z2JONU50Qk1yRlp0cnVMT0NKbWZFWWFJclo0VUYwTmdiaWs5WDJFYW9PSFBK?=
 =?utf-8?B?K2M5MVBRc2I4RE5YRkV3REFmbFgwazdGTU1TVHNuSkxacXhKMi90RjEzc1ZQ?=
 =?utf-8?B?djBVTWlUd2hlRjN4YjZiTEFFcGdtL1ViRk1aWVRCbTNDcWZKQmdxSkt6Y0pH?=
 =?utf-8?B?c2k3RmFHbDJjWnkwVk5mQVh4SmUvN0t4RVBGU25YWjc4dHRXOEROQWgzd3Ri?=
 =?utf-8?B?clUrWXJaOUFSWWhjYk42d003cS8rc25Dcy9pVWt0YkgxckdEMS9VRFRIc3ZD?=
 =?utf-8?B?ZE9sWEtSUkxBZ29KQTFLTjQvZXNuMzZhNXdGTWVmNnhaN2FkTEE3YWFDT0tG?=
 =?utf-8?B?S1ZWRHhLVkJjZ0JmWU1zRDVmc2JndjQ1RVZqVldMYW9RWnloWlpjOURQZ3ZH?=
 =?utf-8?B?M2ZrV1l6Ti93VzZQS1hGYk9sUHpNSU4zZHN6MWdXM0ZyUkR4Q1ZzNUdJVjZu?=
 =?utf-8?B?eG1HbnlSNkNDcis1UjZyQm5zblRLbHg1UU82aE9pMkowQ2lON0JXOWY3aFRq?=
 =?utf-8?B?c0xDUzVTMmlyVXJGK3lDSHNYYVpQdHowdHVKcWtMZHVneWV5akNmdG9xakMr?=
 =?utf-8?B?dStNK0pVOTZQOVRjOVU5eG0rQWVMRkYxTnB0ZytMSVEzK2JINHRzdE5zZSs4?=
 =?utf-8?B?U2lzRTRDUVdkQnFoVkxodFIzS2pNMldtSWlZaFYvMng1N1RXRFMxTXZnbSsz?=
 =?utf-8?B?QndJK0IvRzJISzdBUXRTVldKblpPNDUycjdyWVJMeGNrRlRMdytLVk9qM01R?=
 =?utf-8?B?OCt4SG9DU1dwQ3ozMUF5YlhsdEEzeXlIODlKZUJWR1QycHpyMERsL1hOMmN2?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96DBC031FC279B49B850516D48F2587C@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR06MB6901.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69e4569-dcb3-484d-3a25-08dd7cb3f80c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 06:57:35.8686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/4ZIah9pshngtdQQcKhhY9K+VjLOQljuETtiJBMCJoTkMduQP2pqH4fucySfPQ/EdOnWGsu+D2abgIWqKVKblC/+49KK/ZeGtb4Ik7SGHHxNJoaND9YVaxk3HFFtvEF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9646

T24gMTUvMDQvMjAyNSAxNzo1MiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gW1NvbWUgcGVv
cGxlIHdobyByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20g
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBv
cnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0N
Cj4NCj4gVGhpcyBlbWFpbCBpcyBub3QgZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3Rh
bmNlLiBQbGVhc2UgYmUgY2FyZWZ1bCB3aGlsZSBjbGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRh
Y2htZW50cywgb3IgcmVwbHlpbmcgdG8gdGhpcyBlbWFpbC4NCj4NCj4NCj4gT24gVHVlLCBBcHIg
MTUsIDIwMjUgYXQgMDY6NDc6MjZQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4+
IEhpIENhdGFsaW4sDQo+Pg0KPj4gT24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgMDM6NDI6MjJQTSAr
MDAwMCwgUE9QRVNDVSBDYXRhbGluIHdyb3RlOg0KPj4+IEhpIEphaSwNCj4+Pg0KPj4+IFRoaXMg
aXNzdWUgd2FzIGFscmVhZHkgcmVwb3J0ZWQgYnkgU3RlZmFuLiBUaGUgcHJvYmxlbSBpcyB0aGF0
IEkgZG9uJ3QNCj4+PiBoYXZlIGEgRGViaXggYm9hcmQgdG8gaW52ZXN0aWdhdGUuDQo+Pj4gVGhl
IG1haW4gZGlmZmVyZW5jZSBiL3cgV0ZJIGFuZCBjcHUtcGQtd2FpdCBpcyB0aGF0IHRoZSBmaXJz
dCBkb2Vzbid0DQo+Pj4gY2FsbCBQU0NJL1RGLUEuIFNvLCB0aGUgaXNzdWUgbG9va3MgdG8gYmUg
cmVsYXRlZCB0byBzb21lIHNldHRpbmdzIGluDQo+Pj4gdGhlIFRGLUEuDQo+PiBKYWksIGFyZSB5
b3UgdXNpbmcgbWFpbmxpbmUgVS1Cb290IGFuZCBURi1BLCBvciBhIGRvd25zdHJlYW0gdmVyc2lv
biBvZg0KPj4gZWl0aGVyIChvciBib3RoKSA/DQo+IEFjdHVhbGx5LCBzYW1lIHF1ZXN0aW9uIGZv
ciBDYWxhdGluIDotKQ0KDQpCb25qb3VyIExhdXJlbnQsDQoNCkknbSBydW5uaW5nIGEgeW9jdG8g
c2NhcnRoZ2FwIGN1c3RvbSBidWlsZCA6DQoNCi0gYmFyZWJveCA6IGh0dHA6Ly9iYXJlYm94Lm9y
Zy9kb3dubG9hZC9iYXJlYm94LTIwMjQuMDUuMC50YXIuYnoyIF93aXRoXw0KY3VzdG9tIHBhdGNo
ZXMNCi0ga2VybmVsIDogNi4xMi4xNiBfd2l0aF8gY3VzdG9tIHBhdGNoZXMNCi0gVEYtQSA6DQpn
aXQ6Ly9naXRodWIuY29tL2hleGFnb24tZ2VvLXN1cnYvdHJ1c3RlZC1maXJtd2FyZS1hO3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD1sZWljYS92Mi4xMg0KLyBTUkNSRVY9NDZjOTYyYzY1NGRlNGFiNzM0
ZjkzNmY0NzI1MDhlZGYyMGM2YzA0OSAoX25vXyBjdXN0b20gcGF0Y2hlcykNCg0KQ2F0YWxpbg0K
DQo+DQo+IEknbSBydW5uaW5nIG1haW5saW5lIFUtQm9vdCAyMDI1LjAxIGFuZCBURi1BIHJlbF9p
bXhfNS40LjcwXzIuMy42IChmcm9tDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAtaW14L2lteC1h
dGYpIGFuZCBkb24ndCBzZWVtIHRvIGV4cGVyaWVuY2UgdGhlDQo+IGlzc3VlOg0KPg0KPiAjIGNh
dCAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUqL2NwdWlkbGUvc3RhdGUxL2Rpc2FibGUNCj4g
MA0KPiAwDQo+IDANCj4gMA0KPg0KPiAkIHBpbmcgZGViaXgNCj4gUElORyBkZWJpeC5mYXJtLmlk
ZWFzb25ib2FyZC5jb20gKDE5Mi4xNjguMi4yMzApIDU2KDg0KSBieXRlcyBvZiBkYXRhLg0KPiA2
NCBieXRlcyBmcm9tIGRlYml4LmZhcm0uaWRlYXNvbmJvYXJkLmNvbSAoMTkyLjE2OC4yLjIzMCk6
IGljbXBfc2VxPTEgdHRsPTY0IHRpbWU9MS4wMyBtcw0KPiA2NCBieXRlcyBmcm9tIGRlYml4LmZh
cm0uaWRlYXNvbmJvYXJkLmNvbSAoMTkyLjE2OC4yLjIzMCk6IGljbXBfc2VxPTIgdHRsPTY0IHRp
bWU9MC44MDAgbXMNCj4gNjQgYnl0ZXMgZnJvbSBkZWJpeC5mYXJtLmlkZWFzb25ib2FyZC5jb20g
KDE5Mi4xNjguMi4yMzApOiBpY21wX3NlcT0zIHR0bD02NCB0aW1lPTAuOTM1IG1zDQo+IDY0IGJ5
dGVzIGZyb20gZGViaXguZmFybS5pZGVhc29uYm9hcmQuY29tICgxOTIuMTY4LjIuMjMwKTogaWNt
cF9zZXE9NCB0dGw9NjQgdGltZT0wLjkwMiBtcw0KPiA2NCBieXRlcyBmcm9tIGRlYml4LmZhcm0u
aWRlYXNvbmJvYXJkLmNvbSAoMTkyLjE2OC4yLjIzMCk6IGljbXBfc2VxPTUgdHRsPTY0IHRpbWU9
MC43MzggbXMNCj4gNjQgYnl0ZXMgZnJvbSBkZWJpeC5mYXJtLmlkZWFzb25ib2FyZC5jb20gKDE5
Mi4xNjguMi4yMzApOiBpY21wX3NlcT02IHR0bD02NCB0aW1lPTAuOTM5IG1zDQo+DQo+Pj4gV2hh
dCBJIGRvbid0IGdldCBpcyB3aHkgSSBkb24ndCBzZWUgdGhpcyBpc3N1ZSBuZWl0aGVyIG9uIG91
ciBJTVg4TVANCj4+PiBzcGVjaWZpYyBkZXNpZ24gbm9yIG9uIHRoZSBFVkssIHdoaWNoIHVzZXMg
dGhlIHNhbWUgUEhZIGFzIHRoZSBEZWJpeCBib2FyZC4NCj4+Pg0KPj4+IE9uIDE0LzA0LzIwMjUg
MTQ6MDcsIEphaSBMdXRocmEgd3JvdGU6DQo+Pj4+IE9uIE9jdCAyMSwgMjAyNCBhdCAxNzo0Mjoz
NCArMDgwMCwgU2hhd24gR3VvIHdyb3RlOg0KPj4+Pj4gT24gTW9uLCBPY3QgMDcsIDIwMjQgYXQg
MDM6NDQ6MjRQTSArMDIwMCwgQ2F0YWxpbiBQb3Blc2N1IHdyb3RlOg0KPj4+Pj4+IFNvIGZhciwg
b25seSBXRkkgaXMgc3VwcG9ydGVkIG9uIGkuTVg4bXAgcGxhdGZvcm0uIEFkZCBzdXBwb3J0IGZv
cg0KPj4+Pj4+IGRlZXBlciBjcHVpZGxlIHN0YXRlICJjcHUtcGQtd2FpdCIgdGhhdCB3b3VsZCBh
bGxvdyBmb3IgYmV0dGVyIHBvd2VyDQo+Pj4+Pj4gdXNhZ2UgZHVyaW5nIHJ1bnRpbWUuIFRoaXMg
aXMgYSBwb3J0IGZyb20gTlhQIGRvd25zdHJlYW0ga2VybmVsLg0KPj4+Pj4+DQo+Pj4+IFNpbmNl
IHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhpcyBwYXRjaCBpbiBtYWlubGluZSwgSSBhbSBmYWNpbmcg
c2x1Z2dpc2gNCj4+Pj4gbmV0d29yayBwZXJmb3JtYW5jZSB3aXRoIG15IERlYml4IE1vZGVsLUEg
Ym9hcmQgd2l0aCBpLk1YOG1wIFNvQy4NCj4+Pj4NCj4+Pj4gVGhlIG5ldHdvcmsgbGF0ZW5jeSBq
dW1wcyB0byA+MXMgYWZ0ZXIgYWxtb3N0IGV2ZXJ5IG90aGVyIHBhY2tldDoNCj4+Pj4NCj4+Pj4g
UElORyBkZWJpeCAoMTAuMC40Mi41KSA1Nig4NCkgYnl0ZXMgb2YgZGF0YS4NCj4+Pj4gNjQgYnl0
ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41KTogaWNtcF9zZXE9MSB0dGw9NjQgdGltZT0xMDA4IG1z
DQo+Pj4+IDY0IGJ5dGVzIGZyb20gZGViaXggKDEwLjAuNDIuNSk6IGljbXBfc2VxPTIgdHRsPTY0
IHRpbWU9MC40ODggbXMNCj4+Pj4gNjQgYnl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41KTogaWNt
cF9zZXE9MyB0dGw9NjQgdGltZT0xMDI1IG1zDQo+Pj4+IDY0IGJ5dGVzIGZyb20gZGViaXggKDEw
LjAuNDIuNSk6IGljbXBfc2VxPTQgdHRsPTY0IHRpbWU9MC44MTAgbXMNCj4+Pj4gNjQgYnl0ZXMg
ZnJvbSBkZWJpeCAoMTAuMC40Mi41KTogaWNtcF9zZXE9NSB0dGw9NjQgdGltZT01OTAgbXMNCj4+
Pj4gNjQgYnl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41KTogaWNtcF9zZXE9NiB0dGw9NjQgdGlt
ZT0wLjM1MSBtcw0KPj4+PiBeQw0KPj4+PiAtLS0gZGViaXggcGluZyBzdGF0aXN0aWNzIC0tLQ0K
Pj4+PiA3IHBhY2tldHMgdHJhbnNtaXR0ZWQsIDYgcmVjZWl2ZWQsIDE0LjI4NTclIHBhY2tldCBs
b3NzLCB0aW1lIDYxMjZtcw0KPj4+PiBydHQgbWluL2F2Zy9tYXgvbWRldiA9IDAuMzUxLzQzNy40
MTYvMTAyNC43NTUvNDU5LjM3MCBtcywgcGlwZSAyDQo+Pj4+IGRhcmthcGV4IGF0IGZyZXlhIGlu
IH4NCj4+Pj4NCj4+Pj4gSWYgSSByZXZlcnQgdGhlIHBhdGNoLCBvciBkaXNhYmxlIHRoZSBkZWVw
ZXIgY3B1aWRsZSBzdGF0ZSB0aHJvdWdoDQo+Pj4+IHN5c2ZzLCB0aGUgaXNzdWUgZ29lcyBhd2F5
Lg0KPj4+Pg0KPj4+PiAjIGVjaG8gMSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdSRpL2Nw
dWlkbGUvc3RhdGUxL2Rpc2FibGUNCj4+Pj4NCj4+Pj4gUElORyBkZWJpeCAoMTAuMC40Mi41KSA1
Nig4NCkgYnl0ZXMgb2YgZGF0YS4NCj4+Pj4gNjQgYnl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41
KTogaWNtcF9zZXE9MSB0dGw9NjQgdGltZT0wLjQ4MiBtcw0KPj4+PiA2NCBieXRlcyBmcm9tIGRl
Yml4ICgxMC4wLjQyLjUpOiBpY21wX3NlcT0yIHR0bD02NCB0aW1lPTIuMjggbXMNCj4+Pj4gNjQg
Ynl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41KTogaWNtcF9zZXE9MyB0dGw9NjQgdGltZT0yLjI2
IG1zDQo+Pj4+IDY0IGJ5dGVzIGZyb20gZGViaXggKDEwLjAuNDIuNSk6IGljbXBfc2VxPTQgdHRs
PTY0IHRpbWU9MC44NDggbXMNCj4+Pj4gNjQgYnl0ZXMgZnJvbSBkZWJpeCAoMTAuMC40Mi41KTog
aWNtcF9zZXE9NSB0dGw9NjQgdGltZT0wLjQwNiBtcw0KPj4+PiBeQw0KPj4+PiAtLS0gZGViaXgg
cGluZyBzdGF0aXN0aWNzIC0tLQ0KPj4+PiA1IHBhY2tldHMgdHJhbnNtaXR0ZWQsIDUgcmVjZWl2
ZWQsIDAlIHBhY2tldCBsb3NzLCB0aW1lIDQwNTFtcw0KPj4+PiBydHQgbWluL2F2Zy9tYXgvbWRl
diA9IDAuNDA2LzEuMjU1LzIuMjgwLzAuODQyIG1zDQo+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogQ2F0YWxpbiBQb3Blc2N1IDxjYXRhbGluLnBvcGVzY3VAbGVpY2EtZ2Vvc3lzdGVtcy5jb20+
DQo+Pj4+PiBBcHBsaWVkLCB0aGFua3MhDQo+IC0tDQo+IFJlZ2FyZHMsDQo+DQo+IExhdXJlbnQg
UGluY2hhcnQNCg0KDQo=
