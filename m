Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D039257ACA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751561094; cv=fail; b=ukhDek+/d7xdTKgZrlXkwrNmobmPBY2rzLlBbQnU5vnBq2XaZo4verRiDjmnj9WHKNO9DfapU9HSmg/VZG/bwOLQYQIA5m0m8E6C1sACShfnpYvVwGVb2JoFYZfnZyYhUU/IzTe2UTTrIq1wL4XdojhtIUtL6hr3OJxhOYKEXNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751561094; c=relaxed/simple;
	bh=m2wABQnt5n1iRYZDq3/3ZQ8nzhM8T9Rh6vSwjHZplsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PsfLZYUbdrbpoZt6b5zdOEF8orpQIx3GQLxE3a8IVpu5Krx5Jaq/Yr/XGjtZrSqkaNT8xouHCjUJ2vSVMJ0ssQJNVCztVWo3zDsOKS4z31TkkQwKRttn7NiLYnW8GRakesRzk4RJDTjPr7VSAis8Z86f8pIbxFzBTstTXOq6Ijw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jztSElv2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ylIqVQ1u; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jztSElv2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ylIqVQ1u"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZlp5005351;
	Thu, 3 Jul 2025 16:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+C3CTQRgwowdnIvRoy
	gtpkn80MQOYq4by1KyoUn+z94=; b=jztSElv27qrp0op3h1+8rfJl9KA6259L8Z
	Xosumu8rYfPr/01GZvO1+Mtb8yw5+7k2nNbimlyPdG78FbCLIxowroCT9Sl+g94v
	5SVPT5q8YL7qvrY3Ln3q4Kz/UHOtLL6qhUkdn8EAO/jO0TvBmfM2rl0qnyh7AqSz
	kKi7T7LztHyOppy2nZAv0dOVk4ERUUFx3r1PRtC7lXtBZQKxTFp+swlKe7tlyQhI
	WB2dfeAF23Q5WhLGtJiMkzBt6x8yzjDAgfzGmOSQOWp8AEAza4WtfaZ/GJjK8UBH
	77FwKAze9c+r+A6S2hsIv3Iayydjtr8gVbZiL2kiubsTbaWVTQbg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfhb8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 16:44:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FNuIW015152;
	Thu, 3 Jul 2025 16:44:27 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucm5bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 16:44:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gU90Svn5Dy9EZZfo9zw9py6XqLzqN6rPmPn4rAVbd39ZstTDmy7WVlqLY54U6PY9tIQ9p8E5pTSA/SDl/gV6JO+ClQ3cbp53BiXeTcxYNSgq3sPf8kRqRj+mLX+AEB7Ngj/rZ2HJgOEWGkuUMdiafUiRgwSObfTmAvbGr0SAnprJmIF/CP/FCcPIur/bnupWugyvlwrscn6cCnhCNopcj2hoXFiO7a4irqpjzoKw96ShmYYKEypRZg6yvyXLYAFDd5F+xVYd/25ZEa70MeEMXkhohkXsdMYAEdT47j2nvrqE/OJa7EtYI2139AIinLtNQvEfAqP6zJ7SPqL0+AvvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C3CTQRgwowdnIvRoygtpkn80MQOYq4by1KyoUn+z94=;
 b=KY4qPZ6vlCu8P9698dugeaZlfWGPoUe55FgcpKXgMhwUTdlrWrs+1vGK7oG9QQsD008REqgkvAPxmmKWY8GJ/SQRgJmHF2UC6n1XLCgMBt88BOba0k/Zoa5pyckwjlzxXeXPdSi17rk3zadgOVJfn8nG3gP1eTeCSK2Qw7KYkRi/7o8MVdwc62BTv1UOvGoJcBcROI/2FxeVUHXQsIQNSU0g+0ecTaPhXcyspVqbjSEmYWsovlu68yVGlBDv+Q6ROV0KkoPkpyJPwsq8wohQ5ON2U6K4Nq1q95ECp04saTzwgSpZPlhJ5rPayuofwQca+03/YQiFhFtRIeHOTw12Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C3CTQRgwowdnIvRoygtpkn80MQOYq4by1KyoUn+z94=;
 b=ylIqVQ1uuyKHZLC8C52Obk/3npH5rBJVasNTVTfZ2x5w8OTdyilFZpJtalp30QUs9Vef9XcQLQMUgEE1CsJDPqP3ry3VXzqZDmSE08J8Q8DbRFkUiP/02/X84NmEcDsIkvB7XQHCsqYUtym5yiKKJbs4Dt3JjlUtlYyKaxRbtaQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB7009.namprd10.prod.outlook.com (2603:10b6:510:270::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 3 Jul
 2025 16:44:24 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 16:44:23 +0000
Date: Thu, 3 Jul 2025 17:44:18 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 0/4] mm/userfaultfd: modulize memory types
Message-ID: <5ffc374f-da86-463d-be51-983758fecb62@lucifer.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <92265a41-7e32-430c-8ab2-4e7680609624@lucifer.local>
 <aGWYT4vFk2pyVwtv@x1.local>
 <54bb09fc-144b-4d61-8bc2-1eca4d278382@lucifer.local>
 <aGavKS-ugFeIbQ8g@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGavKS-ugFeIbQ8g@x1.local>
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ac0cf3-7744-4236-1137-08ddba50dd6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kZWUK3BDtGec7yfWgO21t8chKkRqvRW/kKhQ+yQp3ZrpR6P2EKbDY04SY2k6?=
 =?us-ascii?Q?DvnB7OcnvD73t4bFfJso+xbNzY05sNj8pqCOunEaLqbjnKmOsMGtPe2G/vVL?=
 =?us-ascii?Q?+onDwM/fTVzD8vG7Z3bXutyDhx7+7l4MMjRqTvy4476fbYPhXLlP5zkUAp4G?=
 =?us-ascii?Q?NzghuCnEuvs15c+yllnIr8YwxWp7ehuorYuU2mmZ23HKHjyQXTFGDj/h0zNr?=
 =?us-ascii?Q?idfQSFi3etdMkupY2Ma9QX6WezG0kry40CDFrtPEJ67R4K9+dPvDR2vqLXxY?=
 =?us-ascii?Q?TffPIop5D9H7FI7Fa2+XMZF3vMb8ETMsa7AP58z7zSDWDNq6LqlOdbaJ3KaQ?=
 =?us-ascii?Q?j1Mz64cQ8M8wYC4RbAOQuseC+YhDKkKM71hIHltXxl6QCD4+6OFgGwQ0G0To?=
 =?us-ascii?Q?gPEwALuDPQW58HbjUdvGlJEeuINuOKZ6m9O84LfukAPTN+/XFaRasXBK3Mit?=
 =?us-ascii?Q?XOtzs5lrMxtisK6fTocxmyZXMf/7a5Pw5L0g+qcL9+o+w5Zu5EWtTZeJeuFg?=
 =?us-ascii?Q?9AHUcpzxK4Rf+B74zgBEqb1k0Y/odM9EySQMd4w5sTkl3WzRO+dmh4ZJXUfz?=
 =?us-ascii?Q?/chG+bIeU4CX8v8RD3laujL1K7xreFG9OaMSHTO8h9d23yoM9niXw3QJbMjY?=
 =?us-ascii?Q?JO4LkOBXMVUv5vBz5cT+GYazYkUrT2uh+7vH+nAI+ZqiaHndgpchCm6Vo57i?=
 =?us-ascii?Q?BF3R69OW4Esh02POAxabup9BnnNfWnTaHemXULIhjErwSjZXHqxeTKR1pgjY?=
 =?us-ascii?Q?LsFTvB5UkfxZ7JoJjf6odLyWpJSllU+xuafdVxkyMxdu7qMERF3JB0EH4oyX?=
 =?us-ascii?Q?/j/xIfwuipol/XQmpGM758zNFCs/s7BQtJWjZKjpXpICZhtSvNRuBuAi8P25?=
 =?us-ascii?Q?/2XmpxklC8GncAEaiubQqje1itKVqCPmYRu/iVUPFYlqzOSlmmxE5i+Msaii?=
 =?us-ascii?Q?FzArGmGkJzmX2M/21kNtuncAqi2Ov8WhRwWWs459RSSlyhWQqF6SvtrEoqoo?=
 =?us-ascii?Q?ALAwDEBYzrwYN+Fsxa8p9EgK/6InUdWq7n/8xyqr/pcwMEc7A4HgKlYaYnNw?=
 =?us-ascii?Q?v9puJ+qGLef+afCWzUNSdlS7DtAyBOEQVGGaVpFkCBV56CFB2yPBxKEE2HBS?=
 =?us-ascii?Q?qwKEmUi8ElTUEG9rFFbML45toocGcvVqb3UltflzTZGMoLRAVt2O5frgpoBf?=
 =?us-ascii?Q?ZBsutxjzfy+p+yIJsL9B4TIrU1bjMTYS2NOitFzVKzqJoWV9GJBF4SpEV/g3?=
 =?us-ascii?Q?DJb0fIh/nZTRYrxTW/0C1G6npUwowE2YFU51KTt+5qBt4oPZOcVmdlo9/dcz?=
 =?us-ascii?Q?UrUcOB2fvD4XeX3ZbcrAvGqlj7AGJotLjcNJwcNz4estI6ApvHQ/L4ry+HCm?=
 =?us-ascii?Q?1pCs2Zvex6PefljNxnVkNvbqM0ABBiD+vT15VS+eVCy3nCgQteDXmATFrLhE?=
 =?us-ascii?Q?UkMnlu7Q5Uc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?alxPBeFG+3KZIC4PL+M8Yl3v1ZSoB3Mtu+s5ELqUkXEIKwoeUf9ytXMX8kRA?=
 =?us-ascii?Q?hBTrb2Wz+OdS+VEJOQx0KzsLl/ICnhIQfVPDkwww9LitWDUJiXXTucZ6FXkc?=
 =?us-ascii?Q?Gy3worZbA8VaWb+3D/Uls1ROk9eRodRuy1eCkx5rLFLt1jZEf60eka4fTDbn?=
 =?us-ascii?Q?jgZw9fIGT2P4Qwru1ExaaetXHZQ9r6uAqAKDImPKJiANDNdZK0BLJGoWf3iw?=
 =?us-ascii?Q?lVaizwFGL+qa1B2Z9Nhun788IVBTsaqmy6aVgCQMSj7Omcx4ihu9jLlBLlKQ?=
 =?us-ascii?Q?LiNsl2ps28q/0qhnZFYWGz6zYpS9kQ1qjvA6wIE/8949cqoPVIYnSqcBKrpp?=
 =?us-ascii?Q?bdqB0k2lGo1vcGn2SdItaJ5j/zRasPd1wYnbWaniflZr4C6FJUAGYSm2rJ68?=
 =?us-ascii?Q?5BoD8vcf1gKFkfhq4BI+qMconUUtbfEQJemWeFkdJOOc4hQA0Imyahs+lYyG?=
 =?us-ascii?Q?YsbdD8wq6lrY9xRyNtjEVjdOKizl9EBXrVFTOA6NdNHtYaxDHrrPMp8pG7NZ?=
 =?us-ascii?Q?x8InmGU7+uteyy16ZlfMAgAXUXU3ZVe71Fix8V4918iRMlWmn12eEuPzjr7J?=
 =?us-ascii?Q?P6JFUFUhiwy2YxQGeeQvLm5zY+dE6oJNtX+T5/kHF0bIIhfdwKoi5Ttfiko7?=
 =?us-ascii?Q?fuQNM0cvn64/T3sVJt2g/69KztE6sl8WmQBe2UVJOW+oOZFCDn+86OwPbGTA?=
 =?us-ascii?Q?6Uljxw4mDQ/GRKd0NX1M56ZoPPrgVNcQSXXfdVdEc3Kn+TMDM92WpQAuk9tK?=
 =?us-ascii?Q?+SHooNENXRfHFvSDSaRQIbC/JdII8RGwsmV1UFkhPOxAytk1FdvYX21tDGUs?=
 =?us-ascii?Q?M2A/pKzdo44dc2MAjmlUQ99EaRjdZKZMkIUr8NhXaKnaDufk0IeXfuhqSCkk?=
 =?us-ascii?Q?5Qfi1A69Cd1iT4SdyvBYDIQsrJwlxLjHp4E6A1OHgh26DNcMkAkJgM4haFqW?=
 =?us-ascii?Q?qxWTsWNURZtl63S1NfiqZhWhJw/PVwYRLoYaZy9EoRmaCjyWAynu3xG2bs2r?=
 =?us-ascii?Q?0pc/fjdOqoiaDkf3ecTaB20rUa1Ok+ZkYCLO06YjrPMggvdAFb3IdPocGDqc?=
 =?us-ascii?Q?JLR4jFi546+7MQEH4uxHReAnu7PVgs8WfqaQd8TmC1ZB5bBlena44BBEyekr?=
 =?us-ascii?Q?n+hvDULSAGZbYQNkbLOVnemk7z8QvoAp0cQ3wn0ZQddVL6QvnyUD1YoYRiUK?=
 =?us-ascii?Q?Xxk70YAiVlK7mnwLallyb90kDz3tDkjXfEA3f7rpyfhCr3RR2jpiGVlBbiuJ?=
 =?us-ascii?Q?G7jsqDqUCDz4DpVkW+Jmvnpoa7N9G2Q/1C65t3mztMD41lNlSFtmRD7DixxE?=
 =?us-ascii?Q?2cl8PnWmh8430H8eP5cCMvyhZwYL/Zl2L5Svh87P+6bBaysg7esHnFZqDV35?=
 =?us-ascii?Q?V2dYtnpFWkTKeiBXWActTV/S9qi/ocKuc/Yvs5FjutDaOJeft3wkqUuAZRiy?=
 =?us-ascii?Q?Tb3RBj5gtrF6s8R67a8XQWbCM2x4FrrFX77+s0mdMUnW1wPldyZIFh9QCbRe?=
 =?us-ascii?Q?V/ns+q0Qs+TdLsaGQ0DxOMxt9Fp7zzXK1CXWM7dKa+EtvF0MZhokzlEbnIVU?=
 =?us-ascii?Q?J+t84iwnwqqfmHtKQE70XF63Tij1ugrw0nTqsEqTzhs4bLHaJrbmdQLf0APD?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UcUF5wI6fa5xMrVtdTveEPeUotR7uVJ1u/z1Mzyns+y87rEaiJRFKZV5M0fXLFqZSjpPlPSMjEgbBEOudA79KsZnjliVj4PY6EhRl/aHR600ZAr1fk3JfyfUKD/UX+gcu34qMENRdDixQwbCwFiaCW0FlMbIq1LtUBXJKaMq3aeM1jIGVcqSS/m8kKfSvAY70jww40KOq3vxoEIj/H8rF7YejRfvqO79bZtWPIncyjVqH1UCAOgS+LyC8yKSrMCD5WuIPG7GGVBZQZ6CiqSpTp+aVmIXgsPAiHJZnk/bNEvj+xX/qUnNALY5GYLckf/8s3KrMbRemLZlcXs2UjH6EKgMbsHXigpUFLJ4szgpnfJJC1hdikm0gfAdgAtiyJRzmj146PE4LpzsNzYXE7dtZKz8o+MN9T/UbJORS73LahtjGuCTTkUga7zClmoeSjaYAtiWFLwBZ2FzbhEsmgNh/VUtPQWNTLPFuX7RU3wfbKMroLDu+baXxZguTyQRhTnsxB4V/1UEfH2s401XX59tSkSLHPGTuXdpeMX4vz1mQpYPbqpJcxD4aRoqzeZw+hVgL6GtD35CTvQrfTx27wTyKnvp3HN4FLUPymp7nGftsBM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ac0cf3-7744-4236-1137-08ddba50dd6d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 16:44:23.2288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gp0bRcQrYgxg4Gj1QaDmUQUK45EPeXqu5oi6vxtkRhGqA0BcNWCRuZAYxvxfWDgYJIqt+qaS3sxCykplvxR+IL9csCy9tK2r7MyDOaWxUcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7009
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030138
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=6866b36c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=o9Bndu9mg3UTnu6ua1sA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: mK-RY09Zn0ccJbzH1iKgW4BldHvIs1JG
X-Proofpoint-ORIG-GUID: mK-RY09Zn0ccJbzH1iKgW4BldHvIs1JG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEzOCBTYWx0ZWRfX8CJW32THnaXe PQts1RPunGH28OnM6mJxpkP2Xq+VsaipwFw2M7kFtEzBwUpiJSDDOXVNJBx3Zk9W0zCUbhZ04Kn QQjlqrY5gm+Lb1l07G8BeV6SugKOWu0bbZIBBeyMwWeAbuL47YYxq1Ml02FQXZXkwb4ZDYd0//C
 pIYHHuK5eMOM5PJbLBtAK8qTYxwSMXPJZQiqNpo8srD3wMYqjkYVoK6QWj2kosT4+o6D1yaHwkF LH9wwD4FvZ2XQV6oz0VBi4C4mcjG+wnCfZAbgL/eMPWSwICWJMpP7bC/CdpR+lkxvfsUMbTFqDz 86o+S9sg6RTWBWDmUdSnGe9/emy7iW5lhm8BXPtvt6KbDYc30jxypYnp6yki2Cb/6RdOmttFMmW
 ddIuToVJ0pFyeP6wcN96z49DZ213khaUpJUlAWESe6EF9ysURWpYx7NSkJFJXr7bUXBUgMAF

On Thu, Jul 03, 2025 at 12:26:17PM -0400, Peter Xu wrote:
> On Thu, Jul 03, 2025 at 04:55:01PM +0100, Lorenzo Stoakes wrote:
> > > > I'm very concerned that this change will simply move core mm functionality out
> > > > of mm and into drivers where it can bitrot and cause subtle bugs?
> > > >
> > > > You're proposing providing stuff like page table state and asking for a folio
> > > > back from a driver etc.
> > > >
> > > > I absolutely am not in favour of us providing core mm internals like this to
> > > > drivers, and I don't want to see us having to EXPORT() mm internals just to make
> > > > module-ised uffd code work (I mean I just will flat out refuse to do that).
> > > >
> > > > I think we need to think _very_ carefully about how we do this.
> > > >
> > > > I also feel like this series is at a really basic level and you've not fully
> > > > determined what API calls you need.
> > >
> > > See:
> > >
> > > https://lore.kernel.org/all/aGWVIjmmsmskA4bp@x1.local/#t
> >
> > OK so it seems the point you're making there is - there's a lot of complexity -
> > and you'd rather not think about it for now?
>
> This is not a fair judgement.  I think I have provided my thought process
> and how I made the decision to come up with this series.

Sorry Peter I am not trying to suggest you've not thought this through, that's
not it at all.

Maybe I'm phrasing this badly.

What I mean to say is - you've implemented effectively a minimum viable
interface, and my concern is that it doesn't fully express what you're going to
need to actually implement this in reality.

And my interpretation of what you say in the patches is that you are basically
stating this. But happy to be corrected!

>
> >
> > My concern is that in _actuality_ you'll need to do a _lot_ more and expose a
> > _lot_ more mm internals to achieve what you need to.
> >
> > I am happy for the API to be internal-to-mm-only.
> >
> > My concerns are really simple:
> >
> > - exposing page table manipulation outside of mm is something I just cannot
> >   accept us doing for reasons I already mentioned and also Liam
> >
> > - we should absolutely minimise how much we do expose
> >
> > - we mustn't have hooks that don't allow us to make sensible decisions in core
> >   mm code.
> >
> > I think overall I'm just not in favour of us having uffd functionality in
> > modules, I think it's an abstraction mismatch.
> >
> > Now if you instead had something like:
> >
> > enum uffd_minor_fault_handler_type {
> > 	UFFD_MINOR_FAULT_DEFAULT_HANDLER,
> > 	UFFD_MINOR_FAULT_FOO_HANDLER,
> > 	UFFD_MINOR_FAULT_BAR_HANDLER,
> > 	etc.
> > };
> >
> > And the module could _choose_ which should be used then that's far far better.
> >
> > Really - hermetically seal the sensitive parts but allow module choice.
> >
> > You could find ways to do this in a more sophisticated way too by e.g. having a
> > driver callback that provides a config struct that sets things up.
> >
> > If we're going 'simple first' and can 'change what we want' why not do it like
> > this to start?
>
> Could you help to define UFFD_MINOR_FAULT_FOO_HANDLER for guest-memfd, and
> how that handler would be able to hook to the guest-memfd driver?  The
> kernel needs to build with/without CONFIG_KVM.
>
> What about MISSING?  Do you plan to support missing in the proposal you
> mentioned?

I'm simply providing a vague hand wavey notion of something that doesn't expose
mm internals.

I would have thought you could figure out ways of doing this kind of thing, or
providing some minimal and safely controlled hook for the different modes?

It seems odd that on the one hand you're ok with providing something imcomplete
- but which exposes mm internals here - but then require an entirely complete
solution for an alternative proposal.

Exposing mm internals to drivers is just a no-go.

On the other hand, providing internals for -mm code only- is fine. If the
purpose of the series was changed to expose a simplified interface, that could
then _call into_ mm code that used an internal-mm API that'd be a way forward
also.

> > > > Well as you say below hugetlbfs is sort of a stub implementation, I wonder
> > > > whether we'd need quite a bit more to make that work.
> > > >
> > > > One thing I'd _really_ like to avoid is us having to add a bunch of hook points
> > > > into core mm code just for uffd that then call out to some driver.
> > > >
> > > > We've encountered such a total nightmare with .mmap() for instance in the past
> > > > (including stuff that resulted in security issues) because we - simply cannot
> > > > assume anything - about what the hook implementor might do with the passed
> > > > parameters.
> > > >
> > > > This is really really problematic.
> > > >
> > > > I also absolutely hate the:
> > > >
> > > > if (uffd)
> > > > 	do_something_weird();
> > > >
> > > > Pattern, so hopefully this won't proliferate that.
> >
> > ^ you didn't respond to this.
>
> Can you elaborate?  I don't understand how this is attached to this series.
> AFAIU, the series is trying to remove some "if()s", not adding.

What I'm saying is that is a _very good_ thing!

I was just raising the point that us doing anything to address that is
positive. But it can't be at the cost of the issues raised.

Cheers, Lorenzo
