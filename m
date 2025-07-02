Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857F72D781B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470690; cv=fail; b=fIBuBnk3l1YXqsezjR/3f5zmtByjj+Y1E4TAPGcBJt1CiHOISgf79h60mepjgLb+D9a40KIArWT6Hs+4or0Ox3V0n9ELaVDG/V7QEzuaNPyx3T4JBE2UIEi2c40bNr3ZtpZ6JfIsBNEayruX23+meebJPdbmc1G1ysdF4KBZwuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470690; c=relaxed/simple;
	bh=jgsMq9FcwGjzjHMghV87sIMEQ9CXB1W77uYN2yRwxq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L571GHhKuUaN79wM9Sr128MP1Z93t5jFrBi2h+wk1s8yHzntDyDruOCZW/eJxD0TpbZ9LJvejXUbLyMUJ+1WQD8K4ZbO8YCx+Tq2O0dQZp+yRL0uBQfcmhJ/opT+AMmQSPzFWLZJezuRCwvNlBYUhX1phDR2RIvHbUt37rWOoNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R6Os1Rym; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bbsqPxgB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R6Os1Rym";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bbsqPxgB"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Bj2LP021110;
	Wed, 2 Jul 2025 15:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HkyTnTEk2Y9tBxOZAu
	yqqd/FcUPpSYn1tFlbdxck5l4=; b=R6Os1Rym7jChoIIeh93+JbPJ3kAG/lwGmF
	pz/oqN0hijUH8jn6AKErfGP+HnKSTj4qCT5oRwZBfd13nsH+3+LJOimtGsDxZ0TI
	ckDKbLCRma9rvCA9q3cdleN38U4gHjWtO3+NNnpXWqcsmWJMI+gIlONxBNyNQDd+
	KMzcRdJAPPh+t79ldw8MOSETMGVplJSZ/4lrHhy5XpwNtqxVzEOZIFFLh588hp3d
	EZTLoJqR7Ky+z3Y9B19guhD9g7u9770CvaPWDpGNJo3dSfRDodo7YE02wsziNGjq
	dMZtzQ0EemhhGFWoQ8xy3KuNaAVG9HOd1cSsPvEZ4WJZtFOC3VFA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7xg2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 15:37:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562EJplZ027522;
	Wed, 2 Jul 2025 15:37:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubc89p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 15:37:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXeDATeyHPiOmsh2NLtDpUDwKnZ4pDQR1554wqdfrzGw2x5VFueH5kU6Zk20abGPTpHBU/fsfzXRVU8HyxXISJv1Z8l6QS8MSEe4e5z+WgSng98XBZtogRuqzHEF68YaYY7i69W90kpBs2anKN0fjOltCUXp5P28faZZl3Wrq6+qtjG6CSFzl7A5FmN8nUWrMq0jN/KHg3CXIj3cVYuKE3qeaEeq8Vfgk7NT32r1BCceecURuAYX7yV/ZwT37au2tiFJq81e7mGC2zr6iG1jpKeGjvNAYZh1ux4q1jlmtA59JN/v3mFQahhW+4WOKqiL4jjmRU5x3LSBN0Z95icPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkyTnTEk2Y9tBxOZAuyqqd/FcUPpSYn1tFlbdxck5l4=;
 b=ScAL2aQuf8z++FJXkynkY9nWTAwjYaSy1H/txolBIm+wkoCuFkZt+wYsxMM74KqjO/tolXy91VZNU3kciwIZ62+Ve4ukc10RHFudWGPcTe6wrdsyJlrWxh77NZNkq7Eh3fFDUrw2NGrcCOh1/uulX792ocH3UNteGTaxOA95PqqrKj9PczN0GaxVgxE8555jRBBqToeejE8Mp7DelmjJaYMK50Tz8o3ET9pMF1zNqpwNJcWvXmBvdNL5RYYynXMCRKmt1na7dbU9vlYi//g0FVhIiJs+H7bVxz4eG/v7SSfmK2eDlR+g8AiIJYrOKPOf9tncDhl5+NfbEk4wdOvuLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkyTnTEk2Y9tBxOZAuyqqd/FcUPpSYn1tFlbdxck5l4=;
 b=bbsqPxgBqNdFfYSms2rKS7EKlDyO6gMqfhSczd/F9zDlZUH89Rxb6jpEgJPv/AQ5OWfEU5g/uVCiTvZJcWn6zPeMaZ1NhQoXOzjDp/1v50Id+YlC44EJZusJEniIzs3S+ZdRbprj553CxYFiCoRaZLfL8yBMWr9x6L/XJd7Wsqw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6986.namprd10.prod.outlook.com (2603:10b6:510:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Wed, 2 Jul
 2025 15:37:21 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 15:37:21 +0000
Date: Wed, 2 Jul 2025 16:37:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
Message-ID: <131cffc9-3d37-4433-9e99-c376c169ecb3@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
 <f7f12499-7b73-4209-a92e-91e04ffb0fdb@lucifer.local>
 <b5b5d823-068f-45d0-90ef-4fa804a84bdd@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5b5d823-068f-45d0-90ef-4fa804a84bdd@arm.com>
X-ClientProxiedBy: LO4P123CA0477.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 616bf839-2b32-427d-63da-08ddb97e560a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M1Q4t+FuR622pzpyX6jlVsfTwELs3/wrqY1mmUNnTBgHeCWUcWWYuTNhrdiH?=
 =?us-ascii?Q?ARNStvW9VVpBW/iOJUiSR2QBtyLrPSoMBEZI11Z4eYB7iLJ5+UCTcSmpuRFS?=
 =?us-ascii?Q?+XW/4c/MnCrKBo8EZ73Z6HUkpEezzmEroFlb7xFaq7gI7wbbjGjD5NpPITn+?=
 =?us-ascii?Q?tMRJ344eYS+E9QR9lOfn97BV4kB3GmBMyqtcoq9q9pIRFsOVeduV0K9t3Mfy?=
 =?us-ascii?Q?fZJ3Glilq2LQyW9d+/v58NwsqAk74zMqIaDoWBkMotPBcP7iPw0dmNB/AVFh?=
 =?us-ascii?Q?YqOUA3ywTe5+Frj9h6dpn98Y999hvpEeefKXkv3emdRYPdJu7X2eyK8arX08?=
 =?us-ascii?Q?+Lc5dFVqLjYXs6NUY62MRqfnAPRU109iYe8VEXeHWbHojWNbW0qFzU+uN1Rc?=
 =?us-ascii?Q?Ipi/gCgv2IuegGxnkmkxWXXJWCGZCiIWWPdrFpNmidNt9RGMjGGbGDbZWkdI?=
 =?us-ascii?Q?PYJqua24y7YL9nSI/riL+irUNpB1p2jakxPPq1AV0N5DpbJlKpEoNlkIMls4?=
 =?us-ascii?Q?kHo769DMS1qx55LI4wiPK99PDrtpqA2gQAugRk87Z/ReMafBvDy4L9JRyc2P?=
 =?us-ascii?Q?iaLKR0VUAGvUd+II4fTQUXZWDfImVQ18R5QxHj1LK1UL601sDDCWxvil7Gmw?=
 =?us-ascii?Q?ozSoQcYC4mGOi4JUwUi0Z4zP/DEt8z13A0SsNXhGC6Ae+gjxq5H8CaPdIxPq?=
 =?us-ascii?Q?2KEUzTk0BG1Nmw+6U1hC+4geYrAyWX4ymbq/X0XUxQPppOZGjDP/hErarejP?=
 =?us-ascii?Q?3d9VdupyN61J5DlDoB80fvURH1vVLwTPVtn7cu7gdu7lNCa5tepu3HeHT13K?=
 =?us-ascii?Q?IohcJ3kgerjq4UeNfB8au96yKEJKGgRrvTMoETEz+ovlQZH+GPkRFz/F32gf?=
 =?us-ascii?Q?K1ZxKAvLtJH6j3XUIZ9Olg9Knp/TEhgRex1ueiGw5OgvF3KmZRnE9wZXJlnp?=
 =?us-ascii?Q?hjEHdeZ+OOGXSje4LeSclEQsLOVs7tVGCeuyhWLEU51rTZvv5m2nPpnZ1jW5?=
 =?us-ascii?Q?HqEr7+P4gGzMD0ZNDMYeZMbC4daskUUVS9NoFwYwFoTxgCjrmfX6Sxkg3Hep?=
 =?us-ascii?Q?3gry0oVLVWsQJj7KRrz1wij4M4iUHoU9pOO1DdSmIW6ou927r3P4xdUFDDZ8?=
 =?us-ascii?Q?ePwWvas5rGVqBEMgjzHJSJ7F2jdQbNPDfo3qMV9yX2pqlv+X/sT5qEss12uj?=
 =?us-ascii?Q?RhjVNTkaSvIxAonE+26/64XZQcC+jK0KcFzCh3Z6+iRmuAJ6kR90yJSBHIWK?=
 =?us-ascii?Q?Fuath4o/xLw80XfElptJeEetiBe98Kso6ZEqubnD2J3pOxvkMY2cfAz17vG4?=
 =?us-ascii?Q?1ymY1q4NvcDhRnKkG2F8Bq+xRRJ4irDcjqxCCTXY7AzSDycoVJWLsszg/Wwg?=
 =?us-ascii?Q?E91Kqqk1d/ds1gzwgxVGk1kNbcCpfLreltb//i+zCOqJsMav6sKCv883FQig?=
 =?us-ascii?Q?l1PDOL0HsnE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aThp6zjpk5x86as/53AkplYjchiJUOnj6LER8VAXF51Q4w0evbVhLA9rOvk7?=
 =?us-ascii?Q?MIs+47I2t6drY5vH7jj7idO0gmzNvbPfP9R+lpZBRkK8fOqggnTz837NX7k8?=
 =?us-ascii?Q?ICNLFGOMsijK7H6UQb9XckcXRFI1DY36ABYZOGKHk+J0GqFkO7qH/+E5HVGd?=
 =?us-ascii?Q?rtBwcKBQPAdV7EahGzxRa72xPL8K2ToQdtTcZeIyHPTRRtd+5ketES3ar40l?=
 =?us-ascii?Q?fQtTVBmG7RmcGWBbQpMwJG6W9OMyQOydAglZLnBVUqm+yOzd2/wnYgEFpfXH?=
 =?us-ascii?Q?4HA8FrZ8FXq0lGmHuPwjwIMb3IBJPeXI7Qk8bkK2SmjTGl38qUOI+17qZtH3?=
 =?us-ascii?Q?QHTEu/1wBgqWnCkfqJTuaHJsddSl9v9fkhonFK0s3mZ6MwhTr46SnmQ77ta1?=
 =?us-ascii?Q?njShphx6ud4IdQ6b4w5Oz32QKlmSY5PzJlsOIwYl4t4g8tfv9BJcgHimgpiO?=
 =?us-ascii?Q?wZQaK2x2MLPDUlnrhHjaxeosJ8E04aKWzfk139NmkiFg98XyfxSwZabeS9tK?=
 =?us-ascii?Q?aEuAt4tIWLJpTJnqR4YlEoIbccV5cDkz/VKJn+d9tpUmnBJRxuMAWCToaanj?=
 =?us-ascii?Q?J050DpzzG33WYwt3n7HQuYbdT20x2o9LW5mPwkoP0KHu+auqVI6+jDr0/8kf?=
 =?us-ascii?Q?bcH/qJma0ASrPMOtOWf5b3bbVOEvWDeOQI7Ylzr9QAE/YUHt5cnf77NWlPBf?=
 =?us-ascii?Q?5qnTk1hDfWq9UEioGojbwSYLCEpafTeF7jzHf0wDmNz/Baw5oxjTZisy3PNj?=
 =?us-ascii?Q?lps568lW/LSP5DE7n1SYzR6Q9wgvwgbAzcDI23uks4MaG77kLuVG4mre9Sg9?=
 =?us-ascii?Q?vjrKALO8psoLDj6X3jGNs2/X/6ihWnbaH/Jf6oSNobeYH06KQuKQI5vwMGby?=
 =?us-ascii?Q?+OK+l5UpvP5xH8fZs0KtbmNW/Vr50tFrja1bfK3yum3S5vJ+hq6Iv1tu+y/p?=
 =?us-ascii?Q?gj0mIxwru7U0FJHoA0Dg1xxZUZmSQ33syK1aSXCMnBy96UlOXE/OdjIrF6TG?=
 =?us-ascii?Q?O2/mnQPV5tWkJzm+UjfToCkg01nZCx+9GrMsWrBqLDAH9YuIRpbj8zwNtZSj?=
 =?us-ascii?Q?Sw2dy8J31eVbVWcbw5VETXN77W3LNIKgrECCcdNcoakAgPPiY8BZtWyERJFH?=
 =?us-ascii?Q?zNHgzDcO7KZuvq65XzuenVW/gqWTAwYQd/YwpMlUs3jrUdDAmLtxjpwKZM9P?=
 =?us-ascii?Q?vlM3xnB9RMhbO2HEcxjtjSAb0cDwVVrX2kkeiJDfWieTkIEulftislyw4Qh/?=
 =?us-ascii?Q?kbkZ3bJFbgfw1jOoxfUFOqfTSaWflzhyJhlbFFDehgBcvz6h4Zpxt6T5Sh/2?=
 =?us-ascii?Q?emX/LfqzsABLRSpB6jcjPpvOGoqcN4H6gMhWDw7NN3djpwnbNGikV49qIC9d?=
 =?us-ascii?Q?/9YN4xIV3MQiEQ3nSerwn6zjOYR9STAjMx2S29c7buIMghsN4uqj7Jk21iaA?=
 =?us-ascii?Q?ay+PpwLwWB75g3ywIu4VlgYeBsgnvKeq3yUpSElZYphhMy49BIiQpls69II8?=
 =?us-ascii?Q?ojGvab0eHnyO+RTvHY1pG8qJsXqy+t3ti2yt30xPE8t5hngHIJi9Sil0Gopd?=
 =?us-ascii?Q?odMuhHMnq53Mw19MudTCgLRPbGTN46O9CLoiyy98oQzfoLC9DzyuGAag191k?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8M/GGSwsJguMyPuQJK+ooVb9rQwBoeRtMISTQmMiUakEg4S28wMb5/xOEruemS2FoLjmRFVJNPby7qU8g1PijrD9a3/tiGp7tH0BSkKm/BSTdfSKHnM3QXYpEHR79YmUzFJ3rad6D5eSUxEERcrtJ9R8t+JwgOFQ5oXWPA/XIvdtlDWA+FEhfgZTbH2Gkm4Zi7cJREvC3QOqzsnl6Zc0hoJyEGKptRxp2Tm3RgJ8UZ2WLa67Kuv81EGsl6usahlUmp+HeXR/kwMkK7VqCzC5ulitC2Kh7KrhI31/acrPADHuDjW5CcRYiqHELDBewP01OgQzi7S+4Thahp20dWURfMGB6GQlJBr8V1wVkpXzJS50cpdC1lnf3Z+e96YdKmetHFBhruNoxobJy9HxG6DffZp4LznptnO4ogBgCk/GL3SUK2HzrpLurgyYzSDAIZHbAE//uZYEWicSKstmZXsguC90t+ejDwYkYvdibkXiDGhv5WyA7KuSkUyDw3J74uGV+pLrYeYJ3TEm2aHAlaoWIKlKi0I2kvxoLqc4a+iA17VYywCTkH6JqsRwKKteeXioeCw+s22SN/kAy6YBfynwF2VI1KW5WTh7Eq95d3nXvlc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 616bf839-2b32-427d-63da-08ddb97e560a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:37:21.7817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qqha0spOrSN53sHeHgrGgPyV/+3mDZxkT7ESm8Lsmmx7f0P08jLo57xr6ImO3SV6XW7pB1x1tS2CaGhbW++7x0iJ94bA2k29S60E+1vxCjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507020128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNyBTYWx0ZWRfX1I+UuS/07Okz uZhIWEa+Dk2VNGjCI2o0Hx6NKK+5xfflO0oNY3saQPrMFkJSMNkf2pikixR2EHuCdvesagLPOY5 Wwxf2Kh8wiIeGd6Mwb8fhECaVvWtR+JSK3plEjUKJ2i171RqteIFDNCEMKLgQAvtV9sEzGrhzdv
 w/2sz61p9jVEtoS1XVuM4uRRyyPM4qPPbfK2sYnjQsQm3n2h21FodB/A+TItezSbgP2fInTWOfW Y54A0NlGuFFpE0iLV1K2fVh7HUUz7B5VRmTzdixvR4wNhrWhDaCgySsycfl3z/2nVo5M07igxrD b/wExaJQu2ZJ0fjL3C8Bu+TUuRmr0ww+6IV8n1iMkVMA7XDtlU7jWwjpOifOaPNIpA/7ZWU8HUu
 lZHu7Ey5Wb+gMvymlNHZlYIJ7/03czsqf2P8jwLSB3O3twxf2Zgzlk83W9qOjAjVDIAPXaAy
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=68655237 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=7CQSdrXTAAAA:8 a=-j0tLA4OCMI7MlnWtBAA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: KjKnkiJsQ2XJoYpZAMqik24IxCIKdecB
X-Proofpoint-GUID: KjKnkiJsQ2XJoYpZAMqik24IxCIKdecB

On Wed, Jul 02, 2025 at 08:31:33PM +0530, Dev Jain wrote:
>
> On 02/07/25 3:07 pm, Lorenzo Stoakes wrote:
> > On Sat, Jun 28, 2025 at 05:04:32PM +0530, Dev Jain wrote:
> > > In case of prot_numa, there are various cases in which we can skip to the
> > > next iteration. Since the skip condition is based on the folio and not
> > > the PTEs, we can skip a PTE batch. Additionally refactor all of this
> > > into a new function to clean up the existing code.
> > >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   mm/mprotect.c | 134 ++++++++++++++++++++++++++++++++------------------
> > >   1 file changed, 87 insertions(+), 47 deletions(-)
> > >
> > > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > > index 88709c01177b..af10a7fbe6b8 100644
> > > --- a/mm/mprotect.c
> > > +++ b/mm/mprotect.c
> > > @@ -83,6 +83,83 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> > >   	return pte_dirty(pte);
> > >   }
> > >
> > > +static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
> > > +		pte_t *ptep, pte_t pte, int max_nr_ptes)
> > > +{
> > > +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> > > +
> > > +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
> > > +		return 1;
> > > +
> > > +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
> > > +			       NULL, NULL, NULL);
> > > +}
> > > +
> > > +static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma,
> > > +		unsigned long addr, pte_t oldpte, pte_t *pte, int target_node,
> > > +		int max_nr_ptes)
> > > +{
> > While it's nice to separate this out, it's not so nice to pass folio as a
> > pointer to a pointer like this and maybe or maybe not set it.
> >
> > Just get the folio before you call this... you'll need it either way.
>
> I did that on David's suggestion:
>
> https://lore.kernel.org/all/8c389ee5-f7a4-44f6-a0d6-cc01c3da4d91@redhat.com/
>
> We were trying to reuse the folio if available from prot_numa_skip_ptes,
> to avoid using vm_normal_folio() again. Not sure if avoiding vm_normal_folio
> is worth the complexity.

Well, do you need to? You're doing vm_normal_folio() in both cases, why not just
put the vm_normal_folio() lookup in change_pte_range() before invoking this
function, then reuse the folio in the loop?

Oh right, I guess David was concerned about not needing to look it up in the
pte_protnone(oldpte) case?

I'm not sure that's worth it honestly. If we do _really_ want to do this, then
at least put the param last
