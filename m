Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378F4230BF5;
	Fri,  9 May 2025 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804622; cv=fail; b=P1hmDm9LvDqT93i6grQ0K1n1Ecxge/oFWVYwLt+P0/afgvfzdIWRB75JHUPrEWmN259nQ1caa3V9lGxrkUQt0dEymzkLYsfpzSlDe9prKvkwCAPF7ifnwi+4JZHjPeG/IZ+W4ks/hm/LQahFpJA4eQMtKDUr22qQ61rMqfBZJX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804622; c=relaxed/simple;
	bh=x7lHUMc9bTxF58sLo/y3MB80HP1PqPDz/ugJiD56Ugw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z2rOxJE6Zo7gtXxBtfJtH3dT6d6RPNxGHgXI2GzCu0r2qoICnKnPBLTUJr43J8lejk/MEX9OTbJf+B5Dzz9q7TOdiYVDyTVLzexzCBD9wA0K5wAEq5x48XGAt2HiQ7aCSmJCX3nnyMDB/gqzkZ4ZAz7fbXDoEehHF25eGUbOuNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ff/IFkrd; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ff/IFkrd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCGd/phX6YsBlZZKIrO9Uh+jPXHyMw/XQuT3auaMO+Yvz1f2XFtFO1m9K3ezeKNT+Tmzp5DoaOQPDV2JZMT04z8EF/Fpr6SiQrwKVdl8HGjLUl/GYVtGocp0Gw0cnBetIRG0DQZG/x4mXWbacMZl460u3lVwJzjjNmm2v4JiEVNgJMVD26J4bdrFTW9X5EJAgzgJ+pNnarpqdcZoEAPpE6D1K9lePVtsBtECqPx1StN5qQBqr0uepNycXNXrtUfXc4/suW+WteYf2yA53GqrouGqZbKoTArYw02f39SABBPnjf4FTvho7hc64JsFW1P2+LXA7dByUzmBvzg6xgGWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZvUHaUO0kZ7UH0Dmjyg3llWxOOzXMdzAQ7yw/wQYD4=;
 b=SmgUmKjP6cWr2ApNcH2f5JVM7EK5vMTvHn1OZ8Bpkp3mdm/uf8f5+fYYiXbgWF2KEFEowwcKKrjVdIE1h5Zq2az2yUrPcqkHMto2L595EpI24XsKlSpjDlfFJzG2Mb0BX5hysZPYG4rBRXjmiSzH7urjxOpEuwdAutMyRI/NWOu1JANOJMV4utzodirvpb4FQSgMnEUOY3HDWjrbReQyWBQs9Bz405hulAPePHw63ZNHGd+sibgA4vJPHchC0A/X7Tu/l4ryV4Oz8YovH5uGxjiJTx6IcBkWH39mw2hXRH6Px4mPXr6C5z1fVz+GM1XDiW8iWfa0oIhFYNsBW7bhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZvUHaUO0kZ7UH0Dmjyg3llWxOOzXMdzAQ7yw/wQYD4=;
 b=ff/IFkrd/YiakUlIF4KAWWFOlDl3mWC0kyBn/Y8snHhjLEvRHWZThnxPy8ACgx5g/ubPSbE+OR+U6/FeRacvr2gNHpGkYDCNyFoiuzajb9z/aJWijva/gOkXLRBNHy5+MAumBwnCuwIE7AQImjSLKs2I2uPeD5si5/1FPL/ykpCARTOFRARuuGOjud3zSro/XDVBJFMNK4vZitfZZ/iMK0fDnwNa+3+B/qXB6HPXTu2BjfjWOjgoIXjNLitSthBOeuRwp27CY11VyGwqSJUVZ8NnRZB09WXoFmkM5vQc1PrbyzEUKF5zMzIvKNIDB8DhbkIdfDnDXhhCAXISJEgmBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 15:30:11 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:30:11 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.oltean@nxp.com,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2 6/6] arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs
Date: Fri,  9 May 2025 18:29:40 +0300
Message-Id: <20250509152940.2004660-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
References: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0034.eurprd03.prod.outlook.com
 (2603:10a6:208:14::47) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b451433-32d2-4c7f-7494-08dd8f0e6301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0JLGXzDVrEIlBz/f4SPG7oy8emBr3OoGL7eoUewE8/qmAmy8F6uJTQVyH2S0?=
 =?us-ascii?Q?FmPGUWubs67bCcqzEEeT7EB2eJB3r4uz1mYY4KaOCU+zbzWH1kkXsWlztU/U?=
 =?us-ascii?Q?YiOiNlKLOYeiVp/sUdp6ohBCTyqgXCDPlDA7jTGjpgoPTauqTACU5Avql2lg?=
 =?us-ascii?Q?6ZHEpg1s322IQP1h7h1AcG3Ooa1ln9+8AM9LxdEEQKU/rU9YLbIlP0GRuwtj?=
 =?us-ascii?Q?Vq65w3rFTDRsLBLKc3Ty9+9Lx7tH5hEToNYaQWC0YtV15sIQPbasr3onqeK5?=
 =?us-ascii?Q?WqpfS87xlJfAcFsihtBtVbEe4wLGPYp7bBbNsrYW1aAwGs/X8kKwaC68LHu6?=
 =?us-ascii?Q?S+wQ+G+e6FHkytOYW3itll8WpJZrOSxdNqA60XY0r4pMTy60MNoOJmJ9jT14?=
 =?us-ascii?Q?sRu9rEi8d8HoyEnY6/30HhGPKmnvQdxHyqncAV7s75xF8KZocVELxNhGi02j?=
 =?us-ascii?Q?uzix/cMT4mK7vOzGq2t7kJJRzJwzjKpbj+gpzcJ3q/svJLQTv/e1txwVg/0w?=
 =?us-ascii?Q?FIbBbeqk7k14ycwT+E3Xpm7+jDtQdiWcc8PiluBCY+NWphuulzl7+w+AsEIL?=
 =?us-ascii?Q?wETRTa9iemHg8FpnyGF4QpfTJu7TCGX4VToKuLJCIUFJOxkjGVki5JQ0ZPD1?=
 =?us-ascii?Q?AM+Y2qesuORCLdQwCfV2yvZSut+pnyWAQBHhEzcUM5M9rsIRKv/0ivZrz4sO?=
 =?us-ascii?Q?iyJA3gW9odtk/5NYjInuDjkca9NcjE1HxWOOVI+vwGzA/CnkGw8PW9qI1qgA?=
 =?us-ascii?Q?cxbbYcWr/CzSOq7A0c/prlXImAs57sIY08wAXDw7oNdPQvJfSTlrNcJyCwdq?=
 =?us-ascii?Q?CDFEMEfeQWBcBQOsig0xJea4vRCtfizaSvx1dOxVDdV4RpzHnGAOfzCXexp2?=
 =?us-ascii?Q?axgTF98WaIz7vN8akyWTaGasJKUM4saGOVcZwD5WjBhohaLUH9OijLOq4M2l?=
 =?us-ascii?Q?RlXwm02ocb4Wj2MIrEkjGSMtZzLYgVnuYQ7BrRRWKCkxmeZl2mxQ5VfhZ9Zl?=
 =?us-ascii?Q?+lpGJ5b/D3nUGA/6NYKTPNPz0JveW4X4p/RnA1i2TcPRTJk0wCMbHWVg5Iel?=
 =?us-ascii?Q?z8Dlz0SmdaUl1W1S5yk7gCiFJEPmjGtiHy36gorgCXadGgCveYUOc8+O0SG3?=
 =?us-ascii?Q?ZOVgyEx8gwA2VSHRiybhfNFMYXFYhdtBLpjY64aDFHpDVLU/Y0BA/uIRNhIh?=
 =?us-ascii?Q?mcxhB1ChJhhj3QEB8zhxn/a8PhFbovpwbW+MOrP+JJjjEhEp0dcpwVtoSpJZ?=
 =?us-ascii?Q?FBuKqc/KqjUiy84XzPAmHKL+aoqd8ZAa0Myu53mjcF1RweWl+TVY1e/soUat?=
 =?us-ascii?Q?d4dMolz8tMzs1MHBGWAlvvZ4ScLZwB95YfsaqpDgJuPya6EiZ8n+o92wJOjX?=
 =?us-ascii?Q?rY7WicXUAfGR5vQUfHWRDw738dtw40Mp2ChQsT06Gm64Kb9pZKypAiI6C09f?=
 =?us-ascii?Q?GxwVyXvcPXY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rpryY8FyQ6Yc3ukOGGht5n2h3OiB11rGYs5/4uDBTX60QnB5SiGvI0GiqJgf?=
 =?us-ascii?Q?dTBxJlHnIOKwrngjHioy9ah3xbwpZQopyg70+lMMC8C5iQzlilqvvztyrVg+?=
 =?us-ascii?Q?ydFTEoeHM4Hp4YbSVGzJASAzi1iTQgfHWkP0MlVmFcLAxxAvLFFnbcLKuCbE?=
 =?us-ascii?Q?6uDDq8oxUiQZq4I+o0Rd9MF92onAvQSGOEoN9W7bWDOUdNLC50Ja8+rYgv2p?=
 =?us-ascii?Q?VrvPs2oSOm/Ps5RSFTBEGetc8x7baP1Q3eQCjd2GU7CI6OwJvgovkHUvOU03?=
 =?us-ascii?Q?0a/+ytkB+m3BCkvO2h2rkqwtBF335fC8YwbJNAwaxzKDgVdkelKx5lRZFy0S?=
 =?us-ascii?Q?gdFSOFKZHyzYnkXt1GUBFCNNYwnc6tpKF3b7L5vSIGcQfZUDm9nA76nRoxJH?=
 =?us-ascii?Q?f806DrlNW/LMrQS2P9CT+X3Moi0j7k8RcifoK6Dzux8R1iVNRdSyTbGd00ur?=
 =?us-ascii?Q?YuS4RNNgDzQhUkKaslQ2Accde53E/X9zDhWJp1UAHHXJQpHqgUJZi9MHccXI?=
 =?us-ascii?Q?mTeg89HJ4JIX0wbqsr1yl2HwZKTEIM+fuqFkVNPYfH09PpLC9o4Ys2rL8xbb?=
 =?us-ascii?Q?mab9Xd/ZZCaTuDIScq7xuI/ROk3mRGn05efdk4r61Q+++vMH+REC4E/zkw0D?=
 =?us-ascii?Q?jEhClWG15wtn34BCY23RvRpvOj7oif+UZC9XRKq1zcJ17EfH5Hy+EJh9hSPd?=
 =?us-ascii?Q?iZl7DrOMWaCkf9pIWSJg0fQ8LssZRXsQ9kM7I54pKtCec+3YGIIQ8HsI1nlr?=
 =?us-ascii?Q?UYvdSiZV9SpRRuxOE8WljRMIXPcebESyFbbA38GkkDncFfuiewanS9DeNfUN?=
 =?us-ascii?Q?FbX/jks4ay4HUMkmZZvG9hj5EStwDSXqWiuv3nu4Vktb3yd0xlHcKZPLpA/g?=
 =?us-ascii?Q?CAgZZxFJ3bDG/4B6Ab93oJtgsyLRaZQarYA3Fj52kBNODAUeuMVCYyIjAe/x?=
 =?us-ascii?Q?G3IavaT3fJ/vs7ND/fmbv+oSLasvAlkA4XXkoVDWRpjENA0BXA/YXNDdqgD1?=
 =?us-ascii?Q?3qzTODM8w4o6bKeFzzBw18psXY6VBVrJv+LnRHLUqvsD/vaWZYsVkniaGgGk?=
 =?us-ascii?Q?y3ZPDPE+99hpCeRcKymkzq6eGnHmtWlRETizNmeHmjZhCiBwCIJa1EHi94WC?=
 =?us-ascii?Q?bwOpzjEGicSZrH6C7Qfl1mzv8dl3iz4yfed1I8zUVMyo3IXZ7Tng69dLN3ac?=
 =?us-ascii?Q?BjNvnufMo8keH61cmICAMAqqBPU51TT8zqmALbVzrDL92ubPAQYK3Cyy3Bvs?=
 =?us-ascii?Q?Q+s2JGvvLmxrdho6utGhY4+cDgoprbmEcuHirJtP5sOWaGJAYc8GwAk9wwjr?=
 =?us-ascii?Q?xpHfWJPh/Xx4aJ7R2o+HRjSVWLiNjJ36aOuXkQYZJWSwOQDLgNSiz9aSK+lC?=
 =?us-ascii?Q?M5upIsr1q1O1xgPamn5tINGt9mtf8mNtHLzwq6KktwU7HJv7icH+bDTXzddh?=
 =?us-ascii?Q?ATmWpfy5ayc94H0N13PwS1VSJ75hy90Yij3T+qmX28TXhJbckpQxKIhBQbWr?=
 =?us-ascii?Q?bu08DsIfIMNQE+I2mhNI20YirYjLdvVaxnfz57gSg/dko5oHPD9DAVdEh18R?=
 =?us-ascii?Q?7Ap3KgFLSsy96J5KVORmX8zgeSM2yzhqaIq7r7ly?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b451433-32d2-4c7f-7494-08dd8f0e6301
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:30:11.1155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsGb/Q9q6ovOTot/x5EJ2z4OVWCE26ecwI97JBOy5NGuBiWmfWWC2ap2ac/jhSErh9l48CBUgAS+l1wRSED0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974

Describe the two LX2160AQDS on-board RGMII PHYs on their respective MDIO
buses behind the MDIO multiplexer.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none

 .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
index 426fb4c39ab8..be65fb559107 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
@@ -43,12 +43,22 @@ mdio@0 { /* On-board PHY #1 RGMI1*/
 			reg = <0x00>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			rgmii_phy1: ethernet-phy@1 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <0x1>;
+			};
 		};
 
 		mdio@8 { /* On-board PHY #2 RGMI2*/
 			reg = <0x8>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			rgmii_phy2: ethernet-phy@2 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <0x2>;
+			};
 		};
 
 		mdio@18 { /* Slot #1 */
@@ -169,6 +179,16 @@ &crypto {
 	status = "okay";
 };
 
+&dpmac17 {
+	phy-handle = <&rgmii_phy1>;
+	phy-connection-type = "rgmii-id";
+};
+
+&dpmac18 {
+	phy-handle = <&rgmii_phy2>;
+	phy-connection-type = "rgmii-id";
+};
+
 &dspi0 {
 	status = "okay";
 
-- 
2.25.1

