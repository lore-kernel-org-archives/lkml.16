Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2130.outbound.protection.outlook.com [40.107.92.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4872633;
	Mon, 30 Jun 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296467; cv=fail; b=ePC07OtPw0MYgsBTn9MPGJ0ngV/eDatILwyP5SJy6hAH1HTVQzbvHdgtWiKf9lkOFduLX3OmO4G4QJtCy4xYGPZD6t6uqJKmOTzDmGtnGL3at718JZNEXwyEtpdtI+nM8sCjiti2Ea7S1eerTMtDU4y5Eif765vYptNG/azKnA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296467; c=relaxed/simple;
	bh=zXSkVzOOzBCCwbMX+OViNohJwTLNrRuke7hAbU00PEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K9sOSQLVkaZTJ4pJLNGPhpD3gFupd4h10G/NWCRYDV1CVYtg9vLiBJP5TiwJqUx0fcAkcxT0IL7/AfFxpXACOPV8yZRDJlefHHkhni30yxAdt08LUYnyUxRuSFntQOCfQKb6ndVfbWkaPOEbJZG3SAwpSzs+AdYalxrrZufGqnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b=sRzv3+oX; arc=fail smtp.client-ip=40.107.92.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b="sRzv3+oX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEurJym1kn7Osan/+BO/LtUwjO+kFCmgg3yO+uaOtkUbbC242j1O0ivtX5VSfFsb+fnfYoPF4GWLH9dBdsz12PZLWU2j0mwqVQmxOutqAEyVmS0HoU8QOGrjKv+kjpPSbKmbPwuGYAAd6nm8h5RLzRdL2ZPgz9UJZRUwbviDu5t63w3XTWpCDjKcH4mjwuTw/NyjZKCXowqhjMrhhiALNPE+0KRlrKV7MpUZeaqw6/M6wyHv2IjDGsTyTXCIMt25gAiMgXaPScHbZ7Wc7GC9ehl5i8vHE+NXYcAyrjqp/zgzCom5yKraOASTVqA0x/UwgIDhtXj03Kp6vu7NrT5w+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+aGh5xYxqXV1FlcvUIM/4mnoaPI6kigR9aizcDwaiQ=;
 b=Hs1J2mJxE9a1ILAH0RycuuosslhGLUG+LdS9OgW7XxPwM/dQg5Ka5oX2evik+s/ylbunkztmnNQ7TWoCfsFqSmJhEmessrq4n4yV+D6U6DJk4fJOyXNLncUeXvyw/tVXmmnYqGF5yJsENp8H6EPQbh0MzUCghVM72Wqzxzt8lFXTOy/z4LET/hJMNxZ4dxAwXTIKW1s37yH6U5D9dQQwRkVF3cnO9ym16fw8jAot5p8J/UHeQJGhXVlfrgDY+92zCgQBKjHiHtngbM/XkOw92+Zsi+ojLtYnTkrobCXnK7Ocy6UpyTgC3lmtNmAZ5dEMBhaaTF8KFCtrcwvzD72/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+aGh5xYxqXV1FlcvUIM/4mnoaPI6kigR9aizcDwaiQ=;
 b=sRzv3+oXMpwPQrlpbDmT+jVUQFR+hxMkBQE6GI7nnC/lgPIbPnS+vI8nWbi6I1kNZZ3K3xljgfZZ7GDAegM6KCKHf9NwrTwPWJ7PPrPxrKTZh9RKU8mGQGcfm4PQG925NdLJuTYNGs9cbpA/MhaEXXPwsniR17bnReA3FrSDpEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by IA3PR10MB8663.namprd10.prod.outlook.com (2603:10b6:208:571::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 30 Jun
 2025 15:14:21 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea%5]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 15:14:21 +0000
Date: Mon, 30 Jun 2025 10:14:18 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Felix Blix Everberg <felix.blix@prevas.dk>
Subject: Re: [PATCH 0/8] mfd: ocelot: add support for MDIO managed switch
Message-ID: <aGKpyh-5FQN3rKZ2@colin-ia-desktop>
References: <20250319123058.452202-1-ravi@prevas.dk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319123058.452202-1-ravi@prevas.dk>
X-ClientProxiedBy: MN0P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::21) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|IA3PR10MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b83646-798b-435c-9874-08ddb7e8ca36
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V11yrNaZYzV0hgsF8SYzfux3UtIhuvZC1h19NbddiwJ285JduPCV0NGxP55H?=
 =?us-ascii?Q?VXkW+TNQg7XQZucRlI3u7sFcvsU/DY/2pG939Q/75DBltILCRYXMcZX5H3Gp?=
 =?us-ascii?Q?gJwv1sScxWKPMnQqMd6Z2nJoBeGSSPBY5rh/HqB4+ldWExHGSWj7eY5Ppcti?=
 =?us-ascii?Q?l+4/lWcqcpK01MwdjCv44ZHLYdsnbmUBfY3cy5ykoKHActuCU4j6Fyam7vU2?=
 =?us-ascii?Q?6ma205Bskt+TOGbSwW5yHf4Gvkza1c6sVGoT7F/kyy1wlQBhudvHndNHLGuM?=
 =?us-ascii?Q?vJ41bSBKhDswZVbwBufGD1ioxdKS0z6Dmt9h5WWRT9URq6u0VbIccLbHICwF?=
 =?us-ascii?Q?V2CcFC0yZPtQiBO74HXr9f/lrwcJwQPrMGr0IvFQmUNRYdy86GX0+A6iY8NQ?=
 =?us-ascii?Q?H41DJhWDGz35YzUSFvIyjrRRo3iTUu8XX4XBPP61Bnz8eZkIw3uxlMepvcG+?=
 =?us-ascii?Q?LOXCAhx3UEIlgBrmxa29YkjgozkXvuS7uqKkhqnUZ7lhTywHvn7I0rDNrxr4?=
 =?us-ascii?Q?2nH4oQuDKmLauRhidPdXuBFTPJzgFIZCFqg8wpJNcVDGjkx/CQkkDta0gamU?=
 =?us-ascii?Q?i3oNAIFzKeYGTKbcNvrpeKOZnF75rzxJACWKVa9HdY7SEPBC8touzWo3WN8i?=
 =?us-ascii?Q?qhP9unIDnDWpLeyG3kdkzTJTaGXNV/xbk0rw1VxtoptcUYvUMYykSxKQTUTO?=
 =?us-ascii?Q?xTmR6JTo+zIow3x2CQGuIDJE99aG2fCa1fjgT9TU50jDdEsrI7BlUCVQvhSL?=
 =?us-ascii?Q?W2Q7pEDPyHhCeFhXjx8GtJQY1VJmGlPXbYNu6fA/hhi2ZyO5b3itcq5V+9hQ?=
 =?us-ascii?Q?bj/bV5AAdUuH2buJDTSSTTmYTl8qKihgca6OsbxHZhkSjx5JycePP9ReOu/I?=
 =?us-ascii?Q?L2b8eHKp3/RV+y4i7r8bjdMW85FyTopwKxoPo6UvdRbjhk2mXUD4uP13/DAB?=
 =?us-ascii?Q?0iJAKcBfUUXMD4eyd8jPuL+6casySOvd5L9/KERLuy7MKbZq17K6n9/9bc/a?=
 =?us-ascii?Q?lgYYWIZd5JUMnFc8rUrw7iqcj4srjPDz4+J8HHO1tzyHs/t+cw0pBbqnl4tH?=
 =?us-ascii?Q?wz/iMLhyy9SDM3YXIl22ZXrR9W805mH+e3C5XChtXYLJpW7ph5Rj/6kLvv0Q?=
 =?us-ascii?Q?UbEv300WLEJ9sVdaeY4otHwgvoIxtssLrN6jEI8mbUyqcPbCNy7j5f91C8+L?=
 =?us-ascii?Q?ZQ/gpyi3/cWCyo0w3HF996DfubNu+pY4LD7CA+G5Nv7hatM1thCfCE+OjMJg?=
 =?us-ascii?Q?Rs/zm3PQgKwhfbOcUnBuDlZ+kYS7iENOosRhdKEy9wqo3l5UVmgCiWRDIq1J?=
 =?us-ascii?Q?1rvrIcTIXv/8Njs9oma2z8Nzxh2WE6cDAlW00yTuVVPuOwEBANzlkjPnuq+A?=
 =?us-ascii?Q?QdN6TpWq2MUtmmAw8XqNRIYzBT12z6qrw6izoUhHBeGtxhCYLTjxmkFjzsHa?=
 =?us-ascii?Q?zfOtUgaDlkA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6974.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wn7gZZQyp9H/Z5MnIYgndFdCxDutELQ1KmkWNf+2NIo4Dz31Rq7MqnqhNHVz?=
 =?us-ascii?Q?2Rj8BYX0sLsM+aRVaxkTrly44TCzSX0kndl3+n9pMhrJwLcQsAnYtltdthWk?=
 =?us-ascii?Q?cbP0gYywlmEWX3zC+7eIuNuIt35W6rxDNs/M23qkgaNPWAEaxS/6GjyvQscR?=
 =?us-ascii?Q?VX9RfZt5jTtpZXVprnjHptWYVHL9/XiLRh9YimwCvdZtwdFp8YssbYU+bKzi?=
 =?us-ascii?Q?YKNyGW3NBkjgkLugCsMe/+CX1paqQhYSmemM7o2sRz7RxNCDxdblYVgj72zV?=
 =?us-ascii?Q?8y/2BkfnmQkNJ1pCe5ypWYwrHEi/NbcD6zlnmqU8QeONFa6SE3CSYBVJ53gc?=
 =?us-ascii?Q?sr/Bu3j00e1rzMiPTpsYDSKcRUVZJOMDK/ivPN7KkQ7wZdcROmAH7RO05dvd?=
 =?us-ascii?Q?yQESR86TNS8c0Yd/sK6+BvrULvVB9v414XowbZReFjm4Cru2xSjxwm20NPeI?=
 =?us-ascii?Q?HQcLnmgZSdI63WZ0jgNGWT5XlvNITfq1oTtxIY8ORxJVG/0IKuULy2/Z3fEq?=
 =?us-ascii?Q?2L+M1eC9jZoVO2a1krlJIeSxP3ocsjqeDt9XLDkSOZmQS1mGos7tQSSi42gs?=
 =?us-ascii?Q?s0CvjJPzqGjZhoSC8ZffkLVIYa7hYWw9nTRdsps4cu0CDiaDz7kco2TU3KqX?=
 =?us-ascii?Q?Wv3IIni4Jmu73FVKyA4U5/Ze4bQ7S7GbMtup9pGXTQe95O2e+GdbYryB6pxL?=
 =?us-ascii?Q?eHy+fOJAGTRDNBNY4Q0lxWPgP6Umf+ydGERL/pjiy4PFJEoTEY8u4cZuohXg?=
 =?us-ascii?Q?7Y1ennVL4FJ840sZtCy9RUZ+hu0tx7Sei5L+Yjawcg9uZF4IfQbaTQhpp8mx?=
 =?us-ascii?Q?6uECyb9Jyd/cIx2E+LjJfl/YJ56ua2ijain2EA3y/Z+3daKXGYZUG6VTnHJz?=
 =?us-ascii?Q?AZsnCm6l3JDPbs6i9Xy2RgDn6PKChrGcnBOrubLU0Rn7z+fHarpOAxScPkTO?=
 =?us-ascii?Q?aoMhiy2P93LGZepUNwCZ0m0fgwa01Yvni3Pye7IsRsdgvO5NYEfS2HXzXqq9?=
 =?us-ascii?Q?iNMfi5lVhLIDTbL5Co1rpaI4FghgDZiwGROjg79qTXGLFOwVuAu6l3chxPVn?=
 =?us-ascii?Q?+caRuk9dIzZVUyPxK9Ovwm+ADaTf2TJJMPQNeb1sYFLp7Gi3h0o9l0N/o8NB?=
 =?us-ascii?Q?GZhPm8sO/5OuEnuS6to3rX71wwP7D2Dg/XbyBvTWWKMSNXHwhvHsGbh5mUBo?=
 =?us-ascii?Q?P3cMg1VNDz42rJJjN3+005OP5zbk6lBQgzOdaacSaK1aqRvtK+OoocN3eh22?=
 =?us-ascii?Q?C8ACbNmFO2T1aHzN/O+LIiNBFH1g5tqANJZedZeQAW61ZRzTzrPxoV+SJnKb?=
 =?us-ascii?Q?JLw4X1KCpcr1VGZN9ZEBHXep1snc+tYfc+cXCmPT3zlPt8NFC1YgN7s2qQL/?=
 =?us-ascii?Q?O0LcIbpg0hOq2bR0t3c/2KurXJGbbzzMMhp9AdowyVrJ2CLprn+PzQAFQgAr?=
 =?us-ascii?Q?NMCr4A/Pa9WJJ9DZNWkru3RP/LcgpLcDBwxpYdPu6n2t79zR7fCS7sw5U2xr?=
 =?us-ascii?Q?EmGbi6YeK9LQlLLSCj3u8/wihBAf2YjV1xtASMzs14pHUIn8UmtKyrIlNgHD?=
 =?us-ascii?Q?8wjL3vk2Gt5hSBMQvpHBMJh2MQSpTcMIkpyiUVeyjsa60ldPOruDEgHPYw9z?=
 =?us-ascii?Q?+rBmJOEtzw8v4c2WvePn+Vs=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b83646-798b-435c-9874-08ddb7e8ca36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 15:14:21.2039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAFJd5MBgYsu1KpqFegpwma/t45zvfaeJpVer4AjfKMjy2j+t03lhvu4pM5bqQrHqo7nxzMVh/pYbcVXxWO1smm3l7ub8bhL+dA3dpYorF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8663

Hi Rasmus,

On Wed, Mar 19, 2025 at 01:30:50PM +0100, Rasmus Villemoes wrote:
> The primary purpose of this series is to add support for vsc751x
> switches that are wired up to be managed via MDIO. The current MFD
> driver only has support for management over SPI.

Are you still intending to work on this? I understand if not, but maybe
the bugfix / documentation patches could be broken out, as I think
they'd be accepted pretty easily.

>   mfd: ocelot: rework SPI (re-)initialization after chip reset
>   mfd: ocelot: correct Kconfig dependency
>   dt-bindings: mfd: ocelot: mention MDIO management and add example

Is there anything you need from me?

Thanks,

Colin Foster
