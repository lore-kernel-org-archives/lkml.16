Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2098.outbound.protection.outlook.com [40.107.247.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE504C92;
	Mon,  2 Jun 2025 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748864780; cv=fail; b=lESMfYQO7zdg0LeSEcK9QRsxco+ZXjbfUW1F+NKyIeMJZnSIRyjohLRf1eSn2J4bcczHWI6iitwNGU4z96lPjh0a6qWbI/2rljVicSUous9hWJompCobt+0ST2PngX2ZY1HOa6PaHfubmMw3fkCsbJEEKAKFl20WLegL1s2cE+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748864780; c=relaxed/simple;
	bh=o//nQmiH0DmQZLli4iAPX9IzuTQZVIOAhdwhFA+RCC0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WAbTZ2dFQY7MOSO1eTu4wvAQgtR0LjScV1EX1NKo0GMfPDbEzWjbY83xxpwrzy902r9ojLEgxwaFNlombd25AVA55zU7lc1w1NqHTWDEP+qVOT/YSGRC3tvYhO4Iu3hDjErGybady+b9JzTo7Tl/jzKxVpH1lEh5ohxLp4Wtf+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=es5l9qzE; arc=fail smtp.client-ip=40.107.247.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="es5l9qzE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDbR3xKIzZ4JJV+wxnQVDB4q579XRDex1TTA7h3JprHatPIm8ddepQqSxSC6Tdm1eTPz662Rsnm9a0sUWMaa9uFi85Ec9ySVNxsgp6e5Sat/qc3OqMom1O9bU38p+j6md3TOu1+4TLZeYh9x9mubb453SctKEmRTahY5onZrawL2qP+vFaVplQM6bApGliU+NxB2VYP/bHKGoe0R9EBNm65PcnATKX0BnzPBJCxhTQ+6abipsnaDKcrtPZBsbGtRFg8tC8afUwwBN2Y6ZZOmyfh7mWXT2LtHC2O9yA9m49ZkyIKkweaZJUNewvCgBOI4smL3+XfDhYMosWF08ObE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o//nQmiH0DmQZLli4iAPX9IzuTQZVIOAhdwhFA+RCC0=;
 b=eK+nW5Ne9kZKATpFV/OEPuLEW6khLueZCc3U0ef7E/9zYgsUWf3/LKQ5ArAk2U05svEZoN729Zny7YqKTSXgDTy0tA5CB3jXYxtXJbEne0yQOlK3P42I7rKesWDniXaV5zPfzcOkTinso6ssJllUukgMxz6IIDWtINfQKIAVX0h4Tq/NN0dXrLnvxsPoWb6cIk6ENn5pAeHj1gnEL5KgOTVVOh36kwRlJziU3bgaY7RR/LDG6/wAlf0h0DmThA9rlS878PbqJtLU+lUMtSxYD7NYK6A9sFeG3asM1RLaSLrCx2MYmyI0N356oLnjyNVaA/yzjYk4996b+fiuOWC5fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o//nQmiH0DmQZLli4iAPX9IzuTQZVIOAhdwhFA+RCC0=;
 b=es5l9qzERFAsdJotdvMYQK7+3R6bA58uxZSB+FjSJxRM7Nd3ZO8sdc5s8hc7YW3VtI6LGSAdziQweTgBdEt9ehs/UxPfDKdYcyy3mxhWkS3/YOo7L+X9EbT/Ra3YIfGjAwYKeSD1105E/maZRvdW50KyDXe0NGNQ53VoWOV6g1BESkn6fC+ECNsqRUFnAJUGjcLgXWepx6813P1eLuC4M6pC16QuFdsRkHq/Z+6cw8O+TRwCRqQqhuqb2K++YWdEQccE6BP4V/W94Hct7acZVT/kwRLwa7wcF/E/Gdgw7d8TZfgf5CAfr/vs3iq9ERSRRim/IGDDcxbeXraW8b8KXw==
Received: from DB9P195MB1212.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:294::16)
 by AS4P195MB1720.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:517::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 2 Jun
 2025 11:46:14 +0000
Received: from DB9P195MB1212.EURP195.PROD.OUTLOOK.COM
 ([fe80::2d26:fa56:5972:5247]) by DB9P195MB1212.EURP195.PROD.OUTLOOK.COM
 ([fe80::2d26:fa56:5972:5247%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 11:46:14 +0000
From: Christoph Stoidner <C.Stoidner@phytec.de>
To: Andrew Lunn <andrew@lunn.ch>
CC: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Topic: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Index:
 AQHbzJ5IkKiCUrqPH06p42f/+549BbPiDcKAgAJsSwCAAChcgIAABDUAgAALOQCAACRcAIADjdKAgAAQWYCAAsNAAIAD9cmAgAChPwA=
Date: Mon, 2 Jun 2025 11:46:14 +0000
Message-ID: <78ec24d09d129d52d3442f6319cf1ef5b6ce7f3d.camel@phytec.de>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
	 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
	 <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
	 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
	 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
	 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
	 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
	 <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
	 <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
	 <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>
	 <8e448625-b4ad-4bf1-8930-6fecdedb1d8d@lunn.ch>
In-Reply-To: <8e448625-b4ad-4bf1-8930-6fecdedb1d8d@lunn.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P195MB1212:EE_|AS4P195MB1720:EE_
x-ms-office365-filtering-correlation-id: 36239a31-62dc-4c1b-f264-08dda1cb141e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S2JSK1I2amh4d2ZzSHdoNHZodTFSaGJVZlFoQjhRTzVaOC9tZjViWWtLTVk2?=
 =?utf-8?B?aVdaTm9oeVZHOGJxeWxVcFFNeHVzS2IrWDZlSEE5NUEwOThxb2x0dmtUZ1V0?=
 =?utf-8?B?ZENjNTFIVk5VRU9rOFhCcHcrTUkrYXJDRys3KzVZMVNxdnFnSjRIeCtoVW5x?=
 =?utf-8?B?SkFTaFRrdUpNd0E3dXhqUktnK1dWbVpMazlqTXpiNGhpcGVyQkx2NUdnbHpM?=
 =?utf-8?B?NHBsWEpSa1ozRXp2Q2F0OEpOMDVQMHNtL1E1Mi84VGcvNmcyLzc3ekxRK3lm?=
 =?utf-8?B?WkRNcklnN1VTOVFhOWFLUEcwbmxrS3ovZ3Y2MkdJN2NMeVkvL2h5SkNrNTRv?=
 =?utf-8?B?Z0pFeWFsQUY5MVMyYzFRWUozMUcrVmZhbWVZTFVrbHp0TmxnbzNmenZLVDVH?=
 =?utf-8?B?RFhMUVpaU3ZiMjNORGpQaDdiZElVV3Y0Ni9HNTZkSkVBZFdWNkhMUFJkOG9q?=
 =?utf-8?B?Z1o4TXdsK3lGT2hqYVdidUl2ajlXWlJDQ2FmQWhMMnk1K2RaTmhvOVBXZ1dV?=
 =?utf-8?B?TnZWMWRFV2RiTDhOdHNkZS90UExGRG5hRkNQZENqZzBubmtmSUFJazFvRDlv?=
 =?utf-8?B?cmtKNG9uSmFWUFlrZXIxRlUrWCtvRXZMTytZN0ppYXpjclV6WGR3UDhWbWti?=
 =?utf-8?B?cmZKOEhuZk1sdGNSaWNQckFPbmhVSkpxRzBnb0tKaWsyM095YlBVcktRTjY0?=
 =?utf-8?B?YmxXcjZ5L3cwR1c2UVpmdm5udHFZSUlmc2FRVkdlUEY0RXk4YWZ1dWl3djcw?=
 =?utf-8?B?TU9QOUZ4N1Nwa052M2FIazB2c2hzdDhicW5rZGdTWnVrQ1pPanB4ejFhQTEz?=
 =?utf-8?B?VzRQMDdhY3MwZnhJNkNITTlpYlJNV0JGdTJlaTNtdXp3NjBrdlU4RkNRRGR4?=
 =?utf-8?B?SDhyUmJrQ3BITmVsakphY0hLNmJaVkNCY2phL2F2RTRkaVE2cU1FaDVsWm5a?=
 =?utf-8?B?c3VNekluTTlFMG1ZYWtmUi9xMzJoeWU4R0NXT1A4TEJyenJlbmtjb1JTaXpm?=
 =?utf-8?B?blRvZEd0YVllb0pscVNPNlpmbG5razlpWFo5Z0JmbmU5b0pYajBOckRFRHFG?=
 =?utf-8?B?QzVwMndGb2FvY3k0RHRqZUZFdnVYRmpWVk5Ndmt3VHhmNXZaY0dXSUUzOUly?=
 =?utf-8?B?L2dJaDVOU0lVS2dzdFIrV2g5Z0RVWjhOR1ZtQXFCanp6VWdta2xOK0JRdUpW?=
 =?utf-8?B?K1c5Uy9RTnE1OG1JWWpldWpkWDA4T3J0UjRpVHZiUWhXQ0sydjBCR0RsN3lp?=
 =?utf-8?B?RFpUc25sVHRZWDZPelh4S2QycTZwdEtZWlFzZ0pWV0ZadnhhZ3hjaE5NQXpi?=
 =?utf-8?B?ZU9UNXArU09iUk5zb3h2Q2pYQzBZTlVNZnd3RVUrczMvbmZqNWNXRGpZYXRp?=
 =?utf-8?B?czJDRlF5NVpkUzNjQ1hoOGJVd0cwSXViOXJwOWFNZ3I2eXB4QkdJK25vcFYr?=
 =?utf-8?B?cS9PRlQ1OWJqYU03UjF1M3pTaGZPUmZUNHBLTXdBT1FCc1VaUW5lT1kwcmFH?=
 =?utf-8?B?V2VGTEJQYUxEUEUrai9EcWFDNHRiWG1KL0lva3dBSjRiNkF5K3hCL2tmZHJ2?=
 =?utf-8?B?OHBOWkxzdEl5Si9oQ1hsNTI3WkwwV3RKRERmcEZzS1c4ck9sZGh0YWVCRGtL?=
 =?utf-8?B?YWFZNUtsQ1IyeWJyWFdXUlV0OS94K0Z5Q25TdDhRUzVJbVhKcW5zbTNZQ3dD?=
 =?utf-8?B?QkRvTHFIUGJ5YzlQblNVbGUxdE5QR2s0NDFNYzA0Q3FDWDdkNnhFTUpsazBx?=
 =?utf-8?B?N2pHT0N2dDRPWlBxNG5WUTZOYWlabi9YQng3enVpS0U3UnFJZFVqaHdva1lS?=
 =?utf-8?B?Z25Xc3dyRHAwUnhSR1FZa3NmK0pRWmh1VTY0OHRxOVRMeTZoRU5tMDNXNmNL?=
 =?utf-8?B?T2pmUUJFSWxNSG9LSURWeUZxS3hEY0pranI5b2R2amxtSTk4Zm5xVXFEWTJs?=
 =?utf-8?B?Qy9YM1Q1RllGZlpVaUtIMlg4RnN0TWhDSGxqejZYb0xsNXpZazdZY1EvT1Ni?=
 =?utf-8?Q?Tc74YGH/HZRI8CEHfq9MT3KgPcuvc4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P195MB1212.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2xWWXlMYjNDcko0ZjBwQmQxWnk2MVJMNU1ETXovN1JxV2FLdEZJZlN2aHBu?=
 =?utf-8?B?Tk4vcmIwTVpiUmJOdW1zaG5TL2lZYisyakxKZVQvSTJ2bG80OElaSlpMNEZ3?=
 =?utf-8?B?cGRuNjg0YlB2dUZ0MWh5U0djK1NFekczc3hPWWlCTEVJdVREME9vdGFlb3NU?=
 =?utf-8?B?ZjdLdFhGMVZlSEhKUXIzUVU5NyswUnBCa3BHK2VvYjE1R0hFQjhvZVNubmJF?=
 =?utf-8?B?SWI4N2dTSk5IL1VrUE9NOGwyTzlxd0lwUTFrRDZuNmlVQmdjY1VVM0RXWThr?=
 =?utf-8?B?WmgwR3E0ZUxVM3R3aldtNnAwd3JzbVJIanBCbitGbFFIYk1IM1lScENSazlE?=
 =?utf-8?B?M0s2TE90aEZXWEdNTTB6K0JWanlSLzFycFJQQlV1SEwzaSs1RWVlMWU0WTJV?=
 =?utf-8?B?SmxBWUVmWUp1b1F5NXhCSXBqVzhIbkJaNEhnZkNkRGdmeEdyVCtEWnM2T0tL?=
 =?utf-8?B?NTg5VURkMXY1OWlPSGdGdHIyeUpGb3FiRmdIczZPNW9tclYxbUNybTZOK1hN?=
 =?utf-8?B?aXpOUFY5VGNGTHlWeEpjRXhVSnV1MG5sbTVxYVdDNThVR09IVUVhZm1HU2lH?=
 =?utf-8?B?LzJONTBNRlJ0eCtxT2RCcUtFbGUyNkZhemRYSnJzTjdIbEFWdkVqaHJYSzF0?=
 =?utf-8?B?Um5MTDF1KzNpNDdhSWUvMG8vSVdhLzVvRWNOMU1nSjhTSCtyd1NaYkdvc2dl?=
 =?utf-8?B?ckV5WWY4emVGOEgzTGJjQm9mZTFRcjFrZHhWUUZZTTJwQy9Jc2I1bW1mM0Zw?=
 =?utf-8?B?TjlIeVRpbmpDaXBPUUVCQkZhVExpZGZuT0ZwcUY4UUs1RnpHZlZmY2tnbjE2?=
 =?utf-8?B?OXlPNGx5OGV4cVNKSHdHQ3RMOU5iUUJ4YnA4NDcvUmVnSmVHUkxOQ3VBWWwy?=
 =?utf-8?B?S1FiakdGbTM2dS9zcThidnZMSkozT0FNdHJXT05yaFUrYjBRNzQzQUpjYkk1?=
 =?utf-8?B?L2lBbUZJUzE5YS95NnBRN3dsSW5WVWJoRDBmVTlxa0tUMDdGTUdkTklmTFpT?=
 =?utf-8?B?c2RSb0tnenRvK3pndXg3emNrci9lLzlEN2Y1QmpJWWpndllTMTVFaFQxNEQv?=
 =?utf-8?B?dDNhVnlxT1NBSnErRjdjUkQ4SmtPSXBHdDhyWGpoR2tPdHRYaTdZRmp4dzEx?=
 =?utf-8?B?WEU0cDFzekhlQks0Zk93cmE5WFd1ckp5VmNSdEgzTzF3TVVrak5KWjNzUm5F?=
 =?utf-8?B?MFVONTk3MXlVSkN1OVBnb3NTYUpVOERrWHF3TUpLSE4wZWZkZFZ5eXo1UWN0?=
 =?utf-8?B?bHcydjZBTEVlU21uZ3QyVnhhem1YVExNRUZwOEZ0UmVCdFQyeDhORHBNeGV4?=
 =?utf-8?B?QlZYNW4xTW9oRnREelpEcVA0dFhPKy8rSjNxTmJGQjFtdDNPSXN0anhKUm51?=
 =?utf-8?B?OTJiVE82NFhzNFNHb3ZqZ2xrRXhnVmhNTkdIQWsveDJmV2pCaUszZTVDNk8w?=
 =?utf-8?B?dHprVVpBbHpIdmhoUGdGUE0zeXFrMWlHMXJYNDFTLzM2NnFiYUMvSWIvNVZi?=
 =?utf-8?B?YXFCTmhFWXEzMGRQMDRxTTlNb1p4L1hXM2VUTEsrUzhEa295aUhuejlESzlV?=
 =?utf-8?B?VmdtNk05ZXErVFZzbGZtdFRCMkUrZXJEYTF5QUQvc0hpWmNGWklOVFlNVDlR?=
 =?utf-8?B?YUdNTnNYNlcvd1dJOEwrZ1N0Qy93WHVmZTdORC9peHFJSGgvWkVLZGNYUmdS?=
 =?utf-8?B?THY3WFB6ZGI3dWE3MW0wVG9vZkc5enRJdzZtYVE1bjA1Z2FOVnNkSG02ODFI?=
 =?utf-8?B?MlEvMFNOL2RGNE9ndlJnUkFpTE43N2tUSmgrbjgwdmI4R0pZWjJmRHQzV09o?=
 =?utf-8?B?bldnZHlaQldiTWdYNjhHdWR0NDJQcU84UFFwMFhZVmhmdGlQbHk5MlZIRWlE?=
 =?utf-8?B?ZDJ0TElUMmV2YmpTWElkWVVlTnVtWDc4OHJTK0oreVVvVjl5Y1RUeklOZVJ6?=
 =?utf-8?B?RlFuZHFHbHVldHJYbzVod0ZndGlVUStQNFcrWkZzSEhBWnkzci9qdlhVOXRn?=
 =?utf-8?B?Zi9YbE9DSy8rNkJVcXpkOGpjZjJ0bmxQdFYwODRXNDIrT2xIRm9UcFZYZnln?=
 =?utf-8?B?NnFHTy9MNWxaQ21RQitwL3pxQmJEcVJuU1lOaTZjOTlWajNJSWIyQWNXZHN1?=
 =?utf-8?Q?A8/wQJ6EJ9YoosQlSzWU4af3R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B55028F6314D2D438D352AC390137DD7@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P195MB1212.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36239a31-62dc-4c1b-f264-08dda1cb141e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 11:46:14.4227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXA+Ie82lDb7BsmFM40KcyZ4AMRRmQvXXI/aLT8JrfNpJxBbVnLXTwDq7gG+UgzjVFlQjm5lt5MDxBaqnh3RMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1720

SGkgQW5kcmV3LAoKT24gTW8sIDIwMjUtMDYtMDIgYXQgMDQ6MDkgKzAyMDAsIEFuZHJldyBMdW5u
IHdyb3RlOgo+IE9uIEZyaSwgTWF5IDMwLCAyMDI1IGF0IDAxOjQwOjM4UE0gKzAwMDAsIENocmlz
dG9waCBTdG9pZG5lciB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiBNaSwgMjAyNS0wNS0yOCBhdCAy
MToyOSArMDIwMCwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gPiA+ID4gWWVzLCB0aGF0J3Mgd2hhdCBJ
IG1lYXN1cmVkLiBGb3IgYW5hbHlzaXMsIEkgYWRkZWQgc29tZQo+ID4gPiA+IGRlYnVnwqBvdXRw
dXRzCj4gPiA+ID4gdG8KPiA+ID4gPiB0aGUgcGh5IHJlc2V0IGFuZCB0aGUgMXN0IHBoeSByZWdp
c3RlciBhY2Nlc3MuIEFuZCBhcyBJIGNhbgo+ID4gPiA+IHNlZSwKPiA+ID4gPiB0aGUKPiA+ID4g
PiBwaHkgcmVnaXN0ZXIgYWNjZXNzwqBoYXBwZW5zIHdoZW7CoHVzZXJsYW5kIHNldHMgdXAgdGhl
IG5ldHdvcms6Cj4gPiA+IAo+ID4gPiBQbGVhc2UgcmVwZWF0IHRoZSBtZWFzdXJlbWVudHMgd2l0
aCBORlMgcm9vdC4KPiA+ID4gCj4gPiA+IFlvdSB3aWxsIGZpbmQgdGhhdCB0aGUga2VybmVsIGJy
aW5ncyB0aGUgaW50ZXJmYWNlIHVwIHJpZ2h0IGhhdmUKPiA+ID4gcmVnaXN0ZXJfbmV0ZGV2KCkg
aXMgY2FsbGVkLCBhbmQgc3RhcnRzIHRyYW5zbWl0dGluZy4gSXQgY2FuCj4gPiA+IGhhcHBlbgo+
ID4gPiBiZWZvcmUgcmVnaXN0ZXJfbmV0ZGV2KCkgZXZlbiByZXR1cm5zLgo+ID4gCj4gPiBUaGFu
a3MgZm9yIHRoYXQgaGludC4gQXMgeW91IHNhaWQsIHdpdGggbmZzIHJvb3TCoHRoZSByZWdpc3Rl
cgo+ID4gYWNjZXNzCj4gPiBoYXBwZW5zIG11Y2ggZWFybGllci4gSSBtZWFzdXJlZDoKPiA+IAo+
ID4gwqDCoMKgwqDCoMKgIFvCoMKgIDEuNzEzMTg1XSBERUItUEhZOiBtZGlvIHJlc2V0IGV4ZXVj
dGVkCj4gPiDCoMKgwqDCoMKgwqAgLi4uCj4gPiDCoMKgwqDCoMKgwqAgLi4uCj4gPiDCoMKgwqDC
oMKgwqAgLi4uCj4gPiDCoMKgwqDCoMKgwqAgW8KgwqAgMi42NzI4OTJdIERFQi1QSFk6IHJlZ2lz
dGVyIGFjY2Vzcwo+ID4gCj4gPiBIb3dldmVyLCB0aGUgZGVsdGEgdGltZSBvZiAwLjk1OTcwN3Mg
KDk1OTdtcykgc3RpbGwgbWVldHMgdGhlIFQyCj4gPiAoInByaW9yIHRvIE1EQyBwcmVhbWJsZSBm
b3IgcmVnaXN0ZXIgYWNjZXNzIikgdGhhdCBpcyBkZWZpbmVkIGluCj4gPiB0aGUKPiA+IFBIWSdz
IGRhdGFzaGVldCB3aXRoIDJtcy4KPiAKPiBJIGFncmVlIGl0IGlzIGxvbmcgZW5vdWdoLCBidXQg
aSdtIGFsc28gc3VycHJpc2VkIGhvdyBzbG93IHRoZSBrZXJuZWwKPiB3YXMuIEFyZSB5b3UgdXNp
bmcgYSBmaXhlZCBJUCBhZGRyZXNzLCBvciBkaGNwPwoKSSB1c2UgYSBmaXhlZCBJUCBhZGRyZXNz
LgoKQnV0IGlzbid0IHRoZSBicmluZ3VwIG9mIGV0aGVybmV0K3BoeSBpbnRlcmZhY2Ugb25lIG9m
IHRoZSBsYXN0IHRoaW5ncwp0aGF0IGhhcHBlbnMgZHVyaW5nIHRoZSBrZXJuZWwgYm9vdC11cD8K
CldoZW4gSSBib290IG15IHN5c3RlbSBmcm9tIHNkLWNhcmQsIEkgY2FuIHNlZSB0aGF0IG1vdW50
aW5nIHRoZSByb290ZnMKb24gdGhlIHNkY2FyZCBvY2N1cnMgYXQgYWJvdXQgMjUwMG1zIGFmdGVy
IGtlcm5lbCBzdGFydDoKCiAgICAgIFsgICAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5
c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCAuLi4KICAgICAgICAgICAgICAgIC4uLgogICAgICAgICAg
ICAgICAgLi4uCiAgICAgICAgICAgICAgICAuLi4KICAgICAgWyAgICAyLjUzODAxM10gRVhUNC1m
cyAobW1jYmxrMXAyKTogbW91bnRlZCBmaWxlc3lzdGVtIGE1MDBlNTE5LQpkNzdiLTQ3MWMtODIx
NS1lNGY1MTIzNmFhYWEgci93IHdpdGggb3JkZXJlZCBkYXRhIG1vZGUuIFF1b3RhIG1vZGU6Cm5v
bmUuCiAgICAgIFsgICAgMi41NTAxODldIFZGUzogTW91bnRlZCByb290IChleHQ0IGZpbGVzeXN0
ZW0pIG9uIGRldmljZQoxNzk6OTguCiAgICAgIFsgICAgMi41NTY4NzFdIGRldnRtcGZzOiBtb3Vu
dGVkCiAgICAgIFsgICAgMi41NjI3MzNdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBtZW1vcnk6IDQw
MzJLCgpBbmQgdGhhdHMgdmVyeSBuZWFyIHRvIHdoYXQgSSBzYXcgd2l0aCBORlMgcm9vdCAodG8g
cmVtZW1iZXI6IDI2NzJtcwpmcm9tIGtlcm5lbCBzdGFydCkuIFNvIEkgZmVlbCB0aGF0IHBhdGNo
IGl0c2VsZiBhbmQgaXRzIGNvcnJlc3BvbmRpbmfCoAptZWFzdXJlZCB0aW1pbmdzIGFyZSB2YWxp
ZC4KCkhvd2V2ZXIsIHdoYXQgdGltaW5nIHdvdWxkIHlvdSBleHBlY3Q/CgpUaGFua3MswqAKQ2hy
aXN0b3BoCgo+IAo+IMKgQW5kcmV3Cg==
