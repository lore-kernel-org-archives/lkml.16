Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A4110E5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508095; cv=fail; b=leq1VgAlbCl3w7bchT8+JU4QweYenb+fOd3myvZ9vDnOLHybKsAb39LgoWB9GbHXwtvX/xMPhxVvAEQt2PBvDwjZQsZ9lbZy85J+pmFvt/4y+o8wbLKsKTyKqsyAGp5nqw2tvvVcpI8zrSu8W9zWO8Ea+Cjbp/Muk3c8EkNsYiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508095; c=relaxed/simple;
	bh=FjY7ey9lQqtfapAGxzhihpbkTmBEHig11zR7QMPvs3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gen46ewiiBxf5Je5Xrpz+EYaxDsHyJ2/2Zt3fn6BRHWoU79SeagYY7QjARcJ1lqlU0bfNTbYRhoUNce6xNKADyh5cMgg5uTBWqPBTL+WraQJzmJZaNAmppK47LtRxberC6E9J0AAJkKg/JrOMDaz8eEbggXMDoeeTMzzOaRcC6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GnTvrtrA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tjNgJPKs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GnTvrtrA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tjNgJPKs"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562NhxXj009578;
	Thu, 3 Jul 2025 02:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=8cidAzVMs50Jo5YJrb
	FufxaNXpLk2uqVWyy9j9/Xui4=; b=GnTvrtrA630ZwAPukWweaO8Qn0bR2jH03H
	ImoTNbc+q1Sxvz+ODIDEPm807uCWlYkFzoVhVrsvwaVaYO5RrNEjLmjsBJRbfjCk
	rmD0d/fOzPOitR/kdpvKxZqHbCsSdmQ/ZUXWpg4eRky91+cwKW71b9FY7TC4ubxC
	0f3Gl67lajQ8T6vGLEZJwwPygt/taPMpvVBkLnI9R6mXc9Pv2GeDKSdw4FlSq9sI
	w6NhYw+GxBZdT7Royr/rS8tL3HxEK4LzuJKLOq+y0NCJijqybqqjrQolvA38N6k2
	f/uebtGJepBE5U4oJ9c0arzmqtPgjdOnFrBnRO/6InMxM3JpkVoQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704g5sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 02:01:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56309s0d033733;
	Thu, 3 Jul 2025 02:01:10 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uc05uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 02:01:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvFxMRUlytrAdSMkI28n9ieEyvIQW14y6uh7xEGR/8cMPgcP964gbfc1yvx59JcKdWdtu47Cm6ReWP8yi4AlTItoerqqGtG6Qk70mnsqep3wHq65JqGWwh81Ltg1qC2P0GNPYpr0AVW1j6HTKSf5nC2FpAis2zLn5D14pWTRiAa3eFWIgbBT+EBOnOTcctGaovOHI93fQwvLk8QjHPOFhK6bEBrYFv4j2jgY2aiMZJg2x7owCWaRI06wmqZsEI8n7J2yopEoAXMZKc7zvMON/PPESCSed4oBDHyLQZBbTIpHjtSs77SuygKhc34MCrA3o6AjZdjUVbZoFVxGWIHjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cidAzVMs50Jo5YJrbFufxaNXpLk2uqVWyy9j9/Xui4=;
 b=t8w+V599wLQkdfF8DjsZXrMTQHA+9/qQnJrajXP9jvlYB2f74dlUsj/Af+H/0pjSqPxFGW2ez3PznFy9gETXx0/hh2ibJlpHeyA3vXgc7KMIg1lZgfHI0pAXfXsYQqOY0YJ07kP7YSiBafiiZe24X+v9NR4fc8TbVEH4aWxCZBmyZ+IHAodHx7WzaPXoPg9TRhrTZt5g3IGdFmjIaPW/RXAYKFZEweDpxsnQGwr6nO1xVC8B4FDajUE6matliZs9KJ4MsoeqSIOAb++Sxm4qMYQ9izlS2de/m567zMSZI1x6LnuqFr39yQvdjndxhtTd7WZSMXMpkFZInQ6tH2jKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cidAzVMs50Jo5YJrbFufxaNXpLk2uqVWyy9j9/Xui4=;
 b=tjNgJPKsUlwc06IOtvAm/wBl273+1VqyjndXK+tLhPI8kvWCEKesdY1KLqOhTumD4U8XxJpA5O49gaV+2mG4678uJV0wVytq1CXAtLcr13CydsvgIfZgB0iavfkxdgYnAXrSfNytxOvQUIQWkfpE3g/MSJtEa4v1dHR6hPdtQIk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Thu, 3 Jul
 2025 02:01:05 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 02:01:04 +0000
Date: Wed, 2 Jul 2025 22:00:51 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: Nikita Kalyazin <kalyazin@amazon.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <htdtwazk66dcrfkpwh5fgtk5ruzzo2zy54i5w6kbg45lqtyect@tt22z7hcdfnx>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Peter Xu <peterx@redhat.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, James Houghton <jthoughton@google.com>, 
	Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, 
	Andrea Arcangeli <aarcange@redhat.com>, Oscar Salvador <osalvador@suse.de>, 
	Axel Rasmussen <axelrasmussen@google.com>, Ujwal Kundur <ujwal.kundur@gmail.com>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <rsumpavnbe63jvfz7w63batked4obgnzmz4boeee6q3wiv7smi@rkok2a4vug72>
 <aGWmZKwcpLMfAN2O@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGWmZKwcpLMfAN2O@x1.local>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT3PR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::7) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: d14120e9-8399-44b3-030c-08ddb9d577d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eMGgbqt+FBeImq+J9bJNMaECjpC8CZKSjjpUKerCczQRM48eIJ12zKDvXrjG?=
 =?us-ascii?Q?Xpi7ssv0D/bIXkZryLGDHGpnv7LaAEKlUwNMimIN8j0eyJ1F9n6dicyLLKle?=
 =?us-ascii?Q?C9MvE6mnSeQnc8x/cvbjAEYHIErRXv4QI9tec9NzGbTRX7czqQQD4U4OGPZq?=
 =?us-ascii?Q?y/buxUbS/miSlrVwupGvPXviQ7yXkLinJKDSj3qthMWP43wGmE4tMh6q55U/?=
 =?us-ascii?Q?TJJ/FoIpjgVp74+SZu8efwjaA9UXI89xobv34ybaT05OMRdlP7Q6RB9MXy4x?=
 =?us-ascii?Q?h88P0drIbp3CEYz+huXJ5ZVKHrIVriO/Pn5J3KOkbQCUHRCZSZFRms3ltZ9f?=
 =?us-ascii?Q?FCTlItelnKc3TxLkVUnmcUtWGZxVfkuosI3OTYBUF4AlKT324S+Kd/lrefi0?=
 =?us-ascii?Q?BWm/PY/TlXQG3L/hTgbtVjznwkXMAYNU/nEqXw04ZlHwTD+vbOvXLtW9ljOz?=
 =?us-ascii?Q?++IzkQ5YAzP3W4G4XFpsnJbV9NhZgrHqlPkwS7TGBx9fH7v29WED3epvA7aT?=
 =?us-ascii?Q?P6kNHdN1gulod45aNgP6S5yn8Tn3qh4phgLQolpps9d68EzbFKMcnjx9KgQ/?=
 =?us-ascii?Q?WQkf7CFObCy9peiltXFe5BdJDTng4oOV1YTNLzdj23v0ZcBbcWEEbkTTwGXw?=
 =?us-ascii?Q?Jp32IhsA4bwkaQbr4edvNnaV5h3bzS/o1/QQLHuZN87Ci1GUftkj7m3BTJZP?=
 =?us-ascii?Q?8s7hdXmCEpBphK9qI4NwX3pqfW0Ws0/WZeDcvqP839CF2YR29KdCZ3smnfWF?=
 =?us-ascii?Q?rAdw0TGu42pJaD44HaSYZLVDARd5NU4ECKhLEijN6R3CDPf30SKdoc96P/mx?=
 =?us-ascii?Q?uHS30Pi78ChYZsQ5MdF6wyZFLkfveXrcFzxSkKkMGz9WVwuAMPI5TJhAAKZi?=
 =?us-ascii?Q?bPdr4xZk/LbSWptYitN45bzsEk/N4/Z3yh5mgmIQyQI2GZFXKV58FdINuM5t?=
 =?us-ascii?Q?bihBHO0INNdXtIrt36mwVyOd66qu8+Y8Xa8fIqBUHtudmHhP5E1c9cl+8JWK?=
 =?us-ascii?Q?BXQnb7cFlifZpy3XlYe+tDMjhV5wAKNoL0XJsEaKFZlmGzFsT33tq8QKCsBP?=
 =?us-ascii?Q?fqUwM/ginr5LlnpxPH4Scb2Z/z0ej5c6O3UudZ7NLZixMmiqXSAnPo9rP6+k?=
 =?us-ascii?Q?7mnDhg/i8zb1EZAqBQTT/Srs7ZDojgZh7XnTNSvKltsHrwJq80hWFExYrhK3?=
 =?us-ascii?Q?xNGInce0ItnJKw/3d+2SZzKue0I0LKD0BO4rmTetjqNJvG8l7VndN29EzE2D?=
 =?us-ascii?Q?Wso3lFuqXdqhzkf8APzUhyGTdEf1h9c+aqHXvM6ILmvOtFZyJssHJc/xfpcS?=
 =?us-ascii?Q?h1FhLByQdUTc2hvVtB+Qe+p/azr0Sd7FO3xE7k8AZTlReaAQtEhTgMM3WStq?=
 =?us-ascii?Q?4rQ/QTZdL86ugbLi/658zkO/ZXPHJ0WHoh3O18hK99fnwX/AsvG2Ih0IUmhP?=
 =?us-ascii?Q?8WXtXpYijVc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZi+pCml+EurUpqTUUqu0tW7XvxxQ191c4D73JVV1QwvSeR4zMtRhfABe9v9?=
 =?us-ascii?Q?D5Es7vEluWTvcKrcClKzDA6s5hfzBBvxFkBlheRBQ8ZhsjOsf4/xVS68o/XP?=
 =?us-ascii?Q?X7fyOj7Kw/q4IfPGxESziIZisfgCIGZuf9231MYnKKqsG8qVHvnzBBrFPu9s?=
 =?us-ascii?Q?q91gC5PNmueLFWtnsT4XVXpwc7pt4OoXEmxIcsActsHHk8VJzBI3HGlS6qzY?=
 =?us-ascii?Q?X6ZPYhy8aFkYlcuE6bXU8UJpuhaOBnWfWE2CYKTdUU7zxc/wAgjwIqPaHFdE?=
 =?us-ascii?Q?z5wW0LN0A8HL6xdr+7yMgZM2bJd6acvs86tqEGQM40DxmIdjSq9ild+MSvun?=
 =?us-ascii?Q?uqEj4Tl/TQZeMGQIGydekp2c5QkTDFWuijM7zEZnJXo6658sebMws3naoFmR?=
 =?us-ascii?Q?eq7twKlyVhn68BSvBgy2ypNF2QqslQAdDgbMDy/VluOyTMy4mVTHpJMHg+p4?=
 =?us-ascii?Q?u4K1PUlMZjWenX7iLLODS1TwMV1rTmGikNkgcVI48GJ/4359zmDv0fU8wvJR?=
 =?us-ascii?Q?cxLgVxc1nOylLHcTVdPq8JLVFVEyn04Q4ixhwsbthnyfjmudxIkB6xUzL1di?=
 =?us-ascii?Q?U9P1AACTkH2xXqo1x0npqPDgpMKC3hB5huj1texpG3VkXNBA/qd/UhAA1UH7?=
 =?us-ascii?Q?U9e2MXXqRIT/56YhEx4mqPAidRNeAeJOAzQLBQna9gNsAGAOGQRRPBnnwdHD?=
 =?us-ascii?Q?rX77KpP8+/kDs+WmxRtc5gT7qGiRlvFrZXYuuhcUThSzF/3qTpZEVEtNhWWE?=
 =?us-ascii?Q?PSZteDjqAQnFxtchHQD2xUW5cn/by9ZLXanyDAWkobIkDu19Zb4jJQLrk6yg?=
 =?us-ascii?Q?TyHSQMSifrpa9xIGe+KxGVldh2gThBbevSNNe0iepGOeTw7dPm0FERMZbNeY?=
 =?us-ascii?Q?t258/t31BD+E6oNSVmgxO5O9s00fsipRiwlWI03g+BdnzPKGt9c3jaQq046z?=
 =?us-ascii?Q?CYus1nwfanha7ofMbFKwIjRMnZqTkqM5erwvV0engBjjvfwSbqm062bhvmph?=
 =?us-ascii?Q?yGDediTPPITHOG4gszPqfhO88LsjPqpwLSZcipidSyWUykcnE8ksbAYFL0d2?=
 =?us-ascii?Q?w9lmaT8rMCyHqsda0dXNJTHf0WBlPy1c7Z1cBZFDLjQZuchf7xfsUgIk3mmc?=
 =?us-ascii?Q?uYia2wxGGo1eoRSekJVqBXeTn8OWhUg9F+gClqOdmRzfVKQEryGH67I3pi15?=
 =?us-ascii?Q?KX6SYetlyOv/26PYhPxe2iA1lfKelHQ5diVEnLGmcVMp6jbbwijNW8TH9CW1?=
 =?us-ascii?Q?nPsnru5nYEAo42LvdaT2z7eKaCN9F+MPAOLXs6ukiOFb9aeHGVPWgTkYbHAj?=
 =?us-ascii?Q?94SRq9czh+G8ebD8RdXmt4Zg+xnruMVBPnW4gYZPys9bPBujmZMPFOTxXPW1?=
 =?us-ascii?Q?0dIx7RNTkevkXcF2rbmFlJVPCfu1sXn02Ez3uzBfyYJ+UnAMc3vXIE6Lo5Bh?=
 =?us-ascii?Q?PdPeofKMf77pm3O7t8zRS/Zx+QUopidGft9D4F7kIsruFRr5wjPq3ELXpPsP?=
 =?us-ascii?Q?Tg7q+/2tDPCMSB3y6Pqy7EchoOkN6bFuCyN904TD6gOeXou4bBjKgZZFTR6P?=
 =?us-ascii?Q?1cQWrU0MvKIH4RnrJs8GMWtB46asHlXGqh7LVovt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uoaHlAo0T/OLxW7iUQWjntcQU9k92zhZ2wawslDuPYxPaQztHyjEp1ZakPbH0DmYxEYWLDgQol7RRpJ+HTcZyJYYcalJLuKWDS63CXY5iai0Ytk8GdS367+bpvjX2ZH2jbr8EI5/wYb+Tdg+lS+gZE940GdiPEFjjlEmlc8bgtKTY2l7nJO88wPYoEOJuTcviBB95eFLmBkptgY0TekjcM/5GtVWLMMAQL+y16ow0we5k3cdJtOoJwrL4qyp5ygrBkMGVEVaMbXA8Ys01kJN0+NMXrRNeniCHoiTzsaXBDJlocnMlxnC2zGVvRMZ9wwZUlp0vSpGf1yP110g6B8nQTmgXcBtikTdLPp48k/5tVPOrHq0U11I5w49R4dOfcVoTtpA4kkO7hW2LUbKw7SXkMcOK+ofSJMil4DBa5fAxlOKNtOPRzr1u4AD++kkKs6Y8wYJCXJ0cQpJ/xj3rK5A+CO+RyLbRI8o0epiFMKorAHsTg9mHL38CIVpMxBCo4KSAMFxG9OoPSS4y8uG0Or62tgdtMiRQ70Xtg5D8VFyD4R74V8CAN+IftIlgwVRHjQiDlNCbaVG086GFA4LVg+3QeAKa7OkF3SaBdwYrBwqMs4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14120e9-8399-44b3-030c-08ddb9d577d1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 02:01:04.7284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5u4LC/O7abkgtFW/h99CzhWRfGT8N9S1amv/aGAcH30QAcr/rg06935NSU1cIFJjd3y6ZIYnwFxjUcrB9d0UiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030014
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDAxNCBTYWx0ZWRfX4P0R/LDQjX5m 5vJK0orB50dsW4f3B/AQEReUyzffpq4nH8uD5Mi+C031ljQzoIvp2qDVjyFQ+LkRipvbSZHt1ap k1zNTBj6yrw+2ADfvZ2oAwXtmGYLncpBJO2PnZylqKV4fbb6Y7OCA2KjJc9yIv1HpcAUqqAkPo2
 X2a2auS4WcDIikneK1G7hsBZx5WwhKNdPoOmED7XRnejDqYumaGkNaKKdCwkiPn+j8wNwBtgCK5 0EsHgGJcEsVfXW1si/TROyv+s2Mam0aYYRW2jwKhedxxrRDJdafwPl5YqadHU7FCSft56bV/glg R/pENMgX1FWQCJefW11drhSQpU/NBmN6RFUsHND4pi3UZrE41agkfJYKi59ZLyi7ldRYJzBdkfU
 s3tdfZqWt7jvPpeQi1MRLxjawUzM9FHm8q2N87NyFosy0P4MJd0KOAGPmyXPfZ4LVyaca+8/
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=6865e466 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=vggBfdFIAAAA:8 a=20KFwNOVAAAA:8 a=hKlQgifVLkqOzrYs79AA:9 a=CjuIK1q_8ugA:10 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-GUID: aj5yCpIeW954Yz1mpV6MsPo_l3H8LFKt
X-Proofpoint-ORIG-GUID: aj5yCpIeW954Yz1mpV6MsPo_l3H8LFKt

* Peter Xu <peterx@redhat.com> [250702 17:36]:
> On Wed, Jul 02, 2025 at 05:24:02PM -0400, Liam R. Howlett wrote:
> > That's because the entry point is from a function pointer, so [3] won't
> > help at all.
> > 
> > It is recreating the situation that existed for the vma through the
> > vm_ops in mmap, but for uffd.  And at a lower level (page tables).  I do not
> > want to relive that experience.
> > 
> > We are not doing this.  It is for the benefit of everyone that we are
> > not doing this.
> 
> Is the vma issue about "allowing vma->vm_flags to be modified anywhere"
> issue?  Or is there a pointer to the issue being discussed if not?

The issue is passing pointers of structs that are protected by locks or
ref counters into modules to do what they please.

vma->vm_flags was an example of where we learned how wrong this can go.

There is also the concern of the state of the folio on return from the
callback.  The error handling gets messy quick.

Now, imagine we have something that gets a folio, but then we find a
solution for contention of a lock or ref count (whatever is next), but
it doesn't work because the mm code has been bleeding into random
modules and we have no clue what that module is supposed to be doing, or
we can't make the necessary change because this module will break
userspace, or cause a performance decrease, or any other random thing
that we cannot work around without rewriting (probably suboptimally)
something we don't maintain.

Again, these are examples of how this can go bad but not an exhaustive
list by any means.

So the issue is with allowing modules to play with the folio and page
tables on their own.



If this is outside the mm, we probably won't even be Cc'ed on modules
that use it.

And do we want to be Cc'ed on modules that want to use it?

We will most likely be Cc'ed or emailed directly on the resulting memory
leak/security issue that results in what should be mm code.  It'll be a
Saturday because it always is.. :)

Even the example use code had a potential ref leak that you found [1].

> > 
> > We need to find another way.
> 
> Could you suggest something?  The minimum goal is to allow guest-memfd
> support minor faults.

Mike brought up another idea, that seems worth looking into.

Thanks,
Liam

[1] https://lore.kernel.org/all/7455220c-e35b-4509-b7c3-a78fde5b12d5@amazon.com/
