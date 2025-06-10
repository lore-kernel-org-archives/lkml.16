Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28573235062
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580850; cv=fail; b=j8dhj9sX5U9K23ceyGlku1/Um2zT1xf/09BsSkzw6oQFyX1MPgn3pUFbSAJmGzEHEjwrBUSvRYoVnTu6INdtp5e/g6q2NfxSwid8LyYZbzoJaGXCU2Z3yjl7ufzEK1TRJlXqwcI4RQMIAqJMV8FuVgiE4hd2v7UDZH+TFXh2aQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580850; c=relaxed/simple;
	bh=5MadtCOPQsBBHI1dw6sPM+5oTKe8I3picHwgNTAqPyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZMAY1iZvpO3jBnecSEuQPypfR8iZ/hkGAH+vYur4PxAhMlF0X7D+PVGMqfP6j+OOKJOFXDqZTXiPNVff1/NTXfjpt0cREJV6Gmv0950HveqGENU+WD04uE1cm7wYNHVPbMVI+5XTxKkFtXzWbXKPKXka7cO7B/oAZqG2qvG4Xnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MkfK+S2D; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=li4HZSE8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MkfK+S2D";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="li4HZSE8"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AGMefu011165;
	Tue, 10 Jun 2025 18:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=k3pujecfnPEavtlDnM
	/k6NSOyBzbvH+n5PJT36P3mmg=; b=MkfK+S2DLfpXQ3Kd/4nD57OV/DvRtSrnBV
	eorKdEgpf1NaCpr0FcaG1qh+mYal/0RCsrfV3UPIaTVXurVZ7iLE3cUxkRFA6M8l
	RBhs/ZqqaXXQkVsrf1pLZD++0qE3NkgohgSIZs5x5KBmJESVY5ga51PxBIKMXGMo
	0N3D8VUMHhHv374Jt3eTEv85+C+qH9VxTjsbDNkWC77632sjXisAF2A+tQ5Bv3vf
	y9w2oLOVmBtiBsknvXxPnOgN2VP3Gssvt1J9bbSkJcSRBDiWfdVUHobPkWpJHEpM
	9u3XlscxzlXeSCNsv8bdt96J55tt9mDM9hgFqhSjFA0/8tk3UNFQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywvunh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 18:40:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55AH4ncA021511;
	Tue, 10 Jun 2025 18:40:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv9u4pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 18:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYtqopndcw6cUBIthbixsNpm9VYwCFRvWtqOwhZfrw8QSaXFnHMkWMU3mRxBxZ35t4SMhmTPwySXFVANA/TIhpVvxZYnIi/8QRNJQXC/+4cG9N7bvUaBop/gqv15a6/TgKkWRRyS5NgIL9TkfJ2PVb8wL8GCz+Yd2Nyk89u+vZ+/ASMw88bcNEO5sv6DiQRjDiX/hzs0Ejch/EnclYuaZ2ZxdGESlMsrJHPvLjJMdGggZFsaB5j0EUwZ6WbZLKc+gKQh0TiV4FscB5QONrX3wrs7JgYBNZTqQqYzn4bjzaeQmWxv2DmujuEeBke4f0W54PbTmSZJY6BIKkR8njp3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3pujecfnPEavtlDnM/k6NSOyBzbvH+n5PJT36P3mmg=;
 b=Dk6iOz8dwYIjnvq7XwOTeettjmMTl19xBN67wiwOeFEy0Vw9zYoCX+zKIpWpEMaaBVXIvEq4CBFXTtspPh9L8JocfW2uSc1kHQcjVzIQ+9a9EL7YFk3n/NxcY9S+9Wur4batGOof3ko/UudPe2O/+0M48ppzhZ3eqHe293gNy4iiDNnJrM53Q4nHwVJQmveaGUrToaUT/VjS2YSw25eYEZ7AGji8JZ/xovi8hmPR2rafx88vckXB/V7OyiXXzr/1pzkG4nVwnLz0czIPf2Y9gEkRffiTpeWWOKNb7stXgm27NZr7uu+eiOnnN2j7J2ImD1j01tyJhD53ck39St2pqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3pujecfnPEavtlDnM/k6NSOyBzbvH+n5PJT36P3mmg=;
 b=li4HZSE80AFYZMMi4gtY9rTABAgXaU9uIGsYYo0Sdc8z5weH02QZoXmzeB8pPSy9QuD9cWT8wS08RYCbrCB9UP1Q1i+BRzBmD5ArmbSqmSLpSeczL952XbHx1qrjQlWXMLsydGazBJ/EMtieyavZFBxW4hfC9yj5zwemd+eUG5w=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MN2PR10MB4303.namprd10.prod.outlook.com (2603:10b6:208:1d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 18:40:33 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 18:40:33 +0000
Date: Tue, 10 Jun 2025 14:40:30 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vma: reset VMA iterator on commit_merge() OOM failure
Message-ID: <u36foizqfsdur4mvy5y4fcsahxtcxljlhrouqkmetycihm2rns@ebjd5jrljgny>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250606125032.164249-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606125032.164249-1-lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0501.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::24) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MN2PR10MB4303:EE_
X-MS-Office365-Filtering-Correlation-Id: 6860ce6a-cfbe-4306-9e47-08dda84e483c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lod+eFIYr9Xkz1r1KbhIsMw7LbAuO9Q76HO2EnmqXDi3zzeB5jg5r7JquhRu?=
 =?us-ascii?Q?stej8zN3fQMn3BbHdbwqufCjWVdZFNDC5EIugLqwbG2Qso0g73pY7hLqx6IB?=
 =?us-ascii?Q?qDNCtbYf/wIfnMAqD7HNeQY3VMobv/J3jb699f70/rUBk3pKX2YuOgXLZi2H?=
 =?us-ascii?Q?kChR9qDwak0ZasBclwx+6Fn6F9KIMx1UWfPAS1Q0QZazHFehafJWXLZeWD4z?=
 =?us-ascii?Q?n9dY9QJVWcX1DVopUA1btmftw5L0HUMHLhYOEh33pcSkrpMbt3bHqeTcDxsu?=
 =?us-ascii?Q?/X/BcOHSu9pTM8BG9fP/5LRS6Rgubu3n8dcuEtL/bWCjsN742pua20K7YMBH?=
 =?us-ascii?Q?r+fPCPJS4qLPc3xJ1ujo43fKr8WgboGVJpYZeFRPG2bAc9UU3Yb/OOgJC5tj?=
 =?us-ascii?Q?przJbR7vvrPdyTB32Q2FRhRztQ+S7/lspFMBLM6kmeAo3ObsE8nB/XFBzPIN?=
 =?us-ascii?Q?dO4RYkPamN9SALD9SPDsY1oxhCgItJmNUgmgSgSuMvyYnIsWMlNlOIfP1neI?=
 =?us-ascii?Q?4yeHFK2tb19q0cApj+qJ047QbC3G1DCVBjV9+oNSYAxrbEa5Zft5ATvCo0RX?=
 =?us-ascii?Q?8DTGH1fjF0JaERVPPF3YGoPNbh8STCAlM0ngfdFG/762Um0Z26cb8pDECtav?=
 =?us-ascii?Q?bbzxsVX7sqEA8UFTZtZGzbQ+LljJwGr9qikUvNrF/6wiMb/rfZvtBbo+ssFC?=
 =?us-ascii?Q?3lhpyQ+g6CzZmIY76Gj7HonZVMxgD1TWRVNSopSuM2eHqBnRriN6tG4Hjh67?=
 =?us-ascii?Q?rkoJ6fkGq0GPYqlbJUWK5rao/26Y0xEsokdmGAJPL1KLeRNZJZUaMDb1jk7r?=
 =?us-ascii?Q?VtClIGnJ9m6Tf/55LL8+5ZrYYVGCSxJ4n68e2dC9zibpKUvTT5c/kidgbDGm?=
 =?us-ascii?Q?RMpgcT2soEY8AV7Xie0Guqy6BnwycQTjfB4lQH+efcpiJxzyNmQ6ap/1eprO?=
 =?us-ascii?Q?PG7hIsKZCZPbrVyzsXMJhSrWmTUP+T5vwRT930baQwNf41Yw7nwRmqD+ePGU?=
 =?us-ascii?Q?bPxhgoNzu3Vxfel6u+qqKozTkLHr61bVxV2uGgLD+APTEn8DqjVFbiWbiPbM?=
 =?us-ascii?Q?LwAmfREJtS0tbrrrKqJsQWlRL/BHi+1zoKKuXvlFa2S3k1qcwxIc6iMK5v8w?=
 =?us-ascii?Q?eHHGDoIdtjP6OW9eHD1h+w1U618DkT3faQ4a/aAF55VgsrI8ag2E5DZZBZo+?=
 =?us-ascii?Q?SKu08PAY0tWVRKE59srXZ+zGMK2pFHhz0GEngfl7I72j+qDnamNOAW8bz0XK?=
 =?us-ascii?Q?riJS8kl1kYeGnUzkeFwIR82BbVOycE5Qh2wuW6j5AtwQ50DzsyFBQ0E7okZR?=
 =?us-ascii?Q?u/XM/087NGaCMjfeXU6gC63I4dXpyqcI/XqEiZAPxjLF7p28o1v3vkKJPmda?=
 =?us-ascii?Q?B+ZX3mkMUnNSIi5nBm6PdduA79AaAFCnaGY50zQrcKhmHh+5JPWo6iT5lff+?=
 =?us-ascii?Q?V9duKdX7uy8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nqzeiTlJpGbSJUKEUZXRUcczEfCVSSj56z6a69XCUmQbTNTZeBBqggU1av/A?=
 =?us-ascii?Q?o30SN3ntCtWsqTkYbzyc+CxT8OdwlaTlq7J6c5Rl41xCSM2Ugbe6As8GGby5?=
 =?us-ascii?Q?exiXOOXVyFFKhkr5S/Daf4eJ7gHD4EuZC3Vz5kotun0BBCDY3EOO4QCu1GvT?=
 =?us-ascii?Q?8N5kEZPRrHyofm8waKqHUkm0oMq6IOzK+GVeslOVkzLTsjX9xDfcHdwU8Pp1?=
 =?us-ascii?Q?88A6W2MZca9YeoeHxtM7r3+saS2aCKUOdBhSCut8wyALiGJjksWBMpVj8Gpp?=
 =?us-ascii?Q?Nu9rGUUwufi+qZZ/b9icVtd//xdRV3Pejx3DMYKTIVMewumYamYOr+2q9wBn?=
 =?us-ascii?Q?eduIzkLj7L+pU+zQvCppHWfuVt7Q6PEFiDd7tMAvC6lDc3DxXo1C+GD/2z01?=
 =?us-ascii?Q?+aZyudmEALwOqaIjvDY+CBXbKzfDByNDhMpZQwj2ExKlpiTKTee+6SDMD8+A?=
 =?us-ascii?Q?VfI4xKdoYsw+5P6QpPIk19uA3pJFImEPGuTNxVvb6/PyK4MRDxQe57WypN1U?=
 =?us-ascii?Q?Jiapp+kaHmtMVZ00HkM1clUyNAlZ6+jwyTqTKXxQEt0e3IoxX2nEiR031gDq?=
 =?us-ascii?Q?lt03swLvyf1hjyMbLIe5DCLircJQyI8ic55I3x0Yl+9luNubNteym0grlHMy?=
 =?us-ascii?Q?i5Xkv9EjWiYTKBsKT5VGC5hZmDebAnEiOpX6+rdJo+jCXdSS3LFqWZ3S/bzW?=
 =?us-ascii?Q?Acq8ihPGZRkKhzvLLRWjoRqLumDMEFiIDmGOaLPTX2WwO4QKx7ZadTBtJrJD?=
 =?us-ascii?Q?sFtAhIHtggtYYgo6XTrD6G3PRl9SRYXh68PHc/I8OMbC4OBKk5lA8HEbqDPO?=
 =?us-ascii?Q?43L9pVFMSnRs5kb9EE7tbcvuA8BKEOJnYchFGcntbuXNI+OjcOS/7eTSZT4+?=
 =?us-ascii?Q?9rreDulHDGZxK6EKtgz0XOxuSmgezkiL2scel1Db4W1GemBKK8isz/lZC2He?=
 =?us-ascii?Q?sCZQX0ZHl0ZzoGgIwHi2EZLYGS6KcB3Wm8rKCWPzu+rjCX2ACmxLnLX92R5e?=
 =?us-ascii?Q?F5UYHKc8Y3k66dYbQkUtxr5Ftns9fb5twuavWWyPjz+PZxUebLde5t2l6kIt?=
 =?us-ascii?Q?CFBd/fpzTeFYflLr8CTfM+wlJtgXMhOE4PiVpnnPCMOmBg0BVyT1Rm3xm2C/?=
 =?us-ascii?Q?EtNAAaHPAP4PAfVaHBYowGQiVrGHWHoo49VJ4ZEchsz1UcLkcDarwhCE09HY?=
 =?us-ascii?Q?YhQ98Ql8FU4XY2W9jyYy2nWPHQxt+Y8a3tXfYJJvtAGowkngr3VtZ9r4+M0I?=
 =?us-ascii?Q?Xd4ZuTf524PwQP5iNXJYXX980stsjOrMyPv1q4sUp0LuGHzcwiaPSe9IBtzG?=
 =?us-ascii?Q?btSmatMJY4/BAcMg/hLWUnnFSeQSqDPidPnQpn/vi2PG3QM5AhTsnDpfjxqI?=
 =?us-ascii?Q?ANpoY89lRpzGTPc+pzkBpqtzKzI9TvF8SJe/MOzk5fCDmHrnSGbI1n3/OX4t?=
 =?us-ascii?Q?u+HjwNTiwek3tUdZBUAIrNM9QulDb4lrNzQe67s6+a5EX9VM2uBfpRZWP/jS?=
 =?us-ascii?Q?+Yd6rv5ZQVHF2mE6WyWhsj1x/+KIVHDtBlX1PancpCBCDu/Ivq1ocQygJjpa?=
 =?us-ascii?Q?Z8yjJcmS6zes7RwiMqT0KLK8gl5n4SfBR5UgwVve?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SwuDYEQD26ijiVnspjIeYkZy8LOItvph5KrZ/lUvg1AXi6xsGF4Ay1JgbQrGBbNLdf6TDXp7gIidF6n4geKbz6X7/Tis2nQB2fTa0QgWOxmaQObk4YUKT4GJ9aEM1RSXUdDAtbwiBjE6/bDm3rU+5BwwOrS6HbvRSYyiYF3SZd40qGKvmfh8XWdcN/dPgfINCMq2oaWfvmC1K4MNCoG+stuJoPf/Bdeq66VV/nqDKEqiYlrFwda/h2lBh4t1wf+KU5GYfzPJzu5qNCy664aDWL3uhVK9n2ZVUgv/x2TtnY3kG+5lRO9juJrJqLGna5sH1iIitLoPzkOax/3ePAqnyerWHgW7vhIPJgV7pgBe0Pv0PChRHYqYGbTfIYqtA4zqRG1opp49cfFELn60Iz4MhrFugwoMSiLVegd6EsonTiIJL7/voUVT3XMRhgQk4yWjhWH8lZqHY9EzyVrdEDj4oNApdpgUyA+PuwIXdQhy8nqOVLAHtJ2ttDBQaBqFz6yiOvUrAEcTuBgY5YNwSaBdM7xV840nGacYluuaDHEEHyB5PnfoAfPZZOc/J/a2dW+lktCQmZ8JCkXQVuz2Qhv625h9gBQMoA3mCyV8pS5j/xY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6860ce6a-cfbe-4306-9e47-08dda84e483c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 18:40:33.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waFwfqwKlQ9YMzegvmbkqnFTqGc+V87PtLg7e4sDzTObfYLE28laqRZrBWLPzeq3oPeZDuAseaIp5dPTsallEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4303
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506100152
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=68487c25 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=yPCof4ZbAAAA:8 a=hSkVLCK3AAAA:8 a=7MQRWbQPFeerY-RaosQA:9 a=CjuIK1q_8ugA:10 a=cQPPKAXgyycSBL8etih5:22 cc=ntf
 awl=host:13206
X-Proofpoint-ORIG-GUID: WAZiXwi-jXxMNtIvWUfxbD0jJxxry1cn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE1MiBTYWx0ZWRfX5acHBMWtNihi o1rYJZQGMSAzwI1hWJNn1sJ+phViQrCBwHJr9fGMaNc8O1WhgFdBeehCb7Zn7/a3r5ogZDXZ+Mf G/OPvnzlDUti4s8EudR3DSOWmtpF0eDeDv3LeKR6GyKWHXZZhu1wWp7HtTW27KsZZUIy6+xsRh/
 +5yuTKBc0Vb6UZQxn4/i6coWQMqyENB0Tg4Pyzf9tGGnSmQAI+cKmGXBsTbQdbBUuuQ6oAtgKcL NaanzoHHvI+4syTSGZEvTG5qm5F2e25/y+nMBlbBij210BGOkITTs4m14o3r61PMYXMFKP6iXLw XKudAduXymeNfET1azdV9le5Uupakh1VQvK9d39qyAK8LnTTJwVk5vJEMsRC3DNacXH78p46wp3
 h+MskCtItOAtpgpm2L9mUP2MpLmYIcNDtJjtGU/cQf07t86n3j6N4BR3hfBYyLXQOTdHALyx
X-Proofpoint-GUID: WAZiXwi-jXxMNtIvWUfxbD0jJxxry1cn

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250606 08:51]:
> While an OOM failure in commit_merge() isn't really feasible due to the
> allocation which might fail (a maple tree pre-allocation) being 'too small
> to fail', we do need to handle this case correctly regardless.
> 
> In vma_merge_existing_range(), we can theoretically encounter failures
> which result in an OOM error in two ways - firstly dup_anon_vma() might
> fail with an OOM error, and secondly commit_merge() failing, ultimately, to
> pre-allocate a maple tree node.
> 
> The abort logic for dup_anon_vma() resets the VMA iterator to the initial
> range, ensuring that any logic looping on this iterator will correctly
> proceed to the next VMA.
> 
> However the commit_merge() abort logic does not do the same thing. This
> resulted in a syzbot report occurring because mlockall() iterates through
> VMAs, is tolerant of errors, but ended up with an incorrect previous VMA
> being specified due to incorrect iterator state.
> 
> While making this change, it became apparent we are duplicating logic - the
> logic introduced in commit 41e6ddcaa0f1 ("mm/vma: add give_up_on_oom option
> on modify/merge, use in uffd release") duplicates the vmg->give_up_on_oom
> check in both abort branches.
> 
> Additionally, we observe that we can perform the anon_dup check safely on
> dup_anon_vma() failure, as this will not be modified should this call fail.
> 
> Finally, we need to reset the iterator in both cases, so now we can simply
> use the exact same code to abort for both.
> 
> We remove the VM_WARN_ON(err != -ENOMEM) as it would be silly for this to
> be otherwise and it allows us to implement the abort check more neatly.

Nice clean up.

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> 
> Reported-by: syzbot+d16409ea9ecc16ed261a@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-mm/6842cc67.a00a0220.29ac89.003b.GAE@google.com/
> Fixes: 47b16d0462a4 ("mm: abort vma_modify() on merge out of memory failure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/vma.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index 1497d7d28096..01b1d26d87b4 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -967,26 +967,9 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  		err = dup_anon_vma(next, middle, &anon_dup);
>  	}
> 
> -	if (err)
> +	if (err || commit_merge(vmg))
>  		goto abort;
> 
> -	err = commit_merge(vmg);
> -	if (err) {
> -		VM_WARN_ON(err != -ENOMEM);
> -
> -		if (anon_dup)
> -			unlink_anon_vmas(anon_dup);
> -
> -		/*
> -		 * We've cleaned up any cloned anon_vma's, no VMAs have been
> -		 * modified, no harm no foul if the user requests that we not
> -		 * report this and just give up, leaving the VMAs unmerged.
> -		 */
> -		if (!vmg->give_up_on_oom)
> -			vmg->state = VMA_MERGE_ERROR_NOMEM;
> -		return NULL;
> -	}
> -
>  	khugepaged_enter_vma(vmg->target, vmg->flags);
>  	vmg->state = VMA_MERGE_SUCCESS;
>  	return vmg->target;
> @@ -995,6 +978,9 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  	vma_iter_set(vmg->vmi, start);
>  	vma_iter_load(vmg->vmi);
> 
> +	if (anon_dup)
> +		unlink_anon_vmas(anon_dup);
> +

Nit, I would have put this earlier in the abort path in case other
issues need to be addressed later.  Hardly worth a respin though, I
don't really see this ever needing to be done anyways.

>  	/*
>  	 * This means we have failed to clone anon_vma's correctly, but no
>  	 * actual changes to VMAs have occurred, so no harm no foul - if the
> --
> 2.49.0
