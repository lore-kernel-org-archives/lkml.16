Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45F823D28F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 23:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746833668; cv=fail; b=Z22E7H2LHsNMJnkiKQ1VLrhrkLr1f3oXYHYs57Kqb3G+Lx1Ff29tzzfcdsEHYXRXFhOsBkpRnlX0Zm+jiaAwIohLdb/iXTnWTYTfSNrahOspA0fmkVo+3eG3DKKAOuEb8f7m12g7OWFINweB67nOflJQmr5jlPNG14aUC4ejQeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746833668; c=relaxed/simple;
	bh=2ozhIBp4b0ySV3X4ua+5ffXV+9kEjYB51ZBhhEYvK44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bcqGy2BDu9xIEV+mnLRM8j6T99Nrp/X09qn3vbpOGGTqFIKq2xVdHFETAfUXTReyfO9/NWl5jXwuSewQuOmaqEP8eqPvhSC1C1VtHi9lp4OgadUvTrvnGXd7Mx4qN/P0DMuQYxN0FSo7C5+m0A79qNUbqh8djvuQBaF23OpuZko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gzXlHK2s; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gzXlHK2s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8H8z1OIRjxIyhedHPG4DEfYUiwIY+jWAlPpJqA2SDsXAyym/HIuOplDc3vTSiwr2zKddryVqjaswLgwDOPYKyc4Oi9y+/T/yY8JapSniYoSH7oHiTdGwgPQ7tcjDWvpUex2c5RiUnY3RHqIfzcpQpti3chy68XPwcFmMh2GpZZ/oWFTMgbJeosYfDBwcQn58bgrWES3BQBN/f63h6d8h+fBfoC3cGmnnrWroEA0BuBNIzMQlp8Z0VOXIUHSSOqUhYE2EAvsIw5Z87nD9YtttjMYIivhRUuHpl8fVR9JlOsYGKgxHAgWl3StaRkveer7ofj5o5SdmokBww8GsoqolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAT1uP68m3H8r7JtHuKko4dwlKHUaJPuCWtSyZKxCDk=;
 b=IEJvez27SWCN8MwJuTeBxijt1b+q1dTyH4usKOKZRlzRlYF69uw1baBTwPJ/+JtqGRDjQr+Qbyp7Hl6nj2JFYZ9QHXitFnJEOYmyZ7dFSsZdHZ1pZKkTkC27xt04ZyIxWnlK3VZd8OTHvGVl9TSIAkIP7W4dPdROXeyQ4YdTT16F9E4Mit+CRyrcEkRpyIxZjvXvx4Z/t9VSKs9AIA2ieBaWJx0/pttubUBD1LTORXJXj+vmf4aneZlHJYOPcxfG3Y1SH44rg0YtF4La7NBwrUVVOKrVmYv8LGmdbjGky5b0Ghyv7IBDztIylMQ8wGqcR8wGe/qKjs9InvBxQq1Xig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAT1uP68m3H8r7JtHuKko4dwlKHUaJPuCWtSyZKxCDk=;
 b=gzXlHK2seF2ol72vMkHrR3JENVv1imDUYuE7xau4o4+677iHHIcXa3lN51W+o30RHqkVhIuMX+KXRXoPc/qL8CsNary6l2c1STAnxeEY0wTkY/ogopB6RjXXqKs6SZgKAu5+hWOLKc+dHX8gUkyM6d6Dd0Ad/XJPI1sezGILlvFogqryAJUN/L6q40Jyr6tZjFER7uZG1B3N4FiY+7A75nuCxeDLu1V8GkTlQfcKzmjU3VzcsiJnCuEWGcitNZu8QSCqQ+RGuG5dKpyTIMEnogahVTTRuCFQ7tjR+WTNoe04YH8isrObmm4iCz8F/n123+VO6G1VD1FmgGU2FepuAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ0PR12MB6879.namprd12.prod.outlook.com (2603:10b6:a03:484::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 9 May
 2025 23:34:24 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 23:34:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yafang Shao <laoar.shao@gmail.com>,
 Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 shakeel.butt@linux.dev, riel@surriel.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
Date: Fri, 09 May 2025 19:34:16 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <8A18FB29-CC41-456F-A80E-807984691F0F@nvidia.com>
In-Reply-To: <f691d2e0-5919-4581-8a24-1b543d798ae4@redhat.com>
References: <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
 <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
 <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
 <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
 <20250509051328.GF323143@cmpxchg.org>
 <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
 <41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com>
 <CALOAHbAvQDee2=5vsDqj77g5gAGdGpXFBbsC7tpKnCYEDZS3vw@mail.gmail.com>
 <20250509164654.GA608090@cmpxchg.org>
 <f691d2e0-5919-4581-8a24-1b543d798ae4@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1P223CA0036.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ0PR12MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: ec096c95-7985-4c66-9769-08dd8f520456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NStWTnfVhe5ifrX05J4uC3S9oCtDyzeRvo2hp+MPmc+XE5MQEhrdJdIHqR+h?=
 =?us-ascii?Q?UpHwGzL9Z5PdpY4o5Fbe5A0UypVaCYMKwYNlpBxYG4KWMNl3DJZWWTLuj5fo?=
 =?us-ascii?Q?bdiWxlGwIzVf5jAvAGR+W7RxlaZpkMXIbKsuJUeSLZmGGRsBsS2DQbMjT3xJ?=
 =?us-ascii?Q?YB4b3DuH2jJVa08Vqqg0zwuGzatOziG2OHZ94ekYy+tx7ymQd+zpwr8CGA6/?=
 =?us-ascii?Q?2BAcVp76aTaak1NBisBP8VmTTrMsQ5dURxWsfQFzzIrY1HY/b/PlTZQoZ19c?=
 =?us-ascii?Q?DLL4rcS94SupQDGBrHNDhZ4YEPUY2TwJTmOHval30ibtk3FnAvAHG19kuTdF?=
 =?us-ascii?Q?AnRvTE5pGJHs0oG4p9TxHZ7UgqJy9cnyYJZ56vKJ34tSAtIx+b0IY/R570GJ?=
 =?us-ascii?Q?BETyUf4l3WBQu5zZtyuhg3/64jHAlxyinoCfODcnproTibtkjO+0d58vsHYB?=
 =?us-ascii?Q?mL+K1KgpwXToOjUVzO0KzvhwpjBJIA6C1K0B9OeKY83XX5/5m8im+53FYqMF?=
 =?us-ascii?Q?2MHa/ZOglPz5WdAlSP1/aZEIHF+vf09d4M/IJOVRe9pMrjHJZhJ67yoULKhP?=
 =?us-ascii?Q?Q+P67JD7HA4DYT9vYn4/x0y4NgC2Eti4KTI+F5uXkYqySsQDakhrQowQUNze?=
 =?us-ascii?Q?yYabLaT+59UkptErjoWVuRnszg3dzYqI7u8ACt2RBbPl7fNPgop0RT/OD6C6?=
 =?us-ascii?Q?47o7SCp2LOzhUMl998jx/44ni11ufFxZfdjTxAmNpPl+7i7vZnikFVRldxTB?=
 =?us-ascii?Q?drTAKZsVyBaH3AtFjeqR49cEXGy+w3GrEYP8DRH6B6MqcE3tyyLLdjFisA6D?=
 =?us-ascii?Q?r4TePpcEZ02vogHk0OO2RlMPTR0pFxA2vFCTfdnFvTlszY1UXEHhdjv5iJCE?=
 =?us-ascii?Q?exjeaejuq9rOuIINP/S7WkBoN9eUKkKrrX53mf1wkSqMa6ve+1gxiyzZvtz8?=
 =?us-ascii?Q?zpdPx7+koZPlaEznnywQhahM7cMlGYHi7IL9qrh2bicoSOi4Dqhw2kyzoX7c?=
 =?us-ascii?Q?7mcuSm/O6l2MMsZAlr+hb7g7pn5InqIIw823ppAjPSyqnep0D1NMWfVDa2L7?=
 =?us-ascii?Q?1Tt9KZNDYyYuS8g0Hhrom4I16HJekTv9Vg1zZBzeZ0dFzG+a/DVVE+/uIFwd?=
 =?us-ascii?Q?xN2I0wpibU4DwS+S7eBlDnFXFmY9mR08YYkVXe63ilgA6lg/oxnHqAt2yBCF?=
 =?us-ascii?Q?15QXSSOS2ybi/TyeCtxYPCGWesfbWmf+Ky5PHbuctuYjuLaW6FugK+yJ61UG?=
 =?us-ascii?Q?bawNfv+OSR5i/rv6XgTERNafAKR75QZa24ryxMIkgVpG5nEyiY70v25KsJuZ?=
 =?us-ascii?Q?8kTh4gc3x+bL7mSCZlIQRzhJt7QSh+7B9Xen5NOeW75Kh2iK+gNbAChVPVz0?=
 =?us-ascii?Q?oGghNxFzgNMbbPBdwPRSYnCH1oQLeJYrRtaPGK+aFvC11/4dgC+GPM++bwPO?=
 =?us-ascii?Q?zZEZ6gBh7Hg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uKsLJL5xGfJhhF1GrX8ylDKSsKNGNA/loXCPSqEz0TcdEUacxMT72RyP5ObA?=
 =?us-ascii?Q?tg0jRO/5IGkSGzBer5gmraj00778ZO/ojtJ+0F/0HJqdm/MU9pKJS6MYogqR?=
 =?us-ascii?Q?rYS+q0++tcbGTr+/nXy3MgRsajvopHY8nQ+kUGa1vT5xtUP54O7W2t3HIBf1?=
 =?us-ascii?Q?WE1jKTfr54K24Qr2caDyMPlMdm2CmjTxuZY7zrHAoVmsr00EeCkPKUUjz1Fm?=
 =?us-ascii?Q?6A+/F+2RLjOT3EsKncHB84sYFZiKgST39MmDGeRPT+8MLFPveJmh7tn0QTZH?=
 =?us-ascii?Q?+eD1NltlHa+Ou/KnUHNDYeiJAlDKfdK9ZBbKFUlqGF6V4DjP2e9xkZMfLqX8?=
 =?us-ascii?Q?eBNs0JhFPcJNE6SxeCLd7H3GNEPel3BdUA18c3NU85JYVDlc2NwAxY7qan6d?=
 =?us-ascii?Q?yfGFJ767yAXollzfVe3j/NEbjmyRbB+c6MGMwSws9kGFFDE8bvA2ghBUMwSj?=
 =?us-ascii?Q?InciHlpOtISCUnKay2ntmGhwH47iLkLchPnA95AtE7KMHmBWhUgv6VLjzr06?=
 =?us-ascii?Q?Nwm7nHhB3I8GCTciLe+5pSpPJ/nzYFOCcF1t7PRrF3eHveIJA5a7iOMyTSYE?=
 =?us-ascii?Q?KOUgO9xndie8AUIp34DyGn6UeDhQwb+ckSfXWMKimmOqQ8lkHVDcK+8zhlTq?=
 =?us-ascii?Q?8uqZOTCvL6hVWAUf0cXgPOgu6rYojpL1PfKhxnbrfuodlBiqSZqSUqrwC/Y6?=
 =?us-ascii?Q?AcfNYQL7wuhU7/mo13LJG6Vr6bWX3ePMurvux/jt5pj0C6m9ViEWe3+zX3fQ?=
 =?us-ascii?Q?KTmAxWK2q+5yR7Gb5yAxDph3izsxH72mQ3DrHhP1qrtkHo9WkxowRL4hFiVX?=
 =?us-ascii?Q?90r1FNE3e3ljP8xCsgHR7j6pAwJ0CUGhS0ZP0B0hEnpjHE/R2+eFKfv3ecnK?=
 =?us-ascii?Q?f/JaWX/9aVJzuiSUT1uMAECCW94myuGE/zs4PVhIMTctVozaMIZr1NMNPxUd?=
 =?us-ascii?Q?01MHjmoynFXegUvmtmFRCU0h8rFPiOhviz40l+4gZRVaWdKOr7JapQkvFxM6?=
 =?us-ascii?Q?gstz84UKVoq1Pn+nHE+5Z++1ntH3lU0ctmei/VqfRCmVYk36bboXlRXDv33f?=
 =?us-ascii?Q?Bt8bBlhaDIAmdccHKd0J3/KejUob2V4k6RROU3KP0YVP8CNwZi2FZ4ZgTuqY?=
 =?us-ascii?Q?b+plJqldBArYhY4O2SbkReB9KHIdZ5Eo0AhrKX40zemcu6kyqxey1mI/dJO4?=
 =?us-ascii?Q?cnGq9ebhMlFCSQyyRixKtoqg2jhueTddcgfA/8kf8pIJ2AO6hYDs+Fr0hhH/?=
 =?us-ascii?Q?zszvmYbbykWuCuEtCLee8h+N3DUw72pN5C6IhdypjUglic54BYtlR0+kF6oP?=
 =?us-ascii?Q?DdUwNiKfzjZTUtK0H0MWDgqdg3NtxT0UeBA3MkzBEpFyap8Se3jdnIBglth8?=
 =?us-ascii?Q?XVTh7qnMhGMgf4AMg+Le7ZTjcuMubVB3ZDlshGYd2jL3TeiALszup90RH24i?=
 =?us-ascii?Q?BZBagGJt5BMg1nge+6CM5LalZeaQVP/ZOXk5rLPd35Gas8PDF9ZezDzQ0840?=
 =?us-ascii?Q?Ab+ID6JfFV5FTIxcOAlB/IoINyQ8VDNmB4gOLQQ554UbA8IWt0voA5+9/yta?=
 =?us-ascii?Q?DQ9dI1d8NUVG7oMwNhSsJeIYmuCiJuqgi492l77A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec096c95-7985-4c66-9769-08dd8f520456
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 23:34:18.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IltnX/Q2R13re5HQ95ACc4hr5OROQ3YZrOdqxXk/5E0CoCdpd7c1j3EpQgoId7gt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6879

On 9 May 2025, at 18:42, David Hildenbrand wrote:

>>>>> - madvise
>>>>>    The sysadmin gently encourages the use of THP, but it is only
>>>>> enabled when explicitly requested by the application.
>>
>> And this "user mode" or "manual mode", where applications self-manage
>> which parts of userspace they want to enroll.
>>
>> Both madvise() and unprivileged prctl() should work here as well,
>> IMO. There is no policy or security difference between them, it's just=

>> about granularity and usability.
>>
>>>>> - never
>>>>>     The sysadmin discourages the use of THP, and "its use is only p=
ermitted
>>>>> with explicit approval" .
>>
>> This one I don't quite agree with, and IMO conflicts with what David
>> is saying as well.
>
> Yeah ... "never" does not mean "sometimes" in my reality :)
>
>>
>>>> "never" so far means "no thps, no exceptions". We've had serious THP=

>>>> issues in the past, where our workaround until we sorted out the iss=
ue
>>>> for affected customers was to force-disable THPs on that system duri=
ng boot.
>>>
>>> Right, that reflects the current behavior. What we aim to enhance is
>>> by adding the requirement that "its use is only permitted with
>>> explicit approval."
>>
>> I think you're conflating a safety issue with a security issue.
>>
>> David is saying there can be cases where the kernel is broken, and
>> "never" is a production escape hatch to disable the feature until a
>> kernel upgrade for the fix is possible. In such a case, it doesn't
>> make sense to override this decision based on any sort of workload
>> policy, privileged or not.
>>
>> The way I understand you is that you want enrollment (and/or
>> self-management) only for blessed applications. Because you don't
>> generally trust workloads in the wild enough to switch the global
>> default away from "never", given the semantics of always/madvise.
>
> Assuming "never" means "never" and "always" means "always" ( crazy, rig=
ht? :) ), could be make use of "madvise" mode, which essentially means "V=
M_HUGEPAGE" takes control?
>
> We'd need
>
> a) A way to enable THP for a process. Changing the default/vma settings=
 to VM_HUGEPAGE as discussed using a prctl could work.
>
> b) A way to ignore VM_HUGEPAGE for processes. Maybe the existing prctl =
to force-disable THPs could work?

This means process level control overrides VMA level control, which
overrides global control, right?

Intuitively, it should be that VMA level control overrides process level
control, which overrides global control, namely finer granularly control
precedes coarse one. But some apps might not use VMA level control
(e.g., madvise) carefully, we want to override that. Maybe ignoring VMA
level control is what we want?


--
Best Regards,
Yan, Zi
