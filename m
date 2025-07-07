Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012006.outbound.protection.outlook.com [52.101.71.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A4D12B94;
	Mon,  7 Jul 2025 03:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751859139; cv=fail; b=aMFsH1+zrqWgFVoB1LxFCqDiwkFOuXfrqLsvP7tr6iesotxcLjKrH0Y89YY88os4Lfk6yk5c85lcrQumvi79CkkRLoxagmi/a4bpSv+yx35Bw7qv0zL52EUmAZ74xpgTVTAT8wuYzl9x0m/EH6+/c1LgV3A1od7RxDO7KXEAyhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751859139; c=relaxed/simple;
	bh=eWnQ7snTFEOz+FWcKu8n4Q7cfo2BhzCqAzGWzOYCuBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lDKmtgwTZipbXYuxXV+3o5P4S50FhPBkBxPiDL8Fh4FPWlWz2wGkgopahFLSzYr/SiBbQaPvGSSHtjdu1vJUzWrEEIIgWjPY/fsiDk58CsjoxYv9MRQX2aO4Vz+dWRrGvYT/1WKbVqs0tSnseJu5Qsn7MpYm4LptwSX0RkbfNAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AVq/ugjq; arc=fail smtp.client-ip=52.101.71.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AVq/ugjq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNbq+2bCqk3Jou+SGt/DeTU7Di9sf30Ia/6vxFm0inS8/PrCd0oT71swGyprlwrV9mUTagSCRVBzykLHd07OexCkCq5fegtGCFE5GfITvl0wkfNwmzcZEbexbpFJYDMv0hcOyevBdQKrV+ha5CkLz3zphlnxY9crwOb8MS6b9FKzYMwHDOa9NBBlL0VWOAwEso8wdIbhX6mHCtbA5Gjl1vb1mSXy1H5tHHlpPZmp6iMhzlz19+EAfQCmMA05ThJdqIqrikwoVvG0LdZPVMS8rcmltTh0et6Jow8Uht24TNOefIwa4NiGghoBJl2Fcfsz84XlZPO8SXWvABX98udM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efHZOJ/vJvsgwTxnrVX0HwJLNbMtQrYZGx3bCC/tYIA=;
 b=t/DnkQiZekWlfSWMcq8T8GOtL+4fXwLLPZMsLGGBrwg3r1DFcVVJah+HL/r0qlCK7MbgNNdKzumZY7lQVpWJ33WI1N4a1SDcB0SlYmUmbYlWbOPyG4m/7NiPQvsjn8DDQT+UAQBtey46/Bgc1VBIcfM3JO589lsfn27k6e5lh19hhTZ4FT1DYbepirfqCu/1Ek8gz3asLA/dg2FqnnVCbSRVysg0WKumeIT1Guspwrmj785rrjmoizr53T22YO5M7e56SoTE8uPFUXvCtXvTq7g9AKAiXL8OEoVHG4zHGHuhWkgYfykT5U3KafoK8R64858jXfyadqQ7dG+Ikc5UEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efHZOJ/vJvsgwTxnrVX0HwJLNbMtQrYZGx3bCC/tYIA=;
 b=AVq/ugjqktbWDJivm9n/uZ6Ua4mAuN2W0bAgHR3VczjTEFSk5os4j+f121/+O96/qbeoEynWguewhCx6+wIC9Sou9q98hfNvmpVFbG1sbdrryPaNtfttb8kxniet2yKgPiGmtZJDwFljXQkxR0s2kpffKIpbT9XAjY5Eq7BOilhpcBi+bODme2AyAWTBk3KFuAo0yuGx89UARZlrlZkI16pE4cFZzF+Aof+cV56qt9Zj0GRK79VyootPp5AB1FAhe91yuS5N2cy9VZnZZPX15hwDLKNL8CVbjkPppGPL5h8bgrLPXCS5xSYoWzvFrDHNTyi/V1DZkLbgpDQDNVSkiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 03:32:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 03:32:12 +0000
Date: Mon, 7 Jul 2025 12:42:19 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org,
	andre.draszik@linaro.org, willmcvicker@google.com,
	cristian.marussi@arm.com, sudeep.holla@arm.com,
	kernel-team@android.com, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: stop the release and reacquire of the chan lock
Message-ID: <20250707044219.GA11488@nxa18884-linux>
References: <20250606-mbox-drop-reacquire-lock-v1-1-d36d1a13d83f@linaro.org>
 <CABb+yY2HYgS25xouVJpq+Aia1M=b1_ocbHiyrnVqZcf0c0xcGg@mail.gmail.com>
 <fac9a5fb-7a39-4c12-9dca-d2338b6dad8c@linaro.org>
 <CABb+yY1pn3+dFd=e80PaqEP2saF84f3buPt=ZYnTjDbSv3RN6g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY1pn3+dFd=e80PaqEP2saF84f3buPt=ZYnTjDbSv3RN6g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBAPR04MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 399bd110-8bea-4494-6267-08ddbd06dcaa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?yGuBhp/kN5IA+wDk/ytaKVEDeSdZ6v87gSrJIcfz4BfKpl1b94ILvxYc/5/G?=
 =?us-ascii?Q?5QcFC6af+XvN+BCL0/uVW/XRpEXHR1G3PwTDEapafnrYsNPio4vpv5ichafA?=
 =?us-ascii?Q?nx464Bpxee1FrgHUTuqMWRbElkP8WAfJIxmXyLaj2Bh77HHp2oZvz57EDnhj?=
 =?us-ascii?Q?+hhIedSbv5j0iWyO2SOBGbwtlj7bnVz7aqNqr++BuDBb6PMrpjqtbOqobG8t?=
 =?us-ascii?Q?5ne1HyhC2j6w1c/yXjGMdZZ7JLr9IsZqjv+O8v/tYGtMyTTge6H2X9JjvXjD?=
 =?us-ascii?Q?zAgILOVwX+A6ITHD5sHDm2mS3CBMsHBmYyqoBYycvm/4faOYUJTdODjTcRx5?=
 =?us-ascii?Q?aBu3XH28OL/Fbz1coIUADZl5jCxZOJFi0K7kKxbIlyNYIQThY4/Q8cAN89Ch?=
 =?us-ascii?Q?PQmpMjv0bYT5lytP1zb4TGvbgKnkOIrFr+bR2SoV19ND+QjS89p9FziaUMd8?=
 =?us-ascii?Q?xjMiBzlYeoqjTNrEQGgegkYW6xlH0TiiP3tXO67xVYWsbiiJXIqe4BVLpjdM?=
 =?us-ascii?Q?RxFZMzfwPUJxWnWhsZ7tVd5VXtx/N1djsK6edHR4N4oeFIHQmpM+MiM7o8Ly?=
 =?us-ascii?Q?r2CdbAF/A+nmg4KJqnsUsxqsSRhUpjuIjJXh64iVY0x32Wv0+CGccD1Fp1Px?=
 =?us-ascii?Q?myuju7tC2AdE6MQe7ZgRokal3i972Rd9GS0fzaQnVqAVqpagb9MQOZsdvHa2?=
 =?us-ascii?Q?xmBYetlU1VSm7Ar7qOvCmBn0ifIbmLoks2bBnCM+kgerbFL/pqz75mngec4Z?=
 =?us-ascii?Q?7Ut6eppfLXUgBi0NQSc0mfZ1U0R7O3UArUxJUQmRaJ4ZJ1MUBkCe9m9OiCGG?=
 =?us-ascii?Q?ADIdcledBCrHYFN1hYyZO6lwmYS6CtpGxleOaCayjw9o1/VTEdbIG4BBVfCM?=
 =?us-ascii?Q?4hG7AzT2dHXmrMp5AKjPknYgIfrPZyKispBrtdmfSRsaAvsLE2hoINXQ6VKk?=
 =?us-ascii?Q?Jw/qN/m1dcbiU3oVgT5vEXKSM1N/S/oECFBNQFPUh8u1zEbpBqmc4yCuB90x?=
 =?us-ascii?Q?Z1B6u9wBhZkmbzEx6LMeNozUbRSPs0oyacBu6Uiuqrj0+4ejqXO2q42Xw3WG?=
 =?us-ascii?Q?wmIvlFAgLGuNcUbqRM9cciThILlafP5Im9aLa8XKbdF4fKFJFFv2opR+LYFS?=
 =?us-ascii?Q?CI2TbxuoxVcxqG5ECDw8Ie7WrQGPECbD4tWrsnFS5C3beqb6pKjh7Wqxfdb/?=
 =?us-ascii?Q?zxbU+ilqlbrTuV2pg6X7Y0fPS8QLEbMVB2qLgOyPj5W/znk24Ic6i+rbTsBa?=
 =?us-ascii?Q?vwuWue9XFLL6hKL+Wb047NcLvD+yru6ur6EuZVapcmQS90qYKVTneVFOM1oa?=
 =?us-ascii?Q?qu3TRasPjVssfYRpIyHZjbf8jEpxaLtTA3kPQcnLFgQniHLeGL116uCQ3IfW?=
 =?us-ascii?Q?D7PqDxtPmV66K1mzODsLGEYa+66nvNC2C2EwQa6WNxXu1IZFxcL7xK0/+SrA?=
 =?us-ascii?Q?DrMtY2R8UL6TSISMjqTd0YGpTUrHKhPytodCML9bz/7hs0v4nnpqkQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BF3Mw4s5rJHKS9cbcZ4Anl7AVwz4vT1o8zgLG7KH872QUcCJK6JL4KruccPZ?=
 =?us-ascii?Q?jnnz+34jsI+WsUn/3oZ2IcI5XDOfytJbqcMzaz4GI7rAI3LZvyORCth15nK+?=
 =?us-ascii?Q?QRXNv7x3v9CM1z61LyK7+AjoDgfZQgYoCz1Xvgh2qM4RoGbxEMLDw2BGQDH6?=
 =?us-ascii?Q?3lG/5R1qHu3L+qIu2zGOb4WxoydKQbc84vYSRYJyK3ljMJelQ6uvOB0Uryu1?=
 =?us-ascii?Q?N4j0/77e2Vlg19atFS31IqtqAT5zwtSaEN6FsVJpRfB43zxk/WSJu0NtMhJP?=
 =?us-ascii?Q?LWlCOgUKPVxXLEzTlnnmLrnQq3kavS8HlHoLrQiauuqI+uKauVP/DAS8jq8a?=
 =?us-ascii?Q?LP5rLyct+xoMQptXz/hV00OwI+GQsRQHy+FEXLSgR8lYNVSu5zXzQ/VrZEJ/?=
 =?us-ascii?Q?FgwwS9/XBZ0+mZgdkrO+HWfZ5wgcQvXOXkP/jVNGavEYHnpm30ju/tMSV+OO?=
 =?us-ascii?Q?NnDf6pDrvqWzgxsi3S9jqybjDBXIDP37iwjSkABIDtI0RNzMiGlH9iRxPJZ0?=
 =?us-ascii?Q?pe4neAFZt3Ele0Y52iAe0eTH+S+glr8Ht+heUFcN18IGHScavG86Uk1rq/mF?=
 =?us-ascii?Q?YPLvSY633oMpdXM3Li2efWJi6YQ5ez8JQs8+TkJZ/OD6Yk/2JDr7gj9h782W?=
 =?us-ascii?Q?hz4eno0PQNPhI7dJOOIho+y4vx7TGklHjLKSnh767QHDEww5B2RCMzUVjsB5?=
 =?us-ascii?Q?xrtNM5cL7piK9g2pVqycdrOasLBgUt/ITkOj32BdLGs+GyHY4ayHNxwDNQ+t?=
 =?us-ascii?Q?CBLUoLPyyc6VcG0HBb+4e/FkNU5p7nKU2kd8sGUIBFOsxK3JSL3nkvTDH65w?=
 =?us-ascii?Q?fFgJJXbXtQh3xlqtn8r0Gcran+9D6hSUTmfpFsibvWkGR8O1dZGvnpljg3+A?=
 =?us-ascii?Q?baEgwwdrXcgn4fVa3Uw++tsUBD8KmJ+lKYWLda6CPc+hnn3r0+W7mcCGjN3R?=
 =?us-ascii?Q?98p8sjNp2n220P3wajZZNBUiEYMlygAyvHJg92xPlW2hdDbotwXNLTpkxm9E?=
 =?us-ascii?Q?Sbh+QRnt8VWzIbtPSGNo04BmHB91fwrpzWBTT8ch5kOzQbDuieNqlh4WIN2y?=
 =?us-ascii?Q?hlvdHx7Vki7LYoojWsWdvdWoV/utwpLxBDpvosOH5Lvl+OnCvi7jsSy6YPsm?=
 =?us-ascii?Q?MlSnnksRJX7pGiqM4PhgcbXltlhkxnj69XOysrFU9F3VEpcFxpp59/Hnk8Uv?=
 =?us-ascii?Q?oMzqwm6nmG5I/RFa5pEyRPX6E3CDLFrBn+tN/Y438aRakSZG3Drs+ok0eEix?=
 =?us-ascii?Q?6JVtAbOYFLKyAFr2SNWXDwFWcA8YPSb4nvYen+2pXDEHRLBRMR89ahNcK+rA?=
 =?us-ascii?Q?cZyJj91CuCRIpUqFSHnLSar5ocSra1TexYQLyNhKWS0/WKGVFUt7UEOT7O/4?=
 =?us-ascii?Q?FPDJjo3OsRXoysGr2EyFe4vgui7Gs8kZ73eBMBUx9GAt6oiEk+mCwE3C+3o6?=
 =?us-ascii?Q?GWVKE2lX8w25fMAsHj9Qm6j8/a6Yv8BbkH9CxhMmTkg6YRvRvJ9kMA3uVc19?=
 =?us-ascii?Q?unITE4p2Zr+rXNIgqtaH7vzVQfhGVQ3+YYK8uVbS8JlBZhnCahMsRlQ9s1z/?=
 =?us-ascii?Q?qnIha0sqP/OQXffFfdFAI3e6rSOdYM46yaXbGvhz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399bd110-8bea-4494-6267-08ddbd06dcaa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:32:12.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6iZwR8acO/NpQGnAum3/JQ0x+O+Znkzx30AmBF02e61AHf+CTHEP3TlUlJCTGmFtxNKyX3TDZlz8pPm9atFPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256

Hi Jassi, Tudor
On Sat, Jul 05, 2025 at 09:19:08PM -0500, Jassi Brar wrote:
>On Fri, Jul 4, 2025 at 7:30???AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Hi, Jassi,
>>
>> Sorry for the delay, I was out for a while.
>>
>> On 6/23/25 12:41 AM, Jassi Brar wrote:
>> > On Fri, Jun 6, 2025 at 8:41???AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>> >>
>> >> There are two cases where the chan lock is released and reacquired
>> >> were it shouldn't really be:
>> >>
>> >> 1/ released at the end of add_to_rbuf() and reacquired at the beginning
>> >> of msg_submit(). After the lock is released at the end of add_to_rbuf(),
>> >> if the mailbox core is under heavy load, the mailbox software queue may
>> >> fill up without any of the threads getting the chance to drain the
>> >> software queue.
>> >>         T#0 acquires chan lock, fills rbuf, releases the lock, then
>> >>         T#1 acquires chan lock, fills rbuf, releases the lock, then
>> >>         ...
>> >>         T#MBOX_TX_QUEUE_LEN returns -ENOBUFS;
>> >> We shall drain the software queue as fast as we can, while still holding
>> >> the channel lock.
>> >>
>> > I don't see any issue to fix to begin with.
>> > T#0 does drain the queue by moving on to submit the message after
>> > adding it to the rbuf.
>>
>> The problem is that the code releases the chan->lock after adding the
>> message to rbuf and then reacquires it on submit. A thread can be
>> preempted after add_to_rbuf(), without getting the chance to get to
>> msg_submit().
>>
>> Let's assume that
>> T#0 adds to rbuf and gets preempted by T#1
>> T#1 adds to rbuf and gets preempted by T#2
>> ...
>> T#n-1 adds to rbuf and gets preempted by T#n
>>
>> We fill the mailbox software queue without any thread getting to
>> msg_submit().

I try to understand this case. Is this patch from code inspection or
the issue could be reproduced on real platform?

If the client continuously issues 'mbox_send_message',
there might be possibility that 'msg_submit' does not have chance to get
get chan lock.

>>
>I get that but I still don't see a problem.
>When the queue gets filled the next submission will be rejected and
>have to wait until the mailbox gets some work done. Which is the
>expected behaviour. And will be the same even if we don't release the
>lock between add_to_rbug and and msg_submit and there are enough
>mbox_send_message calls coming in faster than the transmission bus.

Not sure I get it clear, do you mean this?
When the mailbox queue is full, any new message submission will be rejected.
The sender must wait until space becomes available as messages are processed.

This is the expected behavior and ensures proper flow control. Even if we
avoid releasing the lock between add_to_rbuf() and msg_submit(), the outcome
remains the same: if mbox_send_message() calls arrive faster than the bus can
transmit, the queue will eventually fill up and block further submissions.

Thanks,
Peng

>Thanks.
>
