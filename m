Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3357B2DE6E2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544399; cv=fail; b=jtEhhty+taXd0IfEo1DgtGyw13SLjcix97pYEr+MWxFTcQWM3A8kJxt16biXSsrOZRhXjS+wCeBMDPoviMmfKNSKPyZOMOiVKxzGLD4/BPPNtmN1jMIOMj+uKBQ9C9y4v3+Nl0CaAySwux1p+vLBw4zKvJrX8Imok2sN+7mt+G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544399; c=relaxed/simple;
	bh=Me5HiwQVTF3tz9xK3cUNjsBupY5apVGrofzupen0prE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bMICBHPwuGJNOHuZZXHQ+zoynZi2pimA8x12iyN34G203BZlLxzu9keNeGsVfr/QVpKWQ5S6vPjh7YzXF6Vphr3+OQQ1XHQdPe7Oc8WlrksyD2ZCucahCgUcEKvaqlKm8B8bZc9Xm6x7N/W1EAuu5S7ZPq2vXS1UQWXLlNMy274=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=TP8uDEQG; arc=fail smtp.client-ip=40.107.162.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="TP8uDEQG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNrN9xwqJTINy/pkI7Bfdb9PyexFweaFD8PTC4kSkZjYmBHFZWSnho/8RhF+ScGFUMV0mngIdx4RKowXQ7TjmRNfhM2eVG6SGBI2SMWpnSn5rOgbx8tskTTtJkt7273T+oWiNiPZegFvxq/rz+Tq9mwe+aAksUTtXZCCIEbN8QfWivsqKB76GNvLH++a9dXg0u7RCUFQUdfYoCIpP91no6c0jq4bLibRiwqw7XldZ60knpXnnGCMjWmsMkT7Lxuq4rvXux4EOFPPulEvGQlVvf7JAfB16ExTSmW5//ESOkIY0tLcAFGEV6ewOU5+WRKE9FvNdEfxFr3bRQOm9B/vfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me5HiwQVTF3tz9xK3cUNjsBupY5apVGrofzupen0prE=;
 b=ZXpU4PepbyiNPpf1iscoqwBr4ZfarzYHB0G10khVSPgkkI93s0ZRdzs70fvAa1JgFPoYZjF3G06Z34zE+hnDr8XmGYzPQMPtcIvI9tL81ISGpXq8gyDk0JB7OhbZpaVQ3RnP8YdubsBek1Lj9krDqhR0Hw9SPF6gDXHzXG0jfYcSRD59xIcasi86kM/HGX6tvIXjyF8EjknVFWg5VeH1rWap6IJjbb9g65Bb8lhA7ye87TrFjLL3/wD9SBmv85YFBjqDu5289QDsBXQ7Tt0G+VlezVc+krjIhkL4y3Q/dRowFRk9q0aWlhNgGkiiOHX2w0jcxRwr034yua+ZllT7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me5HiwQVTF3tz9xK3cUNjsBupY5apVGrofzupen0prE=;
 b=TP8uDEQGDl+hPJkPZwpJK116xGoFfd3AFj3JXHuj4vfKGNlqO5i4wV0lPk2+8xGprrgl3RnNXIBTrrpICJbxVG76wv+Fo7r8+/vAJWwKSdy62cG8BFoJJvYY9QzqKvQonOq6uWZi4rCnYbcNptjAt2zZ2CMpC1QVI7PoytTCICU=
Received: from MRWPR09MB8022.eurprd09.prod.outlook.com (2603:10a6:501:73::11)
 by PA1PR09MB7095.eurprd09.prod.outlook.com (2603:10a6:102:456::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 12:06:32 +0000
Received: from MRWPR09MB8022.eurprd09.prod.outlook.com
 ([fe80::5df8:32d3:4ce2:2a89]) by MRWPR09MB8022.eurprd09.prod.outlook.com
 ([fe80::5df8:32d3:4ce2:2a89%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 12:06:32 +0000
From: Pnina Feder <PNINA.FEDER@mobileye.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
CC: Gregory Greenman <Gregory.Greenman@mobileye.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"mick@ics.forth.gr" <mick@ics.forth.gr>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Subject: RE: [PATCH 0/1] Fix for riscv vmcore issue
Thread-Topic: [PATCH 0/1] Fix for riscv vmcore issue
Thread-Index: AQHb6bF9AUItOUMT60yWUyKX5Kaa87Qbs8gAgASRTrA=
Date: Thu, 3 Jul 2025 12:06:32 +0000
Message-ID:
 <MRWPR09MB80229B89C8D4B4865783B3D78F43A@MRWPR09MB8022.eurprd09.prod.outlook.com>
References: <20250409182129.634415-1-bjorn@kernel.org>
 <20250630112309.97162-2-pnina.feder@mobileye.com>
 <87jz4txsjx.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87jz4txsjx.fsf@all.your.base.are.belong.to.us>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR09MB8022:EE_|PA1PR09MB7095:EE_
x-ms-office365-filtering-correlation-id: d9236334-9122-47dd-4fa3-08ddba2a0cf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXByYWhVOE5iNUZ0dU90bDhhNFNVbGN2ekxuMUhWRlBEUVJycUV5Y3p2bkdZ?=
 =?utf-8?B?YkdPb2JmL1RLYWxpTkJFUi9yQWV3QzZDck9pQzM1Y1hYNWxpQUlCckZyUHEy?=
 =?utf-8?B?ekF1ZGxyQ28xckV6d2QyNEc1elZIbUFTUnF3UjErb2FBRXVHcWhIR3dESWtp?=
 =?utf-8?B?SHdZYmZGQlNPZDNXcEExc2JaN1UxWFpjcFFTRk5NVWVqVkdiVnp6N0NzYzRu?=
 =?utf-8?B?cTE4eEtLSDJGUjd4ZHdQV0c5MjByeDRrKzh6S2d4emVTVTNtK1Nna2Z6aUVM?=
 =?utf-8?B?NkVBTHI0T0t4QzdMeVlDSG1qYjZ4bHZIQitsblJrbEFkWFN1eE9GOXlzMENU?=
 =?utf-8?B?eDMxQUxXay9jRG9jb1J5UDVoaTN1R044UytCLzNYU1ZVQmRNVkVXK2hJV0pv?=
 =?utf-8?B?RDIvQ2RYMHdvaGc4Rld2ZnBxSkwwWVozZUJmTWlFOGhxQWc5cHpmWnFkM2xF?=
 =?utf-8?B?ZlZ0MEhSVFMvV21RQ2NmbTZIbVJYR1BJemlqZTJkdkEzU085ckJNS3JwQk5U?=
 =?utf-8?B?QXc2MWpXYi92MktxZEtWRkhydGkxM0xjVHNwYmU1dEZBOExuZis5aXNvTmFm?=
 =?utf-8?B?ZVNsem8vb0lXWHZwWDVGckQxT2ZpZEQ4aXd6Um9GbEptWHo3WDlZdUJJYTdX?=
 =?utf-8?B?RDhnb09QMlcyRC9XY0orYmxjdTUwS1pNemVpTEVnQ1R5Z2hpWWhYUkRhWS9W?=
 =?utf-8?B?bklGc3ZSSXJSdHBsZVpBSGZzN2lQakJKcUhrSUIzbWhUK3FSNDV1VldCVFc4?=
 =?utf-8?B?VG12aWxVc29MV1FJTWJFQ3ovaUJqVnVPTm9wMGl0cFRIUUU1Z3g1RXpzS0Rv?=
 =?utf-8?B?MUwwd2puaGJrelUwNDRQOFVmanFJa1M3WDFFOGVidmpqTS8wUFEwN2E0MjRB?=
 =?utf-8?B?Zis4eFZtZ21XZkMyNnQ5UHpDbThSSERaNVJRdFFBRVpXblhkYUNHR0VISlg5?=
 =?utf-8?B?eDZrZlk2WGhoS0tVNzlhTGQwUTl4RW9lSFRSd1Z1dit1UXo5a1IyT3ZndUE0?=
 =?utf-8?B?TGxpaWJXcGxsa0UwQzkwNUdidXg3T2dIUTIyUGUwaStmWmdtT21nbVFLUXhL?=
 =?utf-8?B?QzJiSnQyazg1ZWZuNlR0cHFSUE4ySC9RNmpyRU9PN2xPL2hCQ3ZiUFJ3Z3Y0?=
 =?utf-8?B?S0VNekUzSHRPT2dxSFo1OXpmUnhPR1pOajlxNmZQNGROMmRiOGZIcXBlUWsr?=
 =?utf-8?B?ZitLTVBqcUNtR2FMMjdndHdieU9LeU5BU0lxeWZNSng3ZS9kalNNV085YW4x?=
 =?utf-8?B?OTJmKytHanJkVm1MK0RSamY0ajQvaFR4eGdUMkdhVlZqNWN3dHZ4TFVmZzVu?=
 =?utf-8?B?U0l0cU1xNmJzM0NqZFloQnRXVkFMQkJxc1NnWWt5ejFlS2dldXVYVithYUVK?=
 =?utf-8?B?ZitQaDNqdjNBTTNZcnhhc0NHeWU2VktYS0RON3o3NjZxbTFJcStBSm5QdGY5?=
 =?utf-8?B?alN0TUc5RHFHREk3NmtZaDBrZjUxZFJwdmF4bkRiQXpZd3ptTFdORFFUazA1?=
 =?utf-8?B?clNzcWV3eWxaNFpBRXlBT3dFMUhzWTdnMlpZaUVxUldMVVBuNXRWUmlmdmFX?=
 =?utf-8?B?U1ZyeTdmenIxY2dFd0cyUjB1empEWDI5S3lFOUNHRHQ2RWV1T3NjUFRhNlBV?=
 =?utf-8?B?VUhXdkpTdUN2YklXN2lWWE0ySEUyZklrbFpmZmdiNGZ2UGsxcnl2VS9DaVdn?=
 =?utf-8?B?ODhmNWlCK3ptZm1FTlFvZDVQWExJV0ZvaXZrczc3QWQ5TUg2ZkFIOUVGT0VU?=
 =?utf-8?B?N05ydTB1eXpLN0hqYUtBWGQyWE0xQUZjc0IzNXRzRDFERG42RTUyRzIwM2Nn?=
 =?utf-8?B?N0xqZURGYVI2QUVKc3FBZDNjQ3lndWVEU2JxeTJ0Z2VETUMrd0N5ZEZlVklt?=
 =?utf-8?B?R3h4NkJrUWtYdmFMaEhMQk1OenBaWEN3a2ZrK25rb2ZLU2xXUzQ1MjRvNWxL?=
 =?utf-8?B?dlpvbHdBUzVGUkVvaWhjSlJTN2VoVFI0ZWVzd0FKZzc2OWVhajkyc0lqM1c3?=
 =?utf-8?B?U3NSaDd6U0t3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR09MB8022.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmVHK1JYZTJQQytjK3BJT1FnVE9nc2xtdE80cUxZNUZjcVZNcDI1aHRxK2M4?=
 =?utf-8?B?b2psVXFwMjFDbkFEMHlDZTZRWG1iOGZTTEFsb0NHSHRnVWJzb3BUQlo4OHVB?=
 =?utf-8?B?THdkcGZYQnYrTFpOcnNEZUorUEFvc0VsS3B4VzRqVmtNby8wUFZaVGkxWWVJ?=
 =?utf-8?B?NVJoVUZGZWZVUW1rUkN3SnVGVC95T3FZeGczTTA3YzRmMVQrTUFyeHZ5VFhs?=
 =?utf-8?B?dWhaUEx5NXN5c0tQV3o5ME1zUEk0c0pLendmV0d6K0ZaWUs0MWFnM0NMZUVy?=
 =?utf-8?B?VEFyVnN2WTZrdFpEUnZDQmhBUTdLOGxYY2gwbGhINk9CZDhBa3B1UEJWRHZS?=
 =?utf-8?B?N2xKWnd5NXVVMlkvamRkaEFYZjI4cVBTU3BMbGY5M0ZzYjVxdG1ObTJWTTFo?=
 =?utf-8?B?dEl2cStvVG8yclkwSFJSTkFqbS8yTkVxUnZhWnhrQTlGekQ3QzdTM1ZxcitS?=
 =?utf-8?B?ZGcybk9UaDdUSkM4cytoN3IyM0NySXdRVlZBL2lwZGNJK05pSFdqcyt0a011?=
 =?utf-8?B?NHo4RXJ0SU9VaG1xQ0d1cit1aUpBZk5lUFNQcmc2WUlwU1VUUmF6M1NlS0Vv?=
 =?utf-8?B?cEZac0dtZXFvQkx0KzBBUDhuMlYzbGxVNkx2VHJ1eGJJeFZrRm1SUUNybmZE?=
 =?utf-8?B?NllZc281TkpZNHJCNXc1RkVNZ21JcWdjclBYOHMrVDhiQkNHTTVuZmZoa1Zq?=
 =?utf-8?B?dk5tdE53VndlUmhSUHl4RlZQVlEwWW1heGhGb2lqQ1BnUTlNREN6VTBrVmln?=
 =?utf-8?B?cUFLN0RnOHdhS2lBVVgvWUE3WHpIUzUzYUtoQ2tOUVhNd1ZjazkwWTFMNDU0?=
 =?utf-8?B?QkowZVd1Y0pNdEN1T0V2WVB2OHhmUkV2bFpERi9LckxzUU53K2NaK3owRzV1?=
 =?utf-8?B?Nkw3TUQ2WUNlaTI3SDVGSVF3SnAybXdZN1ZSdUt2cStZY0ZSM2F6bnp5dTlW?=
 =?utf-8?B?SnNsellUcUJYTXNiL1h1QUVjUUR2dVo3QVBMZVhYNjAwa244ZVdjZW5CNkJk?=
 =?utf-8?B?MGxacVhEd1kyaWNqcmdBWndwSEtyL2owL3diOUUrQ3c2NHA5QUlrUE1JSjdK?=
 =?utf-8?B?a2dDU0VCTTBnUHJSREJzR05FcGF0ckgyMU05L0YwNjhLUllvVUhIVDRlalhK?=
 =?utf-8?B?NmtkVzlnN21OcXcyWHd4WVdybFJPUWhQZzJkSHA3cUh6VDFXeWQvTTlkK3pT?=
 =?utf-8?B?cUUvY055c29aNTVNam54QVVIWFQ4Vlc2bVRIMnFQUG93MnVIWE92L29HOEkw?=
 =?utf-8?B?MmFpZnBKNHJLOWtkZkhjclZiMm56Z2lXbHlpVE5ieDV4NUkybDhON0JSVWxl?=
 =?utf-8?B?OVZEQm9vUGxJYXUxTndVYzFvMnRlTHBOdU56cGNpRWwvK2h4ZlFLeXJISVdk?=
 =?utf-8?B?dlNPbWNRUlZQa3Q0RFBFbnhTa2wwdURKVTNPdGVNWmxEbXdiL2hOKys2citi?=
 =?utf-8?B?dGtGUjM1Q3J0MzF2czF3MFpDcUdwc25XeDhkWStuanZHU2t0WFJReFRFV3A5?=
 =?utf-8?B?TktLajdSaUQzd3RoMUJrTTQ2Ym1ycUtGNW1wTlBNMWc1ZkJFdzNoLy9uRFBU?=
 =?utf-8?B?dVdOS2kwY2ZYemF5YWU3M2VDN2c1Z1U0WlhJUTZkQWpiY2J6RU9LT3c3aHdq?=
 =?utf-8?B?YUszbDRyemo2dG02Ui9kSVNLM1gyU1lraENnM1BHSml5cDd3NVlVWUc2NlRs?=
 =?utf-8?B?Q1JtVVBPVk5hR2lIUnZkR3lJbitPRVA5eWxZaXVYVU9LS2YyZEY3QkdhRmFi?=
 =?utf-8?B?eFpaenpHVlNSbk1IbnJNNCtEWG5jUDRUN1RQRk90WEU4ZnI1c1gxT2UwUEtY?=
 =?utf-8?B?OUJTSnJRWUMwTTdYSFpocmZyZ1ZQQmUxVEZMamxwOE1QbVB0enV6R3MrWkQy?=
 =?utf-8?B?YmtDb1BucnZYNW1TRTRUK3VxUkR0cGg0V2RnVGY0RjZ1S2hlNlMxV2V4cmFz?=
 =?utf-8?B?Nm9KdFJjN0VqeWVSaHhPNzNMRjVhWXN2Z0NlRWZsejRTNWdZL0FlLytrVkhQ?=
 =?utf-8?B?SDJ1d1B3ZmpQMUJiUXBkQm5saFBFS3Q1bnZIYzdKTGNHQ1B1SnVIbjhGN1oy?=
 =?utf-8?B?V0FrbE9yOXNOMTdDdml6bm5CZExXbG95b2dhSmdXclhWTldQUDJYR1A0VWhG?=
 =?utf-8?Q?wXhIrGS8j4+Yltr8p7nDZCda1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR09MB8022.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9236334-9122-47dd-4fa3-08ddba2a0cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 12:06:32.4901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zyZtXbY6q4hnaRBS7Y19B7c2sowJnnrs0jp2pB8s0s2C39hvR8R/ONSwMpemWT7ujCpEkoJKyAcYKUtAgHZgVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR09MB7095

PiBQbmluYSENCj4NCj4gUG5pbmEgRmVkZXIgPHBuaW5hLmZlZGVyQG1vYmlsZXllLmNvbT4gd3Jp
dGVzOg0KPg0KPiA+IFdlIGFyZSBjcmVhdGluZyBhIHZtY29yZSB1c2luZyBrZXhlYyBvbiBhIExp
bnV4IDYuMTUgUklTQy1WIHN5c3RlbSBhbmQgDQo+ID4gYW5hbHl6aW5nIGl0IHdpdGggdGhlIGNy
YXNoIHRvb2wgb24gdGhlIGhvc3QuIFRoaXMgd29ya2Zsb3cgdXNlZCB0byANCj4gPiB3b3JrIG9u
IExpbnV4IDYuMTQgYnV0IGlzIG5vdyBicm9rZW4gaW4gNi4xNS4NCj4NCj4gVGhhbmtzIGZvciBy
ZXBvcnRpbmcgdGhpcyENCj4NCj4gPiBUaGUgaXNzdWUgaXMgY2F1c2VkIGJ5IGEgY2hhbmdlIGlu
IHRoZSBrZXJuZWw6DQo+ID4gSW4gTGludXggNi4xNSwgY2VydGFpbiBtZW1ibG9jayBzZWN0aW9u
cyBhcmUgbm93IG1hcmtlZCBhcyBSZXNlcnZlZCBpbiANCj4gPiAvcHJvYy9pb21lbS4gVGhlIGtl
eGVjIHRvb2wgZXhjbHVkZXMgYWxsIFJlc2VydmVkIHJlZ2lvbnMgd2hlbiANCj4gPiBnZW5lcmF0
aW5nIHRoZSB2bWNvcmUsIHNvIHRoZXNlIHNlY3Rpb25zIGFyZSBtaXNzaW5nIGZyb20gdGhlIGR1
bXAuDQo+DQo+IEhvdyBhcmUgeW91IGNvbGxlY3RpbmcgdGhlIC9wcm9jL3ZtY29yZSBmaWxlPyBB
IGZ1bGwgc2V0IG9mIGNvbW1hbmRzIHdvdWxkIGJlIGhlbHBmdWwuDQo+DQoNCldl4oCZdmUgZGVm
aW5lZCBpbiBvdXIgc3lzdGVtIHRoYXQgd2hlbiBhIHByb2Nlc3MgY3Jhc2hlcywgd2UgY2FsbCBw
YW5pYygpLg0KVG8gaGFuZGxlIGNyYXNoIHJlY292ZXJ5LCB3ZSdyZSB1c2luZyBrZXhlYyB3aXRo
IHRoZSBmb2xsb3dpbmcgY29tbWFuZDoNCmtleGVjIC1wIC9JbWFnZSAtLWluaXRyZD0vcm9vdGZz
LmNwaW8gLS1hcHBlbmQgImNvbnNvbGU9JHtjb259IGVhcmx5Y29uPSR7ZWFybHljb259IG5vNGx2
bCINCg0KVG8gc2ltdWxhdGUgY3Jhc2gsIHdlIHRyaWdnZXIgaXQgdXNpbmc6IA0Kc2xlZXAgMTAw
ICYga2lsbCAtNiAkIQ0KDQpUaGlzIGJvb3RzIGludG8gdGhlIGNyYXNoIGtlcm5lbCAoa2R1bXAp
LCB3aGVyZSB3ZSB0aGVuIGNvcHkgdGhlIC9wcm9jL3ZtY29yZSBmaWxlIGJhY2sgdG8gdGhlIGhv
c3QgZm9yIGFuYWx5c2lzLg0KDQo+ID4gSG93ZXZlciwgdGhlIGtlcm5lbCBzdGlsbCB1c2VzIGFk
ZHJlc3NlcyBpbiB0aGVzZSByZWdpb25z4oCUZm9yIGV4YW1wbGUsIA0KPiA+IGZvciBJUlEgcG9p
bnRlcnMuIFNpbmNlIHRoZSBjcmFzaCB0b29sIG5lZWRzIGFjY2VzcyB0byB0aGVzZSBtZW1vcnkg
DQo+ID4gYXJlYXMgdG8gZnVuY3Rpb24gY29ycmVjdGx5LCB0aGVpciBleGNsdXNpb24gYnJlYWtz
IHRoZSBhbmFseXNpcy4NCj4NCj4gV2R5bSB3aXRoICJJUlEgcG9pbnRlcnMiPyBBbHNvLCB3aGF0
IHZlcnNpb24gKHNoYTEpIG9mIGNyYXNoIGFyZSB5b3UgdXNpbmc/DQo+DQoNCldlIGFyZSBjdXJy
ZW50bHkgdXNpbmcgY3Jhc2gtdXRpbGl0eSB2ZXJzaW9uIDkuMC4wIChtYXN0ZXIpLg0KRnJvbSB0
aGUgY3Jhc2ggYW5hbHlzaXMgbG9ncywgd2Ugb2JzZXJ2ZWQgZXJyb3JzIGxpa2U6DQoNCiIuLi4u
Li4NCklSUSBzdGFjayBwb2ludGVyWzBdIGlzICBmZmZmZmZkNmZiZGNjMDY4DQpjcmFzaDogcmVh
ZCBlcnJvcjoga2VybmVsIHZpcnR1YWwgYWRkcmVzczogZmZmZmZmZDZmYmRjYzA2OCAgdHlwZTog
IklSUSBzdGFjayBwb2ludGVyIg0KLi4uLi4NCg0KPHJlYWRfa2R1bXA6IGFkZHI6IGZmZmZmZmZm
ODBlZGYxY2MgcGFkZHI6IDgwMTBkZjFjYyBjbnQ6IDQ+DQo8cmVhZG1lbTogZmZmZmZmZDZmYmRk
Njg4MCwgS1ZBRERSLCAicnVucXVldWVzIGVudHJ5IChwZXJfY3B1KSIsIDM0NTYsIChGT0UpLCA1
NWFjZjAzOTYzZTA+DQo+cmVhZF9rZHVtcDogYWRkcjogZmZmZmZmZDZmYmRkNjg4MCBwYWRkcjog
OGZiZGQ2ODgwIGNudDogMTkyMDwNCmNyYXNoOiByZWFkIGVycm9yOiBrZXJuZWwgdmlydHVhbCBh
ZGRyZXNzOiBmZmZmZmZkNmZiZGQ2ODgwICB0eXBlOiAicnVucXVldWVzIGVudHJ5IChwZXJfY3B1
KSINCg0KVGhlc2UgZmFpbHVyZXMgb2NjdXIgY29uc2lzdGVudGx5IGZvciBhZGRyZXNzZXMgaW4g
dGhlIDB4ZmZmZmZmZDAwMDAwMDAwMCByZWdpb24uDQpVcG9uIGluc3BlY3Rpb24sIHdlIGNvbmZp
cm1lZCB0aGF0IHRoZSBwaHlzaWNhbCBhZGRyZXNzZXMgY29ycmVzcG9uZGluZyB0byB0aG9zZSB2
aXJ0dWFsIGFkZHJlc3NlcyBhcmUgbm90IHByZXNlbnQgaW4gdGhlIHZtY29yZSwgYXMgdGhleSBm
YWxsIHVuZGVyIFJlc2VydmVkIG1lbW9yeSBzZWN0aW9ucy4NCldlIHRlc3RlZCBhIHBhdGNoIHRv
IGtleGVjLXRvb2xzIHRoYXQgcHJldmVudHMgZXhjbHVzaW9uIG9mIHRoZSBSZXNlcnZlZC1tZW1i
bG9jayBzZWN0aW9uIGZyb20gdGhlIHZtY29yZS4gV2l0aCB0aGlzIHBhdGNoLCB0aGUgaXNzdWUg
bm8gbG9uZ2VyIG9jY3VycywgYW5kIGNyYXNoIGFuYWx5c2lzIHN1Y2NlZWRzLg0KTm90ZTogSSBz
dXNwZWN0IHRoZSBzYW1lIGlzc3VlIGV4aXN0cyBvbiBBUk02NCwgYXMgYm90aCB0aGUgc2lnbmFs
LmMgYW5kIGtleGVjLXRvb2xzIGltcGxlbWVudGF0aW9ucyBhcmUgc2ltaWxhci4NCg0KPg0KPiBU
aGFua3MhDQo+IEJqw7Zybg0K
