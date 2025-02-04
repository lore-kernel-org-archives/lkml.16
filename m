Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE5D25A620;
	Tue,  4 Feb 2025 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672930; cv=fail; b=j4KjTXTnmLkMl3CYitnhWuBkp7taH6cRma0kP8tuDboORq1eKWm8ewxdJjsxAXrIHlg07NeBaTXfEldY4ElBgLEbEcRHTHTm0vCGM4AyVhM12sPGtFsINOldM3TYlaS+rXVcp7LsWq/MNvrCec5rjX6tIk/E3jHSg/pcxXwB96o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672930; c=relaxed/simple;
	bh=Ax6jTEbPCafY16QEDZLpMLVoDMNlFXlEMEbiiMhk1BY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Y62Jz8RlUUVXYQY+4HJZShxM/zEAz1A6D0F7kXMLpQ7jIYTVbkzF8QQdqS1jbuXykvG10pRgVyCv7ADX3oMxspjUFak6yakKymhYt3bvCllBg/nPon2faMqqm1BQ8rIkhhRagKX+/LVuwb0wfz6ghpTZwDOY6jnH0Sb5d+4tcv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qn0ryNzM; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qn0ryNzM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFLJxS4cOvSIy6F8cV8OD/lKc5zd81qnqXnoyxtHrqVyY2JdVJR9tNbRSQQ5TSWRLcErj6E1EX4u2moUZFRFlFskAtIqbKGlWqiuObdy/2CuSUXTMfpR/QAv25NxbtChhEcRkb6i8x3IVtO4XRA/PMmLD7AxH5naDpuSoh7zpGq4SrD1f1Ge7OJ/1FkHdzk6OY3JZ6PFgCKjet1ZMLUKPIY8L+GJIC6dUNAZ+wSm9YNgbMku+p9cxyv9/VsVSKSB+cjKjwkbI88cfL0cz35HE9S1+XoTpgzqW+QdXjumrYf7e0lcVeSFhcZGXeoh8G7vAnIx3ooH9kmO9FJzRNEEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPO3wyv1Pz6JTafLnJs4T6qUQPNuKvXCMXP9H96uSKo=;
 b=JxEw9Oy0TCGmqwd1+SnZ6dYY4TCOwzRmFBwhAliCutL/DI5oujP/gFTWc4C2dI4LnVOjqJGF3krlilFWSXCnbsO4Iwmi9FmK19S53CeJBZytmFiOD6ZbGCB1/6FayCRg9hk9rARFWvJRqg7MT/KSaldY/N8T/bSxFw0/HuVOpqd4LToLl3wG1uv4O1Lu0MCifLWmCYHMPyBUhUF7ovFZCBEPFYYgkfGF8CdjzCrlm8H2RG830uck10H246PkJnxVobLz3ZPFcyYzNonSOUi8kU0/h5E1NAK6uAqFGrtVo1jJrAuUuA8pBYgxsRPSFyh6Gy5uAaxLiQDa/akwgjWOdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPO3wyv1Pz6JTafLnJs4T6qUQPNuKvXCMXP9H96uSKo=;
 b=qn0ryNzMdNhNHeRI7dUMRdf8gp/KLYjA02tDthVq0jvYiOT6WZkoR2ZSYOFZMMeLynI4hw1vSpKs2EQhoKh+XGu2Xt6b6kyKMco/MUc+FYIZO4LVE4vCWlQDEoKnxj6PPqpFzkS/PTqSQqxpmsBtSjQxxpPlLJ+44d/RfS1H+baSenOo0kltmrb9JCuksl2IcB0FEA2coYGhsiKej0d4/yZBYBPQN4MVmz38vb2xgkZg7EOla7ZR+bWVBP7LHK9PwmQrUEhuLp4l2rpFVCiqG/giJCUotCnGY+CiOC2Mc/W43fJi5yOsznpM61IoeHDVx0llsPbpd+KNY4LidIoQWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10889.eurprd04.prod.outlook.com (2603:10a6:102:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 12:42:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 12:42:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v8 0/2] Make i.MX9 OCOTP work as accessing controller
Date: Tue, 04 Feb 2025 20:41:12 +0800
Message-Id: <20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOgKomcC/23PTWrDMBAF4KsErasyM/p1Vr1H6UKSpUaLxMYOx
 iX47p0ESuTQjeCJ+R4zNzHnqeZZHA83MeWlznW4cPBvB5FO4fKdZe05CwLSSEiynlc5pOE6yhR
 zUaBRQzGC58cpl7o+uj6/OJ/qfB2mn0f1gvff/1oWlCCx8zFCKN4G+Lis43sazuLesVDrXOuIn
 Soh2BRL0Rj3TrWua51iF4mUQ+g8ONw73ThSrdPsigGdUBNY/bKn+XMGEHzrDLtg+w4y+hxzt3e
 2cYSts+yc7UPULFX/cp97On5a59gZSxQDWm2wf7pt234Byw7U+fABAAA=
X-Change-ID: 20241212-imx-ocotp-cbef304140f5
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738672884; l=3571;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Ax6jTEbPCafY16QEDZLpMLVoDMNlFXlEMEbiiMhk1BY=;
 b=L+vW+Tn/+nJZ9KkS5ZLdP9ve+n7cE+g8gVdNJVp+AfllZBN5QiL5ummiVtNcVA/NS8N+Yckds
 Zc2fvBYNStADMA12Gslitc+sceq42+6V+4UvIfwKcPemE4/fbFSi5Lm
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10889:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c679fa-497d-4d08-1348-08dd4519534c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NitjV0dDNldCL1FkOElna0JwYlBhTmlLb1NGNkVaMGp0TUVUYXl2bDEySnFK?=
 =?utf-8?B?aFZ4NmlpOWdqMEJJSHcxN0hCNzZvajh1aG9BT2JsbFUvT1lhNHJmNVJuN0NT?=
 =?utf-8?B?cVdvU205QjZQaytZNU1vSHhUNis5T3ZLVTBFajJ2Tlpsdlc2bFl3Q0NFS0Rq?=
 =?utf-8?B?UlJuRE9HNlIrWS9xR1J2VllNUG5jTTNHNHl6VjNFcEFPclBOZmNFOHlIMXEv?=
 =?utf-8?B?bkJVd1BBQWQ1UjcycGVSUjdUd1RXai9mRXFOVWVwOXM0TDhuTlZkTGdkZUw5?=
 =?utf-8?B?cEM3T3RmRmJWRm9kNzQyYVYvbW9PeklMdXltaGlPc3d5NE9la2ZoZFRqU3RK?=
 =?utf-8?B?SThaMW85Tkx6MkRWcXA5MGt3eHBwYU52SVY0ek9aVUt3aUJEN1k0VFVUNSsx?=
 =?utf-8?B?Q1locmhtUlYvdENYeWJwTkFqZXdYOXYvcTFNU0Y5U2lPRkhtSmFrZXRpSVQ4?=
 =?utf-8?B?Zk1TVzZwbDF2RW1ETVJ3SUNwNmRsV28rOE5yZC9CTCswK1RtZVVhRHNiTUpw?=
 =?utf-8?B?cmFnSDV3L2VIKy9jVzl5M2wvTzEzTEtCWTlxcXdGQm1kaEovN1JmL2taOXo3?=
 =?utf-8?B?cU5vaTVTeGFoa29GR3ZzNzNZRnc0ZXNPdUQvOVRvenNYSTkySGw0RjNTc3JS?=
 =?utf-8?B?S0I2THRoV2krUG1qQjROL0JMckVHamM3aXpOUzBKSU9iVVVYR3JpcFRUdXMx?=
 =?utf-8?B?ZjZtOWJ1TEQ4UGxVNjVScmRHVjJ0NFJ6clpHMmh5TE5GekZqWUFzQ0djUWdn?=
 =?utf-8?B?N1o1TFFDLzFxV3ZHT282S293Sis1S292L2hYNFpwcVVaQUxjV3pjbWJMd3h4?=
 =?utf-8?B?ZDVXbGxJNzZyaytNU0tkbUxUb1BnVXB1ZUV5bEhBTTdBR0hVMnQ3S2JzalF0?=
 =?utf-8?B?cFdocEo3NFh5NmoxVVJ1TzZUYmd0QTUwMSszSlhSV0tKL2orRnQzM0VUMmox?=
 =?utf-8?B?NUNZZXBGUXU5MkxqVFVqN3Y3VFhiWER1K2JCWXJRL2ZVMkpTZUNOVzd0ZmhZ?=
 =?utf-8?B?TVNBdHN0N0dWUFNjZmo3b0duRDNRY1djMG1ZZTRVVEwxS1Z0d0wyY1B0cGNN?=
 =?utf-8?B?Y2lFZVQ4aEpOQ3BQNy9nVlcrODNVemhrQ3YrZy9RZDNQSG53Vzl1OWZFUEpW?=
 =?utf-8?B?K2l2RG11QTRJdUs3QUEwaFlROXkyVUZMNjE0MDFNKzhMK1lXN1FoYVVCWld2?=
 =?utf-8?B?RFVzSSswTlk0ekRwemRLd09MeWxjZWhDUjlRMkREY2k0YlZybmdPbXNyVmtN?=
 =?utf-8?B?c3lmZkcyRDZ1OFpURndpV0hxMmh1bWJQd0p5MnJMWXZnMlRrVHdTVFB3S3JE?=
 =?utf-8?B?ay8wWk5idDBaeFZ3NHp0LzlFeStHWDZEa0x1a3lsaDhBT3NNbTJnTmpWVDJn?=
 =?utf-8?B?Zll1Z1RWdmRCUkFlQlVvNW5vbXl2MXNVZzBKcFRGYWNBVjhRaTl4OXFMQ0o4?=
 =?utf-8?B?bXZOYmFuY0VNdG9tb2NQVlhqVUFkdlFFbTcwNGJoUm1pN0FxRDJtZk82NkZN?=
 =?utf-8?B?QytQUStjMGhLK2FDcVRyS0kybjA4NHVJOFd2Z1diMk5pRlhRNk9ocTg1OWlr?=
 =?utf-8?B?a2pwa1ZFM0ZzOWJmeFQ0bHBOTDZxZ2NLaDRSUXpPclRFL1N3SEFuRE1TWit3?=
 =?utf-8?B?SUlxaVFlRVpydTFwTmhtWG00MklrUHVZbERvVUx4akc0VENvL3d6V0E3QTNS?=
 =?utf-8?B?dUUyd2VTRkgzYk9wYjhxelc1MzJnWDhwMmJOSE56N2dSaTVETVpUTTEzNllX?=
 =?utf-8?B?SFM2VnN4WTRUWjl3NlQveTBkMUtmODRLS0hqbU1ScER5MFNUNzhtZHo4emc0?=
 =?utf-8?B?Nzhjb25VMncrd1QzZVNGdzVEcHZRQ2UwUU14bXlMQjlDMjkvYWZPSHNxMUw0?=
 =?utf-8?B?RFNNZThrU2ErS3g3MEtXRE15RStoQmZzSzVFdGtqNWQ2ZkRUWTRGbUhrUURI?=
 =?utf-8?B?YjhpamIyRTNYVmhxMitGZE9iNFNNQkxCTUVsWDBRQkxscFlDSnhLTUhKM2lR?=
 =?utf-8?B?WWpSbTFrSEZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEdYcVpUWEttTXpjMGUwNy9TbUNabnF5U0pnMk43ZktEOHE5U3RWenIwbkFo?=
 =?utf-8?B?V2l6b2lBZE9jNUovOUpRYUdpV3BLVVVPVWsrY3VDZ3d2Y2kxd0dadVNMd0Ux?=
 =?utf-8?B?WGhqdXg2eFVtM001cVpkNndqZ1U1MExNaktYbmQvNldTY2lTakx6a2hPdVFP?=
 =?utf-8?B?N3M1R3dDczBFWS9BY3ZocTFWRkRpY3R3UENvNWF1U0VybFN6R05obUNaVSt5?=
 =?utf-8?B?eHZXV3dLTzN6cVZSY2FPVDV6RGtsd0RuT1EzamZTQU5FZzZBWkZEeDlJazBJ?=
 =?utf-8?B?RWNvZzRTMGo2Qnc0dUExVUZVKzVvdFR3U1dqeHAxZ3NrRVF1RVhleUh4aFVx?=
 =?utf-8?B?RnB4dGVxbnE3VVFlODZ1TGFOT3ZwNlZ4WTh0bHQwd3FLY25keFFOZDBrMkMr?=
 =?utf-8?B?cExCRExnYWNCRXZuU1k2cElCdUNrSDVmVDJwa0hpZ09TcjN1SGR4RXQvQ2g4?=
 =?utf-8?B?RzVDNEhYS1pYYXY5YVJSWUo2eVFnMEt3Q1NmNWZpbDI4c3NNOHF5aDFaNzFs?=
 =?utf-8?B?bVhtM0l1N29aYXlxSS9RMlVuaHUxVU12d3F5VU15ZFBpYmxONVoxaGpYdHpw?=
 =?utf-8?B?ZDZ6VktqaFBvVUdvdUt6ME9nQ2hEa0QvZmNZVWtMQjMrWHJXK0EvY0N4eW5o?=
 =?utf-8?B?eTFRb3A0Rkdxb091Q2F2alEzd0xhaUNPL2pnWlpLVWpFYmE2OVg3MUpRckZL?=
 =?utf-8?B?ODIzQmhZODhnT1JKWXJRMXVWSkNLRCtvQ2h3WHpubnZYYXhCL2VXeG4vNE10?=
 =?utf-8?B?amF3T1hlSmpGajE0SDVJUC9EQi9mSUhhdDhYZHFISGZ0U3NVbmNVMGEyQkda?=
 =?utf-8?B?bk5sUjdCSVNPNXVPL0NCMHlENG1KV1hSRG15NlNHL2ZITDhqSW9tQWpIVE51?=
 =?utf-8?B?M0w0SHQ0b2RRK1JmTGF0dkk0N1FZTEFOdkNQNTFuMXloMEdOckw4UzI2Q3pm?=
 =?utf-8?B?VWExZ1RzVUJBYjRwRmZCY01VQ3hKRWVnY1JodFQ5SjBLRW56NWNrL3UvVWVs?=
 =?utf-8?B?ZGRmZGs2eVhkYmN2Z3NoS3BCbWQweVFZMzAvWlZtT1dMWHdKVHFqUGVYWTB6?=
 =?utf-8?B?cVVON1o5ZmU5dnQ3QjdDMGYvbzBVVkNSQ245eE9FQzdnLzdmVmxVWFRrVkxU?=
 =?utf-8?B?ZS9nUWt4MXN2Rjd4SXBRREFiRTV2bTlLNXdUenAzWERBNkx6T20zaVZhUldj?=
 =?utf-8?B?VXc0MTZDZHZDQzJzbWpScnRvbDVXTEpMejRNdFhCeW1Ocm9oUlRXZzlaekNX?=
 =?utf-8?B?ZE1sVXhrcTVKUkx5QmhXeTdGYUJ5eEZuUkpKMkNoZkk2M2xSOWNOYTlCcVFG?=
 =?utf-8?B?ODdFSVRVQ3QwbmpSN3JIczdLQTAvYWxtZnRIOEl4U0ttdll4ZWRjYlJoWE9S?=
 =?utf-8?B?NEF1VHRiVzg2bTFkQjh0ZkJ1NDZXOXlrbW8yYUUzSW1BTHZOZC9rbzR5TEpr?=
 =?utf-8?B?dGppSWtsdWloTFpqYVJsd2pHbkg5RElXZi9LZENlLzE5OHJQcWlsVkd1N0Vl?=
 =?utf-8?B?ZFpGbzl2MkFXUE9RbFhQQng5M28vWVducU9LSFYzaG1vSTl2S2dmdEtTNGNH?=
 =?utf-8?B?TVl3eUFWaVhHS2xiUjBQckhsNmhBeXpER2NQaE40cGs0ZFpUVkd0YUxpbXBN?=
 =?utf-8?B?d1hVVG55Y0NrRy94YWVIdjlZMkV1aWRzSVp4MWh4M2pYUVF2MlJBa1FHc3hL?=
 =?utf-8?B?emdmd0RYTG9UYXZidldiQ3NrYkVWc2NoakY3MzBvUzZNNHBLeUd6VFNadVhM?=
 =?utf-8?B?cnFyZXdya01CRG4zVVhaSEZnSVI2SGsvZGJURFZRc0ZsRm5XOHRqQTVxMEYv?=
 =?utf-8?B?OWVrYjZ4V2lhSCtyNDZYZ093c1QrVFZXUWppZWh2ZWhNVGpKZ3czWDFSam50?=
 =?utf-8?B?cS9CZ3RKdXdNQ2hkZFpkbUVwQ1JIa0xrYmJiTVZVcUlvREZTR3l4U3JWeVlM?=
 =?utf-8?B?alBPWTdPWDBZZ1FNWTZBVVlkV0Jpd0JZaXM5d3I4a2tJL240NTBrNkdiUGpI?=
 =?utf-8?B?dWphenRqTkhmYWI2QjBmcEJNTDRTKzA2cmFKbVFiV3djSzBsR3U2WW9hZkRF?=
 =?utf-8?B?STFhcjB4TGorbitCQTlWYzQvRURqZ3hzNFZkT0pNcGs0SlEwRGxrRFVYcE1C?=
 =?utf-8?Q?hW9JiuRe4uFiaKLkePV901odN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c679fa-497d-4d08-1348-08dd4519534c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 12:42:03.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dx6XP6Hg5w45a9gcY3FIXxRpuVUPAQTTbX+Pr3XkBLL4WdU+cxIGcubTne4VgF7lfrjaQLdyzpdkbYZZwHoy8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10889

Previously there was discussion on using "feature-controller" or
adding a specific node to group the fuse information for U-Boot to
parse and update node. But rejected by DT maintainer(Rob).

Since the STM32 engineers added access controller concept and landed
the support in Linux Kernel, reuse the concept for i.MX.

i.MX OCOTP eFuse has some bits to indicate a specific periphral or
function is avaiable for current chip, for example i.MX93 has variants
that not have NPU. So introduce '#access-controller-cells' for OCOTP,
and add "#access-controllers = <&ocotp [gate_index]>" for periphrals
that needs accessing control checking.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

In the end, cpu nodes should still be handled by bootloader.
And I may also update i.MX8M to use same method to support variants
if this patchset is good.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v8:
- Constify some variables per Christophe
- Link to v7: https://lore.kernel.org/r/20250202-imx-ocotp-v7-0-5622ba16451d@nxp.com

Changes in v7:
- Rebased to next-20250131
- Typo fix in patch 1
- Return error when '!root'
- Link to v6: https://lore.kernel.org/r/20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com

Changes in v6:
- Rebased to next-2025-1-20
- Update Kconfig per Alexander
- Link to v5: https://lore.kernel.org/r/20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com

Changes in v5:
- Rebased to next-20250107, but seems Srinivas's for-fixes patches not
included, so I picked the for-fixes patches and rebase the patchset.
- make gates pointer and using ARRAY_SIZE
- Use of_parse_phandle_by_args
- Read fuse when needed, not cache them in the very beginning
- Use %pOF for node name
- Check controller node name in imx_ele_ocotp_grant_access
- Use dev_info when detach node
- Use priv as function parameter to replace pdev.
- Link to v4: https://lore.kernel.org/r/20241223-imx-ocotp-v4-0-f504c1420640@nxp.com

Changes in v4:
- Add missing of_node_put(provider)
- Typo fix in commit log
- Link to v3: https://lore.kernel.org/r/20241219-imx-ocotp-v3-0-b22371098071@nxp.com

Changes in v3:
- Add A-b for patch 1
- Use scoped API when iterate nodes and address build warning in patch 2
- I am also thinking that to drop patch 2 to let
 bootloader to iterate the nodes that have access-controllers property and
 update the nodes before booting the kernel. Then just need patch 1 for
 the binding updates. Anyway, comments are welcomed.
- Link to v2: https://lore.kernel.org/r/20241217-imx-ocotp-v2-0-3faa6cbff41b@nxp.com

Changes in v2:
- Add R-b for patch 1
- Use '/' root node instead of '/soc' or '/soc@0' for patch 2
- Link to v1: https://lore.kernel.org/r/20241212-imx-ocotp-v1-0-198bb0af86a0@nxp.com

---
Peng Fan (2):
      dt-bindings: nvmem: imx-ocotp: Introduce #access-controller-cells
      nvmem: imx-ocotp-ele: Support accessing controller for i.MX9

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |   5 +
 drivers/nvmem/Kconfig                              |   3 +
 drivers/nvmem/imx-ocotp-ele.c                      | 173 ++++++++++++++++++++-
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        |  24 +++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        |  43 +++++
 5 files changed, 247 insertions(+), 1 deletion(-)
---
base-commit: efc1ed8e768ea7a94386bb73a9d809af7d4522ba
change-id: 20241212-imx-ocotp-cbef304140f5

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

