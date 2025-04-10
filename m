Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2081.outbound.protection.outlook.com [40.107.247.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03AA16FF44;
	Thu, 10 Apr 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296515; cv=fail; b=DOfEaB4+weoJw3j7m5ozyJV78pf3MxeaQ/e1aTMExlfGTYGyR97QLS6j3ysmQoXv2+2vmEEYSXg0n4oEVF0In8HJqjWzrtEKkfL/6B0ayNQEr3abNxoR0TQQr4vn7GHu6nhzpB1fyUgCnkzY/WUXfmQ/myotQRw0DaemiXDzvPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296515; c=relaxed/simple;
	bh=udMeYOm55ruNi+lFf1etW5KZsDWvKKA0d8ZFTUtb18w=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QNjcKyDs44DGwkigr7PMcylSLNaGUxKEtgRWjix7W+K6nBLrcKcqdKk/m7K6xLjzPmYpk8jvazeY3y9N8UlH0RDijVcVW6vf5Kci6hCawlVzwRFURkLH1tsXV1OOYxNq695Ldd5M1DH/ldPSNIS2xLbrGXCeFrbTM2rmM+F7ouQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q+MvKuxr; arc=fail smtp.client-ip=40.107.247.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q+MvKuxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbECYxTVfoS8aJ4IG+PR7XdfrgOrKcEG4eE/70OLJd8Xdn7zEdSJqnI31h3hLH7f3DI2+4FHvT1X4+HVpnzKvWT82wTQ5Cx6xIoGQkG69a/4kBNTMUwWM54f/SDEcTs0kGRBJ+pMifdLUBAzUIxJZ1HSEF/1GSjG27mbBYFtFVLi2LKxuFZwvOydID/iST+Lf2yLiyDpMtNmTMGNDpjuAxzfVeVBL0LEFFccOXZkUrUYzGTc0GSje+wMwaehdv3a1vJqeV2YJEjXYuWBw7bfotFjVr3qqCj0L/uVB+DcfsUnQDxQpDZGML/F0yvQd4TIr/fOmdbkLM7e9LjJCzD3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ+oejZHYnyYgYA6ImD2glFdrLWjEoyftMrElpWIJ5w=;
 b=jR81MGZmzAWHkl/m0oEpWtCTaTVwz/sxcLs25Cku07fNcDPAMo/1+adorM+hvcMmoMPcor1R/HsoZTDUpjyX6/tcl6B9VIijS95js4H4S3k/T82nrNlHEmcLSe2q9WIK4fGZi2fgrRdpdvpMxpnw9HH4uN7JSZNV4P/uI61fkqfazqDXfBBIWVS9H9P1fDiYyihjbcg5X7uq2GezTk6cjQtNaivd43dAhLtTwHqNEjN3FwzH3WNRvK2Pq5viIM84jDNBhVRexewV7oLwh8MurGhqWuYW/HAVROodgIC/eLl0bfgbEHOTBgcOKYAZ8QY9SBBV69lNR7Z9YZTa/FNp9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ+oejZHYnyYgYA6ImD2glFdrLWjEoyftMrElpWIJ5w=;
 b=q+MvKuxrgsoi2OhMRBqPMJn8fPaxvnTNoLqgwd15kQrzMBFYLVVRfhvdNqgKeA9pQFOKcg1ATuirDdgV7CtebDFhiS+jLXcnHmQ9j15HGr4cB91JJiUDogxXBCH19sEQB2TqJiqCpQrVU2p7suSLLQBRhrpvUbYRkzdQ4/goa9Qt/ZPPZ5lPt9q16Z/ACEYy6mjPyPEsh8Ked6rd7Uq14eyqn7mesjoichdmxlUdtYwFYyfTJVCldpouojc6/kodIn5Wt8obkU9eEW3E/QiPPje0w1t4tXKXiyrD/NquChsUWEk49bJ6bCSQdL52yWjndqi9YDDhFWQWPgGTlKICJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB10752.eurprd04.prod.outlook.com (2603:10a6:150:203::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 14:48:30 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 14:48:30 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] arm64: dts: s32gxxxa-rdb: Add PCA85073A RTC module over I2C0
Date: Thu, 10 Apr 2025 17:48:26 +0300
Message-ID: <20250410144826.73651-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0007.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB10752:EE_
X-MS-Office365-Filtering-Correlation-Id: b4718c1e-144a-48ad-6e0a-08dd783ec23f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjZmRHlYeTkvRGZMdDJsUzVHVVFqVXVVZU9EeURhN29DSnJLUDMrOVRFM3By?=
 =?utf-8?B?ZTgyOVgvRlpQSjhDMG1LUnVqSW4yZFhhc2dqQ3VqS2xibFUrSHVvL3kxR0Jh?=
 =?utf-8?B?RzdIYkFXM2JLWktIRmZYbW85QVVuc2tVcWplbFJGbVdMaisvZEhIei9YYWN5?=
 =?utf-8?B?YW5jOFlZMFZNdElpVWVCeXltOG1EMFRPaTRML1hoQ0t2TFJ6ZnNSeUYzdGcv?=
 =?utf-8?B?SHhtSWFUZXJ6NEZncXQyZU43YTFQOUNGYm1vcXhiZkh2S2VkcnI2UVh0N1FB?=
 =?utf-8?B?NnJ0ZTQ4QVVqNHdaU3Q5K1VTUmlUM3dXYm5qUjQzbEN6cU9TQzlzUzFiMXox?=
 =?utf-8?B?Nmk4Q0RPV3oyVVQ5MEIvcVowVzFkRFVjS1Y2dzh6ZDl1eERwNFVmM3doZ1hW?=
 =?utf-8?B?SDRxNG9PR3dKZEloZy9GNUdud0RWUzhtSHVuMjA4OXlydEEreUs1Z2RrN01u?=
 =?utf-8?B?bk45SnZhK1VEWktRUzdHaDc3VndpOWFOQzQ3SldOZXVhZWtNaDRyQXprVndM?=
 =?utf-8?B?L3J3eVNLQ3JxQjhZZUhvYW9GdEhvZWFxM2o1L0JlcGdIMmtuQ01FRjhIRnM0?=
 =?utf-8?B?dm9zMnIySjVuSmNhc09WaDhBaC9pYkFlVFdSbklVVllad1pWdnZDTSttc1BQ?=
 =?utf-8?B?NWFFRTZGYTEvZHQ4ajVtOFl3akQxdzY4NVRIK2pwNXRobXlrdzc3MGY4TVVB?=
 =?utf-8?B?emswa2ZDQWFMZDdGTHc0aEFjNzF4bWVoR3NHeExBVkFybWZ4MTl1QmVmN1lP?=
 =?utf-8?B?ODRFVTlVM2tUalAxOWs2WTM3dE0ySnNiUEJjMWw5VVZsVlFGWGFzeU41RUlw?=
 =?utf-8?B?U1h5VmZtd3dSWG1jdjNuVUk0V1c2OE41a1dObFEzcmpxY2d2bmpicEc5TitN?=
 =?utf-8?B?ZWp6V3kvbXN2Y0Vzcm10R3NZaG1mbjl2czlJQk44eUxpWG5KclNURTZyRm9W?=
 =?utf-8?B?TjFKbWEwSDhIMHdGOVh4b3dQWEFGbTB6NU9xSXFaOTdqT0ZTTkJtcWZzNkVv?=
 =?utf-8?B?N3VsR2dYenp0SWkyL1d1Q0JyMDZsZ1B1N0l3Ny9hMEMrK2JDenAxb0tXVjEr?=
 =?utf-8?B?UEJYMXIzSFhpS2JwY2M0elpwa2o2eXRiMXR5cFhTcGI3c2tjYnE5anhUa3dK?=
 =?utf-8?B?eHF0YVB3N1NPdEJMM2FVaXpJeG5TejZlV3BxODhoTG1KNlFiTm9ZbTBUVjJr?=
 =?utf-8?B?UkhmbFc1aVpDL3FaRjEzcnZPckl2ZHpMQW1NNEpwQWhJdEdWTitmbGVKeVh0?=
 =?utf-8?B?SVlIL0hJWFBwNTVWTVNSbVdIN2lPYlJKb2w3d1hpaFA5bnF2dHhiWUY5V3Bi?=
 =?utf-8?B?ZUd6bGwyUUJTSTlXczNZSncwY3pqS3YzVFRRS0d1SGgxb3paVm14NGJmMm5y?=
 =?utf-8?B?UE9SaDhPYTlwYmw2cjRnSGxRWHY3dzhiellXU0syQ3VhaGlsL1RBQzFJaUN6?=
 =?utf-8?B?clVHcXptempUaE9pM0tINDFCeXlkSjI0T1NqQ0lGVWZLZW5zUEY5a3IzaG1F?=
 =?utf-8?B?M1UwYmc4L3Yycm5GLzB6Y05tS2d3ckxidE5mTGQ0K3dTQlkzYlJlZHhmNDBu?=
 =?utf-8?B?bEtoUGRDakRCbGtabDdxWlZWRU10cTJuc2oxdUIvUmZCaG8wMi9QUkJ0bXRx?=
 =?utf-8?B?K2FFZkxJaGJkSHQ3dlNIZnR1Tk1YK2IzUlNhRU1XT1E3aFN2N1ZXTXdaajZ1?=
 =?utf-8?B?NzR1NmlTaUJ4THRWYnFuaW81cmRkRnIwMjFUNU9lZE5uNDBqQUVyQmlKZmxR?=
 =?utf-8?B?SWxkOVBvc1ZXVlhobEhnZWJHQlhJUVo5V2FKcGZpemFObjhQOU9XSjZqK0JL?=
 =?utf-8?B?UlJISzNRTXNnWlN2QTFvZnAvN2lTUWZVaDZ1ellCTzViZnJZZEpiVTFLNmkr?=
 =?utf-8?Q?/yySrSEArP/qB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enA2T1pwZno1cCtVVDRkWUwvaFFjYWJUekJNTG5kWGkzRGFEQmZJR2xscnFP?=
 =?utf-8?B?LzVxdCttSXFZck9HbFZzSytmV1VRNFozcUpOWVREY3RXZlhVVVlCbXBOTktD?=
 =?utf-8?B?WTJ4MUhWM2k3Nkl1QTlNM2t0SEdsRU83NUJNeHIzZHRqL0ltSzJ3SEZ2emtQ?=
 =?utf-8?B?VnRHMVg4NW5OWHVpQ0U4cXhQWHNpNGcwWklqMDk1RHdDTUQ1QTBKdEtGbW5t?=
 =?utf-8?B?N1J1QmgyTW1rcS84emJlWFo5MFllN2QwTms4cUhtSi9wNlZCM2RPN0FOb1Vl?=
 =?utf-8?B?NmlUMkxzM3hLR05na1hUb3hob1VNbCtjRW5iZ0pTNkxQYkRkUUdyMWxiRGxs?=
 =?utf-8?B?UVVPaXIxNk56RVVCY1hjU2xSQUh5VC9NckVvUk1rWDVLNU56dndRKzdOOXMx?=
 =?utf-8?B?L3lmU1d0elBpRm1OVTJJMHF5RWRya0RjcWJOYnpIQ1haNytGTEtUVi9HL09T?=
 =?utf-8?B?cXRBOG1iRHpiNE40QTYyb25GRmc4NGpxUFlsTnZuMSt4VG5Qa0x2MWcybXpF?=
 =?utf-8?B?NEQreGczeEdubllTUDBSRW96VTVmeHhsNzcyclZsb2paRUhEQW1HQVBwQ3JZ?=
 =?utf-8?B?TThLWndFbnY2bmFTY2NiamZZNi91dUQ5M1Uva0dIWmVKWHBLUVM1ZisyRWVh?=
 =?utf-8?B?UGdJL3RmSTUxaFJwUWFjWmxSWGRIZFN2aUlRSE02OHFDOXpuZ0gwcWtTRDds?=
 =?utf-8?B?MjcxSGdxQ1FJWFFjNm5kNTVNYzYwa29PcDNsL2xnV05LaEozaDdyTXJDRGYz?=
 =?utf-8?B?cFVlUEJHbkF0c3lSWEFZRGppNmRnNlR5OUdWVGNpcUR2Y1N1MktjRE42ZUtF?=
 =?utf-8?B?ZUQyZXNOL1JTM3JLTVBVZ0dSTlpKUGQzTjJmcHczOExWZ1lVQjNRZm1sWTBi?=
 =?utf-8?B?R1JKcWxkSldvdExOejcvWkM0STFXdHhUWkJKZjNicTYzc3NUekhxZzRCMUpG?=
 =?utf-8?B?N3kyTGdUczF5SFd4VCs4WkJnd1dUWkYrcE5JQ0o0ZkVYMW9ZclM0QmplOHFl?=
 =?utf-8?B?c2M0U3RMV2p0NDI1Y0NsWVRORWhzMUtzTkQ5V1ZFWHgzSUJDY2xDeEFSL3Q5?=
 =?utf-8?B?RnZWYldTTFRCNmNQNDN0VVZvUVZsNzVINWgwUEF4WWhncndhRkVTNTNMSGsz?=
 =?utf-8?B?dFl6RG4yc1FCb3BPeCtXeTZ0WUV5SG9sSnRYdk14TkJLVHJFM1lNT1Z2OVRV?=
 =?utf-8?B?RUNtdU5BUUpOMHRJL0dlK1lvNFplRWNjK1NKd1JoQi9Oc0R1b0dPS3dkTW1k?=
 =?utf-8?B?WXhNb3FRYmdnVVBTUS93NlRDWVphRGV0ZnZKWWxkcnlmUU9LelFVTFE1UVA0?=
 =?utf-8?B?RmZRRkRsM3YvUHRRdkZFZnlFTmJYRFgxREN4THcreFlZR3JPQVVadEJ5OTJR?=
 =?utf-8?B?YVpKa083Q0UvUGVmSkZoRU83bG42R0RqVUpHOHp3OWxQVHJ2TjFINFlwa0Uv?=
 =?utf-8?B?RUlSUjYvTFh4MjByWXlTVmVFVVlpSGJtYTFhSStBRVNQSmVrRE9lV2FhaVNv?=
 =?utf-8?B?V3V4Sy9xM2lVM1pWUzVrZ0paT3pxb3h6N2l2S0VKb0ROZm1KNm42a0V2czdC?=
 =?utf-8?B?eGRWbExvVzI0SHQxYmhNM0llQTduWkdSUjNvb2dkSE1QaDM5eUZuc2RIaGho?=
 =?utf-8?B?bnJUNWhDaXhwUWQ3YmJwZTB0dFYzUzgzWitMWkFKZFlGa1RFVUxPRlBkZVd0?=
 =?utf-8?B?cVduU204aUVGMC8xMGtCV2ZaamRYTm9vT0F5VHZVNFljMGoyZjlrTkwvOGJQ?=
 =?utf-8?B?cDNLaFpuTEhseW9aQUpMY2Y5bUx3cnJKdnBXSWRnTXA0N05PSVhhby85MUlJ?=
 =?utf-8?B?WjdLUGJ1S0NwSGFsUU5XekE3TzhOOWpCbGY5L0tOU1VKR3dqdjM4NU82RGN4?=
 =?utf-8?B?S2ExeTV6YkVURDhmam80UUQrYWdRcXBLM1NSVGFOdHNaT2pScXd1WjZ6RVBq?=
 =?utf-8?B?YUdCNVFxWlBvM3VlTER1OW84U1FUQ1NtQkV5SEFzNGhhRFYxbGl4UkIreFVy?=
 =?utf-8?B?QXpGaFB0cGh1UW9CSFJKa0RVazBFN2lMYjRtZ0hpS0Fia3U2UXNEc1RWZGl5?=
 =?utf-8?B?YUdDWUljK1kzZGhZb0ZaWllFQkdQc1lxVmVVcW1FSjVCeUtlcDJmVWt4NVp0?=
 =?utf-8?B?Zlp5ODBPUnZ6b0JEK2VUMTUzeFkrYU8xcE5uSWZKeUR2QkFEZHJCTGJLQ3NJ?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4718c1e-144a-48ad-6e0a-08dd783ec23f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:48:30.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeFkPVv0J4X1i/MERhJLycc4Oy9RdwSKK9Nx4U5JxVePZfMaGttQ/gM7syEmDryCu41dm5O2i5M4H7dVLXMdhepmahhLtbDAaHk1szupgDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10752

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add support for the PCA85073A RTC module connected via I2C0 on
S32G274A-RDB2 and S32G399A-RDB3 boards.

Note that the PCA85073A RTC module is not battery backed.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
index ba53ec622f0b..4587e1cb8835 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -153,6 +153,11 @@ pcal6524: gpio-expander@22 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	pca85073a: rtc@51 {
+		compatible = "nxp,pca85073a";
+		reg = <0x51>;
+	};
 };
 
 &i2c2 {
-- 
2.45.2

