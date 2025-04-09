Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734126A1BC;
	Wed,  9 Apr 2025 14:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210330; cv=fail; b=RCcXsXZS+qZpv2tdHnwKnP0Mpd01qvybsQsOIbU+KvLttw+aOWnZpe8zXB7gghzuNxdJak3TQwNfz4Ye4PjlLymYM/XejFzfod76zZ2RQQioajd0SYppn0FWJAxI5Bk+G1pMKhv3SQqX/eAHOO2sqNmiePLC0zfN/p0SyqL728Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210330; c=relaxed/simple;
	bh=ZGbDcGtoZ3e2uUgnGsQlABHMXsiUHG5dHu7uNVM7GpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MFW7YoT5JchbUuA8mRr33Wd8g1JzCe2PmPE8b4qOSenp/dO7PPvJq46oeAM9fa5PcMz7V/7y/9IwKUql7bsk6Z5OrjVkzcjUDeCg1ZDV26cE1fzKIH8WgrnS6l3d2UCqzQdBLx+CxyOn0DCTkuPlWK3Kv4SbD4OCZg1VCJXFQm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ezMVi0So; arc=fail smtp.client-ip=40.107.22.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ezMVi0So"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ry/BHCfhA1C4jmhUFo2T4ocN4M/aS/SlMfRlB0ZWdBKnFj9FvrvppQBs2++B+Ck2/2f+ZMVuBQSjPDssWEwgMarMqRoIAhyk5bgkzwiNa4XO8s58vL6PX9cEfocneq4xcJ4H9zg9SZOp9YzCEDfoF3K1lM/Kx2mmTMrzVvYP5ICYWgP5XRhAgBQaQ2k/N38fqCFq0XfSsjIpzosDJ/HH+HObmrT8Zsom4GXUAQeLvpDe0zkw/WRhqAjP80AFwLaD7BAar5TAU4H+RFXfDSN/q5FKpUjN58LCIkQCxptoUA6bf95DE/sI6OH7Is77f62fHZ/7MhtxRJwNMBNfUQ2Hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XujLaNdrw93KFdiOiNGjP0lp30k5KJiYzBpoyIi4TO0=;
 b=TiCTuEqmVkUpxfI6dNn0nuN0cx8KGDk4H9FrW0VjGyRzl8RTuhpb6BLgI1jh95gghBlU/FwaURxE2Vq094kifVMigF0X3eSjTa+zgy8vMLId4Nl8cyC/vfYrNjtP4w6UGd3P2Qdgq+ANsbxQU8BanK6Q4v/dQgv1lEYeENEVJQhBpp2+IfMHcTSLbNZuI4T5Imz2eeqMol8fsNc7KCGeid9xs++K0JnRbg+KV1XECy7ri9mNcxUndgrs9AmbIOk9IOpdfH63YshJf7tblww9m1JyNZ/UWcBKt0kqcrzn8DgsrXvSbsAAODtK0D/kkQjGCJLJDCy9YELcP0BTiO/rJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XujLaNdrw93KFdiOiNGjP0lp30k5KJiYzBpoyIi4TO0=;
 b=ezMVi0SoxEVB/BFQCo9YvAWnpFgjmLYKuGi3N1P5Hoop9EAXjHFDx2+WCSy8Zq5GkX+fbZ/98CqBcj2xwmW2pmyKGNRw23PNpJfymHh3nzkPpyG11nxXK1m2dykqbCFUriGOFAsyYaSEboyt8Rgf0Kj2QrfnEjN7pUdU2ofkpkEZphXRyMAedPU44B+4V5vX0GD6Qc7gk2lO7YntPYCnpAOQr/PhgDS75yAwHZex7GC6NwHVcNBYHMj/SGP6qjgDI6owQfJIxyC6RPwTDXjYppHMwKulOxYS/BvqYzbVEqHDdZQyV9e3SJQsE8kpnn68mKKC72bgYRlrv8szHNmyvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7495.eurprd04.prod.outlook.com (2603:10a6:20b:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 14:52:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 14:52:03 +0000
Date: Thu, 10 Apr 2025 00:00:29 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Message-ID: <20250409160029.GE27988@nxa18884-linux>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
 <2003940.PYKUYFuaPT@steina-w>
 <20250409121829.GA11949@nxa18884-linux>
 <20250409-heavenly-sceptical-ara-bceeb9@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-heavenly-sceptical-ara-bceeb9@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: e66ac35f-8581-4ec9-dcd8-08dd777616e6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XcsF9CZyFZ4m6wM68tO4IcK2/D6JbKcilYPf9tZbaYhYnVNeHe1OGNOSSHgv?=
 =?us-ascii?Q?mbcKPk+F8hVy05R7l/PxVqp+tiv3XkkclNA6duJq80YJxbJytxB+nXq8aa+l?=
 =?us-ascii?Q?H1+rzJPoI7trbrItQLX9gQ/+Bq4zhGePbU2JAEXPpoch3wtF0WgXRHu1mtab?=
 =?us-ascii?Q?aIrbm0cybt3pngzop1bkvxVkZWJ0HMGKbmBJ0tCVAgSN3C6LgI6CoaxciV48?=
 =?us-ascii?Q?X+BTqCDv4AZpIeia7eoOql6cNK0svt9W0Gl0KEZCWCWs/FoOueRIYk+cYUO3?=
 =?us-ascii?Q?ftkmfHbpsxYP+l17qpj0qGs4M5LlIDgtf2zYFxyOsYzKPxz/xUPxrbeTx2ci?=
 =?us-ascii?Q?GjEJF4CA0HFnALwS1hZ9EICzvkutIdyJYRcho0MCt/XQWkRR7HLFmszqrdrD?=
 =?us-ascii?Q?gdCuq9d7Hz1779hDkKDzDMLAKrIbe7qNXQ0FEZlNdipcfpYg7m3pupX/suwx?=
 =?us-ascii?Q?bw3gD/fJfNwhBIyBPmmXMc0FrFBortncdrjBIO7D1YviEHWKMuQ1OaZN6JaW?=
 =?us-ascii?Q?AUDJQshhExe600HD1RhR5cz6KVmt68QX4gif8ov631/Eo5Ri3z3g5AbLpgbs?=
 =?us-ascii?Q?9MJYhlE4an1Pk7UgD9g0yqpLnlXvhJ6QFmA6NhCS4xp/ZNKM3pdz6RSJu0Mf?=
 =?us-ascii?Q?DegGMqUQzzU3/4AYIx/YznVS+lKh6xbF63qZ5SN8sSyrASlNQngSue876izy?=
 =?us-ascii?Q?ZB+MIOJry5zlQ3fuc+2XbdK2p2KQvyH5cf3XC+twVA9lxT4aX6ik/IIRkBjV?=
 =?us-ascii?Q?TWY8t5GUN0U/XR7WEXd1c7r1Jh2WJrSmdtxCi6OcLLCjCD3LtEBZnJbj/GIu?=
 =?us-ascii?Q?/bZPDffk/ygYC66DNoQSuQSV4Ics2K1YqI+eGvOJqKoZpM1vjMxwsDMz+6tL?=
 =?us-ascii?Q?GZygAi2t7yV8n5nedHQsOFXGNa0KNZEbfQynmn21LxREK7WxywGDSgLIAqUs?=
 =?us-ascii?Q?MD9TW06D2xPs9DfXRzDgMO5yfFSLby/ohpNCcv/dAYLY4X7TS6d061XIhbiw?=
 =?us-ascii?Q?d9OhjwVtjlbq+h55F7eA722FMdkbID1yNgxFcLDSQNMPUFwtzI9OMHGgQiC/?=
 =?us-ascii?Q?reOER+TmEAGoexRkM6eaQLEhAuQHxqCet0PJg4U36RfaI+xp/9JD6bG31NZ8?=
 =?us-ascii?Q?SjvCfgrRMEWhamBhT7W8D7fKrglMkaJhzdXxc7UxXS74wSlqzdWHKaym/6d+?=
 =?us-ascii?Q?vn5kibM1GsbpRJZAPZRk6gUGUe2ELTEi/qaiJLHAbpAPF5awsY4oYhv9d1GY?=
 =?us-ascii?Q?7CmmOOs9qljQb7yYUGtiF0RCucnTHh82771DQeHZJOEj9O2FI9Kso5VpEhvY?=
 =?us-ascii?Q?dflf4CKzR3JXdCmUNrUbNG/FOvkRrJczEklQ9wcKg9D+J743d1KpFYsMC4M1?=
 =?us-ascii?Q?F7M16HHlC2+TSWZAfX1McT6Pk5kZp25x61LNWFyqHvaA2bUCfgn6JOyB6qHK?=
 =?us-ascii?Q?01bM+j0vHPdN8bctqyWhy5Yg+3YpEvhg2lHu2Yo10KPrE+ekXD+Y1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eDPzDfq9w/JOvOR86CGmmY/091knrRtHCuF4sYUZ5S+xjV2JG7fDDv9nDtUi?=
 =?us-ascii?Q?bWYhgeJ4a01kIIFo8d4dtt4JZVDjw3Qbs+HUiNfRvmTIQFo1gKpBXRjkFAb1?=
 =?us-ascii?Q?C/JM716S4TyT2dQ8PlCK86P/D4jgijrqzIcqsK45UvLOSuGoS+lo3YK0uDop?=
 =?us-ascii?Q?uTB82TJqcOJpe8vb/W5EdAScvoPUJV4I8hbveaDc7mHa7OgQ/P6OJmG6JvcP?=
 =?us-ascii?Q?PhgDnG/2pcpaQJowySFgFaM0T05euuOrsj6pdjIJ0jfJhl6DA+/ZwZ0u0cQY?=
 =?us-ascii?Q?7/AUr3B4B5NRD1R2nJGpbZwYj+qVxM/FOfw5zJp0KuT7R8JUHzis30fhmQTU?=
 =?us-ascii?Q?gIseDEcrGRKjpYjyaIXLNeGuDBprcQdNlmJ+VCtXKWgHzO3i0U54OsnhbRQM?=
 =?us-ascii?Q?RZHI0vEmSd7pfIuLXXwiWSDqEx0uNi7c56hdlslDG+nD3m+KFI7YS/OihtyG?=
 =?us-ascii?Q?RmMFAjcBc0CCNGX5o2AIpe45EtF6eoHBMpuarVK8R6mSMcNwCP/v9nXRFAhT?=
 =?us-ascii?Q?abZ2xAJtBNZe7wJqz/kk9SeA7HkObNMx7dzGMpIpbvl2K6eY2IBxNfk3YMWc?=
 =?us-ascii?Q?g4Blv6rNTQa4JaAk4YH4LV+bgnJNoNyWoTQA0dvxCIgxXaNSOUCzu+B7+vGP?=
 =?us-ascii?Q?e62dW8xCFaIQULpAoBAV7E3kABqGFjJyawrsUeN65nMpnp9yTuL3KUhKIwFH?=
 =?us-ascii?Q?lI8qt/VnnbJk7eVGxEaM0vCyFITIcCL2uGgWfsFC82YLaz78fbKZvff5aS20?=
 =?us-ascii?Q?yBW2qlZNU4QyOVzzSwdPcyVvOwtLqzEvNm1jqXhAszaCKbbeSORwVSqX9NGT?=
 =?us-ascii?Q?Wdou9UOOwBYzGvp78OFLP0osAARW0k6uflrVLbYQstuD4mOfF05466RTGTrz?=
 =?us-ascii?Q?FXB0D5CYIuW3DGC+dDCvfJ5RAPj/T4BAIsymMmHVrPfqOU27wfONZQmMKLy6?=
 =?us-ascii?Q?+HTpKUCI+x77/2XVDJDE4JXyOn4lN282/84zYyGbgnyFsnzbR63edThzzXcG?=
 =?us-ascii?Q?MM+EhoajjrXh8+XfZS5lONxBCFdbCU3J1h0R8yQfTI6i8NXlORpeqU9+7qLt?=
 =?us-ascii?Q?xHAMcycWjsH5roGp63fQBpPc+ic4pG0Z0hg6hFfGj1Bf84ieASvLGE8TnW04?=
 =?us-ascii?Q?BDxeUE5ofR9z873wYQexXKbFtlXqW5QbE90WSH0yKE++anG7q26CKDmHzz30?=
 =?us-ascii?Q?WbpBrfx9F9UHLeY4XZUXNu+z1r7VUkMXy5tG+mrdUDeJcEe2SAoPoAtfXdIH?=
 =?us-ascii?Q?syYeUbzJ/8fTdpK7Ll+v4vcxoc7tyUr7+5MLeFdEqHqLEML4Aj+iqHp2KhkY?=
 =?us-ascii?Q?3iJx7hj+xrey+f/IE5oxaFbxDqITxL/eOBs04QDSEAIzxkVRBMd1vgUAXMKP?=
 =?us-ascii?Q?WydccU4UV9JS5V+gVypaUFennN++uxIYUQefLlFXTg6X6AKIVbmcZdQJJagC?=
 =?us-ascii?Q?t1y8+mGFydwLA6D4nrz617i3iS9tN0zRhp6g/P/VaFYjFS6b1pXIE0R4zuVI?=
 =?us-ascii?Q?Hc96uNquoCXvgAmHSIPZxOY1/jkkKAHxETI5GSLOpkF01NjRDyhXW9UoO5ZA?=
 =?us-ascii?Q?WkyVwVShlbfxBIitkGNqQZ+pgKoaxQcKEZrtrYWh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e66ac35f-8581-4ec9-dcd8-08dd777616e6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 14:52:03.2537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSKCi9HpH0nqHyH3wLMklRHV392ygVSjg0U3c+mk8yhTSsjaETHRoEJmSnPb19yoeUUNThcga9gjqOLXEyeevg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7495

Hi Sudeep,

On Wed, Apr 09, 2025 at 01:31:58PM +0100, Sudeep Holla wrote:
>On Wed, Apr 09, 2025 at 08:18:29PM +0800, Peng Fan wrote:
>> + SCMI maintainer, Sudeep and Cristian
>> 
>> On Wed, Apr 09, 2025 at 12:59:50PM +0200, Alexander Stein wrote:
>> >Hi,
>> >
>> >Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
>> >> BBM protocol supports a single power button, supported by driver
>> >> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
>> >> using linux,code. Add a reference to this schema and add linux,code as a
>> >> supported property.
>> >> 
>> >> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> >
>> >Is there any other feedback or things to do here?
>> 
>> I see Rob already gave R-b.
>> 
>> Not sure this should go through Shawn's or Sudeep's tree.
>> 
>
>I am fine either way. Peng, just let me know if you want to pick this up.

Not my patch :)

Since scmi driver changes go through your tree, the binding changes
should follow same.

It would be good that if you could pick it up. 

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep
>
