Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2108.outbound.protection.outlook.com [40.107.22.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859806FB0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033206; cv=fail; b=rBOGf4Z5k7J62qt0nqL51gVvcMQreHMv45VkSJzFMuE+TkJSN8wZMO+e8/WMxom4mkmngrcxiA+sgQCU4T33SDTO3PjDVQneHpBsQJ3EUcbuAmcTkrsEhgF7+tsx8EfbgH6FiX3cM8NjkX5peZKBCXJQ2ykpDtfNLgqN6G8/6Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033206; c=relaxed/simple;
	bh=g97yzrrUGzO8Sq6IT9mQJ9MpDlu3PGzerM/6+5otnRs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AtZfUT0FslI3Vsuz2ogsPhBh0JO2WswpbG2kkujgX9ypnuG/3c4LJvUknS0ooEuFpBWnGt36WJFh4VJCQfj8zZ0x9C2JQAjGAi2kIHN1ItdWd0rCYKbJzt+fYkX8fSh7kxzlEJ2mcqz76S1HS4FhS8z/UDDNSKEFgflv0EKMfwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=k+Qeo6fD; arc=fail smtp.client-ip=40.107.22.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="k+Qeo6fD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPZYOS26G6jZ7B7Ptn89YNzg9JvXV56K//d5XkGfmcejul6rjL24kfEK/mWmjXiG6TTeTXGc0kaMRgrBgBZImA/90xzpwsXdD9bX4o7za/2nAtou3opLt/aWPk6fKKUNLuDWCXIqHHZbP20Sq2UfsDuhk15yyTX55e+Z7iHqwu8ipcoMd/ZfGfbF+bFoUl7boZe8VtcQbuHO2xNA1gHtGxpwGLuIGe0gSbAGc+8l1JDp3g2oRWHBuz+pQO49qAceobfdQ9pMSVMdginbEclU3trA6cg8w1U8OPx2vYVk0v5DDNLYa8qha0ZeEgTnLG3FiVAxrkSVlFjhNdsrFu2rJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKzd54Qo7QG1ZNpFBA4yDp1QyGR4/EYQYKqvR37ZxDM=;
 b=AmOYIYqNvfBNXm7DLL3DqMibhMVBjfm43ZqRtNWf+oohE6wlRZioQyt+mP7q6D/Wp+m/rtF+58PcqPSkfTVeNrud+AMSRF0+gj2Gm9ewdw107fUORMN7Gn4vHQJQLH2Txp3vJO/0tAbIvPWS2i71NxAZPY/tKZOqgqgvYE9fJYjhKo/czTxSStaKYv1+43AllU9yla3ukmf5ppbdv5Tay57hzrpmRzmKWTqiLjbHjlu2T0Js1Jl9VKcB4wP67o4nq+PrhJCpxi0yh9ue/1RMYIb5Ej3/8nUsN1Wsdos9mMrfjV80H1JDtvtPiqCmVvYdkVYQAFtKjl9S79F4jTo7RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKzd54Qo7QG1ZNpFBA4yDp1QyGR4/EYQYKqvR37ZxDM=;
 b=k+Qeo6fD5JNoAXlW2SIfDAm6FHzaS5wi14HbHjBsIC8yQ0miMNTvEr9T0hOrgfuXzHURdNFeH+mI2I3F0edtYT7vPiIdbhjYdzczdiV7ZCcEYp8F7pw55KpGeLMBHlsvDza/iJS9gOv0LWjZHUGZ8n/b2htPEchQEAHjqDryecg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by PAWPR02MB10068.eurprd02.prod.outlook.com (2603:10a6:102:359::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 13:39:58 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%3]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 13:39:57 +0000
Message-ID: <dbe94425-8013-b866-9b6b-39ea499576e9@axentia.se>
Date: Mon, 7 Apr 2025 15:39:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH] mux: core: add exclusive mux controls support
Content-Language: sv-SE
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250326154613.3735-1-srinivas.kandagatla@linaro.org>
 <95b7eaf0-2040-a25a-4c41-ab86aba82a8d@axentia.se>
 <02f09c34-09ed-486e-a8a8-23b0df718197@linaro.org>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <02f09c34-09ed-486e-a8a8-23b0df718197@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVZP280CA0032.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:276::12) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|PAWPR02MB10068:EE_
X-MS-Office365-Filtering-Correlation-Id: fb911bb4-daad-4b76-999b-08dd75d9afc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z29OUnhwbDlOVEhsbWJVSktHVThSa2d3MG1wQWlTVEgrSVZuRkdXeFRteHcz?=
 =?utf-8?B?UmFydG9pcm5NY0plVmp0UTVkcG4yV25USUhKRFo0Umk2bGNEZWdFWmh4ZHhD?=
 =?utf-8?B?b0UrNG0weXArY0RtZTN2dHZZWXNNRW5NUzE4SXJvZGZ3S1RId0hRVlRCUFpj?=
 =?utf-8?B?blZLeDJuQ0p2dWMreDhldjUwYTU5YjgvN2lpOXJsRVBHblpYQTBYaGlwQzg0?=
 =?utf-8?B?aFhZSkVnNHpOYUR4Snp0NjRmWFF5MjliZVhIaTcwc0VoK2tQSjl1Y2x1d1Jv?=
 =?utf-8?B?NVVNaHBYY05INkNXNUZyUUFqS3BpeWRmenE1OWE5NnBnSG01SVZraVRuWUN5?=
 =?utf-8?B?eUV0NklpTStHb1RvNW9BY0h2QWEyUjlqajJXY0ZZVDNLUnZ4dzl2bGkzOVJM?=
 =?utf-8?B?bjU1Ulp5TldmUXdjZVFab3JJT1dNaGxabkJDcjhHSE5nTGlZK2hEdEk0eUN4?=
 =?utf-8?B?Q0V6M0ZWRU1zRG55VDRTMENnMEZBemR2ZjAxd08vb25zRGVHYUIrTTF5YUlE?=
 =?utf-8?B?Sk5qQXZXM2JXRVNUQVRKRUozZzAybGw0c2hFT1RsbE1yZXBkaEkrcFM5UXlD?=
 =?utf-8?B?c2lGczFnSUxLb0FVWDB2QURieTI2dzN5dDNZK09PWGE5bC9ueTFOTWs2WVBF?=
 =?utf-8?B?SnlxaDVONzQ1MmFUTXBSNFBFVHVzeFlVSGU3dEtrSmxrUDVQRkRRdVgwK1RQ?=
 =?utf-8?B?YkJWVVUvbVVKeHdWekphd2tHSmo1NDVhK05JcFhQU3RGSkZkeVVsV2dWbUJH?=
 =?utf-8?B?bmpYZStQaDVMMWp6S3BnT04zYnIyb24zM1FEZHdzT1NvNkZXcDNSN0tXSFow?=
 =?utf-8?B?ZU40SWZqNS9UMFpXQVQwcXdRS3JuQUQrYXFYbWFJVjdENmpETkRGazA2SXJw?=
 =?utf-8?B?Skx1RlUvWjhHVlU4dm0xdzYvcm1FT2YrRm5xbjZDeExtK1lwNGpBWWhsRTdj?=
 =?utf-8?B?R0ROaTZKajJKMWM3alZpNlB0V1hxeEF2bVFSR1NkM092bHJSSGFDblFlN1Iy?=
 =?utf-8?B?V0dqdGVPbWVVVDA1elpoSnhRTHJDZ0w0aDh2bGJaK0REWU41OW9sWkZHNjhQ?=
 =?utf-8?B?dHRtNE93T2ZvME1ZTXZrbjFmMHRjVzVNL0VVdEJ1bWI4bnVBUFc4NnBKSmNv?=
 =?utf-8?B?ZXp4RkFvZVgzMUR2VFkva3dvYlNrd282RjhkNzhmSXNieXVHblg3MlRoM0Yw?=
 =?utf-8?B?SFgyL2hmREgzdUJ6NXp0Q29ac2VDZndIS1Bmb0h0ZkpaVXNZZ3VsOFBvaW9t?=
 =?utf-8?B?UytjMG9XaVBLTkZ4R2pmZ0huelhFUkRNUWZWKzl3cHgyd25OWFVQeWZ0c3dY?=
 =?utf-8?B?N0FRWXlGaUNqaWpnd2k3VUlRRW5jM1JocnVDVnN3eVUvaHdLZFVnM3VXZk9h?=
 =?utf-8?B?cFM5amNYTzZ1aHpzaDJxTWgwaUI0RUQ2RytNdU01RUFIakdTNDJFbnZZWTQ2?=
 =?utf-8?B?OVlsaVFwZHZ2V2dxSEFXekdhVHNCb3k4d2t0SGJNa0xnQUFSY2xPOTJGY3k5?=
 =?utf-8?B?dGFwN1IydytNMVJ4V1AyQ2xITXBTdXVIZ0drSnZRaWtULzBSMFpYTmhNV2xw?=
 =?utf-8?B?MEFCVE9aeklKUnJ6Q09ncmNYMVI1alVPK0pZVElVL2I4bXJNRGV4Y3VVV0ZT?=
 =?utf-8?B?Z1FtNmlKaE91azljVHlkeHVzRC9BS1FZSkQ0ZDNwZUtaVnNBTkxpTDNWR2Vh?=
 =?utf-8?B?dHloVDlIWmplSHNndjVscUhSTTFtaW5WRlRNYjVTcDJLZFFkVWZSM240eXF1?=
 =?utf-8?B?ODBnMWp0NDgvVmZsNjlJUUhsM1VuUXo3UWxKdnhiWHh6aHgrblkza0tCQ2JC?=
 =?utf-8?B?RFNpRHhBMEpqcXVnNGd6Q0UrR3UzN2tKWEJLcWE3ZUVLbHIyaUFxdnlCaGdx?=
 =?utf-8?Q?Bi2Y1Qhb7Xhuq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUtpNDd3NkN6UmpTSHFRNkxDM3FoWXZMci9aM1crOFJsbVNYUGxHdFFFTU1I?=
 =?utf-8?B?UlVvdmJLQ012d0FvMjhJVTh0aWs1aVpXd3Fjd05FckxXWmJFSE5GREtVbHdD?=
 =?utf-8?B?ZnRORTROZmd6cXVQUEFHYWh6aXhOVzZ1bWFkVUo1anJGTDZFRVVTQXhmaEF2?=
 =?utf-8?B?NlpyNlFqVlJVZ3VRUTlmZzF5Y05QWStFQTZibHRSY01vR01mejc3elNJQS9r?=
 =?utf-8?B?Um53WTJ5dW0xNDI0R1NJRE4wSWZvR3o3akw0SEd0NVpzVXpGYWgvOHlkM2Uz?=
 =?utf-8?B?Q1dYOVhWSUhoKzRuT1BqZHZhamcyaHNyREhkUmVyUzVNWWhqQXhBTExqaE5u?=
 =?utf-8?B?ckszYXVKdGM5S2hOd2ROSlZsa0hreUt3OGpMclZTQ2l0UWI3TjRKL1pobXJk?=
 =?utf-8?B?WHExczV1TU9EL0FvbUgyaXprYUZzZk1sSnN0Tk1teFFZa2dXV1BzdHNab2h2?=
 =?utf-8?B?SGJoOWw3MExydFIxN3ljeHBSd0J3K0E3UHpxRjR3WWpRUzE4RHVhcVVIYUE0?=
 =?utf-8?B?b2dmQUkrWEd5bE5YQWRQWm43alZORmhPM0VXWlMwMTZRVy9vcGR0azF1Q01T?=
 =?utf-8?B?RUxXZWp0QWdSU3BXVFhEeUFQelVkZC9mODV3Mnlwai85Ukl1c3J1VVhyMnlk?=
 =?utf-8?B?L1p2NDlnNlR3azFlSGE4VnM3NzFwQ0VrY1JhREhtL3AzZWJVSiticE9Kdm1y?=
 =?utf-8?B?VHFtN1gzZ3NjSHhuMnBjbjZORlJkenh6WW9EcUZWUTFGZENMQmZjQkt4TlNJ?=
 =?utf-8?B?aUsyOWdhLzdIL0RUc043RURmUVYyMzVYUWU1bTI5QnQ1RFd3UWh3c2VmckhL?=
 =?utf-8?B?dmREVjdnTFRmOFVpdzVjQnNRazB1bzhwcW5DUzZ2ejFRZVFkUlVqRE13U3FT?=
 =?utf-8?B?N3JQRHNOa0IzdVMyVGNMK2IzOFJzdDBTN0xBMHBQQWUxa0ExMGVkUUV0YTNq?=
 =?utf-8?B?MG1UczNZMnBPWUkyL013NVBRZUlRUHJKOXM3TytFUHFEWXJXTkJyb3VXdGE2?=
 =?utf-8?B?VnBaeEJDdEJBbDR4ZXRRWlZTVE00amZZeHVkbE1sTXJpRzcwWUV1SEJoNHZR?=
 =?utf-8?B?OGUyeVM2WnhyQ1Z2S2E2MDBZdllnYmQ4bkpsVWdXSXZSNG9tR0pWcEpZVGxS?=
 =?utf-8?B?VFBwb0NYOEpaUkQzTzFHVEV4OUhhQWtKdFZhUEdIcUZrbE1ta2czQ2kxa01O?=
 =?utf-8?B?b21sSW9jNkdUUDZWZVU4ZTNlNHNwRmh5ZEg4cjVyakdVN1pxUXJuRFBZeG9E?=
 =?utf-8?B?eEhXUmFPMXBQQm1kSzBCNXF3dnBKY1ZGMjBneWZBQUViL1p0YjhnR0ZBSS9C?=
 =?utf-8?B?ZURXRXNIdW9BUVVUNzhnUFVWV1JhQTNDL282cFluM0VlWFdVWkYyUnMvUkNC?=
 =?utf-8?B?aXYvdXBYNE1zakFzempybG5ETysvc0RSZHBPZG15ZndwZWtpSkN6ODdZSW5q?=
 =?utf-8?B?aTRuUHhRVk1scTJseG90cGNXMXRJS1RFeHRQRWtxZUF5RVZ3ejlBdU9pcjND?=
 =?utf-8?B?dGxBd2pneXZiZFJiUnRtbUZQamhiZEdLd2VSMGpPdG9xMkg5MWRBNTFyUC9I?=
 =?utf-8?B?eVY3N1JGWnBMaW1VVDRwUUx2THFuMmFXMUhhbTN3YlVXZ0FtZzR2bjY3TG4v?=
 =?utf-8?B?WGt0V21ick5XUitIV05wZEtDVG9vZ2treXd5TzN1L3hrVXcxdDdudk1ISDBC?=
 =?utf-8?B?U2xVNGl5bWlUYkVsdjd2UlR0M2p1dzV5QVhPanN0Ri9XMDYyMmtVQWQvSm9T?=
 =?utf-8?B?Z202ZVBCbHQ4R1R3TlBuaW9KaE1HUHJjMk0wbU9PTUxrcjArVGhkYmt1eFVL?=
 =?utf-8?B?dTJ3elFzdU1kUFU2MlR3MEVFTXVXa1ZPVGwyZlJtMEQ3MnNqYkNFemxUTmQ3?=
 =?utf-8?B?UVc1a3I1bFJQUStNenBwZVByN3ozbGUzbDBwRU5LVE1kV001NVMwd0pmb1RP?=
 =?utf-8?B?bmVNa1BVY1NRTGVvVUlyQ0pUajFjbHJZOC9EVU5rb1FBMkNYVmNlK3k3T2Ry?=
 =?utf-8?B?bWVxT2FMd0dHUmNyc0ZxYytIUnMvY21ZWHV5eFVoM3ROWHRIZ0ZnNStYSzBs?=
 =?utf-8?B?YjNrN1hNN2ZBRmloYWdTWUdTRGVHY2FhQjI4M2RNcy8wQytpcjk0MGVTVmEw?=
 =?utf-8?Q?+xA+uh4ZqNyRzWwFdMa232b2Q?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: fb911bb4-daad-4b76-999b-08dd75d9afc4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:39:57.5728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNwhB3ttlG9sZwxeWXj0btKPC7J8LKrWPyRN+I75CykdGPVE6I5JQ6U3iwwRLlNm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10068



2025-04-07 at 12:36, Srinivas Kandagatla wrote:
> 
> On 03/04/2025 21:58, Peter Rosin wrote:
>>> @@ -479,6 +487,10 @@ int mux_control_deselect(struct mux_control *mux)
>>>   {
>>>       int ret = 0;
>>>   +    /* exclusive mux control do not deselection */
>>> +    if (mux->exclusive)
>>> +        return -EINVAL;
>> This is unfortunate. I think there is value in being able to deselect
>> muxes in exclusive mode. Otherwise you might need to keep track of
>> some idle-state in the code, when it would be more flexible to have
>> it specified in e.g. the DT node. The best idle-state may very well
>> be hardware dependent, and is often not some central thing for the
>> consumer driver.
> 
> Does it mean exclusive mux can deselect a mux however its not mandatory to deslect between each mux selects?

Yes, that was what I tried to say.

> 
>>
>>> +
>>>       if (mux->idle_state != MUX_IDLE_AS_IS &&
>>>           mux->idle_state != mux->cached_state)
>>>           ret = mux_control_set(mux, mux->idle_state);
>>> @@ -523,13 +535,15 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
>>>    * @mux_name: The name identifying the mux-control.
>>>    * @state: Pointer to where the requested state is returned, or NULL when
>>>    *         the required multiplexer states are handled by other means.
>>> + * @get_type: Type of mux get, shared or exclusive
>>>    *
>>>    * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
>>>    */
>>>   static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>>> -                   unsigned int *state)
>>> +                   unsigned int *state, enum mux_control_get_type get_type)
>>>   {
>>>       struct device_node *np = dev->of_node;
>>> +    struct mux_control *mux_ctrl;
>>>       struct of_phandle_args args;
>>>       struct mux_chip *mux_chip;
>>>       unsigned int controller;
>>> @@ -606,7 +620,25 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>>>           return ERR_PTR(-EINVAL);
>>>       }
>>>   -    return &mux_chip->mux[controller];
>>> +    mux_ctrl = &mux_chip->mux[controller];
>>> +
>>> +    if (mux_ctrl->exclusive) {
>>> +        mux_ctrl = ERR_PTR(-EPERM);
>>> +        put_device(&mux_chip->dev);
>>> +        return mux_ctrl;
>>> +    }
>>> +
>>> +    if (get_type == EXCLUSIVE_GET && mux_ctrl->open_count) {
>>> +        mux_ctrl = ERR_PTR(-EBUSY);
>>> +        put_device(&mux_chip->dev);
>>> +        return mux_ctrl;
>>> +    }
>>> +
>>> +    mux_ctrl->open_count++;
>>> +    if (get_type == EXCLUSIVE_GET)
>>> +        mux_ctrl->exclusive = true;
>>> +
>>> +    return mux_ctrl;
>> This is racy with no guarantee that you are the only consumer after you
> 
> Yes, there is a chance of race here. locking around mux_chip access should help fix this race.

Yes, some locking is indeed needed.

>> have gotten an exclusive mux. My sketchy vision was to have an API
>> function that requests an ordinary shared mux to be exclusive, and then
>> another to make the mux shared again. Those would take/release the same
> 
> hm,  dynamically going between shared to exclusive is going bring more challenges and consumer side its going to be more complicated.

It is not important to be able to toggle between shared and exclusive.
So, if that's difficult, don't do it. But if it somehow makes the
implementation neater, it's certainly a possibility.

> 
> My idea to do this way was to allow more flags like optional to mux, in same likes  regulators or resets.. etc.

Yes, there are uses for optional muxes.

>> lock as when selecting/deselecting, but also mark the mux as exclusive
>> and trigger_not_  taking/releasing the lock in select/deselect.
>>
>> But then we have the little thing that conditional locking is not
>> exactly ideal. Which is why I haven't done this before. I simply never
>> got it to a point where I felt it was good enough...
>>
>> Another reason for me not having done it is that I also feel that it
>> might not be ideal to reuse mux_control_select and mux_control_deselect
>> at all since the rules for using those when the mux is shared are ...
>> a bit difficult, and will remain that way. Thus, having those functions
>> *sometimes*  behave like they are easy and sometimes requiring great
>> detail will make the already bad shared case even more error prone.
>>
>> I wish I could see how to do this sanely.
> 
> How about going with current approach with locking as suggested?

There needs to be operations to
- acquire an exclusive mux
- set the state of an exclusive mux
- return an exclusive mux to its idle state
- release an exclusive mux

Only adding the locking to kill races in acquire/release will still
have the problem with reusing the same API for setting the state of
an exclusive mux and selecting a state from a shared mux. And as I
said, I think it's bad to try to keep those seemingly similar ops
as the same APIs. I think it would be better to add mux_control_set()
and mux_control_unset() APIs (naming?) and have those error out if
tried with a shared mux. In the same vein, mux_control_select() and
mux_control_deselect() should error out if tried with an exclusive
mux.

Cheers,
Peter
