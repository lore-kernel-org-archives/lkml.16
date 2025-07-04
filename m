Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7431B2F4314
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619061; cv=fail; b=Czwvo6g96i0/sMVhRcXHk6L1OKYRPGiY9BluCkaVH4AkE47QxwJhbAa4NhM+yU7jnzX9C8r/JIhatZLN/rZSqAGWwVRYz8NRkd6lUuASOQIY038I/ZdA10GyVx+b05VPS0dnfcodGxdSlewpoMDgtziSaZjwZ46cBMAXRbC+JqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619061; c=relaxed/simple;
	bh=oZGccEatqT4hhmBFfAKwqTRQ9TyG3Wpg2J8/khuiL7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Du1bDIqL5gNLLzCQ1Z6iVyQ7aYl0MALm6E29HzhPlHkl+IO4G81N/IHhJH25aNcrQsz1qHr4jK3pZ7Mu1cO/BZZM3pEITSf618DQ5kKcnxWcTU2PrpzOOuOrWKY4v/JKmXASD2womrfxpnyMisoY8a7pCOdCO34CPz3kNMxoVDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=mte2OBnt; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="mte2OBnt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ct282gzQzt2onJRs6733W/phupH3bspJQQcNpCcAJhvlweqwIDvV3Qzk3pPizSLs+oyzPyOLNIM/uXBguK3a4n8+fieaI4HExSrVmS42RNdzvK3yDCdw3xQU0C8DqOZxSJ1wz7OQTfuOqcfeOu+iz4d59S9Upy5RnQ6zY4wAEK50sGhkSmVhhZ+vK3wg19lvf4N2trVfkF2A7guYx5M9gerNpjM9subPX/uexcJy3eov+bey4qH99EVV4XAxDORbgt97/frrLlybAIa3nGcrZyR2c/eUm6PBvQDTTW2ot6p4aJ/7kaYSW+P36VeRfJY01AuSBmLJkZXoWYMykf1ihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crT64RcOFvlHG5ije/LzJxpTVT80F7QWqyR2ChhoFTc=;
 b=mqBQ5qCoHrGeFFcQUA+Hebo3dpBJsVYzMXDJWJSDg57ZMljIk+98Pory15I207q1rnsC06HkmESe5wVA1oLaHuseZoY0drqQ1tWB1UKSrhv5cgekXDMY+mKKW56lKQhQxEQDHv0VcJSUdE8TZV0sHBHDY7jBjQzWsiFM9fUH1VREW/tr6EAfwN8QWq3g7mKLspfR/lGxg09Bk2bzwoFAcB1B0qENeR6sW33n/BDEsT5d5je1frfblA+txYyOEBmLFziVOeGnMusD3Lk+L/SQtiKO8URgO/+9nWo0bCVnFJdgCmyLBFsFSX5qOXKBK9cuaWD76lWOiLAWGqfhVUWGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crT64RcOFvlHG5ije/LzJxpTVT80F7QWqyR2ChhoFTc=;
 b=mte2OBntrnTW6uod/q98v0MHY1MM325bcbUQdw9T5w9M3piyzIjaU9VpMafm44dEggEhler+DqSpRAg3yWaCcSP2HGZzjDN9NE/+azVlKgHRdq9zoXX/7Owr/UIdWiuXFC/aV1drJ6mR6pSpWl46qYEbBgBrBA8X/9ZBkb4izHet/ytE71G69IWU1dx3mpV0IzYTo29ZMyb2ebBNwV/m1jFc1aRcWpA8K+2aZ6f6d+DpgPQ8wQRxS3WkooSPYm6YnHm0oLdHTpYJzsjvthciliyUb/FMWvTHZI5tKimtQHOKxfiN1z1CKseIPDsv5h4/5pAvxVfYUCN0GpJhLNxK/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA1PR03MB7099.namprd03.prod.outlook.com (2603:10b6:806:330::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 08:50:58 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 08:50:58 +0000
From: adrianhoyin.ng@altera.com
To: maz@kernel.org,
	tglx@linutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 1/1] irqchip/gic-v3: Add Altera Agilex5 address bus width limitation workaround
Date: Fri,  4 Jul 2025 16:49:50 +0800
Message-ID: <6a44509ca0edaabc17e59d2e27fef1c782183456.1751618484.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1751618484.git.adrianhoyin.ng@altera.com>
References: <cover.1751618484.git.adrianhoyin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA1PR03MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 529b8021-a5ee-4001-7fb7-08ddbad7e514
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3pHtRErd/rkZFHjrq/deXTeDgqC0DClWbK7DuUsrQOXzHZ74byLCfAVlhP+J?=
 =?us-ascii?Q?s91uo9ev/aZ6g+Cr6wCmm9T9u+HJcMx6aKGNJcYDt2JNSFo4GU6LZH7MmFMA?=
 =?us-ascii?Q?9xpVEUK4oYDHMOzAecnj427xXJRoef7RzQMCCPODFuLGGwXZi8irMqmzqJpW?=
 =?us-ascii?Q?T2PX6BdcfjOxS5nV7x7iS6P+0mzXdQ8AMCiqFlymk3r5XcraitYF28BrZ4Nx?=
 =?us-ascii?Q?ST3iDU5UxuO2/1MECEqR7b9S+crs2j57Kx5uNhqqnurQqZIrcyDfcg/kLxLM?=
 =?us-ascii?Q?bObCBxWdEKRmamNouTNa0UY/IPGhiOoRZcbTilrgTRtbQ2YL6RpOwrLJMgCh?=
 =?us-ascii?Q?6lELvBpNsvslod98AHrmdRjbetSR2f8NDIR9m2Kq0/QuONVtC4AA18j17dsK?=
 =?us-ascii?Q?jVYnHKFUpsVut68H0hmYFnrqkUwH3mL7tCFn7Z9nDxfly8Gtx1nkdV3zkNyj?=
 =?us-ascii?Q?0fjG9JH7L2buWDNC2hgY1+2G5GLSjnmEYjtyZJIipInvtDj4gQW+kppgYFM5?=
 =?us-ascii?Q?Ui1jcCcXvvzZ1106/LlxECKTrGHmIy0HxOFKOM1MsXfHDT5VYfr70KHCEwQv?=
 =?us-ascii?Q?xMMujH7x+rrYJ+pwP594eB4pSp2xy2bqBl2geWc+3q/HYbnRPTvR2n2OI67b?=
 =?us-ascii?Q?0fhiiESUje99veNoBxf0BBJnYIOZptr318GqE0M5oai+VfBS0IczagGST0hx?=
 =?us-ascii?Q?Ic/zZ2LvmHlgglGDaScH09jwB78TE9GHzNvxuEQm8XrD1MJmLo3DtG52F/B2?=
 =?us-ascii?Q?yo2TO24CcYfQCPtyaoxgLPqDjw/fhvGUuCF4MPlbnUQeTFqJ/4w7yuHFKQmp?=
 =?us-ascii?Q?hZ7xOzIxjxCxTw6MinPxJXmu1wxxyyzyBazpYbpjuqVsVN5z3/skysTeogAP?=
 =?us-ascii?Q?clCmkYlKhEBE95ifDWrcI93W8V0s0zKxcJ8f9sNALbRkQsNdQQBJpWDCAUK9?=
 =?us-ascii?Q?Tm5L3kplI2oMhwLbWVLkoLmsUY6BS52vqtvqwBVWGAOKgO5BylA2e3Ej54Ex?=
 =?us-ascii?Q?oKry7MD3aiFii5FYHkAfnfvhV8MGDF/BCG+nKovueZGgIWaOtSZAkoDZjDIY?=
 =?us-ascii?Q?FqZd5f37aPGvrC6NFteT60RkiHcBYsSgrdtM+qOx//f9/rDEv8TJP9qmuWcF?=
 =?us-ascii?Q?snqRsdwYxwyFl7CRfeud6FTD3/lJc4LOrGZDFvGiBWiLULTJjnKzdKiBjJL0?=
 =?us-ascii?Q?mKn8o0DDFRvRNkGl62rHBckzfw2W6N68MtW2n++lZT5EONFpwh7CW2+fOAEt?=
 =?us-ascii?Q?0s4P4EagfdJTuF+rBFPooHk6X3l1vw7JSGdw41HReLskyPGf1UGJ7PM1xPkc?=
 =?us-ascii?Q?UcyZNKSdLNdCDZ84baIUOgwpOTgyKN30WYtPF7CW9Q6BowO2ciloPyuOIbGE?=
 =?us-ascii?Q?FLYiuikm99dsKClfa7mACLaoU3sASBVGHchza2202DCieNNtV++Z5OFmJofp?=
 =?us-ascii?Q?+KAlXzpU3qw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8VlHjMR22bpPupI/pFwlKw4tFWqVLCs+yG/8nLENJDgCf7TFgv1BJdktm9ur?=
 =?us-ascii?Q?45eRhprF1Mf0PDrIxn53nHVm+RsWXpWkJRrzHaNS62nuEMY3dgoTlaMZUq4n?=
 =?us-ascii?Q?kjKOaT2UFOZYE/cZSN4zx32CK+O3CPS0YQgE/Ih1BOc1WSFjrHjlcQBmFU9g?=
 =?us-ascii?Q?WXC2VORRG66LzRW79f3q9BmGps0TU/ajxfuKpWudtoxqtTTpzOIGq6buPy8e?=
 =?us-ascii?Q?FAnHaEcuxmqnUioN1wAG3Fxg4vBzMfqTOK0FrX5jIbDDKYb9JZmRGasoWpKL?=
 =?us-ascii?Q?HVT+6mGGPp7n6nx1RKOgUqkV9p3gatVZymoll91S1Nx5nXZv6Pm80h8VOoj0?=
 =?us-ascii?Q?w3fK8m4PZdfWMvzNZetB4M/1A9nuplrcT9c+goglYm4HG4zu/YL7ePw52PL6?=
 =?us-ascii?Q?+oRqag1zUltgrdpeu7Nf3VM6lYOdWlXvAglBTaUWNBEys7t6Mj05YpduuafS?=
 =?us-ascii?Q?zR3aS+Q8kpu4xbnlKfSEidEjM8bEHKT2HBP8a+s6KRHJgG3uJtY3nZY530Bo?=
 =?us-ascii?Q?xA8Kt2m9Rcc5OU2g3j2nUXht/+0VDCiMPno+nBH21VXcsrpaJ9AOn1cJY42b?=
 =?us-ascii?Q?KDFWQrRnjUqwyZHnTik+X5ez2B8pPCkXAhl8uaZiwg+3mIDnajXZBGQHrdnJ?=
 =?us-ascii?Q?SEDvVFj0Dbmhu/9xp8w6Hl0HQM5zqkwgxSyabgkqM3nZtxEXgIAHegZHQQsq?=
 =?us-ascii?Q?HXgK+STQLl5ITt1else/JxRi5+TaZh0K7OGSGyr5e+S5ifwKZqRCbI0ybrB4?=
 =?us-ascii?Q?b4KalqmUmQqW2D6iyKFrNl3BxV8afcQY0LoKB3D9Q8KMA+A/8FtcuT6qcxya?=
 =?us-ascii?Q?BsmsxL3UJ6VlJ8l5X3wqgl7ckUGeYkQZmcYPq7b1H+OA/IbpRtbBdDHwlRTM?=
 =?us-ascii?Q?aiHhzv9Fsgq9Sf/qWDb8UULJvS3XByZgttV6HgO13AcLY6DC8HzqYiGZl4+Q?=
 =?us-ascii?Q?0YasNekJ7yWAobxZGfHpzvloETsgOnpxf20L+0DFn9AwvIdVkp9Z2LQZOjz7?=
 =?us-ascii?Q?N7ZRB8ZkegSjf0ZAVF4ZCKcM5clvKEigJCV2/DtPPZptcRoS5BoXX4amMSLS?=
 =?us-ascii?Q?xMcgzohayTKkOiQrqFrg19u0ZcC1F9Ng7n5TDBbxEWRa8OeVHJML68Hz6ArY?=
 =?us-ascii?Q?2o5+may5xvvipnkMWgcMK5uVr/UZKPrNufOHAXl83SvFY/moIwWvO6wSocQj?=
 =?us-ascii?Q?tEkPZRRxmb+OfG/BiViYNhd6OkOyY+YMHZDNBDHaktTjJM1TMAiPKkZg5/52?=
 =?us-ascii?Q?REVlWvI2k3Uhvh1ihxSi7bH1ImMLVTJW/zrWeFDHnQ+8M5Xts4q1RMf6Z8T2?=
 =?us-ascii?Q?Gq5TLXZUiqaIv2vWpUqplWtSFeYI0mn5u1J9hmZNOlOJj2Y/lj6Qvvqaw73L?=
 =?us-ascii?Q?mzpIHd8JMnv++Zd1N3dyD8ag9XprLIk4QE2evJEoP0XrxIPb8pz+8hDQ3YYS?=
 =?us-ascii?Q?U4tBFFnpbyYh6+94A26GqpIaCNywtCoTWRC7EuIcJmkYWH9G9GUbmzt1lZyX?=
 =?us-ascii?Q?NKuYj6gvIX8L4EqffTwqh7OyteuhVe7uEM3a0lz86DSDxRxs5HkNnfc8QUuF?=
 =?us-ascii?Q?AmswdK64drhwalnDFsZ2RW6CokjTACQz1rn27WRJ6LuSKGqLO9gwEsj7GmGW?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529b8021-a5ee-4001-7fb7-08ddbad7e514
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:50:58.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vexXsy3Vl3JJiWaaoZ9rFCWcnPpkWvKyXrLTBZ7487XnrqdVY+r/mRCxnzlm5V2c3rdbTE5gr/Z3wGaRuYYsxl6gSwlXH9TJlMEHbKskrbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7099

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Agilex5 address bus width for the ACE-lite interface is only 32 bits.
Hence the GIC600 SoC integration for Agilex5 can only access the first
32bit of the physical address space.

Add quirk to configure the gfp flag to allocate memory within 32bit
addressable range. As the 0x0201743b GIC600 ID is not specific to
Altera, of_machine_is_compatible() is added.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 arch/arm64/Kconfig               | 10 ++++++++++
 drivers/irqchip/irq-gic-v3-its.c | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af337..2286b4d378e2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1348,6 +1348,16 @@ config SOCIONEXT_SYNQUACER_PREITS
 
 	  If unsure, say Y.
 
+config ALTERA_AGILEX5_ADDR_BUS_WIDTH_LIMITATION
+	bool "Altera Agilex: GIC600 can not access physical addresses higher than 4GB"
+	default y
+	help
+	  Agilex5 address bus width for the ACE-lite interface is only 32 bits. Hence
+	  the GIC600 SoC integration for Agilex5 can only access the first 32bit of the
+	  physical address space.
+
+	  If unsure, say Y.
+
 endmenu # "ARM errata workarounds via the alternatives framework"
 
 choice
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index d54fa0638dc4..a2cf401568e7 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4901,6 +4901,16 @@ static bool __maybe_unused its_enable_rk3568002(void *data)
 	return true;
 }
 
+static bool __maybe_unused its_enable_agilex5(void *data)
+{
+	if (!of_machine_is_compatible("intel,socfpga-agilex5"))
+		return false;
+
+	gfp_flags_quirk |= GFP_DMA32;
+
+	return true;
+}
+
 static const struct gic_quirk its_quirks[] = {
 #ifdef CONFIG_CAVIUM_ERRATUM_22375
 	{
@@ -4975,6 +4985,14 @@ static const struct gic_quirk its_quirks[] = {
 		.mask   = 0xffffffff,
 		.init   = its_enable_rk3568002,
 	},
+#endif
+#ifdef ALTERA_AGILEX5_ADDR_BUS_WIDTH_LIMITATION
+	{
+		.desc   = "ITS: Altera Agilex5 address bus width limitation",
+		.iidr   = 0x0201743b,
+		.mask   = 0xffffffff,
+		.init   = its_enable_agilex5,
+	},
 #endif
 	{
 	}
-- 
2.49.GIT

