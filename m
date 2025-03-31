Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012049.outbound.protection.outlook.com [52.103.2.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B857D07D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457538; cv=fail; b=TnZwUd5dzzJ9RBwZ8zwNVhyDXpSGVlLr8zKq4y8Ook+DSIcV8oF/hLcSJsnbR9eYjPld4+sxDrnzlOBrbGJ9Cd9Xfnmp3JI31XplozqGp6Cl89gF5MCT+5B5ddWoVHVXLqu4OOh2dtMoPKf+NKOio7vMfYXsF1toEHTqIaiKV5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457538; c=relaxed/simple;
	bh=9yT9NZgpWxkQhMMDK5yIjbyJZAaMdVJXiVahkT6llT8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mQfDkJ8wDwOSGfp5fzhPluiiNPEQHlFzQfXjb0ygCu5Iv4q/cYQHgwJL6yJLZbH7SU47c95NM+Is2fY5+MXMjQzahodlC6rUvnQgsIZXYLF5mltAQe1rut1lo+nPkg9jtJlGy0YbDGagEcU0knh37NqLaqDZNHX8C/xRUhiC5tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uB6MLa4n; arc=fail smtp.client-ip=52.103.2.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uB6MLa4n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkxt4CDmeytfsqPRbgTH2v0pI6lSnKsK4oCzer2r6oWRetOz4scxkmP+GLyr49dgkUhZ8kpNFRH5olRwOcdN3BNwX2LjkPadxDfarY59672Ajx9JsmxKAqHKclut0TrUiAHor1oTT9NEBo3qrSIv398NjO0U1eK/eoOj7s2agWk5rcSejWRK8Novm+at9/c+30LVg62GeJWF45jtdnioDe9W7qRBcMXXBdNadKIEW7wV474jRUerRRjal0bNDE5KjR32tqPT/39qen5JRmyGwW+TcL9ZtkWJV7UzP203wIaKTzKkTBUGcvJKk4jq2wXEZz55FLGGg8dPO6uctayB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGiuRasQG3c+xhI8mssM5UrFVkfR7c6OSVr3bZfuId4=;
 b=o7VPLPOsFTJHczo+JIG+Nrj3wXPbrwH3KZtLdZTwVNdX8el+9tBRwc0HTE6to0V2Gu0ZFfpk4PLHFnYdLYNqvyXzLrohudER7W/Om1hBh4pP+p9KE+r5PpCQLkNHCStK/Hken9bVHPYaJtKhS6twxaXDUANpRLTEwtCKrPbDmylt1PmJspmV+JOal9ZuvUjZ5tZ9J8nEWwA4JrFrfBZkJsYbTSYMw33iUmYTCpK/1fUolrztEOmftyFW98sTWgciPkbbpdeyNjiteJ34UoohBpdfvhczqY2DCsOfdm8FafI/t37EUB1SuC1AiexwJzNYpLjdXL0Tc288VB9NGQd9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGiuRasQG3c+xhI8mssM5UrFVkfR7c6OSVr3bZfuId4=;
 b=uB6MLa4na+EgISWp2rajWryoNPl3eVTEyiiCd7ffUlf8/3j3F8gL527U7RhCQcicFabXCRkOFo0faXxv2jLXOW6QIhvs0ro1EvCDa5syKWFM6VFh6GxEGPtdwAWSTBwTlYIz5ny0XtSZ/hvu1flIBTEdlYjoEtTaCKUrhQdYzqx9z5/7RO1Eyow3ryT2NPlMsqFqpKDiFNXRA5nDwBBWuTp6jCKDYNg/htPVmFyYKpAAaYDWgjUH20vXWwgGLD3a7gCRhxkRcKcvQFN/L57cbq7fJlb/JvWu11PnfnDtixgS9wpuyC9JajaLwfbf5VYHliRxDAEF8QVRVeHWWrWYlw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA1PR02MB9775.namprd02.prod.outlook.com (2603:10b6:806:37c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 21:45:34 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 21:45:34 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: "linux-mm@kvack.org" <linux-mm@kvack.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Questions on .fault, .page_mkwrite, and .pfn_mkwrite callbacks
Thread-Topic: Questions on .fault, .page_mkwrite, and .pfn_mkwrite callbacks
Thread-Index: Aduihhd+rA9P/XX2RCShvzv440oggg==
Date: Mon, 31 Mar 2025 21:45:34 +0000
Message-ID:
 <SN6PR02MB415777C2C9C15837BD413B8FD4AD2@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA1PR02MB9775:EE_
x-ms-office365-filtering-correlation-id: cbfd5f22-4881-4875-5898-08dd709d5e1d
x-ms-exchange-slblob-mailprops:
 ScCmN3RHayFXX0mVJp9wZC4LLIW1QoQ+OCUJXP1rnt0dr7v6oWGddT2hf306YIjQgcy7nocYSVkE+83ivV05kt+r8gkq7DhvNPao52wvBCXd30xiFItwNwyU4XUDpgxJRArrS+xnmDniv5EkTVxeL/S4Jim9tBhVL/wSGbAZJQZwstxYBY9+ikqxR8m7Xwt8IjXWj4Wyv7OOTdz3Md+bROblI69QEQCTmOmmvWFwzzhHSMm3LipQ2McxzPmWIFBBqypyKFz8BCrlzjqzgCmDvZBeSXgjiEKAmscUzOqjLKu8VjE5IZn/ywhaVhB+9787syxpmI1c4Jyr7cWTEd7EHqOy/AJZFttkmvNV2i6Mm8DPN1NXLI65Lva+rAV1IXVaaKEp2PajHlap/8BwSDXJvhgaA+zYfppldmvT2AnCikBEEFcRZnn6F/pCgRpcfxNomhyFGpU/g2Lpj1aTaiIIU/dwSwSMR4yyKCDe7dUmKMWpW6SR0BDS4MLOZ5iFG4j3/r4JGPUQsBVNVMdmncD8qww5f+QjlV34TGnU1Dv5Dzp9KXtIBOF/9GO/Q9DHYGBxRkk4vcaA/drFBp/M/lUzCt7krq7K6EsDOzTfMs2/gleLcJCcxpe7MDNCO9JW8e8dq3BI2qNAROa1CtkWub9RpFqXp4VNjs9xxYlE8oPiZRI33HrGfMjK4XoYePYnUJoUQjcdUVzbopL0/xQSQmoMrVrTobzKMj9wVMMyyBBF2yI=
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799006|15080799006|8062599003|19110799003|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gp21MEi/zUg6WRtayBFV6TUWPHQ2G7sFJ3eRz2xhD4wkXM9J7puifUYR5571?=
 =?us-ascii?Q?RIxyE8tj5djQVbfQauv1vRFDoKo5x9jBVq9UsyoT/GHxhlFSfVYx7pwAtQ0A?=
 =?us-ascii?Q?RZarqsFz3mSpxQ54dgdOXDVYJgTkWIFy0CNcZU95XWoULJPmwqkIbedA4LuR?=
 =?us-ascii?Q?9C6thIsxxYlAbPmV6/dCV8HbnivzR88Bcv9m7hdR/f+bPunnihebEv52gPxl?=
 =?us-ascii?Q?ETzmkF+4YYK6tuypLf3gS0iFUtvjpd7azOc3Ji0gSh8yghRqlii4LZMf7gA7?=
 =?us-ascii?Q?FLq34tGvIbH91nCymlSIZuBahMuVuZIW490mEpwCGmSxJMfnEk0qbKGru9R5?=
 =?us-ascii?Q?tSADJJGKDe6ZkjA7QnzwLJJMRrfSmXOGyKat3l4Umy1QJKgwDA2DMo5WkD39?=
 =?us-ascii?Q?RIVPBjzpi3P2AeTea5/WpJpWd4MBlelCdeJp8Bmj2eHno7M4vAP1Vb++sxdL?=
 =?us-ascii?Q?ughSTeOVMqsqdkc0lWybKnJ0PXNGRvJ3CJ2DpHI1lbrBQCmY/ZRcTc8n0Svh?=
 =?us-ascii?Q?4mDQKDFaV6N0A3hsNnYlUwUfS42OuIOJpfwyiL+qH/avhbs61WSdHlEV6Vev?=
 =?us-ascii?Q?EHJ3tfiFWc7G04A61fSQ49DMSvShbq5yOxd7ZYgbFRMERPgVpCVBC8IIvggn?=
 =?us-ascii?Q?4+fDN6VhmNTCNLvo6O16CcSOq1z8umdw6ZWxEbK2hKYG0DmrQkHg/3W1iiJN?=
 =?us-ascii?Q?b4OrEoKZGc4rW339Qz+IslVjMbt9tMUIT2asdTc0QBDPfRn56B6iIVXsMeG9?=
 =?us-ascii?Q?S39F+oFoA0dL3EZTg+X+yyB90L+9wk10FQy+z+1oM/ucCX96GMW8JUdZ6p1R?=
 =?us-ascii?Q?Vf2gI527gNacqjxLJD4r/JA7owXFfZ4lUx/BVvlJovnmaLB0q5FO/fzkZwxs?=
 =?us-ascii?Q?P5wQyrz+wiUYw/ykuDaMgKzddCMRHbKhXxZdX6avvZe4uoAohupEcBIXjoQ3?=
 =?us-ascii?Q?T8D/wiucrHsQC5pOFR+K7XSF/JcK1HwxgOctPNQIOCroHdByshsHAfy7hry0?=
 =?us-ascii?Q?MnQ5YliAIYLMzErw+O5UUmtuwfEciesuEWmZtt0FiWdcBsI++A+1Q5nPzP4Y?=
 =?us-ascii?Q?IpuuAyme9BWH9ymppSK/yivVhkHa5kJ1qMXh9Weg6hfvDtLg5qxnuVikjmnJ?=
 =?us-ascii?Q?ZaVTGBRf75a5?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AdTjdMmR3LBm63gehilP+LpM5oaIYtXS1wuUOgabuTumZzz+PLws+uPYnmpv?=
 =?us-ascii?Q?UZNxwcWPuxK78NgB4tMVRnnzPv7ZR8U++E2ddglEF8uj932OJFKoqEdrCKnD?=
 =?us-ascii?Q?Ad1ONCtoXegsJaNujba3hreLw6Kpn1XZh57NaS+0b9GMTQ3ATQ1lyIQD8uEP?=
 =?us-ascii?Q?OAjivK4Pr6cN+3lRuPFwLablEkZcSlAzkAvprok673aFpkOFJsn2LlLh6ita?=
 =?us-ascii?Q?UTp+D9JdQnxkjE5tQ50cBLCWNsjXziGLwj1fKFeaVU19B8a1fC/fREOES9rc?=
 =?us-ascii?Q?wmvF8Cia8F2eSOaKyFIcOs4usH/A6w5vyWzQ9Bodd27KigIsYLwHHXAeGaJM?=
 =?us-ascii?Q?os5SNK1GtOCrUYdwrPsBkG67xVdm38o9f3XT7XZW1OdyU3bfN6f6o92G0aNn?=
 =?us-ascii?Q?qJvdsoUtfuyIEB6XzRY0eHd85nsI8Pvd3076EREKXXLocnM4Pdl99NSzw4Mu?=
 =?us-ascii?Q?WhFK1wFe4m9TxEZf2lRtxhO+aIhvV+Qs/wG+wVbKbK0+bt/hBnlYZ9jdgm++?=
 =?us-ascii?Q?Wzecpf5uSSueYP3KytUO+Kc0lhmRT+mA7k2EGJQOra6oBqDza0LG+DmKytLR?=
 =?us-ascii?Q?ELTeU15o06xIh6PDOy78xJdl9+TNx35wXGvvm91cSp3ee3FSaucdGBdHx2Rj?=
 =?us-ascii?Q?k7G6XaOHlelJEbc47YtlnqUHIBHGbJZ7uHnclA1XgfEbTFFBD13q8vNKlXIm?=
 =?us-ascii?Q?LRcm8DeceY+2xBLE9eamZqTpo87Yjy06fzzLVpbO6QnNlbbh5BDPCubAMm9i?=
 =?us-ascii?Q?xmcuJ9YXgOjFiS5xTqGXX639aBlUQxAK/zEVAu2RCeCYac+wiKvSq4vlc4lg?=
 =?us-ascii?Q?mhZbMtSgZfNlpfAvGT6ecmmHG6IraJqXnD4EP5XpvdjY3LDPxCvwpaoZEBxL?=
 =?us-ascii?Q?DPvXnDm90oESm1Fi4ALnvJpGMX7j4Zo2BVleVzJsLZlYTMA/zXioVyLK+GwJ?=
 =?us-ascii?Q?vX6sdJXDD25I+EH41abn7TfP1ZfAa8S5mSC1b1pRNpz9MFx5aFUBU5hAnxzj?=
 =?us-ascii?Q?3D6HZlzHxOYMHzJ6mey32M4nEghKvT8mSfRJWsg2wHpRyx/1aqNZxD0AneBT?=
 =?us-ascii?Q?tmWKQsDRj4V8HWugouPtnsUM3+r9lC9jo3rJlWjU89FYEAQWvoCFNAn8atIo?=
 =?us-ascii?Q?/fiauU7tNLJc8pkiGdQZ+BEuOdosXzkcUyekDMG2jrAcBNV2vWn/7s/d0xwC?=
 =?us-ascii?Q?lEq0sab3Rwhxv+FdXmYSG9q7ogRTtJEfFT3cKS2uUtPVpUr5hEKhZtdDy9A?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfd5f22-4881-4875-5898-08dd709d5e1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 21:45:34.7332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB9775

I have some questions about the use of the .fault, .page_mkwrite,
and .pfn_mkwrite callbacks in struct vm_operations_struct.

1. The .fault callback can return a struct page pointer in the vmf->page
   field after incrementing the page reference count. In this case, the
   .fault callback returns 0, and mm code inserts the PTE after the callbac=
k
   finishes. But alternatively, the callback can use vmf_insert_page() to
   immediately insert the PTE and return VM_FAULT_NOPAGE. Is there
   any meaningful difference in these two approaches? Is one preferred
   over the other?

2. Same question for the .page_mkwrite callback. Additionally, this
   callback can do lock_page() on the page, and mm code will finish
   write-enabling the PTE before releasing the lock. This locking enables
   synchronization with some other thread that might be trying to write
   protect the PTE. Alternatively, if vmf_insert_page_mkwrite() is used,
   the .page_mkwrite callback can do its own synchronization.

3. Finally, it appears that for the .pfn_mkwrite callback, the only option
   is a vmf_insert_*() function if synchronization is needed, as the mm
   code doesn't do an unlock after write-enabling the PTE (presumably
   since there might not be a struct page). Or did I miss something?

The context for my questions is the fbdev deferred I/O mechanism for a
framebuffer mmap'ed into user space (drivers/video/fbdev/core/fb_defio.c).
Current code works great if the framebuffer is a vmalloc() allocation
because mm can manage the page lifetimes with the page refcount. But
it doesn't work for a framebuffer allocated with alloc_pages(), where the
page refcounts cannot be used. For such I've marked the vma
VM_PFNMAP, and added a .pfn_mkwrite callback that seems to work.
But I want to double-check that I understand things correctly. My
.pfn_mkwrite callback does:

     vmf_insert_mixed_mkwrite(vmf->vma, vmf->address,
				__pfn_to_pfn_t(pfn, PFN_SPECIAL));

to make the PTE writeable, and returns VM_FAULT_NOPAGE. Using the
"mixed" variant seems like a bit of hack, but I didn't see any other way
to handle a PTE marked "special".  Thoughts?

Thanks for any help,

Michael Kelley
