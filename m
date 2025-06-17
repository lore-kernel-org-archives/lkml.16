Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4BF28B3F9;
	Tue, 17 Jun 2025 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155776; cv=fail; b=AkLkcpTWBlIWZPjiEb89en2MKKfFIpMby4T2/109EKms9bUF3PVYE6mzFVat9x+Cv6x0rnXrA1+Yf3WwIoXv49oDLJiXhG0hmQE+9WunNWpszTlwtmO1ZBNpg5bcf/cdSDSfSJc8Sn0tO4EySsdlQYdmJejk+72www3zJtxYaFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155776; c=relaxed/simple;
	bh=wtkXh487FlGhdsKGw0+7VxgWCpU3+qKWSmLRr2h2INk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UlziOjncW/fxgp6eOC7CfQcJnDDKNVEUr6jHxX7F0I0OuzulBAPI8fV9R78lMV/WtZDKrXx+l6AvOMC9pXwi9XsixF8BtE6SXuhvXLAzS0oSmmlu8nOhXz5BhYOfE7akn8UGVS2whWaUBEhLsgm7c4o52KN/1ImUZO7iciZc+yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jPMIXRRb; arc=fail smtp.client-ip=52.101.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jPMIXRRb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+OT4t3cvxGTexjS0UbxnbsdY7T5m6PnRRkjKACN9kCXY894SAMvbcZMOw5EgzR/eoSmwJQFfaq1+R1HkN9GqwXWobdWdDSecm/yWFjaYegu4TbaBRCrD/9pUVxwCo0DYUL/iBmhrRYjzVcy6RHwnJ7wd0fgc1DkUHK3qOWkolGmQftPRci8G1hqLcnekrXgFH4mYpnaGbdimIdb0J5Gj3M/Db34ADihwMBTzNzg7FhZL8CsSWNXAP1VKAgg2K0IqSMioQc3tQ/zmDpxnaehLb2jXLYN1N6fnk6hjPK4YstayZf6eYMDHz5laUCa4iWIwZkLhyDwfl8rHiABKTF61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/F0UiNZHfqD09w5F5qoJMEr1mA8q6TN9VZnvNPCKlk=;
 b=EEXYj6+uQz8zYfrTkwXB1DgYdzGLnmgtNjr0G0l/5QoiV2p3zMDj2ElfyQvA1uTQB9V8J4QPQog3qB3JZZG6TWQ1KL/Uqykrb1V/eTGYacKn9ZpvyIxy8iTfQitrUHriGhJCNHPfkFvIsBIfJ16+ShZ8v+mJfN5mHK5+cabnhyoses3z5C/0HRfQYt1iBxGvnMYLMrFegiYN41JD5ePWYzvx1MNxPFZbL31xuw94gO1zy7h/WRbq36MoyrqFvdLpnKJPXdVE+E7OEfoSx3DXSlQFdL1BUA+xWfh5lA20he9EZnMbfepf3JUOv0eLNBLrA0zbBnaJTYI3VNl7ID/udQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/F0UiNZHfqD09w5F5qoJMEr1mA8q6TN9VZnvNPCKlk=;
 b=jPMIXRRbR81IZ2QUSMEq/ypmL7FriDfX+BtfnkJLmOe/t1nAxV6e+0M+a0WWzEpg6I0tbljVN3KUMqwjbJwwah/M/rensN/VV+ezP4jWLd0mxe838Sw55K7QN2Tspm4wO6sBA3QJVq9pnbcH51qpENeEaNSXsToS5u+P0OVXOKUq4d3iu4urMLW5Cu96bQX3xe1fTZY2DsmYFUHREHlET51YW34g4F2zgcGwxTIvhJbK7H4S76u4h6g/KfS5Bj2JuyapSJm8pH+ScaNVfNtIm2xOAIA72SJThfgFU2hvRtWzF+JsUzDcxWPz141vL17h4jYztzkh5ihFlT/8wUeL4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by VI0PR04MB10140.eurprd04.prod.outlook.com (2603:10a6:800:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:22:51 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 10:22:50 +0000
From: Joy Zou <joy.zou@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	frank.li@nxp.com,
	ye.li@nxp.com,
	ping.bai@nxp.com,
	aisheng.dong@nxp.com
Subject: [PATCH v1 0/2] regulator: add new PMIC PF0900 support
Date: Tue, 17 Jun 2025 18:20:23 +0800
Message-Id: <20250617102025.3455544-1-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|VI0PR04MB10140:EE_
X-MS-Office365-Filtering-Correlation-Id: a697c735-cadb-4149-572c-08ddad88e9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E9aGQLMYksxeQyFpSh3njO+nUsYsBAFyY1MORnBsD68YJB4PJ3BnbgDqQlPN?=
 =?us-ascii?Q?xWjwVUgY/5uwkc7QeDRE55yKP5pbvfJfHOco6Dvi3v4NObz1KG9J8v643TK5?=
 =?us-ascii?Q?x42Nt3LGZvqWxc6qbi8/Bu4zU/XvePriQy+I8gXFm7hwN9OznRVVk+AruG0w?=
 =?us-ascii?Q?TdtRmphBg1L7V9prSx+zKmIhVB7noq+uhzDFEpOwHdFtkGMiqpyKKspgA7EX?=
 =?us-ascii?Q?JWricMWgk69VWEjPLWjSWaPC+hPLjh4GAz10bH8TsaS/tZTqnlM8KcjBcoti?=
 =?us-ascii?Q?wcABd5wWjrR95Wp1Y67mwufKE7Ve5NjxRtwTjCI59aHYKX/2ZCLTgYqP77NI?=
 =?us-ascii?Q?djq5WHd4Z7eSPEyELYdMSZZP5LdYPMltvhKuMDFjcjccsdROmaRju8gg6prC?=
 =?us-ascii?Q?sPBzm3WW19XwlTV0e7XOc+YTYgP9eAnnqnYbc3IBsrFqQSNiwXPgalaTSkDt?=
 =?us-ascii?Q?vLULY42OL8xDWq+sTfLleY7OVdDTqtdguSzg2KMdxlUsc4UxocQ1JLQ1fa+f?=
 =?us-ascii?Q?+Xm67XX+lisOM4K7yTxqdlP9X71Om+rUDrSkqwxWD/JKZ6PZTakYN4YI2uM8?=
 =?us-ascii?Q?ozs8XOmrVApf4pPYVNfbUu+hG7PC3CQCNTkpdKlHp6QaAL+Fo9GuaZx8YCsc?=
 =?us-ascii?Q?DIN0nwSD+nymX/KHFReuPSjDwVQYI+8dctw4uyJLeu/FTEbCFfr8DqVHQgda?=
 =?us-ascii?Q?vxzAFFP3yhtyuTRUmoafVqWiKjrIumRf2sFhRHyDwNtlnMp4b6FP9Z/rH9A3?=
 =?us-ascii?Q?dmvpYryRNsgqzI5JRiXMXUn5TuLr17nLx+tkXgfw15O0bfN//QyKEQMqQAxs?=
 =?us-ascii?Q?S0s0evzVABUR8RekC6KLwQ6ElVbmqbDX7JumbTBbzrvktEFt0rA1DjspKsZi?=
 =?us-ascii?Q?jlU1VM66f/TJRLQx5bMrgZYVAgxp/Xfv8Yrs6bFP528O0nyqZWrSks9UyAzk?=
 =?us-ascii?Q?eMtWkmXeFiKgO7s3gS/AB4rgcmCEsRy+IEMYkeemhoAANUUOrgXsLa9SoVVN?=
 =?us-ascii?Q?NlcICfX1WREUySDMi8C7f5HdTFhHcFwZP1hK152+CFr2UJ5qERrMzJo0fwqZ?=
 =?us-ascii?Q?DItxdLnpU/6/BcbyYJ0MRFCDcVNPrD3k2X+eDjugLcVaUAJKgIXX57iDjczG?=
 =?us-ascii?Q?Ji8uqUxwQrLYlNlwbVOakWbGibvWKcsOkSIrAfkgLk/SeXPVQgGITwYGJt1E?=
 =?us-ascii?Q?46ZqevSyB9L0bXWkqfiMZLBdSg3q+AUd74b+X36o5zX1BQo625TT99LKyBJk?=
 =?us-ascii?Q?tNrbx4XsB1DiBwRYn1IYtIfzgN4XlIweZS40Xqyu3sNk++RQZCDwk+xm4Q7l?=
 =?us-ascii?Q?0R+FyDSHgxI7r/yWvdBU67k1ILCS3J2GEo9nEhIFwtuQIqj0NYS/EVlQjUqJ?=
 =?us-ascii?Q?ybgf0UlsOrhYVwuVUcY9/+4cp+Xi7vkMVJd93HO73DCqJpl2vEPbdS2CghG3?=
 =?us-ascii?Q?G+wDfsypSft5PlnO9Gobj+QrKDfwY4c/NpNER+jSTircMQc1xggNdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ujWytFtMn7x/fxImYSN1ReKL13WloqTtpKS77VwGYpay2JuKLsOUmduslVJj?=
 =?us-ascii?Q?SFkDmNW8pp/nHuvN7RejFUicyGCoYiCec6kMSdDYcLzgvhievd8cI7zR/w3m?=
 =?us-ascii?Q?COVHl8hbS+3UIkpRFgqFMuHywNLhKvdbupZRnRSWGseFgTkKHEqOm/vgKn2G?=
 =?us-ascii?Q?nqvAav5P2hDirCEN+5HSUyu8N3khT6xk4EH82jLsphAx7YxNVpBG9eLco9P1?=
 =?us-ascii?Q?wzL6EEX9X2gAwB3WfNrKiNKU64EnDPiAHIvzxURujA8nXqJg86HUExYArIP9?=
 =?us-ascii?Q?BO0Zgo+ODz2mhDWByDcVoCsLYHONmOf5E+ockRzLEcZq33ddBWVjyWO5FCrl?=
 =?us-ascii?Q?UF/EjZllkWFAltO8YF5VBFBgOQik7TMqi9CXW4u3yDkhwj//TMjzTFtjVxxW?=
 =?us-ascii?Q?CKA/AEVEsIUppoCnB21lEn6/U5JH10thG1SMYlnq7xo7ZuEpV3+gJKR5NYRV?=
 =?us-ascii?Q?TaGS1YVckYzL3g3N2X9VrljQPBJtKajg8DcPEFsi4tE3mk/C7/Ox8HQGWp0z?=
 =?us-ascii?Q?uhhbQyXesPPZM9m+vMVvvRDh5YDi+VSdO1g6cYrRcc6qgKl1eSwe94/Wum55?=
 =?us-ascii?Q?j+MgodXbDdv1fRtDL8NhRuosovrdQkRP9cUiRi2t1WunPMGKKmFTQx1t6+9T?=
 =?us-ascii?Q?SsI12yz1MGnZJ67H5VbTFMYf3hPB6Fpl6hZeN+IS1qOXVWHw6vGPpGbFDsPv?=
 =?us-ascii?Q?L6nuFaMeB0UcxUOaxY9sPEzGJRu+Vtnnz5xqUxo2TZF9c8nwtbEzEnh7Wg9I?=
 =?us-ascii?Q?Fdt8oP5yBsVpgs/4tfnMo1qmL4tttgnfNngjiC+rLQd6nKcY+ZwWDcyPVr8l?=
 =?us-ascii?Q?elTxPqeRCTXJ6fDJwS3+JxWaCRhvwrdxY/BlPF440X0wJsnuwLjRdK87iMhv?=
 =?us-ascii?Q?7KbcALNHwl82LYYTt6NlES7dcpfE5St7lpIMzNNLOLlVIMlQTA1jjh5W4x28?=
 =?us-ascii?Q?892GfRlYJhvRCiP0l5eBTn9xxqOmtA4AFos2r79GZoDrhqpyIy21FbBupgF5?=
 =?us-ascii?Q?Ako9UqWUV8fdMRcGYXcxfK3Gtt/zKrtZHZBhIk6E+MsU9Qe3TuILqaoUi+tk?=
 =?us-ascii?Q?rAC8nLuXda3NyvsvmiMGlDJbIdxrnvS6G8hDitRBy/x8npG/QKOR/uzMstDk?=
 =?us-ascii?Q?kkk5Xu8kDX980OkQAXHOrMp8gKDCXGXrFZ5W7wJVsyMoo1n1k70YWQlmt57v?=
 =?us-ascii?Q?WUM0CX3vvVAMRkhE1uH/Tkupe/A9eFNL/XaKtKxuYMJzDHfXlyWCGkYFW3FZ?=
 =?us-ascii?Q?mIqf1ac0fy6gF4/FjPk3NFb/tj2HbwOyo8Nq+HA+tm1Xvh318vv7MxlS03j5?=
 =?us-ascii?Q?1WNXG9IdCE9I3uzmqNV4NLVOdiw46hwTg4pLiPNUrblBxL62tfbxZB+eCA5D?=
 =?us-ascii?Q?HjFxSt5KRaGtCj4bkZTqtktJ7mHUGghbaY4Op8lbN1xrJeeBGxbe4vsVDTPb?=
 =?us-ascii?Q?ny6MdhU2i978OhKdybbk6qFK2dz+YUWNGNwk4fMLXk3Yu54CzHoqYDIemGQ1?=
 =?us-ascii?Q?MyJ6KLhuVXnsdByiNIZhRAMWv7F70cXe0UajZ76JP1+nyUWHnwCJVrTO9yb2?=
 =?us-ascii?Q?MFCRVRjmVvkAsZcJVNr5HmjYBE6pcCKr8M/cTO03?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a697c735-cadb-4149-572c-08ddad88e9a5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:22:50.7731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RKMsk5O/elGq3FUDseNvCS3zDvYu1VaVTmtVFD0tXrcIPtqDtEBs+RmIbFgQzDi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10140

Add binding document and driver.

Joy Zou (2):
  dt-bindings: regulator: add PF0900 regulator yaml
  regulator: pf0900: Add PMIC PF0900 support

 .../regulator/nxp,pf0900-regulator.yaml       |  179 +++
 drivers/regulator/Kconfig                     |    8 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/pf0900-regulator.c          | 1033 +++++++++++++++++
 include/linux/regulator/pf0900.h              |  264 +++++
 5 files changed, 1485 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml
 create mode 100644 drivers/regulator/pf0900-regulator.c
 create mode 100644 include/linux/regulator/pf0900.h

-- 
2.37.1

