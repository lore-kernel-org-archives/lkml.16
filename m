Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022131.outbound.protection.outlook.com [52.101.71.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D02D9EFD;
	Sat, 14 Jun 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.131
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910890; cv=fail; b=qalyl+6boS24l/4nJKyeSwhie6FAoIyPDw66rWAmPeddO0H1cLt/zR2T53pI++udpkXTJD38u/ltZxd5+PSlcpz5vJ2ikCJmWTJ+tMpj7fS/Q3I4KWU9y+2SinVvDdpULtD7gvXipD8HB+THuTDWPkttIFcEySUggAxN6m8LPDI=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910890; c=relaxed/simple;
	bh=Yn78aV4tO5BC66klayZak+yfLctQwUctzagauf4wddY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=M+8dWkaXqxfZoHNG4M8/4XcomN+6X56lzR0Lt0jBZbY/DXG5AfAYYPOBDxppptfSjE3V0Ee23UNi5paqUILwtbeH9qAftnElZuVFRFi0fu5qaITIZq9z9khAVzw5PsoN0mZDEDtkM4zZWtbXyv/cgXalfg2YW5y4aD5K5i3AVpM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Z8kJ7O/d; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Z8kJ7O/d; arc=fail smtp.client-ip=52.101.71.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Z8kJ7O/d";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Z8kJ7O/d"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nGASdD6lJGsSMzQADrHDYvR3huc6HJMMacBUN0drWKHRnGAURkAXWhvF4TNwGAWYJh5qlSqqr6nky0yhAqmqFWyTSiM0M0WZAznmUtvQ0d9qeG91NqqdGmssh9VgoprHxM5zLEA4e9m24HxzZGKY67yolKR0UGHOcvdDvQvixGmLs/xr6IWiKPjOG9qvcIf2UTeVDPERHTCSKvBOd//uLIzudJmOQKr1hLzqZwMUDLowtYfXb3MbhRUfamXD9nGDH9KVDrW68QisMcijWouuhWFbIiaMe64Yr0aAg+HVRv2HzbgmnOQhRSyyMKPt618IyaXbRusqvKZmTmfS/bD58A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbeA5qTh5qldGSufGRx8ZqI20thu/X+Dvs2AFFN1a3I=;
 b=sqKeXSOyPIjH5b/hX8cCbVcXnBb+tyhYkrCaxR059lK4uxNKJon2TeHNOxTIdQfYuEPWaqUu3pAr0GDgxbiJU1PlorIguz8BSLBWlGnM/1OX3pGMYnS2MY6kYMxFFl1MPBu9ggt2xdXSxTu4woUSjJl0oHaXqkegs+y7WgHl7pFJDv7Hq+IC5hJiAXPi1blzP5VsotuJea2N5oFgkgVoway8YZe1wgwyk4zQ3/XyeT7BH+4u1nWtrZ5XghHPSwvYl8rx/KQXyScVJh7XAE4jPb4ALfZ7TF8DO94Oowm0oq6OzEKVSqdIWmZkAxdK8OE2lYOa5lMy5TA360W3BjtgzA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbeA5qTh5qldGSufGRx8ZqI20thu/X+Dvs2AFFN1a3I=;
 b=Z8kJ7O/dVlw7cnpioGYb0HVi5gPOvgcsDSLYd8h/Eb9yIin9SbyjjlYR6oxX4H3YtsRmtV7gQ6uIE3mNw7U882gIwFV0+Q9ZKztkADQl8AkmJtHqnEZkz6kE3udxFEKEqrLYEMKTJs+jPJTaDo719WigIUZIVU6rzIEyqoH3qbw=
Received: from AS4P191CA0052.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::25)
 by DUZPR04MB9725.eurprd04.prod.outlook.com (2603:10a6:10:4e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Sat, 14 Jun
 2025 14:21:25 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::7b) by AS4P191CA0052.outlook.office365.com
 (2603:10a6:20b:657::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.27 via Frontend Transport; Sat,
 14 Jun 2025 14:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sat, 14 Jun 2025 14:21:24 +0000
Received: from emails-813896-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-110.eu-west-1.compute.internal [10.20.6.110])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E1E007FF11;
	Sat, 14 Jun 2025 14:21:23 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1749910883; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=MbeA5qTh5qldGSufGRx8ZqI20thu/X+Dvs2AFFN1a3I=;
 b=dBTsNzYrR6zXYcXQ+EhNVFrGPEpMg8jry2NRAzKOn0kObE1T6dOilWoxbzHquubbwWUpe
 q6ecjLOtp7X9kNb3vOl6slVuYzqnSAkl6X/O4N8m4whB6WgqrPwXakpnZmGobMbXxTCdUhJ
 e5Jyl7O8iapTZmprDCqMXYz+iyYYmM4=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1749910883;
 b=i7GnxJck/j+E0JENM2NHr9KSLWnP+oaaWPtun9H1IgZmxmHXh1OCqi0/L86pLXZtNBpd+
 1D3+6Y26gnV6homaKeNWN4bu9ygaxfgSkx4yAEN/LhLvcdSZUVkT8tzJOkCJaFs1oP7TV52
 yzRglfK4kp1BCUGVfB39LxQmxR8gxyg=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RF4RKYIzh13QplLWWgTenW0xk1AvMb3N7KnjHKI8j9IP5z5D1tj93HQk5YxNfpJpyYuoQeTMHEY0TlsC7mmA8otdG0bPuojWAhpe5ajON7eAD05iAheih6OeHYgZ9r5Hs3jBl3Tn/TzTw9k1u+lN9Y2vN1JGjNUoh4EDVZchO5fK8306M7T7Oa7UGN1UrPss+QawQRF6RCFhOz4san+AoykX1+3JABwfaV4ZXxjvA5Esg6hIY2ZBPQ9EwV/KX9GZaFQVKd94+ad5cbhnil24AtDDP0plx4s27401Ffje663I++Bty/kqdp5ZYg0qA3yIolRGbkI4lzNroZO2xTRf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbeA5qTh5qldGSufGRx8ZqI20thu/X+Dvs2AFFN1a3I=;
 b=xN+UErj5naQhqCmRmcx9ZrsqwoVNqLTVM1wgSruRTk8BQRBGAYx8Nnahu6BnHpZgQSylyi20lijWrLf95o86atRFj8RM20vd8QLKhsJFYCZV2/n6GFWyL+WEjhWOAysJVlPsmmOcHUCX0JArbLWf8heawTrfxwUeX5ZhoZaJ7Gmgb2tG+sit0kKJ1MiGtlQmLlCy7AQQOD9vWAyZJpRq5MBMqsnquqhvYE0xYc79winQveA6Aluz2rfZk3cY1rdoIClD6Z2tMol4uYOh1wjDhonP9j22dWD0JdILA5Sa6SOc9BjdA5xVBtIZj3On/Lwo7MgXF0eFZ+UcDPrb1TnDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbeA5qTh5qldGSufGRx8ZqI20thu/X+Dvs2AFFN1a3I=;
 b=Z8kJ7O/dVlw7cnpioGYb0HVi5gPOvgcsDSLYd8h/Eb9yIin9SbyjjlYR6oxX4H3YtsRmtV7gQ6uIE3mNw7U882gIwFV0+Q9ZKztkADQl8AkmJtHqnEZkz6kE3udxFEKEqrLYEMKTJs+jPJTaDo719WigIUZIVU6rzIEyqoH3qbw=
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by VI0PR04MB10174.eurprd04.prod.outlook.com (2603:10a6:800:243::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sat, 14 Jun
 2025 14:21:08 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%5]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 14:21:08 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH 0/3] arm64: dts: add descriptions for solidrun i.mx8mp
 based boards
Date: Sat, 14 Jun 2025 17:20:55 +0300
Message-Id: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEeFTWgC/x3MMQqAMBAF0avI1i4YMSJeRSzU/OgWSSQLIoh3N
 1i+YuYhRRYojdVDGZeopFhg6oq2Y4k7WFwxtU1rm950LOEewsmaWVPgDfB2hTcrHJXmzPBy/79
 pft8P4AmYSl8AAAA=
X-Change-ID: 20250614-imx8mp-sr-som-ceef5bef1bed
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TL0P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::17) To AM9PR04MB7586.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d5::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB7586:EE_|VI0PR04MB10174:EE_|AM3PEPF0000A797:EE_|DUZPR04MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aacf7e0-e7ee-48b7-03f8-08ddab4ebe2f
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|52116014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SkFkUTF0R3VIRHVic09vWUdMWENxNm15cFBIb3NaZldDU0JPaHVPejNVcHhQ?=
 =?utf-8?B?UkhrcUtQYlZvaDZRcDdmWXZUcWp5NUZneVJ2S25MSWVkY1gyajlUby9Xek5a?=
 =?utf-8?B?T2h4REN1YmJPQUJTVHpxK3lFcVpJSE94cE9NTjg5b2t2UGszcE9aZm9hMHEz?=
 =?utf-8?B?YldWanNtWlltVlZxaHp6ZGRpVjRTcnVXbkhrRENkRnp5ZGllcUVKM3QrcjFC?=
 =?utf-8?B?WEUxQTBuOFp0ZGpMYVJWS0ZmSHZWSEdaVXNma1FvdmlZa2VWYmdMQ2s3OTNQ?=
 =?utf-8?B?bmdqU3VUVkNVUTQzMVMyS1NucGphQ3JPcjZremthNE1uL0NaMnVyUXpGK0wy?=
 =?utf-8?B?UEVDQXhia0dWeFF2THg5cmQ1WFEvTG1XM3FDNDZWemZ2ZDlzakZyak56VHZ3?=
 =?utf-8?B?di85ZWRLY0E1SHpXbXl4M0hETCsyNUlKeG1iU25LWDEwNnV3ZmczWjhsbHZw?=
 =?utf-8?B?OFJuRDhNVVFVUW5ObjRVUDlQRWxPTkhqMFVFb1crOTBsMmhvWnpPNmk4anps?=
 =?utf-8?B?TVJVY01HNnhSNjliTnJFNlJHajRXOHJBOTJZR3RSeHNadHY4WkZXaUNxNXBm?=
 =?utf-8?B?M3JMV3dCUjRtdngyZzBOQlFYWE51aHhaME16SnJFSU9SMGZlSFc2NDdOekJP?=
 =?utf-8?B?N0JQcFZzUHBJQzJhRWVaUHU3RXRUMEIzOGlXekRsZEZ1Z0I5bUxsS0N0dVNx?=
 =?utf-8?B?Smc1cGhLMFNWNk1kZ2llRDRETEtVQW5FTXlGK0N4RG5oU0U3NldMbmh2K0ww?=
 =?utf-8?B?Y3A5K05nOHdSWHRvKzI4SllsOWdvS1hKL1RkTlNQUzM3TVJML3RiV1RqQ2x1?=
 =?utf-8?B?R2ZWTmlRZVNjd0xNVWI5ajcwZkZjWnhyWHpaSVYyVWJFRWNFTlZ4Mk4xREFu?=
 =?utf-8?B?UGVhOVlLSzV4TWRXQ3EzS0h1TWMwNGhmUUV2K0dWSElwUW1Mbnh5SHUwMGE4?=
 =?utf-8?B?S0Z6OVZSK3JKZEpHT285WVdpUTJQQXRLS2JNbGI5ZU1yYVRGTDVRV2tqZkg4?=
 =?utf-8?B?dUZvK2p5WEhTUG9lMkhwdE4wK3NTNDZRMmNnMzJENGtLK3hqMHU1VlVhSjJE?=
 =?utf-8?B?RmpDMTRSTHVQWUNpOHFmaWwyVGRYNzJON0xVTkhFWWgvdTBYQ0VHam54Y2pa?=
 =?utf-8?B?SE1qa2U2YzkycTRad0VIblN3eXVRaCtQTGpRUGZvU2NabSswbW5aU0VLaDJJ?=
 =?utf-8?B?RDI1RWRvS1pOTXBUbXIwQTJENGF0b0ovNW40SFdNN1NSYS95UVdSWU5uNmRG?=
 =?utf-8?B?bmw0dHY2Wmg0NWlwSHk1bWYvZnhhMHFnT1VrL25aY0twMG40Zm1vY3dkMnVu?=
 =?utf-8?B?cExvWm9aOEMrSjZZWmNuNk1mRmhIYlpTaHlqK1Z2aTZQVjdtZGpPY2NPSS9z?=
 =?utf-8?B?L0ZOMEcvcVNTNGVDZFFmY0NzWkh0WDd1cUZEaU9Qc09wcUI0ZmMrZXdDbmI3?=
 =?utf-8?B?Tmw0aGhINFFXcWVETGQwUUpSclplU2FQQzI2VDVyOGVrbE12elg5VmQxYkwv?=
 =?utf-8?B?RXJ6RFZPVVhnSEorRjNuR3BHeXd0dmwzMXJJZGh5WHZZWkF1V1JQODViOW1s?=
 =?utf-8?B?TEl6aG5qUmdCSjlhTDBNM2N1NDI3NzczSTMwL1RwRUNEL2hRVnNvOUxraXFa?=
 =?utf-8?B?WDcvRjErMy9mN0NGaEJvaUV5UVBlU1hwYWZjWGUxb1NTRk8yMWp0bkxDenNs?=
 =?utf-8?B?S3RuZS8zNTVaRngzaW8xaWp5K090ZDZ3OWhKaGlBbUN5Yy94VXUzaVcvWDQw?=
 =?utf-8?B?ZGdmajdVSnR0ZG14TExYT0EzamNod3hUVUtzMzZPSU45bVNwNDFEUVEwSnh3?=
 =?utf-8?B?VjFIV1pBdW4ybENST2lxRkd5alZteThDR21NbHJ4NW5Bc0ZvVXBnRjN3Znpq?=
 =?utf-8?B?WDdsN24vc09WMkRadTgvV0tUaWV4UXFMTnp3d1JiYTdtS2gwTnZhZWlHY0lj?=
 =?utf-8?Q?DXWTX9VW/UY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(52116014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10174
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e303a6a63830472f919f80b7f6d7115b:solidrun,office365_emails,sent,inline:c6c1941fd6a7e60e4eda29d9496811eb
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0c7e645e-6ad2-4aeb-0b34-08ddab4eb4b0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|35042699022|36860700013|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2pUUkpYNFkrbk9NeVYxV3RwT0lzT3JRcVoxK2FyTHhKNXBCRW52Q0dlVk5o?=
 =?utf-8?B?cVp3MU9NTjI5Q2ZGRGc5YTA5MkpZWnVpdjJMRC85UitNanU3ekZHZ1pvUGVU?=
 =?utf-8?B?cFRWTmxVWCtLNE5kUm8vdUtTSDlkUTlOSUtHc0tFYXZVR2FVQjFzWkhwMU14?=
 =?utf-8?B?NzlCeXQ1MnVsOStPSGlZd1c0WUswMHB1eVV6WnNFUUNIUnBaYWtNZC90anpp?=
 =?utf-8?B?bzhYdkFVNG02N1VFVTdjQ3dwT09sazZ1eWlQM1k0ZUtjUFh2Z0xYQnVIS3A4?=
 =?utf-8?B?QUV2WjY3YXJObmhCNHFhMkdramVMYjIrUDNGK2paSUJJNmcyWEpybVU0NlJX?=
 =?utf-8?B?b1ZwaXVCNW1ZblhvVHlZcjlUQTJzMzFEZlFzZnlYNVVhVjdCMExhYTRxZE9h?=
 =?utf-8?B?bzAydEF6RjlqTEJIZlZ4VHhFd1AxTmRKdUV3Ynd1UllhYk9FdnNjZWYyMVdE?=
 =?utf-8?B?THlqejNEc0YvVFF0eHE4bkV5VnJwamdJMUhvY2pmNytXekpqZVBqaXpsM3lQ?=
 =?utf-8?B?VktCM2xKSXVNTXVNeVI3MWpVK21KYjYzK0I4dWNacDBNeFhxNy8wUlZQN2dE?=
 =?utf-8?B?a3dBSGw3QTdjWkw3MnFTWFZwc29xSWlaN0dPWFZhU3lyeHFsVmc4ZXUzTTJq?=
 =?utf-8?B?NGZkYkVEMVo2dldFb3E2N2ZxYWhkeDVZVXVNclJJVjNVd1BRUzFwWWFqcEYv?=
 =?utf-8?B?UWpFN01kZ00vV3UwaktPNVRndWdBK3NDemhveDhiMENySUZpdWtlOGw3SnlD?=
 =?utf-8?B?KzRPME10MUl1WCtYTjF6LzlzMUNWRGFkREtHYnVkQlJ5WnBJM2xVV1MvSHg5?=
 =?utf-8?B?YTE1YjRNTDdRS3dhQW15ZWdGTHNZYmxqMVdCcWNsM3FsZ0hSOVNQUjVQWlVF?=
 =?utf-8?B?eCtxTlBmMEtrQkpDQUFRTGhHd1Bjazd0RFFZMk9ESGVZam9xWFk3cXU4M0pm?=
 =?utf-8?B?QlJ4S3djSEFJSm1paFZDMzkvZmdEbUJRMWhmUktueU40eVh2SkE0dUVvVDlj?=
 =?utf-8?B?UXlMZk5KM1NTYzgxMFlDbmF0UXJjeDhBbXkvK01MSWI5aERVeDJtWFZwbUxJ?=
 =?utf-8?B?cmppR1hTU3ZDM3hvWlo4OTFxU1VULzVab1pYYmVORk9uMVdlc1JjNEZ3cGU2?=
 =?utf-8?B?ZStzMDZjZ1VtR0dsZERaMytSWWVOd0hkRTZLL21YdmgrRnA4MTF6Sm9kdjVq?=
 =?utf-8?B?eGQvYWVzY1VOaFlLem5xcldZUnZIcS9YNFNDdEdSSnJBYnU5OVlLWWdrSElH?=
 =?utf-8?B?Sk5zYzdQSWprMzE1bUFPdXQyeU9HMkczdGpHK0xYSlJEMmNkbGhROGdQUnEx?=
 =?utf-8?B?N0tEZk9mSGxCSmpwSkpvZ3g0Z3ozdGlLWlNVelRMajlVTGRNRHhCclRPRExN?=
 =?utf-8?B?WDR3djJZempVOGduMDlQc3hBNmVBU3MySVRHRWlMNHFHdnh3RkFqUFlQd1VC?=
 =?utf-8?B?cmRsK2pYSVllc2pxcGJ0Yi9KMTgvM2c5T1ZXWnQxZkNlT2JWM05oejBrN3Jn?=
 =?utf-8?B?Vm11aXJwL2o3MUZIbzdjaXNOazZidWFPRWhDc1Jrci9nLy9JUnZ0OFh6SFJh?=
 =?utf-8?B?RWd2OVdkbW5JL3IvcGxCWXE5WVB6cHRLR2JrejRFUmt3REQ3RlZxVjBFOGMy?=
 =?utf-8?B?OVdEdGpvVE8xQ1R3VW5yOE9Nbkl6cnhZYmIvU3FFVzlIZXJyQU15MjhxQjVE?=
 =?utf-8?B?bkMwWlVhb1VqcGhTSkFnc3RwSFYxRHBNTzlvNG94akQyZWMxbU5LRGRKdCtk?=
 =?utf-8?B?ZkVLeWdlRTJBV1lHNFBXSWl4dVRnSHcwQm9qNmRiSWNwYUNaUEVYMVVGNDBm?=
 =?utf-8?B?a0xPWnNHMkdIV044QlYzRmpLdk1QZ2NQa21wQWFhVjZvNDVqMzJsdCtDM2NC?=
 =?utf-8?B?VTNET2xPMDVqaThBVURKNDJnMnZYdS96clY2VXVNQmpjSXNOaFljZU1KNkJZ?=
 =?utf-8?B?STczTkxWMlJGT1JuT0ZFZmlpYW1oeXVNR3l5K0swM1FQUk8zMGN1SGJ6dVRH?=
 =?utf-8?B?VXhZYXliTEsrVmQ0UXBZeDFWa2NtM2Q0RXpkMFgzT3NOOUowUXF5c1E1M2lW?=
 =?utf-8?Q?9AN0lb?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(35042699022)(36860700013)(82310400026)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 14:21:24.2164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aacf7e0-e7ee-48b7-03f8-08ddab4ebe2f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9725

Add bindings and descriptions for the SolidRun i.MX8M Plus based System
on Module and various reference boards based on said module:

- CuBox-M
- HummingBoard Mate
- HummingBoard Pro
- HummingBoard Pulse
- HummingBoard Ripple

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Josua Mayer (3):
      dt-bindings: arm: fsl: Add bindings for SolidRun i.MX8MP SoM and boards
      arm64: dts: add description for solidrun imx8mp som and cubox-m
      arm64: dts: add description for solidrun imx8mp hummingboard variants

 Documentation/devicetree/bindings/arm/fsl.yaml     |  11 +
 arch/arm64/boot/dts/freescale/Makefile             |   5 +
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   | 224 ++++++++
 .../dts/freescale/imx8mp-hummingboard-mate.dts     |  31 ++
 .../boot/dts/freescale/imx8mp-hummingboard-pro.dts |  76 +++
 .../freescale/imx8mp-hummingboard-pulse-codec.dtsi |  59 ++
 .../imx8mp-hummingboard-pulse-common.dtsi          | 390 ++++++++++++++
 .../freescale/imx8mp-hummingboard-pulse-hdmi.dtsi  |  44 ++
 .../freescale/imx8mp-hummingboard-pulse-m2con.dtsi |  60 +++
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  81 +++
 .../dts/freescale/imx8mp-hummingboard-pulse.dts    |  72 +++
 .../dts/freescale/imx8mp-hummingboard-ripple.dts   |  31 ++
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi   | 591 +++++++++++++++++++++
 13 files changed, 1675 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250614-imx8mp-sr-som-ceef5bef1bed

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

