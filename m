Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7896C38FB0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745947112; cv=fail; b=V8vHt6k7/mHS/y/rnPs0oT9CzMM8bn56A7Tjb+DN08MJp5KLO2yoHo3k7bKb44vPzWYpUrnQtUOTcJnc3QXg+NzfiECnbW51n9epLOOHfSKsfa5JvjOwapUC6wbUwTErNbM1ZLLTp51eQpm5RZap4HDNTjq70Vb5aCZ1sw9UUFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745947112; c=relaxed/simple;
	bh=G7kIKg0YZnKFdR7GmOmvc3WfPAKHcHGeh9UTOiYOv8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sVReiGsaY3/2kxQpZsTyuSH98SO8gpXhEUwielHF9DLvUJJE8yIXOCR9EXPWMDFFypzr1q/YmvJ97lWzhSGcf/qd/EpvwgBKbx5aQGJ7mAaolWdwr9Y5CunwaAsx3TArgFo6P2OOIE1nfUapVR9sbOuA9ZAqPRRhJnEPoG40oD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j/dDy/O/; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j/dDy/O/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOs3OQrW4Njea3rNPClJaviXzhxkbrL5C2jb9FszmRQmlfxpAyS0Fm6WofykvWNhYkmKVbf6zmuBHkMfBPCmh/NLz1EiSWjvo8Gb4O9Ou075GE9fq1VJQYQ1nlvqQpMe5XsYAe9ZWEO+i9YgzobUqH2vRebt5nkzt4iNrZqowu0MUWow6Mn9FvzkiJcG4sHTdxMuSvp1GDMSIpSZJzL7LsFkNM1QpeYXTgIQ9jr4bU+NwWaXY8BLF9EqmXKYfz6k80VYeaTmjAP0q4ifwxHk0MIbrNSWTVL9Z181CMZApPI1MFKk1SMIvl5QSU+ML2ZBW//p2/PLhOLzFjaMq6+sAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7kIKg0YZnKFdR7GmOmvc3WfPAKHcHGeh9UTOiYOv8g=;
 b=kZJUirsGdkdVND1PSP8K/GdcfcEL9quwgQ9TrGGzrz1jBRH/d0dftnjOFhpRtq3lPwNwk5E2KuCGJJ3wawUwlPyL+ilC2WROwAX96Mv8201QaIrZghU8Te5qnYimIj2aqqsAxHXc0pU0CCTFGas6Ni+gRue9aXKW3Wy5PD9GTsps2MLoT3d0y+AnUdq/UlXGm67sIt3gzRxd3pQpHIkutghop8RJPx4/2qlscrI0mI+i0fdGXFs6IineLHfvZV+L0gz6tWbRaISIAlcqbDMWEepyN0UjFanLJcifzOG1lezChcgr4euaOpqWzz1aR2/MeYYGM5kuFnzK1qkE8gDC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7kIKg0YZnKFdR7GmOmvc3WfPAKHcHGeh9UTOiYOv8g=;
 b=j/dDy/O/hv1afvaBNX9XhvFsnEhCcW0vllsU1pjB28jGXzkLwgTF//1hkpqyLCNi9WEvArlSibG8L3CDljZe1o6H0nn6vCaaiTDXe1lvZllenXrAo2pN8AV+7YxyX9DROgbwc6Lam1CLc5Ym02OD1Qm6ntxiu6ZNLuG71uuT0Y0=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 17:18:28 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%3]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 17:18:28 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 16/16] x86/bugs: Restructure SRSO mitigation
Thread-Topic: [PATCH v5 16/16] x86/bugs: Restructure SRSO mitigation
Thread-Index: AQHbuSbjAf6z9ni4G0C/j/xcfrwPWbO64djw
Date: Tue, 29 Apr 2025 17:18:27 +0000
Message-ID:
 <LV3PR12MB926560C299979A7606A7417494802@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-17-david.kaplan@amd.com>
 <20250429165032.GHaBEDWM8qeeE6nfxI@fat_crate.local>
In-Reply-To: <20250429165032.GHaBEDWM8qeeE6nfxI@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=00502e36-6cb4-46f3-b6b2-5bfd10d16ab9;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-29T17:13:50Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|DM6PR12MB4388:EE_
x-ms-office365-filtering-correlation-id: c7ade5e6-cf63-47e6-379a-08dd8741db68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VzczU3BzdmR3dWd1R1dZM3NxTnNEaWpRVjhOWGR0ZytyczJsWllBZ21UdXQ2?=
 =?utf-8?B?K3lkM1NINGVHbXZDSGpQajJObjZSeWR2aGQ3d1RBdGVWTUVtL0svMzRmZWND?=
 =?utf-8?B?Y00zZkg4YzN1YkZndWxGSzI2Mm1MSTg1Nlh0c3M4MWFsSkhRZU5WcEhmcGRv?=
 =?utf-8?B?MHdXMThDajNqTnhORVE4TEtXYWg4Z1RDbGRHMFVRYk9Ra3J0Z0JtUkRtejR4?=
 =?utf-8?B?aWhCWVhRYldMS3NlVHc3anpqM2tGTGNUMkFsaVpoV0dINFdLWkxMa2NOQjZY?=
 =?utf-8?B?aDhZS3NlYTdmeVJxMzZoYmIwSjdmVUlDbElCazM4L3Y3WkVPRkYyWFoyd2pB?=
 =?utf-8?B?R1Q0Yy9nMEZBdEJnREtnazlZMHNlQWZ5NVFWcTlJSE9aWUtOc0lBdkZPWWFj?=
 =?utf-8?B?cUZzVkV2YUszMXRZSTY5WE5uUkFKMEU1eFJNWXlQNDVTeEplWFlmRVdyTU5T?=
 =?utf-8?B?VXM4cDh1T2hKVTAxMk9GWjlGSThaUmdsSnEzUUY4MkdNSkhMeTNiTmJDVDlx?=
 =?utf-8?B?dnNGMFZxdGh3eEVwdm5FbEpyQjJrYzh1WUZxc21pQ21lVXBydzBCd0U5YTdi?=
 =?utf-8?B?UklRZUpyeHNuaDdDODMxUGlaVi9GeEtpZVBSb3NLOTQxQVFqUlhMcFpCUHk5?=
 =?utf-8?B?NWl1cGlMK1gxaDZqU3NHTDROTGgwQVRmY1ZkdkVkanFiMFR1Vjc5L3JhSUpX?=
 =?utf-8?B?TFJYeWhVYk40LzVPWFVHY2FRVkJYRnRJaFU3Vm9XSWczMmlhczhQT2ZUc25C?=
 =?utf-8?B?aGdCQ09iVTEvNjk2dUpVODRCcWQ1OWNGenhTMTV2S2E3NG93SXpRT04vYm1I?=
 =?utf-8?B?WDBIVjg2czE0b2kxa1NSRTdkYmkxSmVlV1o5cUlSc3FVMEZYbmExSXJ0aUR3?=
 =?utf-8?B?ODhWc0kwa3AwS01DRFpTYXJxVnBreUxNMDdZRkJvR2RzYmZ6S1hQVkRXa09l?=
 =?utf-8?B?ZE5ia3RFTVczc3FvWFlQQTBYeVJ1anlDditVWTU3MitiV0hUSGN3SUtmOUFr?=
 =?utf-8?B?MXEva0owenBVQjkxMDJpUW1Kc1FFOStsdjI2blJreGNGcFBLTWtvbHNQRWg1?=
 =?utf-8?B?WitrWFJaZlpYSEt5N1JGbVNnRmZ6NndBa3JUYXNKaG93Z2FCeUdOV3B3MFJn?=
 =?utf-8?B?czQ2Zk5XUytMZDBnNXJQcUgzR0xpTHBsZUUrTXFPbDNqMmpPYUdrbTFFRHND?=
 =?utf-8?B?Q3djdStlLzNYdCtWeXhjcFpVSFhRT2tWSFJCbEU4ckxZUkh4UFNRQU8vRWNs?=
 =?utf-8?B?K1VpeHhaU2tCQnVpa1dlVEp0UFVmR2xGZzlsMzZ0eDVVSVhiTDRxWXkwdXAw?=
 =?utf-8?B?QUtlK0RsUDdhbnp3NDA1NFppaWUrNWcwSWp6V1ZvUFJXMGNwR1R1NjRMNlIy?=
 =?utf-8?B?OURxSjAwemFhZEI2RXhTVk15R2xjdjE1Ym5nRDVTNkxZNkdseHNCYlB0TG1q?=
 =?utf-8?B?aXA5RkpsdklleXhIYUNiQWh5ZnBXM2FuZGxZWGpxbFZGeVBIUTJZajRSeVl4?=
 =?utf-8?B?eGtlbnJldW5kUGRFblY4ZEpNWWdNRk1DYlN1NXJNYjVzQkFTU0hFZ3Vkdzl2?=
 =?utf-8?B?c1UvcWxZNzRTWUh5WG8zbll1Y1Nab1U1MmJMOEVYelAyK0tHTkc4NU5RZmty?=
 =?utf-8?B?Q3Z1djhFV0VVK0tGOFdack1XMGx5SE5FazFZc1A0VVhEQUlUY1A1TzQ4eFBL?=
 =?utf-8?B?N3BXeHZYKzRxUU5sQ1I4V0drdHk3dktzZnRGTWpXbEhRTW1WVUtLWGZBT01q?=
 =?utf-8?B?Q2VYQmx5RVFxN3lFTlRVNkhnN0x4MkdwRGl1eXhIK1JrMlJ4d1QzSk1rRXlH?=
 =?utf-8?B?eUhpbllNcEhKeHlYZmlLcmxlOVBKZlNZY3R4ODhPelJ6TWVxZGEzd2VmdUR4?=
 =?utf-8?B?d21nTUNWNXNPQkJra2RCemRmTEdIZ3ppOTdpZlZvNTVocGRacFRxRjBDTXc4?=
 =?utf-8?B?RTFKUXoyR0pnWXI1QWhJdWJlTmFPWEd2VDQvRE8wNGp4dTNqcVpGakl1OTVW?=
 =?utf-8?Q?nC+aQzozCIDT0LgQ0ZuXIOTwX1+sXQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEIzMlV3WmxPcmFsd2lFSTdqc1VCYmUwdDJjUEdQZjBMYUdUSnNyenJ6bElX?=
 =?utf-8?B?Z1BiT2NodHZCaUNySVJReWhzOExBcS9ac01yZkZ4anhzVUpGVmRHcXFDT2xi?=
 =?utf-8?B?Q0M3N2Y5QUo2Q0RhQ09TZFZlRzArMGQwUnVhVWlmMllMNkEwdUpqQ01zOWlR?=
 =?utf-8?B?QjZyNm5nOXRoUTJmNGpkYkJwZ1VXMk81UWovN3MwRTVlaWhYdnJFNTBNYzJN?=
 =?utf-8?B?ZHMxaDVDWVF6aWV5WE50QUx6TlVRbU5FUjJkSmYxV3JxSkxRcHBRdFh5Z01V?=
 =?utf-8?B?ZkV4ZG1rd0hYOWtVaUs1bVRBY3ZQTjAxbEJxTlBYOXozcGlGVTZqMHhHdDdV?=
 =?utf-8?B?Y2FxQ1RJOGt3bWtwTXMxaExRdmoxU3hzS0FSK3NmRVhrVTl3d25vL2cxQ09H?=
 =?utf-8?B?b01wVXd0U1BMbUNmbTBTYVFnbEVDNDROOEFUZXNxMFJvSGdSTWI1RWxDdFJl?=
 =?utf-8?B?ZkcyZGNDd2NOWmVVYVYrUWlmbUdDVUxWT281R1M1NGtsRjdoQmFoU3Q3WkZG?=
 =?utf-8?B?N3dSR0FNTWxaSUJ3eFM5R0RncTBtRUZ3VUNpVWlFZEFmQlQxWnVhN0pBSG5i?=
 =?utf-8?B?NHFibzZzUTArcWR3ZklydlNWTG9pME1KbnY1a3NXVjlUTGJwSW45RWVxendm?=
 =?utf-8?B?blg5SnVrTWtSamErN1hLcXhMclhtRjUzcndpYWZLQTlVV2dndFpCdmJzSmdG?=
 =?utf-8?B?azhvUWR3V0R6N0xzNlkwekk1RUpJaXFuaE1OM2lHN1RERXY0NEJiVVpiY01w?=
 =?utf-8?B?VlZmWUxocGhWc0hsYXVkRVZKdTY1RGhXM2loeCtMSE9lOUowcHdGdDM3V0J5?=
 =?utf-8?B?WDBKRVlLQkdKeG5nNjBEUXhoVEg0Um9HTWNRNkZNaXRMN2ZhVXFtNEpMMjlw?=
 =?utf-8?B?cWtSeFFJeGZySG15TWp6NlVySnhYTHd3cmduZnA2WWRCVEZkLzU5VzM2c0xW?=
 =?utf-8?B?ZkxGMStWR0xkVmFGcDM4Zy9qK0NLYkxFNDliVis1STBtNDk0bWZDeHBzQ2tx?=
 =?utf-8?B?VEFrekNNUWFINmdjc1JKbDNsY0ZIQ1N6eHdlOWdmWXFSM3VwL041Uy8vN1kx?=
 =?utf-8?B?NWN1alU2ckFzN29Vby9Ic0ZTMkJzYkRuejVHZFlzTmJXM1FuVmJyZWg2MXNo?=
 =?utf-8?B?bThMLzlBSWVTMVYrZXE4dytJQlpNdFBXNzRmbkhSUGYrcC80R0pZeUJWTFlx?=
 =?utf-8?B?U01VbTFrN0R2Mjg3Zm41d1p5WW91ZEhXWU9LWjRWbStpdCtPcFg1SUdvODR1?=
 =?utf-8?B?QzNFbTk1aXdVcFlyR0NXdkFrQnhhZ0dzSDJwUW1MVWEvNEx5WUx0Y05UZzU3?=
 =?utf-8?B?ZXBlZUlTZ1hDWFdxWWFGU2VWaS9XdnhoSGVjSWhldzF5dEN0QlAxZ2hJcHI5?=
 =?utf-8?B?MitFa3NIMlhSMk9GVWxXVGZrN1lrUkgwYU4veHRiVXE3anJnTCt1M2NsZlRx?=
 =?utf-8?B?SlZzaFJxQ2N0QnU1Y21PaGVobzF6aml5c1FRRWlkalhkUkJXeXZORno3RXhH?=
 =?utf-8?B?ZzJZYUJmNXdOVEZmNFlUbjRUcWF2NUU3VHdhK1REWVozZm4rMkZMeUYraFlP?=
 =?utf-8?B?WnR2SlBBQW5iNlIvdk1KQlg4UTlsdlB3bEtuY0xOSkFQZk0rWThmaFJraUFS?=
 =?utf-8?B?VENCTWZFRDhvSHhQdGZMK2xLNUtITk9Za1BKbWJCb1Fnc2R5b0JyVHNXNm9Q?=
 =?utf-8?B?UXFRWjlPemVwYmY2b2szcXlaSnZ3Q05Uc1lPbG9xZGd3Rkg1OWVQWkR4Yy9H?=
 =?utf-8?B?dWR4YXVtbXlKKzhibnc0TFBCQmxKSGRPM3lNdlNraWR0OGQrVzI2YmJ3RDBG?=
 =?utf-8?B?amNleXUzNHY0d2J2L0V2Vmh4K3VpeUNiL0VyWUx1Y1lQalg0ckRBRzRrMlp1?=
 =?utf-8?B?ZzNHb0kyemUyS2QveUdYM0hoRURwVGRldit1Wi9JNy81eXR4ajZmZ0V2SFlQ?=
 =?utf-8?B?a1VxOGtqcldlZm9GOGJ0QkgwWm01bTNPNGkxWDVORTNTQU9EeFBkVlN1VDVU?=
 =?utf-8?B?Y1dHaUcrVUFyZ1IzOTY3VWpCcHVjLzhlZXNiUVY2SmdDMFdnTXNIcHRiRk45?=
 =?utf-8?B?SGhTank0bzdIZTNzcmVIRVgxdEd6ZXZwZjhZRWF4ZHZjaVdLUE9mWXNaRmRy?=
 =?utf-8?Q?85HU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ade5e6-cf63-47e6-379a-08dd8741db68
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 17:18:27.9608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lUO21G9EM++bVYlgiy1W3pIUt1dnrSdCD1e4XnI+8kNQnjDw4HafOL4dz5p7lbC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMjksIDIwMjUgMTE6NTEgQU0N
Cj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+Ow0KPiBKb3NoIFBvaW1ib2V1ZiA8anBvaW1ib2VAa2VybmVsLm9yZz47IFBh
d2FuIEd1cHRhDQo+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdvIE1v
bG5hciA8bWluZ29AcmVkaGF0LmNvbT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51
eC5pbnRlbC5jb20+OyB4ODZAa2VybmVsLm9yZzsgSCAuIFBldGVyIEFudmluDQo+IDxocGFAenl0
b3IuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY1IDE2LzE2XSB4ODYvYnVnczogUmVzdHJ1Y3R1cmUgU1JTTyBtaXRpZ2F0aW9uDQo+DQo+
IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNl
LiBVc2UgcHJvcGVyIGNhdXRpb24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2lu
ZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj4gT24gRnJpLCBBcHIgMTgsIDIwMjUgYXQg
MTE6MTc6MjFBTSAtMDUwMCwgRGF2aWQgS2FwbGFuIHdyb3RlOg0KPiA+IEBAIC0yNzM4LDEzMCAr
MjczMCw4MCBAQCBzdGF0aWMgdm9pZCBfX2luaXQNCj4gPiBzcnNvX3NlbGVjdF9taXRpZ2F0aW9u
KHZvaWQpICB7DQo+ID4gICAgICAgYm9vbCBoYXNfbWljcm9jb2RlID0gYm9vdF9jcHVfaGFzKFg4
Nl9GRUFUVVJFX0lCUEJfQlJUWVBFKTsNCj4NCj4gSSdsbCBwdXNoIHRoYXQgaW5pdCBhZnRlciB0
aGUgcmV0dXJuIHNvIHRoYXQgaXQgZG9lc24ndCBoYXBwZW4gdW5uZWNlc3NhcmlseS4NCj4NCj4g
PiAtICAgICBpZiAoIWJvb3RfY3B1X2hhc19idWcoWDg2X0JVR19TUlNPKSB8fA0KPiA+IC0gICAg
ICAgICBjcHVfbWl0aWdhdGlvbnNfb2ZmKCkgfHwNCj4gPiAtICAgICAgICAgc3Jzb19jbWQgPT0g
U1JTT19DTURfT0ZGKSB7DQo+ID4gLSAgICAgICAgICAgICBpZiAoYm9vdF9jcHVfaGFzKFg4Nl9G
RUFUVVJFX1NCUEIpKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICB4ODZfcHJlZF9jbWQgPSBQ
UkVEX0NNRF9TQlBCOw0KPiA+IC0gICAgICAgICAgICAgZ290byBvdXQ7DQo+ID4gLSAgICAgfQ0K
PiA+ICsgICAgIGlmICghYm9vdF9jcHVfaGFzX2J1ZyhYODZfQlVHX1NSU08pIHx8IGNwdV9taXRp
Z2F0aW9uc19vZmYoKSkNCj4gPiArICAgICAgICAgICAgIHNyc29fbWl0aWdhdGlvbiA9IFNSU09f
TUlUSUdBVElPTl9OT05FOw0KPiA+ICsNCj4gPiArICAgICBpZiAoc3Jzb19taXRpZ2F0aW9uID09
IFNSU09fTUlUSUdBVElPTl9OT05FKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICsN
Cj4gPiArICAgICBpZiAoc3Jzb19taXRpZ2F0aW9uID09IFNSU09fTUlUSUdBVElPTl9BVVRPKQ0K
PiA+ICsgICAgICAgICAgICAgc3Jzb19taXRpZ2F0aW9uID0gU1JTT19NSVRJR0FUSU9OX1NBRkVf
UkVUOw0KPiA+DQo+ID4gICAgICAgaWYgKGhhc19taWNyb2NvZGUpIHsNCj4gPiAgICAgICAgICAg
ICAgIC8qDQo+ID4gICAgICAgICAgICAgICAgKiBaZW4xLzIgd2l0aCBTTVQgb2ZmIGFyZW4ndCB2
dWxuZXJhYmxlIGFmdGVyIHRoZSByaWdodA0KPiA+ICAgICAgICAgICAgICAgICogSUJQQiBtaWNy
b2NvZGUgaGFzIGJlZW4gYXBwbGllZC4NCj4gPiAtICAgICAgICAgICAgICAqDQo+ID4gLSAgICAg
ICAgICAgICAgKiBaZW4xLzIgZG9uJ3QgaGF2ZSBTQlBCLCBubyBuZWVkIHRvIHRyeSB0byBlbmFi
bGUgaXQgaGVyZS4NCj4NCj4gV2h5Pw0KPg0KDQpUaGUgY29tbWVudCBkb2Vzbid0IG1ha2UgYW55
IHNlbnNlIGluIHRoZSBuZXcgc3RydWN0dXJlLiAgSW4gdGhlIG9sZCBjb2RlLCBTQlBCIGdldHMg
ZW5hYmxlZCBhdCB0aGUgc3RhcnQgb2YgdGhlIGZ1bmN0aW9uLCBiZWZvcmUgd2UgY2hlY2sgaWYg
eW91J3JlIG9uIGEgWmVuMS8yIHdpdGggU01UIG9mZi4gIFRoZSBjb21tZW50IGFyZ3VhYmx5IG1h
ZGUgc29tZSBzZW5zZSBpbiB0aGUgb2xkIGNvZGUgYmVjYXVzZSB5b3UncmUgZGlzYWJsaW5nIFNS
U08gbWl0aWdhdGlvbnMgYnV0IGFmdGVyIHlvdSBoYWQgZG9uZSB0aGUgU0JQQiBjaGVjay4uLmJ1
dCB0aGUgY29tbWVudCBpcyBwb2ludGluZyBvdXQgdGhpcyBpcyBvayBiZWNhdXNlIHRoZXNlIENQ
VXMgbmV2ZXIgc3VwcG9ydCBTQlBCIGFueXdheS4gIE5vcm1hbGx5LCBpZiBTUlNPIGlzIG9mZiwg
eW91IHRyeSB0byB1c2UgU0JQQi4NCg0KSW4gdGhlIG5ldyBmbG93LCB0aGUgU0JQQiB3b3JrIGlz
IGRvbmUgaW4gc3Jzb19hcHBseV9taXRpZ2F0aW9uKCksIGFuZCBmb3IgYWxsIHBhcnRzLiAgU28g
dGhlIHdob2xlIGNvbmNlcm4gYWJvdXQgaG93IHRoZSBjb2RlIGRldGVybWluZXMgU1JTTyBtaXRp
Z2F0aW9uIGlzbid0IG5lZWRlZCBhZnRlciBhbHJlYWR5IGhhbmRsaW5nIFNCUEIgZG9lc24ndCBl
eGlzdCBhbnltb3JlLg0KDQpJJ2Qgc2F5IHRoaXMgaXMgYW5vdGhlciByZWFzb24gd2h5IHRoZSBu
ZXcgc3RydWN0dXJlIGlzIGVhc2llciB0byB1bmRlcnN0YW5kLCBpdCBoYXMgZmV3ZXIgc3VidGxl
dGllcyBsaWtlIHRoaXMuDQoNCi0tRGF2aWQgS2FwbGFuDQo=
