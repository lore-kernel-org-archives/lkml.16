Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C601F892E;
	Mon,  7 Apr 2025 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038969; cv=fail; b=WOlSFoqNjCrVUIB4IhQ1mRQklcu5gS9RvJQkqnWIkqa/Pw+smbU99V7mwrQUmBMU8tydHqIQsrH+pUmedJWmgOQsvxl9IIlvH0B+ffuL7huIXbVtBVFrmCjfr6WvzucF48I9iHkAwRyAUuNRxdf85rrNVSqYbBdRdZMk0+EpYsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038969; c=relaxed/simple;
	bh=7vqZulY55DwWfv5KVvlZcVCTmDQXT7INlVAVfABx1ds=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YVpRIuWSOHRfv/UYCN5hTym9+A/h2Q2fZaou9MLxr1hg08cK5g4HfSjyn1rgXUqlpTEWoLTAWo9gSxlJfFm9xsBN4DGhrx1JQqY40mmPSwkf71zHKtGxLPBaitw3i4bp9SyOujxx/YT1jXvUFugcpKXhOqYig4mRSkCr48aakQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DHyC5BPV; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DHyC5BPV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUM9RoPLVBL0z5ghrGqbE9vDqCkJa6iYska1S4qFs36qg/wsieDVinNmXx3poq8uHiWy4ItMFkpwr/WcsLx7j8Lf8zfzdfsBVKswkrhNQ25SjCRK1ZlfGG+Ezt2SZJJAQB1g5X2Tn1yScGFN7Mx23bp8uQ/YFmOj4Qp70BIGz/Xw16ILVc/pz4WJDhzVWGYjDY/ZgQpCp7SXQaKiu2x/DdB5vqGTVZ4+isEwH4p47m9hmCmPvi514nh7JtPclbZyDDs5I8ggTSEd6qs93AfPXE1+WwqSVGRq8aVZ73cI44Gnn9yRnuyfWt4RyPvI86z4Q0BkRr5hE7E9cUnKK+PQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWOLp4Y53gt3LmfcX0XfM0ajs4uRbCJi+SrS5gZRWDE=;
 b=ADMCm8XNVMwFwqGiJRZuuWifXGu8/jvjZUNFp/YPriRpXwZj9ih0Z8JkQnsZMz2fNTXWHqS55j7CHjB5YX2/uZYF8WZIUn9VfXnKqzGsloexlL+FmDTB60ElChLIrOenuIpMergnbhRdPEnUKl5walO66xERhf5BXC5qs85dlHJTZQXucsxlB3IUVzJ1Re32s1Uf8vOEnGQ74FUDIxz5zuSFvKSxGKZ/YgPDiS4d3uZFUcCdzRiNEramxJsk39JF8SXTZmKHNv+WqpSFJpqetnFkj7OApb4OoMgFb91Qw3mSjIVA/ns1QWrlq5dYNfW14irvox7asDc+T1sFcujGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWOLp4Y53gt3LmfcX0XfM0ajs4uRbCJi+SrS5gZRWDE=;
 b=DHyC5BPVP7vEE/KYo7zdFiv4RR/WGbz0Yefg44ZrE7V35SoSEUNHD3mqbNebwxQS5fQrMa++eqqBo3pxxCMKcaOZZa315pRrUE7ER2VeWfGyhuUZs5zG0QSB5uw8s2ie5Z9+T1riaM6W9J9er6VDhjF8vEZvZ7y1+NooGBqMSXuM8v6IVWzNzDog7WMLKCqgp9dd93rvNpfDa0o2gVpoRWzdtURnCjrJ0OTQQv2v+27IZ0F3SKjK0j5OGSQotOYvuTJzia0a/WA3iEjbk8cv37LJ/a2xhaJH0+X5p9Lbyo7qQMq/xtTnc3oTzVH3EXyuJYWKG0BDVWxeOrCvv3eGTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA3PR04MB11251.eurprd04.prod.outlook.com (2603:10a6:102:4b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 15:16:04 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8606.027; Mon, 7 Apr 2025
 15:16:04 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH RESEND v1 1/1] dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX94 support
Date: Mon,  7 Apr 2025 11:15:52 -0400
Message-Id: <20250407151552.2779343-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0040.namprd07.prod.outlook.com
 (2603:10b6:510:e::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA3PR04MB11251:EE_
X-MS-Office365-Filtering-Correlation-Id: 458c5f1d-4916-41fa-80d0-08dd75e71cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a8ZGLabsrYyj0kzIP39VsGpgxe4ULUWNUiu+u8BBB+4bzT5P7gI9c6bihT7G?=
 =?us-ascii?Q?NupHgx5TUMK/wuhrAMbXXmvmz1TToGhYh1RBoUny44twS63mhRZ1u+CFIqVR?=
 =?us-ascii?Q?dahGzqzsKp6WUeny+NLow8SAyhAJ7PWcOvXUmvmQLVqa59hEawuouVYTSsPU?=
 =?us-ascii?Q?byBjUcpyBwWbDw7RyBmKpSFRH7YaI7h9xs60263drdJMaCCXGyRmKbNAT51p?=
 =?us-ascii?Q?GG1g4LPjflcwi0eOI8xWcGAG8Box27y3CsDRxl0YWozpno/zoQGdya4SUm/h?=
 =?us-ascii?Q?SAw2iO25ch+X9rxgARwVAyomgtx59hFHQ4nJRd+GyKEQup/tVdgxymZtrlNe?=
 =?us-ascii?Q?NnlVkxl2gbnaO3JovuCkuXoxm/v8+4VFV2SohUq5ztIFXePkLhKjUkAWGfPO?=
 =?us-ascii?Q?QF+jT+LeqZ10UX3w4+nWYkw6TD4bJcQOT4tN0sSAdqwid13Qqz1cxh3KTbje?=
 =?us-ascii?Q?SI2Us524ktwAeI1Hg05xIMOgQl964N5jg8T3mJ5t/4+aUpQgkH+t4uG+cbDq?=
 =?us-ascii?Q?9C5QyRzb0Avcxc7lDA753Qt8GXhXxj6BtACIlI24DtGKAtRag0S0pACUzrdq?=
 =?us-ascii?Q?T6drofthOifnc8exVtJZ8e0IlvT8PR+t/+W5PA3Xfcdz5FL/pqeFhQMEH7Z5?=
 =?us-ascii?Q?RidhE3jqgx//3vDndIeT2xUZ6KtVjmnqj2IEBPUE/JFnr0Fk+1TQ+oA+Iw/1?=
 =?us-ascii?Q?ZIEmlfj5uhRZO5NPxjIjp8fuvKesnacDSf9Z1bbcWLDsIWu8D9gym+1yxK11?=
 =?us-ascii?Q?gjlMelvbmz3sgUz/5zgLpAehyeCL00eyYfIsdsUvrAx6snkVK5Fufc55vh9f?=
 =?us-ascii?Q?p8OV8xAfbUZwC9tLgAhS0V++PozoL1oEmP/FssIYltYqmnj8XwByEAtkqKZl?=
 =?us-ascii?Q?asKdKAwnV2FUMZI93ez13+R4xFgqOnxEtJHmGIe/ul21iVY3OxnoSKMTtmFE?=
 =?us-ascii?Q?NTztY4Mv79j/BsUhJCNO6exbUVSZU5pxfuAabD8Bl/wGerp71RhF8i/WKrtO?=
 =?us-ascii?Q?uo4ujgrMCKnX9BzAQ3ZA9fpPVCLtIOfNHz5prtb6Nnp46BJ2o8LdYlQF3brB?=
 =?us-ascii?Q?3Vnkz0yNZmi8ArCESLE2QEY1hmE5P3WR1NuQ1bd5FaThlO1Qp584XISbCuQ7?=
 =?us-ascii?Q?0pY9gzoKj4TWPKp8o2RF6uPhojWOOXrH8rXM0gOdW/j1l89KEW37J1pbp94x?=
 =?us-ascii?Q?cQF2wroH+YSapXn5Mq5ZRgelT7Zny+bJmMEOIDEI1haG01v5t6eRlSD+C8by?=
 =?us-ascii?Q?khsEcJ9DVtZpySEbAL+fKRN7tRUDg6a4xQCrLC14RDAKmP8tywZjS8sPb1WA?=
 =?us-ascii?Q?X9Mqi5GUo7pTujEh8ayH7h+CVBcGRyD4OOhCFChPCCnU8J6Y1Od0zzwhc1P7?=
 =?us-ascii?Q?przW+RoSlDJ9M2KRxgfuu8ixr1dNBABq6DXwyPwz+H0lw2/SF7aLQZkSxYaA?=
 =?us-ascii?Q?gbr+gPS+UildKj1hR20BuiuvsIw4QqIc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5yeEy5Q/VcGjzUvpXe3ftw7MfsHiu9YzNO/fjdeclDyq90PfWbHiB873OMje?=
 =?us-ascii?Q?XoPosPzVQfKM+Eyy6sSMBizFSTfpLHOeNdJIdDDEC4hKTBDK7FDmVwut8Ls3?=
 =?us-ascii?Q?h4lYmRA7bzXckqc4QabSdkL1J24Y28BGpezK1La24CcxSLNBApjDtWLDbmQy?=
 =?us-ascii?Q?+tyciRWY775/nalRS19NaeGIUWux1pjgsO+wUGHqTb0Ad6qq/qaF9lVk7XUu?=
 =?us-ascii?Q?DQue/L4bNubXN8kG5W7FC8NjKyXiR6jcJ6HQWio+bvjrO5/cVplxgfphPt9z?=
 =?us-ascii?Q?8kSIuw9ItuuB6H8Ek98kaIsTqO/QjgGf4JXyLXIQofDHHPkCBBqVH7iD2Vyi?=
 =?us-ascii?Q?wCJ9zV96XiuLHZFyE61+xmkwow7RWThJJ9wQM+ArqkADp3QM4WExBRIEpGzV?=
 =?us-ascii?Q?somMQmN6SFlRUgIdHhoW4TbC0N4ztgdlDmDVg8ijeOXeOlduZhLuBZNcmXEN?=
 =?us-ascii?Q?Mv4npTEQ6o8PMfxJEE2REydKz2E9FpSjozDWo5JDtw7Qxnlgo3qBIWCe/e9y?=
 =?us-ascii?Q?O60xBzFpqY5ND14+9A4lwHjd2ZFCKpzIYCL0Bs6KmBsq14Fvj2WgOf3e/ZyN?=
 =?us-ascii?Q?+4W8liyFVgy+OoFWcH9MCdVWlrRyHoJ9VHFkmJ7q/cku5jwTrTF7pnKjVPVq?=
 =?us-ascii?Q?g5CqzL/B95MIgV/LRVXC4h4Iq4jHLMGjrE2GI27+tqOH245kpKT9yq2OLzsf?=
 =?us-ascii?Q?l2hKUrHvmQm7EUQ+tcBsNmbzENJIFiqV7WMBtUNOKgXhm2ew4LYZVz0mlU9X?=
 =?us-ascii?Q?CGdAw6MguVgZ8ZASMqg6p+IRmiaf51wU2dcjG1t185tyMwp5Rd/7IlvMnUZZ?=
 =?us-ascii?Q?EWHY2XoWe8HWI19z3XFK2otg69/XzBR/DvbvQ3BN70y8XpwUIqw7muLX2uJj?=
 =?us-ascii?Q?klJ6zfzooSAmfo9WjVQwe+7DgS7gctQnkpkhVDYUqH0EQGh0CcxxFmLssVwd?=
 =?us-ascii?Q?R+gNc/XE+4poxsxfqCDt06V46UQLrElxdIlCYj7h56e87dFbQdCiEZLuITju?=
 =?us-ascii?Q?3q+TKVQ+UA3mdzlokxRFgb28FyALKOgfMHpA/tVwCd+aYV6dosDypaQYkApR?=
 =?us-ascii?Q?hV5o57owzh0dhzioaZuvzuv5a+hvhAh0SWYBewoR7INWxHLS9C8DkA2j8wHm?=
 =?us-ascii?Q?2b7HOi74BMCy96x4qrSlF7sHSvD8GzXa384wJzkR2m2yLFmZT/+Q9DMKfpVY?=
 =?us-ascii?Q?NTSqq6wq+izFnhut+AFgBT3msjH67ytQVAIkWnJ/SjlY8rQ1UFJJbQgJ4mYJ?=
 =?us-ascii?Q?g8qhy8bFMMp5LluhXc5iq4KkgPYL7i9BuuOsX72H375k2FHLiKhmK0xvntah?=
 =?us-ascii?Q?EuEgdbjj2P0hpjQVALUiglv+xRJVfCQE7COu7xEMhPTfxdrFSshzwxoNR6bf?=
 =?us-ascii?Q?jY0t7yUJAQXw1zF2sQPH9wn4aqz/sMGpqwTtUgQ8fK83KIN5Tw6//Zu+1mmJ?=
 =?us-ascii?Q?8zQzyHIGNJnOpY78QFIf7/MeDjDV1PrxFqQhxDDot6YVs2o0jEJneUtABpSu?=
 =?us-ascii?Q?wgByy9keXsYMs776Q3xZ2eivaiO/IbhNV0y7MDY4RxUXPGENRmrV0ZwwOTqk?=
 =?us-ascii?Q?+VW9YuDPN7FUaTK6FRbtksJ/IjEdxnw0k2W0/Fb0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458c5f1d-4916-41fa-80d0-08dd75e71cf3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:16:04.3174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nCL488lYrn8EtcldfFx0xsgZRez1AwFtu3JrECUycTST8PFteK2gcQsXCDRMoppEbfoUw/0GGyRcO/pUW2FFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11251

Add compatible string "fsl,imx94-irqsteer" for the i.MX94 chip, which is
backward compatible with "fsl,imx-irqsteer".

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
RESEND: collect Conor's ack tag
---
 .../devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
index 6076ddf56bb5a..c49688be10581 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
@@ -19,6 +19,7 @@ properties:
               - fsl,imx8mp-irqsteer
               - fsl,imx8qm-irqsteer
               - fsl,imx8qxp-irqsteer
+              - fsl,imx94-irqsteer
           - const: fsl,imx-irqsteer
 
   reg:
-- 
2.34.1

