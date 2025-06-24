Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356AB23774;
	Tue, 24 Jun 2025 03:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750734729; cv=fail; b=OnZwEfea7WZ0y0UmOSnkhjKH2XQ7YmHupL1w7EBd/y9fT66HXIHoss79EnQWGWzfZ/+aM7w05LN0SKfne6R22FLVLgyXIHYl0VnLAnlG96adPYIkvxvX9go7+LBcDxfg+lR8vr+CNMBosBA6bq/Glq96NOSBvGfOnGzIhnhfM+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750734729; c=relaxed/simple;
	bh=nq+swU0ey/IPLcxKJ0YNgcnOxs2y+plp20/cN3ZBP7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gZI2ejRyW39Ve80R7HVREaISII7OVPJqF/pCLrYICdF4qqxTMDwX7qCbkEVNw6YsDNOc2HLdMyZYJKiDivjYAeTU5VJ3Wut7gL5J/25orLbo//Nxlw6xFi7vCPOABORY2lrWmcmoWqqaHmqRYW7ND/D3Q7SFTr3P3xuVdMXwmqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FT5ZwTBF; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FT5ZwTBF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/D+ZRjt810tkQmTO8S+5JpnVyb4zHMQB/evBZ9SPqWS5FI9UlNfYGe9rUl4AVnV0QTP17oiRHvt2zkhEz5JzYmZnwngSq7mgMQ811tzG80BO1y9cW/jXM59Az2PUQTsvK69g6ZDrAVuxguQpQHFN/T/Sdja8siM0oTVIfZOj6OTBLXlvp0JaMUTcsHltBesvzapomWHgticnNFTtF+FVXEKeuqMfO4ETDpiqb3WpymD3yF3VCKPAhzZyfYsvG3/WQASJx9zhfaYaN057RQh0Pn160q+ay6WqTV/GXe499P4y9B5eWX8cymzQRlk33AHvW2JDgMIj3tZ6LP6//cbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYgGZ/yoqpzj1zkj1Q7JqkT9MdZNi8z//4Dchdin0Nw=;
 b=nykQnstEMbWDn5MWNofEz9P7omkE+0wZecvD7z2/uzxOW8ZMLnHxEl5VT4kAGuJDW/ncGvgw/kyXtu5PS1f9xXolmFnqMuGBz53wU5+Xa26lmsuSn+9Kaicg76zzobIZDuHxvZtuTRkfbjqfAvz7+IQ83eU+kRpg81fsLbdcQo4AEeigKk28xcGiRaGwH+nG2mrOu3xyuQ74X8aFX5XoSQlVa630bFX4ILGmZK2hxCu7LX3eWrgfJaiTl4BMM/0KXxCwwAyC8NJERP85Wnt2jL+fWE6YexAnI3YHTsFCeyP2rDOxPgzLkh1/zNuds0Ny633ZvS0SXe5wKXv4WYosdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYgGZ/yoqpzj1zkj1Q7JqkT9MdZNi8z//4Dchdin0Nw=;
 b=FT5ZwTBFRJpNpfuJrvDpmlYKG1l//89k2DNXbuWjRI+lBMahNZau6q+OD16hfJ10Ax08pOBGLi7MWbZKW8yf2gdpHOMDWM0ZOUm0WlkqJ8bHCJMbiAUh4KNd2nAHICoc9DyqHT9uH1VTjDkkMTAcoyfM0uJu4pi4HrFL/O5Ta/F2joDBfFikoc0XBo9KIVYNBylaGnbdrqMidn2AyMmIP42iixCL6DJtfU1/ych+C3fazGC+M3bhfRwxhyUE3KypDQ/xNHMTtY7nCz/hILeW2kwF+3NaaYvEzJ5M5igg0sXaRYrMQJ4oMvyBI/iz7vh7XkoJF9geD7Xz0CgMHJVlJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7467.eurprd04.prod.outlook.com (2603:10a6:102:80::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 03:12:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 03:12:03 +0000
Date: Tue, 24 Jun 2025 12:22:32 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Philip Radford <Philip.Radford@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Sudeep Holla <Sudeep.Holla@arm.com>,
	Cristian Marussi <Cristian.Marussi@arm.com>,
	Luke Parkin <Luke.Parkin@arm.com>
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Message-ID: <20250624042232.GD10415@nxa18884-linux>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250620084634.GB27519@nxa18884-linux>
 <PAWPR08MB9966E79130C52CA8460AC4B7897CA@PAWPR08MB9966.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAWPR08MB9966E79130C52CA8460AC4B7897CA@PAWPR08MB9966.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: f213cd1b-92ef-4a45-34c3-08ddb2cce410
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zgh8feH6OXf6E/6OD1dp45BHQqh4WIU7EONmtw6KTMW1o+bUq505UE6ch0U3?=
 =?us-ascii?Q?rHo148mPKZCJaB+2laHHfwRFOkBOIn6XxiPg3HL1iwLhCpTTKDh8l/8cq9zc?=
 =?us-ascii?Q?5+3RxrqcwbDY3/d0eM/ovb+HR4/E3e23HW1JRFkyh0R1ljlaGqtS24mjrcXB?=
 =?us-ascii?Q?zCE8TA3tI8pR8KO/q97qID+a2jB3qZc5Ggr9xYcS4tD/e1zWQTazByCGyqyc?=
 =?us-ascii?Q?22FHfU1ctNjO2mYtb/8aQS8NWf8cPErq7RiGwjGkTCi6c5YXvBR9afnfCyFj?=
 =?us-ascii?Q?SLFbw0Sy2rq9LlXv4PXc4vwRqTENBYdcNxlQwi96gjJb0GmlTYiL6lwhZ+H2?=
 =?us-ascii?Q?BbiKzqI9mSCaxxGyRrX2Kaht+SnxhC/QM3P4YeUn1P777f7ovOyS0rg0sUjy?=
 =?us-ascii?Q?c8MQ6+DPo7+8XGlLP7D1n7KQgRYFcLlcPqkN3QHseadClD/IkkgNsHFyhqyV?=
 =?us-ascii?Q?HQJ90QDcER75FP0/fFoQnmgyYnuRvv1uVOPJNgMlsnRJ2Qgp7KKoLQsi7XhR?=
 =?us-ascii?Q?PI33lfGqZAUJtiBu6r1e1rgvZqZopi6FyEuQNooPxEZWwsYPwCoj1StwFJqB?=
 =?us-ascii?Q?2PfCxvn5oikjZoSudFdNHyMZgVw9W3YnE3VKCqjiHuGz2zGb8+w8L/cDX7RK?=
 =?us-ascii?Q?kg+Ukzv0f81rn14xddU87Ss3SFAiDcXEVv7udxnJfliauoxrYVs0CwEIlEoU?=
 =?us-ascii?Q?gJeyYFc9+NPx3mjmhmwuhT9kbYx+doSECeFw1x6qrgCBP03+WaLUAOtlsCWG?=
 =?us-ascii?Q?bYZXL8Eup66P0JkeyV/uE0aWa8NhqSQ5l6BNgioiyaJfYqrzQOezNAFLfag+?=
 =?us-ascii?Q?YFY9bWN5oM3oRAvKNIptJX0vdRiBuvL+vFw5QyTCn8wCgA+mmQHw5BTGJNZY?=
 =?us-ascii?Q?pKQbONROa33RDzCkJvIja/T/L9cK0NN24K7GVvADhfYrlNsXnWgbicc4nbid?=
 =?us-ascii?Q?jViysBkvt6y15n22jk2BcARhojrxmvsEHdbAjMB41dNytDhxx9vZSR+WGx25?=
 =?us-ascii?Q?ykMmSJgN9SxlrFg4sTkfFjb3ZaKRmgef2hXccdlwDMfsSo5f/olN4RqCnSA4?=
 =?us-ascii?Q?nJarO0jvq0LVHWJ052wbZX9AifKxSsFsyvoQxgYm1R9VvLV6YYA15LKsa099?=
 =?us-ascii?Q?49Qe/B8KZprNyeODmu2HSB6cvy8p2RSz3hVEfSMZmkH1/hNaVWA/L6wfEwkB?=
 =?us-ascii?Q?R/pGBHP3Pi9GRdL4r4/Lv429DXRTo6+XUAcngbiRPlJqyrrvCpb0VevDDNhc?=
 =?us-ascii?Q?oVqGpnjeKrViIoPTVPDl7YStiEQ7rygP2Q0Ycd333oW5d8HngtT3PCsMWl41?=
 =?us-ascii?Q?OZoHHxkTZ0/0W0HvNK5Dpo1BhB06rxWaM8WwvuCjFaVf0r+i81I1H/+1jrOz?=
 =?us-ascii?Q?KprRPXMHH7i8DF2VOKxyT5BV8KgWqCHCSf7lYy9IxvaolP7+fyi7TxweLcje?=
 =?us-ascii?Q?chN3FdCHtQVimk52WnQPB2yDb1Zdc6x1lvi8UmnX/2ijegETQ/c+VA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qPkd5k4pVHIFzbefkxSakv1PQSp6XotRSNpXORK+h5n6V8RhnXbIePuw8ciq?=
 =?us-ascii?Q?sSQaaXuiLiMEGrKsd912QWlzWLH6AX7zxUa1OqbZsh/Pl/HvjFTIkGtIMJTQ?=
 =?us-ascii?Q?Hgt0TlWdwcC2QyP1H1MmQogNWce1ZQRww7pamGhIi+nIZ8OCkaN9TqfSabpc?=
 =?us-ascii?Q?P+6E1oZEV+z7+S8G7oCX1NGckFjHO4/TQpwke/yCkPW5DSzub7vShNVqw88P?=
 =?us-ascii?Q?4MExHX6IOcjovyKqregXq6mUe9nYZmKMeVUuQrjRSWgbfAFAGAE5ui8L+WlD?=
 =?us-ascii?Q?CHSWiRAjVUIqm+FoHY4iN8jLobw+2/eBYjHGWZTIU8f0CZ9c8f8MfdUIS6BK?=
 =?us-ascii?Q?wGo8yTwBSwie1XbL8Y2PEKJm3QwRSflZxG8h0MEaBUrFmnCIVBPNbqd2LwSU?=
 =?us-ascii?Q?uKWr36Z5esIEdL8OZYGhNWfxcPdP1mcR/iyM0GjgBuiSOSeHVjDUc7c+Xgbl?=
 =?us-ascii?Q?w5OboPoVWiszztUv/t1bhLWGzBVAMD7VEuK8MTQKpkfn7HsaBwMeJVkFpD3j?=
 =?us-ascii?Q?EJq1w1x/966fXrTWuygYAABsUrXb0HapzAW5ypw3vnxynmBu9tp1R1vLX312?=
 =?us-ascii?Q?xNVV+YdUvNTDLQpXOGdlLnQlVcvg0VY/s+M280c63tagS9SKE+n2RVD+jZzY?=
 =?us-ascii?Q?QUJDE2Ci281yPQZgFyST3fO98jwk0RXtpcZ7Bs0zdf873YlkV2uxcnKYu+30?=
 =?us-ascii?Q?pQkVHQo92NwokZD6pS1bemWrPNu2qlAA+5ncntET/3YIx0TYXJSvxDwEhOUc?=
 =?us-ascii?Q?Ip7J48ujPJymTjxCAd1SKojyekfS0Aidzg8m6oRuLdJTKBQZR9WhccIxIzIu?=
 =?us-ascii?Q?q0owX0u9w3pkei93NINjBIIwohYQMtDX0XkOhjLdkC41cNfWPt3X07fJvj4U?=
 =?us-ascii?Q?hO597LKDPT9RJjxLALGxIE2p7HTk9MC+kwtwAU2eLxzvvTrP9VV16HfYuzVD?=
 =?us-ascii?Q?5M3fEjNB0J7Dx1kHAlAr4FxSI23IzCsNWhYivM544l9Xw9Zntf5ndxF5y2ME?=
 =?us-ascii?Q?o/OJVEPN/zg8fmuwZNjxjmjmS0+bBpix/KFgo8W9+PteR9QJQjVC/SHE7ejH?=
 =?us-ascii?Q?YnfzFS2bh31/d00oQh01kPtbFI2YYp82CQ1VuW/lFVi6lu1hX+4pgrfvOuy3?=
 =?us-ascii?Q?9keLqMhS35a3YJMEohbbn/deoa1kFdTkf3xi346i6+AuI9juX0dzT4ZVoXkt?=
 =?us-ascii?Q?Bio9v2HWrU4siKol0yqhk4oAC/8kfConL8kfoxcmGjdwZSdBsiVqZwpu0Go5?=
 =?us-ascii?Q?exNzazoGiTxA04Ge1p+HqXSp5w+yTIEwILoJXnOlqdfqYAJ4TH4/nVN2gMxg?=
 =?us-ascii?Q?JJveETPZvMOGTEIOm1axmN85zZ9Kn27lT3+y7RaV3sjbewYmM6sYplIsjIzB?=
 =?us-ascii?Q?5NKQHiZ9XQll3xCdYRbP55qFVrET3ZfqH2tLIAHpRpCdarCIqrmom8TwA9e3?=
 =?us-ascii?Q?xYAQS84rqeJBMtMyoWGjcoPYekKjx09xW1kHYcypT7QtiDtqw83dU5SpULES?=
 =?us-ascii?Q?1evrtyJSLGY1Z6HYO6iXyZQqNrhqcTmDLOileXKu19U2eweQowTKUG6breEZ?=
 =?us-ascii?Q?QEIOCizD7k+KqcQQyboT3qvwNiqQoajM67jt/Sa7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f213cd1b-92ef-4a45-34c3-08ddb2cce410
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 03:12:03.3187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQF/8LznzbqLvRBybNzxlkLIRdUQM8vOZyR5+KqVv+26MNKgFtsp/F7Vzpav5j6oZd7OWhLdh6L4V8Yc8cfWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7467

On Fri, Jun 20, 2025 at 09:27:52AM +0000, Philip Radford wrote:
>
>
>> -----Original Message-----
>> From: Peng Fan <peng.fan@oss.nxp.com>
>> Sent: Friday, June 20, 2025 9:47 AM
>> To: Philip Radford <Philip.Radford@arm.com>
>
>Hi,
>Thanks for the review.
>
>> Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; arm-
>> scmi@vger.kernel.org; Sudeep Holla <Sudeep.Holla@arm.com>; Cristian
>> Marussi <Cristian.Marussi@arm.com>; Luke Parkin <Luke.Parkin@arm.com>
>> Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and
>> trace
>> 
>> On Thu, Jun 19, 2025 at 12:20:00PM +0000, Philip Radford wrote:
>> >Hi all,
>> >
>> >This series adds a new counter to the Arm SCMI firmware driver to track
>> >the number of in-flight message transfers during debug and trace. This
>> >will be useful for examining behaviour under a large load with regards
>> >to concurrent messages being sent and received. As the counter only gives
>> >a live value, printing the value in trace allows logging of the in-flight
>> >xfers.
>> 
>> Just a general question, is this counter count in flight messages
>> for a scmi instance or it is per transport? I ask because
>> one scmi instance could have multiple mailboxes. If counting based
>> on scmi instance, it may not be that accurate.
>> 
>> Thanks,
>> Peng
>> 
>
>Yes, you are correct that the counter is per instance, as are the other counters.
>This would mean that if you have multiple channels you would see the total
>number of inflight xfers across all channels, limited to that instance.
>If the inflight counter is non-zero and something is wrong, it would not be
>apparent which channel had an issue, however this is the same for the other
>counters.
>
>I feel like this series is a helpful addition to the current counters, but what you
>have pointed out is something that could be reworked in a future series?

Sure. It is ok from my view, you could extend the driver in future.

Regards,
Peng

>
>Regards,
>Phil
