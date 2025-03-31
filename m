Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2135.outbound.protection.outlook.com [40.107.247.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C981ACA;
	Mon, 31 Mar 2025 06:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743401883; cv=fail; b=UByvfsC9m/9NBS4XscwAI5TLt0iWrZupexmiBryBHQGtnIQU9arYOxMJND5ReZgF2lcYKaNaSwJbybpYjTzt6GS4wFIPbl86j3CAnglUp+N6Vlwgg/GGnHS7babm+3vX8bzzhPDO3WsySDmMu9OPuP03orxW2ur5hnWfrT4u87Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743401883; c=relaxed/simple;
	bh=908SgiF6mmhL+p2LUjbHSpo0053IXM9JbWxTegU96SU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=l9kuZM75PtMsX017awI1i4nTAwsmi+gZiUtMKzbqkuBxjcPfqJdeiHfcTXEHeq7U9/sIKTvI5+wu4cOJyWFHoGmePsKYjMiWv+GOuy2QP0rF8bihSrotEg9nxSdjs6t+R9OKqUYJZejLbg20ynuDOylOAqIDzcvXr5V71zyBH2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=anton-paar.com; spf=pass smtp.mailfrom=anton-paar.com; dkim=pass (1024-bit key) header.d=antonpaar.onmicrosoft.com header.i=@antonpaar.onmicrosoft.com header.b=P8dRXzPK; arc=fail smtp.client-ip=40.107.247.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=anton-paar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anton-paar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antonpaar.onmicrosoft.com header.i=@antonpaar.onmicrosoft.com header.b="P8dRXzPK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmW2y2mu1S7mayUiTCOwh1Z4VMToW7JwUgyVCXzao6nIRs2rdbFBh/4lI19fS8hJU4WlzVgYuepy1i9awEUZNx1lnx129IpyHLGB7phE65TO/6qaivzrShH8Xd250ne9fq3I9bfPyE+4KIUpggN/vK+K3S3Jyr3PkrUBn5vBMVJLRbBzNR2XUJ0Vu20OcBlM/hB/azCb4zBLtec5JtBYtaaSmOAU4pwG4nTxx7GYckrEFCJQMJKIxFjB6b28UbWkDw0qQhAMcyfEgV76aDWiLyxtcAcYFWUm7FoGqIsTJvQvP9DigfQxC/H66pgHgHQxady+DAqHskVhJSnL5PQADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmUtCnMs7gjRWYgDbsUV4fUBBYqqjiSnwKChaaQCSX8=;
 b=SnW28CvQ83s0qv+Rh9ptM/qocQCZjGS6Qb+qD2xeeqph6ZnC5O70dWP9uZPZLDoWc81/GTuCeYxGABjE4Ybbv4nDR/EMRzN0Ch+o2zC/69keqFpZh9I+goGUVYSC/iGfJnj/XAjQXjbh6c7YL7FP5fn22x5MIhzuwsFjT084wamQ4xE/BjEPV6ytzEoI144w4J1uLyf2JRab62X1n43odQ9jnmPzXNWMRxU4HtKFWI56W7MLO7IH8UzxIcbN/rayh2gI/iOCn1bA2jB1D5qpVoP+aH8L1rye9gu0amu7zIDeOhUoPX1QmYDRuGuskyX0gHV2gtZmczoxfNUQrcZA6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=anton-paar.com; dmarc=pass action=none
 header.from=anton-paar.com; dkim=pass header.d=anton-paar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=antonpaar.onmicrosoft.com; s=selector1-antonpaar-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmUtCnMs7gjRWYgDbsUV4fUBBYqqjiSnwKChaaQCSX8=;
 b=P8dRXzPKUGNgVwuXevB1vi8rQLUi5hRdOVljN3fGsROwofIdWWy9KVYVNA5/7kXlq5nNf/RajTTUcs4iiM1TV0652IJsEOD4Uk9DREmbZ2d8fADgoFXDDncAqcCrmbqddBMKLZ/QcIxlZEmyWoERfnUZQBpy/YTEtp8eRvcMx3c=
Received: from AM9PR03MB7074.eurprd03.prod.outlook.com (2603:10a6:20b:2dc::20)
 by DB4PR03MB9602.eurprd03.prod.outlook.com (2603:10a6:10:3f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 06:17:53 +0000
Received: from AM9PR03MB7074.eurprd03.prod.outlook.com
 ([fe80::412f:8c76:f36c:13c8]) by AM9PR03MB7074.eurprd03.prod.outlook.com
 ([fe80::412f:8c76:f36c:13c8%6]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 06:17:52 +0000
From: "Lalaev, Andrei" <andrei.lalaev@anton-paar.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, "benno.lossin@proton.me"
	<benno.lossin@proton.me>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu"
	<tmgross@umich.edu>, "dakr@kernel.org" <dakr@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] scripts: generate_rust_analyzer: fix pin-init name in kernel
 deps
Thread-Topic: [PATCH] scripts: generate_rust_analyzer: fix pin-init name in
 kernel deps
Thread-Index: AQHbogPYbOUx/iCN1UWOO5t+F1cPWQ==
Date: Mon, 31 Mar 2025 06:17:52 +0000
Message-ID:
 <AM9PR03MB7074692E5D24C288D2BBC801C8AD2@AM9PR03MB7074.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=anton-paar.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7074:EE_|DB4PR03MB9602:EE_
x-ms-office365-filtering-correlation-id: 59bdbf38-79a5-45a3-7935-08dd701bc4e4
x-ms-reactions: disallow
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xIa8vQcyEDx4TaTzAoQS/GLJ7jScvncJYDmpgKrWhQdjWbogb4RZr4v6Z/?=
 =?iso-8859-1?Q?MLYY95cqPvnFHaGvtLy9XRQhIsetIXQRSsN/wZtaMPQ2rI8Ssw4eUPGhyd?=
 =?iso-8859-1?Q?QO+Z7Io24uO3YjOHs8+I8Z7ssg8VoziOEikSFAPfKqyQHStPVAy0qriH24?=
 =?iso-8859-1?Q?kbdO5IAniinOVEB94vozV4nQSKOvnwlOrbCrUi5zoDffM/zQNVV7IvnIdy?=
 =?iso-8859-1?Q?VbxM/wGXTCxxDOVDtGL+/VjlABs9tWVeA5N9LRsoKkk7DzWGerzciw+lL8?=
 =?iso-8859-1?Q?CrZOpdYo0RAts6NYba35qTI3OJZ2eLsgHdh0fJK2AtFsHHnOSvymUDpzQX?=
 =?iso-8859-1?Q?iYQPicBSlBSgfVvzKkPKkVGQbVoTWlQbSuaGrEN7fh5Pf9CEnePZpBPPKf?=
 =?iso-8859-1?Q?Ppe0iYD3wUCp7lEpcvu1+88ikiw7MZe/sHY3s7t+Ls1O35QkgW4T31+lNh?=
 =?iso-8859-1?Q?Qy6VXAUP4bYEj9qYSgnwRRj4m/BFofJUwjkFJyzzmctvm2ejPAzIjWzXfL?=
 =?iso-8859-1?Q?WFdcZ1siKBQJIdvrUTCsMfN5cBVrQvjrdMxJ1K5rk0nxC3AuYpXZRkuu5a?=
 =?iso-8859-1?Q?Zg9yUDO0lgd8xPI8a+R2oVMZt6FD+rzQho2YhOEuVFWY3y1LFvtRecU9Qr?=
 =?iso-8859-1?Q?7mi+WL8ZFuaop+QW6m9UcEnVIj0HZR9sxqX/xFOBJsWGqGwetwLKCgQ1NN?=
 =?iso-8859-1?Q?D5BzZxFmOFsddCgBeoUmIIcyum2gKjCrxwHsDZgAUQUX/7CugE+NYYX1x7?=
 =?iso-8859-1?Q?PCa5hocJ6NuDBRjgR+E9rMG3ZeyftFAqnKHKdCfH7LiAkvkw+f3zjw5gBF?=
 =?iso-8859-1?Q?1vi41zMXL25ItHrRKmsA00WXsgviPkwvIkUqrqqyqu2kRFv/wAk4xqdWyc?=
 =?iso-8859-1?Q?OUiIofdDI45d6ajlDQtj2lFZezub882ffxYteHRpTaLSzYuno3yV0GTgGG?=
 =?iso-8859-1?Q?EPMExlWRqkodW0ikXlPOfnKYroAM48WPtym9saWCnmzaG9m6AuJRCvzqCV?=
 =?iso-8859-1?Q?vy0ubCDmZCAFdloCOFonddOsYdjP5OkgGpuNJM0e8titGD0BBLVAXM66NX?=
 =?iso-8859-1?Q?G7NeqzqbEr6FFqJKLckxWgIVYtoDtDeBipCKxNRuZsgZwz+zZH9sJMVAw5?=
 =?iso-8859-1?Q?eQCUigndgNj0fH9aRIHtAIHioqhs5xzGYbytknH8PqiLE7quWbIF05Am+F?=
 =?iso-8859-1?Q?3zqywmkLjBLzofWjFBdQ/Qw8jBedFUal+aP1reEeu38J3Wy1M1hxGRqPwa?=
 =?iso-8859-1?Q?YqSBcs1jSvH5V3uWp2hnbhd6FvHNIwksr94pLf3cBL9mVF2iYXh+1x+STx?=
 =?iso-8859-1?Q?7053WLs6SbHuxtqNmWhffxK9S2QsLFKJvIIxS6brFp30DqSn23qNxnnB3Z?=
 =?iso-8859-1?Q?sroVdmnJiS4cLvzeNfmMpc5oww50nK76d3T+wNolrms0SliT/6eW1+tfvt?=
 =?iso-8859-1?Q?x8quEC24QEFqKEed7UTT/lLFrInJtPutULBfJhH3y5sLa98rBmdbvDPm3E?=
 =?iso-8859-1?Q?1SNBrWs8LZDg8q6JJ4CZfRESsE0xSBZx0krf8Se/aEHw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7074.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kCQI6EHJIHpp9IDvGLOrAbtdMHeugh+m6oKer22eh+Pf/b3MYYEVM+g9sO?=
 =?iso-8859-1?Q?DznaBEeUQ1S77HLEKt3I1KHOEbJV42mw5h54CuCXXoq/eIEjcSEQGcfwmc?=
 =?iso-8859-1?Q?M8/crxv2pdiBoFbX8PlAT54PB30yLacFHKJ1J4ern8/xOA2UwMn2V/r0Cd?=
 =?iso-8859-1?Q?lsuVc4OYf3FgNQqPlj+CQTEG4K82nVGSGMGkrlgJgPn5yjEG1BU+CbG2ZL?=
 =?iso-8859-1?Q?5Z13lICdhLisg6L3VwGij2kGEBN/2qYU0Mooo/wpOG2KAe1sPS1TPOT4kV?=
 =?iso-8859-1?Q?axiri+6c+UAe1xjZj5dQAMKN+lgD4idCXzazwBoSYogOn9UAzagOBOAPFi?=
 =?iso-8859-1?Q?/NL+VvPJIPetxm+fZbQ278jSBL5Bkf7Z1BZNU82rud9uDClgD1UxVS42Ti?=
 =?iso-8859-1?Q?KqHMt5AHSWjz1g23nALSxdgVBHYC0WSlQrQvVaVvTOs55DX7blzrIXxgOc?=
 =?iso-8859-1?Q?yJ0+X9p7eZnxI9ArRKPQl+TC4Qqer9BAAd6QA3DfqGT4zXJ/txeqYyOcfI?=
 =?iso-8859-1?Q?nlysSORtxYA9r7nVCbm0kMIbQREzru/CVkvwR2hao/F6Eus7zODRdVXokV?=
 =?iso-8859-1?Q?+T+0eRJwmsDlij8G6Cxjy0b+Xcmrk8ueqmWqsmtPe3pIeY7PWLhhHcHAds?=
 =?iso-8859-1?Q?5IRno5jqeiXWNBozg0sMx3+JVpxBsQdTuKezccfd4WJLXU5c/vDtb3zxNn?=
 =?iso-8859-1?Q?Q6dJbeU8X6HHExI4/jczWY5jEO6rXAklaa5P9Eokg6juwoiMhs//gkLo96?=
 =?iso-8859-1?Q?7rTctNTR+XQAxpaipKXLZYQG4XMTU4pm1XMEG/zKD2JEt34/bDlpgfeFR5?=
 =?iso-8859-1?Q?2vt4wwWXqB3TI+oFLTOPK7q1m99GeRQVAMoBjazQcRNeVckgWu6FV5DfSF?=
 =?iso-8859-1?Q?cYYHSBz+yC7UzkxYBhWG2BxEyATjLcHKP3wA0jKjBRSuEjxM53fabB9fCX?=
 =?iso-8859-1?Q?fgWcsj0Oq0dRKG7TU6O2C/okr11QbY9P/xgenE7q44qLTp6wH3f+USphMg?=
 =?iso-8859-1?Q?q33ZnoLGU1vItq1uy2errnck9rQ6U8vdZDZbCxa0U8jPsuS8MAOKlzlTeK?=
 =?iso-8859-1?Q?Pk3TmGInCt7RctndXbp7YS7suyzPT5nzIb4/JCxLOieWQGzUMgVjJK4kpR?=
 =?iso-8859-1?Q?jYsOy6g8si6zig4c6yP3Uad+ZI8E3Ucdrp8/7VGpJys6m2TEfl/WsjC4pG?=
 =?iso-8859-1?Q?v24Kh6vp6vwf3Gr61KwterjyFyin7ommEchW4Pe2OKSGIZw7HZu5eCknGt?=
 =?iso-8859-1?Q?SAeXlEGCmweJTSgt/oJKZ+Uc8DJTYLm3Ry9KdPSRiFU7D/dnyp0IG6DXsF?=
 =?iso-8859-1?Q?JKbFUy+8a79iWYViIxBb/RVxKP7c+fBU9wPD8zNy6hlJ9AxUkyFqjGCsjw?=
 =?iso-8859-1?Q?3hrUwGGkEpl2P8LFscdZVk4tE5GG2ZAMId+tyL6xIlzyO2ssbAdhKnyJs6?=
 =?iso-8859-1?Q?gatf1sJFgLBSW0oVPacv55dGW3Wqy8JxZtGmFf9t8mJqeTo3MCjqxGK+Ct?=
 =?iso-8859-1?Q?RLdDErQqz7nSS5VUBPx/WQcLfrKz6NBvjtGew9FvU6ccx2nGoDItqPklQI?=
 =?iso-8859-1?Q?XsphYUCqA7d5PLHYuSXbQgfAZ63Q9X5/olNrMB3DE/NoAG6cked0maGHUs?=
 =?iso-8859-1?Q?MdCv6Hrsy9iIylJD97QuITSpDdJplkqfPiKh+hle7vBBJg+zJAIv7Xhg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: anton-paar.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7074.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bdbf38-79a5-45a3-7935-08dd701bc4e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 06:17:52.5776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1650d056-0824-4040-8341-61f3c6069bbd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unngyfCzLTb17sfQv5Nd7AJkDXxZkB8y52HAx+gX4D+Pum/K6rRy1v+HUnnC0lY8QMkJ+fS8qZSHQ1VNCL2SjaEBgoursiAkzQYMGHps27c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9602

Because of different crate names ("pin-init" and "pin_init") passed to=0A=
"append_crate" and "append_crate_with_generated", the script fails with=0A=
"KeyError: 'pin-init'".=0A=
To overcome the issue, pass the same name to both functions.=0A=
=0A=
Signed-off-by: Andrei Lalaev <andrei.lalaev@anton-paar.com>=0A=
---=0A=
=0A=
P.S. I can't use `git-send-email`, so I hope, that the formatting=0A=
is not destroyed by Outlook client.=0A=
=0A=
 scripts/generate_rust_analyzer.py | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_anal=
yzer.py=0A=
index b0d7dc1e9267..cd41bc906fbd 100755=0A=
--- a/scripts/generate_rust_analyzer.py=0A=
+++ b/scripts/generate_rust_analyzer.py=0A=
@@ -133,7 +133,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs):=0A=
 =0A=
     append_crate_with_generated("bindings", ["core"])=0A=
     append_crate_with_generated("uapi", ["core"])=0A=
-    append_crate_with_generated("kernel", ["core", "macros", "build_error"=
, "pin-init", "bindings", "uapi"])=0A=
+    append_crate_with_generated("kernel", ["core", "macros", "build_error"=
, "pin_init", "bindings", "uapi"])=0A=
 =0A=
     def is_root_crate(build_file, target):=0A=
         try:=0A=
-- =0A=
2.34.1=0A=
=0A=
