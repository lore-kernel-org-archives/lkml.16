Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE76BA38
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 02:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746584513; cv=fail; b=NvhFUweYFlPNccuynBL23XF27YlyUo552FWvMccDfk7RqdeIXz7Xft0BxSBZTC3vKmytj+XM92+Bpeza/F13Rh/0uLTDww7v2K15c5TIWbWSdahVHwR9gNRN8HNPbAbqaNeI/m0Ce/UsCmJ61Gcx4kkw4GuWpz3opcLmIY9WtP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746584513; c=relaxed/simple;
	bh=nKwqXR44AkWB5I8SCkbN//cSts0ApzmxddlzChynZWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AqqxEuI3AlcfOSRCozA+DK29EnpADlClMKchMFH/uDx+gwY8P5gFBJFn16Df2SGtfmVVo4sRG1yo17Vl3hFaET5Hk6fy2tdqVabHrGRykIeaVUTlbw3ZRpD7PLmLnu4vHXbpAb511sT0Bv0kTNAcLwV3dGk1xb0BzJGn1bpeoug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EL3IxcEC; arc=fail smtp.client-ip=40.107.223.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EL3IxcEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpcOc3xrI1ttYz5v9rhBicn/2fznqPkfrXB5btSxxp1FsjEUiQBlkyJ7OfFBVlTAqt7KeCapVsyznJ4MFkL8Rj02yq0VaB6qcwH89TiCeLmIVOPKwUBAa1NrGmYLOJ840WBAkYXU34yptLPnh4i+JHcLWrH3Fe8p8luP/IxtJ2L/G2bUzEHSUrCAJ+rbd7nZEfpkceCfoH+1Zo3pYvc6UUxekfoiN3zQNTrnB14MYuWB93ncZQE44ZSfoEiRGSar7O7XzRJxcnCzqV3drp/T6QFXdgR/S2kQR/tscC4hEvnqBqpxh2ZjisSLWiSQkm5CzLuU9QO1QjcBsn3bE/860w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puglnfK3EzxzciveoCflqpbx5G+0Y5YUTRe3bVvYd1o=;
 b=C/bfntnaDiSz7Td8uVdjsGU2kAAGR+DzB0lqp06F/cwp8CdN32L19wWP+l7e9CH0WDCeQAzk6Ov6UK6HmOlR94cu5BDiVDBrXOiwpPipMhIVYS+hekpLqBebHiXs+gdey+52RJr3VZNEtyJxUFC0c1Qq7nPnwHTOBJ67StVHy2b5RFcdpuNSOuXnHPOR1isTd9NZumWNZ7g4G/O+y31/bjG1pYQ7yTwmj6XLGZVueGmJ1DcLGHUdKzKJneRM3pyj8WNEobo74IXRcj10JizyBXoE3s+ABNZTjFQmqrMOlzIk64uh8HxiRjzAob6G6+J4iM6ztDsgsyktLtNGe6OYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puglnfK3EzxzciveoCflqpbx5G+0Y5YUTRe3bVvYd1o=;
 b=EL3IxcECwKFrZ9sp/12CRKT1h1coC4jllAAMUxPQ/HX/gW8bzMDWoPALCVwxUKlA6thE6+MheGZXx5PPgDXD854Str4GxtpV5zmNqIY/4Aq9vXiwq/1qkf5XY+p1zOgDhNOsS3kxS0hDILn0+4pl632xBFu6ZaxpxTW9tQqsMcE=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.21; Wed, 7 May 2025 02:21:48 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::db2e:f082:bb80:d1a4]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::db2e:f082:bb80:d1a4%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 02:21:48 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: questions about smu_mode2_reset_is_support and
 smu_v13_0_init_display_count
Thread-Topic: questions about smu_mode2_reset_is_support and
 smu_v13_0_init_display_count
Thread-Index: AQHbvueAQgs2772SpE+4XnQKOCu2hLPGbI1Q
Date: Wed, 7 May 2025 02:21:48 +0000
Message-ID:
 <DM4PR12MB5165D85BD85BC8FC8BF7A3B48E88A@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <aBqqCmYICO_C0nLT@gallifrey>
In-Reply-To: <aBqqCmYICO_C0nLT@gallifrey>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=6a1a3607-07b3-489f-90f3-d7ab5ffa8ea5;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-07T02:10:19Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5165:EE_|CY8PR12MB8315:EE_
x-ms-office365-filtering-correlation-id: c6e39bc1-fed5-44fc-545c-08dd8d0deb76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AuAxBXQleWXq6wXrHjRwjPxQH3ptLtr7pkZEoPmfbfszTqJ66IPcU7ZTc0nM?=
 =?us-ascii?Q?dZiNKehcNVS9Sob/ODLOzf9+REnHSniiTVbkUEUY7LWjNsgwAsNMZJKqRDjA?=
 =?us-ascii?Q?Q1sfm2WYN1FhvJj42zEy4p8/NJp99QrstRsBT9+1GD7wY452+ozj7uMDaWjx?=
 =?us-ascii?Q?/weOIVJOa56RnEI++nU1M7VZJ4o3Pnz3yOjZuA54zX2R+gTnicPfb/ZhNCFt?=
 =?us-ascii?Q?Otb7HvI90KH2cgSjPKehjsF3iPXSJbbV08N8Nke4kggaJK6kzYcVLKnRoTHu?=
 =?us-ascii?Q?AZ1eaOlis0lu3kQMx3nwZnLx6++ECHD8LsJ6wBpmywLHrHDP/hLMnG4j6+2H?=
 =?us-ascii?Q?TLD4WCwsVEnr4D3EMzkgOl99JpUv5nSM4dt/XbzynUj2mAIOMlo5O2VVnWGF?=
 =?us-ascii?Q?ajcwZKjSZFkqllCqHji1ctb11SEOXQVHi8ioePVtfnQCxp5rLQJXZ5rit+sS?=
 =?us-ascii?Q?++nWkK099gesNLNLJScapZSnyHpd0xXFE4cwwVpvkLWXtuA+NCnZK6+d4mIR?=
 =?us-ascii?Q?jEsXgngGJFPOuL8IhGEqR2rahHs9QIjLzlIq2VsubtXX0jV1y3AF0IRtUjxU?=
 =?us-ascii?Q?6d0XkpdLzX8SyfWQjlp7UmgDLy7oKe6hYeUpWlA1eopUoaAAtnv9ooNCC2SW?=
 =?us-ascii?Q?OX8THlU7d5QMdm2OzDid0UcCPvE/mWKTMlQN91ZrCS8bjUN7i7qLtyWShOks?=
 =?us-ascii?Q?RpDePqpkj8av1fXShEQ0W6NOTchvpC8E0BO/4N8FJ4p0Csif1ayK5cWgRIYa?=
 =?us-ascii?Q?O/32a87n/ajRJt0CnGCeJL2JZwWcRu4ELHBI0YFjwwM8j2Jb7laavCp7ClCf?=
 =?us-ascii?Q?30NWKMDQOZqw0riM8xSGx4uljANxVSyavWzC1x/aaH2sGG/rSI4snyPDodhO?=
 =?us-ascii?Q?+ihTi+2Jau5RYqdYX+BTDjB4OB/0TrSVBkzT4gngc2Zre2nUenUkSnLY81CL?=
 =?us-ascii?Q?iaKA7nfyKiHI5Troh4OosAlEtXh32oGwGGdkujC54mDmXBlDAiYz9lJFlLBw?=
 =?us-ascii?Q?Yi1wARpbD4zRgo3jxDFBEPGZTzVfpC8Qvisz+AA257bKd8JClE039tEZEsom?=
 =?us-ascii?Q?zpgr2tyyMMP0FJLaXD67bz8aH6mKU/my3NnVjrrjjQJnlNKjMhhhpARkzHbZ?=
 =?us-ascii?Q?qQoPQaY8Zm3WVhSzvvUQKVt8jSTBC8aWSdLNzm9DXZJFYEoiGOZdPasaUhCW?=
 =?us-ascii?Q?DKINqBbgbAFneIh7IVo7+UnEL/1hQOt/4SNu3mNGtS99YmIcHtLf9fX+W7U5?=
 =?us-ascii?Q?lhSC/GsXTGYcdhuM2Gwkl6l4wzpQKDZIX2U9l5ABIfyQtYnalFhBNBVIWoGp?=
 =?us-ascii?Q?gmasvrBeSwygwgEG4//qbyqiw+i0xbIp8NecdtxLaYuqNvZcOR5zDGBsMSts?=
 =?us-ascii?Q?SkAmiHWdY5XG411XOR3oGGIE6MRSgdwVWOiX3fKQNICM353rZSkKP2MoYzFh?=
 =?us-ascii?Q?BF791MCth+I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5165.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vYfmFZs/rD0c4Lp/OXiAm5b4Q/kkA9QX5pCEf2zglEP9gf6f6XlfP0ZUEIfN?=
 =?us-ascii?Q?+Vzgi7ReNOH4l1UYReVUdiRAwIM1ZIbMfcJGjlX0jc7kjvzAzoj23Gqag/Xv?=
 =?us-ascii?Q?EgnUZa6zw/4vgsRAd97AJRtQ1l8df3NphVamhPOFJdf6e8uMgrE8UTyCabrs?=
 =?us-ascii?Q?NPz7U5eoisVgbeKVMYDJpiUOodEF9rV+06xR1M4bbDDf5S+Bqb1wBJPOOgW8?=
 =?us-ascii?Q?GdJbfUknq5WDgLUsLjj96X4ovG427BB0HR4SQn4W22iZg5wgIwm8Mj3GjWcM?=
 =?us-ascii?Q?QeyMbLmJTAPcRqoBJkXcoFsJ2aTC08LcJ/FlBFBrKq+1zPCJpn1EWgKnG7rj?=
 =?us-ascii?Q?WllxEFn7O0zlhzGs7CmGwbH4OmZWsLml0D5rQB7HDQ12QRTuTatD69fEWYJv?=
 =?us-ascii?Q?+3/n244mhM6H0S/ulXW4E2zW/YXwx1DTGtZp9sIW/bToCkUR2i6NzieX3Yx3?=
 =?us-ascii?Q?cGNh0GeuwGTzAuIz/sR287ECmwtRdpeV9AAVYNiV2rHuyLAVq1NMiykkAzHq?=
 =?us-ascii?Q?7m7cUkMVWa9UurD0FiOOTPpcNOaHPvrKvo2lRb1IKfaIeK+98mMst82kBefE?=
 =?us-ascii?Q?9gsYbIVrVZc1/b6cuLREmzc/ClwLUcazlPK6NX03/aMJ/H8XcqwegX3hiUBl?=
 =?us-ascii?Q?PVahCl5euhA9Hd6fj7Wx6djuJpdFCrKjy1o0bjXC2dVpzGDCqQb/+JhfntZ2?=
 =?us-ascii?Q?QIzB7qmTvhiUi3FBU6auVjhtZs6FfpsrbXezt9dQmJBW0wFzykxGDwTaB9FG?=
 =?us-ascii?Q?fgnslZmiPcjZC/qZvVm2hKK7hd/YUsj12ai6zvFfBHGnUj2zjz3wblLDgX3K?=
 =?us-ascii?Q?UoYDx/C27n2NiyXCLvg4F7Kl2ufC6LcvCPDGx7fzKzB2aexBh6gLDorZd8b/?=
 =?us-ascii?Q?W91e1mtIajd5uy8tqjRBuLBM0cCXJtYhXA9Jjd+G7pgU6DdP8YsvsjHIG091?=
 =?us-ascii?Q?JX7gOfaEL0t8jIttRsMe196Z1z8jpIXGBw2msqAzOqX1hTeX7UipRoNigqX5?=
 =?us-ascii?Q?H9CKqm3fJSwM02hl8CJeqEDIlSwkuzSC34MItxLYywtq4P3HXdZtvJ/mboGf?=
 =?us-ascii?Q?KuBiHJDBYwqyx+vg//frxthjcu39JXtWt6WmgOk9rhJaosxy1brjzUqC3PFx?=
 =?us-ascii?Q?q9yMaTOhn1I8HORli7mpNeYjFsA9rXcClBWm7Xsa4RxdfGgxKveoe194J7K9?=
 =?us-ascii?Q?yAYqR2yfw5Plcio1rosSy36Mh6rl0irhSBRC9BeBSJMkiY6vFNYqKeAhE2BC?=
 =?us-ascii?Q?q1B9PfR/jbvfaA8SypESEu6f1DHrVWqGk2Q0tpxcaosMfAfu89MH6KQhI3dX?=
 =?us-ascii?Q?8XOn8GjbQ9eBNTtQ7ThFn8v+3X1EZFhX2R0y0nbQpKXEbZ7YIL45BipPymJB?=
 =?us-ascii?Q?8m+wKXabo7rkuLcjvPIUGxb/rXhIAEfqB5wQctGY2Pdre/AL5KzP1S/+OSgv?=
 =?us-ascii?Q?G9vlkuWru8RlBhqMmWMswTvEXV9rmGxFfoQnZgWi9WOesCiPyG7c89eL6uLd?=
 =?us-ascii?Q?Z+fg3a7vCJY0FoRU/ueUoH0iNSlbzwB+J74jCe1cqzru12f19qAunLzAg0Jc?=
 =?us-ascii?Q?NmaUw8LIUS3PdMTYAg0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e39bc1-fed5-44fc-545c-08dd8d0deb76
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 02:21:48.0843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7OVZmPiV+N9L6Uy1zwx/Mc++LNjEMHBKanj+MHk79A4tO/pwreoEFE0Nb4AsV3sc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Dave,
smu_v13_0_init_display_count() is obsolete on smu13 series. It will be remo=
ved.
Secondly, with cod evolving, all of below can be removed as well.
  sienna_cichlid_is_mode2_reset_supported,
  aldebaran_is_mode2_reset_supported,
  smu_v13_0_6_is_mode2_reset_supported
Thanks.



-----Original Message-----
From: Dr. David Alan Gilbert <linux@treblig.org>
Sent: Wednesday, May 7, 2025 8:32 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Feng, Kenneth <Kenneth.=
Feng@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
Subject: questions about smu_mode2_reset_is_support and smu_v13_0_init_disp=
lay_count

Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.


Hi,
  I noticed two functions that are unused but I wasn't sure what to do with=
 them:

smu_v13_0_init_display_count() isn't called/wired up, where as the
v11 version is wired up:

 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
     3574:      .init_display_count =3D smu_v11_0_init_display_count,

so is v13 really unused or should it be wired up in a similar way?

secondly, smu_mode2_reset_is_support() is uncalled, but it's the only calle=
r through the mode2_reset_is_support() function pointer; so if smu_mode2_re=
set_is_support() was deleted, does it then make sense to clean up all of
  sienna_cichlid_is_mode2_reset_supported,
  aldebaran_is_mode2_reset_supported,
  smu_v13_0_6_is_mode2_reset_supported

which that function pointer is sett to.

Thanks in advance,

Dave

--
 -----Open up your eyes, open up your mind, open up your code -------
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
