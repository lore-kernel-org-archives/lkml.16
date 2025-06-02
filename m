Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA7C221FC3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877662; cv=fail; b=YHzwlsPkLb3CgBsvF/cBSgpsSZBGmYtuOKxJr8MS3wA549OAnkVC2dlZ42rjflxnROH/gJ3WK5LLemt/Wm3jEqVXJL6Sk8h+ouwj22SR8x0Bfg3oo3EbYxYbUe+SIBj1vZKW6zENj8ERb1PzP3XQwtP/G9rnwJW+8gtpK9gm/7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877662; c=relaxed/simple;
	bh=Kg+TqBYorQtaZJ7aWC/Iz0i28M5xaMY9422W0+iDpDs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ssEzPXyI6Ttbz0qi/6U1s0MyeyIEFfJ0DRXc+QzWLoLE3oPDm/2/yU/bjEZw2GANyyEASIkGl4VS8PF2eS9u6PUbNDwGrNBuT9M5NLE1NvDd0wM++SyS5hIa/JPF8gXEDK1TFrUy7reQXM3X2JIhTvUm+su9eb3/PbvPSOwm4gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FxST/Vg1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zd98dJm4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FxST/Vg1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zd98dJm4"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552C4YOT019825;
	Mon, 2 Jun 2025 15:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=6AA6MTOANKUGaOOq
	dTxEsWmTXhGVxor8XwBfgpzaPps=; b=FxST/Vg1QcQ1jPa6bCH6CvCbXeeVWaMf
	KKpVcnlh4Ughs3my5bfv7fLyn3jewHJCHPeSFxhGOlvUMien6/iZqQQ5j/joPt1Z
	hfxVeU8PpZoFORcmQsLxMOd7VV7euaa78qAhkDcxR1QXZApyGKWhk3Rx1joOctKh
	PCPV8XhbF8+iLl8QgP/4qT2YNnlP5i4YM2cmvG5o/hOjy2xz9M70fFChrizCzucz
	RduDWXvQYl2nFo77cJrnLCabPlFp2dX7p6TP0kpgRu6GbzdmxoQPpQrGqxc6EQI2
	ZBo+oVLH9LwSs9nT2HI2zVq7b9o7GQjGh3xhEbDgbmEL5V9a/tVFHA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ytawjt2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 15:20:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 552F5MNn034243;
	Mon, 2 Jun 2025 15:20:25 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7843mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 15:20:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXs45ixBnhOJJ3Oh5vyVSuu5tDT8WFNhuh4p8CxxECKlTOaGrYNpslsh9Rm0thhCNtdprFS1m1lzPTSbYtZjaqmqv+wf0sC0ON4jok/DC87sm0aPiC+jBrsrTTVuebhAhGmdYOF1RbnnZE4g3ERp/+J7ML1srjmVqSzVOQN8LRy4y62mzhrEXv2YCuEFc0uKW7o1IrH6QLuxLmKEKk4FYx1UipjhWJK/xqxYwurGK32KuPTiqXvCHPm2oqCaaZunn0Wf+ntwFqCH9BGtgTJ8nxE9zzgFzjuRqTdJ85VrngFsR6VxRjvvlGcj43d9mpj8lRvJa24pLtzTbu/6i+gR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AA6MTOANKUGaOOqdTxEsWmTXhGVxor8XwBfgpzaPps=;
 b=JrnHvjVNaZtOusXAWrAWtDBJOvsQVUPxeVcd9fl4ErrBTLn5VBNzjg1zCJIeA94GOri58N6c0eybwDNDfSRZOb6mSyvRpqf8sumPCZGzviYnKbRgruTIIKGqOrHp1Xc4C/ALYXl3ouzimmspZdlM1fJ3oHa1tIhfXWHxjK3BxBzw95Bzes5Hs7s87c2CF5UbzKDeh0txoPLxMy3tRRwiUJGY6g2PleTahtNnUGqLCqW2+DFG2y2KKJtB/Sq/tk5Q2daPTo+YWVJT3ThaC6iv61mI1zM5yWcoO40vnNh2bES9et+OSwwLP4clMjjQ2audv29YwjfOcCp48dZAa4dB5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AA6MTOANKUGaOOqdTxEsWmTXhGVxor8XwBfgpzaPps=;
 b=zd98dJm4nRyb0Juv+0WWPSOoDwgpvcwjqHczQeS5NqwAE9HJa+swdLJy7aM80Kl3uzJBGqS5sLc+pYLm5Ri64ncaevePOXzUbNbUsB1SCfL0il4gR9W6k7roGSTl+K8ieLhqyEpKBZ28AG21nubi8DQ5Ew88jco0hLxKJ+H3n24=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Mon, 2 Jun
 2025 15:20:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 15:20:22 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yu Zhao <yuzhao@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Chris Li <chrisl@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH] MAINTAINERS: add mm swap section
Date: Mon,  2 Jun 2025 16:20:15 +0100
Message-ID: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4769:EE_
X-MS-Office365-Filtering-Correlation-Id: 495c5b34-5700-42ce-869f-08dda1e8fdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8zzNHgqX+4YcFKNIGTUAWYFn/b+s5BhnM0jscpoLUl9J9KyqhKddoxn3UaXO?=
 =?us-ascii?Q?zl+OK9p2FdxKU9CC7FSFUvi0uze5wiXu+lVaPS4t3qFJZx+ss3e+L/K8KpD4?=
 =?us-ascii?Q?O9AVCpX26F53CgbI00Jtd+HjXtduqcborJaq4ojsqBMEeWhCdQEkSMIrkQGr?=
 =?us-ascii?Q?9sUSniCjGAG+Ltaw1EdsIfMor6Ff0koBAW5wu2XZMtDL4aAX3Y13XgUilk1T?=
 =?us-ascii?Q?LJrKtQcJR9Uyr7OC5YXQwO+hiq/DKyh4SPgyoMEs1rTAtXPO89FGNMaKeOqJ?=
 =?us-ascii?Q?78YZOS0VpSVfuCi+ch73SBr0EwMXd6a5ZkSTzuB+I2OYoW6or5oGEvq0hHK4?=
 =?us-ascii?Q?dsutqnJgjDbcppmRZhBrEUvtO7pQzJ4N6AgTSx7B/21a/zShp4d5sXyZSLu/?=
 =?us-ascii?Q?vDXDdcSY35J0mip8F+mAfzDqGnmA6geFSL0cU5mXlb2zTPUTuJl+SEFfwbOa?=
 =?us-ascii?Q?j+73IA4NUUFeeYorhLkUstbQ9qs3KoR4udqTY0rNr9jGBIWH0yLZbOenURuv?=
 =?us-ascii?Q?Li8kLavnsZfrZblmbRe20XdDbXb7wITeBySIolEoNddxa5iao2G1Yuwf5CR8?=
 =?us-ascii?Q?9P80WkHcsVtzQuLNbBAJlsDGjRnsC1Q5dz0Y/PwN2dqtc5LEosbbLILvw3JK?=
 =?us-ascii?Q?0cwqBxL4gzNZNOoN7hkvtKKI3OEzL9l5/SLEkSKz82SBJgZMKkuQOTzlVQKT?=
 =?us-ascii?Q?oKmxKJOpe4b3/CZ4Ef9nUMEeumhIbFfngvxwbW1bt+vcghg/XKanzS3QssSW?=
 =?us-ascii?Q?F4QhoKBntV5qTLVvkvmzgOcMFSzBk/BmZJJMXXMo4hJeNMItdT8IyouTf7rj?=
 =?us-ascii?Q?i7Idb3G26CcKOGCCYRXTJVw2zJaYz28YZz487A+OyXA3DUcAM6Zht5UBXfZS?=
 =?us-ascii?Q?T6SIrtOmKuDwKQhY7a8ZD6xdg7s2FhpyKLF2FzJb4Zi2kI7VpD6HOHsquuqt?=
 =?us-ascii?Q?ofp0H49DXijWqJjXMjko22hUBcRfLqx9uidp5YleTy/EnL01dQY5aJN6IZp1?=
 =?us-ascii?Q?7RHVrqVwKyICPFB25c/IIMn+YunZpElOX9gHpIohkQI4lUdTbsmgEAzVuOpE?=
 =?us-ascii?Q?oVeKwRfUnDvUg8wgDrpcUoqJx42a1V6/3ScYNtXIdmeSL3d4zMz+GusPAznI?=
 =?us-ascii?Q?QheNhRO1Ol7Yoo/BWEkBunTh8zmeC98z8+ogQc5br9pcDK/3MXcpWG6iexyr?=
 =?us-ascii?Q?TOuJdkWvZNfsjAqHAlV+laIWNW9UTmGVE8ntQd3sLOVtyO6UhR7t+9bM0jnX?=
 =?us-ascii?Q?KnnrGuRgX/rqTX9rNvJ8viKN1IxNbZfhQy57Q6ZTpKZpkWfY+QpoFenwSHN6?=
 =?us-ascii?Q?ipGygd36aHVg94kuFD8D1JUc+tuPFoxmJfu2ZheU4gLKj+iziXYmkfxZJhDo?=
 =?us-ascii?Q?axMJvu8XymYg5IEKGiY2IyWtOiyFlDqJ/+/7ag3zCmIQ43iNbM4p+kNiRD9t?=
 =?us-ascii?Q?9AAiCdOL3Qs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ebJWtsrIUkYiLvhYP0Gwj8uSKiEASUHvFPF/Q68QKjRfmW9XuXuShdZ//Dnr?=
 =?us-ascii?Q?TNF2daOcNcD5paVabPHsTgfX3N4WZPUAM2yBKAkRd+rOOF67WycKabopKefW?=
 =?us-ascii?Q?qBzJydnNWXB1WzyvH7OR3crVLVsANA9RVY1lXKf+vPDCo3/NqfkhDkYydzji?=
 =?us-ascii?Q?x/+vICfTDezk2ZNWE/bgHsz7vgWW1V3+p9yzzaIE3gH8bM3/j+6XC5r+KwVv?=
 =?us-ascii?Q?EawDPR3M+Tk1X179ykCe7lu4YwleD5v8sR4fgah+gvpodHpz34m6SWN/z2fK?=
 =?us-ascii?Q?VNVxaVx9vTP2EFOotItXLlfpSZXRf5Sw2Mk2veKWt2d6grgKnG1Lfkruwb/6?=
 =?us-ascii?Q?EyrlltHzMG8zubgTm9yyGklD3r/ooakD4ftkjPA0yKHBaWoyvBh7srFEgs4X?=
 =?us-ascii?Q?J6jgqx+skoKLEa+sPWmTC2mcHtUjWq5fwfb153XAzdgOClBnOP2qa4dyIfb3?=
 =?us-ascii?Q?aiL22oWBHBmAIVsvNZiTMcXcXqIY0suRc1r1RBrIK2THPvmdKBao4vXMwuRL?=
 =?us-ascii?Q?Umtn3ZqYefQBe5hv0qx456MsxNVXRfn0Iu/9PVvWGWkh+g00L+eLHk1fdkZU?=
 =?us-ascii?Q?7ow9L+SzRnP8GZxhYW5C60Zo549Kj4UaJFsmDamhmHqdkGpUmIHuNPTotIkX?=
 =?us-ascii?Q?uvPKHpOfpEZ3YPRCYupq28TOU8syIb1Xkx4e4M93k3m4M6cYacVC0FRgota8?=
 =?us-ascii?Q?LM+Y1w3pc7nttscxG2f5rO/4+sm0nRE2lj3Lhjvs1yk5YyADb2xdwQpaB7Nm?=
 =?us-ascii?Q?kJ+0uu+FgKdPsZSQdU3z1NGxrY9rwU3cY/wsL5uWAivhhl0P4Tjum4qrM4EV?=
 =?us-ascii?Q?R7jfL9NhITp5A/o5gxI6jYOgiI/v72bbBVUv2hQT8RvFV74rDYvMcAFeH6HW?=
 =?us-ascii?Q?5rUcTPJ3r51DG1KyzHgE2kOXkT963UIRJuRun/SqNSFPH0BS0shNdhhotpcE?=
 =?us-ascii?Q?iiLrKtg4d1CQc3J+wHOB6PMFul9kEP2fjEIjCE8YbwymEtnhLmi4pb3adj0a?=
 =?us-ascii?Q?1nvg/6t8pdM9zKbOStFNx20zuVOFJnlhlipu3xdx6tNtVaDRsBMGYEsTRr1v?=
 =?us-ascii?Q?x9bi0gX/f3qJT2GmyXDKNGxxWlsVNozH0s+et9FVNc6iSR2p6rVF7EzrcahK?=
 =?us-ascii?Q?1yAMUkK1y+dvvt17eLSqDxUca8jCyeoPYWFIdPr40eKXbGVuBDMa/FIJnUk9?=
 =?us-ascii?Q?I4zSiUStyfJGSGxfY+9e9pNxXKDfkNmldBUalWojYgW8nPIm6djtBXpwhC3p?=
 =?us-ascii?Q?NxtniPhnrIqmZS2ee+ctOsqZavpzIIIgeAd3SmSY4iOdmzMuLGuMhqwLHIz8?=
 =?us-ascii?Q?F67qDTQJPl+adiSIAybDGolp1/xAVDOd8ScvWy0sG7NvB0MWNCns3pjZO05b?=
 =?us-ascii?Q?6uaFFk2xk9mFY46uRjpuix9QTYF93bK/rdQrkPL3VXJnGwd+28yCZWtgS1nH?=
 =?us-ascii?Q?eyYEjQUu+HEJUaLzZJm3Q/766dvpFEM9oFlWYJag74Xbu4Pw+BhgLyUygudr?=
 =?us-ascii?Q?fr9l75VyGXxvEAUNnCgYeGXEU1jQCsEkNW6tWmvl0THSISkUE20ZevNo7uEh?=
 =?us-ascii?Q?QJMzrn67QCpQuu4ohoFMZnu1qxx/qyQrbJjCxcR14NXRFwXLivcVIKMANfoR?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JsYVHub+O6DqTi/Lvk5tiiE4ubZd3/uSkny5PLwM8jl0BJDYgD7LvItVvg66lkMTQrYYf5s5r47R+fL0UQpWW6Hzl5tR764KidR91an/7sssrrZORskwkhdjaBKwpZe82r9lx1E4TbI3uQlOGiSU4raYG6kAhLRGzGN2W7VealDJkNTHqmo501E7lVm+yM6FWMvjZKUnnWOpQnmBXyjOJSFU7zFpVyqnePlKcWA2y0pJfNgPYNfcI8ZQSqxzq4CnnY8BDPv2CQlRUHEEoDOr2vyW0bTFpc5p3etioAjPikp9l2AQWL5b3xKbGLCCWSAstS8tlRY5QXsI0Fao3mbN5EmikvWr1dsc0/G3XdniSwHxrZMkecRPiTRrNhJJhWLRe/X8egnZBO/gEzFWfuYkxWc1jn5TDIL0iOs8pW5MQuMcxOZurTyGHLE+ul5C+fIfTWS83L38l/QtFer2Ft2sYaOIseIn7tSSmcx9r2k7S4wD3kSIB46S8uhc2xulSncpjTrvN8Is43+4g3NaJ2kLN+JNYYpgrScshxC9XO9vpSay9NbLXDAmPOAKXQfUp6NxUpmP7NTypJNeMQBzP4bbYQXqgPojEuEVbW9FK4DBLB0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495c5b34-5700-42ce-869f-08dda1e8fdd2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:20:22.0153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsoVktw2d2mmAzSKzdKuIMH6MCmq8Oa7fTGECD9EytJyG56Wgxu8Idv0hIxoBe6MR1ld6UmpflCfDjXAo5e0mR/Jq247edGI2Zsq+AfD6vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4769
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_06,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506020125
X-Proofpoint-GUID: fVB-UDYXDFJGZf9YVcD6mE268n1QxJ4_
X-Proofpoint-ORIG-GUID: fVB-UDYXDFJGZf9YVcD6mE268n1QxJ4_
X-Authority-Analysis: v=2.4 cv=ctObk04i c=1 sm=1 tr=0 ts=683dc13a b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=1XWaLZrsAAAA:8 a=AiHppB-aAAAA:8 a=GvQkQWPkAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=37rDS-QxAAAA:8
 a=eQKO4FnNY5kshQ2SyKgA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDEyNSBTYWx0ZWRfX5hRO9hz9pN8Y 5juYPvouhiv+zxiRebKHrdGWA5RZAky3WPWVvi7gFm7ISw4DRhUwSaOrthQmg1e6BsJGP+U0wzO nEVq08+RilpAKwEBAzJ3zRBYsoeVvNips7l6l+qyXAu7PSvR6wS03mHvWt9ZPMFgud1MAvoreJN
 Et6GRB0JxsqwFoQurwj5GfRkFmHnJPZzuK9ZzaXlIjfX+j/YnFlMm91EB0xDKdUHneFEeJd3DmC Zhx6vIkAKkZfiZKmAVGrEApv2/krp/IGzeaF+RnlKZBlRQJ2t/9a4umgV184Euf3vz4oiyGDM54 ULR1MTYn4qek6QpRMq71qK3YjTupyfeEdgZrH/mxXd33JI/cfcb0vwI4MPLYMP0fSqxt+5xqAhO
 gtiu6qYE2uQY51A/C0Vdhvs1NFAryn0SLUIE10zzra2qJDi6e5a6W/YDsfHUQV0/1jVD5N15

In furtherance of ongoing efforts to ensure people are aware of who
de-facto maintains/has an interest in specific parts of mm, as well trying
to avoid get_maintainers.pl listing only Andrew and the mailing list for
mm files - establish a swap memory management section and add relevant
maintainers/reviewers.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
REVIEWERS NOTE:

I have taken a look at recent work on the swap and chosen a list of people
who seem to be regular and recent contributors/reviewers.

Please let me know if I missed anybody, or if anybody doesn't wish to be
added here.

I also realise we have a bunch of non-swap stuff living in some of these
files - we will have to address this separately :)

Thanks!

 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e66460861bdf..3386272f6bf4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15674,6 +15674,25 @@ S:	Maintained
 F:	include/linux/secretmem.h
 F:	mm/secretmem.c

+MEMORY MANAGEMENT - SWAP
+M:	Andrew Morton <akpm@linux-foundation.org>
+R:	Yu Zhao <yuzhao@google.com>
+R:	Kemeng Shi <shikemeng@huaweicloud.com>
+R:	Kairui Song <kasong@tencent.com>
+R:	Nhat Pham <nphamcs@gmail.com>
+R:	Baoquan He <bhe@redhat.com>
+R:	Barry Song <baohua@kernel.org>
+R:	Chris Li <chrisl@kernel.org>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/swap.h
+F:	include/linux/swapfile.h
+F:	include/linux/swapops.h
+F:	mm/swap.c
+F:	mm/swap.h
+F:	mm/swap_state.c
+F:	mm/swapfile.c
+
 MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@redhat.com>
--
2.49.0
