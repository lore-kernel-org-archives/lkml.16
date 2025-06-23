Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59444C7F;
	Mon, 23 Jun 2025 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750684787; cv=fail; b=WRSvfBP+IR8qGDJgwoN7GldYMkshl49DaNgdnedd4Kfs9iY8/4o1QdMdvHAkvso34Xbm/b1+9KyA6GOe9JlXzYng/goUJI10f0Rtt5zU41om3ZrL+B7zVI1XRdUcopUXoNJH5yix8Xt15FWZEYO0iwh4rjP/vc0+jYKlzpoKOgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750684787; c=relaxed/simple;
	bh=e3kd5E+aNoODx3tZdul4FgXbQhTAa6rckTtn8A2sRDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eOuGa1tGKtzWn7TAq95xuK1w4PV1hn75Ryx387venpL43gmdgwB1XR2Ujg8fPITiMLeyL1rxMi2XKhOnCD+jiYRZ6rG0cgqWTSJZLtxKvoe30MYcoLtjhGz9vq4esUcWRUmgPR/d8QRoLRyUbCX5Qebs7TDMojrUU//mcmmjxXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xm5kIM4F; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xm5kIM4F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxSMnVsbcwvM10U5VCgYxG5iDyBrUZ0d6u0BZFkgcJHy7tCE8jAxhxCbSTyRCtYAIYq03ZjVG0eCCLikOH70T3y7ohhwj/X9gjARoJeBD9PzfA4BcRtps8aiDIt7KLVlaMWTwwOapqSzDOrMX5edfXLN6E6Y0DWm6gaDNt50FxsNyOCOjVG8+VWGZkvyrlAPjRd1Q/01Zia7dFIt5xacNypZ5Lh3gm5GcK+SQpEulbbWXtuoK08lCtptYtLVV38MiO8NFwBjGMS4V7wtgI873ZeMQvbfbrk7it/mFxLGwDdO1jZSiia2VsOHGT+eX1DWSoXoPX5AgPT6QSs+hCt/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N3idTaNphnMlaxEjIl5CKoEY74MHWRk9Spj5X7S/PE=;
 b=sB0le/EmjaeonoX3yG9qLEMqPsyUR9LPYc0Q7M4sLykml8FUDQ3I5CytP4I7SzUxsW77wfJkPvx2Zv1zmEhpLp6RCnoF2nmKIW8Whctm5C9CZkaR0vC/2bPdzywfAW5R84GjBPaXyTHapJpRuhjwywo3lYc7Eplu88+eOu4+3rPxCn43ZCwDpPQxueTJG/YY4I62vQan8WBNqOLPQ3uh+wXEwDzkpYrNPLxyW4M/0eNJndF+oq5MFwWqSqtULN1EJ/gUfkcHB0C6blkNB5sFmfSg6KQ7Jyf01snjn+Byt9aZkHhNNaF3lhKTQjckBTiWj0fvtI+Cd6RNQq8l1/Yibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N3idTaNphnMlaxEjIl5CKoEY74MHWRk9Spj5X7S/PE=;
 b=xm5kIM4FjHcob5bUgaHcbPlA3KiOLcmit4MquNpF+p1VcdQ7VB3oQpz1EcjVgupoSyAV3L7zG3rIf/WYU8JLtFe5mKKnly46sJubtaXCO93Bt//T7yQucNjMAMRREv0RevF5Ao4jA9rR51i/M6PPDHO8XUI0Fj1I8uZiYtv0nR8ZxQpad/9ava292USWcp55tq8fGVuGmHi6Ju6d64uauvVb+UaDwvNfFa3kkYO4Ba4qKvgo8d9f1Fg9Bs/H733jsqxC6ii2IQeqHZODEcQhShimmFhL6mupWA5I1czhmF6pDs492jYGp1kq1eq1LSRr9LtXJ6v6cOiXHMymXw39+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7955.eurprd04.prod.outlook.com (2603:10a6:20b:249::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 13:19:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 13:19:38 +0000
Date: Mon, 23 Jun 2025 22:29:57 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250623142957.GA10415@nxa18884-linux>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623125750.kzwndmcf5yo3siao@lcpd911>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: e29ae0b2-c9df-4920-df8b-08ddb2589b11
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2KoN46U7bGZyYZ7aqJadNdwacGM6Qzdvsn4MTT7F3G49P1MLnveNm9Li/ZFm?=
 =?us-ascii?Q?/ID1f1gn4dUHvFbtUM4vehCkzDFaoLa80BINzlwfPbYwq3YTIRuNuSmMvaY2?=
 =?us-ascii?Q?E3pyFm8leXeMFbm7E0rbpPAxx7nZKMpfl+0NyqTWZKUJ2ttx8e63ERYTMkRo?=
 =?us-ascii?Q?SElE1DBqwjQY9YTeECMOoC7knyyF2KqO4O5Bf9ZuECUajN+mLoD8t1xa2hpN?=
 =?us-ascii?Q?xSXcjr+xSRgj4zh0mPS+uC3cCpR2SQbX/3PgpXui0QKwpz314GR60To8Ncl+?=
 =?us-ascii?Q?iV2P0H9wlPl4wnJf49ltgoUyCk5ljfjqAd9uSvtGCLCgCd84NPQ5xKUGFk+d?=
 =?us-ascii?Q?VcM0cnoPt0z1TjqcX4r3Cg6sypnVV70ASPGEmgAZgsX+w37KgjXd0vd7lvxJ?=
 =?us-ascii?Q?bxNxVOStVlTbgUUs6BlbXDB4e8G6ZJ/03yNv3Yfh4xRGiRYHEvwppfm/s6QT?=
 =?us-ascii?Q?vUe4fJdoaI4FnyB9Qi/nqB/15W+w7Ns5EF5ZlX0MsxYa8Ysc3tbimnE1gg4B?=
 =?us-ascii?Q?OBiMdmcHrtnt1MF8FY/wfcffajWpHYkUgx3C7aZrnFf5O64a9qqpUXdj2Czz?=
 =?us-ascii?Q?6P9+SvHNs2pzbXvX4Ft5lLZ8N3lZNJfKrRV7Uv1J2nP0yd5QBBYFzi/KAVvv?=
 =?us-ascii?Q?d4MkHI1O6aFEmJ1oJ4cS8AkANnAEUcAZ279JTvsF1AKcG7/MX3txlkBGYD1M?=
 =?us-ascii?Q?nHXNhpwmyrxakasLJJ85Kmu20yBOUcYRvKbyXaqu37QvK4iQ3jKZ3JT2CrDK?=
 =?us-ascii?Q?iw0AG325YppGwsxc6xB4SHHKkzO3SOdYk1mXr0O/ozQfOwxb4AEIzpWJXNU4?=
 =?us-ascii?Q?0xO9ouJ90GK6JGIoUnB9EKJx4gd0FCk+qvQoj9mwJO3n2K892vECvq4KGveS?=
 =?us-ascii?Q?yvpEPc9ch9ELMvaA3HUn5WwtZ5/srok+CmfXMQsPkljNhwZaKdkXfi47yXAu?=
 =?us-ascii?Q?FXEsY1svMojvqMRC+B4YRBPkhFbl4RnBHixTNaVtbF7WwfCsGuOTRWdy9ZcS?=
 =?us-ascii?Q?tqs/buWWV1/7QDDbk7ijAb9dTOTEv7pgrQjDUuc+jAfCAZhZ+dY7HdDijOCf?=
 =?us-ascii?Q?HTD6L2fOrlzkLo0PLlKwHOLQ01Gm48D7yXhSobwuBDobK6NvnfEY91ZWrOTV?=
 =?us-ascii?Q?ksbA+VTC/H0EEP39BKuIZ3A17bkXbtnti8yqDFT9t6TE0cXwVZPYmCZ0ttvf?=
 =?us-ascii?Q?i3romzTOtVkm8gWiVGZ6744e9v0r8MnD1rD8xqAWoPsGn0eTbL8C5px37dSg?=
 =?us-ascii?Q?AR83Jd2h6YV15HFV+vRAYPT8u/fIfviNR+9XdnmWgo2AJXGJXxM4Lt1M62AX?=
 =?us-ascii?Q?gpmNrr1saW+ld+6oN/hmYtmUw8RX95SgCWh+xvSt+78vc/gH+ETZoterwaPA?=
 =?us-ascii?Q?xa/+TfUZxeuEmGldhdPsTMNZw3yWddXZRV1cGH9zE3r0Niw+oUqi+jt7ZVXy?=
 =?us-ascii?Q?a1Dw9x+mAl8rkZu+Q1FR0yoBuEtBI8rQg/1ksRO6KwRT9MygldMEDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0v/mRGv86Jfft8myPzW4cjUObj3uEr6EuGbNXeLMS92OR3hGRZ4bcdOn42uk?=
 =?us-ascii?Q?+gelPribg5NAfOLg2PDcAJ/imKb6JaAhoFbb/m6gChsNeFfW2hjADuJH1S4w?=
 =?us-ascii?Q?wSepScBOwZgoLbvzD0fntVznP828FOlKA9ND+TdFhKo61O+KLBBYluwc7OEj?=
 =?us-ascii?Q?/M9EGDf+iwZyu8BMU7R3YianLYPCKYZl6avkl523XSspXj83rXv70o1ycHw3?=
 =?us-ascii?Q?3khzT8+Jl+vz48C9tphCFwk7UqFtTS8qhtW+r+Qgwtupx6kHHIxZia7JjwNM?=
 =?us-ascii?Q?yWvX/EOV3AXM2KNoEOT4fEkGKiaBao00Vf0dIQpsZx1GfiQbOeHtAo82kyWf?=
 =?us-ascii?Q?ud3UAnB69SPGVnayc6NKwByd8YjheiPV+FbuTnhhtbZXLcqBRxHNY86KfYq3?=
 =?us-ascii?Q?vqITyhkczl08wGelqTkMlJeQJPq/Oz/wzVZzVc2HehipQK7x2xzpG1c18haB?=
 =?us-ascii?Q?elqi72TRbZpH6zQgpoS9yDRQav8A1Ta7oX9et/BRrqEiz2X3soVU0b6MbBXy?=
 =?us-ascii?Q?y1hGDxSo9/FDJx+ufvA5ypvl3OSVYFp3knghh1FuDWl0c28wujpldPLc7Z7y?=
 =?us-ascii?Q?KeR25G2T1cEwRmBtwuBQnnOmt0i01owMCeL1VMoXacv1GotHEh111mHVleSi?=
 =?us-ascii?Q?FToV5P/RmFEznD/z1A6plY3wwfTD9DyIRegkNzpVtmC8cwAdfCRrUiR6muq6?=
 =?us-ascii?Q?XEGEoaMgYsDvQ3dXRpI/19V/CqNfwYER+1+b158PwxRVsMTz0xE2iYuSkdI0?=
 =?us-ascii?Q?JFG65Ij0AYIAFL0/i9MC+oQMwYEdlaRXL5EgsyIbidMqSEGpu4+sdv0pufHb?=
 =?us-ascii?Q?tPwCD5+tw02lCozIYEwHGDBa/AcxwcHnoijOzVSKA7Gx/lywEbAyXWB577fz?=
 =?us-ascii?Q?ZjoKM2Gd9NZSmR8zFqntugllfuMuueC00kc8IqJaBvDn8aPB4/aCSqSfhR0J?=
 =?us-ascii?Q?04/bckueXf/YxY2EuPSANcyvgmBgotUKbXIe/FU7JN31f+mtb6GRoxDJOL1t?=
 =?us-ascii?Q?LtILpPU39Lr6MLc6NJRsEPC6JMtPke/KNHhaVHqR8xJbr/NQWVRmixkQkxG2?=
 =?us-ascii?Q?e1rt3fLDZdROycZ4k43ogV+cBNVIwRixahH8AE0CRJW8Ct6ptX+TQ523Inq5?=
 =?us-ascii?Q?wQwVA20LwUJ3Jn8Sx5gqoQKWGPWPvmQCRDElSEdvEAGQz5RlDGYIHEMS6AQe?=
 =?us-ascii?Q?iHqagKk+s77TRf+6U7BLAYHuGJJg/WxSQPtj6uFn8FR21VSLVmYA8GR+nrQd?=
 =?us-ascii?Q?VTpn+v5POXaEGjEQxKIZ6BmNc1yGk2w+cAj7LFql26I3HhoAdfEuvYsdB2rE?=
 =?us-ascii?Q?DZHUY6Is+sz5UXIlu32p3nRmh5BgTvB5OqyYfLH57KOYGkabE1TU02RBmGiW?=
 =?us-ascii?Q?2XbwCQnfBHaJ5X7V/rihlVdABUWxPxGMeneo7dfgEvRQwe42Vq/wovmS/GCc?=
 =?us-ascii?Q?lhGeexNCnuqtsC/RRaJfjX10RqGJ0nr+tHRtG16Asq7ALzHUOOBJDRauYqwB?=
 =?us-ascii?Q?6j5EhbDSTxr3TLbF6Sc40F0daGMlCWVqU579emAzJ0ioo3H43bnBektPtYD2?=
 =?us-ascii?Q?xooDJl9LHQwdxhJgo8VMXvTKwfTMCKOW9VF+NMhL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29ae0b2-c9df-4920-df8b-08ddb2589b11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 13:19:38.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXXrA9P6bKI1rOfidpgY4Ga0mkKeWFgnccCyOzuRdl/n6ZjG81WD6Q+v+bZ7Fzz+PWF+fOhocJn+UTpbWaze5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7955

On Mon, Jun 23, 2025 at 06:27:50PM +0530, Dhruva Gole wrote:
>On Jun 20, 2025 at 11:37:14 +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> When two consecutive suspend message send to the Linux agent, Linux will
>> suspend and wake up. The exepcted behaviour should be suspend, wake up
>
>I am first trying to gather more context of the issue at hand here,
>Why and who is sending 2 consecutive suspend messages to Linux?

Currently in my test, it is SCMI platform send two suspend messages.
But in real cases, other high priviledge agents could send suspend messages
to linux agent.

One agent may wrongly send two suspend messages by user or the agent is hacked.

>
>Just quoting the cover letter:
>
>> When testing on i.MX95, two consecutive suspend message send to the Linux
>> agent, Linux will suspend(by the 1st suspend message) and wake up(by the
>> 2nd suspend message).
>> 
>> The ARM SCMI spec does not allow for filtering of which messages an agent
>> wants to get on the system power protocol. To i.MX95, as we use mailbox
>> to receive message, and the mailbox supports wake up, so linux will also
>> get a repeated suspend message. This will cause Linux to wake (and should
>> then go back into suspend).
>
>When you say mailbox supports wake up you mean the mailbox IP in your
>SoC actually gets some sort of wake interrupt that triggers a wakeup?

There is no dedicated wake interrupt  for mailbox.

The interrupt is the doorbell for processing notification, and this
interrupt could also wakeup Linux.

>Is this wakeup sent to the SM then to be processed further and trigger a
>linux wakeup?

No. As above, the mailbox received a doorbell notification interrupt.

>
><or> the mailbox directly wakes up linux, ie. triggers a resume flow but
>then you are saying it was an unintentional wakeup so you want to
>suspend linux again?

Right.

This just seems like the wakeup routing is
>incorrect and the system is going through a who resume and then suspend
>cycle without a good reason?
>
>Why and when in this flow is linux ending up with a duplicate suspend message is
>something I still don't follow.

Other agents could send duplicated suspend messages, right?
We could not expect other agents always behave correctly.

>
>Could you point us to any flow diagrams or software sequences that we
>could review?

Not sure what kind diagram or sequences you wanna. It is just one agent
wrongly send duplicate suspend message to Linux agent. And Linux agent
should suspend again.

One more example is
Linux suspended, other agent send reboot linux message, Linux should
wakeup and reboot itself.

Same to suspend
Linux suspended, other agent send suspend Linux message, Linux wakeup
and suspend again.

Regards,
Peng
>
>> and suspend again.
>> 
>> The ARM SCMI spec does not allow for filtering of which messages an agent
>> wants to get on the system power protocol. To i.MX95, as we use mailbox
>> to receive message, and the mailbox supports wake up, so linux will also
>> get a repeated suspend message. This will cause Linux to wake (and should
>> then go back into suspend).
>> 
>> In current driver, the state is set back to SCMI_SYSPOWER_IDLE after
>> pm_suspend finish, however the workqueue could be scheduled after
>> thaw_kernel_threads. So the 2nd suspend will return early with
>> "Transition already in progress...ignore", and leave Linux in wakeup
>> state.
>> 
>> So set SCMI_SYSPOWER_IDLE in device resume phase before workqueue
>> is scheduled to make the 2nd suspend message could suspend Linux again.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/firmware/arm_scmi/scmi_power_control.c | 24 +++++++++++++++++++-----
>>  1 file changed, 19 insertions(+), 5 deletions(-)
>> 
>[...]
>
>-- 
>Best regards,
>Dhruva Gole
>Texas Instruments Incorporated
