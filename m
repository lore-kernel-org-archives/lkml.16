Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483EF23C50A;
	Thu,  3 Jul 2025 03:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514152; cv=fail; b=oLv8cmeDaBwHlK0xvbE27tPcLwISKeNOPEUEZHnnovxI8xuuetu5fEzyQ+21iGc5Rlnlboer/Q811yoKu4CK9aH6KjFl8KG4wKBgn0d8CDy8QMX1mCcbLOtXWnfKDAxqNjeL/r45G0gloEAlhmv2XUrbXl3NFIJjJ9f9co4AA4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514152; c=relaxed/simple;
	bh=dIscNyKXnnu5FKev2KOmr/lfROCSB4oR8GMHgZ4l+As=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qPSq5m23HCUlDE9EWWSalffRPqECKECimP7VQTkqqMU17sElb/gQqpRekFEopNrw4jfp/CXnNIZOjy+paLOtLUqTcwPaQ+8qxlXQ2USiVnIIMDZUWLGPQMkiaIqrhx0TCJuVLyDu3fDAF7mdY84xbP1rd2VcecxyaLFZCrGcxWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XRwxGYw6; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XRwxGYw6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvyjsyGwG4/se8pE5MAv7Wt0Jk7TcKMHbmN9Vhvr/itYOJVyEuHcGtyEHtlymTVOx2oO1vGE8vekQRQBW98q83rLRU1u1avoMfYHcoBGypWIoj9G4c5XVyrLuU4xRb+bLDwevmOwxU9L8XiLT4i4zn6q9lADcR/mxBPjcs0VnAtX56M2DVDwuTmWXp4TGQtNgFV1CM5NyxN1exJ7oPctMuqONzEPj0scNucSaULv7/zm7W+8flXsrSzN40f+N5MIxkqw9NlRtwvva/rr0VRoZLK98Xoo92p1bFdmyLVTmOYX17pNrdnWpffYRl+HRRRw89KzADWcHfEwedeM1qX7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BNRgiOHz9xFIYOmIzhImOgetk4NxAVqikSuS/9ZtzQ=;
 b=i5O18dJsT84BWR2ANdUXTU1vdoKgzPR+6eG6CN5cEBTkblnZI+aGoayDDakxcsEktn2iIN9Zv1KFPySl91aMzMCxSP9RkFyfPp+8/hwCtSmv/ODC7pxuaG+Hr6W2UMqE8AoyE3YaMIJfdEAGXoJS462uFyQecd/avFVqiLHrv8t1P0BtQDbKeqRHBpRDi+vjBzsHJb45jwZo+RzEKp+t6HY5Qmx9d3pp03DCilUx4moJ1L4hd55UEpfMVPUNPB0Jg4Sbs9SWIpwYwkjTHCyUgButp7+y3lzlQq14qjnBYpSfJA7AlrSe7NjVlClUBfvC8tqwPmKICCOP2zlbMt2q9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BNRgiOHz9xFIYOmIzhImOgetk4NxAVqikSuS/9ZtzQ=;
 b=XRwxGYw6+SpQudreD5I+8Lfss/y3etaGCIGI5ooL4MZ+Um7cCx/J1Ho/jScTRdfblo/CxyUc4J8uUVnPdCnoetTJ6JPn0kZHZbglp6bLFULjr48fg4yucw/oH1xBEALANhNLQH8tKhdukYBT23iA317i+GsPLAQt8mAORQ/3noJwibeGhdfWXuIr9UCPkDNQh0bOqwp+i9Jg4w4H9EcFLuPJVr0xa72T09ErmUfmZZnoJAg6/uay8uGWaylduX2qDDYXU0S6zj0M7RpUY+oES0BCxBrv4c/gVGu9IOPvu5TODYz+QIoOEPb9MObtxo11BrbZoLzA7t8+Ey3jynVaIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11206.eurprd04.prod.outlook.com (2603:10a6:10:5c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 3 Jul
 2025 03:42:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 03:42:27 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 03 Jul 2025 11:40:20 +0800
Subject: [PATCH v2 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751514039; l=1573;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=dIscNyKXnnu5FKev2KOmr/lfROCSB4oR8GMHgZ4l+As=;
 b=n1fyjZlPe6yTGjKWVBKoIEQR03lXPm0F9M4m1pGP+k7vofLH3EM9ZpUjpfwcmWIw011WNj23E
 kvynSrbFDOKDMWkRYR2TnX1axuD7uqCW2NF43yxsOBMEasxE9+rkuPF
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU6PR04MB11206:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0282e5-2a0d-4c9f-77cc-08ddb9e3a158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUJGZmloRWtyUHd0UUllTGh3eFBXTUMzMTlMUjNJcEVZU1BIb0QvNG9aVE1X?=
 =?utf-8?B?QlREODQxZ1lJU2o4anJHNVNIQnNjTEs0b2FsckdhUzhocEdmZWdMTk5IN0Jk?=
 =?utf-8?B?MEEvb1JHMTdMUGtYcm5EZ1UzcnpGZk0wNFdESForOVZMd3BmYTRUYTIrdDBO?=
 =?utf-8?B?ejRveG5jS1dxeGNMTDRUUW5qMkw0enYydVI3d084YmgwdzRvVlgraTJMdW5G?=
 =?utf-8?B?RmRLaUNTZnBZbktIQTNZRUJ4MFZOZ0l4ODkvVjdEdjFhQXlFdkZ5VENvZTJi?=
 =?utf-8?B?SS95YUl4aXViNk1xK2NRMHcvNWZLSVZaYk5ycmRqeGpZYUd0cjBla3pDMXpK?=
 =?utf-8?B?QjcrY1k4THpOMDdDc2NWT3IxQ09oNzQ3RlV3TTZjakg5S283cUtQRExNNGJy?=
 =?utf-8?B?RUZoNkFMTWpFYmIxanRpdW9DUXBlOGV0QjRPOEsxUmdIbEdvSWlnQ3llQm9M?=
 =?utf-8?B?QVg5cE1hSVNvTzNHNGtOdC9WSHJSbUUyV256NmJKNUlpV1RKV1BsVmhHeHNG?=
 =?utf-8?B?ZTZXVTV6ZVZTWlllZ0YxSndEejB2RVpETDZ4d2VxRUEyQU84M1FUbjhSRnZS?=
 =?utf-8?B?UVA0dndPaW5SellobzRKN0V0d1Ezd2h3R1d3bTI3djIxYml4L2M3NG5QMUlM?=
 =?utf-8?B?ODZrRDFyU1hyTVVrT2Z2OHROMmg1YmlsbHhURm5VaHpSZmgwdGNQSUxOU2hG?=
 =?utf-8?B?WWJxOHdEUm1XSnhtQXZOTmd1bnhpN2NPL1h4aGdYSTk2MWVzVnA0U29McUkw?=
 =?utf-8?B?Y1NFZ2lFYkc4ZFVyYnQveFBMdGxFTUhid25MeXBNRExuOUVuZ2thdzFRYVEr?=
 =?utf-8?B?SHJBYWxYMVk5SmpqUmtFaGo1WWlhR09nQ2RXME90ckNENXBqa3kxcXQrem1Y?=
 =?utf-8?B?ZjhSVnRyS3laT0pTenpwbThtVWZoRGIyZ3ZDS2ZPcWN2SkFFR3didXRMRHJW?=
 =?utf-8?B?YTRkcFZzbUl3c3ZYSzFSLzc3cnVlSzNxc1pVMENybithWit5OCtjTFlLZC93?=
 =?utf-8?B?MnRyU2gyZHNRSzlkSnI3WFNtTTFjQytxblQxZDJYaU93SXd3UVF2TXFSQVMv?=
 =?utf-8?B?K1BDOGYvZlFVNXpzaGRHQ2xFUkZia1FBT2JZdXpTVVA0c0xjR3B1Z2NKRDRU?=
 =?utf-8?B?MlhHekQ0eVAwempwVVoraDlWOHVlZjFTaE1La08yY0tCcEpTY2NrZzRjbk9J?=
 =?utf-8?B?TDhIUDR2cWcwemJlTDBsNVQwWG5PRGNhaHY0UnY1S3lKREJJcnJBdHY0RWY5?=
 =?utf-8?B?VCtxTnpLOFNHaXhBSHVrV0c4bkVqVHBXYVQ2Sm9jUUxqTmFLd2tmQ1VUS3VC?=
 =?utf-8?B?Q0FLaCt4c1RVKzZ0UWN2QVkwUGU0Njhib1BkNm9rVDNFNUVRVUd6THByRCtu?=
 =?utf-8?B?NUwyenlmQURXMDNuMElnZVczbkYzRzk4K3dmTFJXbFk0ZUd1Ulc5SnFNWjF1?=
 =?utf-8?B?SS8ydVdOZkNnTFoyT1JmNmZWWjh6bEIvWVpQOWlCT1FMN1ovRlJ1eWw2d2dW?=
 =?utf-8?B?WU9LNStPZnNXUzltT0JZS3NTUG1oTGpUNnk1aFRVS3pwKzlpUm5jUWhsOUYz?=
 =?utf-8?B?WUQ3dlBqM0lFait4RVZ4d0dlcnoxTmo4LzJWaWVSSGtnQnlLU0twQ2p2RkNh?=
 =?utf-8?B?bzhNVjFwcXl4dW5BYmpDTU5jaUpnalRpSUFCVnRsYVU5QUsrZ3ZMU25mbVlJ?=
 =?utf-8?B?Y2hYYmF6a0FTWHk4OXAvbWlmK3NIQmJ0aEFJV1NKTzcwSlltQ1QrMHZvYVVI?=
 =?utf-8?B?OUp1dmxFQ2h0NFBmMytjRU9FaEFQejFmL2d3bW41OW01MXRDdFp2dGJNS1dU?=
 =?utf-8?B?UEFHYXBkdWtEdElFbkxlYmw3YmxvaGRkeE1QRWhLMi9WeTJoZzFuWWRkQUtm?=
 =?utf-8?B?NHRTN0QwNEc5Y0lOL2FJanlvTWJ5NEsvbm90U0I5djY4eUJzRk1WSy9mdEFG?=
 =?utf-8?B?cWIyeWZmQWJ6YVowaHBRS2xMZ014OFl1YWdwN0E1dnhXNXNjRWgrZVBzNGRt?=
 =?utf-8?Q?LqyGHl4RJQ37vV/603umU9Si8KTHZc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am9heU1YOHJPeU4vLzhNWVZpckc0K1BFcHd6bVRCYVRyVWI1WmhXUXE2VUgz?=
 =?utf-8?B?clBzZFlpd2ZIbXZjT2k3L1JQZnVNeVN1QlgzTnVQamkzTTd4N1g5V2IwbzM2?=
 =?utf-8?B?UU5JazVtUVVMN3RCSUhjZ2wxVkN1Z1NNUkFtZ28xcmoyMWhSOFhPQVRudmhK?=
 =?utf-8?B?T3VXOERiZlVObW1IY1RnbHFWaFMvSW1hYWo1ZVh4ZXkzTCtvZlBKU0N6eXh1?=
 =?utf-8?B?bTNWeXBWSlZBYnprVVFTWnVjS2Y4SWpQV29zbEIzR2c5OEtNZVdmdkdYODd0?=
 =?utf-8?B?NXhubTlYb2ZJbHhtWkVKNDR5Sk9TbE1tK2g2Mk9IanVhN0JoRk1JTmhsbE5s?=
 =?utf-8?B?bEcydnduanBrMU9LdmIwMjNGOE9wdURoZVJyaUdqUjBEcU1TZ0RXdVc5c3Vp?=
 =?utf-8?B?WHJ1bStiWFlCN3dCMExrRWFCZFlGOVBucGtJVndYYUh0aG1qRFk3c0JnTWNO?=
 =?utf-8?B?d0JEc1l2ckdaOVpuMVErWGVib3E3RDlpamhmbi9DUmlxbitzcHV5UmZTOXdO?=
 =?utf-8?B?OVhURXBmUDRydytPemRMR3JXVEk3MVMrNzl4NVF0Nys0QjY0RnlLQSttYmFm?=
 =?utf-8?B?KzBZVi9iZ1JhUCtKUTJZK1lBY3lvaGdwSm1VRWgrU0dWaVBIK0NBTVNyeGZZ?=
 =?utf-8?B?cHIzUzdudFRFL2NYWDlsWkVrUFF1RFRoQU1oM0FZMTFLeEUyajVqdlVxYm53?=
 =?utf-8?B?VzBNdndIazVDT1VabE0wblk0aVFoSDVTMGtvdXVwUndjVHZWaEpldlNrcWcx?=
 =?utf-8?B?bzZ3MlgyZW53aWVlSy9GZE83d3F6anZSTGg2dmVGOU5KNi9VM2oxRkVNME5Y?=
 =?utf-8?B?SldXbXlWSURaall0QlhlYTZVV1pRRHBJSmx0MXJaTzMrZXliMGxrSmdlMG9l?=
 =?utf-8?B?YlQ2dnk5RzNEb3hWcGJ5RnBNbTFlcUVEcWx6NTl3bUFZSUFTemdqMXVJdm9B?=
 =?utf-8?B?eGozQVlNN1c4bGcyR1RZRC94Rlg0QmphaXJ6NjR5enNKbE00blBldVFrT0g4?=
 =?utf-8?B?NUFtMnpFakpEUCt2U2RPUkQrbG40TytQMERxU1BFWlQ0TEZMak5FcWh6MFNH?=
 =?utf-8?B?WFE0Sm4vU20wOXNRakh0aVVmT2dwbkRMeEtIY1hTazJVNXFPRWZQZzBtWVQw?=
 =?utf-8?B?UUQyNk5XemVibHFhaklKeDgvYk1Ld3pkS05yYWw3MGdFcW14MExQU0llRXVC?=
 =?utf-8?B?QmJzK3M1OTJBcjIxRkdESndXVGpOV3RiV1NJS2cxMytlRHlGV29CV0lUclN6?=
 =?utf-8?B?N0hnVmhTNWQrdnRBOVgzeE9JRmozeUVvZmtvajN4emd6dDFhL0FTRmZqUTlV?=
 =?utf-8?B?Mm0wdG5NdVkvL2FQTDJ0aGFxMTBrWVR5ckcwUXBtblF2Z1lZZDFkK3EvRWhl?=
 =?utf-8?B?U3pBTDFqSUlMNVpqWW12N2lnWS83TE45b0IweXBLOXZJTWF1eHNwREhmMERl?=
 =?utf-8?B?S0hIUFVJVFpaNzgxTTJ6TjFFUWhJZlI3TTk1MEEzeHhwa3gvSW9QcUdWVzNQ?=
 =?utf-8?B?ckUxVURMbHR6Sm5NSEMyK2d2VFNYWGQzVWttR2EwcnNUeEZaOUk2b05SVWxS?=
 =?utf-8?B?QitLSjA5VUw3Rlk5Zk9DTitHL0RTUHA3cURFQXN6WlFZNG81SGRZaGd3M2tm?=
 =?utf-8?B?VEpoWm5ncklTeDRsZGtoVEJSMFlVOHRPeE54ZnlZZll3bTVEaHB5RnozS0No?=
 =?utf-8?B?Yi8wM2w4Vmpsb3NaamJOdk5SdllQcFZSdHZxZUkzeStSa2Rpa2VzbUFxV0xx?=
 =?utf-8?B?dC90UlNJREw4dzgvU1ZKRlFmV1M3VE1IMmdRNnRjRXFydUI1ZkpQbkp2eXFt?=
 =?utf-8?B?VEFNMUdvSUFZclA1a0IwZURIaEx1dVFXOWRGVEU1Q0h6NUV0eVhvakZ1TC9w?=
 =?utf-8?B?N0E3ZXQxcGdFRXlPTlp1WFRQczZiTWYveFQzRTlUVTk2Q21DeEY1aWtYeGVu?=
 =?utf-8?B?dlROdGpoY2RNUGFUUVRITU1hT3hQeFdubzhWLzNkL1FnU2xtMlUxSkZZd3dy?=
 =?utf-8?B?YlNxQ3NMWVdBeDNxekpCeWxQWTRUdFNOaGdXVGUvN2RjWmFsdGJrV0ZZYUxm?=
 =?utf-8?B?WlFPRnFINEpUTjBLa0VNQmJOQk40NzF3N0dXb2d5RUpNWjFCRm8veVNySzJz?=
 =?utf-8?Q?310mkPLH1//wUdkII0m7rwTH4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0282e5-2a0d-4c9f-77cc-08ddb9e3a158
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:42:27.3331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbnEZLob4B8k9J+9TRi0D7HQzJoulSSouR572eULoRG/h0MvE9l42TCpLRAgQIXqSj7/paIZyBvcBKnh1DEAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11206

Add i.MX94 LVDS/DISPLAY CSR compatible string.

Add clock index for the two CSRs.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml        |  2 ++
 include/dt-bindings/clock/nxp,imx94-clock.h                 | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index d0291bfff23a27cb55683880fe3a1f8b3e2ada5a..27403b4c52d6219d31649d75539af93edae0f17d 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -13,6 +13,8 @@ properties:
   compatible:
     items:
       - enum:
+          - nxp,imx94-display-csr
+          - nxp,imx94-lvds-csr
           - nxp,imx95-camera-csr
           - nxp,imx95-display-csr
           - nxp,imx95-hsio-blk-ctl
diff --git a/include/dt-bindings/clock/nxp,imx94-clock.h b/include/dt-bindings/clock/nxp,imx94-clock.h
new file mode 100644
index 0000000000000000000000000000000000000000..b47f74f00f119ff1c1e6dad885b5b1e3b1f248a1
--- /dev/null
+++ b/include/dt-bindings/clock/nxp,imx94-clock.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_IMX94_H
+#define __DT_BINDINGS_CLOCK_IMX94_H
+
+#define IMX94_CLK_DISPMIX_CLK_SEL	0
+
+#define IMX94_CLK_DISPMIX_LVDS_CLK_GATE	0
+
+#endif /* __DT_BINDINGS_CLOCK_IMX94_H */

-- 
2.37.1

