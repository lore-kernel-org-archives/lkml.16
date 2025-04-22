Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387D28C5A8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349310; cv=fail; b=Ihk4Vhrg6gZ9srooJmHgmJYk0zWvgaoYihCGMaHrMS6aw5mjFMxi447Zw9f919RSaNEWALU2lRPBsTLty+6Kq+fMy8ymiRGR4Nl9i+u1RyfhqBiy/SiU1Jj2WRVhzDuzmkEWbMxTzD4ICMaaB82RNkBxJYgfw+bGAnCy/uuHJGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349310; c=relaxed/simple;
	bh=X3yTJeN9+hD5Zh1n19mnHoxbO8Elxs+8VHo3QWfKdoI=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=sZ6LHwd8MredqgvtE0tJkDfco8u7E4rEOMrkK++VDz3yz0e2HU/WeVnMVAD9RVvwrpmnYdqc6Begm2nFWZtErtaICeTYQfEqWhgIWWSDQkcY7daXP1AgUdKM+KKCm8rOAjEAuaUTGD2MaXR00QiG0gPoXM8eh7fgzZQOFVCxygM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VzT4/1AA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uNOY8/lo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VzT4/1AA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uNOY8/lo"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MFsnVg002209;
	Tue, 22 Apr 2025 19:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=X3yTJeN9+hD5Zh1n19
	mnHoxbO8Elxs+8VHo3QWfKdoI=; b=VzT4/1AAtF8taVJoDlVXypbeQ3YCS5rKmJ
	pHAWFrGyyHUTuWQjkjzDfftqe9GmGw8FQLVJn2P49tWbbV5ylz8ZmueNDKwlCAm8
	ZkFw2N67VO+REWmBnHdsGE4oxKLq5P2Lw4Ncd1I4nyocyrpGFIAHXP91p/jV2IWP
	3PhHvJcPBN47m1/04LWZkJxWR+WQqamzWTcpeuX3cRzeesvoXVZ7pgz5foxJ+x/8
	kYzaXbp8DRl0+dKlG7uHUjhrHGkzuYyRWsVw/rrdejZv1SUy8Tu/u1gazc+OVxKh
	8Lc5IcNzpcdBdXvHAOSfSBTa8I39NrnXTxolN+6TxP+gO3j8S9Jw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4643vc5dhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 19:14:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53MHWHJH033426;
	Tue, 22 Apr 2025 19:14:25 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 464299trsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 19:14:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6o7NlUM8VvD3Ad0TpW2/b4FOhcPUaai1TL8xBTlnAVahkxFKDuoWE9Fl10W/e8T2HXbayckCFqk/e+X7pCqUBdw/ttgrjAav0iNa7R10BKz5pHGfvdkO9QqvTPkFDClIAjUsllcfI4cmSoiI83Sb9Qwu5IMSKPOvsZaOGsmosrXO4/+mEqDSYeAIWmvZn4/uU46lML8GMLhJdpSvfEt6Z1YfHovAJhwkm0dCmvUZmvfAQDgcqY1VzMiK9I2oeNSkVgbxMeGhDnQUguBkaWQDBco+n3Lmp5j6JDgFIHoENRydDJwtMyvh7xaYQfRAPOfPm4rEteq3wBdUrk2LeWnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3yTJeN9+hD5Zh1n19mnHoxbO8Elxs+8VHo3QWfKdoI=;
 b=sJ181OiREFmRea5zFNKR3F2yqFh/xCQ5pSUH2cD1YA+zYkxnGk1S6NmhJh+og+FYifBVAjWZMGYcAdT5XJOtOfS6V53hjDZr2W0HNpHZpBAitA3g6CLMFjdG71uFf22FRVar9HIix4hEHttri1BXFnWTwIoR4KkBGf+CTmGbL1mYG3s+oCPFzGymaYArq+MDbPD5laizTU9ex4sSJXEt9OY3PgUeBUJ3Ve8tEgGmO6VKRP9pg1/w6bT02DAYGjXHpCObKlJP0A+JuxwGIE530vMohZHPJYD68f1qndu7oSY+TXkASVMd+rVtJLKyPbDxWp29/LRat7SwU1iM9G2Fdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3yTJeN9+hD5Zh1n19mnHoxbO8Elxs+8VHo3QWfKdoI=;
 b=uNOY8/lolEWfV9jRQI9VGpDfHRxv4DHcHnUxa9rn9BtE6PYQZyCz0JSDy6rK2FEgiokS/9SRli5K/1M88bghxCeKOyu/zbydw4WT9xBvEr+0VChsmWL1Cz6NJsGt1+zl7RJiUqb7f6rK0aSNrxNFUGZEw4EXYoQsykyxxjayceE=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by MN2PR10MB4173.namprd10.prod.outlook.com (2603:10b6:208:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 19:14:22 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 19:14:22 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com>
 <Z_yzshvBmYiPrxU0@gmail.com>
 <2c74c021-f985-4cfc-8369-57fc525a8070@amd.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: Ingo Molnar <mingo@kernel.org>, Ankur Arora <ankur.a.arora@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
        rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
        jon.grimm@amd.com, bharata@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
In-reply-to: <2c74c021-f985-4cfc-8369-57fc525a8070@amd.com>
Date: Tue, 22 Apr 2025 12:14:21 -0700
Message-ID: <87sem0qa9e.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:303:86::19) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|MN2PR10MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0c8973-7c1b-4f64-e7a5-08dd81d1e3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S9dA12oNo8Ix0SV7Aux80e8ZNVXpmuFsGBH1tk0a92wXYshTVkt8SgOswjhA?=
 =?us-ascii?Q?D9CAS6bsis/1zw3nQT1SWuQoquUGl6Ien0PNzoYIcb2lpkuOQP9UdtNCFClW?=
 =?us-ascii?Q?Q6euqOgV+WoxP7IdCuDtdj6RMEghHOIKMdDi46B/v+yK1H3b/w6kp457WuLH?=
 =?us-ascii?Q?O/556XSfxgIUFF5pAUgOzcEjRWtrSUvg8hPinYj06jFZuzNwAj7ZBHQTnM73?=
 =?us-ascii?Q?NcFL7ze0aXuAV2imJ/j/wFfx9nPCn+vlmRq3TfvgHyaZkgIk8ivH48kcPtB5?=
 =?us-ascii?Q?Wq96wtCc59KWNRweyiK4vW2KM1zYGZ2FLb0jVqdcdxlcUuAEPzGNGREk+1mj?=
 =?us-ascii?Q?jSE2osfKJ5AklSVwLU7JjYCPetJmNV0yf/fi9Iq62wSITH2KVbg0sFp35PA6?=
 =?us-ascii?Q?yocTKMIOZYF3E+XuRsFzdfsQGq0sFsA7SJj6Tiag2Ol1AVJxJJXZZuJj9Yle?=
 =?us-ascii?Q?nI6mU3WMAUfs+7wIwHmJ96zcdtyPsi+m+yMqzd5jPaIm637kmrWgnMVjp5hr?=
 =?us-ascii?Q?oEkhP1xkbxJm+ZQ+06D2yZBavXFGujn2ofwY7Asnr+EXXzwS0RgyB+tqqegT?=
 =?us-ascii?Q?bImBr7A1+HRr0sCnObL+WmK6y04z2CqBHbLI+p0QIgNrOgy3FWvYoQWA+i7Z?=
 =?us-ascii?Q?7jx2n5nQCBHqEi2MGUs0OAWq8tsQeX3CjAeJqtOebY6yi4kPa7rH0rEHxH+L?=
 =?us-ascii?Q?BS7IK42zNIi2mYaUMzSmfwFq5K4d5swKaUIe/f5Q++UuTZCuWueAzQmTqGVu?=
 =?us-ascii?Q?w5N1KXNANnk78BdUZORJX2aP4g7/a34dNlOulr/E1Xe15jd9z+Ij2U8DGfPF?=
 =?us-ascii?Q?IDkNjEK8tY4Pi/1mz4isnP6ecmq33jLu16cNVYBR+JWjqO2CrHeK+hkXfkVE?=
 =?us-ascii?Q?oCvQ0lfpWk01z1uhiXwVj0b3kh25f5nxHENUufedX+Z7AWXgf/ym0XrNt4qh?=
 =?us-ascii?Q?T6tixQiNuHrJ+yUF2NdI37KeyCD+DxOqQWFwyhLbye5wLEkiHW9We7xWz06n?=
 =?us-ascii?Q?qUeeN7QgaT8ARTRb8UVzdgIwMN77VbD1zMrb3HRGbCQM8j5VA54D2nFgAy1q?=
 =?us-ascii?Q?tnpLNl3Py3uYBRmjfes+f5Ys6zYQg31r5TR6Rl4r/sycveoPoD6tLYtkIdI0?=
 =?us-ascii?Q?xUZqDNnA81vdI5w/t/tG90yUh6xZQyGUsy3eEe7wZZPeZ8vhOHBjflNO36uI?=
 =?us-ascii?Q?zLHqs5b1VkKozhvM8qCQCqIdUtG/0ED6ovfaeS+NI7aO+4VNfxF6p9tlgCnJ?=
 =?us-ascii?Q?lNcPKvnNCQ3gBymcmf6f9Sodz2RH8m5Ge/kcXML59StNZpwwvKOQB4lN3Z1V?=
 =?us-ascii?Q?+jz9EqIAOLihHmbaij6MohSEGEszzJcB9Di795skK0BKclNKN8zq6iok2LzH?=
 =?us-ascii?Q?Lw63aYs7N5r08Yp/nJkskMFCHqDgBl5mk2M2FT2stqH/m6HBb3fuOSapE1Br?=
 =?us-ascii?Q?JetebkZUTz4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2E5Hi4FvQMiIxQ+e/L1XktQHgGbrgajMfbObLECZn6OgpjJOgCXz6e7RDttn?=
 =?us-ascii?Q?Tt8jAm+Jip+3eeIY0YyHDNEVjBwFg3hTfIYFs28vgPxrbm3gtU9q8h21j0mO?=
 =?us-ascii?Q?nWC+K38f1faXOKF5KE+aizSBA2x1sp50LNz3E7XCKM24pOmxsSEVgE6+jpq4?=
 =?us-ascii?Q?j3dffSFPjX6/lzliHrhJRULQV/8E92gA9Q4klrfcCKxBwfE89qJhvGhpT7Yg?=
 =?us-ascii?Q?g+HwME61ZDfUrScql76ycJInfUc8rnuOLiGk6Hg8N/ELSt0GI2O87mllYMIO?=
 =?us-ascii?Q?sum1Ok3n2mTi+3lGAEjKU3XU+Q7HBFdOABPXE+tGaS3lCyb2RmfnHuY7xnPJ?=
 =?us-ascii?Q?VVVLvfqlLYkJQ0hAASo3GMXOZxepnNv4Zeuf4DILTU1WEmOaOZ+MF1T6SeIn?=
 =?us-ascii?Q?sGZ1+T4JVU/R3RW3iiwQ2HJN1acr3l6wVHgKnkFnxZE50jXxZy/JQPQGynDT?=
 =?us-ascii?Q?kVvtS5PjHHxx8MLSQG0mDzPas5so/d/OUKsJ6QAPLeJuopKqkVyNs73oONnD?=
 =?us-ascii?Q?jOgDkhvDUcUf0y9xuDw/yV7Vxe8AtBauacYIXNbTYTO2N28Bu5cuhFTz1Ncm?=
 =?us-ascii?Q?MK2kaU35jUlUm0Tr9RgYT1zVonWaV/A7SANAoKfPp0hi0fBPlwkum7OzppIt?=
 =?us-ascii?Q?ISNOGSfGmjSxqW+JIIYEQzi74E8xUKYvreKZoTHWa5XigYsyUuw0k+P4mY/7?=
 =?us-ascii?Q?vowF3pu0PftyYpTCFDaxcgVkMlbVakzEXwvx/7mTUdzK5ZPfHEnfyr9ejOZz?=
 =?us-ascii?Q?Nyx3pAOr1lwoEc+VxOc59YLE+yw85dw0kIKyrlrXh5yWF7VjFWFka7+HlwU6?=
 =?us-ascii?Q?tTr5pykPKACg87yPnBcivWTne6AYZ2kV2uff9y106A/PxtRSJOTbzupUaymB?=
 =?us-ascii?Q?RSZNwNT8OEBcW0+O6vwHT01dfmaOTp2bFbTX/FR6CIcz1Hv8m83tr77AioCm?=
 =?us-ascii?Q?4b+GfKsPo5ZVULnvGzBeBtD1n/IkbTKJhD30CfwCCbFDamXbIb4uWtrcGyhx?=
 =?us-ascii?Q?BWZ5lei1Dw6pozg6O9dIo3zABSen6OHwfnQW34DSSZTxlwq4czJVTeASoKrS?=
 =?us-ascii?Q?zQMNFRKS12981C8runkiGaTRQKi+H1tpNxhseLP8fzOaOsmcXspIAEShexB2?=
 =?us-ascii?Q?5IABE9OhbNAyWJ1M1neS9ZCVgZEi3w3VtaV1khLSOLW6B/XjtPYKEnAkpDpD?=
 =?us-ascii?Q?fOwAAaq0O89rAEY6ellrkLoj4NTd9r2GUiCVO6b8pLhWpFsm5G5woqPVjNmN?=
 =?us-ascii?Q?bRh9lxqKB7lF3si7pu9ACPctBF4FKbstSLfZgLZKCpSKEIEY/9kyOqw4MnKX?=
 =?us-ascii?Q?js+UBwr4Ij85BOpyaFSpFeNupDz5z0bP+UxjBSWBPcWR8B1KPz6BJRhSI8Yw?=
 =?us-ascii?Q?nc71XYqLr6UhakTd4zirFJ2AhSJv464pxn2wR+i0ztmcG+2/W78vKFkXCdkA?=
 =?us-ascii?Q?G78Ed3aIQ/TmWBakncB1N/pGHc+5ozxrHafXkVYXXBbnYiia2Z6CivisLaYJ?=
 =?us-ascii?Q?QqbKpxJuEDv3m2IMoghVqeeGgbogyVezS0SFXfuayhccw7L+TQbLxeYPEKOi?=
 =?us-ascii?Q?VBqxFTYvwpPgTdlGKigUMWUntVMR9GJBBk/nmq0u2dUhgioSewMp8LMmZIbO?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LPECXeoinvaxZLN26iX8hJyb8ouy+yInQqE25c/2k/OsWrk4sr8grDhNY2JHQYSEk+WUneKF/pnXl+jiDO/2KL90Ici8VAIuycwlhnYYv4mYxhCB7V2JAVXzCz1Nj3XD2vRY7WnwikQfP/2bvbwYySAcKTmbbPKCp4HB2wbEt5+BUk02do43Szsir6PSIDzUOYkzpbJiJfbEONBH75VcvasniOC+04YwiRSnZGcLfHCNsvh5clGK+JXTdSI97EwWpYZcdR2SHrg4UTmOlydwIx/IgCwKgW5KKLbvGau9nuoEbWEeA5wRNQmCpk74pYBESK74O0XOQbiAsUrTlFb8Dm4A9ckjtHKdGHNaUuKmTJqaRB/Z4HyLIAgO5u/sAOpD0XasZXFAPHt6YWZGcmZiY3I3HdyjzRTkCanAp4jcmGqEwdrcOGmQ3Jn1KD+RpuCoLoy/EeNKjsnuurDaCTIrdb95y8csLrHpevZ7Rzf4p6XYvoHCwXZZNNtDMNwAwQ4jlzii8PAGTzCHhHVQoLKFAsETjbvZAEsjUkq17OFFiX/fIXgv8NBPM0e1qUeO5KeRRa09ujTJfM+rVsqgiAcjtOhAhsdwJw6NHvdiutF73K8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0c8973-7c1b-4f64-e7a5-08dd81d1e3bd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:14:22.7295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKVZuL4TIdXg9ahFd2NkRIaznyzath3D0davSrlqg7MIklR5PN26+SNnu+TcRt5GjWe5X0J+r5uth99DTZd8OnxGcjOX+NbPYj/almhOuDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_09,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504220145
X-Proofpoint-GUID: YnD2yO4fjgIAa4jGbxOLCS1GOADoXjEz
X-Proofpoint-ORIG-GUID: YnD2yO4fjgIAa4jGbxOLCS1GOADoXjEz


Raghavendra K T <raghavendra.kt@amd.com> writes:

> On 4/14/2025 12:35 PM, Ingo Molnar wrote:
>> * Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
> [...]
>
>>> Performance for preempt=none|voluntary remains unchanged.
>> CONFIG_PREEMPT_VOLUNTARY=y is the default on a number of major
>> distributions, such as Ubuntu, and a lot of enterprise distro kernels -
>> and this patch does nothing for them, for no good reason.
>> So could you please provide a sensible size granularity cutoff of 16MB
>> or so on non-preemptive kernels, instead of this weird build-time
>> all-or-nothing binary cutoff based on preemption modes?
>>
>
> Agree with Ingo here. We are too harsh on none and voluntary with this
> limit. At least 512KB size?

512KB seems much too small. I was thinking of something larger: 8MB. With
a zeroing BW of 10GBps (typical value I've seen with relatively new
Intel/AMD hardware), that would mean a preemption delay of 0.8ms
for preempt=none/voluntary.

Even with relatively old hardware -- say skylake -- we should see ~5
GBps/1.6ms delay.

> I will try to see if I can get numbers for different sizes that does not
> interfere much with other workloads' perf. (in none/voluntary mode).

Thanks that'll be useful to make the case.

--
ankur
