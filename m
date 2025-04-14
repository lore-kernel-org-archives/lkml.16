Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970FD101F2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744602418; cv=fail; b=WboFuCdSthqLseEv7NFm8SHLES+9CfZ2MLuX9NLuGAJZOI4+0Sxlldr0rzYsdwmkbRj1QFmmB5lnhHMAbDoU3R0jJU5s2qY0aqgeWp1GML/RV23mxB4tPCokoXeGiL/0+Nv7LVrmipwpTOnANuChjm6wBNPvfaORLIcad526ukc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744602418; c=relaxed/simple;
	bh=mZzXVyfw5TTLVpnO0mVRTn8MMJxNSU23MB9IIpuhDPE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=b2ELB1xPDk8BE3AjUon/EjuQu9oWkLWKyoXC4WkwZxfMKQwFJQzBcg+5cORelgHcvQnpWQQyBqzFM9D7elJ3GxKhZ9OEJLsbgWEp6ArfRZXEc278QYKG6L7mwWasVlmiLirdF+vBOQjlgmqvOxxBhJa13Uukh5gK85WbKhNJLEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=egOnPIvS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DzaHDIAu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="egOnPIvS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DzaHDIAu"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E2CFq7015631;
	Mon, 14 Apr 2025 03:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=y45t2vzRHCoTUfCQ
	ILvpS1sJzK/xMqQdJ4vlHT4Z6Oo=; b=egOnPIvSpjBCNQbvHH7a0LiPoi3YCFv/
	Q2QSK7oNy5PA/8BYWQIrW7TWWdBJZmX/UKTU2LAZsSYTkNwKIxGBOxtu+9aokX3x
	xqKEf/iVQGFwSedUeext2sj7+uDv5fVDToT7rLv+SI64IntBDL6vgFf8pYbTwxSb
	At3dbKvTBDqmnBbzkTtbcFyEY7PUUAFSSjlvlYRpidafH2HrkDvU46vRgtAKxmFi
	zZ/67nxoLsvsyLOikl8K256Px9QZDoc3MdtupIwGIwv7ReFyg7HqtmvJrqCnjNxI
	I/Ti5JRln9yVENX+tFEub999YMuOTu/2SwRpKYRlDt3hQMitlq1uTg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 460qw9g4vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3UUVU024638;
	Mon, 14 Apr 2025 03:46:10 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010003.outbound.protection.outlook.com [40.93.1.3])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d4x6e8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4sqywjZGrwVzCmjR5e2RwWcavTdt3acpD0XxOUlfD7ocsdiQf5X/uMOdTCdCOgZEezDidnZxwloDf1yO8T1wXq77VrJ0NfqUs6WwtZptGGUS/zjrfEKVmwruksafN2gcutA6pTqWlJ1Dc3tvQFexnmASbggrnqD1E4c6tVi36h8IGRAG8iSi4/ysL1QXcQg1DDNQZtm45e5TmVMDpBbepx01AGnzF41p/ZPFkt82MOodeAscWI9BDCIOOhOh4qG1V7NiY9zZ5GX3oRQjd6BrSlPEKz5H0Ng0WVVpe3n20o3Prsq3YtY8u0PTgajNguEqWjwM4YeySgi00MTzUKO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y45t2vzRHCoTUfCQILvpS1sJzK/xMqQdJ4vlHT4Z6Oo=;
 b=I3He+hkOgGNfcIQHgNg79IYngM7/nYSSaldy52WaaksJ3qwFrE1yF85zzLN03RhDgGoLecJYlQAQdgr/4E8Ii37AcGoXSZF5r4AgKnu3DV4X8C4LW5pcVuYGFfVflHK03HWen0v5f73/ubGT4v/TUbY378lyXMNyGVNpONmWwUEPTbaJfNo6aAeo700sJLXVRjHRiqk7SXJ4NqSGAo1IGoVySnDx92xd5Or9veLcnOwIJFY8y4u8sR3sWyHCzc2tAOEze1ztP42mIb2F07dQo4mY+Pr+7G4uzD31IjsQ+yKWFEOz5Vs6W+wXVLOjnDbkIJ5niDG9MMehBHubEHecsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y45t2vzRHCoTUfCQILvpS1sJzK/xMqQdJ4vlHT4Z6Oo=;
 b=DzaHDIAu28cuZ69rw/G7kprQlkfnObrqeRwpWgXEIdCXGtz2oTkZW3h69+OYaxnmMGTJ9qOj4uVwtuO8jxR6DD2L7Mtu4vx6EOXEDeArbXd4NODRsbRRFuz6xxRKczSzyrJn6G3CnUlSdC3kLuApFOqfr23i4V7+Ps7EEa8+1Rk=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by DS4PPFDB583D803.namprd10.prod.outlook.com (2603:10b6:f:fc00::d50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 03:46:08 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:46:08 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
        rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        ankur.a.arora@oracle.com
Subject: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
Date: Sun, 13 Apr 2025 20:46:03 -0700
Message-Id: <20250414034607.762653-1-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0337.namprd04.prod.outlook.com
 (2603:10b6:303:8a::12) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|DS4PPFDB583D803:EE_
X-MS-Office365-Filtering-Correlation-Id: 51946f4a-d70f-4047-2cc4-08dd7b06e3e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p43bYOFIAaqXcYoyC14DWpkZanYIu844XvPRQQmAQ/el4COju/Uf9p2j0pg4?=
 =?us-ascii?Q?wLzkOsqTyiOUb2sUfMjMmcGNoXSnYoFgij4JA2fo3UDQmKoUp6jXhiRv3bGM?=
 =?us-ascii?Q?0dRshje1sATdr6WVD/IGp0Oh2V/gq/xGe1fHhu8IotChmE1K+qxgI4tLQidB?=
 =?us-ascii?Q?cw8zbIyRDBK3s95F2d0EZBVLZJfgFKfzLaX/L/GycGa4f3XBHUtFA5OX16Qn?=
 =?us-ascii?Q?9HIkJSpzklRtvuwU0tcxtcVOoZH1zvGUqMPMVv0qBEd7xmgCE07n8WmoW3iK?=
 =?us-ascii?Q?vKT0vopF0/DK4xbcHrl3+8EcVbFVFLdYsHGSqfEKEYg4n0QKbtSvVw9uWafQ?=
 =?us-ascii?Q?Pz2fLYtLQ/nfEQxy9c3UMTTovomHYI/k/5vgE0m0a2wo6NazJfhjUGxWMGTO?=
 =?us-ascii?Q?POYPORfZDurhH0BMMgdSKgBpb8+L1gWNdk80gkuKe3KxVyaTLLfmiJvo7yRE?=
 =?us-ascii?Q?8fPVAo13stjFhd+i6wTKxkjUTCMkgQrEH9Sl2nX5sWuDrilBMj04i0flfxFG?=
 =?us-ascii?Q?frfaWb9D7eyr8R1VAt26TwZI1YZYNhPGviAyGSonTwseYKbQLoeWTlMeJ7jX?=
 =?us-ascii?Q?ipdTmDQb5fu3jZyrSMLKlSXZQb1xxABxZx35jcFKkmrX2VseLsITJQeTPu0J?=
 =?us-ascii?Q?u052+IQajBWvLQ9rBBHeTROacV5Z7jvuitD4tNYU4AJZSS4pnwi3G2WYpQAc?=
 =?us-ascii?Q?lq2N1UF7wr3Y4DCdVEf0shL62OJsquq7Bj7JMH1tR30w3HlVPTY6nbGgNvvf?=
 =?us-ascii?Q?qpDTkfqoQa6LNE+Nfo0mDOBMzaBhr/9e/smOX078eaeO8FlLMZtKN0S9krNF?=
 =?us-ascii?Q?Cnz2ZslUJsiFcNv4GtBXTXNb9KOZpchfYCFjC9jyTMDArZoI7/BOmk4myWfP?=
 =?us-ascii?Q?Y7dJAnVTDVw2F1fnG/l4zGzR1L45gwtTJPOQgjfalCqMQjEYnb24Em4el1X2?=
 =?us-ascii?Q?sgYh7g2hDUq6gkRSyxU/p/DFsJ/QOsS0yC82gu3/CoKj3zwByMSdMddJmPIk?=
 =?us-ascii?Q?SjIwAW3aCb28n4T4Sx3kiGps87Lxwno7cFwwEAHjMrVOvVsH/OkQJGkUordA?=
 =?us-ascii?Q?Ui6coDPMDPBr6Cd92HYbvgiXg8hPSdwqUH+4ln050FDwRICxsLcO030tYzdy?=
 =?us-ascii?Q?JYMgsPPt01bOZc951BqScXA6YvTH/mILD7lnAihvWrpOKQtevUrRH8++lSsR?=
 =?us-ascii?Q?d0f7EhIjkJnIfrWMKgBxiWYZ0IqcbWuILZ2uV32nmbEdDCSLrGatDZr5WVK4?=
 =?us-ascii?Q?kdCxAOqFk2dNd9eogq35hwvnPSjc6x5zo6eENRl/KH1za7yJyXgjuDU2Ex3K?=
 =?us-ascii?Q?MR5Kzr+6wvz10ebJh9POPP6oQJcFIQMkc9BamsL5zdEbzZmPcACHNnScvsmm?=
 =?us-ascii?Q?FSIbuY7Aw57vPsUDUIIG5suh8sqX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?10p2XYuL3PN+P5Mchw14kCz7CdjfwLaZuYcDCgK2eexwuP4gzfCyh9HKHoz3?=
 =?us-ascii?Q?aEuf0S+ikhFN6mjyBH6LIBNGXQBq196OAZj18aHfIYUPYQpus1+tmESNF1j0?=
 =?us-ascii?Q?KLIswCkwq/P+cveQ6Rp/GxQCze1zm8usYgS7uLpUmKetg32s+VdVWlbI479Z?=
 =?us-ascii?Q?aysdOFbEUcRcPwCRLUyEcAPS24pJ8bk/m9GEaO8WQdK1+2Tv7A0rFhfshI4X?=
 =?us-ascii?Q?sgN4RLg/DIkbOhD3p+JBJ/CXyolaf2Bx0ucyub316p0DlMD080OYBmmDVrYk?=
 =?us-ascii?Q?BiKNaITDkYSt3S3f5qTJWTqj6Jergl3ZZFBoTqzBdzfh1TnduucX35a8QdHF?=
 =?us-ascii?Q?XWG57XuDVzChc/BGWNyJO7CywnGJUFyARJKW4frwQ2VHhlAhFvhYo3O6hetY?=
 =?us-ascii?Q?8kCUfXkalzGRtNphZ5mfDlAWdCyn40L/adzQNtdS+Mi86VPhQv9YnGt/NE5U?=
 =?us-ascii?Q?fMJBQELEPLR153nOdTZ2XFJVAhwhq/61PgrRbDxRq8Tlj61zywOiLt9OEPJL?=
 =?us-ascii?Q?KqVhbm+fAwhwaIjUiYUl6WYW8i2ABEF3eV8RcOtNGlW4Wvrqi4RzKyYPIQiE?=
 =?us-ascii?Q?nMm8ae2Phn+EluZ8JK5DrUFI3kT3zkozIAv2TfxPC1T4ZUI47VRQWTpDdNM6?=
 =?us-ascii?Q?0gqVeQC/HrlBlNg0Im0jrxNRD0D6BWcqoVwJJoJN77f4QF2cDdm0ueESJfBj?=
 =?us-ascii?Q?kZ5Z8f0j50bioMU7CJ1iZDqAouBTDm6rz1prMm7A3HBGXEL+V5WRZ+F3rvZv?=
 =?us-ascii?Q?MQQAMZxx1L7Qs6bEy8iJXpiw8nwmlQzns7T3k7qCrOAKEsFOqK9MHzsCiASP?=
 =?us-ascii?Q?/ZOjHn0tplYAnB5m1TtjpaFhAYdz7GRwLsUqO0pfnpU4YfQDCcCz7m5Yrh6S?=
 =?us-ascii?Q?Mt4YmmR22+fl9DOI+mmix7Os12Y0KZWV5kq19YhCX3nzH/w9XOr7zWMbFqNr?=
 =?us-ascii?Q?MH/qbnpsVK4voWSOfOIz5ya5LkL7iaPC9vMuOjCylaSnrhVKqn24r2whUhU0?=
 =?us-ascii?Q?1vsvSgIV9/6bxDZ7vmUD/fKVNS/tB5cmmt8TBjgZGlRJMiwiGtXaXgEzTtT7?=
 =?us-ascii?Q?4CazHkO677/guXD7Ga9n0gbXI/SMA17WIs4hgcth6BolsGl4mNnXuX10DCWV?=
 =?us-ascii?Q?mOf/C2i1qgXF6AFg4BNobnsvx/rQDe+C89Wj1Cz7ekXJ2EKblrme4gjHyyRI?=
 =?us-ascii?Q?mPyq75eDznHhit6GJ3/H2x5p4Jp6ukZPB3R5nKADN2yZ8RiwYVBh/mMCCo9A?=
 =?us-ascii?Q?44KR4LhO4qugO1RUh/DAmUcMLlhlq2eRE06kCa8uALnjt6zwHZknk32TcwA6?=
 =?us-ascii?Q?LMaktVCpHxxdOUwNP5qzLT16OiXeX4Nw2JwfRqIgBwZ/eTQjDncaIZLiqXXF?=
 =?us-ascii?Q?WZ1YFimsZaDV6sFzqrB1pA0wJQRoFpQBAlwGCHyhHBrw6+viS3MlQygU3tG4?=
 =?us-ascii?Q?+In9i04ePPk2IPRaDyfRzLIdpJptkhMQa5po3Y9SvZCYrXY99g1JaeBtAXhM?=
 =?us-ascii?Q?+BneTk/7GZqNyjoQTTauExWA5bh1GjzzdZi/YhxSA/fcRmn5fNi9jXc0OeWd?=
 =?us-ascii?Q?NFQpNawr8DACpKzyl2GNwTuaF6HPXGG9+FH87eD50/eTMEmVuMxfJfl86dlP?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C8hbc+iOWHtR+hp98HUdRtE+40/DWBGbY63t3iBRhVh/v+bwmKlu0BUTgMizuWxPdvQzU1VdlL4QfW8rCQouNI9lkuJEWLoK2Ry7FsGGUQJ1fKzoThhx/yw0nwR7B6QAnCB0CdCP0khxxl/9nDWHbq5RNFE3tBncFxIrDu6wGm4k0b9tJ0l2FhowkjV6qdDSQ8AN1KTmNfs0Vg1cI4xJbXgwIo5lcYmkiKZSFCkWMGwKKvE9E9rYoqiOgMAxKbwjrkpPaVSICxwEU7Yw48W/ajZbt5HU7fpPQsBvrpUuH1aTctHkmLIKwsPNiLVWMLFW/EPFdc+FrXj36U+8X/GhyeE6Tnw5LlwPlyHJxaYo5o4d+azx5odH9C2zURNcHrdD7LOo5Byv/v/ywWaBZ3SNmNdKYdLBW0ZQ3Pix7HcOLrPsNLUwIo25k0GmtzGi+HqVD8lO7KZb1wkSFbeTGsR8nL40AVLoEs1yC7CXIkyJNIOtwwH60tc5RxQGaCa9rtm8vJOE5WMJ/ESfattKPpSRw/4KdnQPC12LQ9y14yTeLYDuXUadqfKhZEIfBFAAzCNVAAg6NQBEcK7rRLqB8u9U3SiJgopy8eFvWFYsu+8uOQU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51946f4a-d70f-4047-2cc4-08dd7b06e3e5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:46:08.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+y/TTq1eeMPdNep6w9YPPbu8MI7Tn61jxU5xot2v7Nm9/l2/1pQH/NKnyArv30sq15Kj9mPhL9o6dp7Od5eRGLihRnl8eE8BudU4neOF5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB583D803
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504140026
X-Proofpoint-GUID: aimdtK9XmErjuRX7PgG4Pf5wnRBZuZee
X-Proofpoint-ORIG-GUID: aimdtK9XmErjuRX7PgG4Pf5wnRBZuZee

This series adds multi-page clearing for hugepages. It is a rework
of [1] which took a detour through PREEMPT_LAZY [2].

Why multi-page clearing?: multi-page clearing improves upon the
current page-at-a-time approach by providing the processor with a
hint as to the real region size. A processor could use this hint to,
for instance, elide cacheline allocation when clearing a large
region.

This optimization in particular is done by REP; STOS on AMD Zen
where regions larger than L3-size use non-temporal stores.

This results in significantly better performance. 

We also see performance improvement for cases where this optimization is
unavailable (pg-sz=2MB on AMD, and pg-sz=2MB|1GB on Intel) because
REP; STOS is typically microcoded which can now be amortized over
larger regions and the hint allows the hardware prefetcher to do a
better job.

Milan (EPYC 7J13, boost=0, preempt=full|lazy):

                 mm/folio_zero_user    x86/folio_zero_user     change
                  (GB/s  +- stddev)      (GB/s  +- stddev)

  pg-sz=1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.2%
  pg-sz=2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.5%

Icelakex (Platinum 8358, no_turbo=1, preempt=full|lazy):

                 mm/folio_zero_user    x86/folio_zero_user     change
                  (GB/s +- stddev)      (GB/s +- stddev)

  pg-sz=1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.57%
  pg-sz=2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.10%

Interaction with preemption: as discussed in [3], zeroing large
regions with string instructions doesn't work well with cooperative
preemption models which need regular invocations of cond_resched(). So,
this optimization is limited to only preemptible models (full, lazy).

This is done by overriding __folio_zero_user() -- which does the usual
page-at-a-time zeroing -- by an architecture optimized version but
only when running under preemptible models.
As such this ties an architecture specific optimization too closely
to preemption. Should be easy enough to change but seemed like the
simplest approach.

Comments appreciated!

Also at:
  github.com/terminus/linux clear-pages-preempt.v1


[1] https://lore.kernel.org/lkml/20230830184958.2333078-1-ankur.a.arora@oracle.com/
[2] https://lore.kernel.org/lkml/87cyyfxd4k.ffs@tglx/
[3] https://lore.kernel.org/lkml/CAHk-=wj9En-BC4t7J9xFZOws5ShwaR9yor7FxHZr8CTVyEP_+Q@mail.gmail.com/

Ankur Arora (4):
  x86/clear_page: extend clear_page*() for multi-page clearing
  x86/clear_page: add clear_pages()
  huge_page: allow arch override for folio_zero_user()
  x86/folio_zero_user: multi-page clearing

 arch/x86/include/asm/page_32.h |  6 ++++
 arch/x86/include/asm/page_64.h | 27 +++++++++------
 arch/x86/lib/clear_page_64.S   | 52 +++++++++++++++++++++--------
 arch/x86/mm/Makefile           |  1 +
 arch/x86/mm/memory.c           | 60 ++++++++++++++++++++++++++++++++++
 include/linux/mm.h             |  1 +
 mm/memory.c                    | 38 ++++++++++++++++++---
 7 files changed, 156 insertions(+), 29 deletions(-)
 create mode 100644 arch/x86/mm/memory.c

-- 
2.31.1

