Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F749255F27;
	Tue, 24 Jun 2025 06:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747970; cv=fail; b=KnwmKkGpeFkVdH55itXQew6GIpGhUWuT33PVAIw8q+eB25QgSxXs1UBiNOrdwdHGDFcY/x6ooBXLJceBkDMWidxHye6xBm3MIVGaZiX6CVkZ+7uJr8LZMG2HBp9KzesFtsS8lYcJPFJyo7KdVTgAb9ri6cFZPpbH9w1jLndluYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747970; c=relaxed/simple;
	bh=YdmzL/KVWV3oS8eFpvkGljpaj0Ar5EC8UPEt4tTcEjo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RZtgGkebrOfD25fJVmc3DounN4G5dqtQKuSFt00kYIyrMqOLFb/MprqyeIUCyIVi5S3w0lfyHOTywNk1jJrd651lMM5gjY1me+nZYYnSx0LQg1pfBWShW6Nrc0iLzXQN8Dn9uYUfBFIXi93YlgirW/w+g1BVM0jn+fP0Z6b4gUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=NdmGKnjf; arc=fail smtp.client-ip=40.107.236.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="NdmGKnjf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frdALnpTZ674wO7xbBFq9fV6YhcZwny5a4dwkp9Ogs0eOMKB/B84IF8ezHSkWlIjbBKlY35zvUguw53HEPktszHuy+FuaLi93L/aoSRRNZkFuDZwxakuYTWVQtWBJeQsXkRtp16vorb73PaiuWv2gVQilTGR99Oilu2/hAFqESv6CFr+Qy+N8bm3P+6ODC57qK44N03g3icuQ+unuaej6Y0mHGtTW+ou586nee9oqH7owEjEypLeDOQqeO7j50m9oMC3EeXdj4Da7c7j924kvUdUMzbl3VNIoetdUlFbReW6q8aSSoG5JNmv1iBCjoPxv5aqsofj3D3AW439ZpJwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKkbp7kt0q5NDBFRAmiuEBTlvTXPQB48csboL7bBG6g=;
 b=SWlIfJdzgy2QsmRu6r2T1aGI/ZaiFRmMy+auSpsyjayWfm4H1DxFQcqEby+gZzGIwh/zIZPu9rfnLD9dmcu6/R6xSDE/khohPm0qkSuVSwN59/RZ9iEsA41Ns4jpF5tCNspys4OX7B1Y0UB3w4E7QFHTwaSUdbyUVCwsBNiz0kjtVJMakPXqZpbhaomEcWz1fpnSTZdJdPk0v4jazqVoHYAxmKMbG6mnLgJ3I2GKbeQjwE/kHP5XV5oKOX8iWl+sF6MQCbu+45tgYCQhFdQec1CSm3MF6LYdXeGhtDpgUlGOw2JqQYa7nH810sG8eBx7Q32rvfvHE8/vVVhDmrPafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKkbp7kt0q5NDBFRAmiuEBTlvTXPQB48csboL7bBG6g=;
 b=NdmGKnjf6HBN/k0Z+gWXZjtQDTI0vPLa/EIl015hJtsUxOhum4DG0d3NN0u59wN35+n3ZLQkIGhKZJi2DXEnUUO+3e6cXnBolowkcBKYc++TyDSenmRy16Mvw10Sn/hEGRrPtGjWxrDGBrZsjJRdN25lP+mlCrnh7ICBWQOYvLDmZChsryqhmuOzrUaYb8T/CUZA6Iv6xZT6YlHwboH3ISJcIpeFOHnegux/wf0k8D9M1LBEUV+j7vk4S02OmRbIIvMkKb2/83lTtkpzwiOCP3C3oXHSjUfFphYrEYmK1yKrPD4jid52GGrLou+FYy28oZBalOKKSkvZhNoYBrxhhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6089.namprd03.prod.outlook.com (2603:10b6:408:11a::9)
 by PH0PR03MB6335.namprd03.prod.outlook.com (2603:10b6:510:aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 06:52:46 +0000
Received: from BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37]) by BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:52:46 +0000
From: yankei.fong@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH 4/4] arm64: dts: socfpga: agilex5: Add 4-bit SPI bus width
Date: Tue, 24 Jun 2025 14:52:28 +0800
Message-Id: <b822d960e1600ddc218bed1f927cceb65a3ede40.1750747163.git.yan.kei.fong@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1e259a0f-f7fb-4ba2-7b10-08ddb2ebb9f8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ybBP69CCBsFRduSpdFxuaDDmvmrz2Eq77y/yJ5OKI4f3JBXeZKdiRxcbKGu5?=
 =?us-ascii?Q?6sQqj0e1oiXZiPaZk2J6rdTxBxvGRPUmxP68A4JvkTTDE87b6veYOK1DzMFO?=
 =?us-ascii?Q?ub+nisQfw4dRUcqT/yxh3JnU8znjcqCRYEx40yBhTBtpPBV6Mq3yuR+0Z3tl?=
 =?us-ascii?Q?aaPv9fI24UWX8Brh3GURD29txkFQ6jCzcZJZ2QPOXfXq75KqarlS5hxOajkU?=
 =?us-ascii?Q?jlWc8KxDAdCP8NLzzd3D2GrSgfXdrUPQ9iqt0vW9xQRwW2l+0vmfLRObYODG?=
 =?us-ascii?Q?e7QttXnnDueZMwbVF14W49228In+4T5ohR43uVCOEi1EcNxTXlPNkPLDtz3e?=
 =?us-ascii?Q?nyQIAqHpjIDI2lFVM1bHRqSGL6ewwZohCIEzlDlevwsl+SDj1T4so5YurTUJ?=
 =?us-ascii?Q?wFgARu1j68Xpglnzbd9ukEmZfrOdJJOHfF3U+sytoRoq+eTAM5VS6CM0N0BS?=
 =?us-ascii?Q?4wTG7tvqsIEetKqMTB5R688cJW2bpUOIkFi8eE2pdghIBHSADqkEvUdE1MKx?=
 =?us-ascii?Q?xAI7O7meB1tam0ewS7g+CCxP9ELARnUnTQ8RXdnSOBn1DadPP4nrr0pUsVXn?=
 =?us-ascii?Q?AnTkhp6iXsJKOa3mLJHdZ1C8+m/+7NcFnaxyBMKbCqHWxrDAC3ErmzDMnh4l?=
 =?us-ascii?Q?yx+IoyUMD9GP7yIk3iS3vaCnVGoyIngx8Kcpk5v3wH0zwvGAP4tz2oZ7sPW+?=
 =?us-ascii?Q?+q8Wimi41gjWeQ23A4CZnp+E0IXHFAWmzFG0F8UF4OlHtfvfsM9YFETAWDjR?=
 =?us-ascii?Q?T2x50W7sss8EMgiORWtMkU3j5+ESOg8IrZh6DYiGpItlC4LkbwPKpoH7ZGpc?=
 =?us-ascii?Q?bWJDGC3AzIZEiMjECPj2Rzmm4UKdE3GcPzHQmKwM0gBIq0oZakwysVQMScan?=
 =?us-ascii?Q?4squN3u2RC00qgO9xAp6csUdBcXL+ylKizN5F0osg5y7sFblW3JsRbS430Hs?=
 =?us-ascii?Q?8Wya3zUvc3jVf/IXCFGdmnmvG4VWj97Sn2olGBJtkq5vDSl3vw1lKcvQp09K?=
 =?us-ascii?Q?t4WTlt2mPVa6v8lW83TsTvYCeR5cdMHov3Y2+2VbFy2w8xiIANLgsE+BzYPD?=
 =?us-ascii?Q?jXJSJAYNRTTxtQxSsB45f5u6anvaMjgpzveloaV/1QSg8E2P0KONpxkDCvqe?=
 =?us-ascii?Q?LPnfbO9CS6aZagAd+l7cUaa8e8+czktZo8M8E35j1OealJQnNF2DpOkAolbS?=
 =?us-ascii?Q?MdMP3WqoFL48wMoNglx5TMvnP306LLmJb9vcWJBbm8M34DSWYXz4p1SZ/Fzw?=
 =?us-ascii?Q?pScsHbtI21WzuT7txGnr5ps4Wb/mMqbSoAMT6QhghL9yUGT62sC82YyjQTg+?=
 =?us-ascii?Q?edjFDpjZ4x8AvW3HopTwhPzR0dDZWW14ZokpwT3CKueFA2KgjUtJCkSuO9zH?=
 =?us-ascii?Q?FIz50LNLVBwqRmTvW6rDLwabU13Q26LUwYrhrtqrAb3OsidDzlVTewRnDORS?=
 =?us-ascii?Q?t8YNuGf8JyI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6089.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UG9y2f9dWnfFop4SjVpUVRuVgZJHs4G999tXC/2pPh8BJf/XDH50UR294oYR?=
 =?us-ascii?Q?57wmWFu/oWG+Ge6UXtzLnO+h3RVzvNrmGCLOSVDc8X2BlKfQ0NFLV+i77noq?=
 =?us-ascii?Q?Fxs3P3CiycpxhP4yDp89EWEcY1WzGv5XuYyy11W8KSBkQeSC55XehapBIRhO?=
 =?us-ascii?Q?39qdQ3C+5fUkMoFf7vK4BlcI7ONtls4LLDfmO3eCNZz49KpMIUpRe4ansz/e?=
 =?us-ascii?Q?X1UkwgnqM3zB/daDIVJcaEUsAot+bysF3K0o7PI7ht9sDq0Tis6xhSkbaQhe?=
 =?us-ascii?Q?lkf2P+x6QJpZdeyy8QTCE/DASIQo71BDvKNAg87uiSjpS351GjGwRChpuRa8?=
 =?us-ascii?Q?t5doZ5c92JQ3HlDNm4egnEP4lCGhYggYVMc2AVjDNKcO7vCRbBeh3GB3lXM3?=
 =?us-ascii?Q?dUZNDo/OhqqzwtzeYeNIkGS0YRlXpPg5k/OSd2aEymFP4fV1R0R1BzP18OS6?=
 =?us-ascii?Q?twp2qoY8JvfWrh1gb9tTVGZnq5Yf/XEGh5sZXNmmReazsQ8j6ViLKgnuJ63b?=
 =?us-ascii?Q?7ABHjQ7NhRW50gAxRoO/8PUWQG2g7BHGIqwQ+S21FG06Xe0v4WAWoqGN5QiA?=
 =?us-ascii?Q?XfltIIR6JuengO9OBbB/nrUqbg8KMwd3XIyUTGho1T9zVcGexSw0ntXQjXgQ?=
 =?us-ascii?Q?Fh9vsd3mrxhCD/ZmKACd+8wqgiKFzwhYYBs6o/lZJzUUyr00J+8LEVWHW0rX?=
 =?us-ascii?Q?4TQnhpJKyC0LjgD1vJm/suvvDwbZyxgCs7cIzZmdIWlvimADy1QDBqhO6bvp?=
 =?us-ascii?Q?JRjgxXZGqlx4puB6ANUbbjLYLLUxREZ3eGCCP/AOnAI7u/aeVm6flbkBFAH8?=
 =?us-ascii?Q?Aw3unsb55jx/FtjUVp4odNVtE034r62cpQL11qAcIqa2orMGjJlt4eQjUXuS?=
 =?us-ascii?Q?EofQ9qP7JHbopphfh4CMc19ViY4Sw/lzhfhyIH0znBDKmHoRHmkZsDjZcr19?=
 =?us-ascii?Q?vKLzMimoeFXUjn4M5tFNHCDmT0A44N7HqjjUp1wBshHb+O0dARikc8q2VAuV?=
 =?us-ascii?Q?fcNl6FhWKbtxzQGOCCvHEDjPCPXMJLzleraP07hP4JJA5LpKU+V3C6BVjYrU?=
 =?us-ascii?Q?/qi3e9PQHaBQfSa3j1UbDVYLL13MWk8uhRAGEF3nRSpPLV6Dyaqunizx3Tud?=
 =?us-ascii?Q?CY+imtC35rRK8Zvhw0wIXcN5gqAdkS7sWxs5edxHxZh4F8J640zEYgsgSlk0?=
 =?us-ascii?Q?GxOabiRgVYRWfACw3mwsOYkH98QSVk0vSjCxkRMLCyNrAN5zSat0/JLALkwi?=
 =?us-ascii?Q?lxDDbAMESknu7QUgb9dq1fRl/m4rTxOAYLVqCLz2O9RPu/TeLNV3+Lz2vhC7?=
 =?us-ascii?Q?f6RXHAs1NmnW56U7FHbGjaZKv19T1YHnFOMwZivynOlpBdq3THAE7zbQ58Pu?=
 =?us-ascii?Q?mRKHzSX7M6/kr2qi18EjIrAjDHh7sB3oM1CngNPAW3z7hwBtMHnMwTVI0odg?=
 =?us-ascii?Q?nlRh3u8Ve8fozsM4m2O+VFnto8C+6lNuAae+9ermTu+hH3hUZ3Rf0TOH8Qlb?=
 =?us-ascii?Q?DsVN98B33os0iFTHtiZqPGrOTaEdTBXjPvt02N/PVy+oNGlPMr4Xn2z4uvHG?=
 =?us-ascii?Q?0kfe1JfFAh5rgPnPrhWnMIE3Dc3l4sUZjYgvXJ2G?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e259a0f-f7fb-4ba2-7b10-08ddb2ebb9f8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6089.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 06:52:46.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo4zfGQ0ocgNe65CEgYo08w8TbbmqtNFfe/S1+9wjxotqsRmFQTrWHvHeRkBj6dUZwoIrLzMpXUw6rfcPxG3yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6335

From: "Fong, Yan Kei" <yan.kei.fong@altera.com>

Add spi-tx-bus-width and spi-rx-bus-width properties with
value 4 to the agilex5 device tree.
This update configures the SPI controller to use a 4-bit
bus width for both transmission and reception,
potentially improving SPI throughput and
matching the hardware capabilities more closely.

Signed-off-by: Fong, Yan Kei <yan.kei.fong@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index d3b913b7902c..853e260c3976 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -57,6 +57,8 @@ flash@0 {
 		cdns,tsd2d-ns = <50>;
 		cdns,tchsh-ns = <4>;
 		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.25.1

