Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A85A927;
	Thu,  5 Jun 2025 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749114796; cv=fail; b=kdfGePVB2abIGY3cNJ41aVHyxQKu2YhZO/1DXxH8jAp1TGBhK+Tfs62+N2M0C6HvzBkk92E/eRoGf4hboI80C6uQatMIBREewpza/FndRRgpeVJH//3MvHCkj1G122TD31864YPWK+w8hU4aLwTE+B3/Kkx/fiPenQ1rgeO7ynU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749114796; c=relaxed/simple;
	bh=wP4XWVieWpLgLJ/1+UJ8RSRaMYh33pzGdZI6yhr/ADE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IK/HXS3sKMkkPId3nsrijwouGxdX6boAGd4P9HmVMNU9LqcO5LOQsWNu6DWuC1nEgvSAjz6scH1etncpjHI66n6hJLPpipyaKx/sqQRmRIfsQvPGCHHAjUTqPoR32pYLHVQilE5RoK6GPTqXwX/Bc2hZ7H8nTNO6vYHFflAkIkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i9Qyvubs; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i9Qyvubs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0y+WbAOkeI1SjoEN0Wc77hgTxUawhY+EKnnG6NKaeKigAYsTcbffNLq4e3KmnAn7nVLDAQVNXMqF6tr90ngMB0ISCploKS76zjL7rtR+uOJgL3DUXnfZm5dNeRZFiAZAfNnXApH6xjejLB6Ccmu+VtFYe61EGYDwULpYf1cQVRrt/vWpr7KhwTryjXMailpDTNii4AJLRl3hsqKOybi93tjz+jtnenIDyH/R2AP9GSUF+V605Pv99s+lO+ybGiVu4Wqz3/0ft68ZzNXglwcYHPUAQaTLGbjJZKHmqUZfqMFsmKPkbhL6hNh6eBzk8pYiXBXMdMLgAMPqaKuLbNS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wP4XWVieWpLgLJ/1+UJ8RSRaMYh33pzGdZI6yhr/ADE=;
 b=eUC+ef12Jt7WRCiBZFa6oSeuzeoVWrAN++edXIOXrTeEwDhwVsSjoaSmYMYqiPliLgYQ0amtfvUIjKXwXNowLs9ugLxhyo4b4C1X03XlfXJLictJDwyOkAzpywx+Qa4xr7FuthvVMwMISRkZkJ82vNig/MVvJX5pRtSyjmI+DR6TPo5RTOe0V5MaUONPHB/UjETz0X+Iv5lcKCBInYvbJntshejSThxge0G58L6aCtRpIizweLuNbz4MVyIr/ri4HybpG9PQmJtu5hN4sIAb8sBT8NZjw9H33EtrPLy6arRC1mlvz2CwMKAT+3WWn3SARLpWbvCc1RUT2BVCt4Oc8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP4XWVieWpLgLJ/1+UJ8RSRaMYh33pzGdZI6yhr/ADE=;
 b=i9Qyvubs4An9GfPFw227QMVX/9BlgOxYgW9/IHlkffY7jj/gRGcJmb1Qn4KBh4uJqfiRsXT4ImC29PDTGj/0ZK8+SBHFCCjC2OZgF4e4dy5AZDKqPjdIdJfh9LAWpYeIPuDVy7Ej+KNxTX5exZANZiTFQd8uq1HlHTLuMuZDl5MFFPkl010u48cRjrgQ6JPI+lzKokGHXmP1w3ZUDQKVKPaEMx196fKi0at6HBI422JMP3BWLm1IdbqI6KKgjerYEdEXzZxzAweVLFkripir62dIUiCHqKEOZF5HMJ3QnCrhveXFV5oUniLIIuHJUeJ2WL7cG9nuccpm2UxZ2AdzFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10227.eurprd04.prod.outlook.com (2603:10a6:102:456::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 09:13:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 09:13:11 +0000
Date: Thu, 5 Jun 2025 18:22:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
Message-ID: <20250605102238.GA25350@nxa18884-linux>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
 <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
 <aD0j3gXeD6Nn6L60@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD0j3gXeD6Nn6L60@dragon>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10227:EE_
X-MS-Office365-Filtering-Correlation-Id: bdbeb148-b06c-4b2f-e014-08dda4113168
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k+w0XjrkhCPuOkNptIP4rj5N7t9VHlMAfNt07BND1ykyj98uAyyKEtgvz3yl?=
 =?us-ascii?Q?bJHyztGp9lnKnENmJLRzufjgTseZPDeq9aIw1l6PSiMSfBQTfTpW+Rq98eek?=
 =?us-ascii?Q?wTn2GZR5qdwI2/DHw5p7MiJzRx+xuK25H7GhMgglhuv0FgdCt+Fg5kNe3to7?=
 =?us-ascii?Q?/GSJfgYtvllavM9GiJXCjnjaWhbDdrKwWOaEzuertEEjVi2gxzBFco8A4eKv?=
 =?us-ascii?Q?DYX8JUUOJ0rWRD9SSMl4hnssSccsB/2KynjHxLxccfuBCOgG+8ZpcOLZwdO8?=
 =?us-ascii?Q?IsnW3IIJwveq/dz+bGBmBlFBvKcwuW3BqjnujFBTFA8znHQhu+LYtNjm6xzl?=
 =?us-ascii?Q?6ETwf9A7QgZr7SZcYtFwn5Uv1bwKFu1cpQilHQaufFZT+SjnILRHB5xVhMZB?=
 =?us-ascii?Q?5Rtj8TTzODbS/iS03A+7Venmmvvg50YfZ8Ou+Es1Ek3uD7uqLJnMK6nBwGJI?=
 =?us-ascii?Q?e53RLKTVDAhbsD4pm/FH0n3BbE0J9NGFW/VGp23b7WuQDfSUQMt5aVPudK3E?=
 =?us-ascii?Q?wsBkQLVBC9UY/BUlVOspmz4TYy9Ouh+y5kZkmwmiBwLxbIgL7VIWU83bsnDH?=
 =?us-ascii?Q?KVQGQ+oT1FDetWD7ViRBNkMsCj2OfcQdX/VQUCA2gt6zMROB9Xr/3aOJ/xnC?=
 =?us-ascii?Q?xJ77gy7MTEuc/+gi8QutoRQ9xOzOf6Eq1Wv2o7NSiNdw3QZ/6wz3t7HY9brp?=
 =?us-ascii?Q?W5y4r7xQwfU2EP6OOy05qi/hvKV5S/XTtZ/v4c9RUlJhbyQg/xe27JWYnsZX?=
 =?us-ascii?Q?b7raTJ1VeVc7lN33EpfO0O/7rIjSB9H0iw4wMJ2iMgU8ihYlNpbxXdwsf4d+?=
 =?us-ascii?Q?UQHgnek6kfdrLwUrYYx5y316/3ibN6gFtLeIqa+8tagQUjNMJPA3FR9hT7kN?=
 =?us-ascii?Q?NkKn3+fYRagkEr0EcL7P7zzihJRBunfk5bFsWsflBGpcAUyOnbikzlxbOLXC?=
 =?us-ascii?Q?/kew3nigHFFMzV5A7fK/Q8hzgyEpCiAlEQT9bmXxmRrm+vKQD7o/dKfTcevJ?=
 =?us-ascii?Q?dearQSPURfcn4/X0ruCSQXSyXYujeW0WaM/A5kJe7xJBHeIMJ/TdNw++NVtk?=
 =?us-ascii?Q?LpQk+UyZW3Ui6ebbOEuB9TtRUYL42n9MsVBAHrUHYhesR145t3lRsiNt5Wn5?=
 =?us-ascii?Q?IQFygjtv0FJ5hEhzGL3zZ0b/R7Np3eVZAf2pAcs6ZHIJ0prQdhvplBjbBgOL?=
 =?us-ascii?Q?Atb1Q5NbHArretjBT10gE+QJaGdpSNxP+ZwDlSbh19/LfatzGK4qVI/Z3mRy?=
 =?us-ascii?Q?zcT4Bkug6FmIu0zAPll6ltADj2y1kXr2WR2PoTxWyDeVyejaZsHScknZ7sIG?=
 =?us-ascii?Q?wKy1P3eP1D7vd2LQEjsoF2N/qX+7/33Cg/pOQmG2kWcGiEAZMxu7jtEsd+Ri?=
 =?us-ascii?Q?d0zWTW6jWqPB3rIpwFFIQbx5sDr7JVqy5o2W4T1GlNH76bhqxm4KE+cgRVuN?=
 =?us-ascii?Q?TYf8RKo+TSJ6805C8LAcBpNdbjv7VYuGNer4ItOPqZnaLzIAKxZ4nA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/EJoWlIC0Na6rkCJIywMzZhgB5vTCErbvKG4DfqXwxKxW1VnFz97bD00FzYJ?=
 =?us-ascii?Q?dBKzPJFGjNuAeAMreESlRcwgd2vLcUJirKe3MWtnMEchKzakUMy8eVIBKBev?=
 =?us-ascii?Q?T/DsCpebiH+4ZU2BwZZGgxpUhE76Evszs4We2VaMtLtz+LBmvJgrPXI3NNDX?=
 =?us-ascii?Q?mAJPkS76T4S7vGWUXho2BlNc/c2oF99xQAVmnqRiahGAMzTmBzDoCobYPyZQ?=
 =?us-ascii?Q?hjSnBL1OyfpA/qm6pd7HUp9Ew3slEmKO3ftxx8m3h6MXSrKsiK4FhVSejiiO?=
 =?us-ascii?Q?7aKgwl9K2D2qT6ThepD4JEk70vyduTVBYl2aDIGHVOH669hQ4p37Y8jyekV4?=
 =?us-ascii?Q?3r4Q6ycC67cJfWvIwbNoR4xk01VLSfhmAymYAlMKerYbS/1yswgxO5hGnhNf?=
 =?us-ascii?Q?b5VXY5OmYEepRybWkAScoIDaN5lFqBg4WIUXM/yAnnHBDJJx0s0/uPhe3ton?=
 =?us-ascii?Q?Ihsh9iKjftUZKgoabCRKVVeFp/Lbe6xoEbXTjGTV3LZMHrGQGalT3u+Vgdlb?=
 =?us-ascii?Q?PkrILZIHHlkw4xv1xIhXOq+DGHqocK7eeJa7qIgTTj6TRyM/HcQhHUWO9he3?=
 =?us-ascii?Q?dczXTYNuF1df5cVafxA/91hA4sotch1QpzqY6KviEbKQGwvCNgz/8lh7WhrI?=
 =?us-ascii?Q?NR5nxfwuZdzGWDI/vbDJwokEupzdq94N+HqnDvJo+T7vssOtXiFrK7FJZrKO?=
 =?us-ascii?Q?CBMsUjM3Ybtcf2sa6LGiNglt+q198ndkANONWpPffU+Ygh5bhPmPzk8RRhjd?=
 =?us-ascii?Q?dPhaEw6rhf3j1vTRlEHvfvgTtR35A4wPjNCVlreHABIqOLgaeTGUpcR50xjj?=
 =?us-ascii?Q?6OlxsGgADIaS61mHnfelqYtprcYKWeXum4lfx7vJQc5f/FU4Wg5Mix4aFmzX?=
 =?us-ascii?Q?8mDmbOQF73PbFEQHGhgAPrYuyQSxa4a0+XAJa0Uj/GwEiwBSp1z9wM4WAuwE?=
 =?us-ascii?Q?4oPKX0dXMNCVJQ39J8nY0MrIbLkwMZY6aFJExgXzY08/jui7ifmYfq7xUiGn?=
 =?us-ascii?Q?p3yHYUBSC54ZAkAmwIHSOB3fHAJpWou3UYrmrbCpHakzuuxTjK0ZREx8qL6B?=
 =?us-ascii?Q?Fm4ivE3RSUFFdXajY6zKX0NPEFPGCfeq+GH0qw5T5DwjK/4ZV6mtbBr54ouY?=
 =?us-ascii?Q?XfBxWx8OJhR35NfBCw8mYJA5y75+IAb2iksAOgfLlYjtNPAtNCLspXMWzNap?=
 =?us-ascii?Q?Qyjvt1JsSYlK0f9KosHOkO8KjKSIiIDEEaQCJmbA1alqExRx10rsPQJvN+FU?=
 =?us-ascii?Q?1s0xYg68r87R890ZP2QbOKgS9g7QiEu/3/KCd18CebU2QnuC8TAtOfgyaiww?=
 =?us-ascii?Q?T0MX2gX5KqJgt3+RYdctizT17mL/ow/NyCLtqKeasnEnIhpJpTM8UaW/mebV?=
 =?us-ascii?Q?RTyXhQ2w1S21NH7PkZsVkpdJ4i6baH4HKzqrgKXT58nuhQCDad/mWbUe4wA9?=
 =?us-ascii?Q?tXM8ouqcbl/0WhjgxB3iQZ7gOsmBkX8+8TSg2Ifoh/CHCUYv77XfYz9H+wX7?=
 =?us-ascii?Q?dHZzS6TkZEb1pfCNuCaRDHj3apdbdb/Ch7TqpROx8pir0Vvx/hkGZA3U2BMh?=
 =?us-ascii?Q?Gda9pw6t596l3iQhNsTtq6nfQ1+YyiG66/g5Cr+s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbeb148-b06c-4b2f-e014-08dda4113168
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 09:13:10.9935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDPZvjaULCDCaaUQlRwFom/hbJP7vQWT3yQua2h9nsalG/x+QPwyz2SfWKIRgdM6GaOLmLVSTnLSEdKvt1MxXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10227

Hi Shawn,

On Mon, Jun 02, 2025 at 12:09:02PM +0800, Shawn Guo wrote:
>On Tue, Apr 15, 2025 at 01:19:16PM -0400, Laurentiu Mihalcea wrote:
>> Add driver for this IP. Since there's currently no framework for
>> access controllers (and since there's currently no need for having
>> flexibility w.r.t the configurations) all this driver does is it
>> applies a relaxed, "default" configuration, in which all masters
>> are trusted for R/W.
>
>Just out of curiosity, is there any ongoing/planned effort about creating
>a framework for access controllers at all?

I was planning to add a generic framework for access controller, mainly
for i.MX various parts for one SoC family. But I have not spent
much efforts on coding.

Regards,
Peng

>
>Shawn
>
