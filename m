Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BCE2472BD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734851; cv=fail; b=IMRD0e5BvSK43P3egwuSeDqDOP1c1DClrqfhCfEAHvVufFLEljSXhrb4wt6Kvfp+BRAr0k9hkR1vcN3kNRzlPi0zk0wdX4UlIos65cJvweIvm+jczuWXidg9v55554sLG5B2loeX0FZpaT/wT8fUrijHz0NrXZgO+GRT1xPrfos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734851; c=relaxed/simple;
	bh=jf71yJHVH0z9d85nQdKFH8bYYH98p6H4pjpqFlvoYmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MQ/Nel3SmJ4ZtnEiD0mC+Jn2Q8P+EJtLxXgPiKtp2oPXzn3Agd51imkQ84ifDtAQkkrenCUmAc0R+I8VYrz+fnWHoSGsND7uNy+nb6oy5vU59UnUiWe/IgRmlwn6iJPXPMLGNC61sswBfdsgwycoIy6PFQEXiOxb45Tl9Za4vhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gHw83QO2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dAwkj9AM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gHw83QO2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dAwkj9AM"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7fYSO005593;
	Thu, 12 Jun 2025 13:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ZA8QsffnIxB3UlKQP7w/HSEl5Ll65ku6iiwJNRn3e3Q=; b=
	gHw83QO24TUV4+SLeT1RYibT/Swm7NOyKf9MipRkY5tj2auBx1/HNiLpSP+EcV+f
	firbZArcGoprNW16ohSbPF0/r35QOnNp4xkru3W5ieJ85kFgVV9LO4cfPcwLP8SK
	zSsaEKM297aSk27DKwOoXMVlQIo+hGjjU1fo1FwqevUON6miFsLfvrOvtXFzqTgJ
	4+SGzGmdGlT4+easYn3GxTzOT/9rwVPsg1w1QB5w3dF5u/m9+emtXPlYsDnptInZ
	Oc1M9GJqOR29Rz5QVqG7mUpi6aP8X/CfXn9bSnL/uNAJY81PPmZTY6vlBPopq7Z3
	pQ6QHVev+KCbQncfDXRyHA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v9qdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 13:27:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55CBtf8m040802;
	Thu, 12 Jun 2025 13:27:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvck9k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 13:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doebLOH9Mv4VsA1qWI3PWqVytDzuCi3Fa3JnElGX2ZdMX9Qs+71J/gYR2jPWShaiYRBmcMK/1a8U7K9xw1e+4MWoqRakjrKEfrHguBYWwILnXoPiOMF21zflWn6mTJq0QJFeQ/uL3KSufd4FhPAblklr0dtwwwogcO/4HARCUu9jujyaEbRdRxenJFDNBItUCUufadApnEUdmkMLBU3XbX4Oizj8RJjF/k2AdWgszz9RAn8AFiqwVqfRONWo0AK6v8su+G+a6AzzhExd/+RKyB7+qOAZNL9l5cw2p0HnWWe8WBX7w+JkFjI1fk+VODb7lEtJvC7+ikFnQIrAfA1ckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA8QsffnIxB3UlKQP7w/HSEl5Ll65ku6iiwJNRn3e3Q=;
 b=x3y1WfpX2gZ2k4pz56qeIFmdAaEuXuHeLDjHKZWhdt3sm02BTcpSvPB+dYSsJylChcvmHz+TjpxXZLRVN3LI61nupWf/jIZbiV4paBkfRXtQUG3fl7lwbudMZdGWnvFzwtV/DMIK2XPCIgY6zFFw3jFFE3oc2kTH7W4HXP5zBxMJqcDwixIxuds8MgFL997TP0oG21z+75HfDACvcRue74VlsJlALmNK5Rvb/7GGZIIpIOZ/gSlHhM7eyQa0wgbjvb8XK7i7jPCPkJiB8xS11gEphSxwW6cim8oZhOXF0yww35DJWDpvgpDhWMiewRxhdR+4tDZbedrn8ZO4gX0mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZA8QsffnIxB3UlKQP7w/HSEl5Ll65ku6iiwJNRn3e3Q=;
 b=dAwkj9AML8K6SqYGBxAya+R+3N08Zp0iZHJwhuGNFoFdQt4pNjsNpQd7D2tHo7yk6z5t+58VPbNs29jzEQESaglFA6/Q17+2vM9e5REl45olTU/yu44ca2QT4r2jWiDpk04wQGwWDBOUVu1fb8MlJvynz5sBYRgLxWOLbbR2kIw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB8072.namprd10.prod.outlook.com (2603:10b6:208:4ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 13:27:10 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 13:27:10 +0000
Date: Thu, 12 Jun 2025 14:27:06 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
 <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
X-ClientProxiedBy: LO4P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b8275a3-f64e-4ea9-88b8-08dda9b4d585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzZWOTJiWGgzZG1WTDFYdytLUUNrVUhtQitVRkJQelNBTjZmc3ROU0JNK1Vv?=
 =?utf-8?B?WXRFOW5lSkc0TVdaNWhPekt3NFBpdVgybHVZUjVCcGpQRlR2a3hxSVh4WXZI?=
 =?utf-8?B?THdmbkdhYkVnTWxrUTFxTkpYK25QMFoxcnU2R3QzOHRZTG1CT3ZNZWlMcnNO?=
 =?utf-8?B?VjVzNE1JZjJ4SE9Nd1dEZG02VG95ZUxaTW5yc3Q5R0EyaXFrbWp2ZUpqc040?=
 =?utf-8?B?WFA4VVkvcEZYbEJXdVgzVDZUOGoweGVVbElrV1JUbldzL0RWdjQzZWtoOGdt?=
 =?utf-8?B?N3c5QWFXVWx3R1BrUGpkNmkxY00rUmpQcFVlWGE0S1BuWHdja21vZ1dreGVK?=
 =?utf-8?B?YUJiVTk0MHBkbnZLenBLVWFZUjQzb0R4S05kVnM2SjdyUEVrSUJ0aFhLUkpC?=
 =?utf-8?B?Qm4venJiQmkxKzVOQ2pVVU44bldSQXlacnJ5T3JqelNOTmQ2WkVFaGt5TFU5?=
 =?utf-8?B?UVozbkcwMU8rU0FLTkVBbXJlQmwzVHRVbjVQVFdhaEVDTS9pUy9kbC9yYmVu?=
 =?utf-8?B?aUlLc0VXMlI3Y1hnVDE5K1E2MEtDenZqVmhFZHpRRXR2UzFoMG9rNnoraGpw?=
 =?utf-8?B?T21QY0pEYTFHdE8zMlFoSFAyNStIV0JmTmYwb0tmNHpRNFlqZmdDYWZ3VHlE?=
 =?utf-8?B?dGpuUnZkMW5WakVhNlU4VVVRWTl3VEtqWUhtK053NjZ1a0V5NEdWckpyR1Fv?=
 =?utf-8?B?MzJVSkFldUZlV1hwYUtVbkxNcEhRcDd2czN2ejc5TWUxUkIyeEFVcEVKY0VB?=
 =?utf-8?B?b1QreUlXUkd5OU9RRFhlTG1YOTRnSmJyMlhwd3R3VlRrVFB0TTBSSWdBb3lJ?=
 =?utf-8?B?SCtwODV6d04wNnhPY2IzODY4anRjQ3V1SDF1TWhjblAzYnQvWCt5Sm9BZ2o3?=
 =?utf-8?B?QnhxTjgrTEtHdzJ6RTRhRlpwWmZheWE2VWgzL1VERmVzZE5KODAzRElqYldu?=
 =?utf-8?B?TDJzcDVLRVNxYUtnQzlDYjhyVXZ3YzdjT085YWQreGt1Z29abnQ1SDdzNHJs?=
 =?utf-8?B?MWRpWWVDYmdJNVJOMjZZUDZwM21JVWJrQ0dBTUhQd0dXL0dTbUxqQ1dmRGNH?=
 =?utf-8?B?MHJEUHZjUjIzTFRnallhVHhtYkpscitnWWVnSzk5b1lZcU9GMTlHamxxUjRz?=
 =?utf-8?B?MjRPeFphcStLS2RkcllCZU0yaTQ4YmRYMzJDUklhV2haS3FnY015bExhOGhv?=
 =?utf-8?B?aVl0b0haY29oNjA2ZjJrTkVoTjJlMmdHKzN3K1NsQW9oYVQ0dDl1QzdaY25W?=
 =?utf-8?B?VkMrYjRoY2EySElLZU52Z0tMYmZLTDBXUi9leGtHUmh5dmh4bm45ZnJPdXBt?=
 =?utf-8?B?VUtub0FrL0dwNko3UG80RXJ1MWJpVE5QNUZ3OVhXOEQ2Mm4ybU1EU1loS1Jk?=
 =?utf-8?B?WlExQnZ2a1FCRkFvUURLTVZOZ3hqVjhJMjB5NHdZTmNiYkhDUEJDRm5XVDN0?=
 =?utf-8?B?MjlMSzVGa0dvYlNKZTBwdGszTVR4OEJZUXFaN2hmNUVURHFNQ2Zya05mcStz?=
 =?utf-8?B?eCtEWE84RUhtY1hQVmtZYWNISWcxdkM1SHg4OVRaUnpNOFJQdDVHQjJjWFJI?=
 =?utf-8?B?TmJCdkl0UHdiTkZoaTI2OTFtb0JUZzZCanovcytvSnB5OEhsclhCM1YybXhL?=
 =?utf-8?B?RkZ1c0hPWHRCOGpZYXlUdUtKcTg1c0xrVktrWjllSUk4SkQ1WVhjeXJaWmF0?=
 =?utf-8?B?VUMwaGNqZXRwMXNWMm9QSzdKaXJUREl3eEZKMnA4dnIrejhWSlN5VjFuN0tZ?=
 =?utf-8?B?ZGRBU1Z0d2JNUW91QkF5RkNlKzF6Uk1OQlg1cnRlNXdNa3dtVXRyMllrZThB?=
 =?utf-8?B?cEpyQ3p2OFJ0Uy9uU2NDUit4aEpjMmZKN1NSeTVHSmNTekNzVkFRUXJPbWdR?=
 =?utf-8?B?cXVGWVk4UFFmZ1k2eTZ1a3krbWNaeVRwM3Z0ekRtZk04ZldlcmNVZHVrSm82?=
 =?utf-8?Q?ccCBI9QS3sE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVpDRjhqZ3lCNVJGbmVhY2c1SDlVS0hHMGY0WFphcnRaY2J5VmNReE1BQ0p0?=
 =?utf-8?B?MmFmSDI3TldCaldvSTJOd0VyeGdmYUpmbmx5cEVDNEtaa0I5VVZKL3dTQXU5?=
 =?utf-8?B?UzNlWHhPSUtVZnR6TDRDQTRVUmhKbHRtTlFwMjRvdUFhbnRjT3ZuNUc1WjQw?=
 =?utf-8?B?dnZhQzljNUlmTGd2U3ZtdGpXLys5dGVLY2FhcWpXdVh6VFJTYkR3UWdhUDJt?=
 =?utf-8?B?Nm05TysrSHVackpGd2plODFuZGV1ZmRKVU1laUxIQTBQVE5LQk90SWpoY0kx?=
 =?utf-8?B?dnBUby9GRkJsTTMyMGpnMm9ESjU5aTB1cjV3WVNWemsxVTJXdE1vUjJwcG1K?=
 =?utf-8?B?aGRhQUcyWDNjK3pvd09GU3ozdHNDYUVtUkRKVFZ5Nngvd1lIZzZoQ3JPMTVl?=
 =?utf-8?B?azBGTkNQYmh4U2JXdFU0V3l0SzNleUw5anNXN3N2ZW1jUlNiU3pieTBzSzBP?=
 =?utf-8?B?ay9pL25FQ3NrcVFNNU5PRWNiS1BzRUVhdXRsRnNXSHJnaGNJRk9aMWpkVlpt?=
 =?utf-8?B?NDRMRVNBMk94MmJFTTM5UWNXZnBFTG1OOUNuYzRiTjQwR05TZ2RxZTFYWlpV?=
 =?utf-8?B?V3BmeVFpemNrUHBMOHNneHV2bWtqSTNiTTBWK2prRUVoVkd5bTRUZ09RSWJ4?=
 =?utf-8?B?aHFKWkRoVEtJUDlsOWFzVWJrTU51L3QxRVBSYVJBWS9SR2lIUjByUysyOXFu?=
 =?utf-8?B?aG8vNkFlSzM4cFM2dGx2b0RLbjBIOE42a0FBK0V2TW9aOGdKTXo1TTcyM2J2?=
 =?utf-8?B?aU1hd3M3a1ZPTU5KVllEY2wwb1NvcmM2aVJsdC9hdWZVODRPUzNOc1lKNHFu?=
 =?utf-8?B?R2p4dGpuL25CZkp2bDN5UnduV21PMGJPZjZaaDF0b2RaVFRtMGN4U1ZEbnFI?=
 =?utf-8?B?Z2JGRnJlZ3l2ckhLWEVUc0dTcVhVd3lhcE0xc2NWVFJLVnhFNk9MbCtYSSs5?=
 =?utf-8?B?bE4rMnpLaHJ6TFdhaTYxdkdWRlN4ZDhsa2NOWmZ2eXlHNVRBSFFHWHFRc2Iw?=
 =?utf-8?B?MUI4eHVXRFo1K3Q0QVpPWFdhZGROMml3VzJ6SVdyTmhPWmExMzQ3UlZsQzVP?=
 =?utf-8?B?c0pzQ2J4dHRYQnJLTjJBUklMYWpCTFpVQUw2RG1ESGs5eE9XRkozSTVscmFr?=
 =?utf-8?B?OHdEVFB6RktFSkFTL2JFc0d2MnBxRWVjbUJLKzE2NmgxaS9YdjRZZmR2czRT?=
 =?utf-8?B?a0RaRUJqbDlIcG1NbDBaMVNmbUM3TzB5UmlNUEZZK3JKVGJhZXZQRm5UZGQ2?=
 =?utf-8?B?bWQ3K1o0Zi80SW9aRlV4VnhnVUZiQU5VRHlpT01PTVAvS0Y1RGFWeGpsT0dD?=
 =?utf-8?B?RVgxL1lVK0JXUGtpUDdlRHpKeEthclJRK2ZCVjBCaHJoZ0QxNDhsdmNrK1dE?=
 =?utf-8?B?a21yS0crWE52ZFpyQmdLb3hHbFhPNlVtTkhQSmVhSVNLWUVucGV2ZkVwbm1C?=
 =?utf-8?B?ZUpWaEJpSlF4WFllZEhNUXlNdWhsaEd1R1dmdzMwclB2SmVUVHd3QkVJSFls?=
 =?utf-8?B?S3YwNnRmN2ltRGZQbFhncWhPSUhpOEVkV2pvRE1IbXRqTWNJTk9hL3RzWDZN?=
 =?utf-8?B?ZmdDZTFWbWlHVkZSdWx1ZzhVNTgrTlJaa0hCUUdMeHZIM0ZSS3Z3T1crbE9x?=
 =?utf-8?B?eVJEYU83cm9BMjdVQkRQK2J4SEcyU29mWWFHL0hQZ2ltRWNxL2NtYXMwUzlQ?=
 =?utf-8?B?TFQ2UnZCTGF2bGV0K2xURkhDVHI4MUQ2NktmbXZINmpNQXJlRUZrTzNqZXha?=
 =?utf-8?B?RDhOZnBicWMrTXhYSHN4d1NVMlBsVzVGQ0lwK0tCZlEzK3dxOFlBWndQNjJB?=
 =?utf-8?B?dXZlcWxndlA2UVNIQk1KeUJEMm0xT3VxaklYWkw2MXIwREJmTUx0NDdQVy9k?=
 =?utf-8?B?NmU4Mml1MlVST2c4YkVuQ0VrTnhpV2luNFpsRWVnMUlibk9PWDI2L25LeGpC?=
 =?utf-8?B?Tm1TODc5eWRZdkIxQ3ZybHJWdVNxZnBFUFlYbFJVckV4ZFVvZnQwTk5NUnNi?=
 =?utf-8?B?bTlkZ1NNb2xaOFQ1dU0yQUdDeTRKRlcwR1o1ZWl1dzFGWDFFQVdINFM0cGxO?=
 =?utf-8?B?Zk5sbXkwOVAvdjk2VXdVaU1LRzdrR3I3ZFJKbFptalZ4UDhqUGJXa3NjTjJp?=
 =?utf-8?B?ZGtmWHVDdDR6Nk82bEtEQldaOVlMR0NzNTJ5QnJjMktUdFZjZ0xOMVJvME5R?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SD1bT789o5b/Bz7pwy5/j9ja/o6U58sjhGk1u5D/Z7DY89nMjShILs/OevtcBYF1PcQAQ7qQMmNqAMShLIx652bbSMXKnitxiDlRQu7cjj46DrKdJz4ZP/qK3i4M8MdCc6l4QtI0lvf7J+i8MPa0Ar9jA9MD79TVqNpVxvovTAR+uKD6Ba433Oq8TpqY/RlgyGX9GOAaO5oigzAW4GVLPnAH+azH/GvE6bXpocx73puzMjft94QCflAtgaemGgV14YY8O+TGvhkWXc4spfUcguCd0uxkhXndX6UOm94UnDjkb/9Y0p+4IqH5OVIUjYVtah39QeIoHA3QhS+gn+FYVvYvO7NSv2yqtQYHg5oI5hIG1FQCCKmJ7Y6Ybr4j/BuhXAVMGQRhJTaCVlgKB5TsyqvVkUbmWV8YnSR3h1a36lltSGP2aJXDlu7380lnS+jefKkWfo9TqvyXLf0dMWX1Fr68VPGTP7arHwzw5erTBDZBKVESV3+ROWM8FC/GAE1sIL6g7jeOOS2rpdEH6VFn5MLewY3NGSWcEI/QaXEwHjM/DiL4MWBKXbDnWM1EtBLZA/bqg9ZkHBkXDGIvkLkvVwx2bRu67E6P5+Ua8DDjDoo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8275a3-f64e-4ea9-88b8-08dda9b4d585
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:27:09.9992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6L8ynIL8CnwDXPgO3pMNfnJke7NqUvaASwPjOiFuFVj+eV/mGmv1HipHMX+N4V82yiBOJkqoaRSnFBb01jndy9aPssTp7L/9XHlxwASWtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506120103
X-Proofpoint-GUID: UGKNTSLCg6FtdoeNYJsIx-Zikd1VbZO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEwMyBTYWx0ZWRfX2xO3R4EmpJCf BKK85OdYtZZPZWqmuMTy/pQq5sNsXQ3Yx9OS/bf7BnLHA5gvWmqrckAoLvHoWeI+gJrU035RMUw 05TAnItB970J12r8ympMPkLsrvpsNlXOfk6w8FC2rcIabjr60FrowDKNwUoKSZteoMut4TGRl9D
 Bjjbae66PbAQPpiWoh8YmpozZ2AvQIR6HQfMlku5XEArF2efqaju7bV1ypnYvYWG5cA1KbwGxMh kINaz0/OE8eTskpOnxqM6r9sYMSXd3NIZltn8m/0RkHbdyqQD+xi1P0/xEQCkBUCp47mH7/LKTR q0P0aTDjzNNibAmdKKoX1jA5D9InKeGLam0MNSWrfWzPErkvVDFXa+WLjk5jiL4MsftZQE756xm
 1TYBE/xCSZQrMdLRuY947ldF5jGD7PlrwQiK5Qvjv4AflGLl5QYaxu5f8WjdOhtvh/LcSnL7
X-Proofpoint-ORIG-GUID: UGKNTSLCg6FtdoeNYJsIx-Zikd1VbZO_
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=684ad5b1 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8 a=RGdv4hGqK0ukZ42cFDIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On Thu, Jun 12, 2025 at 03:05:22PM +0200, David Hildenbrand wrote:
> On 12.06.25 14:45, Baolin Wang wrote:
> >
> >
> > On 2025/6/12 16:51, David Hildenbrand wrote:
> > > On 12.06.25 09:51, Baolin Wang wrote:
> > > >
> > > >
> > > > On 2025/6/11 20:34, David Hildenbrand wrote:
> > > > > On 05.06.25 10:00, Baolin Wang wrote:
> > > > > > The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings,
> > > > > > which
> > > > > > means that even though we have disabled the Anon THP configuration,
> > > > > > MADV_COLLAPSE
> > > > > > will still attempt to collapse into a Anon THP. This violates the rule
> > > > > > we have
> > > > > > agreed upon: never means never.
> > > > > >
> > > > > > Another rule for madvise, referring to David's suggestion: “allowing
> > > > > > for collapsing
> > > > > > in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
> > > > > >
> > > > > > To address this issue, should check whether the Anon THP configuration
> > > > > > is disabled
> > > > > > in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is
> > > > > > set.
> > > > > >
> > > > > > In summary, the current strategy is:
> > > > > >
> > > > > > 1. If always & orders == 0, and madvise & orders == 0, and
> > > > > > hugepage_global_enabled() == false
> > > > > > (global THP settings are not enabled), it means mTHP of that orders
> > > > > > are prohibited
> > > > > > from being used, then madvise_collapse() is forbidden for that orders.
> > > > > >
> > > > > > 2. If always & orders == 0, and madvise & orders == 0, and
> > > > > > hugepage_global_enabled() == true
> > > > > > (global THP settings are enabled), and inherit & orders == 0, it means
> > > > > > mTHP of that
> > > > > > orders are still prohibited from being used, thus madvise_collapse()
> > > > > > is not allowed
> > > > > > for that orders.
> > > > > >
> > > > > > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > > > > > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > > > > ---
> > > > > >     include/linux/huge_mm.h | 23 +++++++++++++++++++----
> > > > > >     1 file changed, 19 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > > > > > index 2f190c90192d..199ddc9f04a1 100644
> > > > > > --- a/include/linux/huge_mm.h
> > > > > > +++ b/include/linux/huge_mm.h
> > > > > > @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct
> > > > > > vm_area_struct *vma,
> > > > > >                            unsigned long orders)
> > > > > >     {
> > > > > >         /* Optimization to check if required orders are enabled
> > > > > > early. */
> > > > > > -    if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> > > > > > -        unsigned long mask = READ_ONCE(huge_anon_orders_always);
> > > > > > +    if (vma_is_anonymous(vma)) {
> > > > > > +        unsigned long always = READ_ONCE(huge_anon_orders_always);
> > > > > > +        unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > > > > > +        unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> > > > > > +        unsigned long mask = always | madvise;
> > > > > > +
> > > > > > +        /*
> > > > > > +         * If the system-wide THP/mTHP sysfs settings are disabled,
> > > > > > +         * then we should never allow hugepages.
> > > > >    > +         */> +        if (!(mask & orders) &&
> > > > > !(hugepage_global_enabled() && (inherit & orders)))
> > > > > > +            return 0;
> > > > >
> > > > > I'm still trying to digest that. Isn't there a way for us to work with
> > > > > the orders,
> > > > > essentially masking off all orders that are forbidden globally. Similar
> > > > > to below, if !orders, then return 0?
> > > > > /* Orders disabled directly. */
> > > > > orders &= ~TODO;
> > > > > /* Orders disabled by inheriting from the global toggle. */
> > > > > if (!hugepage_global_enabled())
> > > > >        orders &= ~READ_ONCE(huge_anon_orders_inherit);
> > > > >
> > > > > TODO is probably a -1ULL and then clearing always/madvise/inherit. Could
> > > > > add a simple helper for that
> > > > >
> > > > > huge_anon_orders_never
> > > >
> > > > I followed Lorenzo's suggestion to simplify the logic. Does that look
> > > > more readable?
> > > >
> > > > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > > > index 2f190c90192d..3087ac7631e0 100644
> > > > --- a/include/linux/huge_mm.h
> > > > +++ b/include/linux/huge_mm.h
> > > > @@ -265,6 +265,43 @@ unsigned long __thp_vma_allowable_orders(struct
> > > > vm_area_struct *vma,
> > > >                                             unsigned long tva_flags,
> > > >                                             unsigned long orders);
> > > >
> > > > +/* Strictly mask requested anonymous orders according to sysfs
> > > > settings. */
> > > > +static inline unsigned long __thp_mask_anon_orders(unsigned long
> > > > vm_flags,
> > > > +                               unsigned long tva_flags, unsigned long
> > > > orders)
> > > > +{
> > > > +       unsigned long always = READ_ONCE(huge_anon_orders_always);
> > > > +       unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > > > +       unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> > > > +       bool inherit_enabled = hugepage_global_enabled();
> > > > +       bool has_madvise =  vm_flags & VM_HUGEPAGE;
> > > > +       unsigned long mask = always | madvise;
> > > > +
> > > > +       mask = always | madvise;
> > > > +       if (inherit_enabled)
> > > > +               mask |= inherit;
> > > > +
> > > > +       /* All set to/inherit NEVER - never means never globally,
> > > > abort. */
> > > > +       if (!(mask & orders))
> > > > +               return 0;
> > >
> > > Still confusing. I am not sure if we would properly catch when someone
> > > specifies e.g., 2M and 1M, while we only have 2M disabled.
> >
> > IIUC, Yes. In your case, we will only allow order 8 (1M mTHP).
> >
> > > I would rewrite the function to only ever substract from "orders".
> > >
> > > ...
> > >
> > > /* Disallow orders that are set to NEVER directly ... */
> > > order &= (always | madvise | inherit);
> > >
> > > /* ... or through inheritance. */
> > > if (inherit_enabled)
> > >       orders &= ~inherit;
> >
> > Sorry, I didn't get you here.
> >
> > If orders = THP_ORDERS_ALL_ANON, inherit = 0x200 (order 9), always and
> > madvise are 0, and inherit_enabled = true. Then orders will be 0 with
> > your logic. But we should allow order 9, right?
>
> Yeah, all confusing, because the temporary variables don't help.
>
> if (!inherit_enabled)
>
> or simply
>
> if (!hugepage_global_enabled();)
>
> Let me try again below.
>
> >
> > >
> > > /*
> > >    * Otherwise, we only enforce sysfs settings if asked. In addition,
> > >    * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> > >    * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> > >    * set.
> > >    */
> > > if (!orders || !(tva_flags & TVA_ENFORCE_SYSFS))
> > >       return orders;
> > >
> > > > +
> > > > +       /*
> > > > +        * Otherwise, we only enforce sysfs settings if asked. In
> > > > addition,
> > > > +        * if the user sets a sysfs mode of madvise and if
> > > > TVA_ENFORCE_SYSFS
> > > > +        * is not set, we don't bother checking whether the VMA has
> > > > VM_HUGEPAGE
> > > > +        * set.
> > > > +        */
> > > > +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > > > +               return orders;
> > > > +
> > > > +       mask = always;
> > > > +       if (has_madvise)
> > > > +               mask |= madvise;
> > > > +       if (hugepage_global_always() || (has_madvise && inherit_enabled))
> > > > +               mask |= inherit;
> > >
> > > Similarly, this can maybe become (not 100% sure if I got it right, the
> > > condition above is confusing)
> >
> > IMO, this is the original logic.
>
> Yeah, and it's absolutely confusing stuff.
>
> Let me try again by only clearing flags. Maybe this would be clearer?
> (and correct? still confused why the latter part is so complicated in existing
> code)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 8b8f353cc7b81..66fdfe06e4996 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -265,6 +265,42 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>                                          unsigned long tva_flags,
>                                          unsigned long orders);
> +/* Strictly mask requested anonymous orders according to sysfs settings. */
> +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> +       unsigned long tva_flags, unsigned long orders)
> +{
> +       const unsigned long always = READ_ONCE(huge_anon_orders_always);
> +       const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> +       const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> +       const unsigned long never = ~(always | madvise | inherit);
> +
> +       /* Disallow orders that are set to NEVER directly ... */
> +       orders &= ~never;
> +
> +       /* ... or through inheritance (global == NEVER). */
> +       if (!hugepage_global_enabled())
> +               orders &= ~inherit;
> +
> +       /*
> +        * Otherwise, we only enforce sysfs settings if asked. In addition,
> +        * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> +        * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> +        * set.
> +        */
> +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
> +               return orders;

This implicitly does a & mask as per suggested previous version, which I think
is correct but worth pointing out.

> +
> +       if (!(vm_flags & VM_HUGEPAGE)) {

Don't love this sort of mega negation here. I read this as _does_ have huge
page...

> +               /* Disallow orders that are set to MADVISE directly ... */
> +               orders &= ~madvise;
> +
> +               /* ... or through inheritance (global == MADVISE). */
> +               if (!hugepage_global_always())
> +                       orders &= ~inherit;

I hate this implicit 'not hugepage global always so this means either never or
madvise and since we cleared orders for never this means madvise' mental
gymnastics required here.

Yeah I feel this is a bridge too far, we're getting into double negation and I
think that's more confusiong.


> +       }

I propose a compromise as I rather like your 'exclude never' negation bit.

So:

/* Strictly mask requested anonymous orders according to sysfs settings. */
static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
                unsigned long tva_flags, unsigned long orders)
{
        const unsigned long always = READ_ONCE(huge_anon_orders_always);
        const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
        const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
	const unsigned long never = ~(always | madvise | inherit);
        const bool inherit_enabled = hugepage_global_enabled();

	/* Disallow orders that are set to NEVER directly ... */
	orders &= ~never;

	/* ... or through inheritance (global == NEVER). */
	if (!inherit_enabled)
		orders &= ~inherit;

	/*
	 * Otherwise, we only enforce sysfs settings if asked. In addition,
	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
	 * set.
	 */
	if (!(tva_flags & TVA_ENFORCE_SYSFS))
		return orders;

	if (hugepage_global_always())
		return orders & (always | inherit);

	/* We already excluded never inherit above. */
	if (vm_flags & VM_HUGEPAGE)
		return orders & (always | madvise | inherit);

	return orders & always;
}

What do you think?


> +       return orders;
> +}
> +
>  /**
>   * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
>   * @vma:  the vm area to check
> @@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>                                        unsigned long orders)
>  {
>         /* Optimization to check if required orders are enabled early. */
> -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
> -
> -               if (vm_flags & VM_HUGEPAGE)
> -                       mask |= READ_ONCE(huge_anon_orders_madvise);
> -               if (hugepage_global_always() ||
> -                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> -                       mask |= READ_ONCE(huge_anon_orders_inherit);
> -
> -               orders &= mask;
> +       if (vma_is_anonymous(vma)) {
> +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
>                 if (!orders)
>                         return 0;

I pointed out to Baolin that __thp_vma_allowable_orders() handles the orders ==
0 case almost immediately so there's no need to do this, it just makes the code
noisier.

I mean we _could_ keep it but I think it's better not to for cleanliness, what
do you think?

>         }
>
>
> --
> Cheers,
>
> David / dhildenb
>
