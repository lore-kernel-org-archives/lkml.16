Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B084238159;
	Wed,  2 Apr 2025 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593660; cv=fail; b=tkvgPW8Pa0H8sOjjDzDCCpviSHh78nvEmaC4GuxhXDwo144CIdsW/EvKhNmltkoBQZMdxOjy5+sNVLmkmZ9lxKD+JpGp01GWDLB6aptRGkxvJIfVkpRm+zwfkbifwvIwhKHzBLpWAc6nU4oONUFg8i+i5xaBvCgRWksHuNpihA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593660; c=relaxed/simple;
	bh=f4ocWRwbLEEeeP8JjUbJC3w/uGd12sPglW6oDnQoHXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IpYQgLvXcazqZAVfxc9C/oldt3v8f+bYhzaGiwHfXbyrfasXzG++yyFA38Wfs1zlH/yNlPdxFRYuBPMB0E7N4YYm0nvVeXJdJOjqonOxwO6SE07kaEgjKw+z7XYGNtj3sR4aBL+8AiriCkjcfZ+EUWKsx9aDg46z9YZjqfoPhFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XWgpPg8K; arc=fail smtp.client-ip=40.107.104.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XWgpPg8K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AakWd1sldxHGPiXm3m03cAoLs+gngW/f2ZmFFovyCpdOgBvFK62OwPHDAxCdIs9iw7it4Thw0OyDqusESxMdKniubOcJErvCtyP36jpg+Ajb+U/I4D9dlAVO0vY7ngbhPwNSuW+zzXhPz3N6URvI69SBs+gUs01sgVKeP7ml302nFz+o6EtrAWKDYVPQSC/q6Sv+NVNJWibEg/ueby+VhUhFTKMVFv+N+CEudJ0gj/K0dOmEHXGMRezNa4E01Z1x9m9pJ5AtUpGf6m5ZXwpAHzfCYAPKdUnbqRUBMsxslW+Rfsr/v7mV3AmAdjFJvUhrhNDcUgFtmIuJWtpFzgHTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc67unXpJgswIaxH9EGu0RAt4Rf+5gW6pQAoj3BxGu4=;
 b=wvtqPDTzLTPtB9X7UyhB0KRqNc5ylxElJF/aIJVDdIOFHB+CFG4LJR3g+TmRYo2NErGfuUMxL8VELE+XXsdD6sEG5WDMRsqpID3q9mtuyFKtqnLPsEjauI+ygNLgOjT+kdg7miHQ/elphnYgw3lWvPxrZjPiELAQHKD373lY/Zsfw2XcSNZdhHCz5VATHL0O/J+Zdl1hOpp8ADx4tCMZuyZ/9WqVu77iOTLiX8o5VEN5g+L92ZGxpQxUGNMz3kdxGtC2cmn1F1cKCcjfo/k2t/1XZKcbGKz0ssSusew8yvrGOchum06mdcAsoGYKuamLxowmwCrMiBJzpEcHjdI2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc67unXpJgswIaxH9EGu0RAt4Rf+5gW6pQAoj3BxGu4=;
 b=XWgpPg8KXbMhvgNOkalG7yziE4lz6QshT4LMuXg+1vHp/UziWAQY+KEoNCVr8GDN+v9gT5knPogXlbUOUhv14t7wz90VpGBUqDJHp7gJ/aStvJB6cKxAbcJJ62/RtmSxV/DWypzy72TuHtgX4eGsjSxWUFenc+2UlGHsw9YUfe8DkRIqYv6uZfWrikGw2v5MdSgK9+eSJQLUMTcIQc8SWrq6xa6pylwajQdWyuramWt1QNBrdHbucBoH2Wy+tBpdCuemP56zXtdn2WDjnXoDNNMJvr5Ueg3MdQ4E7WZvYgc8J8S+KMmX0RsLHk6u6a/rMPpS5+2lPaWfswsBukXebQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6818.eurprd04.prod.outlook.com (2603:10a6:208:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Wed, 2 Apr
 2025 11:34:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 11:34:13 +0000
Date: Wed, 2 Apr 2025 20:42:27 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/7] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <20250402124227.GB23033@nxa18884-linux>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>
 <Z-v9fLBztfeerCqw@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-v9fLBztfeerCqw@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4d88ab-e1c9-4e45-dd15-08dd71da4b39
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qSYqk7rVBEm3QhQDbLgYpv1ofZ9EHGb98fvo9kSRfJrHqymYXM8hrDeGbZZR?=
 =?us-ascii?Q?a1xozZzw1CGXMLexLE56pkR1/vtatWtb/SrMQB4q84BDY2Lvp1kcg35+PrFH?=
 =?us-ascii?Q?eXnFqqaish9eTa7SslxReMC8ppnTlk18WitM8WpHTILob1XCSkTr5v71ffZE?=
 =?us-ascii?Q?TzFqzk4itgGg0s2Uqzu/XgWdbHVHW0KOgcNvFVsmqtUKWMpY0Aya6xZg+rvM?=
 =?us-ascii?Q?9a65lPWDMZEbuw7kb/LfkW3QluUTB/6OvK33xu/OgRiPKTi2+8wakSRHatbq?=
 =?us-ascii?Q?nigtIk+u03qgnZ7j4xN4ky9YZ7D8O6cqWWaIYoDivXM96X4rQTywq01lK5WP?=
 =?us-ascii?Q?zm0URVGsoZUa2YpaXA10MKiYLHBawGCia1ulgNIwjRcEKrckDGFDPsW6K+4r?=
 =?us-ascii?Q?bl7ZbPfQPbRELQU5Mcl4eGMPiIzWqUwW4PAH2XFebPEfA9Ct8X9dYWrjf1SI?=
 =?us-ascii?Q?fuV96cpxIracghOaeDA9f2truj13XRsI+3qpPkNREzGvW49Bp1Q62ovHx4Tv?=
 =?us-ascii?Q?pZj8RL+qi0mkr49cjZ204G5q+KD5CrRZ6dqLLzMi2A32/UCMAf6MRz5wHrQt?=
 =?us-ascii?Q?8tHlQuDxjbFAWZZ4g3X1yIblhk3WVs19hHOsc2vQmN1f7kmHaRqd5HdqNX/d?=
 =?us-ascii?Q?3yjlldFqXCcHJ5k03T7v8cPz09SH/x5Ea/X4eSXKyQUH8odIszurX8ETY9tI?=
 =?us-ascii?Q?XLIRK3srvcavp1SeujE09DNkBLho4iwFDAtmbVHeBEPHMhas8UZjNWeA4M/8?=
 =?us-ascii?Q?kQu3e7dTorisn548D9DXuj5hAvS+j3yunULFce+ED2V2tvf0sqQ+PePjI5kz?=
 =?us-ascii?Q?ySHVyzzhuXEnwDOS4OxCfsI8Gfh/iOJf9Tby8HXgrKe4hwqVsZFP4jNVo9uv?=
 =?us-ascii?Q?8w2FcJwz4Jo/J+vRPr60N40I0cZJxe8MEY4mgXM1RjmX3jMLgAU14NFoAJYV?=
 =?us-ascii?Q?bN2gJQu3cJisWejaGfk+Lak8Iw6itGA6C884r8l6UhNtMxrSWDtLnskCBCsn?=
 =?us-ascii?Q?mxSDW7RGZ1dSfjIOvwGyzkFS/pgKzFq79VGJ3HWlo+mcYmQ4a+bd1urUaVWP?=
 =?us-ascii?Q?KzzbO2PnoLJ++0t1tXH0WOFoxm0V7ZWQmoT3F58s3amBjpplYydTdayAF2+L?=
 =?us-ascii?Q?hudpx1PhBkYzOpBybkSsiUQV8bLLd7Jxms9u5G0U0HLj4DIvK9jBfI1T5jc/?=
 =?us-ascii?Q?b1cD1yXi9xq3Ntx63bA6NuHqwjG7Yy/KY/1o3Kit2MvCWX9qQSWVsdXJjpnL?=
 =?us-ascii?Q?mTsdMQ4Hr77qSqbdl9wN3IbE2wSB2xeErIrlbvV3ynGjYLXrKjHbMjSzCi18?=
 =?us-ascii?Q?XGejcvylOlpOa//u+r5ZNpanYyguu7YN4xba1RIhHgZ35+EBxnFI6weKXr0j?=
 =?us-ascii?Q?rmiTstiwyhqbZ/zDMzuB/5W5VhW5C5ISMnKkFdQIO1drfq0Wzhy/WZWbfvD4?=
 =?us-ascii?Q?jUi+Jb8dmgStt33Ps559vstT3Epu9uwq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6URGyc+ketaDonYBkzy51R1Dw/rjR+5PBi4PWUn1AAUoSFXtUvxj4KYvkBPW?=
 =?us-ascii?Q?tIM7XK1sW7WDSqMEaYGxOVonNcoXx3L+SwlVY7eNSDVj+A3xs1cG/yJr1V7K?=
 =?us-ascii?Q?yNJH+yNYlPUGPR7XVv0jTzG+58Lnh6Zfyl2D4BmXFnC32nB952Ts3ToZ9Vv2?=
 =?us-ascii?Q?vnmC6mIkQ9qAd3THb4FJbH6//E5t1rKDSe6Pu2HbCqOQ/GLGHajbphtTpoeH?=
 =?us-ascii?Q?ItWvZ3JnZVufqbXBe6EYFyrUP55KWNtSPhuQuXMb5OfreYv0jIGfo0WW3Vpb?=
 =?us-ascii?Q?Wp0qUBdlZ0rURyWQ0swl2SpbbsRlNR/Rw/JzcSKPMwhXt4fWXGviVghtphUs?=
 =?us-ascii?Q?mfuC8m97rSedOnQLrw1uDs4Oc8j6CnouT5O5BFB+2MtngFgg87QUwKQvGfg0?=
 =?us-ascii?Q?NE9FhXO2InEsk75VZgzWTRLffLYf1Aj0/PxTYdUGezWq5rPp/g6+J6p+Fnmu?=
 =?us-ascii?Q?CLwZl2iN83GibIDVVng5vknWWF4M5hgIUXbmr4umJkH+WD1jwqljVIYjTa99?=
 =?us-ascii?Q?pl/kOekqrA636sWAoZOAYOpG3NZjlbhuvLcmmksmrvaeZpjDWIUgBTgojEax?=
 =?us-ascii?Q?qoXbGEsNJmsadyBzHpzEZhRRofgsndu6lpZCLhAy91i2lpgBXnrarABGBIh0?=
 =?us-ascii?Q?eJR8g/Uo7k8/IpXIk1al8Pik60Gi0oi7X1oM+j7LuZxxeZgDqqHgdnFbmkED?=
 =?us-ascii?Q?+7iy2ZCzKfx3dcMmnusbqGuwQS3QQ2gWdkjb9qIYoDVDh3GialkjWifl8QlY?=
 =?us-ascii?Q?wBDGmzcBY9AfKRaWqqtpxVNeuWaKLOJ6Q/JUHtDketsjS53GHmwndcYaRs3Q?=
 =?us-ascii?Q?JdNeccVrNqjEyy1z6mwQgYRvuljurWL4kw2XBYi6ISwq64o6QJGjcV8cbVy2?=
 =?us-ascii?Q?blfelmObt9++mw9ZgBp0eRiNLTqeKniwpTy3X5hCGzLi1ZtwI6XYd5QtEJJS?=
 =?us-ascii?Q?B6Bl57PyG7QXRKubFZifQJ2+AT38+FFa56e5xjTleTTZuZSSSHdutDsyYmTD?=
 =?us-ascii?Q?ObVGjszeeJQ0vFV3r9vqlHLVR7OUkhCtszgd/PM+g2d4MgDqrUIALe4c+ZPq?=
 =?us-ascii?Q?UNSe/t73l9sp0f/R8xTQhPzOWIOGlYVhKftFXk4Csx8sjYbtN3vSVB0Y13z6?=
 =?us-ascii?Q?y4anilSCIA4NCsJBCXQQnjFTQcv0UFNaf6BAi3bhoF6MBlXzIpQmwtscY97Z?=
 =?us-ascii?Q?jqr2gtULwT3BKCwiD+yPpGT7/rJc69Nn6yy6UPCuEr4pwAai4gqQrjarjcM8?=
 =?us-ascii?Q?VYDJGKPUHadDXJOANUe0DYzUG/LJN0VhYhic9ofhNbkEoaRMszOHgnptO2SU?=
 =?us-ascii?Q?gSD+MOdLlVHqE+NYmMz0c23iOc7booEyqWFUvvx1FPfKQJ+cr5vsLpfE2d6O?=
 =?us-ascii?Q?2QySK2fWHIbKDGXKwDfUzmgU77kpFAmyvGwTgefXGHyiogF7DQoo/qfUbjoo?=
 =?us-ascii?Q?/qakOlCwC3WZhzguW6yZ6OiRPMDHkWtaEQg0lp/ZHgjnV+8A/LkmB8JWSQfZ?=
 =?us-ascii?Q?feYwYtiPnvn3rS7Wzhh1A7+xejp2UoMC36iqCgkH9CRAK0UiAa9v/H0Hj/nC?=
 =?us-ascii?Q?j1ceZ3h+AdumG9GbgTVyRBlIEVSR2+RnW9SNZPe3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4d88ab-e1c9-4e45-dd15-08dd71da4b39
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:34:13.7347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1uBd667kPEUdHCJrMq6cCDOJ6pBZS65tIb8ftgvWL4Du4ulIZFS92PXcNt05aEngjuiPVD9O5Vek9sLj4r3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6818

Hi Cristian,

Thanks for reviewing the patch.

On Tue, Apr 01, 2025 at 03:51:40PM +0100, Cristian Marussi wrote:
>On Mon, Mar 03, 2025 at 10:53:22AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Add i.MX95 Logical Machine Management and CPU Protocol documentation.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 801 ++++++++++++++++++++++++
>>  1 file changed, 801 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..74326bf2ea8586282a735713e0ab7eb90ccce8ff 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> @@ -32,6 +32,501 @@ port, and deploy the SM on supported processors.
>>  The SM implements an interface compliant with the Arm SCMI Specification
>>  with additional vendor specific extensions.
>>  
>> +SCMI_LMM: System Control and Management Logical Machine Management Vendor Protocol
>> +==================================================================================
>> +
>> +This protocol is intended for boot, shutdown, and reset of other logical
>> +machines (LM). It is usually used to allow one LM(e.g. OSPM) to manage
>> +another LM which is usually an offload or accelerator engine.. Notifications
>> +from this protocol can also be used to manage a communication link to another
>> +LM. The LMM protocol provides functions to:
>> +
>> +- Describe the protocol version.
>> +- Discover implementation attributes.
>> +- Discover the LMs defined in the system.
>> +- Boot an LM.
>> +- Shutdown an LM (gracefully or forcibly).
>> +- Reset an LM (gracefully or forcibly).
>> +- Wake an LM from suspend.
>> +- Suspend an LM (gracefully).
>> +- Read boot/shutdown/reset information for an LM.
>> +- Get notifications when an LM boots or shuts down (e.g. LM[X] requested
>> +  notification of LM[Y] boots or shuts down, when LM[Y] boots or shuts down,
>> +  SCMI firmware will send notification to LM[X]).
>> +
>> +'Graceful' means asking LM itself to shutdown/reset/etc (e.g. sending
>> +notification to Linux, Then Linux reboots or powers down itself). It is async
>> +command that the SUCCESS of the command just means the command successfully
>> +return, not means reboot/reset successfully finished.
>> +'Forceful' means the SM will force shutdown/reset/etc the LM. It is sync
>> +command that the SUCCESS of the command means the LM has been successfully
>> +shutdown/reset/etc.
>> +If the commands not have Graceful/Forceful flag settings, such as WAKE, SUSEND,
>> +it is async command.
>> +
>
>Hi,
>
>> +Commands:
>> +_________
>> +
>> +PROTOCOL_VERSION
>> +~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x0
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>
>Good that you added the mandatory/optional description..
>
>> ++---------------+--------------------------------------------------------------+
>> +|Return values                                                                 |
>> ++---------------+--------------------------------------------------------------+
>> +|Name           |Description                                                   |
>> ++---------------+--------------------------------------------------------------+
>> +|int32 status   | See ARM SCMI Specification for status code definitions.      |
>> ++---------------+--------------------------------------------------------------+
>> +|uint32 version | For this revision of the specification, this value must be   |
>> +|               | 0x10000.                                                     |
>> ++---------------+--------------------------------------------------------------+
>> +
>> +PROTOCOL_ATTRIBUTES
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x1
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      | See ARM SCMI Specification for status code definitions.   |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes |Protocol attributes:                                       |
>> +|                  |Bits[31:8] Reserved, must be zero.                         |
>> +|                  |Bits[7:0] Number of Logical Machines                       |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +PROTOCOL_MESSAGE_ATTRIBUTES
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x2
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: in case the message is implemented and available  |
>> +|                  |to use.                                                    |
>> +|                  |NOT_FOUND: if the message identified by message_id is      |
>> +|                  |invalid or not implemented                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes |Flags that are associated with a specific function in the  |
>> +|                  |protocol. For all functions in this protocol, this         |
>> +|                  |parameter has a value of 0                                 |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +LMM_ATTRIBUTES
>> +~~~~~~~~~~~~~~
>> +
>> +message_id: 0x3
>> +protocol_id: 0x80
>> +This command is mandatory.
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |ID of the Logical Machine                                  |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if valid attributes are returned.                 |
>> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
>> +|                  |DENIED: if the agent does not have permission to get info  |
>> +|                  |for the LM specified by lmid.                              |
>
>..mmmmm... regardig this next field...
>
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 lmid       |Identifier of the LM whose identification is requested.    |
>> +|                  |This field is: Populated with the lmId of the calling      |
>> +|                  |agent, when the lmId parameter passed via the function is  |
>> +|                  |0xFFFFFFFF. Identical to the lmId field passed via the     |
>> +|                  |calling parameters, in all other cases                     |
>
>In V2 there was an issue with the description and you told me
>
> >> ++------------------+-----------------------------------------------------------+
> > >> +|Parameters                                                                    |
> > >> ++------------------+-----------------------------------------------------------+
> > >> +|Name              |Description                                                |
> > >> ++------------------+-----------------------------------------------------------+
> > >> +|uint32 lmid       |ID of the Logical Machine                                  |
> > >> ++------------------+-----------------------------------------------------------+
> > >> +|Return values                                                                 |
> > >> ++------------------+-----------------------------------------------------------+
> > >> +|Name              |Description                                                |
> > >> ++------------------+-----------------------------------------------------------+
> > >> +|int32 status      |SUCCESS: if valid attributes are returned.                 |
> > >> +|                  |NOT_FOUND: if lmId not points to a valid logical machine.  |
> > >> +|                  |DENIED: if the agent does not have permission to get info  |
> > >> +|                  |for the LM specified by lmid.                              |
> > >> ++------------------+-----------------------------------------------------------+
> > >> +|uint32 attributes | Bits[31:8] reserved.                                      |
> > >> +|                  | Bits[7:0] Number of Logical Machines.                     |
> > >
> > >...BUT this returns again the number of LMs while asking the attributes
> > >of a specific LM ? .... is it a typo or what ? ...if it is just as a
> > >sort of placeholder for when you'll have really LM's attributes to show,
> > >consider that once this is documented and supported in this version of
> > >your vendor protocol it will be needed to be kept and maintained...maybe
> > >better just to declare this as zero in this version of the protocol if
> > >you dont really have anything for this command in this version...(like
> > >many times are defined the attributes fields in PROTOCOL_MESSAGE_ATTRIBUTES
> > >above, if you really know you could want/need this command in the
> > >future...is it used now ?
> > 
> > My bad. This should be updated with below
> > +------------------+-----------------------------------------------------------+
> > |uint32 attributes | Bits[31:0] reserved. must be zero                         |
> > +------------------+-----------------------------------------------------------+
> > |uint32 state      | Current state of the LM                                   |
> > +------------------+-----------------------------------------------------------+
> > |uint32 errStatus  | Last error status recorded                                |
> > +------------------+-----------------------------------------------------------+
> > |char name[16]     | A NULL terminated ASCII string with the LM name, of up    |
> > |                  | to 16 bytes                                               |
> > +------------------+-----------------------------------------------------------+
>
>...so it seems to me that the above lmid is a new addition that was not
>mentioned ... bad cut&paste ? it does NOT seem to make so much
>sense...or I am missing something

Sorry for not made it clear in V2. This V3 is correct.

In https://github.com/nxp-imx/imx-sm  code: sm/rpc/scmi/rpc_scmi_lmm.c
There is lmId in return.

/* Response type for LmmAttributes() */
typedef struct
{
    /* Header word */
    uint32_t header;
    /* Return status */
    int32_t status;
    /* Return LM */
    uint32_t lmId;
    /* LM attributes */
    uint32_t attributes;
    /* Current state of the LM */
    uint32_t state;
    /* Last error status recorded */
    int32_t errStatus;
    /* ASCII name string */
    uint8_t name[LMM_MAX_NAME];
} msg_tlmm3_t;

>
>Other than this, LGTM.
>
>Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Appreciate.

Thanks,
Peng

>
>Thanks,
>Cristian
>
