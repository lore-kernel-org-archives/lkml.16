Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78ED22B59A;
	Fri, 16 May 2025 04:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747368853; cv=fail; b=GOZDUkkAMU018Ay5Cj2xeVHVNQf5aGH43Xw7ieHjsr3lj7jx+yu88K2uJa9Wsz4YlttbCAaB481UB58Pn5bZvxoota6qBKBVNexVKHk+AKZ/oCIzSYeEBgtJorw1CgNdziu0XZxZQnJjppniEwCcCU3sUqNvVnvu1ZLpoPaC4lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747368853; c=relaxed/simple;
	bh=kRlSH5PxEuAqEeQNSpCoy8e5rSs0lizMgqQSo+D1/zU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nnd+Y9PJyHjZ6LhaVAGSfz+p5xwANz5kheRnEAbqQ9bFqOSOpiC9YF8BU41PvIFOwYH1l3HwGFqgeuYkYKhF/WukSUqNzfu2/jaBn2kM6IjcfN4w6XcujNC6OG3mmkyvS/hNRZWGJu+yyNbn0Zt7V/oaiVk1A6ScPclZ/zPHU8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=K7VUYC1H; arc=fail smtp.client-ip=52.101.62.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="K7VUYC1H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVvs71zjnEBKGvL7P6caBGJgKNre1VhmJGWaSKuRgHiVNR7aHoKtwYLL9fvE/dzTZujleJWbYTSxthIqcgfkWH9jI92I2q3lmXF+DR8QFYELTU1QLaMnnQWjs9fF0ySXMCNOpEaO8m3BDWCC4BpMcW04ZmPQdxtQbCxU3NFhyxvsIm3DppgLqqBei0bq42bhicSgTKtV/sZsTIn76HRgXa9NasQmorAgaQyX5zS/O0IaQwX7o0c5yRsUboTXZAGOYwhkaDbsRHTKwbtV/91eEMkd4wGEr1PhdWcpQL60qd2WU/eI4gEH3ThI1BUl8l2Du3mrkb4dlxk2vcvdWqEaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDV+eg41h7u8lsPUrXvD66vyfjxt1iwO3ddohWAUgCk=;
 b=mnXAZHLErku5JDagAlvIQltxKW2DIVGtmdapD1Z7HJtLuqESyva+q7/t6EcRYcgdWjiV+uq1rE0V/hiiUzBJLcmCrYHmYhHpglluSIXOky3+qrRaRFc+wQO7co83J/Xb9STFvlf7m/ASjYP7sk+30fp19N49k061bLw8WBSPeFp+aqTjHtEnXhtQwGOweN0x0CeRLd8DIOrjbXvLB09YRGEHyuTb7dHcDXfyp1buGBIC6gwo1qKFESJrGtTSknwXfRN4NqncZiuEfDMF9YOt+3m6ags2AZlOCRr2X/lATi5wNqWewlWBUur0AKyss3j9NsYfyNwUAaMqXgLa2r9kMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDV+eg41h7u8lsPUrXvD66vyfjxt1iwO3ddohWAUgCk=;
 b=K7VUYC1Hn9JM1rqNqQGZiNgWySMLgoNRcvCRGZZEJt95wBes1H1vF2C8zKnfNJrarUgONTAA6Xo6OK8GDWMv3KdJaOLziJjj/KrbW67/rzGcIeav97x9/dEIVk1gaU9ZYxpcfwKuk4YLONMEAjR2SWyqa8ijqu/Xqc3SZUs0fNvkz+nOi/bMQp5cYqlKBGgpU4BJglGLk3/Kh7hENiqWbMQlTXIExBqPXX0z2UZxatfmRtsypyZay1JxVQ/0EksWnBd17/Lw1GUQG5WacaKo/8KaxLToGptqRwYpuzyyXHINxB0g2smD//ojeeLF48YGvh9sZBCvHmjka89/wLHuZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7093.namprd03.prod.outlook.com (2603:10b6:a03:4fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 04:14:08 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 04:14:08 +0000
From: adrianhoyin.ng@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH 0/3] Add quirk to support address bus size limitation
Date: Fri, 16 May 2025 12:13:31 +0800
Message-ID: <cover.1747368554.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: ac10ead0-c540-40d0-f216-08dd94301a74
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lLjsIsw4PYwdJgVza7Xc4SsbaxAXsdPkyUm2jRjRrX6ZlKOHJN8Du+lpUSov?=
 =?us-ascii?Q?KDpuuYg23rNMlxkJBiUGGb4UJCdk0UzRmek5vViWTXllYLSPuLtRdGNqv4ME?=
 =?us-ascii?Q?Ll8I8yM9ZwCDCm/pEobmXgPErh3217uUgBP0+kes4sL1lSfKksCQhvPRMpNV?=
 =?us-ascii?Q?JePQ4aANg216raXKhpdGnzgr6BUtG5MaSowIhTmBAC2Okxev2hFw6ekt7OBV?=
 =?us-ascii?Q?chr1DuHV2+8SfXejh0//VAvX9t+pMLNASVA0tzfmbYexEBsCNSSIQKYBUtw3?=
 =?us-ascii?Q?3ZnsJzWHQzFkzdDxMEeyXs4FrPcuLhJ0oefk87tFxJyle84q03WPWRdt70SJ?=
 =?us-ascii?Q?we46fuoYlao5RLr65Qs7ugLXKnoRdJLIqrY72x623BDMA19tghl9wL4XkE6y?=
 =?us-ascii?Q?E/0hXjeKVRAflSrre8ArkT2gWdekgvMX1lhhnGWTSrskczlAbcYgr/UdW0QN?=
 =?us-ascii?Q?YAACI1ZVjhtI/7R93dMeuUsqcIrW15+X47D6RY1njFJt2FGGBfkJl8Fv2Dxp?=
 =?us-ascii?Q?CqBlBqktGDnYH0D+lh1EVc4eXPs/6eLWThfJU3O53vFOT13xrMVhfrCGtlim?=
 =?us-ascii?Q?TqWeZ/AAAJcrCZeAcgt7ZPs9cEzc79qG+UAUtxM4H+p7dUTp3PVkEIIC8ehg?=
 =?us-ascii?Q?FhIfDZIBGFn14/KFZqmKF7viYtSek+1YqeCEzb2ky9sCumvl3cg3RmUqmMDL?=
 =?us-ascii?Q?WBjPd1ZW1XJNTbRPrVfAGn4sEF1u4+tb5H5EjotgkCdVHzo8C3IMznUQJ3oT?=
 =?us-ascii?Q?Zk3x1lZ9IFklvxvBXtwnd4kvTIFyPzmaeL4K8uIqGpsyaIa1qlcNmmeWtLXS?=
 =?us-ascii?Q?iRboGz+bfyUpbG6GDLNSMcq/89sd0yKBcVDUMJR6+63KFzqRyjxi3abXZqkw?=
 =?us-ascii?Q?PDbW9UPgzWfXEMCc3DrzZ1V/lq5xYYAu1lpcQSEh45E/P2lbTSPn1n1UVsPo?=
 =?us-ascii?Q?dBq9yQtPe0MsE7r/wCArOtujLr8INgCfLSLI1HsfZtu+HPQ+o0c5wNTfztN3?=
 =?us-ascii?Q?OweqjxR7i3TI57oRBv+y8TtjlzydM6nXcLXFBb5NZrnQlimY9Vvz2ztmfzzm?=
 =?us-ascii?Q?pp9D6J7rK29trO7q+55eYLvw5rhUoR8uQSptUOqC99G0DuxvWJyegBzAGjmJ?=
 =?us-ascii?Q?02H+PALtoOhAgLFlqF/QaU4RH5Zt/A7MwwdHcHGxirOqY++B6l05qlT3vxWg?=
 =?us-ascii?Q?6AiR9nHSKeLtAajgTEf91Gcus+Ol7dNyPYeXwC2Zrl/3zfSp0/p2PcrVufXm?=
 =?us-ascii?Q?Gz2utXD7cyHDdyphvI04pSOyNK+xxxA5dGKURckIMY5IA1StT6o+RAeW95q1?=
 =?us-ascii?Q?t2n/zfZAguSrRRBQVuUx5maLEaXWS7zwoI4X37iVw33GPwI8BCk8MsRIGOEG?=
 =?us-ascii?Q?Friov8+7ngf/9/rMNl2pGQKzBywwJ+ZEJRetrgd1u7i/tpj/+bl+m9pqO6LS?=
 =?us-ascii?Q?CHO3K08S9TM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XYdqduD7+CkCEA0WlD0/91YUqvMoS2hfgvup7CSYtH3xG87bIw0ln5TvfEYN?=
 =?us-ascii?Q?Ig/2Qux9fwv/4wJlaN4NbRqmjKUURWT1AnktE5LkI+SkOHMJ/xzf+Cc7gLc0?=
 =?us-ascii?Q?wgjH0+rfpS+2CanIm1rwK98P9eRgBBrcv22JiLzuPlzrbbMFcFsO1xvg+ABx?=
 =?us-ascii?Q?4MqhL7NUjkNfwtmM3LX3N9+LRktov3PaY9BcAevJGsO7MeHcIiSy1FWJK7u+?=
 =?us-ascii?Q?kZLmAZeR1wFwi2auPRSVhKykiFaCSzXJzDcJYVkSA5YGynKCPJirt9Cc7QLE?=
 =?us-ascii?Q?+7bKZX6Fn8boNXlnBrmVE7fPwe++DzW1xlbPMcHXADsuLLka78mbxdcri35Z?=
 =?us-ascii?Q?C5lLFRlWOIMuB8bmB+cY7YnyF6qoqhnl8tcOgmQMRpm12VRyhZD76TTxFYD3?=
 =?us-ascii?Q?ZREP4AGXjkqJXQY0qZQjPcY+OCwI9aXomaJYWydsxe3Aiamf7LbQ6ySOsNmD?=
 =?us-ascii?Q?AICxMSdEWyJR/MoCGizPaxtb5syPSrwzZNOdmEZ2OoNzCpMWJZy7eXguMrZu?=
 =?us-ascii?Q?76jeWgZ+be3DFbD0D5KKT70EcTwJ7ezWu/CC0w34FHItHGTdwShc+0nQZ3ie?=
 =?us-ascii?Q?KQyz7Cuzf5TKVqTfnBdbgFrqI4aLHt6S8nMTJjqikzjGmB3OdKP4vKJXhjtl?=
 =?us-ascii?Q?vHE6IWapgCkoqh/sZT+IVXIdGBvFZD+VXh4xFL6EtgMoDruZu/jfhWQRZcqI?=
 =?us-ascii?Q?kSWuvv75DkUrG7x/PMqJ2QQ0vDvoA1SVdMh2C0M78bkWWSh9YIxTthGobFuS?=
 =?us-ascii?Q?WhXTtUcWqQ8kX1J5YxcRZHOWNy8K/W0CNZOVym6PfrWaC9DvruHm8c71AE7X?=
 =?us-ascii?Q?2TA8qIuYh0UvoEKEEz9yeN+o6U8rtbNoRvDFLJRe7lfm6kVl0kOwVqX4Op2f?=
 =?us-ascii?Q?syY2DS3OMP0EWINEPiVrSGm1DzKmfcLV9Lpu9M1yYSpN1e8+5jFEp5h8pojc?=
 =?us-ascii?Q?FEjREMpnCe5YnZxqoPiqxR1mpA5BjHRgCF9+hTmP0qbohjSDh4ajehFz7P5B?=
 =?us-ascii?Q?FKYiViab2eJ4QkgkN7Eiel9kmE8ldg/i9CW0xps5P/HFIy6bs0X2lrUvrhBk?=
 =?us-ascii?Q?ry0FexyOMEEYn+gpz3LCnqaapCROKsqSchgMe0r8lH3pvtPbKJlDBG2Qse7Y?=
 =?us-ascii?Q?jtkUTOl+wciKrY6MiTYAYl61omK7JqXJVmvp1TBMbNwmviXWn1tHWXQ5c6Vl?=
 =?us-ascii?Q?GCLseO8QAb2eAOJuokh5qspap12fnzcCNyfpBTuNNVDn7TxXzVZdxGvLLrot?=
 =?us-ascii?Q?Rg3KEqpQg4LaNtYx14aPn7sG4jbDDm4WaCrQKVW5RuNVYY9GVtjhoYXBJ/B5?=
 =?us-ascii?Q?Giz6IYMGSf4mYBMmKxMVuWlewHh7/ogD0xEjqO+xbLJUvIz3vBHzRoFbefJc?=
 =?us-ascii?Q?3aA4UPHQYMG+WbSdBw4yFg2DRDQ3e963Y9xZ3kVCOJu+wBpFq7Ra67EonOTL?=
 =?us-ascii?Q?c+n31E6OU2JVGfntEgiyNTPw/rZQ8eofobACwDvmGO3usU4sUuLhSR6sa12V?=
 =?us-ascii?Q?U0vI9y9VXJ3GcWc7lH1R0Gnbt9q0fHXzf4k7Tx+gYi7cFqr+zwyw/lMTYewR?=
 =?us-ascii?Q?PvioSPMXwytYzL0oJ++ZW77mhnBWNbXy78IeovqikXo5c3HDIViQPH0Y/7WF?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac10ead0-c540-40d0-f216-08dd94301a74
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 04:14:08.2885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9okwdzmVGhwziGWcH7dyCVu4nVLcPd37XVDe0XMzfKH5qaJJwxRhuBNWJzq2x8jACGehTddNGj2H68fgvDRWymOpXQsgfFIhNhbAuISrxyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7093

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This patch set adds support for the address bus size limitation by
allocating buffers with in a 32 bit address range.

-Add device tree binding to enable a quirk to support a limited address
bus size.
-Update ITS node for Agilex5 with dma_32bit_quirk.
-Add implementation to configure gfp flags to allocate buffers within
32 bit addressable range when quirk is set.

Adrian Ng Ho Yin (3):
  dt-bindings: interrupt-controller: arm,gic-v3-its: Add quirk to
    support 32 bit addressable range
  arm64: dts: socfpga: agilex5: Add dma_32bit_quirk in GIC ITS node
  irqchip: gic-v3-its: add support for 32bit addressing

 .../interrupt-controller/arm,gic-v3.yaml      |  5 ++++
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  1 +
 drivers/irqchip/irq-gic-v3-its.c              | 23 +++++++++++++++----
 3 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.49.GIT

