Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2321A94F
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720006; cv=fail; b=lKWozVzycOo6g0Z8ybSN0ewIOiLYqjNhB733vjbvGRXjSrDRxhg0+Zi9JzL+6l6U6TNSBSJvfZ8iTBgh70t96tj3nJPB2idAujrDmaQAjKA5wJXwIDT1+QpMF7mt9yEYWIE29XAEiHvI2pb7adyGbV1HqJUnWV7PHBdwHoX821Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720006; c=relaxed/simple;
	bh=ipzY5jiALJ0phA+D/GKLS45l2HYe+xGey1O1Ko+wXLc=;
	h=Content-Type:Message-ID:Date:Subject:To:References:From:
	 In-Reply-To:MIME-Version; b=aHueOe9/LEEc62seGE8VEBEW2F4EpBwOZZKsC+X/ec0Hu1noJ8pMtJKqUb/iYOoF0fh2WSLWcTVpZI9E1fM1ofIvEnTyrL7UanwBvLfEQkvOB2V9ws/OUr8c2SvG1n6Umw743CHhjb4LkoMT0IMf8KYrLIcwJ2DQydqs6xQPQO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O9tMJ2K3; arc=fail smtp.client-ip=40.107.94.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O9tMJ2K3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZotbMVsM4um0RA4trWEG/aYhX8wLMAC4W+luTd3paI45502tRsswTiFUeT6lDd+I29IBpazFwRvAKb9HNDlA+JoXqpERSzXo6jbjdjmx3irceTBz8oGsDQeLXF4OEcwGlsmsE+tq0qqc2GlWDukLMeJ+AApvRhquPX8o0zdk+l1tnD4a2y2IAwtHM8MEEogDhjzNM1vBvtrL75Nlkf95T0KhMUVsleyj1rp2vx80wUoAu+kheva4X2hPR24MhpBczvkZ7sMWTeY/C28U6L9BMzuPYj9u9MHhP1DY8gSARRZwlMZ0QNNhJ7Gp3aQfZwrmJQBI8dMrekyWjmZGENwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3SdM8EdePlEnuN08z8CKS3BZUkYdX4Mbjwni4qRuA4=;
 b=gawWfV3V6fzSN368FRevNrWYYXFPu/hgdUY1flOeI992jEStcmk6H4ApwFmSxpJIll8DVXmEYYrp12CvaqsfZ2f00c0vcKh1fMEDJU5UE/FA4wWw9lwEBm7jDXSDFsYUm3sg1bSa8Ujux002gnW5Ue/04n5LRleaHn43Oq0ORwcWYGTr7Om8Q+MNnD6525hfJtgroaC0RRQ4g+CWkWOxLUzlE/Lt2gsh/EGiY8x+EfFapkIcNZv+u7i12Fv9MnRQXidwdWghOWIPTjaymFvCsow7VLcZtTkwNRrvS1V4rRcyMEPcdUA1cpQSclCk7YEBX25OHBjgSFh1nXi+7l5TiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3SdM8EdePlEnuN08z8CKS3BZUkYdX4Mbjwni4qRuA4=;
 b=O9tMJ2K3mEWlTGdP1zzlYkbEOK2+95/DGoQTRMMJq99jMLWmLbxFlGP15OlZhNJP5uucT5Rvp1sYDcFyrqnaGvtPF/Hi1zjXz38D9pSYyEIcdNe2QcIFDydvJHui1FVW7qEBhOJuJpVfl3KJ0PETZ4CVsULnQYMhZcZua90k2ro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 05:46:40 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 05:46:40 +0000
Content-Type: multipart/mixed; boundary="------------GXQVz0EIt8DBlOQ1kU3p0V3K"
Message-ID: <7d20b14c-5739-4556-9f6e-d19cc7e3ee9b@amd.com>
Date: Tue, 20 May 2025 11:15:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in folio_large_mapcount
To: David Hildenbrand <david@redhat.com>,
 syzbot <syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, dev.jain@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 syzkaller-bugs@googlegroups.com, ziy@nvidia.com,
 Matthew Wilcox <willy@infradead.org>
References: <6828470d.a70a0220.38f255.000c.GAE@google.com>
 <5cdc53ff-ff48-4deb-9551-92bd47590a53@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <5cdc53ff-ff48-4deb-9551-92bd47590a53@redhat.com>
X-ClientProxiedBy: PN4PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::9) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|PH0PR12MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 9740f1dc-f2f5-4de1-898f-08dd9761b0dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTZocXdyL1l5WmZZejJ2TGIzcXJtalREbzQzcFIrUTVNVGhGRy9tUzhVQ3p6?=
 =?utf-8?B?c2kwclFNcG8rcXR1ZVh0ajNjcnFKZmxjN0ZmT1JKaFZ3SDRiS256dWRseGE1?=
 =?utf-8?B?VzY3TlZsUXYvaFN1d0xCSU5FUW1KSVNtQjVlVVlEV0tsa1Vsc3dGRDNzeGYy?=
 =?utf-8?B?ems1WUxFL3pubG05UDZ6d1o0UlVsUWJraHMvRmdndG5TWTdtRThHSVprMkFj?=
 =?utf-8?B?Rjg3Vnc1YnUxMnBPWURiYVNVYTFteEs3MEF6STlpUnE4NlE5QXlQQkpoaVFQ?=
 =?utf-8?B?cWNRbVRUeG05ditxNGUzUzBPVmJTMmwzTWhQVW05ZDFmUmR0TVBvL25kbjRP?=
 =?utf-8?B?SU5rR2xEb3cvQ3I5b0VKWDVNTzg0ZHE3M2d6bElDVHdvVGF3Yk9tSG9vMzdY?=
 =?utf-8?B?R3VuNkhRQlJ6b0xSZjJHbUhRRU9iWXA0cWdDVnJRL00zaFI1N25xemFLQlFv?=
 =?utf-8?B?Y3poSnBrcU5qWmx3RVIwc3A1cEhydDI5a1d5NEhIbW14WTRtSng1emVLcmg1?=
 =?utf-8?B?Mkw5NFgwdGxwN0UvS2Z6Ujk2aktJbG9GOC96bUMvUEhVMHdTOXV6MWVaN0Y4?=
 =?utf-8?B?Q3Fnb3d1UndMWEpOQ1J0Z25lTS9hRHB3VHlIaVNXVUFsbFF0bkRRS0JvZ1lp?=
 =?utf-8?B?RGRjd3RKS29vcGo1RmpUUWZadFlvcTE3enZFUmIzd2hRL1NHSTNrTmFIdFdR?=
 =?utf-8?B?TUQwRmtFcnFpTm5IaWhoV3lHa2crc0FKZFhRTXd2ZzhnWUxPdzdGZFBEb1dl?=
 =?utf-8?B?MlN3K1RJUHFsWHdTVXBJemc4SDg2VTZNUnNXSUFPUmVxd0ZEaVVEYjg1ZENj?=
 =?utf-8?B?SEFtYzBCakx2Q1VueG1tdUFTVjBYY1ZwZjFpalJzYWhMdk8xekVkSW8vZzBq?=
 =?utf-8?B?ay9FQVNsMllXOHBjV2U0ODRCWkQwZTBONlZ0bEkxRjdQd1pSMW5VbkMvdWsr?=
 =?utf-8?B?LzhoT1FwNnpxOFlocy9IMTBUVjUrNy9PSFYxK0JNejdYY1l3QWUyVkxsczda?=
 =?utf-8?B?R21vNlI3RXNnazFqNWV6MGZ6dkpGTWpzeWVnRVhmaFFhMU1ndThPb2tHd0xJ?=
 =?utf-8?B?QXdEUGVpTGp0MnpKWi9TdG9oMUxIRXE2VnFKSG91Q2hOZnpQZTdkNlUrZFRZ?=
 =?utf-8?B?bDNvc2FFQlJsSVI5Tmc4QkRCRkFneUtlU3BPYjlEdU9YRzR3NzBqOVh1d3ZR?=
 =?utf-8?B?cktQK0trNmVacXk2ak9WSkhwTUNaNUJGbXRscDdvL3hoKzhpdUhIYzlvUU1w?=
 =?utf-8?B?czFtbmx5QlBFRVJJYVM4RDVhcTdDdDR3TnR4UHF4c0tSTEsxUkJXcHVjdEM1?=
 =?utf-8?B?MVZEcyt2djliMVR4U2dQZmxKQWVqbXdEMHVBSDRRcHNrZVlDUFY5U3p6Z2l1?=
 =?utf-8?B?RVB0MFA0OWdHVElTazVXZEE2ZytvUWxRWWlKSTlKVTVJZXVLRmozUlE1N3FS?=
 =?utf-8?B?VXFzT3F5ZEhtL2lRVGlxekJibXI0amZMRUtwUVp4Tk0xQWE5cWtqeklvaGhG?=
 =?utf-8?B?ZmwvYlplQi8rNHBvZkI4bXo3ZmFPUzFyNEtXMmRLNHdKNEVYWFB6R2t0ZFJx?=
 =?utf-8?B?V3JIbjZmSHN2VGNFcEtHdjNwakJkSEFzMTJWeGlSWGRXbCtGUkpHUVl5K0xy?=
 =?utf-8?B?bnlqWnNtU2hvK2RGQUxLbk1DQ0lxbUF2WWhSWWs5NXBPanVWZis5ZTY2UkVU?=
 =?utf-8?B?STZmMkI4ZHAxNlBmdzRlTVcyYjh6UmJTaGFKaVdaMTJNUEs3QXd0MzZ6cVVJ?=
 =?utf-8?B?Ym82UXoxTjdGNzh2aFA3S0pCcmtlZk9NT2lOYlkxcVJieHJ2YVdmMERGMUxz?=
 =?utf-8?B?NTIyOUl6ZUVmeDhDdEtYbjhsaTFkYldITzR3bVNWWU9uL3huaS9DZlhFOC9E?=
 =?utf-8?B?TUsrQmlrYWVmcEhCODVGSnRIVC83UHVDZHV4QktsTzlMZlpzSVY2M3NYNUNQ?=
 =?utf-8?Q?7BjaGm3wG/c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czA0UEpORnJ3dUdVdUtPNnl6YUh5RUNKNUtWYVkzaU4zalZPaHlnbS80dytQ?=
 =?utf-8?B?djUvU3psOG5jeW1wK0wwY2d2RUZiOVZFQmIyUDRmZHN2c0xPOXpyUmlidXQ5?=
 =?utf-8?B?em9VVnB6SHVQZUhkc3BEMk9QZmUxTElCdURUcHRVK2xqUlgxdXp3MDN6dGVs?=
 =?utf-8?B?cG01SXd1alpaR1diZ3Fmc3lRK2JRcCt3Z2s3UGQwWEtqdkFNY3JSQnQreFU2?=
 =?utf-8?B?NXh4b2w2UU9ISDJMSy91K2tVdERnaVA1NFB1d3d2OUpBeTBWQjhtbGo1RU9t?=
 =?utf-8?B?Z2w1L3FqRERaTG5QbUZ0czNCVm1mbk8xUjBwa28xSU04N1A3WEN1WCtXTVBt?=
 =?utf-8?B?ZGRkY1h6a1ZnaVpSSjBicHB0ZTRSZ3Fyb2VhRU5JNGFvY1d5TzRtNUNTNHBN?=
 =?utf-8?B?NmVDZnR0VytIZSs4QVdadXhWYjhUMUZBVHltTkVxTzgwZEllM1JiRVpaLzVm?=
 =?utf-8?B?dGp0dVhBZCtLU1pIczRQazVmRVQrR1FBTHdxMGJkSHg1L0NERG5KMDlOWnpS?=
 =?utf-8?B?SkRETGN0QzFOU1IxSnpPbklwaHhNS1M5ZUpUM3pBYVVhK2xsMm1BOUFoU3JD?=
 =?utf-8?B?QXVkMzREc1g4cUF4TGtXemp3TFBYNGFldlgrdDdqTGxRT0sxZ1BVY0ZJdnNZ?=
 =?utf-8?B?Zk54NVpDdld3azdnNDVwMTlOd3FWWStOYzVFeW8wTld2UzdKbURjZm84STRR?=
 =?utf-8?B?eGtvUVVIcFEvR09FQTFYbjl4eUx4c1luUDlSVTBMWW5KOGVxeHp1QVZjbTFM?=
 =?utf-8?B?VVNiTDdsSnUwWW4vMkI4NURMaWZnVEFxZ1hGRGlEZmtSK01UdHBSSXF5YmVt?=
 =?utf-8?B?aWlNTUxLY1dlMnk4RlAxUkxIN1hrOTRESzNWNXdCNG9KMUZCWGhhTlg3SXov?=
 =?utf-8?B?Uk1TQkFndkpSR3BMWlQ3MUVkeGU2QTR6aSsyTUNvSDI3cC9YamNIMUJNUys1?=
 =?utf-8?B?TzlyYnN6K2w3bjdWM2ZRNGh2dDNWR2JRU2JPN0syWCtRUFlMNFFFNWlSa0RQ?=
 =?utf-8?B?MTR5LzR3b1hxV2Jxem5pSTVwOUo4SmNtVnZzOHJEd0ZGenFMZExDOVl2WWg1?=
 =?utf-8?B?STNkQVNTSmhvNnEzL0tiOXg0L3ZBSEJnTm1wUy9qRGZ3QUFGdEtDc0FpaDdO?=
 =?utf-8?B?ZGVDZC9aanZsS0pmcEV4WW9WeHl4WGFPOHdENWtYNVRHMDllZjJlc1l2ZmpG?=
 =?utf-8?B?RXBNSkZmY0k4OFBxcmlaTFFmeGVoT3ZIZ24vaUdYbkIwZ3MwcnlCejZ2NG9V?=
 =?utf-8?B?RHd0OC9XdDJXNHZCV2ZRa3g2dzZtaEZUdnlBaFlnLytaRStHekRwNWw1d2R3?=
 =?utf-8?B?b2dMa0Z3bDhSMFFoVjVvQVhmdFc4Z3orQk00MEFVbFFNWmRlWGtDK0p1Z1k5?=
 =?utf-8?B?OHFzUEZtYldzcFVhbkNHemJPUllaVSsrdlR2WjkrampVZVRQc1Zsb0JzT2F6?=
 =?utf-8?B?VUpaRVA3UCtPQ3YvZUk2RGc4L0VtMTdTNHRNRGU3SkRWbk5zSlk3Uy95Zndj?=
 =?utf-8?B?c2pGWUhXZndVaEsxcFZvclRMc0w0SC95d3lJaTdxVjU1V2hnRXNDbElHK012?=
 =?utf-8?B?RU5SV1JVa0JVNUFGUjBjNjFqd2YyUHg5clZWVU5zdWFnWEswVmhxQXNOSU53?=
 =?utf-8?B?Uk85WmpxYzFrK3J5UmY2eVNEc0ZzVTdxTkVjUW9scjRJbWp2TXZJbUZFVFc4?=
 =?utf-8?B?MFQrcWlyQnpBaTJleWhQYXhFTE9JbStZRktONzBmQlhMRWU5SEtYWWZyay8r?=
 =?utf-8?B?M0lqTENCejVrQ1JUWlJlNVJPM0VXbDFINFRPTnZoK2hGbktDdkVhR1JFRVBa?=
 =?utf-8?B?SmExUGhlQ2NDM0ZxVTNMTWswd3pIMTNDZTJqTFFuZUZLN01NL3NyNlVBbDZR?=
 =?utf-8?B?clBUZDNZSUN2UTh6N21NS29NdzB4QzVrbTBSNkJBYjAvRHcvS2JYekdqMHRI?=
 =?utf-8?B?U2c4MWRJVlNZNk4zM0F5L044bHNETmdFTEpVQnZjSFhQWWl4ZFpzTGhVS2NY?=
 =?utf-8?B?TTR0YTYxOENWSCtkVXVvWERsdC9FNWFvNXlnNWxZZnFic0JoeFVBZHdnd01X?=
 =?utf-8?B?ZFZ4cDRTRnI0SEUvamFZSVJ2Y1VwaGl1WldyQ0FyQ0tOaXRBbk5TV3pmOE8x?=
 =?utf-8?Q?4YJwAJ01I3Ez+KD/E4qo2JyPg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9740f1dc-f2f5-4de1-898f-08dd9761b0dd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 05:46:40.4545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MRsz9L9mn0PIV4NJqQTQukUpx0bJfOOCcaDdZe62DABJAFXw7n5Vgm+ekgioo9u6F3l5rIrcQmhrc64kyKxeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792

--------------GXQVz0EIt8DBlOQ1kU3p0V3K
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/19/2025 6:56 PM, David Hildenbrand wrote:
> On 17.05.25 10:21, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    627277ba7c23 Merge tag 'arm64_cbpf_mitigation_2025_05_08' ..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1150f670580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=5929ac65be9baf3c
>> dashboard link: https://syzkaller.appspot.com/bug?extid=2b99589e33edbe9475ca
>> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/0a42ae72fe0e/disk-627277ba.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/0be88297bb66/vmlinux-627277ba.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/31808a4b1210/bzImage-627277ba.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 38 at ./include/linux/mm.h:1335 folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
> 
> This should be
> 
> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio);
> 
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 38 Comm: khugepaged Not tainted 6.15.0-rc6-syzkaller-00025-g627277ba7c23 #0 PREEMPT(full)
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
>> RIP: 0010:folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
>> Code: 04 38 84 c0 75 29 8b 03 ff c0 5b 41 5e 41 5f e9 96 d2 2b 09 cc e8 d0 cb 99 ff 48 89 df 48 c7 c6 20 de 77 8b e8 a1 dc de ff 90 <0f> 0b 90 eb b6 89 d9 80 e1 07 80 c1 03 38 c1 7c cb 48 89 df e8 87
>> RSP: 0018:ffffc90000af77e0 EFLAGS: 00010246
>> RAX: e1fcb38c0ff8ce00 RBX: ffffea00014c8000 RCX: e1fcb38c0ff8ce00
>> RDX: 0000000000000001 RSI: ffffffff8d9226df RDI: ffff88801e2fbc00
>> RBP: ffffc90000af7b50 R08: ffff8880b8923e93 R09: 1ffff110171247d2
>> R10: dffffc0000000000 R11: ffffed10171247d3 R12: 1ffffd4000299000
>> R13: dffffc0000000000 R14: 0000000000000000 R15: dffffc0000000000
>> FS:  0000000000000000(0000) GS:ffff8881261fb000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007ffe58f12dc0 CR3: 0000000030e04000 CR4: 00000000003526f0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Call Trace:
>>   <TASK>
>>   folio_mapcount include/linux/mm.h:1369 [inline]
> 
> And here we come through
> 
> if (likely(!folio_test_large(folio))) {
>     ...
> }
> return folio_large_mapcount(folio);
> 
> 
> So the folio is split concurrently. And I think there is nothing stopping it from getting freed.
> 
> We do a xas_for_each() under RCU. So yes, this is racy.
> 
> In  collapse_file(), we re-validate everything.
> 
> We could
> 
> (A) Take proper pagecache locks
> 
> (B) Try grabbing a temporary folio reference
> 
> (C) Try snapshotting the folio
> 
> Probably, in this code, (B) might be cleanest for now? Handling it just like other code in mm/filemap.c.
> 

Hi,

I've implemented your suggestion (B) using folio_try_get().
Could you please review if my patch looks correct?

Tested it using existing selftests: sudo make -C tools/testing/selftests/mm run_tests

Other two instances of is_refcount_suitable() uses folio locking. Should we maintain
consistency with those?

Thanks,
Shivank

#syz test
--------------GXQVz0EIt8DBlOQ1kU3p0V3K
Content-Type: text/plain; charset=UTF-8;
 name="0001-mm-khugepaged-Fix-race-with-folio-splitting-in-hpage.patch"
Content-Disposition: attachment;
 filename*0="0001-mm-khugepaged-Fix-race-with-folio-splitting-in-hpage.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkMWMzNDI3ZTgwMjE1ZmVhOTkyNDI4YzhiNWNhZjUyOTE3MjVkZDY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2YW5rIEdhcmcgPHNoaXZhbmtnQGFtZC5jb20+CkRhdGU6
IE1vbiwgMTkgTWF5IDIwMjUgMjA6MTk6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBtbS9raHVn
ZXBhZ2VkOiBGaXggcmFjZSB3aXRoIGZvbGlvIHNwbGl0dGluZyBpbgogaHBhZ2VfY29sbGFwc2Vf
c2Nhbl9maWxlKCkKCmZvbGlvX21hcGNvdW50KCkgY2hlY2tzIGZvbGlvX3Rlc3RfbGFyZ2UoKSBi
ZWZvcmUgcHJvY2VlZGluZyB0bwpmb2xpb19sYXJnZV9tYXBjb3VudCgpLCBidXQgdGhlcmUgZXhp
c3RzIGEgcmFjZSB3aW5kb3cgd2hlcmUgYSBmb2xpbwpjb3VsZCBiZSBzcGxpdCBiZXR3ZWVuIHRo
ZXNlIGNoZWNrcyB3aGljaCB0cmlnZ2VyZWQgdGhlClZNX1dBUk5fT05fRk9MSU8oIWZvbGlvX3Rl
c3RfbGFyZ2UoZm9saW8pLCBmb2xpbykgaW4KZm9saW9fbGFyZ2VfbWFwY291bnQoKS4KClRha2Ug
YSB0ZW1wb3JhcnkgZm9saW8gcmVmZXJlbmNlIGluIGhwYWdlX2NvbGxhcHNlX3NjYW5fZmlsZSgp
IHRvIHByZXZlbnQKcmFjZXMgd2l0aCBjb25jdXJyZW50IGZvbGlvIHNwbGl0dGluZy9mcmVlaW5n
LiBUaGlzIHByZXZlbnQgcG90ZW50aWFsCmluY29ycmVjdCBsYXJnZSBmb2xpbyBkZXRlY3Rpb24u
CgpSZXBvcnRlZC1ieTogc3l6Ym90KzJiOTk1ODllMzNlZGJlOTQ3NWNhQHN5emthbGxlci5hcHBz
cG90bWFpbC5jb20KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjgyODQ3MGQu
YTcwYTAyMjAuMzhmMjU1LjAwMGMuR0FFQGdvb2dsZS5jb20KU3VnZ2VzdGVkLWJ5OiBEYXZpZCBI
aWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2hpdmFuayBHYXJn
IDxzaGl2YW5rZ0BhbWQuY29tPgotLS0KIG1tL2todWdlcGFnZWQuYyB8IDE4ICsrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9t
bS9raHVnZXBhZ2VkLmMgYi9tbS9raHVnZXBhZ2VkLmMKaW5kZXggY2M5NDVjNmFiM2JkLi5lZjRm
OTU0MDk3MjMgMTAwNjQ0Ci0tLSBhL21tL2todWdlcGFnZWQuYworKysgYi9tbS9raHVnZXBhZ2Vk
LmMKQEAgLTIyOTUsNiArMjI5NSwxOSBAQCBzdGF0aWMgaW50IGhwYWdlX2NvbGxhcHNlX3NjYW5f
ZmlsZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJY29udGlu
dWU7CiAJCX0KIAorCQkvKiBUYWtlIGEgcmVmZXJlbmNlIHRvIHByZXZlbnQgYW55IGNvbmN1cnJl
bnQgc3BsaXQgb3IgZnJlZS4gKi8KKwkJaWYgKCFmb2xpb190cnlfZ2V0KGZvbGlvKSkgeworCQkJ
eGFzX3Jlc2V0KCZ4YXMpOworCQkJY29udGludWU7CisJCX0KKworCQkvKiBIYXMgdGhlIGZvbGlv
IGJlZW4gZnJlZWQgb3Igc3BsaXQ/ICovCisJCWlmICh1bmxpa2VseShmb2xpbyAhPSB4YXNfcmVs
b2FkKCZ4YXMpKSkgeworCQkJZm9saW9fcHV0KGZvbGlvKTsKKwkJCXhhc19yZXNldCgmeGFzKTsK
KwkJCWNvbnRpbnVlOworCQl9CisKIAkJaWYgKGZvbGlvX29yZGVyKGZvbGlvKSA9PSBIUEFHRV9Q
TURfT1JERVIgJiYKIAkJICAgIGZvbGlvLT5pbmRleCA9PSBzdGFydCkgewogCQkJLyogTWF5YmUg
UE1ELW1hcHBlZCAqLwpAQCAtMjMwNSwyMyArMjMxOCwyNyBAQCBzdGF0aWMgaW50IGhwYWdlX2Nv
bGxhcHNlX3NjYW5fZmlsZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRy
LAogCQkJICogaXQncyBzYWZlIHRvIHNraXAgTFJVIGFuZCByZWZjb3VudCBjaGVja3MgYmVmb3Jl
CiAJCQkgKiByZXR1cm5pbmcuCiAJCQkgKi8KKwkJCWZvbGlvX3B1dChmb2xpbyk7CiAJCQlicmVh
azsKIAkJfQogCiAJCW5vZGUgPSBmb2xpb19uaWQoZm9saW8pOwogCQlpZiAoaHBhZ2VfY29sbGFw
c2Vfc2Nhbl9hYm9ydChub2RlLCBjYykpIHsKIAkJCXJlc3VsdCA9IFNDQU5fU0NBTl9BQk9SVDsK
KwkJCWZvbGlvX3B1dChmb2xpbyk7CiAJCQlicmVhazsKIAkJfQogCQljYy0+bm9kZV9sb2FkW25v
ZGVdKys7CiAKIAkJaWYgKCFmb2xpb190ZXN0X2xydShmb2xpbykpIHsKIAkJCXJlc3VsdCA9IFND
QU5fUEFHRV9MUlU7CisJCQlmb2xpb19wdXQoZm9saW8pOwogCQkJYnJlYWs7CiAJCX0KIAogCQlp
ZiAoIWlzX3JlZmNvdW50X3N1aXRhYmxlKGZvbGlvKSkgewogCQkJcmVzdWx0ID0gU0NBTl9QQUdF
X0NPVU5UOworCQkJZm9saW9fcHV0KGZvbGlvKTsKIAkJCWJyZWFrOwogCQl9CiAKQEAgLTIzMzMs
NiArMjM1MCw3IEBAIHN0YXRpYyBpbnQgaHBhZ2VfY29sbGFwc2Vfc2Nhbl9maWxlKHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCSAqLwogCiAJCXByZXNlbnQgKz0g
Zm9saW9fbnJfcGFnZXMoZm9saW8pOworCQlmb2xpb19wdXQoZm9saW8pOwogCiAJCWlmIChuZWVk
X3Jlc2NoZWQoKSkgewogCQkJeGFzX3BhdXNlKCZ4YXMpOwotLSAKMi4zNC4xCgo=

--------------GXQVz0EIt8DBlOQ1kU3p0V3K--
