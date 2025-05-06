Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408F283C8E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537943; cv=fail; b=mWs6bt1hDfEjWmlBIdzULekEeBnEwfKTN2fopGdcfF6jU+lXDnJAiSbGZ7kLR/x0qGpnMFevdMCF5WW5ucyVssVs6uEKrSSUHStWHGcWlJBLk2XF+PD4uAG+5k7JtpXDwlMtx4TTBjLq0TW0kks7BkehDqbhR0Tf/782Fu2sH4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537943; c=relaxed/simple;
	bh=12LAQSB68Rkj9huAdgmetrwmRRByE8rrUU2xNmYOuc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q1c9qbyNQbmvkMOR/0fYNLZ1kL6trURVBX1M7XiVnitDiux1/0ZKUbcegZ4M1gEMuUvVsYaFxVSISTk0EWxhPWl658xtYnyUJwVRp3EbSHNmgBvLR03P6eVQdXnLphH02o/2YfBlM/Mq0MBcdgvySz+3h/RXG0A+9Bo6ZipMoRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a3IFoy5G; arc=fail smtp.client-ip=40.107.94.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a3IFoy5G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjG+3AjydGwgmZVV3J+yfkJXUX3ZSNp6EyuJ0lqik0Wo4V+6coTSMJmTsD3/sHDgnriXa4uz4RKB2N1kgmGML7OLXy0czhirBJXhRQix//plO8Zmx19c/XVZob1/0rtoDm6nxMVmZTmpFGdpDBWteQgNyf63yJaBaCRrIIXzMMXZxjcyvr/3f7mILUxzzkUMr/gwtV7R3zoxWq5eDmcSUgHkjsdohSqoH244Nl73ON3Hgy5uDEOCT2bYGLKl8gSJYGzx86L39yuRtRlHmrZjgA554/2MDSUFyrUTO9QQG+w1jarjA4w4CeVQXrJqXf5+NtVUOWIhcGsJdAGyU0nbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyxoX3FAE1CQMyFUF6hDwdSs5kpJGUO/aKF67GNvgd0=;
 b=cLSzSf8fTHO+222ejSSOY4BeGYzwo2e3FFHJ/AMpJw+rV58SJaRubqo1T3o4WGSNslovy9wxLCG2HXsUTchOj1oTPU0ouWNYjzcE45vZh+VVSS3jBv0MLKuFADK9/ZErOC6DNflmttIblNOqQv9VqeYVOEOl5jmRkYMnFM5Vl7KbR0PTnx4nImwfypgys85ASl5zGl7sCSY+AG8prYi1ilgLmh6mAg4V0H/HguHqZIZwf2fIMc3PI9HvALQIi/FXkhfDaof9KblZ+jH1F6V9HOxtF61z9WLh1MSdBOJps4609ei4ncc7AT+tGbm65EdJAbAJLWQNEeZS89LSYGs2yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyxoX3FAE1CQMyFUF6hDwdSs5kpJGUO/aKF67GNvgd0=;
 b=a3IFoy5GCsgY++63XgbjvSf5Hg173h3wpt+ixsjxlq6ZkO7ACc04g8D1IAbhv1aZHVtHSPNZ7a661mEp8Uh5WuU2oRp9SjCP6auEqcECPo8bUfafvGSjjM6s7+47llrI6XxA0sAmHVSeQozXmUm8pXGYZLih/UG6Nynj9ozOQCU=
Received: from PH7PR17CA0018.namprd17.prod.outlook.com (2603:10b6:510:324::9)
 by BL3PR12MB6450.namprd12.prod.outlook.com (2603:10b6:208:3b9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 13:25:34 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:510:324:cafe::e8) by PH7PR17CA0018.outlook.office365.com
 (2603:10b6:510:324::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 13:25:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.3 via Frontend Transport; Tue, 6 May 2025 13:25:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 08:25:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 08:25:33 -0500
Received: from [172.18.31.235] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 May 2025 08:25:32 -0500
Message-ID: <63d6ff3c-bed5-4a7f-bd3e-50b99b5a6f4b@amd.com>
Date: Tue, 6 May 2025 09:25:34 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenbus: Allow PVH dom0 a non-local xenstore
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
References: <20250503131935.1885-1-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2505051343080.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2505051343080.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|BL3PR12MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f4bd14-cf7d-48c0-3a2c-08dd8ca17b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFc1LytnQWdsRE5MdVJCeUtxd1ltaStpTndRaGtFVC93NjRtaXdWSlVTWFZz?=
 =?utf-8?B?dVpCaHYvSExmUzgvSUZHWkIwdVNubThFbnM3WkFSQTRNcjhWdVFqM2dkN1o5?=
 =?utf-8?B?a0hpUG5sNTZGVndEWnZtNDNOUzExV2M2Q1RGVXo4U3R1aS9aemJvMTUvZTlV?=
 =?utf-8?B?Zkx3V2pMR09pbGdwUFNDQmhjN2l3bkxKZUhxKzVUMUdvRWlSNU10RkRMYkNh?=
 =?utf-8?B?a0tuQXlsbG11ZkE4Vkt5UVdrL2F3M3RXd0s4VEsvRms2Zk5SNHBlclVBK1Y2?=
 =?utf-8?B?TkYyN0FRZmhWbVNSRlY4SXZSR2Q4eDBNaHhETTR5Nzd0NmRUV2lPVGNodGV1?=
 =?utf-8?B?SkVoVGdKMlV6L1F2MFhHa0F2T2pncHVDUWlVVjl1bE9sZ3MwVzcxNFBoOHpL?=
 =?utf-8?B?T3lNRjRBWWdGQjlHbnM5VjFzdDYvMWZlMWliS1dZNkYrUjdkYUtCSWpRb3lF?=
 =?utf-8?B?bjRCNUtvL1RNcHhFY0Y1bWIzclZnTENuMjNKbFVDR1BBaEFmSllKM3hIMUZs?=
 =?utf-8?B?ei8xWVRqTjlPWTVuSkMxemxxakFRQzRCbEd3Vi9PN3lWNXFKbWJTN2hSckF1?=
 =?utf-8?B?ZXhqK3IzbzhEVUhCYzBTenFDVVM0SG8rL2R4Yll3b3pWc1dLMWFlUFp1RC9k?=
 =?utf-8?B?QUVubS9RalZUK01aR2xBWGxjUmlaMms2bUZVN3QyRExobU1EMlpnOHdkNmdX?=
 =?utf-8?B?L2dWZXRFczB0Q3hhRU9hbHhLMjExUG9vUnc0VFdTMHl0QmhjNTlkNktzUXdm?=
 =?utf-8?B?dHJITFRLSnl5Skpsay9rRzV6WTd1dkk5UnJOY29IdWIrOHVSYnl6eWpNMllM?=
 =?utf-8?B?U2RyMTFJT1cyQXl0YTJLV093V1hYdkt3Q3JlcHVreTZKWnJrSkNZSXJIQUN1?=
 =?utf-8?B?S3c1OEhycmhvWHlBaUlSWVUwa0pNRUdUNWZSUmc3K1NLSk0zTS8veGlyQlND?=
 =?utf-8?B?aVAzQXlXa0drb3dpYjJBeUFuVmRLTklnd2Noay9rRWltclJCL251TDE0Zk1R?=
 =?utf-8?B?RnUzWDZyeVprU0lvNzk3SElIT1VmRFZHSE9pNDJSbFJGYXlwYjNhb0VqRGNY?=
 =?utf-8?B?MjBYSnY5T2tCbENuMGJmQTJ1cW96SFBRZFMyNWwxQTMwRyt4RmNIckcyZ1I0?=
 =?utf-8?B?NUcxcFdtL2thMTE2aDduNW5QQVlnQzVDS1VIOUk3VkxQOCt2ZHJkdG5iaVRt?=
 =?utf-8?B?TDB2Ui8zTU1acFZ2Y0V2ZG5vSDlxaFRTQjNpL1FxWm5DRW45ZHpoNEQxT0ZO?=
 =?utf-8?B?Z0p1YTBUb1BUZ3JpQVBTejBBeG1DVzJjbVIrbkpVdVBVd1J5cHZJWFFCQU8z?=
 =?utf-8?B?ekRLLzV4RkJUUEsyRlVabklIMUY3b1h4VGp3Sy96dWxyeTRCU1MydnE3dG5M?=
 =?utf-8?B?R3JVVkZ4cDRha0U5b2U3Z3lkS2g3OXNIaWJJbG5GZ3E3dW9jays1VGpaRkJH?=
 =?utf-8?B?R1JSZlpGVkVBQzRTZjJrbkpSU2k3SkVtVnZ2SUkrNkNzRnNDU3dmRmFRRXB1?=
 =?utf-8?B?Q2dBcjZYbTdhQVhoTWtOcTczYjhxcDBOOU93RE5vZjBjSTBmYkhZeDJYMTVX?=
 =?utf-8?B?RDRVUkw2VnIwYUtVTTFaWW96a0U2YnVxZmhMVlRqZTBIK3drTms4RVYwaWZM?=
 =?utf-8?B?ajdiSEFseG9ZbmQ4aE9uUy9mL093cklENVBwL2lQL1hpa2I2L1R3RjVFMjRu?=
 =?utf-8?B?ZEsvRi8wTGxLZVFOdG1QbWFHNXdEM3BIQStJbmxQb0ZSeDl0dndGVktzRWti?=
 =?utf-8?B?cHJIRWtKeDdJbnU0RjdCTnl5T0pjSFRKYVlMMHZSaUF6MGYyUCtUWnU3VEdR?=
 =?utf-8?B?QkFoTktTd2ZFVGdXdXFjSDRuN044bU9udWxXUUNsNDV6a0ExUDgzYUY1b0lq?=
 =?utf-8?B?QjlyeEZYbmQ4dHcwN3BJT0paSkppbEwvZ0RJZW9iYTVHdHlxNUkzWmRFMW42?=
 =?utf-8?B?bnpGOFZvUUM4SHRLQjJLR3ZEUk9qQ3Bwa1VyOW4vdlpVRHBIWHphOUxINXdp?=
 =?utf-8?B?Qkx6WUtHZEJYeERYR0UzelJzR0M1M2VzSzZqUndmYnVUcGtPbFRwTmdCaVZW?=
 =?utf-8?Q?yPmxA0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:25:34.3133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f4bd14-cf7d-48c0-3a2c-08dd8ca17b69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6450

On 2025-05-05 16:44, Stefano Stabellini wrote:
> On Sat, 3 May 2025, Jason Andryuk wrote:
>> Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
>> currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
>> xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
>> late init path.
>>
>> Drop the use of xen_initial_domain() and just check for the event
>> channel instead.  This matches the PV case where there is no check for
>> initial domain.
>>
>> Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
>> chance that high bits are set for the 32bit event channel.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks, Stefano.  But I'm wondering if this might break ARM enhanced 
no-xenstore.

> 
>> ---
>>   drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
>> index 6d32ffb01136..7604f70ee108 100644
>> --- a/drivers/xen/xenbus/xenbus_probe.c
>> +++ b/drivers/xen/xenbus/xenbus_probe.c
>> @@ -966,9 +966,15 @@ static int __init xenbus_init(void)
>>   	if (xen_pv_domain())
>>   		xen_store_domain_type = XS_PV;
>>   	if (xen_hvm_domain())
>> +	{
>>   		xen_store_domain_type = XS_HVM;

ARM would have everything set to XS_HVM...

>> -	if (xen_hvm_domain() && xen_initial_domain())
>> -		xen_store_domain_type = XS_LOCAL;

...and only dom0 set to XS_LOCAL.

>> +		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
>> +		if (err)
>> +			goto out_error;
>> +		xen_store_evtchn = (int)v;
>> +		if (!v)
>> +			xen_store_domain_type = XS_LOCAL;
>> +	}
>>   	if (xen_pv_domain() && !xen_start_info->store_evtchn)
>>   		xen_store_domain_type = XS_LOCAL;
>>   	if (xen_pv_domain() && xen_start_info->store_evtchn)
>> @@ -987,10 +993,6 @@ static int __init xenbus_init(void)
>>   		xen_store_interface = gfn_to_virt(xen_store_gfn);
>>   		break;
>>   	case XS_HVM:
>> -		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
>> -		if (err)
>> -			goto out_error;
>> -		xen_store_evtchn = (int)v;
>>   		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
>>   		if (err)
>>   			goto out_error;
                 /*
                  * Uninitialized hvm_params are zero and return no error.
                  * Although it is theoretically possible to have
                  * HVM_PARAM_STORE_PFN set to zero on purpose, in 
reality it is
                  * not zero when valid. If zero, it means that Xenstore 
hasn't
                  * been properly initialized. Instead of attempting to 
map a
                  * wrong guest physical address return error.
                  *
                  * Also recognize all bits set as an 
invalid/uninitialized value.
                  */
                 if (!v) {
                         err = -ENOENT;
                         goto out_error;
                 }

IIUC, this !v check is for enhanced no-xenstore to end up in XS_UNKNOWN. 
  I'll have to re-work to handle that case.

Regards,
Jason


>> -- 
>> 2.34.1
>>

