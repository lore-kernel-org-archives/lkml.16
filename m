Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2113.outbound.protection.outlook.com [40.107.21.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E7A1898F8;
	Fri, 30 May 2025 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612446; cv=fail; b=T5ki73CChuj/HixwGdZ9ZoeV9GGxGcNXaNZ4qVOk6osMGLhn5OdySlDdy96c4dhUBzkIr/T6Bl6i9Beb9MMaAuOdFonhXnkkMQHiurnXFwGqzDtJ+F97AaNy19VYovaSNWjmsAKU6hXmy0+RpS0BXV+NvPIsOfdcBu/wMWz2nvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612446; c=relaxed/simple;
	bh=cPC6MJmOMZFiwLqbplidJcahA9dRBXMLIP5nSyJbUUg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=svtyVCEZZd7bAZi+R5c6OHXDfHB2vxPYSgbGQxtH1ZrEflFxHgTtx7v1v+eN2a4q5x5yv59HCyjHo2YYrF46TXYq/A16CKSu4VQMuHkqVGhYu5Jp3p/cIXL4z99/bkENr5m2AOhFC6YB7btABpigPZMa5t+Qc6TjCmHwMBZpbU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=M9eCJYfQ; arc=fail smtp.client-ip=40.107.21.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="M9eCJYfQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLqVC9KoEJA6lC6k8pu9DCWo+90blaOwIC39tWw4cJ2mebCQMJupZEvAZJSs7ozg2oG3oLeKgSBhqBvfJJAt+bPW8wT5cDoWdWYWekLeHlkBYlW4z3/BOUcPIQL2hcGWKaTz0qyG9oTTtrycw7/KHYYNCtyvWv9KixZwJL8B9NSTrXXrzlYYak2GcxvixnjN90EUbb6gOfnjwkn5CGBWg8Z3A7tXvU5M3uO5UP9oTmnsN2XSXnLdIuKAHjm6J8dwprWUdlTnjIp+Q43trWWhbDrbrxD259mMGM5Pjwx6M8Mm7gP22Bfhe6xDYt/kr0YxGPY+LwEkrg/K7B/dZOe2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPC6MJmOMZFiwLqbplidJcahA9dRBXMLIP5nSyJbUUg=;
 b=CFkD3igy34Y9pJTw/dPVF2/16idyNYeCMr+O25GEqpZc7hiYCS/ZgfIUTE30IJguvkFqzLuAKeFcnPASVHkGPEvA8Klk15ANATB2vz7tophzfYu4UhmGbsIuo+AKcr9yv/PJVzRmqHtr0/VPbFX5mHVRI6psun4RwzUQEVpE6jOX+dI1PWxEchgNY2UBXQ478SPbF+21+IQDRZhXnDa6U3QOsko743B9qsoIZahMob/E1tUuCvDONtWi32g8s7m985nI6wa8IGmxizo5n+knNHL4u4XiYUWA7ZbqVH7KfcrcqPyoJq++nSnYDtk4FfSwCJzarbxmJn/yyvFXBNGdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPC6MJmOMZFiwLqbplidJcahA9dRBXMLIP5nSyJbUUg=;
 b=M9eCJYfQJy4QASO0nPmmF7LiWQcpLLacj0QmxQWrRWb4dfXXUCdHNoKcSuFLOCDwmvRr2FMuPy+7C0CDRnjB/gzgi3wGkC9nOqVwIeVr7vfyGb/c3wOyoFx7fVVWqOD1F20l46aIRrFFtXyQZN5nQtCDw/YtAuTiPHuMamfh4cbTUHkc916f3KuAnrxxVlCfCWgU+9DTKeLcpphoowtqGSepeot/xweX4IOjJHVgT3ExBF2k99YRYbc8teJPWlbob3E6H7553s2BtFweDk44UHwqoGxib+e0mF12ZmHEikIjF63qCJwMuJ2EbTbrw91VE8aNtOMFeqZlQ2XDmkBRHg==
Received: from DB9P195MB1212.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:294::16)
 by AM9P195MB1298.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 13:40:38 +0000
Received: from DB9P195MB1212.EURP195.PROD.OUTLOOK.COM
 ([fe80::2d26:fa56:5972:5247]) by DB9P195MB1212.EURP195.PROD.OUTLOOK.COM
 ([fe80::2d26:fa56:5972:5247%4]) with mapi id 15.20.8722.031; Fri, 30 May 2025
 13:40:38 +0000
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
 AQHbzJ5IkKiCUrqPH06p42f/+549BbPiDcKAgAJsSwCAAChcgIAABDUAgAALOQCAACRcAIADjdKAgAAQWYCAAsNAAA==
Date: Fri, 30 May 2025 13:40:38 +0000
Message-ID: <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
	 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
	 <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
	 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
	 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
	 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
	 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
	 <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
	 <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
In-Reply-To: <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P195MB1212:EE_|AM9P195MB1298:EE_
x-ms-office365-filtering-correlation-id: 5d7b386e-d6b5-4fde-54c9-08dd9f7f9030
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WFhuczFuNS81VGQ5T1pRRVV6SnhWWnp2TU1VK1lUdEF1MXFjTWlUQ0hRQWtt?=
 =?utf-8?B?L29VSzJxRlNocVBibTY4QmdsVlhCNUVHT2ZyakRGem9tRmxwcTNtKytyU3FQ?=
 =?utf-8?B?OFA4MnNHN0RMTXpBWnovWFFQVFgwamxrUHI4ek5vbEplMmQ3cFhHbzZ3ekpC?=
 =?utf-8?B?bzNsbkQ2WC95WEFINXhLZllqWmNtUXNIOGh0SndsbmJJNDZMU09MYmwvci9P?=
 =?utf-8?B?Z0JxMHJMRlBadkZEOFVMU2phdGdYUVkrQ3BkYWN0OFNzaWtlTVB2V3hRZnlv?=
 =?utf-8?B?N1crWG1BRFBkYU42R0loNnpzK0tWQVMzSkY3Qll1VERDMFRrTHpGS1FTRUtt?=
 =?utf-8?B?ZHlkR2RRM0R2VGlhSmEvSllNb1FoMTIrYnNITkpIVWNaNU1CamIzQmJmUWlI?=
 =?utf-8?B?Z3B0YnJwOWZZdjZjK1J2U2VmQk5TSDlFR1FYL3FCU0VtaVZTajB0UXQ2SUdV?=
 =?utf-8?B?TXpyTVRTNUpRSFY5cElqV0d1RTlabnBqby9PRG1LclRwSUN0T2M4ZE1aUGxX?=
 =?utf-8?B?SnJtREhUTi9XQzJ3YmI2YUVVOElpSk9wdS8wemZzdDlxek0yYnB2aWZPOXJL?=
 =?utf-8?B?aEw4Y3ZvRlNKOVZpcUs4OTJIS1JOSC9Bb0tzaWRyMkI1Mjl6ZDUvM0NTa3RH?=
 =?utf-8?B?d2pnMElPNjJnTTZLeHFFM2UvaDR4RVRlbUxHdEo3cGRkYU5rUjdaS05VZkVl?=
 =?utf-8?B?MmQ4M2Z3TkxoZStBK1hqaWc3ZlRMc3hmOHl1aUV2MlpYRWVBbzBXc0ZDbnM2?=
 =?utf-8?B?ekR5djRzQ2ViVTNXVksvV29aT0l5U1FqWTdrTVhPMHVtR3c2NnNSQ3RXUU42?=
 =?utf-8?B?TGZkZDVjV3QvbzA0L2Zkc3I0MVk4WkVRWGt1NjU3bHd6UGdhbFZxdXlYOXRp?=
 =?utf-8?B?UE1PWEh2UCsvaXpiZDU3dzNWaW12Wjg2d04zdEZYS0ZGbUJRcDBheVFQb1Nw?=
 =?utf-8?B?bHJDVFkyZUxmd0J0STNMS0xWdUMyY2dCbHJ1WjZWM245N1F4NHowSlpGRWNn?=
 =?utf-8?B?R2RxT3Bqc056eElwV0tFUU1GMUg5MEI3NkZSU1RvZU5IbkZmcXo3K3ZZM1JT?=
 =?utf-8?B?VVFFZkt2bE0zYWt0WFY2a2xGdStMUHg0UTdHdTRmQm5pUFBKTlB4dTE1dWh4?=
 =?utf-8?B?cmNLS1o4ejIzNTdIUUQwUjAwYUJVbjZ2WGV2ZGl3citoTzdMOGZPN1FWVER4?=
 =?utf-8?B?TFA3TmNZVzR2WFJ1WmlwRHpHK2lmSk5HcnZmM2R0TGx4MW1yWFA5WUJ1aE5K?=
 =?utf-8?B?VDM2YWIyeE9XZEh6RkRVbTY2SUJZWDRPWkJERE1NZ2pCOFdVMitqOEViZWZw?=
 =?utf-8?B?Y2NNQ2pvTS81anZmSGM1RFBvYWoxTlU4MXpaRFlkZDdVdWZMSXpvN0NlTTVE?=
 =?utf-8?B?YWF6ZStTL1lkUmhCQS9rbGZGMTVSbEpFMWNYL2EzOU5ENnRjeUlwSTJLcHdX?=
 =?utf-8?B?Y1FLQWpZSHFkUmx0SzRMeTdhY2tsNkFCM2xZbXB6T1poOTJhQjlwb1NlaWxD?=
 =?utf-8?B?Vm1PSU1LRHR4czRUTkZQM1hZQUt6ekMwQWRFTVpjajg0K3NMWVlmeGowSXow?=
 =?utf-8?B?Y09zVDBwQnF5M2JyZDY5WUZ0QnFHYm9FNTdzY1JFVEtkM0JvdWVKMnNFOGlV?=
 =?utf-8?B?d0tiUW92WUlZVnhOOUIxY21oeDlxYmorV2dTTko4R21JQUFHdmRxajV6KzVw?=
 =?utf-8?B?YzhZQTRhWUIvZTFjSDJCSFI5dkNkSEdUVWpuL2JSeGlmS2lZcXUyTjNqOXpD?=
 =?utf-8?B?UTRYeFZJbkJBaURIaHo1MEJud09XNGt1d3BVNk1OQzdIeS9aaisycVNlWmZJ?=
 =?utf-8?B?MVV1RHYzL2F5Zmh2VmQwTnVIa0RRei9Kc1ZRMklLaXdiRzFIVGdkcGJIRTg5?=
 =?utf-8?B?WGVIR243cmRXRHdETjVHUVljZzdOa0xwQ0hmTXp3bDVucUl5bStFNWZKbUxp?=
 =?utf-8?B?dEpUWXA4dW5lL3l6Q3VQK0V3NFVaMS9maEVrMENabTNPZzJ2V0habWNhVEt0?=
 =?utf-8?Q?V2efU0350QNsepZSPRwYDfCcphjOt4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P195MB1212.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEcwSWh4b0RhTko0enpBcERVU1dkY3drTFFaTDdNZE1aQVVac0x6N1FMWjRn?=
 =?utf-8?B?NitjRlB6Tm5IelJUbDhhMzVieHdGRlFlc3VTSWh0MDJnVzIvM2ZOREY5bkUr?=
 =?utf-8?B?Z1lHc0JpQjZUQ2UrMlV4c2JPZFJmdC9UMWlSb3ZvYmt2aEk2am5mYkJNYkJm?=
 =?utf-8?B?alMyVzB3RTRiWklad3E4dmtncElMaDRlYzFGUDY5RzFkOUtlTjFJcU5YNVBv?=
 =?utf-8?B?dXl1Z01mYVhZTndhaWVhTmNweGtzYXp3c0RvQkp5aEIyYm9MK3IreERKNjlG?=
 =?utf-8?B?SjNYMHhDemx1VlozamhzTmNBUHVHK0hJK2pPeG51WmtDam9BZVlRMkcxR1J3?=
 =?utf-8?B?S0QzaWdyZzlpS3ZlanBuZ2tFcVRjR1JBUlZINkhXWXo5bjUrWGcxNWU0WXM2?=
 =?utf-8?B?NnJ4ZFpBTHBBQmt3b0VrUm92WmdWanRKaWxzSjZVNWRVR2graGJuUHFyNUxh?=
 =?utf-8?B?U3F1V1lLcTNoWTZ1SUl1VXcwc0hOOVpwT3pmaDcxbytXUEVKL0Fpd3ZlanF2?=
 =?utf-8?B?ODB3YXlKelMyYldFUFpmSml3MGt4eWJuNjZXdzFEVUp3bTF5MXpDMEVqTTRU?=
 =?utf-8?B?MS9NTm1FVHdPTytVM1ErM0pYdEp3a25LYVdtWU5mVms5MTdpbFRsSjl2SXlU?=
 =?utf-8?B?ci9SVGx4MEVTa0JEWE1kcjZWQWR2c2haREJxNkhlQ2NTdWF6VkgvYXhyaE5Z?=
 =?utf-8?B?c0RDUU1kNDlBMWNPQm54eDQ2bVBXSVZSZkdaSzUvRXBqd1YzanI0OVR1T0cv?=
 =?utf-8?B?VUIyNVF1TnJtclJPL0FMUlZYbDdFb0NFNTJ5NUpwRWJOd1NiQ2IrTE9yQ1FY?=
 =?utf-8?B?aGxSSkV4VTMzVGw4YzA4TmxyRjl3RzFqYzlFQlZxUVVIbStGQjV2VmthREZi?=
 =?utf-8?B?eWdPWmlxY204NDFFNmlZRUFDMExZL2tScmE2eHZmKzQ3QkZ0N1JMZUlteFd5?=
 =?utf-8?B?cVIzY2dYeGxGaUlQU1JHZjhldDJsWUtpY0QrS1kyK0srVUNObDAwVXp3dmJY?=
 =?utf-8?B?UFk3Nkc3NkhnZVA0ZzVkT1BWZURIbThPZ05aWWx6NjlVTk8vYWJSV0RvMlhR?=
 =?utf-8?B?UW1uMFNlYUk3VVhkM0hZcVRVVGhyZUlTM1ZnaEttWFBpS0xJSDNOMzNXcWJq?=
 =?utf-8?B?aXVaZFlsWTJqL2txbFN5MlFSeVVKaUVkN3N6bXFoMC83ZDdCYW1vT2EvUU9N?=
 =?utf-8?B?Sm1xVGVvbzZyR1RFTWRheTljV1I1NnVoUVVudE85MzJNWk1HMG51dXd1YzV0?=
 =?utf-8?B?MkxpSWNsVW15bXRWZjhwWm1razA1NUZEUCtqQStjb2FkcTY1emRLUkRKM0hF?=
 =?utf-8?B?R2NJS1pYRWlSdDJpZHZQOW9YNEoyU3UrMENVV0U4dEJrZWJwRE4zZHFMbTRa?=
 =?utf-8?B?QzI3dHpzSW9yR05zWFN1MXVxV09Jb1N5YVdrUzRtcUdISzZZVXpGa1lVYUpQ?=
 =?utf-8?B?L1RmRzlPREMrd2NSek5GQ1Z1ampxY2NPY2RvZUpPZmZnR252QUdQczg3QnhM?=
 =?utf-8?B?eE9aTjdKbmJZeDduRytPM1hNV3g2b1puVkJwcDEvQzVsQUFWWmROcHdDVmR1?=
 =?utf-8?B?MUJvOWRnUnNOeGUvWW9BQkpybHFxRmZyc1hqMlFQYzJjVnBLQzJESzZvUGUx?=
 =?utf-8?B?WHBZMW03dmVNNUxzaVkvb0o2cStWOUk3cnEyTGFBNjdSWUlEdFZVRDBVdElw?=
 =?utf-8?B?OGpOQkp6eEpMcHhLRkdFeUgraHR5NmdsVUE1MHpta1owNHgyaEE0and1cktD?=
 =?utf-8?B?QVN4TVF1MDhRYzZHbDU0dzJMSVpjOVFBKzZZcFNvRWdHTHhmMzBiMDI4MEdM?=
 =?utf-8?B?SU1UWkIvNzY3WGpJVlp4MG9VeUhNY0xVSTFMbUIwWVI3QnYrMmozWE5CSnBo?=
 =?utf-8?B?d2RSTHhzQUZKY25ERFFsZVpRYjhscGhMMk9tMU9yVTc3czVTMmxPdmZhT0Uy?=
 =?utf-8?B?SkJJUWg5NHR6alYwK0JjbloxMEtHN0V3MlNWQjBLQkpBZit0dFgrdDYvcDBm?=
 =?utf-8?B?bHV0cWV0azZBa3J6SVlqK0lWWU1yZUNOalJxeDNzSlFBTGRYa2xJVHpBczJ4?=
 =?utf-8?B?RFpwWGx6SHdibjZkOUhjT0srV1BwaWtaQW4zckQ4c0dtM1JlT25jd1A1TzBS?=
 =?utf-8?Q?4YgnFw2Ypeg9KNXcgNz+VRob7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E6ADDEDEC068E469430D089486E3383@EURP195.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7b386e-d6b5-4fde-54c9-08dd9f7f9030
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 13:40:38.5058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtkmIII6r8WMiWkTYpa2GMEF6xXYjfdcLQFvm7FxKvkPQJLbi+hPwxlf3K7Srzl/CKuDM71KK5ZT6UGFH14pmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1298

CgpPbiBNaSwgMjAyNS0wNS0yOCBhdCAyMToyOSArMDIwMCwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4g
PiBZZXMsIHRoYXQncyB3aGF0IEkgbWVhc3VyZWQuIEZvciBhbmFseXNpcywgSSBhZGRlZCBzb21l
Cj4gPiBkZWJ1Z8Kgb3V0cHV0cwo+ID4gdG8KPiA+IHRoZSBwaHkgcmVzZXQgYW5kIHRoZSAxc3Qg
cGh5IHJlZ2lzdGVyIGFjY2Vzcy4gQW5kIGFzIEkgY2FuIHNlZSwKPiA+IHRoZQo+ID4gcGh5IHJl
Z2lzdGVyIGFjY2Vzc8KgaGFwcGVucyB3aGVuwqB1c2VybGFuZCBzZXRzIHVwIHRoZSBuZXR3b3Jr
Ogo+IAo+IFBsZWFzZSByZXBlYXQgdGhlIG1lYXN1cmVtZW50cyB3aXRoIE5GUyByb290Lgo+IAo+
IFlvdSB3aWxsIGZpbmQgdGhhdCB0aGUga2VybmVsIGJyaW5ncyB0aGUgaW50ZXJmYWNlIHVwIHJp
Z2h0IGhhdmUKPiByZWdpc3Rlcl9uZXRkZXYoKSBpcyBjYWxsZWQsIGFuZCBzdGFydHMgdHJhbnNt
aXR0aW5nLiBJdCBjYW4gaGFwcGVuCj4gYmVmb3JlIHJlZ2lzdGVyX25ldGRldigpIGV2ZW4gcmV0
dXJucy4KClRoYW5rcyBmb3IgdGhhdCBoaW50LiBBcyB5b3Ugc2FpZCwgd2l0aCBuZnMgcm9vdMKg
dGhlIHJlZ2lzdGVyIGFjY2VzcwpoYXBwZW5zIG11Y2ggZWFybGllci4gSSBtZWFzdXJlZDoKCiAg
ICAgICBbICAgMS43MTMxODVdIERFQi1QSFk6IG1kaW8gcmVzZXQgZXhldWN0ZWQKICAgICAgIC4u
LgogICAgICAgLi4uCiAgICAgICAuLi4KICAgICAgIFsgICAyLjY3Mjg5Ml0gREVCLVBIWTogcmVn
aXN0ZXIgYWNjZXNzCgpIb3dldmVyLCB0aGUgZGVsdGEgdGltZSBvZiAwLjk1OTcwN3MgKDk1OTdt
cykgc3RpbGwgbWVldHMgdGhlIFQyCigicHJpb3IgdG8gTURDIHByZWFtYmxlIGZvciByZWdpc3Rl
ciBhY2Nlc3MiKSB0aGF0IGlzIGRlZmluZWQgaW4gdGhlClBIWSdzIGRhdGFzaGVldCB3aXRoIDJt
cy4KClNlZW1zIHRvIGJlIGZpbmUgZnJvbSBteSBwb2ludCBvZiB2aWV3LgoKUmVnYXJkcywKQ2hy
aXN0b3BoCgo+IAo+IMKgQW5kcmV3Cg==
