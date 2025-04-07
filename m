Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F9E224AFB;
	Mon,  7 Apr 2025 06:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007769; cv=fail; b=BeKMRUMiwrn2YDOZ5E+6JR7WSlWIj/ItHJg4moNmtlDinWiIYXNQykehiD6uHtgl/QywiH4MBtKbCabXBjEKe/zv1U1oh1Jd6qE6W89kcvWkbW7SsjUy2hgI0/kwQGaHV6oOswZOVp6JUAY1QUJeO+yf+Zl1eA/So8AV5+cIzCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007769; c=relaxed/simple;
	bh=CxnfXg87LtES7IGPShyCGXRhymnQDs8YwGeYKhwNccA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f4gngQ98LsU3hLUdaassOIzV6hSdaTSeVeWCHqgiTvBUf89ZebDmA7MYC3+zunha1mzfyAmEsYbKkcamdaB6tLUjlhHK5lgSpwAB3paO5Q05Gw2K/rA85S0nUyQR6K+f+Ir8b6c+FVLk7G3ZmKOB4S5yodnifg+lYvfIp8iQQoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3jAmZzXu; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3jAmZzXu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lM2lpW4JtdZqEfkGaXumKZiTSwriLkE76aBEhHluF4A6GNAbhE88ZTZPr3CWobPnuHS/XvMfQWPHT6KjzcI5Qqhv8dSvuYqzRSNx+gpqi93ZKw+Nfr8aT3wwvnGCkJH/NaHcZMlqiHI6Ixw35oSto6iIO5zTiO7UGELIeGmpLWumnxcUMM21Zgs/ceh/fPbqNBGw0UWlW5SERUdFakXSceEN/M0zJrO2pVDA4sX/5QoGlewdu07DCPK7/1P8NwlxeMHCezQvzDE14YdWodgRTGodYo4kJxAWwkqtVJbSa7INTJn47zn9DnGRxBLS9d0zf6zrMTJdFNcStZ730kbGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sSX9nBOmplvVDMYVof3YUbxlLmHdUdoWE11fSALXwk=;
 b=wNM8kCZ4NsAbL08EXWAV56bSuy6FnlwrXIjVZAS9GO8h+ub+YVmEn5G6xLEFHu1nB6JpizP23/eo6JxacFV4cHr57VlkQCFQUVC5B4wg8PJLu84Dz1i2qQPmWSpHi7zXWWQNjsNP101WoQMO/hauOGdhdcvogF5Yp58RldpwoMyj3ttfinkEX8eVsh3WLrb+9SFmdHLWB5urxwnBkOGI1dODeoolIEZOamz7rHAjasMSseItiMTh7wKUMPnDgbmEqixJ7CMq6iK5RK3LZDw+ghIdskbyHmDTKo54UI4ZdyRC/RvmWDI/omuqNTTOWvx4rUrVj6SWKZwLjBWbBJrlGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sSX9nBOmplvVDMYVof3YUbxlLmHdUdoWE11fSALXwk=;
 b=3jAmZzXuwBCzlPA9/1+InV7BYe9CTQcu3JH/gp3uVyXsEw8FkSleTB6sQekxwStmSNvYfBLswy2RyxevZPHGJaf2HHPgyzcZ+OiUKqC8fxVCbhC+IhC5UPa3knGRNR23sZn3WOvhxcwdlS0eMGkX21iW+lqT8Y7Ob8Ae59j08+k=
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Mon, 7 Apr
 2025 06:36:01 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8583.041; Mon, 7 Apr 2025
 06:36:01 +0000
From: "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
To: Christian Heusel <christian@heusel.eu>, "Limonciello, Mario"
	<Mario.Limonciello@amd.com>, Patil Rajesh <Patil.Reddy@amd.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, "linux@frame.work"
	<linux@frame.work>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>
Subject: RE: [REGRESSION][BISECTED] Firmware load error for TEE on Framework
 Desktop
Thread-Topic: [REGRESSION][BISECTED] Firmware load error for TEE on Framework
 Desktop
Thread-Index: AQHbpZay7zR81Bhb00SU6pRyxcmz4LOXwezg
Date: Mon, 7 Apr 2025 06:36:01 +0000
Message-ID:
 <BL1PR12MB5176333ACE3287786831B0749AAA2@BL1PR12MB5176.namprd12.prod.outlook.com>
References: <ae644428-5bf2-4b30-81ba-0b259ed3449b@heusel.eu>
In-Reply-To: <ae644428-5bf2-4b30-81ba-0b259ed3449b@heusel.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=74559179-d48e-4f27-bdba-4ef7e7ba8976;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-07T06:35:10Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5176:EE_|SA1PR12MB7038:EE_
x-ms-office365-filtering-correlation-id: 619c4843-8447-4a06-eace-08dd759e76b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MttFLwGVFS9FREwP8aAWby3Z2r45x3NyLkh+JiGrcom2nWNkhpvD85ViPk?=
 =?iso-8859-1?Q?0z10SDX8ejqOTEq6Mu0c7tx404IuwY2HIqv16zHLBVOciC+WZwV0EwBfjs?=
 =?iso-8859-1?Q?YaBKV/fxPmQCvQATMIkweQ76YbUeau8QhRFDpV2EbUjO2TMey6246Xm+PS?=
 =?iso-8859-1?Q?zeO0ycAsIdjyrr3rn2n3bdERoUWs8F5X99oW6YqGysdO0uHze7K8fcqcrp?=
 =?iso-8859-1?Q?hzGi/uGzFbPDxLJqRXs5VphmO0YR/ZxvTVl6F3Wlu7kELtmw8Kd3518RZy?=
 =?iso-8859-1?Q?pA5WLHtq6sPHLqq5ZwI86Lzhefsnra1mgjL0+DdTrjEJMGZxBo+4JSQLEv?=
 =?iso-8859-1?Q?QI2nkAHGP3yezDk33adOC+5ybUhWzMXnNOU0WpTWOJwKAxPPZmpiKvZFq5?=
 =?iso-8859-1?Q?lZTabzp0K2ZSiKuj/nSACfaiLgyOG8BQE90t71viyxEzQDvw6KB95QLt2b?=
 =?iso-8859-1?Q?V0mkvzrU1UQk6/5LU2J8u8n248+39zy1SO0WyUzYyHN65mIyAM4NdioH9r?=
 =?iso-8859-1?Q?mm/D/x8iPyvZmmA5cZ/KVhgSjmmsX239jwgr2Yhr240kxiLT1+pAFxKr5n?=
 =?iso-8859-1?Q?DEoO7dyGtUGoX3PfAmUZeS8VJvqi+KMH8g56NHdQ+qGJNnrTlCHtLF7Zsy?=
 =?iso-8859-1?Q?z7dFnNQ/6kkhVWqWA6KLSLX1x2QhncPgp/HOZeK6cxNOiagvmudymWFKLn?=
 =?iso-8859-1?Q?0tgFHOHOuT/On7YsTd7+rLE1W9/lF3G0jAtUbVus+OSD/J6tq2E57LE3Tw?=
 =?iso-8859-1?Q?7s8nxlWOVpkENlDpS+MdQ1lEQ2tBUWAILCjRKrl0TEKbdJU8z0Q29yI749?=
 =?iso-8859-1?Q?7qGbTp/WJXV/ognHmjAvHSj1NVib5AmeBcKhsspLhdB1ZDwwF+7PwMrJBf?=
 =?iso-8859-1?Q?KKammJroRhTFtfb6JVP2pYuMZD7aBTMDzbOjTre1tz/MSLilQgUI2xzDgR?=
 =?iso-8859-1?Q?70mR3WEPbKnEcpfuIuxXcvgLJFni5ohzOcydo4ag3c49m6Gb+KP0k5OvcB?=
 =?iso-8859-1?Q?zRaDFYAIrquAU7vVJ0fIj8PDUszt065XNJwsbVbAt0LK4CGoR0bwkoyjZf?=
 =?iso-8859-1?Q?BYONiAw4YuuwVqQrGaCZSBGE1MgEHh18UFq9znVHqfEixiczs/POB9iT2N?=
 =?iso-8859-1?Q?stSyaOR4221AransJaIxviiOkAQHB6EoD2kPrPiv8273mKgXk5xgBp/6/w?=
 =?iso-8859-1?Q?DZKeP1LohMgtVvvnVKi3rdjD62FtyGJQspwC/dmXdrcJxrNQy2uoX4T2Pg?=
 =?iso-8859-1?Q?wSqiinMqsxSSngT+VaY7JPFBpmY5bLjSGWEfDCrNEGI15/f2LdftQTYczu?=
 =?iso-8859-1?Q?2SE6T+O+9AtiRyZygPrrlAYqycKu0hwp8ay4O1CP1KOggOj4YbGrth+RzO?=
 =?iso-8859-1?Q?sZdwo75OVq6H64A/9jGLmvvzr4VOnXpCuQ+861UdvvXtbWCz5DeKxC/fQG?=
 =?iso-8859-1?Q?kucOJQzTCqcHE7U0s8QNzpPnX3BMaTJDPLmxoeWbwEQpXfrQvfpw2XWr39?=
 =?iso-8859-1?Q?MpxWu5ae8TgXgskvvEFBP/wBlF8hrLSlOvt1ILeQP/uQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NLEME2sn7xF1AxJ5xjXD7fquLRhZbbxmcd6BH+uHBBiKB9ttET+71ZCoX1?=
 =?iso-8859-1?Q?FmJ9XhcC8EfnFqxaX0MSqeCc3ssapXxVgZecjq+eHqK7ogZjgjW5eN4Y8M?=
 =?iso-8859-1?Q?cc/QT1YSSOaHvAcqEUFyns1PbZQtC1b0WWd7Hax6fciMLdzHiHDPN9mNMn?=
 =?iso-8859-1?Q?mRIFVQcUpOROJ6hKQkdHJ8pMFKgWcvjuzJrj8ZND7E57EO4NQCTkzoZkuS?=
 =?iso-8859-1?Q?dB9x4vHmodPZ6kpFCvuRTQX5OWECAleGzLTmMm4mmzFQIPy4Qyi3trjkYH?=
 =?iso-8859-1?Q?DB4sUwkk8iVuf3/TmHxZouJRLuPwJzGUWr4YjoZVdmZThHEWIDfk0dXvj+?=
 =?iso-8859-1?Q?OCxarKnMyqr+LTUspmLf1qE07Xf12bEAOuD9R/j8ZrkErOyVBSYS94cWV3?=
 =?iso-8859-1?Q?GjcdGkz+kvhxitW5OH15IA/k9ZPQ/dNPhRh0GnBeXLUS8n3oDwVCHca+UU?=
 =?iso-8859-1?Q?3PqBw3DCxm3FnJbtpDxFZmkV2Tm4bEf4olBp6Yqj3yNJYLMQhGqQ3m0Ffp?=
 =?iso-8859-1?Q?huoP2E6h2HFAztQCMLNWz4HG8cK2XIPJJi8s0khSc7tgo2d/Xt2AAE23m6?=
 =?iso-8859-1?Q?rciyt2RhQqQ2ZsuKB+aC4lrpo93Mmsr/a1PS3/KgJb5AMKNUl4ViFd0TYa?=
 =?iso-8859-1?Q?ToejsuQpEymSunCPG10d1dSvMC5fvXZ/NDO56ebU/vL543g0ApMv4JrxTQ?=
 =?iso-8859-1?Q?i5YfaX6YCCbaWsHKBv4wv2vHzCbeC1CccaPBI82FI7GPUByYXlSBgRFHvL?=
 =?iso-8859-1?Q?sxvl6nlaQD8Osgetex7oODS9h3aAXl17/j02zxHEzVhYLRBCoKTXkn3a2v?=
 =?iso-8859-1?Q?HxVX2PBOoEJtwLrwvF2uDehtSN6J3ym3J0i/CIh93xQDEjRxaI9s4IcIXe?=
 =?iso-8859-1?Q?KotWYCkaiGw/pKxQHoYnCouRdECtzohElaOL4t0QLj+PDwQnHCttDG+nGm?=
 =?iso-8859-1?Q?JaNQvhjAmUVq2bDRGhHnhoT+MQ31O1UP768NyN8w6t46JwhSoDHMjNxdrB?=
 =?iso-8859-1?Q?QDb2/vAgiX5GSgUbuFnbIhXoXUN1WyZxjvtWEJWDBxFJkaXoI63XPh5L63?=
 =?iso-8859-1?Q?wmNviVc+Mip9rfLOawuIu9tPvlSuSOec+ScWivx7NHx580qD6qpG3ENC33?=
 =?iso-8859-1?Q?ajly1YO88jCNnpxob2FdelVe2e8r4Isz+bvigfPOEjikuilul9ubjmn+kP?=
 =?iso-8859-1?Q?ZQCN5xmkCiWWiqnHy/9F4NbyFULzy6UXbEG6H1KoTld/1CX7xnt/4/0oDe?=
 =?iso-8859-1?Q?Pp3h4sXzj+CwY1m7vz+fgZQyJMLPFfDtIjvY3U259mikfHHVYd9iXqtP5u?=
 =?iso-8859-1?Q?aHmGyOOTUSou7bsVnohdie42sd1WaZS5yx9YNx+u1zsDJvigp+E6934ri7?=
 =?iso-8859-1?Q?xxFEprMVknCOBScC1+wR3V3QCOePq3CoD5CcuKh8z8zFF29t1FKFhN0Q0R?=
 =?iso-8859-1?Q?rqkoYpCB7VjlgHKBNGCjo817NM6Xjwfx9crYxfP/AZk06UbQU62k76b3aP?=
 =?iso-8859-1?Q?5vfgQMeS6WBcTPo9E7b5PhESWtN/Q4ZwH5xPP8592FZx89/ntj4dSxm4hk?=
 =?iso-8859-1?Q?F9Nw23tIEjltdAhSZLObIU3cZ66UENXTMV2xhyZGTq+NBQVelsn/Mp5ZWW?=
 =?iso-8859-1?Q?bOR15k+GpQRy0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 619c4843-8447-4a06-eace-08dd759e76b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 06:36:01.3010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POHlftX7PlaHmaS2QVRk12v6V8q0vFFMu9dhvr7EJDJ01ss94ciT14aK2xHDZ/6NcGc59L48KG/nmPdkbOXECA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038

[Public]

Hi,

The file "f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin" is missing from the "/li=
b/firmware/amdtee" folder, which is causing the issue. This is because ther=
e have been some last-minute modifications to the TA firmware, and as a res=
ult, the firmware has not yet been updated. I will inform you once the upda=
ted TA firmware is available, so you can provide your feedback at that time=
.

Thanks,
Shyam

-----Original Message-----
From: Christian Heusel <christian@heusel.eu>
Sent: Saturday, April 5, 2025 00:50
To: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; Limonciello, Mario <Mario=
.Limonciello@amd.com>; Patil Rajesh <Patil.Reddy@amd.com>; Ilpo J=E4rvinen =
<ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>; linux@frame.work; platform-driver-=
x86@vger.kernel.org; linux-kernel@vger.kernel.org; regressions@lists.linux.=
dev
Subject: [REGRESSION][BISECTED] Firmware load error for TEE on Framework De=
sktop

Hello everyone,

I have recently noticed an issue on the Framework Desktop where the followi=
ng error pops up in dmesg after upgrading to any version beyond
v6.14:

[   12.136102] tee tee0: Direct firmware load for /amdtee/f29bb3d9-bd66-544=
1-afb88acc2b2b60d6.bin failed with error -2
[   12.141252] input: HD-Audio Generic HDMI/DP,pcm=3D8 as /devices/pci0000:=
00/0000:00:08.1/0000:c1:00.1/sound/card0/input8
[   12.141601] failed to load firmware /amdtee/f29bb3d9-bd66-5441-afb88acc2=
b2b60d6.bin
[   12.141843] input: HD-Audio Generic HDMI/DP,pcm=3D9 as /devices/pci0000:=
00/0000:00:08.1/0000:c1:00.1/sound/card0/input9
[   12.142005] failed to copy TA binary
[   12.185200] Failed to open TEE session err:0x0, rc:-12
[   12.185202] amd-pmf AMDI0105:00: Failed to open TA session (-12)

I have subsequently bisected the issue within the mainline kernel tree to t=
he following commit:

    376a8c2a1443 ("platform/x86/amd/pmf: Update PMF Driver for Compatibilit=
y with new PMF-TA")

The error is still present in the latest mainline release 6.14 and sadly te=
sting a revert is not trivially possible due to conflicts.

I also noticed that there is a commit with a fixes tag for the one we have =
bisected to, but it's included in the same release and therefore does not s=
eem to fix the issue at hand:

    5b1122fc4995 ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_=
pc()")

I have attached a dmesg output from a good boot and one from the 6.14 where=
 the failure occurs. I'm happy to test any debug patches or provide more in=
formation if needed.

Greeting,
Chris

---

#regzbot introduced: 376a8c2a1443
#regzbot title: x86/amd/pmf: Error on firmware load for TEE
