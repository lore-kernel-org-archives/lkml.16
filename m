Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C828E24169A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891866; cv=fail; b=W2uUMSYGt+Z6B/HOcxe1d2+fkbu+0+EmIIffroBxDrL5thMSM1La3JeBzUsKkm+pHhvUkW8tAYU0z3W14w7aBJwhByWipDYtevqFd6fTWtPa7NujlRZFWSsGeZPzk/Mnqoha5JS3z/z8wjFLgLTAbcL3xnal/c8sZPP18rIC1ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891866; c=relaxed/simple;
	bh=uRKnuibh5+vj5JiD7gGxGDJimnHVYXvDrBGTEd/02iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SBExpgGQ0YIgo25J0Tmw4yddNGnDEMWQ9ePzwawnG8F853Rz3lEuNvg48lvy617ak+yQAFIY0vvy/R+ETLV3iuSIUF+oO9lP0v+4lcNpX8r3GeMhtDxl9VG9p3ZhgPM6/jg3zrgDz0zpVnLwk5g5Nkov+NIt/NnSDC91uabcaf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y8lTUqze; arc=fail smtp.client-ip=40.107.94.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y8lTUqze"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrliQ2liy6tZ7q198guFzc58tN4/fdgao7wgXnBJkKxddGVYKsjgxObYgHLU+yrsdD89W7t270GvVaZTOhsGG9sWowXjLxtPC2kaqd5KNddb7DzvbiW8tAF3P0WIB5VRA6ReTtTOw1+53ItQfesBDTtceW1OWrracAagOVvkjo5W4rUsI360N9Zfrj2zpW5DnLlu8zs1oCWCFad0OFYCjwz3YKQOth6rwDhtwSRFL5NtsgQ6WZRszpLpNTLodLYLglKTsvdj1fY+p9tSN7Knxn5UwGMeGU5wnJt5Yev9qu+1VctOj72dRNtEwrNQzjoYWLwIzBmwoFCmzNVeKKPRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wEurfs3Lhui6D58cgmkcq7sYvKGcxjRYQA3TzYutZI=;
 b=rZ/BC2JJ35r3tWiTNnxfPM7K6AbsgCTHpN6Efp/r0GI3S9wFzaN5vMnQOL8wzB62EL0AXV6OV+MMPJmK2gVhvsDvLD1L/7XHOQKxfTS0acVESP3Qp6f9/26qzIk0f+ZfpWRyab8TfZE4RkLO8ODmdVN8OFzRGsxinuGRvJbMPjmfU+Nt0VeqexzmUNnjoZ8qP1csiWrQHu9iPxu6vQTsvpaQWZunQzNbIAp8fY82dbdroI2SuCshKrpXs4RXWguYJd383/VcFi+k/DRUat0qPX7QnxGejp0/bZAzAgP2L12Dnei2QVtUozv92mvG08fYIa98CZh3r/6ehBTJhgWseA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wEurfs3Lhui6D58cgmkcq7sYvKGcxjRYQA3TzYutZI=;
 b=Y8lTUqzer/y64nAPyYV79+HtFvsGe2lq5WorC4pC3KBej5sspPc3lyk3JPspdWGpreeZWr4z2Tf3yXxQReThZyOMp8k6NL3K9FWB86hv9jXZrIWRJCffsvRJJ8ScGgROGBPwO8RVyYqDl7wsDrZQFAP4MdktlrTJe08VKjwyb28XmcLsh5KMVONdmxYiqxh2hF3rn9qszpwpGXd0EzSCsKuCsU678u1LgNGIJ/WarMntiB8deD5025iUTRWoUAgcAfV66dArI8orLuWeNs5PXEWuteYlTkkJr30bHivR/cBL46R177Llb2weLpUqgBuqJ2hR+p7h4UWAJNaClPkjrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.21; Thu, 17 Apr 2025 12:11:00 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8632.040; Thu, 17 Apr 2025
 12:11:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: Gavin Guo <gavinguo@igalia.com>
Cc: David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>,
 linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org,
 linmiaohe@huawei.com, revest@google.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
Date: Thu, 17 Apr 2025 08:10:57 -0400
X-Mailer: MailMate (2.0r6245)
Message-ID: <CD959F2D-FD0B-42C3-B451-ABCE254485E7@nvidia.com>
In-Reply-To: <667354f3-7076-4e64-9506-56e81e7d9234@igalia.com>
References: <20250414072737.1698513-1-gavinguo@igalia.com>
 <27d13454-280f-4966-b694-d7e58d991547@redhat.com>
 <6787d0ea-a1b9-08cf-1f48-e361058eec20@google.com>
 <83f17b85-c9fa-43a0-bec1-22c8565b67ad@redhat.com>
 <98d1d195-7821-4627-b518-83103ade56c0@redhat.com>
 <7d0ef7b5-043b-beca-72a9-6ae98b0d55fb@google.com>
 <05a7d51e-f065-445a-af0e-481f3461a76e@redhat.com>
 <f344d741-962c-48d3-84b7-ce3de5619122@igalia.com>
 <412E70A4-4775-4AF7-A878-7FEBF9A122D8@nvidia.com>
 <667354f3-7076-4e64-9506-56e81e7d9234@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4250:EE_
X-MS-Office365-Filtering-Correlation-Id: 240995ca-2d52-47be-53ad-08dd7da8eaa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVYrejdBMkxxVEpZa2RUVEtTMmZOY0dwcUNUVDN4QUxuZkMvM2dLUVNoMXBC?=
 =?utf-8?B?STkwOStiNjVmcitwaHRsbmhHdkxkL0VVU2lrZ09LWFVuUzk0S1paZEpnbWNp?=
 =?utf-8?B?UUNUUWlXWmN4TnJtUHJWR0Q1dzRTV241aFB6TEJTZXk4V2IwL1BreHRwamtF?=
 =?utf-8?B?V1pnL1VPSkhpdTlvd001Mmxyem5LZUpwWXNTOHROYmRyMmR0cjJFMk9kZjBO?=
 =?utf-8?B?clZJVStFc0F5WXdEanYwbmM3N2lzN2RxMGF6S2E3NmJOYVRnRzRNVDliaWYx?=
 =?utf-8?B?RS83MVoxeXA2WXpuUHVoNlVlY0ZiRWEvTDUxc0lwZGdSdjBDaVh2MWtyK1Fw?=
 =?utf-8?B?enBieWtsa2IrR0JPcktoWnV3QUVuTUFCb2hXTTI0MEFyWStOdERYS1JZSnR6?=
 =?utf-8?B?QUFuZ1ZSOFc3SzcxWG83ZFNEQ1crOFJUUzkxeFgrbnBlMlJ0VTdIRkZZTnpz?=
 =?utf-8?B?MmhWYTloRktSSHhUbmJYUGxmSG1VZ0dvbFdhSnFEWndFc2xHWXJkeVdoejVN?=
 =?utf-8?B?eHpqbFdRak0rcXZKTGRpMEp2MVBYZUdIZXVoRlM1Sy9ScW9UTEgveTJqMDFj?=
 =?utf-8?B?REJNVGJ4TmI1U1l1VlZwc3VvdWVDelRwR2YrV041RkduaUhlbFJReWJBT0Zw?=
 =?utf-8?B?RndERUtqNkhNdHdZS0F2ajFrRGl5RTIvNlQ1cXcvaFZoYWZLdEpmSU43Wmpy?=
 =?utf-8?B?dFVWMS83NlFtdld2clBUelRFbFNVYjUzd1RkdzRweUxXRWJqeEw2ejcvS3Jx?=
 =?utf-8?B?bWpmSlBERk5rNUZxazFmUnFrY0gxVGUyb2R6RnVFVE9MMEJwSFVTd04vUjNE?=
 =?utf-8?B?MFJOTW5LNWNSSmgyamRKdDYyMUVxZlNVWHN1SnRZQUdQaW5SaCtuZlV6UkxU?=
 =?utf-8?B?QnhadjZZRHJtSFNUZm94bktVdy9OaE1BaHg5eWswSTk0R2hxd2FTaTVlN2RT?=
 =?utf-8?B?dUUyR1lwVzlScUtpMGRWd1ZOQUsrZFBvNHNVTG9aSjZUM3MzTWpWZFEzaFN4?=
 =?utf-8?B?N0VlL010Nm9PakU5b1F5dmoyZDVnM01LZVFvUkFJdEZsUnpZVzVIZThGNDhD?=
 =?utf-8?B?M2RrdlFtL09QNkpuemdEMExRV2RQUW41QWFydy9XbmNVdENoTW56YnY2aWx6?=
 =?utf-8?B?TWdPd2lKQVlmajliNGErYXZwWXJKdy85c0hqUVdmK2FDd0ZKSmJwSHg4LzdU?=
 =?utf-8?B?OUVTa21mbVlyRUJnOUZPMWVsQ3Ayb0l3MU9SR3MyL2pWdUk5dVU0ZUk2ckpl?=
 =?utf-8?B?MzlJcHBJNm1TOGh0a0p6amh5UWtzaDBscFhBZTNqUVFmUVc3VEwrQnNqVHBo?=
 =?utf-8?B?dFJhRGNBU0I2ekt2eGNZcW1pcFdDUFczUzhhWkR5ZWNpZUZQZHcxS0dPcDR1?=
 =?utf-8?B?aExFc1dyZ3NXcXY2bHZQZDZEdnlBc1RsRWkxbmR4NEp1K0pVR1ZKUXQwd0Qr?=
 =?utf-8?B?RlNGMEtvckpJY2pOZE1NbEZLOGdwcm9GV3pCRWVUNG5jYzBueG04THlObWFr?=
 =?utf-8?B?cjVOcFMwVk5sbmUrdTEydm4yRGM1OGtmNzdrd1E5c0IrZTdEalV6aStkR2tO?=
 =?utf-8?B?ZHNrOG9EcjVZOC9rSXlST3F6SWdUSjl6UmFkY2p5S05icTBDSHpUcHdKc2pa?=
 =?utf-8?B?UWlDYjVsbk10MEZWLzFSSEMvRVg0L0RtRFM5T2luTExZOC9hYTF3V0wzVXVH?=
 =?utf-8?B?S000N1pPZHZiYlo5QTA3V1owSHhoMyt0ZHZDVHp2WFd2N2RadzNjL2ovaUJK?=
 =?utf-8?B?UzlYcXlYS3pYSmZTeCswSTVGOFZsRFp3eTF6STU4M1ZBc3F5Qjl2Vld6WExm?=
 =?utf-8?B?VUpEYTJNdHhLV2ZuQ3MrT2JLREhibHhUVUNSYVF0Tjd1TEJBcFVlKy9xRkZn?=
 =?utf-8?B?L09NMjlEVWx3MEgvZ0JqWEpmNlF1QmR0eDRTTWxyOXdBRmJuRVFaMVJENlBO?=
 =?utf-8?Q?/4INRutocXw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Szc0Yi9ZcGl1eC9nVHFCSkptaitJQlN5RGZqemxVVTZ6YjZpZ2c0TG01aXNN?=
 =?utf-8?B?NktmaGJreE1udkhVb2x0akx3eGt1MndoTVJBZkNSY0cvS1F3Sm81TmxlUlE2?=
 =?utf-8?B?MCtJVGhrbW5JQ3hlakpncHpJMlAvc3d2TFh4TWViYTk5ZE04RjJDckhkaTA0?=
 =?utf-8?B?MytHMjIyaVp4NXBFd1hNejJuSDV0SytqWWYrTUZNWmtJZGZoZXJaek5sRFNi?=
 =?utf-8?B?UzVJZWhTNFpQSmNNWjBpQmVlSUNXeUpjbGJxU1VLdVczYURPRy9aV0t5Ym9x?=
 =?utf-8?B?NkYrTHF4dTNYZXloaG1MN0xPSGxMSkhUVUt2KzR4S01oNS9sSDZ2MUhZRWh6?=
 =?utf-8?B?Nm1JUDJ4cCtNK0V3eFhhbUc5UlpDaWtqQjA0L0ZHUDZFTHBtamVJYVhCTU5I?=
 =?utf-8?B?WEpNVXpCbFlXblFTUVI2M1J1MTRrUUR0OTdZVC9lajlPbU1IR2hrZkJFUHVz?=
 =?utf-8?B?YkhKd0c5OEFLeTVwVEdZT3g2amRSeUcxdStESVRnQ2MwTjIvcWxwNFg2UUxW?=
 =?utf-8?B?WVpOUml4RGZEajNmQjZMZkVheHdyVHM1NTFWaC93eUY3SXY4aXlqbVVaSlh3?=
 =?utf-8?B?RzJmZ05VZXltRjB3QTFrS0JRN0lyQUZTaEdFeVREbWtCVGtRZ3FqQ1p1YkRJ?=
 =?utf-8?B?Nm5sdnMyL0NwNWQ2SXNRNHI4SFYrVGFmTlQyRkVtblBvV0dyU0EvbFZNMWVK?=
 =?utf-8?B?eEQ2QzNlRHR5UnlBa1hKRXJrQlI4N1o2YUpnMlhLbjFFUHJKSFJQTk9vUUN5?=
 =?utf-8?B?S1ZtME4xNUgxN0RNVlQ1RUEwWmt0TlNCaDRLVXBBNWJ1T0UyeUxHVHdkbkJF?=
 =?utf-8?B?TENyNnFZQXBBL0VMMWw3VklCTjA3dTJvVTZmcWNUeXRjQTNCS283SFZlYXdy?=
 =?utf-8?B?RTJoT1BBTStrZjVFaXpqRmFDUXZPdUhON0FBcWxYOXNYYVFMT2lQTTBmR0Js?=
 =?utf-8?B?M1FZVEdPVGNQTXllYnpCdDhsQm5GOHk5bTAwUEtVZW1EVk5jcS9OVTVjOUx1?=
 =?utf-8?B?akk1Smkwek9ST3RlWHJaRlVZcG9nRmgwZVNqRVVBS2NRUGxvTlVhdFJ0Z0NL?=
 =?utf-8?B?TkxaVFFyZ2N1MDVZQXpscm9qbSs4Q3Q1a3hQd3J2dFBzU2IydTQ0VkQvUHQ1?=
 =?utf-8?B?Q0lSYlQydlZjcVVCZ3NEOWNlaFVleUk5YkRlTzg2MWZjMUpBRDdFU2R1RTBW?=
 =?utf-8?B?bmx4cE5hRTBJYVRoNjFqaHVYS21aeHQ1U0NjRVBQck1FL0hTRmtML3lHNXhl?=
 =?utf-8?B?VXlzRllGYzk0eEFoRlNxSVBOQ2VOU1ZiZjRQcHZ0RnF5NVZkVGhjNlNYTUg4?=
 =?utf-8?B?RHpmblpYaWZWVXlrTkJOenhJL3F3NWw1UTlkbDg2UHlQcy8wOHd4QkNUZUlv?=
 =?utf-8?B?OFJBaUxjZ0t1NkNjWjRicHVVb2hmNU1zelQ5YlVWaWJHd29XWi90OXB6WUR4?=
 =?utf-8?B?WE50R01KUlZxeU9FVWhXYzREUU1uN3gvSHVHZjBVSGlYckRQZjFCTWFhL0xv?=
 =?utf-8?B?RDZ4YUMrdTBnQWQyV1d1SlVtNVg4TkpNdEtPcCtreFJzN3RFcm1ocng2bGpH?=
 =?utf-8?B?RjZzUTJuTkpMV2JRcFh6YmllS1FaK0FjTDczM1owdkY1aktvWTVobzVvUXJt?=
 =?utf-8?B?MHAyWFFtbTNHSW5tYkU4N0ZxSGhQQ1pNeDhXOFFmaE5OSk1YcVJFN2FtV3NU?=
 =?utf-8?B?amdMT3pSTlc4N3ljZWc1RTdGWll1eUpGMENVaUtCZnF3eUVrZDdIWS9lSHFQ?=
 =?utf-8?B?RUE0RWRQaEY4SWJmdGl2V1VDdkNxU0pQMVUzdG5WZFVqTnVMOUlkTGFHbm1V?=
 =?utf-8?B?aFdTNFRyVFBEWUlFcmtBV3RZaGZLcUQ5UkY3aWpQWmF6R1JDZWNwS1BNSU44?=
 =?utf-8?B?emZmM1o4cm9FNzlqRlJOTDhOcFhkRytqQVVISjFjQ1M4QWx1eCtwWWlLYzBz?=
 =?utf-8?B?V2dSempNSS9mUE94MEF2djJVQWVCc2c0YW9jN2Z4M1M5Yk5wS000NWoyV2pm?=
 =?utf-8?B?OFA5TzNCWWRmeGE0b1YyZEt5UUpaSWpvcnJWMGwydkFiZkxLdWtjMVlmbHk1?=
 =?utf-8?B?elRUcm95RUxYRklOTEVSZXhjWmp0MDlqampGN3MxMDBrTTJVMk52M3RySlRP?=
 =?utf-8?Q?7/0ltxnZBZj5J8LusAP2gTNM6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240995ca-2d52-47be-53ad-08dd7da8eaa1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:11:00.2053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXUfgdNbU0QIgvX3bL6209Ntx+V++JlIGZYJY4l4auukI87bU7jEdfdu4cZUFFiQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250

On 17 Apr 2025, at 8:02, Gavin Guo wrote:

> On 4/17/25 19:32, Zi Yan wrote:
>> On 17 Apr 2025, at 7:21, Gavin Guo wrote:
>>
>>> On 4/17/25 17:04, David Hildenbrand wrote:
>>>> On 17.04.25 10:55, Hugh Dickins wrote:
>>>>> On Thu, 17 Apr 2025, David Hildenbrand wrote:
>>>>>> On 17.04.25 09:18, David Hildenbrand wrote:
>>>>>>> On 17.04.25 07:36, Hugh Dickins wrote:
>>>>>>>> On Wed, 16 Apr 2025, David Hildenbrand wrote:
>>>>>>>>>
>>>>>>>>> Why not something like
>>>>>>>>>
>>>>>>>>> struct folio *entry_folio;
>>>>>>>>>
>>>>>>>>> if (folio) {
>>>>>>>>>  =C2=A0 if (is_pmd_migration_entry(*pmd))
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entry_folio =3D pfn_swap_entry_fo=
lio(pmd_to_swp_entry(*pmd)));
>>>>>>>>>  =C2=A0 else
>>>>>>>>>  =C2=A0=C2=A0 entry_folio =3D pmd_folio(*pmd));
>>>>>>>>>
>>>>>>>>>  =C2=A0 if (folio !=3D entry_folio)
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>>>>> }
>>>>>>>>
>>>>>>>> My own preference is to not add unnecessary code:
>>>>>>>> if folio and pmd_migration entry, we're not interested in entry_fo=
lio.
>>>>>>>> But yes it could be written in lots of other ways.
>>>>>>>
>>>>>>> While I don't disagree about "not adding unnecessary code" in gener=
al,
>>>>>>> in this particular case just looking the folio up properly might be=
 the
>>>>>>> better alternative to reasoning about locking rules with conditiona=
l
>>>>>>> input parameters :)
>>>>>>>
>>>>>>
>>>>>> FWIW, I was wondering if we can rework that code, letting the caller=
 to the
>>>>>> checking and getting rid of the folio parameter. Something like this
>>>>>> (incomplete, just to
>>>>>> discuss if we could move the TTU_SPLIT_HUGE_PMD handling).
>>>>>
>>>>> Yes, I too dislike the folio parameter used for a single case, and ag=
ree
>>>>> it's better for the caller who chose pmd to check that *pmd fits the =
folio.
>>>>>
>>>>> I haven't checked your code below, but it looks like a much better wa=
y
>>>>> to proceed, using the page_vma_mapped_walk() to get pmd lock and chec=
k;
>>>>> and cutting out two or more layers of split_huge_pmd obscurity.
>>>>>
>>>>> Way to go.=C2=A0 However... what we want right now is a fix that can =
easily
>>>>> go to stable: the rearrangements here in 6.15-rc mean, I think, that
>>>>> whatever goes into the current tree will have to be placed differentl=
y
>>>>> for stable, no seamless backports; but Gavin's patch (reworked if you
>>>>> insist) can be adapted to stable (differently for different releases)
>>>>> more more easily than the future direction you're proposing here.
>>>>
>>>> I'm fine with going with the current patch and looking into cleaning i=
t up properly (if possible).
>>>>
>>>> So for this patch
>>>>
>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>>
>>>> @Gavin, can you look into cleaning that up?
>>>
>>> Thank you for your review. Before I begin the cleanup, could you please
>>> confirm the following action items:
>>>
>>> Zi Yan's suggestions for the patch are:
>>> 1. Replace the page fault with an invalid address access in the commit
>>>     description.
>>>
>>> 2. Simplify the nested if-statements into a single if-statement to
>>>     reduce indentation.
>>
>> 3. Can you please add Huge=E2=80=99s explanation below in the commit log=
?
>> That clarifies the issue. Thank you for the fix.
>
> Sure, will send out another patch for your review. Thank you for the revi=
ew.
>
Thanks. Do you mind sharing the syzkaller reproducer if that is
possible and easy? I am trying to understand more about the issue.

>>
>> =E2=80=9C
>> an anon_vma lookup points to a
>> location which may contain the folio of interest, but might instead
>> contain another folio: and weeding out those other folios is precisely
>> what the "folio !=3D pmd_folio((*pmd)" check (and the "risk of replacing
>> the wrong folio" comment a few lines above it) is for.
>> =E2=80=9D
>>
>> With that, Acked-by: Zi Yan <ziy@nvidia.com>
>>
>>>
>>> David, based on your comment, I understand that you are recommending th=
e
>>> entry_folio implementation. Also, from your discussion with Hugh, it
>>> appears you agreed with my original approach of returning early when
>>> encountering a PMD migration entry, thereby avoiding unnecessary checks=
.
>>> Is that correct? If so, I will keep the current logic. Do you have any
>>> additional cleanup suggestions?
>>>
>>> I will start the cleanup work after confirmation.
>>>
>>>>
>>>>>
>>>>> (Hmm, that may be another reason for preferring the reasoning by
>>>>> folio lock: forgive me if I'm misremembering, but didn't those
>>>>> page migration swapops get renamed, some time around 5.11?)
>>>>
>>>> I remember that we did something to PTE handling stuff in the context =
of PTE markers. But things keep changing all of the time .. :)
>>>>
>>
>>
>> Best Regards,
>> Yan, Zi


Best Regards,
Yan, Zi
