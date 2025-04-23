Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023116.outbound.protection.outlook.com [52.101.72.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B8A1A0BFD;
	Wed, 23 Apr 2025 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410330; cv=fail; b=Gyl01SgrwTceARfNwOQ1GdptOGLvipLM2NLFt4/69t0tOWUdEeLakhMsIwoDiWCAYzXeJBRv07sBYFMHmkh+NLbWToePyRLBStF/TS/t8H9isMmXzewr2hyZcZp+J8EhVR6LbBSwh7W6aMhwohW69uP/pSBCI2YJ/29ODd0A2Cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410330; c=relaxed/simple;
	bh=qI4UyKj0oDZFrshmZyt4BU0cZX29Mdcsn0kOJGo5Aq8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=N93c3yebPPRUVSGO1Kw+ITLjYiGO46Iov+QlCagcAZ64TlBeCEj/hL211l4qNDxMmK3MyrwUBV5K/QY2cQsLlhXFR4W15HgkOF5qBISYbSAMcOX/L+GaZGzVe1q0bmFbzmRSpTlEXyDo5v5Vqb3/MTtkdbXzpA+J+bICJDS9/mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=i/lJMD9V; arc=fail smtp.client-ip=52.101.72.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="i/lJMD9V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nddUa0d14xAzGFXmS/wQNdQqLYO/alLKBpdV10bLYI8nQUK7qaGYE/aedjse9zVyNld8Si6z+KSJbV5LgDgzxmgA/Gp6SP+xq2+1vFP85Ms2JGA5If2MKAoWfx/QntAZJ6QxZynWaUzfowiU/i2bNSBnKFVyfvEutzo6t57RnYWNKXgvl10bB4RsltVyYi3F39EUnCRx7OPFxwSn+tSDD0K+O95fzH3Gg3inT5tS1UGmhdrqfSLjxGP7k/hPaDcurrsLZxRcSc0Cvxk+gheTUql1aMxB4utDTvkXn6NKhzm4Ludjjb7yYmkHJzZgVY9FjewP+CLeHe/nGTqictu2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Kf4adpV+Zy5zabkSi7na2J8Hkrn8G520yK27INw74M=;
 b=kKFFP+WK6gljt22t6WtHvuxsFGW9IYb+xzM2y1iFw3KNNqOQcPStfdypl6caTI6L81M/+50sEcjPIZh2v/68cLOuRg1Ow6aVEFt+uLk/0zcxk7jCxQFyxdGZRxGbLrxMaD05/CeGs/rXvc8GvSl+U50fBiV/dB+F8n63Om3cdSWGO/odwWXLJ2URS++D3Xo/dBxtdWOgalfPX1LLMJHBtEbpfUMOjbfIoDPhyh9oHCNJLKfY2UYbImtv5woFfMC7TSmYW0IxY3JpQK/+QxZYDjaI0wFH4HyMRAoXYSUz/G4jnx9tuz11pl/L+xYhRKgSPdUlgRyPBB+/9fU7NiSZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Kf4adpV+Zy5zabkSi7na2J8Hkrn8G520yK27INw74M=;
 b=i/lJMD9V7iH9Au/Yd+tR7vgDAWp7GewAzheu/P57bpspVeapUPqMNcZP+1DPv0YX8x754/TugvDqQeuTRjiwT/5KhCz/cUknRm+KQ3AQjNcb4Kt/0GcRkfDat816dYd+zTbHKURl6K6Tbk9dTEXi908dlrewH7rKirndFATSdrf2UKGtirJGS1hmvWOfyJ6YLnwnBJkUdfd1z8MwBd+s5kIzq9tv2KYrhj6jugUAvq2XKX5g1Mn+Xhdx5a5hAF1ua0a5pMwN7+sboIvMK72t2Xy2KwzjCPqYvwuRKGsq3drTiJYLoZ+JGc/yxTjGYfN//EkVsq3trTt8ExsfHqqKNw==
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com (2603:10a6:10:47f::9)
 by PAVPR09MB6605.eurprd09.prod.outlook.com (2603:10a6:102:32b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 12:12:02 +0000
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95]) by DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 12:12:02 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC: Djordje Todorovic <djordje.todorovic@htecgroup.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Aleksandar Rikalo
	<arikalo@gmail.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v3 0/2] Use GCR.U timer device as clocksource
Thread-Topic: [PATCH v3 0/2] Use GCR.U timer device as clocksource
Thread-Index: AQHbtEe4AW+VZsPs8EGs7hseKDfKbA==
Date: Wed, 23 Apr 2025 12:12:02 +0000
Message-ID:
 <DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Enabled=True;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SiteId=9f85665b-7efd-4776-9dfe-b6bfda2565ee;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SetDate=2025-04-23T12:12:01.593Z;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Name=HTEC
 Public;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_ContentBits=0;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Method=Privileged;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB6196:EE_|PAVPR09MB6605:EE_
x-ms-office365-filtering-correlation-id: 2fe77388-62e2-415a-49ef-08dd82600e22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kI5n+qr4Md8hnzsG9xYjJuqjfLp2MwUIHRUjRC/FxTkYov3nBmM5im7MiZ?=
 =?iso-8859-1?Q?QO3T4GgYOSl1jRxbThsdEq9QbFiUbAXjFEX2Wc1YftBl9mccc+1hBKnpmC?=
 =?iso-8859-1?Q?fUcdyVVKt8KJ3Qs9Ge6y38SfRD89ctUImPowF+WUy2/YcLQeq0JLWlUpJz?=
 =?iso-8859-1?Q?oYWIoKILfJKYJ/8xfzrdoOYdnU+jBit5CpDEE1kyDshrRt/05bZWZQ8p89?=
 =?iso-8859-1?Q?f/sULfNognUPuk7CM7b38EE+rH6d6lTtvVml0n9evBhqlVmd1vZlVOmXLi?=
 =?iso-8859-1?Q?LWKGRS7YzQPUHAdJyX9EZ6sZuVzGqhZ4GhGdzxpa5dDR4M1mR3cfeasHM1?=
 =?iso-8859-1?Q?tSjExOxQC923FzxWzhZzvN7MCAsiAVjABSxNxERLjlr1k2lBQd6uizPcPz?=
 =?iso-8859-1?Q?IMnFdc/VYnShocH1n7GiBqGyJYexBUXKAgP0GUQ5wLy1QU0/vZd521lc07?=
 =?iso-8859-1?Q?ija4gnQLGWBp+RvwWrmBdyntg+LZDuB14RCruQoP0Vu6jJlF1BNCEECQIx?=
 =?iso-8859-1?Q?2mquxakvd8pA89qo/M2bFMn2tJgcSfBhXGeZE6USWDSnyJLGwWNRfZ4UGx?=
 =?iso-8859-1?Q?GZrSGdoOx4fxY4hAeD1HvGKiCGyuvf2itiNsNowzX+H90M44Sua+xOUaeu?=
 =?iso-8859-1?Q?QRY4QWj125ED5HXDg4231YvXxTRh5wjfwsBI4tao6/vKSs3GxDLBI1pHQ5?=
 =?iso-8859-1?Q?TtDD9W1u8Qzj8j61PtdrBHnS2P0/tPKv57MUaKSkr5dN19K2cShMPnQPUa?=
 =?iso-8859-1?Q?mQhHIYKJ1euXraFTTT6/hmZGa0cB2dPiDaBYepZ5xZvOmKBhL2Fm1VdXrk?=
 =?iso-8859-1?Q?7vT5xXtaHX0hw2fCiVOkxPoX9BXG3bO6kbhOrZUd66KP8H/Hl7423Hq8U6?=
 =?iso-8859-1?Q?UhKcPXq6aI+8vjRxj8k7ymVgVUB9jT7Rn6WrNecGmzykqwqwORiye15KlJ?=
 =?iso-8859-1?Q?YdYJOoP0ZoyWcnueSLt+iafJsrLBk/cFUBYsYjqvosKvJoK+rlh6Af0C1g?=
 =?iso-8859-1?Q?bvCBYDO7pbUjURVLMH7Xn4s909UXlySocP//62ZacTtqtpJrXe/NfZscAe?=
 =?iso-8859-1?Q?vVjiQx1Wi7rILDOZEPeguBJe0Uthp+qbiMTFm6cPuBlPppb2cnJBt3LSuv?=
 =?iso-8859-1?Q?LP/Xf+6sheFmIbuMx7nmfQAaypIQIAuca5+uf3sDJlpSsW5tjZJDcw+ZuN?=
 =?iso-8859-1?Q?ysBYHItRI+AWKceTHIEkEjtfu/WMasj+No2CxzTBia419RTxZewDkRH2Ds?=
 =?iso-8859-1?Q?70PMmAB9XPqVzDz9RCZzLoWlv2yaGcHm7yLIQbCSefIn5SOOZOOO7SXjY8?=
 =?iso-8859-1?Q?Bt1L/k1GtL9qwGPJ69sOHH3P/IEri5j9ySWE8fE32Xo+unKsEF2tXmYeiI?=
 =?iso-8859-1?Q?+QEVgzJ2pufOn4nDXlf9y47jGlfYbpxrEhMFA+2J4Tj2EyC6RoO6/wNUmA?=
 =?iso-8859-1?Q?1DxTUU1GfvEJ2nPAOe52MTipsY6BtzJ9ljr7IuCdWgjUhwqPw14GETEfg/?=
 =?iso-8859-1?Q?nF3zlwHWoSjmgmrMl4ejTbTuBZpPAnMIM69X71Bxk+e0owCgdGbwPxb3W1?=
 =?iso-8859-1?Q?4avbHMs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR09MB6196.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qBBZAToTmeB/rf5X3M1lh1G+th6+Az1JqnlNJRJEsMn6A3KAHLNHmQFHAV?=
 =?iso-8859-1?Q?isXqEWlxfdfY+i8Y7lupnk3DN4fLPUXazWwd94a4VMN6esm3YaKSDPV9H2?=
 =?iso-8859-1?Q?nuE26j63cfIH77aj43sRjO2m6klVJxAwgJ3QD6SxpqcxfhGoqI3X01EOCy?=
 =?iso-8859-1?Q?hSqOSZZSjdlXEA57rPqe9YmutzhTiPEaXdgSXK4IavTn4qZYocUL0GYFcB?=
 =?iso-8859-1?Q?s155ivNBkBUT+me/ohvr3O9Hqvmq0xOcN5stP6XDvTGFIhCqRPuaqByxIq?=
 =?iso-8859-1?Q?qvgVFLZ/x3SVtOQYkRgQNw/c310tJBX4tv+ZVs3gnzlY7/UrLRKPLhHJMi?=
 =?iso-8859-1?Q?Be0PEoIJeS2c5JnzAndDdtrj+CwEjG5caWX6qzkSJh+YwtMy0Q8aB2Y4o9?=
 =?iso-8859-1?Q?CvQ0Rs/L71pBMg70fokk1p46Dazp/SPDCwtVjToCCffJZMFfZwIKmary19?=
 =?iso-8859-1?Q?pXt5MjEYExM8Qw7M368oKAXp3YLsqYSyESsogjef+vm2P8NC+OWq+skZc+?=
 =?iso-8859-1?Q?DTRb2jCfXH3odjTAikb1uog0IHPFBS4bhGtYbCpW98KHH9YErqHyQAw0GZ?=
 =?iso-8859-1?Q?WFcRkVkDHOT7zebAH/s9begBRDNMy9E1TDvRUBhXzG0QZQkdsvHl9Y83ap?=
 =?iso-8859-1?Q?kiOGWTfF8FfT4sVzo84e3tkcWbDmwR81Etl1RakohanSD3vIuU+bNMASw8?=
 =?iso-8859-1?Q?6lnBMe0ovRg4gtL+Eujlxo9U1uFVNDIXoj5RHwcoiAJYSOp6qNBSZcik0Z?=
 =?iso-8859-1?Q?Ed/MpNFzA7y6XCZtEDyFVkJTSFH5QwS/HDVlRV7HlMBR9G2DYaXVyua6pf?=
 =?iso-8859-1?Q?YT+8wX86QmYB3kJ5rNFlVD+ONTiHfL5OwrCcZd/fN9r+aM3hrHw8G58JUL?=
 =?iso-8859-1?Q?yDdbbwQTaCIK25Lz1sMipbVIRXiYKyaKYN08GlC2AAAse3PS46BeRRrdmB?=
 =?iso-8859-1?Q?0Opfj12bXptw8k2y0Mjv+xMmvLE2v81AHhaQ+2qBD4XXR29+vPnYJue+4C?=
 =?iso-8859-1?Q?BodybtBRdyejJ9gbG074qYRF5N4gDoHEqSrkC2F3PQ39Pi3mfWwmggHvHW?=
 =?iso-8859-1?Q?Kbk2vPm77rXUCQZKEls/KCjmeYFD+4ou9pGTr52X+eBzdj/Lng5vbUBix6?=
 =?iso-8859-1?Q?8fQQFmV4HrSjFpUrnyU6RJSlFizWTCj75U5cOeqvf/R0GDanlQdiipT0OU?=
 =?iso-8859-1?Q?YCxFlqaivxZ5NG7NeDWEuK+NLT7AYzeew2pc0T1FN2r7rnYI4N4AmhiXAt?=
 =?iso-8859-1?Q?s+JFkZaUCzwJ7+DrUStdz4b8GrD4zZEF8EjLIObGnzfi4NNuy22kPZGsDl?=
 =?iso-8859-1?Q?EqQbcMW3OC9WcqujQZODcf3f9DZLp98jehZMKO3iI9a7NrEAvZccSBebf/?=
 =?iso-8859-1?Q?nT75ftZi77xjxWubBzATXNlPdsmkZOwriU77xNwlmb1VFovC38UUGWh9Dt?=
 =?iso-8859-1?Q?l8OJTEZ5AmeXXfkKHcWFkAP0v7vEGX6zZo8tNgFiILinJb00d4Ek+6MHVX?=
 =?iso-8859-1?Q?yuja9XfE/m0Kfoh+dcomb5YClhAwX0wwKuWxVsStzKYCUtwvkHUKWYZkNM?=
 =?iso-8859-1?Q?fea2A23fMVYZGJSlrL/iRxci2EdApkGhG1G4maa6LOE8M4E8tyKqIGYgog?=
 =?iso-8859-1?Q?u87IyYgWlQmzX6S6206GJqwYGs8xkN+FhS6Lg/aYMr26vSDmSiM786Fw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe77388-62e2-415a-49ef-08dd82600e22
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 12:12:02.1772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ufwP9O9Q9GcOhstgjrmfzRWmx4wFvlwYthB4IFHtKFo1qR7ouW3vkzDnnBRdOP9rCB1Zms4xZZAERD8vVXyUhB8WT5Phkt6fdM7Oebw1hvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR09MB6605

HTEC Public

This series adds bindings for the GCR.U timer device and corresponding
driver support. Accessing the memory mapped mtime register in the GCR.U
region should be faster than trapping to M mode each time the timer
needs to be read.


Aleksa Paunovic (2):
  dt-bindings: timer: mti,gcru
  Allow for riscv-clock to pick up mmio address.

 .../devicetree/bindings/timer/mti,gcru.yaml   | 47 +++++++++++++++
 arch/riscv/include/asm/timex.h                | 59 ++++++++++++-------
 drivers/clocksource/Kconfig                   | 12 ++++
 drivers/clocksource/timer-riscv.c             | 32 ++++++++++
 4 files changed, 130 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/mti,gcru.yaml

--
2.34.1
