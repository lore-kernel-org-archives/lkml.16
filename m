Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2077.outbound.protection.outlook.com [40.107.105.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE44298253;
	Fri, 23 May 2025 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017087; cv=fail; b=TiAlSrOs8MZyT+4tqnd1yWgfzgU/McfO2LFylobP60GhgYZOhcvKQFcxwfiNabeRfIF9UwXo0irgtWZqp+49danHa/HBaLQ5K64ydCBoytUZ41s60pKUNdbADEkA+g+lShUWQSnsgsWHBlZtnz9pcTBZAS7VAmr0y6h0yDddV/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017087; c=relaxed/simple;
	bh=jOsN36GEZUSmWDbLG69F8WS4qQ86Qmc7kabwpZSw7Ks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aG1Q16Zx8EcEYEZ1kYqEPv+o77W2SRMgxQHygAky8iZIEHf378fetGHNtQZCdPtpkHn8YzDlNv7+JwDnrn+/Di6gwGhpCoTgRBW5LC6Fx2Y47yr5Jgg3Mnbp710eko3Pv9xN8bOz3GO1rKRK/nWFbPZGFSDRoprP5mmUQBjwrC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oOd4uEXc; arc=fail smtp.client-ip=40.107.105.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oOd4uEXc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkBl8mr2WWs5U12O7RnEmBvkxfiRLZ+Tmvak6wqmWIZsDlbpkIxdq8XUqJlt2ZxvePcT2FLqMzLSFREyhHuMTyb2tCySXZ/Gj9TCusi2K2Tr2xdidNlaFHnT4Zg0pDWfQmaXVw0fr/EHUsyZffcGwQg0zy+ZQPLDOd8xA+khwGkaaTuZtn0RK1HqH1K/XdcGtNfNQbpv58MHXuEhIIKWbD73xw62Yf2O1aLDITdFmwvwh/Fw7UHFLDZ0F467t6Vwixqsx076HAQjF4D4k9n9VTCzqOailcZwnWZoNhpPfSB47QpN/4YI02luS977oX8kcpaEYwfQRDMv844byOnm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpcigNi4lxpu6eFdZemWyTezU2s0a/BnVt+Cqo9oj2o=;
 b=bwUOjZE40XhL8G4Q/+JD3FLqQCyO446I1xHbnLe8F6gIL83DU2fN+9eiQqqNRzc0vY4pBfWEVceckUcQkerIr22Bc04Rfho3zPj8qfcM6KwgKkJ8SMJvr0lCqWjuAlhUN1JSvBB8M0SZ/46SbtGNOfe9LLEcxqLRKB8/LqfOB8Hup0k2PTjbNbBLsfvQD8M9MGY5iE+Vh5cwTAreukmO6J4LZlp5mFTlqdsr1UhXI/1UI8R5ARJWZRH90LONdoaJ+LU5G9ucQKIcdktEumtlZVBcw0pIwu7zIKkah7lMLFDe/ooGwyVZV4l5FdSmm3y6y0ls/d0g+IfQ8p3hYFYEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpcigNi4lxpu6eFdZemWyTezU2s0a/BnVt+Cqo9oj2o=;
 b=oOd4uEXcjKIz5i4k/Ov1w0grj153UNLrOvUXqfO6Nip06NZZyPsdN1Fu+TXJ07zC/qWU1DPkcUIIap5mRNMnQ+GjgCywXBV3V86MIT1my4jo/FmKepDiG9QnismBmp7pfGJaZXngO52+x5UDVbj8X1Kk5+Ddtg1MMd6lzkscDvcv/34O1F6SGosyMOLp7bKGDJJXVEdWIIi701LF38roYDFsLfjGZXsa9S3TSHXyBn7cMmhGlgBzttOdsotU3UdHH1/hobvgIPPqPjMSpi/Jv/yp2rEW4G8fiSxvYBwWBQZ5BFqRFB9ibedi+YmwqsCZ8D1Y1yrXoLJMb9E53ViaaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 16:18:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 16:18:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE VYBRID ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 6/6] ARM: dts: vf: vf610-zii-cfu1: rename node name *-gpio to *-gpios
Date: Fri, 23 May 2025 12:17:25 -0400
Message-Id: <20250523161726.548682-6-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523161726.548682-1-Frank.Li@nxp.com>
References: <20250523161726.548682-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: e7faf901-50b5-4224-545a-08dd9a156418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u9ei4UE+qXdtIoIVYAca/JdxKd9YGAeBkMq7uajZzMoxnphxX9a0de/f5RYu?=
 =?us-ascii?Q?tyrLZQz3W0+w5yVdK92s4WpJqGbl+dAs59UOMR7XeEghWEGgHtDJ8vYMhIMa?=
 =?us-ascii?Q?HtK8FPdDVQV1EeDlP2BG7VRmIbzZ6oofdxvSY56XfAQVmns8nd1r/vUduIxC?=
 =?us-ascii?Q?0E0p2+rCQLJinRBrTIbsHvhyuiCnPrKZLpqbnWDS25vaf4ZmP0zkA2N0LM7z?=
 =?us-ascii?Q?GvT6B+9zTeVnUV7y5rh44BTZohd0hiVKxSVodMs2+vbH/R3/eI8ntjAb47e7?=
 =?us-ascii?Q?aE8kyQ4K43aw7wowBeQeCkseFVj2X79rLmAHugIKLfneGUGi8zQRFC5fBEu4?=
 =?us-ascii?Q?N5CITgQLDU4afWgjqCdulCe7TReZR/pFUkIKvtoIg9rg9u0wTUeYbmy0XTnr?=
 =?us-ascii?Q?0Ix9H6keYKsirPQVIMLD7RKzT8qcmTbIjYFWYmDaJCXRVJ/BUSd+rthvevpT?=
 =?us-ascii?Q?/Ow2bfMTsF+a5Q5ZKCjXHPMNEmByWmVExD+LqlJhuL5N+RQBq7fTiYq1pwPe?=
 =?us-ascii?Q?2n85a7PN7vHCOEVrg9z3/Hd2n2SfoLLaN9R038me2lMmV/9JB1qFhMggipoQ?=
 =?us-ascii?Q?NsvdjUqvHUjAC6wl1dv8nXqsruOX0IFFOMfo+ti+UdM7A+FQReW9yls5/eCR?=
 =?us-ascii?Q?XH4ktKVihoZD1SIBHHacJ2KHcJ62+Y9M2DKGBroj6iWZ4DK5Gz4LzueojvIq?=
 =?us-ascii?Q?ZckYW5D/IH9dzfZ3qdEdwyTKxQg3WJhO4bpdi8pKLC1Xc9xvgwErwT1CTKjP?=
 =?us-ascii?Q?3KFyS3fhaDbRM/Tsl67EZHfqxtLbpZ0XcNxEV/ekyrlP0euXfLWWgmDbnFQ8?=
 =?us-ascii?Q?SB/9iCe4nbmvpDlI04JkJjtmeClBNwSv830kbLpqpSJPsqQe4E0D0p8wFyPr?=
 =?us-ascii?Q?HyZKMplugwgae4m1LjEQfl7A8el+GkeEf9InVQafyanG1p77nD/EVLlO0tqc?=
 =?us-ascii?Q?ibzE/YAk1pvjAXHh7ZRyU++T6ZQ9Xd+SWv22lOR2z7gBXZQM/KVqwhpSmX5n?=
 =?us-ascii?Q?3Emu5g+p0mrt1wtZGzM7QSGM+Az3gI8LZ5jR86o7gP4uAvo68PYZ/EfFWUS2?=
 =?us-ascii?Q?ppYHUrzk/6TjTEB/Zba0zfFPonG+K6Px7SWEaoU/mVOj5e9lf0sZuGzCB16f?=
 =?us-ascii?Q?hQbkNmt6Y5XGO5ukPOEEFksTLVMPsHRtCXY+JjQSmaW0bHTBvmRf6/p90fzn?=
 =?us-ascii?Q?lgYrm2nyKbU02qeOVHYt1/5Y/4SALf4hudmduDiKv8u1wDlV0thkPwYqzcbk?=
 =?us-ascii?Q?cOkNkWHeeHPoCxFlXXWWCiR1tCy8dGNwqPZ9mL4qsmC83CLAu/BsGpmNXOar?=
 =?us-ascii?Q?xDWSwwZCdemTT0uOQLqcYFvBsWhiv0hH99xt9IUF9EM/oSCGN13EZZLimXIp?=
 =?us-ascii?Q?7p7K6w/LC8a0FmPWlSfGfLEQoBnm1KHWwVoF13+WmrWjGVLLzFCEw706VNtm?=
 =?us-ascii?Q?Hipc8UgEhXVHuguOuPGgqnclGSwtKFbhL3RhQSVJDMM9FhWeDHvKiIJyjf4Y?=
 =?us-ascii?Q?Io6gH814W79Y5Bg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?92qMndaJf4BJR/jwjAs7PXWtSRE+bSW9Rf3MpauiCrie41ZTmbwji5AJm0A1?=
 =?us-ascii?Q?J6HR3TZbK2NAyG5MeUM8Ik2AzmsNtecp0J+HOjtwNkLx+g5XbqIEU2HYtDmW?=
 =?us-ascii?Q?nXfAfchCQL6F/dfdVKvbZeBUd9NWUb7Ng5RfowqBj14dEDcB8DVxcbnYUI4J?=
 =?us-ascii?Q?2oQ1CxFScs26QUQCwA4b/vxbEnvjuvfJNdouyCa6jXrxMTvU+si5CyY5HQq6?=
 =?us-ascii?Q?+20NkOFzvs1phHF18//+TIdxXPhyKsFBiYWMXHRlH8tg/cLJp2xWzcpJrdsN?=
 =?us-ascii?Q?Udsavyx7WiPNuYMSW37pip12UvlMsPgfCZCXA3Cv/kXNkwsXedEXbVrDFEIH?=
 =?us-ascii?Q?hNyvIxg5kGeUHGWXM2O18wetP7/NbLN33ZyZ33yp+QSao467JkFLRy2fRhnK?=
 =?us-ascii?Q?025sIqHtnWPOj6Pfpgh28iJO4el6DKrWn6n3HwnIAMZ1pcgwoF+ssEH2/Ui6?=
 =?us-ascii?Q?E73yrSxY8jIIeUCX+0ZScG7gSf8IU1hPQOcLfalSt7gHPqQ9fCSvlNGbMIbx?=
 =?us-ascii?Q?WS40K/KyNcxfSrd7icseepyrSteLzZ+1kbR6tpb08wzSkKf6N6GqK4zc4c8o?=
 =?us-ascii?Q?W034cWpfkLQlQvTyabstFz/B7lQ7oqh7ptZ7xkV5WgDzNvplhGmkuEUUflS2?=
 =?us-ascii?Q?WGO3q4yINdFoBCMVe32DYXKrrs7cAwczf5RNdV6531TCEHtzf/DS1S/ZE1GA?=
 =?us-ascii?Q?u3XtP0h/Oi3J+KLAe7+OH317YaCGWZIYvuxDgax4zgxeP76wuqfvNbEiW0I1?=
 =?us-ascii?Q?ZRz1YRAp7MjYmoiL1O/VGtLzkcubGXO+vKmTB5BkaM6h/9en9QVRW57oAKyn?=
 =?us-ascii?Q?fCBRXF8A6w8j9rNFWGNRI5flsWo+dq2u2o/smbXXO8u/bWNumNQite1q69Jq?=
 =?us-ascii?Q?ZLpWc/gEYJm6txRSmx1scE7ZKfGdS60JwZRcfnqYYH2S4OTIghsA2wozqrNA?=
 =?us-ascii?Q?IyQYkNzpPSP8x8nf60fUUt+5SQD1jIwXcPWcjZmBngkOzKftJ5JzqJ+P8r5y?=
 =?us-ascii?Q?a9xGPT8ue3dSx1qWTAc+cZm/qrGVSjl7ZFS0JVPVNvg5F3O1RWE2QVz+eRUM?=
 =?us-ascii?Q?b1MCHIr7c6uPtQv9chFn6hmxy6OMWQYjYwkcl9uA63UTw4ZlWHSd7a8ass1e?=
 =?us-ascii?Q?rfh29EBLxoLPQnqa8wOsnPbcuZWfEvjYsnmAgilqHIo7UO0PDwQkz1I/rU95?=
 =?us-ascii?Q?bBD3WtP1JS5+/Vf0t51LykUrt9sK1p4vJoyJnlw3NdEBKmj91BOOkrGoLbbX?=
 =?us-ascii?Q?ECNC3GCz+dQZzm3OnrqM7ZtbQUlSJWfUanEgPlKm2qtRTvUY/9xdDX8FYzjl?=
 =?us-ascii?Q?LcJqrAZirx1wz10D8eLei0vEmI7rY8VR+fIfQGEY8c1mfIBd5ZviwM9gYsU2?=
 =?us-ascii?Q?ugRivxd6u5TBLcUefwaXynXa4f+rDVjkzlEWdK/kAfOVHyin1CvAjF4uqMAI?=
 =?us-ascii?Q?nxUzDR5+WN/AvyAqjTdK4BFEcRwZVDeK55Wnj7efSuAxh/r9x1LV/v749+mu?=
 =?us-ascii?Q?UD20iOh8d/4apPuN/DcZZPq4rQ+VVmSB3+8a76epnBieQ07tQVB6CJ2I0gDS?=
 =?us-ascii?Q?Qyktz5lYZHgNXiH+PwAeWelYxpHGAEHc3B2CI38i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7faf901-50b5-4224-545a-08dd9a156418
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:18:02.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeF33uaIyFZGuXjb8LnIhFA/TugcFWXKhhht1pogwgTFimHl8q5HzYY5GzT9/hUjTnqNPLl8wyyliCuRKKkucQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966

Rename node name *-gpio to *-gpios to fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: sfp (sff,sff):
    'los-gpio', 'tx-disable-gpio' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts
index 24eae049af69a..929426c1299cc 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts
@@ -68,8 +68,8 @@ sff: sfp {
 		pinctrl-0 = <&pinctrl_optical>;
 		pinctrl-names = "default";
 		i2c-bus = <&i2c0>;
-		los-gpio = <&gpio4 4 GPIO_ACTIVE_HIGH>;
-		tx-disable-gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 	};
 
 	supply-voltage-monitor {
-- 
2.34.1

