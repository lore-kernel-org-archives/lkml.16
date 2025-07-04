Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C461DF756;
	Fri,  4 Jul 2025 03:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751598706; cv=fail; b=Z17FwN6SqIEGU7ZgAEPe8Lqkxs2HbMCMrp84vrQss1sm3jZuxHJDawSXaXhX1kB1CIJjYfti9l1FI61xjIqA8VCZmYh/CUjH9P1bInoGSaT4HJmsKX7pD3lNf1SUTgTi+2DHsrV4s+iE9mJLS2ZNG2h3c61q7mePPF6eG5DKuCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751598706; c=relaxed/simple;
	bh=tIs/advU6CumfLVBQT2l9iJPSG/WHwPZm0iLYCthpnM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IGv+8RSZ6TiUUgowDgAO0uMY402zIygsa6KhG6t3tykwoIgIciQBgZKYsTsE34wN/ffKSJyJ5E2VE+i+ZInKh+v15SnQ4I4R7w837BwQSPjVg15pb+z5IBjmsozT7r81OPPeHKBhd+Bl3m2SqNvTXnxlOtlP1TNMKQuYGgAswW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H0cbM8qn; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H0cbM8qn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zhb8V+OjstKvng25wrRHSPmhsN/2hOkIAX2ub+f6qxwxljNDUPJznnbVOydUwgFBmgcxrPYXVucwwTCTDEfhSC2eQ+FZZYxvFwFlpCgbtu2yExaYUqXuJDmT5SgVpg2LXAHEN/xexOlMHLD+Vnia9h1Gvk9OSwT/bh/iLHjh2UHUB8gExyf4sqRhwYTFANVKeX0ablI0bimZbmQHthEiTgv+JZyLEXqxSOFsJ/QC9tyDE91+sE7JoR3s5b9WV3u7fJ4pUqYW7luUcR5DJm/UrgIFNMn+Msn3MYhyk4QI42BZTijBzYje322BDJ7xq30jqzsM7WoHsA+XZEQCpqJM7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqmDa15vujngKc6eYaXgNUa9d9GwNIEZXGbYppHgV3I=;
 b=SF68DXZzB7EWi0SdMpdXEOCwDfT6LdlXxiMxCmKiGIH+9O9AR91MnQZB+bIwwCiN02UAyE859Vou7gQVpjLCEOgeDssA5oTPGtqZNrtmDcvWbLTHbeQhjn2QmBWPGzYqqI4w8YRYt6ZAEXE8DxQClSWs3w+gk9gl5zSC9MqA2HrJyaSrybtJxHpBaWZrE4vYPEfYfXUgQOVOBXGLTTO0iYsdIHm8zVplblfFheRdVxgkMmm8ti6Gy/VhzWtc+w4BhyC111c/fD/AUXBaVPyFDLGMbpZhcr5U0VhoMa/dlr1gCxb3BEyF/ed8DY4ZgrO3y43Bxn3sJUNnt8Ti5tWnkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqmDa15vujngKc6eYaXgNUa9d9GwNIEZXGbYppHgV3I=;
 b=H0cbM8qnErB7LzardUg8NxRfRgAK8YsWdGT6yEl1AuNpISDEYDNOIENF7KW44aMQ2oSZpoGvJV7dIgXembjllDzEkSwpL3s+RmjlM0+VyZ0YsfOPH6T9c3Au2eFdu4+5bc/NOAgKb6tNJK5oJXnh2+21nM1gtOsCkgVNmflLfKmZgrcjyz31TPLFICxIea2JFeNpQyxLHLUCnDPo679z0oQB4JV2y2UOkFgH8eCI4u7hTeO+P86dVl0wPouEyS2Yt158sueq6glO2DiQ1/NyJBrdjToGI0jAscgD0TMwgvNMesPvIieVG2mjn4K/jIzgsav43SbfAYr/A11ij9AKOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 03:11:41 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 03:11:41 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 04 Jul 2025 11:09:36 +0800
Subject: [PATCH v2 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in PM resume
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-scmi-pm-v2-2-9316cec2f9cc@nxp.com>
References: <20250704-scmi-pm-v2-0-9316cec2f9cc@nxp.com>
In-Reply-To: <20250704-scmi-pm-v2-0-9316cec2f9cc@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751598594; l=3761;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=tIs/advU6CumfLVBQT2l9iJPSG/WHwPZm0iLYCthpnM=;
 b=s5O4A9gQiF1B5mMp9aNLfh5HqyhBsj7sr8pHrsogttD4oGgnyRksl2vD+dh5mq7vTW17cQEtv
 WLUd13m7r1zDaHZKOAsAPPGcDmtOe1dp49hr3zXDsy4UwFCG+hKu1v4
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::21) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: e7498ee2-c246-44b3-f008-08ddbaa87f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkhXOGM3Tm1LOHJqYXJpc2pUK1BnRk14aUYyOHRDQStrN2hpbzJBOGx5ZGVq?=
 =?utf-8?B?ODlPZVJ2aVJkakhkKzNMNTVTNDR5WCt4NlluV1pXdWdDOEhqNFhDSXNrVDhW?=
 =?utf-8?B?SUJIWlVNMDFINThKc2RsQTU0MTNvbUxZRWFXNlE0L2tYYVRtUWNCZm9iSXlJ?=
 =?utf-8?B?UjNWK0FHVGVTTzVYOVZlMCtyNEx4cmlIcE01ejNsSklZVmRmTThHN2pOclZD?=
 =?utf-8?B?TXZoRGlSemphUmpsRGR2K1VCWVV5UE1DUlZuenp5bUJlOU5oZjFHK1lUaTl5?=
 =?utf-8?B?K29BSUFobGdyL09PaWpwWDd1SnF4VEhGYWtLQStUbkFyZ2s3Wll2TG9hZW4r?=
 =?utf-8?B?Q0x3aTBINkVxUml0azZnSUJRUE9tM3hpeDBmbHlKRUtYSjdJdUpwbk9KazIv?=
 =?utf-8?B?M1crSHdsckhpOTFNYmhMSWdkMUJYYzlTZm9KUVBXYTVCbUo1MU91YXhpMW9U?=
 =?utf-8?B?ekxLemFzUk4vNDVTUU9LYzU0bUVXNnA4WkNNU080RDkvbmVLSlBxU0pCOWx1?=
 =?utf-8?B?Ym9FVm91MU4xTHJxVHF5Smpza3k5WUpDSWgrZmczWFBHN01aMm1vYlV2NmFS?=
 =?utf-8?B?d1BvT1BaalZ1THRCUVFxYnB2WDVobkRweXNWS0FIMEt6RXJzSkNDZXhXS0xl?=
 =?utf-8?B?Zk9aQWF6bWs3K2tQcSs1aC9RaGpsT0pvd3dXdXBRZzZ4Y2xvcEpQemJvcVZ4?=
 =?utf-8?B?cXRzWUtVZ2tXM2xiZ0trbmlkakN4Zk92c09ZbHZyazl4V1czQTl5amVPTjJu?=
 =?utf-8?B?Nm1lamtmbUNGenFTWldwdUpSY0xZMG9rb0RwcnZQUCthR3oxOWxvUmhwVzFN?=
 =?utf-8?B?UGNDMnZybTlKd3JraHgveVZZaTBWNktHYWJkYm1lTGVRd1hXZHFkajBZSUV6?=
 =?utf-8?B?dFFHM3dBRkhvOEtPQ2pmemEvbXVPdTVPQ2Y1NkpGUnNQZ25KUjQzYzEwSXV4?=
 =?utf-8?B?NVVnVTZuNU4yWGQ4eGFzc3VKOXFlZXQ4L1g1blAzdVRLanhPaXdrYXNjbTRY?=
 =?utf-8?B?NVl0akVuNFVYalMzY3pxRnViVkc4RGFLdUlmM0JGeHB4ZVdBeXUzMHdMb1Ri?=
 =?utf-8?B?czBsWVNEUy94SS9XRGxJek53bExib2J0OWpzVWh5U1NjOWV0Ym1NV0dwVFdu?=
 =?utf-8?B?TkF3TVA5ejBjN2JUSTFneDU1TmlzeElPUW4vcDJaa3NUQ3FrOEpTWWU3cXV5?=
 =?utf-8?B?czZ4ZU8wZ0lwN1UvSXV0NU9SNHlOaVh2czJaR2gvZStxR0QrOXJ5MXZMb3pK?=
 =?utf-8?B?M3dobGdqMDBSMGozc0tpbHdEb2tTa2trNXVOazA4anl1dkZWQWptQXlzNTFG?=
 =?utf-8?B?dGFNbVdHN1hKWUZGaU5UdUgxR3l2L1BTbnVqRmNJZmtxSzg2d2FvYSt5TDhk?=
 =?utf-8?B?bjMrUE96dDlXMzFBY2hnV0svQnZ0WkVRQTdzQVdkL2UweGQyeTJFdzVRTlhC?=
 =?utf-8?B?VHNoaHN1TXpYRTFja2NmR05HUHg3VVJERGpxSzJMLy9ZU2NPNG10N0tvQXFL?=
 =?utf-8?B?UGp2dWR2R1J5R1hJOVBSSVQxNU1DcWxETk5nRU5tNFIxQ2ZhMUpQY2pkMEFN?=
 =?utf-8?B?S1VycGsraGFWVUgwcFhHY1RhaVkwL1did1VHb3hqK0VialoxbmFjd2RGN1JF?=
 =?utf-8?B?OEx1aDdWMlFjcndyaUVkU2hPQUx3ZTRVb2x3a0Jic08xekxlZklLR0JWVkZY?=
 =?utf-8?B?MGZaalp0akJzYXRoMEVadGZOSDRLVmdmMUFmNjY3cG5xQjFlWTF5WE5ibHRi?=
 =?utf-8?B?bERXK3krNzh6NWxEb0ZkdEYxWDdUc1dNUDQxRkxlMUkzeTdlaCtmVHFiUlE5?=
 =?utf-8?B?SGc2K0tJbDljSFdObDZFS1ZpODVDcXpxZ3ZtRXhDcmZoS2hxamNCNFRxUGxx?=
 =?utf-8?B?RlhZNEd5VEdFZE1tRGlPUkErQU5LRWQxR0xBSjNUYVlVZGk4dldaKyt1Q1pt?=
 =?utf-8?B?UDJ2V3NhbVl3SFIvZGgyZjZLdEwyUDZUbzAzUGtSRGhZSXdiTXRHOHBISU5p?=
 =?utf-8?B?bHl5cFBpbXFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3BvYU9PbTYyVzE5clh3aG9YMmp2QU40NVNDS3U4dWhJZXloQ1Myc2dzL1RT?=
 =?utf-8?B?TzRHdWREZDVwZFZjb3hrQVZZTzVwNzhCNmlSZzhpYWVrUkplQW1CL1AwSk5n?=
 =?utf-8?B?bFpwM0dBL2VGS1FmWHppQ1o3Mm9MaW15eW1VNGIxdEt3eHVNRWN4SDlOZGwy?=
 =?utf-8?B?Q2YzL0pZMEJYOVFjeHArNEM4OFIvak5VaVpQTWxXd0hnenludXg4cW1Tb0Z1?=
 =?utf-8?B?Q2kvcWNSTkNMRmlzYmUzQ2lrczFxbHc1MW1vekNneDRCYTZaZGdmSi9vc2tv?=
 =?utf-8?B?MlIxSS9YelJGK21oRWloVk5JOWJRWGdJQVUrNmpYdzAzVGpIc29oYkxyOWdn?=
 =?utf-8?B?elJPM1N1VGl2THNEaEtKOXRseWNFZkRiRGNXZ1k1ZFp3bmdNa2NFNHBmNzBN?=
 =?utf-8?B?WDBYRHFzTGhaRytWdXJZbEloYVgvVjVtWVk2OEhtN2g3bHZPUlk2Y2VxMXJP?=
 =?utf-8?B?MEEvUWtrUGt6bU8rWmN0VmJObnBscnhLS0ZSN2F4R0xsYjZzWWxqVWRLTGp4?=
 =?utf-8?B?VHlpenM1WHFscVA5dGFWcHFiVDYyY1hzMHIxdHNiWXFGMlhIRXpmTkNUTndj?=
 =?utf-8?B?UGtQY1RoS2MzdVUzS0czWVVUQnVqTUtBaWIrb2ZmTUN4OG5wYys1andRaTNE?=
 =?utf-8?B?NldPMWZuN1BrYksvMEZOMmo0RkMvSHBmdTNtditBeEhtWjJlS1dRUzAwaW9i?=
 =?utf-8?B?SlUzejlleW14SGU1WTgrZXpiRkgrbVlGZlVBWVZZWUVHUmc5T3hzK09xc0d0?=
 =?utf-8?B?aFJXVnJUa3U0MHB5SnJOVHpWbEQvZ1dPN24vcG80cUJhSmhnRWcrNk1DVUlB?=
 =?utf-8?B?L3MzdjZwZVBRbnQ5cWdtemZacmRpYkNsMXNSaExjcXlQWHl5dVpPeC9mYWR1?=
 =?utf-8?B?eElCNzV4L2g0YmpEaXVLUmJDNTVMZWJIWlJrWGRMWWVSa09yQkJtVUN2UDl1?=
 =?utf-8?B?SmJ6MVVvYjVvRVlaZTlMWWZjKzRnRklnaU9iTnlTSFo3dDFtSFRTNlFWNzVy?=
 =?utf-8?B?bTFkRFhtWnVjcmJ4bFl2eVhWNVhUQmV0L3hNZjdkVE9PQUpGRC9IOFNwdXpu?=
 =?utf-8?B?bThvd0pLWmJ0amJiRmNzbGMyK0FMeU9LM1dYQUNjaDVBNEV0TW90QWZIeThv?=
 =?utf-8?B?TEhRRm0vRGgzMEtlWGhFMFo0SHNqT2s5cWJFMklFVVdnQ0VROUZBV1ZoNWpO?=
 =?utf-8?B?WHJXZWp5MlpheWx0dEpsdWw4V0xCQVJwdnNGMkYvVDQrWnlYdzhDOU1YWU4w?=
 =?utf-8?B?VjBIcGpsZzVZMVVWN0ZUTk9Ca2JFd2Jqb3lsWFZBMEFob2VmMTRVV0lrNU1Z?=
 =?utf-8?B?bjZiWFJHemk1Uzg1eEVhL1JlZ3Jjc3RFN1ZBZU9yME95M0dtL3Jqc0Y5VmFs?=
 =?utf-8?B?V3Nwbkt3YWRWV3g5RVk1dDRGbjBza0Y4dVpyc2VvWEFVMzFiTWRNeG5ES2ND?=
 =?utf-8?B?TjRwWHVsYmdWbHg5NXRyNUlheE1RTnV4TjJzMmNzdTNoOUFHMFdqeHUwd1c2?=
 =?utf-8?B?d1VsT3g1dyt4b0tSb1p6Q1BXY2tvQkNueG9YM1NNa0tVOVhlcHQxTlovSThM?=
 =?utf-8?B?blBzMnpqMFUxMHpjSTlSYTdXLzdBRnVnY1J3N1VKZDRoem83UEpjWWZpOEJk?=
 =?utf-8?B?eWRVdEY3Y05nWktMWCt6K2ljckJta24yTmlySnVZVzdmZU5FWCt3WmI4MkFR?=
 =?utf-8?B?U2FIV1pqVCtMTklSYytxTEgwdi9iWXVKbzlxUUcyOEhINFNNY1AyRVc1UkVO?=
 =?utf-8?B?NUErMDBINVZTaW9LZU5udWpZZ3lRdmxaR2pidWczUEsxN3ROeG5YVVMrVXVN?=
 =?utf-8?B?ZmM4R1J4TUdtOTQ1Zm9KakNvSEU5VTl2eEcxRmE3ZUJvWElsSG5UQVphZlV4?=
 =?utf-8?B?WXN4b2ptTEI2a1hwSlplVFV2eThzeWxHOXFOWW5KZGhibjM5MzBHMlRCNVNE?=
 =?utf-8?B?Q0h3WUR2ZUdyZGVZQW5CMzlTdE9QZ0U3eVhUNGdzNU9SWXN3Nm1CdzlYemwx?=
 =?utf-8?B?aS8vbkc4YVdqMG5BdjhpK2lybHNSaTBoTWVBcDRtNS94c2UxQUx3aU9nbXhD?=
 =?utf-8?B?cENtQVV0NU1sWjg0VTVsa1ZNYjd3S1BrTzhpWmhwbTJWODBUSEplUHJieTA1?=
 =?utf-8?Q?FwUx86nnbryv2At+M4ClFQSGK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7498ee2-c246-44b3-f008-08ddbaa87f7f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 03:11:41.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+QyVTF8zXifymsBYTvs36FNhbQu90HVpsyvKieIYfafPbRZQkmhxfCEtUQxOdjE3vvAOzmT9lQlrrwx8RFx8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

When the Linux SCMI agent is suspended and another agent sends a second
suspend message, the Linux agent wakes up. The expected behavior is for
the Linux agent to wake up and then suspend again.

However, due to a race condition, the second suspend notification wakes
the system, but the SCMI state is not yet set to SCMI_SYSPOWER_IDLE.
This is because interrupts (e.g., i.MX95 Message Unit interrupts, which are
always enabled as wakeup sources) are active before thaw_processes() is
called. As a result, scmi_userspace_notifier() runs too early and
ignores the suspend request since the state hasn't been updated yet.

This patch addresses the race by setting the SCMI state to
SCMI_SYSPOWER_IDLE earlier-during the device resume phase, before
thaw_processes() is invoked. This ensures that when the notifier is
triggered, the state check passes and the system can suspend again as
intended.

On i.MX95, there are two scenarios where the Cortex-A cluster issues a
WFI signal:
- Linux CPU idle
- Linux suspend
The hardware state machine handles power-off sequences, with SCP involved
in one step. However, SCP cannot distinguish between a CPU idle request
and a full suspend request-it only sees a generic cluster power-off.

As a result, the SCP cannot filter out the second suspend message. By
setting SCMI_SYSPOWER_IDLE early, we ensure the Linux agent can correctly
handle the second suspend request and re-enter suspend.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/scmi_power_control.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index 21f467a92942883be66074c37c2cab08c3e8a5cc..d2cfd9d92e711f7247a13c7773c11c0a6e582876 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -46,6 +46,7 @@
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/reboot.h>
 #include <linux/scmi_protocol.h>
@@ -324,12 +325,7 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 
 static void scmi_suspend_work_func(struct work_struct *work)
 {
-	struct scmi_syspower_conf *sc =
-		container_of(work, struct scmi_syspower_conf, suspend_work);
-
 	pm_suspend(PM_SUSPEND_MEM);
-
-	sc->state = SCMI_SYSPOWER_IDLE;
 }
 
 static int scmi_syspower_probe(struct scmi_device *sdev)
@@ -354,6 +350,7 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	sc->required_transition = SCMI_SYSTEM_MAX;
 	sc->userspace_nb.notifier_call = &scmi_userspace_notifier;
 	sc->dev = &sdev->dev;
+	dev_set_drvdata(&sdev->dev, sc);
 
 	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
 
@@ -363,6 +360,20 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 						       NULL, &sc->userspace_nb);
 }
 
+static int scmi_system_power_resume(struct device *dev)
+{
+
+	struct scmi_syspower_conf *sc = dev_get_drvdata(dev);
+
+	sc->state = SCMI_SYSPOWER_IDLE;
+
+	return 0;
+}
+
+static const struct dev_pm_ops scmi_system_power_pmops = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, scmi_system_power_resume)
+};
+
 static const struct scmi_device_id scmi_id_table[] = {
 	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
 	{ },
@@ -370,6 +381,9 @@ static const struct scmi_device_id scmi_id_table[] = {
 MODULE_DEVICE_TABLE(scmi, scmi_id_table);
 
 static struct scmi_driver scmi_system_power_driver = {
+	.driver	= {
+		.pm = &scmi_system_power_pmops,
+	},
 	.name = "scmi-system-power",
 	.probe = scmi_syspower_probe,
 	.id_table = scmi_id_table,

-- 
2.37.1

