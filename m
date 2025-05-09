Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDDD28B3E4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.156.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780073; cv=fail; b=gw3ycUzmVWHxqAppNs3VOuWTRu4Pcrwq1ZA7ljEcMu6ARk95sXoitj/RPyllfdOc1qslhAi9WgyaHgxR+jptX9PnO97QIyULedPaEVcx7vvRkFpoLuW01//t/BmJZaqXQ+RkA5RqQCi1g1D+paCIAJjeMEd6W44w/fY7djnLPvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780073; c=relaxed/simple;
	bh=m+jjHWuyVv4oYOgerFhjzP8ajmwsedR+LZnMBb4gA54=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nn6xlu6YlBpfkjYz+NQY0vDTrn5rAxghmTAU4LNaig3QCe8ZbzFm1o5KeK+MzKbxZZBz9qPA/zgKqOVGrkjvIxOElgJuqYjxmf1xsUNWJFSpwiOSY7PRcoYcfOV+23zBCVIulbNuKRqcRsM7u6vhPNbYl/oo+J0Gx7OdepFbyg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=MjBjLTo6; arc=fail smtp.client-ip=216.71.156.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="MjBjLTo6"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1746780071; x=1778316071;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m+jjHWuyVv4oYOgerFhjzP8ajmwsedR+LZnMBb4gA54=;
  b=MjBjLTo6/9UZephPpZMCr3AehuL74p4fFEvwfgsRSSGQ0uuLtRBt91wB
   f+LJna0/NVdPJ69oqGRhWyiTeLHMFOkDGouVqPhhsc+NWFU8PtGWqicAr
   aCn4ERErPtOHoUjirbe4zsdmRn82NZG6721gQCaUAnC0EOWHjpVPj9puW
   ktxGWq6l+YKjECYZjE5RpPz7DUgr1NY219qMfhQ+rKCXu87z4JWrJi8ra
   OktwMx5AepaEMrfcXrxrS1H+1N9EkxfH46s2Hw80SW3a+YBP+HozGWfcy
   ggugsDd/6JAfiNJ8igziRUIhAGzoBE1nwBgFV/J5St4bmD7jxU83Nzu06
   Q==;
X-CSE-ConnectionGUID: wHXYNkvbRdC0WFNI6LXhng==
X-CSE-MsgGUID: FWBPJQsjSb+AGI822RyMXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="155085208"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="155085208"
Received: from mail-japanwestazlp17011027.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.27])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 17:39:55 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxhW7FBOzQ+fN+/MWbZtDN0H8n2EE4O5/GP0QmFLFcYQ7whvMxSvL6SYJoaaGXDDbF5YjsKSgqk1qI1nq5TN5b/5nkKn5Kv58ZhRXVmmkroufHMQLVevLGYm3MhPfKO4Odf3Mn9RO64WRYGBFLfNd3kv0gxJr7JrQSz2eE65BPj0ldFxePMS7BCwnsiDCP8wR/JvOGEHhWe4Lc8COnFdD7ADrTauJbnvJOciemCTnBj9PR1A7l7Bwe8+oEarGy1KkvW57qkcnkhbjdkQTYOlfflHNDncpv0YQ4GDuf0VGXdTTgAfcxDLzGnKVhQ0imB9RvvDo63xzMQdbqFrDmBw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqLCB+Yakx9gyekWZpIl0CFj56oSfKRv3uJbNmkFYfo=;
 b=LUUlgyWs8jXulG8yo+Ajz3PJ9g4r9xTtb9Z7HFgkTYldIBMGHdlggr9SJAZq4WxMdVLlBsmZh5RjRbXAg3ouNwDq0ghcobEr6vu6Xwra3AGjON2hZJ8UdUmpHvxX/uzCdWoUOjIA6YNMOkw4Uzp2tfjKgsIkwm/EwAUWy8IR+3j8ORGB/SRnCe7Dp8bzPX5iFSghTDW2UvV4GCO7gt5PQfePedJf9mfMPyP1lhZYf5HVct0LsRkpV4ynqMZkg3SgRDw+DCmXUI8BxnnCuTph3Gix5qx4byNWbbXu8PrnvMRPCKa9xaVTQec0O+iwChh8L7IMJcde4Omt06ygaLXe4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by TYYPR01MB12368.jpnprd01.prod.outlook.com (2603:1096:405:f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 08:39:52 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 08:39:51 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'James Morse' <james.morse@arm.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Reinette Chatre <reinette.chatre@intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, "shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, "carl@os.amperecomputing.com"
	<carl@os.amperecomputing.com>, "lcherian@marvell.com" <lcherian@marvell.com>,
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	"peternewman@google.com" <peternewman@google.com>, "dfustini@baylibre.com"
	<dfustini@baylibre.com>, "amitsinght@marvell.com" <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>, Dave
 Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>, "Yury
 Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: RE: [PATCH v10 04/30] x86/resctrl: Optimize
 cpumask_any_housekeeping()
Thread-Topic: [PATCH v10 04/30] x86/resctrl: Optimize
 cpumask_any_housekeeping()
Thread-Index: AQHbwD1tSsbvK6HaG0qFhWR7x4BRbLPJ+bFw
Date: Fri, 9 May 2025 08:39:51 +0000
Message-ID:
 <OSZPR01MB8798F324AB66D9B62495E9088B8AA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-5-james.morse@arm.com>
In-Reply-To: <20250508171858.9197-5-james.morse@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=4fa52811-c592-4c85-a73a-4129d011129d;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-05-09T08:33:49Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|TYYPR01MB12368:EE_
x-ms-office365-filtering-correlation-id: a5edba64-f08c-4228-ca0a-08dd8ed510cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|1580799027|38070700018;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?WDUvTWlwc2VBNkJodlpMeDZtcURmMFVjZk5rUVIycVhjSW5FalFwK0I2?=
 =?iso-2022-jp?B?VlpiRkhhdFpNeU4wSG1pVXF3S2xlaUtjWFVxYTJ2MDV3NVgwYmlGb2xq?=
 =?iso-2022-jp?B?S09aU1VsMUtNaGlVYlg0R0JWQVlVbzhqdkRaUkp2NzExNzBTTTErR1Ar?=
 =?iso-2022-jp?B?MUVVTWZkMU1lYnRGS2oxbXppRXlHWjREZStmYzhlZXJpZ1J3TnUyamVP?=
 =?iso-2022-jp?B?aFNGYnAybzZYelJvd25qTFRucEFzUUwwM25hM0R4cFJ0NnhVWnRlbnpG?=
 =?iso-2022-jp?B?K01NUTZRdTcrU2N1bjJZd0czQTF6cmtIdXozM1RwekZoWk9FQnZtZGVx?=
 =?iso-2022-jp?B?blhqQ0lNU053a1NuNzZLVmNmbUEyWFdJaWlvMy91SEJiTlVvV1cxOHBP?=
 =?iso-2022-jp?B?a2d1SjFrWXR1czBtbmFseENzUzVXWEN3RWVtWTZnTEZxMyt6Q0hNbDRC?=
 =?iso-2022-jp?B?WUtyQlJCVDdxbzNSbDhQQlpUK3V4aW9oa1RUT2pscjBNSHd4RmlkRDBG?=
 =?iso-2022-jp?B?UWFBQ1NvTzlTQUljUlpXUDFKYVFiVnFIdEljM2ZzWXkvbG1PVlk5OThu?=
 =?iso-2022-jp?B?TXh1eWRYZXRkdmFpMjdXNTQrZXNTeWVwVXNkWXZkT1UwNkdzMWhpbHFC?=
 =?iso-2022-jp?B?akJnRDZ0WmpXRkQ0T2dCdHNnUjEwckQyZURMcFZNM0t2T2hQS0NVaFI0?=
 =?iso-2022-jp?B?RGo1cFJYYkNKZjNveldKNjZxL1V0cWF0bnZjb0IzeWcvWmE4UENwWWVD?=
 =?iso-2022-jp?B?SVpwcnNYWUFER3M1cEZOaTZMWmUrOGRYaGZ2YitTVFVvZzNvYk5WeXMz?=
 =?iso-2022-jp?B?UldUM3FTR2ljNHl5YmUrL3BVT29xOXFtTXlNSlJFcWV2V3ZmNTRNcm9a?=
 =?iso-2022-jp?B?bGltemNsZ0l0b3ZPUmk3QktmZGtaRldzYzg1blFLVVV3aWtmbW5nMWtT?=
 =?iso-2022-jp?B?K0FYRmY0YTVXRUgwYjNzWnhHNEFYY2NYeWNMa1lpRHZxVWtqSTRKbnBl?=
 =?iso-2022-jp?B?dkM3dkFLTHlsK0lTdTBSWXNhaWxUVEswbFF0ZEtzUWRWWlNScmNzUjda?=
 =?iso-2022-jp?B?QWU0TU4yR01UNzBGUFJlVUlNeHBZcEczaGJCdTBHOHBjcWRGbUVaWHVj?=
 =?iso-2022-jp?B?QWpsWU43ZnhIQjdUaHRETkFHSy92UHA4blBNMDlXem01aXZBVmxiWVFF?=
 =?iso-2022-jp?B?bjhFTG81SUNmNk5VZlk5aWVadjNvTWYwRUxpcHgxQ0V0VUhzTUtwb2lE?=
 =?iso-2022-jp?B?ZWcxVU5SUnVBdW1ZaEkzVXFKd3RUcFl4OFFvam9QL0phVGx5Z2V2Tzlj?=
 =?iso-2022-jp?B?cVNmVzRaL0s4YUYweW5sWDlpMWtMQ1d3ODZGOVZLbmRZSGc4VndFNDZh?=
 =?iso-2022-jp?B?aE5uK0lpSlA3aUtHbzJoM3g1OFlrM3REWHNxUHRsTy85bUYwYlZ3ZmNG?=
 =?iso-2022-jp?B?M0tFTTlMNys1WEF1QVFyQ0YvRTVpNWxJOEc5cmxrWlVTTStPc3F4aTQ2?=
 =?iso-2022-jp?B?KzFTM3BzTWRQZ0pLRmcwRUJaNzA5ZkV5TklQOEhLeHFuaXpLR05GMXFy?=
 =?iso-2022-jp?B?V0xRMG5oRW0wa1FVNXlEbWppRVdNeFZxVURpa1VoRmlFWENiMjVMdlNj?=
 =?iso-2022-jp?B?ZVArY1NEVCtMd0daa09mSmdCckxNOUVHMHFFL1loMDhFOHlFYkxPMEZQ?=
 =?iso-2022-jp?B?VjB2Q29ldlBST1J5ZHJrRm9kYk1jQzdWMWhoQ1lDOUdqSVNRaGZBbktp?=
 =?iso-2022-jp?B?MUhwWEtSSWcwRDFRaE92bnYwVWJhVC9odFJBaURlSlMyenVqdGFNdlpm?=
 =?iso-2022-jp?B?NmhtL1hzd1NZcDBkTXFFQ0krV0J2eENlMjhKUEl6QmV2Q2YwaE82d2Vs?=
 =?iso-2022-jp?B?ZW82MSsvK3EwVU1ON09leFg4cFRPbWpKdUd0bVF4cm9oTHZxUkFjbFRC?=
 =?iso-2022-jp?B?V0QrbzFQRjQxZm45cFdodWx6elNvQlFCdHk5a3V6YklMUUdGb09nRXdm?=
 =?iso-2022-jp?B?ZFZBWFMzdmhkOHYyWGxadVhkWHErU0Jhc01UV3diUVNJM3VMbjVvQm1k?=
 =?iso-2022-jp?B?U1Iwa2tjM3ZFbnVGSm5nai91YjNGZE4yVmdzTnBheFc2R3NxRUpKL2JG?=
 =?iso-2022-jp?B?VHYyYzBKOGpDMU9QZCtjb3c2SWpBb2lYSEd1YkJQczIwdEszd0Q0OXB3?=
 =?iso-2022-jp?B?MzhPTnMzN0ZBZmIyaUpveTMyWjFmMUFj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?eHpNeHdRN2JSUW9YZENxUllEM0J5dTd2aWNxM21tK0lSSExJbDUwWXhJ?=
 =?iso-2022-jp?B?UEZ3Q1hsdDRJSGZ4M0x1UzhkQ21JY2huZy96VXE0SVIrdFBnVlBPTDNI?=
 =?iso-2022-jp?B?ZUgrcEtGV2s1eXFwVGxXMmNxcHhkeGV2MmhPbmwxcEJSUnhnR2pCU2pY?=
 =?iso-2022-jp?B?WFVVTU5udk5jMkU0aGthQjhHcitVU1NGSHdEYkVOZDJmQ0VITWFWUXBm?=
 =?iso-2022-jp?B?YmM5MWczcmNkRmlaOHBoZ0hWSE1rZ3dMS0N3b2hlSmFLWWI4QThHNWRn?=
 =?iso-2022-jp?B?c2E1bElpMmhkd3RKUU1Da0RmWDB6NmlYbUNoV1l4RFlxTWo2Znc5UkF1?=
 =?iso-2022-jp?B?Y1BNcUNoZk04V0hEK3VuTDJXajdGNXZ5V3lJTVRwWGVkRXV5RTRqcWo2?=
 =?iso-2022-jp?B?MzkrUjlzbGRKMlB4R0FaZU9NU0xDSm1SOXdKekl3akJQTTcyUytkckZi?=
 =?iso-2022-jp?B?d0RxY211SXQzMEN3K3VOOU5oVkhKcFJlZ3Q4c0x5RU1hbklLZ0szRUpY?=
 =?iso-2022-jp?B?NWVYTEhER2NUK2VHQWY2T0NJVXJ2OG5qVnorVUZSWHYvWlNmeHk0bTR2?=
 =?iso-2022-jp?B?bTMrQXFTRHhSdkJuWkRWTHBkZlF6R2lHWUpDc1VaWnhPQ2hBYVVtUUZP?=
 =?iso-2022-jp?B?S2RqRi9HRFprc3N0SFFsOUN6cDMyN3JOanRUTFIzVFdpMktRcGV1NEIw?=
 =?iso-2022-jp?B?bjJndmJuSW8wdTdmZnFhNHp0Vmo0bk8zUWs0UXdyN2t0YmM4Y1B6ZDZm?=
 =?iso-2022-jp?B?SjFqZVpielhtblFCc2ErWjRaZFZJVXloOW9vL3ZMYkZsN214bDRCWk5H?=
 =?iso-2022-jp?B?eG5sSUdRRDdXbThvazdaZDd1OTB4cDZkVXRQNXNkK0JRT1I3R1JOQjVT?=
 =?iso-2022-jp?B?ZEg1N3pnSjJTeFY3cUNvRUtUWHM0ZHZLd1kvcmpvU0FWd1ZpdHNGRWcv?=
 =?iso-2022-jp?B?Z0RuU2RqWnpCYmZ1YTlQRlQySFNWR0N3bVZ3alVwOGZrc2kzVXJoM0pB?=
 =?iso-2022-jp?B?Q1A5aDMydHRHOGxwK3VEVnlTQUNiT3c0K1JFcWlieWRJVTMxVXBrYmpN?=
 =?iso-2022-jp?B?UXFsSng5QzdGOWxPUUZrdjlLdUN0MEY2eEtEaU03ckNzNXR2SlFUcDNp?=
 =?iso-2022-jp?B?bG1ybWhqcWVKQmxiUThCZTArREttYklOUFFLcWZHZXd3VllKc29YYTJZ?=
 =?iso-2022-jp?B?d0ZqZ3c1dTc1QlE1VG5semI4MitKVVE2R0c5MmR5MnZxekdub3NnS01s?=
 =?iso-2022-jp?B?cmpxWDlid1NrMzI5OTRjaEJqTXhhczQzNktaelVXc3IrK0JIOE5RZysw?=
 =?iso-2022-jp?B?eDRwd1N1WWQ1bkJmUk1WNENrZk9jWlVzOUp1WDNzcWx5UXlwT25mRm1T?=
 =?iso-2022-jp?B?Z0lIc0RxeFZYQit5MENuZytZTitEbzl1clZxT1NWay9KTG5sSmlVNDlY?=
 =?iso-2022-jp?B?VTRGdFJhQ0lIQk12SHZWNEJPOFZycEwrY2NBbnlzb2o1bDhwWXFkelRz?=
 =?iso-2022-jp?B?aFErcW92MXMzM21hbzVXZnY0Um9uSzdJY3VaR0daSzNoaTNjQkoyMEsz?=
 =?iso-2022-jp?B?WWJ5eFREWmk5N1I1ZGNmMjFXeGFvRWZtMmxQLzVSV2ErcnhnTGlKKzZi?=
 =?iso-2022-jp?B?SWZnRUt4MnNGOGllckFWM1RqSDQ5alA3Y1A3VUhNZm9WOU5CRDhzVTRF?=
 =?iso-2022-jp?B?UVBXY1l2dklQYkd1NUxGZFNvNUNHbWdsSzlvejlSa2c2aEpVaUJJT3ow?=
 =?iso-2022-jp?B?SzBkNnAvdkZnNWNIbVZxdHMwaHZyd0N0Tm54ZmxFYWlMSi9OQ1Y0T1hT?=
 =?iso-2022-jp?B?QzRpZE5xdGVsaVVkQUV0L0h6TDVzV3RDWk9NQjNBdTlJUFlGOE1Xc3cz?=
 =?iso-2022-jp?B?YXUwS21jbHB3K0dlYlJncXd2clBLY2g5SFUyaVkzUzZrOWRPbWNrMGdP?=
 =?iso-2022-jp?B?dWhZVVlLRUxJd2RVZmNQeDNUV0JOblhhamFobm4xOHpTaVQxeDNNcWlC?=
 =?iso-2022-jp?B?VjhCVFlpN0xEOU9kSEtDQndKeUVLNEZpbzYrelFYM055TTBaSmxvcVNo?=
 =?iso-2022-jp?B?YkZXNnltZE8wQ3dxSFI1ZmlwSFNRNVZQcytxaE9IMlBrdDl4eU5CWTBB?=
 =?iso-2022-jp?B?WlZBd2lCS3hlQUsyVUxBbjVldzNCWllNM3BOODB4bS9iM3c5Zk9semll?=
 =?iso-2022-jp?B?anhkOHk3ZTlybFdmVDRrMzRLYjNJcVBmSjJPSW14RFN5a3JKRVlXNXpF?=
 =?iso-2022-jp?B?RS9ZSUNUQVV1c2RuT0FpSkJjVElDcUpKM2R2Mmt1Vjc1OFVPbUVhSWlu?=
 =?iso-2022-jp?B?RTNRampIdUtKZmlxa2l5WEpIRHBnakh1ZlE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8k1KXH1q+iFTib0F/gV7ZL0V9c8XwdugFcHoXiTpNl0LJAQtgu0HDufabr7ldd8xa7JJ/NNLBF8bKOT42X3n99p52sXc09ihY1wPCaUmRNDc6RUCnbfeA/FavLJIzVJ043NeqNoKw/UUHwnxMqobxSncVjotqx6Emk4ZEj71iZbi8KKavLOCrf09QckAoWYlT+HUQuMSMdp8JNIsv+4fFd2SUYVM5aqmJYc9D0PW2VKcbJEunNO9Rb0BiMVwzMLwHdblO+qBcrsnrJGmd8wdldcySz5o1Cjvt7LREQmefnTtD1kx0VPZ3gQO7oihUf7ZoO/WJYOr4/a6m41gnonOr7igd1A64TY1BImwl0fR+OIpHWNkxD740awCCS3t2xlpkb7CdCTF0KcXyDtIrq8B5IokPDJVB2pr24fhGYOU/MCFq4HBOdBlTrxAlH3buMpA8VqOedAM1T/j9zqBclYkDAYO7aBeDcyFc+Y22YsaY5/npJeHCjEyS1LAbusxXqtM7hQhvcNyd5bqFbcLs5Ypw7pfdEgbZEokEnlLBcMWvr9Mb6OFQWOCEfw0NYsd/2CGhdjIJIwrI/u1jlkt5ZNZWMTa9VQb7JRN3e7aRtECc26QzYO5yWyTzO0tVq1/RaZF
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5edba64-f08c-4228-ca0a-08dd8ed510cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 08:39:51.7113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBOnG6GHZPRSOToELGLeaVD/w6lhJruhWXXLYkR2DYC+msI3YnkUwiFNaiUzpNTvlzH8pVs8wLFf2C1HSRRpay0EZGUbd6AHlrXqcdg7wfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12368

Hello James,

> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
>=20
> With the lack of cpumask_any_andnot_but(), cpumask_any_housekeeping()
> has to abuse cpumask_nth() functions.
>=20
> Update cpumask_any_housekeeping() to use the new cpumask_any_but()
> and cpumask_any_andnot_but(). These two functions understand
> RESCTRL_PICK_ANY_CPU, which simplifies cpumask_any_housekeeping()
> significantly.
>=20
> Tested-by: James Morse <james.morse@arm.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/x86/kernel/cpu/resctrl/internal.h | 28 +++++++-------------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
>=20
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h
> b/arch/x86/kernel/cpu/resctrl/internal.h
> index eaae99602b61..25b61e466715 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -47,30 +47,16 @@
>  static inline unsigned int
>  cpumask_any_housekeeping(const struct cpumask *mask, int exclude_cpu)
> {
> -	unsigned int cpu, hk_cpu;
> -
> -	if (exclude_cpu =3D=3D RESCTRL_PICK_ANY_CPU)
> -		cpu =3D cpumask_any(mask);
> -	else
> -		cpu =3D cpumask_any_but(mask, exclude_cpu);
> -
> -	/* Only continue if tick_nohz_full_mask has been initialized. */
> -	if (!tick_nohz_full_enabled())
> -		return cpu;
> -
> -	/* If the CPU picked isn't marked nohz_full nothing more needs doing.
> */
> -	if (cpu < nr_cpu_ids && !tick_nohz_full_cpu(cpu))
> -		return cpu;
> +	unsigned int cpu;
>=20
>  	/* Try to find a CPU that isn't nohz_full to use in preference */
> -	hk_cpu =3D cpumask_nth_andnot(0, mask, tick_nohz_full_mask);
> -	if (hk_cpu =3D=3D exclude_cpu)
> -		hk_cpu =3D cpumask_nth_andnot(1, mask,
> tick_nohz_full_mask);

It seems that the cpumask_nth_andnot() function is no longer used anywhere,
so it's better to remove it from ./include/linux/cpumask.h.

Best regards,
Shaopeng TAN

> +	if (tick_nohz_full_enabled()) {
> +		cpu =3D cpumask_any_andnot_but(mask, tick_nohz_full_mask,
> exclude_cpu);
> +		if (cpu < nr_cpu_ids)
> +			return cpu;
> +	}
>=20
> -	if (hk_cpu < nr_cpu_ids)
> -		cpu =3D hk_cpu;
> -
> -	return cpu;
> +	return cpumask_any_but(mask, exclude_cpu);
>  }
>=20
>  struct rdt_fs_context {
> --
> 2.39.5

