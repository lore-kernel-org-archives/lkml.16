Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBDA207DEF;
	Mon, 16 Jun 2025 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085463; cv=fail; b=kIYjHrAE2kUZUagyEyf9Y6VaLG0DGi/M8AKBr6xqIZ9EzQ6EYwyfcdIEZhK/joThLXeVH+Zo2ndUzPgKyExA8lv6YVq8Gkd4RE4p0DvzR03rcL8Fg5iFLBPMo1KyEMiD1hrptcOu0Mf0xRUVi7NEjnJ12aanv7GWO/6CZVBLsK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085463; c=relaxed/simple;
	bh=7zLq7y+qy4+EQn22weBW7uWRZHqOFK9f5JumvNNiR00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LdscOU0GJpB7SOGvg+gc56rkjXVz+tGFfWTMggE443pMT+nIPPbgHjOLdf9DUnLThXtrQZHJhIRDF4JZtb25L0YfxJlXNgjfYrh2O3ycVFZoJ/9AC8lPJOOYdHeugLm942n9iwKV4RP/6wm1RqGcILO8wy6jAp19dNKK39KcJW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=plw7wqn1; arc=fail smtp.client-ip=40.107.101.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="plw7wqn1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baLF85kHKWtQEcicmGOaAmyD3dH3rybwpW2i7/GIUIF6Y8CxhfrSQRud5iC3WbivvhjII29+PFCr9h9Rav11PN5ZxQ9zem6EWrhBcEIUbKkI0lIbHXmHDbWq4B7kkVjTyIu0qQijqvQZb3ihD552+kAmZxJ7+1TLWnbsAMPh/DVHosU7B/C//oJBSy4r346VISlJEKf0cDJ3s+9JneNgSg4obZrENFVkH8AeijPMO9RBSE7uH5tRXX7YBYY7Vyi+aYWkd1bhtBZjvHsdL7vswfg8OVE4Z98tkGJ4s+GpHAzvJB8d//tcTFwSpYjXVZ9n3CyUtDJ+AIHjzK2u7WAivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIN4ownBt6uYNlKMtE+pTSZg6nXkeDQsO5qZmnb0t8o=;
 b=M1ldgYJFClHRWLdVVZ10G8a2AUMMR85dk+640IVaeJEyXCwCMCJ+NYmMtta2GwPmrMVABEni249uN1zYf67JfRZEp2pFutzXqbpr9R5sCqqXOJey7rCqmhePC9VJhjxOj9Tx/E5QiGptqknLq0YAMbrFoKtUAAW72/UydC7jRLsfDPNPyqJNhyXvXQo9jdHaG3FZp6ImMiVrH9eRK1OVyvqkHnyBWL5csxs+lT5x1wmDCWeBisMP3GR/Oi16F2o32Vo16N3w8lzullY6zku6zZmsEJcPzjZZ96w1aeTQkdj70BYSeStjCPMOf3GISJG5bVn4w5W/AEPiZwaW+b6z/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIN4ownBt6uYNlKMtE+pTSZg6nXkeDQsO5qZmnb0t8o=;
 b=plw7wqn1XCtbDtCRrm2qQte9RyE5GUi7k7PQmhz+2SYKLClihub9g1rEXC2Cw+FS8GL4ilVDIqly+mdxh/rNwPz0o1jIIxXmZbsUel1qAhMqhPYnwoxklnfRZdn33fyjwPR8ZGSbTtNNRXuTp196MOnyz3S+5zCRaqccYKtGrtqyfbLMnxT7R10yswmAkEJf11qy+PT4+d7BeV8jRSHGkFnvmKfRVEc3YB25NuG0VkVV4BvQkTe+Au7CPP36g/62gXF8f83yr+n3D1R3oGw4NMaNMWeWy0LwOBoq+DQSauE4sNjkdp96v3DIDMSuYlWWn6DejP+Ev9I4Qh5io2ngFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ0PR03MB7128.namprd03.prod.outlook.com (2603:10b6:a03:4e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 14:50:59 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:50:59 +0000
From: adrianhoyin.ng@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com,
	Matthew Gerlach <matthew.gerlach@altrera.com>
Subject: [RESEND PATCH 1/2] arm64: dts: socfpga: agilex5: Add SMMU-V3-PMCG nodes
Date: Mon, 16 Jun 2025 22:50:05 +0800
Message-ID: <20250616145006.1081013-2-adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <20250616145006.1081013-1-adrianhoyin.ng@altera.com>
References: <20250616145006.1081013-1-adrianhoyin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ0PR03MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 74115960-34ae-485a-c7eb-08ddace53500
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t0Mzw9EwlVsaOaRhe0f/WIvCWRiwtwva8JlRXFXmCr9PWplUlw4GJvqEOjjd?=
 =?us-ascii?Q?elpeVo+TOJaf8Ba+twzIlx4sgcbfb9DMJaVH4Zc4RmSJLaBkKwSyDUwE+GlI?=
 =?us-ascii?Q?7VyLL0VfwqQdhDQZD63h47Oh5DznwAVx9z0vL6DVFm1VKdupQHkKfh+oKnvJ?=
 =?us-ascii?Q?kz7e4izac/qxYJtflS1SU6m1bxmuDKuSX/6txvKbZNmJLiR8vU57ilx/g0KF?=
 =?us-ascii?Q?3dtzs2Ua2SEjmhYcY7/JrWEpU5AU84EqjiteiYWJDWUupR7/CTtgn8YrENFk?=
 =?us-ascii?Q?VXNDWmKe+RqzpBS7fnB1AtFrloVLOML+eOtpQkF1XawrgAhk0bvghgB795oa?=
 =?us-ascii?Q?WdvqyRUEr462/fBN+7O8RdqIeKcI6bbAOb5g96RoQeUJqBIu3MuV7TuAPlMB?=
 =?us-ascii?Q?nHKtn6/fykZvh6RKj0lpsD0y/+oqEn0P8SiVEXW+EluZUV6mayjdPlazvg3j?=
 =?us-ascii?Q?/JBVjMtQ6gjfOHcX/2a3kjXniTU69CpCksPpDZAWQcpxAtNBStEypFDXeGpH?=
 =?us-ascii?Q?N7rKCZa17B5fepbN/6ryySRgPItmTzO9WvFTH/Jrt+rGYFxnwfKG84upMBBj?=
 =?us-ascii?Q?u3WF+8L2gW8AaxIS1VpcUpyqhuqVU8qej6Vq2m+rdkGTrTpN1VTGOfarxQfp?=
 =?us-ascii?Q?ZMMTkrjbNzs/JdJ6A6XlfbXHEi0VMv5gbY0wTdqGQ1hWrNTyREPGgg+GlQH1?=
 =?us-ascii?Q?mbyPZFfFMOMHGmODDffehqnOXuuW9hEn87vi8p7DASlm6LcJXo1iHhASqGL6?=
 =?us-ascii?Q?MQW9dUAe83/zBYlaEyfzcx9zzvPR/Not2h0mikNWyn5p7X2OwjUyKv58zdT9?=
 =?us-ascii?Q?0Yjbd8Y/wx/3U0gKY0GGulPzvCAv4M0oL7eA+XrOnHyLqACQWadxfcIwQppz?=
 =?us-ascii?Q?PqkwyL7QjYMloENNwxKF2R++InZzRuoeendgYmyWwWB3jYwJQNiTJixpY/or?=
 =?us-ascii?Q?o6OECyO0dQGjY+GASElFYdAnvDET5YMRO99Jyd0xQiHw83VZ+ruHrfhh0gAE?=
 =?us-ascii?Q?3M+3COFPmnadfxsIKu37kPDY1HFIhRZhQMEN44Tkqn32a+MAOKKbQMgShRpF?=
 =?us-ascii?Q?Q1KFvyYa2+hHIzoayS9Ijth3tRpBiRgFNw8kHt0BLp9iAjhc1KUyn4MOWxuz?=
 =?us-ascii?Q?kUjtnKXnTs+msnkj0cCgGrRvkX9JalOEXq9JzgEOfOOU5GV97dbm7RApeAna?=
 =?us-ascii?Q?Vl3IhCSrRCnTt4ew/LwpSW53cOPznrcVCuekFW6nCADkqxwreeQkrMu9+PXA?=
 =?us-ascii?Q?dEEXGdMpYfWf0R5BzK3DNB8j3NKYfqMGPqWh7nMkXQGWt/c5btNAo1i19Cfg?=
 =?us-ascii?Q?9sxXZcYodEEh6Pyeg0SZewJuQVQKSE1eJWlm4mkqPiEZLz8lM5R47sro4QE9?=
 =?us-ascii?Q?fa/zt3BfHWjXc1TGNftYPjOzaaWYpKfQr3wp/Woz95V3vkmrdw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QtXcQPvER+SzL6aj1Jf4jMFGdWtX47FubWXCMYpq+baVPvbe57ahGKZhFvGt?=
 =?us-ascii?Q?ZCvwweX1tsuHe4WnYqdPBpXsDgo97zRgTOlF7Xs8gaxF0/hi+1n/KGNAkX7+?=
 =?us-ascii?Q?7v5Wa0j38kVYH1cnDh/mXoHGZ4871e/ZfisGZ32QwCwhUslR2l7psynY3+kW?=
 =?us-ascii?Q?UcpxxOaUYuAvLoIamjb2k8BzmPZ0gSdT4Uximh3rR517VM3w/2BPColTQeYW?=
 =?us-ascii?Q?uZsE7QED0sliVm+oq8f8bBJuC61fRQl4jHaU58zpSgc3mSqdc9qCmMjuRx4T?=
 =?us-ascii?Q?JXIUapQr8NBnNlUcguqzRpUMTHIyvZSVQtaS+AGeZ8oT1eM17iFDBR/b/Obg?=
 =?us-ascii?Q?i1qxIl7UReYXJtc9CsofUU7D5O2kPBLSK6w0qa1uO1x6b9CVYg7mA+Nxykw6?=
 =?us-ascii?Q?nz2KuyOIFZknousIzCBommrXsnD8Q5VkBil8yHV5Gwn4j7rvncvZQkfcJZVs?=
 =?us-ascii?Q?HOALhGeSyP0iCUl9fTJh4FqRJOgRdV3RBgE9a/dkZa2DD+mZP1lz+PLMVbWh?=
 =?us-ascii?Q?ff9Bp77dgCHxw7vpLB4h5j3pVCzi5Ch4wHqLFaPDMbRb6sn4u3GIsOiHxoz+?=
 =?us-ascii?Q?lU2lVI/thAKUeHr4AFCW8vEjnB75VF+geKRWl7KVw3UFS5tXuRwkjPIZCXoE?=
 =?us-ascii?Q?o3G/o/5Fpiw2SBvFI6vgyMkpxJnwhOME2j5dR3O5Mg26d5VkNmUdjAMGz9I2?=
 =?us-ascii?Q?paE9HEpLXKTyuxJ7lqqilF42QpT7KtfaqdNELgA9mKrQauMXLH/0+0MpVmSk?=
 =?us-ascii?Q?kCu5kHuiOF8vVSFTInUjcoKeG8jyCeU2wsFCLXZThjFp+zZmiyL5sNKjQTxQ?=
 =?us-ascii?Q?0AoFwvuUGRGJmy+wCW7ua0R2fBFYX9F4s2eCOYxmtEM4Y97Hei3xKnwtvuXx?=
 =?us-ascii?Q?VsQyNdZzPUrOg8c3amTivdiQFOF1G0bqCwsa2rf2bJi8F+oraHt6BhQYL8Uf?=
 =?us-ascii?Q?NeuHKudHCgtE1MA+2qE1ypDYTJymtzNnm20MUaqJQEANyk8s2VphA6EZOG6h?=
 =?us-ascii?Q?/qEK8L+YH27g5HIBamBfYl8cnmIdrzAifczg+PSoiJrmRy7g/4wT+Rx5zgGJ?=
 =?us-ascii?Q?fzVusgR7cPx7jwQ6+WjUvfBcN5JIjHAwF0lu3QNDFYnbgdS4RShTWIIMsoYa?=
 =?us-ascii?Q?1JlpY7kTTjN6l/QPSyEv2GCKvUf6/2UlzNRWxtFS2UPWpFb1A9VR06+qcpoD?=
 =?us-ascii?Q?YH/M85rdf3Nvl6043d4hYZA6aMJcKjIx49W2m3gqaSrrf3QgGBZHgJrKiUXU?=
 =?us-ascii?Q?3vZzVc7TCom9Vy/rmZfnQyN6rXPXBr5xXwJR8MhY0E6Gd5P5p+6PwSgDpamR?=
 =?us-ascii?Q?m5g6S5IbqoIuVvWBItQ+WovUpQEw7q/klzjPBfaknmfGa2tlnyTNfnj4XXqb?=
 =?us-ascii?Q?tve6VRCwIPfrJEz5Wij29+jO3kGf3sY9ty/fmmGSy4QU+30BmcztFximy1im?=
 =?us-ascii?Q?TxElUi8gvm18hRzt1NPT+KxTe+UxvdurKZC1JeyfP7MRdBCJwhMkBmMpLHG7?=
 =?us-ascii?Q?IMLD4RM+XG7whLASlOpca6n1PQTUOrf9hJKHo9E0fWx+rY/uvePdLLxr/zKy?=
 =?us-ascii?Q?iTdkcCGL3OtGt2mjzltji3eyRM7o98u1piR/UpxrYBc+WlYsZDsZ/DGeQKMl?=
 =?us-ascii?Q?8A=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74115960-34ae-485a-c7eb-08ddace53500
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:50:59.5833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYkcZ1Wy2fMYjvLnhMSY9R/OD+ZRFQciII2uq/KsaOdQ4sHiypVBXUz9IVmiIC5ZP7yxasKf4Ks/1DZ6+oD8WUOOE3OMvhEd5h7DKaNAgW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7128

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add SMMU-V3 PMCG nodes for Agilex5.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altrera.com>
---
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 7d9394a04302..06920de87a41 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -133,6 +133,68 @@ usbphy0: usbphy {
 		compatible = "usb-nop-xceiv";
 	};
 
+	pmu0: pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pmu0_tcu: pmu@16002000 {
+		compatible = "arm,smmu-v3-pmcg";
+		reg = <0x0 0x16002000 0x0 0x1000>,
+			  <0x0 0x16022000 0x0 0x1000>;
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>;
+	};
+
+	pmu0_tbu0: pmu@16042000 {
+		compatible = "arm,smmu-v3-pmcg";
+		reg = <0x0 0x16042000 0x0 0x1000>,
+			  <0x0 0x16052000 0x0 0x1000>;
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>;
+	};
+
+	pmu0_tbu1: pmu@16062000 {
+		compatible = "arm,smmu-v3-pmcg";
+		reg = <0x0 0x16062000 0x0 0x1000>,
+			  <0x0 0x16072000 0x0 0x1000>;
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>;
+	};
+
+	pmu0_tbu2: pmu@16082000 {
+		compatible = "arm,smmu-v3-pmcg";
+		reg = <0x0 0x16082000 0x0 0x1000>,
+			  <0x0 0x16092000 0x0 0x1000>;
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
+	};
+
+	pmu0_tbu3: pmu@160a2000 {
+		compatible = "arm,smmu-v3-pmcg";
+		reg = <0x0 0x160A2000 0x0 0x1000>,
+			  <0x0 0x160B2000 0x0 0x1000>;
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+	};
+
+	pmu0_tbu4: pmu@160c2000 {
+		compatible = "arm,smmu-v3-pmcg";
+		reg = <0x0 0x160C2000 0x0 0x1000>,
+			  <0x0 0x160D2000 0x0 0x1000>;
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>;
+	};
+
+	pmu0_tbu5: pmu@160e2000 {
+		compatible = "arm,smmu-v3-pmcg";
+		reg = <0x0 0x160E2000 0x0 0x1000>,
+			  <0x0 0x160F2000 0x0 0x1000>;
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		ranges = <0 0 0 0xffffffff>;
-- 
2.49.GIT

