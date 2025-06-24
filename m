Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27A24A06F;
	Tue, 24 Jun 2025 06:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747960; cv=fail; b=qAit3zDZE+RhHxHnU8Iaekvs3PhRzWnUHI/AFEXpERBIUkeblWZ1m5ddv9AZQ2HiPCdWeyvKPOpF76ufmVplbB1mbsOnnoNr2qDclv4ca5uTMnnO7trp/iFq70iFS2OIM0Locu1hnloerjjsKG6prKb4sjgrzDOwp32uCJP4BSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747960; c=relaxed/simple;
	bh=Pe7IY24yNNFt1JBxPFga5jBzh/So+BwE8PU6iuliZhU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DbInTMZUKufroMA19ynqxw5fIrM/MhUJZ8Z2pdMF/DR+VbYJCUMYSLgstdBVzjJkcAL5ezHVZHoZLMFyfet44KVMpnRyQqnoLK8WtK502vQ84FNR6neJ/6i3ApdVomrzgu5e1TPN2AewnMPOUXMTbA6ZJ/YW3qcZVSxpiNpVHW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=dWwTKECF; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="dWwTKECF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr3rACS7SLh80z+rgxq2buI50dXMdk/87VhZL8WVJPWgAVKPreRSWtq4U5EtVcKIUwb+1qiG03aCgDuUSQF3sRkAEFNcCkP5kD63wra/0G+0QiLK0M6lM0aGXjort/RdpNY0axafxnGndy2txfWiVmM2nw6FBUPwENEV4ekwWQqfK6zjoCAXQCiUeXAePSd0+qia2ffT+E4Fo3Np128BNm5ZurcLKV4LsRf20C/asuppMZOcMGwC3q0h84Er99XIMzlcrPnMbhGsHShhdqmXfqOwXdYYhhsPzkHwiHz+OrWeZO0K8xb32TIJZ/rOYvwzmJE3X3JFAaabN8UzFqjHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DWhYKZvRWveLcGjFWcbllkKmRWNRnPl9ZVcKPEnX3Q=;
 b=gS14XAUsXcetC4GZJJvqnZ6cN+rVpViEaAGwAWl0JV5mpH+RkOOLVBj3w6oMmW+lwlTlXxQnrT+4bBaS3kasVlik5JqNGsAJnQPNynaIOAtxADyLxhcQ/TWOpfM0a+3VE2Fc6gDjtadaySrlByRGTE9wohDlSAJfuFjJlgn+TgeiQEVcm5E8Vac3GIDWWHVFcMqW8pzgTxdmt8lP29f0MIvkBMhM+4mJv13wEMOkyk7Wuk3s4uVLkkLejBWGOdECoifVaSJXP5kBGwy6VH/eKQ/HBEcnZLFTqNMpDa1RawwywGhHg5F2s3KZhg+lxbCEztVcjLrtnuO2kFUCjRuRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DWhYKZvRWveLcGjFWcbllkKmRWNRnPl9ZVcKPEnX3Q=;
 b=dWwTKECFlcOBaY8eK+rukDD6hJ44QbzLN5/TL/SZ/sC7F1mIRamoMkxxmWKP7iBWdw7Rbz3K9KsO6QviSHl6bOdIEBQ9ZKek7wmg52lfWh2IFSbKqYgkHH3GGr0q4H5WiYHoNsESqLfHL6qZEPH5FVNztBj1gac0shNZtsnj4rVfATRRcQm+UXM4maJtpAIINHM617k7nqVlwNisyFOeCUxB8yGnVHALAyqjB1W29FP1ouSo6XgZvMugb3Ps1R/GWrnJYQ2HoI8K9mC3zFjDgJgg24IVSULdc0BRfhE1LKUKdcXk6NQJW4K32jZKHS8esgXcB5p1Hr/LRewbGHA6lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6089.namprd03.prod.outlook.com (2603:10b6:408:11a::9)
 by PH0PR03MB6335.namprd03.prod.outlook.com (2603:10b6:510:aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 06:52:34 +0000
Received: from BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37]) by BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:52:34 +0000
From: yankei.fong@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH 0/4] Add 4-bit SPI bus width on target devices
Date: Tue, 24 Jun 2025 14:52:24 +0800
Message-Id: <cover.1750747163.git.yan.kei.fong@altera.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 1f321921-9819-4f47-0f91-08ddb2ebb266
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/rUnEG6IV6e1M88kmN98z1p2gKVYQUehdy1xd4WxG/ZwmZUrCsSXdWQFZqCR?=
 =?us-ascii?Q?tznpYGrJU4twBb396N+lztJVp0jdHajWE5sKzBAwPVsE+bL6eVKpdM1mbBxp?=
 =?us-ascii?Q?R6sh0DW1RH39f26Ygtmj8PdLKGzaeDQSCDZO5ul6sB8Szi8X3uT3++HDa62G?=
 =?us-ascii?Q?m7n6wT9HX1mjCTyqP5jPDWkz8ympObHkZjZ//A1ghBptc8kL2c6ZpBu1QEIT?=
 =?us-ascii?Q?NEmWt8y+DRc7oKZKACjngoD3uTIz5fkfTTuqP0CGDMoT1Gw9oAylYDCSnvK8?=
 =?us-ascii?Q?75A54ID9nXzv4zs/EuwDBoRvVDzwok2rlAqDNBzvFPmhVE1PY2NAqSBJ9AGp?=
 =?us-ascii?Q?TyFhmMCxIVy2hzY2eWljldhwteZk5kVzqYkoJYnVID8dBYTwb8O8U1MYd29+?=
 =?us-ascii?Q?oyS+cjHG7TKGJqU9Ta83EWa6wQLNJy98f5AGDFoMVOQJZ4nyRhyE/gSY8Zqv?=
 =?us-ascii?Q?iSfo05jM31wbXR0e7DvvGkSaeqrLDqof7jTmVg2JPKF21mktb64UpYFD0OC+?=
 =?us-ascii?Q?hiD7sgbBiwTQwl9nAEzX9aMmPozg8NTA6cUkd9OEZOm/qZSdD6bgUzR/z7j3?=
 =?us-ascii?Q?nxXzNVpXy0GItD2S6wrobBY4NjzdhMIzioy1MPofaBeBtRHPtp1DRGOKPopw?=
 =?us-ascii?Q?xrTDIYXdfdvchh122BgzNvGquJ/fM54AbHXsBQWSaPivIpznvbfQsTCIzg+a?=
 =?us-ascii?Q?+Aijy4c+cP54zdYPmHuVzIFWRJiWzDZNPn0fZg3LA9QGCdheYlR7sn8SPHAC?=
 =?us-ascii?Q?l3itv/GvcZYa+26/3GLIKMi7UiSRyQ8BndD8TATvWV55DE6xfnXL3hpfpQgm?=
 =?us-ascii?Q?2FjPo0Q8BJ9o06pq6Y9HSMP09IbNwcdx+DoPddgjAbjJQbp7XwLd4XwNbeHf?=
 =?us-ascii?Q?gPDLBgYyvcBzCu3UAbkEKcvrQaNYdyY4e5o8jNr6w/nw12Q+dutT8xZ/W7UE?=
 =?us-ascii?Q?ylpcc/X5T2J+BVrg8QLbZYl01Hy7+GoIySlxkuRte5BjvSrQwO7weBZNNnMN?=
 =?us-ascii?Q?9UgXGjXPLQh28g2pgT8LNCAmwPRrgTtONx9zKDAjKa2NqJzhLvfhMPed0E3D?=
 =?us-ascii?Q?BtT6KnNKUFqhn/vGXfC1XKCmRo118ajfe6rK2Ynyzh0r60mRWTUaVqpjBd39?=
 =?us-ascii?Q?pOGYf5O9Z0R05Y9y6H2/bFaBbK6tju8njfGFwg6N0y9RpBF8AIO4VnexP4+X?=
 =?us-ascii?Q?NKZpQXB7fCrgt5i9juXHPDZznHutXaRaTSLok6SdcnWeaDSuwGLI37G43kAk?=
 =?us-ascii?Q?iwoNOzUZWsAmGqSR8qTbTrpDNnA4aK37x0xQRCsaTdeUUE4QAW/2R9+Sq2p0?=
 =?us-ascii?Q?AwjVDYan1N2chPO7so92HYPSKmUBI2JGui9XB6e6J6TZl1ZBHcvVJc8Rn+72?=
 =?us-ascii?Q?EDszRF+SAa71a/nPSBsnd7etAa3A9rKephDgaRcAqMfykAl1Q/7RlD19j0qW?=
 =?us-ascii?Q?dejTiMjTP7U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6089.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jRSS0n3Ou3wK7WZK27mHLyF1f5A9QCRUZj7PLrFCSf8sCSOaib82qIyJNZe4?=
 =?us-ascii?Q?ybjx5WPylkDmH50mMiCM2mOmihZZ8QPfhqyKu7B1abpo3AX8IKYZ+nFpCdfn?=
 =?us-ascii?Q?XOYrTDH0oZ5s3Fb8bxGKP9bC4sTC2d5xNCkZemtyOOMldZJcUHdGD4Qf3Hh5?=
 =?us-ascii?Q?WxXJyjTNNM+ntGWwsW5XSd+R2MPn3xN9LoPmvukNdMxkIEu6xtA8JUUSPDF9?=
 =?us-ascii?Q?3R3zlNmuATIO+Kk23KFxF9BFkMc/pbx29UJLzZ46RIysbK91PluoEoa/Tb7g?=
 =?us-ascii?Q?J6Gigl7h3uhT+WDxT4q1rOh3nGpuX0fnD4LhhhXDkGDEgMoJCpSmpIRsAvnh?=
 =?us-ascii?Q?RptSqi+mesFrrycC4x5xguQn8wjTQxOIfcfzaHSPAuPUedQEwOq++hHVRoPq?=
 =?us-ascii?Q?dgAcdOKNZiWXUT2ZIj2YWLqTBJeI0WjJMfVRDYI/a2fU46dBQajuHA5f8Cwq?=
 =?us-ascii?Q?Z2AIDDedUrtbALdK1YUZoEbpvWlHCVAUrYLoibE9tRTGvQR/b3UKNZiRkF6Z?=
 =?us-ascii?Q?YJR5UYHa1mL4YddfsEMCCvcPAHTAA85sxPqjHswm0l1taYVACsAkXFemslt3?=
 =?us-ascii?Q?mXyuit12tHFaey72G8FyER651Rae8Gf2h9VcdzEUuE1SYYy0HRTqmVIG2Jht?=
 =?us-ascii?Q?O6pYq1jJmApYAWEBvbcjTcpfu2Nx4hcrvOMJn1Assgxq+uN2DjevxPZbKFGE?=
 =?us-ascii?Q?CQU6kvrQ6yQ+3cm3RKN05IExgUw3L5oztvuwFzDZZmNA1Q2e9nQDzYLKFtH0?=
 =?us-ascii?Q?lujFSosV/aIsF+qFLlRrUDwNes13FlKXES4JCBe+EZAzzKjldnzOZsQSuMlR?=
 =?us-ascii?Q?MB30YUjdvQDGDOiNyNU+DBA8Xh3dluboTWCZR70KwXaxsiED0YKWdETBi0yY?=
 =?us-ascii?Q?ylUSF3b1asbon38mAX8TxZDDBTY2aj+N3PtJv/VK2BP34cUkoXo0G+ZGNKpS?=
 =?us-ascii?Q?WWLMwoqT0WvKZPsNvsBegIu70GEkToWiwSLWak0YQMJTxIgBBM5cymN6FJNn?=
 =?us-ascii?Q?L90nYa63ajbj/ijj2a4D93tn8uAKqJnxHuZXfPeYFCGK4aQd505iIDXyYzbw?=
 =?us-ascii?Q?9KVIONxNsGurPv9TMQWpwIArIPAyLhqC2By9wuPH5t8W8xTwOIazVHPmuo0+?=
 =?us-ascii?Q?enc3DgI/RjZ9t3q/MBZOYWHCzCBxBb2Ri3Q9I6cd2++5v/vAHVVgYYiOZ1fX?=
 =?us-ascii?Q?fOfnDW6SCaMjESkQr+BGDwEsOZ15kWvkCiiRQFvR+gWlTgwZBBQSZxmUmoGX?=
 =?us-ascii?Q?9RJCC7kEDL5KjvUkdgSZc9c7jZpmYn97eAQe3TBwkhmSZgB0A3kOq7aP4CvZ?=
 =?us-ascii?Q?6K2zSo2CQsXxEw2zR58iuJzfP/flXmtPP/BDJ+8gldGEeBoQK7UgczyfXEVC?=
 =?us-ascii?Q?QZhHoEkEt4oZhegwn2dO9fd0drqMjaNzAvCqSnNl5hnkIKsTx3WV/qcIBrFZ?=
 =?us-ascii?Q?fq9LpzLj+39FbRN3nxY4ZbESGNQ44/DUpCfqCJLM6olSyaCSjdvBLiTVIvfP?=
 =?us-ascii?Q?MgSX2iOKwYgWTGb8mS6wkdYHqkURmv7pcqw+NE3nnkZw1RCWQf53EMAy7ec0?=
 =?us-ascii?Q?7AmHMUe4jrXiUDkxv1QjtxF5Wy50hExxGkAPlVPt?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f321921-9819-4f47-0f91-08ddb2ebb266
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6089.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 06:52:34.0301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: is2LTRGgfJ88Xd4/vqrGbfTS2R7RKuNN6m/J0pUXmoFHs6PavP3pUAj3OLqlUfH2p+wsnAMC1ER5MPSqo8qW/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6335

From: "Fong, Yan Kei" <yan.kei.fong@altera.com>

Add SPI bus width properties to correctly describe the hardware on the following devices:
 - Stratix10
 - Agilex
 - Agilex5
 - N5X

Fong, Yan Kei (4):
  arm64: dts: socfpga: n5x: Add 4-bit SPI bus width
  arm64: dts: socfpga: stratix10: Add 4-bit SPI bus width
  arm64: dts: socfpga: agilex: Add 4-bit SPI bus width
  arm64: dts: socfpga: agilex5: Add 4-bit SPI bus width

 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts    | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts     | 2 ++
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts        | 2 ++
 4 files changed, 8 insertions(+)

-- 
2.25.1

