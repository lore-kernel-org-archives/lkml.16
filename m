Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC5B2550D0;
	Tue, 24 Jun 2025 06:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747968; cv=fail; b=dHUgFNcZMFUYTNFAqP568L0UiONGDjYeSFUdyBCpql/yjXtLBZCzqYUjihOQ50nUHinLTMeAydpPfNYBaf6gQGsthrk+fikmJQ+slCdgbEJGyJ16X0v95V5U0JTCoRDh/xSY6L2lo2SqQAq4RJ+j5pKF8sbkZ6zFyEcQ4T7rzOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747968; c=relaxed/simple;
	bh=w6LkDXab+8dY2Vxpcy92S3mEkHIyrwp8NYIwDCTnp2U=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h19Eu4mvfmZnkw17mX7sZs7WAtigQFt8TBJr1mtwwg8amydyJ9tsvkaUxFabYlEJLqzSPP5aywP2m/Kmu9VKTBlTd0XoFcwFy5mR6FIVfIsN3wM9ymkJYNYMmyH0et+0UOv4g/fvRRnm2sF4d4Til/Fl8R5TKwnEzLzU5/XP+qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=WAt4gt0t; arc=fail smtp.client-ip=40.107.236.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="WAt4gt0t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZZ7l8K/lyYsuwiTVq11ZNCrihz735rIvfHWfcGy67TllfXG+neE7vAoEp5TE4mzCYTfIheDrDuNPXx7tLQeRcYyAlg5SRCJOcvdZH/nlJGTNXrTcQoalSBT8MRIEWHC330yiVBEE1pdOWihZpX6OwwiWISZdQG1JhrdvOS4zbXFsaaoQKknXEthK39MSqsqIVMbFUW6UZ3382nc1ycI+0KKY5LRdzRdNrztQUI2GsfBR2V2DGhbIM2vNb+XWRDdHApI6I03mmDRA1XyiselAzsfu1lFjralZISdO90bC9R0TZu6EFi2+3tPQ4mGPp5Zdo3mkA93drOgVdi0s+mhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX9KOKeqQ+rxnAPx0cSf50j/ZW587rYv6MJ1q4W5Uqk=;
 b=Gt+lXTNEYJAXCbR6wfSmc0U4QCE0mRll/eMFS/dV3RjuQwcvN4yYeP/kYs/DxztMXZX8bf4NObP7jlHp2yZhNv/qF3Kchd0V4CKlCqj2A7mABtKI+nOnF44C0rq7Z+5WY7NX12BBm02xCciFDt4+jpBenyg0zF2Pd0x1MSO9eDhNXdB+n56BVwAaHccZv/wrXBdXq/FwbWTRe9HlpeWHfCyVwbZDPezONvhVRKLk2ziGL9WVLX2pX2Gg1owU4+eFU+kREj7aQPlLQxM2GGyuW0CfnnZN5Q5tQwrpHGfRKQ3UDGwM4fV939+zagI67v+0S1+MtMoFiYdPfRFMG4286w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX9KOKeqQ+rxnAPx0cSf50j/ZW587rYv6MJ1q4W5Uqk=;
 b=WAt4gt0tJ3Se/d+MfH/YabgYh/CBakeBhv9fJYcqZR2XNHy42aZGNWKuQ98wryPGiwf8wHN2ZWDkCHnMTfHfrG+Hc3RsMIyVOO+cjKUEYHfi2e784F5HPA7wxMbcwr+9aB68z3MiOuBVAL1arVbFXyWVBgLmbSR0kE6FNbjDTijT7Mk2aeYo/OplN42XkX8VZgnLZBVa78e2Xd9IDFaBwTanXH9tLnlLdHcriMmX1WBJtZO+3VpEiznCumeqF84wKLGt1TmL64aa0SJC7fDnblqvHeGlVWZrNszRAc1QCBQ9LD2EISDl+YOsG73a0bcqIaKijOxQMPHJ7D89f7tvUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6089.namprd03.prod.outlook.com (2603:10b6:408:11a::9)
 by PH0PR03MB6335.namprd03.prod.outlook.com (2603:10b6:510:aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 06:52:43 +0000
Received: from BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37]) by BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:52:43 +0000
From: yankei.fong@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH 3/4] arm64: dts: socfpga: agilex: Add 4-bit SPI bus width
Date: Tue, 24 Jun 2025 14:52:27 +0800
Message-Id: <2ac6265700c56f341ed418b6ff285114e20f60ce.1750747163.git.yan.kei.fong@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4339368a-034a-4cbb-d6c3-08ddb2ebb816
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NjdIX6eRhtQk7FE72dt16Typ6Irwjcqme2ZQiZBJRik34I+zo1NK/ygfUv+z?=
 =?us-ascii?Q?kcJlQqfDB6nVCPB42zcId1m0FLpjJiNXQtpl5MKd0Sjb685FHS3IRcicCoMC?=
 =?us-ascii?Q?c9I4pXcEZjmSHkiqWt4yEvwHoZWjUzvlotA/US5MNbKFIfXzMaTasGznbftX?=
 =?us-ascii?Q?YbtXnytB8xy1uVI5O3PY0wlRRdpFxG9iwOQPr3YpsJzFxaE4J+J45Dvm0Qhc?=
 =?us-ascii?Q?Flre/JICkTSwwDSe2/SinWZWsN2oIc0Pq3BZavgA0z8aoX40p0fNs3xb2Ivl?=
 =?us-ascii?Q?6IzWiy2cJpjRIxZrFwDiBRvNTrKE5fzm74Jt2kQKqTQJKu6vlb5VEgG2Vrya?=
 =?us-ascii?Q?7ll8+rwcctDdzvbQZcQw8KZNRse93H0ZrJPHPVTjbhi6Acq6J4RUFyL69Mon?=
 =?us-ascii?Q?qocFO60rpnqsfS98P1Q9dCB4wHGCc9ZfLs7mh9Gf7opoyoUbwIAR4MB/cLzy?=
 =?us-ascii?Q?8ArEe8yd8o//Zk55xyE9SCWdmUWlLaKuM0YbKGNIGmZuDcezfoxNBLhBXB7r?=
 =?us-ascii?Q?+I9izBEdwGdKWLA0bG4ikUaiVPXJjr5QOuMKry92jJLebxO0E2TqANOB2mLi?=
 =?us-ascii?Q?pzgi//caevd6a/aEialKCqIQ1kD5HzUaex1wmSZBirvYyO0NrzESFWq1EBm7?=
 =?us-ascii?Q?rRNn35JxehArlFBTadSrBpY7TpXfeRIMpFEhXcEOf2uBADqp4Wp6Um4XsdmO?=
 =?us-ascii?Q?Gf0fybh1cyQi/WwtQGFjjuAFld7EoLwJzpf3ARTuWEDqBa+/Krh4ecyCmGfg?=
 =?us-ascii?Q?H3W52J3rplYlWsgCRpaXpOkQ8+TBs5v8zKsd+UQIM6uB4Ie92HDsckqxSzQ3?=
 =?us-ascii?Q?BtAjX/tOV1cEuhttaJIi0f2pW2SLW76G5ekCvR1U7XYhqmtDMSADaxnEmfrC?=
 =?us-ascii?Q?br/+m0Whf5dVlCy9r9gOkk9EUmvUQ23ZAkG11sFQYn+ayloQ9tOWdqg+5xcc?=
 =?us-ascii?Q?HOpiBBwpo9GMPUJoVaXeOX+PjYpTVv+roDt0pF3U2tbM0u/rmIpCe+92Ik9V?=
 =?us-ascii?Q?bOWoCjKi11m2pK5c/8v7lWVRs0UJtz8GkGoDkQFQUZ/x1fvYwGO5XgQb1VV0?=
 =?us-ascii?Q?shyBf0L/kTWAdlFgXT+Up9kX+vtgE1MgESE+9MzaQ/oTTZbn1oJRTgXR8OvC?=
 =?us-ascii?Q?1P/YIJaMZRUGAY4lHnLhqvum7XKScVU1bcs8Tre2bZMngkXiSOWr8MnnxgJH?=
 =?us-ascii?Q?qHlnywmmcr5bx64jikWwzWcty+5z+1QaZXwE2bKLgptUmjlOVy0iiPHGyfLB?=
 =?us-ascii?Q?eKAasDGmdAxP6ws8QErZq/cjZ+N28ZLmqFV4Ihsdp+8jJDskp9YmH8mGdMuW?=
 =?us-ascii?Q?UbuT1wXe48fLoeFzfgMrirYj84f59bXUquBviwhYZpy3w5pEOE2pfwFLrp1d?=
 =?us-ascii?Q?aCQ3HS1KTzIYTv4FM95Gahv3pK/dsMrnKPPVRN/zKFb9YCOTJiZyOvOlyLhM?=
 =?us-ascii?Q?mzgarhjCU9I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6089.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XMOM9JyM4FoyZPUjB9shmWUWcNmT8yaOf8+syOZFSLwtViiyy7JgLRYEu1/k?=
 =?us-ascii?Q?DHLdKvMzaL0XMJLtAXk3Tf6SkQqYm1M45RbyHv/pUfwWUb/wK/sDOLbg3sYi?=
 =?us-ascii?Q?yKeuUVbI3WiA4EKknOABfNA8/rt4eqZwmFXWx6GtkXP9JxtA62eEhQZGPQyw?=
 =?us-ascii?Q?C9DgNfUh5bcxHKI4E3zW11Ir3uVH+ciKpCDSpfmanES2gRYAA6OFlrzhXAFn?=
 =?us-ascii?Q?W2TZFtm3MBGoWKSCaHJs18RlCYlhfMwsv0VVnKRgS5fpPyZgVeozrpkacysY?=
 =?us-ascii?Q?+RwmTwmGF7IqZnP+rUjmE6JV+bAWX69y1hu82bfo3jWBep/IL5Wm18BAkvSi?=
 =?us-ascii?Q?iIRWibKPQtdf/f/QTH6CRi68GjVx6774L+PaIngQNXSqJqBOkrhDmfQBXpbf?=
 =?us-ascii?Q?3NQjbtcS6FZEsZyBAcaqQ2ryeD45G1YfHVD+yxRgcvdJgYDtBYrhvxXzSmKM?=
 =?us-ascii?Q?Slk3JkZhfJsCumWDhDKr5fH7BmEsOPd+p0b5YxtquKYDj8H9c1G021JZwf1Z?=
 =?us-ascii?Q?6apmVnwZt5qPKUAxDLr9NRRX8+zDqTEOk6MLiV3EX0RgSpdUUzlUqmckybAp?=
 =?us-ascii?Q?d0J7oAMJgt5bbh2VbstrqMcIekZOwSs9cuBsTv7srIElvw2cUDb5vC7qqwC/?=
 =?us-ascii?Q?rY1zdhlT1ZV2+R8GNv28kt+7l9D2ccHIvkzji06c3rPRTncPCOB+xmMbsfe3?=
 =?us-ascii?Q?atdKkUb6SWSBcrtEDyErAkyQU5gJqiB1DlKk48MvQd5RQucI3vyHxSBU5/Iz?=
 =?us-ascii?Q?bb6Er3ybgeRbbhhxdwd4TY38Ir03bIrF3WVqoP6HoJNTXkuXEEeNzmOg6Nyu?=
 =?us-ascii?Q?L/Vpr2z1biJjxUkDD6I1mvY/WKnh66OnGCOExz5ifR+0Fos+1fwt635E8wtI?=
 =?us-ascii?Q?qzl6LSKVnTQG8LZuFDCyYiHCXmOMuhs7JvtKqFbdDudmNHITIx3zRpWK458/?=
 =?us-ascii?Q?Mop3ao6kVQdpUQTU7ql6Lqb6AjqrjmnhSV2hXww/pw5E738btImvDJCbge9V?=
 =?us-ascii?Q?53BmH+BrRZ7H6tAfQCdiwGJlFJHhNXMDKeiFyIY4nV93orOuWE2ZxP7OYLvg?=
 =?us-ascii?Q?OgQeMakoxy1Ka8rQXwTKLAD5m8T+dRCbI78AFCPc4INImZ9/8m5wpZ2z9ROR?=
 =?us-ascii?Q?r6XPvhYjMx4RSh6nOl6GfQttKcNpoPdqlEk8SGYPr67mMcK7hWK/jYUbTPdc?=
 =?us-ascii?Q?NoKxrzxR6RKMVtIHQtbDKL4c16aRNnK7csKn076PnVOTmeuia02ECQ1yYNi8?=
 =?us-ascii?Q?KFFpwuUho8z+JJvAEvVYX8Clj1+XF2DXYmlPE/slIN3r/ZzeWc9PvKOO5s9Z?=
 =?us-ascii?Q?bGDIbEw0wdAohgBMvfV/ckQXJX8/3j6Xn0DqyYLjPehUOVgzZaMbR/3Vvmgp?=
 =?us-ascii?Q?ZPpfniKPlCjbr0B03INjPXWRYoc7lji7vaB1Y124K9WpUe33OuiwrPdnOaF3?=
 =?us-ascii?Q?vyYLtcyIecitwXhyNk3VkojYHJ14uxn+tsmDZ7bqKixJFxtQxJr6rDLEBnHq?=
 =?us-ascii?Q?OieGRg8VHoG5C49fLoB9RYGi6KsVylDK5YVrH6PlWYvSojG1ZRbEf/t60T7h?=
 =?us-ascii?Q?YFGkMJ6T5fAVoqLmhMAAWtzaT8NDTtAlnr0UOQm8?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4339368a-034a-4cbb-d6c3-08ddb2ebb816
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6089.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 06:52:43.5275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXOrf9Sqv3gt6PI5WVoD1kSTFdd4JisbxnjRLvpM4V5daQQYt2JdxTdtpArmLOq2QVcSC1trkGjTt+FVw4JHeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6335

From: "Fong, Yan Kei" <yan.kei.fong@altera.com>

Add spi-tx-bus-width and spi-rx-bus-width properties with
value 4 to the agilex device tree.
This update configures the SPI controller to use a 4-bit
bus width for both transmission and reception,
potentially improving SPI throughput and
matching the hardware capabilities more closely.

Signed-off-by: Fong, Yan Kei <yan.kei.fong@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index b31cfa6b802d..9ee312bae8d2 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -116,6 +116,8 @@ flash@0 {
 		cdns,tsd2d-ns = <50>;
 		cdns,tchsh-ns = <4>;
 		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.25.1

