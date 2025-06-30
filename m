Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013035.outbound.protection.outlook.com [40.107.162.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0522F3E;
	Mon, 30 Jun 2025 00:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751244608; cv=fail; b=oAQTseZVLHvZzy3LNZvkUn/itAoNkLl3IJK3WuoyMBbtfutKc6+ByZdV3aMTOlJ7YyJrfFXIrMffPNIQ4+e5W7BITqI04SRnGeAzJ/kdWDxJNsgftSwqBKGnSmLrwcu2NFZ/HKh1f2j9U1qfTj9K1w5K8zLPLN38dSKgxxCzGRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751244608; c=relaxed/simple;
	bh=8bCWhN1bAjgBwm3bzO6RRxlgCh93zMhXaN13XE/zgl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hE9FFpZZ0YaiYI5i/EeMAk6XlQ/g5kvkZUwxejF2rGbxumUnxgY3LzMkbDjmKlY4JZA23B8IvfIaAVUjcQNiBMHzdAVdhtAj8MooDdTClDhOwuM977ugiVg+Z56ywDk+YbmR+3gyb6XKsZk4aFwmJtHNa8UnwFZNiBtTe+ZzCqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YZmmMm7q; arc=fail smtp.client-ip=40.107.162.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YZmmMm7q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgWWf1ggTD3JLBL2vXUCI+1YfxmlcFJ7Dnmj+aM/EJJiSDAtyoCVN4zLRnWVxjTX7lAAyqSIJ8eqsWbKZKpzQnUBIF3E3pFZTMLVwdzX7K28yElv1bM97PcH3LPJ52z0QiCbOh4siJeTn1xOa+l0SaFPEqEDLgDXegzIkCP/cNAyTNZoibjTl7m1P+DSq2qjGCzwSHdJWUdzWSIY8xtQp7rSDqu08UqFg8EbP0Ro/bmydOKV3eaYSxB7t31u4X2Gw6XqJD7iBhbvY1lPXfo1DzSPF2tvLcCfB3P2pUWadkLXfhQ+CzoFJooJqbb4hjWas3cz1eyZR95CHOKClACx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dztGTopPvGGcNNZGkMk2yGGlQoNGOYuB0GW38QBO0Y4=;
 b=C/hQdZj6TES7BPwjLliH7bQTX7rqP9HFS6bRd9hE/Eh75wMoAlif9QT73nsJo/2RtRxHUw/7WiN0PhRdxZ1ixMoqGYmt6U6pK1BV5Vc8sZUpbwUKzEcWJroYW5Buoa7RucihaBbKCA3iEYh5F5MzpQz5rftiTaxNuOghB44J3kVNN64+9CoBzoATYUE/WMKUpYC5s57BSayGoAV8mOiokPTVkrq3kEBUcd2deN2xB2vIPLmtRDaIFpEYt63/FP6nqQPgtv/bFEww72F29JiS7ziSLQEImzIBIOYWgkKSabBNvNnpGGbCqX6Dj/y1iYX/mdjpT/omiRuB0F7nrr5Vag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dztGTopPvGGcNNZGkMk2yGGlQoNGOYuB0GW38QBO0Y4=;
 b=YZmmMm7qyCmeESCVwUsXCUh33eqiq6CrI7L5SUJJXf6LoIrtPmjDBM+LE1qJoOtVwGzfMXoj6nfvewJddBKalzMLm2T+ffuMmkqUPbWrwRk5c0Lr1d5VmtCc9XStySSCABz5MBwXSZvY4Ix0qrFvDrRTD1KXMwteo05Y6iPq1flDANSX3fkqc35bzvIHyJqvl8O9tkrdk7FXYLnYo2sNSWPFb8kD8uPeV5Knw2PNepStdGuBu1Z2MwQHMpdzR1W3UvLt1nMnapYesTX6f+odTRI5LkEt7juG+NeOnTaxdwlHAH9DDWaRRET4yzQB683UF+ys7qYruz94UpLDeYrqtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8370.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 00:50:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 00:50:02 +0000
Date: Mon, 30 Jun 2025 10:00:36 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Philip Radford <Philip.Radford@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Sudeep Holla <Sudeep.Holla@arm.com>,
	Luke Parkin <Luke.Parkin@arm.com>
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Message-ID: <20250630020036.GA13878@nxa18884-linux>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250620084634.GB27519@nxa18884-linux>
 <PAWPR08MB9966E79130C52CA8460AC4B7897CA@PAWPR08MB9966.eurprd08.prod.outlook.com>
 <aF0xDdajKkoa4dXU@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0xDdajKkoa4dXU@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 0676720e-a2c7-4632-52a6-08ddb7700c14
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?20Zohv45Da9aVMKdeNOWMVSFGCUMPnPxAtLQr9hD+M+ZyNmsHIxWEjRh6bNt?=
 =?us-ascii?Q?VCJpR1L7JHHmfsApPDT4YP4xJ0Gno/mOZdMRe/8oYXV3XjIqPBcXz8YMfLPm?=
 =?us-ascii?Q?IRr3OgnTOJLt+OKkearStCFHfyrVH5Rm5tmr5xP2/4pGS82ITkQdMh81Y7C6?=
 =?us-ascii?Q?sZotCn1GfL1NgqK3cWpfmlCEmmDDUPajraBN397qBs8NC8UO2fdwMNw8k2KY?=
 =?us-ascii?Q?4uQRuj48hfSRls0RjAhM0i7fKP2olYwBTBMpJRNmM5bKk9+JxUWSLN+iKHL9?=
 =?us-ascii?Q?Hrae8kRagmpQxC4ERhnglNPG49lg9WZlftec9we08Svc8aI6yEwCy+jYGL6a?=
 =?us-ascii?Q?/a4K8IPA9d4UNBy8szTAerk4ykKGhxE9lfbIliFE7FcT/+uqbUfN5n5TdWu1?=
 =?us-ascii?Q?BHziHmGJQd28Rauy1UayMsdyvigHH3aiP1j6U/psw5NusrSFNcyPZljGt4A6?=
 =?us-ascii?Q?Agh/1WcktBw4plWEUz4RzSYfVemOo37uWWr7EEpvdHawPmMnugSX6/H/+Mpx?=
 =?us-ascii?Q?N15L+d+EYkWpVoRqrI9TyCz3vkNKG5SLwg2GXuxWaECUBk5dYG2iULhbvhcR?=
 =?us-ascii?Q?dhYgfjzCIEP72umwng9N6536eyUCfYurqHl39VE+mCS2p9pxF2QUk+5/CQQm?=
 =?us-ascii?Q?xu/fw+2UvThfjnE0p2tglJE6Ei5KLu7y2FfDrKTxkSqyZYdSocdnnMerI5Yz?=
 =?us-ascii?Q?07pAMjZ59gJ/gQFmL2vBx+B8sV7QQ63SunymxyzrnMi34UkZvuPRPmRi/fUS?=
 =?us-ascii?Q?LC0/sDroLq1/O9dA76+Wmvs3bSLJdPFmHpjBfQQAOGo8oTvwY+ZsMroWomSp?=
 =?us-ascii?Q?P5LZ74XdrGN499sFb12Vd16Qqej5g+/NKKkttNDR+4Ys9ufjHZ8oz3BKtunP?=
 =?us-ascii?Q?zpallUoKoeDZFCzVaKqMpdRfMCk9yCE3aNbzmjFHx4IlQJpf2m3GnPoLTdSm?=
 =?us-ascii?Q?eeffNTlM5kHWMrWUznRew/XOjEjltR5FpU12RKYolLIzqXxIjsUWSIiL103h?=
 =?us-ascii?Q?jNV68EkFxCzfgZxpMhYoIgmQAYrFJpk2LyXvFr1aBLb6N51/fDTuBhmGDLHT?=
 =?us-ascii?Q?3ATIchdHDT7cEuz9AH4ykoGAkMlE69pul5t80IF2O0jAY/kopRVPQoBFA8dE?=
 =?us-ascii?Q?BDj723GqFGvcpcZGqdmNr6hELiU75D5yeOwkNPJhuGciDxv9DXXLaSJ08Xk4?=
 =?us-ascii?Q?gMjdL/U0Pzx2wvPI8nka6XLXcn3MLieTV5qg0Noj8vNoZIsW62o73gi5Np0y?=
 =?us-ascii?Q?Vc+O1sAawEHk4HYXynkLKscbvne6EzfvTky2hweeE0ZzH5Zb2ai/8ftt8C8o?=
 =?us-ascii?Q?SnVYPYfHwHWYixkruslEHo0017M/l9N6cQJCdH4Tz553ekW5K/yV4/BnkTef?=
 =?us-ascii?Q?QLpzSf6YIKWb1a3PZgL7FSMouEDo5V5sJ+wtpdFH62xc3+ApOHxIFY1m65FX?=
 =?us-ascii?Q?0CRJ1P8rpOXwJshi/nVz/5krrsOSQQwiL6NCqCJ0LKV5IoA4MGNl6g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0CgJ3kdlMBWZR8ljNBfTqHi23QkGJTiLhg0uflpTI2zBQZXJ6sOHuh1KiRE2?=
 =?us-ascii?Q?ub2dZvqYjWMygJVXNV6AglGxk2PSyDzDDvOYxHTdzM0322bF2P41hORHxgFR?=
 =?us-ascii?Q?EBvxrQtxb8kdv5uJKbIf9HgoFpmvwAo4FZuJWugVwFqW1UGfckDOvgV8SElM?=
 =?us-ascii?Q?fab/xB0TvPFoyme+OF2SZBBnin/G+bp1kKlT3x8c43WIDV8XPYNYRIhATjmL?=
 =?us-ascii?Q?zv0wTkVPjaBfemOFQap/iRPGzo94/nGi55nfgj5DYN4HOCX3LZJUFJQGWCfe?=
 =?us-ascii?Q?AEK0HG47dNwwEyvI29wQg4t3icGkeliodWd/srjCnbKSr7zktfrRgcwsMTJa?=
 =?us-ascii?Q?z2ZzFzceANFZS6Og94CvZIIDQph3VYHqU9w2C2VfEBUG7nzSdo0UlYZQtXqD?=
 =?us-ascii?Q?GVyk1mD1neCy0HlFtxjggzzWsZmMshmIwmmkmhcZWpXpvdBf7T5lZDN80tHL?=
 =?us-ascii?Q?AKmd1cHXGmMJYUIOXWYBtkwvJ0X7pv9lRD8cKlDnOPgRhSKGisK8TDS4nq7U?=
 =?us-ascii?Q?JQibDTDMW5Ad8AHphLaXO3yc5uFolmV8apCyCxd/I96a9augAsW5YjpfDPtH?=
 =?us-ascii?Q?7bqF8Bklm2aMj+TVtTnl274Gb1vnRI/k+n0x7/oiH6ZbjFphq8vjzxBjHH+Y?=
 =?us-ascii?Q?w2zjvVteFkMCqMUEj+vAw6UE/pOWfzVCnZfXxoOYoqaFPj3piRnNTFU4BX+h?=
 =?us-ascii?Q?MLjk6gahBHoGSXg/P4oAsoGPcQuCNhEB3WNi/w33o/gTlRH+C2Z969vUU7xM?=
 =?us-ascii?Q?2cIhrziWFYYufbeKZKFlIUIFsJ/7QRELoPks4Dg39/+3mpY7IHxaBcZMbvP4?=
 =?us-ascii?Q?u2ZX0A6Z2cgkUtpy9QoCHfwdXwFUadLF/aeejoyOWthoVcdJvysXFFRnktmr?=
 =?us-ascii?Q?7h38cbchppGUbv+an4/GnUOktuG8a3EYvbVJqLV6lkGi/vMvPwnMn/O+cJPv?=
 =?us-ascii?Q?aLiqnpmSdU52AVeNsGc8T40fD/Opr9/q+5YnURnqVQtiW5WNIK0PxoirvcoV?=
 =?us-ascii?Q?7opF+b+8LJZh7HUHXWDpcOYd3CX0k8OPI8LB69f74RbdNB4/Eltl5vW8Ay48?=
 =?us-ascii?Q?GIUCLZMj+IcWysZClMJKsCgX/NclgWF37oz1fswfExO7f1W4SaJXS8Jad8OG?=
 =?us-ascii?Q?SS4QwZ7AwmDD3pIwx7HGdB3UFS/umdefMgBRMJYabvp2UUEHIx26ApOtiVHY?=
 =?us-ascii?Q?6cYifmr1T9JIleNbQm7jHFylHOaFp4jQyXWbwfjf8aSpklV79EBrz/Oqtv/U?=
 =?us-ascii?Q?I4fLlijspTJKpJ+gKp75BcERWl4DGtxkDFiHhea6se+IS5U8bbxhysfQyHh2?=
 =?us-ascii?Q?HddWR10BO6hUR3EUIthnxcj1ZXDfLYE09cKuPsTE6gfMqaUJMoQgk5H7hVat?=
 =?us-ascii?Q?yTGcYCflvt/661roYoL/Qr/A9mUOBGvHjkCq/fl523Fw2d5mIQPyI/ju5alc?=
 =?us-ascii?Q?MF1wx/sXmisZkd6Yd8HC4sB6gpdGO+fmAvFRba0a2SWuWton2h35UwFvZb55?=
 =?us-ascii?Q?1T7tF/SkareJH5OUxUtW9Ns/QOsVuB/xEapTMw8CdsjSBhQsjry8hiCU56d6?=
 =?us-ascii?Q?9+GvJBfi5K0ft8Hq5+xh0wsCs+dahiVbr3CoGg9n?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0676720e-a2c7-4632-52a6-08ddb7700c14
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 00:50:02.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5m6wJ4h4Sf0i3FVMDrixECyU+AnU6G/rlhI4lDOG9oKv3XG5ZJJuU5iGB9vL6CAOFgShl6rs07YTgGA7Ymjiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8370

Hi Cristian,

On Thu, Jun 26, 2025 at 12:37:49PM +0100, Cristian Marussi wrote:
>> > Just a general question, is this counter count in flight messages
>> > for a scmi instance or it is per transport? I ask because
>> > one scmi instance could have multiple mailboxes. If counting based
>> > on scmi instance, it may not be that accurate.
>> > 
>
>... so that is a good point ...
>...thanks Peng for pointing out this first of all...
>
>So, in general all of these counters are per-instance, we don't have any
>finer per-channel granularity....we could in the future split them out
>to be per-channel counters, but I wonder if it would be worth the
>effort: because, as I see it, errors reported by these counters are more
>of a alarm-bell than a triage tool, in the sense that I would expect
>that seeing a lot of errors of some kind on an instance should just act
>as a warning that something is NOT right somewhere, so that you can
>investigate further by enabling the already existent and more comprehensive
>SCMI trace events to fully inveestigate the problem...since SCMI full event
>traces DO also include the used-channel beside a lot of other info about
>the xfer transactions.
>
>Moreover, in the specific case of tracking inflight xfers, note that
>the counter added in this series tracks the pool of xfers allocated in
>tx_minfo(A2P) free-lists (i.e. commands...P2A msgs hardly can be lost),
>BUT this structure is per-instance (NOT per-channel), so even if you had
>say a few more dedicated per-protocol channels defined on a system,
>all the A2P transactions will pick their xfers from the same per-instance
>pool... (..because the max_inflights is meant to cap the maximum number
>of outstanding transactions that the server has to cope with...)

Thanks for explaining this. It is clear that there is no need finer
granularity. Just leave as it is.

Thanks,
Peng

>
>Thanks,
>Cristian
