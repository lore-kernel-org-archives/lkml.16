Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B96A86338;
	Wed, 25 Jun 2025 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837762; cv=fail; b=WcvFM2RCpEteXy46FO2p49LBBvj9MLmocwOCJT0gCq0KTN6PoGLm9rbUGkNSpz2D44F7NLB+DRJLhxev+AyBZ2bYFqT3l8AGZpR6HkwJ7rYTc9quYhQXWYUwsLZtwgs9eW6w9AhZUab8HdNYsAuNYh12hhrIgWIl4/m+3YWiYbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837762; c=relaxed/simple;
	bh=3VgU+yCFN0zK0LLd7RvvrR5XDJ8pfZ7++INJTRgTchM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hnUAWmsYL96bwAlbww0ibRYPIamsJ/PE3qhspYCbwxbxsreBUAsoniKl1TkFewPg/e/GP4mJ4/cu/l1PuigX0GOVDvtG4RxPs2xjIiaG5ooGJsem7Il4NCKLC/n2RLqKtthPtdq0mlckl4SuszviHTWyGo2rUoBP1DlH0IMYs14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=gefY4Lqe; arc=fail smtp.client-ip=52.101.69.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="gefY4Lqe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPUG9Iop338oVUJHbysoUGJ0USXeKrxf1zoqCWMGn6ZJWgb6qy208YscpGdvYNchxEC8ETsLyEXlF/fpz52fK2B7j9bcDMHAT6ZZ3g1/f2ysSll/ygUSoKwEs5tKGTuZ37NT9xwwWRAgFZPQnNUpqy7zt0atIV7jm1TkRsud8X77M6RMqOkLPy0LAhowo/lllIEv3eRk2Tgqo1F8E7MggYGj5OPfdy6tm6bHnJgKr8gd2RDCjRiKh8CAnU9D68fnTIZJ8Vo/+3riNKRru545CivJtlRrr1wuJe7K6BgBH7O8UGy2mOV+H04eaeiYLA/E2vuH+ROuci0iVRNLWjLnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2yLOco17VTo3NXhbntQqWrz3s6ekjSast/15RkzDfU=;
 b=n9ow5C1HHt6yFhUWYZYfx5ypaE3Qb1EEI1QapgWuifQvkq+fqYpcnuKZbLf9/bV7yKuZW9n15xtwgvOOQ6iSkabvuI2tUcorPcY/x3asPhDxLqui81MIqt4QP8jkfyd+cdgVNS8fQgwnxcacHOWgZtT7rAvI6g/d3mQ+S4Lol8ntr3RDmToz0L8fIr0cNvIxM602wjO6I8c7GrZVkCAk3Za2yY67wxVIEaUwgEDAtenBIdKkLK/sdOYsnX2OZy2ObRZX4A6OYdSW7N1GpbOKCbRDz/RwHm+pHG7D/Ivic42TGf+b/oyNTXs5T09k85OrB05QpQsfgQQgXSB8A5vCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2yLOco17VTo3NXhbntQqWrz3s6ekjSast/15RkzDfU=;
 b=gefY4LqeWmZ4+yMZ+Q9Hfxe/0/GdK+DLBmilaQEWSZKuWmm0LA0BUB6ebiUqjLGpXZ2Ned3VJdzExBRo6mFtIGGTVHQ2t7ESsUW7Gd9n6dNdxJYGN2QTkLUzWEQ19HyAUgnfdSrsZDLZ7sYyGNHRT32PblrWwZrszcReHk0a2fE=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by DB3PR06MB9924.eurprd06.prod.outlook.com (2603:10a6:10:5c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 07:49:16 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:49:16 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3] usb: dwc3: gadget: Fix TRB reclaim logic for short
 transfers and ZLPs
Thread-Topic: [PATCH v3] usb: dwc3: gadget: Fix TRB reclaim logic for short
 transfers and ZLPs
Thread-Index: AQHb5aWmUjZFOtVUtkeAXev4dc6GXA==
Date: Wed, 25 Jun 2025 07:49:16 +0000
Message-ID:
 <AM8PR06MB7521A29A8863C838B54987B6BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com>
References:
 <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-1-a45e6def71bb@leica-geosystems.com>
In-Reply-To:
 <20250621-dwc3-fix-gadget-mtp-v1-1-a45e6def71bb@leica-geosystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|DB3PR06MB9924:EE_
x-ms-office365-filtering-correlation-id: 379e3080-4c9d-41eb-79c1-08ddb3bcc917
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NxGPlo+s2//TdTrIf8lLGh5EOmolqXL9Uf3e5flEapdQ45WbyO1F8kVq32?=
 =?iso-8859-1?Q?Q7TZxNtL2ifw3XxJbzz8w+ZxSN9/w78CubpAVykrlqXgqCnfzhYrDxZn4i?=
 =?iso-8859-1?Q?mDmIVIp7oebqkonuX5FNASulhQ23oTvZCDOMyeUruCeXcoxzIo/L2TFtpL?=
 =?iso-8859-1?Q?H+Zc8AhMaDCoN1QMkukD1heWn6Oxm/LPv8pj5ttlhE3PqkUUhyAr1/RwrQ?=
 =?iso-8859-1?Q?KK72gCiQN8ln8ULBAVQB5giG06rt+XlWw99riAC6duwgzFOGKJ6b2HYMzU?=
 =?iso-8859-1?Q?gvuIdhuvBPXLCzaYPHiWYnQvsAigOYr1h/rFbrfcyWGQ4RDZsVdJXSY8m7?=
 =?iso-8859-1?Q?MGHCBSG2cMJYQ5+dQ1iiTlyasTtWM8B585hLpkBXcmC/puyuHUOcfm2fHy?=
 =?iso-8859-1?Q?sJlLJT6tCZfslIci13VSrRKdQbUkd+MmEA8/+YAy6C4QJGpGI3lxzrh00V?=
 =?iso-8859-1?Q?N82MKCo/UM13lwnm7la7YYCtyLjpXbQz6E11btCa7mC4fLS9dfIO/Zdlwx?=
 =?iso-8859-1?Q?QjxO6916yfP68nAsXsmV9WaPlCNeWInGuDbIG0u4kbO3YDlf0VLnx0Kggj?=
 =?iso-8859-1?Q?RcaI6g617EC1yq682qo+fEmkQpbKS6+7z3YyGYvl32M9qv0g9vpnWvrw8p?=
 =?iso-8859-1?Q?DiMzDvRWDng3GN5gHpgYZWyGlEPAxnmb2Po7/nNlWOn+tJtuONnp+wtC4+?=
 =?iso-8859-1?Q?tq5T1HdNURWkLUoINvJP1WESTLZ24I2/B5xf8EKVRg+HhE7+igOUIbkWrS?=
 =?iso-8859-1?Q?ZGi623A4cX+U+CbbTYnNpXLRojqU9zRXKw2p7/rbLtMcBDLZKzseiVGWCl?=
 =?iso-8859-1?Q?veF9HOKiUXlpNDkx56RHqAIXaMmxcnpAin3w7UN/oN4ACzs2s5HToUxXdh?=
 =?iso-8859-1?Q?VFwcryAzbc4Cq2YSkVQI59WMpMD+D8DAzibyMy4NKTSKBPGC28EXaZQZvR?=
 =?iso-8859-1?Q?JBniVseDY9SRnu1RB0d9HbXu3g+ZXdAtVKOQafQMLRShzDq4P4oAavQ/v3?=
 =?iso-8859-1?Q?7xz/Cg0le6nJsp2nUIc7MsQtzvBA/80FvTtM3lnEJYLT7Ycamnp9VTSZqt?=
 =?iso-8859-1?Q?0N4ex7o8M634YB2Kz01O8y+SUNXlppo5HanYIsQJ1Ex976BMMV2wbdLdoQ?=
 =?iso-8859-1?Q?CZ+oyHnP9sWhZb2TyOu4r9gYuOR3mBAtJ5nDzor8iQslrHCeRUgrn2rERX?=
 =?iso-8859-1?Q?PooDQVyRf+zFTpj0uiuayLs3EGMrTRuP6K/C/1osXiJL3eVi7apHBBcjD6?=
 =?iso-8859-1?Q?KvMtIQYDxaifCcZJ6nwy9oCN7O106Rg65AdHIZ8XLw7qOopC3KsNjuBWhD?=
 =?iso-8859-1?Q?IYeIwfNC25RAdkZ5NmjDjZozhDcUnxLbnT5HZVUwS/j3P/P6l9YVULfcX8?=
 =?iso-8859-1?Q?UcSatwg4nu2uBGtlpqZJNKaIVrRYMCwr6FYNTq0CY9xyeacIsIFnWF8A0t?=
 =?iso-8859-1?Q?xHggWHxPdlKm4vo5mM5ZKnmNN4awc9ek75F/UA5znUtaMJOZawCnDP/9Lo?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?38gXygFQV7yj2HXamlV6jKe6gMaXeLxxEY5nugrKtGeUwbtM3biwGdVIbK?=
 =?iso-8859-1?Q?5xRoi9CnK6Vt8YxAglGHB3NehEq6qnYpGJ5kHrqxQrQHQr3tDNT9/ZWB15?=
 =?iso-8859-1?Q?F7Kl46z0CQH6sBiOuzO66Qk32nq9BqnocR3YDz7ZSnFAvW96Y0dnm5M193?=
 =?iso-8859-1?Q?UGqnaOESvSCkt7W8kpfeWb+RiJ1qSiSSRTMUKM2efVnkXCUmhYSTr2K6Lw?=
 =?iso-8859-1?Q?m3pOnAuk3HDbLeZ/keUFrb6XShe2ezgxmZEBZ8lnzbV2VrAs7qy1nPelQr?=
 =?iso-8859-1?Q?DG2w7zTK7ZO37YlEZ9HoJX5GWgWkjKzwnq2CoTHrqxbu/rw+ynnpRUPdMA?=
 =?iso-8859-1?Q?UjrUmJKfia2Mxwd4ymh99HoZp51ll5VgIyMw5ff27dFQK2kmjVPkBTlys0?=
 =?iso-8859-1?Q?tyxwvPNeM1QJpbFTv4DTH0FRJcAlT2dVXXdYZNxYXhgf9BRRcd0AjsabhO?=
 =?iso-8859-1?Q?Ub3dZzL8YZzjKlbfkaNQDrObj42/mF+ofyx5Po7oM5UEQnG3AgdrOPg9pA?=
 =?iso-8859-1?Q?QyO17mQQ+FHYpQ4RkonunB+Vd7QkHIavo2Cog3LDeRMoYptIRg6ISOkzC7?=
 =?iso-8859-1?Q?gbPdFWNb284tLf47XJsVAZaDCMwiDX0Y0Q9FGLnCGZmVnWA8d/+aXi3l2a?=
 =?iso-8859-1?Q?+A+DlgpR2NFLBsCle2DtDZ5w41Obc1iVudl9kwkdNMFEKMAPJb2Bn8JO/8?=
 =?iso-8859-1?Q?4mgJW351G3aBy7PcEHS9iX1fXCgT+tYYTlUCEgTbFQ+5NzGvUb+kRYQfLf?=
 =?iso-8859-1?Q?N02MTsWMp45jP7y9uKO2shQlAUz8nLkUg4nQGor00ul0EYEPWYPi2ztUyQ?=
 =?iso-8859-1?Q?ibJK5mNYyXn9TyjQ0/JW2gnZTRUhrpxJahHWiNRsMgfPhtQ6mnOXNj4i+b?=
 =?iso-8859-1?Q?w/CwGHr4oXK0W14vxIDRygLaByGuNeZC3MKVMW8I4HiM3wWCjRoM+3SqTJ?=
 =?iso-8859-1?Q?WcmbgGlbr7nrsDR5d/gyxWmwaDAhkqAmfwLCI6vuSc8/fzgefbdBni7bon?=
 =?iso-8859-1?Q?NopdhZ+BKliNxOyDoO5kFqa/r/vXwxn7SmOUbRN/HeZsDXYhmq3edFP1Gg?=
 =?iso-8859-1?Q?oIFmmGCGLfgnBpJRh0ggVbbi5DJFb2EAbnhQ47uAo7EkITdNx4UY6xVPag?=
 =?iso-8859-1?Q?pS/WmFmV2KjiL8iL3pCiIZwvSvwwXpo3uTR0R+hH9OTM5MvxGNb0FH1IOv?=
 =?iso-8859-1?Q?i7NSE7xINpmC3Ly2ZdvG9DYprjQTI78ZEOd/KKkhmGKVVkZOOw3vxtJPu4?=
 =?iso-8859-1?Q?tkL9Y4nKpS3FASuXWGTk13F6aVRrhFIHR35zwaCDPuI/YpiEWG3aE0nUtG?=
 =?iso-8859-1?Q?2b0AlB4DvzXKvo2qu2jrp7XIgKzhbUTdOl2vA3Bo+7qs7dKZtxImuLl1fD?=
 =?iso-8859-1?Q?6NQTeHl6wZb1oPt86J1XOwAECOTP0Z/CUU2niAa5QM2mxc2WVODXz36nF5?=
 =?iso-8859-1?Q?qQXozYOTYZ+ZhmWY9csytHDA2AP4WEWJ/NeLmq0pC+QVH9/l5eOO86FedR?=
 =?iso-8859-1?Q?wRO2V0fSknm9LzXbHKHplvwyidsR7ubGFqUxueZMOv2XBOW94aU6qYacho?=
 =?iso-8859-1?Q?4XCHeHi87JK8//w7U97Wiw1+OHETIdUFs/9kSSNTFqrOZ5ODU0GlUKFRF5?=
 =?iso-8859-1?Q?49C8t8YbnbCZZTXBN/C9ZWTJVON1aNPmQ+GVkYbtQOL6Y8PoRYohmdRVVc?=
 =?iso-8859-1?Q?mT7g/kpd8ucTeBu88BDEkzgqV7S3DKDhCIKuFy/PXc5HCNhOA/kPZSTXCj?=
 =?iso-8859-1?Q?WuvfYwF1OddbNWbVbA6imkMxs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379e3080-4c9d-41eb-79c1-08ddb3bcc917
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 07:49:16.4862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vV+ivnyRGCzLnhiWbyzw2xtpkqt5eK+DA0lyvaWTo+wURKckJzc6nxwgSrTok8kfi1LSVwdq2R2vgx+nWjrjPXDAyQjgZLWiUDEijFebjr101Cyd39rEyQV+UBrEKvsq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR06MB9924

Commit 96c7bf8f6b3e ("usb: dwc3: gadget: Cleanup SG handling") updated=0A=
the TRB reclaim path to use the TRB CHN (Chain) bit to determine whether=0A=
a TRB was part of a chain. However, this inadvertently changed the=0A=
behavior of reclaiming the final TRB in some scatter-gather or short=0A=
transfer cases.=0A=
=0A=
In particular, if the final TRB did not have the CHN bit set, the=0A=
cleanup path could incorrectly skip clearing the HWO (Hardware Own)=0A=
bit, leaving stale TRBs in the ring. This resulted in broken data=0A=
transfer completions in userspace, notably for MTP over FunctionFS.=0A=
=0A=
Fix this by unconditionally clearing the HWO bit during TRB reclaim,=0A=
regardless of the CHN bit state. This restores correct behavior=0A=
especially for transfers that require ZLPs or end on non-CHN TRBs.=0A=
=0A=
Fixes 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling")=0A=
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>=
=0A=
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>=0A=
Cc: <stable@vger.kernel.org> # v6.13=0A=
---=0A=
v3: no changes, re-submission as single patch, with Cc stable=0A=
v2: no changes to the patch, "faulty" re-submission=0A=
v1: initial submission as part of a series=0A=
Link: https://lore.kernel.org/lkml/AM8PR06MB7521CFF1CD8A93622A537EEDBC78A@A=
M8PR06MB7521.eurprd06.prod.outlook.com/=0A=
=0A=
 drivers/usb/dwc3/gadget.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c=0A=
index 321361288935..99fbd29d8f46 100644=0A=
--- a/drivers/usb/dwc3/gadget.c=0A=
+++ b/drivers/usb/dwc3/gadget.c=0A=
@@ -3516,7 +3516,7 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struc=
t dwc3_ep *dep,=0A=
 	 * We're going to do that here to avoid problems of HW trying=0A=
 	 * to use bogus TRBs for transfers.=0A=
 	 */=0A=
-	if (chain && (trb->ctrl & DWC3_TRB_CTRL_HWO))=0A=
+	if (trb->ctrl & DWC3_TRB_CTRL_HWO)=0A=
 		trb->ctrl &=3D ~DWC3_TRB_CTRL_HWO;=0A=
 =0A=
 	/*=0A=
-- =0A=
2.43.0=0A=
