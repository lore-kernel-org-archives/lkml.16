Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E475A930;
	Fri, 20 Jun 2025 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444042; cv=fail; b=cQjONWl4CudhdFAHC/6gC3YBpqYrgQ193tJdnKSmUccO3UyOd/v0XLbEcZUdvl51xnYfW5Qbb+PdwZ6e1GD0f6IiFQYSwEdL9hjlme4qL2F1W/HBn++8icOjXuVT9cUtnl1a3hlSgR/amokNhOjsajn9ozjUJZcwVDUKHXykaTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444042; c=relaxed/simple;
	bh=E3wjhJ58uD+sa5qlE76BaxyJTGCruOpUjiJpn4srkr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CvOweXhZ1nTpLTTY5GyVNHr0NSCfrfArd4NegRLLO0j5nxd5k6Qq1YYxYoKXFil2otnOga0lrXq3ShXc3lrLgRkpeArj2zy/yxfxhq5BI8zH3h26qVG1igB0TaR4KMfoz/ImliWKVm2I+gmr0v+VywGy2SX7WupGm/6lAbXIdT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YczXnsRd; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YczXnsRd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hy0csBX+41CQ4HlrL6lZpH8s572z9W4QwIdoEMpicbFTj07tE5C6HK1XYl7VK/FfeeEx53RJjGgj/i22ljC09r194T9uu3nJx+ikxkel+WJ2DjpjnCD458gtcB2jnn8NroEGMAzT5XadH2zpLHpJVOkhFDH91ZO9g77e2nguphjg21PxTpSQw7d7TTQUU5knAS0MUdRLTPkqRpeehaSePPlFrf2jtfwuo1H8WA+ydemqnTrW8bx+Jl46BmdYSxMQ/pKT6Vmh+yAPTPQtl20HjKT17XTl8w3az7qZbt9CuGgv34RHUzzl8dDYbTrptmqlPKs+cXxQby5abVyrwhP7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJ1PxN29w4yx5SMF5HH/ExzNMhzH3XrQ6xcCMAHL8IA=;
 b=w2NKWNM8YJBfzVVgXb4lVuhjLWopQhhraoRgNY4XYPi+bPz8OtE8rIA0VPeRm/ZqP7eDstlAVHZFebGLGgUl3e4DJ08juhDU8z1g5tm6ypGVRpH0Cu01KSaZQ74wjQRgXG47NxsbNzLLQu58E2qmbx5jrqGwMj+vGWbNx8YMWbs9uUP5Ca8BKaDfN/VyxDuaUSFF5se52HAH84BUD2queukz8JoemCLXm69vNAIzwANN3YkuX5GIYCj9og5AoisedzhhwGFNcPB2cueiACzclzx9mf2dva9q9hDPQGXMMAQnXHoc3vT+wJWlT8V2gLX7Kn/xT9uRJbXQpUJ/JQnyVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ1PxN29w4yx5SMF5HH/ExzNMhzH3XrQ6xcCMAHL8IA=;
 b=YczXnsRdocVX37UoC5ishtWNq3cHbKolDjqJT1qJnCV+eotsQ2NCz16+a8uyVuN41mTSGbrGRjlG+ZirIVZhIg5MXHS2V9ANE4rJxTz8rRcZ0qNIYfwAMv0hRDHMLuCViyDRTCRfuhwykK57DhyG3dkWy2uFjTRu0HfcX5+NBfHryIoXlYwcDaSqZ9JudEtq9JMuuC5q91wiVyib5KDEAsAElWmmF669FLeAKYhdzhC99R4uTxT216re86MQCVROjx5+fDpROSaDXEFuXeKMHhbfMTorj6jZKYI8OVUbhqJUhCasFhm6947qh82WuOtlsG8eEcTy6QvYcv6QzqawAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9949.eurprd04.prod.outlook.com (2603:10a6:150:112::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 18:27:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 18:27:14 +0000
Date: Fri, 20 Jun 2025 14:27:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
Message-ID: <aFWn+aewUz4+vBfs@lizhi-Precision-Tower-5810>
References: <20250620122353.150700-1-goran.radni@gmail.com>
 <20250620122353.150700-4-goran.radni@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620122353.150700-4-goran.radni@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9949:EE_
X-MS-Office365-Filtering-Correlation-Id: d5faae58-4443-4088-926c-08ddb0281419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHp2dzBNRmtzOEdQTlF3anczbmRtVUxLK0EzZ3YySnQweS82eTRSc0owRlAz?=
 =?utf-8?B?NlNhUTFCQ1RrSDFaREo1dzlQdndNMHNqMDhpUlNiVDN2Q3JqQngwYkg3TXlP?=
 =?utf-8?B?eVQ1VFNzSTJHcHI5Y2tpeVM4SWxwNGN4YmYyVURIZkZ6RDlFUmFtR0pwc2U3?=
 =?utf-8?B?Ylc3TTJ0U0dtTy9PL2EyaGNnTUgzVVlBK3o0dDdIUVN1Z0VVTUN3aTNUdkd3?=
 =?utf-8?B?bTdNKzlvVGhsSW9rK0Nrc3Y0Z3k0NHhPazlpcEhWMHZrTzF0RE9mM0k5NlJq?=
 =?utf-8?B?OFlkTnZMSmxGcnNRb0N5TVdLdktaTE9SNmRVZXZxVXpKQjRNSksvcEtyanJQ?=
 =?utf-8?B?d2Uxcm1BRWIvWTdLV1ZNWUdGTU9EWXZaaWMwaTZhWkZrK213S3lpUFFIamt6?=
 =?utf-8?B?UHJKSFpIRXd0eG0zZWhkbmZ6M0RiRVYwV2trZC83SWJoYmZ4RnYyVjI3RVI1?=
 =?utf-8?B?WFZyeHhEZjRSdTlLQ0YzNS9qQUtCTmtjUUJsUlA3VFpmK0RDcm93RW43Sld0?=
 =?utf-8?B?UGFiUWZCWVNMRnFpNW1uVU9UcVpSYTY5RWFtTTlYT0N0ckdHeHJXMnZQU09s?=
 =?utf-8?B?aEVCMW1DY0ZaZXRyY1l5U1NFOTBVSExiTnlmWk9VRjJZNXNoek1ISzJMZUlR?=
 =?utf-8?B?SFd0ZldSTXhJeUVqdE9vTU51SDFEeW9ZSXNWUWlPcXAwZGFhRGd2MkdhMkZI?=
 =?utf-8?B?WVc0M0VZQmRidnNaMDBoalc1K3Nza1NFZlZJSlBxN0h3L0xFOWNZemxTek5i?=
 =?utf-8?B?SWdlczY3akpoY1RQb21XS0J4c3o2N2VueFEvbE1qL0ZmUGUycWlJMyswMnFk?=
 =?utf-8?B?TmlpWU1DZzVqRVpEWVYrMkljUVE0bEErSmhXZDQwcy81cG9sM0pNUGYzSHR6?=
 =?utf-8?B?aWxtT2RkVGFLTHpJM2hDWXVtbXprZTE5dk1xOFJxb0pQT0VsSW5xclRsR2NL?=
 =?utf-8?B?MDZaM0RuemxCNENOUm9VbmY5VjRmMHBaNEVHM0lIbUNmaldrUlI1dDVoWXdS?=
 =?utf-8?B?U3NWODlIcXRkMmxzejcwZ085MVFFR01PeGZWaTVUdEdTSklWckd3UFp4SFV0?=
 =?utf-8?B?azRwejg3M2wxRnovaGl2bkNTU1A1Qk9KcGxvQ0txN3g0ZEd6M2dmVUoweEdF?=
 =?utf-8?B?OGFYbHBPaEpCVEx1ZUxST2JwK1BxcVNWNmw2ckpCdnIraDU1M0VCVnV5cFc3?=
 =?utf-8?B?ZGdyRzRsUksrcnlTV1BkeVlPL29sWVU4RFlHUzN1aHFaeTdxa1FBM2JVOUYr?=
 =?utf-8?B?enZSalQ5aURQa3ZGRUwwRGZnYXdFVVZrSUh1ODNXZG9KZk9OQVJnM2tLcVdU?=
 =?utf-8?B?NmYzK3hJSHRWd1M1NjE1c1RqbXpGbjBpb0wrTDcwN0MvVG5WTWk5UFF0UmIx?=
 =?utf-8?B?NVg2R0YrTjE5ejlFRHRWT0ZhMFJCaVJNOVBRMXR1ZlcraFF0TSt5S1loK3hH?=
 =?utf-8?B?NDlEd1N3R2w2bklrLy90Z2VQQytlNkVlTW1DM09BU1pPV3RFUk5LSDI5Z252?=
 =?utf-8?B?cEhReXRCdUlyODRnbC9KOXZSd2xOVisrOFpOQmtNZk5NcElVV2gwMWRQYlVl?=
 =?utf-8?B?U2dvYWJuT2thSER6V1A1SjVRb3FmbFVMQUZCTStWTGRzMjEyYjM0VVF2Nk9u?=
 =?utf-8?B?aDhtZmdoN1NEcmlhSnNCN0ZrZXo1ZkZ6UzQyL004Q01wUHQxMnJycjBQaVhT?=
 =?utf-8?B?ZURBYTJNcFA4NW9COHAxYTU0bjhsNWVYYTNkYjNHdE9FUE0wUXAycFVGUHEv?=
 =?utf-8?B?N2l6UUw4ZmhjbXdOc202UVEzNXBxQzFwRDVaNUxOdFByQnNjb21Kd0dhaisy?=
 =?utf-8?B?UHNmNm5tOVRTcll3Q0ZUcGdoaFpLejNmbGthQkx3anJwUTc1YjZodXRtU1kz?=
 =?utf-8?B?RzRCN0NDTkVuRFN2TUZXNTExaEdwVGtKdytsemltQUNKWER6aERKUk9hbnZ0?=
 =?utf-8?B?QlFLeUcrWk1HNjZRaTRkcHB1VEgvOUlrY1lYSnh3QXNlSGN0ZXd3Sm53ZjVI?=
 =?utf-8?Q?UTzFHL+C7Zj+Xf5lLwAsHbkCe24Pxc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkZubXpvOHZ3dGRISEJHNGdiWUNKLzU4d3A3ditlSG43Y1ExOFFPT0ZoZkZz?=
 =?utf-8?B?aFVROEhtOGtrSUhXUjNnNVFIM2lvbkIzQW9DWEJ6K0daOEVxY1JTMVpOL0pH?=
 =?utf-8?B?NVdweTU2L3VYak54RWE3elJsUjdXYm56azAvMXRnSFV4bnYweTdyVTZKWWxy?=
 =?utf-8?B?VjZpS21oZEJ0dGtLTkJlS1ZwVm96RWhwbm1TS3FuMDJ2bUVlK3lOLzIrY2N6?=
 =?utf-8?B?OExNWEs3Q1pUdXdMem5nN3dWeThqWEVoQ3FIMmxlSjM4ci9GekYwWTBjaGRQ?=
 =?utf-8?B?RmI5UzErUkF3R1RFbXZkcHdzZ3RDeWR6K0FRQXRoR01TSllTUm5WdFVVeVd2?=
 =?utf-8?B?ekgzcksrQW1zV2RTcHhoNm5VeTE0TUhuYklna0pZekZRcHRqbVhNNEJkKzNs?=
 =?utf-8?B?L1NtbGJaVDVpMVZoV0ZNOHpqOWhoT08zNzVNeTM5Yk4ydGV5OVcxcTVWbThW?=
 =?utf-8?B?OWF2QjFjNWRJV0xlMXhMbmVzWk53enRkQUJ1dDFHYVZIM2R1bjdqbktIVEd2?=
 =?utf-8?B?aUtQSnNWUzBxUEVaOXdRWmpuaWdkN2xqV1NrQ3pXUXZmc1FxNzZPdW50b256?=
 =?utf-8?B?SlMxMnM2WTJCcGNPNkEyWmlSSE54VnZVTG9hb2xqbFdidXlpS2xma1hWNGxi?=
 =?utf-8?B?V1hBOVVpbkpNa2ZBbmMyc3hJOGxHYmcrbHJYWUNkWW9Ra2dyWDJicm5oTWJN?=
 =?utf-8?B?WldEZkl0SW9XVWgyaWV2TWNIWkIrTFBRMGxYaitrM1ZDLzJNekpNYWtYOXlh?=
 =?utf-8?B?WVplTS85NzNvQnh4MXFBTFFGZ01GUE1qMW5lZGd0M0ovUFlnMnBoeEZSeFkv?=
 =?utf-8?B?OUs2d1k5THY2ZmYyVThlcFJ4UDlNa0pGZFZzaldQYlM1Zk41TWJaeWpRYzhu?=
 =?utf-8?B?WlQ3V3VaUmhKcjFGeHcxemtHckxHMzM1d3FnQW94b1BlUkcvZjFTRkxUR0No?=
 =?utf-8?B?ckgrTDhPU2VhMGNsbWx3UGwwTWI3VkRGNC9tYWFhUmZuMnlIbDdYRVpvZjJ4?=
 =?utf-8?B?V1pyZjEyZ1lEaWw2NGZweHRreUE5YnRqRVFnemFuZjFteEc0d1lTbFptNTBY?=
 =?utf-8?B?WXNKampFZFpyNWxLd3pNY1JEWHF6dm1GWUNiTjRsN3I1QzdXRm8zQ2s5SHg2?=
 =?utf-8?B?SUhqTGFNbDBnV2dVN0pKdGlKcFVTMVFZeVhnUmhiZHlQYzJ5NFJpS25zekl5?=
 =?utf-8?B?V1RTUUZjK2FIcFVvR2I5NXhPVnYxSytrQ1U4cDR2NWlXWE1lVzNGcjdMOTEx?=
 =?utf-8?B?TEo0dlhSTzdmdUZiUkY4OUJQdFg3NmR0M09xNDRibFJ2YnMxNXRqQUo5Mmkr?=
 =?utf-8?B?UDRLdEVxZ1lkSm5jOTZGV3VDQ3U4SjFJOEFDcTlYZkhwTktKK1ZYekZYZzVR?=
 =?utf-8?B?dStRNUtTSU8xSmlBYk55V0NoY3g4a1M2N1lLY00zLzRMMFN4Qkh1bmV1M2Vm?=
 =?utf-8?B?VnJ2SUdXb3dVOHVlcEUrNTVXNndVRHhZWXJZUGVsVkE4WDI3QmpoNHI0QmN5?=
 =?utf-8?B?eWVEemNaMnYzanBSM2NrUDZFNU12TWZXOEFOa3pjUFArRlBaaFZPN1BRWnZ4?=
 =?utf-8?B?Sm1zRzBzL2cxSllKSWRPQVQxTTdpOVN0ZkR2aFUrUjk5RHVzMVY4d1FvNTBz?=
 =?utf-8?B?OGdoOU1RbWUwODZUOU9IVk5RSXRkN3QyelBCM0hUcFFGZG9GZWZzWi94Qm9Z?=
 =?utf-8?B?NFdvSmZSOGNTb2VFd0FONlI2ZWZIOHZ6MjY0azlUVllVeGdKVko1bU95dWhS?=
 =?utf-8?B?Y0p0UFB4UmNJeC96ODZSdlBQSkZ3S2hQd0YwL2dNMUdhaVB4WDdZUFdxUnFo?=
 =?utf-8?B?L2lGOHRYeDBMcWd6REUzZHNCNnJzRkVzcGJaWEVBWkQrSC9sQWlVNS93RHZW?=
 =?utf-8?B?b2ZhQXJIWTNHUDFBVVVDU0xRanJQdDlHdjFpRnVCNTgyVDU4RFE5SGFyMmFi?=
 =?utf-8?B?RytQTUd2V3BvOUQ2SDBVRHMyTnFjYnA3U0liMUFVNmlwNFBmSW5nM3JTWG9U?=
 =?utf-8?B?RFdVdkpKdmdWUldCQzhQR21SQ2RqVGFCMFRYdHV5Y2hQN0lnY3ViMGFNS0NS?=
 =?utf-8?B?N2hKK1F1S3pRY0I2OC9mZXZ6Um5ucWcvbXhEVVJ1dFM4ZmlVaTBTZEtnVDVZ?=
 =?utf-8?Q?QeOE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5faae58-4443-4088-926c-08ddb0281419
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:27:14.2300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGlmLkBZXLsL2eZz3V/4X8aSeegQqCO9iM7Lt+9sPgTKMiBChZ18Dpqb3Bf+l80w8mwivRLSkzGuPzbFpC4Uxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9949

On Fri, Jun 20, 2025 at 02:23:51PM +0200, Goran Rađenović wrote:
> Add initial device tree support for the Ultratronik Ultra-MACH SBC
> based on the NXP i.MX8M Plus SoC with 2GB LPDDR4.
>
> The board features:
> - 1 x USB 2.0 Host
> - 1 x USB 2.0 via USB-C
> - Debug UART + 1 x UART + 1 x USART
> - SD card and eMMC support
> - 2 x Ethernet (RJ45)
> - HDMI
>
> This initial DTS enables basic board support for booting via
> SD card or eMMC.
>
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 909 ++++++++++++++++++
>  2 files changed, 910 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0b473a23d120..e2f2500238fe 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -229,6 +229,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> new file mode 100644
> index 000000000000..3ea0c94da98b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> @@ -0,0 +1,909 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Ultratronik
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx8mp.dtsi"
> +
> +/ {
> +	model = "NXP i.MX8MPlus Ultratronik MMI_A53 board";
> +	compatible = "ultratronik,imx8mp-ultra-mach-sbc", "fsl,imx8mp";
> +
> +	aliases {
> +		ethernet0 = &fec;
> +		ethernet1 = &eqos;
> +		rtc0 = &hwrtc;
> +		rtc1 = &snvs_rtc;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	gpio-sbu-mux {
> +		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sbu_mux>;
> +		select-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +		orientation-switch;
> +
> +		port {
> +			usb3_data_ss: endpoint {
> +				remote-endpoint = <&typec_con_ss>;
> +			};
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-0 {
> +			gpios = <&gpio4 27 GPIO_ACTIVE_LOW>; /* Wakeup */
> +			label = "Wakeup";
> +			linux,code = <KEY_WAKEUP>;
> +			pinctrl-0 = <&pinctrl_gpio_key_wakeup>;
> +			pinctrl-names = "default";
> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
> +
> +		led1 {
> +			label = "red";
> +			gpios = <&gpio4 24 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led2 {
> +			label = "green";
> +			gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led3 {
> +			label = "yellow";
> +			gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	reg_usba_vbus: regulator-usba-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb-A-vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names="default";
> +		pinctrl-0 = <&pinctrl_usb1>;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VSD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_1 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_2 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_3 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&ecspi1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
> +	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	slb9670: tpm@0 {
> +		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
> +		reg = <0>;
> +		spi-max-frequency = <32000000>;
> +		status = "okay";

status should be last property.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_slb9670>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&ecspi2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>,
> +				<&gpio1 8 GPIO_ACTIVE_LOW>,
> +				<&gpio1 9 GPIO_ACTIVE_LOW>;

fix indention

> +	status = "okay";
> +
> +	nfc-transceiver@1 {
> +		compatible = "st,st95hf";
> +		reg = <1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_nfc>;
> +		spi-max-frequency = <100000>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
> +		enable-gpio = <&gpio1 6 GPIO_ACTIVE_HIGH>;
> +		status = "okay";
> +	};
> +};
> +
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0x1>;
> +			interrupt-parent = <&gpio4>;
> +			interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +	fsl,magic-packet;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy1: ethernet-phy@2 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0x2>;
> +			interrupt-parent = <&gpio4>;
> +			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +		"#TPM_IRQ", "GPIO1", "", "#PMIC_INT",
> +		"SD2_VSEL", "#TOUCH_IRQ", "#NFC_INT_I", "#NFC_INT",
> +		"#SPI2_CS2", "#SPI2_CS3", "#RTS4", "",
> +		"USB_PWR", "GPIO2", "GPIO3", "";
> +};
> +
> +&gpio2 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "#SD2_CD", "", "", "",
> +		"", "", "", "", "#USB-C_EN", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&gpio3 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "DISP_POW", "GPIO4",
> +		"#", "", "", "", "", "", "", "";
> +};
> +
> +&gpio4 {
> +	gpio-line-names =
> +		"BKL_POW", "#ETH1_INT", "#TPM_RES", "#PCAP_RES",
> +		"", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "#ETH0_INT", "#USB-C_ALERT",
> +		"#USB-C_SEL", "", "", "",
> +		"LED_RED", "LED_GREEN", "LED_YELLOW", "#WAKEUP",
> +		"", "", "", "";
> +};
> +
> +&gpio5 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "#SPI1_CS", "", "", "", "#SPI2_CS1", "", "",
> +		"", "", "", "", "ENA_KAM", "ENA_LED", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&hdmi_pvi {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	ddc-i2c-bus = <&i2c5>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hdmi>;
> +	status = "okay";
> +};
> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pmic@25 {
> +		compatible = "nxp,pca9450c";
> +		/* PMIC PCA9450 PMIC_nINT GPIO1_IO3 */

this comment should be at interrupts = <3 GPIO_ACTIVE_LOW>.
I think you can remove it, no additional information added.

Frank
> +		reg = <0x25>;
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 GPIO_ACTIVE_LOW>;
> +
> +		/*
> +		 * i.MX 8M Plus Data Sheet for Consumer Products
> +		 * 3.1.4 Operating ranges
> +		 * MIMX8ML8DVNLZAB
> +		 */
> +		regulators {
> +			buck1: BUCK1 {	/* VDD_SOC (dual-phase with BUCK3) */
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1050000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck2: BUCK2 {	/* VDD_ARM */
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-ramp-delay = <3125>;
> +				nxp,dvs-run-voltage = <950000>;
> +				nxp,dvs-standby-voltage = <850000>;
> +			};
> +
> +			buck4: BUCK4 {	/* +3V3 */
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck5: BUCK5 {	/* +1V8 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck6: BUCK6 {	/* DRAM_1V1 */
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo1: LDO1 {	/* NVCC_SNVS_1V8 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo3: LDO3 {	/* VDDA_1P8 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo4: LDO4 {	/* ENET_2V5 */
> +				regulator-min-microvolt = <2500000>;
> +				regulator-max-microvolt = <2500000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo5: LDO5 {	/* NVCC_SD2 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +		};
> +	};
> +
> +	crypto@35 {
> +		compatible = "atmel,atecc508a";
> +		reg = <0x35>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	hwrtc: rtc@32 {
> +		compatible = "epson,rx8900";
> +		reg = <0x32>;
> +		epson,vdet-disable;
> +		trickle-diode-disable;
> +	};
> +
> +	tcpc@52 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x52>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ptn5110>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 5000, 3000)>;
> +			op-sink-microwatt = <15000000>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					typec_dr_sw: endpoint {
> +						remote-endpoint = <&usb3_drd_sw>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&i2c5 {	/* HDMI EDID bus */
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c5>;
> +	pinctrl-1 = <&pinctrl_i2c5_gpio>;
> +	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&lcdif3 {
> +	status = "okay";
> +};
> +
> +&pwm1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm1>;
> +	status = "okay";
> +};
> +
> +&pwm2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm2>;
> +	status = "okay";
> +};
> +
> +&snvs_pwrkey {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	/* system console */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	/* expansion port serial connection */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart4>;
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	status = "okay";
> +
> +	port {
> +		usb3_drd_sw: endpoint {
> +			remote-endpoint = <&typec_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usb3_phy1 {
> +	vbus-supply = <&reg_usba_vbus>;
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +	snps,hsphy_interface = "utmi";
> +};
> +
> +&usdhc2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	vqmmc-supply = <&ldo5>;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	vmmc-supply = <&buck4>;
> +	vqmmc-supply = <&buck5>;
> +	bus-width = <8>;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&wdog1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_ecspi1_cs: ecspi1-cs-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x40	/* #SPI1_CS */
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK		0x82
> +			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI		0x82
> +			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO		0x82
> +		>;
> +	};
> +
> +	pinctrl_ecspi2_cs: ecspi2-cs-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x40	/* #SPI2_CS */
> +			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x40	/* #SPI2_CS2 */
> +			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09		0x40	/* #SPI2_CS3 */
> +		>;
> +	};
> +
> +	pinctrl_ecspi2: ecspi2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x82
> +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x82
> +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x82
> +		>;
> +	};
> +
> +	pinctrl_eqos: eqos-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC		0x0
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO		0x0
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0	0x90
> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1	0x90
> +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2	0x90
> +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3	0x90
> +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x90
> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0	0x16
> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1	0x16
> +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2	0x16
> +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3	0x16
> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x16
> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> +			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x10	/* #ETH0_INT */
> +		>;
> +	};
> +
> +	pinctrl_fec: fec-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC               0x0
> +			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO              0x0
> +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0         0x90
> +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1         0x90
> +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2         0x90
> +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3         0x90
> +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC          0x90
> +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL      0x90
> +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0         0x16
> +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1         0x16
> +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2         0x16
> +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3         0x16
> +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL      0x16
> +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC         0x16
> +			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01               0x10	/* #ETH1_INT */
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
> +			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
> +		>;
> +	};
> +
> +	pinctrl_gpio_key_wakeup: gpio-key-wakeup-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27		0x40	/* #WAKEUP */
> +		>;
> +	};
> +
> +	pinctrl_gpio_leds: gpio-leds-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_TXFS__GPIO4_IO24		0x40	/* LED_RED */
> +			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		0x40	/* LED_GREEN */
> +			MX8MP_IOMUXC_SAI2_TXD0__GPIO4_IO26		0x40	/* LED_YELLOW */
> +		>;
> +	};
> +
> +	pinctrl_hdmi: hdmi-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x154
> +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x154
> +		>;
> +	};
> +
> +	pinctrl_hog: hog-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01	0x40	/* GPIO1 */
> +			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13	0x40	/* GPIO2 */
> +			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14	0x40	/* GPIO3 */
> +			MX8MP_IOMUXC_SAI5_RXD2__GPIO3_IO23	0x40	/* GPIO4 */
> +			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20	0x40	/* ENA_KAM */
> +			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21	0x40	/* ENA_LED */
> +			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x40	/* #PCAP_RES */
> +			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10	0x40	/* #RTS4 */
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL			0x400001c0
> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA			0x400001c0
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14		0xc0
> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15		0xc0
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL			0x400001c0
> +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA			0x400001c0
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16		0xc0
> +			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17		0xc0
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL			0x400001c2
> +			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA			0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio: i2c3-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18		0xc2
> +			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19		0xc2
> +		>;
> +	};
> +
> +	pinctrl_i2c5: i2c5-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL		0x400000c4
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA		0x400000c4
> +		>;
> +	};
> +
> +	pinctrl_i2c5_gpio: i2c5-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26		0xc4
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27		0xc4
> +		>;
> +	};
> +
> +	pinctrl_nfc: nfc-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x40	/* NFC_INT_I */
> +			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x40	/* NFC_INT */
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmic-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x40	/* #PMIC_INT */
> +		>;
> +	};
> +
> +	pinctrl_ptn5110: ptn5110-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x1c4	/* #USB-C_ALERT */
> +		>;
> +	};
> +
> +	pinctrl_pwm1: pwm1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT		0x116
> +		>;
> +	};
> +
> +	pinctrl_pwm2: pwm2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_RXD0__PWM2_OUT		0x116	/* EXT_PWM */
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: reg-usdhc2-vmmc-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
> +		>;
> +	};
> +
> +	pinctrl_sbu_mux: sbu-mux-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20		0x16	/* #USB-C_SEL */
> +			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20			0x16	/* #USB-C_EN */
> +		>;
> +	};
> +
> +	pinctrl_slb9670: slb9670-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00		0x40	/* #TPM_IRQ */
> +			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x40	/* #TPM_RES */
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART3_RXD__UART3_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART3_TXD__UART3_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_uart4: uart4-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_usb1: usb1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12		0x40	/* USB_PWR */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0	/* SD2_VSEL */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0	/* SD2_VSEL */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0	/* SD2_VSEL */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12		0x1c4
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x190
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d0
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d0
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d0
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d0
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d0
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x190
> +			MX8MP_IOMUXC_NAND_READY_B__USDHC3_RESET_B	0x40	/* #SD3_RESET */
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x194
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d4
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d4
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d4
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d4
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d4
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x192
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d2
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d2
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d2
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d2
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d2
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x192
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdog-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B		0xc6	/* #WDOG */
> +		>;
> +	};
> +};
> --
> 2.43.0
>
