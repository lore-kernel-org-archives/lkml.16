Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7C29A2
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738181171; cv=fail; b=q9O2B/qvUa3lCoyNNEC1zDzE5jnUT+9vBP8vq+beWEgoDLxo7SICGfxYP6JOEJPT2e/tBO6fj6J/kYvxehK4xC2QsYBxsozjjs7IZLgnnaWi/GLSXNvdED3kR/GjB1mL2dCjk2VMz143r/HNd5x+JjWsYJb8wWv5mIs5XLPTYts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738181171; c=relaxed/simple;
	bh=yReafC9YdUhEJkjmv1++ghMWRJCcjW4OipPuRgfMnTk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Pw6p8Kt6tWWl20Az3kA5fM89A6f+CMxHJQ5ntT20h1nO67tXb4WnomMTPqIV1fvibL6lTloTcLPgfXL6K+3gRm+jLzq7B9nQURagSXTcV9h530WwmPyTLTnmTOukb0vbGewccA2Smvtc4aIHbCzKZixecvnIzO+naGL57wtRHJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YKnUfz8U; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YKnUfz8U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIZ472GqFwyFHx/0InrhfhEO1L6gO9RrdlKGX7uJNqHdaGPF1EoPNwQG6rGFIYCZWTXR3eb8DJuVznAub5YpQK11fEeda5el7LILYGilShxMCzKCEjs0EZFaOY5FRwh5GR0h4PembcuVjRpeFeHkKeZ1DHz9FpnqfpKQNt3Kao/jC9Fi8fK+mtRP5kD0IoSV/SFYlIMeBvq4hOnMyfJPqunCqzMylL6vz2As/LSF/47GB6mmDRbAgTJ1hc8MqEZ028wUoznwwwsiAP+xTh87LWTkDv2/T/zzarFeNGgsF1mlMyHjWo0LcvVfVBJxcJOXXhSlsJHPgZdl2jpmFKeqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/6eDHuJ9m0Bv7xHBPjt6VoPLEeqtNDBre/rnDFA1Ks=;
 b=iw78uW+OlQDiJbDvqiEmhC3/aCVf5UPBOuP1WHwKHdUXxXFh1jRjpzFxME16Uqyc2ucfPt63BShXd3UB7eZye2vo/Yqn5+AUsarpsJutWrwTG5nbwcTJnFo2ydK//UeuPStG37oDR+17y1tICUkNw2yTQRRsriIHbfddh5oHJyb+Dn606VVe84sl6R3J89wCv8hiyWJriHbh0MZuoQdp8lJJnl1tQkVob8QwvKr7F0Lrh9CLEIEaL3X2gCTguADmZwrKtegsTp2tAcp9+xDpaUL/ibq94vrt4ffHvT5DmZN4YSiKJzAXs810dJxG9XD20w6UTnD0ZDifwAR6qKz/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/6eDHuJ9m0Bv7xHBPjt6VoPLEeqtNDBre/rnDFA1Ks=;
 b=YKnUfz8Ub2KCXRZh7cH2m3HtjsP3S1IFDTCx3GoYdgRTfcgRcQCfV9uyk96Jbd1NnNbaVeeKF7X4VkDai5V/u2Cm0kqa4Vu2pDUstUPrWMBq6ZEflVAdi2mz06/+YEtgUGQSPz1ym6ivkL+4CANkfXF72l4AD8i2N3MVkgyISYDa2nhlxUw+f0CquQQ9EOWmmvIkuF0/1307b6GLuWWyYX1an59nsPvcf7P+ejXxoTLjNEHixtq9Aso8H0u0ZCzLs2xdUFkURUXniJ8ddIybQXa7SDsT4kPiHqBeRjP4DWvEmArMHdkpcLVS73nIqaonriKb8xgODCq1Zzmv0OulNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8995.eurprd04.prod.outlook.com (2603:10a6:20b:42e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 20:06:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 20:06:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/2] i3c: Add basic HDR mode support
Date: Wed, 29 Jan 2025 15:05:51 -0500
Message-Id: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+KmmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyNL3Uzj5PiUlCLdJENTEwsLSwPD1CQLJaDqgqLUtMwKsEnRsbW1APD
 63odZAAAA
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738181163; l=1574;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=yReafC9YdUhEJkjmv1++ghMWRJCcjW4OipPuRgfMnTk=;
 b=pLf71peuWYlaKdNiM+mNC4WgECQ1KC41lq2gas4oZwowTMxtPUPSSJEBSzq/EPPfKohTJFFs2
 hwfc7+AZDdVCb5lpfwLrv8siCWW3XNUgHDrkXahEnd+oCp4B/W0T0/q
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2c0a5f-9f36-43a1-8822-08dd40a05cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SCtJS0cwdnpaMGw0WDFpSlVURWt5R01LVzFUVXZuanRmbDlMV0h6VVo1ay9W?=
 =?utf-8?B?d1NrTFE4OUdEekVSazlVTXhsTVg4MmFGT2Q4MW5LbitRdHNrNlpNQnRWVHNk?=
 =?utf-8?B?RmVoTkxJY09uNXNmdldncWxNcGp3UnlMT2NCc2VoWjVDbVVKMk96YWU3VXdq?=
 =?utf-8?B?MGV2YXZJMndDcUxXcEtoSzJlb0NDMHNtNVE1QVZQSG9wRG41SmRFTERmM1di?=
 =?utf-8?B?RWRxSUQ5MnVnOGdFVHY3czMzdGs3VjRBcE12cnFQTmsvWXVDcDZXU2pTYThO?=
 =?utf-8?B?NlViVytHQWtaM21namhCWUk3OGRwVE9zZ3dIQ1NoaW1TQmpOWk9rbDRtbTdS?=
 =?utf-8?B?aXYwM29iN2Vad2NVdjdQZW9OSEt4MVZJRXBhRzNObzAzc2hsSENzSlhleit3?=
 =?utf-8?B?cC9oQkRuUnpucmxiVFFST0ZkaWhwWExsaGpzWmt2eHMrK0k1SkF2QzRkMEEy?=
 =?utf-8?B?SGgvblIwd1JFS0YrTXpFWFFtQ0tMNHJoUUJid3o4MVd2bmZ1ME55bitJQ0tC?=
 =?utf-8?B?eExTelg2Vkw1aGQ5ZEQ1UWZjQjY5dEdoaWcxWUJUNmZNUm0zZFdwelBGU0pl?=
 =?utf-8?B?a1Z2dnBJdnpubHdLNE9XNmxEN3c2Nm9GbkoySHhvQUdVRytNTUphY0d0TlR5?=
 =?utf-8?B?ck9RSE9aVHZYVXZrM2JzKy9UUGhjd1pUYTB5YTRobU9EbjJVdEY1ZW4vTDZo?=
 =?utf-8?B?cDgwT2pndlc0SUhiY3QrVVRFanA5M3V3aC82Zitkc0dCMGZMdXJvSWV6QjZE?=
 =?utf-8?B?YmxMN1M3RjFIN01ONzdVSmZiOGwreXhwLzFWZDZ3TFFNRlJUSkpmNGllT1pR?=
 =?utf-8?B?QlVaQUVnYUJvNWNPVElzaDZ5K0Q4bWx2Nkc0bktHR1daNkdvcTZFelZML1BH?=
 =?utf-8?B?QzJWYlk1bU1adll6OS9UNWowbmZ4OWMvTGNZS1daMndJci9GRVBHekJ4KzlI?=
 =?utf-8?B?T1BaMERlN3M5dGFnTWhFWHVNWFZ6ZHllN2g4dytxQjVOM05UcUJwcEhRSUE1?=
 =?utf-8?B?UUxvcis1MlkxT1N2cGgyT2M2bzhQQlB2MTZtYmllNHZKbjgyRWlQNmloOFhl?=
 =?utf-8?B?aXo2ZExtbnpZMkQ1RGQvVmwxWjcxVkwzWEF5SkxpY0JoTk5ETklGZDVENmhL?=
 =?utf-8?B?NmNKYVpJTEN1R1BuRzZNdkpGRTV0VzIvL1l3SkJtejhOQThLTndmK0lXTFNU?=
 =?utf-8?B?ZUIxOGQyMXdoSVJUTm8ybGs5ZTVOWWRlek5hUitJSWJyWWF0R0t3WlhtUHZS?=
 =?utf-8?B?cHBzTXo3RFNqbWNZL3dXUEZoQTFKM3NJNy85Y09GaDlmTG9OcHZ1WVAza2hW?=
 =?utf-8?B?OVNQUytwaHc4czVKTWYrWnNHRTlqOWUrU2dsNVAxUFFzVEw2OG1wWVA0UkZL?=
 =?utf-8?B?T01RaGh0aEw1Q0VvL2JmYmlsSUxkL1NmNWhNSVhOTWZsbGlmVi9IQjFNZFBE?=
 =?utf-8?B?WmxjVkl2Y3ZySjJKejlUZWlaSEtSaFJ5TENYZXNoVExtU1lHQWIxTEdrY3pO?=
 =?utf-8?B?WXE4U3Q1UDRJR05ZTFVnOGxhMDhkUURwTnJnYVRONTJxcXlsamcyenQzNnRM?=
 =?utf-8?B?YkE3ci8vb1I0YTZzWTZxUGJkYXpNbnl6eHJvRUN5NG1Ld0ZZRVRKRnlMckhB?=
 =?utf-8?B?b293VzJkWXBOdERqVWRYSllDZm00WiswMm1kSlY0Q0JlZ25wL0JoN2ZVUllF?=
 =?utf-8?B?clFPeVFNWE9qWWQ2OUREMVZlb0ozOXM2Q0FQZDdESlpYQitrZWZ2RDZubTR1?=
 =?utf-8?B?WmkwejBQNlV5Y0NUcVJ5V3VnVEtKczJiVVNSTUFGZ1J6Z1c3U0ZvaUp6cFhD?=
 =?utf-8?B?ZGc1OUJPTStCU01ISnNHUnNIbSs2dzdxanEveERScXBzSUxFZVNhRVdVbWpI?=
 =?utf-8?B?UjN6aEprcC9JVkN3SFN4akZQU2FSS0lUOFFrckZuY0paWGVqNkt6cWlHbml1?=
 =?utf-8?Q?ui3O1FYxm2Ol6NO3ChuYCRyp3Ebx8onm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEJENS85Rk90Z2NONE9tZmhaWVpvMGJYa1JsUFN4WWNhdEtacVhGVlNTa3N2?=
 =?utf-8?B?SGZzRGdMeTBnOFZoVnZlZktmTWVVUGI2RlVpTGVPT0UwQzB3NUE4Nm0ra2pi?=
 =?utf-8?B?TkRrakNVa1RIVWFZdU1Dc21WSDVNby9OWFU4SHQ1Y2NWYlh5NjVVZTdCMXJI?=
 =?utf-8?B?L3JrOFJGM2tab3IyZFdnWklNeVBONjAvdnRVSkdSM3pmRmJrWFZNYVpJSE83?=
 =?utf-8?B?cHVvOFdISkcwTGxjUWZJblBkVU5VQlR1L2JiUFBFOWNaKy84UUk3TXp5SkdT?=
 =?utf-8?B?YW5IVk9oNDJYSk5vSCswUk4ySjBVaWsyYmRQUW9oMUJ1bnZjUm4yNzNYd2lv?=
 =?utf-8?B?aXR3YlRwelhXQmdWSjhKMHlQK3JrUEFwejJJZ2NVekIrOUEyU1NhYWxnV3hN?=
 =?utf-8?B?TlB0NkZ6RlR3Njk1NUJ2Mmd2K2s0TTUrK0RadmlYM1gydGJBM3NhaXdJc0h4?=
 =?utf-8?B?Y01sLzh1SFp1cWRIaThkZjVWTkZ6VTBHK2JoVlMyd1E4ZzgvaWZ3aDNHV3FJ?=
 =?utf-8?B?NEVQQThuOWZSSSs4T0VkQkk4b3hKY1JhWkJLUXo0SXJCaWdEeXBEc2djZzVm?=
 =?utf-8?B?U3NEenNYdnd6SHBnWVl0VkVuWGs4UHdOYXdwNm5QOFBocXF2NDEyQlZzSHIw?=
 =?utf-8?B?NFgwbVlPNVdUSzZDcW9ndnNXM2JZRVpBaVBLWDRlbU5wS2ZUcFNOdHRGME5p?=
 =?utf-8?B?Sm1JcEhUbmNqSnJxSG04TzlzK2laY3ZnbVpzcFgvSzBtMUcvdHBvMHFsOTFL?=
 =?utf-8?B?V01pVzUvUGF0L1RZam93dkM5em9qWStRTHdTSTlSWGpoaUFrSjVtVEh2Qkxs?=
 =?utf-8?B?MXJHanI1ZWFqMlFQV0VYcjZlbFh4MUxSeGMxQzl5TVhhWlZLREc4ZmpZS0g5?=
 =?utf-8?B?eGdGRVZVSGx2VkxoczRBTWxpQm0rdm1sNHZ0b2ZraE1wYytrMjI5U0w0dzZS?=
 =?utf-8?B?cVpYQzVJU0lJNFp0YmhhTncxa0craHdXTEZtUTBWTHRiczFZajlaU21UamI5?=
 =?utf-8?B?enQ5dlNZNDNXZGl3OU1GN2ZmV2VDOGRBekE4bzhPR3NwUXhHRzI3dkwwNEpq?=
 =?utf-8?B?dzBBMVpKTFMxaDlMeGlnbTVuNUl1MDFPNmh0L3JreTk1UHNHakhudGhaUTVv?=
 =?utf-8?B?WHlsTlFQMDJ0MVZTaDErVkhhSmIvNG5QMmdBYy81d2ZmNHpZSDhWcVUwS25o?=
 =?utf-8?B?RW1QQ3ZCSE9zMFRzR3RzWm5kMHBsbStIQWdwR0gxYVZWNTNsOUFCakRBb0ts?=
 =?utf-8?B?OW85aVJzQnJCUlZhVjcrSDV4RjdxelA2YkpncVFzYVE2UEhzbjlvR1NrdmZ6?=
 =?utf-8?B?UFBjZjFpdWpBQXZaNXZ4TmxHSlBwaEY4MXdYVWd3WHhqVmxrZjdmOWRGMnR3?=
 =?utf-8?B?ZENkUllKL0VWYW5hMzF4aU9sUk5Ub0tJNmI4aHNmMW54TkZSdHZTcmp1eWMv?=
 =?utf-8?B?TDd1Y3VWbjVzTGMrQVc2eERkdEwwZFZTQTdac0hKTS85WkJwNFkwbCtUUWFN?=
 =?utf-8?B?dWFFS3B6eXd4REpIeElZeVB0Rjg5Y2tRY0UwaVFoSXM3d0wxZzRkQ3A0QnVq?=
 =?utf-8?B?SldrWFo2U2pSWWRwdHdYZnVxUDlJTnVlbkZYZlhEMER3RzNDQW9FY2IzN3hK?=
 =?utf-8?B?SXlzaDJHMG42UXRoWXVQYUNpNHN4ekQyLzZoMmtFWXdjdDV0a0pZdEJoWXc5?=
 =?utf-8?B?WTIydGgyVnIzYkxPeDErNkhLK0FIVVdCT0dVdjFhQkZzTEpMb2R5eGh0YWVE?=
 =?utf-8?B?OExDNXpjZ2VLWTdZcHBiWXZmZnRFYWhEQW5YaFUyeFR0Ym9hemlrUkRDcTZW?=
 =?utf-8?B?VWgrQm9LbStqREYrRVNjaXl3cWV0alZLVERkU20xWHNpNTlabXpjM1hqWEdB?=
 =?utf-8?B?a05VTXNYZytVakVwQnFsNnpzRmo4NXpPWTFRRFpacldrOE5vaUduWTBxQURj?=
 =?utf-8?B?R3FheGhUd1AweHk1YWhac0pYWmFkWlpHbENTcVlsV3VLK0NuRTVFK1NTUWRa?=
 =?utf-8?B?L0FWUFRMZ3MrWlY1Zk5aOWdkZTI4UHcrK3llckR0VUhyNk9yNkZjZ0hvYnNR?=
 =?utf-8?B?WGI3TzJxMldXMXY5T1dTVmV6Sm9MU0UvdW1CWFVSYWtnTUxzaDZlNXpFbEl5?=
 =?utf-8?Q?8MEhkhL+B7jQw42Wpbjir1eex?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2c0a5f-9f36-43a1-8822-08dd40a05cd0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:06:05.3784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5wmHgUoRS4VnWPxu23f2Yu+ETYO45qITh/e4RsOM9qaDWeoT1gEh4292s9m+cenBc8zV4CR4UtoPnoy8qrEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8995

Add basic HDR mode support, only support private transfer, not support
CCC command.

Update i3c framework API to allow pass down mode and extend driver callback
function.

Implement HDR transfer in svc i3c master driver.

Simplifed HDR flow is (ref i3c spec line 5514) Figure 129

<--              SDR            ---> | <--- HDR
START 0x7E RnW(0) ACK CCC(ENTHDR0) T   HDR-CMD(00-7f write, 80--ff read)

                                    ----> |
HDR-DATA HDR-CRC HDR-RESTART .... HDR-EXIT

Note: HDR-CMD is 16bit data, which included 7bit slave address and 8bit
read/write command.

svc hardware can auto issue SDR part.

To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      i3c: Add basic HDR support
      i3c: master: svc: Add basic HDR mode support

 drivers/i3c/device.c                | 19 ++++++----
 drivers/i3c/internals.h             |  2 +-
 drivers/i3c/master.c                |  8 ++++-
 drivers/i3c/master/svc-i3c-master.c | 69 +++++++++++++++++++++++++++----------
 include/linux/i3c/device.h          | 12 ++++++-
 include/linux/i3c/master.h          |  3 ++
 6 files changed, 86 insertions(+), 27 deletions(-)
---
base-commit: 66408a65f3db566c45fd7658fa7bc0b17aaa4807
change-id: 20250129-i3c_ddr-b15488901eb8

Best regards,
---
Frank Li <Frank.Li@nxp.com>

