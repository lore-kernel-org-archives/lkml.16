Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A35D19BBC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745557257; cv=fail; b=bLle6mGAFdDrmiNwnjeeHDrWw71LmWLOY8CGc0sBL2tcvRqOLqHhwiupKtrP5dHxrGlEPXoJ4q7uVnLz2Z5YY97x2FOweDJhO5thZJqJ5uFY5MlS8emg9QgstQf5a/9zTmY/dewo++lhwNwNay2HashiS3zqGs740xWDae48hew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745557257; c=relaxed/simple;
	bh=b07Efo5Hf9kot+ZoYgMEu/ri+dfqtp/7XQ0zSg46jtc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RKQyGlMBJRIQs7HjoDK4olRa4lwnrI7ole9cXtDsHcmsQT9zF0jyYV+XxzTZBKB6A16oWhfi63CP+B30mJMSRDXhobl8akk0l7apQKd5Eowz6c+khJyX98YQ2IR9sqHhTW7wTlftfXrRjFWnJml300ILETFP35E4Wbu14OZaymw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=gzqd+td3; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="gzqd+td3"
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9VWiZ030560;
	Thu, 24 Apr 2025 13:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=soqgpqE5hik9VyRyIHf7g/gQw3y6WKoOeR8EcZkFRHg=; b=gzqd+td3SPNl
	1sgc1AVq9VpdDTo8S085Cq3DZvx7MD+XCEv5EEC7CB6yGcg6BLsloYtN91WIq8kN
	h3WBp1d7mrhncG3ei8C4Fb5Vm0A+Z/BB1LUZf58VK3g3McxfRKuk5g5bKq4FZcNY
	6WJAhb83jkGDTzY1kR8fy0EfBwTwpWfjiyqoBvQEUAzM+R6jaEhc5IssrsNGPY4B
	otVHHr8N3JdyC6EfBIJS4e+spDgN5gU7+JpAPyk2K8dVITmXJxNczB7C/uJIbhrp
	GmgEWBZeo8OKqNZrTZykb9CZ38BpRhU4pz1qr/k8W87QBNjvuXS3C8Nrhwj+03TW
	X0JUW7wiSA==
Received: from hk3pr03cu002.outbound.protection.outlook.com (mail-eastasiaazlp17011028.outbound.protection.outlook.com [40.93.128.28])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 466jjdxqat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 13:35:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrGH/X4DZoyGHjw1dimyPrHjFPAHr9EI1hnz+7ovcSt3wJ5LojiZyYgBbXqv7DdIAtZ+7VKd5fmVLlv7Wuhn95QCtw51hnRvC7RUHmOEqs6sG7ZVVbrEI6Pon6O0XzVWkWHh3PRJKoijx00C3Y678lBayNkdwjqx9Qp6y7sKanp6KJVP1sLw0Y0mi7iFgsrlfp0C0fuaPNm79U60KdvtQ8yn9fF+Gdhr/r2EMoC5W0SzrMpB6gRBXPE6MpQGVhTzFOq7pkEF+oKQiv7azIjR1y/nkW7cTuXlfPFod+OfyY8MjIVZBptRm+LyBfRQGbIHV9HA4653sKHz8CcLIg+piA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soqgpqE5hik9VyRyIHf7g/gQw3y6WKoOeR8EcZkFRHg=;
 b=ZwRVdCA+V7a+QjmZEo1UU3iyXGAqGVb5wJJJB3Lt8RRJY7khDGuWxbMOfFjUWNWhnyIEl5O/52QfYtimcrRAoQPsMHAvgYbREHtIGFfrtcDCH7SBM4wV5x5nS049PzRbI7GWxWPyKy4pLjGij8cG0N3jQBsGXq03ZpttPbMLJZMttPG2zRG0su7+yzW9r4N0mRiJi1+NSYXmrtc9Z8HkQmm1+fCd2TwmP55uTXobImIX5YjlrbJnjZsCcEDJL/u/2+vs56aiZuVI9ZWg06X5Z2jXlrRbyuPQ6RKnEWmmyXc9U7cE/9fSZks/TuAoHB+UATktCVcPMb1aqajqYQSebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from TYZPR03MB6192.apcprd03.prod.outlook.com (2603:1096:400:130::9)
 by TYZPR03MB7181.apcprd03.prod.outlook.com (2603:1096:400:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 13:35:29 +0000
Received: from TYZPR03MB6192.apcprd03.prod.outlook.com
 ([fe80::54ac:ace0:dab9:cf27]) by TYZPR03MB6192.apcprd03.prod.outlook.com
 ([fe80::54ac:ace0:dab9:cf27%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 13:35:29 +0000
From: Adrian Huang12 <ahuang12@lenovo.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
        Andrew Morton
	<akpm@linux-foundation.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>,
        LKML
	<linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
        Christoph
 Hellwig <hch@infradead.org>,
        Oleksiy Avramchenko
	<oleksiy.avramchenko@sony.com>
Subject: RE: [PATCH 1/4] lib/test_vmalloc.c: Replace RWSEM to SRCU for setup
Thread-Topic: [PATCH 1/4] lib/test_vmalloc.c: Replace RWSEM to SRCU for setup
Thread-Index: AQHbtR2+ak663KKJjUm1hYWDnVUJuQ==
Date: Thu, 24 Apr 2025 13:35:29 +0000
Message-ID:
 <TYZPR03MB6192BA354C0B1DE09AF1D184B3852@TYZPR03MB6192.apcprd03.prod.outlook.com>
References: <20250417161216.88318-1-urezki@gmail.com>
In-Reply-To: <20250417161216.88318-1-urezki@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6192:EE_|TYZPR03MB7181:EE_
x-ms-office365-filtering-correlation-id: ac313f1b-1910-4bb9-4948-08dd8334e126
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oXKGln9+FCvTHFvcDEF6p3WGqQ7xh40IdX9iFCYsQw8gOmu3m6Bh8JD/iUf/?=
 =?us-ascii?Q?pIOPk0SNo7mwcaYlDLlJ+aprEdKcXxLMEPOvGNI9OQNcU0JcbnBUnEWurJ2p?=
 =?us-ascii?Q?70Sp512gZzOpW3Y4ic2CP/got7D+/9C2Mp8SWANuWINMSJGdlxcrMdt/fO1e?=
 =?us-ascii?Q?A3R4YBPaS0QBFccdiczlRlk8u70TaH5z2Hu71M3uHQzts7J32kT7nU2ce15h?=
 =?us-ascii?Q?5uhfibdU6D0RPRCYjNcEJQ1qrTUNUxCUs2b6jtkrNNC8hcYbBBiJSwSK8CDa?=
 =?us-ascii?Q?27mBBmf6PGa3flanlwJlw9e7d2PtuTQHmi2R1XmbP+4Xb76IANhbu3TcUHSE?=
 =?us-ascii?Q?Cl0AD7y9n5PSk3Oc6hyaYLpB2GqFrV1bZBLFgFtCtJ9DRjzdwMPMam76a2n7?=
 =?us-ascii?Q?FKgmV39QWXzQldokjuWbQLFfc0GRvhWWJYSWfvKl6iA3ANQE/YdEhcSceUQ/?=
 =?us-ascii?Q?HCSafBfJ/qul2mqAbr8oLUb5Jf/lmZ0FCLc0bWdfgLVteMGTjdm65aEUQMgd?=
 =?us-ascii?Q?bss4ew5078V3jgfQiu4Arg2u3SpsbtjcEh44t9KyIMvJphRtAlU/tbASSuH9?=
 =?us-ascii?Q?9N2STVVF8reGABZyU+7sV1EACXMQmkNT8kR144T7MsGrxN+x+N3q6yFtYRVZ?=
 =?us-ascii?Q?IOOKIb9GydLEZQ8ygpIV47UoQ8KYY2HPS3hgkCLM8Q84YWQ/qgPglA7fOUKO?=
 =?us-ascii?Q?Hz4UDh8FKpq9weUmkbxB4pVihq2ELmyT6qk7JWeg8TkSXTW9G+StHPeeC2Ax?=
 =?us-ascii?Q?gY86J4GcMnusOvDHWXgKg6agYsvFhNa1VYbEwv3PXLQPAuXpibbupkinOgn/?=
 =?us-ascii?Q?YPADCMSBwPqKu6SlY6o6SgxiGX5+tUxufOnu0n+UpBlTRhJOXMEtNg1z5EFv?=
 =?us-ascii?Q?8ochShtbVPSDM9o/DSQPL/oMj8g4sBhmWYqML8Lqkw/VMc/qf74l34V78L1r?=
 =?us-ascii?Q?+RGoUxw+fuApwmEnXHU/DbIwB83rT4iMbEIloeoZUdy3DRsHcZB5AZzsTAWC?=
 =?us-ascii?Q?NfCBCruOTRTlX2/NBQ+8aHYj7MuJ2UuIWUNsdI9yWGb241mKKRt11JNcv05D?=
 =?us-ascii?Q?KHIrLuOf7OBAqfthF7xRWHp5Mk/z5XKZtQw0zza/XvLK0N85w/l5DOeOkkt/?=
 =?us-ascii?Q?3Vr7/zmVxPf2idaBREJDcM8lEm+8YQ0Bm/3n7V5gD03Z4/XeuJvARzU/e8bo?=
 =?us-ascii?Q?wgsETqH+LKsJ+QKzLkF/2dxhCqesjDon4ppdTlJm/NGQZdGo7ROXAKQdpn/1?=
 =?us-ascii?Q?YfJzAEzEUav6GFDWUJUDo6Bz914uqFZd6pQwGoNzq6UCKnDiUs+AW8uv4M6+?=
 =?us-ascii?Q?1RJbogHoruy98N7NtoQ5+IL0x7cK1R0RRZWn7FRMC/KBJPdSRw4IBS9m+qVL?=
 =?us-ascii?Q?WtIrQBC3kDzFYv8RW+Ew1qv5YbNN3gjpxCFvQBV6iRGLME8QtWq98Lb3w1fn?=
 =?us-ascii?Q?LXrV3OJCH80s9sJBBpoRRwqzb9ukTkGCBErQ/5X23ihABWFHWzy/MA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6192.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Emb7enxCknfRqtklHf4lAZPCaXb51AqCIlfmzMyDG/qwFiGB4TYITKL9IEK0?=
 =?us-ascii?Q?1/dxadmZV9kPluO2Ism+4XCyi2jO6SxLqrZZ+yXiai0uq1RD0MkAVpfQeV1z?=
 =?us-ascii?Q?DWKWm0XChZdJ/Ql66u53oCpOJRPCJyPI9kMVl18DhF/a7XxcGDWKmhGEp11L?=
 =?us-ascii?Q?nMNjRxg9u+9+KFyYQrYDRex7KKaihcpJSkN43jVgk8L7MUQGUfqZKpXmexrg?=
 =?us-ascii?Q?TBgiku/4MNJ9ieBewY/aA+oJjPPJjQeQUiJtwSqAw5SKKgjflSbF6E6qyuFx?=
 =?us-ascii?Q?DhRW+84FG7mlv8Z94irZvnuhIcmGEHBHUFAJI29cK5ni+0tq50admUjZ3gCj?=
 =?us-ascii?Q?6i/CWcX90Utm7K3YcKgJTugDyiVG2l++ApwPDl8jOWX7y/oF7E9j9wnjWpL+?=
 =?us-ascii?Q?wE14HxdBSqjn4G/F2JypqdunyGAtq3YRE+2fyWRPVUYdFahbuVRB/Ia8jHgb?=
 =?us-ascii?Q?oiuDZIHyph6UI0u8vwW3vZ10ckpDVBitOt/WCIa0oTJ1D+Bj8iEnX2IlVH06?=
 =?us-ascii?Q?ns8JrMpCl7hhu38+zQRaVVYZ/gqn/kJKaojjYGyLgjO55bk38zolV7g6dyzK?=
 =?us-ascii?Q?HUDv+DQc5kRjTgwocqXBKkDci1q/KlEZ+C30vaS09CXmTHJiUYEsFxQoXGq6?=
 =?us-ascii?Q?/OSHgygesE624jlNylk/HQgOMDWVs7r7q0tZLItFQpBNOxQoTOaX77vFIFc4?=
 =?us-ascii?Q?DkBa8zKDetPwJ+/yV0MZuxiBnXcM/drejh1JA5CwJAsw3U99ZwPAQ5/JTyOI?=
 =?us-ascii?Q?uQnoCV9hMeu2XSQoGAKkhs44/ZHfyAVGu6Qbbg9F6vUGG0ozdLvLD+iN511F?=
 =?us-ascii?Q?N93aDOqOSusUqgcByfB54LVhefmsDNYRy5n31g2ZUAGQogigX2Lwq6m/QdiT?=
 =?us-ascii?Q?/g6lrsab8M17PL3wyP4Ib4TyHh2hX2GvwstfU1QDLZeLyhoe1hj6sbGtmSiV?=
 =?us-ascii?Q?TIryp2VN3wbVhIlhrB+y3Tt56Jn6fyI/bWEGB4mLYgdGNI3HiA5iTuknBats?=
 =?us-ascii?Q?oai3ZV/VJltCESYBo+lGhQ0173dPKqmmDHUbW1Yqytk6k86XXahjOO2TnDBt?=
 =?us-ascii?Q?tk7gHA4x1pSDPtXdDXeFmozg1CHJUR6O5xTNALnoaI+z33w4h0chmvoYVko8?=
 =?us-ascii?Q?NKhuHxVDLnt1cTZIUKZ0rhS8Y5LYgNfqGzqV4ZRFs67BmwPTtFuq3WN2V+hN?=
 =?us-ascii?Q?X336diltlYffWDgMfbYg4+bazTw/TbQTmZTfGgwld5We3EgMtkh/NOpTj7et?=
 =?us-ascii?Q?B6Pgnvj3dbtki7iHTx77/4NPxlXq5ZaPFHi9GHBC412PbqIUyRkwURdGRPIJ?=
 =?us-ascii?Q?yt17RnRo98DbGmdCFyO0mjsHfmoLGDat2yxWEz6VK5vBqwwTicurUJxcWuU1?=
 =?us-ascii?Q?Q/jwihTUF536p7+iYQnqdFoxSCFoWIWxwI756WY1cYyA2uZNxyaCyLxrcCoS?=
 =?us-ascii?Q?Qp6U4LTmUmyN7UkU8oN8pF2injSkYuE+KfI6nr/TaUBAX3ZBOzd3ct7wvun2?=
 =?us-ascii?Q?JpfYGbMHu8EXTnpn48Edg0vmgHEFNwp4SnCJWfknJygWx9fqycLscckOzoKu?=
 =?us-ascii?Q?iYKYPQgLlkoQ/NbfrNoQrkAahA482DsT6ccJRlXw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6192.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac313f1b-1910-4bb9-4948-08dd8334e126
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 13:35:29.4817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1+ogho2MLoxwBUEaB5uYutiBoGFHhIyizl4U5RcLoG556aVnyw+fanpGIt4+/VFHYXl47c7U9m0aBJSXPIfjsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA5MiBTYWx0ZWRfX3Gy3uKCK9sKb YyT007JT17XdFIuXsz4y5PAP1f1nUdGBP1Yt0l0M++hPGpWDqau01wmx+WVIYNKaHITYoXDmfV2 hu2ut+ee+RObpEUUex/erMZ/mFcA4u6K6WtOqpsx/zOjNN+mO81OxWKjuC5zxsYssNcE1G9jevZ
 hMZcIjZ5P7W2cc+Kbx7ea8rN49eiVQgQh6PAJoaz7O99cBvw4s/b7KO4tBDsSgpuaxVUAbsYNNP 4wy+CDmq15rZOLRE1tDWt59C2dkeEY0e2MmwTpnUN0KGty8v1R2iKWZ1e9JAIAWiIWBi5Y+3IZy F+SX0mOmQU5e+W877VUjJKIeebisCMmayjN2e3FMsW7rumXrXEYIzmVGPMGTv2heOXHS7RxNBVY
 2+qh6knAH2qv0GAUuwYHeGWjDdGiWpMBSASQF2KIpG8owXFm0ALIIvR75Tg0adBq0GOFcLbV
X-Proofpoint-GUID: ADRH5jbHRli2ExDIszMncg2D2OADniIn
X-Authority-Analysis: v=2.4 cv=LvOSymdc c=1 sm=1 tr=0 ts=680a3e24 cx=c_pps a=xD7xo2DKspX0ZYH+x6OcLg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=37rDS-QxAAAA:8 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=z6gsHLkEAAAA:8 a=8k6WQxmsAAAA:8 a=5vGXZ_tQESLEFOC_HVcA:9 a=CjuIK1q_8ugA:10 a=k1Nq6YrhK2t884LQW06G:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: ADRH5jbHRli2ExDIszMncg2D2OADniIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 clxscore=1011 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240092

> -----Original Message-----
> From: owner-linux-mm@kvack.org <owner-linux-mm@kvack.org> On Behalf
> Of Uladzislau Rezki (Sony)
> Sent: Friday, April 18, 2025 12:12 AM
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org; LKML <linux-kernel@vger.kernel.org>; Baoquan He
> <bhe@redhat.com>; Christoph Hellwig <hch@infradead.org>; Uladzislau Rezki
> <urezki@gmail.com>; Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
> Subject: [External] [PATCH 1/4] lib/test_vmalloc.c: Replace RWSEM to SRCU=
 for
> setup
>=20
> The test has the initialization step during which threads are created. To
> prevent the workers from starting prematurely a write lock was previously
> used by the main setup thread, while each worker would block on a read lo=
ck.
>=20
> Replace this RWSEM based synchronization with a simpler SRCU based
> approach. Which does two basic steps:
>=20
> - Main thread wraps the setup phase in an SRCU read-side
>   critical section. Pair of srcu_read_lock()/srcu_read_unlock().
> - Each worker calls synchronize_srcu() on entry, ensuring
>   it waits for the initialization phase to be completed.
>=20
> This patch eliminates the need for down_read()/up_read() and
> down_write()/up_write() pairs thus simplifying the logic and improving cl=
arity.
>=20
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  lib/test_vmalloc.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)

Reviewed-by: Adrian Huang <ahuang12@lenovo.com>
Tested-by: Adrian Huang <ahuang12@lenovo.com>

> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c index
> f585949ff696e..4ab23e5e772d0 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -13,9 +13,9 @@
>  #include <linux/moduleparam.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
> -#include <linux/rwsem.h>
>  #include <linux/mm.h>
>  #include <linux/rcupdate.h>
> +#include <linux/srcutree.h>
>  #include <linux/slab.h>
>=20
>  #define __param(type, name, init, msg)		\
> @@ -58,10 +58,9 @@ __param(int, run_test_mask, INT_MAX,  );
>=20
>  /*
> - * Read write semaphore for synchronization of setup
> - * phase that is done in main thread and workers.
> + * This is for synchronization of setup phase.
>   */
> -static DECLARE_RWSEM(prepare_for_test_rwsem);
> +DEFINE_STATIC_SRCU(prepare_for_test_srcu);
>=20
>  /*
>   * Completion tracking for worker threads.
> @@ -458,7 +457,7 @@ static int test_func(void *private)
>  	/*
>  	 * Block until initialization is done.
>  	 */
> -	down_read(&prepare_for_test_rwsem);
> +	synchronize_srcu(&prepare_for_test_srcu);
>=20
>  	t->start =3D get_cycles();
>  	for (i =3D 0; i < ARRAY_SIZE(test_case_array); i++) { @@ -487,8 +486,6 =
@@
> static int test_func(void *private)
>  		t->data[index].time =3D delta;
>  	}
>  	t->stop =3D get_cycles();
> -
> -	up_read(&prepare_for_test_rwsem);
>  	test_report_one_done();
>=20
>  	/*
> @@ -526,7 +523,7 @@ init_test_configuration(void)
>=20
>  static void do_concurrent_test(void)
>  {
> -	int i, ret;
> +	int i, ret, idx;
>=20
>  	/*
>  	 * Set some basic configurations plus sanity check.
> @@ -538,7 +535,7 @@ static void do_concurrent_test(void)
>  	/*
>  	 * Put on hold all workers.
>  	 */
> -	down_write(&prepare_for_test_rwsem);
> +	idx =3D srcu_read_lock(&prepare_for_test_srcu);
>=20
>  	for (i =3D 0; i < nr_threads; i++) {
>  		struct test_driver *t =3D &tdriver[i];
> @@ -555,7 +552,7 @@ static void do_concurrent_test(void)
>  	/*
>  	 * Now let the workers do their job.
>  	 */
> -	up_write(&prepare_for_test_rwsem);
> +	srcu_read_unlock(&prepare_for_test_srcu, idx);
>=20
>  	/*
>  	 * Sleep quiet until all workers are done with 1 second
> --
> 2.39.5
>=20

