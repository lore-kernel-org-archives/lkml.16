Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022109.outbound.protection.outlook.com [52.101.71.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20B2C08CB;
	Mon, 16 Jun 2025 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.109
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074458; cv=fail; b=hhi3H65yfyPl1tCPNWcDFOee2hZ2/TWD9Ctd+wbHn3ENWNgWj0hutv1e8GjxEaxJdCjppKTXlgZ450O/q9JeDZjfdygV6AEwguusRtJenjkOOt2NtB8A1OjVvKZ8hQKZcjxZioO4ZihAnQG96W3GQSeIDm3Wrkr1qaoMvOj1+zY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074458; c=relaxed/simple;
	bh=/Tu7aGLRUjB9La7aedJmZbwaQaOfQAxjKPAbo/DIGnI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SlI1/mzYrZrtU+6oz4zqE5Cc2hn2KOdQ4JGedZTPo9VKHlowEmEWMsL7Utl324oRJfTGXeyrppaBU4sHigsNoPW+E9znGc1jVzUlCRAQbFrZdXPYJtCkIcRackQvuXsvJJwWiwl5gwG1Vvjbqk1xEeTqxLUZ3vmrn2oIW/I2mNY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=db912VcJ; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=db912VcJ; arc=fail smtp.client-ip=52.101.71.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="db912VcJ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="db912VcJ"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=i8/WBStH3tzR/8TWbOlF5+j7USWHZqysAV2KkZJFCs2oZTAqVD/LvK6bTk9lIK+JF+41RB3admtj128tPEwKJBza6F88c2a1g+7IqGqd9Hs9oHfqEEGOo5/w2Oifrpme8f9IKL5t6ZOAVELVu66iHzvzhh6m9i2/JV/+PjEsVKKzFFBpxrFg/rKuMfp1dIb8ArqSeXNy0CCJstZYucdpK91xFxUxhjpurb+kinxw/vuOQmaf+3rXsFySPLlPbUePON74M78DqWocL0Dfb8kFRIlGCWWgZP2vYcRcTA9IKgM76wUum4eHXiHdJThgnoS5YQ9158o/AkPuPnOox9CbLg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Tu7aGLRUjB9La7aedJmZbwaQaOfQAxjKPAbo/DIGnI=;
 b=JG053qtrr7nfxImnHByN2aAbbGKMevoo3kGN7oJ1rHq5FT7Jj2F++qeSrkqTObXjjnzPfEiOUJKmadBFInpXws3ixBiwFRbBh5JkJzMKWXjHSRq2sQdLlxmepTxbsbyVwgg67CtU824mmDv49mRM65yu5yjgEyyacHc0pIb44BxSZdEIclHh3VIlnG5NlgXC/zqVE1db8SqDXlcXTjLiQ5gdhj7pb9dfsOPXyIMGCpXDCSTa9ZKaC+yazIzCNkNAdYY4929HLSb+8CqpNtuw55GlAVPdRt6QJhId1A6q55SHS6AF3cAACywjAezcu7oHCPgsR7yCrgoKTUv/mzGY8Q==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Tu7aGLRUjB9La7aedJmZbwaQaOfQAxjKPAbo/DIGnI=;
 b=db912VcJaCeDU6vINGA7EXEsv6BzZj/ZKA6wv/eODQS40GO35VIhFxr/kAhqG9hkUpKEg8W4wBfdT05XOnNeY5+WjL8vcJhn2hw9p+iUWAmDs6nesDX5ygJRx04uh+0pcAu9ldKvNsNJ9jVlZ8TPbAnDV7988mUDCcd67h7gf2M=
Received: from AM4PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:205::28) by
 PA2PR04MB10121.eurprd04.prod.outlook.com (2603:10a6:102:408::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 11:47:32 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:205:0:cafe::dd) by AM4PR05CA0015.outlook.office365.com
 (2603:10a6:205::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Mon,
 16 Jun 2025 11:47:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 11:47:32 +0000
Received: from emails-6532985-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-178.eu-west-1.compute.internal [10.20.6.178])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 53D6B7FF98;
	Mon, 16 Jun 2025 11:47:32 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1750074451; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=/Tu7aGLRUjB9La7aedJmZbwaQaOfQAxjKPAbo/DIGnI=;
 b=JKrnNT1Qrvcb1rY+Kjk7hZRihkoYHUPm13GjmjxrNTBjtP0G0ZN5WpUJA45unZOsYQKmY
 IaSP6Eh1TFESxeCEX+sro0VJSGQlMPA1ufpBm+gTBuZXYPMoPbh9cFYSlJWK6d6UBe3UHpk
 c0pm62FxSGwXDJMGpdXNndHj/9Tzg7A=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1750074451;
 b=mih08bE485u2MdN+pL3E/PbsBwodrM7k2t3NPJ9UMOUfvu61lHv8OhwAdADHemFmaAn0K
 vlsvz/oRl/OSo6n6PClhLHlIZ4UEW+pT3XcdmAK7i3dA72TRBHybjSSRq4piIUGHfNMmyEL
 AD8ee2za/lFcmXweulB3UF11pM5Gmxw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDwd6x/mnzdD2vmkkryDVv7v6QSxw7Pz6O070d2dANmgw4KGrUOaBvjQAyW6V/7g/xmgFV27XcZLlMQDFkJwMMC7H1iBcp9WPbnWuB6Brq7JSbL2gHhPGOW84yHd4vqr3yc40LjVI/Hks8X4NoesumBWhl622MRUKCueHi2gtMOtWj3J/RywqjDo9xN/uh6KKrZASJJ1VmHirUkx8nKpkzyoPGxmPNBQmkB2HBYGA4yJaoJFotp0uBWggITAr/9k+Fj8wB5Hb+dagSFQ/Ut97TcfgopHZpYIguMpjcFBZZWAQr28HPLmVxneYUq2dfJqAJLASSrkyNlqCPfrVKQ4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Tu7aGLRUjB9La7aedJmZbwaQaOfQAxjKPAbo/DIGnI=;
 b=Plb2kgClGrc58UWBzHwE37UOX3S+yyBEtlLply0BXkgYeKi3vrJxJYrU0KeYcS8F3NBIN4w3XpP9flsBmj7E7Zjf6iYvgmhzSTJbunLtLPtxabsUOuL0WV9DHKekg3+6Zktcf+/JoYzJiRVrFKFUCfTYHyntCcpuo5kuWLAVURbIkdX71HPb+XTsMfk+ZWxlwhrakIGWNbsPy9D84BH0PTHa4ieSeDwadoJbCH5RQdj3Rs/9Kp0JI7EvEKXUxUESjOIm0p2y8u+F3oxQQ289mLcCbY4pWqI9rOKmsU/u1+Rx0cQG3/zI4KL5InFmz8vrTt7Fgas/LuId46V3Uqtn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Tu7aGLRUjB9La7aedJmZbwaQaOfQAxjKPAbo/DIGnI=;
 b=db912VcJaCeDU6vINGA7EXEsv6BzZj/ZKA6wv/eODQS40GO35VIhFxr/kAhqG9hkUpKEg8W4wBfdT05XOnNeY5+WjL8vcJhn2hw9p+iUWAmDs6nesDX5ygJRx04uh+0pcAu9ldKvNsNJ9jVlZ8TPbAnDV7988mUDCcd67h7gf2M=
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 11:47:14 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 11:47:14 +0000
From: Josua Mayer <josua@solid-run.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: Yazan Shhady <yazan.shhady@solid-run.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/3] arm64: dts: add description for solidrun imx8mp
 hummingboard variants
Thread-Topic: [PATCH 3/3] arm64: dts: add description for solidrun imx8mp
 hummingboard variants
Thread-Index: AQHb3TeV0rMhp4aet0ezoSexg4NJU7QFUzYAgABbJ4A=
Date: Mon, 16 Jun 2025 11:47:13 +0000
Message-ID: <f0ef8578-7a48-4dbf-a1b4-25284c3964e7@solid-run.com>
References: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
 <20250614-imx8mp-sr-som-v1-3-3ca3269883c4@solid-run.com>
 <92c723c3-81ab-422c-ae5f-7c2d64c117f9@kernel.org>
In-Reply-To: <92c723c3-81ab-422c-ae5f-7c2d64c117f9@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	AM9PR04MB7586:EE_|DB8PR04MB7131:EE_|AMS0EPF00000195:EE_|PA2PR04MB10121:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d21d29-8cb6-4304-f096-08ddaccb9489
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dTdvR3QxMXpwMEJ5aVpxSmNTS2g1VkVOZ1JyeTN3TUozcXgrYmd3NEkvSGpB?=
 =?utf-8?B?ODNKYmhTdFhQVzRqOS95OEVwbFRhWEpRV20vTjVOdVlKVkRhRGFlQ3BDbFE0?=
 =?utf-8?B?dGk1S24wNjNrd1VVUFFteE9BVlVMYTJ4OTBpak42OVhsdndISlRJRSs3RjUx?=
 =?utf-8?B?NHZlQ09Md0ZjSXBGaUQ3Ry9XZGFISW5na3BlbG9semNRc2hNdldndlN4TDN5?=
 =?utf-8?B?cGszUGZJeVBNMHgydlN3THpoc3k3c05YdUp6U2RSWmovenk0OGZMRWp0bzRD?=
 =?utf-8?B?dVY0RDNXa0o1U0lEQUhaY29NdEhUNEVNdldkeGFHd3RqeUJFYXRLOUFTQU1F?=
 =?utf-8?B?d1BOY0FicjUwY3lhbnNhaDh3NWUvZ05uYUlyWEozbzhIN1RWOVhneXJqT2JS?=
 =?utf-8?B?VFBKeld3V1N3ZjJBNFpNUGY0SkdaVG5QS1kveUNtRDZRVnRzcTRmblN6djFj?=
 =?utf-8?B?aWxaQU5xNm1YRStrZ0Jaem1RQ3V4NDlSeTd2dFFYNXRkMjdCOXNmSXFwbld4?=
 =?utf-8?B?M2c5eFRpSG5UeVFKUERveTJLNldYMjhDaE5QWWxIeUVmeFRMOU5JWGdkV01L?=
 =?utf-8?B?TDBUNTBIWnE2Y0QzY1RCREVsMHY5ckRtWFJjVFJPdnBjVFN2ck9iZWlERjM0?=
 =?utf-8?B?cHgyRDJtNFBEdk9tZ0VldVRPTzU3Y0tQV3hGT0dzeFBFUkhjc1NzaE52L3Zi?=
 =?utf-8?B?NFFsdFdLc040aUY0RWlpRkE4L0R1bjErSm5wdnh3ZGZ0NFFlWkdnbDJqREI4?=
 =?utf-8?B?U0lMVURrL2tRVmxha00vV1hRbG43eWZ3VnJubmFCVWhKdnJkaEJSZCtVOXZ0?=
 =?utf-8?B?L2JlcEY0ekhEQjhFTFUyaU8wMmNuSzFkYk5WZlM3TmNEV0Y5VkFTSWZNTzFz?=
 =?utf-8?B?bDlaUVppNHhLckpyQVpwbmJRSG1wNnBMeGpLOXJKZTEyb1ZkUytDc2FBbWV1?=
 =?utf-8?B?bHVpOE00VUFDdkR2dXdlODlMUUg5QkU4RVhEYmN4SGhmTnJ3SFNmdTZGS2VT?=
 =?utf-8?B?RzBqYkR1S3djWGxuTXN3S0xJaGx0Y0VaNHhtL25EMmJYckNDZ1pMZkRuUHEr?=
 =?utf-8?B?c2lGY3hnUXpRdmF0VkFST2Rzd285aStTdDh1Sk1xMVp0QVRsckYzQWZNcWc1?=
 =?utf-8?B?eGlLSXJEa1RDRy94cnF2ZGpXUjMwa1ZDVjRiN2EyRHIyM1NDNXo4U1lVR3dZ?=
 =?utf-8?B?R0UweEdpWkg0NHNON2hkZ05oc3RyYU41dDlGb1YyQjIxbUhXbW9iOWNiY0E1?=
 =?utf-8?B?Ym14SkhQbE5vRm83OEh6MmtNSnQxZTdxMC9CNVh6OFpmREtoREx1QnozdkRP?=
 =?utf-8?B?bUFqNzZ5WXVqcjRHb2d1Z05ocy9PL0ovREE0d0Z0aENxOGVzRytZV081cW5q?=
 =?utf-8?B?a2NaV0N0cEdnS2FFM1c2V0xNT3BiZCsrcWNoRWp5MFZ4ZDRrazdHSTVNdXp6?=
 =?utf-8?B?QmZCWXZWaVg5eEVYbWN1MFM2QzNHUnJUbldZak9TTU0xdnNyemE3S2UzNC9n?=
 =?utf-8?B?a2NscU5YZE1qOUltWDdYWDVvT2dQdnZuWHl5TjlKUmRzN1NKTXJERFBucnlV?=
 =?utf-8?B?cHlQTGFwRldZR3lpOUVCRFllR0N5a254RmdxMmE4VzhJTlkzTGdzaHQvSVZ0?=
 =?utf-8?B?WmZ5bFgxeXJKVUxFUlFkU3A3aGxYam1tLzlOK0ZCNTFGZ1RTYWJPQmVyQmF3?=
 =?utf-8?B?dlg1b2FDYjBjUkVzZW11TWJpYTFhQjkzajVRVng4ODErT3duS08wYmtlYm9I?=
 =?utf-8?B?TDM5ekN4Rm1YbHFZRVNucVpmOWZzMXZ6UStVNDN3Vm1Va2hNaDZNc29zNlU4?=
 =?utf-8?B?bThERmJqTTZac2hoOFZtNTZBU0h0RHMxWjc5YUh1c0JKZnA3MmtyUDRJbmZm?=
 =?utf-8?B?U2VrZC9mQzB4UmRhZGNEWFlZNkYzeDVlR2JHOGtmUFZ4aUxOdTRXVGliejRS?=
 =?utf-8?B?WkhQd2NPa2UyaHJMQllxNHFZSjBvTmthRVVxdnlZcmhLYkZsTU9sWVFLTmdp?=
 =?utf-8?B?dndPQWJVMlpnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B20924C52097B9439CF1A86EB9F200A4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7584bc21bf2f45178aee4b09bc21800c:solidrun,office365_emails,sent,inline:673a86b2cf8b742899a2abc50e1fdee7
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6f95c46-f0c3-42d2-9c4c-08ddaccb8965
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|35042699022|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWdHb2YyTCtZV2VDMlFyUjVhUUZpY0s0Tk1PMkNScTZVeEp0MUYyZlkyT09H?=
 =?utf-8?B?RSs4dGtBTTVlcDZoZ201U0RNczZ3UERKRXBSL3BxNkFMcTQwYVBVZDF5YWJ5?=
 =?utf-8?B?emtIMHJ0djVJQ3JLeU02UmQzOTAwUUl0VkNTaTd1dkZEc1FRMzBIM3orTHBo?=
 =?utf-8?B?L1NzSFJMdmRCSnk3MHl6a01rRDFsa2dUNFlpQk11K3Y1aHFWSHZhWDdMKzl0?=
 =?utf-8?B?Zm94bW5LWmQvR2NRRkFPdHY0OEF1ZS9DR1I5OUp1RGxmeG9FK2p4WnFrZFlj?=
 =?utf-8?B?ZElBUlFPQUhKbnNuVjNBS3h6a25VR1Azb2U4OWN0MHFyQkcyQlA4djFMbG9n?=
 =?utf-8?B?WHN5YTRCbVNUMkR1MlZmKzVZS1lkVHcxQjIxVVVjUEMzZ3FaYVY5bTZJREZJ?=
 =?utf-8?B?QjBUek1iVkFTL2NQRmdla3ZCRlJwTlRoRzlhV0RoT2hCclI3K2RxTFE2TUJL?=
 =?utf-8?B?bFU5WFp4QWNBUGRGZklndVlFWm9MbjhPbFZHMWJzUDBsMEcwbndOL3RhVUdv?=
 =?utf-8?B?R0wvT1VpUTdEaGFZRlhpTEZCc0RyR1p0a1lya1V3OW5icjFYalVORHRlVnZu?=
 =?utf-8?B?MThJVWdNYy9PVzRuUXRJT3g4Q01JZ1dWZFBxOElpMC9YUTlSZmViTEpkRGda?=
 =?utf-8?B?aHBVY08wck80L3Fjanc4dE13MFJ6RnRrNVRrNk5ESTNJb1JpaUpzejBVUWV1?=
 =?utf-8?B?Z1drajFtbTMvOXlFN0hFWmJrV0xlT0RWbzYwS3FXWm16SFU3bS9CQzA0bjJt?=
 =?utf-8?B?Q2lqU3lIb2VDU25jMUZpOG12VjdyaWM0NzdQR2FaT2NERGtNTEFBQVozSk4z?=
 =?utf-8?B?T3JzdWVJNnV4dU5jVTB1WUtoUjJTUGtxMzJkTmFpOUJFWkVVaWo3UzVLSFVY?=
 =?utf-8?B?QWNzZXR2S0hqdUxZK2paK1hpSmc0NGIrMG1Jb2VEYTgxc0Y2WFFPbkdpOU1E?=
 =?utf-8?B?Y1hpdm9BYTN1cmEvRmZLcjhhZHY2VHZxSnl3NzNFa0JuYmZuQUJtSjNYYnhp?=
 =?utf-8?B?UEhmRXkrYytzVWRuQ1oxRHdUcU1icG9hTiszZUpnUGJ1QVdQcDgrd0ZqSDhr?=
 =?utf-8?B?dnlXNlc2K2NXVUxXYkM3Ny9CcVBaQjh6VTZWUkVRcm0xaENRVXIxQmpPYStw?=
 =?utf-8?B?N2p0QjFNUEhGc2R4eks0NkRUL3JMR2g2dUE0R3haTS9QdVZjbjRNcFBjNjQ5?=
 =?utf-8?B?RVBObU5abllHTkk0VHFXOHR4N3RyanNpQzZMVy82UlBuMDc3d21FTmFOYXlQ?=
 =?utf-8?B?cmVpZmZYWFNycXpZVEgxc3hnM1AzbnlFQjhYeWRXTU1MTnlxVFBEY1ErUnZI?=
 =?utf-8?B?dU13LzRoWklwWnJOWDlnc1JVRndQb0w4eTJMWGM3bWl2UzBUbU15SDJZSTBY?=
 =?utf-8?B?TFN0T0pSTDF3dFNWWXh6RE9VNEpabnlweml5cUZtZXUxbDRyN3hzTFJBNEcy?=
 =?utf-8?B?aXI3cWhCMlZCbXFUaGJ2eE11cXpDYVQ4VHd6N2JkbzkrQ3lReERLaWZLcTZW?=
 =?utf-8?B?SjNKU3hrWDVxUTdHMzhWZ3psSmxvdEhQKzZ1bXRLeDNUNjNOd2JFODgybnI0?=
 =?utf-8?B?QUFkVFd0QjZnT1ZPSXl3VWRFU1lIMVdBYXEwWGRnVG0wSDE1d2JVVXZKTysr?=
 =?utf-8?B?QTNBR2U2N2IwTFc0czNVVTlHdUdZTW54ZU1DL0NLbzBadTVCY2ZWWVhXbEJR?=
 =?utf-8?B?MGdLczYxN0VYRUd0Y2craXdiYjEwYlc1NURkSTVYbnlqWThTajNmU244T29q?=
 =?utf-8?B?eUZzT0pGc2lvYmlTb0g2Vi9JSjBrUnk2cWhVa0laV3hNVjMyVm1xRzFFYm54?=
 =?utf-8?B?OXZvY090RDh6SXRGUFA1L1M3dVFVK2s2N3dxWm1weGRYeFh1WHFJbnFlV0ZD?=
 =?utf-8?B?QmVYS25pdTgyNFRIa0VGNDV0bjZlWVBZSnNwSHlCcEdsRmkrdmh1ZVBHZFFr?=
 =?utf-8?B?NStvbFF6WE9TclUxZXU3RDlma3cyMkdnQmFNZHBheTBxOStyRFQ0NkpUYWhi?=
 =?utf-8?B?NHRLZCthZjh3enVwd3lIbytQR01xT0NVZ3JWNzB1Z3pTZkJLd0hzQWZCUVZn?=
 =?utf-8?Q?Znkl+A?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(35042699022)(82310400026)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:47:32.5982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d21d29-8cb6-4304-f096-08ddaccb9489
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10121

QW0gMTYuMDYuMjUgdW0gMDk6MjAgc2NocmllYiBLcnp5c3p0b2YgS296bG93c2tpOg0KPiBPbiAx
NC8wNi8yMDI1IDE2OjIwLCBKb3N1YSBNYXllciB3cm90ZToNCj4+ICsNCj4+ICsvKiBtaWtyb2J1
cyBzcGkgKi8NCj4+ICsmZWNzcGkyIHsNCj4+ICsJbnVtLWNzID0gPDE+Ow0KPj4gKwlwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KPj4gKwlwaW5jdHJsLTAgPSA8Jm1pa3JvX3NwaV9waW5zPjsN
Cj4+ICsJc3RhdHVzID0gIm9rYXkiOw0KPj4gKw0KPj4gKwlzcGlAMCB7DQo+PiArCQlyZWcgPSA8
MD47DQo+PiArCQljb21wYXRpYmxlID0gInJvaG0sZGgyMjI4ZnYiOw0KPiBOQUssIHN1Y2ggZGV2
aWNlIERPRVMgTk9UIEVYSVNULiBJdCBpcyBpbXBvc3NpYmxlIHRvIG9idGFpbiBkaDIyMjhmdiwg
c28NCj4geW91ciBlbmdpbmVlcnMgd2VyZSBhYmxlIHRvIGZpbmQgaXQgZnJvbSBSb2htPw0KQ29y
cmVjdC4NClRoaXMgZGVzY3JpcHRpb24gd2FzIHVzZWQgZm9yIGhhcmR3YXJlIHZhbGlkYXRpb24g
d2l0aG91dCBhIHJlYWwgZGgyMjI4ZnYuDQo+DQo+IERyb3AgZW50aXJlIG5vZGUuDQpXaWxsIGRv
IGZvciB2MiwgdGhhbmtzLg0KPg0KPg0KPj4gKwkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAw
PjsNCj4+ICsJfTsNCj4+ICt9Ow0KPj4gKw0KDQpEaWQgdGhlIHNlcGFyYXRpb24gb2YgYm9hcmQg
ZmVhdHVyZXMgaW50byB2YXJpb3VzIGR0c2kgbG9vayBhY2NlcHRhYmxlPw0KDQo=
