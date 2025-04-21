Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B612EF50F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 04:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745210870; cv=fail; b=skttiq5aOy2Atf5LXgANj0kHBUoUDhL6VRHb+rmC9quxCN40l61/eI3xIbreTYUAhqx2H5YGmBbj6X7JYM5/yhQSC6nNq65CnaL7xzxOtXEybnpE1HEhE6CD7O5qdUADBH2wBNTpHIysiPOBSce6PY7a/rECg7ntHRQmZq2DUC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745210870; c=relaxed/simple;
	bh=aweNK8Sn7tlhpTj08iunakPibRZb3ihPI8NVDFvLQ7I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gE/7MKhAfDu3wAdKY8wjjvOHDMhgytxMrKqqmk9LPi7p5c6kfqdTW0QCQqH0dJ1SXdS10fjgpLx6Gce1T+YRFiISFk++BTpfaX4QCJviKZvjiUHnz0Gn4r+HW2qwNwTEP0ZSGtf8kL8+vjuIUx6jlgfXMilx1JgpBZr5HY8SbX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TYGyCEXk; arc=fail smtp.client-ip=40.107.236.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TYGyCEXk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOhykF2UbA/BBvHPOi+3sCJDmejkhmVAWkKfNevkAfv+60vQ1k5iyMCpfU7Azq+HY0hbpLlRYKy1IN2qJXTQiLzFfuhambkJcOZDauyYpu8Ir376h1afpMfr+29qjWz8h1KtyoaPkRacXPxwFtOwHVfsXhpjfv2Z5F3oaKTixa16Eq+7UTlyXPMfLOvIc0S8wBxIPRkf7HEGkFfhD/1B/CDKf3/ar8MoG+cU822eJ6JiwOJGHDXQd3mGqhXuIY4NJypqeR6J7hlzxs8TynN5SOSg8HXl/pq3j8TFMk6TBLU3659xz/7Rh8luRjfL0wqnmlnUHQ89kGPaQS8bbm08UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCXHQ2bq7F/tqcJceBb8xzaDtXDbBIR32FXvVp26lho=;
 b=SpLRLB5KaX/Q+rKaUpp8CQBDCjdgMxdZz4ql8J7O32yWJ47URev/C/3Hh9nJjnk7SQ78E9xO1XFrX8iS7nzBUox+R50kkoJDSE7DDNjB8jblhqZ6N7UDEv/eIk0vrqSv/NI75hKJPndRV8L4+8Dx35wk8hcMP1cu7pmbAEZCsbaiFYZqKiSSbf/VFQHbFUZRjF/GnsTSXgQiKDUodJ/YB2RjuVoAcg3vHJhsLvUhXvR+oudqgA0T9WkshcA9scPoGo5akuDlDquwDAa2KDMRi1s+Na9Rf3ufcJWeDigHWK0rFB14vsS/6RKSud6FTwrZLOd18gZ/+o+W/3s+FAH8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCXHQ2bq7F/tqcJceBb8xzaDtXDbBIR32FXvVp26lho=;
 b=TYGyCEXkOXkPovBHgR/oaW9HZ1p6jP3rDcLCIbaqK1XXEu8XC16OtH5HChImQE2gXppMJlfQtOj24tdm8NAt9cs3vemqGhf+9GMz58C8ZligDVvLF9/hki7lpBoXVvuIAYw0WbG83T/GE88ysvAz8SipvpI8UcPpjllmWTL+YOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4270.namprd12.prod.outlook.com (2603:10b6:208:1d9::21)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 04:47:46 +0000
Received: from MN2PR12MB4270.namprd12.prod.outlook.com
 ([fe80::2e50:d5b4:45f2:684d]) by MN2PR12MB4270.namprd12.prod.outlook.com
 ([fe80::2e50:d5b4:45f2:684d%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 04:47:46 +0000
Message-ID: <0de460d4-b0c6-4d41-bb9e-72af20cf0777@amd.com>
Date: Mon, 21 Apr 2025 10:17:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] mm/vmalloc.c: return explicit error value in
 alloc_vmap_area()
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, urezki@gmail.com, vishal.moola@gmail.com,
 linux-kernel@vger.kernel.org
References: <20250418223653.243436-1-bhe@redhat.com>
 <20250418223653.243436-6-bhe@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250418223653.243436-6-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::12) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4270:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: bf06616b-81bd-4fe3-fed8-08dd808fa81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1BpS3V0TWhqQzJvK1V3TTlZSFc5Wm5IRDlyNEZkM2FFME1Ua2dKQkZhSDBB?=
 =?utf-8?B?dDdJNVVGOFl1dkYraEIweWZlaGJTTjZkWGRvcnZ2MVhSWFdJNXVabVg0aDR4?=
 =?utf-8?B?c0k4NldjRStZY1Q3OThIaWFVclFHREY0YldwbVh5THVyZVlWcDVBVXVIbHhV?=
 =?utf-8?B?OGM5T0I3RnNSUmIwSjZ1VkwvNC9RVnQ0MVFKdFl1R3VVVWQ4bUdkVXdZbXU0?=
 =?utf-8?B?dEVMdHZRdzcxYjFqSUJHbkUzODBnKzFncStoVXpFdE93TzBrZWYzd1EwWG9V?=
 =?utf-8?B?Z01FMHRBZ0IzR1VkZnF4KzZWZlkxZzIzN1JvMHMyZ1lBTEljblVoOXo1aGxh?=
 =?utf-8?B?Yi9KMzc5ZmdyM0JNbGlzdDVTdjBETWt6TnZzbENPMnhTZ3ZoSFJyeFk1a1lj?=
 =?utf-8?B?VnJ1WWQzTlc4STJZM0VFeThsVkQydWRnK01tSGZhNHg2Q3lOM1NGYVQ1eUky?=
 =?utf-8?B?WHBYUFpzNXZSUHp1dFdZUXlwYmtkYXZhbnQvYlVIVzI0RjI0OTU3ME03S1RF?=
 =?utf-8?B?UmFLbERtS1RsY2YrYno3YTRGQjBDZzZiOENSamlIVkorVlZGRm5TaktLVTFI?=
 =?utf-8?B?UzR2cy9PWFlHZkR2RGR4TjJjcXAvYlZmUGxmMUxubmVrY24zS25wcDVnaHdk?=
 =?utf-8?B?ZmdMZkY2Lyt0a3FCZFlLcVdUZ3FwcE5kaVEzbngreGFMRHpDZDBDMzRIVUYx?=
 =?utf-8?B?M2Y5bEcwalpwUjB2NmF2R3RyVWoxTjVLY2RVUXQxUnAxOGlwbENQTGdTalJC?=
 =?utf-8?B?OWVyRkQ5RW5mTklzM1ZFQyt2VVVUQ2VTYnFUSEhhTmRXbUc4ZU9tUVY4RURx?=
 =?utf-8?B?OEQvNWk3QnBrMk8xRk94TGMvTysvSUN2U3VPMFM0MU4zUnpnbDk0L01hQ3c2?=
 =?utf-8?B?WjRzUmNRN2FMRWRuZ0pFSWIzaEg5aHI3L2pmcmkzdmJMa05pa04ycm0rKytR?=
 =?utf-8?B?YzFRQmhMVy8ybFljMTJqVXlxdUNrSlU4dEt4ZkpmTG8vYWdRbEE0TXFRRVRZ?=
 =?utf-8?B?VVFzbGhreGxKR1RveDF3L2ROOGZURGUxemlsYkc2SEV0MVdjeE1uWXR2aWxF?=
 =?utf-8?B?cWZBU0lQZG5YbStEalFIaDJ6Ukp0b0RpcE03OGFDMmJZT2VQSG9yRzlJODQz?=
 =?utf-8?B?a0lZOGZML29CZEgra2VrNXRxYXIwUXlXOXRDTU11Q2QxUCtGQUkzSmtuSDVG?=
 =?utf-8?B?YmU0bGc2YjVlY01jRzFDVE1yYU5hdllmNG5XdXRmaER2aW85UHBDZnRaTEFX?=
 =?utf-8?B?eEF5bkRvU29yMnlicThVMTVZUDVqQXRnVEt6aFRUZDI3Z2laUkpsdDJkZUJN?=
 =?utf-8?B?L01EWi9yQ0Y2SDJYNS9jOExUR0dLRE55ZWF6RmRZTDB3MksxSm9uZkYzSGJW?=
 =?utf-8?B?aSt1N0kvZFBJRzZOQVYyWE1ianVmV1JrSkt6RjlGMFZTcnJOZE1uY052VEx2?=
 =?utf-8?B?bHl2N2x5b2xuL3VtWndINEhaTzNraHlpWkRXNGJHNC9QUmtBamJOc2NGWUk0?=
 =?utf-8?B?MmRNNFRHL0x5alFvQ2ljWDB6c1QrY1VReEhZV0tHTlJyeEZZcm45dFBnQW4x?=
 =?utf-8?B?cEtrMG9SYTlKVEJoUE83bXZ5Y1VCbi80dW15TzlxUlF5Nm1MdzNPS2swMjBK?=
 =?utf-8?B?c2xudGtoS1pYdWtnVHIwYzdWRUJzYjAvbGhmaU5UY2hwL3NsbmtVbGh0WUtu?=
 =?utf-8?B?ak9BaG8wcE9aUldJdE1VRWlocGVtcm9JQlhFaTVNUTVnYXlnblQ1bDBtM3JC?=
 =?utf-8?B?MWh0U2FOOGNyMzBOaThJNytFZXVocHZMUXFwNkhhdW5iU0RqTGtBdnZpZGo5?=
 =?utf-8?B?alVoZGtmUlBVUlRTS0Mycmo5RWppSEpRV1h1akV2RW8wR2hXbHRvTmMwaUp6?=
 =?utf-8?B?TktxV1lKbHMrVjE2dGYwYmlacEVrcFBBQ3NYMlBobTZJcmpWZEczN2p6SXVF?=
 =?utf-8?Q?HhWxM1VICQQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4270.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RC9sc3FNdmd0dmxNb2dBMllGaGlnY0hxQk00ZXFvNy9NeTBSM1d6bHM3SmtB?=
 =?utf-8?B?TnZqNXlmOVV5ZVNSaGpTSXFvaE1SczRmR080b2hmYmFLSlIzN2Y4Uy9uaXJu?=
 =?utf-8?B?NG5yQmJ6bWNhTzRmY0pYTzU0TG9BOHNxdjg3dmhlYzJkaTlXakZ3dDYrQUpY?=
 =?utf-8?B?Q0tjVzYvamhGbHkwQ3VjV0NkekRiSGg1SG92dW1jbk11alEzaWFzRWJlaWZv?=
 =?utf-8?B?RExKU09uclV6WnlzaCt0L215TVViUmE4akpKdktZUS8vSmlacDNiTkY0K0J3?=
 =?utf-8?B?UzRRK1lSbXIrak52b2lGQXBWV1pESFpSck9EeHF1bURqVE1vbWVkK1hjamRq?=
 =?utf-8?B?MEo2bTR6NVJmQ1ZsSEZ6clZ2QmpKYXB1NkVTb3RjN09qdTNNbnBsWUlHNndw?=
 =?utf-8?B?ejIxVVBPRHZaY0lHTWtHY0NxUS9Od2VqVUVYcXdJNnlhSVVaT1hsZU1HT3M1?=
 =?utf-8?B?eEhQa0pSeVVhNk9xNXZoMkVqd2JxcUZmWTNxR29acGpvZHVPZDBWSTcrdGJk?=
 =?utf-8?B?UEpvN1ZkbEoxNGRWOVVHVkhha3FjeHpKeDNTeFVyWkJUMGFOUEtqMHRxYXI2?=
 =?utf-8?B?enVUZGZSZ2dEdGkxcXdLZmRsb2NuS1l5YnQrcCtkeklraTJEczBPalhVR3Mr?=
 =?utf-8?B?UDJ2Skw5cGNpNlA0TkxxdWFCZjZmVmszYkpBU25mRzhiVEtLYXNFd25XR0g5?=
 =?utf-8?B?N1ZSY1lQc21HelhZT2RFOVVIc0NUMmRtMW5yZXRMcmgrWnlWY3pRQXpqb0ZW?=
 =?utf-8?B?VGJRdmFpYzJIdXVYUDJObkV4ZzZ2R2VIVUJWVkJFcitzZUV6QUFDTE9TWHN3?=
 =?utf-8?B?dEp3ekZaMkpzSzhwTE5RZHhiemlIaWpqNk5BcjNDaUVnUmdyWFJrN3Y0aFpU?=
 =?utf-8?B?bnFNeHZFUWt6Z0xHamVqT1cxTndFLzIyclF3bDRkMkNpM1NDZktrc2M4cW5B?=
 =?utf-8?B?YVdSNEkyOU1HR3F2Vm1GQ2pEU0tKQWJkcDFnb0JrbVl0YWtvejhJZGJVTkd1?=
 =?utf-8?B?bEY4a3A0SWs3TkxFdDlyc3ZFekkrODJwNmxZNGZXeEdtUElIRDByWEtQS0tV?=
 =?utf-8?B?R0g2UXlXSE56SWVQWlY1dlFqRWtTTUtqVnNKK2cyTExRQk42MDRORm5CMVBX?=
 =?utf-8?B?UWMvYnFHeGJITXhBd1pna3hHdFFvRHVpdmNJa0xUWHZEU09FeE4xRFcycitF?=
 =?utf-8?B?QVJ6VGtZbk1pRllKc3ZOVzB1QWdzRDV1eSsxYVYzR3FtQkdDNVB1VmduODRt?=
 =?utf-8?B?K08yckhZdWZjWUZxK2E4b1pRd05UNnN4WDQ2L1BRQ25POVQ2Rm9tK0tUOFAr?=
 =?utf-8?B?Z2ZHNDR2YXJtZk5kTjFNMU43YXdHYkEzSDB0alFiZ3pqYXlGTlVZNmlpM1pE?=
 =?utf-8?B?SUFpRE9wblZYY1RMRzF2T2s3aVpKRm5SYVZsV29wYktkVXU4VzlCQ3FLdytE?=
 =?utf-8?B?Qld4R1Z3OU1CWlNPbkcxdlVyV2xmYWJxWWJGQ1hQRGlURmJTNVB2ZWkvd2hh?=
 =?utf-8?B?NFRUTmRVQXFndmo1TXlvSks4bjN2WkJydkZYUjFiOXJZYytyNEVwUHBPSDBz?=
 =?utf-8?B?Q0twY2dVaENWVXZZeUFLYlFRTTlTa04yLzl6TENmWmZITE5GaUdEa0dJOWpk?=
 =?utf-8?B?WlNyUThsbzVnckVRSGNPTzF6S2l4QXNVSkEvMHVaK0Z6YWt1MHJJLytvWElT?=
 =?utf-8?B?UUtHZUxOOVdFSFBNZG1YalUyZUxPdkRKN2VoaDVLZGF5ZjFOQklPYUplU3F5?=
 =?utf-8?B?dXpQLzBVdWRBQzkyTnZFYW9xY2Z2QzZ0dVgrdjljanRVSDJrQWlKZis1UWhj?=
 =?utf-8?B?SUhhSk8xNnZrNUVBcDZUTlZKWFIycUlXQ3ZIN0p3MDhEdnB3WkZrQmVpMDV2?=
 =?utf-8?B?VVNhNUN4Q3dUbGFVVnJadVdFaDR1K2xLMnBJUkZaZHFENm9IWTN4ZnpPWlhH?=
 =?utf-8?B?Y2NYOVBxZkJNMk5OQWVRL0J2cEdBSE9DLzNsNGI1Y1lWdWNRbm91STVWdVgz?=
 =?utf-8?B?QU1HVGNOcmtPM0lQTWRIbWZxOExlcjNoM2NjTFU0L2RSRFgrRmNjTkVDdFRH?=
 =?utf-8?B?MkFuRDQwQkNXWFAxc0F4djY0ZnN6RG8rZjJqRWJHZGFDeEVMSTlRRlU5YUcz?=
 =?utf-8?Q?wXg61FZxOVOicIL0b+cxujO+n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf06616b-81bd-4fe3-fed8-08dd808fa81b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 04:47:45.9378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5xBNIIoCIl+1LMYHyHU75YRUzKKNr4XdWey8+fVB0u9l+vzJ5g9IK1Y9VFvfhX8OCIu52y7dnzLVjpeI6Tadg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230

On 4/19/2025 4:06 AM, Baoquan He wrote:
> In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
> indicate if the allocation is successful or failed. That is not very clear.
> 
> Here change to return explicit error values and check them to judge if
> allocation is successful.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 39e043ba969b..0251402ca5b9 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1698,7 +1698,7 @@ va_clip(struct rb_root *root, struct list_head *head,
>  			 */
>  			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
>  			if (!lva)
> -				return -1;
> +				return -ENOMEM;
>  		}
>  
>  		/*
> @@ -1712,7 +1712,7 @@ va_clip(struct rb_root *root, struct list_head *head,
>  		 */
>  		va->va_start = nva_start_addr + size;
>  	} else {
> -		return -1;
> +		return -EINVAL;
>  	}
>  
>  	if (type != FL_FIT_TYPE) {
> @@ -1741,19 +1741,19 @@ va_alloc(struct vmap_area *va,
>  
>  	/* Check the "vend" restriction. */
>  	if (nva_start_addr + size > vend)
> -		return vend;
> +		return -ERANGE;
>  
>  	/* Update the free vmap_area. */
>  	ret = va_clip(root, head, va, nva_start_addr, size);
>  	if (WARN_ON_ONCE(ret))
> -		return vend;
> +		return ret;
>  
>  	return nva_start_addr;
>  }
>  
>  /*
>   * Returns a start address of the newly allocated area, if success.
> - * Otherwise a vend is returned that indicates failure.
> + * Otherwise an error value is returned that indicates failure.
>   */
>  static __always_inline unsigned long
>  __alloc_vmap_area(struct rb_root *root, struct list_head *head,
> @@ -1778,14 +1778,13 @@ __alloc_vmap_area(struct rb_root *root, struct list_head *head,
>  
>  	va = find_vmap_lowest_match(root, size, align, vstart, adjust_search_size);
>  	if (unlikely(!va))
> -		return vend;
> +		return -ENOENT;
>  
>  	nva_start_addr = va_alloc(va, root, head, size, align, vstart, vend);
> -	if (nva_start_addr == vend)
> -		return vend;
>  
>  #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
> -	find_vmap_lowest_match_check(root, head, size, align);
> +	if (!IS_ERR_VALUE(nva_start_addr))
> +		find_vmap_lowest_match_check(root, head, size, align);
>  #endif
>  
>  	return nva_start_addr;
> @@ -1915,7 +1914,7 @@ node_alloc(unsigned long size, unsigned long align,
>  	struct vmap_area *va;
>  
>  	*vn_id = 0;
> -	*addr = vend;
> +	*addr = -EINVAL;
>  
>  	/*
>  	 * Fallback to a global heap if not vmalloc or there
> @@ -1995,20 +1994,20 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
>  	}
>  
>  retry:
> -	if (addr == vend) {
> +	if (IS_ERR_VALUE(addr)) {
>  		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
>  		addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
>  			size, align, vstart, vend);
>  		spin_unlock(&free_vmap_area_lock);
>  	}
>  
> -	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
> +	trace_alloc_vmap_area(addr, size, align, vstart, vend, IS_ERR_VALUE(addr));
>  
>  	/*
> -	 * If an allocation fails, the "vend" address is
> +	 * If an allocation fails, the error value is
>  	 * returned. Therefore trigger the overflow path.
>  	 */
> -	if (unlikely(addr == vend))
> +	if (IS_ERR_VALUE(addr))
>  		goto overflow;
>  
>  	va->va_start = addr;

Reviewed-by: Shivank Garg <shivankg@amd.com>

Thanks,
Shivank

