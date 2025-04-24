Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B01F153C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479356; cv=fail; b=GA1DTp1IT+tFfotDQld4TCeWdVE8ulQSYdIlyZXFg6DtBKtdMNpkiESw0cSw/Qz73/xW0Rnmld//eSjoFw62RDwI28D9QYHq1IUv8SdMq22mlPluj6Z4+drj6H6eS5LWlMMO9S+Q4QlZHKG4h3eNANEZqhbzOpDvIuq70SSi1m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479356; c=relaxed/simple;
	bh=NaF/+KIIGyG5hQPu2p6pLyc75+s+UX9aeY1hVPVRX20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EMdHxvVjrPcdD5NHIh6D+fBkOOq7NRDckdB0x9fT8V+jotE12gMukmv4c7y852BGPQ1rGdJsVK4MUXfExHt9lbg7GjxZhKdaZ8jyIkC5SHTTn7sJvpiF7T1veqb34gNTHM6bpPTYrXjoYeNrtKclyOryvuKkwA7b+mVgBtIL2Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Luu6qS6O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zgecQm+r; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Luu6qS6O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zgecQm+r"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O6ts84005462;
	Thu, 24 Apr 2025 07:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=NaF/+KIIGyG5hQPu2p
	6pLyc75+s+UX9aeY1hVPVRX20=; b=Luu6qS6OS98ME9O6yizGRKG4aZHzaWRaLm
	GcYMskCdaSVLVeKp+VH/ha4VRllMXV6t2NMCDpSdn4dEXg3YrWK/uq5Kay2BJzoZ
	+zZKTs3bCTUv/5W6Ol/PrxRSUwR3MKEZhJahBuREl2bk9x4sjZzYTXlipwZ6fmR7
	PIZ270e4etR12mJ7+XzHDpyvPeIebbIB9VMEHjNAzlzZbrgBuvpSGmj6gN2wMnW/
	72qUYO3Qn3ayim9fATnQ/X81ZyGCCIJYpWL5R33tviyMvbnoL+y10As9F2VnQ/YI
	93EwiQpGitxEX7FeFkVH5I0qliI4R+TRxj1N3lJW2w/kHRtLZO5A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467fmk83uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 07:21:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53O6NIbW013846;
	Thu, 24 Apr 2025 07:21:30 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010001.outbound.protection.outlook.com [40.93.6.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jxpwbhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 07:21:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qw51e0gYkAyKRk8Cbl/6JwxagyXUM936vAojNL4kCcNJ94cWyRk7PsMRgZ0d6mLgzcgayiMblmjcG6cE5x17Laa8idsOf7S50ZZ/4/hp2Ow7ShEw/EaI/uTEwdn6qQxswlhzTWCt6ZUtPeoesREbraE0jRO7lo63xlLCZMkgKHHzS1fcMl+5a7qKJ8aVL2UsdhP+tWE1glLpu0RiOmgRSxOZdf5B8cNTwx2rrIkcBFuFYH6wPPU9/uCigaS8SBGxrYirqfcReDItXFnweMBHx9Sc5Jy41oEjnLB2XRKPlxliwsjDh6D+FDq207I3Kn4e8RIBgFaAIHWVr1+LaSD4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaF/+KIIGyG5hQPu2p6pLyc75+s+UX9aeY1hVPVRX20=;
 b=BjpwnEsAodz9UhCmsmpKmXI69cX3PAqzsyCIARvaApbjv/8ms9puFURYVdqeeqZVEP6Mt8I/f01agUS4J4VMOZgheKRBKCxKEcic+Io+MJzaG6Zgd15gfgzx3b6MgthB8ZumYFpMLSuL0hAqkHOKJE+ssxDt4GIH047e3Wgnnext+/s2II5EZKFOqq8AZnOrBQMZwgRDeXdBDdIbgaCMpcuzWjSK3A8bXDyy7eRAy2h+cCYeyYA41HFRpdhounVJKLamU6A1KQUv7G/xWrR8ehpGXFYoBOH0dOT73cXV3v0ynVgJ25jJ5SOlXakgwR2POQm5APqpVHPledH0rdXChQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaF/+KIIGyG5hQPu2p6pLyc75+s+UX9aeY1hVPVRX20=;
 b=zgecQm+rKbCdlDLn575waaKaiGSIgpiTwP7PuH30D9J+P9dyu2kTjAvZpsQHbaZpg3qEAp4B7B38ff2ir/o68gn9KOkZMR28UryljpQcSCYJoY42ABN7bDFTjILKkbz2rAgvHDm+Gf4qyOcq4jla0P2n4uilQ3jAdUmkQuo2+F0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Thu, 24 Apr
 2025 07:21:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Thu, 24 Apr 2025
 07:21:28 +0000
Date: Thu, 24 Apr 2025 08:21:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
Message-ID: <33b972a5-a137-4b5f-846c-614e5f83409f@lucifer.local>
References: <20250422144942.2871395-1-david@redhat.com>
 <45b26168-93c9-4170-b7e1-4b51078a04f6@lucifer.local>
 <d3f71458-8c0d-44c9-9a03-868efceee93f@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3f71458-8c0d-44c9-9a03-868efceee93f@redhat.com>
X-ClientProxiedBy: LO6P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4429:EE_
X-MS-Office365-Filtering-Correlation-Id: 559434eb-8c92-4bc1-2e55-08dd8300a0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r0g49aj5NwFD+pgBXGBcc5EI7W+Vr3EcCu5JukCkZ6Sp0X+BAwoX219sbZjs?=
 =?us-ascii?Q?jd93EkNEWfUzGE8DeYZq+xOjCkPMHf5xpNvV6Xnoqcnza3wRIcT2PRCo6PQW?=
 =?us-ascii?Q?g9adyP4bgBV4XWA/CthDMEHnDveBZ+sWxq5oCt0ZqNUqnhIhcfxvJJMBvgag?=
 =?us-ascii?Q?cHjzXN5GeOZhuxok6xIJLqj9VhN8f59h1w3m1ZM9PdEykT0hIwloUlOge6Cc?=
 =?us-ascii?Q?r/w02HycQText31GYsh01ob24xTne6Mv7AF7w73fvZ58ay8bylkQRyWRXvN4?=
 =?us-ascii?Q?oQZZdKz55HLTtW4X6ow3PuAkXafXJPcVSeNXjptFX+lBtEWKJ6oI95FsV945?=
 =?us-ascii?Q?V2raOazxQ4Pd7hLjtoAaZsFxjgsB1/idPsH9/moKVdY77Udd6iLrPChoVSwk?=
 =?us-ascii?Q?1L6WQL8vLeeY3zSo8LhFGhlE7AcrXWHQiLJUC6rx2S29SwZ1AJpABChq6OwR?=
 =?us-ascii?Q?/hRjJ5V8uom9cUHWpKu4xHYeInshVFABhAosFl6j8BnyPwiwU90wV6T/Cad7?=
 =?us-ascii?Q?rXHSyBk2aw8Atr3p7jdpFfSQVvkQ4ujBTSo+bumyF7r/+zvNR3NkCbqGh0/H?=
 =?us-ascii?Q?wMU5M8GE+iyjeYGlqbchC5f2dw7FgJWe85ngC1uPjjjUAqLjF3MkJMN6t1Mv?=
 =?us-ascii?Q?GUW+UEDfFvvdpSjha+eAeGV7WgDGZ+crilNioAb2KiT+7/zo+8lWHPkwRX75?=
 =?us-ascii?Q?iRIoXdkUYHLnitmwx69nh0u0L4D4VEw8pOXzkzpLtFu+JCW4L6AmWfQrYHww?=
 =?us-ascii?Q?/QI2TZdNwvCK+K9lwFgtTA8ZiS9lmFyz4cCbv0kIQnhzXplzcBhaXeAIJdxM?=
 =?us-ascii?Q?P6jzwftbUwW4rjOW4VvbK1sFzyUU5SjFRpMTICnixQce7RhX9TzGWdnShChA?=
 =?us-ascii?Q?dbH9YmClIE4LogJuEppg+EooQTkPxLuSnfKAXKTJemjv6B81wczfIHQx4oSf?=
 =?us-ascii?Q?ehwrE/sLnJkJeM+NinFGNSDxJWcxrAUlAbpSQAEvsVm+Nc7j6ANA09wjenQH?=
 =?us-ascii?Q?+2Yn9Xn9ehMDGT1cNj+gCwgK70jkC9ALNCTEgqoJVS+G9frwVrdb5vcf2fcc?=
 =?us-ascii?Q?PahiBMqX5SwVA+N0htThBPoukJQYczduNAhX8Nrz+PKb4hjP+j9DnTFqXbmm?=
 =?us-ascii?Q?rb+sShqpCXK+dkP6abZpcY/ILQmQ1pyz7HBxNnmo9GSNOL+P++XL5uA+SZBr?=
 =?us-ascii?Q?YYIm7g1+bXZySSk1ricdi3KPjgJFfqE9HLR9ptk4U5BtyjkLfNKtoOq+TOCH?=
 =?us-ascii?Q?xiNFC/vsEVTXxRQXtfYKwvadtThZ+MzS/z4M/tfAipwA+kcXSjr1l+b2QigA?=
 =?us-ascii?Q?SRfqyKtTtU4VDj5EBJNy9IB+dOEaSDdNN0lPdOpKlCnDSAVoa7ebQVRtlbnb?=
 =?us-ascii?Q?XDTWSovb6198A7LUVEiXko9FmErgyF8Mq7H/kIa7/EHTRv3JHAA1rSR1Gpor?=
 =?us-ascii?Q?+Gp+j5pwzDI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s+RGZ2IWZ+AZSgOkOuayJYJUqMKuXf0fCaCpi0QPHHAHV4ngHKfKzA9NY0Ho?=
 =?us-ascii?Q?CypUOL2h4GHSd93/OT2CCrCJQtvzSSKdV7HL8LtZZvVvFMXncHb6JL9ih0Eo?=
 =?us-ascii?Q?SAUz9fJJ7hNzv+7/i5qS9lA6JPEbYlV9jMkyIwPk8vKFpbUKFp9A+4YOqReZ?=
 =?us-ascii?Q?AE03PGw8gnP7XIDMdROLb7hia9Ue7eVuQVq+QrMX2G/0xQ1xtybGA2V/S/gA?=
 =?us-ascii?Q?bAKbQEcsJDWlytWRzSTzCjYOteVCt2U9KEJ4HnbmEAkElN3jI1/9Vj4ieYOU?=
 =?us-ascii?Q?N7lxp+XbYUgD25YgnEBKt7gTJQT+0+HFqMowFr2b74r9mCbONKbern4iyXyi?=
 =?us-ascii?Q?9V7sb8qA6/D2x//3fH7EEd4CqsP6OPbeD6EucMx6Kfxwh3KIBZhu9hFDPC0v?=
 =?us-ascii?Q?JbVXxZdwTmVxd4nVVqtP8TJdekvgZoFxTgBtIhbCmVVZLQEWSnT5UU0OGlfF?=
 =?us-ascii?Q?i6zGNpfQZrL9R/XOcj1A/lmNuv65O1KYPpwBOPz5yspysB2ZwqY4IIncE4VM?=
 =?us-ascii?Q?nnWqBwrnOTA9TB2RfWhQDjuDoIrQXsEn2HkW5VaIkQ2IR6z0IhkQ4CYpNaMN?=
 =?us-ascii?Q?HegD9L9WTW8empGqxL8oCf13E3MioqRxJT0xOFGJg6Z+/dx1oVEA53j/P9PC?=
 =?us-ascii?Q?9YgNAqVMUePrNJ4wnpOUblWybpdt35R2+91DUO6jU5ZC7yN0T46bohVzK7Ca?=
 =?us-ascii?Q?qfTj0dtAEb2hKl1AzuKP51CWRJVEvzd1QOxEwujoM5jjD4GvTYg01LTfKW+F?=
 =?us-ascii?Q?aAIhxnhTU8q+SmM0mCW+R+Sv7OpRb9V6QmYcgfpQBIEFRM4RWQq8qR3nF+1d?=
 =?us-ascii?Q?fnd1TPiOZ96x5qF/Nl79b/4mboBJL4De465xg24HLkvb6DJZvx6BdSsWkDPK?=
 =?us-ascii?Q?YHAP6wZXuYqyg/W75UVfQzRQkurgB3A8UuI5UaYELaRXsOqHtTyoDMCVcsPk?=
 =?us-ascii?Q?sfwpQdd/9y49Ad7R9PZ9x1kGarXR+gX5HnyxM3Vtuf2Dvy+eLNElzC6jRNml?=
 =?us-ascii?Q?C8ZzNBWyJUON5z04zvzVJcdn6RHMTkwxP1Vk5h9jiH7zkWSeLswWHyaoHdzr?=
 =?us-ascii?Q?9zJilTNplJj9ZA/fsGyVDyYJxylC2vA1l0DCfYyEy4Y30Vtp/PHK1V5sVFZK?=
 =?us-ascii?Q?xh0Aj+QQ0dJAnOS8t3TST8Z8Ye5J+2VG0316B3qDyD0W8ehS1FNVvxmh44qy?=
 =?us-ascii?Q?U9zgfNrH+uUvzO4JloGWsy0kY6YGZbGofQ1RYqpkqorGBs7/dfOxTy35JWP2?=
 =?us-ascii?Q?U1AM5Yc8Y4wBOF4UvyDEknqk0MLqT/5uVztxnNC5UW4UhFfCZI8V0f38hru0?=
 =?us-ascii?Q?YhdsJxkmR6DQETSjKKCT+ez2z2yQu2IvKth1RnKRsaqoxW9O6du3UJF2JrBM?=
 =?us-ascii?Q?mfcXLPUgrqXKAOrpB+geak9TQotXI9lCpKsgwn6a9wk4ZR/PbnyS4NkHBxSA?=
 =?us-ascii?Q?DkBcA4/wJumPmmMtG3WIWQzkdYXL9azXQ2UwphhhULL8/87OuwALhi2zJhzu?=
 =?us-ascii?Q?oiw9+WZ4iNSvL7AiVPBwiFLv3ippMeGB+N5qapvmn+EYBP/Z0ykhbkoOLbee?=
 =?us-ascii?Q?c0nAu7/7JmomLKYY7HOReJVFFGgjvE/1avebPm8MJz+c/8UJpmQ4EGxwG4Ua?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ogbQAt+VYBViWC358+mNi8R4nDYc526+Klr2PU02l9PyD+7ZyT2PjItY0aHtKsslwQ6tHA1rfPMcp+W0PK/OoflYq1ra+UTXJCcbWWXTPOk5CO2yk1FYIF9cW0/GAx91ewjJCMRA4C5yDLPNT3KcXVNc9b1IraJMguC79Dxmdx0c1NpN/dzv+sYyn+gjIeyio+KBljW4QqdETtw25ypAk22w/qMoiTfAgPN2goOtMUwBbe0CM0FU/cVb4gR6lMoAvePxveWAZa1v/99MkUHxPLaVrAXortB1QJ3tRnDlFBc89hEnzuBJ4ugWMQ0Svr0nx9usllKXK3R+fDgELaH+PL6Bq6J/MgoVxN9HzRsIWCA4kG9PfYN6TBpXTUcr7rwrQYORu7DikvnpsGc8duVDpm3VVPIMiOXMBCYdSsapa4H0lMMe4c/tfq6mog2gFZ8bf/84QD7w47Ew11BxSYVYE/xRVBmaVWsPY4eDQtfxOh5Qdmy6fvtfJt+Hoau4E1focVg0eIPg1AurcmTO22ixUeY7+Ir4dOoi7+pQTTamJhnoUK5mgOSn+o3fnkSW1/5wKWVMvL4RUq1gyo73AV1CIKR2PFjBaj6G5+tWqVydMgw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559434eb-8c92-4bc1-2e55-08dd8300a0f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 07:21:28.1021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wz+sCGLdJvZEJVadXcU8gl4sMWStpizevnhGADJALBZYa9LM6yiL7DV87XKkfkBD4mAXCi3ba9MiLaAETBN2ZKkyF3A/Y/5ojxkhgC9EPnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4429
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_03,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504240047
X-Proofpoint-GUID: 9PpogU36fJwV3hUfhKz78YSk_QLrjW0l
X-Proofpoint-ORIG-GUID: 9PpogU36fJwV3hUfhKz78YSk_QLrjW0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA0NyBTYWx0ZWRfX/mMT64sZpHNR ZjHsWxCNPieNv1ERPJgP/OKigbl5WuGBMfF85w6LmhJFrtZRIa3jNWc/thiXiSEEhgxhVfFDcKT k0ZDf6R/ZwtjF6iLQ3OmOWjOJkSanv8sRouCUmVrPETPn+8A2vUMW6AHEphjUvQSljywnm6im39
 pylOa9wCJjqsBiz2hIbxKVf4ACDgq085hQVfI3JX3J3NGIRo276ZdbB+ns3lrK8duet/S7XCxgJ konHm5yO/2VjSEllFueS85CM/3E24rPDB+muC3H+p10gzoYDaxsqHLRbKxxhrGceDPPsd0mkqeK MDEX1ziRK30pXBKTzuNf6egCWtqekIgpzC4WfLGDd16FUdFsA6OVsECH1QRkITiuIz16LE0K5nr kTf4WRvn

On Wed, Apr 23, 2025 at 09:30:09PM +0200, David Hildenbrand wrote:
> On 23.04.25 16:41, Lorenzo Stoakes wrote:
> > +cc Liam for the vma things, and because he adores PAT stuff ;)
> >
> > On Tue, Apr 22, 2025 at 04:49:42PM +0200, David Hildenbrand wrote:
> > > Not intuitive, but vm_area_dup() located in kernel/fork.c is not only
> > > used for duplicating VMAs during fork(), but also for duplicating VMAs
> > > when splitting VMAs or when mremap()'ing them.
> >
> > Ugh this sucks, I really want to move a bunch of this stuff out of the fork
> > code. we have some really nasty overlap there.
> >
> > This definitely needs to be separate out. Perhaps I can take a look at
> > that...
>
> Yes, it should likely live in ... vma.c ? :)

Yes indeed this would make most sense except if fork needs it vma.c/vma.h
is (very intentionally) mm-internal so sadly can't live there in this case
:(

Anyway on my todo will find a place for it in mm if possible... :)

>
> >
> > >
> > > VM_PFNMAP mappings can at least get ordinarily mremap()'ed (no change in
> > > size) and apparently also shrunk during mremap(), which implies
> > > duplicating the VMA in __split_vma() first.
> >
> > Yes, it appears we only disallow VM_PFNMAP on a remap if it is MREMAP_FIXED
> > (implies MREMAP_MAYMOVE) to a new specific address _and_ we _increase_ the
> > size of the VMA.
> >
> > (as determined by vrm_implies_new_addr(), with resize_is_valid() explicitly
> > disallowing MREMAP_DONTUNMAP).
> >
> > Makes sense as VM_PFNMAP implies we map non-vm_normal_folio() stuff, which
> > can't be faulted in, and thus we can't have unfaulted backing for it, but
> > we can shrink safely.
> >
> > >
> > > In case of ordinary mremap() (no change in size), we first duplicate the
> > > VMA in copy_vma_and_data()->copy_vma() to then call untrack_pfn_clear() on
> > > the old VMA: we effectively move the VM_PAT reservation. So the
> > > untrack_pfn_clear() call on the new VMA duplicating is wrong in that
> > > context.
> > >
> >
> > OK so we do:
> >
> > copy_vma_and_data()
> > -> copy_vma()
> > -> vm_area_dup()
> > -> untrack_pfn_clear(new vma)
> >
> > And:
> >
> > copy_vma_and_data()
> > -> untrack_pfn_clear(old vma)
> >
> > So we end up with... neither tracked. Fun.
> >
> > Agreed this is incorrect.
> >
> > > Splitting of VMAs seems problematic, because we don't duplicate/adjust the
> > > reservation when splitting the VMA. Instead, in memtype_erase() -- called
> > > during zapping/munmap -- we shrink a reservation in case only the end
> > > address matches: Assume we split a VMA into A and B, both would share a
> > > reservation until B is unmapped.
> >
> > Glorious. I really oppose us making radical changes to splitting logic to
> > suit this one x86-specific feature.
> >
> > Seems to me the change should be within PAT...
>
> Yeah ...
>
> >
> > >
> > > So when unmapping B, the reservation would be updated to cover only A. When
> > > unmapping A, we would properly remove the now-shrunk reservation. That
> > > scenario describes the mremap() shrinking (old_size > new_size), where
> > > we split + unmap B, and the untrack_pfn_clear() on the new VMA when
> > > is wrong.
> > >
> > > What if we manage to split a VM_PFNMAP VMA into A and B and unmap A
> > > first? It would be broken because we would never free the reservation.
> > > Likely, there are ways to trigger such a VMA split outside of mremap().
> >
> > This must have been a problem that already existed, and this is really
> > quite plausible in reality, which makes me wonder, again, how much PAT is
> > actually used in the wild.
>
> Probably people use it all the time, but we only fix stuff that we hit in
> practice.
>
> Fun. :)
>
> >
> > I may be mistaken of course (happy to be corrected) and it's used very
> > heavily and somehow this scenario doesn't occur.
> >
> > We should definitely add a test for this anyway :) even if 'skip' for now
> > while we figure out how to fix it (_without egregiously impacting split
> > code_).
> >
> > This can't happen in mremap() in any case as we are unmapping which happens
> > to split then always remove the latter VMA.
> >
> > OK so to get back into the split logic, this is:
> >
> > shrink_vma() (in mm/mremap.c)
> > -> do_vmi_munmap()
> > -> do_vmi_align_munmap()
> > -> vms_gather_munmap_vmas()
> > -> __split_vma()
> > (later called from do_vmi_align_munmap())
> > -> vms_complete_munmap_vmas()
> > -> vms_clear_ptes()
> > -> unmap_vmas()
> > -> unmap_single_vma()
> > -> untrack_pfn()
> > -> free_pfn_range()
> > -> memtype_free()
> > -> memtype_erase()
> >
> > As simple as that! ;)
>
> My head started spinning when I followed that callchain :D
>
> >
> > Makes sense.
> >
> > >
> > > Affecting other VMA duplication was not intended, vm_area_dup() being
> > > used outside of kernel/fork.c was an oversight. So let's fix that for;
> > > how to handle VMA splits better should be investigated separately.
> >
> > To reiterate, I think this should be handled within PAT itself, rather than
> > result in changes to VMA code, unless it results in us adding sensible
> > hooks there.
>
> Yes. I wish we could remove it; I'm afraid we can;t

Sigh one of these... I guess I was being hopeful!

>
> [...]
>
> > Anyway, having gone through your excellent descriptions (albeit, feeling
> > the same pain as you did :P), and looking at the logic, I agree this patch
> > is correct, so:
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Thanks!

No probs!

>
> >
> > > ---
> > >
> > > This VM_PAT code really wants me to scream at my computer. So far it didn't
> > > succeed, but I am close. Well, at least now I understand how it interacts
> > > with VMA splitting ...
> >
> > Well, I'm also quite scared of it, and indeed also relate ;) How heavily
> > used is PAT? We do seem to constantly run into problems with getting it to
> > behave itself wrt VMA code.
> >
> > We recently had to remove some quite egregious hooks in VMA code which was
> > a pain, is there a better way of doing this?
> >
> > I really do hate this 'randomly call a function in various spots and do
> > something specific for feature X' pattern that we use for hugetlb, uffd,
> > this, and other stuff.
>
> I hate it.
>
> Probably the right way of attaching such metadata to a VMA would be
> remembering it alongside the VMA in a very simple way.
>
> For example, when we perform a reservation we would allocate a refcounted
> object and assign it to the VMA (pointer, xarray, whatever).
>
> Duplicating the VMA would increase the refcount. Freeing a VMA would
> decrease the refcount.
>
> Once the refcount goes to zero, we undo the reservation and free the object.
>
> We would not adjust a reservation on partial VMA unmap (split + unmap A or
> B), but I strongly assume that would just be fine as long as we undo the
> reservation once the refcount goes to 0.

Yeah this is a really good idea actually, almost kinda what refcounts are
for haha...

The problem is we talk about this idly here, but neither of us wants to
actually write PAT code I'd say, so this may go nowhere. But maybe one of
us will get so frustrated that we do this anyway but still...

Then again - actually, is this something you are planning to tackle?

It's curious it's not come up before, maybe not usual for this to happen
with VM_PFNMAP PAT mappings.

>
> There is one complication: this nasty memremap.c that abuses it for !vma
> handling. But that could be split out and handled differently.

I've not really looked into this but pre-yuck...

>
> >
> > We need to use (carefully constrained!) generic hooks for this kind of
> > thing.
> >
> > At least tell me the mremap() refactor I did made this less horrible? ;)
>
>
> haha, absolutely :P

Good :)

>
>
> --
> Cheers,
>
> David / dhildenb
>

Cheers, Lorenzo
