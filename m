Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CA618641
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207392; cv=fail; b=LWSBWdYWatZHGpVY9gdmCuncqpFsARllYrDWmGJnMEgjm7ut0g1UBDXvpysLJ1hIG+DhCaXkA/nx5vHzq9ugQiT/iUmWZA4fefQUbX9Yw6njbmEj5G0MxEaUKG6dPNEFJzMh/BONgm4DTTKaRyZFBwYGEVhITOf0cOiRhwIwCUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207392; c=relaxed/simple;
	bh=E/RoQsjsYEfU4yair/UB3wCJP96Vxo08TlvxpCIO66Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jOiLPChPlAceUspbp/Iek+g+/7JRC9zd4U55uNXXzcDwRyyK6vni4mc/6mmqAWM4S00DRrSc6zU5lqzOMwr78n07CYSpIepwf1gGbujKsCzUj4ddAC4PgiBsp0h91bCNr0wE2Maa4Q49ZL8Z39rUT3XxvE4wi6/QIRPGoMqWM0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Mc66iQmz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RivRvI3W; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Mc66iQmz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RivRvI3W"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565NBZu011359;
	Fri, 6 Jun 2025 10:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qmsuIrP6RmfAvhFlnk
	T2Jxf53v/4ss/tcndX5+eerGw=; b=Mc66iQmzOUiFrIzBxQshFmknOhltCC3sMb
	dx1uUdfRl+A6jdaQGkT17F781NwZIXCUDbb8FEJYtQAlJA+wjPUDifykRoUBqhjW
	FgPDjFfzAYOZnVfNaIHj5iABvwiv0Kob1q96lYrBIyvjADubnU75f7z4wrCgHxmX
	F3FNNgYKDZJYvEf/rJUQt1x+NisP4Sm5Z4qf1p/KRcgNuzqShKXTtF6QcZSPlOd3
	iHmk4RagIzLkkdITWrgEEwpgnEh7EUOw8dE35bdQ9pLpzyXE11awLQfGweo9YWoJ
	nYrDRUjPQVGTHssa7qLUEzDDMBjwGNjOtK7yfGNti7vGaNep1WQw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gwhfmqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:56:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55691Xiu016444;
	Fri, 6 Jun 2025 10:56:10 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7d5p3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:56:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSpieTB15s60NYDtWQHPTjtRdndWjuSZkbH99l9fDDbVeNUtraKL6usrzzVc3mguagk5Z5kzxhG1v8aZ+U9A8sEva4A/Def2deHoClZyf53vQGhzA66pSpsJy25qUMMbvFblXHgP1Tq7UEK3GWPR+wHX8g8LdZdqIacVXn8Z1m+Anhfwlaqc+RXYsau0BKbD1rP+jKe2Wp2dKJhkgy8Z3fO9nAaD1+uj84Q3jYTGKsW/IFYmXuUGab6mqYWHGWlKF91B4df8x8MYWqSjiaVAKzg1oF/pDNlUqsDbU+1hXli++FPYc5xCMev11e+9fbSYVmcR0dkYi1tMdsubXlhdCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmsuIrP6RmfAvhFlnkT2Jxf53v/4ss/tcndX5+eerGw=;
 b=pNpyKXXrS67V4bYJT9q0LhPaH/n8D6I7rM9HEfaBBUGcS0RmMcFjBxZBxF6BoR7eQE4fSoFjGG8I8v02fSNFkzwnE9ikA/CEmm73wakNs2QObOsdzcj2tI2OZb42HEQTr7jypyUW8KOwnOs4vUf5EnN9G+EiOhxV4yl3+uXU8M3n8kih+g6SYxsSyCJUe6A/TJfMOR1hAhaMua31gAvtk+j3friaFtNWKQGLNt8Mgn3uDh2Qdua/2y5+35ItoNS+HgZLxAqBOLW4+wF4pvfgvqZxXOpCEL9zSFfNOvQzO2aT/RUqlFXxhylFEVetezKZUp1aGPuWjLu5uEI60DkbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmsuIrP6RmfAvhFlnkT2Jxf53v/4ss/tcndX5+eerGw=;
 b=RivRvI3WKBcTi9RSXUU/oeyzahf5BQV+uRH/Aumidc9IwSBGkxNoHD1UEcXyjXSGowBwEJ1ALEjb8vP9WgBssdk3YeHwe61WiCpC80GKhYcdWLmTggbZnMw4rWOi7MFOP1GqKL/KpwKmjp6pPqP03VFaPaW+XyAExevPq7CIZ5o=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB8095.namprd10.prod.outlook.com (2603:10b6:208:4ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 10:56:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 10:56:07 +0000
Date: Fri, 6 Jun 2025 11:56:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
        will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
Message-ID: <d2ace2dc-0d1e-491c-b574-b1fcc65f9a88@lucifer.local>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-3-dev.jain@arm.com>
 <f528506e-b04d-4c80-93c3-93ba4ca385bd@lucifer.local>
 <f6b203cc-de3e-45ac-b2e3-b2d9f8ae0c31@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6b203cc-de3e-45ac-b2e3-b2d9f8ae0c31@arm.com>
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b911bcf-12e3-42fc-15c3-08dda4e8bd74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zlF2TN/aF2nhWsuwETJiugLU/KYG9BCcBKUMtQTcUUqU7RUaeuPwANx3dYhi?=
 =?us-ascii?Q?B+NePvkGv1noe6ymQl0Amq8e+CT7RIw8FMhOyFnArqUEj9ETp1SdqMOeQ/eC?=
 =?us-ascii?Q?T9+siO+5/VINTC0Ea0IVrWG1YfzWWlSTAMjI+HUnmVOHGx6mge/RV6QQboPe?=
 =?us-ascii?Q?1CwhwHQiWjYH7zquw3TihBwwgNXHIgr3SRJdIsEPfOn5gDsJTeohPa0TAYcz?=
 =?us-ascii?Q?sZ9giSD3+zEUEPmiGsm2a1Bu8fyVJx74pwEedOrYAE/KRaIOsYKz/TCcLh38?=
 =?us-ascii?Q?MVnqLXozcdOxtuB/B8JBxN6No4mfBv0paXyoSvzK+ULPqSl07NFlzcZDb+G6?=
 =?us-ascii?Q?2KSfHp1jeP7RYzAy7rGTckXfZ9TbnXgP2BDxb46z+sI4tUiz4ljuT9RX6xav?=
 =?us-ascii?Q?/lF7z347cS/vNXO9njSEpZgwPZ313apSWETrO9BAr/7wtoe9a+L1CFQaBsX0?=
 =?us-ascii?Q?eslEl8at7RzOv9jrdbj9jAhLK19u3E2XAQ9fkL9wtmb+ORGPaA+OQElxsQr5?=
 =?us-ascii?Q?gM8RH6z3v3DK5jiJ9sutqE0KlxSaD0PZjMAfuu8lArmHZcjixfZswFmpVSJx?=
 =?us-ascii?Q?Brpg0NwyvNek9RfdsO4a2IM8G8ROOn839qIvEFnpcGLDktZS1EBLofI/KBr5?=
 =?us-ascii?Q?QcDZSqURl3QlOhU0ijBpr93Xynh1DPYJYul3+QDFCjyJCQgNVtC0E89JexwJ?=
 =?us-ascii?Q?o4FSFm5+ZP8QUIXh1dDtSHsf1bjPc9zuEYyvXqug5LLiIwQO3JgR4sLUfjPM?=
 =?us-ascii?Q?mnTWKAZNR6cnm+9MNl11QlbzNbEe+PNODlaJ43ZAaHWPLufW+39Fi4ToM7Ph?=
 =?us-ascii?Q?wF4eRgI4EvwdEILfHbpF1awIlZc7Xel5KOFzU/s3ZMIiARYMDgvMNUfPLhms?=
 =?us-ascii?Q?gmJlQMz4XD4MNB8jNwzR0Y3Y8FtvgQHe8BE+Q/lf/Ob3wvJiPf4HW4QK/ePu?=
 =?us-ascii?Q?D7gybrSiCEZVm+3Y8q9TZLy7mWbt1XR+oQpQq7+kPiNgLYfhJHi+y70tpqf6?=
 =?us-ascii?Q?wJYt+D/m25AMo74/2Gvtv7T49ZrfzE7dCI/EPg7NGHcEkOFiCl6ygujr78sA?=
 =?us-ascii?Q?cTOKinmPQerowepz862nnPhqmZc85+CRPYewzrdrv657okkL+NyUR1fxBB/y?=
 =?us-ascii?Q?vA4R6eBlX49wF0oGGRkscsVyRakEjhN1NrdlyX6bQ5vnDSNJs2MYflNNopg4?=
 =?us-ascii?Q?aiCyFuX4n9kqDf3q1E/igPTBHeRmqsyHYFFDzYfDTddpX5IABDw02jqcII/A?=
 =?us-ascii?Q?8H7oDX1ntST/KxPUXGO1yV95qtIL7wGGFjEB0QT+YaXt4TQ8ihJoveKxL0OO?=
 =?us-ascii?Q?0CXrrcpcSj02jIuTIvt4y7i8ncCqiLjdjqG/FIzWwB73Tv6S5nHTrn7Euqau?=
 =?us-ascii?Q?uNrYaVT4hDk1ezZ0NnZFTMQktlxkmdkySmcz/Z524q8MkAeMwWXf8qaEjF/F?=
 =?us-ascii?Q?CZbKgY3zD0c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6IU4+pYjxf4Zup12sadC/3jLrv2ecLf4kvybGbYiHICUVjdv3X2xAXo0yGuP?=
 =?us-ascii?Q?wnZRTyU5L4/yC6xf3/aBNHlRIRALE0oVac1gowC9Igienb8jycwhocpl2oqO?=
 =?us-ascii?Q?qJkmiCf29J+vqzqjI773YquXxF2qnekV8YwufdzjkwIpqW53YrBn/phpgazW?=
 =?us-ascii?Q?yD4N6TsQr4XiLPH8uPD8DmC9wUVm38T92YQ8oDhLjacnmIxYvji70aqPbzyr?=
 =?us-ascii?Q?efwlLwv7m1dkIe74Wa1On9DRK/ME/r4Sb5K0izTkPL76BGgZC06bt6iuI8J0?=
 =?us-ascii?Q?0mG55TXOCkKCdiImpBw23xBv6jFkebsjO1BCi1aPawfsnJUQ9NTqgtAMtFIX?=
 =?us-ascii?Q?ZApIzTRbMJ3OoK0KbhQDqLRxSucX91ma7x+Dxa+H4tQa/bT1p4noSeUmTV9A?=
 =?us-ascii?Q?fTnYzfoNSS6lPZWt2gqSgYJQmnlA9qlbfgJ1lIqMtKHFFkGFen4yTOtIebDd?=
 =?us-ascii?Q?voDAqZlgG4UaL6GomfplHhm1+jOx3DAt5nopWnlwEAbI1vzCf0vO/V/0/yTS?=
 =?us-ascii?Q?njZFQ+5gpZx4CLYRCcL22j+rGKVZHbREQJUJEiql/DbyarwedbWFoga94kX8?=
 =?us-ascii?Q?14CXCxHZCGbhtGjJkoFLUvThOqeE9P/kOheTDFnMOrQAIriyZY4WgDjNcn5A?=
 =?us-ascii?Q?n9j7m0kAdF1IjSHca3rxAm/zWIi1fCDeyEIHW0uyyEO1DKFJJL0gkLFnJslr?=
 =?us-ascii?Q?fz5N70NqnSDpqkVpigYeXeg+R2UeSwM3hRh4u9gTZuvRRhUe12jn6ninUwJe?=
 =?us-ascii?Q?qJb/aaZ8yOotu2F10wEa8Lo8a4FwgYjADDAtxA37QXgDd4//Hh8Zf9/feWAU?=
 =?us-ascii?Q?SaUF6w36G5B1IjICd3IgqmLaMDm250a1kv0th6LOUMctf7UyrKArAQHNiPE+?=
 =?us-ascii?Q?hILRvPSQUWrp5ruqwMO2fFVg1ngycvLxC+Zo6dPZBl6NHtUNQixewPygbVjr?=
 =?us-ascii?Q?ysYeBEaZy4KbO02yy2yxLc1Mzf+Y+HTQ6GJzoZJMO8XkCKOjvEu9yl2f10WZ?=
 =?us-ascii?Q?X/13Pw7s4LbJZWYpqTDGGdJ9uCo7+xvOyfzDUwm0UAPN34hw/cZo2HiT/UXb?=
 =?us-ascii?Q?4OEtjyVV4reUIGxQS4zOxuLzeHaMvu23FzHIGdSaw5QCxPhIOmsqiltca4Zj?=
 =?us-ascii?Q?6+YtZnOe7gGvNTu9n56cM3Pnlhi9qD5TWZMeoCbCwHoRAAksz9LOcRhIic5O?=
 =?us-ascii?Q?H0ahB9EJu46R5g7RXtMcvtnKwrk1cd6c3L4VaF7r/ohqilE2NiZbBfu94Uux?=
 =?us-ascii?Q?/3ENw79bpCj5ZEiEEYHAvsqmnTs5oVklyjxwPPPysEXegdAQJUT1MTG5I+2W?=
 =?us-ascii?Q?4t9GYJ3ihcfJCWj8fpJhCt0s5LMDEzXzON+UIdsMDl6TwxSI+QCo60vcglXv?=
 =?us-ascii?Q?XBCmPKO0rw3BqRmRPNwTgoGgOSdc9PEzl63RKbC4ubg5JrJVDTZ+9z2HwvKF?=
 =?us-ascii?Q?Fm+OJRoHpnwXsPiLdH8ChEzDuBElRUZR0uAHOVpoAu0lvW642KUc0zUj9dcY?=
 =?us-ascii?Q?CRqORzclyAyyrZ19e8bQXesGyZBqRVtXc+W/J3fsoZ8MLnP7uhqksH9IHKBz?=
 =?us-ascii?Q?02+M0bgVK1x/6rGZmBMrzgnYKjYkV6XVi31xFOYXeQbh0tM7fwmgm8N2KXjd?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2eVDOwMxJGo9fS6BrFoR2+g6J7mxE3gDVh8RfTo9yW/gMKOANu8PDR37U1Q74UzZkAJb14jY3+ZZCkfizi9AbAVXMtXlMMs09r9gEJqgaJJnX+lUgnEpyRUxhMGlRI8yTCXNv8RQWscKCzBX7YnHqU+cONN4gRvHnkqdb4hoqU6lfg3q+gOwXpxqQ2aaeppGlAQQVNNhn3Cra6jwdx5oQ+yTeWkP0x7FMxs8kVI5flJLwnpCRb87gHy/XwCgcmgCNMt0BQy071v0LTx3/ufvppBK0jTsVKqnDUF6FLxeLFBU2bYwh04WkLsfgBGByNDWIFmvlqMOxjZs7RdLC73Yi9UfhraQ+mLnGe22a+0pW/9jZI8w7Ql/Hz9ZPOLl93jBPnmTs8PuZfCt2TUW8SxBii/JRoXl4LYLp6/9N+jo4wPwZXE4HVCOI7QD174xQV0QKoHaXD6tdyJE0oXb8bCm9UBG8WWHBL2V9wilbEYD0EG81llrTR1bh1uXauO6F7Rdhr9M2afh/tu8OuRq/h8DkYoTYp24KYQqOZ8C8yM+HJ8H/Zex1Uw4iYNVOEJBl1inIzkvN0gxOGR++4LbqpUgEB1xDQWw24IAK89o9R11bZ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b911bcf-12e3-42fc-15c3-08dda4e8bd74
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:56:07.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHVUyRH+08oDKKWlIkmNYd6PSSBLKy4khNP042R5PDTy6Fv/nytUhS8lkLZMD/6LIrVtJUmPosz8v4QOiC7XY/hnhYcIDwUWLq6av7lcPLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060098
X-Authority-Analysis: v=2.4 cv=Wu0rMcfv c=1 sm=1 tr=0 ts=6842c94a cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=FvvDUNBv4RxSsuqumHYA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: oHSTE-6UlscSrLX3MRrVi5JVI-SK_vR2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5OCBTYWx0ZWRfX0RsaX8qup/MU bNguavw/QvU0Gmusp0XSo0s5dqpT9d+CTIaqGS+W3f9m0mYSEkCmwTkrz99MBQkN8kw25Xxx7iw 0qddmBNn9hOLeBAcbZ2ROaSK281fMDaRkkNf6W/aA4nCi3AiBM8yuarUYkkhzbyxprvYwLzu0/3
 8M3t2FMvCwyu6ZCUCtEi489dYw8X/nTq04R8rM+cKmtYTWyC8AcQytaP8OOZqltfYQp/ZISIuzg Z/DSWMh3uMLjlx9T5FLGt6osaSptsl/wtoV5u+zBmeuX4z2Kkwg87KCafngGms2l+/GoLlJVrmv DsxqqaSYJRyIUIv9Km4TIxCnerP/FgUy6L9nRhPrxNnm5cfO1aICExIGSlG0Tuk1Q8n5hbWlxNy
 Gu4nKo8360GIFcJQTdAL3FCgqszSjEyXoL2t/XYnHzK3EVwMI/cTleOXm+P+cn7dJ+qTTDKn
X-Proofpoint-ORIG-GUID: oHSTE-6UlscSrLX3MRrVi5JVI-SK_vR2

On Fri, Jun 06, 2025 at 04:09:51PM +0530, Dev Jain wrote:
>
> On 06/06/25 3:19 pm, Lorenzo Stoakes wrote:
> > On Fri, May 30, 2025 at 02:34:06PM +0530, Dev Jain wrote:
> > > Move away from apply_to_page_range(), which does not honour leaf mappings,
> > > to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
> > > if a partial range is detected.
> > Hm a follow up question here - why not just improve apply_to_page_range() to
> > honour leaf mappings?
> >
> > What does honouring leaf mappings actually mean? You mean handling huge pages?
>
> Sorry, I always confuse between block, page and leaf mappings :) I mean to say
> block mappings, yes, huge pages.

Sometimes I think we like to give different names to things just to make life
confusing ;)

>
> >
> > Would it be all that difficult to implement?
>
> That is how I did it initially. But I think we get into the same problem
> which you are describing w.r.t extending walk_page_range_novma - currently we
> return EINVAL in case we encounter a block mapping in apply_to_page_range,
> basically asserting that the callers always operate on page mappings. Removing this
> assertion and generalizing apply_to_page_range kind of sounds the same as
> removing the locking assertion and generalizing walk_page_range_novma...

(Again keep in mind walk_page_range_novma no longer exists :)

Yeah it's problematic I guess in that you have a pte_fn_t and would have to get
into gross stuff like pretending a PMD entry is a PTE entry etc.

Ugh god why do we do this to ourselves.

>
> >
> > It seems like you're pushing a bunch of the 'applying' logic over from there to
> > a walker that isn't maybe best suited to it and having to introduce an iffy new
> > form of locking...
>
> IMHO I think it is the reverse. Commit aee16b3cee2746880e40945a9b5bff4f309cfbc4
> introduces apply_to_page_range, and commit e6473092bd9116583ce9ab8cf1b6570e1aa6fc83
> introduces pagewalk. The commit messages say that the former is meant to be used
> on page mappings, while the latter is generic. The latter implies that the former
> was actually never meant to exist...

What a mess.

Maybe the least-worst solution is to just add a new
walk_kernel_page_table_range_unlocked() function without an assert and in the
comment heavily underline that _you must have made sure this is safe_.

This needs revisting in general, I find the use of init_mm.mmap_lock pretty
gross.

>
> >
> > Can we go vice-versa? :)
> >
> > Also obviously walk_page_range_novma() doesn't exist any more :P
> > walk_kernel_page_table_range() is the preferred solution.
> >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   arch/arm64/mm/pageattr.c | 69 +++++++++++++++++++++++++++++++++++++---
> > >   1 file changed, 64 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > > index 39fd1f7ff02a..a5c829c64969 100644
> > > --- a/arch/arm64/mm/pageattr.c
> > > +++ b/arch/arm64/mm/pageattr.c
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/mem_encrypt.h>
> > >   #include <linux/sched.h>
> > >   #include <linux/vmalloc.h>
> > > +#include <linux/pagewalk.h>
> > >
> > >   #include <asm/cacheflush.h>
> > >   #include <asm/pgtable-prot.h>
> > > @@ -20,6 +21,67 @@ struct page_change_data {
> > >   	pgprot_t clear_mask;
> > >   };
> > >
> > > +static pteval_t set_pageattr_masks(unsigned long val, struct mm_walk *walk)
> > > +{
> > > +	struct page_change_data *masks = walk->private;
> > > +	unsigned long new_val = val;
> > > +
> > > +	new_val &= ~(pgprot_val(masks->clear_mask));
> > > +	new_val |= (pgprot_val(masks->set_mask));
> > > +
> > > +	return new_val;
> > > +}
> > > +
> > > +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
> > > +			      unsigned long next, struct mm_walk *walk)
> > > +{
> > > +	pud_t val = pudp_get(pud);
> > > +
> > > +	if (pud_leaf(val)) {
> > > +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
> > > +			return -EINVAL;
> > > +		val = __pud(set_pageattr_masks(pud_val(val), walk));
> > > +		set_pud(pud, val);
> > > +		walk->action = ACTION_CONTINUE;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
> > > +			      unsigned long next, struct mm_walk *walk)
> > > +{
> > > +	pmd_t val = pmdp_get(pmd);
> > > +
> > > +	if (pmd_leaf(val)) {
> > > +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
> > > +			return -EINVAL;
> > > +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
> > > +		set_pmd(pmd, val);
> > > +		walk->action = ACTION_CONTINUE;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
> > > +			      unsigned long next, struct mm_walk *walk)
> > > +{
> > > +	pte_t val = ptep_get(pte);
> > > +
> > > +	val = __pte(set_pageattr_masks(pte_val(val), walk));
> > > +	set_pte(pte, val);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct mm_walk_ops pageattr_ops = {
> > > +	.pud_entry	= pageattr_pud_entry,
> > > +	.pmd_entry	= pageattr_pmd_entry,
> > > +	.pte_entry	= pageattr_pte_entry,
> > > +	.walk_lock	= PGWALK_NOLOCK,
> > > +};
> > > +
> > >   bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
> > >
> > >   bool can_set_direct_map(void)
> > > @@ -49,9 +111,6 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
> > >   	return 0;
> > >   }
> > >
> > > -/*
> > > - * This function assumes that the range is mapped with PAGE_SIZE pages.
> > > - */
> > >   static int __change_memory_common(unsigned long start, unsigned long size,
> > >   				pgprot_t set_mask, pgprot_t clear_mask)
> > >   {
> > > @@ -61,8 +120,8 @@ static int __change_memory_common(unsigned long start, unsigned long size,
> > >   	data.set_mask = set_mask;
> > >   	data.clear_mask = clear_mask;
> > >
> > > -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
> > > -					&data);
> > > +	ret = walk_page_range_novma(&init_mm, start, start + size,
> > > +				    &pageattr_ops, NULL, &data);
> > >
> > >   	/*
> > >   	 * If the memory is being made valid without changing any other bits
> > > --
> > > 2.30.2
> > >
