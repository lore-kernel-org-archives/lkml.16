Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5FE1DF73C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283152; cv=fail; b=OEso2TMcZKOrDwc7J61oH5YkSu1SXVsVEcZi7/2scEZy7ZZZUaf/2pzzGhcUbXWCQvAm5whs7hbLT6EWFFQRQh/gznJFakqo+bXg6ulnuLHSjm1F1ZRqGycH4duldj848L9qgJFndGjgyYzIUkUyqgUA0JdVWR+HfB7DkCAzynU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283152; c=relaxed/simple;
	bh=707YZMTC1+KTk0Ag9PVvSO0gniXfLaBTNLvtJeWjAgg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cg0zw9B59IS5fzH/bL3yEEwCSfBtuLB3HsV4fMG45VZ8C5okkXYV+N1kge336I22cyuKIpalXfn2891/DgYUaOA7E2Uzs3keVh3YBob/zNT16sSYcodzd7bDq6QMCR9QtHM8gYtAcUaynpqLcdecsuSj1ZzIn5izpyPa6bWDbFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AxS9N4TJ; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AxS9N4TJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryDMkMJibuXRoRa+dgNJHTK27M74CMvdKDcM5G8/RDDzGXjn+WaOADGyDoEkgHU9eKQMgdy8hqCTQjGZlrn7uP4b0b4JyHq1iT4h5Aw1TIWmWiH4gtU11Dujlzk2Dlxe+UKKHz0n/SVZ/5Rse1EX9RnqS8Vqw56MuIp6OETazwsm5mV5My/8pisE7p29Xlkqxf91ut13uKS/hJgtDRrXsJ+1ioJ+NrogKafWU3bNnRPQRpon6055u3Bg1llrmBzjkUvGUj94UXOE1yVMyfiZP2gshrLcR90cAi2M3MPo9dlg4yuKmtAj5ngiqgBwFUzT1C/wtHPnDi0N2L95vzQoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ3I9FZXMG+Mue9S7l61YXkrMhuS4tjLhDspyYO9P8w=;
 b=grGFHCbxPnkApAb33+Y3NORiGu2sCkvbqYbZ0YHLF2FdgFmeekcZPRJvEwU1PW6ctBDrOUvRSRlXNc5SdWAVJjr5l1U+grOIzR/VA87nfrs2MY5kXs1UG9vRHIG8ccGywfzD698/QB7G70zZ7IYHm94AOCRoISMuwyGxMdRwpDWwUCczkynVbM3RV9KM8FL/Qpz2N8/8jMyoWiX/QL3avI+vwVO8kS0JQROBPlWWOsNYhPL4cOKKwrw58etVAx6PhuGwheHAgF45WEDWrtOQz0DvI0hXoYxtAhQYTWdSI6E7//TA2WxPl0qjCXnN8pBwz59VjHVJXA6+GxsgmGOUIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ3I9FZXMG+Mue9S7l61YXkrMhuS4tjLhDspyYO9P8w=;
 b=AxS9N4TJ/RLbA4evF8Oi7GE6zANVkR5wlSh9N/z1bjZSYx7R5VEfYQ5Gf+HvvpZUy0tNDP5hgGiCfjDTpLoHH57Wc2PAwx3f/nAIFD5JVuZR7ka6C2DdaL7+xqn82/Mprt2DWBRyIbiJ1IeFf/z4+biVel69j63inmM8xsfii40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 11:32:29 +0000
Received: from CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753]) by CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753%6]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 11:32:29 +0000
Message-ID: <c5ea4e70-6a42-4d78-89b9-e8d65f214609@amd.com>
Date: Mon, 30 Jun 2025 17:02:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] misc: amd-sbi: Address copy_to/from_user() warning
 reported in smatch
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de,
 shyam-sundar.s-k@amd.com, gautham.shenoy@amd.com, mario.limonciello@amd.com,
 naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com
References: <20250625110707.315489-1-akshay.gupta@amd.com>
 <20250625110707.315489-2-akshay.gupta@amd.com>
 <0d18ed52-86cf-44a3-913a-d514f7b8d4a7@suswa.mountain>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <0d18ed52-86cf-44a3-913a-d514f7b8d4a7@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0055.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::13) To CH3PR12MB8909.namprd12.prod.outlook.com
 (2603:10b6:610:179::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8909:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7d1355-d1bd-4277-c95d-08ddb7c9cb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnZhR21sV3ZRRExUcmVEcmo5NDRDNm5sY2NnTDljdVgwK0JnMVNrSTBnMGpY?=
 =?utf-8?B?YUtLei9takpmRk5mcXRJd2RucjhDU2xDWEh4US9kTmtxN2VXL1RhbHJEcHh3?=
 =?utf-8?B?SGVNaTc3SEVaTjh3b20xSjYrNUdhbDNNOGcvUmRHeW9GU1lQY1RMRnNXWUpw?=
 =?utf-8?B?ODg2RUFrWWZLc0lTQnI5NDNKdUkwdmhtdXRwVnc2VWlxVnRNZlc0Z05IdFFM?=
 =?utf-8?B?OGN2UzZ5RHRhUFFKUkI2Zm40dStXZWJ6dzZUWTMvRG9DdDZBOGp0OGhQODRk?=
 =?utf-8?B?c1pQbUJISTFYSk1hVUpEOVZ4SzRtZGMvdjczUEJ3VkEwbmx4SGw5MWJ0WnRv?=
 =?utf-8?B?TG9kbU9sb05BZVZkcHdtNDBzdWtZbUxBMEthS1FzSGlSZkdCbGF5Q3NyeGRC?=
 =?utf-8?B?cTBVY2xWYytkTHZhdHZQK2tWWDRaUVBFcFJhRFl3OTFCRVVxNTVQUy9CS0VU?=
 =?utf-8?B?dXVVTi9pRkVVTWNFZU5Gai9ZYWR1NHFlTkNSTFpyVWdCTTVYdkJJeCs2UXo2?=
 =?utf-8?B?clpxYUhnNmNpaUlZWjByNEpITDRBWVE2eFVsSzgvU1BkTFZXUnZzcnQ1SkNr?=
 =?utf-8?B?emE2S2gyNXNFc0pmalNBakQ1aTZDOEU2MWlkcHdjSkxjemRrTXFQU3NTWlJi?=
 =?utf-8?B?eklMWW5HOTNkTFRveVFWSVZ2S0I4L2FSN0FQYjNsVHZJNStYdytzM2p0WXRa?=
 =?utf-8?B?UTNablo3cURBOEJiNHBiUW5GVEhlaXJMUWxIbEVMbGFSb0JydS9WK0VXZmUw?=
 =?utf-8?B?WGY1ajVTVHJJenVZU1d2eUU5WVFnNGdKd0Z5Z0lsbmpmYmExZEhpRGNxM0Rr?=
 =?utf-8?B?eGF5MUpTdDBLR1BsbUJSUVFjOXVJTzZjY3hzdVVGWTFDZ1lHRFRkcy9PeW83?=
 =?utf-8?B?VHVJY2lwWHlKN2tSaHF4ZjBSVUJtY0lscmZzZHBCVUhQU1pkL3pPTEY5NHhs?=
 =?utf-8?B?WlJ4cmtBaGE1QXRPcE9ySklPeE5jZzg0c3Y3MlpXM01jR25rZml6VndxbGZV?=
 =?utf-8?B?aTZpdGZ2TTY5YUhCTHJreUVqUkYyRFZUbGFwcVZueEtja0tZa2J0RUZkbkhU?=
 =?utf-8?B?MVRabXdLMU5IOTJZRFhuaXZadTQ4SHQ4WG1wczY0NTBoLy9qdUFQUW5yRGJT?=
 =?utf-8?B?LzZYbEFKM2xaUG82akpTL3NndmYzc1h3S1VQWGE1ZHNGQ0FKbzFMelR6RVpT?=
 =?utf-8?B?akQrbkVFNk9hZUxEcTFNUHdvN1MzUGFiRE9WKy9OazlEa1AyTWE3VUhRazJs?=
 =?utf-8?B?RmorcUM4OGx6MDZHZFg2OHVTeWl2Ukl4WW8xWkxObWhCdytBSEJyRGd4MnpQ?=
 =?utf-8?B?ZkZLN0JvWHU3U0dtTllrS2loaE8xMVdvbVpxaGFYVkdpYnF2WFFxbmpQWlp2?=
 =?utf-8?B?TEVoV2RuZnVMK3hua2ljWDZuLzZHVEZmdVc1MjRlUjE1bVgxcTlkK2NpRHI4?=
 =?utf-8?B?MkU4dlRGQ000ZEdnWUNpUnh1MUduNG1mVHZHZmdPR2REQkJFZEtENUtHQm5P?=
 =?utf-8?B?QmRHNlQ0bjA0TzZMMjhLUlErUTZvTGZ1a1FEWGtrLzRXc1RVV29NSllEWWNX?=
 =?utf-8?B?bGIyNlRJRUNFSlVTSTV0dzdoTU9zbGJSVnptNGlZVnFraDZ4cGlqRW92b0Vy?=
 =?utf-8?B?OU9VUHo2YVIxUnhMZm5mdzNGY2xFc2Q0eVlNYXBWaEN2Smkxb1NQMjdLSTJ1?=
 =?utf-8?B?b0lSMkhrdklZbFVNdTUxY0lGdi9YWkh0V2xBWE9lSktjcFNBaTgxZnVVWVFB?=
 =?utf-8?B?SHF2aEE5WnYrUE1zTmNwUGkra0wwZFVxSjQxb2ZGVUUyWDhhbGRuckZUamxv?=
 =?utf-8?Q?p3sBFPancan90TCz2sI9JjPGxBK0Zh+RKjY34=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8909.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WSs2d0Z6cVkrL2ZoVGJDU2pmZHFzQWtvbXZtbm4zcENLMFY1amg4TGM3dTFN?=
 =?utf-8?B?WFkwZlZsaFE3VVpyNFFnZUZ2Skd6clRKb1Z3dzFFV1RrcmNKajZDQ25FQXRr?=
 =?utf-8?B?SDBPNzlrSVcyWDEvR0NmRStyR09UcjVaaGhRLzNqSkpRVExDSkdUYklTbWFF?=
 =?utf-8?B?VGFralRGOHBDUGJEaHo3L2pQdnJvVmhFaVQ5VGlIang1TXFqbzExajZ3eWdC?=
 =?utf-8?B?N2xXS2xhSlRtUDFaNzdMbXFIQWZxQUJFVWRJMVpCYlgxSUVlS0U3bnhFVmNN?=
 =?utf-8?B?dTdYTUtzVXoyMVZTZVJaTVRJRFRNZEtWNzZGRTRSN0JOMzNuZ0dTSHBDL2VR?=
 =?utf-8?B?L0s1L1JpTEMrdThDaFdiZ1hZYTlrdU82ZzRwZ2tzV1hNaFZ5aHdLckt4NDIx?=
 =?utf-8?B?enk4eXFUYmhZMUZicWVROE9YaXRjUEl6cjBhMm9UUnBYbmxROXI1MEY2R1JI?=
 =?utf-8?B?ZmtvK1h2YnN6T3R6a3ZybXowYWtjc0RXV0JDSjhQSTRTV3VlNnM3dng3QmNs?=
 =?utf-8?B?eGxJTERYck9obEZnNGN3MU1PUjJvL1pNRFBhRXAwR2xybTlmS0tGRDJ5ekRm?=
 =?utf-8?B?T2p6K29xS3pRVWF1Q3BMZmVmcW1xK2hQaFFvRDRGdjFpYm94dUNUejJnOTc0?=
 =?utf-8?B?U0lIY3pJK1NwVEkvS00zVU5lS3VlMDNnR0tPU3EwcldJK1Y0VE9Rdjh1NkMr?=
 =?utf-8?B?U0dwV3MzNmFsRkVwTHlvbEhiSitiTnNTSFg5U0hPSURsVjRPcVVXeUpXTnQ4?=
 =?utf-8?B?VStJL0RqTjJaZ1NrUXA5RjFYMkZ5QlREQ0JZN0xQNkNUa08vTkVuZVpObnp4?=
 =?utf-8?B?enhpWnBXNHQ0WVRVSnlHQ0RZU1R5VTIyTVJvNnRHQVNTVExvVjNCTTB4SFhL?=
 =?utf-8?B?Ylh5bFZQQloveUYzVFQvT3pQZ20zSFhSeXkyaVpDam13MjVPSGNMNitXTktx?=
 =?utf-8?B?SHFoeDc4UVdXRDVHRzFUVVR2TzV1a2lKN2tPN3ZIbklvdFBkZ1hhd3YxN05L?=
 =?utf-8?B?d3ZENTNQR1NXYmF4clgwN0VxdnFtRmZBcmFWOVdxQUFTN0prOElSWFMzMEp4?=
 =?utf-8?B?NzlXVWJqV3YxTWtySUM3cGo1MVI3VGY5S2xJNjdKZHdXRUx3SkRyR2hHZFhP?=
 =?utf-8?B?SU9Sd2xTc0tGZHl5QzRsWEZSRWs5VWJFWHFBSjZQNTIySmU4V2MwUEIwUmtW?=
 =?utf-8?B?RlkzMXcybUQ2SGlSaDJKYldEVUtSMDAyTDd2Y0lDdlgvUFVMRFFsNnVad0M5?=
 =?utf-8?B?MnlIZ2JhN1JLdVZaNXhRYmdLOUdESmQ0bUpGdHpCN05tS014UXl4MThDam5p?=
 =?utf-8?B?a3l0eXo4eElxdnJBdE1BbkN2eVZWaXhUakp3YUtDd3RvSFI2ZE9jdi9RbkNX?=
 =?utf-8?B?LzBGYndkeWFjMkJHL1VaN0VLVGRIMEhVNURUSVp5cmQvbWl0Qm1vbTZ2ay9N?=
 =?utf-8?B?MEhFQ0FSbkpVSVYvTzAyWXp2THZKSkNaWGJJQldSVEpiMWh0MmczSkhtN3I3?=
 =?utf-8?B?QnNOc1g0Yll2WktKQ2FrVC9EUDAwK0t2Qk5aNEVBUVdjSEptQ240WXRHR05R?=
 =?utf-8?B?K1NKYVR6eEg4T2dZczJoYkduVW8rYXExTkMyR2cvUHF2MGRqME5BK21uM3lN?=
 =?utf-8?B?RFBoa01qc2ZzWTVJM1J0alpkdzBoMXY2T093Z1dFNnBiaDFLVkpSaHRUakpK?=
 =?utf-8?B?UUk0YytqN1MvYlFjOFBjK2pMb21GdW03UVFJbnNuak1DV0ZtZFZJVVpsSVJV?=
 =?utf-8?B?eTdJTnBML1dnVkpJVVNXSjQzdmFiVE9pcU1zMUpLTU9LejcyTXMrblRGUUt0?=
 =?utf-8?B?YVZxS25tWnBmS1AvK0ZVT0FpRUVCbTNsYkZSKzZSTmtmdzVKSkpJUG5iRzky?=
 =?utf-8?B?UEd1WGdnMzZoUlJBWlFBUkh5YTJrbUN1SVpwQnZSRkRCdHIvN0U0TEdMZzky?=
 =?utf-8?B?MDZKaEZ6L0x5VUhWNzZhaVdCRys3L2ZEaFBCZFJacmVSOWVsOExzWVZHZGRn?=
 =?utf-8?B?RkhhbTl6bkZnNjV4T1NTTVdrVmROSjcrYmZyS2o2VTFUUWJKUERTcVo1Skov?=
 =?utf-8?B?NzBuWE5CaHRsYVFnVEZJckxGQVNPYmsvNEZWdzMrSXc0NVR5cHo1N09SdzV6?=
 =?utf-8?Q?AvuoeCVpenckIf6n4bQ12OMVf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7d1355-d1bd-4277-c95d-08ddb7c9cb84
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8909.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:32:29.1292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9CMgx8Lx6HvhCAHuQ2QpqWH+sxpzaGAmq/G1Xm00PcDbs9f7ey1vvNbAjZ07tvD5g8bCeCQR1W2mRa5tPersA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391


On 6/25/2025 5:13 PM, Dan Carpenter wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Wed, Jun 25, 2025 at 11:07:07AM +0000, Akshay Gupta wrote:
>> Smatch warnings are reported for below commit,
>>
>> Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
>> from Apr 28, 2025 (linux-next), leads to the following Smatch static
>> checker warning:
>>
>> drivers/misc/amd-sbi/rmi-core.c:376 apml_rmi_reg_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
>> drivers/misc/amd-sbi/rmi-core.c:394 apml_mailbox_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
>> drivers/misc/amd-sbi/rmi-core.c:411 apml_cpuid_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
>> drivers/misc/amd-sbi/rmi-core.c:428 apml_mcamsr_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
>>
>> copy_to/from_user() returns number of bytes, not copied.
>> In case data not copied, return "-EFAULT".
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
>> ---
>> Changes from v1:
>>   - Split patch as per Greg's suggestion
>>   drivers/misc/amd-sbi/rmi-core.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
>> index 3570f3b269a9..9048517c088c 100644
>> --- a/drivers/misc/amd-sbi/rmi-core.c
>> +++ b/drivers/misc/amd-sbi/rmi-core.c
>> @@ -372,7 +372,8 @@ static int apml_rmi_reg_xfer(struct sbrmi_data *data,
>>        mutex_unlock(&data->lock);
>>
>>        if (msg.rflag && !ret)
> Unrelated to this patch, but it's always better to do if (ret) {.
> Do error handling not success handling etc.

Hi Dan,

Thank you for the suggestion, will take care of this.

>> -             return copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg));
>> +             if (copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg)))
>> +                     return -EFAULT;
>>        return ret;
>>   }
>>
>> @@ -390,7 +391,9 @@ static int apml_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg __use
>>        if (ret && ret != -EPROTOTYPE)
>>                return ret;
>>
>> -     return copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg));
>> +     if (copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg)))
>> +             return -EFAULT;
>> +     return ret;
> This fixes the -EPROTOTYPE as well.  In the original code, it would
> return success where -EPROTOTYPE was intended.  It's probably worth
> mentioning that in the commit message and maybe adding a test cases to
> your test platform.
I will update the commit message to address this.
> regards,
> dan carpenter
>
