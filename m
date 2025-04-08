Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB69F22D4E3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744136908; cv=fail; b=DeEQeBHfMkN2PKS9Dvz1Fp0NSeDTdNPtEUctd7jVUCz5OL6NU4K6A8HXjNTJ1VBTPwn3RLiPtlNElisCkI6wmVBpmo3TbtCTqj1SswhBY0qML4XVOD466W0DstEoIrxrQbbwYFBsOk5JN+zhRo97X2NydSaWquqAw5tRlCpWPP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744136908; c=relaxed/simple;
	bh=zWSZFt9KhLO1pgC8Pb+GTEvyhwRqBNrga9V9QdXbFC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T0VINqkeOli48tlBp9rr+zUl+e35t0EiKGCUjqHpsuZoMYN/s9RlU2KVXT2lXYRto5bamdJtYAXG2ZtIktMQz1gtrjHO1piw5Bo9Lgox1+O2p70oLrngpLvqynHYuqCcD4l/dV5//36+ZIiQ4ZjnI/upAF9Bb+Y1i5zNgq/sGGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f77xM6mN; arc=fail smtp.client-ip=40.107.92.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f77xM6mN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Buyg7JU9A+MsjMkzpADGUcFOQKdOuAiKp5WqwGJu5VnC0wuBy5IBkejSMlO41RgTo3DtgAq+/SMz0KxaMOFTbyk6JS7sHTzuMMMUANIKUIsr9MnKSS8hE1bjf/uULdx1tC5XGZJ20f/H3PUnUU0MiOAb9dcBWBNqiUR137OnkRuki3UnyUfahmwSHq4wcmvqSAZjL+U22ec+BB0nw1L7mtVgOGWyGne6vYg80JTmceGEwPyJyM41cCt2tfn/Zu+AlWMvy7nKWUQm/oLuYUaGFmZso8rqORwoz9oeYeplJ3dIhebzS5WDSf3u01j3qZ/4EUNDXTpsU6b16CprUJk3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=De+1jbOO+/+R8AO6IY19qDs2DvpvfIsPIpRh9K9dbKU=;
 b=i6+aN9GLDttLDw/t1ISq6oOt3aLBhVLlct6Snu114ezBFus7R5jnmOSmKbKmcGrmrRDkBsX7eP5OCKg/Lv8dFfq/e0ZiziUHp2dq881FawHVyDYwoq8V+9k47hS0+JQOu0/N9XiHxpMp3ndrV2SfFGYIJENfO0seDUfolzEvtoJfM5DPBqZaoXp2Oyx35IeUsi3xV1Dw+KSUPMGf831aycRaGLkauKpGq6oiGH8/DFowd6heoLYsklG0zw1ZTZfOoeCdiQSegddJ5OwM0S0y6++JAraHa0td8DkgZE9JbaScTkE3vuwtVb/65rVh/MISK7TGPWnpDROk1IyJh5Zg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=De+1jbOO+/+R8AO6IY19qDs2DvpvfIsPIpRh9K9dbKU=;
 b=f77xM6mNyHxUVVa2RG+BdG1BsnMUdNlMhtixx/53lR85ZSzeVdfCLpd+imLdHYXum8Ec7aB3u2bPzTz0di8bwm3te+hxl5vU/DOaqGYvyHGggEWDeDDVlmWd0FVx2Rhnkc/kWBGdHDbjI0aMII2QFARd1sDB3kaHP0GpqJ58hfhB5+ArQ9EVC0xwJfK2+BJXR/ACwLwsZZqN1/96+20Xg8r6WsB81blf6vJT6hF3PFapf0DCva5CHSu7Rvt2n7xYMCAdSF9uFleQ7VBojGLImlcL0ktyPCn44iskqIwM1cGE3u8hcTTHVAVLTJsjcNae9f4F8ViBNzVP3YsZ201tpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by IA0PR12MB8905.namprd12.prod.outlook.com (2603:10b6:208:484::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 18:28:23 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 18:28:23 +0000
Date: Tue, 8 Apr 2025 20:28:18 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.15-fixes] sched_ext: Mark
 SCX_OPS_HAS_CGROUP_WEIGHT for deprecation
Message-ID: <Z_VqwpXcmLMPseOu@gpd3>
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
 <Z_TXIe2fVpAt-CAg@gpd3>
 <Z_VnKbElcEWWg4CH@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VnKbElcEWWg4CH@slm.duckdns.org>
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|IA0PR12MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: e1213d3e-c7cb-4706-0efe-08dd76cb251d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CXpyxDzaGzD6WB6mlkQOLGnkTVowa6Lq/xBk5JmpkoNMCdX7uoR1Yf9ZWXvF?=
 =?us-ascii?Q?U3GqvZQGXKREUVSKXM5vwCTNroV5eHCQUEXK8gXhkFsHGQciTIeqUuNsbZaQ?=
 =?us-ascii?Q?nzfzkNPsAjcPx2xbKSNCpAAiizC1qXdrV92KcmyAriR1wjvkJAAs2FQeJjC/?=
 =?us-ascii?Q?0VeQTHn1RwRaBRFVWq4vnTkLWAyh/6s+kEaNEs6pDZhwAwPnBfhZ8HA4C4lJ?=
 =?us-ascii?Q?Typl8ldqx0yPx5du5dorTigfMkVA3CMQvtudNvFn3biUr2SVORvzAOEqvQTk?=
 =?us-ascii?Q?lcKDfzRCDd2QX/3s9RpXt1SzN4FQBEkOHAglwNGfVnAWkDyXBMR9P90WehjW?=
 =?us-ascii?Q?UR8aj5MVLAo1oknT9fWJlllFZ2WG9BgsZ/7p+CKjnqipPmVY+E5jYnblMhWm?=
 =?us-ascii?Q?1ijgZyMgg4eSzfU6raXvZ2IknUO5pmKmkQWjw+BxGyE8QSo39Oe5/cn/TJ+1?=
 =?us-ascii?Q?CkkhdHvG4X7CcRKaofMUfdIanFuarkf8SQJLXo4PMAHRzNfVbzzmK/YJM2Wl?=
 =?us-ascii?Q?fHGFTMWZiS55r+P883teGtFmRIQnVBex1PiPSW3mJgaalvZBO6WBUzBGmu2s?=
 =?us-ascii?Q?eX9prCDdbvPn8jCQuVToJlxYaEL2zsAg/aZxFa/OqATxU3YEUzGtJG2DnK9i?=
 =?us-ascii?Q?SSfqO4tVGaB8pmhIYASzWt0vwNaIHGyWvP88QaO75sFqJ5rXelajA9lpjM8d?=
 =?us-ascii?Q?lTEpI+ECcQQbEtvVezEn5itGl7JxcBuX6nbeSwHk1FNPXDcLr6COpWRyzyII?=
 =?us-ascii?Q?ygyBhr931MPN1UAfyBnJhcRYL0IBXRMa/zDbnnn4uoOvirSt4K3qxmCoyKfo?=
 =?us-ascii?Q?o1kbv3UIRrZqKE33erjpr6vdZFxzrJ9fuOUMjFt0LnmbhcSZLd3KY9bJJ0iJ?=
 =?us-ascii?Q?oFxKzKU6ZIH3j1cgPX0CPcZgibGG3heI2h1pxEoHYFYgBX3C0jr0n0nFwL6g?=
 =?us-ascii?Q?imLa3bCInMldk3exR9JxxnVK6Wi+3l8Txw6PK5yinsUMjO78yhy2rvnPaK8T?=
 =?us-ascii?Q?Zc3MzkMwewKUFGdTwK2vZpLQlAcPgFNZgllUZV7sBV5b7eof1JeqzLAPksSC?=
 =?us-ascii?Q?hHgCJdl6wiV81fAscPIX5gyUNm0zNOa+vMqOkAtyTzSmAG7tNth55PiIqJUn?=
 =?us-ascii?Q?/23zSYYSGcF4W8pxu6FqUkHYv4gpjSOF5K31sivbEPruhuLtRgZVRamboW1k?=
 =?us-ascii?Q?s6BGiuHxvYruF3QmYcjgwli/+GVW4mwb1046xYHjDbApmTdKwOetPgo0WcPv?=
 =?us-ascii?Q?pXUs5i88vQh5N3sQXoGVzrPj3Sqrkj+OPDNVcwAq9TWygQwMGeCvLvRDcIEG?=
 =?us-ascii?Q?gaz66/5tbOicnFn55c3pdAL5QTMr7tzOmmF+yfxxUsAgLI4GfH60Kxzh6Y6Q?=
 =?us-ascii?Q?lW/1+Z6OpJjGGmBPwYHHf0bG/a49uYSdGcTzblqOu5ngu29UnvLkU+Eb9c5C?=
 =?us-ascii?Q?qkgRTDhqWsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hZG6HOX8CI91csCWHH/944Ez2n3dOKpS00ZdgWib44h69eWpW0pOXlNJFsmH?=
 =?us-ascii?Q?t8/vEphjUKV+l5L3yCLlLtbbH3LAdeiaOen05rOZIFsIn7q0eptSLhYbsPBi?=
 =?us-ascii?Q?BA06c4WT1Z9uMsDdU0utwipE+ON/46WYbdETAX+Tmj3zePYJt1o4ftPLZzT+?=
 =?us-ascii?Q?+Tiv1eYEX+ZRZWCQYP1Tk1dsIHjjLf3mkOFez7uazayZgSCubSbf4q4U+nGE?=
 =?us-ascii?Q?7QAQ3dfUnAHY3FmqASnZtYVSPMsNrUgtHtc5Y4BnTR9V+8+wYwxHxQ0lUPz7?=
 =?us-ascii?Q?oSMs54Qg1fxJxZ0cBCoD0QDF4g+shQ1U2H1p57K2CeowXn3eeymy5wiyKj9y?=
 =?us-ascii?Q?oM0tvt+7zGtZHryv9tA+0srAUDIrHTTl+nSY2SrabpCanj8INrkaBWZrcu3q?=
 =?us-ascii?Q?FshSVa7Nw8XnPfm1214YVoqOrk+fR3xyqSMFfyNnVUFZTYDeT+oB/FWqS0VG?=
 =?us-ascii?Q?Nw183xBbLnBPfHuiMPGg++7cqIlD3nDiK0oPYnrw38XufhpNlVnnrTXhYtLd?=
 =?us-ascii?Q?YANwAfk3J8OKKgrSkWFoTFcnSZIiaKJpAmTz0I4CkGwitS6CNY57zZ9DwI+4?=
 =?us-ascii?Q?TNus16p7qVAYH6QVU9cQIrEAiNuzwCY+R50uFGI7Q8jDi6kiyvBKvfg7Wa9k?=
 =?us-ascii?Q?Yz7exzUFwTmItseEnRB8TdEfc2GVakbaywQ2eZ4OsFQktwIuzS6c5pju4+bA?=
 =?us-ascii?Q?19jdNUpmTXnno2+xxMYPCtTuSipCoE0pQ401ClYQD3IfyFVjN7kDrHwrEW8+?=
 =?us-ascii?Q?tVR+lcupC7p7Ji6FvwFAZqba8uLUUoV3UUHhfr5nnM3uPWVhkP/fibsiFppn?=
 =?us-ascii?Q?GbVLfssxBi8RzAuPHWRAm8x0S2sqd0asmKc4B379EhSlEXPU2qqJSDC6XZqX?=
 =?us-ascii?Q?UYBTXhG31QQ/VDbBKFkZ189mlvpQX/Nq4xm99FGSKtpufaAKGN5xiqmJclYY?=
 =?us-ascii?Q?8hkTpOvyyXMaJje5LxgsJpLVDqsKOWLaMIxbKxLHcMWnJn6a9CpVyuZQS40k?=
 =?us-ascii?Q?bVUtoewIIkIJpw9EAw6sQLYqlA6uYFZ7eQhKj0E0butHTvIRKD5L3ppsqBXZ?=
 =?us-ascii?Q?a/UMU9y7VPKsLEVL83Qg0F5ktTSHE5J7yMCvNf+HC1hPWWjOXx0CL5XlL2W8?=
 =?us-ascii?Q?HpWkXu1kbKqzN2S48PYxlSdP8QYaTvk9ZDt7PIiXGjyndmpjXr9B26u0qmcw?=
 =?us-ascii?Q?Y23Gi/yTuAefImGqOkOF1o+LuodfB0k3lm00cv/mSRYaRQLGlmm4YZtweBXm?=
 =?us-ascii?Q?KDhio6oFJ/c+crMAX40J0X/HHwPYPqBFr4GG3Q5v+cHHM94n3VrJ8ekm81sU?=
 =?us-ascii?Q?eEhuu0UZ4YxbMWJmECBJdO7NVixhXFPhlj0JNY0rfvKHs1LZ9Lqc89KnsuIi?=
 =?us-ascii?Q?PZ8q7S+tvTp9Vnzxry7JpLkX3QZzmbfZo+DE6ktw++u0RMAW9lTbI6PrHkX9?=
 =?us-ascii?Q?qZRBmV+dRstMBrL6PhTsnPF87h7YKIks8NoCsuPEHYF9TyDv4O9339EpTYHs?=
 =?us-ascii?Q?qpZh/HRDsZYzHe5DcXA/CK4MycGJRG6iiqJ8/LJCSJ1a5KDr0XaobJgQhSch?=
 =?us-ascii?Q?RDqVr0+UnraRkQ821jAJuAcY9fYX8w6DINVE1Z07?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1213d3e-c7cb-4706-0efe-08dd76cb251d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 18:28:23.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvDuZSaloUmsSPI3UlniURU838aBlvRhbDjUV2NgJoyJDgARzavXhdlgKONL/vOwSOn5qufEQIxqLcE3oEk/Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8905

Hi Tejun,

On Tue, Apr 08, 2025 at 08:12:57AM -1000, Tejun Heo wrote:
> SCX_OPS_HAS_CGROUP_WEIGHT was only used to suppress the missing cgroup
> weight support warnings. Now that the warnings are removed, the flag doesn't
> do anything. Mark it for deprecation and remove its usage from scx_flatcg.

Is the removal from scx_flatcg meant to be part of this patch, or is it
intended as a follow-up? Other than that LGTM.

Thanks,
-Andrea

> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Suggested-by: Andrea Righi <arighi@nvidia.com>
> ---
>  kernel/sched/ext.c |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 21eaf081d336..fdbf249d1c68 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -163,7 +163,7 @@ enum scx_ops_flags {
>  	/*
>  	 * CPU cgroup support flags
>  	 */
> -	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* cpu.weight */
> +	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* DEPRECATED, will be removed on 6.18 */
>  
>  	SCX_OPS_ALL_FLAGS	= SCX_OPS_KEEP_BUILTIN_IDLE |
>  				  SCX_OPS_ENQ_LAST |
> @@ -5213,6 +5213,9 @@ static int validate_ops(const struct sched_ext_ops *ops)
>  		return -EINVAL;
>  	}
>  
> +	if (ops->flags & SCX_OPS_HAS_CGROUP_WEIGHT)
> +		pr_warn("SCX_OPS_HAS_CGROUP_WEIGHT is deprecated and a noop\n");
> +
>  	return 0;
>  }
>  
