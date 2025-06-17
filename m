Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719B728ECE5;
	Tue, 17 Jun 2025 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150591; cv=fail; b=b5ETKDbSBK3McpA/1Rb40rfPYPTG7tgKcBxbPD2COt4aG2n788x3Co9tc8fWrOP7LBe2SAADawpDzpURxdQWvUliTFfYh3QS34By/7Oo/q2vAyprWpeE9w7Mn6Wa7G3GjcO6HB1sdkEXRFBYVOezGcb55fR6NCdM3YkEDzetPoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150591; c=relaxed/simple;
	bh=EbGzPPxyjpb5xGiZy+v4Dflizcic0rPJ2VAv3I0BoBY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BtcKLT8JzXnUNhkCDOhT1ENT1IyKC2u52GKJL08T5kCzr9KuQXTRx1M9x6QC9RWEM7Wa49jeZUn64Sy6tug9QkO+3eNAnjoaw637n1t6aQVBmoFSxfNEfma6VC4ifANOxWzX9umITiBpr7Odh3I2MCuuMPNjBMXq6Xfrx3DbfIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=kWGKiBJL; arc=fail smtp.client-ip=40.107.223.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="kWGKiBJL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyIzV9vrQHGG8/PYjqbi+C6OXDQ3yPMB9WXAcCrRtrukvjTLqcSRa8vzjeRlJJ6VOiA4KwZcrel1jgWvhblVNJ5G/6TF42rfOy2jpcV9cKnVr3aW8jWkGSsvr8aA7XVx/rUZM6ZzDUzHfY1hAz6zurQuBnzetE5MfPYBUvXEU7OUqN3D6F2yODPdEz0GHHKR9j8E6bAprn40p8vVq/rU00KZn4JuWm9cM4+Itfm7ngWmOfXU9CK+BKLXdgO1liBae1rL9sjxg6Tw55e86A3ux8hoKGLHGyPQZfMfTNNs8Mmak/YxwxUa03ww1baj/gFdGG0bS44uufk8ADnlhi6j8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbGzPPxyjpb5xGiZy+v4Dflizcic0rPJ2VAv3I0BoBY=;
 b=u0gLhmGHOiatLhrzi2tClrh4/rAofXIXGaNkkefnPm6Te+5AMVilopICj+s/crrxZTfRaB/LiD+4MvUU8vNrTknU7jAkZDkdsPJplIuP0g4neNPSQxJSZ4Xmf074SssVzEYK59dMlyxqnNumHeiML+VpTk6XHR75sizX0oM9M4Wk6R2gKDm/pahrpod2wnffyrlDJH59D2hyS3XbOI9lNsVDwOs5hzkHd7YoS5xfCVeXF6+SX+/2I73Z9gfBMOO46tgB+dRb6swic1GwWovMwdYad3+iJm0IS9XLWsbhwoYSWjpBZpbpn2uK/Hax6SoYfNNr9nKIc9QeNinTLw3Bzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbGzPPxyjpb5xGiZy+v4Dflizcic0rPJ2VAv3I0BoBY=;
 b=kWGKiBJLutPFVBpKTQSRyU7kUkmbMRk8CvIJSo9qpkL/uFmvNk8INPqb4gnmuJUY+GiL2oUoG2yYyeRefkk/9IK/z3Z15oyQgmaxfjV4ouw4DC8Qx1xrBpCE0XNORSU9wOYFs08Ztjq8eQsxrH3lQfO+ARW8nFhRVQNqzTIdrIPlOjI+KrBXLQ0z6LUHQjwDWiikZDfxc0pe+4E+na2cK+dj11Cu77haHI4D6LZV4fruNdPqHQHYv1E8ZUpRt38sDB6pCzuvq/LwG56ZRT0YFOMt4FKSXdAdn5QecRrcw/V7LR6IISYuIrRNACPZCgGMx0Idff/oB8HZ4ShmD/5UFw==
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW5PR03MB6982.namprd03.prod.outlook.com (2603:10b6:303:1a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 08:56:26 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 08:56:25 +0000
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "dinguyen@kernel.org"
	<dinguyen@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Matthew Gerlach <matthew.gerlach@altrera.com>
Subject: RE: [RESEND PATCH 1/2] arm64: dts: socfpga: agilex5: Add SMMU-V3-PMCG
 nodes
Thread-Topic: [RESEND PATCH 1/2] arm64: dts: socfpga: agilex5: Add
 SMMU-V3-PMCG nodes
Thread-Index: AQHb3s4SBJ941IUR9EKPFKEbTXFgbrQG5A0AgAAooiA=
Date: Tue, 17 Jun 2025 08:56:25 +0000
Message-ID:
 <DM8PR03MB6230323BB6CEA92F41193269F573A@DM8PR03MB6230.namprd03.prod.outlook.com>
References: <20250616145006.1081013-1-adrianhoyin.ng@altera.com>
 <20250616145006.1081013-2-adrianhoyin.ng@altera.com>
 <0379000a-7ca6-4619-ad71-0ea9f71ffb8f@kernel.org>
In-Reply-To: <0379000a-7ca6-4619-ad71-0ea9f71ffb8f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR03MB6230:EE_|MW5PR03MB6982:EE_
x-ms-office365-filtering-correlation-id: 7243cb47-2b95-4764-47be-08ddad7cd76e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWdvYWpOeEg5OWV2b014V1lKVmpBc1ZscmpmQUxaa0R1V1RkMlVzeUg4dGJE?=
 =?utf-8?B?YWhnZEY2MWE5YTRJWnhUMEpRaWRISFE5YjhUaVYyQVV6N1AzYjlLTFY3emdn?=
 =?utf-8?B?THIxL1dVblZQRTNETXJicDB6Y2ZPbk9mWjdxclAvUXpQRFhjR0IrOGxYQlA1?=
 =?utf-8?B?alJScE5iL0pvZTl6TFV2eUN1NnhReHFwRklqWTVOZjY1QXV4SUhRbVdudWR0?=
 =?utf-8?B?Nzhmek95bHpQbG1TZktUM0JkMElXeGREWnFMd3VNOHdENjZuUmxRVGsvNVNo?=
 =?utf-8?B?eTYxVjhMZDNmQnhJSE81WDRQSVRheUpzSTczNDVOSnRWb0tGOTVuY0pneFk2?=
 =?utf-8?B?TE44YXhHeDYzQlc0YXlxMTRXZmFMRnJ2NGJFTEt3ZFNXVGZ3RzUxdUtOSU5T?=
 =?utf-8?B?NEg4bHVmRjlyZVBoSWJCS0dHU2xqTGhQRkJaVUp6ZW9oTDZhdUgzV3lRL0lB?=
 =?utf-8?B?MmpVVXpRNGsxYnMyUnk3b1RHanN5dmtUaXB4Smlab0RDanVnNytDZU4wN1dJ?=
 =?utf-8?B?ZWZmZEd2TGo4MEVSUnhvQUZ5ZHZWVmI5Sk42ZTIxbG10RHhHRVlyVXpTbUla?=
 =?utf-8?B?RHpQUEgrYlErb0NrOGJneXdrbWZ2aFA2TGc0S3NEMC9FQVlNOUdycE5laUVH?=
 =?utf-8?B?TzFSUGs1K3h6Mi9HeFZ6dElSZ3lWUXZCYm95WjF5S1lpVlU0azllaUNqcjhp?=
 =?utf-8?B?Z0xPVzdzYnlhdUZINlFhZFRJa3RGdDdyd0FNaktIdWNZdGU4Q1hZcGJCeStI?=
 =?utf-8?B?Nkx6ckFOS201bGhESUxKM0FDV1lNalJpS0RRQVNIZFpNZDJJNDNXbTNDN1B2?=
 =?utf-8?B?VUppb0lwTXNWckpPbGVkYUdXeWEycW1MSFBNakpjV3pKSlF0WGtDM1o4ajFE?=
 =?utf-8?B?OTh6RWJ2Qk44YkgrZCtOMmdPUFRkTzhGcjBnL2dFSzZJclF6UmpJU1ovVXAr?=
 =?utf-8?B?VE44NHczVmtwSTdyQWgzallVdkFmSkVBQ3RmeE5UQnoxelhoZDZxcytwODdG?=
 =?utf-8?B?UHk0amUyaXNabkVFOGt1R0I0Nmc0VXN3bUhBcGVxYWJjMEVSdXhndTM2bzdP?=
 =?utf-8?B?R1dvaDk2bmRJdHRIOHhBUWhXSlVVVG1OQURyWHRzNlp2blY4ZEEzUktzRGp2?=
 =?utf-8?B?TTBJMjdNZTRyTEEwOGtDNndnVHBJWU1Vbk9JaFh2T2hCRFNiWG1YOHliRDJJ?=
 =?utf-8?B?ZS80MGZmQjloNnlmSEJGQ1VIZy8vdXN5Z2JCam11aERjdTdmWitvaVl5bTk0?=
 =?utf-8?B?RW5oNXdqVFJjbFRXTHZhclU3QzNlQ29jT3d5NkVhSGswamdxTmJ6K0N5cklj?=
 =?utf-8?B?VGo5N2lLZXZqSzF2TDRzcXhkeUJ1M0ZpdWExdldhcGpaQmc1UG92WldnR0dp?=
 =?utf-8?B?Q2Y5ejJQZmdNVVVrNHo4OWhvOSt1NXU2dWdMT3gwcGVPMWVNajdvdUIyTHBs?=
 =?utf-8?B?M0dzRjJUYUI3MjZFK2dkWGNlblk2Q1dIU1N0M2NWTzVZa21qRVozOFBNT2dS?=
 =?utf-8?B?cU15M0ZDNDNaeE5jS2E1Yzh3WnE5K1I0TkVqTWR1bXZtdWsvMEtjdC9kVFAx?=
 =?utf-8?B?MWJoZWE4U1hac2pJditDdWU4blVhdC9hdWJsdVl3U1JvRWRDa1RUOFB4YXJk?=
 =?utf-8?B?SlM0L1M1cWZIc3d0Rm1VQkhuYldNQWU1NmZnK1VUZlkxVmIwYjdXMUJvdVZs?=
 =?utf-8?B?c3gxUzl5WEVmM1l6YTUzem9JYWQ1SCtUeFF1cHJDRmxFN2NHQ2xkWDhzOGdZ?=
 =?utf-8?B?TE41b2J2VkNqaXlyTjcrSlkxSnBnK1kwc0pHdEJqM0didm94UzhKYnpPSEZr?=
 =?utf-8?B?V0k5N1oyRWl6M3pTdm1qZFRDc091eTdrWCtDMHd1NkEwZFFsQTk2KzNoc2gv?=
 =?utf-8?B?SlBISDRaZ3NSbW9NdW94MU80cXJveUR3Sk8vR2VhUzFvWHNzYzMyc3k2Tms4?=
 =?utf-8?Q?1GckpMvdpzg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnZtZnlKWEs0amtrZjdkdS95UkJxbEw5MXQ0MDU4d1FWeVJFUjNXa1dZZmFC?=
 =?utf-8?B?aHN2TEdEQnpBVmkwVGRYTnVEVXdlak1EM0xkNTR6SWpXRXFEdmJhcjk4bVIx?=
 =?utf-8?B?VGo1RUw4bDBMNit6ekdKSG5vNVVRSGRiS2cveThVWlNCcEVWTzhwaHhEZTV2?=
 =?utf-8?B?SmpNdXRPRUJkOVNKdUd3OEs0cjRIMFdScnRzcDJTNWxWRWliSXYxdXBJUzlY?=
 =?utf-8?B?WS9sbUxTQlQrT2NDUUd2Q1djOCtBRVNpckRSamFaM29PRWZzd1djWFZvY1F3?=
 =?utf-8?B?dEd6R2pxNHlrWE5CUDJDZy9sajFoRzFWVDB5Y0VnZ2pyeXh4Vm9CTmN1VGE1?=
 =?utf-8?B?bFJEOGd4bTNlY01BdVByQzVmMUJKWFQvMHFOUTUrSmo5VTl1WlhtVlE0UDlr?=
 =?utf-8?B?SC9ZdmtiUTBVZUx2aGY1MTkvdHZDcmw2MFE0N2JDMWRWK1pMcm1GaU5YNzVo?=
 =?utf-8?B?aG1qMnUwczdyRHg4bysyOFZoZWdPdkJXakZJU1JHYU1pZjRRbEV0WG9FNWw5?=
 =?utf-8?B?WFg2UWNvUGpiQStZZkZBMEdiSHAzeVR0cVJjSmtGVWJNa05ST2liM3VjNGo3?=
 =?utf-8?B?N0UxRTJFM1p0ckZNSG15bk5ZZnVUWE1tWElkZzZ2Qm03VjdST29CN05UaWFi?=
 =?utf-8?B?aGcwellsMWltRC80M1B1OEFCUEQvb0NWNXU2OVV3K0p2eTUzNnpaSG5lTHdq?=
 =?utf-8?B?Rk81M3pKMzhwU3FuZ2l4b3RTZGRsd0FQZVd6U0ZsdnhuZjNlbWpJbDlEYWU2?=
 =?utf-8?B?ZHVBM3FSckI4Q0tibUc2bFdHNzExazR2WkxNQjNSWm5CNFB4T2ZyN0pOc2pw?=
 =?utf-8?B?VmhkenZWc0RiN0NBL3hBTEhJSFJnK0hodjB0TWpsUUxMVFFjaGpPZlpBcTlM?=
 =?utf-8?B?V1VNZTZhZDVMNUY5dWFhNS9UZTJ3NE5Tb0VudGdaNnZFeVJCK21WL3NHYVgw?=
 =?utf-8?B?cUxYbFdUNWIzeGlrRW1yTXlyMkNEK3JYWjBkWlpHalpiSWJibis4YzcxaVp3?=
 =?utf-8?B?b1NiaUNPWVlaVy9hY3FXNnZtQldxQk5UQ2JEa0E4RzNNNU1wTWxweG55T3Nh?=
 =?utf-8?B?U0ljZ1A2bGNuK2xrVVgxaUNQZDlUSXhYL0xMUTc4ajRWZFhQWVlMaWVGalYv?=
 =?utf-8?B?SC9OaFZKb01MWXo5QThYTkJiNGhKc2VGZnhkUFBra2pVTWdFZ1VzTWd4eHZN?=
 =?utf-8?B?czVKVkR1NjNKamQrWEtWcHAzQktGcHVvSkR4NWFDNzlLN2tKTEl0MEh2WDVR?=
 =?utf-8?B?Z3JNRjQ4Z3dVUGVXeW5Xcy9OTWU5T3dMWElxY1FqVlFibUsrQVJoVDIwaWxW?=
 =?utf-8?B?ekZhZzYyY0FleHVJTUhwSzZLRkpsSU9GREw0OUxyQkx2dUJyQ0VOSERaRnRo?=
 =?utf-8?B?ZWdiVFhkaCs0WGNTM1p0M05Oa3NLWklGZXN4WUlPanE1Tll1dFRHYlArcGlE?=
 =?utf-8?B?aW42dG1TdEI0V2tLVWlvUjJVcmM0NksyL1R3cE9jejBjamdWWG9wMi9rbCtU?=
 =?utf-8?B?dFRpL01XN3NkcitZV201aDFCT2hqZ0RCa3BJTldZWnd3aENVRGVLVkRyWmhw?=
 =?utf-8?B?bFdoQitzL2RZa3lPdmN4Q3J5Q1NIaEQ0ajloWVpSeUlvR0JEZWtxTDlDTk51?=
 =?utf-8?B?L3JPZnY5RWYwNFdNUlltM080SW9iUW5EdWNtU3Y1QmNDVjRZRkxXOUN0S012?=
 =?utf-8?B?MGxBU1B3c3dNNFBYTWdEc1pONjRKVjczOHJtK2hpZzNWalpDM3Q5ZG1Jd1dS?=
 =?utf-8?B?cXdKNzgyODV3eUxKdzdBejhabXI2TEJrdnhTL1YwYkpMM1VScDZ0TUJ2VEtU?=
 =?utf-8?B?RmJmN1ZYd2NsRkVMUnRwZzN3Si9QL0dITG1sNFdKMTRtai9rREh5QXFBRDRT?=
 =?utf-8?B?anc0Nm9reFUxem9xRmxmazArMk1EY3BsSXQ4dTYxaHIzdzJVRmk0c3NUaXBn?=
 =?utf-8?B?U2h2VEh5bDhGLzFtc2ZySTJOUmtpNnVWV0pmMFI0blpaTHN3SmozNm5jRXNp?=
 =?utf-8?B?bXpPajVtQWxwVGlBK0JwWE91TDJzcXhYRDdOMlYzbHozMEg0ZXRVRGp1Mk8y?=
 =?utf-8?B?ZFp6WS81WVRCNHdLQ0NGeFo0dDlvSzZvVlhHdkE4dk14YzA4Snllc3RUUG5T?=
 =?utf-8?Q?Is8lIpIA/Sx0uPdQCd4uZsW06?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7243cb47-2b95-4764-47be-08ddad7cd76e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 08:56:25.8129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PEgIfK0iZyTMEXGK9tHdOXmLgH+OPG8Ug4wSumgUDuFjIPt8MfEj7Dj1ndKOwZfFjzADEA9HEatrbZR83+nL52yzU2vZ5YZH97H0BeJxx48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6982

PiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4
NS5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5k
dHNpDQo+ID4gaW5kZXggN2Q5Mzk0YTA0MzAyLi4wNjkyMGRlODdhNDEgMTAwNjQ0DQo+ID4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9zb2NmcGdhX2FnaWxleDUuZHRzaQ0KPiA+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1LmR0c2kNCj4gPiBA
QCAtMTMzLDYgKzEzMyw2OCBAQCB1c2JwaHkwOiB1c2JwaHkgew0KPiA+ICAJCWNvbXBhdGlibGUg
PSAidXNiLW5vcC14Y2VpdiI7DQo+ID4gIAl9Ow0KPiA+DQo+ID4gKwlwbXUwOiBwbXUgew0KPiA+
ICsJCWNvbXBhdGlibGUgPSAiYXJtLGFybXY4LXBtdXYzIjsNCj4gPiArCQlpbnRlcnJ1cHQtcGFy
ZW50ID0gPCZpbnRjPjsNCj4gPiArCQlpbnRlcnJ1cHRzID0gPEdJQ19QUEkgNyBJUlFfVFlQRV9M
RVZFTF9MT1c+Ow0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwlwbXUwX3RjdTogcG11QDE2MDAyMDAw
IHsNCj4gDQo+IA0KPiBJdCBkb2VzIG5vdCBsb29rIGxpa2UgeW91IHRlc3RlZCB0aGUgRFRTIGFn
YWluc3QgYmluZGluZ3MuIFBsZWFzZSBydW4gYG1ha2UNCj4gZHRic19jaGVjayBXPTFgIChzZWUg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dyaXRpbmctDQo+IHNjaGVtYS5yc3Qg
b3IgaHR0cHM6Ly93d3cubGluYXJvLm9yZy9ibG9nL3RpcHMtYW5kLXRyaWNrcy1mb3ItdmFsaWRh
dGluZy0NCj4gZGV2aWNldHJlZS1zb3VyY2VzLXdpdGgtdGhlLWRldmljZXRyZWUtc2NoZW1hLw0K
PiBmb3IgaW5zdHJ1Y3Rpb25zKS4NCj4gTWF5YmUgeW91IG5lZWQgdG8gdXBkYXRlIHlvdXIgZHRz
Y2hlbWEgYW5kIHlhbWxsaW50LiBEb24ndCByZWx5IG9uIGRpc3Rybw0KPiBwYWNrYWdlcyBmb3Ig
ZHRzY2hlbWEgYW5kIGJlIHN1cmUgeW91IGFyZSB1c2luZyB0aGUgbGF0ZXN0IHJlbGVhc2VkDQo+
IGR0c2NoZW1hLg0KPiANCj4gT3IuLi4gaWYgaXQgcGFzc2VzIHN0aWxsIG9idmlvdXNseSBtaXhl
cyBNTUlPIGFuZCBub24tTU1JTyBub2Rlcy4gTU1JTw0KPiBub2RlcyBnbyBpbnRvIHNvY0AwLg0K
PiANCkhpIEtyenlzenRvZiwNCg0KVGhlIGNoYW5nZXMgaW4gdGhlIERUUyB3ZXJlIHRlc3RlZCBh
Z2FpbnN0IHRoZSB1cGRhdGVkIGR0c2NoZW1hIGFuZCB5YW1sbGludCBhbmQgaXQgd2FzIHBhc3Np
bmcuDQpJIHdpbGwgbW92ZSB0aGUgTU1JTyBub2RlcyBpbnRvIHNvY0AwIGluIFYyIHN1Ym1pc3Np
b24uDQo=
