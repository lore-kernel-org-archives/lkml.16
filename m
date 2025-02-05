Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EF722AE71;
	Wed,  5 Feb 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749075; cv=fail; b=cs0PJxFFamofKgipi09HVbhHcIEJy7jqgEJPMzSY9hp9xHBsofyIaMMC34jAAaZgDSX8RlbTcDCO8rJg8rZfdP7dOtM09jFibDWwW58SSku3VuzI1GEcj4fF9IqBIqrJvFJSaggkZCFf9bvw4wbDq2K5RLI5xFBvTlRwBDZ6ruk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749075; c=relaxed/simple;
	bh=v1e5pi2PfDz446SWcQwQdj0fRAxs4FrX2UycOK5iTJM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rv+zO8xZ2fB7ONLBGc8CzUV2QvfH3UCpiPGGciInm24R6JqUVmBXIzS/6mMHsuGGo5BnS+pnDp4+RY88IP6M4rgjh3Y21Y3Dx///BbLZvLaVz02Q5maOpdzjBEtmWHUiRnkjHO0cj3+R0rCvLz7p5F/ac4XNNqrRsag+oPZJLDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SQDvZOD5; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SQDvZOD5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1Kuk8DBxxqA0Pc1ezhn/9b4Uo2lau9LdDJzB2ymmqnUccOBfosWjFjrrhahmSe/a1QJh6IY50v5GrbWjFOeA21yivWfr+eYjqjsQXE+kQOwY9xTDmtTFQd2r8Pup0+jm5F7Ex/G/yy/Wj6gkXdwdYfL3bbnBLd65qK+ytOaogwaAW1IJQpEgYZ6cr6jamhwdATmTGoBCTfA4QzjnlDZRahQTlcESKmwsz35akQZA7IZnkQ1p4V+zJMDQEC7TBRriN4NlAKMwOi53XI2+rjatrVtZynNwDFHpwoCllUQhhw8miBbo3fEM81SX3OAeQQWftI3xgh3pihkLFuT3p5K5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZ7ABMH2IHcV0+Ndy6UOvfqlEln4Y6asVXxKsblBmqw=;
 b=OsnPIjtkt5J2o04pbQZZfChz06Xf38xGeF4Rw/W2VEC0jbXF6pwP66vsQ9PlpE6QYxhmcbOdhcqvm0BoAYMgETB4DYap9gcKkk/S2PxukodYB8ON3fRhk+PXZWyxARZXZA2y7yEBy1rlAG7FhGafR2E8ANcHDQCi5EQtO9soi+QClwH9I3NOe+731XIcvaAcJSphyReVPaa64wcAhLcJdJk6BJPyyUdLZisP1+5I4CjyItQnAG1XtdKka2uQvWi5y8hMnF7QrociLRQcgje5goNSNTE0vC6OypjYUSkKj3VYc+UiE0YjM8JgeoFXqkb8aS3bS7hgthQkwrzlLXHuCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZ7ABMH2IHcV0+Ndy6UOvfqlEln4Y6asVXxKsblBmqw=;
 b=SQDvZOD5wN8PiLYToTTsvsZPY6xv6Z6rx8zww5J4heB6eCm8F1EHQ2hoiKGh+ZijET+MwHV295WQn1Ll3eWGF7i1RS5uPyFL/rO2roobNGL04BHy/z730OBMgAfBV2GqZwiLnCkv/hYUlvZQrSQItFtMoN5DkgbyD91I7tGs3yPwZWzQC8FVgXPqUZtFg+qW6f3Aj3W12Rk9VjBTswcZGYwfyG0orBvD8LzK/zhp0gpAThPGobtxShHgqo70dUAgrmM2X2wPrIAkbllC3W6vEQbcKopaNxX03GsMDOOt61fKleKdSYrLpjxI+Dow0X0v0jauxR55qIb5yigAeiADcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8244.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 09:51:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 09:51:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 17:49:54 +0800
Subject: [PATCH NOT APPLY v2 4/4] clk: scmi: Support spread spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-clk-ssc-v2-4-fa73083caa92@nxp.com>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
In-Reply-To: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738749007; l=3821;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=B9bkg4LSg3rabVuXSAhnz4jgp6FzySdE8U8t9y/s84w=;
 b=JiIpKoY3It1u1s5pTXVSdzCslISD29ZwN25JniPJkhwdy5LP8VA6afU5GELgEtJTbjycn+2mc
 pKpHAAMs+N/DcnnQHDhPTUiDjRxxKjaSmb4thjH6OWBgqGmJBPiG97u
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e3e5b2-9e26-4bf6-3609-08dd45ca9da1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTV6QzB6Skh4ZThHb3BEemo2Zk9WVm1INno3QmlDVVgrSHVWRmhqdUhYSGtU?=
 =?utf-8?B?UmZCZ3BlTzAyYy83dU5XNEQvelFQOTJzTTlnUmZhTjdKcW1LZ083eXBiNE9Z?=
 =?utf-8?B?cUowdmJBZmF6U2lRY3N3dHVjd2xWWXljSWZ0ZCtiWDMybVpkSmJHY0tnZDVD?=
 =?utf-8?B?eklFd2QveEEvcVpVRFlEOCtRQUkyZktRcVFGclM0VlI0c1Zod25ESTc0ZWps?=
 =?utf-8?B?WVNvdW0za3BQV0ZibTFhODc2eDE1MStLakJLeWE3Z0xBbzVJc21FR2Y5WXpS?=
 =?utf-8?B?WHJ2SEs0KzdHK2V5eGNodEk4b0tGNVo2MW44TGlTMWtMQjFmeXBXQXBrN280?=
 =?utf-8?B?aENPa3R3eUpNeUdhMlNuWlh2WlY0Y2U4Q3k5QkJZSUcxejZLU1hKVTlkbUlR?=
 =?utf-8?B?TFFXZG5uWWZnYzFteDAxWUFOTjJRckxzMHhZdzNKRVkxUmJsYjJtRW85WGNo?=
 =?utf-8?B?V2ZQVGw2OEhiZnFnOVFaYmZ4RE5kbUpDV201Qjlxc1lvbjBIM0E4d0I4YkZ6?=
 =?utf-8?B?QVRpVlRxby9lZnJCdjV4Zi9GSlEyQkx6TEJldHUvNTNYeE1LakxMcGZFSVZi?=
 =?utf-8?B?dklMQTBtRks1RGQ3Y3JQcFphOXhPTGJ3UURxZUtXdDA3NFU3N0ZGb2hrbXpr?=
 =?utf-8?B?VURPaGxnb1dtcEllQVF0VE9wSk8rWGYwbUMvSUx0TDg1WTB0dWJiZEsxWEF3?=
 =?utf-8?B?b24wOXR6aXZsR2lyVmxPWmE4cmlFNHM2VkNBdGdQMm93NGNSdDVCK285cGZh?=
 =?utf-8?B?aWMzR0ZNTThUYUlsbUZ1WWhHV1NSV2ZFMmFld2tFTDVYc216SW1lVU1pbnJn?=
 =?utf-8?B?dmUxRUFLUkhUemRydjFBMGtJV0c5VWpxazF6R3BZNG5SNlkvaE00eWFsRWF5?=
 =?utf-8?B?MnZRck9UYVR6WUVpNSs0ZVVKSUNkNXJTRnh6VmQyeFRLd1lNUFRDeUdCV2NM?=
 =?utf-8?B?THFYaGEzc0xiVzU4aS9nVHE0T2ExdFQxeHB6NC9Sd0xtbmlFb1F6QnZLMHU5?=
 =?utf-8?B?aUVNaHQ0ck8vcTRlYXZmcFRoQTFveVNxS0oySHVKcVczWExjaUNUd0E3VmtT?=
 =?utf-8?B?QnE2UFBxajUzaDJ1aVlReVRpSW5vWmFkekErYThxRXZkVFpxdW5RREtyeC8y?=
 =?utf-8?B?MlR2ODVlcTJpWWNzS2YvU1MvZlBHWll4Z1pjK05FYWlWUFp5ZXVOanQzQUE2?=
 =?utf-8?B?NzFrU1B0ZlZoa0M2NUlIOXFhMmJoWCt2clFmU1hmbWk1bUZIc3BibkFLVWJz?=
 =?utf-8?B?dWZSVWk2Qmw3b0p5b252dHE4VGdNTFNHN1FTTVlNd205ZDlDRzI2Qk41Rjlu?=
 =?utf-8?B?MGMvR3haYnMxZVgzdE9LMzZtY0RvRm9pS0JhNEhSbXRnZS9zbDQ2N1NyTjFN?=
 =?utf-8?B?YjhNczdwMk1kclNWd1JiVm1EbFFkc043T1B0WVIyN2lYbzg5R0xTMzcrK0dG?=
 =?utf-8?B?OXRBZ08vd1JzR1VyWkFqeGd3VWRweEFwYjlYdkY1QkNTb3J6a3p5WkJRMkRS?=
 =?utf-8?B?eEhYRmFkQ2JYVk5TVzZuUzNWSGlGdXNmQW5GQ1ZtaVRsZ2s3LzUrbmJ1Tk5u?=
 =?utf-8?B?UHdXcmdWZUFkUnFMOUVPakFKNE1MYWhKdXFzK2NFQU51WHRoY0pqUytpVVRm?=
 =?utf-8?B?ZmVrVStaZkN0Sk92YzA5bzhZL1dSOEVGMXBPMEs3TE5IcDhxbmc0T200aXli?=
 =?utf-8?B?STZPZ2hYVHA2QTVWQTRCMXVJdmoycUZDTTVYTWx0K0FEd3Rwd1UvSllrbVMr?=
 =?utf-8?B?R3pqTVJiR0oraHdNdzl3b1FMWWRIdDZKK2dCVWFpTE91eHQyQWFSbVltUWZs?=
 =?utf-8?B?UU9hV2NqTnY4UGVvdEJFT0IvMk9qL2F5dG1kLzhPNXRnWlkwUnExRDdQWnhM?=
 =?utf-8?B?dHoyUkZqUWdZM3VVWmRuTk12OGdDK2RmbytmL0JuNmZpRGV5MUhYVzZieFow?=
 =?utf-8?Q?RGgeV008dx3VJdMAVOmTtCPY7S0dTL+w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2ZtY2ZwUHkvU3dTZjBGd0VsOGdYNlhOVDdvdkltM0VLNEh4c2lJOFRiRzNI?=
 =?utf-8?B?clJWNkVXYk9pUnJHL05Dem9HamVNZkJRRGYrNnQ2aHhWTVlXWXM3WHFtRmJK?=
 =?utf-8?B?d1hQenhmYncrS1BlbDgrbERvTk1ydW9vbUFJU1pOWDMvdEp4RG5nNnhtcHJa?=
 =?utf-8?B?SkFneFQyZTNqb016OFpUVldiU1JXaFI4T1NhdDA4TE02cnpPU3RYRjhFajVG?=
 =?utf-8?B?c1R6a0xwNW1lZ051MDMzVCsyeXZmSkd6dndJbDFMMmt3TC9rcEg2UEpWcnV5?=
 =?utf-8?B?UGZoQUN0WitsT252eE5pVDEvZ1NYbkR0NU5YUzFYN21mLzFKRFVXaVhHemVh?=
 =?utf-8?B?ZS9yTlVxVjNqQkltU2dNcTFScFFLSGwxeHg4dm53TTlSdEh2OFdyWUxwYklG?=
 =?utf-8?B?UHB4UjNxSklDdzRoUWR2cisyRG1kanc3RzVQLzhPNTZHMUJCRnQyRDlDZFdv?=
 =?utf-8?B?S1ZPdVRKeDdaT1k4a3lBNzlSVEY1OThGbVNyeG14Y0hQQWREWnEvbUFFQ1NJ?=
 =?utf-8?B?WXRQY1c0MWs5ZUdVQWxrK3g3K1VSbmg5QWMvM1FleDdNS1pySFlkWDNxOTFY?=
 =?utf-8?B?Q1VUNm5OcWM5cG1jN3EwM3Q3aitxOEhqdUR1N1hwTjNvRGV2RkZ0TEpMejFB?=
 =?utf-8?B?WHVNZG1LTE84M09sRGVrL0t1QXFEcUJKK3dEMmpCcEFkcmsyR1llTTBYR1hI?=
 =?utf-8?B?OG5IWHBnSkpVOWszS2VzaE43TEJ1aWttMzZKTHBPc1dXYktXNzU1L0tpRHZz?=
 =?utf-8?B?RG1ueHR2VFRULzRrbHB3S1lFcDNCRWl1Y01BdWlzd3pTUjZIeDJERHMvUXhR?=
 =?utf-8?B?VDd5RjAvUHRQek8ySHpoRHNTNjl2UEVUeDJUcmlDa0JiQUNmS1JvM21ZMlVy?=
 =?utf-8?B?MnNmUkl3ejdBK3l1MUh4cVJNcHhtYXNrOE16YWhaaG9GMkVSczk1ZFNPMy9p?=
 =?utf-8?B?SGFQTE93MjBORmwvOHBudmt0Tkg3UWZEVUZOcUtsRFBQUmlDUXZ5Y0pteGJV?=
 =?utf-8?B?d3liSFRUd3k2ZXExV2J3NlhIZyszMXdjMUUvODQwY0E5aHlWZFcxTC9SSjRs?=
 =?utf-8?B?VmYwdVNVSWM3dmFPdFZjOEc3dnJLOGJrNVQ2dUFRZHFScEFFVDBIWUYzVG91?=
 =?utf-8?B?K0haS05RRG81aEVIb2NQTE1Ob3ZwbEt2cXUwUTFJWE5DWUc3VGczYkVETE91?=
 =?utf-8?B?c0h3c1dRMy95NTBRQzdXWjBVdjhDSUFVK1daY3dCeGFETDduZllPdWlKK2xH?=
 =?utf-8?B?TTQ5SDZVeFBFTVN6YzlUR2VjTTQvQVAzVWxpUzZQYjVhMGZ4cUFWdC81T1Ni?=
 =?utf-8?B?bkFjWmJ3SUNCMHQ2UmpCaGxIYk93c2JIdFRhbUxiNVNhcE50SGFjdy9OOGNP?=
 =?utf-8?B?K0N4cGJlSlpkeDF6N3RMaVZhYUtBMklKOTE1RWpPbzlGbEM2c0xvMU9YT0dk?=
 =?utf-8?B?QlUzSWpKVHRKY0hSYzJPMHdRZWVxMXF1UFkvTnlRSjVHd0ZleFplSGZmaHlu?=
 =?utf-8?B?UGZrdjA3RW5Mcjlad2gvbW9Uc0MvRE81S3NpUCtjbmNCNWkzNzBwS2pJb0lx?=
 =?utf-8?B?Ty8yeW9MQ2xya2dWT2lBUElEOWNrVkpKeFUrMEtjOUhFS2gzNGgrVjRCRFYr?=
 =?utf-8?B?OWh6RXo1VUs0UHVmVFZIRW9ZdjZQSWVLekozMXgzaGo3cE9iVEFTdnRvYnpL?=
 =?utf-8?B?VkVPWlFoTHc2TFhtaGdjOWhIWXRXOUliaEZVVUdTN0ZEeW5jVXhkYWZGRTRL?=
 =?utf-8?B?cEFadXMvd0NTcWdaSUtNL2l2R1lSNTRWbzcxendJM3VzWjlpaHlSUmpUZng4?=
 =?utf-8?B?UElTZytTdnErR1NPalRpbHRmNFFwZVBLQlhLN2dJVE9RU2h4VHNEZjJBTkNP?=
 =?utf-8?B?NXdadGdMa2ZvVmx0Vm5OWFRBN2R6Nit5VmozdEg5Uit4QkxmeHY5WEpOOWVh?=
 =?utf-8?B?MGRGRXl0NG45ZXN1QVFLY3RkNGU2Y0tLWk5MMG9LVmsrTUZOeDhlYjBwUklB?=
 =?utf-8?B?STBDeWZ6V3hmYkdEdDd0aXkvU1FMVGhIUm5mQTg1aU9ubURLdUEzVDFjZGUr?=
 =?utf-8?B?dm1nSWhERlA1MEJWNEdsNlJyd016dDFXUVRPVWU0SzdPcmtuSDVOMS9XZnZr?=
 =?utf-8?Q?+UO1zx6AWF0p3mhD/6fFqTEDF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e3e5b2-9e26-4bf6-3609-08dd45ca9da1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 09:51:08.7993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhqjgRQec0DdnTcoAzUiKiYIbAOtwn5+NaJHLGzNyGSeIZjO9dxgCNgEkQMfaV9nNMPYRWqp59GWD6BNTKfNFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8244

From: Peng Fan <peng.fan@nxp.com>

Support Spread Spectrum with adding scmi_clk_set_spread_spectrum

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-scmi.c        | 47 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/scmi_protocol.h |  6 ++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 15510c2ff21c0335f5cb30677343bd4ef59c0738..56b9d0166b0170807c1a83fff391033fecee2159 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -23,6 +23,7 @@ enum scmi_clk_feats {
 	SCMI_CLK_RATE_CTRL_SUPPORTED,
 	SCMI_CLK_PARENT_CTRL_SUPPORTED,
 	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
+	SCMI_CLK_SSC_SUPPORTED,
 	SCMI_CLK_FEATS_COUNT
 };
 
@@ -98,6 +99,36 @@ static int scmi_clk_set_parent(struct clk_hw *hw, u8 parent_index)
 	return scmi_proto_clk_ops->parent_set(clk->ph, clk->id, parent_index);
 }
 
+static int scmi_clk_set_spread_spectrum(struct clk_hw *hw,
+					struct clk_spread_spectrum *clk_ss)
+{
+	struct scmi_clk *clk = to_scmi_clk(hw);
+	int ret;
+	u32 val;
+
+	/*
+	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[23:8]  - Modulation Frequency (KHz)
+	 * extConfigValue[24]    - Enable/Disable
+	 * extConfigValue[31:25] - Modulation method
+	 */
+	val = FIELD_PREP(SCMI_CLOCK_EXT_SS_PERCENTAGE_MASK, clk_ss->spreaddepth);
+	val |= FIELD_PREP(SCMI_CLOCK_EXT_SS_MOD_FREQ_MASK, clk_ss->modfreq);
+	val |= FIELD_PREP(SCMI_CLOCK_EXT_SS_METHOD_MASK, clk_ss->method);
+	if (clk_ss->enable)
+		val |= SCMI_CLOCK_EXT_SS_ENABLE_MASK;
+	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
+						 SCMI_CLOCK_CFG_SSC,
+						 val, false);
+	if (ret)
+		dev_warn(clk->dev,
+			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
+			 clk_ss->modfreq, clk_ss->spreaddepth, clk_ss->method,
+			 clk->id);
+
+	return ret;
+}
+
 static u8 scmi_clk_get_parent(struct clk_hw *hw)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -316,9 +347,17 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
 	}
 
+	if (feats_key & BIT(SCMI_CLK_SSC_SUPPORTED))
+		ops->set_spread_spectrum = scmi_clk_set_spread_spectrum;
+
 	return ops;
 }
 
+static const char * const scmi_clk_imxlist[] = {
+	"fsl,imx95",
+	NULL
+};
+
 /**
  * scmi_clk_ops_select() - Select a proper set of clock operations
  * @sclk: A reference to an SCMI clock descriptor
@@ -370,8 +409,12 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	if (!ci->parent_ctrl_forbidden)
 		feats_key |= BIT(SCMI_CLK_PARENT_CTRL_SUPPORTED);
 
-	if (ci->extended_config)
-		feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+	if (ci->extended_config) {
+		if (of_machine_compatible_match(scmi_clk_imxlist))
+			feats_key |= BIT(SCMI_CLK_SSC_SUPPORTED);
+		else
+			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+	}
 
 	if (WARN_ON(feats_key >= db_size))
 		return NULL;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816247d24704f7ba109667a14226b67..a02a6d55568898ad0b5deed954e432415936dde2 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -79,10 +79,16 @@ struct scmi_protocol_handle;
 enum scmi_clock_oem_config {
 	SCMI_CLOCK_CFG_DUTY_CYCLE = 0x1,
 	SCMI_CLOCK_CFG_PHASE,
+	SCMI_CLOCK_CFG_SSC,
 	SCMI_CLOCK_CFG_OEM_START = 0x80,
 	SCMI_CLOCK_CFG_OEM_END = 0xFF,
 };
 
+#define SCMI_CLOCK_EXT_SS_PERCENTAGE_MASK	GENMASK(7, 0)
+#define SCMI_CLOCK_EXT_SS_MOD_FREQ_MASK		GENMASK(23, 8)
+#define SCMI_CLOCK_EXT_SS_ENABLE_MASK		BIT(24)
+#define SCMI_CLOCK_EXT_SS_METHOD_MASK		GENMASK(31, 25)
+
 /**
  * struct scmi_clk_proto_ops - represents the various operations provided
  *	by SCMI Clock Protocol

-- 
2.37.1

