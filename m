Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012025.outbound.protection.outlook.com [52.101.71.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB8B1A3BC0;
	Tue, 24 Jun 2025 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772866; cv=fail; b=VgH5Rdp58jjrZB3LSqkjO8C7gC5Ebgj0J4aWdwOZeuY242js8XgqzmjbtZHgWVXIjWht2bK+KojHcAWixQp/6937FtVP5wHfXVcU2gIhFzOsOSyFuys4skU9J2P9wvfyV9X9arKnYh8JlxiMVZJvZ4SDN7Un5nBEqhTJTidjy4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772866; c=relaxed/simple;
	bh=FjZ/WqlvWfE4xUcyRS8U5tXRAs/jS8gAxbT5nL3TPyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qchxg+69d16VJQgR2N/anqcOhoOcQ7FLfJTUAoRYOOyDg+acC535AnGrNjS7jrbNumjhfR/OzXYeJ7d6iPAnWsBcnmuEIlMq0LTzfTFeued3Ge3nDJT02H5VGH6lZpcDrk/KzFKSTSmfB83PraQl4rUYS89On9IHQ3iui7p7CUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AMY01mfI; arc=fail smtp.client-ip=52.101.71.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AMY01mfI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FC2R8HK9096RJjhogczaw28awfPkt1kRuRi+9YTA5FKnD4pnlcUR1Me30eewxeX37wJ/vxMWw41cb9MRfavsWH6QC3P4oFYmSyAKeRQreVVyoGhtnkTU5N4OwzrqOq7LIv0raqa42TlQ5+jTTvLkxZQfl+ZXLZhxDT6UKlC5uypde3fsYmZeQ3KrS8CSHxyJFEE86gdV6a1btg3bcWxFzZp9jQu47DHOuWg/K9AIJBPzEvDvmS7CZIB+MK0cRGdMBFjRnrzPV+f6AzMivuJcWvd6W1+YcX75WAzCn7GGfgvxHlPcgoSKd8GbXFr6YeK00NSlFfvF4YS62d2YqJQtig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gv2i/brLalkc/tq9jIyLyFeNgbFV/c/nHTZ8ughGTc0=;
 b=UV/bmxhbxyOGylfR+Vd8VrHIaHEEzZgQG+w9CbgzQbtJFb7Z9N6DwOVdmKbJNlhnCKzE+uJP75XunNzKdDAXfCjVsg/UZ3ADkBik5rYXO3q3a4D8wDm3a51oGjdLaAUx1BfaoE3Q6VQqkhXa4ygyaPEA7NmRZIb6EsxifWOjRGtxoQRC/ZiLLhjOC+mjEa69CEWxcXaQvnWqqrb0R31sSnxGsAWu93D4GEvaRv1N7YHfnys1lVIWr4KEItK2pqhiuFDNxlMMvfURDA9hjlmhMt4H14Pq/hRUTtoD0f8D1Uw4WqDphiFGew5wCqv8Dhg5rn7XGB01wi/6DJYVLxO2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gv2i/brLalkc/tq9jIyLyFeNgbFV/c/nHTZ8ughGTc0=;
 b=AMY01mfI+fjSchXav/wiM2xqELfxXsvmfhqB/iVcr/NIMo5WyYUvfzhXzCBb1vb2KJR5u1wQjXGMEYOqzRuEcoBI5A7pfAelTxsjE81UtuI9lGeR4XPT9qWQ4hqug5kVxfoDeVTUurykbAL3YMWSK5qji6FY3b0K0jxj8ZvDR+pETwNIHydNeEramMMw4s//WGyZSB4rotAY4X8GXqRshBhMAQggbxlg9zhQZ9ITYUMMhxHolQoHt87VAu5xawgnODRlGQJh3INK7TPVmnx5ox+qy6xaESNXpQzUpu5NCF25K39vFNQEdipVWH85yepyXSttZ4gQgfocZN143BG4Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8340.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 13:47:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:47:40 +0000
Date: Tue, 24 Jun 2025 22:58:07 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Dhruva Gole <d-gole@ti.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250624145807.GA14878@nxa18884-linux>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
 <20250623142957.GA10415@nxa18884-linux>
 <20250623-organic-foamy-tamarin-fefa30@sudeepholla>
 <PAXPR04MB8459E323E3C77A96272BC1728878A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250624-agile-moth-of-blizzard-c7babf@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-agile-moth-of-blizzard-c7babf@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd53869-57c9-4c6c-e604-08ddb325b01d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uDOnPZdaoWcYhZD8AwwYgN/UVxmmW3J50WUNXLKp45nR6CqSZ+qH5au+wZLt?=
 =?us-ascii?Q?+6kMPLBxsrpVCaW045dbUgg/H9FQqchS0r/9FTHsd++IjHUu3PfFjsZIe+rN?=
 =?us-ascii?Q?4WA3DrhhHKV3/QmtFjQ469JlPgsOeyMHe/j4eW503yIDQZdexSqKg70OEGqB?=
 =?us-ascii?Q?Ptkh3QdA8lw5VYaKwrt8OrlhDs0mI+8JJXfBPHzh7o1/+xwrgHQ7KRXwXYJj?=
 =?us-ascii?Q?pgE3Z81mqihM+Y2LLEZdsLZ21uCCMDExuPjejB+24qOBHzOYrmHk6HzKYXcJ?=
 =?us-ascii?Q?K1062G7M21OYXByqhvduVE0MXUPXTIjhMOqFRrsFRJCvUMEUfqWLDzjFSck9?=
 =?us-ascii?Q?pMkg6bd+OBxIrOGEBHdtY6sDrmhO52wXT0MOqQi2NHk6/rnTobL1rdXoygGm?=
 =?us-ascii?Q?6WpOyAbMxvBxRVJeHhd6i7MvNvjtIY9XT+JIIEaqGtAW0JXE3dCu6iosB59w?=
 =?us-ascii?Q?EO4gGukJDnvZzuqsg0dKWTn6frnpzwXspLulxF0+V2gbnO7UMmmQyuMVKmvj?=
 =?us-ascii?Q?stcoFnJ+VJB+vylJutFEt6OFyVdfWViqA4gpcqUwnmKgFopPl50019H4XS0V?=
 =?us-ascii?Q?HzMKKPaSbj0m5gLFKIrjjmWnER3NI6Ud8qov14duPAJ3TAHjqOB8bwdV8WwH?=
 =?us-ascii?Q?4mDQ7LOcOjMMCPOG2rhjhVHsB9uwRGFYf1JtSzkcEH2X90dIwFdKP4+OyyV3?=
 =?us-ascii?Q?5xdqaVlUa6xwX19AMtq+Iv3yqhLa/bHX324PHhrOSeuOo9WG82nE/oX2JTip?=
 =?us-ascii?Q?yEj7KNQDtWLQt1Xwqia7bkoQpyGm5vNN+ro0i0lAaRed06AMpCma5OlWbCOP?=
 =?us-ascii?Q?ZjdRWA9ei6Z6OPbbI3incObo2dMFatktAk4156/5XOhJyN6mDTnKQ86TmFhk?=
 =?us-ascii?Q?zC0HkQEMG1P8ui9OcWEnoEbKsQCRL0pkayC89fZ+HBNyjMKtDwjcY5cSt1gu?=
 =?us-ascii?Q?rjzHsn+8RLl2bvMxcFiZyisF4FLAbBIKYplM49DbJdtlREe7H8OGYcxT3Tmt?=
 =?us-ascii?Q?LmxMlJNd/8JEfc9Gy1Zz8V0VnGdlpEPGJn0vm3s2x+Sruf6DcNFv4FWeXDdf?=
 =?us-ascii?Q?2KuGKH9ePni9rE+R/WYzMz/64K1bLroEbZgQ7B+9YSObgUe0bPDwnlbv+mWH?=
 =?us-ascii?Q?vEhtcuWyGoTSj5Qfy5mXB+C1a+aWLiuQm84Nx82rva02RvAmp0zvGwvJbdI8?=
 =?us-ascii?Q?TLmnCmWINusdv/H337WlbpX0HOJn7DpDteqMP46fMGI+jYj08XgOrEEVLKr0?=
 =?us-ascii?Q?At5MqnzLApxGEJUasZwhdWeUjAr3Khvi5xLtulicwwzoKW5BYU0yGELntJh/?=
 =?us-ascii?Q?ebYUYHptIQ6QCTR81BjLmcmz+NXt4ibxHS6FWYvk/Y0ZpQFCnc6MjTzhESbe?=
 =?us-ascii?Q?1Hw7R2WOj2FkZJYRcAPAu4bVwDgpeKRBif2uDpRo5j6BSvEP5EEedrPt+jUe?=
 =?us-ascii?Q?oC2px1zLwY4ssH3YyembbA3dlYQLryq2H+Ih/8z2NYMNxjfWHhj3SQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MJXXfiMYcbHB5KI4Ap/stai/JXA7s01hHCmMN1IkVlCZkBiXCp6lUn5Qu/Gq?=
 =?us-ascii?Q?/n7Q89VIbEhe7vzQCKTKgTZzE5ZEnjPqnYor+20C9xPWRnxzriLPfkFIPwum?=
 =?us-ascii?Q?7Aw6qwWCOptEWUFgZpxPs2jIQSyritb+B+FrT9CfPVU9fNRXgloPMoLCIPk/?=
 =?us-ascii?Q?jCCzumltB22kGgy1jKQxYA8za4sablnR4pRcl5LOtNV83T778fo3A8BwoaSO?=
 =?us-ascii?Q?bgKwTB7IDcU1qAEWCKRuhPBVQS5qS9Du/BJlhWi11yk22McxJNuTHHW3f0R7?=
 =?us-ascii?Q?LTGbIF6szLCs7RKQ49fl61JbS7Je1HbS+2FAB7JNUyBVuSbn52YeUEXd1Gzh?=
 =?us-ascii?Q?e4/lQCGnMP5935tXHOPBb0tGjnbX9GtqmXCLI/n+QEMlVQtkiOU6b2EfcDNM?=
 =?us-ascii?Q?djdHv/8LD6dZKFj8C6hcLzRABFq2CJC1uFRi4HDEhAbAIZ5/doqYlUsq0q7J?=
 =?us-ascii?Q?Krs5uNm5Rwgwo8kCcTT7ZYoVdXJTnQ7nvu5SmJ/8JD6INuEsLE5240NxBl3L?=
 =?us-ascii?Q?wzu3A/OTsbs/qCfe95JrSbuncYkcF+bp5EfeiIjMfkSI/nwcF3nrlkB+9l3P?=
 =?us-ascii?Q?qWpWj6XOCurhAiRPh6Yo2l/JgbXl4abTP6McwpctrZ0jRz+GR+epRIXFmkFc?=
 =?us-ascii?Q?jIgGvHRo2rnZcg4/0JiX2w9OJJYMkIfHjRvhDbfq3v5KsIkcgA+ZB4j2jt5V?=
 =?us-ascii?Q?mfMOfNwgpW9s6t6KSHLNd/8xA7F8YANma8UXXMhPwiT3ttNEde1J/9XoSozP?=
 =?us-ascii?Q?1qPniJo+puncKgNM2IxbAQUENtC/1VcWmqiHtQQeA6BJE7EmL01xHQjoQzMS?=
 =?us-ascii?Q?bDzfEXiWMnOJAMeDHLgYACJeR/5IZpIunc37L9KBnHhMLzyL9ZcHAWZDWNa0?=
 =?us-ascii?Q?VNWD4gIcbYiD9pQcjOQnJBlt4HhkQqvDUCFL0h25908sNwT6yQLSOk+Eouvt?=
 =?us-ascii?Q?a+cKF8IgkvNy7zP1himMqpjk4GC6FRY9rEJQSNEucUpSjC4lxq6VnBmhd2gv?=
 =?us-ascii?Q?iOGrPsju6aDKJCrmFi9j4H+MyuRL88XhmFzbEMIJA/mV499dshrEAHDNmj5t?=
 =?us-ascii?Q?Oyl5y6CCrxPLgEcYhSTLWx4SIrwofj+05du/HMiIHAryGz/H/cQjc2VEnIua?=
 =?us-ascii?Q?9UD9+uZvHoFxZcWZA8tnJ4vxp0ONwD9v7DnUC5wvx3AkZRmsmg/Mr9lhVN5D?=
 =?us-ascii?Q?1sq/5doHRFTCfGhy1tfQZMIoBdXsbewzbG6Y5vP0mLD0H+oznt4zw/YeR5t3?=
 =?us-ascii?Q?YE8YX757Js/26x8y7qROwV8ZBEpahtn4Z02psJKO7IZ/Utx7M444YSE92KF9?=
 =?us-ascii?Q?CWqk1EIga64YwnXlAFTinagt0EJSute9/9Za27I38Dxqc97cAJRU48b5HWxD?=
 =?us-ascii?Q?G7BTuibyiCT5ENEqTHJ8tGf5xDwbipXrZLha6vRaF4EGdAD6XXJ76PzLJJIS?=
 =?us-ascii?Q?9rbBqGqR9fN/GvHIisoQLbJP+m2ruVipcUm5IpjB7Tewph0KO8MP9Y+U3smS?=
 =?us-ascii?Q?gOyhZtFD2IFL4oJDjI1kFDYgtc3J/VFpphiZiAmwEY+BPQhMf8/zqo6bcKvi?=
 =?us-ascii?Q?67uwnWyByiQgvM25mTe0ZK9FeXzKnU6YepnprB7e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd53869-57c9-4c6c-e604-08ddb325b01d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:47:40.8842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycrY4IZFq+XAg0U0XIckuyvaIqbwiERO/c4b2T13sNHzY/ve+vVBjBH0c9OI8pfD6FkjsNBd+R5jbWNw8QEDSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8340

On Tue, Jun 24, 2025 at 11:21:52AM +0100, Sudeep Holla wrote:
>On Tue, Jun 24, 2025 at 01:23:10AM +0000, Peng Fan wrote:
>> > 
>> > Just to summarise my understanding here at very high level, the issue
>> > exists as the second notification by an agent to the Linux to suspend
>> > the system wakes up the system from suspend state. Since the
>> > interrupts are enabled before the thaw_processes() (which eventually
>> > continues the execution of scmi_suspend_work_func() to set the state
>> > to SCMI_SYSPOWER_IDLE, the scmi_userspace_notifier() is executed
>> > much before and ends up ignoring the request as the state is still not
>> > set to SCMI_SYSPOWER_IDLE. There is a race which your patch is
>> > addressing.
>> 
>> Thanks for writing this down, It is very correct and clear.
>> 
>
>While I am not against adding bus PM ops as it can be useful elsewhere,
>just wonder if this usecase is a good use of it. Does setting the state
>before the pm_suspend() call suffice. I still need to think through the
>possible race with that solution, but just asking you to check if that

There is race condition if setting the state to SCMI_SYSPOWER_IDLE before
pm_suspend.

The 2nd suspend notification could runs into pm_suspend again
before pm_suspend update system_state to SYSTEM_SUSPEND, if my understanding
is correct.

Per pm_suspend->enter_state,
"Make sure that no one else is trying to put the system into a sleep state",
not sure, but I think better not let pm_suspend to handle the race condition.

Since syspower only has one per system(linux), the other approach is to
use syscore, but need a global variable for state in scmi_power_control.c,
because syscore_suspend/resume does not have parameter.

we need to set state back to IDLE after linux wakeup and before kernel
thread scheduling. I only see two interfaces to achieve:
PM ops or syscore ops.

Thanks,
Peng


>helps.
>
>-- 
>Regards,
>Sudeep
