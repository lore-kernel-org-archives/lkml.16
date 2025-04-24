Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A694A634;
	Thu, 24 Apr 2025 00:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455310; cv=fail; b=OGfT/inGR7PmMLbccJpvG1v3k/WQY54yW5x5fhGKvpJO3hVhEZTGnmLOEQRRXFm4Zt8GCv6vGrCYQBeJdDh/pS5arZgdPqBYazT0FXzP4dIRQC5Z3qayzMwgsEUM+xCMOwSpRuBDabuVT8QZ9JSg5hB8h4uH9I9TZqEbq86b8VE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455310; c=relaxed/simple;
	bh=q/2yUnGRL4nKhz54XomzxpNEFX71blr+fvMSTTzHBkM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=t15fZUND3JaNoNZYvZ5rPZfuSP7wztcmnjbCLifJjED+da9sf310Ud/j7VB/cWSdMpTEzMdKHcEq7qlTGp3zj9Vpm/df+r0vyWbt5iRB1l1HbyCvDXWSKHQxDi9TK3RNOFmUxWOkvqHHkBNLbo1QGssY2wvffls3ZvbAea/pn4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QjB5jvMt; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QjB5jvMt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOpn0E682qUW1klNlYhsGT6MGFnVR7H2GBs+T3rKIDDsUk8oi+10h+OoeDkXvYP4QSmN94qGmBWZ6MNypTtJyyP1yfOol1jgS7Mz7QWKc9B2H1xgB3HcGM/VMCouD97eKp2FiyGrhsFYaAh8CZUAYTCRa9FcfKGHEZYF/tP6pblwbIxznVLaNhVYzG295cH/CdYvQqWJyCDBZhlVPK4OB0Ju6On6A1cQCBMzT1w9/jgDjHtO5qDA+hxQfz1JUIWIg4oa+F5QUFbtM8aAhYti1Tn0LMXUnX2nlBam5qAUBJB+WsRlTnuyW8wQKYtYXVa261Pq4bd8ukUJO0tviJrf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvuX6v1u3yujOTq13vrrjfg5lYCccysRWtNqddFsT2I=;
 b=aG1mBZsj7O7H9zHx0CU3QKf+kqXPOAHnxkCJt5xmkC338EbvUVJ+TkKsQBhfh/2dg7JB/zfY6/psORhQ9qvnzMCX6NdkELvNyvxM9fZTocOpQgurjMfTAEsSbywgcurnFRv1SsqL3lVY0Yu4a0A7bTWYv11897pubqqnIFKaj053ot+ArP+mJK+pL4SNtt//Q0GkV84u27N1bboXv7ye4v5gNGDyfwXW4iJDdy9fU7QDh+EQ7HrtsbvnXBHe57f+KfF4ViO2ilK4l2615pEwLG6xkxy9PAcBd/IIoDDILLpgZj45st3duWGWo1sRSQkVwPBPG6dNks3/PW/9cibipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvuX6v1u3yujOTq13vrrjfg5lYCccysRWtNqddFsT2I=;
 b=QjB5jvMtFm6bz+w9fIraceMgoXUja6SpsGXk4gDvC+r8iXv3oKKfql7mhFf9AqzyO1Ue531baE9cJJs3rXaXQHRtDEVsBqbli/toC/zjZxpFQz/uJxbOHHGmQ97VfwfQwp3oewJ04HZbUONYkQPbpmFVXL785iP/YdN+fSuqNnGBEcklvWAIBs7H/YAn9QQ4J0aKVJf50lQfPZIij929IRJiVdhaScaVaEPFn1yVB36SjiOQ4mcozDT0U0VozpFY7eKZwemoVM++v1fTbigruPaS6ACcsU98EOzkHfgGD4sSo0/T6mU4AbwCD/Bg2ZRLi8CEFnmLmBv4bnYDWJFvRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:41:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:41:44 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/8] arm64: dts: imx8: create common imx-pcie[0,1]-ep
 overlay file
Date: Wed, 23 Apr 2025 20:41:22 -0400
Message-Id: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALKICWgC/32NQQqDMBBFryKzbsoYtUZXvUcRCXGss1BDIiFFc
 vemHqDL9+C/f4Inx+ShL05wFNjzvmWQtwLMorc3CZ4yg0TZYFWVgteoRmuYRrLjdHiBNbadVnW
 jO4I8s45mjlfyNWRe2B+7+1wPofzZP7FQChSyRZpRPZQ23XOL9m72FYaU0hcjzTu2rgAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745455301; l=2422;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=q/2yUnGRL4nKhz54XomzxpNEFX71blr+fvMSTTzHBkM=;
 b=NIcNszYt18MI0NrWU8ic1sUStHz0ZNo5MNW6JUzZdCguZ6k2YbkmS2xwH3AfMQaHWtOCvjfkG
 zJEtqjQf0/JBqMCiWKV4Bg9bXSvwfzthIpzJ+1bNx+owV7BiKUnWbqA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: c88e32e4-f865-4b61-6a1e-08dd82c8c948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vzc5K3RIM0hiWDVVbTZwbFExS1ByMDV0UWFrOUdKZU9UNWNMYTVCaEVyUHIw?=
 =?utf-8?B?UnpBeGp0cm5VY1ArN1F1WUVEMjNzQlVrWUJJLzV3RjlJaGh6djBjTEwzTExW?=
 =?utf-8?B?OUJ0c1Q3YXNsUFBCQnFtK2tkSC9MQllwOThsa2JqVElKb0RLSkVUVEZablJi?=
 =?utf-8?B?Rm9VTVlnWmRlYW8xYlYwQTB0YUZwSkpISzZEM1I2MXVvTENYR0F4eWR1akJZ?=
 =?utf-8?B?UHQ2RDVTREQ2QW8vOVIrKzVHR3lqeXJuMGJqQytUOTkrcTlOTGMvanoydDF2?=
 =?utf-8?B?dHMyM2M3anMxT3dLc0ZRendsc25YYzRrc0I1NTlJaUMxRnNPQTZGZm1pUklV?=
 =?utf-8?B?OTVDM2JCMyt2dzJManV5UXYrOVoxZ3BNTENyV3lCcUdXRkNIQzN1VEFOQWwx?=
 =?utf-8?B?c2ZDbGswVkpMZVBnZURGRkhPV1pKelFCNDhVOEZGOGZLZ0hOdU5nMXAyUktl?=
 =?utf-8?B?SGhEMHF2RFo2OXZGU1MrL2c1WnplQ2luR2xjQmdTekN1YnZUTEhWQWtZS1lZ?=
 =?utf-8?B?NlpRT0hPTFZuNDQ4eXd4MUtVV3dTa2FXT09nekVBREVmWWhrd2wzSXE4c1VN?=
 =?utf-8?B?dmJQc2RPbmhQK2Z4YyszcC9Xd1VVUFgwR1NPRzhOcWh2eWt3SEdDaU0xU1pB?=
 =?utf-8?B?OXFIa3ZIM2hJYTA4ZWErL0xUU0QvZTVId0dJS0hwVVJiTFhxK09lbGc0RzJJ?=
 =?utf-8?B?aUphVnc3cnFET0NiK0VvY3ZMVTNYV0lDZjhyRytBeTRkU1N3QlhwV0Qya1Iw?=
 =?utf-8?B?TCt2OUt2L1JuR2N3ZVVGMEl6WXVVdjB4SjZDS1dwRGZBV1I3emFPZXJRa1ox?=
 =?utf-8?B?cUd4alU5S2J4MzFyb21TVUtFN0tTbjYzeXJxME1VR2pRNmQvSXg5cStLbXF1?=
 =?utf-8?B?eEtnOUFHa2UzMDl6V054eS9FSmRQWDZrSkpRUjBjaDVwRWF6MlArNjZGaDBG?=
 =?utf-8?B?Lzlvc2l3b2NFcjlyZXM3azVnNlBEczhoOUJmUG02djRRNU04WHR1YjYwME9V?=
 =?utf-8?B?R1UxY0RwRnVGdnNQdmV3UEx2azJ4Ukg1a0EveXNVZFpvWDY1RXhyYW1vazNI?=
 =?utf-8?B?elFEck1SamdGYjZxVThLeG9GZ2NIYStkKzNJUE5qS2xrU0ZYZXVBeVpHNlJD?=
 =?utf-8?B?MEJIVk8vRmVnWng4U0hHQ00yYXVEeDZOQVpFSW9INDk5ZDhCV1oyTGZPVllh?=
 =?utf-8?B?N1JkS0pYUkF0M011ai9qbGdoM3FhY3BlSjAvOExuSnZkd01qQTFFbGtjMlIx?=
 =?utf-8?B?SFZUNUtPd0NqWFZLN1dPMEJ0eUhESWhNeGRBUlRXUWZjNVk1c0hLUkdscnBL?=
 =?utf-8?B?VEtBbWNxQlJ2UWFFWEtqU1JkU0NCNUxYOUFYUXh5L085QzJ4bEV1Z1Z3RVdX?=
 =?utf-8?B?VkhLbThEZzRmWW1qazM3WVM4bXcrYkVTZkRmdU4xa3YrZHc4ZnhTek9ZeUc5?=
 =?utf-8?B?RStXZXhDemU1bzZ5MHlPS2pDVzJMZllDUVBPbGUwMzRib2tEQjZZRjRJVmtP?=
 =?utf-8?B?Uk5jTFpkL1VpaUlHSDFlaC9ub29OQ3RvKzNDamxTMVZyblZxcGo4V3gvMnJr?=
 =?utf-8?B?QW5TSHBaM09zbnJUcllIVExLV2VkZWErQ1Qwd3lMU3N2V2FkOXRjYVVDWmxO?=
 =?utf-8?B?dE0xa1NNT1FKaWthZ0FuSTNWemdnRkI0WVozQVhmcis1U1dwaUovTzNCUmtP?=
 =?utf-8?B?RkNzTDErRjBVcHcwM3Jyekd0QzVkS2xJRFlGRWhscGRqb3pvTGkvR1JJRjls?=
 =?utf-8?B?OGpJVXdoelBlZmpVclpHQ1Q1MDZUSk8zVko5MjRhcXhTaTBsbkczWE1jT1Jm?=
 =?utf-8?B?Ry85bXdmY1NPNjJXM0U5NjdCaDg4Zm9sTHJmQzVVK2RWWDdFRFN1b2VNSHR2?=
 =?utf-8?B?RDc1U0RSUTIxU08xcjhTaWlQZmdic1FYRkF5RURITk5XbGQyK1JtSVJzTmJi?=
 =?utf-8?B?VDRjUHVoWkVwWXVDb05JNTYzbDlIMmtsY3l1dEVWY2NKMlltRXBmK0FjK3ZH?=
 =?utf-8?Q?euDcMOk+UNg/HAR4oM6lGQWTZUpj/s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckVHVnFoczJPNW8xajNBem50R0lqc2wvR3pwaXdwSDVCWGFhNCsrNXIxUnR0?=
 =?utf-8?B?azBCVkI5cTRUeHM4NmFyZ29tTjJyZE9EdEc3NDBaajZDRTA2VlM1OGhGNXhT?=
 =?utf-8?B?N2lVUGd3OG83UnJIWTRpTEhEVHRqaU9OSUVzSUJHZ1ZJelgwaFRSTEovKzNS?=
 =?utf-8?B?REh1L21DaWwvU3Voayt5YitrOW9qZS9uUURDbTRjbXpzWEkvSG5VMGEzUzV2?=
 =?utf-8?B?MHd4K0xCeVU1d25rSXpUeDE1L1RkbHpob1YyL21KWUxUZG1zY2RDRW5XRGZr?=
 =?utf-8?B?L3VFUWRKMDNWeTRBMytjcGFydTBRTFpIWmZPYk5DTVlBdXh6Rk9hUXJkNWFv?=
 =?utf-8?B?VHZ6Q09HRHk0TFE0Z1pKK1hucWlrU3RuUnhmMUxLZFBscUhWY0pkOS9NdTd3?=
 =?utf-8?B?ZmhmRllRaDdlZTVXUEdFYm9tVGNvNzhIbk0xVWVCWUlZVy80WlVBUU42MzFk?=
 =?utf-8?B?bUpZTU8vWXFCQXpsRk1FU3JTVlZvVzdCR3VjQ3FkUHgvcVJVeHdSNldVZitG?=
 =?utf-8?B?NFhqWTUwZUFCUVhJNVZ6QTJQbGNtMWgyZTN6bFVmUm40Z1dhZmRvK3lZYXFC?=
 =?utf-8?B?ckxSTkZKQWt1WFpoMDQwaEtmTUlNckthWjlPcHR0UllicVhtd2N0a1FvemVP?=
 =?utf-8?B?Zlg2Y0wrMU4xdDAzdVNSZEtRanVBRGpUUDFLcWgzTSs2aGtEQ1ZxeVoyMllv?=
 =?utf-8?B?cXc2dS9JUTh5RUVKZkxjSGQyaXJ6QzdMNk45cEkyaXhJUXVGMjNKcnZlMnZ2?=
 =?utf-8?B?ZnlyY3BSY2gweG40QlBWSUoxQisvS1lCMi82Q01VbVdNdjdHWGptdGlFT0FJ?=
 =?utf-8?B?YkNPYUMrRStiMXdHZEVPUEdNUy9Ia1FLVlArWDd0alI0NkRHRE05bnZkaEY1?=
 =?utf-8?B?ZGlLZitlaDhwQmlnYThLaVRlL0FzVFlTQlFUZHpMcVk2L3hIWk5Vbjc3SG9p?=
 =?utf-8?B?eW1ORjJEOTIrUXovcFFwTFdkbHR5NlJmY05wTFd5cnFRZEdoSzdUaVllOEoz?=
 =?utf-8?B?d1paeGlUSHp5dXNRamJLNjdMMnNOdjc4L3YvMzVWOUk0ampFUWcrb25LK0lW?=
 =?utf-8?B?SWFsOGdtSzZQR1hWeXQxbytrWlhwa01IbXdoRjJMNjFvNGZHck1GWnlKaDN4?=
 =?utf-8?B?bWNtb0JMZnpYakNQS0VVaXhwNGRZMStITVFST2NDUHYrbHNHb1phQ29kUk1R?=
 =?utf-8?B?YXZGUzk1Rm1vWGhXT2g3ODZlZmZRRE14VFVYdml0RkJIUS9QQnh1YllESmU1?=
 =?utf-8?B?TXRlOVdiMGxXTXhNdDBvZVEwcFlHa2tuZjd0SmkrMk9xSlFadUtDRUdBWmFP?=
 =?utf-8?B?bHMvR3FRdWxFN2FvLzBNOE1RVU1uMWlDK3ZFa1NjYUxNQWRIeFI5dGg3Rjlz?=
 =?utf-8?B?TkMyS3BGOGNuUGdHbzlFRDdSNzdab1VqSlQzZmN2RUhUNHpIYnZLSFZnOVdG?=
 =?utf-8?B?bVdDdVdrajRWWGRmV0V1RFZ5enM2c1BGbkhDYm1WS25UWVJJM2dqM2VmTVZl?=
 =?utf-8?B?S3BhL0swTWgyU2FKY3pON0FjQmlaZUVxZnZuZ0hkYnJULytoT2N1aXVVcFFV?=
 =?utf-8?B?NUxtRklYejZEb2ZPTEFHUStKdFQ1UW5ieEc3dWt4K2hPdFJ4QTJZU3VBd2RO?=
 =?utf-8?B?RHJpNHY3SEJPQXVzTXdaMDYzZ01Fb1RDNGRsaEtDazNrZFhtR2pTaStib21i?=
 =?utf-8?B?L3JGcjhwbkNGUTBWMmczRkZCSXdBZWVKSHBhN3RCaHAwSTlDcXVpNE1mSkto?=
 =?utf-8?B?OWVLclNhbjFuZENJZmV6RDNCRmp0a3VXNjAwTlp6Z0EvSEVxT2JGaVhYcnFR?=
 =?utf-8?B?cDRxc2RzVExLMHNkKzVBbUREakg5MXBhQWxrUk1FRHhCZ0FDT29pamZvNkhv?=
 =?utf-8?B?RHNVL0hVL1M0dlA5QWNsdnlpNTVJbkJiVEdRQVpyR0dSOUpiVFBXTWFFQzlk?=
 =?utf-8?B?Tlo2THdhU09nQktvZUZlUTdNWEZUbzN1STRnTjRKR2Z4dUdzRXpzbGpIQXV2?=
 =?utf-8?B?VEI2ZFJacm1XcUtZbU1GWml1Q0NQbGhSa2xvNmRTZ0krVlJXdHlrOXJmbEpM?=
 =?utf-8?B?VmNFWmJ6UVE1bTQ4WjBwR1RiMWNTaXA2d2JubVJjNmQzQzRpczYwbURLWkdm?=
 =?utf-8?Q?ztFg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88e32e4-f865-4b61-6a1e-08dd82c8c948
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:41:44.1501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdUNNX0F/2rEsCurRDvvE7OLoD/6/gRRwsxWjJGpJG09L6fdeN6GLUKZHlHWRqob0dJnERnC/BKZqQw1oTEibg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

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
Changes in v2:
- Rebase to guoshawn/imx/dt64
- Link to v1: https://lore.kernel.org/r/20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com

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
base-commit: ac1c1d2e2124387752b4cc955dd359753783c147
change-id: 20250331-imx8_pcie_ep_dts-04079a845a9e

Best regards,
---
Frank Li <Frank.Li@nxp.com>

