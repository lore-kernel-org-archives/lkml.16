Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E3721ABDC;
	Mon, 31 Mar 2025 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447804; cv=fail; b=kqYP274KehPHMeLZFlhzG2C1i6ujxiSkv9IazoeoYtuRDkd3956nomfp0fzkJlRlJLapOZoV2pr7WdNsPA4u4uu7i9YHrRGiYvVbaUyzhnATSmfOjIc0U8n8+seYeoJAzQnJ0B8dvXTwcwhDYvR25XdUpjuEoOG7PFbGyJbA1ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447804; c=relaxed/simple;
	bh=GqmVzx3QN8J61JwHycdkF8lhqGaHz1X8f8EGyilRx+8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Af2T12EbFC2oYUgAgi4ZjMzosFfRWek+RNje2bsye++l4CtlM5kjZt681rkZ1mOIvlS028FQJ/zpqPowEOpPfUPLLwOHYyast1nteC9aYrTji7Zg28O74kPWPQ8WZlotATpH9JUtHg5KxzsRllgbb9Gtzw0XIwKTm0qixWD6r+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gfu2Wb/J; arc=fail smtp.client-ip=40.107.105.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gfu2Wb/J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ft6sGArRrAmEksBchm6417so4VKN8edW/GWeW1SHvgRU/AElzhumra5u2oMsMIOcBklayBhwDBECbZxuLCFpFuNerGgzGDBJTo0WTtGrdRyst/K3gj4p6j3DaEMqTpBN9qRtzwcDKqc5s8OyTshxFx/G83P07CC/C+7V7rWlopwHfQLXdUUw9bDv2cLgiXeVTQWHmQPgIziczncvE7yvgazbItx7HeYGrYriC5ieJBsiQ/Uzi2VoiPK/9Qg3tcJCZpjodb6soof9wYGuISuRLmcvFENgEKPtKg16ynEkwS11nQuu/dm/OFB6Lj6/rAagKhUvM8xBBOC7Pqvm8q+gvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYCSSTzDmMPDLFEOzO4wt2dUNu3Fz4XKLRtyM0ObWv8=;
 b=AZoNJ6dIaRzO6VJawbxwJ1dNua+6s1tu3BQ4ohRmHJDwGZ/26ZbWVbESPmTgzFhxiNOxDO0ihvHrKjCx6lyb15GArg5O257RN+u63M/kXYN67oW/I7s1IxERKXyqSnbpBw8P6j0soNJA1yGLFY+FOLesn2zGkZWWDVEtzYUioYx4B5e8XPyDZYfcw0n6vyvhtcc7+DpGNJFeXDz9GVy1fBTneDzt+3283FhNywG2Lno3J297deRRkSZ8Dv7oR7Pi5e3OS9jLvcd86q3orbbVIdsns6jYZ409PDNecKj041A+7TQdDnV21nNiUfmIJbpNIVVf3v44iLPVB0GedEwPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYCSSTzDmMPDLFEOzO4wt2dUNu3Fz4XKLRtyM0ObWv8=;
 b=gfu2Wb/JaP3HXIVfoVr3pMt2wDAVf7epScfIhew6WzKfBifLb1iwrQ+4jpgPXZZ3EtMFNQyGN1RJOmlJIYP2YHP/w6+MI5fsQU4kn/hx/IlQX/bVVQU/nCN9hP9PkgXPiS+9WhLgfzffldf2fainIrwznSUUTg8cjQhGKgKLs4BBuuZNsU3VUB9NhOgKNHssAWAifnvqMb8oA9oidO1/dCNlyBgGOb6S+Khoerp4VISNLg+UcwbuEbIHCX4ruHLD1vLdT3wZyfCK3DZprv17NkWvwdtOXLnMNwn2IO1t1gPyjbouvPt5ZuBrI/7YBs11NeKMNTSLZ8EICjX8ebk+4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:19 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 31 Mar 2025 15:02:43 -0400
Subject: [PATCH 5/8] arm64: dts: imx95: add pcie1 ep overlay file and
 create pcie-ep dtb files
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-imx8_pcie_ep_dts-v1-5-270ef0868ac9@nxp.com>
References: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
In-Reply-To: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=3206;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GqmVzx3QN8J61JwHycdkF8lhqGaHz1X8f8EGyilRx+8=;
 b=WQV/Nq3uBpIr5h3lfiJAIBHccvlyrZ+mDJa8x7swcdg4IN+5zl6hEF4gHftSfU0Y87KDq/H+u
 g2nY5HyEfQoDe0aCe/p2kwsqa79YndHbBVtSoAUESW2oFb45qHT+G7+
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
X-MS-Office365-Filtering-Correlation-Id: f5d8650a-6218-4864-0e53-08dd7086b349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkR1U09VdWhZQXdvN2NUNnVVYzlzTmxJTUtJd2tmQytyTHUyNUI0dzRnVFd6?=
 =?utf-8?B?akowY1FPTFhqL1FFTnNIbDFUMHdvU01xbWhydjlaTDdoSytDMUgyRzZndnRZ?=
 =?utf-8?B?dlo0MW10OEQ0aGp3UU9XcndnQlllbjdkYVdGUU1XOWlPUzRnZDNEWDIxQUhi?=
 =?utf-8?B?Skp6ZDNSbktBM1dCTVVxcUVjVVJHN1AwSlRoTjN0dktKc0hKVjlpek9SeVhW?=
 =?utf-8?B?R1hncnB5SDFpektYak9yTVV6akJsYW1HaDFmenlrMTBnZEFOaHhicGxYTGJi?=
 =?utf-8?B?UUJHdVZNV2tQbEVCYzRkV3E1MVRCSkgzMk5GUVg3ZnVzOStmRHc0NFFmNHhy?=
 =?utf-8?B?cVRxc2pXSjBBN3lVK05NVzhKVFl3T2RSc2JJN1RSdTQ0MWVtMHNVN3Z1MkVH?=
 =?utf-8?B?a0lZYlFqTk9OcHJLRlZNUUFLTGxkUk02V24zYk5MNnF5cmNFUFlTRGZ4bEZT?=
 =?utf-8?B?UlNNS2h1dkw5WHIrMDBZcmZNY3RtMndDb1VmOWFOMnJPQjZ6L0wrazlQWndX?=
 =?utf-8?B?RUdlNnUzV2x4NjVBLzAvMlVkaFEzSWd3R1BEdm00VjJDZEVmb3Azbi8xVVlG?=
 =?utf-8?B?Wkd4SW1udnNYY2hHQVZXZ2dQUXQwc1ZkM2ZBUXZBTmJOMXB2eS82WjNzYUtr?=
 =?utf-8?B?K0QvZzBzK0R1UDZONHBSVWdweEFDZmNYdVhQcWtwZmFsclBhWFZLVXBUTkFs?=
 =?utf-8?B?dC82dTZNZ2FoNnJob2k0K3FEb1FuZVVKZWRJdUpiV2s2SGNQVGExc1I3ak9L?=
 =?utf-8?B?WFEyZlNrTTZDaWR6OEYrQVd3TW9SclZldWlENEd5ZTYrcUU3TUxJZytYOXNr?=
 =?utf-8?B?bWRJbHU4Z1pCeGpwZGgwaklQa1ExV2p5UXdBU0hpQktMZ2F6eGhWVnhDMFFH?=
 =?utf-8?B?YytaTllLVVRCR28zV3pXTG9KTVkvcS9hTUQyUlNXeDFOVzc5cTZFNkk2STM0?=
 =?utf-8?B?blZRdTFmSHgxd1RTcEkvSlppRXhXM0d6b2RVTnhpL0Y0VVFCc2pESWNTd0oz?=
 =?utf-8?B?Y21zMXFDbEpnL0NHTThJRHBFTWNVVmNBQUFzUjN1dG9NZ1dsWDU1N1NmdXNo?=
 =?utf-8?B?NlR2a0U2K1gxVHZuRWxiMU9odExRRWlpaEZGdWdYTjBwU1V2SXNITEhjTXll?=
 =?utf-8?B?QUNXSHNXOS9hdzAvVWNZdVNnZXZ3dGNXRlhXMDNCcEx3a056bVRya0dMZXNh?=
 =?utf-8?B?eXZubDF3SzIxMUFVZUFwL0FqNGpSMStDUW1ROUZHZU94RmRFUGJpaFdIQUFw?=
 =?utf-8?B?OUUvNmgzcXZmNlE4WjZmamY3cVBkN1lsNGpheEJjek5peVZvTXV1OHpNV1hY?=
 =?utf-8?B?QzlxK3RPVE84N2FRL0xYeGhXNDNxeFNVN09yTmM1UkRjdWNZcjU3eXBIdVVC?=
 =?utf-8?B?T055R0RJNFZXdTZIaGxKUnZabzFlbWdCY2t6a3hnNHlGczdpUU9WZXhTckhT?=
 =?utf-8?B?T0dBbVU4OUc3clViSkFHOENKU1B1emxkR0pieDArRWZWZ2ZtbFJMS1dvWWZP?=
 =?utf-8?B?THVWd2o4cWNoRVZBOVVscS9pSHZPelJ1RHhoa2F3UGx5YllzcFFpWVRyc3Rz?=
 =?utf-8?B?UDNrMEVZVFN0citkUUp2aU9VczlJMTFHS3BnOTNzMCs4NzRKRjkySjQ5OXNM?=
 =?utf-8?B?OGJQK2FNTEFhVlBWMEN4TUFEa20yNlNiZnVsVXozakduU3VtZGF3MmFhbjRm?=
 =?utf-8?B?Rk1jTFlnWXpyTVhsSE9FekRKREpvU2puTytXZk9HTzg4WHR3NllUc2dsaFNR?=
 =?utf-8?B?U3gzZEhHTEFzMTRQVkZXUlU4czNObTJGNzN2ampUYndQUVBVSk51bFF1Tlhh?=
 =?utf-8?B?NFFjQjVhaU1DSGhqWTJaUkswQStkZFQzaXArYVRLK3Z6alJOUkRDQXlqeDl5?=
 =?utf-8?B?Z3I5T0VDQUZmMnN5OXpXOW1IK3ByN0ZEbDVPZEpMRlhaamlwV0NqMDhpNGk5?=
 =?utf-8?Q?fK1d0ltUBJcU+17Kda2Ksxe53qZjAq/t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnRZRlEwMjc5VWZuU1lGcVdxQk1ZVkxJOCtwdjFjS2cyM1k1cGx1elNMRTV3?=
 =?utf-8?B?NXlQelR3aUZialYvdUgrVU93RFRHK1RqdUZjZ2NSbFpmSU5tRjVsNnVCdUlO?=
 =?utf-8?B?TnBjVGFXRlVRT1NzMEF6STVLZjZWQ2lZWkFGRjB3dDJQODk5SStPOHVuSnkx?=
 =?utf-8?B?R1pDTXovbWh5RmErMlh1cWhpNnpsLzZkV0R5dTFaK292WXJsS1J2T1RPN3U1?=
 =?utf-8?B?TVdSNkdCbXZDVDFUdktZakNOU1NjYWVYcHYxOW8zKzE4YXlERnZnRDZFemZM?=
 =?utf-8?B?azZ5emFZbEczbWZ3WW0xTXhqMlBjOGR4OURBRG1uck9IVlBXSktBWnZFbStR?=
 =?utf-8?B?RHNJdFoxTWFLeFF0YTdEWHYzWUcycnFyMGlhWGdqWDVkSzVBcER5UGJTNEUz?=
 =?utf-8?B?ZHhpMU82ZGZqNkRmRUZuUDZMUVJrS0dsREV0VE9wQXpSWWxvWStBK1owRER6?=
 =?utf-8?B?UXFLNk1OdENna0w1NHRibnJaVnROT0thZHV6Rm5CMEV4U1VUcjg1cUFiYnBO?=
 =?utf-8?B?VSt0a01TRlRJaUc0eERWeGZhYjNqQ1hadGpabmpOZUVqSnBZS3FBVHZQa1JX?=
 =?utf-8?B?dDZTTmJrUzZGaWJpZ3ZQZzZXaUpoT2FId0JHUDZMeXhOb1JwZVFpQm0zUWND?=
 =?utf-8?B?c01ZSFRLTUp4dytaZ3hRbGEycWcvdzVrWWptcDgrVFluNXViVjRORUlsRFlS?=
 =?utf-8?B?Z3lVVlVKOWdwUWFmcmwxUzgwa3lIZVJ2LzFBYlkyVnVla1A0ZlFSbjAxb0pu?=
 =?utf-8?B?cEcxYStKVTVCSll3d21zZTVDMGMwWDJzWUZDMjk5UnJKcE1UQ2ZId2RDcVBy?=
 =?utf-8?B?M0oxTTFDZkVLbEFFT2tUaEVyOTJaaXFPRDIwOHZpbTh0NDI1eDNidjB3SXh2?=
 =?utf-8?B?NW5lMDQvUi9mcVR1L2twaEIwQmJqZ3hjTHg2WWtUY2xLakxDbnhtVHl3SzFM?=
 =?utf-8?B?aG5NSVRTZ2Z5TWxXNnlFMUpLeFl1V1RacWJuS1FYZDB2VlA5NmJUNmM4RUsw?=
 =?utf-8?B?NzRJdEhBN05Ianp0ZHpaN294N3Y1eFJRQTNNTVdSemhpMzFLZ2FwcTRVYnVN?=
 =?utf-8?B?N001TnZwTEVva1FRVDV6LzJuVUhVLzhEVG5kSjdYUGljbFJxK0t3M251YU54?=
 =?utf-8?B?MEY3TjJCZHkvdTJERXNwaE1pcmw4d3FBTXp6YThyZTVTRklIT3h5czlNeHkw?=
 =?utf-8?B?dDJITExKbkRqTGFOcC9RU3ZGZTNleDBZUGlHRCtaWGNRdEVDVEZEN1ZlYzY2?=
 =?utf-8?B?dDF2aDdpODNhd3ZtZGxlN1BQRFoyMCtXeDFBZmNZcFRydG1SekNzNjZGUEE4?=
 =?utf-8?B?cE0zWm1FWWJrOW96S3ZadW5vR3Z6VDErbkxEbjkxamN6VDBoTkV0YlI4RGdk?=
 =?utf-8?B?SVE1MExwNEk3eGdrYWZqdHgyVXJzcjdKWndwZDJaWkhnb25KM085RHVBVkxR?=
 =?utf-8?B?c2JaYmZ3bUhsY1dEWk1GQnRHcWRsbEVESGJiTXBDVTk2YWVPVzFsdlhLNm1L?=
 =?utf-8?B?YW0xUWMxcWlHQ0w1QUVGL2pUdVBpaEwrVFRKU1N0MWtvSWRqbEZlUG1kdXFG?=
 =?utf-8?B?dGZqRUx4WGtkVGZJalZqejFSY3ZLTjRCVGgzR3VvWVhNUS93VUpKU21vckhO?=
 =?utf-8?B?T3BTYW1ndU5zaVdPOVR1aGJIaVJwbjZwYVlKT0kwdXZvZzU1RzZRL0dRUDJL?=
 =?utf-8?B?SVRhNDY1VUM0aUY1Rjd1MW9lMW1RL1g5Q3FtdEF0OTEyVHpPaG53d3BTNk9C?=
 =?utf-8?B?TGxxNHBKbDBXQk9tQXk1ajJoR1pqZzI3OTNwZ1Y1NkcvZzMwUDFVakdyUXFR?=
 =?utf-8?B?MjJhaU5xRmp1TXhFZE5LbzhRRDN5YnNYMTR2eFhVTlpBT2k5Tnp1aDNFeDBk?=
 =?utf-8?B?MEVZT2dzVkZhcDdGNWpwZFkwbWphaHo4Z3ZZTGJ5dTBYQkxrdUNCL0FuaWkr?=
 =?utf-8?B?ZjFLdWQ2K1RsbDliVEdBMEg2NUZBcE44Y1BvWmY3Snp4U2pQVGtXMFVIK0RJ?=
 =?utf-8?B?dzF2LzdGOEhsLzExbHU0RGRvQVBXSXczTFZ2Z1BkeTYxajR3TDltUW4xTlFy?=
 =?utf-8?B?NlZRdUYraVlLUU44K0N3MCtPbTBzQ3lJQkpVMnRmOEhOV0xveEFPOXJhb3Y4?=
 =?utf-8?Q?7B6Ijfv6ACQOhTNxZYifh0DjO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d8650a-6218-4864-0e53-08dd7086b349
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:19.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLKlld4BmzETtpeoiVJbObT39sL4su2f6AOJJLmceaOfeVAI06LNFaFos68k+I557XKodO/FRickKIWOtvOMng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Create imx95-15x15-evk pcie0-ep and imx95-19x19-evk pcie[0,1]-ep dtb files.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile            |  6 ++++++
 arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso   | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  7 +++++++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 14 ++++++++++++++
 4 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8bea36060df22..7778a0b3abe37 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -308,6 +308,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 
+imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
+imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
+imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
+
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-dl.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso b/arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso
new file mode 100644
index 0000000000000..0e7ef7ef85605
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie1 {
+	status = "disabled";
+};
+
+&pcie1_ep {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 514f2429dcbc2..a35962f929f6b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -525,6 +525,13 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_m2_pwr>;
+	status = "disabled";
+};
+
 &sai1 {
 	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 25ac331f03183..4accbccc75239 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -417,6 +417,13 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_pcie0>;
+	status = "disabled";
+};
+
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
@@ -425,6 +432,13 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_ep {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_slot_pwr>;
+	status = "disabled";
+};
+
 &sai1 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";

-- 
2.34.1

