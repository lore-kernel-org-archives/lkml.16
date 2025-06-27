Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49291E9B3F;
	Fri, 27 Jun 2025 06:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004346; cv=fail; b=p3qbLyLWPJ0fYOFgTp4mT/vml0gdChAtm6EBzDcJVkrjNifgVpyV0v/E/oUsp4x7lCWjN0kxJpOnkttoaXUGrt12kNTCuw83qzU+KsMvrRCNXmc3D9EIdGi5Ktqh6kCCzF2qmLXe/qGW7Nt9PhhcguaqSU26MXKmik3lgEXCHFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004346; c=relaxed/simple;
	bh=LbYVVpIGDyQ7Fz0rR3m/Ovni5BvR9jQTAo1iiUip+yc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E+L1VHPoq8r1Co153ttAbhuvSy6abfovGYw157HzDfahK2LaZ6xeMM/khq116FMbb++gg66n691A6tp1/ygTVxeqabXg2bftTuooFTjd7ABxrRaI6tNJLPn1+5Ud3igkF5Xz6l9K8gmU8IPspci87NPLpD1/EqirZF8izWicvjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QR+YpWW1; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QR+YpWW1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agvxIHaDTjOXqVrLCOHbQIbSrea6OEHL6WN/ym3V72/lWIf1PJl0oTFqzNun5yLn0PezABA9I/4yaDJTb7dFZO1za2EVMJUp99VNDlVJzHMwWariYgEDrBwo+rh73ngW8fgoqo+vVmw/cgaQm3xxNPRDZjfnd/5fnuTvVyW2t+ewc5UFdLIzTk+VKAVyu7XRvIHiYB3/ofY0dKXl/IBzSzJXqHyFoylxjZeeJplRvanhiXdebIbh8j3P6DAvBv3+Zg/B0+ujHPiDYEDhDLTJyVrqMRdh5c+m2oGl3wtZkwjLFfd79xZxdlSm0j0n0fzYyZzB4m4gcoiiGKendHPAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDWPdm1W25oHgi2TmQsF7F8J33kU9q7OaPvNZA0QkUA=;
 b=XYFGidizqWLi8yKojDW/nTIw9Fn7CDMIfaCDwFCuUGEz0Sb+7HxkJSzrMijMNzSoAZNMz6l3y0Zl9MdRcMjtwFEFZOmksnmfOMjYXDpb0KkAlLwVzuO81QZSr5pgAobWJ2fsb1lK3dkZ8NUZstFlCTP/plkRDSGsadb2141o7Dg+Nw5Rf4wImwJZiv4ZK6kY0L04YfLMmXjIQqZp3IduVjbrmuD/wmu+T7hFj0j46K5XnW8/JE4nXVUGumjteSxEQM9K9+pCqT1BArprC5ebv14hCp8yA035Tprq4nikwT3myRJNigrDM6vDRpnHcT0E1QxewhX1OTdmXPkR6oOJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDWPdm1W25oHgi2TmQsF7F8J33kU9q7OaPvNZA0QkUA=;
 b=QR+YpWW1Pdjz+E1qc4YkIzpN2pgcm6fpMEY/Wf5IKOoYy+fD2gToElQpxtEa6SZRuPQGBLHL6SpvUl1FiIYln0sO2op69IRe36/4HwKq7Q+vr/VRFXxm7RwVqLISw3J1aJijwwYG4GgDipeHWMhTJnxhVcwcP3Jv0MMl5RphgAK0T3w9BDFnaXUQ5YHqry6oyoKuq2SQ+LkooBL60IBwaANSyA7nZVEMbMsvWB4w2vWDc+OhDSeq7gsG/yhgckuC4MvdToUBPvmcgiCNNcHUdzxHWzkSMaZt2VwZXzGqAtEx4lz8jZypZvOp/ZwrM2NkXwWRPhTl5gsy5Nha/OI6dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 06:05:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 06:05:42 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 27 Jun 2025 14:03:44 +0800
Subject: [PATCH 1/7] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
In-Reply-To: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751004238; l=2025;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=LbYVVpIGDyQ7Fz0rR3m/Ovni5BvR9jQTAo1iiUip+yc=;
 b=cNMTZaafDRNqkIDJKzHn6zvVm+DU8vdHN5Gvc+DE3is0LCjubR53LZyUTkcwYbWY4md+PkioG
 iGhk/S8LUC2DrX7/da6tlx75RddaQBJD0JMvDAejmplokBCQh9ojcuy
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a5b5b2-b511-4c4b-afc3-08ddb540a5bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YytZZHNZelRvTXFiN2N3bDZYd3p0U1JRQlJSOHRXc01ZUUFKY1dGajhBcEhT?=
 =?utf-8?B?Qm9VcjQ5MCtJNGltV1FDSVVLQjFrVjVJakkrV3JzWElYR0R4N1RRdnZuNnc5?=
 =?utf-8?B?K29HMk1LTlNqbklsVG5LeVpneXJjM3pUYTZwcVRnRk5uMXQ3MDM0dXptY0xV?=
 =?utf-8?B?THpsdFBPbGNyaHpldEkzTWlmclhhbkJRU2UwRDU0SUVBak9jVjZ3bjBXL21o?=
 =?utf-8?B?bXkreDNRVjNLalpLOUMrZ2JvdEYrZzN0NERtS2ZwaUpiK2kybmdTVy83TlJP?=
 =?utf-8?B?aWFaVVdCU21GcHhnSXEzakFLcUgxSEJ3U0d1UTVDMHUzYnIvMXJhVGdyT3Qx?=
 =?utf-8?B?OHY0R1Z5c0V6emE4cXBjS0RPeEx0YitBK1FYVS9YOUZuNGxsU0Rtd1kwakFk?=
 =?utf-8?B?SFJVNFltTjNuclpnTzNMelRWaGNUOUlMY1hubitrQy90WHBIMDEwMnlhSURm?=
 =?utf-8?B?WWFDQkFJbitOSUNhb0RlaDR4UG9udzlVOGdwdnZGY1ZwMDZkVlBwaFVXa2hY?=
 =?utf-8?B?NTdKUGtETDQ1QWF6UHZJdkdmaEhPLy85OFM0UUM5T0hzZU1PbmZqSUN0dTIx?=
 =?utf-8?B?SDNZRVdxU2dBbFRBS3RybmZjOFMyenlQQXhtOHB0UG5LV1lXVGNFTVdEMWYx?=
 =?utf-8?B?c1lmNXBmMDN6UFN5NFdORmhkUFRVMnBRakRETVljamRvSWdMVk13QzBvVmRj?=
 =?utf-8?B?SzlPUGRBVmpQS0xWY1AvemhLWStRcVhMRFkxeWhCUnVvZ2dxM1VnckNCeDAw?=
 =?utf-8?B?dDdKT2lySzU0R1ZCc0hVT1lsSXBaOE9pUS81QXE0a2FiaGYzOVBoUHRUZ00v?=
 =?utf-8?B?alF2eXdFSHZvR08vbTVKYmZ6SVQ2TGk2Y2VtRW83MVQrUWZ2Yi9POVM2VUZL?=
 =?utf-8?B?YUtKL1JPVklPY1IrZjJza2NhOEVvNFRVQ2Zlekdsak9ZUHpsdmdBYkg3SEVY?=
 =?utf-8?B?Y2dMajlId2NySzFmNkUxdFFiMTNTQVZKUU9CV1Q1SGZyYlR1QktxdnlBMFYr?=
 =?utf-8?B?dEhxbHhhSEFZOUxKVUdzQ3lWZ1VCam5VU1hXeWZtd1JsTkpqZ0ZmVnBVTENJ?=
 =?utf-8?B?TGY3WVVwSmFwOEpFN3pvSlJKOUpJdWlJdVJTc0F1ZXFyaUNiYm13U0poZWdh?=
 =?utf-8?B?ZjVZODlLcDAvbTBDSnh6UWF0YVV2TXJOTzk0dkZnRjhuQUhIR1JSWldwMk10?=
 =?utf-8?B?QVlkczQ2NGEvYVhNUUs3MThpaGJBdmdJWnJVdXRtcVg3ZUlaWWtDZVVXOWdl?=
 =?utf-8?B?QzN3M3IyQnIwV1Z6cDN5T3k3N3Q1Tm5mQjlDbDlBVTRIanhFRGdVUXBuVW43?=
 =?utf-8?B?bW9JVyt5S2FWd21OdXBXeDVGMnpyY3QvYllISTd5OGd5aVpGaExNd0wwa2Nu?=
 =?utf-8?B?MDFkeitPZGRGR0p3T1VEUXZyZ0VDakwxOHhPMTc1c2pyMWdwbGx6dnJNbjBp?=
 =?utf-8?B?N3Fha2JXc3lsSUZRR01NVFJrNDJqbnAzTmRYd0RuaTdzVjk2T3E5NkxZYlI4?=
 =?utf-8?B?Y055S0VyM0NNb0FMNlJvcnJyN2IzV0V3dzkxK09wZmFZMzU5NFozQ21yOFpi?=
 =?utf-8?B?K3gwcUZ2SlcxVHF3bUJvdDRwanlBVzc1YjhOSjNCbmc3R0pCL21ZL0dheFBi?=
 =?utf-8?B?YnJCak11SHNOeGYrbkg3NlU0am9Gd0lNdUhERnJFbkpwSTkwc1FnNVdZNytQ?=
 =?utf-8?B?L1BYQXZIQnZSQnBFOGFkZXY4UUl2UHdmVUZZb1BPZjNNUEoxQVZXbnhGUDFp?=
 =?utf-8?B?b2hHTkJUWFVibzdPMzRBUnpQMW5tNVpkbHVqYTNQRm03YzBibnJCVzhLSktY?=
 =?utf-8?B?aFFLa1k2RkMwMTh4djZFRmV1NnhWTjN0ck9KZ2V5T1U4WDZ4a3d3UmFtTFFG?=
 =?utf-8?B?c1JVVVBpYTA5NWlFOHNQNkZaSDdNUWtpV1c3WWNqbGk2Z2N4eUhvdCttcml6?=
 =?utf-8?B?UTQ3cU1LVlFaeWluSHp4QUgvYlBLZjFiTVJuRC92MUF6ZWZxMC9rN3NaeEt5?=
 =?utf-8?B?SVRxUkJZTkl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0pUZHF5dmYzU1dMZVVQaEJNejlSRVRMTWZHWEdSVFBwdmRMYlhmU1AzeUlw?=
 =?utf-8?B?Y25sZ1B5dC9CTHdubUExbVNrS0pvT3Q4eWcrZXQ2M2RmbHRnOVlFbU5hRTA1?=
 =?utf-8?B?N3RZN2RWRWs2RHBNN04vTTV5NGNSOEdNRWR1MkVESWVWWVM1OUhFaDJ2aW5x?=
 =?utf-8?B?OHBTM3hQMFc5dkpRdzFXc3VDVG4zTURGRHNEdGxsZExwMGN2cnlGZzdSMTFl?=
 =?utf-8?B?V1FkUlNLUE51UktNeHcwdG9FcW5wb2xqVCsrKzhZRm5xSjlvZEFPdVlUVk43?=
 =?utf-8?B?UGhFZ0VDS3lOQ3BwZ3ZYMmZ2SWdkcVdEWEVCVEorUWZTWFBFNHUzZDk2bkdD?=
 =?utf-8?B?QUcrR00xMFVVQXlSQ1ZEb1pZc0wrWHlsblloeXlma0VoZEVEZW5iMnhtUzVE?=
 =?utf-8?B?ZzJFVERwVi9GNFNldyszWGFnNHJ2RG9DMmRQd0pCaGVlb3F4emorTFBaWDlo?=
 =?utf-8?B?d1o3WkFqUWVHb2t0dmFzYlBOeHhqay9ZK0ZrVFpSd2RXVjQ0cHgxWU9oTkVm?=
 =?utf-8?B?cDVwWFd2NFVqTlZFSTNRN2ZoWEpRT1NhdThPKzZjTEpqcFZrWFhHaHVOTXBH?=
 =?utf-8?B?VnY3MzU3eDM4NFFnMncrZTlGQjNJUHdwcDRVbjIra05TZW9rRTgzUFBoRmZ3?=
 =?utf-8?B?TlpBS2F1VU1kek9uMUtyTlI3WWo3YUU1UW95ZXVyR3hJdDNvenRXYkJnWUtP?=
 =?utf-8?B?RWhaUFNhQ2FOSUVJY1A1WlhHS1c5N2F2aGdZZVlobHlOUkVvTlZLMWJvTzdI?=
 =?utf-8?B?dlJMQXNYTzdMQmo4MXk3eVEwT0JUZzlWTEtxTnBCZEw3dVl4anZMdzFoS0dC?=
 =?utf-8?B?ZU1paGdBSVNBR0tONWg5dHZHcm1hNGN6Qm9RazFYU1p3c1ZTU3lmVVZiNUtz?=
 =?utf-8?B?TGFSVE5ZMGV4WDVPRWh5THZuUGVuZVlxenc0c1NuRWx3dkdhM1JxcWlzbU9F?=
 =?utf-8?B?ejhwOGdhcW14UUJNU21qMDZ6TXRnSG14RVZZcVFIcTJIM1o1Y0ZpMEJwREdC?=
 =?utf-8?B?clgxeEcxT3AycXVYSWs5d3dpRS9IVnVjMjdJcCtKeW1Mbk9LZ29MZkFMNnFr?=
 =?utf-8?B?dktHeS9wLzJ3TlJza1hDRDBIYks4VDdXd1RjeW5SVmEvaTJQcSs5bEdrWDFJ?=
 =?utf-8?B?VC9YMTBEdjVNb1ZndG1seFpubERJbzJTVGpFZjhidkFHbjBaMlVaUitkY25M?=
 =?utf-8?B?N2JSanYzSGt4OUkwOWJoKzk5cEk2cHh1YXRUMTUxZlhGOUVic3JWNTZOaXVP?=
 =?utf-8?B?Z3IxRk5TM1RmY0NoQ1VLTm8vVjM1U1FwSjFKczJCNlNGc2lKNSthRXhybmNF?=
 =?utf-8?B?ZU44eUo5a1l3WjY0RmNlakRONTlFanQxY3kyTllOUHg1dklLRjlPZEpoTU50?=
 =?utf-8?B?aHd4U0pPeXgyR01NOWxkbERxQmpQbVVTNXhlU3hiRDV6a0h5ZTY4RzhDNm5H?=
 =?utf-8?B?c3hiWVFPTUxMWWs3U3IvNzNzNkd3NjZIeVNGM0V2M2tBaWFEQTNMYVFudlE1?=
 =?utf-8?B?UXRkTW1Wb3VkdlpHZWF6YVlBRVBHd3dOVzdRK1ZGazFxdFFhVXc3b1hwZ3Qw?=
 =?utf-8?B?L1ZDNEFHZlJJWHJwVWltOUthclFTTTE1SjdIbEYxbUdWdGJ2Wm93U2l5YXBC?=
 =?utf-8?B?bGl6djNPYlVrKzZVczdXVUJpZzF2ckdtazNKa1FyVks3Y2FZbGRWSEw3eHdI?=
 =?utf-8?B?NFMyK0tVNGZZZkh2OGx4ajUrSWx4S0tqV3VTdHhzbmVpVDNIKzZ0VFdkb00w?=
 =?utf-8?B?L1lzdU9WdzBBWHhIbmtiS1BCeTdtQ0tqZTI2K1JQNTgwa0Z0OTFXWDZ6MS9V?=
 =?utf-8?B?R0g5U2ZQSGhnQjhhTncwSlg5V2VMVnBCRlVwQTBEMlhvMWN1UmczRXc3Skhh?=
 =?utf-8?B?WTFjeXVtRXdmU2xNTHBRcThwVFduc0xXL3pXeDNvQmthUk42N2xITDE5WWRJ?=
 =?utf-8?B?cWhzNm5Cc2NRbmhxTUFQMGlWOFZaZko4TWNyL005UFBvcXJ5bkRCdmErY0tK?=
 =?utf-8?B?YWJMNjBTeUVsektQWmVzNXB5U0hwdjN0cnpnVkJVL1ZNR3EzV3BWck1MeE9o?=
 =?utf-8?B?QjRXVW1iZlVJVHRwR2RKUHZ0aGZvUVhXWkNpMTRlTWV5aHA1cTcyU0F2ZGY2?=
 =?utf-8?Q?EABQGf1EjSz4ugN1KsqxxlY3d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a5b5b2-b511-4c4b-afc3-08ddb540a5bd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 06:05:42.1621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsU+HaoHWIhB2O4HsjEVEDZ8Bq/BBN+mKEhWamFbR+6ZovQ9ut2cV3d8q7hAdmRvQobznfC6pm7epWrKL9FsXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906

System Manager Firmware supports getting board information, add
documentation for this API

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
index 4e246a78a042a79eb81be35632079c7626bbbe57..ac82da0d1e5ce5fa65a5771286aaebb748c8a4e6 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
@@ -1670,6 +1670,26 @@ protocol_id: 0x84
 |uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
 +--------------------+---------------------------------------------------------+
 
+MISC_BOARD_INFO
+~~~~~~~~~~~~~~~
+
+message_id: 0xE
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: config name return                              |
+|                    |NOT_SUPPORTED: name not available                        |
++--------------------+---------------------------------------------------------+
+|uint32 attributes   |Board specific attributes                                |
++--------------------+---------------------------------------------------------+
+|uint8 boardname[16] |Board name. Null terminated ASCII string of up           |
+|                    |to 16 bytes in length                                    |
++--------------------+---------------------------------------------------------+
+
 NEGOTIATE_PROTOCOL_VERSION
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.37.1

