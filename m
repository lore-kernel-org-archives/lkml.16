Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CF0230981
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.70
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748949103; cv=fail; b=kV+NXyoa46HUDJHDmSJ2Mg9f2X5XfITeYqUWprErxE7MApOZ24U+YvtN+hq5v8n4ZeB1LSxmwY982qd3bdYJng5Pn27EnzoTEfBiqxDCt6AbNBX+A2QMpnht8fpSHeFunNZSMDmkWu4a9dBCYVVDOMfWK5sfmaHu/pseq78sJhA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748949103; c=relaxed/simple;
	bh=13cfSg7Xcxhd6zfNe6hTesq0l1fOIJ9VCyc8gn1RDMg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lb1xOkYMEpASlqDY/tLclM3c9g3yOmnqLhySe8TtQqoLN/j9FFywbKfiBBh0vCejUff3ca4hvQ9t4xddqW9epOLkQ/SL6bVu2RTxhMF4C6ZtG82hIge4Q+a160BapnSrSsLntz0eBb4ISFStN96SwCmxUNwW5oKsug+YvuM/HCQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=D1OewySG; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=D1OewySG; arc=fail smtp.client-ip=52.101.72.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="D1OewySG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="D1OewySG"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JL0ClpmI2kmZCWj8IvnulXLmV2q9fMCtBV6FCDxoS8lkJPH3aaNlr+Q1DpmEjE738E/Crl+/FOGZmUwnCWKoEVdNPpE0CZdw9rZCijsqMRGV3l5UCsHAvcalD6EP0xnd9EYujfkyD6LyZqgoXA1f/KQR5/5U8hhaPCSigNwl3U094/MzHh/JRVsBrJcmiycgKEdBYiFcsnDz2G0GMX+A9EGMNTCviJeqfwTqmlQVGepPa4cFh+u7NEn/e+ubIXlpVfyzMuquCLMl76ERYHqHw4SnyQsvOMertyNsCLUvf8OffF1jYxcyspKsO5z1FQ//lenUWyBiPbEfmhnoIXaF8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13cfSg7Xcxhd6zfNe6hTesq0l1fOIJ9VCyc8gn1RDMg=;
 b=Q3eUPIL7I+F1QOs9lhwKSEoYwpCZ9++NGEzysk7P/mkHQyUkMg61pNZQbTUbjdzBlX7YB2is7uimcmCv41lKXU7GMYjDDOXB/yS0fZK2jYXghQK/CRkGgyAlUodmCesgnOmxqqbzVzp3SQ5PAEqloO+hgqD5ykmDD6qaPNGnnrfT1HZeUdnGXW5/rgLTrmY180W5ZCSJhxjKU6+zRmpcBUxPkoPKLrkS9VgFub5CqXenBcewpjR0PnDa/JdwRsc+AVkHKW3B0E55o1C8DZd55PFXxg9uLiyNczlXfhIYFRcSdW8O//A8lKzpGaEcDca2La+4Sl23eZV/AX2aO2q8Lw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13cfSg7Xcxhd6zfNe6hTesq0l1fOIJ9VCyc8gn1RDMg=;
 b=D1OewySGXpA3F8PpSv3jMb1E/6Nki80hzjeyDIXfxz753R8F2yYZHUytVCsGo4Oc9JNXbyoNNc0n4I8BaxsWv1hdrD1+Da+LxGeIXqc/DmoRnZ//BlWMcm39dnu9GO4pwKrgNTooz/wjzQA2afEfa/Qr5K+vj1phL21uV1q5rAA=
Received: from AS4P191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::9)
 by DU5PR08MB10824.eurprd08.prod.outlook.com (2603:10a6:10:526::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Tue, 3 Jun
 2025 11:11:36 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::2d) by AS4P191CA0040.outlook.office365.com
 (2603:10a6:20b:657::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Tue,
 3 Jun 2025 11:11:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Tue, 3 Jun 2025 11:11:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBudTaSrfA3sUppCLzlYv1DaWCbvrMRod9gHzuxqnH5tTeAW0DuE5xARWWH3ZLDIscMHYT9+pV8eNda9ARlmL3HW246tDY2f8lWneqekdq5g3WDEOkbtUVXfbMHX14iy9JhAdZMCShuRXxThyILVHCb0Fsq1yYU/b+BglW0jWgrNeQ6sHFZV+NUPys3lWH1fBkCU9P71iYt6l4MnrRvtWL7dA//T0ztRKIIN3ku2TTezyXoDWvj32kmkP+LRlF+lFz4r9CyCOvtUlW2j3Hu/G0S6uzlo9GHS6OGYIkwQzqSJB3y4CPz6lNDCuD8j+qkv90nw4vuMnLlH22WKdB4ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13cfSg7Xcxhd6zfNe6hTesq0l1fOIJ9VCyc8gn1RDMg=;
 b=KDtuirW2OY4RBMN/nj/SBV76mpWs2pnKe+d5qkBXWQ8rNaW+BmAPwfLILQWKskMcOFZb4w8pB/hLNXkFzgrL8bkSu/wIzy1kKBGa7FWvlr7U8vVc3GNo34IwJTZQgUzIHYNPuya0igBa8hx0aculsauES8TkfGBc7Db55L6NRmnMo7HPaTFkQ7HaTsuiXzXO4POQgmFyq1h17JkKcl5I+bOFSUjyEHSSzZ8v6z2ygp/Bcy3uPXhjQC8DtOkYcfP+wu3btSU42k1Bduiax5f5xGZeNACkdU4q/pHDduyYFjnn7hhQCvtNsOeb+sPoOnc5vDAQWMrQEiHsI0yjSK05Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13cfSg7Xcxhd6zfNe6hTesq0l1fOIJ9VCyc8gn1RDMg=;
 b=D1OewySGXpA3F8PpSv3jMb1E/6Nki80hzjeyDIXfxz753R8F2yYZHUytVCsGo4Oc9JNXbyoNNc0n4I8BaxsWv1hdrD1+Da+LxGeIXqc/DmoRnZ//BlWMcm39dnu9GO4pwKrgNTooz/wjzQA2afEfa/Qr5K+vj1phL21uV1q5rAA=
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB7492.eurprd08.prod.outlook.com (2603:10a6:102:2b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 11:11:02 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 11:11:02 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: Sudeep Holla <Sudeep.Holla@arm.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, =?iso-8859-1?Q?Alex_Benn=E9e?=
	<alex.bennee@linaro.org>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [Virtio-msg] [PATCH] firmware: arm_ffa: Fix struct
 ffa_indirect_msg_hdr
Thread-Topic: [Virtio-msg] [PATCH] firmware: arm_ffa: Fix struct
 ffa_indirect_msg_hdr
Thread-Index: AQHb1Hfs/wpd7UJ6x0SGIBPGNCDEBrPxR2YA
Date: Tue, 3 Jun 2025 11:11:02 +0000
Message-ID: <08C89D57-DEEB-4B9E-9089-9FE958BC7747@arm.com>
References:
 <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
In-Reply-To:
 <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB7492:EE_|AMS0EPF000001B2:EE_|DU5PR08MB10824:EE_
X-MS-Office365-Filtering-Correlation-Id: f73efc06-afc6-4e19-9c27-08dda28f6809
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?RtXeRO1w8It67rWz17VUabjp7BncYKuUQZbY/HaWjnPLt2Opu//gsvRAWX?=
 =?iso-8859-1?Q?VBPAC7/iVhueGS6yFgmK9iPajMwf60MnOcg7N0kV6Jl9h7nnBiJhFK62Fl?=
 =?iso-8859-1?Q?Dl4d9n9i5x74B14LXbpc2F3VIp94YZCcOik+RQ3YR9G9Ocv07UJIYfMFrE?=
 =?iso-8859-1?Q?0x3fTcvKyNvtjkzH/4Vn941dVc3H7EmTmipXurMFRmwQ0nSRUjF/RsFSno?=
 =?iso-8859-1?Q?v6hTl+/jZyODq7acctotquH+EWV9CqTLpA9UWuTkklwoEc/OQxff4P7/F1?=
 =?iso-8859-1?Q?xrTDdWR4yAo3LFlCQF1c3Q+2iihxnmvkmFbn747z4qckyva3Sa6zgO4zhS?=
 =?iso-8859-1?Q?bOwkzn6jDMWTXiXD/mxFpPJlR64EzV4H5pgivd9Uo6AMVYaM2Lw1lr2+VL?=
 =?iso-8859-1?Q?sXn7nGFTdqmZsD6TqQW2u48+aFVXLWF3OwUSVGhRz45m2+GehAWYGKfNv3?=
 =?iso-8859-1?Q?udOddnS2U0umT4jGGMbtN5TCuZ5pO6wzHgh0LHTJDAcf4EPX9VIfbLGC8d?=
 =?iso-8859-1?Q?KEl49KAYGRVYrAlYBmwRlCZEKRL7u24kWnGk0ILrDXVIxBCGCQnjtKdHnR?=
 =?iso-8859-1?Q?L6G0PgttwOTWtLVhYJpf75kzD6LFUKRT8RcWx0XD5fxOPEQr7gXc6LmEIr?=
 =?iso-8859-1?Q?OMHfx02MGo6wDFbr9e7ETraZXdL6ehHuCRbH4EH4tdqnsT9LboCY2Pf4Bf?=
 =?iso-8859-1?Q?/7L7n22SDGAhJtI1TeO0M6XUaD5uUHpo5oJrojnwDQG814CQ/e3o+xK1US?=
 =?iso-8859-1?Q?/66/eTbt5WI0JCCw8fBphEupM92YZhn8Jsl3qx96a/0t9mJsasz9C8HcFW?=
 =?iso-8859-1?Q?VXoSONEpwl7o51p95efM0EZh/CxW+BDYv43jBaMwbq49PW+N2mNvw/8mtB?=
 =?iso-8859-1?Q?DH5Mn36agM7focHWvLM+I4GdiiviPJ2WmhGq/eqwZ6/jHdIayjp+KeRXR8?=
 =?iso-8859-1?Q?eTzKsMBss+zwMhnhKna36ezQE3VJ+wgvw4FMGrYvpjTjR147W/tID+T1q0?=
 =?iso-8859-1?Q?oMYihh7viZPreKBb0biJrwFytvrkSIOUehZzUtXwr30wSS5g4S+3K4BLi5?=
 =?iso-8859-1?Q?rKNtl4ghE+0PS0jUIlXS7x9rGVCimlMCf1jp9GKEaC1Jx6QzCUYuUvl/z0?=
 =?iso-8859-1?Q?cvy6xJhELqKPEKAlgSU37kt9Fxbls4iAKArtWy3f9yWVLhuKdOUZ1SPPnE?=
 =?iso-8859-1?Q?WgZNAJzcKFvisE+QBW1srr8sciu9pKV7pp458CdffPwHisS1wGXKJp0lTy?=
 =?iso-8859-1?Q?gRfRKHHhGXpDIuddA6c5OrRthvuDxQkGV3+II/Lhxe6bj8zWxoiXqYOq75?=
 =?iso-8859-1?Q?WIZrqO4AHwaU+DUY8mweGGy5qDR0R8oTtF3vi3yS1bHH1s4TjAnrLQAMnp?=
 =?iso-8859-1?Q?DLKJwvAxY4thYHm3lTCoUmp1lkDmaod2c1FctvUebYoSWS/t5y0gLtpdJ8?=
 =?iso-8859-1?Q?/SJalS/UBKgyHi4/qxRnOmsTiomSULZDzQRocNGyk2n6FNc9rhyx49LvDS?=
 =?iso-8859-1?Q?V3soXrpO+OXmgl/S4Sk04H1sa6PNEQLvi9ty1MRlm3BCB1BSF3Y+XDervt?=
 =?iso-8859-1?Q?3nDZpAs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9FDA1F9AB6C4384D999DC349C0896BD3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7492
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c14e66eb-b287-4acd-786e-08dda28f53c5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|4022899009|14060799003|82310400026|1800799024|36860700013|35042699022|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?mR92z2QKz/cw2X2eqd58nuq3wYSoOjNaWLbHS5Uj/nVRkQsud7pn9DTQEe?=
 =?iso-8859-1?Q?+N87cFczyIJh4zyPjgRk0lZSUowJEQzcDN8JKXaMI+RSEYdF2yF81XUxys?=
 =?iso-8859-1?Q?cQw/RiGbuuN5QSuSRqY0PyHzlLOcGx+Z/7G92LP/0TWjPGwV8R8srLAd9A?=
 =?iso-8859-1?Q?Sb3WDsTgZSjJaZQ7tk8sK5BclzOsAUT95nbfpyH+YFJzcCf1MnH3Q4Fmw+?=
 =?iso-8859-1?Q?toWVh2kV0UzfcdSJ62aOimGceqK4NMHL+IpmubBmKhmpamRcju1O5AKeOo?=
 =?iso-8859-1?Q?j2U9hJ5QuOQn1X8x6mIuX0S86Ar2waUANuPhATan1rnjOxjqZ3WVnUG/dh?=
 =?iso-8859-1?Q?WS3ttVmhtw9TAQe8JUK5qq+qoEISnJVUSwgBM+CQZfbgneP1IJaHjs1fxK?=
 =?iso-8859-1?Q?yP6KVA8gFGLyBFj0y6HxjK7P+zqEcZMTDQWCwiE9m7mp9/pUVb/9hcNJfR?=
 =?iso-8859-1?Q?NtusEhoNf8eQlOuKv9vWMzH4krHZygyLFALZj8Dtk5H5X9bONK7xeqzayH?=
 =?iso-8859-1?Q?zTQRbZKM5Drk3rABYuEjPtyhmaJALtlxkBqXCSnnxqkshQUL0p35AOEiwp?=
 =?iso-8859-1?Q?s1San/z28IsijYBKiPd/5Y/o2brbtNs3ocSwzdmbbrf+ZhlCe5zPr2izJ6?=
 =?iso-8859-1?Q?RGVpL2iwge8j5forfe1VGtXIWjHpg9wmQcU909EJb3JMYtLitjAu1ucxAU?=
 =?iso-8859-1?Q?mca4waQaIP8Z7JnpQHn4OYuVHVwLMH7bbMvEFQrBz+kLTZeVM5SJ3V5wdD?=
 =?iso-8859-1?Q?/ilwLRJUFuoTOfIet8vBKS2+QCpkLcMIWX8H2Yl45R1KKsywQmZpfkJPYk?=
 =?iso-8859-1?Q?eJ0FAURBX1blJ/wb1iXrXVMNGxxRHS7ADUV3Z8OpAe1AvfdIQxxwHiVpsa?=
 =?iso-8859-1?Q?Os7kH8NSU4ZWAf7H4IVaeWURN7WxwMW2mFmsebp4xdZYKftZhk/bjGXfQD?=
 =?iso-8859-1?Q?AcA9fxOPnUYhtv5Lvlual8Mhg7QMwLlvNpfVIq9AE1rIy6ZFwqAD9v/NNo?=
 =?iso-8859-1?Q?i5NZXiBZn9MTt3BtN3K4jtUuh6Ez2njjeOd/iGjCgX6uWj4qvxWn7gVOKO?=
 =?iso-8859-1?Q?dwbAWFwMfOxgjkgaWHFua2V93j31K70ApZOztUWXBlXxyMaQNU9z4X5JmU?=
 =?iso-8859-1?Q?MwcEJ6VeWzuHP8kjbp/XWKWIjnid3VXG1D6BFnpTBnaSjH8YikAKWg4fQo?=
 =?iso-8859-1?Q?iAqBcT/Zj/IylWLzK2cN2vYBnJRoruZsevQYaYOtJT+C81FoUE6wdXCDCP?=
 =?iso-8859-1?Q?ZlXiYs2Bs3fj6+SwhrE3wEZkjzIWgIwahCKqMObHJUCc6DQEizY+w5A0uu?=
 =?iso-8859-1?Q?KqrNwiuLHxBYdzz2QiKls33Zum5MutNSg0klX3V19bNsIJUoBhY041F17p?=
 =?iso-8859-1?Q?rb53RQFLToZIPkae4iNVRVs6RlsLn2XZRYV4itGieWun+sfPCK3LVAdHTi?=
 =?iso-8859-1?Q?D1m9BSxA6/yc+c002ts8r52Z5b7xLUFJ0nk9kzzAiwftd+MOEXpext9KKa?=
 =?iso-8859-1?Q?1ZbhdpE8FovzylKT66GZpD4qWQTEvRXojfPui+Ajidu9w75xKqr3zTPrra?=
 =?iso-8859-1?Q?v+iA+u958ehsp40qWR0ut1rwOWUQ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(14060799003)(82310400026)(1800799024)(36860700013)(35042699022)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:11:36.5153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f73efc06-afc6-4e19-9c27-08dda28f6809
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10824

Hi Viresh,

Thanks for spotting this.

> On 3 Jun 2025, at 13:08, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>=20
> As per the spec, one 32 bit reserved entry is missing here, add it.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> include/linux/arm_ffa.h | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index 5bded24dc24f..e1634897e159 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -283,6 +283,7 @@ struct ffa_indirect_msg_hdr {
> u32 offset;
> u32 send_recv_id;
> u32 size;
> + u32 res1;
> uuid_t uuid;
> };
>=20
> --=20
> 2.31.1.272.g89b43f80a514
>=20
> _______________________________________________
> Virtio-msg mailing list -- virtio-msg@lists.linaro.org
> To unsubscribe send an email to virtio-msg-leave@lists.linaro.org

