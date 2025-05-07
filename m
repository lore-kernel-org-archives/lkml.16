Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457F8289E0A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629865; cv=fail; b=JW3d2ttOX7MaWCAXzEhyPp7/RxQxi9G4YyT3gQz8JfPif+orTwPkpBSWlPgr+2/iYqxXpjAknEmgIk3A0AYBWnUIuoV51DlmKM60YVVFYsf7oZZKuyrHh/2qn4r756/JNRteuxgYuUT/5iKrx/CEliRN+6X+PMWQWAMBwQ4SNjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629865; c=relaxed/simple;
	bh=JFt+8eLRgUzTZ9uibnQWYCT/6GG3ty4qCH5Olec4xAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gMrl6KuzctIJPkShUnlN8ZEN4tJaIrrnkZR8E1IBz7hTQrC/VlweO+tb73i7nZfu9dLj19DaBEXdVRsgeRo+PZsiCEAIQM+KjCDmw/pUS978Lf1URwi/f0FS33dDR8jtqh6MtB/R3brVfeZU7/n5o9gqGOkBmY++XMXPGgNEycA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lktuiZ2U; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lktuiZ2U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yfbxxu+5GXqbEv5nQuf80rnubytnVoRxpbFbX/KMQsFrsdIwO/cVeAL7tWm3b17gwelAW0RNjSk5y1VHkPlyMsrguIsCPSbLz0tCuOMVHxWtJReQNRUjnbg9q2w1oGrwkU6TQ9+VAv8EleY/1VXzfvgoWHk+wDg2dAm/VZehyvyMVuqvdR69506IFnQRxZ1DTH6/CVsqPC9LluMblN2by0Aby6r3i9S+VWCLt4aa5hRjR0KarnHtWiMLsTrYBcUdEkooHrlbmV+4V1bk46hTizoGdqGyN7FsYKIGjE/8Z5mPXmZKguXJG5qTPowsbZQlqGVrPuJ75OZRP1rpADZ0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKkFKVDr7KNACqERoJKJscz0fD1kCulp67lNVQt3M7g=;
 b=M+TwB8pb1Tb6MzlpKEPtqK0vIBKgUm3CDDjysurTs88JsPkGDcRri9Kg7b42Z5abkWGb02bIBzIbsL/Lc40dmJH3BU+nd0HxS2ssnZuWRUkW7AMFkqwVQAhos/N6fum0QhJL72CLrZxyoEF/XPE8tFho9tgbS/VrvcHvwygvHRZRURRMTmM9WNOYtNC2R1dM2RT89l+3leEPT9JjxNt0fsZucAR63o+0YVGDKIjBuVZRZp7BtbhFPlzU8xDcAHeDE5KtyYVYxRixguoCzOMlamE3QgSk/pvLYNZEdgCdcug5yYJW9KWW1ix9sDvRDXN4UoRvoO+ExQi7BlgGgPUd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKkFKVDr7KNACqERoJKJscz0fD1kCulp67lNVQt3M7g=;
 b=lktuiZ2UCYJPZKA5jK9VV5r5ypYmr3O/fwC43a03jiK2Yu0qTfdRvTu/WDzCtn6rYgiX7U1u5vMtrktqegB/9MB2rQwc4epqyAxWH1EWkZLH+23+hNpRgHo+SI382fjd53ZWSZbeNDYqafERcE9Aa54OC+pzsKVAwrk0vBzW3I6O5v+ziMKjN2AYSoqGhIZIQHqsRGfusazhykNwITGbCPQLXbdosT0OJMls6LAcvdmLbGh1jh7Jaj+bzLwNz/CZ1HSCyoShds9D3HPZB8jCaw787VjuaxsxwoDm/RHYVLC4nG7qjOIEblG4hyOlKsv9f4Wf8DLGc8CG9/1pZaHE5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 7 May
 2025 14:57:33 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 14:57:33 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Yafang Shao <laoar.shao@gmail.com>
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
Date: Wed, 07 May 2025 10:57:31 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com>
In-Reply-To: <20250507141132.2773275-1-usamaarif642@gmail.com>
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN0PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:408:143::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: a57c625c-97d3-47a2-9c78-08dd8d777f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zpurzz1aPuZ4CaAJC9b/Dyh/6xXtK2CqQsY2HRRmLLSfOuqEvRarpMeayy0f?=
 =?us-ascii?Q?iSCIROc0dIp2b9oiDXJ4KJCh1d3QYWgQIqDYuaouUSlhw02mRgJfrG/skKnM?=
 =?us-ascii?Q?yM7JHIy5cVqez3uyYM8aH5MbWMu8L7XvbdotSirGKmttd6z3rvOu8wWUqL3t?=
 =?us-ascii?Q?bFSxrj0nbx0rWLJB2N9hHSknXpmeZ6zwm9G4ugpZii0aigLofrK/gA1k/Z3x?=
 =?us-ascii?Q?GgkrSTd04i9zl8Vvc1TaW+9XKhMWS+VOvhHtsgeiekusMxWd/T9r1WimXzv+?=
 =?us-ascii?Q?4DSnY1z0rggQrK1NzOH0sgenk1/UsubHdIPG00tkMaCLvAMP4zcbu0VkhfHB?=
 =?us-ascii?Q?TKcqXQQvEKSlkyEFi4UMd/AjnJaKl8PHt1Yn7yaDqCI9P7lYl4vNlhWI8Zax?=
 =?us-ascii?Q?PZ9zhpUHTwLKTOAg39wkKgB9O11VpAtMebxrJWfLchky4PLZyZ/bizn/RVOm?=
 =?us-ascii?Q?4zJ2HdBNwyBnpTkzL+cx5Jb1RyuXtYiUj3indl15j9/aW5xb4OsRa75EIQXq?=
 =?us-ascii?Q?SeVINTBKPr1Cg48pKTJrd/szIm2dMCO2AhI2D04LX/tWqRLiCZPnLdSA6W+F?=
 =?us-ascii?Q?vP09tvjKzD1gXLnBGDaprOjTYPwYyF8dZyzi9lvYKfojHEGqeniuAp+U1Fut?=
 =?us-ascii?Q?Gk/U6qETGpobb8OByLjUVScfhawgR1ft0YD+mcXiZp+jm7N59eIdPYfQQC1w?=
 =?us-ascii?Q?q26HCMVG16Yxoguzmrcw8nNc7UDGHsVVmEaQc21QEYxKEQjv3qXpLBL7PRGa?=
 =?us-ascii?Q?OXAnV2FDzkLwfUUv6JOpDx/ivklENIG6GSdNauaAjFHenQfshxeXgSrEV2hs?=
 =?us-ascii?Q?nRJp88ijcWZLsHOKZs+pY0NXlyIZXmI8f/8CmnJgnGrMdrPb4obMG2IPyz31?=
 =?us-ascii?Q?GQVL+rZ/leYfRH0AeFL+DbiGTBNVIdlqprMVMqMMia4F8jNly6neF8MqZRno?=
 =?us-ascii?Q?R/Kt3kfb9vJtpoTuRDuR7k2HK4eklS0rNIkxRfKaFm6TxO/KHg9KyQ3dKa0u?=
 =?us-ascii?Q?DaidshpMeJbVmuV8Sx6kXUEqiGBnmSVLR3Wuz8VP58OoYeumstNSqTt9w5ED?=
 =?us-ascii?Q?9IIoF7wNmm5jXJY7PRoIRFyxInoq1q+tThw83a6+mvzLUrKnERIKhJOGxFpY?=
 =?us-ascii?Q?wL6w+50mE0RHntTft6wLnVmJFKO9aFoN7yMqdBakqZtpRVbj3tPBuwZrW4zb?=
 =?us-ascii?Q?ZK7BU1qMjgwSB9hbDZNcTkRaHh9Xyhtp5Y7OE9M1MYMvQLSxkkeypttD2tLq?=
 =?us-ascii?Q?v4Weph6t+II7D/bqJm5uMTU7HxXULDTxSELEDbpM4bjvFIxrUt4yZAmgWjem?=
 =?us-ascii?Q?BUgRqLhsG6yXWcSLekhdQZOqyNXxmJX4hp2zcXHBsJ5oegOYlDm3ehF2451s?=
 =?us-ascii?Q?u74G3YMR3qQqc89Lrf8oZnepLggShsDqTJijgY7QhGCASBEDYXoybonxrRUs?=
 =?us-ascii?Q?sCGNQXwB/xw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HnBmPFRmZ5ALXEtayZRlRp6qF5qyNrvgu/vntrJCMUt6Z7wMgyUMfvjs4b04?=
 =?us-ascii?Q?4ExpF2uBtZT1bC/SxFN/Ko13lr7p4mxsClpPW5vGxqtRY/b6NeiH159c+45c?=
 =?us-ascii?Q?aF/4wt5cml0ag8D60uSVsMUUn782kmujZ51UjxIMMFS6D06q/CBD5pwbXJIA?=
 =?us-ascii?Q?OpUFbIKLdfCnPrOki1JXrWA1YtZoNBFYb7KR9Jyh2IjqiPe1ttn2wkjcpOxL?=
 =?us-ascii?Q?Ajj9GT6xFYvcZu78PbLPJvSJli8jXNhnPtx8Kldr5Ja3kWGhJXmXMjVTtMAh?=
 =?us-ascii?Q?AuUp/4S/ghMX3zM2L21rYBpluTkI7IC1D1MgK2ZqwVFrjWA9imyYhXkXmnpi?=
 =?us-ascii?Q?OEOiuWwoqXBKv2ejcKPVah52fjBIAYzsQf1skxcgRqrYY8NpO2bF6qAo9bly?=
 =?us-ascii?Q?pVaYR3su8jMBESfCs8PIQkGQswkF6r4yGBCUqjeXmC0EasACmCz4ZhfKBIjv?=
 =?us-ascii?Q?rcQOE7QGIbQ4SzzQLLbJEUMRpFzj85f6m30DE7cDMqwlkAnR6AbtmQyu2oRe?=
 =?us-ascii?Q?nYSI+GUwzPTmKHKUJU8Sp14WAYuJ83H0Tw9f64EsBqS1DVnlkIIxB+Tzl902?=
 =?us-ascii?Q?K6CPa6JUAjU2gPJIsB51K8RLrnE6wpMkjxzgGzDWICXdWVpICM0rLD+txktt?=
 =?us-ascii?Q?TYVmmV8QDzjKXlvavFwh7ytvCgujwIqvaQKpVlHrMKpnKqDwIJSDIglaECPZ?=
 =?us-ascii?Q?0hOLy6ujVsIFnVmAyQ3jo5e90jnt/qt88aECraKEi/9wEOSe6gFrEzNxoVil?=
 =?us-ascii?Q?X7D070L9GswDyqF8zAxXRWIFk5sN71atfpOMuyHj69DLFrozxHiP3aDDexBj?=
 =?us-ascii?Q?599kKiOY3dmKWCuIO3QTvx4KHyuc/SvZMu+ritPm/X3M2RKEffFGW2+is/5N?=
 =?us-ascii?Q?lioPC4YL2KWdj7MvAxtAjywmr/uyGsXuLpZIL0Z1EqnaqCZp7AxI5+jXC+zI?=
 =?us-ascii?Q?l/8vU9ThKBsyKvfyReE3rEtDCPZdYFapo2fGNMPnIoQ7zihJmv8+MwyTjyJF?=
 =?us-ascii?Q?PmK5uKmrvNLF74/MR/o/NitkKIbctkRFcb7/k5kUbrLks04xPUmdN1X5a3+j?=
 =?us-ascii?Q?x1xB3Js8wedLZAjlpq4TZAuh4PSI6tcV1cqSx6M5xMwWQjEF/+fJQNk8UFDZ?=
 =?us-ascii?Q?VkptrSggggIuTswiFwogH4vehK12bX7IWksSqk0cAkT6dhL23Y1wQ2Pb/JX5?=
 =?us-ascii?Q?T1xk2G4ehQ0E1duEW8MkcBgg7VjpnRg/OW7LwERsiewdGGV6+Gf8DiOTIa+p?=
 =?us-ascii?Q?aoIcxmTZVTvpZqNzcK9WXJQ1OszzGnq7Rk2Wz7xAo3vrM6SzcniU9UZp02ZH?=
 =?us-ascii?Q?7QJ9KkgxIJe4LFfa+1kg2XanSGrE9G+aqGCDlBw0X0VLencskMyFuJXsWJdX?=
 =?us-ascii?Q?Gnugl+ECv2GUWFlcsIK3uT8YbonKhxDVVHEsWGwyGm+aTESHTZkzN2kiO0Yt?=
 =?us-ascii?Q?Xh1ukaufqv9Mh9meaWOpR4KYlApcoZ4GbONX+BggdcYzNMbldIiS5JhzIz8z?=
 =?us-ascii?Q?mvVw3Z6b6eLbf4OKzrVUw/w0Nra2/Mw2DtdGs2hiUXGu0YDjaGM6fa2idZXf?=
 =?us-ascii?Q?POlG8Clg23Qg5DOfLsAR4PpuFNlijJyDWpOOmwrO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57c625c-97d3-47a2-9c78-08dd8d777f57
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:57:33.5311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzQHKhEC7E/Jxf5aJtgxk3pDAhRJzJ9uA6GhJQnLENlmYLTSMIiMTsRcWFoZ2Yt8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B

+Yafang, who is also looking at changing THP config at cgroup/container l=
evel.

On 7 May 2025, at 10:00, Usama Arif wrote:

> Allowing override of global THP policy per process allows workloads
> that have shown to benefit from hugepages to do so, without regressing
> workloads that wouldn't benefit. This will allow such types of
> workloads to be run/stacked on the same machine.
>
> It also helps in rolling out hugepages in hyperscaler configurations
> for workloads that benefit from them, where a single THP policy is
> likely to be used across the entire fleet, and prctl will help override=
 it.
>
> An advantage of doing it via prctl vs creating a cgroup specific
> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) i=
s
> that this will work even when there are no cgroups present, and my
> understanding is there is a strong preference of cgroups controls being=

> hierarchical which usually means them having a numerical value.

Hi Usama,

Do you mind giving an example on how to change THP policy for a set of
processes running in a container (under a cgroup)?

Yafang mentioned that the prctl approach would require restarting all run=
ning
services[1] and other inflexiblities, so he proposed to use BPF to change=
 THP
policy[2]. I wonder if Yafang's issues also apply to your case and if you=

have a solution to them.

Thanks.

[1] https://lore.kernel.org/linux-mm/CALOAHbCXMi2GaZdHJaNLXxGsJf-hkDTrzts=
QiceaBcJ8d8p3cA@mail.gmail.com/
[2] https://lore.kernel.org/linux-mm/20250429024139.34365-1-laoar.shao@gm=
ail.com/
>
>
> The output and code of test program is below:
>
> [root@vm4 vmuser]# echo madvise > /sys/kernel/mm/transparent_hugepage/e=
nabled
> [root@vm4 vmuser]# echo inherit > /sys/kernel/mm/transparent_hugepage/h=
ugepages-2048kB/enabled
> [root@vm4 vmuser]# ./a.out
> Default THP setting:
> THP is not set to 'always'.
> PR_SET_THP_ALWAYS =3D 1
> THP is set to 'always'.
> PR_SET_THP_ALWAYS =3D 0
> THP is not set to 'always'.
>
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <unistd.h>
> #include <sys/mman.h>
> #include <sys/prctl.h>
>
> #define PR_SET_THP_ALWAYS 78
> #define SIZE 12 * (2 * 1024 * 1024) // 24 MB
>
> void check_smaps(void) {
>     FILE *file =3D fopen("/proc/self/smaps", "r");
>     if (!file) {
>         perror("fopen");
>         return;
>     }
>
>     char line[256];
>     int is_hugepage =3D 0;
>     while (fgets(line, sizeof(line), file)) {
>         // if (strstr(line, "AnonHugePages:"))
>         //     printf("%s\n", line);
>         if (strstr(line, "AnonHugePages:") && strstr(line, "24576 kB"))=

> {
>             // printf("%s\n", line);
>             is_hugepage =3D 1;
>             break;
>         }
>     }
>     fclose(file);
>     if (is_hugepage) {
>         printf("THP is set to 'always'.\n");
>     } else {
>         printf("THP is not set to 'always'.\n");
>     }
> }
>
> void test_mmap_thp(void) {
>     char *buffer =3D (char *)mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>     if (buffer =3D=3D MAP_FAILED) {
>         perror("mmap");
>         return;
>     }
>     // Touch the memory to ensure it's allocated
>     memset(buffer, 0, SIZE);
>     check_smaps();
>     munmap(buffer, SIZE);
> }
>
> int main() {
>     printf("Default THP setting: \n");
>     test_mmap_thp();
>     printf("PR_SET_THP_ALWAYS =3D 1 \n");
>     prctl(PR_SET_THP_ALWAYS, 1, NULL, NULL, NULL);
>     test_mmap_thp();
>     printf("PR_SET_THP_ALWAYS =3D 0 \n");
>     prctl(PR_SET_THP_ALWAYS, 0, NULL, NULL, NULL);
>     test_mmap_thp();
>
>     return 0;
> }
>
>
> Usama Arif (1):
>   prctl: allow overriding system THP policy to always per process
>
>  include/linux/huge_mm.h                          |  3 ++-
>  include/linux/mm_types.h                         |  7 ++-----
>  include/uapi/linux/prctl.h                       |  3 +++
>  kernel/sys.c                                     | 16 ++++++++++++++++=

>  tools/include/uapi/linux/prctl.h                 |  3 +++
>  .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
>  6 files changed, 29 insertions(+), 6 deletions(-)
>
> -- =

> 2.47.1


--
Best Regards,
Yan, Zi
