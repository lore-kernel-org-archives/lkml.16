Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012027.outbound.protection.outlook.com [52.101.71.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDAA800;
	Mon,  7 Jul 2025 02:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751856344; cv=fail; b=r0DxQ+hfxsaGyz8pzPilR62tku81sA4SBrBPe7NBEd5gw8eh5pyBf5fjdYBpQzI6Xso+shgsR64ErJHLKt1TJ22moRrILe5Z5DIFx+swTaBKb9uAcgdvNvteOrbh9ogmCmz7dtDcLYPk6jFQDUfrZXk9nST19NsFHbwgvZV3408=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751856344; c=relaxed/simple;
	bh=jnq2aMa9TTVQjwzHDzynuPMAIBRbcKq+FgKY50N2wAk=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=kmtfKJWKjoSs7tRZR3RGe5ywQDoD82Jb054N/qSj9ZIlyWHMw0VyVEPF2LV7OGsVtC8G+L9xLxn2Vuyfe/fef1KxccOdepAb19XMP+GPxRFLltwB93ljkIqc9nvqedTt2HDtnx9cJULTExc8WVbHqOvAQr6Erdhm2nLYDot0n44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gj8p3oRs; arc=fail smtp.client-ip=52.101.71.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gj8p3oRs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1La+500af1Cu+HU5tfrqmd/CQOREjqfoVeB8mMGwsf5tqM5GgDX3Qh6UIazCmEeBKmsQlDowpAeUmmsWgbWWvyNjNdSVspln4R3hrL8nqTaGLEO/Mm0B6DBq3ACbvD92qDwyICFd3l67LQaCqwWTB630br7II10qV23B5qp+LsPaWuLU7AQh+5sRpi/0yRzwLQi3ezukjpOZanAX4CGl+ndJ9XE0E1dojfSHx4FUdUpfm1HsVp5aPy0kLRqrWA64yhvBumEy394xrItu18w9xJ/GQPmn11MdtIcEzfn/54h7VXGZu4oBOQmLIO2D+BPRBJq8YznVeyIuibTip0KuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EHzg38hcgeHdclncyTASJlD8/cCQ8fSc72VoVxnOe8=;
 b=j3KaEHzqHOeOAhAZcB+HucFz5OJfR6z6V813tUN2Tp87Qu6qs/nz1Z+xOiWl35DbTWhZXal1WXPrhik1WmsqHV0RmbpjrrZUuzlSajb5s7z/22kzeS4eyWGwP7HSnbMvTwpFwUTPWdKgH9P57H9sqtj8VvliTikhJtf0slJPnrhvS6G6ywWbxDiQi8HKi/0Myi+HtQjwHKGWXYK7Zw0QCryQgrAwarLPs4GAtWeYrFjCSEPkOO+jJgI2YmNgp6aYLt7z3RgPAuFgEeydciuLu+DUe8+bI9tYch8ExLWMefgbHV7XpYthAAlgQvCOKUu07Z/e7PtmccpvrX7DUV98UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EHzg38hcgeHdclncyTASJlD8/cCQ8fSc72VoVxnOe8=;
 b=gj8p3oRspITphaVZCr40wT2g3mciBEYlMFJMC1Hr460fQ6tUNhnUCwnkMNsVH21IfSESJ4koAwG835Lpr8yFjRcp75qBmIMHDsyvhS9ViVkwpchDNihe8kzoah8qtch4ygCLif/6Rsar9bTcAHguEN7tiJxmxt0+u+cOiHIHK9RRWav7nDhyN2Sr0kgSOa5FCKdmR4VE6DZC7tShX48ZSp3U57Dqahk7qa0SdmAl3xROszCpXwQ4blnXTfsL6XpPqj258bwEkE6FtlgFICqRogQ8ZkLLDCkQ7zzlypFcyOY7HgCWVQD8mkQJa2ngZKePM+yRBTUqOBFVaVUHJ10Enw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV2PR04MB11094.eurprd04.prod.outlook.com (2603:10a6:150:279::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 02:45:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 02:45:37 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 07 Jul 2025 10:47:00 +0800
Subject: [PATCH] dt-bindings: phy: mixel, mipi-dsi-phy: Allow
 assigned-clock* properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-dt-bindings-phy-mixel-mipi-dsi-phy-allow-assign-clock-properties-v1-1-5e34b257e1ef@nxp.com>
X-B4-Tracking: v=1; b=H4sIACM1a2gC/x2OSw7DIAxErxKxriVCPxG9SpUFAYdYpYBw1I+i3
 L1uNyO9WcybTTE2QlbXblMNn8RUskB/6JRfXI4IFISV0easBz1AWGGiHChHhrp84EFvTJKVIDD
 9K5dSeYFjppjBp+LvUFup2FYxgTOznU762NuLVaKpDWfZ+F24jfv+BdhHObySAAAA
X-Change-ID: 20250707-dt-bindings-phy-mixel-mipi-dsi-phy-allow-assign-clock-properties-a2f9b4031969
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MAXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV2PR04MB11094:EE_
X-MS-Office365-Filtering-Correlation-Id: b822b938-8b2c-4642-a5f5-08ddbd005a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTJ1enZNYUdEbVNkY3pHQlhWOER4UUdtWUdtLzAwUTVDZVJRL0VnSzU5NlFZ?=
 =?utf-8?B?OS9sTGRrWmIxVStKbnZEaVpYZ09qM25qa1RtWFg3S3NVK3JLWjY4MmpMVjRK?=
 =?utf-8?B?Sy9IUEtzVVI1SWJibTVIOWhnM0N6V3JobFl2WGtUckh3SU5JSlBDeUY0ZUJ6?=
 =?utf-8?B?cHl5Tmc5ZnVveVdlWERJMytiaGxjRldnSmNJL2ZxbkZaOStSRDB3ZlZhVEZR?=
 =?utf-8?B?TVllR1dlUWRQR3lFM09tNnArQlYrb21NM2hiOFJ3VmtodVpaNEh5c1MvRmt6?=
 =?utf-8?B?NTNGSDV6VUtaOWVWQmtlVlRZYStPNFJ0MTlERVV3S3M4NkMyV29aRXR2SzBw?=
 =?utf-8?B?SUlEaFM1RDhjeW1zQUxBQWZrY3I2ZUtyY0JsZ0lQM01mSFE4UEZKcU1xQytn?=
 =?utf-8?B?VnVidFFNN05mN2tvUVljQlcxTTdKMHRIcWZqeXo2MWwzRVc2b1FXcjVPeW5p?=
 =?utf-8?B?dDVpK0lTMGhKdWFzMEIwMzVRQ2k3dWpKUE9CU1N5cUtCbjBFSFkzaXowcWk2?=
 =?utf-8?B?cWJ6empRaU0zWllFOS9tVUt4V3VWZWtCUEZvZGU4c3NXMmtzc05jTHZWdnRv?=
 =?utf-8?B?NHlzcW5VcDZMYkNRY1BjRHlDbFFILzFlaUx3eE54ZlBGbHo1WmdlS0FzcGow?=
 =?utf-8?B?cGhtWlM3SzZvK3FlaTA5ZmY2dFMzaFpPZkFBd3E4RXNuM0tuTkZGbWdEVngw?=
 =?utf-8?B?SUMzdm9ibG44MEw3NnI5Wm94Yk56N24xckVmNGlyTDQ5Ym5XRExxbC9RSzE4?=
 =?utf-8?B?SEg5TFhEWitXdHlkUkZxdTlpNWVqNmtINEFndTR4UFFiWWNzRkdIc013dGJZ?=
 =?utf-8?B?TENzb2E2RzdZR2lZMmhQR3llYWExdTd3ZlRVMTB0bkdjWkxhUG5ReDhCd0hm?=
 =?utf-8?B?NXZUcERQUFRzanRENEJzRU5meGVZVFl3aWJiamRDSkFJWDREdUZ0Wml0R1RC?=
 =?utf-8?B?VTYzUFE0c1VaNFVHQ0hiYStmb1V2WkxTZWY3VnFPYTNuaWk4SzlwR05xVkpI?=
 =?utf-8?B?endBTVJxaGRmMnNESWxoTFFlUzhnanpMWHBURURUcFc1L2prOEZzS082MWFp?=
 =?utf-8?B?ektBZ0RCQjZqVmxTaUVjRXBoMFUrU2JLT0F2MENudnMrWlgzU21PSnc5V3kz?=
 =?utf-8?B?YmtONGFDQ3dXTjdKdEM4ckZVZXA1UXJRdkFQaXdTZFdIOG9NQ3lUR2IvL24y?=
 =?utf-8?B?ZjVEZVFlYk5sV3dKaVpTVFhFczU1anRidkVhUzdsaHIxK1lCRkdKR1NrMyt5?=
 =?utf-8?B?YjBYNHI0WHdTS013akFKK3RtWDFFOXhtdEFyQWJQdkxkdEFnUFF5OEZWRjhE?=
 =?utf-8?B?STNvY1FhNGhKMUdRZXhodVJEM3JwZWk2b3pyOGgzYlRDQlhWcWNMWmNGMmFX?=
 =?utf-8?B?cWkyeWk3QTd6Wk12WUFZRU9Xd0ppWjhvNTBETnh2QndwU3RMOGVuYUpRWGhG?=
 =?utf-8?B?eEJGTUtpZ2hVbk9sOVFUdkE0M3hEWmhWUHh6UUR1L3lUSitZMTJneSsydWt5?=
 =?utf-8?B?MVQ0TTQyM3NoVnFLZUJlaU0wL1hMMWZSUGRFWU9HVUlVVnlRcVZQRGdrYitk?=
 =?utf-8?B?djlram1iV1ZiZnN0NnRUZnBkeEN4K2J1cEhMWjNtckhuZnBBVHdra2ZjNDBN?=
 =?utf-8?B?QXRVenBRSWU1azJnTmNsOUs4T0lLK1liYU5JQjhzejBMYXRZaGxMcDZyTDB4?=
 =?utf-8?B?bmt3WGxaMmpEeUtVTVdhelh4L3JzWUtSTEVvS3ZoeHVIN0RjTHBKc0VHY1Fn?=
 =?utf-8?B?SWcySW1Na0taMlVCQU9PQ2UzTEN0cHFxNjlHZ2pNc1ZMSnQrQVFpTCt0Mkls?=
 =?utf-8?B?elFJSGE5WkhFL015WFpxNVRjYUl2MlFRQjRoK25ZR3UrWEZma3htbXpmaUNn?=
 =?utf-8?B?VFZwZS8wL3ZjbllCdGVXUXgwRWJ3eUJ3bHVVRmhOek5Sa083UlBteHZHRE9N?=
 =?utf-8?B?UGVZMzljNjlIcUFtMTVyeDlwREZYQXdWZHJpY3JOTGlrMElaaXVsRDdzdGV6?=
 =?utf-8?B?eVdVYm81Zll3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1FqSmV2M2VYSkxTbzY0U083bmMxQUVva1Q1azZMLzlEL1NQZ2ZPRXJlTURr?=
 =?utf-8?B?dVF1VE1HZnRvUVVaZm82NU01MURmSWl1UDZpY2VVWkRkMi9DTlRJYTh4VWo2?=
 =?utf-8?B?M3VnSHZDczNmV0JrWEhtVGpEQWdZY1V6OHFkN1BmaGNoR0g1bG1KTmNZdSsz?=
 =?utf-8?B?UUJrWkExU0dDc0NHc2JPTnFJUmsxdGhqYTNCNjVCdDZrNkR4Smh4YWdETDEz?=
 =?utf-8?B?NHRja0h2MjdYaEJvRUladzBXVXFrQjlpS0IrMXhILzI1MnhtVTlrYVhzT1l0?=
 =?utf-8?B?VmNpcHB5S1N0VlkyaFFacmxPcDkwNk1uMElDY3gwMUoxNXRjamZMRmF4WGs2?=
 =?utf-8?B?TEFteC9NNU5MbCsxMDg5RXNPa3k0bFZrZWd5MDVySmoxczBMZnNMUG9QR1ZU?=
 =?utf-8?B?c1RHNUo4b2t2aUF5ZDZVK1dCcFVOWGNmQjYybW9aU2txY2s0alhseHB5bisw?=
 =?utf-8?B?K01UcGF4R3hLWHZGdXJSMDlmSXlPU0xYeit5QmhPbW1nQzUvRE1BcmpDOEtk?=
 =?utf-8?B?b2lQbWUxVU9EVEpRckc2bkNENHpFOE5HNDh6dzVGVmRuZTFvUklVUEpxaEFr?=
 =?utf-8?B?NTBkWCtwOXJ3OWxudnN3TlFubU9ZV2FQWmRmblpBZGtuRC9zd0JWM2ZwZkIw?=
 =?utf-8?B?S2t4bkRiekhtenNlYUwydnZwQlRBdDB0Q0RobTA3TlhKcWN5SkVUcms5eFd6?=
 =?utf-8?B?YWZveDNmRk9pK3labUdEZ01jTGtXUGlkNXBidzIyUmk3WEpyNG1TL3B3SEN3?=
 =?utf-8?B?TWhJdy9SZTh4QTIwQk54dTBWZEcwbzBlZkp5V3lRQWVKK0EzKy8yNnpOZWNu?=
 =?utf-8?B?bTRSL2JTUWdON1dJTUpIVDFCMXFsRFpUWDlZREU0MFNyVllnUmFkekJqWDZQ?=
 =?utf-8?B?YndLT2l3KzNOTkx0eFVBOHg2ZnhST0gwcHBPeEEzZEZPcU5abmhiUTYrWVI0?=
 =?utf-8?B?NmJtY0pVcXkzZWdvKy91TG8vVytwbWdNb2xac0laR2V2YzliZjRQeWNqN1lW?=
 =?utf-8?B?VFFxMXV6NzRXeU1jdE81Z1lBYjhrV080dlRvdGtTWEZWejY3R1lna1pXRVdL?=
 =?utf-8?B?TDdmN0Y2UnJCcnBOSmVBYnBDdlArSGxsSkVZSHZjQVNmbFlDbmRnUTByUkU3?=
 =?utf-8?B?QTlmR1hTS25rNHNQazBDQnVPTlRPa1Y3TENzdnltSlNQZnIwbXU1cWRBNlA1?=
 =?utf-8?B?SVVOSFdYcHNYQmxweDJtQ1lhMVRFTXg2a1Y2ZTdUMWY4alNoY1B3T01iZEVk?=
 =?utf-8?B?a3FhUS9HY1pGMUhJZjBUQW1tSTM3S1B2T0lScHRCbTV3MUpHTjBtR0R4NHBv?=
 =?utf-8?B?QVYvSURhbENrYlltSTcwWlZ3UWhkRHFON2ZraUJjTW1KKzB2OEt6TlBScUNi?=
 =?utf-8?B?U3k0WkhpZmFrMWNtN3F1aEVvRFVFN0VWOFgzRXBJODBmaVlkVURXZ3RsbWtV?=
 =?utf-8?B?NGlHVVNIRDhRQjZKVjJPYTh4QXV6NGZtUUZ2aW9uRk55TFZTZk5FODdRQjRE?=
 =?utf-8?B?Qk5YanVtZXdmcmpHcDZUdWN3VFB1Zk90ZlRLMktGZnpFaFhyeHNFM3ZBUmZH?=
 =?utf-8?B?Q2R0TWx3UFlEdmtrMEdwMnhMQ0tCd3RhNkJaL0draXZSNllTQ1VydDdSVzhZ?=
 =?utf-8?B?cjJBZElFaWZlVno0d21rNzBjcmpDNklBTWJiQUpEOGsva2RkbnJlT2s3bmNY?=
 =?utf-8?B?QURINnJKNlhGYkY2ZkN4THYzNXFDNkQ4bmpRa1pnbzRBSGhBVGZ6NW11Z09l?=
 =?utf-8?B?U0c3SEdONGtnd0FVMllpbFhMN3pkVkFUdmJrN2xreXkvb2gyZ0NWc1A4Tm42?=
 =?utf-8?B?K0VtaHRrazlRWVY0UGN5dklwdnhRWTRqRnFqcmQvK0lhWkFwWURHdFhXNzky?=
 =?utf-8?B?aTI4Z3I4WWoxNUlTbUZEb2dMbk5YRmFOTjEwditHRWQ0MGNuNWFObGJBbTlX?=
 =?utf-8?B?U0RHL2xKazB5R3RiamV6bFZrYk8wU2poZHBJdjEyS1VHUm5PSzVZUytqakpU?=
 =?utf-8?B?OWRKOWd1RnJUcnlrazAzWEQxN0c3N1crTkZCdlA5eVpIelY3Y2FtVU94eVdu?=
 =?utf-8?B?RHJpSmNubE82a1VMUjh6dzVGbkhaMGVKSnRMZEx6eCtJYWVlRjVzVGxJYkJW?=
 =?utf-8?Q?9lEvZVRdUTm9dNaIW1iPwIKBI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b822b938-8b2c-4642-a5f5-08ddbd005a20
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:45:37.0158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhHcZpKRh6XpEzJNjnUSFc1MrDce7sSyJf1GEa6gKqWhAAh7QUvYcZIZhJYAtP6n33ReOnrbyE3e5oQNV3bUjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11094

assigned-clock* properties can be used by default now, so allow them.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
index 3c28ec50f09794b4df31c5b7f5e64eae92937a25..286a4fcc977d093c3829ba27c61f5182d6472e5a 100644
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -72,11 +72,6 @@ allOf:
           contains:
             const: fsl,imx8qxp-mipi-dphy
     then:
-      properties:
-        assigned-clocks: false
-        assigned-clock-parents: false
-        assigned-clock-rates: false
-
       required:
         - fsl,syscon
 

---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250707-dt-bindings-phy-mixel-mipi-dsi-phy-allow-assign-clock-properties-a2f9b4031969

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

