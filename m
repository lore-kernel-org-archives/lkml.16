Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2099.outbound.protection.outlook.com [40.107.241.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91013D539
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747201337; cv=fail; b=oF8MpVDPfewTMWW7Lffxqm9TsrBCHc7RvuuZCVuo+7DFV3AdloAwAKc53Ss6nN6Fhte+xLoy3TmSlKhuesFOfi1Li7Q554S+QoeiIh4hXSEVLJk2mmQawUep51+m8N1XKj3gcvlT/krXRnu8JMyrnox+SZaYLRz4dgeRN6zp74M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747201337; c=relaxed/simple;
	bh=O65VM6f0IQs1i/o2lRWX8RoNfF/0MFl55bjhwDdBb3M=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ppfAqON2hjO5EX+ijRmHZV4Sf9ob5RZc9vAaStTBp/ElCQhTGe496W5tZMShrCYC9x4xp05YKfUNnGipdDTfrNS6FTKMuMPzoJSwHtUs+lP9tkAzjAR91Lc/5K8Eo3sdsDYVyO8OAuJGXaMUENE77MZYMtYFpZPFzJOebjm1Tes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=lmQBa074; arc=fail smtp.client-ip=40.107.241.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="lmQBa074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b57LHRpjkOKIEbTkXRPDrjH/Q/UhLfIwdVnWhuZVmQXiqlB+jHjJQRUSI+ZILtd2Z36OvroJSE5UTEX7I7opL29moFNNY1+7XYY+sMaW7xHFkEJ9BrBMz6m/iBQgcc8YvrvXfYwrXsxVOxIhuvRrry5W6W3DW4KpReOdAztQS7DSFxltdfbhrb2d5kgBTb06wWPLhCqjFBorL7gyqtcE1VYExdXfqt9ItVkIFfsq/wrN1QHPxFg6/qPX9EYBSAE/oj1bL2hhP9QrNMZaiRlvbOxUohfwuoGEDNHsFZPObS391wMYd1SxKC8PbZTrg+MTJNfnm4SoTUybz2r5Jg86uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O65VM6f0IQs1i/o2lRWX8RoNfF/0MFl55bjhwDdBb3M=;
 b=TGqmj6J2IN7UHpfjYYR3jfM642A+aZhN7uVztHWD+lSRTTR936VIq07XHqF+ErwSVrm7OVl70xtCtJfB7Si45l9+p7dfPke6yCcaMCxghRzzVRXV/WvyORdrAMCAjEy15R3gwi0IjLOGcweWvGF8T9GjgRZO1xdWDBLAFrsLlr41Y66d/j4mgiBoPXliuiKElVVMP+5Q5cZdD0RPnYEVbizOY6CNTAls7Wt6krQxadYW3aO6NFPrVQY8ppPbWg/PAJQXr+C4WVK5qhsFgDqjL0gDH3rrM7aoIfkQioJbB/tDCp5mufwXJVViYjocA91czm9m0PQqy1p+gwSBw1Q0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=amd.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O65VM6f0IQs1i/o2lRWX8RoNfF/0MFl55bjhwDdBb3M=;
 b=lmQBa074ynCjqcu5xN5JIjXwv08TY1F6TNMDXgQ5V4/0UQZIfJ2SL20IZTicOqpsbuV1Z7x/TfDc3Qc8D0yOchWUFhAU3TKJKJoOexR6W9oMYJIqNoGP6/NWeSqGyhmBULdLZkgwUDdRTcIknatFkrm850uABsS9yYFks3V50bsawxqWDRqZI2KrRP2afTmP6CM3Ai6WGS/iZl1qvgH9dfDsiP6+swbrjN1ZGoGg4a4F4Bxlxi4cFBPgeKdmqDocrYw0w1pXJ5S/Czic1Y1IjnO/xHJuz/Nxph0yobV4Q3Lc+PXsvnhTrWADNBTY2ZvJzDtROtC/RiIo7hJlGooPgA==
Received: from DB7PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:10:52::40)
 by AS8PR04MB9112.eurprd04.prod.outlook.com (2603:10a6:20b:44b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 05:42:09 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::21) by DB7PR02CA0027.outlook.office365.com
 (2603:10a6:10:52::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 14 May 2025 05:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 05:42:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.109) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 14 May 2025 05:42:07 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by VI1PR04MB7103.eurprd04.prod.outlook.com (2603:10a6:800:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 05:42:05 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 05:42:04 +0000
Message-ID: <c399c68b-ee60-4d54-b901-a40e744f287c@topic.nl>
Date: Wed, 14 May 2025 07:42:04 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v2] phy-zynqmp: Postpone getting clock rate until actually
 needed
To: Michal Simek <michal.simek@amd.com>, linux-phy@lists.infradead.org,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 "Katakam, Harini" <harini.katakam@amd.com>
CC: Kishon Vijay Abraham I <kishon@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.298e943d-5a80-491d-b36f-77b3b9a86df9@emailsignatures365.codetwo.com>
 <20250428063648.22034-1-mike.looijmans@topic.nl>
 <c71408b5-2ead-4408-83b3-dad30f153d2d@amd.com>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <c71408b5-2ead-4408-83b3-dad30f153d2d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR01CA0171.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::40) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|VI1PR04MB7103:EE_|DB3PEPF0000885B:EE_|AS8PR04MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe200e6-0ed7-4eec-b8b5-08dd92aa1136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eVY4WW5pM2piNTRyWTFqaHgvK05CYmZ2bmNJelRna0MwaE04dnFPU2V4cDlI?=
 =?utf-8?B?bmVrdGJadUlvUnBXckl2MmtySTJmbWQ2cXU1MDYwckRKaVk5U0dhdTBzelgz?=
 =?utf-8?B?WXN5SncvV0xEWXRKSy9KYWROZCtqbWl3UTFmaHhuRzVNVUZIQms5Y2J1V0p0?=
 =?utf-8?B?VnVzVis3NFpSdnJnQ2UzT3NNaXNHbU1aSURRenZOUmtJeXJwMGE0c0doQ0xF?=
 =?utf-8?B?MlJTZUl2cE90ZVpUdk1XdTR1WnM0TXQyK2h0UXBiU0xmTmp6MDgrbXBpMXBQ?=
 =?utf-8?B?VmNCK0pNU21odGJJVWZOUEE3WEdhK0dDNlpTVHhGNktQOVBZZlZtRDFyRko1?=
 =?utf-8?B?NlZvcTl6bWlQd0ZxSnBwNklRczZkRGtwbTFMbXF1eUpqNmJKc1RDYTVXNGc0?=
 =?utf-8?B?Ump4M0RGc1JjVGRrQ09ia1BNdEZsYVd0NjdYajkrN0w4dGRyT3ZkUEhuaXR4?=
 =?utf-8?B?cWhFVEVZaWhFak53eEpjZlBHUytpQkpwVWFPakVTSE5uYTBnMVE2UjJsNnpS?=
 =?utf-8?B?RXdiUjdDTS9TN1cwdHM4SEhuOTVxRE5mNHFFRlhXTlp6TkViM2pJY0FLZVNT?=
 =?utf-8?B?NGNBV1lVYitzeHJzYzdQTTFmaGVxd29XQ2FBQi8rcE5xemlYQm9Ibm1nR25r?=
 =?utf-8?B?bUQrYlBGbC9IUkdnc1BmNGdkZzV6ang3eXUreTNNckF5L1dQdFZkcXRyQ0tQ?=
 =?utf-8?B?MmxDRnhWVElNaVlobnBoc0I3ZDN5NXMrbS8wY01VOTZhWDdPWXRXQm9JVDBZ?=
 =?utf-8?B?M3pVK2gySzVjM25sTGRac0poZm12UW5YWWNMc05WZ3dhSFpaNHFNSDYwQVph?=
 =?utf-8?B?M0R3RUVsMDE0cVJETDBYeVNKSjZpZDlZWit5aHg2cU90YjZQd0NKSUs0Sm56?=
 =?utf-8?B?Nmh5M0JtcnJYV3hDdXdRM1dEc3pRY0hZeHRLdlNIVWRsM1E4VDlhWDZvbGcw?=
 =?utf-8?B?VFZFMmZLMytBUWNRNjBZZXlyY05OVXNNRkdBRnU4N0JRcE9TVFRjT051Ylk5?=
 =?utf-8?B?M08yMHBVNDhnVnpnZVlhZForcW5HVHA3WUwrS3JOK1lCMWE1N0dLMHphakt5?=
 =?utf-8?B?eEFUNXZqNGVQU0lrenhzL25LV2RLVklwL2hCVnZSbXJoQm1MOXlTYlNQdUIy?=
 =?utf-8?B?Ymk2WndlT0dpalJkSk1aNERtYVYwd2EyNzFZeHlyZTRWZjBwQURNNUNJd1p5?=
 =?utf-8?B?azRlSUd0TEJHeDdRT2wxYmpXdDVRdGhPLytmaXJCTGRiQXByYk43aGpFN2Z3?=
 =?utf-8?B?emErYUhGMmlEMUNpT3pneUw4ZnZFczZTYjI0d2JxWjRQWHhZelMrWDJnaHN5?=
 =?utf-8?B?b1BrUmhDeVAvU0FNcE5Jb1B5Vldvcm9BT004czhqVnJIN0UvWVowRmVlQkJJ?=
 =?utf-8?B?MFRjdlN2VFVyK2I4SFpIcDhZMlQ5VXg4aXgxdjd2bjdGcFZnN2pITmFwVC9z?=
 =?utf-8?B?TEZsRk5QK1F0R216MSsrV1IzQzlYNGpDWkpwb25zdit3a0dUdTBFeFhHcEUx?=
 =?utf-8?B?Y2Y0QStsdWw2M1VjbkNvRlVSZW1aR1h4Z3E1NGsvMi9kMGxCQzZwWW1uVUZC?=
 =?utf-8?B?QllkclFpRGRoNHYxSFI2TmhXWHl4TnRBcHN6ME5YRGNKTUhYWk1IZDE0aGF3?=
 =?utf-8?B?MUVIK0RmMk53bWdqWmludlJPTXlUZ3VlS1JCNjhKSGNSQUNnVU1WRXhlb3RE?=
 =?utf-8?B?Qzh0SWVxRG45OWhUdEd6dHFDeGxHaXgzdkkzQzhqcmhKbmcvcXUvOVFUU0U4?=
 =?utf-8?B?YjNlanhPSThaVDRSY1crYUJBZmp1aXVQbVpLNWthRnByeTcwYk5sVStVa1FK?=
 =?utf-8?B?QXdkMnFZa3IyK01mTENaZGZ6TmllUnB5SS9ERFAxM2VTZG9Obms4cGFIdVhW?=
 =?utf-8?B?bkFKZDl2anZxdU1xQ2p2SDN0elFLZ1dQaExrVjhPaXMxcUVLSU1LaEk0RjV4?=
 =?utf-8?Q?FzYIRa1r/hU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7103
X-CodeTwo-MessageID: be8c07b2-7d09-4270-b1c9-4981b8bf0a58.20250514054207@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	74ef8924-7ce3-4504-ca62-08dd92aa0eba
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|14060799003|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHpVWUc4dGJmZEN2K3RKbTlYWlhLSTNHZHRZcDZvL0taTlJnTHd6MUlYZ1cy?=
 =?utf-8?B?ZXg1bVN3VDhGOXlsNVdiUmJFMnM5YWZnRjVHRGowU3p0ckpKdkhDRnlBMDFl?=
 =?utf-8?B?MWVZTlpyd0JlbXoySFFKQXdlVzBzOFVzVVdjRUZ4d2JGc3BjdTNwRGc4NmdM?=
 =?utf-8?B?cUx4K0JxNUZCQUh6Q1F6WEZkQmdheG9yak1uQkdFcTErbzhsTk1OUDVXTVg0?=
 =?utf-8?B?R3JyKytybWlmMlBXM2ZoQ3YwVFBUc1VvSFEzNGpZZzhBZTR4eWVmS1JPSjFx?=
 =?utf-8?B?VThRaE9XTzJVakhPMXJWQTBSY1RPQVc0dTZHZEFjajNjam5Ud3ZJeTkxUHo5?=
 =?utf-8?B?elo4cG0zb2F0U3ZCS3YrR2hUTDFvdzV3aXRpT0kzZWNSMlQ0UjViRVRHZUNW?=
 =?utf-8?B?a1J3TTBMTnp6L0FCaTJzdWJSZm9semlONDZYalZkdU8wZ3VEM0krL1MzUkxl?=
 =?utf-8?B?UitCdmRCVzdUZ05vUGZDYVc1UzlzMy9JNGRocGh4Yk51TC9ZeHpBV3JET1FI?=
 =?utf-8?B?WU4zRVFJY0tSOUFTbUY1TjNFbXcwcnhyV2hrOERxU1Uvd2YrZ29tdnFqR2Qx?=
 =?utf-8?B?ODVsVFhJSURzejlka01YVUNyUWE0cVhIVm1kK2RwdFFkblVOREpxWWtYV01u?=
 =?utf-8?B?TGFQTDJFb2tqRWxvb1dla05qYU1ZWDFGZm9HL2hVZGtmUjI3QW1Ja2NZMWxC?=
 =?utf-8?B?bzAyNUZsQnBLTys4OWllUzB3Z1Q4QVZYSitkWEpIWnBTR1Y3alQ4czdSQlo2?=
 =?utf-8?B?cGZkQjJaVFFmcDNOUXQ0a3dxZXk3a1poakE4bThjT0xhZG1rWVNsb0FXUkdw?=
 =?utf-8?B?V0dWZ2R0aEdSeVhFcGFqbE5MSWgvcEVWM2crbzhSTERIWitDZ3JhWGViMlRw?=
 =?utf-8?B?TFpiclBjcjN4TXQyU2FJWXc0RE5xYU5Bc1FXbjBRWXRMOTVGZFhFTEFxTDN5?=
 =?utf-8?B?YmZOcW1CWWhMV2JnNkR6Skh4Z1ZSVjZFTTA1ZTFFZXJUSEFrT2pWQU16a2cx?=
 =?utf-8?B?NUIvVmhRUkNpOEx4aTZJMWVxSWJ6R0tXQVhQcWJWeUQwMVZJUFVUYVR0UzdV?=
 =?utf-8?B?K05TSE1KWHJQY0xEN0VtQ0I4WlBZTVdMeVIwSGVuNWJXbVBHNUhDaGN3Zk9y?=
 =?utf-8?B?YzdpTmdtdnRESWNwNnlQYlMzbmt0Mlk1NnlyOUxPTVR6OURTQm02UUVZeFZT?=
 =?utf-8?B?TWdHUzJZb01QOWtBdUtKUHFIRjE0NnM0MUhISHp4TkpEanJjTEkzRWVlbDYy?=
 =?utf-8?B?K3FVTXAzN1ZDYUoxSHVkVnhJdi9xcjJPcUNkeSsyUFhmTW1ZaXB6cWhHd3JJ?=
 =?utf-8?B?S0RncC9hOFhpYUI4VGZQQlpORVU0cFhCbVlLcVFKc2xqUDk2djBFL1djYzJv?=
 =?utf-8?B?ZW5ZdlJnRFhnbDhIY3V5cDl3cFdBUHBCeWlvMG1wYTNwMCtxVCtTRTQ3amhJ?=
 =?utf-8?B?dXpha1FPZEpjajE1TGZjd0VDUE9JWkR3eHNxSkViblJmVU5GYWVLdktJK2lG?=
 =?utf-8?B?U2NmREZGb2RCZWk2MVJDdTNsUzc2Uyt1eE1wckd2TzlqTFh2dFp3bWdFbXNZ?=
 =?utf-8?B?VkhTNDBFQ2xFZkxEOTR6eWpPcXRFdmVFT3JvdkpBbitXVnd4Y1dvOHRTYWdG?=
 =?utf-8?B?TzhMTWh3RlB3cWZUam51ZVl0blhaZGM4VitDQW1TTkZMbmI2TWV4RnpLN2V6?=
 =?utf-8?B?SDhyek1ycmtKZGlTTTRjdStOc0p6NnhSRjV2aHU3UG5kZ2hQQjdxakg4MnJZ?=
 =?utf-8?B?bzhObWpxT1dEUXdxRDFuWE8yR1NZZzc1UjVYR2MwdkJhNWdIODUyVkIzRHZH?=
 =?utf-8?B?VkY2dzFDc1JxQk51VmhJNFoxYktNMGRKSUp2YmxOZXpXQ2Qxajh0R1laSy9M?=
 =?utf-8?B?N0RLREVoRHBpSDJCYVFBOFlJNkZHNTh0cU1hN1VmZUJXbGtFeTkvUWlsU0VJ?=
 =?utf-8?B?U1Z5eU1sYVllNmhsZVhMQjVRUjIxTU92MjN4UGswa25zK05zeURTdE5xYUgr?=
 =?utf-8?B?bm4vQWZSOVM0R1N2NEtaeEt2RjlsK04wTzhTdktEbUpxYThBZXNxbWRCNTBa?=
 =?utf-8?Q?gtyDmq?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 05:42:08.5765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe200e6-0ed7-4eec-b8b5-08dd92aa1136
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9112

On 29-04-2025 10:36, Michal Simek wrote:
> + Radhey, Harini
>
> On 4/28/25 08:35, Mike Looijmans wrote:
>> At probe time the driver would display the following error and abort:
>> =C2=A0=C2=A0 xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clo=
ck 0
>>
>> At probe time, the associated GTR driver (e.g. SATA or PCIe) hasn't
>> initialized the clock yet, so clk_get_rate() likely returns 0 if the clo=
ck
>> is programmable. So this driver only works if the clock is fixed.
>>
>> The PHY driver doesn't need to know the clock frequency at probe yet, so
>> wait until the associated driver initializes the lane before requesting =
the
>> clock rate setting.
>>
>> In addition to allowing the driver to be used with programmable clocks,
>> this also reduces the driver's runtime memory footprint by removing an
>> array of pointers from struct xpsgtr_phy.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>> Changes in v2:
>> Explain the issue and the fix better in the commit text
>> Propagate errors (as reported by Laurent Pinchart)
>>
>> =C2=A0 drivers/phy/xilinx/phy-zynqmp.c | 70 +++++++++++++++++-----------=
-----
>> =C2=A0 1 file changed, 37 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zy=
nqmp.c
>> index 05a4a59f7c40..fe6b4925d166 100644
>> --- a/drivers/phy/xilinx/phy-zynqmp.c
>> +++ b/drivers/phy/xilinx/phy-zynqmp.c
>> @@ -222,7 +222,6 @@ struct xpsgtr_phy {
>> =C2=A0=C2=A0 * @siou: siou base address
>> =C2=A0=C2=A0 * @gtr_mutex: mutex for locking
>> =C2=A0=C2=A0 * @phys: PHY lanes
>> - * @refclk_sscs: spread spectrum settings for the reference clocks
>> =C2=A0=C2=A0 * @clk: reference clocks
>> =C2=A0=C2=A0 * @tx_term_fix: fix for GT issue
>> =C2=A0=C2=A0 * @saved_icm_cfg0: stored value of ICM CFG0 register
>> @@ -235,7 +234,6 @@ struct xpsgtr_dev {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void __iomem *siou;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex gtr_mutex; /* mutex for lock=
ing */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xpsgtr_phy phys[NUM_LANES];
>> -=C2=A0=C2=A0=C2=A0 const struct xpsgtr_ssc *refclk_sscs[NUM_LANES];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk *clk[NUM_LANES];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool tx_term_fix;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int saved_icm_cfg0;
>> @@ -398,13 +396,40 @@ static int xpsgtr_wait_pll_lock(struct phy *phy)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 }
>> =C2=A0 +/* Get the spread spectrum (SSC) settings for the reference cloc=
k rate */
>> +static const struct xpsgtr_ssc *xpsgtr_find_sscs(struct xpsgtr_phy *gtr=
_phy)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned long rate;
>> +=C2=A0=C2=A0=C2=A0 struct clk *clk;
>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>> +
>> +=C2=A0=C2=A0=C2=A0 clk =3D gtr_phy->dev->clk[gtr_phy->refclk];
>> +=C2=A0=C2=A0=C2=A0 rate =3D clk_get_rate(clk);
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Allow an error of 100 ppm=
 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long error =3D ssc_=
lookup[i].refclk_rate / 10000;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (abs(rate - ssc_lookup[i]=
.refclk_rate) < error)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn &ssc_lookup[i];
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 dev_err(gtr_phy->dev->dev, "Invalid rate %lu for ref=
erence clock %u\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rate, gtr_phy->refclk);
>> +
>> +=C2=A0=C2=A0=C2=A0 return NULL;
>> +}
>> +
>> =C2=A0 /* Configure PLL and spread-sprectrum clock. */
>> -static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
>> +static int xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct xpsgtr_ssc *ssc;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 step_size;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 ssc =3D gtr_phy->dev->refclk_sscs[gtr_phy->re=
fclk];
>> +=C2=A0=C2=A0=C2=A0 ssc =3D xpsgtr_find_sscs(gtr_phy);
>> +=C2=A0=C2=A0=C2=A0 if (!ssc)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 step_size =3D ssc->step_size;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xpsgtr_clr_set(gtr_phy->dev, PLL_R=
EF_SEL(gtr_phy->lane),
>> @@ -446,6 +471,8 @@ static void xpsgtr_configure_pll(struct xpsgtr_phy=20
>> *gtr_phy)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xpsgtr_clr_set_phy(gtr_phy, L0_PLL_SS_STE=
P_SIZE_3_MSB,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 STEP_SIZE_3_MASK, (step_size & STEP_SIZE_3_MASK) |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 FORCE_STEP_SIZE | FORCE_STEPS);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 =C2=A0 /* Configure the lane protocol. */
>> @@ -658,7 +685,10 @@ static int xpsgtr_phy_init(struct phy *phy)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Configure the PLL, the lane proto=
col, and perform protocol-specific
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * initialization.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 xpsgtr_configure_pll(gtr_phy);
>> +=C2=A0=C2=A0=C2=A0 ret =3D xpsgtr_configure_pll(gtr_phy);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xpsgtr_lane_set_protocol(gtr_phy);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (gtr_phy->protocol) {
>> @@ -823,8 +853,7 @@ static struct phy *xpsgtr_xlate(struct device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 refclk =3D args->args[3];
>> -=C2=A0=C2=A0=C2=A0 if (refclk >=3D ARRAY_SIZE(gtr_dev->refclk_sscs) ||
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !gtr_dev->refclk_sscs[refclk=
]) {
>> +=C2=A0=C2=A0=C2=A0 if (refclk >=3D ARRAY_SIZE(gtr_dev->clk)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Inv=
alid reference clock number %u\n", refclk);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-E=
INVAL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> @@ -928,9 +957,7 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev=20
>> *gtr_dev)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int refclk;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_de=
v->refclk_sscs); ++refclk) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long rate;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
>> +=C2=A0=C2=A0=C2=A0 for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_dev->clk)=
; ++refclk) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk *clk;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char name[8];
>> =C2=A0 @@ -946,29 +973,6 @@ static int xpsgtr_get_ref_clocks(struct xpsg=
tr_dev=20
>> *gtr_dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 continue;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gtr_dev->c=
lk[refclk] =3D clk;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Get the spread spect=
rum (SSC) settings for the reference
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * clock rate.
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rate =3D clk_get_rate(clk);
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0 ; i < ARRAY_SIZ=
E(ssc_lookup); i++) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* A=
llow an error of 100 ppm */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsi=
gned long error =3D ssc_lookup[i].refclk_rate / 10000;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
abs(rate - ssc_lookup[i].refclk_rate) < error) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 gtr_dev->refclk_sscs[refclk] =3D &ssc_lookup[i];
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i =3D=3D ARRAY_SIZE(ssc_=
lookup)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_=
err(gtr_dev->dev,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "Invalid rate %lu for reference clock %u\n",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rate, refclk);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn -EINVAL;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>
> Sorry for delay.
> Radhey/Harini: Please test this but I have read that code and changes loo=
ks=20
> good to me.
>
> Acked-by: Michal Simek <michal.simek@amd.com>
>
> Thanks,
> Michal
>
Any further comments? Anything I need to do?

M.




