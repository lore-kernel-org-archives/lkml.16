Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011070.outbound.protection.outlook.com [52.101.57.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C83242901;
	Fri, 16 May 2025 04:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747368861; cv=fail; b=jSGix36gjgu3JuvixAx3sLoe+aFRf9Cc5Ip5EY7MpgnenkkZYKeKfgQ41cJYk0mShz9NWanDWYZjzfhzsnljou2LNxad06HAYI26KXjwLE2HBrIDGYLMA/6m/oAUj+40gfG77f5UFHeuYsj7lBCGLT+5iKA2Qnh8VTTbISJM07M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747368861; c=relaxed/simple;
	bh=7Uro2zqg18eISd2o/00ro2HMKWYW/uICs7fSs2Qm4mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QNcUApiMV1GUQJQDpE7TED4iWXvALPTzMm/HKHEYzdQz4e/xsZ1OyM5vUpDuiTbigdLnYj+vPb56AQqE3Uka8UcsiYKfHIFXl7i8tEwCqGuUHUqLWxrJejohZLHsmoJBXu9/TxBDUetu1CD1o67ttkkrIvuyewRyund9PXRNeEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=iMIj5eiV; arc=fail smtp.client-ip=52.101.57.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="iMIj5eiV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpGhhAJZn0jG9/1rDix+aTTiUy5EeiQ6tb1eCNhUuXKTYj2QESHoyi4btnfMYCjN/3U1bpuduGU2Zzi7pEh5FpqCLn1HJ13lV+KlIDo9EBvOwFSR2l9Ot56ZRWyFl9b2nW6RWnPWZ2xeP0oTw94Pbpo/vo4eTwpbnjttw2avUCz9efqbrIno7+T+91xK8QIKX5ZsLUTW4gGnTjH7HMkvvcUN6ppAjlKUZuYB5/gSGZrb4jMNGtTYpGButcFQB/2E43P6HLv89KcjbSy51E9yaT0/L8K91Z4CmV2gUWPCnqaKLn2IKC9synB65PhS6IXwBxQtHapoDTBlUdwMH0V/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShVmcE3qiGPetk2TIlrcBnmiytJEjuwn5yDri4lQRuU=;
 b=oItcWqRnby2axkCLJJ2jt8JbO3PWpqB7gheildczFwRQ8t+OotwnLMcJcQo53zQBKEy/EvjpUXvC/vR1xqurAeZ1rFpNPgl64y/b2znQ+XD9xlN0dpULyh1thsbvb83d1Ikg1PkStu+pItyoQMI4AEeE3FB7Gn6SGjHjard/hvc0zfzBivkIcSfmNXZHoqtOGGfKFLi7858aAP1S7dBwoTYfJHNFXihpBHSv9n4NMowCU9A3qgJ61RAo+SOAGtFD2BHauELbW7AOviCkYHnd1LeVMIYzElwwM7Ne2YOMJARdD4GmRr7f4Uah9iCqVOFIqxCWOUEsW434zAAY8qtnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShVmcE3qiGPetk2TIlrcBnmiytJEjuwn5yDri4lQRuU=;
 b=iMIj5eiVcNakqJZE5uy8qGsmHD8DFrTuLD1V4WCp/0tn+fnTi0cJSA9gicoMRFFu5Ls/ovShx17K6UFDufqjktfv+oVK97K0plnAMBXFCYqrSCfU9kANfJ/qNZkont6e1qdVi9n6XJudc74gBZwDztj0phfvdtKiXzUJNQLmtMMfALVPeIWSCM13StIN52CRjbnTyn6Yz5xdIoTBjOnDF2J4JLtCq0qXPsqNEfKz1EDys/hidrsIBapLvmz19GGHbx+KdHqD4OqNA3PvmwsVcH8KwxGnMSxfWeJEw3M5ENTfeZoabyFQNN2/bml3GmkUX+2jH4c2u/w4MO1qtarQyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7093.namprd03.prod.outlook.com (2603:10b6:a03:4fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 04:14:16 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 04:14:16 +0000
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
Cc: adrianhoyin.ng@altera.com,
	Matthew Gerlach <matthew.gerlach@altrera.com>
Subject: [PATCH 2/3] arm64: dts: socfpga: agilex5: Add dma_32bit_quirk in GIC ITS node
Date: Fri, 16 May 2025 12:13:33 +0800
Message-ID: <d07c5660e9db837382956b24e4b063cdb3902f2a.1747368554.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1747368554.git.adrianhoyin.ng@altera.com>
References: <cover.1747368554.git.adrianhoyin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 683fb367-8601-4373-ed2c-08dd94301f5d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L/aMHRtCK0M0yg8r1GcGcOmMwx9CbU0NW4BwIntqwSEE+IElEtfuyr5VAw4w?=
 =?us-ascii?Q?qyVnPtdyx8evDdKe9pXYyU3bKDE7SBwuK//F35ha2orF2aOpoSQcN3pDZZpG?=
 =?us-ascii?Q?XGIMjwkVmL8/TNz0/KgE7K9x/4chqtMFMUy+o+9oyZ0KXqDQTE6Jq016Ig/r?=
 =?us-ascii?Q?eKkZ/yXCkiqiGQAGLzkKEdNqMBQ5JeNu+/LlGRqPALNqS/mSZX4C/qVFzk8a?=
 =?us-ascii?Q?hikQZsZov7yOMGoyKtrLHFENNvwTIlPMe+scCxd66yqkpIsm1MIBTxRO8Sem?=
 =?us-ascii?Q?wiZRTBzFbK6KmKpafzma0sMReufaVgHqvXqdWYfUDbQa4Ejr3UWdqYo5ZG7k?=
 =?us-ascii?Q?hvJLCy7uJRu7s4aUWDGV5M3TFgdVa3ChYo5uSviZq0m7qWV6XUC/SKuw7hw5?=
 =?us-ascii?Q?kfPINMvmI7aQmDpPr9gQdlTnFE54Mk0dLaUulT3X1c2GzinA4gwyVfA4aoeK?=
 =?us-ascii?Q?v8UsteG7xhVv+BwgfS0KM15sq54+b981/dOKaVnEHwoENt/+uRW9dqgLolkZ?=
 =?us-ascii?Q?39Hzirrh5gUBHsauZQtfYZsHCUf2sLjENeDPDgfM81qHqafUQ2MWD02TQYR+?=
 =?us-ascii?Q?HZZ4nWR0+4ehfFK4vtyxb1x2bYE6qVbtxA5NSUC3B1tvR7eli+zztVzQ3PDd?=
 =?us-ascii?Q?Py/7B5T+a++sM0+OPM2rGsOyKWML0tmwcNnu2s/+dXNbZcUSRYXKKjCX7Uep?=
 =?us-ascii?Q?JtQ9Rr+/CVlA509WreObxhVwpBisI21BF/fAf+kG7Lrt/whRj60qjWNG1IXS?=
 =?us-ascii?Q?u6t4796I7nHwTQnmwH/ULJOWTxzAwZE5zJm5XwZVkONs+iGMpZ0fv3x0TIb3?=
 =?us-ascii?Q?0OZ1b2p/B98IKGEZkY6Cd8wvfxeU6r8zdZM/AgisGrjQSkn1DiNdWKsHS7HD?=
 =?us-ascii?Q?s0fwdnka6x50Lga2sLYSQVePMsflxVHFLU9uiuWyVJqn37YLi/J8iS+rBVWm?=
 =?us-ascii?Q?YB6wEAJy+tR/xdbgGjZrsh0W6GmtDskSoh7cKhLp9Ssg4UrXiMql9kHX2+iK?=
 =?us-ascii?Q?lMiNhyBbgMHAoHhRljtNfVqbKrD+c9OfyG6Bn3Mm/29omllpqrNF1CgJRBV4?=
 =?us-ascii?Q?SwENfPfeHShfQWfKlTryoBmwXZNSe7PgISvErwSdl85JmoE+VYbybzrS8QDv?=
 =?us-ascii?Q?6QqZum3TqnFQUmCphwTi2WRykmkbGvfNeXW0h/7ETsuKOVPnOcdl7s1RXhMQ?=
 =?us-ascii?Q?V4UN987JnsN2IptjcV3szZBK0hvnb8nzIFgnX9u9D5F63SEfFWIS+C/fa353?=
 =?us-ascii?Q?vsQIGW3Jybf5I1als/D6u9kY6lIQiwKVjAig3RNN/QSO/fe2GMVUILxDNTcq?=
 =?us-ascii?Q?ctO1zjrv5xBTd/UmbCaT8Y4o73sILdXARXbIz3t+2vpgDq0PSwMVXicj17DL?=
 =?us-ascii?Q?6gpRPbBRvLj4WiyWdQqGAA48kRaEsbKri5y/KMRClGwhumFmyoR4gjoBzUNv?=
 =?us-ascii?Q?JUFNfzUwA8A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KC4O7X6Uz25VRj7b+HYcmWkQmEdwNUQqd0/O9I9eJ8cVqqGGy5q73vcOeHqr?=
 =?us-ascii?Q?jCipg11TRJpBRqOfTHuNpMkOZUnnkeZE9UZ3DI0WPk45/AkG2M5i2aUCZE96?=
 =?us-ascii?Q?g9zjf7H7/wW97BOlsvVUzt0DwSgcq9YNl2P4B+w0dNqX7YwJCvWxZ0gRlNOV?=
 =?us-ascii?Q?KH88Y7bgpcxojlKw4t1CHPN6kxCf2c/8EDIUbc98uzAXE3XEdef7JVc8qNpo?=
 =?us-ascii?Q?lKgblwQ8pi5UVNNIhzFleVrt/6i5Ny8EfDqck2b8XbhTTnp7Q74GDjlqOISy?=
 =?us-ascii?Q?09Hhvxf7uGqHIM2+6SUl+K6JLUKiYk2XxSu7FjzvDj4uvD24NsAD5VtcvvSF?=
 =?us-ascii?Q?ggAi/gtrL+Q9Ek+d+wo7Ga32wuwQj+dE5m/OL1kw3046pr0UFEDCrAIFE03t?=
 =?us-ascii?Q?4yaybRNPUM0ZAdvgHp6/7Ux10NmW16+NlBe4017TEyVER9hoOdTUvvmMxy5l?=
 =?us-ascii?Q?ky20A+UArlOkLX+AyWYdFrTJXJUrZz+jPdkJxHacC+DBToUt2BlPDQ9EcIy1?=
 =?us-ascii?Q?OcRXSPMMKtGtYWoyL9QTMEhjGWqddmv3lidVh8Oj5FF19Etdt986yy+C4rvL?=
 =?us-ascii?Q?ZmCYtAZ2UtxTTNqJuizh5WWSQDAYpDV4KJHfbw4CD+rJZn0ISmo7muECka2Z?=
 =?us-ascii?Q?q/yLRfnsNaI72lCfqEIK76DSj8IA+S0yfBXvWUk0F10zTnbuaOlLzyThHDqT?=
 =?us-ascii?Q?W0lgLAbb/OZ2IdMW9WhCsXp9f0DzdoZroY4A3v5A46M9XGS63eqQCe3ewLtm?=
 =?us-ascii?Q?h6MGxSPvZ1lQd/saMETFUjdQhu20VsSNNvbzED8XVlL4sdz5bkj2Py43JcxN?=
 =?us-ascii?Q?+BMIovOpkXdRSOtXiQzfLZ3Vc/4xKfs0CXFvSB5O8jX0aj5Hb7eUPnRSDiSc?=
 =?us-ascii?Q?A+ERPCTR9jBH+4Q/xO7VqxARzu3XYfM3ipM2D9vQQHImwcIMUO1R6cTSYBP4?=
 =?us-ascii?Q?/0eHG2y2nwPUNfV5pvRDWo4DLR+deFbIzEJjPhwmTx+hm1mwfSQa0CBr1pMS?=
 =?us-ascii?Q?KQh6xM2HkugIAmbsIea3CAp2hIIWEdbZ0ilN2JjcakwNlYbtbV4yvJuPXS97?=
 =?us-ascii?Q?lfa6aIZXfW94f1xpORS+c99J8LN+IKfZyXKdCkECX2lyK4Oqe0I0lo3Nr7Oz?=
 =?us-ascii?Q?NS43BmY8H9URNTy2jgqaqLTjwkwMFeXTaJ3rXQnwrE14QE7hRw8aHXML66+m?=
 =?us-ascii?Q?5MWIDAz0BeIphyUdoCw+Q93QAXMaHCRRNY4k9qCzPVXG8VnLu65VCowX5yjV?=
 =?us-ascii?Q?m2rIZOOCFs9QAQGFDNexoA3j2SYAImhZGUr9rMhioH/6HjVQj6z9TveHPz9J?=
 =?us-ascii?Q?n2K211vAUiJfz185DFM7AzwXvdn/TYnsHncVkftGzmF7a6q/6gQnh8DfIhT+?=
 =?us-ascii?Q?4B0tTkMuQJ+tnqlZePInswDI2OMaDPwPloBWxtaKmeRoYUEySO5zYjI2JAlD?=
 =?us-ascii?Q?ob9MbMQENv25WUeuztaHHof58y/leXT/OQ0rxlFozS/a6hE9tBgwfUsn3O1d?=
 =?us-ascii?Q?ZhgGFkZCId+JFlA4W1dOfSx4e9SjViYdJ1q+qjwV/LKWBULRaFik1sDNKeTW?=
 =?us-ascii?Q?ZUnOIZqjI8/uqk8VRqMZ9Xm/zg0gbmeLwc/M0nuhvYISJhSLFusJr7x1jCYa?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683fb367-8601-4373-ed2c-08dd94301f5d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 04:14:16.5160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TMQ8nTSZ9fOeL2bZtAtf3RahQf5A1gpmttpJegA9Ssoi+JJmQrIWGUweh3o89Lorg6Mf9dH588N061/BJvkK+xpob0jQMbbILft0+feDMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7093

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add dma_32bit_quirk in GIC ITS node in Agilex5 dtsi to address hardware
addressing limitation.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altrera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 51c6e19e40b8..e53e8aee3cf9 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -82,6 +82,7 @@ its: msi-controller@1d040000 {
 			compatible = "arm,gic-v3-its";
 			reg = <0x0 0x1d040000 0x0 0x20000>;
 			msi-controller;
+			dma-32bit-quirk;
 			#msi-cells = <1>;
 		};
 	};
-- 
2.49.GIT

