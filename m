Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2133.outbound.protection.outlook.com [40.107.92.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341901EDA08;
	Fri, 11 Apr 2025 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353971; cv=fail; b=HRgYiIaCEXcTtL2iatShMhLAQQYrL8m0cZbNGMMlEhjxSF4w6aOF+eZZlE6BkFRPwTMwUX4hv6bq8hW+Jww7g3fTG5oSfQEQNY1Hz7GTjCKeAwDPlwFa+IYoK8JRNAO5fnSlYL6Ibu4BNc0YOz5xO+3WKfgGKMwLQRea5jx0yR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353971; c=relaxed/simple;
	bh=NDAtl+4mLKv1yl5hfJz194/BrQpWwHvwp7K7DPOGlgc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=ORWwyzRO28z1KLg63R0vo74y0ATZtf1nYql6Slb6V1ydj3HUrz5Xj3ZhEeghk12T9ZMK9op4hlqNaPWsFWVY6g+gnk6R6dCJPN4/a8IRq42GNLuv778r6kosTn69UweRZWuCpHSgbXX4KbkzEZcNoUDhkaPwlyztuU69T1vA4CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=kG+BYZVj; arc=fail smtp.client-ip=40.107.92.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="kG+BYZVj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhRFpCsCN9bB155n7NdEYMAItVCOXYLeD/N9aY87rY97pzN8IB9IlesMf8NjjIZL6qjCWHkaFy7MewCjQTQkewTzwvzApesnpH1HWKNLbNuTogroGPq8SFvr5BXguEPP86QhJW6OmTjpaVjdSCY0Xr0upP6rBXtlq8m06rlE+t2Bz3KkL1ETn0p8ZlXR8bofSgtecLTFMcwC13xi2ipYF5SKby3zioeKFVSiJjsk0MOMCs/ak5Nlamm3QUe1WjR5NoHOoEwJtwXrABWqvfzAJu9wq7R48YWUJy9JxfA1lkNGKcES7nqP8y35/UIZGmehQz+cxTEGBicrsaXQvav+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6TgS5LT+HhdLc1PqXy2gCN3J1IkakaMka4s47K/biE=;
 b=SxGQr2HGjH8NqA2QeeP+KFiAySATkvZKvNU3xiAPfQljgv6+RJkRZa9sKa8qCRZE/EWOvhfgMYFZStQxDIG1BwWYYhTNI/0yCj0o74GWsXzhpTyVdK0knQCLpqUPunDC/2EuEFycAVu1Gq/MRhpd4Ud+sUFkOXuzfqziAH95h83A9ZzJFHSLncKZNLFPfU3oeDr+vzoylKC9L5cSViiPxHk3CiHjuYPuSPzMcww3/R2TW7oxoca0IdCiwsh4gokP3BrS6K43O7B4CRMKmHz2zk/3hpMXlQInq3JkPqb4o0qHtKqE2mPDsEIKUBmx7K4T3nQvAWwkbmnXvN/SH8lTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6TgS5LT+HhdLc1PqXy2gCN3J1IkakaMka4s47K/biE=;
 b=kG+BYZVjBNC04X2CNBAFFdlbJxavbmjiTRn0D+JofY/leyH3svEz86i0kjIYeHhEpun6Ivsb0t2lSv/1FzMuNNHSH37y/AWXa4fbnbXg1VD4KAQ7vMdRqSn2z3hx12Xt38RhE76P1xIsbncKTs+mgVsyow3DZimEB9gNsYd1uB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from PH0PR14MB4360.namprd14.prod.outlook.com (2603:10b6:510:26::18)
 by CY8PR14MB6756.namprd14.prod.outlook.com (2603:10b6:930:78::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 06:46:03 +0000
Received: from PH0PR14MB4360.namprd14.prod.outlook.com
 ([fe80::f91d:52ba:8284:3e02]) by PH0PR14MB4360.namprd14.prod.outlook.com
 ([fe80::f91d:52ba:8284:3e02%6]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 06:46:03 +0000
From: Chance Yang <chance.yang@kneron.us>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,  linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org,  morgan.chang@kneron.us
Subject: Re: [PATCH] usb: common: usb-conn-gpio: use a unique names for usb
 connector devices
In-Reply-To: <2025041131-datebook-tumble-a759@gregkh> (Greg Kroah-Hartman's
	message of "Fri, 11 Apr 2025 07:55:09 +0200")
References: <20250411-work-next-v1-1-93c4b95ee6c1@kneron.us>
	<2025041131-datebook-tumble-a759@gregkh>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Fri, 11 Apr 2025 14:45:59 +0800
Message-ID: <83tt6v2o2g.fsf@kneron.us>
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::19) To PH0PR14MB4360.namprd14.prod.outlook.com
 (2603:10b6:510:26::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR14MB4360:EE_|CY8PR14MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 022246cc-3f33-46dc-f322-08dd78c486d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7053199007|38350700014|80162021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K5VZsE6KWrwj+KNKEjwgtymw79Ihxy8nur3dz9udTIrVF9wY3ASnZunz3EN+?=
 =?us-ascii?Q?DVcCWi2kUms/Naic2O2yydIRIvh+3jvNt3Tcw8Ixe5Wg+yNlSxKI/2J3MQKT?=
 =?us-ascii?Q?JRUbBcydWoCeWk/AM/JTxmhgOHVRNZGmtsOOq0FQvF23XsE3JdIuXuLbHsJF?=
 =?us-ascii?Q?GctIiWkMtFl4/UlSSMjx+9hT+Hefg6kLjDFkBMIibHM7uTxExT+T4n3gRz61?=
 =?us-ascii?Q?Y7bp+MmK+dl8x2VoAPtre146nkBNbWPu5dYuSLV508Vn+O/z9CkntVWGmwo5?=
 =?us-ascii?Q?dx1QmwO5Xum1+ZytR6aAYcRCBDVwZDx37DmFbBjCD1CHvuunTrZK7adcPZ93?=
 =?us-ascii?Q?DTVX4OuPLEfziYk1QmyzBVxr4r3iEZVupJXX1tLS7iEIHWZbKsA4m0fMjVrh?=
 =?us-ascii?Q?QBgthsz8Vs3rcwIOi3tXsr5GTzBeE0152hAfOuT4asNYjk6wFHmrtQ4iU41h?=
 =?us-ascii?Q?ElMpOjDznBk7JWX2tVZKyhKRrttTDksd6VIMHL0FNa4epIP0pb5pJVVAfzVe?=
 =?us-ascii?Q?YdK3Spi0mZQnAity11nwx3KiT1OyndTImmO2CrsVL3Iu5aRGmJBF+NnDFbpK?=
 =?us-ascii?Q?Gkj0BxZXdF+aumlS0HVE1g9dtixht+dAufIfTXjsgXg0aRmYl+C8LEmPRKAV?=
 =?us-ascii?Q?Zanihv1nFwahidKeOtiw660G0lWuAwWeHySvU8qQOAaQURS2pmi8lnZO4sre?=
 =?us-ascii?Q?SLB61u68VPck6BK7mRHHg35HKjp+1nwFE2y0aQLsAXm58aV9uxgnl0+4H9gQ?=
 =?us-ascii?Q?qSP3Fwsn6XkjIzss6dY4DGAgRdNH4JWNeeTROCqsmwzazLwQmiMEcowB7NYS?=
 =?us-ascii?Q?o3Ltzl+ER8IzHZ8TwePqzKGLu4Yh1IX6WGaWvaTzIyAwUC3eI8bBXNEglJYq?=
 =?us-ascii?Q?Vjwl/o7LkXgUU/aLUxFPZXuLueFpPSw9ccvgR+c5fGQ3Fn2AH8ZvpLCIyd7t?=
 =?us-ascii?Q?jKxopHkW/zYNUeFJDcEo+gaRieF0TLfn5KYF3msuHwc+qKR4aM8X96VY+XIc?=
 =?us-ascii?Q?2W7O030dQonrfFZI7EpCGPXtsgTUnWw2lptaoEu128BKVudOp53gKAbFmyT1?=
 =?us-ascii?Q?CN0JkxVXaf4iB6p+QvKJHUEMamKb2rWY3tH6tApnxl/xyVcKHMql6O85uPtH?=
 =?us-ascii?Q?B281Z4sWsoCBdsa9oAPTSRtqkabWfUjtWSbBXYCA6QRKYvhph/Z2OLMZTMgF?=
 =?us-ascii?Q?17dpp02Th1zFL29nVSrcyLGRW0h1Cbu8Bma+CYvi1JgaSLxQ+TDDGalKgQeJ?=
 =?us-ascii?Q?tLscpsFvyW8+ZiNAyEgG4T8y9baRrZr9igbDxmJeTabpF0RzveVcKgmPSQgJ?=
 =?us-ascii?Q?w/DzFIMAEZqb7Lt/Ew0f4mcfWfwv9J7LKFcv7JBbt09u05foV9kKV5bNqmGj?=
 =?us-ascii?Q?VVfZ8MxqQR8sz92EQjYmdirhbQhRDPt6hsRoU3bXyZ6Ak6ch84AG63+k5luK?=
 =?us-ascii?Q?5PeWbW9ni9DrZxMORrzdZ/19zl+oP/R7hJwPxgVD/mDdDBVcZQ0n30sCOZlf?=
 =?us-ascii?Q?YH7EKQdk9tkpekmWkO0HHBvI8STGPtF5Rhtm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR14MB4360.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014)(80162021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ANBZlZzD3SMdOA9xShilAbtNUqDsVcDJiCO2+kLhjN1zD+E5UVlibctd3iC5?=
 =?us-ascii?Q?1PDypb2fXIF899zgML2J/FfiqCKCDaJEUi4X9M6m6/4dl8XP4CojYkhijC8M?=
 =?us-ascii?Q?nLilpNGvRCK61buPq1EOihqmH0yWeHVP2VF2E8JXKcF5yR0FecFj5xdbhc/S?=
 =?us-ascii?Q?xe7LOV3gDLX690MyxS4hOvBED8sCRUOar6XfKzaQqOuSCGA6JQToyGT+pazD?=
 =?us-ascii?Q?0kAzesebf6/GtLiloYeT0xt6z10+uK4By/Q/a/q5VO20EMsXfJ6jfu8EoMKq?=
 =?us-ascii?Q?MFso8bUgu7pl8qLNl/WR1QyPjzxTI1plGnN7W6pJibGQb53DRUns9KDQebmp?=
 =?us-ascii?Q?QEuh2waE/aWyOQfa9vSelpM/4bkXxbmNrEi7XvmfzdoUvRybqzWorXJabwCd?=
 =?us-ascii?Q?vEdb4Mc5NKOvHxhb8zTatHdJTQfL7NXupiH8oifYuxrTrS0LVGE79WVuBDKB?=
 =?us-ascii?Q?PBQfRmZDabQzjg7EPrheLJVTdvBe6VcFX52QPBdLAGVfgxkNKVqQM/GlCuRH?=
 =?us-ascii?Q?oLLHqYZwYJhLBq9Qu7X1dkOrtSrzSqap3Rf04aLjeG0Tc/SmkItbSPGITw2V?=
 =?us-ascii?Q?CEExCsV1FCEMUSLWgdtikvIYA2MIuDa+eZVGeJtQVZATY0h8qPuN99EXFCcn?=
 =?us-ascii?Q?wKigmO949LKW6y3PxWovGuXCCyrxwfH4v2xW1S/QCHef/fjqyR1QoxzCkpAE?=
 =?us-ascii?Q?Au9lD1C51KOMs4589n2iLXAvMh3gbL2tAdFb1pHg4UeVhZQpvcj8eCNlbp9T?=
 =?us-ascii?Q?/a0hkPxxkEFlizQWBWc1st4VSzhxq/0Of4/uBM9c1FNWrCbW0NzNmZTDdVkq?=
 =?us-ascii?Q?DsQW7xt4ulHpWm/E6I2/qJDiuftAhnFWVPvGnl88+4ov3X1H9ValEEak9XXS?=
 =?us-ascii?Q?BB0nuFVtBKuwBInOYj4zIDnI51GMXdkh/FdUYet/sCgtWig7dOLCk6UYd/bm?=
 =?us-ascii?Q?PLsLaui2xa3e8m9SD2+z2rY0hQmDoFkPag7fLt0OWNNJkGoxr8WoAOCBTb24?=
 =?us-ascii?Q?yIbhGMxhZPeNeUwFTyusBfRlMJnCY2zEH4RX1+FXI7tvf5pbZLfkTSdMwlCI?=
 =?us-ascii?Q?YSzWzARk2Laa8JCL2d8CIWs4DdANB412cXw8tYyWZMgG4K877//aIFhdQrzc?=
 =?us-ascii?Q?qyp5dV5A+09IX+yIfbgAsiIG7/aRv6QleqIkmfEtSOl7o9nu9Mie8sKDBHEB?=
 =?us-ascii?Q?W1N+FtDfRJpihUVkNToiVDExjYXvmN/br2k9uXyCcoN72e1AgdqgcnmBwqbF?=
 =?us-ascii?Q?gfJpIIWF1l/LuIwlXIVYI+0OLpbx5RjtnTWd0W8VdmzQsZ2OWFITp4sMF0KQ?=
 =?us-ascii?Q?M5//cASijhMoVrKjFnwn5r+OrTz5ZLI1D1sMEXcEwamz2/3QlhNIquEj9Cg8?=
 =?us-ascii?Q?MXB2Gc/90wBFIjmYDpz2aggDDnxBnGrU8vGBO5cG1ermmj+iHwaitOC7bTVW?=
 =?us-ascii?Q?ejnbAMvre2vUkGDMxn1UmEQpdKCPDsL2b0GcPzq4LiqbpF2wYBeFKJV6770J?=
 =?us-ascii?Q?vgyHKeUZI00zxKme3L51z4jeYSASajZkJAkT6IUr/5r0+K6BmMCHSuxi5kNn?=
 =?us-ascii?Q?WkRdJIo0sPUX7x0OLbMhDrA30nONysgg3Qq4xvTE?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: 022246cc-3f33-46dc-f322-08dd78c486d7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR14MB4360.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 06:46:03.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoK44OyBCjI9SaaayTFa8Wp0OpgP0ymqouwu/aWzsLkQp4UHrdxq0yomnoUsitECk+23bvrochv1Aq5pb9sqPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR14MB6756

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Fri, Apr 11, 2025 at 11:27:33AM +0800, Chance Yang wrote:
>> The current implementation uses "usb-charger" as a generic name for
>> usb connector. This prevents us to have two usb connector devices
>> attached as the power system will complain about the name which is
>> already registered.
>> 
>> Use an incremental name for each usb connector attached.
>> 
>> Fixes: 880287910b189 ("usb: common: usb-conn-gpio: fix NULL pointer dereference of charger")
>> Signed-off-by: Chance Yang <chance.yang@kneron.us>
>> ---
>> This patch addresses an issue in the usb-conn-gpio driver where the
>> generic "usb-charger" name is used for all USB connector devices. This
>> causes conflicts in the power supply subsystem when multiple USB
>> connectors are present, as duplicate names are not allowed.
>> 
>> The fix introduces an incremental naming scheme (e.g., usb-charger-0,
>> usb-charger-1) for each USB connector device, ensuring uniqueness and
>> preventing registration errors.
>> ---
>>  drivers/usb/common/usb-conn-gpio.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
>> index 1e36be2a28fd5ca5e1495b7923e4d3e25d7cedef..2702e1a26634770500febd567f9d0891e63a8c4c 100644
>> --- a/drivers/usb/common/usb-conn-gpio.c
>> +++ b/drivers/usb/common/usb-conn-gpio.c
>> @@ -155,13 +155,19 @@ static int usb_charger_get_property(struct power_supply *psy,
>>  
>>  static int usb_conn_psy_register(struct usb_conn_info *info)
>>  {
>> +	static atomic_t usb_conn_no = ATOMIC_INIT(0);
>
> Please use a proper data structure for this (hint, not an atomic_t, but
> rather a idr, or is it ida?)
>
> thanks,
>
> greg k-h

Thanks for the feedback !

I will use ida to genrate unique name (e.g., usb-charger-0,
usb-charger-1) and send v2 version of this patch.


-- 
Sincerely,
Chance Yang
