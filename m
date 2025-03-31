Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2081.outbound.protection.outlook.com [40.107.103.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE731DA4E;
	Mon, 31 Mar 2025 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447790; cv=fail; b=FG7GwYPahj8+JEtZ7Hk7bRIzkCdUQvVoz8FAAYGN1NCZrL2Ge5VJqX4zVKvKloHZ8dLO63iInfA4N8AGxw8r5Pi7D0zIUlnnPdI9rwSD8Tp1htdDRaho7k4lRkDNf1vAl9q4+yVzulBnppF+gadAkRm0b6UfT92+7k+8Jg0sVEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447790; c=relaxed/simple;
	bh=OBYtOHo5LJc87LmMAAg1vNRh5BVlX3Mg1+1STN9hFa8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Fe3PvTq0AMqJkXF4Zykicbi+uf+qWAcB3AngoFysQ3sWjyH9A3lSA2GNs1ejNWm38z0aBEHhvNRGHaSK6o1rAFUD1nIdD1aOR6oNWXOOyydeyYX0jiXj6g7srt1lm9daTvPDLQMqrn0+gzao65S0FdG5jTZyThsfJ95aKhNLL78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PDChSxH+; arc=fail smtp.client-ip=40.107.103.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PDChSxH+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVEkB7gPQ9rHR+AxbB2/s5TgDEXpCbjfb+jHWfPngjTvuNuO9FbsSLqsZF2tyr6vxMus24jKppX0TAfsAF2ZuSvF0tm3iaVONhF1UQqAMbzQUexUwZ33LkqfjOjfW1gyx4ybg4zNwwM2BAi1RncN/7jC2kvtZmipSIhDpuAAQjAf1xIrI1kSeQCZEs7Y4eXPDxqNol6//LOsjkbsaaZyn75u1Pr75M2xgTUAztx/KpVJM7rh95P/VM4clmgFMOH0Lb6JTDXdAjxasScgWa6RKJcPXkOSqdSJYX18vnk/GDvPOXinZU4VbpWU87G55/Qz5GgG93LzszA+Wi7iSb+43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmUGLiT8OEVvHZYuny+WlfN1oswXmm3uCu8SlnGNTxQ=;
 b=LPFi3QFgAu5hWG7F0oGOnayMd8Yb10rPNm4qNTU9MORApQ2jMYAV8LdKT/rXRz+BzZOz2eiV8tA+uZXKoZSCYV1BuoX3/z0k3w0HBgu+PhBMoPrFEHcAeck1crwXeIknNOmBNjBAxTOZU5DCwj+GCnPC+WK6lWH6/w0zw1z4drQ6Na/HRiMZCl2Cmcvqe7+aopvMA0Jg1j3oewqEvLUZw7cEb8vYl6XGaYQuC0crwk0JlumbK0AIuWeJ5WmowCJ18QhXpYzCrebCDbPzwHIpm0n1BRAm7dwh73fNZFrDZkwiCTsCh0DmcG+gB5A51baAqWtjYlU1J5V386gTJrBnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmUGLiT8OEVvHZYuny+WlfN1oswXmm3uCu8SlnGNTxQ=;
 b=PDChSxH+OBXuzmrguXbQwaiBhmFTsDa+KHNsWgCPU9BH/BZURS/bbBLx7iEKGPX+XpnZ8DfEj8KC96/7Tov56Y05TCWeNIz/WRjBpuM4dc0Hg1I3de6aj1aa9U7MZGOKbuvhR4b1Glv7Av+FE01gPzGv55fx3Kfm7Nb0LsIWbwzLNzHbMA59kmNiQBZh9ijr97G8FMXjnlb4JrGV38UCOGiJc+hGmdscYXhZY2zWJDdTuk+gHjOYFSX8U9bAsBVpualT52Q3sxvx8rdc4ocmRanlf+o+o6UtfbF3ezFpjLwkl/PbEpFD4/FSt4xs1XN8Y0tP89JhDNZn2P7yOEAW8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:04 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/8] arm64: dts: imx8: create common imx-pcie[0,1]-ep
 overlay file
Date: Mon, 31 Mar 2025 15:02:38 -0400
Message-Id: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/m6mcC/x3MQQqAIBBA0avIrBM0i7KrRIjUVLPIxIkIpLsnL
 d/i/wyMiZBhEBkS3sR0hgJdCZh3HzaUtBRDrepWGaMlHU/v4kzoMLrlYqka1VnfN623CCWLCVd
 6/uU4ve8Hm5XoQWIAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=2275;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=OBYtOHo5LJc87LmMAAg1vNRh5BVlX3Mg1+1STN9hFa8=;
 b=Rv8U/YeR+tl2JXXQy0FwpMgVHtktTFhixa6Jjj07rTb5XuK4Rs2hd5l22IUolxGvgetq/jZWq
 3tHTNkBx+LJB/K4c4ZWa9Ii9gbERHrAQWIVwnd0xYHIXBsqnlr34b4G
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b34e002-271c-4b13-c9c1-08dd7086aa4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1M4bGUwZ1pJaFZIcW9QdlhVMXFiblVFeDhnUVl4bDBpdjM5WEdEN21SOFpQ?=
 =?utf-8?B?elM5VElkTjJNaUh4bzZKMFM2SWl2dWYzV3U0eFRzY3RwWjZuOEMvTXRSRjdH?=
 =?utf-8?B?Z0p2NnZwYVUyaEl0UHIvalVJNGV1bVhZbUcrYVJtS1dibG13QjQybStGcnNQ?=
 =?utf-8?B?cm0zbEJBa2pSQnBKUXBJZzZDeVJIWVVVYnhmdXpxb1p0ZHZydzViNmVmbXpk?=
 =?utf-8?B?QVIxOXpDaGY4ZENMUGx3Z2g0R2ZlWVZnMHk3TVVoRkdVc1AwdVhicTUyL0lR?=
 =?utf-8?B?MmoweGlZWk56WU9xSVpzRkhGdFJsSlRFdjYrM28wK2ZMa0pwa2ZveHJiaWxM?=
 =?utf-8?B?L2hkRTlUcW9kUlFCdGwxQlRVM0hDb0xtVHVtTE1mRWtxWGp5VzEvZEtBZzY3?=
 =?utf-8?B?cHNxU25DaDRDMlRRVFZmaCs1c09YQitSOXZSdk5od1BUVklRNUdIL096NGpZ?=
 =?utf-8?B?UmsxUTNaTndQMlZ5RTRnTlAxRmZEelpYSHY1Snk3djJ4YVhKMDg3QW9nVEJT?=
 =?utf-8?B?YkkwWFVReCtDL0dqdGUxTDhha2RWZEhhaFBMMFQybERuZGNMVllhQUFJaXIr?=
 =?utf-8?B?OXlUbFVBYzlmTzlFa3NSUTAvM0czb0F0SXhTVkNuWFh4MjJPcS9ZdTZWSnBL?=
 =?utf-8?B?aFRwbHNFZlBVdmFTRWVrZFVsb1BDcEFvTlF2bTJoNHZNSlZuY2xIUFdDWEQx?=
 =?utf-8?B?c2lTYUtGZjZJdmVqRW5ZTjI3bjNRRHlLMURZejQyWnRjd3ZiOUYxMUswMU4v?=
 =?utf-8?B?Rzl2NE40UVBNdnZFZXJpYkxXSkJFazFzR2EwSzQ4NmNLR09yeUJIWHBrdDRD?=
 =?utf-8?B?NjlNcjhtWGtIWUhRczkzMGNoTGR4SnU1ZW5FM1NHVFhFRlZUWlNYVzR0VjBO?=
 =?utf-8?B?TzZFVExuZlBvK2NTNjFZS1ZjcFk3UUFpQmg5eStzb0xha2psSDFpMWVOODkx?=
 =?utf-8?B?U1lCbGhpQ05VSnByUTg3VnpwVVVqTDlXdWk2bldicjhZb1EyTG1nTzYrbG9Q?=
 =?utf-8?B?QU4vb3JqMXExQ1FhYXBYQzhYa252UzFZU1Bxay82SEQ0QjR4MjkvdExXSnlM?=
 =?utf-8?B?MWlQRHVEZ0JTWEw5cEt3cDduTGt6ZDBQR2RyQlVLY3NmL0U0UEIyRENxNjBN?=
 =?utf-8?B?YmdWL0xTNmVPRTk1elNNeG1ZWmNmRTlrQnVWTVJ5RXQ5dkNES205cUlZcHAw?=
 =?utf-8?B?WTZBWnF3WC9EalNORmttd2hFM3J0MUZmMkEyODZINWVVWEdyWkhaMFNkQ04w?=
 =?utf-8?B?Zm1abmg2akxTbERlL0szdjdNcFIybjVacEEzSGZ1RzRBcEtvdy8zWnIxbjVK?=
 =?utf-8?B?YnJ2ZE0zODgyRWs3ajNwQUZoWmhaNkNBOXN5VC9wVGI5dzhOUzhRa1dMRUh6?=
 =?utf-8?B?cTczVCtGYUdKWUJGVTMxR2JVUFhZSzF1ZDByUXVYU3hucndaNFE0dDZzZktN?=
 =?utf-8?B?cVdhK3g3WTdHUnIwN3V5MlJ6UWcrNXlOWnFqU1djd0hxTkVTMWxjL3lXcnNX?=
 =?utf-8?B?NlUxZ1RJQ1Z0Tm5qU0I3aFFWYndZenhSQmdkYVZDT2c1NGFkYW9nNXZ6WTQx?=
 =?utf-8?B?RDcwQ0YrZnBnc3hXOVNaZC9NM1lLa094Y1BJTDEzeUVXdEdCbFZkZisrZ3NW?=
 =?utf-8?B?VXFwd1FuSHZEbHNWWEg3TWd3bno2RDJVckYwNFk0NFBVSnkrb005WklhT1Jq?=
 =?utf-8?B?L09ieGdKQWJZZFhaTEwza3UxWEZDY0s5ZldEb2poWlNETytKaU1Zb25CK3NW?=
 =?utf-8?B?cnF5TXVmZ3dUTm5sTUUvNCtsNFpzanlJZ0VsUENNRENPVTdMUzdDLzRkbGF3?=
 =?utf-8?B?SUw1UWtidU9GMDNkbU95YnlVYmdCR1RDQ3pSS0c4ZlVYeEMvUXkxU3FPVnN0?=
 =?utf-8?B?QWVMNWxobEdIZ3htZjk5SFJOWFBRUTFUZWtqK2JEY0RRSTR3ZlBCdXBMeklR?=
 =?utf-8?Q?tGjikXCjWxpDFixKkuBS2DImvydMSUx+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmM4ZWc3QmZrS1hZZDlobXdLVHVRQkt6bUkxaU00ejRZdDFhR3NFbHQvc3VL?=
 =?utf-8?B?eHA0MnNLVnhJT09VV1IyRUNSU2VXenE3NzNZcnJMTXRjclZJeHovRmdFdGZG?=
 =?utf-8?B?aHcxU0pndzVQMXZSMkF4ZHgwb3ZqZzJWck15UXB5WkZudFJxa2dhVnQ2YWxG?=
 =?utf-8?B?b2N0eGVOSDVXQXIxdENXb2FQZlYyZkU5aUh2WDRkNWxlN2hqTnFoT0xPL1h5?=
 =?utf-8?B?R21weTAyL2VMeTZPNzFHaWx3V2F5RWU5dURTbFBNTFRPT2IyN2hocFRQVkpa?=
 =?utf-8?B?QmxRSElsM1N5RXVxQllLVm8yK0tSdEQwYVpkeEdWc0lPWll6WnJWbFlEQkZT?=
 =?utf-8?B?R1Baa25WRENzQlhyN21aZWxJdW50djJNV1k3T2pvRWp3NlcrbE9hdERwazZm?=
 =?utf-8?B?RmpXNmtySDk2K2xCZ2tadTluMXlRYVZ1clMzTExHcThWVkpaL3YyV01pQ0Ey?=
 =?utf-8?B?djM2Y1IzRE9HZXlLUmdPR2FrUGVYSTM4ZExTRFRCeTQxaktsSC9WV0N2Nmp4?=
 =?utf-8?B?eW5LWkxaYjVydGpDT0VHaVFRWkFrZGhQQWFFMi9aN1grcStlWUNaM2YrbzBq?=
 =?utf-8?B?Y09TaGxsdEJnNWNvTS93MHN5OE5UWFAxVStvdlo2WkR0Y3FWbnFqWHNMalRK?=
 =?utf-8?B?WEJNNStDN28yRjV2YmYydG5BYVliVjBLeGcxK2RERXVQYWJqNE5xRytVUUhk?=
 =?utf-8?B?YVhKMVBGQUh0V3hMMENkRmNJcXU1dVZmLy9BQXJQRjVlT0pWUjU2S21iL0NK?=
 =?utf-8?B?dm5pUHpnbloxYXlycG00NXNodTF5SDN5SnE2cmRRMXk4UWN1eFF4QitaanNs?=
 =?utf-8?B?MUdlS1lGN0RKZFM1ekZ3UXZOQXhxbXRObFFRODFOVGQ5MmRaTWRJcEJtZU4w?=
 =?utf-8?B?L3ZQdHRVMzc2QitiSW1yM3QxN0NYdDlEL2h0NmtFVFhzNFdOa3RZYVUybitY?=
 =?utf-8?B?Q3lhejBRRzJML2luTlNUc1k3bFVVa2F6NktMUzY2YVhaZ2NWMHdYVnFJbkNs?=
 =?utf-8?B?MzBqeTB4cUs3RE43TVJaM3NVSm5Xc2xkTUZuZzI1RjE2NXA5ektkZURRQ1Qv?=
 =?utf-8?B?eHoxMW8zakMydzFpMG1qYmlobHNxNUNjZnRMUHJtLy9tUFAyaEZkdzhiRmJi?=
 =?utf-8?B?SUhINjVyaEgzelZZaUkwRlYzRjlOL1RDdHNYbVRLQU5YSnl6N0Y4bHM1SXlq?=
 =?utf-8?B?ak0vcktMdCtoZ3h4VHpSckE3Z2VVM2RONnJUZE1Ra3p6U2NvV2J4bHBMaUto?=
 =?utf-8?B?eDFiUTFTYjZqRFRXRnI4SDR4WEcvRWRFMHBURk4yNE9LUkM4OENJaHRNNFlK?=
 =?utf-8?B?Y3hrZHJORk9yYlh3NTBPbnVVMTdrU2xINVVwaUM1cklKZGYvYW8xbkpIZ3da?=
 =?utf-8?B?ZUdCM1N3dHY3aGYxblZlV1NMZ3UxeVUxQ2ttMjBBeDRsSUErNmZacGxNZXRV?=
 =?utf-8?B?ZGwyaWpvNjBCSnlVcG9EYlp2aXpXcVdJdi9NWi9ZdnZTM09CUlhTYk1LcVJX?=
 =?utf-8?B?MGdPZ0Z1M1dFNlZ1SDFPWW1SdVFqR2FlTzF6Z0Z3WFZFRVF0SGhpZ0Z3c2wv?=
 =?utf-8?B?T2VwQXpXZ1E0WnN4QVgxK2M5MUVtTjVIZUVGOXJTZ1VjRFkyMjBJU0xlZjRy?=
 =?utf-8?B?WnA4WkFHRkhBcm83MWNnSmhhb2MwWUVjY2NEMm5HUWtOdnhkMjVEYnJHN2dT?=
 =?utf-8?B?ME9GZ3BiYkxGUmdYNGl4cXVtQzZnOVBnSVpnRHBlakhiSmZFR0h1ZGVHdk5D?=
 =?utf-8?B?L0w5dkZqcjI0Vnp0T2l4bUpXY1JPczBndUQ3ekVQTWhDODVyR3Y0UWJEQU5Y?=
 =?utf-8?B?aVJyUmlWd0w4ZTdmY1JRSllqWndNcTlZL0l5c1AxY3lDZGxOTDlwQndkWllH?=
 =?utf-8?B?TjV0NTlTRGx2TmduajIwYk9yRnd3a0ExVnVQaUJjUVRpcGFNaUdhRitKMFZK?=
 =?utf-8?B?b0krOGVZZ290ck5zaU5IRUdDM0hFMk9QQTdoUlFVcEd1WERLM1YwTVFsZ3Nq?=
 =?utf-8?B?dnJuV291cmNUMnNDdlcraXJIWVUvVGJ0NzJaeDVWdEFwbTZHaDNOV1FWYjFY?=
 =?utf-8?B?SkZxZCtxb2VkVDZaUlhpMm15OXJyWGRLQ0F5OThWQ0svS3JHalM3YWpaOGVI?=
 =?utf-8?Q?Od5qkRp4vnGU9CH3NNsoHm5W4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b34e002-271c-4b13-c9c1-08dd7086aa4d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:04.3674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCIf7cV7pOeH/uVO9Al1XYt4LVDCFlAbdNiZM0sGJTrtC4aSQOGSBo+6DTv7PlRiHSP8q9o1uxEtItRvsU7xvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Use common imx-pcie[0,1]-ep overlay file to enable PCIe EP function for
all imx8 boards.

unified pcie label name as below

imx8qm
pciea -> pcie0
pcieb -> pcie1

imx8qxp/imx8dxl
pcieb -> pcie0

imx8mp
pcie -> pcie0

other boards already use pcie0 and pcie1 naming. Orignal label still exist
to keep back compatiblity.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (8):
      arm64: dts: imx8: create unified pcie0 and pcie0_ep label for all chips
      arm64: dts: imx8dxl-ss-hsio: correct irq number for imx8dxl
      arm64: dts: imx8dxl-evk: Add pcie0-ep node and use unified pcie0 label
      arm64: dts: imx8: use common imx-pcie0-ep.dtso to enable PCI ep function
      arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files
      arm64: dts: imx8mm-evk: add pcie0-ep node and apply pcie0-ep overlay file
      arm64: dts: imx8mq: add pcie0-ep node
      arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes

 arch/arm64/boot/dts/freescale/Makefile             | 22 ++++++++++++--
 .../{imx8mp-evk-pcie-ep.dtso => imx-pcie0-ep.dtso} |  6 ++--
 arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso    | 15 ++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      | 12 +++++++-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 25 +++++++++-------
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      | 13 ++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  8 ++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  4 +--
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       | 20 +++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          | 35 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |  6 ++--
 .../boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso    | 22 --------------
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 11 ++++++-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi |  6 ++++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |  7 +++++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  | 14 +++++++++
 16 files changed, 180 insertions(+), 46 deletions(-)
---
base-commit: e90298c336486695a47a3c9d968e33631c2d2b5c
change-id: 20250331-imx8_pcie_ep_dts-04079a845a9e

Best regards,
---
Frank Li <Frank.Li@nxp.com>

