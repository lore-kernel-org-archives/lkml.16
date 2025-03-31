Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED564218E99;
	Mon, 31 Mar 2025 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447802; cv=fail; b=Fp3q3eTy6U4kiz7rcZn/0yK8Er2seos3nB9aUMPJ3DgpvfuL2pQ9zE9ftd6pKjSv5YzvHPUEY9dVRKQwtWCdt+LFqd4tC5SNtyegwrPFf0LRXj+9iIYk1panoJKCWX4zi5xojCXba+UBqDE9DgWDf9aO9229GBjkOG2NG32AtBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447802; c=relaxed/simple;
	bh=hK/fNpjGPUnaCI1CRWn2/S2soSB5TcGAWdtKUcSxc3U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=n+pw448QoDjHcJNqWTgxAGhLTeZZlOj0ZrOAq5WGEb+simRP3RVgbfgalZdrgDhVzzXKM8YSSl24jfGuF2UAQQ5pdrEZ89jNjJZJ4A8oGtjibfkmpqHWODY3xLF0uYXVDmBrEXEI1wrGSAvC7RfVFavwGBiQmHRf+NjKEmi9wOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PrWqeqqp; arc=fail smtp.client-ip=40.107.105.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PrWqeqqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5Pw2AmlSkOq5pD3rSWLL1xnOMleY0SoP0r8HE6d92mkoMys/MlO3VfkXoezErn9ItvWjFXH6j4TYykDrLTKBZ4dtyqjkBadIo2R+o+EeS1VEmIJn+5bVtHiARbY8ueGDHe9lZNnsk6zQDljPAGyne4NrxCriz6/koKFggfMbY9O9PcT6vaAa0qWjc44XU22IJaC2yF6i0CTGuQRvLX3NBK744K6lNSd+OhwwPDhdJ+Jqnt4Xfp4mPHsaC3NhsWfu+L2SreDR/YJbJrQ8DBFQSwenQAd14fu36N29QUZjlp+C48ZrnB6bS5qz0/PHy6hYeiOwx8wqksAY05KSWj1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCY2A6ngMfvfncQCIZW9WQ8429+rsuXkdVA/5MYPD3M=;
 b=U0eT/rbmWP4I7kXjs5zjlHnjkwKBr0OBkgKc/qyU5CU4yIk63Or4ASWZ3mFV5fv3MvuSYeY+gVTF50Njj0/45UaCy56zMdVrT+tJIWHzzbvGc+Lsy+/0UjRLLUmiRRyZjC6vedfLhJrA9d/bA5wnZ+2aqfKuWHMrk3bDwiH0eet5R8BJNzwHbuv6yiLHhlD4MfiszaqBJrmaQO+kGGFcjDVjjR7fZrlCIN9QkOGlLwbh9N3YyFl6f0qgZ49dLc+eYDxdEX3k/LNPm3dJ8DA7mJwxu/t4ixJRiEJRRNixorvmjVnaF9HEmmcifJrYhMAyE/MCV1SxtNrr0c567ld1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCY2A6ngMfvfncQCIZW9WQ8429+rsuXkdVA/5MYPD3M=;
 b=PrWqeqqpstZXnAJBTgjPbu23n6Ea/amUf5JopVuVUIJC8TiwQGvhkkwndI18m8vdqC7w9A0jQFd+ucI1LAG2HaCEFglVVYhWg/Wx4qsuz0h+J11gsOc9kjthG4pd2ajI+yDx/YBkcnDc1EXddN6i5KE1KxJRkdSEVMIxUEhrZ2FWlylH/+ASfU81PdMU9Ann9sQws1DHrIPybwZgpX4daXW/iCRhPg0xZsB3YrLY16col0eSfEmmynWX5IX4UF9Pw3HkpmAQiTrHukOzyJVGyCWT9I262v7WKlZ0eDZGi6g00dv7J2p8VdgU2yCL6wNKUiFHBim2tFd64tnZpP+x4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:16 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 31 Mar 2025 15:02:42 -0400
Subject: [PATCH 4/8] arm64: dts: imx8: use common imx-pcie0-ep.dtso to
 enable PCI ep function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-imx8_pcie_ep_dts-v1-4-270ef0868ac9@nxp.com>
References: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
In-Reply-To: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=5205;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=hK/fNpjGPUnaCI1CRWn2/S2soSB5TcGAWdtKUcSxc3U=;
 b=v0FAgL0/aXJkRh+PlewuAmRH2DQBMWmCE8olBmF2FC3G+aZX5EP9xcS0d5KccN4AbgQUQvD+f
 72bTDjaTScqC468yCIJOWmZyTn6LvQ5u7ewN/pUg0tY7lvUxIwOqfWA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8b81e5-ca44-49df-9cde-08dd7086b188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wko5MWgrTGhEK3ZLUTZ5bG50VU9Ld1lHbERUUDFsK3BYSzR2cjlqb05TRU03?=
 =?utf-8?B?MUxPaFRFRnFXOWRJVEdOanVYVVIrSlFzUUUxMTAxSTIwaWhuUDJxWmxxQmxH?=
 =?utf-8?B?MkR0RW80WlZJU29Wc0NiTXk0UDdsNUxFdXVIaTlSMkhKRjBMWmpLMkZXYVdj?=
 =?utf-8?B?WWw2dmFobUpxL0w1WTJ6cUZKY01jRWE5eG11b1JFVDZOZSs1NFU5ekRoSmwr?=
 =?utf-8?B?bFZPUE40OTdudXJRMWc2cUp2R0Z4Q2RXYm1mbWJmVVh4S2lkaUU0N2dqSm5k?=
 =?utf-8?B?UU01ZFBrZjU5VG5xWHgxa2pNbTYxaXIzM1JrNktTUTA5MDNtSGovRFVJSjlw?=
 =?utf-8?B?Q0pVK1NNY0xlSEhITTFIRlI3K0xWdk40bldRSHJKVlFZMHFjRmYwM0NHd0Jp?=
 =?utf-8?B?aFg4KzY0My85OW9PRldRa0czN1FwbmNGd2M4dWEzTG95Q09JWE82WVNpUFhs?=
 =?utf-8?B?ZTZsNkM5TGhvci9NUmVYdU4ySm0xZEQ4OGlvM1FiK3Uyd04xNXp5NWhZR2Uz?=
 =?utf-8?B?Z0Q1Q3dyNldVT05GTWdvVTNzK1o2b2VGQkNFdFpad2loODdxNnh6UjhydUpQ?=
 =?utf-8?B?Rmd2YWxCc05HYnRvOUdBc0tWc204cHBzNG9zUzdaYnVXUjZuMCt6VzNvcGlW?=
 =?utf-8?B?d3dlNGxhM1J0V281TElhWWQzWGVERjNuN3kzci8wSGFPQXlua0M2b2xweDNZ?=
 =?utf-8?B?aWNlbDVRZUVPczMvTWJSTFlHRVM3eTF4c0twWHluUUxJS0VoUWMrM0JtWXMy?=
 =?utf-8?B?MStLaExJcFlsZll0Qy9kam9PRncwdnNmZUoyNVBIWFp1Njd3d3ZodkpkSVN4?=
 =?utf-8?B?d20yekJoZStOY05yT1E1M2psazByeXYzSTc3VFo1QlBWcnV1TTUzcVh5aUZY?=
 =?utf-8?B?c3NPR0dSZ1I1OGY3MWQrS0VmUkJBelpmV2Z6ZGRRREFOWkFrdzFiZFhNaW9r?=
 =?utf-8?B?OWJxendZUUpCblRhRU1nMklmSkZTNCswT3B6cUVVRDZqWmxzbllqTHlKVTBx?=
 =?utf-8?B?ZWx0TU5sOEV1V0g4MU16a2dFQ0U1TzVUQlNhTXZDWmk5QmhRbFFtTmsvbDRE?=
 =?utf-8?B?eWJqUWtNb0RMeTRuTjk5eDFKSXVZUGxXcE1qL0QwOStHZ1hCUjN4cHJ6Skh1?=
 =?utf-8?B?dFhXMm4ybW1JZGhFbHh1RWZzRXh3a0preEZBZXRMRTlpL21BMys2U0V6Zk5T?=
 =?utf-8?B?RTFuVHIzZGJoVnpRZEg1amRZbUpZZjdicHFUYXNGN0dhbUNTbWxJT3RoaVhV?=
 =?utf-8?B?dTlTbndHMWNpWTFsd20wNjlRUnFsNnF3L2VkamQwekdlV05tdUtZZW5YcVNr?=
 =?utf-8?B?SWV3WlVsMFhLeXdqb1ZCOEJ1eis1bzJ2QS9hdXQ2L2dkREhZNkZ3cU1nM08y?=
 =?utf-8?B?dUIwVjlORzIybTd5clZDTmk4a3F5azVXSXg3U2dkdDJ1L2RRVjNMVVZMWnJX?=
 =?utf-8?B?NnJROWNYWjhJNk84bE9yNFFsNWdmTFEzMDVmaVc3Q0RBT0ZWeXJ3VUVpT1Nu?=
 =?utf-8?B?WTYyUFZ1M2F4Ly8xZmx4VFMyQUYwWEl0UytrS1ZyazJYN0FjdTREVDJGdkRX?=
 =?utf-8?B?czFDSlpENG5VS2RHRm1UMWl0TGJPbnlOZDZzb3lNYVFFZkVtaEhmamNlbmRT?=
 =?utf-8?B?OEZyU2RyYVdNSGswN2Vvb1BBWmlKUTNSQkEvRDBDYXhPWGMwc3JGMFVGYUtj?=
 =?utf-8?B?bk1ublV0VmQvUVVhUG4yVE1kaEhQWkRYMlc2dzJ2dmRTeWlIV2ovTit2RWR3?=
 =?utf-8?B?bkhKL0hNL3MwdlJuajZGRWZiSUNIdTdRR05lbXBiaFVQM0xpUkxlTTNwYmp2?=
 =?utf-8?B?alhDRjBMNVBRQnF6TXhUTmhhRjFySHl3Q0UycjJZQi96V3FWQ3YrNEw5TmpQ?=
 =?utf-8?B?Y2FyYk5MZlptL2hTNDdIRE1ESUdqNHJKNkJDUnVxaEFSaUhLUmZZTFpPQ0VV?=
 =?utf-8?Q?QktUT1KBBEeSbXsWDioGTuxyzlsKnHdc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjQ4NFhoZ0t5WlhiT3BQV1pPdjUydWVSUFVYZW5ZdnpraHZnNHBCVGZtK3Zx?=
 =?utf-8?B?cFI3L2Jrc3hFSENJS2E4MFVHaGhjdUMxYkVXNTA3dUhVQzlZZXFhb1Nvdncr?=
 =?utf-8?B?MVRWbHA2TU8rUmNDQzI0dkl5azc0bmVaVFdHdVJoTnRZQTEwSUJQU1BLdFVr?=
 =?utf-8?B?aXJiVzZNRk9MeXhxUUNFYmR0ZUhOeExVbFNnaU1QTkx4Mno0TmhqNjUvaGh3?=
 =?utf-8?B?cDJ3M3RrZTIvVkhyeTVpL1UwUDk4MjBWUlFCYW5QZDRXVEQ0Q3lvNlFTSGRy?=
 =?utf-8?B?OE9saUQzVGEyQlpmR2pjNWRKcFBlbFU0MzhSVFpSaURCcVc3WWtvTkhrMTkx?=
 =?utf-8?B?UHB5Uis1WU1GOXZPaEtSNGlhb244Ym1SU1VWUHI4dDNPaEdqckp6ZEtDRHA1?=
 =?utf-8?B?SlRBdW8yZDRxTjV6a0ovQndYVE02NmJnaWxzWGtnVmlFQThuZVlrMnlBUndI?=
 =?utf-8?B?MkFwRU9XRlJTUytRR1dOQm9DLzVWK2FYSTc4eWhaS3E3U3BMc0toSnZidElV?=
 =?utf-8?B?NW1tYmNIWWNPc3BTcXVER2JZTnV2Sm1tdHF2aXFSQXFjN3lXRnA1NEYwTGpP?=
 =?utf-8?B?Q0svcHErN2lVQ3JPR1AzMWRTZ2RjSWovSEcvUHJGZ1F3SnJ0T2hXanoyTVM0?=
 =?utf-8?B?dFkxV3dpUWtCRHdXaEhVMFhKbEdNcHdMa3h5SmUxOHNQcHlzM3Q0Z3IxZkRT?=
 =?utf-8?B?bnhHRWJEcHhIcm81dDV2UHFtLzJPWlhYZUd0bzNYTnlrVzNUVFlORjltT2xF?=
 =?utf-8?B?VGprNFQ1TXZuY3k3MVFVOHd5NnRyRTBvL1Bmemo0RDdZNGhDTVJqZFlxa3hi?=
 =?utf-8?B?ZmVKUlI3ZXVxckl4QU1IVjR0ajZMa3ZHcldvM01hMFJzUzFISEhrTWhiVkt2?=
 =?utf-8?B?ek0zWTNFU1lPV2lza0E3V2RPaThnNndlS3ZLemRHVzI4RHlvd25DRUtGMEtQ?=
 =?utf-8?B?OEdDUDZvTUxzZXQrSnBmTlI3WjhTUnhDVzRFRjZ0d0JxY08vQytrTC8vMjNY?=
 =?utf-8?B?VFB3dm1HZ0I4VjErejh4endvczBRWDdqYW11eGpIL2JxQTd6bmdXYXBBTGhn?=
 =?utf-8?B?aTVoak5tT2ZqUUZub2drS3RpalV5c0JtTDhjaDNpcm9oeW04OVQrVkp6S2tm?=
 =?utf-8?B?WjIvZE1xWGVtejZpd0RKUnFON3RDeUFVTG9yYWVaK3ExbUplS1U2YjFKNUtV?=
 =?utf-8?B?ajVHOWx4MG54bFZRMG5GRk5zK1U4NHFmdkNMaGtEOG9jNy93cHoyZGtPcGFk?=
 =?utf-8?B?SXFibHl6eW5WV3IvSklET09qVUdIU1JiRFJGWnd6RXpReWg1ckU1Slpabll1?=
 =?utf-8?B?UlluaWR3Kzl1TEFvZXEyRWgrU3VHejh4VEFiU3o0Q1U4NHNYNzZkemhVd0JI?=
 =?utf-8?B?OWQ2eXdCQ3hYUFlIcHQ1ZFR2d2ZVWmo2a0xKR2Q5SFlYQ3d2SkZhQzZsQkZk?=
 =?utf-8?B?NHdqMDRDMGo0ZkxrOUxaY0ZqMzdQUHVuNjdsM0xTYm5iVUN2U0JwK1Y2WnlY?=
 =?utf-8?B?VkR2dmt1RW0wS2NERnBzbkM0SVQvSmlDOFJqcXppWDIzeUI3cjRmeS9JL2Zt?=
 =?utf-8?B?cy9uaUtXakVGejRMSXZrcDRqM3J4UitYYlI0QVZuSDVFNXZhWURyamtCdXY4?=
 =?utf-8?B?SGFHbHFJT2dIclJPN25tZnlKSE9hL2d2NmI2anhUMjlVNnJZNmJtdnZyTFhn?=
 =?utf-8?B?K3Y0cm44UzJBckE1U1A4dGhCVVZSZkpWeUhMcHZwa054WERWeDdCSGdYTTlB?=
 =?utf-8?B?bFBvVThnankyYmFGaGYrczRWb1VTNTFJNkNmbGFJRXZkdEV1aUkwTHhYZnlU?=
 =?utf-8?B?VVgyaFZ3UDBKVmZneXRydGRMRHFaNytqaUo0aHIzWm5hZG5JUkhOd2hSdWo2?=
 =?utf-8?B?cFROZ21aR1ZuV3Vka1ExdmpxOXVQdmlYTFlsZG1taGszNXNwa3Fpb2Q3alRF?=
 =?utf-8?B?QTB1clNpaHFxUzRUZ1ovdW52M1RobCtoMGZQcjhnNFRmcUZQOS8yTTVHVTVP?=
 =?utf-8?B?M24xOERYYy8vVmZEbm1FRmVsdmwyRXNUMWFCcThURXlQbEZJMVg3L1ZXRkVX?=
 =?utf-8?B?NEdXUDN2bDF3b3ZJeFJwNU5sTUtnTGhlaWxRL1pYVlFrdnZWbjJ4S3Nud1Zx?=
 =?utf-8?Q?VpQQ4AjFJW/44y6LPRXSGPCtz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8b81e5-ca44-49df-9cde-08dd7086b188
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:16.4218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HT3nAFKCt6h/L59g2/bSSXTMFHRvIt9mKUPD8ApMTaaGvzkzyNh5oSUOzWP0JGYNpDTKavJazmWgoVZcPfXtFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Use common imx-pcie0-ep.dtso for imx8mp-evk-pcie-ep and
imx8qxp-mek-pcie-ep. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  8 ++++++--
 .../{imx8mp-evk-pcie-ep.dtso => imx-pcie0-ep.dtso} |  6 ++----
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  8 +++++++-
 .../boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso    | 22 ----------------------
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 11 ++++++++++-
 5 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d6212..8bea36060df22 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -104,6 +104,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk.dtb
+
+imx8dxl-evk-pcie-ep-dtbs += imx8dxl-evk.dtb imx-pcie0-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk-pcie-ep.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb
@@ -237,7 +241,7 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
-imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx8mp-evk-pcie-ep.dtbo
+imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
@@ -284,7 +288,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
 
-imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx8qxp-mek-pcie-ep.dtbo
+imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtso b/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
similarity index 64%
rename from arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtso
rename to arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
index 244e820699b50..ed73284d9bb61 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtso
+++ b/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
@@ -6,12 +6,10 @@
 /dts-v1/;
 /plugin/;
 
-&pcie {
+&pcie0 {
 	status = "disabled";
 };
 
-&pcie_ep {
-	pinctrl-0 = <&pinctrl_pcie0>;
-	pinctrl-names = "default";
+&pcie0_ep {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c26954e5a6056..10d3cf31e8b43 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -697,7 +697,7 @@ &pcie_phy {
 	status = "okay";
 };
 
-&pcie {
+&pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
 	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
@@ -705,6 +705,12 @@ &pcie {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	status = "disabled";
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso
deleted file mode 100644
index 4f562eb5c5b1d..0000000000000
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright 2025 NXP
- */
-
-#include <dt-bindings/phy/phy.h>
-
-/dts-v1/;
-/plugin/;
-
-&pcieb {
-	status = "disabled";
-};
-
-&pcieb_ep {
-	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
-	phy-names = "pcie-phy";
-	pinctrl-0 = <&pinctrl_pcieb>;
-	pinctrl-names = "default";
-	vpcie-supply = <&reg_pcieb>;
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index a669a5d500d32..daba830668793 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -539,7 +539,7 @@ &mu1_m0 {
 	status = "okay";
 };
 
-&pcieb {
+&pcie0 {
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
@@ -549,6 +549,15 @@ &pcieb {
 	status = "okay";
 };
 
+&pcie0_ep {
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_pcieb>;
+	status = "disabled";
+};
+
 &scu_key {
 	status = "okay";
 };

-- 
2.34.1

