Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE4415F306
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744736782; cv=fail; b=sx+1xPoQEhDW+aBTmo8y07isDdDEmc9Wy7YjjqG11r6HFGl2ju2k/CAEYi9UTOhKZ7FrFH7Pktm+FSPGoYfroXCruScWJ5PDgxX6xvclXSNGDD+m7Xfwp1d97WZRa8+uiqyDDaWee6jvIb1sW+DaEnLbB1Ucc1oU7CLcTyivJQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744736782; c=relaxed/simple;
	bh=76QuM6RBjtIwfl5VJk9Vy9xFmqKJtf0klYcJOYHWZ0Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dCb/uQZVvD6p1QYiUzTzrH3zg4thQLmYc9xZpleLlifJbD7xguYBEQPNz19TH9chrRbuxBMUMxUSZIratI09uO6JOiYpfmaNvUxGmL1u3ysQyAsiGrV0Q62M3AcJHS4ZxIOZ3n9q6XICgH4uFV92ZYrjwGM1OXUr27xN3nj/GEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h+oPR5tB; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h+oPR5tB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUozYywyQM5A9jF9sqwi7mLdVRZ9fYTGQhqFMpy5jbI35UKwjM3Viuk9sYkxJ3Lw2FTsD0u0JrxjQwZJzkbg+M8b6BrybSAK3yKd3iR6Y8h2Br/bN25Zs34KmBOf87MpptEeglud7p03ZLnDrVyyhjoxoquQod+Jibk5YFcDnk4KDLvMMpPkQh3xJzYIT8qu+faqT6ODob1DcC7qEUn2mUS6uinzf7L6hdsiZZxZbmrs7h8WMyYQWQo0G8W8/JeTlP2Br14WWan98+tNZBIvVQInFgtZLE+BUgYRsVTkxjrfi6bf3Z72yak5ReY0NlZqm87s5YGJveND9FQHutgHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76QuM6RBjtIwfl5VJk9Vy9xFmqKJtf0klYcJOYHWZ0Y=;
 b=m6hDjPYesJzx7Q34Q+9cVHcIbVnPl0zqjeSgaxM5PcJ5CaqpxlIcgy3QoeqqdZfMXrkRd2C/DNJx8klxd6T9MaoiqQQ/UKkxl5XM8U4WS8jd/jgvAJKEXrPgWQL6BSnMxd+yrWcSPgRv0DoY/lU4ApIXSrUI4b4IYflSxdYzt7NZytNt1epiXMA/O9mEadDhlS9izUEKjZck70O9lQy57e1f7OzC9zCxNJSSUB+VUAVEwEoNqi49ZP0KOVRbehRzcrOeYIQP1f3hGkIYjKH4gN//JivyjAE5zUhaAaim1n/6tJy6dJ5u2CwReEjahIFD8YtclKWuAwoZhUevZgyuRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76QuM6RBjtIwfl5VJk9Vy9xFmqKJtf0klYcJOYHWZ0Y=;
 b=h+oPR5tBblwxwxMjTkRRDOO5bmbKkuRlEcfBuKgUCjJ3vT9NJnC4D+zsoG5XioeOqhd5d/PfPwhy39CX3P5NNoiR46mqmArydGWovNsWPbMhu/JrBpzi/fHlBnWW6D2Qdz20eoQqKcHhci9PriVKKzmJDMHkMSeT9ZmMP68S4hI=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by PH7PR12MB5952.namprd12.prod.outlook.com (2603:10b6:510:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 17:06:16 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8655.022; Tue, 15 Apr 2025
 17:06:16 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 17/36] Documentation/x86: Document the new attack
 vector controls
Thread-Topic: [PATCH v4 17/36] Documentation/x86: Document the new attack
 vector controls
Thread-Index:
 AQHbqkRxQb0hpP7F0ESPe2022Gd5BLOjr73ggAAr7ICAAP0KAIAACfWAgAAKIOCAAArvgIAABF+g
Date: Tue, 15 Apr 2025 17:06:16 +0000
Message-ID:
 <LV3PR12MB9265683629F68724B01E89DB94B22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-18-david.kaplan@amd.com>
 <fkl2b3ymatulazt2xjegubqcejx5bgaraktztpkitodrbbsozw@xrskej3fg3jf>
 <LV3PR12MB92654563086027BB944A117594B32@LV3PR12MB9265.namprd12.prod.outlook.com>
 <mybnv24fbz5nsxmz2yihzctnbv7ab7sznyotupp6mbpzfdvy2e@r2oantiw4wmo>
 <LV3PR12MB9265B84234C24D42E7CB42EC94B22@LV3PR12MB9265.namprd12.prod.outlook.com>
 <wuryibff35vau3vvo5gj3d6fzvfedlhcnlyc5zlwlzvfdr2dro@lkwwglmgac7c>
 <LV3PR12MB9265BA06BBDBFCEB868CFF0694B22@LV3PR12MB9265.namprd12.prod.outlook.com>
 <l3b2rwwwwtrxr5fyya3xnxtzlmvkmiwobxy363cvmxgegg56fv@wpxgyc3ymtxe>
In-Reply-To: <l3b2rwwwwtrxr5fyya3xnxtzlmvkmiwobxy363cvmxgegg56fv@wpxgyc3ymtxe>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=2355c7ae-34cc-4ce1-ac0e-fca48e9f74fe;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-15T17:03:29Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|PH7PR12MB5952:EE_
x-ms-office365-filtering-correlation-id: 5c486c39-e57c-415d-8dde-08dd7c3fd5cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1QyakpFOFdFdUhhemtsRlBIc2d1WVltZmhaTXY2d2ZiY3hxamsrbjlnOXpu?=
 =?utf-8?B?czEwT00xVjlrdEJGY01TN1N4VDZaNnd2MkE5YkJDcVM3aEFxcGJDWEEwWXcz?=
 =?utf-8?B?c0ZyN1REd0NZcndwK0FWY0p4VU5PTU8yYzlrUzhmazljbU9PSUdCMEJJN3ln?=
 =?utf-8?B?YlFML3hxSWlkSmZmbkJoL3ord21GR3FHbHA4UnJqN3MzSWJxb044SG9UampI?=
 =?utf-8?B?YUxqakphQzNpSVZrN1h6RlNTQ2JHVG0wY0VIK29nVjFNMExqKzBBckhPcWdG?=
 =?utf-8?B?R2E3R1pHM2ZUQlZlTXhuUmZkSVB6K3NMVjc5N0ZDRDdDQndBa2ovelpPYTRP?=
 =?utf-8?B?bVRvS3ZYNFlTcyt2U3JmeEYwYzZsSWVWOVBVOFQxcVVoUnROTlBkc2lneFdi?=
 =?utf-8?B?ZFhVTUNqR1NuYS9NUEU2SnNsVnZlT1JHNlNuMFc2b1kvNkR5MEJIMDlIZnRu?=
 =?utf-8?B?RCtBdDBTZzEzSTJSS1dlM0xMV1JNMXJYMVJXV1BRZG03dCtEbE93Tlhab1F6?=
 =?utf-8?B?NXlFRmQxcTBFWEppNHgrcWxVZi9idGo3WHczdnppRjZ6bVNjSm1pbEViS0s2?=
 =?utf-8?B?NHp6Z0dDYWZGSkovV0o3dkpocURqZ0wyNkRnMUticWRabWJ2NFJxMjFiYWJY?=
 =?utf-8?B?MTZCY1BVdlRsbTNVMTZRYytybDJNVUJQRFpOOEJNR2lVSzVZVzRCa2dzT09H?=
 =?utf-8?B?VXVCQWxvU3JoQ0gxY1RwTHhBaDBRVGp1a1IvbytUMXNtTng2R21XU1ZLUmtS?=
 =?utf-8?B?NVEzWWJ1U0llZ2M3M1VZQThPKysrWVRxd2dFVUF0SCt4SFhQR1F5L0NsNTNX?=
 =?utf-8?B?Sk5CcmVpL21WZ0h3K1dRWTdENjV2T2R3ZkdYNEJUc3BwVE5ZTnlyNHFUNXhZ?=
 =?utf-8?B?L1J4eXFWb0VEVjhLV3dYMkpPRjFlRnJyY1FIN2g2NlpwQmR5Skl2YlBIUk44?=
 =?utf-8?B?ellBcTAvUjVGVU9nRlcrR1FSN2NCa2drYUZjVFA0cUgweVpxNkVNOG4zTnBU?=
 =?utf-8?B?RFR3Z0lFMjREQlhWS1pKQVpleDNLM2hMN3hCN2pNeU4yM0RKTU5KM2w5Sngz?=
 =?utf-8?B?SVdXL2dERExhRzRxYVhGMHBBR21oYTlFVkEvcnZKL3drSmlSczB5eVZma3Vn?=
 =?utf-8?B?R1RtUzMvdi9WL0RqeVVmTkUyYVNCVm1tZXkwQ01STXRFK0xPUk5EQjRObnBN?=
 =?utf-8?B?cmtYcHZ0RGRHWGFWdXJTa05QcmlrRlY2b0w3b2FMZTVBK3RHVk1nbC83eDJ1?=
 =?utf-8?B?bjYxWjhTalZXL3ErRk5ZOXZyRTlKQlNGTnJ1T2Z3cVJuM3BxVWkvMllTVHJR?=
 =?utf-8?B?SzM2NGhVaVFZMkR6SG9DYnBwUVVwMjZiUllGK3ZScnAxSHByRXBzZEJ4ekFl?=
 =?utf-8?B?Y1h3QzZvOGpFVkM5Si92T0hyeGxJdHZzeWpINjJIdWdsYXZLTTdwODUzZ2o3?=
 =?utf-8?B?bExkYmZsaFZ3OFl0SmhkRWhQeFpaZ0dDKzhUM2pQdVR3WTZYeWVUeEJvdVcz?=
 =?utf-8?B?TlI4NzJJbnErczdheUxjL1BDais0ZUNEdzZYWDJUb0x1U2FENWRQL0tmek1n?=
 =?utf-8?B?cE54czlMNHZOTXdNRy9ZclRuUEthcnh0Z2h0YVEySVZwN1dBbDEzV2FmNmFU?=
 =?utf-8?B?YnFKSEI0Ykl0VkI3c21Kd2wwU1hucGpESkdqZDJzTUFQN2NKN21xLzVWRVBZ?=
 =?utf-8?B?ODBaT3FXWUlVYVpHRHZjeit2OVJVcy9FaWZwWU1yV3RVeVBZU0o3RzREeTEr?=
 =?utf-8?B?VDh0L0ErNEVoeWtrWlNKU25Cazd2QkdIKzBoODZBUmhhNnMzY040bTJrdFBQ?=
 =?utf-8?B?N0orNEMxMlAvd016VXQ2WmRtaWRMOC8rOEhoY0Vnb25ReVZHSDk4cXBBaUtS?=
 =?utf-8?B?QmVXWXorYWY4TzQxbW0rWUZrbFdCdit3aDhMcnFmb3Ezekh0OWsrVEpIbitE?=
 =?utf-8?B?bC9aMjF4U0FVMkV5QVhTaC9BT3NBUjBrUVJwdlhxYXBqRmRGUUo5NHZ3QXBh?=
 =?utf-8?Q?P7c4QsUydzXGX8g9e66trh4dhyXs18=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1lla0twZGo4c3VuMGt2dWx2UmdCcjZobnprUW5jcXVjTVV6UGMvcHUrU0Q5?=
 =?utf-8?B?SXBtdlhjWDY2UEZCczZjTE5lbTdraTJ4bzdKM2FHZkp4UlhlaDJYZTBkamtm?=
 =?utf-8?B?aUxENUFkSUZwSDUrb2JIMUNndmZocENaVGcxaEZ2cjN2RGdQS2pnSitYRlQz?=
 =?utf-8?B?dXpMU0FETy9FNm5ma1RiYzNHdGVKU3kvYmdvS09VUENPeHBSL3NwemUwL3Uw?=
 =?utf-8?B?QWtSaEd3ZXcvNnpyWFJtTTJzK1FYQ1VTNVh6T0EycnVJc2FMVHZ4SDc3NWRP?=
 =?utf-8?B?bEJzemhZaWMvbUcwd1ZhbmdqeDhnVEo2UDhVZ003N2FrcWg3VUNIK1JnSjd2?=
 =?utf-8?B?QUc1bUtzWmI1R25QaGQxK2dSV2tlRlRtRUljcnV1T0MzK3hKNnUvVjBjaDVl?=
 =?utf-8?B?YWF5VXEyUjdXR2hrWWpvUjZXZklBcy81U1Q4S2wxdVpTdkhKWS83NS81UmpR?=
 =?utf-8?B?UjdIbEZ2NVdBMXdiVGozbHRDZnJNOWN3MmQ3L1dIUzdHV2NkQnFmZjhReCtt?=
 =?utf-8?B?eS9mTG1rbUtDaTJETzMra0hoa05oUjRQbmZRbGtrTGdIdnIwc29ESGhMREFK?=
 =?utf-8?B?MlpKQ0xRMVBlL1ZXWHVhclhpODRwTUhWTllYb0c5Rjlnc1V5OFNFTERDVmUw?=
 =?utf-8?B?ditQdDgvekgremxUaSs4RWQrQzR4c3UrUFNHMlBjSHZYYU0yeU11cXduWGc5?=
 =?utf-8?B?UXdrZXhKVTNrSGUxSmJIcm1PV2hYUTBPYWhQY0tZZlBtcG4zNkhXcTYzL3Fu?=
 =?utf-8?B?R1pUWTcxWTFLclZ1TVRxNkVqb05UeVBMbUtMMkVEK054NVlZaU4vcEtkYk9i?=
 =?utf-8?B?UFk0cG5WT25tb1RDcE42b0x2R0JGeWNLbCtIVEZaNEIxK3FiTXQ1NzRuSzk5?=
 =?utf-8?B?S04vYzJJRU5GckQ4MTl0ZWpEZ1hiekh4Vkluazl6d3U3bVFFYnFVY2ZWbEk1?=
 =?utf-8?B?eVh4SHlTOUpRaDRxVlBOcExGdnh2dXVvaDBWNHBDTVZtRFZiSFh6ak94TlFt?=
 =?utf-8?B?Y2xZMDZmNys1K3NYTzN1NGlNcE85NUwwRlV1NytFcEU1Wldya051N2ZkOTND?=
 =?utf-8?B?MXdubjNDU1hjTEJrSUxFK1lOWWNXUk5jV1hFYzZTcXF0N1lTaUFWRnBjZlhT?=
 =?utf-8?B?ZHZUaGpNdXBYWUlvUVIyc0NOUGdHOGxTeGtMWHZNMkVPekxLY1krQnRlQ01x?=
 =?utf-8?B?QU5hcS9QQkcyMlFUaFJIZmViWVZNWDdaY2tvdGRKblRVTUZzQUxSVHJxMWxk?=
 =?utf-8?B?UEp6R3ZVWFlYRVA2ck9iRDZhb3RKcFltdWdrL2ZQbUk0ZDNheUlQdFlTRUdF?=
 =?utf-8?B?Z3N5QTdKYjRQd1dEOUN1UTFlNXludzdFbXNxdGtqNEhoanZBM1lkTnVYdFBy?=
 =?utf-8?B?anBnWEkzM2R3WXFFbUROYWR3enNCQytRcmt5OGk3cjRoMjdNNnQvY0JEZCtj?=
 =?utf-8?B?b1VTRllXVUJXSmYzNTJpSHZRSzVVbFUvbFpQSlNIbEtEdjBVOWRMTmRicndp?=
 =?utf-8?B?S05vWDhkak50S3cxOCtHRldVQUxDa2lKOFhPbU5lQmtxWDVOdzdnWjdxdmo0?=
 =?utf-8?B?UVJJL3JDWTFtUy9NeGg4RFltNlNVU3JXMWdObnRqdC9reUdkUmozemp4bzVw?=
 =?utf-8?B?RmkzS0xBYmMxckNNT0xrSHdvSnI2SDAwM0RkTE5qRW1QdE9KcEliSlZ5bVNW?=
 =?utf-8?B?YW1NWHZDWWdZWTdySGQ4Mk00MThGejN3MFZsb2cwSDZKb2FqQmQ5eENJN1NO?=
 =?utf-8?B?L25sU3FHOUh4V2ZZVVVxeUZpM0JwTUsvZkxZd3puUGxuUDJTRzU4dHVKSHVH?=
 =?utf-8?B?MEFZQ2N2MjNKUXhHMGdnZEQvNW0rbXpDSG9HVlRRWjdzNFROZEg3MDVjeSth?=
 =?utf-8?B?djg5UEZ3ems4Vk5mdTM0OWVaeks0c3VKeXZrbWl5MTJJSjZoRXl1aU9vTEhU?=
 =?utf-8?B?R0N3T3NXT2FLU0hYaVI2SzJ4eXdkSndrRlFVaGw0Y3dwRUZEV1F2cWxMdkZh?=
 =?utf-8?B?TFJGbUxzWGFoRjV6UmJGRGZXRHRnVHM5ZnNLd2ZtSWYvck9uMTJLTUtldGh4?=
 =?utf-8?B?aGFYTHpHZXdKU2JveGRTdzJneDU2YzhzeVVlNm4yZmFaZjZJQlptK05NMGo2?=
 =?utf-8?Q?Mygc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c486c39-e57c-415d-8dde-08dd7c3fd5cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 17:06:16.7817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R0whtL+cHm1iDG24seUyrjx/GOwOemWaYz2hxJ2UIbzgpJsKlDc1Lk8ZSSnZyx7c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5952

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMTUsIDIwMjUgMTE6
NDggQU0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBDYzog
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3YgPGJw
QGFsaWVuOC5kZT47DQo+IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47IFBh
d2FuIEd1cHRhDQo+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdvIE1v
bG5hciA8bWluZ29AcmVkaGF0LmNvbT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51
eC5pbnRlbC5jb20+OyB4ODZAa2VybmVsLm9yZzsgSCAuIFBldGVyIEFudmluDQo+IDxocGFAenl0
b3IuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQnJlbmRhbiBKYWNrbWFuDQo+
IDxqYWNrbWFuYkBnb29nbGUuY29tPjsgRGVyZWsgTWFud2FyaW5nIDxkZXJla21uQGFtYXpvbi5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMTcvMzZdIERvY3VtZW50YXRpb24veDg2OiBE
b2N1bWVudCB0aGUgbmV3IGF0dGFjaw0KPiB2ZWN0b3IgY29udHJvbHMNCj4NCj4gQ2F1dGlvbjog
VGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9w
ZXIgY2F1dGlvbg0KPiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBv
ciByZXNwb25kaW5nLg0KPg0KPg0KPiBPbiBUdWUsIEFwciAxNSwgMjAyNSBhdCAwNDoxMDo0OVBN
ICswMDAwLCBLYXBsYW4sIERhdmlkIHdyb3RlOg0KPiA+ID4gSSB0aGluayB0aGUgbm90ZSBpcyBo
ZWxwZnVsLCBpdCBhdHRlbXB0cyB0byBleHBsYWluIHdoeSB0aGVyZSBhcmUgbm8NCj4gPiA+IFgn
cy4gIEkgd2FzIGp1c3QgdGhpbmtpbmcgdGhhdCBpdCBzZWVtcyBtb3JlIGxvZ2ljYWwgdG8gcHV0
IGl0IGluDQo+ID4gPiB0aGUgc2FtZSBjb2x1bW4gYXMgdGhlIG90aGVycy4gIEFuZCB0aGF0IHdv
dWxkIGFsc28gaGVscCBtYWtlIGl0DQo+ID4gPiBtb3JlIGNsZWFyIHRoYXQgeWVzLCB0aGUgWCdz
IGFyZSBtaXNzaW5nLiAgV2hpY2ggaXMgaW5kZWVkIG9kZCwgYnV0IGl0J3MgYWxzbyB0aGUNCj4g
cmVhbGl0eS4NCj4gPiA+DQo+ID4NCj4gPiBSaWdodCwgZXhjZXB0IHRoYXQgdGhlIGxhc3QgY29s
dW1uIGlzIGFib3V0IHRoZSBjcm9zcy10aHJlYWQgdmVjdG9yLA0KPiA+IHdoaWNoIGlzIGlycmVs
ZXZhbnQgZm9yIFNTQi4gIEFsbCB0aGUgb3RoZXIgbm90ZXMgc3BlY2lmaWNhbGx5IHBlcnRhaW4N
Cj4gPiB0byBTTVQgbGVha2FnZS4NCj4NCj4gQWguICBDYW4gd2UgZ2l2ZSB0aGUgY29sdW1uIGEg
YnJvYWRlciBoZWFkaW5nIGxpa2UgIk5vdGVzIj8NCg0KVGhhdCdzIGEgZGVjZW50IGlkZWEuICBN
YXliZSBhIG5ldyBjb2x1bW4gd291bGQgYmUgY2xlYXJlciwgYW5kIEkgY291bGQganVzdCBwdXQg
YW4gYXN0ZXJpc2sgaW4gdGhlIENyb3NzLXRocmVhZCBjb2x1bW4gZm9yIHRoZSBpc3N1ZXMgdGhh
dCBvdGhlcndpc2UgaGF2ZSBub3RlcyB0aGVyZSAoanVzdCB0byBpbmRpY2F0ZSBpdCdzIG5vdCBh
IHNpbXBsZSB5ZXMvbm8gbGlrZSBpbiB0aGUgb3RoZXJzKS4NCg0KPg0KPiA+IEkgY291bGQgcHV0
IHRoZSAnKE5vdGUgNCknIHRleHQgaW4gZXZlcnkgY29sdW1uLCBidXQgdGhhdCBtaWdodCBiZQ0K
PiA+IGV2ZW4gd2VpcmRlci4gIEkgY291bGQgYWxzbyByZW1vdmUgU1NCIGVudGlyZWx5IGZyb20g
dGhlIHRhYmxlIHNpbmNlDQo+ID4gaXQgaXNuJ3QgdGVjaG5pY2FsbHkgcmVsZXZhbnQgZm9yIGFu
eSBvZiB0aGUgYXR0YWNrIHZlY3RvciBjb250cm9scz8NCj4NCj4gSSdtIHRoaW5raW5nIHRoZSB0
YWJsZSBzaG91bGQgbGlzdCBhbGwgdGhlIG1pdGlnYXRpb25zLCByZWdhcmRsZXNzIG9mIHdoZXRo
ZXIgdGhleSdyZQ0KPiBhZmZlY3RlZCBieSB0aGVzZSBjb250cm9scywgc28gdGhlIGNvbnRyb2xz
IGFyZSB3ZWxsLWRlZmluZWQgd2l0aG91dCBhbnkgYW1iaWd1aXR5Lg0KPg0KDQpPaw0KDQotLURh
dmlkIEthcGxhbg0K
