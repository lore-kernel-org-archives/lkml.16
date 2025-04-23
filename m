Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2120.outbound.protection.outlook.com [40.107.22.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327CF217664;
	Wed, 23 Apr 2025 12:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410471; cv=fail; b=mvqnj1xWx8tK9mImOaFlIt9qseHDYayzhpKhdYKnJqYMzmDpjR4DW8iUMS6no+xljwbw1ZSUvCaFbL5/qH6fpay7KNrCKWbdfdospeMY/6kI6FUnUE5voK4fVtKeFgrJlGgFQRuA/bId15iw1WlN915STNpZpcfuRMqD5mNzESI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410471; c=relaxed/simple;
	bh=FCGptFyTx5qWsFAk3JmP0Uxoaf8lA4T5362+P3/J+G0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p/7N6CUPJGdidFJ0nERB44fWALAS8/nno3NIKsct+vV/OEJLmup0npRP8+c0UsAq8gstuIXhVwQNo28LgkRshIKkjUYZp1WZiYzRG4BKOEYF0lLAgXeCM8FzAmnYlnHcwwEVmm6W43gXdTCTkr+x6Qbt6qgoChSzvpZojyaL4fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=Wl1Vgw70; arc=fail smtp.client-ip=40.107.22.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="Wl1Vgw70"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKczxQWy+/9wXNdeNqhnMPJH/k+BB0ByvJRKhgrCDaJe25uexCJJB/CKvvj4ycofzGzJpOmCx1hyUPw74nOS57b45gwKbsLfQcdnKltxCO981ba+7w5CudtlK7GeeSJIaeyFQsh2zj0Wd6q7IL7G5gJrRs0zUBCtdOQtjmtiXsTjIRrxjGM9cIaZP8gnr5aEfZGW7GZWAYuzWK+lVPbqzOVuThdY7ugij7hnOLRJvRZ0XLQ/3sLOZVjJYRUSWYXrll7rJkl9k+CioeeK59NUc1x9o8balYFpA0K9KA0yHfLCtsSB1MNP5/ULyBLd3M0o+pHiYxZaQsIaqdjyZX/11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ve8lcG132FBIDKx8tGG9RUCXNbk1RshuMX4nvK4+wo=;
 b=R8WM9s0cXMORi22J/FME/XMKB/PP0iIzK6JB83A7tv9yZ7FMcIgxYagpMPsg/LoNpnSEeOsTUuttlH4PoX77tmmU+vYOQuUPhI4CFbfKjRnfJLdn2MY7h13qlHo2nEAE3BylPrjH2TBnOKM7b3+vvlj/A/iEKNaLhrU2KN2ctnVQ7JpRQnNwzoMeY/4rK7WitEuPJObepnhhq6K0J9x2djqKer2kgCfOhPFjvfpViafEZm32FuTGk7uNtSpEgt+LavY2D77/5UDKMKekNwi4b7c9AkuxNHrdXMPLg5F6zyZ28QkpOXBLho+qCadOMPeMNTUv59RKQV24SxCmjeTd9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ve8lcG132FBIDKx8tGG9RUCXNbk1RshuMX4nvK4+wo=;
 b=Wl1Vgw70RorIy1aQlbPgrLPHRNgtmrrXR7kV6IdAcWUEjtX0RI3MtqgeAcf07yeXMxsfmdmR2vQs/Va3CfV5GceBH5mTsOK1c5GgFGfO+TPifKzr7x4664RZeApeRJkHn1x0SwTmHTBHEsGHfadVvgl7iTJizghLiutoSpuSfbvLjuT3AbvKs+5qHXWOXihrLa86TljQrU5VQpaR5Q32cGTjeyqT2hsaL4N4pOqkDhSZbp4ljUH+KWJHNG4RYUEePqs02Wit/crKKslKlqLLnkP1eBpisPpPYMoI6nguOdYiQM6j19ASWJ8+67OtNyLBxNrO5JK1b5xb37iYlEqb9g==
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com (2603:10a6:10:47f::9)
 by AS8PR09MB5925.eurprd09.prod.outlook.com (2603:10a6:20b:54b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 12:14:26 +0000
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95]) by DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 12:14:26 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC: Djordje Todorovic <djordje.todorovic@htecgroup.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Aleksandar Rikalo
	<arikalo@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: timer: mti,gcru
Thread-Topic: [PATCH v3 1/2] dt-bindings: timer: mti,gcru
Thread-Index: AQHbtElBfdhbNmzjHUemgxt7b8uhIw==
Date: Wed, 23 Apr 2025 12:14:26 +0000
Message-ID:
 <DU0PR09MB619646561DF9B4F262F8B2B7F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
References:
 <DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
In-Reply-To:
 <DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Enabled=True;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SiteId=9f85665b-7efd-4776-9dfe-b6bfda2565ee;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SetDate=2025-04-23T12:14:25.903Z;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Name=HTEC
 Public;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_ContentBits=0;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB6196:EE_|AS8PR09MB5925:EE_
x-ms-office365-filtering-correlation-id: b003c7e2-47e5-401b-ec19-08dd8260642d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+neNJk6FjFymWR4O/ufMpPzY3zzerY2UMPbaDcLtNT1HBvQAkrE3kV99L1?=
 =?iso-8859-1?Q?WrXeaLdDa5TB7jbIordGMxkwSODcobjLdXRf2EeVswXxkD94F19UHO0xuL?=
 =?iso-8859-1?Q?lCU3znqVgN6A685n6Zr22kNCMJDSVcDQuelZr6jQO0NYUkFu4joBzB0QhD?=
 =?iso-8859-1?Q?D5W2KSQ6Yc5tHxu7gr9gJ3SF3g39nA/o5FRO/f4/fjE0QG4PRLKsqzccft?=
 =?iso-8859-1?Q?eLyfwxOBzuGIBXbaKwUgw7ih34hi1rZWiWJjowpGLVrHdb9S6FG4RMrJhT?=
 =?iso-8859-1?Q?EXTWZP+T3vXaVzazqmWTwfenGlXh4FJstw7bPhKJIpneTimGzI+BiZ4noM?=
 =?iso-8859-1?Q?y/UET0yaomOaOty2ohrWugSEqx2GMXtjBsJ97a677WsXf/fJRoL08Ed5ls?=
 =?iso-8859-1?Q?lJMRRGAK9v4eUEgrNFi7s7jRB8xxXHVmgv8U/qK2t0/Omb10M1Oh5r2iRl?=
 =?iso-8859-1?Q?KXYDkcfyGHTw0YcIuzbKN/NXz8tzHTqbTseXFNjKR8hWvfpGFy8/7CATYN?=
 =?iso-8859-1?Q?tXkMNpSq3Yw+scfuwdUn5Dq/4nvyqrWQdR9Aki/Q2S2a2aGPcsAXXCJMwv?=
 =?iso-8859-1?Q?IchVmzizB50BMR3G0sHZv+poBqtxDvky7l2mNrObSBy/gucXH1m6H8nT88?=
 =?iso-8859-1?Q?4ZNIQktBS5O3Te/8lFq0n9JwR8QGRLC48iXi5TKLzk4c4GVfY1P0V12kyl?=
 =?iso-8859-1?Q?Y0WTxstbC5SBuXNDSQ7Ji7wuaypKAdtJxllqyRsBgm9uV6b/PPaCfleZLe?=
 =?iso-8859-1?Q?oe6Dk5PUxOR8D9ft9y9xMdyttJu/d+AT1s3JfkvBfa17Qs+sffB0sP4T3u?=
 =?iso-8859-1?Q?lGWiUgZqNia/WuuR2uaKbvz68G+3effXBBYqOYwgk+QBJVXhxqctu5Qwat?=
 =?iso-8859-1?Q?NwpfGooUnyv8FEdfIhplUDsgvcgUhAThSUxtU9qBYWzfe0NyUORSt9O29G?=
 =?iso-8859-1?Q?c5aG+UoSjvnsVpJDEWarFKnQLuUCa2GWSwY13NkDuT/eh4bsfj7yXXJhJJ?=
 =?iso-8859-1?Q?Tpq33yFRhV3Z7lDwkwWHakfz83+jFOLFs9j7vGaxXL2FzPSOublvVG/ef8?=
 =?iso-8859-1?Q?A8WaDCTasqMGOZaX7mGoNM+hUBlseuaWfuL2RkQETZg96OrdI/pEt0QvcR?=
 =?iso-8859-1?Q?efEdYPUqrak9zq0S8FWt4viYDgwsxkIY6WnG6hcmDPkQTw+KoRYhf40MxF?=
 =?iso-8859-1?Q?1Dg+4CzE36jezonkL6WI7PCd3mjuYrsR1uAVPm9sD6GwsZz3QsA2ijDLqH?=
 =?iso-8859-1?Q?E9SAZl4lpzwN2GF9l5nOu874SfDtiDY3I41wuK2iYaVSWoVlysLnXHCmQr?=
 =?iso-8859-1?Q?e/jXKF9qlUq914SzpVXsiL0xJia1oUF8anGAEZ0dYvlq+wfQADTwBH6lfv?=
 =?iso-8859-1?Q?gahDvPK9Y4RTUpVnwChDptP/b/ZrIluFoWmJ8FdvYJYE7OqtGj8jHdML+Z?=
 =?iso-8859-1?Q?nV0lCfOvlhzv1uTXhV6t4bsonhbQUhCboFwJKy+j5L2aIsv6qbDi/Cif90?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR09MB6196.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wYZg4m5gJqPEGHrb6pzcxUEVG8p1uwgAlDXZHXrqLEf3dCcPEhKJfJnsBr?=
 =?iso-8859-1?Q?r/Hg4wDU4KGZaQsWzlg2K6aYWA94tf412/4ORAf6y7MIG9VT09POAJm3zF?=
 =?iso-8859-1?Q?KgCbycQtshZE8e/M5pO7wn5sMpRQJLqMjFb6Ik+n/oLhb5DMFUR9+ZxVVq?=
 =?iso-8859-1?Q?RwnI9zggUH88hgmSXBWLxnb7BY88My7AvzWT++g8f/yJBKgGyQ8KHgDk3A?=
 =?iso-8859-1?Q?76vQWc4+VxeKhcwxNeKcZdRXcEramQ5X3JX/Q7sWLYZCMUPB7Vm0Sv39TS?=
 =?iso-8859-1?Q?v8uwsKDLTz5LpVew4Z5tPSKTy1xmulP9hjwZUjkNhapiBiWHp/24ROA9Xq?=
 =?iso-8859-1?Q?G1IokygqWMCjeMoOa678Qq0fFlHt/N5XCsB0gldIG1T8ZWJcIXPxn7CxMR?=
 =?iso-8859-1?Q?/aeGc6Re64CCe9Cn9b9F613QYEXVPRSf2uTyS/06nVn+rtWWW3oMFFYsXQ?=
 =?iso-8859-1?Q?a5vx9RFioLIco/ZrhVOA0qmKYAmaZCKwbfUQouz+MtzqzlvxmfNMsx+qGK?=
 =?iso-8859-1?Q?1YQbtAbruf4eXDkOlP0kRFVR1rKL58n0D+5ROQOTimOrgtyMD7aGgiVzZ6?=
 =?iso-8859-1?Q?wxOwofSLiwaKW5ZqvWIffGe6iS3rM1HiMvZHCNpnoCq2INKpf2vmnEggSN?=
 =?iso-8859-1?Q?F3aKVMoK0j6SfeCgjpbLxn6V3EQVyRbXVOhCRAJBmJSW0vUj3QM3pLUVBu?=
 =?iso-8859-1?Q?I8Gn4LdgbHHWqaKI4LDuJavS5Lc2nh6mXnXVsSvjJobX5golTc/ekXfigY?=
 =?iso-8859-1?Q?bXbO9DYrEfB/LFNNN/SVlhjnIxCq/5nqTVNom3zWhNUsY3HjwRI1k0EBOV?=
 =?iso-8859-1?Q?16ECm9RW2oq6tTWumnYXe6i+oS24SzhQJo056MZfl8rm6mA5CmZlZc2LF+?=
 =?iso-8859-1?Q?4XxUkzpOqVS06zPRSSSINMWMh4182IIF9EtNhCHEysQe/6gUIdP3uJOCHv?=
 =?iso-8859-1?Q?oiSjYfXZzDqHYcsCSIdPEUUs6x66+RKL4Hr7ZAVJ+m9XLgf+gPBcEGfQkM?=
 =?iso-8859-1?Q?jxeKDFkafz2H/CD0390TOruc9kCfJ7J9nnwGbchXZvj385YaowkRIZO6z0?=
 =?iso-8859-1?Q?OR41Vl0Tg7LcrX7UzI7D0UKucDMQuy3MMORdku0bHAst/2sB3TP4CwLO7y?=
 =?iso-8859-1?Q?q45oLbEESeBLWDQ2JTSZYFzgpOydIObsNPbxQqOBuNw7UDIZdD3aobYXU0?=
 =?iso-8859-1?Q?POfznb5ZIAeKb7NdzgAa7jmCaiSn9RIHXUq/RlAzLly42bxWUv+Klc49LZ?=
 =?iso-8859-1?Q?R+xVyXxiv5rCvHVvE54/FgbTdsfqgH8VwH4g46ABxvNUUbPhcYGWkyg+6H?=
 =?iso-8859-1?Q?Dq6VATM/vK3KRUK0eszUWwr9Hn+rOdS5aQp2HdgUHs1t/DN/TU1v0QqUad?=
 =?iso-8859-1?Q?miYLzTGmft8F90GB64gYnHeU/VK5z69hiAvwCB4lANURjC2XN0SdSHyD0r?=
 =?iso-8859-1?Q?Le5TnsahmwM/hI0RblXqSE3O/n7fNFLzJSzPhQaqT7wgY3AbdeDcIxh4sP?=
 =?iso-8859-1?Q?Rl4a1ocmKkJcChrF/ikfgZt/4SITizjNBQqSIrp92AB4ELEzgtQDcIX8dl?=
 =?iso-8859-1?Q?VlMdYW7BW1F0OkOs1iM022xgO+VMpACXNo2d0EFJc7g253zdPoxT6Iq+jk?=
 =?iso-8859-1?Q?IInyVvOzzjwpIzkjWNXYcYmrxIKp31hcPc2WP66It1YBcXIxvkCr1JNw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB6196.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b003c7e2-47e5-401b-ec19-08dd8260642d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 12:14:26.5644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GoLp4DRuIlprMy7a5ZVDw2rxPvQ8J9q0EHVTBLnXGZCh6lMxSwLQIiUkcPsuTyOKxjcZwO6KAvx+si9VUwhCuIu8MD7sCjopC5UHb55k+mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5925

HTEC Public

Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
platforms. The GCR.U memory region contains shadow copies of the RISC-V
mtime register and the hrtime Global Configuration Register.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../devicetree/bindings/timer/mti,gcru.yaml   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/mti,gcru.yaml

diff --git a/Documentation/devicetree/bindings/timer/mti,gcru.yaml b/Docume=
ntation/devicetree/bindings/timer/mti,gcru.yaml
new file mode 100644
index 000000000000..6555dbab402e
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mti,gcru.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/mti,gcru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GCR.U timer device for RISC-V platforms
+
+maintainers:
+  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+
+description:
+  The GCR.U memory region contains memory mapped shadow copies of
+  mtime and hrtime Global Configuration Registers,
+  which software can choose to make accessible from user mode.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: mti,gcru
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    const: mti,gcru
+
+  reg:
+    items:
+      - description: Read-only shadow copy of the RISC-V mtime register.
+      - description: Read-only shadow copy of the high resolution timer re=
gister.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gcru: timer@1617F000 {
+        compatible =3D "mti,gcru";
+        reg =3D <0x1617F050 0x8>,
+              <0x1617F090 0x8>;
+    };
--
2.34.1
