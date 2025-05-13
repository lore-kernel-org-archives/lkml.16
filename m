Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AA2BE0ED
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151745; cv=fail; b=Mz/s/tVg33rjuLEhInuQcxgJAt0MJSSs5rM6T+/EE0lBDlF67zw3dmPW4kHkNx6+qQPyV6ztYwVVB4YztjEkCMw5geJHMwXnEs/KnGyHFRSUvIhv4BXyXD0FqMx1+nHqoEgsHdyrbMgoOZEzg9ERLRZtRWzDCq9/NsM9zYtW3YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151745; c=relaxed/simple;
	bh=e6h97W5yGBBEvFqjfvEu7z1+QkszXdLxnw1J5Dmpwho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V/HpoyhrXRYWy+7PLKsCFKop8VN0xzqriu9kaboCZcVxlySsxKbS4TmtzC+3CwfL5a183OBQWU+9jvqlGQ2wxYxedT7Wgg1W215aWqPRuKWDKyct8hgvGPDC+gKNSSPFntdscXJCVuUhTjnEStv8MdDtViELV45+E3VWdG8IJTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qfp23D/M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZtrjA/N6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qfp23D/M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZtrjA/N6"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHK27030357;
	Tue, 13 May 2025 15:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VrXGsCuEd8Xc15wAUV
	4DQIyxpdIRuUhOqr+Y1PbLkIE=; b=qfp23D/MqoAvbwuPVopIPe4jZdGpDjFXC2
	VN/3oDTKSelTr9nCW1m1or5DgYwVQ6L4PdPq8e5EcZiHY4BOY+bRwN9krFoh7pz/
	xCCStS8c3JSOYrUuz7PO7AAhUnT7HnyJjoaYs6M9yeh+bmWdAkX494N0/YEB3hng
	QrrgZxNzXg7B1NUVuWhH0K4Ux7EAHn/C3f93BdI8uUVSiNO2u+00ivPUsFlmuk+1
	Mjuya78Pub45lRy6intzav08SX1a/VGwgkd+Eg3OEBNWTe807tvQDmOd2nZ/GfgC
	RCiJdzkWig+UTPr5gy8LLx+U7ZE4lYTS6Gk0O15E6FCZFtpiYkQA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1d2d3gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 15:55:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DEweMh004517;
	Tue, 13 May 2025 15:55:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46m8an2src-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 15:55:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFvH/LzMOscfEl5OhAAnWY964ccfPPgGYGghtl2rjkC1NHI7LG6pOVmmIyChtEjXUg7yOhic8k1MmrsTOC/VOf+CvDO8l8KbBqX+QIBENKcN65uqvX75vuedMxP7/qHjIK9Q/O8j06joC36aVDG1s3wOeeLngt5BmSxaZzUj3Fs44cGG0Thly3UyKU067FcE9kI/Yf71Jq3n8Q8OmSaiUMm7WWp0XMS8Ewc+0/KfBmxErEY9ZHtwdpzbUXf0E9Rq0QjLpPMSa+DdWsx9Ck8ZDjefDn24GVU6mL45mWGdfnWoKgrNo56FlmJqxJx2RPPk49gNcgf/F416nSReb27odA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrXGsCuEd8Xc15wAUV4DQIyxpdIRuUhOqr+Y1PbLkIE=;
 b=szJTAnCzOcubsS60TPsW8xutft480iur0pQqQCaNlhYVz+01XOakmnzWTXtyI/+J/dpCGUzkwNSQta+8jTFTOKftajfo+Jnad8tF4CXqHJiTUgZWSvQq70V+ACwFns7wU/g7o4k2KqPZ87y4htw83pcesKIh3+w1cP7qDS0z3XYg/X6tlVCzG4xVS+EHYkjLXJfaaLo4oNioURjE55xoqftI264J1nP79XgqfD5uYdvzg9UA4al+8BRr1JPtfYE2WbR3GgqDEujTn6Zs8hPlaWmq5P6x+pYJN6+SVkDZgtJerRIuvek9oGRds8fCeYv3xZnT4J0q9X2xAjVWFVkzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrXGsCuEd8Xc15wAUV4DQIyxpdIRuUhOqr+Y1PbLkIE=;
 b=ZtrjA/N6S51ENCtZja1hJ/pzGQWSBaQXn7pQf1eGkkXtZw9wWJGmOaUeMq+i0zMfjdV+Ih+wO1PI3FPSLOCS0n4vW11tgD3ddLjBN+GUeUBlO2luB8XB/asnzREEmWMPoUpwxNmP664RiHvPedxqX5Z3AEL9V7ISKbCUWQUNtGc=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 15:55:19 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 15:55:18 +0000
Date: Tue, 13 May 2025 11:55:15 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
Message-ID: <m55uzgmytniwkxv6k22xyw6jrh4o4ya2mimsacnblvgi6d463b@r3vd54totw6s>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <kees@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250513145706.122101-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513145706.122101-1-lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::22) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH3PR10MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f2f152-6907-470f-9a8d-08dd92368f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kyZsoCfK3ur8AyC8OYXKOiHgVSCSoFKyV11I/KCAiBuFfnKxPlH8zMTiLEIn?=
 =?us-ascii?Q?ciwgrR3ysOImvrJZRUotjrQpa8mZShSUkyMjrhgLUehWb5WPrSYKNxgLCtEF?=
 =?us-ascii?Q?3QhDSGgQHcYQaFQQ/CarHBmI6LuIvjlXry6eOAl/9UDnysUme6tmntvPC13y?=
 =?us-ascii?Q?A/Mc3PZdCxzRfQcU3kqhYiyqx0pQQfIw45M4GS+ceGIKOyo3fIklfTPUOhUc?=
 =?us-ascii?Q?YxwXAPiIcQl65Fd8cZAFEoEOtlZgH2hNL1z4Up0XCM+RZbqocQch6GJoUMgU?=
 =?us-ascii?Q?f6LHD+cp6DYsCk8Unmgc5fQNyE6l6kPEmv3o7oJpFus/8AF8Ub5QPL6UWxM7?=
 =?us-ascii?Q?FkhEBmE6bRjXOFGy7VTSsFR6/TWZNdcS2KiGPWM1UnxfyexgHK6E9m1L/c09?=
 =?us-ascii?Q?VP5I8FAuZ1mAMslPJqqRaF2HC9tL8SGDNj9vchinTkqSG7q5DopI14ZF2ZHc?=
 =?us-ascii?Q?bZPUboO4mFFedCMFPSFwwaboUbPyAKgLVryaV7M8zoH7q6KXUspQyEtvnAI/?=
 =?us-ascii?Q?1CX32VQZmBCFySWk9dFb7/RFFE/7U9ZBz+i281lga/Z12B7rkDoa6RUYeDqk?=
 =?us-ascii?Q?3hhohhUdI6JbeQ11gtylQlf6d1Dh5yc/Ctq5yresx3Y0xPlTK9iANqp68Ki1?=
 =?us-ascii?Q?CcM8PL8ZcrXRcSGW2tn1IE7zD3UzPMQij7pdCgOikkcY5BNa+IZOWbpfhPZX?=
 =?us-ascii?Q?ted/YPz0N/ncxEaj+5Y7553KP32+hWqSldNvuaZEIKmNqtv7FajYrhAh+hy2?=
 =?us-ascii?Q?dwZGqsta041o0pksEt6+UIA+RDp+9OIkBBZbzuzrzmj5s6snJoc8Z0x0RsQT?=
 =?us-ascii?Q?TvCGtMPcCUwoYRmpEnKHHcWeaKPA1bNO+MdFG3st9lhT+7eD2sxrwD7yFjFY?=
 =?us-ascii?Q?O5geapFM1cVpR1JsO5UxiVKCOLjYQi1PBPvwOO8dIIPrWSUJFzHYzwMkIhcO?=
 =?us-ascii?Q?OdjcbG3WizHJAyyNIQq3iHgaK6cBg+wUOFlUQbj0TQeCr2UEJj+1fFbFMsJ/?=
 =?us-ascii?Q?8YGPw4gyEt0Q3OUmQdvlJh9x+LwpFgcbT/Z4QP1/tjchh+JUlYMthlN8OycD?=
 =?us-ascii?Q?88yPO5K1L2CvPAVMRBtWvFDB8MC4lhTt797d/zfCLKkab+WPlK1XF2zv9TVy?=
 =?us-ascii?Q?IhFki7dMcjHnGyBQYR+iemIS3ua9o0mIs4foVSJOaw6HQIvg0pVRFgIr8r9G?=
 =?us-ascii?Q?IARu4NNK1WXCK4guPlN6n529LPtP2RupdKcTeHEbVyrDagqSArDCTUpAxNEM?=
 =?us-ascii?Q?pCY3Qx/Yai9pfJ1VJTsSabqrS7Pzm6WN8D8F2+M+6LwG1Ivny3qig7iVlPoR?=
 =?us-ascii?Q?O1x65sjQIKZSip1fBmqN+r501IWUxb/GJmzM+M4KN97obS4et8ACj/KQiC7Z?=
 =?us-ascii?Q?/ar07VJ6gosrT9mvfPtlgvJ4+jjU1qhjoJRY0TVEmMJgkNVGHNac3ADDB72/?=
 =?us-ascii?Q?eM37B5LL/8A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZImlIxxAs8zPUNt8t/MTdZEHrouJxbEEfLH8/FzpkJFA97cSBr7Jfj49TIMA?=
 =?us-ascii?Q?GT10CXD6mKYwMPD0cnqhQZLA19mnCNzhhCExZhxC6fjLBArkA00OvBnqvH/d?=
 =?us-ascii?Q?hwHMjPQktLJ4TeuqDoN+L6tImIfPRxW+WQZtpRA/Wqj6kFxGATDTWNmgdBqd?=
 =?us-ascii?Q?MCGe2cmzCrhLGCmUtq/4e1i0EnfYf37r2VwkBQD8dYZi1AgqMq4AuXNj+/Q9?=
 =?us-ascii?Q?VnbSEXh+f+eAz+cnbuKum7J1sK3EXet3qld98ATeOhTJ5znMZf57rWjZqPI+?=
 =?us-ascii?Q?zB14FyuCqzd1eJ//rnlnSEcJWD7xgunCXRzZzyCUbMN0RaAKQir51A8i/7a8?=
 =?us-ascii?Q?cu+PFeRBuPEBbrQSHbLe87+lqLQ9KXkjP4nLUueQfH0JqUu40QV+fa8GzMi9?=
 =?us-ascii?Q?k07Gkw4ohHbcgout57WTeSM0FyiVHqucOet1vHDbIvo8/kn3VVi2u8HTNZ2r?=
 =?us-ascii?Q?SZoDXWX5p1t931g3eySEd+4JZjWPwSmWAzDAgyPcspemm4xx2L4fAFNz/69Y?=
 =?us-ascii?Q?W5AgkTr5YQK7xju+vfv70HdMJI7TMRju4BafLI9/L+x9p4IYSL6NvEtcU61p?=
 =?us-ascii?Q?BkudJd+F4zrnZlMP+ejRBE/s1tPoy4aLHd05mhDJ5aYo4U29EFddHCpppMQN?=
 =?us-ascii?Q?D0XgbQ1xIbuNiW3dfpzl7FDbLs4fn7htDntkqrc2p7NiTZ0Dk2lj+hdeqp5H?=
 =?us-ascii?Q?TaqcfYduvWDRN3r4J69r8Ka6nhEmWmiDwqi9MTm2OdFHU2qllGLXJNJh3WqE?=
 =?us-ascii?Q?mC8pUWTuHHAdcUluWpMfWCf8fHQF6X2nW7JbLe3fiH31b22yoH/A8/jrxUJU?=
 =?us-ascii?Q?I7xvJdsiOjS3lqJ3AqeXlj1n8tgGcVSavhgF26tex45w3OLjsCPMYqfn6/sR?=
 =?us-ascii?Q?a71kxeTuKJbcYNWPNNlLt09fUHvrSoIGoCGI5rSParvcJqw5kxR1NgNV1SSP?=
 =?us-ascii?Q?I17ejx+ozlC/gf+Z/VlweBqU4U2ED3yoF/PAZ2VQKj2Ue0r5n/OjxSg7IigH?=
 =?us-ascii?Q?JdNXxX/QsB3jrqSvi9MK3+6kkf5Oo8UIwS58Km59WmG/THc14KplaW01ZJCB?=
 =?us-ascii?Q?gyUbMsaj06J3qsyK5zvGH1uv//b5jYiPEO6VPLPxZI1IOQWT3kK/X681G8jm?=
 =?us-ascii?Q?Wdb+MosRBH6ES+5cA0fm6r/SmnLMoVc3Uy2c2Wo1N22R4d41AZmNlzm4BUFP?=
 =?us-ascii?Q?BJASudIJGc9r7TKtWWsCyhqOZ3w5wpL8XVLVqaaUNgviGm8O63I77NsTUsRA?=
 =?us-ascii?Q?gKMcuu+yNhGp1ZtryR6sLsXHDPPQDVWn3CYy5ygXY/d71ZweofzKdCeTAosU?=
 =?us-ascii?Q?4Id3Aaqg/5yLCOsXdB7qWy7uwJaPQzE/cDfnsdBLJEJOcj2ylsICKJ5IAma/?=
 =?us-ascii?Q?MNPC0itu8bSyYdP9/xlZ0OTKkUuaf9rIdggHfzn7lSFNnW1sXYccH/alHFR2?=
 =?us-ascii?Q?LPy8SQ4N/TGoqsAa6hR1I2RjWn9DzqdgUCuHIDituo/XuxEQz9jev3yMDs4i?=
 =?us-ascii?Q?T+iRyI8cvjGwASz8baaDkuSsZEMUnMBLcM2UOU5n0N0X7Q32LWGaSl/13uRi?=
 =?us-ascii?Q?egyX7kZeXUn/tJBo61apT5m+9v+er69X1l1CLoQq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Nc/dAVh7Amd+/Ukyxy+0C1DJwP8+2B6mzRCwRu9k/I1uSwYfnwIjugfxPHGeTiRapNiZWHOmz8SBJZG7wGlvDwZupPeUVPG0RVEQXr6tFYP4bYQoqfVALvljExI+iPQ8LVmvErHoXP+wHPJgccjADlJO7YU7LAvwqxbGpeL/IRAdGlQPLSREu9x3H04MzkbbOVkrdKMN6sdPgyfkroZLqSrW+F3kSBxAdSmeVqgKiUXg02aaht3Ko90P2Ntz4cBrurXt2qC5pZ5Ak3C1BaGooZGufT8r0VzQSvCK/gtHxP6al78BgtIqhdwXt5dH3Nt/Uq9BlqyFkHqG9T892YR8nqwewKWNyQoNC0yJSCgM6LYe0WiFy2eugFhVL6kAEJBs2aS3MuYNCG+6Vrc/GYq6LOUbwAJ4sCJV6WpvSkMM6FZSzHDdpRAC3l1w17e/HlBI9EV8/xCyrIEcupMgiXvzk4cBoses2Be+40PAF/oE2XHxWDLIV2wXTI8VxR+WKTsWHI4NFeUoKMlPsK0+27Q+OxFGkubBNcYTnV22h7L2IdmoZY1dRSPCTHOk8cXxjFnWnKY4SOeXprVKPNMnTVBrv7pUehbpisTOrH/jlpDvjbo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f2f152-6907-470f-9a8d-08dd92368f50
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 15:55:18.8226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RK533ojX9TaRChS/YwML3+R1112z2jsa0oEbk8uQmEFS/57iPPabRtRF09egM7MBXV+jIQU6D3kfK7lP/7WNaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB8215
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130151
X-Proofpoint-ORIG-GUID: Gr9AcI8PKyf6Zeym_ZEX1ru00khG3do5
X-Proofpoint-GUID: Gr9AcI8PKyf6Zeym_ZEX1ru00khG3do5
X-Authority-Analysis: v=2.4 cv=XNcwSRhE c=1 sm=1 tr=0 ts=68236b6a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=4DR9aTgMOu953ERsmoQA:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=WzC6qhA0u3u7Ye7llzcV:22
 cc=ntf awl=host:14694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE1MSBTYWx0ZWRfXyfv1rZsc+zaQ xeUKz6gOSsseFutX20cTjYLFYjBd84XdjYBgc094+UoEn4kXYWnaT+0ul+4bk6LKfIaZOv+S+Na eHXdAnrrouQO9N2dJgSHmIzD6ygfMTsp9a5VaywdklQwfCi4w3eezGK02koIRvDfcoRUCLjnDfB
 j3ltNLDodd1js1c7bmsWCIX0OZdQAh1SN2CgX0U4SryzYBDWFKzwT62Jo5LNaFDhXi7H07VjpsI +DvdxerI8V5TepFkrWlCB5rwL/kFTgIptzKqQQMvkrWeKhAYvHELS0NaTiQP+dZi9vUlkjaqkvz 9Oxxye+q2wEWZR/VNAWV0jd/oD/6jMg0oVNMoPCtDPckw1SfUE9EOaom32UB1Rwb/x8deKvtx0W
 /53Yptz9zM9t75+xNy/Dp8Uwlsdp2heW+iqQMjR9RdhV9ySWJcJG8Nc08QD5Av2Ld19es2A1

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250513 10:57]:
> Currently kernel/fork.c both contains absolutely key logic relating to a
> number of kernel subsystems and also has absolutely no assignment in
> MAINTAINERS.
> 
> Correct this by placing this file in relevant sections - mm core, exec and
> the scheduler so people know who to contact when making changes here.
> 
> scripts/get_maintainers.pl can perfectly well handle a file being in
> multiple sections, so this functions correctly.
> 
> Intent is that we keep putting changes to kernel/fork.c through Andrew's
> tree.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Acked-by: David Hildenbrand <david@redhat.com>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ff5d3c40e749..d4092ebfbe03 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8838,6 +8838,7 @@ F:	include/linux/elf.h
>  F:	include/uapi/linux/auxvec.h
>  F:	include/uapi/linux/binfmts.h
>  F:	include/uapi/linux/elf.h
> +F:	kernel/fork.c
>  F:	mm/vma_exec.c
>  F:	tools/testing/selftests/exec/
>  N:	asm/elf.h
> @@ -15539,6 +15540,7 @@ F:	include/linux/mm.h
>  F:	include/linux/mm_*.h
>  F:	include/linux/mmdebug.h
>  F:	include/linux/pagewalk.h
> +F:	kernel/fork.c
>  F:	mm/Kconfig
>  F:	mm/debug.c
>  F:	mm/init-mm.c
> @@ -21769,6 +21771,7 @@ F:	include/linux/preempt.h
>  F:	include/linux/sched.h
>  F:	include/linux/wait.h
>  F:	include/uapi/linux/sched.h
> +F:	kernel/fork.c
>  F:	kernel/sched/
>  
>  SCHEDULER - SCHED_EXT
> -- 
> 2.49.0
> 
