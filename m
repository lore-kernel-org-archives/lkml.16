Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9AD291889;
	Tue, 17 Jun 2025 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150798; cv=fail; b=N5bGbXlSAD1yHKvQbpBawe1G1LTApn/GfqcQyxlYObbHdxCp1osTSGdmJsI2Lxm0mBBVtTgoLvp9P3JWZmCL58He3uqsw0//VfL+/O0Kf5Q/9ZdcNAqiG5HxsrjLcCre6OFjHoO2PSvfjDgXYRc4V00Cy38G5BCbesItOzHoVv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150798; c=relaxed/simple;
	bh=U8rnPy8eT0gGZknWSGs4YND6OBkwtGVVNYFHR4cyi7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O85fFEUorb5E1yQCM1Xdztzrd21DkPYd02KsbXPZ6alNPkakqeEErAIB/XNIfCz3gjJOa3kDHgwt5j9YpnxTyaZsxwfDMUygA80u1RUNQwa3Af/PCxVzGlikY1u6dGP+hOq6te8JCDqumoa14MunpPu3G9B+5T5EQ+Ni8I1dc7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=gC7kPgyO; arc=fail smtp.client-ip=40.107.237.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="gC7kPgyO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WS84ykDF1wjbYJhjKkKraSzdpsmVfnV13KPTCmwlIRCPnIQw7vpKq1p106RfPgijCTxJY/MOMuR31iab0NWvAVYd4iOKHMxILd6TcI2P6VNmTOGKJS4Ce/DHn4tjIuEuQNVemHX42LKEbDzzkIvs6LznamW10voY18e150sNp+aCK+Dkz1jrU8fHDAf/nZovMEkSW4roGeFrsxp+WdpRv0id1AJCDaUO4PUpCERKQRBR7j0Sre8wV3+VhnabLDaxwJlDrWQ71j/X+7encC1/laV5cGJlf+RTWBJE1Y37uIS0MgV2qYcB9+zET1wwDiWr/qAsiBwDbvZdyoDEanpHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyFKmsW8qv6+5ogyKdrQOMBxI/8JXlr7eG3Xv8Xkl2I=;
 b=T6YeDRlGNbo64dS2/zuyvXwbGjKUxXluzSSzzQ30cO7xPhHdOWqhQd9TWTnH/X9mq2Pd4vlfgdc7hnAGmlswc/8xujj54MSVeua9OeMPzrWW/BrGMEtHmq/SFsAGC/3wS9Dw/L2/rFplhEWfiiQ022rklS69jR0jwVGRcZVfaFhWvZZMCQ+DoKY/Pyepk76bnxtP4CeLMBzvfPbg7+MoxhEZCSlUnXzer1se3UCNkgNFex1oL2FzMVT5RPhWLxmLaJ1YCeWwA/5nTKYPelzOIzSxkDSXiqNedmrEGeK4nMtlH9VPYhfxtuaOFEbj26fLhPKdVID8zUwkrqAH4NpPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyFKmsW8qv6+5ogyKdrQOMBxI/8JXlr7eG3Xv8Xkl2I=;
 b=gC7kPgyOXwHmqhLxD2Mzz3twTrUGvQbRezc6XQVSDtcV1xgF0F5jpp09OTyrJrXb42b3hkdsNy7VQd38+Q3tY34KW5ypF/xKDdR6T0vN3oIh0X8isEkgBZDr6t7hNgB0xIjKcpJO/u1oRP47TGCVOEsG8mcMu6r9iH3P91zETzN1d8jMOSMI7GKY56JIiTTzMovwM1Mn0YAQy+7LsOfZ0sBhk6kma5FGq2wEd91eBjbPFvhvVSxwUup4LQwIh7Uq/SdOV+00gcb0xhEkQ3hKKvZkMz1pmfFic7Yl4GYdpBXYs54WFNV18HR9YnMqU2i0eAZYnS/0y3Lsa3g4INmejw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW5PR03MB6982.namprd03.prod.outlook.com (2603:10b6:303:1a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 08:59:55 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 08:59:55 +0000
From: adrianhoyin.ng@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com,
	Kah Jing Lee <kah.jing.lee@intel.com>,
	Matthew Gerlach <matthew.gerlach@altrera.com>
Subject: [PATCH v2 2/2] arm64: dts: socfpga: agilex5: Add L2 and L3 cache
Date: Tue, 17 Jun 2025 16:58:55 +0800
Message-ID: <98fb3a621be0dec1ccd9cb1ec109101f31387663.1750150179.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1750150179.git.adrianhoyin.ng@altera.com>
References: <cover.1750150179.git.adrianhoyin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) To
 DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MW5PR03MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c029ce-772d-4184-57dc-08ddad7d5431
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Mx8Qcjsk9Eh65M4u2Pnj/D4R04mxhgQ9V4WpIfPW9cIQpYav6WcXgcVDN00?=
 =?us-ascii?Q?D0gkE8Xl0wwLbBgNoMie27d1bPIE41YA0CjkLiDftsQyu7xYrE9wc22B45jl?=
 =?us-ascii?Q?gEJs/zjj8ptH1UxsaalLZcS28xz9VpKBYXzT3kENkbKeFCzqc+LdoDmL90uO?=
 =?us-ascii?Q?VJzK+vaUNQMwLaWX6wSOcGCXdY+CwmxdgMuQZx71sEYkWcq3DxSEoKlFXo5Z?=
 =?us-ascii?Q?RYSZ+71aDNvHLmLNQ8j40WroPZdtodpK69aZYwirMeWH/zWvheQX2wsDPQS6?=
 =?us-ascii?Q?Pja5WNuTQ5+zAS9qMUQHnj3ubRc+RPRD/1T4+B51y7hfAeFBLvYzadZim0N3?=
 =?us-ascii?Q?vOX6hTR8eEGD/FBSFPVVhf7UQQQ4SxpADj6iFX8EegZ0g2HQW1DlUNlr+JU3?=
 =?us-ascii?Q?vk3qfip2A2STQE00UimJn/vxBkpnCn2KRL28FKX90KiX23kVkBVd1x/Ir7Ca?=
 =?us-ascii?Q?Xma9qeVXL5+6mbc7utzsK33/ZIYN36kzs8J5b1XODUF4JN4zsAlEK+v0n03T?=
 =?us-ascii?Q?No7Q9BIT8lXetXZO+PVZj1nkdaheVsYVdMRkI1VyaFBsASgjLIspmtObYXwu?=
 =?us-ascii?Q?IxiLMkPy+jji+UNxQqns7wI3gs7AVJ8r2Fc4Mkm7WTA1V8JuB4AmoONTKNTo?=
 =?us-ascii?Q?AylWsNs4z5uy0Vyaz9/0Fl8Ce2zd2OXdjIcz9d690g8h8ku857GE+fnmfcXC?=
 =?us-ascii?Q?F8shCzkek8U/tRTzhB1sCkOANFgViVYB+ystgFvkWJ/i0ZM6OnjeK2rkNg+m?=
 =?us-ascii?Q?z8M89CxohD0CrBW3ClY7gaODcExVHqTBUxJBpjuOa0OTanzMm4eIbbDhU6wY?=
 =?us-ascii?Q?fvdgeBK3EyTwLk2sMjXFudr+tzQ8R5KEluePPYOQGjB+DWSs8lsILW/uaHhh?=
 =?us-ascii?Q?TOckn2SEP3ER9sjrk1xU2on7KP9ogYCu0YEkMW42Enk4ySOhM+6/pUMog/JD?=
 =?us-ascii?Q?mVRuELMftp8OG4ofmh9gz7O4oaVKq0vdUIPtSeiE+yNqLEhSB7pI9fTfEPMY?=
 =?us-ascii?Q?kvIn5d2vbXvuLYqPizJ8vutF9OTiOkesvpZzZflC/aetB5iVZG7RSF/53yC3?=
 =?us-ascii?Q?CQ9gyOS8GN2nV8ypyVEkzCGdfUraYOWtq88Rc+p8kE7VpFJodUDLyJaNjmii?=
 =?us-ascii?Q?wnExEEz66PhEirbEbIOX8SFZkbA+9MenAZMMERznDNGP6xNco2S76nr35AEC?=
 =?us-ascii?Q?0XPgOiTaCRRh/IzF5uKpNQlko+u7w6xJqP4mmaK4qiLWAGJEeF2KraiMGfKd?=
 =?us-ascii?Q?Fjmd0LxLwQlCkLjShBmrL8P9Og2FSZ4fshRNNrU1b+0nP1uT3qtau+eqp9JR?=
 =?us-ascii?Q?G2Cj+04K6d5AcjwV5/E+Kz8S1wFJ/5/9GKgwqNpxN0FnnLGMhC/sc55aPYDj?=
 =?us-ascii?Q?yhRmxitkKiQryMFFua/QOUBCEVjMaRZScElxxIpx6t3EjcfcVgGM7JlGatKS?=
 =?us-ascii?Q?kWEF1rfDsn0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nF2J8BO1j287afmLu7z5/CAkCBrtsWHGGmBn7wsLyX3DwdGuzZdpnu2Axt7t?=
 =?us-ascii?Q?GjUf1GW9kiKaYv4/FhYA9Wo7MGa8qKo2rZm59CmKkTPtuwSaI3zOEtMEx+Db?=
 =?us-ascii?Q?iSyg3BoIaxJPEuiRgzzI7kuB/RgCRUlKm58ajFFCbvGlaAEE8A9sE+gaABrb?=
 =?us-ascii?Q?AhGHOYc3fLzUct+mg+5Lumpazb0ggU2lLZ0CHG+HSLpVqEBLbxsSHXgdaZ5m?=
 =?us-ascii?Q?W9C6qH2lAWvsKjm4XWFhg6T/bjpLuEtH5rcqjtaRoqda0xcqhh6ldnsnqrP1?=
 =?us-ascii?Q?wbwMA+O25a0gpSWGHtIZLJB9zVCcq82f81lU/xO2s0UqCFaHFurl/vgAiS8G?=
 =?us-ascii?Q?q+YsxWvEa22OnmuZP6RBuRhWWPhMnHb1M9wgkLDq+UhMVE/kbLpOfEFz+0m2?=
 =?us-ascii?Q?tqctrnfZgb+XtdM4EsZbjadEGJL4nud4UJM5jWNnteg+nDqCYOf1/aCtSkpn?=
 =?us-ascii?Q?vNeriN57UQE1RQuCVD6kJZVqsaaFx5fURutvAZtAeL2mNKBKzWzHHdBg8n8Y?=
 =?us-ascii?Q?VugiF9vXKWPR9vgS3YoGOkfLNObylMwCeym0Odixgsrn8fT/M/i20xiDfRk6?=
 =?us-ascii?Q?unOEqG4omN9Yr6McNy2v5Z0+JdB6giwPsO6RfmAT3WrlXJN8BQwfDqDQ4aZr?=
 =?us-ascii?Q?g0UQVXSgpqz8MFqmG1a4Jzcz67leDo8fdJv2hS9e6NdeLzQdFEJo2jJATkXz?=
 =?us-ascii?Q?UnJE5kxM3cRlGrX4LoQM0jcZ3APGEBlPPAulYNLFxVv+7P9Gn0FjuweJ5IGU?=
 =?us-ascii?Q?H0K6GmPwiicyuUouX+mF4AX6K3TbNrN7PYMNsajOBbzA+BQq5XpGClLa22d8?=
 =?us-ascii?Q?3YfCa5kEqNGWSYE2U/RufEamxxNIldTFyKkLpaiiofZWplg6LASIcJPexafv?=
 =?us-ascii?Q?/NJQrymYhRSSGAcz13aDpxI93MoCalsi3TXoPzsKxzoJn5HsWZO86et54pei?=
 =?us-ascii?Q?La/AbeH6ShWYVJ/I4KH+CAhKeZZ1rXDFkt+Jx9ve80WXLwpSDCoB/xy29z9M?=
 =?us-ascii?Q?TT+u0iWKLdBO4TCULi+PMCH0F0Isa/0teEGYe0LsYxBsGZili+VDhTc4vTHQ?=
 =?us-ascii?Q?IkVi2e8Kg3E7mr0nNXPYelGots8zMOEBDDkq1MN2ujLhHl6ktg4ESjJYsi2R?=
 =?us-ascii?Q?Cg9IRYHWr1mS2UoHZaVw8+gWZkOErds/s3HGozh7VPOegUX8foQkCTz2s+oM?=
 =?us-ascii?Q?99yhY4uC97yih+fsk5GKTABV70AaN3T2/UEdr5yPbjJPxxHIn+81lcCZ2X1f?=
 =?us-ascii?Q?PinvysSW1VL7J6aBgHH8F432gbnzWqeDGSrt4TrYEB7dHqOYJdMID49WRNyG?=
 =?us-ascii?Q?EIpCONgwVQeV1z8Kkw3QBz7PtczBE/vJdgeIa+36o8uWN7YzpJLlX2zaQR1d?=
 =?us-ascii?Q?/8CqLJto4lgpPeHmRX8UhXTnXUA8TMuRjGZ9YhyiAtcpZgXi4cjU8B9WtRhh?=
 =?us-ascii?Q?AxGnB6KotmngVuSa79NzPI5SxKPkdiIlfCIqfNs8IM7X2DCQg5CvgkaSkMyh?=
 =?us-ascii?Q?eXaVqpYFAVxY7+2547Q/Dh15jGNtmxjGOzKRMNGhJ8YI4NdE/i9SrnkQchBC?=
 =?us-ascii?Q?QLs7wkKQsZi2Jp2UFVcikEqJbEAn2x0DteuNiu9r1ml4COLrnv9qHOgRIUSt?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c029ce-772d-4184-57dc-08ddad7d5431
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:59:55.2220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3LvF8kVQUw6c22lydIQXOhWvAhxOayvA1D3J1leCd5k0Vq8rK1fJW8XO3HHmfsjOQrPeRimIfuzB7fvQeKLfGwiWwB/2clP49pH8L6Lgzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6982

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add L2 and L3 cache to fix the cacheinfo warning "unable to detect cache hierarchy".

Signed-off-by: Kah Jing Lee <kah.jing.lee@intel.com>
Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altrera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 216bb9793ce5..f08cb60791a2 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -37,6 +37,7 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			device_type = "cpu";
 			enable-method = "psci";
+			next-level-cache = <&L2>;
 		};
 
 		cpu1: cpu@1 {
@@ -44,6 +45,7 @@ cpu1: cpu@1 {
 			reg = <0x100>;
 			device_type = "cpu";
 			enable-method = "psci";
+			next-level-cache = <&L2>;
 		};
 
 		cpu2: cpu@2 {
@@ -51,6 +53,7 @@ cpu2: cpu@2 {
 			reg = <0x200>;
 			device_type = "cpu";
 			enable-method = "psci";
+			next-level-cache = <&L2>;
 		};
 
 		cpu3: cpu@3 {
@@ -58,7 +61,22 @@ cpu3: cpu@3 {
 			reg = <0x300>;
 			device_type = "cpu";
 			enable-method = "psci";
+			next-level-cache = <&L2>;
 		};
+
+		L2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			next-level-cache = <&L3>;
+			cache-unified;
+		};
+
+		L3: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+		};
+
 	};
 
 	psci {
-- 
2.49.GIT

