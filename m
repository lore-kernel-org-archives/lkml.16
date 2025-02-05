Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C083846F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787244; cv=fail; b=QHcTm6tHExWDulFa0htK7mfU/AcHgmXLfUSIKCKu4oAqQozzYlxbseb2JfvHnHlDr2m1rHo8fsCzFeGf0jSR8Yv+ZOoxArf7aZdn0C41DiBEPtmCk+yabXSHqooBfbJEI+cq9JMgZIYH+ayepUtg0p1Q4xw4rfWB4SrMBqSGYhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787244; c=relaxed/simple;
	bh=np2Fu0SkdAU0+cYOAxCOaSHwswvYqfoaFSEcG0YIsAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fYblyT+t7nj74ykz2YctcdpaDwBwLgyu90IQRy1QJsQaRpIh/tyLU1+YqDn8JvMVSx0ALVPtLG7Lh2UqmfBdKcpUGA7HrCr82PrLOUfCylAifqG0YWeaF6D/F022C/qz1Q6ElYJHb0elDSY5G0Oj86+7YRsoJDjGWzEtHLVro/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e5eWHt0Y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cHCpxcfG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e5eWHt0Y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cHCpxcfG"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515GfpmD015241;
	Wed, 5 Feb 2025 20:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=jfzg82ReF4gjrvdfyA
	jYMWg9e2KXlbWBH5lFf3bWHCs=; b=e5eWHt0Y1eA7H5bK0t/faUw8039KoN0kkS
	dh0vpfUfJWFv7SPwIddnHkiBj1Uz6gnXTtLw7wI4ASRKKHmHZ18H3frjvxo7D6F6
	LS/G3TEPkiF5PBWtGzQQJabCZeAmpUSe4LfamaobpBuKfbamHjemM2M5Yoqd/U2R
	L3CZPxxAZD9ckvRdHfONzJnXiJtZ2+VFEFIMvENCtzuH/dtGnWrkmo4q0rHKPX+x
	mbTUwKtr2LQfEdpriOP1sk+jdEbezZAoG6Z+CmJzHHLKq9r17Cvcx1t8NDiWWs2m
	tf+wwYASP04d54bIspoL8FYNxOCidoqOyH/ytbYOZr0X2ZFImT4A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m50u9b45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 20:27:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515Jtr9Z026994;
	Wed, 5 Feb 2025 20:27:04 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fp2qbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 20:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m99UihGPZaiY1h+N8DSymnJdx6ZYXNrR0BDeXGqhBSsVYdDrgf0uz/YGBkHqy8tiBeOzuxKg89D+UlOLlB/o+pVoB8uMeuoBLWjeoneDv0p+yCivHAw7P9keBPDmxL/UBNZ3Zx/MJ2CYoQBMmUAoTy/6KKDRDKdZGzgCV0IsYzlItBxubq8d0KC2e/bhcDZrjZDaLcV7KbHikzMCbJ7r1feYHaLwlP55znQbhG+TAer0i0xqrwo/PAQ1QkwhLN2V0Bx2S5DEcYaEaDQ/xIUqu3hvhc5SqRvy8cEV38IFPf3yffwpxSlwMTFD95Y9N1mztFW+YoadkHULXFmD+13GLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfzg82ReF4gjrvdfyAjYMWg9e2KXlbWBH5lFf3bWHCs=;
 b=sTzE5qSGFEpZZ3elnUUfDQtZ5D9a2eCklVdKrDZy4BXutao9pniRSxd4W28lm/FjAAWcBxIlBW3PTAzPGoJwdvJEYZI2MXR1c5auf5IPOdPudJemZp3EjrK2ICu4sGx0iDZGUYT+NFq/j3JCoLn5aNsjD4vDsqUyME60ZmV+a4L8R43JOxljwIolJZ91aRk6T5p6xacDVtsYbfBMWa6uwBb7qQomvaHH/DB2blm27roDH0DhIZF5qdI62BhVGmoiFMNYntcknKAxGkv55SD2oaQZuNtUNwNlQBWFkeeBkuK6JzcI0yXYuvLorfKp/TxR7Cv97WQhoNkEKx0Iej3Kyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfzg82ReF4gjrvdfyAjYMWg9e2KXlbWBH5lFf3bWHCs=;
 b=cHCpxcfGRD8V4PbdZTiTeNjp4dmxfo/TCvseg/8nC6FLX7iPE8uO9de3rowjzW1g+dSpLqEiFu259irCDr79Yiebpq0hjYRdpmJIc+gaZpeysAtxzRUNbv/0mizRm0uC4Y+3EWA4Ny4eS3SFx/9oq1dJCRISsEH0sroxJ4YIGTc=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH2PR10MB4117.namprd10.prod.outlook.com (2603:10b6:610:ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 20:27:02 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 20:27:02 +0000
Date: Wed, 5 Feb 2025 15:26:59 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] pid: sprinkle tasklist_lock asserts
Message-ID: <wzbq4zk7uln5pzjkho4olu3hku2xv2taxymv3ien437tjxivlm@sz5kxj5oohsq>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250205193221.402150-1-mjguzik@gmail.com>
 <20250205193221.402150-4-mjguzik@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205193221.402150-4-mjguzik@gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::22) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH2PR10MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: a7236911-fbae-48dd-ba21-08dd462372da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wcMd2AmXkrFTj58VGPkXRg7AeHfEsmgLn52uVdxVSKGQviBh8nCIgIeM490F?=
 =?us-ascii?Q?s5C+768FFJ7Mi+dSDc7jn9nE7WbwcTtoyLsJj5AFCnDmNSW5cjH5m05ZJsq4?=
 =?us-ascii?Q?DExJKlSd+KIPwsZww5VbZeZ1QSWCy4r3l3cjk1dht2oKTMQIwJ/Qd5V/4avT?=
 =?us-ascii?Q?WnkEeplejUX0cvLs7xIj+KIVniV7M6RIt7gvh8lcammPGVGhZwkQCff3YJUT?=
 =?us-ascii?Q?9fbbGx40dpIOTYiWAuCv8WFQgL1ZBX7Ryj1VxsY0rvXQ1669jR7K43KLUuFF?=
 =?us-ascii?Q?ljT5IOFHry4XbtkiZNf5z2QtURELTjg3TXN6lbEgNRyHihYIkWgiR4gM535C?=
 =?us-ascii?Q?VC5jGMTKwNsUYJj26mIx8/30nhRVEQ21AeT9/IZfHoRGFq58uS0Orb+jmnQH?=
 =?us-ascii?Q?+dGumsD7YHXIrZWwv9rvAmFmpmlFsRXEGT4kKHPsF9ZL+Q3ymJS/sc548CWG?=
 =?us-ascii?Q?YLs49jvyTADUyByFDflSFHmZq6isayp+QaSyWhUbhdKpRNRsi03QZzo3hblx?=
 =?us-ascii?Q?rpAg08sDFHkEgx2VzYYWfPtxPag8XtEBo6mbfof7dxYFUJEdfFXXNVOUqU+t?=
 =?us-ascii?Q?SRGsu09MuADO16mjs9IQ22W/WHF/Ypog86EaUIulmghugXvisd7R1tBJyd+p?=
 =?us-ascii?Q?UsTjRK/bxtK58YVitIxvRfxqRSc2ldaIrLLm1B7O7Si5Rna0Ty6RQHo9uOO0?=
 =?us-ascii?Q?r8nX06XUa58Xf8W3WPaA1b6mRabZ59DbS4NEh+cpdj4U+i0ShzzfHfLdnY5F?=
 =?us-ascii?Q?Hml17N0FGyC4IOx9JDxDwrqju2u2Rs1KQnQ/bSq+qOkjBCGqZULeNmLGlD7a?=
 =?us-ascii?Q?Ai9XE2Fq7aRTHhh7KA5gDsbOHs6+RXb4CZfHZZN12OTkO/EfG+skEz23onkI?=
 =?us-ascii?Q?o6eKMb+KPzHdyl+syP95/hxBfPjxK8ptdFwpwwe9hg2UrgOyzuYdYf9WCOtq?=
 =?us-ascii?Q?imT/DrVZDXdgN4rurakw4TWr1jgHgXRQzbaGRGK+8wC8qWwGh4mUTe5tWXyn?=
 =?us-ascii?Q?5WLbrVYxLDZmDLipWvMVOauPbuHcST257R9nCY/X6RJxBD2upsJzbl4R48ND?=
 =?us-ascii?Q?okrWqgOwbBcjsVDm8fevsqQ77mWE+BsQ0CCrY85YtmrG3ShJYznffuKqVKKk?=
 =?us-ascii?Q?80JbgO1CV1Q/KjtclQXravdBhEyXxHw67QFARShhSQl1ZdHXS9Hf83sWkAz4?=
 =?us-ascii?Q?aUH4fllW9VXwBBI2oWe1nlefNBBBD02O6qPDJQk/2v+QNZDU/Hg9WHuh/Js7?=
 =?us-ascii?Q?MDenpNhk/TgUohNeVRgoh2Q/Szi+toD2DdjL0rrwmrze/FEJ/O8oyxTjo4Cz?=
 =?us-ascii?Q?+S9FgZYyCLAmfnWODEUyNJVUiJzlqu41vi1e9+Z90BQ1ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uKfmQZ2bsbaTWeh2tsoC0vDxrm0669N2kpRBJ7LOzy+y10cysiOKFAisdSUu?=
 =?us-ascii?Q?R2PPigKwId3SsZwH7S6QZT82jKHSSd/K2jWYZPxbdFht5MkXHg8ODITwxro0?=
 =?us-ascii?Q?6sOhWekvHWweRIBLUqAT8kFsj9K6Psxe/vblrbUOIBZvXGrVQ72rxVmp8+7q?=
 =?us-ascii?Q?/DyV8pGppRgZ/I+6G2NieQep15chtK7Q804kXvRU93VIhOQeXMW3FEsku1MG?=
 =?us-ascii?Q?TjqCyNzY5wAwCc3H2w8uePugEZTVQ3Ux0jMTz3e5fCnrR03ThZDcAzTPC43v?=
 =?us-ascii?Q?02fSe8Jy7REpKUEs5FF6UBU2SPI6FOy9j0p+IFfAyqno8YMzQvQA6JDF3C+0?=
 =?us-ascii?Q?C2FfjmkpK4/jsyiZK61vGC+K6G9CvyzPNyV7lqORzQHB/QYPTDiWQxyOReXy?=
 =?us-ascii?Q?xkupv0bWjXuVPCxf/6RdObZGu1r3T8OvRKWhXNersE/I0gm9W8S0pGvNVhKJ?=
 =?us-ascii?Q?U6Yl4GHWN26e/42rHa03WCbc131nRj0kZIfdy+QdGz6OxR5SGSoJhjng7p2b?=
 =?us-ascii?Q?RwF8Hm6fsXpg/bo+WmxN25VZrpjA23gDvyvmmuMCXPEunrKKJqfAfUMAN7Ce?=
 =?us-ascii?Q?hOWzAEpn6s9YJ4LkKQM9K3IIsD3Z/P9ZIJ0wzL3Tia9UeApVI82bab2/4coV?=
 =?us-ascii?Q?1Igb5emP6zBnnP9DYxTfKiMI2FDD8ECmvncyW6U4rDMchaNQJZHoKwH3axQg?=
 =?us-ascii?Q?V+5d7EQ3xUwyxwXQak6C1EO3NGF5f7y+h+nu8tD3A53nmTtSZm2FrDmPSSTb?=
 =?us-ascii?Q?y18CMJPNbCHECPIGtGQUm0RR1lUdtxx4tkYClA2OD7QCHFBLaKa8tj5TjcP4?=
 =?us-ascii?Q?9qHEHpxbfmQbOCM1DJvNmP40ng5H6Hm50A/NzSUiKVe38r26W2a78YqaGD68?=
 =?us-ascii?Q?LJsA/6uQnVhlmnDQfj+EOoSid+HupMAUBYRzr/6YLF47vr9LQ/IZMb6cgTKu?=
 =?us-ascii?Q?FgeU1TUAPWrdhvZeZfiVOxnc5Rh+1XFJTPGPb6BkB4ndvJyN/npfig7YR+23?=
 =?us-ascii?Q?jESrkVNfo2J6e4r8dVBuJ1iv1NlgdSoqVV+mbSLuHFZLOY1RJ1yBS5/4JTBp?=
 =?us-ascii?Q?STEFarlO1sDK2sOL7Nz3QjtkcVEe70kcy/wVyzPgsrkYo91s6rTcBhc/AUwG?=
 =?us-ascii?Q?Ec0zbnp+QB5BOvfYfd4PoA91NlJtJWogtQ171YnjXff+fD00ClSHwtKc65zm?=
 =?us-ascii?Q?MOBO4uMO59zzS/PT88TSYBDy7+8EqOJKcDBDKAhgbPmKOZ7GSU1toJA6poyb?=
 =?us-ascii?Q?cQbwbahBwV0PAko7De+wfGBxjMK2p6Chc2BSOie5ZvyGCVgxcGZYp5LcU4Sc?=
 =?us-ascii?Q?86QjrjVghHqbQnADhCJ5eOFfYS8hpMVDB5qGSR9FEpzvxBClsu4DaDNnxVtJ?=
 =?us-ascii?Q?5wku7eAc6mn02vn/SJOXvBoLFs4YQK/7MIO5zKjqG0rJ4A3eGswRg7Uw+AxN?=
 =?us-ascii?Q?/d3RCX+/VgqAirEDDq1cx8sNQCC5InpwEsSS+q7Z0tG8V9JTSzIEyR3nKZ5O?=
 =?us-ascii?Q?ScF/pwrQevRdY0OE+VZVelPZ1mwML3zzxDs/ZHh+T1g3U+6SgMzgCALBsVKZ?=
 =?us-ascii?Q?2cNI5iO4mgKmBS+hBLm13gQdydwzptz/PApXd9XV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qdPlbpTQBmcGzCYI9gu1uVEeAn+lcy5gxBc6CbOnH4bhGEg3wAPofCXpyULG7WkVr2OcoY09V4TA06IrtPPUBJ/adNHPhtS8lAd6B6IiFlyhx+eCFa+61xCQv8ZZ3j/49dbLH+zi9x0Pp+sZ+lolSS1tqFq6KFPJhtCRr+x2Kjl+978FMUepE/mDuMYFkTf0hJGqrU6SPczgNKTjCWTON44YOFmkG2ZDoazIvpAkfUc7GqlPhwJcLWnnIg7q2F1rYo9lo7X8yOQo2LTqje4tWwpDbR2gDkr5Rx1d6mpZbo34DN1H2itLed92SjXJurWcLStxZo4LxDwVSeDfQFc9KqzFa9vv6DKbO3ID1jvpIxrnjM5W8o1dqYw0TrZtZ+h4obq2xw6U69pKaQpXQeN+RfcwEy56oHhJh0LeGsKDo/BTARcc4xujwVXOszQf+SjBi32JM5PO5S6utsee8SMBHffcqj7Dj4OD9s6cI+7pYqgwY2jBKvE7nvCVO8B31WUoYp5GTo+4mguOYc9nte5HJKSXiAVc6w5RsOEz0syovLAobhZlDBpKTdwfHrRAarUC9ysHL0SfL4rqTIq/xdDlxrOVLaXiGLzUoJBA31Q/8Sw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7236911-fbae-48dd-ba21-08dd462372da
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 20:27:02.2699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pN0whyWAnAsx30iyVFenBiibTJTP63zZh2x3Cht1xl+CP7tleLxKN8EVe2mGXqWB1Sci5VlM+Wn4BBNEovg+aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_07,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=990 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050155
X-Proofpoint-GUID: Uvw0kyfO-INfEB2aQSFeQQGQFDrikqZU
X-Proofpoint-ORIG-GUID: Uvw0kyfO-INfEB2aQSFeQQGQFDrikqZU

* Mateusz Guzik <mjguzik@gmail.com> [250205 14:33]:

If a patch is worth doing, it's worth explaining.  I'm surprised you
didn't add a comment after the last revision missed a comment on patch
2/6.  This is literally in the submitting patches document [1].

I don't mean to delay this series, but I do want to know why things are
done when I'm hunting through git logs.  Having a change log isn't
optional, and now you know that Andrews script won't fix this problem
[2].

I see you are upset by this considering the terse and lack of
punctuation in patch 2, but please try to understand these comments
serve a purpose in maintaining the code years later.

[1]. https://www.kernel.org/doc/html/v6.12/process/submitting-patches.html#describe-your-changes
[2]. https://lore.kernel.org/all/20250203175128.80319b42c9739f0d420080a4@linux-foundation.org/

> Reviewed-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> ---
>  kernel/pid.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 924084713be8..2ae872f689a7 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -339,17 +339,23 @@ static struct pid **task_pid_ptr(struct task_struct *task, enum pid_type type)
>   */
>  void attach_pid(struct task_struct *task, enum pid_type type)
>  {
> -	struct pid *pid = *task_pid_ptr(task, type);
> +	struct pid *pid;
> +
> +	lockdep_assert_held_write(&tasklist_lock);
> +
> +	pid = *task_pid_ptr(task, type);
>  	hlist_add_head_rcu(&task->pid_links[type], &pid->tasks[type]);
>  }
>  
>  static void __change_pid(struct task_struct *task, enum pid_type type,
>  			struct pid *new)
>  {
> -	struct pid **pid_ptr = task_pid_ptr(task, type);
> -	struct pid *pid;
> +	struct pid **pid_ptr, *pid;
>  	int tmp;
>  
> +	lockdep_assert_held_write(&tasklist_lock);
> +
> +	pid_ptr = task_pid_ptr(task, type);
>  	pid = *pid_ptr;
>  
>  	hlist_del_rcu(&task->pid_links[type]);
> @@ -386,6 +392,8 @@ void exchange_tids(struct task_struct *left, struct task_struct *right)
>  	struct hlist_head *head1 = &pid1->tasks[PIDTYPE_PID];
>  	struct hlist_head *head2 = &pid2->tasks[PIDTYPE_PID];
>  
> +	lockdep_assert_held_write(&tasklist_lock);
> +
>  	/* Swap the single entry tid lists */
>  	hlists_swap_heads_rcu(head1, head2);
>  
> @@ -403,6 +411,7 @@ void transfer_pid(struct task_struct *old, struct task_struct *new,
>  			   enum pid_type type)
>  {
>  	WARN_ON_ONCE(type == PIDTYPE_PID);
> +	lockdep_assert_held_write(&tasklist_lock);
>  	hlist_replace_rcu(&old->pid_links[type], &new->pid_links[type]);
>  }
>  
> -- 
> 2.43.0
> 
> 
