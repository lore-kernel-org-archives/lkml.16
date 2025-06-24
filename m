Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB3424EAAB;
	Tue, 24 Jun 2025 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747962; cv=fail; b=EESURKQ3DCohgMm6sc1ICuhSMs7oxzDKgvv/HWX+y03wA4udqGUZ134D1jDp0tuX6UbzB5BKdDLBu/RnWHtOWAOWNv5YAfrwYHGinHIFglV+BOpVC5QibdxEAufQB/E0YIguX63EdtODc+b/lWN6Kli/BWRMRgJvofIud3wpzv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747962; c=relaxed/simple;
	bh=La4GdSy/3D7T7q64Ul2DlpjvxzKjgxXXjOLK0tyXbXw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BksDEi/SrYRRDbdTf5GnX/DfKA76JHXtBZmZtdofbVLU8VDEXRGQLgoCvdtfWKERYlAS2ONLFCmYk8kYQA9ztIV5vRwCwpZfUl2DQ/8+UjqNZTwykdKedBp8+DdgXEIP8JP1SPJTA5uKDhEVu1gn33k1up6f6ia1/R5hFGKABPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=gXVZeVMB; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="gXVZeVMB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNwhm6FVB1ZKnL4rOJ51pjH8+wkXRFaxzCgxG93FJSe6UP+hdWAIjTTpdKp8G6r9kGm9YZN1TnqXtcdV8u/1GIndmqDZaT4XmrydX7wh0KRQJCalutlEZ6eEb33lUauPi+3BeqVcPQ1EUifa9wH+jN+B1lt4h1oyJeMYEbkhrmVBIr3q2S0MYxoiSGzSRMZxLGOM/ie5tMZEz8es968SXqh6FKfx8Pf4GpQDDotee0bSTyL6QZAvyJ30U+tg58uC4MXACaeRm3PwOhKLjFBeoE6uoGYpuXxn3DbSqc+LdNyMn4jsD9aKz9/PG+OjztS+dqb0IrAuuMUujcNF+8BWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BV+0b3rzceVM4bEdl9iG/hnDxCMY913Zw8yHoLTwzPI=;
 b=mg9GTUIY18eMDTkEOcmtY2sZ5MtzFcyK4kcVAnTMD1oA4s8I6+SQSJkZHltLgjBsnPZ27mM6Ta616q2yd8HTJAwLOQaD1v0n2f9D+xMDkPKBMXR3/izrl6b6hKSjacnXcPvK4P5fjNPprMmyAJ8pR5QNwrQqzs8u8HE2WY6FXwU0Fl73jjnNG9ukKqrLg5bJoaD4B3OiklWc0iQCMoX47jK3O9bnkZLpTwncCe80bn8b4vxZb6+QS5cAeaaFBwtPO0sTLCRtJdDD9GTcwgbULPBiuJWMxXd090QWL7+ilO4JIGJcdIn2qCsFF5v9xEiuvB1M2A1WTVWqzB9SavBqFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BV+0b3rzceVM4bEdl9iG/hnDxCMY913Zw8yHoLTwzPI=;
 b=gXVZeVMB+PiafJsIx8cqUqRlhS9moRGRE/rmSX1Redl1K0medefkcYjJ9YdMPLPfHE+IEFCR+XQi4ksQk05A0u2EVvf3RHZLJlA5+o8EzMT4ZxdTh7HfyqGZRKT3Nw/qDOinaHCdtsZbCoulV6By9rbNz2kLNqhzNiiS4heKEVgrkBl0Xr8kyj+J4wveltF0ixHwD9/afDtAvszjJcX+OkEIoFQ03No1Z3u0AEztkbgNLGXxPuncGRaU3f0nL+uF1zCuuDIbLwve9LUjvojkQeXy2JP4nGIBMlYnFQr3naN1TM8BrLHwwCf6xjeobIcv2di9FgANlgAyo5vm9YfoUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6089.namprd03.prod.outlook.com (2603:10b6:408:11a::9)
 by PH0PR03MB6335.namprd03.prod.outlook.com (2603:10b6:510:aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 06:52:38 +0000
Received: from BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37]) by BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:52:37 +0000
From: yankei.fong@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH 1/4] arm64: dts: socfpga: n5x: Add 4-bit SPI bus width
Date: Tue, 24 Jun 2025 14:52:25 +0800
Message-Id: <c55786bc081c29e9819dec3090d96230bd6a369c.1750747163.git.yan.kei.fong@altera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1750747163.git.yan.kei.fong@altera.com>
References: <cover.1750747163.git.yan.kei.fong@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::31) To BN9PR03MB6089.namprd03.prod.outlook.com
 (2603:10b6:408:11a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6089:EE_|PH0PR03MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 9310a0b2-05d5-46a2-fb60-08ddb2ebb451
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YploeMIBZiJpC9Umm7pdXFIl04eaGpmHx4yngAJUKlYHETEtaAS1xH4s20dT?=
 =?us-ascii?Q?HnOvNvSI4cnYvSIIRf4PzRIxkm7PLWuuY78ULBZNpWGsVgOaSHp9yC6baFAs?=
 =?us-ascii?Q?R2qZqC70IqPYeDk6ewyn2utBNfVAPNjbq2ZboH0aYkLnQN4YjTa6MFJWPiOw?=
 =?us-ascii?Q?pvVHwQ6WtIeNRdBUsTA+XCH4ThHFq78eegr/U/cdMQCvIYiygM3/ZLRKve9s?=
 =?us-ascii?Q?PIhN5ziX1Y4LULNzo+H1U0D+li1dNtue/+MnhbW/XBKXe1Io4/y2SL3RQzuI?=
 =?us-ascii?Q?iw/nsB7qbtbMW2R0+5o0U0qXKBl2aL1SyJNWRAyhn1j2HV0dMp+j35N4jbf+?=
 =?us-ascii?Q?QCAhYCW8nr2raCzSsxxOVBM8936UOA3EzhUndQVYbmQLSt0JOdFoLgckusZG?=
 =?us-ascii?Q?HxQB8nbFUWDhmLNL+kWhiSoNGJvx5erEVrsN1RITKmT5qJMe29l6AlLnKp8H?=
 =?us-ascii?Q?YA1pZKzXqFhrG6+EMw78jKe0G0ZnLk2BkA0+/KylgEC1TZmdeLqBB4nbfk/Q?=
 =?us-ascii?Q?fgq4vFVsbVQ3s7sT6ynIhtIKAcIUyP2jO993Q5d3PgIYQWhbx/R96d8r5V/H?=
 =?us-ascii?Q?lbI7mEOkQZuqsIKfOHCbNp+0eGLX1AhhDnBDc1LUQZIO/4bK6DVBMDiP+6Aq?=
 =?us-ascii?Q?aVNywwqQ4GgpY2SO95EDPZmWaWhVfg+kFF0CNdYYtlPOVHu1lyU7e0cBXv8d?=
 =?us-ascii?Q?WHIPptxjwblB5+COJesAPRYwSamsc5TUTvJYVNgXpgS2/57DIg23VLP7kGAL?=
 =?us-ascii?Q?nTBiNDClC/PTaJP+IFqJtpyid69p9B7R+Xz2XM5znvvbvxidmKYA8cGY3e8X?=
 =?us-ascii?Q?c1VVmAVuBAd1G37nxaFqph4VI+2Y5y0QAOE3TLuXdLK/Jt3kC1l71jEfrIac?=
 =?us-ascii?Q?g/7GSEGtrQlIamLdMRXn4CqQuRWDIJzdINrDqEhWBYTA8kd0pFuEY3dYBz5E?=
 =?us-ascii?Q?4GSh1m828qzkSObF4Wjkay4G7ZQYufiRdi64UK6b0F/MQcKq1Nwg3r/I1gfv?=
 =?us-ascii?Q?9nvf5rfPx0HO3puZg4mfsOX5R9g3k/qMmYvIwc+IFU9pNYPVBLFwXxs3S+lc?=
 =?us-ascii?Q?JMrwE9enKzci0dIGjD0e8XdieUQdYJoW2NARz5p3n/w7Oz/EDvXbLln1ITud?=
 =?us-ascii?Q?SB5EYlyIkhSQxzFz0K6/t5GbKyyGixkD2bt9n1oFllYYWa465bwQ+TNHtIRW?=
 =?us-ascii?Q?4bF3w/z8aI3EWCGgZhtQLtkObxanXcVqNTr8hTGyTi0lVrGZ+/dVbFghklsf?=
 =?us-ascii?Q?maKxKMwHd+xrwXpJ8wCJQitAFh/8XEv1a7COZlBxF14+gn5iU4LDLUGHwQoZ?=
 =?us-ascii?Q?txGjmQxbu2Yhe0uFU3ZPu8utCrg1TMLzqrH2ffKbY0XYAhYqz5WCBySNrxWc?=
 =?us-ascii?Q?N6IxwFGwv08Cpx76rhovlAQpwp3Njk5Fhz4DMgXebNf9ztP3XfhmHfi2OBPV?=
 =?us-ascii?Q?tJI6x/lvVPA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6089.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OQ9TXX36J7metal9CxybRLqv5QIxVJBpK/3mnynVFnur0YQzSndJQqQ906y1?=
 =?us-ascii?Q?sn7N9JubAXIIVcJYTQN6oobP2dNGXhUdbZ8lsSkAAsBmRMEPPsMS2PsK31hk?=
 =?us-ascii?Q?697oFdMrAoBLLov9H6zMXEJCNG3a9wmtb25MHgV65hGk9GkAIOdWP69RdDPE?=
 =?us-ascii?Q?wGQpPZ6Hbyyc3fdYFmD1QNthVjgYlPdhoNiGP7Q0BGtBmTusQMtWTFm05rdp?=
 =?us-ascii?Q?5kFDshq0KPH5moKFUHDPora396rDg2SHRD243/VcbGGDRT946ZPIG/lNLzYi?=
 =?us-ascii?Q?OXxAL+XOXB0TjqfwnKnt0NMfSC/Au6Ns3Ipr5DDz5hIs6yIdlWNn7NnFkYjg?=
 =?us-ascii?Q?dJjiW3K8FEbZ7rIrrpJz0U72q/36RVzxksDFssKnMWX2rIKwopoZDKDGNjvO?=
 =?us-ascii?Q?N5YIYgqCM8LyJCuo44CMv5kkoGv7JeOxcwh+b0scJGdM8uCBw57c7fpmXSJg?=
 =?us-ascii?Q?ZBX23uJE0ENRDZMG4zgwLiRgGs8xeGleJA70TIgCddoUB7cOUL7LMFRdorU2?=
 =?us-ascii?Q?0kUzrQGalvwfGDrIJnRSVBN79/36DbKinABdkgaza+VK5HObe7SK4EQ4/FZi?=
 =?us-ascii?Q?D7bXUvxo7gcJEIX2F++JbCX7/ZclTHkt6b8U0hmx5FhnFMGbvEs6RJSiUb9j?=
 =?us-ascii?Q?rTdY8r6fB5s7FXua77jtJsnilTl3QoAvV3t0qfUqWgtAXbEJHky5ZSjbdCGw?=
 =?us-ascii?Q?r4hF2fPirDvPN6Z2c2cauz3rCm5bByP5CyKtGHm6sa3sSMX3gcgH5pJW2FaM?=
 =?us-ascii?Q?osAMMkNNh/oD3uKCFVRMwMMbkkyRyOkSZISd8GEDE1b7J/a47dXd0l+4hqQo?=
 =?us-ascii?Q?aTSgvDuKqpmN5aT6hQFFiJUQc1RmC6ISXVSEf33vjz/lSgr9xwDFhWTGouL0?=
 =?us-ascii?Q?1zpU3u1nrEKrAS8kTNwApdJo5Li5pjm7ASyDF/FLTBDK41HcWx//yDdiO4Rl?=
 =?us-ascii?Q?OzJTJIHKu+DEclbnSG+RHJWmYQY/j9oLPMCS1XEt3ipkNgVbac21Mu+tEPmE?=
 =?us-ascii?Q?Xxnxl446hi+21xadQl/4UOFLQBQ6dFEYNSsFECwlxD/y9XwfmKT9qfbI6sdo?=
 =?us-ascii?Q?oXdmEtSeaaTKVeIbSPyEmPAJBn5JpjiHIftAfgc4eFkbk/IZzKczYpcdvtF1?=
 =?us-ascii?Q?1H/3W0KHfSPXDkGKbDkW0JiNHKRc2+EEESDGKRtDOe1HfwNUkwoOXNLmFfZH?=
 =?us-ascii?Q?9P4Rbt3Ccdkpc1MDvpbTr0IFjm/818CcDKNBzPxqt97K5jtBNXakkS3cjejj?=
 =?us-ascii?Q?VpPd+XL83QiQVHCYC7bBfrNWuG2VVwL7JibQuZHJF6Cbh5iNeqndb4cdcJtu?=
 =?us-ascii?Q?p2+34NPVXtJPtlYdqtYPQogOqwPHHcvO5qizD+ydUcOUsq5sc3ZNPtfeCBQR?=
 =?us-ascii?Q?S9vSz5GEzzQkTTF/rbazoMkW9Uab8aapiTYv7SKganIZ8FHRpDKpGfdJLVPu?=
 =?us-ascii?Q?TuuAwAENog+6h/NCg3xdK77onWlcJO1NajR6Z4dRFJBfvvNPUKCiO+PMkmi+?=
 =?us-ascii?Q?oN/Zl5Drog8nkQKoXk1ViAjLuBpGqmqAK/wx7/NAarHQ0oGVQCCn1w9Or9ka?=
 =?us-ascii?Q?Yrw9mH+XuJ5DL29MHfXMqKh5HcRe7hxKoI1aHJBV?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9310a0b2-05d5-46a2-fb60-08ddb2ebb451
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6089.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 06:52:37.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxKoRJDFngc7Fv+VrHIwkILWQk5D5VYX1ulMiNjFOXA9FGV66fQ9CShNwzKGYP1KQH6Y0uaBP/IiXFHkf4WM0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6335

From: "Fong, Yan Kei" <yan.kei.fong@altera.com>

Add spi-tx-bus-width and spi-rx-bus-width properties with
value 4 to the n5x device tree.
This update configures the SPI controller to use a 4-bit
bus width for both transmission and reception,
potentially improving SPI throughput and
matching the hardware capabilities more closely.

Signed-off-by: Fong, Yan Kei <yan.kei.fong@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
index 7952c7f47cc2..0034a4897220 100644
--- a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
@@ -93,6 +93,8 @@ flash@0 {
 		cdns,tsd2d-ns = <50>;
 		cdns,tchsh-ns = <4>;
 		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.25.1

